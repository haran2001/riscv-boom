# SmallBoom RTL Generation: Setup Guide & Lessons Learned

## Overview

SmallBoom is the simplest BOOM configuration (1-wide, ROB=32). Elaborating it from Chisel to SystemVerilog produces **389 .sv files** including `BoomCore.sv`, `BoomTile.sv`, `Rob.sv`, `ICache.sv`, `BoomNonBlockingDCache.sv`, and ~20+ SRAM macro arrays.

**Output location**: `output/smallboom/`

---

## Prerequisites

```bash
brew install openjdk@17 sbt dtc
```

- **Java 17** (OpenJDK via Homebrew) — must set `JAVA_HOME` since macOS doesn't auto-link it
- **sbt** — Scala build tool
- **dtc** — Device tree compiler, required by RocketChip for DTS generation

---

## Setup Steps

### 1. Clone Chipyard (required)

BOOM cannot elaborate standalone. It depends on RocketChip `1.6-SNAPSHOT` artifacts (rocketchip, hardfloat, diplomacy, cde, macros) which are **not published to Maven**. Chipyard provides these as local submodule projects.

```bash
git clone https://github.com/ucb-bar/chipyard.git /Users/hari/Desktop/chipyard
cd /Users/hari/Desktop/chipyard
git checkout bcb61291   # latest main as of 2026-03-14
```

### 2. Initialize submodules

```bash
bash scripts/init-submodules-no-riscv-tools.sh
```

The `fpga-shells` submodule may fail to fetch — this is OK, it's not needed for Verilator/elaboration.

After init, force-update critical submodules to ensure they're at the correct commits:

```bash
git submodule update --init --recursive generators/rocket-chip tools/cde generators/diplomacy generators/hardfloat tools/dsptools tools/fixedpoint tools/firrtl2
```

**Important**: The `cde` submodule sometimes checks out without source files on disk despite the git object existing. Verify:

```bash
ls tools/cde/cde/src/chipsalliance/rocketchip/config.scala
```

If missing, re-run `git submodule update --force --init tools/cde`.

### 3. Copy BOOM into Chipyard

```bash
rm -rf generators/boom
cp -r /Users/hari/Desktop/riscv-boom generators/boom/
```

### 4. Symlink bootrom

RocketChip's `ExampleRocketSystem` looks for `./bootrom/bootrom.img` relative to the working directory:

```bash
ln -sf generators/rocket-chip/bootrom bootrom
```

### 5. Fix Scala 2.12 version conflicts

Several generator submodules have their own `build.sbt` with `scalaVersion := "2.12.10"`. SBT loads ALL projects even if you only want to build BOOM, and tries to resolve `chisel_2.12:6.7.0` which doesn't exist (Chisel 6+ only publishes for Scala 2.13).

**Fix**: Remove the `scalaVersion` line from these files:

```bash
for f in generators/icenet/build.sbt generators/cva6/build.sbt \
         generators/ibex/build.sbt generators/riscv-sodor/build.sbt; do
  sed -i '' '/^scalaVersion/d' "$f"
done
```

### 6. Empty broken generator sources

Several generators (icenet, cva6, ibex, sodor, tracegen) use old RocketChip APIs (`freechips.rocketchip.config` instead of `org.chipsalliance.cde.config`) and won't compile. Since they're not needed for BOOM, empty their source dirs:

```bash
for d in generators/icenet/src generators/cva6/src generators/ibex/src \
         generators/riscv-sodor/src generators/tracegen/src; do
  mv "$d" "${d}.bak" 2>/dev/null
  mkdir -p "$d/main/scala"
done
```

### 7. Fix BOOM for Chisel 6.5 -> 6.7 API changes

Three source files need fixes (in `generators/boom/`):

#### 7a. `src/main/scala/v4/common/tile.scala` — TraceEncoderController constructor

The `TraceEncoderController` constructor changed from 3 args to 2 (removed `tileId`):

```diff
- val trace_encoder_controller = LazyModule(new TraceEncoderController(t.encoderBaseAddr, xBytes, tileId))
+ val trace_encoder_controller = LazyModule(new TraceEncoderController(t.encoderBaseAddr, xBytes))
```

#### 7b. `src/main/scala/v4/exu/core.scala` — TraceCoreInterface.ctx removed

The `ctx` field was removed from `TraceCoreInterface` in newer RocketChip:

```diff
- io.trace_core_ingress.get.ctx := RegNext(csr.io.ptbr.asid)
  io.trace_core_ingress.get.tval := RegNext(csr.io.tval)
```

#### 7c. `src/main/scala/v4/macrogen/ElaborationHarness.scala` — circt.stage import

The wildcard `import chisel3.util._` brings in `chisel3.util.circt`, shadowing the top-level `circt` package. Add an explicit import:

```diff
  import chisel3._
  import chisel3.util._
+ import _root_.circt.stage.ChiselStage
```

And update the usage:

```diff
- (new circt.stage.ChiselStage).execute(
+ (new ChiselStage).execute(
```

Also remove the duplicate `TargetDirAnnotation` (already passed via `--target-dir` CLI flag):

```diff
  firrtl.AnnotationSeq(
    Seq(
-     chisel3.stage.ChiselGeneratorAnnotation(gen),
-     firrtl.options.TargetDirAnnotation(outputDir)
+     chisel3.stage.ChiselGeneratorAnnotation(gen)
    )
  )
```

