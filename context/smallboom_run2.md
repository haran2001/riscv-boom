# SmallBoom RTL Verification Run 2: Verilator Simulator Build & ISA Testing

## Overview

This document covers the second phase of SmallBoom verification: building a cycle-accurate Verilator simulator from the Chipyard build system, and attempting to run RISC-V ISA tests against it. Phase 1 (RTL generation via standalone elaboration) is documented in `smallboom_completed.md`.

**Goal**: Build `simulator-chipyard.harness-SmallBoomV4Config` and run rv64 ISA tests to confirm functional correctness.

**Result**: Simulator built successfully. ISA tests blocked by a segfault in Spike's fesvr `tsi_tick` due to macOS pthread-based context switching. Fix identified but not yet applied.

---

## Environment

| Component | Version / Path |
|-----------|---------------|
| Host | macOS (Apple Silicon / ARM64), Darwin 24.6.0 |
| Chipyard | `/Users/hari/Desktop/chipyard` @ commit `bcb61291` |
| BOOM | `generators/boom/` with Chisel 6.5→6.7 fixes applied |
| Verilator | `/opt/homebrew/bin/verilator` v5.036 (Chipyard expects 5.022) |
| Java | OpenJDK 17 (`/opt/homebrew/opt/openjdk@17`) |
| Scala | 2.13.16 |
| Chisel | 6.7.0 |
| firtool | 1.75.0 (CIRCT, x64 via Rosetta 2) |
| RISC-V GCC | `riscv64-unknown-elf-gcc` from `riscv-software-src/riscv` brew tap |
| Spike | Built from Chipyard submodule `toolchains/riscv-tools/riscv-isa-sim` |
| `$RISCV` | `/Users/hari/Desktop/chipyard/riscv-install` |

---

## Step 1: RISC-V Toolchain Installation

### 1.1 Cross-Compiler (`riscv64-unknown-elf-gcc`)

**Approach that failed**: Homebrew's standalone `riscv64-elf-gcc` package. It does NOT include newlib (the bare-metal C library), so `#include <stdint.h>` fails when building riscv-tests.

**Approach that worked**:
```bash
brew tap riscv-software-src/riscv
brew install riscv-gnu-toolchain
```

This installs a complete cross-compiler with newlib at `/opt/homebrew/bin/riscv64-unknown-elf-*`, which is the exact prefix Chipyard expects.

Symlinks created in `$RISCV/bin/` for Chipyard's Makefile to find:
```bash
mkdir -p /Users/hari/Desktop/chipyard/riscv-install/bin
cd /Users/hari/Desktop/chipyard/riscv-install/bin
for tool in gcc g++ objdump objcopy ar as ld nm ranlib readelf size strings strip; do
  ln -sf /opt/homebrew/bin/riscv64-unknown-elf-$tool riscv64-unknown-elf-$tool
done
```

### 1.2 Spike (RISC-V ISA Simulator / fesvr)

Spike provides the `fesvr` (Front-End Server) library which Chipyard's Verilator simulator links against for host-target communication (TSI protocol).

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

**Installed**: `spike`, `spike-dasm`, `elf2hex` binaries + `libriscv.so` shared library + fesvr headers.

### 1.3 RISC-V ISA Tests

Standard test suite (`rv64ui-p-*`, `rv64um-p-*`, `rv64ua-p-*`, etc.):

```bash
cd /Users/hari/Desktop/chipyard
git submodule update --init --recursive toolchains/riscv-tools/riscv-tests
cd toolchains/riscv-tools/riscv-tests
autoconf   # requires: brew install autoconf automake
./configure --prefix=/Users/hari/Desktop/chipyard/riscv-install/riscv64-unknown-elf
make -j$(sysctl -n hw.ncpu)
make install
```

**Installed to**: `$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/`

### 1.4 Proxy Kernel (pk)

Runtime for newlib-based benchmark binaries:

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

## Step 2: Chipyard SBT Compilation Fixes

The Chipyard SBT build compiles ALL generator projects (not just BOOM), so many unrelated generators had to be fixed or stubbed.

### 2.1 Scala Version Mismatches

**Problem**: `icenet`, `cva6`, `ibex`, `riscv-sodor` all had `scalaVersion := "2.12.10"` in their `build.sbt`. Chisel 6.7.0 only publishes for Scala 2.13, so SBT fails with `Error downloading org.chipsalliance:chisel_2.12:6.7.0`.

**Fix**: Updated each `build.sbt` to `scalaVersion := "2.13.16"`.

