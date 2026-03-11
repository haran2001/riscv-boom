#!/usr/bin/env python3
"""
SRAM Extraction Script

Parses FIRRTL annotation files (.anno.json) and/or Verilog output to extract
SRAM macro information from elaborated BOOM configurations.

Usage:
    python3 scripts/extract_srams.py --input-dir output/verilog/ --output output/dataset.csv
"""

import argparse
import csv
import glob
import json
import os
import re
import sys
from dataclasses import dataclass
from typing import List, Optional


@dataclass
class SRAMInfo:
    """Information about a single SRAM macro."""
    name: str
    depth: int
    width: int
    rw_ports: int = 1
    r_ports: int = 0
    w_ports: int = 0
    module_path: str = ""


def parse_anno_json(anno_path: str) -> List[SRAMInfo]:
    """Parse FIRRTL annotation JSON for SRAM annotations."""
    srams = []

    with open(anno_path, 'r') as f:
        annotations = json.load(f)

    for anno in annotations:
        anno_class = anno.get("class", "")

        # Standard FIRRTL SRAM annotation
        if "SRAMAnnotation" in anno_class:
            target = anno.get("target", "")
            name = target.split(">")[-1] if ">" in target else target.split("|")[-1]
            srams.append(SRAMInfo(
                name=name,
                depth=anno.get("depth", 0),
                width=anno.get("width", 0),
                rw_ports=len(anno.get("readwritePorts", [])),
                r_ports=len(anno.get("readPorts", [])),
                w_ports=len(anno.get("writePorts", [])),
                module_path=target,
            ))

        # Chisel MemoryAnnotation (alternative format)
        elif "MemoryAnnotation" in anno_class or "DescribedSRAM" in anno_class:
            target = anno.get("target", "")
            name = anno.get("name", target.split(">")[-1] if ">" in target else "")
            depth = anno.get("depth", anno.get("size", 0))
            width = anno.get("width", anno.get("dataWidth", 0))
            srams.append(SRAMInfo(
                name=name,
                depth=depth,
                width=width,
                module_path=target,
            ))

        # SRAM replacement annotations from MacroCompiler
        elif "MacroCompilerAnnotation" in anno_class or "ReplSeqMemAnnotation" in anno_class:
            # These indicate SRAM replacement was configured
            pass

    return srams


def parse_verilog_for_srams(verilog_dir: str) -> List[SRAMInfo]:
    """
    Fallback: grep Verilog files for SRAM-like module instantiations.
    Look for modules with _ext suffix (SRAM replacement convention)
    or SyncReadMem-generated modules.
    """
    srams = []
    seen_modules = set()

    # Patterns matching SRAM module names
    sram_patterns = [
        # Standard _ext suffix from SRAM replacement
        re.compile(r'module\s+([\w]+_ext)\s*\('),
        # SyncReadMem-generated names
        re.compile(r'module\s+([\w]*(?:mem|sram|ram|array|data_array|tag_array)[\w]*)\s*\(', re.IGNORECASE),
    ]

    # Also look for DescribedSRAM instance declarations
    described_sram_pattern = re.compile(
        r'//\s*DescribedSRAM\s+name=(\w+)\s+desc="([^"]*)"'
        r'\s+size=(\d+)\s+data=(\d+)',
        re.MULTILINE
    )

    for vf in glob.glob(os.path.join(verilog_dir, "*.v")) + \
              glob.glob(os.path.join(verilog_dir, "*.sv")):
        with open(vf, 'r') as f:
            content = f.read()

        # Look for DescribedSRAM comments
        for m in described_sram_pattern.finditer(content):
            name, desc, size, width = m.groups()
            if name not in seen_modules:
                srams.append(SRAMInfo(
                    name=name,
                    depth=int(size),
                    width=int(width),
                    module_path=vf,
                ))
                seen_modules.add(name)

        # Look for module definitions matching SRAM patterns
        for pattern in sram_patterns:
            for m in pattern.finditer(content):
                mod_name = m.group(1)
                if mod_name not in seen_modules:
                    # Try to extract depth/width from module ports
                    depth, width = extract_sram_dims_from_module(content, mod_name)
                    srams.append(SRAMInfo(
                        name=mod_name,
                        depth=depth,
                        width=width,
                        module_path=vf,
                    ))
                    seen_modules.add(mod_name)

    return srams


def extract_sram_dims_from_module(verilog_content: str, module_name: str) -> tuple:
    """Try to extract SRAM dimensions from a Verilog module definition."""
    # Look for reg declarations inside the module
    mod_match = re.search(
        rf'module\s+{re.escape(module_name)}\s*\(.*?\);(.*?)endmodule',
        verilog_content, re.DOTALL
    )
    if not mod_match:
        return (0, 0)

    body = mod_match.group(1)

    # Look for reg [W-1:0] mem [0:D-1] or similar
    reg_match = re.search(r'reg\s+\[(\d+):0\]\s+\w+\s+\[0:(\d+)\]', body)
    if reg_match:
        width = int(reg_match.group(1)) + 1
        depth = int(reg_match.group(2)) + 1
        return (depth, width)

    return (0, 0)


