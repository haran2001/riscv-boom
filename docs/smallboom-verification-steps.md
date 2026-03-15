# SmallBoom RTL Correctness Verification - Build Log

This document records all steps taken to verify the SmallBoom (1-wide OoO RISC-V) design generated from BOOM v4, including caveats and workarounds discovered along the way.

## Environment

- **Host**: macOS (Apple Silicon / ARM64), Darwin 24.6.0
- **Chipyard**: `/Users/hari/Desktop/chipyard` (commit `bcb61291`)
- **BOOM**: copied into `generators/boom/` with Chisel 6.5→6.7 fixes
- **Verilator**: `/opt/homebrew/bin/verilator` v5.036
- **Java**: OpenJDK 17 (`/opt/homebrew/opt/openjdk@17`)
- **Scala**: 2.13.16, Chisel 6.7.0

---

## Step 1: Build RISC-V Toolchain

### 1.1 Cross-Compiler (riscv64-unknown-elf-gcc)

**What worked**: Used the `riscv-software-src/riscv` Homebrew tap which provides a complete toolchain with newlib:

```bash
brew tap riscv-software-src/riscv
brew install riscv-gnu-toolchain
```

This installs to `/opt/homebrew/` with the `riscv64-unknown-elf-*` prefix that Chipyard expects.

**Caveat**: The standalone `riscv64-elf-gcc` package from Homebrew does NOT include newlib (the C library). Without newlib, you cannot compile bare-metal C programs — headers like `<stdint.h>` are missing. The `riscv-gnu-toolchain` formula includes newlib and uses the correct `riscv64-unknown-elf-*` naming convention.

Symlinks were created in `$RISCV/bin/`:
```bash
mkdir -p /Users/hari/Desktop/chipyard/riscv-install/bin
cd /Users/hari/Desktop/chipyard/riscv-install/bin
for tool in gcc g++ objdump objcopy ar as ld nm ranlib readelf size strings strip; do
  ln -sf /opt/homebrew/bin/riscv64-unknown-elf-$tool riscv64-unknown-elf-$tool
done
```

### 1.2 Spike (RISC-V ISA Simulator)

Built from Chipyard's submodule:

```bash
cd /Users/hari/Desktop/chipyard
git submodule update --init toolchains/riscv-tools/riscv-isa-sim
cd toolchains/riscv-tools/riscv-isa-sim
mkdir build && cd build
../configure --prefix=/Users/hari/Desktop/chipyard/riscv-install \
  --with-boost=no --with-boost-asio=no --with-boost-regex=no
make -j$(sysctl -n hw.ncpu)
make install
```

**Result**: `spike`, `spike-dasm`, `elf2hex` installed to `$RISCV/bin/`.

### 1.3 RISC-V Tests (ISA test ELF binaries)

```bash
cd /Users/hari/Desktop/chipyard
git submodule update --init --recursive toolchains/riscv-tools/riscv-tests
cd toolchains/riscv-tools/riscv-tests
autoconf
./configure --prefix=/Users/hari/Desktop/chipyard/riscv-install/riscv64-unknown-elf
make -j$(sysctl -n hw.ncpu)
make install
```

**Caveat**: Requires `autoconf` and `automake` (`brew install autoconf automake`).

### 1.4 Proxy Kernel (pk)

```bash
cd /Users/hari/Desktop/chipyard
git submodule update --init toolchains/riscv-tools/riscv-pk
cd toolchains/riscv-tools/riscv-pk
mkdir build && cd build
../configure --prefix=/Users/hari/Desktop/chipyard/riscv-install \
  --host=riscv64-unknown-elf --with-arch=rv64gc_zifencei
make -j$(sysctl -n hw.ncpu)
make install
```

### 1.5 Environment Variables

```bash
export RISCV=/Users/hari/Desktop/chipyard/riscv-install
export PATH=$RISCV/bin:$PATH
export JAVA_HOME=/opt/homebrew/opt/openjdk@17
export PATH=/opt/homebrew/bin:$JAVA_HOME/bin:$PATH
```

---

## Step 2: Build SmallBoom Verilator Simulator

### 2.1 Scala Version Mismatches in Generator build.sbt Files

**Problem**: Several generators (`icenet`, `cva6`, `ibex`, `riscv-sodor`) had `scalaVersion := "2.12.10"` in their `build.sbt`, but Chisel 6.7.0 only publishes artifacts for Scala 2.13.