### 2.2 Missing Git Submodules

Multiple submodules were uninitialized or had staged deletions from prior work:

| Submodule | Issue | Fix |
|-----------|-------|-----|
| `constellation`, `shuttle`, `rerocc`, `bar-fetchers` | Uninitialized | `git submodule update --init` |
| `rocket-chip-blocks`, `rocket-chip-inclusive-cache` | Uninitialized | `git submodule update --init` |
| `firrtl2` | 446 staged deletions | `git restore --staged . && git checkout -- .` |
| `tapeout` | 35 modified files | `git checkout -- .` |

### 2.3 Incompatible Generators (Emptied)

These generators use old RocketChip APIs (`freechips.rocketchip.config._` etc.) and have 80+ compilation errors each. Since they're not needed for SmallBoom, their source files were emptied:

- **cva6** — RISC-V CVA6 core wrapper
- **ibex** — RISC-V Ibex core wrapper
- **riscv-sodor** — educational RISC-V cores
- **icenet** — FireSim NIC (had additional deep API incompatibilities with testchipip)

Method: All `.scala` files set to empty content, `build.sbt` kept with updated Scala version.

### 2.4 icenet Removal Cascade

Emptying icenet's source broke 9 Chipyard files that reference icenet types. Each required commenting out the icenet-specific code:

| File | What was commented out |
|------|----------------------|
| `DigitalTop.scala` | `with icenet.CanHavePeripheryIceNIC` trait mixin |
| `harness/HarnessBinders.scala` | icenet imports, `WithLoopbackNIC`, `WithSimNetwork` classes |
| `iobinders/IOBinders.scala` | icenet imports, `WithNICIOPunchthrough` class |
| `iobinders/Ports.scala` | `NICPort` case class, icenet imports |
| `config/BoomConfigs.scala` | `LoopbackNICLargeBoomV3Config` |
| `config/PeripheralDeviceConfigs.scala` | `LoopbackNICRocketConfig` |
| `config/SpikeConfigs.scala` | `SpikeUltraFastDevicesConfig` |
| `config/TutorialConfigs.scala` | `WithLoopbackNIC`, `WithIceNIC` references |
| `config/AbstractConfig.scala` (line 62) | `new chipyard.iobinders.WithNICIOPunchthrough ++` |

**Critical lesson**: The `AbstractConfig.scala` reference was missed initially and only caught after multiple build attempts. When removing a generator, `grep -rn "generatorName" generators/chipyard/` to find ALL references.

### 2.5 testchipip Dependencies

testchipip depends on `sifive.blocks` from `rocket-chip-blocks`. Fix: `git submodule update --init tools/rocket-chip-blocks`.

icenet's `build.sbt` was also missing a dependency on testchipip — added `.dependsOn(rocketchip, testchipip)` — but this was moot since icenet was ultimately emptied.

### 2.6 SBT Assembly Merge Conflicts

**Problem**: The SBT assembly (fat JAR) step fails with deduplication errors:
- `vsrc/Makefile` — conflict between `cva6-1.0.jar` and `ibex-1.0.jar`
- `vsrc/SimDTM.v` — conflict between `sodor-2.0.jar` and `rocketchip-1.6.jar`

**Fix**: Added to `commonSettings` in `build.sbt`:
```scala
case PathList("vsrc", _*) => MergeStrategy.first
```

---

## Step 3: firtool (FIRRTL → SystemVerilog Compiler)

### 3.1 firtool Not Found

After SBT assembly, the Makefile invokes `firtool` to lower FIRRTL IR to SystemVerilog. firtool is part of LLVM/CIRCT and not installed by default.

### 3.2 Version Mismatch: 1.142.0 vs 1.75.0

**First attempt**: Downloaded latest firtool 1.142.0.

**Error**: `module contains 114 printf-encoded verification operation(s), which are no longer supported`

**Root cause**: This Chipyard version requires **firtool 1.75.0**, specified in `conda-reqs/circt.json`. The newer firtool (1.142.0) dropped support for printf-encoded verification operations used by RocketChip's TileLink monitors.

**Fix**: Downloaded the correct version:
```bash
curl -L -o /tmp/firrtl-bin.tar.gz \
  "https://github.com/llvm/circt/releases/download/firtool-1.75.0/firrtl-bin-macos-x64.tar.gz"
tar xzf /tmp/firrtl-bin.tar.gz -C /tmp
cp /tmp/firtool-1.75.0/bin/firtool $RISCV/bin/
```

