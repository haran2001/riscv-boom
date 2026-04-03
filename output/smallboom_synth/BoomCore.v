module BoomCore (
	clock,
	reset,
	io_hartid,
	io_interrupts_debug,
	io_interrupts_mtip,
	io_interrupts_msip,
	io_interrupts_meip,
	io_interrupts_seip,
	io_ifu_fetchpacket_ready,
	io_ifu_fetchpacket_valid,
	io_ifu_fetchpacket_bits_uops_0_valid,
	io_ifu_fetchpacket_bits_uops_0_bits_inst,
	io_ifu_fetchpacket_bits_uops_0_bits_debug_inst,
	io_ifu_fetchpacket_bits_uops_0_bits_is_rvc,
	io_ifu_fetchpacket_bits_uops_0_bits_debug_pc,
	io_ifu_fetchpacket_bits_uops_0_bits_is_sfb,
	io_ifu_fetchpacket_bits_uops_0_bits_ftq_idx,
	io_ifu_fetchpacket_bits_uops_0_bits_edge_inst,
	io_ifu_fetchpacket_bits_uops_0_bits_pc_lob,
	io_ifu_fetchpacket_bits_uops_0_bits_taken,
	io_ifu_fetchpacket_bits_uops_0_bits_xcpt_pf_if,
	io_ifu_fetchpacket_bits_uops_0_bits_xcpt_ae_if,
	io_ifu_fetchpacket_bits_uops_0_bits_bp_debug_if,
	io_ifu_fetchpacket_bits_uops_0_bits_bp_xcpt_if,
	io_ifu_fetchpacket_bits_uops_0_bits_debug_fsrc,
	io_ifu_arb_ftq_reqs_0,
	io_ifu_arb_ftq_reqs_1,
	io_ifu_arb_ftq_reqs_2,
	io_ifu_rrd_ftq_resps_0_entry_cfi_idx_bits,
	io_ifu_rrd_ftq_resps_0_entry_br_mask,
	io_ifu_rrd_ftq_resps_0_entry_cfi_is_call,
	io_ifu_rrd_ftq_resps_0_entry_cfi_is_ret,
	io_ifu_rrd_ftq_resps_0_entry_ras_idx,
	io_ifu_rrd_ftq_resps_0_entry_start_bank,
	io_ifu_rrd_ftq_resps_0_ghist_old_history,
	io_ifu_rrd_ftq_resps_0_ghist_current_saw_branch_not_taken,
	io_ifu_rrd_ftq_resps_0_ghist_new_saw_branch_not_taken,
	io_ifu_rrd_ftq_resps_0_ghist_new_saw_branch_taken,
	io_ifu_rrd_ftq_resps_0_ghist_ras_idx,
	io_ifu_rrd_ftq_resps_0_pc,
	io_ifu_rrd_ftq_resps_1_valid,
	io_ifu_rrd_ftq_resps_1_entry_cfi_idx_valid,
	io_ifu_rrd_ftq_resps_1_entry_cfi_idx_bits,
	io_ifu_rrd_ftq_resps_1_entry_start_bank,
	io_ifu_rrd_ftq_resps_1_pc,
	io_ifu_rrd_ftq_resps_2_valid,
	io_ifu_rrd_ftq_resps_2_entry_cfi_idx_valid,
	io_ifu_rrd_ftq_resps_2_entry_cfi_idx_bits,
	io_ifu_rrd_ftq_resps_2_entry_start_bank,
	io_ifu_rrd_ftq_resps_2_pc,
	io_ifu_com_pc,
	io_ifu_sfence_valid,
	io_ifu_sfence_bits_rs1,
	io_ifu_sfence_bits_rs2,
	io_ifu_sfence_bits_addr,
	io_ifu_brupdate_b2_uop_ftq_idx,
	io_ifu_brupdate_b2_uop_pc_lob,
	io_ifu_brupdate_b2_mispredict,
	io_ifu_brupdate_b2_taken,
	io_ifu_redirect_flush,
	io_ifu_redirect_val,
	io_ifu_redirect_pc,
	io_ifu_redirect_ftq_idx,
	io_ifu_redirect_ghist_old_history,
	io_ifu_redirect_ghist_current_saw_branch_not_taken,
	io_ifu_redirect_ghist_new_saw_branch_not_taken,
	io_ifu_redirect_ghist_new_saw_branch_taken,
	io_ifu_redirect_ghist_ras_idx,
	io_ifu_commit_valid,
	io_ifu_commit_bits,
	io_ifu_flush_icache,
	io_ifu_enable_bpd,
	io_ifu_perf_acquire,
	io_ifu_perf_tlbMiss,
	io_ptw_ptbr_mode,
	io_ptw_ptbr_ppn,
	io_ptw_sfence_valid,
	io_ptw_sfence_bits_rs1,
	io_ptw_sfence_bits_rs2,
	io_ptw_sfence_bits_addr,
	io_ptw_status_debug,
	io_ptw_status_dprv,
	io_ptw_status_prv,
	io_ptw_status_mxr,
	io_ptw_status_sum,
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
	io_ptw_pmp_7_mask,
	io_ptw_perf_l2miss,
	io_lsu_agen_0_valid,
	io_lsu_agen_0_bits_uop_br_mask,
	io_lsu_agen_0_bits_uop_ldq_idx,
	io_lsu_agen_0_bits_uop_stq_idx,
	io_lsu_agen_0_bits_uop_pdst,
	io_lsu_agen_0_bits_uop_uses_ldq,
	io_lsu_agen_0_bits_uop_uses_stq,
	io_lsu_agen_0_bits_uop_dst_rtype,
	io_lsu_agen_0_bits_uop_fp_val,
	io_lsu_agen_0_bits_data,
	io_lsu_dgen_0_valid,
	io_lsu_dgen_0_bits_uop_stq_idx,
	io_lsu_dgen_0_bits_data,
	io_lsu_dgen_1_valid,
	io_lsu_dgen_1_bits_uop_stq_idx,
	io_lsu_dgen_1_bits_data,
	io_lsu_dgen_2_valid,
	io_lsu_dgen_2_bits_uop_stq_idx,
	io_lsu_dgen_2_bits_data,
	io_lsu_iwakeups_0_valid,
	io_lsu_iwakeups_0_bits_uop_pdst,
	io_lsu_iwakeups_0_bits_uop_dst_rtype,
	io_lsu_iwakeups_0_bits_bypassable,
	io_lsu_iwakeups_0_bits_rebusy,
	io_lsu_iresp_0_valid,
	io_lsu_iresp_0_bits_uop_br_mask,
	io_lsu_iresp_0_bits_uop_rob_idx,
	io_lsu_iresp_0_bits_uop_pdst,
	io_lsu_iresp_0_bits_data,
	io_lsu_fresp_0_valid,
	io_lsu_fresp_0_bits_uop_br_mask,
	io_lsu_fresp_0_bits_uop_rob_idx,
	io_lsu_fresp_0_bits_uop_pdst,
	io_lsu_fresp_0_bits_uop_mem_size,
	io_lsu_fresp_0_bits_uop_dst_rtype,
	io_lsu_fresp_0_bits_data,
	io_lsu_sfence_valid,
	io_lsu_sfence_bits_rs1,
	io_lsu_sfence_bits_rs2,
	io_lsu_sfence_bits_addr,
	io_lsu_dis_uops_0_valid,
	io_lsu_dis_uops_0_bits_inst,
	io_lsu_dis_uops_0_bits_debug_inst,
	io_lsu_dis_uops_0_bits_is_rvc,
	io_lsu_dis_uops_0_bits_debug_pc,
	io_lsu_dis_uops_0_bits_iq_type_0,
	io_lsu_dis_uops_0_bits_iq_type_1,
	io_lsu_dis_uops_0_bits_iq_type_2,
	io_lsu_dis_uops_0_bits_iq_type_3,
	io_lsu_dis_uops_0_bits_fu_code_0,
	io_lsu_dis_uops_0_bits_fu_code_1,
	io_lsu_dis_uops_0_bits_fu_code_2,
	io_lsu_dis_uops_0_bits_fu_code_3,
	io_lsu_dis_uops_0_bits_fu_code_4,
	io_lsu_dis_uops_0_bits_fu_code_5,
	io_lsu_dis_uops_0_bits_fu_code_6,
	io_lsu_dis_uops_0_bits_fu_code_7,
	io_lsu_dis_uops_0_bits_fu_code_8,
	io_lsu_dis_uops_0_bits_fu_code_9,
	io_lsu_dis_uops_0_bits_iw_issued,
	io_lsu_dis_uops_0_bits_iw_issued_partial_agen,
	io_lsu_dis_uops_0_bits_iw_issued_partial_dgen,
	io_lsu_dis_uops_0_bits_iw_p1_speculative_child,
	io_lsu_dis_uops_0_bits_iw_p2_speculative_child,
	io_lsu_dis_uops_0_bits_iw_p1_bypass_hint,
	io_lsu_dis_uops_0_bits_iw_p2_bypass_hint,
	io_lsu_dis_uops_0_bits_iw_p3_bypass_hint,
	io_lsu_dis_uops_0_bits_br_mask,
	io_lsu_dis_uops_0_bits_br_tag,
	io_lsu_dis_uops_0_bits_br_type,
	io_lsu_dis_uops_0_bits_is_sfb,
	io_lsu_dis_uops_0_bits_is_fence,
	io_lsu_dis_uops_0_bits_is_fencei,
	io_lsu_dis_uops_0_bits_is_sfence,
	io_lsu_dis_uops_0_bits_is_amo,
	io_lsu_dis_uops_0_bits_is_eret,
	io_lsu_dis_uops_0_bits_is_sys_pc2epc,
	io_lsu_dis_uops_0_bits_is_rocc,
	io_lsu_dis_uops_0_bits_is_mov,
	io_lsu_dis_uops_0_bits_ftq_idx,
	io_lsu_dis_uops_0_bits_edge_inst,
	io_lsu_dis_uops_0_bits_pc_lob,
	io_lsu_dis_uops_0_bits_taken,
	io_lsu_dis_uops_0_bits_imm_rename,
	io_lsu_dis_uops_0_bits_imm_sel,
	io_lsu_dis_uops_0_bits_pimm,
	io_lsu_dis_uops_0_bits_imm_packed,
	io_lsu_dis_uops_0_bits_op1_sel,
	io_lsu_dis_uops_0_bits_op2_sel,
	io_lsu_dis_uops_0_bits_fp_ctrl_ldst,
	io_lsu_dis_uops_0_bits_fp_ctrl_wen,
	io_lsu_dis_uops_0_bits_fp_ctrl_ren1,
	io_lsu_dis_uops_0_bits_fp_ctrl_ren2,
	io_lsu_dis_uops_0_bits_fp_ctrl_ren3,
	io_lsu_dis_uops_0_bits_fp_ctrl_swap12,
	io_lsu_dis_uops_0_bits_fp_ctrl_swap23,
	io_lsu_dis_uops_0_bits_fp_ctrl_typeTagIn,
	io_lsu_dis_uops_0_bits_fp_ctrl_typeTagOut,
	io_lsu_dis_uops_0_bits_fp_ctrl_fromint,
	io_lsu_dis_uops_0_bits_fp_ctrl_toint,
	io_lsu_dis_uops_0_bits_fp_ctrl_fastpipe,
	io_lsu_dis_uops_0_bits_fp_ctrl_fma,
	io_lsu_dis_uops_0_bits_fp_ctrl_div,
	io_lsu_dis_uops_0_bits_fp_ctrl_sqrt,
	io_lsu_dis_uops_0_bits_fp_ctrl_wflags,
	io_lsu_dis_uops_0_bits_fp_ctrl_vec,
	io_lsu_dis_uops_0_bits_rob_idx,
	io_lsu_dis_uops_0_bits_ldq_idx,
	io_lsu_dis_uops_0_bits_stq_idx,
	io_lsu_dis_uops_0_bits_rxq_idx,
	io_lsu_dis_uops_0_bits_pdst,
	io_lsu_dis_uops_0_bits_prs1,
	io_lsu_dis_uops_0_bits_prs2,
	io_lsu_dis_uops_0_bits_prs3,
	io_lsu_dis_uops_0_bits_ppred,
	io_lsu_dis_uops_0_bits_prs1_busy,
	io_lsu_dis_uops_0_bits_prs2_busy,
	io_lsu_dis_uops_0_bits_prs3_busy,
	io_lsu_dis_uops_0_bits_ppred_busy,
	io_lsu_dis_uops_0_bits_stale_pdst,
	io_lsu_dis_uops_0_bits_exception,
	io_lsu_dis_uops_0_bits_exc_cause,
	io_lsu_dis_uops_0_bits_mem_cmd,
	io_lsu_dis_uops_0_bits_mem_size,
	io_lsu_dis_uops_0_bits_mem_signed,
	io_lsu_dis_uops_0_bits_uses_ldq,
	io_lsu_dis_uops_0_bits_uses_stq,
	io_lsu_dis_uops_0_bits_is_unique,
	io_lsu_dis_uops_0_bits_flush_on_commit,
	io_lsu_dis_uops_0_bits_csr_cmd,
	io_lsu_dis_uops_0_bits_ldst_is_rs1,
	io_lsu_dis_uops_0_bits_ldst,
	io_lsu_dis_uops_0_bits_lrs1,
	io_lsu_dis_uops_0_bits_lrs2,
	io_lsu_dis_uops_0_bits_lrs3,
	io_lsu_dis_uops_0_bits_dst_rtype,
	io_lsu_dis_uops_0_bits_lrs1_rtype,
	io_lsu_dis_uops_0_bits_lrs2_rtype,
	io_lsu_dis_uops_0_bits_frs3_en,
	io_lsu_dis_uops_0_bits_fcn_dw,
	io_lsu_dis_uops_0_bits_fcn_op,
	io_lsu_dis_uops_0_bits_fp_val,
	io_lsu_dis_uops_0_bits_fp_rm,
	io_lsu_dis_uops_0_bits_fp_typ,
	io_lsu_dis_uops_0_bits_xcpt_pf_if,
	io_lsu_dis_uops_0_bits_xcpt_ae_if,
	io_lsu_dis_uops_0_bits_xcpt_ma_if,
	io_lsu_dis_uops_0_bits_bp_debug_if,
	io_lsu_dis_uops_0_bits_bp_xcpt_if,
	io_lsu_dis_uops_0_bits_debug_fsrc,
	io_lsu_dis_uops_0_bits_debug_tsrc,
	io_lsu_dis_ldq_idx_0,
	io_lsu_dis_stq_idx_0,
	io_lsu_ldq_full_0,
	io_lsu_stq_full_0,
	io_lsu_commit_valids_0,
	io_lsu_commit_uops_0_uses_ldq,
	io_lsu_commit_uops_0_uses_stq,
	io_lsu_commit_load_at_rob_head,
	io_lsu_clr_bsy_0_valid,
	io_lsu_clr_bsy_0_bits,
	io_lsu_clr_unsafe_0_valid,
	io_lsu_clr_unsafe_0_bits,
	io_lsu_fence_dmem,
	io_lsu_brupdate_b1_resolve_mask,
	io_lsu_brupdate_b1_mispredict_mask,
	io_lsu_brupdate_b2_uop_ldq_idx,
	io_lsu_brupdate_b2_uop_stq_idx,
	io_lsu_brupdate_b2_mispredict,
	io_lsu_rob_head_idx,
	io_lsu_exception,
	io_lsu_fencei_rdy,
	io_lsu_lxcpt_valid,
	io_lsu_lxcpt_bits_uop_br_mask,
	io_lsu_lxcpt_bits_uop_rob_idx,
	io_lsu_lxcpt_bits_cause,
	io_lsu_lxcpt_bits_badvaddr,
	io_lsu_perf_acquire,
	io_lsu_perf_release,
	io_lsu_perf_tlbMiss
);
	input clock;
	input reset;
	input io_hartid;
	input io_interrupts_debug;
	input io_interrupts_mtip;
	input io_interrupts_msip;
	input io_interrupts_meip;
	input io_interrupts_seip;
	output wire io_ifu_fetchpacket_ready;
	input io_ifu_fetchpacket_valid;
	input io_ifu_fetchpacket_bits_uops_0_valid;
	input [31:0] io_ifu_fetchpacket_bits_uops_0_bits_inst;
	input [31:0] io_ifu_fetchpacket_bits_uops_0_bits_debug_inst;
	input io_ifu_fetchpacket_bits_uops_0_bits_is_rvc;
	input [39:0] io_ifu_fetchpacket_bits_uops_0_bits_debug_pc;
	input io_ifu_fetchpacket_bits_uops_0_bits_is_sfb;
	input [3:0] io_ifu_fetchpacket_bits_uops_0_bits_ftq_idx;
	input io_ifu_fetchpacket_bits_uops_0_bits_edge_inst;
	input [5:0] io_ifu_fetchpacket_bits_uops_0_bits_pc_lob;
	input io_ifu_fetchpacket_bits_uops_0_bits_taken;
	input io_ifu_fetchpacket_bits_uops_0_bits_xcpt_pf_if;
	input io_ifu_fetchpacket_bits_uops_0_bits_xcpt_ae_if;
	input io_ifu_fetchpacket_bits_uops_0_bits_bp_debug_if;
	input io_ifu_fetchpacket_bits_uops_0_bits_bp_xcpt_if;
	input [2:0] io_ifu_fetchpacket_bits_uops_0_bits_debug_fsrc;
	output wire [3:0] io_ifu_arb_ftq_reqs_0;
	output wire [3:0] io_ifu_arb_ftq_reqs_1;
	output wire [3:0] io_ifu_arb_ftq_reqs_2;
	input [1:0] io_ifu_rrd_ftq_resps_0_entry_cfi_idx_bits;
	input [3:0] io_ifu_rrd_ftq_resps_0_entry_br_mask;
	input io_ifu_rrd_ftq_resps_0_entry_cfi_is_call;
	input io_ifu_rrd_ftq_resps_0_entry_cfi_is_ret;
	input [4:0] io_ifu_rrd_ftq_resps_0_entry_ras_idx;
	input io_ifu_rrd_ftq_resps_0_entry_start_bank;
	input [63:0] io_ifu_rrd_ftq_resps_0_ghist_old_history;
	input io_ifu_rrd_ftq_resps_0_ghist_current_saw_branch_not_taken;
	input io_ifu_rrd_ftq_resps_0_ghist_new_saw_branch_not_taken;
	input io_ifu_rrd_ftq_resps_0_ghist_new_saw_branch_taken;
	input [4:0] io_ifu_rrd_ftq_resps_0_ghist_ras_idx;
	input [39:0] io_ifu_rrd_ftq_resps_0_pc;
	input io_ifu_rrd_ftq_resps_1_valid;
	input io_ifu_rrd_ftq_resps_1_entry_cfi_idx_valid;
	input [1:0] io_ifu_rrd_ftq_resps_1_entry_cfi_idx_bits;
	input io_ifu_rrd_ftq_resps_1_entry_start_bank;
	input [39:0] io_ifu_rrd_ftq_resps_1_pc;
	input io_ifu_rrd_ftq_resps_2_valid;
	input io_ifu_rrd_ftq_resps_2_entry_cfi_idx_valid;
	input [1:0] io_ifu_rrd_ftq_resps_2_entry_cfi_idx_bits;
	input io_ifu_rrd_ftq_resps_2_entry_start_bank;
	input [39:0] io_ifu_rrd_ftq_resps_2_pc;
	input [39:0] io_ifu_com_pc;
	output wire io_ifu_sfence_valid;
	output wire io_ifu_sfence_bits_rs1;
	output wire io_ifu_sfence_bits_rs2;
	output wire [38:0] io_ifu_sfence_bits_addr;
	output wire [3:0] io_ifu_brupdate_b2_uop_ftq_idx;
	output wire [5:0] io_ifu_brupdate_b2_uop_pc_lob;
	output wire io_ifu_brupdate_b2_mispredict;
	output wire io_ifu_brupdate_b2_taken;
	output wire io_ifu_redirect_flush;
	output wire io_ifu_redirect_val;
	output wire [39:0] io_ifu_redirect_pc;
	output wire [3:0] io_ifu_redirect_ftq_idx;
	output wire [63:0] io_ifu_redirect_ghist_old_history;
	output wire io_ifu_redirect_ghist_current_saw_branch_not_taken;
	output wire io_ifu_redirect_ghist_new_saw_branch_not_taken;
	output wire io_ifu_redirect_ghist_new_saw_branch_taken;
	output wire [4:0] io_ifu_redirect_ghist_ras_idx;
	output wire io_ifu_commit_valid;
	output wire [15:0] io_ifu_commit_bits;
	output wire io_ifu_flush_icache;
	output wire io_ifu_enable_bpd;
	input io_ifu_perf_acquire;
	input io_ifu_perf_tlbMiss;
	output wire [3:0] io_ptw_ptbr_mode;
	output wire [43:0] io_ptw_ptbr_ppn;
	output wire io_ptw_sfence_valid;
	output wire io_ptw_sfence_bits_rs1;
	output wire io_ptw_sfence_bits_rs2;
	output wire [38:0] io_ptw_sfence_bits_addr;
	output wire io_ptw_status_debug;
	output wire [1:0] io_ptw_status_dprv;
	output wire [1:0] io_ptw_status_prv;
	output wire io_ptw_status_mxr;
	output wire io_ptw_status_sum;
	output wire io_ptw_pmp_0_cfg_l;
	output wire [1:0] io_ptw_pmp_0_cfg_a;
	output wire io_ptw_pmp_0_cfg_x;
	output wire io_ptw_pmp_0_cfg_w;
	output wire io_ptw_pmp_0_cfg_r;
	output wire [29:0] io_ptw_pmp_0_addr;
	output wire [31:0] io_ptw_pmp_0_mask;
	output wire io_ptw_pmp_1_cfg_l;
	output wire [1:0] io_ptw_pmp_1_cfg_a;
	output wire io_ptw_pmp_1_cfg_x;
	output wire io_ptw_pmp_1_cfg_w;
	output wire io_ptw_pmp_1_cfg_r;
	output wire [29:0] io_ptw_pmp_1_addr;
	output wire [31:0] io_ptw_pmp_1_mask;
	output wire io_ptw_pmp_2_cfg_l;
	output wire [1:0] io_ptw_pmp_2_cfg_a;
	output wire io_ptw_pmp_2_cfg_x;
	output wire io_ptw_pmp_2_cfg_w;
	output wire io_ptw_pmp_2_cfg_r;
	output wire [29:0] io_ptw_pmp_2_addr;
	output wire [31:0] io_ptw_pmp_2_mask;
	output wire io_ptw_pmp_3_cfg_l;
	output wire [1:0] io_ptw_pmp_3_cfg_a;
	output wire io_ptw_pmp_3_cfg_x;
	output wire io_ptw_pmp_3_cfg_w;
	output wire io_ptw_pmp_3_cfg_r;
	output wire [29:0] io_ptw_pmp_3_addr;
	output wire [31:0] io_ptw_pmp_3_mask;
	output wire io_ptw_pmp_4_cfg_l;
	output wire [1:0] io_ptw_pmp_4_cfg_a;
	output wire io_ptw_pmp_4_cfg_x;
	output wire io_ptw_pmp_4_cfg_w;
	output wire io_ptw_pmp_4_cfg_r;
	output wire [29:0] io_ptw_pmp_4_addr;
	output wire [31:0] io_ptw_pmp_4_mask;
	output wire io_ptw_pmp_5_cfg_l;
	output wire [1:0] io_ptw_pmp_5_cfg_a;
	output wire io_ptw_pmp_5_cfg_x;
	output wire io_ptw_pmp_5_cfg_w;
	output wire io_ptw_pmp_5_cfg_r;
	output wire [29:0] io_ptw_pmp_5_addr;
	output wire [31:0] io_ptw_pmp_5_mask;
	output wire io_ptw_pmp_6_cfg_l;
	output wire [1:0] io_ptw_pmp_6_cfg_a;
	output wire io_ptw_pmp_6_cfg_x;
	output wire io_ptw_pmp_6_cfg_w;
	output wire io_ptw_pmp_6_cfg_r;
	output wire [29:0] io_ptw_pmp_6_addr;
	output wire [31:0] io_ptw_pmp_6_mask;
	output wire io_ptw_pmp_7_cfg_l;
	output wire [1:0] io_ptw_pmp_7_cfg_a;
	output wire io_ptw_pmp_7_cfg_x;
	output wire io_ptw_pmp_7_cfg_w;
	output wire io_ptw_pmp_7_cfg_r;
	output wire [29:0] io_ptw_pmp_7_addr;
	output wire [31:0] io_ptw_pmp_7_mask;
	input io_ptw_perf_l2miss;
	output wire io_lsu_agen_0_valid;
	output wire [7:0] io_lsu_agen_0_bits_uop_br_mask;
	output wire [3:0] io_lsu_agen_0_bits_uop_ldq_idx;
	output wire [3:0] io_lsu_agen_0_bits_uop_stq_idx;
	output wire [5:0] io_lsu_agen_0_bits_uop_pdst;
	output wire io_lsu_agen_0_bits_uop_uses_ldq;
	output wire io_lsu_agen_0_bits_uop_uses_stq;
	output wire [1:0] io_lsu_agen_0_bits_uop_dst_rtype;
	output wire io_lsu_agen_0_bits_uop_fp_val;
	output wire [63:0] io_lsu_agen_0_bits_data;
	output wire io_lsu_dgen_0_valid;
	output wire [3:0] io_lsu_dgen_0_bits_uop_stq_idx;
	output wire [63:0] io_lsu_dgen_0_bits_data;
	output wire io_lsu_dgen_1_valid;
	output wire [3:0] io_lsu_dgen_1_bits_uop_stq_idx;
	output wire [63:0] io_lsu_dgen_1_bits_data;
	output wire io_lsu_dgen_2_valid;
	output wire [3:0] io_lsu_dgen_2_bits_uop_stq_idx;
	output wire [63:0] io_lsu_dgen_2_bits_data;
	input io_lsu_iwakeups_0_valid;
	input [5:0] io_lsu_iwakeups_0_bits_uop_pdst;
	input [1:0] io_lsu_iwakeups_0_bits_uop_dst_rtype;
	input io_lsu_iwakeups_0_bits_bypassable;
	input io_lsu_iwakeups_0_bits_rebusy;
	input io_lsu_iresp_0_valid;
	input [7:0] io_lsu_iresp_0_bits_uop_br_mask;
	input [4:0] io_lsu_iresp_0_bits_uop_rob_idx;
	input [5:0] io_lsu_iresp_0_bits_uop_pdst;
	input [63:0] io_lsu_iresp_0_bits_data;
	input io_lsu_fresp_0_valid;
	input [7:0] io_lsu_fresp_0_bits_uop_br_mask;
	input [4:0] io_lsu_fresp_0_bits_uop_rob_idx;
	input [5:0] io_lsu_fresp_0_bits_uop_pdst;
	input [1:0] io_lsu_fresp_0_bits_uop_mem_size;
	input [1:0] io_lsu_fresp_0_bits_uop_dst_rtype;
	input [63:0] io_lsu_fresp_0_bits_data;
	output wire io_lsu_sfence_valid;
	output wire io_lsu_sfence_bits_rs1;
	output wire io_lsu_sfence_bits_rs2;
	output wire [38:0] io_lsu_sfence_bits_addr;
	output wire io_lsu_dis_uops_0_valid;
	output wire [31:0] io_lsu_dis_uops_0_bits_inst;
	output wire [31:0] io_lsu_dis_uops_0_bits_debug_inst;
	output wire io_lsu_dis_uops_0_bits_is_rvc;
	output wire [39:0] io_lsu_dis_uops_0_bits_debug_pc;
	output wire io_lsu_dis_uops_0_bits_iq_type_0;
	output wire io_lsu_dis_uops_0_bits_iq_type_1;
	output wire io_lsu_dis_uops_0_bits_iq_type_2;
	output wire io_lsu_dis_uops_0_bits_iq_type_3;
	output wire io_lsu_dis_uops_0_bits_fu_code_0;
	output wire io_lsu_dis_uops_0_bits_fu_code_1;
	output wire io_lsu_dis_uops_0_bits_fu_code_2;
	output wire io_lsu_dis_uops_0_bits_fu_code_3;
	output wire io_lsu_dis_uops_0_bits_fu_code_4;
	output wire io_lsu_dis_uops_0_bits_fu_code_5;
	output wire io_lsu_dis_uops_0_bits_fu_code_6;
	output wire io_lsu_dis_uops_0_bits_fu_code_7;
	output wire io_lsu_dis_uops_0_bits_fu_code_8;
	output wire io_lsu_dis_uops_0_bits_fu_code_9;
	output wire io_lsu_dis_uops_0_bits_iw_issued;
	output wire io_lsu_dis_uops_0_bits_iw_issued_partial_agen;
	output wire io_lsu_dis_uops_0_bits_iw_issued_partial_dgen;
	output wire io_lsu_dis_uops_0_bits_iw_p1_speculative_child;
	output wire io_lsu_dis_uops_0_bits_iw_p2_speculative_child;
	output wire io_lsu_dis_uops_0_bits_iw_p1_bypass_hint;
	output wire io_lsu_dis_uops_0_bits_iw_p2_bypass_hint;
	output wire io_lsu_dis_uops_0_bits_iw_p3_bypass_hint;
	output wire [7:0] io_lsu_dis_uops_0_bits_br_mask;
	output wire [2:0] io_lsu_dis_uops_0_bits_br_tag;
	output wire [3:0] io_lsu_dis_uops_0_bits_br_type;
	output wire io_lsu_dis_uops_0_bits_is_sfb;
	output wire io_lsu_dis_uops_0_bits_is_fence;
	output wire io_lsu_dis_uops_0_bits_is_fencei;
	output wire io_lsu_dis_uops_0_bits_is_sfence;
	output wire io_lsu_dis_uops_0_bits_is_amo;
	output wire io_lsu_dis_uops_0_bits_is_eret;
	output wire io_lsu_dis_uops_0_bits_is_sys_pc2epc;
	output wire io_lsu_dis_uops_0_bits_is_rocc;
	output wire io_lsu_dis_uops_0_bits_is_mov;
	output wire [3:0] io_lsu_dis_uops_0_bits_ftq_idx;
	output wire io_lsu_dis_uops_0_bits_edge_inst;
	output wire [5:0] io_lsu_dis_uops_0_bits_pc_lob;
	output wire io_lsu_dis_uops_0_bits_taken;
	output wire io_lsu_dis_uops_0_bits_imm_rename;
	output wire [2:0] io_lsu_dis_uops_0_bits_imm_sel;
	output wire [4:0] io_lsu_dis_uops_0_bits_pimm;
	output wire [19:0] io_lsu_dis_uops_0_bits_imm_packed;
	output wire [1:0] io_lsu_dis_uops_0_bits_op1_sel;
	output wire [2:0] io_lsu_dis_uops_0_bits_op2_sel;
	output wire io_lsu_dis_uops_0_bits_fp_ctrl_ldst;
	output wire io_lsu_dis_uops_0_bits_fp_ctrl_wen;
	output wire io_lsu_dis_uops_0_bits_fp_ctrl_ren1;
	output wire io_lsu_dis_uops_0_bits_fp_ctrl_ren2;
	output wire io_lsu_dis_uops_0_bits_fp_ctrl_ren3;
	output wire io_lsu_dis_uops_0_bits_fp_ctrl_swap12;
	output wire io_lsu_dis_uops_0_bits_fp_ctrl_swap23;
	output wire [1:0] io_lsu_dis_uops_0_bits_fp_ctrl_typeTagIn;
	output wire [1:0] io_lsu_dis_uops_0_bits_fp_ctrl_typeTagOut;
	output wire io_lsu_dis_uops_0_bits_fp_ctrl_fromint;
	output wire io_lsu_dis_uops_0_bits_fp_ctrl_toint;
	output wire io_lsu_dis_uops_0_bits_fp_ctrl_fastpipe;
	output wire io_lsu_dis_uops_0_bits_fp_ctrl_fma;
	output wire io_lsu_dis_uops_0_bits_fp_ctrl_div;
	output wire io_lsu_dis_uops_0_bits_fp_ctrl_sqrt;
	output wire io_lsu_dis_uops_0_bits_fp_ctrl_wflags;
	output wire io_lsu_dis_uops_0_bits_fp_ctrl_vec;
	output wire [4:0] io_lsu_dis_uops_0_bits_rob_idx;
	output wire [3:0] io_lsu_dis_uops_0_bits_ldq_idx;
	output wire [3:0] io_lsu_dis_uops_0_bits_stq_idx;
	output wire [1:0] io_lsu_dis_uops_0_bits_rxq_idx;
	output wire [5:0] io_lsu_dis_uops_0_bits_pdst;
	output wire [5:0] io_lsu_dis_uops_0_bits_prs1;
	output wire [5:0] io_lsu_dis_uops_0_bits_prs2;
	output wire [5:0] io_lsu_dis_uops_0_bits_prs3;
	output wire [3:0] io_lsu_dis_uops_0_bits_ppred;
	output wire io_lsu_dis_uops_0_bits_prs1_busy;
	output wire io_lsu_dis_uops_0_bits_prs2_busy;
	output wire io_lsu_dis_uops_0_bits_prs3_busy;
	output wire io_lsu_dis_uops_0_bits_ppred_busy;
	output wire [5:0] io_lsu_dis_uops_0_bits_stale_pdst;
	output wire io_lsu_dis_uops_0_bits_exception;
	output wire [63:0] io_lsu_dis_uops_0_bits_exc_cause;
	output wire [4:0] io_lsu_dis_uops_0_bits_mem_cmd;
	output wire [1:0] io_lsu_dis_uops_0_bits_mem_size;
	output wire io_lsu_dis_uops_0_bits_mem_signed;
	output wire io_lsu_dis_uops_0_bits_uses_ldq;
	output wire io_lsu_dis_uops_0_bits_uses_stq;
	output wire io_lsu_dis_uops_0_bits_is_unique;
	output wire io_lsu_dis_uops_0_bits_flush_on_commit;
	output wire [2:0] io_lsu_dis_uops_0_bits_csr_cmd;
	output wire io_lsu_dis_uops_0_bits_ldst_is_rs1;
	output wire [5:0] io_lsu_dis_uops_0_bits_ldst;
	output wire [5:0] io_lsu_dis_uops_0_bits_lrs1;
	output wire [5:0] io_lsu_dis_uops_0_bits_lrs2;
	output wire [5:0] io_lsu_dis_uops_0_bits_lrs3;
	output wire [1:0] io_lsu_dis_uops_0_bits_dst_rtype;
	output wire [1:0] io_lsu_dis_uops_0_bits_lrs1_rtype;
	output wire [1:0] io_lsu_dis_uops_0_bits_lrs2_rtype;
	output wire io_lsu_dis_uops_0_bits_frs3_en;
	output wire io_lsu_dis_uops_0_bits_fcn_dw;
	output wire [4:0] io_lsu_dis_uops_0_bits_fcn_op;
	output wire io_lsu_dis_uops_0_bits_fp_val;
	output wire [2:0] io_lsu_dis_uops_0_bits_fp_rm;
	output wire [1:0] io_lsu_dis_uops_0_bits_fp_typ;
	output wire io_lsu_dis_uops_0_bits_xcpt_pf_if;
	output wire io_lsu_dis_uops_0_bits_xcpt_ae_if;
	output wire io_lsu_dis_uops_0_bits_xcpt_ma_if;
	output wire io_lsu_dis_uops_0_bits_bp_debug_if;
	output wire io_lsu_dis_uops_0_bits_bp_xcpt_if;
	output wire [2:0] io_lsu_dis_uops_0_bits_debug_fsrc;
	output wire [2:0] io_lsu_dis_uops_0_bits_debug_tsrc;
	input [3:0] io_lsu_dis_ldq_idx_0;
	input [3:0] io_lsu_dis_stq_idx_0;
	input io_lsu_ldq_full_0;
	input io_lsu_stq_full_0;
	output wire io_lsu_commit_valids_0;
	output wire io_lsu_commit_uops_0_uses_ldq;
	output wire io_lsu_commit_uops_0_uses_stq;
	output wire io_lsu_commit_load_at_rob_head;
	input io_lsu_clr_bsy_0_valid;
	input [4:0] io_lsu_clr_bsy_0_bits;
	input io_lsu_clr_unsafe_0_valid;
	input [4:0] io_lsu_clr_unsafe_0_bits;
	output wire io_lsu_fence_dmem;
	output wire [7:0] io_lsu_brupdate_b1_resolve_mask;
	output wire [7:0] io_lsu_brupdate_b1_mispredict_mask;
	output wire [3:0] io_lsu_brupdate_b2_uop_ldq_idx;
	output wire [3:0] io_lsu_brupdate_b2_uop_stq_idx;
	output wire io_lsu_brupdate_b2_mispredict;
	output wire [4:0] io_lsu_rob_head_idx;
	output wire io_lsu_exception;
	input io_lsu_fencei_rdy;
	input io_lsu_lxcpt_valid;
	input [7:0] io_lsu_lxcpt_bits_uop_br_mask;
	input [4:0] io_lsu_lxcpt_bits_uop_rob_idx;
	input [4:0] io_lsu_lxcpt_bits_cause;
	input [39:0] io_lsu_lxcpt_bits_badvaddr;
	input io_lsu_perf_acquire;
	input io_lsu_perf_release;
	input io_lsu_perf_tlbMiss;
	wire dis_stalls_0;
	wire [4:0] _plusarg_reader_out;
	wire _ll_arb_io_in_1_ready;
	wire _ll_arb_io_in_2_ready;
	wire _ll_arb_io_in_3_ready;
	wire _ll_arb_io_out_valid;
	wire [7:0] _ll_arb_io_out_bits_uop_br_mask;
	wire [4:0] _ll_arb_io_out_bits_uop_rob_idx;
	wire [5:0] _ll_arb_io_out_bits_uop_pdst;
	wire [1:0] _ll_arb_io_out_bits_uop_dst_rtype;
	wire [63:0] _ll_arb_io_out_bits_data;
	wire _ll_arb_io_out_bits_predicated;
	wire _ll_arb_io_out_bits_fflags_valid;
	wire [4:0] _ll_arb_io_out_bits_fflags_bits;
	wire _dis_uops_0_pdst_prng_io_out_0;
	wire _dis_uops_0_pdst_prng_io_out_1;
	wire _dis_uops_0_pdst_prng_io_out_2;
	wire _dis_uops_0_pdst_prng_io_out_3;
	wire _dis_uops_0_pdst_prng_io_out_4;
	wire _dis_uops_0_pdst_prng_io_out_5;
	wire _ftq_arb_io_in_2_ready;
	wire [63:0] _csr_io_rw_rdata;
	wire _csr_io_decode_0_fp_illegal;
	wire _csr_io_decode_0_read_illegal;
	wire _csr_io_decode_0_write_illegal;
	wire _csr_io_decode_0_write_flush;
	wire _csr_io_decode_0_system_illegal;
	wire _csr_io_csr_stall;
	wire _csr_io_singleStep;
	wire _csr_io_status_debug;
	wire [39:0] _csr_io_evec;
	wire [2:0] _csr_io_fcsr_rm;
	wire _csr_io_interrupt;
	wire [63:0] _csr_io_interrupt_cause;
	wire [63:0] _csr_io_counters_0_eventSel;
	wire [63:0] _csr_io_counters_1_eventSel;
	wire [63:0] _csr_io_customCSRs_0_value;
	wire [63:0] _csr_io_customCSRs_1_value;
	wire [63:0] _csr_io_customCSRs_2_value;
	wire [4:0] _rob_io_rob_tail_idx;
	wire _rob_io_commit_valids_0;
	wire _rob_io_commit_arch_valids_0;
	wire [3:0] _rob_io_commit_uops_0_br_type;
	wire _rob_io_commit_uops_0_is_fencei;
	wire [3:0] _rob_io_commit_uops_0_ftq_idx;
	wire [5:0] _rob_io_commit_uops_0_pdst;
	wire [5:0] _rob_io_commit_uops_0_stale_pdst;
	wire [5:0] _rob_io_commit_uops_0_ldst;
	wire [1:0] _rob_io_commit_uops_0_dst_rtype;
	wire [2:0] _rob_io_commit_uops_0_debug_fsrc;
	wire _rob_io_commit_fflags_valid;
	wire [4:0] _rob_io_commit_fflags_bits;
	wire _rob_io_rollback;
	wire _rob_io_com_xcpt_valid;
	wire [3:0] _rob_io_com_xcpt_bits_ftq_idx;
	wire _rob_io_com_xcpt_bits_edge_inst;
	wire [5:0] _rob_io_com_xcpt_bits_pc_lob;
	wire [63:0] _rob_io_com_xcpt_bits_cause;
	wire [63:0] _rob_io_com_xcpt_bits_badvaddr;
	wire _rob_io_flush_valid;
	wire [3:0] _rob_io_flush_bits_ftq_idx;
	wire _rob_io_flush_bits_edge_inst;
	wire _rob_io_flush_bits_is_rvc;
	wire [5:0] _rob_io_flush_bits_pc_lob;
	wire [2:0] _rob_io_flush_bits_flush_typ;
	wire _rob_io_empty;
	wire _rob_io_ready;
	wire _rob_io_flush_frontend;
	wire [3:0] _bregfile_io_rrd_read_resps_0_ldq_idx;
	wire [3:0] _bregfile_io_rrd_read_resps_0_stq_idx;
	wire [19:0] _immregfile_io_rrd_read_resps_0;
	wire [19:0] _immregfile_io_rrd_read_resps_2;
	wire [19:0] _immregfile_io_rrd_read_resps_3;
	wire _pregfile_io_rrd_read_resps_0;
	wire _iregfile_io_arb_read_reqs_2_ready;
	wire _iregfile_io_arb_read_reqs_3_ready;
	wire _iregfile_io_arb_read_reqs_4_ready;
	wire _iregfile_io_arb_read_reqs_5_ready;
	wire [63:0] _iregfile_io_rrd_read_resps_0;
	wire [63:0] _iregfile_io_rrd_read_resps_1;
	wire [63:0] _iregfile_io_rrd_read_resps_2;
	wire [63:0] _iregfile_io_rrd_read_resps_3;
	wire [63:0] _iregfile_io_rrd_read_resps_4;
	wire [63:0] _iregfile_io_rrd_read_resps_5;
	wire _dispatcher_io_ren_uops_0_ready;
	wire _dispatcher_io_dis_uops_3_0_valid;
	wire [31:0] _dispatcher_io_dis_uops_3_0_bits_inst;
	wire [31:0] _dispatcher_io_dis_uops_3_0_bits_debug_inst;
	wire _dispatcher_io_dis_uops_3_0_bits_is_rvc;
	wire [39:0] _dispatcher_io_dis_uops_3_0_bits_debug_pc;
	wire _dispatcher_io_dis_uops_3_0_bits_iq_type_0;
	wire _dispatcher_io_dis_uops_3_0_bits_iq_type_1;
	wire _dispatcher_io_dis_uops_3_0_bits_iq_type_2;
	wire _dispatcher_io_dis_uops_3_0_bits_iq_type_3;
	wire _dispatcher_io_dis_uops_3_0_bits_fu_code_0;
	wire _dispatcher_io_dis_uops_3_0_bits_fu_code_1;
	wire _dispatcher_io_dis_uops_3_0_bits_fu_code_2;
	wire _dispatcher_io_dis_uops_3_0_bits_fu_code_3;
	wire _dispatcher_io_dis_uops_3_0_bits_fu_code_4;
	wire _dispatcher_io_dis_uops_3_0_bits_fu_code_5;
	wire _dispatcher_io_dis_uops_3_0_bits_fu_code_6;
	wire _dispatcher_io_dis_uops_3_0_bits_fu_code_7;
	wire _dispatcher_io_dis_uops_3_0_bits_fu_code_8;
	wire _dispatcher_io_dis_uops_3_0_bits_fu_code_9;
	wire _dispatcher_io_dis_uops_3_0_bits_iw_p1_speculative_child;
	wire _dispatcher_io_dis_uops_3_0_bits_iw_p2_speculative_child;
	wire [7:0] _dispatcher_io_dis_uops_3_0_bits_br_mask;
	wire [2:0] _dispatcher_io_dis_uops_3_0_bits_br_tag;
	wire [3:0] _dispatcher_io_dis_uops_3_0_bits_br_type;
	wire _dispatcher_io_dis_uops_3_0_bits_is_sfb;
	wire _dispatcher_io_dis_uops_3_0_bits_is_fence;
	wire _dispatcher_io_dis_uops_3_0_bits_is_fencei;
	wire _dispatcher_io_dis_uops_3_0_bits_is_sfence;
	wire _dispatcher_io_dis_uops_3_0_bits_is_amo;
	wire _dispatcher_io_dis_uops_3_0_bits_is_eret;
	wire _dispatcher_io_dis_uops_3_0_bits_is_sys_pc2epc;
	wire _dispatcher_io_dis_uops_3_0_bits_is_rocc;
	wire _dispatcher_io_dis_uops_3_0_bits_is_mov;
	wire [3:0] _dispatcher_io_dis_uops_3_0_bits_ftq_idx;
	wire _dispatcher_io_dis_uops_3_0_bits_edge_inst;
	wire [5:0] _dispatcher_io_dis_uops_3_0_bits_pc_lob;
	wire _dispatcher_io_dis_uops_3_0_bits_taken;
	wire _dispatcher_io_dis_uops_3_0_bits_imm_rename;
	wire [2:0] _dispatcher_io_dis_uops_3_0_bits_imm_sel;
	wire [4:0] _dispatcher_io_dis_uops_3_0_bits_pimm;
	wire [19:0] _dispatcher_io_dis_uops_3_0_bits_imm_packed;
	wire [1:0] _dispatcher_io_dis_uops_3_0_bits_op1_sel;
	wire [2:0] _dispatcher_io_dis_uops_3_0_bits_op2_sel;
	wire _dispatcher_io_dis_uops_3_0_bits_fp_ctrl_ldst;
	wire _dispatcher_io_dis_uops_3_0_bits_fp_ctrl_wen;
	wire _dispatcher_io_dis_uops_3_0_bits_fp_ctrl_ren1;
	wire _dispatcher_io_dis_uops_3_0_bits_fp_ctrl_ren2;
	wire _dispatcher_io_dis_uops_3_0_bits_fp_ctrl_ren3;
	wire _dispatcher_io_dis_uops_3_0_bits_fp_ctrl_swap12;
	wire _dispatcher_io_dis_uops_3_0_bits_fp_ctrl_swap23;
	wire [1:0] _dispatcher_io_dis_uops_3_0_bits_fp_ctrl_typeTagIn;
	wire [1:0] _dispatcher_io_dis_uops_3_0_bits_fp_ctrl_typeTagOut;
	wire _dispatcher_io_dis_uops_3_0_bits_fp_ctrl_fromint;
	wire _dispatcher_io_dis_uops_3_0_bits_fp_ctrl_toint;
	wire _dispatcher_io_dis_uops_3_0_bits_fp_ctrl_fastpipe;
	wire _dispatcher_io_dis_uops_3_0_bits_fp_ctrl_fma;
	wire _dispatcher_io_dis_uops_3_0_bits_fp_ctrl_div;
	wire _dispatcher_io_dis_uops_3_0_bits_fp_ctrl_sqrt;
	wire _dispatcher_io_dis_uops_3_0_bits_fp_ctrl_wflags;
	wire _dispatcher_io_dis_uops_3_0_bits_fp_ctrl_vec;
	wire [4:0] _dispatcher_io_dis_uops_3_0_bits_rob_idx;
	wire [3:0] _dispatcher_io_dis_uops_3_0_bits_ldq_idx;
	wire [3:0] _dispatcher_io_dis_uops_3_0_bits_stq_idx;
	wire [1:0] _dispatcher_io_dis_uops_3_0_bits_rxq_idx;
	wire [5:0] _dispatcher_io_dis_uops_3_0_bits_pdst;
	wire [5:0] _dispatcher_io_dis_uops_3_0_bits_prs1;
	wire [5:0] _dispatcher_io_dis_uops_3_0_bits_prs2;
	wire [5:0] _dispatcher_io_dis_uops_3_0_bits_prs3;
	wire [3:0] _dispatcher_io_dis_uops_3_0_bits_ppred;
	wire _dispatcher_io_dis_uops_3_0_bits_prs1_busy;
	wire _dispatcher_io_dis_uops_3_0_bits_prs2_busy;
	wire _dispatcher_io_dis_uops_3_0_bits_prs3_busy;
	wire _dispatcher_io_dis_uops_3_0_bits_ppred_busy;
	wire [5:0] _dispatcher_io_dis_uops_3_0_bits_stale_pdst;
	wire _dispatcher_io_dis_uops_3_0_bits_exception;
	wire [63:0] _dispatcher_io_dis_uops_3_0_bits_exc_cause;
	wire [4:0] _dispatcher_io_dis_uops_3_0_bits_mem_cmd;
	wire [1:0] _dispatcher_io_dis_uops_3_0_bits_mem_size;
	wire _dispatcher_io_dis_uops_3_0_bits_mem_signed;
	wire _dispatcher_io_dis_uops_3_0_bits_uses_ldq;
	wire _dispatcher_io_dis_uops_3_0_bits_uses_stq;
	wire _dispatcher_io_dis_uops_3_0_bits_is_unique;
	wire _dispatcher_io_dis_uops_3_0_bits_flush_on_commit;
	wire [2:0] _dispatcher_io_dis_uops_3_0_bits_csr_cmd;
	wire _dispatcher_io_dis_uops_3_0_bits_ldst_is_rs1;
	wire [5:0] _dispatcher_io_dis_uops_3_0_bits_ldst;
	wire [5:0] _dispatcher_io_dis_uops_3_0_bits_lrs1;
	wire [5:0] _dispatcher_io_dis_uops_3_0_bits_lrs2;
	wire [5:0] _dispatcher_io_dis_uops_3_0_bits_lrs3;
	wire [1:0] _dispatcher_io_dis_uops_3_0_bits_dst_rtype;
	wire [1:0] _dispatcher_io_dis_uops_3_0_bits_lrs1_rtype;
	wire [1:0] _dispatcher_io_dis_uops_3_0_bits_lrs2_rtype;
	wire _dispatcher_io_dis_uops_3_0_bits_frs3_en;
	wire _dispatcher_io_dis_uops_3_0_bits_fcn_dw;
	wire [4:0] _dispatcher_io_dis_uops_3_0_bits_fcn_op;
	wire _dispatcher_io_dis_uops_3_0_bits_fp_val;
	wire [2:0] _dispatcher_io_dis_uops_3_0_bits_fp_rm;
	wire [1:0] _dispatcher_io_dis_uops_3_0_bits_fp_typ;
	wire _dispatcher_io_dis_uops_3_0_bits_xcpt_pf_if;
	wire _dispatcher_io_dis_uops_3_0_bits_xcpt_ae_if;
	wire _dispatcher_io_dis_uops_3_0_bits_xcpt_ma_if;
	wire _dispatcher_io_dis_uops_3_0_bits_bp_debug_if;
	wire _dispatcher_io_dis_uops_3_0_bits_bp_xcpt_if;
	wire [2:0] _dispatcher_io_dis_uops_3_0_bits_debug_fsrc;
	wire [2:0] _dispatcher_io_dis_uops_3_0_bits_debug_tsrc;
	wire _dispatcher_io_dis_uops_2_0_valid;
	wire [31:0] _dispatcher_io_dis_uops_2_0_bits_inst;
	wire [31:0] _dispatcher_io_dis_uops_2_0_bits_debug_inst;
	wire _dispatcher_io_dis_uops_2_0_bits_is_rvc;
	wire [39:0] _dispatcher_io_dis_uops_2_0_bits_debug_pc;
	wire _dispatcher_io_dis_uops_2_0_bits_iq_type_0;
	wire _dispatcher_io_dis_uops_2_0_bits_iq_type_1;
	wire _dispatcher_io_dis_uops_2_0_bits_iq_type_2;
	wire _dispatcher_io_dis_uops_2_0_bits_iq_type_3;
	wire _dispatcher_io_dis_uops_2_0_bits_fu_code_0;
	wire _dispatcher_io_dis_uops_2_0_bits_fu_code_1;
	wire _dispatcher_io_dis_uops_2_0_bits_fu_code_2;
	wire _dispatcher_io_dis_uops_2_0_bits_fu_code_3;
	wire _dispatcher_io_dis_uops_2_0_bits_fu_code_4;
	wire _dispatcher_io_dis_uops_2_0_bits_fu_code_5;
	wire _dispatcher_io_dis_uops_2_0_bits_fu_code_6;
	wire _dispatcher_io_dis_uops_2_0_bits_fu_code_7;
	wire _dispatcher_io_dis_uops_2_0_bits_fu_code_8;
	wire _dispatcher_io_dis_uops_2_0_bits_fu_code_9;
	wire _dispatcher_io_dis_uops_2_0_bits_iw_p1_speculative_child;
	wire _dispatcher_io_dis_uops_2_0_bits_iw_p2_speculative_child;
	wire [7:0] _dispatcher_io_dis_uops_2_0_bits_br_mask;
	wire [2:0] _dispatcher_io_dis_uops_2_0_bits_br_tag;
	wire [3:0] _dispatcher_io_dis_uops_2_0_bits_br_type;
	wire _dispatcher_io_dis_uops_2_0_bits_is_sfb;
	wire _dispatcher_io_dis_uops_2_0_bits_is_fence;
	wire _dispatcher_io_dis_uops_2_0_bits_is_fencei;
	wire _dispatcher_io_dis_uops_2_0_bits_is_sfence;
	wire _dispatcher_io_dis_uops_2_0_bits_is_amo;
	wire _dispatcher_io_dis_uops_2_0_bits_is_eret;
	wire _dispatcher_io_dis_uops_2_0_bits_is_sys_pc2epc;
	wire _dispatcher_io_dis_uops_2_0_bits_is_rocc;
	wire _dispatcher_io_dis_uops_2_0_bits_is_mov;
	wire [3:0] _dispatcher_io_dis_uops_2_0_bits_ftq_idx;
	wire _dispatcher_io_dis_uops_2_0_bits_edge_inst;
	wire [5:0] _dispatcher_io_dis_uops_2_0_bits_pc_lob;
	wire _dispatcher_io_dis_uops_2_0_bits_taken;
	wire _dispatcher_io_dis_uops_2_0_bits_imm_rename;
	wire [2:0] _dispatcher_io_dis_uops_2_0_bits_imm_sel;
	wire [4:0] _dispatcher_io_dis_uops_2_0_bits_pimm;
	wire [19:0] _dispatcher_io_dis_uops_2_0_bits_imm_packed;
	wire [1:0] _dispatcher_io_dis_uops_2_0_bits_op1_sel;
	wire [2:0] _dispatcher_io_dis_uops_2_0_bits_op2_sel;
	wire _dispatcher_io_dis_uops_2_0_bits_fp_ctrl_ldst;
	wire _dispatcher_io_dis_uops_2_0_bits_fp_ctrl_wen;
	wire _dispatcher_io_dis_uops_2_0_bits_fp_ctrl_ren1;
	wire _dispatcher_io_dis_uops_2_0_bits_fp_ctrl_ren2;
	wire _dispatcher_io_dis_uops_2_0_bits_fp_ctrl_ren3;
	wire _dispatcher_io_dis_uops_2_0_bits_fp_ctrl_swap12;
	wire _dispatcher_io_dis_uops_2_0_bits_fp_ctrl_swap23;
	wire [1:0] _dispatcher_io_dis_uops_2_0_bits_fp_ctrl_typeTagIn;
	wire [1:0] _dispatcher_io_dis_uops_2_0_bits_fp_ctrl_typeTagOut;
	wire _dispatcher_io_dis_uops_2_0_bits_fp_ctrl_fromint;
	wire _dispatcher_io_dis_uops_2_0_bits_fp_ctrl_toint;
	wire _dispatcher_io_dis_uops_2_0_bits_fp_ctrl_fastpipe;
	wire _dispatcher_io_dis_uops_2_0_bits_fp_ctrl_fma;
	wire _dispatcher_io_dis_uops_2_0_bits_fp_ctrl_div;
	wire _dispatcher_io_dis_uops_2_0_bits_fp_ctrl_sqrt;
	wire _dispatcher_io_dis_uops_2_0_bits_fp_ctrl_wflags;
	wire _dispatcher_io_dis_uops_2_0_bits_fp_ctrl_vec;
	wire [4:0] _dispatcher_io_dis_uops_2_0_bits_rob_idx;
	wire [3:0] _dispatcher_io_dis_uops_2_0_bits_ldq_idx;
	wire [3:0] _dispatcher_io_dis_uops_2_0_bits_stq_idx;
	wire [1:0] _dispatcher_io_dis_uops_2_0_bits_rxq_idx;
	wire [5:0] _dispatcher_io_dis_uops_2_0_bits_pdst;
	wire [5:0] _dispatcher_io_dis_uops_2_0_bits_prs1;
	wire [5:0] _dispatcher_io_dis_uops_2_0_bits_prs2;
	wire [5:0] _dispatcher_io_dis_uops_2_0_bits_prs3;
	wire [3:0] _dispatcher_io_dis_uops_2_0_bits_ppred;
	wire _dispatcher_io_dis_uops_2_0_bits_prs1_busy;
	wire _dispatcher_io_dis_uops_2_0_bits_prs2_busy;
	wire _dispatcher_io_dis_uops_2_0_bits_prs3_busy;
	wire _dispatcher_io_dis_uops_2_0_bits_ppred_busy;
	wire [5:0] _dispatcher_io_dis_uops_2_0_bits_stale_pdst;
	wire _dispatcher_io_dis_uops_2_0_bits_exception;
	wire [63:0] _dispatcher_io_dis_uops_2_0_bits_exc_cause;
	wire [4:0] _dispatcher_io_dis_uops_2_0_bits_mem_cmd;
	wire [1:0] _dispatcher_io_dis_uops_2_0_bits_mem_size;
	wire _dispatcher_io_dis_uops_2_0_bits_mem_signed;
	wire _dispatcher_io_dis_uops_2_0_bits_uses_ldq;
	wire _dispatcher_io_dis_uops_2_0_bits_uses_stq;
	wire _dispatcher_io_dis_uops_2_0_bits_is_unique;
	wire _dispatcher_io_dis_uops_2_0_bits_flush_on_commit;
	wire [2:0] _dispatcher_io_dis_uops_2_0_bits_csr_cmd;
	wire _dispatcher_io_dis_uops_2_0_bits_ldst_is_rs1;
	wire [5:0] _dispatcher_io_dis_uops_2_0_bits_ldst;
	wire [5:0] _dispatcher_io_dis_uops_2_0_bits_lrs1;
	wire [5:0] _dispatcher_io_dis_uops_2_0_bits_lrs2;
	wire [5:0] _dispatcher_io_dis_uops_2_0_bits_lrs3;
	wire [1:0] _dispatcher_io_dis_uops_2_0_bits_dst_rtype;
	wire [1:0] _dispatcher_io_dis_uops_2_0_bits_lrs1_rtype;
	wire [1:0] _dispatcher_io_dis_uops_2_0_bits_lrs2_rtype;
	wire _dispatcher_io_dis_uops_2_0_bits_frs3_en;
	wire _dispatcher_io_dis_uops_2_0_bits_fcn_dw;
	wire [4:0] _dispatcher_io_dis_uops_2_0_bits_fcn_op;
	wire _dispatcher_io_dis_uops_2_0_bits_fp_val;
	wire _dispatcher_io_dis_uops_2_0_bits_xcpt_pf_if;
	wire _dispatcher_io_dis_uops_2_0_bits_xcpt_ae_if;
	wire _dispatcher_io_dis_uops_2_0_bits_xcpt_ma_if;
	wire _dispatcher_io_dis_uops_2_0_bits_bp_debug_if;
	wire _dispatcher_io_dis_uops_2_0_bits_bp_xcpt_if;
	wire [2:0] _dispatcher_io_dis_uops_2_0_bits_debug_fsrc;
	wire [2:0] _dispatcher_io_dis_uops_2_0_bits_debug_tsrc;
	wire _dispatcher_io_dis_uops_1_0_valid;
	wire [31:0] _dispatcher_io_dis_uops_1_0_bits_inst;
	wire [31:0] _dispatcher_io_dis_uops_1_0_bits_debug_inst;
	wire _dispatcher_io_dis_uops_1_0_bits_is_rvc;
	wire [39:0] _dispatcher_io_dis_uops_1_0_bits_debug_pc;
	wire _dispatcher_io_dis_uops_1_0_bits_iq_type_0;
	wire _dispatcher_io_dis_uops_1_0_bits_iq_type_1;
	wire _dispatcher_io_dis_uops_1_0_bits_iq_type_2;
	wire _dispatcher_io_dis_uops_1_0_bits_iq_type_3;
	wire _dispatcher_io_dis_uops_1_0_bits_fu_code_0;
	wire _dispatcher_io_dis_uops_1_0_bits_fu_code_1;
	wire _dispatcher_io_dis_uops_1_0_bits_fu_code_2;
	wire _dispatcher_io_dis_uops_1_0_bits_fu_code_3;
	wire _dispatcher_io_dis_uops_1_0_bits_fu_code_4;
	wire _dispatcher_io_dis_uops_1_0_bits_fu_code_5;
	wire _dispatcher_io_dis_uops_1_0_bits_fu_code_6;
	wire _dispatcher_io_dis_uops_1_0_bits_fu_code_7;
	wire _dispatcher_io_dis_uops_1_0_bits_fu_code_8;
	wire _dispatcher_io_dis_uops_1_0_bits_fu_code_9;
	wire _dispatcher_io_dis_uops_1_0_bits_iw_p1_speculative_child;
	wire _dispatcher_io_dis_uops_1_0_bits_iw_p2_speculative_child;
	wire [7:0] _dispatcher_io_dis_uops_1_0_bits_br_mask;
	wire [2:0] _dispatcher_io_dis_uops_1_0_bits_br_tag;
	wire [3:0] _dispatcher_io_dis_uops_1_0_bits_br_type;
	wire _dispatcher_io_dis_uops_1_0_bits_is_sfb;
	wire _dispatcher_io_dis_uops_1_0_bits_is_fence;
	wire _dispatcher_io_dis_uops_1_0_bits_is_fencei;
	wire _dispatcher_io_dis_uops_1_0_bits_is_sfence;
	wire _dispatcher_io_dis_uops_1_0_bits_is_amo;
	wire _dispatcher_io_dis_uops_1_0_bits_is_eret;
	wire _dispatcher_io_dis_uops_1_0_bits_is_sys_pc2epc;
	wire _dispatcher_io_dis_uops_1_0_bits_is_rocc;
	wire _dispatcher_io_dis_uops_1_0_bits_is_mov;
	wire [3:0] _dispatcher_io_dis_uops_1_0_bits_ftq_idx;
	wire _dispatcher_io_dis_uops_1_0_bits_edge_inst;
	wire [5:0] _dispatcher_io_dis_uops_1_0_bits_pc_lob;
	wire _dispatcher_io_dis_uops_1_0_bits_taken;
	wire _dispatcher_io_dis_uops_1_0_bits_imm_rename;
	wire [2:0] _dispatcher_io_dis_uops_1_0_bits_imm_sel;
	wire [4:0] _dispatcher_io_dis_uops_1_0_bits_pimm;
	wire [19:0] _dispatcher_io_dis_uops_1_0_bits_imm_packed;
	wire [1:0] _dispatcher_io_dis_uops_1_0_bits_op1_sel;
	wire [2:0] _dispatcher_io_dis_uops_1_0_bits_op2_sel;
	wire _dispatcher_io_dis_uops_1_0_bits_fp_ctrl_ldst;
	wire _dispatcher_io_dis_uops_1_0_bits_fp_ctrl_wen;
	wire _dispatcher_io_dis_uops_1_0_bits_fp_ctrl_ren1;
	wire _dispatcher_io_dis_uops_1_0_bits_fp_ctrl_ren2;
	wire _dispatcher_io_dis_uops_1_0_bits_fp_ctrl_ren3;
	wire _dispatcher_io_dis_uops_1_0_bits_fp_ctrl_swap12;
	wire _dispatcher_io_dis_uops_1_0_bits_fp_ctrl_swap23;
	wire [1:0] _dispatcher_io_dis_uops_1_0_bits_fp_ctrl_typeTagIn;
	wire [1:0] _dispatcher_io_dis_uops_1_0_bits_fp_ctrl_typeTagOut;
	wire _dispatcher_io_dis_uops_1_0_bits_fp_ctrl_fromint;
	wire _dispatcher_io_dis_uops_1_0_bits_fp_ctrl_toint;
	wire _dispatcher_io_dis_uops_1_0_bits_fp_ctrl_fastpipe;
	wire _dispatcher_io_dis_uops_1_0_bits_fp_ctrl_fma;
	wire _dispatcher_io_dis_uops_1_0_bits_fp_ctrl_div;
	wire _dispatcher_io_dis_uops_1_0_bits_fp_ctrl_sqrt;
	wire _dispatcher_io_dis_uops_1_0_bits_fp_ctrl_wflags;
	wire _dispatcher_io_dis_uops_1_0_bits_fp_ctrl_vec;
	wire [4:0] _dispatcher_io_dis_uops_1_0_bits_rob_idx;
	wire [3:0] _dispatcher_io_dis_uops_1_0_bits_ldq_idx;
	wire [3:0] _dispatcher_io_dis_uops_1_0_bits_stq_idx;
	wire [1:0] _dispatcher_io_dis_uops_1_0_bits_rxq_idx;
	wire [5:0] _dispatcher_io_dis_uops_1_0_bits_pdst;
	wire [5:0] _dispatcher_io_dis_uops_1_0_bits_prs1;
	wire [5:0] _dispatcher_io_dis_uops_1_0_bits_prs2;
	wire [5:0] _dispatcher_io_dis_uops_1_0_bits_prs3;
	wire [3:0] _dispatcher_io_dis_uops_1_0_bits_ppred;
	wire _dispatcher_io_dis_uops_1_0_bits_prs1_busy;
	wire _dispatcher_io_dis_uops_1_0_bits_prs2_busy;
	wire _dispatcher_io_dis_uops_1_0_bits_prs3_busy;
	wire _dispatcher_io_dis_uops_1_0_bits_ppred_busy;
	wire [5:0] _dispatcher_io_dis_uops_1_0_bits_stale_pdst;
	wire _dispatcher_io_dis_uops_1_0_bits_exception;
	wire [63:0] _dispatcher_io_dis_uops_1_0_bits_exc_cause;
	wire [4:0] _dispatcher_io_dis_uops_1_0_bits_mem_cmd;
	wire [1:0] _dispatcher_io_dis_uops_1_0_bits_mem_size;
	wire _dispatcher_io_dis_uops_1_0_bits_mem_signed;
	wire _dispatcher_io_dis_uops_1_0_bits_uses_ldq;
	wire _dispatcher_io_dis_uops_1_0_bits_uses_stq;
	wire _dispatcher_io_dis_uops_1_0_bits_is_unique;
	wire _dispatcher_io_dis_uops_1_0_bits_flush_on_commit;
	wire [2:0] _dispatcher_io_dis_uops_1_0_bits_csr_cmd;
	wire _dispatcher_io_dis_uops_1_0_bits_ldst_is_rs1;
	wire [5:0] _dispatcher_io_dis_uops_1_0_bits_ldst;
	wire [5:0] _dispatcher_io_dis_uops_1_0_bits_lrs1;
	wire [5:0] _dispatcher_io_dis_uops_1_0_bits_lrs2;
	wire [5:0] _dispatcher_io_dis_uops_1_0_bits_lrs3;
	wire [1:0] _dispatcher_io_dis_uops_1_0_bits_dst_rtype;
	wire [1:0] _dispatcher_io_dis_uops_1_0_bits_lrs1_rtype;
	wire [1:0] _dispatcher_io_dis_uops_1_0_bits_lrs2_rtype;
	wire _dispatcher_io_dis_uops_1_0_bits_frs3_en;
	wire _dispatcher_io_dis_uops_1_0_bits_fcn_dw;
	wire [4:0] _dispatcher_io_dis_uops_1_0_bits_fcn_op;
	wire _dispatcher_io_dis_uops_1_0_bits_fp_val;
	wire [2:0] _dispatcher_io_dis_uops_1_0_bits_fp_rm;
	wire [1:0] _dispatcher_io_dis_uops_1_0_bits_fp_typ;
	wire _dispatcher_io_dis_uops_1_0_bits_xcpt_pf_if;
	wire _dispatcher_io_dis_uops_1_0_bits_xcpt_ae_if;
	wire _dispatcher_io_dis_uops_1_0_bits_xcpt_ma_if;
	wire _dispatcher_io_dis_uops_1_0_bits_bp_debug_if;
	wire _dispatcher_io_dis_uops_1_0_bits_bp_xcpt_if;
	wire [2:0] _dispatcher_io_dis_uops_1_0_bits_debug_fsrc;
	wire [2:0] _dispatcher_io_dis_uops_1_0_bits_debug_tsrc;
	wire _dispatcher_io_dis_uops_0_0_valid;
	wire _dispatcher_io_dis_uops_0_0_bits_fu_code_1;
	wire _dispatcher_io_dis_uops_0_0_bits_fu_code_2;
	wire _dispatcher_io_dis_uops_0_0_bits_iw_p1_speculative_child;
	wire _dispatcher_io_dis_uops_0_0_bits_iw_p2_speculative_child;
	wire [7:0] _dispatcher_io_dis_uops_0_0_bits_br_mask;
	wire _dispatcher_io_dis_uops_0_0_bits_is_fence;
	wire _dispatcher_io_dis_uops_0_0_bits_is_fencei;
	wire [2:0] _dispatcher_io_dis_uops_0_0_bits_imm_sel;
	wire [4:0] _dispatcher_io_dis_uops_0_0_bits_pimm;
	wire [3:0] _dispatcher_io_dis_uops_0_0_bits_ldq_idx;
	wire [3:0] _dispatcher_io_dis_uops_0_0_bits_stq_idx;
	wire [5:0] _dispatcher_io_dis_uops_0_0_bits_pdst;
	wire [5:0] _dispatcher_io_dis_uops_0_0_bits_prs1;
	wire [5:0] _dispatcher_io_dis_uops_0_0_bits_prs2;
	wire _dispatcher_io_dis_uops_0_0_bits_prs1_busy;
	wire _dispatcher_io_dis_uops_0_0_bits_prs2_busy;
	wire _dispatcher_io_dis_uops_0_0_bits_ppred_busy;
	wire _dispatcher_io_dis_uops_0_0_bits_exception;
	wire _dispatcher_io_dis_uops_0_0_bits_uses_ldq;
	wire _dispatcher_io_dis_uops_0_0_bits_uses_stq;
	wire [1:0] _dispatcher_io_dis_uops_0_0_bits_dst_rtype;
	wire [1:0] _dispatcher_io_dis_uops_0_0_bits_lrs1_rtype;
	wire [1:0] _dispatcher_io_dis_uops_0_0_bits_lrs2_rtype;
	wire _dispatcher_io_dis_uops_0_0_bits_fp_val;
	wire _alu_iss_unit_io_dis_uops_0_ready;
	wire _alu_iss_unit_io_iss_uops_0_valid;
	wire _alu_iss_unit_io_iss_uops_0_bits_is_rvc;
	wire _alu_iss_unit_io_iss_uops_0_bits_fu_code_0;
	wire _alu_iss_unit_io_iss_uops_0_bits_iw_p1_bypass_hint;
	wire _alu_iss_unit_io_iss_uops_0_bits_iw_p2_bypass_hint;
	wire [7:0] _alu_iss_unit_io_iss_uops_0_bits_br_mask;
	wire [2:0] _alu_iss_unit_io_iss_uops_0_bits_br_tag;
	wire [3:0] _alu_iss_unit_io_iss_uops_0_bits_br_type;
	wire _alu_iss_unit_io_iss_uops_0_bits_is_sfb;
	wire _alu_iss_unit_io_iss_uops_0_bits_is_mov;
	wire [3:0] _alu_iss_unit_io_iss_uops_0_bits_ftq_idx;
	wire _alu_iss_unit_io_iss_uops_0_bits_edge_inst;
	wire [5:0] _alu_iss_unit_io_iss_uops_0_bits_pc_lob;
	wire _alu_iss_unit_io_iss_uops_0_bits_taken;
	wire [2:0] _alu_iss_unit_io_iss_uops_0_bits_imm_sel;
	wire [4:0] _alu_iss_unit_io_iss_uops_0_bits_pimm;
	wire [1:0] _alu_iss_unit_io_iss_uops_0_bits_op1_sel;
	wire [2:0] _alu_iss_unit_io_iss_uops_0_bits_op2_sel;
	wire [4:0] _alu_iss_unit_io_iss_uops_0_bits_rob_idx;
	wire [5:0] _alu_iss_unit_io_iss_uops_0_bits_pdst;
	wire [5:0] _alu_iss_unit_io_iss_uops_0_bits_prs1;
	wire [5:0] _alu_iss_unit_io_iss_uops_0_bits_prs2;
	wire [3:0] _alu_iss_unit_io_iss_uops_0_bits_ppred;
	wire [2:0] _alu_iss_unit_io_iss_uops_0_bits_csr_cmd;
	wire _alu_iss_unit_io_iss_uops_0_bits_ldst_is_rs1;
	wire [1:0] _alu_iss_unit_io_iss_uops_0_bits_dst_rtype;
	wire [1:0] _alu_iss_unit_io_iss_uops_0_bits_lrs1_rtype;
	wire [1:0] _alu_iss_unit_io_iss_uops_0_bits_lrs2_rtype;
	wire _alu_iss_unit_io_iss_uops_0_bits_fcn_dw;
	wire [4:0] _alu_iss_unit_io_iss_uops_0_bits_fcn_op;
	wire _unq_iss_unit_io_dis_uops_0_ready;
	wire _unq_iss_unit_io_iss_uops_0_valid;
	wire [31:0] _unq_iss_unit_io_iss_uops_0_bits_inst;
	wire [31:0] _unq_iss_unit_io_iss_uops_0_bits_debug_inst;
	wire _unq_iss_unit_io_iss_uops_0_bits_is_rvc;
	wire [39:0] _unq_iss_unit_io_iss_uops_0_bits_debug_pc;
	wire _unq_iss_unit_io_iss_uops_0_bits_iq_type_0;
	wire _unq_iss_unit_io_iss_uops_0_bits_iq_type_1;
	wire _unq_iss_unit_io_iss_uops_0_bits_iq_type_2;
	wire _unq_iss_unit_io_iss_uops_0_bits_iq_type_3;
	wire _unq_iss_unit_io_iss_uops_0_bits_fu_code_0;
	wire _unq_iss_unit_io_iss_uops_0_bits_fu_code_1;
	wire _unq_iss_unit_io_iss_uops_0_bits_fu_code_2;
	wire _unq_iss_unit_io_iss_uops_0_bits_fu_code_3;
	wire _unq_iss_unit_io_iss_uops_0_bits_fu_code_4;
	wire _unq_iss_unit_io_iss_uops_0_bits_fu_code_5;
	wire _unq_iss_unit_io_iss_uops_0_bits_fu_code_6;
	wire _unq_iss_unit_io_iss_uops_0_bits_fu_code_7;
	wire _unq_iss_unit_io_iss_uops_0_bits_fu_code_8;
	wire _unq_iss_unit_io_iss_uops_0_bits_fu_code_9;
	wire _unq_iss_unit_io_iss_uops_0_bits_iw_issued;
	wire _unq_iss_unit_io_iss_uops_0_bits_iw_p1_speculative_child;
	wire _unq_iss_unit_io_iss_uops_0_bits_iw_p2_speculative_child;
	wire _unq_iss_unit_io_iss_uops_0_bits_iw_p1_bypass_hint;
	wire _unq_iss_unit_io_iss_uops_0_bits_iw_p2_bypass_hint;
	wire _unq_iss_unit_io_iss_uops_0_bits_iw_p3_bypass_hint;
	wire _unq_iss_unit_io_iss_uops_0_bits_dis_col_sel;
	wire [7:0] _unq_iss_unit_io_iss_uops_0_bits_br_mask;
	wire [2:0] _unq_iss_unit_io_iss_uops_0_bits_br_tag;
	wire [3:0] _unq_iss_unit_io_iss_uops_0_bits_br_type;
	wire _unq_iss_unit_io_iss_uops_0_bits_is_sfb;
	wire _unq_iss_unit_io_iss_uops_0_bits_is_fence;
	wire _unq_iss_unit_io_iss_uops_0_bits_is_fencei;
	wire _unq_iss_unit_io_iss_uops_0_bits_is_sfence;
	wire _unq_iss_unit_io_iss_uops_0_bits_is_amo;
	wire _unq_iss_unit_io_iss_uops_0_bits_is_eret;
	wire _unq_iss_unit_io_iss_uops_0_bits_is_sys_pc2epc;
	wire _unq_iss_unit_io_iss_uops_0_bits_is_rocc;
	wire _unq_iss_unit_io_iss_uops_0_bits_is_mov;
	wire [3:0] _unq_iss_unit_io_iss_uops_0_bits_ftq_idx;
	wire _unq_iss_unit_io_iss_uops_0_bits_edge_inst;
	wire [5:0] _unq_iss_unit_io_iss_uops_0_bits_pc_lob;
	wire _unq_iss_unit_io_iss_uops_0_bits_taken;
	wire _unq_iss_unit_io_iss_uops_0_bits_imm_rename;
	wire [2:0] _unq_iss_unit_io_iss_uops_0_bits_imm_sel;
	wire [4:0] _unq_iss_unit_io_iss_uops_0_bits_pimm;
	wire [19:0] _unq_iss_unit_io_iss_uops_0_bits_imm_packed;
	wire [1:0] _unq_iss_unit_io_iss_uops_0_bits_op1_sel;
	wire [2:0] _unq_iss_unit_io_iss_uops_0_bits_op2_sel;
	wire _unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_ldst;
	wire _unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_wen;
	wire _unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_ren1;
	wire _unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_ren2;
	wire _unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_ren3;
	wire _unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_swap12;
	wire _unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_swap23;
	wire [1:0] _unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_typeTagIn;
	wire [1:0] _unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_typeTagOut;
	wire _unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_fromint;
	wire _unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_toint;
	wire _unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_fastpipe;
	wire _unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_fma;
	wire _unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_div;
	wire _unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_sqrt;
	wire _unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_wflags;
	wire _unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_vec;
	wire [4:0] _unq_iss_unit_io_iss_uops_0_bits_rob_idx;
	wire [3:0] _unq_iss_unit_io_iss_uops_0_bits_ldq_idx;
	wire [3:0] _unq_iss_unit_io_iss_uops_0_bits_stq_idx;
	wire [1:0] _unq_iss_unit_io_iss_uops_0_bits_rxq_idx;
	wire [5:0] _unq_iss_unit_io_iss_uops_0_bits_pdst;
	wire [5:0] _unq_iss_unit_io_iss_uops_0_bits_prs1;
	wire [5:0] _unq_iss_unit_io_iss_uops_0_bits_prs2;
	wire [5:0] _unq_iss_unit_io_iss_uops_0_bits_prs3;
	wire [3:0] _unq_iss_unit_io_iss_uops_0_bits_ppred;
	wire _unq_iss_unit_io_iss_uops_0_bits_prs1_busy;
	wire _unq_iss_unit_io_iss_uops_0_bits_prs2_busy;
	wire _unq_iss_unit_io_iss_uops_0_bits_prs3_busy;
	wire _unq_iss_unit_io_iss_uops_0_bits_ppred_busy;
	wire [5:0] _unq_iss_unit_io_iss_uops_0_bits_stale_pdst;
	wire _unq_iss_unit_io_iss_uops_0_bits_exception;
	wire [63:0] _unq_iss_unit_io_iss_uops_0_bits_exc_cause;
	wire [4:0] _unq_iss_unit_io_iss_uops_0_bits_mem_cmd;
	wire [1:0] _unq_iss_unit_io_iss_uops_0_bits_mem_size;
	wire _unq_iss_unit_io_iss_uops_0_bits_mem_signed;
	wire _unq_iss_unit_io_iss_uops_0_bits_uses_ldq;
	wire _unq_iss_unit_io_iss_uops_0_bits_uses_stq;
	wire _unq_iss_unit_io_iss_uops_0_bits_is_unique;
	wire _unq_iss_unit_io_iss_uops_0_bits_flush_on_commit;
	wire [2:0] _unq_iss_unit_io_iss_uops_0_bits_csr_cmd;
	wire _unq_iss_unit_io_iss_uops_0_bits_ldst_is_rs1;
	wire [5:0] _unq_iss_unit_io_iss_uops_0_bits_ldst;
	wire [5:0] _unq_iss_unit_io_iss_uops_0_bits_lrs1;
	wire [5:0] _unq_iss_unit_io_iss_uops_0_bits_lrs2;
	wire [5:0] _unq_iss_unit_io_iss_uops_0_bits_lrs3;
	wire [1:0] _unq_iss_unit_io_iss_uops_0_bits_dst_rtype;
	wire [1:0] _unq_iss_unit_io_iss_uops_0_bits_lrs1_rtype;
	wire [1:0] _unq_iss_unit_io_iss_uops_0_bits_lrs2_rtype;
	wire _unq_iss_unit_io_iss_uops_0_bits_frs3_en;
	wire _unq_iss_unit_io_iss_uops_0_bits_fcn_dw;
	wire [4:0] _unq_iss_unit_io_iss_uops_0_bits_fcn_op;
	wire _unq_iss_unit_io_iss_uops_0_bits_fp_val;
	wire _unq_iss_unit_io_iss_uops_0_bits_xcpt_pf_if;
	wire _unq_iss_unit_io_iss_uops_0_bits_xcpt_ae_if;
	wire _unq_iss_unit_io_iss_uops_0_bits_xcpt_ma_if;
	wire _unq_iss_unit_io_iss_uops_0_bits_bp_debug_if;
	wire _unq_iss_unit_io_iss_uops_0_bits_bp_xcpt_if;
	wire [2:0] _unq_iss_unit_io_iss_uops_0_bits_debug_fsrc;
	wire [2:0] _unq_iss_unit_io_iss_uops_0_bits_debug_tsrc;
	wire _mem_iss_unit_io_dis_uops_0_ready;
	wire _mem_iss_unit_io_iss_uops_0_valid;
	wire _mem_iss_unit_io_iss_uops_0_bits_fu_code_1;
	wire _mem_iss_unit_io_iss_uops_0_bits_fu_code_2;
	wire _mem_iss_unit_io_iss_uops_0_bits_iw_p1_bypass_hint;
	wire [7:0] _mem_iss_unit_io_iss_uops_0_bits_br_mask;
	wire [2:0] _mem_iss_unit_io_iss_uops_0_bits_imm_sel;
	wire [4:0] _mem_iss_unit_io_iss_uops_0_bits_pimm;
	wire [3:0] _mem_iss_unit_io_iss_uops_0_bits_stq_idx;
	wire [5:0] _mem_iss_unit_io_iss_uops_0_bits_prs1;
	wire [1:0] _mem_iss_unit_io_iss_uops_0_bits_lrs1_rtype;
	wire _mem_iss_unit_io_iss_uops_1_valid;
	wire _mem_iss_unit_io_iss_uops_1_bits_fu_code_1;
	wire _mem_iss_unit_io_iss_uops_1_bits_fu_code_2;
	wire _mem_iss_unit_io_iss_uops_1_bits_iw_p1_bypass_hint;
	wire [7:0] _mem_iss_unit_io_iss_uops_1_bits_br_mask;
	wire [2:0] _mem_iss_unit_io_iss_uops_1_bits_imm_sel;
	wire [4:0] _mem_iss_unit_io_iss_uops_1_bits_pimm;
	wire [3:0] _mem_iss_unit_io_iss_uops_1_bits_ldq_idx;
	wire [3:0] _mem_iss_unit_io_iss_uops_1_bits_stq_idx;
	wire [5:0] _mem_iss_unit_io_iss_uops_1_bits_pdst;
	wire [5:0] _mem_iss_unit_io_iss_uops_1_bits_prs1;
	wire _mem_iss_unit_io_iss_uops_1_bits_uses_ldq;
	wire _mem_iss_unit_io_iss_uops_1_bits_uses_stq;
	wire [1:0] _mem_iss_unit_io_iss_uops_1_bits_dst_rtype;
	wire [1:0] _mem_iss_unit_io_iss_uops_1_bits_lrs1_rtype;
	wire _mem_iss_unit_io_iss_uops_1_bits_fp_val;
	wire _imm_rename_stage_io_ren_stalls_0;
	wire [2:0] _imm_rename_stage_io_ren2_uops_0_imm_sel;
	wire [4:0] _imm_rename_stage_io_ren2_uops_0_pimm;
	wire [5:0] _pred_rename_stage_io_ren2_uops_0_pdst;
	wire [3:0] _pred_rename_stage_io_ren2_uops_0_ppred;
	wire _pred_rename_stage_io_ren2_uops_0_ppred_busy;
	wire _fp_rename_stage_io_ren_stalls_0;
	wire [5:0] _fp_rename_stage_io_ren2_uops_0_pdst;
	wire [5:0] _fp_rename_stage_io_ren2_uops_0_prs1;
	wire [5:0] _fp_rename_stage_io_ren2_uops_0_prs2;
	wire [5:0] _fp_rename_stage_io_ren2_uops_0_prs3;
	wire _fp_rename_stage_io_ren2_uops_0_prs1_busy;
	wire _fp_rename_stage_io_ren2_uops_0_prs2_busy;
	wire _fp_rename_stage_io_ren2_uops_0_prs3_busy;
	wire [5:0] _fp_rename_stage_io_ren2_uops_0_stale_pdst;
	wire _rename_stage_io_ren_stalls_0;
	wire _rename_stage_io_ren2_mask_0;
	wire [31:0] _rename_stage_io_ren2_uops_0_inst;
	wire [31:0] _rename_stage_io_ren2_uops_0_debug_inst;
	wire _rename_stage_io_ren2_uops_0_is_rvc;
	wire [39:0] _rename_stage_io_ren2_uops_0_debug_pc;
	wire _rename_stage_io_ren2_uops_0_iq_type_0;
	wire _rename_stage_io_ren2_uops_0_iq_type_1;
	wire _rename_stage_io_ren2_uops_0_iq_type_2;
	wire _rename_stage_io_ren2_uops_0_iq_type_3;
	wire _rename_stage_io_ren2_uops_0_fu_code_0;
	wire _rename_stage_io_ren2_uops_0_fu_code_1;
	wire _rename_stage_io_ren2_uops_0_fu_code_2;
	wire _rename_stage_io_ren2_uops_0_fu_code_3;
	wire _rename_stage_io_ren2_uops_0_fu_code_4;
	wire _rename_stage_io_ren2_uops_0_fu_code_5;
	wire _rename_stage_io_ren2_uops_0_fu_code_6;
	wire _rename_stage_io_ren2_uops_0_fu_code_7;
	wire _rename_stage_io_ren2_uops_0_fu_code_8;
	wire _rename_stage_io_ren2_uops_0_fu_code_9;
	wire _rename_stage_io_ren2_uops_0_iw_p1_speculative_child;
	wire _rename_stage_io_ren2_uops_0_iw_p2_speculative_child;
	wire [7:0] _rename_stage_io_ren2_uops_0_br_mask;
	wire [2:0] _rename_stage_io_ren2_uops_0_br_tag;
	wire [3:0] _rename_stage_io_ren2_uops_0_br_type;
	wire _rename_stage_io_ren2_uops_0_is_sfb;
	wire _rename_stage_io_ren2_uops_0_is_fence;
	wire _rename_stage_io_ren2_uops_0_is_fencei;
	wire _rename_stage_io_ren2_uops_0_is_sfence;
	wire _rename_stage_io_ren2_uops_0_is_amo;
	wire _rename_stage_io_ren2_uops_0_is_eret;
	wire _rename_stage_io_ren2_uops_0_is_sys_pc2epc;
	wire _rename_stage_io_ren2_uops_0_is_rocc;
	wire _rename_stage_io_ren2_uops_0_is_mov;
	wire [3:0] _rename_stage_io_ren2_uops_0_ftq_idx;
	wire _rename_stage_io_ren2_uops_0_edge_inst;
	wire [5:0] _rename_stage_io_ren2_uops_0_pc_lob;
	wire _rename_stage_io_ren2_uops_0_taken;
	wire _rename_stage_io_ren2_uops_0_imm_rename;
	wire [19:0] _rename_stage_io_ren2_uops_0_imm_packed;
	wire [1:0] _rename_stage_io_ren2_uops_0_op1_sel;
	wire [2:0] _rename_stage_io_ren2_uops_0_op2_sel;
	wire _rename_stage_io_ren2_uops_0_fp_ctrl_ldst;
	wire _rename_stage_io_ren2_uops_0_fp_ctrl_wen;
	wire _rename_stage_io_ren2_uops_0_fp_ctrl_ren1;
	wire _rename_stage_io_ren2_uops_0_fp_ctrl_ren2;
	wire _rename_stage_io_ren2_uops_0_fp_ctrl_ren3;
	wire _rename_stage_io_ren2_uops_0_fp_ctrl_swap12;
	wire _rename_stage_io_ren2_uops_0_fp_ctrl_swap23;
	wire [1:0] _rename_stage_io_ren2_uops_0_fp_ctrl_typeTagIn;
	wire [1:0] _rename_stage_io_ren2_uops_0_fp_ctrl_typeTagOut;
	wire _rename_stage_io_ren2_uops_0_fp_ctrl_fromint;
	wire _rename_stage_io_ren2_uops_0_fp_ctrl_toint;
	wire _rename_stage_io_ren2_uops_0_fp_ctrl_fastpipe;
	wire _rename_stage_io_ren2_uops_0_fp_ctrl_fma;
	wire _rename_stage_io_ren2_uops_0_fp_ctrl_div;
	wire _rename_stage_io_ren2_uops_0_fp_ctrl_sqrt;
	wire _rename_stage_io_ren2_uops_0_fp_ctrl_wflags;
	wire _rename_stage_io_ren2_uops_0_fp_ctrl_vec;
	wire [1:0] _rename_stage_io_ren2_uops_0_rxq_idx;
	wire [5:0] _rename_stage_io_ren2_uops_0_pdst;
	wire [5:0] _rename_stage_io_ren2_uops_0_prs1;
	wire [5:0] _rename_stage_io_ren2_uops_0_prs2;
	wire _rename_stage_io_ren2_uops_0_prs1_busy;
	wire _rename_stage_io_ren2_uops_0_prs2_busy;
	wire [5:0] _rename_stage_io_ren2_uops_0_stale_pdst;
	wire _rename_stage_io_ren2_uops_0_exception;
	wire [63:0] _rename_stage_io_ren2_uops_0_exc_cause;
	wire [4:0] _rename_stage_io_ren2_uops_0_mem_cmd;
	wire [1:0] _rename_stage_io_ren2_uops_0_mem_size;
	wire _rename_stage_io_ren2_uops_0_mem_signed;
	wire _rename_stage_io_ren2_uops_0_uses_ldq;
	wire _rename_stage_io_ren2_uops_0_uses_stq;
	wire _rename_stage_io_ren2_uops_0_is_unique;
	wire _rename_stage_io_ren2_uops_0_flush_on_commit;
	wire [2:0] _rename_stage_io_ren2_uops_0_csr_cmd;
	wire _rename_stage_io_ren2_uops_0_ldst_is_rs1;
	wire [5:0] _rename_stage_io_ren2_uops_0_ldst;
	wire [5:0] _rename_stage_io_ren2_uops_0_lrs1;
	wire [5:0] _rename_stage_io_ren2_uops_0_lrs2;
	wire [5:0] _rename_stage_io_ren2_uops_0_lrs3;
	wire [1:0] _rename_stage_io_ren2_uops_0_dst_rtype;
	wire [1:0] _rename_stage_io_ren2_uops_0_lrs1_rtype;
	wire [1:0] _rename_stage_io_ren2_uops_0_lrs2_rtype;
	wire _rename_stage_io_ren2_uops_0_frs3_en;
	wire _rename_stage_io_ren2_uops_0_fcn_dw;
	wire [4:0] _rename_stage_io_ren2_uops_0_fcn_op;
	wire _rename_stage_io_ren2_uops_0_fp_val;
	wire [2:0] _rename_stage_io_ren2_uops_0_fp_rm;
	wire [1:0] _rename_stage_io_ren2_uops_0_fp_typ;
	wire _rename_stage_io_ren2_uops_0_xcpt_pf_if;
	wire _rename_stage_io_ren2_uops_0_xcpt_ae_if;
	wire _rename_stage_io_ren2_uops_0_xcpt_ma_if;
	wire _rename_stage_io_ren2_uops_0_bp_debug_if;
	wire _rename_stage_io_ren2_uops_0_bp_xcpt_if;
	wire [2:0] _rename_stage_io_ren2_uops_0_debug_fsrc;
	wire [2:0] _rename_stage_io_ren2_uops_0_debug_tsrc;
	wire [2:0] _dec_brmask_logic_io_br_tag_0;
	wire [7:0] _dec_brmask_logic_io_br_mask_0;
	wire _dec_brmask_logic_io_is_full_0;
	wire [31:0] _decode_0_io_deq_uop_inst;
	wire [31:0] _decode_0_io_deq_uop_debug_inst;
	wire _decode_0_io_deq_uop_is_rvc;
	wire [39:0] _decode_0_io_deq_uop_debug_pc;
	wire _decode_0_io_deq_uop_iq_type_0;
	wire _decode_0_io_deq_uop_iq_type_1;
	wire _decode_0_io_deq_uop_iq_type_2;
	wire _decode_0_io_deq_uop_iq_type_3;
	wire _decode_0_io_deq_uop_fu_code_0;
	wire _decode_0_io_deq_uop_fu_code_1;
	wire _decode_0_io_deq_uop_fu_code_2;
	wire _decode_0_io_deq_uop_fu_code_3;
	wire _decode_0_io_deq_uop_fu_code_4;
	wire _decode_0_io_deq_uop_fu_code_5;
	wire _decode_0_io_deq_uop_fu_code_6;
	wire _decode_0_io_deq_uop_fu_code_7;
	wire _decode_0_io_deq_uop_fu_code_8;
	wire _decode_0_io_deq_uop_fu_code_9;
	wire [3:0] _decode_0_io_deq_uop_br_type;
	wire _decode_0_io_deq_uop_is_sfb;
	wire _decode_0_io_deq_uop_is_fence;
	wire _decode_0_io_deq_uop_is_fencei;
	wire _decode_0_io_deq_uop_is_sfence;
	wire _decode_0_io_deq_uop_is_amo;
	wire _decode_0_io_deq_uop_is_eret;
	wire _decode_0_io_deq_uop_is_sys_pc2epc;
	wire _decode_0_io_deq_uop_is_rocc;
	wire _decode_0_io_deq_uop_is_mov;
	wire [3:0] _decode_0_io_deq_uop_ftq_idx;
	wire _decode_0_io_deq_uop_edge_inst;
	wire [5:0] _decode_0_io_deq_uop_pc_lob;
	wire _decode_0_io_deq_uop_taken;
	wire _decode_0_io_deq_uop_imm_rename;
	wire [2:0] _decode_0_io_deq_uop_imm_sel;
	wire [4:0] _decode_0_io_deq_uop_pimm;
	wire [19:0] _decode_0_io_deq_uop_imm_packed;
	wire [1:0] _decode_0_io_deq_uop_op1_sel;
	wire [2:0] _decode_0_io_deq_uop_op2_sel;
	wire _decode_0_io_deq_uop_fp_ctrl_ldst;
	wire _decode_0_io_deq_uop_fp_ctrl_wen;
	wire _decode_0_io_deq_uop_fp_ctrl_ren1;
	wire _decode_0_io_deq_uop_fp_ctrl_ren2;
	wire _decode_0_io_deq_uop_fp_ctrl_ren3;
	wire _decode_0_io_deq_uop_fp_ctrl_swap12;
	wire _decode_0_io_deq_uop_fp_ctrl_swap23;
	wire [1:0] _decode_0_io_deq_uop_fp_ctrl_typeTagIn;
	wire [1:0] _decode_0_io_deq_uop_fp_ctrl_typeTagOut;
	wire _decode_0_io_deq_uop_fp_ctrl_fromint;
	wire _decode_0_io_deq_uop_fp_ctrl_toint;
	wire _decode_0_io_deq_uop_fp_ctrl_fastpipe;
	wire _decode_0_io_deq_uop_fp_ctrl_fma;
	wire _decode_0_io_deq_uop_fp_ctrl_div;
	wire _decode_0_io_deq_uop_fp_ctrl_sqrt;
	wire _decode_0_io_deq_uop_fp_ctrl_wflags;
	wire _decode_0_io_deq_uop_exception;
	wire [63:0] _decode_0_io_deq_uop_exc_cause;
	wire [4:0] _decode_0_io_deq_uop_mem_cmd;
	wire [1:0] _decode_0_io_deq_uop_mem_size;
	wire _decode_0_io_deq_uop_mem_signed;
	wire _decode_0_io_deq_uop_uses_ldq;
	wire _decode_0_io_deq_uop_uses_stq;
	wire _decode_0_io_deq_uop_is_unique;
	wire _decode_0_io_deq_uop_flush_on_commit;
	wire [2:0] _decode_0_io_deq_uop_csr_cmd;
	wire _decode_0_io_deq_uop_ldst_is_rs1;
	wire [5:0] _decode_0_io_deq_uop_ldst;
	wire [5:0] _decode_0_io_deq_uop_lrs1;
	wire [5:0] _decode_0_io_deq_uop_lrs2;
	wire [5:0] _decode_0_io_deq_uop_lrs3;
	wire [1:0] _decode_0_io_deq_uop_dst_rtype;
	wire [1:0] _decode_0_io_deq_uop_lrs1_rtype;
	wire [1:0] _decode_0_io_deq_uop_lrs2_rtype;
	wire _decode_0_io_deq_uop_frs3_en;
	wire _decode_0_io_deq_uop_fcn_dw;
	wire [4:0] _decode_0_io_deq_uop_fcn_op;
	wire _decode_0_io_deq_uop_fp_val;
	wire [2:0] _decode_0_io_deq_uop_fp_rm;
	wire [1:0] _decode_0_io_deq_uop_fp_typ;
	wire _decode_0_io_deq_uop_xcpt_pf_if;
	wire _decode_0_io_deq_uop_xcpt_ae_if;
	wire _decode_0_io_deq_uop_bp_debug_if;
	wire _decode_0_io_deq_uop_bp_xcpt_if;
	wire [2:0] _decode_0_io_deq_uop_debug_fsrc;
	wire [31:0] _decode_0_io_csr_decode_inst;
	wire _fp_pipeline_io_dis_uops_0_ready;
	wire _fp_pipeline_io_from_int_ready;
	wire _fp_pipeline_io_to_int_valid;
	wire [7:0] _fp_pipeline_io_to_int_bits_uop_br_mask;
	wire [4:0] _fp_pipeline_io_to_int_bits_uop_rob_idx;
	wire [5:0] _fp_pipeline_io_to_int_bits_uop_pdst;
	wire [1:0] _fp_pipeline_io_to_int_bits_uop_dst_rtype;
	wire [63:0] _fp_pipeline_io_to_int_bits_data;
	wire _fp_pipeline_io_to_int_bits_predicated;
	wire _fp_pipeline_io_to_int_bits_fflags_valid;
	wire [4:0] _fp_pipeline_io_to_int_bits_fflags_bits;
	wire _fp_pipeline_io_wakeups_0_valid;
	wire [5:0] _fp_pipeline_io_wakeups_0_bits_uop_pdst;
	wire [1:0] _fp_pipeline_io_wakeups_0_bits_uop_dst_rtype;
	wire _fp_pipeline_io_wakeups_1_valid;
	wire [5:0] _fp_pipeline_io_wakeups_1_bits_uop_pdst;
	wire [1:0] _fp_pipeline_io_wakeups_1_bits_uop_dst_rtype;
	wire _fp_pipeline_io_wb_0_valid;
	wire [4:0] _fp_pipeline_io_wb_0_bits_uop_rob_idx;
	wire [5:0] _fp_pipeline_io_wb_0_bits_uop_pdst;
	wire _fp_pipeline_io_wb_0_bits_fflags_valid;
	wire [4:0] _fp_pipeline_io_wb_0_bits_fflags_bits;
	wire _fp_pipeline_io_wb_1_valid;
	wire [4:0] _fp_pipeline_io_wb_1_bits_uop_rob_idx;
	wire [5:0] _fp_pipeline_io_wb_1_bits_uop_pdst;
	wire _fp_pipeline_io_wb_1_bits_predicated;
	wire _fp_pipeline_io_wb_1_bits_fflags_valid;
	wire [4:0] _fp_pipeline_io_wb_1_bits_fflags_bits;
	wire _alu_exe_unit_0_io_arb_irf_reqs_0_valid;
	wire [5:0] _alu_exe_unit_0_io_arb_irf_reqs_0_bits;
	wire _alu_exe_unit_0_io_arb_irf_reqs_1_valid;
	wire [5:0] _alu_exe_unit_0_io_arb_irf_reqs_1_bits;
	wire [3:0] _alu_exe_unit_0_io_arb_prf_req_bits;
	wire [4:0] _alu_exe_unit_0_io_arb_immrf_req_bits;
	wire _alu_exe_unit_0_io_rrd_immrf_wakeup_valid;
	wire [4:0] _alu_exe_unit_0_io_rrd_immrf_wakeup_bits_uop_pimm;
	wire [2:0] _alu_exe_unit_0_io_arb_brf_req_bits;
	wire _alu_exe_unit_0_io_arb_ftq_reqs_0_valid;
	wire [3:0] _alu_exe_unit_0_io_arb_ftq_reqs_0_bits;
	wire _alu_exe_unit_0_io_arb_ftq_reqs_1_valid;
	wire [3:0] _alu_exe_unit_0_io_arb_ftq_reqs_1_bits;
	wire _alu_exe_unit_0_io_fast_wakeup_valid;
	wire [5:0] _alu_exe_unit_0_io_fast_wakeup_bits_uop_pdst;
	wire [1:0] _alu_exe_unit_0_io_fast_wakeup_bits_uop_dst_rtype;
	wire _alu_exe_unit_0_io_fast_pred_wakeup_valid;
	wire [5:0] _alu_exe_unit_0_io_fast_pred_wakeup_bits_uop_pdst;
	wire _alu_exe_unit_0_io_squash_iss;
	wire _alu_exe_unit_0_io_child_rebusy;
	wire _alu_exe_unit_0_io_alu_resp_valid;
	wire [7:0] _alu_exe_unit_0_io_alu_resp_bits_uop_br_mask;
	wire [3:0] _alu_exe_unit_0_io_alu_resp_bits_uop_br_type;
	wire _alu_exe_unit_0_io_alu_resp_bits_uop_is_sfb;
	wire [4:0] _alu_exe_unit_0_io_alu_resp_bits_uop_rob_idx;
	wire [5:0] _alu_exe_unit_0_io_alu_resp_bits_uop_pdst;
	wire [1:0] _alu_exe_unit_0_io_alu_resp_bits_uop_dst_rtype;
	wire [63:0] _alu_exe_unit_0_io_alu_resp_bits_data;
	wire _alu_exe_unit_0_io_alu_resp_bits_predicated;
	wire _alu_exe_unit_0_io_brinfo_valid;
	wire _alu_exe_unit_0_io_brinfo_bits_uop_is_rvc;
	wire [7:0] _alu_exe_unit_0_io_brinfo_bits_uop_br_mask;
	wire [2:0] _alu_exe_unit_0_io_brinfo_bits_uop_br_tag;
	wire [3:0] _alu_exe_unit_0_io_brinfo_bits_uop_ftq_idx;
	wire _alu_exe_unit_0_io_brinfo_bits_uop_edge_inst;
	wire [5:0] _alu_exe_unit_0_io_brinfo_bits_uop_pc_lob;
	wire [4:0] _alu_exe_unit_0_io_brinfo_bits_uop_rob_idx;
	wire [3:0] _alu_exe_unit_0_io_brinfo_bits_uop_ldq_idx;
	wire [3:0] _alu_exe_unit_0_io_brinfo_bits_uop_stq_idx;
	wire _alu_exe_unit_0_io_brinfo_bits_mispredict;
	wire _alu_exe_unit_0_io_brinfo_bits_taken;
	wire [2:0] _alu_exe_unit_0_io_brinfo_bits_cfi_type;
	wire [1:0] _alu_exe_unit_0_io_brinfo_bits_pc_sel;
	wire [39:0] _alu_exe_unit_0_io_brinfo_bits_jalr_target;
	wire [20:0] _alu_exe_unit_0_io_brinfo_bits_target_offset;
	wire _unique_exe_unit_0_io_ready_fu_types_4;
	wire _unique_exe_unit_0_io_ready_fu_types_8;
	wire _unique_exe_unit_0_io_arb_irf_reqs_0_valid;
	wire [5:0] _unique_exe_unit_0_io_arb_irf_reqs_0_bits;
	wire _unique_exe_unit_0_io_arb_irf_reqs_1_valid;
	wire [5:0] _unique_exe_unit_0_io_arb_irf_reqs_1_bits;
	wire [4:0] _unique_exe_unit_0_io_arb_immrf_req_bits;
	wire _unique_exe_unit_0_io_rrd_immrf_wakeup_valid;
	wire [4:0] _unique_exe_unit_0_io_rrd_immrf_wakeup_bits_uop_pimm;
	wire _unique_exe_unit_0_io_squash_iss;
	wire _unique_exe_unit_0_io_mul_resp_valid;
	wire [7:0] _unique_exe_unit_0_io_mul_resp_bits_uop_br_mask;
	wire [4:0] _unique_exe_unit_0_io_mul_resp_bits_uop_rob_idx;
	wire [5:0] _unique_exe_unit_0_io_mul_resp_bits_uop_pdst;
	wire [1:0] _unique_exe_unit_0_io_mul_resp_bits_uop_dst_rtype;
	wire [63:0] _unique_exe_unit_0_io_mul_resp_bits_data;
	wire _unique_exe_unit_0_io_csr_resp_valid;
	wire [7:0] _unique_exe_unit_0_io_csr_resp_bits_uop_br_mask;
	wire [4:0] _unique_exe_unit_0_io_csr_resp_bits_uop_rob_idx;
	wire [5:0] _unique_exe_unit_0_io_csr_resp_bits_uop_pdst;
	wire [2:0] _unique_exe_unit_0_io_csr_resp_bits_uop_csr_cmd;
	wire [1:0] _unique_exe_unit_0_io_csr_resp_bits_uop_dst_rtype;
	wire [63:0] _unique_exe_unit_0_io_csr_resp_bits_data;
	wire [11:0] _unique_exe_unit_0_io_csr_resp_bits_addr;
	wire _unique_exe_unit_0_io_sfence_valid;
	wire _unique_exe_unit_0_io_sfence_bits_rs1;
	wire _unique_exe_unit_0_io_sfence_bits_rs2;
	wire [38:0] _unique_exe_unit_0_io_sfence_bits_addr;
	wire _unique_exe_unit_0_io_ifpu_resp_valid;
	wire [4:0] _unique_exe_unit_0_io_ifpu_resp_bits_uop_rob_idx;
	wire [5:0] _unique_exe_unit_0_io_ifpu_resp_bits_uop_pdst;
	wire [1:0] _unique_exe_unit_0_io_ifpu_resp_bits_uop_dst_rtype;
	wire [64:0] _unique_exe_unit_0_io_ifpu_resp_bits_data;
	wire _unique_exe_unit_0_io_ifpu_resp_bits_predicated;
	wire _unique_exe_unit_0_io_ifpu_resp_bits_fflags_valid;
	wire [4:0] _unique_exe_unit_0_io_ifpu_resp_bits_fflags_bits;
	wire _unique_exe_unit_0_io_div_resp_valid;
	wire [7:0] _unique_exe_unit_0_io_div_resp_bits_uop_br_mask;
	wire [4:0] _unique_exe_unit_0_io_div_resp_bits_uop_rob_idx;
	wire [5:0] _unique_exe_unit_0_io_div_resp_bits_uop_pdst;
	wire [1:0] _unique_exe_unit_0_io_div_resp_bits_uop_dst_rtype;
	wire [63:0] _unique_exe_unit_0_io_div_resp_bits_data;
	wire _mem_exe_unit_1_io_ready_fu_types_1;
	wire _mem_exe_unit_1_io_arb_irf_reqs_0_valid;
	wire [5:0] _mem_exe_unit_1_io_arb_irf_reqs_0_bits;
	wire [4:0] _mem_exe_unit_1_io_arb_immrf_req_bits;
	wire _mem_exe_unit_1_io_rrd_immrf_wakeup_valid;
	wire [4:0] _mem_exe_unit_1_io_rrd_immrf_wakeup_bits_uop_pimm;
	wire _mem_exe_unit_1_io_squash_iss;
	wire _mem_exe_unit_0_io_arb_irf_reqs_0_valid;
	wire [5:0] _mem_exe_unit_0_io_arb_irf_reqs_0_bits;
	wire _mem_exe_unit_0_io_rrd_immrf_wakeup_valid;
	wire [4:0] _mem_exe_unit_0_io_rrd_immrf_wakeup_bits_uop_pimm;
	wire _mem_exe_unit_0_io_squash_iss;
	reg brinfos_0_valid;
	reg brinfos_0_bits_uop_is_rvc;
	reg [7:0] brinfos_0_bits_uop_br_mask;
	reg [2:0] brinfos_0_bits_uop_br_tag;
	reg [3:0] brinfos_0_bits_uop_ftq_idx;
	reg brinfos_0_bits_uop_edge_inst;
	reg [5:0] brinfos_0_bits_uop_pc_lob;
	reg [4:0] brinfos_0_bits_uop_rob_idx;
	reg [3:0] brinfos_0_bits_uop_ldq_idx;
	reg [3:0] brinfos_0_bits_uop_stq_idx;
	reg brinfos_0_bits_mispredict;
	reg brinfos_0_bits_taken;
	reg [2:0] brinfos_0_bits_cfi_type;
	reg [1:0] brinfos_0_bits_pc_sel;
	reg [39:0] brinfos_0_bits_jalr_target;
	reg [20:0] brinfos_0_bits_target_offset;
	reg b2_uop_is_rvc;
	reg [7:0] b2_uop_br_mask;
	reg [2:0] b2_uop_br_tag;
	reg [3:0] b2_uop_ftq_idx;
	reg b2_uop_edge_inst;
	reg [5:0] b2_uop_pc_lob;
	reg [4:0] b2_uop_rob_idx;
	reg [3:0] b2_uop_ldq_idx;
	reg [3:0] b2_uop_stq_idx;
	reg b2_mispredict;
	reg b2_taken;
	reg [2:0] b2_cfi_type;
	reg [1:0] b2_pc_sel;
	reg [39:0] b2_jalr_target;
	reg [20:0] b2_target_offset;
	reg brinfos_0_valid_REG;
	wire [7:0] _GEN = {5'h00, brinfos_0_bits_uop_br_tag};
	wire [7:0] b1_resolve_mask = {7'h00, brinfos_0_valid} << _GEN;
	wire _live_brinfos_T = brinfos_0_valid & brinfos_0_bits_mispredict;
	wire [7:0] b1_mispredict_mask = {7'h00, _live_brinfos_T} << _GEN;
	reg live_brinfos_REG;
	wire live_brinfos_0 = _live_brinfos_T & ~(|(b1_mispredict_mask & brinfos_0_bits_uop_br_mask) | live_brinfos_REG);
	reg csr_io_counters_0_inc_REG;
	reg csr_io_counters_1_inc_REG;
	reg [63:0] debug_tsc_reg;
	reg [63:0] debug_irt_reg;
	reg [63:0] debug_brs_0;
	reg [63:0] debug_brs_1;
	reg [63:0] debug_brs_2;
	reg [63:0] debug_brs_3;
	reg [63:0] debug_brs_4;
	reg [63:0] debug_jals_0;
	reg [63:0] debug_jals_1;
	reg [63:0] debug_jals_2;
	reg [63:0] debug_jals_3;
	reg [63:0] debug_jals_4;
	reg [63:0] debug_jalrs_0;
	reg [63:0] debug_jalrs_1;
	reg [63:0] debug_jalrs_2;
	reg [63:0] debug_jalrs_3;
	reg [63:0] debug_jalrs_4;
	wire _dec_brmask_logic_io_will_fire_0_T_13 = _decode_0_io_deq_uop_br_type == 4'h8;
	reg io_ifu_flush_icache_REG;
	reg REG;
	reg [2:0] flush_typ;
	reg [39:0] io_ifu_redirect_pc_r;
	reg [39:0] io_ifu_redirect_pc_r_1;
	reg [39:0] io_ifu_redirect_pc_r_2;
	reg [5:0] flush_pc_REG;
	reg flush_pc_REG_1;
	wire [39:0] _flush_pc_T_6 = ({io_ifu_rrd_ftq_resps_0_pc[39:6], 6'h00} + {34'h000000000, flush_pc_REG}) - {38'h0000000000, flush_pc_REG_1, 1'h0};
	reg flush_pc_next_REG;
	reg [3:0] io_ifu_redirect_ftq_idx_REG;
	reg REG_1;
	wire _GEN_0 = b2_mispredict & ~REG_1;
	wire [39:0] _GEN_1 = {io_ifu_rrd_ftq_resps_0_pc[39:6], b2_uop_pc_lob};
	wire [39:0] _npc_T_2 = _GEN_1 + {37'h0000000000, (b2_uop_is_rvc | b2_uop_edge_inst ? 3'h2 : 3'h4)};
	wire _next_ghist_T = b2_cfi_type == 3'h1;
	wire use_same_ghist = (_next_ghist_T & ~b2_taken) & ({io_ifu_rrd_ftq_resps_0_pc[39:6], 6'h00} == {_npc_T_2[39:3], 3'h0});
	wire _next_ghist_T_3 = io_ifu_rrd_ftq_resps_0_entry_cfi_idx_bits == b2_uop_pc_lob[2:1];
	wire [3:0] next_ghist_cfi_idx_oh = 4'h1 << b2_uop_pc_lob[2:1];
	wire [2:0] _GEN_2 = next_ghist_cfi_idx_oh[2:0] | next_ghist_cfi_idx_oh[3:1];
	wire [1:0] _GEN_3 = _GEN_2[1:0] | next_ghist_cfi_idx_oh[3:2];
	wire _next_ghist_new_history_old_history_T_1 = _next_ghist_T & b2_taken;
	wire io_ifu_redirect_flush_0 = ((REG | _GEN_0) | _rob_io_flush_frontend) | (|b1_mispredict_mask);
	reg dec_finished_mask;
	wire dec_valids_0 = (io_ifu_fetchpacket_valid & io_ifu_fetchpacket_bits_uops_0_valid) & ~dec_finished_mask;
	reg decode_0_io_interrupt_REG;
	reg [63:0] decode_0_io_interrupt_cause_REG;
	reg alu_exe_unit_0_io_rrd_ftq_resps_0_REG;
	wire use_port_2 = ~_alu_exe_unit_0_io_arb_ftq_reqs_0_valid & _alu_exe_unit_0_io_arb_ftq_reqs_1_valid;
	wire use_port_3 = ~use_port_2 & _alu_exe_unit_0_io_arb_ftq_reqs_1_valid;
	reg alu_exe_unit_0_io_rrd_ftq_resps_1_REG;
	wire dec_ready = dec_valids_0 & ~(dec_valids_0 & ((((((dis_stalls_0 | _rob_io_rollback) | ((_decode_0_io_deq_uop_exception & dec_valids_0) & (((~_rob_io_empty | ~io_lsu_fencei_rdy) | _rename_stage_io_ren2_mask_0) | ~_ftq_arb_io_in_2_ready))) | _dec_brmask_logic_io_is_full_0) | (|b1_mispredict_mask)) | b2_mispredict) | io_ifu_redirect_flush_0));
	reg dec_brmask_logic_io_flush_pipeline_REG;
	wire _dec_brmask_logic_io_will_fire_0_T = _decode_0_io_deq_uop_br_type == 4'h1;
	wire _dec_brmask_logic_io_will_fire_0_T_1 = _decode_0_io_deq_uop_br_type == 4'h2;
	wire _dec_brmask_logic_io_will_fire_0_T_2 = _decode_0_io_deq_uop_br_type == 4'h3;
	wire _dec_brmask_logic_io_will_fire_0_T_3 = _decode_0_io_deq_uop_br_type == 4'h4;
	wire _dec_brmask_logic_io_will_fire_0_T_4 = _decode_0_io_deq_uop_br_type == 4'h5;
	wire _dec_brmask_logic_io_will_fire_0_T_5 = _decode_0_io_deq_uop_br_type == 4'h6;
	wire _dis_uops_0_prs1_busy_T_2 = _rename_stage_io_ren2_uops_0_lrs1_rtype == 2'h1;
	wire _dis_uops_0_prs1_busy_T = _rename_stage_io_ren2_uops_0_lrs1_rtype == 2'h0;
	wire [5:0] dis_uops_0_prs1 = (_dis_uops_0_prs1_busy_T_2 ? _fp_rename_stage_io_ren2_uops_0_prs1 : (_dis_uops_0_prs1_busy_T ? _rename_stage_io_ren2_uops_0_prs1 : _rename_stage_io_ren2_uops_0_lrs1));
	wire _dis_uops_0_prs2_busy_T_2 = _rename_stage_io_ren2_uops_0_lrs2_rtype == 2'h1;
	wire [5:0] dis_uops_0_prs2 = (_dis_uops_0_prs2_busy_T_2 ? _fp_rename_stage_io_ren2_uops_0_prs2 : _rename_stage_io_ren2_uops_0_prs2);
	wire _dis_uops_0_stale_pdst_T = _rename_stage_io_ren2_uops_0_dst_rtype == 2'h1;
	wire [5:0] dis_uops_0_pdst = (_dis_uops_0_stale_pdst_T ? _fp_rename_stage_io_ren2_uops_0_pdst : (_rename_stage_io_ren2_uops_0_dst_rtype == 2'h0 ? _rename_stage_io_ren2_uops_0_pdst : (|_rename_stage_io_ren2_uops_0_br_type & _rename_stage_io_ren2_uops_0_is_sfb ? _pred_rename_stage_io_ren2_uops_0_pdst : {_dis_uops_0_pdst_prng_io_out_5, _dis_uops_0_pdst_prng_io_out_4, _dis_uops_0_pdst_prng_io_out_3, _dis_uops_0_pdst_prng_io_out_2, _dis_uops_0_pdst_prng_io_out_1, _dis_uops_0_pdst_prng_io_out_0})));
	wire [5:0] dis_uops_0_stale_pdst = (_dis_uops_0_stale_pdst_T ? _fp_rename_stage_io_ren2_uops_0_stale_pdst : _rename_stage_io_ren2_uops_0_stale_pdst);
	wire dis_uops_0_prs1_busy = (_rename_stage_io_ren2_uops_0_prs1_busy & _dis_uops_0_prs1_busy_T) | (_fp_rename_stage_io_ren2_uops_0_prs1_busy & _dis_uops_0_prs1_busy_T_2);
	wire dis_uops_0_prs2_busy = (_rename_stage_io_ren2_uops_0_prs2_busy & (_rename_stage_io_ren2_uops_0_lrs2_rtype == 2'h0)) | (_fp_rename_stage_io_ren2_uops_0_prs2_busy & _dis_uops_0_prs2_busy_T_2);
	wire dis_uops_0_prs3_busy = _fp_rename_stage_io_ren2_uops_0_prs3_busy & _rename_stage_io_ren2_uops_0_frs3_en;
	wire dis_uops_0_ppred_busy = (_pred_rename_stage_io_ren2_uops_0_ppred_busy & (_rename_stage_io_ren2_uops_0_br_type == 4'h0)) & _rename_stage_io_ren2_uops_0_is_sfb;
	wire wait_for_empty_pipeline_0 = (_rename_stage_io_ren2_uops_0_is_unique | ~(_csr_io_customCSRs_0_value[0] & ~_csr_io_customCSRs_2_value[3])) & (~_rob_io_empty | ~io_lsu_fencei_rdy);
	assign dis_stalls_0 = _rename_stage_io_ren2_mask_0 & ((((((((((~_rob_io_ready | _rename_stage_io_ren_stalls_0) | _fp_rename_stage_io_ren_stalls_0) | _imm_rename_stage_io_ren_stalls_0) | (io_lsu_ldq_full_0 & _rename_stage_io_ren2_uops_0_uses_ldq)) | (io_lsu_stq_full_0 & _rename_stage_io_ren2_uops_0_uses_stq)) | ~_dispatcher_io_ren_uops_0_ready) | wait_for_empty_pipeline_0) | (|b1_mispredict_mask)) | b2_mispredict) | io_ifu_redirect_flush_0);
	wire dis_fire_0 = _rename_stage_io_ren2_mask_0 & ~dis_stalls_0;
	reg REG_2;
	reg [3:0] io_ifu_commit_bits_REG;
	reg [2:0] uop_br_tag;
	reg [3:0] uop_br_type;
	reg uop_is_sfb;
	reg [2:0] uop_imm_sel;
	reg [4:0] uop_pimm;
	reg [19:0] uop_imm_packed;
	reg [3:0] uop_ldq_idx;
	reg [3:0] uop_stq_idx;
	reg [1:0] uop_rxq_idx;
	reg immregfile_io_write_ports_0_valid_REG;
	reg bregfile_io_write_ports_0_valid_REG;
	reg rob_io_wb_resps_0_REG;
	reg rob_io_wb_resps_0_REG_1_valid;
	reg [4:0] rob_io_wb_resps_0_REG_1_bits_uop_rob_idx;
	reg [5:0] rob_io_wb_resps_0_REG_1_bits_uop_pdst;
	reg iregfile_io_write_ports_0_valid_REG;
	reg [5:0] iregfile_io_write_ports_0_bits_addr_REG;
	reg [63:0] iregfile_io_write_ports_0_bits_data_REG;
	reg int_bypasses_0_valid_REG;
	reg [5:0] int_bypasses_0_bits_REG_uop_pdst;
	reg [63:0] int_bypasses_0_bits_REG_data;
	wire _iregfile_io_write_ports_1_valid_T = _ll_arb_io_out_bits_uop_dst_rtype == 2'h0;
	wire int_wakeups_1_valid = _ll_arb_io_out_valid & _iregfile_io_write_ports_1_valid_T;
	reg rob_io_wb_resps_1_valid_REG;
	reg rob_io_wb_resps_1_valid_REG_1;
	reg [4:0] rob_io_wb_resps_1_bits_REG_uop_rob_idx;
	reg [5:0] rob_io_wb_resps_1_bits_REG_uop_pdst;
	reg rob_io_wb_resps_1_bits_REG_predicated;
	reg rob_io_wb_resps_1_bits_REG_fflags_valid;
	reg [4:0] rob_io_wb_resps_1_bits_REG_fflags_bits;
	wire _iregfile_io_write_ports_2_valid_T = _alu_exe_unit_0_io_alu_resp_bits_uop_dst_rtype == 2'h0;
	wire int_bypasses_1_valid = _alu_exe_unit_0_io_alu_resp_valid & _iregfile_io_write_ports_2_valid_T;
	reg rob_io_wb_resps_2_valid_REG;
	reg rob_io_wb_resps_2_valid_REG_1;
	reg [4:0] rob_io_wb_resps_2_bits_REG_uop_rob_idx;
	reg [5:0] rob_io_wb_resps_2_bits_REG_uop_pdst;
	reg rob_io_wb_resps_2_bits_REG_predicated;
	reg mem_iss_unit_io_flush_pipeline_REG;
	reg alu_iss_unit_io_flush_pipeline_REG;
	reg unq_iss_unit_io_flush_pipeline_REG;
	reg csr_io_retire_REG;
	reg csr_io_exception_REG;
	reg [5:0] csr_io_pc_REG;
	reg csr_io_pc_REG_1;
	reg [63:0] csr_io_cause_REG;
	reg [39:0] csr_io_tval_REG;
	reg io_lsu_exception_REG;
	reg fp_pipeline_io_flush_pipeline_REG;
	reg alu_exe_unit_0_io_kill_REG;
	reg mem_exe_unit_0_io_kill_REG;
	reg mem_exe_unit_1_io_kill_REG;
	reg unique_exe_unit_0_io_kill_REG;
	reg [4:0] small_0;
	reg [26:0] large_0;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg [2:0] _GEN_5;
		_GEN_5 = {_rob_io_flush_valid, b2_mispredict & (b2_cfi_type == 3'h3), b2_mispredict};
		brinfos_0_valid <= (_alu_exe_unit_0_io_brinfo_valid & ~_rob_io_flush_valid) & ~(|(b1_mispredict_mask & _alu_exe_unit_0_io_brinfo_bits_uop_br_mask) | brinfos_0_valid_REG);
		brinfos_0_bits_uop_is_rvc <= _alu_exe_unit_0_io_brinfo_bits_uop_is_rvc;
		brinfos_0_bits_uop_br_mask <= _alu_exe_unit_0_io_brinfo_bits_uop_br_mask & ~b1_resolve_mask;
		brinfos_0_bits_uop_br_tag <= _alu_exe_unit_0_io_brinfo_bits_uop_br_tag;
		brinfos_0_bits_uop_ftq_idx <= _alu_exe_unit_0_io_brinfo_bits_uop_ftq_idx;
		brinfos_0_bits_uop_edge_inst <= _alu_exe_unit_0_io_brinfo_bits_uop_edge_inst;
		brinfos_0_bits_uop_pc_lob <= _alu_exe_unit_0_io_brinfo_bits_uop_pc_lob;
		brinfos_0_bits_uop_rob_idx <= _alu_exe_unit_0_io_brinfo_bits_uop_rob_idx;
		brinfos_0_bits_uop_ldq_idx <= _alu_exe_unit_0_io_brinfo_bits_uop_ldq_idx;
		brinfos_0_bits_uop_stq_idx <= _alu_exe_unit_0_io_brinfo_bits_uop_stq_idx;
		brinfos_0_bits_mispredict <= _alu_exe_unit_0_io_brinfo_bits_mispredict;
		brinfos_0_bits_taken <= _alu_exe_unit_0_io_brinfo_bits_taken;
		brinfos_0_bits_cfi_type <= _alu_exe_unit_0_io_brinfo_bits_cfi_type;
		brinfos_0_bits_pc_sel <= _alu_exe_unit_0_io_brinfo_bits_pc_sel;
		brinfos_0_bits_jalr_target <= _alu_exe_unit_0_io_brinfo_bits_jalr_target;
		brinfos_0_bits_target_offset <= _alu_exe_unit_0_io_brinfo_bits_target_offset;
		b2_uop_is_rvc <= brinfos_0_bits_uop_is_rvc;
		b2_uop_br_mask <= brinfos_0_bits_uop_br_mask & ~b1_resolve_mask;
		b2_uop_br_tag <= brinfos_0_bits_uop_br_tag;
		b2_uop_ftq_idx <= brinfos_0_bits_uop_ftq_idx;
		b2_uop_edge_inst <= brinfos_0_bits_uop_edge_inst;
		b2_uop_pc_lob <= brinfos_0_bits_uop_pc_lob;
		b2_uop_rob_idx <= brinfos_0_bits_uop_rob_idx;
		b2_uop_ldq_idx <= brinfos_0_bits_uop_ldq_idx;
		b2_uop_stq_idx <= brinfos_0_bits_uop_stq_idx;
		b2_mispredict <= live_brinfos_0;
		b2_taken <= brinfos_0_bits_taken;
		b2_cfi_type <= brinfos_0_bits_cfi_type;
		b2_pc_sel <= brinfos_0_bits_pc_sel;
		b2_jalr_target <= brinfos_0_bits_jalr_target;
		b2_target_offset <= brinfos_0_bits_target_offset;
		brinfos_0_valid_REG <= _rob_io_flush_valid;
		live_brinfos_REG <= _rob_io_flush_valid;
		csr_io_counters_0_inc_REG <= (&_csr_io_counters_0_eventSel[1:0] | (_csr_io_counters_0_eventSel[1:0] == 2'h2) ? |(_csr_io_counters_0_eventSel[13:8] & {io_ptw_perf_l2miss, io_lsu_perf_tlbMiss, io_ifu_perf_tlbMiss, io_lsu_perf_release, io_lsu_perf_acquire, io_ifu_perf_acquire}) : (_csr_io_counters_0_eventSel[1:0] == 2'h1 ? |(_csr_io_counters_0_eventSel[11:9] & _GEN_5) : _csr_io_counters_0_eventSel[8] & _rob_io_com_xcpt_valid));
		csr_io_counters_1_inc_REG <= (&_csr_io_counters_1_eventSel[1:0] | (_csr_io_counters_1_eventSel[1:0] == 2'h2) ? |(_csr_io_counters_1_eventSel[13:8] & {io_ptw_perf_l2miss, io_lsu_perf_tlbMiss, io_ifu_perf_tlbMiss, io_lsu_perf_release, io_lsu_perf_acquire, io_ifu_perf_acquire}) : (_csr_io_counters_1_eventSel[1:0] == 2'h1 ? |(_csr_io_counters_1_eventSel[11:9] & _GEN_5) : _csr_io_counters_1_eventSel[8] & _rob_io_com_xcpt_valid));
		io_ifu_flush_icache_REG <= (dec_valids_0 & _dec_brmask_logic_io_will_fire_0_T_13) & _csr_io_status_debug;
		REG <= _rob_io_flush_valid;
		flush_typ <= _rob_io_flush_bits_flush_typ;
		io_ifu_redirect_pc_r <= _csr_io_evec;
		io_ifu_redirect_pc_r_1 <= io_ifu_redirect_pc_r;
		io_ifu_redirect_pc_r_2 <= io_ifu_redirect_pc_r_1;
		flush_pc_REG <= _rob_io_flush_bits_pc_lob;
		flush_pc_REG_1 <= _rob_io_flush_bits_edge_inst;
		flush_pc_next_REG <= _rob_io_flush_bits_is_rvc;
		io_ifu_redirect_ftq_idx_REG <= _rob_io_flush_bits_ftq_idx;
		REG_1 <= _rob_io_flush_valid;
		decode_0_io_interrupt_REG <= _csr_io_interrupt;
		decode_0_io_interrupt_cause_REG <= _csr_io_interrupt_cause;
		alu_exe_unit_0_io_rrd_ftq_resps_0_REG <= _alu_exe_unit_0_io_arb_ftq_reqs_0_valid;
		alu_exe_unit_0_io_rrd_ftq_resps_1_REG <= ~use_port_3 & use_port_2;
		dec_brmask_logic_io_flush_pipeline_REG <= _rob_io_flush_valid;
		REG_2 <= dis_fire_0 & _rename_stage_io_ren2_uops_0_is_sys_pc2epc;
		io_ifu_commit_bits_REG <= _rename_stage_io_ren2_uops_0_ftq_idx;
		uop_br_tag <= _rename_stage_io_ren2_uops_0_br_tag;
		uop_br_type <= _rename_stage_io_ren2_uops_0_br_type;
		uop_is_sfb <= _rename_stage_io_ren2_uops_0_is_sfb;
		uop_imm_sel <= _imm_rename_stage_io_ren2_uops_0_imm_sel;
		uop_pimm <= _imm_rename_stage_io_ren2_uops_0_pimm;
		uop_imm_packed <= _rename_stage_io_ren2_uops_0_imm_packed;
		uop_ldq_idx <= io_lsu_dis_ldq_idx_0;
		uop_stq_idx <= io_lsu_dis_stq_idx_0;
		uop_rxq_idx <= _rename_stage_io_ren2_uops_0_rxq_idx;
		immregfile_io_write_ports_0_valid_REG <= dis_fire_0;
		bregfile_io_write_ports_0_valid_REG <= dis_fire_0;
		rob_io_wb_resps_0_REG <= _rob_io_flush_valid;
		rob_io_wb_resps_0_REG_1_valid <= io_lsu_iresp_0_valid & ~(|(b1_mispredict_mask & io_lsu_iresp_0_bits_uop_br_mask) | rob_io_wb_resps_0_REG);
		rob_io_wb_resps_0_REG_1_bits_uop_rob_idx <= io_lsu_iresp_0_bits_uop_rob_idx;
		rob_io_wb_resps_0_REG_1_bits_uop_pdst <= io_lsu_iresp_0_bits_uop_pdst;
		iregfile_io_write_ports_0_valid_REG <= io_lsu_iresp_0_valid;
		iregfile_io_write_ports_0_bits_addr_REG <= io_lsu_iresp_0_bits_uop_pdst;
		iregfile_io_write_ports_0_bits_data_REG <= io_lsu_iresp_0_bits_data;
		int_bypasses_0_valid_REG <= io_lsu_iresp_0_valid;
		int_bypasses_0_bits_REG_uop_pdst <= io_lsu_iresp_0_bits_uop_pdst;
		int_bypasses_0_bits_REG_data <= io_lsu_iresp_0_bits_data;
		rob_io_wb_resps_1_valid_REG <= _rob_io_flush_valid;
		rob_io_wb_resps_1_valid_REG_1 <= _ll_arb_io_out_valid & ~(|(b1_mispredict_mask & _ll_arb_io_out_bits_uop_br_mask) | rob_io_wb_resps_1_valid_REG);
		rob_io_wb_resps_1_bits_REG_uop_rob_idx <= _ll_arb_io_out_bits_uop_rob_idx;
		rob_io_wb_resps_1_bits_REG_uop_pdst <= _ll_arb_io_out_bits_uop_pdst;
		rob_io_wb_resps_1_bits_REG_predicated <= _ll_arb_io_out_bits_predicated;
		rob_io_wb_resps_1_bits_REG_fflags_valid <= _ll_arb_io_out_bits_fflags_valid;
		rob_io_wb_resps_1_bits_REG_fflags_bits <= _ll_arb_io_out_bits_fflags_bits;
		rob_io_wb_resps_2_valid_REG <= _rob_io_flush_valid;
		rob_io_wb_resps_2_valid_REG_1 <= _alu_exe_unit_0_io_alu_resp_valid & ~(|(b1_mispredict_mask & _alu_exe_unit_0_io_alu_resp_bits_uop_br_mask) | rob_io_wb_resps_2_valid_REG);
		rob_io_wb_resps_2_bits_REG_uop_rob_idx <= _alu_exe_unit_0_io_alu_resp_bits_uop_rob_idx;
		rob_io_wb_resps_2_bits_REG_uop_pdst <= _alu_exe_unit_0_io_alu_resp_bits_uop_pdst;
		rob_io_wb_resps_2_bits_REG_predicated <= _alu_exe_unit_0_io_alu_resp_bits_predicated;
		mem_iss_unit_io_flush_pipeline_REG <= _rob_io_flush_valid;
		alu_iss_unit_io_flush_pipeline_REG <= _rob_io_flush_valid;
		unq_iss_unit_io_flush_pipeline_REG <= _rob_io_flush_valid;
		csr_io_retire_REG <= _rob_io_commit_arch_valids_0;
		csr_io_exception_REG <= _rob_io_com_xcpt_valid;
		csr_io_pc_REG <= _rob_io_com_xcpt_bits_pc_lob;
		csr_io_pc_REG_1 <= _rob_io_com_xcpt_bits_edge_inst;
		csr_io_cause_REG <= _rob_io_com_xcpt_bits_cause;
		csr_io_tval_REG <= {((_rob_io_com_xcpt_bits_badvaddr[63:39] == 25'h0000000) | &_rob_io_com_xcpt_bits_badvaddr[63:39] ? _rob_io_com_xcpt_bits_badvaddr[39] : ~_rob_io_com_xcpt_bits_badvaddr[38]), _rob_io_com_xcpt_bits_badvaddr[38:0]};
		io_lsu_exception_REG <= _rob_io_flush_valid;
		fp_pipeline_io_flush_pipeline_REG <= _rob_io_flush_valid;
		alu_exe_unit_0_io_kill_REG <= _rob_io_flush_valid;
		mem_exe_unit_0_io_kill_REG <= _rob_io_flush_valid;
		mem_exe_unit_1_io_kill_REG <= _rob_io_flush_valid;
		unique_exe_unit_0_io_kill_REG <= _rob_io_flush_valid;
		if (reset) begin
			debug_tsc_reg <= 64'h0000000000000000;
			debug_irt_reg <= 64'h0000000000000000;
			debug_brs_0 <= 64'h0000000000000000;
			debug_brs_1 <= 64'h0000000000000000;
			debug_brs_2 <= 64'h0000000000000000;
			debug_brs_3 <= 64'h0000000000000000;
			debug_brs_4 <= 64'h0000000000000000;
			debug_jals_0 <= 64'h0000000000000000;
			debug_jals_1 <= 64'h0000000000000000;
			debug_jals_2 <= 64'h0000000000000000;
			debug_jals_3 <= 64'h0000000000000000;
			debug_jals_4 <= 64'h0000000000000000;
			debug_jalrs_0 <= 64'h0000000000000000;
			debug_jalrs_1 <= 64'h0000000000000000;
			debug_jalrs_2 <= 64'h0000000000000000;
			debug_jalrs_3 <= 64'h0000000000000000;
			debug_jalrs_4 <= 64'h0000000000000000;
			dec_finished_mask <= 1'h0;
			small_0 <= 5'h00;
			large_0 <= 27'h0000000;
		end
		else begin : sv2v_autoblock_2
			reg _debug_jalrs_0_T;
			reg _debug_brs_4_T_2;
			reg _debug_brs_4_T_3;
			reg _debug_brs_4_T_4;
			reg _debug_brs_4_T_5;
			reg _debug_brs_4_T_6;
			reg _debug_brs_4_T_7;
			reg _debug_jals_4_T_2;
			reg _debug_jalrs_4_T_2;
			reg _debug_jalrs_1_T;
			reg _debug_jalrs_2_T;
			reg _debug_jalrs_3_T;
			reg _debug_jalrs_4_T;
			_debug_jalrs_0_T = _rob_io_commit_uops_0_debug_fsrc == 3'h0;
			_debug_brs_4_T_2 = _rob_io_commit_uops_0_br_type == 4'h1;
			_debug_brs_4_T_3 = _rob_io_commit_uops_0_br_type == 4'h2;
			_debug_brs_4_T_4 = _rob_io_commit_uops_0_br_type == 4'h3;
			_debug_brs_4_T_5 = _rob_io_commit_uops_0_br_type == 4'h4;
			_debug_brs_4_T_6 = _rob_io_commit_uops_0_br_type == 4'h5;
			_debug_brs_4_T_7 = _rob_io_commit_uops_0_br_type == 4'h6;
			_debug_jals_4_T_2 = _rob_io_commit_uops_0_br_type == 4'h7;
			_debug_jalrs_4_T_2 = _rob_io_commit_uops_0_br_type == 4'h8;
			_debug_jalrs_1_T = _rob_io_commit_uops_0_debug_fsrc == 3'h1;
			_debug_jalrs_2_T = _rob_io_commit_uops_0_debug_fsrc == 3'h2;
			_debug_jalrs_3_T = _rob_io_commit_uops_0_debug_fsrc == 3'h3;
			_debug_jalrs_4_T = _rob_io_commit_uops_0_debug_fsrc == 3'h4;
			debug_tsc_reg <= debug_tsc_reg + 64'h0000000000000001;
			debug_irt_reg <= debug_irt_reg + {63'h0000000000000000, _rob_io_commit_arch_valids_0};
			debug_brs_0 <= debug_brs_0 + {63'h0000000000000000, (_rob_io_commit_arch_valids_0 & _debug_jalrs_0_T) & (((((_debug_brs_4_T_2 | _debug_brs_4_T_3) | _debug_brs_4_T_4) | _debug_brs_4_T_5) | _debug_brs_4_T_6) | _debug_brs_4_T_7)};
			debug_brs_1 <= debug_brs_1 + {63'h0000000000000000, (_rob_io_commit_arch_valids_0 & _debug_jalrs_1_T) & (((((_debug_brs_4_T_2 | _debug_brs_4_T_3) | _debug_brs_4_T_4) | _debug_brs_4_T_5) | _debug_brs_4_T_6) | _debug_brs_4_T_7)};
			debug_brs_2 <= debug_brs_2 + {63'h0000000000000000, (_rob_io_commit_arch_valids_0 & _debug_jalrs_2_T) & (((((_debug_brs_4_T_2 | _debug_brs_4_T_3) | _debug_brs_4_T_4) | _debug_brs_4_T_5) | _debug_brs_4_T_6) | _debug_brs_4_T_7)};
			debug_brs_3 <= debug_brs_3 + {63'h0000000000000000, (_rob_io_commit_arch_valids_0 & _debug_jalrs_3_T) & (((((_debug_brs_4_T_2 | _debug_brs_4_T_3) | _debug_brs_4_T_4) | _debug_brs_4_T_5) | _debug_brs_4_T_6) | _debug_brs_4_T_7)};
			debug_brs_4 <= debug_brs_4 + {63'h0000000000000000, (_rob_io_commit_arch_valids_0 & _debug_jalrs_4_T) & (((((_debug_brs_4_T_2 | _debug_brs_4_T_3) | _debug_brs_4_T_4) | _debug_brs_4_T_5) | _debug_brs_4_T_6) | _debug_brs_4_T_7)};
			debug_jals_0 <= debug_jals_0 + {63'h0000000000000000, (_rob_io_commit_arch_valids_0 & _debug_jalrs_0_T) & _debug_jals_4_T_2};
			debug_jals_1 <= debug_jals_1 + {63'h0000000000000000, (_rob_io_commit_arch_valids_0 & _debug_jalrs_1_T) & _debug_jals_4_T_2};
			debug_jals_2 <= debug_jals_2 + {63'h0000000000000000, (_rob_io_commit_arch_valids_0 & _debug_jalrs_2_T) & _debug_jals_4_T_2};
			debug_jals_3 <= debug_jals_3 + {63'h0000000000000000, (_rob_io_commit_arch_valids_0 & _debug_jalrs_3_T) & _debug_jals_4_T_2};
			debug_jals_4 <= debug_jals_4 + {63'h0000000000000000, (_rob_io_commit_arch_valids_0 & _debug_jalrs_4_T) & _debug_jals_4_T_2};
			debug_jalrs_0 <= debug_jalrs_0 + {63'h0000000000000000, (_rob_io_commit_arch_valids_0 & _debug_jalrs_0_T) & _debug_jalrs_4_T_2};
			debug_jalrs_1 <= debug_jalrs_1 + {63'h0000000000000000, (_rob_io_commit_arch_valids_0 & _debug_jalrs_1_T) & _debug_jalrs_4_T_2};
			debug_jalrs_2 <= debug_jalrs_2 + {63'h0000000000000000, (_rob_io_commit_arch_valids_0 & _debug_jalrs_2_T) & _debug_jalrs_4_T_2};
			debug_jalrs_3 <= debug_jalrs_3 + {63'h0000000000000000, (_rob_io_commit_arch_valids_0 & _debug_jalrs_3_T) & _debug_jalrs_4_T_2};
			debug_jalrs_4 <= debug_jalrs_4 + {63'h0000000000000000, (_rob_io_commit_arch_valids_0 & _debug_jalrs_4_T) & _debug_jalrs_4_T_2};
			dec_finished_mask <= ~(dec_ready | io_ifu_redirect_flush_0) & (dec_ready | dec_finished_mask);
			if ((_rob_io_commit_valids_0 | _csr_io_csr_stall) | reset) begin
				small_0 <= 5'h00;
				large_0 <= 27'h0000000;
			end
			else begin : sv2v_autoblock_3
				reg [5:0] nextSmall;
				nextSmall = {1'h0, small_0} + 6'h01;
				small_0 <= nextSmall[4:0];
				if (nextSmall[5])
					large_0 <= large_0 + 27'h0000001;
			end
		end
	end
	MemExeUnit mem_exe_unit_0(
		.clock(clock),
		.reset(reset),
		.io_kill(mem_exe_unit_0_io_kill_REG),
		.io_brupdate_b1_resolve_mask(b1_resolve_mask),
		.io_brupdate_b1_mispredict_mask(b1_mispredict_mask),
		.io_iss_uop_valid(_mem_iss_unit_io_iss_uops_0_valid),
		.io_iss_uop_bits_fu_code_1(_mem_iss_unit_io_iss_uops_0_bits_fu_code_1),
		.io_iss_uop_bits_fu_code_2(_mem_iss_unit_io_iss_uops_0_bits_fu_code_2),
		.io_iss_uop_bits_iw_p1_bypass_hint(_mem_iss_unit_io_iss_uops_0_bits_iw_p1_bypass_hint),
		.io_iss_uop_bits_br_mask(_mem_iss_unit_io_iss_uops_0_bits_br_mask),
		.io_iss_uop_bits_imm_sel(_mem_iss_unit_io_iss_uops_0_bits_imm_sel),
		.io_iss_uop_bits_pimm(_mem_iss_unit_io_iss_uops_0_bits_pimm),
		.io_iss_uop_bits_stq_idx(_mem_iss_unit_io_iss_uops_0_bits_stq_idx),
		.io_iss_uop_bits_prs1(_mem_iss_unit_io_iss_uops_0_bits_prs1),
		.io_iss_uop_bits_lrs1_rtype(_mem_iss_unit_io_iss_uops_0_bits_lrs1_rtype),
		.io_arb_irf_reqs_0_ready(_iregfile_io_arb_read_reqs_2_ready),
		.io_arb_irf_reqs_0_valid(_mem_exe_unit_0_io_arb_irf_reqs_0_valid),
		.io_arb_irf_reqs_0_bits(_mem_exe_unit_0_io_arb_irf_reqs_0_bits),
		.io_arb_rebusys_0_valid(io_lsu_iwakeups_0_valid),
		.io_arb_rebusys_0_bits_uop_pdst(io_lsu_iwakeups_0_bits_uop_pdst),
		.io_arb_rebusys_0_bits_rebusy(io_lsu_iwakeups_0_bits_rebusy),
		.io_rrd_irf_resps_0(_iregfile_io_rrd_read_resps_2),
		.io_rrd_irf_bypasses_0_valid(int_bypasses_0_valid_REG),
		.io_rrd_irf_bypasses_0_bits_uop_pdst(int_bypasses_0_bits_REG_uop_pdst),
		.io_rrd_irf_bypasses_0_bits_data(int_bypasses_0_bits_REG_data),
		.io_rrd_irf_bypasses_1_valid(int_bypasses_1_valid),
		.io_rrd_irf_bypasses_1_bits_uop_pdst(_alu_exe_unit_0_io_alu_resp_bits_uop_pdst),
		.io_rrd_irf_bypasses_1_bits_data(_alu_exe_unit_0_io_alu_resp_bits_data),
		.io_rrd_immrf_wakeup_valid(_mem_exe_unit_0_io_rrd_immrf_wakeup_valid),
		.io_rrd_immrf_wakeup_bits_uop_pimm(_mem_exe_unit_0_io_rrd_immrf_wakeup_bits_uop_pimm),
		.io_squash_iss(_mem_exe_unit_0_io_squash_iss),
		.io_dgen_valid(io_lsu_dgen_0_valid),
		.io_dgen_bits_uop_stq_idx(io_lsu_dgen_0_bits_uop_stq_idx),
		.io_dgen_bits_data(io_lsu_dgen_0_bits_data)
	);
	MemExeUnit_1 mem_exe_unit_1(
		.clock(clock),
		.reset(reset),
		.io_kill(mem_exe_unit_1_io_kill_REG),
		.io_brupdate_b1_resolve_mask(b1_resolve_mask),
		.io_brupdate_b1_mispredict_mask(b1_mispredict_mask),
		.io_ready_fu_types_1(_mem_exe_unit_1_io_ready_fu_types_1),
		.io_iss_uop_valid(_mem_iss_unit_io_iss_uops_1_valid),
		.io_iss_uop_bits_fu_code_1(_mem_iss_unit_io_iss_uops_1_bits_fu_code_1),
		.io_iss_uop_bits_fu_code_2(_mem_iss_unit_io_iss_uops_1_bits_fu_code_2),
		.io_iss_uop_bits_iw_p1_bypass_hint(_mem_iss_unit_io_iss_uops_1_bits_iw_p1_bypass_hint),
		.io_iss_uop_bits_br_mask(_mem_iss_unit_io_iss_uops_1_bits_br_mask),
		.io_iss_uop_bits_imm_sel(_mem_iss_unit_io_iss_uops_1_bits_imm_sel),
		.io_iss_uop_bits_pimm(_mem_iss_unit_io_iss_uops_1_bits_pimm),
		.io_iss_uop_bits_ldq_idx(_mem_iss_unit_io_iss_uops_1_bits_ldq_idx),
		.io_iss_uop_bits_stq_idx(_mem_iss_unit_io_iss_uops_1_bits_stq_idx),
		.io_iss_uop_bits_pdst(_mem_iss_unit_io_iss_uops_1_bits_pdst),
		.io_iss_uop_bits_prs1(_mem_iss_unit_io_iss_uops_1_bits_prs1),
		.io_iss_uop_bits_uses_ldq(_mem_iss_unit_io_iss_uops_1_bits_uses_ldq),
		.io_iss_uop_bits_uses_stq(_mem_iss_unit_io_iss_uops_1_bits_uses_stq),
		.io_iss_uop_bits_dst_rtype(_mem_iss_unit_io_iss_uops_1_bits_dst_rtype),
		.io_iss_uop_bits_lrs1_rtype(_mem_iss_unit_io_iss_uops_1_bits_lrs1_rtype),
		.io_iss_uop_bits_fp_val(_mem_iss_unit_io_iss_uops_1_bits_fp_val),
		.io_arb_irf_reqs_0_ready(_iregfile_io_arb_read_reqs_3_ready),
		.io_arb_irf_reqs_0_valid(_mem_exe_unit_1_io_arb_irf_reqs_0_valid),
		.io_arb_irf_reqs_0_bits(_mem_exe_unit_1_io_arb_irf_reqs_0_bits),
		.io_arb_rebusys_0_valid(io_lsu_iwakeups_0_valid),
		.io_arb_rebusys_0_bits_uop_pdst(io_lsu_iwakeups_0_bits_uop_pdst),
		.io_arb_rebusys_0_bits_rebusy(io_lsu_iwakeups_0_bits_rebusy),
		.io_rrd_irf_resps_0(_iregfile_io_rrd_read_resps_3),
		.io_rrd_irf_bypasses_0_valid(int_bypasses_0_valid_REG),
		.io_rrd_irf_bypasses_0_bits_uop_pdst(int_bypasses_0_bits_REG_uop_pdst),
		.io_rrd_irf_bypasses_0_bits_data(int_bypasses_0_bits_REG_data),
		.io_rrd_irf_bypasses_1_valid(int_bypasses_1_valid),
		.io_rrd_irf_bypasses_1_bits_uop_pdst(_alu_exe_unit_0_io_alu_resp_bits_uop_pdst),
		.io_rrd_irf_bypasses_1_bits_data(_alu_exe_unit_0_io_alu_resp_bits_data),
		.io_arb_immrf_req_bits(_mem_exe_unit_1_io_arb_immrf_req_bits),
		.io_rrd_immrf_resp({44'h00000000000, _immregfile_io_rrd_read_resps_2}),
		.io_rrd_immrf_wakeup_valid(_mem_exe_unit_1_io_rrd_immrf_wakeup_valid),
		.io_rrd_immrf_wakeup_bits_uop_pimm(_mem_exe_unit_1_io_rrd_immrf_wakeup_bits_uop_pimm),
		.io_squash_iss(_mem_exe_unit_1_io_squash_iss),
		.io_agen_valid(io_lsu_agen_0_valid),
		.io_agen_bits_uop_br_mask(io_lsu_agen_0_bits_uop_br_mask),
		.io_agen_bits_uop_ldq_idx(io_lsu_agen_0_bits_uop_ldq_idx),
		.io_agen_bits_uop_stq_idx(io_lsu_agen_0_bits_uop_stq_idx),
		.io_agen_bits_uop_pdst(io_lsu_agen_0_bits_uop_pdst),
		.io_agen_bits_uop_uses_ldq(io_lsu_agen_0_bits_uop_uses_ldq),
		.io_agen_bits_uop_uses_stq(io_lsu_agen_0_bits_uop_uses_stq),
		.io_agen_bits_uop_dst_rtype(io_lsu_agen_0_bits_uop_dst_rtype),
		.io_agen_bits_uop_fp_val(io_lsu_agen_0_bits_uop_fp_val),
		.io_agen_bits_data(io_lsu_agen_0_bits_data),
		.io_dgen_valid(io_lsu_dgen_1_valid),
		.io_dgen_bits_uop_stq_idx(io_lsu_dgen_1_bits_uop_stq_idx),
		.io_dgen_bits_data(io_lsu_dgen_1_bits_data)
	);
	UniqueExeUnit unique_exe_unit_0(
		.clock(clock),
		.reset(reset),
		.io_kill(unique_exe_unit_0_io_kill_REG),
		.io_brupdate_b1_resolve_mask(b1_resolve_mask),
		.io_brupdate_b1_mispredict_mask(b1_mispredict_mask),
		.io_ready_fu_types_4(_unique_exe_unit_0_io_ready_fu_types_4),
		.io_ready_fu_types_8(_unique_exe_unit_0_io_ready_fu_types_8),
		.io_fcsr_rm(_csr_io_fcsr_rm),
		.io_iss_uop_valid(_unq_iss_unit_io_iss_uops_0_valid),
		.io_iss_uop_bits_inst(_unq_iss_unit_io_iss_uops_0_bits_inst),
		.io_iss_uop_bits_debug_inst(_unq_iss_unit_io_iss_uops_0_bits_debug_inst),
		.io_iss_uop_bits_is_rvc(_unq_iss_unit_io_iss_uops_0_bits_is_rvc),
		.io_iss_uop_bits_debug_pc(_unq_iss_unit_io_iss_uops_0_bits_debug_pc),
		.io_iss_uop_bits_iq_type_0(_unq_iss_unit_io_iss_uops_0_bits_iq_type_0),
		.io_iss_uop_bits_iq_type_1(_unq_iss_unit_io_iss_uops_0_bits_iq_type_1),
		.io_iss_uop_bits_iq_type_2(_unq_iss_unit_io_iss_uops_0_bits_iq_type_2),
		.io_iss_uop_bits_iq_type_3(_unq_iss_unit_io_iss_uops_0_bits_iq_type_3),
		.io_iss_uop_bits_fu_code_0(_unq_iss_unit_io_iss_uops_0_bits_fu_code_0),
		.io_iss_uop_bits_fu_code_1(_unq_iss_unit_io_iss_uops_0_bits_fu_code_1),
		.io_iss_uop_bits_fu_code_2(_unq_iss_unit_io_iss_uops_0_bits_fu_code_2),
		.io_iss_uop_bits_fu_code_3(_unq_iss_unit_io_iss_uops_0_bits_fu_code_3),
		.io_iss_uop_bits_fu_code_4(_unq_iss_unit_io_iss_uops_0_bits_fu_code_4),
		.io_iss_uop_bits_fu_code_5(_unq_iss_unit_io_iss_uops_0_bits_fu_code_5),
		.io_iss_uop_bits_fu_code_6(_unq_iss_unit_io_iss_uops_0_bits_fu_code_6),
		.io_iss_uop_bits_fu_code_7(_unq_iss_unit_io_iss_uops_0_bits_fu_code_7),
		.io_iss_uop_bits_fu_code_8(_unq_iss_unit_io_iss_uops_0_bits_fu_code_8),
		.io_iss_uop_bits_fu_code_9(_unq_iss_unit_io_iss_uops_0_bits_fu_code_9),
		.io_iss_uop_bits_iw_issued(_unq_iss_unit_io_iss_uops_0_bits_iw_issued),
		.io_iss_uop_bits_iw_p1_speculative_child(_unq_iss_unit_io_iss_uops_0_bits_iw_p1_speculative_child),
		.io_iss_uop_bits_iw_p2_speculative_child(_unq_iss_unit_io_iss_uops_0_bits_iw_p2_speculative_child),
		.io_iss_uop_bits_iw_p1_bypass_hint(_unq_iss_unit_io_iss_uops_0_bits_iw_p1_bypass_hint),
		.io_iss_uop_bits_iw_p2_bypass_hint(_unq_iss_unit_io_iss_uops_0_bits_iw_p2_bypass_hint),
		.io_iss_uop_bits_iw_p3_bypass_hint(_unq_iss_unit_io_iss_uops_0_bits_iw_p3_bypass_hint),
		.io_iss_uop_bits_dis_col_sel(_unq_iss_unit_io_iss_uops_0_bits_dis_col_sel),
		.io_iss_uop_bits_br_mask(_unq_iss_unit_io_iss_uops_0_bits_br_mask),
		.io_iss_uop_bits_br_tag(_unq_iss_unit_io_iss_uops_0_bits_br_tag),
		.io_iss_uop_bits_br_type(_unq_iss_unit_io_iss_uops_0_bits_br_type),
		.io_iss_uop_bits_is_sfb(_unq_iss_unit_io_iss_uops_0_bits_is_sfb),
		.io_iss_uop_bits_is_fence(_unq_iss_unit_io_iss_uops_0_bits_is_fence),
		.io_iss_uop_bits_is_fencei(_unq_iss_unit_io_iss_uops_0_bits_is_fencei),
		.io_iss_uop_bits_is_sfence(_unq_iss_unit_io_iss_uops_0_bits_is_sfence),
		.io_iss_uop_bits_is_amo(_unq_iss_unit_io_iss_uops_0_bits_is_amo),
		.io_iss_uop_bits_is_eret(_unq_iss_unit_io_iss_uops_0_bits_is_eret),
		.io_iss_uop_bits_is_sys_pc2epc(_unq_iss_unit_io_iss_uops_0_bits_is_sys_pc2epc),
		.io_iss_uop_bits_is_rocc(_unq_iss_unit_io_iss_uops_0_bits_is_rocc),
		.io_iss_uop_bits_is_mov(_unq_iss_unit_io_iss_uops_0_bits_is_mov),
		.io_iss_uop_bits_ftq_idx(_unq_iss_unit_io_iss_uops_0_bits_ftq_idx),
		.io_iss_uop_bits_edge_inst(_unq_iss_unit_io_iss_uops_0_bits_edge_inst),
		.io_iss_uop_bits_pc_lob(_unq_iss_unit_io_iss_uops_0_bits_pc_lob),
		.io_iss_uop_bits_taken(_unq_iss_unit_io_iss_uops_0_bits_taken),
		.io_iss_uop_bits_imm_rename(_unq_iss_unit_io_iss_uops_0_bits_imm_rename),
		.io_iss_uop_bits_imm_sel(_unq_iss_unit_io_iss_uops_0_bits_imm_sel),
		.io_iss_uop_bits_pimm(_unq_iss_unit_io_iss_uops_0_bits_pimm),
		.io_iss_uop_bits_imm_packed(_unq_iss_unit_io_iss_uops_0_bits_imm_packed),
		.io_iss_uop_bits_op1_sel(_unq_iss_unit_io_iss_uops_0_bits_op1_sel),
		.io_iss_uop_bits_op2_sel(_unq_iss_unit_io_iss_uops_0_bits_op2_sel),
		.io_iss_uop_bits_fp_ctrl_ldst(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_ldst),
		.io_iss_uop_bits_fp_ctrl_wen(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_wen),
		.io_iss_uop_bits_fp_ctrl_ren1(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_ren1),
		.io_iss_uop_bits_fp_ctrl_ren2(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_ren2),
		.io_iss_uop_bits_fp_ctrl_ren3(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_ren3),
		.io_iss_uop_bits_fp_ctrl_swap12(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_swap12),
		.io_iss_uop_bits_fp_ctrl_swap23(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_swap23),
		.io_iss_uop_bits_fp_ctrl_typeTagIn(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_typeTagIn),
		.io_iss_uop_bits_fp_ctrl_typeTagOut(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_typeTagOut),
		.io_iss_uop_bits_fp_ctrl_fromint(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_fromint),
		.io_iss_uop_bits_fp_ctrl_toint(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_toint),
		.io_iss_uop_bits_fp_ctrl_fastpipe(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_fastpipe),
		.io_iss_uop_bits_fp_ctrl_fma(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_fma),
		.io_iss_uop_bits_fp_ctrl_div(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_div),
		.io_iss_uop_bits_fp_ctrl_sqrt(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_sqrt),
		.io_iss_uop_bits_fp_ctrl_wflags(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_wflags),
		.io_iss_uop_bits_fp_ctrl_vec(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_vec),
		.io_iss_uop_bits_rob_idx(_unq_iss_unit_io_iss_uops_0_bits_rob_idx),
		.io_iss_uop_bits_ldq_idx(_unq_iss_unit_io_iss_uops_0_bits_ldq_idx),
		.io_iss_uop_bits_stq_idx(_unq_iss_unit_io_iss_uops_0_bits_stq_idx),
		.io_iss_uop_bits_rxq_idx(_unq_iss_unit_io_iss_uops_0_bits_rxq_idx),
		.io_iss_uop_bits_pdst(_unq_iss_unit_io_iss_uops_0_bits_pdst),
		.io_iss_uop_bits_prs1(_unq_iss_unit_io_iss_uops_0_bits_prs1),
		.io_iss_uop_bits_prs2(_unq_iss_unit_io_iss_uops_0_bits_prs2),
		.io_iss_uop_bits_prs3(_unq_iss_unit_io_iss_uops_0_bits_prs3),
		.io_iss_uop_bits_ppred(_unq_iss_unit_io_iss_uops_0_bits_ppred),
		.io_iss_uop_bits_prs1_busy(_unq_iss_unit_io_iss_uops_0_bits_prs1_busy),
		.io_iss_uop_bits_prs2_busy(_unq_iss_unit_io_iss_uops_0_bits_prs2_busy),
		.io_iss_uop_bits_prs3_busy(_unq_iss_unit_io_iss_uops_0_bits_prs3_busy),
		.io_iss_uop_bits_ppred_busy(_unq_iss_unit_io_iss_uops_0_bits_ppred_busy),
		.io_iss_uop_bits_stale_pdst(_unq_iss_unit_io_iss_uops_0_bits_stale_pdst),
		.io_iss_uop_bits_exception(_unq_iss_unit_io_iss_uops_0_bits_exception),
		.io_iss_uop_bits_exc_cause(_unq_iss_unit_io_iss_uops_0_bits_exc_cause),
		.io_iss_uop_bits_mem_cmd(_unq_iss_unit_io_iss_uops_0_bits_mem_cmd),
		.io_iss_uop_bits_mem_size(_unq_iss_unit_io_iss_uops_0_bits_mem_size),
		.io_iss_uop_bits_mem_signed(_unq_iss_unit_io_iss_uops_0_bits_mem_signed),
		.io_iss_uop_bits_uses_ldq(_unq_iss_unit_io_iss_uops_0_bits_uses_ldq),
		.io_iss_uop_bits_uses_stq(_unq_iss_unit_io_iss_uops_0_bits_uses_stq),
		.io_iss_uop_bits_is_unique(_unq_iss_unit_io_iss_uops_0_bits_is_unique),
		.io_iss_uop_bits_flush_on_commit(_unq_iss_unit_io_iss_uops_0_bits_flush_on_commit),
		.io_iss_uop_bits_csr_cmd(_unq_iss_unit_io_iss_uops_0_bits_csr_cmd),
		.io_iss_uop_bits_ldst_is_rs1(_unq_iss_unit_io_iss_uops_0_bits_ldst_is_rs1),
		.io_iss_uop_bits_ldst(_unq_iss_unit_io_iss_uops_0_bits_ldst),
		.io_iss_uop_bits_lrs1(_unq_iss_unit_io_iss_uops_0_bits_lrs1),
		.io_iss_uop_bits_lrs2(_unq_iss_unit_io_iss_uops_0_bits_lrs2),
		.io_iss_uop_bits_lrs3(_unq_iss_unit_io_iss_uops_0_bits_lrs3),
		.io_iss_uop_bits_dst_rtype(_unq_iss_unit_io_iss_uops_0_bits_dst_rtype),
		.io_iss_uop_bits_lrs1_rtype(_unq_iss_unit_io_iss_uops_0_bits_lrs1_rtype),
		.io_iss_uop_bits_lrs2_rtype(_unq_iss_unit_io_iss_uops_0_bits_lrs2_rtype),
		.io_iss_uop_bits_frs3_en(_unq_iss_unit_io_iss_uops_0_bits_frs3_en),
		.io_iss_uop_bits_fcn_dw(_unq_iss_unit_io_iss_uops_0_bits_fcn_dw),
		.io_iss_uop_bits_fcn_op(_unq_iss_unit_io_iss_uops_0_bits_fcn_op),
		.io_iss_uop_bits_fp_val(_unq_iss_unit_io_iss_uops_0_bits_fp_val),
		.io_iss_uop_bits_xcpt_pf_if(_unq_iss_unit_io_iss_uops_0_bits_xcpt_pf_if),
		.io_iss_uop_bits_xcpt_ae_if(_unq_iss_unit_io_iss_uops_0_bits_xcpt_ae_if),
		.io_iss_uop_bits_xcpt_ma_if(_unq_iss_unit_io_iss_uops_0_bits_xcpt_ma_if),
		.io_iss_uop_bits_bp_debug_if(_unq_iss_unit_io_iss_uops_0_bits_bp_debug_if),
		.io_iss_uop_bits_bp_xcpt_if(_unq_iss_unit_io_iss_uops_0_bits_bp_xcpt_if),
		.io_iss_uop_bits_debug_fsrc(_unq_iss_unit_io_iss_uops_0_bits_debug_fsrc),
		.io_iss_uop_bits_debug_tsrc(_unq_iss_unit_io_iss_uops_0_bits_debug_tsrc),
		.io_arb_irf_reqs_0_ready(_iregfile_io_arb_read_reqs_4_ready),
		.io_arb_irf_reqs_0_valid(_unique_exe_unit_0_io_arb_irf_reqs_0_valid),
		.io_arb_irf_reqs_0_bits(_unique_exe_unit_0_io_arb_irf_reqs_0_bits),
		.io_arb_irf_reqs_1_ready(_iregfile_io_arb_read_reqs_5_ready),
		.io_arb_irf_reqs_1_valid(_unique_exe_unit_0_io_arb_irf_reqs_1_valid),
		.io_arb_irf_reqs_1_bits(_unique_exe_unit_0_io_arb_irf_reqs_1_bits),
		.io_arb_rebusys_0_valid(io_lsu_iwakeups_0_valid),
		.io_arb_rebusys_0_bits_uop_pdst(io_lsu_iwakeups_0_bits_uop_pdst),
		.io_arb_rebusys_0_bits_rebusy(io_lsu_iwakeups_0_bits_rebusy),
		.io_rrd_irf_resps_0(_iregfile_io_rrd_read_resps_4),
		.io_rrd_irf_resps_1(_iregfile_io_rrd_read_resps_5),
		.io_rrd_irf_bypasses_0_valid(int_bypasses_0_valid_REG),
		.io_rrd_irf_bypasses_0_bits_uop_pdst(int_bypasses_0_bits_REG_uop_pdst),
		.io_rrd_irf_bypasses_0_bits_data(int_bypasses_0_bits_REG_data),
		.io_rrd_irf_bypasses_1_valid(int_bypasses_1_valid),
		.io_rrd_irf_bypasses_1_bits_uop_pdst(_alu_exe_unit_0_io_alu_resp_bits_uop_pdst),
		.io_rrd_irf_bypasses_1_bits_data(_alu_exe_unit_0_io_alu_resp_bits_data),
		.io_arb_immrf_req_bits(_unique_exe_unit_0_io_arb_immrf_req_bits),
		.io_rrd_immrf_resp({44'h00000000000, _immregfile_io_rrd_read_resps_3}),
		.io_rrd_immrf_wakeup_valid(_unique_exe_unit_0_io_rrd_immrf_wakeup_valid),
		.io_rrd_immrf_wakeup_bits_uop_pimm(_unique_exe_unit_0_io_rrd_immrf_wakeup_bits_uop_pimm),
		.io_squash_iss(_unique_exe_unit_0_io_squash_iss),
		.io_mul_resp_valid(_unique_exe_unit_0_io_mul_resp_valid),
		.io_mul_resp_bits_uop_br_mask(_unique_exe_unit_0_io_mul_resp_bits_uop_br_mask),
		.io_mul_resp_bits_uop_rob_idx(_unique_exe_unit_0_io_mul_resp_bits_uop_rob_idx),
		.io_mul_resp_bits_uop_pdst(_unique_exe_unit_0_io_mul_resp_bits_uop_pdst),
		.io_mul_resp_bits_uop_dst_rtype(_unique_exe_unit_0_io_mul_resp_bits_uop_dst_rtype),
		.io_mul_resp_bits_data(_unique_exe_unit_0_io_mul_resp_bits_data),
		.io_csr_resp_valid(_unique_exe_unit_0_io_csr_resp_valid),
		.io_csr_resp_bits_uop_br_mask(_unique_exe_unit_0_io_csr_resp_bits_uop_br_mask),
		.io_csr_resp_bits_uop_rob_idx(_unique_exe_unit_0_io_csr_resp_bits_uop_rob_idx),
		.io_csr_resp_bits_uop_pdst(_unique_exe_unit_0_io_csr_resp_bits_uop_pdst),
		.io_csr_resp_bits_uop_csr_cmd(_unique_exe_unit_0_io_csr_resp_bits_uop_csr_cmd),
		.io_csr_resp_bits_uop_dst_rtype(_unique_exe_unit_0_io_csr_resp_bits_uop_dst_rtype),
		.io_csr_resp_bits_data(_unique_exe_unit_0_io_csr_resp_bits_data),
		.io_csr_resp_bits_addr(_unique_exe_unit_0_io_csr_resp_bits_addr),
		.io_sfence_valid(_unique_exe_unit_0_io_sfence_valid),
		.io_sfence_bits_rs1(_unique_exe_unit_0_io_sfence_bits_rs1),
		.io_sfence_bits_rs2(_unique_exe_unit_0_io_sfence_bits_rs2),
		.io_sfence_bits_addr(_unique_exe_unit_0_io_sfence_bits_addr),
		.io_ifpu_resp_ready(_fp_pipeline_io_from_int_ready),
		.io_ifpu_resp_valid(_unique_exe_unit_0_io_ifpu_resp_valid),
		.io_ifpu_resp_bits_uop_rob_idx(_unique_exe_unit_0_io_ifpu_resp_bits_uop_rob_idx),
		.io_ifpu_resp_bits_uop_pdst(_unique_exe_unit_0_io_ifpu_resp_bits_uop_pdst),
		.io_ifpu_resp_bits_uop_dst_rtype(_unique_exe_unit_0_io_ifpu_resp_bits_uop_dst_rtype),
		.io_ifpu_resp_bits_data(_unique_exe_unit_0_io_ifpu_resp_bits_data),
		.io_ifpu_resp_bits_predicated(_unique_exe_unit_0_io_ifpu_resp_bits_predicated),
		.io_ifpu_resp_bits_fflags_valid(_unique_exe_unit_0_io_ifpu_resp_bits_fflags_valid),
		.io_ifpu_resp_bits_fflags_bits(_unique_exe_unit_0_io_ifpu_resp_bits_fflags_bits),
		.io_div_resp_ready(_ll_arb_io_in_2_ready),
		.io_div_resp_valid(_unique_exe_unit_0_io_div_resp_valid),
		.io_div_resp_bits_uop_br_mask(_unique_exe_unit_0_io_div_resp_bits_uop_br_mask),
		.io_div_resp_bits_uop_rob_idx(_unique_exe_unit_0_io_div_resp_bits_uop_rob_idx),
		.io_div_resp_bits_uop_pdst(_unique_exe_unit_0_io_div_resp_bits_uop_pdst),
		.io_div_resp_bits_uop_dst_rtype(_unique_exe_unit_0_io_div_resp_bits_uop_dst_rtype),
		.io_div_resp_bits_data(_unique_exe_unit_0_io_div_resp_bits_data)
	);
	ALUExeUnit alu_exe_unit_0(
		.clock(clock),
		.reset(reset),
		.io_kill(alu_exe_unit_0_io_kill_REG),
		.io_brupdate_b1_resolve_mask(b1_resolve_mask),
		.io_brupdate_b1_mispredict_mask(b1_mispredict_mask),
		.io_iss_uop_valid(_alu_iss_unit_io_iss_uops_0_valid),
		.io_iss_uop_bits_is_rvc(_alu_iss_unit_io_iss_uops_0_bits_is_rvc),
		.io_iss_uop_bits_fu_code_0(_alu_iss_unit_io_iss_uops_0_bits_fu_code_0),
		.io_iss_uop_bits_iw_p1_bypass_hint(_alu_iss_unit_io_iss_uops_0_bits_iw_p1_bypass_hint),
		.io_iss_uop_bits_iw_p2_bypass_hint(_alu_iss_unit_io_iss_uops_0_bits_iw_p2_bypass_hint),
		.io_iss_uop_bits_br_mask(_alu_iss_unit_io_iss_uops_0_bits_br_mask),
		.io_iss_uop_bits_br_tag(_alu_iss_unit_io_iss_uops_0_bits_br_tag),
		.io_iss_uop_bits_br_type(_alu_iss_unit_io_iss_uops_0_bits_br_type),
		.io_iss_uop_bits_is_sfb(_alu_iss_unit_io_iss_uops_0_bits_is_sfb),
		.io_iss_uop_bits_is_mov(_alu_iss_unit_io_iss_uops_0_bits_is_mov),
		.io_iss_uop_bits_ftq_idx(_alu_iss_unit_io_iss_uops_0_bits_ftq_idx),
		.io_iss_uop_bits_edge_inst(_alu_iss_unit_io_iss_uops_0_bits_edge_inst),
		.io_iss_uop_bits_pc_lob(_alu_iss_unit_io_iss_uops_0_bits_pc_lob),
		.io_iss_uop_bits_taken(_alu_iss_unit_io_iss_uops_0_bits_taken),
		.io_iss_uop_bits_imm_sel(_alu_iss_unit_io_iss_uops_0_bits_imm_sel),
		.io_iss_uop_bits_pimm(_alu_iss_unit_io_iss_uops_0_bits_pimm),
		.io_iss_uop_bits_op1_sel(_alu_iss_unit_io_iss_uops_0_bits_op1_sel),
		.io_iss_uop_bits_op2_sel(_alu_iss_unit_io_iss_uops_0_bits_op2_sel),
		.io_iss_uop_bits_rob_idx(_alu_iss_unit_io_iss_uops_0_bits_rob_idx),
		.io_iss_uop_bits_pdst(_alu_iss_unit_io_iss_uops_0_bits_pdst),
		.io_iss_uop_bits_prs1(_alu_iss_unit_io_iss_uops_0_bits_prs1),
		.io_iss_uop_bits_prs2(_alu_iss_unit_io_iss_uops_0_bits_prs2),
		.io_iss_uop_bits_ppred(_alu_iss_unit_io_iss_uops_0_bits_ppred),
		.io_iss_uop_bits_csr_cmd(_alu_iss_unit_io_iss_uops_0_bits_csr_cmd),
		.io_iss_uop_bits_ldst_is_rs1(_alu_iss_unit_io_iss_uops_0_bits_ldst_is_rs1),
		.io_iss_uop_bits_dst_rtype(_alu_iss_unit_io_iss_uops_0_bits_dst_rtype),
		.io_iss_uop_bits_lrs1_rtype(_alu_iss_unit_io_iss_uops_0_bits_lrs1_rtype),
		.io_iss_uop_bits_lrs2_rtype(_alu_iss_unit_io_iss_uops_0_bits_lrs2_rtype),
		.io_iss_uop_bits_fcn_dw(_alu_iss_unit_io_iss_uops_0_bits_fcn_dw),
		.io_iss_uop_bits_fcn_op(_alu_iss_unit_io_iss_uops_0_bits_fcn_op),
		.io_arb_irf_reqs_0_valid(_alu_exe_unit_0_io_arb_irf_reqs_0_valid),
		.io_arb_irf_reqs_0_bits(_alu_exe_unit_0_io_arb_irf_reqs_0_bits),
		.io_arb_irf_reqs_1_valid(_alu_exe_unit_0_io_arb_irf_reqs_1_valid),
		.io_arb_irf_reqs_1_bits(_alu_exe_unit_0_io_arb_irf_reqs_1_bits),
		.io_arb_rebusys_0_valid(io_lsu_iwakeups_0_valid),
		.io_arb_rebusys_0_bits_uop_pdst(io_lsu_iwakeups_0_bits_uop_pdst),
		.io_arb_rebusys_0_bits_rebusy(io_lsu_iwakeups_0_bits_rebusy),
		.io_rrd_irf_resps_0(_iregfile_io_rrd_read_resps_0),
		.io_rrd_irf_resps_1(_iregfile_io_rrd_read_resps_1),
		.io_rrd_irf_bypasses_0_valid(int_bypasses_0_valid_REG),
		.io_rrd_irf_bypasses_0_bits_uop_pdst(int_bypasses_0_bits_REG_uop_pdst),
		.io_rrd_irf_bypasses_0_bits_data(int_bypasses_0_bits_REG_data),
		.io_rrd_irf_bypasses_1_valid(int_bypasses_1_valid),
		.io_rrd_irf_bypasses_1_bits_uop_pdst(_alu_exe_unit_0_io_alu_resp_bits_uop_pdst),
		.io_rrd_irf_bypasses_1_bits_data(_alu_exe_unit_0_io_alu_resp_bits_data),
		.io_arb_prf_req_bits(_alu_exe_unit_0_io_arb_prf_req_bits),
		.io_rrd_prf_resp(_pregfile_io_rrd_read_resps_0),
		.io_arb_immrf_req_bits(_alu_exe_unit_0_io_arb_immrf_req_bits),
		.io_rrd_immrf_resp({44'h00000000000, _immregfile_io_rrd_read_resps_0}),
		.io_rrd_immrf_wakeup_valid(_alu_exe_unit_0_io_rrd_immrf_wakeup_valid),
		.io_rrd_immrf_wakeup_bits_uop_pimm(_alu_exe_unit_0_io_rrd_immrf_wakeup_bits_uop_pimm),
		.io_arb_brf_req_bits(_alu_exe_unit_0_io_arb_brf_req_bits),
		.io_rrd_brf_resp_ldq_idx(_bregfile_io_rrd_read_resps_0_ldq_idx),
		.io_rrd_brf_resp_stq_idx(_bregfile_io_rrd_read_resps_0_stq_idx),
		.io_arb_ftq_reqs_0_ready(_alu_exe_unit_0_io_arb_ftq_reqs_0_valid),
		.io_arb_ftq_reqs_0_valid(_alu_exe_unit_0_io_arb_ftq_reqs_0_valid),
		.io_arb_ftq_reqs_0_bits(_alu_exe_unit_0_io_arb_ftq_reqs_0_bits),
		.io_arb_ftq_reqs_1_ready(use_port_3 | use_port_2),
		.io_arb_ftq_reqs_1_valid(_alu_exe_unit_0_io_arb_ftq_reqs_1_valid),
		.io_arb_ftq_reqs_1_bits(_alu_exe_unit_0_io_arb_ftq_reqs_1_bits),
		.io_rrd_ftq_resps_0_entry_cfi_idx_valid((alu_exe_unit_0_io_rrd_ftq_resps_0_REG ? io_ifu_rrd_ftq_resps_1_entry_cfi_idx_valid : io_ifu_rrd_ftq_resps_2_entry_cfi_idx_valid)),
		.io_rrd_ftq_resps_0_entry_cfi_idx_bits((alu_exe_unit_0_io_rrd_ftq_resps_0_REG ? io_ifu_rrd_ftq_resps_1_entry_cfi_idx_bits : io_ifu_rrd_ftq_resps_2_entry_cfi_idx_bits)),
		.io_rrd_ftq_resps_0_entry_start_bank((alu_exe_unit_0_io_rrd_ftq_resps_0_REG ? io_ifu_rrd_ftq_resps_1_entry_start_bank : io_ifu_rrd_ftq_resps_2_entry_start_bank)),
		.io_rrd_ftq_resps_0_pc((alu_exe_unit_0_io_rrd_ftq_resps_0_REG ? io_ifu_rrd_ftq_resps_1_pc : io_ifu_rrd_ftq_resps_2_pc)),
		.io_rrd_ftq_resps_1_valid((alu_exe_unit_0_io_rrd_ftq_resps_1_REG ? io_ifu_rrd_ftq_resps_1_valid : io_ifu_rrd_ftq_resps_2_valid)),
		.io_rrd_ftq_resps_1_pc((alu_exe_unit_0_io_rrd_ftq_resps_1_REG ? io_ifu_rrd_ftq_resps_1_pc : io_ifu_rrd_ftq_resps_2_pc)),
		.io_fast_wakeup_valid(_alu_exe_unit_0_io_fast_wakeup_valid),
		.io_fast_wakeup_bits_uop_pdst(_alu_exe_unit_0_io_fast_wakeup_bits_uop_pdst),
		.io_fast_wakeup_bits_uop_dst_rtype(_alu_exe_unit_0_io_fast_wakeup_bits_uop_dst_rtype),
		.io_fast_pred_wakeup_valid(_alu_exe_unit_0_io_fast_pred_wakeup_valid),
		.io_fast_pred_wakeup_bits_uop_pdst(_alu_exe_unit_0_io_fast_pred_wakeup_bits_uop_pdst),
		.io_squash_iss(_alu_exe_unit_0_io_squash_iss),
		.io_child_rebusy(_alu_exe_unit_0_io_child_rebusy),
		.io_alu_resp_valid(_alu_exe_unit_0_io_alu_resp_valid),
		.io_alu_resp_bits_uop_br_mask(_alu_exe_unit_0_io_alu_resp_bits_uop_br_mask),
		.io_alu_resp_bits_uop_br_type(_alu_exe_unit_0_io_alu_resp_bits_uop_br_type),
		.io_alu_resp_bits_uop_is_sfb(_alu_exe_unit_0_io_alu_resp_bits_uop_is_sfb),
		.io_alu_resp_bits_uop_rob_idx(_alu_exe_unit_0_io_alu_resp_bits_uop_rob_idx),
		.io_alu_resp_bits_uop_pdst(_alu_exe_unit_0_io_alu_resp_bits_uop_pdst),
		.io_alu_resp_bits_uop_dst_rtype(_alu_exe_unit_0_io_alu_resp_bits_uop_dst_rtype),
		.io_alu_resp_bits_data(_alu_exe_unit_0_io_alu_resp_bits_data),
		.io_alu_resp_bits_predicated(_alu_exe_unit_0_io_alu_resp_bits_predicated),
		.io_brinfo_valid(_alu_exe_unit_0_io_brinfo_valid),
		.io_brinfo_bits_uop_is_rvc(_alu_exe_unit_0_io_brinfo_bits_uop_is_rvc),
		.io_brinfo_bits_uop_br_mask(_alu_exe_unit_0_io_brinfo_bits_uop_br_mask),
		.io_brinfo_bits_uop_br_tag(_alu_exe_unit_0_io_brinfo_bits_uop_br_tag),
		.io_brinfo_bits_uop_ftq_idx(_alu_exe_unit_0_io_brinfo_bits_uop_ftq_idx),
		.io_brinfo_bits_uop_edge_inst(_alu_exe_unit_0_io_brinfo_bits_uop_edge_inst),
		.io_brinfo_bits_uop_pc_lob(_alu_exe_unit_0_io_brinfo_bits_uop_pc_lob),
		.io_brinfo_bits_uop_rob_idx(_alu_exe_unit_0_io_brinfo_bits_uop_rob_idx),
		.io_brinfo_bits_uop_ldq_idx(_alu_exe_unit_0_io_brinfo_bits_uop_ldq_idx),
		.io_brinfo_bits_uop_stq_idx(_alu_exe_unit_0_io_brinfo_bits_uop_stq_idx),
		.io_brinfo_bits_mispredict(_alu_exe_unit_0_io_brinfo_bits_mispredict),
		.io_brinfo_bits_taken(_alu_exe_unit_0_io_brinfo_bits_taken),
		.io_brinfo_bits_cfi_type(_alu_exe_unit_0_io_brinfo_bits_cfi_type),
		.io_brinfo_bits_pc_sel(_alu_exe_unit_0_io_brinfo_bits_pc_sel),
		.io_brinfo_bits_jalr_target(_alu_exe_unit_0_io_brinfo_bits_jalr_target),
		.io_brinfo_bits_target_offset(_alu_exe_unit_0_io_brinfo_bits_target_offset)
	);
	FpPipeline fp_pipeline(
		.clock(clock),
		.reset(reset),
		.io_brupdate_b1_resolve_mask(b1_resolve_mask),
		.io_brupdate_b1_mispredict_mask(b1_mispredict_mask),
		.io_flush_pipeline(fp_pipeline_io_flush_pipeline_REG),
		.io_dis_uops_0_ready(_fp_pipeline_io_dis_uops_0_ready),
		.io_dis_uops_0_valid(_dispatcher_io_dis_uops_3_0_valid),
		.io_dis_uops_0_bits_inst(_dispatcher_io_dis_uops_3_0_bits_inst),
		.io_dis_uops_0_bits_debug_inst(_dispatcher_io_dis_uops_3_0_bits_debug_inst),
		.io_dis_uops_0_bits_is_rvc(_dispatcher_io_dis_uops_3_0_bits_is_rvc),
		.io_dis_uops_0_bits_debug_pc(_dispatcher_io_dis_uops_3_0_bits_debug_pc),
		.io_dis_uops_0_bits_iq_type_0(_dispatcher_io_dis_uops_3_0_bits_iq_type_0),
		.io_dis_uops_0_bits_iq_type_1(_dispatcher_io_dis_uops_3_0_bits_iq_type_1),
		.io_dis_uops_0_bits_iq_type_2(_dispatcher_io_dis_uops_3_0_bits_iq_type_2),
		.io_dis_uops_0_bits_iq_type_3(_dispatcher_io_dis_uops_3_0_bits_iq_type_3),
		.io_dis_uops_0_bits_fu_code_0(_dispatcher_io_dis_uops_3_0_bits_fu_code_0),
		.io_dis_uops_0_bits_fu_code_1(_dispatcher_io_dis_uops_3_0_bits_fu_code_1),
		.io_dis_uops_0_bits_fu_code_2(_dispatcher_io_dis_uops_3_0_bits_fu_code_2),
		.io_dis_uops_0_bits_fu_code_3(_dispatcher_io_dis_uops_3_0_bits_fu_code_3),
		.io_dis_uops_0_bits_fu_code_4(_dispatcher_io_dis_uops_3_0_bits_fu_code_4),
		.io_dis_uops_0_bits_fu_code_5(_dispatcher_io_dis_uops_3_0_bits_fu_code_5),
		.io_dis_uops_0_bits_fu_code_6(_dispatcher_io_dis_uops_3_0_bits_fu_code_6),
		.io_dis_uops_0_bits_fu_code_7(_dispatcher_io_dis_uops_3_0_bits_fu_code_7),
		.io_dis_uops_0_bits_fu_code_8(_dispatcher_io_dis_uops_3_0_bits_fu_code_8),
		.io_dis_uops_0_bits_fu_code_9(_dispatcher_io_dis_uops_3_0_bits_fu_code_9),
		.io_dis_uops_0_bits_iw_p1_speculative_child(_dispatcher_io_dis_uops_3_0_bits_iw_p1_speculative_child),
		.io_dis_uops_0_bits_iw_p2_speculative_child(_dispatcher_io_dis_uops_3_0_bits_iw_p2_speculative_child),
		.io_dis_uops_0_bits_br_mask(_dispatcher_io_dis_uops_3_0_bits_br_mask),
		.io_dis_uops_0_bits_br_tag(_dispatcher_io_dis_uops_3_0_bits_br_tag),
		.io_dis_uops_0_bits_br_type(_dispatcher_io_dis_uops_3_0_bits_br_type),
		.io_dis_uops_0_bits_is_sfb(_dispatcher_io_dis_uops_3_0_bits_is_sfb),
		.io_dis_uops_0_bits_is_fence(_dispatcher_io_dis_uops_3_0_bits_is_fence),
		.io_dis_uops_0_bits_is_fencei(_dispatcher_io_dis_uops_3_0_bits_is_fencei),
		.io_dis_uops_0_bits_is_sfence(_dispatcher_io_dis_uops_3_0_bits_is_sfence),
		.io_dis_uops_0_bits_is_amo(_dispatcher_io_dis_uops_3_0_bits_is_amo),
		.io_dis_uops_0_bits_is_eret(_dispatcher_io_dis_uops_3_0_bits_is_eret),
		.io_dis_uops_0_bits_is_sys_pc2epc(_dispatcher_io_dis_uops_3_0_bits_is_sys_pc2epc),
		.io_dis_uops_0_bits_is_rocc(_dispatcher_io_dis_uops_3_0_bits_is_rocc),
		.io_dis_uops_0_bits_is_mov(_dispatcher_io_dis_uops_3_0_bits_is_mov),
		.io_dis_uops_0_bits_ftq_idx(_dispatcher_io_dis_uops_3_0_bits_ftq_idx),
		.io_dis_uops_0_bits_edge_inst(_dispatcher_io_dis_uops_3_0_bits_edge_inst),
		.io_dis_uops_0_bits_pc_lob(_dispatcher_io_dis_uops_3_0_bits_pc_lob),
		.io_dis_uops_0_bits_taken(_dispatcher_io_dis_uops_3_0_bits_taken),
		.io_dis_uops_0_bits_imm_rename(_dispatcher_io_dis_uops_3_0_bits_imm_rename),
		.io_dis_uops_0_bits_imm_sel(_dispatcher_io_dis_uops_3_0_bits_imm_sel),
		.io_dis_uops_0_bits_pimm(_dispatcher_io_dis_uops_3_0_bits_pimm),
		.io_dis_uops_0_bits_imm_packed(_dispatcher_io_dis_uops_3_0_bits_imm_packed),
		.io_dis_uops_0_bits_op1_sel(_dispatcher_io_dis_uops_3_0_bits_op1_sel),
		.io_dis_uops_0_bits_op2_sel(_dispatcher_io_dis_uops_3_0_bits_op2_sel),
		.io_dis_uops_0_bits_fp_ctrl_ldst(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_ldst),
		.io_dis_uops_0_bits_fp_ctrl_wen(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_wen),
		.io_dis_uops_0_bits_fp_ctrl_ren1(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_ren1),
		.io_dis_uops_0_bits_fp_ctrl_ren2(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_ren2),
		.io_dis_uops_0_bits_fp_ctrl_ren3(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_ren3),
		.io_dis_uops_0_bits_fp_ctrl_swap12(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_swap12),
		.io_dis_uops_0_bits_fp_ctrl_swap23(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_swap23),
		.io_dis_uops_0_bits_fp_ctrl_typeTagIn(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_typeTagIn),
		.io_dis_uops_0_bits_fp_ctrl_typeTagOut(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_typeTagOut),
		.io_dis_uops_0_bits_fp_ctrl_fromint(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_fromint),
		.io_dis_uops_0_bits_fp_ctrl_toint(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_toint),
		.io_dis_uops_0_bits_fp_ctrl_fastpipe(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_fastpipe),
		.io_dis_uops_0_bits_fp_ctrl_fma(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_fma),
		.io_dis_uops_0_bits_fp_ctrl_div(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_div),
		.io_dis_uops_0_bits_fp_ctrl_sqrt(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_sqrt),
		.io_dis_uops_0_bits_fp_ctrl_wflags(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_wflags),
		.io_dis_uops_0_bits_fp_ctrl_vec(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_vec),
		.io_dis_uops_0_bits_rob_idx(_dispatcher_io_dis_uops_3_0_bits_rob_idx),
		.io_dis_uops_0_bits_ldq_idx(_dispatcher_io_dis_uops_3_0_bits_ldq_idx),
		.io_dis_uops_0_bits_stq_idx(_dispatcher_io_dis_uops_3_0_bits_stq_idx),
		.io_dis_uops_0_bits_rxq_idx(_dispatcher_io_dis_uops_3_0_bits_rxq_idx),
		.io_dis_uops_0_bits_pdst(_dispatcher_io_dis_uops_3_0_bits_pdst),
		.io_dis_uops_0_bits_prs1(_dispatcher_io_dis_uops_3_0_bits_prs1),
		.io_dis_uops_0_bits_prs2(_dispatcher_io_dis_uops_3_0_bits_prs2),
		.io_dis_uops_0_bits_prs3(_dispatcher_io_dis_uops_3_0_bits_prs3),
		.io_dis_uops_0_bits_ppred(_dispatcher_io_dis_uops_3_0_bits_ppred),
		.io_dis_uops_0_bits_prs1_busy(_dispatcher_io_dis_uops_3_0_bits_prs1_busy),
		.io_dis_uops_0_bits_prs2_busy(_dispatcher_io_dis_uops_3_0_bits_prs2_busy),
		.io_dis_uops_0_bits_prs3_busy(_dispatcher_io_dis_uops_3_0_bits_prs3_busy),
		.io_dis_uops_0_bits_ppred_busy(_dispatcher_io_dis_uops_3_0_bits_ppred_busy),
		.io_dis_uops_0_bits_stale_pdst(_dispatcher_io_dis_uops_3_0_bits_stale_pdst),
		.io_dis_uops_0_bits_exception(_dispatcher_io_dis_uops_3_0_bits_exception),
		.io_dis_uops_0_bits_exc_cause(_dispatcher_io_dis_uops_3_0_bits_exc_cause),
		.io_dis_uops_0_bits_mem_cmd(_dispatcher_io_dis_uops_3_0_bits_mem_cmd),
		.io_dis_uops_0_bits_mem_size(_dispatcher_io_dis_uops_3_0_bits_mem_size),
		.io_dis_uops_0_bits_mem_signed(_dispatcher_io_dis_uops_3_0_bits_mem_signed),
		.io_dis_uops_0_bits_uses_ldq(_dispatcher_io_dis_uops_3_0_bits_uses_ldq),
		.io_dis_uops_0_bits_uses_stq(_dispatcher_io_dis_uops_3_0_bits_uses_stq),
		.io_dis_uops_0_bits_is_unique(_dispatcher_io_dis_uops_3_0_bits_is_unique),
		.io_dis_uops_0_bits_flush_on_commit(_dispatcher_io_dis_uops_3_0_bits_flush_on_commit),
		.io_dis_uops_0_bits_csr_cmd(_dispatcher_io_dis_uops_3_0_bits_csr_cmd),
		.io_dis_uops_0_bits_ldst_is_rs1(_dispatcher_io_dis_uops_3_0_bits_ldst_is_rs1),
		.io_dis_uops_0_bits_ldst(_dispatcher_io_dis_uops_3_0_bits_ldst),
		.io_dis_uops_0_bits_lrs1(_dispatcher_io_dis_uops_3_0_bits_lrs1),
		.io_dis_uops_0_bits_lrs2(_dispatcher_io_dis_uops_3_0_bits_lrs2),
		.io_dis_uops_0_bits_lrs3(_dispatcher_io_dis_uops_3_0_bits_lrs3),
		.io_dis_uops_0_bits_dst_rtype(_dispatcher_io_dis_uops_3_0_bits_dst_rtype),
		.io_dis_uops_0_bits_lrs1_rtype(_dispatcher_io_dis_uops_3_0_bits_lrs1_rtype),
		.io_dis_uops_0_bits_lrs2_rtype(_dispatcher_io_dis_uops_3_0_bits_lrs2_rtype),
		.io_dis_uops_0_bits_frs3_en(_dispatcher_io_dis_uops_3_0_bits_frs3_en),
		.io_dis_uops_0_bits_fcn_dw(_dispatcher_io_dis_uops_3_0_bits_fcn_dw),
		.io_dis_uops_0_bits_fcn_op(_dispatcher_io_dis_uops_3_0_bits_fcn_op),
		.io_dis_uops_0_bits_fp_val(_dispatcher_io_dis_uops_3_0_bits_fp_val),
		.io_dis_uops_0_bits_fp_rm(_dispatcher_io_dis_uops_3_0_bits_fp_rm),
		.io_dis_uops_0_bits_fp_typ(_dispatcher_io_dis_uops_3_0_bits_fp_typ),
		.io_dis_uops_0_bits_xcpt_pf_if(_dispatcher_io_dis_uops_3_0_bits_xcpt_pf_if),
		.io_dis_uops_0_bits_xcpt_ae_if(_dispatcher_io_dis_uops_3_0_bits_xcpt_ae_if),
		.io_dis_uops_0_bits_xcpt_ma_if(_dispatcher_io_dis_uops_3_0_bits_xcpt_ma_if),
		.io_dis_uops_0_bits_bp_debug_if(_dispatcher_io_dis_uops_3_0_bits_bp_debug_if),
		.io_dis_uops_0_bits_bp_xcpt_if(_dispatcher_io_dis_uops_3_0_bits_bp_xcpt_if),
		.io_dis_uops_0_bits_debug_fsrc(_dispatcher_io_dis_uops_3_0_bits_debug_fsrc),
		.io_dis_uops_0_bits_debug_tsrc(_dispatcher_io_dis_uops_3_0_bits_debug_tsrc),
		.io_ll_wports_0_valid(io_lsu_fresp_0_valid),
		.io_ll_wports_0_bits_uop_br_mask(io_lsu_fresp_0_bits_uop_br_mask),
		.io_ll_wports_0_bits_uop_rob_idx(io_lsu_fresp_0_bits_uop_rob_idx),
		.io_ll_wports_0_bits_uop_pdst(io_lsu_fresp_0_bits_uop_pdst),
		.io_ll_wports_0_bits_uop_mem_size(io_lsu_fresp_0_bits_uop_mem_size),
		.io_ll_wports_0_bits_uop_dst_rtype(io_lsu_fresp_0_bits_uop_dst_rtype),
		.io_ll_wports_0_bits_data({1'h0, io_lsu_fresp_0_bits_data}),
		.io_from_int_ready(_fp_pipeline_io_from_int_ready),
		.io_from_int_valid(_unique_exe_unit_0_io_ifpu_resp_valid),
		.io_from_int_bits_uop_rob_idx(_unique_exe_unit_0_io_ifpu_resp_bits_uop_rob_idx),
		.io_from_int_bits_uop_pdst(_unique_exe_unit_0_io_ifpu_resp_bits_uop_pdst),
		.io_from_int_bits_uop_dst_rtype(_unique_exe_unit_0_io_ifpu_resp_bits_uop_dst_rtype),
		.io_from_int_bits_data(_unique_exe_unit_0_io_ifpu_resp_bits_data),
		.io_from_int_bits_predicated(_unique_exe_unit_0_io_ifpu_resp_bits_predicated),
		.io_from_int_bits_fflags_valid(_unique_exe_unit_0_io_ifpu_resp_bits_fflags_valid),
		.io_from_int_bits_fflags_bits(_unique_exe_unit_0_io_ifpu_resp_bits_fflags_bits),
		.io_dgen_valid(io_lsu_dgen_2_valid),
		.io_dgen_bits_uop_stq_idx(io_lsu_dgen_2_bits_uop_stq_idx),
		.io_dgen_bits_data(io_lsu_dgen_2_bits_data),
		.io_to_int_ready(_ll_arb_io_in_1_ready),
		.io_to_int_valid(_fp_pipeline_io_to_int_valid),
		.io_to_int_bits_uop_br_mask(_fp_pipeline_io_to_int_bits_uop_br_mask),
		.io_to_int_bits_uop_rob_idx(_fp_pipeline_io_to_int_bits_uop_rob_idx),
		.io_to_int_bits_uop_pdst(_fp_pipeline_io_to_int_bits_uop_pdst),
		.io_to_int_bits_uop_dst_rtype(_fp_pipeline_io_to_int_bits_uop_dst_rtype),
		.io_to_int_bits_data(_fp_pipeline_io_to_int_bits_data),
		.io_to_int_bits_predicated(_fp_pipeline_io_to_int_bits_predicated),
		.io_to_int_bits_fflags_valid(_fp_pipeline_io_to_int_bits_fflags_valid),
		.io_to_int_bits_fflags_bits(_fp_pipeline_io_to_int_bits_fflags_bits),
		.io_wakeups_0_valid(_fp_pipeline_io_wakeups_0_valid),
		.io_wakeups_0_bits_uop_pdst(_fp_pipeline_io_wakeups_0_bits_uop_pdst),
		.io_wakeups_0_bits_uop_dst_rtype(_fp_pipeline_io_wakeups_0_bits_uop_dst_rtype),
		.io_wakeups_1_valid(_fp_pipeline_io_wakeups_1_valid),
		.io_wakeups_1_bits_uop_pdst(_fp_pipeline_io_wakeups_1_bits_uop_pdst),
		.io_wakeups_1_bits_uop_dst_rtype(_fp_pipeline_io_wakeups_1_bits_uop_dst_rtype),
		.io_wb_0_valid(_fp_pipeline_io_wb_0_valid),
		.io_wb_0_bits_uop_rob_idx(_fp_pipeline_io_wb_0_bits_uop_rob_idx),
		.io_wb_0_bits_uop_pdst(_fp_pipeline_io_wb_0_bits_uop_pdst),
		.io_wb_0_bits_fflags_valid(_fp_pipeline_io_wb_0_bits_fflags_valid),
		.io_wb_0_bits_fflags_bits(_fp_pipeline_io_wb_0_bits_fflags_bits),
		.io_wb_1_valid(_fp_pipeline_io_wb_1_valid),
		.io_wb_1_bits_uop_rob_idx(_fp_pipeline_io_wb_1_bits_uop_rob_idx),
		.io_wb_1_bits_uop_pdst(_fp_pipeline_io_wb_1_bits_uop_pdst),
		.io_wb_1_bits_predicated(_fp_pipeline_io_wb_1_bits_predicated),
		.io_wb_1_bits_fflags_valid(_fp_pipeline_io_wb_1_bits_fflags_valid),
		.io_wb_1_bits_fflags_bits(_fp_pipeline_io_wb_1_bits_fflags_bits)
	);
	DecodeUnit decode_0(
		.io_enq_uop_inst(io_ifu_fetchpacket_bits_uops_0_bits_inst),
		.io_enq_uop_debug_inst(io_ifu_fetchpacket_bits_uops_0_bits_debug_inst),
		.io_enq_uop_is_rvc(io_ifu_fetchpacket_bits_uops_0_bits_is_rvc),
		.io_enq_uop_debug_pc(io_ifu_fetchpacket_bits_uops_0_bits_debug_pc),
		.io_enq_uop_is_sfb(io_ifu_fetchpacket_bits_uops_0_bits_is_sfb),
		.io_enq_uop_ftq_idx(io_ifu_fetchpacket_bits_uops_0_bits_ftq_idx),
		.io_enq_uop_edge_inst(io_ifu_fetchpacket_bits_uops_0_bits_edge_inst),
		.io_enq_uop_pc_lob(io_ifu_fetchpacket_bits_uops_0_bits_pc_lob),
		.io_enq_uop_taken(io_ifu_fetchpacket_bits_uops_0_bits_taken),
		.io_enq_uop_xcpt_pf_if(io_ifu_fetchpacket_bits_uops_0_bits_xcpt_pf_if),
		.io_enq_uop_xcpt_ae_if(io_ifu_fetchpacket_bits_uops_0_bits_xcpt_ae_if),
		.io_enq_uop_bp_debug_if(io_ifu_fetchpacket_bits_uops_0_bits_bp_debug_if),
		.io_enq_uop_bp_xcpt_if(io_ifu_fetchpacket_bits_uops_0_bits_bp_xcpt_if),
		.io_enq_uop_debug_fsrc(io_ifu_fetchpacket_bits_uops_0_bits_debug_fsrc),
		.io_deq_uop_inst(_decode_0_io_deq_uop_inst),
		.io_deq_uop_debug_inst(_decode_0_io_deq_uop_debug_inst),
		.io_deq_uop_is_rvc(_decode_0_io_deq_uop_is_rvc),
		.io_deq_uop_debug_pc(_decode_0_io_deq_uop_debug_pc),
		.io_deq_uop_iq_type_0(_decode_0_io_deq_uop_iq_type_0),
		.io_deq_uop_iq_type_1(_decode_0_io_deq_uop_iq_type_1),
		.io_deq_uop_iq_type_2(_decode_0_io_deq_uop_iq_type_2),
		.io_deq_uop_iq_type_3(_decode_0_io_deq_uop_iq_type_3),
		.io_deq_uop_fu_code_0(_decode_0_io_deq_uop_fu_code_0),
		.io_deq_uop_fu_code_1(_decode_0_io_deq_uop_fu_code_1),
		.io_deq_uop_fu_code_2(_decode_0_io_deq_uop_fu_code_2),
		.io_deq_uop_fu_code_3(_decode_0_io_deq_uop_fu_code_3),
		.io_deq_uop_fu_code_4(_decode_0_io_deq_uop_fu_code_4),
		.io_deq_uop_fu_code_5(_decode_0_io_deq_uop_fu_code_5),
		.io_deq_uop_fu_code_6(_decode_0_io_deq_uop_fu_code_6),
		.io_deq_uop_fu_code_7(_decode_0_io_deq_uop_fu_code_7),
		.io_deq_uop_fu_code_8(_decode_0_io_deq_uop_fu_code_8),
		.io_deq_uop_fu_code_9(_decode_0_io_deq_uop_fu_code_9),
		.io_deq_uop_br_type(_decode_0_io_deq_uop_br_type),
		.io_deq_uop_is_sfb(_decode_0_io_deq_uop_is_sfb),
		.io_deq_uop_is_fence(_decode_0_io_deq_uop_is_fence),
		.io_deq_uop_is_fencei(_decode_0_io_deq_uop_is_fencei),
		.io_deq_uop_is_sfence(_decode_0_io_deq_uop_is_sfence),
		.io_deq_uop_is_amo(_decode_0_io_deq_uop_is_amo),
		.io_deq_uop_is_eret(_decode_0_io_deq_uop_is_eret),
		.io_deq_uop_is_sys_pc2epc(_decode_0_io_deq_uop_is_sys_pc2epc),
		.io_deq_uop_is_rocc(_decode_0_io_deq_uop_is_rocc),
		.io_deq_uop_is_mov(_decode_0_io_deq_uop_is_mov),
		.io_deq_uop_ftq_idx(_decode_0_io_deq_uop_ftq_idx),
		.io_deq_uop_edge_inst(_decode_0_io_deq_uop_edge_inst),
		.io_deq_uop_pc_lob(_decode_0_io_deq_uop_pc_lob),
		.io_deq_uop_taken(_decode_0_io_deq_uop_taken),
		.io_deq_uop_imm_rename(_decode_0_io_deq_uop_imm_rename),
		.io_deq_uop_imm_sel(_decode_0_io_deq_uop_imm_sel),
		.io_deq_uop_pimm(_decode_0_io_deq_uop_pimm),
		.io_deq_uop_imm_packed(_decode_0_io_deq_uop_imm_packed),
		.io_deq_uop_op1_sel(_decode_0_io_deq_uop_op1_sel),
		.io_deq_uop_op2_sel(_decode_0_io_deq_uop_op2_sel),
		.io_deq_uop_fp_ctrl_ldst(_decode_0_io_deq_uop_fp_ctrl_ldst),
		.io_deq_uop_fp_ctrl_wen(_decode_0_io_deq_uop_fp_ctrl_wen),
		.io_deq_uop_fp_ctrl_ren1(_decode_0_io_deq_uop_fp_ctrl_ren1),
		.io_deq_uop_fp_ctrl_ren2(_decode_0_io_deq_uop_fp_ctrl_ren2),
		.io_deq_uop_fp_ctrl_ren3(_decode_0_io_deq_uop_fp_ctrl_ren3),
		.io_deq_uop_fp_ctrl_swap12(_decode_0_io_deq_uop_fp_ctrl_swap12),
		.io_deq_uop_fp_ctrl_swap23(_decode_0_io_deq_uop_fp_ctrl_swap23),
		.io_deq_uop_fp_ctrl_typeTagIn(_decode_0_io_deq_uop_fp_ctrl_typeTagIn),
		.io_deq_uop_fp_ctrl_typeTagOut(_decode_0_io_deq_uop_fp_ctrl_typeTagOut),
		.io_deq_uop_fp_ctrl_fromint(_decode_0_io_deq_uop_fp_ctrl_fromint),
		.io_deq_uop_fp_ctrl_toint(_decode_0_io_deq_uop_fp_ctrl_toint),
		.io_deq_uop_fp_ctrl_fastpipe(_decode_0_io_deq_uop_fp_ctrl_fastpipe),
		.io_deq_uop_fp_ctrl_fma(_decode_0_io_deq_uop_fp_ctrl_fma),
		.io_deq_uop_fp_ctrl_div(_decode_0_io_deq_uop_fp_ctrl_div),
		.io_deq_uop_fp_ctrl_sqrt(_decode_0_io_deq_uop_fp_ctrl_sqrt),
		.io_deq_uop_fp_ctrl_wflags(_decode_0_io_deq_uop_fp_ctrl_wflags),
		.io_deq_uop_exception(_decode_0_io_deq_uop_exception),
		.io_deq_uop_exc_cause(_decode_0_io_deq_uop_exc_cause),
		.io_deq_uop_mem_cmd(_decode_0_io_deq_uop_mem_cmd),
		.io_deq_uop_mem_size(_decode_0_io_deq_uop_mem_size),
		.io_deq_uop_mem_signed(_decode_0_io_deq_uop_mem_signed),
		.io_deq_uop_uses_ldq(_decode_0_io_deq_uop_uses_ldq),
		.io_deq_uop_uses_stq(_decode_0_io_deq_uop_uses_stq),
		.io_deq_uop_is_unique(_decode_0_io_deq_uop_is_unique),
		.io_deq_uop_flush_on_commit(_decode_0_io_deq_uop_flush_on_commit),
		.io_deq_uop_csr_cmd(_decode_0_io_deq_uop_csr_cmd),
		.io_deq_uop_ldst_is_rs1(_decode_0_io_deq_uop_ldst_is_rs1),
		.io_deq_uop_ldst(_decode_0_io_deq_uop_ldst),
		.io_deq_uop_lrs1(_decode_0_io_deq_uop_lrs1),
		.io_deq_uop_lrs2(_decode_0_io_deq_uop_lrs2),
		.io_deq_uop_lrs3(_decode_0_io_deq_uop_lrs3),
		.io_deq_uop_dst_rtype(_decode_0_io_deq_uop_dst_rtype),
		.io_deq_uop_lrs1_rtype(_decode_0_io_deq_uop_lrs1_rtype),
		.io_deq_uop_lrs2_rtype(_decode_0_io_deq_uop_lrs2_rtype),
		.io_deq_uop_frs3_en(_decode_0_io_deq_uop_frs3_en),
		.io_deq_uop_fcn_dw(_decode_0_io_deq_uop_fcn_dw),
		.io_deq_uop_fcn_op(_decode_0_io_deq_uop_fcn_op),
		.io_deq_uop_fp_val(_decode_0_io_deq_uop_fp_val),
		.io_deq_uop_fp_rm(_decode_0_io_deq_uop_fp_rm),
		.io_deq_uop_fp_typ(_decode_0_io_deq_uop_fp_typ),
		.io_deq_uop_xcpt_pf_if(_decode_0_io_deq_uop_xcpt_pf_if),
		.io_deq_uop_xcpt_ae_if(_decode_0_io_deq_uop_xcpt_ae_if),
		.io_deq_uop_bp_debug_if(_decode_0_io_deq_uop_bp_debug_if),
		.io_deq_uop_bp_xcpt_if(_decode_0_io_deq_uop_bp_xcpt_if),
		.io_deq_uop_debug_fsrc(_decode_0_io_deq_uop_debug_fsrc),
		.io_csr_decode_inst(_decode_0_io_csr_decode_inst),
		.io_csr_decode_fp_illegal(_csr_io_decode_0_fp_illegal),
		.io_csr_decode_read_illegal(_csr_io_decode_0_read_illegal),
		.io_csr_decode_write_illegal(_csr_io_decode_0_write_illegal),
		.io_csr_decode_write_flush(_csr_io_decode_0_write_flush),
		.io_csr_decode_system_illegal(_csr_io_decode_0_system_illegal),
		.io_fcsr_rm(_csr_io_fcsr_rm),
		.io_interrupt(decode_0_io_interrupt_REG),
		.io_interrupt_cause(decode_0_io_interrupt_cause_REG)
	);
	BranchMaskGenerationLogic dec_brmask_logic(
		.clock(clock),
		.reset(reset),
		.io_is_branch_0(~dec_finished_mask & (((((((_dec_brmask_logic_io_will_fire_0_T | _dec_brmask_logic_io_will_fire_0_T_1) | _dec_brmask_logic_io_will_fire_0_T_2) | _dec_brmask_logic_io_will_fire_0_T_3) | _dec_brmask_logic_io_will_fire_0_T_4) | _dec_brmask_logic_io_will_fire_0_T_5) & ~_decode_0_io_deq_uop_is_sfb) | _dec_brmask_logic_io_will_fire_0_T_13)),
		.io_will_fire_0(dec_ready & (((((((_dec_brmask_logic_io_will_fire_0_T | _dec_brmask_logic_io_will_fire_0_T_1) | _dec_brmask_logic_io_will_fire_0_T_2) | _dec_brmask_logic_io_will_fire_0_T_3) | _dec_brmask_logic_io_will_fire_0_T_4) | _dec_brmask_logic_io_will_fire_0_T_5) & ~_decode_0_io_deq_uop_is_sfb) | _dec_brmask_logic_io_will_fire_0_T_13)),
		.io_br_tag_0(_dec_brmask_logic_io_br_tag_0),
		.io_br_mask_0(_dec_brmask_logic_io_br_mask_0),
		.io_is_full_0(_dec_brmask_logic_io_is_full_0),
		.io_brupdate_b1_resolve_mask(b1_resolve_mask),
		.io_brupdate_b2_uop_br_mask(b2_uop_br_mask),
		.io_brupdate_b2_mispredict(b2_mispredict),
		.io_flush_pipeline(dec_brmask_logic_io_flush_pipeline_REG)
	);
	RenameStage rename_stage(
		.clock(clock),
		.reset(reset),
		.io_ren_stalls_0(_rename_stage_io_ren_stalls_0),
		.io_kill(io_ifu_redirect_flush_0),
		.io_dec_fire_0(dec_ready),
		.io_dec_uops_0_inst(_decode_0_io_deq_uop_inst),
		.io_dec_uops_0_debug_inst(_decode_0_io_deq_uop_debug_inst),
		.io_dec_uops_0_is_rvc(_decode_0_io_deq_uop_is_rvc),
		.io_dec_uops_0_debug_pc(_decode_0_io_deq_uop_debug_pc),
		.io_dec_uops_0_iq_type_0(_decode_0_io_deq_uop_iq_type_0),
		.io_dec_uops_0_iq_type_1(_decode_0_io_deq_uop_iq_type_1),
		.io_dec_uops_0_iq_type_2(_decode_0_io_deq_uop_iq_type_2),
		.io_dec_uops_0_iq_type_3(_decode_0_io_deq_uop_iq_type_3),
		.io_dec_uops_0_fu_code_0(_decode_0_io_deq_uop_fu_code_0),
		.io_dec_uops_0_fu_code_1(_decode_0_io_deq_uop_fu_code_1),
		.io_dec_uops_0_fu_code_2(_decode_0_io_deq_uop_fu_code_2),
		.io_dec_uops_0_fu_code_3(_decode_0_io_deq_uop_fu_code_3),
		.io_dec_uops_0_fu_code_4(_decode_0_io_deq_uop_fu_code_4),
		.io_dec_uops_0_fu_code_5(_decode_0_io_deq_uop_fu_code_5),
		.io_dec_uops_0_fu_code_6(_decode_0_io_deq_uop_fu_code_6),
		.io_dec_uops_0_fu_code_7(_decode_0_io_deq_uop_fu_code_7),
		.io_dec_uops_0_fu_code_8(_decode_0_io_deq_uop_fu_code_8),
		.io_dec_uops_0_fu_code_9(_decode_0_io_deq_uop_fu_code_9),
		.io_dec_uops_0_br_mask(_dec_brmask_logic_io_br_mask_0),
		.io_dec_uops_0_br_tag(_dec_brmask_logic_io_br_tag_0),
		.io_dec_uops_0_br_type(_decode_0_io_deq_uop_br_type),
		.io_dec_uops_0_is_sfb(_decode_0_io_deq_uop_is_sfb),
		.io_dec_uops_0_is_fence(_decode_0_io_deq_uop_is_fence),
		.io_dec_uops_0_is_fencei(_decode_0_io_deq_uop_is_fencei),
		.io_dec_uops_0_is_sfence(_decode_0_io_deq_uop_is_sfence),
		.io_dec_uops_0_is_amo(_decode_0_io_deq_uop_is_amo),
		.io_dec_uops_0_is_eret(_decode_0_io_deq_uop_is_eret),
		.io_dec_uops_0_is_sys_pc2epc(_decode_0_io_deq_uop_is_sys_pc2epc),
		.io_dec_uops_0_is_rocc(_decode_0_io_deq_uop_is_rocc),
		.io_dec_uops_0_is_mov(_decode_0_io_deq_uop_is_mov),
		.io_dec_uops_0_ftq_idx(_decode_0_io_deq_uop_ftq_idx),
		.io_dec_uops_0_edge_inst(_decode_0_io_deq_uop_edge_inst),
		.io_dec_uops_0_pc_lob(_decode_0_io_deq_uop_pc_lob),
		.io_dec_uops_0_taken(_decode_0_io_deq_uop_taken),
		.io_dec_uops_0_imm_rename(_decode_0_io_deq_uop_imm_rename),
		.io_dec_uops_0_imm_packed(_decode_0_io_deq_uop_imm_packed),
		.io_dec_uops_0_op1_sel(_decode_0_io_deq_uop_op1_sel),
		.io_dec_uops_0_op2_sel(_decode_0_io_deq_uop_op2_sel),
		.io_dec_uops_0_fp_ctrl_ldst(_decode_0_io_deq_uop_fp_ctrl_ldst),
		.io_dec_uops_0_fp_ctrl_wen(_decode_0_io_deq_uop_fp_ctrl_wen),
		.io_dec_uops_0_fp_ctrl_ren1(_decode_0_io_deq_uop_fp_ctrl_ren1),
		.io_dec_uops_0_fp_ctrl_ren2(_decode_0_io_deq_uop_fp_ctrl_ren2),
		.io_dec_uops_0_fp_ctrl_ren3(_decode_0_io_deq_uop_fp_ctrl_ren3),
		.io_dec_uops_0_fp_ctrl_swap12(_decode_0_io_deq_uop_fp_ctrl_swap12),
		.io_dec_uops_0_fp_ctrl_swap23(_decode_0_io_deq_uop_fp_ctrl_swap23),
		.io_dec_uops_0_fp_ctrl_typeTagIn(_decode_0_io_deq_uop_fp_ctrl_typeTagIn),
		.io_dec_uops_0_fp_ctrl_typeTagOut(_decode_0_io_deq_uop_fp_ctrl_typeTagOut),
		.io_dec_uops_0_fp_ctrl_fromint(_decode_0_io_deq_uop_fp_ctrl_fromint),
		.io_dec_uops_0_fp_ctrl_toint(_decode_0_io_deq_uop_fp_ctrl_toint),
		.io_dec_uops_0_fp_ctrl_fastpipe(_decode_0_io_deq_uop_fp_ctrl_fastpipe),
		.io_dec_uops_0_fp_ctrl_fma(_decode_0_io_deq_uop_fp_ctrl_fma),
		.io_dec_uops_0_fp_ctrl_div(_decode_0_io_deq_uop_fp_ctrl_div),
		.io_dec_uops_0_fp_ctrl_sqrt(_decode_0_io_deq_uop_fp_ctrl_sqrt),
		.io_dec_uops_0_fp_ctrl_wflags(_decode_0_io_deq_uop_fp_ctrl_wflags),
		.io_dec_uops_0_exception(_decode_0_io_deq_uop_exception),
		.io_dec_uops_0_exc_cause(_decode_0_io_deq_uop_exc_cause),
		.io_dec_uops_0_mem_cmd(_decode_0_io_deq_uop_mem_cmd),
		.io_dec_uops_0_mem_size(_decode_0_io_deq_uop_mem_size),
		.io_dec_uops_0_mem_signed(_decode_0_io_deq_uop_mem_signed),
		.io_dec_uops_0_uses_ldq(_decode_0_io_deq_uop_uses_ldq),
		.io_dec_uops_0_uses_stq(_decode_0_io_deq_uop_uses_stq),
		.io_dec_uops_0_is_unique(_decode_0_io_deq_uop_is_unique),
		.io_dec_uops_0_flush_on_commit(_decode_0_io_deq_uop_flush_on_commit),
		.io_dec_uops_0_csr_cmd(_decode_0_io_deq_uop_csr_cmd),
		.io_dec_uops_0_ldst_is_rs1(_decode_0_io_deq_uop_ldst_is_rs1),
		.io_dec_uops_0_ldst(_decode_0_io_deq_uop_ldst),
		.io_dec_uops_0_lrs1(_decode_0_io_deq_uop_lrs1),
		.io_dec_uops_0_lrs2(_decode_0_io_deq_uop_lrs2),
		.io_dec_uops_0_lrs3(_decode_0_io_deq_uop_lrs3),
		.io_dec_uops_0_dst_rtype(_decode_0_io_deq_uop_dst_rtype),
		.io_dec_uops_0_lrs1_rtype(_decode_0_io_deq_uop_lrs1_rtype),
		.io_dec_uops_0_lrs2_rtype(_decode_0_io_deq_uop_lrs2_rtype),
		.io_dec_uops_0_frs3_en(_decode_0_io_deq_uop_frs3_en),
		.io_dec_uops_0_fcn_dw(_decode_0_io_deq_uop_fcn_dw),
		.io_dec_uops_0_fcn_op(_decode_0_io_deq_uop_fcn_op),
		.io_dec_uops_0_fp_val(_decode_0_io_deq_uop_fp_val),
		.io_dec_uops_0_fp_rm(_decode_0_io_deq_uop_fp_rm),
		.io_dec_uops_0_fp_typ(_decode_0_io_deq_uop_fp_typ),
		.io_dec_uops_0_xcpt_pf_if(_decode_0_io_deq_uop_xcpt_pf_if),
		.io_dec_uops_0_xcpt_ae_if(_decode_0_io_deq_uop_xcpt_ae_if),
		.io_dec_uops_0_bp_debug_if(_decode_0_io_deq_uop_bp_debug_if),
		.io_dec_uops_0_bp_xcpt_if(_decode_0_io_deq_uop_bp_xcpt_if),
		.io_dec_uops_0_debug_fsrc(_decode_0_io_deq_uop_debug_fsrc),
		.io_ren2_mask_0(_rename_stage_io_ren2_mask_0),
		.io_ren2_uops_0_inst(_rename_stage_io_ren2_uops_0_inst),
		.io_ren2_uops_0_debug_inst(_rename_stage_io_ren2_uops_0_debug_inst),
		.io_ren2_uops_0_is_rvc(_rename_stage_io_ren2_uops_0_is_rvc),
		.io_ren2_uops_0_debug_pc(_rename_stage_io_ren2_uops_0_debug_pc),
		.io_ren2_uops_0_iq_type_0(_rename_stage_io_ren2_uops_0_iq_type_0),
		.io_ren2_uops_0_iq_type_1(_rename_stage_io_ren2_uops_0_iq_type_1),
		.io_ren2_uops_0_iq_type_2(_rename_stage_io_ren2_uops_0_iq_type_2),
		.io_ren2_uops_0_iq_type_3(_rename_stage_io_ren2_uops_0_iq_type_3),
		.io_ren2_uops_0_fu_code_0(_rename_stage_io_ren2_uops_0_fu_code_0),
		.io_ren2_uops_0_fu_code_1(_rename_stage_io_ren2_uops_0_fu_code_1),
		.io_ren2_uops_0_fu_code_2(_rename_stage_io_ren2_uops_0_fu_code_2),
		.io_ren2_uops_0_fu_code_3(_rename_stage_io_ren2_uops_0_fu_code_3),
		.io_ren2_uops_0_fu_code_4(_rename_stage_io_ren2_uops_0_fu_code_4),
		.io_ren2_uops_0_fu_code_5(_rename_stage_io_ren2_uops_0_fu_code_5),
		.io_ren2_uops_0_fu_code_6(_rename_stage_io_ren2_uops_0_fu_code_6),
		.io_ren2_uops_0_fu_code_7(_rename_stage_io_ren2_uops_0_fu_code_7),
		.io_ren2_uops_0_fu_code_8(_rename_stage_io_ren2_uops_0_fu_code_8),
		.io_ren2_uops_0_fu_code_9(_rename_stage_io_ren2_uops_0_fu_code_9),
		.io_ren2_uops_0_iw_issued(io_lsu_dis_uops_0_bits_iw_issued),
		.io_ren2_uops_0_iw_issued_partial_agen(io_lsu_dis_uops_0_bits_iw_issued_partial_agen),
		.io_ren2_uops_0_iw_issued_partial_dgen(io_lsu_dis_uops_0_bits_iw_issued_partial_dgen),
		.io_ren2_uops_0_iw_p1_speculative_child(_rename_stage_io_ren2_uops_0_iw_p1_speculative_child),
		.io_ren2_uops_0_iw_p2_speculative_child(_rename_stage_io_ren2_uops_0_iw_p2_speculative_child),
		.io_ren2_uops_0_iw_p1_bypass_hint(io_lsu_dis_uops_0_bits_iw_p1_bypass_hint),
		.io_ren2_uops_0_iw_p2_bypass_hint(io_lsu_dis_uops_0_bits_iw_p2_bypass_hint),
		.io_ren2_uops_0_iw_p3_bypass_hint(io_lsu_dis_uops_0_bits_iw_p3_bypass_hint),
		.io_ren2_uops_0_br_mask(_rename_stage_io_ren2_uops_0_br_mask),
		.io_ren2_uops_0_br_tag(_rename_stage_io_ren2_uops_0_br_tag),
		.io_ren2_uops_0_br_type(_rename_stage_io_ren2_uops_0_br_type),
		.io_ren2_uops_0_is_sfb(_rename_stage_io_ren2_uops_0_is_sfb),
		.io_ren2_uops_0_is_fence(_rename_stage_io_ren2_uops_0_is_fence),
		.io_ren2_uops_0_is_fencei(_rename_stage_io_ren2_uops_0_is_fencei),
		.io_ren2_uops_0_is_sfence(_rename_stage_io_ren2_uops_0_is_sfence),
		.io_ren2_uops_0_is_amo(_rename_stage_io_ren2_uops_0_is_amo),
		.io_ren2_uops_0_is_eret(_rename_stage_io_ren2_uops_0_is_eret),
		.io_ren2_uops_0_is_sys_pc2epc(_rename_stage_io_ren2_uops_0_is_sys_pc2epc),
		.io_ren2_uops_0_is_rocc(_rename_stage_io_ren2_uops_0_is_rocc),
		.io_ren2_uops_0_is_mov(_rename_stage_io_ren2_uops_0_is_mov),
		.io_ren2_uops_0_ftq_idx(_rename_stage_io_ren2_uops_0_ftq_idx),
		.io_ren2_uops_0_edge_inst(_rename_stage_io_ren2_uops_0_edge_inst),
		.io_ren2_uops_0_pc_lob(_rename_stage_io_ren2_uops_0_pc_lob),
		.io_ren2_uops_0_taken(_rename_stage_io_ren2_uops_0_taken),
		.io_ren2_uops_0_imm_rename(_rename_stage_io_ren2_uops_0_imm_rename),
		.io_ren2_uops_0_imm_packed(_rename_stage_io_ren2_uops_0_imm_packed),
		.io_ren2_uops_0_op1_sel(_rename_stage_io_ren2_uops_0_op1_sel),
		.io_ren2_uops_0_op2_sel(_rename_stage_io_ren2_uops_0_op2_sel),
		.io_ren2_uops_0_fp_ctrl_ldst(_rename_stage_io_ren2_uops_0_fp_ctrl_ldst),
		.io_ren2_uops_0_fp_ctrl_wen(_rename_stage_io_ren2_uops_0_fp_ctrl_wen),
		.io_ren2_uops_0_fp_ctrl_ren1(_rename_stage_io_ren2_uops_0_fp_ctrl_ren1),
		.io_ren2_uops_0_fp_ctrl_ren2(_rename_stage_io_ren2_uops_0_fp_ctrl_ren2),
		.io_ren2_uops_0_fp_ctrl_ren3(_rename_stage_io_ren2_uops_0_fp_ctrl_ren3),
		.io_ren2_uops_0_fp_ctrl_swap12(_rename_stage_io_ren2_uops_0_fp_ctrl_swap12),
		.io_ren2_uops_0_fp_ctrl_swap23(_rename_stage_io_ren2_uops_0_fp_ctrl_swap23),
		.io_ren2_uops_0_fp_ctrl_typeTagIn(_rename_stage_io_ren2_uops_0_fp_ctrl_typeTagIn),
		.io_ren2_uops_0_fp_ctrl_typeTagOut(_rename_stage_io_ren2_uops_0_fp_ctrl_typeTagOut),
		.io_ren2_uops_0_fp_ctrl_fromint(_rename_stage_io_ren2_uops_0_fp_ctrl_fromint),
		.io_ren2_uops_0_fp_ctrl_toint(_rename_stage_io_ren2_uops_0_fp_ctrl_toint),
		.io_ren2_uops_0_fp_ctrl_fastpipe(_rename_stage_io_ren2_uops_0_fp_ctrl_fastpipe),
		.io_ren2_uops_0_fp_ctrl_fma(_rename_stage_io_ren2_uops_0_fp_ctrl_fma),
		.io_ren2_uops_0_fp_ctrl_div(_rename_stage_io_ren2_uops_0_fp_ctrl_div),
		.io_ren2_uops_0_fp_ctrl_sqrt(_rename_stage_io_ren2_uops_0_fp_ctrl_sqrt),
		.io_ren2_uops_0_fp_ctrl_wflags(_rename_stage_io_ren2_uops_0_fp_ctrl_wflags),
		.io_ren2_uops_0_fp_ctrl_vec(_rename_stage_io_ren2_uops_0_fp_ctrl_vec),
		.io_ren2_uops_0_rxq_idx(_rename_stage_io_ren2_uops_0_rxq_idx),
		.io_ren2_uops_0_pdst(_rename_stage_io_ren2_uops_0_pdst),
		.io_ren2_uops_0_prs1(_rename_stage_io_ren2_uops_0_prs1),
		.io_ren2_uops_0_prs2(_rename_stage_io_ren2_uops_0_prs2),
		.io_ren2_uops_0_prs1_busy(_rename_stage_io_ren2_uops_0_prs1_busy),
		.io_ren2_uops_0_prs2_busy(_rename_stage_io_ren2_uops_0_prs2_busy),
		.io_ren2_uops_0_stale_pdst(_rename_stage_io_ren2_uops_0_stale_pdst),
		.io_ren2_uops_0_exception(_rename_stage_io_ren2_uops_0_exception),
		.io_ren2_uops_0_exc_cause(_rename_stage_io_ren2_uops_0_exc_cause),
		.io_ren2_uops_0_mem_cmd(_rename_stage_io_ren2_uops_0_mem_cmd),
		.io_ren2_uops_0_mem_size(_rename_stage_io_ren2_uops_0_mem_size),
		.io_ren2_uops_0_mem_signed(_rename_stage_io_ren2_uops_0_mem_signed),
		.io_ren2_uops_0_uses_ldq(_rename_stage_io_ren2_uops_0_uses_ldq),
		.io_ren2_uops_0_uses_stq(_rename_stage_io_ren2_uops_0_uses_stq),
		.io_ren2_uops_0_is_unique(_rename_stage_io_ren2_uops_0_is_unique),
		.io_ren2_uops_0_flush_on_commit(_rename_stage_io_ren2_uops_0_flush_on_commit),
		.io_ren2_uops_0_csr_cmd(_rename_stage_io_ren2_uops_0_csr_cmd),
		.io_ren2_uops_0_ldst_is_rs1(_rename_stage_io_ren2_uops_0_ldst_is_rs1),
		.io_ren2_uops_0_ldst(_rename_stage_io_ren2_uops_0_ldst),
		.io_ren2_uops_0_lrs1(_rename_stage_io_ren2_uops_0_lrs1),
		.io_ren2_uops_0_lrs2(_rename_stage_io_ren2_uops_0_lrs2),
		.io_ren2_uops_0_lrs3(_rename_stage_io_ren2_uops_0_lrs3),
		.io_ren2_uops_0_dst_rtype(_rename_stage_io_ren2_uops_0_dst_rtype),
		.io_ren2_uops_0_lrs1_rtype(_rename_stage_io_ren2_uops_0_lrs1_rtype),
		.io_ren2_uops_0_lrs2_rtype(_rename_stage_io_ren2_uops_0_lrs2_rtype),
		.io_ren2_uops_0_frs3_en(_rename_stage_io_ren2_uops_0_frs3_en),
		.io_ren2_uops_0_fcn_dw(_rename_stage_io_ren2_uops_0_fcn_dw),
		.io_ren2_uops_0_fcn_op(_rename_stage_io_ren2_uops_0_fcn_op),
		.io_ren2_uops_0_fp_val(_rename_stage_io_ren2_uops_0_fp_val),
		.io_ren2_uops_0_fp_rm(_rename_stage_io_ren2_uops_0_fp_rm),
		.io_ren2_uops_0_fp_typ(_rename_stage_io_ren2_uops_0_fp_typ),
		.io_ren2_uops_0_xcpt_pf_if(_rename_stage_io_ren2_uops_0_xcpt_pf_if),
		.io_ren2_uops_0_xcpt_ae_if(_rename_stage_io_ren2_uops_0_xcpt_ae_if),
		.io_ren2_uops_0_xcpt_ma_if(_rename_stage_io_ren2_uops_0_xcpt_ma_if),
		.io_ren2_uops_0_bp_debug_if(_rename_stage_io_ren2_uops_0_bp_debug_if),
		.io_ren2_uops_0_bp_xcpt_if(_rename_stage_io_ren2_uops_0_bp_xcpt_if),
		.io_ren2_uops_0_debug_fsrc(_rename_stage_io_ren2_uops_0_debug_fsrc),
		.io_ren2_uops_0_debug_tsrc(_rename_stage_io_ren2_uops_0_debug_tsrc),
		.io_brupdate_b1_resolve_mask(b1_resolve_mask),
		.io_brupdate_b2_uop_br_tag(b2_uop_br_tag),
		.io_brupdate_b2_mispredict(b2_mispredict),
		.io_dis_fire_0(dis_fire_0),
		.io_dis_ready(~dis_stalls_0),
		.io_wakeups_0_valid(io_lsu_iwakeups_0_valid),
		.io_wakeups_0_bits_uop_pdst(io_lsu_iwakeups_0_bits_uop_pdst),
		.io_wakeups_0_bits_uop_dst_rtype(io_lsu_iwakeups_0_bits_uop_dst_rtype),
		.io_wakeups_0_bits_rebusy(io_lsu_iwakeups_0_bits_rebusy),
		.io_wakeups_1_valid(int_wakeups_1_valid),
		.io_wakeups_1_bits_uop_pdst(_ll_arb_io_out_bits_uop_pdst),
		.io_wakeups_1_bits_uop_dst_rtype(_ll_arb_io_out_bits_uop_dst_rtype),
		.io_wakeups_2_valid(_alu_exe_unit_0_io_fast_wakeup_valid),
		.io_wakeups_2_bits_uop_pdst(_alu_exe_unit_0_io_fast_wakeup_bits_uop_pdst),
		.io_wakeups_2_bits_uop_dst_rtype(_alu_exe_unit_0_io_fast_wakeup_bits_uop_dst_rtype),
		.io_child_rebusys(_alu_exe_unit_0_io_child_rebusy),
		.io_com_valids_0(_rob_io_commit_valids_0),
		.io_com_uops_0_pdst(_rob_io_commit_uops_0_pdst),
		.io_com_uops_0_stale_pdst(_rob_io_commit_uops_0_stale_pdst),
		.io_com_uops_0_ldst(_rob_io_commit_uops_0_ldst),
		.io_com_uops_0_dst_rtype(_rob_io_commit_uops_0_dst_rtype),
		.io_rollback(_rob_io_rollback)
	);
	RenameStage_1 fp_rename_stage(
		.clock(clock),
		.reset(reset),
		.io_ren_stalls_0(_fp_rename_stage_io_ren_stalls_0),
		.io_kill(io_ifu_redirect_flush_0),
		.io_dec_fire_0(dec_ready),
		.io_dec_uops_0_br_tag(_dec_brmask_logic_io_br_tag_0),
		.io_dec_uops_0_br_type(_decode_0_io_deq_uop_br_type),
		.io_dec_uops_0_is_sfb(_decode_0_io_deq_uop_is_sfb),
		.io_dec_uops_0_ldst(_decode_0_io_deq_uop_ldst),
		.io_dec_uops_0_lrs1(_decode_0_io_deq_uop_lrs1),
		.io_dec_uops_0_lrs2(_decode_0_io_deq_uop_lrs2),
		.io_dec_uops_0_lrs3(_decode_0_io_deq_uop_lrs3),
		.io_dec_uops_0_dst_rtype(_decode_0_io_deq_uop_dst_rtype),
		.io_dec_uops_0_lrs1_rtype(_decode_0_io_deq_uop_lrs1_rtype),
		.io_dec_uops_0_lrs2_rtype(_decode_0_io_deq_uop_lrs2_rtype),
		.io_dec_uops_0_frs3_en(_decode_0_io_deq_uop_frs3_en),
		.io_ren2_uops_0_pdst(_fp_rename_stage_io_ren2_uops_0_pdst),
		.io_ren2_uops_0_prs1(_fp_rename_stage_io_ren2_uops_0_prs1),
		.io_ren2_uops_0_prs2(_fp_rename_stage_io_ren2_uops_0_prs2),
		.io_ren2_uops_0_prs3(_fp_rename_stage_io_ren2_uops_0_prs3),
		.io_ren2_uops_0_prs1_busy(_fp_rename_stage_io_ren2_uops_0_prs1_busy),
		.io_ren2_uops_0_prs2_busy(_fp_rename_stage_io_ren2_uops_0_prs2_busy),
		.io_ren2_uops_0_prs3_busy(_fp_rename_stage_io_ren2_uops_0_prs3_busy),
		.io_ren2_uops_0_stale_pdst(_fp_rename_stage_io_ren2_uops_0_stale_pdst),
		.io_brupdate_b2_uop_br_tag(b2_uop_br_tag),
		.io_brupdate_b2_mispredict(b2_mispredict),
		.io_dis_fire_0(dis_fire_0),
		.io_dis_ready(~dis_stalls_0),
		.io_wakeups_0_valid(_fp_pipeline_io_wakeups_0_valid),
		.io_wakeups_0_bits_uop_pdst(_fp_pipeline_io_wakeups_0_bits_uop_pdst),
		.io_wakeups_0_bits_uop_dst_rtype(_fp_pipeline_io_wakeups_0_bits_uop_dst_rtype),
		.io_wakeups_1_valid(_fp_pipeline_io_wakeups_1_valid),
		.io_wakeups_1_bits_uop_pdst(_fp_pipeline_io_wakeups_1_bits_uop_pdst),
		.io_wakeups_1_bits_uop_dst_rtype(_fp_pipeline_io_wakeups_1_bits_uop_dst_rtype),
		.io_com_valids_0(_rob_io_commit_valids_0),
		.io_com_uops_0_pdst(_rob_io_commit_uops_0_pdst),
		.io_com_uops_0_stale_pdst(_rob_io_commit_uops_0_stale_pdst),
		.io_com_uops_0_ldst(_rob_io_commit_uops_0_ldst),
		.io_com_uops_0_dst_rtype(_rob_io_commit_uops_0_dst_rtype),
		.io_rollback(_rob_io_rollback)
	);
	PredRenameStage pred_rename_stage(
		.clock(clock),
		.reset(reset),
		.io_kill(io_ifu_redirect_flush_0),
		.io_dec_fire_0(dec_ready),
		.io_dec_uops_0_br_type(_decode_0_io_deq_uop_br_type),
		.io_dec_uops_0_is_sfb(_decode_0_io_deq_uop_is_sfb),
		.io_dec_uops_0_ftq_idx(_decode_0_io_deq_uop_ftq_idx),
		.io_dec_uops_0_lrs1(_decode_0_io_deq_uop_lrs1),
		.io_dec_uops_0_lrs2(_decode_0_io_deq_uop_lrs2),
		.io_dec_uops_0_lrs1_rtype(_decode_0_io_deq_uop_lrs1_rtype),
		.io_dec_uops_0_lrs2_rtype(_decode_0_io_deq_uop_lrs2_rtype),
		.io_ren2_uops_0_pdst(_pred_rename_stage_io_ren2_uops_0_pdst),
		.io_ren2_uops_0_ppred(_pred_rename_stage_io_ren2_uops_0_ppred),
		.io_ren2_uops_0_ppred_busy(_pred_rename_stage_io_ren2_uops_0_ppred_busy),
		.io_dis_fire_0(dis_fire_0),
		.io_dis_ready(~dis_stalls_0),
		.io_wakeups_0_valid(_alu_exe_unit_0_io_fast_pred_wakeup_valid),
		.io_wakeups_0_bits_uop_pdst(_alu_exe_unit_0_io_fast_pred_wakeup_bits_uop_pdst)
	);
	ImmRenameStage imm_rename_stage(
		.clock(clock),
		.reset(reset),
		.io_ren_stalls_0(_imm_rename_stage_io_ren_stalls_0),
		.io_kill(io_ifu_redirect_flush_0),
		.io_dec_fire_0(dec_ready),
		.io_dec_uops_0_iq_type_0(_decode_0_io_deq_uop_iq_type_0),
		.io_dec_uops_0_iq_type_1(_decode_0_io_deq_uop_iq_type_1),
		.io_dec_uops_0_iq_type_2(_decode_0_io_deq_uop_iq_type_2),
		.io_dec_uops_0_br_tag(_dec_brmask_logic_io_br_tag_0),
		.io_dec_uops_0_br_type(_decode_0_io_deq_uop_br_type),
		.io_dec_uops_0_is_sfb(_decode_0_io_deq_uop_is_sfb),
		.io_dec_uops_0_imm_rename(_decode_0_io_deq_uop_imm_rename),
		.io_dec_uops_0_imm_sel(_decode_0_io_deq_uop_imm_sel),
		.io_dec_uops_0_pimm(_decode_0_io_deq_uop_pimm),
		.io_dec_uops_0_lrs1(_decode_0_io_deq_uop_lrs1),
		.io_dec_uops_0_lrs2(_decode_0_io_deq_uop_lrs2),
		.io_dec_uops_0_lrs1_rtype(_decode_0_io_deq_uop_lrs1_rtype),
		.io_dec_uops_0_lrs2_rtype(_decode_0_io_deq_uop_lrs2_rtype),
		.io_ren2_uops_0_imm_sel(_imm_rename_stage_io_ren2_uops_0_imm_sel),
		.io_ren2_uops_0_pimm(_imm_rename_stage_io_ren2_uops_0_pimm),
		.io_brupdate_b2_uop_br_tag(b2_uop_br_tag),
		.io_brupdate_b2_mispredict(b2_mispredict),
		.io_dis_fire_0(dis_fire_0),
		.io_dis_ready(~dis_stalls_0),
		.io_wakeups_0_valid(_alu_exe_unit_0_io_rrd_immrf_wakeup_valid),
		.io_wakeups_0_bits_uop_pimm(_alu_exe_unit_0_io_rrd_immrf_wakeup_bits_uop_pimm),
		.io_wakeups_1_valid(_mem_exe_unit_0_io_rrd_immrf_wakeup_valid),
		.io_wakeups_1_bits_uop_pimm(_mem_exe_unit_0_io_rrd_immrf_wakeup_bits_uop_pimm),
		.io_wakeups_2_valid(_mem_exe_unit_1_io_rrd_immrf_wakeup_valid),
		.io_wakeups_2_bits_uop_pimm(_mem_exe_unit_1_io_rrd_immrf_wakeup_bits_uop_pimm),
		.io_wakeups_3_valid(_unique_exe_unit_0_io_rrd_immrf_wakeup_valid),
		.io_wakeups_3_bits_uop_pimm(_unique_exe_unit_0_io_rrd_immrf_wakeup_bits_uop_pimm),
		.io_rollback(_rob_io_rollback)
	);
	IssueUnitCollapsing_1 mem_iss_unit(
		.clock(clock),
		.reset(reset),
		.io_dis_uops_0_ready(_mem_iss_unit_io_dis_uops_0_ready),
		.io_dis_uops_0_valid(_dispatcher_io_dis_uops_0_0_valid),
		.io_dis_uops_0_bits_fu_code_1(_dispatcher_io_dis_uops_0_0_bits_fu_code_1),
		.io_dis_uops_0_bits_fu_code_2(_dispatcher_io_dis_uops_0_0_bits_fu_code_2),
		.io_dis_uops_0_bits_iw_p1_speculative_child(_dispatcher_io_dis_uops_0_0_bits_iw_p1_speculative_child),
		.io_dis_uops_0_bits_iw_p2_speculative_child(_dispatcher_io_dis_uops_0_0_bits_iw_p2_speculative_child),
		.io_dis_uops_0_bits_br_mask(_dispatcher_io_dis_uops_0_0_bits_br_mask),
		.io_dis_uops_0_bits_is_fence(_dispatcher_io_dis_uops_0_0_bits_is_fence),
		.io_dis_uops_0_bits_is_fencei(_dispatcher_io_dis_uops_0_0_bits_is_fencei),
		.io_dis_uops_0_bits_imm_sel(_dispatcher_io_dis_uops_0_0_bits_imm_sel),
		.io_dis_uops_0_bits_pimm(_dispatcher_io_dis_uops_0_0_bits_pimm),
		.io_dis_uops_0_bits_ldq_idx(_dispatcher_io_dis_uops_0_0_bits_ldq_idx),
		.io_dis_uops_0_bits_stq_idx(_dispatcher_io_dis_uops_0_0_bits_stq_idx),
		.io_dis_uops_0_bits_pdst(_dispatcher_io_dis_uops_0_0_bits_pdst),
		.io_dis_uops_0_bits_prs1(_dispatcher_io_dis_uops_0_0_bits_prs1),
		.io_dis_uops_0_bits_prs2(_dispatcher_io_dis_uops_0_0_bits_prs2),
		.io_dis_uops_0_bits_prs1_busy(_dispatcher_io_dis_uops_0_0_bits_prs1_busy),
		.io_dis_uops_0_bits_prs2_busy(_dispatcher_io_dis_uops_0_0_bits_prs2_busy),
		.io_dis_uops_0_bits_ppred_busy(_dispatcher_io_dis_uops_0_0_bits_ppred_busy),
		.io_dis_uops_0_bits_exception(_dispatcher_io_dis_uops_0_0_bits_exception),
		.io_dis_uops_0_bits_uses_ldq(_dispatcher_io_dis_uops_0_0_bits_uses_ldq),
		.io_dis_uops_0_bits_uses_stq(_dispatcher_io_dis_uops_0_0_bits_uses_stq),
		.io_dis_uops_0_bits_dst_rtype(_dispatcher_io_dis_uops_0_0_bits_dst_rtype),
		.io_dis_uops_0_bits_lrs1_rtype(_dispatcher_io_dis_uops_0_0_bits_lrs1_rtype),
		.io_dis_uops_0_bits_lrs2_rtype(_dispatcher_io_dis_uops_0_0_bits_lrs2_rtype),
		.io_dis_uops_0_bits_fp_val(_dispatcher_io_dis_uops_0_0_bits_fp_val),
		.io_iss_uops_0_valid(_mem_iss_unit_io_iss_uops_0_valid),
		.io_iss_uops_0_bits_fu_code_1(_mem_iss_unit_io_iss_uops_0_bits_fu_code_1),
		.io_iss_uops_0_bits_fu_code_2(_mem_iss_unit_io_iss_uops_0_bits_fu_code_2),
		.io_iss_uops_0_bits_iw_p1_bypass_hint(_mem_iss_unit_io_iss_uops_0_bits_iw_p1_bypass_hint),
		.io_iss_uops_0_bits_br_mask(_mem_iss_unit_io_iss_uops_0_bits_br_mask),
		.io_iss_uops_0_bits_imm_sel(_mem_iss_unit_io_iss_uops_0_bits_imm_sel),
		.io_iss_uops_0_bits_pimm(_mem_iss_unit_io_iss_uops_0_bits_pimm),
		.io_iss_uops_0_bits_stq_idx(_mem_iss_unit_io_iss_uops_0_bits_stq_idx),
		.io_iss_uops_0_bits_prs1(_mem_iss_unit_io_iss_uops_0_bits_prs1),
		.io_iss_uops_0_bits_lrs1_rtype(_mem_iss_unit_io_iss_uops_0_bits_lrs1_rtype),
		.io_iss_uops_1_valid(_mem_iss_unit_io_iss_uops_1_valid),
		.io_iss_uops_1_bits_fu_code_1(_mem_iss_unit_io_iss_uops_1_bits_fu_code_1),
		.io_iss_uops_1_bits_fu_code_2(_mem_iss_unit_io_iss_uops_1_bits_fu_code_2),
		.io_iss_uops_1_bits_iw_p1_bypass_hint(_mem_iss_unit_io_iss_uops_1_bits_iw_p1_bypass_hint),
		.io_iss_uops_1_bits_br_mask(_mem_iss_unit_io_iss_uops_1_bits_br_mask),
		.io_iss_uops_1_bits_imm_sel(_mem_iss_unit_io_iss_uops_1_bits_imm_sel),
		.io_iss_uops_1_bits_pimm(_mem_iss_unit_io_iss_uops_1_bits_pimm),
		.io_iss_uops_1_bits_ldq_idx(_mem_iss_unit_io_iss_uops_1_bits_ldq_idx),
		.io_iss_uops_1_bits_stq_idx(_mem_iss_unit_io_iss_uops_1_bits_stq_idx),
		.io_iss_uops_1_bits_pdst(_mem_iss_unit_io_iss_uops_1_bits_pdst),
		.io_iss_uops_1_bits_prs1(_mem_iss_unit_io_iss_uops_1_bits_prs1),
		.io_iss_uops_1_bits_uses_ldq(_mem_iss_unit_io_iss_uops_1_bits_uses_ldq),
		.io_iss_uops_1_bits_uses_stq(_mem_iss_unit_io_iss_uops_1_bits_uses_stq),
		.io_iss_uops_1_bits_dst_rtype(_mem_iss_unit_io_iss_uops_1_bits_dst_rtype),
		.io_iss_uops_1_bits_lrs1_rtype(_mem_iss_unit_io_iss_uops_1_bits_lrs1_rtype),
		.io_iss_uops_1_bits_fp_val(_mem_iss_unit_io_iss_uops_1_bits_fp_val),
		.io_wakeup_ports_0_valid(io_lsu_iwakeups_0_valid),
		.io_wakeup_ports_0_bits_uop_pdst(io_lsu_iwakeups_0_bits_uop_pdst),
		.io_wakeup_ports_0_bits_bypassable(io_lsu_iwakeups_0_bits_bypassable),
		.io_wakeup_ports_0_bits_rebusy(io_lsu_iwakeups_0_bits_rebusy),
		.io_wakeup_ports_1_valid(int_wakeups_1_valid),
		.io_wakeup_ports_1_bits_uop_pdst(_ll_arb_io_out_bits_uop_pdst),
		.io_wakeup_ports_2_valid(_alu_exe_unit_0_io_fast_wakeup_valid),
		.io_wakeup_ports_2_bits_uop_pdst(_alu_exe_unit_0_io_fast_wakeup_bits_uop_pdst),
		.io_child_rebusys(_alu_exe_unit_0_io_child_rebusy),
		.io_fu_types_1_1(_mem_exe_unit_1_io_ready_fu_types_1),
		.io_brupdate_b1_resolve_mask(b1_resolve_mask),
		.io_brupdate_b1_mispredict_mask(b1_mispredict_mask),
		.io_flush_pipeline(mem_iss_unit_io_flush_pipeline_REG),
		.io_squash_grant(((_mem_exe_unit_0_io_squash_iss | _mem_exe_unit_1_io_squash_iss) | _alu_exe_unit_0_io_squash_iss) | io_lsu_iwakeups_0_bits_rebusy)
	);
	IssueUnitCollapsing_2 unq_iss_unit(
		.clock(clock),
		.reset(reset),
		.io_dis_uops_0_ready(_unq_iss_unit_io_dis_uops_0_ready),
		.io_dis_uops_0_valid(_dispatcher_io_dis_uops_1_0_valid),
		.io_dis_uops_0_bits_inst(_dispatcher_io_dis_uops_1_0_bits_inst),
		.io_dis_uops_0_bits_debug_inst(_dispatcher_io_dis_uops_1_0_bits_debug_inst),
		.io_dis_uops_0_bits_is_rvc(_dispatcher_io_dis_uops_1_0_bits_is_rvc),
		.io_dis_uops_0_bits_debug_pc(_dispatcher_io_dis_uops_1_0_bits_debug_pc),
		.io_dis_uops_0_bits_iq_type_0(_dispatcher_io_dis_uops_1_0_bits_iq_type_0),
		.io_dis_uops_0_bits_iq_type_1(_dispatcher_io_dis_uops_1_0_bits_iq_type_1),
		.io_dis_uops_0_bits_iq_type_2(_dispatcher_io_dis_uops_1_0_bits_iq_type_2),
		.io_dis_uops_0_bits_iq_type_3(_dispatcher_io_dis_uops_1_0_bits_iq_type_3),
		.io_dis_uops_0_bits_fu_code_0(_dispatcher_io_dis_uops_1_0_bits_fu_code_0),
		.io_dis_uops_0_bits_fu_code_1(_dispatcher_io_dis_uops_1_0_bits_fu_code_1),
		.io_dis_uops_0_bits_fu_code_2(_dispatcher_io_dis_uops_1_0_bits_fu_code_2),
		.io_dis_uops_0_bits_fu_code_3(_dispatcher_io_dis_uops_1_0_bits_fu_code_3),
		.io_dis_uops_0_bits_fu_code_4(_dispatcher_io_dis_uops_1_0_bits_fu_code_4),
		.io_dis_uops_0_bits_fu_code_5(_dispatcher_io_dis_uops_1_0_bits_fu_code_5),
		.io_dis_uops_0_bits_fu_code_6(_dispatcher_io_dis_uops_1_0_bits_fu_code_6),
		.io_dis_uops_0_bits_fu_code_7(_dispatcher_io_dis_uops_1_0_bits_fu_code_7),
		.io_dis_uops_0_bits_fu_code_8(_dispatcher_io_dis_uops_1_0_bits_fu_code_8),
		.io_dis_uops_0_bits_fu_code_9(_dispatcher_io_dis_uops_1_0_bits_fu_code_9),
		.io_dis_uops_0_bits_iw_p1_speculative_child(_dispatcher_io_dis_uops_1_0_bits_iw_p1_speculative_child),
		.io_dis_uops_0_bits_iw_p2_speculative_child(_dispatcher_io_dis_uops_1_0_bits_iw_p2_speculative_child),
		.io_dis_uops_0_bits_br_mask(_dispatcher_io_dis_uops_1_0_bits_br_mask),
		.io_dis_uops_0_bits_br_tag(_dispatcher_io_dis_uops_1_0_bits_br_tag),
		.io_dis_uops_0_bits_br_type(_dispatcher_io_dis_uops_1_0_bits_br_type),
		.io_dis_uops_0_bits_is_sfb(_dispatcher_io_dis_uops_1_0_bits_is_sfb),
		.io_dis_uops_0_bits_is_fence(_dispatcher_io_dis_uops_1_0_bits_is_fence),
		.io_dis_uops_0_bits_is_fencei(_dispatcher_io_dis_uops_1_0_bits_is_fencei),
		.io_dis_uops_0_bits_is_sfence(_dispatcher_io_dis_uops_1_0_bits_is_sfence),
		.io_dis_uops_0_bits_is_amo(_dispatcher_io_dis_uops_1_0_bits_is_amo),
		.io_dis_uops_0_bits_is_eret(_dispatcher_io_dis_uops_1_0_bits_is_eret),
		.io_dis_uops_0_bits_is_sys_pc2epc(_dispatcher_io_dis_uops_1_0_bits_is_sys_pc2epc),
		.io_dis_uops_0_bits_is_rocc(_dispatcher_io_dis_uops_1_0_bits_is_rocc),
		.io_dis_uops_0_bits_is_mov(_dispatcher_io_dis_uops_1_0_bits_is_mov),
		.io_dis_uops_0_bits_ftq_idx(_dispatcher_io_dis_uops_1_0_bits_ftq_idx),
		.io_dis_uops_0_bits_edge_inst(_dispatcher_io_dis_uops_1_0_bits_edge_inst),
		.io_dis_uops_0_bits_pc_lob(_dispatcher_io_dis_uops_1_0_bits_pc_lob),
		.io_dis_uops_0_bits_taken(_dispatcher_io_dis_uops_1_0_bits_taken),
		.io_dis_uops_0_bits_imm_rename(_dispatcher_io_dis_uops_1_0_bits_imm_rename),
		.io_dis_uops_0_bits_imm_sel(_dispatcher_io_dis_uops_1_0_bits_imm_sel),
		.io_dis_uops_0_bits_pimm(_dispatcher_io_dis_uops_1_0_bits_pimm),
		.io_dis_uops_0_bits_imm_packed(_dispatcher_io_dis_uops_1_0_bits_imm_packed),
		.io_dis_uops_0_bits_op1_sel(_dispatcher_io_dis_uops_1_0_bits_op1_sel),
		.io_dis_uops_0_bits_op2_sel(_dispatcher_io_dis_uops_1_0_bits_op2_sel),
		.io_dis_uops_0_bits_fp_ctrl_ldst(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_ldst),
		.io_dis_uops_0_bits_fp_ctrl_wen(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_wen),
		.io_dis_uops_0_bits_fp_ctrl_ren1(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_ren1),
		.io_dis_uops_0_bits_fp_ctrl_ren2(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_ren2),
		.io_dis_uops_0_bits_fp_ctrl_ren3(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_ren3),
		.io_dis_uops_0_bits_fp_ctrl_swap12(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_swap12),
		.io_dis_uops_0_bits_fp_ctrl_swap23(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_swap23),
		.io_dis_uops_0_bits_fp_ctrl_typeTagIn(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_typeTagIn),
		.io_dis_uops_0_bits_fp_ctrl_typeTagOut(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_typeTagOut),
		.io_dis_uops_0_bits_fp_ctrl_fromint(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_fromint),
		.io_dis_uops_0_bits_fp_ctrl_toint(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_toint),
		.io_dis_uops_0_bits_fp_ctrl_fastpipe(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_fastpipe),
		.io_dis_uops_0_bits_fp_ctrl_fma(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_fma),
		.io_dis_uops_0_bits_fp_ctrl_div(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_div),
		.io_dis_uops_0_bits_fp_ctrl_sqrt(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_sqrt),
		.io_dis_uops_0_bits_fp_ctrl_wflags(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_wflags),
		.io_dis_uops_0_bits_fp_ctrl_vec(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_vec),
		.io_dis_uops_0_bits_rob_idx(_dispatcher_io_dis_uops_1_0_bits_rob_idx),
		.io_dis_uops_0_bits_ldq_idx(_dispatcher_io_dis_uops_1_0_bits_ldq_idx),
		.io_dis_uops_0_bits_stq_idx(_dispatcher_io_dis_uops_1_0_bits_stq_idx),
		.io_dis_uops_0_bits_rxq_idx(_dispatcher_io_dis_uops_1_0_bits_rxq_idx),
		.io_dis_uops_0_bits_pdst(_dispatcher_io_dis_uops_1_0_bits_pdst),
		.io_dis_uops_0_bits_prs1(_dispatcher_io_dis_uops_1_0_bits_prs1),
		.io_dis_uops_0_bits_prs2(_dispatcher_io_dis_uops_1_0_bits_prs2),
		.io_dis_uops_0_bits_prs3(_dispatcher_io_dis_uops_1_0_bits_prs3),
		.io_dis_uops_0_bits_ppred(_dispatcher_io_dis_uops_1_0_bits_ppred),
		.io_dis_uops_0_bits_prs1_busy(_dispatcher_io_dis_uops_1_0_bits_prs1_busy),
		.io_dis_uops_0_bits_prs2_busy(_dispatcher_io_dis_uops_1_0_bits_prs2_busy),
		.io_dis_uops_0_bits_prs3_busy(_dispatcher_io_dis_uops_1_0_bits_prs3_busy),
		.io_dis_uops_0_bits_ppred_busy(_dispatcher_io_dis_uops_1_0_bits_ppred_busy),
		.io_dis_uops_0_bits_stale_pdst(_dispatcher_io_dis_uops_1_0_bits_stale_pdst),
		.io_dis_uops_0_bits_exception(_dispatcher_io_dis_uops_1_0_bits_exception),
		.io_dis_uops_0_bits_exc_cause(_dispatcher_io_dis_uops_1_0_bits_exc_cause),
		.io_dis_uops_0_bits_mem_cmd(_dispatcher_io_dis_uops_1_0_bits_mem_cmd),
		.io_dis_uops_0_bits_mem_size(_dispatcher_io_dis_uops_1_0_bits_mem_size),
		.io_dis_uops_0_bits_mem_signed(_dispatcher_io_dis_uops_1_0_bits_mem_signed),
		.io_dis_uops_0_bits_uses_ldq(_dispatcher_io_dis_uops_1_0_bits_uses_ldq),
		.io_dis_uops_0_bits_uses_stq(_dispatcher_io_dis_uops_1_0_bits_uses_stq),
		.io_dis_uops_0_bits_is_unique(_dispatcher_io_dis_uops_1_0_bits_is_unique),
		.io_dis_uops_0_bits_flush_on_commit(_dispatcher_io_dis_uops_1_0_bits_flush_on_commit),
		.io_dis_uops_0_bits_csr_cmd(_dispatcher_io_dis_uops_1_0_bits_csr_cmd),
		.io_dis_uops_0_bits_ldst_is_rs1(_dispatcher_io_dis_uops_1_0_bits_ldst_is_rs1),
		.io_dis_uops_0_bits_ldst(_dispatcher_io_dis_uops_1_0_bits_ldst),
		.io_dis_uops_0_bits_lrs1(_dispatcher_io_dis_uops_1_0_bits_lrs1),
		.io_dis_uops_0_bits_lrs2(_dispatcher_io_dis_uops_1_0_bits_lrs2),
		.io_dis_uops_0_bits_lrs3(_dispatcher_io_dis_uops_1_0_bits_lrs3),
		.io_dis_uops_0_bits_dst_rtype(_dispatcher_io_dis_uops_1_0_bits_dst_rtype),
		.io_dis_uops_0_bits_lrs1_rtype(_dispatcher_io_dis_uops_1_0_bits_lrs1_rtype),
		.io_dis_uops_0_bits_lrs2_rtype(_dispatcher_io_dis_uops_1_0_bits_lrs2_rtype),
		.io_dis_uops_0_bits_frs3_en(_dispatcher_io_dis_uops_1_0_bits_frs3_en),
		.io_dis_uops_0_bits_fcn_dw(_dispatcher_io_dis_uops_1_0_bits_fcn_dw),
		.io_dis_uops_0_bits_fcn_op(_dispatcher_io_dis_uops_1_0_bits_fcn_op),
		.io_dis_uops_0_bits_fp_val(_dispatcher_io_dis_uops_1_0_bits_fp_val),
		.io_dis_uops_0_bits_fp_rm(_dispatcher_io_dis_uops_1_0_bits_fp_rm),
		.io_dis_uops_0_bits_fp_typ(_dispatcher_io_dis_uops_1_0_bits_fp_typ),
		.io_dis_uops_0_bits_xcpt_pf_if(_dispatcher_io_dis_uops_1_0_bits_xcpt_pf_if),
		.io_dis_uops_0_bits_xcpt_ae_if(_dispatcher_io_dis_uops_1_0_bits_xcpt_ae_if),
		.io_dis_uops_0_bits_xcpt_ma_if(_dispatcher_io_dis_uops_1_0_bits_xcpt_ma_if),
		.io_dis_uops_0_bits_bp_debug_if(_dispatcher_io_dis_uops_1_0_bits_bp_debug_if),
		.io_dis_uops_0_bits_bp_xcpt_if(_dispatcher_io_dis_uops_1_0_bits_bp_xcpt_if),
		.io_dis_uops_0_bits_debug_fsrc(_dispatcher_io_dis_uops_1_0_bits_debug_fsrc),
		.io_dis_uops_0_bits_debug_tsrc(_dispatcher_io_dis_uops_1_0_bits_debug_tsrc),
		.io_iss_uops_0_valid(_unq_iss_unit_io_iss_uops_0_valid),
		.io_iss_uops_0_bits_inst(_unq_iss_unit_io_iss_uops_0_bits_inst),
		.io_iss_uops_0_bits_debug_inst(_unq_iss_unit_io_iss_uops_0_bits_debug_inst),
		.io_iss_uops_0_bits_is_rvc(_unq_iss_unit_io_iss_uops_0_bits_is_rvc),
		.io_iss_uops_0_bits_debug_pc(_unq_iss_unit_io_iss_uops_0_bits_debug_pc),
		.io_iss_uops_0_bits_iq_type_0(_unq_iss_unit_io_iss_uops_0_bits_iq_type_0),
		.io_iss_uops_0_bits_iq_type_1(_unq_iss_unit_io_iss_uops_0_bits_iq_type_1),
		.io_iss_uops_0_bits_iq_type_2(_unq_iss_unit_io_iss_uops_0_bits_iq_type_2),
		.io_iss_uops_0_bits_iq_type_3(_unq_iss_unit_io_iss_uops_0_bits_iq_type_3),
		.io_iss_uops_0_bits_fu_code_0(_unq_iss_unit_io_iss_uops_0_bits_fu_code_0),
		.io_iss_uops_0_bits_fu_code_1(_unq_iss_unit_io_iss_uops_0_bits_fu_code_1),
		.io_iss_uops_0_bits_fu_code_2(_unq_iss_unit_io_iss_uops_0_bits_fu_code_2),
		.io_iss_uops_0_bits_fu_code_3(_unq_iss_unit_io_iss_uops_0_bits_fu_code_3),
		.io_iss_uops_0_bits_fu_code_4(_unq_iss_unit_io_iss_uops_0_bits_fu_code_4),
		.io_iss_uops_0_bits_fu_code_5(_unq_iss_unit_io_iss_uops_0_bits_fu_code_5),
		.io_iss_uops_0_bits_fu_code_6(_unq_iss_unit_io_iss_uops_0_bits_fu_code_6),
		.io_iss_uops_0_bits_fu_code_7(_unq_iss_unit_io_iss_uops_0_bits_fu_code_7),
		.io_iss_uops_0_bits_fu_code_8(_unq_iss_unit_io_iss_uops_0_bits_fu_code_8),
		.io_iss_uops_0_bits_fu_code_9(_unq_iss_unit_io_iss_uops_0_bits_fu_code_9),
		.io_iss_uops_0_bits_iw_issued(_unq_iss_unit_io_iss_uops_0_bits_iw_issued),
		.io_iss_uops_0_bits_iw_p1_speculative_child(_unq_iss_unit_io_iss_uops_0_bits_iw_p1_speculative_child),
		.io_iss_uops_0_bits_iw_p2_speculative_child(_unq_iss_unit_io_iss_uops_0_bits_iw_p2_speculative_child),
		.io_iss_uops_0_bits_iw_p1_bypass_hint(_unq_iss_unit_io_iss_uops_0_bits_iw_p1_bypass_hint),
		.io_iss_uops_0_bits_iw_p2_bypass_hint(_unq_iss_unit_io_iss_uops_0_bits_iw_p2_bypass_hint),
		.io_iss_uops_0_bits_iw_p3_bypass_hint(_unq_iss_unit_io_iss_uops_0_bits_iw_p3_bypass_hint),
		.io_iss_uops_0_bits_dis_col_sel(_unq_iss_unit_io_iss_uops_0_bits_dis_col_sel),
		.io_iss_uops_0_bits_br_mask(_unq_iss_unit_io_iss_uops_0_bits_br_mask),
		.io_iss_uops_0_bits_br_tag(_unq_iss_unit_io_iss_uops_0_bits_br_tag),
		.io_iss_uops_0_bits_br_type(_unq_iss_unit_io_iss_uops_0_bits_br_type),
		.io_iss_uops_0_bits_is_sfb(_unq_iss_unit_io_iss_uops_0_bits_is_sfb),
		.io_iss_uops_0_bits_is_fence(_unq_iss_unit_io_iss_uops_0_bits_is_fence),
		.io_iss_uops_0_bits_is_fencei(_unq_iss_unit_io_iss_uops_0_bits_is_fencei),
		.io_iss_uops_0_bits_is_sfence(_unq_iss_unit_io_iss_uops_0_bits_is_sfence),
		.io_iss_uops_0_bits_is_amo(_unq_iss_unit_io_iss_uops_0_bits_is_amo),
		.io_iss_uops_0_bits_is_eret(_unq_iss_unit_io_iss_uops_0_bits_is_eret),
		.io_iss_uops_0_bits_is_sys_pc2epc(_unq_iss_unit_io_iss_uops_0_bits_is_sys_pc2epc),
		.io_iss_uops_0_bits_is_rocc(_unq_iss_unit_io_iss_uops_0_bits_is_rocc),
		.io_iss_uops_0_bits_is_mov(_unq_iss_unit_io_iss_uops_0_bits_is_mov),
		.io_iss_uops_0_bits_ftq_idx(_unq_iss_unit_io_iss_uops_0_bits_ftq_idx),
		.io_iss_uops_0_bits_edge_inst(_unq_iss_unit_io_iss_uops_0_bits_edge_inst),
		.io_iss_uops_0_bits_pc_lob(_unq_iss_unit_io_iss_uops_0_bits_pc_lob),
		.io_iss_uops_0_bits_taken(_unq_iss_unit_io_iss_uops_0_bits_taken),
		.io_iss_uops_0_bits_imm_rename(_unq_iss_unit_io_iss_uops_0_bits_imm_rename),
		.io_iss_uops_0_bits_imm_sel(_unq_iss_unit_io_iss_uops_0_bits_imm_sel),
		.io_iss_uops_0_bits_pimm(_unq_iss_unit_io_iss_uops_0_bits_pimm),
		.io_iss_uops_0_bits_imm_packed(_unq_iss_unit_io_iss_uops_0_bits_imm_packed),
		.io_iss_uops_0_bits_op1_sel(_unq_iss_unit_io_iss_uops_0_bits_op1_sel),
		.io_iss_uops_0_bits_op2_sel(_unq_iss_unit_io_iss_uops_0_bits_op2_sel),
		.io_iss_uops_0_bits_fp_ctrl_ldst(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_ldst),
		.io_iss_uops_0_bits_fp_ctrl_wen(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_wen),
		.io_iss_uops_0_bits_fp_ctrl_ren1(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_ren1),
		.io_iss_uops_0_bits_fp_ctrl_ren2(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_ren2),
		.io_iss_uops_0_bits_fp_ctrl_ren3(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_ren3),
		.io_iss_uops_0_bits_fp_ctrl_swap12(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_swap12),
		.io_iss_uops_0_bits_fp_ctrl_swap23(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_swap23),
		.io_iss_uops_0_bits_fp_ctrl_typeTagIn(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_typeTagIn),
		.io_iss_uops_0_bits_fp_ctrl_typeTagOut(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_typeTagOut),
		.io_iss_uops_0_bits_fp_ctrl_fromint(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_fromint),
		.io_iss_uops_0_bits_fp_ctrl_toint(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_toint),
		.io_iss_uops_0_bits_fp_ctrl_fastpipe(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_fastpipe),
		.io_iss_uops_0_bits_fp_ctrl_fma(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_fma),
		.io_iss_uops_0_bits_fp_ctrl_div(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_div),
		.io_iss_uops_0_bits_fp_ctrl_sqrt(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_sqrt),
		.io_iss_uops_0_bits_fp_ctrl_wflags(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_wflags),
		.io_iss_uops_0_bits_fp_ctrl_vec(_unq_iss_unit_io_iss_uops_0_bits_fp_ctrl_vec),
		.io_iss_uops_0_bits_rob_idx(_unq_iss_unit_io_iss_uops_0_bits_rob_idx),
		.io_iss_uops_0_bits_ldq_idx(_unq_iss_unit_io_iss_uops_0_bits_ldq_idx),
		.io_iss_uops_0_bits_stq_idx(_unq_iss_unit_io_iss_uops_0_bits_stq_idx),
		.io_iss_uops_0_bits_rxq_idx(_unq_iss_unit_io_iss_uops_0_bits_rxq_idx),
		.io_iss_uops_0_bits_pdst(_unq_iss_unit_io_iss_uops_0_bits_pdst),
		.io_iss_uops_0_bits_prs1(_unq_iss_unit_io_iss_uops_0_bits_prs1),
		.io_iss_uops_0_bits_prs2(_unq_iss_unit_io_iss_uops_0_bits_prs2),
		.io_iss_uops_0_bits_prs3(_unq_iss_unit_io_iss_uops_0_bits_prs3),
		.io_iss_uops_0_bits_ppred(_unq_iss_unit_io_iss_uops_0_bits_ppred),
		.io_iss_uops_0_bits_prs1_busy(_unq_iss_unit_io_iss_uops_0_bits_prs1_busy),
		.io_iss_uops_0_bits_prs2_busy(_unq_iss_unit_io_iss_uops_0_bits_prs2_busy),
		.io_iss_uops_0_bits_prs3_busy(_unq_iss_unit_io_iss_uops_0_bits_prs3_busy),
		.io_iss_uops_0_bits_ppred_busy(_unq_iss_unit_io_iss_uops_0_bits_ppred_busy),
		.io_iss_uops_0_bits_stale_pdst(_unq_iss_unit_io_iss_uops_0_bits_stale_pdst),
		.io_iss_uops_0_bits_exception(_unq_iss_unit_io_iss_uops_0_bits_exception),
		.io_iss_uops_0_bits_exc_cause(_unq_iss_unit_io_iss_uops_0_bits_exc_cause),
		.io_iss_uops_0_bits_mem_cmd(_unq_iss_unit_io_iss_uops_0_bits_mem_cmd),
		.io_iss_uops_0_bits_mem_size(_unq_iss_unit_io_iss_uops_0_bits_mem_size),
		.io_iss_uops_0_bits_mem_signed(_unq_iss_unit_io_iss_uops_0_bits_mem_signed),
		.io_iss_uops_0_bits_uses_ldq(_unq_iss_unit_io_iss_uops_0_bits_uses_ldq),
		.io_iss_uops_0_bits_uses_stq(_unq_iss_unit_io_iss_uops_0_bits_uses_stq),
		.io_iss_uops_0_bits_is_unique(_unq_iss_unit_io_iss_uops_0_bits_is_unique),
		.io_iss_uops_0_bits_flush_on_commit(_unq_iss_unit_io_iss_uops_0_bits_flush_on_commit),
		.io_iss_uops_0_bits_csr_cmd(_unq_iss_unit_io_iss_uops_0_bits_csr_cmd),
		.io_iss_uops_0_bits_ldst_is_rs1(_unq_iss_unit_io_iss_uops_0_bits_ldst_is_rs1),
		.io_iss_uops_0_bits_ldst(_unq_iss_unit_io_iss_uops_0_bits_ldst),
		.io_iss_uops_0_bits_lrs1(_unq_iss_unit_io_iss_uops_0_bits_lrs1),
		.io_iss_uops_0_bits_lrs2(_unq_iss_unit_io_iss_uops_0_bits_lrs2),
		.io_iss_uops_0_bits_lrs3(_unq_iss_unit_io_iss_uops_0_bits_lrs3),
		.io_iss_uops_0_bits_dst_rtype(_unq_iss_unit_io_iss_uops_0_bits_dst_rtype),
		.io_iss_uops_0_bits_lrs1_rtype(_unq_iss_unit_io_iss_uops_0_bits_lrs1_rtype),
		.io_iss_uops_0_bits_lrs2_rtype(_unq_iss_unit_io_iss_uops_0_bits_lrs2_rtype),
		.io_iss_uops_0_bits_frs3_en(_unq_iss_unit_io_iss_uops_0_bits_frs3_en),
		.io_iss_uops_0_bits_fcn_dw(_unq_iss_unit_io_iss_uops_0_bits_fcn_dw),
		.io_iss_uops_0_bits_fcn_op(_unq_iss_unit_io_iss_uops_0_bits_fcn_op),
		.io_iss_uops_0_bits_fp_val(_unq_iss_unit_io_iss_uops_0_bits_fp_val),
		.io_iss_uops_0_bits_xcpt_pf_if(_unq_iss_unit_io_iss_uops_0_bits_xcpt_pf_if),
		.io_iss_uops_0_bits_xcpt_ae_if(_unq_iss_unit_io_iss_uops_0_bits_xcpt_ae_if),
		.io_iss_uops_0_bits_xcpt_ma_if(_unq_iss_unit_io_iss_uops_0_bits_xcpt_ma_if),
		.io_iss_uops_0_bits_bp_debug_if(_unq_iss_unit_io_iss_uops_0_bits_bp_debug_if),
		.io_iss_uops_0_bits_bp_xcpt_if(_unq_iss_unit_io_iss_uops_0_bits_bp_xcpt_if),
		.io_iss_uops_0_bits_debug_fsrc(_unq_iss_unit_io_iss_uops_0_bits_debug_fsrc),
		.io_iss_uops_0_bits_debug_tsrc(_unq_iss_unit_io_iss_uops_0_bits_debug_tsrc),
		.io_wakeup_ports_0_valid(io_lsu_iwakeups_0_valid),
		.io_wakeup_ports_0_bits_uop_pdst(io_lsu_iwakeups_0_bits_uop_pdst),
		.io_wakeup_ports_0_bits_bypassable(io_lsu_iwakeups_0_bits_bypassable),
		.io_wakeup_ports_0_bits_rebusy(io_lsu_iwakeups_0_bits_rebusy),
		.io_wakeup_ports_1_valid(int_wakeups_1_valid),
		.io_wakeup_ports_1_bits_uop_pdst(_ll_arb_io_out_bits_uop_pdst),
		.io_wakeup_ports_2_valid(_alu_exe_unit_0_io_fast_wakeup_valid),
		.io_wakeup_ports_2_bits_uop_pdst(_alu_exe_unit_0_io_fast_wakeup_bits_uop_pdst),
		.io_child_rebusys(_alu_exe_unit_0_io_child_rebusy),
		.io_fu_types_0_4(_unique_exe_unit_0_io_ready_fu_types_4),
		.io_fu_types_0_8(_unique_exe_unit_0_io_ready_fu_types_8),
		.io_brupdate_b1_resolve_mask(b1_resolve_mask),
		.io_brupdate_b1_mispredict_mask(b1_mispredict_mask),
		.io_flush_pipeline(unq_iss_unit_io_flush_pipeline_REG),
		.io_squash_grant((_unique_exe_unit_0_io_squash_iss | _alu_exe_unit_0_io_squash_iss) | io_lsu_iwakeups_0_bits_rebusy)
	);
	IssueUnitCollapsing_3 alu_iss_unit(
		.clock(clock),
		.reset(reset),
		.io_dis_uops_0_ready(_alu_iss_unit_io_dis_uops_0_ready),
		.io_dis_uops_0_valid(_dispatcher_io_dis_uops_2_0_valid),
		.io_dis_uops_0_bits_inst(_dispatcher_io_dis_uops_2_0_bits_inst),
		.io_dis_uops_0_bits_debug_inst(_dispatcher_io_dis_uops_2_0_bits_debug_inst),
		.io_dis_uops_0_bits_is_rvc(_dispatcher_io_dis_uops_2_0_bits_is_rvc),
		.io_dis_uops_0_bits_debug_pc(_dispatcher_io_dis_uops_2_0_bits_debug_pc),
		.io_dis_uops_0_bits_iq_type_0(_dispatcher_io_dis_uops_2_0_bits_iq_type_0),
		.io_dis_uops_0_bits_iq_type_1(_dispatcher_io_dis_uops_2_0_bits_iq_type_1),
		.io_dis_uops_0_bits_iq_type_2(_dispatcher_io_dis_uops_2_0_bits_iq_type_2),
		.io_dis_uops_0_bits_iq_type_3(_dispatcher_io_dis_uops_2_0_bits_iq_type_3),
		.io_dis_uops_0_bits_fu_code_0(_dispatcher_io_dis_uops_2_0_bits_fu_code_0),
		.io_dis_uops_0_bits_fu_code_1(_dispatcher_io_dis_uops_2_0_bits_fu_code_1),
		.io_dis_uops_0_bits_fu_code_2(_dispatcher_io_dis_uops_2_0_bits_fu_code_2),
		.io_dis_uops_0_bits_fu_code_3(_dispatcher_io_dis_uops_2_0_bits_fu_code_3),
		.io_dis_uops_0_bits_fu_code_4(_dispatcher_io_dis_uops_2_0_bits_fu_code_4),
		.io_dis_uops_0_bits_fu_code_5(_dispatcher_io_dis_uops_2_0_bits_fu_code_5),
		.io_dis_uops_0_bits_fu_code_6(_dispatcher_io_dis_uops_2_0_bits_fu_code_6),
		.io_dis_uops_0_bits_fu_code_7(_dispatcher_io_dis_uops_2_0_bits_fu_code_7),
		.io_dis_uops_0_bits_fu_code_8(_dispatcher_io_dis_uops_2_0_bits_fu_code_8),
		.io_dis_uops_0_bits_fu_code_9(_dispatcher_io_dis_uops_2_0_bits_fu_code_9),
		.io_dis_uops_0_bits_iw_p1_speculative_child(_dispatcher_io_dis_uops_2_0_bits_iw_p1_speculative_child),
		.io_dis_uops_0_bits_iw_p2_speculative_child(_dispatcher_io_dis_uops_2_0_bits_iw_p2_speculative_child),
		.io_dis_uops_0_bits_br_mask(_dispatcher_io_dis_uops_2_0_bits_br_mask),
		.io_dis_uops_0_bits_br_tag(_dispatcher_io_dis_uops_2_0_bits_br_tag),
		.io_dis_uops_0_bits_br_type(_dispatcher_io_dis_uops_2_0_bits_br_type),
		.io_dis_uops_0_bits_is_sfb(_dispatcher_io_dis_uops_2_0_bits_is_sfb),
		.io_dis_uops_0_bits_is_fence(_dispatcher_io_dis_uops_2_0_bits_is_fence),
		.io_dis_uops_0_bits_is_fencei(_dispatcher_io_dis_uops_2_0_bits_is_fencei),
		.io_dis_uops_0_bits_is_sfence(_dispatcher_io_dis_uops_2_0_bits_is_sfence),
		.io_dis_uops_0_bits_is_amo(_dispatcher_io_dis_uops_2_0_bits_is_amo),
		.io_dis_uops_0_bits_is_eret(_dispatcher_io_dis_uops_2_0_bits_is_eret),
		.io_dis_uops_0_bits_is_sys_pc2epc(_dispatcher_io_dis_uops_2_0_bits_is_sys_pc2epc),
		.io_dis_uops_0_bits_is_rocc(_dispatcher_io_dis_uops_2_0_bits_is_rocc),
		.io_dis_uops_0_bits_is_mov(_dispatcher_io_dis_uops_2_0_bits_is_mov),
		.io_dis_uops_0_bits_ftq_idx(_dispatcher_io_dis_uops_2_0_bits_ftq_idx),
		.io_dis_uops_0_bits_edge_inst(_dispatcher_io_dis_uops_2_0_bits_edge_inst),
		.io_dis_uops_0_bits_pc_lob(_dispatcher_io_dis_uops_2_0_bits_pc_lob),
		.io_dis_uops_0_bits_taken(_dispatcher_io_dis_uops_2_0_bits_taken),
		.io_dis_uops_0_bits_imm_rename(_dispatcher_io_dis_uops_2_0_bits_imm_rename),
		.io_dis_uops_0_bits_imm_sel(_dispatcher_io_dis_uops_2_0_bits_imm_sel),
		.io_dis_uops_0_bits_pimm(_dispatcher_io_dis_uops_2_0_bits_pimm),
		.io_dis_uops_0_bits_imm_packed(_dispatcher_io_dis_uops_2_0_bits_imm_packed),
		.io_dis_uops_0_bits_op1_sel(_dispatcher_io_dis_uops_2_0_bits_op1_sel),
		.io_dis_uops_0_bits_op2_sel(_dispatcher_io_dis_uops_2_0_bits_op2_sel),
		.io_dis_uops_0_bits_fp_ctrl_ldst(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_ldst),
		.io_dis_uops_0_bits_fp_ctrl_wen(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_wen),
		.io_dis_uops_0_bits_fp_ctrl_ren1(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_ren1),
		.io_dis_uops_0_bits_fp_ctrl_ren2(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_ren2),
		.io_dis_uops_0_bits_fp_ctrl_ren3(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_ren3),
		.io_dis_uops_0_bits_fp_ctrl_swap12(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_swap12),
		.io_dis_uops_0_bits_fp_ctrl_swap23(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_swap23),
		.io_dis_uops_0_bits_fp_ctrl_typeTagIn(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_typeTagIn),
		.io_dis_uops_0_bits_fp_ctrl_typeTagOut(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_typeTagOut),
		.io_dis_uops_0_bits_fp_ctrl_fromint(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_fromint),
		.io_dis_uops_0_bits_fp_ctrl_toint(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_toint),
		.io_dis_uops_0_bits_fp_ctrl_fastpipe(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_fastpipe),
		.io_dis_uops_0_bits_fp_ctrl_fma(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_fma),
		.io_dis_uops_0_bits_fp_ctrl_div(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_div),
		.io_dis_uops_0_bits_fp_ctrl_sqrt(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_sqrt),
		.io_dis_uops_0_bits_fp_ctrl_wflags(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_wflags),
		.io_dis_uops_0_bits_fp_ctrl_vec(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_vec),
		.io_dis_uops_0_bits_rob_idx(_dispatcher_io_dis_uops_2_0_bits_rob_idx),
		.io_dis_uops_0_bits_ldq_idx(_dispatcher_io_dis_uops_2_0_bits_ldq_idx),
		.io_dis_uops_0_bits_stq_idx(_dispatcher_io_dis_uops_2_0_bits_stq_idx),
		.io_dis_uops_0_bits_rxq_idx(_dispatcher_io_dis_uops_2_0_bits_rxq_idx),
		.io_dis_uops_0_bits_pdst(_dispatcher_io_dis_uops_2_0_bits_pdst),
		.io_dis_uops_0_bits_prs1(_dispatcher_io_dis_uops_2_0_bits_prs1),
		.io_dis_uops_0_bits_prs2(_dispatcher_io_dis_uops_2_0_bits_prs2),
		.io_dis_uops_0_bits_prs3(_dispatcher_io_dis_uops_2_0_bits_prs3),
		.io_dis_uops_0_bits_ppred(_dispatcher_io_dis_uops_2_0_bits_ppred),
		.io_dis_uops_0_bits_prs1_busy(_dispatcher_io_dis_uops_2_0_bits_prs1_busy),
		.io_dis_uops_0_bits_prs2_busy(_dispatcher_io_dis_uops_2_0_bits_prs2_busy),
		.io_dis_uops_0_bits_prs3_busy(_dispatcher_io_dis_uops_2_0_bits_prs3_busy),
		.io_dis_uops_0_bits_ppred_busy(_dispatcher_io_dis_uops_2_0_bits_ppred_busy),
		.io_dis_uops_0_bits_stale_pdst(_dispatcher_io_dis_uops_2_0_bits_stale_pdst),
		.io_dis_uops_0_bits_exception(_dispatcher_io_dis_uops_2_0_bits_exception),
		.io_dis_uops_0_bits_exc_cause(_dispatcher_io_dis_uops_2_0_bits_exc_cause),
		.io_dis_uops_0_bits_mem_cmd(_dispatcher_io_dis_uops_2_0_bits_mem_cmd),
		.io_dis_uops_0_bits_mem_size(_dispatcher_io_dis_uops_2_0_bits_mem_size),
		.io_dis_uops_0_bits_mem_signed(_dispatcher_io_dis_uops_2_0_bits_mem_signed),
		.io_dis_uops_0_bits_uses_ldq(_dispatcher_io_dis_uops_2_0_bits_uses_ldq),
		.io_dis_uops_0_bits_uses_stq(_dispatcher_io_dis_uops_2_0_bits_uses_stq),
		.io_dis_uops_0_bits_is_unique(_dispatcher_io_dis_uops_2_0_bits_is_unique),
		.io_dis_uops_0_bits_flush_on_commit(_dispatcher_io_dis_uops_2_0_bits_flush_on_commit),
		.io_dis_uops_0_bits_csr_cmd(_dispatcher_io_dis_uops_2_0_bits_csr_cmd),
		.io_dis_uops_0_bits_ldst_is_rs1(_dispatcher_io_dis_uops_2_0_bits_ldst_is_rs1),
		.io_dis_uops_0_bits_ldst(_dispatcher_io_dis_uops_2_0_bits_ldst),
		.io_dis_uops_0_bits_lrs1(_dispatcher_io_dis_uops_2_0_bits_lrs1),
		.io_dis_uops_0_bits_lrs2(_dispatcher_io_dis_uops_2_0_bits_lrs2),
		.io_dis_uops_0_bits_lrs3(_dispatcher_io_dis_uops_2_0_bits_lrs3),
		.io_dis_uops_0_bits_dst_rtype(_dispatcher_io_dis_uops_2_0_bits_dst_rtype),
		.io_dis_uops_0_bits_lrs1_rtype(_dispatcher_io_dis_uops_2_0_bits_lrs1_rtype),
		.io_dis_uops_0_bits_lrs2_rtype(_dispatcher_io_dis_uops_2_0_bits_lrs2_rtype),
		.io_dis_uops_0_bits_frs3_en(_dispatcher_io_dis_uops_2_0_bits_frs3_en),
		.io_dis_uops_0_bits_fcn_dw(_dispatcher_io_dis_uops_2_0_bits_fcn_dw),
		.io_dis_uops_0_bits_fcn_op(_dispatcher_io_dis_uops_2_0_bits_fcn_op),
		.io_dis_uops_0_bits_fp_val(_dispatcher_io_dis_uops_2_0_bits_fp_val),
		.io_dis_uops_0_bits_xcpt_pf_if(_dispatcher_io_dis_uops_2_0_bits_xcpt_pf_if),
		.io_dis_uops_0_bits_xcpt_ae_if(_dispatcher_io_dis_uops_2_0_bits_xcpt_ae_if),
		.io_dis_uops_0_bits_xcpt_ma_if(_dispatcher_io_dis_uops_2_0_bits_xcpt_ma_if),
		.io_dis_uops_0_bits_bp_debug_if(_dispatcher_io_dis_uops_2_0_bits_bp_debug_if),
		.io_dis_uops_0_bits_bp_xcpt_if(_dispatcher_io_dis_uops_2_0_bits_bp_xcpt_if),
		.io_dis_uops_0_bits_debug_fsrc(_dispatcher_io_dis_uops_2_0_bits_debug_fsrc),
		.io_dis_uops_0_bits_debug_tsrc(_dispatcher_io_dis_uops_2_0_bits_debug_tsrc),
		.io_iss_uops_0_valid(_alu_iss_unit_io_iss_uops_0_valid),
		.io_iss_uops_0_bits_is_rvc(_alu_iss_unit_io_iss_uops_0_bits_is_rvc),
		.io_iss_uops_0_bits_fu_code_0(_alu_iss_unit_io_iss_uops_0_bits_fu_code_0),
		.io_iss_uops_0_bits_iw_p1_bypass_hint(_alu_iss_unit_io_iss_uops_0_bits_iw_p1_bypass_hint),
		.io_iss_uops_0_bits_iw_p2_bypass_hint(_alu_iss_unit_io_iss_uops_0_bits_iw_p2_bypass_hint),
		.io_iss_uops_0_bits_br_mask(_alu_iss_unit_io_iss_uops_0_bits_br_mask),
		.io_iss_uops_0_bits_br_tag(_alu_iss_unit_io_iss_uops_0_bits_br_tag),
		.io_iss_uops_0_bits_br_type(_alu_iss_unit_io_iss_uops_0_bits_br_type),
		.io_iss_uops_0_bits_is_sfb(_alu_iss_unit_io_iss_uops_0_bits_is_sfb),
		.io_iss_uops_0_bits_is_mov(_alu_iss_unit_io_iss_uops_0_bits_is_mov),
		.io_iss_uops_0_bits_ftq_idx(_alu_iss_unit_io_iss_uops_0_bits_ftq_idx),
		.io_iss_uops_0_bits_edge_inst(_alu_iss_unit_io_iss_uops_0_bits_edge_inst),
		.io_iss_uops_0_bits_pc_lob(_alu_iss_unit_io_iss_uops_0_bits_pc_lob),
		.io_iss_uops_0_bits_taken(_alu_iss_unit_io_iss_uops_0_bits_taken),
		.io_iss_uops_0_bits_imm_sel(_alu_iss_unit_io_iss_uops_0_bits_imm_sel),
		.io_iss_uops_0_bits_pimm(_alu_iss_unit_io_iss_uops_0_bits_pimm),
		.io_iss_uops_0_bits_op1_sel(_alu_iss_unit_io_iss_uops_0_bits_op1_sel),
		.io_iss_uops_0_bits_op2_sel(_alu_iss_unit_io_iss_uops_0_bits_op2_sel),
		.io_iss_uops_0_bits_rob_idx(_alu_iss_unit_io_iss_uops_0_bits_rob_idx),
		.io_iss_uops_0_bits_pdst(_alu_iss_unit_io_iss_uops_0_bits_pdst),
		.io_iss_uops_0_bits_prs1(_alu_iss_unit_io_iss_uops_0_bits_prs1),
		.io_iss_uops_0_bits_prs2(_alu_iss_unit_io_iss_uops_0_bits_prs2),
		.io_iss_uops_0_bits_ppred(_alu_iss_unit_io_iss_uops_0_bits_ppred),
		.io_iss_uops_0_bits_csr_cmd(_alu_iss_unit_io_iss_uops_0_bits_csr_cmd),
		.io_iss_uops_0_bits_ldst_is_rs1(_alu_iss_unit_io_iss_uops_0_bits_ldst_is_rs1),
		.io_iss_uops_0_bits_dst_rtype(_alu_iss_unit_io_iss_uops_0_bits_dst_rtype),
		.io_iss_uops_0_bits_lrs1_rtype(_alu_iss_unit_io_iss_uops_0_bits_lrs1_rtype),
		.io_iss_uops_0_bits_lrs2_rtype(_alu_iss_unit_io_iss_uops_0_bits_lrs2_rtype),
		.io_iss_uops_0_bits_fcn_dw(_alu_iss_unit_io_iss_uops_0_bits_fcn_dw),
		.io_iss_uops_0_bits_fcn_op(_alu_iss_unit_io_iss_uops_0_bits_fcn_op),
		.io_wakeup_ports_0_valid(io_lsu_iwakeups_0_valid),
		.io_wakeup_ports_0_bits_uop_pdst(io_lsu_iwakeups_0_bits_uop_pdst),
		.io_wakeup_ports_0_bits_bypassable(io_lsu_iwakeups_0_bits_bypassable),
		.io_wakeup_ports_0_bits_rebusy(io_lsu_iwakeups_0_bits_rebusy),
		.io_wakeup_ports_1_valid(int_wakeups_1_valid),
		.io_wakeup_ports_1_bits_uop_pdst(_ll_arb_io_out_bits_uop_pdst),
		.io_wakeup_ports_2_valid(_alu_exe_unit_0_io_fast_wakeup_valid),
		.io_wakeup_ports_2_bits_uop_pdst(_alu_exe_unit_0_io_fast_wakeup_bits_uop_pdst),
		.io_pred_wakeup_port_valid(_alu_exe_unit_0_io_fast_pred_wakeup_valid),
		.io_pred_wakeup_port_bits(_alu_exe_unit_0_io_fast_pred_wakeup_bits_uop_pdst[3:0]),
		.io_child_rebusys(_alu_exe_unit_0_io_child_rebusy),
		.io_brupdate_b1_resolve_mask(b1_resolve_mask),
		.io_brupdate_b1_mispredict_mask(b1_mispredict_mask),
		.io_flush_pipeline(alu_iss_unit_io_flush_pipeline_REG),
		.io_squash_grant(_alu_exe_unit_0_io_squash_iss | io_lsu_iwakeups_0_bits_rebusy)
	);
	BasicDispatcher dispatcher(
		.io_ren_uops_0_ready(_dispatcher_io_ren_uops_0_ready),
		.io_ren_uops_0_valid(dis_fire_0),
		.io_ren_uops_0_bits_inst(_rename_stage_io_ren2_uops_0_inst),
		.io_ren_uops_0_bits_debug_inst(_rename_stage_io_ren2_uops_0_debug_inst),
		.io_ren_uops_0_bits_is_rvc(_rename_stage_io_ren2_uops_0_is_rvc),
		.io_ren_uops_0_bits_debug_pc(_rename_stage_io_ren2_uops_0_debug_pc),
		.io_ren_uops_0_bits_iq_type_0(_rename_stage_io_ren2_uops_0_iq_type_0),
		.io_ren_uops_0_bits_iq_type_1(_rename_stage_io_ren2_uops_0_iq_type_1),
		.io_ren_uops_0_bits_iq_type_2(_rename_stage_io_ren2_uops_0_iq_type_2),
		.io_ren_uops_0_bits_iq_type_3(_rename_stage_io_ren2_uops_0_iq_type_3),
		.io_ren_uops_0_bits_fu_code_0(_rename_stage_io_ren2_uops_0_fu_code_0),
		.io_ren_uops_0_bits_fu_code_1(_rename_stage_io_ren2_uops_0_fu_code_1),
		.io_ren_uops_0_bits_fu_code_2(_rename_stage_io_ren2_uops_0_fu_code_2),
		.io_ren_uops_0_bits_fu_code_3(_rename_stage_io_ren2_uops_0_fu_code_3),
		.io_ren_uops_0_bits_fu_code_4(_rename_stage_io_ren2_uops_0_fu_code_4),
		.io_ren_uops_0_bits_fu_code_5(_rename_stage_io_ren2_uops_0_fu_code_5),
		.io_ren_uops_0_bits_fu_code_6(_rename_stage_io_ren2_uops_0_fu_code_6),
		.io_ren_uops_0_bits_fu_code_7(_rename_stage_io_ren2_uops_0_fu_code_7),
		.io_ren_uops_0_bits_fu_code_8(_rename_stage_io_ren2_uops_0_fu_code_8),
		.io_ren_uops_0_bits_fu_code_9(_rename_stage_io_ren2_uops_0_fu_code_9),
		.io_ren_uops_0_bits_iw_p1_speculative_child(_rename_stage_io_ren2_uops_0_iw_p1_speculative_child),
		.io_ren_uops_0_bits_iw_p2_speculative_child(_rename_stage_io_ren2_uops_0_iw_p2_speculative_child),
		.io_ren_uops_0_bits_br_mask(_rename_stage_io_ren2_uops_0_br_mask),
		.io_ren_uops_0_bits_br_tag(_rename_stage_io_ren2_uops_0_br_tag),
		.io_ren_uops_0_bits_br_type(_rename_stage_io_ren2_uops_0_br_type),
		.io_ren_uops_0_bits_is_sfb(_rename_stage_io_ren2_uops_0_is_sfb),
		.io_ren_uops_0_bits_is_fence(_rename_stage_io_ren2_uops_0_is_fence),
		.io_ren_uops_0_bits_is_fencei(_rename_stage_io_ren2_uops_0_is_fencei),
		.io_ren_uops_0_bits_is_sfence(_rename_stage_io_ren2_uops_0_is_sfence),
		.io_ren_uops_0_bits_is_amo(_rename_stage_io_ren2_uops_0_is_amo),
		.io_ren_uops_0_bits_is_eret(_rename_stage_io_ren2_uops_0_is_eret),
		.io_ren_uops_0_bits_is_sys_pc2epc(_rename_stage_io_ren2_uops_0_is_sys_pc2epc),
		.io_ren_uops_0_bits_is_rocc(_rename_stage_io_ren2_uops_0_is_rocc),
		.io_ren_uops_0_bits_is_mov(_rename_stage_io_ren2_uops_0_is_mov),
		.io_ren_uops_0_bits_ftq_idx(_rename_stage_io_ren2_uops_0_ftq_idx),
		.io_ren_uops_0_bits_edge_inst(_rename_stage_io_ren2_uops_0_edge_inst),
		.io_ren_uops_0_bits_pc_lob(_rename_stage_io_ren2_uops_0_pc_lob),
		.io_ren_uops_0_bits_taken(_rename_stage_io_ren2_uops_0_taken),
		.io_ren_uops_0_bits_imm_rename(_rename_stage_io_ren2_uops_0_imm_rename),
		.io_ren_uops_0_bits_imm_sel(_imm_rename_stage_io_ren2_uops_0_imm_sel),
		.io_ren_uops_0_bits_pimm(_imm_rename_stage_io_ren2_uops_0_pimm),
		.io_ren_uops_0_bits_imm_packed(_rename_stage_io_ren2_uops_0_imm_packed),
		.io_ren_uops_0_bits_op1_sel(_rename_stage_io_ren2_uops_0_op1_sel),
		.io_ren_uops_0_bits_op2_sel(_rename_stage_io_ren2_uops_0_op2_sel),
		.io_ren_uops_0_bits_fp_ctrl_ldst(_rename_stage_io_ren2_uops_0_fp_ctrl_ldst),
		.io_ren_uops_0_bits_fp_ctrl_wen(_rename_stage_io_ren2_uops_0_fp_ctrl_wen),
		.io_ren_uops_0_bits_fp_ctrl_ren1(_rename_stage_io_ren2_uops_0_fp_ctrl_ren1),
		.io_ren_uops_0_bits_fp_ctrl_ren2(_rename_stage_io_ren2_uops_0_fp_ctrl_ren2),
		.io_ren_uops_0_bits_fp_ctrl_ren3(_rename_stage_io_ren2_uops_0_fp_ctrl_ren3),
		.io_ren_uops_0_bits_fp_ctrl_swap12(_rename_stage_io_ren2_uops_0_fp_ctrl_swap12),
		.io_ren_uops_0_bits_fp_ctrl_swap23(_rename_stage_io_ren2_uops_0_fp_ctrl_swap23),
		.io_ren_uops_0_bits_fp_ctrl_typeTagIn(_rename_stage_io_ren2_uops_0_fp_ctrl_typeTagIn),
		.io_ren_uops_0_bits_fp_ctrl_typeTagOut(_rename_stage_io_ren2_uops_0_fp_ctrl_typeTagOut),
		.io_ren_uops_0_bits_fp_ctrl_fromint(_rename_stage_io_ren2_uops_0_fp_ctrl_fromint),
		.io_ren_uops_0_bits_fp_ctrl_toint(_rename_stage_io_ren2_uops_0_fp_ctrl_toint),
		.io_ren_uops_0_bits_fp_ctrl_fastpipe(_rename_stage_io_ren2_uops_0_fp_ctrl_fastpipe),
		.io_ren_uops_0_bits_fp_ctrl_fma(_rename_stage_io_ren2_uops_0_fp_ctrl_fma),
		.io_ren_uops_0_bits_fp_ctrl_div(_rename_stage_io_ren2_uops_0_fp_ctrl_div),
		.io_ren_uops_0_bits_fp_ctrl_sqrt(_rename_stage_io_ren2_uops_0_fp_ctrl_sqrt),
		.io_ren_uops_0_bits_fp_ctrl_wflags(_rename_stage_io_ren2_uops_0_fp_ctrl_wflags),
		.io_ren_uops_0_bits_fp_ctrl_vec(_rename_stage_io_ren2_uops_0_fp_ctrl_vec),
		.io_ren_uops_0_bits_rob_idx(_rob_io_rob_tail_idx),
		.io_ren_uops_0_bits_ldq_idx(io_lsu_dis_ldq_idx_0),
		.io_ren_uops_0_bits_stq_idx(io_lsu_dis_stq_idx_0),
		.io_ren_uops_0_bits_rxq_idx(_rename_stage_io_ren2_uops_0_rxq_idx),
		.io_ren_uops_0_bits_pdst(dis_uops_0_pdst),
		.io_ren_uops_0_bits_prs1(dis_uops_0_prs1),
		.io_ren_uops_0_bits_prs2(dis_uops_0_prs2),
		.io_ren_uops_0_bits_prs3(_fp_rename_stage_io_ren2_uops_0_prs3),
		.io_ren_uops_0_bits_ppred(_pred_rename_stage_io_ren2_uops_0_ppred),
		.io_ren_uops_0_bits_prs1_busy(dis_uops_0_prs1_busy),
		.io_ren_uops_0_bits_prs2_busy(dis_uops_0_prs2_busy),
		.io_ren_uops_0_bits_prs3_busy(dis_uops_0_prs3_busy),
		.io_ren_uops_0_bits_ppred_busy(dis_uops_0_ppred_busy),
		.io_ren_uops_0_bits_stale_pdst(dis_uops_0_stale_pdst),
		.io_ren_uops_0_bits_exception(_rename_stage_io_ren2_uops_0_exception),
		.io_ren_uops_0_bits_exc_cause(_rename_stage_io_ren2_uops_0_exc_cause),
		.io_ren_uops_0_bits_mem_cmd(_rename_stage_io_ren2_uops_0_mem_cmd),
		.io_ren_uops_0_bits_mem_size(_rename_stage_io_ren2_uops_0_mem_size),
		.io_ren_uops_0_bits_mem_signed(_rename_stage_io_ren2_uops_0_mem_signed),
		.io_ren_uops_0_bits_uses_ldq(_rename_stage_io_ren2_uops_0_uses_ldq),
		.io_ren_uops_0_bits_uses_stq(_rename_stage_io_ren2_uops_0_uses_stq),
		.io_ren_uops_0_bits_is_unique(_rename_stage_io_ren2_uops_0_is_unique),
		.io_ren_uops_0_bits_flush_on_commit(_rename_stage_io_ren2_uops_0_flush_on_commit),
		.io_ren_uops_0_bits_csr_cmd(_rename_stage_io_ren2_uops_0_csr_cmd),
		.io_ren_uops_0_bits_ldst_is_rs1(_rename_stage_io_ren2_uops_0_ldst_is_rs1),
		.io_ren_uops_0_bits_ldst(_rename_stage_io_ren2_uops_0_ldst),
		.io_ren_uops_0_bits_lrs1(_rename_stage_io_ren2_uops_0_lrs1),
		.io_ren_uops_0_bits_lrs2(_rename_stage_io_ren2_uops_0_lrs2),
		.io_ren_uops_0_bits_lrs3(_rename_stage_io_ren2_uops_0_lrs3),
		.io_ren_uops_0_bits_dst_rtype(_rename_stage_io_ren2_uops_0_dst_rtype),
		.io_ren_uops_0_bits_lrs1_rtype(_rename_stage_io_ren2_uops_0_lrs1_rtype),
		.io_ren_uops_0_bits_lrs2_rtype(_rename_stage_io_ren2_uops_0_lrs2_rtype),
		.io_ren_uops_0_bits_frs3_en(_rename_stage_io_ren2_uops_0_frs3_en),
		.io_ren_uops_0_bits_fcn_dw(_rename_stage_io_ren2_uops_0_fcn_dw),
		.io_ren_uops_0_bits_fcn_op(_rename_stage_io_ren2_uops_0_fcn_op),
		.io_ren_uops_0_bits_fp_val(_rename_stage_io_ren2_uops_0_fp_val),
		.io_ren_uops_0_bits_fp_rm(_rename_stage_io_ren2_uops_0_fp_rm),
		.io_ren_uops_0_bits_fp_typ(_rename_stage_io_ren2_uops_0_fp_typ),
		.io_ren_uops_0_bits_xcpt_pf_if(_rename_stage_io_ren2_uops_0_xcpt_pf_if),
		.io_ren_uops_0_bits_xcpt_ae_if(_rename_stage_io_ren2_uops_0_xcpt_ae_if),
		.io_ren_uops_0_bits_xcpt_ma_if(_rename_stage_io_ren2_uops_0_xcpt_ma_if),
		.io_ren_uops_0_bits_bp_debug_if(_rename_stage_io_ren2_uops_0_bp_debug_if),
		.io_ren_uops_0_bits_bp_xcpt_if(_rename_stage_io_ren2_uops_0_bp_xcpt_if),
		.io_ren_uops_0_bits_debug_fsrc(_rename_stage_io_ren2_uops_0_debug_fsrc),
		.io_ren_uops_0_bits_debug_tsrc(_rename_stage_io_ren2_uops_0_debug_tsrc),
		.io_dis_uops_3_0_ready(_fp_pipeline_io_dis_uops_0_ready),
		.io_dis_uops_3_0_valid(_dispatcher_io_dis_uops_3_0_valid),
		.io_dis_uops_3_0_bits_inst(_dispatcher_io_dis_uops_3_0_bits_inst),
		.io_dis_uops_3_0_bits_debug_inst(_dispatcher_io_dis_uops_3_0_bits_debug_inst),
		.io_dis_uops_3_0_bits_is_rvc(_dispatcher_io_dis_uops_3_0_bits_is_rvc),
		.io_dis_uops_3_0_bits_debug_pc(_dispatcher_io_dis_uops_3_0_bits_debug_pc),
		.io_dis_uops_3_0_bits_iq_type_0(_dispatcher_io_dis_uops_3_0_bits_iq_type_0),
		.io_dis_uops_3_0_bits_iq_type_1(_dispatcher_io_dis_uops_3_0_bits_iq_type_1),
		.io_dis_uops_3_0_bits_iq_type_2(_dispatcher_io_dis_uops_3_0_bits_iq_type_2),
		.io_dis_uops_3_0_bits_iq_type_3(_dispatcher_io_dis_uops_3_0_bits_iq_type_3),
		.io_dis_uops_3_0_bits_fu_code_0(_dispatcher_io_dis_uops_3_0_bits_fu_code_0),
		.io_dis_uops_3_0_bits_fu_code_1(_dispatcher_io_dis_uops_3_0_bits_fu_code_1),
		.io_dis_uops_3_0_bits_fu_code_2(_dispatcher_io_dis_uops_3_0_bits_fu_code_2),
		.io_dis_uops_3_0_bits_fu_code_3(_dispatcher_io_dis_uops_3_0_bits_fu_code_3),
		.io_dis_uops_3_0_bits_fu_code_4(_dispatcher_io_dis_uops_3_0_bits_fu_code_4),
		.io_dis_uops_3_0_bits_fu_code_5(_dispatcher_io_dis_uops_3_0_bits_fu_code_5),
		.io_dis_uops_3_0_bits_fu_code_6(_dispatcher_io_dis_uops_3_0_bits_fu_code_6),
		.io_dis_uops_3_0_bits_fu_code_7(_dispatcher_io_dis_uops_3_0_bits_fu_code_7),
		.io_dis_uops_3_0_bits_fu_code_8(_dispatcher_io_dis_uops_3_0_bits_fu_code_8),
		.io_dis_uops_3_0_bits_fu_code_9(_dispatcher_io_dis_uops_3_0_bits_fu_code_9),
		.io_dis_uops_3_0_bits_iw_p1_speculative_child(_dispatcher_io_dis_uops_3_0_bits_iw_p1_speculative_child),
		.io_dis_uops_3_0_bits_iw_p2_speculative_child(_dispatcher_io_dis_uops_3_0_bits_iw_p2_speculative_child),
		.io_dis_uops_3_0_bits_br_mask(_dispatcher_io_dis_uops_3_0_bits_br_mask),
		.io_dis_uops_3_0_bits_br_tag(_dispatcher_io_dis_uops_3_0_bits_br_tag),
		.io_dis_uops_3_0_bits_br_type(_dispatcher_io_dis_uops_3_0_bits_br_type),
		.io_dis_uops_3_0_bits_is_sfb(_dispatcher_io_dis_uops_3_0_bits_is_sfb),
		.io_dis_uops_3_0_bits_is_fence(_dispatcher_io_dis_uops_3_0_bits_is_fence),
		.io_dis_uops_3_0_bits_is_fencei(_dispatcher_io_dis_uops_3_0_bits_is_fencei),
		.io_dis_uops_3_0_bits_is_sfence(_dispatcher_io_dis_uops_3_0_bits_is_sfence),
		.io_dis_uops_3_0_bits_is_amo(_dispatcher_io_dis_uops_3_0_bits_is_amo),
		.io_dis_uops_3_0_bits_is_eret(_dispatcher_io_dis_uops_3_0_bits_is_eret),
		.io_dis_uops_3_0_bits_is_sys_pc2epc(_dispatcher_io_dis_uops_3_0_bits_is_sys_pc2epc),
		.io_dis_uops_3_0_bits_is_rocc(_dispatcher_io_dis_uops_3_0_bits_is_rocc),
		.io_dis_uops_3_0_bits_is_mov(_dispatcher_io_dis_uops_3_0_bits_is_mov),
		.io_dis_uops_3_0_bits_ftq_idx(_dispatcher_io_dis_uops_3_0_bits_ftq_idx),
		.io_dis_uops_3_0_bits_edge_inst(_dispatcher_io_dis_uops_3_0_bits_edge_inst),
		.io_dis_uops_3_0_bits_pc_lob(_dispatcher_io_dis_uops_3_0_bits_pc_lob),
		.io_dis_uops_3_0_bits_taken(_dispatcher_io_dis_uops_3_0_bits_taken),
		.io_dis_uops_3_0_bits_imm_rename(_dispatcher_io_dis_uops_3_0_bits_imm_rename),
		.io_dis_uops_3_0_bits_imm_sel(_dispatcher_io_dis_uops_3_0_bits_imm_sel),
		.io_dis_uops_3_0_bits_pimm(_dispatcher_io_dis_uops_3_0_bits_pimm),
		.io_dis_uops_3_0_bits_imm_packed(_dispatcher_io_dis_uops_3_0_bits_imm_packed),
		.io_dis_uops_3_0_bits_op1_sel(_dispatcher_io_dis_uops_3_0_bits_op1_sel),
		.io_dis_uops_3_0_bits_op2_sel(_dispatcher_io_dis_uops_3_0_bits_op2_sel),
		.io_dis_uops_3_0_bits_fp_ctrl_ldst(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_ldst),
		.io_dis_uops_3_0_bits_fp_ctrl_wen(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_wen),
		.io_dis_uops_3_0_bits_fp_ctrl_ren1(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_ren1),
		.io_dis_uops_3_0_bits_fp_ctrl_ren2(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_ren2),
		.io_dis_uops_3_0_bits_fp_ctrl_ren3(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_ren3),
		.io_dis_uops_3_0_bits_fp_ctrl_swap12(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_swap12),
		.io_dis_uops_3_0_bits_fp_ctrl_swap23(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_swap23),
		.io_dis_uops_3_0_bits_fp_ctrl_typeTagIn(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_typeTagIn),
		.io_dis_uops_3_0_bits_fp_ctrl_typeTagOut(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_typeTagOut),
		.io_dis_uops_3_0_bits_fp_ctrl_fromint(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_fromint),
		.io_dis_uops_3_0_bits_fp_ctrl_toint(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_toint),
		.io_dis_uops_3_0_bits_fp_ctrl_fastpipe(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_fastpipe),
		.io_dis_uops_3_0_bits_fp_ctrl_fma(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_fma),
		.io_dis_uops_3_0_bits_fp_ctrl_div(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_div),
		.io_dis_uops_3_0_bits_fp_ctrl_sqrt(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_sqrt),
		.io_dis_uops_3_0_bits_fp_ctrl_wflags(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_wflags),
		.io_dis_uops_3_0_bits_fp_ctrl_vec(_dispatcher_io_dis_uops_3_0_bits_fp_ctrl_vec),
		.io_dis_uops_3_0_bits_rob_idx(_dispatcher_io_dis_uops_3_0_bits_rob_idx),
		.io_dis_uops_3_0_bits_ldq_idx(_dispatcher_io_dis_uops_3_0_bits_ldq_idx),
		.io_dis_uops_3_0_bits_stq_idx(_dispatcher_io_dis_uops_3_0_bits_stq_idx),
		.io_dis_uops_3_0_bits_rxq_idx(_dispatcher_io_dis_uops_3_0_bits_rxq_idx),
		.io_dis_uops_3_0_bits_pdst(_dispatcher_io_dis_uops_3_0_bits_pdst),
		.io_dis_uops_3_0_bits_prs1(_dispatcher_io_dis_uops_3_0_bits_prs1),
		.io_dis_uops_3_0_bits_prs2(_dispatcher_io_dis_uops_3_0_bits_prs2),
		.io_dis_uops_3_0_bits_prs3(_dispatcher_io_dis_uops_3_0_bits_prs3),
		.io_dis_uops_3_0_bits_ppred(_dispatcher_io_dis_uops_3_0_bits_ppred),
		.io_dis_uops_3_0_bits_prs1_busy(_dispatcher_io_dis_uops_3_0_bits_prs1_busy),
		.io_dis_uops_3_0_bits_prs2_busy(_dispatcher_io_dis_uops_3_0_bits_prs2_busy),
		.io_dis_uops_3_0_bits_prs3_busy(_dispatcher_io_dis_uops_3_0_bits_prs3_busy),
		.io_dis_uops_3_0_bits_ppred_busy(_dispatcher_io_dis_uops_3_0_bits_ppred_busy),
		.io_dis_uops_3_0_bits_stale_pdst(_dispatcher_io_dis_uops_3_0_bits_stale_pdst),
		.io_dis_uops_3_0_bits_exception(_dispatcher_io_dis_uops_3_0_bits_exception),
		.io_dis_uops_3_0_bits_exc_cause(_dispatcher_io_dis_uops_3_0_bits_exc_cause),
		.io_dis_uops_3_0_bits_mem_cmd(_dispatcher_io_dis_uops_3_0_bits_mem_cmd),
		.io_dis_uops_3_0_bits_mem_size(_dispatcher_io_dis_uops_3_0_bits_mem_size),
		.io_dis_uops_3_0_bits_mem_signed(_dispatcher_io_dis_uops_3_0_bits_mem_signed),
		.io_dis_uops_3_0_bits_uses_ldq(_dispatcher_io_dis_uops_3_0_bits_uses_ldq),
		.io_dis_uops_3_0_bits_uses_stq(_dispatcher_io_dis_uops_3_0_bits_uses_stq),
		.io_dis_uops_3_0_bits_is_unique(_dispatcher_io_dis_uops_3_0_bits_is_unique),
		.io_dis_uops_3_0_bits_flush_on_commit(_dispatcher_io_dis_uops_3_0_bits_flush_on_commit),
		.io_dis_uops_3_0_bits_csr_cmd(_dispatcher_io_dis_uops_3_0_bits_csr_cmd),
		.io_dis_uops_3_0_bits_ldst_is_rs1(_dispatcher_io_dis_uops_3_0_bits_ldst_is_rs1),
		.io_dis_uops_3_0_bits_ldst(_dispatcher_io_dis_uops_3_0_bits_ldst),
		.io_dis_uops_3_0_bits_lrs1(_dispatcher_io_dis_uops_3_0_bits_lrs1),
		.io_dis_uops_3_0_bits_lrs2(_dispatcher_io_dis_uops_3_0_bits_lrs2),
		.io_dis_uops_3_0_bits_lrs3(_dispatcher_io_dis_uops_3_0_bits_lrs3),
		.io_dis_uops_3_0_bits_dst_rtype(_dispatcher_io_dis_uops_3_0_bits_dst_rtype),
		.io_dis_uops_3_0_bits_lrs1_rtype(_dispatcher_io_dis_uops_3_0_bits_lrs1_rtype),
		.io_dis_uops_3_0_bits_lrs2_rtype(_dispatcher_io_dis_uops_3_0_bits_lrs2_rtype),
		.io_dis_uops_3_0_bits_frs3_en(_dispatcher_io_dis_uops_3_0_bits_frs3_en),
		.io_dis_uops_3_0_bits_fcn_dw(_dispatcher_io_dis_uops_3_0_bits_fcn_dw),
		.io_dis_uops_3_0_bits_fcn_op(_dispatcher_io_dis_uops_3_0_bits_fcn_op),
		.io_dis_uops_3_0_bits_fp_val(_dispatcher_io_dis_uops_3_0_bits_fp_val),
		.io_dis_uops_3_0_bits_fp_rm(_dispatcher_io_dis_uops_3_0_bits_fp_rm),
		.io_dis_uops_3_0_bits_fp_typ(_dispatcher_io_dis_uops_3_0_bits_fp_typ),
		.io_dis_uops_3_0_bits_xcpt_pf_if(_dispatcher_io_dis_uops_3_0_bits_xcpt_pf_if),
		.io_dis_uops_3_0_bits_xcpt_ae_if(_dispatcher_io_dis_uops_3_0_bits_xcpt_ae_if),
		.io_dis_uops_3_0_bits_xcpt_ma_if(_dispatcher_io_dis_uops_3_0_bits_xcpt_ma_if),
		.io_dis_uops_3_0_bits_bp_debug_if(_dispatcher_io_dis_uops_3_0_bits_bp_debug_if),
		.io_dis_uops_3_0_bits_bp_xcpt_if(_dispatcher_io_dis_uops_3_0_bits_bp_xcpt_if),
		.io_dis_uops_3_0_bits_debug_fsrc(_dispatcher_io_dis_uops_3_0_bits_debug_fsrc),
		.io_dis_uops_3_0_bits_debug_tsrc(_dispatcher_io_dis_uops_3_0_bits_debug_tsrc),
		.io_dis_uops_2_0_ready(_alu_iss_unit_io_dis_uops_0_ready),
		.io_dis_uops_2_0_valid(_dispatcher_io_dis_uops_2_0_valid),
		.io_dis_uops_2_0_bits_inst(_dispatcher_io_dis_uops_2_0_bits_inst),
		.io_dis_uops_2_0_bits_debug_inst(_dispatcher_io_dis_uops_2_0_bits_debug_inst),
		.io_dis_uops_2_0_bits_is_rvc(_dispatcher_io_dis_uops_2_0_bits_is_rvc),
		.io_dis_uops_2_0_bits_debug_pc(_dispatcher_io_dis_uops_2_0_bits_debug_pc),
		.io_dis_uops_2_0_bits_iq_type_0(_dispatcher_io_dis_uops_2_0_bits_iq_type_0),
		.io_dis_uops_2_0_bits_iq_type_1(_dispatcher_io_dis_uops_2_0_bits_iq_type_1),
		.io_dis_uops_2_0_bits_iq_type_2(_dispatcher_io_dis_uops_2_0_bits_iq_type_2),
		.io_dis_uops_2_0_bits_iq_type_3(_dispatcher_io_dis_uops_2_0_bits_iq_type_3),
		.io_dis_uops_2_0_bits_fu_code_0(_dispatcher_io_dis_uops_2_0_bits_fu_code_0),
		.io_dis_uops_2_0_bits_fu_code_1(_dispatcher_io_dis_uops_2_0_bits_fu_code_1),
		.io_dis_uops_2_0_bits_fu_code_2(_dispatcher_io_dis_uops_2_0_bits_fu_code_2),
		.io_dis_uops_2_0_bits_fu_code_3(_dispatcher_io_dis_uops_2_0_bits_fu_code_3),
		.io_dis_uops_2_0_bits_fu_code_4(_dispatcher_io_dis_uops_2_0_bits_fu_code_4),
		.io_dis_uops_2_0_bits_fu_code_5(_dispatcher_io_dis_uops_2_0_bits_fu_code_5),
		.io_dis_uops_2_0_bits_fu_code_6(_dispatcher_io_dis_uops_2_0_bits_fu_code_6),
		.io_dis_uops_2_0_bits_fu_code_7(_dispatcher_io_dis_uops_2_0_bits_fu_code_7),
		.io_dis_uops_2_0_bits_fu_code_8(_dispatcher_io_dis_uops_2_0_bits_fu_code_8),
		.io_dis_uops_2_0_bits_fu_code_9(_dispatcher_io_dis_uops_2_0_bits_fu_code_9),
		.io_dis_uops_2_0_bits_iw_p1_speculative_child(_dispatcher_io_dis_uops_2_0_bits_iw_p1_speculative_child),
		.io_dis_uops_2_0_bits_iw_p2_speculative_child(_dispatcher_io_dis_uops_2_0_bits_iw_p2_speculative_child),
		.io_dis_uops_2_0_bits_br_mask(_dispatcher_io_dis_uops_2_0_bits_br_mask),
		.io_dis_uops_2_0_bits_br_tag(_dispatcher_io_dis_uops_2_0_bits_br_tag),
		.io_dis_uops_2_0_bits_br_type(_dispatcher_io_dis_uops_2_0_bits_br_type),
		.io_dis_uops_2_0_bits_is_sfb(_dispatcher_io_dis_uops_2_0_bits_is_sfb),
		.io_dis_uops_2_0_bits_is_fence(_dispatcher_io_dis_uops_2_0_bits_is_fence),
		.io_dis_uops_2_0_bits_is_fencei(_dispatcher_io_dis_uops_2_0_bits_is_fencei),
		.io_dis_uops_2_0_bits_is_sfence(_dispatcher_io_dis_uops_2_0_bits_is_sfence),
		.io_dis_uops_2_0_bits_is_amo(_dispatcher_io_dis_uops_2_0_bits_is_amo),
		.io_dis_uops_2_0_bits_is_eret(_dispatcher_io_dis_uops_2_0_bits_is_eret),
		.io_dis_uops_2_0_bits_is_sys_pc2epc(_dispatcher_io_dis_uops_2_0_bits_is_sys_pc2epc),
		.io_dis_uops_2_0_bits_is_rocc(_dispatcher_io_dis_uops_2_0_bits_is_rocc),
		.io_dis_uops_2_0_bits_is_mov(_dispatcher_io_dis_uops_2_0_bits_is_mov),
		.io_dis_uops_2_0_bits_ftq_idx(_dispatcher_io_dis_uops_2_0_bits_ftq_idx),
		.io_dis_uops_2_0_bits_edge_inst(_dispatcher_io_dis_uops_2_0_bits_edge_inst),
		.io_dis_uops_2_0_bits_pc_lob(_dispatcher_io_dis_uops_2_0_bits_pc_lob),
		.io_dis_uops_2_0_bits_taken(_dispatcher_io_dis_uops_2_0_bits_taken),
		.io_dis_uops_2_0_bits_imm_rename(_dispatcher_io_dis_uops_2_0_bits_imm_rename),
		.io_dis_uops_2_0_bits_imm_sel(_dispatcher_io_dis_uops_2_0_bits_imm_sel),
		.io_dis_uops_2_0_bits_pimm(_dispatcher_io_dis_uops_2_0_bits_pimm),
		.io_dis_uops_2_0_bits_imm_packed(_dispatcher_io_dis_uops_2_0_bits_imm_packed),
		.io_dis_uops_2_0_bits_op1_sel(_dispatcher_io_dis_uops_2_0_bits_op1_sel),
		.io_dis_uops_2_0_bits_op2_sel(_dispatcher_io_dis_uops_2_0_bits_op2_sel),
		.io_dis_uops_2_0_bits_fp_ctrl_ldst(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_ldst),
		.io_dis_uops_2_0_bits_fp_ctrl_wen(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_wen),
		.io_dis_uops_2_0_bits_fp_ctrl_ren1(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_ren1),
		.io_dis_uops_2_0_bits_fp_ctrl_ren2(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_ren2),
		.io_dis_uops_2_0_bits_fp_ctrl_ren3(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_ren3),
		.io_dis_uops_2_0_bits_fp_ctrl_swap12(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_swap12),
		.io_dis_uops_2_0_bits_fp_ctrl_swap23(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_swap23),
		.io_dis_uops_2_0_bits_fp_ctrl_typeTagIn(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_typeTagIn),
		.io_dis_uops_2_0_bits_fp_ctrl_typeTagOut(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_typeTagOut),
		.io_dis_uops_2_0_bits_fp_ctrl_fromint(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_fromint),
		.io_dis_uops_2_0_bits_fp_ctrl_toint(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_toint),
		.io_dis_uops_2_0_bits_fp_ctrl_fastpipe(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_fastpipe),
		.io_dis_uops_2_0_bits_fp_ctrl_fma(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_fma),
		.io_dis_uops_2_0_bits_fp_ctrl_div(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_div),
		.io_dis_uops_2_0_bits_fp_ctrl_sqrt(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_sqrt),
		.io_dis_uops_2_0_bits_fp_ctrl_wflags(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_wflags),
		.io_dis_uops_2_0_bits_fp_ctrl_vec(_dispatcher_io_dis_uops_2_0_bits_fp_ctrl_vec),
		.io_dis_uops_2_0_bits_rob_idx(_dispatcher_io_dis_uops_2_0_bits_rob_idx),
		.io_dis_uops_2_0_bits_ldq_idx(_dispatcher_io_dis_uops_2_0_bits_ldq_idx),
		.io_dis_uops_2_0_bits_stq_idx(_dispatcher_io_dis_uops_2_0_bits_stq_idx),
		.io_dis_uops_2_0_bits_rxq_idx(_dispatcher_io_dis_uops_2_0_bits_rxq_idx),
		.io_dis_uops_2_0_bits_pdst(_dispatcher_io_dis_uops_2_0_bits_pdst),
		.io_dis_uops_2_0_bits_prs1(_dispatcher_io_dis_uops_2_0_bits_prs1),
		.io_dis_uops_2_0_bits_prs2(_dispatcher_io_dis_uops_2_0_bits_prs2),
		.io_dis_uops_2_0_bits_prs3(_dispatcher_io_dis_uops_2_0_bits_prs3),
		.io_dis_uops_2_0_bits_ppred(_dispatcher_io_dis_uops_2_0_bits_ppred),
		.io_dis_uops_2_0_bits_prs1_busy(_dispatcher_io_dis_uops_2_0_bits_prs1_busy),
		.io_dis_uops_2_0_bits_prs2_busy(_dispatcher_io_dis_uops_2_0_bits_prs2_busy),
		.io_dis_uops_2_0_bits_prs3_busy(_dispatcher_io_dis_uops_2_0_bits_prs3_busy),
		.io_dis_uops_2_0_bits_ppred_busy(_dispatcher_io_dis_uops_2_0_bits_ppred_busy),
		.io_dis_uops_2_0_bits_stale_pdst(_dispatcher_io_dis_uops_2_0_bits_stale_pdst),
		.io_dis_uops_2_0_bits_exception(_dispatcher_io_dis_uops_2_0_bits_exception),
		.io_dis_uops_2_0_bits_exc_cause(_dispatcher_io_dis_uops_2_0_bits_exc_cause),
		.io_dis_uops_2_0_bits_mem_cmd(_dispatcher_io_dis_uops_2_0_bits_mem_cmd),
		.io_dis_uops_2_0_bits_mem_size(_dispatcher_io_dis_uops_2_0_bits_mem_size),
		.io_dis_uops_2_0_bits_mem_signed(_dispatcher_io_dis_uops_2_0_bits_mem_signed),
		.io_dis_uops_2_0_bits_uses_ldq(_dispatcher_io_dis_uops_2_0_bits_uses_ldq),
		.io_dis_uops_2_0_bits_uses_stq(_dispatcher_io_dis_uops_2_0_bits_uses_stq),
		.io_dis_uops_2_0_bits_is_unique(_dispatcher_io_dis_uops_2_0_bits_is_unique),
		.io_dis_uops_2_0_bits_flush_on_commit(_dispatcher_io_dis_uops_2_0_bits_flush_on_commit),
		.io_dis_uops_2_0_bits_csr_cmd(_dispatcher_io_dis_uops_2_0_bits_csr_cmd),
		.io_dis_uops_2_0_bits_ldst_is_rs1(_dispatcher_io_dis_uops_2_0_bits_ldst_is_rs1),
		.io_dis_uops_2_0_bits_ldst(_dispatcher_io_dis_uops_2_0_bits_ldst),
		.io_dis_uops_2_0_bits_lrs1(_dispatcher_io_dis_uops_2_0_bits_lrs1),
		.io_dis_uops_2_0_bits_lrs2(_dispatcher_io_dis_uops_2_0_bits_lrs2),
		.io_dis_uops_2_0_bits_lrs3(_dispatcher_io_dis_uops_2_0_bits_lrs3),
		.io_dis_uops_2_0_bits_dst_rtype(_dispatcher_io_dis_uops_2_0_bits_dst_rtype),
		.io_dis_uops_2_0_bits_lrs1_rtype(_dispatcher_io_dis_uops_2_0_bits_lrs1_rtype),
		.io_dis_uops_2_0_bits_lrs2_rtype(_dispatcher_io_dis_uops_2_0_bits_lrs2_rtype),
		.io_dis_uops_2_0_bits_frs3_en(_dispatcher_io_dis_uops_2_0_bits_frs3_en),
		.io_dis_uops_2_0_bits_fcn_dw(_dispatcher_io_dis_uops_2_0_bits_fcn_dw),
		.io_dis_uops_2_0_bits_fcn_op(_dispatcher_io_dis_uops_2_0_bits_fcn_op),
		.io_dis_uops_2_0_bits_fp_val(_dispatcher_io_dis_uops_2_0_bits_fp_val),
		.io_dis_uops_2_0_bits_xcpt_pf_if(_dispatcher_io_dis_uops_2_0_bits_xcpt_pf_if),
		.io_dis_uops_2_0_bits_xcpt_ae_if(_dispatcher_io_dis_uops_2_0_bits_xcpt_ae_if),
		.io_dis_uops_2_0_bits_xcpt_ma_if(_dispatcher_io_dis_uops_2_0_bits_xcpt_ma_if),
		.io_dis_uops_2_0_bits_bp_debug_if(_dispatcher_io_dis_uops_2_0_bits_bp_debug_if),
		.io_dis_uops_2_0_bits_bp_xcpt_if(_dispatcher_io_dis_uops_2_0_bits_bp_xcpt_if),
		.io_dis_uops_2_0_bits_debug_fsrc(_dispatcher_io_dis_uops_2_0_bits_debug_fsrc),
		.io_dis_uops_2_0_bits_debug_tsrc(_dispatcher_io_dis_uops_2_0_bits_debug_tsrc),
		.io_dis_uops_1_0_ready(_unq_iss_unit_io_dis_uops_0_ready),
		.io_dis_uops_1_0_valid(_dispatcher_io_dis_uops_1_0_valid),
		.io_dis_uops_1_0_bits_inst(_dispatcher_io_dis_uops_1_0_bits_inst),
		.io_dis_uops_1_0_bits_debug_inst(_dispatcher_io_dis_uops_1_0_bits_debug_inst),
		.io_dis_uops_1_0_bits_is_rvc(_dispatcher_io_dis_uops_1_0_bits_is_rvc),
		.io_dis_uops_1_0_bits_debug_pc(_dispatcher_io_dis_uops_1_0_bits_debug_pc),
		.io_dis_uops_1_0_bits_iq_type_0(_dispatcher_io_dis_uops_1_0_bits_iq_type_0),
		.io_dis_uops_1_0_bits_iq_type_1(_dispatcher_io_dis_uops_1_0_bits_iq_type_1),
		.io_dis_uops_1_0_bits_iq_type_2(_dispatcher_io_dis_uops_1_0_bits_iq_type_2),
		.io_dis_uops_1_0_bits_iq_type_3(_dispatcher_io_dis_uops_1_0_bits_iq_type_3),
		.io_dis_uops_1_0_bits_fu_code_0(_dispatcher_io_dis_uops_1_0_bits_fu_code_0),
		.io_dis_uops_1_0_bits_fu_code_1(_dispatcher_io_dis_uops_1_0_bits_fu_code_1),
		.io_dis_uops_1_0_bits_fu_code_2(_dispatcher_io_dis_uops_1_0_bits_fu_code_2),
		.io_dis_uops_1_0_bits_fu_code_3(_dispatcher_io_dis_uops_1_0_bits_fu_code_3),
		.io_dis_uops_1_0_bits_fu_code_4(_dispatcher_io_dis_uops_1_0_bits_fu_code_4),
		.io_dis_uops_1_0_bits_fu_code_5(_dispatcher_io_dis_uops_1_0_bits_fu_code_5),
		.io_dis_uops_1_0_bits_fu_code_6(_dispatcher_io_dis_uops_1_0_bits_fu_code_6),
		.io_dis_uops_1_0_bits_fu_code_7(_dispatcher_io_dis_uops_1_0_bits_fu_code_7),
		.io_dis_uops_1_0_bits_fu_code_8(_dispatcher_io_dis_uops_1_0_bits_fu_code_8),
		.io_dis_uops_1_0_bits_fu_code_9(_dispatcher_io_dis_uops_1_0_bits_fu_code_9),
		.io_dis_uops_1_0_bits_iw_p1_speculative_child(_dispatcher_io_dis_uops_1_0_bits_iw_p1_speculative_child),
		.io_dis_uops_1_0_bits_iw_p2_speculative_child(_dispatcher_io_dis_uops_1_0_bits_iw_p2_speculative_child),
		.io_dis_uops_1_0_bits_br_mask(_dispatcher_io_dis_uops_1_0_bits_br_mask),
		.io_dis_uops_1_0_bits_br_tag(_dispatcher_io_dis_uops_1_0_bits_br_tag),
		.io_dis_uops_1_0_bits_br_type(_dispatcher_io_dis_uops_1_0_bits_br_type),
		.io_dis_uops_1_0_bits_is_sfb(_dispatcher_io_dis_uops_1_0_bits_is_sfb),
		.io_dis_uops_1_0_bits_is_fence(_dispatcher_io_dis_uops_1_0_bits_is_fence),
		.io_dis_uops_1_0_bits_is_fencei(_dispatcher_io_dis_uops_1_0_bits_is_fencei),
		.io_dis_uops_1_0_bits_is_sfence(_dispatcher_io_dis_uops_1_0_bits_is_sfence),
		.io_dis_uops_1_0_bits_is_amo(_dispatcher_io_dis_uops_1_0_bits_is_amo),
		.io_dis_uops_1_0_bits_is_eret(_dispatcher_io_dis_uops_1_0_bits_is_eret),
		.io_dis_uops_1_0_bits_is_sys_pc2epc(_dispatcher_io_dis_uops_1_0_bits_is_sys_pc2epc),
		.io_dis_uops_1_0_bits_is_rocc(_dispatcher_io_dis_uops_1_0_bits_is_rocc),
		.io_dis_uops_1_0_bits_is_mov(_dispatcher_io_dis_uops_1_0_bits_is_mov),
		.io_dis_uops_1_0_bits_ftq_idx(_dispatcher_io_dis_uops_1_0_bits_ftq_idx),
		.io_dis_uops_1_0_bits_edge_inst(_dispatcher_io_dis_uops_1_0_bits_edge_inst),
		.io_dis_uops_1_0_bits_pc_lob(_dispatcher_io_dis_uops_1_0_bits_pc_lob),
		.io_dis_uops_1_0_bits_taken(_dispatcher_io_dis_uops_1_0_bits_taken),
		.io_dis_uops_1_0_bits_imm_rename(_dispatcher_io_dis_uops_1_0_bits_imm_rename),
		.io_dis_uops_1_0_bits_imm_sel(_dispatcher_io_dis_uops_1_0_bits_imm_sel),
		.io_dis_uops_1_0_bits_pimm(_dispatcher_io_dis_uops_1_0_bits_pimm),
		.io_dis_uops_1_0_bits_imm_packed(_dispatcher_io_dis_uops_1_0_bits_imm_packed),
		.io_dis_uops_1_0_bits_op1_sel(_dispatcher_io_dis_uops_1_0_bits_op1_sel),
		.io_dis_uops_1_0_bits_op2_sel(_dispatcher_io_dis_uops_1_0_bits_op2_sel),
		.io_dis_uops_1_0_bits_fp_ctrl_ldst(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_ldst),
		.io_dis_uops_1_0_bits_fp_ctrl_wen(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_wen),
		.io_dis_uops_1_0_bits_fp_ctrl_ren1(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_ren1),
		.io_dis_uops_1_0_bits_fp_ctrl_ren2(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_ren2),
		.io_dis_uops_1_0_bits_fp_ctrl_ren3(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_ren3),
		.io_dis_uops_1_0_bits_fp_ctrl_swap12(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_swap12),
		.io_dis_uops_1_0_bits_fp_ctrl_swap23(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_swap23),
		.io_dis_uops_1_0_bits_fp_ctrl_typeTagIn(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_typeTagIn),
		.io_dis_uops_1_0_bits_fp_ctrl_typeTagOut(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_typeTagOut),
		.io_dis_uops_1_0_bits_fp_ctrl_fromint(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_fromint),
		.io_dis_uops_1_0_bits_fp_ctrl_toint(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_toint),
		.io_dis_uops_1_0_bits_fp_ctrl_fastpipe(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_fastpipe),
		.io_dis_uops_1_0_bits_fp_ctrl_fma(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_fma),
		.io_dis_uops_1_0_bits_fp_ctrl_div(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_div),
		.io_dis_uops_1_0_bits_fp_ctrl_sqrt(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_sqrt),
		.io_dis_uops_1_0_bits_fp_ctrl_wflags(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_wflags),
		.io_dis_uops_1_0_bits_fp_ctrl_vec(_dispatcher_io_dis_uops_1_0_bits_fp_ctrl_vec),
		.io_dis_uops_1_0_bits_rob_idx(_dispatcher_io_dis_uops_1_0_bits_rob_idx),
		.io_dis_uops_1_0_bits_ldq_idx(_dispatcher_io_dis_uops_1_0_bits_ldq_idx),
		.io_dis_uops_1_0_bits_stq_idx(_dispatcher_io_dis_uops_1_0_bits_stq_idx),
		.io_dis_uops_1_0_bits_rxq_idx(_dispatcher_io_dis_uops_1_0_bits_rxq_idx),
		.io_dis_uops_1_0_bits_pdst(_dispatcher_io_dis_uops_1_0_bits_pdst),
		.io_dis_uops_1_0_bits_prs1(_dispatcher_io_dis_uops_1_0_bits_prs1),
		.io_dis_uops_1_0_bits_prs2(_dispatcher_io_dis_uops_1_0_bits_prs2),
		.io_dis_uops_1_0_bits_prs3(_dispatcher_io_dis_uops_1_0_bits_prs3),
		.io_dis_uops_1_0_bits_ppred(_dispatcher_io_dis_uops_1_0_bits_ppred),
		.io_dis_uops_1_0_bits_prs1_busy(_dispatcher_io_dis_uops_1_0_bits_prs1_busy),
		.io_dis_uops_1_0_bits_prs2_busy(_dispatcher_io_dis_uops_1_0_bits_prs2_busy),
		.io_dis_uops_1_0_bits_prs3_busy(_dispatcher_io_dis_uops_1_0_bits_prs3_busy),
		.io_dis_uops_1_0_bits_ppred_busy(_dispatcher_io_dis_uops_1_0_bits_ppred_busy),
		.io_dis_uops_1_0_bits_stale_pdst(_dispatcher_io_dis_uops_1_0_bits_stale_pdst),
		.io_dis_uops_1_0_bits_exception(_dispatcher_io_dis_uops_1_0_bits_exception),
		.io_dis_uops_1_0_bits_exc_cause(_dispatcher_io_dis_uops_1_0_bits_exc_cause),
		.io_dis_uops_1_0_bits_mem_cmd(_dispatcher_io_dis_uops_1_0_bits_mem_cmd),
		.io_dis_uops_1_0_bits_mem_size(_dispatcher_io_dis_uops_1_0_bits_mem_size),
		.io_dis_uops_1_0_bits_mem_signed(_dispatcher_io_dis_uops_1_0_bits_mem_signed),
		.io_dis_uops_1_0_bits_uses_ldq(_dispatcher_io_dis_uops_1_0_bits_uses_ldq),
		.io_dis_uops_1_0_bits_uses_stq(_dispatcher_io_dis_uops_1_0_bits_uses_stq),
		.io_dis_uops_1_0_bits_is_unique(_dispatcher_io_dis_uops_1_0_bits_is_unique),
		.io_dis_uops_1_0_bits_flush_on_commit(_dispatcher_io_dis_uops_1_0_bits_flush_on_commit),
		.io_dis_uops_1_0_bits_csr_cmd(_dispatcher_io_dis_uops_1_0_bits_csr_cmd),
		.io_dis_uops_1_0_bits_ldst_is_rs1(_dispatcher_io_dis_uops_1_0_bits_ldst_is_rs1),
		.io_dis_uops_1_0_bits_ldst(_dispatcher_io_dis_uops_1_0_bits_ldst),
		.io_dis_uops_1_0_bits_lrs1(_dispatcher_io_dis_uops_1_0_bits_lrs1),
		.io_dis_uops_1_0_bits_lrs2(_dispatcher_io_dis_uops_1_0_bits_lrs2),
		.io_dis_uops_1_0_bits_lrs3(_dispatcher_io_dis_uops_1_0_bits_lrs3),
		.io_dis_uops_1_0_bits_dst_rtype(_dispatcher_io_dis_uops_1_0_bits_dst_rtype),
		.io_dis_uops_1_0_bits_lrs1_rtype(_dispatcher_io_dis_uops_1_0_bits_lrs1_rtype),
		.io_dis_uops_1_0_bits_lrs2_rtype(_dispatcher_io_dis_uops_1_0_bits_lrs2_rtype),
		.io_dis_uops_1_0_bits_frs3_en(_dispatcher_io_dis_uops_1_0_bits_frs3_en),
		.io_dis_uops_1_0_bits_fcn_dw(_dispatcher_io_dis_uops_1_0_bits_fcn_dw),
		.io_dis_uops_1_0_bits_fcn_op(_dispatcher_io_dis_uops_1_0_bits_fcn_op),
		.io_dis_uops_1_0_bits_fp_val(_dispatcher_io_dis_uops_1_0_bits_fp_val),
		.io_dis_uops_1_0_bits_fp_rm(_dispatcher_io_dis_uops_1_0_bits_fp_rm),
		.io_dis_uops_1_0_bits_fp_typ(_dispatcher_io_dis_uops_1_0_bits_fp_typ),
		.io_dis_uops_1_0_bits_xcpt_pf_if(_dispatcher_io_dis_uops_1_0_bits_xcpt_pf_if),
		.io_dis_uops_1_0_bits_xcpt_ae_if(_dispatcher_io_dis_uops_1_0_bits_xcpt_ae_if),
		.io_dis_uops_1_0_bits_xcpt_ma_if(_dispatcher_io_dis_uops_1_0_bits_xcpt_ma_if),
		.io_dis_uops_1_0_bits_bp_debug_if(_dispatcher_io_dis_uops_1_0_bits_bp_debug_if),
		.io_dis_uops_1_0_bits_bp_xcpt_if(_dispatcher_io_dis_uops_1_0_bits_bp_xcpt_if),
		.io_dis_uops_1_0_bits_debug_fsrc(_dispatcher_io_dis_uops_1_0_bits_debug_fsrc),
		.io_dis_uops_1_0_bits_debug_tsrc(_dispatcher_io_dis_uops_1_0_bits_debug_tsrc),
		.io_dis_uops_0_0_ready(_mem_iss_unit_io_dis_uops_0_ready),
		.io_dis_uops_0_0_valid(_dispatcher_io_dis_uops_0_0_valid),
		.io_dis_uops_0_0_bits_fu_code_1(_dispatcher_io_dis_uops_0_0_bits_fu_code_1),
		.io_dis_uops_0_0_bits_fu_code_2(_dispatcher_io_dis_uops_0_0_bits_fu_code_2),
		.io_dis_uops_0_0_bits_iw_p1_speculative_child(_dispatcher_io_dis_uops_0_0_bits_iw_p1_speculative_child),
		.io_dis_uops_0_0_bits_iw_p2_speculative_child(_dispatcher_io_dis_uops_0_0_bits_iw_p2_speculative_child),
		.io_dis_uops_0_0_bits_br_mask(_dispatcher_io_dis_uops_0_0_bits_br_mask),
		.io_dis_uops_0_0_bits_is_fence(_dispatcher_io_dis_uops_0_0_bits_is_fence),
		.io_dis_uops_0_0_bits_is_fencei(_dispatcher_io_dis_uops_0_0_bits_is_fencei),
		.io_dis_uops_0_0_bits_imm_sel(_dispatcher_io_dis_uops_0_0_bits_imm_sel),
		.io_dis_uops_0_0_bits_pimm(_dispatcher_io_dis_uops_0_0_bits_pimm),
		.io_dis_uops_0_0_bits_ldq_idx(_dispatcher_io_dis_uops_0_0_bits_ldq_idx),
		.io_dis_uops_0_0_bits_stq_idx(_dispatcher_io_dis_uops_0_0_bits_stq_idx),
		.io_dis_uops_0_0_bits_pdst(_dispatcher_io_dis_uops_0_0_bits_pdst),
		.io_dis_uops_0_0_bits_prs1(_dispatcher_io_dis_uops_0_0_bits_prs1),
		.io_dis_uops_0_0_bits_prs2(_dispatcher_io_dis_uops_0_0_bits_prs2),
		.io_dis_uops_0_0_bits_prs1_busy(_dispatcher_io_dis_uops_0_0_bits_prs1_busy),
		.io_dis_uops_0_0_bits_prs2_busy(_dispatcher_io_dis_uops_0_0_bits_prs2_busy),
		.io_dis_uops_0_0_bits_ppred_busy(_dispatcher_io_dis_uops_0_0_bits_ppred_busy),
		.io_dis_uops_0_0_bits_exception(_dispatcher_io_dis_uops_0_0_bits_exception),
		.io_dis_uops_0_0_bits_uses_ldq(_dispatcher_io_dis_uops_0_0_bits_uses_ldq),
		.io_dis_uops_0_0_bits_uses_stq(_dispatcher_io_dis_uops_0_0_bits_uses_stq),
		.io_dis_uops_0_0_bits_dst_rtype(_dispatcher_io_dis_uops_0_0_bits_dst_rtype),
		.io_dis_uops_0_0_bits_lrs1_rtype(_dispatcher_io_dis_uops_0_0_bits_lrs1_rtype),
		.io_dis_uops_0_0_bits_lrs2_rtype(_dispatcher_io_dis_uops_0_0_bits_lrs2_rtype),
		.io_dis_uops_0_0_bits_fp_val(_dispatcher_io_dis_uops_0_0_bits_fp_val)
	);
	BankedRF_1 iregfile(
		.clock(clock),
		.reset(reset),
		.io_arb_read_reqs_0_valid(_alu_exe_unit_0_io_arb_irf_reqs_0_valid),
		.io_arb_read_reqs_0_bits(_alu_exe_unit_0_io_arb_irf_reqs_0_bits),
		.io_arb_read_reqs_1_valid(_alu_exe_unit_0_io_arb_irf_reqs_1_valid),
		.io_arb_read_reqs_1_bits(_alu_exe_unit_0_io_arb_irf_reqs_1_bits),
		.io_arb_read_reqs_2_ready(_iregfile_io_arb_read_reqs_2_ready),
		.io_arb_read_reqs_2_valid(_mem_exe_unit_0_io_arb_irf_reqs_0_valid),
		.io_arb_read_reqs_2_bits(_mem_exe_unit_0_io_arb_irf_reqs_0_bits),
		.io_arb_read_reqs_3_ready(_iregfile_io_arb_read_reqs_3_ready),
		.io_arb_read_reqs_3_valid(_mem_exe_unit_1_io_arb_irf_reqs_0_valid),
		.io_arb_read_reqs_3_bits(_mem_exe_unit_1_io_arb_irf_reqs_0_bits),
		.io_arb_read_reqs_4_ready(_iregfile_io_arb_read_reqs_4_ready),
		.io_arb_read_reqs_4_valid(_unique_exe_unit_0_io_arb_irf_reqs_0_valid),
		.io_arb_read_reqs_4_bits(_unique_exe_unit_0_io_arb_irf_reqs_0_bits),
		.io_arb_read_reqs_5_ready(_iregfile_io_arb_read_reqs_5_ready),
		.io_arb_read_reqs_5_valid(_unique_exe_unit_0_io_arb_irf_reqs_1_valid),
		.io_arb_read_reqs_5_bits(_unique_exe_unit_0_io_arb_irf_reqs_1_bits),
		.io_rrd_read_resps_0(_iregfile_io_rrd_read_resps_0),
		.io_rrd_read_resps_1(_iregfile_io_rrd_read_resps_1),
		.io_rrd_read_resps_2(_iregfile_io_rrd_read_resps_2),
		.io_rrd_read_resps_3(_iregfile_io_rrd_read_resps_3),
		.io_rrd_read_resps_4(_iregfile_io_rrd_read_resps_4),
		.io_rrd_read_resps_5(_iregfile_io_rrd_read_resps_5),
		.io_write_ports_0_valid(iregfile_io_write_ports_0_valid_REG),
		.io_write_ports_0_bits_addr(iregfile_io_write_ports_0_bits_addr_REG),
		.io_write_ports_0_bits_data(iregfile_io_write_ports_0_bits_data_REG),
		.io_write_ports_1_valid(_ll_arb_io_out_valid & _iregfile_io_write_ports_1_valid_T),
		.io_write_ports_1_bits_addr(_ll_arb_io_out_bits_uop_pdst),
		.io_write_ports_1_bits_data(_ll_arb_io_out_bits_data),
		.io_write_ports_2_valid(_alu_exe_unit_0_io_alu_resp_valid & _iregfile_io_write_ports_2_valid_T),
		.io_write_ports_2_bits_addr(_alu_exe_unit_0_io_alu_resp_bits_uop_pdst),
		.io_write_ports_2_bits_data(_alu_exe_unit_0_io_alu_resp_bits_data)
	);
	FullyPortedRF_2 pregfile(
		.clock(clock),
		.io_arb_read_reqs_0_bits(_alu_exe_unit_0_io_arb_prf_req_bits),
		.io_rrd_read_resps_0(_pregfile_io_rrd_read_resps_0),
		.io_write_ports_0_valid((_alu_exe_unit_0_io_alu_resp_valid & |_alu_exe_unit_0_io_alu_resp_bits_uop_br_type) & _alu_exe_unit_0_io_alu_resp_bits_uop_is_sfb),
		.io_write_ports_0_bits_addr(_alu_exe_unit_0_io_alu_resp_bits_uop_pdst),
		.io_write_ports_0_bits_data(_alu_exe_unit_0_io_alu_resp_bits_data[0])
	);
	FullyPortedRF_3 immregfile(
		.clock(clock),
		.io_arb_read_reqs_0_bits(_alu_exe_unit_0_io_arb_immrf_req_bits),
		.io_arb_read_reqs_2_bits(_mem_exe_unit_1_io_arb_immrf_req_bits),
		.io_arb_read_reqs_3_bits(_unique_exe_unit_0_io_arb_immrf_req_bits),
		.io_rrd_read_resps_0(_immregfile_io_rrd_read_resps_0),
		.io_rrd_read_resps_2(_immregfile_io_rrd_read_resps_2),
		.io_rrd_read_resps_3(_immregfile_io_rrd_read_resps_3),
		.io_write_ports_0_valid(immregfile_io_write_ports_0_valid_REG & ~((uop_imm_sel == 3'h6) | (uop_imm_sel == 3'h5))),
		.io_write_ports_0_bits_addr({1'h0, uop_pimm}),
		.io_write_ports_0_bits_data(uop_imm_packed)
	);
	FullyPortedRF_4 bregfile(
		.clock(clock),
		.io_arb_read_reqs_0_bits(_alu_exe_unit_0_io_arb_brf_req_bits),
		.io_rrd_read_resps_0_ldq_idx(_bregfile_io_rrd_read_resps_0_ldq_idx),
		.io_rrd_read_resps_0_stq_idx(_bregfile_io_rrd_read_resps_0_stq_idx),
		.io_write_ports_0_valid(bregfile_io_write_ports_0_valid_REG & ((((((((uop_br_type == 4'h1) | (uop_br_type == 4'h2)) | (uop_br_type == 4'h3)) | (uop_br_type == 4'h4)) | (uop_br_type == 4'h5)) | (uop_br_type == 4'h6)) & ~uop_is_sfb) | (uop_br_type == 4'h8))),
		.io_write_ports_0_bits_addr({3'h0, uop_br_tag}),
		.io_write_ports_0_bits_data_ldq_idx(uop_ldq_idx),
		.io_write_ports_0_bits_data_stq_idx(uop_stq_idx),
		.io_write_ports_0_bits_data_rxq_idx(uop_rxq_idx)
	);
	Rob rob(
		.clock(clock),
		.reset(reset),
		.io_enq_valids_0(dis_fire_0),
		.io_enq_uops_0_is_rvc(_rename_stage_io_ren2_uops_0_is_rvc),
		.io_enq_uops_0_br_mask(_rename_stage_io_ren2_uops_0_br_mask),
		.io_enq_uops_0_br_type(_rename_stage_io_ren2_uops_0_br_type),
		.io_enq_uops_0_is_fence(_rename_stage_io_ren2_uops_0_is_fence),
		.io_enq_uops_0_is_fencei(_rename_stage_io_ren2_uops_0_is_fencei),
		.io_enq_uops_0_is_eret(_rename_stage_io_ren2_uops_0_is_eret),
		.io_enq_uops_0_is_sys_pc2epc(_rename_stage_io_ren2_uops_0_is_sys_pc2epc),
		.io_enq_uops_0_ftq_idx(_rename_stage_io_ren2_uops_0_ftq_idx),
		.io_enq_uops_0_edge_inst(_rename_stage_io_ren2_uops_0_edge_inst),
		.io_enq_uops_0_pc_lob(_rename_stage_io_ren2_uops_0_pc_lob),
		.io_enq_uops_0_rob_idx(_rob_io_rob_tail_idx),
		.io_enq_uops_0_pdst(dis_uops_0_pdst),
		.io_enq_uops_0_stale_pdst(dis_uops_0_stale_pdst),
		.io_enq_uops_0_exception(_rename_stage_io_ren2_uops_0_exception),
		.io_enq_uops_0_exc_cause(_rename_stage_io_ren2_uops_0_exc_cause),
		.io_enq_uops_0_uses_ldq(_rename_stage_io_ren2_uops_0_uses_ldq),
		.io_enq_uops_0_uses_stq(_rename_stage_io_ren2_uops_0_uses_stq),
		.io_enq_uops_0_is_unique(_rename_stage_io_ren2_uops_0_is_unique),
		.io_enq_uops_0_flush_on_commit(_rename_stage_io_ren2_uops_0_flush_on_commit),
		.io_enq_uops_0_ldst(_rename_stage_io_ren2_uops_0_ldst),
		.io_enq_uops_0_dst_rtype(_rename_stage_io_ren2_uops_0_dst_rtype),
		.io_enq_uops_0_fp_val(_rename_stage_io_ren2_uops_0_fp_val),
		.io_enq_uops_0_debug_fsrc(_rename_stage_io_ren2_uops_0_debug_fsrc),
		.io_enq_partial_stall(dis_stalls_0),
		.io_xcpt_fetch_pc(io_ifu_rrd_ftq_resps_0_pc),
		.io_rob_tail_idx(_rob_io_rob_tail_idx),
		.io_rob_head_idx(io_lsu_rob_head_idx),
		.io_brupdate_b1_resolve_mask(b1_resolve_mask),
		.io_brupdate_b1_mispredict_mask(b1_mispredict_mask),
		.io_brupdate_b2_uop_rob_idx(b2_uop_rob_idx),
		.io_brupdate_b2_mispredict(b2_mispredict),
		.io_wb_resps_0_valid(rob_io_wb_resps_0_REG_1_valid),
		.io_wb_resps_0_bits_uop_rob_idx(rob_io_wb_resps_0_REG_1_bits_uop_rob_idx),
		.io_wb_resps_0_bits_uop_pdst(rob_io_wb_resps_0_REG_1_bits_uop_pdst),
		.io_wb_resps_1_valid(rob_io_wb_resps_1_valid_REG_1),
		.io_wb_resps_1_bits_uop_rob_idx(rob_io_wb_resps_1_bits_REG_uop_rob_idx),
		.io_wb_resps_1_bits_uop_pdst(rob_io_wb_resps_1_bits_REG_uop_pdst),
		.io_wb_resps_1_bits_predicated(rob_io_wb_resps_1_bits_REG_predicated),
		.io_wb_resps_1_bits_fflags_valid(rob_io_wb_resps_1_bits_REG_fflags_valid),
		.io_wb_resps_1_bits_fflags_bits(rob_io_wb_resps_1_bits_REG_fflags_bits),
		.io_wb_resps_2_valid(rob_io_wb_resps_2_valid_REG_1),
		.io_wb_resps_2_bits_uop_rob_idx(rob_io_wb_resps_2_bits_REG_uop_rob_idx),
		.io_wb_resps_2_bits_uop_pdst(rob_io_wb_resps_2_bits_REG_uop_pdst),
		.io_wb_resps_2_bits_predicated(rob_io_wb_resps_2_bits_REG_predicated),
		.io_wb_resps_3_valid(_fp_pipeline_io_wb_0_valid),
		.io_wb_resps_3_bits_uop_rob_idx(_fp_pipeline_io_wb_0_bits_uop_rob_idx),
		.io_wb_resps_3_bits_uop_pdst(_fp_pipeline_io_wb_0_bits_uop_pdst),
		.io_wb_resps_3_bits_fflags_valid(_fp_pipeline_io_wb_0_bits_fflags_valid),
		.io_wb_resps_3_bits_fflags_bits(_fp_pipeline_io_wb_0_bits_fflags_bits),
		.io_wb_resps_4_valid(_fp_pipeline_io_wb_1_valid),
		.io_wb_resps_4_bits_uop_rob_idx(_fp_pipeline_io_wb_1_bits_uop_rob_idx),
		.io_wb_resps_4_bits_uop_pdst(_fp_pipeline_io_wb_1_bits_uop_pdst),
		.io_wb_resps_4_bits_predicated(_fp_pipeline_io_wb_1_bits_predicated),
		.io_wb_resps_4_bits_fflags_valid(_fp_pipeline_io_wb_1_bits_fflags_valid),
		.io_wb_resps_4_bits_fflags_bits(_fp_pipeline_io_wb_1_bits_fflags_bits),
		.io_lsu_clr_bsy_0_valid(io_lsu_clr_bsy_0_valid),
		.io_lsu_clr_bsy_0_bits(io_lsu_clr_bsy_0_bits),
		.io_lsu_clr_unsafe_0_valid(io_lsu_clr_unsafe_0_valid),
		.io_lsu_clr_unsafe_0_bits(io_lsu_clr_unsafe_0_bits),
		.io_lxcpt_valid(io_lsu_lxcpt_valid),
		.io_lxcpt_bits_uop_br_mask(io_lsu_lxcpt_bits_uop_br_mask),
		.io_lxcpt_bits_uop_rob_idx(io_lsu_lxcpt_bits_uop_rob_idx),
		.io_lxcpt_bits_cause(io_lsu_lxcpt_bits_cause),
		.io_lxcpt_bits_badvaddr(io_lsu_lxcpt_bits_badvaddr),
		.io_commit_valids_0(_rob_io_commit_valids_0),
		.io_commit_arch_valids_0(_rob_io_commit_arch_valids_0),
		.io_commit_uops_0_br_type(_rob_io_commit_uops_0_br_type),
		.io_commit_uops_0_is_fencei(_rob_io_commit_uops_0_is_fencei),
		.io_commit_uops_0_ftq_idx(_rob_io_commit_uops_0_ftq_idx),
		.io_commit_uops_0_pdst(_rob_io_commit_uops_0_pdst),
		.io_commit_uops_0_stale_pdst(_rob_io_commit_uops_0_stale_pdst),
		.io_commit_uops_0_uses_ldq(io_lsu_commit_uops_0_uses_ldq),
		.io_commit_uops_0_uses_stq(io_lsu_commit_uops_0_uses_stq),
		.io_commit_uops_0_ldst(_rob_io_commit_uops_0_ldst),
		.io_commit_uops_0_dst_rtype(_rob_io_commit_uops_0_dst_rtype),
		.io_commit_uops_0_debug_fsrc(_rob_io_commit_uops_0_debug_fsrc),
		.io_commit_fflags_valid(_rob_io_commit_fflags_valid),
		.io_commit_fflags_bits(_rob_io_commit_fflags_bits),
		.io_rollback(_rob_io_rollback),
		.io_com_load_is_at_rob_head(io_lsu_commit_load_at_rob_head),
		.io_com_xcpt_valid(_rob_io_com_xcpt_valid),
		.io_com_xcpt_bits_ftq_idx(_rob_io_com_xcpt_bits_ftq_idx),
		.io_com_xcpt_bits_edge_inst(_rob_io_com_xcpt_bits_edge_inst),
		.io_com_xcpt_bits_pc_lob(_rob_io_com_xcpt_bits_pc_lob),
		.io_com_xcpt_bits_cause(_rob_io_com_xcpt_bits_cause),
		.io_com_xcpt_bits_badvaddr(_rob_io_com_xcpt_bits_badvaddr),
		.io_csr_stall(_csr_io_csr_stall),
		.io_flush_valid(_rob_io_flush_valid),
		.io_flush_bits_ftq_idx(_rob_io_flush_bits_ftq_idx),
		.io_flush_bits_edge_inst(_rob_io_flush_bits_edge_inst),
		.io_flush_bits_is_rvc(_rob_io_flush_bits_is_rvc),
		.io_flush_bits_pc_lob(_rob_io_flush_bits_pc_lob),
		.io_flush_bits_flush_typ(_rob_io_flush_bits_flush_typ),
		.io_empty(_rob_io_empty),
		.io_ready(_rob_io_ready),
		.io_flush_frontend(_rob_io_flush_frontend)
	);
	CSRFile csr(
		.clock(clock),
		.reset(reset),
		.io_ungated_clock(clock),
		.io_interrupts_debug(io_interrupts_debug),
		.io_interrupts_mtip(io_interrupts_mtip),
		.io_interrupts_msip(io_interrupts_msip),
		.io_interrupts_meip(io_interrupts_meip),
		.io_interrupts_seip(io_interrupts_seip),
		.io_hartid(io_hartid),
		.io_rw_addr(_unique_exe_unit_0_io_csr_resp_bits_addr),
		.io_rw_cmd(_unique_exe_unit_0_io_csr_resp_bits_uop_csr_cmd & {_unique_exe_unit_0_io_csr_resp_valid, 2'h3}),
		.io_rw_rdata(_csr_io_rw_rdata),
		.io_rw_wdata(_unique_exe_unit_0_io_csr_resp_bits_data),
		.io_decode_0_inst(_decode_0_io_csr_decode_inst),
		.io_decode_0_fp_illegal(_csr_io_decode_0_fp_illegal),
		.io_decode_0_read_illegal(_csr_io_decode_0_read_illegal),
		.io_decode_0_write_illegal(_csr_io_decode_0_write_illegal),
		.io_decode_0_write_flush(_csr_io_decode_0_write_flush),
		.io_decode_0_system_illegal(_csr_io_decode_0_system_illegal),
		.io_csr_stall(_csr_io_csr_stall),
		.io_singleStep(_csr_io_singleStep),
		.io_status_debug(_csr_io_status_debug),
		.io_status_dprv(io_ptw_status_dprv),
		.io_status_prv(io_ptw_status_prv),
		.io_status_mxr(io_ptw_status_mxr),
		.io_status_sum(io_ptw_status_sum),
		.io_ptbr_mode(io_ptw_ptbr_mode),
		.io_ptbr_ppn(io_ptw_ptbr_ppn),
		.io_evec(_csr_io_evec),
		.io_exception(csr_io_exception_REG),
		.io_retire(csr_io_retire_REG),
		.io_cause(csr_io_cause_REG),
		.io_pc(({io_ifu_com_pc[39:6], 6'h00} + {34'h000000000, csr_io_pc_REG}) - {38'h0000000000, csr_io_pc_REG_1, 1'h0}),
		.io_tval((csr_io_exception_REG & (((((((((csr_io_cause_REG == 64'h0000000000000003) | (csr_io_cause_REG == 64'h0000000000000004)) | (csr_io_cause_REG == 64'h0000000000000006)) | (csr_io_cause_REG == 64'h0000000000000005)) | (csr_io_cause_REG == 64'h0000000000000007)) | (csr_io_cause_REG == 64'h0000000000000001)) | (csr_io_cause_REG == 64'h000000000000000d)) | (csr_io_cause_REG == 64'h000000000000000f)) | (csr_io_cause_REG == 64'h000000000000000c)) ? csr_io_tval_REG : 40'h0000000000)),
		.io_fcsr_rm(_csr_io_fcsr_rm),
		.io_fcsr_flags_valid(_rob_io_commit_fflags_valid),
		.io_fcsr_flags_bits(_rob_io_commit_fflags_bits),
		.io_set_fs_dirty(_rob_io_commit_fflags_valid),
		.io_interrupt(_csr_io_interrupt),
		.io_interrupt_cause(_csr_io_interrupt_cause),
		.io_pmp_0_cfg_l(io_ptw_pmp_0_cfg_l),
		.io_pmp_0_cfg_a(io_ptw_pmp_0_cfg_a),
		.io_pmp_0_cfg_x(io_ptw_pmp_0_cfg_x),
		.io_pmp_0_cfg_w(io_ptw_pmp_0_cfg_w),
		.io_pmp_0_cfg_r(io_ptw_pmp_0_cfg_r),
		.io_pmp_0_addr(io_ptw_pmp_0_addr),
		.io_pmp_0_mask(io_ptw_pmp_0_mask),
		.io_pmp_1_cfg_l(io_ptw_pmp_1_cfg_l),
		.io_pmp_1_cfg_a(io_ptw_pmp_1_cfg_a),
		.io_pmp_1_cfg_x(io_ptw_pmp_1_cfg_x),
		.io_pmp_1_cfg_w(io_ptw_pmp_1_cfg_w),
		.io_pmp_1_cfg_r(io_ptw_pmp_1_cfg_r),
		.io_pmp_1_addr(io_ptw_pmp_1_addr),
		.io_pmp_1_mask(io_ptw_pmp_1_mask),
		.io_pmp_2_cfg_l(io_ptw_pmp_2_cfg_l),
		.io_pmp_2_cfg_a(io_ptw_pmp_2_cfg_a),
		.io_pmp_2_cfg_x(io_ptw_pmp_2_cfg_x),
		.io_pmp_2_cfg_w(io_ptw_pmp_2_cfg_w),
		.io_pmp_2_cfg_r(io_ptw_pmp_2_cfg_r),
		.io_pmp_2_addr(io_ptw_pmp_2_addr),
		.io_pmp_2_mask(io_ptw_pmp_2_mask),
		.io_pmp_3_cfg_l(io_ptw_pmp_3_cfg_l),
		.io_pmp_3_cfg_a(io_ptw_pmp_3_cfg_a),
		.io_pmp_3_cfg_x(io_ptw_pmp_3_cfg_x),
		.io_pmp_3_cfg_w(io_ptw_pmp_3_cfg_w),
		.io_pmp_3_cfg_r(io_ptw_pmp_3_cfg_r),
		.io_pmp_3_addr(io_ptw_pmp_3_addr),
		.io_pmp_3_mask(io_ptw_pmp_3_mask),
		.io_pmp_4_cfg_l(io_ptw_pmp_4_cfg_l),
		.io_pmp_4_cfg_a(io_ptw_pmp_4_cfg_a),
		.io_pmp_4_cfg_x(io_ptw_pmp_4_cfg_x),
		.io_pmp_4_cfg_w(io_ptw_pmp_4_cfg_w),
		.io_pmp_4_cfg_r(io_ptw_pmp_4_cfg_r),
		.io_pmp_4_addr(io_ptw_pmp_4_addr),
		.io_pmp_4_mask(io_ptw_pmp_4_mask),
		.io_pmp_5_cfg_l(io_ptw_pmp_5_cfg_l),
		.io_pmp_5_cfg_a(io_ptw_pmp_5_cfg_a),
		.io_pmp_5_cfg_x(io_ptw_pmp_5_cfg_x),
		.io_pmp_5_cfg_w(io_ptw_pmp_5_cfg_w),
		.io_pmp_5_cfg_r(io_ptw_pmp_5_cfg_r),
		.io_pmp_5_addr(io_ptw_pmp_5_addr),
		.io_pmp_5_mask(io_ptw_pmp_5_mask),
		.io_pmp_6_cfg_l(io_ptw_pmp_6_cfg_l),
		.io_pmp_6_cfg_a(io_ptw_pmp_6_cfg_a),
		.io_pmp_6_cfg_x(io_ptw_pmp_6_cfg_x),
		.io_pmp_6_cfg_w(io_ptw_pmp_6_cfg_w),
		.io_pmp_6_cfg_r(io_ptw_pmp_6_cfg_r),
		.io_pmp_6_addr(io_ptw_pmp_6_addr),
		.io_pmp_6_mask(io_ptw_pmp_6_mask),
		.io_pmp_7_cfg_l(io_ptw_pmp_7_cfg_l),
		.io_pmp_7_cfg_a(io_ptw_pmp_7_cfg_a),
		.io_pmp_7_cfg_x(io_ptw_pmp_7_cfg_x),
		.io_pmp_7_cfg_w(io_ptw_pmp_7_cfg_w),
		.io_pmp_7_cfg_r(io_ptw_pmp_7_cfg_r),
		.io_pmp_7_addr(io_ptw_pmp_7_addr),
		.io_pmp_7_mask(io_ptw_pmp_7_mask),
		.io_counters_0_eventSel(_csr_io_counters_0_eventSel),
		.io_counters_0_inc(csr_io_counters_0_inc_REG),
		.io_counters_1_eventSel(_csr_io_counters_1_eventSel),
		.io_counters_1_inc(csr_io_counters_1_inc_REG),
		.io_customCSRs_0_value(_csr_io_customCSRs_0_value),
		.io_customCSRs_1_value(_csr_io_customCSRs_1_value),
		.io_customCSRs_2_value(_csr_io_customCSRs_2_value)
	);
	Arbiter3_UInt4 ftq_arb(
		.io_in_0_valid(_rob_io_flush_valid),
		.io_in_0_bits(_rob_io_flush_bits_ftq_idx),
		.io_in_1_valid(live_brinfos_0),
		.io_in_1_bits(brinfos_0_bits_uop_ftq_idx),
		.io_in_2_ready(_ftq_arb_io_in_2_ready),
		.io_in_2_bits(_decode_0_io_deq_uop_ftq_idx),
		.io_out_bits(io_ifu_arb_ftq_reqs_0)
	);
	MaxPeriodFibonacciLFSR_2 dis_uops_0_pdst_prng(
		.clock(clock),
		.reset(reset),
		.io_out_0(_dis_uops_0_pdst_prng_io_out_0),
		.io_out_1(_dis_uops_0_pdst_prng_io_out_1),
		.io_out_2(_dis_uops_0_pdst_prng_io_out_2),
		.io_out_3(_dis_uops_0_pdst_prng_io_out_3),
		.io_out_4(_dis_uops_0_pdst_prng_io_out_4),
		.io_out_5(_dis_uops_0_pdst_prng_io_out_5)
	);
	Arbiter4_ExeUnitResp ll_arb(
		.io_in_0_valid(_unique_exe_unit_0_io_mul_resp_valid),
		.io_in_0_bits_uop_br_mask(_unique_exe_unit_0_io_mul_resp_bits_uop_br_mask),
		.io_in_0_bits_uop_rob_idx(_unique_exe_unit_0_io_mul_resp_bits_uop_rob_idx),
		.io_in_0_bits_uop_pdst(_unique_exe_unit_0_io_mul_resp_bits_uop_pdst),
		.io_in_0_bits_uop_dst_rtype(_unique_exe_unit_0_io_mul_resp_bits_uop_dst_rtype),
		.io_in_0_bits_data(_unique_exe_unit_0_io_mul_resp_bits_data),
		.io_in_1_ready(_ll_arb_io_in_1_ready),
		.io_in_1_valid(_fp_pipeline_io_to_int_valid),
		.io_in_1_bits_uop_br_mask(_fp_pipeline_io_to_int_bits_uop_br_mask),
		.io_in_1_bits_uop_rob_idx(_fp_pipeline_io_to_int_bits_uop_rob_idx),
		.io_in_1_bits_uop_pdst(_fp_pipeline_io_to_int_bits_uop_pdst),
		.io_in_1_bits_uop_dst_rtype(_fp_pipeline_io_to_int_bits_uop_dst_rtype),
		.io_in_1_bits_data(_fp_pipeline_io_to_int_bits_data),
		.io_in_1_bits_predicated(_fp_pipeline_io_to_int_bits_predicated),
		.io_in_1_bits_fflags_valid(_fp_pipeline_io_to_int_bits_fflags_valid),
		.io_in_1_bits_fflags_bits(_fp_pipeline_io_to_int_bits_fflags_bits),
		.io_in_2_ready(_ll_arb_io_in_2_ready),
		.io_in_2_valid(_unique_exe_unit_0_io_div_resp_valid),
		.io_in_2_bits_uop_br_mask(_unique_exe_unit_0_io_div_resp_bits_uop_br_mask),
		.io_in_2_bits_uop_rob_idx(_unique_exe_unit_0_io_div_resp_bits_uop_rob_idx),
		.io_in_2_bits_uop_pdst(_unique_exe_unit_0_io_div_resp_bits_uop_pdst),
		.io_in_2_bits_uop_dst_rtype(_unique_exe_unit_0_io_div_resp_bits_uop_dst_rtype),
		.io_in_2_bits_data(_unique_exe_unit_0_io_div_resp_bits_data),
		.io_in_3_ready(_ll_arb_io_in_3_ready),
		.io_in_3_valid(_unique_exe_unit_0_io_csr_resp_valid),
		.io_in_3_bits_uop_br_mask(_unique_exe_unit_0_io_csr_resp_bits_uop_br_mask),
		.io_in_3_bits_uop_rob_idx(_unique_exe_unit_0_io_csr_resp_bits_uop_rob_idx),
		.io_in_3_bits_uop_pdst(_unique_exe_unit_0_io_csr_resp_bits_uop_pdst),
		.io_in_3_bits_uop_dst_rtype(_unique_exe_unit_0_io_csr_resp_bits_uop_dst_rtype),
		.io_in_3_bits_data(_csr_io_rw_rdata),
		.io_out_valid(_ll_arb_io_out_valid),
		.io_out_bits_uop_br_mask(_ll_arb_io_out_bits_uop_br_mask),
		.io_out_bits_uop_rob_idx(_ll_arb_io_out_bits_uop_rob_idx),
		.io_out_bits_uop_pdst(_ll_arb_io_out_bits_uop_pdst),
		.io_out_bits_uop_dst_rtype(_ll_arb_io_out_bits_uop_dst_rtype),
		.io_out_bits_data(_ll_arb_io_out_bits_data),
		.io_out_bits_predicated(_ll_arb_io_out_bits_predicated),
		.io_out_bits_fflags_valid(_ll_arb_io_out_bits_fflags_valid),
		.io_out_bits_fflags_bits(_ll_arb_io_out_bits_fflags_bits)
	);
	plusarg_reader #(
		.DEFAULT(13),
		.FORMAT("boom_timeout=%d"),
		.WIDTH(5)
	) plusarg_reader(.out(_plusarg_reader_out));
	assign io_ifu_fetchpacket_ready = dec_ready;
	assign io_ifu_arb_ftq_reqs_1 = (_alu_exe_unit_0_io_arb_ftq_reqs_0_valid ? _alu_exe_unit_0_io_arb_ftq_reqs_0_bits : 4'h0) | (_alu_exe_unit_0_io_arb_ftq_reqs_0_valid | ~use_port_2 ? 4'h0 : _alu_exe_unit_0_io_arb_ftq_reqs_1_bits);
	assign io_ifu_arb_ftq_reqs_2 = (use_port_3 ? _alu_exe_unit_0_io_arb_ftq_reqs_1_bits : 4'h0);
	assign io_ifu_sfence_valid = _unique_exe_unit_0_io_sfence_valid;
	assign io_ifu_sfence_bits_rs1 = _unique_exe_unit_0_io_sfence_bits_rs1;
	assign io_ifu_sfence_bits_rs2 = _unique_exe_unit_0_io_sfence_bits_rs2;
	assign io_ifu_sfence_bits_addr = _unique_exe_unit_0_io_sfence_bits_addr;
	assign io_ifu_brupdate_b2_uop_ftq_idx = b2_uop_ftq_idx;
	assign io_ifu_brupdate_b2_uop_pc_lob = b2_uop_pc_lob;
	assign io_ifu_brupdate_b2_mispredict = b2_mispredict;
	assign io_ifu_brupdate_b2_taken = b2_taken;
	assign io_ifu_redirect_flush = io_ifu_redirect_flush_0;
	assign io_ifu_redirect_val = REG | _GEN_0;
	assign io_ifu_redirect_pc = (REG ? (flush_typ[0] ? (flush_typ == 3'h3 ? io_ifu_redirect_pc_r_2 : _csr_io_evec) : (flush_typ == 3'h2 ? _flush_pc_T_6 : _flush_pc_T_6 + {37'h0000000000, (flush_pc_next_REG ? 3'h2 : 3'h4)})) : (b2_pc_sel == 2'h0 ? _npc_T_2 : (b2_cfi_type == 3'h3 ? b2_jalr_target : (_GEN_1 + {{19 {b2_target_offset[20]}}, b2_target_offset}) + {{39 {b2_uop_edge_inst}}, 1'h0})));
	assign io_ifu_redirect_ftq_idx = (REG ? io_ifu_redirect_ftq_idx_REG : b2_uop_ftq_idx);
	assign io_ifu_redirect_ghist_old_history = (REG ? 64'h0000000000000000 : (use_same_ghist ? io_ifu_rrd_ftq_resps_0_ghist_old_history : (_next_ghist_new_history_old_history_T_1 ? {io_ifu_rrd_ftq_resps_0_ghist_old_history[62:0], 1'h1} : (|((io_ifu_rrd_ftq_resps_0_entry_br_mask & {&b2_uop_pc_lob[2:1], _GEN_2[2], _GEN_3[1], _GEN_3[0] | &b2_uop_pc_lob[2:1]}) & ~(_next_ghist_new_history_old_history_T_1 ? next_ghist_cfi_idx_oh : 4'h0)) | io_ifu_rrd_ftq_resps_0_ghist_current_saw_branch_not_taken ? {io_ifu_rrd_ftq_resps_0_ghist_old_history[62:0], 1'h0} : io_ifu_rrd_ftq_resps_0_ghist_old_history))));
	assign io_ifu_redirect_ghist_current_saw_branch_not_taken = REG | use_same_ghist;
	assign io_ifu_redirect_ghist_new_saw_branch_not_taken = (~REG & use_same_ghist) & io_ifu_rrd_ftq_resps_0_ghist_new_saw_branch_not_taken;
	assign io_ifu_redirect_ghist_new_saw_branch_taken = (~REG & use_same_ghist) & io_ifu_rrd_ftq_resps_0_ghist_new_saw_branch_taken;
	assign io_ifu_redirect_ghist_ras_idx = (REG ? io_ifu_rrd_ftq_resps_0_entry_ras_idx : (use_same_ghist ? io_ifu_rrd_ftq_resps_0_ghist_ras_idx : (io_ifu_rrd_ftq_resps_0_entry_cfi_is_call & _next_ghist_T_3 ? io_ifu_rrd_ftq_resps_0_ghist_ras_idx + 5'h01 : (io_ifu_rrd_ftq_resps_0_entry_cfi_is_ret & _next_ghist_T_3 ? io_ifu_rrd_ftq_resps_0_ghist_ras_idx - 5'h01 : io_ifu_rrd_ftq_resps_0_ghist_ras_idx))));
	assign io_ifu_commit_valid = (REG_2 | _rob_io_commit_valids_0) | _rob_io_com_xcpt_valid;
	assign io_ifu_commit_bits = {12'h000, (REG_2 ? io_ifu_commit_bits_REG : (_rob_io_com_xcpt_valid ? _rob_io_com_xcpt_bits_ftq_idx : _rob_io_commit_uops_0_ftq_idx))};
	assign io_ifu_flush_icache = (_rob_io_commit_arch_valids_0 & _rob_io_commit_uops_0_is_fencei) | io_ifu_flush_icache_REG;
	assign io_ifu_enable_bpd = _csr_io_customCSRs_1_value[0];
	assign io_ptw_sfence_valid = _unique_exe_unit_0_io_sfence_valid;
	assign io_ptw_sfence_bits_rs1 = _unique_exe_unit_0_io_sfence_bits_rs1;
	assign io_ptw_sfence_bits_rs2 = _unique_exe_unit_0_io_sfence_bits_rs2;
	assign io_ptw_sfence_bits_addr = _unique_exe_unit_0_io_sfence_bits_addr;
	assign io_ptw_status_debug = _csr_io_status_debug;
	assign io_lsu_sfence_valid = _unique_exe_unit_0_io_sfence_valid;
	assign io_lsu_sfence_bits_rs1 = _unique_exe_unit_0_io_sfence_bits_rs1;
	assign io_lsu_sfence_bits_rs2 = _unique_exe_unit_0_io_sfence_bits_rs2;
	assign io_lsu_sfence_bits_addr = _unique_exe_unit_0_io_sfence_bits_addr;
	assign io_lsu_dis_uops_0_valid = dis_fire_0;
	assign io_lsu_dis_uops_0_bits_inst = _rename_stage_io_ren2_uops_0_inst;
	assign io_lsu_dis_uops_0_bits_debug_inst = _rename_stage_io_ren2_uops_0_debug_inst;
	assign io_lsu_dis_uops_0_bits_is_rvc = _rename_stage_io_ren2_uops_0_is_rvc;
	assign io_lsu_dis_uops_0_bits_debug_pc = _rename_stage_io_ren2_uops_0_debug_pc;
	assign io_lsu_dis_uops_0_bits_iq_type_0 = _rename_stage_io_ren2_uops_0_iq_type_0;
	assign io_lsu_dis_uops_0_bits_iq_type_1 = _rename_stage_io_ren2_uops_0_iq_type_1;
	assign io_lsu_dis_uops_0_bits_iq_type_2 = _rename_stage_io_ren2_uops_0_iq_type_2;
	assign io_lsu_dis_uops_0_bits_iq_type_3 = _rename_stage_io_ren2_uops_0_iq_type_3;
	assign io_lsu_dis_uops_0_bits_fu_code_0 = _rename_stage_io_ren2_uops_0_fu_code_0;
	assign io_lsu_dis_uops_0_bits_fu_code_1 = _rename_stage_io_ren2_uops_0_fu_code_1;
	assign io_lsu_dis_uops_0_bits_fu_code_2 = _rename_stage_io_ren2_uops_0_fu_code_2;
	assign io_lsu_dis_uops_0_bits_fu_code_3 = _rename_stage_io_ren2_uops_0_fu_code_3;
	assign io_lsu_dis_uops_0_bits_fu_code_4 = _rename_stage_io_ren2_uops_0_fu_code_4;
	assign io_lsu_dis_uops_0_bits_fu_code_5 = _rename_stage_io_ren2_uops_0_fu_code_5;
	assign io_lsu_dis_uops_0_bits_fu_code_6 = _rename_stage_io_ren2_uops_0_fu_code_6;
	assign io_lsu_dis_uops_0_bits_fu_code_7 = _rename_stage_io_ren2_uops_0_fu_code_7;
	assign io_lsu_dis_uops_0_bits_fu_code_8 = _rename_stage_io_ren2_uops_0_fu_code_8;
	assign io_lsu_dis_uops_0_bits_fu_code_9 = _rename_stage_io_ren2_uops_0_fu_code_9;
	assign io_lsu_dis_uops_0_bits_iw_p1_speculative_child = _rename_stage_io_ren2_uops_0_iw_p1_speculative_child;
	assign io_lsu_dis_uops_0_bits_iw_p2_speculative_child = _rename_stage_io_ren2_uops_0_iw_p2_speculative_child;
	assign io_lsu_dis_uops_0_bits_br_mask = _rename_stage_io_ren2_uops_0_br_mask;
	assign io_lsu_dis_uops_0_bits_br_tag = _rename_stage_io_ren2_uops_0_br_tag;
	assign io_lsu_dis_uops_0_bits_br_type = _rename_stage_io_ren2_uops_0_br_type;
	assign io_lsu_dis_uops_0_bits_is_sfb = _rename_stage_io_ren2_uops_0_is_sfb;
	assign io_lsu_dis_uops_0_bits_is_fence = _rename_stage_io_ren2_uops_0_is_fence;
	assign io_lsu_dis_uops_0_bits_is_fencei = _rename_stage_io_ren2_uops_0_is_fencei;
	assign io_lsu_dis_uops_0_bits_is_sfence = _rename_stage_io_ren2_uops_0_is_sfence;
	assign io_lsu_dis_uops_0_bits_is_amo = _rename_stage_io_ren2_uops_0_is_amo;
	assign io_lsu_dis_uops_0_bits_is_eret = _rename_stage_io_ren2_uops_0_is_eret;
	assign io_lsu_dis_uops_0_bits_is_sys_pc2epc = _rename_stage_io_ren2_uops_0_is_sys_pc2epc;
	assign io_lsu_dis_uops_0_bits_is_rocc = _rename_stage_io_ren2_uops_0_is_rocc;
	assign io_lsu_dis_uops_0_bits_is_mov = _rename_stage_io_ren2_uops_0_is_mov;
	assign io_lsu_dis_uops_0_bits_ftq_idx = _rename_stage_io_ren2_uops_0_ftq_idx;
	assign io_lsu_dis_uops_0_bits_edge_inst = _rename_stage_io_ren2_uops_0_edge_inst;
	assign io_lsu_dis_uops_0_bits_pc_lob = _rename_stage_io_ren2_uops_0_pc_lob;
	assign io_lsu_dis_uops_0_bits_taken = _rename_stage_io_ren2_uops_0_taken;
	assign io_lsu_dis_uops_0_bits_imm_rename = _rename_stage_io_ren2_uops_0_imm_rename;
	assign io_lsu_dis_uops_0_bits_imm_sel = _imm_rename_stage_io_ren2_uops_0_imm_sel;
	assign io_lsu_dis_uops_0_bits_pimm = _imm_rename_stage_io_ren2_uops_0_pimm;
	assign io_lsu_dis_uops_0_bits_imm_packed = _rename_stage_io_ren2_uops_0_imm_packed;
	assign io_lsu_dis_uops_0_bits_op1_sel = _rename_stage_io_ren2_uops_0_op1_sel;
	assign io_lsu_dis_uops_0_bits_op2_sel = _rename_stage_io_ren2_uops_0_op2_sel;
	assign io_lsu_dis_uops_0_bits_fp_ctrl_ldst = _rename_stage_io_ren2_uops_0_fp_ctrl_ldst;
	assign io_lsu_dis_uops_0_bits_fp_ctrl_wen = _rename_stage_io_ren2_uops_0_fp_ctrl_wen;
	assign io_lsu_dis_uops_0_bits_fp_ctrl_ren1 = _rename_stage_io_ren2_uops_0_fp_ctrl_ren1;
	assign io_lsu_dis_uops_0_bits_fp_ctrl_ren2 = _rename_stage_io_ren2_uops_0_fp_ctrl_ren2;
	assign io_lsu_dis_uops_0_bits_fp_ctrl_ren3 = _rename_stage_io_ren2_uops_0_fp_ctrl_ren3;
	assign io_lsu_dis_uops_0_bits_fp_ctrl_swap12 = _rename_stage_io_ren2_uops_0_fp_ctrl_swap12;
	assign io_lsu_dis_uops_0_bits_fp_ctrl_swap23 = _rename_stage_io_ren2_uops_0_fp_ctrl_swap23;
	assign io_lsu_dis_uops_0_bits_fp_ctrl_typeTagIn = _rename_stage_io_ren2_uops_0_fp_ctrl_typeTagIn;
	assign io_lsu_dis_uops_0_bits_fp_ctrl_typeTagOut = _rename_stage_io_ren2_uops_0_fp_ctrl_typeTagOut;
	assign io_lsu_dis_uops_0_bits_fp_ctrl_fromint = _rename_stage_io_ren2_uops_0_fp_ctrl_fromint;
	assign io_lsu_dis_uops_0_bits_fp_ctrl_toint = _rename_stage_io_ren2_uops_0_fp_ctrl_toint;
	assign io_lsu_dis_uops_0_bits_fp_ctrl_fastpipe = _rename_stage_io_ren2_uops_0_fp_ctrl_fastpipe;
	assign io_lsu_dis_uops_0_bits_fp_ctrl_fma = _rename_stage_io_ren2_uops_0_fp_ctrl_fma;
	assign io_lsu_dis_uops_0_bits_fp_ctrl_div = _rename_stage_io_ren2_uops_0_fp_ctrl_div;
	assign io_lsu_dis_uops_0_bits_fp_ctrl_sqrt = _rename_stage_io_ren2_uops_0_fp_ctrl_sqrt;
	assign io_lsu_dis_uops_0_bits_fp_ctrl_wflags = _rename_stage_io_ren2_uops_0_fp_ctrl_wflags;
	assign io_lsu_dis_uops_0_bits_fp_ctrl_vec = _rename_stage_io_ren2_uops_0_fp_ctrl_vec;
	assign io_lsu_dis_uops_0_bits_rob_idx = _rob_io_rob_tail_idx;
	assign io_lsu_dis_uops_0_bits_ldq_idx = io_lsu_dis_ldq_idx_0;
	assign io_lsu_dis_uops_0_bits_stq_idx = io_lsu_dis_stq_idx_0;
	assign io_lsu_dis_uops_0_bits_rxq_idx = _rename_stage_io_ren2_uops_0_rxq_idx;
	assign io_lsu_dis_uops_0_bits_pdst = dis_uops_0_pdst;
	assign io_lsu_dis_uops_0_bits_prs1 = dis_uops_0_prs1;
	assign io_lsu_dis_uops_0_bits_prs2 = dis_uops_0_prs2;
	assign io_lsu_dis_uops_0_bits_prs3 = _fp_rename_stage_io_ren2_uops_0_prs3;
	assign io_lsu_dis_uops_0_bits_ppred = _pred_rename_stage_io_ren2_uops_0_ppred;
	assign io_lsu_dis_uops_0_bits_prs1_busy = dis_uops_0_prs1_busy;
	assign io_lsu_dis_uops_0_bits_prs2_busy = dis_uops_0_prs2_busy;
	assign io_lsu_dis_uops_0_bits_prs3_busy = dis_uops_0_prs3_busy;
	assign io_lsu_dis_uops_0_bits_ppred_busy = dis_uops_0_ppred_busy;
	assign io_lsu_dis_uops_0_bits_stale_pdst = dis_uops_0_stale_pdst;
	assign io_lsu_dis_uops_0_bits_exception = _rename_stage_io_ren2_uops_0_exception;
	assign io_lsu_dis_uops_0_bits_exc_cause = _rename_stage_io_ren2_uops_0_exc_cause;
	assign io_lsu_dis_uops_0_bits_mem_cmd = _rename_stage_io_ren2_uops_0_mem_cmd;
	assign io_lsu_dis_uops_0_bits_mem_size = _rename_stage_io_ren2_uops_0_mem_size;
	assign io_lsu_dis_uops_0_bits_mem_signed = _rename_stage_io_ren2_uops_0_mem_signed;
	assign io_lsu_dis_uops_0_bits_uses_ldq = _rename_stage_io_ren2_uops_0_uses_ldq;
	assign io_lsu_dis_uops_0_bits_uses_stq = _rename_stage_io_ren2_uops_0_uses_stq;
	assign io_lsu_dis_uops_0_bits_is_unique = _rename_stage_io_ren2_uops_0_is_unique;
	assign io_lsu_dis_uops_0_bits_flush_on_commit = _rename_stage_io_ren2_uops_0_flush_on_commit;
	assign io_lsu_dis_uops_0_bits_csr_cmd = _rename_stage_io_ren2_uops_0_csr_cmd;
	assign io_lsu_dis_uops_0_bits_ldst_is_rs1 = _rename_stage_io_ren2_uops_0_ldst_is_rs1;
	assign io_lsu_dis_uops_0_bits_ldst = _rename_stage_io_ren2_uops_0_ldst;
	assign io_lsu_dis_uops_0_bits_lrs1 = _rename_stage_io_ren2_uops_0_lrs1;
	assign io_lsu_dis_uops_0_bits_lrs2 = _rename_stage_io_ren2_uops_0_lrs2;
	assign io_lsu_dis_uops_0_bits_lrs3 = _rename_stage_io_ren2_uops_0_lrs3;
	assign io_lsu_dis_uops_0_bits_dst_rtype = _rename_stage_io_ren2_uops_0_dst_rtype;
	assign io_lsu_dis_uops_0_bits_lrs1_rtype = _rename_stage_io_ren2_uops_0_lrs1_rtype;
	assign io_lsu_dis_uops_0_bits_lrs2_rtype = _rename_stage_io_ren2_uops_0_lrs2_rtype;
	assign io_lsu_dis_uops_0_bits_frs3_en = _rename_stage_io_ren2_uops_0_frs3_en;
	assign io_lsu_dis_uops_0_bits_fcn_dw = _rename_stage_io_ren2_uops_0_fcn_dw;
	assign io_lsu_dis_uops_0_bits_fcn_op = _rename_stage_io_ren2_uops_0_fcn_op;
	assign io_lsu_dis_uops_0_bits_fp_val = _rename_stage_io_ren2_uops_0_fp_val;
	assign io_lsu_dis_uops_0_bits_fp_rm = _rename_stage_io_ren2_uops_0_fp_rm;
	assign io_lsu_dis_uops_0_bits_fp_typ = _rename_stage_io_ren2_uops_0_fp_typ;
	assign io_lsu_dis_uops_0_bits_xcpt_pf_if = _rename_stage_io_ren2_uops_0_xcpt_pf_if;
	assign io_lsu_dis_uops_0_bits_xcpt_ae_if = _rename_stage_io_ren2_uops_0_xcpt_ae_if;
	assign io_lsu_dis_uops_0_bits_xcpt_ma_if = _rename_stage_io_ren2_uops_0_xcpt_ma_if;
	assign io_lsu_dis_uops_0_bits_bp_debug_if = _rename_stage_io_ren2_uops_0_bp_debug_if;
	assign io_lsu_dis_uops_0_bits_bp_xcpt_if = _rename_stage_io_ren2_uops_0_bp_xcpt_if;
	assign io_lsu_dis_uops_0_bits_debug_fsrc = _rename_stage_io_ren2_uops_0_debug_fsrc;
	assign io_lsu_dis_uops_0_bits_debug_tsrc = _rename_stage_io_ren2_uops_0_debug_tsrc;
	assign io_lsu_commit_valids_0 = _rob_io_commit_valids_0;
	assign io_lsu_fence_dmem = _rename_stage_io_ren2_mask_0 & wait_for_empty_pipeline_0;
	assign io_lsu_brupdate_b1_resolve_mask = b1_resolve_mask;
	assign io_lsu_brupdate_b1_mispredict_mask = b1_mispredict_mask;
	assign io_lsu_brupdate_b2_uop_ldq_idx = b2_uop_ldq_idx;
	assign io_lsu_brupdate_b2_uop_stq_idx = b2_uop_stq_idx;
	assign io_lsu_brupdate_b2_mispredict = b2_mispredict;
	assign io_lsu_exception = io_lsu_exception_REG;
endmodule
