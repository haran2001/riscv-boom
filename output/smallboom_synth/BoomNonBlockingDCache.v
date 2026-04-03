module BoomNonBlockingDCache (
	clock,
	reset,
	auto_out_a_ready,
	auto_out_a_valid,
	auto_out_a_bits_opcode,
	auto_out_a_bits_param,
	auto_out_a_bits_size,
	auto_out_a_bits_source,
	auto_out_a_bits_address,
	auto_out_a_bits_mask,
	auto_out_a_bits_data,
	auto_out_b_ready,
	auto_out_b_valid,
	auto_out_b_bits_param,
	auto_out_b_bits_size,
	auto_out_b_bits_source,
	auto_out_b_bits_address,
	auto_out_c_ready,
	auto_out_c_valid,
	auto_out_c_bits_opcode,
	auto_out_c_bits_param,
	auto_out_c_bits_size,
	auto_out_c_bits_source,
	auto_out_c_bits_address,
	auto_out_c_bits_data,
	auto_out_d_ready,
	auto_out_d_valid,
	auto_out_d_bits_opcode,
	auto_out_d_bits_param,
	auto_out_d_bits_size,
	auto_out_d_bits_source,
	auto_out_d_bits_sink,
	auto_out_d_bits_data,
	auto_out_e_ready,
	auto_out_e_valid,
	auto_out_e_bits_sink,
	io_lsu_req_ready,
	io_lsu_req_valid,
	io_lsu_req_bits_0_valid,
	io_lsu_req_bits_0_bits_uop_inst,
	io_lsu_req_bits_0_bits_uop_debug_inst,
	io_lsu_req_bits_0_bits_uop_is_rvc,
	io_lsu_req_bits_0_bits_uop_debug_pc,
	io_lsu_req_bits_0_bits_uop_iq_type_0,
	io_lsu_req_bits_0_bits_uop_iq_type_1,
	io_lsu_req_bits_0_bits_uop_iq_type_2,
	io_lsu_req_bits_0_bits_uop_iq_type_3,
	io_lsu_req_bits_0_bits_uop_fu_code_0,
	io_lsu_req_bits_0_bits_uop_fu_code_1,
	io_lsu_req_bits_0_bits_uop_fu_code_2,
	io_lsu_req_bits_0_bits_uop_fu_code_3,
	io_lsu_req_bits_0_bits_uop_fu_code_4,
	io_lsu_req_bits_0_bits_uop_fu_code_5,
	io_lsu_req_bits_0_bits_uop_fu_code_6,
	io_lsu_req_bits_0_bits_uop_fu_code_7,
	io_lsu_req_bits_0_bits_uop_fu_code_8,
	io_lsu_req_bits_0_bits_uop_fu_code_9,
	io_lsu_req_bits_0_bits_uop_iw_issued,
	io_lsu_req_bits_0_bits_uop_iw_issued_partial_agen,
	io_lsu_req_bits_0_bits_uop_iw_issued_partial_dgen,
	io_lsu_req_bits_0_bits_uop_iw_p1_speculative_child,
	io_lsu_req_bits_0_bits_uop_iw_p2_speculative_child,
	io_lsu_req_bits_0_bits_uop_iw_p1_bypass_hint,
	io_lsu_req_bits_0_bits_uop_iw_p2_bypass_hint,
	io_lsu_req_bits_0_bits_uop_iw_p3_bypass_hint,
	io_lsu_req_bits_0_bits_uop_dis_col_sel,
	io_lsu_req_bits_0_bits_uop_br_mask,
	io_lsu_req_bits_0_bits_uop_br_tag,
	io_lsu_req_bits_0_bits_uop_br_type,
	io_lsu_req_bits_0_bits_uop_is_sfb,
	io_lsu_req_bits_0_bits_uop_is_fence,
	io_lsu_req_bits_0_bits_uop_is_fencei,
	io_lsu_req_bits_0_bits_uop_is_sfence,
	io_lsu_req_bits_0_bits_uop_is_amo,
	io_lsu_req_bits_0_bits_uop_is_eret,
	io_lsu_req_bits_0_bits_uop_is_sys_pc2epc,
	io_lsu_req_bits_0_bits_uop_is_rocc,
	io_lsu_req_bits_0_bits_uop_is_mov,
	io_lsu_req_bits_0_bits_uop_ftq_idx,
	io_lsu_req_bits_0_bits_uop_edge_inst,
	io_lsu_req_bits_0_bits_uop_pc_lob,
	io_lsu_req_bits_0_bits_uop_taken,
	io_lsu_req_bits_0_bits_uop_imm_rename,
	io_lsu_req_bits_0_bits_uop_imm_sel,
	io_lsu_req_bits_0_bits_uop_pimm,
	io_lsu_req_bits_0_bits_uop_imm_packed,
	io_lsu_req_bits_0_bits_uop_op1_sel,
	io_lsu_req_bits_0_bits_uop_op2_sel,
	io_lsu_req_bits_0_bits_uop_fp_ctrl_ldst,
	io_lsu_req_bits_0_bits_uop_fp_ctrl_wen,
	io_lsu_req_bits_0_bits_uop_fp_ctrl_ren1,
	io_lsu_req_bits_0_bits_uop_fp_ctrl_ren2,
	io_lsu_req_bits_0_bits_uop_fp_ctrl_ren3,
	io_lsu_req_bits_0_bits_uop_fp_ctrl_swap12,
	io_lsu_req_bits_0_bits_uop_fp_ctrl_swap23,
	io_lsu_req_bits_0_bits_uop_fp_ctrl_typeTagIn,
	io_lsu_req_bits_0_bits_uop_fp_ctrl_typeTagOut,
	io_lsu_req_bits_0_bits_uop_fp_ctrl_fromint,
	io_lsu_req_bits_0_bits_uop_fp_ctrl_toint,
	io_lsu_req_bits_0_bits_uop_fp_ctrl_fastpipe,
	io_lsu_req_bits_0_bits_uop_fp_ctrl_fma,
	io_lsu_req_bits_0_bits_uop_fp_ctrl_div,
	io_lsu_req_bits_0_bits_uop_fp_ctrl_sqrt,
	io_lsu_req_bits_0_bits_uop_fp_ctrl_wflags,
	io_lsu_req_bits_0_bits_uop_fp_ctrl_vec,
	io_lsu_req_bits_0_bits_uop_rob_idx,
	io_lsu_req_bits_0_bits_uop_ldq_idx,
	io_lsu_req_bits_0_bits_uop_stq_idx,
	io_lsu_req_bits_0_bits_uop_rxq_idx,
	io_lsu_req_bits_0_bits_uop_pdst,
	io_lsu_req_bits_0_bits_uop_prs1,
	io_lsu_req_bits_0_bits_uop_prs2,
	io_lsu_req_bits_0_bits_uop_prs3,
	io_lsu_req_bits_0_bits_uop_ppred,
	io_lsu_req_bits_0_bits_uop_prs1_busy,
	io_lsu_req_bits_0_bits_uop_prs2_busy,
	io_lsu_req_bits_0_bits_uop_prs3_busy,
	io_lsu_req_bits_0_bits_uop_ppred_busy,
	io_lsu_req_bits_0_bits_uop_stale_pdst,
	io_lsu_req_bits_0_bits_uop_exception,
	io_lsu_req_bits_0_bits_uop_exc_cause,
	io_lsu_req_bits_0_bits_uop_mem_cmd,
	io_lsu_req_bits_0_bits_uop_mem_size,
	io_lsu_req_bits_0_bits_uop_mem_signed,
	io_lsu_req_bits_0_bits_uop_uses_ldq,
	io_lsu_req_bits_0_bits_uop_uses_stq,
	io_lsu_req_bits_0_bits_uop_is_unique,
	io_lsu_req_bits_0_bits_uop_flush_on_commit,
	io_lsu_req_bits_0_bits_uop_csr_cmd,
	io_lsu_req_bits_0_bits_uop_ldst_is_rs1,
	io_lsu_req_bits_0_bits_uop_ldst,
	io_lsu_req_bits_0_bits_uop_lrs1,
	io_lsu_req_bits_0_bits_uop_lrs2,
	io_lsu_req_bits_0_bits_uop_lrs3,
	io_lsu_req_bits_0_bits_uop_dst_rtype,
	io_lsu_req_bits_0_bits_uop_lrs1_rtype,
	io_lsu_req_bits_0_bits_uop_lrs2_rtype,
	io_lsu_req_bits_0_bits_uop_frs3_en,
	io_lsu_req_bits_0_bits_uop_fcn_dw,
	io_lsu_req_bits_0_bits_uop_fcn_op,
	io_lsu_req_bits_0_bits_uop_fp_val,
	io_lsu_req_bits_0_bits_uop_fp_rm,
	io_lsu_req_bits_0_bits_uop_fp_typ,
	io_lsu_req_bits_0_bits_uop_xcpt_pf_if,
	io_lsu_req_bits_0_bits_uop_xcpt_ae_if,
	io_lsu_req_bits_0_bits_uop_xcpt_ma_if,
	io_lsu_req_bits_0_bits_uop_bp_debug_if,
	io_lsu_req_bits_0_bits_uop_bp_xcpt_if,
	io_lsu_req_bits_0_bits_uop_debug_fsrc,
	io_lsu_req_bits_0_bits_uop_debug_tsrc,
	io_lsu_req_bits_0_bits_addr,
	io_lsu_req_bits_0_bits_data,
	io_lsu_req_bits_0_bits_is_hella,
	io_lsu_s1_kill_0,
	io_lsu_resp_0_valid,
	io_lsu_resp_0_bits_uop_is_amo,
	io_lsu_resp_0_bits_uop_ldq_idx,
	io_lsu_resp_0_bits_uop_stq_idx,
	io_lsu_resp_0_bits_uop_uses_ldq,
	io_lsu_resp_0_bits_uop_uses_stq,
	io_lsu_resp_0_bits_data,
	io_lsu_resp_0_bits_is_hella,
	io_lsu_store_ack_0_valid,
	io_lsu_store_ack_0_bits_uop_stq_idx,
	io_lsu_store_ack_0_bits_is_hella,
	io_lsu_nack_0_valid,
	io_lsu_nack_0_bits_uop_ldq_idx,
	io_lsu_nack_0_bits_uop_stq_idx,
	io_lsu_nack_0_bits_uop_mem_size,
	io_lsu_nack_0_bits_uop_uses_ldq,
	io_lsu_nack_0_bits_uop_uses_stq,
	io_lsu_nack_0_bits_addr,
	io_lsu_nack_0_bits_is_hella,
	io_lsu_ll_resp_ready,
	io_lsu_ll_resp_valid,
	io_lsu_ll_resp_bits_uop_is_amo,
	io_lsu_ll_resp_bits_uop_ldq_idx,
	io_lsu_ll_resp_bits_uop_stq_idx,
	io_lsu_ll_resp_bits_uop_uses_ldq,
	io_lsu_ll_resp_bits_uop_uses_stq,
	io_lsu_ll_resp_bits_data,
	io_lsu_ll_resp_bits_is_hella,
	io_lsu_brupdate_b1_resolve_mask,
	io_lsu_brupdate_b1_mispredict_mask,
	io_lsu_exception,
	io_lsu_release_ready,
	io_lsu_release_valid,
	io_lsu_release_bits_address,
	io_lsu_force_order,
	io_lsu_ordered,
	io_lsu_perf_acquire,
	io_lsu_perf_release
);
	input clock;
	input reset;
	input auto_out_a_ready;
	output wire auto_out_a_valid;
	output wire [2:0] auto_out_a_bits_opcode;
	output wire [2:0] auto_out_a_bits_param;
	output wire [3:0] auto_out_a_bits_size;
	output wire [1:0] auto_out_a_bits_source;
	output wire [31:0] auto_out_a_bits_address;
	output wire [7:0] auto_out_a_bits_mask;
	output wire [63:0] auto_out_a_bits_data;
	output wire auto_out_b_ready;
	input auto_out_b_valid;
	input [1:0] auto_out_b_bits_param;
	input [3:0] auto_out_b_bits_size;
	input [1:0] auto_out_b_bits_source;
	input [31:0] auto_out_b_bits_address;
	input auto_out_c_ready;
	output wire auto_out_c_valid;
	output wire [2:0] auto_out_c_bits_opcode;
	output wire [2:0] auto_out_c_bits_param;
	output wire [3:0] auto_out_c_bits_size;
	output wire [1:0] auto_out_c_bits_source;
	output wire [31:0] auto_out_c_bits_address;
	output wire [63:0] auto_out_c_bits_data;
	output wire auto_out_d_ready;
	input auto_out_d_valid;
	input [2:0] auto_out_d_bits_opcode;
	input [1:0] auto_out_d_bits_param;
	input [3:0] auto_out_d_bits_size;
	input [1:0] auto_out_d_bits_source;
	input [1:0] auto_out_d_bits_sink;
	input [63:0] auto_out_d_bits_data;
	input auto_out_e_ready;
	output wire auto_out_e_valid;
	output wire [1:0] auto_out_e_bits_sink;
	output wire io_lsu_req_ready;
	input io_lsu_req_valid;
	input io_lsu_req_bits_0_valid;
	input [31:0] io_lsu_req_bits_0_bits_uop_inst;
	input [31:0] io_lsu_req_bits_0_bits_uop_debug_inst;
	input io_lsu_req_bits_0_bits_uop_is_rvc;
	input [39:0] io_lsu_req_bits_0_bits_uop_debug_pc;
	input io_lsu_req_bits_0_bits_uop_iq_type_0;
	input io_lsu_req_bits_0_bits_uop_iq_type_1;
	input io_lsu_req_bits_0_bits_uop_iq_type_2;
	input io_lsu_req_bits_0_bits_uop_iq_type_3;
	input io_lsu_req_bits_0_bits_uop_fu_code_0;
	input io_lsu_req_bits_0_bits_uop_fu_code_1;
	input io_lsu_req_bits_0_bits_uop_fu_code_2;
	input io_lsu_req_bits_0_bits_uop_fu_code_3;
	input io_lsu_req_bits_0_bits_uop_fu_code_4;
	input io_lsu_req_bits_0_bits_uop_fu_code_5;
	input io_lsu_req_bits_0_bits_uop_fu_code_6;
	input io_lsu_req_bits_0_bits_uop_fu_code_7;
	input io_lsu_req_bits_0_bits_uop_fu_code_8;
	input io_lsu_req_bits_0_bits_uop_fu_code_9;
	input io_lsu_req_bits_0_bits_uop_iw_issued;
	input io_lsu_req_bits_0_bits_uop_iw_issued_partial_agen;
	input io_lsu_req_bits_0_bits_uop_iw_issued_partial_dgen;
	input io_lsu_req_bits_0_bits_uop_iw_p1_speculative_child;
	input io_lsu_req_bits_0_bits_uop_iw_p2_speculative_child;
	input io_lsu_req_bits_0_bits_uop_iw_p1_bypass_hint;
	input io_lsu_req_bits_0_bits_uop_iw_p2_bypass_hint;
	input io_lsu_req_bits_0_bits_uop_iw_p3_bypass_hint;
	input io_lsu_req_bits_0_bits_uop_dis_col_sel;
	input [7:0] io_lsu_req_bits_0_bits_uop_br_mask;
	input [2:0] io_lsu_req_bits_0_bits_uop_br_tag;
	input [3:0] io_lsu_req_bits_0_bits_uop_br_type;
	input io_lsu_req_bits_0_bits_uop_is_sfb;
	input io_lsu_req_bits_0_bits_uop_is_fence;
	input io_lsu_req_bits_0_bits_uop_is_fencei;
	input io_lsu_req_bits_0_bits_uop_is_sfence;
	input io_lsu_req_bits_0_bits_uop_is_amo;
	input io_lsu_req_bits_0_bits_uop_is_eret;
	input io_lsu_req_bits_0_bits_uop_is_sys_pc2epc;
	input io_lsu_req_bits_0_bits_uop_is_rocc;
	input io_lsu_req_bits_0_bits_uop_is_mov;
	input [3:0] io_lsu_req_bits_0_bits_uop_ftq_idx;
	input io_lsu_req_bits_0_bits_uop_edge_inst;
	input [5:0] io_lsu_req_bits_0_bits_uop_pc_lob;
	input io_lsu_req_bits_0_bits_uop_taken;
	input io_lsu_req_bits_0_bits_uop_imm_rename;
	input [2:0] io_lsu_req_bits_0_bits_uop_imm_sel;
	input [4:0] io_lsu_req_bits_0_bits_uop_pimm;
	input [19:0] io_lsu_req_bits_0_bits_uop_imm_packed;
	input [1:0] io_lsu_req_bits_0_bits_uop_op1_sel;
	input [2:0] io_lsu_req_bits_0_bits_uop_op2_sel;
	input io_lsu_req_bits_0_bits_uop_fp_ctrl_ldst;
	input io_lsu_req_bits_0_bits_uop_fp_ctrl_wen;
	input io_lsu_req_bits_0_bits_uop_fp_ctrl_ren1;
	input io_lsu_req_bits_0_bits_uop_fp_ctrl_ren2;
	input io_lsu_req_bits_0_bits_uop_fp_ctrl_ren3;
	input io_lsu_req_bits_0_bits_uop_fp_ctrl_swap12;
	input io_lsu_req_bits_0_bits_uop_fp_ctrl_swap23;
	input [1:0] io_lsu_req_bits_0_bits_uop_fp_ctrl_typeTagIn;
	input [1:0] io_lsu_req_bits_0_bits_uop_fp_ctrl_typeTagOut;
	input io_lsu_req_bits_0_bits_uop_fp_ctrl_fromint;
	input io_lsu_req_bits_0_bits_uop_fp_ctrl_toint;
	input io_lsu_req_bits_0_bits_uop_fp_ctrl_fastpipe;
	input io_lsu_req_bits_0_bits_uop_fp_ctrl_fma;
	input io_lsu_req_bits_0_bits_uop_fp_ctrl_div;
	input io_lsu_req_bits_0_bits_uop_fp_ctrl_sqrt;
	input io_lsu_req_bits_0_bits_uop_fp_ctrl_wflags;
	input io_lsu_req_bits_0_bits_uop_fp_ctrl_vec;
	input [4:0] io_lsu_req_bits_0_bits_uop_rob_idx;
	input [3:0] io_lsu_req_bits_0_bits_uop_ldq_idx;
	input [3:0] io_lsu_req_bits_0_bits_uop_stq_idx;
	input [1:0] io_lsu_req_bits_0_bits_uop_rxq_idx;
	input [5:0] io_lsu_req_bits_0_bits_uop_pdst;
	input [5:0] io_lsu_req_bits_0_bits_uop_prs1;
	input [5:0] io_lsu_req_bits_0_bits_uop_prs2;
	input [5:0] io_lsu_req_bits_0_bits_uop_prs3;
	input [3:0] io_lsu_req_bits_0_bits_uop_ppred;
	input io_lsu_req_bits_0_bits_uop_prs1_busy;
	input io_lsu_req_bits_0_bits_uop_prs2_busy;
	input io_lsu_req_bits_0_bits_uop_prs3_busy;
	input io_lsu_req_bits_0_bits_uop_ppred_busy;
	input [5:0] io_lsu_req_bits_0_bits_uop_stale_pdst;
	input io_lsu_req_bits_0_bits_uop_exception;
	input [63:0] io_lsu_req_bits_0_bits_uop_exc_cause;
	input [4:0] io_lsu_req_bits_0_bits_uop_mem_cmd;
	input [1:0] io_lsu_req_bits_0_bits_uop_mem_size;
	input io_lsu_req_bits_0_bits_uop_mem_signed;
	input io_lsu_req_bits_0_bits_uop_uses_ldq;
	input io_lsu_req_bits_0_bits_uop_uses_stq;
	input io_lsu_req_bits_0_bits_uop_is_unique;
	input io_lsu_req_bits_0_bits_uop_flush_on_commit;
	input [2:0] io_lsu_req_bits_0_bits_uop_csr_cmd;
	input io_lsu_req_bits_0_bits_uop_ldst_is_rs1;
	input [5:0] io_lsu_req_bits_0_bits_uop_ldst;
	input [5:0] io_lsu_req_bits_0_bits_uop_lrs1;
	input [5:0] io_lsu_req_bits_0_bits_uop_lrs2;
	input [5:0] io_lsu_req_bits_0_bits_uop_lrs3;
	input [1:0] io_lsu_req_bits_0_bits_uop_dst_rtype;
	input [1:0] io_lsu_req_bits_0_bits_uop_lrs1_rtype;
	input [1:0] io_lsu_req_bits_0_bits_uop_lrs2_rtype;
	input io_lsu_req_bits_0_bits_uop_frs3_en;
	input io_lsu_req_bits_0_bits_uop_fcn_dw;
	input [4:0] io_lsu_req_bits_0_bits_uop_fcn_op;
	input io_lsu_req_bits_0_bits_uop_fp_val;
	input [2:0] io_lsu_req_bits_0_bits_uop_fp_rm;
	input [1:0] io_lsu_req_bits_0_bits_uop_fp_typ;
	input io_lsu_req_bits_0_bits_uop_xcpt_pf_if;
	input io_lsu_req_bits_0_bits_uop_xcpt_ae_if;
	input io_lsu_req_bits_0_bits_uop_xcpt_ma_if;
	input io_lsu_req_bits_0_bits_uop_bp_debug_if;
	input io_lsu_req_bits_0_bits_uop_bp_xcpt_if;
	input [2:0] io_lsu_req_bits_0_bits_uop_debug_fsrc;
	input [2:0] io_lsu_req_bits_0_bits_uop_debug_tsrc;
	input [39:0] io_lsu_req_bits_0_bits_addr;
	input [63:0] io_lsu_req_bits_0_bits_data;
	input io_lsu_req_bits_0_bits_is_hella;
	input io_lsu_s1_kill_0;
	output wire io_lsu_resp_0_valid;
	output wire io_lsu_resp_0_bits_uop_is_amo;
	output wire [3:0] io_lsu_resp_0_bits_uop_ldq_idx;
	output wire [3:0] io_lsu_resp_0_bits_uop_stq_idx;
	output wire io_lsu_resp_0_bits_uop_uses_ldq;
	output wire io_lsu_resp_0_bits_uop_uses_stq;
	output wire [63:0] io_lsu_resp_0_bits_data;
	output wire io_lsu_resp_0_bits_is_hella;
	output wire io_lsu_store_ack_0_valid;
	output wire [3:0] io_lsu_store_ack_0_bits_uop_stq_idx;
	output wire io_lsu_store_ack_0_bits_is_hella;
	output wire io_lsu_nack_0_valid;
	output wire [3:0] io_lsu_nack_0_bits_uop_ldq_idx;
	output wire [3:0] io_lsu_nack_0_bits_uop_stq_idx;
	output wire [1:0] io_lsu_nack_0_bits_uop_mem_size;
	output wire io_lsu_nack_0_bits_uop_uses_ldq;
	output wire io_lsu_nack_0_bits_uop_uses_stq;
	output wire [39:0] io_lsu_nack_0_bits_addr;
	output wire io_lsu_nack_0_bits_is_hella;
	input io_lsu_ll_resp_ready;
	output wire io_lsu_ll_resp_valid;
	output wire io_lsu_ll_resp_bits_uop_is_amo;
	output wire [3:0] io_lsu_ll_resp_bits_uop_ldq_idx;
	output wire [3:0] io_lsu_ll_resp_bits_uop_stq_idx;
	output wire io_lsu_ll_resp_bits_uop_uses_ldq;
	output wire io_lsu_ll_resp_bits_uop_uses_stq;
	output wire [63:0] io_lsu_ll_resp_bits_data;
	output wire io_lsu_ll_resp_bits_is_hella;
	input [7:0] io_lsu_brupdate_b1_resolve_mask;
	input [7:0] io_lsu_brupdate_b1_mispredict_mask;
	input io_lsu_exception;
	input io_lsu_release_ready;
	output wire io_lsu_release_valid;
	output wire [31:0] io_lsu_release_bits_address;
	input io_lsu_force_order;
	output wire io_lsu_ordered;
	output wire io_lsu_perf_acquire;
	output wire io_lsu_perf_release;
	wire [63:0] size_dat_padded;
	wire nodeOut_c_valid;
	wire _mshrs_io_req_0_valid_T_70;
	reg [3:0] s2_tag_match_way_0;
	wire _wb_io_data_req_ready_T_2;
	wire [63:0] _amoalu_io_out;
	wire _lsu_release_arb_io_in_0_ready;
	wire _lsu_release_arb_io_in_1_ready;
	wire _wbArb_io_in_0_ready;
	wire _wbArb_io_in_1_ready;
	wire _wbArb_io_out_valid;
	wire [19:0] _wbArb_io_out_bits_tag;
	wire [5:0] _wbArb_io_out_bits_idx;
	wire [1:0] _wbArb_io_out_bits_source;
	wire [2:0] _wbArb_io_out_bits_param;
	wire [3:0] _wbArb_io_out_bits_way_en;
	wire _wbArb_io_out_bits_voluntary;
	wire _lfsr_prng_io_out_0;
	wire _lfsr_prng_io_out_1;
	wire _dataReadArb_io_in_1_ready;
	wire _dataReadArb_io_in_2_ready;
	wire _dataReadArb_io_out_valid;
	wire [11:0] _dataReadArb_io_out_bits_req_0_addr;
	wire _dataReadArb_io_out_bits_valid_0;
	wire _dataWriteArb_io_in_1_ready;
	wire _dataWriteArb_io_out_valid;
	wire [3:0] _dataWriteArb_io_out_bits_way_en;
	wire [11:0] _dataWriteArb_io_out_bits_addr;
	wire [63:0] _dataWriteArb_io_out_bits_data;
	wire [63:0] _data_io_resp_0_0;
	wire [63:0] _data_io_resp_0_1;
	wire [63:0] _data_io_resp_0_2;
	wire [63:0] _data_io_resp_0_3;
	wire _metaReadArb_io_in_0_ready;
	wire _metaReadArb_io_in_1_ready;
	wire _metaReadArb_io_in_2_ready;
	wire _metaReadArb_io_in_3_ready;
	wire _metaReadArb_io_in_4_ready;
	wire _metaReadArb_io_out_valid;
	wire [5:0] _metaReadArb_io_out_bits_req_0_idx;
	wire _metaWriteArb_io_in_0_ready;
	wire _metaWriteArb_io_in_1_ready;
	wire _metaWriteArb_io_out_valid;
	wire [5:0] _metaWriteArb_io_out_bits_idx;
	wire [3:0] _metaWriteArb_io_out_bits_way_en;
	wire [1:0] _metaWriteArb_io_out_bits_data_coh_state;
	wire [19:0] _metaWriteArb_io_out_bits_data_tag;
	wire _meta_0_io_read_ready;
	wire _meta_0_io_write_ready;
	wire [1:0] _meta_0_io_resp_0_coh_state;
	wire [19:0] _meta_0_io_resp_0_tag;
	wire [1:0] _meta_0_io_resp_1_coh_state;
	wire [19:0] _meta_0_io_resp_1_tag;
	wire [1:0] _meta_0_io_resp_2_coh_state;
	wire [19:0] _meta_0_io_resp_2_tag;
	wire [1:0] _meta_0_io_resp_3_coh_state;
	wire [19:0] _meta_0_io_resp_3_tag;
	wire _mshrs_io_req_0_ready;
	wire _mshrs_io_resp_valid;
	wire _mshrs_io_secondary_miss_0;
	wire _mshrs_io_block_hit_0;
	wire _mshrs_io_mem_acquire_valid;
	wire [2:0] _mshrs_io_mem_acquire_bits_opcode;
	wire [3:0] _mshrs_io_mem_acquire_bits_size;
	wire _mshrs_io_mem_grant_ready;
	wire _mshrs_io_refill_valid;
	wire [3:0] _mshrs_io_refill_bits_way_en;
	wire [11:0] _mshrs_io_refill_bits_addr;
	wire [63:0] _mshrs_io_refill_bits_data;
	wire _mshrs_io_meta_write_valid;
	wire [5:0] _mshrs_io_meta_write_bits_idx;
	wire [3:0] _mshrs_io_meta_write_bits_way_en;
	wire [1:0] _mshrs_io_meta_write_bits_data_coh_state;
	wire [19:0] _mshrs_io_meta_write_bits_data_tag;
	wire _mshrs_io_meta_read_valid;
	wire [5:0] _mshrs_io_meta_read_bits_idx;
	wire [3:0] _mshrs_io_meta_read_bits_way_en;
	wire [19:0] _mshrs_io_meta_read_bits_tag;
	wire _mshrs_io_replay_valid;
	wire [31:0] _mshrs_io_replay_bits_uop_inst;
	wire [31:0] _mshrs_io_replay_bits_uop_debug_inst;
	wire _mshrs_io_replay_bits_uop_is_rvc;
	wire [39:0] _mshrs_io_replay_bits_uop_debug_pc;
	wire _mshrs_io_replay_bits_uop_iq_type_0;
	wire _mshrs_io_replay_bits_uop_iq_type_1;
	wire _mshrs_io_replay_bits_uop_iq_type_2;
	wire _mshrs_io_replay_bits_uop_iq_type_3;
	wire _mshrs_io_replay_bits_uop_fu_code_0;
	wire _mshrs_io_replay_bits_uop_fu_code_1;
	wire _mshrs_io_replay_bits_uop_fu_code_2;
	wire _mshrs_io_replay_bits_uop_fu_code_3;
	wire _mshrs_io_replay_bits_uop_fu_code_4;
	wire _mshrs_io_replay_bits_uop_fu_code_5;
	wire _mshrs_io_replay_bits_uop_fu_code_6;
	wire _mshrs_io_replay_bits_uop_fu_code_7;
	wire _mshrs_io_replay_bits_uop_fu_code_8;
	wire _mshrs_io_replay_bits_uop_fu_code_9;
	wire _mshrs_io_replay_bits_uop_iw_issued;
	wire _mshrs_io_replay_bits_uop_iw_issued_partial_agen;
	wire _mshrs_io_replay_bits_uop_iw_issued_partial_dgen;
	wire _mshrs_io_replay_bits_uop_iw_p1_speculative_child;
	wire _mshrs_io_replay_bits_uop_iw_p2_speculative_child;
	wire _mshrs_io_replay_bits_uop_iw_p1_bypass_hint;
	wire _mshrs_io_replay_bits_uop_iw_p2_bypass_hint;
	wire _mshrs_io_replay_bits_uop_iw_p3_bypass_hint;
	wire _mshrs_io_replay_bits_uop_dis_col_sel;
	wire [7:0] _mshrs_io_replay_bits_uop_br_mask;
	wire [2:0] _mshrs_io_replay_bits_uop_br_tag;
	wire [3:0] _mshrs_io_replay_bits_uop_br_type;
	wire _mshrs_io_replay_bits_uop_is_sfb;
	wire _mshrs_io_replay_bits_uop_is_fence;
	wire _mshrs_io_replay_bits_uop_is_fencei;
	wire _mshrs_io_replay_bits_uop_is_sfence;
	wire _mshrs_io_replay_bits_uop_is_amo;
	wire _mshrs_io_replay_bits_uop_is_eret;
	wire _mshrs_io_replay_bits_uop_is_sys_pc2epc;
	wire _mshrs_io_replay_bits_uop_is_rocc;
	wire _mshrs_io_replay_bits_uop_is_mov;
	wire [3:0] _mshrs_io_replay_bits_uop_ftq_idx;
	wire _mshrs_io_replay_bits_uop_edge_inst;
	wire [5:0] _mshrs_io_replay_bits_uop_pc_lob;
	wire _mshrs_io_replay_bits_uop_taken;
	wire _mshrs_io_replay_bits_uop_imm_rename;
	wire [2:0] _mshrs_io_replay_bits_uop_imm_sel;
	wire [4:0] _mshrs_io_replay_bits_uop_pimm;
	wire [19:0] _mshrs_io_replay_bits_uop_imm_packed;
	wire [1:0] _mshrs_io_replay_bits_uop_op1_sel;
	wire [2:0] _mshrs_io_replay_bits_uop_op2_sel;
	wire _mshrs_io_replay_bits_uop_fp_ctrl_ldst;
	wire _mshrs_io_replay_bits_uop_fp_ctrl_wen;
	wire _mshrs_io_replay_bits_uop_fp_ctrl_ren1;
	wire _mshrs_io_replay_bits_uop_fp_ctrl_ren2;
	wire _mshrs_io_replay_bits_uop_fp_ctrl_ren3;
	wire _mshrs_io_replay_bits_uop_fp_ctrl_swap12;
	wire _mshrs_io_replay_bits_uop_fp_ctrl_swap23;
	wire [1:0] _mshrs_io_replay_bits_uop_fp_ctrl_typeTagIn;
	wire [1:0] _mshrs_io_replay_bits_uop_fp_ctrl_typeTagOut;
	wire _mshrs_io_replay_bits_uop_fp_ctrl_fromint;
	wire _mshrs_io_replay_bits_uop_fp_ctrl_toint;
	wire _mshrs_io_replay_bits_uop_fp_ctrl_fastpipe;
	wire _mshrs_io_replay_bits_uop_fp_ctrl_fma;
	wire _mshrs_io_replay_bits_uop_fp_ctrl_div;
	wire _mshrs_io_replay_bits_uop_fp_ctrl_sqrt;
	wire _mshrs_io_replay_bits_uop_fp_ctrl_wflags;
	wire _mshrs_io_replay_bits_uop_fp_ctrl_vec;
	wire [4:0] _mshrs_io_replay_bits_uop_rob_idx;
	wire [3:0] _mshrs_io_replay_bits_uop_ldq_idx;
	wire [3:0] _mshrs_io_replay_bits_uop_stq_idx;
	wire [1:0] _mshrs_io_replay_bits_uop_rxq_idx;
	wire [5:0] _mshrs_io_replay_bits_uop_pdst;
	wire [5:0] _mshrs_io_replay_bits_uop_prs1;
	wire [5:0] _mshrs_io_replay_bits_uop_prs2;
	wire [5:0] _mshrs_io_replay_bits_uop_prs3;
	wire [3:0] _mshrs_io_replay_bits_uop_ppred;
	wire _mshrs_io_replay_bits_uop_prs1_busy;
	wire _mshrs_io_replay_bits_uop_prs2_busy;
	wire _mshrs_io_replay_bits_uop_prs3_busy;
	wire _mshrs_io_replay_bits_uop_ppred_busy;
	wire [5:0] _mshrs_io_replay_bits_uop_stale_pdst;
	wire _mshrs_io_replay_bits_uop_exception;
	wire [63:0] _mshrs_io_replay_bits_uop_exc_cause;
	wire [4:0] _mshrs_io_replay_bits_uop_mem_cmd;
	wire [1:0] _mshrs_io_replay_bits_uop_mem_size;
	wire _mshrs_io_replay_bits_uop_mem_signed;
	wire _mshrs_io_replay_bits_uop_uses_ldq;
	wire _mshrs_io_replay_bits_uop_uses_stq;
	wire _mshrs_io_replay_bits_uop_is_unique;
	wire _mshrs_io_replay_bits_uop_flush_on_commit;
	wire [2:0] _mshrs_io_replay_bits_uop_csr_cmd;
	wire _mshrs_io_replay_bits_uop_ldst_is_rs1;
	wire [5:0] _mshrs_io_replay_bits_uop_ldst;
	wire [5:0] _mshrs_io_replay_bits_uop_lrs1;
	wire [5:0] _mshrs_io_replay_bits_uop_lrs2;
	wire [5:0] _mshrs_io_replay_bits_uop_lrs3;
	wire [1:0] _mshrs_io_replay_bits_uop_dst_rtype;
	wire [1:0] _mshrs_io_replay_bits_uop_lrs1_rtype;
	wire [1:0] _mshrs_io_replay_bits_uop_lrs2_rtype;
	wire _mshrs_io_replay_bits_uop_frs3_en;
	wire _mshrs_io_replay_bits_uop_fcn_dw;
	wire [4:0] _mshrs_io_replay_bits_uop_fcn_op;
	wire _mshrs_io_replay_bits_uop_fp_val;
	wire [2:0] _mshrs_io_replay_bits_uop_fp_rm;
	wire [1:0] _mshrs_io_replay_bits_uop_fp_typ;
	wire _mshrs_io_replay_bits_uop_xcpt_pf_if;
	wire _mshrs_io_replay_bits_uop_xcpt_ae_if;
	wire _mshrs_io_replay_bits_uop_xcpt_ma_if;
	wire _mshrs_io_replay_bits_uop_bp_debug_if;
	wire _mshrs_io_replay_bits_uop_bp_xcpt_if;
	wire [2:0] _mshrs_io_replay_bits_uop_debug_fsrc;
	wire [2:0] _mshrs_io_replay_bits_uop_debug_tsrc;
	wire [39:0] _mshrs_io_replay_bits_addr;
	wire [63:0] _mshrs_io_replay_bits_data;
	wire _mshrs_io_replay_bits_is_hella;
	wire [3:0] _mshrs_io_replay_bits_way_en;
	wire _mshrs_io_wb_req_valid;
	wire [19:0] _mshrs_io_wb_req_bits_tag;
	wire [5:0] _mshrs_io_wb_req_bits_idx;
	wire [1:0] _mshrs_io_wb_req_bits_source;
	wire [2:0] _mshrs_io_wb_req_bits_param;
	wire [3:0] _mshrs_io_wb_req_bits_way_en;
	wire _mshrs_io_wb_req_bits_voluntary;
	wire _mshrs_io_fence_rdy;
	wire _mshrs_io_probe_rdy;
	wire _prober_io_req_ready;
	wire _prober_io_rep_valid;
	wire [2:0] _prober_io_rep_bits_param;
	wire [3:0] _prober_io_rep_bits_size;
	wire [1:0] _prober_io_rep_bits_source;
	wire [31:0] _prober_io_rep_bits_address;
	wire _prober_io_meta_read_valid;
	wire [5:0] _prober_io_meta_read_bits_idx;
	wire [19:0] _prober_io_meta_read_bits_tag;
	wire _prober_io_meta_write_valid;
	wire [5:0] _prober_io_meta_write_bits_idx;
	wire [3:0] _prober_io_meta_write_bits_way_en;
	wire [1:0] _prober_io_meta_write_bits_data_coh_state;
	wire [19:0] _prober_io_meta_write_bits_data_tag;
	wire _prober_io_wb_req_valid;
	wire [19:0] _prober_io_wb_req_bits_tag;
	wire [5:0] _prober_io_wb_req_bits_idx;
	wire [1:0] _prober_io_wb_req_bits_source;
	wire [2:0] _prober_io_wb_req_bits_param;
	wire [3:0] _prober_io_wb_req_bits_way_en;
	wire _prober_io_mshr_wb_rdy;
	wire _prober_io_lsu_release_valid;
	wire [31:0] _prober_io_lsu_release_bits_address;
	wire _prober_io_state_valid;
	wire [39:0] _prober_io_state_bits;
	wire _wb_io_req_ready;
	wire _wb_io_meta_read_valid;
	wire [5:0] _wb_io_meta_read_bits_idx;
	wire [19:0] _wb_io_meta_read_bits_tag;
	wire _wb_io_resp;
	wire _wb_io_idx_valid;
	wire [5:0] _wb_io_idx_bits;
	wire _wb_io_data_req_valid;
	wire [3:0] _wb_io_data_req_bits_way_en;
	wire [11:0] _wb_io_data_req_bits_addr;
	wire _wb_io_release_valid;
	wire [2:0] _wb_io_release_bits_opcode;
	wire [2:0] _wb_io_release_bits_param;
	wire [1:0] _wb_io_release_bits_source;
	wire [31:0] _wb_io_release_bits_address;
	wire [63:0] _wb_io_release_bits_data;
	wire _wb_io_lsu_release_valid;
	wire [31:0] _wb_io_lsu_release_bits_address;
	wire io_lsu_req_ready_0 = (_metaReadArb_io_in_4_ready & _dataReadArb_io_in_2_ready) & ~_mshrs_io_resp_valid;
	wire _wb_fire_T = _wb_io_data_req_ready_T_2 & _wb_io_meta_read_valid;
	wire _wb_fire_T_1 = _wb_io_data_req_ready_T_2 & _wb_io_data_req_valid;
	assign _wb_io_data_req_ready_T_2 = _metaReadArb_io_in_2_ready & _dataReadArb_io_in_1_ready;
	reg [31:0] s1_req_0_uop_inst;
	reg [31:0] s1_req_0_uop_debug_inst;
	reg s1_req_0_uop_is_rvc;
	reg [39:0] s1_req_0_uop_debug_pc;
	reg s1_req_0_uop_iq_type_0;
	reg s1_req_0_uop_iq_type_1;
	reg s1_req_0_uop_iq_type_2;
	reg s1_req_0_uop_iq_type_3;
	reg s1_req_0_uop_fu_code_0;
	reg s1_req_0_uop_fu_code_1;
	reg s1_req_0_uop_fu_code_2;
	reg s1_req_0_uop_fu_code_3;
	reg s1_req_0_uop_fu_code_4;
	reg s1_req_0_uop_fu_code_5;
	reg s1_req_0_uop_fu_code_6;
	reg s1_req_0_uop_fu_code_7;
	reg s1_req_0_uop_fu_code_8;
	reg s1_req_0_uop_fu_code_9;
	reg s1_req_0_uop_iw_issued;
	reg s1_req_0_uop_iw_issued_partial_agen;
	reg s1_req_0_uop_iw_issued_partial_dgen;
	reg s1_req_0_uop_iw_p1_speculative_child;
	reg s1_req_0_uop_iw_p2_speculative_child;
	reg s1_req_0_uop_iw_p1_bypass_hint;
	reg s1_req_0_uop_iw_p2_bypass_hint;
	reg s1_req_0_uop_iw_p3_bypass_hint;
	reg s1_req_0_uop_dis_col_sel;
	reg [7:0] s1_req_0_uop_br_mask;
	reg [2:0] s1_req_0_uop_br_tag;
	reg [3:0] s1_req_0_uop_br_type;
	reg s1_req_0_uop_is_sfb;
	reg s1_req_0_uop_is_fence;
	reg s1_req_0_uop_is_fencei;
	reg s1_req_0_uop_is_sfence;
	reg s1_req_0_uop_is_amo;
	reg s1_req_0_uop_is_eret;
	reg s1_req_0_uop_is_sys_pc2epc;
	reg s1_req_0_uop_is_rocc;
	reg s1_req_0_uop_is_mov;
	reg [3:0] s1_req_0_uop_ftq_idx;
	reg s1_req_0_uop_edge_inst;
	reg [5:0] s1_req_0_uop_pc_lob;
	reg s1_req_0_uop_taken;
	reg s1_req_0_uop_imm_rename;
	reg [2:0] s1_req_0_uop_imm_sel;
	reg [4:0] s1_req_0_uop_pimm;
	reg [19:0] s1_req_0_uop_imm_packed;
	reg [1:0] s1_req_0_uop_op1_sel;
	reg [2:0] s1_req_0_uop_op2_sel;
	reg s1_req_0_uop_fp_ctrl_ldst;
	reg s1_req_0_uop_fp_ctrl_wen;
	reg s1_req_0_uop_fp_ctrl_ren1;
	reg s1_req_0_uop_fp_ctrl_ren2;
	reg s1_req_0_uop_fp_ctrl_ren3;
	reg s1_req_0_uop_fp_ctrl_swap12;
	reg s1_req_0_uop_fp_ctrl_swap23;
	reg [1:0] s1_req_0_uop_fp_ctrl_typeTagIn;
	reg [1:0] s1_req_0_uop_fp_ctrl_typeTagOut;
	reg s1_req_0_uop_fp_ctrl_fromint;
	reg s1_req_0_uop_fp_ctrl_toint;
	reg s1_req_0_uop_fp_ctrl_fastpipe;
	reg s1_req_0_uop_fp_ctrl_fma;
	reg s1_req_0_uop_fp_ctrl_div;
	reg s1_req_0_uop_fp_ctrl_sqrt;
	reg s1_req_0_uop_fp_ctrl_wflags;
	reg s1_req_0_uop_fp_ctrl_vec;
	reg [4:0] s1_req_0_uop_rob_idx;
	reg [3:0] s1_req_0_uop_ldq_idx;
	reg [3:0] s1_req_0_uop_stq_idx;
	reg [1:0] s1_req_0_uop_rxq_idx;
	reg [5:0] s1_req_0_uop_pdst;
	reg [5:0] s1_req_0_uop_prs1;
	reg [5:0] s1_req_0_uop_prs2;
	reg [5:0] s1_req_0_uop_prs3;
	reg [3:0] s1_req_0_uop_ppred;
	reg s1_req_0_uop_prs1_busy;
	reg s1_req_0_uop_prs2_busy;
	reg s1_req_0_uop_prs3_busy;
	reg s1_req_0_uop_ppred_busy;
	reg [5:0] s1_req_0_uop_stale_pdst;
	reg s1_req_0_uop_exception;
	reg [63:0] s1_req_0_uop_exc_cause;
	reg [4:0] s1_req_0_uop_mem_cmd;
	reg [1:0] s1_req_0_uop_mem_size;
	reg s1_req_0_uop_mem_signed;
	reg s1_req_0_uop_uses_ldq;
	reg s1_req_0_uop_uses_stq;
	reg s1_req_0_uop_is_unique;
	reg s1_req_0_uop_flush_on_commit;
	reg [2:0] s1_req_0_uop_csr_cmd;
	reg s1_req_0_uop_ldst_is_rs1;
	reg [5:0] s1_req_0_uop_ldst;
	reg [5:0] s1_req_0_uop_lrs1;
	reg [5:0] s1_req_0_uop_lrs2;
	reg [5:0] s1_req_0_uop_lrs3;
	reg [1:0] s1_req_0_uop_dst_rtype;
	reg [1:0] s1_req_0_uop_lrs1_rtype;
	reg [1:0] s1_req_0_uop_lrs2_rtype;
	reg s1_req_0_uop_frs3_en;
	reg s1_req_0_uop_fcn_dw;
	reg [4:0] s1_req_0_uop_fcn_op;
	reg s1_req_0_uop_fp_val;
	reg [2:0] s1_req_0_uop_fp_rm;
	reg [1:0] s1_req_0_uop_fp_typ;
	reg s1_req_0_uop_xcpt_pf_if;
	reg s1_req_0_uop_xcpt_ae_if;
	reg s1_req_0_uop_xcpt_ma_if;
	reg s1_req_0_uop_bp_debug_if;
	reg s1_req_0_uop_bp_xcpt_if;
	reg [2:0] s1_req_0_uop_debug_fsrc;
	reg [2:0] s1_req_0_uop_debug_tsrc;
	reg [39:0] s1_req_0_addr;
	reg [63:0] s1_req_0_data;
	reg s1_req_0_is_hella;
	reg s1_valid_REG;
	reg REG;
	reg REG_1;
	reg s1_send_resp_or_nack_0;
	reg [2:0] s1_type;
	reg [3:0] s1_mshr_meta_read_way_en;
	reg [3:0] s1_replay_way_en;
	reg [3:0] s1_wb_way_en;
	reg [31:0] s2_req_0_uop_inst;
	reg [31:0] s2_req_0_uop_debug_inst;
	reg s2_req_0_uop_is_rvc;
	reg [39:0] s2_req_0_uop_debug_pc;
	reg s2_req_0_uop_iq_type_0;
	reg s2_req_0_uop_iq_type_1;
	reg s2_req_0_uop_iq_type_2;
	reg s2_req_0_uop_iq_type_3;
	reg s2_req_0_uop_fu_code_0;
	reg s2_req_0_uop_fu_code_1;
	reg s2_req_0_uop_fu_code_2;
	reg s2_req_0_uop_fu_code_3;
	reg s2_req_0_uop_fu_code_4;
	reg s2_req_0_uop_fu_code_5;
	reg s2_req_0_uop_fu_code_6;
	reg s2_req_0_uop_fu_code_7;
	reg s2_req_0_uop_fu_code_8;
	reg s2_req_0_uop_fu_code_9;
	reg s2_req_0_uop_iw_issued;
	reg s2_req_0_uop_iw_issued_partial_agen;
	reg s2_req_0_uop_iw_issued_partial_dgen;
	reg s2_req_0_uop_iw_p1_speculative_child;
	reg s2_req_0_uop_iw_p2_speculative_child;
	reg s2_req_0_uop_iw_p1_bypass_hint;
	reg s2_req_0_uop_iw_p2_bypass_hint;
	reg s2_req_0_uop_iw_p3_bypass_hint;
	reg s2_req_0_uop_dis_col_sel;
	reg [7:0] s2_req_0_uop_br_mask;
	reg [2:0] s2_req_0_uop_br_tag;
	reg [3:0] s2_req_0_uop_br_type;
	reg s2_req_0_uop_is_sfb;
	reg s2_req_0_uop_is_fence;
	reg s2_req_0_uop_is_fencei;
	reg s2_req_0_uop_is_sfence;
	reg s2_req_0_uop_is_amo;
	reg s2_req_0_uop_is_eret;
	reg s2_req_0_uop_is_sys_pc2epc;
	reg s2_req_0_uop_is_rocc;
	reg s2_req_0_uop_is_mov;
	reg [3:0] s2_req_0_uop_ftq_idx;
	reg s2_req_0_uop_edge_inst;
	reg [5:0] s2_req_0_uop_pc_lob;
	reg s2_req_0_uop_taken;
	reg s2_req_0_uop_imm_rename;
	reg [2:0] s2_req_0_uop_imm_sel;
	reg [4:0] s2_req_0_uop_pimm;
	reg [19:0] s2_req_0_uop_imm_packed;
	reg [1:0] s2_req_0_uop_op1_sel;
	reg [2:0] s2_req_0_uop_op2_sel;
	reg s2_req_0_uop_fp_ctrl_ldst;
	reg s2_req_0_uop_fp_ctrl_wen;
	reg s2_req_0_uop_fp_ctrl_ren1;
	reg s2_req_0_uop_fp_ctrl_ren2;
	reg s2_req_0_uop_fp_ctrl_ren3;
	reg s2_req_0_uop_fp_ctrl_swap12;
	reg s2_req_0_uop_fp_ctrl_swap23;
	reg [1:0] s2_req_0_uop_fp_ctrl_typeTagIn;
	reg [1:0] s2_req_0_uop_fp_ctrl_typeTagOut;
	reg s2_req_0_uop_fp_ctrl_fromint;
	reg s2_req_0_uop_fp_ctrl_toint;
	reg s2_req_0_uop_fp_ctrl_fastpipe;
	reg s2_req_0_uop_fp_ctrl_fma;
	reg s2_req_0_uop_fp_ctrl_div;
	reg s2_req_0_uop_fp_ctrl_sqrt;
	reg s2_req_0_uop_fp_ctrl_wflags;
	reg s2_req_0_uop_fp_ctrl_vec;
	reg [4:0] s2_req_0_uop_rob_idx;
	reg [3:0] s2_req_0_uop_ldq_idx;
	reg [3:0] s2_req_0_uop_stq_idx;
	reg [1:0] s2_req_0_uop_rxq_idx;
	reg [5:0] s2_req_0_uop_pdst;
	reg [5:0] s2_req_0_uop_prs1;
	reg [5:0] s2_req_0_uop_prs2;
	reg [5:0] s2_req_0_uop_prs3;
	reg [3:0] s2_req_0_uop_ppred;
	reg s2_req_0_uop_prs1_busy;
	reg s2_req_0_uop_prs2_busy;
	reg s2_req_0_uop_prs3_busy;
	reg s2_req_0_uop_ppred_busy;
	reg [5:0] s2_req_0_uop_stale_pdst;
	reg s2_req_0_uop_exception;
	reg [63:0] s2_req_0_uop_exc_cause;
	reg [4:0] s2_req_0_uop_mem_cmd;
	reg [1:0] s2_req_0_uop_mem_size;
	reg s2_req_0_uop_mem_signed;
	reg s2_req_0_uop_uses_ldq;
	reg s2_req_0_uop_uses_stq;
	reg s2_req_0_uop_is_unique;
	reg s2_req_0_uop_flush_on_commit;
	reg [2:0] s2_req_0_uop_csr_cmd;
	reg s2_req_0_uop_ldst_is_rs1;
	reg [5:0] s2_req_0_uop_ldst;
	reg [5:0] s2_req_0_uop_lrs1;
	reg [5:0] s2_req_0_uop_lrs2;
	reg [5:0] s2_req_0_uop_lrs3;
	reg [1:0] s2_req_0_uop_dst_rtype;
	reg [1:0] s2_req_0_uop_lrs1_rtype;
	reg [1:0] s2_req_0_uop_lrs2_rtype;
	reg s2_req_0_uop_frs3_en;
	reg s2_req_0_uop_fcn_dw;
	reg [4:0] s2_req_0_uop_fcn_op;
	reg s2_req_0_uop_fp_val;
	reg [2:0] s2_req_0_uop_fp_rm;
	reg [1:0] s2_req_0_uop_fp_typ;
	reg s2_req_0_uop_xcpt_pf_if;
	reg s2_req_0_uop_xcpt_ae_if;
	reg s2_req_0_uop_xcpt_ma_if;
	reg s2_req_0_uop_bp_debug_if;
	reg s2_req_0_uop_bp_xcpt_if;
	reg [2:0] s2_req_0_uop_debug_fsrc;
	reg [2:0] s2_req_0_uop_debug_tsrc;
	reg [39:0] s2_req_0_addr;
	reg [63:0] s2_req_0_data;
	reg s2_req_0_is_hella;
	reg [2:0] s2_type;
	reg s2_valid_REG;
	reg [1:0] s2_hit_state_REG_state;
	reg [1:0] s2_hit_state_REG_1_state;
	reg [1:0] s2_hit_state_REG_2_state;
	reg [1:0] s2_hit_state_REG_3_state;
	wire [1:0] s2_hit_state_0_state = (((s2_tag_match_way_0[0] ? s2_hit_state_REG_state : 2'h0) | (s2_tag_match_way_0[1] ? s2_hit_state_REG_1_state : 2'h0)) | (s2_tag_match_way_0[2] ? s2_hit_state_REG_2_state : 2'h0)) | (s2_tag_match_way_0[3] ? s2_hit_state_REG_3_state : 2'h0);
	wire _s3_valid_T_1 = s2_req_0_uop_mem_cmd == 5'h01;
	wire _s3_valid_T_2 = s2_req_0_uop_mem_cmd == 5'h11;
	wire _s3_valid_T_4 = s2_req_0_uop_mem_cmd == 5'h07;
	wire _s3_valid_T_6 = s2_req_0_uop_mem_cmd == 5'h04;
	wire _s3_valid_T_7 = s2_req_0_uop_mem_cmd == 5'h09;
	wire _s3_valid_T_8 = s2_req_0_uop_mem_cmd == 5'h0a;
	wire _s3_valid_T_9 = s2_req_0_uop_mem_cmd == 5'h0b;
	wire _s3_valid_T_13 = s2_req_0_uop_mem_cmd == 5'h08;
	wire _s3_valid_T_14 = s2_req_0_uop_mem_cmd == 5'h0c;
	wire _s3_valid_T_15 = s2_req_0_uop_mem_cmd == 5'h0d;
	wire _s3_valid_T_16 = s2_req_0_uop_mem_cmd == 5'h0e;
	wire _s3_valid_T_17 = s2_req_0_uop_mem_cmd == 5'h0f;
	wire _mshrs_io_req_0_valid_T_18 = s2_req_0_uop_mem_cmd == 5'h03;
	wire _mshrs_io_req_0_valid_T_22 = s2_req_0_uop_mem_cmd == 5'h06;
	wire [3:0] _s2_has_permission_r_T = {((((((((((_s3_valid_T_1 | _s3_valid_T_2) | _s3_valid_T_4) | _s3_valid_T_6) | _s3_valid_T_7) | _s3_valid_T_8) | _s3_valid_T_9) | _s3_valid_T_13) | _s3_valid_T_14) | _s3_valid_T_15) | _s3_valid_T_16) | _s3_valid_T_17, ((((((((((((_s3_valid_T_1 | _s3_valid_T_2) | _s3_valid_T_4) | _s3_valid_T_6) | _s3_valid_T_7) | _s3_valid_T_8) | _s3_valid_T_9) | _s3_valid_T_13) | _s3_valid_T_14) | _s3_valid_T_15) | _s3_valid_T_16) | _s3_valid_T_17) | _mshrs_io_req_0_valid_T_18) | _mshrs_io_req_0_valid_T_22, s2_hit_state_0_state};
	wire s2_has_permission_0 = ((((((_s2_has_permission_r_T == 4'h3) | (_s2_has_permission_r_T == 4'h2)) | (_s2_has_permission_r_T == 4'h1)) | (_s2_has_permission_r_T == 4'h7)) | (_s2_has_permission_r_T == 4'h6)) | &_s2_has_permission_r_T) | (_s2_has_permission_r_T == 4'he);
	wire [3:0] _s2_new_hit_state_r_T = {((((((((((_s3_valid_T_1 | _s3_valid_T_2) | _s3_valid_T_4) | _s3_valid_T_6) | _s3_valid_T_7) | _s3_valid_T_8) | _s3_valid_T_9) | _s3_valid_T_13) | _s3_valid_T_14) | _s3_valid_T_15) | _s3_valid_T_16) | _s3_valid_T_17, ((((((((((((_s3_valid_T_1 | _s3_valid_T_2) | _s3_valid_T_4) | _s3_valid_T_6) | _s3_valid_T_7) | _s3_valid_T_8) | _s3_valid_T_9) | _s3_valid_T_13) | _s3_valid_T_14) | _s3_valid_T_15) | _s3_valid_T_16) | _s3_valid_T_17) | _mshrs_io_req_0_valid_T_18) | _mshrs_io_req_0_valid_T_22, s2_hit_state_0_state};
	wire [1:0] _s2_new_hit_state_r_T_27 = {1'h0, _s2_new_hit_state_r_T == 4'hc};
	wire [31:0] _GEN = {6'h3e, _s2_new_hit_state_r_T_27, _s2_new_hit_state_r_T_27, _s2_new_hit_state_r_T_27, _s2_new_hit_state_r_T_27, _s2_new_hit_state_r_T_27, 16'he9e4};
	wire _s2_hit_T_6 = s2_type == 3'h2;
	wire s2_hit_0 = ((((|s2_tag_match_way_0 & s2_has_permission_0) & (s2_hit_state_0_state == _GEN[_s2_new_hit_state_r_T * 2+:2])) & ~_mshrs_io_block_hit_0) | ~(|s2_type)) | _s2_hit_T_6;
	reg s2_wb_idx_matches_0;
	reg [39:0] debug_sc_fail_addr;
	reg [7:0] debug_sc_fail_cnt;
	reg [6:0] lrsc_count;
	reg [33:0] lrsc_addr;
	reg s2_lr_REG;
	reg s2_sc_REG;
	wire s2_sc = _s3_valid_T_4 & (~s2_sc_REG | ~(|s2_type));
	wire s2_lrsc_addr_match_0 = |lrsc_count[6:2] & (lrsc_addr == s2_req_0_addr[39:6]);
	wire s2_sc_fail = s2_sc & ~s2_lrsc_addr_match_0;
	wire _mshrs_io_req_0_valid_T_10 = s2_type == 3'h4;
	wire [63:0] s2_data_muxed_0 = (((s2_tag_match_way_0[0] ? _data_io_resp_0_0 : 64'h0000000000000000) | (s2_tag_match_way_0[1] ? _data_io_resp_0_1 : 64'h0000000000000000)) | (s2_tag_match_way_0[2] ? _data_io_resp_0_2 : 64'h0000000000000000)) | (s2_tag_match_way_0[3] ? _data_io_resp_0_3 : 64'h0000000000000000);
	reg [1:0] s2_replaced_way_en_REG;
	reg [1:0] s2_repl_meta_REG_coh_state;
	reg [19:0] s2_repl_meta_REG_tag;
	reg [1:0] s2_repl_meta_REG_1_coh_state;
	reg [19:0] s2_repl_meta_REG_1_tag;
	reg [1:0] s2_repl_meta_REG_2_coh_state;
	reg [19:0] s2_repl_meta_REG_2_tag;
	reg [1:0] s2_repl_meta_REG_3_coh_state;
	reg [19:0] s2_repl_meta_REG_3_tag;
	wire _s2_repl_meta_T = s2_replaced_way_en_REG == 2'h0;
	wire _s2_repl_meta_T_1 = s2_replaced_way_en_REG == 2'h1;
	wire _s2_repl_meta_T_2 = s2_replaced_way_en_REG == 2'h2;
	reg s2_nack_hit_0;
	wire _s3_valid_T = s2_valid_REG & s2_hit_0;
	wire s2_nack_victim_0 = _s3_valid_T & _mshrs_io_secondary_miss_0;
	wire s2_nack_wb_0 = (s2_valid_REG & ~s2_hit_0) & s2_wb_idx_matches_0;
	wire s2_nack_0 = (((((s2_valid_REG & ~s2_hit_0) & ~_mshrs_io_req_0_ready) | s2_nack_hit_0) | s2_nack_victim_0) | s2_nack_wb_0) & |s2_type;
	reg s2_send_resp_REG;
	wire _mshrs_io_req_0_valid_T_20 = s2_req_0_uop_mem_cmd == 5'h00;
	wire _mshrs_io_req_0_valid_T_21 = s2_req_0_uop_mem_cmd == 5'h10;
	wire s2_send_resp_0 = ((s2_send_resp_REG & (~(s2_nack_hit_0 | s2_nack_victim_0) | ~(|s2_type))) & s2_hit_0) & ((((((((((((_mshrs_io_req_0_valid_T_20 | _mshrs_io_req_0_valid_T_21) | _mshrs_io_req_0_valid_T_22) | _s3_valid_T_4) | _s3_valid_T_6) | _s3_valid_T_7) | _s3_valid_T_8) | _s3_valid_T_9) | _s3_valid_T_13) | _s3_valid_T_14) | _s3_valid_T_15) | _s3_valid_T_16) | _s3_valid_T_17);
	reg s2_send_store_ack_REG;
	wire replace = _mshrs_io_req_0_ready & _mshrs_io_req_0_valid_T_70;
	reg s2_send_nack_REG;
	wire s2_send_nack_0 = s2_send_nack_REG & s2_nack_0;
	wire s2_store_failed = ((s2_valid_REG & s2_nack_0) & s2_send_nack_0) & s2_req_0_uop_uses_stq;
	assign _mshrs_io_req_0_valid_T_70 = ((((((s2_valid_REG & ~s2_hit_0) & ~s2_nack_hit_0) & ~s2_nack_victim_0) & ~s2_nack_wb_0) & (_mshrs_io_req_0_valid_T_10 | (s2_type == 3'h5))) & ~(io_lsu_exception & s2_req_0_uop_uses_ldq)) & (((((((((((((((((s2_req_0_uop_mem_cmd == 5'h02) | _mshrs_io_req_0_valid_T_18) | _mshrs_io_req_0_valid_T_20) | _mshrs_io_req_0_valid_T_21) | _mshrs_io_req_0_valid_T_22) | _s3_valid_T_4) | _s3_valid_T_6) | _s3_valid_T_7) | _s3_valid_T_8) | _s3_valid_T_9) | _s3_valid_T_13) | _s3_valid_T_14) | _s3_valid_T_15) | _s3_valid_T_16) | _s3_valid_T_17) | _s3_valid_T_1) | _s3_valid_T_2);
	reg [1:0] mshrs_io_meta_resp_bits_REG_0_coh_state;
	reg [1:0] mshrs_io_meta_resp_bits_REG_1_coh_state;
	reg [1:0] mshrs_io_meta_resp_bits_REG_2_coh_state;
	reg [1:0] mshrs_io_meta_resp_bits_REG_3_coh_state;
	wire _wb_io_mem_grant_T_1 = auto_out_d_bits_source == 2'h2;
	wire nodeOut_d_ready = _wb_io_mem_grant_T_1 | _mshrs_io_mem_grant_ready;
	reg [8:0] beatsLeft;
	wire idle = beatsLeft == 9'h000;
	wire winner_1 = ~_wb_io_release_valid & _prober_io_rep_valid;
	wire _nodeOut_c_valid_T = _wb_io_release_valid | _prober_io_rep_valid;
	wire _io_lsu_perf_release_T = auto_out_c_ready & nodeOut_c_valid;
	reg state_0;
	reg state_1;
	wire muxState_0 = (idle ? _wb_io_release_valid : state_0);
	wire muxState_1 = (idle ? winner_1 : state_1);
	assign nodeOut_c_valid = (idle ? _nodeOut_c_valid_T : (state_0 & _wb_io_release_valid) | (state_1 & _prober_io_rep_valid));
	wire [3:0] _nodeOut_c_bits_T_14 = (muxState_0 ? 4'h6 : 4'h0) | (muxState_1 ? _prober_io_rep_bits_size : 4'h0);
	wire [2:0] _nodeOut_c_bits_T_20 = (muxState_0 ? _wb_io_release_bits_opcode : 3'h0) | {muxState_1, 2'h0};
	wire [26:0] _io_lsu_perf_release_beats1_decode_T = 27'h0000fff << _nodeOut_c_bits_T_14;
	wire [8:0] io_lsu_perf_release_beats1 = (_nodeOut_c_bits_T_20[0] ? ~_io_lsu_perf_release_beats1_decode_T[11:3] : 9'h000);
	reg [8:0] io_lsu_perf_release_counter;
	wire _io_lsu_perf_acquire_T = auto_out_a_ready & _mshrs_io_mem_acquire_valid;
	wire [26:0] _io_lsu_perf_acquire_beats1_decode_T = 27'h0000fff << _mshrs_io_mem_acquire_bits_size;
	wire [8:0] io_lsu_perf_acquire_beats1 = (_mshrs_io_mem_acquire_bits_opcode[2] ? 9'h000 : ~_io_lsu_perf_acquire_beats1_decode_T[11:3]);
	reg [8:0] io_lsu_perf_acquire_counter;
	wire [31:0] io_lsu_resp_0_bits_data_zeroed = (s2_req_0_addr[2] ? size_dat_padded[63:32] : size_dat_padded[31:0]);
	wire [15:0] io_lsu_resp_0_bits_data_zeroed_1 = (s2_req_0_addr[1] ? io_lsu_resp_0_bits_data_zeroed[31:16] : io_lsu_resp_0_bits_data_zeroed[15:0]);
	wire [7:0] io_lsu_resp_0_bits_data_zeroed_2 = (s2_sc ? 8'h00 : (s2_req_0_addr[0] ? io_lsu_resp_0_bits_data_zeroed_1[15:8] : io_lsu_resp_0_bits_data_zeroed_1[7:0]));
	wire io_lsu_nack_0_valid_0 = s2_valid_REG & s2_send_nack_0;
	reg [4:0] s3_req_REG_uop_mem_cmd;
	reg [1:0] s3_req_REG_uop_mem_size;
	reg [39:0] s3_req_REG_addr;
	reg s3_valid;
	reg [63:0] s3_data_word;
	reg [39:0] s4_req_addr;
	reg [63:0] s4_req_data;
	reg s4_valid;
	reg [39:0] s5_req_addr;
	reg [63:0] s5_req_data;
	reg s5_valid;
	assign size_dat_padded = (s3_valid & (s2_req_0_addr[39:3] == s3_req_REG_addr[39:3]) ? _amoalu_io_out : (s4_valid & (s2_req_0_addr[39:3] == s4_req_addr[39:3]) ? s4_req_data : (s5_valid & (s2_req_0_addr[39:3] == s5_req_addr[39:3]) ? s5_req_data : s2_data_muxed_0)));
	wire [1:0] _amoalu_io_mask_T = {s3_req_REG_addr[0] | (|s3_req_REG_uop_mem_size), ~s3_req_REG_addr[0]};
	wire [3:0] _amoalu_io_mask_T_1 = {(s3_req_REG_addr[1] ? _amoalu_io_mask_T : 2'h0) | {2 {s3_req_REG_uop_mem_size[1]}}, (s3_req_REG_addr[1] ? 2'h0 : _amoalu_io_mask_T)};
	reg [63:0] amoalu_io_rhs_REG;
	reg [3:0] s3_way;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg wb_fire;
		reg prober_fire;
		reg _s1_valid_T_8;
		reg _s0_send_resp_or_nack_T_1;
		reg _s0_type_T_1;
		reg _GEN_0;
		reg [7:0] s0_req_0_uop_br_mask;
		reg s0_req_0_uop_uses_ldq;
		reg s0_req_0_uop_uses_stq;
		reg s1_nack_0;
		reg s2_lr;
		reg _GEN_1;
		wb_fire = _wb_fire_T & _wb_fire_T_1;
		prober_fire = _metaReadArb_io_in_1_ready & _prober_io_meta_read_valid;
		_s1_valid_T_8 = io_lsu_req_ready_0 & io_lsu_req_valid;
		_s0_send_resp_or_nack_T_1 = _metaReadArb_io_in_0_ready & _mshrs_io_replay_valid;
		_s0_type_T_1 = _metaReadArb_io_in_3_ready & _mshrs_io_meta_read_valid;
		_GEN_0 = (wb_fire | prober_fire) | _s0_type_T_1;
		s0_req_0_uop_br_mask = (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_br_mask : (_GEN_0 ? 8'h00 : _mshrs_io_replay_bits_uop_br_mask));
		s0_req_0_uop_uses_ldq = (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_uses_ldq : ~_GEN_0 & _mshrs_io_replay_bits_uop_uses_ldq);
		s0_req_0_uop_uses_stq = (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_uses_stq : ~_GEN_0 & _mshrs_io_replay_bits_uop_uses_stq);
		s1_nack_0 = (s1_req_0_addr[11:6] == _prober_io_meta_write_bits_idx) & ~_prober_io_req_ready;
		s2_lr = _mshrs_io_req_0_valid_T_22 & (~s2_lr_REG | ~(|s2_type));
		_GEN_1 = s2_valid_REG & (((_mshrs_io_req_0_valid_T_10 & s2_hit_0) & ~s2_nack_0) | (~(|s2_type) & (s2_req_0_uop_mem_cmd != 5'h05)));
		s1_req_0_uop_inst <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_inst : (_GEN_0 ? 32'h00000000 : _mshrs_io_replay_bits_uop_inst));
		s1_req_0_uop_debug_inst <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_debug_inst : (_GEN_0 ? 32'h00000000 : _mshrs_io_replay_bits_uop_debug_inst));
		s1_req_0_uop_is_rvc <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_is_rvc : ~_GEN_0 & _mshrs_io_replay_bits_uop_is_rvc);
		s1_req_0_uop_debug_pc <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_debug_pc : (_GEN_0 ? 40'h0000000000 : _mshrs_io_replay_bits_uop_debug_pc));
		s1_req_0_uop_iq_type_0 <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_iq_type_0 : ~_GEN_0 & _mshrs_io_replay_bits_uop_iq_type_0);
		s1_req_0_uop_iq_type_1 <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_iq_type_1 : ~_GEN_0 & _mshrs_io_replay_bits_uop_iq_type_1);
		s1_req_0_uop_iq_type_2 <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_iq_type_2 : ~_GEN_0 & _mshrs_io_replay_bits_uop_iq_type_2);
		s1_req_0_uop_iq_type_3 <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_iq_type_3 : ~_GEN_0 & _mshrs_io_replay_bits_uop_iq_type_3);
		s1_req_0_uop_fu_code_0 <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_fu_code_0 : ~_GEN_0 & _mshrs_io_replay_bits_uop_fu_code_0);
		s1_req_0_uop_fu_code_1 <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_fu_code_1 : ~_GEN_0 & _mshrs_io_replay_bits_uop_fu_code_1);
		s1_req_0_uop_fu_code_2 <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_fu_code_2 : ~_GEN_0 & _mshrs_io_replay_bits_uop_fu_code_2);
		s1_req_0_uop_fu_code_3 <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_fu_code_3 : ~_GEN_0 & _mshrs_io_replay_bits_uop_fu_code_3);
		s1_req_0_uop_fu_code_4 <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_fu_code_4 : ~_GEN_0 & _mshrs_io_replay_bits_uop_fu_code_4);
		s1_req_0_uop_fu_code_5 <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_fu_code_5 : ~_GEN_0 & _mshrs_io_replay_bits_uop_fu_code_5);
		s1_req_0_uop_fu_code_6 <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_fu_code_6 : ~_GEN_0 & _mshrs_io_replay_bits_uop_fu_code_6);
		s1_req_0_uop_fu_code_7 <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_fu_code_7 : ~_GEN_0 & _mshrs_io_replay_bits_uop_fu_code_7);
		s1_req_0_uop_fu_code_8 <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_fu_code_8 : ~_GEN_0 & _mshrs_io_replay_bits_uop_fu_code_8);
		s1_req_0_uop_fu_code_9 <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_fu_code_9 : ~_GEN_0 & _mshrs_io_replay_bits_uop_fu_code_9);
		s1_req_0_uop_iw_issued <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_iw_issued : ~_GEN_0 & _mshrs_io_replay_bits_uop_iw_issued);
		s1_req_0_uop_iw_issued_partial_agen <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_iw_issued_partial_agen : ~_GEN_0 & _mshrs_io_replay_bits_uop_iw_issued_partial_agen);
		s1_req_0_uop_iw_issued_partial_dgen <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_iw_issued_partial_dgen : ~_GEN_0 & _mshrs_io_replay_bits_uop_iw_issued_partial_dgen);
		s1_req_0_uop_iw_p1_speculative_child <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_iw_p1_speculative_child : ~_GEN_0 & _mshrs_io_replay_bits_uop_iw_p1_speculative_child);
		s1_req_0_uop_iw_p2_speculative_child <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_iw_p2_speculative_child : ~_GEN_0 & _mshrs_io_replay_bits_uop_iw_p2_speculative_child);
		s1_req_0_uop_iw_p1_bypass_hint <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_iw_p1_bypass_hint : ~_GEN_0 & _mshrs_io_replay_bits_uop_iw_p1_bypass_hint);
		s1_req_0_uop_iw_p2_bypass_hint <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_iw_p2_bypass_hint : ~_GEN_0 & _mshrs_io_replay_bits_uop_iw_p2_bypass_hint);
		s1_req_0_uop_iw_p3_bypass_hint <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_iw_p3_bypass_hint : ~_GEN_0 & _mshrs_io_replay_bits_uop_iw_p3_bypass_hint);
		s1_req_0_uop_dis_col_sel <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_dis_col_sel : ~_GEN_0 & _mshrs_io_replay_bits_uop_dis_col_sel);
		s1_req_0_uop_br_mask <= s0_req_0_uop_br_mask & ~io_lsu_brupdate_b1_resolve_mask;
		s1_req_0_uop_br_tag <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_br_tag : (_GEN_0 ? 3'h0 : _mshrs_io_replay_bits_uop_br_tag));
		s1_req_0_uop_br_type <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_br_type : (_GEN_0 ? 4'h0 : _mshrs_io_replay_bits_uop_br_type));
		s1_req_0_uop_is_sfb <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_is_sfb : ~_GEN_0 & _mshrs_io_replay_bits_uop_is_sfb);
		s1_req_0_uop_is_fence <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_is_fence : ~_GEN_0 & _mshrs_io_replay_bits_uop_is_fence);
		s1_req_0_uop_is_fencei <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_is_fencei : ~_GEN_0 & _mshrs_io_replay_bits_uop_is_fencei);
		s1_req_0_uop_is_sfence <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_is_sfence : ~_GEN_0 & _mshrs_io_replay_bits_uop_is_sfence);
		s1_req_0_uop_is_amo <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_is_amo : ~_GEN_0 & _mshrs_io_replay_bits_uop_is_amo);
		s1_req_0_uop_is_eret <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_is_eret : ~_GEN_0 & _mshrs_io_replay_bits_uop_is_eret);
		s1_req_0_uop_is_sys_pc2epc <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_is_sys_pc2epc : ~_GEN_0 & _mshrs_io_replay_bits_uop_is_sys_pc2epc);
		s1_req_0_uop_is_rocc <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_is_rocc : ~_GEN_0 & _mshrs_io_replay_bits_uop_is_rocc);
		s1_req_0_uop_is_mov <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_is_mov : ~_GEN_0 & _mshrs_io_replay_bits_uop_is_mov);
		s1_req_0_uop_ftq_idx <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_ftq_idx : (_GEN_0 ? 4'h0 : _mshrs_io_replay_bits_uop_ftq_idx));
		s1_req_0_uop_edge_inst <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_edge_inst : ~_GEN_0 & _mshrs_io_replay_bits_uop_edge_inst);
		s1_req_0_uop_pc_lob <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_pc_lob : (_GEN_0 ? 6'h00 : _mshrs_io_replay_bits_uop_pc_lob));
		s1_req_0_uop_taken <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_taken : ~_GEN_0 & _mshrs_io_replay_bits_uop_taken);
		s1_req_0_uop_imm_rename <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_imm_rename : ~_GEN_0 & _mshrs_io_replay_bits_uop_imm_rename);
		s1_req_0_uop_imm_sel <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_imm_sel : (_GEN_0 ? 3'h0 : _mshrs_io_replay_bits_uop_imm_sel));
		s1_req_0_uop_pimm <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_pimm : (_GEN_0 ? 5'h00 : _mshrs_io_replay_bits_uop_pimm));
		s1_req_0_uop_imm_packed <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_imm_packed : (_GEN_0 ? 20'h00000 : _mshrs_io_replay_bits_uop_imm_packed));
		s1_req_0_uop_op1_sel <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_op1_sel : (_GEN_0 ? 2'h0 : _mshrs_io_replay_bits_uop_op1_sel));
		s1_req_0_uop_op2_sel <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_op2_sel : (_GEN_0 ? 3'h0 : _mshrs_io_replay_bits_uop_op2_sel));
		s1_req_0_uop_fp_ctrl_ldst <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_fp_ctrl_ldst : ~_GEN_0 & _mshrs_io_replay_bits_uop_fp_ctrl_ldst);
		s1_req_0_uop_fp_ctrl_wen <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_fp_ctrl_wen : ~_GEN_0 & _mshrs_io_replay_bits_uop_fp_ctrl_wen);
		s1_req_0_uop_fp_ctrl_ren1 <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_fp_ctrl_ren1 : ~_GEN_0 & _mshrs_io_replay_bits_uop_fp_ctrl_ren1);
		s1_req_0_uop_fp_ctrl_ren2 <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_fp_ctrl_ren2 : ~_GEN_0 & _mshrs_io_replay_bits_uop_fp_ctrl_ren2);
		s1_req_0_uop_fp_ctrl_ren3 <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_fp_ctrl_ren3 : ~_GEN_0 & _mshrs_io_replay_bits_uop_fp_ctrl_ren3);
		s1_req_0_uop_fp_ctrl_swap12 <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_fp_ctrl_swap12 : ~_GEN_0 & _mshrs_io_replay_bits_uop_fp_ctrl_swap12);
		s1_req_0_uop_fp_ctrl_swap23 <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_fp_ctrl_swap23 : ~_GEN_0 & _mshrs_io_replay_bits_uop_fp_ctrl_swap23);
		s1_req_0_uop_fp_ctrl_typeTagIn <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_fp_ctrl_typeTagIn : (_GEN_0 ? 2'h0 : _mshrs_io_replay_bits_uop_fp_ctrl_typeTagIn));
		s1_req_0_uop_fp_ctrl_typeTagOut <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_fp_ctrl_typeTagOut : (_GEN_0 ? 2'h0 : _mshrs_io_replay_bits_uop_fp_ctrl_typeTagOut));
		s1_req_0_uop_fp_ctrl_fromint <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_fp_ctrl_fromint : ~_GEN_0 & _mshrs_io_replay_bits_uop_fp_ctrl_fromint);
		s1_req_0_uop_fp_ctrl_toint <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_fp_ctrl_toint : ~_GEN_0 & _mshrs_io_replay_bits_uop_fp_ctrl_toint);
		s1_req_0_uop_fp_ctrl_fastpipe <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_fp_ctrl_fastpipe : ~_GEN_0 & _mshrs_io_replay_bits_uop_fp_ctrl_fastpipe);
		s1_req_0_uop_fp_ctrl_fma <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_fp_ctrl_fma : ~_GEN_0 & _mshrs_io_replay_bits_uop_fp_ctrl_fma);
		s1_req_0_uop_fp_ctrl_div <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_fp_ctrl_div : ~_GEN_0 & _mshrs_io_replay_bits_uop_fp_ctrl_div);
		s1_req_0_uop_fp_ctrl_sqrt <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_fp_ctrl_sqrt : ~_GEN_0 & _mshrs_io_replay_bits_uop_fp_ctrl_sqrt);
		s1_req_0_uop_fp_ctrl_wflags <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_fp_ctrl_wflags : ~_GEN_0 & _mshrs_io_replay_bits_uop_fp_ctrl_wflags);
		s1_req_0_uop_fp_ctrl_vec <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_fp_ctrl_vec : ~_GEN_0 & _mshrs_io_replay_bits_uop_fp_ctrl_vec);
		s1_req_0_uop_rob_idx <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_rob_idx : (_GEN_0 ? 5'h00 : _mshrs_io_replay_bits_uop_rob_idx));
		s1_req_0_uop_ldq_idx <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_ldq_idx : (_GEN_0 ? 4'h0 : _mshrs_io_replay_bits_uop_ldq_idx));
		s1_req_0_uop_stq_idx <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_stq_idx : (_GEN_0 ? 4'h0 : _mshrs_io_replay_bits_uop_stq_idx));
		s1_req_0_uop_rxq_idx <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_rxq_idx : (_GEN_0 ? 2'h0 : _mshrs_io_replay_bits_uop_rxq_idx));
		s1_req_0_uop_pdst <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_pdst : (_GEN_0 ? 6'h00 : _mshrs_io_replay_bits_uop_pdst));
		s1_req_0_uop_prs1 <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_prs1 : (_GEN_0 ? 6'h00 : _mshrs_io_replay_bits_uop_prs1));
		s1_req_0_uop_prs2 <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_prs2 : (_GEN_0 ? 6'h00 : _mshrs_io_replay_bits_uop_prs2));
		s1_req_0_uop_prs3 <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_prs3 : (_GEN_0 ? 6'h00 : _mshrs_io_replay_bits_uop_prs3));
		s1_req_0_uop_ppred <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_ppred : (_GEN_0 ? 4'h0 : _mshrs_io_replay_bits_uop_ppred));
		s1_req_0_uop_prs1_busy <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_prs1_busy : ~_GEN_0 & _mshrs_io_replay_bits_uop_prs1_busy);
		s1_req_0_uop_prs2_busy <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_prs2_busy : ~_GEN_0 & _mshrs_io_replay_bits_uop_prs2_busy);
		s1_req_0_uop_prs3_busy <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_prs3_busy : ~_GEN_0 & _mshrs_io_replay_bits_uop_prs3_busy);
		s1_req_0_uop_ppred_busy <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_ppred_busy : ~_GEN_0 & _mshrs_io_replay_bits_uop_ppred_busy);
		s1_req_0_uop_stale_pdst <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_stale_pdst : (_GEN_0 ? 6'h00 : _mshrs_io_replay_bits_uop_stale_pdst));
		s1_req_0_uop_exception <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_exception : ~_GEN_0 & _mshrs_io_replay_bits_uop_exception);
		s1_req_0_uop_exc_cause <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_exc_cause : (_GEN_0 ? 64'h0000000000000000 : _mshrs_io_replay_bits_uop_exc_cause));
		s1_req_0_uop_mem_cmd <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_mem_cmd : (_GEN_0 ? 5'h00 : _mshrs_io_replay_bits_uop_mem_cmd));
		s1_req_0_uop_mem_size <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_mem_size : (_GEN_0 ? 2'h0 : _mshrs_io_replay_bits_uop_mem_size));
		s1_req_0_uop_mem_signed <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_mem_signed : ~_GEN_0 & _mshrs_io_replay_bits_uop_mem_signed);
		s1_req_0_uop_uses_ldq <= s0_req_0_uop_uses_ldq;
		s1_req_0_uop_uses_stq <= s0_req_0_uop_uses_stq;
		s1_req_0_uop_is_unique <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_is_unique : ~_GEN_0 & _mshrs_io_replay_bits_uop_is_unique);
		s1_req_0_uop_flush_on_commit <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_flush_on_commit : ~_GEN_0 & _mshrs_io_replay_bits_uop_flush_on_commit);
		s1_req_0_uop_csr_cmd <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_csr_cmd : (_GEN_0 ? 3'h0 : _mshrs_io_replay_bits_uop_csr_cmd));
		s1_req_0_uop_ldst_is_rs1 <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_ldst_is_rs1 : ~_GEN_0 & _mshrs_io_replay_bits_uop_ldst_is_rs1);
		s1_req_0_uop_ldst <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_ldst : (_GEN_0 ? 6'h00 : _mshrs_io_replay_bits_uop_ldst));
		s1_req_0_uop_lrs1 <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_lrs1 : (_GEN_0 ? 6'h00 : _mshrs_io_replay_bits_uop_lrs1));
		s1_req_0_uop_lrs2 <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_lrs2 : (_GEN_0 ? 6'h00 : _mshrs_io_replay_bits_uop_lrs2));
		s1_req_0_uop_lrs3 <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_lrs3 : (_GEN_0 ? 6'h00 : _mshrs_io_replay_bits_uop_lrs3));
		s1_req_0_uop_dst_rtype <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_dst_rtype : (_GEN_0 ? 2'h0 : _mshrs_io_replay_bits_uop_dst_rtype));
		s1_req_0_uop_lrs1_rtype <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_lrs1_rtype : (_GEN_0 ? 2'h0 : _mshrs_io_replay_bits_uop_lrs1_rtype));
		s1_req_0_uop_lrs2_rtype <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_lrs2_rtype : (_GEN_0 ? 2'h0 : _mshrs_io_replay_bits_uop_lrs2_rtype));
		s1_req_0_uop_frs3_en <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_frs3_en : ~_GEN_0 & _mshrs_io_replay_bits_uop_frs3_en);
		s1_req_0_uop_fcn_dw <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_fcn_dw : ~_GEN_0 & _mshrs_io_replay_bits_uop_fcn_dw);
		s1_req_0_uop_fcn_op <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_fcn_op : (_GEN_0 ? 5'h00 : _mshrs_io_replay_bits_uop_fcn_op));
		s1_req_0_uop_fp_val <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_fp_val : ~_GEN_0 & _mshrs_io_replay_bits_uop_fp_val);
		s1_req_0_uop_fp_rm <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_fp_rm : (_GEN_0 ? 3'h0 : _mshrs_io_replay_bits_uop_fp_rm));
		s1_req_0_uop_fp_typ <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_fp_typ : (_GEN_0 ? 2'h0 : _mshrs_io_replay_bits_uop_fp_typ));
		s1_req_0_uop_xcpt_pf_if <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_xcpt_pf_if : ~_GEN_0 & _mshrs_io_replay_bits_uop_xcpt_pf_if);
		s1_req_0_uop_xcpt_ae_if <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_xcpt_ae_if : ~_GEN_0 & _mshrs_io_replay_bits_uop_xcpt_ae_if);
		s1_req_0_uop_xcpt_ma_if <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_xcpt_ma_if : ~_GEN_0 & _mshrs_io_replay_bits_uop_xcpt_ma_if);
		s1_req_0_uop_bp_debug_if <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_bp_debug_if : ~_GEN_0 & _mshrs_io_replay_bits_uop_bp_debug_if);
		s1_req_0_uop_bp_xcpt_if <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_bp_xcpt_if : ~_GEN_0 & _mshrs_io_replay_bits_uop_bp_xcpt_if);
		s1_req_0_uop_debug_fsrc <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_debug_fsrc : (_GEN_0 ? 3'h0 : _mshrs_io_replay_bits_uop_debug_fsrc));
		s1_req_0_uop_debug_tsrc <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_uop_debug_tsrc : (_GEN_0 ? 3'h0 : _mshrs_io_replay_bits_uop_debug_tsrc));
		s1_req_0_addr <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_addr : (wb_fire ? {8'h00, _wb_io_meta_read_bits_tag, _wb_io_data_req_bits_addr} : (prober_fire ? {8'h00, _prober_io_meta_read_bits_tag, _prober_io_meta_read_bits_idx, 6'h00} : (_s0_type_T_1 ? {8'h00, _mshrs_io_meta_read_bits_tag, _mshrs_io_meta_read_bits_idx, 6'h00} : _mshrs_io_replay_bits_addr))));
		s1_req_0_data <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_data : (_GEN_0 ? 64'h0000000000000000 : _mshrs_io_replay_bits_data));
		s1_req_0_is_hella <= (_s1_valid_T_8 ? io_lsu_req_bits_0_bits_is_hella : ~_GEN_0 & _mshrs_io_replay_bits_is_hella);
		REG <= _s1_valid_T_8;
		REG_1 <= io_lsu_req_bits_0_valid;
		s1_send_resp_or_nack_0 <= (_s1_valid_T_8 ? io_lsu_req_bits_0_valid : _s0_send_resp_or_nack_T_1 & (((((((((((((_mshrs_io_replay_bits_uop_mem_cmd == 5'h00) | (_mshrs_io_replay_bits_uop_mem_cmd == 5'h10)) | (_mshrs_io_replay_bits_uop_mem_cmd == 5'h06)) | (_mshrs_io_replay_bits_uop_mem_cmd == 5'h07)) | (_mshrs_io_replay_bits_uop_mem_cmd == 5'h04)) | (_mshrs_io_replay_bits_uop_mem_cmd == 5'h09)) | (_mshrs_io_replay_bits_uop_mem_cmd == 5'h0a)) | (_mshrs_io_replay_bits_uop_mem_cmd == 5'h0b)) | (_mshrs_io_replay_bits_uop_mem_cmd == 5'h08)) | (_mshrs_io_replay_bits_uop_mem_cmd == 5'h0c)) | (_mshrs_io_replay_bits_uop_mem_cmd == 5'h0d)) | (_mshrs_io_replay_bits_uop_mem_cmd == 5'h0e)) | (_mshrs_io_replay_bits_uop_mem_cmd == 5'h0f)));
		s1_type <= (_s1_valid_T_8 ? 3'h4 : (wb_fire ? 3'h2 : (prober_fire ? 3'h1 : (_s0_type_T_1 ? 3'h3 : 3'h0))));
		s1_mshr_meta_read_way_en <= _mshrs_io_meta_read_bits_way_en;
		s1_replay_way_en <= _mshrs_io_replay_bits_way_en;
		s1_wb_way_en <= _wb_io_data_req_bits_way_en;
		s2_req_0_uop_inst <= s1_req_0_uop_inst;
		s2_req_0_uop_debug_inst <= s1_req_0_uop_debug_inst;
		s2_req_0_uop_is_rvc <= s1_req_0_uop_is_rvc;
		s2_req_0_uop_debug_pc <= s1_req_0_uop_debug_pc;
		s2_req_0_uop_iq_type_0 <= s1_req_0_uop_iq_type_0;
		s2_req_0_uop_iq_type_1 <= s1_req_0_uop_iq_type_1;
		s2_req_0_uop_iq_type_2 <= s1_req_0_uop_iq_type_2;
		s2_req_0_uop_iq_type_3 <= s1_req_0_uop_iq_type_3;
		s2_req_0_uop_fu_code_0 <= s1_req_0_uop_fu_code_0;
		s2_req_0_uop_fu_code_1 <= s1_req_0_uop_fu_code_1;
		s2_req_0_uop_fu_code_2 <= s1_req_0_uop_fu_code_2;
		s2_req_0_uop_fu_code_3 <= s1_req_0_uop_fu_code_3;
		s2_req_0_uop_fu_code_4 <= s1_req_0_uop_fu_code_4;
		s2_req_0_uop_fu_code_5 <= s1_req_0_uop_fu_code_5;
		s2_req_0_uop_fu_code_6 <= s1_req_0_uop_fu_code_6;
		s2_req_0_uop_fu_code_7 <= s1_req_0_uop_fu_code_7;
		s2_req_0_uop_fu_code_8 <= s1_req_0_uop_fu_code_8;
		s2_req_0_uop_fu_code_9 <= s1_req_0_uop_fu_code_9;
		s2_req_0_uop_iw_issued <= s1_req_0_uop_iw_issued;
		s2_req_0_uop_iw_issued_partial_agen <= s1_req_0_uop_iw_issued_partial_agen;
		s2_req_0_uop_iw_issued_partial_dgen <= s1_req_0_uop_iw_issued_partial_dgen;
		s2_req_0_uop_iw_p1_speculative_child <= s1_req_0_uop_iw_p1_speculative_child;
		s2_req_0_uop_iw_p2_speculative_child <= s1_req_0_uop_iw_p2_speculative_child;
		s2_req_0_uop_iw_p1_bypass_hint <= s1_req_0_uop_iw_p1_bypass_hint;
		s2_req_0_uop_iw_p2_bypass_hint <= s1_req_0_uop_iw_p2_bypass_hint;
		s2_req_0_uop_iw_p3_bypass_hint <= s1_req_0_uop_iw_p3_bypass_hint;
		s2_req_0_uop_dis_col_sel <= s1_req_0_uop_dis_col_sel;
		s2_req_0_uop_br_mask <= s1_req_0_uop_br_mask & ~io_lsu_brupdate_b1_resolve_mask;
		s2_req_0_uop_br_tag <= s1_req_0_uop_br_tag;
		s2_req_0_uop_br_type <= s1_req_0_uop_br_type;
		s2_req_0_uop_is_sfb <= s1_req_0_uop_is_sfb;
		s2_req_0_uop_is_fence <= s1_req_0_uop_is_fence;
		s2_req_0_uop_is_fencei <= s1_req_0_uop_is_fencei;
		s2_req_0_uop_is_sfence <= s1_req_0_uop_is_sfence;
		s2_req_0_uop_is_amo <= s1_req_0_uop_is_amo;
		s2_req_0_uop_is_eret <= s1_req_0_uop_is_eret;
		s2_req_0_uop_is_sys_pc2epc <= s1_req_0_uop_is_sys_pc2epc;
		s2_req_0_uop_is_rocc <= s1_req_0_uop_is_rocc;
		s2_req_0_uop_is_mov <= s1_req_0_uop_is_mov;
		s2_req_0_uop_ftq_idx <= s1_req_0_uop_ftq_idx;
		s2_req_0_uop_edge_inst <= s1_req_0_uop_edge_inst;
		s2_req_0_uop_pc_lob <= s1_req_0_uop_pc_lob;
		s2_req_0_uop_taken <= s1_req_0_uop_taken;
		s2_req_0_uop_imm_rename <= s1_req_0_uop_imm_rename;
		s2_req_0_uop_imm_sel <= s1_req_0_uop_imm_sel;
		s2_req_0_uop_pimm <= s1_req_0_uop_pimm;
		s2_req_0_uop_imm_packed <= s1_req_0_uop_imm_packed;
		s2_req_0_uop_op1_sel <= s1_req_0_uop_op1_sel;
		s2_req_0_uop_op2_sel <= s1_req_0_uop_op2_sel;
		s2_req_0_uop_fp_ctrl_ldst <= s1_req_0_uop_fp_ctrl_ldst;
		s2_req_0_uop_fp_ctrl_wen <= s1_req_0_uop_fp_ctrl_wen;
		s2_req_0_uop_fp_ctrl_ren1 <= s1_req_0_uop_fp_ctrl_ren1;
		s2_req_0_uop_fp_ctrl_ren2 <= s1_req_0_uop_fp_ctrl_ren2;
		s2_req_0_uop_fp_ctrl_ren3 <= s1_req_0_uop_fp_ctrl_ren3;
		s2_req_0_uop_fp_ctrl_swap12 <= s1_req_0_uop_fp_ctrl_swap12;
		s2_req_0_uop_fp_ctrl_swap23 <= s1_req_0_uop_fp_ctrl_swap23;
		s2_req_0_uop_fp_ctrl_typeTagIn <= s1_req_0_uop_fp_ctrl_typeTagIn;
		s2_req_0_uop_fp_ctrl_typeTagOut <= s1_req_0_uop_fp_ctrl_typeTagOut;
		s2_req_0_uop_fp_ctrl_fromint <= s1_req_0_uop_fp_ctrl_fromint;
		s2_req_0_uop_fp_ctrl_toint <= s1_req_0_uop_fp_ctrl_toint;
		s2_req_0_uop_fp_ctrl_fastpipe <= s1_req_0_uop_fp_ctrl_fastpipe;
		s2_req_0_uop_fp_ctrl_fma <= s1_req_0_uop_fp_ctrl_fma;
		s2_req_0_uop_fp_ctrl_div <= s1_req_0_uop_fp_ctrl_div;
		s2_req_0_uop_fp_ctrl_sqrt <= s1_req_0_uop_fp_ctrl_sqrt;
		s2_req_0_uop_fp_ctrl_wflags <= s1_req_0_uop_fp_ctrl_wflags;
		s2_req_0_uop_fp_ctrl_vec <= s1_req_0_uop_fp_ctrl_vec;
		s2_req_0_uop_rob_idx <= s1_req_0_uop_rob_idx;
		s2_req_0_uop_ldq_idx <= s1_req_0_uop_ldq_idx;
		s2_req_0_uop_stq_idx <= s1_req_0_uop_stq_idx;
		s2_req_0_uop_rxq_idx <= s1_req_0_uop_rxq_idx;
		s2_req_0_uop_pdst <= s1_req_0_uop_pdst;
		s2_req_0_uop_prs1 <= s1_req_0_uop_prs1;
		s2_req_0_uop_prs2 <= s1_req_0_uop_prs2;
		s2_req_0_uop_prs3 <= s1_req_0_uop_prs3;
		s2_req_0_uop_ppred <= s1_req_0_uop_ppred;
		s2_req_0_uop_prs1_busy <= s1_req_0_uop_prs1_busy;
		s2_req_0_uop_prs2_busy <= s1_req_0_uop_prs2_busy;
		s2_req_0_uop_prs3_busy <= s1_req_0_uop_prs3_busy;
		s2_req_0_uop_ppred_busy <= s1_req_0_uop_ppred_busy;
		s2_req_0_uop_stale_pdst <= s1_req_0_uop_stale_pdst;
		s2_req_0_uop_exception <= s1_req_0_uop_exception;
		s2_req_0_uop_exc_cause <= s1_req_0_uop_exc_cause;
		s2_req_0_uop_mem_cmd <= s1_req_0_uop_mem_cmd;
		s2_req_0_uop_mem_size <= s1_req_0_uop_mem_size;
		s2_req_0_uop_mem_signed <= s1_req_0_uop_mem_signed;
		s2_req_0_uop_uses_ldq <= s1_req_0_uop_uses_ldq;
		s2_req_0_uop_uses_stq <= s1_req_0_uop_uses_stq;
		s2_req_0_uop_is_unique <= s1_req_0_uop_is_unique;
		s2_req_0_uop_flush_on_commit <= s1_req_0_uop_flush_on_commit;
		s2_req_0_uop_csr_cmd <= s1_req_0_uop_csr_cmd;
		s2_req_0_uop_ldst_is_rs1 <= s1_req_0_uop_ldst_is_rs1;
		s2_req_0_uop_ldst <= s1_req_0_uop_ldst;
		s2_req_0_uop_lrs1 <= s1_req_0_uop_lrs1;
		s2_req_0_uop_lrs2 <= s1_req_0_uop_lrs2;
		s2_req_0_uop_lrs3 <= s1_req_0_uop_lrs3;
		s2_req_0_uop_dst_rtype <= s1_req_0_uop_dst_rtype;
		s2_req_0_uop_lrs1_rtype <= s1_req_0_uop_lrs1_rtype;
		s2_req_0_uop_lrs2_rtype <= s1_req_0_uop_lrs2_rtype;
		s2_req_0_uop_frs3_en <= s1_req_0_uop_frs3_en;
		s2_req_0_uop_fcn_dw <= s1_req_0_uop_fcn_dw;
		s2_req_0_uop_fcn_op <= s1_req_0_uop_fcn_op;
		s2_req_0_uop_fp_val <= s1_req_0_uop_fp_val;
		s2_req_0_uop_fp_rm <= s1_req_0_uop_fp_rm;
		s2_req_0_uop_fp_typ <= s1_req_0_uop_fp_typ;
		s2_req_0_uop_xcpt_pf_if <= s1_req_0_uop_xcpt_pf_if;
		s2_req_0_uop_xcpt_ae_if <= s1_req_0_uop_xcpt_ae_if;
		s2_req_0_uop_xcpt_ma_if <= s1_req_0_uop_xcpt_ma_if;
		s2_req_0_uop_bp_debug_if <= s1_req_0_uop_bp_debug_if;
		s2_req_0_uop_bp_xcpt_if <= s1_req_0_uop_bp_xcpt_if;
		s2_req_0_uop_debug_fsrc <= s1_req_0_uop_debug_fsrc;
		s2_req_0_uop_debug_tsrc <= s1_req_0_uop_debug_tsrc;
		s2_req_0_addr <= s1_req_0_addr;
		s2_req_0_data <= s1_req_0_data;
		s2_req_0_is_hella <= s1_req_0_is_hella;
		s2_type <= s1_type;
		s2_valid_REG <= (((s1_valid_REG & ~io_lsu_s1_kill_0) & ((io_lsu_brupdate_b1_mispredict_mask & s1_req_0_uop_br_mask) == 8'h00)) & ~(io_lsu_exception & s1_req_0_uop_uses_ldq)) & ~((s2_store_failed & (s1_type == 3'h4)) & s1_req_0_uop_uses_stq);
		s2_tag_match_way_0 <= (s1_type == 3'h0 ? s1_replay_way_en : (s1_type == 3'h2 ? s1_wb_way_en : (s1_type == 3'h3 ? s1_mshr_meta_read_way_en : {({8'h00, _meta_0_io_resp_3_tag} == s1_req_0_addr[39:12]) & |_meta_0_io_resp_3_coh_state, ({8'h00, _meta_0_io_resp_2_tag} == s1_req_0_addr[39:12]) & |_meta_0_io_resp_2_coh_state, ({8'h00, _meta_0_io_resp_1_tag} == s1_req_0_addr[39:12]) & |_meta_0_io_resp_1_coh_state, ({8'h00, _meta_0_io_resp_0_tag} == s1_req_0_addr[39:12]) & |_meta_0_io_resp_0_coh_state})));
		s2_hit_state_REG_state <= _meta_0_io_resp_0_coh_state;
		s2_hit_state_REG_1_state <= _meta_0_io_resp_1_coh_state;
		s2_hit_state_REG_2_state <= _meta_0_io_resp_2_coh_state;
		s2_hit_state_REG_3_state <= _meta_0_io_resp_3_coh_state;
		s2_wb_idx_matches_0 <= (s1_req_0_addr[11:6] == _wb_io_idx_bits) & _wb_io_idx_valid;
		if (_GEN_1 & s2_lr)
			lrsc_addr <= s2_req_0_addr[39:6];
		s2_lr_REG <= s1_nack_0;
		s2_sc_REG <= s1_nack_0;
		s2_replaced_way_en_REG <= {_lfsr_prng_io_out_1, _lfsr_prng_io_out_0};
		s2_repl_meta_REG_coh_state <= _meta_0_io_resp_0_coh_state;
		s2_repl_meta_REG_tag <= _meta_0_io_resp_0_tag;
		s2_repl_meta_REG_1_coh_state <= _meta_0_io_resp_1_coh_state;
		s2_repl_meta_REG_1_tag <= _meta_0_io_resp_1_tag;
		s2_repl_meta_REG_2_coh_state <= _meta_0_io_resp_2_coh_state;
		s2_repl_meta_REG_2_tag <= _meta_0_io_resp_2_tag;
		s2_repl_meta_REG_3_coh_state <= _meta_0_io_resp_3_coh_state;
		s2_repl_meta_REG_3_tag <= _meta_0_io_resp_3_tag;
		s2_nack_hit_0 <= s1_nack_0;
		s2_send_resp_REG <= s1_send_resp_or_nack_0;
		s2_send_store_ack_REG <= s1_send_resp_or_nack_0;
		s2_send_nack_REG <= s1_send_resp_or_nack_0;
		mshrs_io_meta_resp_bits_REG_0_coh_state <= _meta_0_io_resp_0_coh_state;
		mshrs_io_meta_resp_bits_REG_1_coh_state <= _meta_0_io_resp_1_coh_state;
		mshrs_io_meta_resp_bits_REG_2_coh_state <= _meta_0_io_resp_2_coh_state;
		mshrs_io_meta_resp_bits_REG_3_coh_state <= _meta_0_io_resp_3_coh_state;
		s3_req_REG_uop_mem_cmd <= s2_req_0_uop_mem_cmd;
		s3_req_REG_uop_mem_size <= s2_req_0_uop_mem_size;
		s3_req_REG_addr <= s2_req_0_addr;
		s3_valid <= ((_s3_valid_T & (((((((((((_s3_valid_T_1 | _s3_valid_T_2) | _s3_valid_T_4) | _s3_valid_T_6) | _s3_valid_T_7) | _s3_valid_T_8) | _s3_valid_T_9) | _s3_valid_T_13) | _s3_valid_T_14) | _s3_valid_T_15) | _s3_valid_T_16) | _s3_valid_T_17)) & ~s2_sc_fail) & ~(s2_send_nack_0 & s2_nack_0);
		s3_data_word <= size_dat_padded;
		s4_req_addr <= s3_req_REG_addr;
		s4_req_data <= _amoalu_io_out;
		s4_valid <= s3_valid;
		s5_req_addr <= s4_req_addr;
		s5_req_data <= s4_req_data;
		s5_valid <= s4_valid;
		amoalu_io_rhs_REG <= s2_req_0_data;
		s3_way <= s2_tag_match_way_0;
		if (reset) begin
			s1_valid_REG <= 1'h0;
			debug_sc_fail_addr <= 40'h0000000000;
			debug_sc_fail_cnt <= 8'h00;
			lrsc_count <= 7'h00;
			beatsLeft <= 9'h000;
			state_0 <= 1'h0;
			state_1 <= 1'h0;
			io_lsu_perf_release_counter <= 9'h000;
			io_lsu_perf_acquire_counter <= 9'h000;
		end
		else begin : sv2v_autoblock_2
			reg _GEN_2;
			_GEN_2 = s2_req_0_addr == debug_sc_fail_addr;
			s1_valid_REG <= (((_s1_valid_T_8 ? io_lsu_req_bits_0_valid : ((_s0_send_resp_or_nack_T_1 | wb_fire) | prober_fire) | _s0_type_T_1) & ((io_lsu_brupdate_b1_mispredict_mask & s0_req_0_uop_br_mask) == 8'h00)) & ~(io_lsu_exception & s0_req_0_uop_uses_ldq)) & ~((s2_store_failed & _s1_valid_T_8) & s0_req_0_uop_uses_stq);
			if ((~s2_valid_REG | _GEN_2) | ~s2_sc_fail)
				;
			else
				debug_sc_fail_addr <= s2_req_0_addr;
			if (s2_valid_REG) begin
				if (_GEN_2) begin
					if (s2_sc_fail)
						debug_sc_fail_cnt <= debug_sc_fail_cnt + 8'h01;
					else if (s2_sc)
						debug_sc_fail_cnt <= 8'h00;
				end
				else if (s2_sc_fail)
					debug_sc_fail_cnt <= 8'h01;
			end
			if (((((s2_valid_REG & _mshrs_io_req_0_valid_T_10) & ~s2_hit_0) & ~(s2_has_permission_0 & |s2_tag_match_way_0)) & s2_lrsc_addr_match_0) & ~s2_nack_0)
				lrsc_count <= 7'h00;
			else if (_GEN_1) begin
				if (|lrsc_count)
					lrsc_count <= 7'h00;
				else if (s2_lr)
					lrsc_count <= 7'h4f;
			end
			else if (|lrsc_count)
				lrsc_count <= lrsc_count - 7'h01;
			if (idle & auto_out_c_ready)
				beatsLeft <= (_wb_io_release_valid & _wb_io_release_bits_opcode[0] ? 9'h007 : 9'h000);
			else
				beatsLeft <= beatsLeft - {8'h00, _io_lsu_perf_release_T};
			if (idle) begin
				state_0 <= _wb_io_release_valid;
				state_1 <= winner_1;
			end
			if (_io_lsu_perf_release_T) begin
				if (io_lsu_perf_release_counter == 9'h000)
					io_lsu_perf_release_counter <= io_lsu_perf_release_beats1;
				else
					io_lsu_perf_release_counter <= io_lsu_perf_release_counter - 9'h001;
			end
			if (_io_lsu_perf_acquire_T) begin
				if (io_lsu_perf_acquire_counter == 9'h000)
					io_lsu_perf_acquire_counter <= io_lsu_perf_acquire_beats1;
				else
					io_lsu_perf_acquire_counter <= io_lsu_perf_acquire_counter - 9'h001;
			end
		end
	end
	BoomWritebackUnit wb(
		.clock(clock),
		.reset(reset),
		.io_req_ready(_wb_io_req_ready),
		.io_req_valid(_wbArb_io_out_valid),
		.io_req_bits_tag(_wbArb_io_out_bits_tag),
		.io_req_bits_idx(_wbArb_io_out_bits_idx),
		.io_req_bits_source(_wbArb_io_out_bits_source),
		.io_req_bits_param(_wbArb_io_out_bits_param),
		.io_req_bits_way_en(_wbArb_io_out_bits_way_en),
		.io_req_bits_voluntary(_wbArb_io_out_bits_voluntary),
		.io_meta_read_ready(_wb_io_data_req_ready_T_2),
		.io_meta_read_valid(_wb_io_meta_read_valid),
		.io_meta_read_bits_idx(_wb_io_meta_read_bits_idx),
		.io_meta_read_bits_tag(_wb_io_meta_read_bits_tag),
		.io_resp(_wb_io_resp),
		.io_idx_valid(_wb_io_idx_valid),
		.io_idx_bits(_wb_io_idx_bits),
		.io_data_req_ready(_wb_io_data_req_ready_T_2),
		.io_data_req_valid(_wb_io_data_req_valid),
		.io_data_req_bits_way_en(_wb_io_data_req_bits_way_en),
		.io_data_req_bits_addr(_wb_io_data_req_bits_addr),
		.io_data_resp(s2_data_muxed_0),
		.io_mem_grant((nodeOut_d_ready & auto_out_d_valid) & _wb_io_mem_grant_T_1),
		.io_release_ready(auto_out_c_ready & (idle | state_0)),
		.io_release_valid(_wb_io_release_valid),
		.io_release_bits_opcode(_wb_io_release_bits_opcode),
		.io_release_bits_param(_wb_io_release_bits_param),
		.io_release_bits_source(_wb_io_release_bits_source),
		.io_release_bits_address(_wb_io_release_bits_address),
		.io_release_bits_data(_wb_io_release_bits_data),
		.io_lsu_release_ready(_lsu_release_arb_io_in_0_ready),
		.io_lsu_release_valid(_wb_io_lsu_release_valid),
		.io_lsu_release_bits_address(_wb_io_lsu_release_bits_address)
	);
	BoomProbeUnit prober(
		.clock(clock),
		.reset(reset),
		.io_req_ready(_prober_io_req_ready),
		.io_req_valid(auto_out_b_valid & ~(|lrsc_count[6:2])),
		.io_req_bits_param(auto_out_b_bits_param),
		.io_req_bits_size(auto_out_b_bits_size),
		.io_req_bits_source(auto_out_b_bits_source),
		.io_req_bits_address(auto_out_b_bits_address),
		.io_rep_ready(auto_out_c_ready & (idle ? ~_wb_io_release_valid : state_1)),
		.io_rep_valid(_prober_io_rep_valid),
		.io_rep_bits_param(_prober_io_rep_bits_param),
		.io_rep_bits_size(_prober_io_rep_bits_size),
		.io_rep_bits_source(_prober_io_rep_bits_source),
		.io_rep_bits_address(_prober_io_rep_bits_address),
		.io_meta_read_ready(_metaReadArb_io_in_1_ready),
		.io_meta_read_valid(_prober_io_meta_read_valid),
		.io_meta_read_bits_idx(_prober_io_meta_read_bits_idx),
		.io_meta_read_bits_tag(_prober_io_meta_read_bits_tag),
		.io_meta_write_ready(_metaWriteArb_io_in_1_ready),
		.io_meta_write_valid(_prober_io_meta_write_valid),
		.io_meta_write_bits_idx(_prober_io_meta_write_bits_idx),
		.io_meta_write_bits_way_en(_prober_io_meta_write_bits_way_en),
		.io_meta_write_bits_data_coh_state(_prober_io_meta_write_bits_data_coh_state),
		.io_meta_write_bits_data_tag(_prober_io_meta_write_bits_data_tag),
		.io_wb_req_ready(_wbArb_io_in_0_ready),
		.io_wb_req_valid(_prober_io_wb_req_valid),
		.io_wb_req_bits_tag(_prober_io_wb_req_bits_tag),
		.io_wb_req_bits_idx(_prober_io_wb_req_bits_idx),
		.io_wb_req_bits_source(_prober_io_wb_req_bits_source),
		.io_wb_req_bits_param(_prober_io_wb_req_bits_param),
		.io_wb_req_bits_way_en(_prober_io_wb_req_bits_way_en),
		.io_way_en(s2_tag_match_way_0),
		.io_wb_rdy((_prober_io_meta_write_bits_idx != _wb_io_idx_bits) | ~_wb_io_idx_valid),
		.io_mshr_rdy(_mshrs_io_probe_rdy),
		.io_mshr_wb_rdy(_prober_io_mshr_wb_rdy),
		.io_block_state_state(s2_hit_state_0_state),
		.io_lsu_release_ready(_lsu_release_arb_io_in_1_ready),
		.io_lsu_release_valid(_prober_io_lsu_release_valid),
		.io_lsu_release_bits_address(_prober_io_lsu_release_bits_address),
		.io_state_valid(_prober_io_state_valid),
		.io_state_bits(_prober_io_state_bits)
	);
	BoomMSHRFile mshrs(
		.clock(clock),
		.reset(reset),
		.io_req_0_ready(_mshrs_io_req_0_ready),
		.io_req_0_valid(_mshrs_io_req_0_valid_T_70),
		.io_req_0_bits_uop_inst(s2_req_0_uop_inst),
		.io_req_0_bits_uop_debug_inst(s2_req_0_uop_debug_inst),
		.io_req_0_bits_uop_is_rvc(s2_req_0_uop_is_rvc),
		.io_req_0_bits_uop_debug_pc(s2_req_0_uop_debug_pc),
		.io_req_0_bits_uop_iq_type_0(s2_req_0_uop_iq_type_0),
		.io_req_0_bits_uop_iq_type_1(s2_req_0_uop_iq_type_1),
		.io_req_0_bits_uop_iq_type_2(s2_req_0_uop_iq_type_2),
		.io_req_0_bits_uop_iq_type_3(s2_req_0_uop_iq_type_3),
		.io_req_0_bits_uop_fu_code_0(s2_req_0_uop_fu_code_0),
		.io_req_0_bits_uop_fu_code_1(s2_req_0_uop_fu_code_1),
		.io_req_0_bits_uop_fu_code_2(s2_req_0_uop_fu_code_2),
		.io_req_0_bits_uop_fu_code_3(s2_req_0_uop_fu_code_3),
		.io_req_0_bits_uop_fu_code_4(s2_req_0_uop_fu_code_4),
		.io_req_0_bits_uop_fu_code_5(s2_req_0_uop_fu_code_5),
		.io_req_0_bits_uop_fu_code_6(s2_req_0_uop_fu_code_6),
		.io_req_0_bits_uop_fu_code_7(s2_req_0_uop_fu_code_7),
		.io_req_0_bits_uop_fu_code_8(s2_req_0_uop_fu_code_8),
		.io_req_0_bits_uop_fu_code_9(s2_req_0_uop_fu_code_9),
		.io_req_0_bits_uop_iw_issued(s2_req_0_uop_iw_issued),
		.io_req_0_bits_uop_iw_issued_partial_agen(s2_req_0_uop_iw_issued_partial_agen),
		.io_req_0_bits_uop_iw_issued_partial_dgen(s2_req_0_uop_iw_issued_partial_dgen),
		.io_req_0_bits_uop_iw_p1_speculative_child(s2_req_0_uop_iw_p1_speculative_child),
		.io_req_0_bits_uop_iw_p2_speculative_child(s2_req_0_uop_iw_p2_speculative_child),
		.io_req_0_bits_uop_iw_p1_bypass_hint(s2_req_0_uop_iw_p1_bypass_hint),
		.io_req_0_bits_uop_iw_p2_bypass_hint(s2_req_0_uop_iw_p2_bypass_hint),
		.io_req_0_bits_uop_iw_p3_bypass_hint(s2_req_0_uop_iw_p3_bypass_hint),
		.io_req_0_bits_uop_dis_col_sel(s2_req_0_uop_dis_col_sel),
		.io_req_0_bits_uop_br_mask(s2_req_0_uop_br_mask),
		.io_req_0_bits_uop_br_tag(s2_req_0_uop_br_tag),
		.io_req_0_bits_uop_br_type(s2_req_0_uop_br_type),
		.io_req_0_bits_uop_is_sfb(s2_req_0_uop_is_sfb),
		.io_req_0_bits_uop_is_fence(s2_req_0_uop_is_fence),
		.io_req_0_bits_uop_is_fencei(s2_req_0_uop_is_fencei),
		.io_req_0_bits_uop_is_sfence(s2_req_0_uop_is_sfence),
		.io_req_0_bits_uop_is_amo(s2_req_0_uop_is_amo),
		.io_req_0_bits_uop_is_eret(s2_req_0_uop_is_eret),
		.io_req_0_bits_uop_is_sys_pc2epc(s2_req_0_uop_is_sys_pc2epc),
		.io_req_0_bits_uop_is_rocc(s2_req_0_uop_is_rocc),
		.io_req_0_bits_uop_is_mov(s2_req_0_uop_is_mov),
		.io_req_0_bits_uop_ftq_idx(s2_req_0_uop_ftq_idx),
		.io_req_0_bits_uop_edge_inst(s2_req_0_uop_edge_inst),
		.io_req_0_bits_uop_pc_lob(s2_req_0_uop_pc_lob),
		.io_req_0_bits_uop_taken(s2_req_0_uop_taken),
		.io_req_0_bits_uop_imm_rename(s2_req_0_uop_imm_rename),
		.io_req_0_bits_uop_imm_sel(s2_req_0_uop_imm_sel),
		.io_req_0_bits_uop_pimm(s2_req_0_uop_pimm),
		.io_req_0_bits_uop_imm_packed(s2_req_0_uop_imm_packed),
		.io_req_0_bits_uop_op1_sel(s2_req_0_uop_op1_sel),
		.io_req_0_bits_uop_op2_sel(s2_req_0_uop_op2_sel),
		.io_req_0_bits_uop_fp_ctrl_ldst(s2_req_0_uop_fp_ctrl_ldst),
		.io_req_0_bits_uop_fp_ctrl_wen(s2_req_0_uop_fp_ctrl_wen),
		.io_req_0_bits_uop_fp_ctrl_ren1(s2_req_0_uop_fp_ctrl_ren1),
		.io_req_0_bits_uop_fp_ctrl_ren2(s2_req_0_uop_fp_ctrl_ren2),
		.io_req_0_bits_uop_fp_ctrl_ren3(s2_req_0_uop_fp_ctrl_ren3),
		.io_req_0_bits_uop_fp_ctrl_swap12(s2_req_0_uop_fp_ctrl_swap12),
		.io_req_0_bits_uop_fp_ctrl_swap23(s2_req_0_uop_fp_ctrl_swap23),
		.io_req_0_bits_uop_fp_ctrl_typeTagIn(s2_req_0_uop_fp_ctrl_typeTagIn),
		.io_req_0_bits_uop_fp_ctrl_typeTagOut(s2_req_0_uop_fp_ctrl_typeTagOut),
		.io_req_0_bits_uop_fp_ctrl_fromint(s2_req_0_uop_fp_ctrl_fromint),
		.io_req_0_bits_uop_fp_ctrl_toint(s2_req_0_uop_fp_ctrl_toint),
		.io_req_0_bits_uop_fp_ctrl_fastpipe(s2_req_0_uop_fp_ctrl_fastpipe),
		.io_req_0_bits_uop_fp_ctrl_fma(s2_req_0_uop_fp_ctrl_fma),
		.io_req_0_bits_uop_fp_ctrl_div(s2_req_0_uop_fp_ctrl_div),
		.io_req_0_bits_uop_fp_ctrl_sqrt(s2_req_0_uop_fp_ctrl_sqrt),
		.io_req_0_bits_uop_fp_ctrl_wflags(s2_req_0_uop_fp_ctrl_wflags),
		.io_req_0_bits_uop_fp_ctrl_vec(s2_req_0_uop_fp_ctrl_vec),
		.io_req_0_bits_uop_rob_idx(s2_req_0_uop_rob_idx),
		.io_req_0_bits_uop_ldq_idx(s2_req_0_uop_ldq_idx),
		.io_req_0_bits_uop_stq_idx(s2_req_0_uop_stq_idx),
		.io_req_0_bits_uop_rxq_idx(s2_req_0_uop_rxq_idx),
		.io_req_0_bits_uop_pdst(s2_req_0_uop_pdst),
		.io_req_0_bits_uop_prs1(s2_req_0_uop_prs1),
		.io_req_0_bits_uop_prs2(s2_req_0_uop_prs2),
		.io_req_0_bits_uop_prs3(s2_req_0_uop_prs3),
		.io_req_0_bits_uop_ppred(s2_req_0_uop_ppred),
		.io_req_0_bits_uop_prs1_busy(s2_req_0_uop_prs1_busy),
		.io_req_0_bits_uop_prs2_busy(s2_req_0_uop_prs2_busy),
		.io_req_0_bits_uop_prs3_busy(s2_req_0_uop_prs3_busy),
		.io_req_0_bits_uop_ppred_busy(s2_req_0_uop_ppred_busy),
		.io_req_0_bits_uop_stale_pdst(s2_req_0_uop_stale_pdst),
		.io_req_0_bits_uop_exception(s2_req_0_uop_exception),
		.io_req_0_bits_uop_exc_cause(s2_req_0_uop_exc_cause),
		.io_req_0_bits_uop_mem_cmd(s2_req_0_uop_mem_cmd),
		.io_req_0_bits_uop_mem_size(s2_req_0_uop_mem_size),
		.io_req_0_bits_uop_mem_signed(s2_req_0_uop_mem_signed),
		.io_req_0_bits_uop_uses_ldq(s2_req_0_uop_uses_ldq),
		.io_req_0_bits_uop_uses_stq(s2_req_0_uop_uses_stq),
		.io_req_0_bits_uop_is_unique(s2_req_0_uop_is_unique),
		.io_req_0_bits_uop_flush_on_commit(s2_req_0_uop_flush_on_commit),
		.io_req_0_bits_uop_csr_cmd(s2_req_0_uop_csr_cmd),
		.io_req_0_bits_uop_ldst_is_rs1(s2_req_0_uop_ldst_is_rs1),
		.io_req_0_bits_uop_ldst(s2_req_0_uop_ldst),
		.io_req_0_bits_uop_lrs1(s2_req_0_uop_lrs1),
		.io_req_0_bits_uop_lrs2(s2_req_0_uop_lrs2),
		.io_req_0_bits_uop_lrs3(s2_req_0_uop_lrs3),
		.io_req_0_bits_uop_dst_rtype(s2_req_0_uop_dst_rtype),
		.io_req_0_bits_uop_lrs1_rtype(s2_req_0_uop_lrs1_rtype),
		.io_req_0_bits_uop_lrs2_rtype(s2_req_0_uop_lrs2_rtype),
		.io_req_0_bits_uop_frs3_en(s2_req_0_uop_frs3_en),
		.io_req_0_bits_uop_fcn_dw(s2_req_0_uop_fcn_dw),
		.io_req_0_bits_uop_fcn_op(s2_req_0_uop_fcn_op),
		.io_req_0_bits_uop_fp_val(s2_req_0_uop_fp_val),
		.io_req_0_bits_uop_fp_rm(s2_req_0_uop_fp_rm),
		.io_req_0_bits_uop_fp_typ(s2_req_0_uop_fp_typ),
		.io_req_0_bits_uop_xcpt_pf_if(s2_req_0_uop_xcpt_pf_if),
		.io_req_0_bits_uop_xcpt_ae_if(s2_req_0_uop_xcpt_ae_if),
		.io_req_0_bits_uop_xcpt_ma_if(s2_req_0_uop_xcpt_ma_if),
		.io_req_0_bits_uop_bp_debug_if(s2_req_0_uop_bp_debug_if),
		.io_req_0_bits_uop_bp_xcpt_if(s2_req_0_uop_bp_xcpt_if),
		.io_req_0_bits_uop_debug_fsrc(s2_req_0_uop_debug_fsrc),
		.io_req_0_bits_uop_debug_tsrc(s2_req_0_uop_debug_tsrc),
		.io_req_0_bits_addr(s2_req_0_addr),
		.io_req_0_bits_data(s2_req_0_data),
		.io_req_0_bits_is_hella(s2_req_0_is_hella),
		.io_req_0_bits_tag_match(|s2_tag_match_way_0),
		.io_req_0_bits_old_meta_coh_state((|s2_tag_match_way_0 ? s2_hit_state_0_state : (((_s2_repl_meta_T ? s2_repl_meta_REG_coh_state : 2'h0) | (_s2_repl_meta_T_1 ? s2_repl_meta_REG_1_coh_state : 2'h0)) | (_s2_repl_meta_T_2 ? s2_repl_meta_REG_2_coh_state : 2'h0)) | (&s2_replaced_way_en_REG ? s2_repl_meta_REG_3_coh_state : 2'h0))),
		.io_req_0_bits_old_meta_tag((((_s2_repl_meta_T ? s2_repl_meta_REG_tag : 20'h00000) | (_s2_repl_meta_T_1 ? s2_repl_meta_REG_1_tag : 20'h00000)) | (_s2_repl_meta_T_2 ? s2_repl_meta_REG_2_tag : 20'h00000)) | (&s2_replaced_way_en_REG ? s2_repl_meta_REG_3_tag : 20'h00000)),
		.io_req_0_bits_way_en((|s2_tag_match_way_0 ? s2_tag_match_way_0 : 4'h1 << s2_replaced_way_en_REG)),
		.io_req_is_probe_0((s2_type == 3'h1) & s2_valid_REG),
		.io_resp_ready(io_lsu_ll_resp_ready),
		.io_resp_valid(_mshrs_io_resp_valid),
		.io_resp_bits_uop_is_amo(io_lsu_ll_resp_bits_uop_is_amo),
		.io_resp_bits_uop_ldq_idx(io_lsu_ll_resp_bits_uop_ldq_idx),
		.io_resp_bits_uop_stq_idx(io_lsu_ll_resp_bits_uop_stq_idx),
		.io_resp_bits_uop_uses_ldq(io_lsu_ll_resp_bits_uop_uses_ldq),
		.io_resp_bits_uop_uses_stq(io_lsu_ll_resp_bits_uop_uses_stq),
		.io_resp_bits_data(io_lsu_ll_resp_bits_data),
		.io_resp_bits_is_hella(io_lsu_ll_resp_bits_is_hella),
		.io_secondary_miss_0(_mshrs_io_secondary_miss_0),
		.io_block_hit_0(_mshrs_io_block_hit_0),
		.io_brupdate_b1_resolve_mask(io_lsu_brupdate_b1_resolve_mask),
		.io_brupdate_b1_mispredict_mask(io_lsu_brupdate_b1_mispredict_mask),
		.io_exception(io_lsu_exception),
		.io_mem_acquire_ready(auto_out_a_ready),
		.io_mem_acquire_valid(_mshrs_io_mem_acquire_valid),
		.io_mem_acquire_bits_opcode(_mshrs_io_mem_acquire_bits_opcode),
		.io_mem_acquire_bits_param(auto_out_a_bits_param),
		.io_mem_acquire_bits_size(_mshrs_io_mem_acquire_bits_size),
		.io_mem_acquire_bits_source(auto_out_a_bits_source),
		.io_mem_acquire_bits_address(auto_out_a_bits_address),
		.io_mem_acquire_bits_mask(auto_out_a_bits_mask),
		.io_mem_acquire_bits_data(auto_out_a_bits_data),
		.io_mem_grant_ready(_mshrs_io_mem_grant_ready),
		.io_mem_grant_valid(~_wb_io_mem_grant_T_1 & auto_out_d_valid),
		.io_mem_grant_bits_opcode(auto_out_d_bits_opcode),
		.io_mem_grant_bits_param(auto_out_d_bits_param),
		.io_mem_grant_bits_size(auto_out_d_bits_size),
		.io_mem_grant_bits_source(auto_out_d_bits_source),
		.io_mem_grant_bits_sink(auto_out_d_bits_sink),
		.io_mem_grant_bits_data(auto_out_d_bits_data),
		.io_mem_finish_ready(auto_out_e_ready),
		.io_mem_finish_valid(auto_out_e_valid),
		.io_mem_finish_bits_sink(auto_out_e_bits_sink),
		.io_refill_ready(_dataWriteArb_io_in_1_ready),
		.io_refill_valid(_mshrs_io_refill_valid),
		.io_refill_bits_way_en(_mshrs_io_refill_bits_way_en),
		.io_refill_bits_addr(_mshrs_io_refill_bits_addr),
		.io_refill_bits_data(_mshrs_io_refill_bits_data),
		.io_meta_write_ready(_metaWriteArb_io_in_0_ready),
		.io_meta_write_valid(_mshrs_io_meta_write_valid),
		.io_meta_write_bits_idx(_mshrs_io_meta_write_bits_idx),
		.io_meta_write_bits_way_en(_mshrs_io_meta_write_bits_way_en),
		.io_meta_write_bits_data_coh_state(_mshrs_io_meta_write_bits_data_coh_state),
		.io_meta_write_bits_data_tag(_mshrs_io_meta_write_bits_data_tag),
		.io_meta_read_ready(_metaReadArb_io_in_3_ready),
		.io_meta_read_valid(_mshrs_io_meta_read_valid),
		.io_meta_read_bits_idx(_mshrs_io_meta_read_bits_idx),
		.io_meta_read_bits_way_en(_mshrs_io_meta_read_bits_way_en),
		.io_meta_read_bits_tag(_mshrs_io_meta_read_bits_tag),
		.io_meta_resp_valid(~s2_nack_hit_0 | _prober_io_mshr_wb_rdy),
		.io_meta_resp_bits_coh_state((((s2_tag_match_way_0[0] ? mshrs_io_meta_resp_bits_REG_0_coh_state : 2'h0) | (s2_tag_match_way_0[1] ? mshrs_io_meta_resp_bits_REG_1_coh_state : 2'h0)) | (s2_tag_match_way_0[2] ? mshrs_io_meta_resp_bits_REG_2_coh_state : 2'h0)) | (s2_tag_match_way_0[3] ? mshrs_io_meta_resp_bits_REG_3_coh_state : 2'h0)),
		.io_replay_ready(_metaReadArb_io_in_0_ready),
		.io_replay_valid(_mshrs_io_replay_valid),
		.io_replay_bits_uop_inst(_mshrs_io_replay_bits_uop_inst),
		.io_replay_bits_uop_debug_inst(_mshrs_io_replay_bits_uop_debug_inst),
		.io_replay_bits_uop_is_rvc(_mshrs_io_replay_bits_uop_is_rvc),
		.io_replay_bits_uop_debug_pc(_mshrs_io_replay_bits_uop_debug_pc),
		.io_replay_bits_uop_iq_type_0(_mshrs_io_replay_bits_uop_iq_type_0),
		.io_replay_bits_uop_iq_type_1(_mshrs_io_replay_bits_uop_iq_type_1),
		.io_replay_bits_uop_iq_type_2(_mshrs_io_replay_bits_uop_iq_type_2),
		.io_replay_bits_uop_iq_type_3(_mshrs_io_replay_bits_uop_iq_type_3),
		.io_replay_bits_uop_fu_code_0(_mshrs_io_replay_bits_uop_fu_code_0),
		.io_replay_bits_uop_fu_code_1(_mshrs_io_replay_bits_uop_fu_code_1),
		.io_replay_bits_uop_fu_code_2(_mshrs_io_replay_bits_uop_fu_code_2),
		.io_replay_bits_uop_fu_code_3(_mshrs_io_replay_bits_uop_fu_code_3),
		.io_replay_bits_uop_fu_code_4(_mshrs_io_replay_bits_uop_fu_code_4),
		.io_replay_bits_uop_fu_code_5(_mshrs_io_replay_bits_uop_fu_code_5),
		.io_replay_bits_uop_fu_code_6(_mshrs_io_replay_bits_uop_fu_code_6),
		.io_replay_bits_uop_fu_code_7(_mshrs_io_replay_bits_uop_fu_code_7),
		.io_replay_bits_uop_fu_code_8(_mshrs_io_replay_bits_uop_fu_code_8),
		.io_replay_bits_uop_fu_code_9(_mshrs_io_replay_bits_uop_fu_code_9),
		.io_replay_bits_uop_iw_issued(_mshrs_io_replay_bits_uop_iw_issued),
		.io_replay_bits_uop_iw_issued_partial_agen(_mshrs_io_replay_bits_uop_iw_issued_partial_agen),
		.io_replay_bits_uop_iw_issued_partial_dgen(_mshrs_io_replay_bits_uop_iw_issued_partial_dgen),
		.io_replay_bits_uop_iw_p1_speculative_child(_mshrs_io_replay_bits_uop_iw_p1_speculative_child),
		.io_replay_bits_uop_iw_p2_speculative_child(_mshrs_io_replay_bits_uop_iw_p2_speculative_child),
		.io_replay_bits_uop_iw_p1_bypass_hint(_mshrs_io_replay_bits_uop_iw_p1_bypass_hint),
		.io_replay_bits_uop_iw_p2_bypass_hint(_mshrs_io_replay_bits_uop_iw_p2_bypass_hint),
		.io_replay_bits_uop_iw_p3_bypass_hint(_mshrs_io_replay_bits_uop_iw_p3_bypass_hint),
		.io_replay_bits_uop_dis_col_sel(_mshrs_io_replay_bits_uop_dis_col_sel),
		.io_replay_bits_uop_br_mask(_mshrs_io_replay_bits_uop_br_mask),
		.io_replay_bits_uop_br_tag(_mshrs_io_replay_bits_uop_br_tag),
		.io_replay_bits_uop_br_type(_mshrs_io_replay_bits_uop_br_type),
		.io_replay_bits_uop_is_sfb(_mshrs_io_replay_bits_uop_is_sfb),
		.io_replay_bits_uop_is_fence(_mshrs_io_replay_bits_uop_is_fence),
		.io_replay_bits_uop_is_fencei(_mshrs_io_replay_bits_uop_is_fencei),
		.io_replay_bits_uop_is_sfence(_mshrs_io_replay_bits_uop_is_sfence),
		.io_replay_bits_uop_is_amo(_mshrs_io_replay_bits_uop_is_amo),
		.io_replay_bits_uop_is_eret(_mshrs_io_replay_bits_uop_is_eret),
		.io_replay_bits_uop_is_sys_pc2epc(_mshrs_io_replay_bits_uop_is_sys_pc2epc),
		.io_replay_bits_uop_is_rocc(_mshrs_io_replay_bits_uop_is_rocc),
		.io_replay_bits_uop_is_mov(_mshrs_io_replay_bits_uop_is_mov),
		.io_replay_bits_uop_ftq_idx(_mshrs_io_replay_bits_uop_ftq_idx),
		.io_replay_bits_uop_edge_inst(_mshrs_io_replay_bits_uop_edge_inst),
		.io_replay_bits_uop_pc_lob(_mshrs_io_replay_bits_uop_pc_lob),
		.io_replay_bits_uop_taken(_mshrs_io_replay_bits_uop_taken),
		.io_replay_bits_uop_imm_rename(_mshrs_io_replay_bits_uop_imm_rename),
		.io_replay_bits_uop_imm_sel(_mshrs_io_replay_bits_uop_imm_sel),
		.io_replay_bits_uop_pimm(_mshrs_io_replay_bits_uop_pimm),
		.io_replay_bits_uop_imm_packed(_mshrs_io_replay_bits_uop_imm_packed),
		.io_replay_bits_uop_op1_sel(_mshrs_io_replay_bits_uop_op1_sel),
		.io_replay_bits_uop_op2_sel(_mshrs_io_replay_bits_uop_op2_sel),
		.io_replay_bits_uop_fp_ctrl_ldst(_mshrs_io_replay_bits_uop_fp_ctrl_ldst),
		.io_replay_bits_uop_fp_ctrl_wen(_mshrs_io_replay_bits_uop_fp_ctrl_wen),
		.io_replay_bits_uop_fp_ctrl_ren1(_mshrs_io_replay_bits_uop_fp_ctrl_ren1),
		.io_replay_bits_uop_fp_ctrl_ren2(_mshrs_io_replay_bits_uop_fp_ctrl_ren2),
		.io_replay_bits_uop_fp_ctrl_ren3(_mshrs_io_replay_bits_uop_fp_ctrl_ren3),
		.io_replay_bits_uop_fp_ctrl_swap12(_mshrs_io_replay_bits_uop_fp_ctrl_swap12),
		.io_replay_bits_uop_fp_ctrl_swap23(_mshrs_io_replay_bits_uop_fp_ctrl_swap23),
		.io_replay_bits_uop_fp_ctrl_typeTagIn(_mshrs_io_replay_bits_uop_fp_ctrl_typeTagIn),
		.io_replay_bits_uop_fp_ctrl_typeTagOut(_mshrs_io_replay_bits_uop_fp_ctrl_typeTagOut),
		.io_replay_bits_uop_fp_ctrl_fromint(_mshrs_io_replay_bits_uop_fp_ctrl_fromint),
		.io_replay_bits_uop_fp_ctrl_toint(_mshrs_io_replay_bits_uop_fp_ctrl_toint),
		.io_replay_bits_uop_fp_ctrl_fastpipe(_mshrs_io_replay_bits_uop_fp_ctrl_fastpipe),
		.io_replay_bits_uop_fp_ctrl_fma(_mshrs_io_replay_bits_uop_fp_ctrl_fma),
		.io_replay_bits_uop_fp_ctrl_div(_mshrs_io_replay_bits_uop_fp_ctrl_div),
		.io_replay_bits_uop_fp_ctrl_sqrt(_mshrs_io_replay_bits_uop_fp_ctrl_sqrt),
		.io_replay_bits_uop_fp_ctrl_wflags(_mshrs_io_replay_bits_uop_fp_ctrl_wflags),
		.io_replay_bits_uop_fp_ctrl_vec(_mshrs_io_replay_bits_uop_fp_ctrl_vec),
		.io_replay_bits_uop_rob_idx(_mshrs_io_replay_bits_uop_rob_idx),
		.io_replay_bits_uop_ldq_idx(_mshrs_io_replay_bits_uop_ldq_idx),
		.io_replay_bits_uop_stq_idx(_mshrs_io_replay_bits_uop_stq_idx),
		.io_replay_bits_uop_rxq_idx(_mshrs_io_replay_bits_uop_rxq_idx),
		.io_replay_bits_uop_pdst(_mshrs_io_replay_bits_uop_pdst),
		.io_replay_bits_uop_prs1(_mshrs_io_replay_bits_uop_prs1),
		.io_replay_bits_uop_prs2(_mshrs_io_replay_bits_uop_prs2),
		.io_replay_bits_uop_prs3(_mshrs_io_replay_bits_uop_prs3),
		.io_replay_bits_uop_ppred(_mshrs_io_replay_bits_uop_ppred),
		.io_replay_bits_uop_prs1_busy(_mshrs_io_replay_bits_uop_prs1_busy),
		.io_replay_bits_uop_prs2_busy(_mshrs_io_replay_bits_uop_prs2_busy),
		.io_replay_bits_uop_prs3_busy(_mshrs_io_replay_bits_uop_prs3_busy),
		.io_replay_bits_uop_ppred_busy(_mshrs_io_replay_bits_uop_ppred_busy),
		.io_replay_bits_uop_stale_pdst(_mshrs_io_replay_bits_uop_stale_pdst),
		.io_replay_bits_uop_exception(_mshrs_io_replay_bits_uop_exception),
		.io_replay_bits_uop_exc_cause(_mshrs_io_replay_bits_uop_exc_cause),
		.io_replay_bits_uop_mem_cmd(_mshrs_io_replay_bits_uop_mem_cmd),
		.io_replay_bits_uop_mem_size(_mshrs_io_replay_bits_uop_mem_size),
		.io_replay_bits_uop_mem_signed(_mshrs_io_replay_bits_uop_mem_signed),
		.io_replay_bits_uop_uses_ldq(_mshrs_io_replay_bits_uop_uses_ldq),
		.io_replay_bits_uop_uses_stq(_mshrs_io_replay_bits_uop_uses_stq),
		.io_replay_bits_uop_is_unique(_mshrs_io_replay_bits_uop_is_unique),
		.io_replay_bits_uop_flush_on_commit(_mshrs_io_replay_bits_uop_flush_on_commit),
		.io_replay_bits_uop_csr_cmd(_mshrs_io_replay_bits_uop_csr_cmd),
		.io_replay_bits_uop_ldst_is_rs1(_mshrs_io_replay_bits_uop_ldst_is_rs1),
		.io_replay_bits_uop_ldst(_mshrs_io_replay_bits_uop_ldst),
		.io_replay_bits_uop_lrs1(_mshrs_io_replay_bits_uop_lrs1),
		.io_replay_bits_uop_lrs2(_mshrs_io_replay_bits_uop_lrs2),
		.io_replay_bits_uop_lrs3(_mshrs_io_replay_bits_uop_lrs3),
		.io_replay_bits_uop_dst_rtype(_mshrs_io_replay_bits_uop_dst_rtype),
		.io_replay_bits_uop_lrs1_rtype(_mshrs_io_replay_bits_uop_lrs1_rtype),
		.io_replay_bits_uop_lrs2_rtype(_mshrs_io_replay_bits_uop_lrs2_rtype),
		.io_replay_bits_uop_frs3_en(_mshrs_io_replay_bits_uop_frs3_en),
		.io_replay_bits_uop_fcn_dw(_mshrs_io_replay_bits_uop_fcn_dw),
		.io_replay_bits_uop_fcn_op(_mshrs_io_replay_bits_uop_fcn_op),
		.io_replay_bits_uop_fp_val(_mshrs_io_replay_bits_uop_fp_val),
		.io_replay_bits_uop_fp_rm(_mshrs_io_replay_bits_uop_fp_rm),
		.io_replay_bits_uop_fp_typ(_mshrs_io_replay_bits_uop_fp_typ),
		.io_replay_bits_uop_xcpt_pf_if(_mshrs_io_replay_bits_uop_xcpt_pf_if),
		.io_replay_bits_uop_xcpt_ae_if(_mshrs_io_replay_bits_uop_xcpt_ae_if),
		.io_replay_bits_uop_xcpt_ma_if(_mshrs_io_replay_bits_uop_xcpt_ma_if),
		.io_replay_bits_uop_bp_debug_if(_mshrs_io_replay_bits_uop_bp_debug_if),
		.io_replay_bits_uop_bp_xcpt_if(_mshrs_io_replay_bits_uop_bp_xcpt_if),
		.io_replay_bits_uop_debug_fsrc(_mshrs_io_replay_bits_uop_debug_fsrc),
		.io_replay_bits_uop_debug_tsrc(_mshrs_io_replay_bits_uop_debug_tsrc),
		.io_replay_bits_addr(_mshrs_io_replay_bits_addr),
		.io_replay_bits_data(_mshrs_io_replay_bits_data),
		.io_replay_bits_is_hella(_mshrs_io_replay_bits_is_hella),
		.io_replay_bits_way_en(_mshrs_io_replay_bits_way_en),
		.io_wb_req_ready(_wbArb_io_in_1_ready),
		.io_wb_req_valid(_mshrs_io_wb_req_valid),
		.io_wb_req_bits_tag(_mshrs_io_wb_req_bits_tag),
		.io_wb_req_bits_idx(_mshrs_io_wb_req_bits_idx),
		.io_wb_req_bits_source(_mshrs_io_wb_req_bits_source),
		.io_wb_req_bits_param(_mshrs_io_wb_req_bits_param),
		.io_wb_req_bits_way_en(_mshrs_io_wb_req_bits_way_en),
		.io_wb_req_bits_voluntary(_mshrs_io_wb_req_bits_voluntary),
		.io_prober_state_valid(_prober_io_state_valid),
		.io_prober_state_bits(_prober_io_state_bits),
		.io_clear_all(io_lsu_force_order),
		.io_wb_resp(_wb_io_resp),
		.io_fence_rdy(_mshrs_io_fence_rdy),
		.io_probe_rdy(_mshrs_io_probe_rdy)
	);
	L1MetadataArray meta_0(
		.clock(clock),
		.reset(reset),
		.io_read_ready(_meta_0_io_read_ready),
		.io_read_valid(_metaReadArb_io_out_valid),
		.io_read_bits_idx(_metaReadArb_io_out_bits_req_0_idx),
		.io_write_ready(_meta_0_io_write_ready),
		.io_write_valid(_meta_0_io_write_ready & _metaWriteArb_io_out_valid),
		.io_write_bits_idx(_metaWriteArb_io_out_bits_idx),
		.io_write_bits_way_en(_metaWriteArb_io_out_bits_way_en),
		.io_write_bits_data_coh_state(_metaWriteArb_io_out_bits_data_coh_state),
		.io_write_bits_data_tag(_metaWriteArb_io_out_bits_data_tag),
		.io_resp_0_coh_state(_meta_0_io_resp_0_coh_state),
		.io_resp_0_tag(_meta_0_io_resp_0_tag),
		.io_resp_1_coh_state(_meta_0_io_resp_1_coh_state),
		.io_resp_1_tag(_meta_0_io_resp_1_tag),
		.io_resp_2_coh_state(_meta_0_io_resp_2_coh_state),
		.io_resp_2_tag(_meta_0_io_resp_2_tag),
		.io_resp_3_coh_state(_meta_0_io_resp_3_coh_state),
		.io_resp_3_tag(_meta_0_io_resp_3_tag)
	);
	Arbiter2_L1MetaWriteReq metaWriteArb(
		.io_in_0_ready(_metaWriteArb_io_in_0_ready),
		.io_in_0_valid(_mshrs_io_meta_write_valid),
		.io_in_0_bits_idx(_mshrs_io_meta_write_bits_idx),
		.io_in_0_bits_way_en(_mshrs_io_meta_write_bits_way_en),
		.io_in_0_bits_data_coh_state(_mshrs_io_meta_write_bits_data_coh_state),
		.io_in_0_bits_data_tag(_mshrs_io_meta_write_bits_data_tag),
		.io_in_1_ready(_metaWriteArb_io_in_1_ready),
		.io_in_1_valid(_prober_io_meta_write_valid),
		.io_in_1_bits_idx(_prober_io_meta_write_bits_idx),
		.io_in_1_bits_way_en(_prober_io_meta_write_bits_way_en),
		.io_in_1_bits_data_coh_state(_prober_io_meta_write_bits_data_coh_state),
		.io_in_1_bits_data_tag(_prober_io_meta_write_bits_data_tag),
		.io_out_ready(_meta_0_io_write_ready),
		.io_out_valid(_metaWriteArb_io_out_valid),
		.io_out_bits_idx(_metaWriteArb_io_out_bits_idx),
		.io_out_bits_way_en(_metaWriteArb_io_out_bits_way_en),
		.io_out_bits_data_coh_state(_metaWriteArb_io_out_bits_data_coh_state),
		.io_out_bits_data_tag(_metaWriteArb_io_out_bits_data_tag)
	);
	Arbiter6_BoomL1MetaReadReq metaReadArb(
		.io_in_0_ready(_metaReadArb_io_in_0_ready),
		.io_in_0_valid(_mshrs_io_replay_valid),
		.io_in_0_bits_req_0_idx(_mshrs_io_replay_bits_addr[11:6]),
		.io_in_1_ready(_metaReadArb_io_in_1_ready),
		.io_in_1_valid(_prober_io_meta_read_valid),
		.io_in_1_bits_req_0_idx(_prober_io_meta_read_bits_idx),
		.io_in_2_ready(_metaReadArb_io_in_2_ready),
		.io_in_2_valid(_wb_io_meta_read_valid),
		.io_in_2_bits_req_0_idx(_wb_io_meta_read_bits_idx),
		.io_in_3_ready(_metaReadArb_io_in_3_ready),
		.io_in_3_valid(_mshrs_io_meta_read_valid),
		.io_in_3_bits_req_0_idx(_mshrs_io_meta_read_bits_idx),
		.io_in_4_ready(_metaReadArb_io_in_4_ready),
		.io_in_4_valid(io_lsu_req_valid & ~_mshrs_io_resp_valid),
		.io_in_4_bits_req_0_idx(io_lsu_req_bits_0_bits_addr[11:6]),
		.io_out_ready(_meta_0_io_read_ready),
		.io_out_valid(_metaReadArb_io_out_valid),
		.io_out_bits_req_0_idx(_metaReadArb_io_out_bits_req_0_idx)
	);
	BoomDuplicatedDataArray data(
		.clock(clock),
		.io_read_0_valid(_dataReadArb_io_out_bits_valid_0 & _dataReadArb_io_out_valid),
		.io_read_0_bits_addr(_dataReadArb_io_out_bits_req_0_addr),
		.io_write_valid(_dataWriteArb_io_out_valid),
		.io_write_bits_way_en(_dataWriteArb_io_out_bits_way_en),
		.io_write_bits_addr(_dataWriteArb_io_out_bits_addr),
		.io_write_bits_data(_dataWriteArb_io_out_bits_data),
		.io_resp_0_0(_data_io_resp_0_0),
		.io_resp_0_1(_data_io_resp_0_1),
		.io_resp_0_2(_data_io_resp_0_2),
		.io_resp_0_3(_data_io_resp_0_3)
	);
	Arbiter2_L1DataWriteReq dataWriteArb(
		.io_in_0_ready(),
		.io_in_0_valid(s3_valid),
		.io_in_0_bits_way_en(s3_way),
		.io_in_0_bits_addr(s3_req_REG_addr[11:0]),
		.io_in_0_bits_data(_amoalu_io_out),
		.io_in_1_ready(_dataWriteArb_io_in_1_ready),
		.io_in_1_valid(_mshrs_io_refill_valid),
		.io_in_1_bits_way_en(_mshrs_io_refill_bits_way_en),
		.io_in_1_bits_addr(_mshrs_io_refill_bits_addr),
		.io_in_1_bits_data(_mshrs_io_refill_bits_data),
		.io_out_ready(1'h1),
		.io_out_valid(_dataWriteArb_io_out_valid),
		.io_out_bits_way_en(_dataWriteArb_io_out_bits_way_en),
		.io_out_bits_addr(_dataWriteArb_io_out_bits_addr),
		.io_out_bits_data(_dataWriteArb_io_out_bits_data)
	);
	Arbiter3_BoomL1DataReadReq dataReadArb(
		.io_in_0_valid(_mshrs_io_replay_valid),
		.io_in_0_bits_req_0_addr(_mshrs_io_replay_bits_addr[11:0]),
		.io_in_1_ready(_dataReadArb_io_in_1_ready),
		.io_in_1_valid(_wb_io_data_req_valid),
		.io_in_1_bits_req_0_addr(_wb_io_data_req_bits_addr),
		.io_in_2_ready(_dataReadArb_io_in_2_ready),
		.io_in_2_valid(io_lsu_req_valid & ~_mshrs_io_resp_valid),
		.io_in_2_bits_req_0_addr(io_lsu_req_bits_0_bits_addr[11:0]),
		.io_in_2_bits_valid_0(io_lsu_req_bits_0_valid),
		.io_out_valid(_dataReadArb_io_out_valid),
		.io_out_bits_req_0_addr(_dataReadArb_io_out_bits_req_0_addr),
		.io_out_bits_valid_0(_dataReadArb_io_out_bits_valid_0)
	);
	MaxPeriodFibonacciLFSR lfsr_prng(
		.clock(clock),
		.reset(reset),
		.io_increment(replace),
		.io_out_0(_lfsr_prng_io_out_0),
		.io_out_1(_lfsr_prng_io_out_1),
		.io_out_2(),
		.io_out_3(),
		.io_out_4(),
		.io_out_5(),
		.io_out_6(),
		.io_out_7(),
		.io_out_8(),
		.io_out_9(),
		.io_out_10(),
		.io_out_11(),
		.io_out_12(),
		.io_out_13(),
		.io_out_14(),
		.io_out_15()
	);
	Arbiter2_WritebackReq wbArb(
		.io_in_0_ready(_wbArb_io_in_0_ready),
		.io_in_0_valid(_prober_io_wb_req_valid),
		.io_in_0_bits_tag(_prober_io_wb_req_bits_tag),
		.io_in_0_bits_idx(_prober_io_wb_req_bits_idx),
		.io_in_0_bits_source(_prober_io_wb_req_bits_source),
		.io_in_0_bits_param(_prober_io_wb_req_bits_param),
		.io_in_0_bits_way_en(_prober_io_wb_req_bits_way_en),
		.io_in_0_bits_voluntary(1'h0),
		.io_in_1_ready(_wbArb_io_in_1_ready),
		.io_in_1_valid(_mshrs_io_wb_req_valid),
		.io_in_1_bits_tag(_mshrs_io_wb_req_bits_tag),
		.io_in_1_bits_idx(_mshrs_io_wb_req_bits_idx),
		.io_in_1_bits_source(_mshrs_io_wb_req_bits_source),
		.io_in_1_bits_param(_mshrs_io_wb_req_bits_param),
		.io_in_1_bits_way_en(_mshrs_io_wb_req_bits_way_en),
		.io_in_1_bits_voluntary(_mshrs_io_wb_req_bits_voluntary),
		.io_out_ready(_wb_io_req_ready),
		.io_out_valid(_wbArb_io_out_valid),
		.io_out_bits_tag(_wbArb_io_out_bits_tag),
		.io_out_bits_idx(_wbArb_io_out_bits_idx),
		.io_out_bits_source(_wbArb_io_out_bits_source),
		.io_out_bits_param(_wbArb_io_out_bits_param),
		.io_out_bits_way_en(_wbArb_io_out_bits_way_en),
		.io_out_bits_voluntary(_wbArb_io_out_bits_voluntary)
	);
	Arbiter2_TLBundleC_a32d64s2k2z4c lsu_release_arb(
		.io_in_0_ready(_lsu_release_arb_io_in_0_ready),
		.io_in_0_valid(_wb_io_lsu_release_valid),
		.io_in_0_bits_address(_wb_io_lsu_release_bits_address),
		.io_in_1_ready(_lsu_release_arb_io_in_1_ready),
		.io_in_1_valid(_prober_io_lsu_release_valid),
		.io_in_1_bits_address(_prober_io_lsu_release_bits_address),
		.io_out_ready(io_lsu_release_ready),
		.io_out_valid(io_lsu_release_valid),
		.io_out_bits_address(io_lsu_release_bits_address)
	);
	AMOALU amoalu(
		.io_mask({(s3_req_REG_addr[2] ? _amoalu_io_mask_T_1 : 4'h0) | {4 {&s3_req_REG_uop_mem_size}}, (s3_req_REG_addr[2] ? 4'h0 : _amoalu_io_mask_T_1)}),
		.io_cmd(s3_req_REG_uop_mem_cmd),
		.io_lhs(s3_data_word),
		.io_rhs(amoalu_io_rhs_REG),
		.io_out(_amoalu_io_out)
	);
	assign auto_out_a_valid = _mshrs_io_mem_acquire_valid;
	assign auto_out_a_bits_opcode = _mshrs_io_mem_acquire_bits_opcode;
	assign auto_out_a_bits_size = _mshrs_io_mem_acquire_bits_size;
	assign auto_out_b_ready = _prober_io_req_ready & ~(|lrsc_count[6:2]);
	assign auto_out_c_valid = nodeOut_c_valid;
	assign auto_out_c_bits_opcode = _nodeOut_c_bits_T_20;
	assign auto_out_c_bits_param = (muxState_0 ? _wb_io_release_bits_param : 3'h0) | (muxState_1 ? _prober_io_rep_bits_param : 3'h0);
	assign auto_out_c_bits_size = _nodeOut_c_bits_T_14;
	assign auto_out_c_bits_source = (muxState_0 ? _wb_io_release_bits_source : 2'h0) | (muxState_1 ? _prober_io_rep_bits_source : 2'h0);
	assign auto_out_c_bits_address = (muxState_0 ? _wb_io_release_bits_address : 32'h00000000) | (muxState_1 ? _prober_io_rep_bits_address : 32'h00000000);
	assign auto_out_c_bits_data = (muxState_0 ? _wb_io_release_bits_data : 64'h0000000000000000);
	assign auto_out_d_ready = nodeOut_d_ready;
	assign io_lsu_req_ready = io_lsu_req_ready_0;
	assign io_lsu_resp_0_valid = s2_valid_REG & s2_send_resp_0;
	assign io_lsu_resp_0_bits_uop_is_amo = s2_req_0_uop_is_amo;
	assign io_lsu_resp_0_bits_uop_ldq_idx = s2_req_0_uop_ldq_idx;
	assign io_lsu_resp_0_bits_uop_stq_idx = s2_req_0_uop_stq_idx;
	assign io_lsu_resp_0_bits_uop_uses_ldq = s2_req_0_uop_uses_ldq;
	assign io_lsu_resp_0_bits_uop_uses_stq = s2_req_0_uop_uses_stq;
	assign io_lsu_resp_0_bits_data = {((s2_req_0_uop_mem_size == 2'h0) | s2_sc ? {56 {s2_req_0_uop_mem_signed & io_lsu_resp_0_bits_data_zeroed_2[7]}} : {(s2_req_0_uop_mem_size == 2'h1 ? {48 {s2_req_0_uop_mem_signed & io_lsu_resp_0_bits_data_zeroed_1[15]}} : {(s2_req_0_uop_mem_size == 2'h2 ? {32 {s2_req_0_uop_mem_signed & io_lsu_resp_0_bits_data_zeroed[31]}} : size_dat_padded[63:32]), io_lsu_resp_0_bits_data_zeroed[31:16]}), io_lsu_resp_0_bits_data_zeroed_1[15:8]}), io_lsu_resp_0_bits_data_zeroed_2[7:1], io_lsu_resp_0_bits_data_zeroed_2[0] | s2_sc_fail};
	assign io_lsu_resp_0_bits_is_hella = s2_req_0_is_hella;
	assign io_lsu_store_ack_0_valid = (((s2_valid_REG & s2_send_store_ack_REG) & ~s2_nack_0) & (((((((((((_s3_valid_T_1 | _s3_valid_T_2) | _s3_valid_T_4) | _s3_valid_T_6) | _s3_valid_T_7) | _s3_valid_T_8) | _s3_valid_T_9) | _s3_valid_T_13) | _s3_valid_T_14) | _s3_valid_T_15) | _s3_valid_T_16) | _s3_valid_T_17)) & (s2_hit_0 | replace);
	assign io_lsu_store_ack_0_bits_uop_stq_idx = s2_req_0_uop_stq_idx;
	assign io_lsu_store_ack_0_bits_is_hella = s2_req_0_is_hella;
	assign io_lsu_nack_0_valid = io_lsu_nack_0_valid_0;
	assign io_lsu_nack_0_bits_uop_ldq_idx = s2_req_0_uop_ldq_idx;
	assign io_lsu_nack_0_bits_uop_stq_idx = s2_req_0_uop_stq_idx;
	assign io_lsu_nack_0_bits_uop_mem_size = s2_req_0_uop_mem_size;
	assign io_lsu_nack_0_bits_uop_uses_ldq = s2_req_0_uop_uses_ldq;
	assign io_lsu_nack_0_bits_uop_uses_stq = s2_req_0_uop_uses_stq;
	assign io_lsu_nack_0_bits_addr = s2_req_0_addr;
	assign io_lsu_nack_0_bits_is_hella = s2_req_0_is_hella;
	assign io_lsu_ll_resp_valid = _mshrs_io_resp_valid;
	assign io_lsu_ordered = (_mshrs_io_fence_rdy & ~s1_valid_REG) & ~s2_valid_REG;
	assign io_lsu_perf_acquire = ((io_lsu_perf_acquire_counter == 9'h001) | (io_lsu_perf_acquire_beats1 == 9'h000)) & _io_lsu_perf_acquire_T;
	assign io_lsu_perf_release = ((io_lsu_perf_release_counter == 9'h001) | (io_lsu_perf_release_beats1 == 9'h000)) & _io_lsu_perf_release_T;
endmodule