**Error**: `Error downloading org.chipsalliance:chisel_2.12:6.7.0`

**Fix**: Updated all four `build.sbt` files to `scalaVersion := "2.13.16"`.

### 2.2 Missing Git Submodules

**Problem**: Multiple submodules were uninitialized or had staged deletions, causing compilation failures:
- `constellation`, `shuttle`, `rerocc`, `bar-fetchers` (generators)
- `diplomacy`, `rocket-chip-inclusive-cache`, `rocket-chip-blocks` (tools/libraries)
- `firrtl2`, `tapeout` (tools — had 446+ staged deletions from prior work)

**Fix**:
```bash
# Initialize missing submodules
git submodule update --init generators/constellation generators/shuttle generators/rerocc generators/bar-fetchers
git submodule update --init tools/rocket-chip-blocks tools/rocket-chip-inclusive-cache

# Restore submodules with staged deletions
cd tools/firrtl2 && git restore --staged . && git checkout -- .
cd tools/tapeout && git checkout -- .
```

### 2.3 Incompatible Generators (API Mismatches with Chisel 6.7 / RocketChip)

**Problem**: Several generators use deprecated APIs that no longer exist in the current RocketChip/Chisel:
- `cva6`, `ibex`, `sodor`: Use `freechips.rocketchip.config._` (moved/renamed)
- `icenet`: Uses `testchipip.StreamIO` and other removed APIs; 80+ compile errors even after fixes

**Fix**: Since these generators are not needed for SmallBoom verification, their source files were emptied (all `.scala` files set to empty content). Their `build.sbt` files were kept with updated Scala versions so SBT can still resolve them as projects.

