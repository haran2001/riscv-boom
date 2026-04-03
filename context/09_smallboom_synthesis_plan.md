# SmallBoom Synthesis & Verification Plan: Yosys + OpenROAD (Sky130)

## Context

SmallBoom RTL verification is **complete** — 106/107 ISA tests pass, 11/11 benchmarks pass. The next step is ASIC synthesis using the open-source Yosys + OpenROAD flow targeting Sky130 PDK.

### Prerequisites (Completed)
- **RTL verification**: 106/107 ISA tests pass (only `rv64ui-p-ma_data` fails — expected for misaligned data config)
- **Benchmark verification**: 11/11 scalar benchmarks pass (rebuilt with `-march=rv64gc`, no V extension)
- **SRAM extraction**: 42 SRAMs catalogued in `output/smallboom/srams.csv`
- **Documentation**: Full build/debug steps in `context/smallboom_run2.md`

### What We Have
| Component | Path | Status |
|-----------|------|--------|
| SmallBoom RTL | `/Users/hari/Desktop/riscv-boom/output/smallboom/` | 389 .sv files, ~235K lines |
| Top module | `ExampleRocketSystem` | AXI4 mem + MMIO + debug DMI |
| 42 SRAMs | behavioral `reg` arrays | specs in `.top.mems.conf` |
| Yosys | `/opt/homebrew/bin/yosys` v0.60 | Installed |
| OpenROAD source | `/Users/hari/Desktop/OpenROAD/` | CMake build started, binary not built |
| OpenROAD-flow-scripts | `/Users/hari/Desktop/OpenROAD-flow-scripts/` | Has ibex sky130hd reference |
| Sky130 PDK | `/Users/hari/pdk/sky130A/` (via volare) | Installed |
| Sky130 SRAM macros | `/Users/hari/pdk/sky130A/libs.ref/sky130_sram_macros/` | Only 3-4 fixed sizes (32x256, 8x1024, 32x512) |
| Chipyard VLSI configs | `/Users/hari/Desktop/chipyard/vlsi/example-sky130.yml` | Hammer-based reference |
| SRAM specs (Chipyard) | `chipyard/.../SmallBoomV4Config.top.mems.conf` | 20 unique SRAM configs |

### Approach: OpenROAD-flow-scripts (ORFS)

Use ORFS directly (not Chipyard's Hammer flow). ORFS is simpler, proven with ibex (another RISC-V core on sky130hd), and gives us direct control. The ibex design at `flow/designs/sky130hd/ibex/` serves as our template.

---

## Step 1: Build OpenROAD

OpenROAD source is at `/Users/hari/Desktop/OpenROAD/` with a CMake build already started.

```bash
cd /Users/hari/Desktop/OpenROAD
mkdir -p build && cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j$(sysctl -n hw.ncpu)
```

Then symlink so ORFS can find it:
```bash
mkdir -p /Users/hari/Desktop/OpenROAD-flow-scripts/tools/install/openroad/bin
ln -sf /Users/hari/Desktop/OpenROAD/build/src/openroad \
  /Users/hari/Desktop/OpenROAD-flow-scripts/tools/install/openroad/bin/openroad
```

**Pass criteria**: `openroad -version` works.

---

## Step 2: Prepare SmallBoom RTL for Synthesis

### 2.1 Strip simulation-only modules

Remove or stub modules not needed for synthesis:
- **TLMonitor_*.sv** (37 files) — TileLink protocol assertion checkers, no synthesis logic
- **plusarg_reader.v** — `$value$plusargs` is simulation-only; stub to return constant 0
- `RANDOMIZE`/`INIT_RANDOM` blocks are already guarded by `` `ifndef SYNTHESIS ``

Create a filtered file list:
```bash
cd /Users/hari/Desktop/riscv-boom/output/smallboom
grep -v 'TLMonitor' filelist.f | grep -v 'plusarg_reader' > synth_filelist.f
```

Create a stub for `plusarg_reader`:
```verilog
module plusarg_reader #(parameter FORMAT="", DEFAULT=0, WIDTH=32) (
  output [WIDTH-1:0] out
);
  assign out = DEFAULT[WIDTH-1:0];
