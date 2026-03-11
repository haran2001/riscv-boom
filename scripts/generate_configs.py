#!/usr/bin/env python3
"""
BOOM SRAM Macro Config Generator

Sweeps BOOM configuration knobs to produce Scala config classes with varying
SRAM macro counts (5–50), for macroplacement ML training data generation.

Usage:
    python3 scripts/generate_configs.py --min-srams 5 --max-srams 50 --num-configs 50
"""

import argparse
import itertools
import json
import math
import os
import random
import sys
from dataclasses import dataclass, field
from typing import List, Tuple, Optional


# ============================================================================
# SRAM count model
# ============================================================================

@dataclass
class BPDConfig:
    """Branch predictor stack configuration."""
    name: str
    # TAGE
    tage_num_tables: int = 0
    tage_table_info: List[Tuple[int, int, int]] = field(default_factory=list)
    tage_single_ported: bool = False
    # BTB (fast)
    btb_use_flops: bool = True
    btb_n_ways: int = 2
    btb_n_sets: int = 128
    btb_extended_n_sets: int = 128
    # SlowBTB
    use_slow_btb: bool = False
    slow_btb_n_ways: int = 2
    slow_btb_n_sets: int = 128
    slow_btb_extended_n_sets: int = 128
    slow_btb_single_ported: bool = False
    # BIM
    bim_use_flops: bool = True
    bim_n_cols: int = 8
    bim_n_sets: int = 2048
    bim_single_ported: bool = True
    bim_slow: bool = False
    # HBIM
    use_hbim: bool = False
    hbim_n_sets: int = 2048
    # Tournament
    use_tourney: bool = False
    tourney_n_sets: int = 128
    # uBTB variant
    ubtb_type: str = "faubtb2"  # "faubtb2", "faubtb", "gubtb", "ubtb"
    ubtb_n_sets: int = 256
    # Local history
    local_history_n_sets: int = 0
    local_history_length: int = 1
    # Global history
    global_history_length: int = 64
    # Meta budget
    bpd_max_meta_length: int = 120


@dataclass
class CoreConfig:
    """Core pipeline configuration."""
    name: str
    fetch_width: int = 4
    decode_width: int = 1
    num_rob_entries: int = 32
    num_int_phys_regs: int = 52
    num_fp_phys_regs: int = 48
    num_ldq_entries: int = 8
    num_stq_entries: int = 8
    max_br_count: int = 8
    num_fetch_buffer_entries: int = 8
    lsu_width: int = 1
    num_dcache_banks: int = 1
    # Issue params
    mem_issue_width: int = 2
    mem_issue_entries: int = 8
    unq_issue_width: int = 1
    unq_issue_entries: int = 8
    alu_issue_width: int = 1
    alu_issue_entries: int = 8
    fp_issue_width: int = 1
    fp_issue_entries: int = 8
    # Register file
    num_irf_read_ports: int = 3
    num_irf_banks: int = 1
    num_frf_read_ports: int = 3
    num_frf_banks: int = 1
    # FTQ
    ftq_entries: int = 16
    # Extra
    enable_column_alu_issue: bool = False
    enable_prefetching: bool = False
    enable_superscalar_snapshots: bool = True
    enable_slow_btb_redirect: bool = False
    # Slow issue entries (0 = not used)
    alu_slow_entries: int = 0
    unq_slow_entries: int = 0
    fp_slow_entries: int = 0
    mem_slow_entries: int = 0


@dataclass
class CacheConfig:
    """Cache configuration."""
    # ICache
    ic_row_bits: int = 64
    ic_n_sets: int = 64
    ic_n_ways: int = 4
    ic_fetch_bytes: int = 8  # fetchWidth * 2 (RVC)
    # DCache
    dc_row_bits: int = 64
    dc_n_sets: int = 64
    dc_n_ways: int = 4
    dc_n_mshrs: int = 2
    dc_n_tlb_ways: int = 8


def compute_n_banks(fetch_width: int) -> int:
    """Number of BPD banks = 1 if fetchBytes<=8, else 2. fetchBytes = fetchWidth*2 (RVC)."""
    fetch_bytes = fetch_width * 2
    return 1 if fetch_bytes <= 8 else 2


def compute_bank_width(fetch_width: int) -> int:
    n_banks = compute_n_banks(fetch_width)
    return fetch_width // n_banks


