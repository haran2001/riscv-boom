module BoomIOMSHR (
	clock,
	reset,
	io_req_ready,
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
	io_req_bits_addr,
	io_req_bits_data,
	io_req_bits_is_hella,
	io_resp_ready,
	io_resp_valid,
	io_resp_bits_uop_inst,
	io_resp_bits_uop_debug_inst,
	io_resp_bits_uop_is_rvc,
	io_resp_bits_uop_debug_pc,
	io_resp_bits_uop_iq_type_0,
	io_resp_bits_uop_iq_type_1,
	io_resp_bits_uop_iq_type_2,
	io_resp_bits_uop_iq_type_3,
	io_resp_bits_uop_fu_code_0,
	io_resp_bits_uop_fu_code_1,
	io_resp_bits_uop_fu_code_2,
	io_resp_bits_uop_fu_code_3,
	io_resp_bits_uop_fu_code_4,
	io_resp_bits_uop_fu_code_5,
	io_resp_bits_uop_fu_code_6,
	io_resp_bits_uop_fu_code_7,
	io_resp_bits_uop_fu_code_8,
	io_resp_bits_uop_fu_code_9,
	io_resp_bits_uop_iw_issued,
	io_resp_bits_uop_iw_issued_partial_agen,
	io_resp_bits_uop_iw_issued_partial_dgen,
	io_resp_bits_uop_iw_p1_speculative_child,
	io_resp_bits_uop_iw_p2_speculative_child,
	io_resp_bits_uop_iw_p1_bypass_hint,
	io_resp_bits_uop_iw_p2_bypass_hint,
	io_resp_bits_uop_iw_p3_bypass_hint,
	io_resp_bits_uop_dis_col_sel,
	io_resp_bits_uop_br_mask,
	io_resp_bits_uop_br_tag,
	io_resp_bits_uop_br_type,
	io_resp_bits_uop_is_sfb,
	io_resp_bits_uop_is_fence,
	io_resp_bits_uop_is_fencei,
	io_resp_bits_uop_is_sfence,
	io_resp_bits_uop_is_amo,
	io_resp_bits_uop_is_eret,
	io_resp_bits_uop_is_sys_pc2epc,
	io_resp_bits_uop_is_rocc,
	io_resp_bits_uop_is_mov,
	io_resp_bits_uop_ftq_idx,
	io_resp_bits_uop_edge_inst,
	io_resp_bits_uop_pc_lob,
	io_resp_bits_uop_taken,
	io_resp_bits_uop_imm_rename,
	io_resp_bits_uop_imm_sel,
	io_resp_bits_uop_pimm,
	io_resp_bits_uop_imm_packed,
	io_resp_bits_uop_op1_sel,
	io_resp_bits_uop_op2_sel,
	io_resp_bits_uop_fp_ctrl_ldst,
	io_resp_bits_uop_fp_ctrl_wen,
	io_resp_bits_uop_fp_ctrl_ren1,
	io_resp_bits_uop_fp_ctrl_ren2,
	io_resp_bits_uop_fp_ctrl_ren3,
	io_resp_bits_uop_fp_ctrl_swap12,
	io_resp_bits_uop_fp_ctrl_swap23,
	io_resp_bits_uop_fp_ctrl_typeTagIn,
	io_resp_bits_uop_fp_ctrl_typeTagOut,
	io_resp_bits_uop_fp_ctrl_fromint,
	io_resp_bits_uop_fp_ctrl_toint,
	io_resp_bits_uop_fp_ctrl_fastpipe,
	io_resp_bits_uop_fp_ctrl_fma,
	io_resp_bits_uop_fp_ctrl_div,
	io_resp_bits_uop_fp_ctrl_sqrt,
	io_resp_bits_uop_fp_ctrl_wflags,
	io_resp_bits_uop_fp_ctrl_vec,
	io_resp_bits_uop_rob_idx,
	io_resp_bits_uop_ldq_idx,
	io_resp_bits_uop_stq_idx,
	io_resp_bits_uop_rxq_idx,
	io_resp_bits_uop_pdst,
	io_resp_bits_uop_prs1,
	io_resp_bits_uop_prs2,
	io_resp_bits_uop_prs3,
	io_resp_bits_uop_ppred,
	io_resp_bits_uop_prs1_busy,
	io_resp_bits_uop_prs2_busy,
	io_resp_bits_uop_prs3_busy,
	io_resp_bits_uop_ppred_busy,
	io_resp_bits_uop_stale_pdst,
	io_resp_bits_uop_exception,
	io_resp_bits_uop_exc_cause,
	io_resp_bits_uop_mem_cmd,
	io_resp_bits_uop_mem_size,
	io_resp_bits_uop_mem_signed,
	io_resp_bits_uop_uses_ldq,
	io_resp_bits_uop_uses_stq,
	io_resp_bits_uop_is_unique,
	io_resp_bits_uop_flush_on_commit,
	io_resp_bits_uop_csr_cmd,
	io_resp_bits_uop_ldst_is_rs1,
	io_resp_bits_uop_ldst,
	io_resp_bits_uop_lrs1,
	io_resp_bits_uop_lrs2,
	io_resp_bits_uop_lrs3,
	io_resp_bits_uop_dst_rtype,
	io_resp_bits_uop_lrs1_rtype,
	io_resp_bits_uop_lrs2_rtype,
	io_resp_bits_uop_frs3_en,
	io_resp_bits_uop_fcn_dw,
	io_resp_bits_uop_fcn_op,
	io_resp_bits_uop_fp_val,
	io_resp_bits_uop_fp_rm,
	io_resp_bits_uop_fp_typ,
	io_resp_bits_uop_xcpt_pf_if,
	io_resp_bits_uop_xcpt_ae_if,
	io_resp_bits_uop_xcpt_ma_if,
	io_resp_bits_uop_bp_debug_if,
	io_resp_bits_uop_bp_xcpt_if,
	io_resp_bits_uop_debug_fsrc,
	io_resp_bits_uop_debug_tsrc,
	io_resp_bits_data,
	io_resp_bits_is_hella,
	io_mem_access_ready,
	io_mem_access_valid,
	io_mem_access_bits_opcode,
	io_mem_access_bits_param,
	io_mem_access_bits_size,
	io_mem_access_bits_source,
	io_mem_access_bits_address,
	io_mem_access_bits_mask,
	io_mem_access_bits_data,
	io_mem_ack_valid,
	io_mem_ack_bits_data
);
	input clock;
	input reset;
	output wire io_req_ready;
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
	input [39:0] io_req_bits_addr;
	input [63:0] io_req_bits_data;
	input io_req_bits_is_hella;
	input io_resp_ready;
	output wire io_resp_valid;
	output wire [31:0] io_resp_bits_uop_inst;
	output wire [31:0] io_resp_bits_uop_debug_inst;
	output wire io_resp_bits_uop_is_rvc;
	output wire [39:0] io_resp_bits_uop_debug_pc;
	output wire io_resp_bits_uop_iq_type_0;
	output wire io_resp_bits_uop_iq_type_1;
	output wire io_resp_bits_uop_iq_type_2;
	output wire io_resp_bits_uop_iq_type_3;
	output wire io_resp_bits_uop_fu_code_0;
	output wire io_resp_bits_uop_fu_code_1;
	output wire io_resp_bits_uop_fu_code_2;
	output wire io_resp_bits_uop_fu_code_3;
	output wire io_resp_bits_uop_fu_code_4;
	output wire io_resp_bits_uop_fu_code_5;
	output wire io_resp_bits_uop_fu_code_6;
	output wire io_resp_bits_uop_fu_code_7;
	output wire io_resp_bits_uop_fu_code_8;
	output wire io_resp_bits_uop_fu_code_9;
	output wire io_resp_bits_uop_iw_issued;
	output wire io_resp_bits_uop_iw_issued_partial_agen;
	output wire io_resp_bits_uop_iw_issued_partial_dgen;
	output wire io_resp_bits_uop_iw_p1_speculative_child;
	output wire io_resp_bits_uop_iw_p2_speculative_child;
	output wire io_resp_bits_uop_iw_p1_bypass_hint;
	output wire io_resp_bits_uop_iw_p2_bypass_hint;
	output wire io_resp_bits_uop_iw_p3_bypass_hint;
	output wire io_resp_bits_uop_dis_col_sel;
	output wire [7:0] io_resp_bits_uop_br_mask;
	output wire [2:0] io_resp_bits_uop_br_tag;
	output wire [3:0] io_resp_bits_uop_br_type;
	output wire io_resp_bits_uop_is_sfb;
	output wire io_resp_bits_uop_is_fence;
	output wire io_resp_bits_uop_is_fencei;
	output wire io_resp_bits_uop_is_sfence;
	output wire io_resp_bits_uop_is_amo;
	output wire io_resp_bits_uop_is_eret;
	output wire io_resp_bits_uop_is_sys_pc2epc;
	output wire io_resp_bits_uop_is_rocc;
	output wire io_resp_bits_uop_is_mov;
	output wire [3:0] io_resp_bits_uop_ftq_idx;
	output wire io_resp_bits_uop_edge_inst;
	output wire [5:0] io_resp_bits_uop_pc_lob;
	output wire io_resp_bits_uop_taken;
	output wire io_resp_bits_uop_imm_rename;
	output wire [2:0] io_resp_bits_uop_imm_sel;
	output wire [4:0] io_resp_bits_uop_pimm;
	output wire [19:0] io_resp_bits_uop_imm_packed;
	output wire [1:0] io_resp_bits_uop_op1_sel;
	output wire [2:0] io_resp_bits_uop_op2_sel;
	output wire io_resp_bits_uop_fp_ctrl_ldst;
	output wire io_resp_bits_uop_fp_ctrl_wen;
	output wire io_resp_bits_uop_fp_ctrl_ren1;
	output wire io_resp_bits_uop_fp_ctrl_ren2;
	output wire io_resp_bits_uop_fp_ctrl_ren3;
	output wire io_resp_bits_uop_fp_ctrl_swap12;
	output wire io_resp_bits_uop_fp_ctrl_swap23;
	output wire [1:0] io_resp_bits_uop_fp_ctrl_typeTagIn;
	output wire [1:0] io_resp_bits_uop_fp_ctrl_typeTagOut;
	output wire io_resp_bits_uop_fp_ctrl_fromint;
	output wire io_resp_bits_uop_fp_ctrl_toint;
	output wire io_resp_bits_uop_fp_ctrl_fastpipe;
	output wire io_resp_bits_uop_fp_ctrl_fma;
	output wire io_resp_bits_uop_fp_ctrl_div;
	output wire io_resp_bits_uop_fp_ctrl_sqrt;
	output wire io_resp_bits_uop_fp_ctrl_wflags;
	output wire io_resp_bits_uop_fp_ctrl_vec;
	output wire [4:0] io_resp_bits_uop_rob_idx;
	output wire [3:0] io_resp_bits_uop_ldq_idx;
	output wire [3:0] io_resp_bits_uop_stq_idx;
	output wire [1:0] io_resp_bits_uop_rxq_idx;
	output wire [5:0] io_resp_bits_uop_pdst;
	output wire [5:0] io_resp_bits_uop_prs1;
	output wire [5:0] io_resp_bits_uop_prs2;
	output wire [5:0] io_resp_bits_uop_prs3;
	output wire [3:0] io_resp_bits_uop_ppred;
	output wire io_resp_bits_uop_prs1_busy;
	output wire io_resp_bits_uop_prs2_busy;
	output wire io_resp_bits_uop_prs3_busy;
	output wire io_resp_bits_uop_ppred_busy;
	output wire [5:0] io_resp_bits_uop_stale_pdst;
	output wire io_resp_bits_uop_exception;
	output wire [63:0] io_resp_bits_uop_exc_cause;
	output wire [4:0] io_resp_bits_uop_mem_cmd;
	output wire [1:0] io_resp_bits_uop_mem_size;
	output wire io_resp_bits_uop_mem_signed;
	output wire io_resp_bits_uop_uses_ldq;
	output wire io_resp_bits_uop_uses_stq;
	output wire io_resp_bits_uop_is_unique;
	output wire io_resp_bits_uop_flush_on_commit;
	output wire [2:0] io_resp_bits_uop_csr_cmd;
	output wire io_resp_bits_uop_ldst_is_rs1;
	output wire [5:0] io_resp_bits_uop_ldst;
	output wire [5:0] io_resp_bits_uop_lrs1;
	output wire [5:0] io_resp_bits_uop_lrs2;
	output wire [5:0] io_resp_bits_uop_lrs3;
	output wire [1:0] io_resp_bits_uop_dst_rtype;
	output wire [1:0] io_resp_bits_uop_lrs1_rtype;
	output wire [1:0] io_resp_bits_uop_lrs2_rtype;
	output wire io_resp_bits_uop_frs3_en;
	output wire io_resp_bits_uop_fcn_dw;
	output wire [4:0] io_resp_bits_uop_fcn_op;
	output wire io_resp_bits_uop_fp_val;
	output wire [2:0] io_resp_bits_uop_fp_rm;
	output wire [1:0] io_resp_bits_uop_fp_typ;
	output wire io_resp_bits_uop_xcpt_pf_if;
	output wire io_resp_bits_uop_xcpt_ae_if;
	output wire io_resp_bits_uop_xcpt_ma_if;
	output wire io_resp_bits_uop_bp_debug_if;
	output wire io_resp_bits_uop_bp_xcpt_if;
	output wire [2:0] io_resp_bits_uop_debug_fsrc;
	output wire [2:0] io_resp_bits_uop_debug_tsrc;
	output wire [63:0] io_resp_bits_data;
	output wire io_resp_bits_is_hella;
	input io_mem_access_ready;
	output wire io_mem_access_valid;
	output wire [2:0] io_mem_access_bits_opcode;
	output wire [2:0] io_mem_access_bits_param;
	output wire [3:0] io_mem_access_bits_size;
	output wire [1:0] io_mem_access_bits_source;
	output wire [31:0] io_mem_access_bits_address;
	output wire [7:0] io_mem_access_bits_mask;
	output wire [63:0] io_mem_access_bits_data;
	input io_mem_ack_valid;
	input [63:0] io_mem_ack_bits_data;
	reg [31:0] req_uop_inst;
	reg [31:0] req_uop_debug_inst;
	reg req_uop_is_rvc;
	reg [39:0] req_uop_debug_pc;
	reg req_uop_iq_type_0;
	reg req_uop_iq_type_1;
	reg req_uop_iq_type_2;
	reg req_uop_iq_type_3;
	reg req_uop_fu_code_0;
	reg req_uop_fu_code_1;
	reg req_uop_fu_code_2;
	reg req_uop_fu_code_3;
	reg req_uop_fu_code_4;
	reg req_uop_fu_code_5;
	reg req_uop_fu_code_6;
	reg req_uop_fu_code_7;
	reg req_uop_fu_code_8;
	reg req_uop_fu_code_9;
	reg req_uop_iw_issued;
	reg req_uop_iw_issued_partial_agen;
	reg req_uop_iw_issued_partial_dgen;
	reg req_uop_iw_p1_speculative_child;
	reg req_uop_iw_p2_speculative_child;
	reg req_uop_iw_p1_bypass_hint;
	reg req_uop_iw_p2_bypass_hint;
	reg req_uop_iw_p3_bypass_hint;
	reg req_uop_dis_col_sel;
	reg [7:0] req_uop_br_mask;
	reg [2:0] req_uop_br_tag;
	reg [3:0] req_uop_br_type;
	reg req_uop_is_sfb;
	reg req_uop_is_fence;
	reg req_uop_is_fencei;
	reg req_uop_is_sfence;
	reg req_uop_is_amo;
	reg req_uop_is_eret;
	reg req_uop_is_sys_pc2epc;
	reg req_uop_is_rocc;
	reg req_uop_is_mov;
	reg [3:0] req_uop_ftq_idx;
	reg req_uop_edge_inst;
	reg [5:0] req_uop_pc_lob;
	reg req_uop_taken;
	reg req_uop_imm_rename;
	reg [2:0] req_uop_imm_sel;
	reg [4:0] req_uop_pimm;
	reg [19:0] req_uop_imm_packed;
	reg [1:0] req_uop_op1_sel;
	reg [2:0] req_uop_op2_sel;
	reg req_uop_fp_ctrl_ldst;
	reg req_uop_fp_ctrl_wen;
	reg req_uop_fp_ctrl_ren1;
	reg req_uop_fp_ctrl_ren2;
	reg req_uop_fp_ctrl_ren3;
	reg req_uop_fp_ctrl_swap12;
	reg req_uop_fp_ctrl_swap23;
	reg [1:0] req_uop_fp_ctrl_typeTagIn;
	reg [1:0] req_uop_fp_ctrl_typeTagOut;
	reg req_uop_fp_ctrl_fromint;
	reg req_uop_fp_ctrl_toint;
	reg req_uop_fp_ctrl_fastpipe;
	reg req_uop_fp_ctrl_fma;
	reg req_uop_fp_ctrl_div;
	reg req_uop_fp_ctrl_sqrt;
	reg req_uop_fp_ctrl_wflags;
	reg req_uop_fp_ctrl_vec;
	reg [4:0] req_uop_rob_idx;
	reg [3:0] req_uop_ldq_idx;
	reg [3:0] req_uop_stq_idx;
	reg [1:0] req_uop_rxq_idx;
	reg [5:0] req_uop_pdst;
	reg [5:0] req_uop_prs1;
	reg [5:0] req_uop_prs2;
	reg [5:0] req_uop_prs3;
	reg [3:0] req_uop_ppred;
	reg req_uop_prs1_busy;
	reg req_uop_prs2_busy;
	reg req_uop_prs3_busy;
	reg req_uop_ppred_busy;
	reg [5:0] req_uop_stale_pdst;
	reg req_uop_exception;
	reg [63:0] req_uop_exc_cause;
	reg [4:0] req_uop_mem_cmd;
	reg [1:0] req_uop_mem_size;
	reg req_uop_mem_signed;
	reg req_uop_uses_ldq;
	reg req_uop_uses_stq;
	reg req_uop_is_unique;
	reg req_uop_flush_on_commit;
	reg [2:0] req_uop_csr_cmd;
	reg req_uop_ldst_is_rs1;
	reg [5:0] req_uop_ldst;
	reg [5:0] req_uop_lrs1;
	reg [5:0] req_uop_lrs2;
	reg [5:0] req_uop_lrs3;
	reg [1:0] req_uop_dst_rtype;
	reg [1:0] req_uop_lrs1_rtype;
	reg [1:0] req_uop_lrs2_rtype;
	reg req_uop_frs3_en;
	reg req_uop_fcn_dw;
	reg [4:0] req_uop_fcn_op;
	reg req_uop_fp_val;
	reg [2:0] req_uop_fp_rm;
	reg [1:0] req_uop_fp_typ;
	reg req_uop_xcpt_pf_if;
	reg req_uop_xcpt_ae_if;
	reg req_uop_xcpt_ma_if;
	reg req_uop_bp_debug_if;
	reg req_uop_bp_xcpt_if;
	reg [2:0] req_uop_debug_fsrc;
	reg [2:0] req_uop_debug_tsrc;
	reg [39:0] req_addr;
	reg [63:0] req_data;
	reg req_is_hella;
	reg [63:0] grant_word;
	reg [1:0] state;
	wire io_req_ready_0 = state == 2'h0;
	wire get_a_mask_sub_sub_size = req_uop_mem_size == 2'h2;
	wire get_a_mask_sub_sub_0_1 = &req_uop_mem_size | (get_a_mask_sub_sub_size & ~req_addr[2]);
	wire get_a_mask_sub_sub_1_1 = &req_uop_mem_size | (get_a_mask_sub_sub_size & req_addr[2]);
	wire get_a_mask_sub_size = req_uop_mem_size == 2'h1;
	wire get_a_mask_sub_0_2 = ~req_addr[2] & ~req_addr[1];
	wire get_a_mask_sub_0_1 = get_a_mask_sub_sub_0_1 | (get_a_mask_sub_size & get_a_mask_sub_0_2);
	wire get_a_mask_sub_1_2 = ~req_addr[2] & req_addr[1];
	wire get_a_mask_sub_1_1 = get_a_mask_sub_sub_0_1 | (get_a_mask_sub_size & get_a_mask_sub_1_2);
	wire get_a_mask_sub_2_2 = req_addr[2] & ~req_addr[1];
	wire get_a_mask_sub_2_1 = get_a_mask_sub_sub_1_1 | (get_a_mask_sub_size & get_a_mask_sub_2_2);
	wire get_a_mask_sub_3_2 = req_addr[2] & req_addr[1];
	wire get_a_mask_sub_3_1 = get_a_mask_sub_sub_1_1 | (get_a_mask_sub_size & get_a_mask_sub_3_2);
	wire put_a_mask_sub_sub_size = req_uop_mem_size == 2'h2;
	wire put_a_mask_sub_sub_0_1 = &req_uop_mem_size | (put_a_mask_sub_sub_size & ~req_addr[2]);
	wire put_a_mask_sub_sub_1_1 = &req_uop_mem_size | (put_a_mask_sub_sub_size & req_addr[2]);
	wire put_a_mask_sub_size = req_uop_mem_size == 2'h1;
	wire put_a_mask_sub_0_2 = ~req_addr[2] & ~req_addr[1];
	wire put_a_mask_sub_0_1 = put_a_mask_sub_sub_0_1 | (put_a_mask_sub_size & put_a_mask_sub_0_2);
	wire put_a_mask_sub_1_2 = ~req_addr[2] & req_addr[1];
	wire put_a_mask_sub_1_1 = put_a_mask_sub_sub_0_1 | (put_a_mask_sub_size & put_a_mask_sub_1_2);
	wire put_a_mask_sub_2_2 = req_addr[2] & ~req_addr[1];
	wire put_a_mask_sub_2_1 = put_a_mask_sub_sub_1_1 | (put_a_mask_sub_size & put_a_mask_sub_2_2);
	wire put_a_mask_sub_3_2 = req_addr[2] & req_addr[1];
	wire put_a_mask_sub_3_1 = put_a_mask_sub_sub_1_1 | (put_a_mask_sub_size & put_a_mask_sub_3_2);
	wire atomics_a_mask_sub_sub_size = req_uop_mem_size == 2'h2;
	wire atomics_a_mask_sub_sub_0_1 = &req_uop_mem_size | (atomics_a_mask_sub_sub_size & ~req_addr[2]);
	wire atomics_a_mask_sub_sub_1_1 = &req_uop_mem_size | (atomics_a_mask_sub_sub_size & req_addr[2]);
	wire atomics_a_mask_sub_size = req_uop_mem_size == 2'h1;
	wire atomics_a_mask_sub_0_2 = ~req_addr[2] & ~req_addr[1];
	wire atomics_a_mask_sub_0_1 = atomics_a_mask_sub_sub_0_1 | (atomics_a_mask_sub_size & atomics_a_mask_sub_0_2);
	wire atomics_a_mask_sub_1_2 = ~req_addr[2] & req_addr[1];
	wire atomics_a_mask_sub_1_1 = atomics_a_mask_sub_sub_0_1 | (atomics_a_mask_sub_size & atomics_a_mask_sub_1_2);
	wire atomics_a_mask_sub_2_2 = req_addr[2] & ~req_addr[1];
	wire atomics_a_mask_sub_2_1 = atomics_a_mask_sub_sub_1_1 | (atomics_a_mask_sub_size & atomics_a_mask_sub_2_2);
	wire atomics_a_mask_sub_3_2 = req_addr[2] & req_addr[1];
	wire atomics_a_mask_sub_3_1 = atomics_a_mask_sub_sub_1_1 | (atomics_a_mask_sub_size & atomics_a_mask_sub_3_2);
	wire atomics_a_mask_sub_sub_size_1 = req_uop_mem_size == 2'h2;
	wire atomics_a_mask_sub_sub_0_1_1 = &req_uop_mem_size | (atomics_a_mask_sub_sub_size_1 & ~req_addr[2]);
	wire atomics_a_mask_sub_sub_1_1_1 = &req_uop_mem_size | (atomics_a_mask_sub_sub_size_1 & req_addr[2]);
	wire atomics_a_mask_sub_size_1 = req_uop_mem_size == 2'h1;
	wire atomics_a_mask_sub_0_2_1 = ~req_addr[2] & ~req_addr[1];
	wire atomics_a_mask_sub_0_1_1 = atomics_a_mask_sub_sub_0_1_1 | (atomics_a_mask_sub_size_1 & atomics_a_mask_sub_0_2_1);
	wire atomics_a_mask_sub_1_2_1 = ~req_addr[2] & req_addr[1];
	wire atomics_a_mask_sub_1_1_1 = atomics_a_mask_sub_sub_0_1_1 | (atomics_a_mask_sub_size_1 & atomics_a_mask_sub_1_2_1);
	wire atomics_a_mask_sub_2_2_1 = req_addr[2] & ~req_addr[1];
	wire atomics_a_mask_sub_2_1_1 = atomics_a_mask_sub_sub_1_1_1 | (atomics_a_mask_sub_size_1 & atomics_a_mask_sub_2_2_1);
	wire atomics_a_mask_sub_3_2_1 = req_addr[2] & req_addr[1];
	wire atomics_a_mask_sub_3_1_1 = atomics_a_mask_sub_sub_1_1_1 | (atomics_a_mask_sub_size_1 & atomics_a_mask_sub_3_2_1);
	wire atomics_a_mask_sub_sub_size_2 = req_uop_mem_size == 2'h2;
	wire atomics_a_mask_sub_sub_0_1_2 = &req_uop_mem_size | (atomics_a_mask_sub_sub_size_2 & ~req_addr[2]);
	wire atomics_a_mask_sub_sub_1_1_2 = &req_uop_mem_size | (atomics_a_mask_sub_sub_size_2 & req_addr[2]);
	wire atomics_a_mask_sub_size_2 = req_uop_mem_size == 2'h1;
	wire atomics_a_mask_sub_0_2_2 = ~req_addr[2] & ~req_addr[1];
	wire atomics_a_mask_sub_0_1_2 = atomics_a_mask_sub_sub_0_1_2 | (atomics_a_mask_sub_size_2 & atomics_a_mask_sub_0_2_2);
	wire atomics_a_mask_sub_1_2_2 = ~req_addr[2] & req_addr[1];
	wire atomics_a_mask_sub_1_1_2 = atomics_a_mask_sub_sub_0_1_2 | (atomics_a_mask_sub_size_2 & atomics_a_mask_sub_1_2_2);
	wire atomics_a_mask_sub_2_2_2 = req_addr[2] & ~req_addr[1];
	wire atomics_a_mask_sub_2_1_2 = atomics_a_mask_sub_sub_1_1_2 | (atomics_a_mask_sub_size_2 & atomics_a_mask_sub_2_2_2);
	wire atomics_a_mask_sub_3_2_2 = req_addr[2] & req_addr[1];
	wire atomics_a_mask_sub_3_1_2 = atomics_a_mask_sub_sub_1_1_2 | (atomics_a_mask_sub_size_2 & atomics_a_mask_sub_3_2_2);
	wire atomics_a_mask_sub_sub_size_3 = req_uop_mem_size == 2'h2;
	wire atomics_a_mask_sub_sub_0_1_3 = &req_uop_mem_size | (atomics_a_mask_sub_sub_size_3 & ~req_addr[2]);
	wire atomics_a_mask_sub_sub_1_1_3 = &req_uop_mem_size | (atomics_a_mask_sub_sub_size_3 & req_addr[2]);
	wire atomics_a_mask_sub_size_3 = req_uop_mem_size == 2'h1;
	wire atomics_a_mask_sub_0_2_3 = ~req_addr[2] & ~req_addr[1];
	wire atomics_a_mask_sub_0_1_3 = atomics_a_mask_sub_sub_0_1_3 | (atomics_a_mask_sub_size_3 & atomics_a_mask_sub_0_2_3);
	wire atomics_a_mask_sub_1_2_3 = ~req_addr[2] & req_addr[1];
	wire atomics_a_mask_sub_1_1_3 = atomics_a_mask_sub_sub_0_1_3 | (atomics_a_mask_sub_size_3 & atomics_a_mask_sub_1_2_3);
	wire atomics_a_mask_sub_2_2_3 = req_addr[2] & ~req_addr[1];
	wire atomics_a_mask_sub_2_1_3 = atomics_a_mask_sub_sub_1_1_3 | (atomics_a_mask_sub_size_3 & atomics_a_mask_sub_2_2_3);
	wire atomics_a_mask_sub_3_2_3 = req_addr[2] & req_addr[1];
	wire atomics_a_mask_sub_3_1_3 = atomics_a_mask_sub_sub_1_1_3 | (atomics_a_mask_sub_size_3 & atomics_a_mask_sub_3_2_3);
	wire atomics_a_mask_sub_sub_size_4 = req_uop_mem_size == 2'h2;
	wire atomics_a_mask_sub_sub_0_1_4 = &req_uop_mem_size | (atomics_a_mask_sub_sub_size_4 & ~req_addr[2]);
	wire atomics_a_mask_sub_sub_1_1_4 = &req_uop_mem_size | (atomics_a_mask_sub_sub_size_4 & req_addr[2]);
	wire atomics_a_mask_sub_size_4 = req_uop_mem_size == 2'h1;
	wire atomics_a_mask_sub_0_2_4 = ~req_addr[2] & ~req_addr[1];
	wire atomics_a_mask_sub_0_1_4 = atomics_a_mask_sub_sub_0_1_4 | (atomics_a_mask_sub_size_4 & atomics_a_mask_sub_0_2_4);
	wire atomics_a_mask_sub_1_2_4 = ~req_addr[2] & req_addr[1];
	wire atomics_a_mask_sub_1_1_4 = atomics_a_mask_sub_sub_0_1_4 | (atomics_a_mask_sub_size_4 & atomics_a_mask_sub_1_2_4);
	wire atomics_a_mask_sub_2_2_4 = req_addr[2] & ~req_addr[1];
	wire atomics_a_mask_sub_2_1_4 = atomics_a_mask_sub_sub_1_1_4 | (atomics_a_mask_sub_size_4 & atomics_a_mask_sub_2_2_4);
	wire atomics_a_mask_sub_3_2_4 = req_addr[2] & req_addr[1];
	wire atomics_a_mask_sub_3_1_4 = atomics_a_mask_sub_sub_1_1_4 | (atomics_a_mask_sub_size_4 & atomics_a_mask_sub_3_2_4);
	wire atomics_a_mask_sub_sub_size_5 = req_uop_mem_size == 2'h2;
	wire atomics_a_mask_sub_sub_0_1_5 = &req_uop_mem_size | (atomics_a_mask_sub_sub_size_5 & ~req_addr[2]);
	wire atomics_a_mask_sub_sub_1_1_5 = &req_uop_mem_size | (atomics_a_mask_sub_sub_size_5 & req_addr[2]);
	wire atomics_a_mask_sub_size_5 = req_uop_mem_size == 2'h1;
	wire atomics_a_mask_sub_0_2_5 = ~req_addr[2] & ~req_addr[1];
	wire atomics_a_mask_sub_0_1_5 = atomics_a_mask_sub_sub_0_1_5 | (atomics_a_mask_sub_size_5 & atomics_a_mask_sub_0_2_5);
	wire atomics_a_mask_sub_1_2_5 = ~req_addr[2] & req_addr[1];
	wire atomics_a_mask_sub_1_1_5 = atomics_a_mask_sub_sub_0_1_5 | (atomics_a_mask_sub_size_5 & atomics_a_mask_sub_1_2_5);
	wire atomics_a_mask_sub_2_2_5 = req_addr[2] & ~req_addr[1];
	wire atomics_a_mask_sub_2_1_5 = atomics_a_mask_sub_sub_1_1_5 | (atomics_a_mask_sub_size_5 & atomics_a_mask_sub_2_2_5);
	wire atomics_a_mask_sub_3_2_5 = req_addr[2] & req_addr[1];
	wire atomics_a_mask_sub_3_1_5 = atomics_a_mask_sub_sub_1_1_5 | (atomics_a_mask_sub_size_5 & atomics_a_mask_sub_3_2_5);
	wire atomics_a_mask_sub_sub_size_6 = req_uop_mem_size == 2'h2;
	wire atomics_a_mask_sub_sub_0_1_6 = &req_uop_mem_size | (atomics_a_mask_sub_sub_size_6 & ~req_addr[2]);
	wire atomics_a_mask_sub_sub_1_1_6 = &req_uop_mem_size | (atomics_a_mask_sub_sub_size_6 & req_addr[2]);
	wire atomics_a_mask_sub_size_6 = req_uop_mem_size == 2'h1;
	wire atomics_a_mask_sub_0_2_6 = ~req_addr[2] & ~req_addr[1];
	wire atomics_a_mask_sub_0_1_6 = atomics_a_mask_sub_sub_0_1_6 | (atomics_a_mask_sub_size_6 & atomics_a_mask_sub_0_2_6);
	wire atomics_a_mask_sub_1_2_6 = ~req_addr[2] & req_addr[1];
	wire atomics_a_mask_sub_1_1_6 = atomics_a_mask_sub_sub_0_1_6 | (atomics_a_mask_sub_size_6 & atomics_a_mask_sub_1_2_6);
	wire atomics_a_mask_sub_2_2_6 = req_addr[2] & ~req_addr[1];
	wire atomics_a_mask_sub_2_1_6 = atomics_a_mask_sub_sub_1_1_6 | (atomics_a_mask_sub_size_6 & atomics_a_mask_sub_2_2_6);
	wire atomics_a_mask_sub_3_2_6 = req_addr[2] & req_addr[1];
	wire atomics_a_mask_sub_3_1_6 = atomics_a_mask_sub_sub_1_1_6 | (atomics_a_mask_sub_size_6 & atomics_a_mask_sub_3_2_6);
	wire atomics_a_mask_sub_sub_size_7 = req_uop_mem_size == 2'h2;
	wire atomics_a_mask_sub_sub_0_1_7 = &req_uop_mem_size | (atomics_a_mask_sub_sub_size_7 & ~req_addr[2]);
	wire atomics_a_mask_sub_sub_1_1_7 = &req_uop_mem_size | (atomics_a_mask_sub_sub_size_7 & req_addr[2]);
	wire atomics_a_mask_sub_size_7 = req_uop_mem_size == 2'h1;
	wire atomics_a_mask_sub_0_2_7 = ~req_addr[2] & ~req_addr[1];
	wire atomics_a_mask_sub_0_1_7 = atomics_a_mask_sub_sub_0_1_7 | (atomics_a_mask_sub_size_7 & atomics_a_mask_sub_0_2_7);
	wire atomics_a_mask_sub_1_2_7 = ~req_addr[2] & req_addr[1];
	wire atomics_a_mask_sub_1_1_7 = atomics_a_mask_sub_sub_0_1_7 | (atomics_a_mask_sub_size_7 & atomics_a_mask_sub_1_2_7);
	wire atomics_a_mask_sub_2_2_7 = req_addr[2] & ~req_addr[1];
	wire atomics_a_mask_sub_2_1_7 = atomics_a_mask_sub_sub_1_1_7 | (atomics_a_mask_sub_size_7 & atomics_a_mask_sub_2_2_7);
	wire atomics_a_mask_sub_3_2_7 = req_addr[2] & req_addr[1];
	wire atomics_a_mask_sub_3_1_7 = atomics_a_mask_sub_sub_1_1_7 | (atomics_a_mask_sub_size_7 & atomics_a_mask_sub_3_2_7);
	wire atomics_a_mask_sub_sub_size_8 = req_uop_mem_size == 2'h2;
	wire atomics_a_mask_sub_sub_0_1_8 = &req_uop_mem_size | (atomics_a_mask_sub_sub_size_8 & ~req_addr[2]);
	wire atomics_a_mask_sub_sub_1_1_8 = &req_uop_mem_size | (atomics_a_mask_sub_sub_size_8 & req_addr[2]);
	wire atomics_a_mask_sub_size_8 = req_uop_mem_size == 2'h1;
	wire atomics_a_mask_sub_0_2_8 = ~req_addr[2] & ~req_addr[1];
	wire atomics_a_mask_sub_0_1_8 = atomics_a_mask_sub_sub_0_1_8 | (atomics_a_mask_sub_size_8 & atomics_a_mask_sub_0_2_8);
	wire atomics_a_mask_sub_1_2_8 = ~req_addr[2] & req_addr[1];
	wire atomics_a_mask_sub_1_1_8 = atomics_a_mask_sub_sub_0_1_8 | (atomics_a_mask_sub_size_8 & atomics_a_mask_sub_1_2_8);
	wire atomics_a_mask_sub_2_2_8 = req_addr[2] & ~req_addr[1];
	wire atomics_a_mask_sub_2_1_8 = atomics_a_mask_sub_sub_1_1_8 | (atomics_a_mask_sub_size_8 & atomics_a_mask_sub_2_2_8);
	wire atomics_a_mask_sub_3_2_8 = req_addr[2] & req_addr[1];
	wire atomics_a_mask_sub_3_1_8 = atomics_a_mask_sub_sub_1_1_8 | (atomics_a_mask_sub_size_8 & atomics_a_mask_sub_3_2_8);
	wire _atomics_T = req_uop_mem_cmd == 5'h04;
	wire _atomics_T_2 = req_uop_mem_cmd == 5'h09;
	wire _atomics_T_4 = req_uop_mem_cmd == 5'h0a;
	wire _atomics_T_6 = req_uop_mem_cmd == 5'h0b;
	wire _GEN = ((_atomics_T_6 | _atomics_T_4) | _atomics_T_2) | _atomics_T;
	wire _atomics_T_8 = req_uop_mem_cmd == 5'h08;
	wire _atomics_T_10 = req_uop_mem_cmd == 5'h0c;
	wire _atomics_T_12 = req_uop_mem_cmd == 5'h0d;
	wire _atomics_T_14 = req_uop_mem_cmd == 5'h0e;
	wire _atomics_T_16 = req_uop_mem_cmd == 5'h0f;
	wire [7:0] atomics_mask = (_atomics_T_16 ? {atomics_a_mask_sub_3_1_8 | (atomics_a_mask_sub_3_2_8 & req_addr[0]), atomics_a_mask_sub_3_1_8 | (atomics_a_mask_sub_3_2_8 & ~req_addr[0]), atomics_a_mask_sub_2_1_8 | (atomics_a_mask_sub_2_2_8 & req_addr[0]), atomics_a_mask_sub_2_1_8 | (atomics_a_mask_sub_2_2_8 & ~req_addr[0]), atomics_a_mask_sub_1_1_8 | (atomics_a_mask_sub_1_2_8 & req_addr[0]), atomics_a_mask_sub_1_1_8 | (atomics_a_mask_sub_1_2_8 & ~req_addr[0]), atomics_a_mask_sub_0_1_8 | (atomics_a_mask_sub_0_2_8 & req_addr[0]), atomics_a_mask_sub_0_1_8 | (atomics_a_mask_sub_0_2_8 & ~req_addr[0])} : (_atomics_T_14 ? {atomics_a_mask_sub_3_1_7 | (atomics_a_mask_sub_3_2_7 & req_addr[0]), atomics_a_mask_sub_3_1_7 | (atomics_a_mask_sub_3_2_7 & ~req_addr[0]), atomics_a_mask_sub_2_1_7 | (atomics_a_mask_sub_2_2_7 & req_addr[0]), atomics_a_mask_sub_2_1_7 | (atomics_a_mask_sub_2_2_7 & ~req_addr[0]), atomics_a_mask_sub_1_1_7 | (atomics_a_mask_sub_1_2_7 & req_addr[0]), atomics_a_mask_sub_1_1_7 | (atomics_a_mask_sub_1_2_7 & ~req_addr[0]), atomics_a_mask_sub_0_1_7 | (atomics_a_mask_sub_0_2_7 & req_addr[0]), atomics_a_mask_sub_0_1_7 | (atomics_a_mask_sub_0_2_7 & ~req_addr[0])} : (_atomics_T_12 ? {atomics_a_mask_sub_3_1_6 | (atomics_a_mask_sub_3_2_6 & req_addr[0]), atomics_a_mask_sub_3_1_6 | (atomics_a_mask_sub_3_2_6 & ~req_addr[0]), atomics_a_mask_sub_2_1_6 | (atomics_a_mask_sub_2_2_6 & req_addr[0]), atomics_a_mask_sub_2_1_6 | (atomics_a_mask_sub_2_2_6 & ~req_addr[0]), atomics_a_mask_sub_1_1_6 | (atomics_a_mask_sub_1_2_6 & req_addr[0]), atomics_a_mask_sub_1_1_6 | (atomics_a_mask_sub_1_2_6 & ~req_addr[0]), atomics_a_mask_sub_0_1_6 | (atomics_a_mask_sub_0_2_6 & req_addr[0]), atomics_a_mask_sub_0_1_6 | (atomics_a_mask_sub_0_2_6 & ~req_addr[0])} : (_atomics_T_10 ? {atomics_a_mask_sub_3_1_5 | (atomics_a_mask_sub_3_2_5 & req_addr[0]), atomics_a_mask_sub_3_1_5 | (atomics_a_mask_sub_3_2_5 & ~req_addr[0]), atomics_a_mask_sub_2_1_5 | (atomics_a_mask_sub_2_2_5 & req_addr[0]), atomics_a_mask_sub_2_1_5 | (atomics_a_mask_sub_2_2_5 & ~req_addr[0]), atomics_a_mask_sub_1_1_5 | (atomics_a_mask_sub_1_2_5 & req_addr[0]), atomics_a_mask_sub_1_1_5 | (atomics_a_mask_sub_1_2_5 & ~req_addr[0]), atomics_a_mask_sub_0_1_5 | (atomics_a_mask_sub_0_2_5 & req_addr[0]), atomics_a_mask_sub_0_1_5 | (atomics_a_mask_sub_0_2_5 & ~req_addr[0])} : (_atomics_T_8 ? {atomics_a_mask_sub_3_1_4 | (atomics_a_mask_sub_3_2_4 & req_addr[0]), atomics_a_mask_sub_3_1_4 | (atomics_a_mask_sub_3_2_4 & ~req_addr[0]), atomics_a_mask_sub_2_1_4 | (atomics_a_mask_sub_2_2_4 & req_addr[0]), atomics_a_mask_sub_2_1_4 | (atomics_a_mask_sub_2_2_4 & ~req_addr[0]), atomics_a_mask_sub_1_1_4 | (atomics_a_mask_sub_1_2_4 & req_addr[0]), atomics_a_mask_sub_1_1_4 | (atomics_a_mask_sub_1_2_4 & ~req_addr[0]), atomics_a_mask_sub_0_1_4 | (atomics_a_mask_sub_0_2_4 & req_addr[0]), atomics_a_mask_sub_0_1_4 | (atomics_a_mask_sub_0_2_4 & ~req_addr[0])} : (_atomics_T_6 ? {atomics_a_mask_sub_3_1_3 | (atomics_a_mask_sub_3_2_3 & req_addr[0]), atomics_a_mask_sub_3_1_3 | (atomics_a_mask_sub_3_2_3 & ~req_addr[0]), atomics_a_mask_sub_2_1_3 | (atomics_a_mask_sub_2_2_3 & req_addr[0]), atomics_a_mask_sub_2_1_3 | (atomics_a_mask_sub_2_2_3 & ~req_addr[0]), atomics_a_mask_sub_1_1_3 | (atomics_a_mask_sub_1_2_3 & req_addr[0]), atomics_a_mask_sub_1_1_3 | (atomics_a_mask_sub_1_2_3 & ~req_addr[0]), atomics_a_mask_sub_0_1_3 | (atomics_a_mask_sub_0_2_3 & req_addr[0]), atomics_a_mask_sub_0_1_3 | (atomics_a_mask_sub_0_2_3 & ~req_addr[0])} : (_atomics_T_4 ? {atomics_a_mask_sub_3_1_2 | (atomics_a_mask_sub_3_2_2 & req_addr[0]), atomics_a_mask_sub_3_1_2 | (atomics_a_mask_sub_3_2_2 & ~req_addr[0]), atomics_a_mask_sub_2_1_2 | (atomics_a_mask_sub_2_2_2 & req_addr[0]), atomics_a_mask_sub_2_1_2 | (atomics_a_mask_sub_2_2_2 & ~req_addr[0]), atomics_a_mask_sub_1_1_2 | (atomics_a_mask_sub_1_2_2 & req_addr[0]), atomics_a_mask_sub_1_1_2 | (atomics_a_mask_sub_1_2_2 & ~req_addr[0]), atomics_a_mask_sub_0_1_2 | (atomics_a_mask_sub_0_2_2 & req_addr[0]), atomics_a_mask_sub_0_1_2 | (atomics_a_mask_sub_0_2_2 & ~req_addr[0])} : (_atomics_T_2 ? {atomics_a_mask_sub_3_1_1 | (atomics_a_mask_sub_3_2_1 & req_addr[0]), atomics_a_mask_sub_3_1_1 | (atomics_a_mask_sub_3_2_1 & ~req_addr[0]), atomics_a_mask_sub_2_1_1 | (atomics_a_mask_sub_2_2_1 & req_addr[0]), atomics_a_mask_sub_2_1_1 | (atomics_a_mask_sub_2_2_1 & ~req_addr[0]), atomics_a_mask_sub_1_1_1 | (atomics_a_mask_sub_1_2_1 & req_addr[0]), atomics_a_mask_sub_1_1_1 | (atomics_a_mask_sub_1_2_1 & ~req_addr[0]), atomics_a_mask_sub_0_1_1 | (atomics_a_mask_sub_0_2_1 & req_addr[0]), atomics_a_mask_sub_0_1_1 | (atomics_a_mask_sub_0_2_1 & ~req_addr[0])} : (_atomics_T ? {atomics_a_mask_sub_3_1 | (atomics_a_mask_sub_3_2 & req_addr[0]), atomics_a_mask_sub_3_1 | (atomics_a_mask_sub_3_2 & ~req_addr[0]), atomics_a_mask_sub_2_1 | (atomics_a_mask_sub_2_2 & req_addr[0]), atomics_a_mask_sub_2_1 | (atomics_a_mask_sub_2_2 & ~req_addr[0]), atomics_a_mask_sub_1_1 | (atomics_a_mask_sub_1_2 & req_addr[0]), atomics_a_mask_sub_1_1 | (atomics_a_mask_sub_1_2 & ~req_addr[0]), atomics_a_mask_sub_0_1 | (atomics_a_mask_sub_0_2 & req_addr[0]), atomics_a_mask_sub_0_1 | (atomics_a_mask_sub_0_2 & ~req_addr[0])} : 8'h00)))))))));
	wire io_mem_access_valid_0 = state == 2'h1;
	wire _send_resp_T_7 = req_uop_mem_cmd == 5'h04;
	wire _send_resp_T_8 = req_uop_mem_cmd == 5'h09;
	wire _send_resp_T_9 = req_uop_mem_cmd == 5'h0a;
	wire _send_resp_T_10 = req_uop_mem_cmd == 5'h0b;
	wire _send_resp_T_14 = req_uop_mem_cmd == 5'h08;
	wire _send_resp_T_15 = req_uop_mem_cmd == 5'h0c;
	wire _send_resp_T_16 = req_uop_mem_cmd == 5'h0d;
	wire _send_resp_T_17 = req_uop_mem_cmd == 5'h0e;
	wire _send_resp_T_18 = req_uop_mem_cmd == 5'h0f;
	wire _io_mem_access_bits_T_16 = (((((((_send_resp_T_7 | _send_resp_T_8) | _send_resp_T_9) | _send_resp_T_10) | _send_resp_T_14) | _send_resp_T_15) | _send_resp_T_16) | _send_resp_T_17) | _send_resp_T_18;
	wire _send_resp_T = req_uop_mem_cmd == 5'h00;
	wire _send_resp_T_1 = req_uop_mem_cmd == 5'h10;
	wire _send_resp_T_2 = req_uop_mem_cmd == 5'h06;
	wire _send_resp_T_3 = req_uop_mem_cmd == 5'h07;
	wire _io_mem_access_bits_T_41 = (((((((((((_send_resp_T | _send_resp_T_1) | _send_resp_T_2) | _send_resp_T_3) | _send_resp_T_7) | _send_resp_T_8) | _send_resp_T_9) | _send_resp_T_10) | _send_resp_T_14) | _send_resp_T_15) | _send_resp_T_16) | _send_resp_T_17) | _send_resp_T_18;
	wire _GEN_0 = ((((((((~_io_mem_access_bits_T_16 | _atomics_T_16) | _atomics_T_14) | _atomics_T_12) | _atomics_T_10) | _atomics_T_8) | _atomics_T_6) | _atomics_T_4) | _atomics_T_2) | _atomics_T;
	wire send_resp = (((((((((((_send_resp_T | _send_resp_T_1) | _send_resp_T_2) | _send_resp_T_3) | _send_resp_T_7) | _send_resp_T_8) | _send_resp_T_9) | _send_resp_T_10) | _send_resp_T_14) | _send_resp_T_15) | _send_resp_T_16) | _send_resp_T_17) | _send_resp_T_18;
	wire io_resp_valid_0 = &state & send_resp;
	wire [31:0] io_resp_bits_data_zeroed = (req_addr[2] ? grant_word[63:32] : grant_word[31:0]);
	wire [15:0] io_resp_bits_data_zeroed_1 = (req_addr[1] ? io_resp_bits_data_zeroed[31:16] : io_resp_bits_data_zeroed[15:0]);
	wire [7:0] io_resp_bits_data_zeroed_2 = (req_addr[0] ? io_resp_bits_data_zeroed_1[15:8] : io_resp_bits_data_zeroed_1[7:0]);
	always @(posedge clock) begin : sv2v_autoblock_1
		reg _GEN_1;
		reg _GEN_2;
		_GEN_1 = io_req_ready_0 & io_req_valid;
		_GEN_2 = (state == 2'h2) & io_mem_ack_valid;
		if (_GEN_1) begin
			req_uop_inst <= io_req_bits_uop_inst;
			req_uop_debug_inst <= io_req_bits_uop_debug_inst;
			req_uop_is_rvc <= io_req_bits_uop_is_rvc;
			req_uop_debug_pc <= io_req_bits_uop_debug_pc;
			req_uop_iq_type_0 <= io_req_bits_uop_iq_type_0;
			req_uop_iq_type_1 <= io_req_bits_uop_iq_type_1;
			req_uop_iq_type_2 <= io_req_bits_uop_iq_type_2;
			req_uop_iq_type_3 <= io_req_bits_uop_iq_type_3;
			req_uop_fu_code_0 <= io_req_bits_uop_fu_code_0;
			req_uop_fu_code_1 <= io_req_bits_uop_fu_code_1;
			req_uop_fu_code_2 <= io_req_bits_uop_fu_code_2;
			req_uop_fu_code_3 <= io_req_bits_uop_fu_code_3;
			req_uop_fu_code_4 <= io_req_bits_uop_fu_code_4;
			req_uop_fu_code_5 <= io_req_bits_uop_fu_code_5;
			req_uop_fu_code_6 <= io_req_bits_uop_fu_code_6;
			req_uop_fu_code_7 <= io_req_bits_uop_fu_code_7;
			req_uop_fu_code_8 <= io_req_bits_uop_fu_code_8;
			req_uop_fu_code_9 <= io_req_bits_uop_fu_code_9;
			req_uop_iw_issued <= io_req_bits_uop_iw_issued;
			req_uop_iw_issued_partial_agen <= io_req_bits_uop_iw_issued_partial_agen;
			req_uop_iw_issued_partial_dgen <= io_req_bits_uop_iw_issued_partial_dgen;
			req_uop_iw_p1_speculative_child <= io_req_bits_uop_iw_p1_speculative_child;
			req_uop_iw_p2_speculative_child <= io_req_bits_uop_iw_p2_speculative_child;
			req_uop_iw_p1_bypass_hint <= io_req_bits_uop_iw_p1_bypass_hint;
			req_uop_iw_p2_bypass_hint <= io_req_bits_uop_iw_p2_bypass_hint;
			req_uop_iw_p3_bypass_hint <= io_req_bits_uop_iw_p3_bypass_hint;
			req_uop_dis_col_sel <= io_req_bits_uop_dis_col_sel;
			req_uop_br_mask <= io_req_bits_uop_br_mask;
			req_uop_br_tag <= io_req_bits_uop_br_tag;
			req_uop_br_type <= io_req_bits_uop_br_type;
			req_uop_is_sfb <= io_req_bits_uop_is_sfb;
			req_uop_is_fence <= io_req_bits_uop_is_fence;
			req_uop_is_fencei <= io_req_bits_uop_is_fencei;
			req_uop_is_sfence <= io_req_bits_uop_is_sfence;
			req_uop_is_amo <= io_req_bits_uop_is_amo;
			req_uop_is_eret <= io_req_bits_uop_is_eret;
			req_uop_is_sys_pc2epc <= io_req_bits_uop_is_sys_pc2epc;
			req_uop_is_rocc <= io_req_bits_uop_is_rocc;
			req_uop_is_mov <= io_req_bits_uop_is_mov;
			req_uop_ftq_idx <= io_req_bits_uop_ftq_idx;
			req_uop_edge_inst <= io_req_bits_uop_edge_inst;
			req_uop_pc_lob <= io_req_bits_uop_pc_lob;
			req_uop_taken <= io_req_bits_uop_taken;
			req_uop_imm_rename <= io_req_bits_uop_imm_rename;
			req_uop_imm_sel <= io_req_bits_uop_imm_sel;
			req_uop_pimm <= io_req_bits_uop_pimm;
			req_uop_imm_packed <= io_req_bits_uop_imm_packed;
			req_uop_op1_sel <= io_req_bits_uop_op1_sel;
			req_uop_op2_sel <= io_req_bits_uop_op2_sel;
			req_uop_fp_ctrl_ldst <= io_req_bits_uop_fp_ctrl_ldst;
			req_uop_fp_ctrl_wen <= io_req_bits_uop_fp_ctrl_wen;
			req_uop_fp_ctrl_ren1 <= io_req_bits_uop_fp_ctrl_ren1;
			req_uop_fp_ctrl_ren2 <= io_req_bits_uop_fp_ctrl_ren2;
			req_uop_fp_ctrl_ren3 <= io_req_bits_uop_fp_ctrl_ren3;
			req_uop_fp_ctrl_swap12 <= io_req_bits_uop_fp_ctrl_swap12;
			req_uop_fp_ctrl_swap23 <= io_req_bits_uop_fp_ctrl_swap23;
			req_uop_fp_ctrl_typeTagIn <= io_req_bits_uop_fp_ctrl_typeTagIn;
			req_uop_fp_ctrl_typeTagOut <= io_req_bits_uop_fp_ctrl_typeTagOut;
			req_uop_fp_ctrl_fromint <= io_req_bits_uop_fp_ctrl_fromint;
			req_uop_fp_ctrl_toint <= io_req_bits_uop_fp_ctrl_toint;
			req_uop_fp_ctrl_fastpipe <= io_req_bits_uop_fp_ctrl_fastpipe;
			req_uop_fp_ctrl_fma <= io_req_bits_uop_fp_ctrl_fma;
			req_uop_fp_ctrl_div <= io_req_bits_uop_fp_ctrl_div;
			req_uop_fp_ctrl_sqrt <= io_req_bits_uop_fp_ctrl_sqrt;
			req_uop_fp_ctrl_wflags <= io_req_bits_uop_fp_ctrl_wflags;
			req_uop_fp_ctrl_vec <= io_req_bits_uop_fp_ctrl_vec;
			req_uop_rob_idx <= io_req_bits_uop_rob_idx;
			req_uop_ldq_idx <= io_req_bits_uop_ldq_idx;
			req_uop_stq_idx <= io_req_bits_uop_stq_idx;
			req_uop_rxq_idx <= io_req_bits_uop_rxq_idx;
			req_uop_pdst <= io_req_bits_uop_pdst;
			req_uop_prs1 <= io_req_bits_uop_prs1;
			req_uop_prs2 <= io_req_bits_uop_prs2;
			req_uop_prs3 <= io_req_bits_uop_prs3;
			req_uop_ppred <= io_req_bits_uop_ppred;
			req_uop_prs1_busy <= io_req_bits_uop_prs1_busy;
			req_uop_prs2_busy <= io_req_bits_uop_prs2_busy;
			req_uop_prs3_busy <= io_req_bits_uop_prs3_busy;
			req_uop_ppred_busy <= io_req_bits_uop_ppred_busy;
			req_uop_stale_pdst <= io_req_bits_uop_stale_pdst;
			req_uop_exception <= io_req_bits_uop_exception;
			req_uop_exc_cause <= io_req_bits_uop_exc_cause;
			req_uop_mem_cmd <= io_req_bits_uop_mem_cmd;
			req_uop_mem_size <= io_req_bits_uop_mem_size;
			req_uop_mem_signed <= io_req_bits_uop_mem_signed;
			req_uop_uses_ldq <= io_req_bits_uop_uses_ldq;
			req_uop_uses_stq <= io_req_bits_uop_uses_stq;
			req_uop_is_unique <= io_req_bits_uop_is_unique;
			req_uop_flush_on_commit <= io_req_bits_uop_flush_on_commit;
			req_uop_csr_cmd <= io_req_bits_uop_csr_cmd;
			req_uop_ldst_is_rs1 <= io_req_bits_uop_ldst_is_rs1;
			req_uop_ldst <= io_req_bits_uop_ldst;
			req_uop_lrs1 <= io_req_bits_uop_lrs1;
			req_uop_lrs2 <= io_req_bits_uop_lrs2;
			req_uop_lrs3 <= io_req_bits_uop_lrs3;
			req_uop_dst_rtype <= io_req_bits_uop_dst_rtype;
			req_uop_lrs1_rtype <= io_req_bits_uop_lrs1_rtype;
			req_uop_lrs2_rtype <= io_req_bits_uop_lrs2_rtype;
			req_uop_frs3_en <= io_req_bits_uop_frs3_en;
			req_uop_fcn_dw <= io_req_bits_uop_fcn_dw;
			req_uop_fcn_op <= io_req_bits_uop_fcn_op;
			req_uop_fp_val <= io_req_bits_uop_fp_val;
			req_uop_fp_rm <= io_req_bits_uop_fp_rm;
			req_uop_fp_typ <= io_req_bits_uop_fp_typ;
			req_uop_xcpt_pf_if <= io_req_bits_uop_xcpt_pf_if;
			req_uop_xcpt_ae_if <= io_req_bits_uop_xcpt_ae_if;
			req_uop_xcpt_ma_if <= io_req_bits_uop_xcpt_ma_if;
			req_uop_bp_debug_if <= io_req_bits_uop_bp_debug_if;
			req_uop_bp_xcpt_if <= io_req_bits_uop_bp_xcpt_if;
			req_uop_debug_fsrc <= io_req_bits_uop_debug_fsrc;
			req_uop_debug_tsrc <= io_req_bits_uop_debug_tsrc;
			req_addr <= io_req_bits_addr;
			req_data <= io_req_bits_data;
			req_is_hella <= io_req_bits_is_hella;
		end
		if (_GEN_2 & ((((((((((((_send_resp_T | _send_resp_T_1) | _send_resp_T_2) | _send_resp_T_3) | _send_resp_T_7) | _send_resp_T_8) | _send_resp_T_9) | _send_resp_T_10) | _send_resp_T_14) | _send_resp_T_15) | _send_resp_T_16) | _send_resp_T_17) | _send_resp_T_18))
			grant_word <= io_mem_ack_bits_data;
		if (reset)
			state <= 2'h0;
		else if (&state & (~send_resp | (io_resp_ready & io_resp_valid_0)))
			state <= 2'h0;
		else if (_GEN_2)
			state <= 2'h3;
		else if (io_mem_access_ready & io_mem_access_valid_0)
			state <= 2'h2;
		else if (_GEN_1)
			state <= 2'h1;
	end
	assign io_req_ready = io_req_ready_0;
	assign io_resp_valid = io_resp_valid_0;
	assign io_resp_bits_uop_inst = req_uop_inst;
	assign io_resp_bits_uop_debug_inst = req_uop_debug_inst;
	assign io_resp_bits_uop_is_rvc = req_uop_is_rvc;
	assign io_resp_bits_uop_debug_pc = req_uop_debug_pc;
	assign io_resp_bits_uop_iq_type_0 = req_uop_iq_type_0;
	assign io_resp_bits_uop_iq_type_1 = req_uop_iq_type_1;
	assign io_resp_bits_uop_iq_type_2 = req_uop_iq_type_2;
	assign io_resp_bits_uop_iq_type_3 = req_uop_iq_type_3;
	assign io_resp_bits_uop_fu_code_0 = req_uop_fu_code_0;
	assign io_resp_bits_uop_fu_code_1 = req_uop_fu_code_1;
	assign io_resp_bits_uop_fu_code_2 = req_uop_fu_code_2;
	assign io_resp_bits_uop_fu_code_3 = req_uop_fu_code_3;
	assign io_resp_bits_uop_fu_code_4 = req_uop_fu_code_4;
	assign io_resp_bits_uop_fu_code_5 = req_uop_fu_code_5;
	assign io_resp_bits_uop_fu_code_6 = req_uop_fu_code_6;
	assign io_resp_bits_uop_fu_code_7 = req_uop_fu_code_7;
	assign io_resp_bits_uop_fu_code_8 = req_uop_fu_code_8;
	assign io_resp_bits_uop_fu_code_9 = req_uop_fu_code_9;
	assign io_resp_bits_uop_iw_issued = req_uop_iw_issued;
	assign io_resp_bits_uop_iw_issued_partial_agen = req_uop_iw_issued_partial_agen;
	assign io_resp_bits_uop_iw_issued_partial_dgen = req_uop_iw_issued_partial_dgen;
	assign io_resp_bits_uop_iw_p1_speculative_child = req_uop_iw_p1_speculative_child;
	assign io_resp_bits_uop_iw_p2_speculative_child = req_uop_iw_p2_speculative_child;
	assign io_resp_bits_uop_iw_p1_bypass_hint = req_uop_iw_p1_bypass_hint;
	assign io_resp_bits_uop_iw_p2_bypass_hint = req_uop_iw_p2_bypass_hint;
	assign io_resp_bits_uop_iw_p3_bypass_hint = req_uop_iw_p3_bypass_hint;
	assign io_resp_bits_uop_dis_col_sel = req_uop_dis_col_sel;
	assign io_resp_bits_uop_br_mask = req_uop_br_mask;
	assign io_resp_bits_uop_br_tag = req_uop_br_tag;
	assign io_resp_bits_uop_br_type = req_uop_br_type;
	assign io_resp_bits_uop_is_sfb = req_uop_is_sfb;
	assign io_resp_bits_uop_is_fence = req_uop_is_fence;
	assign io_resp_bits_uop_is_fencei = req_uop_is_fencei;
	assign io_resp_bits_uop_is_sfence = req_uop_is_sfence;
	assign io_resp_bits_uop_is_amo = req_uop_is_amo;
	assign io_resp_bits_uop_is_eret = req_uop_is_eret;
	assign io_resp_bits_uop_is_sys_pc2epc = req_uop_is_sys_pc2epc;
	assign io_resp_bits_uop_is_rocc = req_uop_is_rocc;
	assign io_resp_bits_uop_is_mov = req_uop_is_mov;
	assign io_resp_bits_uop_ftq_idx = req_uop_ftq_idx;
	assign io_resp_bits_uop_edge_inst = req_uop_edge_inst;
	assign io_resp_bits_uop_pc_lob = req_uop_pc_lob;
	assign io_resp_bits_uop_taken = req_uop_taken;
	assign io_resp_bits_uop_imm_rename = req_uop_imm_rename;
	assign io_resp_bits_uop_imm_sel = req_uop_imm_sel;
	assign io_resp_bits_uop_pimm = req_uop_pimm;
	assign io_resp_bits_uop_imm_packed = req_uop_imm_packed;
	assign io_resp_bits_uop_op1_sel = req_uop_op1_sel;
	assign io_resp_bits_uop_op2_sel = req_uop_op2_sel;
	assign io_resp_bits_uop_fp_ctrl_ldst = req_uop_fp_ctrl_ldst;
	assign io_resp_bits_uop_fp_ctrl_wen = req_uop_fp_ctrl_wen;
	assign io_resp_bits_uop_fp_ctrl_ren1 = req_uop_fp_ctrl_ren1;
	assign io_resp_bits_uop_fp_ctrl_ren2 = req_uop_fp_ctrl_ren2;
	assign io_resp_bits_uop_fp_ctrl_ren3 = req_uop_fp_ctrl_ren3;
	assign io_resp_bits_uop_fp_ctrl_swap12 = req_uop_fp_ctrl_swap12;
	assign io_resp_bits_uop_fp_ctrl_swap23 = req_uop_fp_ctrl_swap23;
	assign io_resp_bits_uop_fp_ctrl_typeTagIn = req_uop_fp_ctrl_typeTagIn;
	assign io_resp_bits_uop_fp_ctrl_typeTagOut = req_uop_fp_ctrl_typeTagOut;
	assign io_resp_bits_uop_fp_ctrl_fromint = req_uop_fp_ctrl_fromint;
	assign io_resp_bits_uop_fp_ctrl_toint = req_uop_fp_ctrl_toint;
	assign io_resp_bits_uop_fp_ctrl_fastpipe = req_uop_fp_ctrl_fastpipe;
	assign io_resp_bits_uop_fp_ctrl_fma = req_uop_fp_ctrl_fma;
	assign io_resp_bits_uop_fp_ctrl_div = req_uop_fp_ctrl_div;
	assign io_resp_bits_uop_fp_ctrl_sqrt = req_uop_fp_ctrl_sqrt;
	assign io_resp_bits_uop_fp_ctrl_wflags = req_uop_fp_ctrl_wflags;
	assign io_resp_bits_uop_fp_ctrl_vec = req_uop_fp_ctrl_vec;
	assign io_resp_bits_uop_rob_idx = req_uop_rob_idx;
	assign io_resp_bits_uop_ldq_idx = req_uop_ldq_idx;
	assign io_resp_bits_uop_stq_idx = req_uop_stq_idx;
	assign io_resp_bits_uop_rxq_idx = req_uop_rxq_idx;
	assign io_resp_bits_uop_pdst = req_uop_pdst;
	assign io_resp_bits_uop_prs1 = req_uop_prs1;
	assign io_resp_bits_uop_prs2 = req_uop_prs2;
	assign io_resp_bits_uop_prs3 = req_uop_prs3;
	assign io_resp_bits_uop_ppred = req_uop_ppred;
	assign io_resp_bits_uop_prs1_busy = req_uop_prs1_busy;
	assign io_resp_bits_uop_prs2_busy = req_uop_prs2_busy;
	assign io_resp_bits_uop_prs3_busy = req_uop_prs3_busy;
	assign io_resp_bits_uop_ppred_busy = req_uop_ppred_busy;
	assign io_resp_bits_uop_stale_pdst = req_uop_stale_pdst;
	assign io_resp_bits_uop_exception = req_uop_exception;
	assign io_resp_bits_uop_exc_cause = req_uop_exc_cause;
	assign io_resp_bits_uop_mem_cmd = req_uop_mem_cmd;
	assign io_resp_bits_uop_mem_size = req_uop_mem_size;
	assign io_resp_bits_uop_mem_signed = req_uop_mem_signed;
	assign io_resp_bits_uop_uses_ldq = req_uop_uses_ldq;
	assign io_resp_bits_uop_uses_stq = req_uop_uses_stq;
	assign io_resp_bits_uop_is_unique = req_uop_is_unique;
	assign io_resp_bits_uop_flush_on_commit = req_uop_flush_on_commit;
	assign io_resp_bits_uop_csr_cmd = req_uop_csr_cmd;
	assign io_resp_bits_uop_ldst_is_rs1 = req_uop_ldst_is_rs1;
	assign io_resp_bits_uop_ldst = req_uop_ldst;
	assign io_resp_bits_uop_lrs1 = req_uop_lrs1;
	assign io_resp_bits_uop_lrs2 = req_uop_lrs2;
	assign io_resp_bits_uop_lrs3 = req_uop_lrs3;
	assign io_resp_bits_uop_dst_rtype = req_uop_dst_rtype;
	assign io_resp_bits_uop_lrs1_rtype = req_uop_lrs1_rtype;
	assign io_resp_bits_uop_lrs2_rtype = req_uop_lrs2_rtype;
	assign io_resp_bits_uop_frs3_en = req_uop_frs3_en;
	assign io_resp_bits_uop_fcn_dw = req_uop_fcn_dw;
	assign io_resp_bits_uop_fcn_op = req_uop_fcn_op;
	assign io_resp_bits_uop_fp_val = req_uop_fp_val;
	assign io_resp_bits_uop_fp_rm = req_uop_fp_rm;
	assign io_resp_bits_uop_fp_typ = req_uop_fp_typ;
	assign io_resp_bits_uop_xcpt_pf_if = req_uop_xcpt_pf_if;
	assign io_resp_bits_uop_xcpt_ae_if = req_uop_xcpt_ae_if;
	assign io_resp_bits_uop_xcpt_ma_if = req_uop_xcpt_ma_if;
	assign io_resp_bits_uop_bp_debug_if = req_uop_bp_debug_if;
	assign io_resp_bits_uop_bp_xcpt_if = req_uop_bp_xcpt_if;
	assign io_resp_bits_uop_debug_fsrc = req_uop_debug_fsrc;
	assign io_resp_bits_uop_debug_tsrc = req_uop_debug_tsrc;
	assign io_resp_bits_data = {(req_uop_mem_size == 2'h0 ? {56 {req_uop_mem_signed & io_resp_bits_data_zeroed_2[7]}} : {(req_uop_mem_size == 2'h1 ? {48 {req_uop_mem_signed & io_resp_bits_data_zeroed_1[15]}} : {(req_uop_mem_size == 2'h2 ? {32 {req_uop_mem_signed & io_resp_bits_data_zeroed[31]}} : grant_word[63:32]), io_resp_bits_data_zeroed[31:16]}), io_resp_bits_data_zeroed_1[15:8]}), io_resp_bits_data_zeroed_2};
	assign io_resp_bits_is_hella = req_is_hella;
	assign io_mem_access_valid = io_mem_access_valid_0;
	assign io_mem_access_bits_opcode = (_io_mem_access_bits_T_16 ? ((((_atomics_T_16 | _atomics_T_14) | _atomics_T_12) | _atomics_T_10) | _atomics_T_8 ? 3'h2 : (_GEN ? 3'h3 : 3'h0)) : {_io_mem_access_bits_T_41, 2'h0});
	assign io_mem_access_bits_param = (_io_mem_access_bits_T_16 ? (_atomics_T_16 ? 3'h3 : (_atomics_T_14 ? 3'h2 : (_atomics_T_12 ? 3'h1 : (_atomics_T_10 ? 3'h0 : (_atomics_T_8 ? 3'h4 : (_atomics_T_6 ? 3'h2 : (_atomics_T_4 ? 3'h1 : (_atomics_T_2 | ~_atomics_T ? 3'h0 : 3'h3)))))))) : 3'h0);
	assign io_mem_access_bits_size = (_GEN_0 ? {2'h0, req_uop_mem_size} : 4'h0);
	assign io_mem_access_bits_source = (_io_mem_access_bits_T_16 ? {2 {((((_atomics_T_16 | _atomics_T_14) | _atomics_T_12) | _atomics_T_10) | _atomics_T_8) | _GEN}} : 2'h3);
	assign io_mem_access_bits_address = (_GEN_0 ? req_addr[31:0] : 32'h00000000);
	assign io_mem_access_bits_mask = (_io_mem_access_bits_T_16 ? atomics_mask : (_io_mem_access_bits_T_41 ? {get_a_mask_sub_3_1 | (get_a_mask_sub_3_2 & req_addr[0]), get_a_mask_sub_3_1 | (get_a_mask_sub_3_2 & ~req_addr[0]), get_a_mask_sub_2_1 | (get_a_mask_sub_2_2 & req_addr[0]), get_a_mask_sub_2_1 | (get_a_mask_sub_2_2 & ~req_addr[0]), get_a_mask_sub_1_1 | (get_a_mask_sub_1_2 & req_addr[0]), get_a_mask_sub_1_1 | (get_a_mask_sub_1_2 & ~req_addr[0]), get_a_mask_sub_0_1 | (get_a_mask_sub_0_2 & req_addr[0]), get_a_mask_sub_0_1 | (get_a_mask_sub_0_2 & ~req_addr[0])} : {put_a_mask_sub_3_1 | (put_a_mask_sub_3_2 & req_addr[0]), put_a_mask_sub_3_1 | (put_a_mask_sub_3_2 & ~req_addr[0]), put_a_mask_sub_2_1 | (put_a_mask_sub_2_2 & req_addr[0]), put_a_mask_sub_2_1 | (put_a_mask_sub_2_2 & ~req_addr[0]), put_a_mask_sub_1_1 | (put_a_mask_sub_1_2 & req_addr[0]), put_a_mask_sub_1_1 | (put_a_mask_sub_1_2 & ~req_addr[0]), put_a_mask_sub_0_1 | (put_a_mask_sub_0_2 & req_addr[0]), put_a_mask_sub_0_1 | (put_a_mask_sub_0_2 & ~req_addr[0])}));
	assign io_mem_access_bits_data = (_io_mem_access_bits_T_16 ? ((((((((_atomics_T_16 | _atomics_T_14) | _atomics_T_12) | _atomics_T_10) | _atomics_T_8) | _atomics_T_6) | _atomics_T_4) | _atomics_T_2) | _atomics_T ? req_data : 64'h0000000000000000) : (_io_mem_access_bits_T_41 ? 64'h0000000000000000 : req_data));
endmodule
