# OpenROAD Build Setup on macOS (Apple Silicon)

## Overview

OpenROAD built from source at `/Users/hari/Desktop/OpenROAD/` (commit `a09931f`).
Binary: `/Users/hari/Desktop/OpenROAD/build/bin/openroad`

The main challenge was Anaconda polluting CMake's search paths and several Homebrew packages being keg-only (not linked into `/opt/homebrew/{include,lib}`).

---

## Prerequisites Installed

```bash
brew install bison boost bzip2 cmake eigen flex fmt googletest groff \
  libomp or-tools spdlog tcl-tk tcl-tk@8 zlib swig yaml-cpp zstd icu4c@78
```

CUDD (BDD library) is not in Homebrew — built from source:
```bash
git clone --depth=1 -b 3.0.0 https://github.com/The-OpenROAD-Project/cudd.git
cd cudd && autoreconf && ./configure --prefix=/opt/homebrew
make -j$(sysctl -n hw.ncpu) && make install
```

---

## CMake Configuration

```bash
cd /Users/hari/Desktop/OpenROAD
mkdir -p build && cd build

cmake .. -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_PREFIX_PATH="/opt/homebrew;/opt/homebrew/opt/tcl-tk@8;/opt/homebrew/opt/flex;/opt/homebrew/opt/bison;/opt/homebrew/opt/icu4c@78" \
  -DCMAKE_IGNORE_PREFIX_PATH="/opt/anaconda3" \
  -DCUDD_DIR=/opt/homebrew \
  -DTCL_LIBRARY=/opt/homebrew/opt/tcl-tk@8/lib/libtcl8.6.dylib \
  -DTCL_HEADER=/opt/homebrew/opt/tcl-tk@8/include/tcl-tk/tcl.h \
  -DFLEX_INCLUDE_DIR=/opt/homebrew/opt/flex/include \
  -DBISON_EXECUTABLE=/opt/homebrew/opt/bison/bin/bison \
  -DFLEX_EXECUTABLE=/opt/homebrew/opt/flex/bin/flex \
  -DCMAKE_EXE_LINKER_FLAGS="-L/opt/homebrew/lib -L/opt/homebrew/opt/icu4c@78/lib" \
  -DCMAKE_SHARED_LINKER_FLAGS="-L/opt/homebrew/lib -L/opt/homebrew/opt/icu4c@78/lib" \
  -DCMAKE_CXX_FLAGS="-DBOOST_STACKTRACE_GNU_SOURCE_NOT_REQUIRED" \
  -Wno-dev
```

## Build

```bash
make -j$(sysctl -n hw.ncpu) openroad
```

Note: `make openroad` builds just the main binary. A bare `make` also tries to build test executables which have additional link issues (TestSnapper timeout during gtest discovery). The main `openroad` binary builds cleanly.

---

## Issues Encountered and Fixes

### 1. Anaconda fmt conflict
**Error**: `static assertion failed... Cannot format an argument` in `/opt/anaconda3/include/fmt/core.h`
**Cause**: CMake found Anaconda's older fmt library instead of Homebrew's fmt 12.1.0.
**Fix**: `-DCMAKE_IGNORE_PREFIX_PATH="/opt/anaconda3"` excludes Anaconda from all CMake searches.

### 2. CUDD not found
**Error**: `fatal error: 'cudd.h' file not found` in OpenSTA's Power.cc
**Cause**: CUDD (Colorado University Decision Diagram) is not packaged in Homebrew.
**Fix**: Built from OpenROAD's fork: `https://github.com/The-OpenROAD-Project/cudd.git` tag 3.0.0, installed to `/opt/homebrew`.

### 3. Bison too old
**Error**: `require bison 3.2, but have 2.3` + DEF parser syntax errors
**Cause**: macOS ships bison 2.3 (from 2006). OpenROAD's Verilog and DEF parsers need 3.2+.
**Fix**: `-DBISON_EXECUTABLE=/opt/homebrew/opt/bison/bin/bison` (Homebrew has 3.8.2). Bison is keg-only on Homebrew so must be pointed to explicitly.

### 4. Flex include directory missing
**Error**: `FLEX_INCLUDE_DIR` set to NOTFOUND, causing CMake generation failure.
**Cause**: Flex is keg-only in Homebrew.
**Fix**: `-DFLEX_INCLUDE_DIR=/opt/homebrew/opt/flex/include -DFLEX_EXECUTABLE=/opt/homebrew/opt/flex/bin/flex`

### 5. TCL not found
**Error**: `TCL_LIBRARY-NOTFOUND`, `TCL_HEADER-NOTFOUND`
**Cause**: tcl-tk is keg-only. Also, Homebrew's default `tcl-tk` is version 9, but OpenROAD needs TCL 8.6 (available via `tcl-tk@8`).
**Fix**: Explicit paths to tcl-tk@8:
```
-DTCL_LIBRARY=/opt/homebrew/opt/tcl-tk@8/lib/libtcl8.6.dylib
-DTCL_HEADER=/opt/homebrew/opt/tcl-tk@8/include/tcl-tk/tcl.h
```

### 6. GTest not found
**Error**: `Could NOT find GTest`
**Fix**: `brew install googletest`

### 7. zstd library not found
**Error**: `ld: library 'zstd' not found` when linking test binaries.
**Cause**: Homebrew lib dir not in default linker search path after excluding Anaconda.
**Fix**: `-DCMAKE_EXE_LINKER_FLAGS="-L/opt/homebrew/lib"`

### 8. ICU library not found
**Error**: `ld: library 'icudata' not found`
**Cause**: `icu4c@78` is keg-only in Homebrew.
**Fix**: Added `-L/opt/homebrew/opt/icu4c@78/lib` to linker flags.

### 9. Boost.Stacktrace missing _Unwind_Backtrace
**Error**: `#error "Boost.Stacktrace requires _Unwind_Backtrace function. Define _GNU_SOURCE macro or BOOST_STACKTRACE_GNU_SOURCE_NOT_REQUIRED"`
**Cause**: macOS doesn't define `_GNU_SOURCE`; Boost needs explicit opt-in.
**Fix**: `-DCMAKE_CXX_FLAGS="-DBOOST_STACKTRACE_GNU_SOURCE_NOT_REQUIRED"`

### 10. Test targets block full build
**Error**: TestSnapper times out during gtest discovery; some test binaries fail to link.
**Cause**: Test discovery runs the test binary with `--gtest_list_tests` which hangs.
**Fix**: Build only the main target: `make openroad` instead of `make`.

---

## Key Takeaway

The biggest source of build issues was **Anaconda contaminating CMake's search paths**. Anaconda installs its own versions of Boost, fmt, protobuf, Qt5, GTest, absl, and many other libraries — all potentially version-incompatible with what OpenROAD expects. The single most important flag is:

```
-DCMAKE_IGNORE_PREFIX_PATH="/opt/anaconda3"
```

After that, the remaining issues are all about pointing CMake to keg-only Homebrew packages (bison, flex, tcl-tk@8, icu4c@78) which aren't in the default search paths.