def estimate_bpd_srams_per_bank(bpd: BPDConfig, bank_width: int) -> int:
    """Estimate SRAM macro count for a single BPD bank."""
    count = 0

    # TAGE: 2 SyncReadMems per table (us + table)
    count += 2 * bpd.tage_num_tables

    # BTB (fast): 2*nWays+1 if SRAM, 0 if flops
    if not bpd.btb_use_flops:
        count += 2 * bpd.btb_n_ways + 1

    # SlowBTB: always SRAM, 2*nWays+1
    if bpd.use_slow_btb:
        count += 2 * bpd.slow_btb_n_ways + 1

    # BIM: nCols if SRAM, 0 if flops
    if not bpd.bim_use_flops:
        count += bpd.bim_n_cols

    # HBIM: bankWidth SyncReadMems
    if bpd.use_hbim:
        count += bank_width

    # Tournament: bankWidth SyncReadMems
    if bpd.use_tourney:
        count += bank_width

    # uBTB: only "ubtb" (set-associative) produces SRAMs (2)
    if bpd.ubtb_type == "ubtb":
        count += 2

    return count


def estimate_local_history_srams(bpd: BPDConfig) -> int:
    """Local history provider SRAM: 1 per bank if enabled."""
    if bpd.local_history_n_sets > 0:
        return 1  # per bank (but instantiated nBanks times by predictor.scala)
    return 0


def estimate_total_srams(core: CoreConfig, cache: CacheConfig, bpd: BPDConfig) -> int:
    """Estimate total SRAM macro count for the full design."""
    n_banks = compute_n_banks(core.fetch_width)
    bank_width = compute_bank_width(core.fetch_width)

    total = 0

    # --- Fixed SRAMs ---
    # ROB compact_uop: 1
    total += 1

    # ICache tag array: 1
    total += 1

    # ICache data arrays: nBanks (same nBanks as BPD)
    total += n_banks

    # DCache metadata: 1 (from RocketChip L1Metadata)
    total += 1

    # DCache data arrays
    if core.num_dcache_banks == 1:
        # BoomDuplicatedDataArray: lsuWidth * nWays
        total += core.lsu_width * cache.dc_n_ways
    else:
        # BoomBankedDataArray: numDCacheBanks
        total += core.num_dcache_banks

    # FTQ: meta(1) + ghist(2) = 3
    total += 3

    # FTQ lhist: 1 if local history enabled
    use_lhist = bpd.local_history_n_sets > 1 and bpd.local_history_length > 1
    if use_lhist:
        total += 1

    # --- BPD SRAMs (multiplied by nBanks) ---
    bpd_per_bank = estimate_bpd_srams_per_bank(bpd, bank_width)
    total += bpd_per_bank * n_banks

    # Local history provider SRAMs (1 per bank if enabled)
    if bpd.local_history_n_sets > 0:
        total += n_banks

    return total


# ============================================================================
# Constraint checking
# ============================================================================

def check_constraints(core: CoreConfig, cache: CacheConfig, bpd: BPDConfig) -> Optional[str]:
    """Return None if valid, or error string if constraints violated."""
    fw = core.fetch_width
    dw = core.decode_width

    if fw not in (4, 8):
        return f"fetchWidth must be 4 or 8, got {fw}"
    if dw > fw:
        return f"decodeWidth ({dw}) > fetchWidth ({fw})"
    if dw < 1:
        return f"decodeWidth must be >= 1"
    if core.num_rob_entries % dw != 0:
        return f"numRobEntries ({core.num_rob_entries}) not divisible by decodeWidth ({dw})"
    if core.num_int_phys_regs < 32 + dw:
        return f"numIntPhysRegs ({core.num_int_phys_regs}) < 32 + decodeWidth ({32 + dw})"
    if core.num_fp_phys_regs < 32 + dw:
        return f"numFpPhysRegs ({core.num_fp_phys_regs}) < 32 + decodeWidth ({32 + dw})"
    if core.mem_issue_width < 2:
        return f"memIssueWidth ({core.mem_issue_width}) < 2"
    if core.mem_issue_width < core.lsu_width:
        return f"memIssueWidth ({core.mem_issue_width}) < lsuWidth ({core.lsu_width})"
    if core.max_br_count < 2:
        return f"maxBrCount ({core.max_br_count}) < 2"
    if core.num_ldq_entries - 1 <= dw:
        return f"numLdqEntries-1 ({core.num_ldq_entries - 1}) <= decodeWidth ({dw})"
    if core.num_stq_entries - 1 <= dw:
        return f"numStqEntries-1 ({core.num_stq_entries - 1}) <= decodeWidth ({dw})"
    if core.num_fetch_buffer_entries % dw != 0:
        return f"numFetchBufferEntries ({core.num_fetch_buffer_entries}) not divisible by decodeWidth ({dw})"

    # Tournament needs 2 resp_in inputs (requires HBIM or similar dual-input setup)
    if bpd.use_tourney and not bpd.use_hbim:
        return "Tournament requires HBIM (needs 2 inputs)"

    # Local history needs both nSets>1 and length>1 for useLHist
    if bpd.use_tourney and bpd.local_history_n_sets <= 1:
        return "Tournament with local HBIM requires localHistoryNSets > 1"

    return None


# ============================================================================
# Estimate BPD metadata length
# ============================================================================

