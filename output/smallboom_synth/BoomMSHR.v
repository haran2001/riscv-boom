module BoomMSHR (
	clock,
	reset,
	io_id,
	io_req_pri_val,
	io_req_pri_rdy,
	io_req_sec_val,
	io_req_sec_rdy,
	io_clear_prefetch,
	io_brupdate_b1_resolve_mask,
	io_brupdate_b1_mispredict_mask,
	io_exception,
	io_req_uop_inst,
	io_req_uop_debug_inst,
	io_req_uop_is_rvc,
	io_req_uop_debug_pc,
	io_req_uop_iq_type_0,
	io_req_uop_iq_type_1,
	io_req_uop_iq_type_2,
	io_req_uop_iq_type_3,
	io_req_uop_fu_code_0,
	io_req_uop_fu_code_1,
	io_req_uop_fu_code_2,
	io_req_uop_fu_code_3,
	io_req_uop_fu_code_4,
	io_req_uop_fu_code_5,
	io_req_uop_fu_code_6,
	io_req_uop_fu_code_7,
	io_req_uop_fu_code_8,
	io_req_uop_fu_code_9,
	io_req_uop_iw_issued,
	io_req_uop_iw_issued_partial_agen,
	io_req_uop_iw_issued_partial_dgen,
	io_req_uop_iw_p1_speculative_child,
	io_req_uop_iw_p2_speculative_child,
	io_req_uop_iw_p1_bypass_hint,
	io_req_uop_iw_p2_bypass_hint,
	io_req_uop_iw_p3_bypass_hint,
	io_req_uop_dis_col_sel,
	io_req_uop_br_mask,
	io_req_uop_br_tag,
	io_req_uop_br_type,
	io_req_uop_is_sfb,
	io_req_uop_is_fence,
	io_req_uop_is_fencei,
	io_req_uop_is_sfence,
	io_req_uop_is_amo,
	io_req_uop_is_eret,
	io_req_uop_is_sys_pc2epc,
	io_req_uop_is_rocc,
	io_req_uop_is_mov,
	io_req_uop_ftq_idx,
	io_req_uop_edge_inst,
	io_req_uop_pc_lob,
	io_req_uop_taken,
	io_req_uop_imm_rename,
	io_req_uop_imm_sel,
	io_req_uop_pimm,
	io_req_uop_imm_packed,
	io_req_uop_op1_sel,
	io_req_uop_op2_sel,
	io_req_uop_fp_ctrl_ldst,
	io_req_uop_fp_ctrl_wen,
	io_req_uop_fp_ctrl_ren1,
	io_req_uop_fp_ctrl_ren2,
	io_req_uop_fp_ctrl_ren3,
	io_req_uop_fp_ctrl_swap12,
	io_req_uop_fp_ctrl_swap23,
	io_req_uop_fp_ctrl_typeTagIn,
	io_req_uop_fp_ctrl_typeTagOut,
	io_req_uop_fp_ctrl_fromint,
	io_req_uop_fp_ctrl_toint,
	io_req_uop_fp_ctrl_fastpipe,
	io_req_uop_fp_ctrl_fma,
	io_req_uop_fp_ctrl_div,
	io_req_uop_fp_ctrl_sqrt,
	io_req_uop_fp_ctrl_wflags,
	io_req_uop_fp_ctrl_vec,
	io_req_uop_rob_idx,
	io_req_uop_ldq_idx,
	io_req_uop_stq_idx,
	io_req_uop_rxq_idx,
	io_req_uop_pdst,
	io_req_uop_prs1,
	io_req_uop_prs2,
	io_req_uop_prs3,
	io_req_uop_ppred,
	io_req_uop_prs1_busy,
	io_req_uop_prs2_busy,
	io_req_uop_prs3_busy,
	io_req_uop_ppred_busy,
	io_req_uop_stale_pdst,
	io_req_uop_exception,
	io_req_uop_exc_cause,
	io_req_uop_mem_cmd,
	io_req_uop_mem_size,
	io_req_uop_mem_signed,
	io_req_uop_uses_ldq,
	io_req_uop_uses_stq,
	io_req_uop_is_unique,
	io_req_uop_flush_on_commit,
	io_req_uop_csr_cmd,
	io_req_uop_ldst_is_rs1,
	io_req_uop_ldst,
	io_req_uop_lrs1,
	io_req_uop_lrs2,
	io_req_uop_lrs3,
	io_req_uop_dst_rtype,
	io_req_uop_lrs1_rtype,
	io_req_uop_lrs2_rtype,
	io_req_uop_frs3_en,
	io_req_uop_fcn_dw,
	io_req_uop_fcn_op,
	io_req_uop_fp_val,
	io_req_uop_fp_rm,
	io_req_uop_fp_typ,
	io_req_uop_xcpt_pf_if,
	io_req_uop_xcpt_ae_if,
	io_req_uop_xcpt_ma_if,
	io_req_uop_bp_debug_if,
	io_req_uop_bp_xcpt_if,
	io_req_uop_debug_fsrc,
	io_req_uop_debug_tsrc,
	io_req_addr,
	io_req_data,
	io_req_is_hella,
	io_req_tag_match,
	io_req_old_meta_coh_state,
	io_req_old_meta_tag,
	io_req_way_en,
	io_req_sdq_id,
	io_req_is_probe,
	io_idx_valid,
	io_idx_bits,
	io_way_valid,
	io_way_bits,
	io_tag_valid,
	io_tag_bits,
	io_mem_acquire_ready,
	io_mem_acquire_valid,
	io_mem_acquire_bits_param,
	io_mem_acquire_bits_source,
	io_mem_acquire_bits_address,
	io_mem_grant_ready,
	io_mem_grant_valid,
	io_mem_grant_bits_opcode,
	io_mem_grant_bits_param,
	io_mem_grant_bits_size,
	io_mem_grant_bits_sink,
	io_mem_grant_bits_data,
	io_mem_finish_ready,
	io_mem_finish_valid,
	io_mem_finish_bits_sink,
	io_prober_state_valid,
	io_prober_state_bits,
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
	io_wb_req_ready,
	io_wb_req_valid,
	io_wb_req_bits_tag,
	io_wb_req_bits_idx,
	io_wb_req_bits_source,
	io_wb_req_bits_param,
	io_wb_req_bits_way_en,
	io_lb_read_offset,
	io_lb_resp,
	io_lb_write_valid,
	io_lb_write_bits_offset,
	io_lb_write_bits_data,
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
	io_replay_bits_is_hella,
	io_replay_bits_way_en,
	io_replay_bits_sdq_id,
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
	io_wb_resp,
	io_probe_rdy
);
	input clock;
	input reset;
	input io_id;
	input io_req_pri_val;
	output wire io_req_pri_rdy;
	input io_req_sec_val;
	output wire io_req_sec_rdy;
	input io_clear_prefetch;
	input [7:0] io_brupdate_b1_resolve_mask;
	input [7:0] io_brupdate_b1_mispredict_mask;
	input io_exception;
	input [31:0] io_req_uop_inst;
	input [31:0] io_req_uop_debug_inst;
	input io_req_uop_is_rvc;
	input [39:0] io_req_uop_debug_pc;
	input io_req_uop_iq_type_0;
	input io_req_uop_iq_type_1;
	input io_req_uop_iq_type_2;
	input io_req_uop_iq_type_3;
	input io_req_uop_fu_code_0;
	input io_req_uop_fu_code_1;
	input io_req_uop_fu_code_2;
	input io_req_uop_fu_code_3;
	input io_req_uop_fu_code_4;
	input io_req_uop_fu_code_5;
	input io_req_uop_fu_code_6;
	input io_req_uop_fu_code_7;
	input io_req_uop_fu_code_8;
	input io_req_uop_fu_code_9;
	input io_req_uop_iw_issued;
	input io_req_uop_iw_issued_partial_agen;
	input io_req_uop_iw_issued_partial_dgen;
	input io_req_uop_iw_p1_speculative_child;
	input io_req_uop_iw_p2_speculative_child;
	input io_req_uop_iw_p1_bypass_hint;
	input io_req_uop_iw_p2_bypass_hint;
	input io_req_uop_iw_p3_bypass_hint;
	input io_req_uop_dis_col_sel;
	input [7:0] io_req_uop_br_mask;
	input [2:0] io_req_uop_br_tag;
	input [3:0] io_req_uop_br_type;
	input io_req_uop_is_sfb;
	input io_req_uop_is_fence;
	input io_req_uop_is_fencei;
	input io_req_uop_is_sfence;
	input io_req_uop_is_amo;
	input io_req_uop_is_eret;
	input io_req_uop_is_sys_pc2epc;
	input io_req_uop_is_rocc;
	input io_req_uop_is_mov;
	input [3:0] io_req_uop_ftq_idx;
	input io_req_uop_edge_inst;
	input [5:0] io_req_uop_pc_lob;
	input io_req_uop_taken;
	input io_req_uop_imm_rename;
	input [2:0] io_req_uop_imm_sel;
	input [4:0] io_req_uop_pimm;
	input [19:0] io_req_uop_imm_packed;
	input [1:0] io_req_uop_op1_sel;
	input [2:0] io_req_uop_op2_sel;
	input io_req_uop_fp_ctrl_ldst;
	input io_req_uop_fp_ctrl_wen;
	input io_req_uop_fp_ctrl_ren1;
	input io_req_uop_fp_ctrl_ren2;
	input io_req_uop_fp_ctrl_ren3;
	input io_req_uop_fp_ctrl_swap12;
	input io_req_uop_fp_ctrl_swap23;
	input [1:0] io_req_uop_fp_ctrl_typeTagIn;
	input [1:0] io_req_uop_fp_ctrl_typeTagOut;
	input io_req_uop_fp_ctrl_fromint;
	input io_req_uop_fp_ctrl_toint;
	input io_req_uop_fp_ctrl_fastpipe;
	input io_req_uop_fp_ctrl_fma;
	input io_req_uop_fp_ctrl_div;
	input io_req_uop_fp_ctrl_sqrt;
	input io_req_uop_fp_ctrl_wflags;
	input io_req_uop_fp_ctrl_vec;
	input [4:0] io_req_uop_rob_idx;
	input [3:0] io_req_uop_ldq_idx;
	input [3:0] io_req_uop_stq_idx;
	input [1:0] io_req_uop_rxq_idx;
	input [5:0] io_req_uop_pdst;
	input [5:0] io_req_uop_prs1;
	input [5:0] io_req_uop_prs2;
	input [5:0] io_req_uop_prs3;
	input [3:0] io_req_uop_ppred;
	input io_req_uop_prs1_busy;
	input io_req_uop_prs2_busy;
	input io_req_uop_prs3_busy;
	input io_req_uop_ppred_busy;
	input [5:0] io_req_uop_stale_pdst;
	input io_req_uop_exception;
	input [63:0] io_req_uop_exc_cause;
	input [4:0] io_req_uop_mem_cmd;
	input [1:0] io_req_uop_mem_size;
	input io_req_uop_mem_signed;
	input io_req_uop_uses_ldq;
	input io_req_uop_uses_stq;
	input io_req_uop_is_unique;
	input io_req_uop_flush_on_commit;
	input [2:0] io_req_uop_csr_cmd;
	input io_req_uop_ldst_is_rs1;
	input [5:0] io_req_uop_ldst;
	input [5:0] io_req_uop_lrs1;
	input [5:0] io_req_uop_lrs2;
	input [5:0] io_req_uop_lrs3;
	input [1:0] io_req_uop_dst_rtype;
	input [1:0] io_req_uop_lrs1_rtype;
	input [1:0] io_req_uop_lrs2_rtype;
	input io_req_uop_frs3_en;
	input io_req_uop_fcn_dw;
	input [4:0] io_req_uop_fcn_op;
	input io_req_uop_fp_val;
	input [2:0] io_req_uop_fp_rm;
	input [1:0] io_req_uop_fp_typ;
	input io_req_uop_xcpt_pf_if;
	input io_req_uop_xcpt_ae_if;
	input io_req_uop_xcpt_ma_if;
	input io_req_uop_bp_debug_if;
	input io_req_uop_bp_xcpt_if;
	input [2:0] io_req_uop_debug_fsrc;
	input [2:0] io_req_uop_debug_tsrc;
	input [39:0] io_req_addr;
	input [63:0] io_req_data;
	input io_req_is_hella;
	input io_req_tag_match;
	input [1:0] io_req_old_meta_coh_state;
	input [19:0] io_req_old_meta_tag;
	input [3:0] io_req_way_en;
	input [4:0] io_req_sdq_id;
	input io_req_is_probe;
	output wire io_idx_valid;
	output wire [5:0] io_idx_bits;
	output wire io_way_valid;
	output wire [3:0] io_way_bits;
	output wire io_tag_valid;
	output wire [27:0] io_tag_bits;
	input io_mem_acquire_ready;
	output wire io_mem_acquire_valid;
	output wire [2:0] io_mem_acquire_bits_param;
	output wire [1:0] io_mem_acquire_bits_source;
	output wire [31:0] io_mem_acquire_bits_address;
	output wire io_mem_grant_ready;
	input io_mem_grant_valid;
	input [2:0] io_mem_grant_bits_opcode;
	input [1:0] io_mem_grant_bits_param;
	input [3:0] io_mem_grant_bits_size;
	input [1:0] io_mem_grant_bits_sink;
	input [63:0] io_mem_grant_bits_data;
	input io_mem_finish_ready;
	output wire io_mem_finish_valid;
	output wire [1:0] io_mem_finish_bits_sink;
	input io_prober_state_valid;
	input [39:0] io_prober_state_bits;
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
	input io_wb_req_ready;
	output wire io_wb_req_valid;
	output wire [19:0] io_wb_req_bits_tag;
	output wire [5:0] io_wb_req_bits_idx;
	output wire [1:0] io_wb_req_bits_source;
	output wire [2:0] io_wb_req_bits_param;
	output wire [3:0] io_wb_req_bits_way_en;
	output wire [2:0] io_lb_read_offset;
	input [63:0] io_lb_resp;
	output wire io_lb_write_valid;
	output wire [2:0] io_lb_write_bits_offset;
	output wire [63:0] io_lb_write_bits_data;
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
	output wire io_replay_bits_is_hella;
	output wire [3:0] io_replay_bits_way_en;
	output wire [4:0] io_replay_bits_sdq_id;
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
	input io_wb_resp;
	output wire io_probe_rdy;
	wire io_req_pri_rdy_0;
	wire io_mem_grant_ready_0;
	wire io_req_sec_rdy_0;
	wire _rpq_io_enq_ready;
	wire _rpq_io_deq_valid;
	wire [31:0] _rpq_io_deq_bits_uop_inst;
	wire [31:0] _rpq_io_deq_bits_uop_debug_inst;
	wire _rpq_io_deq_bits_uop_is_rvc;
	wire [39:0] _rpq_io_deq_bits_uop_debug_pc;
	wire _rpq_io_deq_bits_uop_iq_type_0;
	wire _rpq_io_deq_bits_uop_iq_type_1;
	wire _rpq_io_deq_bits_uop_iq_type_2;
	wire _rpq_io_deq_bits_uop_iq_type_3;
	wire _rpq_io_deq_bits_uop_fu_code_0;
	wire _rpq_io_deq_bits_uop_fu_code_1;
	wire _rpq_io_deq_bits_uop_fu_code_2;
	wire _rpq_io_deq_bits_uop_fu_code_3;
	wire _rpq_io_deq_bits_uop_fu_code_4;
	wire _rpq_io_deq_bits_uop_fu_code_5;
	wire _rpq_io_deq_bits_uop_fu_code_6;
	wire _rpq_io_deq_bits_uop_fu_code_7;
	wire _rpq_io_deq_bits_uop_fu_code_8;
	wire _rpq_io_deq_bits_uop_fu_code_9;
	wire _rpq_io_deq_bits_uop_iw_issued;
	wire _rpq_io_deq_bits_uop_iw_issued_partial_agen;
	wire _rpq_io_deq_bits_uop_iw_issued_partial_dgen;
	wire _rpq_io_deq_bits_uop_iw_p1_speculative_child;
	wire _rpq_io_deq_bits_uop_iw_p2_speculative_child;
	wire _rpq_io_deq_bits_uop_iw_p1_bypass_hint;
	wire _rpq_io_deq_bits_uop_iw_p2_bypass_hint;
	wire _rpq_io_deq_bits_uop_iw_p3_bypass_hint;
	wire _rpq_io_deq_bits_uop_dis_col_sel;
	wire [7:0] _rpq_io_deq_bits_uop_br_mask;
	wire [2:0] _rpq_io_deq_bits_uop_br_tag;
	wire [3:0] _rpq_io_deq_bits_uop_br_type;
	wire _rpq_io_deq_bits_uop_is_sfb;
	wire _rpq_io_deq_bits_uop_is_fence;
	wire _rpq_io_deq_bits_uop_is_fencei;
	wire _rpq_io_deq_bits_uop_is_sfence;
	wire _rpq_io_deq_bits_uop_is_amo;
	wire _rpq_io_deq_bits_uop_is_eret;
	wire _rpq_io_deq_bits_uop_is_sys_pc2epc;
	wire _rpq_io_deq_bits_uop_is_rocc;
	wire _rpq_io_deq_bits_uop_is_mov;
	wire [3:0] _rpq_io_deq_bits_uop_ftq_idx;
	wire _rpq_io_deq_bits_uop_edge_inst;
	wire [5:0] _rpq_io_deq_bits_uop_pc_lob;
	wire _rpq_io_deq_bits_uop_taken;
	wire _rpq_io_deq_bits_uop_imm_rename;
	wire [2:0] _rpq_io_deq_bits_uop_imm_sel;
	wire [4:0] _rpq_io_deq_bits_uop_pimm;
	wire [19:0] _rpq_io_deq_bits_uop_imm_packed;
	wire [1:0] _rpq_io_deq_bits_uop_op1_sel;
	wire [2:0] _rpq_io_deq_bits_uop_op2_sel;
	wire _rpq_io_deq_bits_uop_fp_ctrl_ldst;
	wire _rpq_io_deq_bits_uop_fp_ctrl_wen;
	wire _rpq_io_deq_bits_uop_fp_ctrl_ren1;
	wire _rpq_io_deq_bits_uop_fp_ctrl_ren2;
	wire _rpq_io_deq_bits_uop_fp_ctrl_ren3;
	wire _rpq_io_deq_bits_uop_fp_ctrl_swap12;
	wire _rpq_io_deq_bits_uop_fp_ctrl_swap23;
	wire [1:0] _rpq_io_deq_bits_uop_fp_ctrl_typeTagIn;
	wire [1:0] _rpq_io_deq_bits_uop_fp_ctrl_typeTagOut;
	wire _rpq_io_deq_bits_uop_fp_ctrl_fromint;
	wire _rpq_io_deq_bits_uop_fp_ctrl_toint;
	wire _rpq_io_deq_bits_uop_fp_ctrl_fastpipe;
	wire _rpq_io_deq_bits_uop_fp_ctrl_fma;
	wire _rpq_io_deq_bits_uop_fp_ctrl_div;
	wire _rpq_io_deq_bits_uop_fp_ctrl_sqrt;
	wire _rpq_io_deq_bits_uop_fp_ctrl_wflags;
	wire _rpq_io_deq_bits_uop_fp_ctrl_vec;
	wire [4:0] _rpq_io_deq_bits_uop_rob_idx;
	wire [3:0] _rpq_io_deq_bits_uop_ldq_idx;
	wire [3:0] _rpq_io_deq_bits_uop_stq_idx;
	wire [1:0] _rpq_io_deq_bits_uop_rxq_idx;
	wire [5:0] _rpq_io_deq_bits_uop_pdst;
	wire [5:0] _rpq_io_deq_bits_uop_prs1;
	wire [5:0] _rpq_io_deq_bits_uop_prs2;
	wire [5:0] _rpq_io_deq_bits_uop_prs3;
	wire [3:0] _rpq_io_deq_bits_uop_ppred;
	wire _rpq_io_deq_bits_uop_prs1_busy;
	wire _rpq_io_deq_bits_uop_prs2_busy;
	wire _rpq_io_deq_bits_uop_prs3_busy;
	wire _rpq_io_deq_bits_uop_ppred_busy;
	wire [5:0] _rpq_io_deq_bits_uop_stale_pdst;
	wire _rpq_io_deq_bits_uop_exception;
	wire [63:0] _rpq_io_deq_bits_uop_exc_cause;
	wire [4:0] _rpq_io_deq_bits_uop_mem_cmd;
	wire [1:0] _rpq_io_deq_bits_uop_mem_size;
	wire _rpq_io_deq_bits_uop_mem_signed;
	wire _rpq_io_deq_bits_uop_uses_ldq;
	wire _rpq_io_deq_bits_uop_uses_stq;
	wire _rpq_io_deq_bits_uop_is_unique;
	wire _rpq_io_deq_bits_uop_flush_on_commit;
	wire [2:0] _rpq_io_deq_bits_uop_csr_cmd;
	wire _rpq_io_deq_bits_uop_ldst_is_rs1;
	wire [5:0] _rpq_io_deq_bits_uop_ldst;
	wire [5:0] _rpq_io_deq_bits_uop_lrs1;
	wire [5:0] _rpq_io_deq_bits_uop_lrs2;
	wire [5:0] _rpq_io_deq_bits_uop_lrs3;
	wire [1:0] _rpq_io_deq_bits_uop_dst_rtype;
	wire [1:0] _rpq_io_deq_bits_uop_lrs1_rtype;
	wire [1:0] _rpq_io_deq_bits_uop_lrs2_rtype;
	wire _rpq_io_deq_bits_uop_frs3_en;
	wire _rpq_io_deq_bits_uop_fcn_dw;
	wire [4:0] _rpq_io_deq_bits_uop_fcn_op;
	wire _rpq_io_deq_bits_uop_fp_val;
	wire [2:0] _rpq_io_deq_bits_uop_fp_rm;
	wire [1:0] _rpq_io_deq_bits_uop_fp_typ;
	wire _rpq_io_deq_bits_uop_xcpt_pf_if;
	wire _rpq_io_deq_bits_uop_xcpt_ae_if;
	wire _rpq_io_deq_bits_uop_xcpt_ma_if;
	wire _rpq_io_deq_bits_uop_bp_debug_if;
	wire _rpq_io_deq_bits_uop_bp_xcpt_if;
	wire [2:0] _rpq_io_deq_bits_uop_debug_fsrc;
	wire [2:0] _rpq_io_deq_bits_uop_debug_tsrc;
	wire [39:0] _rpq_io_deq_bits_addr;
	wire [63:0] _rpq_io_deq_bits_data;
	wire _rpq_io_deq_bits_is_hella;
	wire [3:0] _rpq_io_deq_bits_way_en;
	wire _rpq_io_empty;
	reg [4:0] state;
	reg [4:0] req_uop_mem_cmd;
	reg [39:0] req_addr;
	reg [1:0] req_old_meta_coh_state;
	reg [19:0] req_old_meta_tag;
	reg [3:0] req_way_en;
	reg req_needs_wb;
	reg [1:0] new_coh_state;
	wire _needs_second_acq_T_27 = req_uop_mem_cmd == 5'h01;
	wire _needs_second_acq_T_28 = req_uop_mem_cmd == 5'h11;
	wire _needs_second_acq_T_30 = req_uop_mem_cmd == 5'h07;
	wire _needs_second_acq_T_32 = req_uop_mem_cmd == 5'h04;
	wire _needs_second_acq_T_33 = req_uop_mem_cmd == 5'h09;
	wire _needs_second_acq_T_34 = req_uop_mem_cmd == 5'h0a;
	wire _needs_second_acq_T_35 = req_uop_mem_cmd == 5'h0b;
	wire _needs_second_acq_T_39 = req_uop_mem_cmd == 5'h08;
	wire _needs_second_acq_T_40 = req_uop_mem_cmd == 5'h0c;
	wire _needs_second_acq_T_41 = req_uop_mem_cmd == 5'h0d;
	wire _needs_second_acq_T_42 = req_uop_mem_cmd == 5'h0e;
	wire _needs_second_acq_T_43 = req_uop_mem_cmd == 5'h0f;
	wire _needs_second_acq_T_50 = req_uop_mem_cmd == 5'h03;
	wire _needs_second_acq_T_52 = req_uop_mem_cmd == 5'h06;
	wire [3:0] _grow_param_r_T = {((((((((((_needs_second_acq_T_27 | _needs_second_acq_T_28) | _needs_second_acq_T_30) | _needs_second_acq_T_32) | _needs_second_acq_T_33) | _needs_second_acq_T_34) | _needs_second_acq_T_35) | _needs_second_acq_T_39) | _needs_second_acq_T_40) | _needs_second_acq_T_41) | _needs_second_acq_T_42) | _needs_second_acq_T_43, ((((((((((((_needs_second_acq_T_27 | _needs_second_acq_T_28) | _needs_second_acq_T_30) | _needs_second_acq_T_32) | _needs_second_acq_T_33) | _needs_second_acq_T_34) | _needs_second_acq_T_35) | _needs_second_acq_T_39) | _needs_second_acq_T_40) | _needs_second_acq_T_41) | _needs_second_acq_T_42) | _needs_second_acq_T_43) | _needs_second_acq_T_50) | _needs_second_acq_T_52, new_coh_state};
	wire [1:0] _grow_param_r_T_27 = {1'h0, _grow_param_r_T == 4'hc};
	wire [31:0] _GEN = {6'h3e, _grow_param_r_T_27, _grow_param_r_T_27, _grow_param_r_T_27, _grow_param_r_T_27, _grow_param_r_T_27, 16'he9e4};
	wire _state_T_37 = io_req_uop_mem_cmd == 5'h01;
	wire _state_T_38 = io_req_uop_mem_cmd == 5'h11;
	wire _state_T_40 = io_req_uop_mem_cmd == 5'h07;
	wire _state_T_42 = io_req_uop_mem_cmd == 5'h04;
	wire _state_T_43 = io_req_uop_mem_cmd == 5'h09;
	wire _state_T_44 = io_req_uop_mem_cmd == 5'h0a;
	wire _state_T_45 = io_req_uop_mem_cmd == 5'h0b;
	wire _state_T_49 = io_req_uop_mem_cmd == 5'h08;
	wire _state_T_50 = io_req_uop_mem_cmd == 5'h0c;
	wire _state_T_51 = io_req_uop_mem_cmd == 5'h0d;
	wire _state_T_52 = io_req_uop_mem_cmd == 5'h0e;
	wire _state_T_53 = io_req_uop_mem_cmd == 5'h0f;
	wire _state_r_c_cat_T_96 = io_req_uop_mem_cmd == 5'h03;
	wire _state_r_c_cat_T_98 = io_req_uop_mem_cmd == 5'h06;
	wire _GEN_0 = io_mem_grant_ready_0 & io_mem_grant_valid;
	wire [26:0] _r_beats1_decode_T = 27'h0000fff << io_mem_grant_bits_size;
	wire [8:0] r_beats1 = (io_mem_grant_bits_opcode[0] ? ~_r_beats1_decode_T[11:3] : 9'h000);
	reg [8:0] r_counter;
	wire [8:0] _r_counter1_T = r_counter - 9'h001;
	wire refill_done = ((r_counter == 9'h001) | (r_beats1 == 9'h000)) & _GEN_0;
	wire _sec_rdy_T_4 = state == 5'h0d;
	wire _sec_rdy_T_5 = state == 5'h0e;
	wire _sec_rdy_T_6 = state == 5'h0f;
	wire _rpq_io_enq_valid_T = io_req_pri_val & io_req_pri_rdy_0;
	wire _rpq_io_enq_valid_T_1 = io_req_sec_val & io_req_sec_rdy_0;
	wire _rpq_io_enq_valid_T_7 = (_rpq_io_enq_valid_T | _rpq_io_enq_valid_T_1) & ~((io_req_uop_mem_cmd == 5'h02) | _state_r_c_cat_T_96);
	reg grantack_valid;
	reg [1:0] grantack_bits_sink;
	reg [2:0] refill_ctr;
	reg commit_line;
	reg grant_had_data;
	reg finish_to_prefetch;
	reg [1:0] meta_hazard;
	wire _io_probe_rdy_T_2 = state == 5'h01;
	wire _io_probe_rdy_T_3 = state == 5'h02;
	wire _io_probe_rdy_T_4 = state == 5'h03;
	wire _io_probe_rdy_T_8 = state == 5'h04;
	wire _io_way_valid_T_1 = state == 5'h11;
	assign io_req_sec_rdy_0 = ((~((((((((((((((_state_T_37 | _state_T_38) | _state_T_40) | _state_T_42) | _state_T_43) | _state_T_44) | _state_T_45) | _state_T_49) | _state_T_50) | _state_T_51) | _state_T_52) | _state_T_53) | _state_r_c_cat_T_96) | _state_r_c_cat_T_98) & ~(((((((((((((_needs_second_acq_T_27 | _needs_second_acq_T_28) | _needs_second_acq_T_30) | _needs_second_acq_T_32) | _needs_second_acq_T_33) | _needs_second_acq_T_34) | _needs_second_acq_T_35) | _needs_second_acq_T_39) | _needs_second_acq_T_40) | _needs_second_acq_T_41) | _needs_second_acq_T_42) | _needs_second_acq_T_43) | _needs_second_acq_T_50) | _needs_second_acq_T_52)) & ~io_req_is_probe) & ~(((~(|state) | _sec_rdy_T_4) | _sec_rdy_T_5) | _sec_rdy_T_6)) & _rpq_io_enq_ready;
	wire [1:0] io_wb_req_bits_source_0 = {1'h0, io_id};
	wire [3:0] _state_r_T = {((((((((((_state_T_37 | _state_T_38) | _state_T_40) | _state_T_42) | _state_T_43) | _state_T_44) | _state_T_45) | _state_T_49) | _state_T_50) | _state_T_51) | _state_T_52) | _state_T_53, ((((((((((((_state_T_37 | _state_T_38) | _state_T_40) | _state_T_42) | _state_T_43) | _state_T_44) | _state_T_45) | _state_T_49) | _state_T_50) | _state_T_51) | _state_T_52) | _state_T_53) | _state_r_c_cat_T_96) | _state_r_c_cat_T_98, io_req_old_meta_coh_state};
	wire state_is_hit = ((((((_state_r_T == 4'h3) | (_state_r_T == 4'h2)) | (_state_r_T == 4'h1)) | (_state_r_T == 4'h7)) | (_state_r_T == 4'h6)) | &_state_r_T) | (_state_r_T == 4'he);
	wire io_mem_acquire_valid_0 = |state & _io_probe_rdy_T_2;
	wire _GEN_1 = ~(|state) | _io_probe_rdy_T_2;
	assign io_mem_grant_ready_0 = ~_GEN_1 & _io_probe_rdy_T_3;
	wire _drain_load_T_28 = _rpq_io_deq_bits_uop_mem_cmd == 5'h07;
	wire _drain_load_T_30 = _rpq_io_deq_bits_uop_mem_cmd == 5'h04;
	wire _drain_load_T_31 = _rpq_io_deq_bits_uop_mem_cmd == 5'h09;
	wire _drain_load_T_32 = _rpq_io_deq_bits_uop_mem_cmd == 5'h0a;
	wire _drain_load_T_33 = _rpq_io_deq_bits_uop_mem_cmd == 5'h0b;
	wire _drain_load_T_37 = _rpq_io_deq_bits_uop_mem_cmd == 5'h08;
	wire _drain_load_T_38 = _rpq_io_deq_bits_uop_mem_cmd == 5'h0c;
	wire _drain_load_T_39 = _rpq_io_deq_bits_uop_mem_cmd == 5'h0d;
	wire _drain_load_T_40 = _rpq_io_deq_bits_uop_mem_cmd == 5'h0e;
	wire _drain_load_T_41 = _rpq_io_deq_bits_uop_mem_cmd == 5'h0f;
	wire drain_load = ((((((((((((((_rpq_io_deq_bits_uop_mem_cmd == 5'h00) | (_rpq_io_deq_bits_uop_mem_cmd == 5'h10)) | (_rpq_io_deq_bits_uop_mem_cmd == 5'h06)) | _drain_load_T_28) | _drain_load_T_30) | _drain_load_T_31) | _drain_load_T_32) | _drain_load_T_33) | _drain_load_T_37) | _drain_load_T_38) | _drain_load_T_39) | _drain_load_T_40) | _drain_load_T_41) & ~((((((((((((_rpq_io_deq_bits_uop_mem_cmd == 5'h01) | (_rpq_io_deq_bits_uop_mem_cmd == 5'h11)) | _drain_load_T_28) | _drain_load_T_30) | _drain_load_T_31) | _drain_load_T_32) | _drain_load_T_33) | _drain_load_T_37) | _drain_load_T_38) | _drain_load_T_39) | _drain_load_T_40) | _drain_load_T_41)) & (_rpq_io_deq_bits_uop_mem_cmd != 5'h06);
	wire _GEN_2 = (~(|state) | _io_probe_rdy_T_2) | _io_probe_rdy_T_3;
	wire [31:0] io_resp_bits_data_zeroed = (_rpq_io_deq_bits_addr[2] ? io_lb_resp[63:32] : io_lb_resp[31:0]);
	wire [15:0] io_resp_bits_data_zeroed_1 = (_rpq_io_deq_bits_addr[1] ? io_resp_bits_data_zeroed[31:16] : io_resp_bits_data_zeroed[15:0]);
	wire [7:0] io_resp_bits_data_zeroed_2 = (_rpq_io_deq_bits_addr[0] ? io_resp_bits_data_zeroed_1[15:8] : io_resp_bits_data_zeroed_1[7:0]);
	wire io_meta_read_valid_0 = (~(((~(|state) | _io_probe_rdy_T_2) | _io_probe_rdy_T_3) | _io_probe_rdy_T_4) & _io_probe_rdy_T_8) & ((~io_prober_state_valid | ~grantack_valid) | (io_prober_state_bits[11:6] != req_addr[11:6]));
	wire _GEN_3 = state == 5'h05;
	wire _GEN_4 = state == 5'h06;
	wire _GEN_5 = state == 5'h07;
	wire _GEN_6 = state == 5'h09;
	wire io_wb_req_valid_0 = ~(((((((~(|state) | _io_probe_rdy_T_2) | _io_probe_rdy_T_3) | _io_probe_rdy_T_4) | _io_probe_rdy_T_8) | _GEN_3) | _GEN_4) | _GEN_5) & _GEN_6;
	wire _GEN_7 = state == 5'h0a;
	wire _GEN_8 = state == 5'h0b;
	wire _GEN_9 = ((((_io_probe_rdy_T_8 | _GEN_3) | _GEN_4) | _GEN_5) | _GEN_6) | _GEN_7;
	wire _GEN_10 = ((_io_probe_rdy_T_2 | _io_probe_rdy_T_3) | _io_probe_rdy_T_4) | _GEN_9;
	wire io_refill_valid_0 = ~(~(|state) | _GEN_10) & _GEN_8;
	wire _GEN_11 = state == 5'h0c;
	wire _GEN_12 = (((((_io_probe_rdy_T_8 | _GEN_3) | _GEN_4) | _GEN_5) | _GEN_6) | _GEN_7) | _GEN_8;
	wire _GEN_13 = _io_probe_rdy_T_4 | _GEN_12;
	wire _GEN_14 = ((~(|state) | _io_probe_rdy_T_2) | _io_probe_rdy_T_3) | _GEN_13;
	wire io_replay_valid_0 = (~_GEN_14 & _GEN_11) & _rpq_io_deq_valid;
	wire _GEN_15 = ~_GEN_2 & (_io_probe_rdy_T_4 ? io_resp_ready & drain_load : (~_GEN_12 & _GEN_11) & io_replay_ready);
	wire _GEN_16 = _GEN_14 | ~_GEN_11;
	wire _r_c_cat_T_23 = _rpq_io_deq_bits_uop_mem_cmd == 5'h01;
	wire _r_c_cat_T_24 = _rpq_io_deq_bits_uop_mem_cmd == 5'h11;
	wire _r_c_cat_T_26 = _rpq_io_deq_bits_uop_mem_cmd == 5'h07;
	wire _r_c_cat_T_28 = _rpq_io_deq_bits_uop_mem_cmd == 5'h04;
	wire _r_c_cat_T_29 = _rpq_io_deq_bits_uop_mem_cmd == 5'h09;
	wire _r_c_cat_T_30 = _rpq_io_deq_bits_uop_mem_cmd == 5'h0a;
	wire _r_c_cat_T_31 = _rpq_io_deq_bits_uop_mem_cmd == 5'h0b;
	wire _r_c_cat_T_35 = _rpq_io_deq_bits_uop_mem_cmd == 5'h08;
	wire _r_c_cat_T_36 = _rpq_io_deq_bits_uop_mem_cmd == 5'h0c;
	wire _r_c_cat_T_37 = _rpq_io_deq_bits_uop_mem_cmd == 5'h0d;
	wire _r_c_cat_T_38 = _rpq_io_deq_bits_uop_mem_cmd == 5'h0e;
	wire _r_c_cat_T_39 = _rpq_io_deq_bits_uop_mem_cmd == 5'h0f;
	wire _GEN_17 = (io_replay_ready & io_replay_valid_0) & (((((((((((_r_c_cat_T_23 | _r_c_cat_T_24) | _r_c_cat_T_26) | _r_c_cat_T_28) | _r_c_cat_T_29) | _r_c_cat_T_30) | _r_c_cat_T_31) | _r_c_cat_T_35) | _r_c_cat_T_36) | _r_c_cat_T_37) | _r_c_cat_T_38) | _r_c_cat_T_39);
	wire [3:0] _r_T_64 = {((((((((((_r_c_cat_T_23 | _r_c_cat_T_24) | _r_c_cat_T_26) | _r_c_cat_T_28) | _r_c_cat_T_29) | _r_c_cat_T_30) | _r_c_cat_T_31) | _r_c_cat_T_35) | _r_c_cat_T_36) | _r_c_cat_T_37) | _r_c_cat_T_38) | _r_c_cat_T_39, ((((((((((((_r_c_cat_T_23 | _r_c_cat_T_24) | _r_c_cat_T_26) | _r_c_cat_T_28) | _r_c_cat_T_29) | _r_c_cat_T_30) | _r_c_cat_T_31) | _r_c_cat_T_35) | _r_c_cat_T_36) | _r_c_cat_T_37) | _r_c_cat_T_38) | _r_c_cat_T_39) | (_rpq_io_deq_bits_uop_mem_cmd == 5'h03)) | (_rpq_io_deq_bits_uop_mem_cmd == 5'h06), new_coh_state};
	wire _GEN_18 = ((_GEN_6 | _GEN_7) | _GEN_8) | _GEN_11;
	wire io_meta_write_valid_0 = ~((((((~(|state) | _io_probe_rdy_T_2) | _io_probe_rdy_T_3) | _io_probe_rdy_T_4) | _io_probe_rdy_T_8) | _GEN_3) | _GEN_4) & (_GEN_5 | (~_GEN_18 & _sec_rdy_T_4));
	wire _GEN_19 = (((_io_probe_rdy_T_8 | _GEN_3) | _GEN_4) | _GEN_5) | _GEN_18;
	wire _GEN_20 = ((((((((_io_probe_rdy_T_4 | _io_probe_rdy_T_8) | _GEN_3) | _GEN_4) | _GEN_5) | _GEN_6) | _GEN_7) | _GEN_8) | _GEN_11) | _sec_rdy_T_4;
	wire io_mem_finish_valid_0 = (~(((~(|state) | _io_probe_rdy_T_2) | _io_probe_rdy_T_3) | _GEN_20) & _sec_rdy_T_5) & grantack_valid;
	wire _GEN_21 = (_sec_rdy_T_4 | _sec_rdy_T_5) | _sec_rdy_T_6;
	wire _GEN_22 = _GEN_11 | _GEN_21;
	wire _GEN_23 = (((((((_io_probe_rdy_T_4 | _io_probe_rdy_T_8) | _GEN_3) | _GEN_4) | _GEN_5) | _GEN_6) | _GEN_7) | _GEN_8) | _GEN_22;
	wire _GEN_24 = (_io_probe_rdy_T_2 | _io_probe_rdy_T_3) | _GEN_23;
	assign io_req_pri_rdy_0 = ~(|state) | (~_GEN_24 & _io_way_valid_T_1);
	wire _GEN_25 = (io_req_sec_val & ~io_req_sec_rdy_0) | io_clear_prefetch;
	wire [3:0] _state_r_T_59 = {((((((((((_state_T_37 | _state_T_38) | _state_T_40) | _state_T_42) | _state_T_43) | _state_T_44) | _state_T_45) | _state_T_49) | _state_T_50) | _state_T_51) | _state_T_52) | _state_T_53, ((((((((((((_state_T_37 | _state_T_38) | _state_T_40) | _state_T_42) | _state_T_43) | _state_T_44) | _state_T_45) | _state_T_49) | _state_T_50) | _state_T_51) | _state_T_52) | _state_T_53) | _state_r_c_cat_T_96) | _state_r_c_cat_T_98, io_req_old_meta_coh_state};
	wire state_is_hit_1 = ((((((_state_r_T_59 == 4'h3) | (_state_r_T_59 == 4'h2)) | (_state_r_T_59 == 4'h1)) | (_state_r_T_59 == 4'h7)) | (_state_r_T_59 == 4'h6)) | &_state_r_T_59) | (_state_r_T_59 == 4'he);
	always @(posedge clock) begin : sv2v_autoblock_1
		reg [1:0] dirties_cat;
		reg _GEN_30;
		reg _GEN_31;
		reg _GEN_32;
		reg _GEN_33;
		reg _GEN_34;
		reg _GEN_35;
		reg _GEN_36;
		reg _GEN_37;
		reg _GEN_38;
		dirties_cat = {((((((((((_state_T_37 | _state_T_38) | _state_T_40) | _state_T_42) | _state_T_43) | _state_T_44) | _state_T_45) | _state_T_49) | _state_T_50) | _state_T_51) | _state_T_52) | _state_T_53, ((((((((((((_state_T_37 | _state_T_38) | _state_T_40) | _state_T_42) | _state_T_43) | _state_T_44) | _state_T_45) | _state_T_49) | _state_T_50) | _state_T_51) | _state_T_52) | _state_T_53) | _state_r_c_cat_T_96) | _state_r_c_cat_T_98};
		_GEN_30 = io_meta_write_ready & io_meta_write_valid_0;
		_GEN_31 = _rpq_io_enq_valid_T_1 & (&dirties_cat);
		_GEN_32 = _GEN_15 & _rpq_io_deq_valid;
		_GEN_33 = _rpq_io_empty & ~commit_line;
		_GEN_34 = _rpq_io_enq_ready & _rpq_io_enq_valid_T_7;
		_GEN_35 = io_refill_ready & io_refill_valid_0;
		_GEN_36 = (io_mem_finish_ready & io_mem_finish_valid_0) | ~grantack_valid;
		_GEN_37 = _GEN_25 | _rpq_io_enq_valid_T_1;
		_GEN_38 = ((_GEN_24 | ~_io_way_valid_T_1) | _GEN_37) | ~_rpq_io_enq_valid_T;
		if (reset) begin
			state <= 5'h00;
			req_needs_wb <= 1'h0;
			new_coh_state <= 2'h0;
			r_counter <= 9'h000;
			meta_hazard <= 2'h0;
		end
		else begin : sv2v_autoblock_2
			reg [3:0] _r1_T;
			reg [1:0] _r1_T_27;
			reg [31:0] _GEN_39;
			reg [3:0] _r2_T;
			reg [1:0] _r2_T_27;
			reg [31:0] _GEN_40;
			reg _GEN_41;
			_r1_T = {((((((((((_needs_second_acq_T_27 | _needs_second_acq_T_28) | _needs_second_acq_T_30) | _needs_second_acq_T_32) | _needs_second_acq_T_33) | _needs_second_acq_T_34) | _needs_second_acq_T_35) | _needs_second_acq_T_39) | _needs_second_acq_T_40) | _needs_second_acq_T_41) | _needs_second_acq_T_42) | _needs_second_acq_T_43, ((((((((((((_needs_second_acq_T_27 | _needs_second_acq_T_28) | _needs_second_acq_T_30) | _needs_second_acq_T_32) | _needs_second_acq_T_33) | _needs_second_acq_T_34) | _needs_second_acq_T_35) | _needs_second_acq_T_39) | _needs_second_acq_T_40) | _needs_second_acq_T_41) | _needs_second_acq_T_42) | _needs_second_acq_T_43) | _needs_second_acq_T_50) | _needs_second_acq_T_52, new_coh_state};
			_r1_T_27 = {1'h0, _r1_T == 4'hc};
			_GEN_39 = {6'h3e, _r1_T_27, _r1_T_27, _r1_T_27, _r1_T_27, _r1_T_27, 16'he9e4};
			_r2_T = {((((((((((_state_T_37 | _state_T_38) | _state_T_40) | _state_T_42) | _state_T_43) | _state_T_44) | _state_T_45) | _state_T_49) | _state_T_50) | _state_T_51) | _state_T_52) | _state_T_53, ((((((((((((_state_T_37 | _state_T_38) | _state_T_40) | _state_T_42) | _state_T_43) | _state_T_44) | _state_T_45) | _state_T_49) | _state_T_50) | _state_T_51) | _state_T_52) | _state_T_53) | _state_r_c_cat_T_96) | _state_r_c_cat_T_98, new_coh_state};
			_r2_T_27 = {1'h0, _r2_T == 4'hc};
			_GEN_40 = {6'h3e, _r2_T_27, _r2_T_27, _r2_T_27, _r2_T_27, _r2_T_27, 16'he9e4};
			_GEN_41 = (_rpq_io_enq_valid_T_1 & (((((((_r1_T == 4'h3) | (_r1_T == 4'h2)) | (_r1_T == 4'h1)) | (_r1_T == 4'h7)) | (_r1_T == 4'h6)) | &_r1_T) | (_r1_T == 4'he))) & (((((((_r2_T == 4'h3) | (_r2_T == 4'h2)) | (_r2_T == 4'h1)) | (_r2_T == 4'h7)) | (_r2_T == 4'h6)) | &_r2_T) | (_r2_T == 4'he));
			if (|state) begin
				if (_io_probe_rdy_T_2) begin
					if (io_mem_acquire_ready & io_mem_acquire_valid_0)
						state <= 5'h02;
					if (_GEN_41) begin
						if (&dirties_cat)
							new_coh_state <= _GEN_40[_r2_T * 2+:2];
						else
							new_coh_state <= _GEN_39[_r1_T * 2+:2];
					end
				end
				else if (_io_probe_rdy_T_3) begin
					if (refill_done) begin : sv2v_autoblock_3
						reg [3:0] _coh_on_grant_T;
						_coh_on_grant_T = {((((((((((_needs_second_acq_T_27 | _needs_second_acq_T_28) | _needs_second_acq_T_30) | _needs_second_acq_T_32) | _needs_second_acq_T_33) | _needs_second_acq_T_34) | _needs_second_acq_T_35) | _needs_second_acq_T_39) | _needs_second_acq_T_40) | _needs_second_acq_T_41) | _needs_second_acq_T_42) | _needs_second_acq_T_43, ((((((((((((_needs_second_acq_T_27 | _needs_second_acq_T_28) | _needs_second_acq_T_30) | _needs_second_acq_T_32) | _needs_second_acq_T_33) | _needs_second_acq_T_34) | _needs_second_acq_T_35) | _needs_second_acq_T_39) | _needs_second_acq_T_40) | _needs_second_acq_T_41) | _needs_second_acq_T_42) | _needs_second_acq_T_43) | _needs_second_acq_T_50) | _needs_second_acq_T_52, io_mem_grant_bits_param};
						state <= (grant_had_data ? 5'h03 : 5'h0c);
						new_coh_state <= (_coh_on_grant_T == 4'hc ? 2'h3 : ((_coh_on_grant_T == 4'h4) | (_coh_on_grant_T == 4'h0) ? 2'h2 : {1'h0, _coh_on_grant_T == 4'h1}));
					end
					else if (_GEN_41) begin
						if (&dirties_cat)
							new_coh_state <= _GEN_40[_r2_T * 2+:2];
						else
							new_coh_state <= _GEN_39[_r1_T * 2+:2];
					end
				end
				else begin : sv2v_autoblock_4
					reg [3:0] _r_T_123;
					reg is_hit_1;
					_r_T_123 = {((((((((((_state_T_37 | _state_T_38) | _state_T_40) | _state_T_42) | _state_T_43) | _state_T_44) | _state_T_45) | _state_T_49) | _state_T_50) | _state_T_51) | _state_T_52) | _state_T_53, ((((((((((((_state_T_37 | _state_T_38) | _state_T_40) | _state_T_42) | _state_T_43) | _state_T_44) | _state_T_45) | _state_T_49) | _state_T_50) | _state_T_51) | _state_T_52) | _state_T_53) | _state_r_c_cat_T_96) | _state_r_c_cat_T_98, new_coh_state};
					is_hit_1 = ((((((_r_T_123 == 4'h3) | (_r_T_123 == 4'h2)) | (_r_T_123 == 4'h1)) | (_r_T_123 == 4'h7)) | (_r_T_123 == 4'h6)) | &_r_T_123) | (_r_T_123 == 4'he);
					if (_io_probe_rdy_T_4) begin
						if (~_GEN_32) begin
							if (_GEN_33) begin
								if (~_GEN_34)
									state <= 5'h0e;
							end
							else if (_rpq_io_empty | (_rpq_io_deq_valid & ~drain_load))
								state <= 5'h04;
						end
					end
					else if (_io_probe_rdy_T_8) begin
						if (io_meta_read_ready & io_meta_read_valid_0)
							state <= 5'h05;
					end
					else if (_GEN_3)
						state <= 5'h06;
					else if (_GEN_4)
						state <= (io_meta_resp_valid ? (&io_meta_resp_bits_coh_state ? 5'h07 : 5'h0b) : 5'h04);
					else if (_GEN_5) begin
						if (_GEN_30)
							state <= 5'h09;
					end
					else if (_GEN_6) begin
						if (io_wb_req_ready & io_wb_req_valid_0)
							state <= 5'h0a;
					end
					else if (_GEN_7) begin
						if (io_wb_resp)
							state <= 5'h0b;
					end
					else if (_GEN_8) begin
						if (_GEN_35 & (&refill_ctr))
							state <= 5'h0c;
					end
					else if (_GEN_11) begin
						if (_rpq_io_empty & ~_rpq_io_enq_valid_T_7)
							state <= 5'h0d;
					end
					else if (_sec_rdy_T_4) begin
						if (_GEN_30)
							state <= 5'h0e;
					end
					else if (_sec_rdy_T_5) begin
						if (_GEN_36)
							state <= 5'h0f;
					end
					else if (_sec_rdy_T_6)
						state <= (finish_to_prefetch ? 5'h11 : 5'h00);
					else if (_io_way_valid_T_1) begin
						if (_GEN_25)
							state <= 5'h00;
						else if (_rpq_io_enq_valid_T_1)
							state <= (is_hit_1 ? 5'h04 : 5'h01);
						else if (_rpq_io_enq_valid_T)
							state <= (io_req_tag_match & state_is_hit_1 ? 5'h0c : 5'h01);
					end
					if (_GEN_13) begin
						if (_GEN_41) begin
							if (&dirties_cat)
								new_coh_state <= _GEN_40[_r2_T * 2+:2];
							else
								new_coh_state <= _GEN_39[_r1_T * 2+:2];
						end
					end
					else if (_GEN_11) begin
						if (_GEN_17) begin : sv2v_autoblock_5
							reg [1:0] _r_T_91;
							reg [31:0] _GEN_42;
							_r_T_91 = {1'h0, _r_T_64 == 4'hc};
							_GEN_42 = {6'h3e, _r_T_91, _r_T_91, _r_T_91, _r_T_91, _r_T_91, 16'he9e4};
							new_coh_state <= _GEN_42[_r_T_64 * 2+:2];
						end
						else if (_GEN_41) begin
							if (&dirties_cat)
								new_coh_state <= _GEN_40[_r2_T * 2+:2];
							else
								new_coh_state <= _GEN_39[_r1_T * 2+:2];
						end
					end
					else if ((_GEN_21 | ~_io_way_valid_T_1) | _GEN_25) begin
						if (_GEN_41) begin
							if (&dirties_cat)
								new_coh_state <= _GEN_40[_r2_T * 2+:2];
							else
								new_coh_state <= _GEN_39[_r1_T * 2+:2];
						end
					end
					else if (_rpq_io_enq_valid_T_1) begin
						if (is_hit_1) begin : sv2v_autoblock_6
							reg [1:0] _r_T_150;
							reg [31:0] _GEN_43;
							_r_T_150 = {1'h0, _r_T_123 == 4'hc};
							_GEN_43 = {6'h3e, _r_T_150, _r_T_150, _r_T_150, _r_T_150, _r_T_150, 16'he9e4};
							new_coh_state <= _GEN_43[_r_T_123 * 2+:2];
						end
						else
							new_coh_state <= 2'h0;
					end
					else if (_rpq_io_enq_valid_T) begin : sv2v_autoblock_7
						reg [1:0] _state_r_T_86;
						reg [31:0] _GEN_44;
						_state_r_T_86 = {1'h0, _state_r_T_59 == 4'hc};
						_GEN_44 = {6'h3e, _state_r_T_86, _state_r_T_86, _state_r_T_86, _state_r_T_86, _state_r_T_86, 16'he9e4};
						new_coh_state <= (io_req_tag_match ? (state_is_hit_1 ? _GEN_44[_state_r_T_59 * 2+:2] : io_req_old_meta_coh_state) : 2'h0);
					end
					else if (_GEN_41) begin
						if (&dirties_cat)
							new_coh_state <= _GEN_40[_r2_T * 2+:2];
						else
							new_coh_state <= _GEN_39[_r1_T * 2+:2];
					end
				end
				if (_GEN_38)
					;
				else
					req_needs_wb <= &io_req_old_meta_coh_state;
			end
			else if (_rpq_io_enq_valid_T) begin : sv2v_autoblock_8
				reg [1:0] _state_r_T_27;
				reg [31:0] _GEN_45;
				_state_r_T_27 = {1'h0, _state_r_T == 4'hc};
				_GEN_45 = {6'h3e, _state_r_T_27, _state_r_T_27, _state_r_T_27, _state_r_T_27, _state_r_T_27, 16'he9e4};
				state <= (io_req_tag_match & state_is_hit ? 5'h0c : 5'h01);
				req_needs_wb <= &io_req_old_meta_coh_state;
				new_coh_state <= (io_req_tag_match ? (state_is_hit ? _GEN_45[_state_r_T * 2+:2] : io_req_old_meta_coh_state) : 2'h0);
			end
			else if (_GEN_41) begin
				if (&dirties_cat)
					new_coh_state <= _GEN_40[_r2_T * 2+:2];
				else
					new_coh_state <= _GEN_39[_r1_T * 2+:2];
			end
			if (_GEN_0) begin
				if (r_counter == 9'h000)
					r_counter <= r_beats1;
				else
					r_counter <= _r_counter1_T;
			end
			if (_GEN_30)
				meta_hazard <= 2'h1;
			else if (|meta_hazard)
				meta_hazard <= meta_hazard + 2'h1;
		end
		if ((|state ? (((~_GEN_24 & _io_way_valid_T_1) & ~_GEN_37) & _rpq_io_enq_valid_T) | _GEN_31 : _rpq_io_enq_valid_T | _GEN_31))
			req_uop_mem_cmd <= io_req_uop_mem_cmd;
		if (|state) begin
			if (_GEN_38)
				;
			else begin
				req_addr <= io_req_addr;
				req_old_meta_coh_state <= io_req_old_meta_coh_state;
				req_old_meta_tag <= io_req_old_meta_tag;
				req_way_en <= io_req_way_en;
			end
			if (~_io_probe_rdy_T_2) begin
				if (_io_probe_rdy_T_3) begin
					if (refill_done)
						grantack_valid <= io_mem_grant_bits_opcode[2] & ~io_mem_grant_bits_opcode[1];
				end
				else if (~_GEN_20) begin
					if (_sec_rdy_T_5)
						grantack_valid <= ~_GEN_36 & grantack_valid;
					else
						grantack_valid <= (((_sec_rdy_T_6 | ~_io_way_valid_T_1) | _GEN_37) | ~_rpq_io_enq_valid_T) & grantack_valid;
				end
			end
			if (~_GEN_10) begin
				if (_GEN_8) begin
					if (_GEN_35)
						refill_ctr <= refill_ctr + 3'h1;
				end
				else if (((_GEN_22 | ~_io_way_valid_T_1) | _GEN_37) | ~_rpq_io_enq_valid_T)
					;
				else
					refill_ctr <= 3'h0;
			end
		end
		else begin
			if (_rpq_io_enq_valid_T) begin
				req_addr <= io_req_addr;
				req_old_meta_coh_state <= io_req_old_meta_coh_state;
				req_old_meta_tag <= io_req_old_meta_tag;
				req_way_en <= io_req_way_en;
				refill_ctr <= 3'h0;
			end
			grantack_valid <= ~_rpq_io_enq_valid_T & grantack_valid;
		end
		if (_GEN_1 | ~(_io_probe_rdy_T_3 & refill_done))
			;
		else
			grantack_bits_sink <= io_mem_grant_bits_sink;
		if (~_GEN_1) begin
			if (_io_probe_rdy_T_3)
				commit_line <= ~refill_done & commit_line;
			else
				commit_line <= (_io_probe_rdy_T_4 & _GEN_32) | commit_line;
		end
		grant_had_data <= |state & (_io_probe_rdy_T_2 ? grant_had_data : (_io_probe_rdy_T_3 ? (_GEN_0 ? io_mem_grant_bits_opcode[0] : grant_had_data) : (((_GEN_23 | ~_io_way_valid_T_1) | _GEN_37) | ~_rpq_io_enq_valid_T) & grant_had_data));
		if (~_GEN_2) begin
			if (_io_probe_rdy_T_4)
				finish_to_prefetch <= (_GEN_32 | ~(_GEN_33 & ~_GEN_34)) & finish_to_prefetch;
			else
				finish_to_prefetch <= (_GEN_19 | ~(_sec_rdy_T_4 & _GEN_30)) & finish_to_prefetch;
		end
	end
	BranchKillableQueue_1 rpq(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_rpq_io_enq_ready),
		.io_enq_valid(_rpq_io_enq_valid_T_7),
		.io_enq_bits_uop_inst(io_req_uop_inst),
		.io_enq_bits_uop_debug_inst(io_req_uop_debug_inst),
		.io_enq_bits_uop_is_rvc(io_req_uop_is_rvc),
		.io_enq_bits_uop_debug_pc(io_req_uop_debug_pc),
		.io_enq_bits_uop_iq_type_0(io_req_uop_iq_type_0),
		.io_enq_bits_uop_iq_type_1(io_req_uop_iq_type_1),
		.io_enq_bits_uop_iq_type_2(io_req_uop_iq_type_2),
		.io_enq_bits_uop_iq_type_3(io_req_uop_iq_type_3),
		.io_enq_bits_uop_fu_code_0(io_req_uop_fu_code_0),
		.io_enq_bits_uop_fu_code_1(io_req_uop_fu_code_1),
		.io_enq_bits_uop_fu_code_2(io_req_uop_fu_code_2),
		.io_enq_bits_uop_fu_code_3(io_req_uop_fu_code_3),
		.io_enq_bits_uop_fu_code_4(io_req_uop_fu_code_4),
		.io_enq_bits_uop_fu_code_5(io_req_uop_fu_code_5),
		.io_enq_bits_uop_fu_code_6(io_req_uop_fu_code_6),
		.io_enq_bits_uop_fu_code_7(io_req_uop_fu_code_7),
		.io_enq_bits_uop_fu_code_8(io_req_uop_fu_code_8),
		.io_enq_bits_uop_fu_code_9(io_req_uop_fu_code_9),
		.io_enq_bits_uop_iw_issued(io_req_uop_iw_issued),
		.io_enq_bits_uop_iw_issued_partial_agen(io_req_uop_iw_issued_partial_agen),
		.io_enq_bits_uop_iw_issued_partial_dgen(io_req_uop_iw_issued_partial_dgen),
		.io_enq_bits_uop_iw_p1_speculative_child(io_req_uop_iw_p1_speculative_child),
		.io_enq_bits_uop_iw_p2_speculative_child(io_req_uop_iw_p2_speculative_child),
		.io_enq_bits_uop_iw_p1_bypass_hint(io_req_uop_iw_p1_bypass_hint),
		.io_enq_bits_uop_iw_p2_bypass_hint(io_req_uop_iw_p2_bypass_hint),
		.io_enq_bits_uop_iw_p3_bypass_hint(io_req_uop_iw_p3_bypass_hint),
		.io_enq_bits_uop_dis_col_sel(io_req_uop_dis_col_sel),
		.io_enq_bits_uop_br_mask(io_req_uop_br_mask),
		.io_enq_bits_uop_br_tag(io_req_uop_br_tag),
		.io_enq_bits_uop_br_type(io_req_uop_br_type),
		.io_enq_bits_uop_is_sfb(io_req_uop_is_sfb),
		.io_enq_bits_uop_is_fence(io_req_uop_is_fence),
		.io_enq_bits_uop_is_fencei(io_req_uop_is_fencei),
		.io_enq_bits_uop_is_sfence(io_req_uop_is_sfence),
		.io_enq_bits_uop_is_amo(io_req_uop_is_amo),
		.io_enq_bits_uop_is_eret(io_req_uop_is_eret),
		.io_enq_bits_uop_is_sys_pc2epc(io_req_uop_is_sys_pc2epc),
		.io_enq_bits_uop_is_rocc(io_req_uop_is_rocc),
		.io_enq_bits_uop_is_mov(io_req_uop_is_mov),
		.io_enq_bits_uop_ftq_idx(io_req_uop_ftq_idx),
		.io_enq_bits_uop_edge_inst(io_req_uop_edge_inst),
		.io_enq_bits_uop_pc_lob(io_req_uop_pc_lob),
		.io_enq_bits_uop_taken(io_req_uop_taken),
		.io_enq_bits_uop_imm_rename(io_req_uop_imm_rename),
		.io_enq_bits_uop_imm_sel(io_req_uop_imm_sel),
		.io_enq_bits_uop_pimm(io_req_uop_pimm),
		.io_enq_bits_uop_imm_packed(io_req_uop_imm_packed),
		.io_enq_bits_uop_op1_sel(io_req_uop_op1_sel),
		.io_enq_bits_uop_op2_sel(io_req_uop_op2_sel),
		.io_enq_bits_uop_fp_ctrl_ldst(io_req_uop_fp_ctrl_ldst),
		.io_enq_bits_uop_fp_ctrl_wen(io_req_uop_fp_ctrl_wen),
		.io_enq_bits_uop_fp_ctrl_ren1(io_req_uop_fp_ctrl_ren1),
		.io_enq_bits_uop_fp_ctrl_ren2(io_req_uop_fp_ctrl_ren2),
		.io_enq_bits_uop_fp_ctrl_ren3(io_req_uop_fp_ctrl_ren3),
		.io_enq_bits_uop_fp_ctrl_swap12(io_req_uop_fp_ctrl_swap12),
		.io_enq_bits_uop_fp_ctrl_swap23(io_req_uop_fp_ctrl_swap23),
		.io_enq_bits_uop_fp_ctrl_typeTagIn(io_req_uop_fp_ctrl_typeTagIn),
		.io_enq_bits_uop_fp_ctrl_typeTagOut(io_req_uop_fp_ctrl_typeTagOut),
		.io_enq_bits_uop_fp_ctrl_fromint(io_req_uop_fp_ctrl_fromint),
		.io_enq_bits_uop_fp_ctrl_toint(io_req_uop_fp_ctrl_toint),
		.io_enq_bits_uop_fp_ctrl_fastpipe(io_req_uop_fp_ctrl_fastpipe),
		.io_enq_bits_uop_fp_ctrl_fma(io_req_uop_fp_ctrl_fma),
		.io_enq_bits_uop_fp_ctrl_div(io_req_uop_fp_ctrl_div),
		.io_enq_bits_uop_fp_ctrl_sqrt(io_req_uop_fp_ctrl_sqrt),
		.io_enq_bits_uop_fp_ctrl_wflags(io_req_uop_fp_ctrl_wflags),
		.io_enq_bits_uop_fp_ctrl_vec(io_req_uop_fp_ctrl_vec),
		.io_enq_bits_uop_rob_idx(io_req_uop_rob_idx),
		.io_enq_bits_uop_ldq_idx(io_req_uop_ldq_idx),
		.io_enq_bits_uop_stq_idx(io_req_uop_stq_idx),
		.io_enq_bits_uop_rxq_idx(io_req_uop_rxq_idx),
		.io_enq_bits_uop_pdst(io_req_uop_pdst),
		.io_enq_bits_uop_prs1(io_req_uop_prs1),
		.io_enq_bits_uop_prs2(io_req_uop_prs2),
		.io_enq_bits_uop_prs3(io_req_uop_prs3),
		.io_enq_bits_uop_ppred(io_req_uop_ppred),
		.io_enq_bits_uop_prs1_busy(io_req_uop_prs1_busy),
		.io_enq_bits_uop_prs2_busy(io_req_uop_prs2_busy),
		.io_enq_bits_uop_prs3_busy(io_req_uop_prs3_busy),
		.io_enq_bits_uop_ppred_busy(io_req_uop_ppred_busy),
		.io_enq_bits_uop_stale_pdst(io_req_uop_stale_pdst),
		.io_enq_bits_uop_exception(io_req_uop_exception),
		.io_enq_bits_uop_exc_cause(io_req_uop_exc_cause),
		.io_enq_bits_uop_mem_cmd(io_req_uop_mem_cmd),
		.io_enq_bits_uop_mem_size(io_req_uop_mem_size),
		.io_enq_bits_uop_mem_signed(io_req_uop_mem_signed),
		.io_enq_bits_uop_uses_ldq(io_req_uop_uses_ldq),
		.io_enq_bits_uop_uses_stq(io_req_uop_uses_stq),
		.io_enq_bits_uop_is_unique(io_req_uop_is_unique),
		.io_enq_bits_uop_flush_on_commit(io_req_uop_flush_on_commit),
		.io_enq_bits_uop_csr_cmd(io_req_uop_csr_cmd),
		.io_enq_bits_uop_ldst_is_rs1(io_req_uop_ldst_is_rs1),
		.io_enq_bits_uop_ldst(io_req_uop_ldst),
		.io_enq_bits_uop_lrs1(io_req_uop_lrs1),
		.io_enq_bits_uop_lrs2(io_req_uop_lrs2),
		.io_enq_bits_uop_lrs3(io_req_uop_lrs3),
		.io_enq_bits_uop_dst_rtype(io_req_uop_dst_rtype),
		.io_enq_bits_uop_lrs1_rtype(io_req_uop_lrs1_rtype),
		.io_enq_bits_uop_lrs2_rtype(io_req_uop_lrs2_rtype),
		.io_enq_bits_uop_frs3_en(io_req_uop_frs3_en),
		.io_enq_bits_uop_fcn_dw(io_req_uop_fcn_dw),
		.io_enq_bits_uop_fcn_op(io_req_uop_fcn_op),
		.io_enq_bits_uop_fp_val(io_req_uop_fp_val),
		.io_enq_bits_uop_fp_rm(io_req_uop_fp_rm),
		.io_enq_bits_uop_fp_typ(io_req_uop_fp_typ),
		.io_enq_bits_uop_xcpt_pf_if(io_req_uop_xcpt_pf_if),
		.io_enq_bits_uop_xcpt_ae_if(io_req_uop_xcpt_ae_if),
		.io_enq_bits_uop_xcpt_ma_if(io_req_uop_xcpt_ma_if),
		.io_enq_bits_uop_bp_debug_if(io_req_uop_bp_debug_if),
		.io_enq_bits_uop_bp_xcpt_if(io_req_uop_bp_xcpt_if),
		.io_enq_bits_uop_debug_fsrc(io_req_uop_debug_fsrc),
		.io_enq_bits_uop_debug_tsrc(io_req_uop_debug_tsrc),
		.io_enq_bits_addr(io_req_addr),
		.io_enq_bits_data(io_req_data),
		.io_enq_bits_is_hella(io_req_is_hella),
		.io_enq_bits_tag_match(io_req_tag_match),
		.io_enq_bits_old_meta_coh_state(io_req_old_meta_coh_state),
		.io_enq_bits_old_meta_tag(io_req_old_meta_tag),
		.io_enq_bits_way_en(io_req_way_en),
		.io_enq_bits_sdq_id(io_req_sdq_id),
		.io_deq_ready(_GEN_15),
		.io_deq_valid(_rpq_io_deq_valid),
		.io_deq_bits_uop_inst(_rpq_io_deq_bits_uop_inst),
		.io_deq_bits_uop_debug_inst(_rpq_io_deq_bits_uop_debug_inst),
		.io_deq_bits_uop_is_rvc(_rpq_io_deq_bits_uop_is_rvc),
		.io_deq_bits_uop_debug_pc(_rpq_io_deq_bits_uop_debug_pc),
		.io_deq_bits_uop_iq_type_0(_rpq_io_deq_bits_uop_iq_type_0),
		.io_deq_bits_uop_iq_type_1(_rpq_io_deq_bits_uop_iq_type_1),
		.io_deq_bits_uop_iq_type_2(_rpq_io_deq_bits_uop_iq_type_2),
		.io_deq_bits_uop_iq_type_3(_rpq_io_deq_bits_uop_iq_type_3),
		.io_deq_bits_uop_fu_code_0(_rpq_io_deq_bits_uop_fu_code_0),
		.io_deq_bits_uop_fu_code_1(_rpq_io_deq_bits_uop_fu_code_1),
		.io_deq_bits_uop_fu_code_2(_rpq_io_deq_bits_uop_fu_code_2),
		.io_deq_bits_uop_fu_code_3(_rpq_io_deq_bits_uop_fu_code_3),
		.io_deq_bits_uop_fu_code_4(_rpq_io_deq_bits_uop_fu_code_4),
		.io_deq_bits_uop_fu_code_5(_rpq_io_deq_bits_uop_fu_code_5),
		.io_deq_bits_uop_fu_code_6(_rpq_io_deq_bits_uop_fu_code_6),
		.io_deq_bits_uop_fu_code_7(_rpq_io_deq_bits_uop_fu_code_7),
		.io_deq_bits_uop_fu_code_8(_rpq_io_deq_bits_uop_fu_code_8),
		.io_deq_bits_uop_fu_code_9(_rpq_io_deq_bits_uop_fu_code_9),
		.io_deq_bits_uop_iw_issued(_rpq_io_deq_bits_uop_iw_issued),
		.io_deq_bits_uop_iw_issued_partial_agen(_rpq_io_deq_bits_uop_iw_issued_partial_agen),
		.io_deq_bits_uop_iw_issued_partial_dgen(_rpq_io_deq_bits_uop_iw_issued_partial_dgen),
		.io_deq_bits_uop_iw_p1_speculative_child(_rpq_io_deq_bits_uop_iw_p1_speculative_child),
		.io_deq_bits_uop_iw_p2_speculative_child(_rpq_io_deq_bits_uop_iw_p2_speculative_child),
		.io_deq_bits_uop_iw_p1_bypass_hint(_rpq_io_deq_bits_uop_iw_p1_bypass_hint),
		.io_deq_bits_uop_iw_p2_bypass_hint(_rpq_io_deq_bits_uop_iw_p2_bypass_hint),
		.io_deq_bits_uop_iw_p3_bypass_hint(_rpq_io_deq_bits_uop_iw_p3_bypass_hint),
		.io_deq_bits_uop_dis_col_sel(_rpq_io_deq_bits_uop_dis_col_sel),
		.io_deq_bits_uop_br_mask(_rpq_io_deq_bits_uop_br_mask),
		.io_deq_bits_uop_br_tag(_rpq_io_deq_bits_uop_br_tag),
		.io_deq_bits_uop_br_type(_rpq_io_deq_bits_uop_br_type),
		.io_deq_bits_uop_is_sfb(_rpq_io_deq_bits_uop_is_sfb),
		.io_deq_bits_uop_is_fence(_rpq_io_deq_bits_uop_is_fence),
		.io_deq_bits_uop_is_fencei(_rpq_io_deq_bits_uop_is_fencei),
		.io_deq_bits_uop_is_sfence(_rpq_io_deq_bits_uop_is_sfence),
		.io_deq_bits_uop_is_amo(_rpq_io_deq_bits_uop_is_amo),
		.io_deq_bits_uop_is_eret(_rpq_io_deq_bits_uop_is_eret),
		.io_deq_bits_uop_is_sys_pc2epc(_rpq_io_deq_bits_uop_is_sys_pc2epc),
		.io_deq_bits_uop_is_rocc(_rpq_io_deq_bits_uop_is_rocc),
		.io_deq_bits_uop_is_mov(_rpq_io_deq_bits_uop_is_mov),
		.io_deq_bits_uop_ftq_idx(_rpq_io_deq_bits_uop_ftq_idx),
		.io_deq_bits_uop_edge_inst(_rpq_io_deq_bits_uop_edge_inst),
		.io_deq_bits_uop_pc_lob(_rpq_io_deq_bits_uop_pc_lob),
		.io_deq_bits_uop_taken(_rpq_io_deq_bits_uop_taken),
		.io_deq_bits_uop_imm_rename(_rpq_io_deq_bits_uop_imm_rename),
		.io_deq_bits_uop_imm_sel(_rpq_io_deq_bits_uop_imm_sel),
		.io_deq_bits_uop_pimm(_rpq_io_deq_bits_uop_pimm),
		.io_deq_bits_uop_imm_packed(_rpq_io_deq_bits_uop_imm_packed),
		.io_deq_bits_uop_op1_sel(_rpq_io_deq_bits_uop_op1_sel),
		.io_deq_bits_uop_op2_sel(_rpq_io_deq_bits_uop_op2_sel),
		.io_deq_bits_uop_fp_ctrl_ldst(_rpq_io_deq_bits_uop_fp_ctrl_ldst),
		.io_deq_bits_uop_fp_ctrl_wen(_rpq_io_deq_bits_uop_fp_ctrl_wen),
		.io_deq_bits_uop_fp_ctrl_ren1(_rpq_io_deq_bits_uop_fp_ctrl_ren1),
		.io_deq_bits_uop_fp_ctrl_ren2(_rpq_io_deq_bits_uop_fp_ctrl_ren2),
		.io_deq_bits_uop_fp_ctrl_ren3(_rpq_io_deq_bits_uop_fp_ctrl_ren3),
		.io_deq_bits_uop_fp_ctrl_swap12(_rpq_io_deq_bits_uop_fp_ctrl_swap12),
		.io_deq_bits_uop_fp_ctrl_swap23(_rpq_io_deq_bits_uop_fp_ctrl_swap23),
		.io_deq_bits_uop_fp_ctrl_typeTagIn(_rpq_io_deq_bits_uop_fp_ctrl_typeTagIn),
		.io_deq_bits_uop_fp_ctrl_typeTagOut(_rpq_io_deq_bits_uop_fp_ctrl_typeTagOut),
		.io_deq_bits_uop_fp_ctrl_fromint(_rpq_io_deq_bits_uop_fp_ctrl_fromint),
		.io_deq_bits_uop_fp_ctrl_toint(_rpq_io_deq_bits_uop_fp_ctrl_toint),
		.io_deq_bits_uop_fp_ctrl_fastpipe(_rpq_io_deq_bits_uop_fp_ctrl_fastpipe),
		.io_deq_bits_uop_fp_ctrl_fma(_rpq_io_deq_bits_uop_fp_ctrl_fma),
		.io_deq_bits_uop_fp_ctrl_div(_rpq_io_deq_bits_uop_fp_ctrl_div),
		.io_deq_bits_uop_fp_ctrl_sqrt(_rpq_io_deq_bits_uop_fp_ctrl_sqrt),
		.io_deq_bits_uop_fp_ctrl_wflags(_rpq_io_deq_bits_uop_fp_ctrl_wflags),
		.io_deq_bits_uop_fp_ctrl_vec(_rpq_io_deq_bits_uop_fp_ctrl_vec),
		.io_deq_bits_uop_rob_idx(_rpq_io_deq_bits_uop_rob_idx),
		.io_deq_bits_uop_ldq_idx(_rpq_io_deq_bits_uop_ldq_idx),
		.io_deq_bits_uop_stq_idx(_rpq_io_deq_bits_uop_stq_idx),
		.io_deq_bits_uop_rxq_idx(_rpq_io_deq_bits_uop_rxq_idx),
		.io_deq_bits_uop_pdst(_rpq_io_deq_bits_uop_pdst),
		.io_deq_bits_uop_prs1(_rpq_io_deq_bits_uop_prs1),
		.io_deq_bits_uop_prs2(_rpq_io_deq_bits_uop_prs2),
		.io_deq_bits_uop_prs3(_rpq_io_deq_bits_uop_prs3),
		.io_deq_bits_uop_ppred(_rpq_io_deq_bits_uop_ppred),
		.io_deq_bits_uop_prs1_busy(_rpq_io_deq_bits_uop_prs1_busy),
		.io_deq_bits_uop_prs2_busy(_rpq_io_deq_bits_uop_prs2_busy),
		.io_deq_bits_uop_prs3_busy(_rpq_io_deq_bits_uop_prs3_busy),
		.io_deq_bits_uop_ppred_busy(_rpq_io_deq_bits_uop_ppred_busy),
		.io_deq_bits_uop_stale_pdst(_rpq_io_deq_bits_uop_stale_pdst),
		.io_deq_bits_uop_exception(_rpq_io_deq_bits_uop_exception),
		.io_deq_bits_uop_exc_cause(_rpq_io_deq_bits_uop_exc_cause),
		.io_deq_bits_uop_mem_cmd(_rpq_io_deq_bits_uop_mem_cmd),
		.io_deq_bits_uop_mem_size(_rpq_io_deq_bits_uop_mem_size),
		.io_deq_bits_uop_mem_signed(_rpq_io_deq_bits_uop_mem_signed),
		.io_deq_bits_uop_uses_ldq(_rpq_io_deq_bits_uop_uses_ldq),
		.io_deq_bits_uop_uses_stq(_rpq_io_deq_bits_uop_uses_stq),
		.io_deq_bits_uop_is_unique(_rpq_io_deq_bits_uop_is_unique),
		.io_deq_bits_uop_flush_on_commit(_rpq_io_deq_bits_uop_flush_on_commit),
		.io_deq_bits_uop_csr_cmd(_rpq_io_deq_bits_uop_csr_cmd),
		.io_deq_bits_uop_ldst_is_rs1(_rpq_io_deq_bits_uop_ldst_is_rs1),
		.io_deq_bits_uop_ldst(_rpq_io_deq_bits_uop_ldst),
		.io_deq_bits_uop_lrs1(_rpq_io_deq_bits_uop_lrs1),
		.io_deq_bits_uop_lrs2(_rpq_io_deq_bits_uop_lrs2),
		.io_deq_bits_uop_lrs3(_rpq_io_deq_bits_uop_lrs3),
		.io_deq_bits_uop_dst_rtype(_rpq_io_deq_bits_uop_dst_rtype),
		.io_deq_bits_uop_lrs1_rtype(_rpq_io_deq_bits_uop_lrs1_rtype),
		.io_deq_bits_uop_lrs2_rtype(_rpq_io_deq_bits_uop_lrs2_rtype),
		.io_deq_bits_uop_frs3_en(_rpq_io_deq_bits_uop_frs3_en),
		.io_deq_bits_uop_fcn_dw(_rpq_io_deq_bits_uop_fcn_dw),
		.io_deq_bits_uop_fcn_op(_rpq_io_deq_bits_uop_fcn_op),
		.io_deq_bits_uop_fp_val(_rpq_io_deq_bits_uop_fp_val),
		.io_deq_bits_uop_fp_rm(_rpq_io_deq_bits_uop_fp_rm),
		.io_deq_bits_uop_fp_typ(_rpq_io_deq_bits_uop_fp_typ),
		.io_deq_bits_uop_xcpt_pf_if(_rpq_io_deq_bits_uop_xcpt_pf_if),
		.io_deq_bits_uop_xcpt_ae_if(_rpq_io_deq_bits_uop_xcpt_ae_if),
		.io_deq_bits_uop_xcpt_ma_if(_rpq_io_deq_bits_uop_xcpt_ma_if),
		.io_deq_bits_uop_bp_debug_if(_rpq_io_deq_bits_uop_bp_debug_if),
		.io_deq_bits_uop_bp_xcpt_if(_rpq_io_deq_bits_uop_bp_xcpt_if),
		.io_deq_bits_uop_debug_fsrc(_rpq_io_deq_bits_uop_debug_fsrc),
		.io_deq_bits_uop_debug_tsrc(_rpq_io_deq_bits_uop_debug_tsrc),
		.io_deq_bits_addr(_rpq_io_deq_bits_addr),
		.io_deq_bits_data(_rpq_io_deq_bits_data),
		.io_deq_bits_is_hella(_rpq_io_deq_bits_is_hella),
		.io_deq_bits_way_en(_rpq_io_deq_bits_way_en),
		.io_deq_bits_sdq_id(io_replay_bits_sdq_id),
		.io_brupdate_b1_resolve_mask(io_brupdate_b1_resolve_mask),
		.io_brupdate_b1_mispredict_mask(io_brupdate_b1_mispredict_mask),
		.io_flush(io_exception),
		.io_empty(_rpq_io_empty)
	);
	assign io_req_pri_rdy = io_req_pri_rdy_0;
	assign io_req_sec_rdy = io_req_sec_rdy_0;
	assign io_idx_valid = |state;
	assign io_idx_bits = req_addr[11:6];
	assign io_way_valid = ~(~(|state) | _io_way_valid_T_1);
	assign io_way_bits = req_way_en;
	assign io_tag_valid = |state;
	assign io_tag_bits = req_addr[39:12];
	assign io_mem_acquire_valid = io_mem_acquire_valid_0;
	assign io_mem_acquire_bits_param = {1'h0, _GEN[_grow_param_r_T * 2+:2]};
	assign io_mem_acquire_bits_source = io_wb_req_bits_source_0;
	assign io_mem_acquire_bits_address = {req_addr[31:6], 6'h00};
	assign io_mem_grant_ready = io_mem_grant_ready_0;
	assign io_mem_finish_valid = io_mem_finish_valid_0;
	assign io_mem_finish_bits_sink = grantack_bits_sink;
	assign io_refill_valid = io_refill_valid_0;
	assign io_refill_bits_way_en = req_way_en;
	assign io_refill_bits_addr = {req_addr[11:6], refill_ctr, 3'h0};
	assign io_refill_bits_data = io_lb_resp;
	assign io_meta_write_valid = io_meta_write_valid_0;
	assign io_meta_write_bits_idx = req_addr[11:6];
	assign io_meta_write_bits_way_en = req_way_en;
	assign io_meta_write_bits_data_coh_state = (((((~(|state) | _io_probe_rdy_T_2) | _io_probe_rdy_T_3) | _io_probe_rdy_T_4) | _GEN_19) | ~_sec_rdy_T_4 ? 2'h0 : new_coh_state);
	assign io_meta_write_bits_data_tag = req_addr[31:12];
	assign io_meta_read_valid = io_meta_read_valid_0;
	assign io_meta_read_bits_idx = req_addr[11:6];
	assign io_meta_read_bits_way_en = req_way_en;
	assign io_meta_read_bits_tag = req_addr[31:12];
	assign io_wb_req_valid = io_wb_req_valid_0;
	assign io_wb_req_bits_tag = req_old_meta_tag;
	assign io_wb_req_bits_idx = req_addr[11:6];
	assign io_wb_req_bits_source = io_wb_req_bits_source_0;
	assign io_wb_req_bits_param = (&req_old_meta_coh_state | (req_old_meta_coh_state == 2'h2) ? 3'h1 : (req_old_meta_coh_state == 2'h1 ? 3'h2 : (req_old_meta_coh_state == 2'h0 ? 3'h5 : 3'h0)));
	assign io_wb_req_bits_way_en = req_way_en;
	assign io_lb_read_offset = (((_GEN_2 | _io_probe_rdy_T_4) | _GEN_9) | ~_GEN_8 ? _rpq_io_deq_bits_addr[5:3] : refill_ctr);
	assign io_lb_write_valid = ((~_GEN_1 & _io_probe_rdy_T_3) & io_mem_grant_bits_opcode[0]) & io_mem_grant_valid;
	assign io_lb_write_bits_offset = r_beats1[2:0] & ~_r_counter1_T[2:0];
	assign io_lb_write_bits_data = io_mem_grant_bits_data;
	assign io_replay_valid = io_replay_valid_0;
	assign io_replay_bits_uop_inst = _rpq_io_deq_bits_uop_inst;
	assign io_replay_bits_uop_debug_inst = _rpq_io_deq_bits_uop_debug_inst;
	assign io_replay_bits_uop_is_rvc = _rpq_io_deq_bits_uop_is_rvc;
	assign io_replay_bits_uop_debug_pc = _rpq_io_deq_bits_uop_debug_pc;
	assign io_replay_bits_uop_iq_type_0 = _rpq_io_deq_bits_uop_iq_type_0;
	assign io_replay_bits_uop_iq_type_1 = _rpq_io_deq_bits_uop_iq_type_1;
	assign io_replay_bits_uop_iq_type_2 = _rpq_io_deq_bits_uop_iq_type_2;
	assign io_replay_bits_uop_iq_type_3 = _rpq_io_deq_bits_uop_iq_type_3;
	assign io_replay_bits_uop_fu_code_0 = _rpq_io_deq_bits_uop_fu_code_0;
	assign io_replay_bits_uop_fu_code_1 = _rpq_io_deq_bits_uop_fu_code_1;
	assign io_replay_bits_uop_fu_code_2 = _rpq_io_deq_bits_uop_fu_code_2;
	assign io_replay_bits_uop_fu_code_3 = _rpq_io_deq_bits_uop_fu_code_3;
	assign io_replay_bits_uop_fu_code_4 = _rpq_io_deq_bits_uop_fu_code_4;
	assign io_replay_bits_uop_fu_code_5 = _rpq_io_deq_bits_uop_fu_code_5;
	assign io_replay_bits_uop_fu_code_6 = _rpq_io_deq_bits_uop_fu_code_6;
	assign io_replay_bits_uop_fu_code_7 = _rpq_io_deq_bits_uop_fu_code_7;
	assign io_replay_bits_uop_fu_code_8 = _rpq_io_deq_bits_uop_fu_code_8;
	assign io_replay_bits_uop_fu_code_9 = _rpq_io_deq_bits_uop_fu_code_9;
	assign io_replay_bits_uop_iw_issued = _rpq_io_deq_bits_uop_iw_issued;
	assign io_replay_bits_uop_iw_issued_partial_agen = _rpq_io_deq_bits_uop_iw_issued_partial_agen;
	assign io_replay_bits_uop_iw_issued_partial_dgen = _rpq_io_deq_bits_uop_iw_issued_partial_dgen;
	assign io_replay_bits_uop_iw_p1_speculative_child = _rpq_io_deq_bits_uop_iw_p1_speculative_child;
	assign io_replay_bits_uop_iw_p2_speculative_child = _rpq_io_deq_bits_uop_iw_p2_speculative_child;
	assign io_replay_bits_uop_iw_p1_bypass_hint = _rpq_io_deq_bits_uop_iw_p1_bypass_hint;
	assign io_replay_bits_uop_iw_p2_bypass_hint = _rpq_io_deq_bits_uop_iw_p2_bypass_hint;
	assign io_replay_bits_uop_iw_p3_bypass_hint = _rpq_io_deq_bits_uop_iw_p3_bypass_hint;
	assign io_replay_bits_uop_dis_col_sel = _rpq_io_deq_bits_uop_dis_col_sel;
	assign io_replay_bits_uop_br_mask = _rpq_io_deq_bits_uop_br_mask;
	assign io_replay_bits_uop_br_tag = _rpq_io_deq_bits_uop_br_tag;
	assign io_replay_bits_uop_br_type = _rpq_io_deq_bits_uop_br_type;
	assign io_replay_bits_uop_is_sfb = _rpq_io_deq_bits_uop_is_sfb;
	assign io_replay_bits_uop_is_fence = _rpq_io_deq_bits_uop_is_fence;
	assign io_replay_bits_uop_is_fencei = _rpq_io_deq_bits_uop_is_fencei;
	assign io_replay_bits_uop_is_sfence = _rpq_io_deq_bits_uop_is_sfence;
	assign io_replay_bits_uop_is_amo = _rpq_io_deq_bits_uop_is_amo;
	assign io_replay_bits_uop_is_eret = _rpq_io_deq_bits_uop_is_eret;
	assign io_replay_bits_uop_is_sys_pc2epc = _rpq_io_deq_bits_uop_is_sys_pc2epc;
	assign io_replay_bits_uop_is_rocc = _rpq_io_deq_bits_uop_is_rocc;
	assign io_replay_bits_uop_is_mov = _rpq_io_deq_bits_uop_is_mov;
	assign io_replay_bits_uop_ftq_idx = _rpq_io_deq_bits_uop_ftq_idx;
	assign io_replay_bits_uop_edge_inst = _rpq_io_deq_bits_uop_edge_inst;
	assign io_replay_bits_uop_pc_lob = _rpq_io_deq_bits_uop_pc_lob;
	assign io_replay_bits_uop_taken = _rpq_io_deq_bits_uop_taken;
	assign io_replay_bits_uop_imm_rename = _rpq_io_deq_bits_uop_imm_rename;
	assign io_replay_bits_uop_imm_sel = _rpq_io_deq_bits_uop_imm_sel;
	assign io_replay_bits_uop_pimm = _rpq_io_deq_bits_uop_pimm;
	assign io_replay_bits_uop_imm_packed = _rpq_io_deq_bits_uop_imm_packed;
	assign io_replay_bits_uop_op1_sel = _rpq_io_deq_bits_uop_op1_sel;
	assign io_replay_bits_uop_op2_sel = _rpq_io_deq_bits_uop_op2_sel;
	assign io_replay_bits_uop_fp_ctrl_ldst = _rpq_io_deq_bits_uop_fp_ctrl_ldst;
	assign io_replay_bits_uop_fp_ctrl_wen = _rpq_io_deq_bits_uop_fp_ctrl_wen;
	assign io_replay_bits_uop_fp_ctrl_ren1 = _rpq_io_deq_bits_uop_fp_ctrl_ren1;
	assign io_replay_bits_uop_fp_ctrl_ren2 = _rpq_io_deq_bits_uop_fp_ctrl_ren2;
	assign io_replay_bits_uop_fp_ctrl_ren3 = _rpq_io_deq_bits_uop_fp_ctrl_ren3;
	assign io_replay_bits_uop_fp_ctrl_swap12 = _rpq_io_deq_bits_uop_fp_ctrl_swap12;
	assign io_replay_bits_uop_fp_ctrl_swap23 = _rpq_io_deq_bits_uop_fp_ctrl_swap23;
	assign io_replay_bits_uop_fp_ctrl_typeTagIn = _rpq_io_deq_bits_uop_fp_ctrl_typeTagIn;
	assign io_replay_bits_uop_fp_ctrl_typeTagOut = _rpq_io_deq_bits_uop_fp_ctrl_typeTagOut;
	assign io_replay_bits_uop_fp_ctrl_fromint = _rpq_io_deq_bits_uop_fp_ctrl_fromint;
	assign io_replay_bits_uop_fp_ctrl_toint = _rpq_io_deq_bits_uop_fp_ctrl_toint;
	assign io_replay_bits_uop_fp_ctrl_fastpipe = _rpq_io_deq_bits_uop_fp_ctrl_fastpipe;
	assign io_replay_bits_uop_fp_ctrl_fma = _rpq_io_deq_bits_uop_fp_ctrl_fma;
	assign io_replay_bits_uop_fp_ctrl_div = _rpq_io_deq_bits_uop_fp_ctrl_div;
	assign io_replay_bits_uop_fp_ctrl_sqrt = _rpq_io_deq_bits_uop_fp_ctrl_sqrt;
	assign io_replay_bits_uop_fp_ctrl_wflags = _rpq_io_deq_bits_uop_fp_ctrl_wflags;
	assign io_replay_bits_uop_fp_ctrl_vec = _rpq_io_deq_bits_uop_fp_ctrl_vec;
	assign io_replay_bits_uop_rob_idx = _rpq_io_deq_bits_uop_rob_idx;
	assign io_replay_bits_uop_ldq_idx = _rpq_io_deq_bits_uop_ldq_idx;
	assign io_replay_bits_uop_stq_idx = _rpq_io_deq_bits_uop_stq_idx;
	assign io_replay_bits_uop_rxq_idx = _rpq_io_deq_bits_uop_rxq_idx;
	assign io_replay_bits_uop_pdst = _rpq_io_deq_bits_uop_pdst;
	assign io_replay_bits_uop_prs1 = _rpq_io_deq_bits_uop_prs1;
	assign io_replay_bits_uop_prs2 = _rpq_io_deq_bits_uop_prs2;
	assign io_replay_bits_uop_prs3 = _rpq_io_deq_bits_uop_prs3;
	assign io_replay_bits_uop_ppred = _rpq_io_deq_bits_uop_ppred;
	assign io_replay_bits_uop_prs1_busy = _rpq_io_deq_bits_uop_prs1_busy;
	assign io_replay_bits_uop_prs2_busy = _rpq_io_deq_bits_uop_prs2_busy;
	assign io_replay_bits_uop_prs3_busy = _rpq_io_deq_bits_uop_prs3_busy;
	assign io_replay_bits_uop_ppred_busy = _rpq_io_deq_bits_uop_ppred_busy;
	assign io_replay_bits_uop_stale_pdst = _rpq_io_deq_bits_uop_stale_pdst;
	assign io_replay_bits_uop_exception = _rpq_io_deq_bits_uop_exception;
	assign io_replay_bits_uop_exc_cause = _rpq_io_deq_bits_uop_exc_cause;
	assign io_replay_bits_uop_mem_cmd = _rpq_io_deq_bits_uop_mem_cmd;
	assign io_replay_bits_uop_mem_size = _rpq_io_deq_bits_uop_mem_size;
	assign io_replay_bits_uop_mem_signed = _rpq_io_deq_bits_uop_mem_signed;
	assign io_replay_bits_uop_uses_ldq = _rpq_io_deq_bits_uop_uses_ldq;
	assign io_replay_bits_uop_uses_stq = _rpq_io_deq_bits_uop_uses_stq;
	assign io_replay_bits_uop_is_unique = _rpq_io_deq_bits_uop_is_unique;
	assign io_replay_bits_uop_flush_on_commit = _rpq_io_deq_bits_uop_flush_on_commit;
	assign io_replay_bits_uop_csr_cmd = _rpq_io_deq_bits_uop_csr_cmd;
	assign io_replay_bits_uop_ldst_is_rs1 = _rpq_io_deq_bits_uop_ldst_is_rs1;
	assign io_replay_bits_uop_ldst = _rpq_io_deq_bits_uop_ldst;
	assign io_replay_bits_uop_lrs1 = _rpq_io_deq_bits_uop_lrs1;
	assign io_replay_bits_uop_lrs2 = _rpq_io_deq_bits_uop_lrs2;
	assign io_replay_bits_uop_lrs3 = _rpq_io_deq_bits_uop_lrs3;
	assign io_replay_bits_uop_dst_rtype = _rpq_io_deq_bits_uop_dst_rtype;
	assign io_replay_bits_uop_lrs1_rtype = _rpq_io_deq_bits_uop_lrs1_rtype;
	assign io_replay_bits_uop_lrs2_rtype = _rpq_io_deq_bits_uop_lrs2_rtype;
	assign io_replay_bits_uop_frs3_en = _rpq_io_deq_bits_uop_frs3_en;
	assign io_replay_bits_uop_fcn_dw = _rpq_io_deq_bits_uop_fcn_dw;
	assign io_replay_bits_uop_fcn_op = _rpq_io_deq_bits_uop_fcn_op;
	assign io_replay_bits_uop_fp_val = _rpq_io_deq_bits_uop_fp_val;
	assign io_replay_bits_uop_fp_rm = _rpq_io_deq_bits_uop_fp_rm;
	assign io_replay_bits_uop_fp_typ = _rpq_io_deq_bits_uop_fp_typ;
	assign io_replay_bits_uop_xcpt_pf_if = _rpq_io_deq_bits_uop_xcpt_pf_if;
	assign io_replay_bits_uop_xcpt_ae_if = _rpq_io_deq_bits_uop_xcpt_ae_if;
	assign io_replay_bits_uop_xcpt_ma_if = _rpq_io_deq_bits_uop_xcpt_ma_if;
	assign io_replay_bits_uop_bp_debug_if = _rpq_io_deq_bits_uop_bp_debug_if;
	assign io_replay_bits_uop_bp_xcpt_if = _rpq_io_deq_bits_uop_bp_xcpt_if;
	assign io_replay_bits_uop_debug_fsrc = _rpq_io_deq_bits_uop_debug_fsrc;
	assign io_replay_bits_uop_debug_tsrc = _rpq_io_deq_bits_uop_debug_tsrc;
	assign io_replay_bits_addr = (_GEN_16 ? _rpq_io_deq_bits_addr : {req_addr[39:6], _rpq_io_deq_bits_addr[5:0]});
	assign io_replay_bits_is_hella = _rpq_io_deq_bits_is_hella;
	assign io_replay_bits_way_en = (_GEN_16 ? _rpq_io_deq_bits_way_en : req_way_en);
	assign io_resp_valid = ((~_GEN_2 & _io_probe_rdy_T_4) & _rpq_io_deq_valid) & drain_load;
	assign io_resp_bits_uop_inst = _rpq_io_deq_bits_uop_inst;
	assign io_resp_bits_uop_debug_inst = _rpq_io_deq_bits_uop_debug_inst;
	assign io_resp_bits_uop_is_rvc = _rpq_io_deq_bits_uop_is_rvc;
	assign io_resp_bits_uop_debug_pc = _rpq_io_deq_bits_uop_debug_pc;
	assign io_resp_bits_uop_iq_type_0 = _rpq_io_deq_bits_uop_iq_type_0;
	assign io_resp_bits_uop_iq_type_1 = _rpq_io_deq_bits_uop_iq_type_1;
	assign io_resp_bits_uop_iq_type_2 = _rpq_io_deq_bits_uop_iq_type_2;
	assign io_resp_bits_uop_iq_type_3 = _rpq_io_deq_bits_uop_iq_type_3;
	assign io_resp_bits_uop_fu_code_0 = _rpq_io_deq_bits_uop_fu_code_0;
	assign io_resp_bits_uop_fu_code_1 = _rpq_io_deq_bits_uop_fu_code_1;
	assign io_resp_bits_uop_fu_code_2 = _rpq_io_deq_bits_uop_fu_code_2;
	assign io_resp_bits_uop_fu_code_3 = _rpq_io_deq_bits_uop_fu_code_3;
	assign io_resp_bits_uop_fu_code_4 = _rpq_io_deq_bits_uop_fu_code_4;
	assign io_resp_bits_uop_fu_code_5 = _rpq_io_deq_bits_uop_fu_code_5;
	assign io_resp_bits_uop_fu_code_6 = _rpq_io_deq_bits_uop_fu_code_6;
	assign io_resp_bits_uop_fu_code_7 = _rpq_io_deq_bits_uop_fu_code_7;
	assign io_resp_bits_uop_fu_code_8 = _rpq_io_deq_bits_uop_fu_code_8;
	assign io_resp_bits_uop_fu_code_9 = _rpq_io_deq_bits_uop_fu_code_9;
	assign io_resp_bits_uop_iw_issued = _rpq_io_deq_bits_uop_iw_issued;
	assign io_resp_bits_uop_iw_issued_partial_agen = _rpq_io_deq_bits_uop_iw_issued_partial_agen;
	assign io_resp_bits_uop_iw_issued_partial_dgen = _rpq_io_deq_bits_uop_iw_issued_partial_dgen;
	assign io_resp_bits_uop_iw_p1_speculative_child = _rpq_io_deq_bits_uop_iw_p1_speculative_child;
	assign io_resp_bits_uop_iw_p2_speculative_child = _rpq_io_deq_bits_uop_iw_p2_speculative_child;
	assign io_resp_bits_uop_iw_p1_bypass_hint = _rpq_io_deq_bits_uop_iw_p1_bypass_hint;
	assign io_resp_bits_uop_iw_p2_bypass_hint = _rpq_io_deq_bits_uop_iw_p2_bypass_hint;
	assign io_resp_bits_uop_iw_p3_bypass_hint = _rpq_io_deq_bits_uop_iw_p3_bypass_hint;
	assign io_resp_bits_uop_dis_col_sel = _rpq_io_deq_bits_uop_dis_col_sel;
	assign io_resp_bits_uop_br_mask = _rpq_io_deq_bits_uop_br_mask;
	assign io_resp_bits_uop_br_tag = _rpq_io_deq_bits_uop_br_tag;
	assign io_resp_bits_uop_br_type = _rpq_io_deq_bits_uop_br_type;
	assign io_resp_bits_uop_is_sfb = _rpq_io_deq_bits_uop_is_sfb;
	assign io_resp_bits_uop_is_fence = _rpq_io_deq_bits_uop_is_fence;
	assign io_resp_bits_uop_is_fencei = _rpq_io_deq_bits_uop_is_fencei;
	assign io_resp_bits_uop_is_sfence = _rpq_io_deq_bits_uop_is_sfence;
	assign io_resp_bits_uop_is_amo = _rpq_io_deq_bits_uop_is_amo;
	assign io_resp_bits_uop_is_eret = _rpq_io_deq_bits_uop_is_eret;
	assign io_resp_bits_uop_is_sys_pc2epc = _rpq_io_deq_bits_uop_is_sys_pc2epc;
	assign io_resp_bits_uop_is_rocc = _rpq_io_deq_bits_uop_is_rocc;
	assign io_resp_bits_uop_is_mov = _rpq_io_deq_bits_uop_is_mov;
	assign io_resp_bits_uop_ftq_idx = _rpq_io_deq_bits_uop_ftq_idx;
	assign io_resp_bits_uop_edge_inst = _rpq_io_deq_bits_uop_edge_inst;
	assign io_resp_bits_uop_pc_lob = _rpq_io_deq_bits_uop_pc_lob;
	assign io_resp_bits_uop_taken = _rpq_io_deq_bits_uop_taken;
	assign io_resp_bits_uop_imm_rename = _rpq_io_deq_bits_uop_imm_rename;
	assign io_resp_bits_uop_imm_sel = _rpq_io_deq_bits_uop_imm_sel;
	assign io_resp_bits_uop_pimm = _rpq_io_deq_bits_uop_pimm;
	assign io_resp_bits_uop_imm_packed = _rpq_io_deq_bits_uop_imm_packed;
	assign io_resp_bits_uop_op1_sel = _rpq_io_deq_bits_uop_op1_sel;
	assign io_resp_bits_uop_op2_sel = _rpq_io_deq_bits_uop_op2_sel;
	assign io_resp_bits_uop_fp_ctrl_ldst = _rpq_io_deq_bits_uop_fp_ctrl_ldst;
	assign io_resp_bits_uop_fp_ctrl_wen = _rpq_io_deq_bits_uop_fp_ctrl_wen;
	assign io_resp_bits_uop_fp_ctrl_ren1 = _rpq_io_deq_bits_uop_fp_ctrl_ren1;
	assign io_resp_bits_uop_fp_ctrl_ren2 = _rpq_io_deq_bits_uop_fp_ctrl_ren2;
	assign io_resp_bits_uop_fp_ctrl_ren3 = _rpq_io_deq_bits_uop_fp_ctrl_ren3;
	assign io_resp_bits_uop_fp_ctrl_swap12 = _rpq_io_deq_bits_uop_fp_ctrl_swap12;
	assign io_resp_bits_uop_fp_ctrl_swap23 = _rpq_io_deq_bits_uop_fp_ctrl_swap23;
	assign io_resp_bits_uop_fp_ctrl_typeTagIn = _rpq_io_deq_bits_uop_fp_ctrl_typeTagIn;
	assign io_resp_bits_uop_fp_ctrl_typeTagOut = _rpq_io_deq_bits_uop_fp_ctrl_typeTagOut;
	assign io_resp_bits_uop_fp_ctrl_fromint = _rpq_io_deq_bits_uop_fp_ctrl_fromint;
	assign io_resp_bits_uop_fp_ctrl_toint = _rpq_io_deq_bits_uop_fp_ctrl_toint;
	assign io_resp_bits_uop_fp_ctrl_fastpipe = _rpq_io_deq_bits_uop_fp_ctrl_fastpipe;
	assign io_resp_bits_uop_fp_ctrl_fma = _rpq_io_deq_bits_uop_fp_ctrl_fma;
	assign io_resp_bits_uop_fp_ctrl_div = _rpq_io_deq_bits_uop_fp_ctrl_div;
	assign io_resp_bits_uop_fp_ctrl_sqrt = _rpq_io_deq_bits_uop_fp_ctrl_sqrt;
	assign io_resp_bits_uop_fp_ctrl_wflags = _rpq_io_deq_bits_uop_fp_ctrl_wflags;
	assign io_resp_bits_uop_fp_ctrl_vec = _rpq_io_deq_bits_uop_fp_ctrl_vec;
	assign io_resp_bits_uop_rob_idx = _rpq_io_deq_bits_uop_rob_idx;
	assign io_resp_bits_uop_ldq_idx = _rpq_io_deq_bits_uop_ldq_idx;
	assign io_resp_bits_uop_stq_idx = _rpq_io_deq_bits_uop_stq_idx;
	assign io_resp_bits_uop_rxq_idx = _rpq_io_deq_bits_uop_rxq_idx;
	assign io_resp_bits_uop_pdst = _rpq_io_deq_bits_uop_pdst;
	assign io_resp_bits_uop_prs1 = _rpq_io_deq_bits_uop_prs1;
	assign io_resp_bits_uop_prs2 = _rpq_io_deq_bits_uop_prs2;
	assign io_resp_bits_uop_prs3 = _rpq_io_deq_bits_uop_prs3;
	assign io_resp_bits_uop_ppred = _rpq_io_deq_bits_uop_ppred;
	assign io_resp_bits_uop_prs1_busy = _rpq_io_deq_bits_uop_prs1_busy;
	assign io_resp_bits_uop_prs2_busy = _rpq_io_deq_bits_uop_prs2_busy;
	assign io_resp_bits_uop_prs3_busy = _rpq_io_deq_bits_uop_prs3_busy;
	assign io_resp_bits_uop_ppred_busy = _rpq_io_deq_bits_uop_ppred_busy;
	assign io_resp_bits_uop_stale_pdst = _rpq_io_deq_bits_uop_stale_pdst;
	assign io_resp_bits_uop_exception = _rpq_io_deq_bits_uop_exception;
	assign io_resp_bits_uop_exc_cause = _rpq_io_deq_bits_uop_exc_cause;
	assign io_resp_bits_uop_mem_cmd = _rpq_io_deq_bits_uop_mem_cmd;
	assign io_resp_bits_uop_mem_size = _rpq_io_deq_bits_uop_mem_size;
	assign io_resp_bits_uop_mem_signed = _rpq_io_deq_bits_uop_mem_signed;
	assign io_resp_bits_uop_uses_ldq = _rpq_io_deq_bits_uop_uses_ldq;
	assign io_resp_bits_uop_uses_stq = _rpq_io_deq_bits_uop_uses_stq;
	assign io_resp_bits_uop_is_unique = _rpq_io_deq_bits_uop_is_unique;
	assign io_resp_bits_uop_flush_on_commit = _rpq_io_deq_bits_uop_flush_on_commit;
	assign io_resp_bits_uop_csr_cmd = _rpq_io_deq_bits_uop_csr_cmd;
	assign io_resp_bits_uop_ldst_is_rs1 = _rpq_io_deq_bits_uop_ldst_is_rs1;
	assign io_resp_bits_uop_ldst = _rpq_io_deq_bits_uop_ldst;
	assign io_resp_bits_uop_lrs1 = _rpq_io_deq_bits_uop_lrs1;
	assign io_resp_bits_uop_lrs2 = _rpq_io_deq_bits_uop_lrs2;
	assign io_resp_bits_uop_lrs3 = _rpq_io_deq_bits_uop_lrs3;
	assign io_resp_bits_uop_dst_rtype = _rpq_io_deq_bits_uop_dst_rtype;
	assign io_resp_bits_uop_lrs1_rtype = _rpq_io_deq_bits_uop_lrs1_rtype;
	assign io_resp_bits_uop_lrs2_rtype = _rpq_io_deq_bits_uop_lrs2_rtype;
	assign io_resp_bits_uop_frs3_en = _rpq_io_deq_bits_uop_frs3_en;
	assign io_resp_bits_uop_fcn_dw = _rpq_io_deq_bits_uop_fcn_dw;
	assign io_resp_bits_uop_fcn_op = _rpq_io_deq_bits_uop_fcn_op;
	assign io_resp_bits_uop_fp_val = _rpq_io_deq_bits_uop_fp_val;
	assign io_resp_bits_uop_fp_rm = _rpq_io_deq_bits_uop_fp_rm;
	assign io_resp_bits_uop_fp_typ = _rpq_io_deq_bits_uop_fp_typ;
	assign io_resp_bits_uop_xcpt_pf_if = _rpq_io_deq_bits_uop_xcpt_pf_if;
	assign io_resp_bits_uop_xcpt_ae_if = _rpq_io_deq_bits_uop_xcpt_ae_if;
	assign io_resp_bits_uop_xcpt_ma_if = _rpq_io_deq_bits_uop_xcpt_ma_if;
	assign io_resp_bits_uop_bp_debug_if = _rpq_io_deq_bits_uop_bp_debug_if;
	assign io_resp_bits_uop_bp_xcpt_if = _rpq_io_deq_bits_uop_bp_xcpt_if;
	assign io_resp_bits_uop_debug_fsrc = _rpq_io_deq_bits_uop_debug_fsrc;
	assign io_resp_bits_uop_debug_tsrc = _rpq_io_deq_bits_uop_debug_tsrc;
	assign io_resp_bits_data = (_GEN_2 | ~_io_probe_rdy_T_4 ? _rpq_io_deq_bits_data : {(_rpq_io_deq_bits_uop_mem_size == 2'h0 ? {56 {_rpq_io_deq_bits_uop_mem_signed & io_resp_bits_data_zeroed_2[7]}} : {(_rpq_io_deq_bits_uop_mem_size == 2'h1 ? {48 {_rpq_io_deq_bits_uop_mem_signed & io_resp_bits_data_zeroed_1[15]}} : {(_rpq_io_deq_bits_uop_mem_size == 2'h2 ? {32 {_rpq_io_deq_bits_uop_mem_signed & io_resp_bits_data_zeroed[31]}} : io_lb_resp[63:32]), io_resp_bits_data_zeroed[31:16]}), io_resp_bits_data_zeroed_1[15:8]}), io_resp_bits_data_zeroed_2});
	assign io_resp_bits_is_hella = _rpq_io_deq_bits_is_hella;
	assign io_probe_rdy = ~(|meta_hazard) & ((((~(|state) | _io_probe_rdy_T_2) | _io_probe_rdy_T_3) | _io_probe_rdy_T_4) | (_io_probe_rdy_T_8 & grantack_valid));
endmodule
