module IssueUnitCollapsing_3 (
	clock,
	reset,
	io_dis_uops_0_ready,
	io_dis_uops_0_valid,
	io_dis_uops_0_bits_inst,
	io_dis_uops_0_bits_debug_inst,
	io_dis_uops_0_bits_is_rvc,
	io_dis_uops_0_bits_debug_pc,
	io_dis_uops_0_bits_iq_type_0,
	io_dis_uops_0_bits_iq_type_1,
	io_dis_uops_0_bits_iq_type_2,
	io_dis_uops_0_bits_iq_type_3,
	io_dis_uops_0_bits_fu_code_0,
	io_dis_uops_0_bits_fu_code_1,
	io_dis_uops_0_bits_fu_code_2,
	io_dis_uops_0_bits_fu_code_3,
	io_dis_uops_0_bits_fu_code_4,
	io_dis_uops_0_bits_fu_code_5,
	io_dis_uops_0_bits_fu_code_6,
	io_dis_uops_0_bits_fu_code_7,
	io_dis_uops_0_bits_fu_code_8,
	io_dis_uops_0_bits_fu_code_9,
	io_dis_uops_0_bits_iw_p1_speculative_child,
	io_dis_uops_0_bits_iw_p2_speculative_child,
	io_dis_uops_0_bits_br_mask,
	io_dis_uops_0_bits_br_tag,
	io_dis_uops_0_bits_br_type,
	io_dis_uops_0_bits_is_sfb,
	io_dis_uops_0_bits_is_fence,
	io_dis_uops_0_bits_is_fencei,
	io_dis_uops_0_bits_is_sfence,
	io_dis_uops_0_bits_is_amo,
	io_dis_uops_0_bits_is_eret,
	io_dis_uops_0_bits_is_sys_pc2epc,
	io_dis_uops_0_bits_is_rocc,
	io_dis_uops_0_bits_is_mov,
	io_dis_uops_0_bits_ftq_idx,
	io_dis_uops_0_bits_edge_inst,
	io_dis_uops_0_bits_pc_lob,
	io_dis_uops_0_bits_taken,
	io_dis_uops_0_bits_imm_rename,
	io_dis_uops_0_bits_imm_sel,
	io_dis_uops_0_bits_pimm,
	io_dis_uops_0_bits_imm_packed,
	io_dis_uops_0_bits_op1_sel,
	io_dis_uops_0_bits_op2_sel,
	io_dis_uops_0_bits_fp_ctrl_ldst,
	io_dis_uops_0_bits_fp_ctrl_wen,
	io_dis_uops_0_bits_fp_ctrl_ren1,
	io_dis_uops_0_bits_fp_ctrl_ren2,
	io_dis_uops_0_bits_fp_ctrl_ren3,
	io_dis_uops_0_bits_fp_ctrl_swap12,
	io_dis_uops_0_bits_fp_ctrl_swap23,
	io_dis_uops_0_bits_fp_ctrl_typeTagIn,
	io_dis_uops_0_bits_fp_ctrl_typeTagOut,
	io_dis_uops_0_bits_fp_ctrl_fromint,
	io_dis_uops_0_bits_fp_ctrl_toint,
	io_dis_uops_0_bits_fp_ctrl_fastpipe,
	io_dis_uops_0_bits_fp_ctrl_fma,
	io_dis_uops_0_bits_fp_ctrl_div,
	io_dis_uops_0_bits_fp_ctrl_sqrt,
	io_dis_uops_0_bits_fp_ctrl_wflags,
	io_dis_uops_0_bits_fp_ctrl_vec,
	io_dis_uops_0_bits_rob_idx,
	io_dis_uops_0_bits_ldq_idx,
	io_dis_uops_0_bits_stq_idx,
	io_dis_uops_0_bits_rxq_idx,
	io_dis_uops_0_bits_pdst,
	io_dis_uops_0_bits_prs1,
	io_dis_uops_0_bits_prs2,
	io_dis_uops_0_bits_prs3,
	io_dis_uops_0_bits_ppred,
	io_dis_uops_0_bits_prs1_busy,
	io_dis_uops_0_bits_prs2_busy,
	io_dis_uops_0_bits_prs3_busy,
	io_dis_uops_0_bits_ppred_busy,
	io_dis_uops_0_bits_stale_pdst,
	io_dis_uops_0_bits_exception,
	io_dis_uops_0_bits_exc_cause,
	io_dis_uops_0_bits_mem_cmd,
	io_dis_uops_0_bits_mem_size,
	io_dis_uops_0_bits_mem_signed,
	io_dis_uops_0_bits_uses_ldq,
	io_dis_uops_0_bits_uses_stq,
	io_dis_uops_0_bits_is_unique,
	io_dis_uops_0_bits_flush_on_commit,
	io_dis_uops_0_bits_csr_cmd,
	io_dis_uops_0_bits_ldst_is_rs1,
	io_dis_uops_0_bits_ldst,
	io_dis_uops_0_bits_lrs1,
	io_dis_uops_0_bits_lrs2,
	io_dis_uops_0_bits_lrs3,
	io_dis_uops_0_bits_dst_rtype,
	io_dis_uops_0_bits_lrs1_rtype,
	io_dis_uops_0_bits_lrs2_rtype,
	io_dis_uops_0_bits_frs3_en,
	io_dis_uops_0_bits_fcn_dw,
	io_dis_uops_0_bits_fcn_op,
	io_dis_uops_0_bits_fp_val,
	io_dis_uops_0_bits_xcpt_pf_if,
	io_dis_uops_0_bits_xcpt_ae_if,
	io_dis_uops_0_bits_xcpt_ma_if,
	io_dis_uops_0_bits_bp_debug_if,
	io_dis_uops_0_bits_bp_xcpt_if,
	io_dis_uops_0_bits_debug_fsrc,
	io_dis_uops_0_bits_debug_tsrc,
	io_iss_uops_0_valid,
	io_iss_uops_0_bits_is_rvc,
	io_iss_uops_0_bits_fu_code_0,
	io_iss_uops_0_bits_iw_p1_bypass_hint,
	io_iss_uops_0_bits_iw_p2_bypass_hint,
	io_iss_uops_0_bits_br_mask,
	io_iss_uops_0_bits_br_tag,
	io_iss_uops_0_bits_br_type,
	io_iss_uops_0_bits_is_sfb,
	io_iss_uops_0_bits_is_mov,
	io_iss_uops_0_bits_ftq_idx,
	io_iss_uops_0_bits_edge_inst,
	io_iss_uops_0_bits_pc_lob,
	io_iss_uops_0_bits_taken,
	io_iss_uops_0_bits_imm_sel,
	io_iss_uops_0_bits_pimm,
	io_iss_uops_0_bits_op1_sel,
	io_iss_uops_0_bits_op2_sel,
	io_iss_uops_0_bits_rob_idx,
	io_iss_uops_0_bits_pdst,
	io_iss_uops_0_bits_prs1,
	io_iss_uops_0_bits_prs2,
	io_iss_uops_0_bits_ppred,
	io_iss_uops_0_bits_csr_cmd,
	io_iss_uops_0_bits_ldst_is_rs1,
	io_iss_uops_0_bits_dst_rtype,
	io_iss_uops_0_bits_lrs1_rtype,
	io_iss_uops_0_bits_lrs2_rtype,
	io_iss_uops_0_bits_fcn_dw,
	io_iss_uops_0_bits_fcn_op,
	io_wakeup_ports_0_valid,
	io_wakeup_ports_0_bits_uop_pdst,
	io_wakeup_ports_0_bits_bypassable,
	io_wakeup_ports_0_bits_rebusy,
	io_wakeup_ports_1_valid,
	io_wakeup_ports_1_bits_uop_pdst,
	io_wakeup_ports_2_valid,
	io_wakeup_ports_2_bits_uop_pdst,
	io_pred_wakeup_port_valid,
	io_pred_wakeup_port_bits,
	io_child_rebusys,
	io_brupdate_b1_resolve_mask,
	io_brupdate_b1_mispredict_mask,
	io_flush_pipeline,
	io_squash_grant
);
	input clock;
	input reset;
	output wire io_dis_uops_0_ready;
	input io_dis_uops_0_valid;
	input [31:0] io_dis_uops_0_bits_inst;
	input [31:0] io_dis_uops_0_bits_debug_inst;
	input io_dis_uops_0_bits_is_rvc;
	input [39:0] io_dis_uops_0_bits_debug_pc;
	input io_dis_uops_0_bits_iq_type_0;
	input io_dis_uops_0_bits_iq_type_1;
	input io_dis_uops_0_bits_iq_type_2;
	input io_dis_uops_0_bits_iq_type_3;
	input io_dis_uops_0_bits_fu_code_0;
	input io_dis_uops_0_bits_fu_code_1;
	input io_dis_uops_0_bits_fu_code_2;
	input io_dis_uops_0_bits_fu_code_3;
	input io_dis_uops_0_bits_fu_code_4;
	input io_dis_uops_0_bits_fu_code_5;
	input io_dis_uops_0_bits_fu_code_6;
	input io_dis_uops_0_bits_fu_code_7;
	input io_dis_uops_0_bits_fu_code_8;
	input io_dis_uops_0_bits_fu_code_9;
	input io_dis_uops_0_bits_iw_p1_speculative_child;
	input io_dis_uops_0_bits_iw_p2_speculative_child;
	input [7:0] io_dis_uops_0_bits_br_mask;
	input [2:0] io_dis_uops_0_bits_br_tag;
	input [3:0] io_dis_uops_0_bits_br_type;
	input io_dis_uops_0_bits_is_sfb;
	input io_dis_uops_0_bits_is_fence;
	input io_dis_uops_0_bits_is_fencei;
	input io_dis_uops_0_bits_is_sfence;
	input io_dis_uops_0_bits_is_amo;
	input io_dis_uops_0_bits_is_eret;
	input io_dis_uops_0_bits_is_sys_pc2epc;
	input io_dis_uops_0_bits_is_rocc;
	input io_dis_uops_0_bits_is_mov;
	input [3:0] io_dis_uops_0_bits_ftq_idx;
	input io_dis_uops_0_bits_edge_inst;
	input [5:0] io_dis_uops_0_bits_pc_lob;
	input io_dis_uops_0_bits_taken;
	input io_dis_uops_0_bits_imm_rename;
	input [2:0] io_dis_uops_0_bits_imm_sel;
	input [4:0] io_dis_uops_0_bits_pimm;
	input [19:0] io_dis_uops_0_bits_imm_packed;
	input [1:0] io_dis_uops_0_bits_op1_sel;
	input [2:0] io_dis_uops_0_bits_op2_sel;
	input io_dis_uops_0_bits_fp_ctrl_ldst;
	input io_dis_uops_0_bits_fp_ctrl_wen;
	input io_dis_uops_0_bits_fp_ctrl_ren1;
	input io_dis_uops_0_bits_fp_ctrl_ren2;
	input io_dis_uops_0_bits_fp_ctrl_ren3;
	input io_dis_uops_0_bits_fp_ctrl_swap12;
	input io_dis_uops_0_bits_fp_ctrl_swap23;
	input [1:0] io_dis_uops_0_bits_fp_ctrl_typeTagIn;
	input [1:0] io_dis_uops_0_bits_fp_ctrl_typeTagOut;
	input io_dis_uops_0_bits_fp_ctrl_fromint;
	input io_dis_uops_0_bits_fp_ctrl_toint;
	input io_dis_uops_0_bits_fp_ctrl_fastpipe;
	input io_dis_uops_0_bits_fp_ctrl_fma;
	input io_dis_uops_0_bits_fp_ctrl_div;
	input io_dis_uops_0_bits_fp_ctrl_sqrt;
	input io_dis_uops_0_bits_fp_ctrl_wflags;
	input io_dis_uops_0_bits_fp_ctrl_vec;
	input [4:0] io_dis_uops_0_bits_rob_idx;
	input [3:0] io_dis_uops_0_bits_ldq_idx;
	input [3:0] io_dis_uops_0_bits_stq_idx;
	input [1:0] io_dis_uops_0_bits_rxq_idx;
	input [5:0] io_dis_uops_0_bits_pdst;
	input [5:0] io_dis_uops_0_bits_prs1;
	input [5:0] io_dis_uops_0_bits_prs2;
	input [5:0] io_dis_uops_0_bits_prs3;
	input [3:0] io_dis_uops_0_bits_ppred;
	input io_dis_uops_0_bits_prs1_busy;
	input io_dis_uops_0_bits_prs2_busy;
	input io_dis_uops_0_bits_prs3_busy;
	input io_dis_uops_0_bits_ppred_busy;
	input [5:0] io_dis_uops_0_bits_stale_pdst;
	input io_dis_uops_0_bits_exception;
	input [63:0] io_dis_uops_0_bits_exc_cause;
	input [4:0] io_dis_uops_0_bits_mem_cmd;
	input [1:0] io_dis_uops_0_bits_mem_size;
	input io_dis_uops_0_bits_mem_signed;
	input io_dis_uops_0_bits_uses_ldq;
	input io_dis_uops_0_bits_uses_stq;
	input io_dis_uops_0_bits_is_unique;
	input io_dis_uops_0_bits_flush_on_commit;
	input [2:0] io_dis_uops_0_bits_csr_cmd;
	input io_dis_uops_0_bits_ldst_is_rs1;
	input [5:0] io_dis_uops_0_bits_ldst;
	input [5:0] io_dis_uops_0_bits_lrs1;
	input [5:0] io_dis_uops_0_bits_lrs2;
	input [5:0] io_dis_uops_0_bits_lrs3;
	input [1:0] io_dis_uops_0_bits_dst_rtype;
	input [1:0] io_dis_uops_0_bits_lrs1_rtype;
	input [1:0] io_dis_uops_0_bits_lrs2_rtype;
	input io_dis_uops_0_bits_frs3_en;
	input io_dis_uops_0_bits_fcn_dw;
	input [4:0] io_dis_uops_0_bits_fcn_op;
	input io_dis_uops_0_bits_fp_val;
	input io_dis_uops_0_bits_xcpt_pf_if;
	input io_dis_uops_0_bits_xcpt_ae_if;
	input io_dis_uops_0_bits_xcpt_ma_if;
	input io_dis_uops_0_bits_bp_debug_if;
	input io_dis_uops_0_bits_bp_xcpt_if;
	input [2:0] io_dis_uops_0_bits_debug_fsrc;
	input [2:0] io_dis_uops_0_bits_debug_tsrc;
	output wire io_iss_uops_0_valid;
	output wire io_iss_uops_0_bits_is_rvc;
	output wire io_iss_uops_0_bits_fu_code_0;
	output wire io_iss_uops_0_bits_iw_p1_bypass_hint;
	output wire io_iss_uops_0_bits_iw_p2_bypass_hint;
	output wire [7:0] io_iss_uops_0_bits_br_mask;
	output wire [2:0] io_iss_uops_0_bits_br_tag;
	output wire [3:0] io_iss_uops_0_bits_br_type;
	output wire io_iss_uops_0_bits_is_sfb;
	output wire io_iss_uops_0_bits_is_mov;
	output wire [3:0] io_iss_uops_0_bits_ftq_idx;
	output wire io_iss_uops_0_bits_edge_inst;
	output wire [5:0] io_iss_uops_0_bits_pc_lob;
	output wire io_iss_uops_0_bits_taken;
	output wire [2:0] io_iss_uops_0_bits_imm_sel;
	output wire [4:0] io_iss_uops_0_bits_pimm;
	output wire [1:0] io_iss_uops_0_bits_op1_sel;
	output wire [2:0] io_iss_uops_0_bits_op2_sel;
	output wire [4:0] io_iss_uops_0_bits_rob_idx;
	output wire [5:0] io_iss_uops_0_bits_pdst;
	output wire [5:0] io_iss_uops_0_bits_prs1;
	output wire [5:0] io_iss_uops_0_bits_prs2;
	output wire [3:0] io_iss_uops_0_bits_ppred;
	output wire [2:0] io_iss_uops_0_bits_csr_cmd;
	output wire io_iss_uops_0_bits_ldst_is_rs1;
	output wire [1:0] io_iss_uops_0_bits_dst_rtype;
	output wire [1:0] io_iss_uops_0_bits_lrs1_rtype;
	output wire [1:0] io_iss_uops_0_bits_lrs2_rtype;
	output wire io_iss_uops_0_bits_fcn_dw;
	output wire [4:0] io_iss_uops_0_bits_fcn_op;
	input io_wakeup_ports_0_valid;
	input [5:0] io_wakeup_ports_0_bits_uop_pdst;
	input io_wakeup_ports_0_bits_bypassable;
	input io_wakeup_ports_0_bits_rebusy;
	input io_wakeup_ports_1_valid;
	input [5:0] io_wakeup_ports_1_bits_uop_pdst;
	input io_wakeup_ports_2_valid;
	input [5:0] io_wakeup_ports_2_bits_uop_pdst;
	input io_pred_wakeup_port_valid;
	input [3:0] io_pred_wakeup_port_bits;
	input io_child_rebusys;
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
	wire _slots_7_io_iss_uop_is_rvc;
	wire _slots_7_io_iss_uop_fu_code_0;
	wire _slots_7_io_iss_uop_iw_p1_bypass_hint;
	wire _slots_7_io_iss_uop_iw_p2_bypass_hint;
	wire [7:0] _slots_7_io_iss_uop_br_mask;
	wire [2:0] _slots_7_io_iss_uop_br_tag;
	wire [3:0] _slots_7_io_iss_uop_br_type;
	wire _slots_7_io_iss_uop_is_sfb;
	wire _slots_7_io_iss_uop_is_mov;
	wire [3:0] _slots_7_io_iss_uop_ftq_idx;
	wire _slots_7_io_iss_uop_edge_inst;
	wire [5:0] _slots_7_io_iss_uop_pc_lob;
	wire _slots_7_io_iss_uop_taken;
	wire [2:0] _slots_7_io_iss_uop_imm_sel;
	wire [4:0] _slots_7_io_iss_uop_pimm;
	wire [1:0] _slots_7_io_iss_uop_op1_sel;
	wire [2:0] _slots_7_io_iss_uop_op2_sel;
	wire [4:0] _slots_7_io_iss_uop_rob_idx;
	wire [5:0] _slots_7_io_iss_uop_pdst;
	wire [5:0] _slots_7_io_iss_uop_prs1;
	wire [5:0] _slots_7_io_iss_uop_prs2;
	wire [3:0] _slots_7_io_iss_uop_ppred;
	wire [2:0] _slots_7_io_iss_uop_csr_cmd;
	wire _slots_7_io_iss_uop_ldst_is_rs1;
	wire [1:0] _slots_7_io_iss_uop_dst_rtype;
	wire [1:0] _slots_7_io_iss_uop_lrs1_rtype;
	wire [1:0] _slots_7_io_iss_uop_lrs2_rtype;
	wire _slots_7_io_iss_uop_fcn_dw;
	wire [4:0] _slots_7_io_iss_uop_fcn_op;
	wire [31:0] _slots_7_io_out_uop_inst;
	wire [31:0] _slots_7_io_out_uop_debug_inst;
	wire _slots_7_io_out_uop_is_rvc;
	wire [39:0] _slots_7_io_out_uop_debug_pc;
	wire _slots_7_io_out_uop_iq_type_0;
	wire _slots_7_io_out_uop_iq_type_1;
	wire _slots_7_io_out_uop_iq_type_2;
	wire _slots_7_io_out_uop_iq_type_3;
	wire _slots_7_io_out_uop_fu_code_0;
	wire _slots_7_io_out_uop_fu_code_1;
	wire _slots_7_io_out_uop_fu_code_2;
	wire _slots_7_io_out_uop_fu_code_3;
	wire _slots_7_io_out_uop_fu_code_4;
	wire _slots_7_io_out_uop_fu_code_5;
	wire _slots_7_io_out_uop_fu_code_6;
	wire _slots_7_io_out_uop_fu_code_7;
	wire _slots_7_io_out_uop_fu_code_8;
	wire _slots_7_io_out_uop_fu_code_9;
	wire _slots_7_io_out_uop_iw_issued;
	wire _slots_7_io_out_uop_iw_p1_speculative_child;
	wire _slots_7_io_out_uop_iw_p2_speculative_child;
	wire _slots_7_io_out_uop_iw_p1_bypass_hint;
	wire _slots_7_io_out_uop_iw_p2_bypass_hint;
	wire _slots_7_io_out_uop_iw_p3_bypass_hint;
	wire _slots_7_io_out_uop_dis_col_sel;
	wire [7:0] _slots_7_io_out_uop_br_mask;
	wire [2:0] _slots_7_io_out_uop_br_tag;
	wire [3:0] _slots_7_io_out_uop_br_type;
	wire _slots_7_io_out_uop_is_sfb;
	wire _slots_7_io_out_uop_is_fence;
	wire _slots_7_io_out_uop_is_fencei;
	wire _slots_7_io_out_uop_is_sfence;
	wire _slots_7_io_out_uop_is_amo;
	wire _slots_7_io_out_uop_is_eret;
	wire _slots_7_io_out_uop_is_sys_pc2epc;
	wire _slots_7_io_out_uop_is_rocc;
	wire _slots_7_io_out_uop_is_mov;
	wire [3:0] _slots_7_io_out_uop_ftq_idx;
	wire _slots_7_io_out_uop_edge_inst;
	wire [5:0] _slots_7_io_out_uop_pc_lob;
	wire _slots_7_io_out_uop_taken;
	wire _slots_7_io_out_uop_imm_rename;
	wire [2:0] _slots_7_io_out_uop_imm_sel;
	wire [4:0] _slots_7_io_out_uop_pimm;
	wire [19:0] _slots_7_io_out_uop_imm_packed;
	wire [1:0] _slots_7_io_out_uop_op1_sel;
	wire [2:0] _slots_7_io_out_uop_op2_sel;
	wire _slots_7_io_out_uop_fp_ctrl_ldst;
	wire _slots_7_io_out_uop_fp_ctrl_wen;
	wire _slots_7_io_out_uop_fp_ctrl_ren1;
	wire _slots_7_io_out_uop_fp_ctrl_ren2;
	wire _slots_7_io_out_uop_fp_ctrl_ren3;
	wire _slots_7_io_out_uop_fp_ctrl_swap12;
	wire _slots_7_io_out_uop_fp_ctrl_swap23;
	wire [1:0] _slots_7_io_out_uop_fp_ctrl_typeTagIn;
	wire [1:0] _slots_7_io_out_uop_fp_ctrl_typeTagOut;
	wire _slots_7_io_out_uop_fp_ctrl_fromint;
	wire _slots_7_io_out_uop_fp_ctrl_toint;
	wire _slots_7_io_out_uop_fp_ctrl_fastpipe;
	wire _slots_7_io_out_uop_fp_ctrl_fma;
	wire _slots_7_io_out_uop_fp_ctrl_div;
	wire _slots_7_io_out_uop_fp_ctrl_sqrt;
	wire _slots_7_io_out_uop_fp_ctrl_wflags;
	wire _slots_7_io_out_uop_fp_ctrl_vec;
	wire [4:0] _slots_7_io_out_uop_rob_idx;
	wire [3:0] _slots_7_io_out_uop_ldq_idx;
	wire [3:0] _slots_7_io_out_uop_stq_idx;
	wire [1:0] _slots_7_io_out_uop_rxq_idx;
	wire [5:0] _slots_7_io_out_uop_pdst;
	wire [5:0] _slots_7_io_out_uop_prs1;
	wire [5:0] _slots_7_io_out_uop_prs2;
	wire [5:0] _slots_7_io_out_uop_prs3;
	wire [3:0] _slots_7_io_out_uop_ppred;
	wire _slots_7_io_out_uop_prs1_busy;
	wire _slots_7_io_out_uop_prs2_busy;
	wire _slots_7_io_out_uop_prs3_busy;
	wire _slots_7_io_out_uop_ppred_busy;
	wire [5:0] _slots_7_io_out_uop_stale_pdst;
	wire _slots_7_io_out_uop_exception;
	wire [63:0] _slots_7_io_out_uop_exc_cause;
	wire [4:0] _slots_7_io_out_uop_mem_cmd;
	wire [1:0] _slots_7_io_out_uop_mem_size;
	wire _slots_7_io_out_uop_mem_signed;
	wire _slots_7_io_out_uop_uses_ldq;
	wire _slots_7_io_out_uop_uses_stq;
	wire _slots_7_io_out_uop_is_unique;
	wire _slots_7_io_out_uop_flush_on_commit;
	wire [2:0] _slots_7_io_out_uop_csr_cmd;
	wire _slots_7_io_out_uop_ldst_is_rs1;
	wire [5:0] _slots_7_io_out_uop_ldst;
	wire [5:0] _slots_7_io_out_uop_lrs1;
	wire [5:0] _slots_7_io_out_uop_lrs2;
	wire [5:0] _slots_7_io_out_uop_lrs3;
	wire [1:0] _slots_7_io_out_uop_dst_rtype;
	wire [1:0] _slots_7_io_out_uop_lrs1_rtype;
	wire [1:0] _slots_7_io_out_uop_lrs2_rtype;
	wire _slots_7_io_out_uop_frs3_en;
	wire _slots_7_io_out_uop_fcn_dw;
	wire [4:0] _slots_7_io_out_uop_fcn_op;
	wire _slots_7_io_out_uop_fp_val;
	wire _slots_7_io_out_uop_xcpt_pf_if;
	wire _slots_7_io_out_uop_xcpt_ae_if;
	wire _slots_7_io_out_uop_xcpt_ma_if;
	wire _slots_7_io_out_uop_bp_debug_if;
	wire _slots_7_io_out_uop_bp_xcpt_if;
	wire [2:0] _slots_7_io_out_uop_debug_fsrc;
	wire [2:0] _slots_7_io_out_uop_debug_tsrc;
	wire _slots_6_io_valid;
	wire _slots_6_io_will_be_valid;
	wire _slots_6_io_request;
	wire _slots_6_io_iss_uop_is_rvc;
	wire _slots_6_io_iss_uop_fu_code_0;
	wire _slots_6_io_iss_uop_iw_p1_bypass_hint;
	wire _slots_6_io_iss_uop_iw_p2_bypass_hint;
	wire [7:0] _slots_6_io_iss_uop_br_mask;
	wire [2:0] _slots_6_io_iss_uop_br_tag;
	wire [3:0] _slots_6_io_iss_uop_br_type;
	wire _slots_6_io_iss_uop_is_sfb;
	wire _slots_6_io_iss_uop_is_mov;
	wire [3:0] _slots_6_io_iss_uop_ftq_idx;
	wire _slots_6_io_iss_uop_edge_inst;
	wire [5:0] _slots_6_io_iss_uop_pc_lob;
	wire _slots_6_io_iss_uop_taken;
	wire [2:0] _slots_6_io_iss_uop_imm_sel;
	wire [4:0] _slots_6_io_iss_uop_pimm;
	wire [1:0] _slots_6_io_iss_uop_op1_sel;
	wire [2:0] _slots_6_io_iss_uop_op2_sel;
	wire [4:0] _slots_6_io_iss_uop_rob_idx;
	wire [5:0] _slots_6_io_iss_uop_pdst;
	wire [5:0] _slots_6_io_iss_uop_prs1;
	wire [5:0] _slots_6_io_iss_uop_prs2;
	wire [3:0] _slots_6_io_iss_uop_ppred;
	wire [2:0] _slots_6_io_iss_uop_csr_cmd;
	wire _slots_6_io_iss_uop_ldst_is_rs1;
	wire [1:0] _slots_6_io_iss_uop_dst_rtype;
	wire [1:0] _slots_6_io_iss_uop_lrs1_rtype;
	wire [1:0] _slots_6_io_iss_uop_lrs2_rtype;
	wire _slots_6_io_iss_uop_fcn_dw;
	wire [4:0] _slots_6_io_iss_uop_fcn_op;
	wire [31:0] _slots_6_io_out_uop_inst;
	wire [31:0] _slots_6_io_out_uop_debug_inst;
	wire _slots_6_io_out_uop_is_rvc;
	wire [39:0] _slots_6_io_out_uop_debug_pc;
	wire _slots_6_io_out_uop_iq_type_0;
	wire _slots_6_io_out_uop_iq_type_1;
	wire _slots_6_io_out_uop_iq_type_2;
	wire _slots_6_io_out_uop_iq_type_3;
	wire _slots_6_io_out_uop_fu_code_0;
	wire _slots_6_io_out_uop_fu_code_1;
	wire _slots_6_io_out_uop_fu_code_2;
	wire _slots_6_io_out_uop_fu_code_3;
	wire _slots_6_io_out_uop_fu_code_4;
	wire _slots_6_io_out_uop_fu_code_5;
	wire _slots_6_io_out_uop_fu_code_6;
	wire _slots_6_io_out_uop_fu_code_7;
	wire _slots_6_io_out_uop_fu_code_8;
	wire _slots_6_io_out_uop_fu_code_9;
	wire _slots_6_io_out_uop_iw_issued;
	wire _slots_6_io_out_uop_iw_p1_speculative_child;
	wire _slots_6_io_out_uop_iw_p2_speculative_child;
	wire _slots_6_io_out_uop_iw_p1_bypass_hint;
	wire _slots_6_io_out_uop_iw_p2_bypass_hint;
	wire _slots_6_io_out_uop_iw_p3_bypass_hint;
	wire _slots_6_io_out_uop_dis_col_sel;
	wire [7:0] _slots_6_io_out_uop_br_mask;
	wire [2:0] _slots_6_io_out_uop_br_tag;
	wire [3:0] _slots_6_io_out_uop_br_type;
	wire _slots_6_io_out_uop_is_sfb;
	wire _slots_6_io_out_uop_is_fence;
	wire _slots_6_io_out_uop_is_fencei;
	wire _slots_6_io_out_uop_is_sfence;
	wire _slots_6_io_out_uop_is_amo;
	wire _slots_6_io_out_uop_is_eret;
	wire _slots_6_io_out_uop_is_sys_pc2epc;
	wire _slots_6_io_out_uop_is_rocc;
	wire _slots_6_io_out_uop_is_mov;
	wire [3:0] _slots_6_io_out_uop_ftq_idx;
	wire _slots_6_io_out_uop_edge_inst;
	wire [5:0] _slots_6_io_out_uop_pc_lob;
	wire _slots_6_io_out_uop_taken;
	wire _slots_6_io_out_uop_imm_rename;
	wire [2:0] _slots_6_io_out_uop_imm_sel;
	wire [4:0] _slots_6_io_out_uop_pimm;
	wire [19:0] _slots_6_io_out_uop_imm_packed;
	wire [1:0] _slots_6_io_out_uop_op1_sel;
	wire [2:0] _slots_6_io_out_uop_op2_sel;
	wire _slots_6_io_out_uop_fp_ctrl_ldst;
	wire _slots_6_io_out_uop_fp_ctrl_wen;
	wire _slots_6_io_out_uop_fp_ctrl_ren1;
	wire _slots_6_io_out_uop_fp_ctrl_ren2;
	wire _slots_6_io_out_uop_fp_ctrl_ren3;
	wire _slots_6_io_out_uop_fp_ctrl_swap12;
	wire _slots_6_io_out_uop_fp_ctrl_swap23;
	wire [1:0] _slots_6_io_out_uop_fp_ctrl_typeTagIn;
	wire [1:0] _slots_6_io_out_uop_fp_ctrl_typeTagOut;
	wire _slots_6_io_out_uop_fp_ctrl_fromint;
	wire _slots_6_io_out_uop_fp_ctrl_toint;
	wire _slots_6_io_out_uop_fp_ctrl_fastpipe;
	wire _slots_6_io_out_uop_fp_ctrl_fma;
	wire _slots_6_io_out_uop_fp_ctrl_div;
	wire _slots_6_io_out_uop_fp_ctrl_sqrt;
	wire _slots_6_io_out_uop_fp_ctrl_wflags;
	wire _slots_6_io_out_uop_fp_ctrl_vec;
	wire [4:0] _slots_6_io_out_uop_rob_idx;
	wire [3:0] _slots_6_io_out_uop_ldq_idx;
	wire [3:0] _slots_6_io_out_uop_stq_idx;
	wire [1:0] _slots_6_io_out_uop_rxq_idx;
	wire [5:0] _slots_6_io_out_uop_pdst;
	wire [5:0] _slots_6_io_out_uop_prs1;
	wire [5:0] _slots_6_io_out_uop_prs2;
	wire [5:0] _slots_6_io_out_uop_prs3;
	wire [3:0] _slots_6_io_out_uop_ppred;
	wire _slots_6_io_out_uop_prs1_busy;
	wire _slots_6_io_out_uop_prs2_busy;
	wire _slots_6_io_out_uop_prs3_busy;
	wire _slots_6_io_out_uop_ppred_busy;
	wire [5:0] _slots_6_io_out_uop_stale_pdst;
	wire _slots_6_io_out_uop_exception;
	wire [63:0] _slots_6_io_out_uop_exc_cause;
	wire [4:0] _slots_6_io_out_uop_mem_cmd;
	wire [1:0] _slots_6_io_out_uop_mem_size;
	wire _slots_6_io_out_uop_mem_signed;
	wire _slots_6_io_out_uop_uses_ldq;
	wire _slots_6_io_out_uop_uses_stq;
	wire _slots_6_io_out_uop_is_unique;
	wire _slots_6_io_out_uop_flush_on_commit;
	wire [2:0] _slots_6_io_out_uop_csr_cmd;
	wire _slots_6_io_out_uop_ldst_is_rs1;
	wire [5:0] _slots_6_io_out_uop_ldst;
	wire [5:0] _slots_6_io_out_uop_lrs1;
	wire [5:0] _slots_6_io_out_uop_lrs2;
	wire [5:0] _slots_6_io_out_uop_lrs3;
	wire [1:0] _slots_6_io_out_uop_dst_rtype;
	wire [1:0] _slots_6_io_out_uop_lrs1_rtype;
	wire [1:0] _slots_6_io_out_uop_lrs2_rtype;
	wire _slots_6_io_out_uop_frs3_en;
	wire _slots_6_io_out_uop_fcn_dw;
	wire [4:0] _slots_6_io_out_uop_fcn_op;
	wire _slots_6_io_out_uop_fp_val;
	wire _slots_6_io_out_uop_xcpt_pf_if;
	wire _slots_6_io_out_uop_xcpt_ae_if;
	wire _slots_6_io_out_uop_xcpt_ma_if;
	wire _slots_6_io_out_uop_bp_debug_if;
	wire _slots_6_io_out_uop_bp_xcpt_if;
	wire [2:0] _slots_6_io_out_uop_debug_fsrc;
	wire [2:0] _slots_6_io_out_uop_debug_tsrc;
	wire _slots_5_io_valid;
	wire _slots_5_io_will_be_valid;
	wire _slots_5_io_request;
	wire _slots_5_io_iss_uop_is_rvc;
	wire _slots_5_io_iss_uop_fu_code_0;
	wire _slots_5_io_iss_uop_iw_p1_bypass_hint;
	wire _slots_5_io_iss_uop_iw_p2_bypass_hint;
	wire [7:0] _slots_5_io_iss_uop_br_mask;
	wire [2:0] _slots_5_io_iss_uop_br_tag;
	wire [3:0] _slots_5_io_iss_uop_br_type;
	wire _slots_5_io_iss_uop_is_sfb;
	wire _slots_5_io_iss_uop_is_mov;
	wire [3:0] _slots_5_io_iss_uop_ftq_idx;
	wire _slots_5_io_iss_uop_edge_inst;
	wire [5:0] _slots_5_io_iss_uop_pc_lob;
	wire _slots_5_io_iss_uop_taken;
	wire [2:0] _slots_5_io_iss_uop_imm_sel;
	wire [4:0] _slots_5_io_iss_uop_pimm;
	wire [1:0] _slots_5_io_iss_uop_op1_sel;
	wire [2:0] _slots_5_io_iss_uop_op2_sel;
	wire [4:0] _slots_5_io_iss_uop_rob_idx;
	wire [5:0] _slots_5_io_iss_uop_pdst;
	wire [5:0] _slots_5_io_iss_uop_prs1;
	wire [5:0] _slots_5_io_iss_uop_prs2;
	wire [3:0] _slots_5_io_iss_uop_ppred;
	wire [2:0] _slots_5_io_iss_uop_csr_cmd;
	wire _slots_5_io_iss_uop_ldst_is_rs1;
	wire [1:0] _slots_5_io_iss_uop_dst_rtype;
	wire [1:0] _slots_5_io_iss_uop_lrs1_rtype;
	wire [1:0] _slots_5_io_iss_uop_lrs2_rtype;
	wire _slots_5_io_iss_uop_fcn_dw;
	wire [4:0] _slots_5_io_iss_uop_fcn_op;
	wire [31:0] _slots_5_io_out_uop_inst;
	wire [31:0] _slots_5_io_out_uop_debug_inst;
	wire _slots_5_io_out_uop_is_rvc;
	wire [39:0] _slots_5_io_out_uop_debug_pc;
	wire _slots_5_io_out_uop_iq_type_0;
	wire _slots_5_io_out_uop_iq_type_1;
	wire _slots_5_io_out_uop_iq_type_2;
	wire _slots_5_io_out_uop_iq_type_3;
	wire _slots_5_io_out_uop_fu_code_0;
	wire _slots_5_io_out_uop_fu_code_1;
	wire _slots_5_io_out_uop_fu_code_2;
	wire _slots_5_io_out_uop_fu_code_3;
	wire _slots_5_io_out_uop_fu_code_4;
	wire _slots_5_io_out_uop_fu_code_5;
	wire _slots_5_io_out_uop_fu_code_6;
	wire _slots_5_io_out_uop_fu_code_7;
	wire _slots_5_io_out_uop_fu_code_8;
	wire _slots_5_io_out_uop_fu_code_9;
	wire _slots_5_io_out_uop_iw_issued;
	wire _slots_5_io_out_uop_iw_p1_speculative_child;
	wire _slots_5_io_out_uop_iw_p2_speculative_child;
	wire _slots_5_io_out_uop_iw_p1_bypass_hint;
	wire _slots_5_io_out_uop_iw_p2_bypass_hint;
	wire _slots_5_io_out_uop_iw_p3_bypass_hint;
	wire _slots_5_io_out_uop_dis_col_sel;
	wire [7:0] _slots_5_io_out_uop_br_mask;
	wire [2:0] _slots_5_io_out_uop_br_tag;
	wire [3:0] _slots_5_io_out_uop_br_type;
	wire _slots_5_io_out_uop_is_sfb;
	wire _slots_5_io_out_uop_is_fence;
	wire _slots_5_io_out_uop_is_fencei;
	wire _slots_5_io_out_uop_is_sfence;
	wire _slots_5_io_out_uop_is_amo;
	wire _slots_5_io_out_uop_is_eret;
	wire _slots_5_io_out_uop_is_sys_pc2epc;
	wire _slots_5_io_out_uop_is_rocc;
	wire _slots_5_io_out_uop_is_mov;
	wire [3:0] _slots_5_io_out_uop_ftq_idx;
	wire _slots_5_io_out_uop_edge_inst;
	wire [5:0] _slots_5_io_out_uop_pc_lob;
	wire _slots_5_io_out_uop_taken;
	wire _slots_5_io_out_uop_imm_rename;
	wire [2:0] _slots_5_io_out_uop_imm_sel;
	wire [4:0] _slots_5_io_out_uop_pimm;
	wire [19:0] _slots_5_io_out_uop_imm_packed;
	wire [1:0] _slots_5_io_out_uop_op1_sel;
	wire [2:0] _slots_5_io_out_uop_op2_sel;
	wire _slots_5_io_out_uop_fp_ctrl_ldst;
	wire _slots_5_io_out_uop_fp_ctrl_wen;
	wire _slots_5_io_out_uop_fp_ctrl_ren1;
	wire _slots_5_io_out_uop_fp_ctrl_ren2;
	wire _slots_5_io_out_uop_fp_ctrl_ren3;
	wire _slots_5_io_out_uop_fp_ctrl_swap12;
	wire _slots_5_io_out_uop_fp_ctrl_swap23;
	wire [1:0] _slots_5_io_out_uop_fp_ctrl_typeTagIn;
	wire [1:0] _slots_5_io_out_uop_fp_ctrl_typeTagOut;
	wire _slots_5_io_out_uop_fp_ctrl_fromint;
	wire _slots_5_io_out_uop_fp_ctrl_toint;
	wire _slots_5_io_out_uop_fp_ctrl_fastpipe;
	wire _slots_5_io_out_uop_fp_ctrl_fma;
	wire _slots_5_io_out_uop_fp_ctrl_div;
	wire _slots_5_io_out_uop_fp_ctrl_sqrt;
	wire _slots_5_io_out_uop_fp_ctrl_wflags;
	wire _slots_5_io_out_uop_fp_ctrl_vec;
	wire [4:0] _slots_5_io_out_uop_rob_idx;
	wire [3:0] _slots_5_io_out_uop_ldq_idx;
	wire [3:0] _slots_5_io_out_uop_stq_idx;
	wire [1:0] _slots_5_io_out_uop_rxq_idx;
	wire [5:0] _slots_5_io_out_uop_pdst;
	wire [5:0] _slots_5_io_out_uop_prs1;
	wire [5:0] _slots_5_io_out_uop_prs2;
	wire [5:0] _slots_5_io_out_uop_prs3;
	wire [3:0] _slots_5_io_out_uop_ppred;
	wire _slots_5_io_out_uop_prs1_busy;
	wire _slots_5_io_out_uop_prs2_busy;
	wire _slots_5_io_out_uop_prs3_busy;
	wire _slots_5_io_out_uop_ppred_busy;
	wire [5:0] _slots_5_io_out_uop_stale_pdst;
	wire _slots_5_io_out_uop_exception;
	wire [63:0] _slots_5_io_out_uop_exc_cause;
	wire [4:0] _slots_5_io_out_uop_mem_cmd;
	wire [1:0] _slots_5_io_out_uop_mem_size;
	wire _slots_5_io_out_uop_mem_signed;
	wire _slots_5_io_out_uop_uses_ldq;
	wire _slots_5_io_out_uop_uses_stq;
	wire _slots_5_io_out_uop_is_unique;
	wire _slots_5_io_out_uop_flush_on_commit;
	wire [2:0] _slots_5_io_out_uop_csr_cmd;
	wire _slots_5_io_out_uop_ldst_is_rs1;
	wire [5:0] _slots_5_io_out_uop_ldst;
	wire [5:0] _slots_5_io_out_uop_lrs1;
	wire [5:0] _slots_5_io_out_uop_lrs2;
	wire [5:0] _slots_5_io_out_uop_lrs3;
	wire [1:0] _slots_5_io_out_uop_dst_rtype;
	wire [1:0] _slots_5_io_out_uop_lrs1_rtype;
	wire [1:0] _slots_5_io_out_uop_lrs2_rtype;
	wire _slots_5_io_out_uop_frs3_en;
	wire _slots_5_io_out_uop_fcn_dw;
	wire [4:0] _slots_5_io_out_uop_fcn_op;
	wire _slots_5_io_out_uop_fp_val;
	wire _slots_5_io_out_uop_xcpt_pf_if;
	wire _slots_5_io_out_uop_xcpt_ae_if;
	wire _slots_5_io_out_uop_xcpt_ma_if;
	wire _slots_5_io_out_uop_bp_debug_if;
	wire _slots_5_io_out_uop_bp_xcpt_if;
	wire [2:0] _slots_5_io_out_uop_debug_fsrc;
	wire [2:0] _slots_5_io_out_uop_debug_tsrc;
	wire _slots_4_io_valid;
	wire _slots_4_io_will_be_valid;
	wire _slots_4_io_request;
	wire _slots_4_io_iss_uop_is_rvc;
	wire _slots_4_io_iss_uop_fu_code_0;
	wire _slots_4_io_iss_uop_iw_p1_bypass_hint;
	wire _slots_4_io_iss_uop_iw_p2_bypass_hint;
	wire [7:0] _slots_4_io_iss_uop_br_mask;
	wire [2:0] _slots_4_io_iss_uop_br_tag;
	wire [3:0] _slots_4_io_iss_uop_br_type;
	wire _slots_4_io_iss_uop_is_sfb;
	wire _slots_4_io_iss_uop_is_mov;
	wire [3:0] _slots_4_io_iss_uop_ftq_idx;
	wire _slots_4_io_iss_uop_edge_inst;
	wire [5:0] _slots_4_io_iss_uop_pc_lob;
	wire _slots_4_io_iss_uop_taken;
	wire [2:0] _slots_4_io_iss_uop_imm_sel;
	wire [4:0] _slots_4_io_iss_uop_pimm;
	wire [1:0] _slots_4_io_iss_uop_op1_sel;
	wire [2:0] _slots_4_io_iss_uop_op2_sel;
	wire [4:0] _slots_4_io_iss_uop_rob_idx;
	wire [5:0] _slots_4_io_iss_uop_pdst;
	wire [5:0] _slots_4_io_iss_uop_prs1;
	wire [5:0] _slots_4_io_iss_uop_prs2;
	wire [3:0] _slots_4_io_iss_uop_ppred;
	wire [2:0] _slots_4_io_iss_uop_csr_cmd;
	wire _slots_4_io_iss_uop_ldst_is_rs1;
	wire [1:0] _slots_4_io_iss_uop_dst_rtype;
	wire [1:0] _slots_4_io_iss_uop_lrs1_rtype;
	wire [1:0] _slots_4_io_iss_uop_lrs2_rtype;
	wire _slots_4_io_iss_uop_fcn_dw;
	wire [4:0] _slots_4_io_iss_uop_fcn_op;
	wire [31:0] _slots_4_io_out_uop_inst;
	wire [31:0] _slots_4_io_out_uop_debug_inst;
	wire _slots_4_io_out_uop_is_rvc;
	wire [39:0] _slots_4_io_out_uop_debug_pc;
	wire _slots_4_io_out_uop_iq_type_0;
	wire _slots_4_io_out_uop_iq_type_1;
	wire _slots_4_io_out_uop_iq_type_2;
	wire _slots_4_io_out_uop_iq_type_3;
	wire _slots_4_io_out_uop_fu_code_0;
	wire _slots_4_io_out_uop_fu_code_1;
	wire _slots_4_io_out_uop_fu_code_2;
	wire _slots_4_io_out_uop_fu_code_3;
	wire _slots_4_io_out_uop_fu_code_4;
	wire _slots_4_io_out_uop_fu_code_5;
	wire _slots_4_io_out_uop_fu_code_6;
	wire _slots_4_io_out_uop_fu_code_7;
	wire _slots_4_io_out_uop_fu_code_8;
	wire _slots_4_io_out_uop_fu_code_9;
	wire _slots_4_io_out_uop_iw_issued;
	wire _slots_4_io_out_uop_iw_p1_speculative_child;
	wire _slots_4_io_out_uop_iw_p2_speculative_child;
	wire _slots_4_io_out_uop_iw_p1_bypass_hint;
	wire _slots_4_io_out_uop_iw_p2_bypass_hint;
	wire _slots_4_io_out_uop_iw_p3_bypass_hint;
	wire _slots_4_io_out_uop_dis_col_sel;
	wire [7:0] _slots_4_io_out_uop_br_mask;
	wire [2:0] _slots_4_io_out_uop_br_tag;
	wire [3:0] _slots_4_io_out_uop_br_type;
	wire _slots_4_io_out_uop_is_sfb;
	wire _slots_4_io_out_uop_is_fence;
	wire _slots_4_io_out_uop_is_fencei;
	wire _slots_4_io_out_uop_is_sfence;
	wire _slots_4_io_out_uop_is_amo;
	wire _slots_4_io_out_uop_is_eret;
	wire _slots_4_io_out_uop_is_sys_pc2epc;
	wire _slots_4_io_out_uop_is_rocc;
	wire _slots_4_io_out_uop_is_mov;
	wire [3:0] _slots_4_io_out_uop_ftq_idx;
	wire _slots_4_io_out_uop_edge_inst;
	wire [5:0] _slots_4_io_out_uop_pc_lob;
	wire _slots_4_io_out_uop_taken;
	wire _slots_4_io_out_uop_imm_rename;
	wire [2:0] _slots_4_io_out_uop_imm_sel;
	wire [4:0] _slots_4_io_out_uop_pimm;
	wire [19:0] _slots_4_io_out_uop_imm_packed;
	wire [1:0] _slots_4_io_out_uop_op1_sel;
	wire [2:0] _slots_4_io_out_uop_op2_sel;
	wire _slots_4_io_out_uop_fp_ctrl_ldst;
	wire _slots_4_io_out_uop_fp_ctrl_wen;
	wire _slots_4_io_out_uop_fp_ctrl_ren1;
	wire _slots_4_io_out_uop_fp_ctrl_ren2;
	wire _slots_4_io_out_uop_fp_ctrl_ren3;
	wire _slots_4_io_out_uop_fp_ctrl_swap12;
	wire _slots_4_io_out_uop_fp_ctrl_swap23;
	wire [1:0] _slots_4_io_out_uop_fp_ctrl_typeTagIn;
	wire [1:0] _slots_4_io_out_uop_fp_ctrl_typeTagOut;
	wire _slots_4_io_out_uop_fp_ctrl_fromint;
	wire _slots_4_io_out_uop_fp_ctrl_toint;
	wire _slots_4_io_out_uop_fp_ctrl_fastpipe;
	wire _slots_4_io_out_uop_fp_ctrl_fma;
	wire _slots_4_io_out_uop_fp_ctrl_div;
	wire _slots_4_io_out_uop_fp_ctrl_sqrt;
	wire _slots_4_io_out_uop_fp_ctrl_wflags;
	wire _slots_4_io_out_uop_fp_ctrl_vec;
	wire [4:0] _slots_4_io_out_uop_rob_idx;
	wire [3:0] _slots_4_io_out_uop_ldq_idx;
	wire [3:0] _slots_4_io_out_uop_stq_idx;
	wire [1:0] _slots_4_io_out_uop_rxq_idx;
	wire [5:0] _slots_4_io_out_uop_pdst;
	wire [5:0] _slots_4_io_out_uop_prs1;
	wire [5:0] _slots_4_io_out_uop_prs2;
	wire [5:0] _slots_4_io_out_uop_prs3;
	wire [3:0] _slots_4_io_out_uop_ppred;
	wire _slots_4_io_out_uop_prs1_busy;
	wire _slots_4_io_out_uop_prs2_busy;
	wire _slots_4_io_out_uop_prs3_busy;
	wire _slots_4_io_out_uop_ppred_busy;
	wire [5:0] _slots_4_io_out_uop_stale_pdst;
	wire _slots_4_io_out_uop_exception;
	wire [63:0] _slots_4_io_out_uop_exc_cause;
	wire [4:0] _slots_4_io_out_uop_mem_cmd;
	wire [1:0] _slots_4_io_out_uop_mem_size;
	wire _slots_4_io_out_uop_mem_signed;
	wire _slots_4_io_out_uop_uses_ldq;
	wire _slots_4_io_out_uop_uses_stq;
	wire _slots_4_io_out_uop_is_unique;
	wire _slots_4_io_out_uop_flush_on_commit;
	wire [2:0] _slots_4_io_out_uop_csr_cmd;
	wire _slots_4_io_out_uop_ldst_is_rs1;
	wire [5:0] _slots_4_io_out_uop_ldst;
	wire [5:0] _slots_4_io_out_uop_lrs1;
	wire [5:0] _slots_4_io_out_uop_lrs2;
	wire [5:0] _slots_4_io_out_uop_lrs3;
	wire [1:0] _slots_4_io_out_uop_dst_rtype;
	wire [1:0] _slots_4_io_out_uop_lrs1_rtype;
	wire [1:0] _slots_4_io_out_uop_lrs2_rtype;
	wire _slots_4_io_out_uop_frs3_en;
	wire _slots_4_io_out_uop_fcn_dw;
	wire [4:0] _slots_4_io_out_uop_fcn_op;
	wire _slots_4_io_out_uop_fp_val;
	wire _slots_4_io_out_uop_xcpt_pf_if;
	wire _slots_4_io_out_uop_xcpt_ae_if;
	wire _slots_4_io_out_uop_xcpt_ma_if;
	wire _slots_4_io_out_uop_bp_debug_if;
	wire _slots_4_io_out_uop_bp_xcpt_if;
	wire [2:0] _slots_4_io_out_uop_debug_fsrc;
	wire [2:0] _slots_4_io_out_uop_debug_tsrc;
	wire _slots_3_io_valid;
	wire _slots_3_io_will_be_valid;
	wire _slots_3_io_request;
	wire _slots_3_io_iss_uop_is_rvc;
	wire _slots_3_io_iss_uop_fu_code_0;
	wire _slots_3_io_iss_uop_iw_p1_bypass_hint;
	wire _slots_3_io_iss_uop_iw_p2_bypass_hint;
	wire [7:0] _slots_3_io_iss_uop_br_mask;
	wire [2:0] _slots_3_io_iss_uop_br_tag;
	wire [3:0] _slots_3_io_iss_uop_br_type;
	wire _slots_3_io_iss_uop_is_sfb;
	wire _slots_3_io_iss_uop_is_mov;
	wire [3:0] _slots_3_io_iss_uop_ftq_idx;
	wire _slots_3_io_iss_uop_edge_inst;
	wire [5:0] _slots_3_io_iss_uop_pc_lob;
	wire _slots_3_io_iss_uop_taken;
	wire [2:0] _slots_3_io_iss_uop_imm_sel;
	wire [4:0] _slots_3_io_iss_uop_pimm;
	wire [1:0] _slots_3_io_iss_uop_op1_sel;
	wire [2:0] _slots_3_io_iss_uop_op2_sel;
	wire [4:0] _slots_3_io_iss_uop_rob_idx;
	wire [5:0] _slots_3_io_iss_uop_pdst;
	wire [5:0] _slots_3_io_iss_uop_prs1;
	wire [5:0] _slots_3_io_iss_uop_prs2;
	wire [3:0] _slots_3_io_iss_uop_ppred;
	wire [2:0] _slots_3_io_iss_uop_csr_cmd;
	wire _slots_3_io_iss_uop_ldst_is_rs1;
	wire [1:0] _slots_3_io_iss_uop_dst_rtype;
	wire [1:0] _slots_3_io_iss_uop_lrs1_rtype;
	wire [1:0] _slots_3_io_iss_uop_lrs2_rtype;
	wire _slots_3_io_iss_uop_fcn_dw;
	wire [4:0] _slots_3_io_iss_uop_fcn_op;
	wire [31:0] _slots_3_io_out_uop_inst;
	wire [31:0] _slots_3_io_out_uop_debug_inst;
	wire _slots_3_io_out_uop_is_rvc;
	wire [39:0] _slots_3_io_out_uop_debug_pc;
	wire _slots_3_io_out_uop_iq_type_0;
	wire _slots_3_io_out_uop_iq_type_1;
	wire _slots_3_io_out_uop_iq_type_2;
	wire _slots_3_io_out_uop_iq_type_3;
	wire _slots_3_io_out_uop_fu_code_0;
	wire _slots_3_io_out_uop_fu_code_1;
	wire _slots_3_io_out_uop_fu_code_2;
	wire _slots_3_io_out_uop_fu_code_3;
	wire _slots_3_io_out_uop_fu_code_4;
	wire _slots_3_io_out_uop_fu_code_5;
	wire _slots_3_io_out_uop_fu_code_6;
	wire _slots_3_io_out_uop_fu_code_7;
	wire _slots_3_io_out_uop_fu_code_8;
	wire _slots_3_io_out_uop_fu_code_9;
	wire _slots_3_io_out_uop_iw_issued;
	wire _slots_3_io_out_uop_iw_p1_speculative_child;
	wire _slots_3_io_out_uop_iw_p2_speculative_child;
	wire _slots_3_io_out_uop_iw_p1_bypass_hint;
	wire _slots_3_io_out_uop_iw_p2_bypass_hint;
	wire _slots_3_io_out_uop_iw_p3_bypass_hint;
	wire _slots_3_io_out_uop_dis_col_sel;
	wire [7:0] _slots_3_io_out_uop_br_mask;
	wire [2:0] _slots_3_io_out_uop_br_tag;
	wire [3:0] _slots_3_io_out_uop_br_type;
	wire _slots_3_io_out_uop_is_sfb;
	wire _slots_3_io_out_uop_is_fence;
	wire _slots_3_io_out_uop_is_fencei;
	wire _slots_3_io_out_uop_is_sfence;
	wire _slots_3_io_out_uop_is_amo;
	wire _slots_3_io_out_uop_is_eret;
	wire _slots_3_io_out_uop_is_sys_pc2epc;
	wire _slots_3_io_out_uop_is_rocc;
	wire _slots_3_io_out_uop_is_mov;
	wire [3:0] _slots_3_io_out_uop_ftq_idx;
	wire _slots_3_io_out_uop_edge_inst;
	wire [5:0] _slots_3_io_out_uop_pc_lob;
	wire _slots_3_io_out_uop_taken;
	wire _slots_3_io_out_uop_imm_rename;
	wire [2:0] _slots_3_io_out_uop_imm_sel;
	wire [4:0] _slots_3_io_out_uop_pimm;
	wire [19:0] _slots_3_io_out_uop_imm_packed;
	wire [1:0] _slots_3_io_out_uop_op1_sel;
	wire [2:0] _slots_3_io_out_uop_op2_sel;
	wire _slots_3_io_out_uop_fp_ctrl_ldst;
	wire _slots_3_io_out_uop_fp_ctrl_wen;
	wire _slots_3_io_out_uop_fp_ctrl_ren1;
	wire _slots_3_io_out_uop_fp_ctrl_ren2;
	wire _slots_3_io_out_uop_fp_ctrl_ren3;
	wire _slots_3_io_out_uop_fp_ctrl_swap12;
	wire _slots_3_io_out_uop_fp_ctrl_swap23;
	wire [1:0] _slots_3_io_out_uop_fp_ctrl_typeTagIn;
	wire [1:0] _slots_3_io_out_uop_fp_ctrl_typeTagOut;
	wire _slots_3_io_out_uop_fp_ctrl_fromint;
	wire _slots_3_io_out_uop_fp_ctrl_toint;
	wire _slots_3_io_out_uop_fp_ctrl_fastpipe;
	wire _slots_3_io_out_uop_fp_ctrl_fma;
	wire _slots_3_io_out_uop_fp_ctrl_div;
	wire _slots_3_io_out_uop_fp_ctrl_sqrt;
	wire _slots_3_io_out_uop_fp_ctrl_wflags;
	wire _slots_3_io_out_uop_fp_ctrl_vec;
	wire [4:0] _slots_3_io_out_uop_rob_idx;
	wire [3:0] _slots_3_io_out_uop_ldq_idx;
	wire [3:0] _slots_3_io_out_uop_stq_idx;
	wire [1:0] _slots_3_io_out_uop_rxq_idx;
	wire [5:0] _slots_3_io_out_uop_pdst;
	wire [5:0] _slots_3_io_out_uop_prs1;
	wire [5:0] _slots_3_io_out_uop_prs2;
	wire [5:0] _slots_3_io_out_uop_prs3;
	wire [3:0] _slots_3_io_out_uop_ppred;
	wire _slots_3_io_out_uop_prs1_busy;
	wire _slots_3_io_out_uop_prs2_busy;
	wire _slots_3_io_out_uop_prs3_busy;
	wire _slots_3_io_out_uop_ppred_busy;
	wire [5:0] _slots_3_io_out_uop_stale_pdst;
	wire _slots_3_io_out_uop_exception;
	wire [63:0] _slots_3_io_out_uop_exc_cause;
	wire [4:0] _slots_3_io_out_uop_mem_cmd;
	wire [1:0] _slots_3_io_out_uop_mem_size;
	wire _slots_3_io_out_uop_mem_signed;
	wire _slots_3_io_out_uop_uses_ldq;
	wire _slots_3_io_out_uop_uses_stq;
	wire _slots_3_io_out_uop_is_unique;
	wire _slots_3_io_out_uop_flush_on_commit;
	wire [2:0] _slots_3_io_out_uop_csr_cmd;
	wire _slots_3_io_out_uop_ldst_is_rs1;
	wire [5:0] _slots_3_io_out_uop_ldst;
	wire [5:0] _slots_3_io_out_uop_lrs1;
	wire [5:0] _slots_3_io_out_uop_lrs2;
	wire [5:0] _slots_3_io_out_uop_lrs3;
	wire [1:0] _slots_3_io_out_uop_dst_rtype;
	wire [1:0] _slots_3_io_out_uop_lrs1_rtype;
	wire [1:0] _slots_3_io_out_uop_lrs2_rtype;
	wire _slots_3_io_out_uop_frs3_en;
	wire _slots_3_io_out_uop_fcn_dw;
	wire [4:0] _slots_3_io_out_uop_fcn_op;
	wire _slots_3_io_out_uop_fp_val;
	wire _slots_3_io_out_uop_xcpt_pf_if;
	wire _slots_3_io_out_uop_xcpt_ae_if;
	wire _slots_3_io_out_uop_xcpt_ma_if;
	wire _slots_3_io_out_uop_bp_debug_if;
	wire _slots_3_io_out_uop_bp_xcpt_if;
	wire [2:0] _slots_3_io_out_uop_debug_fsrc;
	wire [2:0] _slots_3_io_out_uop_debug_tsrc;
	wire _slots_2_io_valid;
	wire _slots_2_io_will_be_valid;
	wire _slots_2_io_request;
	wire _slots_2_io_iss_uop_is_rvc;
	wire _slots_2_io_iss_uop_fu_code_0;
	wire _slots_2_io_iss_uop_iw_p1_bypass_hint;
	wire _slots_2_io_iss_uop_iw_p2_bypass_hint;
	wire [7:0] _slots_2_io_iss_uop_br_mask;
	wire [2:0] _slots_2_io_iss_uop_br_tag;
	wire [3:0] _slots_2_io_iss_uop_br_type;
	wire _slots_2_io_iss_uop_is_sfb;
	wire _slots_2_io_iss_uop_is_mov;
	wire [3:0] _slots_2_io_iss_uop_ftq_idx;
	wire _slots_2_io_iss_uop_edge_inst;
	wire [5:0] _slots_2_io_iss_uop_pc_lob;
	wire _slots_2_io_iss_uop_taken;
	wire [2:0] _slots_2_io_iss_uop_imm_sel;
	wire [4:0] _slots_2_io_iss_uop_pimm;
	wire [1:0] _slots_2_io_iss_uop_op1_sel;
	wire [2:0] _slots_2_io_iss_uop_op2_sel;
	wire [4:0] _slots_2_io_iss_uop_rob_idx;
	wire [5:0] _slots_2_io_iss_uop_pdst;
	wire [5:0] _slots_2_io_iss_uop_prs1;
	wire [5:0] _slots_2_io_iss_uop_prs2;
	wire [3:0] _slots_2_io_iss_uop_ppred;
	wire [2:0] _slots_2_io_iss_uop_csr_cmd;
	wire _slots_2_io_iss_uop_ldst_is_rs1;
	wire [1:0] _slots_2_io_iss_uop_dst_rtype;
	wire [1:0] _slots_2_io_iss_uop_lrs1_rtype;
	wire [1:0] _slots_2_io_iss_uop_lrs2_rtype;
	wire _slots_2_io_iss_uop_fcn_dw;
	wire [4:0] _slots_2_io_iss_uop_fcn_op;
	wire [31:0] _slots_2_io_out_uop_inst;
	wire [31:0] _slots_2_io_out_uop_debug_inst;
	wire _slots_2_io_out_uop_is_rvc;
	wire [39:0] _slots_2_io_out_uop_debug_pc;
	wire _slots_2_io_out_uop_iq_type_0;
	wire _slots_2_io_out_uop_iq_type_1;
	wire _slots_2_io_out_uop_iq_type_2;
	wire _slots_2_io_out_uop_iq_type_3;
	wire _slots_2_io_out_uop_fu_code_0;
	wire _slots_2_io_out_uop_fu_code_1;
	wire _slots_2_io_out_uop_fu_code_2;
	wire _slots_2_io_out_uop_fu_code_3;
	wire _slots_2_io_out_uop_fu_code_4;
	wire _slots_2_io_out_uop_fu_code_5;
	wire _slots_2_io_out_uop_fu_code_6;
	wire _slots_2_io_out_uop_fu_code_7;
	wire _slots_2_io_out_uop_fu_code_8;
	wire _slots_2_io_out_uop_fu_code_9;
	wire _slots_2_io_out_uop_iw_issued;
	wire _slots_2_io_out_uop_iw_p1_speculative_child;
	wire _slots_2_io_out_uop_iw_p2_speculative_child;
	wire _slots_2_io_out_uop_iw_p1_bypass_hint;
	wire _slots_2_io_out_uop_iw_p2_bypass_hint;
	wire _slots_2_io_out_uop_iw_p3_bypass_hint;
	wire _slots_2_io_out_uop_dis_col_sel;
	wire [7:0] _slots_2_io_out_uop_br_mask;
	wire [2:0] _slots_2_io_out_uop_br_tag;
	wire [3:0] _slots_2_io_out_uop_br_type;
	wire _slots_2_io_out_uop_is_sfb;
	wire _slots_2_io_out_uop_is_fence;
	wire _slots_2_io_out_uop_is_fencei;
	wire _slots_2_io_out_uop_is_sfence;
	wire _slots_2_io_out_uop_is_amo;
	wire _slots_2_io_out_uop_is_eret;
	wire _slots_2_io_out_uop_is_sys_pc2epc;
	wire _slots_2_io_out_uop_is_rocc;
	wire _slots_2_io_out_uop_is_mov;
	wire [3:0] _slots_2_io_out_uop_ftq_idx;
	wire _slots_2_io_out_uop_edge_inst;
	wire [5:0] _slots_2_io_out_uop_pc_lob;
	wire _slots_2_io_out_uop_taken;
	wire _slots_2_io_out_uop_imm_rename;
	wire [2:0] _slots_2_io_out_uop_imm_sel;
	wire [4:0] _slots_2_io_out_uop_pimm;
	wire [19:0] _slots_2_io_out_uop_imm_packed;
	wire [1:0] _slots_2_io_out_uop_op1_sel;
	wire [2:0] _slots_2_io_out_uop_op2_sel;
	wire _slots_2_io_out_uop_fp_ctrl_ldst;
	wire _slots_2_io_out_uop_fp_ctrl_wen;
	wire _slots_2_io_out_uop_fp_ctrl_ren1;
	wire _slots_2_io_out_uop_fp_ctrl_ren2;
	wire _slots_2_io_out_uop_fp_ctrl_ren3;
	wire _slots_2_io_out_uop_fp_ctrl_swap12;
	wire _slots_2_io_out_uop_fp_ctrl_swap23;
	wire [1:0] _slots_2_io_out_uop_fp_ctrl_typeTagIn;
	wire [1:0] _slots_2_io_out_uop_fp_ctrl_typeTagOut;
	wire _slots_2_io_out_uop_fp_ctrl_fromint;
	wire _slots_2_io_out_uop_fp_ctrl_toint;
	wire _slots_2_io_out_uop_fp_ctrl_fastpipe;
	wire _slots_2_io_out_uop_fp_ctrl_fma;
	wire _slots_2_io_out_uop_fp_ctrl_div;
	wire _slots_2_io_out_uop_fp_ctrl_sqrt;
	wire _slots_2_io_out_uop_fp_ctrl_wflags;
	wire _slots_2_io_out_uop_fp_ctrl_vec;
	wire [4:0] _slots_2_io_out_uop_rob_idx;
	wire [3:0] _slots_2_io_out_uop_ldq_idx;
	wire [3:0] _slots_2_io_out_uop_stq_idx;
	wire [1:0] _slots_2_io_out_uop_rxq_idx;
	wire [5:0] _slots_2_io_out_uop_pdst;
	wire [5:0] _slots_2_io_out_uop_prs1;
	wire [5:0] _slots_2_io_out_uop_prs2;
	wire [5:0] _slots_2_io_out_uop_prs3;
	wire [3:0] _slots_2_io_out_uop_ppred;
	wire _slots_2_io_out_uop_prs1_busy;
	wire _slots_2_io_out_uop_prs2_busy;
	wire _slots_2_io_out_uop_prs3_busy;
	wire _slots_2_io_out_uop_ppred_busy;
	wire [5:0] _slots_2_io_out_uop_stale_pdst;
	wire _slots_2_io_out_uop_exception;
	wire [63:0] _slots_2_io_out_uop_exc_cause;
	wire [4:0] _slots_2_io_out_uop_mem_cmd;
	wire [1:0] _slots_2_io_out_uop_mem_size;
	wire _slots_2_io_out_uop_mem_signed;
	wire _slots_2_io_out_uop_uses_ldq;
	wire _slots_2_io_out_uop_uses_stq;
	wire _slots_2_io_out_uop_is_unique;
	wire _slots_2_io_out_uop_flush_on_commit;
	wire [2:0] _slots_2_io_out_uop_csr_cmd;
	wire _slots_2_io_out_uop_ldst_is_rs1;
	wire [5:0] _slots_2_io_out_uop_ldst;
	wire [5:0] _slots_2_io_out_uop_lrs1;
	wire [5:0] _slots_2_io_out_uop_lrs2;
	wire [5:0] _slots_2_io_out_uop_lrs3;
	wire [1:0] _slots_2_io_out_uop_dst_rtype;
	wire [1:0] _slots_2_io_out_uop_lrs1_rtype;
	wire [1:0] _slots_2_io_out_uop_lrs2_rtype;
	wire _slots_2_io_out_uop_frs3_en;
	wire _slots_2_io_out_uop_fcn_dw;
	wire [4:0] _slots_2_io_out_uop_fcn_op;
	wire _slots_2_io_out_uop_fp_val;
	wire _slots_2_io_out_uop_xcpt_pf_if;
	wire _slots_2_io_out_uop_xcpt_ae_if;
	wire _slots_2_io_out_uop_xcpt_ma_if;
	wire _slots_2_io_out_uop_bp_debug_if;
	wire _slots_2_io_out_uop_bp_xcpt_if;
	wire [2:0] _slots_2_io_out_uop_debug_fsrc;
	wire [2:0] _slots_2_io_out_uop_debug_tsrc;
	wire _slots_1_io_valid;
	wire _slots_1_io_will_be_valid;
	wire _slots_1_io_request;
	wire _slots_1_io_iss_uop_is_rvc;
	wire _slots_1_io_iss_uop_fu_code_0;
	wire _slots_1_io_iss_uop_iw_p1_bypass_hint;
	wire _slots_1_io_iss_uop_iw_p2_bypass_hint;
	wire [7:0] _slots_1_io_iss_uop_br_mask;
	wire [2:0] _slots_1_io_iss_uop_br_tag;
	wire [3:0] _slots_1_io_iss_uop_br_type;
	wire _slots_1_io_iss_uop_is_sfb;
	wire _slots_1_io_iss_uop_is_mov;
	wire [3:0] _slots_1_io_iss_uop_ftq_idx;
	wire _slots_1_io_iss_uop_edge_inst;
	wire [5:0] _slots_1_io_iss_uop_pc_lob;
	wire _slots_1_io_iss_uop_taken;
	wire [2:0] _slots_1_io_iss_uop_imm_sel;
	wire [4:0] _slots_1_io_iss_uop_pimm;
	wire [1:0] _slots_1_io_iss_uop_op1_sel;
	wire [2:0] _slots_1_io_iss_uop_op2_sel;
	wire [4:0] _slots_1_io_iss_uop_rob_idx;
	wire [5:0] _slots_1_io_iss_uop_pdst;
	wire [5:0] _slots_1_io_iss_uop_prs1;
	wire [5:0] _slots_1_io_iss_uop_prs2;
	wire [3:0] _slots_1_io_iss_uop_ppred;
	wire [2:0] _slots_1_io_iss_uop_csr_cmd;
	wire _slots_1_io_iss_uop_ldst_is_rs1;
	wire [1:0] _slots_1_io_iss_uop_dst_rtype;
	wire [1:0] _slots_1_io_iss_uop_lrs1_rtype;
	wire [1:0] _slots_1_io_iss_uop_lrs2_rtype;
	wire _slots_1_io_iss_uop_fcn_dw;
	wire [4:0] _slots_1_io_iss_uop_fcn_op;
	wire [31:0] _slots_1_io_out_uop_inst;
	wire [31:0] _slots_1_io_out_uop_debug_inst;
	wire _slots_1_io_out_uop_is_rvc;
	wire [39:0] _slots_1_io_out_uop_debug_pc;
	wire _slots_1_io_out_uop_iq_type_0;
	wire _slots_1_io_out_uop_iq_type_1;
	wire _slots_1_io_out_uop_iq_type_2;
	wire _slots_1_io_out_uop_iq_type_3;
	wire _slots_1_io_out_uop_fu_code_0;
	wire _slots_1_io_out_uop_fu_code_1;
	wire _slots_1_io_out_uop_fu_code_2;
	wire _slots_1_io_out_uop_fu_code_3;
	wire _slots_1_io_out_uop_fu_code_4;
	wire _slots_1_io_out_uop_fu_code_5;
	wire _slots_1_io_out_uop_fu_code_6;
	wire _slots_1_io_out_uop_fu_code_7;
	wire _slots_1_io_out_uop_fu_code_8;
	wire _slots_1_io_out_uop_fu_code_9;
	wire _slots_1_io_out_uop_iw_issued;
	wire _slots_1_io_out_uop_iw_p1_speculative_child;
	wire _slots_1_io_out_uop_iw_p2_speculative_child;
	wire _slots_1_io_out_uop_iw_p1_bypass_hint;
	wire _slots_1_io_out_uop_iw_p2_bypass_hint;
	wire _slots_1_io_out_uop_iw_p3_bypass_hint;
	wire _slots_1_io_out_uop_dis_col_sel;
	wire [7:0] _slots_1_io_out_uop_br_mask;
	wire [2:0] _slots_1_io_out_uop_br_tag;
	wire [3:0] _slots_1_io_out_uop_br_type;
	wire _slots_1_io_out_uop_is_sfb;
	wire _slots_1_io_out_uop_is_fence;
	wire _slots_1_io_out_uop_is_fencei;
	wire _slots_1_io_out_uop_is_sfence;
	wire _slots_1_io_out_uop_is_amo;
	wire _slots_1_io_out_uop_is_eret;
	wire _slots_1_io_out_uop_is_sys_pc2epc;
	wire _slots_1_io_out_uop_is_rocc;
	wire _slots_1_io_out_uop_is_mov;
	wire [3:0] _slots_1_io_out_uop_ftq_idx;
	wire _slots_1_io_out_uop_edge_inst;
	wire [5:0] _slots_1_io_out_uop_pc_lob;
	wire _slots_1_io_out_uop_taken;
	wire _slots_1_io_out_uop_imm_rename;
	wire [2:0] _slots_1_io_out_uop_imm_sel;
	wire [4:0] _slots_1_io_out_uop_pimm;
	wire [19:0] _slots_1_io_out_uop_imm_packed;
	wire [1:0] _slots_1_io_out_uop_op1_sel;
	wire [2:0] _slots_1_io_out_uop_op2_sel;
	wire _slots_1_io_out_uop_fp_ctrl_ldst;
	wire _slots_1_io_out_uop_fp_ctrl_wen;
	wire _slots_1_io_out_uop_fp_ctrl_ren1;
	wire _slots_1_io_out_uop_fp_ctrl_ren2;
	wire _slots_1_io_out_uop_fp_ctrl_ren3;
	wire _slots_1_io_out_uop_fp_ctrl_swap12;
	wire _slots_1_io_out_uop_fp_ctrl_swap23;
	wire [1:0] _slots_1_io_out_uop_fp_ctrl_typeTagIn;
	wire [1:0] _slots_1_io_out_uop_fp_ctrl_typeTagOut;
	wire _slots_1_io_out_uop_fp_ctrl_fromint;
	wire _slots_1_io_out_uop_fp_ctrl_toint;
	wire _slots_1_io_out_uop_fp_ctrl_fastpipe;
	wire _slots_1_io_out_uop_fp_ctrl_fma;
	wire _slots_1_io_out_uop_fp_ctrl_div;
	wire _slots_1_io_out_uop_fp_ctrl_sqrt;
	wire _slots_1_io_out_uop_fp_ctrl_wflags;
	wire _slots_1_io_out_uop_fp_ctrl_vec;
	wire [4:0] _slots_1_io_out_uop_rob_idx;
	wire [3:0] _slots_1_io_out_uop_ldq_idx;
	wire [3:0] _slots_1_io_out_uop_stq_idx;
	wire [1:0] _slots_1_io_out_uop_rxq_idx;
	wire [5:0] _slots_1_io_out_uop_pdst;
	wire [5:0] _slots_1_io_out_uop_prs1;
	wire [5:0] _slots_1_io_out_uop_prs2;
	wire [5:0] _slots_1_io_out_uop_prs3;
	wire [3:0] _slots_1_io_out_uop_ppred;
	wire _slots_1_io_out_uop_prs1_busy;
	wire _slots_1_io_out_uop_prs2_busy;
	wire _slots_1_io_out_uop_prs3_busy;
	wire _slots_1_io_out_uop_ppred_busy;
	wire [5:0] _slots_1_io_out_uop_stale_pdst;
	wire _slots_1_io_out_uop_exception;
	wire [63:0] _slots_1_io_out_uop_exc_cause;
	wire [4:0] _slots_1_io_out_uop_mem_cmd;
	wire [1:0] _slots_1_io_out_uop_mem_size;
	wire _slots_1_io_out_uop_mem_signed;
	wire _slots_1_io_out_uop_uses_ldq;
	wire _slots_1_io_out_uop_uses_stq;
	wire _slots_1_io_out_uop_is_unique;
	wire _slots_1_io_out_uop_flush_on_commit;
	wire [2:0] _slots_1_io_out_uop_csr_cmd;
	wire _slots_1_io_out_uop_ldst_is_rs1;
	wire [5:0] _slots_1_io_out_uop_ldst;
	wire [5:0] _slots_1_io_out_uop_lrs1;
	wire [5:0] _slots_1_io_out_uop_lrs2;
	wire [5:0] _slots_1_io_out_uop_lrs3;
	wire [1:0] _slots_1_io_out_uop_dst_rtype;
	wire [1:0] _slots_1_io_out_uop_lrs1_rtype;
	wire [1:0] _slots_1_io_out_uop_lrs2_rtype;
	wire _slots_1_io_out_uop_frs3_en;
	wire _slots_1_io_out_uop_fcn_dw;
	wire [4:0] _slots_1_io_out_uop_fcn_op;
	wire _slots_1_io_out_uop_fp_val;
	wire _slots_1_io_out_uop_xcpt_pf_if;
	wire _slots_1_io_out_uop_xcpt_ae_if;
	wire _slots_1_io_out_uop_xcpt_ma_if;
	wire _slots_1_io_out_uop_bp_debug_if;
	wire _slots_1_io_out_uop_bp_xcpt_if;
	wire [2:0] _slots_1_io_out_uop_debug_fsrc;
	wire [2:0] _slots_1_io_out_uop_debug_tsrc;
	wire _slots_0_io_valid;
	wire _slots_0_io_will_be_valid;
	wire _slots_0_io_request;
	wire _slots_0_io_iss_uop_is_rvc;
	wire _slots_0_io_iss_uop_fu_code_0;
	wire _slots_0_io_iss_uop_iw_p1_bypass_hint;
	wire _slots_0_io_iss_uop_iw_p2_bypass_hint;
	wire [7:0] _slots_0_io_iss_uop_br_mask;
	wire [2:0] _slots_0_io_iss_uop_br_tag;
	wire [3:0] _slots_0_io_iss_uop_br_type;
	wire _slots_0_io_iss_uop_is_sfb;
	wire _slots_0_io_iss_uop_is_mov;
	wire [3:0] _slots_0_io_iss_uop_ftq_idx;
	wire _slots_0_io_iss_uop_edge_inst;
	wire [5:0] _slots_0_io_iss_uop_pc_lob;
	wire _slots_0_io_iss_uop_taken;
	wire [2:0] _slots_0_io_iss_uop_imm_sel;
	wire [4:0] _slots_0_io_iss_uop_pimm;
	wire [1:0] _slots_0_io_iss_uop_op1_sel;
	wire [2:0] _slots_0_io_iss_uop_op2_sel;
	wire [4:0] _slots_0_io_iss_uop_rob_idx;
	wire [5:0] _slots_0_io_iss_uop_pdst;
	wire [5:0] _slots_0_io_iss_uop_prs1;
	wire [5:0] _slots_0_io_iss_uop_prs2;
	wire [3:0] _slots_0_io_iss_uop_ppred;
	wire [2:0] _slots_0_io_iss_uop_csr_cmd;
	wire _slots_0_io_iss_uop_ldst_is_rs1;
	wire [1:0] _slots_0_io_iss_uop_dst_rtype;
	wire [1:0] _slots_0_io_iss_uop_lrs1_rtype;
	wire [1:0] _slots_0_io_iss_uop_lrs2_rtype;
	wire _slots_0_io_iss_uop_fcn_dw;
	wire [4:0] _slots_0_io_iss_uop_fcn_op;
	wire prs1_matches_0 = io_wakeup_ports_0_bits_uop_pdst == io_dis_uops_0_bits_prs1;
	wire prs2_matches_0 = io_wakeup_ports_0_bits_uop_pdst == io_dis_uops_0_bits_prs2;
	wire prs1_wakeups_0 = io_wakeup_ports_0_valid & prs1_matches_0;
	wire prs1_wakeups_2 = io_wakeup_ports_2_valid & (io_wakeup_ports_2_bits_uop_pdst == io_dis_uops_0_bits_prs1);
	wire prs2_wakeups_0 = io_wakeup_ports_0_valid & prs2_matches_0;
	wire prs2_wakeups_2 = io_wakeup_ports_2_valid & (io_wakeup_ports_2_bits_uop_pdst == io_dis_uops_0_bits_prs2);
	wire prs3_wakeups_0 = io_wakeup_ports_0_valid & (io_wakeup_ports_0_bits_uop_pdst == io_dis_uops_0_bits_prs3);
	wire prs3_wakeups_2 = io_wakeup_ports_2_valid & (io_wakeup_ports_2_bits_uop_pdst == io_dis_uops_0_bits_prs3);
	wire _GEN = (prs1_wakeups_0 | (io_wakeup_ports_1_valid & (io_wakeup_ports_1_bits_uop_pdst == io_dis_uops_0_bits_prs1))) | prs1_wakeups_2;
	wire _GEN_0 = (prs2_wakeups_0 | (io_wakeup_ports_1_valid & (io_wakeup_ports_1_bits_uop_pdst == io_dis_uops_0_bits_prs2))) | prs2_wakeups_2;
	wire _GEN_1 = (prs3_wakeups_0 | (io_wakeup_ports_1_valid & (io_wakeup_ports_1_bits_uop_pdst == io_dis_uops_0_bits_prs3))) | prs3_wakeups_2;
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
	assign issue_slots_0_grant = _slots_0_io_request & _slots_0_io_iss_uop_fu_code_0;
	wire _GEN_3 = _slots_1_io_request & _slots_1_io_iss_uop_fu_code_0;
	assign issue_slots_1_grant = _GEN_3 & ~issue_slots_0_grant;
	wire _GEN_4 = _GEN_3 | issue_slots_0_grant;
	wire _GEN_5 = _slots_2_io_request & _slots_2_io_iss_uop_fu_code_0;
	assign issue_slots_2_grant = _GEN_5 & ~_GEN_4;
	wire _GEN_6 = _GEN_5 | _GEN_4;
	wire _GEN_7 = _slots_3_io_request & _slots_3_io_iss_uop_fu_code_0;
	assign issue_slots_3_grant = _GEN_7 & ~_GEN_6;
	wire _GEN_8 = _GEN_7 | _GEN_6;
	wire _GEN_9 = _slots_4_io_request & _slots_4_io_iss_uop_fu_code_0;
	assign issue_slots_4_grant = _GEN_9 & ~_GEN_8;
	wire _GEN_10 = _GEN_9 | _GEN_8;
	wire _GEN_11 = _slots_5_io_request & _slots_5_io_iss_uop_fu_code_0;
	assign issue_slots_5_grant = _GEN_11 & ~_GEN_10;
	wire _GEN_12 = _GEN_11 | _GEN_10;
	wire _GEN_13 = _slots_6_io_request & _slots_6_io_iss_uop_fu_code_0;
	assign issue_slots_6_grant = _GEN_13 & ~_GEN_12;
	assign issue_slots_7_grant = (_slots_7_io_request & _slots_7_io_iss_uop_fu_code_0) & ~(_GEN_13 | _GEN_12);
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
	IssueSlot_16 slots_0(
		.clock(clock),
		.reset(reset),
		.io_valid(_slots_0_io_valid),
		.io_will_be_valid(_slots_0_io_will_be_valid),
		.io_request(_slots_0_io_request),
		.io_grant(issue_slots_0_grant),
		.io_iss_uop_inst(),
		.io_iss_uop_debug_inst(),
		.io_iss_uop_is_rvc(_slots_0_io_iss_uop_is_rvc),
		.io_iss_uop_debug_pc(),
		.io_iss_uop_iq_type_0(),
		.io_iss_uop_iq_type_1(),
		.io_iss_uop_iq_type_2(),
		.io_iss_uop_iq_type_3(),
		.io_iss_uop_fu_code_0(_slots_0_io_iss_uop_fu_code_0),
		.io_iss_uop_fu_code_1(),
		.io_iss_uop_fu_code_2(),
		.io_iss_uop_fu_code_3(),
		.io_iss_uop_fu_code_4(),
		.io_iss_uop_fu_code_5(),
		.io_iss_uop_fu_code_6(),
		.io_iss_uop_fu_code_7(),
		.io_iss_uop_fu_code_8(),
		.io_iss_uop_fu_code_9(),
		.io_iss_uop_iw_issued(),
		.io_iss_uop_iw_p1_speculative_child(),
		.io_iss_uop_iw_p2_speculative_child(),
		.io_iss_uop_iw_p1_bypass_hint(_slots_0_io_iss_uop_iw_p1_bypass_hint),
		.io_iss_uop_iw_p2_bypass_hint(_slots_0_io_iss_uop_iw_p2_bypass_hint),
		.io_iss_uop_iw_p3_bypass_hint(),
		.io_iss_uop_dis_col_sel(),
		.io_iss_uop_br_mask(_slots_0_io_iss_uop_br_mask),
		.io_iss_uop_br_tag(_slots_0_io_iss_uop_br_tag),
		.io_iss_uop_br_type(_slots_0_io_iss_uop_br_type),
		.io_iss_uop_is_sfb(_slots_0_io_iss_uop_is_sfb),
		.io_iss_uop_is_fence(),
		.io_iss_uop_is_fencei(),
		.io_iss_uop_is_sfence(),
		.io_iss_uop_is_amo(),
		.io_iss_uop_is_eret(),
		.io_iss_uop_is_sys_pc2epc(),
		.io_iss_uop_is_rocc(),
		.io_iss_uop_is_mov(_slots_0_io_iss_uop_is_mov),
		.io_iss_uop_ftq_idx(_slots_0_io_iss_uop_ftq_idx),
		.io_iss_uop_edge_inst(_slots_0_io_iss_uop_edge_inst),
		.io_iss_uop_pc_lob(_slots_0_io_iss_uop_pc_lob),
		.io_iss_uop_taken(_slots_0_io_iss_uop_taken),
		.io_iss_uop_imm_rename(),
		.io_iss_uop_imm_sel(_slots_0_io_iss_uop_imm_sel),
		.io_iss_uop_pimm(_slots_0_io_iss_uop_pimm),
		.io_iss_uop_imm_packed(),
		.io_iss_uop_op1_sel(_slots_0_io_iss_uop_op1_sel),
		.io_iss_uop_op2_sel(_slots_0_io_iss_uop_op2_sel),
		.io_iss_uop_fp_ctrl_ldst(),
		.io_iss_uop_fp_ctrl_wen(),
		.io_iss_uop_fp_ctrl_ren1(),
		.io_iss_uop_fp_ctrl_ren2(),
		.io_iss_uop_fp_ctrl_ren3(),
		.io_iss_uop_fp_ctrl_swap12(),
		.io_iss_uop_fp_ctrl_swap23(),
		.io_iss_uop_fp_ctrl_typeTagIn(),
		.io_iss_uop_fp_ctrl_typeTagOut(),
		.io_iss_uop_fp_ctrl_fromint(),
		.io_iss_uop_fp_ctrl_toint(),
		.io_iss_uop_fp_ctrl_fastpipe(),
		.io_iss_uop_fp_ctrl_fma(),
		.io_iss_uop_fp_ctrl_div(),
		.io_iss_uop_fp_ctrl_sqrt(),
		.io_iss_uop_fp_ctrl_wflags(),
		.io_iss_uop_fp_ctrl_vec(),
		.io_iss_uop_rob_idx(_slots_0_io_iss_uop_rob_idx),
		.io_iss_uop_ldq_idx(),
		.io_iss_uop_stq_idx(),
		.io_iss_uop_rxq_idx(),
		.io_iss_uop_pdst(_slots_0_io_iss_uop_pdst),
		.io_iss_uop_prs1(_slots_0_io_iss_uop_prs1),
		.io_iss_uop_prs2(_slots_0_io_iss_uop_prs2),
		.io_iss_uop_prs3(),
		.io_iss_uop_ppred(_slots_0_io_iss_uop_ppred),
		.io_iss_uop_prs1_busy(),
		.io_iss_uop_prs2_busy(),
		.io_iss_uop_prs3_busy(),
		.io_iss_uop_ppred_busy(),
		.io_iss_uop_stale_pdst(),
		.io_iss_uop_exception(),
		.io_iss_uop_exc_cause(),
		.io_iss_uop_mem_cmd(),
		.io_iss_uop_mem_size(),
		.io_iss_uop_mem_signed(),
		.io_iss_uop_uses_ldq(),
		.io_iss_uop_uses_stq(),
		.io_iss_uop_is_unique(),
		.io_iss_uop_flush_on_commit(),
		.io_iss_uop_csr_cmd(_slots_0_io_iss_uop_csr_cmd),
		.io_iss_uop_ldst_is_rs1(_slots_0_io_iss_uop_ldst_is_rs1),
		.io_iss_uop_ldst(),
		.io_iss_uop_lrs1(),
		.io_iss_uop_lrs2(),
		.io_iss_uop_lrs3(),
		.io_iss_uop_dst_rtype(_slots_0_io_iss_uop_dst_rtype),
		.io_iss_uop_lrs1_rtype(_slots_0_io_iss_uop_lrs1_rtype),
		.io_iss_uop_lrs2_rtype(_slots_0_io_iss_uop_lrs2_rtype),
		.io_iss_uop_frs3_en(),
		.io_iss_uop_fcn_dw(_slots_0_io_iss_uop_fcn_dw),
		.io_iss_uop_fcn_op(_slots_0_io_iss_uop_fcn_op),
		.io_iss_uop_fp_val(),
		.io_iss_uop_xcpt_pf_if(),
		.io_iss_uop_xcpt_ae_if(),
		.io_iss_uop_xcpt_ma_if(),
		.io_iss_uop_bp_debug_if(),
		.io_iss_uop_bp_xcpt_if(),
		.io_iss_uop_debug_fsrc(),
		.io_iss_uop_debug_tsrc(),
		.io_in_uop_valid(issue_slots_0_in_uop_valid),
		.io_in_uop_bits_inst(_slots_1_io_out_uop_inst),
		.io_in_uop_bits_debug_inst(_slots_1_io_out_uop_debug_inst),
		.io_in_uop_bits_is_rvc(_slots_1_io_out_uop_is_rvc),
		.io_in_uop_bits_debug_pc(_slots_1_io_out_uop_debug_pc),
		.io_in_uop_bits_iq_type_0(_slots_1_io_out_uop_iq_type_0),
		.io_in_uop_bits_iq_type_1(_slots_1_io_out_uop_iq_type_1),
		.io_in_uop_bits_iq_type_2(_slots_1_io_out_uop_iq_type_2),
		.io_in_uop_bits_iq_type_3(_slots_1_io_out_uop_iq_type_3),
		.io_in_uop_bits_fu_code_0(_slots_1_io_out_uop_fu_code_0),
		.io_in_uop_bits_fu_code_1(_slots_1_io_out_uop_fu_code_1),
		.io_in_uop_bits_fu_code_2(_slots_1_io_out_uop_fu_code_2),
		.io_in_uop_bits_fu_code_3(_slots_1_io_out_uop_fu_code_3),
		.io_in_uop_bits_fu_code_4(_slots_1_io_out_uop_fu_code_4),
		.io_in_uop_bits_fu_code_5(_slots_1_io_out_uop_fu_code_5),
		.io_in_uop_bits_fu_code_6(_slots_1_io_out_uop_fu_code_6),
		.io_in_uop_bits_fu_code_7(_slots_1_io_out_uop_fu_code_7),
		.io_in_uop_bits_fu_code_8(_slots_1_io_out_uop_fu_code_8),
		.io_in_uop_bits_fu_code_9(_slots_1_io_out_uop_fu_code_9),
		.io_in_uop_bits_iw_issued(_slots_1_io_out_uop_iw_issued),
		.io_in_uop_bits_iw_p1_speculative_child(_slots_1_io_out_uop_iw_p1_speculative_child),
		.io_in_uop_bits_iw_p2_speculative_child(_slots_1_io_out_uop_iw_p2_speculative_child),
		.io_in_uop_bits_iw_p1_bypass_hint(_slots_1_io_out_uop_iw_p1_bypass_hint),
		.io_in_uop_bits_iw_p2_bypass_hint(_slots_1_io_out_uop_iw_p2_bypass_hint),
		.io_in_uop_bits_iw_p3_bypass_hint(_slots_1_io_out_uop_iw_p3_bypass_hint),
		.io_in_uop_bits_dis_col_sel(_slots_1_io_out_uop_dis_col_sel),
		.io_in_uop_bits_br_mask(_slots_1_io_out_uop_br_mask),
		.io_in_uop_bits_br_tag(_slots_1_io_out_uop_br_tag),
		.io_in_uop_bits_br_type(_slots_1_io_out_uop_br_type),
		.io_in_uop_bits_is_sfb(_slots_1_io_out_uop_is_sfb),
		.io_in_uop_bits_is_fence(_slots_1_io_out_uop_is_fence),
		.io_in_uop_bits_is_fencei(_slots_1_io_out_uop_is_fencei),
		.io_in_uop_bits_is_sfence(_slots_1_io_out_uop_is_sfence),
		.io_in_uop_bits_is_amo(_slots_1_io_out_uop_is_amo),
		.io_in_uop_bits_is_eret(_slots_1_io_out_uop_is_eret),
		.io_in_uop_bits_is_sys_pc2epc(_slots_1_io_out_uop_is_sys_pc2epc),
		.io_in_uop_bits_is_rocc(_slots_1_io_out_uop_is_rocc),
		.io_in_uop_bits_is_mov(_slots_1_io_out_uop_is_mov),
		.io_in_uop_bits_ftq_idx(_slots_1_io_out_uop_ftq_idx),
		.io_in_uop_bits_edge_inst(_slots_1_io_out_uop_edge_inst),
		.io_in_uop_bits_pc_lob(_slots_1_io_out_uop_pc_lob),
		.io_in_uop_bits_taken(_slots_1_io_out_uop_taken),
		.io_in_uop_bits_imm_rename(_slots_1_io_out_uop_imm_rename),
		.io_in_uop_bits_imm_sel(_slots_1_io_out_uop_imm_sel),
		.io_in_uop_bits_pimm(_slots_1_io_out_uop_pimm),
		.io_in_uop_bits_imm_packed(_slots_1_io_out_uop_imm_packed),
		.io_in_uop_bits_op1_sel(_slots_1_io_out_uop_op1_sel),
		.io_in_uop_bits_op2_sel(_slots_1_io_out_uop_op2_sel),
		.io_in_uop_bits_fp_ctrl_ldst(_slots_1_io_out_uop_fp_ctrl_ldst),
		.io_in_uop_bits_fp_ctrl_wen(_slots_1_io_out_uop_fp_ctrl_wen),
		.io_in_uop_bits_fp_ctrl_ren1(_slots_1_io_out_uop_fp_ctrl_ren1),
		.io_in_uop_bits_fp_ctrl_ren2(_slots_1_io_out_uop_fp_ctrl_ren2),
		.io_in_uop_bits_fp_ctrl_ren3(_slots_1_io_out_uop_fp_ctrl_ren3),
		.io_in_uop_bits_fp_ctrl_swap12(_slots_1_io_out_uop_fp_ctrl_swap12),
		.io_in_uop_bits_fp_ctrl_swap23(_slots_1_io_out_uop_fp_ctrl_swap23),
		.io_in_uop_bits_fp_ctrl_typeTagIn(_slots_1_io_out_uop_fp_ctrl_typeTagIn),
		.io_in_uop_bits_fp_ctrl_typeTagOut(_slots_1_io_out_uop_fp_ctrl_typeTagOut),
		.io_in_uop_bits_fp_ctrl_fromint(_slots_1_io_out_uop_fp_ctrl_fromint),
		.io_in_uop_bits_fp_ctrl_toint(_slots_1_io_out_uop_fp_ctrl_toint),
		.io_in_uop_bits_fp_ctrl_fastpipe(_slots_1_io_out_uop_fp_ctrl_fastpipe),
		.io_in_uop_bits_fp_ctrl_fma(_slots_1_io_out_uop_fp_ctrl_fma),
		.io_in_uop_bits_fp_ctrl_div(_slots_1_io_out_uop_fp_ctrl_div),
		.io_in_uop_bits_fp_ctrl_sqrt(_slots_1_io_out_uop_fp_ctrl_sqrt),
		.io_in_uop_bits_fp_ctrl_wflags(_slots_1_io_out_uop_fp_ctrl_wflags),
		.io_in_uop_bits_fp_ctrl_vec(_slots_1_io_out_uop_fp_ctrl_vec),
		.io_in_uop_bits_rob_idx(_slots_1_io_out_uop_rob_idx),
		.io_in_uop_bits_ldq_idx(_slots_1_io_out_uop_ldq_idx),
		.io_in_uop_bits_stq_idx(_slots_1_io_out_uop_stq_idx),
		.io_in_uop_bits_rxq_idx(_slots_1_io_out_uop_rxq_idx),
		.io_in_uop_bits_pdst(_slots_1_io_out_uop_pdst),
		.io_in_uop_bits_prs1(_slots_1_io_out_uop_prs1),
		.io_in_uop_bits_prs2(_slots_1_io_out_uop_prs2),
		.io_in_uop_bits_prs3(_slots_1_io_out_uop_prs3),
		.io_in_uop_bits_ppred(_slots_1_io_out_uop_ppred),
		.io_in_uop_bits_prs1_busy(_slots_1_io_out_uop_prs1_busy),
		.io_in_uop_bits_prs2_busy(_slots_1_io_out_uop_prs2_busy),
		.io_in_uop_bits_prs3_busy(_slots_1_io_out_uop_prs3_busy),
		.io_in_uop_bits_ppred_busy(_slots_1_io_out_uop_ppred_busy),
		.io_in_uop_bits_stale_pdst(_slots_1_io_out_uop_stale_pdst),
		.io_in_uop_bits_exception(_slots_1_io_out_uop_exception),
		.io_in_uop_bits_exc_cause(_slots_1_io_out_uop_exc_cause),
		.io_in_uop_bits_mem_cmd(_slots_1_io_out_uop_mem_cmd),
		.io_in_uop_bits_mem_size(_slots_1_io_out_uop_mem_size),
		.io_in_uop_bits_mem_signed(_slots_1_io_out_uop_mem_signed),
		.io_in_uop_bits_uses_ldq(_slots_1_io_out_uop_uses_ldq),
		.io_in_uop_bits_uses_stq(_slots_1_io_out_uop_uses_stq),
		.io_in_uop_bits_is_unique(_slots_1_io_out_uop_is_unique),
		.io_in_uop_bits_flush_on_commit(_slots_1_io_out_uop_flush_on_commit),
		.io_in_uop_bits_csr_cmd(_slots_1_io_out_uop_csr_cmd),
		.io_in_uop_bits_ldst_is_rs1(_slots_1_io_out_uop_ldst_is_rs1),
		.io_in_uop_bits_ldst(_slots_1_io_out_uop_ldst),
		.io_in_uop_bits_lrs1(_slots_1_io_out_uop_lrs1),
		.io_in_uop_bits_lrs2(_slots_1_io_out_uop_lrs2),
		.io_in_uop_bits_lrs3(_slots_1_io_out_uop_lrs3),
		.io_in_uop_bits_dst_rtype(_slots_1_io_out_uop_dst_rtype),
		.io_in_uop_bits_lrs1_rtype(_slots_1_io_out_uop_lrs1_rtype),
		.io_in_uop_bits_lrs2_rtype(_slots_1_io_out_uop_lrs2_rtype),
		.io_in_uop_bits_frs3_en(_slots_1_io_out_uop_frs3_en),
		.io_in_uop_bits_fcn_dw(_slots_1_io_out_uop_fcn_dw),
		.io_in_uop_bits_fcn_op(_slots_1_io_out_uop_fcn_op),
		.io_in_uop_bits_fp_val(_slots_1_io_out_uop_fp_val),
		.io_in_uop_bits_xcpt_pf_if(_slots_1_io_out_uop_xcpt_pf_if),
		.io_in_uop_bits_xcpt_ae_if(_slots_1_io_out_uop_xcpt_ae_if),
		.io_in_uop_bits_xcpt_ma_if(_slots_1_io_out_uop_xcpt_ma_if),
		.io_in_uop_bits_bp_debug_if(_slots_1_io_out_uop_bp_debug_if),
		.io_in_uop_bits_bp_xcpt_if(_slots_1_io_out_uop_bp_xcpt_if),
		.io_in_uop_bits_debug_fsrc(_slots_1_io_out_uop_debug_fsrc),
		.io_in_uop_bits_debug_tsrc(_slots_1_io_out_uop_debug_tsrc),
		.io_out_uop_inst(),
		.io_out_uop_debug_inst(),
		.io_out_uop_is_rvc(),
		.io_out_uop_debug_pc(),
		.io_out_uop_iq_type_0(),
		.io_out_uop_iq_type_1(),
		.io_out_uop_iq_type_2(),
		.io_out_uop_iq_type_3(),
		.io_out_uop_fu_code_0(),
		.io_out_uop_fu_code_1(),
		.io_out_uop_fu_code_2(),
		.io_out_uop_fu_code_3(),
		.io_out_uop_fu_code_4(),
		.io_out_uop_fu_code_5(),
		.io_out_uop_fu_code_6(),
		.io_out_uop_fu_code_7(),
		.io_out_uop_fu_code_8(),
		.io_out_uop_fu_code_9(),
		.io_out_uop_iw_issued(),
		.io_out_uop_iw_p1_speculative_child(),
		.io_out_uop_iw_p2_speculative_child(),
		.io_out_uop_iw_p1_bypass_hint(),
		.io_out_uop_iw_p2_bypass_hint(),
		.io_out_uop_iw_p3_bypass_hint(),
		.io_out_uop_dis_col_sel(),
		.io_out_uop_br_mask(),
		.io_out_uop_br_tag(),
		.io_out_uop_br_type(),
		.io_out_uop_is_sfb(),
		.io_out_uop_is_fence(),
		.io_out_uop_is_fencei(),
		.io_out_uop_is_sfence(),
		.io_out_uop_is_amo(),
		.io_out_uop_is_eret(),
		.io_out_uop_is_sys_pc2epc(),
		.io_out_uop_is_rocc(),
		.io_out_uop_is_mov(),
		.io_out_uop_ftq_idx(),
		.io_out_uop_edge_inst(),
		.io_out_uop_pc_lob(),
		.io_out_uop_taken(),
		.io_out_uop_imm_rename(),
		.io_out_uop_imm_sel(),
		.io_out_uop_pimm(),
		.io_out_uop_imm_packed(),
		.io_out_uop_op1_sel(),
		.io_out_uop_op2_sel(),
		.io_out_uop_fp_ctrl_ldst(),
		.io_out_uop_fp_ctrl_wen(),
		.io_out_uop_fp_ctrl_ren1(),
		.io_out_uop_fp_ctrl_ren2(),
		.io_out_uop_fp_ctrl_ren3(),
		.io_out_uop_fp_ctrl_swap12(),
		.io_out_uop_fp_ctrl_swap23(),
		.io_out_uop_fp_ctrl_typeTagIn(),
		.io_out_uop_fp_ctrl_typeTagOut(),
		.io_out_uop_fp_ctrl_fromint(),
		.io_out_uop_fp_ctrl_toint(),
		.io_out_uop_fp_ctrl_fastpipe(),
		.io_out_uop_fp_ctrl_fma(),
		.io_out_uop_fp_ctrl_div(),
		.io_out_uop_fp_ctrl_sqrt(),
		.io_out_uop_fp_ctrl_wflags(),
		.io_out_uop_fp_ctrl_vec(),
		.io_out_uop_rob_idx(),
		.io_out_uop_ldq_idx(),
		.io_out_uop_stq_idx(),
		.io_out_uop_rxq_idx(),
		.io_out_uop_pdst(),
		.io_out_uop_prs1(),
		.io_out_uop_prs2(),
		.io_out_uop_prs3(),
		.io_out_uop_ppred(),
		.io_out_uop_prs1_busy(),
		.io_out_uop_prs2_busy(),
		.io_out_uop_prs3_busy(),
		.io_out_uop_ppred_busy(),
		.io_out_uop_stale_pdst(),
		.io_out_uop_exception(),
		.io_out_uop_exc_cause(),
		.io_out_uop_mem_cmd(),
		.io_out_uop_mem_size(),
		.io_out_uop_mem_signed(),
		.io_out_uop_uses_ldq(),
		.io_out_uop_uses_stq(),
		.io_out_uop_is_unique(),
		.io_out_uop_flush_on_commit(),
		.io_out_uop_csr_cmd(),
		.io_out_uop_ldst_is_rs1(),
		.io_out_uop_ldst(),
		.io_out_uop_lrs1(),
		.io_out_uop_lrs2(),
		.io_out_uop_lrs3(),
		.io_out_uop_dst_rtype(),
		.io_out_uop_lrs1_rtype(),
		.io_out_uop_lrs2_rtype(),
		.io_out_uop_frs3_en(),
		.io_out_uop_fcn_dw(),
		.io_out_uop_fcn_op(),
		.io_out_uop_fp_val(),
		.io_out_uop_xcpt_pf_if(),
		.io_out_uop_xcpt_ae_if(),
		.io_out_uop_xcpt_ma_if(),
		.io_out_uop_bp_debug_if(),
		.io_out_uop_bp_xcpt_if(),
		.io_out_uop_debug_fsrc(),
		.io_out_uop_debug_tsrc(),
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
		.io_pred_wakeup_port_valid(io_pred_wakeup_port_valid),
		.io_pred_wakeup_port_bits(io_pred_wakeup_port_bits),
		.io_child_rebusys(io_child_rebusys)
	);
	IssueSlot_16 slots_1(
		.clock(clock),
		.reset(reset),
		.io_valid(_slots_1_io_valid),
		.io_will_be_valid(_slots_1_io_will_be_valid),
		.io_request(_slots_1_io_request),
		.io_grant(issue_slots_1_grant),
		.io_iss_uop_inst(),
		.io_iss_uop_debug_inst(),
		.io_iss_uop_is_rvc(_slots_1_io_iss_uop_is_rvc),
		.io_iss_uop_debug_pc(),
		.io_iss_uop_iq_type_0(),
		.io_iss_uop_iq_type_1(),
		.io_iss_uop_iq_type_2(),
		.io_iss_uop_iq_type_3(),
		.io_iss_uop_fu_code_0(_slots_1_io_iss_uop_fu_code_0),
		.io_iss_uop_fu_code_1(),
		.io_iss_uop_fu_code_2(),
		.io_iss_uop_fu_code_3(),
		.io_iss_uop_fu_code_4(),
		.io_iss_uop_fu_code_5(),
		.io_iss_uop_fu_code_6(),
		.io_iss_uop_fu_code_7(),
		.io_iss_uop_fu_code_8(),
		.io_iss_uop_fu_code_9(),
		.io_iss_uop_iw_issued(),
		.io_iss_uop_iw_p1_speculative_child(),
		.io_iss_uop_iw_p2_speculative_child(),
		.io_iss_uop_iw_p1_bypass_hint(_slots_1_io_iss_uop_iw_p1_bypass_hint),
		.io_iss_uop_iw_p2_bypass_hint(_slots_1_io_iss_uop_iw_p2_bypass_hint),
		.io_iss_uop_iw_p3_bypass_hint(),
		.io_iss_uop_dis_col_sel(),
		.io_iss_uop_br_mask(_slots_1_io_iss_uop_br_mask),
		.io_iss_uop_br_tag(_slots_1_io_iss_uop_br_tag),
		.io_iss_uop_br_type(_slots_1_io_iss_uop_br_type),
		.io_iss_uop_is_sfb(_slots_1_io_iss_uop_is_sfb),
		.io_iss_uop_is_fence(),
		.io_iss_uop_is_fencei(),
		.io_iss_uop_is_sfence(),
		.io_iss_uop_is_amo(),
		.io_iss_uop_is_eret(),
		.io_iss_uop_is_sys_pc2epc(),
		.io_iss_uop_is_rocc(),
		.io_iss_uop_is_mov(_slots_1_io_iss_uop_is_mov),
		.io_iss_uop_ftq_idx(_slots_1_io_iss_uop_ftq_idx),
		.io_iss_uop_edge_inst(_slots_1_io_iss_uop_edge_inst),
		.io_iss_uop_pc_lob(_slots_1_io_iss_uop_pc_lob),
		.io_iss_uop_taken(_slots_1_io_iss_uop_taken),
		.io_iss_uop_imm_rename(),
		.io_iss_uop_imm_sel(_slots_1_io_iss_uop_imm_sel),
		.io_iss_uop_pimm(_slots_1_io_iss_uop_pimm),
		.io_iss_uop_imm_packed(),
		.io_iss_uop_op1_sel(_slots_1_io_iss_uop_op1_sel),
		.io_iss_uop_op2_sel(_slots_1_io_iss_uop_op2_sel),
		.io_iss_uop_fp_ctrl_ldst(),
		.io_iss_uop_fp_ctrl_wen(),
		.io_iss_uop_fp_ctrl_ren1(),
		.io_iss_uop_fp_ctrl_ren2(),
		.io_iss_uop_fp_ctrl_ren3(),
		.io_iss_uop_fp_ctrl_swap12(),
		.io_iss_uop_fp_ctrl_swap23(),
		.io_iss_uop_fp_ctrl_typeTagIn(),
		.io_iss_uop_fp_ctrl_typeTagOut(),
		.io_iss_uop_fp_ctrl_fromint(),
		.io_iss_uop_fp_ctrl_toint(),
		.io_iss_uop_fp_ctrl_fastpipe(),
		.io_iss_uop_fp_ctrl_fma(),
		.io_iss_uop_fp_ctrl_div(),
		.io_iss_uop_fp_ctrl_sqrt(),
		.io_iss_uop_fp_ctrl_wflags(),
		.io_iss_uop_fp_ctrl_vec(),
		.io_iss_uop_rob_idx(_slots_1_io_iss_uop_rob_idx),
		.io_iss_uop_ldq_idx(),
		.io_iss_uop_stq_idx(),
		.io_iss_uop_rxq_idx(),
		.io_iss_uop_pdst(_slots_1_io_iss_uop_pdst),
		.io_iss_uop_prs1(_slots_1_io_iss_uop_prs1),
		.io_iss_uop_prs2(_slots_1_io_iss_uop_prs2),
		.io_iss_uop_prs3(),
		.io_iss_uop_ppred(_slots_1_io_iss_uop_ppred),
		.io_iss_uop_prs1_busy(),
		.io_iss_uop_prs2_busy(),
		.io_iss_uop_prs3_busy(),
		.io_iss_uop_ppred_busy(),
		.io_iss_uop_stale_pdst(),
		.io_iss_uop_exception(),
		.io_iss_uop_exc_cause(),
		.io_iss_uop_mem_cmd(),
		.io_iss_uop_mem_size(),
		.io_iss_uop_mem_signed(),
		.io_iss_uop_uses_ldq(),
		.io_iss_uop_uses_stq(),
		.io_iss_uop_is_unique(),
		.io_iss_uop_flush_on_commit(),
		.io_iss_uop_csr_cmd(_slots_1_io_iss_uop_csr_cmd),
		.io_iss_uop_ldst_is_rs1(_slots_1_io_iss_uop_ldst_is_rs1),
		.io_iss_uop_ldst(),
		.io_iss_uop_lrs1(),
		.io_iss_uop_lrs2(),
		.io_iss_uop_lrs3(),
		.io_iss_uop_dst_rtype(_slots_1_io_iss_uop_dst_rtype),
		.io_iss_uop_lrs1_rtype(_slots_1_io_iss_uop_lrs1_rtype),
		.io_iss_uop_lrs2_rtype(_slots_1_io_iss_uop_lrs2_rtype),
		.io_iss_uop_frs3_en(),
		.io_iss_uop_fcn_dw(_slots_1_io_iss_uop_fcn_dw),
		.io_iss_uop_fcn_op(_slots_1_io_iss_uop_fcn_op),
		.io_iss_uop_fp_val(),
		.io_iss_uop_xcpt_pf_if(),
		.io_iss_uop_xcpt_ae_if(),
		.io_iss_uop_xcpt_ma_if(),
		.io_iss_uop_bp_debug_if(),
		.io_iss_uop_bp_xcpt_if(),
		.io_iss_uop_debug_fsrc(),
		.io_iss_uop_debug_tsrc(),
		.io_in_uop_valid(issue_slots_1_in_uop_valid),
		.io_in_uop_bits_inst(_slots_2_io_out_uop_inst),
		.io_in_uop_bits_debug_inst(_slots_2_io_out_uop_debug_inst),
		.io_in_uop_bits_is_rvc(_slots_2_io_out_uop_is_rvc),
		.io_in_uop_bits_debug_pc(_slots_2_io_out_uop_debug_pc),
		.io_in_uop_bits_iq_type_0(_slots_2_io_out_uop_iq_type_0),
		.io_in_uop_bits_iq_type_1(_slots_2_io_out_uop_iq_type_1),
		.io_in_uop_bits_iq_type_2(_slots_2_io_out_uop_iq_type_2),
		.io_in_uop_bits_iq_type_3(_slots_2_io_out_uop_iq_type_3),
		.io_in_uop_bits_fu_code_0(_slots_2_io_out_uop_fu_code_0),
		.io_in_uop_bits_fu_code_1(_slots_2_io_out_uop_fu_code_1),
		.io_in_uop_bits_fu_code_2(_slots_2_io_out_uop_fu_code_2),
		.io_in_uop_bits_fu_code_3(_slots_2_io_out_uop_fu_code_3),
		.io_in_uop_bits_fu_code_4(_slots_2_io_out_uop_fu_code_4),
		.io_in_uop_bits_fu_code_5(_slots_2_io_out_uop_fu_code_5),
		.io_in_uop_bits_fu_code_6(_slots_2_io_out_uop_fu_code_6),
		.io_in_uop_bits_fu_code_7(_slots_2_io_out_uop_fu_code_7),
		.io_in_uop_bits_fu_code_8(_slots_2_io_out_uop_fu_code_8),
		.io_in_uop_bits_fu_code_9(_slots_2_io_out_uop_fu_code_9),
		.io_in_uop_bits_iw_issued(_slots_2_io_out_uop_iw_issued),
		.io_in_uop_bits_iw_p1_speculative_child(_slots_2_io_out_uop_iw_p1_speculative_child),
		.io_in_uop_bits_iw_p2_speculative_child(_slots_2_io_out_uop_iw_p2_speculative_child),
		.io_in_uop_bits_iw_p1_bypass_hint(_slots_2_io_out_uop_iw_p1_bypass_hint),
		.io_in_uop_bits_iw_p2_bypass_hint(_slots_2_io_out_uop_iw_p2_bypass_hint),
		.io_in_uop_bits_iw_p3_bypass_hint(_slots_2_io_out_uop_iw_p3_bypass_hint),
		.io_in_uop_bits_dis_col_sel(_slots_2_io_out_uop_dis_col_sel),
		.io_in_uop_bits_br_mask(_slots_2_io_out_uop_br_mask),
		.io_in_uop_bits_br_tag(_slots_2_io_out_uop_br_tag),
		.io_in_uop_bits_br_type(_slots_2_io_out_uop_br_type),
		.io_in_uop_bits_is_sfb(_slots_2_io_out_uop_is_sfb),
		.io_in_uop_bits_is_fence(_slots_2_io_out_uop_is_fence),
		.io_in_uop_bits_is_fencei(_slots_2_io_out_uop_is_fencei),
		.io_in_uop_bits_is_sfence(_slots_2_io_out_uop_is_sfence),
		.io_in_uop_bits_is_amo(_slots_2_io_out_uop_is_amo),
		.io_in_uop_bits_is_eret(_slots_2_io_out_uop_is_eret),
		.io_in_uop_bits_is_sys_pc2epc(_slots_2_io_out_uop_is_sys_pc2epc),
		.io_in_uop_bits_is_rocc(_slots_2_io_out_uop_is_rocc),
		.io_in_uop_bits_is_mov(_slots_2_io_out_uop_is_mov),
		.io_in_uop_bits_ftq_idx(_slots_2_io_out_uop_ftq_idx),
		.io_in_uop_bits_edge_inst(_slots_2_io_out_uop_edge_inst),
		.io_in_uop_bits_pc_lob(_slots_2_io_out_uop_pc_lob),
		.io_in_uop_bits_taken(_slots_2_io_out_uop_taken),
		.io_in_uop_bits_imm_rename(_slots_2_io_out_uop_imm_rename),
		.io_in_uop_bits_imm_sel(_slots_2_io_out_uop_imm_sel),
		.io_in_uop_bits_pimm(_slots_2_io_out_uop_pimm),
		.io_in_uop_bits_imm_packed(_slots_2_io_out_uop_imm_packed),
		.io_in_uop_bits_op1_sel(_slots_2_io_out_uop_op1_sel),
		.io_in_uop_bits_op2_sel(_slots_2_io_out_uop_op2_sel),
		.io_in_uop_bits_fp_ctrl_ldst(_slots_2_io_out_uop_fp_ctrl_ldst),
		.io_in_uop_bits_fp_ctrl_wen(_slots_2_io_out_uop_fp_ctrl_wen),
		.io_in_uop_bits_fp_ctrl_ren1(_slots_2_io_out_uop_fp_ctrl_ren1),
		.io_in_uop_bits_fp_ctrl_ren2(_slots_2_io_out_uop_fp_ctrl_ren2),
		.io_in_uop_bits_fp_ctrl_ren3(_slots_2_io_out_uop_fp_ctrl_ren3),
		.io_in_uop_bits_fp_ctrl_swap12(_slots_2_io_out_uop_fp_ctrl_swap12),
		.io_in_uop_bits_fp_ctrl_swap23(_slots_2_io_out_uop_fp_ctrl_swap23),
		.io_in_uop_bits_fp_ctrl_typeTagIn(_slots_2_io_out_uop_fp_ctrl_typeTagIn),
		.io_in_uop_bits_fp_ctrl_typeTagOut(_slots_2_io_out_uop_fp_ctrl_typeTagOut),
		.io_in_uop_bits_fp_ctrl_fromint(_slots_2_io_out_uop_fp_ctrl_fromint),
		.io_in_uop_bits_fp_ctrl_toint(_slots_2_io_out_uop_fp_ctrl_toint),
		.io_in_uop_bits_fp_ctrl_fastpipe(_slots_2_io_out_uop_fp_ctrl_fastpipe),
		.io_in_uop_bits_fp_ctrl_fma(_slots_2_io_out_uop_fp_ctrl_fma),
		.io_in_uop_bits_fp_ctrl_div(_slots_2_io_out_uop_fp_ctrl_div),
		.io_in_uop_bits_fp_ctrl_sqrt(_slots_2_io_out_uop_fp_ctrl_sqrt),
		.io_in_uop_bits_fp_ctrl_wflags(_slots_2_io_out_uop_fp_ctrl_wflags),
		.io_in_uop_bits_fp_ctrl_vec(_slots_2_io_out_uop_fp_ctrl_vec),
		.io_in_uop_bits_rob_idx(_slots_2_io_out_uop_rob_idx),
		.io_in_uop_bits_ldq_idx(_slots_2_io_out_uop_ldq_idx),
		.io_in_uop_bits_stq_idx(_slots_2_io_out_uop_stq_idx),
		.io_in_uop_bits_rxq_idx(_slots_2_io_out_uop_rxq_idx),
		.io_in_uop_bits_pdst(_slots_2_io_out_uop_pdst),
		.io_in_uop_bits_prs1(_slots_2_io_out_uop_prs1),
		.io_in_uop_bits_prs2(_slots_2_io_out_uop_prs2),
		.io_in_uop_bits_prs3(_slots_2_io_out_uop_prs3),
		.io_in_uop_bits_ppred(_slots_2_io_out_uop_ppred),
		.io_in_uop_bits_prs1_busy(_slots_2_io_out_uop_prs1_busy),
		.io_in_uop_bits_prs2_busy(_slots_2_io_out_uop_prs2_busy),
		.io_in_uop_bits_prs3_busy(_slots_2_io_out_uop_prs3_busy),
		.io_in_uop_bits_ppred_busy(_slots_2_io_out_uop_ppred_busy),
		.io_in_uop_bits_stale_pdst(_slots_2_io_out_uop_stale_pdst),
		.io_in_uop_bits_exception(_slots_2_io_out_uop_exception),
		.io_in_uop_bits_exc_cause(_slots_2_io_out_uop_exc_cause),
		.io_in_uop_bits_mem_cmd(_slots_2_io_out_uop_mem_cmd),
		.io_in_uop_bits_mem_size(_slots_2_io_out_uop_mem_size),
		.io_in_uop_bits_mem_signed(_slots_2_io_out_uop_mem_signed),
		.io_in_uop_bits_uses_ldq(_slots_2_io_out_uop_uses_ldq),
		.io_in_uop_bits_uses_stq(_slots_2_io_out_uop_uses_stq),
		.io_in_uop_bits_is_unique(_slots_2_io_out_uop_is_unique),
		.io_in_uop_bits_flush_on_commit(_slots_2_io_out_uop_flush_on_commit),
		.io_in_uop_bits_csr_cmd(_slots_2_io_out_uop_csr_cmd),
		.io_in_uop_bits_ldst_is_rs1(_slots_2_io_out_uop_ldst_is_rs1),
		.io_in_uop_bits_ldst(_slots_2_io_out_uop_ldst),
		.io_in_uop_bits_lrs1(_slots_2_io_out_uop_lrs1),
		.io_in_uop_bits_lrs2(_slots_2_io_out_uop_lrs2),
		.io_in_uop_bits_lrs3(_slots_2_io_out_uop_lrs3),
		.io_in_uop_bits_dst_rtype(_slots_2_io_out_uop_dst_rtype),
		.io_in_uop_bits_lrs1_rtype(_slots_2_io_out_uop_lrs1_rtype),
		.io_in_uop_bits_lrs2_rtype(_slots_2_io_out_uop_lrs2_rtype),
		.io_in_uop_bits_frs3_en(_slots_2_io_out_uop_frs3_en),
		.io_in_uop_bits_fcn_dw(_slots_2_io_out_uop_fcn_dw),
		.io_in_uop_bits_fcn_op(_slots_2_io_out_uop_fcn_op),
		.io_in_uop_bits_fp_val(_slots_2_io_out_uop_fp_val),
		.io_in_uop_bits_xcpt_pf_if(_slots_2_io_out_uop_xcpt_pf_if),
		.io_in_uop_bits_xcpt_ae_if(_slots_2_io_out_uop_xcpt_ae_if),
		.io_in_uop_bits_xcpt_ma_if(_slots_2_io_out_uop_xcpt_ma_if),
		.io_in_uop_bits_bp_debug_if(_slots_2_io_out_uop_bp_debug_if),
		.io_in_uop_bits_bp_xcpt_if(_slots_2_io_out_uop_bp_xcpt_if),
		.io_in_uop_bits_debug_fsrc(_slots_2_io_out_uop_debug_fsrc),
		.io_in_uop_bits_debug_tsrc(_slots_2_io_out_uop_debug_tsrc),
		.io_out_uop_inst(_slots_1_io_out_uop_inst),
		.io_out_uop_debug_inst(_slots_1_io_out_uop_debug_inst),
		.io_out_uop_is_rvc(_slots_1_io_out_uop_is_rvc),
		.io_out_uop_debug_pc(_slots_1_io_out_uop_debug_pc),
		.io_out_uop_iq_type_0(_slots_1_io_out_uop_iq_type_0),
		.io_out_uop_iq_type_1(_slots_1_io_out_uop_iq_type_1),
		.io_out_uop_iq_type_2(_slots_1_io_out_uop_iq_type_2),
		.io_out_uop_iq_type_3(_slots_1_io_out_uop_iq_type_3),
		.io_out_uop_fu_code_0(_slots_1_io_out_uop_fu_code_0),
		.io_out_uop_fu_code_1(_slots_1_io_out_uop_fu_code_1),
		.io_out_uop_fu_code_2(_slots_1_io_out_uop_fu_code_2),
		.io_out_uop_fu_code_3(_slots_1_io_out_uop_fu_code_3),
		.io_out_uop_fu_code_4(_slots_1_io_out_uop_fu_code_4),
		.io_out_uop_fu_code_5(_slots_1_io_out_uop_fu_code_5),
		.io_out_uop_fu_code_6(_slots_1_io_out_uop_fu_code_6),
		.io_out_uop_fu_code_7(_slots_1_io_out_uop_fu_code_7),
		.io_out_uop_fu_code_8(_slots_1_io_out_uop_fu_code_8),
		.io_out_uop_fu_code_9(_slots_1_io_out_uop_fu_code_9),
		.io_out_uop_iw_issued(_slots_1_io_out_uop_iw_issued),
		.io_out_uop_iw_p1_speculative_child(_slots_1_io_out_uop_iw_p1_speculative_child),
		.io_out_uop_iw_p2_speculative_child(_slots_1_io_out_uop_iw_p2_speculative_child),
		.io_out_uop_iw_p1_bypass_hint(_slots_1_io_out_uop_iw_p1_bypass_hint),
		.io_out_uop_iw_p2_bypass_hint(_slots_1_io_out_uop_iw_p2_bypass_hint),
		.io_out_uop_iw_p3_bypass_hint(_slots_1_io_out_uop_iw_p3_bypass_hint),
		.io_out_uop_dis_col_sel(_slots_1_io_out_uop_dis_col_sel),
		.io_out_uop_br_mask(_slots_1_io_out_uop_br_mask),
		.io_out_uop_br_tag(_slots_1_io_out_uop_br_tag),
		.io_out_uop_br_type(_slots_1_io_out_uop_br_type),
		.io_out_uop_is_sfb(_slots_1_io_out_uop_is_sfb),
		.io_out_uop_is_fence(_slots_1_io_out_uop_is_fence),
		.io_out_uop_is_fencei(_slots_1_io_out_uop_is_fencei),
		.io_out_uop_is_sfence(_slots_1_io_out_uop_is_sfence),
		.io_out_uop_is_amo(_slots_1_io_out_uop_is_amo),
		.io_out_uop_is_eret(_slots_1_io_out_uop_is_eret),
		.io_out_uop_is_sys_pc2epc(_slots_1_io_out_uop_is_sys_pc2epc),
		.io_out_uop_is_rocc(_slots_1_io_out_uop_is_rocc),
		.io_out_uop_is_mov(_slots_1_io_out_uop_is_mov),
		.io_out_uop_ftq_idx(_slots_1_io_out_uop_ftq_idx),
		.io_out_uop_edge_inst(_slots_1_io_out_uop_edge_inst),
		.io_out_uop_pc_lob(_slots_1_io_out_uop_pc_lob),
		.io_out_uop_taken(_slots_1_io_out_uop_taken),
		.io_out_uop_imm_rename(_slots_1_io_out_uop_imm_rename),
		.io_out_uop_imm_sel(_slots_1_io_out_uop_imm_sel),
		.io_out_uop_pimm(_slots_1_io_out_uop_pimm),
		.io_out_uop_imm_packed(_slots_1_io_out_uop_imm_packed),
		.io_out_uop_op1_sel(_slots_1_io_out_uop_op1_sel),
		.io_out_uop_op2_sel(_slots_1_io_out_uop_op2_sel),
		.io_out_uop_fp_ctrl_ldst(_slots_1_io_out_uop_fp_ctrl_ldst),
		.io_out_uop_fp_ctrl_wen(_slots_1_io_out_uop_fp_ctrl_wen),
		.io_out_uop_fp_ctrl_ren1(_slots_1_io_out_uop_fp_ctrl_ren1),
		.io_out_uop_fp_ctrl_ren2(_slots_1_io_out_uop_fp_ctrl_ren2),
		.io_out_uop_fp_ctrl_ren3(_slots_1_io_out_uop_fp_ctrl_ren3),
		.io_out_uop_fp_ctrl_swap12(_slots_1_io_out_uop_fp_ctrl_swap12),
		.io_out_uop_fp_ctrl_swap23(_slots_1_io_out_uop_fp_ctrl_swap23),
		.io_out_uop_fp_ctrl_typeTagIn(_slots_1_io_out_uop_fp_ctrl_typeTagIn),
		.io_out_uop_fp_ctrl_typeTagOut(_slots_1_io_out_uop_fp_ctrl_typeTagOut),
		.io_out_uop_fp_ctrl_fromint(_slots_1_io_out_uop_fp_ctrl_fromint),
		.io_out_uop_fp_ctrl_toint(_slots_1_io_out_uop_fp_ctrl_toint),
		.io_out_uop_fp_ctrl_fastpipe(_slots_1_io_out_uop_fp_ctrl_fastpipe),
		.io_out_uop_fp_ctrl_fma(_slots_1_io_out_uop_fp_ctrl_fma),
		.io_out_uop_fp_ctrl_div(_slots_1_io_out_uop_fp_ctrl_div),
		.io_out_uop_fp_ctrl_sqrt(_slots_1_io_out_uop_fp_ctrl_sqrt),
		.io_out_uop_fp_ctrl_wflags(_slots_1_io_out_uop_fp_ctrl_wflags),
		.io_out_uop_fp_ctrl_vec(_slots_1_io_out_uop_fp_ctrl_vec),
		.io_out_uop_rob_idx(_slots_1_io_out_uop_rob_idx),
		.io_out_uop_ldq_idx(_slots_1_io_out_uop_ldq_idx),
		.io_out_uop_stq_idx(_slots_1_io_out_uop_stq_idx),
		.io_out_uop_rxq_idx(_slots_1_io_out_uop_rxq_idx),
		.io_out_uop_pdst(_slots_1_io_out_uop_pdst),
		.io_out_uop_prs1(_slots_1_io_out_uop_prs1),
		.io_out_uop_prs2(_slots_1_io_out_uop_prs2),
		.io_out_uop_prs3(_slots_1_io_out_uop_prs3),
		.io_out_uop_ppred(_slots_1_io_out_uop_ppred),
		.io_out_uop_prs1_busy(_slots_1_io_out_uop_prs1_busy),
		.io_out_uop_prs2_busy(_slots_1_io_out_uop_prs2_busy),
		.io_out_uop_prs3_busy(_slots_1_io_out_uop_prs3_busy),
		.io_out_uop_ppred_busy(_slots_1_io_out_uop_ppred_busy),
		.io_out_uop_stale_pdst(_slots_1_io_out_uop_stale_pdst),
		.io_out_uop_exception(_slots_1_io_out_uop_exception),
		.io_out_uop_exc_cause(_slots_1_io_out_uop_exc_cause),
		.io_out_uop_mem_cmd(_slots_1_io_out_uop_mem_cmd),
		.io_out_uop_mem_size(_slots_1_io_out_uop_mem_size),
		.io_out_uop_mem_signed(_slots_1_io_out_uop_mem_signed),
		.io_out_uop_uses_ldq(_slots_1_io_out_uop_uses_ldq),
		.io_out_uop_uses_stq(_slots_1_io_out_uop_uses_stq),
		.io_out_uop_is_unique(_slots_1_io_out_uop_is_unique),
		.io_out_uop_flush_on_commit(_slots_1_io_out_uop_flush_on_commit),
		.io_out_uop_csr_cmd(_slots_1_io_out_uop_csr_cmd),
		.io_out_uop_ldst_is_rs1(_slots_1_io_out_uop_ldst_is_rs1),
		.io_out_uop_ldst(_slots_1_io_out_uop_ldst),
		.io_out_uop_lrs1(_slots_1_io_out_uop_lrs1),
		.io_out_uop_lrs2(_slots_1_io_out_uop_lrs2),
		.io_out_uop_lrs3(_slots_1_io_out_uop_lrs3),
		.io_out_uop_dst_rtype(_slots_1_io_out_uop_dst_rtype),
		.io_out_uop_lrs1_rtype(_slots_1_io_out_uop_lrs1_rtype),
		.io_out_uop_lrs2_rtype(_slots_1_io_out_uop_lrs2_rtype),
		.io_out_uop_frs3_en(_slots_1_io_out_uop_frs3_en),
		.io_out_uop_fcn_dw(_slots_1_io_out_uop_fcn_dw),
		.io_out_uop_fcn_op(_slots_1_io_out_uop_fcn_op),
		.io_out_uop_fp_val(_slots_1_io_out_uop_fp_val),
		.io_out_uop_xcpt_pf_if(_slots_1_io_out_uop_xcpt_pf_if),
		.io_out_uop_xcpt_ae_if(_slots_1_io_out_uop_xcpt_ae_if),
		.io_out_uop_xcpt_ma_if(_slots_1_io_out_uop_xcpt_ma_if),
		.io_out_uop_bp_debug_if(_slots_1_io_out_uop_bp_debug_if),
		.io_out_uop_bp_xcpt_if(_slots_1_io_out_uop_bp_xcpt_if),
		.io_out_uop_debug_fsrc(_slots_1_io_out_uop_debug_fsrc),
		.io_out_uop_debug_tsrc(_slots_1_io_out_uop_debug_tsrc),
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
		.io_pred_wakeup_port_valid(io_pred_wakeup_port_valid),
		.io_pred_wakeup_port_bits(io_pred_wakeup_port_bits),
		.io_child_rebusys(io_child_rebusys)
	);
	IssueSlot_16 slots_2(
		.clock(clock),
		.reset(reset),
		.io_valid(_slots_2_io_valid),
		.io_will_be_valid(_slots_2_io_will_be_valid),
		.io_request(_slots_2_io_request),
		.io_grant(issue_slots_2_grant),
		.io_iss_uop_inst(),
		.io_iss_uop_debug_inst(),
		.io_iss_uop_is_rvc(_slots_2_io_iss_uop_is_rvc),
		.io_iss_uop_debug_pc(),
		.io_iss_uop_iq_type_0(),
		.io_iss_uop_iq_type_1(),
		.io_iss_uop_iq_type_2(),
		.io_iss_uop_iq_type_3(),
		.io_iss_uop_fu_code_0(_slots_2_io_iss_uop_fu_code_0),
		.io_iss_uop_fu_code_1(),
		.io_iss_uop_fu_code_2(),
		.io_iss_uop_fu_code_3(),
		.io_iss_uop_fu_code_4(),
		.io_iss_uop_fu_code_5(),
		.io_iss_uop_fu_code_6(),
		.io_iss_uop_fu_code_7(),
		.io_iss_uop_fu_code_8(),
		.io_iss_uop_fu_code_9(),
		.io_iss_uop_iw_issued(),
		.io_iss_uop_iw_p1_speculative_child(),
		.io_iss_uop_iw_p2_speculative_child(),
		.io_iss_uop_iw_p1_bypass_hint(_slots_2_io_iss_uop_iw_p1_bypass_hint),
		.io_iss_uop_iw_p2_bypass_hint(_slots_2_io_iss_uop_iw_p2_bypass_hint),
		.io_iss_uop_iw_p3_bypass_hint(),
		.io_iss_uop_dis_col_sel(),
		.io_iss_uop_br_mask(_slots_2_io_iss_uop_br_mask),
		.io_iss_uop_br_tag(_slots_2_io_iss_uop_br_tag),
		.io_iss_uop_br_type(_slots_2_io_iss_uop_br_type),
		.io_iss_uop_is_sfb(_slots_2_io_iss_uop_is_sfb),
		.io_iss_uop_is_fence(),
		.io_iss_uop_is_fencei(),
		.io_iss_uop_is_sfence(),
		.io_iss_uop_is_amo(),
		.io_iss_uop_is_eret(),
		.io_iss_uop_is_sys_pc2epc(),
		.io_iss_uop_is_rocc(),
		.io_iss_uop_is_mov(_slots_2_io_iss_uop_is_mov),
		.io_iss_uop_ftq_idx(_slots_2_io_iss_uop_ftq_idx),
		.io_iss_uop_edge_inst(_slots_2_io_iss_uop_edge_inst),
		.io_iss_uop_pc_lob(_slots_2_io_iss_uop_pc_lob),
		.io_iss_uop_taken(_slots_2_io_iss_uop_taken),
		.io_iss_uop_imm_rename(),
		.io_iss_uop_imm_sel(_slots_2_io_iss_uop_imm_sel),
		.io_iss_uop_pimm(_slots_2_io_iss_uop_pimm),
		.io_iss_uop_imm_packed(),
		.io_iss_uop_op1_sel(_slots_2_io_iss_uop_op1_sel),
		.io_iss_uop_op2_sel(_slots_2_io_iss_uop_op2_sel),
		.io_iss_uop_fp_ctrl_ldst(),
		.io_iss_uop_fp_ctrl_wen(),
		.io_iss_uop_fp_ctrl_ren1(),
		.io_iss_uop_fp_ctrl_ren2(),
		.io_iss_uop_fp_ctrl_ren3(),
		.io_iss_uop_fp_ctrl_swap12(),
		.io_iss_uop_fp_ctrl_swap23(),
		.io_iss_uop_fp_ctrl_typeTagIn(),
		.io_iss_uop_fp_ctrl_typeTagOut(),
		.io_iss_uop_fp_ctrl_fromint(),
		.io_iss_uop_fp_ctrl_toint(),
		.io_iss_uop_fp_ctrl_fastpipe(),
		.io_iss_uop_fp_ctrl_fma(),
		.io_iss_uop_fp_ctrl_div(),
		.io_iss_uop_fp_ctrl_sqrt(),
		.io_iss_uop_fp_ctrl_wflags(),
		.io_iss_uop_fp_ctrl_vec(),
		.io_iss_uop_rob_idx(_slots_2_io_iss_uop_rob_idx),
		.io_iss_uop_ldq_idx(),
		.io_iss_uop_stq_idx(),
		.io_iss_uop_rxq_idx(),
		.io_iss_uop_pdst(_slots_2_io_iss_uop_pdst),
		.io_iss_uop_prs1(_slots_2_io_iss_uop_prs1),
		.io_iss_uop_prs2(_slots_2_io_iss_uop_prs2),
		.io_iss_uop_prs3(),
		.io_iss_uop_ppred(_slots_2_io_iss_uop_ppred),
		.io_iss_uop_prs1_busy(),
		.io_iss_uop_prs2_busy(),
		.io_iss_uop_prs3_busy(),
		.io_iss_uop_ppred_busy(),
		.io_iss_uop_stale_pdst(),
		.io_iss_uop_exception(),
		.io_iss_uop_exc_cause(),
		.io_iss_uop_mem_cmd(),
		.io_iss_uop_mem_size(),
		.io_iss_uop_mem_signed(),
		.io_iss_uop_uses_ldq(),
		.io_iss_uop_uses_stq(),
		.io_iss_uop_is_unique(),
		.io_iss_uop_flush_on_commit(),
		.io_iss_uop_csr_cmd(_slots_2_io_iss_uop_csr_cmd),
		.io_iss_uop_ldst_is_rs1(_slots_2_io_iss_uop_ldst_is_rs1),
		.io_iss_uop_ldst(),
		.io_iss_uop_lrs1(),
		.io_iss_uop_lrs2(),
		.io_iss_uop_lrs3(),
		.io_iss_uop_dst_rtype(_slots_2_io_iss_uop_dst_rtype),
		.io_iss_uop_lrs1_rtype(_slots_2_io_iss_uop_lrs1_rtype),
		.io_iss_uop_lrs2_rtype(_slots_2_io_iss_uop_lrs2_rtype),
		.io_iss_uop_frs3_en(),
		.io_iss_uop_fcn_dw(_slots_2_io_iss_uop_fcn_dw),
		.io_iss_uop_fcn_op(_slots_2_io_iss_uop_fcn_op),
		.io_iss_uop_fp_val(),
		.io_iss_uop_xcpt_pf_if(),
		.io_iss_uop_xcpt_ae_if(),
		.io_iss_uop_xcpt_ma_if(),
		.io_iss_uop_bp_debug_if(),
		.io_iss_uop_bp_xcpt_if(),
		.io_iss_uop_debug_fsrc(),
		.io_iss_uop_debug_tsrc(),
		.io_in_uop_valid(issue_slots_2_in_uop_valid),
		.io_in_uop_bits_inst(_slots_3_io_out_uop_inst),
		.io_in_uop_bits_debug_inst(_slots_3_io_out_uop_debug_inst),
		.io_in_uop_bits_is_rvc(_slots_3_io_out_uop_is_rvc),
		.io_in_uop_bits_debug_pc(_slots_3_io_out_uop_debug_pc),
		.io_in_uop_bits_iq_type_0(_slots_3_io_out_uop_iq_type_0),
		.io_in_uop_bits_iq_type_1(_slots_3_io_out_uop_iq_type_1),
		.io_in_uop_bits_iq_type_2(_slots_3_io_out_uop_iq_type_2),
		.io_in_uop_bits_iq_type_3(_slots_3_io_out_uop_iq_type_3),
		.io_in_uop_bits_fu_code_0(_slots_3_io_out_uop_fu_code_0),
		.io_in_uop_bits_fu_code_1(_slots_3_io_out_uop_fu_code_1),
		.io_in_uop_bits_fu_code_2(_slots_3_io_out_uop_fu_code_2),
		.io_in_uop_bits_fu_code_3(_slots_3_io_out_uop_fu_code_3),
		.io_in_uop_bits_fu_code_4(_slots_3_io_out_uop_fu_code_4),
		.io_in_uop_bits_fu_code_5(_slots_3_io_out_uop_fu_code_5),
		.io_in_uop_bits_fu_code_6(_slots_3_io_out_uop_fu_code_6),
		.io_in_uop_bits_fu_code_7(_slots_3_io_out_uop_fu_code_7),
		.io_in_uop_bits_fu_code_8(_slots_3_io_out_uop_fu_code_8),
		.io_in_uop_bits_fu_code_9(_slots_3_io_out_uop_fu_code_9),
		.io_in_uop_bits_iw_issued(_slots_3_io_out_uop_iw_issued),
		.io_in_uop_bits_iw_p1_speculative_child(_slots_3_io_out_uop_iw_p1_speculative_child),
		.io_in_uop_bits_iw_p2_speculative_child(_slots_3_io_out_uop_iw_p2_speculative_child),
		.io_in_uop_bits_iw_p1_bypass_hint(_slots_3_io_out_uop_iw_p1_bypass_hint),
		.io_in_uop_bits_iw_p2_bypass_hint(_slots_3_io_out_uop_iw_p2_bypass_hint),
		.io_in_uop_bits_iw_p3_bypass_hint(_slots_3_io_out_uop_iw_p3_bypass_hint),
		.io_in_uop_bits_dis_col_sel(_slots_3_io_out_uop_dis_col_sel),
		.io_in_uop_bits_br_mask(_slots_3_io_out_uop_br_mask),
		.io_in_uop_bits_br_tag(_slots_3_io_out_uop_br_tag),
		.io_in_uop_bits_br_type(_slots_3_io_out_uop_br_type),
		.io_in_uop_bits_is_sfb(_slots_3_io_out_uop_is_sfb),
		.io_in_uop_bits_is_fence(_slots_3_io_out_uop_is_fence),
		.io_in_uop_bits_is_fencei(_slots_3_io_out_uop_is_fencei),
		.io_in_uop_bits_is_sfence(_slots_3_io_out_uop_is_sfence),
		.io_in_uop_bits_is_amo(_slots_3_io_out_uop_is_amo),
		.io_in_uop_bits_is_eret(_slots_3_io_out_uop_is_eret),
		.io_in_uop_bits_is_sys_pc2epc(_slots_3_io_out_uop_is_sys_pc2epc),
		.io_in_uop_bits_is_rocc(_slots_3_io_out_uop_is_rocc),
		.io_in_uop_bits_is_mov(_slots_3_io_out_uop_is_mov),
		.io_in_uop_bits_ftq_idx(_slots_3_io_out_uop_ftq_idx),
		.io_in_uop_bits_edge_inst(_slots_3_io_out_uop_edge_inst),
		.io_in_uop_bits_pc_lob(_slots_3_io_out_uop_pc_lob),
		.io_in_uop_bits_taken(_slots_3_io_out_uop_taken),
		.io_in_uop_bits_imm_rename(_slots_3_io_out_uop_imm_rename),
		.io_in_uop_bits_imm_sel(_slots_3_io_out_uop_imm_sel),
		.io_in_uop_bits_pimm(_slots_3_io_out_uop_pimm),
		.io_in_uop_bits_imm_packed(_slots_3_io_out_uop_imm_packed),
		.io_in_uop_bits_op1_sel(_slots_3_io_out_uop_op1_sel),
		.io_in_uop_bits_op2_sel(_slots_3_io_out_uop_op2_sel),
		.io_in_uop_bits_fp_ctrl_ldst(_slots_3_io_out_uop_fp_ctrl_ldst),
		.io_in_uop_bits_fp_ctrl_wen(_slots_3_io_out_uop_fp_ctrl_wen),
		.io_in_uop_bits_fp_ctrl_ren1(_slots_3_io_out_uop_fp_ctrl_ren1),
		.io_in_uop_bits_fp_ctrl_ren2(_slots_3_io_out_uop_fp_ctrl_ren2),
		.io_in_uop_bits_fp_ctrl_ren3(_slots_3_io_out_uop_fp_ctrl_ren3),
		.io_in_uop_bits_fp_ctrl_swap12(_slots_3_io_out_uop_fp_ctrl_swap12),
		.io_in_uop_bits_fp_ctrl_swap23(_slots_3_io_out_uop_fp_ctrl_swap23),
		.io_in_uop_bits_fp_ctrl_typeTagIn(_slots_3_io_out_uop_fp_ctrl_typeTagIn),
		.io_in_uop_bits_fp_ctrl_typeTagOut(_slots_3_io_out_uop_fp_ctrl_typeTagOut),
		.io_in_uop_bits_fp_ctrl_fromint(_slots_3_io_out_uop_fp_ctrl_fromint),
		.io_in_uop_bits_fp_ctrl_toint(_slots_3_io_out_uop_fp_ctrl_toint),
		.io_in_uop_bits_fp_ctrl_fastpipe(_slots_3_io_out_uop_fp_ctrl_fastpipe),
		.io_in_uop_bits_fp_ctrl_fma(_slots_3_io_out_uop_fp_ctrl_fma),
		.io_in_uop_bits_fp_ctrl_div(_slots_3_io_out_uop_fp_ctrl_div),
		.io_in_uop_bits_fp_ctrl_sqrt(_slots_3_io_out_uop_fp_ctrl_sqrt),
		.io_in_uop_bits_fp_ctrl_wflags(_slots_3_io_out_uop_fp_ctrl_wflags),
		.io_in_uop_bits_fp_ctrl_vec(_slots_3_io_out_uop_fp_ctrl_vec),
		.io_in_uop_bits_rob_idx(_slots_3_io_out_uop_rob_idx),
		.io_in_uop_bits_ldq_idx(_slots_3_io_out_uop_ldq_idx),
		.io_in_uop_bits_stq_idx(_slots_3_io_out_uop_stq_idx),
		.io_in_uop_bits_rxq_idx(_slots_3_io_out_uop_rxq_idx),
		.io_in_uop_bits_pdst(_slots_3_io_out_uop_pdst),
		.io_in_uop_bits_prs1(_slots_3_io_out_uop_prs1),
		.io_in_uop_bits_prs2(_slots_3_io_out_uop_prs2),
		.io_in_uop_bits_prs3(_slots_3_io_out_uop_prs3),
		.io_in_uop_bits_ppred(_slots_3_io_out_uop_ppred),
		.io_in_uop_bits_prs1_busy(_slots_3_io_out_uop_prs1_busy),
		.io_in_uop_bits_prs2_busy(_slots_3_io_out_uop_prs2_busy),
		.io_in_uop_bits_prs3_busy(_slots_3_io_out_uop_prs3_busy),
		.io_in_uop_bits_ppred_busy(_slots_3_io_out_uop_ppred_busy),
		.io_in_uop_bits_stale_pdst(_slots_3_io_out_uop_stale_pdst),
		.io_in_uop_bits_exception(_slots_3_io_out_uop_exception),
		.io_in_uop_bits_exc_cause(_slots_3_io_out_uop_exc_cause),
		.io_in_uop_bits_mem_cmd(_slots_3_io_out_uop_mem_cmd),
		.io_in_uop_bits_mem_size(_slots_3_io_out_uop_mem_size),
		.io_in_uop_bits_mem_signed(_slots_3_io_out_uop_mem_signed),
		.io_in_uop_bits_uses_ldq(_slots_3_io_out_uop_uses_ldq),
		.io_in_uop_bits_uses_stq(_slots_3_io_out_uop_uses_stq),
		.io_in_uop_bits_is_unique(_slots_3_io_out_uop_is_unique),
		.io_in_uop_bits_flush_on_commit(_slots_3_io_out_uop_flush_on_commit),
		.io_in_uop_bits_csr_cmd(_slots_3_io_out_uop_csr_cmd),
		.io_in_uop_bits_ldst_is_rs1(_slots_3_io_out_uop_ldst_is_rs1),
		.io_in_uop_bits_ldst(_slots_3_io_out_uop_ldst),
		.io_in_uop_bits_lrs1(_slots_3_io_out_uop_lrs1),
		.io_in_uop_bits_lrs2(_slots_3_io_out_uop_lrs2),
		.io_in_uop_bits_lrs3(_slots_3_io_out_uop_lrs3),
		.io_in_uop_bits_dst_rtype(_slots_3_io_out_uop_dst_rtype),
		.io_in_uop_bits_lrs1_rtype(_slots_3_io_out_uop_lrs1_rtype),
		.io_in_uop_bits_lrs2_rtype(_slots_3_io_out_uop_lrs2_rtype),
		.io_in_uop_bits_frs3_en(_slots_3_io_out_uop_frs3_en),
		.io_in_uop_bits_fcn_dw(_slots_3_io_out_uop_fcn_dw),
		.io_in_uop_bits_fcn_op(_slots_3_io_out_uop_fcn_op),
		.io_in_uop_bits_fp_val(_slots_3_io_out_uop_fp_val),
		.io_in_uop_bits_xcpt_pf_if(_slots_3_io_out_uop_xcpt_pf_if),
		.io_in_uop_bits_xcpt_ae_if(_slots_3_io_out_uop_xcpt_ae_if),
		.io_in_uop_bits_xcpt_ma_if(_slots_3_io_out_uop_xcpt_ma_if),
		.io_in_uop_bits_bp_debug_if(_slots_3_io_out_uop_bp_debug_if),
		.io_in_uop_bits_bp_xcpt_if(_slots_3_io_out_uop_bp_xcpt_if),
		.io_in_uop_bits_debug_fsrc(_slots_3_io_out_uop_debug_fsrc),
		.io_in_uop_bits_debug_tsrc(_slots_3_io_out_uop_debug_tsrc),
		.io_out_uop_inst(_slots_2_io_out_uop_inst),
		.io_out_uop_debug_inst(_slots_2_io_out_uop_debug_inst),
		.io_out_uop_is_rvc(_slots_2_io_out_uop_is_rvc),
		.io_out_uop_debug_pc(_slots_2_io_out_uop_debug_pc),
		.io_out_uop_iq_type_0(_slots_2_io_out_uop_iq_type_0),
		.io_out_uop_iq_type_1(_slots_2_io_out_uop_iq_type_1),
		.io_out_uop_iq_type_2(_slots_2_io_out_uop_iq_type_2),
		.io_out_uop_iq_type_3(_slots_2_io_out_uop_iq_type_3),
		.io_out_uop_fu_code_0(_slots_2_io_out_uop_fu_code_0),
		.io_out_uop_fu_code_1(_slots_2_io_out_uop_fu_code_1),
		.io_out_uop_fu_code_2(_slots_2_io_out_uop_fu_code_2),
		.io_out_uop_fu_code_3(_slots_2_io_out_uop_fu_code_3),
		.io_out_uop_fu_code_4(_slots_2_io_out_uop_fu_code_4),
		.io_out_uop_fu_code_5(_slots_2_io_out_uop_fu_code_5),
		.io_out_uop_fu_code_6(_slots_2_io_out_uop_fu_code_6),
		.io_out_uop_fu_code_7(_slots_2_io_out_uop_fu_code_7),
		.io_out_uop_fu_code_8(_slots_2_io_out_uop_fu_code_8),
		.io_out_uop_fu_code_9(_slots_2_io_out_uop_fu_code_9),
		.io_out_uop_iw_issued(_slots_2_io_out_uop_iw_issued),
		.io_out_uop_iw_p1_speculative_child(_slots_2_io_out_uop_iw_p1_speculative_child),
		.io_out_uop_iw_p2_speculative_child(_slots_2_io_out_uop_iw_p2_speculative_child),
		.io_out_uop_iw_p1_bypass_hint(_slots_2_io_out_uop_iw_p1_bypass_hint),
		.io_out_uop_iw_p2_bypass_hint(_slots_2_io_out_uop_iw_p2_bypass_hint),
		.io_out_uop_iw_p3_bypass_hint(_slots_2_io_out_uop_iw_p3_bypass_hint),
		.io_out_uop_dis_col_sel(_slots_2_io_out_uop_dis_col_sel),
		.io_out_uop_br_mask(_slots_2_io_out_uop_br_mask),
		.io_out_uop_br_tag(_slots_2_io_out_uop_br_tag),
		.io_out_uop_br_type(_slots_2_io_out_uop_br_type),
		.io_out_uop_is_sfb(_slots_2_io_out_uop_is_sfb),
		.io_out_uop_is_fence(_slots_2_io_out_uop_is_fence),
		.io_out_uop_is_fencei(_slots_2_io_out_uop_is_fencei),
		.io_out_uop_is_sfence(_slots_2_io_out_uop_is_sfence),
		.io_out_uop_is_amo(_slots_2_io_out_uop_is_amo),
		.io_out_uop_is_eret(_slots_2_io_out_uop_is_eret),
		.io_out_uop_is_sys_pc2epc(_slots_2_io_out_uop_is_sys_pc2epc),
		.io_out_uop_is_rocc(_slots_2_io_out_uop_is_rocc),
		.io_out_uop_is_mov(_slots_2_io_out_uop_is_mov),
		.io_out_uop_ftq_idx(_slots_2_io_out_uop_ftq_idx),
		.io_out_uop_edge_inst(_slots_2_io_out_uop_edge_inst),
		.io_out_uop_pc_lob(_slots_2_io_out_uop_pc_lob),
		.io_out_uop_taken(_slots_2_io_out_uop_taken),
		.io_out_uop_imm_rename(_slots_2_io_out_uop_imm_rename),
		.io_out_uop_imm_sel(_slots_2_io_out_uop_imm_sel),
		.io_out_uop_pimm(_slots_2_io_out_uop_pimm),
		.io_out_uop_imm_packed(_slots_2_io_out_uop_imm_packed),
		.io_out_uop_op1_sel(_slots_2_io_out_uop_op1_sel),
		.io_out_uop_op2_sel(_slots_2_io_out_uop_op2_sel),
		.io_out_uop_fp_ctrl_ldst(_slots_2_io_out_uop_fp_ctrl_ldst),
		.io_out_uop_fp_ctrl_wen(_slots_2_io_out_uop_fp_ctrl_wen),
		.io_out_uop_fp_ctrl_ren1(_slots_2_io_out_uop_fp_ctrl_ren1),
		.io_out_uop_fp_ctrl_ren2(_slots_2_io_out_uop_fp_ctrl_ren2),
		.io_out_uop_fp_ctrl_ren3(_slots_2_io_out_uop_fp_ctrl_ren3),
		.io_out_uop_fp_ctrl_swap12(_slots_2_io_out_uop_fp_ctrl_swap12),
		.io_out_uop_fp_ctrl_swap23(_slots_2_io_out_uop_fp_ctrl_swap23),
		.io_out_uop_fp_ctrl_typeTagIn(_slots_2_io_out_uop_fp_ctrl_typeTagIn),
		.io_out_uop_fp_ctrl_typeTagOut(_slots_2_io_out_uop_fp_ctrl_typeTagOut),
		.io_out_uop_fp_ctrl_fromint(_slots_2_io_out_uop_fp_ctrl_fromint),
		.io_out_uop_fp_ctrl_toint(_slots_2_io_out_uop_fp_ctrl_toint),
		.io_out_uop_fp_ctrl_fastpipe(_slots_2_io_out_uop_fp_ctrl_fastpipe),
		.io_out_uop_fp_ctrl_fma(_slots_2_io_out_uop_fp_ctrl_fma),
		.io_out_uop_fp_ctrl_div(_slots_2_io_out_uop_fp_ctrl_div),
		.io_out_uop_fp_ctrl_sqrt(_slots_2_io_out_uop_fp_ctrl_sqrt),
		.io_out_uop_fp_ctrl_wflags(_slots_2_io_out_uop_fp_ctrl_wflags),
		.io_out_uop_fp_ctrl_vec(_slots_2_io_out_uop_fp_ctrl_vec),
		.io_out_uop_rob_idx(_slots_2_io_out_uop_rob_idx),
		.io_out_uop_ldq_idx(_slots_2_io_out_uop_ldq_idx),
		.io_out_uop_stq_idx(_slots_2_io_out_uop_stq_idx),
		.io_out_uop_rxq_idx(_slots_2_io_out_uop_rxq_idx),
		.io_out_uop_pdst(_slots_2_io_out_uop_pdst),
		.io_out_uop_prs1(_slots_2_io_out_uop_prs1),
		.io_out_uop_prs2(_slots_2_io_out_uop_prs2),
		.io_out_uop_prs3(_slots_2_io_out_uop_prs3),
		.io_out_uop_ppred(_slots_2_io_out_uop_ppred),
		.io_out_uop_prs1_busy(_slots_2_io_out_uop_prs1_busy),
		.io_out_uop_prs2_busy(_slots_2_io_out_uop_prs2_busy),
		.io_out_uop_prs3_busy(_slots_2_io_out_uop_prs3_busy),
		.io_out_uop_ppred_busy(_slots_2_io_out_uop_ppred_busy),
		.io_out_uop_stale_pdst(_slots_2_io_out_uop_stale_pdst),
		.io_out_uop_exception(_slots_2_io_out_uop_exception),
		.io_out_uop_exc_cause(_slots_2_io_out_uop_exc_cause),
		.io_out_uop_mem_cmd(_slots_2_io_out_uop_mem_cmd),
		.io_out_uop_mem_size(_slots_2_io_out_uop_mem_size),
		.io_out_uop_mem_signed(_slots_2_io_out_uop_mem_signed),
		.io_out_uop_uses_ldq(_slots_2_io_out_uop_uses_ldq),
		.io_out_uop_uses_stq(_slots_2_io_out_uop_uses_stq),
		.io_out_uop_is_unique(_slots_2_io_out_uop_is_unique),
		.io_out_uop_flush_on_commit(_slots_2_io_out_uop_flush_on_commit),
		.io_out_uop_csr_cmd(_slots_2_io_out_uop_csr_cmd),
		.io_out_uop_ldst_is_rs1(_slots_2_io_out_uop_ldst_is_rs1),
		.io_out_uop_ldst(_slots_2_io_out_uop_ldst),
		.io_out_uop_lrs1(_slots_2_io_out_uop_lrs1),
		.io_out_uop_lrs2(_slots_2_io_out_uop_lrs2),
		.io_out_uop_lrs3(_slots_2_io_out_uop_lrs3),
		.io_out_uop_dst_rtype(_slots_2_io_out_uop_dst_rtype),
		.io_out_uop_lrs1_rtype(_slots_2_io_out_uop_lrs1_rtype),
		.io_out_uop_lrs2_rtype(_slots_2_io_out_uop_lrs2_rtype),
		.io_out_uop_frs3_en(_slots_2_io_out_uop_frs3_en),
		.io_out_uop_fcn_dw(_slots_2_io_out_uop_fcn_dw),
		.io_out_uop_fcn_op(_slots_2_io_out_uop_fcn_op),
		.io_out_uop_fp_val(_slots_2_io_out_uop_fp_val),
		.io_out_uop_xcpt_pf_if(_slots_2_io_out_uop_xcpt_pf_if),
		.io_out_uop_xcpt_ae_if(_slots_2_io_out_uop_xcpt_ae_if),
		.io_out_uop_xcpt_ma_if(_slots_2_io_out_uop_xcpt_ma_if),
		.io_out_uop_bp_debug_if(_slots_2_io_out_uop_bp_debug_if),
		.io_out_uop_bp_xcpt_if(_slots_2_io_out_uop_bp_xcpt_if),
		.io_out_uop_debug_fsrc(_slots_2_io_out_uop_debug_fsrc),
		.io_out_uop_debug_tsrc(_slots_2_io_out_uop_debug_tsrc),
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
		.io_pred_wakeup_port_valid(io_pred_wakeup_port_valid),
		.io_pred_wakeup_port_bits(io_pred_wakeup_port_bits),
		.io_child_rebusys(io_child_rebusys)
	);
	IssueSlot_16 slots_3(
		.clock(clock),
		.reset(reset),
		.io_valid(_slots_3_io_valid),
		.io_will_be_valid(_slots_3_io_will_be_valid),
		.io_request(_slots_3_io_request),
		.io_grant(issue_slots_3_grant),
		.io_iss_uop_inst(),
		.io_iss_uop_debug_inst(),
		.io_iss_uop_is_rvc(_slots_3_io_iss_uop_is_rvc),
		.io_iss_uop_debug_pc(),
		.io_iss_uop_iq_type_0(),
		.io_iss_uop_iq_type_1(),
		.io_iss_uop_iq_type_2(),
		.io_iss_uop_iq_type_3(),
		.io_iss_uop_fu_code_0(_slots_3_io_iss_uop_fu_code_0),
		.io_iss_uop_fu_code_1(),
		.io_iss_uop_fu_code_2(),
		.io_iss_uop_fu_code_3(),
		.io_iss_uop_fu_code_4(),
		.io_iss_uop_fu_code_5(),
		.io_iss_uop_fu_code_6(),
		.io_iss_uop_fu_code_7(),
		.io_iss_uop_fu_code_8(),
		.io_iss_uop_fu_code_9(),
		.io_iss_uop_iw_issued(),
		.io_iss_uop_iw_p1_speculative_child(),
		.io_iss_uop_iw_p2_speculative_child(),
		.io_iss_uop_iw_p1_bypass_hint(_slots_3_io_iss_uop_iw_p1_bypass_hint),
		.io_iss_uop_iw_p2_bypass_hint(_slots_3_io_iss_uop_iw_p2_bypass_hint),
		.io_iss_uop_iw_p3_bypass_hint(),
		.io_iss_uop_dis_col_sel(),
		.io_iss_uop_br_mask(_slots_3_io_iss_uop_br_mask),
		.io_iss_uop_br_tag(_slots_3_io_iss_uop_br_tag),
		.io_iss_uop_br_type(_slots_3_io_iss_uop_br_type),
		.io_iss_uop_is_sfb(_slots_3_io_iss_uop_is_sfb),
		.io_iss_uop_is_fence(),
		.io_iss_uop_is_fencei(),
		.io_iss_uop_is_sfence(),
		.io_iss_uop_is_amo(),
		.io_iss_uop_is_eret(),
		.io_iss_uop_is_sys_pc2epc(),
		.io_iss_uop_is_rocc(),
		.io_iss_uop_is_mov(_slots_3_io_iss_uop_is_mov),
		.io_iss_uop_ftq_idx(_slots_3_io_iss_uop_ftq_idx),
		.io_iss_uop_edge_inst(_slots_3_io_iss_uop_edge_inst),
		.io_iss_uop_pc_lob(_slots_3_io_iss_uop_pc_lob),
		.io_iss_uop_taken(_slots_3_io_iss_uop_taken),
		.io_iss_uop_imm_rename(),
		.io_iss_uop_imm_sel(_slots_3_io_iss_uop_imm_sel),
		.io_iss_uop_pimm(_slots_3_io_iss_uop_pimm),
		.io_iss_uop_imm_packed(),
		.io_iss_uop_op1_sel(_slots_3_io_iss_uop_op1_sel),
		.io_iss_uop_op2_sel(_slots_3_io_iss_uop_op2_sel),
		.io_iss_uop_fp_ctrl_ldst(),
		.io_iss_uop_fp_ctrl_wen(),
		.io_iss_uop_fp_ctrl_ren1(),
		.io_iss_uop_fp_ctrl_ren2(),
		.io_iss_uop_fp_ctrl_ren3(),
		.io_iss_uop_fp_ctrl_swap12(),
		.io_iss_uop_fp_ctrl_swap23(),
		.io_iss_uop_fp_ctrl_typeTagIn(),
		.io_iss_uop_fp_ctrl_typeTagOut(),
		.io_iss_uop_fp_ctrl_fromint(),
		.io_iss_uop_fp_ctrl_toint(),
		.io_iss_uop_fp_ctrl_fastpipe(),
		.io_iss_uop_fp_ctrl_fma(),
		.io_iss_uop_fp_ctrl_div(),
		.io_iss_uop_fp_ctrl_sqrt(),
		.io_iss_uop_fp_ctrl_wflags(),
		.io_iss_uop_fp_ctrl_vec(),
		.io_iss_uop_rob_idx(_slots_3_io_iss_uop_rob_idx),
		.io_iss_uop_ldq_idx(),
		.io_iss_uop_stq_idx(),
		.io_iss_uop_rxq_idx(),
		.io_iss_uop_pdst(_slots_3_io_iss_uop_pdst),
		.io_iss_uop_prs1(_slots_3_io_iss_uop_prs1),
		.io_iss_uop_prs2(_slots_3_io_iss_uop_prs2),
		.io_iss_uop_prs3(),
		.io_iss_uop_ppred(_slots_3_io_iss_uop_ppred),
		.io_iss_uop_prs1_busy(),
		.io_iss_uop_prs2_busy(),
		.io_iss_uop_prs3_busy(),
		.io_iss_uop_ppred_busy(),
		.io_iss_uop_stale_pdst(),
		.io_iss_uop_exception(),
		.io_iss_uop_exc_cause(),
		.io_iss_uop_mem_cmd(),
		.io_iss_uop_mem_size(),
		.io_iss_uop_mem_signed(),
		.io_iss_uop_uses_ldq(),
		.io_iss_uop_uses_stq(),
		.io_iss_uop_is_unique(),
		.io_iss_uop_flush_on_commit(),
		.io_iss_uop_csr_cmd(_slots_3_io_iss_uop_csr_cmd),
		.io_iss_uop_ldst_is_rs1(_slots_3_io_iss_uop_ldst_is_rs1),
		.io_iss_uop_ldst(),
		.io_iss_uop_lrs1(),
		.io_iss_uop_lrs2(),
		.io_iss_uop_lrs3(),
		.io_iss_uop_dst_rtype(_slots_3_io_iss_uop_dst_rtype),
		.io_iss_uop_lrs1_rtype(_slots_3_io_iss_uop_lrs1_rtype),
		.io_iss_uop_lrs2_rtype(_slots_3_io_iss_uop_lrs2_rtype),
		.io_iss_uop_frs3_en(),
		.io_iss_uop_fcn_dw(_slots_3_io_iss_uop_fcn_dw),
		.io_iss_uop_fcn_op(_slots_3_io_iss_uop_fcn_op),
		.io_iss_uop_fp_val(),
		.io_iss_uop_xcpt_pf_if(),
		.io_iss_uop_xcpt_ae_if(),
		.io_iss_uop_xcpt_ma_if(),
		.io_iss_uop_bp_debug_if(),
		.io_iss_uop_bp_xcpt_if(),
		.io_iss_uop_debug_fsrc(),
		.io_iss_uop_debug_tsrc(),
		.io_in_uop_valid(issue_slots_3_in_uop_valid),
		.io_in_uop_bits_inst(_slots_4_io_out_uop_inst),
		.io_in_uop_bits_debug_inst(_slots_4_io_out_uop_debug_inst),
		.io_in_uop_bits_is_rvc(_slots_4_io_out_uop_is_rvc),
		.io_in_uop_bits_debug_pc(_slots_4_io_out_uop_debug_pc),
		.io_in_uop_bits_iq_type_0(_slots_4_io_out_uop_iq_type_0),
		.io_in_uop_bits_iq_type_1(_slots_4_io_out_uop_iq_type_1),
		.io_in_uop_bits_iq_type_2(_slots_4_io_out_uop_iq_type_2),
		.io_in_uop_bits_iq_type_3(_slots_4_io_out_uop_iq_type_3),
		.io_in_uop_bits_fu_code_0(_slots_4_io_out_uop_fu_code_0),
		.io_in_uop_bits_fu_code_1(_slots_4_io_out_uop_fu_code_1),
		.io_in_uop_bits_fu_code_2(_slots_4_io_out_uop_fu_code_2),
		.io_in_uop_bits_fu_code_3(_slots_4_io_out_uop_fu_code_3),
		.io_in_uop_bits_fu_code_4(_slots_4_io_out_uop_fu_code_4),
		.io_in_uop_bits_fu_code_5(_slots_4_io_out_uop_fu_code_5),
		.io_in_uop_bits_fu_code_6(_slots_4_io_out_uop_fu_code_6),
		.io_in_uop_bits_fu_code_7(_slots_4_io_out_uop_fu_code_7),
		.io_in_uop_bits_fu_code_8(_slots_4_io_out_uop_fu_code_8),
		.io_in_uop_bits_fu_code_9(_slots_4_io_out_uop_fu_code_9),
		.io_in_uop_bits_iw_issued(_slots_4_io_out_uop_iw_issued),
		.io_in_uop_bits_iw_p1_speculative_child(_slots_4_io_out_uop_iw_p1_speculative_child),
		.io_in_uop_bits_iw_p2_speculative_child(_slots_4_io_out_uop_iw_p2_speculative_child),
		.io_in_uop_bits_iw_p1_bypass_hint(_slots_4_io_out_uop_iw_p1_bypass_hint),
		.io_in_uop_bits_iw_p2_bypass_hint(_slots_4_io_out_uop_iw_p2_bypass_hint),
		.io_in_uop_bits_iw_p3_bypass_hint(_slots_4_io_out_uop_iw_p3_bypass_hint),
		.io_in_uop_bits_dis_col_sel(_slots_4_io_out_uop_dis_col_sel),
		.io_in_uop_bits_br_mask(_slots_4_io_out_uop_br_mask),
		.io_in_uop_bits_br_tag(_slots_4_io_out_uop_br_tag),
		.io_in_uop_bits_br_type(_slots_4_io_out_uop_br_type),
		.io_in_uop_bits_is_sfb(_slots_4_io_out_uop_is_sfb),
		.io_in_uop_bits_is_fence(_slots_4_io_out_uop_is_fence),
		.io_in_uop_bits_is_fencei(_slots_4_io_out_uop_is_fencei),
		.io_in_uop_bits_is_sfence(_slots_4_io_out_uop_is_sfence),
		.io_in_uop_bits_is_amo(_slots_4_io_out_uop_is_amo),
		.io_in_uop_bits_is_eret(_slots_4_io_out_uop_is_eret),
		.io_in_uop_bits_is_sys_pc2epc(_slots_4_io_out_uop_is_sys_pc2epc),
		.io_in_uop_bits_is_rocc(_slots_4_io_out_uop_is_rocc),
		.io_in_uop_bits_is_mov(_slots_4_io_out_uop_is_mov),
		.io_in_uop_bits_ftq_idx(_slots_4_io_out_uop_ftq_idx),
		.io_in_uop_bits_edge_inst(_slots_4_io_out_uop_edge_inst),
		.io_in_uop_bits_pc_lob(_slots_4_io_out_uop_pc_lob),
		.io_in_uop_bits_taken(_slots_4_io_out_uop_taken),
		.io_in_uop_bits_imm_rename(_slots_4_io_out_uop_imm_rename),
		.io_in_uop_bits_imm_sel(_slots_4_io_out_uop_imm_sel),
		.io_in_uop_bits_pimm(_slots_4_io_out_uop_pimm),
		.io_in_uop_bits_imm_packed(_slots_4_io_out_uop_imm_packed),
		.io_in_uop_bits_op1_sel(_slots_4_io_out_uop_op1_sel),
		.io_in_uop_bits_op2_sel(_slots_4_io_out_uop_op2_sel),
		.io_in_uop_bits_fp_ctrl_ldst(_slots_4_io_out_uop_fp_ctrl_ldst),
		.io_in_uop_bits_fp_ctrl_wen(_slots_4_io_out_uop_fp_ctrl_wen),
		.io_in_uop_bits_fp_ctrl_ren1(_slots_4_io_out_uop_fp_ctrl_ren1),
		.io_in_uop_bits_fp_ctrl_ren2(_slots_4_io_out_uop_fp_ctrl_ren2),
		.io_in_uop_bits_fp_ctrl_ren3(_slots_4_io_out_uop_fp_ctrl_ren3),
		.io_in_uop_bits_fp_ctrl_swap12(_slots_4_io_out_uop_fp_ctrl_swap12),
		.io_in_uop_bits_fp_ctrl_swap23(_slots_4_io_out_uop_fp_ctrl_swap23),
		.io_in_uop_bits_fp_ctrl_typeTagIn(_slots_4_io_out_uop_fp_ctrl_typeTagIn),
		.io_in_uop_bits_fp_ctrl_typeTagOut(_slots_4_io_out_uop_fp_ctrl_typeTagOut),
		.io_in_uop_bits_fp_ctrl_fromint(_slots_4_io_out_uop_fp_ctrl_fromint),
		.io_in_uop_bits_fp_ctrl_toint(_slots_4_io_out_uop_fp_ctrl_toint),
		.io_in_uop_bits_fp_ctrl_fastpipe(_slots_4_io_out_uop_fp_ctrl_fastpipe),
		.io_in_uop_bits_fp_ctrl_fma(_slots_4_io_out_uop_fp_ctrl_fma),
		.io_in_uop_bits_fp_ctrl_div(_slots_4_io_out_uop_fp_ctrl_div),
		.io_in_uop_bits_fp_ctrl_sqrt(_slots_4_io_out_uop_fp_ctrl_sqrt),
		.io_in_uop_bits_fp_ctrl_wflags(_slots_4_io_out_uop_fp_ctrl_wflags),
		.io_in_uop_bits_fp_ctrl_vec(_slots_4_io_out_uop_fp_ctrl_vec),
		.io_in_uop_bits_rob_idx(_slots_4_io_out_uop_rob_idx),
		.io_in_uop_bits_ldq_idx(_slots_4_io_out_uop_ldq_idx),
		.io_in_uop_bits_stq_idx(_slots_4_io_out_uop_stq_idx),
		.io_in_uop_bits_rxq_idx(_slots_4_io_out_uop_rxq_idx),
		.io_in_uop_bits_pdst(_slots_4_io_out_uop_pdst),
		.io_in_uop_bits_prs1(_slots_4_io_out_uop_prs1),
		.io_in_uop_bits_prs2(_slots_4_io_out_uop_prs2),
		.io_in_uop_bits_prs3(_slots_4_io_out_uop_prs3),
		.io_in_uop_bits_ppred(_slots_4_io_out_uop_ppred),
		.io_in_uop_bits_prs1_busy(_slots_4_io_out_uop_prs1_busy),
		.io_in_uop_bits_prs2_busy(_slots_4_io_out_uop_prs2_busy),
		.io_in_uop_bits_prs3_busy(_slots_4_io_out_uop_prs3_busy),
		.io_in_uop_bits_ppred_busy(_slots_4_io_out_uop_ppred_busy),
		.io_in_uop_bits_stale_pdst(_slots_4_io_out_uop_stale_pdst),
		.io_in_uop_bits_exception(_slots_4_io_out_uop_exception),
		.io_in_uop_bits_exc_cause(_slots_4_io_out_uop_exc_cause),
		.io_in_uop_bits_mem_cmd(_slots_4_io_out_uop_mem_cmd),
		.io_in_uop_bits_mem_size(_slots_4_io_out_uop_mem_size),
		.io_in_uop_bits_mem_signed(_slots_4_io_out_uop_mem_signed),
		.io_in_uop_bits_uses_ldq(_slots_4_io_out_uop_uses_ldq),
		.io_in_uop_bits_uses_stq(_slots_4_io_out_uop_uses_stq),
		.io_in_uop_bits_is_unique(_slots_4_io_out_uop_is_unique),
		.io_in_uop_bits_flush_on_commit(_slots_4_io_out_uop_flush_on_commit),
		.io_in_uop_bits_csr_cmd(_slots_4_io_out_uop_csr_cmd),
		.io_in_uop_bits_ldst_is_rs1(_slots_4_io_out_uop_ldst_is_rs1),
		.io_in_uop_bits_ldst(_slots_4_io_out_uop_ldst),
		.io_in_uop_bits_lrs1(_slots_4_io_out_uop_lrs1),
		.io_in_uop_bits_lrs2(_slots_4_io_out_uop_lrs2),
		.io_in_uop_bits_lrs3(_slots_4_io_out_uop_lrs3),
		.io_in_uop_bits_dst_rtype(_slots_4_io_out_uop_dst_rtype),
		.io_in_uop_bits_lrs1_rtype(_slots_4_io_out_uop_lrs1_rtype),
		.io_in_uop_bits_lrs2_rtype(_slots_4_io_out_uop_lrs2_rtype),
		.io_in_uop_bits_frs3_en(_slots_4_io_out_uop_frs3_en),
		.io_in_uop_bits_fcn_dw(_slots_4_io_out_uop_fcn_dw),
		.io_in_uop_bits_fcn_op(_slots_4_io_out_uop_fcn_op),
		.io_in_uop_bits_fp_val(_slots_4_io_out_uop_fp_val),
		.io_in_uop_bits_xcpt_pf_if(_slots_4_io_out_uop_xcpt_pf_if),
		.io_in_uop_bits_xcpt_ae_if(_slots_4_io_out_uop_xcpt_ae_if),
		.io_in_uop_bits_xcpt_ma_if(_slots_4_io_out_uop_xcpt_ma_if),
		.io_in_uop_bits_bp_debug_if(_slots_4_io_out_uop_bp_debug_if),
		.io_in_uop_bits_bp_xcpt_if(_slots_4_io_out_uop_bp_xcpt_if),
		.io_in_uop_bits_debug_fsrc(_slots_4_io_out_uop_debug_fsrc),
		.io_in_uop_bits_debug_tsrc(_slots_4_io_out_uop_debug_tsrc),
		.io_out_uop_inst(_slots_3_io_out_uop_inst),
		.io_out_uop_debug_inst(_slots_3_io_out_uop_debug_inst),
		.io_out_uop_is_rvc(_slots_3_io_out_uop_is_rvc),
		.io_out_uop_debug_pc(_slots_3_io_out_uop_debug_pc),
		.io_out_uop_iq_type_0(_slots_3_io_out_uop_iq_type_0),
		.io_out_uop_iq_type_1(_slots_3_io_out_uop_iq_type_1),
		.io_out_uop_iq_type_2(_slots_3_io_out_uop_iq_type_2),
		.io_out_uop_iq_type_3(_slots_3_io_out_uop_iq_type_3),
		.io_out_uop_fu_code_0(_slots_3_io_out_uop_fu_code_0),
		.io_out_uop_fu_code_1(_slots_3_io_out_uop_fu_code_1),
		.io_out_uop_fu_code_2(_slots_3_io_out_uop_fu_code_2),
		.io_out_uop_fu_code_3(_slots_3_io_out_uop_fu_code_3),
		.io_out_uop_fu_code_4(_slots_3_io_out_uop_fu_code_4),
		.io_out_uop_fu_code_5(_slots_3_io_out_uop_fu_code_5),
		.io_out_uop_fu_code_6(_slots_3_io_out_uop_fu_code_6),
		.io_out_uop_fu_code_7(_slots_3_io_out_uop_fu_code_7),
		.io_out_uop_fu_code_8(_slots_3_io_out_uop_fu_code_8),
		.io_out_uop_fu_code_9(_slots_3_io_out_uop_fu_code_9),
		.io_out_uop_iw_issued(_slots_3_io_out_uop_iw_issued),
		.io_out_uop_iw_p1_speculative_child(_slots_3_io_out_uop_iw_p1_speculative_child),
		.io_out_uop_iw_p2_speculative_child(_slots_3_io_out_uop_iw_p2_speculative_child),
		.io_out_uop_iw_p1_bypass_hint(_slots_3_io_out_uop_iw_p1_bypass_hint),
		.io_out_uop_iw_p2_bypass_hint(_slots_3_io_out_uop_iw_p2_bypass_hint),
		.io_out_uop_iw_p3_bypass_hint(_slots_3_io_out_uop_iw_p3_bypass_hint),
		.io_out_uop_dis_col_sel(_slots_3_io_out_uop_dis_col_sel),
		.io_out_uop_br_mask(_slots_3_io_out_uop_br_mask),
		.io_out_uop_br_tag(_slots_3_io_out_uop_br_tag),
		.io_out_uop_br_type(_slots_3_io_out_uop_br_type),
		.io_out_uop_is_sfb(_slots_3_io_out_uop_is_sfb),
		.io_out_uop_is_fence(_slots_3_io_out_uop_is_fence),
		.io_out_uop_is_fencei(_slots_3_io_out_uop_is_fencei),
		.io_out_uop_is_sfence(_slots_3_io_out_uop_is_sfence),
		.io_out_uop_is_amo(_slots_3_io_out_uop_is_amo),
		.io_out_uop_is_eret(_slots_3_io_out_uop_is_eret),
		.io_out_uop_is_sys_pc2epc(_slots_3_io_out_uop_is_sys_pc2epc),
		.io_out_uop_is_rocc(_slots_3_io_out_uop_is_rocc),
		.io_out_uop_is_mov(_slots_3_io_out_uop_is_mov),
		.io_out_uop_ftq_idx(_slots_3_io_out_uop_ftq_idx),
		.io_out_uop_edge_inst(_slots_3_io_out_uop_edge_inst),
		.io_out_uop_pc_lob(_slots_3_io_out_uop_pc_lob),
		.io_out_uop_taken(_slots_3_io_out_uop_taken),
		.io_out_uop_imm_rename(_slots_3_io_out_uop_imm_rename),
		.io_out_uop_imm_sel(_slots_3_io_out_uop_imm_sel),
		.io_out_uop_pimm(_slots_3_io_out_uop_pimm),
		.io_out_uop_imm_packed(_slots_3_io_out_uop_imm_packed),
		.io_out_uop_op1_sel(_slots_3_io_out_uop_op1_sel),
		.io_out_uop_op2_sel(_slots_3_io_out_uop_op2_sel),
		.io_out_uop_fp_ctrl_ldst(_slots_3_io_out_uop_fp_ctrl_ldst),
		.io_out_uop_fp_ctrl_wen(_slots_3_io_out_uop_fp_ctrl_wen),
		.io_out_uop_fp_ctrl_ren1(_slots_3_io_out_uop_fp_ctrl_ren1),
		.io_out_uop_fp_ctrl_ren2(_slots_3_io_out_uop_fp_ctrl_ren2),
		.io_out_uop_fp_ctrl_ren3(_slots_3_io_out_uop_fp_ctrl_ren3),
		.io_out_uop_fp_ctrl_swap12(_slots_3_io_out_uop_fp_ctrl_swap12),
		.io_out_uop_fp_ctrl_swap23(_slots_3_io_out_uop_fp_ctrl_swap23),
		.io_out_uop_fp_ctrl_typeTagIn(_slots_3_io_out_uop_fp_ctrl_typeTagIn),
		.io_out_uop_fp_ctrl_typeTagOut(_slots_3_io_out_uop_fp_ctrl_typeTagOut),
		.io_out_uop_fp_ctrl_fromint(_slots_3_io_out_uop_fp_ctrl_fromint),
		.io_out_uop_fp_ctrl_toint(_slots_3_io_out_uop_fp_ctrl_toint),
		.io_out_uop_fp_ctrl_fastpipe(_slots_3_io_out_uop_fp_ctrl_fastpipe),
		.io_out_uop_fp_ctrl_fma(_slots_3_io_out_uop_fp_ctrl_fma),
		.io_out_uop_fp_ctrl_div(_slots_3_io_out_uop_fp_ctrl_div),
		.io_out_uop_fp_ctrl_sqrt(_slots_3_io_out_uop_fp_ctrl_sqrt),
		.io_out_uop_fp_ctrl_wflags(_slots_3_io_out_uop_fp_ctrl_wflags),
		.io_out_uop_fp_ctrl_vec(_slots_3_io_out_uop_fp_ctrl_vec),
		.io_out_uop_rob_idx(_slots_3_io_out_uop_rob_idx),
		.io_out_uop_ldq_idx(_slots_3_io_out_uop_ldq_idx),
		.io_out_uop_stq_idx(_slots_3_io_out_uop_stq_idx),
		.io_out_uop_rxq_idx(_slots_3_io_out_uop_rxq_idx),
		.io_out_uop_pdst(_slots_3_io_out_uop_pdst),
		.io_out_uop_prs1(_slots_3_io_out_uop_prs1),
		.io_out_uop_prs2(_slots_3_io_out_uop_prs2),
		.io_out_uop_prs3(_slots_3_io_out_uop_prs3),
		.io_out_uop_ppred(_slots_3_io_out_uop_ppred),
		.io_out_uop_prs1_busy(_slots_3_io_out_uop_prs1_busy),
		.io_out_uop_prs2_busy(_slots_3_io_out_uop_prs2_busy),
		.io_out_uop_prs3_busy(_slots_3_io_out_uop_prs3_busy),
		.io_out_uop_ppred_busy(_slots_3_io_out_uop_ppred_busy),
		.io_out_uop_stale_pdst(_slots_3_io_out_uop_stale_pdst),
		.io_out_uop_exception(_slots_3_io_out_uop_exception),
		.io_out_uop_exc_cause(_slots_3_io_out_uop_exc_cause),
		.io_out_uop_mem_cmd(_slots_3_io_out_uop_mem_cmd),
		.io_out_uop_mem_size(_slots_3_io_out_uop_mem_size),
		.io_out_uop_mem_signed(_slots_3_io_out_uop_mem_signed),
		.io_out_uop_uses_ldq(_slots_3_io_out_uop_uses_ldq),
		.io_out_uop_uses_stq(_slots_3_io_out_uop_uses_stq),
		.io_out_uop_is_unique(_slots_3_io_out_uop_is_unique),
		.io_out_uop_flush_on_commit(_slots_3_io_out_uop_flush_on_commit),
		.io_out_uop_csr_cmd(_slots_3_io_out_uop_csr_cmd),
		.io_out_uop_ldst_is_rs1(_slots_3_io_out_uop_ldst_is_rs1),
		.io_out_uop_ldst(_slots_3_io_out_uop_ldst),
		.io_out_uop_lrs1(_slots_3_io_out_uop_lrs1),
		.io_out_uop_lrs2(_slots_3_io_out_uop_lrs2),
		.io_out_uop_lrs3(_slots_3_io_out_uop_lrs3),
		.io_out_uop_dst_rtype(_slots_3_io_out_uop_dst_rtype),
		.io_out_uop_lrs1_rtype(_slots_3_io_out_uop_lrs1_rtype),
		.io_out_uop_lrs2_rtype(_slots_3_io_out_uop_lrs2_rtype),
		.io_out_uop_frs3_en(_slots_3_io_out_uop_frs3_en),
		.io_out_uop_fcn_dw(_slots_3_io_out_uop_fcn_dw),
		.io_out_uop_fcn_op(_slots_3_io_out_uop_fcn_op),
		.io_out_uop_fp_val(_slots_3_io_out_uop_fp_val),
		.io_out_uop_xcpt_pf_if(_slots_3_io_out_uop_xcpt_pf_if),
		.io_out_uop_xcpt_ae_if(_slots_3_io_out_uop_xcpt_ae_if),
		.io_out_uop_xcpt_ma_if(_slots_3_io_out_uop_xcpt_ma_if),
		.io_out_uop_bp_debug_if(_slots_3_io_out_uop_bp_debug_if),
		.io_out_uop_bp_xcpt_if(_slots_3_io_out_uop_bp_xcpt_if),
		.io_out_uop_debug_fsrc(_slots_3_io_out_uop_debug_fsrc),
		.io_out_uop_debug_tsrc(_slots_3_io_out_uop_debug_tsrc),
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
		.io_pred_wakeup_port_valid(io_pred_wakeup_port_valid),
		.io_pred_wakeup_port_bits(io_pred_wakeup_port_bits),
		.io_child_rebusys(io_child_rebusys)
	);
	IssueSlot_16 slots_4(
		.clock(clock),
		.reset(reset),
		.io_valid(_slots_4_io_valid),
		.io_will_be_valid(_slots_4_io_will_be_valid),
		.io_request(_slots_4_io_request),
		.io_grant(issue_slots_4_grant),
		.io_iss_uop_inst(),
		.io_iss_uop_debug_inst(),
		.io_iss_uop_is_rvc(_slots_4_io_iss_uop_is_rvc),
		.io_iss_uop_debug_pc(),
		.io_iss_uop_iq_type_0(),
		.io_iss_uop_iq_type_1(),
		.io_iss_uop_iq_type_2(),
		.io_iss_uop_iq_type_3(),
		.io_iss_uop_fu_code_0(_slots_4_io_iss_uop_fu_code_0),
		.io_iss_uop_fu_code_1(),
		.io_iss_uop_fu_code_2(),
		.io_iss_uop_fu_code_3(),
		.io_iss_uop_fu_code_4(),
		.io_iss_uop_fu_code_5(),
		.io_iss_uop_fu_code_6(),
		.io_iss_uop_fu_code_7(),
		.io_iss_uop_fu_code_8(),
		.io_iss_uop_fu_code_9(),
		.io_iss_uop_iw_issued(),
		.io_iss_uop_iw_p1_speculative_child(),
		.io_iss_uop_iw_p2_speculative_child(),
		.io_iss_uop_iw_p1_bypass_hint(_slots_4_io_iss_uop_iw_p1_bypass_hint),
		.io_iss_uop_iw_p2_bypass_hint(_slots_4_io_iss_uop_iw_p2_bypass_hint),
		.io_iss_uop_iw_p3_bypass_hint(),
		.io_iss_uop_dis_col_sel(),
		.io_iss_uop_br_mask(_slots_4_io_iss_uop_br_mask),
		.io_iss_uop_br_tag(_slots_4_io_iss_uop_br_tag),
		.io_iss_uop_br_type(_slots_4_io_iss_uop_br_type),
		.io_iss_uop_is_sfb(_slots_4_io_iss_uop_is_sfb),
		.io_iss_uop_is_fence(),
		.io_iss_uop_is_fencei(),
		.io_iss_uop_is_sfence(),
		.io_iss_uop_is_amo(),
		.io_iss_uop_is_eret(),
		.io_iss_uop_is_sys_pc2epc(),
		.io_iss_uop_is_rocc(),
		.io_iss_uop_is_mov(_slots_4_io_iss_uop_is_mov),
		.io_iss_uop_ftq_idx(_slots_4_io_iss_uop_ftq_idx),
		.io_iss_uop_edge_inst(_slots_4_io_iss_uop_edge_inst),
		.io_iss_uop_pc_lob(_slots_4_io_iss_uop_pc_lob),
		.io_iss_uop_taken(_slots_4_io_iss_uop_taken),
		.io_iss_uop_imm_rename(),
		.io_iss_uop_imm_sel(_slots_4_io_iss_uop_imm_sel),
		.io_iss_uop_pimm(_slots_4_io_iss_uop_pimm),
		.io_iss_uop_imm_packed(),
		.io_iss_uop_op1_sel(_slots_4_io_iss_uop_op1_sel),
		.io_iss_uop_op2_sel(_slots_4_io_iss_uop_op2_sel),
		.io_iss_uop_fp_ctrl_ldst(),
		.io_iss_uop_fp_ctrl_wen(),
		.io_iss_uop_fp_ctrl_ren1(),
		.io_iss_uop_fp_ctrl_ren2(),
		.io_iss_uop_fp_ctrl_ren3(),
		.io_iss_uop_fp_ctrl_swap12(),
		.io_iss_uop_fp_ctrl_swap23(),
		.io_iss_uop_fp_ctrl_typeTagIn(),
		.io_iss_uop_fp_ctrl_typeTagOut(),
		.io_iss_uop_fp_ctrl_fromint(),
		.io_iss_uop_fp_ctrl_toint(),
		.io_iss_uop_fp_ctrl_fastpipe(),
		.io_iss_uop_fp_ctrl_fma(),
		.io_iss_uop_fp_ctrl_div(),
		.io_iss_uop_fp_ctrl_sqrt(),
		.io_iss_uop_fp_ctrl_wflags(),
		.io_iss_uop_fp_ctrl_vec(),
		.io_iss_uop_rob_idx(_slots_4_io_iss_uop_rob_idx),
		.io_iss_uop_ldq_idx(),
		.io_iss_uop_stq_idx(),
		.io_iss_uop_rxq_idx(),
		.io_iss_uop_pdst(_slots_4_io_iss_uop_pdst),
		.io_iss_uop_prs1(_slots_4_io_iss_uop_prs1),
		.io_iss_uop_prs2(_slots_4_io_iss_uop_prs2),
		.io_iss_uop_prs3(),
		.io_iss_uop_ppred(_slots_4_io_iss_uop_ppred),
		.io_iss_uop_prs1_busy(),
		.io_iss_uop_prs2_busy(),
		.io_iss_uop_prs3_busy(),
		.io_iss_uop_ppred_busy(),
		.io_iss_uop_stale_pdst(),
		.io_iss_uop_exception(),
		.io_iss_uop_exc_cause(),
		.io_iss_uop_mem_cmd(),
		.io_iss_uop_mem_size(),
		.io_iss_uop_mem_signed(),
		.io_iss_uop_uses_ldq(),
		.io_iss_uop_uses_stq(),
		.io_iss_uop_is_unique(),
		.io_iss_uop_flush_on_commit(),
		.io_iss_uop_csr_cmd(_slots_4_io_iss_uop_csr_cmd),
		.io_iss_uop_ldst_is_rs1(_slots_4_io_iss_uop_ldst_is_rs1),
		.io_iss_uop_ldst(),
		.io_iss_uop_lrs1(),
		.io_iss_uop_lrs2(),
		.io_iss_uop_lrs3(),
		.io_iss_uop_dst_rtype(_slots_4_io_iss_uop_dst_rtype),
		.io_iss_uop_lrs1_rtype(_slots_4_io_iss_uop_lrs1_rtype),
		.io_iss_uop_lrs2_rtype(_slots_4_io_iss_uop_lrs2_rtype),
		.io_iss_uop_frs3_en(),
		.io_iss_uop_fcn_dw(_slots_4_io_iss_uop_fcn_dw),
		.io_iss_uop_fcn_op(_slots_4_io_iss_uop_fcn_op),
		.io_iss_uop_fp_val(),
		.io_iss_uop_xcpt_pf_if(),
		.io_iss_uop_xcpt_ae_if(),
		.io_iss_uop_xcpt_ma_if(),
		.io_iss_uop_bp_debug_if(),
		.io_iss_uop_bp_xcpt_if(),
		.io_iss_uop_debug_fsrc(),
		.io_iss_uop_debug_tsrc(),
		.io_in_uop_valid(issue_slots_4_in_uop_valid),
		.io_in_uop_bits_inst(_slots_5_io_out_uop_inst),
		.io_in_uop_bits_debug_inst(_slots_5_io_out_uop_debug_inst),
		.io_in_uop_bits_is_rvc(_slots_5_io_out_uop_is_rvc),
		.io_in_uop_bits_debug_pc(_slots_5_io_out_uop_debug_pc),
		.io_in_uop_bits_iq_type_0(_slots_5_io_out_uop_iq_type_0),
		.io_in_uop_bits_iq_type_1(_slots_5_io_out_uop_iq_type_1),
		.io_in_uop_bits_iq_type_2(_slots_5_io_out_uop_iq_type_2),
		.io_in_uop_bits_iq_type_3(_slots_5_io_out_uop_iq_type_3),
		.io_in_uop_bits_fu_code_0(_slots_5_io_out_uop_fu_code_0),
		.io_in_uop_bits_fu_code_1(_slots_5_io_out_uop_fu_code_1),
		.io_in_uop_bits_fu_code_2(_slots_5_io_out_uop_fu_code_2),
		.io_in_uop_bits_fu_code_3(_slots_5_io_out_uop_fu_code_3),
		.io_in_uop_bits_fu_code_4(_slots_5_io_out_uop_fu_code_4),
		.io_in_uop_bits_fu_code_5(_slots_5_io_out_uop_fu_code_5),
		.io_in_uop_bits_fu_code_6(_slots_5_io_out_uop_fu_code_6),
		.io_in_uop_bits_fu_code_7(_slots_5_io_out_uop_fu_code_7),
		.io_in_uop_bits_fu_code_8(_slots_5_io_out_uop_fu_code_8),
		.io_in_uop_bits_fu_code_9(_slots_5_io_out_uop_fu_code_9),
		.io_in_uop_bits_iw_issued(_slots_5_io_out_uop_iw_issued),
		.io_in_uop_bits_iw_p1_speculative_child(_slots_5_io_out_uop_iw_p1_speculative_child),
		.io_in_uop_bits_iw_p2_speculative_child(_slots_5_io_out_uop_iw_p2_speculative_child),
		.io_in_uop_bits_iw_p1_bypass_hint(_slots_5_io_out_uop_iw_p1_bypass_hint),
		.io_in_uop_bits_iw_p2_bypass_hint(_slots_5_io_out_uop_iw_p2_bypass_hint),
		.io_in_uop_bits_iw_p3_bypass_hint(_slots_5_io_out_uop_iw_p3_bypass_hint),
		.io_in_uop_bits_dis_col_sel(_slots_5_io_out_uop_dis_col_sel),
		.io_in_uop_bits_br_mask(_slots_5_io_out_uop_br_mask),
		.io_in_uop_bits_br_tag(_slots_5_io_out_uop_br_tag),
		.io_in_uop_bits_br_type(_slots_5_io_out_uop_br_type),
		.io_in_uop_bits_is_sfb(_slots_5_io_out_uop_is_sfb),
		.io_in_uop_bits_is_fence(_slots_5_io_out_uop_is_fence),
		.io_in_uop_bits_is_fencei(_slots_5_io_out_uop_is_fencei),
		.io_in_uop_bits_is_sfence(_slots_5_io_out_uop_is_sfence),
		.io_in_uop_bits_is_amo(_slots_5_io_out_uop_is_amo),
		.io_in_uop_bits_is_eret(_slots_5_io_out_uop_is_eret),
		.io_in_uop_bits_is_sys_pc2epc(_slots_5_io_out_uop_is_sys_pc2epc),
		.io_in_uop_bits_is_rocc(_slots_5_io_out_uop_is_rocc),
		.io_in_uop_bits_is_mov(_slots_5_io_out_uop_is_mov),
		.io_in_uop_bits_ftq_idx(_slots_5_io_out_uop_ftq_idx),
		.io_in_uop_bits_edge_inst(_slots_5_io_out_uop_edge_inst),
		.io_in_uop_bits_pc_lob(_slots_5_io_out_uop_pc_lob),
		.io_in_uop_bits_taken(_slots_5_io_out_uop_taken),
		.io_in_uop_bits_imm_rename(_slots_5_io_out_uop_imm_rename),
		.io_in_uop_bits_imm_sel(_slots_5_io_out_uop_imm_sel),
		.io_in_uop_bits_pimm(_slots_5_io_out_uop_pimm),
		.io_in_uop_bits_imm_packed(_slots_5_io_out_uop_imm_packed),
		.io_in_uop_bits_op1_sel(_slots_5_io_out_uop_op1_sel),
		.io_in_uop_bits_op2_sel(_slots_5_io_out_uop_op2_sel),
		.io_in_uop_bits_fp_ctrl_ldst(_slots_5_io_out_uop_fp_ctrl_ldst),
		.io_in_uop_bits_fp_ctrl_wen(_slots_5_io_out_uop_fp_ctrl_wen),
		.io_in_uop_bits_fp_ctrl_ren1(_slots_5_io_out_uop_fp_ctrl_ren1),
		.io_in_uop_bits_fp_ctrl_ren2(_slots_5_io_out_uop_fp_ctrl_ren2),
		.io_in_uop_bits_fp_ctrl_ren3(_slots_5_io_out_uop_fp_ctrl_ren3),
		.io_in_uop_bits_fp_ctrl_swap12(_slots_5_io_out_uop_fp_ctrl_swap12),
		.io_in_uop_bits_fp_ctrl_swap23(_slots_5_io_out_uop_fp_ctrl_swap23),
		.io_in_uop_bits_fp_ctrl_typeTagIn(_slots_5_io_out_uop_fp_ctrl_typeTagIn),
		.io_in_uop_bits_fp_ctrl_typeTagOut(_slots_5_io_out_uop_fp_ctrl_typeTagOut),
		.io_in_uop_bits_fp_ctrl_fromint(_slots_5_io_out_uop_fp_ctrl_fromint),
		.io_in_uop_bits_fp_ctrl_toint(_slots_5_io_out_uop_fp_ctrl_toint),
		.io_in_uop_bits_fp_ctrl_fastpipe(_slots_5_io_out_uop_fp_ctrl_fastpipe),
		.io_in_uop_bits_fp_ctrl_fma(_slots_5_io_out_uop_fp_ctrl_fma),
		.io_in_uop_bits_fp_ctrl_div(_slots_5_io_out_uop_fp_ctrl_div),
		.io_in_uop_bits_fp_ctrl_sqrt(_slots_5_io_out_uop_fp_ctrl_sqrt),
		.io_in_uop_bits_fp_ctrl_wflags(_slots_5_io_out_uop_fp_ctrl_wflags),
		.io_in_uop_bits_fp_ctrl_vec(_slots_5_io_out_uop_fp_ctrl_vec),
		.io_in_uop_bits_rob_idx(_slots_5_io_out_uop_rob_idx),
		.io_in_uop_bits_ldq_idx(_slots_5_io_out_uop_ldq_idx),
		.io_in_uop_bits_stq_idx(_slots_5_io_out_uop_stq_idx),
		.io_in_uop_bits_rxq_idx(_slots_5_io_out_uop_rxq_idx),
		.io_in_uop_bits_pdst(_slots_5_io_out_uop_pdst),
		.io_in_uop_bits_prs1(_slots_5_io_out_uop_prs1),
		.io_in_uop_bits_prs2(_slots_5_io_out_uop_prs2),
		.io_in_uop_bits_prs3(_slots_5_io_out_uop_prs3),
		.io_in_uop_bits_ppred(_slots_5_io_out_uop_ppred),
		.io_in_uop_bits_prs1_busy(_slots_5_io_out_uop_prs1_busy),
		.io_in_uop_bits_prs2_busy(_slots_5_io_out_uop_prs2_busy),
		.io_in_uop_bits_prs3_busy(_slots_5_io_out_uop_prs3_busy),
		.io_in_uop_bits_ppred_busy(_slots_5_io_out_uop_ppred_busy),
		.io_in_uop_bits_stale_pdst(_slots_5_io_out_uop_stale_pdst),
		.io_in_uop_bits_exception(_slots_5_io_out_uop_exception),
		.io_in_uop_bits_exc_cause(_slots_5_io_out_uop_exc_cause),
		.io_in_uop_bits_mem_cmd(_slots_5_io_out_uop_mem_cmd),
		.io_in_uop_bits_mem_size(_slots_5_io_out_uop_mem_size),
		.io_in_uop_bits_mem_signed(_slots_5_io_out_uop_mem_signed),
		.io_in_uop_bits_uses_ldq(_slots_5_io_out_uop_uses_ldq),
		.io_in_uop_bits_uses_stq(_slots_5_io_out_uop_uses_stq),
		.io_in_uop_bits_is_unique(_slots_5_io_out_uop_is_unique),
		.io_in_uop_bits_flush_on_commit(_slots_5_io_out_uop_flush_on_commit),
		.io_in_uop_bits_csr_cmd(_slots_5_io_out_uop_csr_cmd),
		.io_in_uop_bits_ldst_is_rs1(_slots_5_io_out_uop_ldst_is_rs1),
		.io_in_uop_bits_ldst(_slots_5_io_out_uop_ldst),
		.io_in_uop_bits_lrs1(_slots_5_io_out_uop_lrs1),
		.io_in_uop_bits_lrs2(_slots_5_io_out_uop_lrs2),
		.io_in_uop_bits_lrs3(_slots_5_io_out_uop_lrs3),
		.io_in_uop_bits_dst_rtype(_slots_5_io_out_uop_dst_rtype),
		.io_in_uop_bits_lrs1_rtype(_slots_5_io_out_uop_lrs1_rtype),
		.io_in_uop_bits_lrs2_rtype(_slots_5_io_out_uop_lrs2_rtype),
		.io_in_uop_bits_frs3_en(_slots_5_io_out_uop_frs3_en),
		.io_in_uop_bits_fcn_dw(_slots_5_io_out_uop_fcn_dw),
		.io_in_uop_bits_fcn_op(_slots_5_io_out_uop_fcn_op),
		.io_in_uop_bits_fp_val(_slots_5_io_out_uop_fp_val),
		.io_in_uop_bits_xcpt_pf_if(_slots_5_io_out_uop_xcpt_pf_if),
		.io_in_uop_bits_xcpt_ae_if(_slots_5_io_out_uop_xcpt_ae_if),
		.io_in_uop_bits_xcpt_ma_if(_slots_5_io_out_uop_xcpt_ma_if),
		.io_in_uop_bits_bp_debug_if(_slots_5_io_out_uop_bp_debug_if),
		.io_in_uop_bits_bp_xcpt_if(_slots_5_io_out_uop_bp_xcpt_if),
		.io_in_uop_bits_debug_fsrc(_slots_5_io_out_uop_debug_fsrc),
		.io_in_uop_bits_debug_tsrc(_slots_5_io_out_uop_debug_tsrc),
		.io_out_uop_inst(_slots_4_io_out_uop_inst),
		.io_out_uop_debug_inst(_slots_4_io_out_uop_debug_inst),
		.io_out_uop_is_rvc(_slots_4_io_out_uop_is_rvc),
		.io_out_uop_debug_pc(_slots_4_io_out_uop_debug_pc),
		.io_out_uop_iq_type_0(_slots_4_io_out_uop_iq_type_0),
		.io_out_uop_iq_type_1(_slots_4_io_out_uop_iq_type_1),
		.io_out_uop_iq_type_2(_slots_4_io_out_uop_iq_type_2),
		.io_out_uop_iq_type_3(_slots_4_io_out_uop_iq_type_3),
		.io_out_uop_fu_code_0(_slots_4_io_out_uop_fu_code_0),
		.io_out_uop_fu_code_1(_slots_4_io_out_uop_fu_code_1),
		.io_out_uop_fu_code_2(_slots_4_io_out_uop_fu_code_2),
		.io_out_uop_fu_code_3(_slots_4_io_out_uop_fu_code_3),
		.io_out_uop_fu_code_4(_slots_4_io_out_uop_fu_code_4),
		.io_out_uop_fu_code_5(_slots_4_io_out_uop_fu_code_5),
		.io_out_uop_fu_code_6(_slots_4_io_out_uop_fu_code_6),
		.io_out_uop_fu_code_7(_slots_4_io_out_uop_fu_code_7),
		.io_out_uop_fu_code_8(_slots_4_io_out_uop_fu_code_8),
		.io_out_uop_fu_code_9(_slots_4_io_out_uop_fu_code_9),
		.io_out_uop_iw_issued(_slots_4_io_out_uop_iw_issued),
		.io_out_uop_iw_p1_speculative_child(_slots_4_io_out_uop_iw_p1_speculative_child),
		.io_out_uop_iw_p2_speculative_child(_slots_4_io_out_uop_iw_p2_speculative_child),
		.io_out_uop_iw_p1_bypass_hint(_slots_4_io_out_uop_iw_p1_bypass_hint),
		.io_out_uop_iw_p2_bypass_hint(_slots_4_io_out_uop_iw_p2_bypass_hint),
		.io_out_uop_iw_p3_bypass_hint(_slots_4_io_out_uop_iw_p3_bypass_hint),
		.io_out_uop_dis_col_sel(_slots_4_io_out_uop_dis_col_sel),
		.io_out_uop_br_mask(_slots_4_io_out_uop_br_mask),
		.io_out_uop_br_tag(_slots_4_io_out_uop_br_tag),
		.io_out_uop_br_type(_slots_4_io_out_uop_br_type),
		.io_out_uop_is_sfb(_slots_4_io_out_uop_is_sfb),
		.io_out_uop_is_fence(_slots_4_io_out_uop_is_fence),
		.io_out_uop_is_fencei(_slots_4_io_out_uop_is_fencei),
		.io_out_uop_is_sfence(_slots_4_io_out_uop_is_sfence),
		.io_out_uop_is_amo(_slots_4_io_out_uop_is_amo),
		.io_out_uop_is_eret(_slots_4_io_out_uop_is_eret),
		.io_out_uop_is_sys_pc2epc(_slots_4_io_out_uop_is_sys_pc2epc),
		.io_out_uop_is_rocc(_slots_4_io_out_uop_is_rocc),
		.io_out_uop_is_mov(_slots_4_io_out_uop_is_mov),
		.io_out_uop_ftq_idx(_slots_4_io_out_uop_ftq_idx),
		.io_out_uop_edge_inst(_slots_4_io_out_uop_edge_inst),
		.io_out_uop_pc_lob(_slots_4_io_out_uop_pc_lob),
		.io_out_uop_taken(_slots_4_io_out_uop_taken),
		.io_out_uop_imm_rename(_slots_4_io_out_uop_imm_rename),
		.io_out_uop_imm_sel(_slots_4_io_out_uop_imm_sel),
		.io_out_uop_pimm(_slots_4_io_out_uop_pimm),
		.io_out_uop_imm_packed(_slots_4_io_out_uop_imm_packed),
		.io_out_uop_op1_sel(_slots_4_io_out_uop_op1_sel),
		.io_out_uop_op2_sel(_slots_4_io_out_uop_op2_sel),
		.io_out_uop_fp_ctrl_ldst(_slots_4_io_out_uop_fp_ctrl_ldst),
		.io_out_uop_fp_ctrl_wen(_slots_4_io_out_uop_fp_ctrl_wen),
		.io_out_uop_fp_ctrl_ren1(_slots_4_io_out_uop_fp_ctrl_ren1),
		.io_out_uop_fp_ctrl_ren2(_slots_4_io_out_uop_fp_ctrl_ren2),
		.io_out_uop_fp_ctrl_ren3(_slots_4_io_out_uop_fp_ctrl_ren3),
		.io_out_uop_fp_ctrl_swap12(_slots_4_io_out_uop_fp_ctrl_swap12),
		.io_out_uop_fp_ctrl_swap23(_slots_4_io_out_uop_fp_ctrl_swap23),
		.io_out_uop_fp_ctrl_typeTagIn(_slots_4_io_out_uop_fp_ctrl_typeTagIn),
		.io_out_uop_fp_ctrl_typeTagOut(_slots_4_io_out_uop_fp_ctrl_typeTagOut),
		.io_out_uop_fp_ctrl_fromint(_slots_4_io_out_uop_fp_ctrl_fromint),
		.io_out_uop_fp_ctrl_toint(_slots_4_io_out_uop_fp_ctrl_toint),
		.io_out_uop_fp_ctrl_fastpipe(_slots_4_io_out_uop_fp_ctrl_fastpipe),
		.io_out_uop_fp_ctrl_fma(_slots_4_io_out_uop_fp_ctrl_fma),
		.io_out_uop_fp_ctrl_div(_slots_4_io_out_uop_fp_ctrl_div),
		.io_out_uop_fp_ctrl_sqrt(_slots_4_io_out_uop_fp_ctrl_sqrt),
		.io_out_uop_fp_ctrl_wflags(_slots_4_io_out_uop_fp_ctrl_wflags),
		.io_out_uop_fp_ctrl_vec(_slots_4_io_out_uop_fp_ctrl_vec),
		.io_out_uop_rob_idx(_slots_4_io_out_uop_rob_idx),
		.io_out_uop_ldq_idx(_slots_4_io_out_uop_ldq_idx),
		.io_out_uop_stq_idx(_slots_4_io_out_uop_stq_idx),
		.io_out_uop_rxq_idx(_slots_4_io_out_uop_rxq_idx),
		.io_out_uop_pdst(_slots_4_io_out_uop_pdst),
		.io_out_uop_prs1(_slots_4_io_out_uop_prs1),
		.io_out_uop_prs2(_slots_4_io_out_uop_prs2),
		.io_out_uop_prs3(_slots_4_io_out_uop_prs3),
		.io_out_uop_ppred(_slots_4_io_out_uop_ppred),
		.io_out_uop_prs1_busy(_slots_4_io_out_uop_prs1_busy),
		.io_out_uop_prs2_busy(_slots_4_io_out_uop_prs2_busy),
		.io_out_uop_prs3_busy(_slots_4_io_out_uop_prs3_busy),
		.io_out_uop_ppred_busy(_slots_4_io_out_uop_ppred_busy),
		.io_out_uop_stale_pdst(_slots_4_io_out_uop_stale_pdst),
		.io_out_uop_exception(_slots_4_io_out_uop_exception),
		.io_out_uop_exc_cause(_slots_4_io_out_uop_exc_cause),
		.io_out_uop_mem_cmd(_slots_4_io_out_uop_mem_cmd),
		.io_out_uop_mem_size(_slots_4_io_out_uop_mem_size),
		.io_out_uop_mem_signed(_slots_4_io_out_uop_mem_signed),
		.io_out_uop_uses_ldq(_slots_4_io_out_uop_uses_ldq),
		.io_out_uop_uses_stq(_slots_4_io_out_uop_uses_stq),
		.io_out_uop_is_unique(_slots_4_io_out_uop_is_unique),
		.io_out_uop_flush_on_commit(_slots_4_io_out_uop_flush_on_commit),
		.io_out_uop_csr_cmd(_slots_4_io_out_uop_csr_cmd),
		.io_out_uop_ldst_is_rs1(_slots_4_io_out_uop_ldst_is_rs1),
		.io_out_uop_ldst(_slots_4_io_out_uop_ldst),
		.io_out_uop_lrs1(_slots_4_io_out_uop_lrs1),
		.io_out_uop_lrs2(_slots_4_io_out_uop_lrs2),
		.io_out_uop_lrs3(_slots_4_io_out_uop_lrs3),
		.io_out_uop_dst_rtype(_slots_4_io_out_uop_dst_rtype),
		.io_out_uop_lrs1_rtype(_slots_4_io_out_uop_lrs1_rtype),
		.io_out_uop_lrs2_rtype(_slots_4_io_out_uop_lrs2_rtype),
		.io_out_uop_frs3_en(_slots_4_io_out_uop_frs3_en),
		.io_out_uop_fcn_dw(_slots_4_io_out_uop_fcn_dw),
		.io_out_uop_fcn_op(_slots_4_io_out_uop_fcn_op),
		.io_out_uop_fp_val(_slots_4_io_out_uop_fp_val),
		.io_out_uop_xcpt_pf_if(_slots_4_io_out_uop_xcpt_pf_if),
		.io_out_uop_xcpt_ae_if(_slots_4_io_out_uop_xcpt_ae_if),
		.io_out_uop_xcpt_ma_if(_slots_4_io_out_uop_xcpt_ma_if),
		.io_out_uop_bp_debug_if(_slots_4_io_out_uop_bp_debug_if),
		.io_out_uop_bp_xcpt_if(_slots_4_io_out_uop_bp_xcpt_if),
		.io_out_uop_debug_fsrc(_slots_4_io_out_uop_debug_fsrc),
		.io_out_uop_debug_tsrc(_slots_4_io_out_uop_debug_tsrc),
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
		.io_pred_wakeup_port_valid(io_pred_wakeup_port_valid),
		.io_pred_wakeup_port_bits(io_pred_wakeup_port_bits),
		.io_child_rebusys(io_child_rebusys)
	);
	IssueSlot_16 slots_5(
		.clock(clock),
		.reset(reset),
		.io_valid(_slots_5_io_valid),
		.io_will_be_valid(_slots_5_io_will_be_valid),
		.io_request(_slots_5_io_request),
		.io_grant(issue_slots_5_grant),
		.io_iss_uop_inst(),
		.io_iss_uop_debug_inst(),
		.io_iss_uop_is_rvc(_slots_5_io_iss_uop_is_rvc),
		.io_iss_uop_debug_pc(),
		.io_iss_uop_iq_type_0(),
		.io_iss_uop_iq_type_1(),
		.io_iss_uop_iq_type_2(),
		.io_iss_uop_iq_type_3(),
		.io_iss_uop_fu_code_0(_slots_5_io_iss_uop_fu_code_0),
		.io_iss_uop_fu_code_1(),
		.io_iss_uop_fu_code_2(),
		.io_iss_uop_fu_code_3(),
		.io_iss_uop_fu_code_4(),
		.io_iss_uop_fu_code_5(),
		.io_iss_uop_fu_code_6(),
		.io_iss_uop_fu_code_7(),
		.io_iss_uop_fu_code_8(),
		.io_iss_uop_fu_code_9(),
		.io_iss_uop_iw_issued(),
		.io_iss_uop_iw_p1_speculative_child(),
		.io_iss_uop_iw_p2_speculative_child(),
		.io_iss_uop_iw_p1_bypass_hint(_slots_5_io_iss_uop_iw_p1_bypass_hint),
		.io_iss_uop_iw_p2_bypass_hint(_slots_5_io_iss_uop_iw_p2_bypass_hint),
		.io_iss_uop_iw_p3_bypass_hint(),
		.io_iss_uop_dis_col_sel(),
		.io_iss_uop_br_mask(_slots_5_io_iss_uop_br_mask),
		.io_iss_uop_br_tag(_slots_5_io_iss_uop_br_tag),
		.io_iss_uop_br_type(_slots_5_io_iss_uop_br_type),
		.io_iss_uop_is_sfb(_slots_5_io_iss_uop_is_sfb),
		.io_iss_uop_is_fence(),
		.io_iss_uop_is_fencei(),
		.io_iss_uop_is_sfence(),
		.io_iss_uop_is_amo(),
		.io_iss_uop_is_eret(),
		.io_iss_uop_is_sys_pc2epc(),
		.io_iss_uop_is_rocc(),
		.io_iss_uop_is_mov(_slots_5_io_iss_uop_is_mov),
		.io_iss_uop_ftq_idx(_slots_5_io_iss_uop_ftq_idx),
		.io_iss_uop_edge_inst(_slots_5_io_iss_uop_edge_inst),
		.io_iss_uop_pc_lob(_slots_5_io_iss_uop_pc_lob),
		.io_iss_uop_taken(_slots_5_io_iss_uop_taken),
		.io_iss_uop_imm_rename(),
		.io_iss_uop_imm_sel(_slots_5_io_iss_uop_imm_sel),
		.io_iss_uop_pimm(_slots_5_io_iss_uop_pimm),
		.io_iss_uop_imm_packed(),
		.io_iss_uop_op1_sel(_slots_5_io_iss_uop_op1_sel),
		.io_iss_uop_op2_sel(_slots_5_io_iss_uop_op2_sel),
		.io_iss_uop_fp_ctrl_ldst(),
		.io_iss_uop_fp_ctrl_wen(),
		.io_iss_uop_fp_ctrl_ren1(),
		.io_iss_uop_fp_ctrl_ren2(),
		.io_iss_uop_fp_ctrl_ren3(),
		.io_iss_uop_fp_ctrl_swap12(),
		.io_iss_uop_fp_ctrl_swap23(),
		.io_iss_uop_fp_ctrl_typeTagIn(),
		.io_iss_uop_fp_ctrl_typeTagOut(),
		.io_iss_uop_fp_ctrl_fromint(),
		.io_iss_uop_fp_ctrl_toint(),
		.io_iss_uop_fp_ctrl_fastpipe(),
		.io_iss_uop_fp_ctrl_fma(),
		.io_iss_uop_fp_ctrl_div(),
		.io_iss_uop_fp_ctrl_sqrt(),
		.io_iss_uop_fp_ctrl_wflags(),
		.io_iss_uop_fp_ctrl_vec(),
		.io_iss_uop_rob_idx(_slots_5_io_iss_uop_rob_idx),
		.io_iss_uop_ldq_idx(),
		.io_iss_uop_stq_idx(),
		.io_iss_uop_rxq_idx(),
		.io_iss_uop_pdst(_slots_5_io_iss_uop_pdst),
		.io_iss_uop_prs1(_slots_5_io_iss_uop_prs1),
		.io_iss_uop_prs2(_slots_5_io_iss_uop_prs2),
		.io_iss_uop_prs3(),
		.io_iss_uop_ppred(_slots_5_io_iss_uop_ppred),
		.io_iss_uop_prs1_busy(),
		.io_iss_uop_prs2_busy(),
		.io_iss_uop_prs3_busy(),
		.io_iss_uop_ppred_busy(),
		.io_iss_uop_stale_pdst(),
		.io_iss_uop_exception(),
		.io_iss_uop_exc_cause(),
		.io_iss_uop_mem_cmd(),
		.io_iss_uop_mem_size(),
		.io_iss_uop_mem_signed(),
		.io_iss_uop_uses_ldq(),
		.io_iss_uop_uses_stq(),
		.io_iss_uop_is_unique(),
		.io_iss_uop_flush_on_commit(),
		.io_iss_uop_csr_cmd(_slots_5_io_iss_uop_csr_cmd),
		.io_iss_uop_ldst_is_rs1(_slots_5_io_iss_uop_ldst_is_rs1),
		.io_iss_uop_ldst(),
		.io_iss_uop_lrs1(),
		.io_iss_uop_lrs2(),
		.io_iss_uop_lrs3(),
		.io_iss_uop_dst_rtype(_slots_5_io_iss_uop_dst_rtype),
		.io_iss_uop_lrs1_rtype(_slots_5_io_iss_uop_lrs1_rtype),
		.io_iss_uop_lrs2_rtype(_slots_5_io_iss_uop_lrs2_rtype),
		.io_iss_uop_frs3_en(),
		.io_iss_uop_fcn_dw(_slots_5_io_iss_uop_fcn_dw),
		.io_iss_uop_fcn_op(_slots_5_io_iss_uop_fcn_op),
		.io_iss_uop_fp_val(),
		.io_iss_uop_xcpt_pf_if(),
		.io_iss_uop_xcpt_ae_if(),
		.io_iss_uop_xcpt_ma_if(),
		.io_iss_uop_bp_debug_if(),
		.io_iss_uop_bp_xcpt_if(),
		.io_iss_uop_debug_fsrc(),
		.io_iss_uop_debug_tsrc(),
		.io_in_uop_valid(issue_slots_5_in_uop_valid),
		.io_in_uop_bits_inst(_slots_6_io_out_uop_inst),
		.io_in_uop_bits_debug_inst(_slots_6_io_out_uop_debug_inst),
		.io_in_uop_bits_is_rvc(_slots_6_io_out_uop_is_rvc),
		.io_in_uop_bits_debug_pc(_slots_6_io_out_uop_debug_pc),
		.io_in_uop_bits_iq_type_0(_slots_6_io_out_uop_iq_type_0),
		.io_in_uop_bits_iq_type_1(_slots_6_io_out_uop_iq_type_1),
		.io_in_uop_bits_iq_type_2(_slots_6_io_out_uop_iq_type_2),
		.io_in_uop_bits_iq_type_3(_slots_6_io_out_uop_iq_type_3),
		.io_in_uop_bits_fu_code_0(_slots_6_io_out_uop_fu_code_0),
		.io_in_uop_bits_fu_code_1(_slots_6_io_out_uop_fu_code_1),
		.io_in_uop_bits_fu_code_2(_slots_6_io_out_uop_fu_code_2),
		.io_in_uop_bits_fu_code_3(_slots_6_io_out_uop_fu_code_3),
		.io_in_uop_bits_fu_code_4(_slots_6_io_out_uop_fu_code_4),
		.io_in_uop_bits_fu_code_5(_slots_6_io_out_uop_fu_code_5),
		.io_in_uop_bits_fu_code_6(_slots_6_io_out_uop_fu_code_6),
		.io_in_uop_bits_fu_code_7(_slots_6_io_out_uop_fu_code_7),
		.io_in_uop_bits_fu_code_8(_slots_6_io_out_uop_fu_code_8),
		.io_in_uop_bits_fu_code_9(_slots_6_io_out_uop_fu_code_9),
		.io_in_uop_bits_iw_issued(_slots_6_io_out_uop_iw_issued),
		.io_in_uop_bits_iw_p1_speculative_child(_slots_6_io_out_uop_iw_p1_speculative_child),
		.io_in_uop_bits_iw_p2_speculative_child(_slots_6_io_out_uop_iw_p2_speculative_child),
		.io_in_uop_bits_iw_p1_bypass_hint(_slots_6_io_out_uop_iw_p1_bypass_hint),
		.io_in_uop_bits_iw_p2_bypass_hint(_slots_6_io_out_uop_iw_p2_bypass_hint),
		.io_in_uop_bits_iw_p3_bypass_hint(_slots_6_io_out_uop_iw_p3_bypass_hint),
		.io_in_uop_bits_dis_col_sel(_slots_6_io_out_uop_dis_col_sel),
		.io_in_uop_bits_br_mask(_slots_6_io_out_uop_br_mask),
		.io_in_uop_bits_br_tag(_slots_6_io_out_uop_br_tag),
		.io_in_uop_bits_br_type(_slots_6_io_out_uop_br_type),
		.io_in_uop_bits_is_sfb(_slots_6_io_out_uop_is_sfb),
		.io_in_uop_bits_is_fence(_slots_6_io_out_uop_is_fence),
		.io_in_uop_bits_is_fencei(_slots_6_io_out_uop_is_fencei),
		.io_in_uop_bits_is_sfence(_slots_6_io_out_uop_is_sfence),
		.io_in_uop_bits_is_amo(_slots_6_io_out_uop_is_amo),
		.io_in_uop_bits_is_eret(_slots_6_io_out_uop_is_eret),
		.io_in_uop_bits_is_sys_pc2epc(_slots_6_io_out_uop_is_sys_pc2epc),
		.io_in_uop_bits_is_rocc(_slots_6_io_out_uop_is_rocc),
		.io_in_uop_bits_is_mov(_slots_6_io_out_uop_is_mov),
		.io_in_uop_bits_ftq_idx(_slots_6_io_out_uop_ftq_idx),
		.io_in_uop_bits_edge_inst(_slots_6_io_out_uop_edge_inst),
		.io_in_uop_bits_pc_lob(_slots_6_io_out_uop_pc_lob),
		.io_in_uop_bits_taken(_slots_6_io_out_uop_taken),
		.io_in_uop_bits_imm_rename(_slots_6_io_out_uop_imm_rename),
		.io_in_uop_bits_imm_sel(_slots_6_io_out_uop_imm_sel),
		.io_in_uop_bits_pimm(_slots_6_io_out_uop_pimm),
		.io_in_uop_bits_imm_packed(_slots_6_io_out_uop_imm_packed),
		.io_in_uop_bits_op1_sel(_slots_6_io_out_uop_op1_sel),
		.io_in_uop_bits_op2_sel(_slots_6_io_out_uop_op2_sel),
		.io_in_uop_bits_fp_ctrl_ldst(_slots_6_io_out_uop_fp_ctrl_ldst),
		.io_in_uop_bits_fp_ctrl_wen(_slots_6_io_out_uop_fp_ctrl_wen),
		.io_in_uop_bits_fp_ctrl_ren1(_slots_6_io_out_uop_fp_ctrl_ren1),
		.io_in_uop_bits_fp_ctrl_ren2(_slots_6_io_out_uop_fp_ctrl_ren2),
		.io_in_uop_bits_fp_ctrl_ren3(_slots_6_io_out_uop_fp_ctrl_ren3),
		.io_in_uop_bits_fp_ctrl_swap12(_slots_6_io_out_uop_fp_ctrl_swap12),
		.io_in_uop_bits_fp_ctrl_swap23(_slots_6_io_out_uop_fp_ctrl_swap23),
		.io_in_uop_bits_fp_ctrl_typeTagIn(_slots_6_io_out_uop_fp_ctrl_typeTagIn),
		.io_in_uop_bits_fp_ctrl_typeTagOut(_slots_6_io_out_uop_fp_ctrl_typeTagOut),
		.io_in_uop_bits_fp_ctrl_fromint(_slots_6_io_out_uop_fp_ctrl_fromint),
		.io_in_uop_bits_fp_ctrl_toint(_slots_6_io_out_uop_fp_ctrl_toint),
		.io_in_uop_bits_fp_ctrl_fastpipe(_slots_6_io_out_uop_fp_ctrl_fastpipe),
		.io_in_uop_bits_fp_ctrl_fma(_slots_6_io_out_uop_fp_ctrl_fma),
		.io_in_uop_bits_fp_ctrl_div(_slots_6_io_out_uop_fp_ctrl_div),
		.io_in_uop_bits_fp_ctrl_sqrt(_slots_6_io_out_uop_fp_ctrl_sqrt),
		.io_in_uop_bits_fp_ctrl_wflags(_slots_6_io_out_uop_fp_ctrl_wflags),
		.io_in_uop_bits_fp_ctrl_vec(_slots_6_io_out_uop_fp_ctrl_vec),
		.io_in_uop_bits_rob_idx(_slots_6_io_out_uop_rob_idx),
		.io_in_uop_bits_ldq_idx(_slots_6_io_out_uop_ldq_idx),
		.io_in_uop_bits_stq_idx(_slots_6_io_out_uop_stq_idx),
		.io_in_uop_bits_rxq_idx(_slots_6_io_out_uop_rxq_idx),
		.io_in_uop_bits_pdst(_slots_6_io_out_uop_pdst),
		.io_in_uop_bits_prs1(_slots_6_io_out_uop_prs1),
		.io_in_uop_bits_prs2(_slots_6_io_out_uop_prs2),
		.io_in_uop_bits_prs3(_slots_6_io_out_uop_prs3),
		.io_in_uop_bits_ppred(_slots_6_io_out_uop_ppred),
		.io_in_uop_bits_prs1_busy(_slots_6_io_out_uop_prs1_busy),
		.io_in_uop_bits_prs2_busy(_slots_6_io_out_uop_prs2_busy),
		.io_in_uop_bits_prs3_busy(_slots_6_io_out_uop_prs3_busy),
		.io_in_uop_bits_ppred_busy(_slots_6_io_out_uop_ppred_busy),
		.io_in_uop_bits_stale_pdst(_slots_6_io_out_uop_stale_pdst),
		.io_in_uop_bits_exception(_slots_6_io_out_uop_exception),
		.io_in_uop_bits_exc_cause(_slots_6_io_out_uop_exc_cause),
		.io_in_uop_bits_mem_cmd(_slots_6_io_out_uop_mem_cmd),
		.io_in_uop_bits_mem_size(_slots_6_io_out_uop_mem_size),
		.io_in_uop_bits_mem_signed(_slots_6_io_out_uop_mem_signed),
		.io_in_uop_bits_uses_ldq(_slots_6_io_out_uop_uses_ldq),
		.io_in_uop_bits_uses_stq(_slots_6_io_out_uop_uses_stq),
		.io_in_uop_bits_is_unique(_slots_6_io_out_uop_is_unique),
		.io_in_uop_bits_flush_on_commit(_slots_6_io_out_uop_flush_on_commit),
		.io_in_uop_bits_csr_cmd(_slots_6_io_out_uop_csr_cmd),
		.io_in_uop_bits_ldst_is_rs1(_slots_6_io_out_uop_ldst_is_rs1),
		.io_in_uop_bits_ldst(_slots_6_io_out_uop_ldst),
		.io_in_uop_bits_lrs1(_slots_6_io_out_uop_lrs1),
		.io_in_uop_bits_lrs2(_slots_6_io_out_uop_lrs2),
		.io_in_uop_bits_lrs3(_slots_6_io_out_uop_lrs3),
		.io_in_uop_bits_dst_rtype(_slots_6_io_out_uop_dst_rtype),
		.io_in_uop_bits_lrs1_rtype(_slots_6_io_out_uop_lrs1_rtype),
		.io_in_uop_bits_lrs2_rtype(_slots_6_io_out_uop_lrs2_rtype),
		.io_in_uop_bits_frs3_en(_slots_6_io_out_uop_frs3_en),
		.io_in_uop_bits_fcn_dw(_slots_6_io_out_uop_fcn_dw),
		.io_in_uop_bits_fcn_op(_slots_6_io_out_uop_fcn_op),
		.io_in_uop_bits_fp_val(_slots_6_io_out_uop_fp_val),
		.io_in_uop_bits_xcpt_pf_if(_slots_6_io_out_uop_xcpt_pf_if),
		.io_in_uop_bits_xcpt_ae_if(_slots_6_io_out_uop_xcpt_ae_if),
		.io_in_uop_bits_xcpt_ma_if(_slots_6_io_out_uop_xcpt_ma_if),
		.io_in_uop_bits_bp_debug_if(_slots_6_io_out_uop_bp_debug_if),
		.io_in_uop_bits_bp_xcpt_if(_slots_6_io_out_uop_bp_xcpt_if),
		.io_in_uop_bits_debug_fsrc(_slots_6_io_out_uop_debug_fsrc),
		.io_in_uop_bits_debug_tsrc(_slots_6_io_out_uop_debug_tsrc),
		.io_out_uop_inst(_slots_5_io_out_uop_inst),
		.io_out_uop_debug_inst(_slots_5_io_out_uop_debug_inst),
		.io_out_uop_is_rvc(_slots_5_io_out_uop_is_rvc),
		.io_out_uop_debug_pc(_slots_5_io_out_uop_debug_pc),
		.io_out_uop_iq_type_0(_slots_5_io_out_uop_iq_type_0),
		.io_out_uop_iq_type_1(_slots_5_io_out_uop_iq_type_1),
		.io_out_uop_iq_type_2(_slots_5_io_out_uop_iq_type_2),
		.io_out_uop_iq_type_3(_slots_5_io_out_uop_iq_type_3),
		.io_out_uop_fu_code_0(_slots_5_io_out_uop_fu_code_0),
		.io_out_uop_fu_code_1(_slots_5_io_out_uop_fu_code_1),
		.io_out_uop_fu_code_2(_slots_5_io_out_uop_fu_code_2),
		.io_out_uop_fu_code_3(_slots_5_io_out_uop_fu_code_3),
		.io_out_uop_fu_code_4(_slots_5_io_out_uop_fu_code_4),
		.io_out_uop_fu_code_5(_slots_5_io_out_uop_fu_code_5),
		.io_out_uop_fu_code_6(_slots_5_io_out_uop_fu_code_6),
		.io_out_uop_fu_code_7(_slots_5_io_out_uop_fu_code_7),
		.io_out_uop_fu_code_8(_slots_5_io_out_uop_fu_code_8),
		.io_out_uop_fu_code_9(_slots_5_io_out_uop_fu_code_9),
		.io_out_uop_iw_issued(_slots_5_io_out_uop_iw_issued),
		.io_out_uop_iw_p1_speculative_child(_slots_5_io_out_uop_iw_p1_speculative_child),
		.io_out_uop_iw_p2_speculative_child(_slots_5_io_out_uop_iw_p2_speculative_child),
		.io_out_uop_iw_p1_bypass_hint(_slots_5_io_out_uop_iw_p1_bypass_hint),
		.io_out_uop_iw_p2_bypass_hint(_slots_5_io_out_uop_iw_p2_bypass_hint),
		.io_out_uop_iw_p3_bypass_hint(_slots_5_io_out_uop_iw_p3_bypass_hint),
		.io_out_uop_dis_col_sel(_slots_5_io_out_uop_dis_col_sel),
		.io_out_uop_br_mask(_slots_5_io_out_uop_br_mask),
		.io_out_uop_br_tag(_slots_5_io_out_uop_br_tag),
		.io_out_uop_br_type(_slots_5_io_out_uop_br_type),
		.io_out_uop_is_sfb(_slots_5_io_out_uop_is_sfb),
		.io_out_uop_is_fence(_slots_5_io_out_uop_is_fence),
		.io_out_uop_is_fencei(_slots_5_io_out_uop_is_fencei),
		.io_out_uop_is_sfence(_slots_5_io_out_uop_is_sfence),
		.io_out_uop_is_amo(_slots_5_io_out_uop_is_amo),
		.io_out_uop_is_eret(_slots_5_io_out_uop_is_eret),
		.io_out_uop_is_sys_pc2epc(_slots_5_io_out_uop_is_sys_pc2epc),
		.io_out_uop_is_rocc(_slots_5_io_out_uop_is_rocc),
		.io_out_uop_is_mov(_slots_5_io_out_uop_is_mov),
		.io_out_uop_ftq_idx(_slots_5_io_out_uop_ftq_idx),
		.io_out_uop_edge_inst(_slots_5_io_out_uop_edge_inst),
		.io_out_uop_pc_lob(_slots_5_io_out_uop_pc_lob),
		.io_out_uop_taken(_slots_5_io_out_uop_taken),
		.io_out_uop_imm_rename(_slots_5_io_out_uop_imm_rename),
		.io_out_uop_imm_sel(_slots_5_io_out_uop_imm_sel),
		.io_out_uop_pimm(_slots_5_io_out_uop_pimm),
		.io_out_uop_imm_packed(_slots_5_io_out_uop_imm_packed),
		.io_out_uop_op1_sel(_slots_5_io_out_uop_op1_sel),
		.io_out_uop_op2_sel(_slots_5_io_out_uop_op2_sel),
		.io_out_uop_fp_ctrl_ldst(_slots_5_io_out_uop_fp_ctrl_ldst),
		.io_out_uop_fp_ctrl_wen(_slots_5_io_out_uop_fp_ctrl_wen),
		.io_out_uop_fp_ctrl_ren1(_slots_5_io_out_uop_fp_ctrl_ren1),
		.io_out_uop_fp_ctrl_ren2(_slots_5_io_out_uop_fp_ctrl_ren2),
		.io_out_uop_fp_ctrl_ren3(_slots_5_io_out_uop_fp_ctrl_ren3),
		.io_out_uop_fp_ctrl_swap12(_slots_5_io_out_uop_fp_ctrl_swap12),
		.io_out_uop_fp_ctrl_swap23(_slots_5_io_out_uop_fp_ctrl_swap23),
		.io_out_uop_fp_ctrl_typeTagIn(_slots_5_io_out_uop_fp_ctrl_typeTagIn),
		.io_out_uop_fp_ctrl_typeTagOut(_slots_5_io_out_uop_fp_ctrl_typeTagOut),
		.io_out_uop_fp_ctrl_fromint(_slots_5_io_out_uop_fp_ctrl_fromint),
		.io_out_uop_fp_ctrl_toint(_slots_5_io_out_uop_fp_ctrl_toint),
		.io_out_uop_fp_ctrl_fastpipe(_slots_5_io_out_uop_fp_ctrl_fastpipe),
		.io_out_uop_fp_ctrl_fma(_slots_5_io_out_uop_fp_ctrl_fma),
		.io_out_uop_fp_ctrl_div(_slots_5_io_out_uop_fp_ctrl_div),
		.io_out_uop_fp_ctrl_sqrt(_slots_5_io_out_uop_fp_ctrl_sqrt),
		.io_out_uop_fp_ctrl_wflags(_slots_5_io_out_uop_fp_ctrl_wflags),
		.io_out_uop_fp_ctrl_vec(_slots_5_io_out_uop_fp_ctrl_vec),
		.io_out_uop_rob_idx(_slots_5_io_out_uop_rob_idx),
		.io_out_uop_ldq_idx(_slots_5_io_out_uop_ldq_idx),
		.io_out_uop_stq_idx(_slots_5_io_out_uop_stq_idx),
		.io_out_uop_rxq_idx(_slots_5_io_out_uop_rxq_idx),
		.io_out_uop_pdst(_slots_5_io_out_uop_pdst),
		.io_out_uop_prs1(_slots_5_io_out_uop_prs1),
		.io_out_uop_prs2(_slots_5_io_out_uop_prs2),
		.io_out_uop_prs3(_slots_5_io_out_uop_prs3),
		.io_out_uop_ppred(_slots_5_io_out_uop_ppred),
		.io_out_uop_prs1_busy(_slots_5_io_out_uop_prs1_busy),
		.io_out_uop_prs2_busy(_slots_5_io_out_uop_prs2_busy),
		.io_out_uop_prs3_busy(_slots_5_io_out_uop_prs3_busy),
		.io_out_uop_ppred_busy(_slots_5_io_out_uop_ppred_busy),
		.io_out_uop_stale_pdst(_slots_5_io_out_uop_stale_pdst),
		.io_out_uop_exception(_slots_5_io_out_uop_exception),
		.io_out_uop_exc_cause(_slots_5_io_out_uop_exc_cause),
		.io_out_uop_mem_cmd(_slots_5_io_out_uop_mem_cmd),
		.io_out_uop_mem_size(_slots_5_io_out_uop_mem_size),
		.io_out_uop_mem_signed(_slots_5_io_out_uop_mem_signed),
		.io_out_uop_uses_ldq(_slots_5_io_out_uop_uses_ldq),
		.io_out_uop_uses_stq(_slots_5_io_out_uop_uses_stq),
		.io_out_uop_is_unique(_slots_5_io_out_uop_is_unique),
		.io_out_uop_flush_on_commit(_slots_5_io_out_uop_flush_on_commit),
		.io_out_uop_csr_cmd(_slots_5_io_out_uop_csr_cmd),
		.io_out_uop_ldst_is_rs1(_slots_5_io_out_uop_ldst_is_rs1),
		.io_out_uop_ldst(_slots_5_io_out_uop_ldst),
		.io_out_uop_lrs1(_slots_5_io_out_uop_lrs1),
		.io_out_uop_lrs2(_slots_5_io_out_uop_lrs2),
		.io_out_uop_lrs3(_slots_5_io_out_uop_lrs3),
		.io_out_uop_dst_rtype(_slots_5_io_out_uop_dst_rtype),
		.io_out_uop_lrs1_rtype(_slots_5_io_out_uop_lrs1_rtype),
		.io_out_uop_lrs2_rtype(_slots_5_io_out_uop_lrs2_rtype),
		.io_out_uop_frs3_en(_slots_5_io_out_uop_frs3_en),
		.io_out_uop_fcn_dw(_slots_5_io_out_uop_fcn_dw),
		.io_out_uop_fcn_op(_slots_5_io_out_uop_fcn_op),
		.io_out_uop_fp_val(_slots_5_io_out_uop_fp_val),
		.io_out_uop_xcpt_pf_if(_slots_5_io_out_uop_xcpt_pf_if),
		.io_out_uop_xcpt_ae_if(_slots_5_io_out_uop_xcpt_ae_if),
		.io_out_uop_xcpt_ma_if(_slots_5_io_out_uop_xcpt_ma_if),
		.io_out_uop_bp_debug_if(_slots_5_io_out_uop_bp_debug_if),
		.io_out_uop_bp_xcpt_if(_slots_5_io_out_uop_bp_xcpt_if),
		.io_out_uop_debug_fsrc(_slots_5_io_out_uop_debug_fsrc),
		.io_out_uop_debug_tsrc(_slots_5_io_out_uop_debug_tsrc),
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
		.io_pred_wakeup_port_valid(io_pred_wakeup_port_valid),
		.io_pred_wakeup_port_bits(io_pred_wakeup_port_bits),
		.io_child_rebusys(io_child_rebusys)
	);
	IssueSlot_16 slots_6(
		.clock(clock),
		.reset(reset),
		.io_valid(_slots_6_io_valid),
		.io_will_be_valid(_slots_6_io_will_be_valid),
		.io_request(_slots_6_io_request),
		.io_grant(issue_slots_6_grant),
		.io_iss_uop_inst(),
		.io_iss_uop_debug_inst(),
		.io_iss_uop_is_rvc(_slots_6_io_iss_uop_is_rvc),
		.io_iss_uop_debug_pc(),
		.io_iss_uop_iq_type_0(),
		.io_iss_uop_iq_type_1(),
		.io_iss_uop_iq_type_2(),
		.io_iss_uop_iq_type_3(),
		.io_iss_uop_fu_code_0(_slots_6_io_iss_uop_fu_code_0),
		.io_iss_uop_fu_code_1(),
		.io_iss_uop_fu_code_2(),
		.io_iss_uop_fu_code_3(),
		.io_iss_uop_fu_code_4(),
		.io_iss_uop_fu_code_5(),
		.io_iss_uop_fu_code_6(),
		.io_iss_uop_fu_code_7(),
		.io_iss_uop_fu_code_8(),
		.io_iss_uop_fu_code_9(),
		.io_iss_uop_iw_issued(),
		.io_iss_uop_iw_p1_speculative_child(),
		.io_iss_uop_iw_p2_speculative_child(),
		.io_iss_uop_iw_p1_bypass_hint(_slots_6_io_iss_uop_iw_p1_bypass_hint),
		.io_iss_uop_iw_p2_bypass_hint(_slots_6_io_iss_uop_iw_p2_bypass_hint),
		.io_iss_uop_iw_p3_bypass_hint(),
		.io_iss_uop_dis_col_sel(),
		.io_iss_uop_br_mask(_slots_6_io_iss_uop_br_mask),
		.io_iss_uop_br_tag(_slots_6_io_iss_uop_br_tag),
		.io_iss_uop_br_type(_slots_6_io_iss_uop_br_type),
		.io_iss_uop_is_sfb(_slots_6_io_iss_uop_is_sfb),
		.io_iss_uop_is_fence(),
		.io_iss_uop_is_fencei(),
		.io_iss_uop_is_sfence(),
		.io_iss_uop_is_amo(),
		.io_iss_uop_is_eret(),
		.io_iss_uop_is_sys_pc2epc(),
		.io_iss_uop_is_rocc(),
		.io_iss_uop_is_mov(_slots_6_io_iss_uop_is_mov),
		.io_iss_uop_ftq_idx(_slots_6_io_iss_uop_ftq_idx),
		.io_iss_uop_edge_inst(_slots_6_io_iss_uop_edge_inst),
		.io_iss_uop_pc_lob(_slots_6_io_iss_uop_pc_lob),
		.io_iss_uop_taken(_slots_6_io_iss_uop_taken),
		.io_iss_uop_imm_rename(),
		.io_iss_uop_imm_sel(_slots_6_io_iss_uop_imm_sel),
		.io_iss_uop_pimm(_slots_6_io_iss_uop_pimm),
		.io_iss_uop_imm_packed(),
		.io_iss_uop_op1_sel(_slots_6_io_iss_uop_op1_sel),
		.io_iss_uop_op2_sel(_slots_6_io_iss_uop_op2_sel),
		.io_iss_uop_fp_ctrl_ldst(),
		.io_iss_uop_fp_ctrl_wen(),
		.io_iss_uop_fp_ctrl_ren1(),
		.io_iss_uop_fp_ctrl_ren2(),
		.io_iss_uop_fp_ctrl_ren3(),
		.io_iss_uop_fp_ctrl_swap12(),
		.io_iss_uop_fp_ctrl_swap23(),
		.io_iss_uop_fp_ctrl_typeTagIn(),
		.io_iss_uop_fp_ctrl_typeTagOut(),
		.io_iss_uop_fp_ctrl_fromint(),
		.io_iss_uop_fp_ctrl_toint(),
		.io_iss_uop_fp_ctrl_fastpipe(),
		.io_iss_uop_fp_ctrl_fma(),
		.io_iss_uop_fp_ctrl_div(),
		.io_iss_uop_fp_ctrl_sqrt(),
		.io_iss_uop_fp_ctrl_wflags(),
		.io_iss_uop_fp_ctrl_vec(),
		.io_iss_uop_rob_idx(_slots_6_io_iss_uop_rob_idx),
		.io_iss_uop_ldq_idx(),
		.io_iss_uop_stq_idx(),
		.io_iss_uop_rxq_idx(),
		.io_iss_uop_pdst(_slots_6_io_iss_uop_pdst),
		.io_iss_uop_prs1(_slots_6_io_iss_uop_prs1),
		.io_iss_uop_prs2(_slots_6_io_iss_uop_prs2),
		.io_iss_uop_prs3(),
		.io_iss_uop_ppred(_slots_6_io_iss_uop_ppred),
		.io_iss_uop_prs1_busy(),
		.io_iss_uop_prs2_busy(),
		.io_iss_uop_prs3_busy(),
		.io_iss_uop_ppred_busy(),
		.io_iss_uop_stale_pdst(),
		.io_iss_uop_exception(),
		.io_iss_uop_exc_cause(),
		.io_iss_uop_mem_cmd(),
		.io_iss_uop_mem_size(),
		.io_iss_uop_mem_signed(),
		.io_iss_uop_uses_ldq(),
		.io_iss_uop_uses_stq(),
		.io_iss_uop_is_unique(),
		.io_iss_uop_flush_on_commit(),
		.io_iss_uop_csr_cmd(_slots_6_io_iss_uop_csr_cmd),
		.io_iss_uop_ldst_is_rs1(_slots_6_io_iss_uop_ldst_is_rs1),
		.io_iss_uop_ldst(),
		.io_iss_uop_lrs1(),
		.io_iss_uop_lrs2(),
		.io_iss_uop_lrs3(),
		.io_iss_uop_dst_rtype(_slots_6_io_iss_uop_dst_rtype),
		.io_iss_uop_lrs1_rtype(_slots_6_io_iss_uop_lrs1_rtype),
		.io_iss_uop_lrs2_rtype(_slots_6_io_iss_uop_lrs2_rtype),
		.io_iss_uop_frs3_en(),
		.io_iss_uop_fcn_dw(_slots_6_io_iss_uop_fcn_dw),
		.io_iss_uop_fcn_op(_slots_6_io_iss_uop_fcn_op),
		.io_iss_uop_fp_val(),
		.io_iss_uop_xcpt_pf_if(),
		.io_iss_uop_xcpt_ae_if(),
		.io_iss_uop_xcpt_ma_if(),
		.io_iss_uop_bp_debug_if(),
		.io_iss_uop_bp_xcpt_if(),
		.io_iss_uop_debug_fsrc(),
		.io_iss_uop_debug_tsrc(),
		.io_in_uop_valid(issue_slots_6_in_uop_valid),
		.io_in_uop_bits_inst(_slots_7_io_out_uop_inst),
		.io_in_uop_bits_debug_inst(_slots_7_io_out_uop_debug_inst),
		.io_in_uop_bits_is_rvc(_slots_7_io_out_uop_is_rvc),
		.io_in_uop_bits_debug_pc(_slots_7_io_out_uop_debug_pc),
		.io_in_uop_bits_iq_type_0(_slots_7_io_out_uop_iq_type_0),
		.io_in_uop_bits_iq_type_1(_slots_7_io_out_uop_iq_type_1),
		.io_in_uop_bits_iq_type_2(_slots_7_io_out_uop_iq_type_2),
		.io_in_uop_bits_iq_type_3(_slots_7_io_out_uop_iq_type_3),
		.io_in_uop_bits_fu_code_0(_slots_7_io_out_uop_fu_code_0),
		.io_in_uop_bits_fu_code_1(_slots_7_io_out_uop_fu_code_1),
		.io_in_uop_bits_fu_code_2(_slots_7_io_out_uop_fu_code_2),
		.io_in_uop_bits_fu_code_3(_slots_7_io_out_uop_fu_code_3),
		.io_in_uop_bits_fu_code_4(_slots_7_io_out_uop_fu_code_4),
		.io_in_uop_bits_fu_code_5(_slots_7_io_out_uop_fu_code_5),
		.io_in_uop_bits_fu_code_6(_slots_7_io_out_uop_fu_code_6),
		.io_in_uop_bits_fu_code_7(_slots_7_io_out_uop_fu_code_7),
		.io_in_uop_bits_fu_code_8(_slots_7_io_out_uop_fu_code_8),
		.io_in_uop_bits_fu_code_9(_slots_7_io_out_uop_fu_code_9),
		.io_in_uop_bits_iw_issued(_slots_7_io_out_uop_iw_issued),
		.io_in_uop_bits_iw_p1_speculative_child(_slots_7_io_out_uop_iw_p1_speculative_child),
		.io_in_uop_bits_iw_p2_speculative_child(_slots_7_io_out_uop_iw_p2_speculative_child),
		.io_in_uop_bits_iw_p1_bypass_hint(_slots_7_io_out_uop_iw_p1_bypass_hint),
		.io_in_uop_bits_iw_p2_bypass_hint(_slots_7_io_out_uop_iw_p2_bypass_hint),
		.io_in_uop_bits_iw_p3_bypass_hint(_slots_7_io_out_uop_iw_p3_bypass_hint),
		.io_in_uop_bits_dis_col_sel(_slots_7_io_out_uop_dis_col_sel),
		.io_in_uop_bits_br_mask(_slots_7_io_out_uop_br_mask),
		.io_in_uop_bits_br_tag(_slots_7_io_out_uop_br_tag),
		.io_in_uop_bits_br_type(_slots_7_io_out_uop_br_type),
		.io_in_uop_bits_is_sfb(_slots_7_io_out_uop_is_sfb),
		.io_in_uop_bits_is_fence(_slots_7_io_out_uop_is_fence),
		.io_in_uop_bits_is_fencei(_slots_7_io_out_uop_is_fencei),
		.io_in_uop_bits_is_sfence(_slots_7_io_out_uop_is_sfence),
		.io_in_uop_bits_is_amo(_slots_7_io_out_uop_is_amo),
		.io_in_uop_bits_is_eret(_slots_7_io_out_uop_is_eret),
		.io_in_uop_bits_is_sys_pc2epc(_slots_7_io_out_uop_is_sys_pc2epc),
		.io_in_uop_bits_is_rocc(_slots_7_io_out_uop_is_rocc),
		.io_in_uop_bits_is_mov(_slots_7_io_out_uop_is_mov),
		.io_in_uop_bits_ftq_idx(_slots_7_io_out_uop_ftq_idx),
		.io_in_uop_bits_edge_inst(_slots_7_io_out_uop_edge_inst),
		.io_in_uop_bits_pc_lob(_slots_7_io_out_uop_pc_lob),
		.io_in_uop_bits_taken(_slots_7_io_out_uop_taken),
		.io_in_uop_bits_imm_rename(_slots_7_io_out_uop_imm_rename),
		.io_in_uop_bits_imm_sel(_slots_7_io_out_uop_imm_sel),
		.io_in_uop_bits_pimm(_slots_7_io_out_uop_pimm),
		.io_in_uop_bits_imm_packed(_slots_7_io_out_uop_imm_packed),
		.io_in_uop_bits_op1_sel(_slots_7_io_out_uop_op1_sel),
		.io_in_uop_bits_op2_sel(_slots_7_io_out_uop_op2_sel),
		.io_in_uop_bits_fp_ctrl_ldst(_slots_7_io_out_uop_fp_ctrl_ldst),
		.io_in_uop_bits_fp_ctrl_wen(_slots_7_io_out_uop_fp_ctrl_wen),
		.io_in_uop_bits_fp_ctrl_ren1(_slots_7_io_out_uop_fp_ctrl_ren1),
		.io_in_uop_bits_fp_ctrl_ren2(_slots_7_io_out_uop_fp_ctrl_ren2),
		.io_in_uop_bits_fp_ctrl_ren3(_slots_7_io_out_uop_fp_ctrl_ren3),
		.io_in_uop_bits_fp_ctrl_swap12(_slots_7_io_out_uop_fp_ctrl_swap12),
		.io_in_uop_bits_fp_ctrl_swap23(_slots_7_io_out_uop_fp_ctrl_swap23),
		.io_in_uop_bits_fp_ctrl_typeTagIn(_slots_7_io_out_uop_fp_ctrl_typeTagIn),
		.io_in_uop_bits_fp_ctrl_typeTagOut(_slots_7_io_out_uop_fp_ctrl_typeTagOut),
		.io_in_uop_bits_fp_ctrl_fromint(_slots_7_io_out_uop_fp_ctrl_fromint),
		.io_in_uop_bits_fp_ctrl_toint(_slots_7_io_out_uop_fp_ctrl_toint),
		.io_in_uop_bits_fp_ctrl_fastpipe(_slots_7_io_out_uop_fp_ctrl_fastpipe),
		.io_in_uop_bits_fp_ctrl_fma(_slots_7_io_out_uop_fp_ctrl_fma),
		.io_in_uop_bits_fp_ctrl_div(_slots_7_io_out_uop_fp_ctrl_div),
		.io_in_uop_bits_fp_ctrl_sqrt(_slots_7_io_out_uop_fp_ctrl_sqrt),
		.io_in_uop_bits_fp_ctrl_wflags(_slots_7_io_out_uop_fp_ctrl_wflags),
		.io_in_uop_bits_fp_ctrl_vec(_slots_7_io_out_uop_fp_ctrl_vec),
		.io_in_uop_bits_rob_idx(_slots_7_io_out_uop_rob_idx),
		.io_in_uop_bits_ldq_idx(_slots_7_io_out_uop_ldq_idx),
		.io_in_uop_bits_stq_idx(_slots_7_io_out_uop_stq_idx),
		.io_in_uop_bits_rxq_idx(_slots_7_io_out_uop_rxq_idx),
		.io_in_uop_bits_pdst(_slots_7_io_out_uop_pdst),
		.io_in_uop_bits_prs1(_slots_7_io_out_uop_prs1),
		.io_in_uop_bits_prs2(_slots_7_io_out_uop_prs2),
		.io_in_uop_bits_prs3(_slots_7_io_out_uop_prs3),
		.io_in_uop_bits_ppred(_slots_7_io_out_uop_ppred),
		.io_in_uop_bits_prs1_busy(_slots_7_io_out_uop_prs1_busy),
		.io_in_uop_bits_prs2_busy(_slots_7_io_out_uop_prs2_busy),
		.io_in_uop_bits_prs3_busy(_slots_7_io_out_uop_prs3_busy),
		.io_in_uop_bits_ppred_busy(_slots_7_io_out_uop_ppred_busy),
		.io_in_uop_bits_stale_pdst(_slots_7_io_out_uop_stale_pdst),
		.io_in_uop_bits_exception(_slots_7_io_out_uop_exception),
		.io_in_uop_bits_exc_cause(_slots_7_io_out_uop_exc_cause),
		.io_in_uop_bits_mem_cmd(_slots_7_io_out_uop_mem_cmd),
		.io_in_uop_bits_mem_size(_slots_7_io_out_uop_mem_size),
		.io_in_uop_bits_mem_signed(_slots_7_io_out_uop_mem_signed),
		.io_in_uop_bits_uses_ldq(_slots_7_io_out_uop_uses_ldq),
		.io_in_uop_bits_uses_stq(_slots_7_io_out_uop_uses_stq),
		.io_in_uop_bits_is_unique(_slots_7_io_out_uop_is_unique),
		.io_in_uop_bits_flush_on_commit(_slots_7_io_out_uop_flush_on_commit),
		.io_in_uop_bits_csr_cmd(_slots_7_io_out_uop_csr_cmd),
		.io_in_uop_bits_ldst_is_rs1(_slots_7_io_out_uop_ldst_is_rs1),
		.io_in_uop_bits_ldst(_slots_7_io_out_uop_ldst),
		.io_in_uop_bits_lrs1(_slots_7_io_out_uop_lrs1),
		.io_in_uop_bits_lrs2(_slots_7_io_out_uop_lrs2),
		.io_in_uop_bits_lrs3(_slots_7_io_out_uop_lrs3),
		.io_in_uop_bits_dst_rtype(_slots_7_io_out_uop_dst_rtype),
		.io_in_uop_bits_lrs1_rtype(_slots_7_io_out_uop_lrs1_rtype),
		.io_in_uop_bits_lrs2_rtype(_slots_7_io_out_uop_lrs2_rtype),
		.io_in_uop_bits_frs3_en(_slots_7_io_out_uop_frs3_en),
		.io_in_uop_bits_fcn_dw(_slots_7_io_out_uop_fcn_dw),
		.io_in_uop_bits_fcn_op(_slots_7_io_out_uop_fcn_op),
		.io_in_uop_bits_fp_val(_slots_7_io_out_uop_fp_val),
		.io_in_uop_bits_xcpt_pf_if(_slots_7_io_out_uop_xcpt_pf_if),
		.io_in_uop_bits_xcpt_ae_if(_slots_7_io_out_uop_xcpt_ae_if),
		.io_in_uop_bits_xcpt_ma_if(_slots_7_io_out_uop_xcpt_ma_if),
		.io_in_uop_bits_bp_debug_if(_slots_7_io_out_uop_bp_debug_if),
		.io_in_uop_bits_bp_xcpt_if(_slots_7_io_out_uop_bp_xcpt_if),
		.io_in_uop_bits_debug_fsrc(_slots_7_io_out_uop_debug_fsrc),
		.io_in_uop_bits_debug_tsrc(_slots_7_io_out_uop_debug_tsrc),
		.io_out_uop_inst(_slots_6_io_out_uop_inst),
		.io_out_uop_debug_inst(_slots_6_io_out_uop_debug_inst),
		.io_out_uop_is_rvc(_slots_6_io_out_uop_is_rvc),
		.io_out_uop_debug_pc(_slots_6_io_out_uop_debug_pc),
		.io_out_uop_iq_type_0(_slots_6_io_out_uop_iq_type_0),
		.io_out_uop_iq_type_1(_slots_6_io_out_uop_iq_type_1),
		.io_out_uop_iq_type_2(_slots_6_io_out_uop_iq_type_2),
		.io_out_uop_iq_type_3(_slots_6_io_out_uop_iq_type_3),
		.io_out_uop_fu_code_0(_slots_6_io_out_uop_fu_code_0),
		.io_out_uop_fu_code_1(_slots_6_io_out_uop_fu_code_1),
		.io_out_uop_fu_code_2(_slots_6_io_out_uop_fu_code_2),
		.io_out_uop_fu_code_3(_slots_6_io_out_uop_fu_code_3),
		.io_out_uop_fu_code_4(_slots_6_io_out_uop_fu_code_4),
		.io_out_uop_fu_code_5(_slots_6_io_out_uop_fu_code_5),
		.io_out_uop_fu_code_6(_slots_6_io_out_uop_fu_code_6),
		.io_out_uop_fu_code_7(_slots_6_io_out_uop_fu_code_7),
		.io_out_uop_fu_code_8(_slots_6_io_out_uop_fu_code_8),
		.io_out_uop_fu_code_9(_slots_6_io_out_uop_fu_code_9),
		.io_out_uop_iw_issued(_slots_6_io_out_uop_iw_issued),
		.io_out_uop_iw_p1_speculative_child(_slots_6_io_out_uop_iw_p1_speculative_child),
		.io_out_uop_iw_p2_speculative_child(_slots_6_io_out_uop_iw_p2_speculative_child),
		.io_out_uop_iw_p1_bypass_hint(_slots_6_io_out_uop_iw_p1_bypass_hint),
		.io_out_uop_iw_p2_bypass_hint(_slots_6_io_out_uop_iw_p2_bypass_hint),
		.io_out_uop_iw_p3_bypass_hint(_slots_6_io_out_uop_iw_p3_bypass_hint),
		.io_out_uop_dis_col_sel(_slots_6_io_out_uop_dis_col_sel),
		.io_out_uop_br_mask(_slots_6_io_out_uop_br_mask),
		.io_out_uop_br_tag(_slots_6_io_out_uop_br_tag),
		.io_out_uop_br_type(_slots_6_io_out_uop_br_type),
		.io_out_uop_is_sfb(_slots_6_io_out_uop_is_sfb),
		.io_out_uop_is_fence(_slots_6_io_out_uop_is_fence),
		.io_out_uop_is_fencei(_slots_6_io_out_uop_is_fencei),
		.io_out_uop_is_sfence(_slots_6_io_out_uop_is_sfence),
		.io_out_uop_is_amo(_slots_6_io_out_uop_is_amo),
		.io_out_uop_is_eret(_slots_6_io_out_uop_is_eret),
		.io_out_uop_is_sys_pc2epc(_slots_6_io_out_uop_is_sys_pc2epc),
		.io_out_uop_is_rocc(_slots_6_io_out_uop_is_rocc),
		.io_out_uop_is_mov(_slots_6_io_out_uop_is_mov),
		.io_out_uop_ftq_idx(_slots_6_io_out_uop_ftq_idx),
		.io_out_uop_edge_inst(_slots_6_io_out_uop_edge_inst),
		.io_out_uop_pc_lob(_slots_6_io_out_uop_pc_lob),
		.io_out_uop_taken(_slots_6_io_out_uop_taken),
		.io_out_uop_imm_rename(_slots_6_io_out_uop_imm_rename),
		.io_out_uop_imm_sel(_slots_6_io_out_uop_imm_sel),
		.io_out_uop_pimm(_slots_6_io_out_uop_pimm),
		.io_out_uop_imm_packed(_slots_6_io_out_uop_imm_packed),
		.io_out_uop_op1_sel(_slots_6_io_out_uop_op1_sel),
		.io_out_uop_op2_sel(_slots_6_io_out_uop_op2_sel),
		.io_out_uop_fp_ctrl_ldst(_slots_6_io_out_uop_fp_ctrl_ldst),
		.io_out_uop_fp_ctrl_wen(_slots_6_io_out_uop_fp_ctrl_wen),
		.io_out_uop_fp_ctrl_ren1(_slots_6_io_out_uop_fp_ctrl_ren1),
		.io_out_uop_fp_ctrl_ren2(_slots_6_io_out_uop_fp_ctrl_ren2),
		.io_out_uop_fp_ctrl_ren3(_slots_6_io_out_uop_fp_ctrl_ren3),
		.io_out_uop_fp_ctrl_swap12(_slots_6_io_out_uop_fp_ctrl_swap12),
		.io_out_uop_fp_ctrl_swap23(_slots_6_io_out_uop_fp_ctrl_swap23),
		.io_out_uop_fp_ctrl_typeTagIn(_slots_6_io_out_uop_fp_ctrl_typeTagIn),
		.io_out_uop_fp_ctrl_typeTagOut(_slots_6_io_out_uop_fp_ctrl_typeTagOut),
		.io_out_uop_fp_ctrl_fromint(_slots_6_io_out_uop_fp_ctrl_fromint),
		.io_out_uop_fp_ctrl_toint(_slots_6_io_out_uop_fp_ctrl_toint),
		.io_out_uop_fp_ctrl_fastpipe(_slots_6_io_out_uop_fp_ctrl_fastpipe),
		.io_out_uop_fp_ctrl_fma(_slots_6_io_out_uop_fp_ctrl_fma),
		.io_out_uop_fp_ctrl_div(_slots_6_io_out_uop_fp_ctrl_div),
		.io_out_uop_fp_ctrl_sqrt(_slots_6_io_out_uop_fp_ctrl_sqrt),
		.io_out_uop_fp_ctrl_wflags(_slots_6_io_out_uop_fp_ctrl_wflags),
		.io_out_uop_fp_ctrl_vec(_slots_6_io_out_uop_fp_ctrl_vec),
		.io_out_uop_rob_idx(_slots_6_io_out_uop_rob_idx),
		.io_out_uop_ldq_idx(_slots_6_io_out_uop_ldq_idx),
		.io_out_uop_stq_idx(_slots_6_io_out_uop_stq_idx),
		.io_out_uop_rxq_idx(_slots_6_io_out_uop_rxq_idx),
		.io_out_uop_pdst(_slots_6_io_out_uop_pdst),
		.io_out_uop_prs1(_slots_6_io_out_uop_prs1),
		.io_out_uop_prs2(_slots_6_io_out_uop_prs2),
		.io_out_uop_prs3(_slots_6_io_out_uop_prs3),
		.io_out_uop_ppred(_slots_6_io_out_uop_ppred),
		.io_out_uop_prs1_busy(_slots_6_io_out_uop_prs1_busy),
		.io_out_uop_prs2_busy(_slots_6_io_out_uop_prs2_busy),
		.io_out_uop_prs3_busy(_slots_6_io_out_uop_prs3_busy),
		.io_out_uop_ppred_busy(_slots_6_io_out_uop_ppred_busy),
		.io_out_uop_stale_pdst(_slots_6_io_out_uop_stale_pdst),
		.io_out_uop_exception(_slots_6_io_out_uop_exception),
		.io_out_uop_exc_cause(_slots_6_io_out_uop_exc_cause),
		.io_out_uop_mem_cmd(_slots_6_io_out_uop_mem_cmd),
		.io_out_uop_mem_size(_slots_6_io_out_uop_mem_size),
		.io_out_uop_mem_signed(_slots_6_io_out_uop_mem_signed),
		.io_out_uop_uses_ldq(_slots_6_io_out_uop_uses_ldq),
		.io_out_uop_uses_stq(_slots_6_io_out_uop_uses_stq),
		.io_out_uop_is_unique(_slots_6_io_out_uop_is_unique),
		.io_out_uop_flush_on_commit(_slots_6_io_out_uop_flush_on_commit),
		.io_out_uop_csr_cmd(_slots_6_io_out_uop_csr_cmd),
		.io_out_uop_ldst_is_rs1(_slots_6_io_out_uop_ldst_is_rs1),
		.io_out_uop_ldst(_slots_6_io_out_uop_ldst),
		.io_out_uop_lrs1(_slots_6_io_out_uop_lrs1),
		.io_out_uop_lrs2(_slots_6_io_out_uop_lrs2),
		.io_out_uop_lrs3(_slots_6_io_out_uop_lrs3),
		.io_out_uop_dst_rtype(_slots_6_io_out_uop_dst_rtype),
		.io_out_uop_lrs1_rtype(_slots_6_io_out_uop_lrs1_rtype),
		.io_out_uop_lrs2_rtype(_slots_6_io_out_uop_lrs2_rtype),
		.io_out_uop_frs3_en(_slots_6_io_out_uop_frs3_en),
		.io_out_uop_fcn_dw(_slots_6_io_out_uop_fcn_dw),
		.io_out_uop_fcn_op(_slots_6_io_out_uop_fcn_op),
		.io_out_uop_fp_val(_slots_6_io_out_uop_fp_val),
		.io_out_uop_xcpt_pf_if(_slots_6_io_out_uop_xcpt_pf_if),
		.io_out_uop_xcpt_ae_if(_slots_6_io_out_uop_xcpt_ae_if),
		.io_out_uop_xcpt_ma_if(_slots_6_io_out_uop_xcpt_ma_if),
		.io_out_uop_bp_debug_if(_slots_6_io_out_uop_bp_debug_if),
		.io_out_uop_bp_xcpt_if(_slots_6_io_out_uop_bp_xcpt_if),
		.io_out_uop_debug_fsrc(_slots_6_io_out_uop_debug_fsrc),
		.io_out_uop_debug_tsrc(_slots_6_io_out_uop_debug_tsrc),
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
		.io_pred_wakeup_port_valid(io_pred_wakeup_port_valid),
		.io_pred_wakeup_port_bits(io_pred_wakeup_port_bits),
		.io_child_rebusys(io_child_rebusys)
	);
	IssueSlot_16 slots_7(
		.clock(clock),
		.reset(reset),
		.io_valid(_slots_7_io_valid),
		.io_will_be_valid(_slots_7_io_will_be_valid),
		.io_request(_slots_7_io_request),
		.io_grant(issue_slots_7_grant),
		.io_iss_uop_inst(),
		.io_iss_uop_debug_inst(),
		.io_iss_uop_is_rvc(_slots_7_io_iss_uop_is_rvc),
		.io_iss_uop_debug_pc(),
		.io_iss_uop_iq_type_0(),
		.io_iss_uop_iq_type_1(),
		.io_iss_uop_iq_type_2(),
		.io_iss_uop_iq_type_3(),
		.io_iss_uop_fu_code_0(_slots_7_io_iss_uop_fu_code_0),
		.io_iss_uop_fu_code_1(),
		.io_iss_uop_fu_code_2(),
		.io_iss_uop_fu_code_3(),
		.io_iss_uop_fu_code_4(),
		.io_iss_uop_fu_code_5(),
		.io_iss_uop_fu_code_6(),
		.io_iss_uop_fu_code_7(),
		.io_iss_uop_fu_code_8(),
		.io_iss_uop_fu_code_9(),
		.io_iss_uop_iw_issued(),
		.io_iss_uop_iw_p1_speculative_child(),
		.io_iss_uop_iw_p2_speculative_child(),
		.io_iss_uop_iw_p1_bypass_hint(_slots_7_io_iss_uop_iw_p1_bypass_hint),
		.io_iss_uop_iw_p2_bypass_hint(_slots_7_io_iss_uop_iw_p2_bypass_hint),
		.io_iss_uop_iw_p3_bypass_hint(),
		.io_iss_uop_dis_col_sel(),
		.io_iss_uop_br_mask(_slots_7_io_iss_uop_br_mask),
		.io_iss_uop_br_tag(_slots_7_io_iss_uop_br_tag),
		.io_iss_uop_br_type(_slots_7_io_iss_uop_br_type),
		.io_iss_uop_is_sfb(_slots_7_io_iss_uop_is_sfb),
		.io_iss_uop_is_fence(),
		.io_iss_uop_is_fencei(),
		.io_iss_uop_is_sfence(),
		.io_iss_uop_is_amo(),
		.io_iss_uop_is_eret(),
		.io_iss_uop_is_sys_pc2epc(),
		.io_iss_uop_is_rocc(),
		.io_iss_uop_is_mov(_slots_7_io_iss_uop_is_mov),
		.io_iss_uop_ftq_idx(_slots_7_io_iss_uop_ftq_idx),
		.io_iss_uop_edge_inst(_slots_7_io_iss_uop_edge_inst),
		.io_iss_uop_pc_lob(_slots_7_io_iss_uop_pc_lob),
		.io_iss_uop_taken(_slots_7_io_iss_uop_taken),
		.io_iss_uop_imm_rename(),
		.io_iss_uop_imm_sel(_slots_7_io_iss_uop_imm_sel),
		.io_iss_uop_pimm(_slots_7_io_iss_uop_pimm),
		.io_iss_uop_imm_packed(),
		.io_iss_uop_op1_sel(_slots_7_io_iss_uop_op1_sel),
		.io_iss_uop_op2_sel(_slots_7_io_iss_uop_op2_sel),
		.io_iss_uop_fp_ctrl_ldst(),
		.io_iss_uop_fp_ctrl_wen(),
		.io_iss_uop_fp_ctrl_ren1(),
		.io_iss_uop_fp_ctrl_ren2(),
		.io_iss_uop_fp_ctrl_ren3(),
		.io_iss_uop_fp_ctrl_swap12(),
		.io_iss_uop_fp_ctrl_swap23(),
		.io_iss_uop_fp_ctrl_typeTagIn(),
		.io_iss_uop_fp_ctrl_typeTagOut(),
		.io_iss_uop_fp_ctrl_fromint(),
		.io_iss_uop_fp_ctrl_toint(),
		.io_iss_uop_fp_ctrl_fastpipe(),
		.io_iss_uop_fp_ctrl_fma(),
		.io_iss_uop_fp_ctrl_div(),
		.io_iss_uop_fp_ctrl_sqrt(),
		.io_iss_uop_fp_ctrl_wflags(),
		.io_iss_uop_fp_ctrl_vec(),
		.io_iss_uop_rob_idx(_slots_7_io_iss_uop_rob_idx),
		.io_iss_uop_ldq_idx(),
		.io_iss_uop_stq_idx(),
		.io_iss_uop_rxq_idx(),
		.io_iss_uop_pdst(_slots_7_io_iss_uop_pdst),
		.io_iss_uop_prs1(_slots_7_io_iss_uop_prs1),
		.io_iss_uop_prs2(_slots_7_io_iss_uop_prs2),
		.io_iss_uop_prs3(),
		.io_iss_uop_ppred(_slots_7_io_iss_uop_ppred),
		.io_iss_uop_prs1_busy(),
		.io_iss_uop_prs2_busy(),
		.io_iss_uop_prs3_busy(),
		.io_iss_uop_ppred_busy(),
		.io_iss_uop_stale_pdst(),
		.io_iss_uop_exception(),
		.io_iss_uop_exc_cause(),
		.io_iss_uop_mem_cmd(),
		.io_iss_uop_mem_size(),
		.io_iss_uop_mem_signed(),
		.io_iss_uop_uses_ldq(),
		.io_iss_uop_uses_stq(),
		.io_iss_uop_is_unique(),
		.io_iss_uop_flush_on_commit(),
		.io_iss_uop_csr_cmd(_slots_7_io_iss_uop_csr_cmd),
		.io_iss_uop_ldst_is_rs1(_slots_7_io_iss_uop_ldst_is_rs1),
		.io_iss_uop_ldst(),
		.io_iss_uop_lrs1(),
		.io_iss_uop_lrs2(),
		.io_iss_uop_lrs3(),
		.io_iss_uop_dst_rtype(_slots_7_io_iss_uop_dst_rtype),
		.io_iss_uop_lrs1_rtype(_slots_7_io_iss_uop_lrs1_rtype),
		.io_iss_uop_lrs2_rtype(_slots_7_io_iss_uop_lrs2_rtype),
		.io_iss_uop_frs3_en(),
		.io_iss_uop_fcn_dw(_slots_7_io_iss_uop_fcn_dw),
		.io_iss_uop_fcn_op(_slots_7_io_iss_uop_fcn_op),
		.io_iss_uop_fp_val(),
		.io_iss_uop_xcpt_pf_if(),
		.io_iss_uop_xcpt_ae_if(),
		.io_iss_uop_xcpt_ma_if(),
		.io_iss_uop_bp_debug_if(),
		.io_iss_uop_bp_xcpt_if(),
		.io_iss_uop_debug_fsrc(),
		.io_iss_uop_debug_tsrc(),
		.io_in_uop_valid(issue_slots_7_in_uop_valid),
		.io_in_uop_bits_inst(io_dis_uops_0_bits_inst),
		.io_in_uop_bits_debug_inst(io_dis_uops_0_bits_debug_inst),
		.io_in_uop_bits_is_rvc(io_dis_uops_0_bits_is_rvc),
		.io_in_uop_bits_debug_pc(io_dis_uops_0_bits_debug_pc),
		.io_in_uop_bits_iq_type_0(io_dis_uops_0_bits_iq_type_0),
		.io_in_uop_bits_iq_type_1(io_dis_uops_0_bits_iq_type_1),
		.io_in_uop_bits_iq_type_2(io_dis_uops_0_bits_iq_type_2),
		.io_in_uop_bits_iq_type_3(io_dis_uops_0_bits_iq_type_3),
		.io_in_uop_bits_fu_code_0(io_dis_uops_0_bits_fu_code_0),
		.io_in_uop_bits_fu_code_1(io_dis_uops_0_bits_fu_code_1),
		.io_in_uop_bits_fu_code_2(io_dis_uops_0_bits_fu_code_2),
		.io_in_uop_bits_fu_code_3(io_dis_uops_0_bits_fu_code_3),
		.io_in_uop_bits_fu_code_4(io_dis_uops_0_bits_fu_code_4),
		.io_in_uop_bits_fu_code_5(io_dis_uops_0_bits_fu_code_5),
		.io_in_uop_bits_fu_code_6(io_dis_uops_0_bits_fu_code_6),
		.io_in_uop_bits_fu_code_7(io_dis_uops_0_bits_fu_code_7),
		.io_in_uop_bits_fu_code_8(io_dis_uops_0_bits_fu_code_8),
		.io_in_uop_bits_fu_code_9(io_dis_uops_0_bits_fu_code_9),
		.io_in_uop_bits_iw_issued(1'h0),
		.io_in_uop_bits_iw_p1_speculative_child((_GEN ? prs1_wakeups_2 : io_dis_uops_0_bits_iw_p1_speculative_child)),
		.io_in_uop_bits_iw_p2_speculative_child((_GEN_0 ? prs2_wakeups_2 : io_dis_uops_0_bits_iw_p2_speculative_child)),
		.io_in_uop_bits_iw_p1_bypass_hint(_GEN & ((prs1_wakeups_0 & io_wakeup_ports_0_bits_bypassable) | prs1_wakeups_2)),
		.io_in_uop_bits_iw_p2_bypass_hint(_GEN_0 & ((prs2_wakeups_0 & io_wakeup_ports_0_bits_bypassable) | prs2_wakeups_2)),
		.io_in_uop_bits_iw_p3_bypass_hint(_GEN_1 & ((prs3_wakeups_0 & io_wakeup_ports_0_bits_bypassable) | prs3_wakeups_2)),
		.io_in_uop_bits_dis_col_sel(1'h0),
		.io_in_uop_bits_br_mask(io_dis_uops_0_bits_br_mask),
		.io_in_uop_bits_br_tag(io_dis_uops_0_bits_br_tag),
		.io_in_uop_bits_br_type(io_dis_uops_0_bits_br_type),
		.io_in_uop_bits_is_sfb(io_dis_uops_0_bits_is_sfb),
		.io_in_uop_bits_is_fence(io_dis_uops_0_bits_is_fence),
		.io_in_uop_bits_is_fencei(io_dis_uops_0_bits_is_fencei),
		.io_in_uop_bits_is_sfence(io_dis_uops_0_bits_is_sfence),
		.io_in_uop_bits_is_amo(io_dis_uops_0_bits_is_amo),
		.io_in_uop_bits_is_eret(io_dis_uops_0_bits_is_eret),
		.io_in_uop_bits_is_sys_pc2epc(io_dis_uops_0_bits_is_sys_pc2epc),
		.io_in_uop_bits_is_rocc(io_dis_uops_0_bits_is_rocc),
		.io_in_uop_bits_is_mov(io_dis_uops_0_bits_is_mov),
		.io_in_uop_bits_ftq_idx(io_dis_uops_0_bits_ftq_idx),
		.io_in_uop_bits_edge_inst(io_dis_uops_0_bits_edge_inst),
		.io_in_uop_bits_pc_lob(io_dis_uops_0_bits_pc_lob),
		.io_in_uop_bits_taken(io_dis_uops_0_bits_taken),
		.io_in_uop_bits_imm_rename(io_dis_uops_0_bits_imm_rename),
		.io_in_uop_bits_imm_sel(io_dis_uops_0_bits_imm_sel),
		.io_in_uop_bits_pimm(io_dis_uops_0_bits_pimm),
		.io_in_uop_bits_imm_packed(io_dis_uops_0_bits_imm_packed),
		.io_in_uop_bits_op1_sel(io_dis_uops_0_bits_op1_sel),
		.io_in_uop_bits_op2_sel(io_dis_uops_0_bits_op2_sel),
		.io_in_uop_bits_fp_ctrl_ldst(io_dis_uops_0_bits_fp_ctrl_ldst),
		.io_in_uop_bits_fp_ctrl_wen(io_dis_uops_0_bits_fp_ctrl_wen),
		.io_in_uop_bits_fp_ctrl_ren1(io_dis_uops_0_bits_fp_ctrl_ren1),
		.io_in_uop_bits_fp_ctrl_ren2(io_dis_uops_0_bits_fp_ctrl_ren2),
		.io_in_uop_bits_fp_ctrl_ren3(io_dis_uops_0_bits_fp_ctrl_ren3),
		.io_in_uop_bits_fp_ctrl_swap12(io_dis_uops_0_bits_fp_ctrl_swap12),
		.io_in_uop_bits_fp_ctrl_swap23(io_dis_uops_0_bits_fp_ctrl_swap23),
		.io_in_uop_bits_fp_ctrl_typeTagIn(io_dis_uops_0_bits_fp_ctrl_typeTagIn),
		.io_in_uop_bits_fp_ctrl_typeTagOut(io_dis_uops_0_bits_fp_ctrl_typeTagOut),
		.io_in_uop_bits_fp_ctrl_fromint(io_dis_uops_0_bits_fp_ctrl_fromint),
		.io_in_uop_bits_fp_ctrl_toint(io_dis_uops_0_bits_fp_ctrl_toint),
		.io_in_uop_bits_fp_ctrl_fastpipe(io_dis_uops_0_bits_fp_ctrl_fastpipe),
		.io_in_uop_bits_fp_ctrl_fma(io_dis_uops_0_bits_fp_ctrl_fma),
		.io_in_uop_bits_fp_ctrl_div(io_dis_uops_0_bits_fp_ctrl_div),
		.io_in_uop_bits_fp_ctrl_sqrt(io_dis_uops_0_bits_fp_ctrl_sqrt),
		.io_in_uop_bits_fp_ctrl_wflags(io_dis_uops_0_bits_fp_ctrl_wflags),
		.io_in_uop_bits_fp_ctrl_vec(io_dis_uops_0_bits_fp_ctrl_vec),
		.io_in_uop_bits_rob_idx(io_dis_uops_0_bits_rob_idx),
		.io_in_uop_bits_ldq_idx(io_dis_uops_0_bits_ldq_idx),
		.io_in_uop_bits_stq_idx(io_dis_uops_0_bits_stq_idx),
		.io_in_uop_bits_rxq_idx(io_dis_uops_0_bits_rxq_idx),
		.io_in_uop_bits_pdst(io_dis_uops_0_bits_pdst),
		.io_in_uop_bits_prs1(io_dis_uops_0_bits_prs1),
		.io_in_uop_bits_prs2(io_dis_uops_0_bits_prs2),
		.io_in_uop_bits_prs3(io_dis_uops_0_bits_prs3),
		.io_in_uop_bits_ppred(io_dis_uops_0_bits_ppred),
		.io_in_uop_bits_prs1_busy(((io_wakeup_ports_0_bits_rebusy & prs1_matches_0) | (io_child_rebusys & io_dis_uops_0_bits_iw_p1_speculative_child) ? io_dis_uops_0_bits_lrs1_rtype == 2'h0 : ~_GEN & io_dis_uops_0_bits_prs1_busy)),
		.io_in_uop_bits_prs2_busy(((io_wakeup_ports_0_bits_rebusy & prs2_matches_0) | (io_child_rebusys & io_dis_uops_0_bits_iw_p2_speculative_child) ? io_dis_uops_0_bits_lrs2_rtype == 2'h0 : ~_GEN_0 & io_dis_uops_0_bits_prs2_busy)),
		.io_in_uop_bits_prs3_busy(~_GEN_1 & io_dis_uops_0_bits_prs3_busy),
		.io_in_uop_bits_ppred_busy(~(io_pred_wakeup_port_valid & (io_pred_wakeup_port_bits == io_dis_uops_0_bits_ppred)) & io_dis_uops_0_bits_ppred_busy),
		.io_in_uop_bits_stale_pdst(io_dis_uops_0_bits_stale_pdst),
		.io_in_uop_bits_exception(io_dis_uops_0_bits_exception),
		.io_in_uop_bits_exc_cause(io_dis_uops_0_bits_exc_cause),
		.io_in_uop_bits_mem_cmd(io_dis_uops_0_bits_mem_cmd),
		.io_in_uop_bits_mem_size(io_dis_uops_0_bits_mem_size),
		.io_in_uop_bits_mem_signed(io_dis_uops_0_bits_mem_signed),
		.io_in_uop_bits_uses_ldq(io_dis_uops_0_bits_uses_ldq),
		.io_in_uop_bits_uses_stq(io_dis_uops_0_bits_uses_stq),
		.io_in_uop_bits_is_unique(io_dis_uops_0_bits_is_unique),
		.io_in_uop_bits_flush_on_commit(io_dis_uops_0_bits_flush_on_commit),
		.io_in_uop_bits_csr_cmd(io_dis_uops_0_bits_csr_cmd),
		.io_in_uop_bits_ldst_is_rs1(io_dis_uops_0_bits_ldst_is_rs1),
		.io_in_uop_bits_ldst(io_dis_uops_0_bits_ldst),
		.io_in_uop_bits_lrs1(io_dis_uops_0_bits_lrs1),
		.io_in_uop_bits_lrs2(io_dis_uops_0_bits_lrs2),
		.io_in_uop_bits_lrs3(io_dis_uops_0_bits_lrs3),
		.io_in_uop_bits_dst_rtype(io_dis_uops_0_bits_dst_rtype),
		.io_in_uop_bits_lrs1_rtype(io_dis_uops_0_bits_lrs1_rtype),
		.io_in_uop_bits_lrs2_rtype(io_dis_uops_0_bits_lrs2_rtype),
		.io_in_uop_bits_frs3_en(io_dis_uops_0_bits_frs3_en),
		.io_in_uop_bits_fcn_dw(io_dis_uops_0_bits_fcn_dw),
		.io_in_uop_bits_fcn_op(io_dis_uops_0_bits_fcn_op),
		.io_in_uop_bits_fp_val(io_dis_uops_0_bits_fp_val),
		.io_in_uop_bits_xcpt_pf_if(io_dis_uops_0_bits_xcpt_pf_if),
		.io_in_uop_bits_xcpt_ae_if(io_dis_uops_0_bits_xcpt_ae_if),
		.io_in_uop_bits_xcpt_ma_if(io_dis_uops_0_bits_xcpt_ma_if),
		.io_in_uop_bits_bp_debug_if(io_dis_uops_0_bits_bp_debug_if),
		.io_in_uop_bits_bp_xcpt_if(io_dis_uops_0_bits_bp_xcpt_if),
		.io_in_uop_bits_debug_fsrc(io_dis_uops_0_bits_debug_fsrc),
		.io_in_uop_bits_debug_tsrc(io_dis_uops_0_bits_debug_tsrc),
		.io_out_uop_inst(_slots_7_io_out_uop_inst),
		.io_out_uop_debug_inst(_slots_7_io_out_uop_debug_inst),
		.io_out_uop_is_rvc(_slots_7_io_out_uop_is_rvc),
		.io_out_uop_debug_pc(_slots_7_io_out_uop_debug_pc),
		.io_out_uop_iq_type_0(_slots_7_io_out_uop_iq_type_0),
		.io_out_uop_iq_type_1(_slots_7_io_out_uop_iq_type_1),
		.io_out_uop_iq_type_2(_slots_7_io_out_uop_iq_type_2),
		.io_out_uop_iq_type_3(_slots_7_io_out_uop_iq_type_3),
		.io_out_uop_fu_code_0(_slots_7_io_out_uop_fu_code_0),
		.io_out_uop_fu_code_1(_slots_7_io_out_uop_fu_code_1),
		.io_out_uop_fu_code_2(_slots_7_io_out_uop_fu_code_2),
		.io_out_uop_fu_code_3(_slots_7_io_out_uop_fu_code_3),
		.io_out_uop_fu_code_4(_slots_7_io_out_uop_fu_code_4),
		.io_out_uop_fu_code_5(_slots_7_io_out_uop_fu_code_5),
		.io_out_uop_fu_code_6(_slots_7_io_out_uop_fu_code_6),
		.io_out_uop_fu_code_7(_slots_7_io_out_uop_fu_code_7),
		.io_out_uop_fu_code_8(_slots_7_io_out_uop_fu_code_8),
		.io_out_uop_fu_code_9(_slots_7_io_out_uop_fu_code_9),
		.io_out_uop_iw_issued(_slots_7_io_out_uop_iw_issued),
		.io_out_uop_iw_p1_speculative_child(_slots_7_io_out_uop_iw_p1_speculative_child),
		.io_out_uop_iw_p2_speculative_child(_slots_7_io_out_uop_iw_p2_speculative_child),
		.io_out_uop_iw_p1_bypass_hint(_slots_7_io_out_uop_iw_p1_bypass_hint),
		.io_out_uop_iw_p2_bypass_hint(_slots_7_io_out_uop_iw_p2_bypass_hint),
		.io_out_uop_iw_p3_bypass_hint(_slots_7_io_out_uop_iw_p3_bypass_hint),
		.io_out_uop_dis_col_sel(_slots_7_io_out_uop_dis_col_sel),
		.io_out_uop_br_mask(_slots_7_io_out_uop_br_mask),
		.io_out_uop_br_tag(_slots_7_io_out_uop_br_tag),
		.io_out_uop_br_type(_slots_7_io_out_uop_br_type),
		.io_out_uop_is_sfb(_slots_7_io_out_uop_is_sfb),
		.io_out_uop_is_fence(_slots_7_io_out_uop_is_fence),
		.io_out_uop_is_fencei(_slots_7_io_out_uop_is_fencei),
		.io_out_uop_is_sfence(_slots_7_io_out_uop_is_sfence),
		.io_out_uop_is_amo(_slots_7_io_out_uop_is_amo),
		.io_out_uop_is_eret(_slots_7_io_out_uop_is_eret),
		.io_out_uop_is_sys_pc2epc(_slots_7_io_out_uop_is_sys_pc2epc),
		.io_out_uop_is_rocc(_slots_7_io_out_uop_is_rocc),
		.io_out_uop_is_mov(_slots_7_io_out_uop_is_mov),
		.io_out_uop_ftq_idx(_slots_7_io_out_uop_ftq_idx),
		.io_out_uop_edge_inst(_slots_7_io_out_uop_edge_inst),
		.io_out_uop_pc_lob(_slots_7_io_out_uop_pc_lob),
		.io_out_uop_taken(_slots_7_io_out_uop_taken),
		.io_out_uop_imm_rename(_slots_7_io_out_uop_imm_rename),
		.io_out_uop_imm_sel(_slots_7_io_out_uop_imm_sel),
		.io_out_uop_pimm(_slots_7_io_out_uop_pimm),
		.io_out_uop_imm_packed(_slots_7_io_out_uop_imm_packed),
		.io_out_uop_op1_sel(_slots_7_io_out_uop_op1_sel),
		.io_out_uop_op2_sel(_slots_7_io_out_uop_op2_sel),
		.io_out_uop_fp_ctrl_ldst(_slots_7_io_out_uop_fp_ctrl_ldst),
		.io_out_uop_fp_ctrl_wen(_slots_7_io_out_uop_fp_ctrl_wen),
		.io_out_uop_fp_ctrl_ren1(_slots_7_io_out_uop_fp_ctrl_ren1),
		.io_out_uop_fp_ctrl_ren2(_slots_7_io_out_uop_fp_ctrl_ren2),
		.io_out_uop_fp_ctrl_ren3(_slots_7_io_out_uop_fp_ctrl_ren3),
		.io_out_uop_fp_ctrl_swap12(_slots_7_io_out_uop_fp_ctrl_swap12),
		.io_out_uop_fp_ctrl_swap23(_slots_7_io_out_uop_fp_ctrl_swap23),
		.io_out_uop_fp_ctrl_typeTagIn(_slots_7_io_out_uop_fp_ctrl_typeTagIn),
		.io_out_uop_fp_ctrl_typeTagOut(_slots_7_io_out_uop_fp_ctrl_typeTagOut),
		.io_out_uop_fp_ctrl_fromint(_slots_7_io_out_uop_fp_ctrl_fromint),
		.io_out_uop_fp_ctrl_toint(_slots_7_io_out_uop_fp_ctrl_toint),
		.io_out_uop_fp_ctrl_fastpipe(_slots_7_io_out_uop_fp_ctrl_fastpipe),
		.io_out_uop_fp_ctrl_fma(_slots_7_io_out_uop_fp_ctrl_fma),
		.io_out_uop_fp_ctrl_div(_slots_7_io_out_uop_fp_ctrl_div),
		.io_out_uop_fp_ctrl_sqrt(_slots_7_io_out_uop_fp_ctrl_sqrt),
		.io_out_uop_fp_ctrl_wflags(_slots_7_io_out_uop_fp_ctrl_wflags),
		.io_out_uop_fp_ctrl_vec(_slots_7_io_out_uop_fp_ctrl_vec),
		.io_out_uop_rob_idx(_slots_7_io_out_uop_rob_idx),
		.io_out_uop_ldq_idx(_slots_7_io_out_uop_ldq_idx),
		.io_out_uop_stq_idx(_slots_7_io_out_uop_stq_idx),
		.io_out_uop_rxq_idx(_slots_7_io_out_uop_rxq_idx),
		.io_out_uop_pdst(_slots_7_io_out_uop_pdst),
		.io_out_uop_prs1(_slots_7_io_out_uop_prs1),
		.io_out_uop_prs2(_slots_7_io_out_uop_prs2),
		.io_out_uop_prs3(_slots_7_io_out_uop_prs3),
		.io_out_uop_ppred(_slots_7_io_out_uop_ppred),
		.io_out_uop_prs1_busy(_slots_7_io_out_uop_prs1_busy),
		.io_out_uop_prs2_busy(_slots_7_io_out_uop_prs2_busy),
		.io_out_uop_prs3_busy(_slots_7_io_out_uop_prs3_busy),
		.io_out_uop_ppred_busy(_slots_7_io_out_uop_ppred_busy),
		.io_out_uop_stale_pdst(_slots_7_io_out_uop_stale_pdst),
		.io_out_uop_exception(_slots_7_io_out_uop_exception),
		.io_out_uop_exc_cause(_slots_7_io_out_uop_exc_cause),
		.io_out_uop_mem_cmd(_slots_7_io_out_uop_mem_cmd),
		.io_out_uop_mem_size(_slots_7_io_out_uop_mem_size),
		.io_out_uop_mem_signed(_slots_7_io_out_uop_mem_signed),
		.io_out_uop_uses_ldq(_slots_7_io_out_uop_uses_ldq),
		.io_out_uop_uses_stq(_slots_7_io_out_uop_uses_stq),
		.io_out_uop_is_unique(_slots_7_io_out_uop_is_unique),
		.io_out_uop_flush_on_commit(_slots_7_io_out_uop_flush_on_commit),
		.io_out_uop_csr_cmd(_slots_7_io_out_uop_csr_cmd),
		.io_out_uop_ldst_is_rs1(_slots_7_io_out_uop_ldst_is_rs1),
		.io_out_uop_ldst(_slots_7_io_out_uop_ldst),
		.io_out_uop_lrs1(_slots_7_io_out_uop_lrs1),
		.io_out_uop_lrs2(_slots_7_io_out_uop_lrs2),
		.io_out_uop_lrs3(_slots_7_io_out_uop_lrs3),
		.io_out_uop_dst_rtype(_slots_7_io_out_uop_dst_rtype),
		.io_out_uop_lrs1_rtype(_slots_7_io_out_uop_lrs1_rtype),
		.io_out_uop_lrs2_rtype(_slots_7_io_out_uop_lrs2_rtype),
		.io_out_uop_frs3_en(_slots_7_io_out_uop_frs3_en),
		.io_out_uop_fcn_dw(_slots_7_io_out_uop_fcn_dw),
		.io_out_uop_fcn_op(_slots_7_io_out_uop_fcn_op),
		.io_out_uop_fp_val(_slots_7_io_out_uop_fp_val),
		.io_out_uop_xcpt_pf_if(_slots_7_io_out_uop_xcpt_pf_if),
		.io_out_uop_xcpt_ae_if(_slots_7_io_out_uop_xcpt_ae_if),
		.io_out_uop_xcpt_ma_if(_slots_7_io_out_uop_xcpt_ma_if),
		.io_out_uop_bp_debug_if(_slots_7_io_out_uop_bp_debug_if),
		.io_out_uop_bp_xcpt_if(_slots_7_io_out_uop_bp_xcpt_if),
		.io_out_uop_debug_fsrc(_slots_7_io_out_uop_debug_fsrc),
		.io_out_uop_debug_tsrc(_slots_7_io_out_uop_debug_tsrc),
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
		.io_pred_wakeup_port_valid(io_pred_wakeup_port_valid),
		.io_pred_wakeup_port_bits(io_pred_wakeup_port_bits),
		.io_child_rebusys(io_child_rebusys)
	);
	assign io_dis_uops_0_ready = io_dis_uops_0_ready_REG;
	assign io_iss_uops_0_valid = ~io_squash_grant & (((((((issue_slots_7_grant | issue_slots_6_grant) | issue_slots_5_grant) | issue_slots_4_grant) | issue_slots_3_grant) | issue_slots_2_grant) | issue_slots_1_grant) | issue_slots_0_grant);
	assign io_iss_uops_0_bits_is_rvc = (issue_slots_7_grant ? _slots_7_io_iss_uop_is_rvc : (issue_slots_6_grant ? _slots_6_io_iss_uop_is_rvc : (issue_slots_5_grant ? _slots_5_io_iss_uop_is_rvc : (issue_slots_4_grant ? _slots_4_io_iss_uop_is_rvc : (issue_slots_3_grant ? _slots_3_io_iss_uop_is_rvc : (issue_slots_2_grant ? _slots_2_io_iss_uop_is_rvc : (issue_slots_1_grant ? _slots_1_io_iss_uop_is_rvc : _slots_0_io_iss_uop_is_rvc)))))));
	assign io_iss_uops_0_bits_fu_code_0 = (issue_slots_7_grant ? _slots_7_io_iss_uop_fu_code_0 : (issue_slots_6_grant ? _slots_6_io_iss_uop_fu_code_0 : (issue_slots_5_grant ? _slots_5_io_iss_uop_fu_code_0 : (issue_slots_4_grant ? _slots_4_io_iss_uop_fu_code_0 : (issue_slots_3_grant ? _slots_3_io_iss_uop_fu_code_0 : (issue_slots_2_grant ? _slots_2_io_iss_uop_fu_code_0 : (issue_slots_1_grant ? _slots_1_io_iss_uop_fu_code_0 : _slots_0_io_iss_uop_fu_code_0)))))));
	assign io_iss_uops_0_bits_iw_p1_bypass_hint = (issue_slots_7_grant ? _slots_7_io_iss_uop_iw_p1_bypass_hint : (issue_slots_6_grant ? _slots_6_io_iss_uop_iw_p1_bypass_hint : (issue_slots_5_grant ? _slots_5_io_iss_uop_iw_p1_bypass_hint : (issue_slots_4_grant ? _slots_4_io_iss_uop_iw_p1_bypass_hint : (issue_slots_3_grant ? _slots_3_io_iss_uop_iw_p1_bypass_hint : (issue_slots_2_grant ? _slots_2_io_iss_uop_iw_p1_bypass_hint : (issue_slots_1_grant ? _slots_1_io_iss_uop_iw_p1_bypass_hint : _slots_0_io_iss_uop_iw_p1_bypass_hint)))))));
	assign io_iss_uops_0_bits_iw_p2_bypass_hint = (issue_slots_7_grant ? _slots_7_io_iss_uop_iw_p2_bypass_hint : (issue_slots_6_grant ? _slots_6_io_iss_uop_iw_p2_bypass_hint : (issue_slots_5_grant ? _slots_5_io_iss_uop_iw_p2_bypass_hint : (issue_slots_4_grant ? _slots_4_io_iss_uop_iw_p2_bypass_hint : (issue_slots_3_grant ? _slots_3_io_iss_uop_iw_p2_bypass_hint : (issue_slots_2_grant ? _slots_2_io_iss_uop_iw_p2_bypass_hint : (issue_slots_1_grant ? _slots_1_io_iss_uop_iw_p2_bypass_hint : _slots_0_io_iss_uop_iw_p2_bypass_hint)))))));
	assign io_iss_uops_0_bits_br_mask = (issue_slots_7_grant ? _slots_7_io_iss_uop_br_mask : (issue_slots_6_grant ? _slots_6_io_iss_uop_br_mask : (issue_slots_5_grant ? _slots_5_io_iss_uop_br_mask : (issue_slots_4_grant ? _slots_4_io_iss_uop_br_mask : (issue_slots_3_grant ? _slots_3_io_iss_uop_br_mask : (issue_slots_2_grant ? _slots_2_io_iss_uop_br_mask : (issue_slots_1_grant ? _slots_1_io_iss_uop_br_mask : _slots_0_io_iss_uop_br_mask)))))));
	assign io_iss_uops_0_bits_br_tag = (issue_slots_7_grant ? _slots_7_io_iss_uop_br_tag : (issue_slots_6_grant ? _slots_6_io_iss_uop_br_tag : (issue_slots_5_grant ? _slots_5_io_iss_uop_br_tag : (issue_slots_4_grant ? _slots_4_io_iss_uop_br_tag : (issue_slots_3_grant ? _slots_3_io_iss_uop_br_tag : (issue_slots_2_grant ? _slots_2_io_iss_uop_br_tag : (issue_slots_1_grant ? _slots_1_io_iss_uop_br_tag : _slots_0_io_iss_uop_br_tag)))))));
	assign io_iss_uops_0_bits_br_type = (issue_slots_7_grant ? _slots_7_io_iss_uop_br_type : (issue_slots_6_grant ? _slots_6_io_iss_uop_br_type : (issue_slots_5_grant ? _slots_5_io_iss_uop_br_type : (issue_slots_4_grant ? _slots_4_io_iss_uop_br_type : (issue_slots_3_grant ? _slots_3_io_iss_uop_br_type : (issue_slots_2_grant ? _slots_2_io_iss_uop_br_type : (issue_slots_1_grant ? _slots_1_io_iss_uop_br_type : _slots_0_io_iss_uop_br_type)))))));
	assign io_iss_uops_0_bits_is_sfb = (issue_slots_7_grant ? _slots_7_io_iss_uop_is_sfb : (issue_slots_6_grant ? _slots_6_io_iss_uop_is_sfb : (issue_slots_5_grant ? _slots_5_io_iss_uop_is_sfb : (issue_slots_4_grant ? _slots_4_io_iss_uop_is_sfb : (issue_slots_3_grant ? _slots_3_io_iss_uop_is_sfb : (issue_slots_2_grant ? _slots_2_io_iss_uop_is_sfb : (issue_slots_1_grant ? _slots_1_io_iss_uop_is_sfb : _slots_0_io_iss_uop_is_sfb)))))));
	assign io_iss_uops_0_bits_is_mov = (issue_slots_7_grant ? _slots_7_io_iss_uop_is_mov : (issue_slots_6_grant ? _slots_6_io_iss_uop_is_mov : (issue_slots_5_grant ? _slots_5_io_iss_uop_is_mov : (issue_slots_4_grant ? _slots_4_io_iss_uop_is_mov : (issue_slots_3_grant ? _slots_3_io_iss_uop_is_mov : (issue_slots_2_grant ? _slots_2_io_iss_uop_is_mov : (issue_slots_1_grant ? _slots_1_io_iss_uop_is_mov : _slots_0_io_iss_uop_is_mov)))))));
	assign io_iss_uops_0_bits_ftq_idx = (issue_slots_7_grant ? _slots_7_io_iss_uop_ftq_idx : (issue_slots_6_grant ? _slots_6_io_iss_uop_ftq_idx : (issue_slots_5_grant ? _slots_5_io_iss_uop_ftq_idx : (issue_slots_4_grant ? _slots_4_io_iss_uop_ftq_idx : (issue_slots_3_grant ? _slots_3_io_iss_uop_ftq_idx : (issue_slots_2_grant ? _slots_2_io_iss_uop_ftq_idx : (issue_slots_1_grant ? _slots_1_io_iss_uop_ftq_idx : _slots_0_io_iss_uop_ftq_idx)))))));
	assign io_iss_uops_0_bits_edge_inst = (issue_slots_7_grant ? _slots_7_io_iss_uop_edge_inst : (issue_slots_6_grant ? _slots_6_io_iss_uop_edge_inst : (issue_slots_5_grant ? _slots_5_io_iss_uop_edge_inst : (issue_slots_4_grant ? _slots_4_io_iss_uop_edge_inst : (issue_slots_3_grant ? _slots_3_io_iss_uop_edge_inst : (issue_slots_2_grant ? _slots_2_io_iss_uop_edge_inst : (issue_slots_1_grant ? _slots_1_io_iss_uop_edge_inst : _slots_0_io_iss_uop_edge_inst)))))));
	assign io_iss_uops_0_bits_pc_lob = (issue_slots_7_grant ? _slots_7_io_iss_uop_pc_lob : (issue_slots_6_grant ? _slots_6_io_iss_uop_pc_lob : (issue_slots_5_grant ? _slots_5_io_iss_uop_pc_lob : (issue_slots_4_grant ? _slots_4_io_iss_uop_pc_lob : (issue_slots_3_grant ? _slots_3_io_iss_uop_pc_lob : (issue_slots_2_grant ? _slots_2_io_iss_uop_pc_lob : (issue_slots_1_grant ? _slots_1_io_iss_uop_pc_lob : _slots_0_io_iss_uop_pc_lob)))))));
	assign io_iss_uops_0_bits_taken = (issue_slots_7_grant ? _slots_7_io_iss_uop_taken : (issue_slots_6_grant ? _slots_6_io_iss_uop_taken : (issue_slots_5_grant ? _slots_5_io_iss_uop_taken : (issue_slots_4_grant ? _slots_4_io_iss_uop_taken : (issue_slots_3_grant ? _slots_3_io_iss_uop_taken : (issue_slots_2_grant ? _slots_2_io_iss_uop_taken : (issue_slots_1_grant ? _slots_1_io_iss_uop_taken : _slots_0_io_iss_uop_taken)))))));
	assign io_iss_uops_0_bits_imm_sel = (issue_slots_7_grant ? _slots_7_io_iss_uop_imm_sel : (issue_slots_6_grant ? _slots_6_io_iss_uop_imm_sel : (issue_slots_5_grant ? _slots_5_io_iss_uop_imm_sel : (issue_slots_4_grant ? _slots_4_io_iss_uop_imm_sel : (issue_slots_3_grant ? _slots_3_io_iss_uop_imm_sel : (issue_slots_2_grant ? _slots_2_io_iss_uop_imm_sel : (issue_slots_1_grant ? _slots_1_io_iss_uop_imm_sel : _slots_0_io_iss_uop_imm_sel)))))));
	assign io_iss_uops_0_bits_pimm = (issue_slots_7_grant ? _slots_7_io_iss_uop_pimm : (issue_slots_6_grant ? _slots_6_io_iss_uop_pimm : (issue_slots_5_grant ? _slots_5_io_iss_uop_pimm : (issue_slots_4_grant ? _slots_4_io_iss_uop_pimm : (issue_slots_3_grant ? _slots_3_io_iss_uop_pimm : (issue_slots_2_grant ? _slots_2_io_iss_uop_pimm : (issue_slots_1_grant ? _slots_1_io_iss_uop_pimm : _slots_0_io_iss_uop_pimm)))))));
	assign io_iss_uops_0_bits_op1_sel = (issue_slots_7_grant ? _slots_7_io_iss_uop_op1_sel : (issue_slots_6_grant ? _slots_6_io_iss_uop_op1_sel : (issue_slots_5_grant ? _slots_5_io_iss_uop_op1_sel : (issue_slots_4_grant ? _slots_4_io_iss_uop_op1_sel : (issue_slots_3_grant ? _slots_3_io_iss_uop_op1_sel : (issue_slots_2_grant ? _slots_2_io_iss_uop_op1_sel : (issue_slots_1_grant ? _slots_1_io_iss_uop_op1_sel : _slots_0_io_iss_uop_op1_sel)))))));
	assign io_iss_uops_0_bits_op2_sel = (issue_slots_7_grant ? _slots_7_io_iss_uop_op2_sel : (issue_slots_6_grant ? _slots_6_io_iss_uop_op2_sel : (issue_slots_5_grant ? _slots_5_io_iss_uop_op2_sel : (issue_slots_4_grant ? _slots_4_io_iss_uop_op2_sel : (issue_slots_3_grant ? _slots_3_io_iss_uop_op2_sel : (issue_slots_2_grant ? _slots_2_io_iss_uop_op2_sel : (issue_slots_1_grant ? _slots_1_io_iss_uop_op2_sel : _slots_0_io_iss_uop_op2_sel)))))));
	assign io_iss_uops_0_bits_rob_idx = (issue_slots_7_grant ? _slots_7_io_iss_uop_rob_idx : (issue_slots_6_grant ? _slots_6_io_iss_uop_rob_idx : (issue_slots_5_grant ? _slots_5_io_iss_uop_rob_idx : (issue_slots_4_grant ? _slots_4_io_iss_uop_rob_idx : (issue_slots_3_grant ? _slots_3_io_iss_uop_rob_idx : (issue_slots_2_grant ? _slots_2_io_iss_uop_rob_idx : (issue_slots_1_grant ? _slots_1_io_iss_uop_rob_idx : _slots_0_io_iss_uop_rob_idx)))))));
	assign io_iss_uops_0_bits_pdst = (issue_slots_7_grant ? _slots_7_io_iss_uop_pdst : (issue_slots_6_grant ? _slots_6_io_iss_uop_pdst : (issue_slots_5_grant ? _slots_5_io_iss_uop_pdst : (issue_slots_4_grant ? _slots_4_io_iss_uop_pdst : (issue_slots_3_grant ? _slots_3_io_iss_uop_pdst : (issue_slots_2_grant ? _slots_2_io_iss_uop_pdst : (issue_slots_1_grant ? _slots_1_io_iss_uop_pdst : _slots_0_io_iss_uop_pdst)))))));
	assign io_iss_uops_0_bits_prs1 = (issue_slots_7_grant ? _slots_7_io_iss_uop_prs1 : (issue_slots_6_grant ? _slots_6_io_iss_uop_prs1 : (issue_slots_5_grant ? _slots_5_io_iss_uop_prs1 : (issue_slots_4_grant ? _slots_4_io_iss_uop_prs1 : (issue_slots_3_grant ? _slots_3_io_iss_uop_prs1 : (issue_slots_2_grant ? _slots_2_io_iss_uop_prs1 : (issue_slots_1_grant ? _slots_1_io_iss_uop_prs1 : _slots_0_io_iss_uop_prs1)))))));
	assign io_iss_uops_0_bits_prs2 = (issue_slots_7_grant ? _slots_7_io_iss_uop_prs2 : (issue_slots_6_grant ? _slots_6_io_iss_uop_prs2 : (issue_slots_5_grant ? _slots_5_io_iss_uop_prs2 : (issue_slots_4_grant ? _slots_4_io_iss_uop_prs2 : (issue_slots_3_grant ? _slots_3_io_iss_uop_prs2 : (issue_slots_2_grant ? _slots_2_io_iss_uop_prs2 : (issue_slots_1_grant ? _slots_1_io_iss_uop_prs2 : _slots_0_io_iss_uop_prs2)))))));
	assign io_iss_uops_0_bits_ppred = (issue_slots_7_grant ? _slots_7_io_iss_uop_ppred : (issue_slots_6_grant ? _slots_6_io_iss_uop_ppred : (issue_slots_5_grant ? _slots_5_io_iss_uop_ppred : (issue_slots_4_grant ? _slots_4_io_iss_uop_ppred : (issue_slots_3_grant ? _slots_3_io_iss_uop_ppred : (issue_slots_2_grant ? _slots_2_io_iss_uop_ppred : (issue_slots_1_grant ? _slots_1_io_iss_uop_ppred : _slots_0_io_iss_uop_ppred)))))));
	assign io_iss_uops_0_bits_csr_cmd = (issue_slots_7_grant ? _slots_7_io_iss_uop_csr_cmd : (issue_slots_6_grant ? _slots_6_io_iss_uop_csr_cmd : (issue_slots_5_grant ? _slots_5_io_iss_uop_csr_cmd : (issue_slots_4_grant ? _slots_4_io_iss_uop_csr_cmd : (issue_slots_3_grant ? _slots_3_io_iss_uop_csr_cmd : (issue_slots_2_grant ? _slots_2_io_iss_uop_csr_cmd : (issue_slots_1_grant ? _slots_1_io_iss_uop_csr_cmd : _slots_0_io_iss_uop_csr_cmd)))))));
	assign io_iss_uops_0_bits_ldst_is_rs1 = (issue_slots_7_grant ? _slots_7_io_iss_uop_ldst_is_rs1 : (issue_slots_6_grant ? _slots_6_io_iss_uop_ldst_is_rs1 : (issue_slots_5_grant ? _slots_5_io_iss_uop_ldst_is_rs1 : (issue_slots_4_grant ? _slots_4_io_iss_uop_ldst_is_rs1 : (issue_slots_3_grant ? _slots_3_io_iss_uop_ldst_is_rs1 : (issue_slots_2_grant ? _slots_2_io_iss_uop_ldst_is_rs1 : (issue_slots_1_grant ? _slots_1_io_iss_uop_ldst_is_rs1 : _slots_0_io_iss_uop_ldst_is_rs1)))))));
	assign io_iss_uops_0_bits_dst_rtype = (issue_slots_7_grant ? _slots_7_io_iss_uop_dst_rtype : (issue_slots_6_grant ? _slots_6_io_iss_uop_dst_rtype : (issue_slots_5_grant ? _slots_5_io_iss_uop_dst_rtype : (issue_slots_4_grant ? _slots_4_io_iss_uop_dst_rtype : (issue_slots_3_grant ? _slots_3_io_iss_uop_dst_rtype : (issue_slots_2_grant ? _slots_2_io_iss_uop_dst_rtype : (issue_slots_1_grant ? _slots_1_io_iss_uop_dst_rtype : _slots_0_io_iss_uop_dst_rtype)))))));
	assign io_iss_uops_0_bits_lrs1_rtype = (issue_slots_7_grant ? _slots_7_io_iss_uop_lrs1_rtype : (issue_slots_6_grant ? _slots_6_io_iss_uop_lrs1_rtype : (issue_slots_5_grant ? _slots_5_io_iss_uop_lrs1_rtype : (issue_slots_4_grant ? _slots_4_io_iss_uop_lrs1_rtype : (issue_slots_3_grant ? _slots_3_io_iss_uop_lrs1_rtype : (issue_slots_2_grant ? _slots_2_io_iss_uop_lrs1_rtype : (issue_slots_1_grant ? _slots_1_io_iss_uop_lrs1_rtype : _slots_0_io_iss_uop_lrs1_rtype)))))));
	assign io_iss_uops_0_bits_lrs2_rtype = (issue_slots_7_grant ? _slots_7_io_iss_uop_lrs2_rtype : (issue_slots_6_grant ? _slots_6_io_iss_uop_lrs2_rtype : (issue_slots_5_grant ? _slots_5_io_iss_uop_lrs2_rtype : (issue_slots_4_grant ? _slots_4_io_iss_uop_lrs2_rtype : (issue_slots_3_grant ? _slots_3_io_iss_uop_lrs2_rtype : (issue_slots_2_grant ? _slots_2_io_iss_uop_lrs2_rtype : (issue_slots_1_grant ? _slots_1_io_iss_uop_lrs2_rtype : _slots_0_io_iss_uop_lrs2_rtype)))))));
	assign io_iss_uops_0_bits_fcn_dw = (issue_slots_7_grant ? _slots_7_io_iss_uop_fcn_dw : (issue_slots_6_grant ? _slots_6_io_iss_uop_fcn_dw : (issue_slots_5_grant ? _slots_5_io_iss_uop_fcn_dw : (issue_slots_4_grant ? _slots_4_io_iss_uop_fcn_dw : (issue_slots_3_grant ? _slots_3_io_iss_uop_fcn_dw : (issue_slots_2_grant ? _slots_2_io_iss_uop_fcn_dw : (issue_slots_1_grant ? _slots_1_io_iss_uop_fcn_dw : _slots_0_io_iss_uop_fcn_dw)))))));
	assign io_iss_uops_0_bits_fcn_op = (issue_slots_7_grant ? _slots_7_io_iss_uop_fcn_op : (issue_slots_6_grant ? _slots_6_io_iss_uop_fcn_op : (issue_slots_5_grant ? _slots_5_io_iss_uop_fcn_op : (issue_slots_4_grant ? _slots_4_io_iss_uop_fcn_op : (issue_slots_3_grant ? _slots_3_io_iss_uop_fcn_op : (issue_slots_2_grant ? _slots_2_io_iss_uop_fcn_op : (issue_slots_1_grant ? _slots_1_io_iss_uop_fcn_op : _slots_0_io_iss_uop_fcn_op)))))));
endmodule
