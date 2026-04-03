module BranchKillablePipeline_1 (
	clock,
	reset,
	io_req_valid,
	io_req_bits_uop_inst,
	io_req_bits_uop_debug_inst,
	io_req_bits_uop_is_rvc,
	io_req_bits_uop_debug_pc,
	io_req_bits_uop_iq_type_0,
	io_req_bits_uop_iq_type_1,
	io_req_bits_uop_iq_type_2,
	io_req_bits_uop_iq_type_3,
	io_req_bits_uop_fu_code_0,
	io_req_bits_uop_fu_code_1,
	io_req_bits_uop_fu_code_2,
	io_req_bits_uop_fu_code_3,
	io_req_bits_uop_fu_code_4,
	io_req_bits_uop_fu_code_5,
	io_req_bits_uop_fu_code_6,
	io_req_bits_uop_fu_code_7,
	io_req_bits_uop_fu_code_8,
	io_req_bits_uop_fu_code_9,
	io_req_bits_uop_iw_issued,
	io_req_bits_uop_iw_issued_partial_agen,
	io_req_bits_uop_iw_issued_partial_dgen,
	io_req_bits_uop_iw_p1_speculative_child,
	io_req_bits_uop_iw_p2_speculative_child,
	io_req_bits_uop_iw_p1_bypass_hint,
	io_req_bits_uop_iw_p2_bypass_hint,
	io_req_bits_uop_iw_p3_bypass_hint,
	io_req_bits_uop_dis_col_sel,
	io_req_bits_uop_br_mask,
	io_req_bits_uop_br_tag,
	io_req_bits_uop_br_type,
	io_req_bits_uop_is_sfb,
	io_req_bits_uop_is_fence,
	io_req_bits_uop_is_fencei,
	io_req_bits_uop_is_sfence,
	io_req_bits_uop_is_amo,
	io_req_bits_uop_is_eret,
	io_req_bits_uop_is_sys_pc2epc,
	io_req_bits_uop_is_rocc,
	io_req_bits_uop_is_mov,
	io_req_bits_uop_ftq_idx,
	io_req_bits_uop_edge_inst,
	io_req_bits_uop_pc_lob,
	io_req_bits_uop_taken,
	io_req_bits_uop_imm_rename,
	io_req_bits_uop_imm_sel,
	io_req_bits_uop_pimm,
	io_req_bits_uop_imm_packed,
	io_req_bits_uop_op1_sel,
	io_req_bits_uop_op2_sel,
	io_req_bits_uop_fp_ctrl_ldst,
	io_req_bits_uop_fp_ctrl_wen,
	io_req_bits_uop_fp_ctrl_ren1,
	io_req_bits_uop_fp_ctrl_ren2,
	io_req_bits_uop_fp_ctrl_ren3,
	io_req_bits_uop_fp_ctrl_swap12,
	io_req_bits_uop_fp_ctrl_swap23,
	io_req_bits_uop_fp_ctrl_typeTagIn,
	io_req_bits_uop_fp_ctrl_typeTagOut,
	io_req_bits_uop_fp_ctrl_fromint,
	io_req_bits_uop_fp_ctrl_toint,
	io_req_bits_uop_fp_ctrl_fastpipe,
	io_req_bits_uop_fp_ctrl_fma,
	io_req_bits_uop_fp_ctrl_div,
	io_req_bits_uop_fp_ctrl_sqrt,
	io_req_bits_uop_fp_ctrl_wflags,
	io_req_bits_uop_fp_ctrl_vec,
	io_req_bits_uop_rob_idx,
	io_req_bits_uop_ldq_idx,
	io_req_bits_uop_stq_idx,
	io_req_bits_uop_rxq_idx,
	io_req_bits_uop_pdst,
	io_req_bits_uop_prs1,
	io_req_bits_uop_prs2,
	io_req_bits_uop_prs3,
	io_req_bits_uop_ppred,
	io_req_bits_uop_prs1_busy,
	io_req_bits_uop_prs2_busy,
	io_req_bits_uop_prs3_busy,
	io_req_bits_uop_ppred_busy,
	io_req_bits_uop_stale_pdst,
	io_req_bits_uop_exception,
	io_req_bits_uop_exc_cause,
	io_req_bits_uop_mem_cmd,
	io_req_bits_uop_mem_size,
	io_req_bits_uop_mem_signed,
	io_req_bits_uop_uses_ldq,
	io_req_bits_uop_uses_stq,
	io_req_bits_uop_is_unique,
	io_req_bits_uop_flush_on_commit,
	io_req_bits_uop_csr_cmd,
	io_req_bits_uop_ldst_is_rs1,
	io_req_bits_uop_ldst,
	io_req_bits_uop_lrs1,
	io_req_bits_uop_lrs2,
	io_req_bits_uop_lrs3,
	io_req_bits_uop_dst_rtype,
	io_req_bits_uop_lrs1_rtype,
	io_req_bits_uop_lrs2_rtype,
	io_req_bits_uop_frs3_en,
	io_req_bits_uop_fcn_dw,
	io_req_bits_uop_fcn_op,
	io_req_bits_uop_fp_val,
	io_req_bits_uop_fp_rm,
	io_req_bits_uop_fp_typ,
	io_req_bits_uop_xcpt_pf_if,
	io_req_bits_uop_xcpt_ae_if,
	io_req_bits_uop_xcpt_ma_if,
	io_req_bits_uop_bp_debug_if,
	io_req_bits_uop_bp_xcpt_if,
	io_req_bits_uop_debug_fsrc,
	io_req_bits_uop_debug_tsrc,
	io_flush,
	io_brupdate_b1_resolve_mask,
	io_brupdate_b1_mispredict_mask,
	io_resp_1_valid,
	io_resp_1_bits_uop_inst,
	io_resp_1_bits_uop_debug_inst,
	io_resp_1_bits_uop_is_rvc,
	io_resp_1_bits_uop_debug_pc,
	io_resp_1_bits_uop_iq_type_0,
	io_resp_1_bits_uop_iq_type_1,
	io_resp_1_bits_uop_iq_type_2,
	io_resp_1_bits_uop_iq_type_3,
	io_resp_1_bits_uop_fu_code_0,
	io_resp_1_bits_uop_fu_code_1,
	io_resp_1_bits_uop_fu_code_2,
	io_resp_1_bits_uop_fu_code_3,
	io_resp_1_bits_uop_fu_code_4,
	io_resp_1_bits_uop_fu_code_5,
	io_resp_1_bits_uop_fu_code_6,
	io_resp_1_bits_uop_fu_code_7,
	io_resp_1_bits_uop_fu_code_8,
	io_resp_1_bits_uop_fu_code_9,
	io_resp_1_bits_uop_iw_issued,
	io_resp_1_bits_uop_iw_issued_partial_agen,
	io_resp_1_bits_uop_iw_issued_partial_dgen,
	io_resp_1_bits_uop_iw_p1_speculative_child,
	io_resp_1_bits_uop_iw_p2_speculative_child,
	io_resp_1_bits_uop_iw_p1_bypass_hint,
	io_resp_1_bits_uop_iw_p2_bypass_hint,
	io_resp_1_bits_uop_iw_p3_bypass_hint,
	io_resp_1_bits_uop_dis_col_sel,
	io_resp_1_bits_uop_br_mask,
	io_resp_1_bits_uop_br_tag,
	io_resp_1_bits_uop_br_type,
	io_resp_1_bits_uop_is_sfb,
	io_resp_1_bits_uop_is_fence,
	io_resp_1_bits_uop_is_fencei,
	io_resp_1_bits_uop_is_sfence,
	io_resp_1_bits_uop_is_amo,
	io_resp_1_bits_uop_is_eret,
	io_resp_1_bits_uop_is_sys_pc2epc,
	io_resp_1_bits_uop_is_rocc,
	io_resp_1_bits_uop_is_mov,
	io_resp_1_bits_uop_ftq_idx,
	io_resp_1_bits_uop_edge_inst,
	io_resp_1_bits_uop_pc_lob,
	io_resp_1_bits_uop_taken,
	io_resp_1_bits_uop_imm_rename,
	io_resp_1_bits_uop_imm_sel,
	io_resp_1_bits_uop_pimm,
	io_resp_1_bits_uop_imm_packed,
	io_resp_1_bits_uop_op1_sel,
	io_resp_1_bits_uop_op2_sel,
	io_resp_1_bits_uop_fp_ctrl_ldst,
	io_resp_1_bits_uop_fp_ctrl_wen,
	io_resp_1_bits_uop_fp_ctrl_ren1,
	io_resp_1_bits_uop_fp_ctrl_ren2,
	io_resp_1_bits_uop_fp_ctrl_ren3,
	io_resp_1_bits_uop_fp_ctrl_swap12,
	io_resp_1_bits_uop_fp_ctrl_swap23,
	io_resp_1_bits_uop_fp_ctrl_typeTagIn,
	io_resp_1_bits_uop_fp_ctrl_typeTagOut,
	io_resp_1_bits_uop_fp_ctrl_fromint,
	io_resp_1_bits_uop_fp_ctrl_toint,
	io_resp_1_bits_uop_fp_ctrl_fastpipe,
	io_resp_1_bits_uop_fp_ctrl_fma,
	io_resp_1_bits_uop_fp_ctrl_div,
	io_resp_1_bits_uop_fp_ctrl_sqrt,
	io_resp_1_bits_uop_fp_ctrl_wflags,
	io_resp_1_bits_uop_fp_ctrl_vec,
	io_resp_1_bits_uop_rob_idx,
	io_resp_1_bits_uop_ldq_idx,
	io_resp_1_bits_uop_stq_idx,
	io_resp_1_bits_uop_rxq_idx,
	io_resp_1_bits_uop_pdst,
	io_resp_1_bits_uop_prs1,
	io_resp_1_bits_uop_prs2,
	io_resp_1_bits_uop_prs3,
	io_resp_1_bits_uop_ppred,
	io_resp_1_bits_uop_prs1_busy,
	io_resp_1_bits_uop_prs2_busy,
	io_resp_1_bits_uop_prs3_busy,
	io_resp_1_bits_uop_ppred_busy,
	io_resp_1_bits_uop_stale_pdst,
	io_resp_1_bits_uop_exception,
	io_resp_1_bits_uop_exc_cause,
	io_resp_1_bits_uop_mem_cmd,
	io_resp_1_bits_uop_mem_size,
	io_resp_1_bits_uop_mem_signed,
	io_resp_1_bits_uop_uses_ldq,
	io_resp_1_bits_uop_uses_stq,
	io_resp_1_bits_uop_is_unique,
	io_resp_1_bits_uop_flush_on_commit,
	io_resp_1_bits_uop_csr_cmd,
	io_resp_1_bits_uop_ldst_is_rs1,
	io_resp_1_bits_uop_ldst,
	io_resp_1_bits_uop_lrs1,
	io_resp_1_bits_uop_lrs2,
	io_resp_1_bits_uop_lrs3,
	io_resp_1_bits_uop_dst_rtype,
	io_resp_1_bits_uop_lrs1_rtype,
	io_resp_1_bits_uop_lrs2_rtype,
	io_resp_1_bits_uop_frs3_en,
	io_resp_1_bits_uop_fcn_dw,
	io_resp_1_bits_uop_fcn_op,
	io_resp_1_bits_uop_fp_val,
	io_resp_1_bits_uop_fp_rm,
	io_resp_1_bits_uop_fp_typ,
	io_resp_1_bits_uop_xcpt_pf_if,
	io_resp_1_bits_uop_xcpt_ae_if,
	io_resp_1_bits_uop_xcpt_ma_if,
	io_resp_1_bits_uop_bp_debug_if,
	io_resp_1_bits_uop_bp_xcpt_if,
	io_resp_1_bits_uop_debug_fsrc,
	io_resp_1_bits_uop_debug_tsrc
);
	input clock;
	input reset;
	input io_req_valid;
	input [31:0] io_req_bits_uop_inst;
	input [31:0] io_req_bits_uop_debug_inst;
	input io_req_bits_uop_is_rvc;
	input [39:0] io_req_bits_uop_debug_pc;
	input io_req_bits_uop_iq_type_0;
	input io_req_bits_uop_iq_type_1;
	input io_req_bits_uop_iq_type_2;
	input io_req_bits_uop_iq_type_3;
	input io_req_bits_uop_fu_code_0;
	input io_req_bits_uop_fu_code_1;
	input io_req_bits_uop_fu_code_2;
	input io_req_bits_uop_fu_code_3;
	input io_req_bits_uop_fu_code_4;
	input io_req_bits_uop_fu_code_5;
	input io_req_bits_uop_fu_code_6;
	input io_req_bits_uop_fu_code_7;
	input io_req_bits_uop_fu_code_8;
	input io_req_bits_uop_fu_code_9;
	input io_req_bits_uop_iw_issued;
	input io_req_bits_uop_iw_issued_partial_agen;
	input io_req_bits_uop_iw_issued_partial_dgen;
	input io_req_bits_uop_iw_p1_speculative_child;
	input io_req_bits_uop_iw_p2_speculative_child;
	input io_req_bits_uop_iw_p1_bypass_hint;
	input io_req_bits_uop_iw_p2_bypass_hint;
	input io_req_bits_uop_iw_p3_bypass_hint;
	input io_req_bits_uop_dis_col_sel;
	input [7:0] io_req_bits_uop_br_mask;
	input [2:0] io_req_bits_uop_br_tag;
	input [3:0] io_req_bits_uop_br_type;
	input io_req_bits_uop_is_sfb;
	input io_req_bits_uop_is_fence;
	input io_req_bits_uop_is_fencei;
	input io_req_bits_uop_is_sfence;
	input io_req_bits_uop_is_amo;
	input io_req_bits_uop_is_eret;
	input io_req_bits_uop_is_sys_pc2epc;
	input io_req_bits_uop_is_rocc;
	input io_req_bits_uop_is_mov;
	input [3:0] io_req_bits_uop_ftq_idx;
	input io_req_bits_uop_edge_inst;
	input [5:0] io_req_bits_uop_pc_lob;
	input io_req_bits_uop_taken;
	input io_req_bits_uop_imm_rename;
	input [2:0] io_req_bits_uop_imm_sel;
	input [4:0] io_req_bits_uop_pimm;
	input [19:0] io_req_bits_uop_imm_packed;
	input [1:0] io_req_bits_uop_op1_sel;
	input [2:0] io_req_bits_uop_op2_sel;
	input io_req_bits_uop_fp_ctrl_ldst;
	input io_req_bits_uop_fp_ctrl_wen;
	input io_req_bits_uop_fp_ctrl_ren1;
	input io_req_bits_uop_fp_ctrl_ren2;
	input io_req_bits_uop_fp_ctrl_ren3;
	input io_req_bits_uop_fp_ctrl_swap12;
	input io_req_bits_uop_fp_ctrl_swap23;
	input [1:0] io_req_bits_uop_fp_ctrl_typeTagIn;
	input [1:0] io_req_bits_uop_fp_ctrl_typeTagOut;
	input io_req_bits_uop_fp_ctrl_fromint;
	input io_req_bits_uop_fp_ctrl_toint;
	input io_req_bits_uop_fp_ctrl_fastpipe;
	input io_req_bits_uop_fp_ctrl_fma;
	input io_req_bits_uop_fp_ctrl_div;
	input io_req_bits_uop_fp_ctrl_sqrt;
	input io_req_bits_uop_fp_ctrl_wflags;
	input io_req_bits_uop_fp_ctrl_vec;
	input [4:0] io_req_bits_uop_rob_idx;
	input [3:0] io_req_bits_uop_ldq_idx;
	input [3:0] io_req_bits_uop_stq_idx;
	input [1:0] io_req_bits_uop_rxq_idx;
	input [5:0] io_req_bits_uop_pdst;
	input [5:0] io_req_bits_uop_prs1;
	input [5:0] io_req_bits_uop_prs2;
	input [5:0] io_req_bits_uop_prs3;
	input [3:0] io_req_bits_uop_ppred;
	input io_req_bits_uop_prs1_busy;
	input io_req_bits_uop_prs2_busy;
	input io_req_bits_uop_prs3_busy;
	input io_req_bits_uop_ppred_busy;
	input [5:0] io_req_bits_uop_stale_pdst;
	input io_req_bits_uop_exception;
	input [63:0] io_req_bits_uop_exc_cause;
	input [4:0] io_req_bits_uop_mem_cmd;
	input [1:0] io_req_bits_uop_mem_size;
	input io_req_bits_uop_mem_signed;
	input io_req_bits_uop_uses_ldq;
	input io_req_bits_uop_uses_stq;
	input io_req_bits_uop_is_unique;
	input io_req_bits_uop_flush_on_commit;
	input [2:0] io_req_bits_uop_csr_cmd;
	input io_req_bits_uop_ldst_is_rs1;
	input [5:0] io_req_bits_uop_ldst;
	input [5:0] io_req_bits_uop_lrs1;
	input [5:0] io_req_bits_uop_lrs2;
	input [5:0] io_req_bits_uop_lrs3;
	input [1:0] io_req_bits_uop_dst_rtype;
	input [1:0] io_req_bits_uop_lrs1_rtype;
	input [1:0] io_req_bits_uop_lrs2_rtype;
	input io_req_bits_uop_frs3_en;
	input io_req_bits_uop_fcn_dw;
	input [4:0] io_req_bits_uop_fcn_op;
	input io_req_bits_uop_fp_val;
	input [2:0] io_req_bits_uop_fp_rm;
	input [1:0] io_req_bits_uop_fp_typ;
	input io_req_bits_uop_xcpt_pf_if;
	input io_req_bits_uop_xcpt_ae_if;
	input io_req_bits_uop_xcpt_ma_if;
	input io_req_bits_uop_bp_debug_if;
	input io_req_bits_uop_bp_xcpt_if;
	input [2:0] io_req_bits_uop_debug_fsrc;
	input [2:0] io_req_bits_uop_debug_tsrc;
	input io_flush;
	input [7:0] io_brupdate_b1_resolve_mask;
	input [7:0] io_brupdate_b1_mispredict_mask;
	output wire io_resp_1_valid;
	output wire [31:0] io_resp_1_bits_uop_inst;
	output wire [31:0] io_resp_1_bits_uop_debug_inst;
	output wire io_resp_1_bits_uop_is_rvc;
	output wire [39:0] io_resp_1_bits_uop_debug_pc;
	output wire io_resp_1_bits_uop_iq_type_0;
	output wire io_resp_1_bits_uop_iq_type_1;
	output wire io_resp_1_bits_uop_iq_type_2;
	output wire io_resp_1_bits_uop_iq_type_3;
	output wire io_resp_1_bits_uop_fu_code_0;
	output wire io_resp_1_bits_uop_fu_code_1;
	output wire io_resp_1_bits_uop_fu_code_2;
	output wire io_resp_1_bits_uop_fu_code_3;
	output wire io_resp_1_bits_uop_fu_code_4;
	output wire io_resp_1_bits_uop_fu_code_5;
	output wire io_resp_1_bits_uop_fu_code_6;
	output wire io_resp_1_bits_uop_fu_code_7;
	output wire io_resp_1_bits_uop_fu_code_8;
	output wire io_resp_1_bits_uop_fu_code_9;
	output wire io_resp_1_bits_uop_iw_issued;
	output wire io_resp_1_bits_uop_iw_issued_partial_agen;
	output wire io_resp_1_bits_uop_iw_issued_partial_dgen;
	output wire io_resp_1_bits_uop_iw_p1_speculative_child;
	output wire io_resp_1_bits_uop_iw_p2_speculative_child;
	output wire io_resp_1_bits_uop_iw_p1_bypass_hint;
	output wire io_resp_1_bits_uop_iw_p2_bypass_hint;
	output wire io_resp_1_bits_uop_iw_p3_bypass_hint;
	output wire io_resp_1_bits_uop_dis_col_sel;
	output wire [7:0] io_resp_1_bits_uop_br_mask;
	output wire [2:0] io_resp_1_bits_uop_br_tag;
	output wire [3:0] io_resp_1_bits_uop_br_type;
	output wire io_resp_1_bits_uop_is_sfb;
	output wire io_resp_1_bits_uop_is_fence;
	output wire io_resp_1_bits_uop_is_fencei;
	output wire io_resp_1_bits_uop_is_sfence;
	output wire io_resp_1_bits_uop_is_amo;
	output wire io_resp_1_bits_uop_is_eret;
	output wire io_resp_1_bits_uop_is_sys_pc2epc;
	output wire io_resp_1_bits_uop_is_rocc;
	output wire io_resp_1_bits_uop_is_mov;
	output wire [3:0] io_resp_1_bits_uop_ftq_idx;
	output wire io_resp_1_bits_uop_edge_inst;
	output wire [5:0] io_resp_1_bits_uop_pc_lob;
	output wire io_resp_1_bits_uop_taken;
	output wire io_resp_1_bits_uop_imm_rename;
	output wire [2:0] io_resp_1_bits_uop_imm_sel;
	output wire [4:0] io_resp_1_bits_uop_pimm;
	output wire [19:0] io_resp_1_bits_uop_imm_packed;
	output wire [1:0] io_resp_1_bits_uop_op1_sel;
	output wire [2:0] io_resp_1_bits_uop_op2_sel;
	output wire io_resp_1_bits_uop_fp_ctrl_ldst;
	output wire io_resp_1_bits_uop_fp_ctrl_wen;
	output wire io_resp_1_bits_uop_fp_ctrl_ren1;
	output wire io_resp_1_bits_uop_fp_ctrl_ren2;
	output wire io_resp_1_bits_uop_fp_ctrl_ren3;
	output wire io_resp_1_bits_uop_fp_ctrl_swap12;
	output wire io_resp_1_bits_uop_fp_ctrl_swap23;
	output wire [1:0] io_resp_1_bits_uop_fp_ctrl_typeTagIn;
	output wire [1:0] io_resp_1_bits_uop_fp_ctrl_typeTagOut;
	output wire io_resp_1_bits_uop_fp_ctrl_fromint;
	output wire io_resp_1_bits_uop_fp_ctrl_toint;
	output wire io_resp_1_bits_uop_fp_ctrl_fastpipe;
	output wire io_resp_1_bits_uop_fp_ctrl_fma;
	output wire io_resp_1_bits_uop_fp_ctrl_div;
	output wire io_resp_1_bits_uop_fp_ctrl_sqrt;
	output wire io_resp_1_bits_uop_fp_ctrl_wflags;
	output wire io_resp_1_bits_uop_fp_ctrl_vec;
	output wire [4:0] io_resp_1_bits_uop_rob_idx;
	output wire [3:0] io_resp_1_bits_uop_ldq_idx;
	output wire [3:0] io_resp_1_bits_uop_stq_idx;
	output wire [1:0] io_resp_1_bits_uop_rxq_idx;
	output wire [5:0] io_resp_1_bits_uop_pdst;
	output wire [5:0] io_resp_1_bits_uop_prs1;
	output wire [5:0] io_resp_1_bits_uop_prs2;
	output wire [5:0] io_resp_1_bits_uop_prs3;
	output wire [3:0] io_resp_1_bits_uop_ppred;
	output wire io_resp_1_bits_uop_prs1_busy;
	output wire io_resp_1_bits_uop_prs2_busy;
	output wire io_resp_1_bits_uop_prs3_busy;
	output wire io_resp_1_bits_uop_ppred_busy;
	output wire [5:0] io_resp_1_bits_uop_stale_pdst;
	output wire io_resp_1_bits_uop_exception;
	output wire [63:0] io_resp_1_bits_uop_exc_cause;
	output wire [4:0] io_resp_1_bits_uop_mem_cmd;
	output wire [1:0] io_resp_1_bits_uop_mem_size;
	output wire io_resp_1_bits_uop_mem_signed;
	output wire io_resp_1_bits_uop_uses_ldq;
	output wire io_resp_1_bits_uop_uses_stq;
	output wire io_resp_1_bits_uop_is_unique;
	output wire io_resp_1_bits_uop_flush_on_commit;
	output wire [2:0] io_resp_1_bits_uop_csr_cmd;
	output wire io_resp_1_bits_uop_ldst_is_rs1;
	output wire [5:0] io_resp_1_bits_uop_ldst;
	output wire [5:0] io_resp_1_bits_uop_lrs1;
	output wire [5:0] io_resp_1_bits_uop_lrs2;
	output wire [5:0] io_resp_1_bits_uop_lrs3;
	output wire [1:0] io_resp_1_bits_uop_dst_rtype;
	output wire [1:0] io_resp_1_bits_uop_lrs1_rtype;
	output wire [1:0] io_resp_1_bits_uop_lrs2_rtype;
	output wire io_resp_1_bits_uop_frs3_en;
	output wire io_resp_1_bits_uop_fcn_dw;
	output wire [4:0] io_resp_1_bits_uop_fcn_op;
	output wire io_resp_1_bits_uop_fp_val;
	output wire [2:0] io_resp_1_bits_uop_fp_rm;
	output wire [1:0] io_resp_1_bits_uop_fp_typ;
	output wire io_resp_1_bits_uop_xcpt_pf_if;
	output wire io_resp_1_bits_uop_xcpt_ae_if;
	output wire io_resp_1_bits_uop_xcpt_ma_if;
	output wire io_resp_1_bits_uop_bp_debug_if;
	output wire io_resp_1_bits_uop_bp_xcpt_if;
	output wire [2:0] io_resp_1_bits_uop_debug_fsrc;
	output wire [2:0] io_resp_1_bits_uop_debug_tsrc;
	reg uops_0_valid;
	reg [31:0] uops_0_bits_uop_inst;
	reg [31:0] uops_0_bits_uop_debug_inst;
	reg uops_0_bits_uop_is_rvc;
	reg [39:0] uops_0_bits_uop_debug_pc;
	reg uops_0_bits_uop_iq_type_0;
	reg uops_0_bits_uop_iq_type_1;
	reg uops_0_bits_uop_iq_type_2;
	reg uops_0_bits_uop_iq_type_3;
	reg uops_0_bits_uop_fu_code_0;
	reg uops_0_bits_uop_fu_code_1;
	reg uops_0_bits_uop_fu_code_2;
	reg uops_0_bits_uop_fu_code_3;
	reg uops_0_bits_uop_fu_code_4;
	reg uops_0_bits_uop_fu_code_5;
	reg uops_0_bits_uop_fu_code_6;
	reg uops_0_bits_uop_fu_code_7;
	reg uops_0_bits_uop_fu_code_8;
	reg uops_0_bits_uop_fu_code_9;
	reg uops_0_bits_uop_iw_issued;
	reg uops_0_bits_uop_iw_issued_partial_agen;
	reg uops_0_bits_uop_iw_issued_partial_dgen;
	reg uops_0_bits_uop_iw_p1_speculative_child;
	reg uops_0_bits_uop_iw_p2_speculative_child;
	reg uops_0_bits_uop_iw_p1_bypass_hint;
	reg uops_0_bits_uop_iw_p2_bypass_hint;
	reg uops_0_bits_uop_iw_p3_bypass_hint;
	reg uops_0_bits_uop_dis_col_sel;
	reg [7:0] uops_0_bits_uop_br_mask;
	reg [2:0] uops_0_bits_uop_br_tag;
	reg [3:0] uops_0_bits_uop_br_type;
	reg uops_0_bits_uop_is_sfb;
	reg uops_0_bits_uop_is_fence;
	reg uops_0_bits_uop_is_fencei;
	reg uops_0_bits_uop_is_sfence;
	reg uops_0_bits_uop_is_amo;
	reg uops_0_bits_uop_is_eret;
	reg uops_0_bits_uop_is_sys_pc2epc;
	reg uops_0_bits_uop_is_rocc;
	reg uops_0_bits_uop_is_mov;
	reg [3:0] uops_0_bits_uop_ftq_idx;
	reg uops_0_bits_uop_edge_inst;
	reg [5:0] uops_0_bits_uop_pc_lob;
	reg uops_0_bits_uop_taken;
	reg uops_0_bits_uop_imm_rename;
	reg [2:0] uops_0_bits_uop_imm_sel;
	reg [4:0] uops_0_bits_uop_pimm;
	reg [19:0] uops_0_bits_uop_imm_packed;
	reg [1:0] uops_0_bits_uop_op1_sel;
	reg [2:0] uops_0_bits_uop_op2_sel;
	reg uops_0_bits_uop_fp_ctrl_ldst;
	reg uops_0_bits_uop_fp_ctrl_wen;
	reg uops_0_bits_uop_fp_ctrl_ren1;
	reg uops_0_bits_uop_fp_ctrl_ren2;
	reg uops_0_bits_uop_fp_ctrl_ren3;
	reg uops_0_bits_uop_fp_ctrl_swap12;
	reg uops_0_bits_uop_fp_ctrl_swap23;
	reg [1:0] uops_0_bits_uop_fp_ctrl_typeTagIn;
	reg [1:0] uops_0_bits_uop_fp_ctrl_typeTagOut;
	reg uops_0_bits_uop_fp_ctrl_fromint;
	reg uops_0_bits_uop_fp_ctrl_toint;
	reg uops_0_bits_uop_fp_ctrl_fastpipe;
	reg uops_0_bits_uop_fp_ctrl_fma;
	reg uops_0_bits_uop_fp_ctrl_div;
	reg uops_0_bits_uop_fp_ctrl_sqrt;
	reg uops_0_bits_uop_fp_ctrl_wflags;
	reg uops_0_bits_uop_fp_ctrl_vec;
	reg [4:0] uops_0_bits_uop_rob_idx;
	reg [3:0] uops_0_bits_uop_ldq_idx;
	reg [3:0] uops_0_bits_uop_stq_idx;
	reg [1:0] uops_0_bits_uop_rxq_idx;
	reg [5:0] uops_0_bits_uop_pdst;
	reg [5:0] uops_0_bits_uop_prs1;
	reg [5:0] uops_0_bits_uop_prs2;
	reg [5:0] uops_0_bits_uop_prs3;
	reg [3:0] uops_0_bits_uop_ppred;
	reg uops_0_bits_uop_prs1_busy;
	reg uops_0_bits_uop_prs2_busy;
	reg uops_0_bits_uop_prs3_busy;
	reg uops_0_bits_uop_ppred_busy;
	reg [5:0] uops_0_bits_uop_stale_pdst;
	reg uops_0_bits_uop_exception;
	reg [63:0] uops_0_bits_uop_exc_cause;
	reg [4:0] uops_0_bits_uop_mem_cmd;
	reg [1:0] uops_0_bits_uop_mem_size;
	reg uops_0_bits_uop_mem_signed;
	reg uops_0_bits_uop_uses_ldq;
	reg uops_0_bits_uop_uses_stq;
	reg uops_0_bits_uop_is_unique;
	reg uops_0_bits_uop_flush_on_commit;
	reg [2:0] uops_0_bits_uop_csr_cmd;
	reg uops_0_bits_uop_ldst_is_rs1;
	reg [5:0] uops_0_bits_uop_ldst;
	reg [5:0] uops_0_bits_uop_lrs1;
	reg [5:0] uops_0_bits_uop_lrs2;
	reg [5:0] uops_0_bits_uop_lrs3;
	reg [1:0] uops_0_bits_uop_dst_rtype;
	reg [1:0] uops_0_bits_uop_lrs1_rtype;
	reg [1:0] uops_0_bits_uop_lrs2_rtype;
	reg uops_0_bits_uop_frs3_en;
	reg uops_0_bits_uop_fcn_dw;
	reg [4:0] uops_0_bits_uop_fcn_op;
	reg uops_0_bits_uop_fp_val;
	reg [2:0] uops_0_bits_uop_fp_rm;
	reg [1:0] uops_0_bits_uop_fp_typ;
	reg uops_0_bits_uop_xcpt_pf_if;
	reg uops_0_bits_uop_xcpt_ae_if;
	reg uops_0_bits_uop_xcpt_ma_if;
	reg uops_0_bits_uop_bp_debug_if;
	reg uops_0_bits_uop_bp_xcpt_if;
	reg [2:0] uops_0_bits_uop_debug_fsrc;
	reg [2:0] uops_0_bits_uop_debug_tsrc;
	reg uops_1_valid;
	reg [31:0] uops_1_bits_uop_inst;
	reg [31:0] uops_1_bits_uop_debug_inst;
	reg uops_1_bits_uop_is_rvc;
	reg [39:0] uops_1_bits_uop_debug_pc;
	reg uops_1_bits_uop_iq_type_0;
	reg uops_1_bits_uop_iq_type_1;
	reg uops_1_bits_uop_iq_type_2;
	reg uops_1_bits_uop_iq_type_3;
	reg uops_1_bits_uop_fu_code_0;
	reg uops_1_bits_uop_fu_code_1;
	reg uops_1_bits_uop_fu_code_2;
	reg uops_1_bits_uop_fu_code_3;
	reg uops_1_bits_uop_fu_code_4;
	reg uops_1_bits_uop_fu_code_5;
	reg uops_1_bits_uop_fu_code_6;
	reg uops_1_bits_uop_fu_code_7;
	reg uops_1_bits_uop_fu_code_8;
	reg uops_1_bits_uop_fu_code_9;
	reg uops_1_bits_uop_iw_issued;
	reg uops_1_bits_uop_iw_issued_partial_agen;
	reg uops_1_bits_uop_iw_issued_partial_dgen;
	reg uops_1_bits_uop_iw_p1_speculative_child;
	reg uops_1_bits_uop_iw_p2_speculative_child;
	reg uops_1_bits_uop_iw_p1_bypass_hint;
	reg uops_1_bits_uop_iw_p2_bypass_hint;
	reg uops_1_bits_uop_iw_p3_bypass_hint;
	reg uops_1_bits_uop_dis_col_sel;
	reg [7:0] uops_1_bits_uop_br_mask;
	reg [2:0] uops_1_bits_uop_br_tag;
	reg [3:0] uops_1_bits_uop_br_type;
	reg uops_1_bits_uop_is_sfb;
	reg uops_1_bits_uop_is_fence;
	reg uops_1_bits_uop_is_fencei;
	reg uops_1_bits_uop_is_sfence;
	reg uops_1_bits_uop_is_amo;
	reg uops_1_bits_uop_is_eret;
	reg uops_1_bits_uop_is_sys_pc2epc;
	reg uops_1_bits_uop_is_rocc;
	reg uops_1_bits_uop_is_mov;
	reg [3:0] uops_1_bits_uop_ftq_idx;
	reg uops_1_bits_uop_edge_inst;
	reg [5:0] uops_1_bits_uop_pc_lob;
	reg uops_1_bits_uop_taken;
	reg uops_1_bits_uop_imm_rename;
	reg [2:0] uops_1_bits_uop_imm_sel;
	reg [4:0] uops_1_bits_uop_pimm;
	reg [19:0] uops_1_bits_uop_imm_packed;
	reg [1:0] uops_1_bits_uop_op1_sel;
	reg [2:0] uops_1_bits_uop_op2_sel;
	reg uops_1_bits_uop_fp_ctrl_ldst;
	reg uops_1_bits_uop_fp_ctrl_wen;
	reg uops_1_bits_uop_fp_ctrl_ren1;
	reg uops_1_bits_uop_fp_ctrl_ren2;
	reg uops_1_bits_uop_fp_ctrl_ren3;
	reg uops_1_bits_uop_fp_ctrl_swap12;
	reg uops_1_bits_uop_fp_ctrl_swap23;
	reg [1:0] uops_1_bits_uop_fp_ctrl_typeTagIn;
	reg [1:0] uops_1_bits_uop_fp_ctrl_typeTagOut;
	reg uops_1_bits_uop_fp_ctrl_fromint;
	reg uops_1_bits_uop_fp_ctrl_toint;
	reg uops_1_bits_uop_fp_ctrl_fastpipe;
	reg uops_1_bits_uop_fp_ctrl_fma;
	reg uops_1_bits_uop_fp_ctrl_div;
	reg uops_1_bits_uop_fp_ctrl_sqrt;
	reg uops_1_bits_uop_fp_ctrl_wflags;
	reg uops_1_bits_uop_fp_ctrl_vec;
	reg [4:0] uops_1_bits_uop_rob_idx;
	reg [3:0] uops_1_bits_uop_ldq_idx;
	reg [3:0] uops_1_bits_uop_stq_idx;
	reg [1:0] uops_1_bits_uop_rxq_idx;
	reg [5:0] uops_1_bits_uop_pdst;
	reg [5:0] uops_1_bits_uop_prs1;
	reg [5:0] uops_1_bits_uop_prs2;
	reg [5:0] uops_1_bits_uop_prs3;
	reg [3:0] uops_1_bits_uop_ppred;
	reg uops_1_bits_uop_prs1_busy;
	reg uops_1_bits_uop_prs2_busy;
	reg uops_1_bits_uop_prs3_busy;
	reg uops_1_bits_uop_ppred_busy;
	reg [5:0] uops_1_bits_uop_stale_pdst;
	reg uops_1_bits_uop_exception;
	reg [63:0] uops_1_bits_uop_exc_cause;
	reg [4:0] uops_1_bits_uop_mem_cmd;
	reg [1:0] uops_1_bits_uop_mem_size;
	reg uops_1_bits_uop_mem_signed;
	reg uops_1_bits_uop_uses_ldq;
	reg uops_1_bits_uop_uses_stq;
	reg uops_1_bits_uop_is_unique;
	reg uops_1_bits_uop_flush_on_commit;
	reg [2:0] uops_1_bits_uop_csr_cmd;
	reg uops_1_bits_uop_ldst_is_rs1;
	reg [5:0] uops_1_bits_uop_ldst;
	reg [5:0] uops_1_bits_uop_lrs1;
	reg [5:0] uops_1_bits_uop_lrs2;
	reg [5:0] uops_1_bits_uop_lrs3;
	reg [1:0] uops_1_bits_uop_dst_rtype;
	reg [1:0] uops_1_bits_uop_lrs1_rtype;
	reg [1:0] uops_1_bits_uop_lrs2_rtype;
	reg uops_1_bits_uop_frs3_en;
	reg uops_1_bits_uop_fcn_dw;
	reg [4:0] uops_1_bits_uop_fcn_op;
	reg uops_1_bits_uop_fp_val;
	reg [2:0] uops_1_bits_uop_fp_rm;
	reg [1:0] uops_1_bits_uop_fp_typ;
	reg uops_1_bits_uop_xcpt_pf_if;
	reg uops_1_bits_uop_xcpt_ae_if;
	reg uops_1_bits_uop_xcpt_ma_if;
	reg uops_1_bits_uop_bp_debug_if;
	reg uops_1_bits_uop_bp_xcpt_if;
	reg [2:0] uops_1_bits_uop_debug_fsrc;
	reg [2:0] uops_1_bits_uop_debug_tsrc;
	always @(posedge clock) begin
		if (reset) begin
			uops_0_valid <= 1'h0;
			uops_1_valid <= 1'h0;
		end
		else begin
			uops_0_valid <= io_req_valid & ~(|(io_brupdate_b1_mispredict_mask & io_req_bits_uop_br_mask) | io_flush);
			uops_1_valid <= uops_0_valid & ~(|(io_brupdate_b1_mispredict_mask & uops_0_bits_uop_br_mask) | io_flush);
		end
		uops_0_bits_uop_inst <= io_req_bits_uop_inst;
		uops_0_bits_uop_debug_inst <= io_req_bits_uop_debug_inst;
		uops_0_bits_uop_is_rvc <= io_req_bits_uop_is_rvc;
		uops_0_bits_uop_debug_pc <= io_req_bits_uop_debug_pc;
		uops_0_bits_uop_iq_type_0 <= io_req_bits_uop_iq_type_0;
		uops_0_bits_uop_iq_type_1 <= io_req_bits_uop_iq_type_1;
		uops_0_bits_uop_iq_type_2 <= io_req_bits_uop_iq_type_2;
		uops_0_bits_uop_iq_type_3 <= io_req_bits_uop_iq_type_3;
		uops_0_bits_uop_fu_code_0 <= io_req_bits_uop_fu_code_0;
		uops_0_bits_uop_fu_code_1 <= io_req_bits_uop_fu_code_1;
		uops_0_bits_uop_fu_code_2 <= io_req_bits_uop_fu_code_2;
		uops_0_bits_uop_fu_code_3 <= io_req_bits_uop_fu_code_3;
		uops_0_bits_uop_fu_code_4 <= io_req_bits_uop_fu_code_4;
		uops_0_bits_uop_fu_code_5 <= io_req_bits_uop_fu_code_5;
		uops_0_bits_uop_fu_code_6 <= io_req_bits_uop_fu_code_6;
		uops_0_bits_uop_fu_code_7 <= io_req_bits_uop_fu_code_7;
		uops_0_bits_uop_fu_code_8 <= io_req_bits_uop_fu_code_8;
		uops_0_bits_uop_fu_code_9 <= io_req_bits_uop_fu_code_9;
		uops_0_bits_uop_iw_issued <= io_req_bits_uop_iw_issued;
		uops_0_bits_uop_iw_issued_partial_agen <= io_req_bits_uop_iw_issued_partial_agen;
		uops_0_bits_uop_iw_issued_partial_dgen <= io_req_bits_uop_iw_issued_partial_dgen;
		uops_0_bits_uop_iw_p1_speculative_child <= io_req_bits_uop_iw_p1_speculative_child;
		uops_0_bits_uop_iw_p2_speculative_child <= io_req_bits_uop_iw_p2_speculative_child;
		uops_0_bits_uop_iw_p1_bypass_hint <= io_req_bits_uop_iw_p1_bypass_hint;
		uops_0_bits_uop_iw_p2_bypass_hint <= io_req_bits_uop_iw_p2_bypass_hint;
		uops_0_bits_uop_iw_p3_bypass_hint <= io_req_bits_uop_iw_p3_bypass_hint;
		uops_0_bits_uop_dis_col_sel <= io_req_bits_uop_dis_col_sel;
		uops_0_bits_uop_br_mask <= io_req_bits_uop_br_mask & ~io_brupdate_b1_resolve_mask;
		uops_0_bits_uop_br_tag <= io_req_bits_uop_br_tag;
		uops_0_bits_uop_br_type <= io_req_bits_uop_br_type;
		uops_0_bits_uop_is_sfb <= io_req_bits_uop_is_sfb;
		uops_0_bits_uop_is_fence <= io_req_bits_uop_is_fence;
		uops_0_bits_uop_is_fencei <= io_req_bits_uop_is_fencei;
		uops_0_bits_uop_is_sfence <= io_req_bits_uop_is_sfence;
		uops_0_bits_uop_is_amo <= io_req_bits_uop_is_amo;
		uops_0_bits_uop_is_eret <= io_req_bits_uop_is_eret;
		uops_0_bits_uop_is_sys_pc2epc <= io_req_bits_uop_is_sys_pc2epc;
		uops_0_bits_uop_is_rocc <= io_req_bits_uop_is_rocc;
		uops_0_bits_uop_is_mov <= io_req_bits_uop_is_mov;
		uops_0_bits_uop_ftq_idx <= io_req_bits_uop_ftq_idx;
		uops_0_bits_uop_edge_inst <= io_req_bits_uop_edge_inst;
		uops_0_bits_uop_pc_lob <= io_req_bits_uop_pc_lob;
		uops_0_bits_uop_taken <= io_req_bits_uop_taken;
		uops_0_bits_uop_imm_rename <= io_req_bits_uop_imm_rename;
		uops_0_bits_uop_imm_sel <= io_req_bits_uop_imm_sel;
		uops_0_bits_uop_pimm <= io_req_bits_uop_pimm;
		uops_0_bits_uop_imm_packed <= io_req_bits_uop_imm_packed;
		uops_0_bits_uop_op1_sel <= io_req_bits_uop_op1_sel;
		uops_0_bits_uop_op2_sel <= io_req_bits_uop_op2_sel;
		uops_0_bits_uop_fp_ctrl_ldst <= io_req_bits_uop_fp_ctrl_ldst;
		uops_0_bits_uop_fp_ctrl_wen <= io_req_bits_uop_fp_ctrl_wen;
		uops_0_bits_uop_fp_ctrl_ren1 <= io_req_bits_uop_fp_ctrl_ren1;
		uops_0_bits_uop_fp_ctrl_ren2 <= io_req_bits_uop_fp_ctrl_ren2;
		uops_0_bits_uop_fp_ctrl_ren3 <= io_req_bits_uop_fp_ctrl_ren3;
		uops_0_bits_uop_fp_ctrl_swap12 <= io_req_bits_uop_fp_ctrl_swap12;
		uops_0_bits_uop_fp_ctrl_swap23 <= io_req_bits_uop_fp_ctrl_swap23;
		uops_0_bits_uop_fp_ctrl_typeTagIn <= io_req_bits_uop_fp_ctrl_typeTagIn;
		uops_0_bits_uop_fp_ctrl_typeTagOut <= io_req_bits_uop_fp_ctrl_typeTagOut;
		uops_0_bits_uop_fp_ctrl_fromint <= io_req_bits_uop_fp_ctrl_fromint;
		uops_0_bits_uop_fp_ctrl_toint <= io_req_bits_uop_fp_ctrl_toint;
		uops_0_bits_uop_fp_ctrl_fastpipe <= io_req_bits_uop_fp_ctrl_fastpipe;
		uops_0_bits_uop_fp_ctrl_fma <= io_req_bits_uop_fp_ctrl_fma;
		uops_0_bits_uop_fp_ctrl_div <= io_req_bits_uop_fp_ctrl_div;
		uops_0_bits_uop_fp_ctrl_sqrt <= io_req_bits_uop_fp_ctrl_sqrt;
		uops_0_bits_uop_fp_ctrl_wflags <= io_req_bits_uop_fp_ctrl_wflags;
		uops_0_bits_uop_fp_ctrl_vec <= io_req_bits_uop_fp_ctrl_vec;
		uops_0_bits_uop_rob_idx <= io_req_bits_uop_rob_idx;
		uops_0_bits_uop_ldq_idx <= io_req_bits_uop_ldq_idx;
		uops_0_bits_uop_stq_idx <= io_req_bits_uop_stq_idx;
		uops_0_bits_uop_rxq_idx <= io_req_bits_uop_rxq_idx;
		uops_0_bits_uop_pdst <= io_req_bits_uop_pdst;
		uops_0_bits_uop_prs1 <= io_req_bits_uop_prs1;
		uops_0_bits_uop_prs2 <= io_req_bits_uop_prs2;
		uops_0_bits_uop_prs3 <= io_req_bits_uop_prs3;
		uops_0_bits_uop_ppred <= io_req_bits_uop_ppred;
		uops_0_bits_uop_prs1_busy <= io_req_bits_uop_prs1_busy;
		uops_0_bits_uop_prs2_busy <= io_req_bits_uop_prs2_busy;
		uops_0_bits_uop_prs3_busy <= io_req_bits_uop_prs3_busy;
		uops_0_bits_uop_ppred_busy <= io_req_bits_uop_ppred_busy;
		uops_0_bits_uop_stale_pdst <= io_req_bits_uop_stale_pdst;
		uops_0_bits_uop_exception <= io_req_bits_uop_exception;
		uops_0_bits_uop_exc_cause <= io_req_bits_uop_exc_cause;
		uops_0_bits_uop_mem_cmd <= io_req_bits_uop_mem_cmd;
		uops_0_bits_uop_mem_size <= io_req_bits_uop_mem_size;
		uops_0_bits_uop_mem_signed <= io_req_bits_uop_mem_signed;
		uops_0_bits_uop_uses_ldq <= io_req_bits_uop_uses_ldq;
		uops_0_bits_uop_uses_stq <= io_req_bits_uop_uses_stq;
		uops_0_bits_uop_is_unique <= io_req_bits_uop_is_unique;
		uops_0_bits_uop_flush_on_commit <= io_req_bits_uop_flush_on_commit;
		uops_0_bits_uop_csr_cmd <= io_req_bits_uop_csr_cmd;
		uops_0_bits_uop_ldst_is_rs1 <= io_req_bits_uop_ldst_is_rs1;
		uops_0_bits_uop_ldst <= io_req_bits_uop_ldst;
		uops_0_bits_uop_lrs1 <= io_req_bits_uop_lrs1;
		uops_0_bits_uop_lrs2 <= io_req_bits_uop_lrs2;
		uops_0_bits_uop_lrs3 <= io_req_bits_uop_lrs3;
		uops_0_bits_uop_dst_rtype <= io_req_bits_uop_dst_rtype;
		uops_0_bits_uop_lrs1_rtype <= io_req_bits_uop_lrs1_rtype;
		uops_0_bits_uop_lrs2_rtype <= io_req_bits_uop_lrs2_rtype;
		uops_0_bits_uop_frs3_en <= io_req_bits_uop_frs3_en;
		uops_0_bits_uop_fcn_dw <= io_req_bits_uop_fcn_dw;
		uops_0_bits_uop_fcn_op <= io_req_bits_uop_fcn_op;
		uops_0_bits_uop_fp_val <= io_req_bits_uop_fp_val;
		uops_0_bits_uop_fp_rm <= io_req_bits_uop_fp_rm;
		uops_0_bits_uop_fp_typ <= io_req_bits_uop_fp_typ;
		uops_0_bits_uop_xcpt_pf_if <= io_req_bits_uop_xcpt_pf_if;
		uops_0_bits_uop_xcpt_ae_if <= io_req_bits_uop_xcpt_ae_if;
		uops_0_bits_uop_xcpt_ma_if <= io_req_bits_uop_xcpt_ma_if;
		uops_0_bits_uop_bp_debug_if <= io_req_bits_uop_bp_debug_if;
		uops_0_bits_uop_bp_xcpt_if <= io_req_bits_uop_bp_xcpt_if;
		uops_0_bits_uop_debug_fsrc <= io_req_bits_uop_debug_fsrc;
		uops_0_bits_uop_debug_tsrc <= io_req_bits_uop_debug_tsrc;
		uops_1_bits_uop_inst <= uops_0_bits_uop_inst;
		uops_1_bits_uop_debug_inst <= uops_0_bits_uop_debug_inst;
		uops_1_bits_uop_is_rvc <= uops_0_bits_uop_is_rvc;
		uops_1_bits_uop_debug_pc <= uops_0_bits_uop_debug_pc;
		uops_1_bits_uop_iq_type_0 <= uops_0_bits_uop_iq_type_0;
		uops_1_bits_uop_iq_type_1 <= uops_0_bits_uop_iq_type_1;
		uops_1_bits_uop_iq_type_2 <= uops_0_bits_uop_iq_type_2;
		uops_1_bits_uop_iq_type_3 <= uops_0_bits_uop_iq_type_3;
		uops_1_bits_uop_fu_code_0 <= uops_0_bits_uop_fu_code_0;
		uops_1_bits_uop_fu_code_1 <= uops_0_bits_uop_fu_code_1;
		uops_1_bits_uop_fu_code_2 <= uops_0_bits_uop_fu_code_2;
		uops_1_bits_uop_fu_code_3 <= uops_0_bits_uop_fu_code_3;
		uops_1_bits_uop_fu_code_4 <= uops_0_bits_uop_fu_code_4;
		uops_1_bits_uop_fu_code_5 <= uops_0_bits_uop_fu_code_5;
		uops_1_bits_uop_fu_code_6 <= uops_0_bits_uop_fu_code_6;
		uops_1_bits_uop_fu_code_7 <= uops_0_bits_uop_fu_code_7;
		uops_1_bits_uop_fu_code_8 <= uops_0_bits_uop_fu_code_8;
		uops_1_bits_uop_fu_code_9 <= uops_0_bits_uop_fu_code_9;
		uops_1_bits_uop_iw_issued <= uops_0_bits_uop_iw_issued;
		uops_1_bits_uop_iw_issued_partial_agen <= uops_0_bits_uop_iw_issued_partial_agen;
		uops_1_bits_uop_iw_issued_partial_dgen <= uops_0_bits_uop_iw_issued_partial_dgen;
		uops_1_bits_uop_iw_p1_speculative_child <= uops_0_bits_uop_iw_p1_speculative_child;
		uops_1_bits_uop_iw_p2_speculative_child <= uops_0_bits_uop_iw_p2_speculative_child;
		uops_1_bits_uop_iw_p1_bypass_hint <= uops_0_bits_uop_iw_p1_bypass_hint;
		uops_1_bits_uop_iw_p2_bypass_hint <= uops_0_bits_uop_iw_p2_bypass_hint;
		uops_1_bits_uop_iw_p3_bypass_hint <= uops_0_bits_uop_iw_p3_bypass_hint;
		uops_1_bits_uop_dis_col_sel <= uops_0_bits_uop_dis_col_sel;
		uops_1_bits_uop_br_mask <= uops_0_bits_uop_br_mask & ~io_brupdate_b1_resolve_mask;
		uops_1_bits_uop_br_tag <= uops_0_bits_uop_br_tag;
		uops_1_bits_uop_br_type <= uops_0_bits_uop_br_type;
		uops_1_bits_uop_is_sfb <= uops_0_bits_uop_is_sfb;
		uops_1_bits_uop_is_fence <= uops_0_bits_uop_is_fence;
		uops_1_bits_uop_is_fencei <= uops_0_bits_uop_is_fencei;
		uops_1_bits_uop_is_sfence <= uops_0_bits_uop_is_sfence;
		uops_1_bits_uop_is_amo <= uops_0_bits_uop_is_amo;
		uops_1_bits_uop_is_eret <= uops_0_bits_uop_is_eret;
		uops_1_bits_uop_is_sys_pc2epc <= uops_0_bits_uop_is_sys_pc2epc;
		uops_1_bits_uop_is_rocc <= uops_0_bits_uop_is_rocc;
		uops_1_bits_uop_is_mov <= uops_0_bits_uop_is_mov;
		uops_1_bits_uop_ftq_idx <= uops_0_bits_uop_ftq_idx;
		uops_1_bits_uop_edge_inst <= uops_0_bits_uop_edge_inst;
		uops_1_bits_uop_pc_lob <= uops_0_bits_uop_pc_lob;
		uops_1_bits_uop_taken <= uops_0_bits_uop_taken;
		uops_1_bits_uop_imm_rename <= uops_0_bits_uop_imm_rename;
		uops_1_bits_uop_imm_sel <= uops_0_bits_uop_imm_sel;
		uops_1_bits_uop_pimm <= uops_0_bits_uop_pimm;
		uops_1_bits_uop_imm_packed <= uops_0_bits_uop_imm_packed;
		uops_1_bits_uop_op1_sel <= uops_0_bits_uop_op1_sel;
		uops_1_bits_uop_op2_sel <= uops_0_bits_uop_op2_sel;
		uops_1_bits_uop_fp_ctrl_ldst <= uops_0_bits_uop_fp_ctrl_ldst;
		uops_1_bits_uop_fp_ctrl_wen <= uops_0_bits_uop_fp_ctrl_wen;
		uops_1_bits_uop_fp_ctrl_ren1 <= uops_0_bits_uop_fp_ctrl_ren1;
		uops_1_bits_uop_fp_ctrl_ren2 <= uops_0_bits_uop_fp_ctrl_ren2;
		uops_1_bits_uop_fp_ctrl_ren3 <= uops_0_bits_uop_fp_ctrl_ren3;
		uops_1_bits_uop_fp_ctrl_swap12 <= uops_0_bits_uop_fp_ctrl_swap12;
		uops_1_bits_uop_fp_ctrl_swap23 <= uops_0_bits_uop_fp_ctrl_swap23;
		uops_1_bits_uop_fp_ctrl_typeTagIn <= uops_0_bits_uop_fp_ctrl_typeTagIn;
		uops_1_bits_uop_fp_ctrl_typeTagOut <= uops_0_bits_uop_fp_ctrl_typeTagOut;
		uops_1_bits_uop_fp_ctrl_fromint <= uops_0_bits_uop_fp_ctrl_fromint;
		uops_1_bits_uop_fp_ctrl_toint <= uops_0_bits_uop_fp_ctrl_toint;
		uops_1_bits_uop_fp_ctrl_fastpipe <= uops_0_bits_uop_fp_ctrl_fastpipe;
		uops_1_bits_uop_fp_ctrl_fma <= uops_0_bits_uop_fp_ctrl_fma;
		uops_1_bits_uop_fp_ctrl_div <= uops_0_bits_uop_fp_ctrl_div;
		uops_1_bits_uop_fp_ctrl_sqrt <= uops_0_bits_uop_fp_ctrl_sqrt;
		uops_1_bits_uop_fp_ctrl_wflags <= uops_0_bits_uop_fp_ctrl_wflags;
		uops_1_bits_uop_fp_ctrl_vec <= uops_0_bits_uop_fp_ctrl_vec;
		uops_1_bits_uop_rob_idx <= uops_0_bits_uop_rob_idx;
		uops_1_bits_uop_ldq_idx <= uops_0_bits_uop_ldq_idx;
		uops_1_bits_uop_stq_idx <= uops_0_bits_uop_stq_idx;
		uops_1_bits_uop_rxq_idx <= uops_0_bits_uop_rxq_idx;
		uops_1_bits_uop_pdst <= uops_0_bits_uop_pdst;
		uops_1_bits_uop_prs1 <= uops_0_bits_uop_prs1;
		uops_1_bits_uop_prs2 <= uops_0_bits_uop_prs2;
		uops_1_bits_uop_prs3 <= uops_0_bits_uop_prs3;
		uops_1_bits_uop_ppred <= uops_0_bits_uop_ppred;
		uops_1_bits_uop_prs1_busy <= uops_0_bits_uop_prs1_busy;
		uops_1_bits_uop_prs2_busy <= uops_0_bits_uop_prs2_busy;
		uops_1_bits_uop_prs3_busy <= uops_0_bits_uop_prs3_busy;
		uops_1_bits_uop_ppred_busy <= uops_0_bits_uop_ppred_busy;
		uops_1_bits_uop_stale_pdst <= uops_0_bits_uop_stale_pdst;
		uops_1_bits_uop_exception <= uops_0_bits_uop_exception;
		uops_1_bits_uop_exc_cause <= uops_0_bits_uop_exc_cause;
		uops_1_bits_uop_mem_cmd <= uops_0_bits_uop_mem_cmd;
		uops_1_bits_uop_mem_size <= uops_0_bits_uop_mem_size;
		uops_1_bits_uop_mem_signed <= uops_0_bits_uop_mem_signed;
		uops_1_bits_uop_uses_ldq <= uops_0_bits_uop_uses_ldq;
		uops_1_bits_uop_uses_stq <= uops_0_bits_uop_uses_stq;
		uops_1_bits_uop_is_unique <= uops_0_bits_uop_is_unique;
		uops_1_bits_uop_flush_on_commit <= uops_0_bits_uop_flush_on_commit;
		uops_1_bits_uop_csr_cmd <= uops_0_bits_uop_csr_cmd;
		uops_1_bits_uop_ldst_is_rs1 <= uops_0_bits_uop_ldst_is_rs1;
		uops_1_bits_uop_ldst <= uops_0_bits_uop_ldst;
		uops_1_bits_uop_lrs1 <= uops_0_bits_uop_lrs1;
		uops_1_bits_uop_lrs2 <= uops_0_bits_uop_lrs2;
		uops_1_bits_uop_lrs3 <= uops_0_bits_uop_lrs3;
		uops_1_bits_uop_dst_rtype <= uops_0_bits_uop_dst_rtype;
		uops_1_bits_uop_lrs1_rtype <= uops_0_bits_uop_lrs1_rtype;
		uops_1_bits_uop_lrs2_rtype <= uops_0_bits_uop_lrs2_rtype;
		uops_1_bits_uop_frs3_en <= uops_0_bits_uop_frs3_en;
		uops_1_bits_uop_fcn_dw <= uops_0_bits_uop_fcn_dw;
		uops_1_bits_uop_fcn_op <= uops_0_bits_uop_fcn_op;
		uops_1_bits_uop_fp_val <= uops_0_bits_uop_fp_val;
		uops_1_bits_uop_fp_rm <= uops_0_bits_uop_fp_rm;
		uops_1_bits_uop_fp_typ <= uops_0_bits_uop_fp_typ;
		uops_1_bits_uop_xcpt_pf_if <= uops_0_bits_uop_xcpt_pf_if;
		uops_1_bits_uop_xcpt_ae_if <= uops_0_bits_uop_xcpt_ae_if;
		uops_1_bits_uop_xcpt_ma_if <= uops_0_bits_uop_xcpt_ma_if;
		uops_1_bits_uop_bp_debug_if <= uops_0_bits_uop_bp_debug_if;
		uops_1_bits_uop_bp_xcpt_if <= uops_0_bits_uop_bp_xcpt_if;
		uops_1_bits_uop_debug_fsrc <= uops_0_bits_uop_debug_fsrc;
		uops_1_bits_uop_debug_tsrc <= uops_0_bits_uop_debug_tsrc;
	end
	assign io_resp_1_valid = uops_1_valid;
	assign io_resp_1_bits_uop_inst = uops_1_bits_uop_inst;
	assign io_resp_1_bits_uop_debug_inst = uops_1_bits_uop_debug_inst;
	assign io_resp_1_bits_uop_is_rvc = uops_1_bits_uop_is_rvc;
	assign io_resp_1_bits_uop_debug_pc = uops_1_bits_uop_debug_pc;
	assign io_resp_1_bits_uop_iq_type_0 = uops_1_bits_uop_iq_type_0;
	assign io_resp_1_bits_uop_iq_type_1 = uops_1_bits_uop_iq_type_1;
	assign io_resp_1_bits_uop_iq_type_2 = uops_1_bits_uop_iq_type_2;
	assign io_resp_1_bits_uop_iq_type_3 = uops_1_bits_uop_iq_type_3;
	assign io_resp_1_bits_uop_fu_code_0 = uops_1_bits_uop_fu_code_0;
	assign io_resp_1_bits_uop_fu_code_1 = uops_1_bits_uop_fu_code_1;
	assign io_resp_1_bits_uop_fu_code_2 = uops_1_bits_uop_fu_code_2;
	assign io_resp_1_bits_uop_fu_code_3 = uops_1_bits_uop_fu_code_3;
	assign io_resp_1_bits_uop_fu_code_4 = uops_1_bits_uop_fu_code_4;
	assign io_resp_1_bits_uop_fu_code_5 = uops_1_bits_uop_fu_code_5;
	assign io_resp_1_bits_uop_fu_code_6 = uops_1_bits_uop_fu_code_6;
	assign io_resp_1_bits_uop_fu_code_7 = uops_1_bits_uop_fu_code_7;
	assign io_resp_1_bits_uop_fu_code_8 = uops_1_bits_uop_fu_code_8;
	assign io_resp_1_bits_uop_fu_code_9 = uops_1_bits_uop_fu_code_9;
	assign io_resp_1_bits_uop_iw_issued = uops_1_bits_uop_iw_issued;
	assign io_resp_1_bits_uop_iw_issued_partial_agen = uops_1_bits_uop_iw_issued_partial_agen;
	assign io_resp_1_bits_uop_iw_issued_partial_dgen = uops_1_bits_uop_iw_issued_partial_dgen;
	assign io_resp_1_bits_uop_iw_p1_speculative_child = uops_1_bits_uop_iw_p1_speculative_child;
	assign io_resp_1_bits_uop_iw_p2_speculative_child = uops_1_bits_uop_iw_p2_speculative_child;
	assign io_resp_1_bits_uop_iw_p1_bypass_hint = uops_1_bits_uop_iw_p1_bypass_hint;
	assign io_resp_1_bits_uop_iw_p2_bypass_hint = uops_1_bits_uop_iw_p2_bypass_hint;
	assign io_resp_1_bits_uop_iw_p3_bypass_hint = uops_1_bits_uop_iw_p3_bypass_hint;
	assign io_resp_1_bits_uop_dis_col_sel = uops_1_bits_uop_dis_col_sel;
	assign io_resp_1_bits_uop_br_mask = uops_1_bits_uop_br_mask;
	assign io_resp_1_bits_uop_br_tag = uops_1_bits_uop_br_tag;
	assign io_resp_1_bits_uop_br_type = uops_1_bits_uop_br_type;
	assign io_resp_1_bits_uop_is_sfb = uops_1_bits_uop_is_sfb;
	assign io_resp_1_bits_uop_is_fence = uops_1_bits_uop_is_fence;
	assign io_resp_1_bits_uop_is_fencei = uops_1_bits_uop_is_fencei;
	assign io_resp_1_bits_uop_is_sfence = uops_1_bits_uop_is_sfence;
	assign io_resp_1_bits_uop_is_amo = uops_1_bits_uop_is_amo;
	assign io_resp_1_bits_uop_is_eret = uops_1_bits_uop_is_eret;
	assign io_resp_1_bits_uop_is_sys_pc2epc = uops_1_bits_uop_is_sys_pc2epc;
	assign io_resp_1_bits_uop_is_rocc = uops_1_bits_uop_is_rocc;
	assign io_resp_1_bits_uop_is_mov = uops_1_bits_uop_is_mov;
	assign io_resp_1_bits_uop_ftq_idx = uops_1_bits_uop_ftq_idx;
	assign io_resp_1_bits_uop_edge_inst = uops_1_bits_uop_edge_inst;
	assign io_resp_1_bits_uop_pc_lob = uops_1_bits_uop_pc_lob;
	assign io_resp_1_bits_uop_taken = uops_1_bits_uop_taken;
	assign io_resp_1_bits_uop_imm_rename = uops_1_bits_uop_imm_rename;
	assign io_resp_1_bits_uop_imm_sel = uops_1_bits_uop_imm_sel;
	assign io_resp_1_bits_uop_pimm = uops_1_bits_uop_pimm;
	assign io_resp_1_bits_uop_imm_packed = uops_1_bits_uop_imm_packed;
	assign io_resp_1_bits_uop_op1_sel = uops_1_bits_uop_op1_sel;
	assign io_resp_1_bits_uop_op2_sel = uops_1_bits_uop_op2_sel;
	assign io_resp_1_bits_uop_fp_ctrl_ldst = uops_1_bits_uop_fp_ctrl_ldst;
	assign io_resp_1_bits_uop_fp_ctrl_wen = uops_1_bits_uop_fp_ctrl_wen;
	assign io_resp_1_bits_uop_fp_ctrl_ren1 = uops_1_bits_uop_fp_ctrl_ren1;
	assign io_resp_1_bits_uop_fp_ctrl_ren2 = uops_1_bits_uop_fp_ctrl_ren2;
	assign io_resp_1_bits_uop_fp_ctrl_ren3 = uops_1_bits_uop_fp_ctrl_ren3;
	assign io_resp_1_bits_uop_fp_ctrl_swap12 = uops_1_bits_uop_fp_ctrl_swap12;
	assign io_resp_1_bits_uop_fp_ctrl_swap23 = uops_1_bits_uop_fp_ctrl_swap23;
	assign io_resp_1_bits_uop_fp_ctrl_typeTagIn = uops_1_bits_uop_fp_ctrl_typeTagIn;
	assign io_resp_1_bits_uop_fp_ctrl_typeTagOut = uops_1_bits_uop_fp_ctrl_typeTagOut;
	assign io_resp_1_bits_uop_fp_ctrl_fromint = uops_1_bits_uop_fp_ctrl_fromint;
	assign io_resp_1_bits_uop_fp_ctrl_toint = uops_1_bits_uop_fp_ctrl_toint;
	assign io_resp_1_bits_uop_fp_ctrl_fastpipe = uops_1_bits_uop_fp_ctrl_fastpipe;
	assign io_resp_1_bits_uop_fp_ctrl_fma = uops_1_bits_uop_fp_ctrl_fma;
	assign io_resp_1_bits_uop_fp_ctrl_div = uops_1_bits_uop_fp_ctrl_div;
	assign io_resp_1_bits_uop_fp_ctrl_sqrt = uops_1_bits_uop_fp_ctrl_sqrt;
	assign io_resp_1_bits_uop_fp_ctrl_wflags = uops_1_bits_uop_fp_ctrl_wflags;
	assign io_resp_1_bits_uop_fp_ctrl_vec = uops_1_bits_uop_fp_ctrl_vec;
	assign io_resp_1_bits_uop_rob_idx = uops_1_bits_uop_rob_idx;
	assign io_resp_1_bits_uop_ldq_idx = uops_1_bits_uop_ldq_idx;
	assign io_resp_1_bits_uop_stq_idx = uops_1_bits_uop_stq_idx;
	assign io_resp_1_bits_uop_rxq_idx = uops_1_bits_uop_rxq_idx;
	assign io_resp_1_bits_uop_pdst = uops_1_bits_uop_pdst;
	assign io_resp_1_bits_uop_prs1 = uops_1_bits_uop_prs1;
	assign io_resp_1_bits_uop_prs2 = uops_1_bits_uop_prs2;
	assign io_resp_1_bits_uop_prs3 = uops_1_bits_uop_prs3;
	assign io_resp_1_bits_uop_ppred = uops_1_bits_uop_ppred;
	assign io_resp_1_bits_uop_prs1_busy = uops_1_bits_uop_prs1_busy;
	assign io_resp_1_bits_uop_prs2_busy = uops_1_bits_uop_prs2_busy;
	assign io_resp_1_bits_uop_prs3_busy = uops_1_bits_uop_prs3_busy;
	assign io_resp_1_bits_uop_ppred_busy = uops_1_bits_uop_ppred_busy;
	assign io_resp_1_bits_uop_stale_pdst = uops_1_bits_uop_stale_pdst;
	assign io_resp_1_bits_uop_exception = uops_1_bits_uop_exception;
	assign io_resp_1_bits_uop_exc_cause = uops_1_bits_uop_exc_cause;
	assign io_resp_1_bits_uop_mem_cmd = uops_1_bits_uop_mem_cmd;
	assign io_resp_1_bits_uop_mem_size = uops_1_bits_uop_mem_size;
	assign io_resp_1_bits_uop_mem_signed = uops_1_bits_uop_mem_signed;
	assign io_resp_1_bits_uop_uses_ldq = uops_1_bits_uop_uses_ldq;
	assign io_resp_1_bits_uop_uses_stq = uops_1_bits_uop_uses_stq;
	assign io_resp_1_bits_uop_is_unique = uops_1_bits_uop_is_unique;
	assign io_resp_1_bits_uop_flush_on_commit = uops_1_bits_uop_flush_on_commit;
	assign io_resp_1_bits_uop_csr_cmd = uops_1_bits_uop_csr_cmd;
	assign io_resp_1_bits_uop_ldst_is_rs1 = uops_1_bits_uop_ldst_is_rs1;
	assign io_resp_1_bits_uop_ldst = uops_1_bits_uop_ldst;
	assign io_resp_1_bits_uop_lrs1 = uops_1_bits_uop_lrs1;
	assign io_resp_1_bits_uop_lrs2 = uops_1_bits_uop_lrs2;
	assign io_resp_1_bits_uop_lrs3 = uops_1_bits_uop_lrs3;
	assign io_resp_1_bits_uop_dst_rtype = uops_1_bits_uop_dst_rtype;
	assign io_resp_1_bits_uop_lrs1_rtype = uops_1_bits_uop_lrs1_rtype;
	assign io_resp_1_bits_uop_lrs2_rtype = uops_1_bits_uop_lrs2_rtype;
	assign io_resp_1_bits_uop_frs3_en = uops_1_bits_uop_frs3_en;
	assign io_resp_1_bits_uop_fcn_dw = uops_1_bits_uop_fcn_dw;
	assign io_resp_1_bits_uop_fcn_op = uops_1_bits_uop_fcn_op;
	assign io_resp_1_bits_uop_fp_val = uops_1_bits_uop_fp_val;
	assign io_resp_1_bits_uop_fp_rm = uops_1_bits_uop_fp_rm;
	assign io_resp_1_bits_uop_fp_typ = uops_1_bits_uop_fp_typ;
	assign io_resp_1_bits_uop_xcpt_pf_if = uops_1_bits_uop_xcpt_pf_if;
	assign io_resp_1_bits_uop_xcpt_ae_if = uops_1_bits_uop_xcpt_ae_if;
	assign io_resp_1_bits_uop_xcpt_ma_if = uops_1_bits_uop_xcpt_ma_if;
	assign io_resp_1_bits_uop_bp_debug_if = uops_1_bits_uop_bp_debug_if;
	assign io_resp_1_bits_uop_bp_xcpt_if = uops_1_bits_uop_bp_xcpt_if;
	assign io_resp_1_bits_uop_debug_fsrc = uops_1_bits_uop_debug_fsrc;
	assign io_resp_1_bits_uop_debug_tsrc = uops_1_bits_uop_debug_tsrc;
endmodule