def estimate_meta_length(bpd: BPDConfig, bank_width: int) -> int:
    """Rough estimate of total BPD metadata bits per bank."""
    meta = 0

    # TAGE meta: ~(1 + numTables * (1 + log2(numTables) + 3)) bits, roughly
    if bpd.tage_num_tables > 0:
        # provider index + alt bits + counter + tag bits per table
        meta += 1 + bpd.tage_num_tables * 2 + max(1, int(math.log2(bpd.tage_num_tables + 1))) + 2

    # BTB meta: small (tag match info)
    if not bpd.btb_use_flops:
        meta += 2
    if bpd.use_slow_btb:
        meta += 2

    # BIM meta: 2 bits per col
    if not bpd.bim_use_flops:
        meta += 2 * bank_width

    # HBIM: 2 bits
    if bpd.use_hbim:
        meta += 2 * bank_width

    # Tourney: 2 bits
    if bpd.use_tourney:
        meta += 2 * bank_width

    return meta


def max(a, b):
    return a if a > b else b


# ============================================================================
# Config space enumeration
# ============================================================================

# Pre-defined TAGE table configurations
TAGE_CONFIGS = {
    0: [],
    1: [(256, 16, 7)],
    2: [(128, 2, 7), (128, 4, 7)],
    3: [(128, 2, 7), (128, 8, 8), (128, 32, 9)],
    4: [(128, 2, 7), (128, 4, 7), (128, 16, 8), (128, 64, 9)],
    6: [(128, 2, 7), (128, 4, 7), (256, 8, 8), (256, 16, 8), (128, 32, 9), (128, 64, 9)],
    8: [(128, 2, 7), (128, 4, 7), (128, 8, 8), (128, 16, 8),
        (256, 32, 8), (256, 64, 9), (128, 80, 9), (128, 96, 9)],
    10: [(128, 2, 7), (128, 4, 7), (128, 8, 8), (128, 16, 8),
         (256, 32, 8), (256, 48, 9), (128, 64, 9), (128, 80, 9),
         (128, 96, 9), (128, 112, 9)],
}

# Core presets indexed by decodeWidth
CORE_PRESETS = {
    1: dict(num_rob_entries=32, num_int_phys_regs=52, num_fp_phys_regs=48,
            num_ldq_entries=8, num_stq_entries=8, max_br_count=8,
            mem_issue_width=2, mem_issue_entries=8,
            unq_issue_width=1, unq_issue_entries=8,
            alu_issue_width=1, alu_issue_entries=8,
            fp_issue_width=1, fp_issue_entries=8,
            num_irf_read_ports=3, num_irf_banks=1,
            num_frf_read_ports=3, num_frf_banks=1,
            ftq_entries=16, lsu_width=1),
    2: dict(num_rob_entries=64, num_int_phys_regs=80, num_fp_phys_regs=64,
            num_ldq_entries=16, num_stq_entries=16, max_br_count=12,
            mem_issue_width=2, mem_issue_entries=12,
            unq_issue_width=1, unq_issue_entries=12,
            alu_issue_width=2, alu_issue_entries=20,
            fp_issue_width=1, fp_issue_entries=12,
            num_irf_read_ports=5, num_irf_banks=2,
            num_frf_read_ports=3, num_frf_banks=1,
            ftq_entries=32, lsu_width=1),
    3: dict(num_rob_entries=96, num_int_phys_regs=100, num_fp_phys_regs=96,
            num_ldq_entries=24, num_stq_entries=24, max_br_count=16,
            mem_issue_width=2, mem_issue_entries=16,
            unq_issue_width=1, unq_issue_entries=16,
            alu_issue_width=3, alu_issue_entries=16,
            fp_issue_width=1, fp_issue_entries=24,
            num_irf_read_ports=6, num_irf_banks=2,
            num_frf_read_ports=3, num_frf_banks=1,
            ftq_entries=32, lsu_width=1,
            enable_column_alu_issue=True,
            alu_slow_entries=8, unq_slow_entries=8, fp_slow_entries=12),
    4: dict(num_rob_entries=128, num_int_phys_regs=144, num_fp_phys_regs=128,
            num_ldq_entries=32, num_stq_entries=32, max_br_count=20,
            mem_issue_width=3, mem_issue_entries=32,
            unq_issue_width=1, unq_issue_entries=20,
            alu_issue_width=4, alu_issue_entries=40,
            fp_issue_width=2, fp_issue_entries=32,
            num_irf_read_ports=4, num_irf_banks=4,
            num_frf_read_ports=6, num_frf_banks=1,
            ftq_entries=40, lsu_width=2,
            enable_prefetching=True,
            enable_superscalar_snapshots=True),
    5: dict(num_rob_entries=130, num_int_phys_regs=128, num_fp_phys_regs=128,
            num_ldq_entries=32, num_stq_entries=32, max_br_count=20,
            mem_issue_width=2, mem_issue_entries=32,
            unq_issue_width=1, unq_issue_entries=32,
            alu_issue_width=5, alu_issue_entries=20,
            fp_issue_width=2, fp_issue_entries=32,
            num_irf_read_ports=4, num_irf_banks=4,
            num_frf_read_ports=6, num_frf_banks=1,
            ftq_entries=40, lsu_width=2,
            enable_prefetching=True,
            enable_column_alu_issue=True,
            enable_superscalar_snapshots=False,
            alu_slow_entries=10, unq_slow_entries=24, fp_slow_entries=20, mem_slow_entries=12),
}