def parse_firrtl_for_smems(firrtl_path: str) -> List[SRAMInfo]:
    """Parse FIRRTL (.fir) for smem/cmem declarations."""
    srams = []

    with open(firrtl_path, 'r') as f:
        for line in f:
            # smem declarations: smem name : type[depth]
            m = re.match(r'\s*smem\s+(\w+)\s*:\s*.*\[(\d+)\]', line)
            if m:
                name = m.group(1)
                depth = int(m.group(2))
                srams.append(SRAMInfo(name=name, depth=depth, width=0))
                continue

            # cmem declarations
            m = re.match(r'\s*cmem\s+(\w+)\s*:\s*.*\[(\d+)\]', line)
            if m:
                name = m.group(1)
                depth = int(m.group(2))
                srams.append(SRAMInfo(name=name, depth=depth, width=0))

    return srams


def extract_srams_for_config(config_dir: str) -> List[SRAMInfo]:
    """Extract SRAMs from all available outputs for a single config."""
    srams = []

    # Try annotation files first (most reliable)
    for anno_file in glob.glob(os.path.join(config_dir, "*.anno.json")):
        srams.extend(parse_anno_json(anno_file))

    # Try FIRRTL files
    if not srams:
        for fir_file in glob.glob(os.path.join(config_dir, "*.fir")):
            srams.extend(parse_firrtl_for_smems(fir_file))

    # Fallback to Verilog parsing
    if not srams:
        srams.extend(parse_verilog_for_srams(config_dir))

    return srams


def main():
    parser = argparse.ArgumentParser(description="BOOM SRAM Extraction Script")
    parser.add_argument("--input-dir", type=str, required=True,
                        help="Directory containing elaboration output subdirs")
    parser.add_argument("--output", type=str, default="output/dataset.csv",
                        help="Output CSV file path")
    parser.add_argument("--json-output", type=str, default=None,
                        help="Also write results as JSON")
    parser.add_argument("--manifest", type=str, default=None,
                        help="Path to config manifest JSON (from generate_configs.py)")
    args = parser.parse_args()

    # Load manifest if provided
    manifest = {}
    if args.manifest and os.path.exists(args.manifest):
        with open(args.manifest, 'r') as f:
            for entry in json.load(f):
                manifest[entry["config_name"]] = entry

    # Process each config directory
    input_dir = args.input_dir
    results = []

    config_dirs = sorted([
        d for d in os.listdir(input_dir)
        if os.path.isdir(os.path.join(input_dir, d))
    ])

    if not config_dirs:
        # Maybe the input dir itself is a single config
        config_dirs = ["."]

    for config_name in config_dirs:
        config_dir = os.path.join(input_dir, config_name)
        print(f"Processing {config_name}...")

        srams = extract_srams_for_config(config_dir)

        # Get estimated count from manifest
        estimated = manifest.get(config_name, {}).get("estimated_srams", -1)

        for sram in srams:
            results.append({
                "config_name": config_name,
                "sram_name": sram.name,
                "depth": sram.depth,
                "width": sram.width,
                "rw_ports": sram.rw_ports,
                "r_ports": sram.r_ports,
                "w_ports": sram.w_ports,
                "module_path": sram.module_path,
            })

        actual_count = len(srams)
        match_str = ""
        if estimated >= 0:
            match_str = f" (estimated: {estimated}, {'MATCH' if estimated == actual_count else 'MISMATCH'})"
        print(f"  Found {actual_count} SRAMs{match_str}")

    # Write CSV
    os.makedirs(os.path.dirname(args.output) or ".", exist_ok=True)
    with open(args.output, 'w', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=[
            "config_name", "sram_name", "depth", "width",
            "rw_ports", "r_ports", "w_ports", "module_path"
        ])
        writer.writeheader()
        writer.writerows(results)
    print(f"\nWrote {len(results)} SRAM entries to {args.output}")

    # Also write per-config summary
    summary_path = args.output.replace(".csv", "_summary.csv")
    summary = {}
    for r in results:
        cn = r["config_name"]
        if cn not in summary:
            summary[cn] = {"config_name": cn, "sram_count": 0, "total_bits": 0, "sram_names": []}
        summary[cn]["sram_count"] += 1
        summary[cn]["total_bits"] += r["depth"] * r["width"]
        summary[cn]["sram_names"].append(r["sram_name"])

    with open(summary_path, 'w', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=["config_name", "sram_count", "total_bits", "sram_names"])
        writer.writeheader()
        for cn in sorted(summary.keys()):
            s = summary[cn]
            s["sram_names"] = ";".join(s["sram_names"])
            writer.writerow(s)
    print(f"Wrote summary to {summary_path}")

    # JSON output
    if args.json_output:
        json_results = {}
        for r in results:
            cn = r["config_name"]
            if cn not in json_results:
                estimated = manifest.get(cn, {}).get("estimated_srams", -1)
                json_results[cn] = {
                    "config_name": cn,
                    "estimated_srams": estimated,
                    "actual_srams": 0,
                    "sram_list": [],
                }
            json_results[cn]["actual_srams"] += 1
            json_results[cn]["sram_list"].append({
                "name": r["sram_name"],
                "depth": r["depth"],
                "width": r["width"],
                "rw_ports": r["rw_ports"],
                "r_ports": r["r_ports"],
                "w_ports": r["w_ports"],
            })

        with open(args.json_output, 'w') as f:
            json.dump(list(json_results.values()), f, indent=2)
        print(f"Wrote JSON to {args.json_output}")


if __name__ == "__main__":
    main()
