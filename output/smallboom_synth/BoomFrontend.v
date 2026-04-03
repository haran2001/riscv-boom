module BoomFrontend (
	clock,
	reset,
	auto_icache_master_out_a_ready,
	auto_icache_master_out_a_valid,
	auto_icache_master_out_a_bits_address,
	auto_icache_master_out_d_valid,
	auto_icache_master_out_d_bits_opcode,
	auto_icache_master_out_d_bits_size,
	auto_icache_master_out_d_bits_data,
	io_cpu_fetchpacket_ready,
	io_cpu_fetchpacket_valid,
	io_cpu_fetchpacket_bits_uops_0_valid,
	io_cpu_fetchpacket_bits_uops_0_bits_inst,
	io_cpu_fetchpacket_bits_uops_0_bits_debug_inst,
	io_cpu_fetchpacket_bits_uops_0_bits_is_rvc,
	io_cpu_fetchpacket_bits_uops_0_bits_debug_pc,
	io_cpu_fetchpacket_bits_uops_0_bits_is_sfb,
	io_cpu_fetchpacket_bits_uops_0_bits_ftq_idx,
	io_cpu_fetchpacket_bits_uops_0_bits_edge_inst,
	io_cpu_fetchpacket_bits_uops_0_bits_pc_lob,
	io_cpu_fetchpacket_bits_uops_0_bits_taken,
	io_cpu_fetchpacket_bits_uops_0_bits_xcpt_pf_if,
	io_cpu_fetchpacket_bits_uops_0_bits_xcpt_ae_if,
	io_cpu_fetchpacket_bits_uops_0_bits_bp_debug_if,
	io_cpu_fetchpacket_bits_uops_0_bits_bp_xcpt_if,
	io_cpu_fetchpacket_bits_uops_0_bits_debug_fsrc,
	io_cpu_arb_ftq_reqs_0,
	io_cpu_arb_ftq_reqs_1,
	io_cpu_arb_ftq_reqs_2,
	io_cpu_rrd_ftq_resps_0_entry_cfi_idx_bits,
	io_cpu_rrd_ftq_resps_0_entry_br_mask,
	io_cpu_rrd_ftq_resps_0_entry_cfi_is_call,
	io_cpu_rrd_ftq_resps_0_entry_cfi_is_ret,
	io_cpu_rrd_ftq_resps_0_entry_ras_idx,
	io_cpu_rrd_ftq_resps_0_entry_start_bank,
	io_cpu_rrd_ftq_resps_0_ghist_old_history,
	io_cpu_rrd_ftq_resps_0_ghist_current_saw_branch_not_taken,
	io_cpu_rrd_ftq_resps_0_ghist_new_saw_branch_not_taken,
	io_cpu_rrd_ftq_resps_0_ghist_new_saw_branch_taken,
	io_cpu_rrd_ftq_resps_0_ghist_ras_idx,
	io_cpu_rrd_ftq_resps_0_pc,
	io_cpu_rrd_ftq_resps_1_valid,
	io_cpu_rrd_ftq_resps_1_entry_cfi_idx_valid,
	io_cpu_rrd_ftq_resps_1_entry_cfi_idx_bits,
	io_cpu_rrd_ftq_resps_1_entry_start_bank,
	io_cpu_rrd_ftq_resps_1_pc,
	io_cpu_rrd_ftq_resps_2_valid,
	io_cpu_rrd_ftq_resps_2_entry_cfi_idx_valid,
	io_cpu_rrd_ftq_resps_2_entry_cfi_idx_bits,
	io_cpu_rrd_ftq_resps_2_entry_start_bank,
	io_cpu_rrd_ftq_resps_2_pc,
	io_cpu_com_pc,
	io_cpu_sfence_valid,
	io_cpu_sfence_bits_rs1,
	io_cpu_sfence_bits_rs2,
	io_cpu_sfence_bits_addr,
	io_cpu_brupdate_b2_uop_ftq_idx,
	io_cpu_brupdate_b2_uop_pc_lob,
	io_cpu_brupdate_b2_mispredict,
	io_cpu_brupdate_b2_taken,
	io_cpu_redirect_flush,
	io_cpu_redirect_val,
	io_cpu_redirect_pc,
	io_cpu_redirect_ftq_idx,
	io_cpu_redirect_ghist_old_history,
	io_cpu_redirect_ghist_current_saw_branch_not_taken,
	io_cpu_redirect_ghist_new_saw_branch_not_taken,
	io_cpu_redirect_ghist_new_saw_branch_taken,
	io_cpu_redirect_ghist_ras_idx,
	io_cpu_commit_valid,
	io_cpu_commit_bits,
	io_cpu_flush_icache,
	io_cpu_enable_bpd,
	io_cpu_perf_acquire,
	io_cpu_perf_tlbMiss,
	io_ptw_req_ready,
	io_ptw_req_valid,
	io_ptw_req_bits_bits_addr,
	io_ptw_req_bits_bits_need_gpa,
	io_ptw_resp_valid,
	io_ptw_resp_bits_ae_ptw,
	io_ptw_resp_bits_ae_final,
	io_ptw_resp_bits_pf,
	io_ptw_resp_bits_gf,
	io_ptw_resp_bits_hr,
	io_ptw_resp_bits_hw,
	io_ptw_resp_bits_hx,
	io_ptw_resp_bits_pte_ppn,
	io_ptw_resp_bits_pte_d,
	io_ptw_resp_bits_pte_a,
	io_ptw_resp_bits_pte_g,
	io_ptw_resp_bits_pte_u,
	io_ptw_resp_bits_pte_x,
	io_ptw_resp_bits_pte_w,
	io_ptw_resp_bits_pte_r,
	io_ptw_resp_bits_pte_v,
	io_ptw_resp_bits_level,
	io_ptw_resp_bits_homogeneous,
	io_ptw_ptbr_mode,
	io_ptw_status_debug,
	io_ptw_status_prv,
	io_ptw_pmp_0_cfg_l,
	io_ptw_pmp_0_cfg_a,
	io_ptw_pmp_0_cfg_x,
	io_ptw_pmp_0_cfg_w,
	io_ptw_pmp_0_cfg_r,
	io_ptw_pmp_0_addr,
	io_ptw_pmp_0_mask,
	io_ptw_pmp_1_cfg_l,
	io_ptw_pmp_1_cfg_a,
	io_ptw_pmp_1_cfg_x,
	io_ptw_pmp_1_cfg_w,
	io_ptw_pmp_1_cfg_r,
	io_ptw_pmp_1_addr,
	io_ptw_pmp_1_mask,
	io_ptw_pmp_2_cfg_l,
	io_ptw_pmp_2_cfg_a,
	io_ptw_pmp_2_cfg_x,
	io_ptw_pmp_2_cfg_w,
	io_ptw_pmp_2_cfg_r,
	io_ptw_pmp_2_addr,
	io_ptw_pmp_2_mask,
	io_ptw_pmp_3_cfg_l,
	io_ptw_pmp_3_cfg_a,
	io_ptw_pmp_3_cfg_x,
	io_ptw_pmp_3_cfg_w,
	io_ptw_pmp_3_cfg_r,
	io_ptw_pmp_3_addr,
	io_ptw_pmp_3_mask,
	io_ptw_pmp_4_cfg_l,
	io_ptw_pmp_4_cfg_a,
	io_ptw_pmp_4_cfg_x,
	io_ptw_pmp_4_cfg_w,
	io_ptw_pmp_4_cfg_r,
	io_ptw_pmp_4_addr,
	io_ptw_pmp_4_mask,
	io_ptw_pmp_5_cfg_l,
	io_ptw_pmp_5_cfg_a,
	io_ptw_pmp_5_cfg_x,
	io_ptw_pmp_5_cfg_w,
	io_ptw_pmp_5_cfg_r,
	io_ptw_pmp_5_addr,
	io_ptw_pmp_5_mask,
	io_ptw_pmp_6_cfg_l,
	io_ptw_pmp_6_cfg_a,
	io_ptw_pmp_6_cfg_x,
	io_ptw_pmp_6_cfg_w,
	io_ptw_pmp_6_cfg_r,
	io_ptw_pmp_6_addr,
	io_ptw_pmp_6_mask,
	io_ptw_pmp_7_cfg_l,
	io_ptw_pmp_7_cfg_a,
	io_ptw_pmp_7_cfg_x,
	io_ptw_pmp_7_cfg_w,
	io_ptw_pmp_7_cfg_r,
	io_ptw_pmp_7_addr,
	io_ptw_pmp_7_mask
);
	input clock;
	input reset;
	input auto_icache_master_out_a_ready;
	output wire auto_icache_master_out_a_valid;
	output wire [31:0] auto_icache_master_out_a_bits_address;
	input auto_icache_master_out_d_valid;
	input [2:0] auto_icache_master_out_d_bits_opcode;
	input [3:0] auto_icache_master_out_d_bits_size;
	input [63:0] auto_icache_master_out_d_bits_data;
	input io_cpu_fetchpacket_ready;
	output wire io_cpu_fetchpacket_valid;
	output wire io_cpu_fetchpacket_bits_uops_0_valid;
	output wire [31:0] io_cpu_fetchpacket_bits_uops_0_bits_inst;
	output wire [31:0] io_cpu_fetchpacket_bits_uops_0_bits_debug_inst;
	output wire io_cpu_fetchpacket_bits_uops_0_bits_is_rvc;
	output wire [39:0] io_cpu_fetchpacket_bits_uops_0_bits_debug_pc;
	output wire io_cpu_fetchpacket_bits_uops_0_bits_is_sfb;
	output wire [3:0] io_cpu_fetchpacket_bits_uops_0_bits_ftq_idx;
	output wire io_cpu_fetchpacket_bits_uops_0_bits_edge_inst;
	output wire [5:0] io_cpu_fetchpacket_bits_uops_0_bits_pc_lob;
	output wire io_cpu_fetchpacket_bits_uops_0_bits_taken;
	output wire io_cpu_fetchpacket_bits_uops_0_bits_xcpt_pf_if;
	output wire io_cpu_fetchpacket_bits_uops_0_bits_xcpt_ae_if;
	output wire io_cpu_fetchpacket_bits_uops_0_bits_bp_debug_if;
	output wire io_cpu_fetchpacket_bits_uops_0_bits_bp_xcpt_if;
	output wire [2:0] io_cpu_fetchpacket_bits_uops_0_bits_debug_fsrc;
	input [3:0] io_cpu_arb_ftq_reqs_0;
	input [3:0] io_cpu_arb_ftq_reqs_1;
	input [3:0] io_cpu_arb_ftq_reqs_2;
	output wire [1:0] io_cpu_rrd_ftq_resps_0_entry_cfi_idx_bits;
	output wire [3:0] io_cpu_rrd_ftq_resps_0_entry_br_mask;
	output wire io_cpu_rrd_ftq_resps_0_entry_cfi_is_call;
	output wire io_cpu_rrd_ftq_resps_0_entry_cfi_is_ret;
	output wire [4:0] io_cpu_rrd_ftq_resps_0_entry_ras_idx;
	output wire io_cpu_rrd_ftq_resps_0_entry_start_bank;
	output wire [63:0] io_cpu_rrd_ftq_resps_0_ghist_old_history;
	output wire io_cpu_rrd_ftq_resps_0_ghist_current_saw_branch_not_taken;
	output wire io_cpu_rrd_ftq_resps_0_ghist_new_saw_branch_not_taken;
	output wire io_cpu_rrd_ftq_resps_0_ghist_new_saw_branch_taken;
	output wire [4:0] io_cpu_rrd_ftq_resps_0_ghist_ras_idx;
	output wire [39:0] io_cpu_rrd_ftq_resps_0_pc;
	output wire io_cpu_rrd_ftq_resps_1_valid;
	output wire io_cpu_rrd_ftq_resps_1_entry_cfi_idx_valid;
	output wire [1:0] io_cpu_rrd_ftq_resps_1_entry_cfi_idx_bits;
	output wire io_cpu_rrd_ftq_resps_1_entry_start_bank;
	output wire [39:0] io_cpu_rrd_ftq_resps_1_pc;
	output wire io_cpu_rrd_ftq_resps_2_valid;
	output wire io_cpu_rrd_ftq_resps_2_entry_cfi_idx_valid;
	output wire [1:0] io_cpu_rrd_ftq_resps_2_entry_cfi_idx_bits;
	output wire io_cpu_rrd_ftq_resps_2_entry_start_bank;
	output wire [39:0] io_cpu_rrd_ftq_resps_2_pc;
	output wire [39:0] io_cpu_com_pc;
	input io_cpu_sfence_valid;
	input io_cpu_sfence_bits_rs1;
	input io_cpu_sfence_bits_rs2;
	input [38:0] io_cpu_sfence_bits_addr;
	input [3:0] io_cpu_brupdate_b2_uop_ftq_idx;
	input [5:0] io_cpu_brupdate_b2_uop_pc_lob;
	input io_cpu_brupdate_b2_mispredict;
	input io_cpu_brupdate_b2_taken;
	input io_cpu_redirect_flush;
	input io_cpu_redirect_val;
	input [39:0] io_cpu_redirect_pc;
	input [3:0] io_cpu_redirect_ftq_idx;
	input [63:0] io_cpu_redirect_ghist_old_history;
	input io_cpu_redirect_ghist_current_saw_branch_not_taken;
	input io_cpu_redirect_ghist_new_saw_branch_not_taken;
	input io_cpu_redirect_ghist_new_saw_branch_taken;
	input [4:0] io_cpu_redirect_ghist_ras_idx;
	input io_cpu_commit_valid;
	input [15:0] io_cpu_commit_bits;
	input io_cpu_flush_icache;
	input io_cpu_enable_bpd;
	output wire io_cpu_perf_acquire;
	output wire io_cpu_perf_tlbMiss;
	input io_ptw_req_ready;
	output wire io_ptw_req_valid;
	output wire [26:0] io_ptw_req_bits_bits_addr;
	output wire io_ptw_req_bits_bits_need_gpa;
	input io_ptw_resp_valid;
	input io_ptw_resp_bits_ae_ptw;
	input io_ptw_resp_bits_ae_final;
	input io_ptw_resp_bits_pf;
	input io_ptw_resp_bits_gf;
	input io_ptw_resp_bits_hr;
	input io_ptw_resp_bits_hw;
	input io_ptw_resp_bits_hx;
	input [43:0] io_ptw_resp_bits_pte_ppn;
	input io_ptw_resp_bits_pte_d;
	input io_ptw_resp_bits_pte_a;
	input io_ptw_resp_bits_pte_g;
	input io_ptw_resp_bits_pte_u;
	input io_ptw_resp_bits_pte_x;
	input io_ptw_resp_bits_pte_w;
	input io_ptw_resp_bits_pte_r;
	input io_ptw_resp_bits_pte_v;
	input [1:0] io_ptw_resp_bits_level;
	input io_ptw_resp_bits_homogeneous;
	input [3:0] io_ptw_ptbr_mode;
	input io_ptw_status_debug;
	input [1:0] io_ptw_status_prv;
	input io_ptw_pmp_0_cfg_l;
	input [1:0] io_ptw_pmp_0_cfg_a;
	input io_ptw_pmp_0_cfg_x;
	input io_ptw_pmp_0_cfg_w;
	input io_ptw_pmp_0_cfg_r;
	input [29:0] io_ptw_pmp_0_addr;
	input [31:0] io_ptw_pmp_0_mask;
	input io_ptw_pmp_1_cfg_l;
	input [1:0] io_ptw_pmp_1_cfg_a;
	input io_ptw_pmp_1_cfg_x;
	input io_ptw_pmp_1_cfg_w;
	input io_ptw_pmp_1_cfg_r;
	input [29:0] io_ptw_pmp_1_addr;
	input [31:0] io_ptw_pmp_1_mask;
	input io_ptw_pmp_2_cfg_l;
	input [1:0] io_ptw_pmp_2_cfg_a;
	input io_ptw_pmp_2_cfg_x;
	input io_ptw_pmp_2_cfg_w;
	input io_ptw_pmp_2_cfg_r;
	input [29:0] io_ptw_pmp_2_addr;
	input [31:0] io_ptw_pmp_2_mask;
	input io_ptw_pmp_3_cfg_l;
	input [1:0] io_ptw_pmp_3_cfg_a;
	input io_ptw_pmp_3_cfg_x;
	input io_ptw_pmp_3_cfg_w;
	input io_ptw_pmp_3_cfg_r;
	input [29:0] io_ptw_pmp_3_addr;
	input [31:0] io_ptw_pmp_3_mask;
	input io_ptw_pmp_4_cfg_l;
	input [1:0] io_ptw_pmp_4_cfg_a;
	input io_ptw_pmp_4_cfg_x;
	input io_ptw_pmp_4_cfg_w;
	input io_ptw_pmp_4_cfg_r;
	input [29:0] io_ptw_pmp_4_addr;
	input [31:0] io_ptw_pmp_4_mask;
	input io_ptw_pmp_5_cfg_l;
	input [1:0] io_ptw_pmp_5_cfg_a;
	input io_ptw_pmp_5_cfg_x;
	input io_ptw_pmp_5_cfg_w;
	input io_ptw_pmp_5_cfg_r;
	input [29:0] io_ptw_pmp_5_addr;
	input [31:0] io_ptw_pmp_5_mask;
	input io_ptw_pmp_6_cfg_l;
	input [1:0] io_ptw_pmp_6_cfg_a;
	input io_ptw_pmp_6_cfg_x;
	input io_ptw_pmp_6_cfg_w;
	input io_ptw_pmp_6_cfg_r;
	input [29:0] io_ptw_pmp_6_addr;
	input [31:0] io_ptw_pmp_6_mask;
	input io_ptw_pmp_7_cfg_l;
	input [1:0] io_ptw_pmp_7_cfg_a;
	input io_ptw_pmp_7_cfg_x;
	input io_ptw_pmp_7_cfg_w;
	input io_ptw_pmp_7_cfg_r;
	input [29:0] io_ptw_pmp_7_addr;
	input [31:0] io_ptw_pmp_7_mask;
	wire f1_clear;
	wire f2_clear;
	wire f3_clear;
	wire f4_clear;
	wire [39:0] s0_vpc;
	wire s0_valid;
	reg jump_to_reset;
	wire [63:0] _GEN;
	wire [4:0] _GEN_0;
	wire _f4_io_enq_valid_T_1;
	wire [1:0] f3_fetch_bundle_cfi_idx_bits;
	wire f3_br_mask_3;
	wire f3_mask_3;
	wire f3_br_mask_2;
	wire f3_mask_2;
	wire f3_br_mask_1;
	wire f3_mask_1;
	wire f3_br_mask_0;
	wire f3_mask_0;
	wire valid_3;
	wire f2_inst_mask_3;
	wire valid_2;
	wire f2_inst_mask_2;
	wire valid_1;
	wire f2_inst_mask_1;
	wire f2_inst_mask_0;
	wire _bpd_update_arbiter_io_in_1_ready;
	wire _bpd_update_arbiter_io_out_valid;
	wire _bpd_update_arbiter_io_out_bits_is_mispredict_update;
	wire _bpd_update_arbiter_io_out_bits_is_repair_update;
	wire [3:0] _bpd_update_arbiter_io_out_bits_btb_mispredicts;
	wire [39:0] _bpd_update_arbiter_io_out_bits_pc;
	wire [3:0] _bpd_update_arbiter_io_out_bits_br_mask;
	wire _bpd_update_arbiter_io_out_bits_cfi_idx_valid;
	wire [1:0] _bpd_update_arbiter_io_out_bits_cfi_idx_bits;
	wire _bpd_update_arbiter_io_out_bits_cfi_taken;
	wire _bpd_update_arbiter_io_out_bits_cfi_mispredicted;
	wire _bpd_update_arbiter_io_out_bits_cfi_is_br;
	wire _bpd_update_arbiter_io_out_bits_cfi_is_jal;
	wire _bpd_update_arbiter_io_out_bits_cfi_is_jalr;
	wire [63:0] _bpd_update_arbiter_io_out_bits_ghist_old_history;
	wire [39:0] _bpd_update_arbiter_io_out_bits_target;
	wire [119:0] _bpd_update_arbiter_io_out_bits_meta_0;
	wire _ftq_io_enq_ready;
	wire [3:0] _ftq_io_enq_idx;
	wire _ftq_io_bpdupdate_valid;
	wire _ftq_io_bpdupdate_bits_is_mispredict_update;
	wire _ftq_io_bpdupdate_bits_is_repair_update;
	wire [39:0] _ftq_io_bpdupdate_bits_pc;
	wire [3:0] _ftq_io_bpdupdate_bits_br_mask;
	wire _ftq_io_bpdupdate_bits_cfi_idx_valid;
	wire [1:0] _ftq_io_bpdupdate_bits_cfi_idx_bits;
	wire _ftq_io_bpdupdate_bits_cfi_taken;
	wire _ftq_io_bpdupdate_bits_cfi_mispredicted;
	wire _ftq_io_bpdupdate_bits_cfi_is_br;
	wire _ftq_io_bpdupdate_bits_cfi_is_jal;
	wire [63:0] _ftq_io_bpdupdate_bits_ghist_old_history;
	wire [39:0] _ftq_io_bpdupdate_bits_target;
	wire [119:0] _ftq_io_bpdupdate_bits_meta_0;
	wire _ftq_io_ras_update;
	wire [4:0] _ftq_io_ras_update_idx;
	wire [39:0] _ftq_io_ras_update_pc;
	wire _fb_io_enq_ready;
	wire _f4_io_enq_ready;
	wire _f4_io_deq_valid;
	wire [39:0] _f4_io_deq_bits_pc;
	wire [39:0] _f4_io_deq_bits_next_pc;
	wire _f4_io_deq_bits_edge_inst_0;
	wire [31:0] _f4_io_deq_bits_insts_0;
	wire [31:0] _f4_io_deq_bits_insts_1;
	wire [31:0] _f4_io_deq_bits_insts_2;
	wire [31:0] _f4_io_deq_bits_insts_3;
	wire [31:0] _f4_io_deq_bits_exp_insts_0;
	wire [31:0] _f4_io_deq_bits_exp_insts_1;
	wire [31:0] _f4_io_deq_bits_exp_insts_2;
	wire [31:0] _f4_io_deq_bits_exp_insts_3;
	wire _f4_io_deq_bits_sfbs_0;
	wire _f4_io_deq_bits_sfbs_1;
	wire _f4_io_deq_bits_sfbs_2;
	wire _f4_io_deq_bits_sfbs_3;
	wire [7:0] _f4_io_deq_bits_sfb_masks_0;
	wire [7:0] _f4_io_deq_bits_sfb_masks_1;
	wire [7:0] _f4_io_deq_bits_sfb_masks_2;
	wire [7:0] _f4_io_deq_bits_sfb_masks_3;
	wire [3:0] _f4_io_deq_bits_sfb_dests_0;
	wire [3:0] _f4_io_deq_bits_sfb_dests_1;
	wire [3:0] _f4_io_deq_bits_sfb_dests_2;
	wire [3:0] _f4_io_deq_bits_sfb_dests_3;
	wire _f4_io_deq_bits_shadowable_mask_0;
	wire _f4_io_deq_bits_shadowable_mask_1;
	wire _f4_io_deq_bits_shadowable_mask_2;
	wire _f4_io_deq_bits_shadowable_mask_3;
	wire _f4_io_deq_bits_shadowed_mask_0;
	wire _f4_io_deq_bits_shadowed_mask_1;
	wire _f4_io_deq_bits_shadowed_mask_2;
	wire _f4_io_deq_bits_shadowed_mask_3;
	wire _f4_io_deq_bits_cfi_idx_valid;
	wire [1:0] _f4_io_deq_bits_cfi_idx_bits;
	wire [2:0] _f4_io_deq_bits_cfi_type;
	wire _f4_io_deq_bits_cfi_is_call;
	wire _f4_io_deq_bits_cfi_is_ret;
	wire _f4_io_deq_bits_cfi_npc_plus4;
	wire [3:0] _f4_io_deq_bits_mask;
	wire [3:0] _f4_io_deq_bits_br_mask;
	wire [63:0] _f4_io_deq_bits_ghist_old_history;
	wire _f4_io_deq_bits_ghist_current_saw_branch_not_taken;
	wire _f4_io_deq_bits_ghist_new_saw_branch_not_taken;
	wire _f4_io_deq_bits_ghist_new_saw_branch_taken;
	wire [4:0] _f4_io_deq_bits_ghist_ras_idx;
	wire _f4_io_deq_bits_xcpt_pf_if;
	wire _f4_io_deq_bits_xcpt_ae_if;
	wire _f4_io_deq_bits_bp_debug_if_oh_0;
	wire _f4_io_deq_bits_bp_debug_if_oh_1;
	wire _f4_io_deq_bits_bp_debug_if_oh_2;
	wire _f4_io_deq_bits_bp_debug_if_oh_3;
	wire _f4_io_deq_bits_bp_xcpt_if_oh_0;
	wire _f4_io_deq_bits_bp_xcpt_if_oh_1;
	wire _f4_io_deq_bits_bp_xcpt_if_oh_2;
	wire _f4_io_deq_bits_bp_xcpt_if_oh_3;
	wire _f4_io_deq_bits_end_half_valid;
	wire [15:0] _f4_io_deq_bits_end_half_bits;
	wire [119:0] _f4_io_deq_bits_bpd_meta_0;
	wire [2:0] _f4_io_deq_bits_fsrc;
	wire _f4_btb_corrections_io_deq_valid;
	wire _f4_btb_corrections_io_deq_bits_is_mispredict_update;
	wire _f4_btb_corrections_io_deq_bits_is_repair_update;
	wire [3:0] _f4_btb_corrections_io_deq_bits_btb_mispredicts;
	wire [39:0] _f4_btb_corrections_io_deq_bits_pc;
	wire [3:0] _f4_btb_corrections_io_deq_bits_br_mask;
	wire _f4_btb_corrections_io_deq_bits_cfi_idx_valid;
	wire [1:0] _f4_btb_corrections_io_deq_bits_cfi_idx_bits;
	wire _f4_btb_corrections_io_deq_bits_cfi_taken;
	wire _f4_btb_corrections_io_deq_bits_cfi_mispredicted;
	wire _f4_btb_corrections_io_deq_bits_cfi_is_br;
	wire _f4_btb_corrections_io_deq_bits_cfi_is_jal;
	wire _f4_btb_corrections_io_deq_bits_cfi_is_jalr;
	wire [63:0] _f4_btb_corrections_io_deq_bits_ghist_old_history;
	wire [39:0] _f4_btb_corrections_io_deq_bits_target;
	wire [119:0] _f4_btb_corrections_io_deq_bits_meta_0;
	wire _bpd_decoder_3_io_out_is_ret;
	wire _bpd_decoder_3_io_out_is_call;
	wire [39:0] _bpd_decoder_3_io_out_target;
	wire [2:0] _bpd_decoder_3_io_out_cfi_type;
	wire _bpd_decoder_3_io_out_sfb_offset_valid;
	wire [5:0] _bpd_decoder_3_io_out_sfb_offset_bits;
	wire _bpd_decoder_3_io_out_shadowable;
	wire _bpd_decoder_2_io_out_is_ret;
	wire _bpd_decoder_2_io_out_is_call;
	wire [39:0] _bpd_decoder_2_io_out_target;
	wire [2:0] _bpd_decoder_2_io_out_cfi_type;
	wire _bpd_decoder_2_io_out_sfb_offset_valid;
	wire [5:0] _bpd_decoder_2_io_out_sfb_offset_bits;
	wire _bpd_decoder_2_io_out_shadowable;
	wire _bpd_decoder_1_io_out_is_ret;
	wire _bpd_decoder_1_io_out_is_call;
	wire [39:0] _bpd_decoder_1_io_out_target;
	wire [2:0] _bpd_decoder_1_io_out_cfi_type;
	wire _bpd_decoder_1_io_out_sfb_offset_valid;
	wire [5:0] _bpd_decoder_1_io_out_sfb_offset_bits;
	wire _bpd_decoder_1_io_out_shadowable;
	wire _bpd_decoder_io_out_is_ret;
	wire _bpd_decoder_io_out_is_call;
	wire [39:0] _bpd_decoder_io_out_target;
	wire [2:0] _bpd_decoder_io_out_cfi_type;
	wire _bpd_decoder_io_out_sfb_offset_valid;
	wire [5:0] _bpd_decoder_io_out_sfb_offset_bits;
	wire _bpd_decoder_io_out_shadowable;
	wire _f3_bpd_queue_io_enq_ready;
	wire [39:0] _f3_bpd_queue_io_deq_bits_pc;
	wire _f3_bpd_queue_io_deq_bits_preds_0_taken;
	wire _f3_bpd_queue_io_deq_bits_preds_0_is_br;
	wire _f3_bpd_queue_io_deq_bits_preds_0_predicted_pc_valid;
	wire [39:0] _f3_bpd_queue_io_deq_bits_preds_0_predicted_pc_bits;
	wire _f3_bpd_queue_io_deq_bits_preds_1_taken;
	wire _f3_bpd_queue_io_deq_bits_preds_1_is_br;
	wire _f3_bpd_queue_io_deq_bits_preds_1_predicted_pc_valid;
	wire [39:0] _f3_bpd_queue_io_deq_bits_preds_1_predicted_pc_bits;
	wire _f3_bpd_queue_io_deq_bits_preds_2_taken;
	wire _f3_bpd_queue_io_deq_bits_preds_2_is_br;
	wire _f3_bpd_queue_io_deq_bits_preds_2_predicted_pc_valid;
	wire [39:0] _f3_bpd_queue_io_deq_bits_preds_2_predicted_pc_bits;
	wire _f3_bpd_queue_io_deq_bits_preds_3_taken;
	wire _f3_bpd_queue_io_deq_bits_preds_3_is_br;
	wire _f3_bpd_queue_io_deq_bits_preds_3_predicted_pc_valid;
	wire [39:0] _f3_bpd_queue_io_deq_bits_preds_3_predicted_pc_bits;
	wire [119:0] _f3_bpd_queue_io_deq_bits_meta_0;
	wire _f3_bpd_queue_io_deq_bits_lhist_0;
	wire _f3_io_enq_ready;
	wire _f3_io_deq_valid;
	wire [39:0] _f3_io_deq_bits_pc;
	wire [39:0] _f3_io_deq_bits_next_fetch;
	wire _f3_io_deq_bits_edge_inst_0;
	wire [31:0] _f3_io_deq_bits_insts_0;
	wire [31:0] _f3_io_deq_bits_insts_1;
	wire [31:0] _f3_io_deq_bits_insts_2;
	wire [31:0] _f3_io_deq_bits_insts_3;
	wire [31:0] _f3_io_deq_bits_exp_insts_0;
	wire [31:0] _f3_io_deq_bits_exp_insts_1;
	wire [31:0] _f3_io_deq_bits_exp_insts_2;
	wire [31:0] _f3_io_deq_bits_exp_insts_3;
	wire [39:0] _f3_io_deq_bits_pcs_0;
	wire [39:0] _f3_io_deq_bits_pcs_1;
	wire [39:0] _f3_io_deq_bits_pcs_2;
	wire [39:0] _f3_io_deq_bits_pcs_3;
	wire [39:0] _f3_io_deq_bits_ras_top;
	wire [3:0] _f3_io_deq_bits_mask;
	wire [63:0] _f3_io_deq_bits_ghist_old_history;
	wire _f3_io_deq_bits_ghist_current_saw_branch_not_taken;
	wire _f3_io_deq_bits_ghist_new_saw_branch_not_taken;
	wire _f3_io_deq_bits_ghist_new_saw_branch_taken;
	wire [4:0] _f3_io_deq_bits_ghist_ras_idx;
	wire _f3_io_deq_bits_xcpt_pf_if;
	wire _f3_io_deq_bits_xcpt_ae_if;
	wire _f3_io_deq_bits_end_half_valid;
	wire [15:0] _f3_io_deq_bits_end_half_bits;
	wire [2:0] _f3_io_deq_bits_fsrc;
	wire [2:0] _f3_io_deq_bits_tsrc;
	wire [31:0] _f2_fetch_bundle_exp_insts_3_rvc_exp_io_out_bits;
	wire _f2_fetch_bundle_exp_insts_3_rvc_exp_io_rvc;
	wire [31:0] _f2_fetch_bundle_exp_insts_2_rvc_exp_io_out_bits;
	wire _f2_fetch_bundle_exp_insts_2_rvc_exp_io_rvc;
	wire [31:0] _f2_fetch_bundle_exp_insts_1_rvc_exp_io_out_bits;
	wire _f2_fetch_bundle_exp_insts_1_rvc_exp_io_rvc;
	wire [31:0] _f2_fetch_bundle_exp_insts_0_rvc_exp_1_io_out_bits;
	wire _f2_fetch_bundle_exp_insts_0_rvc_exp_1_io_rvc;
	wire [31:0] _f2_fetch_bundle_exp_insts_0_rvc_exp_io_out_bits;
	wire _f2_fetch_bundle_exp_insts_0_rvc_exp_io_rvc;
	wire _tlb_io_resp_miss;
	wire [31:0] _tlb_io_resp_paddr;
	wire _tlb_io_resp_pf_inst;
	wire _tlb_io_resp_ae_inst;
	wire _tlb_io_ptw_req_valid;
	wire [39:0] _ras_io_read_addr;
	wire _bpd_io_resp_f1_preds_0_taken;
	wire _bpd_io_resp_f1_preds_0_is_br;
	wire _bpd_io_resp_f1_preds_0_predicted_pc_valid;
	wire [39:0] _bpd_io_resp_f1_preds_0_predicted_pc_bits;
	wire _bpd_io_resp_f1_preds_1_taken;
	wire _bpd_io_resp_f1_preds_1_is_br;
	wire _bpd_io_resp_f1_preds_1_predicted_pc_valid;
	wire [39:0] _bpd_io_resp_f1_preds_1_predicted_pc_bits;
	wire _bpd_io_resp_f1_preds_2_taken;
	wire _bpd_io_resp_f1_preds_2_is_br;
	wire _bpd_io_resp_f1_preds_2_predicted_pc_valid;
	wire [39:0] _bpd_io_resp_f1_preds_2_predicted_pc_bits;
	wire _bpd_io_resp_f1_preds_3_taken;
	wire _bpd_io_resp_f1_preds_3_is_br;
	wire _bpd_io_resp_f1_preds_3_predicted_pc_valid;
	wire [39:0] _bpd_io_resp_f1_preds_3_predicted_pc_bits;
	wire _bpd_io_resp_f2_preds_0_taken;
	wire _bpd_io_resp_f2_preds_0_is_br;
	wire _bpd_io_resp_f2_preds_0_predicted_pc_valid;
	wire [39:0] _bpd_io_resp_f2_preds_0_predicted_pc_bits;
	wire _bpd_io_resp_f2_preds_1_taken;
	wire _bpd_io_resp_f2_preds_1_is_br;
	wire _bpd_io_resp_f2_preds_1_predicted_pc_valid;
	wire [39:0] _bpd_io_resp_f2_preds_1_predicted_pc_bits;
	wire _bpd_io_resp_f2_preds_2_taken;
	wire _bpd_io_resp_f2_preds_2_is_br;
	wire _bpd_io_resp_f2_preds_2_predicted_pc_valid;
	wire [39:0] _bpd_io_resp_f2_preds_2_predicted_pc_bits;
	wire _bpd_io_resp_f2_preds_3_taken;
	wire _bpd_io_resp_f2_preds_3_is_br;
	wire _bpd_io_resp_f2_preds_3_predicted_pc_valid;
	wire [39:0] _bpd_io_resp_f2_preds_3_predicted_pc_bits;
	wire [39:0] _bpd_io_resp_f3_pc;
	wire _bpd_io_resp_f3_preds_0_taken;
	wire _bpd_io_resp_f3_preds_0_is_br;
	wire _bpd_io_resp_f3_preds_0_is_jal;
	wire _bpd_io_resp_f3_preds_0_predicted_pc_valid;
	wire [39:0] _bpd_io_resp_f3_preds_0_predicted_pc_bits;
	wire _bpd_io_resp_f3_preds_1_taken;
	wire _bpd_io_resp_f3_preds_1_is_br;
	wire _bpd_io_resp_f3_preds_1_is_jal;
	wire _bpd_io_resp_f3_preds_1_predicted_pc_valid;
	wire [39:0] _bpd_io_resp_f3_preds_1_predicted_pc_bits;
	wire _bpd_io_resp_f3_preds_2_taken;
	wire _bpd_io_resp_f3_preds_2_is_br;
	wire _bpd_io_resp_f3_preds_2_is_jal;
	wire _bpd_io_resp_f3_preds_2_predicted_pc_valid;
	wire [39:0] _bpd_io_resp_f3_preds_2_predicted_pc_bits;
	wire _bpd_io_resp_f3_preds_3_taken;
	wire _bpd_io_resp_f3_preds_3_is_br;
	wire _bpd_io_resp_f3_preds_3_is_jal;
	wire _bpd_io_resp_f3_preds_3_predicted_pc_valid;
	wire [39:0] _bpd_io_resp_f3_preds_3_predicted_pc_bits;
	wire [119:0] _bpd_io_resp_f3_meta_0;
	wire _icache_io_resp_valid;
	wire [63:0] _icache_io_resp_bits_data;
	reg [39:0] s1_vpc;
	reg s1_valid;
	reg [63:0] s1_ghist_old_history;
	reg s1_ghist_current_saw_branch_not_taken;
	reg s1_ghist_new_saw_branch_not_taken;
	reg s1_ghist_new_saw_branch_taken;
	reg [4:0] s1_ghist_ras_idx;
	reg s1_is_replay;
	reg s1_is_sfence;
	reg [2:0] s1_tsrc;
	reg tlb_io_sfence_REG_valid;
	reg tlb_io_sfence_REG_bits_rs1;
	reg tlb_io_sfence_REG_bits_rs2;
	reg [38:0] tlb_io_sfence_REG_bits_addr;
	reg s1_tlb_resp_REG_pf_inst;
	reg s1_tlb_resp_REG_ae_inst;
	reg [31:0] s1_ppc_REG;
	wire [31:0] s1_ppc = (s1_is_replay ? s1_ppc_REG : _tlb_io_resp_paddr);
	wire [6:0] f1_mask = 7'h0f << s1_vpc[2:1];
	wire f1_redirects_0 = (f1_mask[0] & _bpd_io_resp_f1_preds_0_predicted_pc_valid) & _bpd_io_resp_f1_preds_0_taken;
	wire f1_redirects_1 = (f1_mask[1] & _bpd_io_resp_f1_preds_1_predicted_pc_valid) & _bpd_io_resp_f1_preds_1_taken;
	wire f1_redirects_2 = (f1_mask[2] & _bpd_io_resp_f1_preds_2_predicted_pc_valid) & _bpd_io_resp_f1_preds_2_taken;
	wire f1_redirects_3 = (f1_mask[3] & _bpd_io_resp_f1_preds_3_predicted_pc_valid) & _bpd_io_resp_f1_preds_3_taken;
	wire f1_do_redirect = ((f1_redirects_0 | f1_redirects_1) | f1_redirects_2) | f1_redirects_3;
	wire [39:0] f1_targ = (((f1_redirects_0 ? _bpd_io_resp_f1_preds_0_predicted_pc_bits : 40'h0000000000) | (f1_redirects_1 ? _bpd_io_resp_f1_preds_1_predicted_pc_bits : 40'h0000000000)) | (f1_redirects_2 ? _bpd_io_resp_f1_preds_2_predicted_pc_bits : 40'h0000000000)) | (f1_redirects_3 ? _bpd_io_resp_f1_preds_3_predicted_pc_bits : 40'h0000000000);
	wire [39:0] _f1_next_fetch_T_3 = {s1_vpc[39:3], 3'h0} + 40'h0000000008;
	wire [1:0] f1_predicted_ghist_cfi_idx_fixed = (f1_redirects_0 ? 2'h0 : (f1_redirects_1 ? 2'h1 : {1'h1, ~f1_redirects_2}));
	wire [3:0] f1_predicted_ghist_cfi_idx_oh = 4'h1 << f1_predicted_ghist_cfi_idx_fixed;
	wire [2:0] _GEN_1 = f1_predicted_ghist_cfi_idx_oh[2:0] | f1_predicted_ghist_cfi_idx_oh[3:1];
	wire [1:0] _GEN_2 = _GEN_1[1:0] | f1_predicted_ghist_cfi_idx_oh[3:2];
	wire _f1_predicted_ghist_new_history_old_history_T = ((f1_redirects_0 ? _bpd_io_resp_f1_preds_0_is_br : (f1_redirects_1 ? _bpd_io_resp_f1_preds_1_is_br : (f1_redirects_2 ? _bpd_io_resp_f1_preds_2_is_br : _bpd_io_resp_f1_preds_3_is_br))) & (f1_redirects_0 ? _bpd_io_resp_f1_preds_0_taken : (f1_redirects_1 ? _bpd_io_resp_f1_preds_1_taken : (f1_redirects_2 ? _bpd_io_resp_f1_preds_2_taken : _bpd_io_resp_f1_preds_3_taken)))) & f1_do_redirect;
	wire [63:0] _f1_predicted_ghist_new_history_old_history_T_6 = (_f1_predicted_ghist_new_history_old_history_T & f1_do_redirect ? {s1_ghist_old_history[62:0], 1'h1} : (|((f1_mask[3:0] & {_bpd_io_resp_f1_preds_3_is_br, _bpd_io_resp_f1_preds_2_is_br, _bpd_io_resp_f1_preds_1_is_br, _bpd_io_resp_f1_preds_0_is_br}) & (f1_do_redirect ? {&f1_predicted_ghist_cfi_idx_fixed, _GEN_1[2], _GEN_2[1], _GEN_2[0] | &f1_predicted_ghist_cfi_idx_fixed} & ~(_f1_predicted_ghist_new_history_old_history_T ? f1_predicted_ghist_cfi_idx_oh : 4'h0) : 4'hf)) | s1_ghist_current_saw_branch_not_taken ? {s1_ghist_old_history[62:0], 1'h0} : s1_ghist_old_history));
	reg s2_valid;
	reg [39:0] s2_vpc;
	reg [63:0] s2_ghist_old_history;
	reg s2_ghist_current_saw_branch_not_taken;
	reg s2_ghist_new_saw_branch_not_taken;
	reg s2_ghist_new_saw_branch_taken;
	reg [4:0] s2_ghist_ras_idx;
	reg [31:0] s2_ppc;
	reg [2:0] s2_tsrc;
	reg s2_tlb_resp_pf_inst;
	reg s2_tlb_resp_ae_inst;
	reg s2_tlb_miss;
	reg s2_is_replay_REG;
	wire s2_is_replay = s2_is_replay_REG & s2_valid;
	wire _f3_io_enq_valid_T_2 = s2_tlb_resp_ae_inst | s2_tlb_resp_pf_inst;
	wire [6:0] f2_fetch_mask = 7'h0f << s2_vpc[2:1];
	wire f2_redirects_0 = (f2_fetch_mask[0] & _bpd_io_resp_f2_preds_0_predicted_pc_valid) & _bpd_io_resp_f2_preds_0_taken;
	wire f2_redirects_1 = (f2_fetch_mask[1] & _bpd_io_resp_f2_preds_1_predicted_pc_valid) & _bpd_io_resp_f2_preds_1_taken;
	wire f2_redirects_2 = (f2_fetch_mask[2] & _bpd_io_resp_f2_preds_2_predicted_pc_valid) & _bpd_io_resp_f2_preds_2_taken;
	wire f2_redirects_3 = (f2_fetch_mask[3] & _bpd_io_resp_f2_preds_3_predicted_pc_valid) & _bpd_io_resp_f2_preds_3_taken;
	wire _f2_fetch_bundle_cfi_idx_valid_T = f2_redirects_0 | f2_redirects_1;
	wire f2_do_redirect = (_f2_fetch_bundle_cfi_idx_valid_T | f2_redirects_2) | f2_redirects_3;
	reg [39:0] f2_next_fetch;
	wire [39:0] _f2_fetch_bundle_next_pc_T = (f2_redirects_2 ? _bpd_io_resp_f2_preds_2_predicted_pc_bits : _bpd_io_resp_f2_preds_3_predicted_pc_bits);
	wire [39:0] f2_predicted_target = (f2_do_redirect ? (f2_redirects_0 ? _bpd_io_resp_f2_preds_0_predicted_pc_bits : (f2_redirects_1 ? _bpd_io_resp_f2_preds_1_predicted_pc_bits : _f2_fetch_bundle_next_pc_T)) : f2_next_fetch);
	wire [1:0] _f2_fetch_bundle_cfi_idx_bits_T = {1'h1, ~f2_redirects_2};
	wire [1:0] f2_predicted_ghist_cfi_idx_fixed = (f2_redirects_0 ? 2'h0 : (f2_redirects_1 ? 2'h1 : _f2_fetch_bundle_cfi_idx_bits_T));
	wire [3:0] f2_predicted_ghist_cfi_idx_oh = 4'h1 << f2_predicted_ghist_cfi_idx_fixed;
	wire [2:0] _GEN_3 = f2_predicted_ghist_cfi_idx_oh[2:0] | f2_predicted_ghist_cfi_idx_oh[3:1];
	wire [1:0] _GEN_4 = _GEN_3[1:0] | f2_predicted_ghist_cfi_idx_oh[3:2];
	wire _f2_predicted_ghist_new_history_old_history_T = ((f2_redirects_0 ? _bpd_io_resp_f2_preds_0_is_br : (f2_redirects_1 ? _bpd_io_resp_f2_preds_1_is_br : (f2_redirects_2 ? _bpd_io_resp_f2_preds_2_is_br : _bpd_io_resp_f2_preds_3_is_br))) & (f2_redirects_0 ? _bpd_io_resp_f2_preds_0_taken : (f2_redirects_1 ? _bpd_io_resp_f2_preds_1_taken : (f2_redirects_2 ? _bpd_io_resp_f2_preds_2_taken : _bpd_io_resp_f2_preds_3_taken)))) & f2_do_redirect;
	wire [63:0] _f2_predicted_ghist_new_history_old_history_T_6 = (_f2_predicted_ghist_new_history_old_history_T & f2_do_redirect ? {s2_ghist_old_history[62:0], 1'h1} : (|((f2_fetch_mask[3:0] & {_bpd_io_resp_f2_preds_3_is_br & _bpd_io_resp_f2_preds_3_predicted_pc_valid, _bpd_io_resp_f2_preds_2_is_br & _bpd_io_resp_f2_preds_2_predicted_pc_valid, _bpd_io_resp_f2_preds_1_is_br & _bpd_io_resp_f2_preds_1_predicted_pc_valid, _bpd_io_resp_f2_preds_0_is_br & _bpd_io_resp_f2_preds_0_predicted_pc_valid}) & (f2_do_redirect ? {&f2_predicted_ghist_cfi_idx_fixed, _GEN_3[2], _GEN_4[1], _GEN_4[0] | &f2_predicted_ghist_cfi_idx_fixed} & ~(_f2_predicted_ghist_new_history_old_history_T ? f2_predicted_ghist_cfi_idx_oh : 4'h0) : 4'hf)) | s2_ghist_current_saw_branch_not_taken ? {s2_ghist_old_history[62:0], 1'h0} : s2_ghist_old_history));
	reg [15:0] f2_prev_half;
	reg f2_prev_is_half;
	assign f2_inst_mask_0 = s2_valid & f2_fetch_mask[0];
	wire [39:0] _GEN_5 = {s2_vpc[39:3], 3'h0};
	wire [31:0] _f2_fetch_bundle_exp_insts_0_T_1 = {_icache_io_resp_bits_data[15:0], f2_prev_half};
	wire [31:0] f2_fetch_bundle_insts_0 = (f2_prev_is_half ? {_icache_io_resp_bits_data[15:0], f2_prev_half} : _icache_io_resp_bits_data[31:0]);
	assign f2_inst_mask_1 = (s2_valid & f2_fetch_mask[1]) & valid_1;
	assign valid_1 = f2_prev_is_half | ~(f2_inst_mask_0 & (&f2_fetch_bundle_insts_0[1:0]));
	assign f2_inst_mask_2 = (s2_valid & f2_fetch_mask[2]) & valid_2;
	assign valid_2 = ~(f2_inst_mask_1 & (&_icache_io_resp_bits_data[17:16]));
	assign f2_inst_mask_3 = (s2_valid & f2_fetch_mask[3]) & valid_3;
	wire [31:0] inst_2 = {16'h0000, _icache_io_resp_bits_data[63:48]};
	assign valid_3 = ~((f2_inst_mask_2 & (&_icache_io_resp_bits_data[33:32])) | &_icache_io_resp_bits_data[49:48]);
	wire f2_fetch_bundle_end_half_valid = ~(f2_inst_mask_2 & (&_icache_io_resp_bits_data[33:32])) & (&_icache_io_resp_bits_data[49:48]);
	wire _f2_correct_f1_ghist_T_5 = ((s1_ghist_old_history == _f2_predicted_ghist_new_history_old_history_T_6) & ~s1_ghist_new_saw_branch_taken) & (s1_ghist_new_saw_branch_taken | ~s1_ghist_new_saw_branch_not_taken);
	wire _s0_is_replay_T = s2_valid & _icache_io_resp_valid;
	wire _GEN_6 = (s2_valid & ~_icache_io_resp_valid) | (_s0_is_replay_T & ~_f3_io_enq_ready);
	wire _GEN_7 = s2_valid & _f3_io_enq_ready;
	wire _GEN_8 = (s1_valid & ((s1_vpc != f2_predicted_target) | ~_f2_correct_f1_ghist_T_5)) | ~s1_valid;
	wire _GEN_9 = _GEN_7 & _GEN_8;
	wire _GEN_10 = _GEN_7 & _GEN_8;
	wire [2:0] _GEN_11 = {2'h0, _GEN_10};
	wire _GEN_12 = reset | f3_clear;
	reg f3_bpd_queue_io_enq_valid_REG;
	wire _f3_bpd_queue_io_enq_valid_T = _f3_io_deq_valid & f3_bpd_queue_io_enq_valid_REG;
	assign f3_mask_0 = _f3_io_deq_valid & _f3_io_deq_bits_mask[0];
	wire _f3_redirects_0_T_1 = _bpd_decoder_io_out_cfi_type == 3'h3;
	wire _f3_redirects_0_T = _bpd_decoder_io_out_cfi_type == 3'h2;
	wire f3_btb_mispredicts_0 = ((_f3_redirects_0_T & _f3_io_deq_bits_mask[0]) & _f3_bpd_queue_io_deq_bits_preds_0_predicted_pc_valid) & (_f3_bpd_queue_io_deq_bits_preds_0_predicted_pc_bits != _bpd_decoder_io_out_target);
	wire [6:0] _offset_from_aligned_pc_T_4 = {1'h0, _bpd_decoder_io_out_sfb_offset_bits} - {5'h00, _f3_io_deq_bits_edge_inst_0, 1'h0};
	wire [15:0] _upper_mask_T_1 = 16'h0001 << _offset_from_aligned_pc_T_4[4:1];
	wire _GEN_13 = _offset_from_aligned_pc_T_4[4:1] == 4'h0;
	wire [5:0] _GEN_14 = _upper_mask_T_1[6:1] | _upper_mask_T_1[5:0];
	wire [4:0] _GEN_15 = _GEN_14[5:1] | _upper_mask_T_1[4:0];
	wire [3:0] _GEN_16 = _GEN_15[4:1] | _upper_mask_T_1[3:0];
	wire [2:0] _GEN_17 = _GEN_16[3:1] | _upper_mask_T_1[2:0];
	wire [1:0] _GEN_18 = _GEN_17[2:1] | _upper_mask_T_1[1:0];
	wire _s0_valid_T_9 = _f3_io_deq_bits_xcpt_pf_if | _f3_io_deq_bits_xcpt_ae_if;
	wire f3_fetch_bundle_shadowable_mask_0 = ~_s0_valid_T_9 & (_bpd_decoder_io_out_shadowable | ~f3_mask_0);
	wire _f3_br_mask_0_T = _bpd_decoder_io_out_cfi_type == 3'h1;
	wire f3_redirects_0 = f3_mask_0 & ((_f3_redirects_0_T | _f3_redirects_0_T_1) | (_f3_br_mask_0_T & _f3_bpd_queue_io_deq_bits_preds_0_taken));
	assign f3_br_mask_0 = f3_mask_0 & _f3_br_mask_0_T;
	assign f3_mask_1 = (_f3_io_deq_valid & _f3_io_deq_bits_mask[1]) & ~f3_redirects_0;
	wire _f3_redirects_1_T_1 = _bpd_decoder_1_io_out_cfi_type == 3'h3;
	wire _f3_redirects_1_T = _bpd_decoder_1_io_out_cfi_type == 3'h2;
	wire f3_btb_mispredicts_1 = ((_f3_redirects_1_T & _f3_io_deq_bits_mask[1]) & _f3_bpd_queue_io_deq_bits_preds_1_predicted_pc_valid) & (_f3_bpd_queue_io_deq_bits_preds_1_predicted_pc_bits != _bpd_decoder_1_io_out_target);
	wire [6:0] _offset_from_aligned_pc_T_5 = {1'h0, _bpd_decoder_1_io_out_sfb_offset_bits} + 7'h02;
	wire [15:0] _upper_mask_T_5 = 16'h0001 << _offset_from_aligned_pc_T_5[4:1];
	wire _GEN_19 = _offset_from_aligned_pc_T_5[4:1] == 4'h0;
	wire [5:0] _GEN_20 = _upper_mask_T_5[6:1] | _upper_mask_T_5[5:0];
	wire [4:0] _GEN_21 = _GEN_20[5:1] | _upper_mask_T_5[4:0];
	wire [3:0] _GEN_22 = _GEN_21[4:1] | _upper_mask_T_5[3:0];
	wire [2:0] _GEN_23 = _GEN_22[3:1] | _upper_mask_T_5[2:0];
	wire [1:0] _GEN_24 = _GEN_23[2:1] | _upper_mask_T_5[1:0];
	wire f3_fetch_bundle_shadowable_mask_1 = ~_s0_valid_T_9 & (_bpd_decoder_1_io_out_shadowable | ~f3_mask_1);
	wire _f3_br_mask_1_T = _bpd_decoder_1_io_out_cfi_type == 3'h1;
	wire f3_redirects_1 = f3_mask_1 & ((_f3_redirects_1_T | _f3_redirects_1_T_1) | (_f3_br_mask_1_T & _f3_bpd_queue_io_deq_bits_preds_1_taken));
	assign f3_br_mask_1 = f3_mask_1 & _f3_br_mask_1_T;
	wire _GEN_25 = f3_redirects_0 | f3_redirects_1;
	assign f3_mask_2 = (_f3_io_deq_valid & _f3_io_deq_bits_mask[2]) & ~_GEN_25;
	wire _f3_redirects_2_T_1 = _bpd_decoder_2_io_out_cfi_type == 3'h3;
	wire _f3_redirects_2_T = _bpd_decoder_2_io_out_cfi_type == 3'h2;
	wire f3_btb_mispredicts_2 = ((_f3_redirects_2_T & _f3_io_deq_bits_mask[2]) & _f3_bpd_queue_io_deq_bits_preds_2_predicted_pc_valid) & (_f3_bpd_queue_io_deq_bits_preds_2_predicted_pc_bits != _bpd_decoder_2_io_out_target);
	wire [6:0] _offset_from_aligned_pc_T_10 = {1'h0, _bpd_decoder_2_io_out_sfb_offset_bits} + 7'h04;
	wire [15:0] _upper_mask_T_9 = 16'h0001 << _offset_from_aligned_pc_T_10[4:1];
	wire _GEN_26 = _offset_from_aligned_pc_T_10[4:1] == 4'h0;
	wire [5:0] _GEN_27 = _upper_mask_T_9[6:1] | _upper_mask_T_9[5:0];
	wire [4:0] _GEN_28 = _GEN_27[5:1] | _upper_mask_T_9[4:0];
	wire [3:0] _GEN_29 = _GEN_28[4:1] | _upper_mask_T_9[3:0];
	wire [2:0] _GEN_30 = _GEN_29[3:1] | _upper_mask_T_9[2:0];
	wire [1:0] _GEN_31 = _GEN_30[2:1] | _upper_mask_T_9[1:0];
	wire f3_fetch_bundle_shadowable_mask_2 = ~_s0_valid_T_9 & (_bpd_decoder_2_io_out_shadowable | ~f3_mask_2);
	wire _f3_br_mask_2_T = _bpd_decoder_2_io_out_cfi_type == 3'h1;
	wire f3_redirects_2 = f3_mask_2 & ((_f3_redirects_2_T | _f3_redirects_2_T_1) | (_f3_br_mask_2_T & _f3_bpd_queue_io_deq_bits_preds_2_taken));
	assign f3_br_mask_2 = f3_mask_2 & _f3_br_mask_2_T;
	assign f3_mask_3 = (_f3_io_deq_valid & _f3_io_deq_bits_mask[3]) & ~(_GEN_25 | f3_redirects_2);
	wire _f3_redirects_3_T_1 = _bpd_decoder_3_io_out_cfi_type == 3'h3;
	wire _f3_redirects_3_T = _bpd_decoder_3_io_out_cfi_type == 3'h2;
	wire f3_btb_mispredicts_3 = ((_f3_redirects_3_T & _f3_io_deq_bits_mask[3]) & _f3_bpd_queue_io_deq_bits_preds_3_predicted_pc_valid) & (_f3_bpd_queue_io_deq_bits_preds_3_predicted_pc_bits != _bpd_decoder_3_io_out_target);
	wire [6:0] _offset_from_aligned_pc_T_15 = {1'h0, _bpd_decoder_3_io_out_sfb_offset_bits} + 7'h06;
	wire [15:0] _upper_mask_T_13 = 16'h0001 << _offset_from_aligned_pc_T_15[4:1];
	wire _GEN_32 = _offset_from_aligned_pc_T_15[4:1] == 4'h0;
	wire [5:0] _GEN_33 = _upper_mask_T_13[6:1] | _upper_mask_T_13[5:0];
	wire [4:0] _GEN_34 = _GEN_33[5:1] | _upper_mask_T_13[4:0];
	wire [3:0] _GEN_35 = _GEN_34[4:1] | _upper_mask_T_13[3:0];
	wire [2:0] _GEN_36 = _GEN_35[3:1] | _upper_mask_T_13[2:0];
	wire [1:0] _GEN_37 = _GEN_36[2:1] | _upper_mask_T_13[1:0];
	wire f3_fetch_bundle_shadowable_mask_3 = ~_s0_valid_T_9 & (_bpd_decoder_3_io_out_shadowable | ~f3_mask_3);
	wire _f3_br_mask_3_T = _bpd_decoder_3_io_out_cfi_type == 3'h1;
	wire f3_redirects_3 = f3_mask_3 & ((_f3_redirects_3_T | _f3_redirects_3_T_1) | (_f3_br_mask_3_T & _f3_bpd_queue_io_deq_bits_preds_3_taken));
	assign f3_br_mask_3 = f3_mask_3 & _f3_br_mask_3_T;
	wire [11:0] _GEN_38 = {_bpd_decoder_3_io_out_cfi_type, _bpd_decoder_2_io_out_cfi_type, _bpd_decoder_1_io_out_cfi_type, _bpd_decoder_io_out_cfi_type};
	wire [3:0] _GEN_39 = {_bpd_decoder_3_io_out_is_call, _bpd_decoder_2_io_out_is_call, _bpd_decoder_1_io_out_is_call, _bpd_decoder_io_out_is_call};
	wire [3:0] _GEN_40 = {_bpd_decoder_3_io_out_is_ret, _bpd_decoder_2_io_out_is_ret, _bpd_decoder_1_io_out_is_ret, _bpd_decoder_io_out_is_ret};
	wire [3:0] _GEN_41 = {&_f3_io_deq_bits_insts_3[1:0], &_f3_io_deq_bits_insts_2[1:0], &_f3_io_deq_bits_insts_1[1:0], &_f3_io_deq_bits_insts_0[1:0] & ~_f3_io_deq_bits_edge_inst_0};
	wire _f4_btb_corrections_io_enq_valid_T = _f4_io_enq_ready & _f3_io_deq_valid;
	wire _f3_decoded_target_T = f3_redirects_0 | f3_redirects_1;
	assign f3_fetch_bundle_cfi_idx_bits = (f3_redirects_0 ? 2'h0 : (f3_redirects_1 ? 2'h1 : {1'h1, ~f3_redirects_2}));
	wire f3_predicted_redirects_0 = (_f3_io_deq_bits_mask[0] & _f3_bpd_queue_io_deq_bits_preds_0_predicted_pc_valid) & _f3_bpd_queue_io_deq_bits_preds_0_taken;
	wire f3_predicted_redirects_1 = (_f3_io_deq_bits_mask[1] & _f3_bpd_queue_io_deq_bits_preds_1_predicted_pc_valid) & _f3_bpd_queue_io_deq_bits_preds_1_taken;
	wire f3_predicted_redirects_2 = (_f3_io_deq_bits_mask[2] & _f3_bpd_queue_io_deq_bits_preds_2_predicted_pc_valid) & _f3_bpd_queue_io_deq_bits_preds_2_taken;
	wire f3_predicted_do_redirect = ((f3_predicted_redirects_0 | f3_predicted_redirects_1) | f3_predicted_redirects_2) | ((_f3_io_deq_bits_mask[3] & _f3_bpd_queue_io_deq_bits_preds_3_predicted_pc_valid) & _f3_bpd_queue_io_deq_bits_preds_3_taken);
	wire [39:0] f3_predicted_target = (f3_predicted_do_redirect ? (f3_predicted_redirects_0 ? _f3_bpd_queue_io_deq_bits_preds_0_predicted_pc_bits : (f3_predicted_redirects_1 ? _f3_bpd_queue_io_deq_bits_preds_1_predicted_pc_bits : (f3_predicted_redirects_2 ? _f3_bpd_queue_io_deq_bits_preds_2_predicted_pc_bits : _f3_bpd_queue_io_deq_bits_preds_3_predicted_pc_bits))) : _f3_io_deq_bits_next_fetch);
	wire [1:0] f3_predicted_ghist_cfi_idx_fixed = (f3_predicted_redirects_0 ? 2'h0 : (f3_predicted_redirects_1 ? 2'h1 : {1'h1, ~f3_predicted_redirects_2}));
	wire [3:0] f3_predicted_ghist_cfi_idx_oh = 4'h1 << f3_predicted_ghist_cfi_idx_fixed;
	wire [2:0] _GEN_42 = f3_predicted_ghist_cfi_idx_oh[2:0] | f3_predicted_ghist_cfi_idx_oh[3:1];
	wire [1:0] _GEN_43 = _GEN_42[1:0] | f3_predicted_ghist_cfi_idx_oh[3:2];
	wire _f3_predicted_ghist_new_history_old_history_T = ((f3_predicted_redirects_0 ? _f3_bpd_queue_io_deq_bits_preds_0_is_br : (f3_predicted_redirects_1 ? _f3_bpd_queue_io_deq_bits_preds_1_is_br : (f3_predicted_redirects_2 ? _f3_bpd_queue_io_deq_bits_preds_2_is_br : _f3_bpd_queue_io_deq_bits_preds_3_is_br))) & (f3_predicted_redirects_0 ? _f3_bpd_queue_io_deq_bits_preds_0_taken : (f3_predicted_redirects_1 ? _f3_bpd_queue_io_deq_bits_preds_1_taken : (f3_predicted_redirects_2 ? _f3_bpd_queue_io_deq_bits_preds_2_taken : _f3_bpd_queue_io_deq_bits_preds_3_taken)))) & f3_predicted_do_redirect;
	wire [63:0] _f3_predicted_ghist_new_history_old_history_T_6 = (_f3_predicted_ghist_new_history_old_history_T & f3_predicted_do_redirect ? {_f3_io_deq_bits_ghist_old_history[62:0], 1'h1} : (|(({_f3_bpd_queue_io_deq_bits_preds_3_is_br & _f3_bpd_queue_io_deq_bits_preds_3_predicted_pc_valid, _f3_bpd_queue_io_deq_bits_preds_2_is_br & _f3_bpd_queue_io_deq_bits_preds_2_predicted_pc_valid, _f3_bpd_queue_io_deq_bits_preds_1_is_br & _f3_bpd_queue_io_deq_bits_preds_1_predicted_pc_valid, _f3_bpd_queue_io_deq_bits_preds_0_is_br & _f3_bpd_queue_io_deq_bits_preds_0_predicted_pc_valid} & _f3_io_deq_bits_mask) & (f3_predicted_do_redirect ? {&f3_predicted_ghist_cfi_idx_fixed, _GEN_42[2], _GEN_43[1], _GEN_43[0] | &f3_predicted_ghist_cfi_idx_fixed} & ~(_f3_predicted_ghist_new_history_old_history_T ? f3_predicted_ghist_cfi_idx_oh : 4'h0) : 4'hf)) | _f3_io_deq_bits_ghist_current_saw_branch_not_taken ? {_f3_io_deq_bits_ghist_old_history[62:0], 1'h0} : _f3_io_deq_bits_ghist_old_history));
	wire _f3_correct_f2_ghist_T_5 = ((s2_ghist_old_history == _f3_predicted_ghist_new_history_old_history_T_6) & ~s2_ghist_new_saw_branch_taken) & (s2_ghist_new_saw_branch_taken | ~s2_ghist_new_saw_branch_not_taken);
	wire _GEN_44 = _f3_io_deq_valid & _f4_io_enq_ready;
	wire _GEN_45 = (s2_valid & (s2_vpc == f3_predicted_target)) & _f3_correct_f2_ghist_T_5;
	wire _GEN_46 = _GEN_44 & _GEN_45;
	wire _GEN_47 = ((s2_valid & ((s2_vpc != f3_predicted_target) | ~_f3_correct_f2_ghist_T_5)) | ((~s2_valid & s1_valid) & ((s1_vpc != f3_predicted_target) | ~(((s1_ghist_old_history == _f3_predicted_ghist_new_history_old_history_T_6) & ~s1_ghist_new_saw_branch_taken) & (s1_ghist_new_saw_branch_taken | ~s1_ghist_new_saw_branch_not_taken))))) | (~s2_valid & ~s1_valid);
	wire _GEN_48 = (~_GEN_44 | _GEN_45) | ~_GEN_47;
	reg [4:0] ras_read_idx;
	wire f4_sfbs_0 = (((&({_f4_io_deq_bits_shadowable_mask_3, _f4_io_deq_bits_shadowable_mask_2, _f4_io_deq_bits_shadowable_mask_1, _f4_io_deq_bits_shadowable_mask_0} | ~_f4_io_deq_bits_sfb_masks_0[3:0]) & (&((_f4_io_enq_valid_T_1 ? {f3_fetch_bundle_shadowable_mask_3, f3_fetch_bundle_shadowable_mask_2, f3_fetch_bundle_shadowable_mask_1, f3_fetch_bundle_shadowable_mask_0} : 4'h0) | ~_f4_io_deq_bits_sfb_masks_0[7:4]))) & _f4_io_deq_bits_sfbs_0) & ~(_f4_io_deq_bits_cfi_idx_valid & (_f4_io_deq_bits_cfi_idx_bits == 2'h0))) & (_f4_io_deq_bits_sfb_dests_0 == 4'h0 ? ~_f3_io_deq_bits_end_half_valid : (_f4_io_deq_bits_sfb_dests_0 != 4'h8) | ~_f4_io_deq_bits_end_half_valid);
	wire f4_sfbs_1 = (((&({_f4_io_deq_bits_shadowable_mask_3, _f4_io_deq_bits_shadowable_mask_2, _f4_io_deq_bits_shadowable_mask_1, _f4_io_deq_bits_shadowable_mask_0} | ~_f4_io_deq_bits_sfb_masks_1[3:0]) & (&((_f4_io_enq_valid_T_1 ? {f3_fetch_bundle_shadowable_mask_3, f3_fetch_bundle_shadowable_mask_2, f3_fetch_bundle_shadowable_mask_1, f3_fetch_bundle_shadowable_mask_0} : 4'h0) | ~_f4_io_deq_bits_sfb_masks_1[7:4]))) & _f4_io_deq_bits_sfbs_1) & ~(_f4_io_deq_bits_cfi_idx_valid & (_f4_io_deq_bits_cfi_idx_bits == 2'h1))) & (_f4_io_deq_bits_sfb_dests_1 == 4'h0 ? ~_f3_io_deq_bits_end_half_valid : (_f4_io_deq_bits_sfb_dests_1 != 4'h8) | ~_f4_io_deq_bits_end_half_valid);
	wire f4_sfbs_2 = (((&({_f4_io_deq_bits_shadowable_mask_3, _f4_io_deq_bits_shadowable_mask_2, _f4_io_deq_bits_shadowable_mask_1, _f4_io_deq_bits_shadowable_mask_0} | ~_f4_io_deq_bits_sfb_masks_2[3:0]) & (&((_f4_io_enq_valid_T_1 ? {f3_fetch_bundle_shadowable_mask_3, f3_fetch_bundle_shadowable_mask_2, f3_fetch_bundle_shadowable_mask_1, f3_fetch_bundle_shadowable_mask_0} : 4'h0) | ~_f4_io_deq_bits_sfb_masks_2[7:4]))) & _f4_io_deq_bits_sfbs_2) & ~(_f4_io_deq_bits_cfi_idx_valid & (_f4_io_deq_bits_cfi_idx_bits == 2'h2))) & (_f4_io_deq_bits_sfb_dests_2 == 4'h0 ? ~_f3_io_deq_bits_end_half_valid : (_f4_io_deq_bits_sfb_dests_2 != 4'h8) | ~_f4_io_deq_bits_end_half_valid);
	wire f4_sfb_valid = (((f4_sfbs_0 | f4_sfbs_1) | f4_sfbs_2) | ((((&({_f4_io_deq_bits_shadowable_mask_3, _f4_io_deq_bits_shadowable_mask_2, _f4_io_deq_bits_shadowable_mask_1, _f4_io_deq_bits_shadowable_mask_0} | ~_f4_io_deq_bits_sfb_masks_3[3:0]) & (&((_f4_io_enq_valid_T_1 ? {f3_fetch_bundle_shadowable_mask_3, f3_fetch_bundle_shadowable_mask_2, f3_fetch_bundle_shadowable_mask_1, f3_fetch_bundle_shadowable_mask_0} : 4'h0) | ~_f4_io_deq_bits_sfb_masks_3[7:4]))) & _f4_io_deq_bits_sfbs_3) & ~(_f4_io_deq_bits_cfi_idx_valid & (&_f4_io_deq_bits_cfi_idx_bits))) & (_f4_io_deq_bits_sfb_dests_3 == 4'h0 ? ~_f3_io_deq_bits_end_half_valid : (_f4_io_deq_bits_sfb_dests_3 != 4'h8) | ~_f4_io_deq_bits_end_half_valid))) & _f4_io_deq_valid;
	wire [7:0] f4_sfb_mask = (f4_sfbs_0 ? _f4_io_deq_bits_sfb_masks_0 : (f4_sfbs_1 ? _f4_io_deq_bits_sfb_masks_1 : (f4_sfbs_2 ? _f4_io_deq_bits_sfb_masks_2 : _f4_io_deq_bits_sfb_masks_3)));
	wire f4_delay = ((((((_f4_io_deq_bits_sfbs_0 | _f4_io_deq_bits_sfbs_1) | _f4_io_deq_bits_sfbs_2) | _f4_io_deq_bits_sfbs_3) & ~_f4_io_deq_bits_cfi_idx_valid) & ~_f4_io_enq_valid_T_1) & ~_f4_io_deq_bits_xcpt_pf_if) & ~_f4_io_deq_bits_xcpt_ae_if;
	assign _f4_io_enq_valid_T_1 = _f3_io_deq_valid & ~f3_clear;
	wire [3:0] _GEN_49 = (f4_sfb_valid ? 4'h1 << (f4_sfbs_0 ? 2'h0 : (f4_sfbs_1 ? 2'h1 : {1'h1, ~f4_sfbs_2})) : 4'h0);
	wire [3:0] _GEN_50 = (f4_sfb_valid ? f4_sfb_mask[3:0] : 4'h0) | {_f4_io_deq_bits_shadowed_mask_3, _f4_io_deq_bits_shadowed_mask_2, _f4_io_deq_bits_shadowed_mask_1, _f4_io_deq_bits_shadowed_mask_0};
	wire [3:0] _GEN_51 = {2'h0, _f4_io_deq_bits_cfi_idx_bits};
	wire [3:0] _f4_decoded_ghist_T = _f4_io_deq_bits_br_mask >> _GEN_51;
	wire [3:0] f4_decoded_ghist_cfi_idx_oh = 4'h1 << _GEN_51;
	wire [2:0] _GEN_52 = f4_decoded_ghist_cfi_idx_oh[2:0] | f4_decoded_ghist_cfi_idx_oh[3:1];
	wire [1:0] _GEN_53 = _GEN_52[1:0] | f4_decoded_ghist_cfi_idx_oh[3:2];
	wire _f4_decoded_ghist_new_history_old_history_T = _f4_decoded_ghist_T[0] & _f4_io_deq_bits_cfi_idx_valid;
	wire [63:0] _f4_decoded_ghist_new_history_old_history_T_6 = (_f4_decoded_ghist_new_history_old_history_T & _f4_io_deq_bits_cfi_idx_valid ? {_f4_io_deq_bits_ghist_old_history[62:0], 1'h1} : (|(_f4_io_deq_bits_br_mask & (_f4_io_deq_bits_cfi_idx_valid ? {&_f4_io_deq_bits_cfi_idx_bits, _GEN_52[2], _GEN_53[1], _GEN_53[0] | &_f4_io_deq_bits_cfi_idx_bits} & ~(_f4_decoded_ghist_new_history_old_history_T ? f4_decoded_ghist_cfi_idx_oh : 4'h0) : 4'hf)) | _f4_io_deq_bits_ghist_current_saw_branch_not_taken ? {_f4_io_deq_bits_ghist_old_history[62:0], 1'h0} : _f4_io_deq_bits_ghist_old_history));
	wire [4:0] _ras_io_write_idx_T = _f4_io_deq_bits_ghist_ras_idx + 5'h01;
	wire _f4_decoded_target_T_2 = _f4_io_deq_bits_cfi_idx_valid & _f4_io_deq_bits_cfi_is_ret;
	wire [4:0] f4_decoded_ghist_ras_idx = (_f4_io_deq_bits_cfi_idx_valid & _f4_io_deq_bits_cfi_is_call ? _ras_io_write_idx_T : (_f4_decoded_target_T_2 ? _f4_io_deq_bits_ghist_ras_idx - 5'h01 : _f4_io_deq_bits_ghist_ras_idx));
	wire [39:0] f4_decoded_target = (_f4_decoded_target_T_2 ? _ras_io_read_addr : _f4_io_deq_bits_next_pc);
	wire _f4_correct_f1_ghist_T_5 = ((s1_ghist_old_history == _f4_decoded_ghist_new_history_old_history_T_6) & ~s1_ghist_new_saw_branch_taken) & (s1_ghist_new_saw_branch_taken | ~s1_ghist_new_saw_branch_not_taken);
	wire _f4_correct_f2_ghist_T_5 = ((s2_ghist_old_history == _f4_decoded_ghist_new_history_old_history_T_6) & ~s2_ghist_new_saw_branch_taken) & (s2_ghist_new_saw_branch_taken | ~s2_ghist_new_saw_branch_not_taken);
	wire _f4_correct_f3_ghist_T_5 = ((_f3_io_deq_bits_ghist_old_history == _f4_decoded_ghist_new_history_old_history_T_6) & ~_f3_io_deq_bits_ghist_new_saw_branch_taken) & (_f3_io_deq_bits_ghist_new_saw_branch_taken | ~_f3_io_deq_bits_ghist_new_saw_branch_not_taken);
	wire _GEN_54 = (_f3_io_deq_valid & (_f3_io_deq_bits_pc == f4_decoded_target)) & _f4_correct_f3_ghist_T_5;
	wire _GEN_55 = _f4_io_deq_valid & _GEN_54;
	assign _GEN_0 = (_GEN_55 ? f4_decoded_ghist_ras_idx : _f3_io_deq_bits_ghist_ras_idx);
	wire _GEN_56 = ~_f3_io_deq_valid & s2_valid;
	wire _GEN_57 = (_GEN_56 & (s2_vpc == f4_decoded_target)) & _f4_correct_f2_ghist_T_5;
	wire _GEN_58 = (~_f4_io_deq_valid | _GEN_54) | ~_GEN_57;
	wire _GEN_59 = _GEN_57 | _GEN_46;
	wire _GEN_60 = ~_f4_io_deq_valid | _GEN_54;
	wire _GEN_61 = ~_f3_io_deq_valid & ~s2_valid;
	wire _GEN_62 = (_GEN_61 & (s1_vpc == f4_decoded_target)) & _f4_correct_f1_ghist_T_5;
	wire _GEN_63 = _GEN_54 | _GEN_57;
	wire _GEN_64 = (((_f3_io_deq_valid & ((_f3_io_deq_bits_pc != f4_decoded_target) | ~_f4_correct_f3_ghist_T_5)) | (_GEN_56 & ((s2_vpc != f4_decoded_target) | ~_f4_correct_f2_ghist_T_5))) | ((_GEN_61 & s1_valid) & ((s1_vpc != f4_decoded_target) | ~_f4_correct_f1_ghist_T_5))) | (_GEN_61 & ~s1_valid);
	wire _GEN_65 = (_GEN_54 | _GEN_57) | _GEN_62;
	wire _GEN_66 = (_f4_io_deq_valid & ~_GEN_65) & _GEN_64;
	wire _GEN_67 = (~_f4_io_deq_valid | _GEN_65) | ~_GEN_64;
	wire [39:0] _GEN_68 = {1'h0, io_cpu_sfence_bits_addr};
	wire _GEN_69 = io_cpu_sfence_valid | io_cpu_redirect_flush;
	wire _GEN_70 = io_cpu_sfence_valid | ~io_cpu_redirect_flush;
	assign _GEN = (_GEN_70 ? (_GEN_67 ? (_GEN_48 ? (_GEN_6 ? s2_ghist_old_history : (_GEN_10 ? _f2_predicted_ghist_new_history_old_history_T_6 : (s1_valid ? _f1_predicted_ghist_new_history_old_history_T_6 : 64'h0000000000000000))) : _f3_predicted_ghist_new_history_old_history_T_6) : _f4_decoded_ghist_new_history_old_history_T_6) : io_cpu_redirect_ghist_old_history);
	assign s0_valid = jump_to_reset | (~io_cpu_sfence_valid & (io_cpu_redirect_flush ? io_cpu_redirect_val : (_GEN_67 ? (_GEN_48 ? (_GEN_6 ? ((~s2_tlb_resp_ae_inst & ~s2_tlb_resp_pf_inst) | s2_is_replay) | s2_tlb_miss : (_GEN_10 ? ~(_f3_io_enq_valid_T_2 & ~s2_is_replay) : s1_valid)) : ~_s0_valid_T_9) : ~(_f4_io_deq_bits_xcpt_pf_if | _f4_io_deq_bits_xcpt_ae_if))));
	assign s0_vpc = (jump_to_reset ? 40'h0000010040 : (io_cpu_sfence_valid ? _GEN_68 : (io_cpu_redirect_flush ? io_cpu_redirect_pc : (_GEN_67 ? (_GEN_48 ? (_GEN_6 ? s2_vpc : (_GEN_10 ? f2_predicted_target : (s1_valid ? (f1_do_redirect ? f1_targ : _f1_next_fetch_T_3) : 40'h0000000000))) : f3_predicted_target) : f4_decoded_target))));
	wire [2:0] s0_tsrc = (jump_to_reset | ~_GEN_70 ? 3'h4 : (_GEN_67 ? (_GEN_48 ? (_GEN_6 ? s2_tsrc : _GEN_11) : 3'h2) : 3'h3));
	wire _GEN_71 = jump_to_reset | io_cpu_sfence_valid;
	assign f4_clear = _GEN_71 | io_cpu_redirect_flush;
	wire _GEN_72 = jump_to_reset | _GEN_69;
	assign f3_clear = _GEN_72 | ((_f4_io_deq_valid & ~(_GEN_63 | _GEN_62)) & _GEN_64);
	assign f2_clear = (_GEN_72 | _GEN_66) | ((_GEN_44 & ~_GEN_45) & _GEN_47);
	assign f1_clear = (_GEN_72 | _GEN_66) | (~_GEN_44 | _GEN_45 ? _GEN_6 | _GEN_9 : (_GEN_47 | _GEN_6) | _GEN_9);
	always @(posedge clock) begin : sv2v_autoblock_1
		reg _GEN_73;
		reg _GEN_74;
		reg _GEN_75;
		_GEN_75 = (~_f4_io_deq_valid | _GEN_63) | ~_GEN_62;
		_GEN_73 = _GEN_6 | ~(((_GEN_7 & s1_valid) & (s1_vpc == f2_predicted_target)) & _f2_correct_f1_ghist_T_5);
		_GEN_74 = _GEN_6 | ~_GEN_7;
		if (jump_to_reset) begin
			s1_vpc <= 40'h0000010040;
			s1_ghist_old_history <= 64'h0000000000000000;
			s1_ghist_ras_idx <= 5'h00;
		end
		else begin
			if (io_cpu_sfence_valid)
				s1_vpc <= _GEN_68;
			else if (io_cpu_redirect_flush)
				s1_vpc <= io_cpu_redirect_pc;
			else if (_GEN_67) begin
				if (_GEN_48) begin
					if (_GEN_6)
						s1_vpc <= s2_vpc;
					else if (_GEN_10)
						s1_vpc <= f2_predicted_target;
					else if (s1_valid) begin
						if (f1_do_redirect)
							s1_vpc <= f1_targ;
						else
							s1_vpc <= _f1_next_fetch_T_3;
					end
					else
						s1_vpc <= 40'h0000000000;
				end
				else
					s1_vpc <= f3_predicted_target;
			end
			else
				s1_vpc <= f4_decoded_target;
			if (_GEN_70) begin
				if (_GEN_67) begin
					if (_GEN_48) begin
						if (_GEN_6)
							s1_ghist_old_history <= s2_ghist_old_history;
						else if (_GEN_10)
							s1_ghist_old_history <= _f2_predicted_ghist_new_history_old_history_T_6;
						else if (s1_valid)
							s1_ghist_old_history <= _f1_predicted_ghist_new_history_old_history_T_6;
						else
							s1_ghist_old_history <= 64'h0000000000000000;
						if (_GEN_6 | _GEN_10)
							s1_ghist_ras_idx <= s2_ghist_ras_idx;
						else if (s1_valid)
							;
						else
							s1_ghist_ras_idx <= 5'h00;
					end
					else begin
						s1_ghist_old_history <= _f3_predicted_ghist_new_history_old_history_T_6;
						s1_ghist_ras_idx <= _f3_io_deq_bits_ghist_ras_idx;
					end
				end
				else begin
					s1_ghist_old_history <= _f4_decoded_ghist_new_history_old_history_T_6;
					s1_ghist_ras_idx <= f4_decoded_ghist_ras_idx;
				end
			end
			else begin
				s1_ghist_old_history <= io_cpu_redirect_ghist_old_history;
				s1_ghist_ras_idx <= io_cpu_redirect_ghist_ras_idx;
			end
		end
		s1_ghist_current_saw_branch_not_taken <= ~jump_to_reset & (_GEN_70 ? ((_GEN_67 & _GEN_48) & _GEN_6) & s2_ghist_current_saw_branch_not_taken : io_cpu_redirect_ghist_current_saw_branch_not_taken);
		s1_ghist_new_saw_branch_not_taken <= ~jump_to_reset & (_GEN_70 ? ((_GEN_67 & _GEN_48) & _GEN_6) & s2_ghist_new_saw_branch_not_taken : io_cpu_redirect_ghist_new_saw_branch_not_taken);
		s1_ghist_new_saw_branch_taken <= ~jump_to_reset & (_GEN_70 ? ((_GEN_67 & _GEN_48) & _GEN_6) & s2_ghist_new_saw_branch_taken : io_cpu_redirect_ghist_new_saw_branch_taken);
		s1_is_replay <= (((~_GEN_69 & _GEN_67) & _GEN_48) & _GEN_6) & _s0_is_replay_T;
		s1_is_sfence <= io_cpu_sfence_valid;
		s1_tsrc <= s0_tsrc;
		tlb_io_sfence_REG_valid <= io_cpu_sfence_valid;
		tlb_io_sfence_REG_bits_rs1 <= io_cpu_sfence_bits_rs1;
		tlb_io_sfence_REG_bits_rs2 <= io_cpu_sfence_bits_rs2;
		tlb_io_sfence_REG_bits_addr <= io_cpu_sfence_bits_addr;
		s1_tlb_resp_REG_pf_inst <= s2_tlb_resp_pf_inst;
		s1_tlb_resp_REG_ae_inst <= s2_tlb_resp_ae_inst;
		s1_ppc_REG <= s2_ppc;
		s2_vpc <= s1_vpc;
		if (_GEN_75) begin
			if (_GEN_73)
				s2_ghist_old_history <= s1_ghist_old_history;
			else
				s2_ghist_old_history <= _f2_predicted_ghist_new_history_old_history_T_6;
		end
		else
			s2_ghist_old_history <= _f4_decoded_ghist_new_history_old_history_T_6;
		s2_ghist_current_saw_branch_not_taken <= (_GEN_75 & _GEN_73) & s1_ghist_current_saw_branch_not_taken;
		s2_ghist_new_saw_branch_not_taken <= (_GEN_75 & _GEN_73) & s1_ghist_new_saw_branch_not_taken;
		s2_ghist_new_saw_branch_taken <= (_GEN_75 & _GEN_73) & s1_ghist_new_saw_branch_taken;
		if (_GEN_75) begin
			if (_GEN_73)
				s2_ghist_ras_idx <= s1_ghist_ras_idx;
		end
		else
			s2_ghist_ras_idx <= f4_decoded_ghist_ras_idx;
		s2_ppc <= s1_ppc;
		s2_tsrc <= s1_tsrc;
		s2_tlb_resp_pf_inst <= (s1_is_replay ? s1_tlb_resp_REG_pf_inst : _tlb_io_resp_pf_inst);
		s2_tlb_resp_ae_inst <= (s1_is_replay ? s1_tlb_resp_REG_ae_inst : _tlb_io_resp_ae_inst);
		s2_tlb_miss <= ~s1_is_replay & _tlb_io_resp_miss;
		s2_is_replay_REG <= s1_is_replay;
		f2_next_fetch <= _f1_next_fetch_T_3;
		if (_GEN_67) begin
			if (_GEN_48) begin
				if (_GEN_74)
					;
				else
					f2_prev_half <= _icache_io_resp_bits_data[63:48];
			end
			else
				f2_prev_half <= _f3_io_deq_bits_end_half_bits;
		end
		else
			f2_prev_half <= _f4_io_deq_bits_end_half_bits;
		f3_bpd_queue_io_enq_valid_REG <= _f3_io_enq_ready;
		if (reset) begin
			s1_valid <= 1'h0;
			s2_valid <= 1'h0;
			f2_prev_is_half <= 1'h0;
			ras_read_idx <= 5'h00;
			jump_to_reset <= 1'h1;
		end
		else begin
			s1_valid <= s0_valid;
			s2_valid <= s1_valid & ~f1_clear;
			f2_prev_is_half <= ~(_GEN_71 | io_cpu_redirect_flush) & (_GEN_67 ? (_GEN_48 ? (_GEN_74 ? f2_prev_is_half : f2_fetch_bundle_end_half_valid & ~f2_do_redirect) : _f3_io_deq_bits_end_half_valid & ~f3_predicted_do_redirect) : _f4_io_deq_bits_end_half_valid & ~_f4_io_deq_bits_cfi_idx_valid);
			if (_f4_btb_corrections_io_enq_valid_T)
				ras_read_idx <= _GEN_0;
			jump_to_reset <= 1'h0;
		end
	end
	ICache icache(
		.clock(clock),
		.reset(reset),
		.auto_master_out_a_ready(auto_icache_master_out_a_ready),
		.auto_master_out_a_valid(auto_icache_master_out_a_valid),
		.auto_master_out_a_bits_address(auto_icache_master_out_a_bits_address),
		.auto_master_out_d_valid(auto_icache_master_out_d_valid),
		.auto_master_out_d_bits_opcode(auto_icache_master_out_d_bits_opcode),
		.auto_master_out_d_bits_size(auto_icache_master_out_d_bits_size),
		.auto_master_out_d_bits_data(auto_icache_master_out_d_bits_data),
		.io_req_valid(s0_valid),
		.io_req_bits_addr(s0_vpc[38:0]),
		.io_s1_paddr(s1_ppc),
		.io_s1_kill(_tlb_io_resp_miss | f1_clear),
		.io_s2_kill((s2_valid & _f3_io_enq_valid_T_2) & ~s2_is_replay),
		.io_resp_valid(_icache_io_resp_valid),
		.io_resp_bits_data(_icache_io_resp_bits_data),
		.io_invalidate(io_cpu_flush_icache),
		.io_perf_acquire(io_cpu_perf_acquire)
	);
	BranchPredictor bpd(
		.clock(clock),
		.reset(reset),
		.io_f0_req_valid(s0_valid & io_cpu_enable_bpd),
		.io_f0_req_bits_pc((io_cpu_enable_bpd ? s0_vpc : 40'h0000000000)),
		.io_f0_req_bits_ghist_old_history((~io_cpu_enable_bpd | jump_to_reset ? 64'h0000000000000000 : _GEN)),
		.io_resp_f1_preds_0_taken(_bpd_io_resp_f1_preds_0_taken),
		.io_resp_f1_preds_0_is_br(_bpd_io_resp_f1_preds_0_is_br),
		.io_resp_f1_preds_0_predicted_pc_valid(_bpd_io_resp_f1_preds_0_predicted_pc_valid),
		.io_resp_f1_preds_0_predicted_pc_bits(_bpd_io_resp_f1_preds_0_predicted_pc_bits),
		.io_resp_f1_preds_1_taken(_bpd_io_resp_f1_preds_1_taken),
		.io_resp_f1_preds_1_is_br(_bpd_io_resp_f1_preds_1_is_br),
		.io_resp_f1_preds_1_predicted_pc_valid(_bpd_io_resp_f1_preds_1_predicted_pc_valid),
		.io_resp_f1_preds_1_predicted_pc_bits(_bpd_io_resp_f1_preds_1_predicted_pc_bits),
		.io_resp_f1_preds_2_taken(_bpd_io_resp_f1_preds_2_taken),
		.io_resp_f1_preds_2_is_br(_bpd_io_resp_f1_preds_2_is_br),
		.io_resp_f1_preds_2_predicted_pc_valid(_bpd_io_resp_f1_preds_2_predicted_pc_valid),
		.io_resp_f1_preds_2_predicted_pc_bits(_bpd_io_resp_f1_preds_2_predicted_pc_bits),
		.io_resp_f1_preds_3_taken(_bpd_io_resp_f1_preds_3_taken),
		.io_resp_f1_preds_3_is_br(_bpd_io_resp_f1_preds_3_is_br),
		.io_resp_f1_preds_3_predicted_pc_valid(_bpd_io_resp_f1_preds_3_predicted_pc_valid),
		.io_resp_f1_preds_3_predicted_pc_bits(_bpd_io_resp_f1_preds_3_predicted_pc_bits),
		.io_resp_f2_preds_0_taken(_bpd_io_resp_f2_preds_0_taken),
		.io_resp_f2_preds_0_is_br(_bpd_io_resp_f2_preds_0_is_br),
		.io_resp_f2_preds_0_predicted_pc_valid(_bpd_io_resp_f2_preds_0_predicted_pc_valid),
		.io_resp_f2_preds_0_predicted_pc_bits(_bpd_io_resp_f2_preds_0_predicted_pc_bits),
		.io_resp_f2_preds_1_taken(_bpd_io_resp_f2_preds_1_taken),
		.io_resp_f2_preds_1_is_br(_bpd_io_resp_f2_preds_1_is_br),
		.io_resp_f2_preds_1_predicted_pc_valid(_bpd_io_resp_f2_preds_1_predicted_pc_valid),
		.io_resp_f2_preds_1_predicted_pc_bits(_bpd_io_resp_f2_preds_1_predicted_pc_bits),
		.io_resp_f2_preds_2_taken(_bpd_io_resp_f2_preds_2_taken),
		.io_resp_f2_preds_2_is_br(_bpd_io_resp_f2_preds_2_is_br),
		.io_resp_f2_preds_2_predicted_pc_valid(_bpd_io_resp_f2_preds_2_predicted_pc_valid),
		.io_resp_f2_preds_2_predicted_pc_bits(_bpd_io_resp_f2_preds_2_predicted_pc_bits),
		.io_resp_f2_preds_3_taken(_bpd_io_resp_f2_preds_3_taken),
		.io_resp_f2_preds_3_is_br(_bpd_io_resp_f2_preds_3_is_br),
		.io_resp_f2_preds_3_predicted_pc_valid(_bpd_io_resp_f2_preds_3_predicted_pc_valid),
		.io_resp_f2_preds_3_predicted_pc_bits(_bpd_io_resp_f2_preds_3_predicted_pc_bits),
		.io_resp_f3_pc(_bpd_io_resp_f3_pc),
		.io_resp_f3_preds_0_taken(_bpd_io_resp_f3_preds_0_taken),
		.io_resp_f3_preds_0_is_br(_bpd_io_resp_f3_preds_0_is_br),
		.io_resp_f3_preds_0_is_jal(_bpd_io_resp_f3_preds_0_is_jal),
		.io_resp_f3_preds_0_predicted_pc_valid(_bpd_io_resp_f3_preds_0_predicted_pc_valid),
		.io_resp_f3_preds_0_predicted_pc_bits(_bpd_io_resp_f3_preds_0_predicted_pc_bits),
		.io_resp_f3_preds_1_taken(_bpd_io_resp_f3_preds_1_taken),
		.io_resp_f3_preds_1_is_br(_bpd_io_resp_f3_preds_1_is_br),
		.io_resp_f3_preds_1_is_jal(_bpd_io_resp_f3_preds_1_is_jal),
		.io_resp_f3_preds_1_predicted_pc_valid(_bpd_io_resp_f3_preds_1_predicted_pc_valid),
		.io_resp_f3_preds_1_predicted_pc_bits(_bpd_io_resp_f3_preds_1_predicted_pc_bits),
		.io_resp_f3_preds_2_taken(_bpd_io_resp_f3_preds_2_taken),
		.io_resp_f3_preds_2_is_br(_bpd_io_resp_f3_preds_2_is_br),
		.io_resp_f3_preds_2_is_jal(_bpd_io_resp_f3_preds_2_is_jal),
		.io_resp_f3_preds_2_predicted_pc_valid(_bpd_io_resp_f3_preds_2_predicted_pc_valid),
		.io_resp_f3_preds_2_predicted_pc_bits(_bpd_io_resp_f3_preds_2_predicted_pc_bits),
		.io_resp_f3_preds_3_taken(_bpd_io_resp_f3_preds_3_taken),
		.io_resp_f3_preds_3_is_br(_bpd_io_resp_f3_preds_3_is_br),
		.io_resp_f3_preds_3_is_jal(_bpd_io_resp_f3_preds_3_is_jal),
		.io_resp_f3_preds_3_predicted_pc_valid(_bpd_io_resp_f3_preds_3_predicted_pc_valid),
		.io_resp_f3_preds_3_predicted_pc_bits(_bpd_io_resp_f3_preds_3_predicted_pc_bits),
		.io_resp_f3_meta_0(_bpd_io_resp_f3_meta_0),
		.io_f3_fire(_f3_bpd_queue_io_enq_ready & _f3_bpd_queue_io_enq_valid_T),
		.io_update_valid(_bpd_update_arbiter_io_out_valid),
		.io_update_bits_is_mispredict_update(_bpd_update_arbiter_io_out_bits_is_mispredict_update),
		.io_update_bits_is_repair_update(_bpd_update_arbiter_io_out_bits_is_repair_update),
		.io_update_bits_btb_mispredicts(_bpd_update_arbiter_io_out_bits_btb_mispredicts),
		.io_update_bits_pc(_bpd_update_arbiter_io_out_bits_pc),
		.io_update_bits_br_mask(_bpd_update_arbiter_io_out_bits_br_mask),
		.io_update_bits_cfi_idx_valid(_bpd_update_arbiter_io_out_bits_cfi_idx_valid),
		.io_update_bits_cfi_idx_bits(_bpd_update_arbiter_io_out_bits_cfi_idx_bits),
		.io_update_bits_cfi_taken(_bpd_update_arbiter_io_out_bits_cfi_taken),
		.io_update_bits_cfi_mispredicted(_bpd_update_arbiter_io_out_bits_cfi_mispredicted),
		.io_update_bits_cfi_is_br(_bpd_update_arbiter_io_out_bits_cfi_is_br),
		.io_update_bits_cfi_is_jal(_bpd_update_arbiter_io_out_bits_cfi_is_jal),
		.io_update_bits_cfi_is_jalr(_bpd_update_arbiter_io_out_bits_cfi_is_jalr),
		.io_update_bits_ghist_old_history(_bpd_update_arbiter_io_out_bits_ghist_old_history),
		.io_update_bits_target(_bpd_update_arbiter_io_out_bits_target),
		.io_update_bits_meta_0(_bpd_update_arbiter_io_out_bits_meta_0)
	);
	BoomRAS ras(
		.clock(clock),
		.io_read_idx((_f4_btb_corrections_io_enq_valid_T ? _GEN_0 : ras_read_idx)),
		.io_read_addr(_ras_io_read_addr),
		.io_write_valid(_ftq_io_ras_update | ((_f4_io_deq_valid & _f4_io_deq_bits_cfi_is_call) & _f4_io_deq_bits_cfi_idx_valid)),
		.io_write_idx((_ftq_io_ras_update ? _ftq_io_ras_update_idx : _ras_io_write_idx_T)),
		.io_write_addr((_ftq_io_ras_update ? _ftq_io_ras_update_pc : ({_f4_io_deq_bits_pc[39:3], 3'h0} + {37'h0000000000, _f4_io_deq_bits_cfi_idx_bits, 1'h0}) + {37'h0000000000, (_f4_io_deq_bits_cfi_npc_plus4 ? 3'h4 : 3'h2)}))
	);
	ITLB tlb(
		.clock(clock),
		.reset(reset),
		.io_req_valid(((s1_valid & ~s1_is_replay) & ~f1_clear) | s1_is_sfence),
		.io_req_bits_vaddr(s1_vpc),
		.io_req_bits_prv(io_ptw_status_prv),
		.io_resp_miss(_tlb_io_resp_miss),
		.io_resp_paddr(_tlb_io_resp_paddr),
		.io_resp_pf_inst(_tlb_io_resp_pf_inst),
		.io_resp_ae_inst(_tlb_io_resp_ae_inst),
		.io_sfence_valid(tlb_io_sfence_REG_valid),
		.io_sfence_bits_rs1(tlb_io_sfence_REG_bits_rs1),
		.io_sfence_bits_rs2(tlb_io_sfence_REG_bits_rs2),
		.io_sfence_bits_addr(tlb_io_sfence_REG_bits_addr),
		.io_ptw_req_ready(io_ptw_req_ready),
		.io_ptw_req_valid(_tlb_io_ptw_req_valid),
		.io_ptw_req_bits_bits_addr(io_ptw_req_bits_bits_addr),
		.io_ptw_req_bits_bits_need_gpa(io_ptw_req_bits_bits_need_gpa),
		.io_ptw_resp_valid(io_ptw_resp_valid),
		.io_ptw_resp_bits_ae_ptw(io_ptw_resp_bits_ae_ptw),
		.io_ptw_resp_bits_ae_final(io_ptw_resp_bits_ae_final),
		.io_ptw_resp_bits_pf(io_ptw_resp_bits_pf),
		.io_ptw_resp_bits_gf(io_ptw_resp_bits_gf),
		.io_ptw_resp_bits_hr(io_ptw_resp_bits_hr),
		.io_ptw_resp_bits_hw(io_ptw_resp_bits_hw),
		.io_ptw_resp_bits_hx(io_ptw_resp_bits_hx),
		.io_ptw_resp_bits_pte_ppn(io_ptw_resp_bits_pte_ppn),
		.io_ptw_resp_bits_pte_d(io_ptw_resp_bits_pte_d),
		.io_ptw_resp_bits_pte_a(io_ptw_resp_bits_pte_a),
		.io_ptw_resp_bits_pte_g(io_ptw_resp_bits_pte_g),
		.io_ptw_resp_bits_pte_u(io_ptw_resp_bits_pte_u),
		.io_ptw_resp_bits_pte_x(io_ptw_resp_bits_pte_x),
		.io_ptw_resp_bits_pte_w(io_ptw_resp_bits_pte_w),
		.io_ptw_resp_bits_pte_r(io_ptw_resp_bits_pte_r),
		.io_ptw_resp_bits_pte_v(io_ptw_resp_bits_pte_v),
		.io_ptw_resp_bits_level(io_ptw_resp_bits_level),
		.io_ptw_resp_bits_homogeneous(io_ptw_resp_bits_homogeneous),
		.io_ptw_ptbr_mode(io_ptw_ptbr_mode),
		.io_ptw_status_debug(io_ptw_status_debug),
		.io_ptw_pmp_0_cfg_l(io_ptw_pmp_0_cfg_l),
		.io_ptw_pmp_0_cfg_a(io_ptw_pmp_0_cfg_a),
		.io_ptw_pmp_0_cfg_x(io_ptw_pmp_0_cfg_x),
		.io_ptw_pmp_0_cfg_w(io_ptw_pmp_0_cfg_w),
		.io_ptw_pmp_0_cfg_r(io_ptw_pmp_0_cfg_r),
		.io_ptw_pmp_0_addr(io_ptw_pmp_0_addr),
		.io_ptw_pmp_0_mask(io_ptw_pmp_0_mask),
		.io_ptw_pmp_1_cfg_l(io_ptw_pmp_1_cfg_l),
		.io_ptw_pmp_1_cfg_a(io_ptw_pmp_1_cfg_a),
		.io_ptw_pmp_1_cfg_x(io_ptw_pmp_1_cfg_x),
		.io_ptw_pmp_1_cfg_w(io_ptw_pmp_1_cfg_w),
		.io_ptw_pmp_1_cfg_r(io_ptw_pmp_1_cfg_r),
		.io_ptw_pmp_1_addr(io_ptw_pmp_1_addr),
		.io_ptw_pmp_1_mask(io_ptw_pmp_1_mask),
		.io_ptw_pmp_2_cfg_l(io_ptw_pmp_2_cfg_l),
		.io_ptw_pmp_2_cfg_a(io_ptw_pmp_2_cfg_a),
		.io_ptw_pmp_2_cfg_x(io_ptw_pmp_2_cfg_x),
		.io_ptw_pmp_2_cfg_w(io_ptw_pmp_2_cfg_w),
		.io_ptw_pmp_2_cfg_r(io_ptw_pmp_2_cfg_r),
		.io_ptw_pmp_2_addr(io_ptw_pmp_2_addr),
		.io_ptw_pmp_2_mask(io_ptw_pmp_2_mask),
		.io_ptw_pmp_3_cfg_l(io_ptw_pmp_3_cfg_l),
		.io_ptw_pmp_3_cfg_a(io_ptw_pmp_3_cfg_a),
		.io_ptw_pmp_3_cfg_x(io_ptw_pmp_3_cfg_x),
		.io_ptw_pmp_3_cfg_w(io_ptw_pmp_3_cfg_w),
		.io_ptw_pmp_3_cfg_r(io_ptw_pmp_3_cfg_r),
		.io_ptw_pmp_3_addr(io_ptw_pmp_3_addr),
		.io_ptw_pmp_3_mask(io_ptw_pmp_3_mask),
		.io_ptw_pmp_4_cfg_l(io_ptw_pmp_4_cfg_l),
		.io_ptw_pmp_4_cfg_a(io_ptw_pmp_4_cfg_a),
		.io_ptw_pmp_4_cfg_x(io_ptw_pmp_4_cfg_x),
		.io_ptw_pmp_4_cfg_w(io_ptw_pmp_4_cfg_w),
		.io_ptw_pmp_4_cfg_r(io_ptw_pmp_4_cfg_r),
		.io_ptw_pmp_4_addr(io_ptw_pmp_4_addr),
		.io_ptw_pmp_4_mask(io_ptw_pmp_4_mask),
		.io_ptw_pmp_5_cfg_l(io_ptw_pmp_5_cfg_l),
		.io_ptw_pmp_5_cfg_a(io_ptw_pmp_5_cfg_a),
		.io_ptw_pmp_5_cfg_x(io_ptw_pmp_5_cfg_x),
		.io_ptw_pmp_5_cfg_w(io_ptw_pmp_5_cfg_w),
		.io_ptw_pmp_5_cfg_r(io_ptw_pmp_5_cfg_r),
		.io_ptw_pmp_5_addr(io_ptw_pmp_5_addr),
		.io_ptw_pmp_5_mask(io_ptw_pmp_5_mask),
		.io_ptw_pmp_6_cfg_l(io_ptw_pmp_6_cfg_l),
		.io_ptw_pmp_6_cfg_a(io_ptw_pmp_6_cfg_a),
		.io_ptw_pmp_6_cfg_x(io_ptw_pmp_6_cfg_x),
		.io_ptw_pmp_6_cfg_w(io_ptw_pmp_6_cfg_w),
		.io_ptw_pmp_6_cfg_r(io_ptw_pmp_6_cfg_r),
		.io_ptw_pmp_6_addr(io_ptw_pmp_6_addr),
		.io_ptw_pmp_6_mask(io_ptw_pmp_6_mask),
		.io_ptw_pmp_7_cfg_l(io_ptw_pmp_7_cfg_l),
		.io_ptw_pmp_7_cfg_a(io_ptw_pmp_7_cfg_a),
		.io_ptw_pmp_7_cfg_x(io_ptw_pmp_7_cfg_x),
		.io_ptw_pmp_7_cfg_w(io_ptw_pmp_7_cfg_w),
		.io_ptw_pmp_7_cfg_r(io_ptw_pmp_7_cfg_r),
		.io_ptw_pmp_7_addr(io_ptw_pmp_7_addr),
		.io_ptw_pmp_7_mask(io_ptw_pmp_7_mask)
	);
	RVCExpander f2_fetch_bundle_exp_insts_0_rvc_exp(
		.io_in(_f2_fetch_bundle_exp_insts_0_T_1),
		.io_out_bits(_f2_fetch_bundle_exp_insts_0_rvc_exp_io_out_bits),
		.io_rvc(_f2_fetch_bundle_exp_insts_0_rvc_exp_io_rvc)
	);
	RVCExpander f2_fetch_bundle_exp_insts_0_rvc_exp_1(
		.io_in(_icache_io_resp_bits_data[31:0]),
		.io_out_bits(_f2_fetch_bundle_exp_insts_0_rvc_exp_1_io_out_bits),
		.io_rvc(_f2_fetch_bundle_exp_insts_0_rvc_exp_1_io_rvc)
	);
	RVCExpander f2_fetch_bundle_exp_insts_1_rvc_exp(
		.io_in(_icache_io_resp_bits_data[47:16]),
		.io_out_bits(_f2_fetch_bundle_exp_insts_1_rvc_exp_io_out_bits),
		.io_rvc(_f2_fetch_bundle_exp_insts_1_rvc_exp_io_rvc)
	);
	RVCExpander f2_fetch_bundle_exp_insts_2_rvc_exp(
		.io_in(_icache_io_resp_bits_data[63:32]),
		.io_out_bits(_f2_fetch_bundle_exp_insts_2_rvc_exp_io_out_bits),
		.io_rvc(_f2_fetch_bundle_exp_insts_2_rvc_exp_io_rvc)
	);
	RVCExpander f2_fetch_bundle_exp_insts_3_rvc_exp(
		.io_in(inst_2),
		.io_out_bits(_f2_fetch_bundle_exp_insts_3_rvc_exp_io_out_bits),
		.io_rvc(_f2_fetch_bundle_exp_insts_3_rvc_exp_io_rvc)
	);
	Queue1_FetchBundle f3(
		.clock(clock),
		.reset(_GEN_12),
		.io_enq_ready(_f3_io_enq_ready),
		.io_enq_valid((s2_valid & ~f2_clear) & (_icache_io_resp_valid | (_f3_io_enq_valid_T_2 & ~s2_tlb_miss))),
		.io_enq_bits_pc(s2_vpc),
		.io_enq_bits_next_pc((f2_do_redirect ? (f2_redirects_0 ? _bpd_io_resp_f2_preds_0_predicted_pc_bits : (f2_redirects_1 ? _bpd_io_resp_f2_preds_1_predicted_pc_bits : _f2_fetch_bundle_next_pc_T)) : f2_next_fetch)),
		.io_enq_bits_next_fetch(f2_next_fetch),
		.io_enq_bits_edge_inst_0(f2_prev_is_half),
		.io_enq_bits_insts_0(f2_fetch_bundle_insts_0),
		.io_enq_bits_insts_1(_icache_io_resp_bits_data[47:16]),
		.io_enq_bits_insts_2(_icache_io_resp_bits_data[63:32]),
		.io_enq_bits_insts_3(inst_2),
		.io_enq_bits_exp_insts_0((f2_prev_is_half ? (_f2_fetch_bundle_exp_insts_0_rvc_exp_io_rvc ? _f2_fetch_bundle_exp_insts_0_rvc_exp_io_out_bits : _f2_fetch_bundle_exp_insts_0_T_1) : (_f2_fetch_bundle_exp_insts_0_rvc_exp_1_io_rvc ? _f2_fetch_bundle_exp_insts_0_rvc_exp_1_io_out_bits : _icache_io_resp_bits_data[31:0]))),
		.io_enq_bits_exp_insts_1((_f2_fetch_bundle_exp_insts_1_rvc_exp_io_rvc ? _f2_fetch_bundle_exp_insts_1_rvc_exp_io_out_bits : _icache_io_resp_bits_data[47:16])),
		.io_enq_bits_exp_insts_2((_f2_fetch_bundle_exp_insts_2_rvc_exp_io_rvc ? _f2_fetch_bundle_exp_insts_2_rvc_exp_io_out_bits : _icache_io_resp_bits_data[63:32])),
		.io_enq_bits_exp_insts_3((_f2_fetch_bundle_exp_insts_3_rvc_exp_io_rvc ? _f2_fetch_bundle_exp_insts_3_rvc_exp_io_out_bits : inst_2)),
		.io_enq_bits_pcs_0(_GEN_5 - {38'h0000000000, f2_prev_is_half, 1'h0}),
		.io_enq_bits_pcs_1(_GEN_5 + 40'h0000000002),
		.io_enq_bits_pcs_2(_GEN_5 + 40'h0000000004),
		.io_enq_bits_pcs_3(_GEN_5 + 40'h0000000006),
		.io_enq_bits_cfi_idx_valid((_f2_fetch_bundle_cfi_idx_valid_T | f2_redirects_2) | f2_redirects_3),
		.io_enq_bits_cfi_idx_bits((f2_redirects_0 ? 2'h0 : (f2_redirects_1 ? 2'h1 : _f2_fetch_bundle_cfi_idx_bits_T))),
		.io_enq_bits_mask({f2_inst_mask_3, f2_inst_mask_2, f2_inst_mask_1, f2_inst_mask_0}),
		.io_enq_bits_ghist_old_history((_GEN_58 ? (_GEN_46 ? _f3_predicted_ghist_new_history_old_history_T_6 : s2_ghist_old_history) : _f4_decoded_ghist_new_history_old_history_T_6)),
		.io_enq_bits_ghist_current_saw_branch_not_taken((_GEN_60 ? ~_GEN_46 & s2_ghist_current_saw_branch_not_taken : ~_GEN_59 & s2_ghist_current_saw_branch_not_taken)),
		.io_enq_bits_ghist_new_saw_branch_not_taken((_GEN_60 ? ~_GEN_46 & s2_ghist_new_saw_branch_not_taken : ~_GEN_59 & s2_ghist_new_saw_branch_not_taken)),
		.io_enq_bits_ghist_new_saw_branch_taken((_GEN_60 ? ~_GEN_46 & s2_ghist_new_saw_branch_taken : ~_GEN_59 & s2_ghist_new_saw_branch_taken)),
		.io_enq_bits_ghist_ras_idx((_GEN_58 ? (_GEN_46 ? _f3_io_deq_bits_ghist_ras_idx : s2_ghist_ras_idx) : f4_decoded_ghist_ras_idx)),
		.io_enq_bits_xcpt_pf_if(s2_tlb_resp_pf_inst),
		.io_enq_bits_xcpt_ae_if(s2_tlb_resp_ae_inst),
		.io_enq_bits_end_half_valid(f2_fetch_bundle_end_half_valid),
		.io_enq_bits_end_half_bits(_icache_io_resp_bits_data[63:48]),
		.io_enq_bits_fsrc((_GEN_6 ? 3'h0 : _GEN_11)),
		.io_enq_bits_tsrc(s2_tsrc),
		.io_deq_ready(_f4_io_enq_ready),
		.io_deq_valid(_f3_io_deq_valid),
		.io_deq_bits_pc(_f3_io_deq_bits_pc),
		.io_deq_bits_next_fetch(_f3_io_deq_bits_next_fetch),
		.io_deq_bits_edge_inst_0(_f3_io_deq_bits_edge_inst_0),
		.io_deq_bits_insts_0(_f3_io_deq_bits_insts_0),
		.io_deq_bits_insts_1(_f3_io_deq_bits_insts_1),
		.io_deq_bits_insts_2(_f3_io_deq_bits_insts_2),
		.io_deq_bits_insts_3(_f3_io_deq_bits_insts_3),
		.io_deq_bits_exp_insts_0(_f3_io_deq_bits_exp_insts_0),
		.io_deq_bits_exp_insts_1(_f3_io_deq_bits_exp_insts_1),
		.io_deq_bits_exp_insts_2(_f3_io_deq_bits_exp_insts_2),
		.io_deq_bits_exp_insts_3(_f3_io_deq_bits_exp_insts_3),
		.io_deq_bits_pcs_0(_f3_io_deq_bits_pcs_0),
		.io_deq_bits_pcs_1(_f3_io_deq_bits_pcs_1),
		.io_deq_bits_pcs_2(_f3_io_deq_bits_pcs_2),
		.io_deq_bits_pcs_3(_f3_io_deq_bits_pcs_3),
		.io_deq_bits_ras_top(_f3_io_deq_bits_ras_top),
		.io_deq_bits_mask(_f3_io_deq_bits_mask),
		.io_deq_bits_ghist_old_history(_f3_io_deq_bits_ghist_old_history),
		.io_deq_bits_ghist_current_saw_branch_not_taken(_f3_io_deq_bits_ghist_current_saw_branch_not_taken),
		.io_deq_bits_ghist_new_saw_branch_not_taken(_f3_io_deq_bits_ghist_new_saw_branch_not_taken),
		.io_deq_bits_ghist_new_saw_branch_taken(_f3_io_deq_bits_ghist_new_saw_branch_taken),
		.io_deq_bits_ghist_ras_idx(_f3_io_deq_bits_ghist_ras_idx),
		.io_deq_bits_xcpt_pf_if(_f3_io_deq_bits_xcpt_pf_if),
		.io_deq_bits_xcpt_ae_if(_f3_io_deq_bits_xcpt_ae_if),
		.io_deq_bits_end_half_valid(_f3_io_deq_bits_end_half_valid),
		.io_deq_bits_end_half_bits(_f3_io_deq_bits_end_half_bits),
		.io_deq_bits_fsrc(_f3_io_deq_bits_fsrc),
		.io_deq_bits_tsrc(_f3_io_deq_bits_tsrc)
	);
	Queue1_BranchPredictionBundle f3_bpd_queue(
		.clock(clock),
		.reset(_GEN_12),
		.io_enq_ready(_f3_bpd_queue_io_enq_ready),
		.io_enq_valid(_f3_bpd_queue_io_enq_valid_T),
		.io_enq_bits_pc(_bpd_io_resp_f3_pc),
		.io_enq_bits_preds_0_taken(_bpd_io_resp_f3_preds_0_taken),
		.io_enq_bits_preds_0_is_br(_bpd_io_resp_f3_preds_0_is_br),
		.io_enq_bits_preds_0_is_jal(_bpd_io_resp_f3_preds_0_is_jal),
		.io_enq_bits_preds_0_predicted_pc_valid(_bpd_io_resp_f3_preds_0_predicted_pc_valid),
		.io_enq_bits_preds_0_predicted_pc_bits(_bpd_io_resp_f3_preds_0_predicted_pc_bits),
		.io_enq_bits_preds_1_taken(_bpd_io_resp_f3_preds_1_taken),
		.io_enq_bits_preds_1_is_br(_bpd_io_resp_f3_preds_1_is_br),
		.io_enq_bits_preds_1_is_jal(_bpd_io_resp_f3_preds_1_is_jal),
		.io_enq_bits_preds_1_predicted_pc_valid(_bpd_io_resp_f3_preds_1_predicted_pc_valid),
		.io_enq_bits_preds_1_predicted_pc_bits(_bpd_io_resp_f3_preds_1_predicted_pc_bits),
		.io_enq_bits_preds_2_taken(_bpd_io_resp_f3_preds_2_taken),
		.io_enq_bits_preds_2_is_br(_bpd_io_resp_f3_preds_2_is_br),
		.io_enq_bits_preds_2_is_jal(_bpd_io_resp_f3_preds_2_is_jal),
		.io_enq_bits_preds_2_predicted_pc_valid(_bpd_io_resp_f3_preds_2_predicted_pc_valid),
		.io_enq_bits_preds_2_predicted_pc_bits(_bpd_io_resp_f3_preds_2_predicted_pc_bits),
		.io_enq_bits_preds_3_taken(_bpd_io_resp_f3_preds_3_taken),
		.io_enq_bits_preds_3_is_br(_bpd_io_resp_f3_preds_3_is_br),
		.io_enq_bits_preds_3_is_jal(_bpd_io_resp_f3_preds_3_is_jal),
		.io_enq_bits_preds_3_predicted_pc_valid(_bpd_io_resp_f3_preds_3_predicted_pc_valid),
		.io_enq_bits_preds_3_predicted_pc_bits(_bpd_io_resp_f3_preds_3_predicted_pc_bits),
		.io_enq_bits_meta_0(_bpd_io_resp_f3_meta_0),
		.io_deq_ready(_f4_io_enq_ready),
		.io_deq_bits_pc(_f3_bpd_queue_io_deq_bits_pc),
		.io_deq_bits_preds_0_taken(_f3_bpd_queue_io_deq_bits_preds_0_taken),
		.io_deq_bits_preds_0_is_br(_f3_bpd_queue_io_deq_bits_preds_0_is_br),
		.io_deq_bits_preds_0_predicted_pc_valid(_f3_bpd_queue_io_deq_bits_preds_0_predicted_pc_valid),
		.io_deq_bits_preds_0_predicted_pc_bits(_f3_bpd_queue_io_deq_bits_preds_0_predicted_pc_bits),
		.io_deq_bits_preds_1_taken(_f3_bpd_queue_io_deq_bits_preds_1_taken),
		.io_deq_bits_preds_1_is_br(_f3_bpd_queue_io_deq_bits_preds_1_is_br),
		.io_deq_bits_preds_1_predicted_pc_valid(_f3_bpd_queue_io_deq_bits_preds_1_predicted_pc_valid),
		.io_deq_bits_preds_1_predicted_pc_bits(_f3_bpd_queue_io_deq_bits_preds_1_predicted_pc_bits),
		.io_deq_bits_preds_2_taken(_f3_bpd_queue_io_deq_bits_preds_2_taken),
		.io_deq_bits_preds_2_is_br(_f3_bpd_queue_io_deq_bits_preds_2_is_br),
		.io_deq_bits_preds_2_predicted_pc_valid(_f3_bpd_queue_io_deq_bits_preds_2_predicted_pc_valid),
		.io_deq_bits_preds_2_predicted_pc_bits(_f3_bpd_queue_io_deq_bits_preds_2_predicted_pc_bits),
		.io_deq_bits_preds_3_taken(_f3_bpd_queue_io_deq_bits_preds_3_taken),
		.io_deq_bits_preds_3_is_br(_f3_bpd_queue_io_deq_bits_preds_3_is_br),
		.io_deq_bits_preds_3_predicted_pc_valid(_f3_bpd_queue_io_deq_bits_preds_3_predicted_pc_valid),
		.io_deq_bits_preds_3_predicted_pc_bits(_f3_bpd_queue_io_deq_bits_preds_3_predicted_pc_bits),
		.io_deq_bits_meta_0(_f3_bpd_queue_io_deq_bits_meta_0),
		.io_deq_bits_lhist_0(_f3_bpd_queue_io_deq_bits_lhist_0)
	);
	BranchDecode bpd_decoder(
		.io_inst(_f3_io_deq_bits_exp_insts_0),
		.io_pc(_f3_io_deq_bits_pcs_0),
		.io_out_is_ret(_bpd_decoder_io_out_is_ret),
		.io_out_is_call(_bpd_decoder_io_out_is_call),
		.io_out_target(_bpd_decoder_io_out_target),
		.io_out_cfi_type(_bpd_decoder_io_out_cfi_type),
		.io_out_sfb_offset_valid(_bpd_decoder_io_out_sfb_offset_valid),
		.io_out_sfb_offset_bits(_bpd_decoder_io_out_sfb_offset_bits),
		.io_out_shadowable(_bpd_decoder_io_out_shadowable)
	);
	BranchDecode bpd_decoder_1(
		.io_inst(_f3_io_deq_bits_exp_insts_1),
		.io_pc(_f3_io_deq_bits_pcs_1),
		.io_out_is_ret(_bpd_decoder_1_io_out_is_ret),
		.io_out_is_call(_bpd_decoder_1_io_out_is_call),
		.io_out_target(_bpd_decoder_1_io_out_target),
		.io_out_cfi_type(_bpd_decoder_1_io_out_cfi_type),
		.io_out_sfb_offset_valid(_bpd_decoder_1_io_out_sfb_offset_valid),
		.io_out_sfb_offset_bits(_bpd_decoder_1_io_out_sfb_offset_bits),
		.io_out_shadowable(_bpd_decoder_1_io_out_shadowable)
	);
	BranchDecode bpd_decoder_2(
		.io_inst(_f3_io_deq_bits_exp_insts_2),
		.io_pc(_f3_io_deq_bits_pcs_2),
		.io_out_is_ret(_bpd_decoder_2_io_out_is_ret),
		.io_out_is_call(_bpd_decoder_2_io_out_is_call),
		.io_out_target(_bpd_decoder_2_io_out_target),
		.io_out_cfi_type(_bpd_decoder_2_io_out_cfi_type),
		.io_out_sfb_offset_valid(_bpd_decoder_2_io_out_sfb_offset_valid),
		.io_out_sfb_offset_bits(_bpd_decoder_2_io_out_sfb_offset_bits),
		.io_out_shadowable(_bpd_decoder_2_io_out_shadowable)
	);
	BranchDecode bpd_decoder_3(
		.io_inst(_f3_io_deq_bits_exp_insts_3),
		.io_pc(_f3_io_deq_bits_pcs_3),
		.io_out_is_ret(_bpd_decoder_3_io_out_is_ret),
		.io_out_is_call(_bpd_decoder_3_io_out_is_call),
		.io_out_target(_bpd_decoder_3_io_out_target),
		.io_out_cfi_type(_bpd_decoder_3_io_out_cfi_type),
		.io_out_sfb_offset_valid(_bpd_decoder_3_io_out_sfb_offset_valid),
		.io_out_sfb_offset_bits(_bpd_decoder_3_io_out_sfb_offset_bits),
		.io_out_shadowable(_bpd_decoder_3_io_out_shadowable)
	);
	Queue2_BranchPredictionUpdate f4_btb_corrections(
		.clock(clock),
		.reset(reset),
		.io_enq_valid(_f4_btb_corrections_io_enq_valid_T & (((f3_btb_mispredicts_0 | f3_btb_mispredicts_1) | f3_btb_mispredicts_2) | f3_btb_mispredicts_3)),
		.io_enq_bits_btb_mispredicts({f3_btb_mispredicts_3, f3_btb_mispredicts_2, f3_btb_mispredicts_1, f3_btb_mispredicts_0}),
		.io_enq_bits_pc(_f3_io_deq_bits_pc),
		.io_enq_bits_ghist_old_history(_f3_io_deq_bits_ghist_old_history),
		.io_enq_bits_ghist_current_saw_branch_not_taken(_f3_io_deq_bits_ghist_current_saw_branch_not_taken),
		.io_enq_bits_ghist_new_saw_branch_not_taken(_f3_io_deq_bits_ghist_new_saw_branch_not_taken),
		.io_enq_bits_ghist_new_saw_branch_taken(_f3_io_deq_bits_ghist_new_saw_branch_taken),
		.io_enq_bits_ghist_ras_idx(_f3_io_deq_bits_ghist_ras_idx),
		.io_enq_bits_lhist_0(_f3_bpd_queue_io_deq_bits_lhist_0),
		.io_enq_bits_meta_0(_f3_bpd_queue_io_deq_bits_meta_0),
		.io_deq_ready(_bpd_update_arbiter_io_in_1_ready),
		.io_deq_valid(_f4_btb_corrections_io_deq_valid),
		.io_deq_bits_is_mispredict_update(_f4_btb_corrections_io_deq_bits_is_mispredict_update),
		.io_deq_bits_is_repair_update(_f4_btb_corrections_io_deq_bits_is_repair_update),
		.io_deq_bits_btb_mispredicts(_f4_btb_corrections_io_deq_bits_btb_mispredicts),
		.io_deq_bits_pc(_f4_btb_corrections_io_deq_bits_pc),
		.io_deq_bits_br_mask(_f4_btb_corrections_io_deq_bits_br_mask),
		.io_deq_bits_cfi_idx_valid(_f4_btb_corrections_io_deq_bits_cfi_idx_valid),
		.io_deq_bits_cfi_idx_bits(_f4_btb_corrections_io_deq_bits_cfi_idx_bits),
		.io_deq_bits_cfi_taken(_f4_btb_corrections_io_deq_bits_cfi_taken),
		.io_deq_bits_cfi_mispredicted(_f4_btb_corrections_io_deq_bits_cfi_mispredicted),
		.io_deq_bits_cfi_is_br(_f4_btb_corrections_io_deq_bits_cfi_is_br),
		.io_deq_bits_cfi_is_jal(_f4_btb_corrections_io_deq_bits_cfi_is_jal),
		.io_deq_bits_cfi_is_jalr(_f4_btb_corrections_io_deq_bits_cfi_is_jalr),
		.io_deq_bits_ghist_old_history(_f4_btb_corrections_io_deq_bits_ghist_old_history),
		.io_deq_bits_target(_f4_btb_corrections_io_deq_bits_target),
		.io_deq_bits_meta_0(_f4_btb_corrections_io_deq_bits_meta_0)
	);
	Queue1_FetchBundle_1 f4(
		.clock(clock),
		.reset(reset | f4_clear),
		.io_enq_ready(_f4_io_enq_ready),
		.io_enq_valid(_f4_io_enq_valid_T_1),
		.io_enq_bits_pc(_f3_io_deq_bits_pc),
		.io_enq_bits_next_pc(((_f3_decoded_target_T | f3_redirects_2) | f3_redirects_3 ? (f3_redirects_0 ? (_f3_redirects_0_T_1 ? _f3_bpd_queue_io_deq_bits_preds_0_predicted_pc_bits : _bpd_decoder_io_out_target) : (f3_redirects_1 ? (_f3_redirects_1_T_1 ? _f3_bpd_queue_io_deq_bits_preds_1_predicted_pc_bits : _bpd_decoder_1_io_out_target) : (f3_redirects_2 ? (_f3_redirects_2_T_1 ? _f3_bpd_queue_io_deq_bits_preds_2_predicted_pc_bits : _bpd_decoder_2_io_out_target) : (_f3_redirects_3_T_1 ? _f3_bpd_queue_io_deq_bits_preds_3_predicted_pc_bits : _bpd_decoder_3_io_out_target)))) : _f3_io_deq_bits_next_fetch)),
		.io_enq_bits_next_fetch(_f3_io_deq_bits_next_fetch),
		.io_enq_bits_edge_inst_0(_f3_io_deq_bits_edge_inst_0),
		.io_enq_bits_insts_0(_f3_io_deq_bits_insts_0),
		.io_enq_bits_insts_1(_f3_io_deq_bits_insts_1),
		.io_enq_bits_insts_2(_f3_io_deq_bits_insts_2),
		.io_enq_bits_insts_3(_f3_io_deq_bits_insts_3),
		.io_enq_bits_exp_insts_0(_f3_io_deq_bits_exp_insts_0),
		.io_enq_bits_exp_insts_1(_f3_io_deq_bits_exp_insts_1),
		.io_enq_bits_exp_insts_2(_f3_io_deq_bits_exp_insts_2),
		.io_enq_bits_exp_insts_3(_f3_io_deq_bits_exp_insts_3),
		.io_enq_bits_pcs_0(_f3_io_deq_bits_pcs_0),
		.io_enq_bits_pcs_1(_f3_io_deq_bits_pcs_1),
		.io_enq_bits_pcs_2(_f3_io_deq_bits_pcs_2),
		.io_enq_bits_pcs_3(_f3_io_deq_bits_pcs_3),
		.io_enq_bits_sfbs_0((f3_mask_0 & _bpd_decoder_io_out_sfb_offset_valid) & (_offset_from_aligned_pc_T_4 < 7'h11)),
		.io_enq_bits_sfbs_1((f3_mask_1 & _bpd_decoder_1_io_out_sfb_offset_valid) & (_offset_from_aligned_pc_T_5 < 7'h11)),
		.io_enq_bits_sfbs_2((f3_mask_2 & _bpd_decoder_2_io_out_sfb_offset_valid) & (_offset_from_aligned_pc_T_10 < 7'h11)),
		.io_enq_bits_sfbs_3((f3_mask_3 & _bpd_decoder_3_io_out_sfb_offset_valid) & (_offset_from_aligned_pc_T_15 < 7'h11)),
		.io_enq_bits_sfb_masks_0(~(_upper_mask_T_1[7:0] | {_GEN_18[1] | _GEN_13, _GEN_18[0], _GEN_17[0], _GEN_16[0], _GEN_15[0], _GEN_14[0], _GEN_13, 1'h0}) & 8'hfe),
		.io_enq_bits_sfb_masks_1(~(_upper_mask_T_5[7:0] | {_GEN_24[1] | _GEN_19, _GEN_24[0], _GEN_23[0], _GEN_22[0], _GEN_21[0], _GEN_20[0], _GEN_19, 1'h0}) & 8'hfc),
		.io_enq_bits_sfb_masks_2(~(_upper_mask_T_9[7:0] | {_GEN_31[1] | _GEN_26, _GEN_31[0], _GEN_30[0], _GEN_29[0], _GEN_28[0], _GEN_27[0], _GEN_26, 1'h0}) & 8'hf8),
		.io_enq_bits_sfb_masks_3(~(_upper_mask_T_13[7:0] | {_GEN_37[1] | _GEN_32, _GEN_37[0], _GEN_36[0], _GEN_35[0], _GEN_34[0], _GEN_33[0], _GEN_32, 1'h0}) & 8'hf0),
		.io_enq_bits_sfb_dests_0(_offset_from_aligned_pc_T_4[3:0]),
		.io_enq_bits_sfb_dests_1(_offset_from_aligned_pc_T_5[3:0]),
		.io_enq_bits_sfb_dests_2(_offset_from_aligned_pc_T_10[3:0]),
		.io_enq_bits_sfb_dests_3(_offset_from_aligned_pc_T_15[3:0]),
		.io_enq_bits_shadowable_mask_0(f3_fetch_bundle_shadowable_mask_0),
		.io_enq_bits_shadowable_mask_1(f3_fetch_bundle_shadowable_mask_1),
		.io_enq_bits_shadowable_mask_2(f3_fetch_bundle_shadowable_mask_2),
		.io_enq_bits_shadowable_mask_3(f3_fetch_bundle_shadowable_mask_3),
		.io_enq_bits_shadowed_mask_0(f4_sfb_valid & f4_sfb_mask[4]),
		.io_enq_bits_shadowed_mask_1(f4_sfb_valid & f4_sfb_mask[5]),
		.io_enq_bits_shadowed_mask_2(f4_sfb_valid & f4_sfb_mask[6]),
		.io_enq_bits_shadowed_mask_3(f4_sfb_valid & f4_sfb_mask[7]),
		.io_enq_bits_cfi_idx_valid((_f3_decoded_target_T | f3_redirects_2) | f3_redirects_3),
		.io_enq_bits_cfi_idx_bits(f3_fetch_bundle_cfi_idx_bits),
		.io_enq_bits_cfi_type(_GEN_38[f3_fetch_bundle_cfi_idx_bits * 3+:3]),
		.io_enq_bits_cfi_is_call(_GEN_39[f3_fetch_bundle_cfi_idx_bits]),
		.io_enq_bits_cfi_is_ret(_GEN_40[f3_fetch_bundle_cfi_idx_bits]),
		.io_enq_bits_cfi_npc_plus4(_GEN_41[f3_fetch_bundle_cfi_idx_bits]),
		.io_enq_bits_ras_top(_f3_io_deq_bits_ras_top),
		.io_enq_bits_mask({f3_mask_3, f3_mask_2, f3_mask_1, f3_mask_0}),
		.io_enq_bits_br_mask({f3_br_mask_3, f3_br_mask_2, f3_br_mask_1, f3_br_mask_0}),
		.io_enq_bits_ghist_old_history((_GEN_55 ? _f4_decoded_ghist_new_history_old_history_T_6 : _f3_io_deq_bits_ghist_old_history)),
		.io_enq_bits_ghist_current_saw_branch_not_taken(~_GEN_55 & _f3_io_deq_bits_ghist_current_saw_branch_not_taken),
		.io_enq_bits_ghist_new_saw_branch_not_taken(~_GEN_55 & _f3_io_deq_bits_ghist_new_saw_branch_not_taken),
		.io_enq_bits_ghist_new_saw_branch_taken(~_GEN_55 & _f3_io_deq_bits_ghist_new_saw_branch_taken),
		.io_enq_bits_ghist_ras_idx(_GEN_0),
		.io_enq_bits_lhist_0(_f3_bpd_queue_io_deq_bits_lhist_0),
		.io_enq_bits_xcpt_pf_if(_f3_io_deq_bits_xcpt_pf_if),
		.io_enq_bits_xcpt_ae_if(_f3_io_deq_bits_xcpt_ae_if),
		.io_enq_bits_end_half_valid(_f3_io_deq_bits_end_half_valid),
		.io_enq_bits_end_half_bits(_f3_io_deq_bits_end_half_bits),
		.io_enq_bits_bpd_meta_0(_f3_bpd_queue_io_deq_bits_meta_0),
		.io_enq_bits_fsrc((_GEN_48 ? _f3_io_deq_bits_fsrc : 3'h2)),
		.io_enq_bits_tsrc(_f3_io_deq_bits_tsrc),
		.io_deq_ready((_fb_io_enq_ready & _ftq_io_enq_ready) & ~f4_delay),
		.io_deq_valid(_f4_io_deq_valid),
		.io_deq_bits_pc(_f4_io_deq_bits_pc),
		.io_deq_bits_next_pc(_f4_io_deq_bits_next_pc),
		.io_deq_bits_edge_inst_0(_f4_io_deq_bits_edge_inst_0),
		.io_deq_bits_insts_0(_f4_io_deq_bits_insts_0),
		.io_deq_bits_insts_1(_f4_io_deq_bits_insts_1),
		.io_deq_bits_insts_2(_f4_io_deq_bits_insts_2),
		.io_deq_bits_insts_3(_f4_io_deq_bits_insts_3),
		.io_deq_bits_exp_insts_0(_f4_io_deq_bits_exp_insts_0),
		.io_deq_bits_exp_insts_1(_f4_io_deq_bits_exp_insts_1),
		.io_deq_bits_exp_insts_2(_f4_io_deq_bits_exp_insts_2),
		.io_deq_bits_exp_insts_3(_f4_io_deq_bits_exp_insts_3),
		.io_deq_bits_sfbs_0(_f4_io_deq_bits_sfbs_0),
		.io_deq_bits_sfbs_1(_f4_io_deq_bits_sfbs_1),
		.io_deq_bits_sfbs_2(_f4_io_deq_bits_sfbs_2),
		.io_deq_bits_sfbs_3(_f4_io_deq_bits_sfbs_3),
		.io_deq_bits_sfb_masks_0(_f4_io_deq_bits_sfb_masks_0),
		.io_deq_bits_sfb_masks_1(_f4_io_deq_bits_sfb_masks_1),
		.io_deq_bits_sfb_masks_2(_f4_io_deq_bits_sfb_masks_2),
		.io_deq_bits_sfb_masks_3(_f4_io_deq_bits_sfb_masks_3),
		.io_deq_bits_sfb_dests_0(_f4_io_deq_bits_sfb_dests_0),
		.io_deq_bits_sfb_dests_1(_f4_io_deq_bits_sfb_dests_1),
		.io_deq_bits_sfb_dests_2(_f4_io_deq_bits_sfb_dests_2),
		.io_deq_bits_sfb_dests_3(_f4_io_deq_bits_sfb_dests_3),
		.io_deq_bits_shadowable_mask_0(_f4_io_deq_bits_shadowable_mask_0),
		.io_deq_bits_shadowable_mask_1(_f4_io_deq_bits_shadowable_mask_1),
		.io_deq_bits_shadowable_mask_2(_f4_io_deq_bits_shadowable_mask_2),
		.io_deq_bits_shadowable_mask_3(_f4_io_deq_bits_shadowable_mask_3),
		.io_deq_bits_shadowed_mask_0(_f4_io_deq_bits_shadowed_mask_0),
		.io_deq_bits_shadowed_mask_1(_f4_io_deq_bits_shadowed_mask_1),
		.io_deq_bits_shadowed_mask_2(_f4_io_deq_bits_shadowed_mask_2),
		.io_deq_bits_shadowed_mask_3(_f4_io_deq_bits_shadowed_mask_3),
		.io_deq_bits_cfi_idx_valid(_f4_io_deq_bits_cfi_idx_valid),
		.io_deq_bits_cfi_idx_bits(_f4_io_deq_bits_cfi_idx_bits),
		.io_deq_bits_cfi_type(_f4_io_deq_bits_cfi_type),
		.io_deq_bits_cfi_is_call(_f4_io_deq_bits_cfi_is_call),
		.io_deq_bits_cfi_is_ret(_f4_io_deq_bits_cfi_is_ret),
		.io_deq_bits_cfi_npc_plus4(_f4_io_deq_bits_cfi_npc_plus4),
		.io_deq_bits_mask(_f4_io_deq_bits_mask),
		.io_deq_bits_br_mask(_f4_io_deq_bits_br_mask),
		.io_deq_bits_ghist_old_history(_f4_io_deq_bits_ghist_old_history),
		.io_deq_bits_ghist_current_saw_branch_not_taken(_f4_io_deq_bits_ghist_current_saw_branch_not_taken),
		.io_deq_bits_ghist_new_saw_branch_not_taken(_f4_io_deq_bits_ghist_new_saw_branch_not_taken),
		.io_deq_bits_ghist_new_saw_branch_taken(_f4_io_deq_bits_ghist_new_saw_branch_taken),
		.io_deq_bits_ghist_ras_idx(_f4_io_deq_bits_ghist_ras_idx),
		.io_deq_bits_xcpt_pf_if(_f4_io_deq_bits_xcpt_pf_if),
		.io_deq_bits_xcpt_ae_if(_f4_io_deq_bits_xcpt_ae_if),
		.io_deq_bits_bp_debug_if_oh_0(_f4_io_deq_bits_bp_debug_if_oh_0),
		.io_deq_bits_bp_debug_if_oh_1(_f4_io_deq_bits_bp_debug_if_oh_1),
		.io_deq_bits_bp_debug_if_oh_2(_f4_io_deq_bits_bp_debug_if_oh_2),
		.io_deq_bits_bp_debug_if_oh_3(_f4_io_deq_bits_bp_debug_if_oh_3),
		.io_deq_bits_bp_xcpt_if_oh_0(_f4_io_deq_bits_bp_xcpt_if_oh_0),
		.io_deq_bits_bp_xcpt_if_oh_1(_f4_io_deq_bits_bp_xcpt_if_oh_1),
		.io_deq_bits_bp_xcpt_if_oh_2(_f4_io_deq_bits_bp_xcpt_if_oh_2),
		.io_deq_bits_bp_xcpt_if_oh_3(_f4_io_deq_bits_bp_xcpt_if_oh_3),
		.io_deq_bits_end_half_valid(_f4_io_deq_bits_end_half_valid),
		.io_deq_bits_end_half_bits(_f4_io_deq_bits_end_half_bits),
		.io_deq_bits_bpd_meta_0(_f4_io_deq_bits_bpd_meta_0),
		.io_deq_bits_fsrc(_f4_io_deq_bits_fsrc)
	);
	FetchBuffer fb(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_fb_io_enq_ready),
		.io_enq_valid((_f4_io_deq_valid & _ftq_io_enq_ready) & ~f4_delay),
		.io_enq_bits_pc(_f4_io_deq_bits_pc),
		.io_enq_bits_edge_inst_0(_f4_io_deq_bits_edge_inst_0),
		.io_enq_bits_insts_0(_f4_io_deq_bits_insts_0),
		.io_enq_bits_insts_1(_f4_io_deq_bits_insts_1),
		.io_enq_bits_insts_2(_f4_io_deq_bits_insts_2),
		.io_enq_bits_insts_3(_f4_io_deq_bits_insts_3),
		.io_enq_bits_exp_insts_0(_f4_io_deq_bits_exp_insts_0),
		.io_enq_bits_exp_insts_1(_f4_io_deq_bits_exp_insts_1),
		.io_enq_bits_exp_insts_2(_f4_io_deq_bits_exp_insts_2),
		.io_enq_bits_exp_insts_3(_f4_io_deq_bits_exp_insts_3),
		.io_enq_bits_sfbs_0(_GEN_49[0]),
		.io_enq_bits_sfbs_1(_GEN_49[1]),
		.io_enq_bits_sfbs_2(_GEN_49[2]),
		.io_enq_bits_sfbs_3(_GEN_49[3]),
		.io_enq_bits_shadowed_mask_0(_GEN_50[0]),
		.io_enq_bits_shadowed_mask_1(_GEN_50[1]),
		.io_enq_bits_shadowed_mask_2(_GEN_50[2]),
		.io_enq_bits_shadowed_mask_3(_GEN_50[3]),
		.io_enq_bits_cfi_idx_valid(_f4_io_deq_bits_cfi_idx_valid),
		.io_enq_bits_cfi_idx_bits(_f4_io_deq_bits_cfi_idx_bits),
		.io_enq_bits_ftq_idx(_ftq_io_enq_idx),
		.io_enq_bits_mask(_f4_io_deq_bits_mask),
		.io_enq_bits_xcpt_pf_if(_f4_io_deq_bits_xcpt_pf_if),
		.io_enq_bits_xcpt_ae_if(_f4_io_deq_bits_xcpt_ae_if),
		.io_enq_bits_bp_debug_if_oh_0(_f4_io_deq_bits_bp_debug_if_oh_0),
		.io_enq_bits_bp_debug_if_oh_1(_f4_io_deq_bits_bp_debug_if_oh_1),
		.io_enq_bits_bp_debug_if_oh_2(_f4_io_deq_bits_bp_debug_if_oh_2),
		.io_enq_bits_bp_debug_if_oh_3(_f4_io_deq_bits_bp_debug_if_oh_3),
		.io_enq_bits_bp_xcpt_if_oh_0(_f4_io_deq_bits_bp_xcpt_if_oh_0),
		.io_enq_bits_bp_xcpt_if_oh_1(_f4_io_deq_bits_bp_xcpt_if_oh_1),
		.io_enq_bits_bp_xcpt_if_oh_2(_f4_io_deq_bits_bp_xcpt_if_oh_2),
		.io_enq_bits_bp_xcpt_if_oh_3(_f4_io_deq_bits_bp_xcpt_if_oh_3),
		.io_enq_bits_fsrc((_GEN_67 ? _f4_io_deq_bits_fsrc : 3'h3)),
		.io_deq_ready(io_cpu_fetchpacket_ready),
		.io_deq_valid(io_cpu_fetchpacket_valid),
		.io_deq_bits_uops_0_valid(io_cpu_fetchpacket_bits_uops_0_valid),
		.io_deq_bits_uops_0_bits_inst(io_cpu_fetchpacket_bits_uops_0_bits_inst),
		.io_deq_bits_uops_0_bits_debug_inst(io_cpu_fetchpacket_bits_uops_0_bits_debug_inst),
		.io_deq_bits_uops_0_bits_is_rvc(io_cpu_fetchpacket_bits_uops_0_bits_is_rvc),
		.io_deq_bits_uops_0_bits_debug_pc(io_cpu_fetchpacket_bits_uops_0_bits_debug_pc),
		.io_deq_bits_uops_0_bits_is_sfb(io_cpu_fetchpacket_bits_uops_0_bits_is_sfb),
		.io_deq_bits_uops_0_bits_ftq_idx(io_cpu_fetchpacket_bits_uops_0_bits_ftq_idx),
		.io_deq_bits_uops_0_bits_edge_inst(io_cpu_fetchpacket_bits_uops_0_bits_edge_inst),
		.io_deq_bits_uops_0_bits_pc_lob(io_cpu_fetchpacket_bits_uops_0_bits_pc_lob),
		.io_deq_bits_uops_0_bits_taken(io_cpu_fetchpacket_bits_uops_0_bits_taken),
		.io_deq_bits_uops_0_bits_xcpt_pf_if(io_cpu_fetchpacket_bits_uops_0_bits_xcpt_pf_if),
		.io_deq_bits_uops_0_bits_xcpt_ae_if(io_cpu_fetchpacket_bits_uops_0_bits_xcpt_ae_if),
		.io_deq_bits_uops_0_bits_bp_debug_if(io_cpu_fetchpacket_bits_uops_0_bits_bp_debug_if),
		.io_deq_bits_uops_0_bits_bp_xcpt_if(io_cpu_fetchpacket_bits_uops_0_bits_bp_xcpt_if),
		.io_deq_bits_uops_0_bits_debug_fsrc(io_cpu_fetchpacket_bits_uops_0_bits_debug_fsrc),
		.io_clear(f4_clear)
	);
	FetchTargetQueue ftq(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_ftq_io_enq_ready),
		.io_enq_valid((_f4_io_deq_valid & _fb_io_enq_ready) & ~f4_delay),
		.io_enq_bits_pc(_f4_io_deq_bits_pc),
		.io_enq_bits_cfi_idx_valid(_f4_io_deq_bits_cfi_idx_valid),
		.io_enq_bits_cfi_idx_bits(_f4_io_deq_bits_cfi_idx_bits),
		.io_enq_bits_cfi_type(_f4_io_deq_bits_cfi_type),
		.io_enq_bits_cfi_is_call(_f4_io_deq_bits_cfi_is_call),
		.io_enq_bits_cfi_is_ret(_f4_io_deq_bits_cfi_is_ret),
		.io_enq_bits_ras_top(_ras_io_read_addr),
		.io_enq_bits_mask(_f4_io_deq_bits_mask),
		.io_enq_bits_br_mask(_f4_io_deq_bits_br_mask),
		.io_enq_bits_ghist_old_history(_f4_io_deq_bits_ghist_old_history),
		.io_enq_bits_ghist_current_saw_branch_not_taken(_f4_io_deq_bits_ghist_current_saw_branch_not_taken),
		.io_enq_bits_ghist_new_saw_branch_not_taken(_f4_io_deq_bits_ghist_new_saw_branch_not_taken),
		.io_enq_bits_ghist_new_saw_branch_taken(_f4_io_deq_bits_ghist_new_saw_branch_taken),
		.io_enq_bits_ghist_ras_idx(_f4_io_deq_bits_ghist_ras_idx),
		.io_enq_bits_bpd_meta_0(_f4_io_deq_bits_bpd_meta_0),
		.io_enq_idx(_ftq_io_enq_idx),
		.io_deq_valid(io_cpu_commit_valid),
		.io_deq_bits(io_cpu_commit_bits[3:0]),
		.io_arb_ftq_reqs_0(io_cpu_arb_ftq_reqs_0),
		.io_arb_ftq_reqs_1(io_cpu_arb_ftq_reqs_1),
		.io_arb_ftq_reqs_2(io_cpu_arb_ftq_reqs_2),
		.io_rrd_ftq_resps_0_entry_cfi_idx_bits(io_cpu_rrd_ftq_resps_0_entry_cfi_idx_bits),
		.io_rrd_ftq_resps_0_entry_br_mask(io_cpu_rrd_ftq_resps_0_entry_br_mask),
		.io_rrd_ftq_resps_0_entry_cfi_is_call(io_cpu_rrd_ftq_resps_0_entry_cfi_is_call),
		.io_rrd_ftq_resps_0_entry_cfi_is_ret(io_cpu_rrd_ftq_resps_0_entry_cfi_is_ret),
		.io_rrd_ftq_resps_0_entry_ras_idx(io_cpu_rrd_ftq_resps_0_entry_ras_idx),
		.io_rrd_ftq_resps_0_entry_start_bank(io_cpu_rrd_ftq_resps_0_entry_start_bank),
		.io_rrd_ftq_resps_0_ghist_old_history(io_cpu_rrd_ftq_resps_0_ghist_old_history),
		.io_rrd_ftq_resps_0_ghist_current_saw_branch_not_taken(io_cpu_rrd_ftq_resps_0_ghist_current_saw_branch_not_taken),
		.io_rrd_ftq_resps_0_ghist_new_saw_branch_not_taken(io_cpu_rrd_ftq_resps_0_ghist_new_saw_branch_not_taken),
		.io_rrd_ftq_resps_0_ghist_new_saw_branch_taken(io_cpu_rrd_ftq_resps_0_ghist_new_saw_branch_taken),
		.io_rrd_ftq_resps_0_ghist_ras_idx(io_cpu_rrd_ftq_resps_0_ghist_ras_idx),
		.io_rrd_ftq_resps_0_pc(io_cpu_rrd_ftq_resps_0_pc),
		.io_rrd_ftq_resps_1_valid(io_cpu_rrd_ftq_resps_1_valid),
		.io_rrd_ftq_resps_1_entry_cfi_idx_valid(io_cpu_rrd_ftq_resps_1_entry_cfi_idx_valid),
		.io_rrd_ftq_resps_1_entry_cfi_idx_bits(io_cpu_rrd_ftq_resps_1_entry_cfi_idx_bits),
		.io_rrd_ftq_resps_1_entry_start_bank(io_cpu_rrd_ftq_resps_1_entry_start_bank),
		.io_rrd_ftq_resps_1_pc(io_cpu_rrd_ftq_resps_1_pc),
		.io_rrd_ftq_resps_2_valid(io_cpu_rrd_ftq_resps_2_valid),
		.io_rrd_ftq_resps_2_entry_cfi_idx_valid(io_cpu_rrd_ftq_resps_2_entry_cfi_idx_valid),
		.io_rrd_ftq_resps_2_entry_cfi_idx_bits(io_cpu_rrd_ftq_resps_2_entry_cfi_idx_bits),
		.io_rrd_ftq_resps_2_entry_start_bank(io_cpu_rrd_ftq_resps_2_entry_start_bank),
		.io_rrd_ftq_resps_2_pc(io_cpu_rrd_ftq_resps_2_pc),
		.io_com_pc(io_cpu_com_pc),
		.io_redirect_valid(io_cpu_redirect_val),
		.io_redirect_bits(io_cpu_redirect_ftq_idx),
		.io_brupdate_b2_uop_ftq_idx(io_cpu_brupdate_b2_uop_ftq_idx),
		.io_brupdate_b2_uop_pc_lob(io_cpu_brupdate_b2_uop_pc_lob),
		.io_brupdate_b2_mispredict(io_cpu_brupdate_b2_mispredict),
		.io_brupdate_b2_taken(io_cpu_brupdate_b2_taken),
		.io_bpdupdate_valid(_ftq_io_bpdupdate_valid),
		.io_bpdupdate_bits_is_mispredict_update(_ftq_io_bpdupdate_bits_is_mispredict_update),
		.io_bpdupdate_bits_is_repair_update(_ftq_io_bpdupdate_bits_is_repair_update),
		.io_bpdupdate_bits_pc(_ftq_io_bpdupdate_bits_pc),
		.io_bpdupdate_bits_br_mask(_ftq_io_bpdupdate_bits_br_mask),
		.io_bpdupdate_bits_cfi_idx_valid(_ftq_io_bpdupdate_bits_cfi_idx_valid),
		.io_bpdupdate_bits_cfi_idx_bits(_ftq_io_bpdupdate_bits_cfi_idx_bits),
		.io_bpdupdate_bits_cfi_taken(_ftq_io_bpdupdate_bits_cfi_taken),
		.io_bpdupdate_bits_cfi_mispredicted(_ftq_io_bpdupdate_bits_cfi_mispredicted),
		.io_bpdupdate_bits_cfi_is_br(_ftq_io_bpdupdate_bits_cfi_is_br),
		.io_bpdupdate_bits_cfi_is_jal(_ftq_io_bpdupdate_bits_cfi_is_jal),
		.io_bpdupdate_bits_ghist_old_history(_ftq_io_bpdupdate_bits_ghist_old_history),
		.io_bpdupdate_bits_target(_ftq_io_bpdupdate_bits_target),
		.io_bpdupdate_bits_meta_0(_ftq_io_bpdupdate_bits_meta_0),
		.io_ras_update(_ftq_io_ras_update),
		.io_ras_update_idx(_ftq_io_ras_update_idx),
		.io_ras_update_pc(_ftq_io_ras_update_pc)
	);
	Arbiter2_BranchPredictionUpdate bpd_update_arbiter(
		.io_in_0_valid(_ftq_io_bpdupdate_valid),
		.io_in_0_bits_is_mispredict_update(_ftq_io_bpdupdate_bits_is_mispredict_update),
		.io_in_0_bits_is_repair_update(_ftq_io_bpdupdate_bits_is_repair_update),
		.io_in_0_bits_pc(_ftq_io_bpdupdate_bits_pc),
		.io_in_0_bits_br_mask(_ftq_io_bpdupdate_bits_br_mask),
		.io_in_0_bits_cfi_idx_valid(_ftq_io_bpdupdate_bits_cfi_idx_valid),
		.io_in_0_bits_cfi_idx_bits(_ftq_io_bpdupdate_bits_cfi_idx_bits),
		.io_in_0_bits_cfi_taken(_ftq_io_bpdupdate_bits_cfi_taken),
		.io_in_0_bits_cfi_mispredicted(_ftq_io_bpdupdate_bits_cfi_mispredicted),
		.io_in_0_bits_cfi_is_br(_ftq_io_bpdupdate_bits_cfi_is_br),
		.io_in_0_bits_cfi_is_jal(_ftq_io_bpdupdate_bits_cfi_is_jal),
		.io_in_0_bits_ghist_old_history(_ftq_io_bpdupdate_bits_ghist_old_history),
		.io_in_0_bits_target(_ftq_io_bpdupdate_bits_target),
		.io_in_0_bits_meta_0(_ftq_io_bpdupdate_bits_meta_0),
		.io_in_1_ready(_bpd_update_arbiter_io_in_1_ready),
		.io_in_1_valid(_f4_btb_corrections_io_deq_valid),
		.io_in_1_bits_is_mispredict_update(_f4_btb_corrections_io_deq_bits_is_mispredict_update),
		.io_in_1_bits_is_repair_update(_f4_btb_corrections_io_deq_bits_is_repair_update),
		.io_in_1_bits_btb_mispredicts(_f4_btb_corrections_io_deq_bits_btb_mispredicts),
		.io_in_1_bits_pc(_f4_btb_corrections_io_deq_bits_pc),
		.io_in_1_bits_br_mask(_f4_btb_corrections_io_deq_bits_br_mask),
		.io_in_1_bits_cfi_idx_valid(_f4_btb_corrections_io_deq_bits_cfi_idx_valid),
		.io_in_1_bits_cfi_idx_bits(_f4_btb_corrections_io_deq_bits_cfi_idx_bits),
		.io_in_1_bits_cfi_taken(_f4_btb_corrections_io_deq_bits_cfi_taken),
		.io_in_1_bits_cfi_mispredicted(_f4_btb_corrections_io_deq_bits_cfi_mispredicted),
		.io_in_1_bits_cfi_is_br(_f4_btb_corrections_io_deq_bits_cfi_is_br),
		.io_in_1_bits_cfi_is_jal(_f4_btb_corrections_io_deq_bits_cfi_is_jal),
		.io_in_1_bits_cfi_is_jalr(_f4_btb_corrections_io_deq_bits_cfi_is_jalr),
		.io_in_1_bits_ghist_old_history(_f4_btb_corrections_io_deq_bits_ghist_old_history),
		.io_in_1_bits_target(_f4_btb_corrections_io_deq_bits_target),
		.io_in_1_bits_meta_0(_f4_btb_corrections_io_deq_bits_meta_0),
		.io_out_valid(_bpd_update_arbiter_io_out_valid),
		.io_out_bits_is_mispredict_update(_bpd_update_arbiter_io_out_bits_is_mispredict_update),
		.io_out_bits_is_repair_update(_bpd_update_arbiter_io_out_bits_is_repair_update),
		.io_out_bits_btb_mispredicts(_bpd_update_arbiter_io_out_bits_btb_mispredicts),
		.io_out_bits_pc(_bpd_update_arbiter_io_out_bits_pc),
		.io_out_bits_br_mask(_bpd_update_arbiter_io_out_bits_br_mask),
		.io_out_bits_cfi_idx_valid(_bpd_update_arbiter_io_out_bits_cfi_idx_valid),
		.io_out_bits_cfi_idx_bits(_bpd_update_arbiter_io_out_bits_cfi_idx_bits),
		.io_out_bits_cfi_taken(_bpd_update_arbiter_io_out_bits_cfi_taken),
		.io_out_bits_cfi_mispredicted(_bpd_update_arbiter_io_out_bits_cfi_mispredicted),
		.io_out_bits_cfi_is_br(_bpd_update_arbiter_io_out_bits_cfi_is_br),
		.io_out_bits_cfi_is_jal(_bpd_update_arbiter_io_out_bits_cfi_is_jal),
		.io_out_bits_cfi_is_jalr(_bpd_update_arbiter_io_out_bits_cfi_is_jalr),
		.io_out_bits_ghist_old_history(_bpd_update_arbiter_io_out_bits_ghist_old_history),
		.io_out_bits_target(_bpd_update_arbiter_io_out_bits_target),
		.io_out_bits_meta_0(_bpd_update_arbiter_io_out_bits_meta_0)
	);
	assign io_cpu_perf_tlbMiss = io_ptw_req_ready & _tlb_io_ptw_req_valid;
	assign io_ptw_req_valid = _tlb_io_ptw_req_valid;
endmodule