endmodule
```

### 2.2 SRAM Strategy

**Problem**: Sky130 only has 3-4 pre-built SRAM macros (32x256, 8x1024, 32x512). SmallBoom needs 20 distinct SRAM configurations.

**SRAM specs from `.top.mems.conf`** (20 unique memories from Chipyard elaboration):

| Name | Depth | Width | Ports | Mask Gran | Notes |
|------|-------|-------|-------|-----------|-------|
| cc_dir_ext | 1024 | 136 | mrw | 17 | Coherence directory |
| cc_banks_0_ext | 16384 | 64 | rw | — | L2 cache bank (128KB!) |
| tag_array_ext | 64 | 88 | mrw | 22 | DCache tag |
| array_0_0_0_ext | 512 | 64 | write,read | — | DCache data |
| tag_array_0_ext | 64 | 80 | mrw | 20 | ICache tag |
| dataArrayB0_ext | 512 | 256 | mrw | 64 | DCache data array |
| tage_u_{2,8}_ext | 128/256 | 8 | mwrite,read | 1 | TAGE useful counters |
| tage_table_{2,8,32}_ext | 128-256 | 44-52 | mwrite,read | 11-13 | TAGE predictor tables |
| btb_meta_way_0_ext | 128 | 124 | mwrite,read | 31 | BTB metadata |
| btb_data_way_0_ext | 128 | 56 | mwrite,read | 14 | BTB data |
| btb_ebtb_ext | 128 | 40 | write,read | — | Extended BTB |
| bim_col_0_ext | 256 | 8 | mrw | 2 | BIM predictor |
| meta_0_ext | 16 | 120 | write,read | — | FTQ metadata |
| ghist_0_ext | 16 | 72 | write,read | — | Global history |
| rob_compact_uop_mem_0_ext | 32 | 27 | write,read | — | ROB micro-op storage |
| l2_tlb_ram_0_ext | 512 | 45 | rw | — | L2 TLB |
| mem_ext | 8192 | 64 | mrw | 8 | Boot ROM / scratchpad |

**Tiered approach**:

| Category | Count | Approach |
|----------|-------|----------|
| Tiny (depth ≤ 32, width ≤ 128) | ~5 | Synthesize to flip-flops |
| Small (depth ≤ 256, width ≤ 128) | ~10 | Synthesize to flip-flops |
| Medium (512x45 to 512x256) | ~4 | Map to SRAM macros or synthesize |
| Large (1024x136, 8192x64, 16384x64) | ~3 | **Must** use SRAM macros |

**Initial strategy**: Synthesize ALL SRAMs to flip-flops for the first run. This gives a functional netlist and baseline area/timing. Add SRAM macros in iteration 2.

### 2.3 Create ORFS design directory

```
OpenROAD-flow-scripts/flow/designs/sky130hd/smallboom/
├── config.mk          # Design configuration
├── constraint.sdc     # Clock + I/O timing constraints
├── fastroute.tcl      # Global routing config
└── src/               # Symlink or copy of SmallBoom RTL
```

### 2.4 config.mk

Based on ibex template (`flow/designs/sky130hd/ibex/config.mk`), adapted for SmallBoom:

```makefile
export DESIGN_NICKNAME = smallboom
export DESIGN_NAME = ExampleRocketSystem
export PLATFORM    = sky130hd

