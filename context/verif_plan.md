# Verification Strategy for BOOM PD Agent Training Configs

This document details the verification required for each of the 7 BOOM processor configurations used to train the ArchGen PD agent. Verification happens at three levels: RTL correctness, synthesis, and physical design.

---

## Overview: Verification Chain

```
┌─────────────────┐    ┌──────────────────┐    ┌──────────────────┐    ┌──────────────────┐
│ Level 1: RTL    │───→│ Level 2: Synth   │───→│ Level 3: PD      │───→│ Training Data    │
│ Correctness     │    │ Verification     │    │ Verification     │    │ Ready            │
│ (once/config)   │    │ (once/config)    │    │ (every iteration)│    │                  │
└─────────────────┘    └──────────────────┘    └──────────────────┘    └──────────────────┘
```

Levels 1 and 2 are **one-time costs per config** that produce a verified, fixed netlist. Level 3 runs on **every PD agent iteration** during RL training.

---

## Level 1: RTL Correctness Verification

### Purpose
Confirm that each BOOM configuration produces a functionally correct RISC-V processor before any physical design work begins. A buggy netlist would produce meaningless PD training data.

### 1.1 RISC-V ISA Tests (riscv-tests)

**What**: Assembly-level tests that verify every instruction in the RV64GC ISA — integer arithmetic, loads/stores, atomics, floating-point, compressed instructions, privilege modes.

**How to run** (via Chipyard):
```bash
# From chipyard/sims/verilator directory
make run-asm-tests-fast CONFIG=SmallBoomConfig    # Config 1
make run-asm-tests-fast CONFIG=MediumBoomConfig   # Config 2
make run-asm-tests-fast CONFIG=LargeBoomConfig    # Config 3
make run-asm-tests-fast CONFIG=MegaBoomConfig     # Config 4
make run-asm-tests-fast CONFIG=MegaTapeoutBoomConfig  # Config 5
make run-asm-tests-fast CONFIG=GigaBoomConfig     # Config 6
make run-asm-tests-fast CONFIG=NoFPMediumBoomConfig   # Config 7
```

**ISA test suites exercised**:
| Suite | What It Tests | Applicable Configs |
|-------|--------------|-------------------|
| `rv64ui` | Integer arithmetic, loads/stores, branches | All 7 |
| `rv64um` | Multiply/divide | All 7 |
| `rv64ua` | Atomics (LR/SC, AMO) | All 7 |
| `rv64uf` | Single-precision floating-point | 1-6 only |
| `rv64ud` | Double-precision floating-point | 1-6 only |
| `rv64uc` | Compressed instructions | All 7 |
| `rv64mi` | Machine-mode privileged instructions | All 7 |
| `rv64si` | Supervisor-mode instructions | All 7 |

**Config 7 (No-FP) exception**: Skip `rv64uf` and `rv64ud` suites. These will fail by design since there is no FPU. All other suites must pass.

**Pass criteria**: Every test exits with return code 0. Any failure indicates an RTL bug.

**Expected duration**: 10-30 minutes per config on Verilator.

### 1.2 Benchmark Tests

**What**: Higher-level programs (CoreMark, dhrystone, median, multiply, qsort, towers, vvadd) that exercise sustained multi-instruction sequences. Catches bugs that single-instruction ISA tests miss — pipeline hazards, cache interactions, branch prediction edge cases.

**How to run**:
```bash
make run-bmark-tests-fast CONFIG=<ConfigName>
```

**Pass criteria**: All benchmarks complete without assertion failures or hangs.

**Expected duration**: 15-60 minutes per config depending on complexity.

**Note**: BOOM CI runs benchmarks for all configs. For Large/Mega, only benchmarks (not ISA ASM tests) are run in CI since ASM tests are covered by the smaller configs which exercise the same ISA logic.

### 1.3 CSmith Random Program Testing

**What**: Generates random C programs using CSmith, compiles them for both x86-64 and RISC-V, and compares outputs. The RISC-V binary runs on both Spike (reference ISA simulator) and the BOOM Verilator model. A three-way comparison catches:
- Instruction-level bugs that ISA tests miss
- Complex control flow interactions
- Compiler + hardware interaction bugs

**How to run**:
```bash
cd util/csmith
./install-csmith.sh                    # One-time setup
./run-csmith.sh \
  --sim <path-to-verilator-sim> \
  --run 50 \
  --parallel 4 \
  --nodebug
```

