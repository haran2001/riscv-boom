module IssueSlot_16 (
	clock,
	reset,
	io_valid,
	io_will_be_valid,
	io_request,
	io_grant,
	io_iss_uop_inst,
	io_iss_uop_debug_inst,
	io_iss_uop_is_rvc,
	io_iss_uop_debug_pc,
	io_iss_uop_iq_type_0,
	io_iss_uop_iq_type_1,
	io_iss_uop_iq_type_2,
	io_iss_uop_iq_type_3,
	io_iss_uop_fu_code_0,
	io_iss_uop_fu_code_1,
	io_iss_uop_fu_code_2,
	io_iss_uop_fu_code_3,
	io_iss_uop_fu_code_4,
	io_iss_uop_fu_code_5,
	io_iss_uop_fu_code_6,
	io_iss_uop_fu_code_7,
	io_iss_uop_fu_code_8,
	io_iss_uop_fu_code_9,
	io_iss_uop_iw_issued,
	io_iss_uop_iw_p1_speculative_child,
	io_iss_uop_iw_p2_speculative_child,
	io_iss_uop_iw_p1_bypass_hint,
	io_iss_uop_iw_p2_bypass_hint,
	io_iss_uop_iw_p3_bypass_hint,
	io_iss_uop_dis_col_sel,
	io_iss_uop_br_mask,
	io_iss_uop_br_tag,
	io_iss_uop_br_type,
	io_iss_uop_is_sfb,
	io_iss_uop_is_fence,
	io_iss_uop_is_fencei,
	io_iss_uop_is_sfence,
	io_iss_uop_is_amo,
	io_iss_uop_is_eret,
	io_iss_uop_is_sys_pc2epc,
	io_iss_uop_is_rocc,
	io_iss_uop_is_mov,
	io_iss_uop_ftq_idx,
	io_iss_uop_edge_inst,
	io_iss_uop_pc_lob,
	io_iss_uop_taken,
	io_iss_uop_imm_rename,
	io_iss_uop_imm_sel,
	io_iss_uop_pimm,
	io_iss_uop_imm_packed,
	io_iss_uop_op1_sel,
	io_iss_uop_op2_sel,
	io_iss_uop_fp_ctrl_ldst,
	io_iss_uop_fp_ctrl_wen,
	io_iss_uop_fp_ctrl_ren1,
	io_iss_uop_fp_ctrl_ren2,
	io_iss_uop_fp_ctrl_ren3,
	io_iss_uop_fp_ctrl_swap12,
	io_iss_uop_fp_ctrl_swap23,
	io_iss_uop_fp_ctrl_typeTagIn,
	io_iss_uop_fp_ctrl_typeTagOut,
	io_iss_uop_fp_ctrl_fromint,
	io_iss_uop_fp_ctrl_toint,
	io_iss_uop_fp_ctrl_fastpipe,
	io_iss_uop_fp_ctrl_fma,
	io_iss_uop_fp_ctrl_div,
	io_iss_uop_fp_ctrl_sqrt,
	io_iss_uop_fp_ctrl_wflags,
	io_iss_uop_fp_ctrl_vec,
	io_iss_uop_rob_idx,
	io_iss_uop_ldq_idx,
	io_iss_uop_stq_idx,
	io_iss_uop_rxq_idx,
	io_iss_uop_pdst,
	io_iss_uop_prs1,
	io_iss_uop_prs2,
	io_iss_uop_prs3,
	io_iss_uop_ppred,
	io_iss_uop_prs1_busy,
	io_iss_uop_prs2_busy,
	io_iss_uop_prs3_busy,
	io_iss_uop_ppred_busy,
	io_iss_uop_stale_pdst,
	io_iss_uop_exception,
	io_iss_uop_exc_cause,
	io_iss_uop_mem_cmd,
	io_iss_uop_mem_size,
	io_iss_uop_mem_signed,
	io_iss_uop_uses_ldq,
	io_iss_uop_uses_stq,
	io_iss_uop_is_unique,
	io_iss_uop_flush_on_commit,
	io_iss_uop_csr_cmd,
	io_iss_uop_ldst_is_rs1,
	io_iss_uop_ldst,
	io_iss_uop_lrs1,
	io_iss_uop_lrs2,
	io_iss_uop_lrs3,
	io_iss_uop_dst_rtype,
	io_iss_uop_lrs1_rtype,
	io_iss_uop_lrs2_rtype,
	io_iss_uop_frs3_en,
	io_iss_uop_fcn_dw,
	io_iss_uop_fcn_op,
	io_iss_uop_fp_val,
	io_iss_uop_xcpt_pf_if,
	io_iss_uop_xcpt_ae_if,
	io_iss_uop_xcpt_ma_if,
	io_iss_uop_bp_debug_if,
	io_iss_uop_bp_xcpt_if,
	io_iss_uop_debug_fsrc,
	io_iss_uop_debug_tsrc,
	io_in_uop_valid,
	io_in_uop_bits_inst,
	io_in_uop_bits_debug_inst,
	io_in_uop_bits_is_rvc,
	io_in_uop_bits_debug_pc,
	io_in_uop_bits_iq_type_0,
	io_in_uop_bits_iq_type_1,
	io_in_uop_bits_iq_type_2,
	io_in_uop_bits_iq_type_3,
	io_in_uop_bits_fu_code_0,
	io_in_uop_bits_fu_code_1,
	io_in_uop_bits_fu_code_2,
	io_in_uop_bits_fu_code_3,
	io_in_uop_bits_fu_code_4,
	io_in_uop_bits_fu_code_5,
	io_in_uop_bits_fu_code_6,
	io_in_uop_bits_fu_code_7,
	io_in_uop_bits_fu_code_8,
	io_in_uop_bits_fu_code_9,
	io_in_uop_bits_iw_issued,
	io_in_uop_bits_iw_p1_speculative_child,
	io_in_uop_bits_iw_p2_speculative_child,
	io_in_uop_bits_iw_p1_bypass_hint,
	io_in_uop_bits_iw_p2_bypass_hint,
	io_in_uop_bits_iw_p3_bypass_hint,
	io_in_uop_bits_dis_col_sel,
	io_in_uop_bits_br_mask,
	io_in_uop_bits_br_tag,
	io_in_uop_bits_br_type,
	io_in_uop_bits_is_sfb,
	io_in_uop_bits_is_fence,
	io_in_uop_bits_is_fencei,
	io_in_uop_bits_is_sfence,
	io_in_uop_bits_is_amo,
	io_in_uop_bits_is_eret,
	io_in_uop_bits_is_sys_pc2epc,
	io_in_uop_bits_is_rocc,
	io_in_uop_bits_is_mov,
	io_in_uop_bits_ftq_idx,
	io_in_uop_bits_edge_inst,
	io_in_uop_bits_pc_lob,
	io_in_uop_bits_taken,
	io_in_uop_bits_imm_rename,
	io_in_uop_bits_imm_sel,
	io_in_uop_bits_pimm,
	io_in_uop_bits_imm_packed,
	io_in_uop_bits_op1_sel,
	io_in_uop_bits_op2_sel,
	io_in_uop_bits_fp_ctrl_ldst,
	io_in_uop_bits_fp_ctrl_wen,
	io_in_uop_bits_fp_ctrl_ren1,
	io_in_uop_bits_fp_ctrl_ren2,
	io_in_uop_bits_fp_ctrl_ren3,
	io_in_uop_bits_fp_ctrl_swap12,
	io_in_uop_bits_fp_ctrl_swap23,
	io_in_uop_bits_fp_ctrl_typeTagIn,
	io_in_uop_bits_fp_ctrl_typeTagOut,
	io_in_uop_bits_fp_ctrl_fromint,
	io_in_uop_bits_fp_ctrl_toint,
	io_in_uop_bits_fp_ctrl_fastpipe,
	io_in_uop_bits_fp_ctrl_fma,
	io_in_uop_bits_fp_ctrl_div,
	io_in_uop_bits_fp_ctrl_sqrt,
	io_in_uop_bits_fp_ctrl_wflags,
	io_in_uop_bits_fp_ctrl_vec,
	io_in_uop_bits_rob_idx,
	io_in_uop_bits_ldq_idx,
	io_in_uop_bits_stq_idx,
	io_in_uop_bits_rxq_idx,
	io_in_uop_bits_pdst,
	io_in_uop_bits_prs1,
	io_in_uop_bits_prs2,
	io_in_uop_bits_prs3,
	io_in_uop_bits_ppred,
	io_in_uop_bits_prs1_busy,
	io_in_uop_bits_prs2_busy,
	io_in_uop_bits_prs3_busy,
	io_in_uop_bits_ppred_busy,
	io_in_uop_bits_stale_pdst,
	io_in_uop_bits_exception,
	io_in_uop_bits_exc_cause,
	io_in_uop_bits_mem_cmd,
	io_in_uop_bits_mem_size,
	io_in_uop_bits_mem_signed,
	io_in_uop_bits_uses_ldq,
	io_in_uop_bits_uses_stq,
	io_in_uop_bits_is_unique,
	io_in_uop_bits_flush_on_commit,
	io_in_uop_bits_csr_cmd,
	io_in_uop_bits_ldst_is_rs1,
	io_in_uop_bits_ldst,
	io_in_uop_bits_lrs1,
	io_in_uop_bits_lrs2,
	io_in_uop_bits_lrs3,
	io_in_uop_bits_dst_rtype,
	io_in_uop_bits_lrs1_rtype,
	io_in_uop_bits_lrs2_rtype,
	io_in_uop_bits_frs3_en,
	io_in_uop_bits_fcn_dw,
	io_in_uop_bits_fcn_op,
	io_in_uop_bits_fp_val,
	io_in_uop_bits_xcpt_pf_if,
	io_in_uop_bits_xcpt_ae_if,
	io_in_uop_bits_xcpt_ma_if,
	io_in_uop_bits_bp_debug_if,
	io_in_uop_bits_bp_xcpt_if,
	io_in_uop_bits_debug_fsrc,
	io_in_uop_bits_debug_tsrc,
	io_out_uop_inst,
	io_out_uop_debug_inst,
	io_out_uop_is_rvc,
	io_out_uop_debug_pc,
	io_out_uop_iq_type_0,
	io_out_uop_iq_type_1,
	io_out_uop_iq_type_2,
	io_out_uop_iq_type_3,
	io_out_uop_fu_code_0,
	io_out_uop_fu_code_1,
	io_out_uop_fu_code_2,
	io_out_uop_fu_code_3,
	io_out_uop_fu_code_4,
	io_out_uop_fu_code_5,
	io_out_uop_fu_code_6,
	io_out_uop_fu_code_7,
	io_out_uop_fu_code_8,
	io_out_uop_fu_code_9,
	io_out_uop_iw_issued,
	io_out_uop_iw_p1_speculative_child,
	io_out_uop_iw_p2_speculative_child,
	io_out_uop_iw_p1_bypass_hint,
	io_out_uop_iw_p2_bypass_hint,
	io_out_uop_iw_p3_bypass_hint,
	io_out_uop_dis_col_sel,
	io_out_uop_br_mask,
	io_out_uop_br_tag,
	io_out_uop_br_type,
	io_out_uop_is_sfb,
	io_out_uop_is_fence,
	io_out_uop_is_fencei,
	io_out_uop_is_sfence,
	io_out_uop_is_amo,
	io_out_uop_is_eret,
	io_out_uop_is_sys_pc2epc,
	io_out_uop_is_rocc,
	io_out_uop_is_mov,
	io_out_uop_ftq_idx,
	io_out_uop_edge_inst,
	io_out_uop_pc_lob,
	io_out_uop_taken,
	io_out_uop_imm_rename,
	io_out_uop_imm_sel,
	io_out_uop_pimm,
	io_out_uop_imm_packed,
	io_out_uop_op1_sel,
	io_out_uop_op2_sel,
	io_out_uop_fp_ctrl_ldst,
	io_out_uop_fp_ctrl_wen,
	io_out_uop_fp_ctrl_ren1,
	io_out_uop_fp_ctrl_ren2,
	io_out_uop_fp_ctrl_ren3,
	io_out_uop_fp_ctrl_swap12,
	io_out_uop_fp_ctrl_swap23,
	io_out_uop_fp_ctrl_typeTagIn,
	io_out_uop_fp_ctrl_typeTagOut,
	io_out_uop_fp_ctrl_fromint,
	io_out_uop_fp_ctrl_toint,
	io_out_uop_fp_ctrl_fastpipe,
	io_out_uop_fp_ctrl_fma,
	io_out_uop_fp_ctrl_div,
	io_out_uop_fp_ctrl_sqrt,
	io_out_uop_fp_ctrl_wflags,
	io_out_uop_fp_ctrl_vec,
	io_out_uop_rob_idx,
	io_out_uop_ldq_idx,
	io_out_uop_stq_idx,
	io_out_uop_rxq_idx,
	io_out_uop_pdst,
	io_out_uop_prs1,
	io_out_uop_prs2,
	io_out_uop_prs3,
	io_out_uop_ppred,
	io_out_uop_prs1_busy,
	io_out_uop_prs2_busy,
	io_out_uop_prs3_busy,
	io_out_uop_ppred_busy,
	io_out_uop_stale_pdst,
	io_out_uop_exception,
	io_out_uop_exc_cause,
	io_out_uop_mem_cmd,
	io_out_uop_mem_size,
	io_out_uop_mem_signed,
	io_out_uop_uses_ldq,
	io_out_uop_uses_stq,
	io_out_uop_is_unique,
	io_out_uop_flush_on_commit,
	io_out_uop_csr_cmd,
	io_out_uop_ldst_is_rs1,
	io_out_uop_ldst,
	io_out_uop_lrs1,
	io_out_uop_lrs2,
	io_out_uop_lrs3,
	io_out_uop_dst_rtype,
	io_out_uop_lrs1_rtype,
	io_out_uop_lrs2_rtype,
	io_out_uop_frs3_en,
	io_out_uop_fcn_dw,
	io_out_uop_fcn_op,
	io_out_uop_fp_val,
	io_out_uop_xcpt_pf_if,
	io_out_uop_xcpt_ae_if,
	io_out_uop_xcpt_ma_if,
	io_out_uop_bp_debug_if,
	io_out_uop_bp_xcpt_if,
	io_out_uop_debug_fsrc,
	io_out_uop_debug_tsrc,
	io_brupdate_b1_resolve_mask,
	io_brupdate_b1_mispredict_mask,
	io_kill,
	io_clear,
	io_squash_grant,
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
	io_child_rebusys
);
	input clock;
	input reset;
	output wire io_valid;
	output wire io_will_be_valid;
	output wire io_request;
	input io_grant;
	output wire [31:0] io_iss_uop_inst;
	output wire [31:0] io_iss_uop_debug_inst;
	output wire io_iss_uop_is_rvc;
	output wire [39:0] io_iss_uop_debug_pc;
	output wire io_iss_uop_iq_type_0;
	output wire io_iss_uop_iq_type_1;
	output wire io_iss_uop_iq_type_2;
	output wire io_iss_uop_iq_type_3;
	output wire io_iss_uop_fu_code_0;
	output wire io_iss_uop_fu_code_1;
	output wire io_iss_uop_fu_code_2;
	output wire io_iss_uop_fu_code_3;
	output wire io_iss_uop_fu_code_4;
	output wire io_iss_uop_fu_code_5;
	output wire io_iss_uop_fu_code_6;
	output wire io_iss_uop_fu_code_7;
	output wire io_iss_uop_fu_code_8;
	output wire io_iss_uop_fu_code_9;
	output wire io_iss_uop_iw_issued;
	output wire io_iss_uop_iw_p1_speculative_child;
	output wire io_iss_uop_iw_p2_speculative_child;
	output wire io_iss_uop_iw_p1_bypass_hint;
	output wire io_iss_uop_iw_p2_bypass_hint;
	output wire io_iss_uop_iw_p3_bypass_hint;
	output wire io_iss_uop_dis_col_sel;
	output wire [7:0] io_iss_uop_br_mask;
	output wire [2:0] io_iss_uop_br_tag;
	output wire [3:0] io_iss_uop_br_type;
	output wire io_iss_uop_is_sfb;
	output wire io_iss_uop_is_fence;
	output wire io_iss_uop_is_fencei;
	output wire io_iss_uop_is_sfence;
	output wire io_iss_uop_is_amo;
	output wire io_iss_uop_is_eret;
	output wire io_iss_uop_is_sys_pc2epc;
	output wire io_iss_uop_is_rocc;
	output wire io_iss_uop_is_mov;
	output wire [3:0] io_iss_uop_ftq_idx;
	output wire io_iss_uop_edge_inst;
	output wire [5:0] io_iss_uop_pc_lob;
	output wire io_iss_uop_taken;
	output wire io_iss_uop_imm_rename;
	output wire [2:0] io_iss_uop_imm_sel;
	output wire [4:0] io_iss_uop_pimm;
	output wire [19:0] io_iss_uop_imm_packed;
	output wire [1:0] io_iss_uop_op1_sel;
	output wire [2:0] io_iss_uop_op2_sel;
	output wire io_iss_uop_fp_ctrl_ldst;
	output wire io_iss_uop_fp_ctrl_wen;
	output wire io_iss_uop_fp_ctrl_ren1;
	output wire io_iss_uop_fp_ctrl_ren2;
	output wire io_iss_uop_fp_ctrl_ren3;
	output wire io_iss_uop_fp_ctrl_swap12;
	output wire io_iss_uop_fp_ctrl_swap23;
	output wire [1:0] io_iss_uop_fp_ctrl_typeTagIn;
	output wire [1:0] io_iss_uop_fp_ctrl_typeTagOut;
	output wire io_iss_uop_fp_ctrl_fromint;
	output wire io_iss_uop_fp_ctrl_toint;
	output wire io_iss_uop_fp_ctrl_fastpipe;
	output wire io_iss_uop_fp_ctrl_fma;
	output wire io_iss_uop_fp_ctrl_div;
	output wire io_iss_uop_fp_ctrl_sqrt;
	output wire io_iss_uop_fp_ctrl_wflags;
	output wire io_iss_uop_fp_ctrl_vec;
	output wire [4:0] io_iss_uop_rob_idx;
	output wire [3:0] io_iss_uop_ldq_idx;
	output wire [3:0] io_iss_uop_stq_idx;
	output wire [1:0] io_iss_uop_rxq_idx;
	output wire [5:0] io_iss_uop_pdst;
	output wire [5:0] io_iss_uop_prs1;
	output wire [5:0] io_iss_uop_prs2;
	output wire [5:0] io_iss_uop_prs3;
	output wire [3:0] io_iss_uop_ppred;
	output wire io_iss_uop_prs1_busy;
	output wire io_iss_uop_prs2_busy;
	output wire io_iss_uop_prs3_busy;
	output wire io_iss_uop_ppred_busy;
	output wire [5:0] io_iss_uop_stale_pdst;
	output wire io_iss_uop_exception;
	output wire [63:0] io_iss_uop_exc_cause;
	output wire [4:0] io_iss_uop_mem_cmd;
	output wire [1:0] io_iss_uop_mem_size;
	output wire io_iss_uop_mem_signed;
	output wire io_iss_uop_uses_ldq;
	output wire io_iss_uop_uses_stq;
	output wire io_iss_uop_is_unique;
	output wire io_iss_uop_flush_on_commit;
	output wire [2:0] io_iss_uop_csr_cmd;
	output wire io_iss_uop_ldst_is_rs1;
	output wire [5:0] io_iss_uop_ldst;
	output wire [5:0] io_iss_uop_lrs1;
	output wire [5:0] io_iss_uop_lrs2;
	output wire [5:0] io_iss_uop_lrs3;
	output wire [1:0] io_iss_uop_dst_rtype;
	output wire [1:0] io_iss_uop_lrs1_rtype;
	output wire [1:0] io_iss_uop_lrs2_rtype;
	output wire io_iss_uop_frs3_en;
	output wire io_iss_uop_fcn_dw;
	output wire [4:0] io_iss_uop_fcn_op;
	output wire io_iss_uop_fp_val;
	output wire io_iss_uop_xcpt_pf_if;
	output wire io_iss_uop_xcpt_ae_if;
	output wire io_iss_uop_xcpt_ma_if;
	output wire io_iss_uop_bp_debug_if;
	output wire io_iss_uop_bp_xcpt_if;
	output wire [2:0] io_iss_uop_debug_fsrc;
	output wire [2:0] io_iss_uop_debug_tsrc;
	input io_in_uop_valid;
	input [31:0] io_in_uop_bits_inst;
	input [31:0] io_in_uop_bits_debug_inst;
	input io_in_uop_bits_is_rvc;
	input [39:0] io_in_uop_bits_debug_pc;
	input io_in_uop_bits_iq_type_0;
	input io_in_uop_bits_iq_type_1;
	input io_in_uop_bits_iq_type_2;
	input io_in_uop_bits_iq_type_3;
	input io_in_uop_bits_fu_code_0;
	input io_in_uop_bits_fu_code_1;
	input io_in_uop_bits_fu_code_2;
	input io_in_uop_bits_fu_code_3;
	input io_in_uop_bits_fu_code_4;
	input io_in_uop_bits_fu_code_5;
	input io_in_uop_bits_fu_code_6;
	input io_in_uop_bits_fu_code_7;
	input io_in_uop_bits_fu_code_8;
	input io_in_uop_bits_fu_code_9;
	input io_in_uop_bits_iw_issued;
	input io_in_uop_bits_iw_p1_speculative_child;
	input io_in_uop_bits_iw_p2_speculative_child;
	input io_in_uop_bits_iw_p1_bypass_hint;
	input io_in_uop_bits_iw_p2_bypass_hint;
	input io_in_uop_bits_iw_p3_bypass_hint;
	input io_in_uop_bits_dis_col_sel;
	input [7:0] io_in_uop_bits_br_mask;
	input [2:0] io_in_uop_bits_br_tag;
	input [3:0] io_in_uop_bits_br_type;
	input io_in_uop_bits_is_sfb;
	input io_in_uop_bits_is_fence;
	input io_in_uop_bits_is_fencei;
	input io_in_uop_bits_is_sfence;
	input io_in_uop_bits_is_amo;
	input io_in_uop_bits_is_eret;
	input io_in_uop_bits_is_sys_pc2epc;
	input io_in_uop_bits_is_rocc;
	input io_in_uop_bits_is_mov;
	input [3:0] io_in_uop_bits_ftq_idx;
	input io_in_uop_bits_edge_inst;
	input [5:0] io_in_uop_bits_pc_lob;
	input io_in_uop_bits_taken;
	input io_in_uop_bits_imm_rename;
	input [2:0] io_in_uop_bits_imm_sel;
	input [4:0] io_in_uop_bits_pimm;
	input [19:0] io_in_uop_bits_imm_packed;
	input [1:0] io_in_uop_bits_op1_sel;
	input [2:0] io_in_uop_bits_op2_sel;
	input io_in_uop_bits_fp_ctrl_ldst;
	input io_in_uop_bits_fp_ctrl_wen;
	input io_in_uop_bits_fp_ctrl_ren1;
	input io_in_uop_bits_fp_ctrl_ren2;
	input io_in_uop_bits_fp_ctrl_ren3;
	input io_in_uop_bits_fp_ctrl_swap12;
	input io_in_uop_bits_fp_ctrl_swap23;
	input [1:0] io_in_uop_bits_fp_ctrl_typeTagIn;
	input [1:0] io_in_uop_bits_fp_ctrl_typeTagOut;
	input io_in_uop_bits_fp_ctrl_fromint;
	input io_in_uop_bits_fp_ctrl_toint;
	input io_in_uop_bits_fp_ctrl_fastpipe;
	input io_in_uop_bits_fp_ctrl_fma;
	input io_in_uop_bits_fp_ctrl_div;
	input io_in_uop_bits_fp_ctrl_sqrt;
	input io_in_uop_bits_fp_ctrl_wflags;
	input io_in_uop_bits_fp_ctrl_vec;
	input [4:0] io_in_uop_bits_rob_idx;
	input [3:0] io_in_uop_bits_ldq_idx;
	input [3:0] io_in_uop_bits_stq_idx;
	input [1:0] io_in_uop_bits_rxq_idx;
	input [5:0] io_in_uop_bits_pdst;
	input [5:0] io_in_uop_bits_prs1;
	input [5:0] io_in_uop_bits_prs2;
	input [5:0] io_in_uop_bits_prs3;
	input [3:0] io_in_uop_bits_ppred;
	input io_in_uop_bits_prs1_busy;
	input io_in_uop_bits_prs2_busy;
	input io_in_uop_bits_prs3_busy;
	input io_in_uop_bits_ppred_busy;
	input [5:0] io_in_uop_bits_stale_pdst;
	input io_in_uop_bits_exception;
	input [63:0] io_in_uop_bits_exc_cause;
	input [4:0] io_in_uop_bits_mem_cmd;
	input [1:0] io_in_uop_bits_mem_size;
	input io_in_uop_bits_mem_signed;
	input io_in_uop_bits_uses_ldq;
	input io_in_uop_bits_uses_stq;
	input io_in_uop_bits_is_unique;
	input io_in_uop_bits_flush_on_commit;
	input [2:0] io_in_uop_bits_csr_cmd;
	input io_in_uop_bits_ldst_is_rs1;
	input [5:0] io_in_uop_bits_ldst;
	input [5:0] io_in_uop_bits_lrs1;
	input [5:0] io_in_uop_bits_lrs2;
	input [5:0] io_in_uop_bits_lrs3;
	input [1:0] io_in_uop_bits_dst_rtype;
	input [1:0] io_in_uop_bits_lrs1_rtype;
	input [1:0] io_in_uop_bits_lrs2_rtype;
	input io_in_uop_bits_frs3_en;
	input io_in_uop_bits_fcn_dw;
	input [4:0] io_in_uop_bits_fcn_op;
	input io_in_uop_bits_fp_val;
	input io_in_uop_bits_xcpt_pf_if;
	input io_in_uop_bits_xcpt_ae_if;
	input io_in_uop_bits_xcpt_ma_if;
	input io_in_uop_bits_bp_debug_if;
	input io_in_uop_bits_bp_xcpt_if;
	input [2:0] io_in_uop_bits_debug_fsrc;
	input [2:0] io_in_uop_bits_debug_tsrc;
	output wire [31:0] io_out_uop_inst;
	output wire [31:0] io_out_uop_debug_inst;
	output wire io_out_uop_is_rvc;
	output wire [39:0] io_out_uop_debug_pc;
	output wire io_out_uop_iq_type_0;
	output wire io_out_uop_iq_type_1;
	output wire io_out_uop_iq_type_2;
	output wire io_out_uop_iq_type_3;
	output wire io_out_uop_fu_code_0;
	output wire io_out_uop_fu_code_1;
	output wire io_out_uop_fu_code_2;
	output wire io_out_uop_fu_code_3;
	output wire io_out_uop_fu_code_4;
	output wire io_out_uop_fu_code_5;
	output wire io_out_uop_fu_code_6;
	output wire io_out_uop_fu_code_7;
	output wire io_out_uop_fu_code_8;
	output wire io_out_uop_fu_code_9;
	output wire io_out_uop_iw_issued;
	output wire io_out_uop_iw_p1_speculative_child;
	output wire io_out_uop_iw_p2_speculative_child;
	output wire io_out_uop_iw_p1_bypass_hint;
	output wire io_out_uop_iw_p2_bypass_hint;
	output wire io_out_uop_iw_p3_bypass_hint;
	output wire io_out_uop_dis_col_sel;
	output wire [7:0] io_out_uop_br_mask;
	output wire [2:0] io_out_uop_br_tag;
	output wire [3:0] io_out_uop_br_type;
	output wire io_out_uop_is_sfb;
	output wire io_out_uop_is_fence;
	output wire io_out_uop_is_fencei;
	output wire io_out_uop_is_sfence;
	output wire io_out_uop_is_amo;
	output wire io_out_uop_is_eret;
	output wire io_out_uop_is_sys_pc2epc;
	output wire io_out_uop_is_rocc;
	output wire io_out_uop_is_mov;
	output wire [3:0] io_out_uop_ftq_idx;
	output wire io_out_uop_edge_inst;
	output wire [5:0] io_out_uop_pc_lob;
	output wire io_out_uop_taken;
	output wire io_out_uop_imm_rename;
	output wire [2:0] io_out_uop_imm_sel;
	output wire [4:0] io_out_uop_pimm;
	output wire [19:0] io_out_uop_imm_packed;
	output wire [1:0] io_out_uop_op1_sel;
	output wire [2:0] io_out_uop_op2_sel;
	output wire io_out_uop_fp_ctrl_ldst;
	output wire io_out_uop_fp_ctrl_wen;
	output wire io_out_uop_fp_ctrl_ren1;
	output wire io_out_uop_fp_ctrl_ren2;
	output wire io_out_uop_fp_ctrl_ren3;
	output wire io_out_uop_fp_ctrl_swap12;
	output wire io_out_uop_fp_ctrl_swap23;
	output wire [1:0] io_out_uop_fp_ctrl_typeTagIn;
	output wire [1:0] io_out_uop_fp_ctrl_typeTagOut;
	output wire io_out_uop_fp_ctrl_fromint;
	output wire io_out_uop_fp_ctrl_toint;
	output wire io_out_uop_fp_ctrl_fastpipe;
	output wire io_out_uop_fp_ctrl_fma;
	output wire io_out_uop_fp_ctrl_div;
	output wire io_out_uop_fp_ctrl_sqrt;
	output wire io_out_uop_fp_ctrl_wflags;
	output wire io_out_uop_fp_ctrl_vec;
	output wire [4:0] io_out_uop_rob_idx;
	output wire [3:0] io_out_uop_ldq_idx;
	output wire [3:0] io_out_uop_stq_idx;
	output wire [1:0] io_out_uop_rxq_idx;
	output wire [5:0] io_out_uop_pdst;
	output wire [5:0] io_out_uop_prs1;
	output wire [5:0] io_out_uop_prs2;
	output wire [5:0] io_out_uop_prs3;
	output wire [3:0] io_out_uop_ppred;
	output wire io_out_uop_prs1_busy;
	output wire io_out_uop_prs2_busy;
	output wire io_out_uop_prs3_busy;
	output wire io_out_uop_ppred_busy;
	output wire [5:0] io_out_uop_stale_pdst;
	output wire io_out_uop_exception;
	output wire [63:0] io_out_uop_exc_cause;
	output wire [4:0] io_out_uop_mem_cmd;
	output wire [1:0] io_out_uop_mem_size;
	output wire io_out_uop_mem_signed;
	output wire io_out_uop_uses_ldq;
	output wire io_out_uop_uses_stq;
	output wire io_out_uop_is_unique;
	output wire io_out_uop_flush_on_commit;
	output wire [2:0] io_out_uop_csr_cmd;
	output wire io_out_uop_ldst_is_rs1;
	output wire [5:0] io_out_uop_ldst;
	output wire [5:0] io_out_uop_lrs1;
	output wire [5:0] io_out_uop_lrs2;
	output wire [5:0] io_out_uop_lrs3;
	output wire [1:0] io_out_uop_dst_rtype;
	output wire [1:0] io_out_uop_lrs1_rtype;
	output wire [1:0] io_out_uop_lrs2_rtype;
	output wire io_out_uop_frs3_en;
	output wire io_out_uop_fcn_dw;
	output wire [4:0] io_out_uop_fcn_op;
	output wire io_out_uop_fp_val;
	output wire io_out_uop_xcpt_pf_if;
	output wire io_out_uop_xcpt_ae_if;
	output wire io_out_uop_xcpt_ma_if;
	output wire io_out_uop_bp_debug_if;
	output wire io_out_uop_bp_xcpt_if;
	output wire [2:0] io_out_uop_debug_fsrc;
	output wire [2:0] io_out_uop_debug_tsrc;
	input [7:0] io_brupdate_b1_resolve_mask;
	input [7:0] io_brupdate_b1_mispredict_mask;
	input io_kill;
	input io_clear;
	input io_squash_grant;
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
	wire next_valid;
	wire rebusied_prs2;
	wire rebusied_prs1;
	reg slot_valid;
	reg [31:0] slot_uop_inst;
	reg [31:0] slot_uop_debug_inst;
	reg slot_uop_is_rvc;
	reg [39:0] slot_uop_debug_pc;
	reg slot_uop_iq_type_0;
	reg slot_uop_iq_type_1;
	reg slot_uop_iq_type_2;
	reg slot_uop_iq_type_3;
	reg slot_uop_fu_code_0;
	reg slot_uop_fu_code_1;
	reg slot_uop_fu_code_2;
	reg slot_uop_fu_code_3;
	reg slot_uop_fu_code_4;
	reg slot_uop_fu_code_5;
	reg slot_uop_fu_code_6;
	reg slot_uop_fu_code_7;
	reg slot_uop_fu_code_8;
	reg slot_uop_fu_code_9;
	reg slot_uop_iw_issued;
	reg slot_uop_iw_p1_speculative_child;
	reg slot_uop_iw_p2_speculative_child;
	reg slot_uop_iw_p1_bypass_hint;
	reg slot_uop_iw_p2_bypass_hint;
	reg slot_uop_iw_p3_bypass_hint;
	reg slot_uop_dis_col_sel;
	reg [7:0] slot_uop_br_mask;
	reg [2:0] slot_uop_br_tag;
	reg [3:0] slot_uop_br_type;
	reg slot_uop_is_sfb;
	reg slot_uop_is_fence;
	reg slot_uop_is_fencei;
	reg slot_uop_is_sfence;
	reg slot_uop_is_amo;
	reg slot_uop_is_eret;
	reg slot_uop_is_sys_pc2epc;
	reg slot_uop_is_rocc;
	reg slot_uop_is_mov;
	reg [3:0] slot_uop_ftq_idx;
	reg slot_uop_edge_inst;
	reg [5:0] slot_uop_pc_lob;
	reg slot_uop_taken;
	reg slot_uop_imm_rename;
	reg [2:0] slot_uop_imm_sel;
	reg [4:0] slot_uop_pimm;
	reg [19:0] slot_uop_imm_packed;
	reg [1:0] slot_uop_op1_sel;
	reg [2:0] slot_uop_op2_sel;
	reg slot_uop_fp_ctrl_ldst;
	reg slot_uop_fp_ctrl_wen;
	reg slot_uop_fp_ctrl_ren1;
	reg slot_uop_fp_ctrl_ren2;
	reg slot_uop_fp_ctrl_ren3;
	reg slot_uop_fp_ctrl_swap12;
	reg slot_uop_fp_ctrl_swap23;
	reg [1:0] slot_uop_fp_ctrl_typeTagIn;
	reg [1:0] slot_uop_fp_ctrl_typeTagOut;
	reg slot_uop_fp_ctrl_fromint;
	reg slot_uop_fp_ctrl_toint;
	reg slot_uop_fp_ctrl_fastpipe;
	reg slot_uop_fp_ctrl_fma;
	reg slot_uop_fp_ctrl_div;
	reg slot_uop_fp_ctrl_sqrt;
	reg slot_uop_fp_ctrl_wflags;
	reg slot_uop_fp_ctrl_vec;
	reg [4:0] slot_uop_rob_idx;
	reg [3:0] slot_uop_ldq_idx;
	reg [3:0] slot_uop_stq_idx;
	reg [1:0] slot_uop_rxq_idx;
	reg [5:0] slot_uop_pdst;
	reg [5:0] slot_uop_prs1;
	reg [5:0] slot_uop_prs2;
	reg [5:0] slot_uop_prs3;
	reg [3:0] slot_uop_ppred;
	reg slot_uop_prs1_busy;
	reg slot_uop_prs2_busy;
	reg slot_uop_prs3_busy;
	reg slot_uop_ppred_busy;
	reg [5:0] slot_uop_stale_pdst;
	reg slot_uop_exception;
	reg [63:0] slot_uop_exc_cause;
	reg [4:0] slot_uop_mem_cmd;
	reg [1:0] slot_uop_mem_size;
	reg slot_uop_mem_signed;
	reg slot_uop_uses_ldq;
	reg slot_uop_uses_stq;
	reg slot_uop_is_unique;
	reg slot_uop_flush_on_commit;
	reg [2:0] slot_uop_csr_cmd;
	reg slot_uop_ldst_is_rs1;
	reg [5:0] slot_uop_ldst;
	reg [5:0] slot_uop_lrs1;
	reg [5:0] slot_uop_lrs2;
	reg [5:0] slot_uop_lrs3;
	reg [1:0] slot_uop_dst_rtype;
	reg [1:0] slot_uop_lrs1_rtype;
	reg [1:0] slot_uop_lrs2_rtype;
	reg slot_uop_frs3_en;
	reg slot_uop_fcn_dw;
	reg [4:0] slot_uop_fcn_op;
	reg slot_uop_fp_val;
	reg slot_uop_xcpt_pf_if;
	reg slot_uop_xcpt_ae_if;
	reg slot_uop_xcpt_ma_if;
	reg slot_uop_bp_debug_if;
	reg slot_uop_bp_xcpt_if;
	reg [2:0] slot_uop_debug_fsrc;
	reg [2:0] slot_uop_debug_tsrc;
	wire [7:0] next_uop_br_mask = slot_uop_br_mask & ~io_brupdate_b1_resolve_mask;
	wire killed = |(io_brupdate_b1_mispredict_mask & slot_uop_br_mask) | io_kill;
	wire prs1_matches_0 = io_wakeup_ports_0_bits_uop_pdst == slot_uop_prs1;
	wire prs2_matches_0 = io_wakeup_ports_0_bits_uop_pdst == slot_uop_prs2;
	wire prs1_wakeups_0 = io_wakeup_ports_0_valid & prs1_matches_0;
	wire prs1_wakeups_2 = io_wakeup_ports_2_valid & (io_wakeup_ports_2_bits_uop_pdst == slot_uop_prs1);
	wire prs2_wakeups_0 = io_wakeup_ports_0_valid & prs2_matches_0;
	wire prs2_wakeups_2 = io_wakeup_ports_2_valid & (io_wakeup_ports_2_bits_uop_pdst == slot_uop_prs2);
	wire prs3_wakeups_0 = io_wakeup_ports_0_valid & (io_wakeup_ports_0_bits_uop_pdst == slot_uop_prs3);
	wire prs3_wakeups_2 = io_wakeup_ports_2_valid & (io_wakeup_ports_2_bits_uop_pdst == slot_uop_prs3);
	wire _GEN = (prs1_wakeups_0 | (io_wakeup_ports_1_valid & (io_wakeup_ports_1_bits_uop_pdst == slot_uop_prs1))) | prs1_wakeups_2;
	wire next_uop_iw_p1_speculative_child = _GEN & prs1_wakeups_2;
	wire next_uop_iw_p1_bypass_hint = _GEN & ((prs1_wakeups_0 & io_wakeup_ports_0_bits_bypassable) | prs1_wakeups_2);
	assign rebusied_prs1 = ((io_wakeup_ports_0_bits_rebusy & prs1_matches_0) | (io_child_rebusys & slot_uop_iw_p1_speculative_child)) & (slot_uop_lrs1_rtype == 2'h0);
	wire next_uop_prs1_busy = rebusied_prs1 | (~_GEN & slot_uop_prs1_busy);
	wire _GEN_0 = (prs2_wakeups_0 | (io_wakeup_ports_1_valid & (io_wakeup_ports_1_bits_uop_pdst == slot_uop_prs2))) | prs2_wakeups_2;
	wire next_uop_iw_p2_speculative_child = _GEN_0 & prs2_wakeups_2;
	wire next_uop_iw_p2_bypass_hint = _GEN_0 & ((prs2_wakeups_0 & io_wakeup_ports_0_bits_bypassable) | prs2_wakeups_2);
	assign rebusied_prs2 = ((io_wakeup_ports_0_bits_rebusy & prs2_matches_0) | (io_child_rebusys & slot_uop_iw_p2_speculative_child)) & (slot_uop_lrs2_rtype == 2'h0);
	wire next_uop_prs2_busy = rebusied_prs2 | (~_GEN_0 & slot_uop_prs2_busy);
	wire _GEN_1 = (prs3_wakeups_0 | (io_wakeup_ports_1_valid & (io_wakeup_ports_1_bits_uop_pdst == slot_uop_prs3))) | prs3_wakeups_2;
	wire next_uop_prs3_busy = ~_GEN_1 & slot_uop_prs3_busy;
	wire next_uop_iw_p3_bypass_hint = _GEN_1 & ((prs3_wakeups_0 & io_wakeup_ports_0_bits_bypassable) | prs3_wakeups_2);
	wire next_uop_ppred_busy = ~(io_pred_wakeup_port_valid & (slot_uop_ppred == io_pred_wakeup_port_bits)) & slot_uop_ppred_busy;
	wire next_uop_iw_issued = io_grant & ~io_squash_grant;
	assign next_valid = (slot_valid & slot_uop_iw_issued ? rebusied_prs1 | rebusied_prs2 : slot_valid);
	always @(posedge clock) begin
		if (reset)
			slot_valid <= 1'h0;
		else
			slot_valid <= ~io_kill & (io_in_uop_valid | ((~io_clear & next_valid) & ~killed));
		if (io_in_uop_valid) begin
			slot_uop_inst <= io_in_uop_bits_inst;
			slot_uop_debug_inst <= io_in_uop_bits_debug_inst;
			slot_uop_is_rvc <= io_in_uop_bits_is_rvc;
			slot_uop_debug_pc <= io_in_uop_bits_debug_pc;
			slot_uop_iq_type_0 <= io_in_uop_bits_iq_type_0;
			slot_uop_iq_type_1 <= io_in_uop_bits_iq_type_1;
			slot_uop_iq_type_2 <= io_in_uop_bits_iq_type_2;
			slot_uop_iq_type_3 <= io_in_uop_bits_iq_type_3;
			slot_uop_fu_code_0 <= io_in_uop_bits_fu_code_0;
			slot_uop_fu_code_1 <= io_in_uop_bits_fu_code_1;
			slot_uop_fu_code_2 <= io_in_uop_bits_fu_code_2;
			slot_uop_fu_code_3 <= io_in_uop_bits_fu_code_3;
			slot_uop_fu_code_4 <= io_in_uop_bits_fu_code_4;
			slot_uop_fu_code_5 <= io_in_uop_bits_fu_code_5;
			slot_uop_fu_code_6 <= io_in_uop_bits_fu_code_6;
			slot_uop_fu_code_7 <= io_in_uop_bits_fu_code_7;
			slot_uop_fu_code_8 <= io_in_uop_bits_fu_code_8;
			slot_uop_fu_code_9 <= io_in_uop_bits_fu_code_9;
			slot_uop_dis_col_sel <= io_in_uop_bits_dis_col_sel;
			slot_uop_br_mask <= io_in_uop_bits_br_mask;
			slot_uop_br_tag <= io_in_uop_bits_br_tag;
			slot_uop_br_type <= io_in_uop_bits_br_type;
			slot_uop_is_sfb <= io_in_uop_bits_is_sfb;
			slot_uop_is_fence <= io_in_uop_bits_is_fence;
			slot_uop_is_fencei <= io_in_uop_bits_is_fencei;
			slot_uop_is_sfence <= io_in_uop_bits_is_sfence;
			slot_uop_is_amo <= io_in_uop_bits_is_amo;
			slot_uop_is_eret <= io_in_uop_bits_is_eret;
			slot_uop_is_sys_pc2epc <= io_in_uop_bits_is_sys_pc2epc;
			slot_uop_is_rocc <= io_in_uop_bits_is_rocc;
			slot_uop_is_mov <= io_in_uop_bits_is_mov;
			slot_uop_ftq_idx <= io_in_uop_bits_ftq_idx;
			slot_uop_edge_inst <= io_in_uop_bits_edge_inst;
			slot_uop_pc_lob <= io_in_uop_bits_pc_lob;
			slot_uop_taken <= io_in_uop_bits_taken;
			slot_uop_imm_rename <= io_in_uop_bits_imm_rename;
			slot_uop_imm_sel <= io_in_uop_bits_imm_sel;
			slot_uop_pimm <= io_in_uop_bits_pimm;
			slot_uop_imm_packed <= io_in_uop_bits_imm_packed;
			slot_uop_op1_sel <= io_in_uop_bits_op1_sel;
			slot_uop_op2_sel <= io_in_uop_bits_op2_sel;
			slot_uop_fp_ctrl_ldst <= io_in_uop_bits_fp_ctrl_ldst;
			slot_uop_fp_ctrl_wen <= io_in_uop_bits_fp_ctrl_wen;
			slot_uop_fp_ctrl_ren1 <= io_in_uop_bits_fp_ctrl_ren1;
			slot_uop_fp_ctrl_ren2 <= io_in_uop_bits_fp_ctrl_ren2;
			slot_uop_fp_ctrl_ren3 <= io_in_uop_bits_fp_ctrl_ren3;
			slot_uop_fp_ctrl_swap12 <= io_in_uop_bits_fp_ctrl_swap12;
			slot_uop_fp_ctrl_swap23 <= io_in_uop_bits_fp_ctrl_swap23;
			slot_uop_fp_ctrl_typeTagIn <= io_in_uop_bits_fp_ctrl_typeTagIn;
			slot_uop_fp_ctrl_typeTagOut <= io_in_uop_bits_fp_ctrl_typeTagOut;
			slot_uop_fp_ctrl_fromint <= io_in_uop_bits_fp_ctrl_fromint;
			slot_uop_fp_ctrl_toint <= io_in_uop_bits_fp_ctrl_toint;
			slot_uop_fp_ctrl_fastpipe <= io_in_uop_bits_fp_ctrl_fastpipe;
			slot_uop_fp_ctrl_fma <= io_in_uop_bits_fp_ctrl_fma;
			slot_uop_fp_ctrl_div <= io_in_uop_bits_fp_ctrl_div;
			slot_uop_fp_ctrl_sqrt <= io_in_uop_bits_fp_ctrl_sqrt;
			slot_uop_fp_ctrl_wflags <= io_in_uop_bits_fp_ctrl_wflags;
			slot_uop_fp_ctrl_vec <= io_in_uop_bits_fp_ctrl_vec;
			slot_uop_rob_idx <= io_in_uop_bits_rob_idx;
			slot_uop_ldq_idx <= io_in_uop_bits_ldq_idx;
			slot_uop_stq_idx <= io_in_uop_bits_stq_idx;
			slot_uop_rxq_idx <= io_in_uop_bits_rxq_idx;
			slot_uop_pdst <= io_in_uop_bits_pdst;
			slot_uop_prs1 <= io_in_uop_bits_prs1;
			slot_uop_prs2 <= io_in_uop_bits_prs2;
			slot_uop_prs3 <= io_in_uop_bits_prs3;
			slot_uop_ppred <= io_in_uop_bits_ppred;
			slot_uop_prs1_busy <= io_in_uop_bits_prs1_busy;
			slot_uop_prs2_busy <= io_in_uop_bits_prs2_busy;
			slot_uop_prs3_busy <= io_in_uop_bits_prs3_busy;
			slot_uop_ppred_busy <= io_in_uop_bits_ppred_busy;
			slot_uop_stale_pdst <= io_in_uop_bits_stale_pdst;
			slot_uop_exception <= io_in_uop_bits_exception;
			slot_uop_exc_cause <= io_in_uop_bits_exc_cause;
			slot_uop_mem_cmd <= io_in_uop_bits_mem_cmd;
			slot_uop_mem_size <= io_in_uop_bits_mem_size;
			slot_uop_mem_signed <= io_in_uop_bits_mem_signed;
			slot_uop_uses_ldq <= io_in_uop_bits_uses_ldq;
			slot_uop_uses_stq <= io_in_uop_bits_uses_stq;
			slot_uop_is_unique <= io_in_uop_bits_is_unique;
			slot_uop_flush_on_commit <= io_in_uop_bits_flush_on_commit;
			slot_uop_csr_cmd <= io_in_uop_bits_csr_cmd;
			slot_uop_ldst_is_rs1 <= io_in_uop_bits_ldst_is_rs1;
			slot_uop_ldst <= io_in_uop_bits_ldst;
			slot_uop_lrs1 <= io_in_uop_bits_lrs1;
			slot_uop_lrs2 <= io_in_uop_bits_lrs2;
			slot_uop_lrs3 <= io_in_uop_bits_lrs3;
			slot_uop_dst_rtype <= io_in_uop_bits_dst_rtype;
			slot_uop_lrs1_rtype <= io_in_uop_bits_lrs1_rtype;
			slot_uop_lrs2_rtype <= io_in_uop_bits_lrs2_rtype;
			slot_uop_frs3_en <= io_in_uop_bits_frs3_en;
			slot_uop_fcn_dw <= io_in_uop_bits_fcn_dw;
			slot_uop_fcn_op <= io_in_uop_bits_fcn_op;
			slot_uop_fp_val <= io_in_uop_bits_fp_val;
			slot_uop_xcpt_pf_if <= io_in_uop_bits_xcpt_pf_if;
			slot_uop_xcpt_ae_if <= io_in_uop_bits_xcpt_ae_if;
			slot_uop_xcpt_ma_if <= io_in_uop_bits_xcpt_ma_if;
			slot_uop_bp_debug_if <= io_in_uop_bits_bp_debug_if;
			slot_uop_bp_xcpt_if <= io_in_uop_bits_bp_xcpt_if;
			slot_uop_debug_fsrc <= io_in_uop_bits_debug_fsrc;
			slot_uop_debug_tsrc <= io_in_uop_bits_debug_tsrc;
		end
		else begin
			slot_uop_br_mask <= next_uop_br_mask;
			slot_uop_prs1_busy <= next_uop_prs1_busy;
			slot_uop_prs2_busy <= next_uop_prs2_busy;
			slot_uop_prs3_busy <= next_uop_prs3_busy;
			slot_uop_ppred_busy <= next_uop_ppred_busy;
		end
		slot_uop_iw_issued <= (io_in_uop_valid ? io_in_uop_bits_iw_issued : next_uop_iw_issued);
		slot_uop_iw_p1_speculative_child <= (io_in_uop_valid ? io_in_uop_bits_iw_p1_speculative_child : next_uop_iw_p1_speculative_child);
		slot_uop_iw_p2_speculative_child <= (io_in_uop_valid ? io_in_uop_bits_iw_p2_speculative_child : next_uop_iw_p2_speculative_child);
		slot_uop_iw_p1_bypass_hint <= (io_in_uop_valid ? io_in_uop_bits_iw_p1_bypass_hint : next_uop_iw_p1_bypass_hint);
		slot_uop_iw_p2_bypass_hint <= (io_in_uop_valid ? io_in_uop_bits_iw_p2_bypass_hint : next_uop_iw_p2_bypass_hint);
		slot_uop_iw_p3_bypass_hint <= (io_in_uop_valid ? io_in_uop_bits_iw_p3_bypass_hint : next_uop_iw_p3_bypass_hint);
	end
	assign io_valid = slot_valid;
	assign io_will_be_valid = next_valid & ~killed;
	assign io_request = (((slot_valid & ~slot_uop_iw_issued) & ~slot_uop_prs1_busy) & ~slot_uop_prs2_busy) & ~slot_uop_ppred_busy;
	assign io_iss_uop_inst = slot_uop_inst;
	assign io_iss_uop_debug_inst = slot_uop_debug_inst;
	assign io_iss_uop_is_rvc = slot_uop_is_rvc;
	assign io_iss_uop_debug_pc = slot_uop_debug_pc;
	assign io_iss_uop_iq_type_0 = slot_uop_iq_type_0;
	assign io_iss_uop_iq_type_1 = slot_uop_iq_type_1;
	assign io_iss_uop_iq_type_2 = slot_uop_iq_type_2;
	assign io_iss_uop_iq_type_3 = slot_uop_iq_type_3;
	assign io_iss_uop_fu_code_0 = slot_uop_fu_code_0;
	assign io_iss_uop_fu_code_1 = slot_uop_fu_code_1;
	assign io_iss_uop_fu_code_2 = slot_uop_fu_code_2;
	assign io_iss_uop_fu_code_3 = slot_uop_fu_code_3;
	assign io_iss_uop_fu_code_4 = slot_uop_fu_code_4;
	assign io_iss_uop_fu_code_5 = slot_uop_fu_code_5;
	assign io_iss_uop_fu_code_6 = slot_uop_fu_code_6;
	assign io_iss_uop_fu_code_7 = slot_uop_fu_code_7;
	assign io_iss_uop_fu_code_8 = slot_uop_fu_code_8;
	assign io_iss_uop_fu_code_9 = slot_uop_fu_code_9;
	assign io_iss_uop_iw_issued = slot_uop_iw_issued;
	assign io_iss_uop_iw_p1_speculative_child = slot_uop_iw_p1_speculative_child;
	assign io_iss_uop_iw_p2_speculative_child = slot_uop_iw_p2_speculative_child;
	assign io_iss_uop_iw_p1_bypass_hint = slot_uop_iw_p1_bypass_hint;
	assign io_iss_uop_iw_p2_bypass_hint = slot_uop_iw_p2_bypass_hint;
	assign io_iss_uop_iw_p3_bypass_hint = slot_uop_iw_p3_bypass_hint;
	assign io_iss_uop_dis_col_sel = slot_uop_dis_col_sel;
	assign io_iss_uop_br_mask = slot_uop_br_mask;
	assign io_iss_uop_br_tag = slot_uop_br_tag;
	assign io_iss_uop_br_type = slot_uop_br_type;
	assign io_iss_uop_is_sfb = slot_uop_is_sfb;
	assign io_iss_uop_is_fence = slot_uop_is_fence;
	assign io_iss_uop_is_fencei = slot_uop_is_fencei;
	assign io_iss_uop_is_sfence = slot_uop_is_sfence;
	assign io_iss_uop_is_amo = slot_uop_is_amo;
	assign io_iss_uop_is_eret = slot_uop_is_eret;
	assign io_iss_uop_is_sys_pc2epc = slot_uop_is_sys_pc2epc;
	assign io_iss_uop_is_rocc = slot_uop_is_rocc;
	assign io_iss_uop_is_mov = slot_uop_is_mov;
	assign io_iss_uop_ftq_idx = slot_uop_ftq_idx;
	assign io_iss_uop_edge_inst = slot_uop_edge_inst;
	assign io_iss_uop_pc_lob = slot_uop_pc_lob;
	assign io_iss_uop_taken = slot_uop_taken;
	assign io_iss_uop_imm_rename = slot_uop_imm_rename;
	assign io_iss_uop_imm_sel = slot_uop_imm_sel;
	assign io_iss_uop_pimm = slot_uop_pimm;
	assign io_iss_uop_imm_packed = slot_uop_imm_packed;
	assign io_iss_uop_op1_sel = slot_uop_op1_sel;
	assign io_iss_uop_op2_sel = slot_uop_op2_sel;
	assign io_iss_uop_fp_ctrl_ldst = slot_uop_fp_ctrl_ldst;
	assign io_iss_uop_fp_ctrl_wen = slot_uop_fp_ctrl_wen;
	assign io_iss_uop_fp_ctrl_ren1 = slot_uop_fp_ctrl_ren1;
	assign io_iss_uop_fp_ctrl_ren2 = slot_uop_fp_ctrl_ren2;
	assign io_iss_uop_fp_ctrl_ren3 = slot_uop_fp_ctrl_ren3;
	assign io_iss_uop_fp_ctrl_swap12 = slot_uop_fp_ctrl_swap12;
	assign io_iss_uop_fp_ctrl_swap23 = slot_uop_fp_ctrl_swap23;
	assign io_iss_uop_fp_ctrl_typeTagIn = slot_uop_fp_ctrl_typeTagIn;
	assign io_iss_uop_fp_ctrl_typeTagOut = slot_uop_fp_ctrl_typeTagOut;
	assign io_iss_uop_fp_ctrl_fromint = slot_uop_fp_ctrl_fromint;
	assign io_iss_uop_fp_ctrl_toint = slot_uop_fp_ctrl_toint;
	assign io_iss_uop_fp_ctrl_fastpipe = slot_uop_fp_ctrl_fastpipe;
	assign io_iss_uop_fp_ctrl_fma = slot_uop_fp_ctrl_fma;
	assign io_iss_uop_fp_ctrl_div = slot_uop_fp_ctrl_div;
	assign io_iss_uop_fp_ctrl_sqrt = slot_uop_fp_ctrl_sqrt;
	assign io_iss_uop_fp_ctrl_wflags = slot_uop_fp_ctrl_wflags;
	assign io_iss_uop_fp_ctrl_vec = slot_uop_fp_ctrl_vec;
	assign io_iss_uop_rob_idx = slot_uop_rob_idx;
	assign io_iss_uop_ldq_idx = slot_uop_ldq_idx;
	assign io_iss_uop_stq_idx = slot_uop_stq_idx;
	assign io_iss_uop_rxq_idx = slot_uop_rxq_idx;
	assign io_iss_uop_pdst = slot_uop_pdst;
	assign io_iss_uop_prs1 = slot_uop_prs1;
	assign io_iss_uop_prs2 = slot_uop_prs2;
	assign io_iss_uop_prs3 = slot_uop_prs3;
	assign io_iss_uop_ppred = slot_uop_ppred;
	assign io_iss_uop_prs1_busy = slot_uop_prs1_busy;
	assign io_iss_uop_prs2_busy = slot_uop_prs2_busy;
	assign io_iss_uop_prs3_busy = slot_uop_prs3_busy;
	assign io_iss_uop_ppred_busy = slot_uop_ppred_busy;
	assign io_iss_uop_stale_pdst = slot_uop_stale_pdst;
	assign io_iss_uop_exception = slot_uop_exception;
	assign io_iss_uop_exc_cause = slot_uop_exc_cause;
	assign io_iss_uop_mem_cmd = slot_uop_mem_cmd;
	assign io_iss_uop_mem_size = slot_uop_mem_size;
	assign io_iss_uop_mem_signed = slot_uop_mem_signed;
	assign io_iss_uop_uses_ldq = slot_uop_uses_ldq;
	assign io_iss_uop_uses_stq = slot_uop_uses_stq;
	assign io_iss_uop_is_unique = slot_uop_is_unique;
	assign io_iss_uop_flush_on_commit = slot_uop_flush_on_commit;
	assign io_iss_uop_csr_cmd = slot_uop_csr_cmd;
	assign io_iss_uop_ldst_is_rs1 = slot_uop_ldst_is_rs1;
	assign io_iss_uop_ldst = slot_uop_ldst;
	assign io_iss_uop_lrs1 = slot_uop_lrs1;
	assign io_iss_uop_lrs2 = slot_uop_lrs2;
	assign io_iss_uop_lrs3 = slot_uop_lrs3;
	assign io_iss_uop_dst_rtype = slot_uop_dst_rtype;
	assign io_iss_uop_lrs1_rtype = slot_uop_lrs1_rtype;
	assign io_iss_uop_lrs2_rtype = slot_uop_lrs2_rtype;
	assign io_iss_uop_frs3_en = slot_uop_frs3_en;
	assign io_iss_uop_fcn_dw = slot_uop_fcn_dw;
	assign io_iss_uop_fcn_op = slot_uop_fcn_op;
	assign io_iss_uop_fp_val = slot_uop_fp_val;
	assign io_iss_uop_xcpt_pf_if = slot_uop_xcpt_pf_if;
	assign io_iss_uop_xcpt_ae_if = slot_uop_xcpt_ae_if;
	assign io_iss_uop_xcpt_ma_if = slot_uop_xcpt_ma_if;
	assign io_iss_uop_bp_debug_if = slot_uop_bp_debug_if;
	assign io_iss_uop_bp_xcpt_if = slot_uop_bp_xcpt_if;
	assign io_iss_uop_debug_fsrc = slot_uop_debug_fsrc;
	assign io_iss_uop_debug_tsrc = slot_uop_debug_tsrc;
	assign io_out_uop_inst = slot_uop_inst;
	assign io_out_uop_debug_inst = slot_uop_debug_inst;
	assign io_out_uop_is_rvc = slot_uop_is_rvc;
	assign io_out_uop_debug_pc = slot_uop_debug_pc;
	assign io_out_uop_iq_type_0 = slot_uop_iq_type_0;
	assign io_out_uop_iq_type_1 = slot_uop_iq_type_1;
	assign io_out_uop_iq_type_2 = slot_uop_iq_type_2;
	assign io_out_uop_iq_type_3 = slot_uop_iq_type_3;
	assign io_out_uop_fu_code_0 = slot_uop_fu_code_0;
	assign io_out_uop_fu_code_1 = slot_uop_fu_code_1;
	assign io_out_uop_fu_code_2 = slot_uop_fu_code_2;
	assign io_out_uop_fu_code_3 = slot_uop_fu_code_3;
	assign io_out_uop_fu_code_4 = slot_uop_fu_code_4;
	assign io_out_uop_fu_code_5 = slot_uop_fu_code_5;
	assign io_out_uop_fu_code_6 = slot_uop_fu_code_6;
	assign io_out_uop_fu_code_7 = slot_uop_fu_code_7;
	assign io_out_uop_fu_code_8 = slot_uop_fu_code_8;
	assign io_out_uop_fu_code_9 = slot_uop_fu_code_9;
	assign io_out_uop_iw_issued = next_uop_iw_issued;
	assign io_out_uop_iw_p1_speculative_child = next_uop_iw_p1_speculative_child;
	assign io_out_uop_iw_p2_speculative_child = next_uop_iw_p2_speculative_child;
	assign io_out_uop_iw_p1_bypass_hint = next_uop_iw_p1_bypass_hint;
	assign io_out_uop_iw_p2_bypass_hint = next_uop_iw_p2_bypass_hint;
	assign io_out_uop_iw_p3_bypass_hint = next_uop_iw_p3_bypass_hint;
	assign io_out_uop_dis_col_sel = slot_uop_dis_col_sel;
	assign io_out_uop_br_mask = next_uop_br_mask;
	assign io_out_uop_br_tag = slot_uop_br_tag;
	assign io_out_uop_br_type = slot_uop_br_type;
	assign io_out_uop_is_sfb = slot_uop_is_sfb;
	assign io_out_uop_is_fence = slot_uop_is_fence;
	assign io_out_uop_is_fencei = slot_uop_is_fencei;
	assign io_out_uop_is_sfence = slot_uop_is_sfence;
	assign io_out_uop_is_amo = slot_uop_is_amo;
	assign io_out_uop_is_eret = slot_uop_is_eret;
	assign io_out_uop_is_sys_pc2epc = slot_uop_is_sys_pc2epc;
	assign io_out_uop_is_rocc = slot_uop_is_rocc;
	assign io_out_uop_is_mov = slot_uop_is_mov;
	assign io_out_uop_ftq_idx = slot_uop_ftq_idx;
	assign io_out_uop_edge_inst = slot_uop_edge_inst;
	assign io_out_uop_pc_lob = slot_uop_pc_lob;
	assign io_out_uop_taken = slot_uop_taken;
	assign io_out_uop_imm_rename = slot_uop_imm_rename;
	assign io_out_uop_imm_sel = slot_uop_imm_sel;
	assign io_out_uop_pimm = slot_uop_pimm;
	assign io_out_uop_imm_packed = slot_uop_imm_packed;
	assign io_out_uop_op1_sel = slot_uop_op1_sel;
	assign io_out_uop_op2_sel = slot_uop_op2_sel;
	assign io_out_uop_fp_ctrl_ldst = slot_uop_fp_ctrl_ldst;
	assign io_out_uop_fp_ctrl_wen = slot_uop_fp_ctrl_wen;
	assign io_out_uop_fp_ctrl_ren1 = slot_uop_fp_ctrl_ren1;
	assign io_out_uop_fp_ctrl_ren2 = slot_uop_fp_ctrl_ren2;
	assign io_out_uop_fp_ctrl_ren3 = slot_uop_fp_ctrl_ren3;
	assign io_out_uop_fp_ctrl_swap12 = slot_uop_fp_ctrl_swap12;
	assign io_out_uop_fp_ctrl_swap23 = slot_uop_fp_ctrl_swap23;
	assign io_out_uop_fp_ctrl_typeTagIn = slot_uop_fp_ctrl_typeTagIn;
	assign io_out_uop_fp_ctrl_typeTagOut = slot_uop_fp_ctrl_typeTagOut;
	assign io_out_uop_fp_ctrl_fromint = slot_uop_fp_ctrl_fromint;
	assign io_out_uop_fp_ctrl_toint = slot_uop_fp_ctrl_toint;
	assign io_out_uop_fp_ctrl_fastpipe = slot_uop_fp_ctrl_fastpipe;
	assign io_out_uop_fp_ctrl_fma = slot_uop_fp_ctrl_fma;
	assign io_out_uop_fp_ctrl_div = slot_uop_fp_ctrl_div;
	assign io_out_uop_fp_ctrl_sqrt = slot_uop_fp_ctrl_sqrt;
	assign io_out_uop_fp_ctrl_wflags = slot_uop_fp_ctrl_wflags;
	assign io_out_uop_fp_ctrl_vec = slot_uop_fp_ctrl_vec;
	assign io_out_uop_rob_idx = slot_uop_rob_idx;
	assign io_out_uop_ldq_idx = slot_uop_ldq_idx;
	assign io_out_uop_stq_idx = slot_uop_stq_idx;
	assign io_out_uop_rxq_idx = slot_uop_rxq_idx;
	assign io_out_uop_pdst = slot_uop_pdst;
	assign io_out_uop_prs1 = slot_uop_prs1;
	assign io_out_uop_prs2 = slot_uop_prs2;
	assign io_out_uop_prs3 = slot_uop_prs3;
	assign io_out_uop_ppred = slot_uop_ppred;
	assign io_out_uop_prs1_busy = next_uop_prs1_busy;
	assign io_out_uop_prs2_busy = next_uop_prs2_busy;
	assign io_out_uop_prs3_busy = next_uop_prs3_busy;
	assign io_out_uop_ppred_busy = next_uop_ppred_busy;
	assign io_out_uop_stale_pdst = slot_uop_stale_pdst;
	assign io_out_uop_exception = slot_uop_exception;
	assign io_out_uop_exc_cause = slot_uop_exc_cause;
	assign io_out_uop_mem_cmd = slot_uop_mem_cmd;
	assign io_out_uop_mem_size = slot_uop_mem_size;
	assign io_out_uop_mem_signed = slot_uop_mem_signed;
	assign io_out_uop_uses_ldq = slot_uop_uses_ldq;
	assign io_out_uop_uses_stq = slot_uop_uses_stq;
	assign io_out_uop_is_unique = slot_uop_is_unique;
	assign io_out_uop_flush_on_commit = slot_uop_flush_on_commit;
	assign io_out_uop_csr_cmd = slot_uop_csr_cmd;
	assign io_out_uop_ldst_is_rs1 = slot_uop_ldst_is_rs1;
	assign io_out_uop_ldst = slot_uop_ldst;
	assign io_out_uop_lrs1 = slot_uop_lrs1;
	assign io_out_uop_lrs2 = slot_uop_lrs2;
	assign io_out_uop_lrs3 = slot_uop_lrs3;
	assign io_out_uop_dst_rtype = slot_uop_dst_rtype;
	assign io_out_uop_lrs1_rtype = slot_uop_lrs1_rtype;
	assign io_out_uop_lrs2_rtype = slot_uop_lrs2_rtype;
	assign io_out_uop_frs3_en = slot_uop_frs3_en;
	assign io_out_uop_fcn_dw = slot_uop_fcn_dw;
	assign io_out_uop_fcn_op = slot_uop_fcn_op;
	assign io_out_uop_fp_val = slot_uop_fp_val;
	assign io_out_uop_xcpt_pf_if = slot_uop_xcpt_pf_if;
	assign io_out_uop_xcpt_ae_if = slot_uop_xcpt_ae_if;
	assign io_out_uop_xcpt_ma_if = slot_uop_xcpt_ma_if;
	assign io_out_uop_bp_debug_if = slot_uop_bp_debug_if;
	assign io_out_uop_bp_xcpt_if = slot_uop_bp_xcpt_if;
	assign io_out_uop_debug_fsrc = slot_uop_debug_fsrc;
	assign io_out_uop_debug_tsrc = slot_uop_debug_tsrc;
endmodule