**Caveat**: Emptying generators is a blunt approach. For a production setup, you'd want to either:
1. Port each generator to the new API
2. Or exclude them from `build.sbt` entirely (harder due to Chipyard's build structure)

### 2.4 Removing icenet References from Chipyard

After emptying icenet's source, all Chipyard files that reference icenet types had to be updated:

| File | Change |
|------|--------|
| `generators/chipyard/src/main/scala/DigitalTop.scala` | Commented out `with icenet.CanHavePeripheryIceNIC` |
| `generators/chipyard/src/main/scala/harness/HarnessBinders.scala` | Commented out icenet imports, `WithLoopbackNIC`, `WithSimNetwork` |
| `generators/chipyard/src/main/scala/iobinders/IOBinders.scala` | Commented out icenet imports, `WithNICIOPunchthrough` |
| `generators/chipyard/src/main/scala/iobinders/Ports.scala` | Commented out `NICPort` case class |
| `generators/chipyard/src/main/scala/config/BoomConfigs.scala` | Commented out `LoopbackNICLargeBoomV3Config` |
| `generators/chipyard/src/main/scala/config/PeripheralDeviceConfigs.scala` | Commented out `LoopbackNICRocketConfig` |
| `generators/chipyard/src/main/scala/config/SpikeConfigs.scala` | Commented out `SpikeUltraFastDevicesConfig` |
| `generators/chipyard/src/main/scala/config/TutorialConfigs.scala` | Commented out `WithLoopbackNIC`, `WithIceNIC` |
| `generators/chipyard/src/main/scala/config/AbstractConfig.scala` | Commented out `WithNICIOPunchthrough` (line 62) |

**Caveat**: The `AbstractConfig.scala` reference was missed initially and only caught on a later build attempt. When removing a generator, search ALL chipyard source for references — not just the obvious import/config files.

### 2.5 testchipip Dependency Fix

**Problem**: testchipip depends on `sifive.blocks` from `rocket-chip-blocks`, which was an uninitialized submodule.

**Fix**: `git submodule update --init tools/rocket-chip-blocks`

### 2.6 Assembly Merge Conflicts

**Problem**: SBT assembly (fat JAR creation) fails with deduplication errors:
- `vsrc/Makefile` conflicts between `cva6-1.0.jar` and `ibex-1.0.jar`
- `vsrc/SimDTM.v` conflicts between `sodor-2.0.jar` and `rocketchip-1.6.jar`

**Fix**: Added merge strategy to `build.sbt`:
```scala
case PathList("vsrc", _*) => MergeStrategy.first
```

### 2.7 firtool Version Mismatch

**Problem**: After SBT assembly succeeds, the Makefile calls `firtool` (CIRCT FIRRTL compiler) to convert FIRRTL to SystemVerilog. firtool was not installed, and the initial attempt used firtool 1.142.0 (latest) which is incompatible.

**Error with firtool 1.142.0**: `module contains 114 printf-encoded verification operation(s), which are no longer supported`

**Root cause**: This Chipyard version expects **firtool 1.75.0** (specified in `conda-reqs/circt.json`). The newer firtool removed support for printf-encoded verification operations used by RocketChip's TileLink monitors.

**Fix**: Downloaded the correct version:
```bash
curl -L -o /tmp/firrtl-bin.tar.gz \
  "https://github.com/llvm/circt/releases/download/firtool-1.75.0/firrtl-bin-macos-x64.tar.gz"
tar xzf /tmp/firrtl-bin.tar.gz -C /tmp
cp /tmp/firtool-1.75.0/bin/firtool $RISCV/bin/
```

**Caveat**: Always check `conda-reqs/circt.json` for the expected firtool version. Using a newer version will likely cause incompatible FIRRTL IR errors. No native ARM64 macOS builds exist; x64 runs fine under Rosetta 2.

### 2.8 Makefile `|&` Bash Syntax Error

**Problem**: `common.mk` line 236 uses `|&` (bash-specific stderr redirect) but Make defaults to `/bin/sh`.

**Error**: `syntax error near unexpected token '&'`

**Fix**: Two changes in `common.mk`:
1. Added `SHELL := /bin/bash` at the top
2. Replaced `|& tee` with `2>&1 | tee` on line 236

### 2.9 Build Command

```bash
cd /Users/hari/Desktop/chipyard/sims/verilator
make CONFIG=SmallBoomV4Config
```

**Result**: Simulator built successfully at `simulator-chipyard.harness-SmallBoomV4Config` (10MB ARM64 binary).

**Status**: Completed.

---

## Step 3: Run ISA Tests (Pending)

```bash
cd /Users/hari/Desktop/chipyard/sims/verilator
make -j8 CONFIG=SmallBoomV4Config run-asm-tests-fast    # Assembly tests
make -j8 CONFIG=SmallBoomV4Config run-bmark-tests-fast  # Benchmarks
```

---

## Step 4: CSmith Random Testing (Pending)

```bash
cd /Users/hari/Desktop/riscv-boom/util/csmith
./install-csmith.sh
./run-csmith.sh --sim <simulator-binary> --run 50 --parallel 4 --nodebug
```

---

## Step 5: SRAM Extraction (Completed)

```bash
python3 /Users/hari/Desktop/riscv-boom/scripts/extract_srams.py \
  --input-dir /Users/hari/Desktop/riscv-boom/output/smallboom \
  --output /Users/hari/Desktop/riscv-boom/output/smallboom/srams.csv \
  --json-output /Users/hari/Desktop/riscv-boom/output/smallboom/srams.json
```

**Result**: 42 SRAMs extracted successfully.

---

## Summary of Caveats

| Issue | Root Cause | Impact |
|-------|-----------|--------|
| `riscv64-elf-gcc` missing newlib | Homebrew's standalone package doesn't include C library | Use `riscv-gnu-toolchain` from `riscv-software-src/riscv` tap instead |
| Scala 2.12 vs 2.13 in generators | Old generators pinned to Scala 2.12; Chisel 6.7 requires 2.13 | Update `build.sbt` in each generator |
| Emptied generators still cause issues | SBT resolves them as projects; conflicting resources in JARs | Add `MergeStrategy.first` for `vsrc/` paths |
| icenet removal cascades | Referenced in 9+ chipyard source files | Must grep all chipyard source for the generator name |
| No ARM64 firtool | CIRCT only publishes x64 macOS binaries | Use Rosetta 2; works but may be slower |
| firtool version mismatch | firtool 1.142.0 rejects printf-encoded verification ops | Must use firtool 1.75.0 (check `conda-reqs/circt.json`) |
| `|&` bash syntax in Makefile | `common.mk` uses bash-only `|&` but Make defaults to `/bin/sh` | Add `SHELL := /bin/bash` or replace with `2>&1 |` |
| Submodule staged deletions | Prior work emptied submodule files but staged the deletions | `git restore --staged . && git checkout -- .` to recover |
| testchipip needs rocket-chip-blocks | Transitive dependency on `sifive.blocks` package | Initialize the `tools/rocket-chip-blocks` submodule |