**Flow per test**:
```
1. CSmith generates random C → test.c
2. gcc compiles for x86-64 → test.bin → run → test.host.out
3. riscv64-gcc cross-compiles → test.riscv
4. spike test.riscv → test.spike.out
5. Compare host vs spike (skip if they disagree — CSmith UB)
6. verilator-sim test.riscv → test.sim.out
7. Compare spike vs sim → PASS or FAIL
```

**On failure**: The script generates a VPD waveform dump for debugging. Any mismatch kills all parallel instances immediately.

**Recommended iterations per config**:
| Config | CSmith Runs | Rationale |
|--------|-------------|-----------|
| 1. SmallBoom | 50 | Fast simulation, quick turnaround |
| 2. MediumBoom | 50 | Moderate speed |
| 3. LargeBoom | 40 | Slower simulation |
| 4. MegaBoom | 40 | Slowest — 240min CI timeout |
| 5. MegaTapeout | 40 | Similar to Mega |
| 6. GigaBoom | 30 | Very slow, 5-wide pipeline |
| 7. Medium-NoFP | 50 | Fast (no FP → simpler) |

### 1.4 TraceGen (Memory Subsystem Stress Test)

**What**: A specialized test tile (`src/main/scala/v4/lsu/tracegen.scala`) that replaces the BOOM core with a trace generator. It injects controlled sequences of memory operations (loads, stores, LR/SC, AMOs) directly into the LSU and D-cache, verifying memory ordering correctness.

**Components**:
- `BoomTraceGenTile`: Special tile that substitutes for a full BOOM core
- `BoomLSUShim`: Bridges the trace generator interface to BOOM's LSU
- Internal ROB that tracks in-flight operations and commits them in order
- `assert(!io.lsu.lxcpt.valid)` — asserts no load exceptions occur

**What it catches**:
- Load-store ordering violations
- Cache coherence bugs
- Atomic operation (LR/SC) sequencing errors
- AMO correctness (amoadd, amoxor, amoor, amoand)
- Store-to-load forwarding bugs

**How to run** (via Chipyard):
```bash
make CONFIG=BoomTraceGenConfig run-tracegen
```

**Relevance per config**:
- Configs 1-3: Basic LSU (1-wide), exercises core memory ordering
- Config 4 (MegaBoom): 2-wide LSU + 4-bank D-cache — tests multi-bank coherence
- Config 5 (MegaTapeout): Single-ported D-cache + agen stage — tests constrained memory paths
- Config 6 (GigaBoom): 2-wide LSU — tests wide memory interface
- Config 7 (No-FP): Standard LSU, no special concerns

### 1.5 Memory Trace Analysis (Post-Simulation)

**What**: The `util/memtracer/memtracer.c` utility analyzes memory operation logs from BOOM simulations. It maintains a shadow memory model and detects loads that return incorrect values relative to the most recent store to that address.

**How to use**:
```bash
# Step 1: Build BOOM with MEMTRACE_PRINTF enabled
# (set enableMemtracePrintf = true in BoomCoreParams)

# Step 2: Run simulation, capturing stderr
./simulator-chipyard-BoomConfig test.riscv 2> trace.log

# Step 3: Analyze trace
gcc -o memtracer util/memtracer/memtracer.c
./memtracer <fromhost_addr> <tohost_addr> < trace.log
```

**What it detects**:
- Loads returning stale data (store-to-load forwarding failures)
- Memory ordering violations between loads and stores
- AMO operation correctness (add, xor, or, and, swap, LR/SC)
- Byte-level mismatch reports with timestamps for debugging

**When to use**: Only needed if ISA/CSmith tests surface memory-related failures, or when verifying new LSU-heavy configs (4, 5, 6). Not needed for routine verification.

### 1.6 Embedded RTL Assertions

**What**: 161 Chisel `assert()` statements embedded across 25 source files in the v4 RTL. These fire during any simulation (Verilator, VCS) and catch microarchitectural invariant violations.

**Distribution by subsystem**:
| Subsystem | Files | Assertions | What They Check |
|-----------|-------|------------|----------------|
| LSU | `lsu.scala`, `dcache.scala`, `mshrs.scala`, `tlb.scala` | 63 | Load/store ordering, MSHR allocation, cache coherence |
| ROB | `rob.scala` | 19 | Commit ordering, exception handling, branch resolution |
| Execution | `execution-unit.scala`, `functional-unit.scala` | 26 | Functional unit scheduling, writeback conflicts |
| Rename | `rename-stage.scala`, `rename-freelist.scala`, `rename-maptable.scala` | 12 | Register allocation, freelist consistency, map table |
| Issue | `issue-unit-*.scala`, `issue-slot.scala` | 10 | Issue slot state, wakeup logic, age ordering |
| Core | `core.scala` | 11 | Pipeline control, redirect logic |
| Frontend | `frontend.scala`, `icache.scala`, `predictor.scala` | 4 | Fetch alignment, prediction consistency |
| Register File | `regfile.scala` | 4 | Read/write port conflicts |
| Other | `fp-pipeline.scala`, `rocc.scala`, `util.scala` | 12 | FP pipeline, accelerator interface |

