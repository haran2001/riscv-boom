module FpPipeline (
	clock,
	reset,
	io_brupdate_b1_resolve_mask,
	io_brupdate_b1_mispredict_mask,
	io_flush_pipeline,
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
	io_dis_uops_0_bits_fp_rm,
	io_dis_uops_0_bits_fp_typ,
	io_dis_uops_0_bits_xcpt_pf_if,
	io_dis_uops_0_bits_xcpt_ae_if,
	io_dis_uops_0_bits_xcpt_ma_if,
	io_dis_uops_0_bits_bp_debug_if,
	io_dis_uops_0_bits_bp_xcpt_if,
	io_dis_uops_0_bits_debug_fsrc,
	io_dis_uops_0_bits_debug_tsrc,
	io_ll_wports_0_valid,
	io_ll_wports_0_bits_uop_br_mask,
	io_ll_wports_0_bits_uop_rob_idx,
	io_ll_wports_0_bits_uop_pdst,
	io_ll_wports_0_bits_uop_mem_size,
	io_ll_wports_0_bits_uop_dst_rtype,
	io_ll_wports_0_bits_data,
	io_from_int_ready,
	io_from_int_valid,
	io_from_int_bits_uop_rob_idx,
	io_from_int_bits_uop_pdst,
	io_from_int_bits_uop_dst_rtype,
	io_from_int_bits_data,
	io_from_int_bits_predicated,
	io_from_int_bits_fflags_valid,
	io_from_int_bits_fflags_bits,
	io_dgen_valid,
	io_dgen_bits_uop_stq_idx,
	io_dgen_bits_data,
	io_to_int_ready,
	io_to_int_valid,
	io_to_int_bits_uop_br_mask,
	io_to_int_bits_uop_rob_idx,
	io_to_int_bits_uop_pdst,
	io_to_int_bits_uop_dst_rtype,
	io_to_int_bits_data,
	io_to_int_bits_predicated,
	io_to_int_bits_fflags_valid,
	io_to_int_bits_fflags_bits,
	io_wakeups_0_valid,
	io_wakeups_0_bits_uop_pdst,
	io_wakeups_0_bits_uop_dst_rtype,
	io_wakeups_1_valid,
	io_wakeups_1_bits_uop_pdst,
	io_wakeups_1_bits_uop_dst_rtype,
	io_wb_0_valid,
	io_wb_0_bits_uop_rob_idx,
	io_wb_0_bits_uop_pdst,
	io_wb_0_bits_fflags_valid,
	io_wb_0_bits_fflags_bits,
	io_wb_1_valid,
	io_wb_1_bits_uop_rob_idx,
	io_wb_1_bits_uop_pdst,
	io_wb_1_bits_predicated,
	io_wb_1_bits_fflags_valid,
	io_wb_1_bits_fflags_bits
);
	input clock;
	input reset;
	input [7:0] io_brupdate_b1_resolve_mask;
	input [7:0] io_brupdate_b1_mispredict_mask;
	input io_flush_pipeline;
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
	input [2:0] io_dis_uops_0_bits_fp_rm;
	input [1:0] io_dis_uops_0_bits_fp_typ;
	input io_dis_uops_0_bits_xcpt_pf_if;
	input io_dis_uops_0_bits_xcpt_ae_if;
	input io_dis_uops_0_bits_xcpt_ma_if;
	input io_dis_uops_0_bits_bp_debug_if;
	input io_dis_uops_0_bits_bp_xcpt_if;
	input [2:0] io_dis_uops_0_bits_debug_fsrc;
	input [2:0] io_dis_uops_0_bits_debug_tsrc;
	input io_ll_wports_0_valid;
	input [7:0] io_ll_wports_0_bits_uop_br_mask;
	input [4:0] io_ll_wports_0_bits_uop_rob_idx;
	input [5:0] io_ll_wports_0_bits_uop_pdst;
	input [1:0] io_ll_wports_0_bits_uop_mem_size;
	input [1:0] io_ll_wports_0_bits_uop_dst_rtype;
	input [64:0] io_ll_wports_0_bits_data;
	output wire io_from_int_ready;
	input io_from_int_valid;
	input [4:0] io_from_int_bits_uop_rob_idx;
	input [5:0] io_from_int_bits_uop_pdst;
	input [1:0] io_from_int_bits_uop_dst_rtype;
	input [64:0] io_from_int_bits_data;
	input io_from_int_bits_predicated;
	input io_from_int_bits_fflags_valid;
	input [4:0] io_from_int_bits_fflags_bits;
	output wire io_dgen_valid;
	output wire [3:0] io_dgen_bits_uop_stq_idx;
	output wire [63:0] io_dgen_bits_data;
	input io_to_int_ready;
	output wire io_to_int_valid;
	output wire [7:0] io_to_int_bits_uop_br_mask;
	output wire [4:0] io_to_int_bits_uop_rob_idx;
	output wire [5:0] io_to_int_bits_uop_pdst;
	output wire [1:0] io_to_int_bits_uop_dst_rtype;
	output wire [63:0] io_to_int_bits_data;
	output wire io_to_int_bits_predicated;
	output wire io_to_int_bits_fflags_valid;
	output wire [4:0] io_to_int_bits_fflags_bits;
	output wire io_wakeups_0_valid;
	output wire [5:0] io_wakeups_0_bits_uop_pdst;
	output wire [1:0] io_wakeups_0_bits_uop_dst_rtype;
	output wire io_wakeups_1_valid;
	output wire [5:0] io_wakeups_1_bits_uop_pdst;
	output wire [1:0] io_wakeups_1_bits_uop_dst_rtype;
	output wire io_wb_0_valid;
	output wire [4:0] io_wb_0_bits_uop_rob_idx;
	output wire [5:0] io_wb_0_bits_uop_pdst;
	output wire io_wb_0_bits_fflags_valid;
	output wire [4:0] io_wb_0_bits_fflags_bits;
	output wire io_wb_1_valid;
	output wire [4:0] io_wb_1_bits_uop_rob_idx;
	output wire [5:0] io_wb_1_bits_uop_pdst;
	output wire io_wb_1_bits_predicated;
	output wire io_wb_1_bits_fflags_valid;
	output wire [4:0] io_wb_1_bits_fflags_bits;
	wire _ll_wbarb_io_in_2_ready;
	wire _ll_wbarb_io_out_valid;
	wire [5:0] _ll_wbarb_io_out_bits_uop_pdst;
	wire [1:0] _ll_wbarb_io_out_bits_uop_dst_rtype;
	wire [64:0] _ll_wbarb_io_out_bits_data;
	wire _fregfile_io_arb_read_reqs_2_ready;
	wire [64:0] _fregfile_io_rrd_read_resps_0;
	wire [64:0] _fregfile_io_rrd_read_resps_1;
	wire [64:0] _fregfile_io_rrd_read_resps_2;
	wire _fp_issue_unit_io_iss_uops_0_valid;
	wire [31:0] _fp_issue_unit_io_iss_uops_0_bits_inst;
	wire [31:0] _fp_issue_unit_io_iss_uops_0_bits_debug_inst;
	wire _fp_issue_unit_io_iss_uops_0_bits_is_rvc;
	wire [39:0] _fp_issue_unit_io_iss_uops_0_bits_debug_pc;
	wire _fp_issue_unit_io_iss_uops_0_bits_iq_type_0;
	wire _fp_issue_unit_io_iss_uops_0_bits_iq_type_1;
	wire _fp_issue_unit_io_iss_uops_0_bits_iq_type_2;
	wire _fp_issue_unit_io_iss_uops_0_bits_iq_type_3;
	wire _fp_issue_unit_io_iss_uops_0_bits_fu_code_0;
	wire _fp_issue_unit_io_iss_uops_0_bits_fu_code_1;
	wire _fp_issue_unit_io_iss_uops_0_bits_fu_code_2;
	wire _fp_issue_unit_io_iss_uops_0_bits_fu_code_3;
	wire _fp_issue_unit_io_iss_uops_0_bits_fu_code_4;
	wire _fp_issue_unit_io_iss_uops_0_bits_fu_code_5;
	wire _fp_issue_unit_io_iss_uops_0_bits_fu_code_6;
	wire _fp_issue_unit_io_iss_uops_0_bits_fu_code_7;
	wire _fp_issue_unit_io_iss_uops_0_bits_fu_code_8;
	wire _fp_issue_unit_io_iss_uops_0_bits_fu_code_9;
	wire _fp_issue_unit_io_iss_uops_0_bits_iw_issued;
	wire _fp_issue_unit_io_iss_uops_0_bits_iw_p1_speculative_child;
	wire _fp_issue_unit_io_iss_uops_0_bits_iw_p2_speculative_child;
	wire _fp_issue_unit_io_iss_uops_0_bits_iw_p1_bypass_hint;
	wire _fp_issue_unit_io_iss_uops_0_bits_iw_p2_bypass_hint;
	wire _fp_issue_unit_io_iss_uops_0_bits_iw_p3_bypass_hint;
	wire _fp_issue_unit_io_iss_uops_0_bits_dis_col_sel;
	wire [7:0] _fp_issue_unit_io_iss_uops_0_bits_br_mask;
	wire [2:0] _fp_issue_unit_io_iss_uops_0_bits_br_tag;
	wire [3:0] _fp_issue_unit_io_iss_uops_0_bits_br_type;
	wire _fp_issue_unit_io_iss_uops_0_bits_is_sfb;
	wire _fp_issue_unit_io_iss_uops_0_bits_is_fence;
	wire _fp_issue_unit_io_iss_uops_0_bits_is_fencei;
	wire _fp_issue_unit_io_iss_uops_0_bits_is_sfence;
	wire _fp_issue_unit_io_iss_uops_0_bits_is_amo;
	wire _fp_issue_unit_io_iss_uops_0_bits_is_eret;
	wire _fp_issue_unit_io_iss_uops_0_bits_is_sys_pc2epc;
	wire _fp_issue_unit_io_iss_uops_0_bits_is_rocc;
	wire _fp_issue_unit_io_iss_uops_0_bits_is_mov;
	wire [3:0] _fp_issue_unit_io_iss_uops_0_bits_ftq_idx;
	wire _fp_issue_unit_io_iss_uops_0_bits_edge_inst;
	wire [5:0] _fp_issue_unit_io_iss_uops_0_bits_pc_lob;
	wire _fp_issue_unit_io_iss_uops_0_bits_taken;
	wire _fp_issue_unit_io_iss_uops_0_bits_imm_rename;
	wire [2:0] _fp_issue_unit_io_iss_uops_0_bits_imm_sel;
	wire [4:0] _fp_issue_unit_io_iss_uops_0_bits_pimm;
	wire [19:0] _fp_issue_unit_io_iss_uops_0_bits_imm_packed;
	wire [1:0] _fp_issue_unit_io_iss_uops_0_bits_op1_sel;
	wire [2:0] _fp_issue_unit_io_iss_uops_0_bits_op2_sel;
	wire _fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_ldst;
	wire _fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_wen;
	wire _fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_ren1;
	wire _fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_ren2;
	wire _fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_ren3;
	wire _fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_swap12;
	wire _fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_swap23;
	wire [1:0] _fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_typeTagIn;
	wire [1:0] _fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_typeTagOut;
	wire _fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_fromint;
	wire _fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_toint;
	wire _fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_fastpipe;
	wire _fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_fma;
	wire _fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_div;
	wire _fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_sqrt;
	wire _fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_wflags;
	wire _fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_vec;
	wire [4:0] _fp_issue_unit_io_iss_uops_0_bits_rob_idx;
	wire [3:0] _fp_issue_unit_io_iss_uops_0_bits_ldq_idx;
	wire [3:0] _fp_issue_unit_io_iss_uops_0_bits_stq_idx;
	wire [1:0] _fp_issue_unit_io_iss_uops_0_bits_rxq_idx;
	wire [5:0] _fp_issue_unit_io_iss_uops_0_bits_pdst;
	wire [5:0] _fp_issue_unit_io_iss_uops_0_bits_prs1;
	wire [5:0] _fp_issue_unit_io_iss_uops_0_bits_prs2;
	wire [5:0] _fp_issue_unit_io_iss_uops_0_bits_prs3;
	wire [3:0] _fp_issue_unit_io_iss_uops_0_bits_ppred;
	wire _fp_issue_unit_io_iss_uops_0_bits_prs1_busy;
	wire _fp_issue_unit_io_iss_uops_0_bits_prs2_busy;
	wire _fp_issue_unit_io_iss_uops_0_bits_prs3_busy;
	wire _fp_issue_unit_io_iss_uops_0_bits_ppred_busy;
	wire [5:0] _fp_issue_unit_io_iss_uops_0_bits_stale_pdst;
	wire _fp_issue_unit_io_iss_uops_0_bits_exception;
	wire [63:0] _fp_issue_unit_io_iss_uops_0_bits_exc_cause;
	wire [4:0] _fp_issue_unit_io_iss_uops_0_bits_mem_cmd;
	wire [1:0] _fp_issue_unit_io_iss_uops_0_bits_mem_size;
	wire _fp_issue_unit_io_iss_uops_0_bits_mem_signed;
	wire _fp_issue_unit_io_iss_uops_0_bits_uses_ldq;
	wire _fp_issue_unit_io_iss_uops_0_bits_uses_stq;
	wire _fp_issue_unit_io_iss_uops_0_bits_is_unique;
	wire _fp_issue_unit_io_iss_uops_0_bits_flush_on_commit;
	wire [2:0] _fp_issue_unit_io_iss_uops_0_bits_csr_cmd;
	wire _fp_issue_unit_io_iss_uops_0_bits_ldst_is_rs1;
	wire [5:0] _fp_issue_unit_io_iss_uops_0_bits_ldst;
	wire [5:0] _fp_issue_unit_io_iss_uops_0_bits_lrs1;
	wire [5:0] _fp_issue_unit_io_iss_uops_0_bits_lrs2;
	wire [5:0] _fp_issue_unit_io_iss_uops_0_bits_lrs3;
	wire [1:0] _fp_issue_unit_io_iss_uops_0_bits_dst_rtype;
	wire [1:0] _fp_issue_unit_io_iss_uops_0_bits_lrs1_rtype;
	wire [1:0] _fp_issue_unit_io_iss_uops_0_bits_lrs2_rtype;
	wire _fp_issue_unit_io_iss_uops_0_bits_frs3_en;
	wire _fp_issue_unit_io_iss_uops_0_bits_fcn_dw;
	wire [4:0] _fp_issue_unit_io_iss_uops_0_bits_fcn_op;
	wire _fp_issue_unit_io_iss_uops_0_bits_fp_val;
	wire [2:0] _fp_issue_unit_io_iss_uops_0_bits_fp_rm;
	wire [1:0] _fp_issue_unit_io_iss_uops_0_bits_fp_typ;
	wire _fp_issue_unit_io_iss_uops_0_bits_xcpt_pf_if;
	wire _fp_issue_unit_io_iss_uops_0_bits_xcpt_ae_if;
	wire _fp_issue_unit_io_iss_uops_0_bits_xcpt_ma_if;
	wire _fp_issue_unit_io_iss_uops_0_bits_bp_debug_if;
	wire _fp_issue_unit_io_iss_uops_0_bits_bp_xcpt_if;
	wire [2:0] _fp_issue_unit_io_iss_uops_0_bits_debug_fsrc;
	wire [2:0] _fp_issue_unit_io_iss_uops_0_bits_debug_tsrc;
	wire _fp_exe_unit_0_io_ready_fu_types_7;
	wire _fp_exe_unit_0_io_ready_fu_types_9;
	wire _fp_exe_unit_0_io_arb_frf_reqs_0_valid;
	wire [5:0] _fp_exe_unit_0_io_arb_frf_reqs_0_bits;
	wire _fp_exe_unit_0_io_arb_frf_reqs_1_valid;
	wire [5:0] _fp_exe_unit_0_io_arb_frf_reqs_1_bits;
	wire _fp_exe_unit_0_io_arb_frf_reqs_2_valid;
	wire [5:0] _fp_exe_unit_0_io_arb_frf_reqs_2_bits;
	wire _fp_exe_unit_0_io_squash_iss;
	wire _fp_exe_unit_0_io_wakeup_valid;
	wire [5:0] _fp_exe_unit_0_io_wakeup_bits_uop_pdst;
	wire _fp_exe_unit_0_io_fpu_resp_valid;
	wire [5:0] _fp_exe_unit_0_io_fpu_resp_bits_uop_pdst;
	wire [1:0] _fp_exe_unit_0_io_fpu_resp_bits_uop_dst_rtype;
	wire [64:0] _fp_exe_unit_0_io_fpu_resp_bits_data;
	wire _fp_exe_unit_0_io_fdiv_resp_valid;
	wire [4:0] _fp_exe_unit_0_io_fdiv_resp_bits_uop_rob_idx;
	wire [5:0] _fp_exe_unit_0_io_fdiv_resp_bits_uop_pdst;
	wire [1:0] _fp_exe_unit_0_io_fdiv_resp_bits_uop_dst_rtype;
	wire [64:0] _fp_exe_unit_0_io_fdiv_resp_bits_data;
	wire _fp_exe_unit_0_io_fdiv_resp_bits_fflags_valid;
	wire [4:0] _fp_exe_unit_0_io_fdiv_resp_bits_fflags_bits;
	reg ll_wbarb_io_in_0_valid_REG;
	reg [4:0] ll_wbarb_io_in_0_bits_REG_uop_rob_idx;
	reg [5:0] ll_wbarb_io_in_0_bits_REG_uop_pdst;
	reg [1:0] ll_wbarb_io_in_0_bits_REG_uop_dst_rtype;
	reg [64:0] ll_wbarb_io_in_0_bits_data_REG;
	reg ll_wbarb_io_in_0_bits_data_REG_1;
	wire [63:0] _ll_wbarb_io_in_0_bits_data_T_3 = (ll_wbarb_io_in_0_bits_data_REG_1 ? 64'h0000000000000000 : 64'hffffffff00000000) | ll_wbarb_io_in_0_bits_data_REG[63:0];
	wire ll_wbarb_io_in_0_bits_data_rawIn_isZeroExpIn = _ll_wbarb_io_in_0_bits_data_T_3[62:52] == 11'h000;
	wire [5:0] ll_wbarb_io_in_0_bits_data_rawIn_normDist = (_ll_wbarb_io_in_0_bits_data_T_3[51] ? 6'h00 : (_ll_wbarb_io_in_0_bits_data_T_3[50] ? 6'h01 : (_ll_wbarb_io_in_0_bits_data_T_3[49] ? 6'h02 : (_ll_wbarb_io_in_0_bits_data_T_3[48] ? 6'h03 : (_ll_wbarb_io_in_0_bits_data_T_3[47] ? 6'h04 : (_ll_wbarb_io_in_0_bits_data_T_3[46] ? 6'h05 : (_ll_wbarb_io_in_0_bits_data_T_3[45] ? 6'h06 : (_ll_wbarb_io_in_0_bits_data_T_3[44] ? 6'h07 : (_ll_wbarb_io_in_0_bits_data_T_3[43] ? 6'h08 : (_ll_wbarb_io_in_0_bits_data_T_3[42] ? 6'h09 : (_ll_wbarb_io_in_0_bits_data_T_3[41] ? 6'h0a : (_ll_wbarb_io_in_0_bits_data_T_3[40] ? 6'h0b : (_ll_wbarb_io_in_0_bits_data_T_3[39] ? 6'h0c : (_ll_wbarb_io_in_0_bits_data_T_3[38] ? 6'h0d : (_ll_wbarb_io_in_0_bits_data_T_3[37] ? 6'h0e : (_ll_wbarb_io_in_0_bits_data_T_3[36] ? 6'h0f : (_ll_wbarb_io_in_0_bits_data_T_3[35] ? 6'h10 : (_ll_wbarb_io_in_0_bits_data_T_3[34] ? 6'h11 : (_ll_wbarb_io_in_0_bits_data_T_3[33] ? 6'h12 : (_ll_wbarb_io_in_0_bits_data_T_3[32] ? 6'h13 : (_ll_wbarb_io_in_0_bits_data_T_3[31] ? 6'h14 : (_ll_wbarb_io_in_0_bits_data_T_3[30] ? 6'h15 : (_ll_wbarb_io_in_0_bits_data_T_3[29] ? 6'h16 : (_ll_wbarb_io_in_0_bits_data_T_3[28] ? 6'h17 : (_ll_wbarb_io_in_0_bits_data_T_3[27] ? 6'h18 : (_ll_wbarb_io_in_0_bits_data_T_3[26] ? 6'h19 : (_ll_wbarb_io_in_0_bits_data_T_3[25] ? 6'h1a : (_ll_wbarb_io_in_0_bits_data_T_3[24] ? 6'h1b : (_ll_wbarb_io_in_0_bits_data_T_3[23] ? 6'h1c : (_ll_wbarb_io_in_0_bits_data_T_3[22] ? 6'h1d : (_ll_wbarb_io_in_0_bits_data_T_3[21] ? 6'h1e : (_ll_wbarb_io_in_0_bits_data_T_3[20] ? 6'h1f : (_ll_wbarb_io_in_0_bits_data_T_3[19] ? 6'h20 : (_ll_wbarb_io_in_0_bits_data_T_3[18] ? 6'h21 : (_ll_wbarb_io_in_0_bits_data_T_3[17] ? 6'h22 : (_ll_wbarb_io_in_0_bits_data_T_3[16] ? 6'h23 : (_ll_wbarb_io_in_0_bits_data_T_3[15] ? 6'h24 : (_ll_wbarb_io_in_0_bits_data_T_3[14] ? 6'h25 : (_ll_wbarb_io_in_0_bits_data_T_3[13] ? 6'h26 : (_ll_wbarb_io_in_0_bits_data_T_3[12] ? 6'h27 : (_ll_wbarb_io_in_0_bits_data_T_3[11] ? 6'h28 : (_ll_wbarb_io_in_0_bits_data_T_3[10] ? 6'h29 : (_ll_wbarb_io_in_0_bits_data_T_3[9] ? 6'h2a : (_ll_wbarb_io_in_0_bits_data_T_3[8] ? 6'h2b : (_ll_wbarb_io_in_0_bits_data_T_3[7] ? 6'h2c : (_ll_wbarb_io_in_0_bits_data_T_3[6] ? 6'h2d : (_ll_wbarb_io_in_0_bits_data_T_3[5] ? 6'h2e : (_ll_wbarb_io_in_0_bits_data_T_3[4] ? 6'h2f : (_ll_wbarb_io_in_0_bits_data_T_3[3] ? 6'h30 : (_ll_wbarb_io_in_0_bits_data_T_3[2] ? 6'h31 : {5'h19, ~_ll_wbarb_io_in_0_bits_data_T_3[1]}))))))))))))))))))))))))))))))))))))))))))))))))));
	wire [114:0] _ll_wbarb_io_in_0_bits_data_rawIn_subnormFract_T = {63'h0000000000000000, _ll_wbarb_io_in_0_bits_data_T_3[51:0]} << ll_wbarb_io_in_0_bits_data_rawIn_normDist;
	wire [11:0] _ll_wbarb_io_in_0_bits_data_rawIn_adjustedExp_T_4 = (ll_wbarb_io_in_0_bits_data_rawIn_isZeroExpIn ? {6'h3f, ~ll_wbarb_io_in_0_bits_data_rawIn_normDist} : {1'h0, _ll_wbarb_io_in_0_bits_data_T_3[62:52]}) + {10'h100, (ll_wbarb_io_in_0_bits_data_rawIn_isZeroExpIn ? 2'h2 : 2'h1)};
	wire [51:0] _ll_wbarb_io_in_0_bits_data_rawIn_out_sig_T_2 = (ll_wbarb_io_in_0_bits_data_rawIn_isZeroExpIn ? {_ll_wbarb_io_in_0_bits_data_rawIn_subnormFract_T[50:0], 1'h0} : _ll_wbarb_io_in_0_bits_data_T_3[51:0]);
	wire [2:0] _ll_wbarb_io_in_0_bits_data_T_5 = (ll_wbarb_io_in_0_bits_data_rawIn_isZeroExpIn & ~(|_ll_wbarb_io_in_0_bits_data_T_3[51:0]) ? 3'h0 : _ll_wbarb_io_in_0_bits_data_rawIn_adjustedExp_T_4[11:9]);
	wire _GEN = _ll_wbarb_io_in_0_bits_data_T_5[0] | (&_ll_wbarb_io_in_0_bits_data_rawIn_adjustedExp_T_4[11:10] & |_ll_wbarb_io_in_0_bits_data_T_3[51:0]);
	wire ll_wbarb_io_in_0_bits_data_rawIn_isZeroExpIn_1 = _ll_wbarb_io_in_0_bits_data_T_3[30:23] == 8'h00;
	wire [4:0] ll_wbarb_io_in_0_bits_data_rawIn_normDist_1 = (_ll_wbarb_io_in_0_bits_data_T_3[22] ? 5'h00 : (_ll_wbarb_io_in_0_bits_data_T_3[21] ? 5'h01 : (_ll_wbarb_io_in_0_bits_data_T_3[20] ? 5'h02 : (_ll_wbarb_io_in_0_bits_data_T_3[19] ? 5'h03 : (_ll_wbarb_io_in_0_bits_data_T_3[18] ? 5'h04 : (_ll_wbarb_io_in_0_bits_data_T_3[17] ? 5'h05 : (_ll_wbarb_io_in_0_bits_data_T_3[16] ? 5'h06 : (_ll_wbarb_io_in_0_bits_data_T_3[15] ? 5'h07 : (_ll_wbarb_io_in_0_bits_data_T_3[14] ? 5'h08 : (_ll_wbarb_io_in_0_bits_data_T_3[13] ? 5'h09 : (_ll_wbarb_io_in_0_bits_data_T_3[12] ? 5'h0a : (_ll_wbarb_io_in_0_bits_data_T_3[11] ? 5'h0b : (_ll_wbarb_io_in_0_bits_data_T_3[10] ? 5'h0c : (_ll_wbarb_io_in_0_bits_data_T_3[9] ? 5'h0d : (_ll_wbarb_io_in_0_bits_data_T_3[8] ? 5'h0e : (_ll_wbarb_io_in_0_bits_data_T_3[7] ? 5'h0f : (_ll_wbarb_io_in_0_bits_data_T_3[6] ? 5'h10 : (_ll_wbarb_io_in_0_bits_data_T_3[5] ? 5'h11 : (_ll_wbarb_io_in_0_bits_data_T_3[4] ? 5'h12 : (_ll_wbarb_io_in_0_bits_data_T_3[3] ? 5'h13 : (_ll_wbarb_io_in_0_bits_data_T_3[2] ? 5'h14 : (_ll_wbarb_io_in_0_bits_data_T_3[1] ? 5'h15 : 5'h16))))))))))))))))))))));
	wire [53:0] _ll_wbarb_io_in_0_bits_data_rawIn_subnormFract_T_2 = {31'h00000000, _ll_wbarb_io_in_0_bits_data_T_3[22:0]} << ll_wbarb_io_in_0_bits_data_rawIn_normDist_1;
	wire [8:0] _ll_wbarb_io_in_0_bits_data_rawIn_adjustedExp_T_9 = (ll_wbarb_io_in_0_bits_data_rawIn_isZeroExpIn_1 ? {4'hf, ~ll_wbarb_io_in_0_bits_data_rawIn_normDist_1} : {1'h0, _ll_wbarb_io_in_0_bits_data_T_3[30:23]}) + {7'h20, (ll_wbarb_io_in_0_bits_data_rawIn_isZeroExpIn_1 ? 2'h2 : 2'h1)};
	wire [2:0] _ll_wbarb_io_in_0_bits_data_T_14 = (ll_wbarb_io_in_0_bits_data_rawIn_isZeroExpIn_1 & ~(|_ll_wbarb_io_in_0_bits_data_T_3[22:0]) ? 3'h0 : _ll_wbarb_io_in_0_bits_data_rawIn_adjustedExp_T_9[8:6]);
	wire _fp_bypasses_0_valid_T = _fp_exe_unit_0_io_fpu_resp_bits_uop_dst_rtype == 2'h1;
	always @(posedge clock) begin
		ll_wbarb_io_in_0_valid_REG <= io_ll_wports_0_valid & ~(|(io_brupdate_b1_mispredict_mask & io_ll_wports_0_bits_uop_br_mask) | io_flush_pipeline);
		ll_wbarb_io_in_0_bits_REG_uop_rob_idx <= io_ll_wports_0_bits_uop_rob_idx;
		ll_wbarb_io_in_0_bits_REG_uop_pdst <= io_ll_wports_0_bits_uop_pdst;
		ll_wbarb_io_in_0_bits_REG_uop_dst_rtype <= io_ll_wports_0_bits_uop_dst_rtype;
		ll_wbarb_io_in_0_bits_data_REG <= io_ll_wports_0_bits_data;
		ll_wbarb_io_in_0_bits_data_REG_1 <= io_ll_wports_0_bits_uop_mem_size != 2'h2;
	end
	FPExeUnit fp_exe_unit_0(
		.clock(clock),
		.reset(reset),
		.io_kill(io_flush_pipeline),
		.io_brupdate_b1_resolve_mask(io_brupdate_b1_resolve_mask),
		.io_brupdate_b1_mispredict_mask(io_brupdate_b1_mispredict_mask),
		.io_ready_fu_types_7(_fp_exe_unit_0_io_ready_fu_types_7),
		.io_ready_fu_types_9(_fp_exe_unit_0_io_ready_fu_types_9),
		.io_iss_uop_valid(_fp_issue_unit_io_iss_uops_0_valid),
		.io_iss_uop_bits_inst(_fp_issue_unit_io_iss_uops_0_bits_inst),
		.io_iss_uop_bits_debug_inst(_fp_issue_unit_io_iss_uops_0_bits_debug_inst),
		.io_iss_uop_bits_is_rvc(_fp_issue_unit_io_iss_uops_0_bits_is_rvc),
		.io_iss_uop_bits_debug_pc(_fp_issue_unit_io_iss_uops_0_bits_debug_pc),
		.io_iss_uop_bits_iq_type_0(_fp_issue_unit_io_iss_uops_0_bits_iq_type_0),
		.io_iss_uop_bits_iq_type_1(_fp_issue_unit_io_iss_uops_0_bits_iq_type_1),
		.io_iss_uop_bits_iq_type_2(_fp_issue_unit_io_iss_uops_0_bits_iq_type_2),
		.io_iss_uop_bits_iq_type_3(_fp_issue_unit_io_iss_uops_0_bits_iq_type_3),
		.io_iss_uop_bits_fu_code_0(_fp_issue_unit_io_iss_uops_0_bits_fu_code_0),
		.io_iss_uop_bits_fu_code_1(_fp_issue_unit_io_iss_uops_0_bits_fu_code_1),
		.io_iss_uop_bits_fu_code_2(_fp_issue_unit_io_iss_uops_0_bits_fu_code_2),
		.io_iss_uop_bits_fu_code_3(_fp_issue_unit_io_iss_uops_0_bits_fu_code_3),
		.io_iss_uop_bits_fu_code_4(_fp_issue_unit_io_iss_uops_0_bits_fu_code_4),
		.io_iss_uop_bits_fu_code_5(_fp_issue_unit_io_iss_uops_0_bits_fu_code_5),
		.io_iss_uop_bits_fu_code_6(_fp_issue_unit_io_iss_uops_0_bits_fu_code_6),
		.io_iss_uop_bits_fu_code_7(_fp_issue_unit_io_iss_uops_0_bits_fu_code_7),
		.io_iss_uop_bits_fu_code_8(_fp_issue_unit_io_iss_uops_0_bits_fu_code_8),
		.io_iss_uop_bits_fu_code_9(_fp_issue_unit_io_iss_uops_0_bits_fu_code_9),
		.io_iss_uop_bits_iw_issued(_fp_issue_unit_io_iss_uops_0_bits_iw_issued),
		.io_iss_uop_bits_iw_p1_speculative_child(_fp_issue_unit_io_iss_uops_0_bits_iw_p1_speculative_child),
		.io_iss_uop_bits_iw_p2_speculative_child(_fp_issue_unit_io_iss_uops_0_bits_iw_p2_speculative_child),
		.io_iss_uop_bits_iw_p1_bypass_hint(_fp_issue_unit_io_iss_uops_0_bits_iw_p1_bypass_hint),
		.io_iss_uop_bits_iw_p2_bypass_hint(_fp_issue_unit_io_iss_uops_0_bits_iw_p2_bypass_hint),
		.io_iss_uop_bits_iw_p3_bypass_hint(_fp_issue_unit_io_iss_uops_0_bits_iw_p3_bypass_hint),
		.io_iss_uop_bits_dis_col_sel(_fp_issue_unit_io_iss_uops_0_bits_dis_col_sel),
		.io_iss_uop_bits_br_mask(_fp_issue_unit_io_iss_uops_0_bits_br_mask),
		.io_iss_uop_bits_br_tag(_fp_issue_unit_io_iss_uops_0_bits_br_tag),
		.io_iss_uop_bits_br_type(_fp_issue_unit_io_iss_uops_0_bits_br_type),
		.io_iss_uop_bits_is_sfb(_fp_issue_unit_io_iss_uops_0_bits_is_sfb),
		.io_iss_uop_bits_is_fence(_fp_issue_unit_io_iss_uops_0_bits_is_fence),
		.io_iss_uop_bits_is_fencei(_fp_issue_unit_io_iss_uops_0_bits_is_fencei),
		.io_iss_uop_bits_is_sfence(_fp_issue_unit_io_iss_uops_0_bits_is_sfence),
		.io_iss_uop_bits_is_amo(_fp_issue_unit_io_iss_uops_0_bits_is_amo),
		.io_iss_uop_bits_is_eret(_fp_issue_unit_io_iss_uops_0_bits_is_eret),
		.io_iss_uop_bits_is_sys_pc2epc(_fp_issue_unit_io_iss_uops_0_bits_is_sys_pc2epc),
		.io_iss_uop_bits_is_rocc(_fp_issue_unit_io_iss_uops_0_bits_is_rocc),
		.io_iss_uop_bits_is_mov(_fp_issue_unit_io_iss_uops_0_bits_is_mov),
		.io_iss_uop_bits_ftq_idx(_fp_issue_unit_io_iss_uops_0_bits_ftq_idx),
		.io_iss_uop_bits_edge_inst(_fp_issue_unit_io_iss_uops_0_bits_edge_inst),
		.io_iss_uop_bits_pc_lob(_fp_issue_unit_io_iss_uops_0_bits_pc_lob),
		.io_iss_uop_bits_taken(_fp_issue_unit_io_iss_uops_0_bits_taken),
		.io_iss_uop_bits_imm_rename(_fp_issue_unit_io_iss_uops_0_bits_imm_rename),
		.io_iss_uop_bits_imm_sel(_fp_issue_unit_io_iss_uops_0_bits_imm_sel),
		.io_iss_uop_bits_pimm(_fp_issue_unit_io_iss_uops_0_bits_pimm),
		.io_iss_uop_bits_imm_packed(_fp_issue_unit_io_iss_uops_0_bits_imm_packed),
		.io_iss_uop_bits_op1_sel(_fp_issue_unit_io_iss_uops_0_bits_op1_sel),
		.io_iss_uop_bits_op2_sel(_fp_issue_unit_io_iss_uops_0_bits_op2_sel),
		.io_iss_uop_bits_fp_ctrl_ldst(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_ldst),
		.io_iss_uop_bits_fp_ctrl_wen(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_wen),
		.io_iss_uop_bits_fp_ctrl_ren1(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_ren1),
		.io_iss_uop_bits_fp_ctrl_ren2(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_ren2),
		.io_iss_uop_bits_fp_ctrl_ren3(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_ren3),
		.io_iss_uop_bits_fp_ctrl_swap12(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_swap12),
		.io_iss_uop_bits_fp_ctrl_swap23(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_swap23),
		.io_iss_uop_bits_fp_ctrl_typeTagIn(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_typeTagIn),
		.io_iss_uop_bits_fp_ctrl_typeTagOut(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_typeTagOut),
		.io_iss_uop_bits_fp_ctrl_fromint(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_fromint),
		.io_iss_uop_bits_fp_ctrl_toint(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_toint),
		.io_iss_uop_bits_fp_ctrl_fastpipe(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_fastpipe),
		.io_iss_uop_bits_fp_ctrl_fma(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_fma),
		.io_iss_uop_bits_fp_ctrl_div(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_div),
		.io_iss_uop_bits_fp_ctrl_sqrt(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_sqrt),
		.io_iss_uop_bits_fp_ctrl_wflags(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_wflags),
		.io_iss_uop_bits_fp_ctrl_vec(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_vec),
		.io_iss_uop_bits_rob_idx(_fp_issue_unit_io_iss_uops_0_bits_rob_idx),
		.io_iss_uop_bits_ldq_idx(_fp_issue_unit_io_iss_uops_0_bits_ldq_idx),
		.io_iss_uop_bits_stq_idx(_fp_issue_unit_io_iss_uops_0_bits_stq_idx),
		.io_iss_uop_bits_rxq_idx(_fp_issue_unit_io_iss_uops_0_bits_rxq_idx),
		.io_iss_uop_bits_pdst(_fp_issue_unit_io_iss_uops_0_bits_pdst),
		.io_iss_uop_bits_prs1(_fp_issue_unit_io_iss_uops_0_bits_prs1),
		.io_iss_uop_bits_prs2(_fp_issue_unit_io_iss_uops_0_bits_prs2),
		.io_iss_uop_bits_prs3(_fp_issue_unit_io_iss_uops_0_bits_prs3),
		.io_iss_uop_bits_ppred(_fp_issue_unit_io_iss_uops_0_bits_ppred),
		.io_iss_uop_bits_prs1_busy(_fp_issue_unit_io_iss_uops_0_bits_prs1_busy),
		.io_iss_uop_bits_prs2_busy(_fp_issue_unit_io_iss_uops_0_bits_prs2_busy),
		.io_iss_uop_bits_prs3_busy(_fp_issue_unit_io_iss_uops_0_bits_prs3_busy),
		.io_iss_uop_bits_ppred_busy(_fp_issue_unit_io_iss_uops_0_bits_ppred_busy),
		.io_iss_uop_bits_stale_pdst(_fp_issue_unit_io_iss_uops_0_bits_stale_pdst),
		.io_iss_uop_bits_exception(_fp_issue_unit_io_iss_uops_0_bits_exception),
		.io_iss_uop_bits_exc_cause(_fp_issue_unit_io_iss_uops_0_bits_exc_cause),
		.io_iss_uop_bits_mem_cmd(_fp_issue_unit_io_iss_uops_0_bits_mem_cmd),
		.io_iss_uop_bits_mem_size(_fp_issue_unit_io_iss_uops_0_bits_mem_size),
		.io_iss_uop_bits_mem_signed(_fp_issue_unit_io_iss_uops_0_bits_mem_signed),
		.io_iss_uop_bits_uses_ldq(_fp_issue_unit_io_iss_uops_0_bits_uses_ldq),
		.io_iss_uop_bits_uses_stq(_fp_issue_unit_io_iss_uops_0_bits_uses_stq),
		.io_iss_uop_bits_is_unique(_fp_issue_unit_io_iss_uops_0_bits_is_unique),
		.io_iss_uop_bits_flush_on_commit(_fp_issue_unit_io_iss_uops_0_bits_flush_on_commit),
		.io_iss_uop_bits_csr_cmd(_fp_issue_unit_io_iss_uops_0_bits_csr_cmd),
		.io_iss_uop_bits_ldst_is_rs1(_fp_issue_unit_io_iss_uops_0_bits_ldst_is_rs1),
		.io_iss_uop_bits_ldst(_fp_issue_unit_io_iss_uops_0_bits_ldst),
		.io_iss_uop_bits_lrs1(_fp_issue_unit_io_iss_uops_0_bits_lrs1),
		.io_iss_uop_bits_lrs2(_fp_issue_unit_io_iss_uops_0_bits_lrs2),
		.io_iss_uop_bits_lrs3(_fp_issue_unit_io_iss_uops_0_bits_lrs3),
		.io_iss_uop_bits_dst_rtype(_fp_issue_unit_io_iss_uops_0_bits_dst_rtype),
		.io_iss_uop_bits_lrs1_rtype(_fp_issue_unit_io_iss_uops_0_bits_lrs1_rtype),
		.io_iss_uop_bits_lrs2_rtype(_fp_issue_unit_io_iss_uops_0_bits_lrs2_rtype),
		.io_iss_uop_bits_frs3_en(_fp_issue_unit_io_iss_uops_0_bits_frs3_en),
		.io_iss_uop_bits_fcn_dw(_fp_issue_unit_io_iss_uops_0_bits_fcn_dw),
		.io_iss_uop_bits_fcn_op(_fp_issue_unit_io_iss_uops_0_bits_fcn_op),
		.io_iss_uop_bits_fp_val(_fp_issue_unit_io_iss_uops_0_bits_fp_val),
		.io_iss_uop_bits_fp_rm(_fp_issue_unit_io_iss_uops_0_bits_fp_rm),
		.io_iss_uop_bits_fp_typ(_fp_issue_unit_io_iss_uops_0_bits_fp_typ),
		.io_iss_uop_bits_xcpt_pf_if(_fp_issue_unit_io_iss_uops_0_bits_xcpt_pf_if),
		.io_iss_uop_bits_xcpt_ae_if(_fp_issue_unit_io_iss_uops_0_bits_xcpt_ae_if),
		.io_iss_uop_bits_xcpt_ma_if(_fp_issue_unit_io_iss_uops_0_bits_xcpt_ma_if),
		.io_iss_uop_bits_bp_debug_if(_fp_issue_unit_io_iss_uops_0_bits_bp_debug_if),
		.io_iss_uop_bits_bp_xcpt_if(_fp_issue_unit_io_iss_uops_0_bits_bp_xcpt_if),
		.io_iss_uop_bits_debug_fsrc(_fp_issue_unit_io_iss_uops_0_bits_debug_fsrc),
		.io_iss_uop_bits_debug_tsrc(_fp_issue_unit_io_iss_uops_0_bits_debug_tsrc),
		.io_arb_frf_reqs_0_valid(_fp_exe_unit_0_io_arb_frf_reqs_0_valid),
		.io_arb_frf_reqs_0_bits(_fp_exe_unit_0_io_arb_frf_reqs_0_bits),
		.io_arb_frf_reqs_1_valid(_fp_exe_unit_0_io_arb_frf_reqs_1_valid),
		.io_arb_frf_reqs_1_bits(_fp_exe_unit_0_io_arb_frf_reqs_1_bits),
		.io_arb_frf_reqs_2_ready(_fregfile_io_arb_read_reqs_2_ready),
		.io_arb_frf_reqs_2_valid(_fp_exe_unit_0_io_arb_frf_reqs_2_valid),
		.io_arb_frf_reqs_2_bits(_fp_exe_unit_0_io_arb_frf_reqs_2_bits),
		.io_rrd_frf_resps_0(_fregfile_io_rrd_read_resps_0),
		.io_rrd_frf_resps_1(_fregfile_io_rrd_read_resps_1),
		.io_rrd_frf_resps_2(_fregfile_io_rrd_read_resps_2),
		.io_rrd_frf_bypasses_0_valid(_fp_exe_unit_0_io_fpu_resp_valid & _fp_bypasses_0_valid_T),
		.io_rrd_frf_bypasses_0_bits_uop_pdst(_fp_exe_unit_0_io_fpu_resp_bits_uop_pdst),
		.io_rrd_frf_bypasses_0_bits_data(_fp_exe_unit_0_io_fpu_resp_bits_data),
		.io_squash_iss(_fp_exe_unit_0_io_squash_iss),
		.io_wakeup_valid(_fp_exe_unit_0_io_wakeup_valid),
		.io_wakeup_bits_uop_pdst(_fp_exe_unit_0_io_wakeup_bits_uop_pdst),
		.io_wakeup_bits_uop_dst_rtype(io_wakeups_0_bits_uop_dst_rtype),
		.io_fpu_resp_valid(_fp_exe_unit_0_io_fpu_resp_valid),
		.io_fpu_resp_bits_uop_rob_idx(io_wb_0_bits_uop_rob_idx),
		.io_fpu_resp_bits_uop_pdst(_fp_exe_unit_0_io_fpu_resp_bits_uop_pdst),
		.io_fpu_resp_bits_uop_dst_rtype(_fp_exe_unit_0_io_fpu_resp_bits_uop_dst_rtype),
		.io_fpu_resp_bits_data(_fp_exe_unit_0_io_fpu_resp_bits_data),
		.io_fpu_resp_bits_fflags_valid(io_wb_0_bits_fflags_valid),
		.io_fpu_resp_bits_fflags_bits(io_wb_0_bits_fflags_bits),
		.io_fdiv_resp_ready(_ll_wbarb_io_in_2_ready),
		.io_fdiv_resp_valid(_fp_exe_unit_0_io_fdiv_resp_valid),
		.io_fdiv_resp_bits_uop_rob_idx(_fp_exe_unit_0_io_fdiv_resp_bits_uop_rob_idx),
		.io_fdiv_resp_bits_uop_pdst(_fp_exe_unit_0_io_fdiv_resp_bits_uop_pdst),
		.io_fdiv_resp_bits_uop_dst_rtype(_fp_exe_unit_0_io_fdiv_resp_bits_uop_dst_rtype),
		.io_fdiv_resp_bits_data(_fp_exe_unit_0_io_fdiv_resp_bits_data),
		.io_fdiv_resp_bits_fflags_valid(_fp_exe_unit_0_io_fdiv_resp_bits_fflags_valid),
		.io_fdiv_resp_bits_fflags_bits(_fp_exe_unit_0_io_fdiv_resp_bits_fflags_bits),
		.io_fpiu_resp_ready(io_to_int_ready),
		.io_fpiu_resp_valid(io_to_int_valid),
		.io_fpiu_resp_bits_uop_br_mask(io_to_int_bits_uop_br_mask),
		.io_fpiu_resp_bits_uop_rob_idx(io_to_int_bits_uop_rob_idx),
		.io_fpiu_resp_bits_uop_pdst(io_to_int_bits_uop_pdst),
		.io_fpiu_resp_bits_uop_dst_rtype(io_to_int_bits_uop_dst_rtype),
		.io_fpiu_resp_bits_data(io_to_int_bits_data),
		.io_fpiu_resp_bits_predicated(io_to_int_bits_predicated),
		.io_fpiu_resp_bits_fflags_valid(io_to_int_bits_fflags_valid),
		.io_fpiu_resp_bits_fflags_bits(io_to_int_bits_fflags_bits),
		.io_dgen_valid(io_dgen_valid),
		.io_dgen_bits_uop_stq_idx(io_dgen_bits_uop_stq_idx),
		.io_dgen_bits_data(io_dgen_bits_data)
	);
	IssueUnitCollapsing fp_issue_unit(
		.clock(clock),
		.reset(reset),
		.io_dis_uops_0_ready(io_dis_uops_0_ready),
		.io_dis_uops_0_valid(io_dis_uops_0_valid),
		.io_dis_uops_0_bits_inst(io_dis_uops_0_bits_inst),
		.io_dis_uops_0_bits_debug_inst(io_dis_uops_0_bits_debug_inst),
		.io_dis_uops_0_bits_is_rvc(io_dis_uops_0_bits_is_rvc),
		.io_dis_uops_0_bits_debug_pc(io_dis_uops_0_bits_debug_pc),
		.io_dis_uops_0_bits_iq_type_0(io_dis_uops_0_bits_iq_type_0),
		.io_dis_uops_0_bits_iq_type_1(io_dis_uops_0_bits_iq_type_1),
		.io_dis_uops_0_bits_iq_type_2(io_dis_uops_0_bits_iq_type_2),
		.io_dis_uops_0_bits_iq_type_3(io_dis_uops_0_bits_iq_type_3),
		.io_dis_uops_0_bits_fu_code_0(io_dis_uops_0_bits_fu_code_0),
		.io_dis_uops_0_bits_fu_code_1(io_dis_uops_0_bits_fu_code_1),
		.io_dis_uops_0_bits_fu_code_2(io_dis_uops_0_bits_fu_code_2),
		.io_dis_uops_0_bits_fu_code_3(io_dis_uops_0_bits_fu_code_3),
		.io_dis_uops_0_bits_fu_code_4(io_dis_uops_0_bits_fu_code_4),
		.io_dis_uops_0_bits_fu_code_5(io_dis_uops_0_bits_fu_code_5),
		.io_dis_uops_0_bits_fu_code_6(io_dis_uops_0_bits_fu_code_6),
		.io_dis_uops_0_bits_fu_code_7(io_dis_uops_0_bits_fu_code_7),
		.io_dis_uops_0_bits_fu_code_8(io_dis_uops_0_bits_fu_code_8),
		.io_dis_uops_0_bits_fu_code_9(io_dis_uops_0_bits_fu_code_9),
		.io_dis_uops_0_bits_iw_p1_speculative_child(io_dis_uops_0_bits_iw_p1_speculative_child),
		.io_dis_uops_0_bits_iw_p2_speculative_child(io_dis_uops_0_bits_iw_p2_speculative_child),
		.io_dis_uops_0_bits_br_mask(io_dis_uops_0_bits_br_mask),
		.io_dis_uops_0_bits_br_tag(io_dis_uops_0_bits_br_tag),
		.io_dis_uops_0_bits_br_type(io_dis_uops_0_bits_br_type),
		.io_dis_uops_0_bits_is_sfb(io_dis_uops_0_bits_is_sfb),
		.io_dis_uops_0_bits_is_fence(io_dis_uops_0_bits_is_fence),
		.io_dis_uops_0_bits_is_fencei(io_dis_uops_0_bits_is_fencei),
		.io_dis_uops_0_bits_is_sfence(io_dis_uops_0_bits_is_sfence),
		.io_dis_uops_0_bits_is_amo(io_dis_uops_0_bits_is_amo),
		.io_dis_uops_0_bits_is_eret(io_dis_uops_0_bits_is_eret),
		.io_dis_uops_0_bits_is_sys_pc2epc(io_dis_uops_0_bits_is_sys_pc2epc),
		.io_dis_uops_0_bits_is_rocc(io_dis_uops_0_bits_is_rocc),
		.io_dis_uops_0_bits_is_mov(io_dis_uops_0_bits_is_mov),
		.io_dis_uops_0_bits_ftq_idx(io_dis_uops_0_bits_ftq_idx),
		.io_dis_uops_0_bits_edge_inst(io_dis_uops_0_bits_edge_inst),
		.io_dis_uops_0_bits_pc_lob(io_dis_uops_0_bits_pc_lob),
		.io_dis_uops_0_bits_taken(io_dis_uops_0_bits_taken),
		.io_dis_uops_0_bits_imm_rename(io_dis_uops_0_bits_imm_rename),
		.io_dis_uops_0_bits_imm_sel(io_dis_uops_0_bits_imm_sel),
		.io_dis_uops_0_bits_pimm(io_dis_uops_0_bits_pimm),
		.io_dis_uops_0_bits_imm_packed(io_dis_uops_0_bits_imm_packed),
		.io_dis_uops_0_bits_op1_sel(io_dis_uops_0_bits_op1_sel),
		.io_dis_uops_0_bits_op2_sel(io_dis_uops_0_bits_op2_sel),
		.io_dis_uops_0_bits_fp_ctrl_ldst(io_dis_uops_0_bits_fp_ctrl_ldst),
		.io_dis_uops_0_bits_fp_ctrl_wen(io_dis_uops_0_bits_fp_ctrl_wen),
		.io_dis_uops_0_bits_fp_ctrl_ren1(io_dis_uops_0_bits_fp_ctrl_ren1),
		.io_dis_uops_0_bits_fp_ctrl_ren2(io_dis_uops_0_bits_fp_ctrl_ren2),
		.io_dis_uops_0_bits_fp_ctrl_ren3(io_dis_uops_0_bits_fp_ctrl_ren3),
		.io_dis_uops_0_bits_fp_ctrl_swap12(io_dis_uops_0_bits_fp_ctrl_swap12),
		.io_dis_uops_0_bits_fp_ctrl_swap23(io_dis_uops_0_bits_fp_ctrl_swap23),
		.io_dis_uops_0_bits_fp_ctrl_typeTagIn(io_dis_uops_0_bits_fp_ctrl_typeTagIn),
		.io_dis_uops_0_bits_fp_ctrl_typeTagOut(io_dis_uops_0_bits_fp_ctrl_typeTagOut),
		.io_dis_uops_0_bits_fp_ctrl_fromint(io_dis_uops_0_bits_fp_ctrl_fromint),
		.io_dis_uops_0_bits_fp_ctrl_toint(io_dis_uops_0_bits_fp_ctrl_toint),
		.io_dis_uops_0_bits_fp_ctrl_fastpipe(io_dis_uops_0_bits_fp_ctrl_fastpipe),
		.io_dis_uops_0_bits_fp_ctrl_fma(io_dis_uops_0_bits_fp_ctrl_fma),
		.io_dis_uops_0_bits_fp_ctrl_div(io_dis_uops_0_bits_fp_ctrl_div),
		.io_dis_uops_0_bits_fp_ctrl_sqrt(io_dis_uops_0_bits_fp_ctrl_sqrt),
		.io_dis_uops_0_bits_fp_ctrl_wflags(io_dis_uops_0_bits_fp_ctrl_wflags),
		.io_dis_uops_0_bits_fp_ctrl_vec(io_dis_uops_0_bits_fp_ctrl_vec),
		.io_dis_uops_0_bits_rob_idx(io_dis_uops_0_bits_rob_idx),
		.io_dis_uops_0_bits_ldq_idx(io_dis_uops_0_bits_ldq_idx),
		.io_dis_uops_0_bits_stq_idx(io_dis_uops_0_bits_stq_idx),
		.io_dis_uops_0_bits_rxq_idx(io_dis_uops_0_bits_rxq_idx),
		.io_dis_uops_0_bits_pdst(io_dis_uops_0_bits_pdst),
		.io_dis_uops_0_bits_prs1(io_dis_uops_0_bits_prs1),
		.io_dis_uops_0_bits_prs2(io_dis_uops_0_bits_prs2),
		.io_dis_uops_0_bits_prs3(io_dis_uops_0_bits_prs3),
		.io_dis_uops_0_bits_ppred(io_dis_uops_0_bits_ppred),
		.io_dis_uops_0_bits_prs1_busy(io_dis_uops_0_bits_prs1_busy),
		.io_dis_uops_0_bits_prs2_busy(io_dis_uops_0_bits_prs2_busy),
		.io_dis_uops_0_bits_prs3_busy(io_dis_uops_0_bits_prs3_busy),
		.io_dis_uops_0_bits_ppred_busy(io_dis_uops_0_bits_ppred_busy),
		.io_dis_uops_0_bits_stale_pdst(io_dis_uops_0_bits_stale_pdst),
		.io_dis_uops_0_bits_exception(io_dis_uops_0_bits_exception),
		.io_dis_uops_0_bits_exc_cause(io_dis_uops_0_bits_exc_cause),
		.io_dis_uops_0_bits_mem_cmd(io_dis_uops_0_bits_mem_cmd),
		.io_dis_uops_0_bits_mem_size(io_dis_uops_0_bits_mem_size),
		.io_dis_uops_0_bits_mem_signed(io_dis_uops_0_bits_mem_signed),
		.io_dis_uops_0_bits_uses_ldq(io_dis_uops_0_bits_uses_ldq),
		.io_dis_uops_0_bits_uses_stq(io_dis_uops_0_bits_uses_stq),
		.io_dis_uops_0_bits_is_unique(io_dis_uops_0_bits_is_unique),
		.io_dis_uops_0_bits_flush_on_commit(io_dis_uops_0_bits_flush_on_commit),
		.io_dis_uops_0_bits_csr_cmd(io_dis_uops_0_bits_csr_cmd),
		.io_dis_uops_0_bits_ldst_is_rs1(io_dis_uops_0_bits_ldst_is_rs1),
		.io_dis_uops_0_bits_ldst(io_dis_uops_0_bits_ldst),
		.io_dis_uops_0_bits_lrs1(io_dis_uops_0_bits_lrs1),
		.io_dis_uops_0_bits_lrs2(io_dis_uops_0_bits_lrs2),
		.io_dis_uops_0_bits_lrs3(io_dis_uops_0_bits_lrs3),
		.io_dis_uops_0_bits_dst_rtype(io_dis_uops_0_bits_dst_rtype),
		.io_dis_uops_0_bits_lrs1_rtype(io_dis_uops_0_bits_lrs1_rtype),
		.io_dis_uops_0_bits_lrs2_rtype(io_dis_uops_0_bits_lrs2_rtype),
		.io_dis_uops_0_bits_frs3_en(io_dis_uops_0_bits_frs3_en),
		.io_dis_uops_0_bits_fcn_dw(io_dis_uops_0_bits_fcn_dw),
		.io_dis_uops_0_bits_fcn_op(io_dis_uops_0_bits_fcn_op),
		.io_dis_uops_0_bits_fp_val(io_dis_uops_0_bits_fp_val),
		.io_dis_uops_0_bits_fp_rm(io_dis_uops_0_bits_fp_rm),
		.io_dis_uops_0_bits_fp_typ(io_dis_uops_0_bits_fp_typ),
		.io_dis_uops_0_bits_xcpt_pf_if(io_dis_uops_0_bits_xcpt_pf_if),
		.io_dis_uops_0_bits_xcpt_ae_if(io_dis_uops_0_bits_xcpt_ae_if),
		.io_dis_uops_0_bits_xcpt_ma_if(io_dis_uops_0_bits_xcpt_ma_if),
		.io_dis_uops_0_bits_bp_debug_if(io_dis_uops_0_bits_bp_debug_if),
		.io_dis_uops_0_bits_bp_xcpt_if(io_dis_uops_0_bits_bp_xcpt_if),
		.io_dis_uops_0_bits_debug_fsrc(io_dis_uops_0_bits_debug_fsrc),
		.io_dis_uops_0_bits_debug_tsrc(io_dis_uops_0_bits_debug_tsrc),
		.io_iss_uops_0_valid(_fp_issue_unit_io_iss_uops_0_valid),
		.io_iss_uops_0_bits_inst(_fp_issue_unit_io_iss_uops_0_bits_inst),
		.io_iss_uops_0_bits_debug_inst(_fp_issue_unit_io_iss_uops_0_bits_debug_inst),
		.io_iss_uops_0_bits_is_rvc(_fp_issue_unit_io_iss_uops_0_bits_is_rvc),
		.io_iss_uops_0_bits_debug_pc(_fp_issue_unit_io_iss_uops_0_bits_debug_pc),
		.io_iss_uops_0_bits_iq_type_0(_fp_issue_unit_io_iss_uops_0_bits_iq_type_0),
		.io_iss_uops_0_bits_iq_type_1(_fp_issue_unit_io_iss_uops_0_bits_iq_type_1),
		.io_iss_uops_0_bits_iq_type_2(_fp_issue_unit_io_iss_uops_0_bits_iq_type_2),
		.io_iss_uops_0_bits_iq_type_3(_fp_issue_unit_io_iss_uops_0_bits_iq_type_3),
		.io_iss_uops_0_bits_fu_code_0(_fp_issue_unit_io_iss_uops_0_bits_fu_code_0),
		.io_iss_uops_0_bits_fu_code_1(_fp_issue_unit_io_iss_uops_0_bits_fu_code_1),
		.io_iss_uops_0_bits_fu_code_2(_fp_issue_unit_io_iss_uops_0_bits_fu_code_2),
		.io_iss_uops_0_bits_fu_code_3(_fp_issue_unit_io_iss_uops_0_bits_fu_code_3),
		.io_iss_uops_0_bits_fu_code_4(_fp_issue_unit_io_iss_uops_0_bits_fu_code_4),
		.io_iss_uops_0_bits_fu_code_5(_fp_issue_unit_io_iss_uops_0_bits_fu_code_5),
		.io_iss_uops_0_bits_fu_code_6(_fp_issue_unit_io_iss_uops_0_bits_fu_code_6),
		.io_iss_uops_0_bits_fu_code_7(_fp_issue_unit_io_iss_uops_0_bits_fu_code_7),
		.io_iss_uops_0_bits_fu_code_8(_fp_issue_unit_io_iss_uops_0_bits_fu_code_8),
		.io_iss_uops_0_bits_fu_code_9(_fp_issue_unit_io_iss_uops_0_bits_fu_code_9),
		.io_iss_uops_0_bits_iw_issued(_fp_issue_unit_io_iss_uops_0_bits_iw_issued),
		.io_iss_uops_0_bits_iw_p1_speculative_child(_fp_issue_unit_io_iss_uops_0_bits_iw_p1_speculative_child),
		.io_iss_uops_0_bits_iw_p2_speculative_child(_fp_issue_unit_io_iss_uops_0_bits_iw_p2_speculative_child),
		.io_iss_uops_0_bits_iw_p1_bypass_hint(_fp_issue_unit_io_iss_uops_0_bits_iw_p1_bypass_hint),
		.io_iss_uops_0_bits_iw_p2_bypass_hint(_fp_issue_unit_io_iss_uops_0_bits_iw_p2_bypass_hint),
		.io_iss_uops_0_bits_iw_p3_bypass_hint(_fp_issue_unit_io_iss_uops_0_bits_iw_p3_bypass_hint),
		.io_iss_uops_0_bits_dis_col_sel(_fp_issue_unit_io_iss_uops_0_bits_dis_col_sel),
		.io_iss_uops_0_bits_br_mask(_fp_issue_unit_io_iss_uops_0_bits_br_mask),
		.io_iss_uops_0_bits_br_tag(_fp_issue_unit_io_iss_uops_0_bits_br_tag),
		.io_iss_uops_0_bits_br_type(_fp_issue_unit_io_iss_uops_0_bits_br_type),
		.io_iss_uops_0_bits_is_sfb(_fp_issue_unit_io_iss_uops_0_bits_is_sfb),
		.io_iss_uops_0_bits_is_fence(_fp_issue_unit_io_iss_uops_0_bits_is_fence),
		.io_iss_uops_0_bits_is_fencei(_fp_issue_unit_io_iss_uops_0_bits_is_fencei),
		.io_iss_uops_0_bits_is_sfence(_fp_issue_unit_io_iss_uops_0_bits_is_sfence),
		.io_iss_uops_0_bits_is_amo(_fp_issue_unit_io_iss_uops_0_bits_is_amo),
		.io_iss_uops_0_bits_is_eret(_fp_issue_unit_io_iss_uops_0_bits_is_eret),
		.io_iss_uops_0_bits_is_sys_pc2epc(_fp_issue_unit_io_iss_uops_0_bits_is_sys_pc2epc),
		.io_iss_uops_0_bits_is_rocc(_fp_issue_unit_io_iss_uops_0_bits_is_rocc),
		.io_iss_uops_0_bits_is_mov(_fp_issue_unit_io_iss_uops_0_bits_is_mov),
		.io_iss_uops_0_bits_ftq_idx(_fp_issue_unit_io_iss_uops_0_bits_ftq_idx),
		.io_iss_uops_0_bits_edge_inst(_fp_issue_unit_io_iss_uops_0_bits_edge_inst),
		.io_iss_uops_0_bits_pc_lob(_fp_issue_unit_io_iss_uops_0_bits_pc_lob),
		.io_iss_uops_0_bits_taken(_fp_issue_unit_io_iss_uops_0_bits_taken),
		.io_iss_uops_0_bits_imm_rename(_fp_issue_unit_io_iss_uops_0_bits_imm_rename),
		.io_iss_uops_0_bits_imm_sel(_fp_issue_unit_io_iss_uops_0_bits_imm_sel),
		.io_iss_uops_0_bits_pimm(_fp_issue_unit_io_iss_uops_0_bits_pimm),
		.io_iss_uops_0_bits_imm_packed(_fp_issue_unit_io_iss_uops_0_bits_imm_packed),
		.io_iss_uops_0_bits_op1_sel(_fp_issue_unit_io_iss_uops_0_bits_op1_sel),
		.io_iss_uops_0_bits_op2_sel(_fp_issue_unit_io_iss_uops_0_bits_op2_sel),
		.io_iss_uops_0_bits_fp_ctrl_ldst(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_ldst),
		.io_iss_uops_0_bits_fp_ctrl_wen(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_wen),
		.io_iss_uops_0_bits_fp_ctrl_ren1(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_ren1),
		.io_iss_uops_0_bits_fp_ctrl_ren2(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_ren2),
		.io_iss_uops_0_bits_fp_ctrl_ren3(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_ren3),
		.io_iss_uops_0_bits_fp_ctrl_swap12(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_swap12),
		.io_iss_uops_0_bits_fp_ctrl_swap23(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_swap23),
		.io_iss_uops_0_bits_fp_ctrl_typeTagIn(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_typeTagIn),
		.io_iss_uops_0_bits_fp_ctrl_typeTagOut(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_typeTagOut),
		.io_iss_uops_0_bits_fp_ctrl_fromint(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_fromint),
		.io_iss_uops_0_bits_fp_ctrl_toint(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_toint),
		.io_iss_uops_0_bits_fp_ctrl_fastpipe(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_fastpipe),
		.io_iss_uops_0_bits_fp_ctrl_fma(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_fma),
		.io_iss_uops_0_bits_fp_ctrl_div(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_div),
		.io_iss_uops_0_bits_fp_ctrl_sqrt(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_sqrt),
		.io_iss_uops_0_bits_fp_ctrl_wflags(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_wflags),
		.io_iss_uops_0_bits_fp_ctrl_vec(_fp_issue_unit_io_iss_uops_0_bits_fp_ctrl_vec),
		.io_iss_uops_0_bits_rob_idx(_fp_issue_unit_io_iss_uops_0_bits_rob_idx),
		.io_iss_uops_0_bits_ldq_idx(_fp_issue_unit_io_iss_uops_0_bits_ldq_idx),
		.io_iss_uops_0_bits_stq_idx(_fp_issue_unit_io_iss_uops_0_bits_stq_idx),
		.io_iss_uops_0_bits_rxq_idx(_fp_issue_unit_io_iss_uops_0_bits_rxq_idx),
		.io_iss_uops_0_bits_pdst(_fp_issue_unit_io_iss_uops_0_bits_pdst),
		.io_iss_uops_0_bits_prs1(_fp_issue_unit_io_iss_uops_0_bits_prs1),
		.io_iss_uops_0_bits_prs2(_fp_issue_unit_io_iss_uops_0_bits_prs2),
		.io_iss_uops_0_bits_prs3(_fp_issue_unit_io_iss_uops_0_bits_prs3),
		.io_iss_uops_0_bits_ppred(_fp_issue_unit_io_iss_uops_0_bits_ppred),
		.io_iss_uops_0_bits_prs1_busy(_fp_issue_unit_io_iss_uops_0_bits_prs1_busy),
		.io_iss_uops_0_bits_prs2_busy(_fp_issue_unit_io_iss_uops_0_bits_prs2_busy),
		.io_iss_uops_0_bits_prs3_busy(_fp_issue_unit_io_iss_uops_0_bits_prs3_busy),
		.io_iss_uops_0_bits_ppred_busy(_fp_issue_unit_io_iss_uops_0_bits_ppred_busy),
		.io_iss_uops_0_bits_stale_pdst(_fp_issue_unit_io_iss_uops_0_bits_stale_pdst),
		.io_iss_uops_0_bits_exception(_fp_issue_unit_io_iss_uops_0_bits_exception),
		.io_iss_uops_0_bits_exc_cause(_fp_issue_unit_io_iss_uops_0_bits_exc_cause),
		.io_iss_uops_0_bits_mem_cmd(_fp_issue_unit_io_iss_uops_0_bits_mem_cmd),
		.io_iss_uops_0_bits_mem_size(_fp_issue_unit_io_iss_uops_0_bits_mem_size),
		.io_iss_uops_0_bits_mem_signed(_fp_issue_unit_io_iss_uops_0_bits_mem_signed),
		.io_iss_uops_0_bits_uses_ldq(_fp_issue_unit_io_iss_uops_0_bits_uses_ldq),
		.io_iss_uops_0_bits_uses_stq(_fp_issue_unit_io_iss_uops_0_bits_uses_stq),
		.io_iss_uops_0_bits_is_unique(_fp_issue_unit_io_iss_uops_0_bits_is_unique),
		.io_iss_uops_0_bits_flush_on_commit(_fp_issue_unit_io_iss_uops_0_bits_flush_on_commit),
		.io_iss_uops_0_bits_csr_cmd(_fp_issue_unit_io_iss_uops_0_bits_csr_cmd),
		.io_iss_uops_0_bits_ldst_is_rs1(_fp_issue_unit_io_iss_uops_0_bits_ldst_is_rs1),
		.io_iss_uops_0_bits_ldst(_fp_issue_unit_io_iss_uops_0_bits_ldst),
		.io_iss_uops_0_bits_lrs1(_fp_issue_unit_io_iss_uops_0_bits_lrs1),
		.io_iss_uops_0_bits_lrs2(_fp_issue_unit_io_iss_uops_0_bits_lrs2),
		.io_iss_uops_0_bits_lrs3(_fp_issue_unit_io_iss_uops_0_bits_lrs3),
		.io_iss_uops_0_bits_dst_rtype(_fp_issue_unit_io_iss_uops_0_bits_dst_rtype),
		.io_iss_uops_0_bits_lrs1_rtype(_fp_issue_unit_io_iss_uops_0_bits_lrs1_rtype),
		.io_iss_uops_0_bits_lrs2_rtype(_fp_issue_unit_io_iss_uops_0_bits_lrs2_rtype),
		.io_iss_uops_0_bits_frs3_en(_fp_issue_unit_io_iss_uops_0_bits_frs3_en),
		.io_iss_uops_0_bits_fcn_dw(_fp_issue_unit_io_iss_uops_0_bits_fcn_dw),
		.io_iss_uops_0_bits_fcn_op(_fp_issue_unit_io_iss_uops_0_bits_fcn_op),
		.io_iss_uops_0_bits_fp_val(_fp_issue_unit_io_iss_uops_0_bits_fp_val),
		.io_iss_uops_0_bits_fp_rm(_fp_issue_unit_io_iss_uops_0_bits_fp_rm),
		.io_iss_uops_0_bits_fp_typ(_fp_issue_unit_io_iss_uops_0_bits_fp_typ),
		.io_iss_uops_0_bits_xcpt_pf_if(_fp_issue_unit_io_iss_uops_0_bits_xcpt_pf_if),
		.io_iss_uops_0_bits_xcpt_ae_if(_fp_issue_unit_io_iss_uops_0_bits_xcpt_ae_if),
		.io_iss_uops_0_bits_xcpt_ma_if(_fp_issue_unit_io_iss_uops_0_bits_xcpt_ma_if),
		.io_iss_uops_0_bits_bp_debug_if(_fp_issue_unit_io_iss_uops_0_bits_bp_debug_if),
		.io_iss_uops_0_bits_bp_xcpt_if(_fp_issue_unit_io_iss_uops_0_bits_bp_xcpt_if),
		.io_iss_uops_0_bits_debug_fsrc(_fp_issue_unit_io_iss_uops_0_bits_debug_fsrc),
		.io_iss_uops_0_bits_debug_tsrc(_fp_issue_unit_io_iss_uops_0_bits_debug_tsrc),
		.io_wakeup_ports_0_valid(_fp_exe_unit_0_io_wakeup_valid),
		.io_wakeup_ports_0_bits_uop_pdst(_fp_exe_unit_0_io_wakeup_bits_uop_pdst),
		.io_wakeup_ports_1_valid(_ll_wbarb_io_out_valid),
		.io_wakeup_ports_1_bits_uop_pdst(_ll_wbarb_io_out_bits_uop_pdst),
		.io_fu_types_0_7(_fp_exe_unit_0_io_ready_fu_types_7),
		.io_fu_types_0_9(_fp_exe_unit_0_io_ready_fu_types_9),
		.io_brupdate_b1_resolve_mask(io_brupdate_b1_resolve_mask),
		.io_brupdate_b1_mispredict_mask(io_brupdate_b1_mispredict_mask),
		.io_flush_pipeline(io_flush_pipeline),
		.io_squash_grant(_fp_exe_unit_0_io_squash_iss)
	);
	BankedRF fregfile(
		.clock(clock),
		.reset(reset),
		.io_arb_read_reqs_0_valid(_fp_exe_unit_0_io_arb_frf_reqs_0_valid),
		.io_arb_read_reqs_0_bits(_fp_exe_unit_0_io_arb_frf_reqs_0_bits),
		.io_arb_read_reqs_1_valid(_fp_exe_unit_0_io_arb_frf_reqs_1_valid),
		.io_arb_read_reqs_1_bits(_fp_exe_unit_0_io_arb_frf_reqs_1_bits),
		.io_arb_read_reqs_2_ready(_fregfile_io_arb_read_reqs_2_ready),
		.io_arb_read_reqs_2_valid(_fp_exe_unit_0_io_arb_frf_reqs_2_valid),
		.io_arb_read_reqs_2_bits(_fp_exe_unit_0_io_arb_frf_reqs_2_bits),
		.io_rrd_read_resps_0(_fregfile_io_rrd_read_resps_0),
		.io_rrd_read_resps_1(_fregfile_io_rrd_read_resps_1),
		.io_rrd_read_resps_2(_fregfile_io_rrd_read_resps_2),
		.io_write_ports_0_valid(_ll_wbarb_io_out_valid & (_ll_wbarb_io_out_bits_uop_dst_rtype == 2'h1)),
		.io_write_ports_0_bits_addr(_ll_wbarb_io_out_bits_uop_pdst),
		.io_write_ports_0_bits_data(_ll_wbarb_io_out_bits_data),
		.io_write_ports_1_valid(_fp_exe_unit_0_io_fpu_resp_valid & _fp_bypasses_0_valid_T),
		.io_write_ports_1_bits_addr(_fp_exe_unit_0_io_fpu_resp_bits_uop_pdst),
		.io_write_ports_1_bits_data(_fp_exe_unit_0_io_fpu_resp_bits_data)
	);
	Arbiter3_ExeUnitResp ll_wbarb(
		.io_in_0_valid(ll_wbarb_io_in_0_valid_REG),
		.io_in_0_bits_uop_rob_idx(ll_wbarb_io_in_0_bits_REG_uop_rob_idx),
		.io_in_0_bits_uop_pdst(ll_wbarb_io_in_0_bits_REG_uop_pdst),
		.io_in_0_bits_uop_dst_rtype(ll_wbarb_io_in_0_bits_REG_uop_dst_rtype),
		.io_in_0_bits_data({_ll_wbarb_io_in_0_bits_data_T_3[63], _ll_wbarb_io_in_0_bits_data_T_5[2:1], _GEN, (&{_ll_wbarb_io_in_0_bits_data_T_5[2:1], _GEN} ? {&_ll_wbarb_io_in_0_bits_data_rawIn_out_sig_T_2[51:32], _ll_wbarb_io_in_0_bits_data_rawIn_adjustedExp_T_4[7:1], _ll_wbarb_io_in_0_bits_data_T_14[2], _ll_wbarb_io_in_0_bits_data_rawIn_out_sig_T_2[51:32], _ll_wbarb_io_in_0_bits_data_T_3[31], _ll_wbarb_io_in_0_bits_data_T_14[1], _ll_wbarb_io_in_0_bits_data_T_14[0] | (&_ll_wbarb_io_in_0_bits_data_rawIn_adjustedExp_T_9[8:7] & |_ll_wbarb_io_in_0_bits_data_T_3[22:0]), _ll_wbarb_io_in_0_bits_data_rawIn_adjustedExp_T_9[5:0], (ll_wbarb_io_in_0_bits_data_rawIn_isZeroExpIn_1 ? {_ll_wbarb_io_in_0_bits_data_rawIn_subnormFract_T_2[21:0], 1'h0} : _ll_wbarb_io_in_0_bits_data_T_3[22:0])} : {_ll_wbarb_io_in_0_bits_data_rawIn_adjustedExp_T_4[8:0], _ll_wbarb_io_in_0_bits_data_rawIn_out_sig_T_2})}),
		.io_in_1_ready(io_from_int_ready),
		.io_in_1_valid(io_from_int_valid),
		.io_in_1_bits_uop_rob_idx(io_from_int_bits_uop_rob_idx),
		.io_in_1_bits_uop_pdst(io_from_int_bits_uop_pdst),
		.io_in_1_bits_uop_dst_rtype(io_from_int_bits_uop_dst_rtype),
		.io_in_1_bits_data(io_from_int_bits_data),
		.io_in_1_bits_predicated(io_from_int_bits_predicated),
		.io_in_1_bits_fflags_valid(io_from_int_bits_fflags_valid),
		.io_in_1_bits_fflags_bits(io_from_int_bits_fflags_bits),
		.io_in_2_ready(_ll_wbarb_io_in_2_ready),
		.io_in_2_valid(_fp_exe_unit_0_io_fdiv_resp_valid),
		.io_in_2_bits_uop_rob_idx(_fp_exe_unit_0_io_fdiv_resp_bits_uop_rob_idx),
		.io_in_2_bits_uop_pdst(_fp_exe_unit_0_io_fdiv_resp_bits_uop_pdst),
		.io_in_2_bits_uop_dst_rtype(_fp_exe_unit_0_io_fdiv_resp_bits_uop_dst_rtype),
		.io_in_2_bits_data(_fp_exe_unit_0_io_fdiv_resp_bits_data),
		.io_in_2_bits_fflags_valid(_fp_exe_unit_0_io_fdiv_resp_bits_fflags_valid),
		.io_in_2_bits_fflags_bits(_fp_exe_unit_0_io_fdiv_resp_bits_fflags_bits),
		.io_out_valid(_ll_wbarb_io_out_valid),
		.io_out_bits_uop_rob_idx(io_wb_1_bits_uop_rob_idx),
		.io_out_bits_uop_pdst(_ll_wbarb_io_out_bits_uop_pdst),
		.io_out_bits_uop_dst_rtype(_ll_wbarb_io_out_bits_uop_dst_rtype),
		.io_out_bits_data(_ll_wbarb_io_out_bits_data),
		.io_out_bits_predicated(io_wb_1_bits_predicated),
		.io_out_bits_fflags_valid(io_wb_1_bits_fflags_valid),
		.io_out_bits_fflags_bits(io_wb_1_bits_fflags_bits)
	);
	assign io_wakeups_0_valid = _fp_exe_unit_0_io_wakeup_valid;
	assign io_wakeups_0_bits_uop_pdst = _fp_exe_unit_0_io_wakeup_bits_uop_pdst;
	assign io_wakeups_1_valid = _ll_wbarb_io_out_valid;
	assign io_wakeups_1_bits_uop_pdst = _ll_wbarb_io_out_bits_uop_pdst;
	assign io_wakeups_1_bits_uop_dst_rtype = _ll_wbarb_io_out_bits_uop_dst_rtype;
	assign io_wb_0_valid = _fp_exe_unit_0_io_fpu_resp_valid;
	assign io_wb_0_bits_uop_pdst = _fp_exe_unit_0_io_fpu_resp_bits_uop_pdst;
	assign io_wb_1_valid = _ll_wbarb_io_out_valid;
	assign io_wb_1_bits_uop_pdst = _ll_wbarb_io_out_bits_uop_pdst;
endmodule
