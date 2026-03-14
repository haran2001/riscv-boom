# Plan: SmallBoom RTL Generation + Verification

## Context
Build and verify the SmallBoom configuration — the simplest BOOM core (1-wide, ROB=32). This validates that the riscv-boom codebase compiles, elaborates to Verilog, and passes functional verification.

**Important**: BOOM depends on RocketChip `1.6-SNAPSHOT` artifacts (rocketchip, hardfloat, diplomacy, cde, macros) which are NOT published to Maven/Sonatype. They are only available through Chipyard's local build. The standalone `ElaborationHarness.scala` exists but requires these deps in the local Maven cache first. Therefore, **all steps require Chipyard**.

---

## Step 1: Setup Chipyard + Elaborate SmallBoom to Verilog

### 1.1 Setup Chipyard
```bash
git clone https://github.com/ucb-bar/chipyard.git
cd chipyard
git checkout $(cat /Users/hari/Desktop/riscv-boom/CHIPYARD.hash)
./scripts/init-submodules-no-riscv-tools.sh
rm -rf generators/boom && cp -r /Users/hari/Desktop/riscv-boom generators/boom/
./scripts/build-toolchains.sh riscv-tools && source env.sh
```

### 1.2 Generate Verilog
```bash
cd sims/verilator
make CONFIG=SmallBoomConfig verilog
```
**Pass criteria**: Produces `.sv` files + `.anno.json` in `generated-src/`.

### 1.3 Extract SRAMs to validate elaboration
```bash
python3 /Users/hari/Desktop/riscv-boom/scripts/extract_srams.py \
  --input-dir generated-src/chipyard.harness.TestHarness.SmallBoomConfig \
  --output /Users/hari/Desktop/riscv-boom/output/smallboom/srams.csv \
  --json-output /Users/hari/Desktop/riscv-boom/output/smallboom/srams.json
```
**Pass criteria**: ~20-30 SRAMs (ICache, DCache, FTQ, ROB, BPD tables).

---

## Step 2: Functional Verification

### 2.1 Build simulator + run tests
```bash
cd sims/verilator
make CONFIG=SmallBoomConfig                          # Build Verilator sim
make -j8 run-asm-tests-fast CONFIG=SmallBoomConfig   # ISA tests
make -j8 run-bmark-tests-fast CONFIG=SmallBoomConfig # Benchmarks
```

### 2.2 CSmith random testing
```bash
cd /Users/hari/Desktop/riscv-boom/util/csmith
./install-csmith.sh
./run-csmith.sh --sim <chipyard>/sims/verilator/simulator-chipyard.harness-SmallBoomConfig \
  --run 50 --parallel 4 --nodebug
```

**Pass criteria**: All tests exit 0.

---

## Key Files

| File | Purpose |
|------|---------|
| `src/main/scala/v4/common/config-mixins.scala:96` | `WithNSmallBooms` — SmallBoom parameters |
| `src/main/scala/v4/exu/core.scala` | `BoomCore` — top-level pipeline module |
| `src/main/scala/v4/common/parameters.scala` | `BoomCoreParams` — all configurable params |
| `src/main/scala/v4/macrogen/ElaborationHarness.scala` | Standalone elaboration (needs local deps) |
| `scripts/extract_srams.py` | SRAM extraction from Verilog/annotations |
| `util/csmith/run-csmith.sh` | Random testing |

## Risks
1. Chipyard hash `4180463d` may be stale — may need a newer compatible commit
2. macOS: Verilator + CSmith may need Homebrew workarounds (`brew install verilator coreutils`)
3. Build time: Chipyard init + toolchain build can take 1-2 hours first time