**Key takeaway**: Always check `conda-reqs/circt.json` for the expected firtool version. No ARM64 macOS build exists; x64 runs fine under Rosetta 2.

### 3.3 Makefile `|&` Bash Syntax Error

**Problem**: `common.mk` line 236 uses `|&` (bash-specific stderr+stdout redirect) but GNU Make defaults to `/bin/sh`.

**Error**: `syntax error near unexpected token '&'`

**Fix** (two changes to `common.mk`):
1. Added `SHELL := /bin/bash` at line 1
2. Changed `|& tee $(FIRTOOL_LOG_FILE)` to `2>&1 | tee $(FIRTOOL_LOG_FILE)` on line 236

---

## Step 4: Verilator Simulator Build

### 4.1 Build Pipeline

The full build pipeline (handled by `make CONFIG=SmallBoomV4Config`):

1. **SBT Compilation** — Compiles all Scala/Chisel source into JVM bytecode
2. **SBT Assembly** — Creates a fat JAR (`chipyard.jar`) with all dependencies
3. **Chisel Elaboration** — Runs the Chisel generator, producing `.fir` (FIRRTL IR)
4. **firtool** — Lowers FIRRTL to SystemVerilog (`.sv` files in `gen-collateral/`)
5. **Verilator** — Converts SystemVerilog to C++ simulation model
6. **C++ Compilation** — Compiles Verilator output + testbench C++ into simulator binary

### 4.2 Build Command

```bash
cd /Users/hari/Desktop/chipyard/sims/verilator
export RISCV=/Users/hari/Desktop/chipyard/riscv-install
export PATH=$RISCV/bin:$PATH
export JAVA_HOME=/opt/homebrew/opt/openjdk@17
export PATH=/opt/homebrew/bin:$JAVA_HOME/bin:$PATH

make CONFIG=SmallBoomV4Config
```

### 4.3 Build Result

**Status**: Completed successfully.

**Output**: `simulator-chipyard.harness-SmallBoomV4Config` — 10MB ARM64 Mach-O binary.

**Generated files location**: `sims/verilator/generated-src/chipyard.harness.TestHarness.SmallBoomV4Config/`

Key generated files:
- `gen-collateral/` — ~400 SystemVerilog files, C++ testbench code, DRAMSim2 models
- `chipyard.harness.TestHarness.SmallBoomV4Config.fir` — FIRRTL IR
- `chipyard.harness.TestHarness.SmallBoomV4Config.mems.conf` — SRAM memory configuration
- `model_module_hierarchy.json` — Module hierarchy for uniquification

---

## Step 5: ISA Test Execution (Blocked)

### 5.1 DRAMSim2 INI Files Missing

**Problem**: First test run aborted with `Unable to load ini file DDR3_micron_64M_8B_x4_sg15.ini`.

**Root cause**: testchipip's `src/` directory had been restructured (original moved to `src.bak/`) during prior emptying work. The DRAMSim2 `.ini` resource files were in `src.bak/main/resources/dramsim2_ini/`.

**Fix**:
```bash
mkdir -p generators/testchipip/src/main/resources/dramsim2_ini
cp generators/testchipip/src.bak/main/resources/dramsim2_ini/*.ini \
   generators/testchipip/src/main/resources/dramsim2_ini/
```

### 5.2 Simulator Segfault in `tsi_tick`

**Problem**: After fixing the DRAMSim2 issue, the simulator segfaults immediately on every test run — including the simplest test (`rv64ui-p-simple`).