**How they work**: Assertions are compiled into the Verilator model. Any violation during simulation causes an immediate abort with the assertion message and source location. No action required — they trigger automatically during ISA tests, CSmith, and benchmarks.

**Config-specific considerations**:
- Configs with `enableColumnALUIssue=true` (3, 6) activate additional issue unit assertions
- Configs with `enableAgenStage=true` (5) activate LSU pipeline assertions for separated address/data generation
- Config 7 (no FP) should not trigger any FP pipeline assertions (those paths are inactive)

---

## Level 2: Synthesis Verification

### Purpose
Confirm that the RTL synthesizes cleanly to a gate-level netlist and extract the SRAM macro list that feeds into PD.

### 2.1 Synthesis Flow

**Open-source path** (Yosys):
```bash
# Generate Verilog from Chisel (via Chipyard)
make -C sims/verilator CONFIG=<ConfigName> verilog

# Synthesize with Yosys targeting a PDK
yosys -p "read_verilog <generated>.v; synth -top BoomTile; write_verilog netlist.v"
```

**Commercial path** (Synopsys Design Compiler):
```tcl
read_verilog <generated>.v
set_top BoomTile
compile_ultra
report_area
report_timing
write -format verilog -output netlist.v
```

### 2.2 Synthesis Checks

| Check | How | Failure Means |
|-------|-----|---------------|
| No synthesis errors | Review synthesis log for ERROR/FATAL | RTL has unsynthesizable constructs |
| No inferred latches | `report_latches` or grep for "latch" in log | Incomplete case/if statements — RTL bug |
| No unmapped cells | Check for GTECH/generic cells in netlist | Missing library cells |
| Gate count reasonable | `report_area` | Unexpected logic explosion |
| No combinational loops | Timing analysis detects these | RTL bug — needs fixing |

### 2.3 SRAM Macro Extraction

The critical output for your PD agent: the list of SRAM macros and their dimensions.

**What generates SRAMs in BOOM**:
| BOOM Structure | SRAM Type | Configs Most Affected |
|---------------|-----------|----------------------|
| Integer Register File | Multi-ported SRAM | 3, 4, 5, 6 (large regfiles, banked) |
| FP Register File | Multi-ported SRAM | 3, 4, 5, 6 (not Config 7) |
| D-Cache Data Arrays | Banked SRAM | 4, 5 (4 banks), 6 (1 bank but 8-way) |
| D-Cache Tag Array | SRAM | All (scales with nSets x nWays) |
| I-Cache Data/Tag | SRAM | 3, 4, 5, 6 (128-bit rows, 8-way) |
| TAGE Tables | SRAM (6 tables in FastTAGE) | 5 (MegaTapeout uses FastTAGE) |
| BIM Tables | SRAM | 5 (2048-entry BIM) |
| BTB | SRAM | All |
| ROB Storage | SRAM | 4, 5, 6 (128-130 entries) |
| Load/Store Queues | CAM/SRAM hybrid | 4, 5, 6 (32 entries) |
| Issue Queue Entries | SRAM | 3, 4, 5, 6 (16-40 entries) |
| FTQ | SRAM | 4, 5, 6 (40 entries) |

**Expected macro counts** (approximate — depends on PDK and SRAM mapping):
| Config | Expected Macros | Dominant Macro Source |
|--------|----------------|---------------------|
| 1. SmallBoom | ~20-30 | Small D$/I$ + regfiles |
| 2. MediumBoom | ~50-70 | Moderate regfiles + caches |
| 3. LargeBoom | ~80-120 | Large regfiles + 8-way caches |
| 4. MegaBoom | ~130-180 | 4-bank D$ + 144-entry int RF + large IQs |
| 5. MegaTapeout | ~140-200 | Above + 6 TAGE tables + 2048 BIM + SlowBTB |
| 6. GigaBoom | ~120-160 | Wide regfiles + 5-column ALU IQ |
| 7. Medium-NoFP | ~30-40 | Config 2 minus FP regfile + FP IQ |

### 2.4 Synthesis Timing Estimation

Run a pre-PD timing analysis to establish target frequency ranges:

| Config | Relaxed Target | Moderate Target | Aggressive Target |
|--------|---------------|----------------|------------------|
| 1. SmallBoom | 500 MHz | 750 MHz | 1.0 GHz |
| 2. MediumBoom | 400 MHz | 600 MHz | 800 MHz |
| 3. LargeBoom | 350 MHz | 500 MHz | 700 MHz |
| 4. MegaBoom | 300 MHz | 450 MHz | 600 MHz |
| 5. MegaTapeout | 300 MHz | 450 MHz | 600 MHz |
| 6. GigaBoom | 250 MHz | 400 MHz | 550 MHz |
| 7. Medium-NoFP | 450 MHz | 650 MHz | 850 MHz |

*Note: Actual achievable frequencies depend heavily on PDK and process node. These are relative targets for nangate45.*

---

## Level 3: Physical Design Verification

### Purpose
Validate each PD agent placement/routing iteration. This runs on **every RL training iteration** and provides the reward signal.

### 3.1 Timing Verification

| Metric | OpenROAD Command | Pass Criteria | What Failure Means |
|--------|-----------------|---------------|-------------------|
| Worst Negative Slack (WNS) | `report_checks -path_delay max` | WNS >= 0 ns | Critical path too long — placement/routing suboptimal |
| Total Negative Slack (TNS) | `report_checks -path_delay max` | TNS >= 0 ns | Widespread timing issues — not just one path |
| Worst Hold Slack | `report_checks -path_delay min` | >= 0 ns | Signals arriving too fast — insert buffers |
| Setup slack distribution | `report_checks -group_count 100` | No cluster of near-violations | Fragile timing — small changes will break it |

**Config-specific timing concerns**:
- **Config 3 (LargeBoom)**: Column ALU feedback paths are timing-critical. Watch for long paths from ALU writeback -> issue queue wakeup -> ALU read.
- **Config 4 (MegaBoom)**: 4-bank D-cache creates long wires between cache banks and LSU. Cross-bank timing is the bottleneck.
- **Config 5 (MegaTapeout)**: Single-ported SRAMs add muxing delay. Cache access timing is tighter than dual-ported Config 4.
- **Config 6 (GigaBoom)**: 5-wide crossbars in rename, dispatch, and commit are the timing bottleneck. These are high-fanout nets.

### 3.2 Design Rule Check (DRC)

| Check | What It Catches | Pass Criteria |
|-------|----------------|---------------|
| Metal spacing | Shorts between wires | 0 violations |
| Metal width | Wires too narrow for current density | 0 violations |
| Via rules | Via enclosure, minimum area | 0 violations |
| Density rules | Metal density too high/low in regions | Within bounds |
| Antenna rules | Gate oxide damage during manufacturing | 0 violations |

**Config-specific DRC concerns**:
- **Configs 4, 5, 6**: Dense macro placement makes meeting metal density rules harder in macro-adjacent regions.
- **Config 6**: High routing congestion from 5-wide crossbars increases via density violations.

### 3.3 Congestion Analysis

| Metric | How to Measure | Concern Threshold |
|--------|---------------|-------------------|
| Global routing overflow | `global_route` overflow report | Any overflow > 0 |
| GCell congestion | Congestion heatmap | Hotspots > 80% utilization |
| Layer-specific congestion | Per-metal-layer utilization | Any layer > 85% |

**Config-specific congestion profiles**:
| Config | Expected Congestion Pattern |
|--------|---------------------------|
| 1. SmallBoom | Uniform, no hotspots |
| 2. MediumBoom | Mild congestion near regfile-to-ALU paths |
| 3. LargeBoom | Hotspot at ALU column feedback network |
| 4. MegaBoom | Congestion around 4-bank D-cache macro cluster |
| 5. MegaTapeout | Dual hotspots: frontend TAGE/BIM cluster + backend cache cluster |
| 6. GigaBoom | **Worst congestion** — 5-wide crossbar creates widespread routing pressure |
| 7. Medium-NoFP | Minimal congestion — sparse design |

### 3.4 Power Analysis

| Metric | OpenROAD Command | What to Track |
|--------|-----------------|---------------|
| Total power | `report_power` | Absolute value (mW) |
| Dynamic power | `report_power` | Switching activity component |
| Leakage power | `report_power` | Static component |
| Power density | Per-region power map | Thermal hotspots |

### 3.5 Area and Utilization

| Metric | What to Check |
|--------|--------------|
| Core area | Total die area consumed |
| Standard cell utilization | Target 60-75% for routability |
| Macro utilization | % of area consumed by SRAMs |
| Whitespace distribution | Even vs. clustered — affects routing quality |

