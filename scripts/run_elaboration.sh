#!/usr/bin/env bash
#
# BOOM SRAM Macro Config Pipeline
# Orchestrates: generate configs → elaborate → extract SRAMs
#
# Usage:
#   ./scripts/run_elaboration.sh [--min-srams 5] [--max-srams 50] [--num-configs 50] [--parallel 4]

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
OUTPUT_DIR="${PROJECT_DIR}/output"

# Defaults
MIN_SRAMS=5
MAX_SRAMS=50
NUM_CONFIGS=50
PARALLEL=4
JVM_HEAP=8G
SKIP_GENERATE=false
SKIP_ELABORATE=false
SKIP_EXTRACT=false
SEED=42

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --min-srams)     MIN_SRAMS=$2; shift 2 ;;
        --max-srams)     MAX_SRAMS=$2; shift 2 ;;
        --num-configs)   NUM_CONFIGS=$2; shift 2 ;;
        --parallel)      PARALLEL=$2; shift 2 ;;
        --jvm-heap)      JVM_HEAP=$2; shift 2 ;;
        --output-dir)    OUTPUT_DIR=$2; shift 2 ;;
        --skip-generate) SKIP_GENERATE=true; shift ;;
        --skip-elaborate) SKIP_ELABORATE=true; shift ;;
        --skip-extract)  SKIP_EXTRACT=true; shift ;;
        --seed)          SEED=$2; shift 2 ;;
        -h|--help)
            echo "Usage: $0 [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --min-srams N      Minimum SRAM count (default: 5)"
            echo "  --max-srams N      Maximum SRAM count (default: 50)"
            echo "  --num-configs N    Number of configs to generate (default: 50)"
            echo "  --parallel N       Parallel elaboration jobs (default: 4)"
            echo "  --jvm-heap SIZE    JVM heap size (default: 8G)"
            echo "  --output-dir DIR   Output directory (default: output/)"
            echo "  --skip-generate    Skip config generation step"
            echo "  --skip-elaborate   Skip elaboration step"
            echo "  --skip-extract     Skip SRAM extraction step"
            echo "  --seed N           Random seed (default: 42)"
            exit 0
            ;;
        *) echo "Unknown option: $1"; exit 1 ;;
    esac
done

# Create output directories
mkdir -p "${OUTPUT_DIR}/configs"
mkdir -p "${OUTPUT_DIR}/verilog"
mkdir -p "${OUTPUT_DIR}/logs"

echo "=============================================="
echo "BOOM SRAM Macro Config Pipeline"
echo "=============================================="
echo "Project dir:  ${PROJECT_DIR}"
echo "Output dir:   ${OUTPUT_DIR}"
echo "SRAM range:   ${MIN_SRAMS}–${MAX_SRAMS}"
echo "Num configs:  ${NUM_CONFIGS}"
echo "Parallel:     ${PARALLEL}"
echo "JVM heap:     ${JVM_HEAP}"
echo ""

# ============================================================================
# Step 1: Generate configs
# ============================================================================
if [ "$SKIP_GENERATE" = false ]; then
    echo "=== Step 1: Generating configs ==="
    cd "$PROJECT_DIR"

    python3 scripts/generate_configs.py \
        --min-srams "$MIN_SRAMS" \
        --max-srams "$MAX_SRAMS" \
        --num-configs "$NUM_CONFIGS" \
        --seed "$SEED" \
        --output "src/main/scala/v4/macrogen/GeneratedConfigs.scala" \
        --manifest-json "${OUTPUT_DIR}/configs/manifest.json"

    echo "Config generation complete."
    echo ""
else
    echo "=== Step 1: Skipped (--skip-generate) ==="
fi

# ============================================================================
# Step 2: Elaborate each config
# ============================================================================
if [ "$SKIP_ELABORATE" = false ]; then
    echo "=== Step 2: Elaborating configs ==="
    cd "$PROJECT_DIR"

    # Read config names from manifest
    if [ ! -f "${OUTPUT_DIR}/configs/manifest.json" ]; then
        echo "ERROR: Manifest not found. Run without --skip-generate first."
        exit 1
    fi

    CONFIG_NAMES=$(python3 -c "
import json
with open('${OUTPUT_DIR}/configs/manifest.json') as f:
    configs = json.load(f)
for c in configs:
    print(c['config_name'])
")

    TOTAL=$(echo "$CONFIG_NAMES" | wc -l | tr -d ' ')
    echo "Elaborating ${TOTAL} configs with ${PARALLEL} parallel jobs..."
    echo ""

    # Function to elaborate a single config
    elaborate_one() {
        local config_name=$1
        local config_class="boom.v4.macrogen.${config_name}"
        local out_dir="${OUTPUT_DIR}/verilog/${config_name}"
        local log_file="${OUTPUT_DIR}/logs/${config_name}.log"

        mkdir -p "$out_dir"

        echo "[$(date +%H:%M:%S)] Starting: ${config_name}"

        if sbt -J-Xmx${JVM_HEAP} -J-Xss8m \
            "runMain boom.v4.macrogen.Elaborate --config ${config_class} --output-dir ${out_dir}" \
            > "$log_file" 2>&1; then
            echo "[$(date +%H:%M:%S)] SUCCESS:  ${config_name}"
            return 0
        else
            echo "[$(date +%H:%M:%S)] FAILED:   ${config_name} (see ${log_file})"
            return 1
        fi
    }

    export -f elaborate_one
    export OUTPUT_DIR JVM_HEAP

    # Run elaborations in parallel
    FAILED=0
    echo "$CONFIG_NAMES" | xargs -P"$PARALLEL" -I{} bash -c 'elaborate_one "$@"' _ {} || FAILED=$?

    echo ""
    if [ "$FAILED" -ne 0 ]; then
        echo "WARNING: Some elaborations failed. Check ${OUTPUT_DIR}/logs/ for details."
    else
        echo "All elaborations completed successfully."
    fi
    echo ""
else
    echo "=== Step 2: Skipped (--skip-elaborate) ==="
fi

# ============================================================================
# Step 3: Extract SRAM macro lists
# ============================================================================
if [ "$SKIP_EXTRACT" = false ]; then
    echo "=== Step 3: Extracting SRAM macros ==="
    cd "$PROJECT_DIR"

    python3 scripts/extract_srams.py \
        --input-dir "${OUTPUT_DIR}/verilog/" \
        --output "${OUTPUT_DIR}/dataset.csv" \
        --json-output "${OUTPUT_DIR}/dataset.json" \
        --manifest "${OUTPUT_DIR}/configs/manifest.json"

    echo ""
    echo "=== Pipeline complete ==="
    echo "Results:"
    echo "  CSV:      ${OUTPUT_DIR}/dataset.csv"
    echo "  Summary:  ${OUTPUT_DIR}/dataset_summary.csv"
    echo "  JSON:     ${OUTPUT_DIR}/dataset.json"
    echo "  Manifest: ${OUTPUT_DIR}/configs/manifest.json"
else
    echo "=== Step 3: Skipped (--skip-extract) ==="
fi
