module FPExeUnit (
	clock,
	reset,
	io_kill,
	io_brupdate_b1_resolve_mask,
	io_brupdate_b1_mispredict_mask,
	io_ready_fu_types_7,
	io_ready_fu_types_9,
	io_iss_uop_valid,
	io_iss_uop_bits_inst,
	io_iss_uop_bits_debug_inst,
	io_iss_uop_bits_is_rvc,
	io_iss_uop_bits_debug_pc,
	io_iss_uop_bits_iq_type_0,
	io_iss_uop_bits_iq_type_1,
	io_iss_uop_bits_iq_type_2,
	io_iss_uop_bits_iq_type_3,
	io_iss_uop_bits_fu_code_0,
	io_iss_uop_bits_fu_code_1,
	io_iss_uop_bits_fu_code_2,
	io_iss_uop_bits_fu_code_3,
	io_iss_uop_bits_fu_code_4,
	io_iss_uop_bits_fu_code_5,
	io_iss_uop_bits_fu_code_6,
	io_iss_uop_bits_fu_code_7,
	io_iss_uop_bits_fu_code_8,
	io_iss_uop_bits_fu_code_9,
	io_iss_uop_bits_iw_issued,
	io_iss_uop_bits_iw_p1_speculative_child,
	io_iss_uop_bits_iw_p2_speculative_child,
	io_iss_uop_bits_iw_p1_bypass_hint,
	io_iss_uop_bits_iw_p2_bypass_hint,
	io_iss_uop_bits_iw_p3_bypass_hint,
	io_iss_uop_bits_dis_col_sel,
	io_iss_uop_bits_br_mask,
	io_iss_uop_bits_br_tag,
	io_iss_uop_bits_br_type,
	io_iss_uop_bits_is_sfb,
	io_iss_uop_bits_is_fence,
	io_iss_uop_bits_is_fencei,
	io_iss_uop_bits_is_sfence,
	io_iss_uop_bits_is_amo,
	io_iss_uop_bits_is_eret,
	io_iss_uop_bits_is_sys_pc2epc,
	io_iss_uop_bits_is_rocc,
	io_iss_uop_bits_is_mov,
	io_iss_uop_bits_ftq_idx,
	io_iss_uop_bits_edge_inst,
	io_iss_uop_bits_pc_lob,
	io_iss_uop_bits_taken,
	io_iss_uop_bits_imm_rename,
	io_iss_uop_bits_imm_sel,
	io_iss_uop_bits_pimm,
	io_iss_uop_bits_imm_packed,
	io_iss_uop_bits_op1_sel,
	io_iss_uop_bits_op2_sel,
	io_iss_uop_bits_fp_ctrl_ldst,
	io_iss_uop_bits_fp_ctrl_wen,
	io_iss_uop_bits_fp_ctrl_ren1,
	io_iss_uop_bits_fp_ctrl_ren2,
	io_iss_uop_bits_fp_ctrl_ren3,
	io_iss_uop_bits_fp_ctrl_swap12,
	io_iss_uop_bits_fp_ctrl_swap23,
	io_iss_uop_bits_fp_ctrl_typeTagIn,
	io_iss_uop_bits_fp_ctrl_typeTagOut,
	io_iss_uop_bits_fp_ctrl_fromint,
	io_iss_uop_bits_fp_ctrl_toint,
	io_iss_uop_bits_fp_ctrl_fastpipe,
	io_iss_uop_bits_fp_ctrl_fma,
	io_iss_uop_bits_fp_ctrl_div,
	io_iss_uop_bits_fp_ctrl_sqrt,
	io_iss_uop_bits_fp_ctrl_wflags,
	io_iss_uop_bits_fp_ctrl_vec,
	io_iss_uop_bits_rob_idx,
	io_iss_uop_bits_ldq_idx,
	io_iss_uop_bits_stq_idx,
	io_iss_uop_bits_rxq_idx,
	io_iss_uop_bits_pdst,
	io_iss_uop_bits_prs1,
	io_iss_uop_bits_prs2,
	io_iss_uop_bits_prs3,
	io_iss_uop_bits_ppred,
	io_iss_uop_bits_prs1_busy,
	io_iss_uop_bits_prs2_busy,
	io_iss_uop_bits_prs3_busy,
	io_iss_uop_bits_ppred_busy,
	io_iss_uop_bits_stale_pdst,
	io_iss_uop_bits_exception,
	io_iss_uop_bits_exc_cause,
	io_iss_uop_bits_mem_cmd,
	io_iss_uop_bits_mem_size,
	io_iss_uop_bits_mem_signed,
	io_iss_uop_bits_uses_ldq,
	io_iss_uop_bits_uses_stq,
	io_iss_uop_bits_is_unique,
	io_iss_uop_bits_flush_on_commit,
	io_iss_uop_bits_csr_cmd,
	io_iss_uop_bits_ldst_is_rs1,
	io_iss_uop_bits_ldst,
	io_iss_uop_bits_lrs1,
	io_iss_uop_bits_lrs2,
	io_iss_uop_bits_lrs3,
	io_iss_uop_bits_dst_rtype,
	io_iss_uop_bits_lrs1_rtype,
	io_iss_uop_bits_lrs2_rtype,
	io_iss_uop_bits_frs3_en,
	io_iss_uop_bits_fcn_dw,
	io_iss_uop_bits_fcn_op,
	io_iss_uop_bits_fp_val,
	io_iss_uop_bits_fp_rm,
	io_iss_uop_bits_fp_typ,
	io_iss_uop_bits_xcpt_pf_if,
	io_iss_uop_bits_xcpt_ae_if,
	io_iss_uop_bits_xcpt_ma_if,
	io_iss_uop_bits_bp_debug_if,
	io_iss_uop_bits_bp_xcpt_if,
	io_iss_uop_bits_debug_fsrc,
	io_iss_uop_bits_debug_tsrc,
	io_arb_frf_reqs_0_valid,
	io_arb_frf_reqs_0_bits,
	io_arb_frf_reqs_1_valid,
	io_arb_frf_reqs_1_bits,
	io_arb_frf_reqs_2_ready,
	io_arb_frf_reqs_2_valid,
	io_arb_frf_reqs_2_bits,
	io_rrd_frf_resps_0,
	io_rrd_frf_resps_1,
	io_rrd_frf_resps_2,
	io_rrd_frf_bypasses_0_valid,
	io_rrd_frf_bypasses_0_bits_uop_pdst,
	io_rrd_frf_bypasses_0_bits_data,
	io_squash_iss,
	io_wakeup_valid,
	io_wakeup_bits_uop_pdst,
	io_wakeup_bits_uop_dst_rtype,
	io_fpu_resp_valid,
	io_fpu_resp_bits_uop_rob_idx,
	io_fpu_resp_bits_uop_pdst,
	io_fpu_resp_bits_uop_dst_rtype,
	io_fpu_resp_bits_data,
	io_fpu_resp_bits_fflags_valid,
	io_fpu_resp_bits_fflags_bits,
	io_fdiv_resp_ready,
	io_fdiv_resp_valid,
	io_fdiv_resp_bits_uop_rob_idx,
	io_fdiv_resp_bits_uop_pdst,
	io_fdiv_resp_bits_uop_dst_rtype,
	io_fdiv_resp_bits_data,
	io_fdiv_resp_bits_fflags_valid,
	io_fdiv_resp_bits_fflags_bits,
	io_fpiu_resp_ready,
	io_fpiu_resp_valid,
	io_fpiu_resp_bits_uop_br_mask,
	io_fpiu_resp_bits_uop_rob_idx,
	io_fpiu_resp_bits_uop_pdst,
	io_fpiu_resp_bits_uop_dst_rtype,
	io_fpiu_resp_bits_data,
	io_fpiu_resp_bits_predicated,
	io_fpiu_resp_bits_fflags_valid,
	io_fpiu_resp_bits_fflags_bits,
	io_dgen_valid,
	io_dgen_bits_uop_stq_idx,
	io_dgen_bits_data
);
	input clock;
	input reset;
	input io_kill;
	input [7:0] io_brupdate_b1_resolve_mask;
	input [7:0] io_brupdate_b1_mispredict_mask;
	output wire io_ready_fu_types_7;
	output wire io_ready_fu_types_9;
	input io_iss_uop_valid;
	input [31:0] io_iss_uop_bits_inst;
	input [31:0] io_iss_uop_bits_debug_inst;
	input io_iss_uop_bits_is_rvc;
	input [39:0] io_iss_uop_bits_debug_pc;
	input io_iss_uop_bits_iq_type_0;
	input io_iss_uop_bits_iq_type_1;
	input io_iss_uop_bits_iq_type_2;
	input io_iss_uop_bits_iq_type_3;
	input io_iss_uop_bits_fu_code_0;
	input io_iss_uop_bits_fu_code_1;
	input io_iss_uop_bits_fu_code_2;
	input io_iss_uop_bits_fu_code_3;
	input io_iss_uop_bits_fu_code_4;
	input io_iss_uop_bits_fu_code_5;
	input io_iss_uop_bits_fu_code_6;
	input io_iss_uop_bits_fu_code_7;
	input io_iss_uop_bits_fu_code_8;
	input io_iss_uop_bits_fu_code_9;
	input io_iss_uop_bits_iw_issued;
	input io_iss_uop_bits_iw_p1_speculative_child;
	input io_iss_uop_bits_iw_p2_speculative_child;
	input io_iss_uop_bits_iw_p1_bypass_hint;
	input io_iss_uop_bits_iw_p2_bypass_hint;
	input io_iss_uop_bits_iw_p3_bypass_hint;
	input io_iss_uop_bits_dis_col_sel;
	input [7:0] io_iss_uop_bits_br_mask;
	input [2:0] io_iss_uop_bits_br_tag;
	input [3:0] io_iss_uop_bits_br_type;
	input io_iss_uop_bits_is_sfb;
	input io_iss_uop_bits_is_fence;
	input io_iss_uop_bits_is_fencei;
	input io_iss_uop_bits_is_sfence;
	input io_iss_uop_bits_is_amo;
	input io_iss_uop_bits_is_eret;
	input io_iss_uop_bits_is_sys_pc2epc;
	input io_iss_uop_bits_is_rocc;
	input io_iss_uop_bits_is_mov;
	input [3:0] io_iss_uop_bits_ftq_idx;
	input io_iss_uop_bits_edge_inst;
	input [5:0] io_iss_uop_bits_pc_lob;
	input io_iss_uop_bits_taken;
	input io_iss_uop_bits_imm_rename;
	input [2:0] io_iss_uop_bits_imm_sel;
	input [4:0] io_iss_uop_bits_pimm;
	input [19:0] io_iss_uop_bits_imm_packed;
	input [1:0] io_iss_uop_bits_op1_sel;
	input [2:0] io_iss_uop_bits_op2_sel;
	input io_iss_uop_bits_fp_ctrl_ldst;
	input io_iss_uop_bits_fp_ctrl_wen;
	input io_iss_uop_bits_fp_ctrl_ren1;
	input io_iss_uop_bits_fp_ctrl_ren2;
	input io_iss_uop_bits_fp_ctrl_ren3;
	input io_iss_uop_bits_fp_ctrl_swap12;
	input io_iss_uop_bits_fp_ctrl_swap23;
	input [1:0] io_iss_uop_bits_fp_ctrl_typeTagIn;
	input [1:0] io_iss_uop_bits_fp_ctrl_typeTagOut;
	input io_iss_uop_bits_fp_ctrl_fromint;
	input io_iss_uop_bits_fp_ctrl_toint;
	input io_iss_uop_bits_fp_ctrl_fastpipe;
	input io_iss_uop_bits_fp_ctrl_fma;
	input io_iss_uop_bits_fp_ctrl_div;
	input io_iss_uop_bits_fp_ctrl_sqrt;
	input io_iss_uop_bits_fp_ctrl_wflags;
	input io_iss_uop_bits_fp_ctrl_vec;
	input [4:0] io_iss_uop_bits_rob_idx;
	input [3:0] io_iss_uop_bits_ldq_idx;
	input [3:0] io_iss_uop_bits_stq_idx;
	input [1:0] io_iss_uop_bits_rxq_idx;
	input [5:0] io_iss_uop_bits_pdst;
	input [5:0] io_iss_uop_bits_prs1;
	input [5:0] io_iss_uop_bits_prs2;
	input [5:0] io_iss_uop_bits_prs3;
	input [3:0] io_iss_uop_bits_ppred;
	input io_iss_uop_bits_prs1_busy;
	input io_iss_uop_bits_prs2_busy;
	input io_iss_uop_bits_prs3_busy;
	input io_iss_uop_bits_ppred_busy;
	input [5:0] io_iss_uop_bits_stale_pdst;
	input io_iss_uop_bits_exception;
	input [63:0] io_iss_uop_bits_exc_cause;
	input [4:0] io_iss_uop_bits_mem_cmd;
	input [1:0] io_iss_uop_bits_mem_size;
	input io_iss_uop_bits_mem_signed;
	input io_iss_uop_bits_uses_ldq;
	input io_iss_uop_bits_uses_stq;
	input io_iss_uop_bits_is_unique;
	input io_iss_uop_bits_flush_on_commit;
	input [2:0] io_iss_uop_bits_csr_cmd;
	input io_iss_uop_bits_ldst_is_rs1;
	input [5:0] io_iss_uop_bits_ldst;
	input [5:0] io_iss_uop_bits_lrs1;
	input [5:0] io_iss_uop_bits_lrs2;
	input [5:0] io_iss_uop_bits_lrs3;
	input [1:0] io_iss_uop_bits_dst_rtype;
	input [1:0] io_iss_uop_bits_lrs1_rtype;
	input [1:0] io_iss_uop_bits_lrs2_rtype;
	input io_iss_uop_bits_frs3_en;
	input io_iss_uop_bits_fcn_dw;
	input [4:0] io_iss_uop_bits_fcn_op;
	input io_iss_uop_bits_fp_val;
	input [2:0] io_iss_uop_bits_fp_rm;
	input [1:0] io_iss_uop_bits_fp_typ;
	input io_iss_uop_bits_xcpt_pf_if;
	input io_iss_uop_bits_xcpt_ae_if;
	input io_iss_uop_bits_xcpt_ma_if;
	input io_iss_uop_bits_bp_debug_if;
	input io_iss_uop_bits_bp_xcpt_if;
	input [2:0] io_iss_uop_bits_debug_fsrc;
	input [2:0] io_iss_uop_bits_debug_tsrc;
	output wire io_arb_frf_reqs_0_valid;
	output wire [5:0] io_arb_frf_reqs_0_bits;
	output wire io_arb_frf_reqs_1_valid;
	output wire [5:0] io_arb_frf_reqs_1_bits;
	input io_arb_frf_reqs_2_ready;
	output wire io_arb_frf_reqs_2_valid;
	output wire [5:0] io_arb_frf_reqs_2_bits;
	input [64:0] io_rrd_frf_resps_0;
	input [64:0] io_rrd_frf_resps_1;
	input [64:0] io_rrd_frf_resps_2;
	input io_rrd_frf_bypasses_0_valid;
	input [5:0] io_rrd_frf_bypasses_0_bits_uop_pdst;
	input [64:0] io_rrd_frf_bypasses_0_bits_data;
	output wire io_squash_iss;
	output wire io_wakeup_valid;
	output wire [5:0] io_wakeup_bits_uop_pdst;
	output wire [1:0] io_wakeup_bits_uop_dst_rtype;
	output wire io_fpu_resp_valid;
	output wire [4:0] io_fpu_resp_bits_uop_rob_idx;
	output wire [5:0] io_fpu_resp_bits_uop_pdst;
	output wire [1:0] io_fpu_resp_bits_uop_dst_rtype;
	output wire [64:0] io_fpu_resp_bits_data;
	output wire io_fpu_resp_bits_fflags_valid;
	output wire [4:0] io_fpu_resp_bits_fflags_bits;
	input io_fdiv_resp_ready;
	output wire io_fdiv_resp_valid;
	output wire [4:0] io_fdiv_resp_bits_uop_rob_idx;
	output wire [5:0] io_fdiv_resp_bits_uop_pdst;
	output wire [1:0] io_fdiv_resp_bits_uop_dst_rtype;
	output wire [64:0] io_fdiv_resp_bits_data;
	output wire io_fdiv_resp_bits_fflags_valid;
	output wire [4:0] io_fdiv_resp_bits_fflags_bits;
	input io_fpiu_resp_ready;
	output wire io_fpiu_resp_valid;
	output wire [7:0] io_fpiu_resp_bits_uop_br_mask;
	output wire [4:0] io_fpiu_resp_bits_uop_rob_idx;
	output wire [5:0] io_fpiu_resp_bits_uop_pdst;
	output wire [1:0] io_fpiu_resp_bits_uop_dst_rtype;
	output wire [63:0] io_fpiu_resp_bits_data;
	output wire io_fpiu_resp_bits_predicated;
	output wire io_fpiu_resp_bits_fflags_valid;
	output wire [4:0] io_fpiu_resp_bits_fflags_bits;
	output wire io_dgen_valid;
	output wire [3:0] io_dgen_bits_uop_stq_idx;
	output wire [63:0] io_dgen_bits_data;
	wire _queue_io_enq_ready;
	wire [64:0] _queue_io_deq_bits_data;
	wire [3:0] _queue_io_count;
	wire _io_fdiv_resp_fdivsqrt_io_req_ready;
	wire _fpu_io_resp_valid;
	wire [31:0] _fpu_io_resp_bits_uop_inst;
	wire [31:0] _fpu_io_resp_bits_uop_debug_inst;
	wire _fpu_io_resp_bits_uop_is_rvc;
	wire [39:0] _fpu_io_resp_bits_uop_debug_pc;
	wire _fpu_io_resp_bits_uop_iq_type_0;
	wire _fpu_io_resp_bits_uop_iq_type_1;
	wire _fpu_io_resp_bits_uop_iq_type_2;
	wire _fpu_io_resp_bits_uop_iq_type_3;
	wire _fpu_io_resp_bits_uop_fu_code_0;
	wire _fpu_io_resp_bits_uop_fu_code_1;
	wire _fpu_io_resp_bits_uop_fu_code_2;
	wire _fpu_io_resp_bits_uop_fu_code_3;
	wire _fpu_io_resp_bits_uop_fu_code_4;
	wire _fpu_io_resp_bits_uop_fu_code_5;
	wire _fpu_io_resp_bits_uop_fu_code_6;
	wire _fpu_io_resp_bits_uop_fu_code_7;
	wire _fpu_io_resp_bits_uop_fu_code_8;
	wire _fpu_io_resp_bits_uop_fu_code_9;
	wire _fpu_io_resp_bits_uop_iw_issued;
	wire _fpu_io_resp_bits_uop_iw_issued_partial_agen;
	wire _fpu_io_resp_bits_uop_iw_issued_partial_dgen;
	wire _fpu_io_resp_bits_uop_iw_p1_speculative_child;
	wire _fpu_io_resp_bits_uop_iw_p2_speculative_child;
	wire _fpu_io_resp_bits_uop_iw_p1_bypass_hint;
	wire _fpu_io_resp_bits_uop_iw_p2_bypass_hint;
	wire _fpu_io_resp_bits_uop_iw_p3_bypass_hint;
	wire _fpu_io_resp_bits_uop_dis_col_sel;
	wire [7:0] _fpu_io_resp_bits_uop_br_mask;
	wire [2:0] _fpu_io_resp_bits_uop_br_tag;
	wire [3:0] _fpu_io_resp_bits_uop_br_type;
	wire _fpu_io_resp_bits_uop_is_sfb;
	wire _fpu_io_resp_bits_uop_is_fence;
	wire _fpu_io_resp_bits_uop_is_fencei;
	wire _fpu_io_resp_bits_uop_is_sfence;
	wire _fpu_io_resp_bits_uop_is_amo;
	wire _fpu_io_resp_bits_uop_is_eret;
	wire _fpu_io_resp_bits_uop_is_sys_pc2epc;
	wire _fpu_io_resp_bits_uop_is_rocc;
	wire _fpu_io_resp_bits_uop_is_mov;
	wire [3:0] _fpu_io_resp_bits_uop_ftq_idx;
	wire _fpu_io_resp_bits_uop_edge_inst;
	wire [5:0] _fpu_io_resp_bits_uop_pc_lob;
	wire _fpu_io_resp_bits_uop_taken;
	wire _fpu_io_resp_bits_uop_imm_rename;
	wire [2:0] _fpu_io_resp_bits_uop_imm_sel;
	wire [4:0] _fpu_io_resp_bits_uop_pimm;
	wire [19:0] _fpu_io_resp_bits_uop_imm_packed;
	wire [1:0] _fpu_io_resp_bits_uop_op1_sel;
	wire [2:0] _fpu_io_resp_bits_uop_op2_sel;
	wire _fpu_io_resp_bits_uop_fp_ctrl_ldst;
	wire _fpu_io_resp_bits_uop_fp_ctrl_wen;
	wire _fpu_io_resp_bits_uop_fp_ctrl_ren1;
	wire _fpu_io_resp_bits_uop_fp_ctrl_ren2;
	wire _fpu_io_resp_bits_uop_fp_ctrl_ren3;
	wire _fpu_io_resp_bits_uop_fp_ctrl_swap12;
	wire _fpu_io_resp_bits_uop_fp_ctrl_swap23;
	wire [1:0] _fpu_io_resp_bits_uop_fp_ctrl_typeTagIn;
	wire [1:0] _fpu_io_resp_bits_uop_fp_ctrl_typeTagOut;
	wire _fpu_io_resp_bits_uop_fp_ctrl_fromint;
	wire _fpu_io_resp_bits_uop_fp_ctrl_toint;
	wire _fpu_io_resp_bits_uop_fp_ctrl_fastpipe;
	wire _fpu_io_resp_bits_uop_fp_ctrl_fma;
	wire _fpu_io_resp_bits_uop_fp_ctrl_div;
	wire _fpu_io_resp_bits_uop_fp_ctrl_sqrt;
	wire _fpu_io_resp_bits_uop_fp_ctrl_wflags;
	wire _fpu_io_resp_bits_uop_fp_ctrl_vec;
	wire [4:0] _fpu_io_resp_bits_uop_rob_idx;
	wire [3:0] _fpu_io_resp_bits_uop_ldq_idx;
	wire [3:0] _fpu_io_resp_bits_uop_stq_idx;
	wire [1:0] _fpu_io_resp_bits_uop_rxq_idx;
	wire [5:0] _fpu_io_resp_bits_uop_pdst;
	wire [5:0] _fpu_io_resp_bits_uop_prs1;
	wire [5:0] _fpu_io_resp_bits_uop_prs2;
	wire [5:0] _fpu_io_resp_bits_uop_prs3;
	wire [3:0] _fpu_io_resp_bits_uop_ppred;
	wire _fpu_io_resp_bits_uop_prs1_busy;
	wire _fpu_io_resp_bits_uop_prs2_busy;
	wire _fpu_io_resp_bits_uop_prs3_busy;
	wire _fpu_io_resp_bits_uop_ppred_busy;
	wire [5:0] _fpu_io_resp_bits_uop_stale_pdst;
	wire _fpu_io_resp_bits_uop_exception;
	wire [63:0] _fpu_io_resp_bits_uop_exc_cause;
	wire [4:0] _fpu_io_resp_bits_uop_mem_cmd;
	wire [1:0] _fpu_io_resp_bits_uop_mem_size;
	wire _fpu_io_resp_bits_uop_mem_signed;
	wire _fpu_io_resp_bits_uop_uses_ldq;
	wire _fpu_io_resp_bits_uop_uses_stq;
	wire _fpu_io_resp_bits_uop_is_unique;
	wire _fpu_io_resp_bits_uop_flush_on_commit;
	wire [2:0] _fpu_io_resp_bits_uop_csr_cmd;
	wire _fpu_io_resp_bits_uop_ldst_is_rs1;
	wire [5:0] _fpu_io_resp_bits_uop_ldst;
	wire [5:0] _fpu_io_resp_bits_uop_lrs1;
	wire [5:0] _fpu_io_resp_bits_uop_lrs2;
	wire [5:0] _fpu_io_resp_bits_uop_lrs3;
	wire [1:0] _fpu_io_resp_bits_uop_dst_rtype;
	wire [1:0] _fpu_io_resp_bits_uop_lrs1_rtype;
	wire [1:0] _fpu_io_resp_bits_uop_lrs2_rtype;
	wire _fpu_io_resp_bits_uop_frs3_en;
	wire _fpu_io_resp_bits_uop_fcn_dw;
	wire [4:0] _fpu_io_resp_bits_uop_fcn_op;
	wire _fpu_io_resp_bits_uop_fp_val;
	wire [2:0] _fpu_io_resp_bits_uop_fp_rm;
	wire [1:0] _fpu_io_resp_bits_uop_fp_typ;
	wire _fpu_io_resp_bits_uop_xcpt_pf_if;
	wire _fpu_io_resp_bits_uop_xcpt_ae_if;
	wire _fpu_io_resp_bits_uop_xcpt_ma_if;
	wire _fpu_io_resp_bits_uop_bp_debug_if;
	wire _fpu_io_resp_bits_uop_bp_xcpt_if;
	wire [2:0] _fpu_io_resp_bits_uop_debug_fsrc;
	wire [2:0] _fpu_io_resp_bits_uop_debug_tsrc;
	wire [64:0] _fpu_io_resp_bits_data;
	wire _fpu_io_resp_bits_fflags_valid;
	wire [4:0] _fpu_io_resp_bits_fflags_bits;
	reg arb_uop_valid;
	reg [31:0] arb_uop_bits_inst;
	reg [31:0] arb_uop_bits_debug_inst;
	reg arb_uop_bits_is_rvc;
	reg [39:0] arb_uop_bits_debug_pc;
	reg arb_uop_bits_iq_type_0;
	reg arb_uop_bits_iq_type_1;
	reg arb_uop_bits_iq_type_2;
	reg arb_uop_bits_iq_type_3;
	reg arb_uop_bits_fu_code_0;
	reg arb_uop_bits_fu_code_1;
	reg arb_uop_bits_fu_code_2;
	reg arb_uop_bits_fu_code_3;
	reg arb_uop_bits_fu_code_4;
	reg arb_uop_bits_fu_code_5;
	reg arb_uop_bits_fu_code_6;
	reg arb_uop_bits_fu_code_7;
	reg arb_uop_bits_fu_code_8;
	reg arb_uop_bits_fu_code_9;
	reg arb_uop_bits_iw_issued;
	reg arb_uop_bits_iw_issued_partial_agen;
	reg arb_uop_bits_iw_issued_partial_dgen;
	reg arb_uop_bits_iw_p1_speculative_child;
	reg arb_uop_bits_iw_p2_speculative_child;
	reg arb_uop_bits_iw_p1_bypass_hint;
	reg arb_uop_bits_iw_p2_bypass_hint;
	reg arb_uop_bits_iw_p3_bypass_hint;
	reg arb_uop_bits_dis_col_sel;
	reg [7:0] arb_uop_bits_br_mask;
	reg [2:0] arb_uop_bits_br_tag;
	reg [3:0] arb_uop_bits_br_type;
	reg arb_uop_bits_is_sfb;
	reg arb_uop_bits_is_fence;
	reg arb_uop_bits_is_fencei;
	reg arb_uop_bits_is_sfence;
	reg arb_uop_bits_is_amo;
	reg arb_uop_bits_is_eret;
	reg arb_uop_bits_is_sys_pc2epc;
	reg arb_uop_bits_is_rocc;
	reg arb_uop_bits_is_mov;
	reg [3:0] arb_uop_bits_ftq_idx;
	reg arb_uop_bits_edge_inst;
	reg [5:0] arb_uop_bits_pc_lob;
	reg arb_uop_bits_taken;
	reg arb_uop_bits_imm_rename;
	reg [2:0] arb_uop_bits_imm_sel;
	reg [4:0] arb_uop_bits_pimm;
	reg [19:0] arb_uop_bits_imm_packed;
	reg [1:0] arb_uop_bits_op1_sel;
	reg [2:0] arb_uop_bits_op2_sel;
	reg arb_uop_bits_fp_ctrl_ldst;
	reg arb_uop_bits_fp_ctrl_wen;
	reg arb_uop_bits_fp_ctrl_ren1;
	reg arb_uop_bits_fp_ctrl_ren2;
	reg arb_uop_bits_fp_ctrl_ren3;
	reg arb_uop_bits_fp_ctrl_swap12;
	reg arb_uop_bits_fp_ctrl_swap23;
	reg [1:0] arb_uop_bits_fp_ctrl_typeTagIn;
	reg [1:0] arb_uop_bits_fp_ctrl_typeTagOut;
	reg arb_uop_bits_fp_ctrl_fromint;
	reg arb_uop_bits_fp_ctrl_toint;
	reg arb_uop_bits_fp_ctrl_fastpipe;
	reg arb_uop_bits_fp_ctrl_fma;
	reg arb_uop_bits_fp_ctrl_div;
	reg arb_uop_bits_fp_ctrl_sqrt;
	reg arb_uop_bits_fp_ctrl_wflags;
	reg arb_uop_bits_fp_ctrl_vec;
	reg [4:0] arb_uop_bits_rob_idx;
	reg [3:0] arb_uop_bits_ldq_idx;
	reg [3:0] arb_uop_bits_stq_idx;
	reg [1:0] arb_uop_bits_rxq_idx;
	reg [5:0] arb_uop_bits_pdst;
	reg [5:0] arb_uop_bits_prs1;
	reg [5:0] arb_uop_bits_prs2;
	reg [5:0] arb_uop_bits_prs3;
	reg [3:0] arb_uop_bits_ppred;
	reg arb_uop_bits_prs1_busy;
	reg arb_uop_bits_prs2_busy;
	reg arb_uop_bits_prs3_busy;
	reg arb_uop_bits_ppred_busy;
	reg [5:0] arb_uop_bits_stale_pdst;
	reg arb_uop_bits_exception;
	reg [63:0] arb_uop_bits_exc_cause;
	reg [4:0] arb_uop_bits_mem_cmd;
	reg [1:0] arb_uop_bits_mem_size;
	reg arb_uop_bits_mem_signed;
	reg arb_uop_bits_uses_ldq;
	reg arb_uop_bits_uses_stq;
	reg arb_uop_bits_is_unique;
	reg arb_uop_bits_flush_on_commit;
	reg [2:0] arb_uop_bits_csr_cmd;
	reg arb_uop_bits_ldst_is_rs1;
	reg [5:0] arb_uop_bits_ldst;
	reg [5:0] arb_uop_bits_lrs1;
	reg [5:0] arb_uop_bits_lrs2;
	reg [5:0] arb_uop_bits_lrs3;
	reg [1:0] arb_uop_bits_dst_rtype;
	reg [1:0] arb_uop_bits_lrs1_rtype;
	reg [1:0] arb_uop_bits_lrs2_rtype;
	reg arb_uop_bits_frs3_en;
	reg arb_uop_bits_fcn_dw;
	reg [4:0] arb_uop_bits_fcn_op;
	reg arb_uop_bits_fp_val;
	reg [2:0] arb_uop_bits_fp_rm;
	reg [1:0] arb_uop_bits_fp_typ;
	reg arb_uop_bits_xcpt_pf_if;
	reg arb_uop_bits_xcpt_ae_if;
	reg arb_uop_bits_xcpt_ma_if;
	reg arb_uop_bits_bp_debug_if;
	reg arb_uop_bits_bp_xcpt_if;
	reg [2:0] arb_uop_bits_debug_fsrc;
	reg [2:0] arb_uop_bits_debug_tsrc;
	reg rrd_uop_valid;
	reg [31:0] rrd_uop_bits_inst;
	reg [31:0] rrd_uop_bits_debug_inst;
	reg rrd_uop_bits_is_rvc;
	reg [39:0] rrd_uop_bits_debug_pc;
	reg rrd_uop_bits_iq_type_0;
	reg rrd_uop_bits_iq_type_1;
	reg rrd_uop_bits_iq_type_2;
	reg rrd_uop_bits_iq_type_3;
	reg rrd_uop_bits_fu_code_0;
	reg rrd_uop_bits_fu_code_1;
	reg rrd_uop_bits_fu_code_2;
	reg rrd_uop_bits_fu_code_3;
	reg rrd_uop_bits_fu_code_4;
	reg rrd_uop_bits_fu_code_5;
	reg rrd_uop_bits_fu_code_6;
	reg rrd_uop_bits_fu_code_7;
	reg rrd_uop_bits_fu_code_8;
	reg rrd_uop_bits_fu_code_9;
	reg rrd_uop_bits_iw_issued;
	reg rrd_uop_bits_iw_issued_partial_agen;
	reg rrd_uop_bits_iw_issued_partial_dgen;
	reg rrd_uop_bits_iw_p1_speculative_child;
	reg rrd_uop_bits_iw_p2_speculative_child;
	reg rrd_uop_bits_iw_p1_bypass_hint;
	reg rrd_uop_bits_iw_p2_bypass_hint;
	reg rrd_uop_bits_iw_p3_bypass_hint;
	reg rrd_uop_bits_dis_col_sel;
	reg [7:0] rrd_uop_bits_br_mask;
	reg [2:0] rrd_uop_bits_br_tag;
	reg [3:0] rrd_uop_bits_br_type;
	reg rrd_uop_bits_is_sfb;
	reg rrd_uop_bits_is_fence;
	reg rrd_uop_bits_is_fencei;
	reg rrd_uop_bits_is_sfence;
	reg rrd_uop_bits_is_amo;
	reg rrd_uop_bits_is_eret;
	reg rrd_uop_bits_is_sys_pc2epc;
	reg rrd_uop_bits_is_rocc;
	reg rrd_uop_bits_is_mov;
	reg [3:0] rrd_uop_bits_ftq_idx;
	reg rrd_uop_bits_edge_inst;
	reg [5:0] rrd_uop_bits_pc_lob;
	reg rrd_uop_bits_taken;
	reg rrd_uop_bits_imm_rename;
	reg [2:0] rrd_uop_bits_imm_sel;
	reg [4:0] rrd_uop_bits_pimm;
	reg [19:0] rrd_uop_bits_imm_packed;
	reg [1:0] rrd_uop_bits_op1_sel;
	reg [2:0] rrd_uop_bits_op2_sel;
	reg rrd_uop_bits_fp_ctrl_ldst;
	reg rrd_uop_bits_fp_ctrl_wen;
	reg rrd_uop_bits_fp_ctrl_ren1;
	reg rrd_uop_bits_fp_ctrl_ren2;
	reg rrd_uop_bits_fp_ctrl_ren3;
	reg rrd_uop_bits_fp_ctrl_swap12;
	reg rrd_uop_bits_fp_ctrl_swap23;
	reg [1:0] rrd_uop_bits_fp_ctrl_typeTagIn;
	reg [1:0] rrd_uop_bits_fp_ctrl_typeTagOut;
	reg rrd_uop_bits_fp_ctrl_fromint;
	reg rrd_uop_bits_fp_ctrl_toint;
	reg rrd_uop_bits_fp_ctrl_fastpipe;
	reg rrd_uop_bits_fp_ctrl_fma;
	reg rrd_uop_bits_fp_ctrl_div;
	reg rrd_uop_bits_fp_ctrl_sqrt;
	reg rrd_uop_bits_fp_ctrl_wflags;
	reg rrd_uop_bits_fp_ctrl_vec;
	reg [4:0] rrd_uop_bits_rob_idx;
	reg [3:0] rrd_uop_bits_ldq_idx;
	reg [3:0] rrd_uop_bits_stq_idx;
	reg [1:0] rrd_uop_bits_rxq_idx;
	reg [5:0] rrd_uop_bits_pdst;
	reg [5:0] rrd_uop_bits_prs1;
	reg [5:0] rrd_uop_bits_prs2;
	reg [5:0] rrd_uop_bits_prs3;
	reg [3:0] rrd_uop_bits_ppred;
	reg rrd_uop_bits_prs1_busy;
	reg rrd_uop_bits_prs2_busy;
	reg rrd_uop_bits_prs3_busy;
	reg rrd_uop_bits_ppred_busy;
	reg [5:0] rrd_uop_bits_stale_pdst;
	reg rrd_uop_bits_exception;
	reg [63:0] rrd_uop_bits_exc_cause;
	reg [4:0] rrd_uop_bits_mem_cmd;
	reg [1:0] rrd_uop_bits_mem_size;
	reg rrd_uop_bits_mem_signed;
	reg rrd_uop_bits_uses_ldq;
	reg rrd_uop_bits_uses_stq;
	reg rrd_uop_bits_is_unique;
	reg rrd_uop_bits_flush_on_commit;
	reg [2:0] rrd_uop_bits_csr_cmd;
	reg rrd_uop_bits_ldst_is_rs1;
	reg [5:0] rrd_uop_bits_ldst;
	reg [5:0] rrd_uop_bits_lrs1;
	reg [5:0] rrd_uop_bits_lrs2;
	reg [5:0] rrd_uop_bits_lrs3;
	reg [1:0] rrd_uop_bits_dst_rtype;
	reg [1:0] rrd_uop_bits_lrs1_rtype;
	reg [1:0] rrd_uop_bits_lrs2_rtype;
	reg rrd_uop_bits_frs3_en;
	reg rrd_uop_bits_fcn_dw;
	reg [4:0] rrd_uop_bits_fcn_op;
	reg rrd_uop_bits_fp_val;
	reg [2:0] rrd_uop_bits_fp_rm;
	reg [1:0] rrd_uop_bits_fp_typ;
	reg rrd_uop_bits_xcpt_pf_if;
	reg rrd_uop_bits_xcpt_ae_if;
	reg rrd_uop_bits_xcpt_ma_if;
	reg rrd_uop_bits_bp_debug_if;
	reg rrd_uop_bits_bp_xcpt_if;
	reg [2:0] rrd_uop_bits_debug_fsrc;
	reg [2:0] rrd_uop_bits_debug_tsrc;
	reg exe_uop_valid;
	reg [31:0] exe_uop_bits_inst;
	reg [31:0] exe_uop_bits_debug_inst;
	reg exe_uop_bits_is_rvc;
	reg [39:0] exe_uop_bits_debug_pc;
	reg exe_uop_bits_iq_type_0;
	reg exe_uop_bits_iq_type_1;
	reg exe_uop_bits_iq_type_2;
	reg exe_uop_bits_iq_type_3;
	reg exe_uop_bits_fu_code_0;
	reg exe_uop_bits_fu_code_1;
	reg exe_uop_bits_fu_code_2;
	reg exe_uop_bits_fu_code_3;
	reg exe_uop_bits_fu_code_4;
	reg exe_uop_bits_fu_code_5;
	reg exe_uop_bits_fu_code_6;
	reg exe_uop_bits_fu_code_7;
	reg exe_uop_bits_fu_code_8;
	reg exe_uop_bits_fu_code_9;
	reg exe_uop_bits_iw_issued;
	reg exe_uop_bits_iw_issued_partial_agen;
	reg exe_uop_bits_iw_issued_partial_dgen;
	reg exe_uop_bits_iw_p1_speculative_child;
	reg exe_uop_bits_iw_p2_speculative_child;
	reg exe_uop_bits_iw_p1_bypass_hint;
	reg exe_uop_bits_iw_p2_bypass_hint;
	reg exe_uop_bits_iw_p3_bypass_hint;
	reg exe_uop_bits_dis_col_sel;
	reg [7:0] exe_uop_bits_br_mask;
	reg [2:0] exe_uop_bits_br_tag;
	reg [3:0] exe_uop_bits_br_type;
	reg exe_uop_bits_is_sfb;
	reg exe_uop_bits_is_fence;
	reg exe_uop_bits_is_fencei;
	reg exe_uop_bits_is_sfence;
	reg exe_uop_bits_is_amo;
	reg exe_uop_bits_is_eret;
	reg exe_uop_bits_is_sys_pc2epc;
	reg exe_uop_bits_is_rocc;
	reg exe_uop_bits_is_mov;
	reg [3:0] exe_uop_bits_ftq_idx;
	reg exe_uop_bits_edge_inst;
	reg [5:0] exe_uop_bits_pc_lob;
	reg exe_uop_bits_taken;
	reg exe_uop_bits_imm_rename;
	reg [2:0] exe_uop_bits_imm_sel;
	reg [4:0] exe_uop_bits_pimm;
	reg [19:0] exe_uop_bits_imm_packed;
	reg [1:0] exe_uop_bits_op1_sel;
	reg [2:0] exe_uop_bits_op2_sel;
	reg exe_uop_bits_fp_ctrl_ldst;
	reg exe_uop_bits_fp_ctrl_wen;
	reg exe_uop_bits_fp_ctrl_ren1;
	reg exe_uop_bits_fp_ctrl_ren2;
	reg exe_uop_bits_fp_ctrl_ren3;
	reg exe_uop_bits_fp_ctrl_swap12;
	reg exe_uop_bits_fp_ctrl_swap23;
	reg [1:0] exe_uop_bits_fp_ctrl_typeTagIn;
	reg [1:0] exe_uop_bits_fp_ctrl_typeTagOut;
	reg exe_uop_bits_fp_ctrl_fromint;
	reg exe_uop_bits_fp_ctrl_toint;
	reg exe_uop_bits_fp_ctrl_fastpipe;
	reg exe_uop_bits_fp_ctrl_fma;
	reg exe_uop_bits_fp_ctrl_div;
	reg exe_uop_bits_fp_ctrl_sqrt;
	reg exe_uop_bits_fp_ctrl_wflags;
	reg exe_uop_bits_fp_ctrl_vec;
	reg [4:0] exe_uop_bits_rob_idx;
	reg [3:0] exe_uop_bits_ldq_idx;
	reg [3:0] exe_uop_bits_stq_idx;
	reg [1:0] exe_uop_bits_rxq_idx;
	reg [5:0] exe_uop_bits_pdst;
	reg [5:0] exe_uop_bits_prs1;
	reg [5:0] exe_uop_bits_prs2;
	reg [5:0] exe_uop_bits_prs3;
	reg [3:0] exe_uop_bits_ppred;
	reg exe_uop_bits_prs1_busy;
	reg exe_uop_bits_prs2_busy;
	reg exe_uop_bits_prs3_busy;
	reg exe_uop_bits_ppred_busy;
	reg [5:0] exe_uop_bits_stale_pdst;
	reg exe_uop_bits_exception;
	reg [63:0] exe_uop_bits_exc_cause;
	reg [4:0] exe_uop_bits_mem_cmd;
	reg [1:0] exe_uop_bits_mem_size;
	reg exe_uop_bits_mem_signed;
	reg exe_uop_bits_uses_ldq;
	reg exe_uop_bits_uses_stq;
	reg exe_uop_bits_is_unique;
	reg exe_uop_bits_flush_on_commit;
	reg [2:0] exe_uop_bits_csr_cmd;
	reg exe_uop_bits_ldst_is_rs1;
	reg [5:0] exe_uop_bits_ldst;
	reg [5:0] exe_uop_bits_lrs1;
	reg [5:0] exe_uop_bits_lrs2;
	reg [5:0] exe_uop_bits_lrs3;
	reg [1:0] exe_uop_bits_dst_rtype;
	reg [1:0] exe_uop_bits_lrs1_rtype;
	reg [1:0] exe_uop_bits_lrs2_rtype;
	reg exe_uop_bits_frs3_en;
	reg exe_uop_bits_fcn_dw;
	reg [4:0] exe_uop_bits_fcn_op;
	reg exe_uop_bits_fp_val;
	reg [2:0] exe_uop_bits_fp_rm;
	reg [1:0] exe_uop_bits_fp_typ;
	reg exe_uop_bits_xcpt_pf_if;
	reg exe_uop_bits_xcpt_ae_if;
	reg exe_uop_bits_xcpt_ma_if;
	reg exe_uop_bits_bp_debug_if;
	reg exe_uop_bits_bp_xcpt_if;
	reg [2:0] exe_uop_bits_debug_fsrc;
	reg [2:0] exe_uop_bits_debug_tsrc;
	wire io_arb_frf_reqs_2_valid_0 = (arb_uop_valid & arb_uop_bits_frs3_en) & ~arb_uop_bits_iw_p3_bypass_hint;
	reg [64:0] exe_rs1_data;
	reg [64:0] exe_rs2_data;
	reg [64:0] exe_rs3_data;
	wire rs1_hit = io_rrd_frf_bypasses_0_valid & (rrd_uop_bits_prs1 == io_rrd_frf_bypasses_0_bits_uop_pdst);
	wire rs2_hit = io_rrd_frf_bypasses_0_valid & (rrd_uop_bits_prs2 == io_rrd_frf_bypasses_0_bits_uop_pdst);
	wire rs3_hit = io_rrd_frf_bypasses_0_valid & (rrd_uop_bits_prs3 == io_rrd_frf_bypasses_0_bits_uop_pdst);
	wire _io_squash_iss_output = io_arb_frf_reqs_2_valid_0 & ~io_arb_frf_reqs_2_ready;
	reg fast_wakeups_1_REG_valid;
	reg [5:0] fast_wakeups_1_REG_bits_uop_pdst;
	reg [1:0] fast_wakeups_1_REG_bits_uop_dst_rtype;
	wire _io_fdiv_resp_fdivsqrt_ready_T = exe_uop_valid & exe_uop_bits_fu_code_7;
	reg fpiu_ready_REG;
	wire _queue_io_enq_valid_T_2 = (_fpu_io_resp_valid & _fpu_io_resp_bits_uop_fu_code_9) & ~_fpu_io_resp_bits_uop_uses_stq;
	reg dgen_valid_REG;
	reg [3:0] dgen_bits_uop_REG_stq_idx;
	reg [63:0] dgen_bits_data_REG;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg [7:0] _will_replay_T;
		reg dgen_bits_data_unrecoded_rawIn_isInf;
		reg dgen_bits_data_unrecoded_isSubnormal;
		reg [52:0] _dgen_bits_data_unrecoded_denormFract_T_1;
		reg [51:0] dgen_bits_data_unrecoded_fractOut;
		reg [1:0] _dgen_bits_data_prevUnrecoded_rawIn_isSpecial_T;
		reg dgen_bits_data_prevUnrecoded_rawIn_isInf;
		reg dgen_bits_data_prevUnrecoded_isSubnormal;
		reg [23:0] _dgen_bits_data_prevUnrecoded_denormFract_T_1;
		_will_replay_T = io_brupdate_b1_mispredict_mask & arb_uop_bits_br_mask;
		dgen_bits_data_unrecoded_rawIn_isInf = &exe_rs2_data[63:62] & ~exe_rs2_data[61];
		dgen_bits_data_unrecoded_isSubnormal = $signed({1'h0, exe_rs2_data[63:52]}) < 13'sh0402;
		_dgen_bits_data_unrecoded_denormFract_T_1 = {1'h0, |exe_rs2_data[63:61], exe_rs2_data[51:1]} >> (6'h01 - exe_rs2_data[57:52]);
		dgen_bits_data_unrecoded_fractOut = (dgen_bits_data_unrecoded_isSubnormal ? _dgen_bits_data_unrecoded_denormFract_T_1[51:0] : (dgen_bits_data_unrecoded_rawIn_isInf ? 52'h0000000000000 : exe_rs2_data[51:0]));
		_dgen_bits_data_prevUnrecoded_rawIn_isSpecial_T = {exe_rs2_data[52], exe_rs2_data[30]};
		dgen_bits_data_prevUnrecoded_rawIn_isInf = &_dgen_bits_data_prevUnrecoded_rawIn_isSpecial_T & ~exe_rs2_data[29];
		dgen_bits_data_prevUnrecoded_isSubnormal = $signed({1'h0, exe_rs2_data[52], exe_rs2_data[30:23]}) < 10'sh082;
		if (_io_squash_iss_output) begin
			arb_uop_valid <= arb_uop_valid & ~(|_will_replay_T | io_kill);
			arb_uop_bits_br_mask <= arb_uop_bits_br_mask & ~io_brupdate_b1_resolve_mask;
		end
		else begin
			arb_uop_valid <= io_iss_uop_valid & ~(|(io_brupdate_b1_mispredict_mask & io_iss_uop_bits_br_mask) | io_kill);
			arb_uop_bits_inst <= io_iss_uop_bits_inst;
			arb_uop_bits_debug_inst <= io_iss_uop_bits_debug_inst;
			arb_uop_bits_is_rvc <= io_iss_uop_bits_is_rvc;
			arb_uop_bits_debug_pc <= io_iss_uop_bits_debug_pc;
			arb_uop_bits_iq_type_0 <= io_iss_uop_bits_iq_type_0;
			arb_uop_bits_iq_type_1 <= io_iss_uop_bits_iq_type_1;
			arb_uop_bits_iq_type_2 <= io_iss_uop_bits_iq_type_2;
			arb_uop_bits_iq_type_3 <= io_iss_uop_bits_iq_type_3;
			arb_uop_bits_fu_code_0 <= io_iss_uop_bits_fu_code_0;
			arb_uop_bits_fu_code_1 <= io_iss_uop_bits_fu_code_1;
			arb_uop_bits_fu_code_2 <= io_iss_uop_bits_fu_code_2;
			arb_uop_bits_fu_code_3 <= io_iss_uop_bits_fu_code_3;
			arb_uop_bits_fu_code_4 <= io_iss_uop_bits_fu_code_4;
			arb_uop_bits_fu_code_5 <= io_iss_uop_bits_fu_code_5;
			arb_uop_bits_fu_code_6 <= io_iss_uop_bits_fu_code_6;
			arb_uop_bits_fu_code_7 <= io_iss_uop_bits_fu_code_7;
			arb_uop_bits_fu_code_8 <= io_iss_uop_bits_fu_code_8;
			arb_uop_bits_fu_code_9 <= io_iss_uop_bits_fu_code_9;
			arb_uop_bits_iw_issued <= io_iss_uop_bits_iw_issued;
			arb_uop_bits_iw_p1_speculative_child <= io_iss_uop_bits_iw_p1_speculative_child;
			arb_uop_bits_iw_p2_speculative_child <= io_iss_uop_bits_iw_p2_speculative_child;
			arb_uop_bits_dis_col_sel <= io_iss_uop_bits_dis_col_sel;
			arb_uop_bits_br_mask <= io_iss_uop_bits_br_mask & ~io_brupdate_b1_resolve_mask;
			arb_uop_bits_br_tag <= io_iss_uop_bits_br_tag;
			arb_uop_bits_br_type <= io_iss_uop_bits_br_type;
			arb_uop_bits_is_sfb <= io_iss_uop_bits_is_sfb;
			arb_uop_bits_is_fence <= io_iss_uop_bits_is_fence;
			arb_uop_bits_is_fencei <= io_iss_uop_bits_is_fencei;
			arb_uop_bits_is_sfence <= io_iss_uop_bits_is_sfence;
			arb_uop_bits_is_amo <= io_iss_uop_bits_is_amo;
			arb_uop_bits_is_eret <= io_iss_uop_bits_is_eret;
			arb_uop_bits_is_sys_pc2epc <= io_iss_uop_bits_is_sys_pc2epc;
			arb_uop_bits_is_rocc <= io_iss_uop_bits_is_rocc;
			arb_uop_bits_is_mov <= io_iss_uop_bits_is_mov;
			arb_uop_bits_ftq_idx <= io_iss_uop_bits_ftq_idx;
			arb_uop_bits_edge_inst <= io_iss_uop_bits_edge_inst;
			arb_uop_bits_pc_lob <= io_iss_uop_bits_pc_lob;
			arb_uop_bits_taken <= io_iss_uop_bits_taken;
			arb_uop_bits_imm_rename <= io_iss_uop_bits_imm_rename;
			arb_uop_bits_imm_sel <= io_iss_uop_bits_imm_sel;
			arb_uop_bits_pimm <= io_iss_uop_bits_pimm;
			arb_uop_bits_imm_packed <= io_iss_uop_bits_imm_packed;
			arb_uop_bits_op1_sel <= io_iss_uop_bits_op1_sel;
			arb_uop_bits_op2_sel <= io_iss_uop_bits_op2_sel;
			arb_uop_bits_fp_ctrl_ldst <= io_iss_uop_bits_fp_ctrl_ldst;
			arb_uop_bits_fp_ctrl_wen <= io_iss_uop_bits_fp_ctrl_wen;
			arb_uop_bits_fp_ctrl_ren1 <= io_iss_uop_bits_fp_ctrl_ren1;
			arb_uop_bits_fp_ctrl_ren2 <= io_iss_uop_bits_fp_ctrl_ren2;
			arb_uop_bits_fp_ctrl_ren3 <= io_iss_uop_bits_fp_ctrl_ren3;
			arb_uop_bits_fp_ctrl_swap12 <= io_iss_uop_bits_fp_ctrl_swap12;
			arb_uop_bits_fp_ctrl_swap23 <= io_iss_uop_bits_fp_ctrl_swap23;
			arb_uop_bits_fp_ctrl_typeTagIn <= io_iss_uop_bits_fp_ctrl_typeTagIn;
			arb_uop_bits_fp_ctrl_typeTagOut <= io_iss_uop_bits_fp_ctrl_typeTagOut;
			arb_uop_bits_fp_ctrl_fromint <= io_iss_uop_bits_fp_ctrl_fromint;
			arb_uop_bits_fp_ctrl_toint <= io_iss_uop_bits_fp_ctrl_toint;
			arb_uop_bits_fp_ctrl_fastpipe <= io_iss_uop_bits_fp_ctrl_fastpipe;
			arb_uop_bits_fp_ctrl_fma <= io_iss_uop_bits_fp_ctrl_fma;
			arb_uop_bits_fp_ctrl_div <= io_iss_uop_bits_fp_ctrl_div;
			arb_uop_bits_fp_ctrl_sqrt <= io_iss_uop_bits_fp_ctrl_sqrt;
			arb_uop_bits_fp_ctrl_wflags <= io_iss_uop_bits_fp_ctrl_wflags;
			arb_uop_bits_fp_ctrl_vec <= io_iss_uop_bits_fp_ctrl_vec;
			arb_uop_bits_rob_idx <= io_iss_uop_bits_rob_idx;
			arb_uop_bits_ldq_idx <= io_iss_uop_bits_ldq_idx;
			arb_uop_bits_stq_idx <= io_iss_uop_bits_stq_idx;
			arb_uop_bits_rxq_idx <= io_iss_uop_bits_rxq_idx;
			arb_uop_bits_pdst <= io_iss_uop_bits_pdst;
			arb_uop_bits_prs1 <= io_iss_uop_bits_prs1;
			arb_uop_bits_prs2 <= io_iss_uop_bits_prs2;
			arb_uop_bits_prs3 <= io_iss_uop_bits_prs3;
			arb_uop_bits_ppred <= io_iss_uop_bits_ppred;
			arb_uop_bits_prs1_busy <= io_iss_uop_bits_prs1_busy;
			arb_uop_bits_prs2_busy <= io_iss_uop_bits_prs2_busy;
			arb_uop_bits_prs3_busy <= io_iss_uop_bits_prs3_busy;
			arb_uop_bits_ppred_busy <= io_iss_uop_bits_ppred_busy;
			arb_uop_bits_stale_pdst <= io_iss_uop_bits_stale_pdst;
			arb_uop_bits_exception <= io_iss_uop_bits_exception;
			arb_uop_bits_exc_cause <= io_iss_uop_bits_exc_cause;
			arb_uop_bits_mem_cmd <= io_iss_uop_bits_mem_cmd;
			arb_uop_bits_mem_size <= io_iss_uop_bits_mem_size;
			arb_uop_bits_mem_signed <= io_iss_uop_bits_mem_signed;
			arb_uop_bits_uses_ldq <= io_iss_uop_bits_uses_ldq;
			arb_uop_bits_uses_stq <= io_iss_uop_bits_uses_stq;
			arb_uop_bits_is_unique <= io_iss_uop_bits_is_unique;
			arb_uop_bits_flush_on_commit <= io_iss_uop_bits_flush_on_commit;
			arb_uop_bits_csr_cmd <= io_iss_uop_bits_csr_cmd;
			arb_uop_bits_ldst_is_rs1 <= io_iss_uop_bits_ldst_is_rs1;
			arb_uop_bits_ldst <= io_iss_uop_bits_ldst;
			arb_uop_bits_lrs1 <= io_iss_uop_bits_lrs1;
			arb_uop_bits_lrs2 <= io_iss_uop_bits_lrs2;
			arb_uop_bits_lrs3 <= io_iss_uop_bits_lrs3;
			arb_uop_bits_dst_rtype <= io_iss_uop_bits_dst_rtype;
			arb_uop_bits_lrs1_rtype <= io_iss_uop_bits_lrs1_rtype;
			arb_uop_bits_lrs2_rtype <= io_iss_uop_bits_lrs2_rtype;
			arb_uop_bits_frs3_en <= io_iss_uop_bits_frs3_en;
			arb_uop_bits_fcn_dw <= io_iss_uop_bits_fcn_dw;
			arb_uop_bits_fcn_op <= io_iss_uop_bits_fcn_op;
			arb_uop_bits_fp_val <= io_iss_uop_bits_fp_val;
			arb_uop_bits_fp_rm <= io_iss_uop_bits_fp_rm;
			arb_uop_bits_fp_typ <= io_iss_uop_bits_fp_typ;
			arb_uop_bits_xcpt_pf_if <= io_iss_uop_bits_xcpt_pf_if;
			arb_uop_bits_xcpt_ae_if <= io_iss_uop_bits_xcpt_ae_if;
			arb_uop_bits_xcpt_ma_if <= io_iss_uop_bits_xcpt_ma_if;
			arb_uop_bits_bp_debug_if <= io_iss_uop_bits_bp_debug_if;
			arb_uop_bits_bp_xcpt_if <= io_iss_uop_bits_bp_xcpt_if;
			arb_uop_bits_debug_fsrc <= io_iss_uop_bits_debug_fsrc;
			arb_uop_bits_debug_tsrc <= io_iss_uop_bits_debug_tsrc;
		end
		arb_uop_bits_iw_issued_partial_agen <= _io_squash_iss_output & arb_uop_bits_iw_issued_partial_agen;
		arb_uop_bits_iw_issued_partial_dgen <= _io_squash_iss_output & arb_uop_bits_iw_issued_partial_dgen;
		rrd_uop_bits_inst <= arb_uop_bits_inst;
		rrd_uop_bits_debug_inst <= arb_uop_bits_debug_inst;
		rrd_uop_bits_is_rvc <= arb_uop_bits_is_rvc;
		rrd_uop_bits_debug_pc <= arb_uop_bits_debug_pc;
		rrd_uop_bits_iq_type_0 <= arb_uop_bits_iq_type_0;
		rrd_uop_bits_iq_type_1 <= arb_uop_bits_iq_type_1;
		rrd_uop_bits_iq_type_2 <= arb_uop_bits_iq_type_2;
		rrd_uop_bits_iq_type_3 <= arb_uop_bits_iq_type_3;
		rrd_uop_bits_fu_code_0 <= arb_uop_bits_fu_code_0;
		rrd_uop_bits_fu_code_1 <= arb_uop_bits_fu_code_1;
		rrd_uop_bits_fu_code_2 <= arb_uop_bits_fu_code_2;
		rrd_uop_bits_fu_code_3 <= arb_uop_bits_fu_code_3;
		rrd_uop_bits_fu_code_4 <= arb_uop_bits_fu_code_4;
		rrd_uop_bits_fu_code_5 <= arb_uop_bits_fu_code_5;
		rrd_uop_bits_fu_code_6 <= arb_uop_bits_fu_code_6;
		rrd_uop_bits_fu_code_7 <= arb_uop_bits_fu_code_7;
		rrd_uop_bits_fu_code_8 <= arb_uop_bits_fu_code_8;
		rrd_uop_bits_fu_code_9 <= arb_uop_bits_fu_code_9;
		rrd_uop_bits_iw_issued <= arb_uop_bits_iw_issued;
		rrd_uop_bits_iw_issued_partial_agen <= arb_uop_bits_iw_issued_partial_agen;
		rrd_uop_bits_iw_issued_partial_dgen <= arb_uop_bits_iw_issued_partial_dgen;
		rrd_uop_bits_iw_p1_speculative_child <= arb_uop_bits_iw_p1_speculative_child;
		rrd_uop_bits_iw_p2_speculative_child <= arb_uop_bits_iw_p2_speculative_child;
		rrd_uop_bits_iw_p1_bypass_hint <= arb_uop_bits_iw_p1_bypass_hint;
		rrd_uop_bits_iw_p2_bypass_hint <= arb_uop_bits_iw_p2_bypass_hint;
		rrd_uop_bits_iw_p3_bypass_hint <= arb_uop_bits_iw_p3_bypass_hint;
		rrd_uop_bits_dis_col_sel <= arb_uop_bits_dis_col_sel;
		rrd_uop_bits_br_mask <= arb_uop_bits_br_mask & ~io_brupdate_b1_resolve_mask;
		rrd_uop_bits_br_tag <= arb_uop_bits_br_tag;
		rrd_uop_bits_br_type <= arb_uop_bits_br_type;
		rrd_uop_bits_is_sfb <= arb_uop_bits_is_sfb;
		rrd_uop_bits_is_fence <= arb_uop_bits_is_fence;
		rrd_uop_bits_is_fencei <= arb_uop_bits_is_fencei;
		rrd_uop_bits_is_sfence <= arb_uop_bits_is_sfence;
		rrd_uop_bits_is_amo <= arb_uop_bits_is_amo;
		rrd_uop_bits_is_eret <= arb_uop_bits_is_eret;
		rrd_uop_bits_is_sys_pc2epc <= arb_uop_bits_is_sys_pc2epc;
		rrd_uop_bits_is_rocc <= arb_uop_bits_is_rocc;
		rrd_uop_bits_is_mov <= arb_uop_bits_is_mov;
		rrd_uop_bits_ftq_idx <= arb_uop_bits_ftq_idx;
		rrd_uop_bits_edge_inst <= arb_uop_bits_edge_inst;
		rrd_uop_bits_pc_lob <= arb_uop_bits_pc_lob;
		rrd_uop_bits_taken <= arb_uop_bits_taken;
		rrd_uop_bits_imm_rename <= arb_uop_bits_imm_rename;
		rrd_uop_bits_imm_sel <= arb_uop_bits_imm_sel;
		rrd_uop_bits_pimm <= arb_uop_bits_pimm;
		rrd_uop_bits_imm_packed <= arb_uop_bits_imm_packed;
		rrd_uop_bits_op1_sel <= arb_uop_bits_op1_sel;
		rrd_uop_bits_op2_sel <= arb_uop_bits_op2_sel;
		rrd_uop_bits_fp_ctrl_ldst <= arb_uop_bits_fp_ctrl_ldst;
		rrd_uop_bits_fp_ctrl_wen <= arb_uop_bits_fp_ctrl_wen;
		rrd_uop_bits_fp_ctrl_ren1 <= arb_uop_bits_fp_ctrl_ren1;
		rrd_uop_bits_fp_ctrl_ren2 <= arb_uop_bits_fp_ctrl_ren2;
		rrd_uop_bits_fp_ctrl_ren3 <= arb_uop_bits_fp_ctrl_ren3;
		rrd_uop_bits_fp_ctrl_swap12 <= arb_uop_bits_fp_ctrl_swap12;
		rrd_uop_bits_fp_ctrl_swap23 <= arb_uop_bits_fp_ctrl_swap23;
		rrd_uop_bits_fp_ctrl_typeTagIn <= arb_uop_bits_fp_ctrl_typeTagIn;
		rrd_uop_bits_fp_ctrl_typeTagOut <= arb_uop_bits_fp_ctrl_typeTagOut;
		rrd_uop_bits_fp_ctrl_fromint <= arb_uop_bits_fp_ctrl_fromint;
		rrd_uop_bits_fp_ctrl_toint <= arb_uop_bits_fp_ctrl_toint;
		rrd_uop_bits_fp_ctrl_fastpipe <= arb_uop_bits_fp_ctrl_fastpipe;
		rrd_uop_bits_fp_ctrl_fma <= arb_uop_bits_fp_ctrl_fma;
		rrd_uop_bits_fp_ctrl_div <= arb_uop_bits_fp_ctrl_div;
		rrd_uop_bits_fp_ctrl_sqrt <= arb_uop_bits_fp_ctrl_sqrt;
		rrd_uop_bits_fp_ctrl_wflags <= arb_uop_bits_fp_ctrl_wflags;
		rrd_uop_bits_fp_ctrl_vec <= arb_uop_bits_fp_ctrl_vec;
		rrd_uop_bits_rob_idx <= arb_uop_bits_rob_idx;
		rrd_uop_bits_ldq_idx <= arb_uop_bits_ldq_idx;
		rrd_uop_bits_stq_idx <= arb_uop_bits_stq_idx;
		rrd_uop_bits_rxq_idx <= arb_uop_bits_rxq_idx;
		rrd_uop_bits_pdst <= arb_uop_bits_pdst;
		rrd_uop_bits_prs1 <= arb_uop_bits_prs1;
		rrd_uop_bits_prs2 <= arb_uop_bits_prs2;
		rrd_uop_bits_prs3 <= arb_uop_bits_prs3;
		rrd_uop_bits_ppred <= arb_uop_bits_ppred;
		rrd_uop_bits_prs1_busy <= arb_uop_bits_prs1_busy;
		rrd_uop_bits_prs2_busy <= arb_uop_bits_prs2_busy;
		rrd_uop_bits_prs3_busy <= arb_uop_bits_prs3_busy;
		rrd_uop_bits_ppred_busy <= arb_uop_bits_ppred_busy;
		rrd_uop_bits_stale_pdst <= arb_uop_bits_stale_pdst;
		rrd_uop_bits_exception <= arb_uop_bits_exception;
		rrd_uop_bits_exc_cause <= arb_uop_bits_exc_cause;
		rrd_uop_bits_mem_cmd <= arb_uop_bits_mem_cmd;
		rrd_uop_bits_mem_size <= arb_uop_bits_mem_size;
		rrd_uop_bits_mem_signed <= arb_uop_bits_mem_signed;
		rrd_uop_bits_uses_ldq <= arb_uop_bits_uses_ldq;
		rrd_uop_bits_uses_stq <= arb_uop_bits_uses_stq;
		rrd_uop_bits_is_unique <= arb_uop_bits_is_unique;
		rrd_uop_bits_flush_on_commit <= arb_uop_bits_flush_on_commit;
		rrd_uop_bits_csr_cmd <= arb_uop_bits_csr_cmd;
		rrd_uop_bits_ldst_is_rs1 <= arb_uop_bits_ldst_is_rs1;
		rrd_uop_bits_ldst <= arb_uop_bits_ldst;
		rrd_uop_bits_lrs1 <= arb_uop_bits_lrs1;
		rrd_uop_bits_lrs2 <= arb_uop_bits_lrs2;
		rrd_uop_bits_lrs3 <= arb_uop_bits_lrs3;
		rrd_uop_bits_dst_rtype <= arb_uop_bits_dst_rtype;
		rrd_uop_bits_lrs1_rtype <= arb_uop_bits_lrs1_rtype;
		rrd_uop_bits_lrs2_rtype <= arb_uop_bits_lrs2_rtype;
		rrd_uop_bits_frs3_en <= arb_uop_bits_frs3_en;
		rrd_uop_bits_fcn_dw <= arb_uop_bits_fcn_dw;
		rrd_uop_bits_fcn_op <= arb_uop_bits_fcn_op;
		rrd_uop_bits_fp_val <= arb_uop_bits_fp_val;
		rrd_uop_bits_fp_rm <= arb_uop_bits_fp_rm;
		rrd_uop_bits_fp_typ <= arb_uop_bits_fp_typ;
		rrd_uop_bits_xcpt_pf_if <= arb_uop_bits_xcpt_pf_if;
		rrd_uop_bits_xcpt_ae_if <= arb_uop_bits_xcpt_ae_if;
		rrd_uop_bits_xcpt_ma_if <= arb_uop_bits_xcpt_ma_if;
		rrd_uop_bits_bp_debug_if <= arb_uop_bits_bp_debug_if;
		rrd_uop_bits_bp_xcpt_if <= arb_uop_bits_bp_xcpt_if;
		rrd_uop_bits_debug_fsrc <= arb_uop_bits_debug_fsrc;
		rrd_uop_bits_debug_tsrc <= arb_uop_bits_debug_tsrc;
		exe_uop_valid <= rrd_uop_valid & ~(|(io_brupdate_b1_mispredict_mask & rrd_uop_bits_br_mask) | io_kill);
		exe_uop_bits_inst <= rrd_uop_bits_inst;
		exe_uop_bits_debug_inst <= rrd_uop_bits_debug_inst;
		exe_uop_bits_is_rvc <= rrd_uop_bits_is_rvc;
		exe_uop_bits_debug_pc <= rrd_uop_bits_debug_pc;
		exe_uop_bits_iq_type_0 <= rrd_uop_bits_iq_type_0;
		exe_uop_bits_iq_type_1 <= rrd_uop_bits_iq_type_1;
		exe_uop_bits_iq_type_2 <= rrd_uop_bits_iq_type_2;
		exe_uop_bits_iq_type_3 <= rrd_uop_bits_iq_type_3;
		exe_uop_bits_fu_code_0 <= rrd_uop_bits_fu_code_0;
		exe_uop_bits_fu_code_1 <= rrd_uop_bits_fu_code_1;
		exe_uop_bits_fu_code_2 <= rrd_uop_bits_fu_code_2;
		exe_uop_bits_fu_code_3 <= rrd_uop_bits_fu_code_3;
		exe_uop_bits_fu_code_4 <= rrd_uop_bits_fu_code_4;
		exe_uop_bits_fu_code_5 <= rrd_uop_bits_fu_code_5;
		exe_uop_bits_fu_code_6 <= rrd_uop_bits_fu_code_6;
		exe_uop_bits_fu_code_7 <= rrd_uop_bits_fu_code_7;
		exe_uop_bits_fu_code_8 <= rrd_uop_bits_fu_code_8;
		exe_uop_bits_fu_code_9 <= rrd_uop_bits_fu_code_9;
		exe_uop_bits_iw_issued <= rrd_uop_bits_iw_issued;
		exe_uop_bits_iw_issued_partial_agen <= rrd_uop_bits_iw_issued_partial_agen;
		exe_uop_bits_iw_issued_partial_dgen <= rrd_uop_bits_iw_issued_partial_dgen;
		exe_uop_bits_iw_p1_speculative_child <= rrd_uop_bits_iw_p1_speculative_child;
		exe_uop_bits_iw_p2_speculative_child <= rrd_uop_bits_iw_p2_speculative_child;
		exe_uop_bits_iw_p1_bypass_hint <= rrd_uop_bits_iw_p1_bypass_hint;
		exe_uop_bits_iw_p2_bypass_hint <= rrd_uop_bits_iw_p2_bypass_hint;
		exe_uop_bits_iw_p3_bypass_hint <= rrd_uop_bits_iw_p3_bypass_hint;
		exe_uop_bits_dis_col_sel <= rrd_uop_bits_dis_col_sel;
		exe_uop_bits_br_mask <= rrd_uop_bits_br_mask & ~io_brupdate_b1_resolve_mask;
		exe_uop_bits_br_tag <= rrd_uop_bits_br_tag;
		exe_uop_bits_br_type <= rrd_uop_bits_br_type;
		exe_uop_bits_is_sfb <= rrd_uop_bits_is_sfb;
		exe_uop_bits_is_fence <= rrd_uop_bits_is_fence;
		exe_uop_bits_is_fencei <= rrd_uop_bits_is_fencei;
		exe_uop_bits_is_sfence <= rrd_uop_bits_is_sfence;
		exe_uop_bits_is_amo <= rrd_uop_bits_is_amo;
		exe_uop_bits_is_eret <= rrd_uop_bits_is_eret;
		exe_uop_bits_is_sys_pc2epc <= rrd_uop_bits_is_sys_pc2epc;
		exe_uop_bits_is_rocc <= rrd_uop_bits_is_rocc;
		exe_uop_bits_is_mov <= rrd_uop_bits_is_mov;
		exe_uop_bits_ftq_idx <= rrd_uop_bits_ftq_idx;
		exe_uop_bits_edge_inst <= rrd_uop_bits_edge_inst;
		exe_uop_bits_pc_lob <= rrd_uop_bits_pc_lob;
		exe_uop_bits_taken <= rrd_uop_bits_taken;
		exe_uop_bits_imm_rename <= rrd_uop_bits_imm_rename;
		exe_uop_bits_imm_sel <= rrd_uop_bits_imm_sel;
		exe_uop_bits_pimm <= rrd_uop_bits_pimm;
		exe_uop_bits_imm_packed <= rrd_uop_bits_imm_packed;
		exe_uop_bits_op1_sel <= rrd_uop_bits_op1_sel;
		exe_uop_bits_op2_sel <= rrd_uop_bits_op2_sel;
		exe_uop_bits_fp_ctrl_ldst <= rrd_uop_bits_fp_ctrl_ldst;
		exe_uop_bits_fp_ctrl_wen <= rrd_uop_bits_fp_ctrl_wen;
		exe_uop_bits_fp_ctrl_ren1 <= rrd_uop_bits_fp_ctrl_ren1;
		exe_uop_bits_fp_ctrl_ren2 <= rrd_uop_bits_fp_ctrl_ren2;
		exe_uop_bits_fp_ctrl_ren3 <= rrd_uop_bits_fp_ctrl_ren3;
		exe_uop_bits_fp_ctrl_swap12 <= rrd_uop_bits_fp_ctrl_swap12;
		exe_uop_bits_fp_ctrl_swap23 <= rrd_uop_bits_fp_ctrl_swap23;
		exe_uop_bits_fp_ctrl_typeTagIn <= rrd_uop_bits_fp_ctrl_typeTagIn;
		exe_uop_bits_fp_ctrl_typeTagOut <= rrd_uop_bits_fp_ctrl_typeTagOut;
		exe_uop_bits_fp_ctrl_fromint <= rrd_uop_bits_fp_ctrl_fromint;
		exe_uop_bits_fp_ctrl_toint <= rrd_uop_bits_fp_ctrl_toint;
		exe_uop_bits_fp_ctrl_fastpipe <= rrd_uop_bits_fp_ctrl_fastpipe;
		exe_uop_bits_fp_ctrl_fma <= rrd_uop_bits_fp_ctrl_fma;
		exe_uop_bits_fp_ctrl_div <= rrd_uop_bits_fp_ctrl_div;
		exe_uop_bits_fp_ctrl_sqrt <= rrd_uop_bits_fp_ctrl_sqrt;
		exe_uop_bits_fp_ctrl_wflags <= rrd_uop_bits_fp_ctrl_wflags;
		exe_uop_bits_fp_ctrl_vec <= rrd_uop_bits_fp_ctrl_vec;
		exe_uop_bits_rob_idx <= rrd_uop_bits_rob_idx;
		exe_uop_bits_ldq_idx <= rrd_uop_bits_ldq_idx;
		exe_uop_bits_stq_idx <= rrd_uop_bits_stq_idx;
		exe_uop_bits_rxq_idx <= rrd_uop_bits_rxq_idx;
		exe_uop_bits_pdst <= rrd_uop_bits_pdst;
		exe_uop_bits_prs1 <= rrd_uop_bits_prs1;
		exe_uop_bits_prs2 <= rrd_uop_bits_prs2;
		exe_uop_bits_prs3 <= rrd_uop_bits_prs3;
		exe_uop_bits_ppred <= rrd_uop_bits_ppred;
		exe_uop_bits_prs1_busy <= rrd_uop_bits_prs1_busy;
		exe_uop_bits_prs2_busy <= rrd_uop_bits_prs2_busy;
		exe_uop_bits_prs3_busy <= rrd_uop_bits_prs3_busy;
		exe_uop_bits_ppred_busy <= rrd_uop_bits_ppred_busy;
		exe_uop_bits_stale_pdst <= rrd_uop_bits_stale_pdst;
		exe_uop_bits_exception <= rrd_uop_bits_exception;
		exe_uop_bits_exc_cause <= rrd_uop_bits_exc_cause;
		exe_uop_bits_mem_cmd <= rrd_uop_bits_mem_cmd;
		exe_uop_bits_mem_size <= rrd_uop_bits_mem_size;
		exe_uop_bits_mem_signed <= rrd_uop_bits_mem_signed;
		exe_uop_bits_uses_ldq <= rrd_uop_bits_uses_ldq;
		exe_uop_bits_uses_stq <= rrd_uop_bits_uses_stq;
		exe_uop_bits_is_unique <= rrd_uop_bits_is_unique;
		exe_uop_bits_flush_on_commit <= rrd_uop_bits_flush_on_commit;
		exe_uop_bits_csr_cmd <= rrd_uop_bits_csr_cmd;
		exe_uop_bits_ldst_is_rs1 <= rrd_uop_bits_ldst_is_rs1;
		exe_uop_bits_ldst <= rrd_uop_bits_ldst;
		exe_uop_bits_lrs1 <= rrd_uop_bits_lrs1;
		exe_uop_bits_lrs2 <= rrd_uop_bits_lrs2;
		exe_uop_bits_lrs3 <= rrd_uop_bits_lrs3;
		exe_uop_bits_dst_rtype <= rrd_uop_bits_dst_rtype;
		exe_uop_bits_lrs1_rtype <= rrd_uop_bits_lrs1_rtype;
		exe_uop_bits_lrs2_rtype <= rrd_uop_bits_lrs2_rtype;
		exe_uop_bits_frs3_en <= rrd_uop_bits_frs3_en;
		exe_uop_bits_fcn_dw <= rrd_uop_bits_fcn_dw;
		exe_uop_bits_fcn_op <= rrd_uop_bits_fcn_op;
		exe_uop_bits_fp_val <= rrd_uop_bits_fp_val;
		exe_uop_bits_fp_rm <= rrd_uop_bits_fp_rm;
		exe_uop_bits_fp_typ <= rrd_uop_bits_fp_typ;
		exe_uop_bits_xcpt_pf_if <= rrd_uop_bits_xcpt_pf_if;
		exe_uop_bits_xcpt_ae_if <= rrd_uop_bits_xcpt_ae_if;
		exe_uop_bits_xcpt_ma_if <= rrd_uop_bits_xcpt_ma_if;
		exe_uop_bits_bp_debug_if <= rrd_uop_bits_bp_debug_if;
		exe_uop_bits_bp_xcpt_if <= rrd_uop_bits_bp_xcpt_if;
		exe_uop_bits_debug_fsrc <= rrd_uop_bits_debug_fsrc;
		exe_uop_bits_debug_tsrc <= rrd_uop_bits_debug_tsrc;
		exe_rs1_data <= (rs1_hit ? io_rrd_frf_bypasses_0_bits_data : io_rrd_frf_resps_0);
		exe_rs2_data <= (rs2_hit ? io_rrd_frf_bypasses_0_bits_data : io_rrd_frf_resps_1);
		exe_rs3_data <= (rs3_hit ? io_rrd_frf_bypasses_0_bits_data : io_rrd_frf_resps_2);
		fast_wakeups_1_REG_valid <= (exe_uop_valid & exe_uop_bits_fu_code_6) & ~(|(io_brupdate_b1_mispredict_mask & exe_uop_bits_br_mask) | io_kill);
		fast_wakeups_1_REG_bits_uop_pdst <= exe_uop_bits_pdst;
		fast_wakeups_1_REG_bits_uop_dst_rtype <= exe_uop_bits_dst_rtype;
		fpiu_ready_REG <= _queue_io_count < 4'h2;
		dgen_valid_REG <= (exe_uop_valid & exe_uop_bits_uses_stq) & ~(|(io_brupdate_b1_mispredict_mask & exe_uop_bits_br_mask) | io_kill);
		dgen_bits_uop_REG_stq_idx <= exe_uop_bits_stq_idx;
		_dgen_bits_data_prevUnrecoded_denormFract_T_1 = {1'h0, |{exe_rs2_data[52], exe_rs2_data[30:29]}, exe_rs2_data[22:1]} >> (5'h01 - exe_rs2_data[27:23]);
		dgen_bits_data_REG <= {exe_rs2_data[64], (dgen_bits_data_unrecoded_isSubnormal ? 11'h000 : exe_rs2_data[62:52] + 11'h3ff) | {11 {(&exe_rs2_data[63:62] & exe_rs2_data[61]) | dgen_bits_data_unrecoded_rawIn_isInf}}, dgen_bits_data_unrecoded_fractOut[51:32], (&exe_rs2_data[63:61] ? {exe_rs2_data[31], (dgen_bits_data_prevUnrecoded_isSubnormal ? 8'h00 : exe_rs2_data[30:23] + 8'h7f) | {8 {(&_dgen_bits_data_prevUnrecoded_rawIn_isSpecial_T & exe_rs2_data[29]) | dgen_bits_data_prevUnrecoded_rawIn_isInf}}, (dgen_bits_data_prevUnrecoded_isSubnormal ? _dgen_bits_data_prevUnrecoded_denormFract_T_1[22:0] : (dgen_bits_data_prevUnrecoded_rawIn_isInf ? 23'h000000 : exe_rs2_data[22:0]))} : dgen_bits_data_unrecoded_fractOut[31:0])};
		if (_io_squash_iss_output) begin
			arb_uop_bits_iw_p1_bypass_hint <= 1'h0;
			arb_uop_bits_iw_p2_bypass_hint <= 1'h0;
			arb_uop_bits_iw_p3_bypass_hint <= 1'h0;
			rrd_uop_valid <= 1'h0;
		end
		else begin
			arb_uop_bits_iw_p1_bypass_hint <= io_iss_uop_bits_iw_p1_bypass_hint;
			arb_uop_bits_iw_p2_bypass_hint <= io_iss_uop_bits_iw_p2_bypass_hint;
			arb_uop_bits_iw_p3_bypass_hint <= io_iss_uop_bits_iw_p3_bypass_hint;
			rrd_uop_valid <= arb_uop_valid & ~(|_will_replay_T | io_kill);
		end
	end
	FPUUnit fpu(
		.clock(clock),
		.reset(reset),
		.io_kill(io_kill),
		.io_req_valid(exe_uop_valid & (exe_uop_bits_fu_code_6 | exe_uop_bits_fu_code_9)),
		.io_req_bits_uop_inst(exe_uop_bits_inst),
		.io_req_bits_uop_debug_inst(exe_uop_bits_debug_inst),
		.io_req_bits_uop_is_rvc(exe_uop_bits_is_rvc),
		.io_req_bits_uop_debug_pc(exe_uop_bits_debug_pc),
		.io_req_bits_uop_iq_type_0(exe_uop_bits_iq_type_0),
		.io_req_bits_uop_iq_type_1(exe_uop_bits_iq_type_1),
		.io_req_bits_uop_iq_type_2(exe_uop_bits_iq_type_2),
		.io_req_bits_uop_iq_type_3(exe_uop_bits_iq_type_3),
		.io_req_bits_uop_fu_code_0(exe_uop_bits_fu_code_0),
		.io_req_bits_uop_fu_code_1(exe_uop_bits_fu_code_1),
		.io_req_bits_uop_fu_code_2(exe_uop_bits_fu_code_2),
		.io_req_bits_uop_fu_code_3(exe_uop_bits_fu_code_3),
		.io_req_bits_uop_fu_code_4(exe_uop_bits_fu_code_4),
		.io_req_bits_uop_fu_code_5(exe_uop_bits_fu_code_5),
		.io_req_bits_uop_fu_code_6(exe_uop_bits_fu_code_6),
		.io_req_bits_uop_fu_code_7(exe_uop_bits_fu_code_7),
		.io_req_bits_uop_fu_code_8(exe_uop_bits_fu_code_8),
		.io_req_bits_uop_fu_code_9(exe_uop_bits_fu_code_9),
		.io_req_bits_uop_iw_issued(exe_uop_bits_iw_issued),
		.io_req_bits_uop_iw_issued_partial_agen(exe_uop_bits_iw_issued_partial_agen),
		.io_req_bits_uop_iw_issued_partial_dgen(exe_uop_bits_iw_issued_partial_dgen),
		.io_req_bits_uop_iw_p1_speculative_child(exe_uop_bits_iw_p1_speculative_child),
		.io_req_bits_uop_iw_p2_speculative_child(exe_uop_bits_iw_p2_speculative_child),
		.io_req_bits_uop_iw_p1_bypass_hint(exe_uop_bits_iw_p1_bypass_hint),
		.io_req_bits_uop_iw_p2_bypass_hint(exe_uop_bits_iw_p2_bypass_hint),
		.io_req_bits_uop_iw_p3_bypass_hint(exe_uop_bits_iw_p3_bypass_hint),
		.io_req_bits_uop_dis_col_sel(exe_uop_bits_dis_col_sel),
		.io_req_bits_uop_br_mask(exe_uop_bits_br_mask),
		.io_req_bits_uop_br_tag(exe_uop_bits_br_tag),
		.io_req_bits_uop_br_type(exe_uop_bits_br_type),
		.io_req_bits_uop_is_sfb(exe_uop_bits_is_sfb),
		.io_req_bits_uop_is_fence(exe_uop_bits_is_fence),
		.io_req_bits_uop_is_fencei(exe_uop_bits_is_fencei),
		.io_req_bits_uop_is_sfence(exe_uop_bits_is_sfence),
		.io_req_bits_uop_is_amo(exe_uop_bits_is_amo),
		.io_req_bits_uop_is_eret(exe_uop_bits_is_eret),
		.io_req_bits_uop_is_sys_pc2epc(exe_uop_bits_is_sys_pc2epc),
		.io_req_bits_uop_is_rocc(exe_uop_bits_is_rocc),
		.io_req_bits_uop_is_mov(exe_uop_bits_is_mov),
		.io_req_bits_uop_ftq_idx(exe_uop_bits_ftq_idx),
		.io_req_bits_uop_edge_inst(exe_uop_bits_edge_inst),
		.io_req_bits_uop_pc_lob(exe_uop_bits_pc_lob),
		.io_req_bits_uop_taken(exe_uop_bits_taken),
		.io_req_bits_uop_imm_rename(exe_uop_bits_imm_rename),
		.io_req_bits_uop_imm_sel(exe_uop_bits_imm_sel),
		.io_req_bits_uop_pimm(exe_uop_bits_pimm),
		.io_req_bits_uop_imm_packed(exe_uop_bits_imm_packed),
		.io_req_bits_uop_op1_sel(exe_uop_bits_op1_sel),
		.io_req_bits_uop_op2_sel(exe_uop_bits_op2_sel),
		.io_req_bits_uop_fp_ctrl_ldst(exe_uop_bits_fp_ctrl_ldst),
		.io_req_bits_uop_fp_ctrl_wen(exe_uop_bits_fp_ctrl_wen),
		.io_req_bits_uop_fp_ctrl_ren1(exe_uop_bits_fp_ctrl_ren1),
		.io_req_bits_uop_fp_ctrl_ren2(exe_uop_bits_fp_ctrl_ren2),
		.io_req_bits_uop_fp_ctrl_ren3(exe_uop_bits_fp_ctrl_ren3),
		.io_req_bits_uop_fp_ctrl_swap12(exe_uop_bits_fp_ctrl_swap12),
		.io_req_bits_uop_fp_ctrl_swap23(exe_uop_bits_fp_ctrl_swap23),
		.io_req_bits_uop_fp_ctrl_typeTagIn(exe_uop_bits_fp_ctrl_typeTagIn),
		.io_req_bits_uop_fp_ctrl_typeTagOut(exe_uop_bits_fp_ctrl_typeTagOut),
		.io_req_bits_uop_fp_ctrl_fromint(exe_uop_bits_fp_ctrl_fromint),
		.io_req_bits_uop_fp_ctrl_toint(exe_uop_bits_fp_ctrl_toint),
		.io_req_bits_uop_fp_ctrl_fastpipe(exe_uop_bits_fp_ctrl_fastpipe),
		.io_req_bits_uop_fp_ctrl_fma(exe_uop_bits_fp_ctrl_fma),
		.io_req_bits_uop_fp_ctrl_div(exe_uop_bits_fp_ctrl_div),
		.io_req_bits_uop_fp_ctrl_sqrt(exe_uop_bits_fp_ctrl_sqrt),
		.io_req_bits_uop_fp_ctrl_wflags(exe_uop_bits_fp_ctrl_wflags),
		.io_req_bits_uop_fp_ctrl_vec(exe_uop_bits_fp_ctrl_vec),
		.io_req_bits_uop_rob_idx(exe_uop_bits_rob_idx),
		.io_req_bits_uop_ldq_idx(exe_uop_bits_ldq_idx),
		.io_req_bits_uop_stq_idx(exe_uop_bits_stq_idx),
		.io_req_bits_uop_rxq_idx(exe_uop_bits_rxq_idx),
		.io_req_bits_uop_pdst(exe_uop_bits_pdst),
		.io_req_bits_uop_prs1(exe_uop_bits_prs1),
		.io_req_bits_uop_prs2(exe_uop_bits_prs2),
		.io_req_bits_uop_prs3(exe_uop_bits_prs3),
		.io_req_bits_uop_ppred(exe_uop_bits_ppred),
		.io_req_bits_uop_prs1_busy(exe_uop_bits_prs1_busy),
		.io_req_bits_uop_prs2_busy(exe_uop_bits_prs2_busy),
		.io_req_bits_uop_prs3_busy(exe_uop_bits_prs3_busy),
		.io_req_bits_uop_ppred_busy(exe_uop_bits_ppred_busy),
		.io_req_bits_uop_stale_pdst(exe_uop_bits_stale_pdst),
		.io_req_bits_uop_exception(exe_uop_bits_exception),
		.io_req_bits_uop_exc_cause(exe_uop_bits_exc_cause),
		.io_req_bits_uop_mem_cmd(exe_uop_bits_mem_cmd),
		.io_req_bits_uop_mem_size(exe_uop_bits_mem_size),
		.io_req_bits_uop_mem_signed(exe_uop_bits_mem_signed),
		.io_req_bits_uop_uses_ldq(exe_uop_bits_uses_ldq),
		.io_req_bits_uop_uses_stq(exe_uop_bits_uses_stq),
		.io_req_bits_uop_is_unique(exe_uop_bits_is_unique),
		.io_req_bits_uop_flush_on_commit(exe_uop_bits_flush_on_commit),
		.io_req_bits_uop_csr_cmd(exe_uop_bits_csr_cmd),
		.io_req_bits_uop_ldst_is_rs1(exe_uop_bits_ldst_is_rs1),
		.io_req_bits_uop_ldst(exe_uop_bits_ldst),
		.io_req_bits_uop_lrs1(exe_uop_bits_lrs1),
		.io_req_bits_uop_lrs2(exe_uop_bits_lrs2),
		.io_req_bits_uop_lrs3(exe_uop_bits_lrs3),
		.io_req_bits_uop_dst_rtype(exe_uop_bits_dst_rtype),
		.io_req_bits_uop_lrs1_rtype(exe_uop_bits_lrs1_rtype),
		.io_req_bits_uop_lrs2_rtype(exe_uop_bits_lrs2_rtype),
		.io_req_bits_uop_frs3_en(exe_uop_bits_frs3_en),
		.io_req_bits_uop_fcn_dw(exe_uop_bits_fcn_dw),
		.io_req_bits_uop_fcn_op(exe_uop_bits_fcn_op),
		.io_req_bits_uop_fp_val(exe_uop_bits_fp_val),
		.io_req_bits_uop_fp_rm(exe_uop_bits_fp_rm),
		.io_req_bits_uop_fp_typ(exe_uop_bits_fp_typ),
		.io_req_bits_uop_xcpt_pf_if(exe_uop_bits_xcpt_pf_if),
		.io_req_bits_uop_xcpt_ae_if(exe_uop_bits_xcpt_ae_if),
		.io_req_bits_uop_xcpt_ma_if(exe_uop_bits_xcpt_ma_if),
		.io_req_bits_uop_bp_debug_if(exe_uop_bits_bp_debug_if),
		.io_req_bits_uop_bp_xcpt_if(exe_uop_bits_bp_xcpt_if),
		.io_req_bits_uop_debug_fsrc(exe_uop_bits_debug_fsrc),
		.io_req_bits_uop_debug_tsrc(exe_uop_bits_debug_tsrc),
		.io_req_bits_rs1_data(exe_rs1_data),
		.io_req_bits_rs2_data(exe_rs2_data),
		.io_req_bits_rs3_data(exe_rs3_data),
		.io_resp_valid(_fpu_io_resp_valid),
		.io_resp_bits_uop_inst(_fpu_io_resp_bits_uop_inst),
		.io_resp_bits_uop_debug_inst(_fpu_io_resp_bits_uop_debug_inst),
		.io_resp_bits_uop_is_rvc(_fpu_io_resp_bits_uop_is_rvc),
		.io_resp_bits_uop_debug_pc(_fpu_io_resp_bits_uop_debug_pc),
		.io_resp_bits_uop_iq_type_0(_fpu_io_resp_bits_uop_iq_type_0),
		.io_resp_bits_uop_iq_type_1(_fpu_io_resp_bits_uop_iq_type_1),
		.io_resp_bits_uop_iq_type_2(_fpu_io_resp_bits_uop_iq_type_2),
		.io_resp_bits_uop_iq_type_3(_fpu_io_resp_bits_uop_iq_type_3),
		.io_resp_bits_uop_fu_code_0(_fpu_io_resp_bits_uop_fu_code_0),
		.io_resp_bits_uop_fu_code_1(_fpu_io_resp_bits_uop_fu_code_1),
		.io_resp_bits_uop_fu_code_2(_fpu_io_resp_bits_uop_fu_code_2),
		.io_resp_bits_uop_fu_code_3(_fpu_io_resp_bits_uop_fu_code_3),
		.io_resp_bits_uop_fu_code_4(_fpu_io_resp_bits_uop_fu_code_4),
		.io_resp_bits_uop_fu_code_5(_fpu_io_resp_bits_uop_fu_code_5),
		.io_resp_bits_uop_fu_code_6(_fpu_io_resp_bits_uop_fu_code_6),
		.io_resp_bits_uop_fu_code_7(_fpu_io_resp_bits_uop_fu_code_7),
		.io_resp_bits_uop_fu_code_8(_fpu_io_resp_bits_uop_fu_code_8),
		.io_resp_bits_uop_fu_code_9(_fpu_io_resp_bits_uop_fu_code_9),
		.io_resp_bits_uop_iw_issued(_fpu_io_resp_bits_uop_iw_issued),
		.io_resp_bits_uop_iw_issued_partial_agen(_fpu_io_resp_bits_uop_iw_issued_partial_agen),
		.io_resp_bits_uop_iw_issued_partial_dgen(_fpu_io_resp_bits_uop_iw_issued_partial_dgen),
		.io_resp_bits_uop_iw_p1_speculative_child(_fpu_io_resp_bits_uop_iw_p1_speculative_child),
		.io_resp_bits_uop_iw_p2_speculative_child(_fpu_io_resp_bits_uop_iw_p2_speculative_child),
		.io_resp_bits_uop_iw_p1_bypass_hint(_fpu_io_resp_bits_uop_iw_p1_bypass_hint),
		.io_resp_bits_uop_iw_p2_bypass_hint(_fpu_io_resp_bits_uop_iw_p2_bypass_hint),
		.io_resp_bits_uop_iw_p3_bypass_hint(_fpu_io_resp_bits_uop_iw_p3_bypass_hint),
		.io_resp_bits_uop_dis_col_sel(_fpu_io_resp_bits_uop_dis_col_sel),
		.io_resp_bits_uop_br_mask(_fpu_io_resp_bits_uop_br_mask),
		.io_resp_bits_uop_br_tag(_fpu_io_resp_bits_uop_br_tag),
		.io_resp_bits_uop_br_type(_fpu_io_resp_bits_uop_br_type),
		.io_resp_bits_uop_is_sfb(_fpu_io_resp_bits_uop_is_sfb),
		.io_resp_bits_uop_is_fence(_fpu_io_resp_bits_uop_is_fence),
		.io_resp_bits_uop_is_fencei(_fpu_io_resp_bits_uop_is_fencei),
		.io_resp_bits_uop_is_sfence(_fpu_io_resp_bits_uop_is_sfence),
		.io_resp_bits_uop_is_amo(_fpu_io_resp_bits_uop_is_amo),
		.io_resp_bits_uop_is_eret(_fpu_io_resp_bits_uop_is_eret),
		.io_resp_bits_uop_is_sys_pc2epc(_fpu_io_resp_bits_uop_is_sys_pc2epc),
		.io_resp_bits_uop_is_rocc(_fpu_io_resp_bits_uop_is_rocc),
		.io_resp_bits_uop_is_mov(_fpu_io_resp_bits_uop_is_mov),
		.io_resp_bits_uop_ftq_idx(_fpu_io_resp_bits_uop_ftq_idx),
		.io_resp_bits_uop_edge_inst(_fpu_io_resp_bits_uop_edge_inst),
		.io_resp_bits_uop_pc_lob(_fpu_io_resp_bits_uop_pc_lob),
		.io_resp_bits_uop_taken(_fpu_io_resp_bits_uop_taken),
		.io_resp_bits_uop_imm_rename(_fpu_io_resp_bits_uop_imm_rename),
		.io_resp_bits_uop_imm_sel(_fpu_io_resp_bits_uop_imm_sel),
		.io_resp_bits_uop_pimm(_fpu_io_resp_bits_uop_pimm),
		.io_resp_bits_uop_imm_packed(_fpu_io_resp_bits_uop_imm_packed),
		.io_resp_bits_uop_op1_sel(_fpu_io_resp_bits_uop_op1_sel),
		.io_resp_bits_uop_op2_sel(_fpu_io_resp_bits_uop_op2_sel),
		.io_resp_bits_uop_fp_ctrl_ldst(_fpu_io_resp_bits_uop_fp_ctrl_ldst),
		.io_resp_bits_uop_fp_ctrl_wen(_fpu_io_resp_bits_uop_fp_ctrl_wen),
		.io_resp_bits_uop_fp_ctrl_ren1(_fpu_io_resp_bits_uop_fp_ctrl_ren1),
		.io_resp_bits_uop_fp_ctrl_ren2(_fpu_io_resp_bits_uop_fp_ctrl_ren2),
		.io_resp_bits_uop_fp_ctrl_ren3(_fpu_io_resp_bits_uop_fp_ctrl_ren3),
		.io_resp_bits_uop_fp_ctrl_swap12(_fpu_io_resp_bits_uop_fp_ctrl_swap12),
		.io_resp_bits_uop_fp_ctrl_swap23(_fpu_io_resp_bits_uop_fp_ctrl_swap23),
		.io_resp_bits_uop_fp_ctrl_typeTagIn(_fpu_io_resp_bits_uop_fp_ctrl_typeTagIn),
		.io_resp_bits_uop_fp_ctrl_typeTagOut(_fpu_io_resp_bits_uop_fp_ctrl_typeTagOut),
		.io_resp_bits_uop_fp_ctrl_fromint(_fpu_io_resp_bits_uop_fp_ctrl_fromint),
		.io_resp_bits_uop_fp_ctrl_toint(_fpu_io_resp_bits_uop_fp_ctrl_toint),
		.io_resp_bits_uop_fp_ctrl_fastpipe(_fpu_io_resp_bits_uop_fp_ctrl_fastpipe),
		.io_resp_bits_uop_fp_ctrl_fma(_fpu_io_resp_bits_uop_fp_ctrl_fma),
		.io_resp_bits_uop_fp_ctrl_div(_fpu_io_resp_bits_uop_fp_ctrl_div),
		.io_resp_bits_uop_fp_ctrl_sqrt(_fpu_io_resp_bits_uop_fp_ctrl_sqrt),
		.io_resp_bits_uop_fp_ctrl_wflags(_fpu_io_resp_bits_uop_fp_ctrl_wflags),
		.io_resp_bits_uop_fp_ctrl_vec(_fpu_io_resp_bits_uop_fp_ctrl_vec),
		.io_resp_bits_uop_rob_idx(_fpu_io_resp_bits_uop_rob_idx),
		.io_resp_bits_uop_ldq_idx(_fpu_io_resp_bits_uop_ldq_idx),
		.io_resp_bits_uop_stq_idx(_fpu_io_resp_bits_uop_stq_idx),
		.io_resp_bits_uop_rxq_idx(_fpu_io_resp_bits_uop_rxq_idx),
		.io_resp_bits_uop_pdst(_fpu_io_resp_bits_uop_pdst),
		.io_resp_bits_uop_prs1(_fpu_io_resp_bits_uop_prs1),
		.io_resp_bits_uop_prs2(_fpu_io_resp_bits_uop_prs2),
		.io_resp_bits_uop_prs3(_fpu_io_resp_bits_uop_prs3),
		.io_resp_bits_uop_ppred(_fpu_io_resp_bits_uop_ppred),
		.io_resp_bits_uop_prs1_busy(_fpu_io_resp_bits_uop_prs1_busy),
		.io_resp_bits_uop_prs2_busy(_fpu_io_resp_bits_uop_prs2_busy),
		.io_resp_bits_uop_prs3_busy(_fpu_io_resp_bits_uop_prs3_busy),
		.io_resp_bits_uop_ppred_busy(_fpu_io_resp_bits_uop_ppred_busy),
		.io_resp_bits_uop_stale_pdst(_fpu_io_resp_bits_uop_stale_pdst),
		.io_resp_bits_uop_exception(_fpu_io_resp_bits_uop_exception),
		.io_resp_bits_uop_exc_cause(_fpu_io_resp_bits_uop_exc_cause),
		.io_resp_bits_uop_mem_cmd(_fpu_io_resp_bits_uop_mem_cmd),
		.io_resp_bits_uop_mem_size(_fpu_io_resp_bits_uop_mem_size),
		.io_resp_bits_uop_mem_signed(_fpu_io_resp_bits_uop_mem_signed),
		.io_resp_bits_uop_uses_ldq(_fpu_io_resp_bits_uop_uses_ldq),
		.io_resp_bits_uop_uses_stq(_fpu_io_resp_bits_uop_uses_stq),
		.io_resp_bits_uop_is_unique(_fpu_io_resp_bits_uop_is_unique),
		.io_resp_bits_uop_flush_on_commit(_fpu_io_resp_bits_uop_flush_on_commit),
		.io_resp_bits_uop_csr_cmd(_fpu_io_resp_bits_uop_csr_cmd),
		.io_resp_bits_uop_ldst_is_rs1(_fpu_io_resp_bits_uop_ldst_is_rs1),
		.io_resp_bits_uop_ldst(_fpu_io_resp_bits_uop_ldst),
		.io_resp_bits_uop_lrs1(_fpu_io_resp_bits_uop_lrs1),
		.io_resp_bits_uop_lrs2(_fpu_io_resp_bits_uop_lrs2),
		.io_resp_bits_uop_lrs3(_fpu_io_resp_bits_uop_lrs3),
		.io_resp_bits_uop_dst_rtype(_fpu_io_resp_bits_uop_dst_rtype),
		.io_resp_bits_uop_lrs1_rtype(_fpu_io_resp_bits_uop_lrs1_rtype),
		.io_resp_bits_uop_lrs2_rtype(_fpu_io_resp_bits_uop_lrs2_rtype),
		.io_resp_bits_uop_frs3_en(_fpu_io_resp_bits_uop_frs3_en),
		.io_resp_bits_uop_fcn_dw(_fpu_io_resp_bits_uop_fcn_dw),
		.io_resp_bits_uop_fcn_op(_fpu_io_resp_bits_uop_fcn_op),
		.io_resp_bits_uop_fp_val(_fpu_io_resp_bits_uop_fp_val),
		.io_resp_bits_uop_fp_rm(_fpu_io_resp_bits_uop_fp_rm),
		.io_resp_bits_uop_fp_typ(_fpu_io_resp_bits_uop_fp_typ),
		.io_resp_bits_uop_xcpt_pf_if(_fpu_io_resp_bits_uop_xcpt_pf_if),
		.io_resp_bits_uop_xcpt_ae_if(_fpu_io_resp_bits_uop_xcpt_ae_if),
		.io_resp_bits_uop_xcpt_ma_if(_fpu_io_resp_bits_uop_xcpt_ma_if),
		.io_resp_bits_uop_bp_debug_if(_fpu_io_resp_bits_uop_bp_debug_if),
		.io_resp_bits_uop_bp_xcpt_if(_fpu_io_resp_bits_uop_bp_xcpt_if),
		.io_resp_bits_uop_debug_fsrc(_fpu_io_resp_bits_uop_debug_fsrc),
		.io_resp_bits_uop_debug_tsrc(_fpu_io_resp_bits_uop_debug_tsrc),
		.io_resp_bits_data(_fpu_io_resp_bits_data),
		.io_resp_bits_fflags_valid(_fpu_io_resp_bits_fflags_valid),
		.io_resp_bits_fflags_bits(_fpu_io_resp_bits_fflags_bits),
		.io_brupdate_b1_resolve_mask(io_brupdate_b1_resolve_mask),
		.io_brupdate_b1_mispredict_mask(io_brupdate_b1_mispredict_mask)
	);
	FDivSqrtUnit2 io_fdiv_resp_fdivsqrt(
		.clock(clock),
		.reset(reset),
		.io_kill(io_kill),
		.io_req_ready(_io_fdiv_resp_fdivsqrt_io_req_ready),
		.io_req_valid(_io_fdiv_resp_fdivsqrt_ready_T),
		.io_req_bits_uop_br_mask(exe_uop_bits_br_mask),
		.io_req_bits_uop_fp_ctrl_ren2(exe_uop_bits_fp_ctrl_ren2),
		.io_req_bits_uop_fp_ctrl_typeTagIn(exe_uop_bits_fp_ctrl_typeTagIn),
		.io_req_bits_uop_fp_ctrl_typeTagOut(exe_uop_bits_fp_ctrl_typeTagOut),
		.io_req_bits_uop_fp_ctrl_div(exe_uop_bits_fp_ctrl_div),
		.io_req_bits_uop_fp_ctrl_sqrt(exe_uop_bits_fp_ctrl_sqrt),
		.io_req_bits_uop_fp_ctrl_wflags(exe_uop_bits_fp_ctrl_wflags),
		.io_req_bits_uop_rob_idx(exe_uop_bits_rob_idx),
		.io_req_bits_uop_pdst(exe_uop_bits_pdst),
		.io_req_bits_uop_dst_rtype(exe_uop_bits_dst_rtype),
		.io_req_bits_uop_fp_rm(exe_uop_bits_fp_rm),
		.io_req_bits_uop_fp_typ(exe_uop_bits_fp_typ),
		.io_req_bits_rs1_data(exe_rs1_data),
		.io_req_bits_rs2_data(exe_rs2_data),
		.io_resp_ready(io_fdiv_resp_ready),
		.io_resp_valid(io_fdiv_resp_valid),
		.io_resp_bits_uop_rob_idx(io_fdiv_resp_bits_uop_rob_idx),
		.io_resp_bits_uop_pdst(io_fdiv_resp_bits_uop_pdst),
		.io_resp_bits_uop_dst_rtype(io_fdiv_resp_bits_uop_dst_rtype),
		.io_resp_bits_data(io_fdiv_resp_bits_data),
		.io_resp_bits_fflags_valid(io_fdiv_resp_bits_fflags_valid),
		.io_resp_bits_fflags_bits(io_fdiv_resp_bits_fflags_bits),
		.io_brupdate_b1_resolve_mask(io_brupdate_b1_resolve_mask),
		.io_brupdate_b1_mispredict_mask(io_brupdate_b1_mispredict_mask)
	);
	BranchKillableQueue_6 queue(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_queue_io_enq_ready),
		.io_enq_valid(_queue_io_enq_valid_T_2),
		.io_enq_bits_uop_inst(_fpu_io_resp_bits_uop_inst),
		.io_enq_bits_uop_debug_inst(_fpu_io_resp_bits_uop_debug_inst),
		.io_enq_bits_uop_is_rvc(_fpu_io_resp_bits_uop_is_rvc),
		.io_enq_bits_uop_debug_pc(_fpu_io_resp_bits_uop_debug_pc),
		.io_enq_bits_uop_iq_type_0(_fpu_io_resp_bits_uop_iq_type_0),
		.io_enq_bits_uop_iq_type_1(_fpu_io_resp_bits_uop_iq_type_1),
		.io_enq_bits_uop_iq_type_2(_fpu_io_resp_bits_uop_iq_type_2),
		.io_enq_bits_uop_iq_type_3(_fpu_io_resp_bits_uop_iq_type_3),
		.io_enq_bits_uop_fu_code_0(_fpu_io_resp_bits_uop_fu_code_0),
		.io_enq_bits_uop_fu_code_1(_fpu_io_resp_bits_uop_fu_code_1),
		.io_enq_bits_uop_fu_code_2(_fpu_io_resp_bits_uop_fu_code_2),
		.io_enq_bits_uop_fu_code_3(_fpu_io_resp_bits_uop_fu_code_3),
		.io_enq_bits_uop_fu_code_4(_fpu_io_resp_bits_uop_fu_code_4),
		.io_enq_bits_uop_fu_code_5(_fpu_io_resp_bits_uop_fu_code_5),
		.io_enq_bits_uop_fu_code_6(_fpu_io_resp_bits_uop_fu_code_6),
		.io_enq_bits_uop_fu_code_7(_fpu_io_resp_bits_uop_fu_code_7),
		.io_enq_bits_uop_fu_code_8(_fpu_io_resp_bits_uop_fu_code_8),
		.io_enq_bits_uop_fu_code_9(_fpu_io_resp_bits_uop_fu_code_9),
		.io_enq_bits_uop_iw_issued(_fpu_io_resp_bits_uop_iw_issued),
		.io_enq_bits_uop_iw_issued_partial_agen(_fpu_io_resp_bits_uop_iw_issued_partial_agen),
		.io_enq_bits_uop_iw_issued_partial_dgen(_fpu_io_resp_bits_uop_iw_issued_partial_dgen),
		.io_enq_bits_uop_iw_p1_speculative_child(_fpu_io_resp_bits_uop_iw_p1_speculative_child),
		.io_enq_bits_uop_iw_p2_speculative_child(_fpu_io_resp_bits_uop_iw_p2_speculative_child),
		.io_enq_bits_uop_iw_p1_bypass_hint(_fpu_io_resp_bits_uop_iw_p1_bypass_hint),
		.io_enq_bits_uop_iw_p2_bypass_hint(_fpu_io_resp_bits_uop_iw_p2_bypass_hint),
		.io_enq_bits_uop_iw_p3_bypass_hint(_fpu_io_resp_bits_uop_iw_p3_bypass_hint),
		.io_enq_bits_uop_dis_col_sel(_fpu_io_resp_bits_uop_dis_col_sel),
		.io_enq_bits_uop_br_mask(_fpu_io_resp_bits_uop_br_mask),
		.io_enq_bits_uop_br_tag(_fpu_io_resp_bits_uop_br_tag),
		.io_enq_bits_uop_br_type(_fpu_io_resp_bits_uop_br_type),
		.io_enq_bits_uop_is_sfb(_fpu_io_resp_bits_uop_is_sfb),
		.io_enq_bits_uop_is_fence(_fpu_io_resp_bits_uop_is_fence),
		.io_enq_bits_uop_is_fencei(_fpu_io_resp_bits_uop_is_fencei),
		.io_enq_bits_uop_is_sfence(_fpu_io_resp_bits_uop_is_sfence),
		.io_enq_bits_uop_is_amo(_fpu_io_resp_bits_uop_is_amo),
		.io_enq_bits_uop_is_eret(_fpu_io_resp_bits_uop_is_eret),
		.io_enq_bits_uop_is_sys_pc2epc(_fpu_io_resp_bits_uop_is_sys_pc2epc),
		.io_enq_bits_uop_is_rocc(_fpu_io_resp_bits_uop_is_rocc),
		.io_enq_bits_uop_is_mov(_fpu_io_resp_bits_uop_is_mov),
		.io_enq_bits_uop_ftq_idx(_fpu_io_resp_bits_uop_ftq_idx),
		.io_enq_bits_uop_edge_inst(_fpu_io_resp_bits_uop_edge_inst),
		.io_enq_bits_uop_pc_lob(_fpu_io_resp_bits_uop_pc_lob),
		.io_enq_bits_uop_taken(_fpu_io_resp_bits_uop_taken),
		.io_enq_bits_uop_imm_rename(_fpu_io_resp_bits_uop_imm_rename),
		.io_enq_bits_uop_imm_sel(_fpu_io_resp_bits_uop_imm_sel),
		.io_enq_bits_uop_pimm(_fpu_io_resp_bits_uop_pimm),
		.io_enq_bits_uop_imm_packed(_fpu_io_resp_bits_uop_imm_packed),
		.io_enq_bits_uop_op1_sel(_fpu_io_resp_bits_uop_op1_sel),
		.io_enq_bits_uop_op2_sel(_fpu_io_resp_bits_uop_op2_sel),
		.io_enq_bits_uop_fp_ctrl_ldst(_fpu_io_resp_bits_uop_fp_ctrl_ldst),
		.io_enq_bits_uop_fp_ctrl_wen(_fpu_io_resp_bits_uop_fp_ctrl_wen),
		.io_enq_bits_uop_fp_ctrl_ren1(_fpu_io_resp_bits_uop_fp_ctrl_ren1),
		.io_enq_bits_uop_fp_ctrl_ren2(_fpu_io_resp_bits_uop_fp_ctrl_ren2),
		.io_enq_bits_uop_fp_ctrl_ren3(_fpu_io_resp_bits_uop_fp_ctrl_ren3),
		.io_enq_bits_uop_fp_ctrl_swap12(_fpu_io_resp_bits_uop_fp_ctrl_swap12),
		.io_enq_bits_uop_fp_ctrl_swap23(_fpu_io_resp_bits_uop_fp_ctrl_swap23),
		.io_enq_bits_uop_fp_ctrl_typeTagIn(_fpu_io_resp_bits_uop_fp_ctrl_typeTagIn),
		.io_enq_bits_uop_fp_ctrl_typeTagOut(_fpu_io_resp_bits_uop_fp_ctrl_typeTagOut),
		.io_enq_bits_uop_fp_ctrl_fromint(_fpu_io_resp_bits_uop_fp_ctrl_fromint),
		.io_enq_bits_uop_fp_ctrl_toint(_fpu_io_resp_bits_uop_fp_ctrl_toint),
		.io_enq_bits_uop_fp_ctrl_fastpipe(_fpu_io_resp_bits_uop_fp_ctrl_fastpipe),
		.io_enq_bits_uop_fp_ctrl_fma(_fpu_io_resp_bits_uop_fp_ctrl_fma),
		.io_enq_bits_uop_fp_ctrl_div(_fpu_io_resp_bits_uop_fp_ctrl_div),
		.io_enq_bits_uop_fp_ctrl_sqrt(_fpu_io_resp_bits_uop_fp_ctrl_sqrt),
		.io_enq_bits_uop_fp_ctrl_wflags(_fpu_io_resp_bits_uop_fp_ctrl_wflags),
		.io_enq_bits_uop_fp_ctrl_vec(_fpu_io_resp_bits_uop_fp_ctrl_vec),
		.io_enq_bits_uop_rob_idx(_fpu_io_resp_bits_uop_rob_idx),
		.io_enq_bits_uop_ldq_idx(_fpu_io_resp_bits_uop_ldq_idx),
		.io_enq_bits_uop_stq_idx(_fpu_io_resp_bits_uop_stq_idx),
		.io_enq_bits_uop_rxq_idx(_fpu_io_resp_bits_uop_rxq_idx),
		.io_enq_bits_uop_pdst(_fpu_io_resp_bits_uop_pdst),
		.io_enq_bits_uop_prs1(_fpu_io_resp_bits_uop_prs1),
		.io_enq_bits_uop_prs2(_fpu_io_resp_bits_uop_prs2),
		.io_enq_bits_uop_prs3(_fpu_io_resp_bits_uop_prs3),
		.io_enq_bits_uop_ppred(_fpu_io_resp_bits_uop_ppred),
		.io_enq_bits_uop_prs1_busy(_fpu_io_resp_bits_uop_prs1_busy),
		.io_enq_bits_uop_prs2_busy(_fpu_io_resp_bits_uop_prs2_busy),
		.io_enq_bits_uop_prs3_busy(_fpu_io_resp_bits_uop_prs3_busy),
		.io_enq_bits_uop_ppred_busy(_fpu_io_resp_bits_uop_ppred_busy),
		.io_enq_bits_uop_stale_pdst(_fpu_io_resp_bits_uop_stale_pdst),
		.io_enq_bits_uop_exception(_fpu_io_resp_bits_uop_exception),
		.io_enq_bits_uop_exc_cause(_fpu_io_resp_bits_uop_exc_cause),
		.io_enq_bits_uop_mem_cmd(_fpu_io_resp_bits_uop_mem_cmd),
		.io_enq_bits_uop_mem_size(_fpu_io_resp_bits_uop_mem_size),
		.io_enq_bits_uop_mem_signed(_fpu_io_resp_bits_uop_mem_signed),
		.io_enq_bits_uop_uses_ldq(_fpu_io_resp_bits_uop_uses_ldq),
		.io_enq_bits_uop_uses_stq(_fpu_io_resp_bits_uop_uses_stq),
		.io_enq_bits_uop_is_unique(_fpu_io_resp_bits_uop_is_unique),
		.io_enq_bits_uop_flush_on_commit(_fpu_io_resp_bits_uop_flush_on_commit),
		.io_enq_bits_uop_csr_cmd(_fpu_io_resp_bits_uop_csr_cmd),
		.io_enq_bits_uop_ldst_is_rs1(_fpu_io_resp_bits_uop_ldst_is_rs1),
		.io_enq_bits_uop_ldst(_fpu_io_resp_bits_uop_ldst),
		.io_enq_bits_uop_lrs1(_fpu_io_resp_bits_uop_lrs1),
		.io_enq_bits_uop_lrs2(_fpu_io_resp_bits_uop_lrs2),
		.io_enq_bits_uop_lrs3(_fpu_io_resp_bits_uop_lrs3),
		.io_enq_bits_uop_dst_rtype(_fpu_io_resp_bits_uop_dst_rtype),
		.io_enq_bits_uop_lrs1_rtype(_fpu_io_resp_bits_uop_lrs1_rtype),
		.io_enq_bits_uop_lrs2_rtype(_fpu_io_resp_bits_uop_lrs2_rtype),
		.io_enq_bits_uop_frs3_en(_fpu_io_resp_bits_uop_frs3_en),
		.io_enq_bits_uop_fcn_dw(_fpu_io_resp_bits_uop_fcn_dw),
		.io_enq_bits_uop_fcn_op(_fpu_io_resp_bits_uop_fcn_op),
		.io_enq_bits_uop_fp_val(_fpu_io_resp_bits_uop_fp_val),
		.io_enq_bits_uop_fp_rm(_fpu_io_resp_bits_uop_fp_rm),
		.io_enq_bits_uop_fp_typ(_fpu_io_resp_bits_uop_fp_typ),
		.io_enq_bits_uop_xcpt_pf_if(_fpu_io_resp_bits_uop_xcpt_pf_if),
		.io_enq_bits_uop_xcpt_ae_if(_fpu_io_resp_bits_uop_xcpt_ae_if),
		.io_enq_bits_uop_xcpt_ma_if(_fpu_io_resp_bits_uop_xcpt_ma_if),
		.io_enq_bits_uop_bp_debug_if(_fpu_io_resp_bits_uop_bp_debug_if),
		.io_enq_bits_uop_bp_xcpt_if(_fpu_io_resp_bits_uop_bp_xcpt_if),
		.io_enq_bits_uop_debug_fsrc(_fpu_io_resp_bits_uop_debug_fsrc),
		.io_enq_bits_uop_debug_tsrc(_fpu_io_resp_bits_uop_debug_tsrc),
		.io_enq_bits_data(_fpu_io_resp_bits_data),
		.io_enq_bits_fflags_valid(_fpu_io_resp_bits_fflags_valid),
		.io_enq_bits_fflags_bits(_fpu_io_resp_bits_fflags_bits),
		.io_deq_ready(io_fpiu_resp_ready),
		.io_deq_valid(io_fpiu_resp_valid),
		.io_deq_bits_uop_br_mask(io_fpiu_resp_bits_uop_br_mask),
		.io_deq_bits_uop_rob_idx(io_fpiu_resp_bits_uop_rob_idx),
		.io_deq_bits_uop_pdst(io_fpiu_resp_bits_uop_pdst),
		.io_deq_bits_uop_dst_rtype(io_fpiu_resp_bits_uop_dst_rtype),
		.io_deq_bits_data(_queue_io_deq_bits_data),
		.io_deq_bits_predicated(io_fpiu_resp_bits_predicated),
		.io_deq_bits_fflags_valid(io_fpiu_resp_bits_fflags_valid),
		.io_deq_bits_fflags_bits(io_fpiu_resp_bits_fflags_bits),
		.io_brupdate_b1_resolve_mask(io_brupdate_b1_resolve_mask),
		.io_brupdate_b1_mispredict_mask(io_brupdate_b1_mispredict_mask),
		.io_flush(io_kill),
		.io_count(_queue_io_count)
	);
	assign io_ready_fu_types_7 = ((_io_fdiv_resp_fdivsqrt_io_req_ready & ~_io_fdiv_resp_fdivsqrt_ready_T) & ~(rrd_uop_valid & rrd_uop_bits_fu_code_7)) & ~(arb_uop_valid & arb_uop_bits_fu_code_7);
	assign io_ready_fu_types_9 = fpiu_ready_REG;
	assign io_arb_frf_reqs_0_valid = (arb_uop_valid & (arb_uop_bits_lrs1_rtype == 2'h1)) & ~arb_uop_bits_iw_p1_bypass_hint;
	assign io_arb_frf_reqs_0_bits = arb_uop_bits_prs1;
	assign io_arb_frf_reqs_1_valid = (arb_uop_valid & (arb_uop_bits_lrs2_rtype == 2'h1)) & ~arb_uop_bits_iw_p2_bypass_hint;
	assign io_arb_frf_reqs_1_bits = arb_uop_bits_prs2;
	assign io_arb_frf_reqs_2_valid = io_arb_frf_reqs_2_valid_0;
	assign io_arb_frf_reqs_2_bits = arb_uop_bits_prs3;
	assign io_squash_iss = _io_squash_iss_output;
	assign io_wakeup_valid = fast_wakeups_1_REG_valid;
	assign io_wakeup_bits_uop_pdst = fast_wakeups_1_REG_bits_uop_pdst;
	assign io_wakeup_bits_uop_dst_rtype = fast_wakeups_1_REG_bits_uop_dst_rtype;
	assign io_fpu_resp_valid = _fpu_io_resp_valid & ~_fpu_io_resp_bits_uop_fu_code_9;
	assign io_fpu_resp_bits_uop_rob_idx = _fpu_io_resp_bits_uop_rob_idx;
	assign io_fpu_resp_bits_uop_pdst = _fpu_io_resp_bits_uop_pdst;
	assign io_fpu_resp_bits_uop_dst_rtype = _fpu_io_resp_bits_uop_dst_rtype;
	assign io_fpu_resp_bits_data = _fpu_io_resp_bits_data;
	assign io_fpu_resp_bits_fflags_valid = _fpu_io_resp_bits_fflags_valid;
	assign io_fpu_resp_bits_fflags_bits = _fpu_io_resp_bits_fflags_bits;
	assign io_fpiu_resp_bits_data = _queue_io_deq_bits_data[63:0];
	assign io_dgen_valid = dgen_valid_REG;
	assign io_dgen_bits_uop_stq_idx = dgen_bits_uop_REG_stq_idx;
	assign io_dgen_bits_data = dgen_bits_data_REG;
endmodule