**Config-specific area notes**:
- **Config 4**: ~60% macro utilization expected — limited room for standard cells
- **Config 5**: Similar to Config 4 but larger D-cache (128 sets vs 64) increases macro area
- **Config 7**: ~30% macro utilization — agent should learn to use the freed FP area

---

## Per-Config Verification Checklist

### Config 1: SmallBoom
- [ ] ISA tests pass (all rv64 suites)
- [ ] 50 CSmith runs pass
- [ ] Benchmark tests pass
- [ ] Synthesis: ~20-30 macros, no latches
- [ ] PD: timing closure achievable at moderate target

### Config 2: MediumBoom
- [ ] ISA tests pass (all rv64 suites)
- [ ] 50 CSmith runs pass
- [ ] Benchmark tests pass
- [ ] Synthesis: ~50-70 macros, banked int regfile (2 banks) visible
- [ ] PD: balanced congestion profile

### Config 3: LargeBoom
- [ ] ISA tests pass (all rv64 suites)
- [ ] 40 CSmith runs pass
- [ ] Benchmark tests pass
- [ ] Synthesis: ~80-120 macros, columnALU paths present
- [ ] PD: verify ALU feedback timing paths close

### Config 4: MegaBoom
- [ ] ISA tests pass (all rv64 suites)
- [ ] 40 CSmith runs pass
- [ ] Benchmark tests pass
- [ ] TraceGen pass (2-wide LSU + 4-bank D-cache)
- [ ] Synthesis: ~130-180 macros, 4 D-cache bank SRAMs visible
- [ ] PD: verify D-cache bank placement doesn't create routing bottleneck

### Config 5: MegaTapeoutBoom
- [ ] ISA tests pass (all rv64 suites)
- [ ] 40 CSmith runs pass
- [ ] Benchmark tests pass
- [ ] TraceGen pass (single-ported D-cache)
- [ ] Synthesis: ~140-200 macros, 6 TAGE table SRAMs + SlowBTB + 2048-set BIM visible
- [ ] PD: verify frontend macro cluster (TAGE/BIM/BTB) doesn't strangle routing to backend

### Config 6: GigaBoom
- [ ] ISA tests pass (all rv64 suites)
- [ ] 30 CSmith runs pass
- [ ] Benchmark tests pass
- [ ] Synthesis: ~120-160 macros, 5-wide ALU column IQ visible
- [ ] PD: verify routing congestion is manageable (this is the hardest config for routing)

### Config 7: MediumBoom-NoFP
- [ ] ISA tests pass (rv64ui, rv64um, rv64ua, rv64uc, rv64mi, rv64si only — **skip rv64uf, rv64ud**)
- [ ] 50 CSmith runs pass (compile without -lm, avoid FP programs)
- [ ] Benchmark tests pass (integer-only benchmarks)
- [ ] Synthesis: ~30-40 macros, no FP regfile or FMA units
- [ ] PD: verify asymmetric macro topology is handled correctly

---

## Automation Recommendations

### CI Script Integration
BOOM's existing CI (`.circleci/config.yml`) already automates configs 1-4. Extend it:

```yaml
# Add to .circleci/defaults.sh mapping:
mapping["megatapeoutboom"]="CONFIG=MegaTapeoutBoomConfig"
mapping["gigaboom"]="CONFIG=GigaBoomConfig"
mapping["nofpmediumboom"]="CONFIG=NoFPMediumBoomConfig"
```

### Verification Order (Fastest First)
```
Config 7 (NoFP-Medium) -> Config 1 (Small) -> Config 2 (Medium)
-> Config 3 (Large) -> Config 6 (Giga) -> Config 4 (Mega) -> Config 5 (MegaTapeout)
```

### Time Estimates (Verilator on 8-core machine)
| Config | RTL Build | ISA Tests | CSmith (50) | Total Level 1 |
|--------|-----------|-----------|-------------|---------------|
| 1. Small | ~30 min | ~15 min | ~30 min | ~1.5 hrs |
| 2. Medium | ~45 min | ~20 min | ~45 min | ~2 hrs |
| 3. Large | ~60 min | ~25 min | ~60 min | ~2.5 hrs |
| 4. Mega | ~120 min | ~30 min | ~90 min | ~4 hrs |
| 5. MegaTapeout | ~120 min | ~30 min | ~90 min | ~4 hrs |
| 6. Giga | ~90 min | ~30 min | ~90 min | ~3.5 hrs |
| 7. NoFP-Medium | ~40 min | ~15 min | ~30 min | ~1.5 hrs |
| **Total** | | | | **~19 hrs** |