def make_core_config(name: str, fetch_width: int, decode_width: int,
                     num_dcache_banks: int) -> CoreConfig:
    """Create a CoreConfig from presets."""
    preset = CORE_PRESETS[decode_width].copy()

    # fetchWidth=4 constrains decodeWidth <= 4
    if fetch_width == 4 and decode_width > 4:
        return None

    # Adjust fetch buffer entries to be divisible by decodeWidth
    fb_entries = decode_width * 8
    if fb_entries % decode_width != 0:
        fb_entries = ((fb_entries // decode_width) + 1) * decode_width

    core = CoreConfig(
        name=name,
        fetch_width=fetch_width,
        decode_width=decode_width,
        num_fetch_buffer_entries=fb_entries,
        num_dcache_banks=num_dcache_banks,
        **{k: v for k, v in preset.items() if k not in ('enable_column_alu_issue',
            'enable_prefetching', 'enable_superscalar_snapshots',
            'alu_slow_entries', 'unq_slow_entries', 'fp_slow_entries', 'mem_slow_entries')},
    )

    # Apply optional flags
    for key in ('enable_column_alu_issue', 'enable_prefetching',
                'enable_superscalar_snapshots',
                'alu_slow_entries', 'unq_slow_entries', 'fp_slow_entries', 'mem_slow_entries'):
        if key in preset:
            setattr(core, key, preset[key])

    return core


def make_cache_config(fetch_width: int, dc_n_ways: int) -> CacheConfig:
    """Create cache config. fetchWidth=8 uses wider rows."""
    if fetch_width == 8:
        return CacheConfig(
            ic_row_bits=128, ic_n_sets=64, ic_n_ways=8, ic_fetch_bytes=16,
            dc_row_bits=128, dc_n_sets=64, dc_n_ways=dc_n_ways, dc_n_mshrs=4, dc_n_tlb_ways=16)
    else:
        return CacheConfig(
            ic_row_bits=64, ic_n_sets=64, ic_n_ways=4, ic_fetch_bytes=8,
            dc_row_bits=64, dc_n_sets=64, dc_n_ways=dc_n_ways, dc_n_mshrs=2, dc_n_tlb_ways=8)


def enumerate_configs(min_srams: int, max_srams: int) -> list:
    """Enumerate valid configurations and their estimated SRAM counts."""
    results = []

    fetch_widths = [4, 8]
    decode_widths_by_fw = {4: [1, 2, 3, 4], 8: [3, 4, 5]}
    tage_table_counts = [0, 1, 2, 3, 4, 6, 8, 10]
    btb_modes = [
        dict(btb_use_flops=True),
        dict(btb_use_flops=False, btb_n_ways=1),
        dict(btb_use_flops=False, btb_n_ways=2),
    ]
    slow_btb_modes = [
        dict(use_slow_btb=False),
        dict(use_slow_btb=True, slow_btb_n_ways=1),
        dict(use_slow_btb=True, slow_btb_n_ways=2),
    ]
    bim_modes = [
        dict(bim_use_flops=True),
        dict(bim_use_flops=False, bim_n_cols=2),
        dict(bim_use_flops=False, bim_n_cols=4),
        dict(bim_use_flops=False, bim_n_cols=8),
    ]
    hbim_tourney_modes = [
        dict(use_hbim=False, use_tourney=False, local_history_n_sets=0, local_history_length=1),
        dict(use_hbim=True, use_tourney=False, local_history_n_sets=0, local_history_length=1),
        dict(use_hbim=True, use_tourney=True, local_history_n_sets=128, local_history_length=32),
    ]
    ubtb_types = ["faubtb2", "gubtb", "ubtb"]
    dcache_configs = [
        dict(num_dcache_banks=1, dc_n_ways=1),
        dict(num_dcache_banks=1, dc_n_ways=2),
        dict(num_dcache_banks=1, dc_n_ways=4),
        dict(num_dcache_banks=2, dc_n_ways=4),
        dict(num_dcache_banks=4, dc_n_ways=4),
        dict(num_dcache_banks=4, dc_n_ways=8),
    ]

    config_id = 0

    for fw in fetch_widths:
        for dw in decode_widths_by_fw[fw]:
            for tage_n in tage_table_counts:
                for btb in btb_modes:
                    for sbtb in slow_btb_modes:
                        for bim in bim_modes:
                            for ht in hbim_tourney_modes:
                                for ubtb in ubtb_types:
                                    for dc in dcache_configs:
                                        name = f"MacroGenConfig{config_id}"

                                        # Build BPD config
                                        tage_info = TAGE_CONFIGS.get(tage_n, [])
                                        bpd = BPDConfig(
                                            name=name,
                                            tage_num_tables=tage_n,
                                            tage_table_info=tage_info,
                                            ubtb_type=ubtb,
                                            **btb, **sbtb, **bim, **ht,
                                        )

                                        # Build core config
                                        core = make_core_config(name, fw, dw, dc["num_dcache_banks"])
                                        if core is None:
                                            continue

                                        # Build cache config
                                        cache = make_cache_config(fw, dc["dc_n_ways"])

                                        # Check constraints
                                        err = check_constraints(core, cache, bpd)
                                        if err:
                                            continue

                                        # Check metadata budget
                                        bw = compute_bank_width(fw)
                                        meta_bits = estimate_meta_length(bpd, bw)
                                        if meta_bits > bpd.bpd_max_meta_length:
                                            continue

                                        # Estimate SRAM count
                                        sram_count = estimate_total_srams(core, cache, bpd)

                                        if min_srams <= sram_count <= max_srams:
                                            results.append((sram_count, config_id, core, cache, bpd))
                                            config_id += 1

    return results


# ============================================================================
# Scala code generation
# ============================================================================

def gen_tage_info_str(table_info: List[Tuple[int, int, int]]) -> str:
    """Generate Scala Seq of tuples for TAGE tableInfo."""
    entries = ", ".join(f"({n:>4}, {h:>4}, {t:>3})" for n, h, t in table_info)
    return f"Seq({entries})"


def gen_bpd_lambda(bpd: BPDConfig) -> str:
    """Generate Scala branch predictor lambda."""
    lines = []
    lines.append("((resp_in: BranchPredictionBankResponse, p: Parameters) => {")

    preds = []
    chain = []  # (varname, num_inputs)

    # uBTB variant (first in chain)
    if bpd.ubtb_type == "faubtb2":
        lines.append("        val ubtb = Module(new FA2MicroBTBBranchPredictorBank()(p))")
    elif bpd.ubtb_type == "gubtb":
        lines.append("        val ubtb = Module(new GMicroBTBBranchPredictorBank()(p))")
    elif bpd.ubtb_type == "faubtb":
        lines.append("        val ubtb = Module(new FAMicroBTBBranchPredictorBank()(p))")
    elif bpd.ubtb_type == "ubtb":
        lines.append(f"        val ubtb = Module(new MicroBTBBranchPredictorBank(BoomMicroBTBParams(nSets={bpd.ubtb_n_sets}))(p))")
    preds.append("ubtb")
    chain.append(("ubtb", 1))

    # BIM
    if not bpd.bim_use_flops:
        slow_str = "true" if bpd.bim_slow else "false"
        lines.append(f"        val bim = Module(new BIMBranchPredictorBank(BoomBIMParams(nSets={bpd.bim_n_sets}, singlePorted={str(bpd.bim_single_ported).lower()}, nCols={bpd.bim_n_cols}, slow={slow_str}))(p))")
        preds.append("bim")
        chain.append(("bim", 1))
    elif bpd.bim_use_flops and bpd.tage_num_tables > 0:
        # Use flop-based BIM as a base predictor for TAGE
        lines.append("        val bim = Module(new BIMBranchPredictorBank(BoomBIMParams(useFlops=true, nSets=128))(p))")
        preds.append("bim")
        chain.append(("bim", 1))

    # HBIM (global)
    if bpd.use_hbim:
        lines.append(f"        val gbim = Module(new HBIMBranchPredictorBank(BoomHBIMParams(nSets={bpd.hbim_n_sets}))(p))")
        preds.append("gbim")
        chain.append(("gbim", 1))

    # HBIM (local) - only if tournament is used
    if bpd.use_tourney:
        lines.append(f"        val lbim = Module(new HBIMBranchPredictorBank(BoomHBIMParams(nSets={bpd.hbim_n_sets}, useLocal=true))(p))")
        preds.append("lbim")

    # BTB
    if bpd.btb_use_flops:
        lines.append(f"        val btb = Module(new BTBBranchPredictorBank(BoomBTBParams(nSets={bpd.btb_n_sets}, nWays={bpd.btb_n_ways}, offsetSz=13, extendedNSets={bpd.btb_extended_n_sets}, useFlops=true))(p))")
    else:
        lines.append(f"        val btb = Module(new BTBBranchPredictorBank(BoomBTBParams(nSets={bpd.btb_n_sets}, nWays={bpd.btb_n_ways}, offsetSz=13, extendedNSets={bpd.btb_extended_n_sets}, useFlops=false))(p))")
    preds.append("btb")
    chain.append(("btb", 1))

    # SlowBTB
    if bpd.use_slow_btb:
        sp = "true" if bpd.slow_btb_single_ported else "false"
        lines.append(f"        val slowbtb = Module(new SlowBTBBranchPredictorBank(BoomSlowBTBParams(nSets={bpd.slow_btb_n_sets}, nWays={bpd.slow_btb_n_ways}, singlePorted={sp}))(p))")
        preds.append("slowbtb")
        chain.append(("slowbtb", 1))

    # Tournament
    if bpd.use_tourney:
        lines.append(f"        val tourney = Module(new TourneyBranchPredictorBank(BoomTourneyBPDParams(nSets={bpd.tourney_n_sets}))(p))")
        preds.append("tourney")
        # tourney has 2 inputs

    # TAGE
    if bpd.tage_num_tables > 0:
        tage_info = gen_tage_info_str(bpd.tage_table_info)
        sp = "true" if bpd.tage_single_ported else "false"
        lines.append(f"        val tage = Module(new TageBranchPredictorBank(BoomTageParams(tableInfo={tage_info}, singlePorted={sp}))(p))")
        preds.append("tage")
        chain.append(("tage", 1))

    # Generate pred list and wiring
    preds_str = ", ".join(preds)
    lines.append(f"        val preds = Seq({preds_str})")
    lines.append("        preds.map(_.io := DontCare)")
    lines.append("")

    # Wire the chain: resp_in → ubtb → bim → ... → last
    if bpd.use_tourney:
        # Alpha21264-style: gbim and lbim feed tourney, tourney feeds btb, etc.
        lines.append("        ubtb.io.resp_in(0) := resp_in")
        # gbim gets ubtb output
        lines.append("        gbim.io.resp_in(0) := ubtb.io.resp")
        lines.append("        lbim.io.resp_in(0) := ubtb.io.resp")
        lines.append("        tourney.io.resp_in(0) := gbim.io.resp")
        lines.append("        tourney.io.resp_in(1) := lbim.io.resp")
        prev_resp = "tourney.io.resp"
        # Continue chain with btb, slowbtb, tage
        remaining = [c for c in chain if c[0] not in ("ubtb", "gbim")]
        for varname, _ in remaining:
            lines.append(f"        {varname}.io.resp_in(0) := {prev_resp}")
            prev_resp = f"{varname}.io.resp"
    else:
        prev_resp = "resp_in"
        for varname, _ in chain:
            lines.append(f"        {varname}.io.resp_in(0) := {prev_resp}")
            prev_resp = f"{varname}.io.resp"

    # Last predictor's response is the output
    last_pred = chain[-1][0] if chain else "ubtb"
    lines.append(f"        (preds, {last_pred}.io.resp)")
    lines.append("      })")

    return "\n".join(lines)


def gen_issue_params(core: CoreConfig) -> str:
    """Generate Scala IssueParams sequence."""
    dw = core.decode_width
    parts = []

    mem_slow = f", numSlowEntries={core.mem_slow_entries}" if core.mem_slow_entries > 0 else ""
    parts.append(f"IssueParams(issueWidth={core.mem_issue_width}, numEntries={core.mem_issue_entries}, iqType=IQ_MEM, dispatchWidth={dw}{mem_slow})")

    unq_slow = f", numSlowEntries={core.unq_slow_entries}" if core.unq_slow_entries > 0 else ""
    parts.append(f"IssueParams(issueWidth={core.unq_issue_width}, numEntries={core.unq_issue_entries}, iqType=IQ_UNQ, dispatchWidth={dw}{unq_slow})")

    alu_slow = f", numSlowEntries={core.alu_slow_entries}" if core.alu_slow_entries > 0 else ""
    parts.append(f"IssueParams(issueWidth={core.alu_issue_width}, numEntries={core.alu_issue_entries}, iqType=IQ_ALU, dispatchWidth={dw}{alu_slow})")

    fp_slow = f", numSlowEntries={core.fp_slow_entries}" if core.fp_slow_entries > 0 else ""
    parts.append(f"IssueParams(issueWidth={core.fp_issue_width}, numEntries={core.fp_issue_entries}, iqType=IQ_FP, dispatchWidth={dw}{fp_slow})")

    joined = ",\n                ".join(parts)
    return f"Seq(\n                {joined})"


def gen_config_class(idx: int, core: CoreConfig, cache: CacheConfig, bpd: BPDConfig, sram_count: int) -> str:
    """Generate a single Scala config class."""
    bpd_lambda = gen_bpd_lambda(bpd)
    issue_params = gen_issue_params(core)

    slow_btb_line = ""
    if bpd.use_slow_btb:
        slow_btb_line = "\n              enableSlowBTBRedirect = true,"

    prefetch_line = ""
    if core.enable_prefetching:
        prefetch_line = "\n              enablePrefetching = true,"

    column_alu_line = ""
    if core.enable_column_alu_issue:
        column_alu_line = "\n              enableColumnALUIssue = true,"

    superscalar_snap = ""
    if not core.enable_superscalar_snapshots:
        superscalar_snap = "\n              enableSuperscalarSnapshots = false,"

    lines = f"""
/**
 * MacroGenConfig{idx}: estimated {sram_count} SRAM macros
 * fetchWidth={core.fetch_width}, decodeWidth={core.decode_width}, dcacheBanks={core.num_dcache_banks}
 * BPD: TAGE({bpd.tage_num_tables}), BTB(flops={bpd.btb_use_flops}), SlowBTB={bpd.use_slow_btb}, BIM(flops={bpd.bim_use_flops}, cols={bpd.bim_n_cols}), HBIM={bpd.use_hbim}, Tourney={bpd.use_tourney}, uBTB={bpd.ubtb_type}
 */
class MacroGenConfig{idx} extends Config(
  new Config((site, here, up) => {{
    case TilesLocated(InSubsystem) => {{
      val prev = up(TilesLocated(InSubsystem), site)
      val idOffset = up(NumTiles)
      Seq(BoomTileAttachParams(
        tileParams = BoomTileParams(
          core = BoomCoreParams(
            fetchWidth = {core.fetch_width},
            decodeWidth = {core.decode_width},
            numRobEntries = {core.num_rob_entries},
            issueParams = {issue_params},
            lsuWidth = {core.lsu_width},
            numIntPhysRegisters = {core.num_int_phys_regs},
            numFpPhysRegisters = {core.num_fp_phys_regs},
            numIrfReadPorts = {core.num_irf_read_ports},
            numIrfBanks = {core.num_irf_banks},
            numFrfReadPorts = {core.num_frf_read_ports},
            numFrfBanks = {core.num_frf_banks},
            numLdqEntries = {core.num_ldq_entries},
            numStqEntries = {core.num_stq_entries},
            maxBrCount = {core.max_br_count},
            numFetchBufferEntries = {core.num_fetch_buffer_entries},
            numDCacheBanks = {core.num_dcache_banks},{slow_btb_line}{prefetch_line}{column_alu_line}{superscalar_snap}
            ftq = FtqParameters(nEntries={core.ftq_entries}),
            bpdMaxMetaLength = {bpd.bpd_max_meta_length},
            globalHistoryLength = {bpd.global_history_length},
            localHistoryLength = {bpd.local_history_length},
            localHistoryNSets = {bpd.local_history_n_sets},
            branchPredictor = {bpd_lambda},
            fpu = Some(freechips.rocketchip.tile.FPUParams(sfmaLatency=4, dfmaLatency=4, divSqrt=true))
          ),
          dcache = Some(DCacheParams(rowBits={cache.dc_row_bits}, nSets={cache.dc_n_sets}, nWays={cache.dc_n_ways}, nMSHRs={cache.dc_n_mshrs}, nTLBWays={cache.dc_n_tlb_ways})),
          icache = Some(ICacheParams(rowBits={cache.ic_row_bits}, nSets={cache.ic_n_sets}, nWays={cache.ic_n_ways}, fetchBytes={cache.ic_fetch_bytes})),
          tileId = idOffset
        ),
        crossingParams = RocketCrossingParams()
      )) ++ prev
    }}
    case NumTiles => up(NumTiles) + 1
  }})
)"""
    return lines


def gen_scala_file(configs: list) -> str:
    """Generate the complete Scala file with all config classes."""
    header = """//******************************************************************************
// Auto-generated by scripts/generate_configs.py
// BOOM SRAM Macro Config Generator for Macroplacement Training Data
//******************************************************************************

package boom.v4.macrogen

import chisel3._
import chisel3.util._

import org.chipsalliance.cde.config.{Parameters, Config, Field}
import freechips.rocketchip.subsystem._
import freechips.rocketchip.prci.{SynchronousCrossing}
import freechips.rocketchip.rocket._
import freechips.rocketchip.tile._

import boom.v4.common._
import boom.v4.ifu._
import boom.v4.exu._
import boom.v4.lsu._
"""

    body = "\n".join(
        gen_config_class(idx, core, cache, bpd, sram_count)
        for sram_count, idx, core, cache, bpd in configs
    )

    # Generate a manifest object listing all configs
    manifest_entries = ",\n    ".join(
        f'("{core.name}", classOf[MacroGenConfig{idx}], {sram_count})'
        for sram_count, idx, core, cache, bpd in configs
    )
    manifest = f"""

/**
 * Manifest of all generated configs with estimated SRAM counts.
 */
object MacroGenManifest {{
  val configs: Seq[(String, Class[_ <: Config], Int)] = Seq(
    {manifest_entries}
  )
}}
"""

    return header + body + manifest


# ============================================================================
# Main
# ============================================================================

def main():
    parser = argparse.ArgumentParser(description="BOOM SRAM Macro Config Generator")
    parser.add_argument("--min-srams", type=int, default=5, help="Minimum SRAM count")
    parser.add_argument("--max-srams", type=int, default=50, help="Maximum SRAM count")
    parser.add_argument("--num-configs", type=int, default=50, help="Number of configs to generate")
    parser.add_argument("--output", type=str,
                        default="src/main/scala/v4/macrogen/GeneratedConfigs.scala",
                        help="Output Scala file path")
    parser.add_argument("--manifest-json", type=str, default=None,
                        help="Also write config manifest as JSON")
    parser.add_argument("--seed", type=int, default=42, help="Random seed for sampling")
    args = parser.parse_args()

    random.seed(args.seed)

    print(f"Enumerating configs with {args.min_srams}–{args.max_srams} SRAMs...")
    all_configs = enumerate_configs(args.min_srams, args.max_srams)
    print(f"Found {len(all_configs)} valid configurations")

    if len(all_configs) == 0:
        print("ERROR: No valid configs found in range", file=sys.stderr)
        sys.exit(1)

    # Group by SRAM count and sample across the range
    by_count = {}
    for cfg in all_configs:
        sram_count = cfg[0]
        by_count.setdefault(sram_count, []).append(cfg)

    sram_counts = sorted(by_count.keys())
    print(f"SRAM count range: {sram_counts[0]}–{sram_counts[-1]}")
    print(f"Unique SRAM counts: {len(sram_counts)}")

    # Sample configs to span the range evenly
    selected = []
    if len(all_configs) <= args.num_configs:
        # Use all if fewer than requested
        selected = all_configs
    else:
        # Sample evenly across SRAM counts
        target_per_count = max(1, args.num_configs // len(sram_counts))
        for count in sram_counts:
            candidates = by_count[count]
            n_pick = min(target_per_count, len(candidates))
            selected.extend(random.sample(candidates, n_pick))

        # If we still need more, fill from underrepresented counts
        if len(selected) < args.num_configs:
            remaining = [c for c in all_configs if c not in selected]
            extra = min(args.num_configs - len(selected), len(remaining))
            selected.extend(random.sample(remaining, extra))

        # If too many, trim
        if len(selected) > args.num_configs:
            selected = selected[:args.num_configs]

    # Re-index
    selected.sort(key=lambda x: x[0])  # sort by SRAM count
    reindexed = []
    for i, (sram_count, _, core, cache, bpd) in enumerate(selected):
        core.name = f"MacroGenConfig{i}"
        bpd.name = f"MacroGenConfig{i}"
        reindexed.append((sram_count, i, core, cache, bpd))

    print(f"Selected {len(reindexed)} configs")
    for sram_count, idx, core, cache, bpd in reindexed:
        print(f"  Config{idx}: {sram_count} SRAMs (fw={core.fetch_width}, dw={core.decode_width}, "
              f"tage={bpd.tage_num_tables}, dcBanks={core.num_dcache_banks}, dcWays={cache.dc_n_ways})")

    # Generate Scala
    scala_code = gen_scala_file(reindexed)

    output_path = os.path.join(os.getcwd(), args.output)
    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    with open(output_path, 'w') as f:
        f.write(scala_code)
    print(f"\nWrote {output_path}")

    # Optionally write JSON manifest
    if args.manifest_json:
        manifest = []
        for sram_count, idx, core, cache, bpd in reindexed:
            manifest.append({
                "config_name": f"MacroGenConfig{idx}",
                "config_class": f"boom.v4.macrogen.MacroGenConfig{idx}",
                "estimated_srams": sram_count,
                "fetch_width": core.fetch_width,
                "decode_width": core.decode_width,
                "tage_tables": bpd.tage_num_tables,
                "dcache_banks": core.num_dcache_banks,
                "dcache_ways": cache.dc_n_ways,
                "btb_flops": bpd.btb_use_flops,
                "slow_btb": bpd.use_slow_btb,
                "bim_flops": bpd.bim_use_flops,
                "bim_cols": bpd.bim_n_cols,
                "hbim": bpd.use_hbim,
                "tourney": bpd.use_tourney,
                "ubtb_type": bpd.ubtb_type,
            })
        json_path = os.path.join(os.getcwd(), args.manifest_json)
        os.makedirs(os.path.dirname(json_path) or ".", exist_ok=True)
        with open(json_path, 'w') as f:
            json.dump(manifest, f, indent=2)
        print(f"Wrote {json_path}")


if __name__ == "__main__":
    main()
