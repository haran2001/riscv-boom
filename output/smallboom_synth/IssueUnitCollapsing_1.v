module IssueUnitCollapsing_1 (
	clock,
	reset,
	io_dis_uops_0_ready,
	io_dis_uops_0_valid,
	io_dis_uops_0_bits_fu_code_1,
	io_dis_uops_0_bits_fu_code_2,
	io_dis_uops_0_bits_iw_p1_speculative_child,
	io_dis_uops_0_bits_iw_p2_speculative_child,
	io_dis_uops_0_bits_br_mask,
	io_dis_uops_0_bits_is_fence,
	io_dis_uops_0_bits_is_fencei,
	io_dis_uops_0_bits_imm_sel,
	io_dis_uops_0_bits_pimm,
	io_dis_uops_0_bits_ldq_idx,
	io_dis_uops_0_bits_stq_idx,
	io_dis_uops_0_bits_pdst,
	io_dis_uops_0_bits_prs1,
	io_dis_uops_0_bits_prs2,
	io_dis_uops_0_bits_prs1_busy,
	io_dis_uops_0_bits_prs2_busy,
	io_dis_uops_0_bits_ppred_busy,
	io_dis_uops_0_bits_exception,
	io_dis_uops_0_bits_uses_ldq,
	io_dis_uops_0_bits_uses_stq,
	io_dis_uops_0_bits_dst_rtype,
	io_dis_uops_0_bits_lrs1_rtype,
	io_dis_uops_0_bits_lrs2_rtype,
	io_dis_uops_0_bits_fp_val,
	io_iss_uops_0_valid,
	io_iss_uops_0_bits_fu_code_1,
	io_iss_uops_0_bits_fu_code_2,
	io_iss_uops_0_bits_iw_p1_bypass_hint,
	io_iss_uops_0_bits_br_mask,
	io_iss_uops_0_bits_imm_sel,
	io_iss_uops_0_bits_pimm,
	io_iss_uops_0_bits_stq_idx,
	io_iss_uops_0_bits_prs1,
	io_iss_uops_0_bits_lrs1_rtype,
	io_iss_uops_1_valid,
	io_iss_uops_1_bits_fu_code_1,
	io_iss_uops_1_bits_fu_code_2,
	io_iss_uops_1_bits_iw_p1_bypass_hint,
	io_iss_uops_1_bits_br_mask,
	io_iss_uops_1_bits_imm_sel,
	io_iss_uops_1_bits_pimm,
	io_iss_uops_1_bits_ldq_idx,
	io_iss_uops_1_bits_stq_idx,
	io_iss_uops_1_bits_pdst,
	io_iss_uops_1_bits_prs1,
	io_iss_uops_1_bits_uses_ldq,
	io_iss_uops_1_bits_uses_stq,
	io_iss_uops_1_bits_dst_rtype,
	io_iss_uops_1_bits_lrs1_rtype,
	io_iss_uops_1_bits_fp_val,
	io_wakeup_ports_0_valid,
	io_wakeup_ports_0_bits_uop_pdst,
	io_wakeup_ports_0_bits_bypassable,
	io_wakeup_ports_0_bits_rebusy,
	io_wakeup_ports_1_valid,
	io_wakeup_ports_1_bits_uop_pdst,
	io_wakeup_ports_2_valid,
	io_wakeup_ports_2_bits_uop_pdst,
	io_child_rebusys,
	io_fu_types_1_1,
	io_brupdate_b1_resolve_mask,
	io_brupdate_b1_mispredict_mask,
	io_flush_pipeline,
	io_squash_grant
);
	input clock;
	input reset;
	output wire io_dis_uops_0_ready;
	input io_dis_uops_0_valid;
	input io_dis_uops_0_bits_fu_code_1;
	input io_dis_uops_0_bits_fu_code_2;
	input io_dis_uops_0_bits_iw_p1_speculative_child;
	input io_dis_uops_0_bits_iw_p2_speculative_child;
	input [7:0] io_dis_uops_0_bits_br_mask;
	input io_dis_uops_0_bits_is_fence;
	input io_dis_uops_0_bits_is_fencei;
	input [2:0] io_dis_uops_0_bits_imm_sel;
	input [4:0] io_dis_uops_0_bits_pimm;
	input [3:0] io_dis_uops_0_bits_ldq_idx;
	input [3:0] io_dis_uops_0_bits_stq_idx;
	input [5:0] io_dis_uops_0_bits_pdst;
	input [5:0] io_dis_uops_0_bits_prs1;
	input [5:0] io_dis_uops_0_bits_prs2;
	input io_dis_uops_0_bits_prs1_busy;
	input io_dis_uops_0_bits_prs2_busy;
	input io_dis_uops_0_bits_ppred_busy;
	input io_dis_uops_0_bits_exception;
	input io_dis_uops_0_bits_uses_ldq;
	input io_dis_uops_0_bits_uses_stq;
	input [1:0] io_dis_uops_0_bits_dst_rtype;
	input [1:0] io_dis_uops_0_bits_lrs1_rtype;
	input [1:0] io_dis_uops_0_bits_lrs2_rtype;
	input io_dis_uops_0_bits_fp_val;
	output wire io_iss_uops_0_valid;
	output wire io_iss_uops_0_bits_fu_code_1;
	output wire io_iss_uops_0_bits_fu_code_2;
	output wire io_iss_uops_0_bits_iw_p1_bypass_hint;
	output wire [7:0] io_iss_uops_0_bits_br_mask;
	output wire [2:0] io_iss_uops_0_bits_imm_sel;
	output wire [4:0] io_iss_uops_0_bits_pimm;
	output wire [3:0] io_iss_uops_0_bits_stq_idx;
	output wire [5:0] io_iss_uops_0_bits_prs1;
	output wire [1:0] io_iss_uops_0_bits_lrs1_rtype;
	output wire io_iss_uops_1_valid;
	output wire io_iss_uops_1_bits_fu_code_1;
	output wire io_iss_uops_1_bits_fu_code_2;
	output wire io_iss_uops_1_bits_iw_p1_bypass_hint;
	output wire [7:0] io_iss_uops_1_bits_br_mask;
	output wire [2:0] io_iss_uops_1_bits_imm_sel;
	output wire [4:0] io_iss_uops_1_bits_pimm;
	output wire [3:0] io_iss_uops_1_bits_ldq_idx;
	output wire [3:0] io_iss_uops_1_bits_stq_idx;
	output wire [5:0] io_iss_uops_1_bits_pdst;
	output wire [5:0] io_iss_uops_1_bits_prs1;
	output wire io_iss_uops_1_bits_uses_ldq;
	output wire io_iss_uops_1_bits_uses_stq;
	output wire [1:0] io_iss_uops_1_bits_dst_rtype;
	output wire [1:0] io_iss_uops_1_bits_lrs1_rtype;
	output wire io_iss_uops_1_bits_fp_val;
	input io_wakeup_ports_0_valid;
	input [5:0] io_wakeup_ports_0_bits_uop_pdst;
	input io_wakeup_ports_0_bits_bypassable;
	input io_wakeup_ports_0_bits_rebusy;
	input io_wakeup_ports_1_valid;
	input [5:0] io_wakeup_ports_1_bits_uop_pdst;
	input io_wakeup_ports_2_valid;
	input [5:0] io_wakeup_ports_2_bits_uop_pdst;
	input io_child_rebusys;
	input io_fu_types_1_1;
	input [7:0] io_brupdate_b1_resolve_mask;
	input [7:0] io_brupdate_b1_mispredict_mask;
	input io_flush_pipeline;
	input io_squash_grant;
	wire issue_slots_7_grant;
	wire issue_slots_6_grant;
	wire issue_slots_5_grant;
	wire issue_slots_4_grant;
	wire issue_slots_3_grant;
	wire issue_slots_2_grant;
	wire issue_slots_1_grant;
	wire issue_slots_0_grant;
	wire _slots_7_io_valid;
	wire _slots_7_io_will_be_valid;
	wire _slots_7_io_request;
	wire _slots_7_io_iss_uop_fu_code_1;
	wire _slots_7_io_iss_uop_fu_code_2;
	wire _slots_7_io_iss_uop_iw_p1_bypass_hint;
	wire [7:0] _slots_7_io_iss_uop_br_mask;
	wire [2:0] _slots_7_io_iss_uop_imm_sel;
	wire [4:0] _slots_7_io_iss_uop_pimm;
	wire [3:0] _slots_7_io_iss_uop_ldq_idx;
	wire [3:0] _slots_7_io_iss_uop_stq_idx;
	wire [5:0] _slots_7_io_iss_uop_pdst;
	wire [5:0] _slots_7_io_iss_uop_prs1;
	wire _slots_7_io_iss_uop_uses_ldq;
	wire _slots_7_io_iss_uop_uses_stq;
	wire [1:0] _slots_7_io_iss_uop_dst_rtype;
	wire [1:0] _slots_7_io_iss_uop_lrs1_rtype;
	wire _slots_7_io_iss_uop_fp_val;
	wire _slots_7_io_out_uop_fu_code_1;
	wire _slots_7_io_out_uop_fu_code_2;
	wire _slots_7_io_out_uop_iw_issued;
	wire _slots_7_io_out_uop_iw_issued_partial_agen;
	wire _slots_7_io_out_uop_iw_issued_partial_dgen;
	wire _slots_7_io_out_uop_iw_p1_speculative_child;
	wire _slots_7_io_out_uop_iw_p2_speculative_child;
	wire _slots_7_io_out_uop_iw_p1_bypass_hint;
	wire _slots_7_io_out_uop_iw_p2_bypass_hint;
	wire [7:0] _slots_7_io_out_uop_br_mask;
	wire [2:0] _slots_7_io_out_uop_imm_sel;
	wire [4:0] _slots_7_io_out_uop_pimm;
	wire [3:0] _slots_7_io_out_uop_ldq_idx;
	wire [3:0] _slots_7_io_out_uop_stq_idx;
	wire [5:0] _slots_7_io_out_uop_pdst;
	wire [5:0] _slots_7_io_out_uop_prs1;
	wire [5:0] _slots_7_io_out_uop_prs2;
	wire _slots_7_io_out_uop_prs1_busy;
	wire _slots_7_io_out_uop_prs2_busy;
	wire _slots_7_io_out_uop_ppred_busy;
	wire _slots_7_io_out_uop_uses_ldq;
	wire _slots_7_io_out_uop_uses_stq;
	wire [1:0] _slots_7_io_out_uop_dst_rtype;
	wire [1:0] _slots_7_io_out_uop_lrs1_rtype;
	wire [1:0] _slots_7_io_out_uop_lrs2_rtype;
	wire _slots_7_io_out_uop_fp_val;
	wire _slots_6_io_valid;
	wire _slots_6_io_will_be_valid;
	wire _slots_6_io_request;
	wire _slots_6_io_iss_uop_fu_code_1;
	wire _slots_6_io_iss_uop_fu_code_2;
	wire _slots_6_io_iss_uop_iw_p1_bypass_hint;
	wire [7:0] _slots_6_io_iss_uop_br_mask;
	wire [2:0] _slots_6_io_iss_uop_imm_sel;
	wire [4:0] _slots_6_io_iss_uop_pimm;
	wire [3:0] _slots_6_io_iss_uop_ldq_idx;
	wire [3:0] _slots_6_io_iss_uop_stq_idx;
	wire [5:0] _slots_6_io_iss_uop_pdst;
	wire [5:0] _slots_6_io_iss_uop_prs1;
	wire _slots_6_io_iss_uop_uses_ldq;
	wire _slots_6_io_iss_uop_uses_stq;
	wire [1:0] _slots_6_io_iss_uop_dst_rtype;
	wire [1:0] _slots_6_io_iss_uop_lrs1_rtype;
	wire _slots_6_io_iss_uop_fp_val;
	wire _slots_6_io_out_uop_fu_code_1;
	wire _slots_6_io_out_uop_fu_code_2;
	wire _slots_6_io_out_uop_iw_issued;
	wire _slots_6_io_out_uop_iw_issued_partial_agen;
	wire _slots_6_io_out_uop_iw_issued_partial_dgen;
	wire _slots_6_io_out_uop_iw_p1_speculative_child;
	wire _slots_6_io_out_uop_iw_p2_speculative_child;
	wire _slots_6_io_out_uop_iw_p1_bypass_hint;
	wire _slots_6_io_out_uop_iw_p2_bypass_hint;
	wire [7:0] _slots_6_io_out_uop_br_mask;
	wire [2:0] _slots_6_io_out_uop_imm_sel;
	wire [4:0] _slots_6_io_out_uop_pimm;
	wire [3:0] _slots_6_io_out_uop_ldq_idx;
	wire [3:0] _slots_6_io_out_uop_stq_idx;
	wire [5:0] _slots_6_io_out_uop_pdst;
	wire [5:0] _slots_6_io_out_uop_prs1;
	wire [5:0] _slots_6_io_out_uop_prs2;
	wire _slots_6_io_out_uop_prs1_busy;
	wire _slots_6_io_out_uop_prs2_busy;
	wire _slots_6_io_out_uop_ppred_busy;
	wire _slots_6_io_out_uop_uses_ldq;
	wire _slots_6_io_out_uop_uses_stq;
	wire [1:0] _slots_6_io_out_uop_dst_rtype;
	wire [1:0] _slots_6_io_out_uop_lrs1_rtype;
	wire [1:0] _slots_6_io_out_uop_lrs2_rtype;
	wire _slots_6_io_out_uop_fp_val;
	wire _slots_5_io_valid;
	wire _slots_5_io_will_be_valid;
	wire _slots_5_io_request;
	wire _slots_5_io_iss_uop_fu_code_1;
	wire _slots_5_io_iss_uop_fu_code_2;
	wire _slots_5_io_iss_uop_iw_p1_bypass_hint;
	wire [7:0] _slots_5_io_iss_uop_br_mask;
	wire [2:0] _slots_5_io_iss_uop_imm_sel;
	wire [4:0] _slots_5_io_iss_uop_pimm;
	wire [3:0] _slots_5_io_iss_uop_ldq_idx;
	wire [3:0] _slots_5_io_iss_uop_stq_idx;
	wire [5:0] _slots_5_io_iss_uop_pdst;
	wire [5:0] _slots_5_io_iss_uop_prs1;
	wire _slots_5_io_iss_uop_uses_ldq;
	wire _slots_5_io_iss_uop_uses_stq;
	wire [1:0] _slots_5_io_iss_uop_dst_rtype;
	wire [1:0] _slots_5_io_iss_uop_lrs1_rtype;
	wire _slots_5_io_iss_uop_fp_val;
	wire _slots_5_io_out_uop_fu_code_1;
	wire _slots_5_io_out_uop_fu_code_2;
	wire _slots_5_io_out_uop_iw_issued;
	wire _slots_5_io_out_uop_iw_issued_partial_agen;
	wire _slots_5_io_out_uop_iw_issued_partial_dgen;
	wire _slots_5_io_out_uop_iw_p1_speculative_child;
	wire _slots_5_io_out_uop_iw_p2_speculative_child;
	wire _slots_5_io_out_uop_iw_p1_bypass_hint;
	wire _slots_5_io_out_uop_iw_p2_bypass_hint;
	wire [7:0] _slots_5_io_out_uop_br_mask;
	wire [2:0] _slots_5_io_out_uop_imm_sel;
	wire [4:0] _slots_5_io_out_uop_pimm;
	wire [3:0] _slots_5_io_out_uop_ldq_idx;
	wire [3:0] _slots_5_io_out_uop_stq_idx;
	wire [5:0] _slots_5_io_out_uop_pdst;
	wire [5:0] _slots_5_io_out_uop_prs1;
	wire [5:0] _slots_5_io_out_uop_prs2;
	wire _slots_5_io_out_uop_prs1_busy;
	wire _slots_5_io_out_uop_prs2_busy;
	wire _slots_5_io_out_uop_ppred_busy;
	wire _slots_5_io_out_uop_uses_ldq;
	wire _slots_5_io_out_uop_uses_stq;
	wire [1:0] _slots_5_io_out_uop_dst_rtype;
	wire [1:0] _slots_5_io_out_uop_lrs1_rtype;
	wire [1:0] _slots_5_io_out_uop_lrs2_rtype;
	wire _slots_5_io_out_uop_fp_val;
	wire _slots_4_io_valid;
	wire _slots_4_io_will_be_valid;
	wire _slots_4_io_request;
	wire _slots_4_io_iss_uop_fu_code_1;
	wire _slots_4_io_iss_uop_fu_code_2;
	wire _slots_4_io_iss_uop_iw_p1_bypass_hint;
	wire [7:0] _slots_4_io_iss_uop_br_mask;
	wire [2:0] _slots_4_io_iss_uop_imm_sel;
	wire [4:0] _slots_4_io_iss_uop_pimm;
	wire [3:0] _slots_4_io_iss_uop_ldq_idx;
	wire [3:0] _slots_4_io_iss_uop_stq_idx;
	wire [5:0] _slots_4_io_iss_uop_pdst;
	wire [5:0] _slots_4_io_iss_uop_prs1;
	wire _slots_4_io_iss_uop_uses_ldq;
	wire _slots_4_io_iss_uop_uses_stq;
	wire [1:0] _slots_4_io_iss_uop_dst_rtype;
	wire [1:0] _slots_4_io_iss_uop_lrs1_rtype;
	wire _slots_4_io_iss_uop_fp_val;
	wire _slots_4_io_out_uop_fu_code_1;
	wire _slots_4_io_out_uop_fu_code_2;
	wire _slots_4_io_out_uop_iw_issued;
	wire _slots_4_io_out_uop_iw_issued_partial_agen;
	wire _slots_4_io_out_uop_iw_issued_partial_dgen;
	wire _slots_4_io_out_uop_iw_p1_speculative_child;
	wire _slots_4_io_out_uop_iw_p2_speculative_child;
	wire _slots_4_io_out_uop_iw_p1_bypass_hint;
	wire _slots_4_io_out_uop_iw_p2_bypass_hint;
	wire [7:0] _slots_4_io_out_uop_br_mask;
	wire [2:0] _slots_4_io_out_uop_imm_sel;
	wire [4:0] _slots_4_io_out_uop_pimm;
	wire [3:0] _slots_4_io_out_uop_ldq_idx;
	wire [3:0] _slots_4_io_out_uop_stq_idx;
	wire [5:0] _slots_4_io_out_uop_pdst;
	wire [5:0] _slots_4_io_out_uop_prs1;
	wire [5:0] _slots_4_io_out_uop_prs2;
	wire _slots_4_io_out_uop_prs1_busy;
	wire _slots_4_io_out_uop_prs2_busy;
	wire _slots_4_io_out_uop_ppred_busy;
	wire _slots_4_io_out_uop_uses_ldq;
	wire _slots_4_io_out_uop_uses_stq;
	wire [1:0] _slots_4_io_out_uop_dst_rtype;
	wire [1:0] _slots_4_io_out_uop_lrs1_rtype;
	wire [1:0] _slots_4_io_out_uop_lrs2_rtype;
	wire _slots_4_io_out_uop_fp_val;
	wire _slots_3_io_valid;
	wire _slots_3_io_will_be_valid;
	wire _slots_3_io_request;
	wire _slots_3_io_iss_uop_fu_code_1;
	wire _slots_3_io_iss_uop_fu_code_2;
	wire _slots_3_io_iss_uop_iw_p1_bypass_hint;
	wire [7:0] _slots_3_io_iss_uop_br_mask;
	wire [2:0] _slots_3_io_iss_uop_imm_sel;
	wire [4:0] _slots_3_io_iss_uop_pimm;
	wire [3:0] _slots_3_io_iss_uop_ldq_idx;
	wire [3:0] _slots_3_io_iss_uop_stq_idx;
	wire [5:0] _slots_3_io_iss_uop_pdst;
	wire [5:0] _slots_3_io_iss_uop_prs1;
	wire _slots_3_io_iss_uop_uses_ldq;
	wire _slots_3_io_iss_uop_uses_stq;
	wire [1:0] _slots_3_io_iss_uop_dst_rtype;
	wire [1:0] _slots_3_io_iss_uop_lrs1_rtype;
	wire _slots_3_io_iss_uop_fp_val;
	wire _slots_3_io_out_uop_fu_code_1;
	wire _slots_3_io_out_uop_fu_code_2;
	wire _slots_3_io_out_uop_iw_issued;
	wire _slots_3_io_out_uop_iw_issued_partial_agen;
	wire _slots_3_io_out_uop_iw_issued_partial_dgen;
	wire _slots_3_io_out_uop_iw_p1_speculative_child;
	wire _slots_3_io_out_uop_iw_p2_speculative_child;
	wire _slots_3_io_out_uop_iw_p1_bypass_hint;
	wire _slots_3_io_out_uop_iw_p2_bypass_hint;
	wire [7:0] _slots_3_io_out_uop_br_mask;
	wire [2:0] _slots_3_io_out_uop_imm_sel;
	wire [4:0] _slots_3_io_out_uop_pimm;
	wire [3:0] _slots_3_io_out_uop_ldq_idx;
	wire [3:0] _slots_3_io_out_uop_stq_idx;
	wire [5:0] _slots_3_io_out_uop_pdst;
	wire [5:0] _slots_3_io_out_uop_prs1;
	wire [5:0] _slots_3_io_out_uop_prs2;
	wire _slots_3_io_out_uop_prs1_busy;
	wire _slots_3_io_out_uop_prs2_busy;
	wire _slots_3_io_out_uop_ppred_busy;
	wire _slots_3_io_out_uop_uses_ldq;
	wire _slots_3_io_out_uop_uses_stq;
	wire [1:0] _slots_3_io_out_uop_dst_rtype;
	wire [1:0] _slots_3_io_out_uop_lrs1_rtype;
	wire [1:0] _slots_3_io_out_uop_lrs2_rtype;
	wire _slots_3_io_out_uop_fp_val;
	wire _slots_2_io_valid;
	wire _slots_2_io_will_be_valid;
	wire _slots_2_io_request;
	wire _slots_2_io_iss_uop_fu_code_1;
	wire _slots_2_io_iss_uop_fu_code_2;
	wire _slots_2_io_iss_uop_iw_p1_bypass_hint;
	wire [7:0] _slots_2_io_iss_uop_br_mask;
	wire [2:0] _slots_2_io_iss_uop_imm_sel;
	wire [4:0] _slots_2_io_iss_uop_pimm;
	wire [3:0] _slots_2_io_iss_uop_ldq_idx;
	wire [3:0] _slots_2_io_iss_uop_stq_idx;
	wire [5:0] _slots_2_io_iss_uop_pdst;
	wire [5:0] _slots_2_io_iss_uop_prs1;
	wire _slots_2_io_iss_uop_uses_ldq;
	wire _slots_2_io_iss_uop_uses_stq;
	wire [1:0] _slots_2_io_iss_uop_dst_rtype;
	wire [1:0] _slots_2_io_iss_uop_lrs1_rtype;
	wire _slots_2_io_iss_uop_fp_val;
	wire _slots_2_io_out_uop_fu_code_1;
	wire _slots_2_io_out_uop_fu_code_2;
	wire _slots_2_io_out_uop_iw_issued;
	wire _slots_2_io_out_uop_iw_issued_partial_agen;
	wire _slots_2_io_out_uop_iw_issued_partial_dgen;
	wire _slots_2_io_out_uop_iw_p1_speculative_child;
	wire _slots_2_io_out_uop_iw_p2_speculative_child;
	wire _slots_2_io_out_uop_iw_p1_bypass_hint;
	wire _slots_2_io_out_uop_iw_p2_bypass_hint;
	wire [7:0] _slots_2_io_out_uop_br_mask;
	wire [2:0] _slots_2_io_out_uop_imm_sel;
	wire [4:0] _slots_2_io_out_uop_pimm;
	wire [3:0] _slots_2_io_out_uop_ldq_idx;
	wire [3:0] _slots_2_io_out_uop_stq_idx;
	wire [5:0] _slots_2_io_out_uop_pdst;
	wire [5:0] _slots_2_io_out_uop_prs1;
	wire [5:0] _slots_2_io_out_uop_prs2;
	wire _slots_2_io_out_uop_prs1_busy;
	wire _slots_2_io_out_uop_prs2_busy;
	wire _slots_2_io_out_uop_ppred_busy;
	wire _slots_2_io_out_uop_uses_ldq;
	wire _slots_2_io_out_uop_uses_stq;
	wire [1:0] _slots_2_io_out_uop_dst_rtype;
	wire [1:0] _slots_2_io_out_uop_lrs1_rtype;
	wire [1:0] _slots_2_io_out_uop_lrs2_rtype;
	wire _slots_2_io_out_uop_fp_val;
	wire _slots_1_io_valid;
	wire _slots_1_io_will_be_valid;
	wire _slots_1_io_request;
	wire _slots_1_io_iss_uop_fu_code_1;
	wire _slots_1_io_iss_uop_fu_code_2;
	wire _slots_1_io_iss_uop_iw_p1_bypass_hint;
	wire [7:0] _slots_1_io_iss_uop_br_mask;
	wire [2:0] _slots_1_io_iss_uop_imm_sel;
	wire [4:0] _slots_1_io_iss_uop_pimm;
	wire [3:0] _slots_1_io_iss_uop_ldq_idx;
	wire [3:0] _slots_1_io_iss_uop_stq_idx;
	wire [5:0] _slots_1_io_iss_uop_pdst;
	wire [5:0] _slots_1_io_iss_uop_prs1;
	wire _slots_1_io_iss_uop_uses_ldq;
	wire _slots_1_io_iss_uop_uses_stq;
	wire [1:0] _slots_1_io_iss_uop_dst_rtype;
	wire [1:0] _slots_1_io_iss_uop_lrs1_rtype;
	wire _slots_1_io_iss_uop_fp_val;
	wire _slots_1_io_out_uop_fu_code_1;
	wire _slots_1_io_out_uop_fu_code_2;
	wire _slots_1_io_out_uop_iw_issued;
	wire _slots_1_io_out_uop_iw_issued_partial_agen;
	wire _slots_1_io_out_uop_iw_issued_partial_dgen;
	wire _slots_1_io_out_uop_iw_p1_speculative_child;
	wire _slots_1_io_out_uop_iw_p2_speculative_child;
	wire _slots_1_io_out_uop_iw_p1_bypass_hint;
	wire _slots_1_io_out_uop_iw_p2_bypass_hint;
	wire [7:0] _slots_1_io_out_uop_br_mask;
	wire [2:0] _slots_1_io_out_uop_imm_sel;
	wire [4:0] _slots_1_io_out_uop_pimm;
	wire [3:0] _slots_1_io_out_uop_ldq_idx;
	wire [3:0] _slots_1_io_out_uop_stq_idx;
	wire [5:0] _slots_1_io_out_uop_pdst;
	wire [5:0] _slots_1_io_out_uop_prs1;
	wire [5:0] _slots_1_io_out_uop_prs2;
	wire _slots_1_io_out_uop_prs1_busy;
	wire _slots_1_io_out_uop_prs2_busy;
	wire _slots_1_io_out_uop_ppred_busy;
	wire _slots_1_io_out_uop_uses_ldq;
	wire _slots_1_io_out_uop_uses_stq;
	wire [1:0] _slots_1_io_out_uop_dst_rtype;
	wire [1:0] _slots_1_io_out_uop_lrs1_rtype;
	wire [1:0] _slots_1_io_out_uop_lrs2_rtype;
	wire _slots_1_io_out_uop_fp_val;
	wire _slots_0_io_valid;
	wire _slots_0_io_will_be_valid;
	wire _slots_0_io_request;
	wire _slots_0_io_iss_uop_fu_code_1;
	wire _slots_0_io_iss_uop_fu_code_2;
	wire _slots_0_io_iss_uop_iw_p1_bypass_hint;
	wire [7:0] _slots_0_io_iss_uop_br_mask;
	wire [2:0] _slots_0_io_iss_uop_imm_sel;
	wire [4:0] _slots_0_io_iss_uop_pimm;
	wire [3:0] _slots_0_io_iss_uop_ldq_idx;
	wire [3:0] _slots_0_io_iss_uop_stq_idx;
	wire [5:0] _slots_0_io_iss_uop_pdst;
	wire [5:0] _slots_0_io_iss_uop_prs1;
	wire _slots_0_io_iss_uop_uses_ldq;
	wire _slots_0_io_iss_uop_uses_stq;
	wire [1:0] _slots_0_io_iss_uop_dst_rtype;
	wire [1:0] _slots_0_io_iss_uop_lrs1_rtype;
	wire _slots_0_io_iss_uop_fp_val;
	wire prs1_matches_0 = io_wakeup_ports_0_bits_uop_pdst == io_dis_uops_0_bits_prs1;
	wire prs2_matches_0 = io_wakeup_ports_0_bits_uop_pdst == io_dis_uops_0_bits_prs2;
	wire prs1_wakeups_0 = io_wakeup_ports_0_valid & prs1_matches_0;
	wire prs1_wakeups_2 = io_wakeup_ports_2_valid & (io_wakeup_ports_2_bits_uop_pdst == io_dis_uops_0_bits_prs1);
	wire prs2_wakeups_0 = io_wakeup_ports_0_valid & prs2_matches_0;
	wire prs2_wakeups_2 = io_wakeup_ports_2_valid & (io_wakeup_ports_2_bits_uop_pdst == io_dis_uops_0_bits_prs2);
	wire _GEN = (prs1_wakeups_0 | (io_wakeup_ports_1_valid & (io_wakeup_ports_1_bits_uop_pdst == io_dis_uops_0_bits_prs1))) | prs1_wakeups_2;
	wire _GEN_0 = (prs2_wakeups_0 | (io_wakeup_ports_1_valid & (io_wakeup_ports_1_bits_uop_pdst == io_dis_uops_0_bits_prs2))) | prs2_wakeups_2;
	wire _GEN_1 = io_dis_uops_0_bits_uses_stq & (io_dis_uops_0_bits_lrs2_rtype == 2'h1);
	wire shamts_oh_2 = ~_slots_0_io_valid | ~_slots_1_io_valid;
	wire shamts_oh_3 = shamts_oh_2 | ~_slots_2_io_valid;
	wire shamts_oh_4 = (shamts_oh_2 | ~_slots_2_io_valid) | ~_slots_3_io_valid;
	wire shamts_oh_5 = ((shamts_oh_2 | ~_slots_2_io_valid) | ~_slots_3_io_valid) | ~_slots_4_io_valid;
	wire shamts_oh_6 = (((shamts_oh_2 | ~_slots_2_io_valid) | ~_slots_3_io_valid) | ~_slots_4_io_valid) | ~_slots_5_io_valid;
	wire shamts_oh_7 = ((((shamts_oh_2 | ~_slots_2_io_valid) | ~_slots_3_io_valid) | ~_slots_4_io_valid) | ~_slots_5_io_valid) | ~_slots_6_io_valid;
	wire shamts_oh_8 = (((((shamts_oh_2 | ~_slots_2_io_valid) | ~_slots_3_io_valid) | ~_slots_4_io_valid) | ~_slots_5_io_valid) | ~_slots_6_io_valid) | ~_slots_7_io_valid;
	wire issue_slots_0_in_uop_valid = ~_slots_0_io_valid & _slots_1_io_will_be_valid;
	wire issue_slots_1_in_uop_valid = shamts_oh_2 & _slots_2_io_will_be_valid;
	wire issue_slots_2_in_uop_valid = shamts_oh_3 & _slots_3_io_will_be_valid;
	wire issue_slots_3_in_uop_valid = shamts_oh_4 & _slots_4_io_will_be_valid;
	wire issue_slots_4_in_uop_valid = shamts_oh_5 & _slots_5_io_will_be_valid;
	wire issue_slots_5_in_uop_valid = shamts_oh_6 & _slots_6_io_will_be_valid;
	wire issue_slots_6_in_uop_valid = shamts_oh_7 & _slots_7_io_will_be_valid;
	wire issue_slots_7_in_uop_valid = (((shamts_oh_8 & io_dis_uops_0_valid) & ~io_dis_uops_0_bits_exception) & ~io_dis_uops_0_bits_is_fence) & ~io_dis_uops_0_bits_is_fencei;
	reg is_available_0;
	reg is_available_1;
	reg is_available_2;
	reg is_available_3;
	reg is_available_4;
	reg is_available_5;
	reg is_available_6;
	reg is_available_7;
	reg io_dis_uops_0_ready_REG;
	wire _GEN_2 = _slots_0_io_request & _slots_0_io_iss_uop_fu_code_2;
	wire _GEN_3 = (_slots_0_io_request & ~_GEN_2) & ((_slots_0_io_iss_uop_fu_code_1 & io_fu_types_1_1) | _slots_0_io_iss_uop_fu_code_2);
	assign issue_slots_0_grant = _GEN_3 | _GEN_2;
	wire _GEN_4 = _slots_1_io_request & _slots_1_io_iss_uop_fu_code_2;
	wire _GEN_5 = _GEN_4 & ~_GEN_2;
	wire _GEN_6 = _GEN_4 | _GEN_2;
	wire _GEN_7 = (_slots_1_io_request & ~_GEN_5) & ((_slots_1_io_iss_uop_fu_code_1 & io_fu_types_1_1) | _slots_1_io_iss_uop_fu_code_2);
	wire _GEN_8 = _GEN_7 & ~_GEN_3;
	assign issue_slots_1_grant = _GEN_8 | _GEN_5;
	wire _GEN_9 = _GEN_7 | _GEN_3;
	wire _GEN_10 = _slots_2_io_request & _slots_2_io_iss_uop_fu_code_2;
	wire _GEN_11 = _GEN_10 & ~_GEN_6;
	wire _GEN_12 = _GEN_10 | _GEN_6;
	wire _GEN_13 = (_slots_2_io_request & ~_GEN_11) & ((_slots_2_io_iss_uop_fu_code_1 & io_fu_types_1_1) | _slots_2_io_iss_uop_fu_code_2);
	wire _GEN_14 = _GEN_13 & ~_GEN_9;
	assign issue_slots_2_grant = _GEN_14 | _GEN_11;
	wire _GEN_15 = _GEN_13 | _GEN_9;
	wire _GEN_16 = _slots_3_io_request & _slots_3_io_iss_uop_fu_code_2;
	wire _GEN_17 = _GEN_16 & ~_GEN_12;
	wire _GEN_18 = _GEN_16 | _GEN_12;
	wire _GEN_19 = (_slots_3_io_request & ~_GEN_17) & ((_slots_3_io_iss_uop_fu_code_1 & io_fu_types_1_1) | _slots_3_io_iss_uop_fu_code_2);
	wire _GEN_20 = _GEN_19 & ~_GEN_15;
	assign issue_slots_3_grant = _GEN_20 | _GEN_17;
	wire _GEN_21 = _GEN_19 | _GEN_15;
	wire _GEN_22 = _slots_4_io_request & _slots_4_io_iss_uop_fu_code_2;
	wire _GEN_23 = _GEN_22 & ~_GEN_18;
	wire _GEN_24 = _GEN_22 | _GEN_18;
	wire _GEN_25 = (_slots_4_io_request & ~_GEN_23) & ((_slots_4_io_iss_uop_fu_code_1 & io_fu_types_1_1) | _slots_4_io_iss_uop_fu_code_2);
	wire _GEN_26 = _GEN_25 & ~_GEN_21;
	assign issue_slots_4_grant = _GEN_26 | _GEN_23;
	wire _GEN_27 = _GEN_25 | _GEN_21;
	wire _GEN_28 = _slots_5_io_request & _slots_5_io_iss_uop_fu_code_2;
	wire _GEN_29 = _GEN_28 & ~_GEN_24;
	wire _GEN_30 = _GEN_28 | _GEN_24;
	wire _GEN_31 = (_slots_5_io_request & ~_GEN_29) & ((_slots_5_io_iss_uop_fu_code_1 & io_fu_types_1_1) | _slots_5_io_iss_uop_fu_code_2);
	wire _GEN_32 = _GEN_31 & ~_GEN_27;
	assign issue_slots_5_grant = _GEN_32 | _GEN_29;
	wire _GEN_33 = _GEN_31 | _GEN_27;
	wire _GEN_34 = _slots_6_io_request & _slots_6_io_iss_uop_fu_code_2;
	wire _GEN_35 = _GEN_34 & ~_GEN_30;
	wire _GEN_36 = (_slots_6_io_request & ~_GEN_35) & ((_slots_6_io_iss_uop_fu_code_1 & io_fu_types_1_1) | _slots_6_io_iss_uop_fu_code_2);
	wire _GEN_37 = _GEN_36 & ~_GEN_33;
	assign issue_slots_6_grant = _GEN_37 | _GEN_35;
	wire _GEN_38 = (_slots_7_io_request & _slots_7_io_iss_uop_fu_code_2) & ~(_GEN_34 | _GEN_30);
	wire _GEN_39 = ((_slots_7_io_request & ~_GEN_38) & ((_slots_7_io_iss_uop_fu_code_1 & io_fu_types_1_1) | _slots_7_io_iss_uop_fu_code_2)) & ~(_GEN_36 | _GEN_33);
	assign issue_slots_7_grant = _GEN_39 | _GEN_38;
	always @(posedge clock) begin
		is_available_0 <= ~_slots_0_io_will_be_valid & ~issue_slots_0_in_uop_valid;
		is_available_1 <= (~_slots_1_io_will_be_valid | ~_slots_0_io_valid) & ~issue_slots_1_in_uop_valid;
		is_available_2 <= (~_slots_2_io_will_be_valid | shamts_oh_2) & ~issue_slots_2_in_uop_valid;
		is_available_3 <= (~_slots_3_io_will_be_valid | shamts_oh_3) & ~issue_slots_3_in_uop_valid;
		is_available_4 <= (~_slots_4_io_will_be_valid | shamts_oh_4) & ~issue_slots_4_in_uop_valid;
		is_available_5 <= (~_slots_5_io_will_be_valid | shamts_oh_5) & ~issue_slots_5_in_uop_valid;
		is_available_6 <= (~_slots_6_io_will_be_valid | shamts_oh_6) & ~issue_slots_6_in_uop_valid;
		is_available_7 <= (~_slots_7_io_will_be_valid | shamts_oh_7) & ~issue_slots_7_in_uop_valid;
		io_dis_uops_0_ready_REG <= ({1'h0, {1'h0, {1'h0, is_available_0} + {1'h0, is_available_1}} + {1'h0, {1'h0, is_available_2} + {1'h0, is_available_3}}} + {1'h0, {1'h0, {1'h0, is_available_4} + {1'h0, is_available_5}} + {1'h0, {1'h0, is_available_6} + {1'h0, is_available_7}}}) > {3'h0, io_dis_uops_0_ready_REG & io_dis_uops_0_valid};
	end
	IssueSlot_8 slots_0(
		.clock(clock),
		.reset(reset),
		.io_valid(_slots_0_io_valid),
		.io_will_be_valid(_slots_0_io_will_be_valid),
		.io_request(_slots_0_io_request),
		.io_grant(issue_slots_0_grant),
		.io_iss_uop_fu_code_1(_slots_0_io_iss_uop_fu_code_1),
		.io_iss_uop_fu_code_2(_slots_0_io_iss_uop_fu_code_2),
		.io_iss_uop_iw_p1_bypass_hint(_slots_0_io_iss_uop_iw_p1_bypass_hint),
		.io_iss_uop_br_mask(_slots_0_io_iss_uop_br_mask),
		.io_iss_uop_imm_sel(_slots_0_io_iss_uop_imm_sel),
		.io_iss_uop_pimm(_slots_0_io_iss_uop_pimm),
		.io_iss_uop_ldq_idx(_slots_0_io_iss_uop_ldq_idx),
		.io_iss_uop_stq_idx(_slots_0_io_iss_uop_stq_idx),
		.io_iss_uop_pdst(_slots_0_io_iss_uop_pdst),
		.io_iss_uop_prs1(_slots_0_io_iss_uop_prs1),
		.io_iss_uop_uses_ldq(_slots_0_io_iss_uop_uses_ldq),
		.io_iss_uop_uses_stq(_slots_0_io_iss_uop_uses_stq),
		.io_iss_uop_dst_rtype(_slots_0_io_iss_uop_dst_rtype),
		.io_iss_uop_lrs1_rtype(_slots_0_io_iss_uop_lrs1_rtype),
		.io_iss_uop_fp_val(_slots_0_io_iss_uop_fp_val),
		.io_in_uop_valid(issue_slots_0_in_uop_valid),
		.io_in_uop_bits_fu_code_1(_slots_1_io_out_uop_fu_code_1),
		.io_in_uop_bits_fu_code_2(_slots_1_io_out_uop_fu_code_2),
		.io_in_uop_bits_iw_issued(_slots_1_io_out_uop_iw_issued),
		.io_in_uop_bits_iw_issued_partial_agen(_slots_1_io_out_uop_iw_issued_partial_agen),
		.io_in_uop_bits_iw_issued_partial_dgen(_slots_1_io_out_uop_iw_issued_partial_dgen),
		.io_in_uop_bits_iw_p1_speculative_child(_slots_1_io_out_uop_iw_p1_speculative_child),
		.io_in_uop_bits_iw_p2_speculative_child(_slots_1_io_out_uop_iw_p2_speculative_child),
		.io_in_uop_bits_iw_p1_bypass_hint(_slots_1_io_out_uop_iw_p1_bypass_hint),
		.io_in_uop_bits_iw_p2_bypass_hint(_slots_1_io_out_uop_iw_p2_bypass_hint),
		.io_in_uop_bits_br_mask(_slots_1_io_out_uop_br_mask),
		.io_in_uop_bits_imm_sel(_slots_1_io_out_uop_imm_sel),
		.io_in_uop_bits_pimm(_slots_1_io_out_uop_pimm),
		.io_in_uop_bits_ldq_idx(_slots_1_io_out_uop_ldq_idx),
		.io_in_uop_bits_stq_idx(_slots_1_io_out_uop_stq_idx),
		.io_in_uop_bits_pdst(_slots_1_io_out_uop_pdst),
		.io_in_uop_bits_prs1(_slots_1_io_out_uop_prs1),
		.io_in_uop_bits_prs2(_slots_1_io_out_uop_prs2),
		.io_in_uop_bits_prs1_busy(_slots_1_io_out_uop_prs1_busy),
		.io_in_uop_bits_prs2_busy(_slots_1_io_out_uop_prs2_busy),
		.io_in_uop_bits_ppred_busy(_slots_1_io_out_uop_ppred_busy),
		.io_in_uop_bits_uses_ldq(_slots_1_io_out_uop_uses_ldq),
		.io_in_uop_bits_uses_stq(_slots_1_io_out_uop_uses_stq),
		.io_in_uop_bits_dst_rtype(_slots_1_io_out_uop_dst_rtype),
		.io_in_uop_bits_lrs1_rtype(_slots_1_io_out_uop_lrs1_rtype),
		.io_in_uop_bits_lrs2_rtype(_slots_1_io_out_uop_lrs2_rtype),
		.io_in_uop_bits_fp_val(_slots_1_io_out_uop_fp_val),
		.io_out_uop_fu_code_1(),
		.io_out_uop_fu_code_2(),
		.io_out_uop_iw_issued(),
		.io_out_uop_iw_issued_partial_agen(),
		.io_out_uop_iw_issued_partial_dgen(),
		.io_out_uop_iw_p1_speculative_child(),
		.io_out_uop_iw_p2_speculative_child(),
		.io_out_uop_iw_p1_bypass_hint(),
		.io_out_uop_iw_p2_bypass_hint(),
		.io_out_uop_br_mask(),
		.io_out_uop_imm_sel(),
		.io_out_uop_pimm(),
		.io_out_uop_ldq_idx(),
		.io_out_uop_stq_idx(),
		.io_out_uop_pdst(),
		.io_out_uop_prs1(),
		.io_out_uop_prs2(),
		.io_out_uop_prs1_busy(),
		.io_out_uop_prs2_busy(),
		.io_out_uop_ppred_busy(),
		.io_out_uop_uses_ldq(),
		.io_out_uop_uses_stq(),
		.io_out_uop_dst_rtype(),
		.io_out_uop_lrs1_rtype(),
		.io_out_uop_lrs2_rtype(),
		.io_out_uop_fp_val(),
		.io_brupdate_b1_resolve_mask(io_brupdate_b1_resolve_mask),
		.io_brupdate_b1_mispredict_mask(io_brupdate_b1_mispredict_mask),
		.io_kill(io_flush_pipeline),
		.io_clear(1'h0),
		.io_squash_grant(io_squash_grant),
		.io_wakeup_ports_0_valid(io_wakeup_ports_0_valid),
		.io_wakeup_ports_0_bits_uop_pdst(io_wakeup_ports_0_bits_uop_pdst),
		.io_wakeup_ports_0_bits_bypassable(io_wakeup_ports_0_bits_bypassable),
		.io_wakeup_ports_0_bits_rebusy(io_wakeup_ports_0_bits_rebusy),
		.io_wakeup_ports_1_valid(io_wakeup_ports_1_valid),
		.io_wakeup_ports_1_bits_uop_pdst(io_wakeup_ports_1_bits_uop_pdst),
		.io_wakeup_ports_2_valid(io_wakeup_ports_2_valid),
		.io_wakeup_ports_2_bits_uop_pdst(io_wakeup_ports_2_bits_uop_pdst),
		.io_child_rebusys(io_child_rebusys)
	);
	IssueSlot_8 slots_1(
		.clock(clock),
		.reset(reset),
		.io_valid(_slots_1_io_valid),
		.io_will_be_valid(_slots_1_io_will_be_valid),
		.io_request(_slots_1_io_request),
		.io_grant(issue_slots_1_grant),
		.io_iss_uop_fu_code_1(_slots_1_io_iss_uop_fu_code_1),
		.io_iss_uop_fu_code_2(_slots_1_io_iss_uop_fu_code_2),
		.io_iss_uop_iw_p1_bypass_hint(_slots_1_io_iss_uop_iw_p1_bypass_hint),
		.io_iss_uop_br_mask(_slots_1_io_iss_uop_br_mask),
		.io_iss_uop_imm_sel(_slots_1_io_iss_uop_imm_sel),
		.io_iss_uop_pimm(_slots_1_io_iss_uop_pimm),
		.io_iss_uop_ldq_idx(_slots_1_io_iss_uop_ldq_idx),
		.io_iss_uop_stq_idx(_slots_1_io_iss_uop_stq_idx),
		.io_iss_uop_pdst(_slots_1_io_iss_uop_pdst),
		.io_iss_uop_prs1(_slots_1_io_iss_uop_prs1),
		.io_iss_uop_uses_ldq(_slots_1_io_iss_uop_uses_ldq),
		.io_iss_uop_uses_stq(_slots_1_io_iss_uop_uses_stq),
		.io_iss_uop_dst_rtype(_slots_1_io_iss_uop_dst_rtype),
		.io_iss_uop_lrs1_rtype(_slots_1_io_iss_uop_lrs1_rtype),
		.io_iss_uop_fp_val(_slots_1_io_iss_uop_fp_val),
		.io_in_uop_valid(issue_slots_1_in_uop_valid),
		.io_in_uop_bits_fu_code_1(_slots_2_io_out_uop_fu_code_1),
		.io_in_uop_bits_fu_code_2(_slots_2_io_out_uop_fu_code_2),
		.io_in_uop_bits_iw_issued(_slots_2_io_out_uop_iw_issued),
		.io_in_uop_bits_iw_issued_partial_agen(_slots_2_io_out_uop_iw_issued_partial_agen),
		.io_in_uop_bits_iw_issued_partial_dgen(_slots_2_io_out_uop_iw_issued_partial_dgen),
		.io_in_uop_bits_iw_p1_speculative_child(_slots_2_io_out_uop_iw_p1_speculative_child),
		.io_in_uop_bits_iw_p2_speculative_child(_slots_2_io_out_uop_iw_p2_speculative_child),
		.io_in_uop_bits_iw_p1_bypass_hint(_slots_2_io_out_uop_iw_p1_bypass_hint),
		.io_in_uop_bits_iw_p2_bypass_hint(_slots_2_io_out_uop_iw_p2_bypass_hint),
		.io_in_uop_bits_br_mask(_slots_2_io_out_uop_br_mask),
		.io_in_uop_bits_imm_sel(_slots_2_io_out_uop_imm_sel),
		.io_in_uop_bits_pimm(_slots_2_io_out_uop_pimm),
		.io_in_uop_bits_ldq_idx(_slots_2_io_out_uop_ldq_idx),
		.io_in_uop_bits_stq_idx(_slots_2_io_out_uop_stq_idx),
		.io_in_uop_bits_pdst(_slots_2_io_out_uop_pdst),
		.io_in_uop_bits_prs1(_slots_2_io_out_uop_prs1),
		.io_in_uop_bits_prs2(_slots_2_io_out_uop_prs2),
		.io_in_uop_bits_prs1_busy(_slots_2_io_out_uop_prs1_busy),
		.io_in_uop_bits_prs2_busy(_slots_2_io_out_uop_prs2_busy),
		.io_in_uop_bits_ppred_busy(_slots_2_io_out_uop_ppred_busy),
		.io_in_uop_bits_uses_ldq(_slots_2_io_out_uop_uses_ldq),
		.io_in_uop_bits_uses_stq(_slots_2_io_out_uop_uses_stq),
		.io_in_uop_bits_dst_rtype(_slots_2_io_out_uop_dst_rtype),
		.io_in_uop_bits_lrs1_rtype(_slots_2_io_out_uop_lrs1_rtype),
		.io_in_uop_bits_lrs2_rtype(_slots_2_io_out_uop_lrs2_rtype),
		.io_in_uop_bits_fp_val(_slots_2_io_out_uop_fp_val),
		.io_out_uop_fu_code_1(_slots_1_io_out_uop_fu_code_1),
		.io_out_uop_fu_code_2(_slots_1_io_out_uop_fu_code_2),
		.io_out_uop_iw_issued(_slots_1_io_out_uop_iw_issued),
		.io_out_uop_iw_issued_partial_agen(_slots_1_io_out_uop_iw_issued_partial_agen),
		.io_out_uop_iw_issued_partial_dgen(_slots_1_io_out_uop_iw_issued_partial_dgen),
		.io_out_uop_iw_p1_speculative_child(_slots_1_io_out_uop_iw_p1_speculative_child),
		.io_out_uop_iw_p2_speculative_child(_slots_1_io_out_uop_iw_p2_speculative_child),
		.io_out_uop_iw_p1_bypass_hint(_slots_1_io_out_uop_iw_p1_bypass_hint),
		.io_out_uop_iw_p2_bypass_hint(_slots_1_io_out_uop_iw_p2_bypass_hint),
		.io_out_uop_br_mask(_slots_1_io_out_uop_br_mask),
		.io_out_uop_imm_sel(_slots_1_io_out_uop_imm_sel),
		.io_out_uop_pimm(_slots_1_io_out_uop_pimm),
		.io_out_uop_ldq_idx(_slots_1_io_out_uop_ldq_idx),
		.io_out_uop_stq_idx(_slots_1_io_out_uop_stq_idx),
		.io_out_uop_pdst(_slots_1_io_out_uop_pdst),
		.io_out_uop_prs1(_slots_1_io_out_uop_prs1),
		.io_out_uop_prs2(_slots_1_io_out_uop_prs2),
		.io_out_uop_prs1_busy(_slots_1_io_out_uop_prs1_busy),
		.io_out_uop_prs2_busy(_slots_1_io_out_uop_prs2_busy),
		.io_out_uop_ppred_busy(_slots_1_io_out_uop_ppred_busy),
		.io_out_uop_uses_ldq(_slots_1_io_out_uop_uses_ldq),
		.io_out_uop_uses_stq(_slots_1_io_out_uop_uses_stq),
		.io_out_uop_dst_rtype(_slots_1_io_out_uop_dst_rtype),
		.io_out_uop_lrs1_rtype(_slots_1_io_out_uop_lrs1_rtype),
		.io_out_uop_lrs2_rtype(_slots_1_io_out_uop_lrs2_rtype),
		.io_out_uop_fp_val(_slots_1_io_out_uop_fp_val),
		.io_brupdate_b1_resolve_mask(io_brupdate_b1_resolve_mask),
		.io_brupdate_b1_mispredict_mask(io_brupdate_b1_mispredict_mask),
		.io_kill(io_flush_pipeline),
		.io_clear(~_slots_0_io_valid),
		.io_squash_grant(io_squash_grant),
		.io_wakeup_ports_0_valid(io_wakeup_ports_0_valid),
		.io_wakeup_ports_0_bits_uop_pdst(io_wakeup_ports_0_bits_uop_pdst),
		.io_wakeup_ports_0_bits_bypassable(io_wakeup_ports_0_bits_bypassable),
		.io_wakeup_ports_0_bits_rebusy(io_wakeup_ports_0_bits_rebusy),
		.io_wakeup_ports_1_valid(io_wakeup_ports_1_valid),
		.io_wakeup_ports_1_bits_uop_pdst(io_wakeup_ports_1_bits_uop_pdst),
		.io_wakeup_ports_2_valid(io_wakeup_ports_2_valid),
		.io_wakeup_ports_2_bits_uop_pdst(io_wakeup_ports_2_bits_uop_pdst),
		.io_child_rebusys(io_child_rebusys)
	);
	IssueSlot_8 slots_2(
		.clock(clock),
		.reset(reset),
		.io_valid(_slots_2_io_valid),
		.io_will_be_valid(_slots_2_io_will_be_valid),
		.io_request(_slots_2_io_request),
		.io_grant(issue_slots_2_grant),
		.io_iss_uop_fu_code_1(_slots_2_io_iss_uop_fu_code_1),
		.io_iss_uop_fu_code_2(_slots_2_io_iss_uop_fu_code_2),
		.io_iss_uop_iw_p1_bypass_hint(_slots_2_io_iss_uop_iw_p1_bypass_hint),
		.io_iss_uop_br_mask(_slots_2_io_iss_uop_br_mask),
		.io_iss_uop_imm_sel(_slots_2_io_iss_uop_imm_sel),
		.io_iss_uop_pimm(_slots_2_io_iss_uop_pimm),
		.io_iss_uop_ldq_idx(_slots_2_io_iss_uop_ldq_idx),
		.io_iss_uop_stq_idx(_slots_2_io_iss_uop_stq_idx),
		.io_iss_uop_pdst(_slots_2_io_iss_uop_pdst),
		.io_iss_uop_prs1(_slots_2_io_iss_uop_prs1),
		.io_iss_uop_uses_ldq(_slots_2_io_iss_uop_uses_ldq),
		.io_iss_uop_uses_stq(_slots_2_io_iss_uop_uses_stq),
		.io_iss_uop_dst_rtype(_slots_2_io_iss_uop_dst_rtype),
		.io_iss_uop_lrs1_rtype(_slots_2_io_iss_uop_lrs1_rtype),
		.io_iss_uop_fp_val(_slots_2_io_iss_uop_fp_val),
		.io_in_uop_valid(issue_slots_2_in_uop_valid),
		.io_in_uop_bits_fu_code_1(_slots_3_io_out_uop_fu_code_1),
		.io_in_uop_bits_fu_code_2(_slots_3_io_out_uop_fu_code_2),
		.io_in_uop_bits_iw_issued(_slots_3_io_out_uop_iw_issued),
		.io_in_uop_bits_iw_issued_partial_agen(_slots_3_io_out_uop_iw_issued_partial_agen),
		.io_in_uop_bits_iw_issued_partial_dgen(_slots_3_io_out_uop_iw_issued_partial_dgen),
		.io_in_uop_bits_iw_p1_speculative_child(_slots_3_io_out_uop_iw_p1_speculative_child),
		.io_in_uop_bits_iw_p2_speculative_child(_slots_3_io_out_uop_iw_p2_speculative_child),
		.io_in_uop_bits_iw_p1_bypass_hint(_slots_3_io_out_uop_iw_p1_bypass_hint),
		.io_in_uop_bits_iw_p2_bypass_hint(_slots_3_io_out_uop_iw_p2_bypass_hint),
		.io_in_uop_bits_br_mask(_slots_3_io_out_uop_br_mask),
		.io_in_uop_bits_imm_sel(_slots_3_io_out_uop_imm_sel),
		.io_in_uop_bits_pimm(_slots_3_io_out_uop_pimm),
		.io_in_uop_bits_ldq_idx(_slots_3_io_out_uop_ldq_idx),
		.io_in_uop_bits_stq_idx(_slots_3_io_out_uop_stq_idx),
		.io_in_uop_bits_pdst(_slots_3_io_out_uop_pdst),
		.io_in_uop_bits_prs1(_slots_3_io_out_uop_prs1),
		.io_in_uop_bits_prs2(_slots_3_io_out_uop_prs2),
		.io_in_uop_bits_prs1_busy(_slots_3_io_out_uop_prs1_busy),
		.io_in_uop_bits_prs2_busy(_slots_3_io_out_uop_prs2_busy),
		.io_in_uop_bits_ppred_busy(_slots_3_io_out_uop_ppred_busy),
		.io_in_uop_bits_uses_ldq(_slots_3_io_out_uop_uses_ldq),
		.io_in_uop_bits_uses_stq(_slots_3_io_out_uop_uses_stq),
		.io_in_uop_bits_dst_rtype(_slots_3_io_out_uop_dst_rtype),
		.io_in_uop_bits_lrs1_rtype(_slots_3_io_out_uop_lrs1_rtype),
		.io_in_uop_bits_lrs2_rtype(_slots_3_io_out_uop_lrs2_rtype),
		.io_in_uop_bits_fp_val(_slots_3_io_out_uop_fp_val),
		.io_out_uop_fu_code_1(_slots_2_io_out_uop_fu_code_1),
		.io_out_uop_fu_code_2(_slots_2_io_out_uop_fu_code_2),
		.io_out_uop_iw_issued(_slots_2_io_out_uop_iw_issued),
		.io_out_uop_iw_issued_partial_agen(_slots_2_io_out_uop_iw_issued_partial_agen),
		.io_out_uop_iw_issued_partial_dgen(_slots_2_io_out_uop_iw_issued_partial_dgen),
		.io_out_uop_iw_p1_speculative_child(_slots_2_io_out_uop_iw_p1_speculative_child),
		.io_out_uop_iw_p2_speculative_child(_slots_2_io_out_uop_iw_p2_speculative_child),
		.io_out_uop_iw_p1_bypass_hint(_slots_2_io_out_uop_iw_p1_bypass_hint),
		.io_out_uop_iw_p2_bypass_hint(_slots_2_io_out_uop_iw_p2_bypass_hint),
		.io_out_uop_br_mask(_slots_2_io_out_uop_br_mask),
		.io_out_uop_imm_sel(_slots_2_io_out_uop_imm_sel),
		.io_out_uop_pimm(_slots_2_io_out_uop_pimm),
		.io_out_uop_ldq_idx(_slots_2_io_out_uop_ldq_idx),
		.io_out_uop_stq_idx(_slots_2_io_out_uop_stq_idx),
		.io_out_uop_pdst(_slots_2_io_out_uop_pdst),
		.io_out_uop_prs1(_slots_2_io_out_uop_prs1),
		.io_out_uop_prs2(_slots_2_io_out_uop_prs2),
		.io_out_uop_prs1_busy(_slots_2_io_out_uop_prs1_busy),
		.io_out_uop_prs2_busy(_slots_2_io_out_uop_prs2_busy),
		.io_out_uop_ppred_busy(_slots_2_io_out_uop_ppred_busy),
		.io_out_uop_uses_ldq(_slots_2_io_out_uop_uses_ldq),
		.io_out_uop_uses_stq(_slots_2_io_out_uop_uses_stq),
		.io_out_uop_dst_rtype(_slots_2_io_out_uop_dst_rtype),
		.io_out_uop_lrs1_rtype(_slots_2_io_out_uop_lrs1_rtype),
		.io_out_uop_lrs2_rtype(_slots_2_io_out_uop_lrs2_rtype),
		.io_out_uop_fp_val(_slots_2_io_out_uop_fp_val),
		.io_brupdate_b1_resolve_mask(io_brupdate_b1_resolve_mask),
		.io_brupdate_b1_mispredict_mask(io_brupdate_b1_mispredict_mask),
		.io_kill(io_flush_pipeline),
		.io_clear(shamts_oh_2),
		.io_squash_grant(io_squash_grant),
		.io_wakeup_ports_0_valid(io_wakeup_ports_0_valid),
		.io_wakeup_ports_0_bits_uop_pdst(io_wakeup_ports_0_bits_uop_pdst),
		.io_wakeup_ports_0_bits_bypassable(io_wakeup_ports_0_bits_bypassable),
		.io_wakeup_ports_0_bits_rebusy(io_wakeup_ports_0_bits_rebusy),
		.io_wakeup_ports_1_valid(io_wakeup_ports_1_valid),
		.io_wakeup_ports_1_bits_uop_pdst(io_wakeup_ports_1_bits_uop_pdst),
		.io_wakeup_ports_2_valid(io_wakeup_ports_2_valid),
		.io_wakeup_ports_2_bits_uop_pdst(io_wakeup_ports_2_bits_uop_pdst),
		.io_child_rebusys(io_child_rebusys)
	);
	IssueSlot_8 slots_3(
		.clock(clock),
		.reset(reset),
		.io_valid(_slots_3_io_valid),
		.io_will_be_valid(_slots_3_io_will_be_valid),
		.io_request(_slots_3_io_request),
		.io_grant(issue_slots_3_grant),
		.io_iss_uop_fu_code_1(_slots_3_io_iss_uop_fu_code_1),
		.io_iss_uop_fu_code_2(_slots_3_io_iss_uop_fu_code_2),
		.io_iss_uop_iw_p1_bypass_hint(_slots_3_io_iss_uop_iw_p1_bypass_hint),
		.io_iss_uop_br_mask(_slots_3_io_iss_uop_br_mask),
		.io_iss_uop_imm_sel(_slots_3_io_iss_uop_imm_sel),
		.io_iss_uop_pimm(_slots_3_io_iss_uop_pimm),
		.io_iss_uop_ldq_idx(_slots_3_io_iss_uop_ldq_idx),
		.io_iss_uop_stq_idx(_slots_3_io_iss_uop_stq_idx),
		.io_iss_uop_pdst(_slots_3_io_iss_uop_pdst),
		.io_iss_uop_prs1(_slots_3_io_iss_uop_prs1),
		.io_iss_uop_uses_ldq(_slots_3_io_iss_uop_uses_ldq),
		.io_iss_uop_uses_stq(_slots_3_io_iss_uop_uses_stq),
		.io_iss_uop_dst_rtype(_slots_3_io_iss_uop_dst_rtype),
		.io_iss_uop_lrs1_rtype(_slots_3_io_iss_uop_lrs1_rtype),
		.io_iss_uop_fp_val(_slots_3_io_iss_uop_fp_val),
		.io_in_uop_valid(issue_slots_3_in_uop_valid),
		.io_in_uop_bits_fu_code_1(_slots_4_io_out_uop_fu_code_1),
		.io_in_uop_bits_fu_code_2(_slots_4_io_out_uop_fu_code_2),
		.io_in_uop_bits_iw_issued(_slots_4_io_out_uop_iw_issued),
		.io_in_uop_bits_iw_issued_partial_agen(_slots_4_io_out_uop_iw_issued_partial_agen),
		.io_in_uop_bits_iw_issued_partial_dgen(_slots_4_io_out_uop_iw_issued_partial_dgen),
		.io_in_uop_bits_iw_p1_speculative_child(_slots_4_io_out_uop_iw_p1_speculative_child),
		.io_in_uop_bits_iw_p2_speculative_child(_slots_4_io_out_uop_iw_p2_speculative_child),
		.io_in_uop_bits_iw_p1_bypass_hint(_slots_4_io_out_uop_iw_p1_bypass_hint),
		.io_in_uop_bits_iw_p2_bypass_hint(_slots_4_io_out_uop_iw_p2_bypass_hint),
		.io_in_uop_bits_br_mask(_slots_4_io_out_uop_br_mask),
		.io_in_uop_bits_imm_sel(_slots_4_io_out_uop_imm_sel),
		.io_in_uop_bits_pimm(_slots_4_io_out_uop_pimm),
		.io_in_uop_bits_ldq_idx(_slots_4_io_out_uop_ldq_idx),
		.io_in_uop_bits_stq_idx(_slots_4_io_out_uop_stq_idx),
		.io_in_uop_bits_pdst(_slots_4_io_out_uop_pdst),
		.io_in_uop_bits_prs1(_slots_4_io_out_uop_prs1),
		.io_in_uop_bits_prs2(_slots_4_io_out_uop_prs2),
		.io_in_uop_bits_prs1_busy(_slots_4_io_out_uop_prs1_busy),
		.io_in_uop_bits_prs2_busy(_slots_4_io_out_uop_prs2_busy),
		.io_in_uop_bits_ppred_busy(_slots_4_io_out_uop_ppred_busy),
		.io_in_uop_bits_uses_ldq(_slots_4_io_out_uop_uses_ldq),
		.io_in_uop_bits_uses_stq(_slots_4_io_out_uop_uses_stq),
		.io_in_uop_bits_dst_rtype(_slots_4_io_out_uop_dst_rtype),
		.io_in_uop_bits_lrs1_rtype(_slots_4_io_out_uop_lrs1_rtype),
		.io_in_uop_bits_lrs2_rtype(_slots_4_io_out_uop_lrs2_rtype),
		.io_in_uop_bits_fp_val(_slots_4_io_out_uop_fp_val),
		.io_out_uop_fu_code_1(_slots_3_io_out_uop_fu_code_1),
		.io_out_uop_fu_code_2(_slots_3_io_out_uop_fu_code_2),
		.io_out_uop_iw_issued(_slots_3_io_out_uop_iw_issued),
		.io_out_uop_iw_issued_partial_agen(_slots_3_io_out_uop_iw_issued_partial_agen),
		.io_out_uop_iw_issued_partial_dgen(_slots_3_io_out_uop_iw_issued_partial_dgen),
		.io_out_uop_iw_p1_speculative_child(_slots_3_io_out_uop_iw_p1_speculative_child),
		.io_out_uop_iw_p2_speculative_child(_slots_3_io_out_uop_iw_p2_speculative_child),
		.io_out_uop_iw_p1_bypass_hint(_slots_3_io_out_uop_iw_p1_bypass_hint),
		.io_out_uop_iw_p2_bypass_hint(_slots_3_io_out_uop_iw_p2_bypass_hint),
		.io_out_uop_br_mask(_slots_3_io_out_uop_br_mask),
		.io_out_uop_imm_sel(_slots_3_io_out_uop_imm_sel),
		.io_out_uop_pimm(_slots_3_io_out_uop_pimm),
		.io_out_uop_ldq_idx(_slots_3_io_out_uop_ldq_idx),
		.io_out_uop_stq_idx(_slots_3_io_out_uop_stq_idx),
		.io_out_uop_pdst(_slots_3_io_out_uop_pdst),
		.io_out_uop_prs1(_slots_3_io_out_uop_prs1),
		.io_out_uop_prs2(_slots_3_io_out_uop_prs2),
		.io_out_uop_prs1_busy(_slots_3_io_out_uop_prs1_busy),
		.io_out_uop_prs2_busy(_slots_3_io_out_uop_prs2_busy),
		.io_out_uop_ppred_busy(_slots_3_io_out_uop_ppred_busy),
		.io_out_uop_uses_ldq(_slots_3_io_out_uop_uses_ldq),
		.io_out_uop_uses_stq(_slots_3_io_out_uop_uses_stq),
		.io_out_uop_dst_rtype(_slots_3_io_out_uop_dst_rtype),
		.io_out_uop_lrs1_rtype(_slots_3_io_out_uop_lrs1_rtype),
		.io_out_uop_lrs2_rtype(_slots_3_io_out_uop_lrs2_rtype),
		.io_out_uop_fp_val(_slots_3_io_out_uop_fp_val),
		.io_brupdate_b1_resolve_mask(io_brupdate_b1_resolve_mask),
		.io_brupdate_b1_mispredict_mask(io_brupdate_b1_mispredict_mask),
		.io_kill(io_flush_pipeline),
		.io_clear(shamts_oh_3),
		.io_squash_grant(io_squash_grant),
		.io_wakeup_ports_0_valid(io_wakeup_ports_0_valid),
		.io_wakeup_ports_0_bits_uop_pdst(io_wakeup_ports_0_bits_uop_pdst),
		.io_wakeup_ports_0_bits_bypassable(io_wakeup_ports_0_bits_bypassable),
		.io_wakeup_ports_0_bits_rebusy(io_wakeup_ports_0_bits_rebusy),
		.io_wakeup_ports_1_valid(io_wakeup_ports_1_valid),
		.io_wakeup_ports_1_bits_uop_pdst(io_wakeup_ports_1_bits_uop_pdst),
		.io_wakeup_ports_2_valid(io_wakeup_ports_2_valid),
		.io_wakeup_ports_2_bits_uop_pdst(io_wakeup_ports_2_bits_uop_pdst),
		.io_child_rebusys(io_child_rebusys)
	);
	IssueSlot_8 slots_4(
		.clock(clock),
		.reset(reset),
		.io_valid(_slots_4_io_valid),
		.io_will_be_valid(_slots_4_io_will_be_valid),
		.io_request(_slots_4_io_request),
		.io_grant(issue_slots_4_grant),
		.io_iss_uop_fu_code_1(_slots_4_io_iss_uop_fu_code_1),
		.io_iss_uop_fu_code_2(_slots_4_io_iss_uop_fu_code_2),
		.io_iss_uop_iw_p1_bypass_hint(_slots_4_io_iss_uop_iw_p1_bypass_hint),
		.io_iss_uop_br_mask(_slots_4_io_iss_uop_br_mask),
		.io_iss_uop_imm_sel(_slots_4_io_iss_uop_imm_sel),
		.io_iss_uop_pimm(_slots_4_io_iss_uop_pimm),
		.io_iss_uop_ldq_idx(_slots_4_io_iss_uop_ldq_idx),
		.io_iss_uop_stq_idx(_slots_4_io_iss_uop_stq_idx),
		.io_iss_uop_pdst(_slots_4_io_iss_uop_pdst),
		.io_iss_uop_prs1(_slots_4_io_iss_uop_prs1),
		.io_iss_uop_uses_ldq(_slots_4_io_iss_uop_uses_ldq),
		.io_iss_uop_uses_stq(_slots_4_io_iss_uop_uses_stq),
		.io_iss_uop_dst_rtype(_slots_4_io_iss_uop_dst_rtype),
		.io_iss_uop_lrs1_rtype(_slots_4_io_iss_uop_lrs1_rtype),
		.io_iss_uop_fp_val(_slots_4_io_iss_uop_fp_val),
		.io_in_uop_valid(issue_slots_4_in_uop_valid),
		.io_in_uop_bits_fu_code_1(_slots_5_io_out_uop_fu_code_1),
		.io_in_uop_bits_fu_code_2(_slots_5_io_out_uop_fu_code_2),
		.io_in_uop_bits_iw_issued(_slots_5_io_out_uop_iw_issued),
		.io_in_uop_bits_iw_issued_partial_agen(_slots_5_io_out_uop_iw_issued_partial_agen),
		.io_in_uop_bits_iw_issued_partial_dgen(_slots_5_io_out_uop_iw_issued_partial_dgen),
		.io_in_uop_bits_iw_p1_speculative_child(_slots_5_io_out_uop_iw_p1_speculative_child),
		.io_in_uop_bits_iw_p2_speculative_child(_slots_5_io_out_uop_iw_p2_speculative_child),
		.io_in_uop_bits_iw_p1_bypass_hint(_slots_5_io_out_uop_iw_p1_bypass_hint),
		.io_in_uop_bits_iw_p2_bypass_hint(_slots_5_io_out_uop_iw_p2_bypass_hint),
		.io_in_uop_bits_br_mask(_slots_5_io_out_uop_br_mask),
		.io_in_uop_bits_imm_sel(_slots_5_io_out_uop_imm_sel),
		.io_in_uop_bits_pimm(_slots_5_io_out_uop_pimm),
		.io_in_uop_bits_ldq_idx(_slots_5_io_out_uop_ldq_idx),
		.io_in_uop_bits_stq_idx(_slots_5_io_out_uop_stq_idx),
		.io_in_uop_bits_pdst(_slots_5_io_out_uop_pdst),
		.io_in_uop_bits_prs1(_slots_5_io_out_uop_prs1),
		.io_in_uop_bits_prs2(_slots_5_io_out_uop_prs2),
		.io_in_uop_bits_prs1_busy(_slots_5_io_out_uop_prs1_busy),
		.io_in_uop_bits_prs2_busy(_slots_5_io_out_uop_prs2_busy),
		.io_in_uop_bits_ppred_busy(_slots_5_io_out_uop_ppred_busy),
		.io_in_uop_bits_uses_ldq(_slots_5_io_out_uop_uses_ldq),
		.io_in_uop_bits_uses_stq(_slots_5_io_out_uop_uses_stq),
		.io_in_uop_bits_dst_rtype(_slots_5_io_out_uop_dst_rtype),
		.io_in_uop_bits_lrs1_rtype(_slots_5_io_out_uop_lrs1_rtype),
		.io_in_uop_bits_lrs2_rtype(_slots_5_io_out_uop_lrs2_rtype),
		.io_in_uop_bits_fp_val(_slots_5_io_out_uop_fp_val),
		.io_out_uop_fu_code_1(_slots_4_io_out_uop_fu_code_1),
		.io_out_uop_fu_code_2(_slots_4_io_out_uop_fu_code_2),
		.io_out_uop_iw_issued(_slots_4_io_out_uop_iw_issued),
		.io_out_uop_iw_issued_partial_agen(_slots_4_io_out_uop_iw_issued_partial_agen),
		.io_out_uop_iw_issued_partial_dgen(_slots_4_io_out_uop_iw_issued_partial_dgen),
		.io_out_uop_iw_p1_speculative_child(_slots_4_io_out_uop_iw_p1_speculative_child),
		.io_out_uop_iw_p2_speculative_child(_slots_4_io_out_uop_iw_p2_speculative_child),
		.io_out_uop_iw_p1_bypass_hint(_slots_4_io_out_uop_iw_p1_bypass_hint),
		.io_out_uop_iw_p2_bypass_hint(_slots_4_io_out_uop_iw_p2_bypass_hint),
		.io_out_uop_br_mask(_slots_4_io_out_uop_br_mask),
		.io_out_uop_imm_sel(_slots_4_io_out_uop_imm_sel),
		.io_out_uop_pimm(_slots_4_io_out_uop_pimm),
		.io_out_uop_ldq_idx(_slots_4_io_out_uop_ldq_idx),
		.io_out_uop_stq_idx(_slots_4_io_out_uop_stq_idx),
		.io_out_uop_pdst(_slots_4_io_out_uop_pdst),
		.io_out_uop_prs1(_slots_4_io_out_uop_prs1),
		.io_out_uop_prs2(_slots_4_io_out_uop_prs2),
		.io_out_uop_prs1_busy(_slots_4_io_out_uop_prs1_busy),
		.io_out_uop_prs2_busy(_slots_4_io_out_uop_prs2_busy),
		.io_out_uop_ppred_busy(_slots_4_io_out_uop_ppred_busy),
		.io_out_uop_uses_ldq(_slots_4_io_out_uop_uses_ldq),
		.io_out_uop_uses_stq(_slots_4_io_out_uop_uses_stq),
		.io_out_uop_dst_rtype(_slots_4_io_out_uop_dst_rtype),
		.io_out_uop_lrs1_rtype(_slots_4_io_out_uop_lrs1_rtype),
		.io_out_uop_lrs2_rtype(_slots_4_io_out_uop_lrs2_rtype),
		.io_out_uop_fp_val(_slots_4_io_out_uop_fp_val),
		.io_brupdate_b1_resolve_mask(io_brupdate_b1_resolve_mask),
		.io_brupdate_b1_mispredict_mask(io_brupdate_b1_mispredict_mask),
		.io_kill(io_flush_pipeline),
		.io_clear(shamts_oh_4),
		.io_squash_grant(io_squash_grant),
		.io_wakeup_ports_0_valid(io_wakeup_ports_0_valid),
		.io_wakeup_ports_0_bits_uop_pdst(io_wakeup_ports_0_bits_uop_pdst),
		.io_wakeup_ports_0_bits_bypassable(io_wakeup_ports_0_bits_bypassable),
		.io_wakeup_ports_0_bits_rebusy(io_wakeup_ports_0_bits_rebusy),
		.io_wakeup_ports_1_valid(io_wakeup_ports_1_valid),
		.io_wakeup_ports_1_bits_uop_pdst(io_wakeup_ports_1_bits_uop_pdst),
		.io_wakeup_ports_2_valid(io_wakeup_ports_2_valid),
		.io_wakeup_ports_2_bits_uop_pdst(io_wakeup_ports_2_bits_uop_pdst),
		.io_child_rebusys(io_child_rebusys)
	);
	IssueSlot_8 slots_5(
		.clock(clock),
		.reset(reset),
		.io_valid(_slots_5_io_valid),
		.io_will_be_valid(_slots_5_io_will_be_valid),
		.io_request(_slots_5_io_request),
		.io_grant(issue_slots_5_grant),
		.io_iss_uop_fu_code_1(_slots_5_io_iss_uop_fu_code_1),
		.io_iss_uop_fu_code_2(_slots_5_io_iss_uop_fu_code_2),
		.io_iss_uop_iw_p1_bypass_hint(_slots_5_io_iss_uop_iw_p1_bypass_hint),
		.io_iss_uop_br_mask(_slots_5_io_iss_uop_br_mask),
		.io_iss_uop_imm_sel(_slots_5_io_iss_uop_imm_sel),
		.io_iss_uop_pimm(_slots_5_io_iss_uop_pimm),
		.io_iss_uop_ldq_idx(_slots_5_io_iss_uop_ldq_idx),
		.io_iss_uop_stq_idx(_slots_5_io_iss_uop_stq_idx),
		.io_iss_uop_pdst(_slots_5_io_iss_uop_pdst),
		.io_iss_uop_prs1(_slots_5_io_iss_uop_prs1),
		.io_iss_uop_uses_ldq(_slots_5_io_iss_uop_uses_ldq),
		.io_iss_uop_uses_stq(_slots_5_io_iss_uop_uses_stq),
		.io_iss_uop_dst_rtype(_slots_5_io_iss_uop_dst_rtype),
		.io_iss_uop_lrs1_rtype(_slots_5_io_iss_uop_lrs1_rtype),
		.io_iss_uop_fp_val(_slots_5_io_iss_uop_fp_val),
		.io_in_uop_valid(issue_slots_5_in_uop_valid),
		.io_in_uop_bits_fu_code_1(_slots_6_io_out_uop_fu_code_1),
		.io_in_uop_bits_fu_code_2(_slots_6_io_out_uop_fu_code_2),
		.io_in_uop_bits_iw_issued(_slots_6_io_out_uop_iw_issued),
		.io_in_uop_bits_iw_issued_partial_agen(_slots_6_io_out_uop_iw_issued_partial_agen),
		.io_in_uop_bits_iw_issued_partial_dgen(_slots_6_io_out_uop_iw_issued_partial_dgen),
		.io_in_uop_bits_iw_p1_speculative_child(_slots_6_io_out_uop_iw_p1_speculative_child),
		.io_in_uop_bits_iw_p2_speculative_child(_slots_6_io_out_uop_iw_p2_speculative_child),
		.io_in_uop_bits_iw_p1_bypass_hint(_slots_6_io_out_uop_iw_p1_bypass_hint),
		.io_in_uop_bits_iw_p2_bypass_hint(_slots_6_io_out_uop_iw_p2_bypass_hint),
		.io_in_uop_bits_br_mask(_slots_6_io_out_uop_br_mask),
		.io_in_uop_bits_imm_sel(_slots_6_io_out_uop_imm_sel),
		.io_in_uop_bits_pimm(_slots_6_io_out_uop_pimm),
		.io_in_uop_bits_ldq_idx(_slots_6_io_out_uop_ldq_idx),
		.io_in_uop_bits_stq_idx(_slots_6_io_out_uop_stq_idx),
		.io_in_uop_bits_pdst(_slots_6_io_out_uop_pdst),
		.io_in_uop_bits_prs1(_slots_6_io_out_uop_prs1),
		.io_in_uop_bits_prs2(_slots_6_io_out_uop_prs2),
		.io_in_uop_bits_prs1_busy(_slots_6_io_out_uop_prs1_busy),
		.io_in_uop_bits_prs2_busy(_slots_6_io_out_uop_prs2_busy),
		.io_in_uop_bits_ppred_busy(_slots_6_io_out_uop_ppred_busy),
		.io_in_uop_bits_uses_ldq(_slots_6_io_out_uop_uses_ldq),
		.io_in_uop_bits_uses_stq(_slots_6_io_out_uop_uses_stq),
		.io_in_uop_bits_dst_rtype(_slots_6_io_out_uop_dst_rtype),
		.io_in_uop_bits_lrs1_rtype(_slots_6_io_out_uop_lrs1_rtype),
		.io_in_uop_bits_lrs2_rtype(_slots_6_io_out_uop_lrs2_rtype),
		.io_in_uop_bits_fp_val(_slots_6_io_out_uop_fp_val),
		.io_out_uop_fu_code_1(_slots_5_io_out_uop_fu_code_1),
		.io_out_uop_fu_code_2(_slots_5_io_out_uop_fu_code_2),
		.io_out_uop_iw_issued(_slots_5_io_out_uop_iw_issued),
		.io_out_uop_iw_issued_partial_agen(_slots_5_io_out_uop_iw_issued_partial_agen),
		.io_out_uop_iw_issued_partial_dgen(_slots_5_io_out_uop_iw_issued_partial_dgen),
		.io_out_uop_iw_p1_speculative_child(_slots_5_io_out_uop_iw_p1_speculative_child),
		.io_out_uop_iw_p2_speculative_child(_slots_5_io_out_uop_iw_p2_speculative_child),
		.io_out_uop_iw_p1_bypass_hint(_slots_5_io_out_uop_iw_p1_bypass_hint),
		.io_out_uop_iw_p2_bypass_hint(_slots_5_io_out_uop_iw_p2_bypass_hint),
		.io_out_uop_br_mask(_slots_5_io_out_uop_br_mask),
		.io_out_uop_imm_sel(_slots_5_io_out_uop_imm_sel),
		.io_out_uop_pimm(_slots_5_io_out_uop_pimm),
		.io_out_uop_ldq_idx(_slots_5_io_out_uop_ldq_idx),
		.io_out_uop_stq_idx(_slots_5_io_out_uop_stq_idx),
		.io_out_uop_pdst(_slots_5_io_out_uop_pdst),
		.io_out_uop_prs1(_slots_5_io_out_uop_prs1),
		.io_out_uop_prs2(_slots_5_io_out_uop_prs2),
		.io_out_uop_prs1_busy(_slots_5_io_out_uop_prs1_busy),
		.io_out_uop_prs2_busy(_slots_5_io_out_uop_prs2_busy),
		.io_out_uop_ppred_busy(_slots_5_io_out_uop_ppred_busy),
		.io_out_uop_uses_ldq(_slots_5_io_out_uop_uses_ldq),
		.io_out_uop_uses_stq(_slots_5_io_out_uop_uses_stq),
		.io_out_uop_dst_rtype(_slots_5_io_out_uop_dst_rtype),
		.io_out_uop_lrs1_rtype(_slots_5_io_out_uop_lrs1_rtype),
		.io_out_uop_lrs2_rtype(_slots_5_io_out_uop_lrs2_rtype),
		.io_out_uop_fp_val(_slots_5_io_out_uop_fp_val),
		.io_brupdate_b1_resolve_mask(io_brupdate_b1_resolve_mask),
		.io_brupdate_b1_mispredict_mask(io_brupdate_b1_mispredict_mask),
		.io_kill(io_flush_pipeline),
		.io_clear(shamts_oh_5),
		.io_squash_grant(io_squash_grant),
		.io_wakeup_ports_0_valid(io_wakeup_ports_0_valid),
		.io_wakeup_ports_0_bits_uop_pdst(io_wakeup_ports_0_bits_uop_pdst),
		.io_wakeup_ports_0_bits_bypassable(io_wakeup_ports_0_bits_bypassable),
		.io_wakeup_ports_0_bits_rebusy(io_wakeup_ports_0_bits_rebusy),
		.io_wakeup_ports_1_valid(io_wakeup_ports_1_valid),
		.io_wakeup_ports_1_bits_uop_pdst(io_wakeup_ports_1_bits_uop_pdst),
		.io_wakeup_ports_2_valid(io_wakeup_ports_2_valid),
		.io_wakeup_ports_2_bits_uop_pdst(io_wakeup_ports_2_bits_uop_pdst),
		.io_child_rebusys(io_child_rebusys)
	);
	IssueSlot_8 slots_6(
		.clock(clock),
		.reset(reset),
		.io_valid(_slots_6_io_valid),
		.io_will_be_valid(_slots_6_io_will_be_valid),
		.io_request(_slots_6_io_request),
		.io_grant(issue_slots_6_grant),
		.io_iss_uop_fu_code_1(_slots_6_io_iss_uop_fu_code_1),
		.io_iss_uop_fu_code_2(_slots_6_io_iss_uop_fu_code_2),
		.io_iss_uop_iw_p1_bypass_hint(_slots_6_io_iss_uop_iw_p1_bypass_hint),
		.io_iss_uop_br_mask(_slots_6_io_iss_uop_br_mask),
		.io_iss_uop_imm_sel(_slots_6_io_iss_uop_imm_sel),
		.io_iss_uop_pimm(_slots_6_io_iss_uop_pimm),
		.io_iss_uop_ldq_idx(_slots_6_io_iss_uop_ldq_idx),
		.io_iss_uop_stq_idx(_slots_6_io_iss_uop_stq_idx),
		.io_iss_uop_pdst(_slots_6_io_iss_uop_pdst),
		.io_iss_uop_prs1(_slots_6_io_iss_uop_prs1),
		.io_iss_uop_uses_ldq(_slots_6_io_iss_uop_uses_ldq),
		.io_iss_uop_uses_stq(_slots_6_io_iss_uop_uses_stq),
		.io_iss_uop_dst_rtype(_slots_6_io_iss_uop_dst_rtype),
		.io_iss_uop_lrs1_rtype(_slots_6_io_iss_uop_lrs1_rtype),
		.io_iss_uop_fp_val(_slots_6_io_iss_uop_fp_val),
		.io_in_uop_valid(issue_slots_6_in_uop_valid),
		.io_in_uop_bits_fu_code_1(_slots_7_io_out_uop_fu_code_1),
		.io_in_uop_bits_fu_code_2(_slots_7_io_out_uop_fu_code_2),
		.io_in_uop_bits_iw_issued(_slots_7_io_out_uop_iw_issued),
		.io_in_uop_bits_iw_issued_partial_agen(_slots_7_io_out_uop_iw_issued_partial_agen),
		.io_in_uop_bits_iw_issued_partial_dgen(_slots_7_io_out_uop_iw_issued_partial_dgen),
		.io_in_uop_bits_iw_p1_speculative_child(_slots_7_io_out_uop_iw_p1_speculative_child),
		.io_in_uop_bits_iw_p2_speculative_child(_slots_7_io_out_uop_iw_p2_speculative_child),
		.io_in_uop_bits_iw_p1_bypass_hint(_slots_7_io_out_uop_iw_p1_bypass_hint),
		.io_in_uop_bits_iw_p2_bypass_hint(_slots_7_io_out_uop_iw_p2_bypass_hint),
		.io_in_uop_bits_br_mask(_slots_7_io_out_uop_br_mask),
		.io_in_uop_bits_imm_sel(_slots_7_io_out_uop_imm_sel),
		.io_in_uop_bits_pimm(_slots_7_io_out_uop_pimm),
		.io_in_uop_bits_ldq_idx(_slots_7_io_out_uop_ldq_idx),
		.io_in_uop_bits_stq_idx(_slots_7_io_out_uop_stq_idx),
		.io_in_uop_bits_pdst(_slots_7_io_out_uop_pdst),
		.io_in_uop_bits_prs1(_slots_7_io_out_uop_prs1),
		.io_in_uop_bits_prs2(_slots_7_io_out_uop_prs2),
		.io_in_uop_bits_prs1_busy(_slots_7_io_out_uop_prs1_busy),
		.io_in_uop_bits_prs2_busy(_slots_7_io_out_uop_prs2_busy),
		.io_in_uop_bits_ppred_busy(_slots_7_io_out_uop_ppred_busy),
		.io_in_uop_bits_uses_ldq(_slots_7_io_out_uop_uses_ldq),
		.io_in_uop_bits_uses_stq(_slots_7_io_out_uop_uses_stq),
		.io_in_uop_bits_dst_rtype(_slots_7_io_out_uop_dst_rtype),
		.io_in_uop_bits_lrs1_rtype(_slots_7_io_out_uop_lrs1_rtype),
		.io_in_uop_bits_lrs2_rtype(_slots_7_io_out_uop_lrs2_rtype),
		.io_in_uop_bits_fp_val(_slots_7_io_out_uop_fp_val),
		.io_out_uop_fu_code_1(_slots_6_io_out_uop_fu_code_1),
		.io_out_uop_fu_code_2(_slots_6_io_out_uop_fu_code_2),
		.io_out_uop_iw_issued(_slots_6_io_out_uop_iw_issued),
		.io_out_uop_iw_issued_partial_agen(_slots_6_io_out_uop_iw_issued_partial_agen),
		.io_out_uop_iw_issued_partial_dgen(_slots_6_io_out_uop_iw_issued_partial_dgen),
		.io_out_uop_iw_p1_speculative_child(_slots_6_io_out_uop_iw_p1_speculative_child),
		.io_out_uop_iw_p2_speculative_child(_slots_6_io_out_uop_iw_p2_speculative_child),
		.io_out_uop_iw_p1_bypass_hint(_slots_6_io_out_uop_iw_p1_bypass_hint),
		.io_out_uop_iw_p2_bypass_hint(_slots_6_io_out_uop_iw_p2_bypass_hint),
		.io_out_uop_br_mask(_slots_6_io_out_uop_br_mask),
		.io_out_uop_imm_sel(_slots_6_io_out_uop_imm_sel),
		.io_out_uop_pimm(_slots_6_io_out_uop_pimm),
		.io_out_uop_ldq_idx(_slots_6_io_out_uop_ldq_idx),
		.io_out_uop_stq_idx(_slots_6_io_out_uop_stq_idx),
		.io_out_uop_pdst(_slots_6_io_out_uop_pdst),
		.io_out_uop_prs1(_slots_6_io_out_uop_prs1),
		.io_out_uop_prs2(_slots_6_io_out_uop_prs2),
		.io_out_uop_prs1_busy(_slots_6_io_out_uop_prs1_busy),
		.io_out_uop_prs2_busy(_slots_6_io_out_uop_prs2_busy),
		.io_out_uop_ppred_busy(_slots_6_io_out_uop_ppred_busy),
		.io_out_uop_uses_ldq(_slots_6_io_out_uop_uses_ldq),
		.io_out_uop_uses_stq(_slots_6_io_out_uop_uses_stq),
		.io_out_uop_dst_rtype(_slots_6_io_out_uop_dst_rtype),
		.io_out_uop_lrs1_rtype(_slots_6_io_out_uop_lrs1_rtype),
		.io_out_uop_lrs2_rtype(_slots_6_io_out_uop_lrs2_rtype),
		.io_out_uop_fp_val(_slots_6_io_out_uop_fp_val),
		.io_brupdate_b1_resolve_mask(io_brupdate_b1_resolve_mask),
		.io_brupdate_b1_mispredict_mask(io_brupdate_b1_mispredict_mask),
		.io_kill(io_flush_pipeline),
		.io_clear(shamts_oh_6),
		.io_squash_grant(io_squash_grant),
		.io_wakeup_ports_0_valid(io_wakeup_ports_0_valid),
		.io_wakeup_ports_0_bits_uop_pdst(io_wakeup_ports_0_bits_uop_pdst),
		.io_wakeup_ports_0_bits_bypassable(io_wakeup_ports_0_bits_bypassable),
		.io_wakeup_ports_0_bits_rebusy(io_wakeup_ports_0_bits_rebusy),
		.io_wakeup_ports_1_valid(io_wakeup_ports_1_valid),
		.io_wakeup_ports_1_bits_uop_pdst(io_wakeup_ports_1_bits_uop_pdst),
		.io_wakeup_ports_2_valid(io_wakeup_ports_2_valid),
		.io_wakeup_ports_2_bits_uop_pdst(io_wakeup_ports_2_bits_uop_pdst),
		.io_child_rebusys(io_child_rebusys)
	);
	IssueSlot_8 slots_7(
		.clock(clock),
		.reset(reset),
		.io_valid(_slots_7_io_valid),
		.io_will_be_valid(_slots_7_io_will_be_valid),
		.io_request(_slots_7_io_request),
		.io_grant(issue_slots_7_grant),
		.io_iss_uop_fu_code_1(_slots_7_io_iss_uop_fu_code_1),
		.io_iss_uop_fu_code_2(_slots_7_io_iss_uop_fu_code_2),
		.io_iss_uop_iw_p1_bypass_hint(_slots_7_io_iss_uop_iw_p1_bypass_hint),
		.io_iss_uop_br_mask(_slots_7_io_iss_uop_br_mask),
		.io_iss_uop_imm_sel(_slots_7_io_iss_uop_imm_sel),
		.io_iss_uop_pimm(_slots_7_io_iss_uop_pimm),
		.io_iss_uop_ldq_idx(_slots_7_io_iss_uop_ldq_idx),
		.io_iss_uop_stq_idx(_slots_7_io_iss_uop_stq_idx),
		.io_iss_uop_pdst(_slots_7_io_iss_uop_pdst),
		.io_iss_uop_prs1(_slots_7_io_iss_uop_prs1),
		.io_iss_uop_uses_ldq(_slots_7_io_iss_uop_uses_ldq),
		.io_iss_uop_uses_stq(_slots_7_io_iss_uop_uses_stq),
		.io_iss_uop_dst_rtype(_slots_7_io_iss_uop_dst_rtype),
		.io_iss_uop_lrs1_rtype(_slots_7_io_iss_uop_lrs1_rtype),
		.io_iss_uop_fp_val(_slots_7_io_iss_uop_fp_val),
		.io_in_uop_valid(issue_slots_7_in_uop_valid),
		.io_in_uop_bits_fu_code_1(io_dis_uops_0_bits_fu_code_1),
		.io_in_uop_bits_fu_code_2(io_dis_uops_0_bits_fu_code_2),
		.io_in_uop_bits_iw_issued(1'h0),
		.io_in_uop_bits_iw_issued_partial_agen(1'h0),
		.io_in_uop_bits_iw_issued_partial_dgen(1'h0),
		.io_in_uop_bits_iw_p1_speculative_child((_GEN ? prs1_wakeups_2 : io_dis_uops_0_bits_iw_p1_speculative_child)),
		.io_in_uop_bits_iw_p2_speculative_child((_GEN_0 ? prs2_wakeups_2 : io_dis_uops_0_bits_iw_p2_speculative_child)),
		.io_in_uop_bits_iw_p1_bypass_hint(_GEN & ((prs1_wakeups_0 & io_wakeup_ports_0_bits_bypassable) | prs1_wakeups_2)),
		.io_in_uop_bits_iw_p2_bypass_hint(_GEN_0 & ((prs2_wakeups_0 & io_wakeup_ports_0_bits_bypassable) | prs2_wakeups_2)),
		.io_in_uop_bits_br_mask(io_dis_uops_0_bits_br_mask),
		.io_in_uop_bits_imm_sel(io_dis_uops_0_bits_imm_sel),
		.io_in_uop_bits_pimm(io_dis_uops_0_bits_pimm),
		.io_in_uop_bits_ldq_idx(io_dis_uops_0_bits_ldq_idx),
		.io_in_uop_bits_stq_idx(io_dis_uops_0_bits_stq_idx),
		.io_in_uop_bits_pdst(io_dis_uops_0_bits_pdst),
		.io_in_uop_bits_prs1(io_dis_uops_0_bits_prs1),
		.io_in_uop_bits_prs2(io_dis_uops_0_bits_prs2),
		.io_in_uop_bits_prs1_busy(((io_wakeup_ports_0_bits_rebusy & prs1_matches_0) | (io_child_rebusys & io_dis_uops_0_bits_iw_p1_speculative_child) ? io_dis_uops_0_bits_lrs1_rtype == 2'h0 : ~_GEN & io_dis_uops_0_bits_prs1_busy)),
		.io_in_uop_bits_prs2_busy(~_GEN_1 & ((io_wakeup_ports_0_bits_rebusy & prs2_matches_0) | (io_child_rebusys & io_dis_uops_0_bits_iw_p2_speculative_child) ? io_dis_uops_0_bits_lrs2_rtype == 2'h0 : ~_GEN_0 & io_dis_uops_0_bits_prs2_busy)),
		.io_in_uop_bits_ppred_busy(1'h0),
		.io_in_uop_bits_uses_ldq(io_dis_uops_0_bits_uses_ldq),
		.io_in_uop_bits_uses_stq(io_dis_uops_0_bits_uses_stq),
		.io_in_uop_bits_dst_rtype(io_dis_uops_0_bits_dst_rtype),
		.io_in_uop_bits_lrs1_rtype(io_dis_uops_0_bits_lrs1_rtype),
		.io_in_uop_bits_lrs2_rtype((_GEN_1 ? 2'h2 : io_dis_uops_0_bits_lrs2_rtype)),
		.io_in_uop_bits_fp_val(io_dis_uops_0_bits_fp_val),
		.io_out_uop_fu_code_1(_slots_7_io_out_uop_fu_code_1),
		.io_out_uop_fu_code_2(_slots_7_io_out_uop_fu_code_2),
		.io_out_uop_iw_issued(_slots_7_io_out_uop_iw_issued),
		.io_out_uop_iw_issued_partial_agen(_slots_7_io_out_uop_iw_issued_partial_agen),
		.io_out_uop_iw_issued_partial_dgen(_slots_7_io_out_uop_iw_issued_partial_dgen),
		.io_out_uop_iw_p1_speculative_child(_slots_7_io_out_uop_iw_p1_speculative_child),
		.io_out_uop_iw_p2_speculative_child(_slots_7_io_out_uop_iw_p2_speculative_child),
		.io_out_uop_iw_p1_bypass_hint(_slots_7_io_out_uop_iw_p1_bypass_hint),
		.io_out_uop_iw_p2_bypass_hint(_slots_7_io_out_uop_iw_p2_bypass_hint),
		.io_out_uop_br_mask(_slots_7_io_out_uop_br_mask),
		.io_out_uop_imm_sel(_slots_7_io_out_uop_imm_sel),
		.io_out_uop_pimm(_slots_7_io_out_uop_pimm),
		.io_out_uop_ldq_idx(_slots_7_io_out_uop_ldq_idx),
		.io_out_uop_stq_idx(_slots_7_io_out_uop_stq_idx),
		.io_out_uop_pdst(_slots_7_io_out_uop_pdst),
		.io_out_uop_prs1(_slots_7_io_out_uop_prs1),
		.io_out_uop_prs2(_slots_7_io_out_uop_prs2),
		.io_out_uop_prs1_busy(_slots_7_io_out_uop_prs1_busy),
		.io_out_uop_prs2_busy(_slots_7_io_out_uop_prs2_busy),
		.io_out_uop_ppred_busy(_slots_7_io_out_uop_ppred_busy),
		.io_out_uop_uses_ldq(_slots_7_io_out_uop_uses_ldq),
		.io_out_uop_uses_stq(_slots_7_io_out_uop_uses_stq),
		.io_out_uop_dst_rtype(_slots_7_io_out_uop_dst_rtype),
		.io_out_uop_lrs1_rtype(_slots_7_io_out_uop_lrs1_rtype),
		.io_out_uop_lrs2_rtype(_slots_7_io_out_uop_lrs2_rtype),
		.io_out_uop_fp_val(_slots_7_io_out_uop_fp_val),
		.io_brupdate_b1_resolve_mask(io_brupdate_b1_resolve_mask),
		.io_brupdate_b1_mispredict_mask(io_brupdate_b1_mispredict_mask),
		.io_kill(io_flush_pipeline),
		.io_clear(shamts_oh_7),
		.io_squash_grant(io_squash_grant),
		.io_wakeup_ports_0_valid(io_wakeup_ports_0_valid),
		.io_wakeup_ports_0_bits_uop_pdst(io_wakeup_ports_0_bits_uop_pdst),
		.io_wakeup_ports_0_bits_bypassable(io_wakeup_ports_0_bits_bypassable),
		.io_wakeup_ports_0_bits_rebusy(io_wakeup_ports_0_bits_rebusy),
		.io_wakeup_ports_1_valid(io_wakeup_ports_1_valid),
		.io_wakeup_ports_1_bits_uop_pdst(io_wakeup_ports_1_bits_uop_pdst),
		.io_wakeup_ports_2_valid(io_wakeup_ports_2_valid),
		.io_wakeup_ports_2_bits_uop_pdst(io_wakeup_ports_2_bits_uop_pdst),
		.io_child_rebusys(io_child_rebusys)
	);
	assign io_dis_uops_0_ready = io_dis_uops_0_ready_REG;
	assign io_iss_uops_0_valid = ~io_squash_grant & (((((((_GEN_38 | _GEN_35) | _GEN_29) | _GEN_23) | _GEN_17) | _GEN_11) | _GEN_5) | _GEN_2);
	assign io_iss_uops_0_bits_fu_code_1 = (_GEN_38 ? _slots_7_io_iss_uop_fu_code_1 : (_GEN_35 ? _slots_6_io_iss_uop_fu_code_1 : (_GEN_29 ? _slots_5_io_iss_uop_fu_code_1 : (_GEN_23 ? _slots_4_io_iss_uop_fu_code_1 : (_GEN_17 ? _slots_3_io_iss_uop_fu_code_1 : (_GEN_11 ? _slots_2_io_iss_uop_fu_code_1 : (_GEN_5 ? _slots_1_io_iss_uop_fu_code_1 : _slots_0_io_iss_uop_fu_code_1)))))));
	assign io_iss_uops_0_bits_fu_code_2 = (_GEN_38 ? _slots_7_io_iss_uop_fu_code_2 : (_GEN_35 ? _slots_6_io_iss_uop_fu_code_2 : (_GEN_29 ? _slots_5_io_iss_uop_fu_code_2 : (_GEN_23 ? _slots_4_io_iss_uop_fu_code_2 : (_GEN_17 ? _slots_3_io_iss_uop_fu_code_2 : (_GEN_11 ? _slots_2_io_iss_uop_fu_code_2 : (_GEN_5 ? _slots_1_io_iss_uop_fu_code_2 : _slots_0_io_iss_uop_fu_code_2)))))));
	assign io_iss_uops_0_bits_iw_p1_bypass_hint = (_GEN_38 ? _slots_7_io_iss_uop_iw_p1_bypass_hint : (_GEN_35 ? _slots_6_io_iss_uop_iw_p1_bypass_hint : (_GEN_29 ? _slots_5_io_iss_uop_iw_p1_bypass_hint : (_GEN_23 ? _slots_4_io_iss_uop_iw_p1_bypass_hint : (_GEN_17 ? _slots_3_io_iss_uop_iw_p1_bypass_hint : (_GEN_11 ? _slots_2_io_iss_uop_iw_p1_bypass_hint : (_GEN_5 ? _slots_1_io_iss_uop_iw_p1_bypass_hint : _slots_0_io_iss_uop_iw_p1_bypass_hint)))))));
	assign io_iss_uops_0_bits_br_mask = (_GEN_38 ? _slots_7_io_iss_uop_br_mask : (_GEN_35 ? _slots_6_io_iss_uop_br_mask : (_GEN_29 ? _slots_5_io_iss_uop_br_mask : (_GEN_23 ? _slots_4_io_iss_uop_br_mask : (_GEN_17 ? _slots_3_io_iss_uop_br_mask : (_GEN_11 ? _slots_2_io_iss_uop_br_mask : (_GEN_5 ? _slots_1_io_iss_uop_br_mask : _slots_0_io_iss_uop_br_mask)))))));
	assign io_iss_uops_0_bits_imm_sel = (_GEN_38 ? _slots_7_io_iss_uop_imm_sel : (_GEN_35 ? _slots_6_io_iss_uop_imm_sel : (_GEN_29 ? _slots_5_io_iss_uop_imm_sel : (_GEN_23 ? _slots_4_io_iss_uop_imm_sel : (_GEN_17 ? _slots_3_io_iss_uop_imm_sel : (_GEN_11 ? _slots_2_io_iss_uop_imm_sel : (_GEN_5 ? _slots_1_io_iss_uop_imm_sel : _slots_0_io_iss_uop_imm_sel)))))));
	assign io_iss_uops_0_bits_pimm = (_GEN_38 ? _slots_7_io_iss_uop_pimm : (_GEN_35 ? _slots_6_io_iss_uop_pimm : (_GEN_29 ? _slots_5_io_iss_uop_pimm : (_GEN_23 ? _slots_4_io_iss_uop_pimm : (_GEN_17 ? _slots_3_io_iss_uop_pimm : (_GEN_11 ? _slots_2_io_iss_uop_pimm : (_GEN_5 ? _slots_1_io_iss_uop_pimm : _slots_0_io_iss_uop_pimm)))))));
	assign io_iss_uops_0_bits_stq_idx = (_GEN_38 ? _slots_7_io_iss_uop_stq_idx : (_GEN_35 ? _slots_6_io_iss_uop_stq_idx : (_GEN_29 ? _slots_5_io_iss_uop_stq_idx : (_GEN_23 ? _slots_4_io_iss_uop_stq_idx : (_GEN_17 ? _slots_3_io_iss_uop_stq_idx : (_GEN_11 ? _slots_2_io_iss_uop_stq_idx : (_GEN_5 ? _slots_1_io_iss_uop_stq_idx : _slots_0_io_iss_uop_stq_idx)))))));
	assign io_iss_uops_0_bits_prs1 = (_GEN_38 ? _slots_7_io_iss_uop_prs1 : (_GEN_35 ? _slots_6_io_iss_uop_prs1 : (_GEN_29 ? _slots_5_io_iss_uop_prs1 : (_GEN_23 ? _slots_4_io_iss_uop_prs1 : (_GEN_17 ? _slots_3_io_iss_uop_prs1 : (_GEN_11 ? _slots_2_io_iss_uop_prs1 : (_GEN_5 ? _slots_1_io_iss_uop_prs1 : _slots_0_io_iss_uop_prs1)))))));
	assign io_iss_uops_0_bits_lrs1_rtype = (_GEN_38 ? _slots_7_io_iss_uop_lrs1_rtype : (_GEN_35 ? _slots_6_io_iss_uop_lrs1_rtype : (_GEN_29 ? _slots_5_io_iss_uop_lrs1_rtype : (_GEN_23 ? _slots_4_io_iss_uop_lrs1_rtype : (_GEN_17 ? _slots_3_io_iss_uop_lrs1_rtype : (_GEN_11 ? _slots_2_io_iss_uop_lrs1_rtype : (_GEN_5 ? _slots_1_io_iss_uop_lrs1_rtype : _slots_0_io_iss_uop_lrs1_rtype)))))));
	assign io_iss_uops_1_valid = ~io_squash_grant & (((((((_GEN_39 | _GEN_37) | _GEN_32) | _GEN_26) | _GEN_20) | _GEN_14) | _GEN_8) | _GEN_3);
	assign io_iss_uops_1_bits_fu_code_1 = (_GEN_39 ? _slots_7_io_iss_uop_fu_code_1 : (_GEN_37 ? _slots_6_io_iss_uop_fu_code_1 : (_GEN_32 ? _slots_5_io_iss_uop_fu_code_1 : (_GEN_26 ? _slots_4_io_iss_uop_fu_code_1 : (_GEN_20 ? _slots_3_io_iss_uop_fu_code_1 : (_GEN_14 ? _slots_2_io_iss_uop_fu_code_1 : (_GEN_8 ? _slots_1_io_iss_uop_fu_code_1 : _slots_0_io_iss_uop_fu_code_1)))))));
	assign io_iss_uops_1_bits_fu_code_2 = (_GEN_39 ? _slots_7_io_iss_uop_fu_code_2 : (_GEN_37 ? _slots_6_io_iss_uop_fu_code_2 : (_GEN_32 ? _slots_5_io_iss_uop_fu_code_2 : (_GEN_26 ? _slots_4_io_iss_uop_fu_code_2 : (_GEN_20 ? _slots_3_io_iss_uop_fu_code_2 : (_GEN_14 ? _slots_2_io_iss_uop_fu_code_2 : (_GEN_8 ? _slots_1_io_iss_uop_fu_code_2 : _slots_0_io_iss_uop_fu_code_2)))))));
	assign io_iss_uops_1_bits_iw_p1_bypass_hint = (_GEN_39 ? _slots_7_io_iss_uop_iw_p1_bypass_hint : (_GEN_37 ? _slots_6_io_iss_uop_iw_p1_bypass_hint : (_GEN_32 ? _slots_5_io_iss_uop_iw_p1_bypass_hint : (_GEN_26 ? _slots_4_io_iss_uop_iw_p1_bypass_hint : (_GEN_20 ? _slots_3_io_iss_uop_iw_p1_bypass_hint : (_GEN_14 ? _slots_2_io_iss_uop_iw_p1_bypass_hint : (_GEN_8 ? _slots_1_io_iss_uop_iw_p1_bypass_hint : _slots_0_io_iss_uop_iw_p1_bypass_hint)))))));
	assign io_iss_uops_1_bits_br_mask = (_GEN_39 ? _slots_7_io_iss_uop_br_mask : (_GEN_37 ? _slots_6_io_iss_uop_br_mask : (_GEN_32 ? _slots_5_io_iss_uop_br_mask : (_GEN_26 ? _slots_4_io_iss_uop_br_mask : (_GEN_20 ? _slots_3_io_iss_uop_br_mask : (_GEN_14 ? _slots_2_io_iss_uop_br_mask : (_GEN_8 ? _slots_1_io_iss_uop_br_mask : _slots_0_io_iss_uop_br_mask)))))));
	assign io_iss_uops_1_bits_imm_sel = (_GEN_39 ? _slots_7_io_iss_uop_imm_sel : (_GEN_37 ? _slots_6_io_iss_uop_imm_sel : (_GEN_32 ? _slots_5_io_iss_uop_imm_sel : (_GEN_26 ? _slots_4_io_iss_uop_imm_sel : (_GEN_20 ? _slots_3_io_iss_uop_imm_sel : (_GEN_14 ? _slots_2_io_iss_uop_imm_sel : (_GEN_8 ? _slots_1_io_iss_uop_imm_sel : _slots_0_io_iss_uop_imm_sel)))))));
	assign io_iss_uops_1_bits_pimm = (_GEN_39 ? _slots_7_io_iss_uop_pimm : (_GEN_37 ? _slots_6_io_iss_uop_pimm : (_GEN_32 ? _slots_5_io_iss_uop_pimm : (_GEN_26 ? _slots_4_io_iss_uop_pimm : (_GEN_20 ? _slots_3_io_iss_uop_pimm : (_GEN_14 ? _slots_2_io_iss_uop_pimm : (_GEN_8 ? _slots_1_io_iss_uop_pimm : _slots_0_io_iss_uop_pimm)))))));
	assign io_iss_uops_1_bits_ldq_idx = (_GEN_39 ? _slots_7_io_iss_uop_ldq_idx : (_GEN_37 ? _slots_6_io_iss_uop_ldq_idx : (_GEN_32 ? _slots_5_io_iss_uop_ldq_idx : (_GEN_26 ? _slots_4_io_iss_uop_ldq_idx : (_GEN_20 ? _slots_3_io_iss_uop_ldq_idx : (_GEN_14 ? _slots_2_io_iss_uop_ldq_idx : (_GEN_8 ? _slots_1_io_iss_uop_ldq_idx : _slots_0_io_iss_uop_ldq_idx)))))));
	assign io_iss_uops_1_bits_stq_idx = (_GEN_39 ? _slots_7_io_iss_uop_stq_idx : (_GEN_37 ? _slots_6_io_iss_uop_stq_idx : (_GEN_32 ? _slots_5_io_iss_uop_stq_idx : (_GEN_26 ? _slots_4_io_iss_uop_stq_idx : (_GEN_20 ? _slots_3_io_iss_uop_stq_idx : (_GEN_14 ? _slots_2_io_iss_uop_stq_idx : (_GEN_8 ? _slots_1_io_iss_uop_stq_idx : _slots_0_io_iss_uop_stq_idx)))))));
	assign io_iss_uops_1_bits_pdst = (_GEN_39 ? _slots_7_io_iss_uop_pdst : (_GEN_37 ? _slots_6_io_iss_uop_pdst : (_GEN_32 ? _slots_5_io_iss_uop_pdst : (_GEN_26 ? _slots_4_io_iss_uop_pdst : (_GEN_20 ? _slots_3_io_iss_uop_pdst : (_GEN_14 ? _slots_2_io_iss_uop_pdst : (_GEN_8 ? _slots_1_io_iss_uop_pdst : _slots_0_io_iss_uop_pdst)))))));
	assign io_iss_uops_1_bits_prs1 = (_GEN_39 ? _slots_7_io_iss_uop_prs1 : (_GEN_37 ? _slots_6_io_iss_uop_prs1 : (_GEN_32 ? _slots_5_io_iss_uop_prs1 : (_GEN_26 ? _slots_4_io_iss_uop_prs1 : (_GEN_20 ? _slots_3_io_iss_uop_prs1 : (_GEN_14 ? _slots_2_io_iss_uop_prs1 : (_GEN_8 ? _slots_1_io_iss_uop_prs1 : _slots_0_io_iss_uop_prs1)))))));
	assign io_iss_uops_1_bits_uses_ldq = (_GEN_39 ? _slots_7_io_iss_uop_uses_ldq : (_GEN_37 ? _slots_6_io_iss_uop_uses_ldq : (_GEN_32 ? _slots_5_io_iss_uop_uses_ldq : (_GEN_26 ? _slots_4_io_iss_uop_uses_ldq : (_GEN_20 ? _slots_3_io_iss_uop_uses_ldq : (_GEN_14 ? _slots_2_io_iss_uop_uses_ldq : (_GEN_8 ? _slots_1_io_iss_uop_uses_ldq : _slots_0_io_iss_uop_uses_ldq)))))));
	assign io_iss_uops_1_bits_uses_stq = (_GEN_39 ? _slots_7_io_iss_uop_uses_stq : (_GEN_37 ? _slots_6_io_iss_uop_uses_stq : (_GEN_32 ? _slots_5_io_iss_uop_uses_stq : (_GEN_26 ? _slots_4_io_iss_uop_uses_stq : (_GEN_20 ? _slots_3_io_iss_uop_uses_stq : (_GEN_14 ? _slots_2_io_iss_uop_uses_stq : (_GEN_8 ? _slots_1_io_iss_uop_uses_stq : _slots_0_io_iss_uop_uses_stq)))))));
	assign io_iss_uops_1_bits_dst_rtype = (_GEN_39 ? _slots_7_io_iss_uop_dst_rtype : (_GEN_37 ? _slots_6_io_iss_uop_dst_rtype : (_GEN_32 ? _slots_5_io_iss_uop_dst_rtype : (_GEN_26 ? _slots_4_io_iss_uop_dst_rtype : (_GEN_20 ? _slots_3_io_iss_uop_dst_rtype : (_GEN_14 ? _slots_2_io_iss_uop_dst_rtype : (_GEN_8 ? _slots_1_io_iss_uop_dst_rtype : _slots_0_io_iss_uop_dst_rtype)))))));
	assign io_iss_uops_1_bits_lrs1_rtype = (_GEN_39 ? _slots_7_io_iss_uop_lrs1_rtype : (_GEN_37 ? _slots_6_io_iss_uop_lrs1_rtype : (_GEN_32 ? _slots_5_io_iss_uop_lrs1_rtype : (_GEN_26 ? _slots_4_io_iss_uop_lrs1_rtype : (_GEN_20 ? _slots_3_io_iss_uop_lrs1_rtype : (_GEN_14 ? _slots_2_io_iss_uop_lrs1_rtype : (_GEN_8 ? _slots_1_io_iss_uop_lrs1_rtype : _slots_0_io_iss_uop_lrs1_rtype)))))));
	assign io_iss_uops_1_bits_fp_val = (_GEN_39 ? _slots_7_io_iss_uop_fp_val : (_GEN_37 ? _slots_6_io_iss_uop_fp_val : (_GEN_32 ? _slots_5_io_iss_uop_fp_val : (_GEN_26 ? _slots_4_io_iss_uop_fp_val : (_GEN_20 ? _slots_3_io_iss_uop_fp_val : (_GEN_14 ? _slots_2_io_iss_uop_fp_val : (_GEN_8 ? _slots_1_io_iss_uop_fp_val : _slots_0_io_iss_uop_fp_val)))))));
endmodule