export VERILOG_FILES = $(sort $(wildcard $(DESIGN_HOME)/src/smallboom_sv/*.sv)) \
    $(DESIGN_HOME)/src/smallboom_sv/plusarg_reader_stub.v

export SYNTH_HDL_FRONTEND = slang

export SDC_FILE = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

# SmallBoom is much larger than ibex — lower utilization target
export CORE_UTILIZATION = 30
export PLACE_DENSITY_LB_ADDON = 0.20
export TNS_END_PERCENT = 100

export FASTROUTE_TCL = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/fastroute.tcl

export REMOVE_ABC_BUFFERS = 1
export CTS_CLUSTER_SIZE = 30
export CTS_CLUSTER_DIAMETER = 100

# Hierarchical synthesis helps with large designs
export OPENROAD_HIERARCHICAL = 1

# Die area — SmallBoom is ~10-20x larger than ibex
# Start with a large die, refine after first run
export DIE_AREA    = 0 0 6000 6000
export CORE_AREA   = 50 50 5950 5950
```

### 2.5 constraint.sdc

Conservative 50 MHz target for first synthesis (20ns period):

```sdc
current_design ExampleRocketSystem

set clk_name core_clock
set clk_port_name io_aggregator_0_clock
set clk_period 20.0
set clk_io_pct 0.2

set clk_port [get_ports $clk_port_name]
create_clock -name $clk_name -period $clk_period $clk_port

# Debug clock domain (slower)
create_clock -name debug_clock -period 40.0 [get_ports debug_clock]

set non_clock_inputs [all_inputs -no_clocks]
set_input_delay  [expr $clk_period * $clk_io_pct] -clock $clk_name $non_clock_inputs
set_output_delay [expr $clk_period * $clk_io_pct] -clock $clk_name [all_outputs]
```

### 2.6 fastroute.tcl

```tcl
set_global_routing_layer_adjustment $::env(MIN_ROUTING_LAYER)-$::env(MAX_ROUTING_LAYER) 0.2
set_routing_layers -clock $::env(MIN_CLK_ROUTING_LAYER)-$::env(MAX_ROUTING_LAYER)
set_routing_layers -signal $::env(MIN_ROUTING_LAYER)-$::env(MAX_ROUTING_LAYER)
```

---

## Step 3: Run Yosys Synthesis

```bash
cd /Users/hari/Desktop/OpenROAD-flow-scripts/flow
make DESIGN_CONFIG=designs/sky130hd/smallboom/config.mk synth
```

This runs Yosys to:
1. Read all SystemVerilog via slang frontend
2. Elaborate `ExampleRocketSystem` as top
3. Map to Sky130 standard cell library (`sky130_fd_sc_hd`)
4. Output gate-level netlist

**Expected issues**:
- Yosys may struggle with 235K lines + 389 files — may need to increase memory limits
- Some SystemVerilog constructs from CIRCT firtool may need Yosys workarounds
- The `` `define SYNTHESIS `` should suppress all simulation-only blocks

**Pass criteria**: Yosys produces `results/sky130hd/smallboom/1_synth.v` without errors.

---

## Step 4: Run OpenROAD Place & Route

```bash
cd /Users/hari/Desktop/OpenROAD-flow-scripts/flow
make DESIGN_CONFIG=designs/sky130hd/smallboom/config.mk
```

Full flow: floorplan → global placement → detailed placement → CTS → global routing → detailed routing → finishing.

For the first run, the goal is completion + area/timing estimates. Die size and utilization will need iteration.

**Pass criteria**: Flow completes. Check `reports/sky130hd/smallboom/` for:
- Area report
- Timing report (setup/hold slack)
- Power estimate
- DRC violation count

---

## Step 5: Analyze Results & Iterate

After the first run:
1. **Timing**: Does it meet 50 MHz? If not, increase period or identify critical paths
2. **Area**: How large is the die? Are synthesized SRAMs dominating? (expected: yes)
3. **DRC**: How many violations? Are they routing congestion issues?
4. **Next iteration**: Add SRAM macros for large memories (dataArrayB0_512x256, cc_banks_0_16384x64, etc.)

---

## Key Reference Files

| Purpose | Path |
|---------|------|
| SmallBoom RTL (389 files) | `/Users/hari/Desktop/riscv-boom/output/smallboom/` |
| RTL file list | `/Users/hari/Desktop/riscv-boom/output/smallboom/filelist.f` |
| SRAM extraction results | `/Users/hari/Desktop/riscv-boom/output/smallboom/srams.csv` |
| Chipyard SRAM specs | `chipyard/.../SmallBoomV4Config.top.mems.conf` |
| ORFS root | `/Users/hari/Desktop/OpenROAD-flow-scripts/flow/` |
| ibex reference design | `ORFS/flow/designs/sky130hd/ibex/` |
| ibex config.mk (template) | `ORFS/flow/designs/sky130hd/ibex/config.mk` |
| ibex constraint.sdc (template) | `ORFS/flow/designs/sky130hd/ibex/constraint.sdc` |
| Sky130 PDK | `/Users/hari/pdk/sky130A/` |
| Sky130 SRAM macros (LEF/LIB) | `/Users/hari/pdk/sky130A/libs.ref/sky130_sram_macros/` |
| Chipyard VLSI example | `/Users/hari/Desktop/chipyard/vlsi/example-sky130.yml` |
| OpenROAD source | `/Users/hari/Desktop/OpenROAD/` |

---

## Execution Order

| Step | Task | Blocking? |
|------|------|-----------|
| 1 | Build OpenROAD from source | Yes |
| 2.1 | Strip TLMonitors, create plusarg stub | Yes |
| 2.3-2.6 | Create ORFS design directory + configs | Yes |
| 3 | Run Yosys synthesis | Yes |
| 4 | Run OpenROAD PnR | Yes (needs synth) |
| 5 | Analyze results, plan iteration 2 | No |

---

## Key Risks

1. **OpenROAD build on macOS ARM64**: May have build issues on Apple Silicon. Fallback: Docker container or build via Rosetta 2.
2. **Yosys + 235K lines of SV**: May be slow or hit memory limits. Fallback: hierarchical synthesis, split sub-modules, or use `read_verilog -sv` instead of slang frontend.
3. **All-FF SRAMs blow up area**: The 16KB L1 DCache (`dataArrayB0_512x256`) as flip-flops = ~131K FFs. The 128KB L2 bank (`cc_banks_0_16384x64`) would be ~1M FFs. This WILL make the design unreasonably large. Solution: add SRAM macros in iteration 2, or exclude `cc_banks_0` from the initial run.
4. **Clock domain crossings**: SmallBoom has 6+ clock aggregator domains + debug clock. The SDC needs proper multi-clock constraints or we'll see false timing violations.
5. **SystemVerilog compatibility**: CIRCT-generated SV may use constructs Yosys/slang doesn't fully support. May need syntax workarounds.
6. **Sky130 SRAM macro size mismatch**: Available macros (32x256, 8x1024, 32x512) don't match SmallBoom's SRAM dimensions. Will need OpenRAM or SRAM22 to generate custom macros for iteration 2.

---

## SmallBoom Design Summary (for synthesis reference)

### Module Hierarchy
```
ExampleRocketSystem (top)
├── BoomTile
│   ├── BoomCore (1-wide OoO pipeline)
│   │   ├── BoomFrontend (IFU + branch prediction)
│   │   │   ├── ICache
│   │   │   ├── BranchPredictor (TAGE + BTB + BIM + Loop + uBTB)
│   │   │   ├── FetchBuffer
│   │   │   └── FetchTargetQueue
│   │   ├── DecodeUnit
│   │   ├── RenameStage (x2: int + fp)
│   │   ├── IssueUnitCollapsing (x4: ALU, MEM, FP, UNQ)
│   │   ├── ALUExeUnit, UniqueExeUnit, MemExeUnit (x2), FPExeUnit
│   │   ├── BankedRF (x2: int 52x64, fp 48x65)
│   │   ├── Rob (32 entries)
│   │   ├── FpPipeline
│   │   └── CSRFile
│   ├── BoomNonBlockingDCache
│   │   ├── BoomMSHRFile
│   │   ├── BoomDuplicatedDataArray
│   │   └── L1MetadataArray
│   ├── LSU (Load/Store Unit)
│   ├── NBDTLB
│   └── PTW (Page Table Walker)
├── CoherenceManagerWrapper (TLBroadcast)
├── SystemBus, PeripheryBus, MemoryBus
├── CLINT, TLPLIC (timer + interrupt controller)
├── TLDebugModule (JTAG debug)
└── bootromClockSinkDomain
```

### SmallBoom Configuration
- **Decode width**: 1 (single-issue)
- **ROB size**: 32 entries
- **ISA**: RV64GCB (integer, multiply, atomic, FP single/double, compressed, bit-manipulation)
- **L1 ICache**: 64 sets, 4 ways (inferred from tag_array dimensions)
- **L1 DCache**: Non-blocking, 512-entry data array
- **Branch prediction**: Composed (TAGE + BTB + BIM + Loop + uBTB)
- **Pipeline**: 14+ stages (IF0→IF4→DEC→REN→DIS→ISS→RRD→EXE→MEM→SXT→WB→COM)

### External Interfaces
- **AXI4 memory** (`mem_axi4_0`): 32-bit addr, 64-bit data, 4-bit ID
- **AXI4 MMIO** (`mmio_axi4_0`): 31-bit addr, 64-bit data, 4-bit ID
- **Debug**: DMI (Debug Module Interface) with async clock crossing
- **Clocks**: 6 aggregator clock domains + debug clock