#### 7d. `src/main/scala/v4/macrogen/ElaborationHarness.scala` — MacroGenBaseConfig

The `MacroGenBaseConfig` needs `WithCoherentBusTopology` (for `TLNetworkTopologyLocated`) and RocketChip's full `BaseConfig` (for `ExtMem`, `DTSModel`, `WithDTS`, etc.):

```diff
  class MacroGenBaseConfig extends Config(
-   new WithNBigCores(0) ++
-   new BaseSubsystemConfig()
+   new WithNBigCores(0) ++
+   new WithCoherentBusTopology ++
+   new BaseConfig()
  )
```

### 8. Run elaboration

```bash
export JAVA_HOME=/opt/homebrew/opt/openjdk@17
export PATH="/opt/homebrew/bin:$JAVA_HOME/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

cd /Users/hari/Desktop/chipyard

java -Xmx8G -Xss8m -jar scripts/sbt-launch.jar \
  -Dsbt.ivy.home=/Users/hari/Desktop/chipyard/.ivy2 \
  -Dsbt.global.base=/Users/hari/Desktop/chipyard/.sbt \
  -Dsbt.boot.directory=/Users/hari/Desktop/chipyard/.sbt/boot/ \
  "project boom" \
  "runMain boom.v4.macrogen.Elaborate \
    --config boom.v4.macrogen.SmallBoomMacroGen \
    --output-dir /Users/hari/Desktop/riscv-boom/output/smallboom"
```

**Expected output**: 389 `.sv` files in `output/smallboom/`, plus `Elaboration complete.` message.

---

## Key Tricky Issues

### Issue 1: BOOM cannot elaborate standalone

Despite having `ElaborationHarness.scala`, BOOM depends on RocketChip SNAPSHOT artifacts that aren't on Maven. You **must** use Chipyard's multi-project SBT build so that `rocketchip`, `hardfloat`, `diplomacy`, and `cde` are resolved as local source projects.

### Issue 2: CHIPYARD.hash is stale

The `CHIPYARD.hash` file in riscv-boom points to commit `4180463d` which uses Scala 2.12 / Chisel 3 — completely incompatible with this BOOM (Scala 2.13 / Chisel 6.5). Use latest Chipyard `main` instead.

### Issue 3: SBT resolves ALL projects, not just what you ask for

Even with `"project boom"`, SBT loads and resolves dependencies for every project defined in `build.sbt`. If any project has `scalaVersion := "2.12"` in its own `build.sbt`, SBT tries to fetch `chisel_2.12:6.7.0` which doesn't exist. The fix is to delete those `scalaVersion` overrides.

### Issue 4: CDE submodule checkout can silently fail

The `tools/cde` submodule may appear checked out (correct commit hash in `git submodule status`) but have no files on disk — only a `.git` pointer file and a `target/` directory. Always verify the source file exists and re-force the checkout if needed.

### Issue 5: Trace API breaking changes between RocketChip versions

RocketChip's trace infrastructure changed between versions:
- `TraceEncoderController` dropped the `tileId` constructor parameter
- `TraceCoreInterface` dropped the `ctx` field

These are silent API changes with no deprecation warnings — you only discover them at compile time.

### Issue 6: circt.stage import shadowing

`import chisel3.util._` imports `chisel3.util.circt`, which shadows the top-level `circt` package. Code that worked with Chisel 6.5 fails with Chisel 6.7 because `circt.stage.ChiselStage` resolves to `chisel3.util.circt.stage.ChiselStage` (which doesn't exist). Fix with `_root_.circt.stage.ChiselStage`.

### Issue 7: Duplicate TargetDirAnnotation

Passing `--target-dir` via CLI AND adding `TargetDirAnnotation` in code causes a FIRRTL error: "Exactly one target directory must be specified". Remove one or the other.

### Issue 8: Missing bootrom.img

`ExampleRocketSystem` reads `./bootrom/bootrom.img` relative to CWD. A symlink from Chipyard root to `generators/rocket-chip/bootrom` solves this.

---

## Output Artifacts

After successful elaboration, `output/smallboom/` contains:

| Category | Examples | Count |
|----------|----------|-------|
| BOOM pipeline modules | `BoomCore.sv`, `BoomTile.sv`, `Rob.sv`, `BoomFrontend.sv` | ~30 |
| Memory system | `BoomNonBlockingDCache.sv`, `ICache.sv`, `BoomMSHR.sv` | ~15 |
| Branch prediction | `FA2MicroBTBBranchPredictorBank.sv`, `BoomRAS.sv` | ~10 |
| SRAM arrays | `array_512x64.sv`, `dataArrayB0_512x256.sv`, `rob_compact_uop_mem_0_32x27.sv`, `tag_array_64x80.sv` | ~20 |
| Interconnect/TileLink | `TLXbar_*.sv`, `TLBuffer_*.sv` | ~50 |
| Other (arbiters, queues, etc.) | `Arbiter*.sv`, `Queue*.sv` | ~260 |
| **Total** | | **389** |

---

## Next Steps

1. **SRAM extraction**: Run `scripts/extract_srams.py` on the output to catalog SRAM macros
2. **Functional verification**: Requires Chipyard + RISC-V toolchain (`make CONFIG=SmallBoomV4Config` in `sims/verilator`)
3. **Update CHIPYARD.hash**: Change from `4180463d` to `bcb61291` to reflect the working commit