**Crash location** (from lldb):
```
Process stopped: EXC_BAD_ACCESS (code=1, address=0x0)
frame #0: simulator-chipyard.harness-SmallBoomV4Config`tsi_tick + 344
```

**Root cause analysis** (via disassembly):

The crash sequence in `tsi_tick`:
1. `+300`: Calls `tsi_t::tick()` — processes TSI serial protocol
2. `+308`: Calls `tsi_t::switch_to_host()` — context-switches to host thread
3. `+312`: Loads `in_data` deque pointer from TSI object (`[x23, #0x348]`)
4. `+336-344`: Dereferences deque internal chunk pointer — **x8 is 0x0 (NULL)**

The `tsi_t::switch_to_host()` is supposed to context-switch to the "host" coroutine (which processes HTIF protocol, loads ELF, fills `in_data`). But the context switch doesn't work correctly, so the host thread never runs, and `in_data` is left in an uninitialized/empty state with a null internal chunk pointer.

**Why context switching fails on macOS**:

The fesvr `context_t` class (`fesvr/context.h`) has two implementations:
- **glibc (Linux)**: Uses `ucontext_t` / `swapcontext()` — fast, reliable coroutine switching
- **Non-glibc (macOS)**: Uses `pthread_create` + `pthread_mutex` + `pthread_cond` — emulates coroutines via thread synchronization

The pthread-based path (lines 89-98 of `context.cc`) has a coordination bug where `switch_to()` doesn't properly set `cur = this` (unlike the ucontext path which does at line 86). This causes the calling thread to return from `switch_to_host()` before the target thread has actually run.

**Identified fix** (not yet applied):

Modify `fesvr/context.h` to enable `ucontext` on macOS (it's deprecated but still functional):

```diff
- #if defined(__GLIBC__)
+ #if defined(__GLIBC__) || defined(__APPLE__)
  # undef USE_UCONTEXT
  # define USE_UCONTEXT
+ # define _XOPEN_SOURCE    // required on macOS for ucontext.h
  # include <ucontext.h>
```

Then rebuild Spike, reinstall `libriscv.so`, and rebuild the Verilator simulator (which links against it).

**Attempted**: Started this fix but `_XOPEN_SOURCE` definition placement needs to be before any system headers. The clang diagnostic `The deprecated ucontext routines require _XOPEN_SOURCE to be defined` confirms the approach is correct but the define must be set earlier (e.g., in `CXXFLAGS` during configure).

### 5.3 ISA Test Command (for reference)

```bash
cd /Users/hari/Desktop/chipyard/sims/verilator
make CONFIG=SmallBoomV4Config run-asm-tests-fast    # Assembly tests
make CONFIG=SmallBoomV4Config run-bmark-tests-fast  # Benchmarks
```

These use Chipyard's Makefile which:
1. Symlinks test ELF binaries from `$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/`
2. Runs the simulator with `+max-cycles=10000000` timeout
3. Logs output to `output/chipyard.harness.TestHarness.SmallBoomV4Config/`
4. Creates `.run` touch files on success

---

## Step 6: SRAM Extraction (Completed)

```bash
python3 /Users/hari/Desktop/riscv-boom/scripts/extract_srams.py \
  --input-dir /Users/hari/Desktop/riscv-boom/output/smallboom \
  --output /Users/hari/Desktop/riscv-boom/output/smallboom/srams.csv \
  --json-output /Users/hari/Desktop/riscv-boom/output/smallboom/srams.json
```

**Result**: 42 SRAMs extracted. Output in `output/smallboom/srams.csv` and `srams.json`.

---

## Summary of All Caveats

| # | Issue | Root Cause | Fix |
|---|-------|-----------|-----|
| 1 | `riscv64-elf-gcc` missing newlib | Homebrew standalone package has no C library | Use `riscv-gnu-toolchain` from `riscv-software-src/riscv` tap |
| 2 | Scala 2.12 vs 2.13 in generators | Old generators pinned to Scala 2.12 | Update each `build.sbt` to `scalaVersion := "2.13.16"` |
| 3 | Broken generators (cva6, ibex, sodor, icenet) | Old RocketChip APIs, 80+ errors each | Empty source files (not needed for SmallBoom) |
| 4 | icenet removal cascades to 9 files | Chipyard code references icenet types | Comment out all references; grep exhaustively |
| 5 | `AbstractConfig.scala` reference missed | Not in obvious import/config location | Always `grep -rn` the full chipyard source tree |
| 6 | testchipip needs rocket-chip-blocks | Transitive `sifive.blocks` dependency | `git submodule update --init tools/rocket-chip-blocks` |
| 7 | Submodule staged deletions (firrtl2, tapeout) | Prior work left staged git changes | `git restore --staged . && git checkout -- .` |
| 8 | SBT assembly merge conflicts (vsrc/) | Duplicate resources across generator JARs | `case PathList("vsrc", _*) => MergeStrategy.first` in build.sbt |
| 9 | firtool version mismatch (1.142.0 vs 1.75.0) | Newer firtool removed printf-encoded verification ops | Check `conda-reqs/circt.json` for correct version |
| 10 | No ARM64 firtool | CIRCT only publishes x64 macOS binaries | x64 binary works via Rosetta 2 |
| 11 | `\|&` bash syntax in Makefile | `common.mk` uses bash-only syntax, Make uses `/bin/sh` | Add `SHELL := /bin/bash` + replace `\|&` with `2>&1 \|` |
| 12 | DRAMSim2 ini files missing | testchipip `src/` restructured, resources lost | Copy from `src.bak/main/resources/dramsim2_ini/` |
| 13 | Simulator segfault in `tsi_tick` | fesvr pthread context switching broken on macOS | Enable `USE_UCONTEXT` with `_XOPEN_SOURCE` on macOS |
| 14 | Verilator version mismatch (5.036 vs 5.022) | Homebrew has newer version than Chipyard expects | Not yet confirmed to cause issues |

---

## Current Status

| Step | Status | Notes |
|------|--------|-------|
| 1. RISC-V Toolchain | **Done** | gcc, Spike, riscv-tests, pk all installed |
| 2. SBT Compilation | **Done** | All generators compile (broken ones emptied) |
| 3. firtool FIRRTL→SV | **Done** | Using firtool 1.75.0 |
| 4. Verilator Build | **Done** | 10MB ARM64 simulator binary |
| 5. ISA Tests | **Blocked** | Segfault in fesvr context switching |
| 6. Benchmark Tests | **Blocked** | Depends on ISA tests fix |
| 7. CSmith Random Tests | **Not started** | Depends on working simulator |
| 8. SRAM Extraction | **Done** | 42 SRAMs extracted |

---

## Next Steps

1. **Fix fesvr context switching on macOS**: Rebuild Spike with `USE_UCONTEXT` enabled via `-D_XOPEN_SOURCE` in CXXFLAGS:
   ```bash
   cd toolchains/riscv-tools/riscv-isa-sim/build
   CXXFLAGS="-D_XOPEN_SOURCE" ../configure --prefix=$RISCV --with-boost=no --with-boost-asio=no --with-boost-regex=no
   make -j$(sysctl -n hw.ncpu) && make install
   ```
   Also need to modify `fesvr/context.h` to add `|| defined(__APPLE__)` to the `USE_UCONTEXT` guard.

2. **Rebuild simulator** after Spike reinstall (it links `libriscv.so`):
   ```bash
   cd sims/verilator
   make CONFIG=SmallBoomV4Config
   ```

3. **Run ISA tests**: `make CONFIG=SmallBoomV4Config run-asm-tests-fast`

4. **Run benchmarks**: `make CONFIG=SmallBoomV4Config run-bmark-tests-fast`

5. **CSmith random testing**: Install CSmith, run 50 random programs comparing BOOM vs Spike output.

---

## Files Modified in Chipyard

For reference, all files modified in `/Users/hari/Desktop/chipyard/`:

### build.sbt
- Added `case PathList("vsrc", _*) => MergeStrategy.first` to assemblyMergeStrategy

### common.mk
- Added `SHELL := /bin/bash` at line 1
- Changed `|& tee` to `2>&1 | tee` on line 236

### Generator build.sbt files (4 files)
- `generators/icenet/build.sbt` — scalaVersion → 2.13.16
- `generators/cva6/build.sbt` — scalaVersion → 2.13.16
- `generators/ibex/build.sbt` — scalaVersion → 2.13.16
- `generators/riscv-sodor/build.sbt` — scalaVersion → 2.13.16

### Emptied generator sources (4 generators)
- `generators/icenet/src/` — all .scala files emptied
- `generators/cva6/src/` — all .scala files emptied
- `generators/ibex/src/` — all .scala files emptied
- `generators/riscv-sodor/src/` — all .scala files emptied

### Chipyard source (9 files — icenet references removed)
- `generators/chipyard/src/main/scala/DigitalTop.scala`
- `generators/chipyard/src/main/scala/harness/HarnessBinders.scala`
- `generators/chipyard/src/main/scala/iobinders/IOBinders.scala`
- `generators/chipyard/src/main/scala/iobinders/Ports.scala`
- `generators/chipyard/src/main/scala/config/AbstractConfig.scala`
- `generators/chipyard/src/main/scala/config/BoomConfigs.scala`
- `generators/chipyard/src/main/scala/config/PeripheralDeviceConfigs.scala`
- `generators/chipyard/src/main/scala/config/SpikeConfigs.scala`
- `generators/chipyard/src/main/scala/config/TutorialConfigs.scala`

### testchipip resources (restored)
- `generators/testchipip/src/main/resources/dramsim2_ini/DDR3_micron_64M_8B_x4_sg15.ini`
- `generators/testchipip/src/main/resources/dramsim2_ini/system.ini`

### Spike (attempted, not yet complete)
- `toolchains/riscv-tools/riscv-isa-sim/fesvr/context.h` — added `|| defined(__APPLE__)` to USE_UCONTEXT guard (needs `_XOPEN_SOURCE` in CXXFLAGS too)
