module BranchKillableQueue_1 (
	clock,
	reset,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits_uop_inst,
	io_enq_bits_uop_debug_inst,
	io_enq_bits_uop_is_rvc,
	io_enq_bits_uop_debug_pc,
	io_enq_bits_uop_iq_type_0,
	io_enq_bits_uop_iq_type_1,
	io_enq_bits_uop_iq_type_2,
	io_enq_bits_uop_iq_type_3,
	io_enq_bits_uop_fu_code_0,
	io_enq_bits_uop_fu_code_1,
	io_enq_bits_uop_fu_code_2,
	io_enq_bits_uop_fu_code_3,
	io_enq_bits_uop_fu_code_4,
	io_enq_bits_uop_fu_code_5,
	io_enq_bits_uop_fu_code_6,
	io_enq_bits_uop_fu_code_7,
	io_enq_bits_uop_fu_code_8,
	io_enq_bits_uop_fu_code_9,
	io_enq_bits_uop_iw_issued,
	io_enq_bits_uop_iw_issued_partial_agen,
	io_enq_bits_uop_iw_issued_partial_dgen,
	io_enq_bits_uop_iw_p1_speculative_child,
	io_enq_bits_uop_iw_p2_speculative_child,
	io_enq_bits_uop_iw_p1_bypass_hint,
	io_enq_bits_uop_iw_p2_bypass_hint,
	io_enq_bits_uop_iw_p3_bypass_hint,
	io_enq_bits_uop_dis_col_sel,
	io_enq_bits_uop_br_mask,
	io_enq_bits_uop_br_tag,
	io_enq_bits_uop_br_type,
	io_enq_bits_uop_is_sfb,
	io_enq_bits_uop_is_fence,
	io_enq_bits_uop_is_fencei,
	io_enq_bits_uop_is_sfence,
	io_enq_bits_uop_is_amo,
	io_enq_bits_uop_is_eret,
	io_enq_bits_uop_is_sys_pc2epc,
	io_enq_bits_uop_is_rocc,
	io_enq_bits_uop_is_mov,
	io_enq_bits_uop_ftq_idx,
	io_enq_bits_uop_edge_inst,
	io_enq_bits_uop_pc_lob,
	io_enq_bits_uop_taken,
	io_enq_bits_uop_imm_rename,
	io_enq_bits_uop_imm_sel,
	io_enq_bits_uop_pimm,
	io_enq_bits_uop_imm_packed,
	io_enq_bits_uop_op1_sel,
	io_enq_bits_uop_op2_sel,
	io_enq_bits_uop_fp_ctrl_ldst,
	io_enq_bits_uop_fp_ctrl_wen,
	io_enq_bits_uop_fp_ctrl_ren1,
	io_enq_bits_uop_fp_ctrl_ren2,
	io_enq_bits_uop_fp_ctrl_ren3,
	io_enq_bits_uop_fp_ctrl_swap12,
	io_enq_bits_uop_fp_ctrl_swap23,
	io_enq_bits_uop_fp_ctrl_typeTagIn,
	io_enq_bits_uop_fp_ctrl_typeTagOut,
	io_enq_bits_uop_fp_ctrl_fromint,
	io_enq_bits_uop_fp_ctrl_toint,
	io_enq_bits_uop_fp_ctrl_fastpipe,
	io_enq_bits_uop_fp_ctrl_fma,
	io_enq_bits_uop_fp_ctrl_div,
	io_enq_bits_uop_fp_ctrl_sqrt,
	io_enq_bits_uop_fp_ctrl_wflags,
	io_enq_bits_uop_fp_ctrl_vec,
	io_enq_bits_uop_rob_idx,
	io_enq_bits_uop_ldq_idx,
	io_enq_bits_uop_stq_idx,
	io_enq_bits_uop_rxq_idx,
	io_enq_bits_uop_pdst,
	io_enq_bits_uop_prs1,
	io_enq_bits_uop_prs2,
	io_enq_bits_uop_prs3,
	io_enq_bits_uop_ppred,
	io_enq_bits_uop_prs1_busy,
	io_enq_bits_uop_prs2_busy,
	io_enq_bits_uop_prs3_busy,
	io_enq_bits_uop_ppred_busy,
	io_enq_bits_uop_stale_pdst,
	io_enq_bits_uop_exception,
	io_enq_bits_uop_exc_cause,
	io_enq_bits_uop_mem_cmd,
	io_enq_bits_uop_mem_size,
	io_enq_bits_uop_mem_signed,
	io_enq_bits_uop_uses_ldq,
	io_enq_bits_uop_uses_stq,
	io_enq_bits_uop_is_unique,
	io_enq_bits_uop_flush_on_commit,
	io_enq_bits_uop_csr_cmd,
	io_enq_bits_uop_ldst_is_rs1,
	io_enq_bits_uop_ldst,
	io_enq_bits_uop_lrs1,
	io_enq_bits_uop_lrs2,
	io_enq_bits_uop_lrs3,
	io_enq_bits_uop_dst_rtype,
	io_enq_bits_uop_lrs1_rtype,
	io_enq_bits_uop_lrs2_rtype,
	io_enq_bits_uop_frs3_en,
	io_enq_bits_uop_fcn_dw,
	io_enq_bits_uop_fcn_op,
	io_enq_bits_uop_fp_val,
	io_enq_bits_uop_fp_rm,
	io_enq_bits_uop_fp_typ,
	io_enq_bits_uop_xcpt_pf_if,
	io_enq_bits_uop_xcpt_ae_if,
	io_enq_bits_uop_xcpt_ma_if,
	io_enq_bits_uop_bp_debug_if,
	io_enq_bits_uop_bp_xcpt_if,
	io_enq_bits_uop_debug_fsrc,
	io_enq_bits_uop_debug_tsrc,
	io_enq_bits_addr,
	io_enq_bits_data,
	io_enq_bits_is_hella,
	io_enq_bits_tag_match,
	io_enq_bits_old_meta_coh_state,
	io_enq_bits_old_meta_tag,
	io_enq_bits_way_en,
	io_enq_bits_sdq_id,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits_uop_inst,
	io_deq_bits_uop_debug_inst,
	io_deq_bits_uop_is_rvc,
	io_deq_bits_uop_debug_pc,
	io_deq_bits_uop_iq_type_0,
	io_deq_bits_uop_iq_type_1,
	io_deq_bits_uop_iq_type_2,
	io_deq_bits_uop_iq_type_3,
	io_deq_bits_uop_fu_code_0,
	io_deq_bits_uop_fu_code_1,
	io_deq_bits_uop_fu_code_2,
	io_deq_bits_uop_fu_code_3,
	io_deq_bits_uop_fu_code_4,
	io_deq_bits_uop_fu_code_5,
	io_deq_bits_uop_fu_code_6,
	io_deq_bits_uop_fu_code_7,
	io_deq_bits_uop_fu_code_8,
	io_deq_bits_uop_fu_code_9,
	io_deq_bits_uop_iw_issued,
	io_deq_bits_uop_iw_issued_partial_agen,
	io_deq_bits_uop_iw_issued_partial_dgen,
	io_deq_bits_uop_iw_p1_speculative_child,
	io_deq_bits_uop_iw_p2_speculative_child,
	io_deq_bits_uop_iw_p1_bypass_hint,
	io_deq_bits_uop_iw_p2_bypass_hint,
	io_deq_bits_uop_iw_p3_bypass_hint,
	io_deq_bits_uop_dis_col_sel,
	io_deq_bits_uop_br_mask,
	io_deq_bits_uop_br_tag,
	io_deq_bits_uop_br_type,
	io_deq_bits_uop_is_sfb,
	io_deq_bits_uop_is_fence,
	io_deq_bits_uop_is_fencei,
	io_deq_bits_uop_is_sfence,
	io_deq_bits_uop_is_amo,
	io_deq_bits_uop_is_eret,
	io_deq_bits_uop_is_sys_pc2epc,
	io_deq_bits_uop_is_rocc,
	io_deq_bits_uop_is_mov,
	io_deq_bits_uop_ftq_idx,
	io_deq_bits_uop_edge_inst,
	io_deq_bits_uop_pc_lob,
	io_deq_bits_uop_taken,
	io_deq_bits_uop_imm_rename,
	io_deq_bits_uop_imm_sel,
	io_deq_bits_uop_pimm,
	io_deq_bits_uop_imm_packed,
	io_deq_bits_uop_op1_sel,
	io_deq_bits_uop_op2_sel,
	io_deq_bits_uop_fp_ctrl_ldst,
	io_deq_bits_uop_fp_ctrl_wen,
	io_deq_bits_uop_fp_ctrl_ren1,
	io_deq_bits_uop_fp_ctrl_ren2,
	io_deq_bits_uop_fp_ctrl_ren3,
	io_deq_bits_uop_fp_ctrl_swap12,
	io_deq_bits_uop_fp_ctrl_swap23,
	io_deq_bits_uop_fp_ctrl_typeTagIn,
	io_deq_bits_uop_fp_ctrl_typeTagOut,
	io_deq_bits_uop_fp_ctrl_fromint,
	io_deq_bits_uop_fp_ctrl_toint,
	io_deq_bits_uop_fp_ctrl_fastpipe,
	io_deq_bits_uop_fp_ctrl_fma,
	io_deq_bits_uop_fp_ctrl_div,
	io_deq_bits_uop_fp_ctrl_sqrt,
	io_deq_bits_uop_fp_ctrl_wflags,
	io_deq_bits_uop_fp_ctrl_vec,
	io_deq_bits_uop_rob_idx,
	io_deq_bits_uop_ldq_idx,
	io_deq_bits_uop_stq_idx,
	io_deq_bits_uop_rxq_idx,
	io_deq_bits_uop_pdst,
	io_deq_bits_uop_prs1,
	io_deq_bits_uop_prs2,
	io_deq_bits_uop_prs3,
	io_deq_bits_uop_ppred,
	io_deq_bits_uop_prs1_busy,
	io_deq_bits_uop_prs2_busy,
	io_deq_bits_uop_prs3_busy,
	io_deq_bits_uop_ppred_busy,
	io_deq_bits_uop_stale_pdst,
	io_deq_bits_uop_exception,
	io_deq_bits_uop_exc_cause,
	io_deq_bits_uop_mem_cmd,
	io_deq_bits_uop_mem_size,
	io_deq_bits_uop_mem_signed,
	io_deq_bits_uop_uses_ldq,
	io_deq_bits_uop_uses_stq,
	io_deq_bits_uop_is_unique,
	io_deq_bits_uop_flush_on_commit,
	io_deq_bits_uop_csr_cmd,
	io_deq_bits_uop_ldst_is_rs1,
	io_deq_bits_uop_ldst,
	io_deq_bits_uop_lrs1,
	io_deq_bits_uop_lrs2,
	io_deq_bits_uop_lrs3,
	io_deq_bits_uop_dst_rtype,
	io_deq_bits_uop_lrs1_rtype,
	io_deq_bits_uop_lrs2_rtype,
	io_deq_bits_uop_frs3_en,
	io_deq_bits_uop_fcn_dw,
	io_deq_bits_uop_fcn_op,
	io_deq_bits_uop_fp_val,
	io_deq_bits_uop_fp_rm,
	io_deq_bits_uop_fp_typ,
	io_deq_bits_uop_xcpt_pf_if,
	io_deq_bits_uop_xcpt_ae_if,
	io_deq_bits_uop_xcpt_ma_if,
	io_deq_bits_uop_bp_debug_if,
	io_deq_bits_uop_bp_xcpt_if,
	io_deq_bits_uop_debug_fsrc,
	io_deq_bits_uop_debug_tsrc,
	io_deq_bits_addr,
	io_deq_bits_data,
	io_deq_bits_is_hella,
	io_deq_bits_way_en,
	io_deq_bits_sdq_id,
	io_brupdate_b1_resolve_mask,
	io_brupdate_b1_mispredict_mask,
	io_flush,
	io_empty
);
	input clock;
	input reset;
	output wire io_enq_ready;
	input io_enq_valid;
	input [31:0] io_enq_bits_uop_inst;
	input [31:0] io_enq_bits_uop_debug_inst;
	input io_enq_bits_uop_is_rvc;
	input [39:0] io_enq_bits_uop_debug_pc;
	input io_enq_bits_uop_iq_type_0;
	input io_enq_bits_uop_iq_type_1;
	input io_enq_bits_uop_iq_type_2;
	input io_enq_bits_uop_iq_type_3;
	input io_enq_bits_uop_fu_code_0;
	input io_enq_bits_uop_fu_code_1;
	input io_enq_bits_uop_fu_code_2;
	input io_enq_bits_uop_fu_code_3;
	input io_enq_bits_uop_fu_code_4;
	input io_enq_bits_uop_fu_code_5;
	input io_enq_bits_uop_fu_code_6;
	input io_enq_bits_uop_fu_code_7;
	input io_enq_bits_uop_fu_code_8;
	input io_enq_bits_uop_fu_code_9;
	input io_enq_bits_uop_iw_issued;
	input io_enq_bits_uop_iw_issued_partial_agen;
	input io_enq_bits_uop_iw_issued_partial_dgen;
	input io_enq_bits_uop_iw_p1_speculative_child;
	input io_enq_bits_uop_iw_p2_speculative_child;
	input io_enq_bits_uop_iw_p1_bypass_hint;
	input io_enq_bits_uop_iw_p2_bypass_hint;
	input io_enq_bits_uop_iw_p3_bypass_hint;
	input io_enq_bits_uop_dis_col_sel;
	input [7:0] io_enq_bits_uop_br_mask;
	input [2:0] io_enq_bits_uop_br_tag;
	input [3:0] io_enq_bits_uop_br_type;
	input io_enq_bits_uop_is_sfb;
	input io_enq_bits_uop_is_fence;
	input io_enq_bits_uop_is_fencei;
	input io_enq_bits_uop_is_sfence;
	input io_enq_bits_uop_is_amo;
	input io_enq_bits_uop_is_eret;
	input io_enq_bits_uop_is_sys_pc2epc;
	input io_enq_bits_uop_is_rocc;
	input io_enq_bits_uop_is_mov;
	input [3:0] io_enq_bits_uop_ftq_idx;
	input io_enq_bits_uop_edge_inst;
	input [5:0] io_enq_bits_uop_pc_lob;
	input io_enq_bits_uop_taken;
	input io_enq_bits_uop_imm_rename;
	input [2:0] io_enq_bits_uop_imm_sel;
	input [4:0] io_enq_bits_uop_pimm;
	input [19:0] io_enq_bits_uop_imm_packed;
	input [1:0] io_enq_bits_uop_op1_sel;
	input [2:0] io_enq_bits_uop_op2_sel;
	input io_enq_bits_uop_fp_ctrl_ldst;
	input io_enq_bits_uop_fp_ctrl_wen;
	input io_enq_bits_uop_fp_ctrl_ren1;
	input io_enq_bits_uop_fp_ctrl_ren2;
	input io_enq_bits_uop_fp_ctrl_ren3;
	input io_enq_bits_uop_fp_ctrl_swap12;
	input io_enq_bits_uop_fp_ctrl_swap23;
	input [1:0] io_enq_bits_uop_fp_ctrl_typeTagIn;
	input [1:0] io_enq_bits_uop_fp_ctrl_typeTagOut;
	input io_enq_bits_uop_fp_ctrl_fromint;
	input io_enq_bits_uop_fp_ctrl_toint;
	input io_enq_bits_uop_fp_ctrl_fastpipe;
	input io_enq_bits_uop_fp_ctrl_fma;
	input io_enq_bits_uop_fp_ctrl_div;
	input io_enq_bits_uop_fp_ctrl_sqrt;
	input io_enq_bits_uop_fp_ctrl_wflags;
	input io_enq_bits_uop_fp_ctrl_vec;
	input [4:0] io_enq_bits_uop_rob_idx;
	input [3:0] io_enq_bits_uop_ldq_idx;
	input [3:0] io_enq_bits_uop_stq_idx;
	input [1:0] io_enq_bits_uop_rxq_idx;
	input [5:0] io_enq_bits_uop_pdst;
	input [5:0] io_enq_bits_uop_prs1;
	input [5:0] io_enq_bits_uop_prs2;
	input [5:0] io_enq_bits_uop_prs3;
	input [3:0] io_enq_bits_uop_ppred;
	input io_enq_bits_uop_prs1_busy;
	input io_enq_bits_uop_prs2_busy;
	input io_enq_bits_uop_prs3_busy;
	input io_enq_bits_uop_ppred_busy;
	input [5:0] io_enq_bits_uop_stale_pdst;
	input io_enq_bits_uop_exception;
	input [63:0] io_enq_bits_uop_exc_cause;
	input [4:0] io_enq_bits_uop_mem_cmd;
	input [1:0] io_enq_bits_uop_mem_size;
	input io_enq_bits_uop_mem_signed;
	input io_enq_bits_uop_uses_ldq;
	input io_enq_bits_uop_uses_stq;
	input io_enq_bits_uop_is_unique;
	input io_enq_bits_uop_flush_on_commit;
	input [2:0] io_enq_bits_uop_csr_cmd;
	input io_enq_bits_uop_ldst_is_rs1;
	input [5:0] io_enq_bits_uop_ldst;
	input [5:0] io_enq_bits_uop_lrs1;
	input [5:0] io_enq_bits_uop_lrs2;
	input [5:0] io_enq_bits_uop_lrs3;
	input [1:0] io_enq_bits_uop_dst_rtype;
	input [1:0] io_enq_bits_uop_lrs1_rtype;
	input [1:0] io_enq_bits_uop_lrs2_rtype;
	input io_enq_bits_uop_frs3_en;
	input io_enq_bits_uop_fcn_dw;
	input [4:0] io_enq_bits_uop_fcn_op;
	input io_enq_bits_uop_fp_val;
	input [2:0] io_enq_bits_uop_fp_rm;
	input [1:0] io_enq_bits_uop_fp_typ;
	input io_enq_bits_uop_xcpt_pf_if;
	input io_enq_bits_uop_xcpt_ae_if;
	input io_enq_bits_uop_xcpt_ma_if;
	input io_enq_bits_uop_bp_debug_if;
	input io_enq_bits_uop_bp_xcpt_if;
	input [2:0] io_enq_bits_uop_debug_fsrc;
	input [2:0] io_enq_bits_uop_debug_tsrc;
	input [39:0] io_enq_bits_addr;
	input [63:0] io_enq_bits_data;
	input io_enq_bits_is_hella;
	input io_enq_bits_tag_match;
	input [1:0] io_enq_bits_old_meta_coh_state;
	input [19:0] io_enq_bits_old_meta_tag;
	input [3:0] io_enq_bits_way_en;
	input [4:0] io_enq_bits_sdq_id;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire [31:0] io_deq_bits_uop_inst;
	output wire [31:0] io_deq_bits_uop_debug_inst;
	output wire io_deq_bits_uop_is_rvc;
	output wire [39:0] io_deq_bits_uop_debug_pc;
	output wire io_deq_bits_uop_iq_type_0;
	output wire io_deq_bits_uop_iq_type_1;
	output wire io_deq_bits_uop_iq_type_2;
	output wire io_deq_bits_uop_iq_type_3;
	output wire io_deq_bits_uop_fu_code_0;
	output wire io_deq_bits_uop_fu_code_1;
	output wire io_deq_bits_uop_fu_code_2;
	output wire io_deq_bits_uop_fu_code_3;
	output wire io_deq_bits_uop_fu_code_4;
	output wire io_deq_bits_uop_fu_code_5;
	output wire io_deq_bits_uop_fu_code_6;
	output wire io_deq_bits_uop_fu_code_7;
	output wire io_deq_bits_uop_fu_code_8;
	output wire io_deq_bits_uop_fu_code_9;
	output wire io_deq_bits_uop_iw_issued;
	output wire io_deq_bits_uop_iw_issued_partial_agen;
	output wire io_deq_bits_uop_iw_issued_partial_dgen;
	output wire io_deq_bits_uop_iw_p1_speculative_child;
	output wire io_deq_bits_uop_iw_p2_speculative_child;
	output wire io_deq_bits_uop_iw_p1_bypass_hint;
	output wire io_deq_bits_uop_iw_p2_bypass_hint;
	output wire io_deq_bits_uop_iw_p3_bypass_hint;
	output wire io_deq_bits_uop_dis_col_sel;
	output wire [7:0] io_deq_bits_uop_br_mask;
	output wire [2:0] io_deq_bits_uop_br_tag;
	output wire [3:0] io_deq_bits_uop_br_type;
	output wire io_deq_bits_uop_is_sfb;
	output wire io_deq_bits_uop_is_fence;
	output wire io_deq_bits_uop_is_fencei;
	output wire io_deq_bits_uop_is_sfence;
	output wire io_deq_bits_uop_is_amo;
	output wire io_deq_bits_uop_is_eret;
	output wire io_deq_bits_uop_is_sys_pc2epc;
	output wire io_deq_bits_uop_is_rocc;
	output wire io_deq_bits_uop_is_mov;
	output wire [3:0] io_deq_bits_uop_ftq_idx;
	output wire io_deq_bits_uop_edge_inst;
	output wire [5:0] io_deq_bits_uop_pc_lob;
	output wire io_deq_bits_uop_taken;
	output wire io_deq_bits_uop_imm_rename;
	output wire [2:0] io_deq_bits_uop_imm_sel;
	output wire [4:0] io_deq_bits_uop_pimm;
	output wire [19:0] io_deq_bits_uop_imm_packed;
	output wire [1:0] io_deq_bits_uop_op1_sel;
	output wire [2:0] io_deq_bits_uop_op2_sel;
	output wire io_deq_bits_uop_fp_ctrl_ldst;
	output wire io_deq_bits_uop_fp_ctrl_wen;
	output wire io_deq_bits_uop_fp_ctrl_ren1;
	output wire io_deq_bits_uop_fp_ctrl_ren2;
	output wire io_deq_bits_uop_fp_ctrl_ren3;
	output wire io_deq_bits_uop_fp_ctrl_swap12;
	output wire io_deq_bits_uop_fp_ctrl_swap23;
	output wire [1:0] io_deq_bits_uop_fp_ctrl_typeTagIn;
	output wire [1:0] io_deq_bits_uop_fp_ctrl_typeTagOut;
	output wire io_deq_bits_uop_fp_ctrl_fromint;
	output wire io_deq_bits_uop_fp_ctrl_toint;
	output wire io_deq_bits_uop_fp_ctrl_fastpipe;
	output wire io_deq_bits_uop_fp_ctrl_fma;
	output wire io_deq_bits_uop_fp_ctrl_div;
	output wire io_deq_bits_uop_fp_ctrl_sqrt;
	output wire io_deq_bits_uop_fp_ctrl_wflags;
	output wire io_deq_bits_uop_fp_ctrl_vec;
	output wire [4:0] io_deq_bits_uop_rob_idx;
	output wire [3:0] io_deq_bits_uop_ldq_idx;
	output wire [3:0] io_deq_bits_uop_stq_idx;
	output wire [1:0] io_deq_bits_uop_rxq_idx;
	output wire [5:0] io_deq_bits_uop_pdst;
	output wire [5:0] io_deq_bits_uop_prs1;
	output wire [5:0] io_deq_bits_uop_prs2;
	output wire [5:0] io_deq_bits_uop_prs3;
	output wire [3:0] io_deq_bits_uop_ppred;
	output wire io_deq_bits_uop_prs1_busy;
	output wire io_deq_bits_uop_prs2_busy;
	output wire io_deq_bits_uop_prs3_busy;
	output wire io_deq_bits_uop_ppred_busy;
	output wire [5:0] io_deq_bits_uop_stale_pdst;
	output wire io_deq_bits_uop_exception;
	output wire [63:0] io_deq_bits_uop_exc_cause;
	output wire [4:0] io_deq_bits_uop_mem_cmd;
	output wire [1:0] io_deq_bits_uop_mem_size;
	output wire io_deq_bits_uop_mem_signed;
	output wire io_deq_bits_uop_uses_ldq;
	output wire io_deq_bits_uop_uses_stq;
	output wire io_deq_bits_uop_is_unique;
	output wire io_deq_bits_uop_flush_on_commit;
	output wire [2:0] io_deq_bits_uop_csr_cmd;
	output wire io_deq_bits_uop_ldst_is_rs1;
	output wire [5:0] io_deq_bits_uop_ldst;
	output wire [5:0] io_deq_bits_uop_lrs1;
	output wire [5:0] io_deq_bits_uop_lrs2;
	output wire [5:0] io_deq_bits_uop_lrs3;
	output wire [1:0] io_deq_bits_uop_dst_rtype;
	output wire [1:0] io_deq_bits_uop_lrs1_rtype;
	output wire [1:0] io_deq_bits_uop_lrs2_rtype;
	output wire io_deq_bits_uop_frs3_en;
	output wire io_deq_bits_uop_fcn_dw;
	output wire [4:0] io_deq_bits_uop_fcn_op;
	output wire io_deq_bits_uop_fp_val;
	output wire [2:0] io_deq_bits_uop_fp_rm;
	output wire [1:0] io_deq_bits_uop_fp_typ;
	output wire io_deq_bits_uop_xcpt_pf_if;
	output wire io_deq_bits_uop_xcpt_ae_if;
	output wire io_deq_bits_uop_xcpt_ma_if;
	output wire io_deq_bits_uop_bp_debug_if;
	output wire io_deq_bits_uop_bp_xcpt_if;
	output wire [2:0] io_deq_bits_uop_debug_fsrc;
	output wire [2:0] io_deq_bits_uop_debug_tsrc;
	output wire [39:0] io_deq_bits_addr;
	output wire [63:0] io_deq_bits_data;
	output wire io_deq_bits_is_hella;
	output wire [3:0] io_deq_bits_way_en;
	output wire [4:0] io_deq_bits_sdq_id;
	input [7:0] io_brupdate_b1_resolve_mask;
	input [7:0] io_brupdate_b1_mispredict_mask;
	input io_flush;
	output wire io_empty;
	wire _main_io_deq_valid;
	wire [31:0] _main_io_deq_bits_uop_inst;
	wire [31:0] _main_io_deq_bits_uop_debug_inst;
	wire _main_io_deq_bits_uop_is_rvc;
	wire [39:0] _main_io_deq_bits_uop_debug_pc;
	wire _main_io_deq_bits_uop_iq_type_0;
	wire _main_io_deq_bits_uop_iq_type_1;
	wire _main_io_deq_bits_uop_iq_type_2;
	wire _main_io_deq_bits_uop_iq_type_3;
	wire _main_io_deq_bits_uop_fu_code_0;
	wire _main_io_deq_bits_uop_fu_code_1;
	wire _main_io_deq_bits_uop_fu_code_2;
	wire _main_io_deq_bits_uop_fu_code_3;
	wire _main_io_deq_bits_uop_fu_code_4;
	wire _main_io_deq_bits_uop_fu_code_5;
	wire _main_io_deq_bits_uop_fu_code_6;
	wire _main_io_deq_bits_uop_fu_code_7;
	wire _main_io_deq_bits_uop_fu_code_8;
	wire _main_io_deq_bits_uop_fu_code_9;
	wire _main_io_deq_bits_uop_iw_issued;
	wire _main_io_deq_bits_uop_iw_issued_partial_agen;
	wire _main_io_deq_bits_uop_iw_issued_partial_dgen;
	wire _main_io_deq_bits_uop_iw_p1_speculative_child;
	wire _main_io_deq_bits_uop_iw_p2_speculative_child;
	wire _main_io_deq_bits_uop_iw_p1_bypass_hint;
	wire _main_io_deq_bits_uop_iw_p2_bypass_hint;
	wire _main_io_deq_bits_uop_iw_p3_bypass_hint;
	wire _main_io_deq_bits_uop_dis_col_sel;
	wire [7:0] _main_io_deq_bits_uop_br_mask;
	wire [2:0] _main_io_deq_bits_uop_br_tag;
	wire [3:0] _main_io_deq_bits_uop_br_type;
	wire _main_io_deq_bits_uop_is_sfb;
	wire _main_io_deq_bits_uop_is_fence;
	wire _main_io_deq_bits_uop_is_fencei;
	wire _main_io_deq_bits_uop_is_sfence;
	wire _main_io_deq_bits_uop_is_amo;
	wire _main_io_deq_bits_uop_is_eret;
	wire _main_io_deq_bits_uop_is_sys_pc2epc;
	wire _main_io_deq_bits_uop_is_rocc;
	wire _main_io_deq_bits_uop_is_mov;
	wire [3:0] _main_io_deq_bits_uop_ftq_idx;
	wire _main_io_deq_bits_uop_edge_inst;
	wire [5:0] _main_io_deq_bits_uop_pc_lob;
	wire _main_io_deq_bits_uop_taken;
	wire _main_io_deq_bits_uop_imm_rename;
	wire [2:0] _main_io_deq_bits_uop_imm_sel;
	wire [4:0] _main_io_deq_bits_uop_pimm;
	wire [19:0] _main_io_deq_bits_uop_imm_packed;
	wire [1:0] _main_io_deq_bits_uop_op1_sel;
	wire [2:0] _main_io_deq_bits_uop_op2_sel;
	wire _main_io_deq_bits_uop_fp_ctrl_ldst;
	wire _main_io_deq_bits_uop_fp_ctrl_wen;
	wire _main_io_deq_bits_uop_fp_ctrl_ren1;
	wire _main_io_deq_bits_uop_fp_ctrl_ren2;
	wire _main_io_deq_bits_uop_fp_ctrl_ren3;
	wire _main_io_deq_bits_uop_fp_ctrl_swap12;
	wire _main_io_deq_bits_uop_fp_ctrl_swap23;
	wire [1:0] _main_io_deq_bits_uop_fp_ctrl_typeTagIn;
	wire [1:0] _main_io_deq_bits_uop_fp_ctrl_typeTagOut;
	wire _main_io_deq_bits_uop_fp_ctrl_fromint;
	wire _main_io_deq_bits_uop_fp_ctrl_toint;
	wire _main_io_deq_bits_uop_fp_ctrl_fastpipe;
	wire _main_io_deq_bits_uop_fp_ctrl_fma;
	wire _main_io_deq_bits_uop_fp_ctrl_div;
	wire _main_io_deq_bits_uop_fp_ctrl_sqrt;
	wire _main_io_deq_bits_uop_fp_ctrl_wflags;
	wire _main_io_deq_bits_uop_fp_ctrl_vec;
	wire [4:0] _main_io_deq_bits_uop_rob_idx;
	wire [3:0] _main_io_deq_bits_uop_ldq_idx;
	wire [3:0] _main_io_deq_bits_uop_stq_idx;
	wire [1:0] _main_io_deq_bits_uop_rxq_idx;
	wire [5:0] _main_io_deq_bits_uop_pdst;
	wire [5:0] _main_io_deq_bits_uop_prs1;
	wire [5:0] _main_io_deq_bits_uop_prs2;
	wire [5:0] _main_io_deq_bits_uop_prs3;
	wire [3:0] _main_io_deq_bits_uop_ppred;
	wire _main_io_deq_bits_uop_prs1_busy;
	wire _main_io_deq_bits_uop_prs2_busy;
	wire _main_io_deq_bits_uop_prs3_busy;
	wire _main_io_deq_bits_uop_ppred_busy;
	wire [5:0] _main_io_deq_bits_uop_stale_pdst;
	wire _main_io_deq_bits_uop_exception;
	wire [63:0] _main_io_deq_bits_uop_exc_cause;
	wire [4:0] _main_io_deq_bits_uop_mem_cmd;
	wire [1:0] _main_io_deq_bits_uop_mem_size;
	wire _main_io_deq_bits_uop_mem_signed;
	wire _main_io_deq_bits_uop_uses_ldq;
	wire _main_io_deq_bits_uop_uses_stq;
	wire _main_io_deq_bits_uop_is_unique;
	wire _main_io_deq_bits_uop_flush_on_commit;
	wire [2:0] _main_io_deq_bits_uop_csr_cmd;
	wire _main_io_deq_bits_uop_ldst_is_rs1;
	wire [5:0] _main_io_deq_bits_uop_ldst;
	wire [5:0] _main_io_deq_bits_uop_lrs1;
	wire [5:0] _main_io_deq_bits_uop_lrs2;
	wire [5:0] _main_io_deq_bits_uop_lrs3;
	wire [1:0] _main_io_deq_bits_uop_dst_rtype;
	wire [1:0] _main_io_deq_bits_uop_lrs1_rtype;
	wire [1:0] _main_io_deq_bits_uop_lrs2_rtype;
	wire _main_io_deq_bits_uop_frs3_en;
	wire _main_io_deq_bits_uop_fcn_dw;
	wire [4:0] _main_io_deq_bits_uop_fcn_op;
	wire _main_io_deq_bits_uop_fp_val;
	wire [2:0] _main_io_deq_bits_uop_fp_rm;
	wire [1:0] _main_io_deq_bits_uop_fp_typ;
	wire _main_io_deq_bits_uop_xcpt_pf_if;
	wire _main_io_deq_bits_uop_xcpt_ae_if;
	wire _main_io_deq_bits_uop_xcpt_ma_if;
	wire _main_io_deq_bits_uop_bp_debug_if;
	wire _main_io_deq_bits_uop_bp_xcpt_if;
	wire [2:0] _main_io_deq_bits_uop_debug_fsrc;
	wire [2:0] _main_io_deq_bits_uop_debug_tsrc;
	wire [39:0] _main_io_deq_bits_addr;
	wire [63:0] _main_io_deq_bits_data;
	wire _main_io_deq_bits_is_hella;
	wire [3:0] _main_io_deq_bits_way_en;
	wire [4:0] _main_io_deq_bits_sdq_id;
	wire _main_io_empty;
	reg [39:0] out_reg_addr;
	reg [63:0] out_reg_data;
	reg out_reg_is_hella;
	reg [3:0] out_reg_way_en;
	reg [4:0] out_reg_sdq_id;
	reg out_valid;
	reg [31:0] out_uop_inst;
	reg [31:0] out_uop_debug_inst;
	reg out_uop_is_rvc;
	reg [39:0] out_uop_debug_pc;
	reg out_uop_iq_type_0;
	reg out_uop_iq_type_1;
	reg out_uop_iq_type_2;
	reg out_uop_iq_type_3;
	reg out_uop_fu_code_0;
	reg out_uop_fu_code_1;
	reg out_uop_fu_code_2;
	reg out_uop_fu_code_3;
	reg out_uop_fu_code_4;
	reg out_uop_fu_code_5;
	reg out_uop_fu_code_6;
	reg out_uop_fu_code_7;
	reg out_uop_fu_code_8;
	reg out_uop_fu_code_9;
	reg out_uop_iw_issued;
	reg out_uop_iw_issued_partial_agen;
	reg out_uop_iw_issued_partial_dgen;
	reg out_uop_iw_p1_speculative_child;
	reg out_uop_iw_p2_speculative_child;
	reg out_uop_iw_p1_bypass_hint;
	reg out_uop_iw_p2_bypass_hint;
	reg out_uop_iw_p3_bypass_hint;
	reg out_uop_dis_col_sel;
	reg [7:0] out_uop_br_mask;
	reg [2:0] out_uop_br_tag;
	reg [3:0] out_uop_br_type;
	reg out_uop_is_sfb;
	reg out_uop_is_fence;
	reg out_uop_is_fencei;
	reg out_uop_is_sfence;
	reg out_uop_is_amo;
	reg out_uop_is_eret;
	reg out_uop_is_sys_pc2epc;
	reg out_uop_is_rocc;
	reg out_uop_is_mov;
	reg [3:0] out_uop_ftq_idx;
	reg out_uop_edge_inst;
	reg [5:0] out_uop_pc_lob;
	reg out_uop_taken;
	reg out_uop_imm_rename;
	reg [2:0] out_uop_imm_sel;
	reg [4:0] out_uop_pimm;
	reg [19:0] out_uop_imm_packed;
	reg [1:0] out_uop_op1_sel;
	reg [2:0] out_uop_op2_sel;
	reg out_uop_fp_ctrl_ldst;
	reg out_uop_fp_ctrl_wen;
	reg out_uop_fp_ctrl_ren1;
	reg out_uop_fp_ctrl_ren2;
	reg out_uop_fp_ctrl_ren3;
	reg out_uop_fp_ctrl_swap12;
	reg out_uop_fp_ctrl_swap23;
	reg [1:0] out_uop_fp_ctrl_typeTagIn;
	reg [1:0] out_uop_fp_ctrl_typeTagOut;
	reg out_uop_fp_ctrl_fromint;
	reg out_uop_fp_ctrl_toint;
	reg out_uop_fp_ctrl_fastpipe;
	reg out_uop_fp_ctrl_fma;
	reg out_uop_fp_ctrl_div;
	reg out_uop_fp_ctrl_sqrt;
	reg out_uop_fp_ctrl_wflags;
	reg out_uop_fp_ctrl_vec;
	reg [4:0] out_uop_rob_idx;
	reg [3:0] out_uop_ldq_idx;
	reg [3:0] out_uop_stq_idx;
	reg [1:0] out_uop_rxq_idx;
	reg [5:0] out_uop_pdst;
	reg [5:0] out_uop_prs1;
	reg [5:0] out_uop_prs2;
	reg [5:0] out_uop_prs3;
	reg [3:0] out_uop_ppred;
	reg out_uop_prs1_busy;
	reg out_uop_prs2_busy;
	reg out_uop_prs3_busy;
	reg out_uop_ppred_busy;
	reg [5:0] out_uop_stale_pdst;
	reg out_uop_exception;
	reg [63:0] out_uop_exc_cause;
	reg [4:0] out_uop_mem_cmd;
	reg [1:0] out_uop_mem_size;
	reg out_uop_mem_signed;
	reg out_uop_uses_ldq;
	reg out_uop_uses_stq;
	reg out_uop_is_unique;
	reg out_uop_flush_on_commit;
	reg [2:0] out_uop_csr_cmd;
	reg out_uop_ldst_is_rs1;
	reg [5:0] out_uop_ldst;
	reg [5:0] out_uop_lrs1;
	reg [5:0] out_uop_lrs2;
	reg [5:0] out_uop_lrs3;
	reg [1:0] out_uop_dst_rtype;
	reg [1:0] out_uop_lrs1_rtype;
	reg [1:0] out_uop_lrs2_rtype;
	reg out_uop_frs3_en;
	reg out_uop_fcn_dw;
	reg [4:0] out_uop_fcn_op;
	reg out_uop_fp_val;
	reg [2:0] out_uop_fp_rm;
	reg [1:0] out_uop_fp_typ;
	reg out_uop_xcpt_pf_if;
	reg out_uop_xcpt_ae_if;
	reg out_uop_xcpt_ma_if;
	reg out_uop_bp_debug_if;
	reg out_uop_bp_xcpt_if;
	reg [2:0] out_uop_debug_fsrc;
	reg [2:0] out_uop_debug_tsrc;
	wire _GEN = (io_deq_ready & out_valid) | ~out_valid;
	always @(posedge clock) begin
		if (_GEN) begin
			out_reg_addr <= _main_io_deq_bits_addr;
			out_reg_data <= _main_io_deq_bits_data;
			out_reg_is_hella <= _main_io_deq_bits_is_hella;
			out_reg_way_en <= _main_io_deq_bits_way_en;
			out_reg_sdq_id <= _main_io_deq_bits_sdq_id;
			out_uop_inst <= _main_io_deq_bits_uop_inst;
			out_uop_debug_inst <= _main_io_deq_bits_uop_debug_inst;
			out_uop_is_rvc <= _main_io_deq_bits_uop_is_rvc;
			out_uop_debug_pc <= _main_io_deq_bits_uop_debug_pc;
			out_uop_iq_type_0 <= _main_io_deq_bits_uop_iq_type_0;
			out_uop_iq_type_1 <= _main_io_deq_bits_uop_iq_type_1;
			out_uop_iq_type_2 <= _main_io_deq_bits_uop_iq_type_2;
			out_uop_iq_type_3 <= _main_io_deq_bits_uop_iq_type_3;
			out_uop_fu_code_0 <= _main_io_deq_bits_uop_fu_code_0;
			out_uop_fu_code_1 <= _main_io_deq_bits_uop_fu_code_1;
			out_uop_fu_code_2 <= _main_io_deq_bits_uop_fu_code_2;
			out_uop_fu_code_3 <= _main_io_deq_bits_uop_fu_code_3;
			out_uop_fu_code_4 <= _main_io_deq_bits_uop_fu_code_4;
			out_uop_fu_code_5 <= _main_io_deq_bits_uop_fu_code_5;
			out_uop_fu_code_6 <= _main_io_deq_bits_uop_fu_code_6;
			out_uop_fu_code_7 <= _main_io_deq_bits_uop_fu_code_7;
			out_uop_fu_code_8 <= _main_io_deq_bits_uop_fu_code_8;
			out_uop_fu_code_9 <= _main_io_deq_bits_uop_fu_code_9;
			out_uop_iw_issued <= _main_io_deq_bits_uop_iw_issued;
			out_uop_iw_issued_partial_agen <= _main_io_deq_bits_uop_iw_issued_partial_agen;
			out_uop_iw_issued_partial_dgen <= _main_io_deq_bits_uop_iw_issued_partial_dgen;
			out_uop_iw_p1_speculative_child <= _main_io_deq_bits_uop_iw_p1_speculative_child;
			out_uop_iw_p2_speculative_child <= _main_io_deq_bits_uop_iw_p2_speculative_child;
			out_uop_iw_p1_bypass_hint <= _main_io_deq_bits_uop_iw_p1_bypass_hint;
			out_uop_iw_p2_bypass_hint <= _main_io_deq_bits_uop_iw_p2_bypass_hint;
			out_uop_iw_p3_bypass_hint <= _main_io_deq_bits_uop_iw_p3_bypass_hint;
			out_uop_dis_col_sel <= _main_io_deq_bits_uop_dis_col_sel;
			out_uop_br_mask <= _main_io_deq_bits_uop_br_mask & ~io_brupdate_b1_resolve_mask;
			out_uop_br_tag <= _main_io_deq_bits_uop_br_tag;
			out_uop_br_type <= _main_io_deq_bits_uop_br_type;
			out_uop_is_sfb <= _main_io_deq_bits_uop_is_sfb;
			out_uop_is_fence <= _main_io_deq_bits_uop_is_fence;
			out_uop_is_fencei <= _main_io_deq_bits_uop_is_fencei;
			out_uop_is_sfence <= _main_io_deq_bits_uop_is_sfence;
			out_uop_is_amo <= _main_io_deq_bits_uop_is_amo;
			out_uop_is_eret <= _main_io_deq_bits_uop_is_eret;
			out_uop_is_sys_pc2epc <= _main_io_deq_bits_uop_is_sys_pc2epc;
			out_uop_is_rocc <= _main_io_deq_bits_uop_is_rocc;
			out_uop_is_mov <= _main_io_deq_bits_uop_is_mov;
			out_uop_ftq_idx <= _main_io_deq_bits_uop_ftq_idx;
			out_uop_edge_inst <= _main_io_deq_bits_uop_edge_inst;
			out_uop_pc_lob <= _main_io_deq_bits_uop_pc_lob;
			out_uop_taken <= _main_io_deq_bits_uop_taken;
			out_uop_imm_rename <= _main_io_deq_bits_uop_imm_rename;
			out_uop_imm_sel <= _main_io_deq_bits_uop_imm_sel;
			out_uop_pimm <= _main_io_deq_bits_uop_pimm;
			out_uop_imm_packed <= _main_io_deq_bits_uop_imm_packed;
			out_uop_op1_sel <= _main_io_deq_bits_uop_op1_sel;
			out_uop_op2_sel <= _main_io_deq_bits_uop_op2_sel;
			out_uop_fp_ctrl_ldst <= _main_io_deq_bits_uop_fp_ctrl_ldst;
			out_uop_fp_ctrl_wen <= _main_io_deq_bits_uop_fp_ctrl_wen;
			out_uop_fp_ctrl_ren1 <= _main_io_deq_bits_uop_fp_ctrl_ren1;
			out_uop_fp_ctrl_ren2 <= _main_io_deq_bits_uop_fp_ctrl_ren2;
			out_uop_fp_ctrl_ren3 <= _main_io_deq_bits_uop_fp_ctrl_ren3;
			out_uop_fp_ctrl_swap12 <= _main_io_deq_bits_uop_fp_ctrl_swap12;
			out_uop_fp_ctrl_swap23 <= _main_io_deq_bits_uop_fp_ctrl_swap23;
			out_uop_fp_ctrl_typeTagIn <= _main_io_deq_bits_uop_fp_ctrl_typeTagIn;
			out_uop_fp_ctrl_typeTagOut <= _main_io_deq_bits_uop_fp_ctrl_typeTagOut;
			out_uop_fp_ctrl_fromint <= _main_io_deq_bits_uop_fp_ctrl_fromint;
			out_uop_fp_ctrl_toint <= _main_io_deq_bits_uop_fp_ctrl_toint;
			out_uop_fp_ctrl_fastpipe <= _main_io_deq_bits_uop_fp_ctrl_fastpipe;
			out_uop_fp_ctrl_fma <= _main_io_deq_bits_uop_fp_ctrl_fma;
			out_uop_fp_ctrl_div <= _main_io_deq_bits_uop_fp_ctrl_div;
			out_uop_fp_ctrl_sqrt <= _main_io_deq_bits_uop_fp_ctrl_sqrt;
			out_uop_fp_ctrl_wflags <= _main_io_deq_bits_uop_fp_ctrl_wflags;
			out_uop_fp_ctrl_vec <= _main_io_deq_bits_uop_fp_ctrl_vec;
			out_uop_rob_idx <= _main_io_deq_bits_uop_rob_idx;
			out_uop_ldq_idx <= _main_io_deq_bits_uop_ldq_idx;
			out_uop_stq_idx <= _main_io_deq_bits_uop_stq_idx;
			out_uop_rxq_idx <= _main_io_deq_bits_uop_rxq_idx;
			out_uop_pdst <= _main_io_deq_bits_uop_pdst;
			out_uop_prs1 <= _main_io_deq_bits_uop_prs1;
			out_uop_prs2 <= _main_io_deq_bits_uop_prs2;
			out_uop_prs3 <= _main_io_deq_bits_uop_prs3;
			out_uop_ppred <= _main_io_deq_bits_uop_ppred;
			out_uop_prs1_busy <= _main_io_deq_bits_uop_prs1_busy;
			out_uop_prs2_busy <= _main_io_deq_bits_uop_prs2_busy;
			out_uop_prs3_busy <= _main_io_deq_bits_uop_prs3_busy;
			out_uop_ppred_busy <= _main_io_deq_bits_uop_ppred_busy;
			out_uop_stale_pdst <= _main_io_deq_bits_uop_stale_pdst;
			out_uop_exception <= _main_io_deq_bits_uop_exception;
			out_uop_exc_cause <= _main_io_deq_bits_uop_exc_cause;
			out_uop_mem_cmd <= _main_io_deq_bits_uop_mem_cmd;
			out_uop_mem_size <= _main_io_deq_bits_uop_mem_size;
			out_uop_mem_signed <= _main_io_deq_bits_uop_mem_signed;
			out_uop_uses_ldq <= _main_io_deq_bits_uop_uses_ldq;
			out_uop_uses_stq <= _main_io_deq_bits_uop_uses_stq;
			out_uop_is_unique <= _main_io_deq_bits_uop_is_unique;
			out_uop_flush_on_commit <= _main_io_deq_bits_uop_flush_on_commit;
			out_uop_csr_cmd <= _main_io_deq_bits_uop_csr_cmd;
			out_uop_ldst_is_rs1 <= _main_io_deq_bits_uop_ldst_is_rs1;
			out_uop_ldst <= _main_io_deq_bits_uop_ldst;
			out_uop_lrs1 <= _main_io_deq_bits_uop_lrs1;
			out_uop_lrs2 <= _main_io_deq_bits_uop_lrs2;
			out_uop_lrs3 <= _main_io_deq_bits_uop_lrs3;
			out_uop_dst_rtype <= _main_io_deq_bits_uop_dst_rtype;
			out_uop_lrs1_rtype <= _main_io_deq_bits_uop_lrs1_rtype;
			out_uop_lrs2_rtype <= _main_io_deq_bits_uop_lrs2_rtype;
			out_uop_frs3_en <= _main_io_deq_bits_uop_frs3_en;
			out_uop_fcn_dw <= _main_io_deq_bits_uop_fcn_dw;
			out_uop_fcn_op <= _main_io_deq_bits_uop_fcn_op;
			out_uop_fp_val <= _main_io_deq_bits_uop_fp_val;
			out_uop_fp_rm <= _main_io_deq_bits_uop_fp_rm;
			out_uop_fp_typ <= _main_io_deq_bits_uop_fp_typ;
			out_uop_xcpt_pf_if <= _main_io_deq_bits_uop_xcpt_pf_if;
			out_uop_xcpt_ae_if <= _main_io_deq_bits_uop_xcpt_ae_if;
			out_uop_xcpt_ma_if <= _main_io_deq_bits_uop_xcpt_ma_if;
			out_uop_bp_debug_if <= _main_io_deq_bits_uop_bp_debug_if;
			out_uop_bp_xcpt_if <= _main_io_deq_bits_uop_bp_xcpt_if;
			out_uop_debug_fsrc <= _main_io_deq_bits_uop_debug_fsrc;
			out_uop_debug_tsrc <= _main_io_deq_bits_uop_debug_tsrc;
		end
		else
			out_uop_br_mask <= out_uop_br_mask & ~io_brupdate_b1_resolve_mask;
		if (reset)
			out_valid <= 1'h0;
		else if (_GEN)
			out_valid <= (_main_io_deq_valid & ((io_brupdate_b1_mispredict_mask & _main_io_deq_bits_uop_br_mask) == 8'h00)) & ~(io_flush & _main_io_deq_bits_uop_uses_ldq);
		else
			out_valid <= (out_valid & ((io_brupdate_b1_mispredict_mask & out_uop_br_mask) == 8'h00)) & ~(io_flush & out_uop_uses_ldq);
	end
	BranchKillableQueue main(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(io_enq_ready),
		.io_enq_valid(io_enq_valid),
		.io_enq_bits_uop_inst(io_enq_bits_uop_inst),
		.io_enq_bits_uop_debug_inst(io_enq_bits_uop_debug_inst),
		.io_enq_bits_uop_is_rvc(io_enq_bits_uop_is_rvc),
		.io_enq_bits_uop_debug_pc(io_enq_bits_uop_debug_pc),
		.io_enq_bits_uop_iq_type_0(io_enq_bits_uop_iq_type_0),
		.io_enq_bits_uop_iq_type_1(io_enq_bits_uop_iq_type_1),
		.io_enq_bits_uop_iq_type_2(io_enq_bits_uop_iq_type_2),
		.io_enq_bits_uop_iq_type_3(io_enq_bits_uop_iq_type_3),
		.io_enq_bits_uop_fu_code_0(io_enq_bits_uop_fu_code_0),
		.io_enq_bits_uop_fu_code_1(io_enq_bits_uop_fu_code_1),
		.io_enq_bits_uop_fu_code_2(io_enq_bits_uop_fu_code_2),
		.io_enq_bits_uop_fu_code_3(io_enq_bits_uop_fu_code_3),
		.io_enq_bits_uop_fu_code_4(io_enq_bits_uop_fu_code_4),
		.io_enq_bits_uop_fu_code_5(io_enq_bits_uop_fu_code_5),
		.io_enq_bits_uop_fu_code_6(io_enq_bits_uop_fu_code_6),
		.io_enq_bits_uop_fu_code_7(io_enq_bits_uop_fu_code_7),
		.io_enq_bits_uop_fu_code_8(io_enq_bits_uop_fu_code_8),
		.io_enq_bits_uop_fu_code_9(io_enq_bits_uop_fu_code_9),
		.io_enq_bits_uop_iw_issued(io_enq_bits_uop_iw_issued),
		.io_enq_bits_uop_iw_issued_partial_agen(io_enq_bits_uop_iw_issued_partial_agen),
		.io_enq_bits_uop_iw_issued_partial_dgen(io_enq_bits_uop_iw_issued_partial_dgen),
		.io_enq_bits_uop_iw_p1_speculative_child(io_enq_bits_uop_iw_p1_speculative_child),
		.io_enq_bits_uop_iw_p2_speculative_child(io_enq_bits_uop_iw_p2_speculative_child),
		.io_enq_bits_uop_iw_p1_bypass_hint(io_enq_bits_uop_iw_p1_bypass_hint),
		.io_enq_bits_uop_iw_p2_bypass_hint(io_enq_bits_uop_iw_p2_bypass_hint),
		.io_enq_bits_uop_iw_p3_bypass_hint(io_enq_bits_uop_iw_p3_bypass_hint),
		.io_enq_bits_uop_dis_col_sel(io_enq_bits_uop_dis_col_sel),
		.io_enq_bits_uop_br_mask(io_enq_bits_uop_br_mask),
		.io_enq_bits_uop_br_tag(io_enq_bits_uop_br_tag),
		.io_enq_bits_uop_br_type(io_enq_bits_uop_br_type),
		.io_enq_bits_uop_is_sfb(io_enq_bits_uop_is_sfb),
		.io_enq_bits_uop_is_fence(io_enq_bits_uop_is_fence),
		.io_enq_bits_uop_is_fencei(io_enq_bits_uop_is_fencei),
		.io_enq_bits_uop_is_sfence(io_enq_bits_uop_is_sfence),
		.io_enq_bits_uop_is_amo(io_enq_bits_uop_is_amo),
		.io_enq_bits_uop_is_eret(io_enq_bits_uop_is_eret),
		.io_enq_bits_uop_is_sys_pc2epc(io_enq_bits_uop_is_sys_pc2epc),
		.io_enq_bits_uop_is_rocc(io_enq_bits_uop_is_rocc),
		.io_enq_bits_uop_is_mov(io_enq_bits_uop_is_mov),
		.io_enq_bits_uop_ftq_idx(io_enq_bits_uop_ftq_idx),
		.io_enq_bits_uop_edge_inst(io_enq_bits_uop_edge_inst),
		.io_enq_bits_uop_pc_lob(io_enq_bits_uop_pc_lob),
		.io_enq_bits_uop_taken(io_enq_bits_uop_taken),
		.io_enq_bits_uop_imm_rename(io_enq_bits_uop_imm_rename),
		.io_enq_bits_uop_imm_sel(io_enq_bits_uop_imm_sel),
		.io_enq_bits_uop_pimm(io_enq_bits_uop_pimm),
		.io_enq_bits_uop_imm_packed(io_enq_bits_uop_imm_packed),
		.io_enq_bits_uop_op1_sel(io_enq_bits_uop_op1_sel),
		.io_enq_bits_uop_op2_sel(io_enq_bits_uop_op2_sel),
		.io_enq_bits_uop_fp_ctrl_ldst(io_enq_bits_uop_fp_ctrl_ldst),
		.io_enq_bits_uop_fp_ctrl_wen(io_enq_bits_uop_fp_ctrl_wen),
		.io_enq_bits_uop_fp_ctrl_ren1(io_enq_bits_uop_fp_ctrl_ren1),
		.io_enq_bits_uop_fp_ctrl_ren2(io_enq_bits_uop_fp_ctrl_ren2),
		.io_enq_bits_uop_fp_ctrl_ren3(io_enq_bits_uop_fp_ctrl_ren3),
		.io_enq_bits_uop_fp_ctrl_swap12(io_enq_bits_uop_fp_ctrl_swap12),
		.io_enq_bits_uop_fp_ctrl_swap23(io_enq_bits_uop_fp_ctrl_swap23),
		.io_enq_bits_uop_fp_ctrl_typeTagIn(io_enq_bits_uop_fp_ctrl_typeTagIn),
		.io_enq_bits_uop_fp_ctrl_typeTagOut(io_enq_bits_uop_fp_ctrl_typeTagOut),
		.io_enq_bits_uop_fp_ctrl_fromint(io_enq_bits_uop_fp_ctrl_fromint),
		.io_enq_bits_uop_fp_ctrl_toint(io_enq_bits_uop_fp_ctrl_toint),
		.io_enq_bits_uop_fp_ctrl_fastpipe(io_enq_bits_uop_fp_ctrl_fastpipe),
		.io_enq_bits_uop_fp_ctrl_fma(io_enq_bits_uop_fp_ctrl_fma),
		.io_enq_bits_uop_fp_ctrl_div(io_enq_bits_uop_fp_ctrl_div),
		.io_enq_bits_uop_fp_ctrl_sqrt(io_enq_bits_uop_fp_ctrl_sqrt),
		.io_enq_bits_uop_fp_ctrl_wflags(io_enq_bits_uop_fp_ctrl_wflags),
		.io_enq_bits_uop_fp_ctrl_vec(io_enq_bits_uop_fp_ctrl_vec),
		.io_enq_bits_uop_rob_idx(io_enq_bits_uop_rob_idx),
		.io_enq_bits_uop_ldq_idx(io_enq_bits_uop_ldq_idx),
		.io_enq_bits_uop_stq_idx(io_enq_bits_uop_stq_idx),
		.io_enq_bits_uop_rxq_idx(io_enq_bits_uop_rxq_idx),
		.io_enq_bits_uop_pdst(io_enq_bits_uop_pdst),
		.io_enq_bits_uop_prs1(io_enq_bits_uop_prs1),
		.io_enq_bits_uop_prs2(io_enq_bits_uop_prs2),
		.io_enq_bits_uop_prs3(io_enq_bits_uop_prs3),
		.io_enq_bits_uop_ppred(io_enq_bits_uop_ppred),
		.io_enq_bits_uop_prs1_busy(io_enq_bits_uop_prs1_busy),
		.io_enq_bits_uop_prs2_busy(io_enq_bits_uop_prs2_busy),
		.io_enq_bits_uop_prs3_busy(io_enq_bits_uop_prs3_busy),
		.io_enq_bits_uop_ppred_busy(io_enq_bits_uop_ppred_busy),
		.io_enq_bits_uop_stale_pdst(io_enq_bits_uop_stale_pdst),
		.io_enq_bits_uop_exception(io_enq_bits_uop_exception),
		.io_enq_bits_uop_exc_cause(io_enq_bits_uop_exc_cause),
		.io_enq_bits_uop_mem_cmd(io_enq_bits_uop_mem_cmd),
		.io_enq_bits_uop_mem_size(io_enq_bits_uop_mem_size),
		.io_enq_bits_uop_mem_signed(io_enq_bits_uop_mem_signed),
		.io_enq_bits_uop_uses_ldq(io_enq_bits_uop_uses_ldq),
		.io_enq_bits_uop_uses_stq(io_enq_bits_uop_uses_stq),
		.io_enq_bits_uop_is_unique(io_enq_bits_uop_is_unique),
		.io_enq_bits_uop_flush_on_commit(io_enq_bits_uop_flush_on_commit),
		.io_enq_bits_uop_csr_cmd(io_enq_bits_uop_csr_cmd),
		.io_enq_bits_uop_ldst_is_rs1(io_enq_bits_uop_ldst_is_rs1),
		.io_enq_bits_uop_ldst(io_enq_bits_uop_ldst),
		.io_enq_bits_uop_lrs1(io_enq_bits_uop_lrs1),
		.io_enq_bits_uop_lrs2(io_enq_bits_uop_lrs2),
		.io_enq_bits_uop_lrs3(io_enq_bits_uop_lrs3),
		.io_enq_bits_uop_dst_rtype(io_enq_bits_uop_dst_rtype),
		.io_enq_bits_uop_lrs1_rtype(io_enq_bits_uop_lrs1_rtype),
		.io_enq_bits_uop_lrs2_rtype(io_enq_bits_uop_lrs2_rtype),
		.io_enq_bits_uop_frs3_en(io_enq_bits_uop_frs3_en),
		.io_enq_bits_uop_fcn_dw(io_enq_bits_uop_fcn_dw),
		.io_enq_bits_uop_fcn_op(io_enq_bits_uop_fcn_op),
		.io_enq_bits_uop_fp_val(io_enq_bits_uop_fp_val),
		.io_enq_bits_uop_fp_rm(io_enq_bits_uop_fp_rm),
		.io_enq_bits_uop_fp_typ(io_enq_bits_uop_fp_typ),
		.io_enq_bits_uop_xcpt_pf_if(io_enq_bits_uop_xcpt_pf_if),
		.io_enq_bits_uop_xcpt_ae_if(io_enq_bits_uop_xcpt_ae_if),
		.io_enq_bits_uop_xcpt_ma_if(io_enq_bits_uop_xcpt_ma_if),
		.io_enq_bits_uop_bp_debug_if(io_enq_bits_uop_bp_debug_if),
		.io_enq_bits_uop_bp_xcpt_if(io_enq_bits_uop_bp_xcpt_if),
		.io_enq_bits_uop_debug_fsrc(io_enq_bits_uop_debug_fsrc),
		.io_enq_bits_uop_debug_tsrc(io_enq_bits_uop_debug_tsrc),
		.io_enq_bits_addr(io_enq_bits_addr),
		.io_enq_bits_data(io_enq_bits_data),
		.io_enq_bits_is_hella(io_enq_bits_is_hella),
		.io_enq_bits_tag_match(io_enq_bits_tag_match),
		.io_enq_bits_old_meta_coh_state(io_enq_bits_old_meta_coh_state),
		.io_enq_bits_old_meta_tag(io_enq_bits_old_meta_tag),
		.io_enq_bits_way_en(io_enq_bits_way_en),
		.io_enq_bits_sdq_id(io_enq_bits_sdq_id),
		.io_deq_ready(_GEN),
		.io_deq_valid(_main_io_deq_valid),
		.io_deq_bits_uop_inst(_main_io_deq_bits_uop_inst),
		.io_deq_bits_uop_debug_inst(_main_io_deq_bits_uop_debug_inst),
		.io_deq_bits_uop_is_rvc(_main_io_deq_bits_uop_is_rvc),
		.io_deq_bits_uop_debug_pc(_main_io_deq_bits_uop_debug_pc),
		.io_deq_bits_uop_iq_type_0(_main_io_deq_bits_uop_iq_type_0),
		.io_deq_bits_uop_iq_type_1(_main_io_deq_bits_uop_iq_type_1),
		.io_deq_bits_uop_iq_type_2(_main_io_deq_bits_uop_iq_type_2),
		.io_deq_bits_uop_iq_type_3(_main_io_deq_bits_uop_iq_type_3),
		.io_deq_bits_uop_fu_code_0(_main_io_deq_bits_uop_fu_code_0),
		.io_deq_bits_uop_fu_code_1(_main_io_deq_bits_uop_fu_code_1),
		.io_deq_bits_uop_fu_code_2(_main_io_deq_bits_uop_fu_code_2),
		.io_deq_bits_uop_fu_code_3(_main_io_deq_bits_uop_fu_code_3),
		.io_deq_bits_uop_fu_code_4(_main_io_deq_bits_uop_fu_code_4),
		.io_deq_bits_uop_fu_code_5(_main_io_deq_bits_uop_fu_code_5),
		.io_deq_bits_uop_fu_code_6(_main_io_deq_bits_uop_fu_code_6),
		.io_deq_bits_uop_fu_code_7(_main_io_deq_bits_uop_fu_code_7),
		.io_deq_bits_uop_fu_code_8(_main_io_deq_bits_uop_fu_code_8),
		.io_deq_bits_uop_fu_code_9(_main_io_deq_bits_uop_fu_code_9),
		.io_deq_bits_uop_iw_issued(_main_io_deq_bits_uop_iw_issued),
		.io_deq_bits_uop_iw_issued_partial_agen(_main_io_deq_bits_uop_iw_issued_partial_agen),
		.io_deq_bits_uop_iw_issued_partial_dgen(_main_io_deq_bits_uop_iw_issued_partial_dgen),
		.io_deq_bits_uop_iw_p1_speculative_child(_main_io_deq_bits_uop_iw_p1_speculative_child),
		.io_deq_bits_uop_iw_p2_speculative_child(_main_io_deq_bits_uop_iw_p2_speculative_child),
		.io_deq_bits_uop_iw_p1_bypass_hint(_main_io_deq_bits_uop_iw_p1_bypass_hint),
		.io_deq_bits_uop_iw_p2_bypass_hint(_main_io_deq_bits_uop_iw_p2_bypass_hint),
		.io_deq_bits_uop_iw_p3_bypass_hint(_main_io_deq_bits_uop_iw_p3_bypass_hint),
		.io_deq_bits_uop_dis_col_sel(_main_io_deq_bits_uop_dis_col_sel),
		.io_deq_bits_uop_br_mask(_main_io_deq_bits_uop_br_mask),
		.io_deq_bits_uop_br_tag(_main_io_deq_bits_uop_br_tag),
		.io_deq_bits_uop_br_type(_main_io_deq_bits_uop_br_type),
		.io_deq_bits_uop_is_sfb(_main_io_deq_bits_uop_is_sfb),
		.io_deq_bits_uop_is_fence(_main_io_deq_bits_uop_is_fence),
		.io_deq_bits_uop_is_fencei(_main_io_deq_bits_uop_is_fencei),
		.io_deq_bits_uop_is_sfence(_main_io_deq_bits_uop_is_sfence),
		.io_deq_bits_uop_is_amo(_main_io_deq_bits_uop_is_amo),
		.io_deq_bits_uop_is_eret(_main_io_deq_bits_uop_is_eret),
		.io_deq_bits_uop_is_sys_pc2epc(_main_io_deq_bits_uop_is_sys_pc2epc),
		.io_deq_bits_uop_is_rocc(_main_io_deq_bits_uop_is_rocc),
		.io_deq_bits_uop_is_mov(_main_io_deq_bits_uop_is_mov),
		.io_deq_bits_uop_ftq_idx(_main_io_deq_bits_uop_ftq_idx),
		.io_deq_bits_uop_edge_inst(_main_io_deq_bits_uop_edge_inst),
		.io_deq_bits_uop_pc_lob(_main_io_deq_bits_uop_pc_lob),
		.io_deq_bits_uop_taken(_main_io_deq_bits_uop_taken),
		.io_deq_bits_uop_imm_rename(_main_io_deq_bits_uop_imm_rename),
		.io_deq_bits_uop_imm_sel(_main_io_deq_bits_uop_imm_sel),
		.io_deq_bits_uop_pimm(_main_io_deq_bits_uop_pimm),
		.io_deq_bits_uop_imm_packed(_main_io_deq_bits_uop_imm_packed),
		.io_deq_bits_uop_op1_sel(_main_io_deq_bits_uop_op1_sel),
		.io_deq_bits_uop_op2_sel(_main_io_deq_bits_uop_op2_sel),
		.io_deq_bits_uop_fp_ctrl_ldst(_main_io_deq_bits_uop_fp_ctrl_ldst),
		.io_deq_bits_uop_fp_ctrl_wen(_main_io_deq_bits_uop_fp_ctrl_wen),
		.io_deq_bits_uop_fp_ctrl_ren1(_main_io_deq_bits_uop_fp_ctrl_ren1),
		.io_deq_bits_uop_fp_ctrl_ren2(_main_io_deq_bits_uop_fp_ctrl_ren2),
		.io_deq_bits_uop_fp_ctrl_ren3(_main_io_deq_bits_uop_fp_ctrl_ren3),
		.io_deq_bits_uop_fp_ctrl_swap12(_main_io_deq_bits_uop_fp_ctrl_swap12),
		.io_deq_bits_uop_fp_ctrl_swap23(_main_io_deq_bits_uop_fp_ctrl_swap23),
		.io_deq_bits_uop_fp_ctrl_typeTagIn(_main_io_deq_bits_uop_fp_ctrl_typeTagIn),
		.io_deq_bits_uop_fp_ctrl_typeTagOut(_main_io_deq_bits_uop_fp_ctrl_typeTagOut),
		.io_deq_bits_uop_fp_ctrl_fromint(_main_io_deq_bits_uop_fp_ctrl_fromint),
		.io_deq_bits_uop_fp_ctrl_toint(_main_io_deq_bits_uop_fp_ctrl_toint),
		.io_deq_bits_uop_fp_ctrl_fastpipe(_main_io_deq_bits_uop_fp_ctrl_fastpipe),
		.io_deq_bits_uop_fp_ctrl_fma(_main_io_deq_bits_uop_fp_ctrl_fma),
		.io_deq_bits_uop_fp_ctrl_div(_main_io_deq_bits_uop_fp_ctrl_div),
		.io_deq_bits_uop_fp_ctrl_sqrt(_main_io_deq_bits_uop_fp_ctrl_sqrt),
		.io_deq_bits_uop_fp_ctrl_wflags(_main_io_deq_bits_uop_fp_ctrl_wflags),
		.io_deq_bits_uop_fp_ctrl_vec(_main_io_deq_bits_uop_fp_ctrl_vec),
		.io_deq_bits_uop_rob_idx(_main_io_deq_bits_uop_rob_idx),
		.io_deq_bits_uop_ldq_idx(_main_io_deq_bits_uop_ldq_idx),
		.io_deq_bits_uop_stq_idx(_main_io_deq_bits_uop_stq_idx),
		.io_deq_bits_uop_rxq_idx(_main_io_deq_bits_uop_rxq_idx),
		.io_deq_bits_uop_pdst(_main_io_deq_bits_uop_pdst),
		.io_deq_bits_uop_prs1(_main_io_deq_bits_uop_prs1),
		.io_deq_bits_uop_prs2(_main_io_deq_bits_uop_prs2),
		.io_deq_bits_uop_prs3(_main_io_deq_bits_uop_prs3),
		.io_deq_bits_uop_ppred(_main_io_deq_bits_uop_ppred),
		.io_deq_bits_uop_prs1_busy(_main_io_deq_bits_uop_prs1_busy),
		.io_deq_bits_uop_prs2_busy(_main_io_deq_bits_uop_prs2_busy),
		.io_deq_bits_uop_prs3_busy(_main_io_deq_bits_uop_prs3_busy),
		.io_deq_bits_uop_ppred_busy(_main_io_deq_bits_uop_ppred_busy),
		.io_deq_bits_uop_stale_pdst(_main_io_deq_bits_uop_stale_pdst),
		.io_deq_bits_uop_exception(_main_io_deq_bits_uop_exception),
		.io_deq_bits_uop_exc_cause(_main_io_deq_bits_uop_exc_cause),
		.io_deq_bits_uop_mem_cmd(_main_io_deq_bits_uop_mem_cmd),
		.io_deq_bits_uop_mem_size(_main_io_deq_bits_uop_mem_size),
		.io_deq_bits_uop_mem_signed(_main_io_deq_bits_uop_mem_signed),
		.io_deq_bits_uop_uses_ldq(_main_io_deq_bits_uop_uses_ldq),
		.io_deq_bits_uop_uses_stq(_main_io_deq_bits_uop_uses_stq),
		.io_deq_bits_uop_is_unique(_main_io_deq_bits_uop_is_unique),
		.io_deq_bits_uop_flush_on_commit(_main_io_deq_bits_uop_flush_on_commit),
		.io_deq_bits_uop_csr_cmd(_main_io_deq_bits_uop_csr_cmd),
		.io_deq_bits_uop_ldst_is_rs1(_main_io_deq_bits_uop_ldst_is_rs1),
		.io_deq_bits_uop_ldst(_main_io_deq_bits_uop_ldst),
		.io_deq_bits_uop_lrs1(_main_io_deq_bits_uop_lrs1),
		.io_deq_bits_uop_lrs2(_main_io_deq_bits_uop_lrs2),
		.io_deq_bits_uop_lrs3(_main_io_deq_bits_uop_lrs3),
		.io_deq_bits_uop_dst_rtype(_main_io_deq_bits_uop_dst_rtype),
		.io_deq_bits_uop_lrs1_rtype(_main_io_deq_bits_uop_lrs1_rtype),
		.io_deq_bits_uop_lrs2_rtype(_main_io_deq_bits_uop_lrs2_rtype),
		.io_deq_bits_uop_frs3_en(_main_io_deq_bits_uop_frs3_en),
		.io_deq_bits_uop_fcn_dw(_main_io_deq_bits_uop_fcn_dw),
		.io_deq_bits_uop_fcn_op(_main_io_deq_bits_uop_fcn_op),
		.io_deq_bits_uop_fp_val(_main_io_deq_bits_uop_fp_val),
		.io_deq_bits_uop_fp_rm(_main_io_deq_bits_uop_fp_rm),
		.io_deq_bits_uop_fp_typ(_main_io_deq_bits_uop_fp_typ),
		.io_deq_bits_uop_xcpt_pf_if(_main_io_deq_bits_uop_xcpt_pf_if),
		.io_deq_bits_uop_xcpt_ae_if(_main_io_deq_bits_uop_xcpt_ae_if),
		.io_deq_bits_uop_xcpt_ma_if(_main_io_deq_bits_uop_xcpt_ma_if),
		.io_deq_bits_uop_bp_debug_if(_main_io_deq_bits_uop_bp_debug_if),
		.io_deq_bits_uop_bp_xcpt_if(_main_io_deq_bits_uop_bp_xcpt_if),
		.io_deq_bits_uop_debug_fsrc(_main_io_deq_bits_uop_debug_fsrc),
		.io_deq_bits_uop_debug_tsrc(_main_io_deq_bits_uop_debug_tsrc),
		.io_deq_bits_addr(_main_io_deq_bits_addr),
		.io_deq_bits_data(_main_io_deq_bits_data),
		.io_deq_bits_is_hella(_main_io_deq_bits_is_hella),
		.io_deq_bits_way_en(_main_io_deq_bits_way_en),
		.io_deq_bits_sdq_id(_main_io_deq_bits_sdq_id),
		.io_brupdate_b1_resolve_mask(io_brupdate_b1_resolve_mask),
		.io_brupdate_b1_mispredict_mask(io_brupdate_b1_mispredict_mask),
		.io_flush(io_flush),
		.io_empty(_main_io_empty)
	);
	assign io_deq_valid = out_valid;
	assign io_deq_bits_uop_inst = out_uop_inst;
	assign io_deq_bits_uop_debug_inst = out_uop_debug_inst;
	assign io_deq_bits_uop_is_rvc = out_uop_is_rvc;
	assign io_deq_bits_uop_debug_pc = out_uop_debug_pc;
	assign io_deq_bits_uop_iq_type_0 = out_uop_iq_type_0;
	assign io_deq_bits_uop_iq_type_1 = out_uop_iq_type_1;
	assign io_deq_bits_uop_iq_type_2 = out_uop_iq_type_2;
	assign io_deq_bits_uop_iq_type_3 = out_uop_iq_type_3;
	assign io_deq_bits_uop_fu_code_0 = out_uop_fu_code_0;
	assign io_deq_bits_uop_fu_code_1 = out_uop_fu_code_1;
	assign io_deq_bits_uop_fu_code_2 = out_uop_fu_code_2;
	assign io_deq_bits_uop_fu_code_3 = out_uop_fu_code_3;
	assign io_deq_bits_uop_fu_code_4 = out_uop_fu_code_4;
	assign io_deq_bits_uop_fu_code_5 = out_uop_fu_code_5;
	assign io_deq_bits_uop_fu_code_6 = out_uop_fu_code_6;
	assign io_deq_bits_uop_fu_code_7 = out_uop_fu_code_7;
	assign io_deq_bits_uop_fu_code_8 = out_uop_fu_code_8;
	assign io_deq_bits_uop_fu_code_9 = out_uop_fu_code_9;
	assign io_deq_bits_uop_iw_issued = out_uop_iw_issued;
	assign io_deq_bits_uop_iw_issued_partial_agen = out_uop_iw_issued_partial_agen;
	assign io_deq_bits_uop_iw_issued_partial_dgen = out_uop_iw_issued_partial_dgen;
	assign io_deq_bits_uop_iw_p1_speculative_child = out_uop_iw_p1_speculative_child;
	assign io_deq_bits_uop_iw_p2_speculative_child = out_uop_iw_p2_speculative_child;
	assign io_deq_bits_uop_iw_p1_bypass_hint = out_uop_iw_p1_bypass_hint;
	assign io_deq_bits_uop_iw_p2_bypass_hint = out_uop_iw_p2_bypass_hint;
	assign io_deq_bits_uop_iw_p3_bypass_hint = out_uop_iw_p3_bypass_hint;
	assign io_deq_bits_uop_dis_col_sel = out_uop_dis_col_sel;
	assign io_deq_bits_uop_br_mask = out_uop_br_mask;
	assign io_deq_bits_uop_br_tag = out_uop_br_tag;
	assign io_deq_bits_uop_br_type = out_uop_br_type;
	assign io_deq_bits_uop_is_sfb = out_uop_is_sfb;
	assign io_deq_bits_uop_is_fence = out_uop_is_fence;
	assign io_deq_bits_uop_is_fencei = out_uop_is_fencei;
	assign io_deq_bits_uop_is_sfence = out_uop_is_sfence;
	assign io_deq_bits_uop_is_amo = out_uop_is_amo;
	assign io_deq_bits_uop_is_eret = out_uop_is_eret;
	assign io_deq_bits_uop_is_sys_pc2epc = out_uop_is_sys_pc2epc;
	assign io_deq_bits_uop_is_rocc = out_uop_is_rocc;
	assign io_deq_bits_uop_is_mov = out_uop_is_mov;
	assign io_deq_bits_uop_ftq_idx = out_uop_ftq_idx;
	assign io_deq_bits_uop_edge_inst = out_uop_edge_inst;
	assign io_deq_bits_uop_pc_lob = out_uop_pc_lob;
	assign io_deq_bits_uop_taken = out_uop_taken;
	assign io_deq_bits_uop_imm_rename = out_uop_imm_rename;
	assign io_deq_bits_uop_imm_sel = out_uop_imm_sel;
	assign io_deq_bits_uop_pimm = out_uop_pimm;
	assign io_deq_bits_uop_imm_packed = out_uop_imm_packed;
	assign io_deq_bits_uop_op1_sel = out_uop_op1_sel;
	assign io_deq_bits_uop_op2_sel = out_uop_op2_sel;
	assign io_deq_bits_uop_fp_ctrl_ldst = out_uop_fp_ctrl_ldst;
	assign io_deq_bits_uop_fp_ctrl_wen = out_uop_fp_ctrl_wen;
	assign io_deq_bits_uop_fp_ctrl_ren1 = out_uop_fp_ctrl_ren1;
	assign io_deq_bits_uop_fp_ctrl_ren2 = out_uop_fp_ctrl_ren2;
	assign io_deq_bits_uop_fp_ctrl_ren3 = out_uop_fp_ctrl_ren3;
	assign io_deq_bits_uop_fp_ctrl_swap12 = out_uop_fp_ctrl_swap12;
	assign io_deq_bits_uop_fp_ctrl_swap23 = out_uop_fp_ctrl_swap23;
	assign io_deq_bits_uop_fp_ctrl_typeTagIn = out_uop_fp_ctrl_typeTagIn;
	assign io_deq_bits_uop_fp_ctrl_typeTagOut = out_uop_fp_ctrl_typeTagOut;
	assign io_deq_bits_uop_fp_ctrl_fromint = out_uop_fp_ctrl_fromint;
	assign io_deq_bits_uop_fp_ctrl_toint = out_uop_fp_ctrl_toint;
	assign io_deq_bits_uop_fp_ctrl_fastpipe = out_uop_fp_ctrl_fastpipe;
	assign io_deq_bits_uop_fp_ctrl_fma = out_uop_fp_ctrl_fma;
	assign io_deq_bits_uop_fp_ctrl_div = out_uop_fp_ctrl_div;
	assign io_deq_bits_uop_fp_ctrl_sqrt = out_uop_fp_ctrl_sqrt;
	assign io_deq_bits_uop_fp_ctrl_wflags = out_uop_fp_ctrl_wflags;
	assign io_deq_bits_uop_fp_ctrl_vec = out_uop_fp_ctrl_vec;
	assign io_deq_bits_uop_rob_idx = out_uop_rob_idx;
	assign io_deq_bits_uop_ldq_idx = out_uop_ldq_idx;
	assign io_deq_bits_uop_stq_idx = out_uop_stq_idx;
	assign io_deq_bits_uop_rxq_idx = out_uop_rxq_idx;
	assign io_deq_bits_uop_pdst = out_uop_pdst;
	assign io_deq_bits_uop_prs1 = out_uop_prs1;
	assign io_deq_bits_uop_prs2 = out_uop_prs2;
	assign io_deq_bits_uop_prs3 = out_uop_prs3;
	assign io_deq_bits_uop_ppred = out_uop_ppred;
	assign io_deq_bits_uop_prs1_busy = out_uop_prs1_busy;
	assign io_deq_bits_uop_prs2_busy = out_uop_prs2_busy;
	assign io_deq_bits_uop_prs3_busy = out_uop_prs3_busy;
	assign io_deq_bits_uop_ppred_busy = out_uop_ppred_busy;
	assign io_deq_bits_uop_stale_pdst = out_uop_stale_pdst;
	assign io_deq_bits_uop_exception = out_uop_exception;
	assign io_deq_bits_uop_exc_cause = out_uop_exc_cause;
	assign io_deq_bits_uop_mem_cmd = out_uop_mem_cmd;
	assign io_deq_bits_uop_mem_size = out_uop_mem_size;
	assign io_deq_bits_uop_mem_signed = out_uop_mem_signed;
	assign io_deq_bits_uop_uses_ldq = out_uop_uses_ldq;
	assign io_deq_bits_uop_uses_stq = out_uop_uses_stq;
	assign io_deq_bits_uop_is_unique = out_uop_is_unique;
	assign io_deq_bits_uop_flush_on_commit = out_uop_flush_on_commit;
	assign io_deq_bits_uop_csr_cmd = out_uop_csr_cmd;
	assign io_deq_bits_uop_ldst_is_rs1 = out_uop_ldst_is_rs1;
	assign io_deq_bits_uop_ldst = out_uop_ldst;
	assign io_deq_bits_uop_lrs1 = out_uop_lrs1;
	assign io_deq_bits_uop_lrs2 = out_uop_lrs2;
	assign io_deq_bits_uop_lrs3 = out_uop_lrs3;
	assign io_deq_bits_uop_dst_rtype = out_uop_dst_rtype;
	assign io_deq_bits_uop_lrs1_rtype = out_uop_lrs1_rtype;
	assign io_deq_bits_uop_lrs2_rtype = out_uop_lrs2_rtype;
	assign io_deq_bits_uop_frs3_en = out_uop_frs3_en;
	assign io_deq_bits_uop_fcn_dw = out_uop_fcn_dw;
	assign io_deq_bits_uop_fcn_op = out_uop_fcn_op;
	assign io_deq_bits_uop_fp_val = out_uop_fp_val;
	assign io_deq_bits_uop_fp_rm = out_uop_fp_rm;
	assign io_deq_bits_uop_fp_typ = out_uop_fp_typ;
	assign io_deq_bits_uop_xcpt_pf_if = out_uop_xcpt_pf_if;
	assign io_deq_bits_uop_xcpt_ae_if = out_uop_xcpt_ae_if;
	assign io_deq_bits_uop_xcpt_ma_if = out_uop_xcpt_ma_if;
	assign io_deq_bits_uop_bp_debug_if = out_uop_bp_debug_if;
	assign io_deq_bits_uop_bp_xcpt_if = out_uop_bp_xcpt_if;
	assign io_deq_bits_uop_debug_fsrc = out_uop_debug_fsrc;
	assign io_deq_bits_uop_debug_tsrc = out_uop_debug_tsrc;
	assign io_deq_bits_addr = out_reg_addr;
	assign io_deq_bits_data = out_reg_data;
	assign io_deq_bits_is_hella = out_reg_is_hella;
	assign io_deq_bits_way_en = out_reg_way_en;
	assign io_deq_bits_sdq_id = out_reg_sdq_id;
	assign io_empty = _main_io_empty & ~out_valid;
endmodule
