module Queue4_STQEntry (
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
	io_enq_bits_addr_valid,
	io_enq_bits_addr_bits,
	io_enq_bits_addr_is_virtual,
	io_enq_bits_data_valid,
	io_enq_bits_data_bits,
	io_enq_bits_committed,
	io_enq_bits_succeeded,
	io_enq_bits_can_execute,
	io_enq_bits_cleared,
	io_enq_bits_next_ldq_idx,
	io_enq_bits_debug_wb_data,
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
	io_deq_bits_addr_bits,
	io_deq_bits_data_bits
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
	input io_enq_bits_addr_valid;
	input [39:0] io_enq_bits_addr_bits;
	input io_enq_bits_addr_is_virtual;
	input io_enq_bits_data_valid;
	input [63:0] io_enq_bits_data_bits;
	input io_enq_bits_committed;
	input io_enq_bits_succeeded;
	input io_enq_bits_can_execute;
	input io_enq_bits_cleared;
	input [3:0] io_enq_bits_next_ldq_idx;
	input [63:0] io_enq_bits_debug_wb_data;
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
	output wire [39:0] io_deq_bits_addr_bits;
	output wire [63:0] io_deq_bits_data_bits;
	wire [508:0] _ram_ext_R0_data;
	reg [1:0] enq_ptr_value;
	reg [1:0] deq_ptr_value;
	reg maybe_full;
	wire ptr_match = enq_ptr_value == deq_ptr_value;
	wire empty = ptr_match & ~maybe_full;
	wire full = ptr_match & maybe_full;
	wire do_enq = ~full & io_enq_valid;
	always @(posedge clock)
		if (reset) begin
			enq_ptr_value <= 2'h0;
			deq_ptr_value <= 2'h0;
			maybe_full <= 1'h0;
		end
		else begin : sv2v_autoblock_1
			reg do_deq;
			do_deq = io_deq_ready & ~empty;
			if (do_enq)
				enq_ptr_value <= enq_ptr_value + 2'h1;
			if (do_deq)
				deq_ptr_value <= deq_ptr_value + 2'h1;
			if (~(do_enq == do_deq))
				maybe_full <= do_enq;
		end
	ram_4x509 ram_ext(
		.R0_addr(deq_ptr_value),
		.R0_en(1'h1),
		.R0_clk(clock),
		.R0_data(_ram_ext_R0_data),
		.W0_addr(enq_ptr_value),
		.W0_en(do_enq),
		.W0_clk(clock),
		.W0_data({io_enq_bits_data_bits, io_enq_bits_addr_bits, io_enq_bits_uop_debug_tsrc, io_enq_bits_uop_debug_fsrc, io_enq_bits_uop_bp_xcpt_if, io_enq_bits_uop_bp_debug_if, io_enq_bits_uop_xcpt_ma_if, io_enq_bits_uop_xcpt_ae_if, io_enq_bits_uop_xcpt_pf_if, io_enq_bits_uop_fp_typ, io_enq_bits_uop_fp_rm, io_enq_bits_uop_fp_val, io_enq_bits_uop_fcn_op, io_enq_bits_uop_fcn_dw, io_enq_bits_uop_frs3_en, io_enq_bits_uop_lrs2_rtype, io_enq_bits_uop_lrs1_rtype, io_enq_bits_uop_dst_rtype, io_enq_bits_uop_lrs3, io_enq_bits_uop_lrs2, io_enq_bits_uop_lrs1, io_enq_bits_uop_ldst, io_enq_bits_uop_ldst_is_rs1, io_enq_bits_uop_csr_cmd, io_enq_bits_uop_flush_on_commit, io_enq_bits_uop_is_unique, io_enq_bits_uop_uses_stq, io_enq_bits_uop_uses_ldq, io_enq_bits_uop_mem_signed, io_enq_bits_uop_mem_size, io_enq_bits_uop_mem_cmd, io_enq_bits_uop_exc_cause, io_enq_bits_uop_exception, io_enq_bits_uop_stale_pdst, io_enq_bits_uop_ppred_busy, io_enq_bits_uop_prs3_busy, io_enq_bits_uop_prs2_busy, io_enq_bits_uop_prs1_busy, io_enq_bits_uop_ppred, io_enq_bits_uop_prs3, io_enq_bits_uop_prs2, io_enq_bits_uop_prs1, io_enq_bits_uop_pdst, io_enq_bits_uop_rxq_idx, io_enq_bits_uop_stq_idx, io_enq_bits_uop_ldq_idx, io_enq_bits_uop_rob_idx, io_enq_bits_uop_fp_ctrl_vec, io_enq_bits_uop_fp_ctrl_wflags, io_enq_bits_uop_fp_ctrl_sqrt, io_enq_bits_uop_fp_ctrl_div, io_enq_bits_uop_fp_ctrl_fma, io_enq_bits_uop_fp_ctrl_fastpipe, io_enq_bits_uop_fp_ctrl_toint, io_enq_bits_uop_fp_ctrl_fromint, io_enq_bits_uop_fp_ctrl_typeTagOut, io_enq_bits_uop_fp_ctrl_typeTagIn, io_enq_bits_uop_fp_ctrl_swap23, io_enq_bits_uop_fp_ctrl_swap12, io_enq_bits_uop_fp_ctrl_ren3, io_enq_bits_uop_fp_ctrl_ren2, io_enq_bits_uop_fp_ctrl_ren1, io_enq_bits_uop_fp_ctrl_wen, io_enq_bits_uop_fp_ctrl_ldst, io_enq_bits_uop_op2_sel, io_enq_bits_uop_op1_sel, io_enq_bits_uop_imm_packed, io_enq_bits_uop_pimm, io_enq_bits_uop_imm_sel, io_enq_bits_uop_imm_rename, io_enq_bits_uop_taken, io_enq_bits_uop_pc_lob, io_enq_bits_uop_edge_inst, io_enq_bits_uop_ftq_idx, io_enq_bits_uop_is_mov, io_enq_bits_uop_is_rocc, io_enq_bits_uop_is_sys_pc2epc, io_enq_bits_uop_is_eret, io_enq_bits_uop_is_amo, io_enq_bits_uop_is_sfence, io_enq_bits_uop_is_fencei, io_enq_bits_uop_is_fence, io_enq_bits_uop_is_sfb, io_enq_bits_uop_br_type, io_enq_bits_uop_br_tag, io_enq_bits_uop_br_mask, 1'h0, io_enq_bits_uop_iw_p3_bypass_hint, io_enq_bits_uop_iw_p2_bypass_hint, io_enq_bits_uop_iw_p1_bypass_hint, io_enq_bits_uop_iw_p2_speculative_child, io_enq_bits_uop_iw_p1_speculative_child, io_enq_bits_uop_iw_issued_partial_dgen, io_enq_bits_uop_iw_issued_partial_agen, io_enq_bits_uop_iw_issued, io_enq_bits_uop_fu_code_9, io_enq_bits_uop_fu_code_8, io_enq_bits_uop_fu_code_7, io_enq_bits_uop_fu_code_6, io_enq_bits_uop_fu_code_5, io_enq_bits_uop_fu_code_4, io_enq_bits_uop_fu_code_3, io_enq_bits_uop_fu_code_2, io_enq_bits_uop_fu_code_1, io_enq_bits_uop_fu_code_0, io_enq_bits_uop_iq_type_3, io_enq_bits_uop_iq_type_2, io_enq_bits_uop_iq_type_1, io_enq_bits_uop_iq_type_0, io_enq_bits_uop_debug_pc, io_enq_bits_uop_is_rvc, io_enq_bits_uop_debug_inst, io_enq_bits_uop_inst})
	);
	assign io_enq_ready = ~full;
	assign io_deq_valid = ~empty;
	assign io_deq_bits_uop_inst = _ram_ext_R0_data[31:0];
	assign io_deq_bits_uop_debug_inst = _ram_ext_R0_data[63:32];
	assign io_deq_bits_uop_is_rvc = _ram_ext_R0_data[64];
	assign io_deq_bits_uop_debug_pc = _ram_ext_R0_data[104:65];
	assign io_deq_bits_uop_iq_type_0 = _ram_ext_R0_data[105];
	assign io_deq_bits_uop_iq_type_1 = _ram_ext_R0_data[106];
	assign io_deq_bits_uop_iq_type_2 = _ram_ext_R0_data[107];
	assign io_deq_bits_uop_iq_type_3 = _ram_ext_R0_data[108];
	assign io_deq_bits_uop_fu_code_0 = _ram_ext_R0_data[109];
	assign io_deq_bits_uop_fu_code_1 = _ram_ext_R0_data[110];
	assign io_deq_bits_uop_fu_code_2 = _ram_ext_R0_data[111];
	assign io_deq_bits_uop_fu_code_3 = _ram_ext_R0_data[112];
	assign io_deq_bits_uop_fu_code_4 = _ram_ext_R0_data[113];
	assign io_deq_bits_uop_fu_code_5 = _ram_ext_R0_data[114];
	assign io_deq_bits_uop_fu_code_6 = _ram_ext_R0_data[115];
	assign io_deq_bits_uop_fu_code_7 = _ram_ext_R0_data[116];
	assign io_deq_bits_uop_fu_code_8 = _ram_ext_R0_data[117];
	assign io_deq_bits_uop_fu_code_9 = _ram_ext_R0_data[118];
	assign io_deq_bits_uop_iw_issued = _ram_ext_R0_data[119];
	assign io_deq_bits_uop_iw_issued_partial_agen = _ram_ext_R0_data[120];
	assign io_deq_bits_uop_iw_issued_partial_dgen = _ram_ext_R0_data[121];
	assign io_deq_bits_uop_iw_p1_speculative_child = _ram_ext_R0_data[122];
	assign io_deq_bits_uop_iw_p2_speculative_child = _ram_ext_R0_data[123];
	assign io_deq_bits_uop_iw_p1_bypass_hint = _ram_ext_R0_data[124];
	assign io_deq_bits_uop_iw_p2_bypass_hint = _ram_ext_R0_data[125];
	assign io_deq_bits_uop_iw_p3_bypass_hint = _ram_ext_R0_data[126];
	assign io_deq_bits_uop_dis_col_sel = _ram_ext_R0_data[127];
	assign io_deq_bits_uop_br_mask = _ram_ext_R0_data[135:128];
	assign io_deq_bits_uop_br_tag = _ram_ext_R0_data[138:136];
	assign io_deq_bits_uop_br_type = _ram_ext_R0_data[142:139];
	assign io_deq_bits_uop_is_sfb = _ram_ext_R0_data[143];
	assign io_deq_bits_uop_is_fence = _ram_ext_R0_data[144];
	assign io_deq_bits_uop_is_fencei = _ram_ext_R0_data[145];
	assign io_deq_bits_uop_is_sfence = _ram_ext_R0_data[146];
	assign io_deq_bits_uop_is_amo = _ram_ext_R0_data[147];
	assign io_deq_bits_uop_is_eret = _ram_ext_R0_data[148];
	assign io_deq_bits_uop_is_sys_pc2epc = _ram_ext_R0_data[149];
	assign io_deq_bits_uop_is_rocc = _ram_ext_R0_data[150];
	assign io_deq_bits_uop_is_mov = _ram_ext_R0_data[151];
	assign io_deq_bits_uop_ftq_idx = _ram_ext_R0_data[155:152];
	assign io_deq_bits_uop_edge_inst = _ram_ext_R0_data[156];
	assign io_deq_bits_uop_pc_lob = _ram_ext_R0_data[162:157];
	assign io_deq_bits_uop_taken = _ram_ext_R0_data[163];
	assign io_deq_bits_uop_imm_rename = _ram_ext_R0_data[164];
	assign io_deq_bits_uop_imm_sel = _ram_ext_R0_data[167:165];
	assign io_deq_bits_uop_pimm = _ram_ext_R0_data[172:168];
	assign io_deq_bits_uop_imm_packed = _ram_ext_R0_data[192:173];
	assign io_deq_bits_uop_op1_sel = _ram_ext_R0_data[194:193];
	assign io_deq_bits_uop_op2_sel = _ram_ext_R0_data[197:195];
	assign io_deq_bits_uop_fp_ctrl_ldst = _ram_ext_R0_data[198];
	assign io_deq_bits_uop_fp_ctrl_wen = _ram_ext_R0_data[199];
	assign io_deq_bits_uop_fp_ctrl_ren1 = _ram_ext_R0_data[200];
	assign io_deq_bits_uop_fp_ctrl_ren2 = _ram_ext_R0_data[201];
	assign io_deq_bits_uop_fp_ctrl_ren3 = _ram_ext_R0_data[202];
	assign io_deq_bits_uop_fp_ctrl_swap12 = _ram_ext_R0_data[203];
	assign io_deq_bits_uop_fp_ctrl_swap23 = _ram_ext_R0_data[204];
	assign io_deq_bits_uop_fp_ctrl_typeTagIn = _ram_ext_R0_data[206:205];
	assign io_deq_bits_uop_fp_ctrl_typeTagOut = _ram_ext_R0_data[208:207];
	assign io_deq_bits_uop_fp_ctrl_fromint = _ram_ext_R0_data[209];
	assign io_deq_bits_uop_fp_ctrl_toint = _ram_ext_R0_data[210];
	assign io_deq_bits_uop_fp_ctrl_fastpipe = _ram_ext_R0_data[211];
	assign io_deq_bits_uop_fp_ctrl_fma = _ram_ext_R0_data[212];
	assign io_deq_bits_uop_fp_ctrl_div = _ram_ext_R0_data[213];
	assign io_deq_bits_uop_fp_ctrl_sqrt = _ram_ext_R0_data[214];
	assign io_deq_bits_uop_fp_ctrl_wflags = _ram_ext_R0_data[215];
	assign io_deq_bits_uop_fp_ctrl_vec = _ram_ext_R0_data[216];
	assign io_deq_bits_uop_rob_idx = _ram_ext_R0_data[221:217];
	assign io_deq_bits_uop_ldq_idx = _ram_ext_R0_data[225:222];
	assign io_deq_bits_uop_stq_idx = _ram_ext_R0_data[229:226];
	assign io_deq_bits_uop_rxq_idx = _ram_ext_R0_data[231:230];
	assign io_deq_bits_uop_pdst = _ram_ext_R0_data[237:232];
	assign io_deq_bits_uop_prs1 = _ram_ext_R0_data[243:238];
	assign io_deq_bits_uop_prs2 = _ram_ext_R0_data[249:244];
	assign io_deq_bits_uop_prs3 = _ram_ext_R0_data[255:250];
	assign io_deq_bits_uop_ppred = _ram_ext_R0_data[259:256];
	assign io_deq_bits_uop_prs1_busy = _ram_ext_R0_data[260];
	assign io_deq_bits_uop_prs2_busy = _ram_ext_R0_data[261];
	assign io_deq_bits_uop_prs3_busy = _ram_ext_R0_data[262];
	assign io_deq_bits_uop_ppred_busy = _ram_ext_R0_data[263];
	assign io_deq_bits_uop_stale_pdst = _ram_ext_R0_data[269:264];
	assign io_deq_bits_uop_exception = _ram_ext_R0_data[270];
	assign io_deq_bits_uop_exc_cause = _ram_ext_R0_data[334:271];
	assign io_deq_bits_uop_mem_cmd = _ram_ext_R0_data[339:335];
	assign io_deq_bits_uop_mem_size = _ram_ext_R0_data[341:340];
	assign io_deq_bits_uop_mem_signed = _ram_ext_R0_data[342];
	assign io_deq_bits_uop_uses_ldq = _ram_ext_R0_data[343];
	assign io_deq_bits_uop_uses_stq = _ram_ext_R0_data[344];
	assign io_deq_bits_uop_is_unique = _ram_ext_R0_data[345];
	assign io_deq_bits_uop_flush_on_commit = _ram_ext_R0_data[346];
	assign io_deq_bits_uop_csr_cmd = _ram_ext_R0_data[349:347];
	assign io_deq_bits_uop_ldst_is_rs1 = _ram_ext_R0_data[350];
	assign io_deq_bits_uop_ldst = _ram_ext_R0_data[356:351];
	assign io_deq_bits_uop_lrs1 = _ram_ext_R0_data[362:357];
	assign io_deq_bits_uop_lrs2 = _ram_ext_R0_data[368:363];
	assign io_deq_bits_uop_lrs3 = _ram_ext_R0_data[374:369];
	assign io_deq_bits_uop_dst_rtype = _ram_ext_R0_data[376:375];
	assign io_deq_bits_uop_lrs1_rtype = _ram_ext_R0_data[378:377];
	assign io_deq_bits_uop_lrs2_rtype = _ram_ext_R0_data[380:379];
	assign io_deq_bits_uop_frs3_en = _ram_ext_R0_data[381];
	assign io_deq_bits_uop_fcn_dw = _ram_ext_R0_data[382];
	assign io_deq_bits_uop_fcn_op = _ram_ext_R0_data[387:383];
	assign io_deq_bits_uop_fp_val = _ram_ext_R0_data[388];
	assign io_deq_bits_uop_fp_rm = _ram_ext_R0_data[391:389];
	assign io_deq_bits_uop_fp_typ = _ram_ext_R0_data[393:392];
	assign io_deq_bits_uop_xcpt_pf_if = _ram_ext_R0_data[394];
	assign io_deq_bits_uop_xcpt_ae_if = _ram_ext_R0_data[395];
	assign io_deq_bits_uop_xcpt_ma_if = _ram_ext_R0_data[396];
	assign io_deq_bits_uop_bp_debug_if = _ram_ext_R0_data[397];
	assign io_deq_bits_uop_bp_xcpt_if = _ram_ext_R0_data[398];
	assign io_deq_bits_uop_debug_fsrc = _ram_ext_R0_data[401:399];
	assign io_deq_bits_uop_debug_tsrc = _ram_ext_R0_data[404:402];
	assign io_deq_bits_addr_bits = _ram_ext_R0_data[444:405];
	assign io_deq_bits_data_bits = _ram_ext_R0_data[508:445];
endmodule
