module BoomMSHRFile (
	clock,
	reset,
	io_req_0_ready,
	io_req_0_valid,
	io_req_0_bits_uop_inst,
	io_req_0_bits_uop_debug_inst,
	io_req_0_bits_uop_is_rvc,
	io_req_0_bits_uop_debug_pc,
	io_req_0_bits_uop_iq_type_0,
	io_req_0_bits_uop_iq_type_1,
	io_req_0_bits_uop_iq_type_2,
	io_req_0_bits_uop_iq_type_3,
	io_req_0_bits_uop_fu_code_0,
	io_req_0_bits_uop_fu_code_1,
	io_req_0_bits_uop_fu_code_2,
	io_req_0_bits_uop_fu_code_3,
	io_req_0_bits_uop_fu_code_4,
	io_req_0_bits_uop_fu_code_5,
	io_req_0_bits_uop_fu_code_6,
	io_req_0_bits_uop_fu_code_7,
	io_req_0_bits_uop_fu_code_8,
	io_req_0_bits_uop_fu_code_9,
	io_req_0_bits_uop_iw_issued,
	io_req_0_bits_uop_iw_issued_partial_agen,
	io_req_0_bits_uop_iw_issued_partial_dgen,
	io_req_0_bits_uop_iw_p1_speculative_child,
	io_req_0_bits_uop_iw_p2_speculative_child,
	io_req_0_bits_uop_iw_p1_bypass_hint,
	io_req_0_bits_uop_iw_p2_bypass_hint,
	io_req_0_bits_uop_iw_p3_bypass_hint,
	io_req_0_bits_uop_dis_col_sel,
	io_req_0_bits_uop_br_mask,
	io_req_0_bits_uop_br_tag,
	io_req_0_bits_uop_br_type,
	io_req_0_bits_uop_is_sfb,
	io_req_0_bits_uop_is_fence,
	io_req_0_bits_uop_is_fencei,
	io_req_0_bits_uop_is_sfence,
	io_req_0_bits_uop_is_amo,
	io_req_0_bits_uop_is_eret,
	io_req_0_bits_uop_is_sys_pc2epc,
	io_req_0_bits_uop_is_rocc,
	io_req_0_bits_uop_is_mov,
	io_req_0_bits_uop_ftq_idx,
	io_req_0_bits_uop_edge_inst,
	io_req_0_bits_uop_pc_lob,
	io_req_0_bits_uop_taken,
	io_req_0_bits_uop_imm_rename,
	io_req_0_bits_uop_imm_sel,
	io_req_0_bits_uop_pimm,
	io_req_0_bits_uop_imm_packed,
	io_req_0_bits_uop_op1_sel,
	io_req_0_bits_uop_op2_sel,
	io_req_0_bits_uop_fp_ctrl_ldst,
	io_req_0_bits_uop_fp_ctrl_wen,
	io_req_0_bits_uop_fp_ctrl_ren1,
	io_req_0_bits_uop_fp_ctrl_ren2,
	io_req_0_bits_uop_fp_ctrl_ren3,
	io_req_0_bits_uop_fp_ctrl_swap12,
	io_req_0_bits_uop_fp_ctrl_swap23,
	io_req_0_bits_uop_fp_ctrl_typeTagIn,
	io_req_0_bits_uop_fp_ctrl_typeTagOut,
	io_req_0_bits_uop_fp_ctrl_fromint,
	io_req_0_bits_uop_fp_ctrl_toint,
	io_req_0_bits_uop_fp_ctrl_fastpipe,
	io_req_0_bits_uop_fp_ctrl_fma,
	io_req_0_bits_uop_fp_ctrl_div,
	io_req_0_bits_uop_fp_ctrl_sqrt,
	io_req_0_bits_uop_fp_ctrl_wflags,
	io_req_0_bits_uop_fp_ctrl_vec,
	io_req_0_bits_uop_rob_idx,
	io_req_0_bits_uop_ldq_idx,
	io_req_0_bits_uop_stq_idx,
	io_req_0_bits_uop_rxq_idx,
	io_req_0_bits_uop_pdst,
	io_req_0_bits_uop_prs1,
	io_req_0_bits_uop_prs2,
	io_req_0_bits_uop_prs3,
	io_req_0_bits_uop_ppred,
	io_req_0_bits_uop_prs1_busy,
	io_req_0_bits_uop_prs2_busy,
	io_req_0_bits_uop_prs3_busy,
	io_req_0_bits_uop_ppred_busy,
	io_req_0_bits_uop_stale_pdst,
	io_req_0_bits_uop_exception,
	io_req_0_bits_uop_exc_cause,
	io_req_0_bits_uop_mem_cmd,
	io_req_0_bits_uop_mem_size,
	io_req_0_bits_uop_mem_signed,
	io_req_0_bits_uop_uses_ldq,
	io_req_0_bits_uop_uses_stq,
	io_req_0_bits_uop_is_unique,
	io_req_0_bits_uop_flush_on_commit,
	io_req_0_bits_uop_csr_cmd,
	io_req_0_bits_uop_ldst_is_rs1,
	io_req_0_bits_uop_ldst,
	io_req_0_bits_uop_lrs1,
	io_req_0_bits_uop_lrs2,
	io_req_0_bits_uop_lrs3,
	io_req_0_bits_uop_dst_rtype,
	io_req_0_bits_uop_lrs1_rtype,
	io_req_0_bits_uop_lrs2_rtype,
	io_req_0_bits_uop_frs3_en,
	io_req_0_bits_uop_fcn_dw,
	io_req_0_bits_uop_fcn_op,
	io_req_0_bits_uop_fp_val,
	io_req_0_bits_uop_fp_rm,
	io_req_0_bits_uop_fp_typ,
	io_req_0_bits_uop_xcpt_pf_if,
	io_req_0_bits_uop_xcpt_ae_if,
	io_req_0_bits_uop_xcpt_ma_if,
	io_req_0_bits_uop_bp_debug_if,
	io_req_0_bits_uop_bp_xcpt_if,
	io_req_0_bits_uop_debug_fsrc,
	io_req_0_bits_uop_debug_tsrc,
	io_req_0_bits_addr,
	io_req_0_bits_data,
	io_req_0_bits_is_hella,
	io_req_0_bits_tag_match,
	io_req_0_bits_old_meta_coh_state,
	io_req_0_bits_old_meta_tag,
	io_req_0_bits_way_en,
	io_req_is_probe_0,
	io_resp_ready,
	io_resp_valid,
	io_resp_bits_uop_is_amo,
	io_resp_bits_uop_ldq_idx,
	io_resp_bits_uop_stq_idx,
	io_resp_bits_uop_uses_ldq,
	io_resp_bits_uop_uses_stq,
	io_resp_bits_data,
	io_resp_bits_is_hella,
	io_secondary_miss_0,
	io_block_hit_0,
	io_brupdate_b1_resolve_mask,
	io_brupdate_b1_mispredict_mask,
	io_exception,
	io_mem_acquire_ready,
	io_mem_acquire_valid,
	io_mem_acquire_bits_opcode,
	io_mem_acquire_bits_param,
	io_mem_acquire_bits_size,
	io_mem_acquire_bits_source,
	io_mem_acquire_bits_address,
	io_mem_acquire_bits_mask,
	io_mem_acquire_bits_data,
	io_mem_grant_ready,
	io_mem_grant_valid,
	io_mem_grant_bits_opcode,
	io_mem_grant_bits_param,
	io_mem_grant_bits_size,
	io_mem_grant_bits_source,
	io_mem_grant_bits_sink,
	io_mem_grant_bits_data,
	io_mem_finish_ready,
	io_mem_finish_valid,
	io_mem_finish_bits_sink,
	io_refill_ready,
	io_refill_valid,
	io_refill_bits_way_en,
	io_refill_bits_addr,
	io_refill_bits_data,
	io_meta_write_ready,
	io_meta_write_valid,
	io_meta_write_bits_idx,
	io_meta_write_bits_way_en,
	io_meta_write_bits_data_coh_state,
	io_meta_write_bits_data_tag,
	io_meta_read_ready,
	io_meta_read_valid,
	io_meta_read_bits_idx,
	io_meta_read_bits_way_en,
	io_meta_read_bits_tag,
	io_meta_resp_valid,
	io_meta_resp_bits_coh_state,
	io_replay_ready,
	io_replay_valid,
	io_replay_bits_uop_inst,
	io_replay_bits_uop_debug_inst,
	io_replay_bits_uop_is_rvc,
	io_replay_bits_uop_debug_pc,
	io_replay_bits_uop_iq_type_0,
	io_replay_bits_uop_iq_type_1,
	io_replay_bits_uop_iq_type_2,
	io_replay_bits_uop_iq_type_3,
	io_replay_bits_uop_fu_code_0,
	io_replay_bits_uop_fu_code_1,
	io_replay_bits_uop_fu_code_2,
	io_replay_bits_uop_fu_code_3,
	io_replay_bits_uop_fu_code_4,
	io_replay_bits_uop_fu_code_5,
	io_replay_bits_uop_fu_code_6,
	io_replay_bits_uop_fu_code_7,
	io_replay_bits_uop_fu_code_8,
	io_replay_bits_uop_fu_code_9,
	io_replay_bits_uop_iw_issued,
	io_replay_bits_uop_iw_issued_partial_agen,
	io_replay_bits_uop_iw_issued_partial_dgen,
	io_replay_bits_uop_iw_p1_speculative_child,
	io_replay_bits_uop_iw_p2_speculative_child,
	io_replay_bits_uop_iw_p1_bypass_hint,
	io_replay_bits_uop_iw_p2_bypass_hint,
	io_replay_bits_uop_iw_p3_bypass_hint,
	io_replay_bits_uop_dis_col_sel,
	io_replay_bits_uop_br_mask,
	io_replay_bits_uop_br_tag,
	io_replay_bits_uop_br_type,
	io_replay_bits_uop_is_sfb,
	io_replay_bits_uop_is_fence,
	io_replay_bits_uop_is_fencei,
	io_replay_bits_uop_is_sfence,
	io_replay_bits_uop_is_amo,
	io_replay_bits_uop_is_eret,
	io_replay_bits_uop_is_sys_pc2epc,
	io_replay_bits_uop_is_rocc,
	io_replay_bits_uop_is_mov,
	io_replay_bits_uop_ftq_idx,
	io_replay_bits_uop_edge_inst,
	io_replay_bits_uop_pc_lob,
	io_replay_bits_uop_taken,
	io_replay_bits_uop_imm_rename,
	io_replay_bits_uop_imm_sel,
	io_replay_bits_uop_pimm,
	io_replay_bits_uop_imm_packed,
	io_replay_bits_uop_op1_sel,
	io_replay_bits_uop_op2_sel,
	io_replay_bits_uop_fp_ctrl_ldst,
	io_replay_bits_uop_fp_ctrl_wen,
	io_replay_bits_uop_fp_ctrl_ren1,
	io_replay_bits_uop_fp_ctrl_ren2,
	io_replay_bits_uop_fp_ctrl_ren3,
	io_replay_bits_uop_fp_ctrl_swap12,
	io_replay_bits_uop_fp_ctrl_swap23,
	io_replay_bits_uop_fp_ctrl_typeTagIn,
	io_replay_bits_uop_fp_ctrl_typeTagOut,
	io_replay_bits_uop_fp_ctrl_fromint,
	io_replay_bits_uop_fp_ctrl_toint,
	io_replay_bits_uop_fp_ctrl_fastpipe,
	io_replay_bits_uop_fp_ctrl_fma,
	io_replay_bits_uop_fp_ctrl_div,
	io_replay_bits_uop_fp_ctrl_sqrt,
	io_replay_bits_uop_fp_ctrl_wflags,
	io_replay_bits_uop_fp_ctrl_vec,
	io_replay_bits_uop_rob_idx,
	io_replay_bits_uop_ldq_idx,
	io_replay_bits_uop_stq_idx,
	io_replay_bits_uop_rxq_idx,
	io_replay_bits_uop_pdst,
	io_replay_bits_uop_prs1,
	io_replay_bits_uop_prs2,
	io_replay_bits_uop_prs3,
	io_replay_bits_uop_ppred,
	io_replay_bits_uop_prs1_busy,
	io_replay_bits_uop_prs2_busy,
	io_replay_bits_uop_prs3_busy,
	io_replay_bits_uop_ppred_busy,
	io_replay_bits_uop_stale_pdst,
	io_replay_bits_uop_exception,
	io_replay_bits_uop_exc_cause,
	io_replay_bits_uop_mem_cmd,
	io_replay_bits_uop_mem_size,
	io_replay_bits_uop_mem_signed,
	io_replay_bits_uop_uses_ldq,
	io_replay_bits_uop_uses_stq,
	io_replay_bits_uop_is_unique,
	io_replay_bits_uop_flush_on_commit,
	io_replay_bits_uop_csr_cmd,
	io_replay_bits_uop_ldst_is_rs1,
	io_replay_bits_uop_ldst,
	io_replay_bits_uop_lrs1,
	io_replay_bits_uop_lrs2,
	io_replay_bits_uop_lrs3,
	io_replay_bits_uop_dst_rtype,
	io_replay_bits_uop_lrs1_rtype,
	io_replay_bits_uop_lrs2_rtype,
	io_replay_bits_uop_frs3_en,
	io_replay_bits_uop_fcn_dw,
	io_replay_bits_uop_fcn_op,
	io_replay_bits_uop_fp_val,
	io_replay_bits_uop_fp_rm,
	io_replay_bits_uop_fp_typ,
	io_replay_bits_uop_xcpt_pf_if,
	io_replay_bits_uop_xcpt_ae_if,
	io_replay_bits_uop_xcpt_ma_if,
	io_replay_bits_uop_bp_debug_if,
	io_replay_bits_uop_bp_xcpt_if,
	io_replay_bits_uop_debug_fsrc,
	io_replay_bits_uop_debug_tsrc,
	io_replay_bits_addr,
	io_replay_bits_data,
	io_replay_bits_is_hella,
	io_replay_bits_way_en,
	io_wb_req_ready,
	io_wb_req_valid,
	io_wb_req_bits_tag,
	io_wb_req_bits_idx,
	io_wb_req_bits_source,
	io_wb_req_bits_param,
	io_wb_req_bits_way_en,
	io_wb_req_bits_voluntary,
	io_prober_state_valid,
	io_prober_state_bits,
	io_clear_all,
	io_wb_resp,
	io_fence_rdy,
	io_probe_rdy
);
	input clock;
	input reset;
	output wire io_req_0_ready;
	input io_req_0_valid;
	input [31:0] io_req_0_bits_uop_inst;
	input [31:0] io_req_0_bits_uop_debug_inst;
	input io_req_0_bits_uop_is_rvc;
	input [39:0] io_req_0_bits_uop_debug_pc;
	input io_req_0_bits_uop_iq_type_0;
	input io_req_0_bits_uop_iq_type_1;
	input io_req_0_bits_uop_iq_type_2;
	input io_req_0_bits_uop_iq_type_3;
	input io_req_0_bits_uop_fu_code_0;
	input io_req_0_bits_uop_fu_code_1;
	input io_req_0_bits_uop_fu_code_2;
	input io_req_0_bits_uop_fu_code_3;
	input io_req_0_bits_uop_fu_code_4;
	input io_req_0_bits_uop_fu_code_5;
	input io_req_0_bits_uop_fu_code_6;
	input io_req_0_bits_uop_fu_code_7;
	input io_req_0_bits_uop_fu_code_8;
	input io_req_0_bits_uop_fu_code_9;
	input io_req_0_bits_uop_iw_issued;
	input io_req_0_bits_uop_iw_issued_partial_agen;
	input io_req_0_bits_uop_iw_issued_partial_dgen;
	input io_req_0_bits_uop_iw_p1_speculative_child;
	input io_req_0_bits_uop_iw_p2_speculative_child;
	input io_req_0_bits_uop_iw_p1_bypass_hint;
	input io_req_0_bits_uop_iw_p2_bypass_hint;
	input io_req_0_bits_uop_iw_p3_bypass_hint;
	input io_req_0_bits_uop_dis_col_sel;
	input [7:0] io_req_0_bits_uop_br_mask;
	input [2:0] io_req_0_bits_uop_br_tag;
	input [3:0] io_req_0_bits_uop_br_type;
	input io_req_0_bits_uop_is_sfb;
	input io_req_0_bits_uop_is_fence;
	input io_req_0_bits_uop_is_fencei;
	input io_req_0_bits_uop_is_sfence;
	input io_req_0_bits_uop_is_amo;
	input io_req_0_bits_uop_is_eret;
	input io_req_0_bits_uop_is_sys_pc2epc;
	input io_req_0_bits_uop_is_rocc;
	input io_req_0_bits_uop_is_mov;
	input [3:0] io_req_0_bits_uop_ftq_idx;
	input io_req_0_bits_uop_edge_inst;
	input [5:0] io_req_0_bits_uop_pc_lob;
	input io_req_0_bits_uop_taken;
	input io_req_0_bits_uop_imm_rename;
	input [2:0] io_req_0_bits_uop_imm_sel;
	input [4:0] io_req_0_bits_uop_pimm;
	input [19:0] io_req_0_bits_uop_imm_packed;
	input [1:0] io_req_0_bits_uop_op1_sel;
	input [2:0] io_req_0_bits_uop_op2_sel;
	input io_req_0_bits_uop_fp_ctrl_ldst;
	input io_req_0_bits_uop_fp_ctrl_wen;
	input io_req_0_bits_uop_fp_ctrl_ren1;
	input io_req_0_bits_uop_fp_ctrl_ren2;
	input io_req_0_bits_uop_fp_ctrl_ren3;
	input io_req_0_bits_uop_fp_ctrl_swap12;
	input io_req_0_bits_uop_fp_ctrl_swap23;
	input [1:0] io_req_0_bits_uop_fp_ctrl_typeTagIn;
	input [1:0] io_req_0_bits_uop_fp_ctrl_typeTagOut;
	input io_req_0_bits_uop_fp_ctrl_fromint;
	input io_req_0_bits_uop_fp_ctrl_toint;
	input io_req_0_bits_uop_fp_ctrl_fastpipe;
	input io_req_0_bits_uop_fp_ctrl_fma;
	input io_req_0_bits_uop_fp_ctrl_div;
	input io_req_0_bits_uop_fp_ctrl_sqrt;
	input io_req_0_bits_uop_fp_ctrl_wflags;
	input io_req_0_bits_uop_fp_ctrl_vec;
	input [4:0] io_req_0_bits_uop_rob_idx;
	input [3:0] io_req_0_bits_uop_ldq_idx;
	input [3:0] io_req_0_bits_uop_stq_idx;
	input [1:0] io_req_0_bits_uop_rxq_idx;
	input [5:0] io_req_0_bits_uop_pdst;
	input [5:0] io_req_0_bits_uop_prs1;
	input [5:0] io_req_0_bits_uop_prs2;
	input [5:0] io_req_0_bits_uop_prs3;
	input [3:0] io_req_0_bits_uop_ppred;
	input io_req_0_bits_uop_prs1_busy;
	input io_req_0_bits_uop_prs2_busy;
	input io_req_0_bits_uop_prs3_busy;
	input io_req_0_bits_uop_ppred_busy;
	input [5:0] io_req_0_bits_uop_stale_pdst;
	input io_req_0_bits_uop_exception;
	input [63:0] io_req_0_bits_uop_exc_cause;
	input [4:0] io_req_0_bits_uop_mem_cmd;
	input [1:0] io_req_0_bits_uop_mem_size;
	input io_req_0_bits_uop_mem_signed;
	input io_req_0_bits_uop_uses_ldq;
	input io_req_0_bits_uop_uses_stq;
	input io_req_0_bits_uop_is_unique;
	input io_req_0_bits_uop_flush_on_commit;
	input [2:0] io_req_0_bits_uop_csr_cmd;
	input io_req_0_bits_uop_ldst_is_rs1;
	input [5:0] io_req_0_bits_uop_ldst;
	input [5:0] io_req_0_bits_uop_lrs1;
	input [5:0] io_req_0_bits_uop_lrs2;
	input [5:0] io_req_0_bits_uop_lrs3;
	input [1:0] io_req_0_bits_uop_dst_rtype;
	input [1:0] io_req_0_bits_uop_lrs1_rtype;
	input [1:0] io_req_0_bits_uop_lrs2_rtype;
	input io_req_0_bits_uop_frs3_en;
	input io_req_0_bits_uop_fcn_dw;
	input [4:0] io_req_0_bits_uop_fcn_op;
	input io_req_0_bits_uop_fp_val;
	input [2:0] io_req_0_bits_uop_fp_rm;
	input [1:0] io_req_0_bits_uop_fp_typ;
	input io_req_0_bits_uop_xcpt_pf_if;
	input io_req_0_bits_uop_xcpt_ae_if;
	input io_req_0_bits_uop_xcpt_ma_if;
	input io_req_0_bits_uop_bp_debug_if;
	input io_req_0_bits_uop_bp_xcpt_if;
	input [2:0] io_req_0_bits_uop_debug_fsrc;
	input [2:0] io_req_0_bits_uop_debug_tsrc;
	input [39:0] io_req_0_bits_addr;
	input [63:0] io_req_0_bits_data;
	input io_req_0_bits_is_hella;
	input io_req_0_bits_tag_match;
	input [1:0] io_req_0_bits_old_meta_coh_state;
	input [19:0] io_req_0_bits_old_meta_tag;
	input [3:0] io_req_0_bits_way_en;
	input io_req_is_probe_0;
	input io_resp_ready;
	output wire io_resp_valid;
	output wire io_resp_bits_uop_is_amo;
	output wire [3:0] io_resp_bits_uop_ldq_idx;
	output wire [3:0] io_resp_bits_uop_stq_idx;
	output wire io_resp_bits_uop_uses_ldq;
	output wire io_resp_bits_uop_uses_stq;
	output wire [63:0] io_resp_bits_data;
	output wire io_resp_bits_is_hella;
	output wire io_secondary_miss_0;
	output wire io_block_hit_0;
	input [7:0] io_brupdate_b1_resolve_mask;
	input [7:0] io_brupdate_b1_mispredict_mask;
	input io_exception;
	input io_mem_acquire_ready;
	output wire io_mem_acquire_valid;
	output wire [2:0] io_mem_acquire_bits_opcode;
	output wire [2:0] io_mem_acquire_bits_param;
	output wire [3:0] io_mem_acquire_bits_size;
	output wire [1:0] io_mem_acquire_bits_source;
	output wire [31:0] io_mem_acquire_bits_address;
	output wire [7:0] io_mem_acquire_bits_mask;
	output wire [63:0] io_mem_acquire_bits_data;
	output wire io_mem_grant_ready;
	input io_mem_grant_valid;
	input [2:0] io_mem_grant_bits_opcode;
	input [1:0] io_mem_grant_bits_param;
	input [3:0] io_mem_grant_bits_size;
	input [1:0] io_mem_grant_bits_source;
	input [1:0] io_mem_grant_bits_sink;
	input [63:0] io_mem_grant_bits_data;
	input io_mem_finish_ready;
	output wire io_mem_finish_valid;
	output wire [1:0] io_mem_finish_bits_sink;
	input io_refill_ready;
	output wire io_refill_valid;
	output wire [3:0] io_refill_bits_way_en;
	output wire [11:0] io_refill_bits_addr;
	output wire [63:0] io_refill_bits_data;
	input io_meta_write_ready;
	output wire io_meta_write_valid;
	output wire [5:0] io_meta_write_bits_idx;
	output wire [3:0] io_meta_write_bits_way_en;
	output wire [1:0] io_meta_write_bits_data_coh_state;
	output wire [19:0] io_meta_write_bits_data_tag;
	input io_meta_read_ready;
	output wire io_meta_read_valid;
	output wire [5:0] io_meta_read_bits_idx;
	output wire [3:0] io_meta_read_bits_way_en;
	output wire [19:0] io_meta_read_bits_tag;
	input io_meta_resp_valid;
	input [1:0] io_meta_resp_bits_coh_state;
	input io_replay_ready;
	output wire io_replay_valid;
	output wire [31:0] io_replay_bits_uop_inst;
	output wire [31:0] io_replay_bits_uop_debug_inst;
	output wire io_replay_bits_uop_is_rvc;
	output wire [39:0] io_replay_bits_uop_debug_pc;
	output wire io_replay_bits_uop_iq_type_0;
	output wire io_replay_bits_uop_iq_type_1;
	output wire io_replay_bits_uop_iq_type_2;
	output wire io_replay_bits_uop_iq_type_3;
	output wire io_replay_bits_uop_fu_code_0;
	output wire io_replay_bits_uop_fu_code_1;
	output wire io_replay_bits_uop_fu_code_2;
	output wire io_replay_bits_uop_fu_code_3;
	output wire io_replay_bits_uop_fu_code_4;
	output wire io_replay_bits_uop_fu_code_5;
	output wire io_replay_bits_uop_fu_code_6;
	output wire io_replay_bits_uop_fu_code_7;
	output wire io_replay_bits_uop_fu_code_8;
	output wire io_replay_bits_uop_fu_code_9;
	output wire io_replay_bits_uop_iw_issued;
	output wire io_replay_bits_uop_iw_issued_partial_agen;
	output wire io_replay_bits_uop_iw_issued_partial_dgen;
	output wire io_replay_bits_uop_iw_p1_speculative_child;
	output wire io_replay_bits_uop_iw_p2_speculative_child;
	output wire io_replay_bits_uop_iw_p1_bypass_hint;
	output wire io_replay_bits_uop_iw_p2_bypass_hint;
	output wire io_replay_bits_uop_iw_p3_bypass_hint;
	output wire io_replay_bits_uop_dis_col_sel;
	output wire [7:0] io_replay_bits_uop_br_mask;
	output wire [2:0] io_replay_bits_uop_br_tag;
	output wire [3:0] io_replay_bits_uop_br_type;
	output wire io_replay_bits_uop_is_sfb;
	output wire io_replay_bits_uop_is_fence;
	output wire io_replay_bits_uop_is_fencei;
	output wire io_replay_bits_uop_is_sfence;
	output wire io_replay_bits_uop_is_amo;
	output wire io_replay_bits_uop_is_eret;
	output wire io_replay_bits_uop_is_sys_pc2epc;
	output wire io_replay_bits_uop_is_rocc;
	output wire io_replay_bits_uop_is_mov;
	output wire [3:0] io_replay_bits_uop_ftq_idx;
	output wire io_replay_bits_uop_edge_inst;
	output wire [5:0] io_replay_bits_uop_pc_lob;
	output wire io_replay_bits_uop_taken;
	output wire io_replay_bits_uop_imm_rename;
	output wire [2:0] io_replay_bits_uop_imm_sel;
	output wire [4:0] io_replay_bits_uop_pimm;
	output wire [19:0] io_replay_bits_uop_imm_packed;
	output wire [1:0] io_replay_bits_uop_op1_sel;
	output wire [2:0] io_replay_bits_uop_op2_sel;
	output wire io_replay_bits_uop_fp_ctrl_ldst;
	output wire io_replay_bits_uop_fp_ctrl_wen;
	output wire io_replay_bits_uop_fp_ctrl_ren1;
	output wire io_replay_bits_uop_fp_ctrl_ren2;
	output wire io_replay_bits_uop_fp_ctrl_ren3;
	output wire io_replay_bits_uop_fp_ctrl_swap12;
	output wire io_replay_bits_uop_fp_ctrl_swap23;
	output wire [1:0] io_replay_bits_uop_fp_ctrl_typeTagIn;
	output wire [1:0] io_replay_bits_uop_fp_ctrl_typeTagOut;
	output wire io_replay_bits_uop_fp_ctrl_fromint;
	output wire io_replay_bits_uop_fp_ctrl_toint;
	output wire io_replay_bits_uop_fp_ctrl_fastpipe;
	output wire io_replay_bits_uop_fp_ctrl_fma;
	output wire io_replay_bits_uop_fp_ctrl_div;
	output wire io_replay_bits_uop_fp_ctrl_sqrt;
	output wire io_replay_bits_uop_fp_ctrl_wflags;
	output wire io_replay_bits_uop_fp_ctrl_vec;
	output wire [4:0] io_replay_bits_uop_rob_idx;
	output wire [3:0] io_replay_bits_uop_ldq_idx;
	output wire [3:0] io_replay_bits_uop_stq_idx;
	output wire [1:0] io_replay_bits_uop_rxq_idx;
	output wire [5:0] io_replay_bits_uop_pdst;
	output wire [5:0] io_replay_bits_uop_prs1;
	output wire [5:0] io_replay_bits_uop_prs2;
	output wire [5:0] io_replay_bits_uop_prs3;
	output wire [3:0] io_replay_bits_uop_ppred;
	output wire io_replay_bits_uop_prs1_busy;
	output wire io_replay_bits_uop_prs2_busy;
	output wire io_replay_bits_uop_prs3_busy;
	output wire io_replay_bits_uop_ppred_busy;
	output wire [5:0] io_replay_bits_uop_stale_pdst;
	output wire io_replay_bits_uop_exception;
	output wire [63:0] io_replay_bits_uop_exc_cause;
	output wire [4:0] io_replay_bits_uop_mem_cmd;
	output wire [1:0] io_replay_bits_uop_mem_size;
	output wire io_replay_bits_uop_mem_signed;
	output wire io_replay_bits_uop_uses_ldq;
	output wire io_replay_bits_uop_uses_stq;
	output wire io_replay_bits_uop_is_unique;
	output wire io_replay_bits_uop_flush_on_commit;
	output wire [2:0] io_replay_bits_uop_csr_cmd;
	output wire io_replay_bits_uop_ldst_is_rs1;
	output wire [5:0] io_replay_bits_uop_ldst;
	output wire [5:0] io_replay_bits_uop_lrs1;
	output wire [5:0] io_replay_bits_uop_lrs2;
	output wire [5:0] io_replay_bits_uop_lrs3;
	output wire [1:0] io_replay_bits_uop_dst_rtype;
	output wire [1:0] io_replay_bits_uop_lrs1_rtype;
	output wire [1:0] io_replay_bits_uop_lrs2_rtype;
	output wire io_replay_bits_uop_frs3_en;
	output wire io_replay_bits_uop_fcn_dw;
	output wire [4:0] io_replay_bits_uop_fcn_op;
	output wire io_replay_bits_uop_fp_val;
	output wire [2:0] io_replay_bits_uop_fp_rm;
	output wire [1:0] io_replay_bits_uop_fp_typ;
	output wire io_replay_bits_uop_xcpt_pf_if;
	output wire io_replay_bits_uop_xcpt_ae_if;
	output wire io_replay_bits_uop_xcpt_ma_if;
	output wire io_replay_bits_uop_bp_debug_if;
	output wire io_replay_bits_uop_bp_xcpt_if;
	output wire [2:0] io_replay_bits_uop_debug_fsrc;
	output wire [2:0] io_replay_bits_uop_debug_tsrc;
	output wire [39:0] io_replay_bits_addr;
	output wire [63:0] io_replay_bits_data;
	output wire io_replay_bits_is_hella;
	output wire [3:0] io_replay_bits_way_en;
	input io_wb_req_ready;
	output wire io_wb_req_valid;
	output wire [19:0] io_wb_req_bits_tag;
	output wire [5:0] io_wb_req_bits_idx;
	output wire [1:0] io_wb_req_bits_source;
	output wire [2:0] io_wb_req_bits_param;
	output wire [3:0] io_wb_req_bits_way_en;
	output wire io_wb_req_bits_voluntary;
	input io_prober_state_valid;
	input [39:0] io_prober_state_bits;
	input io_clear_all;
	input io_wb_resp;
	output wire io_fence_rdy;
	output wire io_probe_rdy;
	wire req_ready;
	reg mshr_alloc_idx_REG;
	wire _way_matches_0_1_T;
	wire _tag_matches_0_1_T_1;
	wire idx_matches_0_1;
	wire _way_matches_0_0_T;
	wire _tag_matches_0_0_T_1;
	wire idx_matches_0_0;
	wire _respq_io_enq_ready;
	wire _mmios_0_io_req_ready;
	wire _mmios_0_io_resp_valid;
	wire [31:0] _mmios_0_io_resp_bits_uop_inst;
	wire [31:0] _mmios_0_io_resp_bits_uop_debug_inst;
	wire _mmios_0_io_resp_bits_uop_is_rvc;
	wire [39:0] _mmios_0_io_resp_bits_uop_debug_pc;
	wire _mmios_0_io_resp_bits_uop_iq_type_0;
	wire _mmios_0_io_resp_bits_uop_iq_type_1;
	wire _mmios_0_io_resp_bits_uop_iq_type_2;
	wire _mmios_0_io_resp_bits_uop_iq_type_3;
	wire _mmios_0_io_resp_bits_uop_fu_code_0;
	wire _mmios_0_io_resp_bits_uop_fu_code_1;
	wire _mmios_0_io_resp_bits_uop_fu_code_2;
	wire _mmios_0_io_resp_bits_uop_fu_code_3;
	wire _mmios_0_io_resp_bits_uop_fu_code_4;
	wire _mmios_0_io_resp_bits_uop_fu_code_5;
	wire _mmios_0_io_resp_bits_uop_fu_code_6;
	wire _mmios_0_io_resp_bits_uop_fu_code_7;
	wire _mmios_0_io_resp_bits_uop_fu_code_8;
	wire _mmios_0_io_resp_bits_uop_fu_code_9;
	wire _mmios_0_io_resp_bits_uop_iw_issued;
	wire _mmios_0_io_resp_bits_uop_iw_issued_partial_agen;
	wire _mmios_0_io_resp_bits_uop_iw_issued_partial_dgen;
	wire _mmios_0_io_resp_bits_uop_iw_p1_speculative_child;
	wire _mmios_0_io_resp_bits_uop_iw_p2_speculative_child;
	wire _mmios_0_io_resp_bits_uop_iw_p1_bypass_hint;
	wire _mmios_0_io_resp_bits_uop_iw_p2_bypass_hint;
	wire _mmios_0_io_resp_bits_uop_iw_p3_bypass_hint;
	wire _mmios_0_io_resp_bits_uop_dis_col_sel;
	wire [7:0] _mmios_0_io_resp_bits_uop_br_mask;
	wire [2:0] _mmios_0_io_resp_bits_uop_br_tag;
	wire [3:0] _mmios_0_io_resp_bits_uop_br_type;
	wire _mmios_0_io_resp_bits_uop_is_sfb;
	wire _mmios_0_io_resp_bits_uop_is_fence;
	wire _mmios_0_io_resp_bits_uop_is_fencei;
	wire _mmios_0_io_resp_bits_uop_is_sfence;
	wire _mmios_0_io_resp_bits_uop_is_amo;
	wire _mmios_0_io_resp_bits_uop_is_eret;
	wire _mmios_0_io_resp_bits_uop_is_sys_pc2epc;
	wire _mmios_0_io_resp_bits_uop_is_rocc;
	wire _mmios_0_io_resp_bits_uop_is_mov;
	wire [3:0] _mmios_0_io_resp_bits_uop_ftq_idx;
	wire _mmios_0_io_resp_bits_uop_edge_inst;
	wire [5:0] _mmios_0_io_resp_bits_uop_pc_lob;
	wire _mmios_0_io_resp_bits_uop_taken;
	wire _mmios_0_io_resp_bits_uop_imm_rename;
	wire [2:0] _mmios_0_io_resp_bits_uop_imm_sel;
	wire [4:0] _mmios_0_io_resp_bits_uop_pimm;
	wire [19:0] _mmios_0_io_resp_bits_uop_imm_packed;
	wire [1:0] _mmios_0_io_resp_bits_uop_op1_sel;
	wire [2:0] _mmios_0_io_resp_bits_uop_op2_sel;
	wire _mmios_0_io_resp_bits_uop_fp_ctrl_ldst;
	wire _mmios_0_io_resp_bits_uop_fp_ctrl_wen;
	wire _mmios_0_io_resp_bits_uop_fp_ctrl_ren1;
	wire _mmios_0_io_resp_bits_uop_fp_ctrl_ren2;
	wire _mmios_0_io_resp_bits_uop_fp_ctrl_ren3;
	wire _mmios_0_io_resp_bits_uop_fp_ctrl_swap12;
	wire _mmios_0_io_resp_bits_uop_fp_ctrl_swap23;
	wire [1:0] _mmios_0_io_resp_bits_uop_fp_ctrl_typeTagIn;
	wire [1:0] _mmios_0_io_resp_bits_uop_fp_ctrl_typeTagOut;
	wire _mmios_0_io_resp_bits_uop_fp_ctrl_fromint;
	wire _mmios_0_io_resp_bits_uop_fp_ctrl_toint;
	wire _mmios_0_io_resp_bits_uop_fp_ctrl_fastpipe;
	wire _mmios_0_io_resp_bits_uop_fp_ctrl_fma;
	wire _mmios_0_io_resp_bits_uop_fp_ctrl_div;
	wire _mmios_0_io_resp_bits_uop_fp_ctrl_sqrt;
	wire _mmios_0_io_resp_bits_uop_fp_ctrl_wflags;
	wire _mmios_0_io_resp_bits_uop_fp_ctrl_vec;
	wire [4:0] _mmios_0_io_resp_bits_uop_rob_idx;
	wire [3:0] _mmios_0_io_resp_bits_uop_ldq_idx;
	wire [3:0] _mmios_0_io_resp_bits_uop_stq_idx;
	wire [1:0] _mmios_0_io_resp_bits_uop_rxq_idx;
	wire [5:0] _mmios_0_io_resp_bits_uop_pdst;
	wire [5:0] _mmios_0_io_resp_bits_uop_prs1;
	wire [5:0] _mmios_0_io_resp_bits_uop_prs2;
	wire [5:0] _mmios_0_io_resp_bits_uop_prs3;
	wire [3:0] _mmios_0_io_resp_bits_uop_ppred;
	wire _mmios_0_io_resp_bits_uop_prs1_busy;
	wire _mmios_0_io_resp_bits_uop_prs2_busy;
	wire _mmios_0_io_resp_bits_uop_prs3_busy;
	wire _mmios_0_io_resp_bits_uop_ppred_busy;
	wire [5:0] _mmios_0_io_resp_bits_uop_stale_pdst;
	wire _mmios_0_io_resp_bits_uop_exception;
	wire [63:0] _mmios_0_io_resp_bits_uop_exc_cause;
	wire [4:0] _mmios_0_io_resp_bits_uop_mem_cmd;
	wire [1:0] _mmios_0_io_resp_bits_uop_mem_size;
	wire _mmios_0_io_resp_bits_uop_mem_signed;
	wire _mmios_0_io_resp_bits_uop_uses_ldq;
	wire _mmios_0_io_resp_bits_uop_uses_stq;
	wire _mmios_0_io_resp_bits_uop_is_unique;
	wire _mmios_0_io_resp_bits_uop_flush_on_commit;
	wire [2:0] _mmios_0_io_resp_bits_uop_csr_cmd;
	wire _mmios_0_io_resp_bits_uop_ldst_is_rs1;
	wire [5:0] _mmios_0_io_resp_bits_uop_ldst;
	wire [5:0] _mmios_0_io_resp_bits_uop_lrs1;
	wire [5:0] _mmios_0_io_resp_bits_uop_lrs2;
	wire [5:0] _mmios_0_io_resp_bits_uop_lrs3;
	wire [1:0] _mmios_0_io_resp_bits_uop_dst_rtype;
	wire [1:0] _mmios_0_io_resp_bits_uop_lrs1_rtype;
	wire [1:0] _mmios_0_io_resp_bits_uop_lrs2_rtype;
	wire _mmios_0_io_resp_bits_uop_frs3_en;
	wire _mmios_0_io_resp_bits_uop_fcn_dw;
	wire [4:0] _mmios_0_io_resp_bits_uop_fcn_op;
	wire _mmios_0_io_resp_bits_uop_fp_val;
	wire [2:0] _mmios_0_io_resp_bits_uop_fp_rm;
	wire [1:0] _mmios_0_io_resp_bits_uop_fp_typ;
	wire _mmios_0_io_resp_bits_uop_xcpt_pf_if;
	wire _mmios_0_io_resp_bits_uop_xcpt_ae_if;
	wire _mmios_0_io_resp_bits_uop_xcpt_ma_if;
	wire _mmios_0_io_resp_bits_uop_bp_debug_if;
	wire _mmios_0_io_resp_bits_uop_bp_xcpt_if;
	wire [2:0] _mmios_0_io_resp_bits_uop_debug_fsrc;
	wire [2:0] _mmios_0_io_resp_bits_uop_debug_tsrc;
	wire [63:0] _mmios_0_io_resp_bits_data;
	wire _mmios_0_io_resp_bits_is_hella;
	wire _mmios_0_io_mem_access_valid;
	wire [2:0] _mmios_0_io_mem_access_bits_opcode;
	wire [2:0] _mmios_0_io_mem_access_bits_param;
	wire [3:0] _mmios_0_io_mem_access_bits_size;
	wire [1:0] _mmios_0_io_mem_access_bits_source;
	wire [31:0] _mmios_0_io_mem_access_bits_address;
	wire [7:0] _mmios_0_io_mem_access_bits_mask;
	wire [63:0] _mmios_0_io_mem_access_bits_data;
	wire _mmio_alloc_arb_io_in_0_ready;
	wire _mshrs_1_io_req_pri_rdy;
	wire _mshrs_1_io_req_sec_rdy;
	wire _mshrs_1_io_idx_valid;
	wire [5:0] _mshrs_1_io_idx_bits;
	wire _mshrs_1_io_way_valid;
	wire [3:0] _mshrs_1_io_way_bits;
	wire _mshrs_1_io_tag_valid;
	wire [27:0] _mshrs_1_io_tag_bits;
	wire _mshrs_1_io_mem_acquire_valid;
	wire [2:0] _mshrs_1_io_mem_acquire_bits_param;
	wire [1:0] _mshrs_1_io_mem_acquire_bits_source;
	wire [31:0] _mshrs_1_io_mem_acquire_bits_address;
	wire _mshrs_1_io_mem_grant_ready;
	wire _mshrs_1_io_mem_finish_valid;
	wire [1:0] _mshrs_1_io_mem_finish_bits_sink;
	wire _mshrs_1_io_refill_valid;
	wire [3:0] _mshrs_1_io_refill_bits_way_en;
	wire [11:0] _mshrs_1_io_refill_bits_addr;
	wire [63:0] _mshrs_1_io_refill_bits_data;
	wire _mshrs_1_io_meta_write_valid;
	wire [5:0] _mshrs_1_io_meta_write_bits_idx;
	wire [3:0] _mshrs_1_io_meta_write_bits_way_en;
	wire [1:0] _mshrs_1_io_meta_write_bits_data_coh_state;
	wire [19:0] _mshrs_1_io_meta_write_bits_data_tag;
	wire _mshrs_1_io_meta_read_valid;
	wire [5:0] _mshrs_1_io_meta_read_bits_idx;
	wire [3:0] _mshrs_1_io_meta_read_bits_way_en;
	wire [19:0] _mshrs_1_io_meta_read_bits_tag;
	wire _mshrs_1_io_wb_req_valid;
	wire [19:0] _mshrs_1_io_wb_req_bits_tag;
	wire [5:0] _mshrs_1_io_wb_req_bits_idx;
	wire [1:0] _mshrs_1_io_wb_req_bits_source;
	wire [2:0] _mshrs_1_io_wb_req_bits_param;
	wire [3:0] _mshrs_1_io_wb_req_bits_way_en;
	wire [2:0] _mshrs_1_io_lb_read_offset;
	wire _mshrs_1_io_lb_write_valid;
	wire [2:0] _mshrs_1_io_lb_write_bits_offset;
	wire [63:0] _mshrs_1_io_lb_write_bits_data;
	wire _mshrs_1_io_replay_valid;
	wire [31:0] _mshrs_1_io_replay_bits_uop_inst;
	wire [31:0] _mshrs_1_io_replay_bits_uop_debug_inst;
	wire _mshrs_1_io_replay_bits_uop_is_rvc;
	wire [39:0] _mshrs_1_io_replay_bits_uop_debug_pc;
	wire _mshrs_1_io_replay_bits_uop_iq_type_0;
	wire _mshrs_1_io_replay_bits_uop_iq_type_1;
	wire _mshrs_1_io_replay_bits_uop_iq_type_2;
	wire _mshrs_1_io_replay_bits_uop_iq_type_3;
	wire _mshrs_1_io_replay_bits_uop_fu_code_0;
	wire _mshrs_1_io_replay_bits_uop_fu_code_1;
	wire _mshrs_1_io_replay_bits_uop_fu_code_2;
	wire _mshrs_1_io_replay_bits_uop_fu_code_3;
	wire _mshrs_1_io_replay_bits_uop_fu_code_4;
	wire _mshrs_1_io_replay_bits_uop_fu_code_5;
	wire _mshrs_1_io_replay_bits_uop_fu_code_6;
	wire _mshrs_1_io_replay_bits_uop_fu_code_7;
	wire _mshrs_1_io_replay_bits_uop_fu_code_8;
	wire _mshrs_1_io_replay_bits_uop_fu_code_9;
	wire _mshrs_1_io_replay_bits_uop_iw_issued;
	wire _mshrs_1_io_replay_bits_uop_iw_issued_partial_agen;
	wire _mshrs_1_io_replay_bits_uop_iw_issued_partial_dgen;
	wire _mshrs_1_io_replay_bits_uop_iw_p1_speculative_child;
	wire _mshrs_1_io_replay_bits_uop_iw_p2_speculative_child;
	wire _mshrs_1_io_replay_bits_uop_iw_p1_bypass_hint;
	wire _mshrs_1_io_replay_bits_uop_iw_p2_bypass_hint;
	wire _mshrs_1_io_replay_bits_uop_iw_p3_bypass_hint;
	wire _mshrs_1_io_replay_bits_uop_dis_col_sel;
	wire [7:0] _mshrs_1_io_replay_bits_uop_br_mask;
	wire [2:0] _mshrs_1_io_replay_bits_uop_br_tag;
	wire [3:0] _mshrs_1_io_replay_bits_uop_br_type;
	wire _mshrs_1_io_replay_bits_uop_is_sfb;
	wire _mshrs_1_io_replay_bits_uop_is_fence;
	wire _mshrs_1_io_replay_bits_uop_is_fencei;
	wire _mshrs_1_io_replay_bits_uop_is_sfence;
	wire _mshrs_1_io_replay_bits_uop_is_amo;
	wire _mshrs_1_io_replay_bits_uop_is_eret;
	wire _mshrs_1_io_replay_bits_uop_is_sys_pc2epc;
	wire _mshrs_1_io_replay_bits_uop_is_rocc;
	wire _mshrs_1_io_replay_bits_uop_is_mov;
	wire [3:0] _mshrs_1_io_replay_bits_uop_ftq_idx;
	wire _mshrs_1_io_replay_bits_uop_edge_inst;
	wire [5:0] _mshrs_1_io_replay_bits_uop_pc_lob;
	wire _mshrs_1_io_replay_bits_uop_taken;
	wire _mshrs_1_io_replay_bits_uop_imm_rename;
	wire [2:0] _mshrs_1_io_replay_bits_uop_imm_sel;
	wire [4:0] _mshrs_1_io_replay_bits_uop_pimm;
	wire [19:0] _mshrs_1_io_replay_bits_uop_imm_packed;
	wire [1:0] _mshrs_1_io_replay_bits_uop_op1_sel;
	wire [2:0] _mshrs_1_io_replay_bits_uop_op2_sel;
	wire _mshrs_1_io_replay_bits_uop_fp_ctrl_ldst;
	wire _mshrs_1_io_replay_bits_uop_fp_ctrl_wen;
	wire _mshrs_1_io_replay_bits_uop_fp_ctrl_ren1;
	wire _mshrs_1_io_replay_bits_uop_fp_ctrl_ren2;
	wire _mshrs_1_io_replay_bits_uop_fp_ctrl_ren3;
	wire _mshrs_1_io_replay_bits_uop_fp_ctrl_swap12;
	wire _mshrs_1_io_replay_bits_uop_fp_ctrl_swap23;
	wire [1:0] _mshrs_1_io_replay_bits_uop_fp_ctrl_typeTagIn;
	wire [1:0] _mshrs_1_io_replay_bits_uop_fp_ctrl_typeTagOut;
	wire _mshrs_1_io_replay_bits_uop_fp_ctrl_fromint;
	wire _mshrs_1_io_replay_bits_uop_fp_ctrl_toint;
	wire _mshrs_1_io_replay_bits_uop_fp_ctrl_fastpipe;
	wire _mshrs_1_io_replay_bits_uop_fp_ctrl_fma;
	wire _mshrs_1_io_replay_bits_uop_fp_ctrl_div;
	wire _mshrs_1_io_replay_bits_uop_fp_ctrl_sqrt;
	wire _mshrs_1_io_replay_bits_uop_fp_ctrl_wflags;
	wire _mshrs_1_io_replay_bits_uop_fp_ctrl_vec;
	wire [4:0] _mshrs_1_io_replay_bits_uop_rob_idx;
	wire [3:0] _mshrs_1_io_replay_bits_uop_ldq_idx;
	wire [3:0] _mshrs_1_io_replay_bits_uop_stq_idx;
	wire [1:0] _mshrs_1_io_replay_bits_uop_rxq_idx;
	wire [5:0] _mshrs_1_io_replay_bits_uop_pdst;
	wire [5:0] _mshrs_1_io_replay_bits_uop_prs1;
	wire [5:0] _mshrs_1_io_replay_bits_uop_prs2;
	wire [5:0] _mshrs_1_io_replay_bits_uop_prs3;
	wire [3:0] _mshrs_1_io_replay_bits_uop_ppred;
	wire _mshrs_1_io_replay_bits_uop_prs1_busy;
	wire _mshrs_1_io_replay_bits_uop_prs2_busy;
	wire _mshrs_1_io_replay_bits_uop_prs3_busy;
	wire _mshrs_1_io_replay_bits_uop_ppred_busy;
	wire [5:0] _mshrs_1_io_replay_bits_uop_stale_pdst;
	wire _mshrs_1_io_replay_bits_uop_exception;
	wire [63:0] _mshrs_1_io_replay_bits_uop_exc_cause;
	wire [4:0] _mshrs_1_io_replay_bits_uop_mem_cmd;
	wire [1:0] _mshrs_1_io_replay_bits_uop_mem_size;
	wire _mshrs_1_io_replay_bits_uop_mem_signed;
	wire _mshrs_1_io_replay_bits_uop_uses_ldq;
	wire _mshrs_1_io_replay_bits_uop_uses_stq;
	wire _mshrs_1_io_replay_bits_uop_is_unique;
	wire _mshrs_1_io_replay_bits_uop_flush_on_commit;
	wire [2:0] _mshrs_1_io_replay_bits_uop_csr_cmd;
	wire _mshrs_1_io_replay_bits_uop_ldst_is_rs1;
	wire [5:0] _mshrs_1_io_replay_bits_uop_ldst;
	wire [5:0] _mshrs_1_io_replay_bits_uop_lrs1;
	wire [5:0] _mshrs_1_io_replay_bits_uop_lrs2;
	wire [5:0] _mshrs_1_io_replay_bits_uop_lrs3;
	wire [1:0] _mshrs_1_io_replay_bits_uop_dst_rtype;
	wire [1:0] _mshrs_1_io_replay_bits_uop_lrs1_rtype;
	wire [1:0] _mshrs_1_io_replay_bits_uop_lrs2_rtype;
	wire _mshrs_1_io_replay_bits_uop_frs3_en;
	wire _mshrs_1_io_replay_bits_uop_fcn_dw;
	wire [4:0] _mshrs_1_io_replay_bits_uop_fcn_op;
	wire _mshrs_1_io_replay_bits_uop_fp_val;
	wire [2:0] _mshrs_1_io_replay_bits_uop_fp_rm;
	wire [1:0] _mshrs_1_io_replay_bits_uop_fp_typ;
	wire _mshrs_1_io_replay_bits_uop_xcpt_pf_if;
	wire _mshrs_1_io_replay_bits_uop_xcpt_ae_if;
	wire _mshrs_1_io_replay_bits_uop_xcpt_ma_if;
	wire _mshrs_1_io_replay_bits_uop_bp_debug_if;
	wire _mshrs_1_io_replay_bits_uop_bp_xcpt_if;
	wire [2:0] _mshrs_1_io_replay_bits_uop_debug_fsrc;
	wire [2:0] _mshrs_1_io_replay_bits_uop_debug_tsrc;
	wire [39:0] _mshrs_1_io_replay_bits_addr;
	wire _mshrs_1_io_replay_bits_is_hella;
	wire [3:0] _mshrs_1_io_replay_bits_way_en;
	wire [4:0] _mshrs_1_io_replay_bits_sdq_id;
	wire _mshrs_1_io_resp_valid;
	wire [31:0] _mshrs_1_io_resp_bits_uop_inst;
	wire [31:0] _mshrs_1_io_resp_bits_uop_debug_inst;
	wire _mshrs_1_io_resp_bits_uop_is_rvc;
	wire [39:0] _mshrs_1_io_resp_bits_uop_debug_pc;
	wire _mshrs_1_io_resp_bits_uop_iq_type_0;
	wire _mshrs_1_io_resp_bits_uop_iq_type_1;
	wire _mshrs_1_io_resp_bits_uop_iq_type_2;
	wire _mshrs_1_io_resp_bits_uop_iq_type_3;
	wire _mshrs_1_io_resp_bits_uop_fu_code_0;
	wire _mshrs_1_io_resp_bits_uop_fu_code_1;
	wire _mshrs_1_io_resp_bits_uop_fu_code_2;
	wire _mshrs_1_io_resp_bits_uop_fu_code_3;
	wire _mshrs_1_io_resp_bits_uop_fu_code_4;
	wire _mshrs_1_io_resp_bits_uop_fu_code_5;
	wire _mshrs_1_io_resp_bits_uop_fu_code_6;
	wire _mshrs_1_io_resp_bits_uop_fu_code_7;
	wire _mshrs_1_io_resp_bits_uop_fu_code_8;
	wire _mshrs_1_io_resp_bits_uop_fu_code_9;
	wire _mshrs_1_io_resp_bits_uop_iw_issued;
	wire _mshrs_1_io_resp_bits_uop_iw_issued_partial_agen;
	wire _mshrs_1_io_resp_bits_uop_iw_issued_partial_dgen;
	wire _mshrs_1_io_resp_bits_uop_iw_p1_speculative_child;
	wire _mshrs_1_io_resp_bits_uop_iw_p2_speculative_child;
	wire _mshrs_1_io_resp_bits_uop_iw_p1_bypass_hint;
	wire _mshrs_1_io_resp_bits_uop_iw_p2_bypass_hint;
	wire _mshrs_1_io_resp_bits_uop_iw_p3_bypass_hint;
	wire _mshrs_1_io_resp_bits_uop_dis_col_sel;
	wire [7:0] _mshrs_1_io_resp_bits_uop_br_mask;
	wire [2:0] _mshrs_1_io_resp_bits_uop_br_tag;
	wire [3:0] _mshrs_1_io_resp_bits_uop_br_type;
	wire _mshrs_1_io_resp_bits_uop_is_sfb;
	wire _mshrs_1_io_resp_bits_uop_is_fence;
	wire _mshrs_1_io_resp_bits_uop_is_fencei;
	wire _mshrs_1_io_resp_bits_uop_is_sfence;
	wire _mshrs_1_io_resp_bits_uop_is_amo;
	wire _mshrs_1_io_resp_bits_uop_is_eret;
	wire _mshrs_1_io_resp_bits_uop_is_sys_pc2epc;
	wire _mshrs_1_io_resp_bits_uop_is_rocc;
	wire _mshrs_1_io_resp_bits_uop_is_mov;
	wire [3:0] _mshrs_1_io_resp_bits_uop_ftq_idx;
	wire _mshrs_1_io_resp_bits_uop_edge_inst;
	wire [5:0] _mshrs_1_io_resp_bits_uop_pc_lob;
	wire _mshrs_1_io_resp_bits_uop_taken;
	wire _mshrs_1_io_resp_bits_uop_imm_rename;
	wire [2:0] _mshrs_1_io_resp_bits_uop_imm_sel;
	wire [4:0] _mshrs_1_io_resp_bits_uop_pimm;
	wire [19:0] _mshrs_1_io_resp_bits_uop_imm_packed;
	wire [1:0] _mshrs_1_io_resp_bits_uop_op1_sel;
	wire [2:0] _mshrs_1_io_resp_bits_uop_op2_sel;
	wire _mshrs_1_io_resp_bits_uop_fp_ctrl_ldst;
	wire _mshrs_1_io_resp_bits_uop_fp_ctrl_wen;
	wire _mshrs_1_io_resp_bits_uop_fp_ctrl_ren1;
	wire _mshrs_1_io_resp_bits_uop_fp_ctrl_ren2;
	wire _mshrs_1_io_resp_bits_uop_fp_ctrl_ren3;
	wire _mshrs_1_io_resp_bits_uop_fp_ctrl_swap12;
	wire _mshrs_1_io_resp_bits_uop_fp_ctrl_swap23;
	wire [1:0] _mshrs_1_io_resp_bits_uop_fp_ctrl_typeTagIn;
	wire [1:0] _mshrs_1_io_resp_bits_uop_fp_ctrl_typeTagOut;
	wire _mshrs_1_io_resp_bits_uop_fp_ctrl_fromint;
	wire _mshrs_1_io_resp_bits_uop_fp_ctrl_toint;
	wire _mshrs_1_io_resp_bits_uop_fp_ctrl_fastpipe;
	wire _mshrs_1_io_resp_bits_uop_fp_ctrl_fma;
	wire _mshrs_1_io_resp_bits_uop_fp_ctrl_div;
	wire _mshrs_1_io_resp_bits_uop_fp_ctrl_sqrt;
	wire _mshrs_1_io_resp_bits_uop_fp_ctrl_wflags;
	wire _mshrs_1_io_resp_bits_uop_fp_ctrl_vec;
	wire [4:0] _mshrs_1_io_resp_bits_uop_rob_idx;
	wire [3:0] _mshrs_1_io_resp_bits_uop_ldq_idx;
	wire [3:0] _mshrs_1_io_resp_bits_uop_stq_idx;
	wire [1:0] _mshrs_1_io_resp_bits_uop_rxq_idx;
	wire [5:0] _mshrs_1_io_resp_bits_uop_pdst;
	wire [5:0] _mshrs_1_io_resp_bits_uop_prs1;
	wire [5:0] _mshrs_1_io_resp_bits_uop_prs2;
	wire [5:0] _mshrs_1_io_resp_bits_uop_prs3;
	wire [3:0] _mshrs_1_io_resp_bits_uop_ppred;
	wire _mshrs_1_io_resp_bits_uop_prs1_busy;
	wire _mshrs_1_io_resp_bits_uop_prs2_busy;
	wire _mshrs_1_io_resp_bits_uop_prs3_busy;
	wire _mshrs_1_io_resp_bits_uop_ppred_busy;
	wire [5:0] _mshrs_1_io_resp_bits_uop_stale_pdst;
	wire _mshrs_1_io_resp_bits_uop_exception;
	wire [63:0] _mshrs_1_io_resp_bits_uop_exc_cause;
	wire [4:0] _mshrs_1_io_resp_bits_uop_mem_cmd;
	wire [1:0] _mshrs_1_io_resp_bits_uop_mem_size;
	wire _mshrs_1_io_resp_bits_uop_mem_signed;
	wire _mshrs_1_io_resp_bits_uop_uses_ldq;
	wire _mshrs_1_io_resp_bits_uop_uses_stq;
	wire _mshrs_1_io_resp_bits_uop_is_unique;
	wire _mshrs_1_io_resp_bits_uop_flush_on_commit;
	wire [2:0] _mshrs_1_io_resp_bits_uop_csr_cmd;
	wire _mshrs_1_io_resp_bits_uop_ldst_is_rs1;
	wire [5:0] _mshrs_1_io_resp_bits_uop_ldst;
	wire [5:0] _mshrs_1_io_resp_bits_uop_lrs1;
	wire [5:0] _mshrs_1_io_resp_bits_uop_lrs2;
	wire [5:0] _mshrs_1_io_resp_bits_uop_lrs3;
	wire [1:0] _mshrs_1_io_resp_bits_uop_dst_rtype;
	wire [1:0] _mshrs_1_io_resp_bits_uop_lrs1_rtype;
	wire [1:0] _mshrs_1_io_resp_bits_uop_lrs2_rtype;
	wire _mshrs_1_io_resp_bits_uop_frs3_en;
	wire _mshrs_1_io_resp_bits_uop_fcn_dw;
	wire [4:0] _mshrs_1_io_resp_bits_uop_fcn_op;
	wire _mshrs_1_io_resp_bits_uop_fp_val;
	wire [2:0] _mshrs_1_io_resp_bits_uop_fp_rm;
	wire [1:0] _mshrs_1_io_resp_bits_uop_fp_typ;
	wire _mshrs_1_io_resp_bits_uop_xcpt_pf_if;
	wire _mshrs_1_io_resp_bits_uop_xcpt_ae_if;
	wire _mshrs_1_io_resp_bits_uop_xcpt_ma_if;
	wire _mshrs_1_io_resp_bits_uop_bp_debug_if;
	wire _mshrs_1_io_resp_bits_uop_bp_xcpt_if;
	wire [2:0] _mshrs_1_io_resp_bits_uop_debug_fsrc;
	wire [2:0] _mshrs_1_io_resp_bits_uop_debug_tsrc;
	wire [63:0] _mshrs_1_io_resp_bits_data;
	wire _mshrs_1_io_resp_bits_is_hella;
	wire _mshrs_1_io_probe_rdy;
	wire _mshrs_0_io_req_pri_rdy;
	wire _mshrs_0_io_req_sec_rdy;
	wire _mshrs_0_io_idx_valid;
	wire [5:0] _mshrs_0_io_idx_bits;
	wire _mshrs_0_io_way_valid;
	wire [3:0] _mshrs_0_io_way_bits;
	wire _mshrs_0_io_tag_valid;
	wire [27:0] _mshrs_0_io_tag_bits;
	wire _mshrs_0_io_mem_acquire_valid;
	wire [2:0] _mshrs_0_io_mem_acquire_bits_param;
	wire [1:0] _mshrs_0_io_mem_acquire_bits_source;
	wire [31:0] _mshrs_0_io_mem_acquire_bits_address;
	wire _mshrs_0_io_mem_grant_ready;
	wire _mshrs_0_io_mem_finish_valid;
	wire [1:0] _mshrs_0_io_mem_finish_bits_sink;
	wire _mshrs_0_io_refill_valid;
	wire [3:0] _mshrs_0_io_refill_bits_way_en;
	wire [11:0] _mshrs_0_io_refill_bits_addr;
	wire [63:0] _mshrs_0_io_refill_bits_data;
	wire _mshrs_0_io_meta_write_valid;
	wire [5:0] _mshrs_0_io_meta_write_bits_idx;
	wire [3:0] _mshrs_0_io_meta_write_bits_way_en;
	wire [1:0] _mshrs_0_io_meta_write_bits_data_coh_state;
	wire [19:0] _mshrs_0_io_meta_write_bits_data_tag;
	wire _mshrs_0_io_meta_read_valid;
	wire [5:0] _mshrs_0_io_meta_read_bits_idx;
	wire [3:0] _mshrs_0_io_meta_read_bits_way_en;
	wire [19:0] _mshrs_0_io_meta_read_bits_tag;
	wire _mshrs_0_io_wb_req_valid;
	wire [19:0] _mshrs_0_io_wb_req_bits_tag;
	wire [5:0] _mshrs_0_io_wb_req_bits_idx;
	wire [1:0] _mshrs_0_io_wb_req_bits_source;
	wire [2:0] _mshrs_0_io_wb_req_bits_param;
	wire [3:0] _mshrs_0_io_wb_req_bits_way_en;
	wire [2:0] _mshrs_0_io_lb_read_offset;
	wire _mshrs_0_io_lb_write_valid;
	wire [2:0] _mshrs_0_io_lb_write_bits_offset;
	wire [63:0] _mshrs_0_io_lb_write_bits_data;
	wire _mshrs_0_io_replay_valid;
	wire [31:0] _mshrs_0_io_replay_bits_uop_inst;
	wire [31:0] _mshrs_0_io_replay_bits_uop_debug_inst;
	wire _mshrs_0_io_replay_bits_uop_is_rvc;
	wire [39:0] _mshrs_0_io_replay_bits_uop_debug_pc;
	wire _mshrs_0_io_replay_bits_uop_iq_type_0;
	wire _mshrs_0_io_replay_bits_uop_iq_type_1;
	wire _mshrs_0_io_replay_bits_uop_iq_type_2;
	wire _mshrs_0_io_replay_bits_uop_iq_type_3;
	wire _mshrs_0_io_replay_bits_uop_fu_code_0;
	wire _mshrs_0_io_replay_bits_uop_fu_code_1;
	wire _mshrs_0_io_replay_bits_uop_fu_code_2;
	wire _mshrs_0_io_replay_bits_uop_fu_code_3;
	wire _mshrs_0_io_replay_bits_uop_fu_code_4;
	wire _mshrs_0_io_replay_bits_uop_fu_code_5;
	wire _mshrs_0_io_replay_bits_uop_fu_code_6;
	wire _mshrs_0_io_replay_bits_uop_fu_code_7;
	wire _mshrs_0_io_replay_bits_uop_fu_code_8;
	wire _mshrs_0_io_replay_bits_uop_fu_code_9;
	wire _mshrs_0_io_replay_bits_uop_iw_issued;
	wire _mshrs_0_io_replay_bits_uop_iw_issued_partial_agen;
	wire _mshrs_0_io_replay_bits_uop_iw_issued_partial_dgen;
	wire _mshrs_0_io_replay_bits_uop_iw_p1_speculative_child;
	wire _mshrs_0_io_replay_bits_uop_iw_p2_speculative_child;
	wire _mshrs_0_io_replay_bits_uop_iw_p1_bypass_hint;
	wire _mshrs_0_io_replay_bits_uop_iw_p2_bypass_hint;
	wire _mshrs_0_io_replay_bits_uop_iw_p3_bypass_hint;
	wire _mshrs_0_io_replay_bits_uop_dis_col_sel;
	wire [7:0] _mshrs_0_io_replay_bits_uop_br_mask;
	wire [2:0] _mshrs_0_io_replay_bits_uop_br_tag;
	wire [3:0] _mshrs_0_io_replay_bits_uop_br_type;
	wire _mshrs_0_io_replay_bits_uop_is_sfb;
	wire _mshrs_0_io_replay_bits_uop_is_fence;
	wire _mshrs_0_io_replay_bits_uop_is_fencei;
	wire _mshrs_0_io_replay_bits_uop_is_sfence;
	wire _mshrs_0_io_replay_bits_uop_is_amo;
	wire _mshrs_0_io_replay_bits_uop_is_eret;
	wire _mshrs_0_io_replay_bits_uop_is_sys_pc2epc;
	wire _mshrs_0_io_replay_bits_uop_is_rocc;
	wire _mshrs_0_io_replay_bits_uop_is_mov;
	wire [3:0] _mshrs_0_io_replay_bits_uop_ftq_idx;
	wire _mshrs_0_io_replay_bits_uop_edge_inst;
	wire [5:0] _mshrs_0_io_replay_bits_uop_pc_lob;
	wire _mshrs_0_io_replay_bits_uop_taken;
	wire _mshrs_0_io_replay_bits_uop_imm_rename;
	wire [2:0] _mshrs_0_io_replay_bits_uop_imm_sel;
	wire [4:0] _mshrs_0_io_replay_bits_uop_pimm;
	wire [19:0] _mshrs_0_io_replay_bits_uop_imm_packed;
	wire [1:0] _mshrs_0_io_replay_bits_uop_op1_sel;
	wire [2:0] _mshrs_0_io_replay_bits_uop_op2_sel;
	wire _mshrs_0_io_replay_bits_uop_fp_ctrl_ldst;
	wire _mshrs_0_io_replay_bits_uop_fp_ctrl_wen;
	wire _mshrs_0_io_replay_bits_uop_fp_ctrl_ren1;
	wire _mshrs_0_io_replay_bits_uop_fp_ctrl_ren2;
	wire _mshrs_0_io_replay_bits_uop_fp_ctrl_ren3;
	wire _mshrs_0_io_replay_bits_uop_fp_ctrl_swap12;
	wire _mshrs_0_io_replay_bits_uop_fp_ctrl_swap23;
	wire [1:0] _mshrs_0_io_replay_bits_uop_fp_ctrl_typeTagIn;
	wire [1:0] _mshrs_0_io_replay_bits_uop_fp_ctrl_typeTagOut;
	wire _mshrs_0_io_replay_bits_uop_fp_ctrl_fromint;
	wire _mshrs_0_io_replay_bits_uop_fp_ctrl_toint;
	wire _mshrs_0_io_replay_bits_uop_fp_ctrl_fastpipe;
	wire _mshrs_0_io_replay_bits_uop_fp_ctrl_fma;
	wire _mshrs_0_io_replay_bits_uop_fp_ctrl_div;
	wire _mshrs_0_io_replay_bits_uop_fp_ctrl_sqrt;
	wire _mshrs_0_io_replay_bits_uop_fp_ctrl_wflags;
	wire _mshrs_0_io_replay_bits_uop_fp_ctrl_vec;
	wire [4:0] _mshrs_0_io_replay_bits_uop_rob_idx;
	wire [3:0] _mshrs_0_io_replay_bits_uop_ldq_idx;
	wire [3:0] _mshrs_0_io_replay_bits_uop_stq_idx;
	wire [1:0] _mshrs_0_io_replay_bits_uop_rxq_idx;
	wire [5:0] _mshrs_0_io_replay_bits_uop_pdst;
	wire [5:0] _mshrs_0_io_replay_bits_uop_prs1;
	wire [5:0] _mshrs_0_io_replay_bits_uop_prs2;
	wire [5:0] _mshrs_0_io_replay_bits_uop_prs3;
	wire [3:0] _mshrs_0_io_replay_bits_uop_ppred;
	wire _mshrs_0_io_replay_bits_uop_prs1_busy;
	wire _mshrs_0_io_replay_bits_uop_prs2_busy;
	wire _mshrs_0_io_replay_bits_uop_prs3_busy;
	wire _mshrs_0_io_replay_bits_uop_ppred_busy;
	wire [5:0] _mshrs_0_io_replay_bits_uop_stale_pdst;
	wire _mshrs_0_io_replay_bits_uop_exception;
	wire [63:0] _mshrs_0_io_replay_bits_uop_exc_cause;
	wire [4:0] _mshrs_0_io_replay_bits_uop_mem_cmd;
	wire [1:0] _mshrs_0_io_replay_bits_uop_mem_size;
	wire _mshrs_0_io_replay_bits_uop_mem_signed;
	wire _mshrs_0_io_replay_bits_uop_uses_ldq;
	wire _mshrs_0_io_replay_bits_uop_uses_stq;
	wire _mshrs_0_io_replay_bits_uop_is_unique;
	wire _mshrs_0_io_replay_bits_uop_flush_on_commit;
	wire [2:0] _mshrs_0_io_replay_bits_uop_csr_cmd;
	wire _mshrs_0_io_replay_bits_uop_ldst_is_rs1;
	wire [5:0] _mshrs_0_io_replay_bits_uop_ldst;
	wire [5:0] _mshrs_0_io_replay_bits_uop_lrs1;
	wire [5:0] _mshrs_0_io_replay_bits_uop_lrs2;
	wire [5:0] _mshrs_0_io_replay_bits_uop_lrs3;
	wire [1:0] _mshrs_0_io_replay_bits_uop_dst_rtype;
	wire [1:0] _mshrs_0_io_replay_bits_uop_lrs1_rtype;
	wire [1:0] _mshrs_0_io_replay_bits_uop_lrs2_rtype;
	wire _mshrs_0_io_replay_bits_uop_frs3_en;
	wire _mshrs_0_io_replay_bits_uop_fcn_dw;
	wire [4:0] _mshrs_0_io_replay_bits_uop_fcn_op;
	wire _mshrs_0_io_replay_bits_uop_fp_val;
	wire [2:0] _mshrs_0_io_replay_bits_uop_fp_rm;
	wire [1:0] _mshrs_0_io_replay_bits_uop_fp_typ;
	wire _mshrs_0_io_replay_bits_uop_xcpt_pf_if;
	wire _mshrs_0_io_replay_bits_uop_xcpt_ae_if;
	wire _mshrs_0_io_replay_bits_uop_xcpt_ma_if;
	wire _mshrs_0_io_replay_bits_uop_bp_debug_if;
	wire _mshrs_0_io_replay_bits_uop_bp_xcpt_if;
	wire [2:0] _mshrs_0_io_replay_bits_uop_debug_fsrc;
	wire [2:0] _mshrs_0_io_replay_bits_uop_debug_tsrc;
	wire [39:0] _mshrs_0_io_replay_bits_addr;
	wire _mshrs_0_io_replay_bits_is_hella;
	wire [3:0] _mshrs_0_io_replay_bits_way_en;
	wire [4:0] _mshrs_0_io_replay_bits_sdq_id;
	wire _mshrs_0_io_resp_valid;
	wire [31:0] _mshrs_0_io_resp_bits_uop_inst;
	wire [31:0] _mshrs_0_io_resp_bits_uop_debug_inst;
	wire _mshrs_0_io_resp_bits_uop_is_rvc;
	wire [39:0] _mshrs_0_io_resp_bits_uop_debug_pc;
	wire _mshrs_0_io_resp_bits_uop_iq_type_0;
	wire _mshrs_0_io_resp_bits_uop_iq_type_1;
	wire _mshrs_0_io_resp_bits_uop_iq_type_2;
	wire _mshrs_0_io_resp_bits_uop_iq_type_3;
	wire _mshrs_0_io_resp_bits_uop_fu_code_0;
	wire _mshrs_0_io_resp_bits_uop_fu_code_1;
	wire _mshrs_0_io_resp_bits_uop_fu_code_2;
	wire _mshrs_0_io_resp_bits_uop_fu_code_3;
	wire _mshrs_0_io_resp_bits_uop_fu_code_4;
	wire _mshrs_0_io_resp_bits_uop_fu_code_5;
	wire _mshrs_0_io_resp_bits_uop_fu_code_6;
	wire _mshrs_0_io_resp_bits_uop_fu_code_7;
	wire _mshrs_0_io_resp_bits_uop_fu_code_8;
	wire _mshrs_0_io_resp_bits_uop_fu_code_9;
	wire _mshrs_0_io_resp_bits_uop_iw_issued;
	wire _mshrs_0_io_resp_bits_uop_iw_issued_partial_agen;
	wire _mshrs_0_io_resp_bits_uop_iw_issued_partial_dgen;
	wire _mshrs_0_io_resp_bits_uop_iw_p1_speculative_child;
	wire _mshrs_0_io_resp_bits_uop_iw_p2_speculative_child;
	wire _mshrs_0_io_resp_bits_uop_iw_p1_bypass_hint;
	wire _mshrs_0_io_resp_bits_uop_iw_p2_bypass_hint;
	wire _mshrs_0_io_resp_bits_uop_iw_p3_bypass_hint;
	wire _mshrs_0_io_resp_bits_uop_dis_col_sel;
	wire [7:0] _mshrs_0_io_resp_bits_uop_br_mask;
	wire [2:0] _mshrs_0_io_resp_bits_uop_br_tag;
	wire [3:0] _mshrs_0_io_resp_bits_uop_br_type;
	wire _mshrs_0_io_resp_bits_uop_is_sfb;
	wire _mshrs_0_io_resp_bits_uop_is_fence;
	wire _mshrs_0_io_resp_bits_uop_is_fencei;
	wire _mshrs_0_io_resp_bits_uop_is_sfence;
	wire _mshrs_0_io_resp_bits_uop_is_amo;
	wire _mshrs_0_io_resp_bits_uop_is_eret;
	wire _mshrs_0_io_resp_bits_uop_is_sys_pc2epc;
	wire _mshrs_0_io_resp_bits_uop_is_rocc;
	wire _mshrs_0_io_resp_bits_uop_is_mov;
	wire [3:0] _mshrs_0_io_resp_bits_uop_ftq_idx;
	wire _mshrs_0_io_resp_bits_uop_edge_inst;
	wire [5:0] _mshrs_0_io_resp_bits_uop_pc_lob;
	wire _mshrs_0_io_resp_bits_uop_taken;
	wire _mshrs_0_io_resp_bits_uop_imm_rename;
	wire [2:0] _mshrs_0_io_resp_bits_uop_imm_sel;
	wire [4:0] _mshrs_0_io_resp_bits_uop_pimm;
	wire [19:0] _mshrs_0_io_resp_bits_uop_imm_packed;
	wire [1:0] _mshrs_0_io_resp_bits_uop_op1_sel;
	wire [2:0] _mshrs_0_io_resp_bits_uop_op2_sel;
	wire _mshrs_0_io_resp_bits_uop_fp_ctrl_ldst;
	wire _mshrs_0_io_resp_bits_uop_fp_ctrl_wen;
	wire _mshrs_0_io_resp_bits_uop_fp_ctrl_ren1;
	wire _mshrs_0_io_resp_bits_uop_fp_ctrl_ren2;
	wire _mshrs_0_io_resp_bits_uop_fp_ctrl_ren3;
	wire _mshrs_0_io_resp_bits_uop_fp_ctrl_swap12;
	wire _mshrs_0_io_resp_bits_uop_fp_ctrl_swap23;
	wire [1:0] _mshrs_0_io_resp_bits_uop_fp_ctrl_typeTagIn;
	wire [1:0] _mshrs_0_io_resp_bits_uop_fp_ctrl_typeTagOut;
	wire _mshrs_0_io_resp_bits_uop_fp_ctrl_fromint;
	wire _mshrs_0_io_resp_bits_uop_fp_ctrl_toint;
	wire _mshrs_0_io_resp_bits_uop_fp_ctrl_fastpipe;
	wire _mshrs_0_io_resp_bits_uop_fp_ctrl_fma;
	wire _mshrs_0_io_resp_bits_uop_fp_ctrl_div;
	wire _mshrs_0_io_resp_bits_uop_fp_ctrl_sqrt;
	wire _mshrs_0_io_resp_bits_uop_fp_ctrl_wflags;
	wire _mshrs_0_io_resp_bits_uop_fp_ctrl_vec;
	wire [4:0] _mshrs_0_io_resp_bits_uop_rob_idx;
	wire [3:0] _mshrs_0_io_resp_bits_uop_ldq_idx;
	wire [3:0] _mshrs_0_io_resp_bits_uop_stq_idx;
	wire [1:0] _mshrs_0_io_resp_bits_uop_rxq_idx;
	wire [5:0] _mshrs_0_io_resp_bits_uop_pdst;
	wire [5:0] _mshrs_0_io_resp_bits_uop_prs1;
	wire [5:0] _mshrs_0_io_resp_bits_uop_prs2;
	wire [5:0] _mshrs_0_io_resp_bits_uop_prs3;
	wire [3:0] _mshrs_0_io_resp_bits_uop_ppred;
	wire _mshrs_0_io_resp_bits_uop_prs1_busy;
	wire _mshrs_0_io_resp_bits_uop_prs2_busy;
	wire _mshrs_0_io_resp_bits_uop_prs3_busy;
	wire _mshrs_0_io_resp_bits_uop_ppred_busy;
	wire [5:0] _mshrs_0_io_resp_bits_uop_stale_pdst;
	wire _mshrs_0_io_resp_bits_uop_exception;
	wire [63:0] _mshrs_0_io_resp_bits_uop_exc_cause;
	wire [4:0] _mshrs_0_io_resp_bits_uop_mem_cmd;
	wire [1:0] _mshrs_0_io_resp_bits_uop_mem_size;
	wire _mshrs_0_io_resp_bits_uop_mem_signed;
	wire _mshrs_0_io_resp_bits_uop_uses_ldq;
	wire _mshrs_0_io_resp_bits_uop_uses_stq;
	wire _mshrs_0_io_resp_bits_uop_is_unique;
	wire _mshrs_0_io_resp_bits_uop_flush_on_commit;
	wire [2:0] _mshrs_0_io_resp_bits_uop_csr_cmd;
	wire _mshrs_0_io_resp_bits_uop_ldst_is_rs1;
	wire [5:0] _mshrs_0_io_resp_bits_uop_ldst;
	wire [5:0] _mshrs_0_io_resp_bits_uop_lrs1;
	wire [5:0] _mshrs_0_io_resp_bits_uop_lrs2;
	wire [5:0] _mshrs_0_io_resp_bits_uop_lrs3;
	wire [1:0] _mshrs_0_io_resp_bits_uop_dst_rtype;
	wire [1:0] _mshrs_0_io_resp_bits_uop_lrs1_rtype;
	wire [1:0] _mshrs_0_io_resp_bits_uop_lrs2_rtype;
	wire _mshrs_0_io_resp_bits_uop_frs3_en;
	wire _mshrs_0_io_resp_bits_uop_fcn_dw;
	wire [4:0] _mshrs_0_io_resp_bits_uop_fcn_op;
	wire _mshrs_0_io_resp_bits_uop_fp_val;
	wire [2:0] _mshrs_0_io_resp_bits_uop_fp_rm;
	wire [1:0] _mshrs_0_io_resp_bits_uop_fp_typ;
	wire _mshrs_0_io_resp_bits_uop_xcpt_pf_if;
	wire _mshrs_0_io_resp_bits_uop_xcpt_ae_if;
	wire _mshrs_0_io_resp_bits_uop_xcpt_ma_if;
	wire _mshrs_0_io_resp_bits_uop_bp_debug_if;
	wire _mshrs_0_io_resp_bits_uop_bp_xcpt_if;
	wire [2:0] _mshrs_0_io_resp_bits_uop_debug_fsrc;
	wire [2:0] _mshrs_0_io_resp_bits_uop_debug_tsrc;
	wire [63:0] _mshrs_0_io_resp_bits_data;
	wire _mshrs_0_io_resp_bits_is_hella;
	wire _mshrs_0_io_probe_rdy;
	wire _refill_arb_io_in_0_ready;
	wire _refill_arb_io_in_1_ready;
	wire _resp_arb_io_in_0_ready;
	wire _resp_arb_io_in_1_ready;
	wire _resp_arb_io_in_2_ready;
	wire _resp_arb_io_out_valid;
	wire [31:0] _resp_arb_io_out_bits_uop_inst;
	wire [31:0] _resp_arb_io_out_bits_uop_debug_inst;
	wire _resp_arb_io_out_bits_uop_is_rvc;
	wire [39:0] _resp_arb_io_out_bits_uop_debug_pc;
	wire _resp_arb_io_out_bits_uop_iq_type_0;
	wire _resp_arb_io_out_bits_uop_iq_type_1;
	wire _resp_arb_io_out_bits_uop_iq_type_2;
	wire _resp_arb_io_out_bits_uop_iq_type_3;
	wire _resp_arb_io_out_bits_uop_fu_code_0;
	wire _resp_arb_io_out_bits_uop_fu_code_1;
	wire _resp_arb_io_out_bits_uop_fu_code_2;
	wire _resp_arb_io_out_bits_uop_fu_code_3;
	wire _resp_arb_io_out_bits_uop_fu_code_4;
	wire _resp_arb_io_out_bits_uop_fu_code_5;
	wire _resp_arb_io_out_bits_uop_fu_code_6;
	wire _resp_arb_io_out_bits_uop_fu_code_7;
	wire _resp_arb_io_out_bits_uop_fu_code_8;
	wire _resp_arb_io_out_bits_uop_fu_code_9;
	wire _resp_arb_io_out_bits_uop_iw_issued;
	wire _resp_arb_io_out_bits_uop_iw_issued_partial_agen;
	wire _resp_arb_io_out_bits_uop_iw_issued_partial_dgen;
	wire _resp_arb_io_out_bits_uop_iw_p1_speculative_child;
	wire _resp_arb_io_out_bits_uop_iw_p2_speculative_child;
	wire _resp_arb_io_out_bits_uop_iw_p1_bypass_hint;
	wire _resp_arb_io_out_bits_uop_iw_p2_bypass_hint;
	wire _resp_arb_io_out_bits_uop_iw_p3_bypass_hint;
	wire _resp_arb_io_out_bits_uop_dis_col_sel;
	wire [7:0] _resp_arb_io_out_bits_uop_br_mask;
	wire [2:0] _resp_arb_io_out_bits_uop_br_tag;
	wire [3:0] _resp_arb_io_out_bits_uop_br_type;
	wire _resp_arb_io_out_bits_uop_is_sfb;
	wire _resp_arb_io_out_bits_uop_is_fence;
	wire _resp_arb_io_out_bits_uop_is_fencei;
	wire _resp_arb_io_out_bits_uop_is_sfence;
	wire _resp_arb_io_out_bits_uop_is_amo;
	wire _resp_arb_io_out_bits_uop_is_eret;
	wire _resp_arb_io_out_bits_uop_is_sys_pc2epc;
	wire _resp_arb_io_out_bits_uop_is_rocc;
	wire _resp_arb_io_out_bits_uop_is_mov;
	wire [3:0] _resp_arb_io_out_bits_uop_ftq_idx;
	wire _resp_arb_io_out_bits_uop_edge_inst;
	wire [5:0] _resp_arb_io_out_bits_uop_pc_lob;
	wire _resp_arb_io_out_bits_uop_taken;
	wire _resp_arb_io_out_bits_uop_imm_rename;
	wire [2:0] _resp_arb_io_out_bits_uop_imm_sel;
	wire [4:0] _resp_arb_io_out_bits_uop_pimm;
	wire [19:0] _resp_arb_io_out_bits_uop_imm_packed;
	wire [1:0] _resp_arb_io_out_bits_uop_op1_sel;
	wire [2:0] _resp_arb_io_out_bits_uop_op2_sel;
	wire _resp_arb_io_out_bits_uop_fp_ctrl_ldst;
	wire _resp_arb_io_out_bits_uop_fp_ctrl_wen;
	wire _resp_arb_io_out_bits_uop_fp_ctrl_ren1;
	wire _resp_arb_io_out_bits_uop_fp_ctrl_ren2;
	wire _resp_arb_io_out_bits_uop_fp_ctrl_ren3;
	wire _resp_arb_io_out_bits_uop_fp_ctrl_swap12;
	wire _resp_arb_io_out_bits_uop_fp_ctrl_swap23;
	wire [1:0] _resp_arb_io_out_bits_uop_fp_ctrl_typeTagIn;
	wire [1:0] _resp_arb_io_out_bits_uop_fp_ctrl_typeTagOut;
	wire _resp_arb_io_out_bits_uop_fp_ctrl_fromint;
	wire _resp_arb_io_out_bits_uop_fp_ctrl_toint;
	wire _resp_arb_io_out_bits_uop_fp_ctrl_fastpipe;
	wire _resp_arb_io_out_bits_uop_fp_ctrl_fma;
	wire _resp_arb_io_out_bits_uop_fp_ctrl_div;
	wire _resp_arb_io_out_bits_uop_fp_ctrl_sqrt;
	wire _resp_arb_io_out_bits_uop_fp_ctrl_wflags;
	wire _resp_arb_io_out_bits_uop_fp_ctrl_vec;
	wire [4:0] _resp_arb_io_out_bits_uop_rob_idx;
	wire [3:0] _resp_arb_io_out_bits_uop_ldq_idx;
	wire [3:0] _resp_arb_io_out_bits_uop_stq_idx;
	wire [1:0] _resp_arb_io_out_bits_uop_rxq_idx;
	wire [5:0] _resp_arb_io_out_bits_uop_pdst;
	wire [5:0] _resp_arb_io_out_bits_uop_prs1;
	wire [5:0] _resp_arb_io_out_bits_uop_prs2;
	wire [5:0] _resp_arb_io_out_bits_uop_prs3;
	wire [3:0] _resp_arb_io_out_bits_uop_ppred;
	wire _resp_arb_io_out_bits_uop_prs1_busy;
	wire _resp_arb_io_out_bits_uop_prs2_busy;
	wire _resp_arb_io_out_bits_uop_prs3_busy;
	wire _resp_arb_io_out_bits_uop_ppred_busy;
	wire [5:0] _resp_arb_io_out_bits_uop_stale_pdst;
	wire _resp_arb_io_out_bits_uop_exception;
	wire [63:0] _resp_arb_io_out_bits_uop_exc_cause;
	wire [4:0] _resp_arb_io_out_bits_uop_mem_cmd;
	wire [1:0] _resp_arb_io_out_bits_uop_mem_size;
	wire _resp_arb_io_out_bits_uop_mem_signed;
	wire _resp_arb_io_out_bits_uop_uses_ldq;
	wire _resp_arb_io_out_bits_uop_uses_stq;
	wire _resp_arb_io_out_bits_uop_is_unique;
	wire _resp_arb_io_out_bits_uop_flush_on_commit;
	wire [2:0] _resp_arb_io_out_bits_uop_csr_cmd;
	wire _resp_arb_io_out_bits_uop_ldst_is_rs1;
	wire [5:0] _resp_arb_io_out_bits_uop_ldst;
	wire [5:0] _resp_arb_io_out_bits_uop_lrs1;
	wire [5:0] _resp_arb_io_out_bits_uop_lrs2;
	wire [5:0] _resp_arb_io_out_bits_uop_lrs3;
	wire [1:0] _resp_arb_io_out_bits_uop_dst_rtype;
	wire [1:0] _resp_arb_io_out_bits_uop_lrs1_rtype;
	wire [1:0] _resp_arb_io_out_bits_uop_lrs2_rtype;
	wire _resp_arb_io_out_bits_uop_frs3_en;
	wire _resp_arb_io_out_bits_uop_fcn_dw;
	wire [4:0] _resp_arb_io_out_bits_uop_fcn_op;
	wire _resp_arb_io_out_bits_uop_fp_val;
	wire [2:0] _resp_arb_io_out_bits_uop_fp_rm;
	wire [1:0] _resp_arb_io_out_bits_uop_fp_typ;
	wire _resp_arb_io_out_bits_uop_xcpt_pf_if;
	wire _resp_arb_io_out_bits_uop_xcpt_ae_if;
	wire _resp_arb_io_out_bits_uop_xcpt_ma_if;
	wire _resp_arb_io_out_bits_uop_bp_debug_if;
	wire _resp_arb_io_out_bits_uop_bp_xcpt_if;
	wire [2:0] _resp_arb_io_out_bits_uop_debug_fsrc;
	wire [2:0] _resp_arb_io_out_bits_uop_debug_tsrc;
	wire [63:0] _resp_arb_io_out_bits_data;
	wire _resp_arb_io_out_bits_is_hella;
	wire _replay_arb_io_in_0_ready;
	wire _replay_arb_io_in_1_ready;
	wire _replay_arb_io_out_valid;
	wire [4:0] _replay_arb_io_out_bits_uop_mem_cmd;
	wire [4:0] _replay_arb_io_out_bits_sdq_id;
	wire _wb_req_arb_io_in_0_ready;
	wire _wb_req_arb_io_in_1_ready;
	wire _meta_read_arb_io_in_0_ready;
	wire _meta_read_arb_io_in_1_ready;
	wire _meta_write_arb_io_in_0_ready;
	wire _meta_write_arb_io_in_1_ready;
	reg [16:0] sdq_val;
	wire [15:0] _sdq_alloc_id_T_1 = ~sdq_val[15:0];
	wire [4:0] sdq_alloc_id = (_sdq_alloc_id_T_1[0] ? 5'h00 : (_sdq_alloc_id_T_1[1] ? 5'h01 : (_sdq_alloc_id_T_1[2] ? 5'h02 : (_sdq_alloc_id_T_1[3] ? 5'h03 : (_sdq_alloc_id_T_1[4] ? 5'h04 : (_sdq_alloc_id_T_1[5] ? 5'h05 : (_sdq_alloc_id_T_1[6] ? 5'h06 : (_sdq_alloc_id_T_1[7] ? 5'h07 : (_sdq_alloc_id_T_1[8] ? 5'h08 : (_sdq_alloc_id_T_1[9] ? 5'h09 : (_sdq_alloc_id_T_1[10] ? 5'h0a : (_sdq_alloc_id_T_1[11] ? 5'h0b : (_sdq_alloc_id_T_1[12] ? 5'h0c : (_sdq_alloc_id_T_1[13] ? 5'h0d : (_sdq_alloc_id_T_1[14] ? 5'h0e : (_sdq_alloc_id_T_1[15] ? 5'h0f : 5'h10))))))))))))))));
	wire sdq_rdy = sdq_val != 17'h1ffff;
	wire sdq_enq = ((req_ready & io_req_0_valid) & io_req_0_bits_addr[31]) & ((((((((((((io_req_0_bits_uop_mem_cmd == 5'h01) | (io_req_0_bits_uop_mem_cmd == 5'h11)) | (io_req_0_bits_uop_mem_cmd == 5'h07)) | (io_req_0_bits_uop_mem_cmd == 5'h04)) | (io_req_0_bits_uop_mem_cmd == 5'h09)) | (io_req_0_bits_uop_mem_cmd == 5'h0a)) | (io_req_0_bits_uop_mem_cmd == 5'h0b)) | (io_req_0_bits_uop_mem_cmd == 5'h08)) | (io_req_0_bits_uop_mem_cmd == 5'h0c)) | (io_req_0_bits_uop_mem_cmd == 5'h0d)) | (io_req_0_bits_uop_mem_cmd == 5'h0e)) | (io_req_0_bits_uop_mem_cmd == 5'h0f));
	reg [63:0] lb_0_0;
	reg [63:0] lb_0_1;
	reg [63:0] lb_0_2;
	reg [63:0] lb_0_3;
	reg [63:0] lb_0_4;
	reg [63:0] lb_0_5;
	reg [63:0] lb_0_6;
	reg [63:0] lb_0_7;
	reg [63:0] lb_1_0;
	reg [63:0] lb_1_1;
	reg [63:0] lb_1_2;
	reg [63:0] lb_1_3;
	reg [63:0] lb_1_4;
	reg [63:0] lb_1_5;
	reg [63:0] lb_1_6;
	reg [63:0] lb_1_7;
	wire tag_match_0 = ((idx_matches_0_0 & _mshrs_0_io_tag_valid) & _tag_matches_0_0_T_1) | ((idx_matches_0_1 & _mshrs_1_io_tag_valid) & _tag_matches_0_1_T_1);
	wire idx_match_0 = idx_matches_0_0 | idx_matches_0_1;
	wire _mshr_io_req_sec_val_T_4 = io_req_0_valid & sdq_rdy;
	wire pri_val = (_mshr_io_req_sec_val_T_4 & io_req_0_bits_addr[31]) & ~idx_match_0;
	assign idx_matches_0_0 = _mshrs_0_io_idx_valid & (_mshrs_0_io_idx_bits == io_req_0_bits_addr[11:6]);
	assign _tag_matches_0_0_T_1 = _mshrs_0_io_tag_bits == io_req_0_bits_addr[39:12];
	assign _way_matches_0_0_T = _mshrs_0_io_way_bits == io_req_0_bits_way_en;
	wire _mshr_io_req_sec_val_T_3 = ((_mshr_io_req_sec_val_T_4 & tag_match_0) & idx_matches_0_0) & io_req_0_bits_addr[31];
	wire [511:0] _GEN = {lb_0_7, lb_0_6, lb_0_5, lb_0_4, lb_0_3, lb_0_2, lb_0_1, lb_0_0};
	wire _GEN_0 = io_mem_grant_bits_source == 2'h0;
	assign idx_matches_0_1 = _mshrs_1_io_idx_valid & (_mshrs_1_io_idx_bits == io_req_0_bits_addr[11:6]);
	assign _tag_matches_0_1_T_1 = _mshrs_1_io_tag_bits == io_req_0_bits_addr[39:12];
	assign _way_matches_0_1_T = _mshrs_1_io_way_bits == io_req_0_bits_way_en;
	wire pri_rdy = (mshr_alloc_idx_REG ? _mshrs_1_io_req_pri_rdy : ~mshr_alloc_idx_REG & _mshrs_0_io_req_pri_rdy);
	wire _mshr_io_req_sec_val_T_7 = ((_mshr_io_req_sec_val_T_4 & tag_match_0) & idx_matches_0_1) & io_req_0_bits_addr[31];
	wire [511:0] _GEN_1 = {lb_1_7, lb_1_6, lb_1_5, lb_1_4, lb_1_3, lb_1_2, lb_1_1, lb_1_0};
	wire _GEN_2 = io_mem_grant_bits_source == 2'h1;
	reg mshr_head;
	reg [8:0] beatsLeft;
	wire idle = beatsLeft == 9'h000;
	wire _GEN_3 = _mshrs_1_io_mem_acquire_valid | _mshrs_0_io_mem_acquire_valid;
	wire winner_1 = ~_mshrs_0_io_mem_acquire_valid & _mshrs_1_io_mem_acquire_valid;
	wire winner_2 = ~_GEN_3 & _mmios_0_io_mem_access_valid;
	wire _io_mem_acquire_valid_T = _mshrs_0_io_mem_acquire_valid | _mshrs_1_io_mem_acquire_valid;
	reg state_0;
	reg state_1;
	reg state_2;
	wire muxState_0 = (idle ? _mshrs_0_io_mem_acquire_valid : state_0);
	wire muxState_1 = (idle ? winner_1 : state_1);
	wire muxState_2 = (idle ? winner_2 : state_2);
	wire io_mem_acquire_valid_0 = (idle ? _io_mem_acquire_valid_T | _mmios_0_io_mem_access_valid : ((state_0 & _mshrs_0_io_mem_acquire_valid) | (state_1 & _mshrs_1_io_mem_acquire_valid)) | (state_2 & _mmios_0_io_mem_access_valid));
	wire _GEN_4 = muxState_0 | muxState_1;
	reg beatsLeft_1;
	wire winner_1_1 = ~_mshrs_0_io_mem_finish_valid & _mshrs_1_io_mem_finish_valid;
	wire _io_mem_finish_valid_T = _mshrs_0_io_mem_finish_valid | _mshrs_1_io_mem_finish_valid;
	reg state_1_0;
	reg state_1_1;
	wire io_mem_finish_valid_0 = (beatsLeft_1 ? (state_1_0 & _mshrs_0_io_mem_finish_valid) | (state_1_1 & _mshrs_1_io_mem_finish_valid) : _io_mem_finish_valid_T);
	assign req_ready = (io_req_0_bits_addr[31] ? sdq_rdy & (idx_match_0 ? tag_match_0 & ((_mshrs_0_io_req_sec_rdy & _mshr_io_req_sec_val_T_3) | (_mshrs_1_io_req_sec_rdy & _mshr_io_req_sec_val_T_7)) : pri_rdy) : _mmios_0_io_req_ready);
	always @(posedge clock) begin
		if (reset) begin
			sdq_val <= 17'h00000;
			mshr_head <= 1'h0;
			beatsLeft <= 9'h000;
			state_0 <= 1'h0;
			state_1 <= 1'h0;
			state_2 <= 1'h0;
			beatsLeft_1 <= 1'h0;
			state_1_0 <= 1'h0;
			state_1_1 <= 1'h0;
		end
		else begin
			if (_replay_arb_io_out_valid | sdq_enq) begin : sv2v_autoblock_1
				reg [16:0] _sdq_val_T_6;
				reg [31:0] _sdq_val_T;
				_sdq_val_T = 32'h00000001 << _replay_arb_io_out_bits_sdq_id;
				_sdq_val_T_6 = ~sdq_val;
				sdq_val <= (~(_sdq_val_T[16:0] & {17 {(io_replay_ready & _replay_arb_io_out_valid) & ((((((((((((_replay_arb_io_out_bits_uop_mem_cmd == 5'h01) | (_replay_arb_io_out_bits_uop_mem_cmd == 5'h11)) | (_replay_arb_io_out_bits_uop_mem_cmd == 5'h07)) | (_replay_arb_io_out_bits_uop_mem_cmd == 5'h04)) | (_replay_arb_io_out_bits_uop_mem_cmd == 5'h09)) | (_replay_arb_io_out_bits_uop_mem_cmd == 5'h0a)) | (_replay_arb_io_out_bits_uop_mem_cmd == 5'h0b)) | (_replay_arb_io_out_bits_uop_mem_cmd == 5'h08)) | (_replay_arb_io_out_bits_uop_mem_cmd == 5'h0c)) | (_replay_arb_io_out_bits_uop_mem_cmd == 5'h0d)) | (_replay_arb_io_out_bits_uop_mem_cmd == 5'h0e)) | (_replay_arb_io_out_bits_uop_mem_cmd == 5'h0f))}}) & sdq_val) | ((_sdq_val_T_6[0] ? 17'h00001 : (_sdq_val_T_6[1] ? 17'h00002 : (_sdq_val_T_6[2] ? 17'h00004 : (_sdq_val_T_6[3] ? 17'h00008 : (_sdq_val_T_6[4] ? 17'h00010 : (_sdq_val_T_6[5] ? 17'h00020 : (_sdq_val_T_6[6] ? 17'h00040 : (_sdq_val_T_6[7] ? 17'h00080 : (_sdq_val_T_6[8] ? 17'h00100 : (_sdq_val_T_6[9] ? 17'h00200 : (_sdq_val_T_6[10] ? 17'h00400 : (_sdq_val_T_6[11] ? 17'h00800 : (_sdq_val_T_6[12] ? 17'h01000 : (_sdq_val_T_6[13] ? 17'h02000 : (_sdq_val_T_6[14] ? 17'h04000 : (_sdq_val_T_6[15] ? 17'h08000 : {_sdq_val_T_6[16], 16'h0000})))))))))))))))) & {17 {sdq_enq}});
			end
			if (pri_rdy & pri_val)
				mshr_head <= mshr_head - 1'h1;
			if (idle & io_mem_acquire_ready) begin : sv2v_autoblock_2
				reg [26:0] _decode_T_6;
				_decode_T_6 = 27'h0000fff << _mmios_0_io_mem_access_bits_size;
				beatsLeft <= (winner_2 & ~_mmios_0_io_mem_access_bits_opcode[2] ? ~_decode_T_6[11:3] : 9'h000);
			end
			else
				beatsLeft <= beatsLeft - {8'h00, io_mem_acquire_ready & io_mem_acquire_valid_0};
			if (idle) begin
				state_0 <= _mshrs_0_io_mem_acquire_valid;
				state_1 <= winner_1;
				state_2 <= winner_2;
			end
			beatsLeft_1 <= ~(~beatsLeft_1 & io_mem_finish_ready) & (beatsLeft_1 - (io_mem_finish_ready & io_mem_finish_valid_0));
			if (beatsLeft_1)
				;
			else begin
				state_1_0 <= _mshrs_0_io_mem_finish_valid;
				state_1_1 <= winner_1_1;
			end
		end
		if (_mshrs_0_io_lb_write_valid & (_mshrs_0_io_lb_write_bits_offset == 3'h0))
			lb_0_0 <= _mshrs_0_io_lb_write_bits_data;
		if (_mshrs_0_io_lb_write_valid & (_mshrs_0_io_lb_write_bits_offset == 3'h1))
			lb_0_1 <= _mshrs_0_io_lb_write_bits_data;
		if (_mshrs_0_io_lb_write_valid & (_mshrs_0_io_lb_write_bits_offset == 3'h2))
			lb_0_2 <= _mshrs_0_io_lb_write_bits_data;
		if (_mshrs_0_io_lb_write_valid & (_mshrs_0_io_lb_write_bits_offset == 3'h3))
			lb_0_3 <= _mshrs_0_io_lb_write_bits_data;
		if (_mshrs_0_io_lb_write_valid & (_mshrs_0_io_lb_write_bits_offset == 3'h4))
			lb_0_4 <= _mshrs_0_io_lb_write_bits_data;
		if (_mshrs_0_io_lb_write_valid & (_mshrs_0_io_lb_write_bits_offset == 3'h5))
			lb_0_5 <= _mshrs_0_io_lb_write_bits_data;
		if (_mshrs_0_io_lb_write_valid & (_mshrs_0_io_lb_write_bits_offset == 3'h6))
			lb_0_6 <= _mshrs_0_io_lb_write_bits_data;
		if (_mshrs_0_io_lb_write_valid & (&_mshrs_0_io_lb_write_bits_offset))
			lb_0_7 <= _mshrs_0_io_lb_write_bits_data;
		if (_mshrs_1_io_lb_write_valid & (_mshrs_1_io_lb_write_bits_offset == 3'h0))
			lb_1_0 <= _mshrs_1_io_lb_write_bits_data;
		if (_mshrs_1_io_lb_write_valid & (_mshrs_1_io_lb_write_bits_offset == 3'h1))
			lb_1_1 <= _mshrs_1_io_lb_write_bits_data;
		if (_mshrs_1_io_lb_write_valid & (_mshrs_1_io_lb_write_bits_offset == 3'h2))
			lb_1_2 <= _mshrs_1_io_lb_write_bits_data;
		if (_mshrs_1_io_lb_write_valid & (_mshrs_1_io_lb_write_bits_offset == 3'h3))
			lb_1_3 <= _mshrs_1_io_lb_write_bits_data;
		if (_mshrs_1_io_lb_write_valid & (_mshrs_1_io_lb_write_bits_offset == 3'h4))
			lb_1_4 <= _mshrs_1_io_lb_write_bits_data;
		if (_mshrs_1_io_lb_write_valid & (_mshrs_1_io_lb_write_bits_offset == 3'h5))
			lb_1_5 <= _mshrs_1_io_lb_write_bits_data;
		if (_mshrs_1_io_lb_write_valid & (_mshrs_1_io_lb_write_bits_offset == 3'h6))
			lb_1_6 <= _mshrs_1_io_lb_write_bits_data;
		if (_mshrs_1_io_lb_write_valid & (&_mshrs_1_io_lb_write_bits_offset))
			lb_1_7 <= _mshrs_1_io_lb_write_bits_data;
		mshr_alloc_idx_REG <= ~(_mshrs_0_io_req_pri_rdy & ~mshr_head) & (_mshrs_1_io_req_pri_rdy | ~_mshrs_0_io_req_pri_rdy);
	end
	sdq_17x64 sdq_ext(
		.R0_addr(_replay_arb_io_out_bits_sdq_id),
		.R0_en(1'h1),
		.R0_clk(clock),
		.R0_data(io_replay_bits_data),
		.W0_addr(sdq_alloc_id),
		.W0_en(sdq_enq),
		.W0_clk(clock),
		.W0_data(io_req_0_bits_data)
	);
	Arbiter2_L1MetaWriteReq meta_write_arb(
		.io_in_0_ready(_meta_write_arb_io_in_0_ready),
		.io_in_0_valid(_mshrs_0_io_meta_write_valid),
		.io_in_0_bits_idx(_mshrs_0_io_meta_write_bits_idx),
		.io_in_0_bits_way_en(_mshrs_0_io_meta_write_bits_way_en),
		.io_in_0_bits_data_coh_state(_mshrs_0_io_meta_write_bits_data_coh_state),
		.io_in_0_bits_data_tag(_mshrs_0_io_meta_write_bits_data_tag),
		.io_in_1_ready(_meta_write_arb_io_in_1_ready),
		.io_in_1_valid(_mshrs_1_io_meta_write_valid),
		.io_in_1_bits_idx(_mshrs_1_io_meta_write_bits_idx),
		.io_in_1_bits_way_en(_mshrs_1_io_meta_write_bits_way_en),
		.io_in_1_bits_data_coh_state(_mshrs_1_io_meta_write_bits_data_coh_state),
		.io_in_1_bits_data_tag(_mshrs_1_io_meta_write_bits_data_tag),
		.io_out_ready(io_meta_write_ready),
		.io_out_valid(io_meta_write_valid),
		.io_out_bits_idx(io_meta_write_bits_idx),
		.io_out_bits_way_en(io_meta_write_bits_way_en),
		.io_out_bits_data_coh_state(io_meta_write_bits_data_coh_state),
		.io_out_bits_data_tag(io_meta_write_bits_data_tag)
	);
	Arbiter2_L1MetaReadReq meta_read_arb(
		.io_in_0_ready(_meta_read_arb_io_in_0_ready),
		.io_in_0_valid(_mshrs_0_io_meta_read_valid),
		.io_in_0_bits_idx(_mshrs_0_io_meta_read_bits_idx),
		.io_in_0_bits_way_en(_mshrs_0_io_meta_read_bits_way_en),
		.io_in_0_bits_tag(_mshrs_0_io_meta_read_bits_tag),
		.io_in_1_ready(_meta_read_arb_io_in_1_ready),
		.io_in_1_valid(_mshrs_1_io_meta_read_valid),
		.io_in_1_bits_idx(_mshrs_1_io_meta_read_bits_idx),
		.io_in_1_bits_way_en(_mshrs_1_io_meta_read_bits_way_en),
		.io_in_1_bits_tag(_mshrs_1_io_meta_read_bits_tag),
		.io_out_ready(io_meta_read_ready),
		.io_out_valid(io_meta_read_valid),
		.io_out_bits_idx(io_meta_read_bits_idx),
		.io_out_bits_way_en(io_meta_read_bits_way_en),
		.io_out_bits_tag(io_meta_read_bits_tag)
	);
	Arbiter2_WritebackReq wb_req_arb(
		.io_in_0_ready(_wb_req_arb_io_in_0_ready),
		.io_in_0_valid(_mshrs_0_io_wb_req_valid),
		.io_in_0_bits_tag(_mshrs_0_io_wb_req_bits_tag),
		.io_in_0_bits_idx(_mshrs_0_io_wb_req_bits_idx),
		.io_in_0_bits_source(_mshrs_0_io_wb_req_bits_source),
		.io_in_0_bits_param(_mshrs_0_io_wb_req_bits_param),
		.io_in_0_bits_way_en(_mshrs_0_io_wb_req_bits_way_en),
		.io_in_0_bits_voluntary(1'h1),
		.io_in_1_ready(_wb_req_arb_io_in_1_ready),
		.io_in_1_valid(_mshrs_1_io_wb_req_valid),
		.io_in_1_bits_tag(_mshrs_1_io_wb_req_bits_tag),
		.io_in_1_bits_idx(_mshrs_1_io_wb_req_bits_idx),
		.io_in_1_bits_source(_mshrs_1_io_wb_req_bits_source),
		.io_in_1_bits_param(_mshrs_1_io_wb_req_bits_param),
		.io_in_1_bits_way_en(_mshrs_1_io_wb_req_bits_way_en),
		.io_in_1_bits_voluntary(1'h1),
		.io_out_ready(io_wb_req_ready),
		.io_out_valid(io_wb_req_valid),
		.io_out_bits_tag(io_wb_req_bits_tag),
		.io_out_bits_idx(io_wb_req_bits_idx),
		.io_out_bits_source(io_wb_req_bits_source),
		.io_out_bits_param(io_wb_req_bits_param),
		.io_out_bits_way_en(io_wb_req_bits_way_en),
		.io_out_bits_voluntary(io_wb_req_bits_voluntary)
	);
	Arbiter2_BoomDCacheReqInternal replay_arb(
		.io_in_0_ready(_replay_arb_io_in_0_ready),
		.io_in_0_valid(_mshrs_0_io_replay_valid),
		.io_in_0_bits_uop_inst(_mshrs_0_io_replay_bits_uop_inst),
		.io_in_0_bits_uop_debug_inst(_mshrs_0_io_replay_bits_uop_debug_inst),
		.io_in_0_bits_uop_is_rvc(_mshrs_0_io_replay_bits_uop_is_rvc),
		.io_in_0_bits_uop_debug_pc(_mshrs_0_io_replay_bits_uop_debug_pc),
		.io_in_0_bits_uop_iq_type_0(_mshrs_0_io_replay_bits_uop_iq_type_0),
		.io_in_0_bits_uop_iq_type_1(_mshrs_0_io_replay_bits_uop_iq_type_1),
		.io_in_0_bits_uop_iq_type_2(_mshrs_0_io_replay_bits_uop_iq_type_2),
		.io_in_0_bits_uop_iq_type_3(_mshrs_0_io_replay_bits_uop_iq_type_3),
		.io_in_0_bits_uop_fu_code_0(_mshrs_0_io_replay_bits_uop_fu_code_0),
		.io_in_0_bits_uop_fu_code_1(_mshrs_0_io_replay_bits_uop_fu_code_1),
		.io_in_0_bits_uop_fu_code_2(_mshrs_0_io_replay_bits_uop_fu_code_2),
		.io_in_0_bits_uop_fu_code_3(_mshrs_0_io_replay_bits_uop_fu_code_3),
		.io_in_0_bits_uop_fu_code_4(_mshrs_0_io_replay_bits_uop_fu_code_4),
		.io_in_0_bits_uop_fu_code_5(_mshrs_0_io_replay_bits_uop_fu_code_5),
		.io_in_0_bits_uop_fu_code_6(_mshrs_0_io_replay_bits_uop_fu_code_6),
		.io_in_0_bits_uop_fu_code_7(_mshrs_0_io_replay_bits_uop_fu_code_7),
		.io_in_0_bits_uop_fu_code_8(_mshrs_0_io_replay_bits_uop_fu_code_8),
		.io_in_0_bits_uop_fu_code_9(_mshrs_0_io_replay_bits_uop_fu_code_9),
		.io_in_0_bits_uop_iw_issued(_mshrs_0_io_replay_bits_uop_iw_issued),
		.io_in_0_bits_uop_iw_issued_partial_agen(_mshrs_0_io_replay_bits_uop_iw_issued_partial_agen),
		.io_in_0_bits_uop_iw_issued_partial_dgen(_mshrs_0_io_replay_bits_uop_iw_issued_partial_dgen),
		.io_in_0_bits_uop_iw_p1_speculative_child(_mshrs_0_io_replay_bits_uop_iw_p1_speculative_child),
		.io_in_0_bits_uop_iw_p2_speculative_child(_mshrs_0_io_replay_bits_uop_iw_p2_speculative_child),
		.io_in_0_bits_uop_iw_p1_bypass_hint(_mshrs_0_io_replay_bits_uop_iw_p1_bypass_hint),
		.io_in_0_bits_uop_iw_p2_bypass_hint(_mshrs_0_io_replay_bits_uop_iw_p2_bypass_hint),
		.io_in_0_bits_uop_iw_p3_bypass_hint(_mshrs_0_io_replay_bits_uop_iw_p3_bypass_hint),
		.io_in_0_bits_uop_dis_col_sel(_mshrs_0_io_replay_bits_uop_dis_col_sel),
		.io_in_0_bits_uop_br_mask(_mshrs_0_io_replay_bits_uop_br_mask),
		.io_in_0_bits_uop_br_tag(_mshrs_0_io_replay_bits_uop_br_tag),
		.io_in_0_bits_uop_br_type(_mshrs_0_io_replay_bits_uop_br_type),
		.io_in_0_bits_uop_is_sfb(_mshrs_0_io_replay_bits_uop_is_sfb),
		.io_in_0_bits_uop_is_fence(_mshrs_0_io_replay_bits_uop_is_fence),
		.io_in_0_bits_uop_is_fencei(_mshrs_0_io_replay_bits_uop_is_fencei),
		.io_in_0_bits_uop_is_sfence(_mshrs_0_io_replay_bits_uop_is_sfence),
		.io_in_0_bits_uop_is_amo(_mshrs_0_io_replay_bits_uop_is_amo),
		.io_in_0_bits_uop_is_eret(_mshrs_0_io_replay_bits_uop_is_eret),
		.io_in_0_bits_uop_is_sys_pc2epc(_mshrs_0_io_replay_bits_uop_is_sys_pc2epc),
		.io_in_0_bits_uop_is_rocc(_mshrs_0_io_replay_bits_uop_is_rocc),
		.io_in_0_bits_uop_is_mov(_mshrs_0_io_replay_bits_uop_is_mov),
		.io_in_0_bits_uop_ftq_idx(_mshrs_0_io_replay_bits_uop_ftq_idx),
		.io_in_0_bits_uop_edge_inst(_mshrs_0_io_replay_bits_uop_edge_inst),
		.io_in_0_bits_uop_pc_lob(_mshrs_0_io_replay_bits_uop_pc_lob),
		.io_in_0_bits_uop_taken(_mshrs_0_io_replay_bits_uop_taken),
		.io_in_0_bits_uop_imm_rename(_mshrs_0_io_replay_bits_uop_imm_rename),
		.io_in_0_bits_uop_imm_sel(_mshrs_0_io_replay_bits_uop_imm_sel),
		.io_in_0_bits_uop_pimm(_mshrs_0_io_replay_bits_uop_pimm),
		.io_in_0_bits_uop_imm_packed(_mshrs_0_io_replay_bits_uop_imm_packed),
		.io_in_0_bits_uop_op1_sel(_mshrs_0_io_replay_bits_uop_op1_sel),
		.io_in_0_bits_uop_op2_sel(_mshrs_0_io_replay_bits_uop_op2_sel),
		.io_in_0_bits_uop_fp_ctrl_ldst(_mshrs_0_io_replay_bits_uop_fp_ctrl_ldst),
		.io_in_0_bits_uop_fp_ctrl_wen(_mshrs_0_io_replay_bits_uop_fp_ctrl_wen),
		.io_in_0_bits_uop_fp_ctrl_ren1(_mshrs_0_io_replay_bits_uop_fp_ctrl_ren1),
		.io_in_0_bits_uop_fp_ctrl_ren2(_mshrs_0_io_replay_bits_uop_fp_ctrl_ren2),
		.io_in_0_bits_uop_fp_ctrl_ren3(_mshrs_0_io_replay_bits_uop_fp_ctrl_ren3),
		.io_in_0_bits_uop_fp_ctrl_swap12(_mshrs_0_io_replay_bits_uop_fp_ctrl_swap12),
		.io_in_0_bits_uop_fp_ctrl_swap23(_mshrs_0_io_replay_bits_uop_fp_ctrl_swap23),
		.io_in_0_bits_uop_fp_ctrl_typeTagIn(_mshrs_0_io_replay_bits_uop_fp_ctrl_typeTagIn),
		.io_in_0_bits_uop_fp_ctrl_typeTagOut(_mshrs_0_io_replay_bits_uop_fp_ctrl_typeTagOut),
		.io_in_0_bits_uop_fp_ctrl_fromint(_mshrs_0_io_replay_bits_uop_fp_ctrl_fromint),
		.io_in_0_bits_uop_fp_ctrl_toint(_mshrs_0_io_replay_bits_uop_fp_ctrl_toint),
		.io_in_0_bits_uop_fp_ctrl_fastpipe(_mshrs_0_io_replay_bits_uop_fp_ctrl_fastpipe),
		.io_in_0_bits_uop_fp_ctrl_fma(_mshrs_0_io_replay_bits_uop_fp_ctrl_fma),
		.io_in_0_bits_uop_fp_ctrl_div(_mshrs_0_io_replay_bits_uop_fp_ctrl_div),
		.io_in_0_bits_uop_fp_ctrl_sqrt(_mshrs_0_io_replay_bits_uop_fp_ctrl_sqrt),
		.io_in_0_bits_uop_fp_ctrl_wflags(_mshrs_0_io_replay_bits_uop_fp_ctrl_wflags),
		.io_in_0_bits_uop_fp_ctrl_vec(_mshrs_0_io_replay_bits_uop_fp_ctrl_vec),
		.io_in_0_bits_uop_rob_idx(_mshrs_0_io_replay_bits_uop_rob_idx),
		.io_in_0_bits_uop_ldq_idx(_mshrs_0_io_replay_bits_uop_ldq_idx),
		.io_in_0_bits_uop_stq_idx(_mshrs_0_io_replay_bits_uop_stq_idx),
		.io_in_0_bits_uop_rxq_idx(_mshrs_0_io_replay_bits_uop_rxq_idx),
		.io_in_0_bits_uop_pdst(_mshrs_0_io_replay_bits_uop_pdst),
		.io_in_0_bits_uop_prs1(_mshrs_0_io_replay_bits_uop_prs1),
		.io_in_0_bits_uop_prs2(_mshrs_0_io_replay_bits_uop_prs2),
		.io_in_0_bits_uop_prs3(_mshrs_0_io_replay_bits_uop_prs3),
		.io_in_0_bits_uop_ppred(_mshrs_0_io_replay_bits_uop_ppred),
		.io_in_0_bits_uop_prs1_busy(_mshrs_0_io_replay_bits_uop_prs1_busy),
		.io_in_0_bits_uop_prs2_busy(_mshrs_0_io_replay_bits_uop_prs2_busy),
		.io_in_0_bits_uop_prs3_busy(_mshrs_0_io_replay_bits_uop_prs3_busy),
		.io_in_0_bits_uop_ppred_busy(_mshrs_0_io_replay_bits_uop_ppred_busy),
		.io_in_0_bits_uop_stale_pdst(_mshrs_0_io_replay_bits_uop_stale_pdst),
		.io_in_0_bits_uop_exception(_mshrs_0_io_replay_bits_uop_exception),
		.io_in_0_bits_uop_exc_cause(_mshrs_0_io_replay_bits_uop_exc_cause),
		.io_in_0_bits_uop_mem_cmd(_mshrs_0_io_replay_bits_uop_mem_cmd),
		.io_in_0_bits_uop_mem_size(_mshrs_0_io_replay_bits_uop_mem_size),
		.io_in_0_bits_uop_mem_signed(_mshrs_0_io_replay_bits_uop_mem_signed),
		.io_in_0_bits_uop_uses_ldq(_mshrs_0_io_replay_bits_uop_uses_ldq),
		.io_in_0_bits_uop_uses_stq(_mshrs_0_io_replay_bits_uop_uses_stq),
		.io_in_0_bits_uop_is_unique(_mshrs_0_io_replay_bits_uop_is_unique),
		.io_in_0_bits_uop_flush_on_commit(_mshrs_0_io_replay_bits_uop_flush_on_commit),
		.io_in_0_bits_uop_csr_cmd(_mshrs_0_io_replay_bits_uop_csr_cmd),
		.io_in_0_bits_uop_ldst_is_rs1(_mshrs_0_io_replay_bits_uop_ldst_is_rs1),
		.io_in_0_bits_uop_ldst(_mshrs_0_io_replay_bits_uop_ldst),
		.io_in_0_bits_uop_lrs1(_mshrs_0_io_replay_bits_uop_lrs1),
		.io_in_0_bits_uop_lrs2(_mshrs_0_io_replay_bits_uop_lrs2),
		.io_in_0_bits_uop_lrs3(_mshrs_0_io_replay_bits_uop_lrs3),
		.io_in_0_bits_uop_dst_rtype(_mshrs_0_io_replay_bits_uop_dst_rtype),
		.io_in_0_bits_uop_lrs1_rtype(_mshrs_0_io_replay_bits_uop_lrs1_rtype),
		.io_in_0_bits_uop_lrs2_rtype(_mshrs_0_io_replay_bits_uop_lrs2_rtype),
		.io_in_0_bits_uop_frs3_en(_mshrs_0_io_replay_bits_uop_frs3_en),
		.io_in_0_bits_uop_fcn_dw(_mshrs_0_io_replay_bits_uop_fcn_dw),
		.io_in_0_bits_uop_fcn_op(_mshrs_0_io_replay_bits_uop_fcn_op),
		.io_in_0_bits_uop_fp_val(_mshrs_0_io_replay_bits_uop_fp_val),
		.io_in_0_bits_uop_fp_rm(_mshrs_0_io_replay_bits_uop_fp_rm),
		.io_in_0_bits_uop_fp_typ(_mshrs_0_io_replay_bits_uop_fp_typ),
		.io_in_0_bits_uop_xcpt_pf_if(_mshrs_0_io_replay_bits_uop_xcpt_pf_if),
		.io_in_0_bits_uop_xcpt_ae_if(_mshrs_0_io_replay_bits_uop_xcpt_ae_if),
		.io_in_0_bits_uop_xcpt_ma_if(_mshrs_0_io_replay_bits_uop_xcpt_ma_if),
		.io_in_0_bits_uop_bp_debug_if(_mshrs_0_io_replay_bits_uop_bp_debug_if),
		.io_in_0_bits_uop_bp_xcpt_if(_mshrs_0_io_replay_bits_uop_bp_xcpt_if),
		.io_in_0_bits_uop_debug_fsrc(_mshrs_0_io_replay_bits_uop_debug_fsrc),
		.io_in_0_bits_uop_debug_tsrc(_mshrs_0_io_replay_bits_uop_debug_tsrc),
		.io_in_0_bits_addr(_mshrs_0_io_replay_bits_addr),
		.io_in_0_bits_is_hella(_mshrs_0_io_replay_bits_is_hella),
		.io_in_0_bits_way_en(_mshrs_0_io_replay_bits_way_en),
		.io_in_0_bits_sdq_id(_mshrs_0_io_replay_bits_sdq_id),
		.io_in_1_ready(_replay_arb_io_in_1_ready),
		.io_in_1_valid(_mshrs_1_io_replay_valid),
		.io_in_1_bits_uop_inst(_mshrs_1_io_replay_bits_uop_inst),
		.io_in_1_bits_uop_debug_inst(_mshrs_1_io_replay_bits_uop_debug_inst),
		.io_in_1_bits_uop_is_rvc(_mshrs_1_io_replay_bits_uop_is_rvc),
		.io_in_1_bits_uop_debug_pc(_mshrs_1_io_replay_bits_uop_debug_pc),
		.io_in_1_bits_uop_iq_type_0(_mshrs_1_io_replay_bits_uop_iq_type_0),
		.io_in_1_bits_uop_iq_type_1(_mshrs_1_io_replay_bits_uop_iq_type_1),
		.io_in_1_bits_uop_iq_type_2(_mshrs_1_io_replay_bits_uop_iq_type_2),
		.io_in_1_bits_uop_iq_type_3(_mshrs_1_io_replay_bits_uop_iq_type_3),
		.io_in_1_bits_uop_fu_code_0(_mshrs_1_io_replay_bits_uop_fu_code_0),
		.io_in_1_bits_uop_fu_code_1(_mshrs_1_io_replay_bits_uop_fu_code_1),
		.io_in_1_bits_uop_fu_code_2(_mshrs_1_io_replay_bits_uop_fu_code_2),
		.io_in_1_bits_uop_fu_code_3(_mshrs_1_io_replay_bits_uop_fu_code_3),
		.io_in_1_bits_uop_fu_code_4(_mshrs_1_io_replay_bits_uop_fu_code_4),
		.io_in_1_bits_uop_fu_code_5(_mshrs_1_io_replay_bits_uop_fu_code_5),
		.io_in_1_bits_uop_fu_code_6(_mshrs_1_io_replay_bits_uop_fu_code_6),
		.io_in_1_bits_uop_fu_code_7(_mshrs_1_io_replay_bits_uop_fu_code_7),
		.io_in_1_bits_uop_fu_code_8(_mshrs_1_io_replay_bits_uop_fu_code_8),
		.io_in_1_bits_uop_fu_code_9(_mshrs_1_io_replay_bits_uop_fu_code_9),
		.io_in_1_bits_uop_iw_issued(_mshrs_1_io_replay_bits_uop_iw_issued),
		.io_in_1_bits_uop_iw_issued_partial_agen(_mshrs_1_io_replay_bits_uop_iw_issued_partial_agen),
		.io_in_1_bits_uop_iw_issued_partial_dgen(_mshrs_1_io_replay_bits_uop_iw_issued_partial_dgen),
		.io_in_1_bits_uop_iw_p1_speculative_child(_mshrs_1_io_replay_bits_uop_iw_p1_speculative_child),
		.io_in_1_bits_uop_iw_p2_speculative_child(_mshrs_1_io_replay_bits_uop_iw_p2_speculative_child),
		.io_in_1_bits_uop_iw_p1_bypass_hint(_mshrs_1_io_replay_bits_uop_iw_p1_bypass_hint),
		.io_in_1_bits_uop_iw_p2_bypass_hint(_mshrs_1_io_replay_bits_uop_iw_p2_bypass_hint),
		.io_in_1_bits_uop_iw_p3_bypass_hint(_mshrs_1_io_replay_bits_uop_iw_p3_bypass_hint),
		.io_in_1_bits_uop_dis_col_sel(_mshrs_1_io_replay_bits_uop_dis_col_sel),
		.io_in_1_bits_uop_br_mask(_mshrs_1_io_replay_bits_uop_br_mask),
		.io_in_1_bits_uop_br_tag(_mshrs_1_io_replay_bits_uop_br_tag),
		.io_in_1_bits_uop_br_type(_mshrs_1_io_replay_bits_uop_br_type),
		.io_in_1_bits_uop_is_sfb(_mshrs_1_io_replay_bits_uop_is_sfb),
		.io_in_1_bits_uop_is_fence(_mshrs_1_io_replay_bits_uop_is_fence),
		.io_in_1_bits_uop_is_fencei(_mshrs_1_io_replay_bits_uop_is_fencei),
		.io_in_1_bits_uop_is_sfence(_mshrs_1_io_replay_bits_uop_is_sfence),
		.io_in_1_bits_uop_is_amo(_mshrs_1_io_replay_bits_uop_is_amo),
		.io_in_1_bits_uop_is_eret(_mshrs_1_io_replay_bits_uop_is_eret),
		.io_in_1_bits_uop_is_sys_pc2epc(_mshrs_1_io_replay_bits_uop_is_sys_pc2epc),
		.io_in_1_bits_uop_is_rocc(_mshrs_1_io_replay_bits_uop_is_rocc),
		.io_in_1_bits_uop_is_mov(_mshrs_1_io_replay_bits_uop_is_mov),
		.io_in_1_bits_uop_ftq_idx(_mshrs_1_io_replay_bits_uop_ftq_idx),
		.io_in_1_bits_uop_edge_inst(_mshrs_1_io_replay_bits_uop_edge_inst),
		.io_in_1_bits_uop_pc_lob(_mshrs_1_io_replay_bits_uop_pc_lob),
		.io_in_1_bits_uop_taken(_mshrs_1_io_replay_bits_uop_taken),
		.io_in_1_bits_uop_imm_rename(_mshrs_1_io_replay_bits_uop_imm_rename),
		.io_in_1_bits_uop_imm_sel(_mshrs_1_io_replay_bits_uop_imm_sel),
		.io_in_1_bits_uop_pimm(_mshrs_1_io_replay_bits_uop_pimm),
		.io_in_1_bits_uop_imm_packed(_mshrs_1_io_replay_bits_uop_imm_packed),
		.io_in_1_bits_uop_op1_sel(_mshrs_1_io_replay_bits_uop_op1_sel),
		.io_in_1_bits_uop_op2_sel(_mshrs_1_io_replay_bits_uop_op2_sel),
		.io_in_1_bits_uop_fp_ctrl_ldst(_mshrs_1_io_replay_bits_uop_fp_ctrl_ldst),
		.io_in_1_bits_uop_fp_ctrl_wen(_mshrs_1_io_replay_bits_uop_fp_ctrl_wen),
		.io_in_1_bits_uop_fp_ctrl_ren1(_mshrs_1_io_replay_bits_uop_fp_ctrl_ren1),
		.io_in_1_bits_uop_fp_ctrl_ren2(_mshrs_1_io_replay_bits_uop_fp_ctrl_ren2),
		.io_in_1_bits_uop_fp_ctrl_ren3(_mshrs_1_io_replay_bits_uop_fp_ctrl_ren3),
		.io_in_1_bits_uop_fp_ctrl_swap12(_mshrs_1_io_replay_bits_uop_fp_ctrl_swap12),
		.io_in_1_bits_uop_fp_ctrl_swap23(_mshrs_1_io_replay_bits_uop_fp_ctrl_swap23),
		.io_in_1_bits_uop_fp_ctrl_typeTagIn(_mshrs_1_io_replay_bits_uop_fp_ctrl_typeTagIn),
		.io_in_1_bits_uop_fp_ctrl_typeTagOut(_mshrs_1_io_replay_bits_uop_fp_ctrl_typeTagOut),
		.io_in_1_bits_uop_fp_ctrl_fromint(_mshrs_1_io_replay_bits_uop_fp_ctrl_fromint),
		.io_in_1_bits_uop_fp_ctrl_toint(_mshrs_1_io_replay_bits_uop_fp_ctrl_toint),
		.io_in_1_bits_uop_fp_ctrl_fastpipe(_mshrs_1_io_replay_bits_uop_fp_ctrl_fastpipe),
		.io_in_1_bits_uop_fp_ctrl_fma(_mshrs_1_io_replay_bits_uop_fp_ctrl_fma),
		.io_in_1_bits_uop_fp_ctrl_div(_mshrs_1_io_replay_bits_uop_fp_ctrl_div),
		.io_in_1_bits_uop_fp_ctrl_sqrt(_mshrs_1_io_replay_bits_uop_fp_ctrl_sqrt),
		.io_in_1_bits_uop_fp_ctrl_wflags(_mshrs_1_io_replay_bits_uop_fp_ctrl_wflags),
		.io_in_1_bits_uop_fp_ctrl_vec(_mshrs_1_io_replay_bits_uop_fp_ctrl_vec),
		.io_in_1_bits_uop_rob_idx(_mshrs_1_io_replay_bits_uop_rob_idx),
		.io_in_1_bits_uop_ldq_idx(_mshrs_1_io_replay_bits_uop_ldq_idx),
		.io_in_1_bits_uop_stq_idx(_mshrs_1_io_replay_bits_uop_stq_idx),
		.io_in_1_bits_uop_rxq_idx(_mshrs_1_io_replay_bits_uop_rxq_idx),
		.io_in_1_bits_uop_pdst(_mshrs_1_io_replay_bits_uop_pdst),
		.io_in_1_bits_uop_prs1(_mshrs_1_io_replay_bits_uop_prs1),
		.io_in_1_bits_uop_prs2(_mshrs_1_io_replay_bits_uop_prs2),
		.io_in_1_bits_uop_prs3(_mshrs_1_io_replay_bits_uop_prs3),
		.io_in_1_bits_uop_ppred(_mshrs_1_io_replay_bits_uop_ppred),
		.io_in_1_bits_uop_prs1_busy(_mshrs_1_io_replay_bits_uop_prs1_busy),
		.io_in_1_bits_uop_prs2_busy(_mshrs_1_io_replay_bits_uop_prs2_busy),
		.io_in_1_bits_uop_prs3_busy(_mshrs_1_io_replay_bits_uop_prs3_busy),
		.io_in_1_bits_uop_ppred_busy(_mshrs_1_io_replay_bits_uop_ppred_busy),
		.io_in_1_bits_uop_stale_pdst(_mshrs_1_io_replay_bits_uop_stale_pdst),
		.io_in_1_bits_uop_exception(_mshrs_1_io_replay_bits_uop_exception),
		.io_in_1_bits_uop_exc_cause(_mshrs_1_io_replay_bits_uop_exc_cause),
		.io_in_1_bits_uop_mem_cmd(_mshrs_1_io_replay_bits_uop_mem_cmd),
		.io_in_1_bits_uop_mem_size(_mshrs_1_io_replay_bits_uop_mem_size),
		.io_in_1_bits_uop_mem_signed(_mshrs_1_io_replay_bits_uop_mem_signed),
		.io_in_1_bits_uop_uses_ldq(_mshrs_1_io_replay_bits_uop_uses_ldq),
		.io_in_1_bits_uop_uses_stq(_mshrs_1_io_replay_bits_uop_uses_stq),
		.io_in_1_bits_uop_is_unique(_mshrs_1_io_replay_bits_uop_is_unique),
		.io_in_1_bits_uop_flush_on_commit(_mshrs_1_io_replay_bits_uop_flush_on_commit),
		.io_in_1_bits_uop_csr_cmd(_mshrs_1_io_replay_bits_uop_csr_cmd),
		.io_in_1_bits_uop_ldst_is_rs1(_mshrs_1_io_replay_bits_uop_ldst_is_rs1),
		.io_in_1_bits_uop_ldst(_mshrs_1_io_replay_bits_uop_ldst),
		.io_in_1_bits_uop_lrs1(_mshrs_1_io_replay_bits_uop_lrs1),
		.io_in_1_bits_uop_lrs2(_mshrs_1_io_replay_bits_uop_lrs2),
		.io_in_1_bits_uop_lrs3(_mshrs_1_io_replay_bits_uop_lrs3),
		.io_in_1_bits_uop_dst_rtype(_mshrs_1_io_replay_bits_uop_dst_rtype),
		.io_in_1_bits_uop_lrs1_rtype(_mshrs_1_io_replay_bits_uop_lrs1_rtype),
		.io_in_1_bits_uop_lrs2_rtype(_mshrs_1_io_replay_bits_uop_lrs2_rtype),
		.io_in_1_bits_uop_frs3_en(_mshrs_1_io_replay_bits_uop_frs3_en),
		.io_in_1_bits_uop_fcn_dw(_mshrs_1_io_replay_bits_uop_fcn_dw),
		.io_in_1_bits_uop_fcn_op(_mshrs_1_io_replay_bits_uop_fcn_op),
		.io_in_1_bits_uop_fp_val(_mshrs_1_io_replay_bits_uop_fp_val),
		.io_in_1_bits_uop_fp_rm(_mshrs_1_io_replay_bits_uop_fp_rm),
		.io_in_1_bits_uop_fp_typ(_mshrs_1_io_replay_bits_uop_fp_typ),
		.io_in_1_bits_uop_xcpt_pf_if(_mshrs_1_io_replay_bits_uop_xcpt_pf_if),
		.io_in_1_bits_uop_xcpt_ae_if(_mshrs_1_io_replay_bits_uop_xcpt_ae_if),
		.io_in_1_bits_uop_xcpt_ma_if(_mshrs_1_io_replay_bits_uop_xcpt_ma_if),
		.io_in_1_bits_uop_bp_debug_if(_mshrs_1_io_replay_bits_uop_bp_debug_if),
		.io_in_1_bits_uop_bp_xcpt_if(_mshrs_1_io_replay_bits_uop_bp_xcpt_if),
		.io_in_1_bits_uop_debug_fsrc(_mshrs_1_io_replay_bits_uop_debug_fsrc),
		.io_in_1_bits_uop_debug_tsrc(_mshrs_1_io_replay_bits_uop_debug_tsrc),
		.io_in_1_bits_addr(_mshrs_1_io_replay_bits_addr),
		.io_in_1_bits_is_hella(_mshrs_1_io_replay_bits_is_hella),
		.io_in_1_bits_way_en(_mshrs_1_io_replay_bits_way_en),
		.io_in_1_bits_sdq_id(_mshrs_1_io_replay_bits_sdq_id),
		.io_out_ready(io_replay_ready),
		.io_out_valid(_replay_arb_io_out_valid),
		.io_out_bits_uop_inst(io_replay_bits_uop_inst),
		.io_out_bits_uop_debug_inst(io_replay_bits_uop_debug_inst),
		.io_out_bits_uop_is_rvc(io_replay_bits_uop_is_rvc),
		.io_out_bits_uop_debug_pc(io_replay_bits_uop_debug_pc),
		.io_out_bits_uop_iq_type_0(io_replay_bits_uop_iq_type_0),
		.io_out_bits_uop_iq_type_1(io_replay_bits_uop_iq_type_1),
		.io_out_bits_uop_iq_type_2(io_replay_bits_uop_iq_type_2),
		.io_out_bits_uop_iq_type_3(io_replay_bits_uop_iq_type_3),
		.io_out_bits_uop_fu_code_0(io_replay_bits_uop_fu_code_0),
		.io_out_bits_uop_fu_code_1(io_replay_bits_uop_fu_code_1),
		.io_out_bits_uop_fu_code_2(io_replay_bits_uop_fu_code_2),
		.io_out_bits_uop_fu_code_3(io_replay_bits_uop_fu_code_3),
		.io_out_bits_uop_fu_code_4(io_replay_bits_uop_fu_code_4),
		.io_out_bits_uop_fu_code_5(io_replay_bits_uop_fu_code_5),
		.io_out_bits_uop_fu_code_6(io_replay_bits_uop_fu_code_6),
		.io_out_bits_uop_fu_code_7(io_replay_bits_uop_fu_code_7),
		.io_out_bits_uop_fu_code_8(io_replay_bits_uop_fu_code_8),
		.io_out_bits_uop_fu_code_9(io_replay_bits_uop_fu_code_9),
		.io_out_bits_uop_iw_issued(io_replay_bits_uop_iw_issued),
		.io_out_bits_uop_iw_issued_partial_agen(io_replay_bits_uop_iw_issued_partial_agen),
		.io_out_bits_uop_iw_issued_partial_dgen(io_replay_bits_uop_iw_issued_partial_dgen),
		.io_out_bits_uop_iw_p1_speculative_child(io_replay_bits_uop_iw_p1_speculative_child),
		.io_out_bits_uop_iw_p2_speculative_child(io_replay_bits_uop_iw_p2_speculative_child),
		.io_out_bits_uop_iw_p1_bypass_hint(io_replay_bits_uop_iw_p1_bypass_hint),
		.io_out_bits_uop_iw_p2_bypass_hint(io_replay_bits_uop_iw_p2_bypass_hint),
		.io_out_bits_uop_iw_p3_bypass_hint(io_replay_bits_uop_iw_p3_bypass_hint),
		.io_out_bits_uop_dis_col_sel(io_replay_bits_uop_dis_col_sel),
		.io_out_bits_uop_br_mask(io_replay_bits_uop_br_mask),
		.io_out_bits_uop_br_tag(io_replay_bits_uop_br_tag),
		.io_out_bits_uop_br_type(io_replay_bits_uop_br_type),
		.io_out_bits_uop_is_sfb(io_replay_bits_uop_is_sfb),
		.io_out_bits_uop_is_fence(io_replay_bits_uop_is_fence),
		.io_out_bits_uop_is_fencei(io_replay_bits_uop_is_fencei),
		.io_out_bits_uop_is_sfence(io_replay_bits_uop_is_sfence),
		.io_out_bits_uop_is_amo(io_replay_bits_uop_is_amo),
		.io_out_bits_uop_is_eret(io_replay_bits_uop_is_eret),
		.io_out_bits_uop_is_sys_pc2epc(io_replay_bits_uop_is_sys_pc2epc),
		.io_out_bits_uop_is_rocc(io_replay_bits_uop_is_rocc),
		.io_out_bits_uop_is_mov(io_replay_bits_uop_is_mov),
		.io_out_bits_uop_ftq_idx(io_replay_bits_uop_ftq_idx),
		.io_out_bits_uop_edge_inst(io_replay_bits_uop_edge_inst),
		.io_out_bits_uop_pc_lob(io_replay_bits_uop_pc_lob),
		.io_out_bits_uop_taken(io_replay_bits_uop_taken),
		.io_out_bits_uop_imm_rename(io_replay_bits_uop_imm_rename),
		.io_out_bits_uop_imm_sel(io_replay_bits_uop_imm_sel),
		.io_out_bits_uop_pimm(io_replay_bits_uop_pimm),
		.io_out_bits_uop_imm_packed(io_replay_bits_uop_imm_packed),
		.io_out_bits_uop_op1_sel(io_replay_bits_uop_op1_sel),
		.io_out_bits_uop_op2_sel(io_replay_bits_uop_op2_sel),
		.io_out_bits_uop_fp_ctrl_ldst(io_replay_bits_uop_fp_ctrl_ldst),
		.io_out_bits_uop_fp_ctrl_wen(io_replay_bits_uop_fp_ctrl_wen),
		.io_out_bits_uop_fp_ctrl_ren1(io_replay_bits_uop_fp_ctrl_ren1),
		.io_out_bits_uop_fp_ctrl_ren2(io_replay_bits_uop_fp_ctrl_ren2),
		.io_out_bits_uop_fp_ctrl_ren3(io_replay_bits_uop_fp_ctrl_ren3),
		.io_out_bits_uop_fp_ctrl_swap12(io_replay_bits_uop_fp_ctrl_swap12),
		.io_out_bits_uop_fp_ctrl_swap23(io_replay_bits_uop_fp_ctrl_swap23),
		.io_out_bits_uop_fp_ctrl_typeTagIn(io_replay_bits_uop_fp_ctrl_typeTagIn),
		.io_out_bits_uop_fp_ctrl_typeTagOut(io_replay_bits_uop_fp_ctrl_typeTagOut),
		.io_out_bits_uop_fp_ctrl_fromint(io_replay_bits_uop_fp_ctrl_fromint),
		.io_out_bits_uop_fp_ctrl_toint(io_replay_bits_uop_fp_ctrl_toint),
		.io_out_bits_uop_fp_ctrl_fastpipe(io_replay_bits_uop_fp_ctrl_fastpipe),
		.io_out_bits_uop_fp_ctrl_fma(io_replay_bits_uop_fp_ctrl_fma),
		.io_out_bits_uop_fp_ctrl_div(io_replay_bits_uop_fp_ctrl_div),
		.io_out_bits_uop_fp_ctrl_sqrt(io_replay_bits_uop_fp_ctrl_sqrt),
		.io_out_bits_uop_fp_ctrl_wflags(io_replay_bits_uop_fp_ctrl_wflags),
		.io_out_bits_uop_fp_ctrl_vec(io_replay_bits_uop_fp_ctrl_vec),
		.io_out_bits_uop_rob_idx(io_replay_bits_uop_rob_idx),
		.io_out_bits_uop_ldq_idx(io_replay_bits_uop_ldq_idx),
		.io_out_bits_uop_stq_idx(io_replay_bits_uop_stq_idx),
		.io_out_bits_uop_rxq_idx(io_replay_bits_uop_rxq_idx),
		.io_out_bits_uop_pdst(io_replay_bits_uop_pdst),
		.io_out_bits_uop_prs1(io_replay_bits_uop_prs1),
		.io_out_bits_uop_prs2(io_replay_bits_uop_prs2),
		.io_out_bits_uop_prs3(io_replay_bits_uop_prs3),
		.io_out_bits_uop_ppred(io_replay_bits_uop_ppred),
		.io_out_bits_uop_prs1_busy(io_replay_bits_uop_prs1_busy),
		.io_out_bits_uop_prs2_busy(io_replay_bits_uop_prs2_busy),
		.io_out_bits_uop_prs3_busy(io_replay_bits_uop_prs3_busy),
		.io_out_bits_uop_ppred_busy(io_replay_bits_uop_ppred_busy),
		.io_out_bits_uop_stale_pdst(io_replay_bits_uop_stale_pdst),
		.io_out_bits_uop_exception(io_replay_bits_uop_exception),
		.io_out_bits_uop_exc_cause(io_replay_bits_uop_exc_cause),
		.io_out_bits_uop_mem_cmd(_replay_arb_io_out_bits_uop_mem_cmd),
		.io_out_bits_uop_mem_size(io_replay_bits_uop_mem_size),
		.io_out_bits_uop_mem_signed(io_replay_bits_uop_mem_signed),
		.io_out_bits_uop_uses_ldq(io_replay_bits_uop_uses_ldq),
		.io_out_bits_uop_uses_stq(io_replay_bits_uop_uses_stq),
		.io_out_bits_uop_is_unique(io_replay_bits_uop_is_unique),
		.io_out_bits_uop_flush_on_commit(io_replay_bits_uop_flush_on_commit),
		.io_out_bits_uop_csr_cmd(io_replay_bits_uop_csr_cmd),
		.io_out_bits_uop_ldst_is_rs1(io_replay_bits_uop_ldst_is_rs1),
		.io_out_bits_uop_ldst(io_replay_bits_uop_ldst),
		.io_out_bits_uop_lrs1(io_replay_bits_uop_lrs1),
		.io_out_bits_uop_lrs2(io_replay_bits_uop_lrs2),
		.io_out_bits_uop_lrs3(io_replay_bits_uop_lrs3),
		.io_out_bits_uop_dst_rtype(io_replay_bits_uop_dst_rtype),
		.io_out_bits_uop_lrs1_rtype(io_replay_bits_uop_lrs1_rtype),
		.io_out_bits_uop_lrs2_rtype(io_replay_bits_uop_lrs2_rtype),
		.io_out_bits_uop_frs3_en(io_replay_bits_uop_frs3_en),
		.io_out_bits_uop_fcn_dw(io_replay_bits_uop_fcn_dw),
		.io_out_bits_uop_fcn_op(io_replay_bits_uop_fcn_op),
		.io_out_bits_uop_fp_val(io_replay_bits_uop_fp_val),
		.io_out_bits_uop_fp_rm(io_replay_bits_uop_fp_rm),
		.io_out_bits_uop_fp_typ(io_replay_bits_uop_fp_typ),
		.io_out_bits_uop_xcpt_pf_if(io_replay_bits_uop_xcpt_pf_if),
		.io_out_bits_uop_xcpt_ae_if(io_replay_bits_uop_xcpt_ae_if),
		.io_out_bits_uop_xcpt_ma_if(io_replay_bits_uop_xcpt_ma_if),
		.io_out_bits_uop_bp_debug_if(io_replay_bits_uop_bp_debug_if),
		.io_out_bits_uop_bp_xcpt_if(io_replay_bits_uop_bp_xcpt_if),
		.io_out_bits_uop_debug_fsrc(io_replay_bits_uop_debug_fsrc),
		.io_out_bits_uop_debug_tsrc(io_replay_bits_uop_debug_tsrc),
		.io_out_bits_addr(io_replay_bits_addr),
		.io_out_bits_is_hella(io_replay_bits_is_hella),
		.io_out_bits_way_en(io_replay_bits_way_en),
		.io_out_bits_sdq_id(_replay_arb_io_out_bits_sdq_id)
	);
	Arbiter3_BoomDCacheResp resp_arb(
		.io_in_0_ready(_resp_arb_io_in_0_ready),
		.io_in_0_valid(_mshrs_0_io_resp_valid),
		.io_in_0_bits_uop_inst(_mshrs_0_io_resp_bits_uop_inst),
		.io_in_0_bits_uop_debug_inst(_mshrs_0_io_resp_bits_uop_debug_inst),
		.io_in_0_bits_uop_is_rvc(_mshrs_0_io_resp_bits_uop_is_rvc),
		.io_in_0_bits_uop_debug_pc(_mshrs_0_io_resp_bits_uop_debug_pc),
		.io_in_0_bits_uop_iq_type_0(_mshrs_0_io_resp_bits_uop_iq_type_0),
		.io_in_0_bits_uop_iq_type_1(_mshrs_0_io_resp_bits_uop_iq_type_1),
		.io_in_0_bits_uop_iq_type_2(_mshrs_0_io_resp_bits_uop_iq_type_2),
		.io_in_0_bits_uop_iq_type_3(_mshrs_0_io_resp_bits_uop_iq_type_3),
		.io_in_0_bits_uop_fu_code_0(_mshrs_0_io_resp_bits_uop_fu_code_0),
		.io_in_0_bits_uop_fu_code_1(_mshrs_0_io_resp_bits_uop_fu_code_1),
		.io_in_0_bits_uop_fu_code_2(_mshrs_0_io_resp_bits_uop_fu_code_2),
		.io_in_0_bits_uop_fu_code_3(_mshrs_0_io_resp_bits_uop_fu_code_3),
		.io_in_0_bits_uop_fu_code_4(_mshrs_0_io_resp_bits_uop_fu_code_4),
		.io_in_0_bits_uop_fu_code_5(_mshrs_0_io_resp_bits_uop_fu_code_5),
		.io_in_0_bits_uop_fu_code_6(_mshrs_0_io_resp_bits_uop_fu_code_6),
		.io_in_0_bits_uop_fu_code_7(_mshrs_0_io_resp_bits_uop_fu_code_7),
		.io_in_0_bits_uop_fu_code_8(_mshrs_0_io_resp_bits_uop_fu_code_8),
		.io_in_0_bits_uop_fu_code_9(_mshrs_0_io_resp_bits_uop_fu_code_9),
		.io_in_0_bits_uop_iw_issued(_mshrs_0_io_resp_bits_uop_iw_issued),
		.io_in_0_bits_uop_iw_issued_partial_agen(_mshrs_0_io_resp_bits_uop_iw_issued_partial_agen),
		.io_in_0_bits_uop_iw_issued_partial_dgen(_mshrs_0_io_resp_bits_uop_iw_issued_partial_dgen),
		.io_in_0_bits_uop_iw_p1_speculative_child(_mshrs_0_io_resp_bits_uop_iw_p1_speculative_child),
		.io_in_0_bits_uop_iw_p2_speculative_child(_mshrs_0_io_resp_bits_uop_iw_p2_speculative_child),
		.io_in_0_bits_uop_iw_p1_bypass_hint(_mshrs_0_io_resp_bits_uop_iw_p1_bypass_hint),
		.io_in_0_bits_uop_iw_p2_bypass_hint(_mshrs_0_io_resp_bits_uop_iw_p2_bypass_hint),
		.io_in_0_bits_uop_iw_p3_bypass_hint(_mshrs_0_io_resp_bits_uop_iw_p3_bypass_hint),
		.io_in_0_bits_uop_dis_col_sel(_mshrs_0_io_resp_bits_uop_dis_col_sel),
		.io_in_0_bits_uop_br_mask(_mshrs_0_io_resp_bits_uop_br_mask),
		.io_in_0_bits_uop_br_tag(_mshrs_0_io_resp_bits_uop_br_tag),
		.io_in_0_bits_uop_br_type(_mshrs_0_io_resp_bits_uop_br_type),
		.io_in_0_bits_uop_is_sfb(_mshrs_0_io_resp_bits_uop_is_sfb),
		.io_in_0_bits_uop_is_fence(_mshrs_0_io_resp_bits_uop_is_fence),
		.io_in_0_bits_uop_is_fencei(_mshrs_0_io_resp_bits_uop_is_fencei),
		.io_in_0_bits_uop_is_sfence(_mshrs_0_io_resp_bits_uop_is_sfence),
		.io_in_0_bits_uop_is_amo(_mshrs_0_io_resp_bits_uop_is_amo),
		.io_in_0_bits_uop_is_eret(_mshrs_0_io_resp_bits_uop_is_eret),
		.io_in_0_bits_uop_is_sys_pc2epc(_mshrs_0_io_resp_bits_uop_is_sys_pc2epc),
		.io_in_0_bits_uop_is_rocc(_mshrs_0_io_resp_bits_uop_is_rocc),
		.io_in_0_bits_uop_is_mov(_mshrs_0_io_resp_bits_uop_is_mov),
		.io_in_0_bits_uop_ftq_idx(_mshrs_0_io_resp_bits_uop_ftq_idx),
		.io_in_0_bits_uop_edge_inst(_mshrs_0_io_resp_bits_uop_edge_inst),
		.io_in_0_bits_uop_pc_lob(_mshrs_0_io_resp_bits_uop_pc_lob),
		.io_in_0_bits_uop_taken(_mshrs_0_io_resp_bits_uop_taken),
		.io_in_0_bits_uop_imm_rename(_mshrs_0_io_resp_bits_uop_imm_rename),
		.io_in_0_bits_uop_imm_sel(_mshrs_0_io_resp_bits_uop_imm_sel),
		.io_in_0_bits_uop_pimm(_mshrs_0_io_resp_bits_uop_pimm),
		.io_in_0_bits_uop_imm_packed(_mshrs_0_io_resp_bits_uop_imm_packed),
		.io_in_0_bits_uop_op1_sel(_mshrs_0_io_resp_bits_uop_op1_sel),
		.io_in_0_bits_uop_op2_sel(_mshrs_0_io_resp_bits_uop_op2_sel),
		.io_in_0_bits_uop_fp_ctrl_ldst(_mshrs_0_io_resp_bits_uop_fp_ctrl_ldst),
		.io_in_0_bits_uop_fp_ctrl_wen(_mshrs_0_io_resp_bits_uop_fp_ctrl_wen),
		.io_in_0_bits_uop_fp_ctrl_ren1(_mshrs_0_io_resp_bits_uop_fp_ctrl_ren1),
		.io_in_0_bits_uop_fp_ctrl_ren2(_mshrs_0_io_resp_bits_uop_fp_ctrl_ren2),
		.io_in_0_bits_uop_fp_ctrl_ren3(_mshrs_0_io_resp_bits_uop_fp_ctrl_ren3),
		.io_in_0_bits_uop_fp_ctrl_swap12(_mshrs_0_io_resp_bits_uop_fp_ctrl_swap12),
		.io_in_0_bits_uop_fp_ctrl_swap23(_mshrs_0_io_resp_bits_uop_fp_ctrl_swap23),
		.io_in_0_bits_uop_fp_ctrl_typeTagIn(_mshrs_0_io_resp_bits_uop_fp_ctrl_typeTagIn),
		.io_in_0_bits_uop_fp_ctrl_typeTagOut(_mshrs_0_io_resp_bits_uop_fp_ctrl_typeTagOut),
		.io_in_0_bits_uop_fp_ctrl_fromint(_mshrs_0_io_resp_bits_uop_fp_ctrl_fromint),
		.io_in_0_bits_uop_fp_ctrl_toint(_mshrs_0_io_resp_bits_uop_fp_ctrl_toint),
		.io_in_0_bits_uop_fp_ctrl_fastpipe(_mshrs_0_io_resp_bits_uop_fp_ctrl_fastpipe),
		.io_in_0_bits_uop_fp_ctrl_fma(_mshrs_0_io_resp_bits_uop_fp_ctrl_fma),
		.io_in_0_bits_uop_fp_ctrl_div(_mshrs_0_io_resp_bits_uop_fp_ctrl_div),
		.io_in_0_bits_uop_fp_ctrl_sqrt(_mshrs_0_io_resp_bits_uop_fp_ctrl_sqrt),
		.io_in_0_bits_uop_fp_ctrl_wflags(_mshrs_0_io_resp_bits_uop_fp_ctrl_wflags),
		.io_in_0_bits_uop_fp_ctrl_vec(_mshrs_0_io_resp_bits_uop_fp_ctrl_vec),
		.io_in_0_bits_uop_rob_idx(_mshrs_0_io_resp_bits_uop_rob_idx),
		.io_in_0_bits_uop_ldq_idx(_mshrs_0_io_resp_bits_uop_ldq_idx),
		.io_in_0_bits_uop_stq_idx(_mshrs_0_io_resp_bits_uop_stq_idx),
		.io_in_0_bits_uop_rxq_idx(_mshrs_0_io_resp_bits_uop_rxq_idx),
		.io_in_0_bits_uop_pdst(_mshrs_0_io_resp_bits_uop_pdst),
		.io_in_0_bits_uop_prs1(_mshrs_0_io_resp_bits_uop_prs1),
		.io_in_0_bits_uop_prs2(_mshrs_0_io_resp_bits_uop_prs2),
		.io_in_0_bits_uop_prs3(_mshrs_0_io_resp_bits_uop_prs3),
		.io_in_0_bits_uop_ppred(_mshrs_0_io_resp_bits_uop_ppred),
		.io_in_0_bits_uop_prs1_busy(_mshrs_0_io_resp_bits_uop_prs1_busy),
		.io_in_0_bits_uop_prs2_busy(_mshrs_0_io_resp_bits_uop_prs2_busy),
		.io_in_0_bits_uop_prs3_busy(_mshrs_0_io_resp_bits_uop_prs3_busy),
		.io_in_0_bits_uop_ppred_busy(_mshrs_0_io_resp_bits_uop_ppred_busy),
		.io_in_0_bits_uop_stale_pdst(_mshrs_0_io_resp_bits_uop_stale_pdst),
		.io_in_0_bits_uop_exception(_mshrs_0_io_resp_bits_uop_exception),
		.io_in_0_bits_uop_exc_cause(_mshrs_0_io_resp_bits_uop_exc_cause),
		.io_in_0_bits_uop_mem_cmd(_mshrs_0_io_resp_bits_uop_mem_cmd),
		.io_in_0_bits_uop_mem_size(_mshrs_0_io_resp_bits_uop_mem_size),
		.io_in_0_bits_uop_mem_signed(_mshrs_0_io_resp_bits_uop_mem_signed),
		.io_in_0_bits_uop_uses_ldq(_mshrs_0_io_resp_bits_uop_uses_ldq),
		.io_in_0_bits_uop_uses_stq(_mshrs_0_io_resp_bits_uop_uses_stq),
		.io_in_0_bits_uop_is_unique(_mshrs_0_io_resp_bits_uop_is_unique),
		.io_in_0_bits_uop_flush_on_commit(_mshrs_0_io_resp_bits_uop_flush_on_commit),
		.io_in_0_bits_uop_csr_cmd(_mshrs_0_io_resp_bits_uop_csr_cmd),
		.io_in_0_bits_uop_ldst_is_rs1(_mshrs_0_io_resp_bits_uop_ldst_is_rs1),
		.io_in_0_bits_uop_ldst(_mshrs_0_io_resp_bits_uop_ldst),
		.io_in_0_bits_uop_lrs1(_mshrs_0_io_resp_bits_uop_lrs1),
		.io_in_0_bits_uop_lrs2(_mshrs_0_io_resp_bits_uop_lrs2),
		.io_in_0_bits_uop_lrs3(_mshrs_0_io_resp_bits_uop_lrs3),
		.io_in_0_bits_uop_dst_rtype(_mshrs_0_io_resp_bits_uop_dst_rtype),
		.io_in_0_bits_uop_lrs1_rtype(_mshrs_0_io_resp_bits_uop_lrs1_rtype),
		.io_in_0_bits_uop_lrs2_rtype(_mshrs_0_io_resp_bits_uop_lrs2_rtype),
		.io_in_0_bits_uop_frs3_en(_mshrs_0_io_resp_bits_uop_frs3_en),
		.io_in_0_bits_uop_fcn_dw(_mshrs_0_io_resp_bits_uop_fcn_dw),
		.io_in_0_bits_uop_fcn_op(_mshrs_0_io_resp_bits_uop_fcn_op),
		.io_in_0_bits_uop_fp_val(_mshrs_0_io_resp_bits_uop_fp_val),
		.io_in_0_bits_uop_fp_rm(_mshrs_0_io_resp_bits_uop_fp_rm),
		.io_in_0_bits_uop_fp_typ(_mshrs_0_io_resp_bits_uop_fp_typ),
		.io_in_0_bits_uop_xcpt_pf_if(_mshrs_0_io_resp_bits_uop_xcpt_pf_if),
		.io_in_0_bits_uop_xcpt_ae_if(_mshrs_0_io_resp_bits_uop_xcpt_ae_if),
		.io_in_0_bits_uop_xcpt_ma_if(_mshrs_0_io_resp_bits_uop_xcpt_ma_if),
		.io_in_0_bits_uop_bp_debug_if(_mshrs_0_io_resp_bits_uop_bp_debug_if),
		.io_in_0_bits_uop_bp_xcpt_if(_mshrs_0_io_resp_bits_uop_bp_xcpt_if),
		.io_in_0_bits_uop_debug_fsrc(_mshrs_0_io_resp_bits_uop_debug_fsrc),
		.io_in_0_bits_uop_debug_tsrc(_mshrs_0_io_resp_bits_uop_debug_tsrc),
		.io_in_0_bits_data(_mshrs_0_io_resp_bits_data),
		.io_in_0_bits_is_hella(_mshrs_0_io_resp_bits_is_hella),
		.io_in_1_ready(_resp_arb_io_in_1_ready),
		.io_in_1_valid(_mshrs_1_io_resp_valid),
		.io_in_1_bits_uop_inst(_mshrs_1_io_resp_bits_uop_inst),
		.io_in_1_bits_uop_debug_inst(_mshrs_1_io_resp_bits_uop_debug_inst),
		.io_in_1_bits_uop_is_rvc(_mshrs_1_io_resp_bits_uop_is_rvc),
		.io_in_1_bits_uop_debug_pc(_mshrs_1_io_resp_bits_uop_debug_pc),
		.io_in_1_bits_uop_iq_type_0(_mshrs_1_io_resp_bits_uop_iq_type_0),
		.io_in_1_bits_uop_iq_type_1(_mshrs_1_io_resp_bits_uop_iq_type_1),
		.io_in_1_bits_uop_iq_type_2(_mshrs_1_io_resp_bits_uop_iq_type_2),
		.io_in_1_bits_uop_iq_type_3(_mshrs_1_io_resp_bits_uop_iq_type_3),
		.io_in_1_bits_uop_fu_code_0(_mshrs_1_io_resp_bits_uop_fu_code_0),
		.io_in_1_bits_uop_fu_code_1(_mshrs_1_io_resp_bits_uop_fu_code_1),
		.io_in_1_bits_uop_fu_code_2(_mshrs_1_io_resp_bits_uop_fu_code_2),
		.io_in_1_bits_uop_fu_code_3(_mshrs_1_io_resp_bits_uop_fu_code_3),
		.io_in_1_bits_uop_fu_code_4(_mshrs_1_io_resp_bits_uop_fu_code_4),
		.io_in_1_bits_uop_fu_code_5(_mshrs_1_io_resp_bits_uop_fu_code_5),
		.io_in_1_bits_uop_fu_code_6(_mshrs_1_io_resp_bits_uop_fu_code_6),
		.io_in_1_bits_uop_fu_code_7(_mshrs_1_io_resp_bits_uop_fu_code_7),
		.io_in_1_bits_uop_fu_code_8(_mshrs_1_io_resp_bits_uop_fu_code_8),
		.io_in_1_bits_uop_fu_code_9(_mshrs_1_io_resp_bits_uop_fu_code_9),
		.io_in_1_bits_uop_iw_issued(_mshrs_1_io_resp_bits_uop_iw_issued),
		.io_in_1_bits_uop_iw_issued_partial_agen(_mshrs_1_io_resp_bits_uop_iw_issued_partial_agen),
		.io_in_1_bits_uop_iw_issued_partial_dgen(_mshrs_1_io_resp_bits_uop_iw_issued_partial_dgen),
		.io_in_1_bits_uop_iw_p1_speculative_child(_mshrs_1_io_resp_bits_uop_iw_p1_speculative_child),
		.io_in_1_bits_uop_iw_p2_speculative_child(_mshrs_1_io_resp_bits_uop_iw_p2_speculative_child),
		.io_in_1_bits_uop_iw_p1_bypass_hint(_mshrs_1_io_resp_bits_uop_iw_p1_bypass_hint),
		.io_in_1_bits_uop_iw_p2_bypass_hint(_mshrs_1_io_resp_bits_uop_iw_p2_bypass_hint),
		.io_in_1_bits_uop_iw_p3_bypass_hint(_mshrs_1_io_resp_bits_uop_iw_p3_bypass_hint),
		.io_in_1_bits_uop_dis_col_sel(_mshrs_1_io_resp_bits_uop_dis_col_sel),
		.io_in_1_bits_uop_br_mask(_mshrs_1_io_resp_bits_uop_br_mask),
		.io_in_1_bits_uop_br_tag(_mshrs_1_io_resp_bits_uop_br_tag),
		.io_in_1_bits_uop_br_type(_mshrs_1_io_resp_bits_uop_br_type),
		.io_in_1_bits_uop_is_sfb(_mshrs_1_io_resp_bits_uop_is_sfb),
		.io_in_1_bits_uop_is_fence(_mshrs_1_io_resp_bits_uop_is_fence),
		.io_in_1_bits_uop_is_fencei(_mshrs_1_io_resp_bits_uop_is_fencei),
		.io_in_1_bits_uop_is_sfence(_mshrs_1_io_resp_bits_uop_is_sfence),
		.io_in_1_bits_uop_is_amo(_mshrs_1_io_resp_bits_uop_is_amo),
		.io_in_1_bits_uop_is_eret(_mshrs_1_io_resp_bits_uop_is_eret),
		.io_in_1_bits_uop_is_sys_pc2epc(_mshrs_1_io_resp_bits_uop_is_sys_pc2epc),
		.io_in_1_bits_uop_is_rocc(_mshrs_1_io_resp_bits_uop_is_rocc),
		.io_in_1_bits_uop_is_mov(_mshrs_1_io_resp_bits_uop_is_mov),
		.io_in_1_bits_uop_ftq_idx(_mshrs_1_io_resp_bits_uop_ftq_idx),
		.io_in_1_bits_uop_edge_inst(_mshrs_1_io_resp_bits_uop_edge_inst),
		.io_in_1_bits_uop_pc_lob(_mshrs_1_io_resp_bits_uop_pc_lob),
		.io_in_1_bits_uop_taken(_mshrs_1_io_resp_bits_uop_taken),
		.io_in_1_bits_uop_imm_rename(_mshrs_1_io_resp_bits_uop_imm_rename),
		.io_in_1_bits_uop_imm_sel(_mshrs_1_io_resp_bits_uop_imm_sel),
		.io_in_1_bits_uop_pimm(_mshrs_1_io_resp_bits_uop_pimm),
		.io_in_1_bits_uop_imm_packed(_mshrs_1_io_resp_bits_uop_imm_packed),
		.io_in_1_bits_uop_op1_sel(_mshrs_1_io_resp_bits_uop_op1_sel),
		.io_in_1_bits_uop_op2_sel(_mshrs_1_io_resp_bits_uop_op2_sel),
		.io_in_1_bits_uop_fp_ctrl_ldst(_mshrs_1_io_resp_bits_uop_fp_ctrl_ldst),
		.io_in_1_bits_uop_fp_ctrl_wen(_mshrs_1_io_resp_bits_uop_fp_ctrl_wen),
		.io_in_1_bits_uop_fp_ctrl_ren1(_mshrs_1_io_resp_bits_uop_fp_ctrl_ren1),
		.io_in_1_bits_uop_fp_ctrl_ren2(_mshrs_1_io_resp_bits_uop_fp_ctrl_ren2),
		.io_in_1_bits_uop_fp_ctrl_ren3(_mshrs_1_io_resp_bits_uop_fp_ctrl_ren3),
		.io_in_1_bits_uop_fp_ctrl_swap12(_mshrs_1_io_resp_bits_uop_fp_ctrl_swap12),
		.io_in_1_bits_uop_fp_ctrl_swap23(_mshrs_1_io_resp_bits_uop_fp_ctrl_swap23),
		.io_in_1_bits_uop_fp_ctrl_typeTagIn(_mshrs_1_io_resp_bits_uop_fp_ctrl_typeTagIn),
		.io_in_1_bits_uop_fp_ctrl_typeTagOut(_mshrs_1_io_resp_bits_uop_fp_ctrl_typeTagOut),
		.io_in_1_bits_uop_fp_ctrl_fromint(_mshrs_1_io_resp_bits_uop_fp_ctrl_fromint),
		.io_in_1_bits_uop_fp_ctrl_toint(_mshrs_1_io_resp_bits_uop_fp_ctrl_toint),
		.io_in_1_bits_uop_fp_ctrl_fastpipe(_mshrs_1_io_resp_bits_uop_fp_ctrl_fastpipe),
		.io_in_1_bits_uop_fp_ctrl_fma(_mshrs_1_io_resp_bits_uop_fp_ctrl_fma),
		.io_in_1_bits_uop_fp_ctrl_div(_mshrs_1_io_resp_bits_uop_fp_ctrl_div),
		.io_in_1_bits_uop_fp_ctrl_sqrt(_mshrs_1_io_resp_bits_uop_fp_ctrl_sqrt),
		.io_in_1_bits_uop_fp_ctrl_wflags(_mshrs_1_io_resp_bits_uop_fp_ctrl_wflags),
		.io_in_1_bits_uop_fp_ctrl_vec(_mshrs_1_io_resp_bits_uop_fp_ctrl_vec),
		.io_in_1_bits_uop_rob_idx(_mshrs_1_io_resp_bits_uop_rob_idx),
		.io_in_1_bits_uop_ldq_idx(_mshrs_1_io_resp_bits_uop_ldq_idx),
		.io_in_1_bits_uop_stq_idx(_mshrs_1_io_resp_bits_uop_stq_idx),
		.io_in_1_bits_uop_rxq_idx(_mshrs_1_io_resp_bits_uop_rxq_idx),
		.io_in_1_bits_uop_pdst(_mshrs_1_io_resp_bits_uop_pdst),
		.io_in_1_bits_uop_prs1(_mshrs_1_io_resp_bits_uop_prs1),
		.io_in_1_bits_uop_prs2(_mshrs_1_io_resp_bits_uop_prs2),
		.io_in_1_bits_uop_prs3(_mshrs_1_io_resp_bits_uop_prs3),
		.io_in_1_bits_uop_ppred(_mshrs_1_io_resp_bits_uop_ppred),
		.io_in_1_bits_uop_prs1_busy(_mshrs_1_io_resp_bits_uop_prs1_busy),
		.io_in_1_bits_uop_prs2_busy(_mshrs_1_io_resp_bits_uop_prs2_busy),
		.io_in_1_bits_uop_prs3_busy(_mshrs_1_io_resp_bits_uop_prs3_busy),
		.io_in_1_bits_uop_ppred_busy(_mshrs_1_io_resp_bits_uop_ppred_busy),
		.io_in_1_bits_uop_stale_pdst(_mshrs_1_io_resp_bits_uop_stale_pdst),
		.io_in_1_bits_uop_exception(_mshrs_1_io_resp_bits_uop_exception),
		.io_in_1_bits_uop_exc_cause(_mshrs_1_io_resp_bits_uop_exc_cause),
		.io_in_1_bits_uop_mem_cmd(_mshrs_1_io_resp_bits_uop_mem_cmd),
		.io_in_1_bits_uop_mem_size(_mshrs_1_io_resp_bits_uop_mem_size),
		.io_in_1_bits_uop_mem_signed(_mshrs_1_io_resp_bits_uop_mem_signed),
		.io_in_1_bits_uop_uses_ldq(_mshrs_1_io_resp_bits_uop_uses_ldq),
		.io_in_1_bits_uop_uses_stq(_mshrs_1_io_resp_bits_uop_uses_stq),
		.io_in_1_bits_uop_is_unique(_mshrs_1_io_resp_bits_uop_is_unique),
		.io_in_1_bits_uop_flush_on_commit(_mshrs_1_io_resp_bits_uop_flush_on_commit),
		.io_in_1_bits_uop_csr_cmd(_mshrs_1_io_resp_bits_uop_csr_cmd),
		.io_in_1_bits_uop_ldst_is_rs1(_mshrs_1_io_resp_bits_uop_ldst_is_rs1),
		.io_in_1_bits_uop_ldst(_mshrs_1_io_resp_bits_uop_ldst),
		.io_in_1_bits_uop_lrs1(_mshrs_1_io_resp_bits_uop_lrs1),
		.io_in_1_bits_uop_lrs2(_mshrs_1_io_resp_bits_uop_lrs2),
		.io_in_1_bits_uop_lrs3(_mshrs_1_io_resp_bits_uop_lrs3),
		.io_in_1_bits_uop_dst_rtype(_mshrs_1_io_resp_bits_uop_dst_rtype),
		.io_in_1_bits_uop_lrs1_rtype(_mshrs_1_io_resp_bits_uop_lrs1_rtype),
		.io_in_1_bits_uop_lrs2_rtype(_mshrs_1_io_resp_bits_uop_lrs2_rtype),
		.io_in_1_bits_uop_frs3_en(_mshrs_1_io_resp_bits_uop_frs3_en),
		.io_in_1_bits_uop_fcn_dw(_mshrs_1_io_resp_bits_uop_fcn_dw),
		.io_in_1_bits_uop_fcn_op(_mshrs_1_io_resp_bits_uop_fcn_op),
		.io_in_1_bits_uop_fp_val(_mshrs_1_io_resp_bits_uop_fp_val),
		.io_in_1_bits_uop_fp_rm(_mshrs_1_io_resp_bits_uop_fp_rm),
		.io_in_1_bits_uop_fp_typ(_mshrs_1_io_resp_bits_uop_fp_typ),
		.io_in_1_bits_uop_xcpt_pf_if(_mshrs_1_io_resp_bits_uop_xcpt_pf_if),
		.io_in_1_bits_uop_xcpt_ae_if(_mshrs_1_io_resp_bits_uop_xcpt_ae_if),
		.io_in_1_bits_uop_xcpt_ma_if(_mshrs_1_io_resp_bits_uop_xcpt_ma_if),
		.io_in_1_bits_uop_bp_debug_if(_mshrs_1_io_resp_bits_uop_bp_debug_if),
		.io_in_1_bits_uop_bp_xcpt_if(_mshrs_1_io_resp_bits_uop_bp_xcpt_if),
		.io_in_1_bits_uop_debug_fsrc(_mshrs_1_io_resp_bits_uop_debug_fsrc),
		.io_in_1_bits_uop_debug_tsrc(_mshrs_1_io_resp_bits_uop_debug_tsrc),
		.io_in_1_bits_data(_mshrs_1_io_resp_bits_data),
		.io_in_1_bits_is_hella(_mshrs_1_io_resp_bits_is_hella),
		.io_in_2_ready(_resp_arb_io_in_2_ready),
		.io_in_2_valid(_mmios_0_io_resp_valid),
		.io_in_2_bits_uop_inst(_mmios_0_io_resp_bits_uop_inst),
		.io_in_2_bits_uop_debug_inst(_mmios_0_io_resp_bits_uop_debug_inst),
		.io_in_2_bits_uop_is_rvc(_mmios_0_io_resp_bits_uop_is_rvc),
		.io_in_2_bits_uop_debug_pc(_mmios_0_io_resp_bits_uop_debug_pc),
		.io_in_2_bits_uop_iq_type_0(_mmios_0_io_resp_bits_uop_iq_type_0),
		.io_in_2_bits_uop_iq_type_1(_mmios_0_io_resp_bits_uop_iq_type_1),
		.io_in_2_bits_uop_iq_type_2(_mmios_0_io_resp_bits_uop_iq_type_2),
		.io_in_2_bits_uop_iq_type_3(_mmios_0_io_resp_bits_uop_iq_type_3),
		.io_in_2_bits_uop_fu_code_0(_mmios_0_io_resp_bits_uop_fu_code_0),
		.io_in_2_bits_uop_fu_code_1(_mmios_0_io_resp_bits_uop_fu_code_1),
		.io_in_2_bits_uop_fu_code_2(_mmios_0_io_resp_bits_uop_fu_code_2),
		.io_in_2_bits_uop_fu_code_3(_mmios_0_io_resp_bits_uop_fu_code_3),
		.io_in_2_bits_uop_fu_code_4(_mmios_0_io_resp_bits_uop_fu_code_4),
		.io_in_2_bits_uop_fu_code_5(_mmios_0_io_resp_bits_uop_fu_code_5),
		.io_in_2_bits_uop_fu_code_6(_mmios_0_io_resp_bits_uop_fu_code_6),
		.io_in_2_bits_uop_fu_code_7(_mmios_0_io_resp_bits_uop_fu_code_7),
		.io_in_2_bits_uop_fu_code_8(_mmios_0_io_resp_bits_uop_fu_code_8),
		.io_in_2_bits_uop_fu_code_9(_mmios_0_io_resp_bits_uop_fu_code_9),
		.io_in_2_bits_uop_iw_issued(_mmios_0_io_resp_bits_uop_iw_issued),
		.io_in_2_bits_uop_iw_issued_partial_agen(_mmios_0_io_resp_bits_uop_iw_issued_partial_agen),
		.io_in_2_bits_uop_iw_issued_partial_dgen(_mmios_0_io_resp_bits_uop_iw_issued_partial_dgen),
		.io_in_2_bits_uop_iw_p1_speculative_child(_mmios_0_io_resp_bits_uop_iw_p1_speculative_child),
		.io_in_2_bits_uop_iw_p2_speculative_child(_mmios_0_io_resp_bits_uop_iw_p2_speculative_child),
		.io_in_2_bits_uop_iw_p1_bypass_hint(_mmios_0_io_resp_bits_uop_iw_p1_bypass_hint),
		.io_in_2_bits_uop_iw_p2_bypass_hint(_mmios_0_io_resp_bits_uop_iw_p2_bypass_hint),
		.io_in_2_bits_uop_iw_p3_bypass_hint(_mmios_0_io_resp_bits_uop_iw_p3_bypass_hint),
		.io_in_2_bits_uop_dis_col_sel(_mmios_0_io_resp_bits_uop_dis_col_sel),
		.io_in_2_bits_uop_br_mask(_mmios_0_io_resp_bits_uop_br_mask),
		.io_in_2_bits_uop_br_tag(_mmios_0_io_resp_bits_uop_br_tag),
		.io_in_2_bits_uop_br_type(_mmios_0_io_resp_bits_uop_br_type),
		.io_in_2_bits_uop_is_sfb(_mmios_0_io_resp_bits_uop_is_sfb),
		.io_in_2_bits_uop_is_fence(_mmios_0_io_resp_bits_uop_is_fence),
		.io_in_2_bits_uop_is_fencei(_mmios_0_io_resp_bits_uop_is_fencei),
		.io_in_2_bits_uop_is_sfence(_mmios_0_io_resp_bits_uop_is_sfence),
		.io_in_2_bits_uop_is_amo(_mmios_0_io_resp_bits_uop_is_amo),
		.io_in_2_bits_uop_is_eret(_mmios_0_io_resp_bits_uop_is_eret),
		.io_in_2_bits_uop_is_sys_pc2epc(_mmios_0_io_resp_bits_uop_is_sys_pc2epc),
		.io_in_2_bits_uop_is_rocc(_mmios_0_io_resp_bits_uop_is_rocc),
		.io_in_2_bits_uop_is_mov(_mmios_0_io_resp_bits_uop_is_mov),
		.io_in_2_bits_uop_ftq_idx(_mmios_0_io_resp_bits_uop_ftq_idx),
		.io_in_2_bits_uop_edge_inst(_mmios_0_io_resp_bits_uop_edge_inst),
		.io_in_2_bits_uop_pc_lob(_mmios_0_io_resp_bits_uop_pc_lob),
		.io_in_2_bits_uop_taken(_mmios_0_io_resp_bits_uop_taken),
		.io_in_2_bits_uop_imm_rename(_mmios_0_io_resp_bits_uop_imm_rename),
		.io_in_2_bits_uop_imm_sel(_mmios_0_io_resp_bits_uop_imm_sel),
		.io_in_2_bits_uop_pimm(_mmios_0_io_resp_bits_uop_pimm),
		.io_in_2_bits_uop_imm_packed(_mmios_0_io_resp_bits_uop_imm_packed),
		.io_in_2_bits_uop_op1_sel(_mmios_0_io_resp_bits_uop_op1_sel),
		.io_in_2_bits_uop_op2_sel(_mmios_0_io_resp_bits_uop_op2_sel),
		.io_in_2_bits_uop_fp_ctrl_ldst(_mmios_0_io_resp_bits_uop_fp_ctrl_ldst),
		.io_in_2_bits_uop_fp_ctrl_wen(_mmios_0_io_resp_bits_uop_fp_ctrl_wen),
		.io_in_2_bits_uop_fp_ctrl_ren1(_mmios_0_io_resp_bits_uop_fp_ctrl_ren1),
		.io_in_2_bits_uop_fp_ctrl_ren2(_mmios_0_io_resp_bits_uop_fp_ctrl_ren2),
		.io_in_2_bits_uop_fp_ctrl_ren3(_mmios_0_io_resp_bits_uop_fp_ctrl_ren3),
		.io_in_2_bits_uop_fp_ctrl_swap12(_mmios_0_io_resp_bits_uop_fp_ctrl_swap12),
		.io_in_2_bits_uop_fp_ctrl_swap23(_mmios_0_io_resp_bits_uop_fp_ctrl_swap23),
		.io_in_2_bits_uop_fp_ctrl_typeTagIn(_mmios_0_io_resp_bits_uop_fp_ctrl_typeTagIn),
		.io_in_2_bits_uop_fp_ctrl_typeTagOut(_mmios_0_io_resp_bits_uop_fp_ctrl_typeTagOut),
		.io_in_2_bits_uop_fp_ctrl_fromint(_mmios_0_io_resp_bits_uop_fp_ctrl_fromint),
		.io_in_2_bits_uop_fp_ctrl_toint(_mmios_0_io_resp_bits_uop_fp_ctrl_toint),
		.io_in_2_bits_uop_fp_ctrl_fastpipe(_mmios_0_io_resp_bits_uop_fp_ctrl_fastpipe),
		.io_in_2_bits_uop_fp_ctrl_fma(_mmios_0_io_resp_bits_uop_fp_ctrl_fma),
		.io_in_2_bits_uop_fp_ctrl_div(_mmios_0_io_resp_bits_uop_fp_ctrl_div),
		.io_in_2_bits_uop_fp_ctrl_sqrt(_mmios_0_io_resp_bits_uop_fp_ctrl_sqrt),
		.io_in_2_bits_uop_fp_ctrl_wflags(_mmios_0_io_resp_bits_uop_fp_ctrl_wflags),
		.io_in_2_bits_uop_fp_ctrl_vec(_mmios_0_io_resp_bits_uop_fp_ctrl_vec),
		.io_in_2_bits_uop_rob_idx(_mmios_0_io_resp_bits_uop_rob_idx),
		.io_in_2_bits_uop_ldq_idx(_mmios_0_io_resp_bits_uop_ldq_idx),
		.io_in_2_bits_uop_stq_idx(_mmios_0_io_resp_bits_uop_stq_idx),
		.io_in_2_bits_uop_rxq_idx(_mmios_0_io_resp_bits_uop_rxq_idx),
		.io_in_2_bits_uop_pdst(_mmios_0_io_resp_bits_uop_pdst),
		.io_in_2_bits_uop_prs1(_mmios_0_io_resp_bits_uop_prs1),
		.io_in_2_bits_uop_prs2(_mmios_0_io_resp_bits_uop_prs2),
		.io_in_2_bits_uop_prs3(_mmios_0_io_resp_bits_uop_prs3),
		.io_in_2_bits_uop_ppred(_mmios_0_io_resp_bits_uop_ppred),
		.io_in_2_bits_uop_prs1_busy(_mmios_0_io_resp_bits_uop_prs1_busy),
		.io_in_2_bits_uop_prs2_busy(_mmios_0_io_resp_bits_uop_prs2_busy),
		.io_in_2_bits_uop_prs3_busy(_mmios_0_io_resp_bits_uop_prs3_busy),
		.io_in_2_bits_uop_ppred_busy(_mmios_0_io_resp_bits_uop_ppred_busy),
		.io_in_2_bits_uop_stale_pdst(_mmios_0_io_resp_bits_uop_stale_pdst),
		.io_in_2_bits_uop_exception(_mmios_0_io_resp_bits_uop_exception),
		.io_in_2_bits_uop_exc_cause(_mmios_0_io_resp_bits_uop_exc_cause),
		.io_in_2_bits_uop_mem_cmd(_mmios_0_io_resp_bits_uop_mem_cmd),
		.io_in_2_bits_uop_mem_size(_mmios_0_io_resp_bits_uop_mem_size),
		.io_in_2_bits_uop_mem_signed(_mmios_0_io_resp_bits_uop_mem_signed),
		.io_in_2_bits_uop_uses_ldq(_mmios_0_io_resp_bits_uop_uses_ldq),
		.io_in_2_bits_uop_uses_stq(_mmios_0_io_resp_bits_uop_uses_stq),
		.io_in_2_bits_uop_is_unique(_mmios_0_io_resp_bits_uop_is_unique),
		.io_in_2_bits_uop_flush_on_commit(_mmios_0_io_resp_bits_uop_flush_on_commit),
		.io_in_2_bits_uop_csr_cmd(_mmios_0_io_resp_bits_uop_csr_cmd),
		.io_in_2_bits_uop_ldst_is_rs1(_mmios_0_io_resp_bits_uop_ldst_is_rs1),
		.io_in_2_bits_uop_ldst(_mmios_0_io_resp_bits_uop_ldst),
		.io_in_2_bits_uop_lrs1(_mmios_0_io_resp_bits_uop_lrs1),
		.io_in_2_bits_uop_lrs2(_mmios_0_io_resp_bits_uop_lrs2),
		.io_in_2_bits_uop_lrs3(_mmios_0_io_resp_bits_uop_lrs3),
		.io_in_2_bits_uop_dst_rtype(_mmios_0_io_resp_bits_uop_dst_rtype),
		.io_in_2_bits_uop_lrs1_rtype(_mmios_0_io_resp_bits_uop_lrs1_rtype),
		.io_in_2_bits_uop_lrs2_rtype(_mmios_0_io_resp_bits_uop_lrs2_rtype),
		.io_in_2_bits_uop_frs3_en(_mmios_0_io_resp_bits_uop_frs3_en),
		.io_in_2_bits_uop_fcn_dw(_mmios_0_io_resp_bits_uop_fcn_dw),
		.io_in_2_bits_uop_fcn_op(_mmios_0_io_resp_bits_uop_fcn_op),
		.io_in_2_bits_uop_fp_val(_mmios_0_io_resp_bits_uop_fp_val),
		.io_in_2_bits_uop_fp_rm(_mmios_0_io_resp_bits_uop_fp_rm),
		.io_in_2_bits_uop_fp_typ(_mmios_0_io_resp_bits_uop_fp_typ),
		.io_in_2_bits_uop_xcpt_pf_if(_mmios_0_io_resp_bits_uop_xcpt_pf_if),
		.io_in_2_bits_uop_xcpt_ae_if(_mmios_0_io_resp_bits_uop_xcpt_ae_if),
		.io_in_2_bits_uop_xcpt_ma_if(_mmios_0_io_resp_bits_uop_xcpt_ma_if),
		.io_in_2_bits_uop_bp_debug_if(_mmios_0_io_resp_bits_uop_bp_debug_if),
		.io_in_2_bits_uop_bp_xcpt_if(_mmios_0_io_resp_bits_uop_bp_xcpt_if),
		.io_in_2_bits_uop_debug_fsrc(_mmios_0_io_resp_bits_uop_debug_fsrc),
		.io_in_2_bits_uop_debug_tsrc(_mmios_0_io_resp_bits_uop_debug_tsrc),
		.io_in_2_bits_data(_mmios_0_io_resp_bits_data),
		.io_in_2_bits_is_hella(_mmios_0_io_resp_bits_is_hella),
		.io_out_ready(_respq_io_enq_ready),
		.io_out_valid(_resp_arb_io_out_valid),
		.io_out_bits_uop_inst(_resp_arb_io_out_bits_uop_inst),
		.io_out_bits_uop_debug_inst(_resp_arb_io_out_bits_uop_debug_inst),
		.io_out_bits_uop_is_rvc(_resp_arb_io_out_bits_uop_is_rvc),
		.io_out_bits_uop_debug_pc(_resp_arb_io_out_bits_uop_debug_pc),
		.io_out_bits_uop_iq_type_0(_resp_arb_io_out_bits_uop_iq_type_0),
		.io_out_bits_uop_iq_type_1(_resp_arb_io_out_bits_uop_iq_type_1),
		.io_out_bits_uop_iq_type_2(_resp_arb_io_out_bits_uop_iq_type_2),
		.io_out_bits_uop_iq_type_3(_resp_arb_io_out_bits_uop_iq_type_3),
		.io_out_bits_uop_fu_code_0(_resp_arb_io_out_bits_uop_fu_code_0),
		.io_out_bits_uop_fu_code_1(_resp_arb_io_out_bits_uop_fu_code_1),
		.io_out_bits_uop_fu_code_2(_resp_arb_io_out_bits_uop_fu_code_2),
		.io_out_bits_uop_fu_code_3(_resp_arb_io_out_bits_uop_fu_code_3),
		.io_out_bits_uop_fu_code_4(_resp_arb_io_out_bits_uop_fu_code_4),
		.io_out_bits_uop_fu_code_5(_resp_arb_io_out_bits_uop_fu_code_5),
		.io_out_bits_uop_fu_code_6(_resp_arb_io_out_bits_uop_fu_code_6),
		.io_out_bits_uop_fu_code_7(_resp_arb_io_out_bits_uop_fu_code_7),
		.io_out_bits_uop_fu_code_8(_resp_arb_io_out_bits_uop_fu_code_8),
		.io_out_bits_uop_fu_code_9(_resp_arb_io_out_bits_uop_fu_code_9),
		.io_out_bits_uop_iw_issued(_resp_arb_io_out_bits_uop_iw_issued),
		.io_out_bits_uop_iw_issued_partial_agen(_resp_arb_io_out_bits_uop_iw_issued_partial_agen),
		.io_out_bits_uop_iw_issued_partial_dgen(_resp_arb_io_out_bits_uop_iw_issued_partial_dgen),
		.io_out_bits_uop_iw_p1_speculative_child(_resp_arb_io_out_bits_uop_iw_p1_speculative_child),
		.io_out_bits_uop_iw_p2_speculative_child(_resp_arb_io_out_bits_uop_iw_p2_speculative_child),
		.io_out_bits_uop_iw_p1_bypass_hint(_resp_arb_io_out_bits_uop_iw_p1_bypass_hint),
		.io_out_bits_uop_iw_p2_bypass_hint(_resp_arb_io_out_bits_uop_iw_p2_bypass_hint),
		.io_out_bits_uop_iw_p3_bypass_hint(_resp_arb_io_out_bits_uop_iw_p3_bypass_hint),
		.io_out_bits_uop_dis_col_sel(_resp_arb_io_out_bits_uop_dis_col_sel),
		.io_out_bits_uop_br_mask(_resp_arb_io_out_bits_uop_br_mask),
		.io_out_bits_uop_br_tag(_resp_arb_io_out_bits_uop_br_tag),
		.io_out_bits_uop_br_type(_resp_arb_io_out_bits_uop_br_type),
		.io_out_bits_uop_is_sfb(_resp_arb_io_out_bits_uop_is_sfb),
		.io_out_bits_uop_is_fence(_resp_arb_io_out_bits_uop_is_fence),
		.io_out_bits_uop_is_fencei(_resp_arb_io_out_bits_uop_is_fencei),
		.io_out_bits_uop_is_sfence(_resp_arb_io_out_bits_uop_is_sfence),
		.io_out_bits_uop_is_amo(_resp_arb_io_out_bits_uop_is_amo),
		.io_out_bits_uop_is_eret(_resp_arb_io_out_bits_uop_is_eret),
		.io_out_bits_uop_is_sys_pc2epc(_resp_arb_io_out_bits_uop_is_sys_pc2epc),
		.io_out_bits_uop_is_rocc(_resp_arb_io_out_bits_uop_is_rocc),
		.io_out_bits_uop_is_mov(_resp_arb_io_out_bits_uop_is_mov),
		.io_out_bits_uop_ftq_idx(_resp_arb_io_out_bits_uop_ftq_idx),
		.io_out_bits_uop_edge_inst(_resp_arb_io_out_bits_uop_edge_inst),
		.io_out_bits_uop_pc_lob(_resp_arb_io_out_bits_uop_pc_lob),
		.io_out_bits_uop_taken(_resp_arb_io_out_bits_uop_taken),
		.io_out_bits_uop_imm_rename(_resp_arb_io_out_bits_uop_imm_rename),
		.io_out_bits_uop_imm_sel(_resp_arb_io_out_bits_uop_imm_sel),
		.io_out_bits_uop_pimm(_resp_arb_io_out_bits_uop_pimm),
		.io_out_bits_uop_imm_packed(_resp_arb_io_out_bits_uop_imm_packed),
		.io_out_bits_uop_op1_sel(_resp_arb_io_out_bits_uop_op1_sel),
		.io_out_bits_uop_op2_sel(_resp_arb_io_out_bits_uop_op2_sel),
		.io_out_bits_uop_fp_ctrl_ldst(_resp_arb_io_out_bits_uop_fp_ctrl_ldst),
		.io_out_bits_uop_fp_ctrl_wen(_resp_arb_io_out_bits_uop_fp_ctrl_wen),
		.io_out_bits_uop_fp_ctrl_ren1(_resp_arb_io_out_bits_uop_fp_ctrl_ren1),
		.io_out_bits_uop_fp_ctrl_ren2(_resp_arb_io_out_bits_uop_fp_ctrl_ren2),
		.io_out_bits_uop_fp_ctrl_ren3(_resp_arb_io_out_bits_uop_fp_ctrl_ren3),
		.io_out_bits_uop_fp_ctrl_swap12(_resp_arb_io_out_bits_uop_fp_ctrl_swap12),
		.io_out_bits_uop_fp_ctrl_swap23(_resp_arb_io_out_bits_uop_fp_ctrl_swap23),
		.io_out_bits_uop_fp_ctrl_typeTagIn(_resp_arb_io_out_bits_uop_fp_ctrl_typeTagIn),
		.io_out_bits_uop_fp_ctrl_typeTagOut(_resp_arb_io_out_bits_uop_fp_ctrl_typeTagOut),
		.io_out_bits_uop_fp_ctrl_fromint(_resp_arb_io_out_bits_uop_fp_ctrl_fromint),
		.io_out_bits_uop_fp_ctrl_toint(_resp_arb_io_out_bits_uop_fp_ctrl_toint),
		.io_out_bits_uop_fp_ctrl_fastpipe(_resp_arb_io_out_bits_uop_fp_ctrl_fastpipe),
		.io_out_bits_uop_fp_ctrl_fma(_resp_arb_io_out_bits_uop_fp_ctrl_fma),
		.io_out_bits_uop_fp_ctrl_div(_resp_arb_io_out_bits_uop_fp_ctrl_div),
		.io_out_bits_uop_fp_ctrl_sqrt(_resp_arb_io_out_bits_uop_fp_ctrl_sqrt),
		.io_out_bits_uop_fp_ctrl_wflags(_resp_arb_io_out_bits_uop_fp_ctrl_wflags),
		.io_out_bits_uop_fp_ctrl_vec(_resp_arb_io_out_bits_uop_fp_ctrl_vec),
		.io_out_bits_uop_rob_idx(_resp_arb_io_out_bits_uop_rob_idx),
		.io_out_bits_uop_ldq_idx(_resp_arb_io_out_bits_uop_ldq_idx),
		.io_out_bits_uop_stq_idx(_resp_arb_io_out_bits_uop_stq_idx),
		.io_out_bits_uop_rxq_idx(_resp_arb_io_out_bits_uop_rxq_idx),
		.io_out_bits_uop_pdst(_resp_arb_io_out_bits_uop_pdst),
		.io_out_bits_uop_prs1(_resp_arb_io_out_bits_uop_prs1),
		.io_out_bits_uop_prs2(_resp_arb_io_out_bits_uop_prs2),
		.io_out_bits_uop_prs3(_resp_arb_io_out_bits_uop_prs3),
		.io_out_bits_uop_ppred(_resp_arb_io_out_bits_uop_ppred),
		.io_out_bits_uop_prs1_busy(_resp_arb_io_out_bits_uop_prs1_busy),
		.io_out_bits_uop_prs2_busy(_resp_arb_io_out_bits_uop_prs2_busy),
		.io_out_bits_uop_prs3_busy(_resp_arb_io_out_bits_uop_prs3_busy),
		.io_out_bits_uop_ppred_busy(_resp_arb_io_out_bits_uop_ppred_busy),
		.io_out_bits_uop_stale_pdst(_resp_arb_io_out_bits_uop_stale_pdst),
		.io_out_bits_uop_exception(_resp_arb_io_out_bits_uop_exception),
		.io_out_bits_uop_exc_cause(_resp_arb_io_out_bits_uop_exc_cause),
		.io_out_bits_uop_mem_cmd(_resp_arb_io_out_bits_uop_mem_cmd),
		.io_out_bits_uop_mem_size(_resp_arb_io_out_bits_uop_mem_size),
		.io_out_bits_uop_mem_signed(_resp_arb_io_out_bits_uop_mem_signed),
		.io_out_bits_uop_uses_ldq(_resp_arb_io_out_bits_uop_uses_ldq),
		.io_out_bits_uop_uses_stq(_resp_arb_io_out_bits_uop_uses_stq),
		.io_out_bits_uop_is_unique(_resp_arb_io_out_bits_uop_is_unique),
		.io_out_bits_uop_flush_on_commit(_resp_arb_io_out_bits_uop_flush_on_commit),
		.io_out_bits_uop_csr_cmd(_resp_arb_io_out_bits_uop_csr_cmd),
		.io_out_bits_uop_ldst_is_rs1(_resp_arb_io_out_bits_uop_ldst_is_rs1),
		.io_out_bits_uop_ldst(_resp_arb_io_out_bits_uop_ldst),
		.io_out_bits_uop_lrs1(_resp_arb_io_out_bits_uop_lrs1),
		.io_out_bits_uop_lrs2(_resp_arb_io_out_bits_uop_lrs2),
		.io_out_bits_uop_lrs3(_resp_arb_io_out_bits_uop_lrs3),
		.io_out_bits_uop_dst_rtype(_resp_arb_io_out_bits_uop_dst_rtype),
		.io_out_bits_uop_lrs1_rtype(_resp_arb_io_out_bits_uop_lrs1_rtype),
		.io_out_bits_uop_lrs2_rtype(_resp_arb_io_out_bits_uop_lrs2_rtype),
		.io_out_bits_uop_frs3_en(_resp_arb_io_out_bits_uop_frs3_en),
		.io_out_bits_uop_fcn_dw(_resp_arb_io_out_bits_uop_fcn_dw),
		.io_out_bits_uop_fcn_op(_resp_arb_io_out_bits_uop_fcn_op),
		.io_out_bits_uop_fp_val(_resp_arb_io_out_bits_uop_fp_val),
		.io_out_bits_uop_fp_rm(_resp_arb_io_out_bits_uop_fp_rm),
		.io_out_bits_uop_fp_typ(_resp_arb_io_out_bits_uop_fp_typ),
		.io_out_bits_uop_xcpt_pf_if(_resp_arb_io_out_bits_uop_xcpt_pf_if),
		.io_out_bits_uop_xcpt_ae_if(_resp_arb_io_out_bits_uop_xcpt_ae_if),
		.io_out_bits_uop_xcpt_ma_if(_resp_arb_io_out_bits_uop_xcpt_ma_if),
		.io_out_bits_uop_bp_debug_if(_resp_arb_io_out_bits_uop_bp_debug_if),
		.io_out_bits_uop_bp_xcpt_if(_resp_arb_io_out_bits_uop_bp_xcpt_if),
		.io_out_bits_uop_debug_fsrc(_resp_arb_io_out_bits_uop_debug_fsrc),
		.io_out_bits_uop_debug_tsrc(_resp_arb_io_out_bits_uop_debug_tsrc),
		.io_out_bits_data(_resp_arb_io_out_bits_data),
		.io_out_bits_is_hella(_resp_arb_io_out_bits_is_hella)
	);
	Arbiter2_L1DataWriteReq refill_arb(
		.io_in_0_ready(_refill_arb_io_in_0_ready),
		.io_in_0_valid(_mshrs_0_io_refill_valid),
		.io_in_0_bits_way_en(_mshrs_0_io_refill_bits_way_en),
		.io_in_0_bits_addr(_mshrs_0_io_refill_bits_addr),
		.io_in_0_bits_data(_mshrs_0_io_refill_bits_data),
		.io_in_1_ready(_refill_arb_io_in_1_ready),
		.io_in_1_valid(_mshrs_1_io_refill_valid),
		.io_in_1_bits_way_en(_mshrs_1_io_refill_bits_way_en),
		.io_in_1_bits_addr(_mshrs_1_io_refill_bits_addr),
		.io_in_1_bits_data(_mshrs_1_io_refill_bits_data),
		.io_out_ready(io_refill_ready),
		.io_out_valid(io_refill_valid),
		.io_out_bits_way_en(io_refill_bits_way_en),
		.io_out_bits_addr(io_refill_bits_addr),
		.io_out_bits_data(io_refill_bits_data)
	);
	BoomMSHR mshrs_0(
		.clock(clock),
		.reset(reset),
		.io_id(1'h0),
		.io_req_pri_val(~mshr_alloc_idx_REG & pri_val),
		.io_req_pri_rdy(_mshrs_0_io_req_pri_rdy),
		.io_req_sec_val(_mshr_io_req_sec_val_T_3),
		.io_req_sec_rdy(_mshrs_0_io_req_sec_rdy),
		.io_clear_prefetch(((io_clear_all & ~io_req_0_valid) | (((io_req_0_valid & idx_matches_0_0) & io_req_0_bits_addr[31]) & ~tag_match_0)) | (io_req_is_probe_0 & idx_matches_0_0)),
		.io_brupdate_b1_resolve_mask(io_brupdate_b1_resolve_mask),
		.io_brupdate_b1_mispredict_mask(io_brupdate_b1_mispredict_mask),
		.io_exception(io_exception),
		.io_req_uop_inst(io_req_0_bits_uop_inst),
		.io_req_uop_debug_inst(io_req_0_bits_uop_debug_inst),
		.io_req_uop_is_rvc(io_req_0_bits_uop_is_rvc),
		.io_req_uop_debug_pc(io_req_0_bits_uop_debug_pc),
		.io_req_uop_iq_type_0(io_req_0_bits_uop_iq_type_0),
		.io_req_uop_iq_type_1(io_req_0_bits_uop_iq_type_1),
		.io_req_uop_iq_type_2(io_req_0_bits_uop_iq_type_2),
		.io_req_uop_iq_type_3(io_req_0_bits_uop_iq_type_3),
		.io_req_uop_fu_code_0(io_req_0_bits_uop_fu_code_0),
		.io_req_uop_fu_code_1(io_req_0_bits_uop_fu_code_1),
		.io_req_uop_fu_code_2(io_req_0_bits_uop_fu_code_2),
		.io_req_uop_fu_code_3(io_req_0_bits_uop_fu_code_3),
		.io_req_uop_fu_code_4(io_req_0_bits_uop_fu_code_4),
		.io_req_uop_fu_code_5(io_req_0_bits_uop_fu_code_5),
		.io_req_uop_fu_code_6(io_req_0_bits_uop_fu_code_6),
		.io_req_uop_fu_code_7(io_req_0_bits_uop_fu_code_7),
		.io_req_uop_fu_code_8(io_req_0_bits_uop_fu_code_8),
		.io_req_uop_fu_code_9(io_req_0_bits_uop_fu_code_9),
		.io_req_uop_iw_issued(io_req_0_bits_uop_iw_issued),
		.io_req_uop_iw_issued_partial_agen(io_req_0_bits_uop_iw_issued_partial_agen),
		.io_req_uop_iw_issued_partial_dgen(io_req_0_bits_uop_iw_issued_partial_dgen),
		.io_req_uop_iw_p1_speculative_child(io_req_0_bits_uop_iw_p1_speculative_child),
		.io_req_uop_iw_p2_speculative_child(io_req_0_bits_uop_iw_p2_speculative_child),
		.io_req_uop_iw_p1_bypass_hint(io_req_0_bits_uop_iw_p1_bypass_hint),
		.io_req_uop_iw_p2_bypass_hint(io_req_0_bits_uop_iw_p2_bypass_hint),
		.io_req_uop_iw_p3_bypass_hint(io_req_0_bits_uop_iw_p3_bypass_hint),
		.io_req_uop_dis_col_sel(io_req_0_bits_uop_dis_col_sel),
		.io_req_uop_br_mask(io_req_0_bits_uop_br_mask),
		.io_req_uop_br_tag(io_req_0_bits_uop_br_tag),
		.io_req_uop_br_type(io_req_0_bits_uop_br_type),
		.io_req_uop_is_sfb(io_req_0_bits_uop_is_sfb),
		.io_req_uop_is_fence(io_req_0_bits_uop_is_fence),
		.io_req_uop_is_fencei(io_req_0_bits_uop_is_fencei),
		.io_req_uop_is_sfence(io_req_0_bits_uop_is_sfence),
		.io_req_uop_is_amo(io_req_0_bits_uop_is_amo),
		.io_req_uop_is_eret(io_req_0_bits_uop_is_eret),
		.io_req_uop_is_sys_pc2epc(io_req_0_bits_uop_is_sys_pc2epc),
		.io_req_uop_is_rocc(io_req_0_bits_uop_is_rocc),
		.io_req_uop_is_mov(io_req_0_bits_uop_is_mov),
		.io_req_uop_ftq_idx(io_req_0_bits_uop_ftq_idx),
		.io_req_uop_edge_inst(io_req_0_bits_uop_edge_inst),
		.io_req_uop_pc_lob(io_req_0_bits_uop_pc_lob),
		.io_req_uop_taken(io_req_0_bits_uop_taken),
		.io_req_uop_imm_rename(io_req_0_bits_uop_imm_rename),
		.io_req_uop_imm_sel(io_req_0_bits_uop_imm_sel),
		.io_req_uop_pimm(io_req_0_bits_uop_pimm),
		.io_req_uop_imm_packed(io_req_0_bits_uop_imm_packed),
		.io_req_uop_op1_sel(io_req_0_bits_uop_op1_sel),
		.io_req_uop_op2_sel(io_req_0_bits_uop_op2_sel),
		.io_req_uop_fp_ctrl_ldst(io_req_0_bits_uop_fp_ctrl_ldst),
		.io_req_uop_fp_ctrl_wen(io_req_0_bits_uop_fp_ctrl_wen),
		.io_req_uop_fp_ctrl_ren1(io_req_0_bits_uop_fp_ctrl_ren1),
		.io_req_uop_fp_ctrl_ren2(io_req_0_bits_uop_fp_ctrl_ren2),
		.io_req_uop_fp_ctrl_ren3(io_req_0_bits_uop_fp_ctrl_ren3),
		.io_req_uop_fp_ctrl_swap12(io_req_0_bits_uop_fp_ctrl_swap12),
		.io_req_uop_fp_ctrl_swap23(io_req_0_bits_uop_fp_ctrl_swap23),
		.io_req_uop_fp_ctrl_typeTagIn(io_req_0_bits_uop_fp_ctrl_typeTagIn),
		.io_req_uop_fp_ctrl_typeTagOut(io_req_0_bits_uop_fp_ctrl_typeTagOut),
		.io_req_uop_fp_ctrl_fromint(io_req_0_bits_uop_fp_ctrl_fromint),
		.io_req_uop_fp_ctrl_toint(io_req_0_bits_uop_fp_ctrl_toint),
		.io_req_uop_fp_ctrl_fastpipe(io_req_0_bits_uop_fp_ctrl_fastpipe),
		.io_req_uop_fp_ctrl_fma(io_req_0_bits_uop_fp_ctrl_fma),
		.io_req_uop_fp_ctrl_div(io_req_0_bits_uop_fp_ctrl_div),
		.io_req_uop_fp_ctrl_sqrt(io_req_0_bits_uop_fp_ctrl_sqrt),
		.io_req_uop_fp_ctrl_wflags(io_req_0_bits_uop_fp_ctrl_wflags),
		.io_req_uop_fp_ctrl_vec(io_req_0_bits_uop_fp_ctrl_vec),
		.io_req_uop_rob_idx(io_req_0_bits_uop_rob_idx),
		.io_req_uop_ldq_idx(io_req_0_bits_uop_ldq_idx),
		.io_req_uop_stq_idx(io_req_0_bits_uop_stq_idx),
		.io_req_uop_rxq_idx(io_req_0_bits_uop_rxq_idx),
		.io_req_uop_pdst(io_req_0_bits_uop_pdst),
		.io_req_uop_prs1(io_req_0_bits_uop_prs1),
		.io_req_uop_prs2(io_req_0_bits_uop_prs2),
		.io_req_uop_prs3(io_req_0_bits_uop_prs3),
		.io_req_uop_ppred(io_req_0_bits_uop_ppred),
		.io_req_uop_prs1_busy(io_req_0_bits_uop_prs1_busy),
		.io_req_uop_prs2_busy(io_req_0_bits_uop_prs2_busy),
		.io_req_uop_prs3_busy(io_req_0_bits_uop_prs3_busy),
		.io_req_uop_ppred_busy(io_req_0_bits_uop_ppred_busy),
		.io_req_uop_stale_pdst(io_req_0_bits_uop_stale_pdst),
		.io_req_uop_exception(io_req_0_bits_uop_exception),
		.io_req_uop_exc_cause(io_req_0_bits_uop_exc_cause),
		.io_req_uop_mem_cmd(io_req_0_bits_uop_mem_cmd),
		.io_req_uop_mem_size(io_req_0_bits_uop_mem_size),
		.io_req_uop_mem_signed(io_req_0_bits_uop_mem_signed),
		.io_req_uop_uses_ldq(io_req_0_bits_uop_uses_ldq),
		.io_req_uop_uses_stq(io_req_0_bits_uop_uses_stq),
		.io_req_uop_is_unique(io_req_0_bits_uop_is_unique),
		.io_req_uop_flush_on_commit(io_req_0_bits_uop_flush_on_commit),
		.io_req_uop_csr_cmd(io_req_0_bits_uop_csr_cmd),
		.io_req_uop_ldst_is_rs1(io_req_0_bits_uop_ldst_is_rs1),
		.io_req_uop_ldst(io_req_0_bits_uop_ldst),
		.io_req_uop_lrs1(io_req_0_bits_uop_lrs1),
		.io_req_uop_lrs2(io_req_0_bits_uop_lrs2),
		.io_req_uop_lrs3(io_req_0_bits_uop_lrs3),
		.io_req_uop_dst_rtype(io_req_0_bits_uop_dst_rtype),
		.io_req_uop_lrs1_rtype(io_req_0_bits_uop_lrs1_rtype),
		.io_req_uop_lrs2_rtype(io_req_0_bits_uop_lrs2_rtype),
		.io_req_uop_frs3_en(io_req_0_bits_uop_frs3_en),
		.io_req_uop_fcn_dw(io_req_0_bits_uop_fcn_dw),
		.io_req_uop_fcn_op(io_req_0_bits_uop_fcn_op),
		.io_req_uop_fp_val(io_req_0_bits_uop_fp_val),
		.io_req_uop_fp_rm(io_req_0_bits_uop_fp_rm),
		.io_req_uop_fp_typ(io_req_0_bits_uop_fp_typ),
		.io_req_uop_xcpt_pf_if(io_req_0_bits_uop_xcpt_pf_if),
		.io_req_uop_xcpt_ae_if(io_req_0_bits_uop_xcpt_ae_if),
		.io_req_uop_xcpt_ma_if(io_req_0_bits_uop_xcpt_ma_if),
		.io_req_uop_bp_debug_if(io_req_0_bits_uop_bp_debug_if),
		.io_req_uop_bp_xcpt_if(io_req_0_bits_uop_bp_xcpt_if),
		.io_req_uop_debug_fsrc(io_req_0_bits_uop_debug_fsrc),
		.io_req_uop_debug_tsrc(io_req_0_bits_uop_debug_tsrc),
		.io_req_addr(io_req_0_bits_addr),
		.io_req_data(io_req_0_bits_data),
		.io_req_is_hella(io_req_0_bits_is_hella),
		.io_req_tag_match(io_req_0_bits_tag_match),
		.io_req_old_meta_coh_state(io_req_0_bits_old_meta_coh_state),
		.io_req_old_meta_tag(io_req_0_bits_old_meta_tag),
		.io_req_way_en(io_req_0_bits_way_en),
		.io_req_sdq_id(sdq_alloc_id),
		.io_req_is_probe(io_req_is_probe_0),
		.io_idx_valid(_mshrs_0_io_idx_valid),
		.io_idx_bits(_mshrs_0_io_idx_bits),
		.io_way_valid(_mshrs_0_io_way_valid),
		.io_way_bits(_mshrs_0_io_way_bits),
		.io_tag_valid(_mshrs_0_io_tag_valid),
		.io_tag_bits(_mshrs_0_io_tag_bits),
		.io_mem_acquire_ready(io_mem_acquire_ready & (idle | state_0)),
		.io_mem_acquire_valid(_mshrs_0_io_mem_acquire_valid),
		.io_mem_acquire_bits_param(_mshrs_0_io_mem_acquire_bits_param),
		.io_mem_acquire_bits_source(_mshrs_0_io_mem_acquire_bits_source),
		.io_mem_acquire_bits_address(_mshrs_0_io_mem_acquire_bits_address),
		.io_mem_grant_ready(_mshrs_0_io_mem_grant_ready),
		.io_mem_grant_valid(_GEN_0 & io_mem_grant_valid),
		.io_mem_grant_bits_opcode(io_mem_grant_bits_opcode),
		.io_mem_grant_bits_param(io_mem_grant_bits_param),
		.io_mem_grant_bits_size(io_mem_grant_bits_size),
		.io_mem_grant_bits_sink(io_mem_grant_bits_sink),
		.io_mem_grant_bits_data(io_mem_grant_bits_data),
		.io_mem_finish_ready(io_mem_finish_ready & (~beatsLeft_1 | state_1_0)),
		.io_mem_finish_valid(_mshrs_0_io_mem_finish_valid),
		.io_mem_finish_bits_sink(_mshrs_0_io_mem_finish_bits_sink),
		.io_prober_state_valid(io_prober_state_valid),
		.io_prober_state_bits(io_prober_state_bits),
		.io_refill_ready(_refill_arb_io_in_0_ready),
		.io_refill_valid(_mshrs_0_io_refill_valid),
		.io_refill_bits_way_en(_mshrs_0_io_refill_bits_way_en),
		.io_refill_bits_addr(_mshrs_0_io_refill_bits_addr),
		.io_refill_bits_data(_mshrs_0_io_refill_bits_data),
		.io_meta_write_ready(_meta_write_arb_io_in_0_ready),
		.io_meta_write_valid(_mshrs_0_io_meta_write_valid),
		.io_meta_write_bits_idx(_mshrs_0_io_meta_write_bits_idx),
		.io_meta_write_bits_way_en(_mshrs_0_io_meta_write_bits_way_en),
		.io_meta_write_bits_data_coh_state(_mshrs_0_io_meta_write_bits_data_coh_state),
		.io_meta_write_bits_data_tag(_mshrs_0_io_meta_write_bits_data_tag),
		.io_meta_read_ready(_meta_read_arb_io_in_0_ready),
		.io_meta_read_valid(_mshrs_0_io_meta_read_valid),
		.io_meta_read_bits_idx(_mshrs_0_io_meta_read_bits_idx),
		.io_meta_read_bits_way_en(_mshrs_0_io_meta_read_bits_way_en),
		.io_meta_read_bits_tag(_mshrs_0_io_meta_read_bits_tag),
		.io_meta_resp_valid(io_meta_resp_valid),
		.io_meta_resp_bits_coh_state(io_meta_resp_bits_coh_state),
		.io_wb_req_ready(_wb_req_arb_io_in_0_ready),
		.io_wb_req_valid(_mshrs_0_io_wb_req_valid),
		.io_wb_req_bits_tag(_mshrs_0_io_wb_req_bits_tag),
		.io_wb_req_bits_idx(_mshrs_0_io_wb_req_bits_idx),
		.io_wb_req_bits_source(_mshrs_0_io_wb_req_bits_source),
		.io_wb_req_bits_param(_mshrs_0_io_wb_req_bits_param),
		.io_wb_req_bits_way_en(_mshrs_0_io_wb_req_bits_way_en),
		.io_lb_read_offset(_mshrs_0_io_lb_read_offset),
		.io_lb_resp(_GEN[_mshrs_0_io_lb_read_offset * 64+:64]),
		.io_lb_write_valid(_mshrs_0_io_lb_write_valid),
		.io_lb_write_bits_offset(_mshrs_0_io_lb_write_bits_offset),
		.io_lb_write_bits_data(_mshrs_0_io_lb_write_bits_data),
		.io_replay_ready(_replay_arb_io_in_0_ready),
		.io_replay_valid(_mshrs_0_io_replay_valid),
		.io_replay_bits_uop_inst(_mshrs_0_io_replay_bits_uop_inst),
		.io_replay_bits_uop_debug_inst(_mshrs_0_io_replay_bits_uop_debug_inst),
		.io_replay_bits_uop_is_rvc(_mshrs_0_io_replay_bits_uop_is_rvc),
		.io_replay_bits_uop_debug_pc(_mshrs_0_io_replay_bits_uop_debug_pc),
		.io_replay_bits_uop_iq_type_0(_mshrs_0_io_replay_bits_uop_iq_type_0),
		.io_replay_bits_uop_iq_type_1(_mshrs_0_io_replay_bits_uop_iq_type_1),
		.io_replay_bits_uop_iq_type_2(_mshrs_0_io_replay_bits_uop_iq_type_2),
		.io_replay_bits_uop_iq_type_3(_mshrs_0_io_replay_bits_uop_iq_type_3),
		.io_replay_bits_uop_fu_code_0(_mshrs_0_io_replay_bits_uop_fu_code_0),
		.io_replay_bits_uop_fu_code_1(_mshrs_0_io_replay_bits_uop_fu_code_1),
		.io_replay_bits_uop_fu_code_2(_mshrs_0_io_replay_bits_uop_fu_code_2),
		.io_replay_bits_uop_fu_code_3(_mshrs_0_io_replay_bits_uop_fu_code_3),
		.io_replay_bits_uop_fu_code_4(_mshrs_0_io_replay_bits_uop_fu_code_4),
		.io_replay_bits_uop_fu_code_5(_mshrs_0_io_replay_bits_uop_fu_code_5),
		.io_replay_bits_uop_fu_code_6(_mshrs_0_io_replay_bits_uop_fu_code_6),
		.io_replay_bits_uop_fu_code_7(_mshrs_0_io_replay_bits_uop_fu_code_7),
		.io_replay_bits_uop_fu_code_8(_mshrs_0_io_replay_bits_uop_fu_code_8),
		.io_replay_bits_uop_fu_code_9(_mshrs_0_io_replay_bits_uop_fu_code_9),
		.io_replay_bits_uop_iw_issued(_mshrs_0_io_replay_bits_uop_iw_issued),
		.io_replay_bits_uop_iw_issued_partial_agen(_mshrs_0_io_replay_bits_uop_iw_issued_partial_agen),
		.io_replay_bits_uop_iw_issued_partial_dgen(_mshrs_0_io_replay_bits_uop_iw_issued_partial_dgen),
		.io_replay_bits_uop_iw_p1_speculative_child(_mshrs_0_io_replay_bits_uop_iw_p1_speculative_child),
		.io_replay_bits_uop_iw_p2_speculative_child(_mshrs_0_io_replay_bits_uop_iw_p2_speculative_child),
		.io_replay_bits_uop_iw_p1_bypass_hint(_mshrs_0_io_replay_bits_uop_iw_p1_bypass_hint),
		.io_replay_bits_uop_iw_p2_bypass_hint(_mshrs_0_io_replay_bits_uop_iw_p2_bypass_hint),
		.io_replay_bits_uop_iw_p3_bypass_hint(_mshrs_0_io_replay_bits_uop_iw_p3_bypass_hint),
		.io_replay_bits_uop_dis_col_sel(_mshrs_0_io_replay_bits_uop_dis_col_sel),
		.io_replay_bits_uop_br_mask(_mshrs_0_io_replay_bits_uop_br_mask),
		.io_replay_bits_uop_br_tag(_mshrs_0_io_replay_bits_uop_br_tag),
		.io_replay_bits_uop_br_type(_mshrs_0_io_replay_bits_uop_br_type),
		.io_replay_bits_uop_is_sfb(_mshrs_0_io_replay_bits_uop_is_sfb),
		.io_replay_bits_uop_is_fence(_mshrs_0_io_replay_bits_uop_is_fence),
		.io_replay_bits_uop_is_fencei(_mshrs_0_io_replay_bits_uop_is_fencei),
		.io_replay_bits_uop_is_sfence(_mshrs_0_io_replay_bits_uop_is_sfence),
		.io_replay_bits_uop_is_amo(_mshrs_0_io_replay_bits_uop_is_amo),
		.io_replay_bits_uop_is_eret(_mshrs_0_io_replay_bits_uop_is_eret),
		.io_replay_bits_uop_is_sys_pc2epc(_mshrs_0_io_replay_bits_uop_is_sys_pc2epc),
		.io_replay_bits_uop_is_rocc(_mshrs_0_io_replay_bits_uop_is_rocc),
		.io_replay_bits_uop_is_mov(_mshrs_0_io_replay_bits_uop_is_mov),
		.io_replay_bits_uop_ftq_idx(_mshrs_0_io_replay_bits_uop_ftq_idx),
		.io_replay_bits_uop_edge_inst(_mshrs_0_io_replay_bits_uop_edge_inst),
		.io_replay_bits_uop_pc_lob(_mshrs_0_io_replay_bits_uop_pc_lob),
		.io_replay_bits_uop_taken(_mshrs_0_io_replay_bits_uop_taken),
		.io_replay_bits_uop_imm_rename(_mshrs_0_io_replay_bits_uop_imm_rename),
		.io_replay_bits_uop_imm_sel(_mshrs_0_io_replay_bits_uop_imm_sel),
		.io_replay_bits_uop_pimm(_mshrs_0_io_replay_bits_uop_pimm),
		.io_replay_bits_uop_imm_packed(_mshrs_0_io_replay_bits_uop_imm_packed),
		.io_replay_bits_uop_op1_sel(_mshrs_0_io_replay_bits_uop_op1_sel),
		.io_replay_bits_uop_op2_sel(_mshrs_0_io_replay_bits_uop_op2_sel),
		.io_replay_bits_uop_fp_ctrl_ldst(_mshrs_0_io_replay_bits_uop_fp_ctrl_ldst),
		.io_replay_bits_uop_fp_ctrl_wen(_mshrs_0_io_replay_bits_uop_fp_ctrl_wen),
		.io_replay_bits_uop_fp_ctrl_ren1(_mshrs_0_io_replay_bits_uop_fp_ctrl_ren1),
		.io_replay_bits_uop_fp_ctrl_ren2(_mshrs_0_io_replay_bits_uop_fp_ctrl_ren2),
		.io_replay_bits_uop_fp_ctrl_ren3(_mshrs_0_io_replay_bits_uop_fp_ctrl_ren3),
		.io_replay_bits_uop_fp_ctrl_swap12(_mshrs_0_io_replay_bits_uop_fp_ctrl_swap12),
		.io_replay_bits_uop_fp_ctrl_swap23(_mshrs_0_io_replay_bits_uop_fp_ctrl_swap23),
		.io_replay_bits_uop_fp_ctrl_typeTagIn(_mshrs_0_io_replay_bits_uop_fp_ctrl_typeTagIn),
		.io_replay_bits_uop_fp_ctrl_typeTagOut(_mshrs_0_io_replay_bits_uop_fp_ctrl_typeTagOut),
		.io_replay_bits_uop_fp_ctrl_fromint(_mshrs_0_io_replay_bits_uop_fp_ctrl_fromint),
		.io_replay_bits_uop_fp_ctrl_toint(_mshrs_0_io_replay_bits_uop_fp_ctrl_toint),
		.io_replay_bits_uop_fp_ctrl_fastpipe(_mshrs_0_io_replay_bits_uop_fp_ctrl_fastpipe),
		.io_replay_bits_uop_fp_ctrl_fma(_mshrs_0_io_replay_bits_uop_fp_ctrl_fma),
		.io_replay_bits_uop_fp_ctrl_div(_mshrs_0_io_replay_bits_uop_fp_ctrl_div),
		.io_replay_bits_uop_fp_ctrl_sqrt(_mshrs_0_io_replay_bits_uop_fp_ctrl_sqrt),
		.io_replay_bits_uop_fp_ctrl_wflags(_mshrs_0_io_replay_bits_uop_fp_ctrl_wflags),
		.io_replay_bits_uop_fp_ctrl_vec(_mshrs_0_io_replay_bits_uop_fp_ctrl_vec),
		.io_replay_bits_uop_rob_idx(_mshrs_0_io_replay_bits_uop_rob_idx),
		.io_replay_bits_uop_ldq_idx(_mshrs_0_io_replay_bits_uop_ldq_idx),
		.io_replay_bits_uop_stq_idx(_mshrs_0_io_replay_bits_uop_stq_idx),
		.io_replay_bits_uop_rxq_idx(_mshrs_0_io_replay_bits_uop_rxq_idx),
		.io_replay_bits_uop_pdst(_mshrs_0_io_replay_bits_uop_pdst),
		.io_replay_bits_uop_prs1(_mshrs_0_io_replay_bits_uop_prs1),
		.io_replay_bits_uop_prs2(_mshrs_0_io_replay_bits_uop_prs2),
		.io_replay_bits_uop_prs3(_mshrs_0_io_replay_bits_uop_prs3),
		.io_replay_bits_uop_ppred(_mshrs_0_io_replay_bits_uop_ppred),
		.io_replay_bits_uop_prs1_busy(_mshrs_0_io_replay_bits_uop_prs1_busy),
		.io_replay_bits_uop_prs2_busy(_mshrs_0_io_replay_bits_uop_prs2_busy),
		.io_replay_bits_uop_prs3_busy(_mshrs_0_io_replay_bits_uop_prs3_busy),
		.io_replay_bits_uop_ppred_busy(_mshrs_0_io_replay_bits_uop_ppred_busy),
		.io_replay_bits_uop_stale_pdst(_mshrs_0_io_replay_bits_uop_stale_pdst),
		.io_replay_bits_uop_exception(_mshrs_0_io_replay_bits_uop_exception),
		.io_replay_bits_uop_exc_cause(_mshrs_0_io_replay_bits_uop_exc_cause),
		.io_replay_bits_uop_mem_cmd(_mshrs_0_io_replay_bits_uop_mem_cmd),
		.io_replay_bits_uop_mem_size(_mshrs_0_io_replay_bits_uop_mem_size),
		.io_replay_bits_uop_mem_signed(_mshrs_0_io_replay_bits_uop_mem_signed),
		.io_replay_bits_uop_uses_ldq(_mshrs_0_io_replay_bits_uop_uses_ldq),
		.io_replay_bits_uop_uses_stq(_mshrs_0_io_replay_bits_uop_uses_stq),
		.io_replay_bits_uop_is_unique(_mshrs_0_io_replay_bits_uop_is_unique),
		.io_replay_bits_uop_flush_on_commit(_mshrs_0_io_replay_bits_uop_flush_on_commit),
		.io_replay_bits_uop_csr_cmd(_mshrs_0_io_replay_bits_uop_csr_cmd),
		.io_replay_bits_uop_ldst_is_rs1(_mshrs_0_io_replay_bits_uop_ldst_is_rs1),
		.io_replay_bits_uop_ldst(_mshrs_0_io_replay_bits_uop_ldst),
		.io_replay_bits_uop_lrs1(_mshrs_0_io_replay_bits_uop_lrs1),
		.io_replay_bits_uop_lrs2(_mshrs_0_io_replay_bits_uop_lrs2),
		.io_replay_bits_uop_lrs3(_mshrs_0_io_replay_bits_uop_lrs3),
		.io_replay_bits_uop_dst_rtype(_mshrs_0_io_replay_bits_uop_dst_rtype),
		.io_replay_bits_uop_lrs1_rtype(_mshrs_0_io_replay_bits_uop_lrs1_rtype),
		.io_replay_bits_uop_lrs2_rtype(_mshrs_0_io_replay_bits_uop_lrs2_rtype),
		.io_replay_bits_uop_frs3_en(_mshrs_0_io_replay_bits_uop_frs3_en),
		.io_replay_bits_uop_fcn_dw(_mshrs_0_io_replay_bits_uop_fcn_dw),
		.io_replay_bits_uop_fcn_op(_mshrs_0_io_replay_bits_uop_fcn_op),
		.io_replay_bits_uop_fp_val(_mshrs_0_io_replay_bits_uop_fp_val),
		.io_replay_bits_uop_fp_rm(_mshrs_0_io_replay_bits_uop_fp_rm),
		.io_replay_bits_uop_fp_typ(_mshrs_0_io_replay_bits_uop_fp_typ),
		.io_replay_bits_uop_xcpt_pf_if(_mshrs_0_io_replay_bits_uop_xcpt_pf_if),
		.io_replay_bits_uop_xcpt_ae_if(_mshrs_0_io_replay_bits_uop_xcpt_ae_if),
		.io_replay_bits_uop_xcpt_ma_if(_mshrs_0_io_replay_bits_uop_xcpt_ma_if),
		.io_replay_bits_uop_bp_debug_if(_mshrs_0_io_replay_bits_uop_bp_debug_if),
		.io_replay_bits_uop_bp_xcpt_if(_mshrs_0_io_replay_bits_uop_bp_xcpt_if),
		.io_replay_bits_uop_debug_fsrc(_mshrs_0_io_replay_bits_uop_debug_fsrc),
		.io_replay_bits_uop_debug_tsrc(_mshrs_0_io_replay_bits_uop_debug_tsrc),
		.io_replay_bits_addr(_mshrs_0_io_replay_bits_addr),
		.io_replay_bits_is_hella(_mshrs_0_io_replay_bits_is_hella),
		.io_replay_bits_way_en(_mshrs_0_io_replay_bits_way_en),
		.io_replay_bits_sdq_id(_mshrs_0_io_replay_bits_sdq_id),
		.io_resp_ready(_resp_arb_io_in_0_ready),
		.io_resp_valid(_mshrs_0_io_resp_valid),
		.io_resp_bits_uop_inst(_mshrs_0_io_resp_bits_uop_inst),
		.io_resp_bits_uop_debug_inst(_mshrs_0_io_resp_bits_uop_debug_inst),
		.io_resp_bits_uop_is_rvc(_mshrs_0_io_resp_bits_uop_is_rvc),
		.io_resp_bits_uop_debug_pc(_mshrs_0_io_resp_bits_uop_debug_pc),
		.io_resp_bits_uop_iq_type_0(_mshrs_0_io_resp_bits_uop_iq_type_0),
		.io_resp_bits_uop_iq_type_1(_mshrs_0_io_resp_bits_uop_iq_type_1),
		.io_resp_bits_uop_iq_type_2(_mshrs_0_io_resp_bits_uop_iq_type_2),
		.io_resp_bits_uop_iq_type_3(_mshrs_0_io_resp_bits_uop_iq_type_3),
		.io_resp_bits_uop_fu_code_0(_mshrs_0_io_resp_bits_uop_fu_code_0),
		.io_resp_bits_uop_fu_code_1(_mshrs_0_io_resp_bits_uop_fu_code_1),
		.io_resp_bits_uop_fu_code_2(_mshrs_0_io_resp_bits_uop_fu_code_2),
		.io_resp_bits_uop_fu_code_3(_mshrs_0_io_resp_bits_uop_fu_code_3),
		.io_resp_bits_uop_fu_code_4(_mshrs_0_io_resp_bits_uop_fu_code_4),
		.io_resp_bits_uop_fu_code_5(_mshrs_0_io_resp_bits_uop_fu_code_5),
		.io_resp_bits_uop_fu_code_6(_mshrs_0_io_resp_bits_uop_fu_code_6),
		.io_resp_bits_uop_fu_code_7(_mshrs_0_io_resp_bits_uop_fu_code_7),
		.io_resp_bits_uop_fu_code_8(_mshrs_0_io_resp_bits_uop_fu_code_8),
		.io_resp_bits_uop_fu_code_9(_mshrs_0_io_resp_bits_uop_fu_code_9),
		.io_resp_bits_uop_iw_issued(_mshrs_0_io_resp_bits_uop_iw_issued),
		.io_resp_bits_uop_iw_issued_partial_agen(_mshrs_0_io_resp_bits_uop_iw_issued_partial_agen),
		.io_resp_bits_uop_iw_issued_partial_dgen(_mshrs_0_io_resp_bits_uop_iw_issued_partial_dgen),
		.io_resp_bits_uop_iw_p1_speculative_child(_mshrs_0_io_resp_bits_uop_iw_p1_speculative_child),
		.io_resp_bits_uop_iw_p2_speculative_child(_mshrs_0_io_resp_bits_uop_iw_p2_speculative_child),
		.io_resp_bits_uop_iw_p1_bypass_hint(_mshrs_0_io_resp_bits_uop_iw_p1_bypass_hint),
		.io_resp_bits_uop_iw_p2_bypass_hint(_mshrs_0_io_resp_bits_uop_iw_p2_bypass_hint),
		.io_resp_bits_uop_iw_p3_bypass_hint(_mshrs_0_io_resp_bits_uop_iw_p3_bypass_hint),
		.io_resp_bits_uop_dis_col_sel(_mshrs_0_io_resp_bits_uop_dis_col_sel),
		.io_resp_bits_uop_br_mask(_mshrs_0_io_resp_bits_uop_br_mask),
		.io_resp_bits_uop_br_tag(_mshrs_0_io_resp_bits_uop_br_tag),
		.io_resp_bits_uop_br_type(_mshrs_0_io_resp_bits_uop_br_type),
		.io_resp_bits_uop_is_sfb(_mshrs_0_io_resp_bits_uop_is_sfb),
		.io_resp_bits_uop_is_fence(_mshrs_0_io_resp_bits_uop_is_fence),
		.io_resp_bits_uop_is_fencei(_mshrs_0_io_resp_bits_uop_is_fencei),
		.io_resp_bits_uop_is_sfence(_mshrs_0_io_resp_bits_uop_is_sfence),
		.io_resp_bits_uop_is_amo(_mshrs_0_io_resp_bits_uop_is_amo),
		.io_resp_bits_uop_is_eret(_mshrs_0_io_resp_bits_uop_is_eret),
		.io_resp_bits_uop_is_sys_pc2epc(_mshrs_0_io_resp_bits_uop_is_sys_pc2epc),
		.io_resp_bits_uop_is_rocc(_mshrs_0_io_resp_bits_uop_is_rocc),
		.io_resp_bits_uop_is_mov(_mshrs_0_io_resp_bits_uop_is_mov),
		.io_resp_bits_uop_ftq_idx(_mshrs_0_io_resp_bits_uop_ftq_idx),
		.io_resp_bits_uop_edge_inst(_mshrs_0_io_resp_bits_uop_edge_inst),
		.io_resp_bits_uop_pc_lob(_mshrs_0_io_resp_bits_uop_pc_lob),
		.io_resp_bits_uop_taken(_mshrs_0_io_resp_bits_uop_taken),
		.io_resp_bits_uop_imm_rename(_mshrs_0_io_resp_bits_uop_imm_rename),
		.io_resp_bits_uop_imm_sel(_mshrs_0_io_resp_bits_uop_imm_sel),
		.io_resp_bits_uop_pimm(_mshrs_0_io_resp_bits_uop_pimm),
		.io_resp_bits_uop_imm_packed(_mshrs_0_io_resp_bits_uop_imm_packed),
		.io_resp_bits_uop_op1_sel(_mshrs_0_io_resp_bits_uop_op1_sel),
		.io_resp_bits_uop_op2_sel(_mshrs_0_io_resp_bits_uop_op2_sel),
		.io_resp_bits_uop_fp_ctrl_ldst(_mshrs_0_io_resp_bits_uop_fp_ctrl_ldst),
		.io_resp_bits_uop_fp_ctrl_wen(_mshrs_0_io_resp_bits_uop_fp_ctrl_wen),
		.io_resp_bits_uop_fp_ctrl_ren1(_mshrs_0_io_resp_bits_uop_fp_ctrl_ren1),
		.io_resp_bits_uop_fp_ctrl_ren2(_mshrs_0_io_resp_bits_uop_fp_ctrl_ren2),
		.io_resp_bits_uop_fp_ctrl_ren3(_mshrs_0_io_resp_bits_uop_fp_ctrl_ren3),
		.io_resp_bits_uop_fp_ctrl_swap12(_mshrs_0_io_resp_bits_uop_fp_ctrl_swap12),
		.io_resp_bits_uop_fp_ctrl_swap23(_mshrs_0_io_resp_bits_uop_fp_ctrl_swap23),
		.io_resp_bits_uop_fp_ctrl_typeTagIn(_mshrs_0_io_resp_bits_uop_fp_ctrl_typeTagIn),
		.io_resp_bits_uop_fp_ctrl_typeTagOut(_mshrs_0_io_resp_bits_uop_fp_ctrl_typeTagOut),
		.io_resp_bits_uop_fp_ctrl_fromint(_mshrs_0_io_resp_bits_uop_fp_ctrl_fromint),
		.io_resp_bits_uop_fp_ctrl_toint(_mshrs_0_io_resp_bits_uop_fp_ctrl_toint),
		.io_resp_bits_uop_fp_ctrl_fastpipe(_mshrs_0_io_resp_bits_uop_fp_ctrl_fastpipe),
		.io_resp_bits_uop_fp_ctrl_fma(_mshrs_0_io_resp_bits_uop_fp_ctrl_fma),
		.io_resp_bits_uop_fp_ctrl_div(_mshrs_0_io_resp_bits_uop_fp_ctrl_div),
		.io_resp_bits_uop_fp_ctrl_sqrt(_mshrs_0_io_resp_bits_uop_fp_ctrl_sqrt),
		.io_resp_bits_uop_fp_ctrl_wflags(_mshrs_0_io_resp_bits_uop_fp_ctrl_wflags),
		.io_resp_bits_uop_fp_ctrl_vec(_mshrs_0_io_resp_bits_uop_fp_ctrl_vec),
		.io_resp_bits_uop_rob_idx(_mshrs_0_io_resp_bits_uop_rob_idx),
		.io_resp_bits_uop_ldq_idx(_mshrs_0_io_resp_bits_uop_ldq_idx),
		.io_resp_bits_uop_stq_idx(_mshrs_0_io_resp_bits_uop_stq_idx),
		.io_resp_bits_uop_rxq_idx(_mshrs_0_io_resp_bits_uop_rxq_idx),
		.io_resp_bits_uop_pdst(_mshrs_0_io_resp_bits_uop_pdst),
		.io_resp_bits_uop_prs1(_mshrs_0_io_resp_bits_uop_prs1),
		.io_resp_bits_uop_prs2(_mshrs_0_io_resp_bits_uop_prs2),
		.io_resp_bits_uop_prs3(_mshrs_0_io_resp_bits_uop_prs3),
		.io_resp_bits_uop_ppred(_mshrs_0_io_resp_bits_uop_ppred),
		.io_resp_bits_uop_prs1_busy(_mshrs_0_io_resp_bits_uop_prs1_busy),
		.io_resp_bits_uop_prs2_busy(_mshrs_0_io_resp_bits_uop_prs2_busy),
		.io_resp_bits_uop_prs3_busy(_mshrs_0_io_resp_bits_uop_prs3_busy),
		.io_resp_bits_uop_ppred_busy(_mshrs_0_io_resp_bits_uop_ppred_busy),
		.io_resp_bits_uop_stale_pdst(_mshrs_0_io_resp_bits_uop_stale_pdst),
		.io_resp_bits_uop_exception(_mshrs_0_io_resp_bits_uop_exception),
		.io_resp_bits_uop_exc_cause(_mshrs_0_io_resp_bits_uop_exc_cause),
		.io_resp_bits_uop_mem_cmd(_mshrs_0_io_resp_bits_uop_mem_cmd),
		.io_resp_bits_uop_mem_size(_mshrs_0_io_resp_bits_uop_mem_size),
		.io_resp_bits_uop_mem_signed(_mshrs_0_io_resp_bits_uop_mem_signed),
		.io_resp_bits_uop_uses_ldq(_mshrs_0_io_resp_bits_uop_uses_ldq),
		.io_resp_bits_uop_uses_stq(_mshrs_0_io_resp_bits_uop_uses_stq),
		.io_resp_bits_uop_is_unique(_mshrs_0_io_resp_bits_uop_is_unique),
		.io_resp_bits_uop_flush_on_commit(_mshrs_0_io_resp_bits_uop_flush_on_commit),
		.io_resp_bits_uop_csr_cmd(_mshrs_0_io_resp_bits_uop_csr_cmd),
		.io_resp_bits_uop_ldst_is_rs1(_mshrs_0_io_resp_bits_uop_ldst_is_rs1),
		.io_resp_bits_uop_ldst(_mshrs_0_io_resp_bits_uop_ldst),
		.io_resp_bits_uop_lrs1(_mshrs_0_io_resp_bits_uop_lrs1),
		.io_resp_bits_uop_lrs2(_mshrs_0_io_resp_bits_uop_lrs2),
		.io_resp_bits_uop_lrs3(_mshrs_0_io_resp_bits_uop_lrs3),
		.io_resp_bits_uop_dst_rtype(_mshrs_0_io_resp_bits_uop_dst_rtype),
		.io_resp_bits_uop_lrs1_rtype(_mshrs_0_io_resp_bits_uop_lrs1_rtype),
		.io_resp_bits_uop_lrs2_rtype(_mshrs_0_io_resp_bits_uop_lrs2_rtype),
		.io_resp_bits_uop_frs3_en(_mshrs_0_io_resp_bits_uop_frs3_en),
		.io_resp_bits_uop_fcn_dw(_mshrs_0_io_resp_bits_uop_fcn_dw),
		.io_resp_bits_uop_fcn_op(_mshrs_0_io_resp_bits_uop_fcn_op),
		.io_resp_bits_uop_fp_val(_mshrs_0_io_resp_bits_uop_fp_val),
		.io_resp_bits_uop_fp_rm(_mshrs_0_io_resp_bits_uop_fp_rm),
		.io_resp_bits_uop_fp_typ(_mshrs_0_io_resp_bits_uop_fp_typ),
		.io_resp_bits_uop_xcpt_pf_if(_mshrs_0_io_resp_bits_uop_xcpt_pf_if),
		.io_resp_bits_uop_xcpt_ae_if(_mshrs_0_io_resp_bits_uop_xcpt_ae_if),
		.io_resp_bits_uop_xcpt_ma_if(_mshrs_0_io_resp_bits_uop_xcpt_ma_if),
		.io_resp_bits_uop_bp_debug_if(_mshrs_0_io_resp_bits_uop_bp_debug_if),
		.io_resp_bits_uop_bp_xcpt_if(_mshrs_0_io_resp_bits_uop_bp_xcpt_if),
		.io_resp_bits_uop_debug_fsrc(_mshrs_0_io_resp_bits_uop_debug_fsrc),
		.io_resp_bits_uop_debug_tsrc(_mshrs_0_io_resp_bits_uop_debug_tsrc),
		.io_resp_bits_data(_mshrs_0_io_resp_bits_data),
		.io_resp_bits_is_hella(_mshrs_0_io_resp_bits_is_hella),
		.io_wb_resp(io_wb_resp),
		.io_probe_rdy(_mshrs_0_io_probe_rdy)
	);
	BoomMSHR mshrs_1(
		.clock(clock),
		.reset(reset),
		.io_id(1'h1),
		.io_req_pri_val(mshr_alloc_idx_REG & pri_val),
		.io_req_pri_rdy(_mshrs_1_io_req_pri_rdy),
		.io_req_sec_val(_mshr_io_req_sec_val_T_7),
		.io_req_sec_rdy(_mshrs_1_io_req_sec_rdy),
		.io_clear_prefetch(((io_clear_all & ~io_req_0_valid) | (((io_req_0_valid & idx_matches_0_1) & io_req_0_bits_addr[31]) & ~tag_match_0)) | (io_req_is_probe_0 & idx_matches_0_1)),
		.io_brupdate_b1_resolve_mask(io_brupdate_b1_resolve_mask),
		.io_brupdate_b1_mispredict_mask(io_brupdate_b1_mispredict_mask),
		.io_exception(io_exception),
		.io_req_uop_inst(io_req_0_bits_uop_inst),
		.io_req_uop_debug_inst(io_req_0_bits_uop_debug_inst),
		.io_req_uop_is_rvc(io_req_0_bits_uop_is_rvc),
		.io_req_uop_debug_pc(io_req_0_bits_uop_debug_pc),
		.io_req_uop_iq_type_0(io_req_0_bits_uop_iq_type_0),
		.io_req_uop_iq_type_1(io_req_0_bits_uop_iq_type_1),
		.io_req_uop_iq_type_2(io_req_0_bits_uop_iq_type_2),
		.io_req_uop_iq_type_3(io_req_0_bits_uop_iq_type_3),
		.io_req_uop_fu_code_0(io_req_0_bits_uop_fu_code_0),
		.io_req_uop_fu_code_1(io_req_0_bits_uop_fu_code_1),
		.io_req_uop_fu_code_2(io_req_0_bits_uop_fu_code_2),
		.io_req_uop_fu_code_3(io_req_0_bits_uop_fu_code_3),
		.io_req_uop_fu_code_4(io_req_0_bits_uop_fu_code_4),
		.io_req_uop_fu_code_5(io_req_0_bits_uop_fu_code_5),
		.io_req_uop_fu_code_6(io_req_0_bits_uop_fu_code_6),
		.io_req_uop_fu_code_7(io_req_0_bits_uop_fu_code_7),
		.io_req_uop_fu_code_8(io_req_0_bits_uop_fu_code_8),
		.io_req_uop_fu_code_9(io_req_0_bits_uop_fu_code_9),
		.io_req_uop_iw_issued(io_req_0_bits_uop_iw_issued),
		.io_req_uop_iw_issued_partial_agen(io_req_0_bits_uop_iw_issued_partial_agen),
		.io_req_uop_iw_issued_partial_dgen(io_req_0_bits_uop_iw_issued_partial_dgen),
		.io_req_uop_iw_p1_speculative_child(io_req_0_bits_uop_iw_p1_speculative_child),
		.io_req_uop_iw_p2_speculative_child(io_req_0_bits_uop_iw_p2_speculative_child),
		.io_req_uop_iw_p1_bypass_hint(io_req_0_bits_uop_iw_p1_bypass_hint),
		.io_req_uop_iw_p2_bypass_hint(io_req_0_bits_uop_iw_p2_bypass_hint),
		.io_req_uop_iw_p3_bypass_hint(io_req_0_bits_uop_iw_p3_bypass_hint),
		.io_req_uop_dis_col_sel(io_req_0_bits_uop_dis_col_sel),
		.io_req_uop_br_mask(io_req_0_bits_uop_br_mask),
		.io_req_uop_br_tag(io_req_0_bits_uop_br_tag),
		.io_req_uop_br_type(io_req_0_bits_uop_br_type),
		.io_req_uop_is_sfb(io_req_0_bits_uop_is_sfb),
		.io_req_uop_is_fence(io_req_0_bits_uop_is_fence),
		.io_req_uop_is_fencei(io_req_0_bits_uop_is_fencei),
		.io_req_uop_is_sfence(io_req_0_bits_uop_is_sfence),
		.io_req_uop_is_amo(io_req_0_bits_uop_is_amo),
		.io_req_uop_is_eret(io_req_0_bits_uop_is_eret),
		.io_req_uop_is_sys_pc2epc(io_req_0_bits_uop_is_sys_pc2epc),
		.io_req_uop_is_rocc(io_req_0_bits_uop_is_rocc),
		.io_req_uop_is_mov(io_req_0_bits_uop_is_mov),
		.io_req_uop_ftq_idx(io_req_0_bits_uop_ftq_idx),
		.io_req_uop_edge_inst(io_req_0_bits_uop_edge_inst),
		.io_req_uop_pc_lob(io_req_0_bits_uop_pc_lob),
		.io_req_uop_taken(io_req_0_bits_uop_taken),
		.io_req_uop_imm_rename(io_req_0_bits_uop_imm_rename),
		.io_req_uop_imm_sel(io_req_0_bits_uop_imm_sel),
		.io_req_uop_pimm(io_req_0_bits_uop_pimm),
		.io_req_uop_imm_packed(io_req_0_bits_uop_imm_packed),
		.io_req_uop_op1_sel(io_req_0_bits_uop_op1_sel),
		.io_req_uop_op2_sel(io_req_0_bits_uop_op2_sel),
		.io_req_uop_fp_ctrl_ldst(io_req_0_bits_uop_fp_ctrl_ldst),
		.io_req_uop_fp_ctrl_wen(io_req_0_bits_uop_fp_ctrl_wen),
		.io_req_uop_fp_ctrl_ren1(io_req_0_bits_uop_fp_ctrl_ren1),
		.io_req_uop_fp_ctrl_ren2(io_req_0_bits_uop_fp_ctrl_ren2),
		.io_req_uop_fp_ctrl_ren3(io_req_0_bits_uop_fp_ctrl_ren3),
		.io_req_uop_fp_ctrl_swap12(io_req_0_bits_uop_fp_ctrl_swap12),
		.io_req_uop_fp_ctrl_swap23(io_req_0_bits_uop_fp_ctrl_swap23),
		.io_req_uop_fp_ctrl_typeTagIn(io_req_0_bits_uop_fp_ctrl_typeTagIn),
		.io_req_uop_fp_ctrl_typeTagOut(io_req_0_bits_uop_fp_ctrl_typeTagOut),
		.io_req_uop_fp_ctrl_fromint(io_req_0_bits_uop_fp_ctrl_fromint),
		.io_req_uop_fp_ctrl_toint(io_req_0_bits_uop_fp_ctrl_toint),
		.io_req_uop_fp_ctrl_fastpipe(io_req_0_bits_uop_fp_ctrl_fastpipe),
		.io_req_uop_fp_ctrl_fma(io_req_0_bits_uop_fp_ctrl_fma),
		.io_req_uop_fp_ctrl_div(io_req_0_bits_uop_fp_ctrl_div),
		.io_req_uop_fp_ctrl_sqrt(io_req_0_bits_uop_fp_ctrl_sqrt),
		.io_req_uop_fp_ctrl_wflags(io_req_0_bits_uop_fp_ctrl_wflags),
		.io_req_uop_fp_ctrl_vec(io_req_0_bits_uop_fp_ctrl_vec),
		.io_req_uop_rob_idx(io_req_0_bits_uop_rob_idx),
		.io_req_uop_ldq_idx(io_req_0_bits_uop_ldq_idx),
		.io_req_uop_stq_idx(io_req_0_bits_uop_stq_idx),
		.io_req_uop_rxq_idx(io_req_0_bits_uop_rxq_idx),
		.io_req_uop_pdst(io_req_0_bits_uop_pdst),
		.io_req_uop_prs1(io_req_0_bits_uop_prs1),
		.io_req_uop_prs2(io_req_0_bits_uop_prs2),
		.io_req_uop_prs3(io_req_0_bits_uop_prs3),
		.io_req_uop_ppred(io_req_0_bits_uop_ppred),
		.io_req_uop_prs1_busy(io_req_0_bits_uop_prs1_busy),
		.io_req_uop_prs2_busy(io_req_0_bits_uop_prs2_busy),
		.io_req_uop_prs3_busy(io_req_0_bits_uop_prs3_busy),
		.io_req_uop_ppred_busy(io_req_0_bits_uop_ppred_busy),
		.io_req_uop_stale_pdst(io_req_0_bits_uop_stale_pdst),
		.io_req_uop_exception(io_req_0_bits_uop_exception),
		.io_req_uop_exc_cause(io_req_0_bits_uop_exc_cause),
		.io_req_uop_mem_cmd(io_req_0_bits_uop_mem_cmd),
		.io_req_uop_mem_size(io_req_0_bits_uop_mem_size),
		.io_req_uop_mem_signed(io_req_0_bits_uop_mem_signed),
		.io_req_uop_uses_ldq(io_req_0_bits_uop_uses_ldq),
		.io_req_uop_uses_stq(io_req_0_bits_uop_uses_stq),
		.io_req_uop_is_unique(io_req_0_bits_uop_is_unique),
		.io_req_uop_flush_on_commit(io_req_0_bits_uop_flush_on_commit),
		.io_req_uop_csr_cmd(io_req_0_bits_uop_csr_cmd),
		.io_req_uop_ldst_is_rs1(io_req_0_bits_uop_ldst_is_rs1),
		.io_req_uop_ldst(io_req_0_bits_uop_ldst),
		.io_req_uop_lrs1(io_req_0_bits_uop_lrs1),
		.io_req_uop_lrs2(io_req_0_bits_uop_lrs2),
		.io_req_uop_lrs3(io_req_0_bits_uop_lrs3),
		.io_req_uop_dst_rtype(io_req_0_bits_uop_dst_rtype),
		.io_req_uop_lrs1_rtype(io_req_0_bits_uop_lrs1_rtype),
		.io_req_uop_lrs2_rtype(io_req_0_bits_uop_lrs2_rtype),
		.io_req_uop_frs3_en(io_req_0_bits_uop_frs3_en),
		.io_req_uop_fcn_dw(io_req_0_bits_uop_fcn_dw),
		.io_req_uop_fcn_op(io_req_0_bits_uop_fcn_op),
		.io_req_uop_fp_val(io_req_0_bits_uop_fp_val),
		.io_req_uop_fp_rm(io_req_0_bits_uop_fp_rm),
		.io_req_uop_fp_typ(io_req_0_bits_uop_fp_typ),
		.io_req_uop_xcpt_pf_if(io_req_0_bits_uop_xcpt_pf_if),
		.io_req_uop_xcpt_ae_if(io_req_0_bits_uop_xcpt_ae_if),
		.io_req_uop_xcpt_ma_if(io_req_0_bits_uop_xcpt_ma_if),
		.io_req_uop_bp_debug_if(io_req_0_bits_uop_bp_debug_if),
		.io_req_uop_bp_xcpt_if(io_req_0_bits_uop_bp_xcpt_if),
		.io_req_uop_debug_fsrc(io_req_0_bits_uop_debug_fsrc),
		.io_req_uop_debug_tsrc(io_req_0_bits_uop_debug_tsrc),
		.io_req_addr(io_req_0_bits_addr),
		.io_req_data(io_req_0_bits_data),
		.io_req_is_hella(io_req_0_bits_is_hella),
		.io_req_tag_match(io_req_0_bits_tag_match),
		.io_req_old_meta_coh_state(io_req_0_bits_old_meta_coh_state),
		.io_req_old_meta_tag(io_req_0_bits_old_meta_tag),
		.io_req_way_en(io_req_0_bits_way_en),
		.io_req_sdq_id(sdq_alloc_id),
		.io_req_is_probe(io_req_is_probe_0),
		.io_idx_valid(_mshrs_1_io_idx_valid),
		.io_idx_bits(_mshrs_1_io_idx_bits),
		.io_way_valid(_mshrs_1_io_way_valid),
		.io_way_bits(_mshrs_1_io_way_bits),
		.io_tag_valid(_mshrs_1_io_tag_valid),
		.io_tag_bits(_mshrs_1_io_tag_bits),
		.io_mem_acquire_ready(io_mem_acquire_ready & (idle ? ~_mshrs_0_io_mem_acquire_valid : state_1)),
		.io_mem_acquire_valid(_mshrs_1_io_mem_acquire_valid),
		.io_mem_acquire_bits_param(_mshrs_1_io_mem_acquire_bits_param),
		.io_mem_acquire_bits_source(_mshrs_1_io_mem_acquire_bits_source),
		.io_mem_acquire_bits_address(_mshrs_1_io_mem_acquire_bits_address),
		.io_mem_grant_ready(_mshrs_1_io_mem_grant_ready),
		.io_mem_grant_valid(_GEN_2 & io_mem_grant_valid),
		.io_mem_grant_bits_opcode(io_mem_grant_bits_opcode),
		.io_mem_grant_bits_param(io_mem_grant_bits_param),
		.io_mem_grant_bits_size(io_mem_grant_bits_size),
		.io_mem_grant_bits_sink(io_mem_grant_bits_sink),
		.io_mem_grant_bits_data(io_mem_grant_bits_data),
		.io_mem_finish_ready(io_mem_finish_ready & (beatsLeft_1 ? state_1_1 : ~_mshrs_0_io_mem_finish_valid)),
		.io_mem_finish_valid(_mshrs_1_io_mem_finish_valid),
		.io_mem_finish_bits_sink(_mshrs_1_io_mem_finish_bits_sink),
		.io_prober_state_valid(io_prober_state_valid),
		.io_prober_state_bits(io_prober_state_bits),
		.io_refill_ready(_refill_arb_io_in_1_ready),
		.io_refill_valid(_mshrs_1_io_refill_valid),
		.io_refill_bits_way_en(_mshrs_1_io_refill_bits_way_en),
		.io_refill_bits_addr(_mshrs_1_io_refill_bits_addr),
		.io_refill_bits_data(_mshrs_1_io_refill_bits_data),
		.io_meta_write_ready(_meta_write_arb_io_in_1_ready),
		.io_meta_write_valid(_mshrs_1_io_meta_write_valid),
		.io_meta_write_bits_idx(_mshrs_1_io_meta_write_bits_idx),
		.io_meta_write_bits_way_en(_mshrs_1_io_meta_write_bits_way_en),
		.io_meta_write_bits_data_coh_state(_mshrs_1_io_meta_write_bits_data_coh_state),
		.io_meta_write_bits_data_tag(_mshrs_1_io_meta_write_bits_data_tag),
		.io_meta_read_ready(_meta_read_arb_io_in_1_ready),
		.io_meta_read_valid(_mshrs_1_io_meta_read_valid),
		.io_meta_read_bits_idx(_mshrs_1_io_meta_read_bits_idx),
		.io_meta_read_bits_way_en(_mshrs_1_io_meta_read_bits_way_en),
		.io_meta_read_bits_tag(_mshrs_1_io_meta_read_bits_tag),
		.io_meta_resp_valid(io_meta_resp_valid),
		.io_meta_resp_bits_coh_state(io_meta_resp_bits_coh_state),
		.io_wb_req_ready(_wb_req_arb_io_in_1_ready),
		.io_wb_req_valid(_mshrs_1_io_wb_req_valid),
		.io_wb_req_bits_tag(_mshrs_1_io_wb_req_bits_tag),
		.io_wb_req_bits_idx(_mshrs_1_io_wb_req_bits_idx),
		.io_wb_req_bits_source(_mshrs_1_io_wb_req_bits_source),
		.io_wb_req_bits_param(_mshrs_1_io_wb_req_bits_param),
		.io_wb_req_bits_way_en(_mshrs_1_io_wb_req_bits_way_en),
		.io_lb_read_offset(_mshrs_1_io_lb_read_offset),
		.io_lb_resp(_GEN_1[_mshrs_1_io_lb_read_offset * 64+:64]),
		.io_lb_write_valid(_mshrs_1_io_lb_write_valid),
		.io_lb_write_bits_offset(_mshrs_1_io_lb_write_bits_offset),
		.io_lb_write_bits_data(_mshrs_1_io_lb_write_bits_data),
		.io_replay_ready(_replay_arb_io_in_1_ready),
		.io_replay_valid(_mshrs_1_io_replay_valid),
		.io_replay_bits_uop_inst(_mshrs_1_io_replay_bits_uop_inst),
		.io_replay_bits_uop_debug_inst(_mshrs_1_io_replay_bits_uop_debug_inst),
		.io_replay_bits_uop_is_rvc(_mshrs_1_io_replay_bits_uop_is_rvc),
		.io_replay_bits_uop_debug_pc(_mshrs_1_io_replay_bits_uop_debug_pc),
		.io_replay_bits_uop_iq_type_0(_mshrs_1_io_replay_bits_uop_iq_type_0),
		.io_replay_bits_uop_iq_type_1(_mshrs_1_io_replay_bits_uop_iq_type_1),
		.io_replay_bits_uop_iq_type_2(_mshrs_1_io_replay_bits_uop_iq_type_2),
		.io_replay_bits_uop_iq_type_3(_mshrs_1_io_replay_bits_uop_iq_type_3),
		.io_replay_bits_uop_fu_code_0(_mshrs_1_io_replay_bits_uop_fu_code_0),
		.io_replay_bits_uop_fu_code_1(_mshrs_1_io_replay_bits_uop_fu_code_1),
		.io_replay_bits_uop_fu_code_2(_mshrs_1_io_replay_bits_uop_fu_code_2),
		.io_replay_bits_uop_fu_code_3(_mshrs_1_io_replay_bits_uop_fu_code_3),
		.io_replay_bits_uop_fu_code_4(_mshrs_1_io_replay_bits_uop_fu_code_4),
		.io_replay_bits_uop_fu_code_5(_mshrs_1_io_replay_bits_uop_fu_code_5),
		.io_replay_bits_uop_fu_code_6(_mshrs_1_io_replay_bits_uop_fu_code_6),
		.io_replay_bits_uop_fu_code_7(_mshrs_1_io_replay_bits_uop_fu_code_7),
		.io_replay_bits_uop_fu_code_8(_mshrs_1_io_replay_bits_uop_fu_code_8),
		.io_replay_bits_uop_fu_code_9(_mshrs_1_io_replay_bits_uop_fu_code_9),
		.io_replay_bits_uop_iw_issued(_mshrs_1_io_replay_bits_uop_iw_issued),
		.io_replay_bits_uop_iw_issued_partial_agen(_mshrs_1_io_replay_bits_uop_iw_issued_partial_agen),
		.io_replay_bits_uop_iw_issued_partial_dgen(_mshrs_1_io_replay_bits_uop_iw_issued_partial_dgen),
		.io_replay_bits_uop_iw_p1_speculative_child(_mshrs_1_io_replay_bits_uop_iw_p1_speculative_child),
		.io_replay_bits_uop_iw_p2_speculative_child(_mshrs_1_io_replay_bits_uop_iw_p2_speculative_child),
		.io_replay_bits_uop_iw_p1_bypass_hint(_mshrs_1_io_replay_bits_uop_iw_p1_bypass_hint),
		.io_replay_bits_uop_iw_p2_bypass_hint(_mshrs_1_io_replay_bits_uop_iw_p2_bypass_hint),
		.io_replay_bits_uop_iw_p3_bypass_hint(_mshrs_1_io_replay_bits_uop_iw_p3_bypass_hint),
		.io_replay_bits_uop_dis_col_sel(_mshrs_1_io_replay_bits_uop_dis_col_sel),
		.io_replay_bits_uop_br_mask(_mshrs_1_io_replay_bits_uop_br_mask),
		.io_replay_bits_uop_br_tag(_mshrs_1_io_replay_bits_uop_br_tag),
		.io_replay_bits_uop_br_type(_mshrs_1_io_replay_bits_uop_br_type),
		.io_replay_bits_uop_is_sfb(_mshrs_1_io_replay_bits_uop_is_sfb),
		.io_replay_bits_uop_is_fence(_mshrs_1_io_replay_bits_uop_is_fence),
		.io_replay_bits_uop_is_fencei(_mshrs_1_io_replay_bits_uop_is_fencei),
		.io_replay_bits_uop_is_sfence(_mshrs_1_io_replay_bits_uop_is_sfence),
		.io_replay_bits_uop_is_amo(_mshrs_1_io_replay_bits_uop_is_amo),
		.io_replay_bits_uop_is_eret(_mshrs_1_io_replay_bits_uop_is_eret),
		.io_replay_bits_uop_is_sys_pc2epc(_mshrs_1_io_replay_bits_uop_is_sys_pc2epc),
		.io_replay_bits_uop_is_rocc(_mshrs_1_io_replay_bits_uop_is_rocc),
		.io_replay_bits_uop_is_mov(_mshrs_1_io_replay_bits_uop_is_mov),
		.io_replay_bits_uop_ftq_idx(_mshrs_1_io_replay_bits_uop_ftq_idx),
		.io_replay_bits_uop_edge_inst(_mshrs_1_io_replay_bits_uop_edge_inst),
		.io_replay_bits_uop_pc_lob(_mshrs_1_io_replay_bits_uop_pc_lob),
		.io_replay_bits_uop_taken(_mshrs_1_io_replay_bits_uop_taken),
		.io_replay_bits_uop_imm_rename(_mshrs_1_io_replay_bits_uop_imm_rename),
		.io_replay_bits_uop_imm_sel(_mshrs_1_io_replay_bits_uop_imm_sel),
		.io_replay_bits_uop_pimm(_mshrs_1_io_replay_bits_uop_pimm),
		.io_replay_bits_uop_imm_packed(_mshrs_1_io_replay_bits_uop_imm_packed),
		.io_replay_bits_uop_op1_sel(_mshrs_1_io_replay_bits_uop_op1_sel),
		.io_replay_bits_uop_op2_sel(_mshrs_1_io_replay_bits_uop_op2_sel),
		.io_replay_bits_uop_fp_ctrl_ldst(_mshrs_1_io_replay_bits_uop_fp_ctrl_ldst),
		.io_replay_bits_uop_fp_ctrl_wen(_mshrs_1_io_replay_bits_uop_fp_ctrl_wen),
		.io_replay_bits_uop_fp_ctrl_ren1(_mshrs_1_io_replay_bits_uop_fp_ctrl_ren1),
		.io_replay_bits_uop_fp_ctrl_ren2(_mshrs_1_io_replay_bits_uop_fp_ctrl_ren2),
		.io_replay_bits_uop_fp_ctrl_ren3(_mshrs_1_io_replay_bits_uop_fp_ctrl_ren3),
		.io_replay_bits_uop_fp_ctrl_swap12(_mshrs_1_io_replay_bits_uop_fp_ctrl_swap12),
		.io_replay_bits_uop_fp_ctrl_swap23(_mshrs_1_io_replay_bits_uop_fp_ctrl_swap23),
		.io_replay_bits_uop_fp_ctrl_typeTagIn(_mshrs_1_io_replay_bits_uop_fp_ctrl_typeTagIn),
		.io_replay_bits_uop_fp_ctrl_typeTagOut(_mshrs_1_io_replay_bits_uop_fp_ctrl_typeTagOut),
		.io_replay_bits_uop_fp_ctrl_fromint(_mshrs_1_io_replay_bits_uop_fp_ctrl_fromint),
		.io_replay_bits_uop_fp_ctrl_toint(_mshrs_1_io_replay_bits_uop_fp_ctrl_toint),
		.io_replay_bits_uop_fp_ctrl_fastpipe(_mshrs_1_io_replay_bits_uop_fp_ctrl_fastpipe),
		.io_replay_bits_uop_fp_ctrl_fma(_mshrs_1_io_replay_bits_uop_fp_ctrl_fma),
		.io_replay_bits_uop_fp_ctrl_div(_mshrs_1_io_replay_bits_uop_fp_ctrl_div),
		.io_replay_bits_uop_fp_ctrl_sqrt(_mshrs_1_io_replay_bits_uop_fp_ctrl_sqrt),
		.io_replay_bits_uop_fp_ctrl_wflags(_mshrs_1_io_replay_bits_uop_fp_ctrl_wflags),
		.io_replay_bits_uop_fp_ctrl_vec(_mshrs_1_io_replay_bits_uop_fp_ctrl_vec),
		.io_replay_bits_uop_rob_idx(_mshrs_1_io_replay_bits_uop_rob_idx),
		.io_replay_bits_uop_ldq_idx(_mshrs_1_io_replay_bits_uop_ldq_idx),
		.io_replay_bits_uop_stq_idx(_mshrs_1_io_replay_bits_uop_stq_idx),
		.io_replay_bits_uop_rxq_idx(_mshrs_1_io_replay_bits_uop_rxq_idx),
		.io_replay_bits_uop_pdst(_mshrs_1_io_replay_bits_uop_pdst),
		.io_replay_bits_uop_prs1(_mshrs_1_io_replay_bits_uop_prs1),
		.io_replay_bits_uop_prs2(_mshrs_1_io_replay_bits_uop_prs2),
		.io_replay_bits_uop_prs3(_mshrs_1_io_replay_bits_uop_prs3),
		.io_replay_bits_uop_ppred(_mshrs_1_io_replay_bits_uop_ppred),
		.io_replay_bits_uop_prs1_busy(_mshrs_1_io_replay_bits_uop_prs1_busy),
		.io_replay_bits_uop_prs2_busy(_mshrs_1_io_replay_bits_uop_prs2_busy),
		.io_replay_bits_uop_prs3_busy(_mshrs_1_io_replay_bits_uop_prs3_busy),
		.io_replay_bits_uop_ppred_busy(_mshrs_1_io_replay_bits_uop_ppred_busy),
		.io_replay_bits_uop_stale_pdst(_mshrs_1_io_replay_bits_uop_stale_pdst),
		.io_replay_bits_uop_exception(_mshrs_1_io_replay_bits_uop_exception),
		.io_replay_bits_uop_exc_cause(_mshrs_1_io_replay_bits_uop_exc_cause),
		.io_replay_bits_uop_mem_cmd(_mshrs_1_io_replay_bits_uop_mem_cmd),
		.io_replay_bits_uop_mem_size(_mshrs_1_io_replay_bits_uop_mem_size),
		.io_replay_bits_uop_mem_signed(_mshrs_1_io_replay_bits_uop_mem_signed),
		.io_replay_bits_uop_uses_ldq(_mshrs_1_io_replay_bits_uop_uses_ldq),
		.io_replay_bits_uop_uses_stq(_mshrs_1_io_replay_bits_uop_uses_stq),
		.io_replay_bits_uop_is_unique(_mshrs_1_io_replay_bits_uop_is_unique),
		.io_replay_bits_uop_flush_on_commit(_mshrs_1_io_replay_bits_uop_flush_on_commit),
		.io_replay_bits_uop_csr_cmd(_mshrs_1_io_replay_bits_uop_csr_cmd),
		.io_replay_bits_uop_ldst_is_rs1(_mshrs_1_io_replay_bits_uop_ldst_is_rs1),
		.io_replay_bits_uop_ldst(_mshrs_1_io_replay_bits_uop_ldst),
		.io_replay_bits_uop_lrs1(_mshrs_1_io_replay_bits_uop_lrs1),
		.io_replay_bits_uop_lrs2(_mshrs_1_io_replay_bits_uop_lrs2),
		.io_replay_bits_uop_lrs3(_mshrs_1_io_replay_bits_uop_lrs3),
		.io_replay_bits_uop_dst_rtype(_mshrs_1_io_replay_bits_uop_dst_rtype),
		.io_replay_bits_uop_lrs1_rtype(_mshrs_1_io_replay_bits_uop_lrs1_rtype),
		.io_replay_bits_uop_lrs2_rtype(_mshrs_1_io_replay_bits_uop_lrs2_rtype),
		.io_replay_bits_uop_frs3_en(_mshrs_1_io_replay_bits_uop_frs3_en),
		.io_replay_bits_uop_fcn_dw(_mshrs_1_io_replay_bits_uop_fcn_dw),
		.io_replay_bits_uop_fcn_op(_mshrs_1_io_replay_bits_uop_fcn_op),
		.io_replay_bits_uop_fp_val(_mshrs_1_io_replay_bits_uop_fp_val),
		.io_replay_bits_uop_fp_rm(_mshrs_1_io_replay_bits_uop_fp_rm),
		.io_replay_bits_uop_fp_typ(_mshrs_1_io_replay_bits_uop_fp_typ),
		.io_replay_bits_uop_xcpt_pf_if(_mshrs_1_io_replay_bits_uop_xcpt_pf_if),
		.io_replay_bits_uop_xcpt_ae_if(_mshrs_1_io_replay_bits_uop_xcpt_ae_if),
		.io_replay_bits_uop_xcpt_ma_if(_mshrs_1_io_replay_bits_uop_xcpt_ma_if),
		.io_replay_bits_uop_bp_debug_if(_mshrs_1_io_replay_bits_uop_bp_debug_if),
		.io_replay_bits_uop_bp_xcpt_if(_mshrs_1_io_replay_bits_uop_bp_xcpt_if),
		.io_replay_bits_uop_debug_fsrc(_mshrs_1_io_replay_bits_uop_debug_fsrc),
		.io_replay_bits_uop_debug_tsrc(_mshrs_1_io_replay_bits_uop_debug_tsrc),
		.io_replay_bits_addr(_mshrs_1_io_replay_bits_addr),
		.io_replay_bits_is_hella(_mshrs_1_io_replay_bits_is_hella),
		.io_replay_bits_way_en(_mshrs_1_io_replay_bits_way_en),
		.io_replay_bits_sdq_id(_mshrs_1_io_replay_bits_sdq_id),
		.io_resp_ready(_resp_arb_io_in_1_ready),
		.io_resp_valid(_mshrs_1_io_resp_valid),
		.io_resp_bits_uop_inst(_mshrs_1_io_resp_bits_uop_inst),
		.io_resp_bits_uop_debug_inst(_mshrs_1_io_resp_bits_uop_debug_inst),
		.io_resp_bits_uop_is_rvc(_mshrs_1_io_resp_bits_uop_is_rvc),
		.io_resp_bits_uop_debug_pc(_mshrs_1_io_resp_bits_uop_debug_pc),
		.io_resp_bits_uop_iq_type_0(_mshrs_1_io_resp_bits_uop_iq_type_0),
		.io_resp_bits_uop_iq_type_1(_mshrs_1_io_resp_bits_uop_iq_type_1),
		.io_resp_bits_uop_iq_type_2(_mshrs_1_io_resp_bits_uop_iq_type_2),
		.io_resp_bits_uop_iq_type_3(_mshrs_1_io_resp_bits_uop_iq_type_3),
		.io_resp_bits_uop_fu_code_0(_mshrs_1_io_resp_bits_uop_fu_code_0),
		.io_resp_bits_uop_fu_code_1(_mshrs_1_io_resp_bits_uop_fu_code_1),
		.io_resp_bits_uop_fu_code_2(_mshrs_1_io_resp_bits_uop_fu_code_2),
		.io_resp_bits_uop_fu_code_3(_mshrs_1_io_resp_bits_uop_fu_code_3),
		.io_resp_bits_uop_fu_code_4(_mshrs_1_io_resp_bits_uop_fu_code_4),
		.io_resp_bits_uop_fu_code_5(_mshrs_1_io_resp_bits_uop_fu_code_5),
		.io_resp_bits_uop_fu_code_6(_mshrs_1_io_resp_bits_uop_fu_code_6),
		.io_resp_bits_uop_fu_code_7(_mshrs_1_io_resp_bits_uop_fu_code_7),
		.io_resp_bits_uop_fu_code_8(_mshrs_1_io_resp_bits_uop_fu_code_8),
		.io_resp_bits_uop_fu_code_9(_mshrs_1_io_resp_bits_uop_fu_code_9),
		.io_resp_bits_uop_iw_issued(_mshrs_1_io_resp_bits_uop_iw_issued),
		.io_resp_bits_uop_iw_issued_partial_agen(_mshrs_1_io_resp_bits_uop_iw_issued_partial_agen),
		.io_resp_bits_uop_iw_issued_partial_dgen(_mshrs_1_io_resp_bits_uop_iw_issued_partial_dgen),
		.io_resp_bits_uop_iw_p1_speculative_child(_mshrs_1_io_resp_bits_uop_iw_p1_speculative_child),
		.io_resp_bits_uop_iw_p2_speculative_child(_mshrs_1_io_resp_bits_uop_iw_p2_speculative_child),
		.io_resp_bits_uop_iw_p1_bypass_hint(_mshrs_1_io_resp_bits_uop_iw_p1_bypass_hint),
		.io_resp_bits_uop_iw_p2_bypass_hint(_mshrs_1_io_resp_bits_uop_iw_p2_bypass_hint),
		.io_resp_bits_uop_iw_p3_bypass_hint(_mshrs_1_io_resp_bits_uop_iw_p3_bypass_hint),
		.io_resp_bits_uop_dis_col_sel(_mshrs_1_io_resp_bits_uop_dis_col_sel),
		.io_resp_bits_uop_br_mask(_mshrs_1_io_resp_bits_uop_br_mask),
		.io_resp_bits_uop_br_tag(_mshrs_1_io_resp_bits_uop_br_tag),
		.io_resp_bits_uop_br_type(_mshrs_1_io_resp_bits_uop_br_type),
		.io_resp_bits_uop_is_sfb(_mshrs_1_io_resp_bits_uop_is_sfb),
		.io_resp_bits_uop_is_fence(_mshrs_1_io_resp_bits_uop_is_fence),
		.io_resp_bits_uop_is_fencei(_mshrs_1_io_resp_bits_uop_is_fencei),
		.io_resp_bits_uop_is_sfence(_mshrs_1_io_resp_bits_uop_is_sfence),
		.io_resp_bits_uop_is_amo(_mshrs_1_io_resp_bits_uop_is_amo),
		.io_resp_bits_uop_is_eret(_mshrs_1_io_resp_bits_uop_is_eret),
		.io_resp_bits_uop_is_sys_pc2epc(_mshrs_1_io_resp_bits_uop_is_sys_pc2epc),
		.io_resp_bits_uop_is_rocc(_mshrs_1_io_resp_bits_uop_is_rocc),
		.io_resp_bits_uop_is_mov(_mshrs_1_io_resp_bits_uop_is_mov),
		.io_resp_bits_uop_ftq_idx(_mshrs_1_io_resp_bits_uop_ftq_idx),
		.io_resp_bits_uop_edge_inst(_mshrs_1_io_resp_bits_uop_edge_inst),
		.io_resp_bits_uop_pc_lob(_mshrs_1_io_resp_bits_uop_pc_lob),
		.io_resp_bits_uop_taken(_mshrs_1_io_resp_bits_uop_taken),
		.io_resp_bits_uop_imm_rename(_mshrs_1_io_resp_bits_uop_imm_rename),
		.io_resp_bits_uop_imm_sel(_mshrs_1_io_resp_bits_uop_imm_sel),
		.io_resp_bits_uop_pimm(_mshrs_1_io_resp_bits_uop_pimm),
		.io_resp_bits_uop_imm_packed(_mshrs_1_io_resp_bits_uop_imm_packed),
		.io_resp_bits_uop_op1_sel(_mshrs_1_io_resp_bits_uop_op1_sel),
		.io_resp_bits_uop_op2_sel(_mshrs_1_io_resp_bits_uop_op2_sel),
		.io_resp_bits_uop_fp_ctrl_ldst(_mshrs_1_io_resp_bits_uop_fp_ctrl_ldst),
		.io_resp_bits_uop_fp_ctrl_wen(_mshrs_1_io_resp_bits_uop_fp_ctrl_wen),
		.io_resp_bits_uop_fp_ctrl_ren1(_mshrs_1_io_resp_bits_uop_fp_ctrl_ren1),
		.io_resp_bits_uop_fp_ctrl_ren2(_mshrs_1_io_resp_bits_uop_fp_ctrl_ren2),
		.io_resp_bits_uop_fp_ctrl_ren3(_mshrs_1_io_resp_bits_uop_fp_ctrl_ren3),
		.io_resp_bits_uop_fp_ctrl_swap12(_mshrs_1_io_resp_bits_uop_fp_ctrl_swap12),
		.io_resp_bits_uop_fp_ctrl_swap23(_mshrs_1_io_resp_bits_uop_fp_ctrl_swap23),
		.io_resp_bits_uop_fp_ctrl_typeTagIn(_mshrs_1_io_resp_bits_uop_fp_ctrl_typeTagIn),
		.io_resp_bits_uop_fp_ctrl_typeTagOut(_mshrs_1_io_resp_bits_uop_fp_ctrl_typeTagOut),
		.io_resp_bits_uop_fp_ctrl_fromint(_mshrs_1_io_resp_bits_uop_fp_ctrl_fromint),
		.io_resp_bits_uop_fp_ctrl_toint(_mshrs_1_io_resp_bits_uop_fp_ctrl_toint),
		.io_resp_bits_uop_fp_ctrl_fastpipe(_mshrs_1_io_resp_bits_uop_fp_ctrl_fastpipe),
		.io_resp_bits_uop_fp_ctrl_fma(_mshrs_1_io_resp_bits_uop_fp_ctrl_fma),
		.io_resp_bits_uop_fp_ctrl_div(_mshrs_1_io_resp_bits_uop_fp_ctrl_div),
		.io_resp_bits_uop_fp_ctrl_sqrt(_mshrs_1_io_resp_bits_uop_fp_ctrl_sqrt),
		.io_resp_bits_uop_fp_ctrl_wflags(_mshrs_1_io_resp_bits_uop_fp_ctrl_wflags),
		.io_resp_bits_uop_fp_ctrl_vec(_mshrs_1_io_resp_bits_uop_fp_ctrl_vec),
		.io_resp_bits_uop_rob_idx(_mshrs_1_io_resp_bits_uop_rob_idx),
		.io_resp_bits_uop_ldq_idx(_mshrs_1_io_resp_bits_uop_ldq_idx),
		.io_resp_bits_uop_stq_idx(_mshrs_1_io_resp_bits_uop_stq_idx),
		.io_resp_bits_uop_rxq_idx(_mshrs_1_io_resp_bits_uop_rxq_idx),
		.io_resp_bits_uop_pdst(_mshrs_1_io_resp_bits_uop_pdst),
		.io_resp_bits_uop_prs1(_mshrs_1_io_resp_bits_uop_prs1),
		.io_resp_bits_uop_prs2(_mshrs_1_io_resp_bits_uop_prs2),
		.io_resp_bits_uop_prs3(_mshrs_1_io_resp_bits_uop_prs3),
		.io_resp_bits_uop_ppred(_mshrs_1_io_resp_bits_uop_ppred),
		.io_resp_bits_uop_prs1_busy(_mshrs_1_io_resp_bits_uop_prs1_busy),
		.io_resp_bits_uop_prs2_busy(_mshrs_1_io_resp_bits_uop_prs2_busy),
		.io_resp_bits_uop_prs3_busy(_mshrs_1_io_resp_bits_uop_prs3_busy),
		.io_resp_bits_uop_ppred_busy(_mshrs_1_io_resp_bits_uop_ppred_busy),
		.io_resp_bits_uop_stale_pdst(_mshrs_1_io_resp_bits_uop_stale_pdst),
		.io_resp_bits_uop_exception(_mshrs_1_io_resp_bits_uop_exception),
		.io_resp_bits_uop_exc_cause(_mshrs_1_io_resp_bits_uop_exc_cause),
		.io_resp_bits_uop_mem_cmd(_mshrs_1_io_resp_bits_uop_mem_cmd),
		.io_resp_bits_uop_mem_size(_mshrs_1_io_resp_bits_uop_mem_size),
		.io_resp_bits_uop_mem_signed(_mshrs_1_io_resp_bits_uop_mem_signed),
		.io_resp_bits_uop_uses_ldq(_mshrs_1_io_resp_bits_uop_uses_ldq),
		.io_resp_bits_uop_uses_stq(_mshrs_1_io_resp_bits_uop_uses_stq),
		.io_resp_bits_uop_is_unique(_mshrs_1_io_resp_bits_uop_is_unique),
		.io_resp_bits_uop_flush_on_commit(_mshrs_1_io_resp_bits_uop_flush_on_commit),
		.io_resp_bits_uop_csr_cmd(_mshrs_1_io_resp_bits_uop_csr_cmd),
		.io_resp_bits_uop_ldst_is_rs1(_mshrs_1_io_resp_bits_uop_ldst_is_rs1),
		.io_resp_bits_uop_ldst(_mshrs_1_io_resp_bits_uop_ldst),
		.io_resp_bits_uop_lrs1(_mshrs_1_io_resp_bits_uop_lrs1),
		.io_resp_bits_uop_lrs2(_mshrs_1_io_resp_bits_uop_lrs2),
		.io_resp_bits_uop_lrs3(_mshrs_1_io_resp_bits_uop_lrs3),
		.io_resp_bits_uop_dst_rtype(_mshrs_1_io_resp_bits_uop_dst_rtype),
		.io_resp_bits_uop_lrs1_rtype(_mshrs_1_io_resp_bits_uop_lrs1_rtype),
		.io_resp_bits_uop_lrs2_rtype(_mshrs_1_io_resp_bits_uop_lrs2_rtype),
		.io_resp_bits_uop_frs3_en(_mshrs_1_io_resp_bits_uop_frs3_en),
		.io_resp_bits_uop_fcn_dw(_mshrs_1_io_resp_bits_uop_fcn_dw),
		.io_resp_bits_uop_fcn_op(_mshrs_1_io_resp_bits_uop_fcn_op),
		.io_resp_bits_uop_fp_val(_mshrs_1_io_resp_bits_uop_fp_val),
		.io_resp_bits_uop_fp_rm(_mshrs_1_io_resp_bits_uop_fp_rm),
		.io_resp_bits_uop_fp_typ(_mshrs_1_io_resp_bits_uop_fp_typ),
		.io_resp_bits_uop_xcpt_pf_if(_mshrs_1_io_resp_bits_uop_xcpt_pf_if),
		.io_resp_bits_uop_xcpt_ae_if(_mshrs_1_io_resp_bits_uop_xcpt_ae_if),
		.io_resp_bits_uop_xcpt_ma_if(_mshrs_1_io_resp_bits_uop_xcpt_ma_if),
		.io_resp_bits_uop_bp_debug_if(_mshrs_1_io_resp_bits_uop_bp_debug_if),
		.io_resp_bits_uop_bp_xcpt_if(_mshrs_1_io_resp_bits_uop_bp_xcpt_if),
		.io_resp_bits_uop_debug_fsrc(_mshrs_1_io_resp_bits_uop_debug_fsrc),
		.io_resp_bits_uop_debug_tsrc(_mshrs_1_io_resp_bits_uop_debug_tsrc),
		.io_resp_bits_data(_mshrs_1_io_resp_bits_data),
		.io_resp_bits_is_hella(_mshrs_1_io_resp_bits_is_hella),
		.io_wb_resp(io_wb_resp),
		.io_probe_rdy(_mshrs_1_io_probe_rdy)
	);
	Arbiter1_Bool mmio_alloc_arb(
		.io_in_0_ready(_mmio_alloc_arb_io_in_0_ready),
		.io_out_ready(io_req_0_valid & ~io_req_0_bits_addr[31])
	);
	BoomIOMSHR mmios_0(
		.clock(clock),
		.reset(reset),
		.io_req_ready(_mmios_0_io_req_ready),
		.io_req_valid(_mmio_alloc_arb_io_in_0_ready),
		.io_req_bits_uop_inst(io_req_0_bits_uop_inst),
		.io_req_bits_uop_debug_inst(io_req_0_bits_uop_debug_inst),
		.io_req_bits_uop_is_rvc(io_req_0_bits_uop_is_rvc),
		.io_req_bits_uop_debug_pc(io_req_0_bits_uop_debug_pc),
		.io_req_bits_uop_iq_type_0(io_req_0_bits_uop_iq_type_0),
		.io_req_bits_uop_iq_type_1(io_req_0_bits_uop_iq_type_1),
		.io_req_bits_uop_iq_type_2(io_req_0_bits_uop_iq_type_2),
		.io_req_bits_uop_iq_type_3(io_req_0_bits_uop_iq_type_3),
		.io_req_bits_uop_fu_code_0(io_req_0_bits_uop_fu_code_0),
		.io_req_bits_uop_fu_code_1(io_req_0_bits_uop_fu_code_1),
		.io_req_bits_uop_fu_code_2(io_req_0_bits_uop_fu_code_2),
		.io_req_bits_uop_fu_code_3(io_req_0_bits_uop_fu_code_3),
		.io_req_bits_uop_fu_code_4(io_req_0_bits_uop_fu_code_4),
		.io_req_bits_uop_fu_code_5(io_req_0_bits_uop_fu_code_5),
		.io_req_bits_uop_fu_code_6(io_req_0_bits_uop_fu_code_6),
		.io_req_bits_uop_fu_code_7(io_req_0_bits_uop_fu_code_7),
		.io_req_bits_uop_fu_code_8(io_req_0_bits_uop_fu_code_8),
		.io_req_bits_uop_fu_code_9(io_req_0_bits_uop_fu_code_9),
		.io_req_bits_uop_iw_issued(io_req_0_bits_uop_iw_issued),
		.io_req_bits_uop_iw_issued_partial_agen(io_req_0_bits_uop_iw_issued_partial_agen),
		.io_req_bits_uop_iw_issued_partial_dgen(io_req_0_bits_uop_iw_issued_partial_dgen),
		.io_req_bits_uop_iw_p1_speculative_child(io_req_0_bits_uop_iw_p1_speculative_child),
		.io_req_bits_uop_iw_p2_speculative_child(io_req_0_bits_uop_iw_p2_speculative_child),
		.io_req_bits_uop_iw_p1_bypass_hint(io_req_0_bits_uop_iw_p1_bypass_hint),
		.io_req_bits_uop_iw_p2_bypass_hint(io_req_0_bits_uop_iw_p2_bypass_hint),
		.io_req_bits_uop_iw_p3_bypass_hint(io_req_0_bits_uop_iw_p3_bypass_hint),
		.io_req_bits_uop_dis_col_sel(io_req_0_bits_uop_dis_col_sel),
		.io_req_bits_uop_br_mask(io_req_0_bits_uop_br_mask),
		.io_req_bits_uop_br_tag(io_req_0_bits_uop_br_tag),
		.io_req_bits_uop_br_type(io_req_0_bits_uop_br_type),
		.io_req_bits_uop_is_sfb(io_req_0_bits_uop_is_sfb),
		.io_req_bits_uop_is_fence(io_req_0_bits_uop_is_fence),
		.io_req_bits_uop_is_fencei(io_req_0_bits_uop_is_fencei),
		.io_req_bits_uop_is_sfence(io_req_0_bits_uop_is_sfence),
		.io_req_bits_uop_is_amo(io_req_0_bits_uop_is_amo),
		.io_req_bits_uop_is_eret(io_req_0_bits_uop_is_eret),
		.io_req_bits_uop_is_sys_pc2epc(io_req_0_bits_uop_is_sys_pc2epc),
		.io_req_bits_uop_is_rocc(io_req_0_bits_uop_is_rocc),
		.io_req_bits_uop_is_mov(io_req_0_bits_uop_is_mov),
		.io_req_bits_uop_ftq_idx(io_req_0_bits_uop_ftq_idx),
		.io_req_bits_uop_edge_inst(io_req_0_bits_uop_edge_inst),
		.io_req_bits_uop_pc_lob(io_req_0_bits_uop_pc_lob),
		.io_req_bits_uop_taken(io_req_0_bits_uop_taken),
		.io_req_bits_uop_imm_rename(io_req_0_bits_uop_imm_rename),
		.io_req_bits_uop_imm_sel(io_req_0_bits_uop_imm_sel),
		.io_req_bits_uop_pimm(io_req_0_bits_uop_pimm),
		.io_req_bits_uop_imm_packed(io_req_0_bits_uop_imm_packed),
		.io_req_bits_uop_op1_sel(io_req_0_bits_uop_op1_sel),
		.io_req_bits_uop_op2_sel(io_req_0_bits_uop_op2_sel),
		.io_req_bits_uop_fp_ctrl_ldst(io_req_0_bits_uop_fp_ctrl_ldst),
		.io_req_bits_uop_fp_ctrl_wen(io_req_0_bits_uop_fp_ctrl_wen),
		.io_req_bits_uop_fp_ctrl_ren1(io_req_0_bits_uop_fp_ctrl_ren1),
		.io_req_bits_uop_fp_ctrl_ren2(io_req_0_bits_uop_fp_ctrl_ren2),
		.io_req_bits_uop_fp_ctrl_ren3(io_req_0_bits_uop_fp_ctrl_ren3),
		.io_req_bits_uop_fp_ctrl_swap12(io_req_0_bits_uop_fp_ctrl_swap12),
		.io_req_bits_uop_fp_ctrl_swap23(io_req_0_bits_uop_fp_ctrl_swap23),
		.io_req_bits_uop_fp_ctrl_typeTagIn(io_req_0_bits_uop_fp_ctrl_typeTagIn),
		.io_req_bits_uop_fp_ctrl_typeTagOut(io_req_0_bits_uop_fp_ctrl_typeTagOut),
		.io_req_bits_uop_fp_ctrl_fromint(io_req_0_bits_uop_fp_ctrl_fromint),
		.io_req_bits_uop_fp_ctrl_toint(io_req_0_bits_uop_fp_ctrl_toint),
		.io_req_bits_uop_fp_ctrl_fastpipe(io_req_0_bits_uop_fp_ctrl_fastpipe),
		.io_req_bits_uop_fp_ctrl_fma(io_req_0_bits_uop_fp_ctrl_fma),
		.io_req_bits_uop_fp_ctrl_div(io_req_0_bits_uop_fp_ctrl_div),
		.io_req_bits_uop_fp_ctrl_sqrt(io_req_0_bits_uop_fp_ctrl_sqrt),
		.io_req_bits_uop_fp_ctrl_wflags(io_req_0_bits_uop_fp_ctrl_wflags),
		.io_req_bits_uop_fp_ctrl_vec(io_req_0_bits_uop_fp_ctrl_vec),
		.io_req_bits_uop_rob_idx(io_req_0_bits_uop_rob_idx),
		.io_req_bits_uop_ldq_idx(io_req_0_bits_uop_ldq_idx),
		.io_req_bits_uop_stq_idx(io_req_0_bits_uop_stq_idx),
		.io_req_bits_uop_rxq_idx(io_req_0_bits_uop_rxq_idx),
		.io_req_bits_uop_pdst(io_req_0_bits_uop_pdst),
		.io_req_bits_uop_prs1(io_req_0_bits_uop_prs1),
		.io_req_bits_uop_prs2(io_req_0_bits_uop_prs2),
		.io_req_bits_uop_prs3(io_req_0_bits_uop_prs3),
		.io_req_bits_uop_ppred(io_req_0_bits_uop_ppred),
		.io_req_bits_uop_prs1_busy(io_req_0_bits_uop_prs1_busy),
		.io_req_bits_uop_prs2_busy(io_req_0_bits_uop_prs2_busy),
		.io_req_bits_uop_prs3_busy(io_req_0_bits_uop_prs3_busy),
		.io_req_bits_uop_ppred_busy(io_req_0_bits_uop_ppred_busy),
		.io_req_bits_uop_stale_pdst(io_req_0_bits_uop_stale_pdst),
		.io_req_bits_uop_exception(io_req_0_bits_uop_exception),
		.io_req_bits_uop_exc_cause(io_req_0_bits_uop_exc_cause),
		.io_req_bits_uop_mem_cmd(io_req_0_bits_uop_mem_cmd),
		.io_req_bits_uop_mem_size(io_req_0_bits_uop_mem_size),
		.io_req_bits_uop_mem_signed(io_req_0_bits_uop_mem_signed),
		.io_req_bits_uop_uses_ldq(io_req_0_bits_uop_uses_ldq),
		.io_req_bits_uop_uses_stq(io_req_0_bits_uop_uses_stq),
		.io_req_bits_uop_is_unique(io_req_0_bits_uop_is_unique),
		.io_req_bits_uop_flush_on_commit(io_req_0_bits_uop_flush_on_commit),
		.io_req_bits_uop_csr_cmd(io_req_0_bits_uop_csr_cmd),
		.io_req_bits_uop_ldst_is_rs1(io_req_0_bits_uop_ldst_is_rs1),
		.io_req_bits_uop_ldst(io_req_0_bits_uop_ldst),
		.io_req_bits_uop_lrs1(io_req_0_bits_uop_lrs1),
		.io_req_bits_uop_lrs2(io_req_0_bits_uop_lrs2),
		.io_req_bits_uop_lrs3(io_req_0_bits_uop_lrs3),
		.io_req_bits_uop_dst_rtype(io_req_0_bits_uop_dst_rtype),
		.io_req_bits_uop_lrs1_rtype(io_req_0_bits_uop_lrs1_rtype),
		.io_req_bits_uop_lrs2_rtype(io_req_0_bits_uop_lrs2_rtype),
		.io_req_bits_uop_frs3_en(io_req_0_bits_uop_frs3_en),
		.io_req_bits_uop_fcn_dw(io_req_0_bits_uop_fcn_dw),
		.io_req_bits_uop_fcn_op(io_req_0_bits_uop_fcn_op),
		.io_req_bits_uop_fp_val(io_req_0_bits_uop_fp_val),
		.io_req_bits_uop_fp_rm(io_req_0_bits_uop_fp_rm),
		.io_req_bits_uop_fp_typ(io_req_0_bits_uop_fp_typ),
		.io_req_bits_uop_xcpt_pf_if(io_req_0_bits_uop_xcpt_pf_if),
		.io_req_bits_uop_xcpt_ae_if(io_req_0_bits_uop_xcpt_ae_if),
		.io_req_bits_uop_xcpt_ma_if(io_req_0_bits_uop_xcpt_ma_if),
		.io_req_bits_uop_bp_debug_if(io_req_0_bits_uop_bp_debug_if),
		.io_req_bits_uop_bp_xcpt_if(io_req_0_bits_uop_bp_xcpt_if),
		.io_req_bits_uop_debug_fsrc(io_req_0_bits_uop_debug_fsrc),
		.io_req_bits_uop_debug_tsrc(io_req_0_bits_uop_debug_tsrc),
		.io_req_bits_addr(io_req_0_bits_addr),
		.io_req_bits_data(io_req_0_bits_data),
		.io_req_bits_is_hella(io_req_0_bits_is_hella),
		.io_resp_ready(_resp_arb_io_in_2_ready),
		.io_resp_valid(_mmios_0_io_resp_valid),
		.io_resp_bits_uop_inst(_mmios_0_io_resp_bits_uop_inst),
		.io_resp_bits_uop_debug_inst(_mmios_0_io_resp_bits_uop_debug_inst),
		.io_resp_bits_uop_is_rvc(_mmios_0_io_resp_bits_uop_is_rvc),
		.io_resp_bits_uop_debug_pc(_mmios_0_io_resp_bits_uop_debug_pc),
		.io_resp_bits_uop_iq_type_0(_mmios_0_io_resp_bits_uop_iq_type_0),
		.io_resp_bits_uop_iq_type_1(_mmios_0_io_resp_bits_uop_iq_type_1),
		.io_resp_bits_uop_iq_type_2(_mmios_0_io_resp_bits_uop_iq_type_2),
		.io_resp_bits_uop_iq_type_3(_mmios_0_io_resp_bits_uop_iq_type_3),
		.io_resp_bits_uop_fu_code_0(_mmios_0_io_resp_bits_uop_fu_code_0),
		.io_resp_bits_uop_fu_code_1(_mmios_0_io_resp_bits_uop_fu_code_1),
		.io_resp_bits_uop_fu_code_2(_mmios_0_io_resp_bits_uop_fu_code_2),
		.io_resp_bits_uop_fu_code_3(_mmios_0_io_resp_bits_uop_fu_code_3),
		.io_resp_bits_uop_fu_code_4(_mmios_0_io_resp_bits_uop_fu_code_4),
		.io_resp_bits_uop_fu_code_5(_mmios_0_io_resp_bits_uop_fu_code_5),
		.io_resp_bits_uop_fu_code_6(_mmios_0_io_resp_bits_uop_fu_code_6),
		.io_resp_bits_uop_fu_code_7(_mmios_0_io_resp_bits_uop_fu_code_7),
		.io_resp_bits_uop_fu_code_8(_mmios_0_io_resp_bits_uop_fu_code_8),
		.io_resp_bits_uop_fu_code_9(_mmios_0_io_resp_bits_uop_fu_code_9),
		.io_resp_bits_uop_iw_issued(_mmios_0_io_resp_bits_uop_iw_issued),
		.io_resp_bits_uop_iw_issued_partial_agen(_mmios_0_io_resp_bits_uop_iw_issued_partial_agen),
		.io_resp_bits_uop_iw_issued_partial_dgen(_mmios_0_io_resp_bits_uop_iw_issued_partial_dgen),
		.io_resp_bits_uop_iw_p1_speculative_child(_mmios_0_io_resp_bits_uop_iw_p1_speculative_child),
		.io_resp_bits_uop_iw_p2_speculative_child(_mmios_0_io_resp_bits_uop_iw_p2_speculative_child),
		.io_resp_bits_uop_iw_p1_bypass_hint(_mmios_0_io_resp_bits_uop_iw_p1_bypass_hint),
		.io_resp_bits_uop_iw_p2_bypass_hint(_mmios_0_io_resp_bits_uop_iw_p2_bypass_hint),
		.io_resp_bits_uop_iw_p3_bypass_hint(_mmios_0_io_resp_bits_uop_iw_p3_bypass_hint),
		.io_resp_bits_uop_dis_col_sel(_mmios_0_io_resp_bits_uop_dis_col_sel),
		.io_resp_bits_uop_br_mask(_mmios_0_io_resp_bits_uop_br_mask),
		.io_resp_bits_uop_br_tag(_mmios_0_io_resp_bits_uop_br_tag),
		.io_resp_bits_uop_br_type(_mmios_0_io_resp_bits_uop_br_type),
		.io_resp_bits_uop_is_sfb(_mmios_0_io_resp_bits_uop_is_sfb),
		.io_resp_bits_uop_is_fence(_mmios_0_io_resp_bits_uop_is_fence),
		.io_resp_bits_uop_is_fencei(_mmios_0_io_resp_bits_uop_is_fencei),
		.io_resp_bits_uop_is_sfence(_mmios_0_io_resp_bits_uop_is_sfence),
		.io_resp_bits_uop_is_amo(_mmios_0_io_resp_bits_uop_is_amo),
		.io_resp_bits_uop_is_eret(_mmios_0_io_resp_bits_uop_is_eret),
		.io_resp_bits_uop_is_sys_pc2epc(_mmios_0_io_resp_bits_uop_is_sys_pc2epc),
		.io_resp_bits_uop_is_rocc(_mmios_0_io_resp_bits_uop_is_rocc),
		.io_resp_bits_uop_is_mov(_mmios_0_io_resp_bits_uop_is_mov),
		.io_resp_bits_uop_ftq_idx(_mmios_0_io_resp_bits_uop_ftq_idx),
		.io_resp_bits_uop_edge_inst(_mmios_0_io_resp_bits_uop_edge_inst),
		.io_resp_bits_uop_pc_lob(_mmios_0_io_resp_bits_uop_pc_lob),
		.io_resp_bits_uop_taken(_mmios_0_io_resp_bits_uop_taken),
		.io_resp_bits_uop_imm_rename(_mmios_0_io_resp_bits_uop_imm_rename),
		.io_resp_bits_uop_imm_sel(_mmios_0_io_resp_bits_uop_imm_sel),
		.io_resp_bits_uop_pimm(_mmios_0_io_resp_bits_uop_pimm),
		.io_resp_bits_uop_imm_packed(_mmios_0_io_resp_bits_uop_imm_packed),
		.io_resp_bits_uop_op1_sel(_mmios_0_io_resp_bits_uop_op1_sel),
		.io_resp_bits_uop_op2_sel(_mmios_0_io_resp_bits_uop_op2_sel),
		.io_resp_bits_uop_fp_ctrl_ldst(_mmios_0_io_resp_bits_uop_fp_ctrl_ldst),
		.io_resp_bits_uop_fp_ctrl_wen(_mmios_0_io_resp_bits_uop_fp_ctrl_wen),
		.io_resp_bits_uop_fp_ctrl_ren1(_mmios_0_io_resp_bits_uop_fp_ctrl_ren1),
		.io_resp_bits_uop_fp_ctrl_ren2(_mmios_0_io_resp_bits_uop_fp_ctrl_ren2),
		.io_resp_bits_uop_fp_ctrl_ren3(_mmios_0_io_resp_bits_uop_fp_ctrl_ren3),
		.io_resp_bits_uop_fp_ctrl_swap12(_mmios_0_io_resp_bits_uop_fp_ctrl_swap12),
		.io_resp_bits_uop_fp_ctrl_swap23(_mmios_0_io_resp_bits_uop_fp_ctrl_swap23),
		.io_resp_bits_uop_fp_ctrl_typeTagIn(_mmios_0_io_resp_bits_uop_fp_ctrl_typeTagIn),
		.io_resp_bits_uop_fp_ctrl_typeTagOut(_mmios_0_io_resp_bits_uop_fp_ctrl_typeTagOut),
		.io_resp_bits_uop_fp_ctrl_fromint(_mmios_0_io_resp_bits_uop_fp_ctrl_fromint),
		.io_resp_bits_uop_fp_ctrl_toint(_mmios_0_io_resp_bits_uop_fp_ctrl_toint),
		.io_resp_bits_uop_fp_ctrl_fastpipe(_mmios_0_io_resp_bits_uop_fp_ctrl_fastpipe),
		.io_resp_bits_uop_fp_ctrl_fma(_mmios_0_io_resp_bits_uop_fp_ctrl_fma),
		.io_resp_bits_uop_fp_ctrl_div(_mmios_0_io_resp_bits_uop_fp_ctrl_div),
		.io_resp_bits_uop_fp_ctrl_sqrt(_mmios_0_io_resp_bits_uop_fp_ctrl_sqrt),
		.io_resp_bits_uop_fp_ctrl_wflags(_mmios_0_io_resp_bits_uop_fp_ctrl_wflags),
		.io_resp_bits_uop_fp_ctrl_vec(_mmios_0_io_resp_bits_uop_fp_ctrl_vec),
		.io_resp_bits_uop_rob_idx(_mmios_0_io_resp_bits_uop_rob_idx),
		.io_resp_bits_uop_ldq_idx(_mmios_0_io_resp_bits_uop_ldq_idx),
		.io_resp_bits_uop_stq_idx(_mmios_0_io_resp_bits_uop_stq_idx),
		.io_resp_bits_uop_rxq_idx(_mmios_0_io_resp_bits_uop_rxq_idx),
		.io_resp_bits_uop_pdst(_mmios_0_io_resp_bits_uop_pdst),
		.io_resp_bits_uop_prs1(_mmios_0_io_resp_bits_uop_prs1),
		.io_resp_bits_uop_prs2(_mmios_0_io_resp_bits_uop_prs2),
		.io_resp_bits_uop_prs3(_mmios_0_io_resp_bits_uop_prs3),
		.io_resp_bits_uop_ppred(_mmios_0_io_resp_bits_uop_ppred),
		.io_resp_bits_uop_prs1_busy(_mmios_0_io_resp_bits_uop_prs1_busy),
		.io_resp_bits_uop_prs2_busy(_mmios_0_io_resp_bits_uop_prs2_busy),
		.io_resp_bits_uop_prs3_busy(_mmios_0_io_resp_bits_uop_prs3_busy),
		.io_resp_bits_uop_ppred_busy(_mmios_0_io_resp_bits_uop_ppred_busy),
		.io_resp_bits_uop_stale_pdst(_mmios_0_io_resp_bits_uop_stale_pdst),
		.io_resp_bits_uop_exception(_mmios_0_io_resp_bits_uop_exception),
		.io_resp_bits_uop_exc_cause(_mmios_0_io_resp_bits_uop_exc_cause),
		.io_resp_bits_uop_mem_cmd(_mmios_0_io_resp_bits_uop_mem_cmd),
		.io_resp_bits_uop_mem_size(_mmios_0_io_resp_bits_uop_mem_size),
		.io_resp_bits_uop_mem_signed(_mmios_0_io_resp_bits_uop_mem_signed),
		.io_resp_bits_uop_uses_ldq(_mmios_0_io_resp_bits_uop_uses_ldq),
		.io_resp_bits_uop_uses_stq(_mmios_0_io_resp_bits_uop_uses_stq),
		.io_resp_bits_uop_is_unique(_mmios_0_io_resp_bits_uop_is_unique),
		.io_resp_bits_uop_flush_on_commit(_mmios_0_io_resp_bits_uop_flush_on_commit),
		.io_resp_bits_uop_csr_cmd(_mmios_0_io_resp_bits_uop_csr_cmd),
		.io_resp_bits_uop_ldst_is_rs1(_mmios_0_io_resp_bits_uop_ldst_is_rs1),
		.io_resp_bits_uop_ldst(_mmios_0_io_resp_bits_uop_ldst),
		.io_resp_bits_uop_lrs1(_mmios_0_io_resp_bits_uop_lrs1),
		.io_resp_bits_uop_lrs2(_mmios_0_io_resp_bits_uop_lrs2),
		.io_resp_bits_uop_lrs3(_mmios_0_io_resp_bits_uop_lrs3),
		.io_resp_bits_uop_dst_rtype(_mmios_0_io_resp_bits_uop_dst_rtype),
		.io_resp_bits_uop_lrs1_rtype(_mmios_0_io_resp_bits_uop_lrs1_rtype),
		.io_resp_bits_uop_lrs2_rtype(_mmios_0_io_resp_bits_uop_lrs2_rtype),
		.io_resp_bits_uop_frs3_en(_mmios_0_io_resp_bits_uop_frs3_en),
		.io_resp_bits_uop_fcn_dw(_mmios_0_io_resp_bits_uop_fcn_dw),
		.io_resp_bits_uop_fcn_op(_mmios_0_io_resp_bits_uop_fcn_op),
		.io_resp_bits_uop_fp_val(_mmios_0_io_resp_bits_uop_fp_val),
		.io_resp_bits_uop_fp_rm(_mmios_0_io_resp_bits_uop_fp_rm),
		.io_resp_bits_uop_fp_typ(_mmios_0_io_resp_bits_uop_fp_typ),
		.io_resp_bits_uop_xcpt_pf_if(_mmios_0_io_resp_bits_uop_xcpt_pf_if),
		.io_resp_bits_uop_xcpt_ae_if(_mmios_0_io_resp_bits_uop_xcpt_ae_if),
		.io_resp_bits_uop_xcpt_ma_if(_mmios_0_io_resp_bits_uop_xcpt_ma_if),
		.io_resp_bits_uop_bp_debug_if(_mmios_0_io_resp_bits_uop_bp_debug_if),
		.io_resp_bits_uop_bp_xcpt_if(_mmios_0_io_resp_bits_uop_bp_xcpt_if),
		.io_resp_bits_uop_debug_fsrc(_mmios_0_io_resp_bits_uop_debug_fsrc),
		.io_resp_bits_uop_debug_tsrc(_mmios_0_io_resp_bits_uop_debug_tsrc),
		.io_resp_bits_data(_mmios_0_io_resp_bits_data),
		.io_resp_bits_is_hella(_mmios_0_io_resp_bits_is_hella),
		.io_mem_access_ready(io_mem_acquire_ready & (idle ? ~_GEN_3 : state_2)),
		.io_mem_access_valid(_mmios_0_io_mem_access_valid),
		.io_mem_access_bits_opcode(_mmios_0_io_mem_access_bits_opcode),
		.io_mem_access_bits_param(_mmios_0_io_mem_access_bits_param),
		.io_mem_access_bits_size(_mmios_0_io_mem_access_bits_size),
		.io_mem_access_bits_source(_mmios_0_io_mem_access_bits_source),
		.io_mem_access_bits_address(_mmios_0_io_mem_access_bits_address),
		.io_mem_access_bits_mask(_mmios_0_io_mem_access_bits_mask),
		.io_mem_access_bits_data(_mmios_0_io_mem_access_bits_data),
		.io_mem_ack_valid(io_mem_grant_valid & (&io_mem_grant_bits_source)),
		.io_mem_ack_bits_data(io_mem_grant_bits_data)
	);
	BranchKillableQueue_4 respq(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_respq_io_enq_ready),
		.io_enq_valid(_resp_arb_io_out_valid),
		.io_enq_bits_uop_inst(_resp_arb_io_out_bits_uop_inst),
		.io_enq_bits_uop_debug_inst(_resp_arb_io_out_bits_uop_debug_inst),
		.io_enq_bits_uop_is_rvc(_resp_arb_io_out_bits_uop_is_rvc),
		.io_enq_bits_uop_debug_pc(_resp_arb_io_out_bits_uop_debug_pc),
		.io_enq_bits_uop_iq_type_0(_resp_arb_io_out_bits_uop_iq_type_0),
		.io_enq_bits_uop_iq_type_1(_resp_arb_io_out_bits_uop_iq_type_1),
		.io_enq_bits_uop_iq_type_2(_resp_arb_io_out_bits_uop_iq_type_2),
		.io_enq_bits_uop_iq_type_3(_resp_arb_io_out_bits_uop_iq_type_3),
		.io_enq_bits_uop_fu_code_0(_resp_arb_io_out_bits_uop_fu_code_0),
		.io_enq_bits_uop_fu_code_1(_resp_arb_io_out_bits_uop_fu_code_1),
		.io_enq_bits_uop_fu_code_2(_resp_arb_io_out_bits_uop_fu_code_2),
		.io_enq_bits_uop_fu_code_3(_resp_arb_io_out_bits_uop_fu_code_3),
		.io_enq_bits_uop_fu_code_4(_resp_arb_io_out_bits_uop_fu_code_4),
		.io_enq_bits_uop_fu_code_5(_resp_arb_io_out_bits_uop_fu_code_5),
		.io_enq_bits_uop_fu_code_6(_resp_arb_io_out_bits_uop_fu_code_6),
		.io_enq_bits_uop_fu_code_7(_resp_arb_io_out_bits_uop_fu_code_7),
		.io_enq_bits_uop_fu_code_8(_resp_arb_io_out_bits_uop_fu_code_8),
		.io_enq_bits_uop_fu_code_9(_resp_arb_io_out_bits_uop_fu_code_9),
		.io_enq_bits_uop_iw_issued(_resp_arb_io_out_bits_uop_iw_issued),
		.io_enq_bits_uop_iw_issued_partial_agen(_resp_arb_io_out_bits_uop_iw_issued_partial_agen),
		.io_enq_bits_uop_iw_issued_partial_dgen(_resp_arb_io_out_bits_uop_iw_issued_partial_dgen),
		.io_enq_bits_uop_iw_p1_speculative_child(_resp_arb_io_out_bits_uop_iw_p1_speculative_child),
		.io_enq_bits_uop_iw_p2_speculative_child(_resp_arb_io_out_bits_uop_iw_p2_speculative_child),
		.io_enq_bits_uop_iw_p1_bypass_hint(_resp_arb_io_out_bits_uop_iw_p1_bypass_hint),
		.io_enq_bits_uop_iw_p2_bypass_hint(_resp_arb_io_out_bits_uop_iw_p2_bypass_hint),
		.io_enq_bits_uop_iw_p3_bypass_hint(_resp_arb_io_out_bits_uop_iw_p3_bypass_hint),
		.io_enq_bits_uop_dis_col_sel(_resp_arb_io_out_bits_uop_dis_col_sel),
		.io_enq_bits_uop_br_mask(_resp_arb_io_out_bits_uop_br_mask),
		.io_enq_bits_uop_br_tag(_resp_arb_io_out_bits_uop_br_tag),
		.io_enq_bits_uop_br_type(_resp_arb_io_out_bits_uop_br_type),
		.io_enq_bits_uop_is_sfb(_resp_arb_io_out_bits_uop_is_sfb),
		.io_enq_bits_uop_is_fence(_resp_arb_io_out_bits_uop_is_fence),
		.io_enq_bits_uop_is_fencei(_resp_arb_io_out_bits_uop_is_fencei),
		.io_enq_bits_uop_is_sfence(_resp_arb_io_out_bits_uop_is_sfence),
		.io_enq_bits_uop_is_amo(_resp_arb_io_out_bits_uop_is_amo),
		.io_enq_bits_uop_is_eret(_resp_arb_io_out_bits_uop_is_eret),
		.io_enq_bits_uop_is_sys_pc2epc(_resp_arb_io_out_bits_uop_is_sys_pc2epc),
		.io_enq_bits_uop_is_rocc(_resp_arb_io_out_bits_uop_is_rocc),
		.io_enq_bits_uop_is_mov(_resp_arb_io_out_bits_uop_is_mov),
		.io_enq_bits_uop_ftq_idx(_resp_arb_io_out_bits_uop_ftq_idx),
		.io_enq_bits_uop_edge_inst(_resp_arb_io_out_bits_uop_edge_inst),
		.io_enq_bits_uop_pc_lob(_resp_arb_io_out_bits_uop_pc_lob),
		.io_enq_bits_uop_taken(_resp_arb_io_out_bits_uop_taken),
		.io_enq_bits_uop_imm_rename(_resp_arb_io_out_bits_uop_imm_rename),
		.io_enq_bits_uop_imm_sel(_resp_arb_io_out_bits_uop_imm_sel),
		.io_enq_bits_uop_pimm(_resp_arb_io_out_bits_uop_pimm),
		.io_enq_bits_uop_imm_packed(_resp_arb_io_out_bits_uop_imm_packed),
		.io_enq_bits_uop_op1_sel(_resp_arb_io_out_bits_uop_op1_sel),
		.io_enq_bits_uop_op2_sel(_resp_arb_io_out_bits_uop_op2_sel),
		.io_enq_bits_uop_fp_ctrl_ldst(_resp_arb_io_out_bits_uop_fp_ctrl_ldst),
		.io_enq_bits_uop_fp_ctrl_wen(_resp_arb_io_out_bits_uop_fp_ctrl_wen),
		.io_enq_bits_uop_fp_ctrl_ren1(_resp_arb_io_out_bits_uop_fp_ctrl_ren1),
		.io_enq_bits_uop_fp_ctrl_ren2(_resp_arb_io_out_bits_uop_fp_ctrl_ren2),
		.io_enq_bits_uop_fp_ctrl_ren3(_resp_arb_io_out_bits_uop_fp_ctrl_ren3),
		.io_enq_bits_uop_fp_ctrl_swap12(_resp_arb_io_out_bits_uop_fp_ctrl_swap12),
		.io_enq_bits_uop_fp_ctrl_swap23(_resp_arb_io_out_bits_uop_fp_ctrl_swap23),
		.io_enq_bits_uop_fp_ctrl_typeTagIn(_resp_arb_io_out_bits_uop_fp_ctrl_typeTagIn),
		.io_enq_bits_uop_fp_ctrl_typeTagOut(_resp_arb_io_out_bits_uop_fp_ctrl_typeTagOut),
		.io_enq_bits_uop_fp_ctrl_fromint(_resp_arb_io_out_bits_uop_fp_ctrl_fromint),
		.io_enq_bits_uop_fp_ctrl_toint(_resp_arb_io_out_bits_uop_fp_ctrl_toint),
		.io_enq_bits_uop_fp_ctrl_fastpipe(_resp_arb_io_out_bits_uop_fp_ctrl_fastpipe),
		.io_enq_bits_uop_fp_ctrl_fma(_resp_arb_io_out_bits_uop_fp_ctrl_fma),
		.io_enq_bits_uop_fp_ctrl_div(_resp_arb_io_out_bits_uop_fp_ctrl_div),
		.io_enq_bits_uop_fp_ctrl_sqrt(_resp_arb_io_out_bits_uop_fp_ctrl_sqrt),
		.io_enq_bits_uop_fp_ctrl_wflags(_resp_arb_io_out_bits_uop_fp_ctrl_wflags),
		.io_enq_bits_uop_fp_ctrl_vec(_resp_arb_io_out_bits_uop_fp_ctrl_vec),
		.io_enq_bits_uop_rob_idx(_resp_arb_io_out_bits_uop_rob_idx),
		.io_enq_bits_uop_ldq_idx(_resp_arb_io_out_bits_uop_ldq_idx),
		.io_enq_bits_uop_stq_idx(_resp_arb_io_out_bits_uop_stq_idx),
		.io_enq_bits_uop_rxq_idx(_resp_arb_io_out_bits_uop_rxq_idx),
		.io_enq_bits_uop_pdst(_resp_arb_io_out_bits_uop_pdst),
		.io_enq_bits_uop_prs1(_resp_arb_io_out_bits_uop_prs1),
		.io_enq_bits_uop_prs2(_resp_arb_io_out_bits_uop_prs2),
		.io_enq_bits_uop_prs3(_resp_arb_io_out_bits_uop_prs3),
		.io_enq_bits_uop_ppred(_resp_arb_io_out_bits_uop_ppred),
		.io_enq_bits_uop_prs1_busy(_resp_arb_io_out_bits_uop_prs1_busy),
		.io_enq_bits_uop_prs2_busy(_resp_arb_io_out_bits_uop_prs2_busy),
		.io_enq_bits_uop_prs3_busy(_resp_arb_io_out_bits_uop_prs3_busy),
		.io_enq_bits_uop_ppred_busy(_resp_arb_io_out_bits_uop_ppred_busy),
		.io_enq_bits_uop_stale_pdst(_resp_arb_io_out_bits_uop_stale_pdst),
		.io_enq_bits_uop_exception(_resp_arb_io_out_bits_uop_exception),
		.io_enq_bits_uop_exc_cause(_resp_arb_io_out_bits_uop_exc_cause),
		.io_enq_bits_uop_mem_cmd(_resp_arb_io_out_bits_uop_mem_cmd),
		.io_enq_bits_uop_mem_size(_resp_arb_io_out_bits_uop_mem_size),
		.io_enq_bits_uop_mem_signed(_resp_arb_io_out_bits_uop_mem_signed),
		.io_enq_bits_uop_uses_ldq(_resp_arb_io_out_bits_uop_uses_ldq),
		.io_enq_bits_uop_uses_stq(_resp_arb_io_out_bits_uop_uses_stq),
		.io_enq_bits_uop_is_unique(_resp_arb_io_out_bits_uop_is_unique),
		.io_enq_bits_uop_flush_on_commit(_resp_arb_io_out_bits_uop_flush_on_commit),
		.io_enq_bits_uop_csr_cmd(_resp_arb_io_out_bits_uop_csr_cmd),
		.io_enq_bits_uop_ldst_is_rs1(_resp_arb_io_out_bits_uop_ldst_is_rs1),
		.io_enq_bits_uop_ldst(_resp_arb_io_out_bits_uop_ldst),
		.io_enq_bits_uop_lrs1(_resp_arb_io_out_bits_uop_lrs1),
		.io_enq_bits_uop_lrs2(_resp_arb_io_out_bits_uop_lrs2),
		.io_enq_bits_uop_lrs3(_resp_arb_io_out_bits_uop_lrs3),
		.io_enq_bits_uop_dst_rtype(_resp_arb_io_out_bits_uop_dst_rtype),
		.io_enq_bits_uop_lrs1_rtype(_resp_arb_io_out_bits_uop_lrs1_rtype),
		.io_enq_bits_uop_lrs2_rtype(_resp_arb_io_out_bits_uop_lrs2_rtype),
		.io_enq_bits_uop_frs3_en(_resp_arb_io_out_bits_uop_frs3_en),
		.io_enq_bits_uop_fcn_dw(_resp_arb_io_out_bits_uop_fcn_dw),
		.io_enq_bits_uop_fcn_op(_resp_arb_io_out_bits_uop_fcn_op),
		.io_enq_bits_uop_fp_val(_resp_arb_io_out_bits_uop_fp_val),
		.io_enq_bits_uop_fp_rm(_resp_arb_io_out_bits_uop_fp_rm),
		.io_enq_bits_uop_fp_typ(_resp_arb_io_out_bits_uop_fp_typ),
		.io_enq_bits_uop_xcpt_pf_if(_resp_arb_io_out_bits_uop_xcpt_pf_if),
		.io_enq_bits_uop_xcpt_ae_if(_resp_arb_io_out_bits_uop_xcpt_ae_if),
		.io_enq_bits_uop_xcpt_ma_if(_resp_arb_io_out_bits_uop_xcpt_ma_if),
		.io_enq_bits_uop_bp_debug_if(_resp_arb_io_out_bits_uop_bp_debug_if),
		.io_enq_bits_uop_bp_xcpt_if(_resp_arb_io_out_bits_uop_bp_xcpt_if),
		.io_enq_bits_uop_debug_fsrc(_resp_arb_io_out_bits_uop_debug_fsrc),
		.io_enq_bits_uop_debug_tsrc(_resp_arb_io_out_bits_uop_debug_tsrc),
		.io_enq_bits_data(_resp_arb_io_out_bits_data),
		.io_enq_bits_is_hella(_resp_arb_io_out_bits_is_hella),
		.io_deq_ready(io_resp_ready),
		.io_deq_valid(io_resp_valid),
		.io_deq_bits_uop_is_amo(io_resp_bits_uop_is_amo),
		.io_deq_bits_uop_ldq_idx(io_resp_bits_uop_ldq_idx),
		.io_deq_bits_uop_stq_idx(io_resp_bits_uop_stq_idx),
		.io_deq_bits_uop_uses_ldq(io_resp_bits_uop_uses_ldq),
		.io_deq_bits_uop_uses_stq(io_resp_bits_uop_uses_stq),
		.io_deq_bits_data(io_resp_bits_data),
		.io_deq_bits_is_hella(io_resp_bits_is_hella),
		.io_brupdate_b1_resolve_mask(io_brupdate_b1_resolve_mask),
		.io_brupdate_b1_mispredict_mask(io_brupdate_b1_mispredict_mask),
		.io_flush(io_exception)
	);
	assign io_req_0_ready = req_ready;
	assign io_secondary_miss_0 = (idx_match_0 & (((idx_matches_0_0 & _mshrs_0_io_way_valid) & _way_matches_0_0_T) | ((idx_matches_0_1 & _mshrs_1_io_way_valid) & _way_matches_0_1_T))) & ~tag_match_0;
	assign io_block_hit_0 = idx_match_0 & tag_match_0;
	assign io_mem_acquire_valid = io_mem_acquire_valid_0;
	assign io_mem_acquire_bits_opcode = (_GEN_4 ? 3'h6 : 3'h0) | (muxState_2 ? _mmios_0_io_mem_access_bits_opcode : 3'h0);
	assign io_mem_acquire_bits_param = ((muxState_0 ? _mshrs_0_io_mem_acquire_bits_param : 3'h0) | (muxState_1 ? _mshrs_1_io_mem_acquire_bits_param : 3'h0)) | (muxState_2 ? _mmios_0_io_mem_access_bits_param : 3'h0);
	assign io_mem_acquire_bits_size = (_GEN_4 ? 4'h6 : 4'h0) | (muxState_2 ? _mmios_0_io_mem_access_bits_size : 4'h0);
	assign io_mem_acquire_bits_source = ((muxState_0 ? _mshrs_0_io_mem_acquire_bits_source : 2'h0) | (muxState_1 ? _mshrs_1_io_mem_acquire_bits_source : 2'h0)) | (muxState_2 ? _mmios_0_io_mem_access_bits_source : 2'h0);
	assign io_mem_acquire_bits_address = ((muxState_0 ? _mshrs_0_io_mem_acquire_bits_address : 32'h00000000) | (muxState_1 ? _mshrs_1_io_mem_acquire_bits_address : 32'h00000000)) | (muxState_2 ? _mmios_0_io_mem_access_bits_address : 32'h00000000);
	assign io_mem_acquire_bits_mask = ({8 {muxState_0}} | {8 {muxState_1}}) | (muxState_2 ? _mmios_0_io_mem_access_bits_mask : 8'h00);
	assign io_mem_acquire_bits_data = (muxState_2 ? _mmios_0_io_mem_access_bits_data : 64'h0000000000000000);
	assign io_mem_grant_ready = &io_mem_grant_bits_source | (_GEN_2 ? _mshrs_1_io_mem_grant_ready : _GEN_0 & _mshrs_0_io_mem_grant_ready);
	assign io_mem_finish_valid = io_mem_finish_valid_0;
	assign io_mem_finish_bits_sink = ((beatsLeft_1 ? state_1_0 : _mshrs_0_io_mem_finish_valid) ? _mshrs_0_io_mem_finish_bits_sink : 2'h0) | ((beatsLeft_1 ? state_1_1 : winner_1_1) ? _mshrs_1_io_mem_finish_bits_sink : 2'h0);
	assign io_replay_valid = _replay_arb_io_out_valid;
	assign io_replay_bits_uop_mem_cmd = _replay_arb_io_out_bits_uop_mem_cmd;
	assign io_fence_rdy = ~((~_mmios_0_io_req_ready | ~_mshrs_1_io_req_pri_rdy) | ~_mshrs_0_io_req_pri_rdy);
	assign io_probe_rdy = ~(((~_mshrs_1_io_probe_rdy & idx_matches_0_1) & io_req_is_probe_0) | ((~_mshrs_0_io_probe_rdy & idx_matches_0_0) & io_req_is_probe_0));
endmodule
