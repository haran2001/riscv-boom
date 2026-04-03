module RenameStage (
	clock,
	reset,
	io_ren_stalls_0,
	io_kill,
	io_dec_fire_0,
	io_dec_uops_0_inst,
	io_dec_uops_0_debug_inst,
	io_dec_uops_0_is_rvc,
	io_dec_uops_0_debug_pc,
	io_dec_uops_0_iq_type_0,
	io_dec_uops_0_iq_type_1,
	io_dec_uops_0_iq_type_2,
	io_dec_uops_0_iq_type_3,
	io_dec_uops_0_fu_code_0,
	io_dec_uops_0_fu_code_1,
	io_dec_uops_0_fu_code_2,
	io_dec_uops_0_fu_code_3,
	io_dec_uops_0_fu_code_4,
	io_dec_uops_0_fu_code_5,
	io_dec_uops_0_fu_code_6,
	io_dec_uops_0_fu_code_7,
	io_dec_uops_0_fu_code_8,
	io_dec_uops_0_fu_code_9,
	io_dec_uops_0_br_mask,
	io_dec_uops_0_br_tag,
	io_dec_uops_0_br_type,
	io_dec_uops_0_is_sfb,
	io_dec_uops_0_is_fence,
	io_dec_uops_0_is_fencei,
	io_dec_uops_0_is_sfence,
	io_dec_uops_0_is_amo,
	io_dec_uops_0_is_eret,
	io_dec_uops_0_is_sys_pc2epc,
	io_dec_uops_0_is_rocc,
	io_dec_uops_0_is_mov,
	io_dec_uops_0_ftq_idx,
	io_dec_uops_0_edge_inst,
	io_dec_uops_0_pc_lob,
	io_dec_uops_0_taken,
	io_dec_uops_0_imm_rename,
	io_dec_uops_0_imm_packed,
	io_dec_uops_0_op1_sel,
	io_dec_uops_0_op2_sel,
	io_dec_uops_0_fp_ctrl_ldst,
	io_dec_uops_0_fp_ctrl_wen,
	io_dec_uops_0_fp_ctrl_ren1,
	io_dec_uops_0_fp_ctrl_ren2,
	io_dec_uops_0_fp_ctrl_ren3,
	io_dec_uops_0_fp_ctrl_swap12,
	io_dec_uops_0_fp_ctrl_swap23,
	io_dec_uops_0_fp_ctrl_typeTagIn,
	io_dec_uops_0_fp_ctrl_typeTagOut,
	io_dec_uops_0_fp_ctrl_fromint,
	io_dec_uops_0_fp_ctrl_toint,
	io_dec_uops_0_fp_ctrl_fastpipe,
	io_dec_uops_0_fp_ctrl_fma,
	io_dec_uops_0_fp_ctrl_div,
	io_dec_uops_0_fp_ctrl_sqrt,
	io_dec_uops_0_fp_ctrl_wflags,
	io_dec_uops_0_exception,
	io_dec_uops_0_exc_cause,
	io_dec_uops_0_mem_cmd,
	io_dec_uops_0_mem_size,
	io_dec_uops_0_mem_signed,
	io_dec_uops_0_uses_ldq,
	io_dec_uops_0_uses_stq,
	io_dec_uops_0_is_unique,
	io_dec_uops_0_flush_on_commit,
	io_dec_uops_0_csr_cmd,
	io_dec_uops_0_ldst_is_rs1,
	io_dec_uops_0_ldst,
	io_dec_uops_0_lrs1,
	io_dec_uops_0_lrs2,
	io_dec_uops_0_lrs3,
	io_dec_uops_0_dst_rtype,
	io_dec_uops_0_lrs1_rtype,
	io_dec_uops_0_lrs2_rtype,
	io_dec_uops_0_frs3_en,
	io_dec_uops_0_fcn_dw,
	io_dec_uops_0_fcn_op,
	io_dec_uops_0_fp_val,
	io_dec_uops_0_fp_rm,
	io_dec_uops_0_fp_typ,
	io_dec_uops_0_xcpt_pf_if,
	io_dec_uops_0_xcpt_ae_if,
	io_dec_uops_0_bp_debug_if,
	io_dec_uops_0_bp_xcpt_if,
	io_dec_uops_0_debug_fsrc,
	io_ren2_mask_0,
	io_ren2_uops_0_inst,
	io_ren2_uops_0_debug_inst,
	io_ren2_uops_0_is_rvc,
	io_ren2_uops_0_debug_pc,
	io_ren2_uops_0_iq_type_0,
	io_ren2_uops_0_iq_type_1,
	io_ren2_uops_0_iq_type_2,
	io_ren2_uops_0_iq_type_3,
	io_ren2_uops_0_fu_code_0,
	io_ren2_uops_0_fu_code_1,
	io_ren2_uops_0_fu_code_2,
	io_ren2_uops_0_fu_code_3,
	io_ren2_uops_0_fu_code_4,
	io_ren2_uops_0_fu_code_5,
	io_ren2_uops_0_fu_code_6,
	io_ren2_uops_0_fu_code_7,
	io_ren2_uops_0_fu_code_8,
	io_ren2_uops_0_fu_code_9,
	io_ren2_uops_0_iw_issued,
	io_ren2_uops_0_iw_issued_partial_agen,
	io_ren2_uops_0_iw_issued_partial_dgen,
	io_ren2_uops_0_iw_p1_speculative_child,
	io_ren2_uops_0_iw_p2_speculative_child,
	io_ren2_uops_0_iw_p1_bypass_hint,
	io_ren2_uops_0_iw_p2_bypass_hint,
	io_ren2_uops_0_iw_p3_bypass_hint,
	io_ren2_uops_0_br_mask,
	io_ren2_uops_0_br_tag,
	io_ren2_uops_0_br_type,
	io_ren2_uops_0_is_sfb,
	io_ren2_uops_0_is_fence,
	io_ren2_uops_0_is_fencei,
	io_ren2_uops_0_is_sfence,
	io_ren2_uops_0_is_amo,
	io_ren2_uops_0_is_eret,
	io_ren2_uops_0_is_sys_pc2epc,
	io_ren2_uops_0_is_rocc,
	io_ren2_uops_0_is_mov,
	io_ren2_uops_0_ftq_idx,
	io_ren2_uops_0_edge_inst,
	io_ren2_uops_0_pc_lob,
	io_ren2_uops_0_taken,
	io_ren2_uops_0_imm_rename,
	io_ren2_uops_0_imm_packed,
	io_ren2_uops_0_op1_sel,
	io_ren2_uops_0_op2_sel,
	io_ren2_uops_0_fp_ctrl_ldst,
	io_ren2_uops_0_fp_ctrl_wen,
	io_ren2_uops_0_fp_ctrl_ren1,
	io_ren2_uops_0_fp_ctrl_ren2,
	io_ren2_uops_0_fp_ctrl_ren3,
	io_ren2_uops_0_fp_ctrl_swap12,
	io_ren2_uops_0_fp_ctrl_swap23,
	io_ren2_uops_0_fp_ctrl_typeTagIn,
	io_ren2_uops_0_fp_ctrl_typeTagOut,
	io_ren2_uops_0_fp_ctrl_fromint,
	io_ren2_uops_0_fp_ctrl_toint,
	io_ren2_uops_0_fp_ctrl_fastpipe,
	io_ren2_uops_0_fp_ctrl_fma,
	io_ren2_uops_0_fp_ctrl_div,
	io_ren2_uops_0_fp_ctrl_sqrt,
	io_ren2_uops_0_fp_ctrl_wflags,
	io_ren2_uops_0_fp_ctrl_vec,
	io_ren2_uops_0_rxq_idx,
	io_ren2_uops_0_pdst,
	io_ren2_uops_0_prs1,
	io_ren2_uops_0_prs2,
	io_ren2_uops_0_prs1_busy,
	io_ren2_uops_0_prs2_busy,
	io_ren2_uops_0_stale_pdst,
	io_ren2_uops_0_exception,
	io_ren2_uops_0_exc_cause,
	io_ren2_uops_0_mem_cmd,
	io_ren2_uops_0_mem_size,
	io_ren2_uops_0_mem_signed,
	io_ren2_uops_0_uses_ldq,
	io_ren2_uops_0_uses_stq,
	io_ren2_uops_0_is_unique,
	io_ren2_uops_0_flush_on_commit,
	io_ren2_uops_0_csr_cmd,
	io_ren2_uops_0_ldst_is_rs1,
	io_ren2_uops_0_ldst,
	io_ren2_uops_0_lrs1,
	io_ren2_uops_0_lrs2,
	io_ren2_uops_0_lrs3,
	io_ren2_uops_0_dst_rtype,
	io_ren2_uops_0_lrs1_rtype,
	io_ren2_uops_0_lrs2_rtype,
	io_ren2_uops_0_frs3_en,
	io_ren2_uops_0_fcn_dw,
	io_ren2_uops_0_fcn_op,
	io_ren2_uops_0_fp_val,
	io_ren2_uops_0_fp_rm,
	io_ren2_uops_0_fp_typ,
	io_ren2_uops_0_xcpt_pf_if,
	io_ren2_uops_0_xcpt_ae_if,
	io_ren2_uops_0_xcpt_ma_if,
	io_ren2_uops_0_bp_debug_if,
	io_ren2_uops_0_bp_xcpt_if,
	io_ren2_uops_0_debug_fsrc,
	io_ren2_uops_0_debug_tsrc,
	io_brupdate_b1_resolve_mask,
	io_brupdate_b2_uop_br_tag,
	io_brupdate_b2_mispredict,
	io_dis_fire_0,
	io_dis_ready,
	io_wakeups_0_valid,
	io_wakeups_0_bits_uop_pdst,
	io_wakeups_0_bits_uop_dst_rtype,
	io_wakeups_0_bits_rebusy,
	io_wakeups_1_valid,
	io_wakeups_1_bits_uop_pdst,
	io_wakeups_1_bits_uop_dst_rtype,
	io_wakeups_2_valid,
	io_wakeups_2_bits_uop_pdst,
	io_wakeups_2_bits_uop_dst_rtype,
	io_child_rebusys,
	io_com_valids_0,
	io_com_uops_0_pdst,
	io_com_uops_0_stale_pdst,
	io_com_uops_0_ldst,
	io_com_uops_0_dst_rtype,
	io_rollback
);
	input clock;
	input reset;
	output wire io_ren_stalls_0;
	input io_kill;
	input io_dec_fire_0;
	input [31:0] io_dec_uops_0_inst;
	input [31:0] io_dec_uops_0_debug_inst;
	input io_dec_uops_0_is_rvc;
	input [39:0] io_dec_uops_0_debug_pc;
	input io_dec_uops_0_iq_type_0;
	input io_dec_uops_0_iq_type_1;
	input io_dec_uops_0_iq_type_2;
	input io_dec_uops_0_iq_type_3;
	input io_dec_uops_0_fu_code_0;
	input io_dec_uops_0_fu_code_1;
	input io_dec_uops_0_fu_code_2;
	input io_dec_uops_0_fu_code_3;
	input io_dec_uops_0_fu_code_4;
	input io_dec_uops_0_fu_code_5;
	input io_dec_uops_0_fu_code_6;
	input io_dec_uops_0_fu_code_7;
	input io_dec_uops_0_fu_code_8;
	input io_dec_uops_0_fu_code_9;
	input [7:0] io_dec_uops_0_br_mask;
	input [2:0] io_dec_uops_0_br_tag;
	input [3:0] io_dec_uops_0_br_type;
	input io_dec_uops_0_is_sfb;
	input io_dec_uops_0_is_fence;
	input io_dec_uops_0_is_fencei;
	input io_dec_uops_0_is_sfence;
	input io_dec_uops_0_is_amo;
	input io_dec_uops_0_is_eret;
	input io_dec_uops_0_is_sys_pc2epc;
	input io_dec_uops_0_is_rocc;
	input io_dec_uops_0_is_mov;
	input [3:0] io_dec_uops_0_ftq_idx;
	input io_dec_uops_0_edge_inst;
	input [5:0] io_dec_uops_0_pc_lob;
	input io_dec_uops_0_taken;
	input io_dec_uops_0_imm_rename;
	input [19:0] io_dec_uops_0_imm_packed;
	input [1:0] io_dec_uops_0_op1_sel;
	input [2:0] io_dec_uops_0_op2_sel;
	input io_dec_uops_0_fp_ctrl_ldst;
	input io_dec_uops_0_fp_ctrl_wen;
	input io_dec_uops_0_fp_ctrl_ren1;
	input io_dec_uops_0_fp_ctrl_ren2;
	input io_dec_uops_0_fp_ctrl_ren3;
	input io_dec_uops_0_fp_ctrl_swap12;
	input io_dec_uops_0_fp_ctrl_swap23;
	input [1:0] io_dec_uops_0_fp_ctrl_typeTagIn;
	input [1:0] io_dec_uops_0_fp_ctrl_typeTagOut;
	input io_dec_uops_0_fp_ctrl_fromint;
	input io_dec_uops_0_fp_ctrl_toint;
	input io_dec_uops_0_fp_ctrl_fastpipe;
	input io_dec_uops_0_fp_ctrl_fma;
	input io_dec_uops_0_fp_ctrl_div;
	input io_dec_uops_0_fp_ctrl_sqrt;
	input io_dec_uops_0_fp_ctrl_wflags;
	input io_dec_uops_0_exception;
	input [63:0] io_dec_uops_0_exc_cause;
	input [4:0] io_dec_uops_0_mem_cmd;
	input [1:0] io_dec_uops_0_mem_size;
	input io_dec_uops_0_mem_signed;
	input io_dec_uops_0_uses_ldq;
	input io_dec_uops_0_uses_stq;
	input io_dec_uops_0_is_unique;
	input io_dec_uops_0_flush_on_commit;
	input [2:0] io_dec_uops_0_csr_cmd;
	input io_dec_uops_0_ldst_is_rs1;
	input [5:0] io_dec_uops_0_ldst;
	input [5:0] io_dec_uops_0_lrs1;
	input [5:0] io_dec_uops_0_lrs2;
	input [5:0] io_dec_uops_0_lrs3;
	input [1:0] io_dec_uops_0_dst_rtype;
	input [1:0] io_dec_uops_0_lrs1_rtype;
	input [1:0] io_dec_uops_0_lrs2_rtype;
	input io_dec_uops_0_frs3_en;
	input io_dec_uops_0_fcn_dw;
	input [4:0] io_dec_uops_0_fcn_op;
	input io_dec_uops_0_fp_val;
	input [2:0] io_dec_uops_0_fp_rm;
	input [1:0] io_dec_uops_0_fp_typ;
	input io_dec_uops_0_xcpt_pf_if;
	input io_dec_uops_0_xcpt_ae_if;
	input io_dec_uops_0_bp_debug_if;
	input io_dec_uops_0_bp_xcpt_if;
	input [2:0] io_dec_uops_0_debug_fsrc;
	output wire io_ren2_mask_0;
	output wire [31:0] io_ren2_uops_0_inst;
	output wire [31:0] io_ren2_uops_0_debug_inst;
	output wire io_ren2_uops_0_is_rvc;
	output wire [39:0] io_ren2_uops_0_debug_pc;
	output wire io_ren2_uops_0_iq_type_0;
	output wire io_ren2_uops_0_iq_type_1;
	output wire io_ren2_uops_0_iq_type_2;
	output wire io_ren2_uops_0_iq_type_3;
	output wire io_ren2_uops_0_fu_code_0;
	output wire io_ren2_uops_0_fu_code_1;
	output wire io_ren2_uops_0_fu_code_2;
	output wire io_ren2_uops_0_fu_code_3;
	output wire io_ren2_uops_0_fu_code_4;
	output wire io_ren2_uops_0_fu_code_5;
	output wire io_ren2_uops_0_fu_code_6;
	output wire io_ren2_uops_0_fu_code_7;
	output wire io_ren2_uops_0_fu_code_8;
	output wire io_ren2_uops_0_fu_code_9;
	output wire io_ren2_uops_0_iw_issued;
	output wire io_ren2_uops_0_iw_issued_partial_agen;
	output wire io_ren2_uops_0_iw_issued_partial_dgen;
	output wire io_ren2_uops_0_iw_p1_speculative_child;
	output wire io_ren2_uops_0_iw_p2_speculative_child;
	output wire io_ren2_uops_0_iw_p1_bypass_hint;
	output wire io_ren2_uops_0_iw_p2_bypass_hint;
	output wire io_ren2_uops_0_iw_p3_bypass_hint;
	output wire [7:0] io_ren2_uops_0_br_mask;
	output wire [2:0] io_ren2_uops_0_br_tag;
	output wire [3:0] io_ren2_uops_0_br_type;
	output wire io_ren2_uops_0_is_sfb;
	output wire io_ren2_uops_0_is_fence;
	output wire io_ren2_uops_0_is_fencei;
	output wire io_ren2_uops_0_is_sfence;
	output wire io_ren2_uops_0_is_amo;
	output wire io_ren2_uops_0_is_eret;
	output wire io_ren2_uops_0_is_sys_pc2epc;
	output wire io_ren2_uops_0_is_rocc;
	output wire io_ren2_uops_0_is_mov;
	output wire [3:0] io_ren2_uops_0_ftq_idx;
	output wire io_ren2_uops_0_edge_inst;
	output wire [5:0] io_ren2_uops_0_pc_lob;
	output wire io_ren2_uops_0_taken;
	output wire io_ren2_uops_0_imm_rename;
	output wire [19:0] io_ren2_uops_0_imm_packed;
	output wire [1:0] io_ren2_uops_0_op1_sel;
	output wire [2:0] io_ren2_uops_0_op2_sel;
	output wire io_ren2_uops_0_fp_ctrl_ldst;
	output wire io_ren2_uops_0_fp_ctrl_wen;
	output wire io_ren2_uops_0_fp_ctrl_ren1;
	output wire io_ren2_uops_0_fp_ctrl_ren2;
	output wire io_ren2_uops_0_fp_ctrl_ren3;
	output wire io_ren2_uops_0_fp_ctrl_swap12;
	output wire io_ren2_uops_0_fp_ctrl_swap23;
	output wire [1:0] io_ren2_uops_0_fp_ctrl_typeTagIn;
	output wire [1:0] io_ren2_uops_0_fp_ctrl_typeTagOut;
	output wire io_ren2_uops_0_fp_ctrl_fromint;
	output wire io_ren2_uops_0_fp_ctrl_toint;
	output wire io_ren2_uops_0_fp_ctrl_fastpipe;
	output wire io_ren2_uops_0_fp_ctrl_fma;
	output wire io_ren2_uops_0_fp_ctrl_div;
	output wire io_ren2_uops_0_fp_ctrl_sqrt;
	output wire io_ren2_uops_0_fp_ctrl_wflags;
	output wire io_ren2_uops_0_fp_ctrl_vec;
	output wire [1:0] io_ren2_uops_0_rxq_idx;
	output wire [5:0] io_ren2_uops_0_pdst;
	output wire [5:0] io_ren2_uops_0_prs1;
	output wire [5:0] io_ren2_uops_0_prs2;
	output wire io_ren2_uops_0_prs1_busy;
	output wire io_ren2_uops_0_prs2_busy;
	output wire [5:0] io_ren2_uops_0_stale_pdst;
	output wire io_ren2_uops_0_exception;
	output wire [63:0] io_ren2_uops_0_exc_cause;
	output wire [4:0] io_ren2_uops_0_mem_cmd;
	output wire [1:0] io_ren2_uops_0_mem_size;
	output wire io_ren2_uops_0_mem_signed;
	output wire io_ren2_uops_0_uses_ldq;
	output wire io_ren2_uops_0_uses_stq;
	output wire io_ren2_uops_0_is_unique;
	output wire io_ren2_uops_0_flush_on_commit;
	output wire [2:0] io_ren2_uops_0_csr_cmd;
	output wire io_ren2_uops_0_ldst_is_rs1;
	output wire [5:0] io_ren2_uops_0_ldst;
	output wire [5:0] io_ren2_uops_0_lrs1;
	output wire [5:0] io_ren2_uops_0_lrs2;
	output wire [5:0] io_ren2_uops_0_lrs3;
	output wire [1:0] io_ren2_uops_0_dst_rtype;
	output wire [1:0] io_ren2_uops_0_lrs1_rtype;
	output wire [1:0] io_ren2_uops_0_lrs2_rtype;
	output wire io_ren2_uops_0_frs3_en;
	output wire io_ren2_uops_0_fcn_dw;
	output wire [4:0] io_ren2_uops_0_fcn_op;
	output wire io_ren2_uops_0_fp_val;
	output wire [2:0] io_ren2_uops_0_fp_rm;
	output wire [1:0] io_ren2_uops_0_fp_typ;
	output wire io_ren2_uops_0_xcpt_pf_if;
	output wire io_ren2_uops_0_xcpt_ae_if;
	output wire io_ren2_uops_0_xcpt_ma_if;
	output wire io_ren2_uops_0_bp_debug_if;
	output wire io_ren2_uops_0_bp_xcpt_if;
	output wire [2:0] io_ren2_uops_0_debug_fsrc;
	output wire [2:0] io_ren2_uops_0_debug_tsrc;
	input [7:0] io_brupdate_b1_resolve_mask;
	input [2:0] io_brupdate_b2_uop_br_tag;
	input io_brupdate_b2_mispredict;
	input io_dis_fire_0;
	input io_dis_ready;
	input io_wakeups_0_valid;
	input [5:0] io_wakeups_0_bits_uop_pdst;
	input [1:0] io_wakeups_0_bits_uop_dst_rtype;
	input io_wakeups_0_bits_rebusy;
	input io_wakeups_1_valid;
	input [5:0] io_wakeups_1_bits_uop_pdst;
	input [1:0] io_wakeups_1_bits_uop_dst_rtype;
	input io_wakeups_2_valid;
	input [5:0] io_wakeups_2_bits_uop_pdst;
	input [1:0] io_wakeups_2_bits_uop_dst_rtype;
	input io_child_rebusys;
	input io_com_valids_0;
	input [5:0] io_com_uops_0_pdst;
	input [5:0] io_com_uops_0_stale_pdst;
	input [5:0] io_com_uops_0_ldst;
	input [1:0] io_com_uops_0_dst_rtype;
	input io_rollback;
	wire _io_ren_stalls_0_T;
	reg r_valid;
	wire _busytable_io_busy_resps_0_prs1_busy;
	wire _busytable_io_busy_resps_0_prs2_busy;
	wire _freelist_io_alloc_pregs_0_valid;
	wire [5:0] _freelist_io_alloc_pregs_0_bits;
	wire [51:0] _freelist_io_debug_freelist;
	wire [5:0] _maptable_io_map_resps_0_prs1;
	wire [5:0] _maptable_io_map_resps_0_prs2;
	wire [5:0] _maptable_io_map_resps_0_stale_pdst;
	wire ren2_alloc_fire_0 = (io_dis_fire_0 & _io_ren_stalls_0_T) & r_valid;
	reg [31:0] r_uop_inst;
	reg [31:0] r_uop_debug_inst;
	reg r_uop_is_rvc;
	reg [39:0] r_uop_debug_pc;
	reg r_uop_iq_type_0;
	reg r_uop_iq_type_1;
	reg r_uop_iq_type_2;
	reg r_uop_iq_type_3;
	reg r_uop_fu_code_0;
	reg r_uop_fu_code_1;
	reg r_uop_fu_code_2;
	reg r_uop_fu_code_3;
	reg r_uop_fu_code_4;
	reg r_uop_fu_code_5;
	reg r_uop_fu_code_6;
	reg r_uop_fu_code_7;
	reg r_uop_fu_code_8;
	reg r_uop_fu_code_9;
	reg r_uop_iw_issued;
	reg r_uop_iw_issued_partial_agen;
	reg r_uop_iw_issued_partial_dgen;
	reg r_uop_iw_p1_speculative_child;
	reg r_uop_iw_p2_speculative_child;
	reg r_uop_iw_p1_bypass_hint;
	reg r_uop_iw_p2_bypass_hint;
	reg r_uop_iw_p3_bypass_hint;
	reg [7:0] r_uop_br_mask;
	reg [2:0] r_uop_br_tag;
	reg [3:0] r_uop_br_type;
	reg r_uop_is_sfb;
	reg r_uop_is_fence;
	reg r_uop_is_fencei;
	reg r_uop_is_sfence;
	reg r_uop_is_amo;
	reg r_uop_is_eret;
	reg r_uop_is_sys_pc2epc;
	reg r_uop_is_rocc;
	reg r_uop_is_mov;
	reg [3:0] r_uop_ftq_idx;
	reg r_uop_edge_inst;
	reg [5:0] r_uop_pc_lob;
	reg r_uop_taken;
	reg r_uop_imm_rename;
	reg [19:0] r_uop_imm_packed;
	reg [1:0] r_uop_op1_sel;
	reg [2:0] r_uop_op2_sel;
	reg r_uop_fp_ctrl_ldst;
	reg r_uop_fp_ctrl_wen;
	reg r_uop_fp_ctrl_ren1;
	reg r_uop_fp_ctrl_ren2;
	reg r_uop_fp_ctrl_ren3;
	reg r_uop_fp_ctrl_swap12;
	reg r_uop_fp_ctrl_swap23;
	reg [1:0] r_uop_fp_ctrl_typeTagIn;
	reg [1:0] r_uop_fp_ctrl_typeTagOut;
	reg r_uop_fp_ctrl_fromint;
	reg r_uop_fp_ctrl_toint;
	reg r_uop_fp_ctrl_fastpipe;
	reg r_uop_fp_ctrl_fma;
	reg r_uop_fp_ctrl_div;
	reg r_uop_fp_ctrl_sqrt;
	reg r_uop_fp_ctrl_wflags;
	reg r_uop_fp_ctrl_vec;
	reg [1:0] r_uop_rxq_idx;
	reg [5:0] r_uop_prs1;
	reg [5:0] r_uop_prs2;
	reg [5:0] r_uop_stale_pdst;
	reg r_uop_exception;
	reg [63:0] r_uop_exc_cause;
	reg [4:0] r_uop_mem_cmd;
	reg [1:0] r_uop_mem_size;
	reg r_uop_mem_signed;
	reg r_uop_uses_ldq;
	reg r_uop_uses_stq;
	reg r_uop_is_unique;
	reg r_uop_flush_on_commit;
	reg [2:0] r_uop_csr_cmd;
	reg r_uop_ldst_is_rs1;
	reg [5:0] r_uop_ldst;
	reg [5:0] r_uop_lrs1;
	reg [5:0] r_uop_lrs2;
	reg [5:0] r_uop_lrs3;
	reg [1:0] r_uop_dst_rtype;
	reg [1:0] r_uop_lrs1_rtype;
	reg [1:0] r_uop_lrs2_rtype;
	reg r_uop_frs3_en;
	reg r_uop_fcn_dw;
	reg [4:0] r_uop_fcn_op;
	reg r_uop_fp_val;
	reg [2:0] r_uop_fp_rm;
	reg [1:0] r_uop_fp_typ;
	reg r_uop_xcpt_pf_if;
	reg r_uop_xcpt_ae_if;
	reg r_uop_xcpt_ma_if;
	reg r_uop_bp_debug_if;
	reg r_uop_bp_xcpt_if;
	reg [2:0] r_uop_debug_fsrc;
	reg [2:0] r_uop_debug_tsrc;
	wire ren2_br_tags_1_valid = io_dis_fire_0 & ((((((((r_uop_br_type == 4'h1) | (r_uop_br_type == 4'h2)) | (r_uop_br_type == 4'h3)) | (r_uop_br_type == 4'h4)) | (r_uop_br_type == 4'h5)) | (r_uop_br_type == 4'h6)) & ~r_uop_is_sfb) | (r_uop_br_type == 4'h8));
	assign _io_ren_stalls_0_T = r_uop_dst_rtype == 2'h0;
	wire com_valids_0 = (io_com_uops_0_dst_rtype == 2'h0) & io_com_valids_0;
	reg REG;
	wire _ren2_uops_0_prs1_busy_T = r_uop_lrs1_rtype == 2'h0;
	wire _ren2_uops_0_prs2_busy_T = r_uop_lrs2_rtype == 2'h0;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg _GEN_1;
		_GEN_1 = io_kill | ~io_dis_ready;
		if (reset)
			r_valid <= 1'h0;
		else
			r_valid <= ~io_kill & (io_dis_ready ? io_dec_fire_0 : r_valid & ~io_dis_fire_0);
		if (_GEN_1)
			;
		else begin
			r_uop_inst <= io_dec_uops_0_inst;
			r_uop_debug_inst <= io_dec_uops_0_debug_inst;
			r_uop_is_rvc <= io_dec_uops_0_is_rvc;
			r_uop_debug_pc <= io_dec_uops_0_debug_pc;
			r_uop_iq_type_0 <= io_dec_uops_0_iq_type_0;
			r_uop_iq_type_1 <= io_dec_uops_0_iq_type_1;
			r_uop_iq_type_2 <= io_dec_uops_0_iq_type_2;
			r_uop_iq_type_3 <= io_dec_uops_0_iq_type_3;
			r_uop_fu_code_0 <= io_dec_uops_0_fu_code_0;
			r_uop_fu_code_1 <= io_dec_uops_0_fu_code_1;
			r_uop_fu_code_2 <= io_dec_uops_0_fu_code_2;
			r_uop_fu_code_3 <= io_dec_uops_0_fu_code_3;
			r_uop_fu_code_4 <= io_dec_uops_0_fu_code_4;
			r_uop_fu_code_5 <= io_dec_uops_0_fu_code_5;
			r_uop_fu_code_6 <= io_dec_uops_0_fu_code_6;
			r_uop_fu_code_7 <= io_dec_uops_0_fu_code_7;
			r_uop_fu_code_8 <= io_dec_uops_0_fu_code_8;
			r_uop_fu_code_9 <= io_dec_uops_0_fu_code_9;
		end
		r_uop_iw_issued <= _GEN_1 & r_uop_iw_issued;
		r_uop_iw_issued_partial_agen <= _GEN_1 & r_uop_iw_issued_partial_agen;
		r_uop_iw_issued_partial_dgen <= _GEN_1 & r_uop_iw_issued_partial_dgen;
		r_uop_iw_p1_speculative_child <= _GEN_1 & r_uop_iw_p1_speculative_child;
		r_uop_iw_p2_speculative_child <= _GEN_1 & r_uop_iw_p2_speculative_child;
		r_uop_iw_p1_bypass_hint <= _GEN_1 & r_uop_iw_p1_bypass_hint;
		r_uop_iw_p2_bypass_hint <= _GEN_1 & r_uop_iw_p2_bypass_hint;
		r_uop_iw_p3_bypass_hint <= _GEN_1 & r_uop_iw_p3_bypass_hint;
		r_uop_br_mask <= (_GEN_1 ? r_uop_br_mask : io_dec_uops_0_br_mask) & ~io_brupdate_b1_resolve_mask;
		if (_GEN_1)
			;
		else begin
			r_uop_br_tag <= io_dec_uops_0_br_tag;
			r_uop_br_type <= io_dec_uops_0_br_type;
			r_uop_is_sfb <= io_dec_uops_0_is_sfb;
			r_uop_is_fence <= io_dec_uops_0_is_fence;
			r_uop_is_fencei <= io_dec_uops_0_is_fencei;
			r_uop_is_sfence <= io_dec_uops_0_is_sfence;
			r_uop_is_amo <= io_dec_uops_0_is_amo;
			r_uop_is_eret <= io_dec_uops_0_is_eret;
			r_uop_is_sys_pc2epc <= io_dec_uops_0_is_sys_pc2epc;
			r_uop_is_rocc <= io_dec_uops_0_is_rocc;
			r_uop_is_mov <= io_dec_uops_0_is_mov;
			r_uop_ftq_idx <= io_dec_uops_0_ftq_idx;
			r_uop_edge_inst <= io_dec_uops_0_edge_inst;
			r_uop_pc_lob <= io_dec_uops_0_pc_lob;
			r_uop_taken <= io_dec_uops_0_taken;
			r_uop_imm_rename <= io_dec_uops_0_imm_rename;
			r_uop_imm_packed <= io_dec_uops_0_imm_packed;
			r_uop_op1_sel <= io_dec_uops_0_op1_sel;
			r_uop_op2_sel <= io_dec_uops_0_op2_sel;
			r_uop_fp_ctrl_ldst <= io_dec_uops_0_fp_ctrl_ldst;
			r_uop_fp_ctrl_wen <= io_dec_uops_0_fp_ctrl_wen;
			r_uop_fp_ctrl_ren1 <= io_dec_uops_0_fp_ctrl_ren1;
			r_uop_fp_ctrl_ren2 <= io_dec_uops_0_fp_ctrl_ren2;
			r_uop_fp_ctrl_ren3 <= io_dec_uops_0_fp_ctrl_ren3;
			r_uop_fp_ctrl_swap12 <= io_dec_uops_0_fp_ctrl_swap12;
			r_uop_fp_ctrl_swap23 <= io_dec_uops_0_fp_ctrl_swap23;
			r_uop_fp_ctrl_typeTagIn <= io_dec_uops_0_fp_ctrl_typeTagIn;
			r_uop_fp_ctrl_typeTagOut <= io_dec_uops_0_fp_ctrl_typeTagOut;
			r_uop_fp_ctrl_fromint <= io_dec_uops_0_fp_ctrl_fromint;
			r_uop_fp_ctrl_toint <= io_dec_uops_0_fp_ctrl_toint;
			r_uop_fp_ctrl_fastpipe <= io_dec_uops_0_fp_ctrl_fastpipe;
			r_uop_fp_ctrl_fma <= io_dec_uops_0_fp_ctrl_fma;
			r_uop_fp_ctrl_div <= io_dec_uops_0_fp_ctrl_div;
			r_uop_fp_ctrl_sqrt <= io_dec_uops_0_fp_ctrl_sqrt;
			r_uop_fp_ctrl_wflags <= io_dec_uops_0_fp_ctrl_wflags;
		end
		r_uop_fp_ctrl_vec <= _GEN_1 & r_uop_fp_ctrl_vec;
		if (_GEN_1)
			;
		else
			r_uop_rxq_idx <= 2'h0;
		if (ren2_alloc_fire_0 & (r_uop_ldst == (_GEN_1 ? r_uop_lrs1 : io_dec_uops_0_lrs1)))
			r_uop_prs1 <= _freelist_io_alloc_pregs_0_bits;
		else if (_GEN_1)
			;
		else
			r_uop_prs1 <= _maptable_io_map_resps_0_prs1;
		if (ren2_alloc_fire_0 & (r_uop_ldst == (_GEN_1 ? r_uop_lrs2 : io_dec_uops_0_lrs2)))
			r_uop_prs2 <= _freelist_io_alloc_pregs_0_bits;
		else if (_GEN_1)
			;
		else
			r_uop_prs2 <= _maptable_io_map_resps_0_prs2;
		if (ren2_alloc_fire_0 & (r_uop_ldst == (_GEN_1 ? r_uop_ldst : io_dec_uops_0_ldst)))
			r_uop_stale_pdst <= _freelist_io_alloc_pregs_0_bits;
		else if (_GEN_1)
			;
		else
			r_uop_stale_pdst <= _maptable_io_map_resps_0_stale_pdst;
		if (_GEN_1)
			;
		else begin
			r_uop_exception <= io_dec_uops_0_exception;
			r_uop_exc_cause <= io_dec_uops_0_exc_cause;
			r_uop_mem_cmd <= io_dec_uops_0_mem_cmd;
			r_uop_mem_size <= io_dec_uops_0_mem_size;
			r_uop_mem_signed <= io_dec_uops_0_mem_signed;
			r_uop_uses_ldq <= io_dec_uops_0_uses_ldq;
			r_uop_uses_stq <= io_dec_uops_0_uses_stq;
			r_uop_is_unique <= io_dec_uops_0_is_unique;
			r_uop_flush_on_commit <= io_dec_uops_0_flush_on_commit;
			r_uop_csr_cmd <= io_dec_uops_0_csr_cmd;
			r_uop_ldst_is_rs1 <= io_dec_uops_0_ldst_is_rs1;
			r_uop_ldst <= io_dec_uops_0_ldst;
			r_uop_lrs1 <= io_dec_uops_0_lrs1;
			r_uop_lrs2 <= io_dec_uops_0_lrs2;
			r_uop_lrs3 <= io_dec_uops_0_lrs3;
			r_uop_dst_rtype <= io_dec_uops_0_dst_rtype;
			r_uop_lrs1_rtype <= io_dec_uops_0_lrs1_rtype;
			r_uop_lrs2_rtype <= io_dec_uops_0_lrs2_rtype;
			r_uop_frs3_en <= io_dec_uops_0_frs3_en;
			r_uop_fcn_dw <= io_dec_uops_0_fcn_dw;
			r_uop_fcn_op <= io_dec_uops_0_fcn_op;
			r_uop_fp_val <= io_dec_uops_0_fp_val;
			r_uop_fp_rm <= io_dec_uops_0_fp_rm;
			r_uop_fp_typ <= io_dec_uops_0_fp_typ;
			r_uop_xcpt_pf_if <= io_dec_uops_0_xcpt_pf_if;
			r_uop_xcpt_ae_if <= io_dec_uops_0_xcpt_ae_if;
		end
		r_uop_xcpt_ma_if <= _GEN_1 & r_uop_xcpt_ma_if;
		if (_GEN_1)
			;
		else begin
			r_uop_bp_debug_if <= io_dec_uops_0_bp_debug_if;
			r_uop_bp_xcpt_if <= io_dec_uops_0_bp_xcpt_if;
			r_uop_debug_fsrc <= io_dec_uops_0_debug_fsrc;
			r_uop_debug_tsrc <= 3'h0;
		end
		REG <= io_rollback;
	end
	RenameMapTable maptable(
		.clock(clock),
		.reset(reset),
		.io_map_reqs_0_lrs1(io_dec_uops_0_lrs1),
		.io_map_reqs_0_lrs2(io_dec_uops_0_lrs2),
		.io_map_reqs_0_ldst(io_dec_uops_0_ldst),
		.io_map_resps_0_prs1(_maptable_io_map_resps_0_prs1),
		.io_map_resps_0_prs2(_maptable_io_map_resps_0_prs2),
		.io_map_resps_0_stale_pdst(_maptable_io_map_resps_0_stale_pdst),
		.io_remap_reqs_0_ldst(r_uop_ldst),
		.io_remap_reqs_0_pdst(_freelist_io_alloc_pregs_0_bits),
		.io_remap_reqs_0_valid(ren2_alloc_fire_0),
		.io_com_remap_reqs_0_ldst(io_com_uops_0_ldst),
		.io_com_remap_reqs_0_pdst(io_com_uops_0_pdst),
		.io_com_remap_reqs_0_valid(com_valids_0),
		.io_ren_br_tags_1_valid(ren2_br_tags_1_valid),
		.io_ren_br_tags_1_bits(r_uop_br_tag),
		.io_brupdate_b2_uop_br_tag(io_brupdate_b2_uop_br_tag),
		.io_brupdate_b2_mispredict(io_brupdate_b2_mispredict),
		.io_rollback(io_rollback)
	);
	RenameFreeList freelist(
		.clock(clock),
		.reset(reset),
		.io_reqs_0(ren2_alloc_fire_0),
		.io_alloc_pregs_0_valid(_freelist_io_alloc_pregs_0_valid),
		.io_alloc_pregs_0_bits(_freelist_io_alloc_pregs_0_bits),
		.io_despec_0_valid(com_valids_0),
		.io_despec_0_bits(io_com_uops_0_pdst),
		.io_dealloc_0_valid(com_valids_0),
		.io_dealloc_0_bits(io_com_uops_0_stale_pdst),
		.io_ren_br_tags_1_valid(ren2_br_tags_1_valid),
		.io_ren_br_tags_1_bits(r_uop_br_tag),
		.io_brupdate_b2_uop_br_tag(io_brupdate_b2_uop_br_tag),
		.io_brupdate_b2_mispredict(io_brupdate_b2_mispredict),
		.io_rollback(io_rollback),
		.io_debug_freelist(_freelist_io_debug_freelist)
	);
	RenameBusyTable busytable(
		.clock(clock),
		.reset(reset),
		.io_ren_uops_0_pdst(_freelist_io_alloc_pregs_0_bits),
		.io_ren_uops_0_prs1(r_uop_prs1),
		.io_ren_uops_0_prs2(r_uop_prs2),
		.io_busy_resps_0_prs1_busy(_busytable_io_busy_resps_0_prs1_busy),
		.io_busy_resps_0_prs2_busy(_busytable_io_busy_resps_0_prs2_busy),
		.io_rebusy_reqs_0(ren2_alloc_fire_0),
		.io_wakeups_0_valid(io_wakeups_0_valid),
		.io_wakeups_0_bits_uop_pdst(io_wakeups_0_bits_uop_pdst),
		.io_wakeups_0_bits_rebusy(io_wakeups_0_bits_rebusy),
		.io_wakeups_1_valid(io_wakeups_1_valid),
		.io_wakeups_1_bits_uop_pdst(io_wakeups_1_bits_uop_pdst),
		.io_wakeups_2_valid(io_wakeups_2_valid),
		.io_wakeups_2_bits_uop_pdst(io_wakeups_2_bits_uop_pdst),
		.io_child_rebusys(io_child_rebusys)
	);
	assign io_ren_stalls_0 = _io_ren_stalls_0_T & ~_freelist_io_alloc_pregs_0_valid;
	assign io_ren2_mask_0 = r_valid;
	assign io_ren2_uops_0_inst = r_uop_inst;
	assign io_ren2_uops_0_debug_inst = r_uop_debug_inst;
	assign io_ren2_uops_0_is_rvc = r_uop_is_rvc;
	assign io_ren2_uops_0_debug_pc = r_uop_debug_pc;
	assign io_ren2_uops_0_iq_type_0 = r_uop_iq_type_0;
	assign io_ren2_uops_0_iq_type_1 = r_uop_iq_type_1;
	assign io_ren2_uops_0_iq_type_2 = r_uop_iq_type_2;
	assign io_ren2_uops_0_iq_type_3 = r_uop_iq_type_3;
	assign io_ren2_uops_0_fu_code_0 = r_uop_fu_code_0;
	assign io_ren2_uops_0_fu_code_1 = r_uop_fu_code_1;
	assign io_ren2_uops_0_fu_code_2 = r_uop_fu_code_2;
	assign io_ren2_uops_0_fu_code_3 = r_uop_fu_code_3;
	assign io_ren2_uops_0_fu_code_4 = r_uop_fu_code_4;
	assign io_ren2_uops_0_fu_code_5 = r_uop_fu_code_5;
	assign io_ren2_uops_0_fu_code_6 = r_uop_fu_code_6;
	assign io_ren2_uops_0_fu_code_7 = r_uop_fu_code_7;
	assign io_ren2_uops_0_fu_code_8 = r_uop_fu_code_8;
	assign io_ren2_uops_0_fu_code_9 = r_uop_fu_code_9;
	assign io_ren2_uops_0_iw_issued = r_uop_iw_issued;
	assign io_ren2_uops_0_iw_issued_partial_agen = r_uop_iw_issued_partial_agen;
	assign io_ren2_uops_0_iw_issued_partial_dgen = r_uop_iw_issued_partial_dgen;
	assign io_ren2_uops_0_iw_p1_speculative_child = r_uop_iw_p1_speculative_child;
	assign io_ren2_uops_0_iw_p2_speculative_child = r_uop_iw_p2_speculative_child;
	assign io_ren2_uops_0_iw_p1_bypass_hint = r_uop_iw_p1_bypass_hint;
	assign io_ren2_uops_0_iw_p2_bypass_hint = r_uop_iw_p2_bypass_hint;
	assign io_ren2_uops_0_iw_p3_bypass_hint = r_uop_iw_p3_bypass_hint;
	assign io_ren2_uops_0_br_mask = r_uop_br_mask & ~io_brupdate_b1_resolve_mask;
	assign io_ren2_uops_0_br_tag = r_uop_br_tag;
	assign io_ren2_uops_0_br_type = r_uop_br_type;
	assign io_ren2_uops_0_is_sfb = r_uop_is_sfb;
	assign io_ren2_uops_0_is_fence = r_uop_is_fence;
	assign io_ren2_uops_0_is_fencei = r_uop_is_fencei;
	assign io_ren2_uops_0_is_sfence = r_uop_is_sfence;
	assign io_ren2_uops_0_is_amo = r_uop_is_amo;
	assign io_ren2_uops_0_is_eret = r_uop_is_eret;
	assign io_ren2_uops_0_is_sys_pc2epc = r_uop_is_sys_pc2epc;
	assign io_ren2_uops_0_is_rocc = r_uop_is_rocc;
	assign io_ren2_uops_0_is_mov = r_uop_is_mov;
	assign io_ren2_uops_0_ftq_idx = r_uop_ftq_idx;
	assign io_ren2_uops_0_edge_inst = r_uop_edge_inst;
	assign io_ren2_uops_0_pc_lob = r_uop_pc_lob;
	assign io_ren2_uops_0_taken = r_uop_taken;
	assign io_ren2_uops_0_imm_rename = r_uop_imm_rename;
	assign io_ren2_uops_0_imm_packed = r_uop_imm_packed;
	assign io_ren2_uops_0_op1_sel = r_uop_op1_sel;
	assign io_ren2_uops_0_op2_sel = r_uop_op2_sel;
	assign io_ren2_uops_0_fp_ctrl_ldst = r_uop_fp_ctrl_ldst;
	assign io_ren2_uops_0_fp_ctrl_wen = r_uop_fp_ctrl_wen;
	assign io_ren2_uops_0_fp_ctrl_ren1 = r_uop_fp_ctrl_ren1;
	assign io_ren2_uops_0_fp_ctrl_ren2 = r_uop_fp_ctrl_ren2;
	assign io_ren2_uops_0_fp_ctrl_ren3 = r_uop_fp_ctrl_ren3;
	assign io_ren2_uops_0_fp_ctrl_swap12 = r_uop_fp_ctrl_swap12;
	assign io_ren2_uops_0_fp_ctrl_swap23 = r_uop_fp_ctrl_swap23;
	assign io_ren2_uops_0_fp_ctrl_typeTagIn = r_uop_fp_ctrl_typeTagIn;
	assign io_ren2_uops_0_fp_ctrl_typeTagOut = r_uop_fp_ctrl_typeTagOut;
	assign io_ren2_uops_0_fp_ctrl_fromint = r_uop_fp_ctrl_fromint;
	assign io_ren2_uops_0_fp_ctrl_toint = r_uop_fp_ctrl_toint;
	assign io_ren2_uops_0_fp_ctrl_fastpipe = r_uop_fp_ctrl_fastpipe;
	assign io_ren2_uops_0_fp_ctrl_fma = r_uop_fp_ctrl_fma;
	assign io_ren2_uops_0_fp_ctrl_div = r_uop_fp_ctrl_div;
	assign io_ren2_uops_0_fp_ctrl_sqrt = r_uop_fp_ctrl_sqrt;
	assign io_ren2_uops_0_fp_ctrl_wflags = r_uop_fp_ctrl_wflags;
	assign io_ren2_uops_0_fp_ctrl_vec = r_uop_fp_ctrl_vec;
	assign io_ren2_uops_0_rxq_idx = r_uop_rxq_idx;
	assign io_ren2_uops_0_pdst = _freelist_io_alloc_pregs_0_bits;
	assign io_ren2_uops_0_prs1 = r_uop_prs1;
	assign io_ren2_uops_0_prs2 = r_uop_prs2;
	assign io_ren2_uops_0_prs1_busy = _ren2_uops_0_prs1_busy_T & _busytable_io_busy_resps_0_prs1_busy;
	assign io_ren2_uops_0_prs2_busy = _ren2_uops_0_prs2_busy_T & _busytable_io_busy_resps_0_prs2_busy;
	assign io_ren2_uops_0_stale_pdst = r_uop_stale_pdst;
	assign io_ren2_uops_0_exception = r_uop_exception;
	assign io_ren2_uops_0_exc_cause = r_uop_exc_cause;
	assign io_ren2_uops_0_mem_cmd = r_uop_mem_cmd;
	assign io_ren2_uops_0_mem_size = r_uop_mem_size;
	assign io_ren2_uops_0_mem_signed = r_uop_mem_signed;
	assign io_ren2_uops_0_uses_ldq = r_uop_uses_ldq;
	assign io_ren2_uops_0_uses_stq = r_uop_uses_stq;
	assign io_ren2_uops_0_is_unique = r_uop_is_unique;
	assign io_ren2_uops_0_flush_on_commit = r_uop_flush_on_commit;
	assign io_ren2_uops_0_csr_cmd = r_uop_csr_cmd;
	assign io_ren2_uops_0_ldst_is_rs1 = r_uop_ldst_is_rs1;
	assign io_ren2_uops_0_ldst = r_uop_ldst;
	assign io_ren2_uops_0_lrs1 = r_uop_lrs1;
	assign io_ren2_uops_0_lrs2 = r_uop_lrs2;
	assign io_ren2_uops_0_lrs3 = r_uop_lrs3;
	assign io_ren2_uops_0_dst_rtype = r_uop_dst_rtype;
	assign io_ren2_uops_0_lrs1_rtype = r_uop_lrs1_rtype;
	assign io_ren2_uops_0_lrs2_rtype = r_uop_lrs2_rtype;
	assign io_ren2_uops_0_frs3_en = r_uop_frs3_en;
	assign io_ren2_uops_0_fcn_dw = r_uop_fcn_dw;
	assign io_ren2_uops_0_fcn_op = r_uop_fcn_op;
	assign io_ren2_uops_0_fp_val = r_uop_fp_val;
	assign io_ren2_uops_0_fp_rm = r_uop_fp_rm;
	assign io_ren2_uops_0_fp_typ = r_uop_fp_typ;
	assign io_ren2_uops_0_xcpt_pf_if = r_uop_xcpt_pf_if;
	assign io_ren2_uops_0_xcpt_ae_if = r_uop_xcpt_ae_if;
	assign io_ren2_uops_0_xcpt_ma_if = r_uop_xcpt_ma_if;
	assign io_ren2_uops_0_bp_debug_if = r_uop_bp_debug_if;
	assign io_ren2_uops_0_bp_xcpt_if = r_uop_bp_xcpt_if;
	assign io_ren2_uops_0_debug_fsrc = r_uop_debug_fsrc;
	assign io_ren2_uops_0_debug_tsrc = r_uop_debug_tsrc;
endmodule
