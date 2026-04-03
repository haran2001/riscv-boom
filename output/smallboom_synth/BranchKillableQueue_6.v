module BranchKillableQueue_6 (
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
	io_enq_bits_data,
	io_enq_bits_fflags_valid,
	io_enq_bits_fflags_bits,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits_uop_br_mask,
	io_deq_bits_uop_rob_idx,
	io_deq_bits_uop_pdst,
	io_deq_bits_uop_dst_rtype,
	io_deq_bits_data,
	io_deq_bits_predicated,
	io_deq_bits_fflags_valid,
	io_deq_bits_fflags_bits,
	io_brupdate_b1_resolve_mask,
	io_brupdate_b1_mispredict_mask,
	io_flush,
	io_count
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
	input [64:0] io_enq_bits_data;
	input io_enq_bits_fflags_valid;
	input [4:0] io_enq_bits_fflags_bits;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire [7:0] io_deq_bits_uop_br_mask;
	output wire [4:0] io_deq_bits_uop_rob_idx;
	output wire [5:0] io_deq_bits_uop_pdst;
	output wire [1:0] io_deq_bits_uop_dst_rtype;
	output wire [64:0] io_deq_bits_data;
	output wire io_deq_bits_predicated;
	output wire io_deq_bits_fflags_valid;
	output wire [4:0] io_deq_bits_fflags_bits;
	input [7:0] io_brupdate_b1_resolve_mask;
	input [7:0] io_brupdate_b1_mispredict_mask;
	input io_flush;
	output wire [3:0] io_count;
	wire [71:0] _ram_ext_R0_data;
	reg valids_0;
	reg valids_1;
	reg valids_2;
	reg valids_3;
	reg valids_4;
	reg valids_5;
	reg valids_6;
	reg valids_7;
	reg valids_8;
	reg valids_9;
	reg [7:0] uops_0_br_mask;
	reg [4:0] uops_0_rob_idx;
	reg [5:0] uops_0_pdst;
	reg [1:0] uops_0_dst_rtype;
	reg [7:0] uops_1_br_mask;
	reg [4:0] uops_1_rob_idx;
	reg [5:0] uops_1_pdst;
	reg [1:0] uops_1_dst_rtype;
	reg [7:0] uops_2_br_mask;
	reg [4:0] uops_2_rob_idx;
	reg [5:0] uops_2_pdst;
	reg [1:0] uops_2_dst_rtype;
	reg [7:0] uops_3_br_mask;
	reg [4:0] uops_3_rob_idx;
	reg [5:0] uops_3_pdst;
	reg [1:0] uops_3_dst_rtype;
	reg [7:0] uops_4_br_mask;
	reg [4:0] uops_4_rob_idx;
	reg [5:0] uops_4_pdst;
	reg [1:0] uops_4_dst_rtype;
	reg [7:0] uops_5_br_mask;
	reg [4:0] uops_5_rob_idx;
	reg [5:0] uops_5_pdst;
	reg [1:0] uops_5_dst_rtype;
	reg [7:0] uops_6_br_mask;
	reg [4:0] uops_6_rob_idx;
	reg [5:0] uops_6_pdst;
	reg [1:0] uops_6_dst_rtype;
	reg [7:0] uops_7_br_mask;
	reg [4:0] uops_7_rob_idx;
	reg [5:0] uops_7_pdst;
	reg [1:0] uops_7_dst_rtype;
	reg [7:0] uops_8_br_mask;
	reg [4:0] uops_8_rob_idx;
	reg [5:0] uops_8_pdst;
	reg [1:0] uops_8_dst_rtype;
	reg [7:0] uops_9_br_mask;
	reg [4:0] uops_9_rob_idx;
	reg [5:0] uops_9_pdst;
	reg [1:0] uops_9_dst_rtype;
	reg [3:0] enq_ptr_value;
	reg [3:0] deq_ptr_value;
	reg maybe_full;
	wire ptr_match = enq_ptr_value == deq_ptr_value;
	wire io_empty = ptr_match & ~maybe_full;
	wire full = ptr_match & maybe_full;
	wire do_enq = ((~full & io_enq_valid) & ((io_brupdate_b1_mispredict_mask & io_enq_bits_uop_br_mask) == 8'h00)) & ~io_flush;
	wire [15:0] _GEN = {valids_0, valids_0, valids_0, valids_0, valids_0, valids_0, valids_9, valids_8, valids_7, valids_6, valids_5, valids_4, valids_3, valids_2, valids_1, valids_0};
	wire _GEN_0 = _GEN[deq_ptr_value];
	wire [127:0] _GEN_1 = {uops_0_br_mask, uops_0_br_mask, uops_0_br_mask, uops_0_br_mask, uops_0_br_mask, uops_0_br_mask, uops_9_br_mask, uops_8_br_mask, uops_7_br_mask, uops_6_br_mask, uops_5_br_mask, uops_4_br_mask, uops_3_br_mask, uops_2_br_mask, uops_1_br_mask, uops_0_br_mask};
	wire [79:0] _GEN_2 = {uops_0_rob_idx, uops_0_rob_idx, uops_0_rob_idx, uops_0_rob_idx, uops_0_rob_idx, uops_0_rob_idx, uops_9_rob_idx, uops_8_rob_idx, uops_7_rob_idx, uops_6_rob_idx, uops_5_rob_idx, uops_4_rob_idx, uops_3_rob_idx, uops_2_rob_idx, uops_1_rob_idx, uops_0_rob_idx};
	wire [95:0] _GEN_3 = {uops_0_pdst, uops_0_pdst, uops_0_pdst, uops_0_pdst, uops_0_pdst, uops_0_pdst, uops_9_pdst, uops_8_pdst, uops_7_pdst, uops_6_pdst, uops_5_pdst, uops_4_pdst, uops_3_pdst, uops_2_pdst, uops_1_pdst, uops_0_pdst};
	wire [31:0] _GEN_4 = {uops_0_dst_rtype, uops_0_dst_rtype, uops_0_dst_rtype, uops_0_dst_rtype, uops_0_dst_rtype, uops_0_dst_rtype, uops_9_dst_rtype, uops_8_dst_rtype, uops_7_dst_rtype, uops_6_dst_rtype, uops_5_dst_rtype, uops_4_dst_rtype, uops_3_dst_rtype, uops_2_dst_rtype, uops_1_dst_rtype, uops_0_dst_rtype};
	wire [3:0] _ptr_diff_T = enq_ptr_value - deq_ptr_value;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg _GEN_5;
		reg _GEN_6;
		reg _GEN_7;
		reg _GEN_8;
		reg _GEN_9;
		reg _GEN_10;
		reg _GEN_11;
		reg _GEN_12;
		reg _GEN_13;
		reg _GEN_14;
		reg _GEN_15;
		reg _GEN_16;
		reg _GEN_17;
		reg _GEN_18;
		reg _GEN_19;
		reg _GEN_20;
		reg _GEN_21;
		reg _GEN_22;
		reg _GEN_23;
		reg _GEN_24;
		reg [7:0] _uops_br_mask_T_1;
		_GEN_5 = enq_ptr_value == 4'h0;
		_GEN_6 = do_enq & _GEN_5;
		_GEN_7 = enq_ptr_value == 4'h1;
		_GEN_8 = do_enq & _GEN_7;
		_GEN_9 = enq_ptr_value == 4'h2;
		_GEN_10 = do_enq & _GEN_9;
		_GEN_11 = enq_ptr_value == 4'h3;
		_GEN_12 = do_enq & _GEN_11;
		_GEN_13 = enq_ptr_value == 4'h4;
		_GEN_14 = do_enq & _GEN_13;
		_GEN_15 = enq_ptr_value == 4'h5;
		_GEN_16 = do_enq & _GEN_15;
		_GEN_17 = enq_ptr_value == 4'h6;
		_GEN_18 = do_enq & _GEN_17;
		_GEN_19 = enq_ptr_value == 4'h7;
		_GEN_20 = do_enq & _GEN_19;
		_GEN_21 = enq_ptr_value == 4'h8;
		_GEN_22 = do_enq & _GEN_21;
		_GEN_23 = enq_ptr_value == 4'h9;
		_GEN_24 = do_enq & _GEN_23;
		_uops_br_mask_T_1 = io_enq_bits_uop_br_mask & ~io_brupdate_b1_resolve_mask;
		if (reset) begin
			valids_0 <= 1'h0;
			valids_1 <= 1'h0;
			valids_2 <= 1'h0;
			valids_3 <= 1'h0;
			valids_4 <= 1'h0;
			valids_5 <= 1'h0;
			valids_6 <= 1'h0;
			valids_7 <= 1'h0;
			valids_8 <= 1'h0;
			valids_9 <= 1'h0;
			enq_ptr_value <= 4'h0;
			deq_ptr_value <= 4'h0;
			maybe_full <= 1'h0;
		end
		else begin : sv2v_autoblock_2
			reg do_deq;
			do_deq = (io_deq_ready | ~_GEN_0) & ~io_empty;
			valids_0 <= ~(do_deq & (deq_ptr_value == 4'h0)) & (_GEN_6 | ((valids_0 & ((io_brupdate_b1_mispredict_mask & uops_0_br_mask) == 8'h00)) & ~io_flush));
			valids_1 <= ~(do_deq & (deq_ptr_value == 4'h1)) & (_GEN_8 | ((valids_1 & ((io_brupdate_b1_mispredict_mask & uops_1_br_mask) == 8'h00)) & ~io_flush));
			valids_2 <= ~(do_deq & (deq_ptr_value == 4'h2)) & (_GEN_10 | ((valids_2 & ((io_brupdate_b1_mispredict_mask & uops_2_br_mask) == 8'h00)) & ~io_flush));
			valids_3 <= ~(do_deq & (deq_ptr_value == 4'h3)) & (_GEN_12 | ((valids_3 & ((io_brupdate_b1_mispredict_mask & uops_3_br_mask) == 8'h00)) & ~io_flush));
			valids_4 <= ~(do_deq & (deq_ptr_value == 4'h4)) & (_GEN_14 | ((valids_4 & ((io_brupdate_b1_mispredict_mask & uops_4_br_mask) == 8'h00)) & ~io_flush));
			valids_5 <= ~(do_deq & (deq_ptr_value == 4'h5)) & (_GEN_16 | ((valids_5 & ((io_brupdate_b1_mispredict_mask & uops_5_br_mask) == 8'h00)) & ~io_flush));
			valids_6 <= ~(do_deq & (deq_ptr_value == 4'h6)) & (_GEN_18 | ((valids_6 & ((io_brupdate_b1_mispredict_mask & uops_6_br_mask) == 8'h00)) & ~io_flush));
			valids_7 <= ~(do_deq & (deq_ptr_value == 4'h7)) & (_GEN_20 | ((valids_7 & ((io_brupdate_b1_mispredict_mask & uops_7_br_mask) == 8'h00)) & ~io_flush));
			valids_8 <= ~(do_deq & (deq_ptr_value == 4'h8)) & (_GEN_22 | ((valids_8 & ((io_brupdate_b1_mispredict_mask & uops_8_br_mask) == 8'h00)) & ~io_flush));
			valids_9 <= ~(do_deq & (deq_ptr_value == 4'h9)) & (_GEN_24 | ((valids_9 & ((io_brupdate_b1_mispredict_mask & uops_9_br_mask) == 8'h00)) & ~io_flush));
			if (do_enq) begin
				if (enq_ptr_value == 4'h9)
					enq_ptr_value <= 4'h0;
				else
					enq_ptr_value <= enq_ptr_value + 4'h1;
			end
			if (do_deq) begin
				if (deq_ptr_value == 4'h9)
					deq_ptr_value <= 4'h0;
				else
					deq_ptr_value <= deq_ptr_value + 4'h1;
			end
			if (~(do_enq == do_deq))
				maybe_full <= do_enq;
		end
		if (do_enq & _GEN_5)
			uops_0_br_mask <= _uops_br_mask_T_1;
		else
			uops_0_br_mask <= ({8 {~valids_0}} | ~io_brupdate_b1_resolve_mask) & uops_0_br_mask;
		if (_GEN_6) begin
			uops_0_rob_idx <= io_enq_bits_uop_rob_idx;
			uops_0_pdst <= io_enq_bits_uop_pdst;
			uops_0_dst_rtype <= io_enq_bits_uop_dst_rtype;
		end
		if (do_enq & _GEN_7)
			uops_1_br_mask <= _uops_br_mask_T_1;
		else
			uops_1_br_mask <= ({8 {~valids_1}} | ~io_brupdate_b1_resolve_mask) & uops_1_br_mask;
		if (_GEN_8) begin
			uops_1_rob_idx <= io_enq_bits_uop_rob_idx;
			uops_1_pdst <= io_enq_bits_uop_pdst;
			uops_1_dst_rtype <= io_enq_bits_uop_dst_rtype;
		end
		if (do_enq & _GEN_9)
			uops_2_br_mask <= _uops_br_mask_T_1;
		else
			uops_2_br_mask <= ({8 {~valids_2}} | ~io_brupdate_b1_resolve_mask) & uops_2_br_mask;
		if (_GEN_10) begin
			uops_2_rob_idx <= io_enq_bits_uop_rob_idx;
			uops_2_pdst <= io_enq_bits_uop_pdst;
			uops_2_dst_rtype <= io_enq_bits_uop_dst_rtype;
		end
		if (do_enq & _GEN_11)
			uops_3_br_mask <= _uops_br_mask_T_1;
		else
			uops_3_br_mask <= ({8 {~valids_3}} | ~io_brupdate_b1_resolve_mask) & uops_3_br_mask;
		if (_GEN_12) begin
			uops_3_rob_idx <= io_enq_bits_uop_rob_idx;
			uops_3_pdst <= io_enq_bits_uop_pdst;
			uops_3_dst_rtype <= io_enq_bits_uop_dst_rtype;
		end
		if (do_enq & _GEN_13)
			uops_4_br_mask <= _uops_br_mask_T_1;
		else
			uops_4_br_mask <= ({8 {~valids_4}} | ~io_brupdate_b1_resolve_mask) & uops_4_br_mask;
		if (_GEN_14) begin
			uops_4_rob_idx <= io_enq_bits_uop_rob_idx;
			uops_4_pdst <= io_enq_bits_uop_pdst;
			uops_4_dst_rtype <= io_enq_bits_uop_dst_rtype;
		end
		if (do_enq & _GEN_15)
			uops_5_br_mask <= _uops_br_mask_T_1;
		else
			uops_5_br_mask <= ({8 {~valids_5}} | ~io_brupdate_b1_resolve_mask) & uops_5_br_mask;
		if (_GEN_16) begin
			uops_5_rob_idx <= io_enq_bits_uop_rob_idx;
			uops_5_pdst <= io_enq_bits_uop_pdst;
			uops_5_dst_rtype <= io_enq_bits_uop_dst_rtype;
		end
		if (do_enq & _GEN_17)
			uops_6_br_mask <= _uops_br_mask_T_1;
		else
			uops_6_br_mask <= ({8 {~valids_6}} | ~io_brupdate_b1_resolve_mask) & uops_6_br_mask;
		if (_GEN_18) begin
			uops_6_rob_idx <= io_enq_bits_uop_rob_idx;
			uops_6_pdst <= io_enq_bits_uop_pdst;
			uops_6_dst_rtype <= io_enq_bits_uop_dst_rtype;
		end
		if (do_enq & _GEN_19)
			uops_7_br_mask <= _uops_br_mask_T_1;
		else
			uops_7_br_mask <= ({8 {~valids_7}} | ~io_brupdate_b1_resolve_mask) & uops_7_br_mask;
		if (_GEN_20) begin
			uops_7_rob_idx <= io_enq_bits_uop_rob_idx;
			uops_7_pdst <= io_enq_bits_uop_pdst;
			uops_7_dst_rtype <= io_enq_bits_uop_dst_rtype;
		end
		if (do_enq & _GEN_21)
			uops_8_br_mask <= _uops_br_mask_T_1;
		else
			uops_8_br_mask <= ({8 {~valids_8}} | ~io_brupdate_b1_resolve_mask) & uops_8_br_mask;
		if (_GEN_22) begin
			uops_8_rob_idx <= io_enq_bits_uop_rob_idx;
			uops_8_pdst <= io_enq_bits_uop_pdst;
			uops_8_dst_rtype <= io_enq_bits_uop_dst_rtype;
		end
		if (do_enq & _GEN_23)
			uops_9_br_mask <= _uops_br_mask_T_1;
		else
			uops_9_br_mask <= ({8 {~valids_9}} | ~io_brupdate_b1_resolve_mask) & uops_9_br_mask;
		if (_GEN_24) begin
			uops_9_rob_idx <= io_enq_bits_uop_rob_idx;
			uops_9_pdst <= io_enq_bits_uop_pdst;
			uops_9_dst_rtype <= io_enq_bits_uop_dst_rtype;
		end
	end
	ram_10x72 ram_ext(
		.R0_addr(deq_ptr_value),
		.R0_en(1'h1),
		.R0_clk(clock),
		.R0_data(_ram_ext_R0_data),
		.W0_addr(enq_ptr_value),
		.W0_en(do_enq),
		.W0_clk(clock),
		.W0_data({io_enq_bits_fflags_bits, io_enq_bits_fflags_valid, 1'h0, io_enq_bits_data})
	);
	assign io_enq_ready = ~full;
	assign io_deq_valid = ~io_empty & _GEN_0;
	assign io_deq_bits_uop_br_mask = _GEN_1[deq_ptr_value * 8+:8];
	assign io_deq_bits_uop_rob_idx = _GEN_2[deq_ptr_value * 5+:5];
	assign io_deq_bits_uop_pdst = _GEN_3[deq_ptr_value * 6+:6];
	assign io_deq_bits_uop_dst_rtype = _GEN_4[deq_ptr_value * 2+:2];
	assign io_deq_bits_data = _ram_ext_R0_data[64:0];
	assign io_deq_bits_predicated = _ram_ext_R0_data[65];
	assign io_deq_bits_fflags_valid = _ram_ext_R0_data[66];
	assign io_deq_bits_fflags_bits = _ram_ext_R0_data[71:67];
	assign io_count = (ptr_match ? (maybe_full ? 4'ha : 4'h0) : (deq_ptr_value > enq_ptr_value ? _ptr_diff_T - 4'h6 : _ptr_diff_T));
endmodule
