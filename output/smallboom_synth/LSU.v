module LSU (
	clock,
	reset,
	io_ptw_req_ready,
	io_ptw_req_valid,
	io_ptw_req_bits_valid,
	io_ptw_req_bits_bits_addr,
	io_ptw_resp_valid,
	io_ptw_resp_bits_ae_final,
	io_ptw_resp_bits_pte_ppn,
	io_ptw_resp_bits_pte_d,
	io_ptw_resp_bits_pte_a,
	io_ptw_resp_bits_pte_g,
	io_ptw_resp_bits_pte_u,
	io_ptw_resp_bits_pte_x,
	io_ptw_resp_bits_pte_w,
	io_ptw_resp_bits_pte_r,
	io_ptw_resp_bits_pte_v,
	io_ptw_resp_bits_level,
	io_ptw_resp_bits_homogeneous,
	io_ptw_ptbr_mode,
	io_ptw_status_dprv,
	io_ptw_status_mxr,
	io_ptw_status_sum,
	io_ptw_pmp_0_cfg_l,
	io_ptw_pmp_0_cfg_a,
	io_ptw_pmp_0_cfg_x,
	io_ptw_pmp_0_cfg_w,
	io_ptw_pmp_0_cfg_r,
	io_ptw_pmp_0_addr,
	io_ptw_pmp_0_mask,
	io_ptw_pmp_1_cfg_l,
	io_ptw_pmp_1_cfg_a,
	io_ptw_pmp_1_cfg_x,
	io_ptw_pmp_1_cfg_w,
	io_ptw_pmp_1_cfg_r,
	io_ptw_pmp_1_addr,
	io_ptw_pmp_1_mask,
	io_ptw_pmp_2_cfg_l,
	io_ptw_pmp_2_cfg_a,
	io_ptw_pmp_2_cfg_x,
	io_ptw_pmp_2_cfg_w,
	io_ptw_pmp_2_cfg_r,
	io_ptw_pmp_2_addr,
	io_ptw_pmp_2_mask,
	io_ptw_pmp_3_cfg_l,
	io_ptw_pmp_3_cfg_a,
	io_ptw_pmp_3_cfg_x,
	io_ptw_pmp_3_cfg_w,
	io_ptw_pmp_3_cfg_r,
	io_ptw_pmp_3_addr,
	io_ptw_pmp_3_mask,
	io_ptw_pmp_4_cfg_l,
	io_ptw_pmp_4_cfg_a,
	io_ptw_pmp_4_cfg_x,
	io_ptw_pmp_4_cfg_w,
	io_ptw_pmp_4_cfg_r,
	io_ptw_pmp_4_addr,
	io_ptw_pmp_4_mask,
	io_ptw_pmp_5_cfg_l,
	io_ptw_pmp_5_cfg_a,
	io_ptw_pmp_5_cfg_x,
	io_ptw_pmp_5_cfg_w,
	io_ptw_pmp_5_cfg_r,
	io_ptw_pmp_5_addr,
	io_ptw_pmp_5_mask,
	io_ptw_pmp_6_cfg_l,
	io_ptw_pmp_6_cfg_a,
	io_ptw_pmp_6_cfg_x,
	io_ptw_pmp_6_cfg_w,
	io_ptw_pmp_6_cfg_r,
	io_ptw_pmp_6_addr,
	io_ptw_pmp_6_mask,
	io_ptw_pmp_7_cfg_l,
	io_ptw_pmp_7_cfg_a,
	io_ptw_pmp_7_cfg_x,
	io_ptw_pmp_7_cfg_w,
	io_ptw_pmp_7_cfg_r,
	io_ptw_pmp_7_addr,
	io_ptw_pmp_7_mask,
	io_core_agen_0_valid,
	io_core_agen_0_bits_uop_br_mask,
	io_core_agen_0_bits_uop_ldq_idx,
	io_core_agen_0_bits_uop_stq_idx,
	io_core_agen_0_bits_uop_pdst,
	io_core_agen_0_bits_uop_uses_ldq,
	io_core_agen_0_bits_uop_uses_stq,
	io_core_agen_0_bits_uop_dst_rtype,
	io_core_agen_0_bits_uop_fp_val,
	io_core_agen_0_bits_data,
	io_core_dgen_0_valid,
	io_core_dgen_0_bits_uop_stq_idx,
	io_core_dgen_0_bits_data,
	io_core_dgen_1_valid,
	io_core_dgen_1_bits_uop_stq_idx,
	io_core_dgen_1_bits_data,
	io_core_dgen_2_valid,
	io_core_dgen_2_bits_uop_stq_idx,
	io_core_dgen_2_bits_data,
	io_core_iwakeups_0_valid,
	io_core_iwakeups_0_bits_uop_pdst,
	io_core_iwakeups_0_bits_uop_dst_rtype,
	io_core_iwakeups_0_bits_bypassable,
	io_core_iwakeups_0_bits_rebusy,
	io_core_iresp_0_valid,
	io_core_iresp_0_bits_uop_br_mask,
	io_core_iresp_0_bits_uop_rob_idx,
	io_core_iresp_0_bits_uop_pdst,
	io_core_iresp_0_bits_data,
	io_core_fresp_0_valid,
	io_core_fresp_0_bits_uop_br_mask,
	io_core_fresp_0_bits_uop_rob_idx,
	io_core_fresp_0_bits_uop_pdst,
	io_core_fresp_0_bits_uop_mem_size,
	io_core_fresp_0_bits_uop_dst_rtype,
	io_core_fresp_0_bits_data,
	io_core_sfence_valid,
	io_core_sfence_bits_rs1,
	io_core_sfence_bits_rs2,
	io_core_sfence_bits_addr,
	io_core_dis_uops_0_valid,
	io_core_dis_uops_0_bits_inst,
	io_core_dis_uops_0_bits_debug_inst,
	io_core_dis_uops_0_bits_is_rvc,
	io_core_dis_uops_0_bits_debug_pc,
	io_core_dis_uops_0_bits_iq_type_0,
	io_core_dis_uops_0_bits_iq_type_1,
	io_core_dis_uops_0_bits_iq_type_2,
	io_core_dis_uops_0_bits_iq_type_3,
	io_core_dis_uops_0_bits_fu_code_0,
	io_core_dis_uops_0_bits_fu_code_1,
	io_core_dis_uops_0_bits_fu_code_2,
	io_core_dis_uops_0_bits_fu_code_3,
	io_core_dis_uops_0_bits_fu_code_4,
	io_core_dis_uops_0_bits_fu_code_5,
	io_core_dis_uops_0_bits_fu_code_6,
	io_core_dis_uops_0_bits_fu_code_7,
	io_core_dis_uops_0_bits_fu_code_8,
	io_core_dis_uops_0_bits_fu_code_9,
	io_core_dis_uops_0_bits_iw_issued,
	io_core_dis_uops_0_bits_iw_issued_partial_agen,
	io_core_dis_uops_0_bits_iw_issued_partial_dgen,
	io_core_dis_uops_0_bits_iw_p1_speculative_child,
	io_core_dis_uops_0_bits_iw_p2_speculative_child,
	io_core_dis_uops_0_bits_iw_p1_bypass_hint,
	io_core_dis_uops_0_bits_iw_p2_bypass_hint,
	io_core_dis_uops_0_bits_iw_p3_bypass_hint,
	io_core_dis_uops_0_bits_br_mask,
	io_core_dis_uops_0_bits_br_tag,
	io_core_dis_uops_0_bits_br_type,
	io_core_dis_uops_0_bits_is_sfb,
	io_core_dis_uops_0_bits_is_fence,
	io_core_dis_uops_0_bits_is_fencei,
	io_core_dis_uops_0_bits_is_sfence,
	io_core_dis_uops_0_bits_is_amo,
	io_core_dis_uops_0_bits_is_eret,
	io_core_dis_uops_0_bits_is_sys_pc2epc,
	io_core_dis_uops_0_bits_is_rocc,
	io_core_dis_uops_0_bits_is_mov,
	io_core_dis_uops_0_bits_ftq_idx,
	io_core_dis_uops_0_bits_edge_inst,
	io_core_dis_uops_0_bits_pc_lob,
	io_core_dis_uops_0_bits_taken,
	io_core_dis_uops_0_bits_imm_rename,
	io_core_dis_uops_0_bits_imm_sel,
	io_core_dis_uops_0_bits_pimm,
	io_core_dis_uops_0_bits_imm_packed,
	io_core_dis_uops_0_bits_op1_sel,
	io_core_dis_uops_0_bits_op2_sel,
	io_core_dis_uops_0_bits_fp_ctrl_ldst,
	io_core_dis_uops_0_bits_fp_ctrl_wen,
	io_core_dis_uops_0_bits_fp_ctrl_ren1,
	io_core_dis_uops_0_bits_fp_ctrl_ren2,
	io_core_dis_uops_0_bits_fp_ctrl_ren3,
	io_core_dis_uops_0_bits_fp_ctrl_swap12,
	io_core_dis_uops_0_bits_fp_ctrl_swap23,
	io_core_dis_uops_0_bits_fp_ctrl_typeTagIn,
	io_core_dis_uops_0_bits_fp_ctrl_typeTagOut,
	io_core_dis_uops_0_bits_fp_ctrl_fromint,
	io_core_dis_uops_0_bits_fp_ctrl_toint,
	io_core_dis_uops_0_bits_fp_ctrl_fastpipe,
	io_core_dis_uops_0_bits_fp_ctrl_fma,
	io_core_dis_uops_0_bits_fp_ctrl_div,
	io_core_dis_uops_0_bits_fp_ctrl_sqrt,
	io_core_dis_uops_0_bits_fp_ctrl_wflags,
	io_core_dis_uops_0_bits_fp_ctrl_vec,
	io_core_dis_uops_0_bits_rob_idx,
	io_core_dis_uops_0_bits_ldq_idx,
	io_core_dis_uops_0_bits_stq_idx,
	io_core_dis_uops_0_bits_rxq_idx,
	io_core_dis_uops_0_bits_pdst,
	io_core_dis_uops_0_bits_prs1,
	io_core_dis_uops_0_bits_prs2,
	io_core_dis_uops_0_bits_prs3,
	io_core_dis_uops_0_bits_ppred,
	io_core_dis_uops_0_bits_prs1_busy,
	io_core_dis_uops_0_bits_prs2_busy,
	io_core_dis_uops_0_bits_prs3_busy,
	io_core_dis_uops_0_bits_ppred_busy,
	io_core_dis_uops_0_bits_stale_pdst,
	io_core_dis_uops_0_bits_exception,
	io_core_dis_uops_0_bits_exc_cause,
	io_core_dis_uops_0_bits_mem_cmd,
	io_core_dis_uops_0_bits_mem_size,
	io_core_dis_uops_0_bits_mem_signed,
	io_core_dis_uops_0_bits_uses_ldq,
	io_core_dis_uops_0_bits_uses_stq,
	io_core_dis_uops_0_bits_is_unique,
	io_core_dis_uops_0_bits_flush_on_commit,
	io_core_dis_uops_0_bits_csr_cmd,
	io_core_dis_uops_0_bits_ldst_is_rs1,
	io_core_dis_uops_0_bits_ldst,
	io_core_dis_uops_0_bits_lrs1,
	io_core_dis_uops_0_bits_lrs2,
	io_core_dis_uops_0_bits_lrs3,
	io_core_dis_uops_0_bits_dst_rtype,
	io_core_dis_uops_0_bits_lrs1_rtype,
	io_core_dis_uops_0_bits_lrs2_rtype,
	io_core_dis_uops_0_bits_frs3_en,
	io_core_dis_uops_0_bits_fcn_dw,
	io_core_dis_uops_0_bits_fcn_op,
	io_core_dis_uops_0_bits_fp_val,
	io_core_dis_uops_0_bits_fp_rm,
	io_core_dis_uops_0_bits_fp_typ,
	io_core_dis_uops_0_bits_xcpt_pf_if,
	io_core_dis_uops_0_bits_xcpt_ae_if,
	io_core_dis_uops_0_bits_xcpt_ma_if,
	io_core_dis_uops_0_bits_bp_debug_if,
	io_core_dis_uops_0_bits_bp_xcpt_if,
	io_core_dis_uops_0_bits_debug_fsrc,
	io_core_dis_uops_0_bits_debug_tsrc,
	io_core_dis_ldq_idx_0,
	io_core_dis_stq_idx_0,
	io_core_ldq_full_0,
	io_core_stq_full_0,
	io_core_commit_valids_0,
	io_core_commit_uops_0_uses_ldq,
	io_core_commit_uops_0_uses_stq,
	io_core_commit_load_at_rob_head,
	io_core_clr_bsy_0_valid,
	io_core_clr_bsy_0_bits,
	io_core_clr_unsafe_0_valid,
	io_core_clr_unsafe_0_bits,
	io_core_fence_dmem,
	io_core_brupdate_b1_resolve_mask,
	io_core_brupdate_b1_mispredict_mask,
	io_core_brupdate_b2_uop_ldq_idx,
	io_core_brupdate_b2_uop_stq_idx,
	io_core_brupdate_b2_mispredict,
	io_core_rob_head_idx,
	io_core_exception,
	io_core_fencei_rdy,
	io_core_lxcpt_valid,
	io_core_lxcpt_bits_uop_br_mask,
	io_core_lxcpt_bits_uop_rob_idx,
	io_core_lxcpt_bits_cause,
	io_core_lxcpt_bits_badvaddr,
	io_core_perf_acquire,
	io_core_perf_release,
	io_core_perf_tlbMiss,
	io_dmem_req_ready,
	io_dmem_req_valid,
	io_dmem_req_bits_0_valid,
	io_dmem_req_bits_0_bits_uop_inst,
	io_dmem_req_bits_0_bits_uop_debug_inst,
	io_dmem_req_bits_0_bits_uop_is_rvc,
	io_dmem_req_bits_0_bits_uop_debug_pc,
	io_dmem_req_bits_0_bits_uop_iq_type_0,
	io_dmem_req_bits_0_bits_uop_iq_type_1,
	io_dmem_req_bits_0_bits_uop_iq_type_2,
	io_dmem_req_bits_0_bits_uop_iq_type_3,
	io_dmem_req_bits_0_bits_uop_fu_code_0,
	io_dmem_req_bits_0_bits_uop_fu_code_1,
	io_dmem_req_bits_0_bits_uop_fu_code_2,
	io_dmem_req_bits_0_bits_uop_fu_code_3,
	io_dmem_req_bits_0_bits_uop_fu_code_4,
	io_dmem_req_bits_0_bits_uop_fu_code_5,
	io_dmem_req_bits_0_bits_uop_fu_code_6,
	io_dmem_req_bits_0_bits_uop_fu_code_7,
	io_dmem_req_bits_0_bits_uop_fu_code_8,
	io_dmem_req_bits_0_bits_uop_fu_code_9,
	io_dmem_req_bits_0_bits_uop_iw_issued,
	io_dmem_req_bits_0_bits_uop_iw_issued_partial_agen,
	io_dmem_req_bits_0_bits_uop_iw_issued_partial_dgen,
	io_dmem_req_bits_0_bits_uop_iw_p1_speculative_child,
	io_dmem_req_bits_0_bits_uop_iw_p2_speculative_child,
	io_dmem_req_bits_0_bits_uop_iw_p1_bypass_hint,
	io_dmem_req_bits_0_bits_uop_iw_p2_bypass_hint,
	io_dmem_req_bits_0_bits_uop_iw_p3_bypass_hint,
	io_dmem_req_bits_0_bits_uop_dis_col_sel,
	io_dmem_req_bits_0_bits_uop_br_mask,
	io_dmem_req_bits_0_bits_uop_br_tag,
	io_dmem_req_bits_0_bits_uop_br_type,
	io_dmem_req_bits_0_bits_uop_is_sfb,
	io_dmem_req_bits_0_bits_uop_is_fence,
	io_dmem_req_bits_0_bits_uop_is_fencei,
	io_dmem_req_bits_0_bits_uop_is_sfence,
	io_dmem_req_bits_0_bits_uop_is_amo,
	io_dmem_req_bits_0_bits_uop_is_eret,
	io_dmem_req_bits_0_bits_uop_is_sys_pc2epc,
	io_dmem_req_bits_0_bits_uop_is_rocc,
	io_dmem_req_bits_0_bits_uop_is_mov,
	io_dmem_req_bits_0_bits_uop_ftq_idx,
	io_dmem_req_bits_0_bits_uop_edge_inst,
	io_dmem_req_bits_0_bits_uop_pc_lob,
	io_dmem_req_bits_0_bits_uop_taken,
	io_dmem_req_bits_0_bits_uop_imm_rename,
	io_dmem_req_bits_0_bits_uop_imm_sel,
	io_dmem_req_bits_0_bits_uop_pimm,
	io_dmem_req_bits_0_bits_uop_imm_packed,
	io_dmem_req_bits_0_bits_uop_op1_sel,
	io_dmem_req_bits_0_bits_uop_op2_sel,
	io_dmem_req_bits_0_bits_uop_fp_ctrl_ldst,
	io_dmem_req_bits_0_bits_uop_fp_ctrl_wen,
	io_dmem_req_bits_0_bits_uop_fp_ctrl_ren1,
	io_dmem_req_bits_0_bits_uop_fp_ctrl_ren2,
	io_dmem_req_bits_0_bits_uop_fp_ctrl_ren3,
	io_dmem_req_bits_0_bits_uop_fp_ctrl_swap12,
	io_dmem_req_bits_0_bits_uop_fp_ctrl_swap23,
	io_dmem_req_bits_0_bits_uop_fp_ctrl_typeTagIn,
	io_dmem_req_bits_0_bits_uop_fp_ctrl_typeTagOut,
	io_dmem_req_bits_0_bits_uop_fp_ctrl_fromint,
	io_dmem_req_bits_0_bits_uop_fp_ctrl_toint,
	io_dmem_req_bits_0_bits_uop_fp_ctrl_fastpipe,
	io_dmem_req_bits_0_bits_uop_fp_ctrl_fma,
	io_dmem_req_bits_0_bits_uop_fp_ctrl_div,
	io_dmem_req_bits_0_bits_uop_fp_ctrl_sqrt,
	io_dmem_req_bits_0_bits_uop_fp_ctrl_wflags,
	io_dmem_req_bits_0_bits_uop_fp_ctrl_vec,
	io_dmem_req_bits_0_bits_uop_rob_idx,
	io_dmem_req_bits_0_bits_uop_ldq_idx,
	io_dmem_req_bits_0_bits_uop_stq_idx,
	io_dmem_req_bits_0_bits_uop_rxq_idx,
	io_dmem_req_bits_0_bits_uop_pdst,
	io_dmem_req_bits_0_bits_uop_prs1,
	io_dmem_req_bits_0_bits_uop_prs2,
	io_dmem_req_bits_0_bits_uop_prs3,
	io_dmem_req_bits_0_bits_uop_ppred,
	io_dmem_req_bits_0_bits_uop_prs1_busy,
	io_dmem_req_bits_0_bits_uop_prs2_busy,
	io_dmem_req_bits_0_bits_uop_prs3_busy,
	io_dmem_req_bits_0_bits_uop_ppred_busy,
	io_dmem_req_bits_0_bits_uop_stale_pdst,
	io_dmem_req_bits_0_bits_uop_exception,
	io_dmem_req_bits_0_bits_uop_exc_cause,
	io_dmem_req_bits_0_bits_uop_mem_cmd,
	io_dmem_req_bits_0_bits_uop_mem_size,
	io_dmem_req_bits_0_bits_uop_mem_signed,
	io_dmem_req_bits_0_bits_uop_uses_ldq,
	io_dmem_req_bits_0_bits_uop_uses_stq,
	io_dmem_req_bits_0_bits_uop_is_unique,
	io_dmem_req_bits_0_bits_uop_flush_on_commit,
	io_dmem_req_bits_0_bits_uop_csr_cmd,
	io_dmem_req_bits_0_bits_uop_ldst_is_rs1,
	io_dmem_req_bits_0_bits_uop_ldst,
	io_dmem_req_bits_0_bits_uop_lrs1,
	io_dmem_req_bits_0_bits_uop_lrs2,
	io_dmem_req_bits_0_bits_uop_lrs3,
	io_dmem_req_bits_0_bits_uop_dst_rtype,
	io_dmem_req_bits_0_bits_uop_lrs1_rtype,
	io_dmem_req_bits_0_bits_uop_lrs2_rtype,
	io_dmem_req_bits_0_bits_uop_frs3_en,
	io_dmem_req_bits_0_bits_uop_fcn_dw,
	io_dmem_req_bits_0_bits_uop_fcn_op,
	io_dmem_req_bits_0_bits_uop_fp_val,
	io_dmem_req_bits_0_bits_uop_fp_rm,
	io_dmem_req_bits_0_bits_uop_fp_typ,
	io_dmem_req_bits_0_bits_uop_xcpt_pf_if,
	io_dmem_req_bits_0_bits_uop_xcpt_ae_if,
	io_dmem_req_bits_0_bits_uop_xcpt_ma_if,
	io_dmem_req_bits_0_bits_uop_bp_debug_if,
	io_dmem_req_bits_0_bits_uop_bp_xcpt_if,
	io_dmem_req_bits_0_bits_uop_debug_fsrc,
	io_dmem_req_bits_0_bits_uop_debug_tsrc,
	io_dmem_req_bits_0_bits_addr,
	io_dmem_req_bits_0_bits_data,
	io_dmem_req_bits_0_bits_is_hella,
	io_dmem_s1_kill_0,
	io_dmem_resp_0_valid,
	io_dmem_resp_0_bits_uop_is_amo,
	io_dmem_resp_0_bits_uop_ldq_idx,
	io_dmem_resp_0_bits_uop_stq_idx,
	io_dmem_resp_0_bits_uop_uses_ldq,
	io_dmem_resp_0_bits_uop_uses_stq,
	io_dmem_resp_0_bits_data,
	io_dmem_resp_0_bits_is_hella,
	io_dmem_store_ack_0_valid,
	io_dmem_store_ack_0_bits_uop_stq_idx,
	io_dmem_store_ack_0_bits_is_hella,
	io_dmem_nack_0_valid,
	io_dmem_nack_0_bits_uop_ldq_idx,
	io_dmem_nack_0_bits_uop_stq_idx,
	io_dmem_nack_0_bits_uop_mem_size,
	io_dmem_nack_0_bits_uop_uses_ldq,
	io_dmem_nack_0_bits_uop_uses_stq,
	io_dmem_nack_0_bits_addr,
	io_dmem_nack_0_bits_is_hella,
	io_dmem_ll_resp_ready,
	io_dmem_ll_resp_valid,
	io_dmem_ll_resp_bits_uop_is_amo,
	io_dmem_ll_resp_bits_uop_ldq_idx,
	io_dmem_ll_resp_bits_uop_stq_idx,
	io_dmem_ll_resp_bits_uop_uses_ldq,
	io_dmem_ll_resp_bits_uop_uses_stq,
	io_dmem_ll_resp_bits_data,
	io_dmem_ll_resp_bits_is_hella,
	io_dmem_brupdate_b1_resolve_mask,
	io_dmem_brupdate_b1_mispredict_mask,
	io_dmem_exception,
	io_dmem_release_ready,
	io_dmem_release_valid,
	io_dmem_release_bits_address,
	io_dmem_force_order,
	io_dmem_ordered,
	io_dmem_perf_acquire,
	io_dmem_perf_release,
	io_hellacache_req_ready,
	io_hellacache_req_valid,
	io_hellacache_req_bits_addr,
	io_hellacache_s1_kill,
	io_hellacache_s2_nack,
	io_hellacache_resp_valid,
	io_hellacache_resp_bits_data,
	io_hellacache_s2_xcpt_ae_ld
);
	input clock;
	input reset;
	input io_ptw_req_ready;
	output wire io_ptw_req_valid;
	output wire io_ptw_req_bits_valid;
	output wire [26:0] io_ptw_req_bits_bits_addr;
	input io_ptw_resp_valid;
	input io_ptw_resp_bits_ae_final;
	input [43:0] io_ptw_resp_bits_pte_ppn;
	input io_ptw_resp_bits_pte_d;
	input io_ptw_resp_bits_pte_a;
	input io_ptw_resp_bits_pte_g;
	input io_ptw_resp_bits_pte_u;
	input io_ptw_resp_bits_pte_x;
	input io_ptw_resp_bits_pte_w;
	input io_ptw_resp_bits_pte_r;
	input io_ptw_resp_bits_pte_v;
	input [1:0] io_ptw_resp_bits_level;
	input io_ptw_resp_bits_homogeneous;
	input [3:0] io_ptw_ptbr_mode;
	input [1:0] io_ptw_status_dprv;
	input io_ptw_status_mxr;
	input io_ptw_status_sum;
	input io_ptw_pmp_0_cfg_l;
	input [1:0] io_ptw_pmp_0_cfg_a;
	input io_ptw_pmp_0_cfg_x;
	input io_ptw_pmp_0_cfg_w;
	input io_ptw_pmp_0_cfg_r;
	input [29:0] io_ptw_pmp_0_addr;
	input [31:0] io_ptw_pmp_0_mask;
	input io_ptw_pmp_1_cfg_l;
	input [1:0] io_ptw_pmp_1_cfg_a;
	input io_ptw_pmp_1_cfg_x;
	input io_ptw_pmp_1_cfg_w;
	input io_ptw_pmp_1_cfg_r;
	input [29:0] io_ptw_pmp_1_addr;
	input [31:0] io_ptw_pmp_1_mask;
	input io_ptw_pmp_2_cfg_l;
	input [1:0] io_ptw_pmp_2_cfg_a;
	input io_ptw_pmp_2_cfg_x;
	input io_ptw_pmp_2_cfg_w;
	input io_ptw_pmp_2_cfg_r;
	input [29:0] io_ptw_pmp_2_addr;
	input [31:0] io_ptw_pmp_2_mask;
	input io_ptw_pmp_3_cfg_l;
	input [1:0] io_ptw_pmp_3_cfg_a;
	input io_ptw_pmp_3_cfg_x;
	input io_ptw_pmp_3_cfg_w;
	input io_ptw_pmp_3_cfg_r;
	input [29:0] io_ptw_pmp_3_addr;
	input [31:0] io_ptw_pmp_3_mask;
	input io_ptw_pmp_4_cfg_l;
	input [1:0] io_ptw_pmp_4_cfg_a;
	input io_ptw_pmp_4_cfg_x;
	input io_ptw_pmp_4_cfg_w;
	input io_ptw_pmp_4_cfg_r;
	input [29:0] io_ptw_pmp_4_addr;
	input [31:0] io_ptw_pmp_4_mask;
	input io_ptw_pmp_5_cfg_l;
	input [1:0] io_ptw_pmp_5_cfg_a;
	input io_ptw_pmp_5_cfg_x;
	input io_ptw_pmp_5_cfg_w;
	input io_ptw_pmp_5_cfg_r;
	input [29:0] io_ptw_pmp_5_addr;
	input [31:0] io_ptw_pmp_5_mask;
	input io_ptw_pmp_6_cfg_l;
	input [1:0] io_ptw_pmp_6_cfg_a;
	input io_ptw_pmp_6_cfg_x;
	input io_ptw_pmp_6_cfg_w;
	input io_ptw_pmp_6_cfg_r;
	input [29:0] io_ptw_pmp_6_addr;
	input [31:0] io_ptw_pmp_6_mask;
	input io_ptw_pmp_7_cfg_l;
	input [1:0] io_ptw_pmp_7_cfg_a;
	input io_ptw_pmp_7_cfg_x;
	input io_ptw_pmp_7_cfg_w;
	input io_ptw_pmp_7_cfg_r;
	input [29:0] io_ptw_pmp_7_addr;
	input [31:0] io_ptw_pmp_7_mask;
	input io_core_agen_0_valid;
	input [7:0] io_core_agen_0_bits_uop_br_mask;
	input [3:0] io_core_agen_0_bits_uop_ldq_idx;
	input [3:0] io_core_agen_0_bits_uop_stq_idx;
	input [5:0] io_core_agen_0_bits_uop_pdst;
	input io_core_agen_0_bits_uop_uses_ldq;
	input io_core_agen_0_bits_uop_uses_stq;
	input [1:0] io_core_agen_0_bits_uop_dst_rtype;
	input io_core_agen_0_bits_uop_fp_val;
	input [63:0] io_core_agen_0_bits_data;
	input io_core_dgen_0_valid;
	input [3:0] io_core_dgen_0_bits_uop_stq_idx;
	input [63:0] io_core_dgen_0_bits_data;
	input io_core_dgen_1_valid;
	input [3:0] io_core_dgen_1_bits_uop_stq_idx;
	input [63:0] io_core_dgen_1_bits_data;
	input io_core_dgen_2_valid;
	input [3:0] io_core_dgen_2_bits_uop_stq_idx;
	input [63:0] io_core_dgen_2_bits_data;
	output wire io_core_iwakeups_0_valid;
	output wire [5:0] io_core_iwakeups_0_bits_uop_pdst;
	output wire [1:0] io_core_iwakeups_0_bits_uop_dst_rtype;
	output wire io_core_iwakeups_0_bits_bypassable;
	output wire io_core_iwakeups_0_bits_rebusy;
	output wire io_core_iresp_0_valid;
	output wire [7:0] io_core_iresp_0_bits_uop_br_mask;
	output wire [4:0] io_core_iresp_0_bits_uop_rob_idx;
	output wire [5:0] io_core_iresp_0_bits_uop_pdst;
	output wire [63:0] io_core_iresp_0_bits_data;
	output wire io_core_fresp_0_valid;
	output wire [7:0] io_core_fresp_0_bits_uop_br_mask;
	output wire [4:0] io_core_fresp_0_bits_uop_rob_idx;
	output wire [5:0] io_core_fresp_0_bits_uop_pdst;
	output wire [1:0] io_core_fresp_0_bits_uop_mem_size;
	output wire [1:0] io_core_fresp_0_bits_uop_dst_rtype;
	output wire [63:0] io_core_fresp_0_bits_data;
	input io_core_sfence_valid;
	input io_core_sfence_bits_rs1;
	input io_core_sfence_bits_rs2;
	input [38:0] io_core_sfence_bits_addr;
	input io_core_dis_uops_0_valid;
	input [31:0] io_core_dis_uops_0_bits_inst;
	input [31:0] io_core_dis_uops_0_bits_debug_inst;
	input io_core_dis_uops_0_bits_is_rvc;
	input [39:0] io_core_dis_uops_0_bits_debug_pc;
	input io_core_dis_uops_0_bits_iq_type_0;
	input io_core_dis_uops_0_bits_iq_type_1;
	input io_core_dis_uops_0_bits_iq_type_2;
	input io_core_dis_uops_0_bits_iq_type_3;
	input io_core_dis_uops_0_bits_fu_code_0;
	input io_core_dis_uops_0_bits_fu_code_1;
	input io_core_dis_uops_0_bits_fu_code_2;
	input io_core_dis_uops_0_bits_fu_code_3;
	input io_core_dis_uops_0_bits_fu_code_4;
	input io_core_dis_uops_0_bits_fu_code_5;
	input io_core_dis_uops_0_bits_fu_code_6;
	input io_core_dis_uops_0_bits_fu_code_7;
	input io_core_dis_uops_0_bits_fu_code_8;
	input io_core_dis_uops_0_bits_fu_code_9;
	input io_core_dis_uops_0_bits_iw_issued;
	input io_core_dis_uops_0_bits_iw_issued_partial_agen;
	input io_core_dis_uops_0_bits_iw_issued_partial_dgen;
	input io_core_dis_uops_0_bits_iw_p1_speculative_child;
	input io_core_dis_uops_0_bits_iw_p2_speculative_child;
	input io_core_dis_uops_0_bits_iw_p1_bypass_hint;
	input io_core_dis_uops_0_bits_iw_p2_bypass_hint;
	input io_core_dis_uops_0_bits_iw_p3_bypass_hint;
	input [7:0] io_core_dis_uops_0_bits_br_mask;
	input [2:0] io_core_dis_uops_0_bits_br_tag;
	input [3:0] io_core_dis_uops_0_bits_br_type;
	input io_core_dis_uops_0_bits_is_sfb;
	input io_core_dis_uops_0_bits_is_fence;
	input io_core_dis_uops_0_bits_is_fencei;
	input io_core_dis_uops_0_bits_is_sfence;
	input io_core_dis_uops_0_bits_is_amo;
	input io_core_dis_uops_0_bits_is_eret;
	input io_core_dis_uops_0_bits_is_sys_pc2epc;
	input io_core_dis_uops_0_bits_is_rocc;
	input io_core_dis_uops_0_bits_is_mov;
	input [3:0] io_core_dis_uops_0_bits_ftq_idx;
	input io_core_dis_uops_0_bits_edge_inst;
	input [5:0] io_core_dis_uops_0_bits_pc_lob;
	input io_core_dis_uops_0_bits_taken;
	input io_core_dis_uops_0_bits_imm_rename;
	input [2:0] io_core_dis_uops_0_bits_imm_sel;
	input [4:0] io_core_dis_uops_0_bits_pimm;
	input [19:0] io_core_dis_uops_0_bits_imm_packed;
	input [1:0] io_core_dis_uops_0_bits_op1_sel;
	input [2:0] io_core_dis_uops_0_bits_op2_sel;
	input io_core_dis_uops_0_bits_fp_ctrl_ldst;
	input io_core_dis_uops_0_bits_fp_ctrl_wen;
	input io_core_dis_uops_0_bits_fp_ctrl_ren1;
	input io_core_dis_uops_0_bits_fp_ctrl_ren2;
	input io_core_dis_uops_0_bits_fp_ctrl_ren3;
	input io_core_dis_uops_0_bits_fp_ctrl_swap12;
	input io_core_dis_uops_0_bits_fp_ctrl_swap23;
	input [1:0] io_core_dis_uops_0_bits_fp_ctrl_typeTagIn;
	input [1:0] io_core_dis_uops_0_bits_fp_ctrl_typeTagOut;
	input io_core_dis_uops_0_bits_fp_ctrl_fromint;
	input io_core_dis_uops_0_bits_fp_ctrl_toint;
	input io_core_dis_uops_0_bits_fp_ctrl_fastpipe;
	input io_core_dis_uops_0_bits_fp_ctrl_fma;
	input io_core_dis_uops_0_bits_fp_ctrl_div;
	input io_core_dis_uops_0_bits_fp_ctrl_sqrt;
	input io_core_dis_uops_0_bits_fp_ctrl_wflags;
	input io_core_dis_uops_0_bits_fp_ctrl_vec;
	input [4:0] io_core_dis_uops_0_bits_rob_idx;
	input [3:0] io_core_dis_uops_0_bits_ldq_idx;
	input [3:0] io_core_dis_uops_0_bits_stq_idx;
	input [1:0] io_core_dis_uops_0_bits_rxq_idx;
	input [5:0] io_core_dis_uops_0_bits_pdst;
	input [5:0] io_core_dis_uops_0_bits_prs1;
	input [5:0] io_core_dis_uops_0_bits_prs2;
	input [5:0] io_core_dis_uops_0_bits_prs3;
	input [3:0] io_core_dis_uops_0_bits_ppred;
	input io_core_dis_uops_0_bits_prs1_busy;
	input io_core_dis_uops_0_bits_prs2_busy;
	input io_core_dis_uops_0_bits_prs3_busy;
	input io_core_dis_uops_0_bits_ppred_busy;
	input [5:0] io_core_dis_uops_0_bits_stale_pdst;
	input io_core_dis_uops_0_bits_exception;
	input [63:0] io_core_dis_uops_0_bits_exc_cause;
	input [4:0] io_core_dis_uops_0_bits_mem_cmd;
	input [1:0] io_core_dis_uops_0_bits_mem_size;
	input io_core_dis_uops_0_bits_mem_signed;
	input io_core_dis_uops_0_bits_uses_ldq;
	input io_core_dis_uops_0_bits_uses_stq;
	input io_core_dis_uops_0_bits_is_unique;
	input io_core_dis_uops_0_bits_flush_on_commit;
	input [2:0] io_core_dis_uops_0_bits_csr_cmd;
	input io_core_dis_uops_0_bits_ldst_is_rs1;
	input [5:0] io_core_dis_uops_0_bits_ldst;
	input [5:0] io_core_dis_uops_0_bits_lrs1;
	input [5:0] io_core_dis_uops_0_bits_lrs2;
	input [5:0] io_core_dis_uops_0_bits_lrs3;
	input [1:0] io_core_dis_uops_0_bits_dst_rtype;
	input [1:0] io_core_dis_uops_0_bits_lrs1_rtype;
	input [1:0] io_core_dis_uops_0_bits_lrs2_rtype;
	input io_core_dis_uops_0_bits_frs3_en;
	input io_core_dis_uops_0_bits_fcn_dw;
	input [4:0] io_core_dis_uops_0_bits_fcn_op;
	input io_core_dis_uops_0_bits_fp_val;
	input [2:0] io_core_dis_uops_0_bits_fp_rm;
	input [1:0] io_core_dis_uops_0_bits_fp_typ;
	input io_core_dis_uops_0_bits_xcpt_pf_if;
	input io_core_dis_uops_0_bits_xcpt_ae_if;
	input io_core_dis_uops_0_bits_xcpt_ma_if;
	input io_core_dis_uops_0_bits_bp_debug_if;
	input io_core_dis_uops_0_bits_bp_xcpt_if;
	input [2:0] io_core_dis_uops_0_bits_debug_fsrc;
	input [2:0] io_core_dis_uops_0_bits_debug_tsrc;
	output wire [3:0] io_core_dis_ldq_idx_0;
	output wire [3:0] io_core_dis_stq_idx_0;
	output wire io_core_ldq_full_0;
	output wire io_core_stq_full_0;
	input io_core_commit_valids_0;
	input io_core_commit_uops_0_uses_ldq;
	input io_core_commit_uops_0_uses_stq;
	input io_core_commit_load_at_rob_head;
	output wire io_core_clr_bsy_0_valid;
	output wire [4:0] io_core_clr_bsy_0_bits;
	output wire io_core_clr_unsafe_0_valid;
	output wire [4:0] io_core_clr_unsafe_0_bits;
	input io_core_fence_dmem;
	input [7:0] io_core_brupdate_b1_resolve_mask;
	input [7:0] io_core_brupdate_b1_mispredict_mask;
	input [3:0] io_core_brupdate_b2_uop_ldq_idx;
	input [3:0] io_core_brupdate_b2_uop_stq_idx;
	input io_core_brupdate_b2_mispredict;
	input [4:0] io_core_rob_head_idx;
	input io_core_exception;
	output wire io_core_fencei_rdy;
	output wire io_core_lxcpt_valid;
	output wire [7:0] io_core_lxcpt_bits_uop_br_mask;
	output wire [4:0] io_core_lxcpt_bits_uop_rob_idx;
	output wire [4:0] io_core_lxcpt_bits_cause;
	output wire [39:0] io_core_lxcpt_bits_badvaddr;
	output wire io_core_perf_acquire;
	output wire io_core_perf_release;
	output wire io_core_perf_tlbMiss;
	input io_dmem_req_ready;
	output wire io_dmem_req_valid;
	output wire io_dmem_req_bits_0_valid;
	output wire [31:0] io_dmem_req_bits_0_bits_uop_inst;
	output wire [31:0] io_dmem_req_bits_0_bits_uop_debug_inst;
	output wire io_dmem_req_bits_0_bits_uop_is_rvc;
	output wire [39:0] io_dmem_req_bits_0_bits_uop_debug_pc;
	output wire io_dmem_req_bits_0_bits_uop_iq_type_0;
	output wire io_dmem_req_bits_0_bits_uop_iq_type_1;
	output wire io_dmem_req_bits_0_bits_uop_iq_type_2;
	output wire io_dmem_req_bits_0_bits_uop_iq_type_3;
	output wire io_dmem_req_bits_0_bits_uop_fu_code_0;
	output wire io_dmem_req_bits_0_bits_uop_fu_code_1;
	output wire io_dmem_req_bits_0_bits_uop_fu_code_2;
	output wire io_dmem_req_bits_0_bits_uop_fu_code_3;
	output wire io_dmem_req_bits_0_bits_uop_fu_code_4;
	output wire io_dmem_req_bits_0_bits_uop_fu_code_5;
	output wire io_dmem_req_bits_0_bits_uop_fu_code_6;
	output wire io_dmem_req_bits_0_bits_uop_fu_code_7;
	output wire io_dmem_req_bits_0_bits_uop_fu_code_8;
	output wire io_dmem_req_bits_0_bits_uop_fu_code_9;
	output wire io_dmem_req_bits_0_bits_uop_iw_issued;
	output wire io_dmem_req_bits_0_bits_uop_iw_issued_partial_agen;
	output wire io_dmem_req_bits_0_bits_uop_iw_issued_partial_dgen;
	output wire io_dmem_req_bits_0_bits_uop_iw_p1_speculative_child;
	output wire io_dmem_req_bits_0_bits_uop_iw_p2_speculative_child;
	output wire io_dmem_req_bits_0_bits_uop_iw_p1_bypass_hint;
	output wire io_dmem_req_bits_0_bits_uop_iw_p2_bypass_hint;
	output wire io_dmem_req_bits_0_bits_uop_iw_p3_bypass_hint;
	output wire io_dmem_req_bits_0_bits_uop_dis_col_sel;
	output wire [7:0] io_dmem_req_bits_0_bits_uop_br_mask;
	output wire [2:0] io_dmem_req_bits_0_bits_uop_br_tag;
	output wire [3:0] io_dmem_req_bits_0_bits_uop_br_type;
	output wire io_dmem_req_bits_0_bits_uop_is_sfb;
	output wire io_dmem_req_bits_0_bits_uop_is_fence;
	output wire io_dmem_req_bits_0_bits_uop_is_fencei;
	output wire io_dmem_req_bits_0_bits_uop_is_sfence;
	output wire io_dmem_req_bits_0_bits_uop_is_amo;
	output wire io_dmem_req_bits_0_bits_uop_is_eret;
	output wire io_dmem_req_bits_0_bits_uop_is_sys_pc2epc;
	output wire io_dmem_req_bits_0_bits_uop_is_rocc;
	output wire io_dmem_req_bits_0_bits_uop_is_mov;
	output wire [3:0] io_dmem_req_bits_0_bits_uop_ftq_idx;
	output wire io_dmem_req_bits_0_bits_uop_edge_inst;
	output wire [5:0] io_dmem_req_bits_0_bits_uop_pc_lob;
	output wire io_dmem_req_bits_0_bits_uop_taken;
	output wire io_dmem_req_bits_0_bits_uop_imm_rename;
	output wire [2:0] io_dmem_req_bits_0_bits_uop_imm_sel;
	output wire [4:0] io_dmem_req_bits_0_bits_uop_pimm;
	output wire [19:0] io_dmem_req_bits_0_bits_uop_imm_packed;
	output wire [1:0] io_dmem_req_bits_0_bits_uop_op1_sel;
	output wire [2:0] io_dmem_req_bits_0_bits_uop_op2_sel;
	output wire io_dmem_req_bits_0_bits_uop_fp_ctrl_ldst;
	output wire io_dmem_req_bits_0_bits_uop_fp_ctrl_wen;
	output wire io_dmem_req_bits_0_bits_uop_fp_ctrl_ren1;
	output wire io_dmem_req_bits_0_bits_uop_fp_ctrl_ren2;
	output wire io_dmem_req_bits_0_bits_uop_fp_ctrl_ren3;
	output wire io_dmem_req_bits_0_bits_uop_fp_ctrl_swap12;
	output wire io_dmem_req_bits_0_bits_uop_fp_ctrl_swap23;
	output wire [1:0] io_dmem_req_bits_0_bits_uop_fp_ctrl_typeTagIn;
	output wire [1:0] io_dmem_req_bits_0_bits_uop_fp_ctrl_typeTagOut;
	output wire io_dmem_req_bits_0_bits_uop_fp_ctrl_fromint;
	output wire io_dmem_req_bits_0_bits_uop_fp_ctrl_toint;
	output wire io_dmem_req_bits_0_bits_uop_fp_ctrl_fastpipe;
	output wire io_dmem_req_bits_0_bits_uop_fp_ctrl_fma;
	output wire io_dmem_req_bits_0_bits_uop_fp_ctrl_div;
	output wire io_dmem_req_bits_0_bits_uop_fp_ctrl_sqrt;
	output wire io_dmem_req_bits_0_bits_uop_fp_ctrl_wflags;
	output wire io_dmem_req_bits_0_bits_uop_fp_ctrl_vec;
	output wire [4:0] io_dmem_req_bits_0_bits_uop_rob_idx;
	output wire [3:0] io_dmem_req_bits_0_bits_uop_ldq_idx;
	output wire [3:0] io_dmem_req_bits_0_bits_uop_stq_idx;
	output wire [1:0] io_dmem_req_bits_0_bits_uop_rxq_idx;
	output wire [5:0] io_dmem_req_bits_0_bits_uop_pdst;
	output wire [5:0] io_dmem_req_bits_0_bits_uop_prs1;
	output wire [5:0] io_dmem_req_bits_0_bits_uop_prs2;
	output wire [5:0] io_dmem_req_bits_0_bits_uop_prs3;
	output wire [3:0] io_dmem_req_bits_0_bits_uop_ppred;
	output wire io_dmem_req_bits_0_bits_uop_prs1_busy;
	output wire io_dmem_req_bits_0_bits_uop_prs2_busy;
	output wire io_dmem_req_bits_0_bits_uop_prs3_busy;
	output wire io_dmem_req_bits_0_bits_uop_ppred_busy;
	output wire [5:0] io_dmem_req_bits_0_bits_uop_stale_pdst;
	output wire io_dmem_req_bits_0_bits_uop_exception;
	output wire [63:0] io_dmem_req_bits_0_bits_uop_exc_cause;
	output wire [4:0] io_dmem_req_bits_0_bits_uop_mem_cmd;
	output wire [1:0] io_dmem_req_bits_0_bits_uop_mem_size;
	output wire io_dmem_req_bits_0_bits_uop_mem_signed;
	output wire io_dmem_req_bits_0_bits_uop_uses_ldq;
	output wire io_dmem_req_bits_0_bits_uop_uses_stq;
	output wire io_dmem_req_bits_0_bits_uop_is_unique;
	output wire io_dmem_req_bits_0_bits_uop_flush_on_commit;
	output wire [2:0] io_dmem_req_bits_0_bits_uop_csr_cmd;
	output wire io_dmem_req_bits_0_bits_uop_ldst_is_rs1;
	output wire [5:0] io_dmem_req_bits_0_bits_uop_ldst;
	output wire [5:0] io_dmem_req_bits_0_bits_uop_lrs1;
	output wire [5:0] io_dmem_req_bits_0_bits_uop_lrs2;
	output wire [5:0] io_dmem_req_bits_0_bits_uop_lrs3;
	output wire [1:0] io_dmem_req_bits_0_bits_uop_dst_rtype;
	output wire [1:0] io_dmem_req_bits_0_bits_uop_lrs1_rtype;
	output wire [1:0] io_dmem_req_bits_0_bits_uop_lrs2_rtype;
	output wire io_dmem_req_bits_0_bits_uop_frs3_en;
	output wire io_dmem_req_bits_0_bits_uop_fcn_dw;
	output wire [4:0] io_dmem_req_bits_0_bits_uop_fcn_op;
	output wire io_dmem_req_bits_0_bits_uop_fp_val;
	output wire [2:0] io_dmem_req_bits_0_bits_uop_fp_rm;
	output wire [1:0] io_dmem_req_bits_0_bits_uop_fp_typ;
	output wire io_dmem_req_bits_0_bits_uop_xcpt_pf_if;
	output wire io_dmem_req_bits_0_bits_uop_xcpt_ae_if;
	output wire io_dmem_req_bits_0_bits_uop_xcpt_ma_if;
	output wire io_dmem_req_bits_0_bits_uop_bp_debug_if;
	output wire io_dmem_req_bits_0_bits_uop_bp_xcpt_if;
	output wire [2:0] io_dmem_req_bits_0_bits_uop_debug_fsrc;
	output wire [2:0] io_dmem_req_bits_0_bits_uop_debug_tsrc;
	output wire [39:0] io_dmem_req_bits_0_bits_addr;
	output wire [63:0] io_dmem_req_bits_0_bits_data;
	output wire io_dmem_req_bits_0_bits_is_hella;
	output wire io_dmem_s1_kill_0;
	input io_dmem_resp_0_valid;
	input io_dmem_resp_0_bits_uop_is_amo;
	input [3:0] io_dmem_resp_0_bits_uop_ldq_idx;
	input [3:0] io_dmem_resp_0_bits_uop_stq_idx;
	input io_dmem_resp_0_bits_uop_uses_ldq;
	input io_dmem_resp_0_bits_uop_uses_stq;
	input [63:0] io_dmem_resp_0_bits_data;
	input io_dmem_resp_0_bits_is_hella;
	input io_dmem_store_ack_0_valid;
	input [3:0] io_dmem_store_ack_0_bits_uop_stq_idx;
	input io_dmem_store_ack_0_bits_is_hella;
	input io_dmem_nack_0_valid;
	input [3:0] io_dmem_nack_0_bits_uop_ldq_idx;
	input [3:0] io_dmem_nack_0_bits_uop_stq_idx;
	input [1:0] io_dmem_nack_0_bits_uop_mem_size;
	input io_dmem_nack_0_bits_uop_uses_ldq;
	input io_dmem_nack_0_bits_uop_uses_stq;
	input [39:0] io_dmem_nack_0_bits_addr;
	input io_dmem_nack_0_bits_is_hella;
	output wire io_dmem_ll_resp_ready;
	input io_dmem_ll_resp_valid;
	input io_dmem_ll_resp_bits_uop_is_amo;
	input [3:0] io_dmem_ll_resp_bits_uop_ldq_idx;
	input [3:0] io_dmem_ll_resp_bits_uop_stq_idx;
	input io_dmem_ll_resp_bits_uop_uses_ldq;
	input io_dmem_ll_resp_bits_uop_uses_stq;
	input [63:0] io_dmem_ll_resp_bits_data;
	input io_dmem_ll_resp_bits_is_hella;
	output wire [7:0] io_dmem_brupdate_b1_resolve_mask;
	output wire [7:0] io_dmem_brupdate_b1_mispredict_mask;
	output wire io_dmem_exception;
	output wire io_dmem_release_ready;
	input io_dmem_release_valid;
	input [31:0] io_dmem_release_bits_address;
	output wire io_dmem_force_order;
	input io_dmem_ordered;
	input io_dmem_perf_acquire;
	input io_dmem_perf_release;
	output wire io_hellacache_req_ready;
	input io_hellacache_req_valid;
	input [39:0] io_hellacache_req_bits_addr;
	input io_hellacache_s1_kill;
	output wire io_hellacache_s2_nack;
	output wire io_hellacache_resp_valid;
	output wire [63:0] io_hellacache_resp_bits_data;
	output wire io_hellacache_s2_xcpt_ae_ld;
	wire _GEN;
	wire _GEN_0;
	reg slow_wakeups_0_REG_valid;
	wire ldq_will_succeed_7;
	wire ldq_will_succeed_6;
	wire ldq_will_succeed_5;
	wire ldq_will_succeed_4;
	wire ldq_will_succeed_3;
	wire ldq_will_succeed_2;
	wire ldq_will_succeed_1;
	wire ldq_will_succeed_0;
	wire fresp_0_valid;
	wire iresp_0_valid;
	wire _GEN_1;
	wire block_load_wakeup;
	wire dmem_req_0_valid;
	wire _GEN_2;
	wire _GEN_3;
	wire _GEN_4;
	reg mem_xcpt_valids_0;
	wire _will_fire_store_commit_slow_0_T_2;
	wire _logic_1_io_found;
	wire [2:0] _logic_1_io_found_idx;
	wire _logic_io_found;
	wire [2:0] _logic_io_found_idx;
	wire _wakeupArbs_0_io_in_1_ready;
	wire _stq_execute_queue_io_enq_ready;
	wire _stq_execute_queue_io_deq_valid;
	wire [31:0] _stq_execute_queue_io_deq_bits_uop_inst;
	wire [31:0] _stq_execute_queue_io_deq_bits_uop_debug_inst;
	wire _stq_execute_queue_io_deq_bits_uop_is_rvc;
	wire [39:0] _stq_execute_queue_io_deq_bits_uop_debug_pc;
	wire _stq_execute_queue_io_deq_bits_uop_iq_type_0;
	wire _stq_execute_queue_io_deq_bits_uop_iq_type_1;
	wire _stq_execute_queue_io_deq_bits_uop_iq_type_2;
	wire _stq_execute_queue_io_deq_bits_uop_iq_type_3;
	wire _stq_execute_queue_io_deq_bits_uop_fu_code_0;
	wire _stq_execute_queue_io_deq_bits_uop_fu_code_1;
	wire _stq_execute_queue_io_deq_bits_uop_fu_code_2;
	wire _stq_execute_queue_io_deq_bits_uop_fu_code_3;
	wire _stq_execute_queue_io_deq_bits_uop_fu_code_4;
	wire _stq_execute_queue_io_deq_bits_uop_fu_code_5;
	wire _stq_execute_queue_io_deq_bits_uop_fu_code_6;
	wire _stq_execute_queue_io_deq_bits_uop_fu_code_7;
	wire _stq_execute_queue_io_deq_bits_uop_fu_code_8;
	wire _stq_execute_queue_io_deq_bits_uop_fu_code_9;
	wire _stq_execute_queue_io_deq_bits_uop_iw_issued;
	wire _stq_execute_queue_io_deq_bits_uop_iw_issued_partial_agen;
	wire _stq_execute_queue_io_deq_bits_uop_iw_issued_partial_dgen;
	wire _stq_execute_queue_io_deq_bits_uop_iw_p1_speculative_child;
	wire _stq_execute_queue_io_deq_bits_uop_iw_p2_speculative_child;
	wire _stq_execute_queue_io_deq_bits_uop_iw_p1_bypass_hint;
	wire _stq_execute_queue_io_deq_bits_uop_iw_p2_bypass_hint;
	wire _stq_execute_queue_io_deq_bits_uop_iw_p3_bypass_hint;
	wire _stq_execute_queue_io_deq_bits_uop_dis_col_sel;
	wire [7:0] _stq_execute_queue_io_deq_bits_uop_br_mask;
	wire [2:0] _stq_execute_queue_io_deq_bits_uop_br_tag;
	wire [3:0] _stq_execute_queue_io_deq_bits_uop_br_type;
	wire _stq_execute_queue_io_deq_bits_uop_is_sfb;
	wire _stq_execute_queue_io_deq_bits_uop_is_fence;
	wire _stq_execute_queue_io_deq_bits_uop_is_fencei;
	wire _stq_execute_queue_io_deq_bits_uop_is_sfence;
	wire _stq_execute_queue_io_deq_bits_uop_is_amo;
	wire _stq_execute_queue_io_deq_bits_uop_is_eret;
	wire _stq_execute_queue_io_deq_bits_uop_is_sys_pc2epc;
	wire _stq_execute_queue_io_deq_bits_uop_is_rocc;
	wire _stq_execute_queue_io_deq_bits_uop_is_mov;
	wire [3:0] _stq_execute_queue_io_deq_bits_uop_ftq_idx;
	wire _stq_execute_queue_io_deq_bits_uop_edge_inst;
	wire [5:0] _stq_execute_queue_io_deq_bits_uop_pc_lob;
	wire _stq_execute_queue_io_deq_bits_uop_taken;
	wire _stq_execute_queue_io_deq_bits_uop_imm_rename;
	wire [2:0] _stq_execute_queue_io_deq_bits_uop_imm_sel;
	wire [4:0] _stq_execute_queue_io_deq_bits_uop_pimm;
	wire [19:0] _stq_execute_queue_io_deq_bits_uop_imm_packed;
	wire [1:0] _stq_execute_queue_io_deq_bits_uop_op1_sel;
	wire [2:0] _stq_execute_queue_io_deq_bits_uop_op2_sel;
	wire _stq_execute_queue_io_deq_bits_uop_fp_ctrl_ldst;
	wire _stq_execute_queue_io_deq_bits_uop_fp_ctrl_wen;
	wire _stq_execute_queue_io_deq_bits_uop_fp_ctrl_ren1;
	wire _stq_execute_queue_io_deq_bits_uop_fp_ctrl_ren2;
	wire _stq_execute_queue_io_deq_bits_uop_fp_ctrl_ren3;
	wire _stq_execute_queue_io_deq_bits_uop_fp_ctrl_swap12;
	wire _stq_execute_queue_io_deq_bits_uop_fp_ctrl_swap23;
	wire [1:0] _stq_execute_queue_io_deq_bits_uop_fp_ctrl_typeTagIn;
	wire [1:0] _stq_execute_queue_io_deq_bits_uop_fp_ctrl_typeTagOut;
	wire _stq_execute_queue_io_deq_bits_uop_fp_ctrl_fromint;
	wire _stq_execute_queue_io_deq_bits_uop_fp_ctrl_toint;
	wire _stq_execute_queue_io_deq_bits_uop_fp_ctrl_fastpipe;
	wire _stq_execute_queue_io_deq_bits_uop_fp_ctrl_fma;
	wire _stq_execute_queue_io_deq_bits_uop_fp_ctrl_div;
	wire _stq_execute_queue_io_deq_bits_uop_fp_ctrl_sqrt;
	wire _stq_execute_queue_io_deq_bits_uop_fp_ctrl_wflags;
	wire _stq_execute_queue_io_deq_bits_uop_fp_ctrl_vec;
	wire [4:0] _stq_execute_queue_io_deq_bits_uop_rob_idx;
	wire [3:0] _stq_execute_queue_io_deq_bits_uop_ldq_idx;
	wire [3:0] _stq_execute_queue_io_deq_bits_uop_stq_idx;
	wire [1:0] _stq_execute_queue_io_deq_bits_uop_rxq_idx;
	wire [5:0] _stq_execute_queue_io_deq_bits_uop_pdst;
	wire [5:0] _stq_execute_queue_io_deq_bits_uop_prs1;
	wire [5:0] _stq_execute_queue_io_deq_bits_uop_prs2;
	wire [5:0] _stq_execute_queue_io_deq_bits_uop_prs3;
	wire [3:0] _stq_execute_queue_io_deq_bits_uop_ppred;
	wire _stq_execute_queue_io_deq_bits_uop_prs1_busy;
	wire _stq_execute_queue_io_deq_bits_uop_prs2_busy;
	wire _stq_execute_queue_io_deq_bits_uop_prs3_busy;
	wire _stq_execute_queue_io_deq_bits_uop_ppred_busy;
	wire [5:0] _stq_execute_queue_io_deq_bits_uop_stale_pdst;
	wire _stq_execute_queue_io_deq_bits_uop_exception;
	wire [63:0] _stq_execute_queue_io_deq_bits_uop_exc_cause;
	wire [4:0] _stq_execute_queue_io_deq_bits_uop_mem_cmd;
	wire [1:0] _stq_execute_queue_io_deq_bits_uop_mem_size;
	wire _stq_execute_queue_io_deq_bits_uop_mem_signed;
	wire _stq_execute_queue_io_deq_bits_uop_uses_ldq;
	wire _stq_execute_queue_io_deq_bits_uop_uses_stq;
	wire _stq_execute_queue_io_deq_bits_uop_is_unique;
	wire _stq_execute_queue_io_deq_bits_uop_flush_on_commit;
	wire [2:0] _stq_execute_queue_io_deq_bits_uop_csr_cmd;
	wire _stq_execute_queue_io_deq_bits_uop_ldst_is_rs1;
	wire [5:0] _stq_execute_queue_io_deq_bits_uop_ldst;
	wire [5:0] _stq_execute_queue_io_deq_bits_uop_lrs1;
	wire [5:0] _stq_execute_queue_io_deq_bits_uop_lrs2;
	wire [5:0] _stq_execute_queue_io_deq_bits_uop_lrs3;
	wire [1:0] _stq_execute_queue_io_deq_bits_uop_dst_rtype;
	wire [1:0] _stq_execute_queue_io_deq_bits_uop_lrs1_rtype;
	wire [1:0] _stq_execute_queue_io_deq_bits_uop_lrs2_rtype;
	wire _stq_execute_queue_io_deq_bits_uop_frs3_en;
	wire _stq_execute_queue_io_deq_bits_uop_fcn_dw;
	wire [4:0] _stq_execute_queue_io_deq_bits_uop_fcn_op;
	wire _stq_execute_queue_io_deq_bits_uop_fp_val;
	wire [2:0] _stq_execute_queue_io_deq_bits_uop_fp_rm;
	wire [1:0] _stq_execute_queue_io_deq_bits_uop_fp_typ;
	wire _stq_execute_queue_io_deq_bits_uop_xcpt_pf_if;
	wire _stq_execute_queue_io_deq_bits_uop_xcpt_ae_if;
	wire _stq_execute_queue_io_deq_bits_uop_xcpt_ma_if;
	wire _stq_execute_queue_io_deq_bits_uop_bp_debug_if;
	wire _stq_execute_queue_io_deq_bits_uop_bp_xcpt_if;
	wire [2:0] _stq_execute_queue_io_deq_bits_uop_debug_fsrc;
	wire [2:0] _stq_execute_queue_io_deq_bits_uop_debug_tsrc;
	wire [39:0] _stq_execute_queue_io_deq_bits_addr_bits;
	wire [63:0] _stq_execute_queue_io_deq_bits_data_bits;
	wire _retry_queue_io_enq_ready;
	wire _retry_queue_io_deq_valid;
	wire [31:0] _retry_queue_io_deq_bits_uop_inst;
	wire [31:0] _retry_queue_io_deq_bits_uop_debug_inst;
	wire _retry_queue_io_deq_bits_uop_is_rvc;
	wire [39:0] _retry_queue_io_deq_bits_uop_debug_pc;
	wire _retry_queue_io_deq_bits_uop_iq_type_0;
	wire _retry_queue_io_deq_bits_uop_iq_type_1;
	wire _retry_queue_io_deq_bits_uop_iq_type_2;
	wire _retry_queue_io_deq_bits_uop_iq_type_3;
	wire _retry_queue_io_deq_bits_uop_fu_code_0;
	wire _retry_queue_io_deq_bits_uop_fu_code_1;
	wire _retry_queue_io_deq_bits_uop_fu_code_2;
	wire _retry_queue_io_deq_bits_uop_fu_code_3;
	wire _retry_queue_io_deq_bits_uop_fu_code_4;
	wire _retry_queue_io_deq_bits_uop_fu_code_5;
	wire _retry_queue_io_deq_bits_uop_fu_code_6;
	wire _retry_queue_io_deq_bits_uop_fu_code_7;
	wire _retry_queue_io_deq_bits_uop_fu_code_8;
	wire _retry_queue_io_deq_bits_uop_fu_code_9;
	wire _retry_queue_io_deq_bits_uop_iw_issued;
	wire _retry_queue_io_deq_bits_uop_iw_issued_partial_agen;
	wire _retry_queue_io_deq_bits_uop_iw_issued_partial_dgen;
	wire _retry_queue_io_deq_bits_uop_iw_p1_speculative_child;
	wire _retry_queue_io_deq_bits_uop_iw_p2_speculative_child;
	wire _retry_queue_io_deq_bits_uop_iw_p1_bypass_hint;
	wire _retry_queue_io_deq_bits_uop_iw_p2_bypass_hint;
	wire _retry_queue_io_deq_bits_uop_iw_p3_bypass_hint;
	wire _retry_queue_io_deq_bits_uop_dis_col_sel;
	wire [7:0] _retry_queue_io_deq_bits_uop_br_mask;
	wire [2:0] _retry_queue_io_deq_bits_uop_br_tag;
	wire [3:0] _retry_queue_io_deq_bits_uop_br_type;
	wire _retry_queue_io_deq_bits_uop_is_sfb;
	wire _retry_queue_io_deq_bits_uop_is_fence;
	wire _retry_queue_io_deq_bits_uop_is_fencei;
	wire _retry_queue_io_deq_bits_uop_is_sfence;
	wire _retry_queue_io_deq_bits_uop_is_amo;
	wire _retry_queue_io_deq_bits_uop_is_eret;
	wire _retry_queue_io_deq_bits_uop_is_sys_pc2epc;
	wire _retry_queue_io_deq_bits_uop_is_rocc;
	wire _retry_queue_io_deq_bits_uop_is_mov;
	wire [3:0] _retry_queue_io_deq_bits_uop_ftq_idx;
	wire _retry_queue_io_deq_bits_uop_edge_inst;
	wire [5:0] _retry_queue_io_deq_bits_uop_pc_lob;
	wire _retry_queue_io_deq_bits_uop_taken;
	wire _retry_queue_io_deq_bits_uop_imm_rename;
	wire [2:0] _retry_queue_io_deq_bits_uop_imm_sel;
	wire [4:0] _retry_queue_io_deq_bits_uop_pimm;
	wire [19:0] _retry_queue_io_deq_bits_uop_imm_packed;
	wire [1:0] _retry_queue_io_deq_bits_uop_op1_sel;
	wire [2:0] _retry_queue_io_deq_bits_uop_op2_sel;
	wire _retry_queue_io_deq_bits_uop_fp_ctrl_ldst;
	wire _retry_queue_io_deq_bits_uop_fp_ctrl_wen;
	wire _retry_queue_io_deq_bits_uop_fp_ctrl_ren1;
	wire _retry_queue_io_deq_bits_uop_fp_ctrl_ren2;
	wire _retry_queue_io_deq_bits_uop_fp_ctrl_ren3;
	wire _retry_queue_io_deq_bits_uop_fp_ctrl_swap12;
	wire _retry_queue_io_deq_bits_uop_fp_ctrl_swap23;
	wire [1:0] _retry_queue_io_deq_bits_uop_fp_ctrl_typeTagIn;
	wire [1:0] _retry_queue_io_deq_bits_uop_fp_ctrl_typeTagOut;
	wire _retry_queue_io_deq_bits_uop_fp_ctrl_fromint;
	wire _retry_queue_io_deq_bits_uop_fp_ctrl_toint;
	wire _retry_queue_io_deq_bits_uop_fp_ctrl_fastpipe;
	wire _retry_queue_io_deq_bits_uop_fp_ctrl_fma;
	wire _retry_queue_io_deq_bits_uop_fp_ctrl_div;
	wire _retry_queue_io_deq_bits_uop_fp_ctrl_sqrt;
	wire _retry_queue_io_deq_bits_uop_fp_ctrl_wflags;
	wire _retry_queue_io_deq_bits_uop_fp_ctrl_vec;
	wire [4:0] _retry_queue_io_deq_bits_uop_rob_idx;
	wire [3:0] _retry_queue_io_deq_bits_uop_ldq_idx;
	wire [3:0] _retry_queue_io_deq_bits_uop_stq_idx;
	wire [1:0] _retry_queue_io_deq_bits_uop_rxq_idx;
	wire [5:0] _retry_queue_io_deq_bits_uop_pdst;
	wire [5:0] _retry_queue_io_deq_bits_uop_prs1;
	wire [5:0] _retry_queue_io_deq_bits_uop_prs2;
	wire [5:0] _retry_queue_io_deq_bits_uop_prs3;
	wire [3:0] _retry_queue_io_deq_bits_uop_ppred;
	wire _retry_queue_io_deq_bits_uop_prs1_busy;
	wire _retry_queue_io_deq_bits_uop_prs2_busy;
	wire _retry_queue_io_deq_bits_uop_prs3_busy;
	wire _retry_queue_io_deq_bits_uop_ppred_busy;
	wire [5:0] _retry_queue_io_deq_bits_uop_stale_pdst;
	wire _retry_queue_io_deq_bits_uop_exception;
	wire [63:0] _retry_queue_io_deq_bits_uop_exc_cause;
	wire [4:0] _retry_queue_io_deq_bits_uop_mem_cmd;
	wire [1:0] _retry_queue_io_deq_bits_uop_mem_size;
	wire _retry_queue_io_deq_bits_uop_mem_signed;
	wire _retry_queue_io_deq_bits_uop_uses_ldq;
	wire _retry_queue_io_deq_bits_uop_uses_stq;
	wire _retry_queue_io_deq_bits_uop_is_unique;
	wire _retry_queue_io_deq_bits_uop_flush_on_commit;
	wire [2:0] _retry_queue_io_deq_bits_uop_csr_cmd;
	wire _retry_queue_io_deq_bits_uop_ldst_is_rs1;
	wire [5:0] _retry_queue_io_deq_bits_uop_ldst;
	wire [5:0] _retry_queue_io_deq_bits_uop_lrs1;
	wire [5:0] _retry_queue_io_deq_bits_uop_lrs2;
	wire [5:0] _retry_queue_io_deq_bits_uop_lrs3;
	wire [1:0] _retry_queue_io_deq_bits_uop_dst_rtype;
	wire [1:0] _retry_queue_io_deq_bits_uop_lrs1_rtype;
	wire [1:0] _retry_queue_io_deq_bits_uop_lrs2_rtype;
	wire _retry_queue_io_deq_bits_uop_frs3_en;
	wire _retry_queue_io_deq_bits_uop_fcn_dw;
	wire [4:0] _retry_queue_io_deq_bits_uop_fcn_op;
	wire _retry_queue_io_deq_bits_uop_fp_val;
	wire [2:0] _retry_queue_io_deq_bits_uop_fp_rm;
	wire [1:0] _retry_queue_io_deq_bits_uop_fp_typ;
	wire _retry_queue_io_deq_bits_uop_xcpt_pf_if;
	wire _retry_queue_io_deq_bits_uop_xcpt_ae_if;
	wire _retry_queue_io_deq_bits_uop_xcpt_ma_if;
	wire _retry_queue_io_deq_bits_uop_bp_debug_if;
	wire _retry_queue_io_deq_bits_uop_bp_xcpt_if;
	wire [2:0] _retry_queue_io_deq_bits_uop_debug_fsrc;
	wire [2:0] _retry_queue_io_deq_bits_uop_debug_tsrc;
	wire [63:0] _retry_queue_io_deq_bits_data;
	wire _dtlb_io_resp_0_miss;
	wire [31:0] _dtlb_io_resp_0_paddr;
	wire _dtlb_io_resp_0_pf_ld;
	wire _dtlb_io_resp_0_pf_st;
	wire _dtlb_io_resp_0_ae_ld;
	wire _dtlb_io_resp_0_ae_st;
	wire _dtlb_io_resp_0_ma_ld;
	wire _dtlb_io_resp_0_ma_st;
	wire _dtlb_io_resp_0_cacheable;
	wire _dtlb_io_ptw_req_valid;
	wire will_fire_sfence_0_will_fire = io_core_sfence_valid;
	reg ldq_valid_0;
	reg ldq_valid_1;
	reg ldq_valid_2;
	reg ldq_valid_3;
	reg ldq_valid_4;
	reg ldq_valid_5;
	reg ldq_valid_6;
	reg ldq_valid_7;
	reg [31:0] ldq_uop_0_inst;
	reg [31:0] ldq_uop_0_debug_inst;
	reg ldq_uop_0_is_rvc;
	reg [39:0] ldq_uop_0_debug_pc;
	reg ldq_uop_0_iq_type_0;
	reg ldq_uop_0_iq_type_1;
	reg ldq_uop_0_iq_type_2;
	reg ldq_uop_0_iq_type_3;
	reg ldq_uop_0_fu_code_0;
	reg ldq_uop_0_fu_code_1;
	reg ldq_uop_0_fu_code_2;
	reg ldq_uop_0_fu_code_3;
	reg ldq_uop_0_fu_code_4;
	reg ldq_uop_0_fu_code_5;
	reg ldq_uop_0_fu_code_6;
	reg ldq_uop_0_fu_code_7;
	reg ldq_uop_0_fu_code_8;
	reg ldq_uop_0_fu_code_9;
	reg ldq_uop_0_iw_issued;
	reg ldq_uop_0_iw_issued_partial_agen;
	reg ldq_uop_0_iw_issued_partial_dgen;
	reg ldq_uop_0_iw_p1_speculative_child;
	reg ldq_uop_0_iw_p2_speculative_child;
	reg ldq_uop_0_iw_p1_bypass_hint;
	reg ldq_uop_0_iw_p2_bypass_hint;
	reg ldq_uop_0_iw_p3_bypass_hint;
	reg [7:0] ldq_uop_0_br_mask;
	reg [2:0] ldq_uop_0_br_tag;
	reg [3:0] ldq_uop_0_br_type;
	reg ldq_uop_0_is_sfb;
	reg ldq_uop_0_is_fence;
	reg ldq_uop_0_is_fencei;
	reg ldq_uop_0_is_sfence;
	reg ldq_uop_0_is_amo;
	reg ldq_uop_0_is_eret;
	reg ldq_uop_0_is_sys_pc2epc;
	reg ldq_uop_0_is_rocc;
	reg ldq_uop_0_is_mov;
	reg [3:0] ldq_uop_0_ftq_idx;
	reg ldq_uop_0_edge_inst;
	reg [5:0] ldq_uop_0_pc_lob;
	reg ldq_uop_0_taken;
	reg ldq_uop_0_imm_rename;
	reg [2:0] ldq_uop_0_imm_sel;
	reg [4:0] ldq_uop_0_pimm;
	reg [19:0] ldq_uop_0_imm_packed;
	reg [1:0] ldq_uop_0_op1_sel;
	reg [2:0] ldq_uop_0_op2_sel;
	reg ldq_uop_0_fp_ctrl_ldst;
	reg ldq_uop_0_fp_ctrl_wen;
	reg ldq_uop_0_fp_ctrl_ren1;
	reg ldq_uop_0_fp_ctrl_ren2;
	reg ldq_uop_0_fp_ctrl_ren3;
	reg ldq_uop_0_fp_ctrl_swap12;
	reg ldq_uop_0_fp_ctrl_swap23;
	reg [1:0] ldq_uop_0_fp_ctrl_typeTagIn;
	reg [1:0] ldq_uop_0_fp_ctrl_typeTagOut;
	reg ldq_uop_0_fp_ctrl_fromint;
	reg ldq_uop_0_fp_ctrl_toint;
	reg ldq_uop_0_fp_ctrl_fastpipe;
	reg ldq_uop_0_fp_ctrl_fma;
	reg ldq_uop_0_fp_ctrl_div;
	reg ldq_uop_0_fp_ctrl_sqrt;
	reg ldq_uop_0_fp_ctrl_wflags;
	reg ldq_uop_0_fp_ctrl_vec;
	reg [4:0] ldq_uop_0_rob_idx;
	reg [3:0] ldq_uop_0_ldq_idx;
	reg [3:0] ldq_uop_0_stq_idx;
	reg [1:0] ldq_uop_0_rxq_idx;
	reg [5:0] ldq_uop_0_pdst;
	reg [5:0] ldq_uop_0_prs1;
	reg [5:0] ldq_uop_0_prs2;
	reg [5:0] ldq_uop_0_prs3;
	reg [3:0] ldq_uop_0_ppred;
	reg ldq_uop_0_prs1_busy;
	reg ldq_uop_0_prs2_busy;
	reg ldq_uop_0_prs3_busy;
	reg ldq_uop_0_ppred_busy;
	reg [5:0] ldq_uop_0_stale_pdst;
	reg ldq_uop_0_exception;
	reg [63:0] ldq_uop_0_exc_cause;
	reg [4:0] ldq_uop_0_mem_cmd;
	reg [1:0] ldq_uop_0_mem_size;
	reg ldq_uop_0_mem_signed;
	reg ldq_uop_0_uses_ldq;
	reg ldq_uop_0_uses_stq;
	reg ldq_uop_0_is_unique;
	reg ldq_uop_0_flush_on_commit;
	reg [2:0] ldq_uop_0_csr_cmd;
	reg ldq_uop_0_ldst_is_rs1;
	reg [5:0] ldq_uop_0_ldst;
	reg [5:0] ldq_uop_0_lrs1;
	reg [5:0] ldq_uop_0_lrs2;
	reg [5:0] ldq_uop_0_lrs3;
	reg [1:0] ldq_uop_0_dst_rtype;
	reg [1:0] ldq_uop_0_lrs1_rtype;
	reg [1:0] ldq_uop_0_lrs2_rtype;
	reg ldq_uop_0_frs3_en;
	reg ldq_uop_0_fcn_dw;
	reg [4:0] ldq_uop_0_fcn_op;
	reg ldq_uop_0_fp_val;
	reg [2:0] ldq_uop_0_fp_rm;
	reg [1:0] ldq_uop_0_fp_typ;
	reg ldq_uop_0_xcpt_pf_if;
	reg ldq_uop_0_xcpt_ae_if;
	reg ldq_uop_0_xcpt_ma_if;
	reg ldq_uop_0_bp_debug_if;
	reg ldq_uop_0_bp_xcpt_if;
	reg [2:0] ldq_uop_0_debug_fsrc;
	reg [2:0] ldq_uop_0_debug_tsrc;
	reg [31:0] ldq_uop_1_inst;
	reg [31:0] ldq_uop_1_debug_inst;
	reg ldq_uop_1_is_rvc;
	reg [39:0] ldq_uop_1_debug_pc;
	reg ldq_uop_1_iq_type_0;
	reg ldq_uop_1_iq_type_1;
	reg ldq_uop_1_iq_type_2;
	reg ldq_uop_1_iq_type_3;
	reg ldq_uop_1_fu_code_0;
	reg ldq_uop_1_fu_code_1;
	reg ldq_uop_1_fu_code_2;
	reg ldq_uop_1_fu_code_3;
	reg ldq_uop_1_fu_code_4;
	reg ldq_uop_1_fu_code_5;
	reg ldq_uop_1_fu_code_6;
	reg ldq_uop_1_fu_code_7;
	reg ldq_uop_1_fu_code_8;
	reg ldq_uop_1_fu_code_9;
	reg ldq_uop_1_iw_issued;
	reg ldq_uop_1_iw_issued_partial_agen;
	reg ldq_uop_1_iw_issued_partial_dgen;
	reg ldq_uop_1_iw_p1_speculative_child;
	reg ldq_uop_1_iw_p2_speculative_child;
	reg ldq_uop_1_iw_p1_bypass_hint;
	reg ldq_uop_1_iw_p2_bypass_hint;
	reg ldq_uop_1_iw_p3_bypass_hint;
	reg [7:0] ldq_uop_1_br_mask;
	reg [2:0] ldq_uop_1_br_tag;
	reg [3:0] ldq_uop_1_br_type;
	reg ldq_uop_1_is_sfb;
	reg ldq_uop_1_is_fence;
	reg ldq_uop_1_is_fencei;
	reg ldq_uop_1_is_sfence;
	reg ldq_uop_1_is_amo;
	reg ldq_uop_1_is_eret;
	reg ldq_uop_1_is_sys_pc2epc;
	reg ldq_uop_1_is_rocc;
	reg ldq_uop_1_is_mov;
	reg [3:0] ldq_uop_1_ftq_idx;
	reg ldq_uop_1_edge_inst;
	reg [5:0] ldq_uop_1_pc_lob;
	reg ldq_uop_1_taken;
	reg ldq_uop_1_imm_rename;
	reg [2:0] ldq_uop_1_imm_sel;
	reg [4:0] ldq_uop_1_pimm;
	reg [19:0] ldq_uop_1_imm_packed;
	reg [1:0] ldq_uop_1_op1_sel;
	reg [2:0] ldq_uop_1_op2_sel;
	reg ldq_uop_1_fp_ctrl_ldst;
	reg ldq_uop_1_fp_ctrl_wen;
	reg ldq_uop_1_fp_ctrl_ren1;
	reg ldq_uop_1_fp_ctrl_ren2;
	reg ldq_uop_1_fp_ctrl_ren3;
	reg ldq_uop_1_fp_ctrl_swap12;
	reg ldq_uop_1_fp_ctrl_swap23;
	reg [1:0] ldq_uop_1_fp_ctrl_typeTagIn;
	reg [1:0] ldq_uop_1_fp_ctrl_typeTagOut;
	reg ldq_uop_1_fp_ctrl_fromint;
	reg ldq_uop_1_fp_ctrl_toint;
	reg ldq_uop_1_fp_ctrl_fastpipe;
	reg ldq_uop_1_fp_ctrl_fma;
	reg ldq_uop_1_fp_ctrl_div;
	reg ldq_uop_1_fp_ctrl_sqrt;
	reg ldq_uop_1_fp_ctrl_wflags;
	reg ldq_uop_1_fp_ctrl_vec;
	reg [4:0] ldq_uop_1_rob_idx;
	reg [3:0] ldq_uop_1_ldq_idx;
	reg [3:0] ldq_uop_1_stq_idx;
	reg [1:0] ldq_uop_1_rxq_idx;
	reg [5:0] ldq_uop_1_pdst;
	reg [5:0] ldq_uop_1_prs1;
	reg [5:0] ldq_uop_1_prs2;
	reg [5:0] ldq_uop_1_prs3;
	reg [3:0] ldq_uop_1_ppred;
	reg ldq_uop_1_prs1_busy;
	reg ldq_uop_1_prs2_busy;
	reg ldq_uop_1_prs3_busy;
	reg ldq_uop_1_ppred_busy;
	reg [5:0] ldq_uop_1_stale_pdst;
	reg ldq_uop_1_exception;
	reg [63:0] ldq_uop_1_exc_cause;
	reg [4:0] ldq_uop_1_mem_cmd;
	reg [1:0] ldq_uop_1_mem_size;
	reg ldq_uop_1_mem_signed;
	reg ldq_uop_1_uses_ldq;
	reg ldq_uop_1_uses_stq;
	reg ldq_uop_1_is_unique;
	reg ldq_uop_1_flush_on_commit;
	reg [2:0] ldq_uop_1_csr_cmd;
	reg ldq_uop_1_ldst_is_rs1;
	reg [5:0] ldq_uop_1_ldst;
	reg [5:0] ldq_uop_1_lrs1;
	reg [5:0] ldq_uop_1_lrs2;
	reg [5:0] ldq_uop_1_lrs3;
	reg [1:0] ldq_uop_1_dst_rtype;
	reg [1:0] ldq_uop_1_lrs1_rtype;
	reg [1:0] ldq_uop_1_lrs2_rtype;
	reg ldq_uop_1_frs3_en;
	reg ldq_uop_1_fcn_dw;
	reg [4:0] ldq_uop_1_fcn_op;
	reg ldq_uop_1_fp_val;
	reg [2:0] ldq_uop_1_fp_rm;
	reg [1:0] ldq_uop_1_fp_typ;
	reg ldq_uop_1_xcpt_pf_if;
	reg ldq_uop_1_xcpt_ae_if;
	reg ldq_uop_1_xcpt_ma_if;
	reg ldq_uop_1_bp_debug_if;
	reg ldq_uop_1_bp_xcpt_if;
	reg [2:0] ldq_uop_1_debug_fsrc;
	reg [2:0] ldq_uop_1_debug_tsrc;
	reg [31:0] ldq_uop_2_inst;
	reg [31:0] ldq_uop_2_debug_inst;
	reg ldq_uop_2_is_rvc;
	reg [39:0] ldq_uop_2_debug_pc;
	reg ldq_uop_2_iq_type_0;
	reg ldq_uop_2_iq_type_1;
	reg ldq_uop_2_iq_type_2;
	reg ldq_uop_2_iq_type_3;
	reg ldq_uop_2_fu_code_0;
	reg ldq_uop_2_fu_code_1;
	reg ldq_uop_2_fu_code_2;
	reg ldq_uop_2_fu_code_3;
	reg ldq_uop_2_fu_code_4;
	reg ldq_uop_2_fu_code_5;
	reg ldq_uop_2_fu_code_6;
	reg ldq_uop_2_fu_code_7;
	reg ldq_uop_2_fu_code_8;
	reg ldq_uop_2_fu_code_9;
	reg ldq_uop_2_iw_issued;
	reg ldq_uop_2_iw_issued_partial_agen;
	reg ldq_uop_2_iw_issued_partial_dgen;
	reg ldq_uop_2_iw_p1_speculative_child;
	reg ldq_uop_2_iw_p2_speculative_child;
	reg ldq_uop_2_iw_p1_bypass_hint;
	reg ldq_uop_2_iw_p2_bypass_hint;
	reg ldq_uop_2_iw_p3_bypass_hint;
	reg [7:0] ldq_uop_2_br_mask;
	reg [2:0] ldq_uop_2_br_tag;
	reg [3:0] ldq_uop_2_br_type;
	reg ldq_uop_2_is_sfb;
	reg ldq_uop_2_is_fence;
	reg ldq_uop_2_is_fencei;
	reg ldq_uop_2_is_sfence;
	reg ldq_uop_2_is_amo;
	reg ldq_uop_2_is_eret;
	reg ldq_uop_2_is_sys_pc2epc;
	reg ldq_uop_2_is_rocc;
	reg ldq_uop_2_is_mov;
	reg [3:0] ldq_uop_2_ftq_idx;
	reg ldq_uop_2_edge_inst;
	reg [5:0] ldq_uop_2_pc_lob;
	reg ldq_uop_2_taken;
	reg ldq_uop_2_imm_rename;
	reg [2:0] ldq_uop_2_imm_sel;
	reg [4:0] ldq_uop_2_pimm;
	reg [19:0] ldq_uop_2_imm_packed;
	reg [1:0] ldq_uop_2_op1_sel;
	reg [2:0] ldq_uop_2_op2_sel;
	reg ldq_uop_2_fp_ctrl_ldst;
	reg ldq_uop_2_fp_ctrl_wen;
	reg ldq_uop_2_fp_ctrl_ren1;
	reg ldq_uop_2_fp_ctrl_ren2;
	reg ldq_uop_2_fp_ctrl_ren3;
	reg ldq_uop_2_fp_ctrl_swap12;
	reg ldq_uop_2_fp_ctrl_swap23;
	reg [1:0] ldq_uop_2_fp_ctrl_typeTagIn;
	reg [1:0] ldq_uop_2_fp_ctrl_typeTagOut;
	reg ldq_uop_2_fp_ctrl_fromint;
	reg ldq_uop_2_fp_ctrl_toint;
	reg ldq_uop_2_fp_ctrl_fastpipe;
	reg ldq_uop_2_fp_ctrl_fma;
	reg ldq_uop_2_fp_ctrl_div;
	reg ldq_uop_2_fp_ctrl_sqrt;
	reg ldq_uop_2_fp_ctrl_wflags;
	reg ldq_uop_2_fp_ctrl_vec;
	reg [4:0] ldq_uop_2_rob_idx;
	reg [3:0] ldq_uop_2_ldq_idx;
	reg [3:0] ldq_uop_2_stq_idx;
	reg [1:0] ldq_uop_2_rxq_idx;
	reg [5:0] ldq_uop_2_pdst;
	reg [5:0] ldq_uop_2_prs1;
	reg [5:0] ldq_uop_2_prs2;
	reg [5:0] ldq_uop_2_prs3;
	reg [3:0] ldq_uop_2_ppred;
	reg ldq_uop_2_prs1_busy;
	reg ldq_uop_2_prs2_busy;
	reg ldq_uop_2_prs3_busy;
	reg ldq_uop_2_ppred_busy;
	reg [5:0] ldq_uop_2_stale_pdst;
	reg ldq_uop_2_exception;
	reg [63:0] ldq_uop_2_exc_cause;
	reg [4:0] ldq_uop_2_mem_cmd;
	reg [1:0] ldq_uop_2_mem_size;
	reg ldq_uop_2_mem_signed;
	reg ldq_uop_2_uses_ldq;
	reg ldq_uop_2_uses_stq;
	reg ldq_uop_2_is_unique;
	reg ldq_uop_2_flush_on_commit;
	reg [2:0] ldq_uop_2_csr_cmd;
	reg ldq_uop_2_ldst_is_rs1;
	reg [5:0] ldq_uop_2_ldst;
	reg [5:0] ldq_uop_2_lrs1;
	reg [5:0] ldq_uop_2_lrs2;
	reg [5:0] ldq_uop_2_lrs3;
	reg [1:0] ldq_uop_2_dst_rtype;
	reg [1:0] ldq_uop_2_lrs1_rtype;
	reg [1:0] ldq_uop_2_lrs2_rtype;
	reg ldq_uop_2_frs3_en;
	reg ldq_uop_2_fcn_dw;
	reg [4:0] ldq_uop_2_fcn_op;
	reg ldq_uop_2_fp_val;
	reg [2:0] ldq_uop_2_fp_rm;
	reg [1:0] ldq_uop_2_fp_typ;
	reg ldq_uop_2_xcpt_pf_if;
	reg ldq_uop_2_xcpt_ae_if;
	reg ldq_uop_2_xcpt_ma_if;
	reg ldq_uop_2_bp_debug_if;
	reg ldq_uop_2_bp_xcpt_if;
	reg [2:0] ldq_uop_2_debug_fsrc;
	reg [2:0] ldq_uop_2_debug_tsrc;
	reg [31:0] ldq_uop_3_inst;
	reg [31:0] ldq_uop_3_debug_inst;
	reg ldq_uop_3_is_rvc;
	reg [39:0] ldq_uop_3_debug_pc;
	reg ldq_uop_3_iq_type_0;
	reg ldq_uop_3_iq_type_1;
	reg ldq_uop_3_iq_type_2;
	reg ldq_uop_3_iq_type_3;
	reg ldq_uop_3_fu_code_0;
	reg ldq_uop_3_fu_code_1;
	reg ldq_uop_3_fu_code_2;
	reg ldq_uop_3_fu_code_3;
	reg ldq_uop_3_fu_code_4;
	reg ldq_uop_3_fu_code_5;
	reg ldq_uop_3_fu_code_6;
	reg ldq_uop_3_fu_code_7;
	reg ldq_uop_3_fu_code_8;
	reg ldq_uop_3_fu_code_9;
	reg ldq_uop_3_iw_issued;
	reg ldq_uop_3_iw_issued_partial_agen;
	reg ldq_uop_3_iw_issued_partial_dgen;
	reg ldq_uop_3_iw_p1_speculative_child;
	reg ldq_uop_3_iw_p2_speculative_child;
	reg ldq_uop_3_iw_p1_bypass_hint;
	reg ldq_uop_3_iw_p2_bypass_hint;
	reg ldq_uop_3_iw_p3_bypass_hint;
	reg [7:0] ldq_uop_3_br_mask;
	reg [2:0] ldq_uop_3_br_tag;
	reg [3:0] ldq_uop_3_br_type;
	reg ldq_uop_3_is_sfb;
	reg ldq_uop_3_is_fence;
	reg ldq_uop_3_is_fencei;
	reg ldq_uop_3_is_sfence;
	reg ldq_uop_3_is_amo;
	reg ldq_uop_3_is_eret;
	reg ldq_uop_3_is_sys_pc2epc;
	reg ldq_uop_3_is_rocc;
	reg ldq_uop_3_is_mov;
	reg [3:0] ldq_uop_3_ftq_idx;
	reg ldq_uop_3_edge_inst;
	reg [5:0] ldq_uop_3_pc_lob;
	reg ldq_uop_3_taken;
	reg ldq_uop_3_imm_rename;
	reg [2:0] ldq_uop_3_imm_sel;
	reg [4:0] ldq_uop_3_pimm;
	reg [19:0] ldq_uop_3_imm_packed;
	reg [1:0] ldq_uop_3_op1_sel;
	reg [2:0] ldq_uop_3_op2_sel;
	reg ldq_uop_3_fp_ctrl_ldst;
	reg ldq_uop_3_fp_ctrl_wen;
	reg ldq_uop_3_fp_ctrl_ren1;
	reg ldq_uop_3_fp_ctrl_ren2;
	reg ldq_uop_3_fp_ctrl_ren3;
	reg ldq_uop_3_fp_ctrl_swap12;
	reg ldq_uop_3_fp_ctrl_swap23;
	reg [1:0] ldq_uop_3_fp_ctrl_typeTagIn;
	reg [1:0] ldq_uop_3_fp_ctrl_typeTagOut;
	reg ldq_uop_3_fp_ctrl_fromint;
	reg ldq_uop_3_fp_ctrl_toint;
	reg ldq_uop_3_fp_ctrl_fastpipe;
	reg ldq_uop_3_fp_ctrl_fma;
	reg ldq_uop_3_fp_ctrl_div;
	reg ldq_uop_3_fp_ctrl_sqrt;
	reg ldq_uop_3_fp_ctrl_wflags;
	reg ldq_uop_3_fp_ctrl_vec;
	reg [4:0] ldq_uop_3_rob_idx;
	reg [3:0] ldq_uop_3_ldq_idx;
	reg [3:0] ldq_uop_3_stq_idx;
	reg [1:0] ldq_uop_3_rxq_idx;
	reg [5:0] ldq_uop_3_pdst;
	reg [5:0] ldq_uop_3_prs1;
	reg [5:0] ldq_uop_3_prs2;
	reg [5:0] ldq_uop_3_prs3;
	reg [3:0] ldq_uop_3_ppred;
	reg ldq_uop_3_prs1_busy;
	reg ldq_uop_3_prs2_busy;
	reg ldq_uop_3_prs3_busy;
	reg ldq_uop_3_ppred_busy;
	reg [5:0] ldq_uop_3_stale_pdst;
	reg ldq_uop_3_exception;
	reg [63:0] ldq_uop_3_exc_cause;
	reg [4:0] ldq_uop_3_mem_cmd;
	reg [1:0] ldq_uop_3_mem_size;
	reg ldq_uop_3_mem_signed;
	reg ldq_uop_3_uses_ldq;
	reg ldq_uop_3_uses_stq;
	reg ldq_uop_3_is_unique;
	reg ldq_uop_3_flush_on_commit;
	reg [2:0] ldq_uop_3_csr_cmd;
	reg ldq_uop_3_ldst_is_rs1;
	reg [5:0] ldq_uop_3_ldst;
	reg [5:0] ldq_uop_3_lrs1;
	reg [5:0] ldq_uop_3_lrs2;
	reg [5:0] ldq_uop_3_lrs3;
	reg [1:0] ldq_uop_3_dst_rtype;
	reg [1:0] ldq_uop_3_lrs1_rtype;
	reg [1:0] ldq_uop_3_lrs2_rtype;
	reg ldq_uop_3_frs3_en;
	reg ldq_uop_3_fcn_dw;
	reg [4:0] ldq_uop_3_fcn_op;
	reg ldq_uop_3_fp_val;
	reg [2:0] ldq_uop_3_fp_rm;
	reg [1:0] ldq_uop_3_fp_typ;
	reg ldq_uop_3_xcpt_pf_if;
	reg ldq_uop_3_xcpt_ae_if;
	reg ldq_uop_3_xcpt_ma_if;
	reg ldq_uop_3_bp_debug_if;
	reg ldq_uop_3_bp_xcpt_if;
	reg [2:0] ldq_uop_3_debug_fsrc;
	reg [2:0] ldq_uop_3_debug_tsrc;
	reg [31:0] ldq_uop_4_inst;
	reg [31:0] ldq_uop_4_debug_inst;
	reg ldq_uop_4_is_rvc;
	reg [39:0] ldq_uop_4_debug_pc;
	reg ldq_uop_4_iq_type_0;
	reg ldq_uop_4_iq_type_1;
	reg ldq_uop_4_iq_type_2;
	reg ldq_uop_4_iq_type_3;
	reg ldq_uop_4_fu_code_0;
	reg ldq_uop_4_fu_code_1;
	reg ldq_uop_4_fu_code_2;
	reg ldq_uop_4_fu_code_3;
	reg ldq_uop_4_fu_code_4;
	reg ldq_uop_4_fu_code_5;
	reg ldq_uop_4_fu_code_6;
	reg ldq_uop_4_fu_code_7;
	reg ldq_uop_4_fu_code_8;
	reg ldq_uop_4_fu_code_9;
	reg ldq_uop_4_iw_issued;
	reg ldq_uop_4_iw_issued_partial_agen;
	reg ldq_uop_4_iw_issued_partial_dgen;
	reg ldq_uop_4_iw_p1_speculative_child;
	reg ldq_uop_4_iw_p2_speculative_child;
	reg ldq_uop_4_iw_p1_bypass_hint;
	reg ldq_uop_4_iw_p2_bypass_hint;
	reg ldq_uop_4_iw_p3_bypass_hint;
	reg [7:0] ldq_uop_4_br_mask;
	reg [2:0] ldq_uop_4_br_tag;
	reg [3:0] ldq_uop_4_br_type;
	reg ldq_uop_4_is_sfb;
	reg ldq_uop_4_is_fence;
	reg ldq_uop_4_is_fencei;
	reg ldq_uop_4_is_sfence;
	reg ldq_uop_4_is_amo;
	reg ldq_uop_4_is_eret;
	reg ldq_uop_4_is_sys_pc2epc;
	reg ldq_uop_4_is_rocc;
	reg ldq_uop_4_is_mov;
	reg [3:0] ldq_uop_4_ftq_idx;
	reg ldq_uop_4_edge_inst;
	reg [5:0] ldq_uop_4_pc_lob;
	reg ldq_uop_4_taken;
	reg ldq_uop_4_imm_rename;
	reg [2:0] ldq_uop_4_imm_sel;
	reg [4:0] ldq_uop_4_pimm;
	reg [19:0] ldq_uop_4_imm_packed;
	reg [1:0] ldq_uop_4_op1_sel;
	reg [2:0] ldq_uop_4_op2_sel;
	reg ldq_uop_4_fp_ctrl_ldst;
	reg ldq_uop_4_fp_ctrl_wen;
	reg ldq_uop_4_fp_ctrl_ren1;
	reg ldq_uop_4_fp_ctrl_ren2;
	reg ldq_uop_4_fp_ctrl_ren3;
	reg ldq_uop_4_fp_ctrl_swap12;
	reg ldq_uop_4_fp_ctrl_swap23;
	reg [1:0] ldq_uop_4_fp_ctrl_typeTagIn;
	reg [1:0] ldq_uop_4_fp_ctrl_typeTagOut;
	reg ldq_uop_4_fp_ctrl_fromint;
	reg ldq_uop_4_fp_ctrl_toint;
	reg ldq_uop_4_fp_ctrl_fastpipe;
	reg ldq_uop_4_fp_ctrl_fma;
	reg ldq_uop_4_fp_ctrl_div;
	reg ldq_uop_4_fp_ctrl_sqrt;
	reg ldq_uop_4_fp_ctrl_wflags;
	reg ldq_uop_4_fp_ctrl_vec;
	reg [4:0] ldq_uop_4_rob_idx;
	reg [3:0] ldq_uop_4_ldq_idx;
	reg [3:0] ldq_uop_4_stq_idx;
	reg [1:0] ldq_uop_4_rxq_idx;
	reg [5:0] ldq_uop_4_pdst;
	reg [5:0] ldq_uop_4_prs1;
	reg [5:0] ldq_uop_4_prs2;
	reg [5:0] ldq_uop_4_prs3;
	reg [3:0] ldq_uop_4_ppred;
	reg ldq_uop_4_prs1_busy;
	reg ldq_uop_4_prs2_busy;
	reg ldq_uop_4_prs3_busy;
	reg ldq_uop_4_ppred_busy;
	reg [5:0] ldq_uop_4_stale_pdst;
	reg ldq_uop_4_exception;
	reg [63:0] ldq_uop_4_exc_cause;
	reg [4:0] ldq_uop_4_mem_cmd;
	reg [1:0] ldq_uop_4_mem_size;
	reg ldq_uop_4_mem_signed;
	reg ldq_uop_4_uses_ldq;
	reg ldq_uop_4_uses_stq;
	reg ldq_uop_4_is_unique;
	reg ldq_uop_4_flush_on_commit;
	reg [2:0] ldq_uop_4_csr_cmd;
	reg ldq_uop_4_ldst_is_rs1;
	reg [5:0] ldq_uop_4_ldst;
	reg [5:0] ldq_uop_4_lrs1;
	reg [5:0] ldq_uop_4_lrs2;
	reg [5:0] ldq_uop_4_lrs3;
	reg [1:0] ldq_uop_4_dst_rtype;
	reg [1:0] ldq_uop_4_lrs1_rtype;
	reg [1:0] ldq_uop_4_lrs2_rtype;
	reg ldq_uop_4_frs3_en;
	reg ldq_uop_4_fcn_dw;
	reg [4:0] ldq_uop_4_fcn_op;
	reg ldq_uop_4_fp_val;
	reg [2:0] ldq_uop_4_fp_rm;
	reg [1:0] ldq_uop_4_fp_typ;
	reg ldq_uop_4_xcpt_pf_if;
	reg ldq_uop_4_xcpt_ae_if;
	reg ldq_uop_4_xcpt_ma_if;
	reg ldq_uop_4_bp_debug_if;
	reg ldq_uop_4_bp_xcpt_if;
	reg [2:0] ldq_uop_4_debug_fsrc;
	reg [2:0] ldq_uop_4_debug_tsrc;
	reg [31:0] ldq_uop_5_inst;
	reg [31:0] ldq_uop_5_debug_inst;
	reg ldq_uop_5_is_rvc;
	reg [39:0] ldq_uop_5_debug_pc;
	reg ldq_uop_5_iq_type_0;
	reg ldq_uop_5_iq_type_1;
	reg ldq_uop_5_iq_type_2;
	reg ldq_uop_5_iq_type_3;
	reg ldq_uop_5_fu_code_0;
	reg ldq_uop_5_fu_code_1;
	reg ldq_uop_5_fu_code_2;
	reg ldq_uop_5_fu_code_3;
	reg ldq_uop_5_fu_code_4;
	reg ldq_uop_5_fu_code_5;
	reg ldq_uop_5_fu_code_6;
	reg ldq_uop_5_fu_code_7;
	reg ldq_uop_5_fu_code_8;
	reg ldq_uop_5_fu_code_9;
	reg ldq_uop_5_iw_issued;
	reg ldq_uop_5_iw_issued_partial_agen;
	reg ldq_uop_5_iw_issued_partial_dgen;
	reg ldq_uop_5_iw_p1_speculative_child;
	reg ldq_uop_5_iw_p2_speculative_child;
	reg ldq_uop_5_iw_p1_bypass_hint;
	reg ldq_uop_5_iw_p2_bypass_hint;
	reg ldq_uop_5_iw_p3_bypass_hint;
	reg [7:0] ldq_uop_5_br_mask;
	reg [2:0] ldq_uop_5_br_tag;
	reg [3:0] ldq_uop_5_br_type;
	reg ldq_uop_5_is_sfb;
	reg ldq_uop_5_is_fence;
	reg ldq_uop_5_is_fencei;
	reg ldq_uop_5_is_sfence;
	reg ldq_uop_5_is_amo;
	reg ldq_uop_5_is_eret;
	reg ldq_uop_5_is_sys_pc2epc;
	reg ldq_uop_5_is_rocc;
	reg ldq_uop_5_is_mov;
	reg [3:0] ldq_uop_5_ftq_idx;
	reg ldq_uop_5_edge_inst;
	reg [5:0] ldq_uop_5_pc_lob;
	reg ldq_uop_5_taken;
	reg ldq_uop_5_imm_rename;
	reg [2:0] ldq_uop_5_imm_sel;
	reg [4:0] ldq_uop_5_pimm;
	reg [19:0] ldq_uop_5_imm_packed;
	reg [1:0] ldq_uop_5_op1_sel;
	reg [2:0] ldq_uop_5_op2_sel;
	reg ldq_uop_5_fp_ctrl_ldst;
	reg ldq_uop_5_fp_ctrl_wen;
	reg ldq_uop_5_fp_ctrl_ren1;
	reg ldq_uop_5_fp_ctrl_ren2;
	reg ldq_uop_5_fp_ctrl_ren3;
	reg ldq_uop_5_fp_ctrl_swap12;
	reg ldq_uop_5_fp_ctrl_swap23;
	reg [1:0] ldq_uop_5_fp_ctrl_typeTagIn;
	reg [1:0] ldq_uop_5_fp_ctrl_typeTagOut;
	reg ldq_uop_5_fp_ctrl_fromint;
	reg ldq_uop_5_fp_ctrl_toint;
	reg ldq_uop_5_fp_ctrl_fastpipe;
	reg ldq_uop_5_fp_ctrl_fma;
	reg ldq_uop_5_fp_ctrl_div;
	reg ldq_uop_5_fp_ctrl_sqrt;
	reg ldq_uop_5_fp_ctrl_wflags;
	reg ldq_uop_5_fp_ctrl_vec;
	reg [4:0] ldq_uop_5_rob_idx;
	reg [3:0] ldq_uop_5_ldq_idx;
	reg [3:0] ldq_uop_5_stq_idx;
	reg [1:0] ldq_uop_5_rxq_idx;
	reg [5:0] ldq_uop_5_pdst;
	reg [5:0] ldq_uop_5_prs1;
	reg [5:0] ldq_uop_5_prs2;
	reg [5:0] ldq_uop_5_prs3;
	reg [3:0] ldq_uop_5_ppred;
	reg ldq_uop_5_prs1_busy;
	reg ldq_uop_5_prs2_busy;
	reg ldq_uop_5_prs3_busy;
	reg ldq_uop_5_ppred_busy;
	reg [5:0] ldq_uop_5_stale_pdst;
	reg ldq_uop_5_exception;
	reg [63:0] ldq_uop_5_exc_cause;
	reg [4:0] ldq_uop_5_mem_cmd;
	reg [1:0] ldq_uop_5_mem_size;
	reg ldq_uop_5_mem_signed;
	reg ldq_uop_5_uses_ldq;
	reg ldq_uop_5_uses_stq;
	reg ldq_uop_5_is_unique;
	reg ldq_uop_5_flush_on_commit;
	reg [2:0] ldq_uop_5_csr_cmd;
	reg ldq_uop_5_ldst_is_rs1;
	reg [5:0] ldq_uop_5_ldst;
	reg [5:0] ldq_uop_5_lrs1;
	reg [5:0] ldq_uop_5_lrs2;
	reg [5:0] ldq_uop_5_lrs3;
	reg [1:0] ldq_uop_5_dst_rtype;
	reg [1:0] ldq_uop_5_lrs1_rtype;
	reg [1:0] ldq_uop_5_lrs2_rtype;
	reg ldq_uop_5_frs3_en;
	reg ldq_uop_5_fcn_dw;
	reg [4:0] ldq_uop_5_fcn_op;
	reg ldq_uop_5_fp_val;
	reg [2:0] ldq_uop_5_fp_rm;
	reg [1:0] ldq_uop_5_fp_typ;
	reg ldq_uop_5_xcpt_pf_if;
	reg ldq_uop_5_xcpt_ae_if;
	reg ldq_uop_5_xcpt_ma_if;
	reg ldq_uop_5_bp_debug_if;
	reg ldq_uop_5_bp_xcpt_if;
	reg [2:0] ldq_uop_5_debug_fsrc;
	reg [2:0] ldq_uop_5_debug_tsrc;
	reg [31:0] ldq_uop_6_inst;
	reg [31:0] ldq_uop_6_debug_inst;
	reg ldq_uop_6_is_rvc;
	reg [39:0] ldq_uop_6_debug_pc;
	reg ldq_uop_6_iq_type_0;
	reg ldq_uop_6_iq_type_1;
	reg ldq_uop_6_iq_type_2;
	reg ldq_uop_6_iq_type_3;
	reg ldq_uop_6_fu_code_0;
	reg ldq_uop_6_fu_code_1;
	reg ldq_uop_6_fu_code_2;
	reg ldq_uop_6_fu_code_3;
	reg ldq_uop_6_fu_code_4;
	reg ldq_uop_6_fu_code_5;
	reg ldq_uop_6_fu_code_6;
	reg ldq_uop_6_fu_code_7;
	reg ldq_uop_6_fu_code_8;
	reg ldq_uop_6_fu_code_9;
	reg ldq_uop_6_iw_issued;
	reg ldq_uop_6_iw_issued_partial_agen;
	reg ldq_uop_6_iw_issued_partial_dgen;
	reg ldq_uop_6_iw_p1_speculative_child;
	reg ldq_uop_6_iw_p2_speculative_child;
	reg ldq_uop_6_iw_p1_bypass_hint;
	reg ldq_uop_6_iw_p2_bypass_hint;
	reg ldq_uop_6_iw_p3_bypass_hint;
	reg [7:0] ldq_uop_6_br_mask;
	reg [2:0] ldq_uop_6_br_tag;
	reg [3:0] ldq_uop_6_br_type;
	reg ldq_uop_6_is_sfb;
	reg ldq_uop_6_is_fence;
	reg ldq_uop_6_is_fencei;
	reg ldq_uop_6_is_sfence;
	reg ldq_uop_6_is_amo;
	reg ldq_uop_6_is_eret;
	reg ldq_uop_6_is_sys_pc2epc;
	reg ldq_uop_6_is_rocc;
	reg ldq_uop_6_is_mov;
	reg [3:0] ldq_uop_6_ftq_idx;
	reg ldq_uop_6_edge_inst;
	reg [5:0] ldq_uop_6_pc_lob;
	reg ldq_uop_6_taken;
	reg ldq_uop_6_imm_rename;
	reg [2:0] ldq_uop_6_imm_sel;
	reg [4:0] ldq_uop_6_pimm;
	reg [19:0] ldq_uop_6_imm_packed;
	reg [1:0] ldq_uop_6_op1_sel;
	reg [2:0] ldq_uop_6_op2_sel;
	reg ldq_uop_6_fp_ctrl_ldst;
	reg ldq_uop_6_fp_ctrl_wen;
	reg ldq_uop_6_fp_ctrl_ren1;
	reg ldq_uop_6_fp_ctrl_ren2;
	reg ldq_uop_6_fp_ctrl_ren3;
	reg ldq_uop_6_fp_ctrl_swap12;
	reg ldq_uop_6_fp_ctrl_swap23;
	reg [1:0] ldq_uop_6_fp_ctrl_typeTagIn;
	reg [1:0] ldq_uop_6_fp_ctrl_typeTagOut;
	reg ldq_uop_6_fp_ctrl_fromint;
	reg ldq_uop_6_fp_ctrl_toint;
	reg ldq_uop_6_fp_ctrl_fastpipe;
	reg ldq_uop_6_fp_ctrl_fma;
	reg ldq_uop_6_fp_ctrl_div;
	reg ldq_uop_6_fp_ctrl_sqrt;
	reg ldq_uop_6_fp_ctrl_wflags;
	reg ldq_uop_6_fp_ctrl_vec;
	reg [4:0] ldq_uop_6_rob_idx;
	reg [3:0] ldq_uop_6_ldq_idx;
	reg [3:0] ldq_uop_6_stq_idx;
	reg [1:0] ldq_uop_6_rxq_idx;
	reg [5:0] ldq_uop_6_pdst;
	reg [5:0] ldq_uop_6_prs1;
	reg [5:0] ldq_uop_6_prs2;
	reg [5:0] ldq_uop_6_prs3;
	reg [3:0] ldq_uop_6_ppred;
	reg ldq_uop_6_prs1_busy;
	reg ldq_uop_6_prs2_busy;
	reg ldq_uop_6_prs3_busy;
	reg ldq_uop_6_ppred_busy;
	reg [5:0] ldq_uop_6_stale_pdst;
	reg ldq_uop_6_exception;
	reg [63:0] ldq_uop_6_exc_cause;
	reg [4:0] ldq_uop_6_mem_cmd;
	reg [1:0] ldq_uop_6_mem_size;
	reg ldq_uop_6_mem_signed;
	reg ldq_uop_6_uses_ldq;
	reg ldq_uop_6_uses_stq;
	reg ldq_uop_6_is_unique;
	reg ldq_uop_6_flush_on_commit;
	reg [2:0] ldq_uop_6_csr_cmd;
	reg ldq_uop_6_ldst_is_rs1;
	reg [5:0] ldq_uop_6_ldst;
	reg [5:0] ldq_uop_6_lrs1;
	reg [5:0] ldq_uop_6_lrs2;
	reg [5:0] ldq_uop_6_lrs3;
	reg [1:0] ldq_uop_6_dst_rtype;
	reg [1:0] ldq_uop_6_lrs1_rtype;
	reg [1:0] ldq_uop_6_lrs2_rtype;
	reg ldq_uop_6_frs3_en;
	reg ldq_uop_6_fcn_dw;
	reg [4:0] ldq_uop_6_fcn_op;
	reg ldq_uop_6_fp_val;
	reg [2:0] ldq_uop_6_fp_rm;
	reg [1:0] ldq_uop_6_fp_typ;
	reg ldq_uop_6_xcpt_pf_if;
	reg ldq_uop_6_xcpt_ae_if;
	reg ldq_uop_6_xcpt_ma_if;
	reg ldq_uop_6_bp_debug_if;
	reg ldq_uop_6_bp_xcpt_if;
	reg [2:0] ldq_uop_6_debug_fsrc;
	reg [2:0] ldq_uop_6_debug_tsrc;
	reg [31:0] ldq_uop_7_inst;
	reg [31:0] ldq_uop_7_debug_inst;
	reg ldq_uop_7_is_rvc;
	reg [39:0] ldq_uop_7_debug_pc;
	reg ldq_uop_7_iq_type_0;
	reg ldq_uop_7_iq_type_1;
	reg ldq_uop_7_iq_type_2;
	reg ldq_uop_7_iq_type_3;
	reg ldq_uop_7_fu_code_0;
	reg ldq_uop_7_fu_code_1;
	reg ldq_uop_7_fu_code_2;
	reg ldq_uop_7_fu_code_3;
	reg ldq_uop_7_fu_code_4;
	reg ldq_uop_7_fu_code_5;
	reg ldq_uop_7_fu_code_6;
	reg ldq_uop_7_fu_code_7;
	reg ldq_uop_7_fu_code_8;
	reg ldq_uop_7_fu_code_9;
	reg ldq_uop_7_iw_issued;
	reg ldq_uop_7_iw_issued_partial_agen;
	reg ldq_uop_7_iw_issued_partial_dgen;
	reg ldq_uop_7_iw_p1_speculative_child;
	reg ldq_uop_7_iw_p2_speculative_child;
	reg ldq_uop_7_iw_p1_bypass_hint;
	reg ldq_uop_7_iw_p2_bypass_hint;
	reg ldq_uop_7_iw_p3_bypass_hint;
	reg [7:0] ldq_uop_7_br_mask;
	reg [2:0] ldq_uop_7_br_tag;
	reg [3:0] ldq_uop_7_br_type;
	reg ldq_uop_7_is_sfb;
	reg ldq_uop_7_is_fence;
	reg ldq_uop_7_is_fencei;
	reg ldq_uop_7_is_sfence;
	reg ldq_uop_7_is_amo;
	reg ldq_uop_7_is_eret;
	reg ldq_uop_7_is_sys_pc2epc;
	reg ldq_uop_7_is_rocc;
	reg ldq_uop_7_is_mov;
	reg [3:0] ldq_uop_7_ftq_idx;
	reg ldq_uop_7_edge_inst;
	reg [5:0] ldq_uop_7_pc_lob;
	reg ldq_uop_7_taken;
	reg ldq_uop_7_imm_rename;
	reg [2:0] ldq_uop_7_imm_sel;
	reg [4:0] ldq_uop_7_pimm;
	reg [19:0] ldq_uop_7_imm_packed;
	reg [1:0] ldq_uop_7_op1_sel;
	reg [2:0] ldq_uop_7_op2_sel;
	reg ldq_uop_7_fp_ctrl_ldst;
	reg ldq_uop_7_fp_ctrl_wen;
	reg ldq_uop_7_fp_ctrl_ren1;
	reg ldq_uop_7_fp_ctrl_ren2;
	reg ldq_uop_7_fp_ctrl_ren3;
	reg ldq_uop_7_fp_ctrl_swap12;
	reg ldq_uop_7_fp_ctrl_swap23;
	reg [1:0] ldq_uop_7_fp_ctrl_typeTagIn;
	reg [1:0] ldq_uop_7_fp_ctrl_typeTagOut;
	reg ldq_uop_7_fp_ctrl_fromint;
	reg ldq_uop_7_fp_ctrl_toint;
	reg ldq_uop_7_fp_ctrl_fastpipe;
	reg ldq_uop_7_fp_ctrl_fma;
	reg ldq_uop_7_fp_ctrl_div;
	reg ldq_uop_7_fp_ctrl_sqrt;
	reg ldq_uop_7_fp_ctrl_wflags;
	reg ldq_uop_7_fp_ctrl_vec;
	reg [4:0] ldq_uop_7_rob_idx;
	reg [3:0] ldq_uop_7_ldq_idx;
	reg [3:0] ldq_uop_7_stq_idx;
	reg [1:0] ldq_uop_7_rxq_idx;
	reg [5:0] ldq_uop_7_pdst;
	reg [5:0] ldq_uop_7_prs1;
	reg [5:0] ldq_uop_7_prs2;
	reg [5:0] ldq_uop_7_prs3;
	reg [3:0] ldq_uop_7_ppred;
	reg ldq_uop_7_prs1_busy;
	reg ldq_uop_7_prs2_busy;
	reg ldq_uop_7_prs3_busy;
	reg ldq_uop_7_ppred_busy;
	reg [5:0] ldq_uop_7_stale_pdst;
	reg ldq_uop_7_exception;
	reg [63:0] ldq_uop_7_exc_cause;
	reg [4:0] ldq_uop_7_mem_cmd;
	reg [1:0] ldq_uop_7_mem_size;
	reg ldq_uop_7_mem_signed;
	reg ldq_uop_7_uses_ldq;
	reg ldq_uop_7_uses_stq;
	reg ldq_uop_7_is_unique;
	reg ldq_uop_7_flush_on_commit;
	reg [2:0] ldq_uop_7_csr_cmd;
	reg ldq_uop_7_ldst_is_rs1;
	reg [5:0] ldq_uop_7_ldst;
	reg [5:0] ldq_uop_7_lrs1;
	reg [5:0] ldq_uop_7_lrs2;
	reg [5:0] ldq_uop_7_lrs3;
	reg [1:0] ldq_uop_7_dst_rtype;
	reg [1:0] ldq_uop_7_lrs1_rtype;
	reg [1:0] ldq_uop_7_lrs2_rtype;
	reg ldq_uop_7_frs3_en;
	reg ldq_uop_7_fcn_dw;
	reg [4:0] ldq_uop_7_fcn_op;
	reg ldq_uop_7_fp_val;
	reg [2:0] ldq_uop_7_fp_rm;
	reg [1:0] ldq_uop_7_fp_typ;
	reg ldq_uop_7_xcpt_pf_if;
	reg ldq_uop_7_xcpt_ae_if;
	reg ldq_uop_7_xcpt_ma_if;
	reg ldq_uop_7_bp_debug_if;
	reg ldq_uop_7_bp_xcpt_if;
	reg [2:0] ldq_uop_7_debug_fsrc;
	reg [2:0] ldq_uop_7_debug_tsrc;
	reg ldq_addr_0_valid;
	reg [39:0] ldq_addr_0_bits;
	reg ldq_addr_1_valid;
	reg [39:0] ldq_addr_1_bits;
	reg ldq_addr_2_valid;
	reg [39:0] ldq_addr_2_bits;
	reg ldq_addr_3_valid;
	reg [39:0] ldq_addr_3_bits;
	reg ldq_addr_4_valid;
	reg [39:0] ldq_addr_4_bits;
	reg ldq_addr_5_valid;
	reg [39:0] ldq_addr_5_bits;
	reg ldq_addr_6_valid;
	reg [39:0] ldq_addr_6_bits;
	reg ldq_addr_7_valid;
	reg [39:0] ldq_addr_7_bits;
	reg ldq_addr_is_virtual_0;
	reg ldq_addr_is_virtual_1;
	reg ldq_addr_is_virtual_2;
	reg ldq_addr_is_virtual_3;
	reg ldq_addr_is_virtual_4;
	reg ldq_addr_is_virtual_5;
	reg ldq_addr_is_virtual_6;
	reg ldq_addr_is_virtual_7;
	reg ldq_addr_is_uncacheable_0;
	reg ldq_addr_is_uncacheable_1;
	reg ldq_addr_is_uncacheable_2;
	reg ldq_addr_is_uncacheable_3;
	reg ldq_addr_is_uncacheable_4;
	reg ldq_addr_is_uncacheable_5;
	reg ldq_addr_is_uncacheable_6;
	reg ldq_addr_is_uncacheable_7;
	reg ldq_executed_0;
	reg ldq_executed_1;
	reg ldq_executed_2;
	reg ldq_executed_3;
	reg ldq_executed_4;
	reg ldq_executed_5;
	reg ldq_executed_6;
	reg ldq_executed_7;
	reg ldq_succeeded_0;
	reg ldq_succeeded_1;
	reg ldq_succeeded_2;
	reg ldq_succeeded_3;
	reg ldq_succeeded_4;
	reg ldq_succeeded_5;
	reg ldq_succeeded_6;
	reg ldq_succeeded_7;
	reg ldq_order_fail_0;
	reg ldq_order_fail_1;
	reg ldq_order_fail_2;
	reg ldq_order_fail_3;
	reg ldq_order_fail_4;
	reg ldq_order_fail_5;
	reg ldq_order_fail_6;
	reg ldq_order_fail_7;
	reg ldq_observed_0;
	reg ldq_observed_1;
	reg ldq_observed_2;
	reg ldq_observed_3;
	reg ldq_observed_4;
	reg ldq_observed_5;
	reg ldq_observed_6;
	reg ldq_observed_7;
	reg [3:0] ldq_next_stq_idx_0;
	reg [3:0] ldq_next_stq_idx_1;
	reg [3:0] ldq_next_stq_idx_2;
	reg [3:0] ldq_next_stq_idx_3;
	reg [3:0] ldq_next_stq_idx_4;
	reg [3:0] ldq_next_stq_idx_5;
	reg [3:0] ldq_next_stq_idx_6;
	reg [3:0] ldq_next_stq_idx_7;
	reg [7:0] ldq_ld_byte_mask_0;
	reg [7:0] ldq_ld_byte_mask_1;
	reg [7:0] ldq_ld_byte_mask_2;
	reg [7:0] ldq_ld_byte_mask_3;
	reg [7:0] ldq_ld_byte_mask_4;
	reg [7:0] ldq_ld_byte_mask_5;
	reg [7:0] ldq_ld_byte_mask_6;
	reg [7:0] ldq_ld_byte_mask_7;
	reg ldq_forward_std_val_0;
	reg ldq_forward_std_val_1;
	reg ldq_forward_std_val_2;
	reg ldq_forward_std_val_3;
	reg ldq_forward_std_val_4;
	reg ldq_forward_std_val_5;
	reg ldq_forward_std_val_6;
	reg ldq_forward_std_val_7;
	reg [3:0] ldq_forward_stq_idx_0;
	reg [3:0] ldq_forward_stq_idx_1;
	reg [3:0] ldq_forward_stq_idx_2;
	reg [3:0] ldq_forward_stq_idx_3;
	reg [3:0] ldq_forward_stq_idx_4;
	reg [3:0] ldq_forward_stq_idx_5;
	reg [3:0] ldq_forward_stq_idx_6;
	reg [3:0] ldq_forward_stq_idx_7;
	reg stq_valid_0;
	reg stq_valid_1;
	reg stq_valid_2;
	reg stq_valid_3;
	reg stq_valid_4;
	reg stq_valid_5;
	reg stq_valid_6;
	reg stq_valid_7;
	reg [31:0] stq_uop_0_inst;
	reg [31:0] stq_uop_0_debug_inst;
	reg stq_uop_0_is_rvc;
	reg [39:0] stq_uop_0_debug_pc;
	reg stq_uop_0_iq_type_0;
	reg stq_uop_0_iq_type_1;
	reg stq_uop_0_iq_type_2;
	reg stq_uop_0_iq_type_3;
	reg stq_uop_0_fu_code_0;
	reg stq_uop_0_fu_code_1;
	reg stq_uop_0_fu_code_2;
	reg stq_uop_0_fu_code_3;
	reg stq_uop_0_fu_code_4;
	reg stq_uop_0_fu_code_5;
	reg stq_uop_0_fu_code_6;
	reg stq_uop_0_fu_code_7;
	reg stq_uop_0_fu_code_8;
	reg stq_uop_0_fu_code_9;
	reg stq_uop_0_iw_issued;
	reg stq_uop_0_iw_issued_partial_agen;
	reg stq_uop_0_iw_issued_partial_dgen;
	reg stq_uop_0_iw_p1_speculative_child;
	reg stq_uop_0_iw_p2_speculative_child;
	reg stq_uop_0_iw_p1_bypass_hint;
	reg stq_uop_0_iw_p2_bypass_hint;
	reg stq_uop_0_iw_p3_bypass_hint;
	reg [7:0] stq_uop_0_br_mask;
	reg [2:0] stq_uop_0_br_tag;
	reg [3:0] stq_uop_0_br_type;
	reg stq_uop_0_is_sfb;
	reg stq_uop_0_is_fence;
	reg stq_uop_0_is_fencei;
	reg stq_uop_0_is_sfence;
	reg stq_uop_0_is_amo;
	reg stq_uop_0_is_eret;
	reg stq_uop_0_is_sys_pc2epc;
	reg stq_uop_0_is_rocc;
	reg stq_uop_0_is_mov;
	reg [3:0] stq_uop_0_ftq_idx;
	reg stq_uop_0_edge_inst;
	reg [5:0] stq_uop_0_pc_lob;
	reg stq_uop_0_taken;
	reg stq_uop_0_imm_rename;
	reg [2:0] stq_uop_0_imm_sel;
	reg [4:0] stq_uop_0_pimm;
	reg [19:0] stq_uop_0_imm_packed;
	reg [1:0] stq_uop_0_op1_sel;
	reg [2:0] stq_uop_0_op2_sel;
	reg stq_uop_0_fp_ctrl_ldst;
	reg stq_uop_0_fp_ctrl_wen;
	reg stq_uop_0_fp_ctrl_ren1;
	reg stq_uop_0_fp_ctrl_ren2;
	reg stq_uop_0_fp_ctrl_ren3;
	reg stq_uop_0_fp_ctrl_swap12;
	reg stq_uop_0_fp_ctrl_swap23;
	reg [1:0] stq_uop_0_fp_ctrl_typeTagIn;
	reg [1:0] stq_uop_0_fp_ctrl_typeTagOut;
	reg stq_uop_0_fp_ctrl_fromint;
	reg stq_uop_0_fp_ctrl_toint;
	reg stq_uop_0_fp_ctrl_fastpipe;
	reg stq_uop_0_fp_ctrl_fma;
	reg stq_uop_0_fp_ctrl_div;
	reg stq_uop_0_fp_ctrl_sqrt;
	reg stq_uop_0_fp_ctrl_wflags;
	reg stq_uop_0_fp_ctrl_vec;
	reg [4:0] stq_uop_0_rob_idx;
	reg [3:0] stq_uop_0_ldq_idx;
	reg [3:0] stq_uop_0_stq_idx;
	reg [1:0] stq_uop_0_rxq_idx;
	reg [5:0] stq_uop_0_pdst;
	reg [5:0] stq_uop_0_prs1;
	reg [5:0] stq_uop_0_prs2;
	reg [5:0] stq_uop_0_prs3;
	reg [3:0] stq_uop_0_ppred;
	reg stq_uop_0_prs1_busy;
	reg stq_uop_0_prs2_busy;
	reg stq_uop_0_prs3_busy;
	reg stq_uop_0_ppred_busy;
	reg [5:0] stq_uop_0_stale_pdst;
	reg stq_uop_0_exception;
	reg [63:0] stq_uop_0_exc_cause;
	reg [4:0] stq_uop_0_mem_cmd;
	reg [1:0] stq_uop_0_mem_size;
	reg stq_uop_0_mem_signed;
	reg stq_uop_0_uses_ldq;
	reg stq_uop_0_uses_stq;
	reg stq_uop_0_is_unique;
	reg stq_uop_0_flush_on_commit;
	reg [2:0] stq_uop_0_csr_cmd;
	reg stq_uop_0_ldst_is_rs1;
	reg [5:0] stq_uop_0_ldst;
	reg [5:0] stq_uop_0_lrs1;
	reg [5:0] stq_uop_0_lrs2;
	reg [5:0] stq_uop_0_lrs3;
	reg [1:0] stq_uop_0_dst_rtype;
	reg [1:0] stq_uop_0_lrs1_rtype;
	reg [1:0] stq_uop_0_lrs2_rtype;
	reg stq_uop_0_frs3_en;
	reg stq_uop_0_fcn_dw;
	reg [4:0] stq_uop_0_fcn_op;
	reg stq_uop_0_fp_val;
	reg [2:0] stq_uop_0_fp_rm;
	reg [1:0] stq_uop_0_fp_typ;
	reg stq_uop_0_xcpt_pf_if;
	reg stq_uop_0_xcpt_ae_if;
	reg stq_uop_0_xcpt_ma_if;
	reg stq_uop_0_bp_debug_if;
	reg stq_uop_0_bp_xcpt_if;
	reg [2:0] stq_uop_0_debug_fsrc;
	reg [2:0] stq_uop_0_debug_tsrc;
	reg [31:0] stq_uop_1_inst;
	reg [31:0] stq_uop_1_debug_inst;
	reg stq_uop_1_is_rvc;
	reg [39:0] stq_uop_1_debug_pc;
	reg stq_uop_1_iq_type_0;
	reg stq_uop_1_iq_type_1;
	reg stq_uop_1_iq_type_2;
	reg stq_uop_1_iq_type_3;
	reg stq_uop_1_fu_code_0;
	reg stq_uop_1_fu_code_1;
	reg stq_uop_1_fu_code_2;
	reg stq_uop_1_fu_code_3;
	reg stq_uop_1_fu_code_4;
	reg stq_uop_1_fu_code_5;
	reg stq_uop_1_fu_code_6;
	reg stq_uop_1_fu_code_7;
	reg stq_uop_1_fu_code_8;
	reg stq_uop_1_fu_code_9;
	reg stq_uop_1_iw_issued;
	reg stq_uop_1_iw_issued_partial_agen;
	reg stq_uop_1_iw_issued_partial_dgen;
	reg stq_uop_1_iw_p1_speculative_child;
	reg stq_uop_1_iw_p2_speculative_child;
	reg stq_uop_1_iw_p1_bypass_hint;
	reg stq_uop_1_iw_p2_bypass_hint;
	reg stq_uop_1_iw_p3_bypass_hint;
	reg [7:0] stq_uop_1_br_mask;
	reg [2:0] stq_uop_1_br_tag;
	reg [3:0] stq_uop_1_br_type;
	reg stq_uop_1_is_sfb;
	reg stq_uop_1_is_fence;
	reg stq_uop_1_is_fencei;
	reg stq_uop_1_is_sfence;
	reg stq_uop_1_is_amo;
	reg stq_uop_1_is_eret;
	reg stq_uop_1_is_sys_pc2epc;
	reg stq_uop_1_is_rocc;
	reg stq_uop_1_is_mov;
	reg [3:0] stq_uop_1_ftq_idx;
	reg stq_uop_1_edge_inst;
	reg [5:0] stq_uop_1_pc_lob;
	reg stq_uop_1_taken;
	reg stq_uop_1_imm_rename;
	reg [2:0] stq_uop_1_imm_sel;
	reg [4:0] stq_uop_1_pimm;
	reg [19:0] stq_uop_1_imm_packed;
	reg [1:0] stq_uop_1_op1_sel;
	reg [2:0] stq_uop_1_op2_sel;
	reg stq_uop_1_fp_ctrl_ldst;
	reg stq_uop_1_fp_ctrl_wen;
	reg stq_uop_1_fp_ctrl_ren1;
	reg stq_uop_1_fp_ctrl_ren2;
	reg stq_uop_1_fp_ctrl_ren3;
	reg stq_uop_1_fp_ctrl_swap12;
	reg stq_uop_1_fp_ctrl_swap23;
	reg [1:0] stq_uop_1_fp_ctrl_typeTagIn;
	reg [1:0] stq_uop_1_fp_ctrl_typeTagOut;
	reg stq_uop_1_fp_ctrl_fromint;
	reg stq_uop_1_fp_ctrl_toint;
	reg stq_uop_1_fp_ctrl_fastpipe;
	reg stq_uop_1_fp_ctrl_fma;
	reg stq_uop_1_fp_ctrl_div;
	reg stq_uop_1_fp_ctrl_sqrt;
	reg stq_uop_1_fp_ctrl_wflags;
	reg stq_uop_1_fp_ctrl_vec;
	reg [4:0] stq_uop_1_rob_idx;
	reg [3:0] stq_uop_1_ldq_idx;
	reg [3:0] stq_uop_1_stq_idx;
	reg [1:0] stq_uop_1_rxq_idx;
	reg [5:0] stq_uop_1_pdst;
	reg [5:0] stq_uop_1_prs1;
	reg [5:0] stq_uop_1_prs2;
	reg [5:0] stq_uop_1_prs3;
	reg [3:0] stq_uop_1_ppred;
	reg stq_uop_1_prs1_busy;
	reg stq_uop_1_prs2_busy;
	reg stq_uop_1_prs3_busy;
	reg stq_uop_1_ppred_busy;
	reg [5:0] stq_uop_1_stale_pdst;
	reg stq_uop_1_exception;
	reg [63:0] stq_uop_1_exc_cause;
	reg [4:0] stq_uop_1_mem_cmd;
	reg [1:0] stq_uop_1_mem_size;
	reg stq_uop_1_mem_signed;
	reg stq_uop_1_uses_ldq;
	reg stq_uop_1_uses_stq;
	reg stq_uop_1_is_unique;
	reg stq_uop_1_flush_on_commit;
	reg [2:0] stq_uop_1_csr_cmd;
	reg stq_uop_1_ldst_is_rs1;
	reg [5:0] stq_uop_1_ldst;
	reg [5:0] stq_uop_1_lrs1;
	reg [5:0] stq_uop_1_lrs2;
	reg [5:0] stq_uop_1_lrs3;
	reg [1:0] stq_uop_1_dst_rtype;
	reg [1:0] stq_uop_1_lrs1_rtype;
	reg [1:0] stq_uop_1_lrs2_rtype;
	reg stq_uop_1_frs3_en;
	reg stq_uop_1_fcn_dw;
	reg [4:0] stq_uop_1_fcn_op;
	reg stq_uop_1_fp_val;
	reg [2:0] stq_uop_1_fp_rm;
	reg [1:0] stq_uop_1_fp_typ;
	reg stq_uop_1_xcpt_pf_if;
	reg stq_uop_1_xcpt_ae_if;
	reg stq_uop_1_xcpt_ma_if;
	reg stq_uop_1_bp_debug_if;
	reg stq_uop_1_bp_xcpt_if;
	reg [2:0] stq_uop_1_debug_fsrc;
	reg [2:0] stq_uop_1_debug_tsrc;
	reg [31:0] stq_uop_2_inst;
	reg [31:0] stq_uop_2_debug_inst;
	reg stq_uop_2_is_rvc;
	reg [39:0] stq_uop_2_debug_pc;
	reg stq_uop_2_iq_type_0;
	reg stq_uop_2_iq_type_1;
	reg stq_uop_2_iq_type_2;
	reg stq_uop_2_iq_type_3;
	reg stq_uop_2_fu_code_0;
	reg stq_uop_2_fu_code_1;
	reg stq_uop_2_fu_code_2;
	reg stq_uop_2_fu_code_3;
	reg stq_uop_2_fu_code_4;
	reg stq_uop_2_fu_code_5;
	reg stq_uop_2_fu_code_6;
	reg stq_uop_2_fu_code_7;
	reg stq_uop_2_fu_code_8;
	reg stq_uop_2_fu_code_9;
	reg stq_uop_2_iw_issued;
	reg stq_uop_2_iw_issued_partial_agen;
	reg stq_uop_2_iw_issued_partial_dgen;
	reg stq_uop_2_iw_p1_speculative_child;
	reg stq_uop_2_iw_p2_speculative_child;
	reg stq_uop_2_iw_p1_bypass_hint;
	reg stq_uop_2_iw_p2_bypass_hint;
	reg stq_uop_2_iw_p3_bypass_hint;
	reg [7:0] stq_uop_2_br_mask;
	reg [2:0] stq_uop_2_br_tag;
	reg [3:0] stq_uop_2_br_type;
	reg stq_uop_2_is_sfb;
	reg stq_uop_2_is_fence;
	reg stq_uop_2_is_fencei;
	reg stq_uop_2_is_sfence;
	reg stq_uop_2_is_amo;
	reg stq_uop_2_is_eret;
	reg stq_uop_2_is_sys_pc2epc;
	reg stq_uop_2_is_rocc;
	reg stq_uop_2_is_mov;
	reg [3:0] stq_uop_2_ftq_idx;
	reg stq_uop_2_edge_inst;
	reg [5:0] stq_uop_2_pc_lob;
	reg stq_uop_2_taken;
	reg stq_uop_2_imm_rename;
	reg [2:0] stq_uop_2_imm_sel;
	reg [4:0] stq_uop_2_pimm;
	reg [19:0] stq_uop_2_imm_packed;
	reg [1:0] stq_uop_2_op1_sel;
	reg [2:0] stq_uop_2_op2_sel;
	reg stq_uop_2_fp_ctrl_ldst;
	reg stq_uop_2_fp_ctrl_wen;
	reg stq_uop_2_fp_ctrl_ren1;
	reg stq_uop_2_fp_ctrl_ren2;
	reg stq_uop_2_fp_ctrl_ren3;
	reg stq_uop_2_fp_ctrl_swap12;
	reg stq_uop_2_fp_ctrl_swap23;
	reg [1:0] stq_uop_2_fp_ctrl_typeTagIn;
	reg [1:0] stq_uop_2_fp_ctrl_typeTagOut;
	reg stq_uop_2_fp_ctrl_fromint;
	reg stq_uop_2_fp_ctrl_toint;
	reg stq_uop_2_fp_ctrl_fastpipe;
	reg stq_uop_2_fp_ctrl_fma;
	reg stq_uop_2_fp_ctrl_div;
	reg stq_uop_2_fp_ctrl_sqrt;
	reg stq_uop_2_fp_ctrl_wflags;
	reg stq_uop_2_fp_ctrl_vec;
	reg [4:0] stq_uop_2_rob_idx;
	reg [3:0] stq_uop_2_ldq_idx;
	reg [3:0] stq_uop_2_stq_idx;
	reg [1:0] stq_uop_2_rxq_idx;
	reg [5:0] stq_uop_2_pdst;
	reg [5:0] stq_uop_2_prs1;
	reg [5:0] stq_uop_2_prs2;
	reg [5:0] stq_uop_2_prs3;
	reg [3:0] stq_uop_2_ppred;
	reg stq_uop_2_prs1_busy;
	reg stq_uop_2_prs2_busy;
	reg stq_uop_2_prs3_busy;
	reg stq_uop_2_ppred_busy;
	reg [5:0] stq_uop_2_stale_pdst;
	reg stq_uop_2_exception;
	reg [63:0] stq_uop_2_exc_cause;
	reg [4:0] stq_uop_2_mem_cmd;
	reg [1:0] stq_uop_2_mem_size;
	reg stq_uop_2_mem_signed;
	reg stq_uop_2_uses_ldq;
	reg stq_uop_2_uses_stq;
	reg stq_uop_2_is_unique;
	reg stq_uop_2_flush_on_commit;
	reg [2:0] stq_uop_2_csr_cmd;
	reg stq_uop_2_ldst_is_rs1;
	reg [5:0] stq_uop_2_ldst;
	reg [5:0] stq_uop_2_lrs1;
	reg [5:0] stq_uop_2_lrs2;
	reg [5:0] stq_uop_2_lrs3;
	reg [1:0] stq_uop_2_dst_rtype;
	reg [1:0] stq_uop_2_lrs1_rtype;
	reg [1:0] stq_uop_2_lrs2_rtype;
	reg stq_uop_2_frs3_en;
	reg stq_uop_2_fcn_dw;
	reg [4:0] stq_uop_2_fcn_op;
	reg stq_uop_2_fp_val;
	reg [2:0] stq_uop_2_fp_rm;
	reg [1:0] stq_uop_2_fp_typ;
	reg stq_uop_2_xcpt_pf_if;
	reg stq_uop_2_xcpt_ae_if;
	reg stq_uop_2_xcpt_ma_if;
	reg stq_uop_2_bp_debug_if;
	reg stq_uop_2_bp_xcpt_if;
	reg [2:0] stq_uop_2_debug_fsrc;
	reg [2:0] stq_uop_2_debug_tsrc;
	reg [31:0] stq_uop_3_inst;
	reg [31:0] stq_uop_3_debug_inst;
	reg stq_uop_3_is_rvc;
	reg [39:0] stq_uop_3_debug_pc;
	reg stq_uop_3_iq_type_0;
	reg stq_uop_3_iq_type_1;
	reg stq_uop_3_iq_type_2;
	reg stq_uop_3_iq_type_3;
	reg stq_uop_3_fu_code_0;
	reg stq_uop_3_fu_code_1;
	reg stq_uop_3_fu_code_2;
	reg stq_uop_3_fu_code_3;
	reg stq_uop_3_fu_code_4;
	reg stq_uop_3_fu_code_5;
	reg stq_uop_3_fu_code_6;
	reg stq_uop_3_fu_code_7;
	reg stq_uop_3_fu_code_8;
	reg stq_uop_3_fu_code_9;
	reg stq_uop_3_iw_issued;
	reg stq_uop_3_iw_issued_partial_agen;
	reg stq_uop_3_iw_issued_partial_dgen;
	reg stq_uop_3_iw_p1_speculative_child;
	reg stq_uop_3_iw_p2_speculative_child;
	reg stq_uop_3_iw_p1_bypass_hint;
	reg stq_uop_3_iw_p2_bypass_hint;
	reg stq_uop_3_iw_p3_bypass_hint;
	reg [7:0] stq_uop_3_br_mask;
	reg [2:0] stq_uop_3_br_tag;
	reg [3:0] stq_uop_3_br_type;
	reg stq_uop_3_is_sfb;
	reg stq_uop_3_is_fence;
	reg stq_uop_3_is_fencei;
	reg stq_uop_3_is_sfence;
	reg stq_uop_3_is_amo;
	reg stq_uop_3_is_eret;
	reg stq_uop_3_is_sys_pc2epc;
	reg stq_uop_3_is_rocc;
	reg stq_uop_3_is_mov;
	reg [3:0] stq_uop_3_ftq_idx;
	reg stq_uop_3_edge_inst;
	reg [5:0] stq_uop_3_pc_lob;
	reg stq_uop_3_taken;
	reg stq_uop_3_imm_rename;
	reg [2:0] stq_uop_3_imm_sel;
	reg [4:0] stq_uop_3_pimm;
	reg [19:0] stq_uop_3_imm_packed;
	reg [1:0] stq_uop_3_op1_sel;
	reg [2:0] stq_uop_3_op2_sel;
	reg stq_uop_3_fp_ctrl_ldst;
	reg stq_uop_3_fp_ctrl_wen;
	reg stq_uop_3_fp_ctrl_ren1;
	reg stq_uop_3_fp_ctrl_ren2;
	reg stq_uop_3_fp_ctrl_ren3;
	reg stq_uop_3_fp_ctrl_swap12;
	reg stq_uop_3_fp_ctrl_swap23;
	reg [1:0] stq_uop_3_fp_ctrl_typeTagIn;
	reg [1:0] stq_uop_3_fp_ctrl_typeTagOut;
	reg stq_uop_3_fp_ctrl_fromint;
	reg stq_uop_3_fp_ctrl_toint;
	reg stq_uop_3_fp_ctrl_fastpipe;
	reg stq_uop_3_fp_ctrl_fma;
	reg stq_uop_3_fp_ctrl_div;
	reg stq_uop_3_fp_ctrl_sqrt;
	reg stq_uop_3_fp_ctrl_wflags;
	reg stq_uop_3_fp_ctrl_vec;
	reg [4:0] stq_uop_3_rob_idx;
	reg [3:0] stq_uop_3_ldq_idx;
	reg [3:0] stq_uop_3_stq_idx;
	reg [1:0] stq_uop_3_rxq_idx;
	reg [5:0] stq_uop_3_pdst;
	reg [5:0] stq_uop_3_prs1;
	reg [5:0] stq_uop_3_prs2;
	reg [5:0] stq_uop_3_prs3;
	reg [3:0] stq_uop_3_ppred;
	reg stq_uop_3_prs1_busy;
	reg stq_uop_3_prs2_busy;
	reg stq_uop_3_prs3_busy;
	reg stq_uop_3_ppred_busy;
	reg [5:0] stq_uop_3_stale_pdst;
	reg stq_uop_3_exception;
	reg [63:0] stq_uop_3_exc_cause;
	reg [4:0] stq_uop_3_mem_cmd;
	reg [1:0] stq_uop_3_mem_size;
	reg stq_uop_3_mem_signed;
	reg stq_uop_3_uses_ldq;
	reg stq_uop_3_uses_stq;
	reg stq_uop_3_is_unique;
	reg stq_uop_3_flush_on_commit;
	reg [2:0] stq_uop_3_csr_cmd;
	reg stq_uop_3_ldst_is_rs1;
	reg [5:0] stq_uop_3_ldst;
	reg [5:0] stq_uop_3_lrs1;
	reg [5:0] stq_uop_3_lrs2;
	reg [5:0] stq_uop_3_lrs3;
	reg [1:0] stq_uop_3_dst_rtype;
	reg [1:0] stq_uop_3_lrs1_rtype;
	reg [1:0] stq_uop_3_lrs2_rtype;
	reg stq_uop_3_frs3_en;
	reg stq_uop_3_fcn_dw;
	reg [4:0] stq_uop_3_fcn_op;
	reg stq_uop_3_fp_val;
	reg [2:0] stq_uop_3_fp_rm;
	reg [1:0] stq_uop_3_fp_typ;
	reg stq_uop_3_xcpt_pf_if;
	reg stq_uop_3_xcpt_ae_if;
	reg stq_uop_3_xcpt_ma_if;
	reg stq_uop_3_bp_debug_if;
	reg stq_uop_3_bp_xcpt_if;
	reg [2:0] stq_uop_3_debug_fsrc;
	reg [2:0] stq_uop_3_debug_tsrc;
	reg [31:0] stq_uop_4_inst;
	reg [31:0] stq_uop_4_debug_inst;
	reg stq_uop_4_is_rvc;
	reg [39:0] stq_uop_4_debug_pc;
	reg stq_uop_4_iq_type_0;
	reg stq_uop_4_iq_type_1;
	reg stq_uop_4_iq_type_2;
	reg stq_uop_4_iq_type_3;
	reg stq_uop_4_fu_code_0;
	reg stq_uop_4_fu_code_1;
	reg stq_uop_4_fu_code_2;
	reg stq_uop_4_fu_code_3;
	reg stq_uop_4_fu_code_4;
	reg stq_uop_4_fu_code_5;
	reg stq_uop_4_fu_code_6;
	reg stq_uop_4_fu_code_7;
	reg stq_uop_4_fu_code_8;
	reg stq_uop_4_fu_code_9;
	reg stq_uop_4_iw_issued;
	reg stq_uop_4_iw_issued_partial_agen;
	reg stq_uop_4_iw_issued_partial_dgen;
	reg stq_uop_4_iw_p1_speculative_child;
	reg stq_uop_4_iw_p2_speculative_child;
	reg stq_uop_4_iw_p1_bypass_hint;
	reg stq_uop_4_iw_p2_bypass_hint;
	reg stq_uop_4_iw_p3_bypass_hint;
	reg [7:0] stq_uop_4_br_mask;
	reg [2:0] stq_uop_4_br_tag;
	reg [3:0] stq_uop_4_br_type;
	reg stq_uop_4_is_sfb;
	reg stq_uop_4_is_fence;
	reg stq_uop_4_is_fencei;
	reg stq_uop_4_is_sfence;
	reg stq_uop_4_is_amo;
	reg stq_uop_4_is_eret;
	reg stq_uop_4_is_sys_pc2epc;
	reg stq_uop_4_is_rocc;
	reg stq_uop_4_is_mov;
	reg [3:0] stq_uop_4_ftq_idx;
	reg stq_uop_4_edge_inst;
	reg [5:0] stq_uop_4_pc_lob;
	reg stq_uop_4_taken;
	reg stq_uop_4_imm_rename;
	reg [2:0] stq_uop_4_imm_sel;
	reg [4:0] stq_uop_4_pimm;
	reg [19:0] stq_uop_4_imm_packed;
	reg [1:0] stq_uop_4_op1_sel;
	reg [2:0] stq_uop_4_op2_sel;
	reg stq_uop_4_fp_ctrl_ldst;
	reg stq_uop_4_fp_ctrl_wen;
	reg stq_uop_4_fp_ctrl_ren1;
	reg stq_uop_4_fp_ctrl_ren2;
	reg stq_uop_4_fp_ctrl_ren3;
	reg stq_uop_4_fp_ctrl_swap12;
	reg stq_uop_4_fp_ctrl_swap23;
	reg [1:0] stq_uop_4_fp_ctrl_typeTagIn;
	reg [1:0] stq_uop_4_fp_ctrl_typeTagOut;
	reg stq_uop_4_fp_ctrl_fromint;
	reg stq_uop_4_fp_ctrl_toint;
	reg stq_uop_4_fp_ctrl_fastpipe;
	reg stq_uop_4_fp_ctrl_fma;
	reg stq_uop_4_fp_ctrl_div;
	reg stq_uop_4_fp_ctrl_sqrt;
	reg stq_uop_4_fp_ctrl_wflags;
	reg stq_uop_4_fp_ctrl_vec;
	reg [4:0] stq_uop_4_rob_idx;
	reg [3:0] stq_uop_4_ldq_idx;
	reg [3:0] stq_uop_4_stq_idx;
	reg [1:0] stq_uop_4_rxq_idx;
	reg [5:0] stq_uop_4_pdst;
	reg [5:0] stq_uop_4_prs1;
	reg [5:0] stq_uop_4_prs2;
	reg [5:0] stq_uop_4_prs3;
	reg [3:0] stq_uop_4_ppred;
	reg stq_uop_4_prs1_busy;
	reg stq_uop_4_prs2_busy;
	reg stq_uop_4_prs3_busy;
	reg stq_uop_4_ppred_busy;
	reg [5:0] stq_uop_4_stale_pdst;
	reg stq_uop_4_exception;
	reg [63:0] stq_uop_4_exc_cause;
	reg [4:0] stq_uop_4_mem_cmd;
	reg [1:0] stq_uop_4_mem_size;
	reg stq_uop_4_mem_signed;
	reg stq_uop_4_uses_ldq;
	reg stq_uop_4_uses_stq;
	reg stq_uop_4_is_unique;
	reg stq_uop_4_flush_on_commit;
	reg [2:0] stq_uop_4_csr_cmd;
	reg stq_uop_4_ldst_is_rs1;
	reg [5:0] stq_uop_4_ldst;
	reg [5:0] stq_uop_4_lrs1;
	reg [5:0] stq_uop_4_lrs2;
	reg [5:0] stq_uop_4_lrs3;
	reg [1:0] stq_uop_4_dst_rtype;
	reg [1:0] stq_uop_4_lrs1_rtype;
	reg [1:0] stq_uop_4_lrs2_rtype;
	reg stq_uop_4_frs3_en;
	reg stq_uop_4_fcn_dw;
	reg [4:0] stq_uop_4_fcn_op;
	reg stq_uop_4_fp_val;
	reg [2:0] stq_uop_4_fp_rm;
	reg [1:0] stq_uop_4_fp_typ;
	reg stq_uop_4_xcpt_pf_if;
	reg stq_uop_4_xcpt_ae_if;
	reg stq_uop_4_xcpt_ma_if;
	reg stq_uop_4_bp_debug_if;
	reg stq_uop_4_bp_xcpt_if;
	reg [2:0] stq_uop_4_debug_fsrc;
	reg [2:0] stq_uop_4_debug_tsrc;
	reg [31:0] stq_uop_5_inst;
	reg [31:0] stq_uop_5_debug_inst;
	reg stq_uop_5_is_rvc;
	reg [39:0] stq_uop_5_debug_pc;
	reg stq_uop_5_iq_type_0;
	reg stq_uop_5_iq_type_1;
	reg stq_uop_5_iq_type_2;
	reg stq_uop_5_iq_type_3;
	reg stq_uop_5_fu_code_0;
	reg stq_uop_5_fu_code_1;
	reg stq_uop_5_fu_code_2;
	reg stq_uop_5_fu_code_3;
	reg stq_uop_5_fu_code_4;
	reg stq_uop_5_fu_code_5;
	reg stq_uop_5_fu_code_6;
	reg stq_uop_5_fu_code_7;
	reg stq_uop_5_fu_code_8;
	reg stq_uop_5_fu_code_9;
	reg stq_uop_5_iw_issued;
	reg stq_uop_5_iw_issued_partial_agen;
	reg stq_uop_5_iw_issued_partial_dgen;
	reg stq_uop_5_iw_p1_speculative_child;
	reg stq_uop_5_iw_p2_speculative_child;
	reg stq_uop_5_iw_p1_bypass_hint;
	reg stq_uop_5_iw_p2_bypass_hint;
	reg stq_uop_5_iw_p3_bypass_hint;
	reg [7:0] stq_uop_5_br_mask;
	reg [2:0] stq_uop_5_br_tag;
	reg [3:0] stq_uop_5_br_type;
	reg stq_uop_5_is_sfb;
	reg stq_uop_5_is_fence;
	reg stq_uop_5_is_fencei;
	reg stq_uop_5_is_sfence;
	reg stq_uop_5_is_amo;
	reg stq_uop_5_is_eret;
	reg stq_uop_5_is_sys_pc2epc;
	reg stq_uop_5_is_rocc;
	reg stq_uop_5_is_mov;
	reg [3:0] stq_uop_5_ftq_idx;
	reg stq_uop_5_edge_inst;
	reg [5:0] stq_uop_5_pc_lob;
	reg stq_uop_5_taken;
	reg stq_uop_5_imm_rename;
	reg [2:0] stq_uop_5_imm_sel;
	reg [4:0] stq_uop_5_pimm;
	reg [19:0] stq_uop_5_imm_packed;
	reg [1:0] stq_uop_5_op1_sel;
	reg [2:0] stq_uop_5_op2_sel;
	reg stq_uop_5_fp_ctrl_ldst;
	reg stq_uop_5_fp_ctrl_wen;
	reg stq_uop_5_fp_ctrl_ren1;
	reg stq_uop_5_fp_ctrl_ren2;
	reg stq_uop_5_fp_ctrl_ren3;
	reg stq_uop_5_fp_ctrl_swap12;
	reg stq_uop_5_fp_ctrl_swap23;
	reg [1:0] stq_uop_5_fp_ctrl_typeTagIn;
	reg [1:0] stq_uop_5_fp_ctrl_typeTagOut;
	reg stq_uop_5_fp_ctrl_fromint;
	reg stq_uop_5_fp_ctrl_toint;
	reg stq_uop_5_fp_ctrl_fastpipe;
	reg stq_uop_5_fp_ctrl_fma;
	reg stq_uop_5_fp_ctrl_div;
	reg stq_uop_5_fp_ctrl_sqrt;
	reg stq_uop_5_fp_ctrl_wflags;
	reg stq_uop_5_fp_ctrl_vec;
	reg [4:0] stq_uop_5_rob_idx;
	reg [3:0] stq_uop_5_ldq_idx;
	reg [3:0] stq_uop_5_stq_idx;
	reg [1:0] stq_uop_5_rxq_idx;
	reg [5:0] stq_uop_5_pdst;
	reg [5:0] stq_uop_5_prs1;
	reg [5:0] stq_uop_5_prs2;
	reg [5:0] stq_uop_5_prs3;
	reg [3:0] stq_uop_5_ppred;
	reg stq_uop_5_prs1_busy;
	reg stq_uop_5_prs2_busy;
	reg stq_uop_5_prs3_busy;
	reg stq_uop_5_ppred_busy;
	reg [5:0] stq_uop_5_stale_pdst;
	reg stq_uop_5_exception;
	reg [63:0] stq_uop_5_exc_cause;
	reg [4:0] stq_uop_5_mem_cmd;
	reg [1:0] stq_uop_5_mem_size;
	reg stq_uop_5_mem_signed;
	reg stq_uop_5_uses_ldq;
	reg stq_uop_5_uses_stq;
	reg stq_uop_5_is_unique;
	reg stq_uop_5_flush_on_commit;
	reg [2:0] stq_uop_5_csr_cmd;
	reg stq_uop_5_ldst_is_rs1;
	reg [5:0] stq_uop_5_ldst;
	reg [5:0] stq_uop_5_lrs1;
	reg [5:0] stq_uop_5_lrs2;
	reg [5:0] stq_uop_5_lrs3;
	reg [1:0] stq_uop_5_dst_rtype;
	reg [1:0] stq_uop_5_lrs1_rtype;
	reg [1:0] stq_uop_5_lrs2_rtype;
	reg stq_uop_5_frs3_en;
	reg stq_uop_5_fcn_dw;
	reg [4:0] stq_uop_5_fcn_op;
	reg stq_uop_5_fp_val;
	reg [2:0] stq_uop_5_fp_rm;
	reg [1:0] stq_uop_5_fp_typ;
	reg stq_uop_5_xcpt_pf_if;
	reg stq_uop_5_xcpt_ae_if;
	reg stq_uop_5_xcpt_ma_if;
	reg stq_uop_5_bp_debug_if;
	reg stq_uop_5_bp_xcpt_if;
	reg [2:0] stq_uop_5_debug_fsrc;
	reg [2:0] stq_uop_5_debug_tsrc;
	reg [31:0] stq_uop_6_inst;
	reg [31:0] stq_uop_6_debug_inst;
	reg stq_uop_6_is_rvc;
	reg [39:0] stq_uop_6_debug_pc;
	reg stq_uop_6_iq_type_0;
	reg stq_uop_6_iq_type_1;
	reg stq_uop_6_iq_type_2;
	reg stq_uop_6_iq_type_3;
	reg stq_uop_6_fu_code_0;
	reg stq_uop_6_fu_code_1;
	reg stq_uop_6_fu_code_2;
	reg stq_uop_6_fu_code_3;
	reg stq_uop_6_fu_code_4;
	reg stq_uop_6_fu_code_5;
	reg stq_uop_6_fu_code_6;
	reg stq_uop_6_fu_code_7;
	reg stq_uop_6_fu_code_8;
	reg stq_uop_6_fu_code_9;
	reg stq_uop_6_iw_issued;
	reg stq_uop_6_iw_issued_partial_agen;
	reg stq_uop_6_iw_issued_partial_dgen;
	reg stq_uop_6_iw_p1_speculative_child;
	reg stq_uop_6_iw_p2_speculative_child;
	reg stq_uop_6_iw_p1_bypass_hint;
	reg stq_uop_6_iw_p2_bypass_hint;
	reg stq_uop_6_iw_p3_bypass_hint;
	reg [7:0] stq_uop_6_br_mask;
	reg [2:0] stq_uop_6_br_tag;
	reg [3:0] stq_uop_6_br_type;
	reg stq_uop_6_is_sfb;
	reg stq_uop_6_is_fence;
	reg stq_uop_6_is_fencei;
	reg stq_uop_6_is_sfence;
	reg stq_uop_6_is_amo;
	reg stq_uop_6_is_eret;
	reg stq_uop_6_is_sys_pc2epc;
	reg stq_uop_6_is_rocc;
	reg stq_uop_6_is_mov;
	reg [3:0] stq_uop_6_ftq_idx;
	reg stq_uop_6_edge_inst;
	reg [5:0] stq_uop_6_pc_lob;
	reg stq_uop_6_taken;
	reg stq_uop_6_imm_rename;
	reg [2:0] stq_uop_6_imm_sel;
	reg [4:0] stq_uop_6_pimm;
	reg [19:0] stq_uop_6_imm_packed;
	reg [1:0] stq_uop_6_op1_sel;
	reg [2:0] stq_uop_6_op2_sel;
	reg stq_uop_6_fp_ctrl_ldst;
	reg stq_uop_6_fp_ctrl_wen;
	reg stq_uop_6_fp_ctrl_ren1;
	reg stq_uop_6_fp_ctrl_ren2;
	reg stq_uop_6_fp_ctrl_ren3;
	reg stq_uop_6_fp_ctrl_swap12;
	reg stq_uop_6_fp_ctrl_swap23;
	reg [1:0] stq_uop_6_fp_ctrl_typeTagIn;
	reg [1:0] stq_uop_6_fp_ctrl_typeTagOut;
	reg stq_uop_6_fp_ctrl_fromint;
	reg stq_uop_6_fp_ctrl_toint;
	reg stq_uop_6_fp_ctrl_fastpipe;
	reg stq_uop_6_fp_ctrl_fma;
	reg stq_uop_6_fp_ctrl_div;
	reg stq_uop_6_fp_ctrl_sqrt;
	reg stq_uop_6_fp_ctrl_wflags;
	reg stq_uop_6_fp_ctrl_vec;
	reg [4:0] stq_uop_6_rob_idx;
	reg [3:0] stq_uop_6_ldq_idx;
	reg [3:0] stq_uop_6_stq_idx;
	reg [1:0] stq_uop_6_rxq_idx;
	reg [5:0] stq_uop_6_pdst;
	reg [5:0] stq_uop_6_prs1;
	reg [5:0] stq_uop_6_prs2;
	reg [5:0] stq_uop_6_prs3;
	reg [3:0] stq_uop_6_ppred;
	reg stq_uop_6_prs1_busy;
	reg stq_uop_6_prs2_busy;
	reg stq_uop_6_prs3_busy;
	reg stq_uop_6_ppred_busy;
	reg [5:0] stq_uop_6_stale_pdst;
	reg stq_uop_6_exception;
	reg [63:0] stq_uop_6_exc_cause;
	reg [4:0] stq_uop_6_mem_cmd;
	reg [1:0] stq_uop_6_mem_size;
	reg stq_uop_6_mem_signed;
	reg stq_uop_6_uses_ldq;
	reg stq_uop_6_uses_stq;
	reg stq_uop_6_is_unique;
	reg stq_uop_6_flush_on_commit;
	reg [2:0] stq_uop_6_csr_cmd;
	reg stq_uop_6_ldst_is_rs1;
	reg [5:0] stq_uop_6_ldst;
	reg [5:0] stq_uop_6_lrs1;
	reg [5:0] stq_uop_6_lrs2;
	reg [5:0] stq_uop_6_lrs3;
	reg [1:0] stq_uop_6_dst_rtype;
	reg [1:0] stq_uop_6_lrs1_rtype;
	reg [1:0] stq_uop_6_lrs2_rtype;
	reg stq_uop_6_frs3_en;
	reg stq_uop_6_fcn_dw;
	reg [4:0] stq_uop_6_fcn_op;
	reg stq_uop_6_fp_val;
	reg [2:0] stq_uop_6_fp_rm;
	reg [1:0] stq_uop_6_fp_typ;
	reg stq_uop_6_xcpt_pf_if;
	reg stq_uop_6_xcpt_ae_if;
	reg stq_uop_6_xcpt_ma_if;
	reg stq_uop_6_bp_debug_if;
	reg stq_uop_6_bp_xcpt_if;
	reg [2:0] stq_uop_6_debug_fsrc;
	reg [2:0] stq_uop_6_debug_tsrc;
	reg [31:0] stq_uop_7_inst;
	reg [31:0] stq_uop_7_debug_inst;
	reg stq_uop_7_is_rvc;
	reg [39:0] stq_uop_7_debug_pc;
	reg stq_uop_7_iq_type_0;
	reg stq_uop_7_iq_type_1;
	reg stq_uop_7_iq_type_2;
	reg stq_uop_7_iq_type_3;
	reg stq_uop_7_fu_code_0;
	reg stq_uop_7_fu_code_1;
	reg stq_uop_7_fu_code_2;
	reg stq_uop_7_fu_code_3;
	reg stq_uop_7_fu_code_4;
	reg stq_uop_7_fu_code_5;
	reg stq_uop_7_fu_code_6;
	reg stq_uop_7_fu_code_7;
	reg stq_uop_7_fu_code_8;
	reg stq_uop_7_fu_code_9;
	reg stq_uop_7_iw_issued;
	reg stq_uop_7_iw_issued_partial_agen;
	reg stq_uop_7_iw_issued_partial_dgen;
	reg stq_uop_7_iw_p1_speculative_child;
	reg stq_uop_7_iw_p2_speculative_child;
	reg stq_uop_7_iw_p1_bypass_hint;
	reg stq_uop_7_iw_p2_bypass_hint;
	reg stq_uop_7_iw_p3_bypass_hint;
	reg [7:0] stq_uop_7_br_mask;
	reg [2:0] stq_uop_7_br_tag;
	reg [3:0] stq_uop_7_br_type;
	reg stq_uop_7_is_sfb;
	reg stq_uop_7_is_fence;
	reg stq_uop_7_is_fencei;
	reg stq_uop_7_is_sfence;
	reg stq_uop_7_is_amo;
	reg stq_uop_7_is_eret;
	reg stq_uop_7_is_sys_pc2epc;
	reg stq_uop_7_is_rocc;
	reg stq_uop_7_is_mov;
	reg [3:0] stq_uop_7_ftq_idx;
	reg stq_uop_7_edge_inst;
	reg [5:0] stq_uop_7_pc_lob;
	reg stq_uop_7_taken;
	reg stq_uop_7_imm_rename;
	reg [2:0] stq_uop_7_imm_sel;
	reg [4:0] stq_uop_7_pimm;
	reg [19:0] stq_uop_7_imm_packed;
	reg [1:0] stq_uop_7_op1_sel;
	reg [2:0] stq_uop_7_op2_sel;
	reg stq_uop_7_fp_ctrl_ldst;
	reg stq_uop_7_fp_ctrl_wen;
	reg stq_uop_7_fp_ctrl_ren1;
	reg stq_uop_7_fp_ctrl_ren2;
	reg stq_uop_7_fp_ctrl_ren3;
	reg stq_uop_7_fp_ctrl_swap12;
	reg stq_uop_7_fp_ctrl_swap23;
	reg [1:0] stq_uop_7_fp_ctrl_typeTagIn;
	reg [1:0] stq_uop_7_fp_ctrl_typeTagOut;
	reg stq_uop_7_fp_ctrl_fromint;
	reg stq_uop_7_fp_ctrl_toint;
	reg stq_uop_7_fp_ctrl_fastpipe;
	reg stq_uop_7_fp_ctrl_fma;
	reg stq_uop_7_fp_ctrl_div;
	reg stq_uop_7_fp_ctrl_sqrt;
	reg stq_uop_7_fp_ctrl_wflags;
	reg stq_uop_7_fp_ctrl_vec;
	reg [4:0] stq_uop_7_rob_idx;
	reg [3:0] stq_uop_7_ldq_idx;
	reg [3:0] stq_uop_7_stq_idx;
	reg [1:0] stq_uop_7_rxq_idx;
	reg [5:0] stq_uop_7_pdst;
	reg [5:0] stq_uop_7_prs1;
	reg [5:0] stq_uop_7_prs2;
	reg [5:0] stq_uop_7_prs3;
	reg [3:0] stq_uop_7_ppred;
	reg stq_uop_7_prs1_busy;
	reg stq_uop_7_prs2_busy;
	reg stq_uop_7_prs3_busy;
	reg stq_uop_7_ppred_busy;
	reg [5:0] stq_uop_7_stale_pdst;
	reg stq_uop_7_exception;
	reg [63:0] stq_uop_7_exc_cause;
	reg [4:0] stq_uop_7_mem_cmd;
	reg [1:0] stq_uop_7_mem_size;
	reg stq_uop_7_mem_signed;
	reg stq_uop_7_uses_ldq;
	reg stq_uop_7_uses_stq;
	reg stq_uop_7_is_unique;
	reg stq_uop_7_flush_on_commit;
	reg [2:0] stq_uop_7_csr_cmd;
	reg stq_uop_7_ldst_is_rs1;
	reg [5:0] stq_uop_7_ldst;
	reg [5:0] stq_uop_7_lrs1;
	reg [5:0] stq_uop_7_lrs2;
	reg [5:0] stq_uop_7_lrs3;
	reg [1:0] stq_uop_7_dst_rtype;
	reg [1:0] stq_uop_7_lrs1_rtype;
	reg [1:0] stq_uop_7_lrs2_rtype;
	reg stq_uop_7_frs3_en;
	reg stq_uop_7_fcn_dw;
	reg [4:0] stq_uop_7_fcn_op;
	reg stq_uop_7_fp_val;
	reg [2:0] stq_uop_7_fp_rm;
	reg [1:0] stq_uop_7_fp_typ;
	reg stq_uop_7_xcpt_pf_if;
	reg stq_uop_7_xcpt_ae_if;
	reg stq_uop_7_xcpt_ma_if;
	reg stq_uop_7_bp_debug_if;
	reg stq_uop_7_bp_xcpt_if;
	reg [2:0] stq_uop_7_debug_fsrc;
	reg [2:0] stq_uop_7_debug_tsrc;
	reg stq_addr_0_valid;
	reg [39:0] stq_addr_0_bits;
	reg stq_addr_1_valid;
	reg [39:0] stq_addr_1_bits;
	reg stq_addr_2_valid;
	reg [39:0] stq_addr_2_bits;
	reg stq_addr_3_valid;
	reg [39:0] stq_addr_3_bits;
	reg stq_addr_4_valid;
	reg [39:0] stq_addr_4_bits;
	reg stq_addr_5_valid;
	reg [39:0] stq_addr_5_bits;
	reg stq_addr_6_valid;
	reg [39:0] stq_addr_6_bits;
	reg stq_addr_7_valid;
	reg [39:0] stq_addr_7_bits;
	reg stq_addr_is_virtual_0;
	reg stq_addr_is_virtual_1;
	reg stq_addr_is_virtual_2;
	reg stq_addr_is_virtual_3;
	reg stq_addr_is_virtual_4;
	reg stq_addr_is_virtual_5;
	reg stq_addr_is_virtual_6;
	reg stq_addr_is_virtual_7;
	reg stq_data_0_valid;
	reg [63:0] stq_data_0_bits;
	reg stq_data_1_valid;
	reg [63:0] stq_data_1_bits;
	reg stq_data_2_valid;
	reg [63:0] stq_data_2_bits;
	reg stq_data_3_valid;
	reg [63:0] stq_data_3_bits;
	reg stq_data_4_valid;
	reg [63:0] stq_data_4_bits;
	reg stq_data_5_valid;
	reg [63:0] stq_data_5_bits;
	reg stq_data_6_valid;
	reg [63:0] stq_data_6_bits;
	reg stq_data_7_valid;
	reg [63:0] stq_data_7_bits;
	reg stq_committed_0;
	reg stq_committed_1;
	reg stq_committed_2;
	reg stq_committed_3;
	reg stq_committed_4;
	reg stq_committed_5;
	reg stq_committed_6;
	reg stq_committed_7;
	reg stq_succeeded_0;
	reg stq_succeeded_1;
	reg stq_succeeded_2;
	reg stq_succeeded_3;
	reg stq_succeeded_4;
	reg stq_succeeded_5;
	reg stq_succeeded_6;
	reg stq_succeeded_7;
	reg stq_can_execute_0;
	reg stq_can_execute_1;
	reg stq_can_execute_2;
	reg stq_can_execute_3;
	reg stq_can_execute_4;
	reg stq_can_execute_5;
	reg stq_can_execute_6;
	reg stq_can_execute_7;
	reg stq_cleared_0;
	reg stq_cleared_1;
	reg stq_cleared_2;
	reg stq_cleared_3;
	reg stq_cleared_4;
	reg stq_cleared_5;
	reg stq_cleared_6;
	reg stq_cleared_7;
	reg [63:0] stq_debug_wb_data_0;
	reg [63:0] stq_debug_wb_data_1;
	reg [63:0] stq_debug_wb_data_2;
	reg [63:0] stq_debug_wb_data_3;
	reg [63:0] stq_debug_wb_data_4;
	reg [63:0] stq_debug_wb_data_5;
	reg [63:0] stq_debug_wb_data_6;
	reg [63:0] stq_debug_wb_data_7;
	reg [3:0] stq_next_ldq_idx_0;
	reg [3:0] stq_next_ldq_idx_1;
	reg [3:0] stq_next_ldq_idx_2;
	reg [3:0] stq_next_ldq_idx_3;
	reg [3:0] stq_next_ldq_idx_4;
	reg [3:0] stq_next_ldq_idx_5;
	reg [3:0] stq_next_ldq_idx_6;
	reg [3:0] stq_next_ldq_idx_7;
	reg [3:0] ldq_head;
	reg [3:0] ldq_tail;
	reg [3:0] stq_head;
	reg [3:0] stq_tail;
	reg [3:0] stq_commit_head;
	reg [3:0] stq_execute_head;
	reg [2:0] hella_state;
	reg [39:0] hella_req_addr;
	reg [63:0] hella_data_data;
	reg [31:0] hella_paddr;
	reg hella_xcpt_ma_ld;
	reg hella_xcpt_ma_st;
	reg hella_xcpt_pf_ld;
	reg hella_xcpt_pf_st;
	reg hella_xcpt_gf_ld;
	reg hella_xcpt_gf_st;
	reg hella_xcpt_ae_ld;
	reg hella_xcpt_ae_st;
	reg dis_ldq_oh_0;
	reg dis_ldq_oh_1;
	reg dis_ldq_oh_2;
	reg dis_ldq_oh_3;
	reg dis_ldq_oh_4;
	reg dis_ldq_oh_5;
	reg dis_ldq_oh_6;
	reg dis_ldq_oh_7;
	reg dis_stq_oh_0;
	reg dis_stq_oh_1;
	reg dis_stq_oh_2;
	reg dis_stq_oh_3;
	reg dis_stq_oh_4;
	reg dis_stq_oh_5;
	reg dis_stq_oh_6;
	reg dis_stq_oh_7;
	reg dis_uops_0_valid;
	reg [31:0] dis_uops_0_bits_inst;
	reg [31:0] dis_uops_0_bits_debug_inst;
	reg dis_uops_0_bits_is_rvc;
	reg [39:0] dis_uops_0_bits_debug_pc;
	reg dis_uops_0_bits_iq_type_0;
	reg dis_uops_0_bits_iq_type_1;
	reg dis_uops_0_bits_iq_type_2;
	reg dis_uops_0_bits_iq_type_3;
	reg dis_uops_0_bits_fu_code_0;
	reg dis_uops_0_bits_fu_code_1;
	reg dis_uops_0_bits_fu_code_2;
	reg dis_uops_0_bits_fu_code_3;
	reg dis_uops_0_bits_fu_code_4;
	reg dis_uops_0_bits_fu_code_5;
	reg dis_uops_0_bits_fu_code_6;
	reg dis_uops_0_bits_fu_code_7;
	reg dis_uops_0_bits_fu_code_8;
	reg dis_uops_0_bits_fu_code_9;
	reg dis_uops_0_bits_iw_issued;
	reg dis_uops_0_bits_iw_issued_partial_agen;
	reg dis_uops_0_bits_iw_issued_partial_dgen;
	reg dis_uops_0_bits_iw_p1_speculative_child;
	reg dis_uops_0_bits_iw_p2_speculative_child;
	reg dis_uops_0_bits_iw_p1_bypass_hint;
	reg dis_uops_0_bits_iw_p2_bypass_hint;
	reg dis_uops_0_bits_iw_p3_bypass_hint;
	reg [7:0] dis_uops_0_bits_br_mask;
	reg [2:0] dis_uops_0_bits_br_tag;
	reg [3:0] dis_uops_0_bits_br_type;
	reg dis_uops_0_bits_is_sfb;
	reg dis_uops_0_bits_is_fence;
	reg dis_uops_0_bits_is_fencei;
	reg dis_uops_0_bits_is_sfence;
	reg dis_uops_0_bits_is_amo;
	reg dis_uops_0_bits_is_eret;
	reg dis_uops_0_bits_is_sys_pc2epc;
	reg dis_uops_0_bits_is_rocc;
	reg dis_uops_0_bits_is_mov;
	reg [3:0] dis_uops_0_bits_ftq_idx;
	reg dis_uops_0_bits_edge_inst;
	reg [5:0] dis_uops_0_bits_pc_lob;
	reg dis_uops_0_bits_taken;
	reg dis_uops_0_bits_imm_rename;
	reg [2:0] dis_uops_0_bits_imm_sel;
	reg [4:0] dis_uops_0_bits_pimm;
	reg [19:0] dis_uops_0_bits_imm_packed;
	reg [1:0] dis_uops_0_bits_op1_sel;
	reg [2:0] dis_uops_0_bits_op2_sel;
	reg dis_uops_0_bits_fp_ctrl_ldst;
	reg dis_uops_0_bits_fp_ctrl_wen;
	reg dis_uops_0_bits_fp_ctrl_ren1;
	reg dis_uops_0_bits_fp_ctrl_ren2;
	reg dis_uops_0_bits_fp_ctrl_ren3;
	reg dis_uops_0_bits_fp_ctrl_swap12;
	reg dis_uops_0_bits_fp_ctrl_swap23;
	reg [1:0] dis_uops_0_bits_fp_ctrl_typeTagIn;
	reg [1:0] dis_uops_0_bits_fp_ctrl_typeTagOut;
	reg dis_uops_0_bits_fp_ctrl_fromint;
	reg dis_uops_0_bits_fp_ctrl_toint;
	reg dis_uops_0_bits_fp_ctrl_fastpipe;
	reg dis_uops_0_bits_fp_ctrl_fma;
	reg dis_uops_0_bits_fp_ctrl_div;
	reg dis_uops_0_bits_fp_ctrl_sqrt;
	reg dis_uops_0_bits_fp_ctrl_wflags;
	reg dis_uops_0_bits_fp_ctrl_vec;
	reg [4:0] dis_uops_0_bits_rob_idx;
	reg [3:0] dis_uops_0_bits_ldq_idx;
	reg [3:0] dis_uops_0_bits_stq_idx;
	reg [1:0] dis_uops_0_bits_rxq_idx;
	reg [5:0] dis_uops_0_bits_pdst;
	reg [5:0] dis_uops_0_bits_prs1;
	reg [5:0] dis_uops_0_bits_prs2;
	reg [5:0] dis_uops_0_bits_prs3;
	reg [3:0] dis_uops_0_bits_ppred;
	reg dis_uops_0_bits_prs1_busy;
	reg dis_uops_0_bits_prs2_busy;
	reg dis_uops_0_bits_prs3_busy;
	reg dis_uops_0_bits_ppred_busy;
	reg [5:0] dis_uops_0_bits_stale_pdst;
	reg dis_uops_0_bits_exception;
	reg [63:0] dis_uops_0_bits_exc_cause;
	reg [4:0] dis_uops_0_bits_mem_cmd;
	reg [1:0] dis_uops_0_bits_mem_size;
	reg dis_uops_0_bits_mem_signed;
	reg dis_uops_0_bits_uses_ldq;
	reg dis_uops_0_bits_uses_stq;
	reg dis_uops_0_bits_is_unique;
	reg dis_uops_0_bits_flush_on_commit;
	reg [2:0] dis_uops_0_bits_csr_cmd;
	reg dis_uops_0_bits_ldst_is_rs1;
	reg [5:0] dis_uops_0_bits_ldst;
	reg [5:0] dis_uops_0_bits_lrs1;
	reg [5:0] dis_uops_0_bits_lrs2;
	reg [5:0] dis_uops_0_bits_lrs3;
	reg [1:0] dis_uops_0_bits_dst_rtype;
	reg [1:0] dis_uops_0_bits_lrs1_rtype;
	reg [1:0] dis_uops_0_bits_lrs2_rtype;
	reg dis_uops_0_bits_frs3_en;
	reg dis_uops_0_bits_fcn_dw;
	reg [4:0] dis_uops_0_bits_fcn_op;
	reg dis_uops_0_bits_fp_val;
	reg [2:0] dis_uops_0_bits_fp_rm;
	reg [1:0] dis_uops_0_bits_fp_typ;
	reg dis_uops_0_bits_xcpt_pf_if;
	reg dis_uops_0_bits_xcpt_ae_if;
	reg dis_uops_0_bits_xcpt_ma_if;
	reg dis_uops_0_bits_bp_debug_if;
	reg dis_uops_0_bits_bp_xcpt_if;
	reg [2:0] dis_uops_0_bits_debug_fsrc;
	reg [2:0] dis_uops_0_bits_debug_tsrc;
	wire [7:0] stq_valids = {stq_valid_7, stq_valid_6, stq_valid_5, stq_valid_4, stq_valid_3, stq_valid_2, stq_valid_1, stq_valid_0} | {dis_stq_oh_7, dis_stq_oh_6, dis_stq_oh_5, dis_stq_oh_4, dis_stq_oh_3, dis_stq_oh_2, dis_stq_oh_1, dis_stq_oh_0};
	wire dis_ld_val = (io_core_dis_uops_0_valid & io_core_dis_uops_0_bits_uses_ldq) & ~io_core_dis_uops_0_bits_exception;
	wire dis_st_val = (io_core_dis_uops_0_valid & io_core_dis_uops_0_bits_uses_stq) & ~io_core_dis_uops_0_bits_exception;
	wire [7:0] _GEN_5 = {ldq_valid_7, ldq_valid_6, ldq_valid_5, ldq_valid_4, ldq_valid_3, ldq_valid_2, ldq_valid_1, ldq_valid_0};
	wire [7:0] _GEN_6 = {stq_valid_7, stq_valid_6, stq_valid_5, stq_valid_4, stq_valid_3, stq_valid_2, stq_valid_1, stq_valid_0};
	wire _GEN_7 = dis_uops_0_valid & dis_uops_0_bits_uses_ldq;
	wire _GEN_8 = _GEN_7 & (dis_uops_0_bits_ldq_idx[2:0] == 3'h0);
	wire _GEN_9 = _GEN_7 & (dis_uops_0_bits_ldq_idx[2:0] == 3'h1);
	wire _GEN_10 = _GEN_7 & (dis_uops_0_bits_ldq_idx[2:0] == 3'h2);
	wire _GEN_11 = _GEN_7 & (dis_uops_0_bits_ldq_idx[2:0] == 3'h3);
	wire _GEN_12 = _GEN_7 & (dis_uops_0_bits_ldq_idx[2:0] == 3'h4);
	wire _GEN_13 = _GEN_7 & (dis_uops_0_bits_ldq_idx[2:0] == 3'h5);
	wire _GEN_14 = _GEN_7 & (dis_uops_0_bits_ldq_idx[2:0] == 3'h6);
	wire _GEN_15 = _GEN_7 & (&dis_uops_0_bits_ldq_idx[2:0]);
	reg p1_block_load_mask_0;
	reg p1_block_load_mask_1;
	reg p1_block_load_mask_2;
	reg p1_block_load_mask_3;
	reg p1_block_load_mask_4;
	reg p1_block_load_mask_5;
	reg p1_block_load_mask_6;
	reg p1_block_load_mask_7;
	reg p2_block_load_mask_0;
	reg p2_block_load_mask_1;
	reg p2_block_load_mask_2;
	reg p2_block_load_mask_3;
	reg p2_block_load_mask_4;
	reg p2_block_load_mask_5;
	reg p2_block_load_mask_6;
	reg p2_block_load_mask_7;
	reg stq_almost_full;
	wire [255:0] _GEN_16 = {ldq_uop_7_inst, ldq_uop_6_inst, ldq_uop_5_inst, ldq_uop_4_inst, ldq_uop_3_inst, ldq_uop_2_inst, ldq_uop_1_inst, ldq_uop_0_inst};
	wire [255:0] _GEN_17 = {ldq_uop_7_debug_inst, ldq_uop_6_debug_inst, ldq_uop_5_debug_inst, ldq_uop_4_debug_inst, ldq_uop_3_debug_inst, ldq_uop_2_debug_inst, ldq_uop_1_debug_inst, ldq_uop_0_debug_inst};
	wire [7:0] _GEN_18 = {ldq_uop_7_is_rvc, ldq_uop_6_is_rvc, ldq_uop_5_is_rvc, ldq_uop_4_is_rvc, ldq_uop_3_is_rvc, ldq_uop_2_is_rvc, ldq_uop_1_is_rvc, ldq_uop_0_is_rvc};
	wire [319:0] _GEN_19 = {ldq_uop_7_debug_pc, ldq_uop_6_debug_pc, ldq_uop_5_debug_pc, ldq_uop_4_debug_pc, ldq_uop_3_debug_pc, ldq_uop_2_debug_pc, ldq_uop_1_debug_pc, ldq_uop_0_debug_pc};
	wire [7:0] _GEN_20 = {ldq_uop_7_iq_type_0, ldq_uop_6_iq_type_0, ldq_uop_5_iq_type_0, ldq_uop_4_iq_type_0, ldq_uop_3_iq_type_0, ldq_uop_2_iq_type_0, ldq_uop_1_iq_type_0, ldq_uop_0_iq_type_0};
	wire [7:0] _GEN_21 = {ldq_uop_7_iq_type_1, ldq_uop_6_iq_type_1, ldq_uop_5_iq_type_1, ldq_uop_4_iq_type_1, ldq_uop_3_iq_type_1, ldq_uop_2_iq_type_1, ldq_uop_1_iq_type_1, ldq_uop_0_iq_type_1};
	wire [7:0] _GEN_22 = {ldq_uop_7_iq_type_2, ldq_uop_6_iq_type_2, ldq_uop_5_iq_type_2, ldq_uop_4_iq_type_2, ldq_uop_3_iq_type_2, ldq_uop_2_iq_type_2, ldq_uop_1_iq_type_2, ldq_uop_0_iq_type_2};
	wire [7:0] _GEN_23 = {ldq_uop_7_iq_type_3, ldq_uop_6_iq_type_3, ldq_uop_5_iq_type_3, ldq_uop_4_iq_type_3, ldq_uop_3_iq_type_3, ldq_uop_2_iq_type_3, ldq_uop_1_iq_type_3, ldq_uop_0_iq_type_3};
	wire [7:0] _GEN_24 = {ldq_uop_7_fu_code_0, ldq_uop_6_fu_code_0, ldq_uop_5_fu_code_0, ldq_uop_4_fu_code_0, ldq_uop_3_fu_code_0, ldq_uop_2_fu_code_0, ldq_uop_1_fu_code_0, ldq_uop_0_fu_code_0};
	wire [7:0] _GEN_25 = {ldq_uop_7_fu_code_1, ldq_uop_6_fu_code_1, ldq_uop_5_fu_code_1, ldq_uop_4_fu_code_1, ldq_uop_3_fu_code_1, ldq_uop_2_fu_code_1, ldq_uop_1_fu_code_1, ldq_uop_0_fu_code_1};
	wire [7:0] _GEN_26 = {ldq_uop_7_fu_code_2, ldq_uop_6_fu_code_2, ldq_uop_5_fu_code_2, ldq_uop_4_fu_code_2, ldq_uop_3_fu_code_2, ldq_uop_2_fu_code_2, ldq_uop_1_fu_code_2, ldq_uop_0_fu_code_2};
	wire [7:0] _GEN_27 = {ldq_uop_7_fu_code_3, ldq_uop_6_fu_code_3, ldq_uop_5_fu_code_3, ldq_uop_4_fu_code_3, ldq_uop_3_fu_code_3, ldq_uop_2_fu_code_3, ldq_uop_1_fu_code_3, ldq_uop_0_fu_code_3};
	wire [7:0] _GEN_28 = {ldq_uop_7_fu_code_4, ldq_uop_6_fu_code_4, ldq_uop_5_fu_code_4, ldq_uop_4_fu_code_4, ldq_uop_3_fu_code_4, ldq_uop_2_fu_code_4, ldq_uop_1_fu_code_4, ldq_uop_0_fu_code_4};
	wire [7:0] _GEN_29 = {ldq_uop_7_fu_code_5, ldq_uop_6_fu_code_5, ldq_uop_5_fu_code_5, ldq_uop_4_fu_code_5, ldq_uop_3_fu_code_5, ldq_uop_2_fu_code_5, ldq_uop_1_fu_code_5, ldq_uop_0_fu_code_5};
	wire [7:0] _GEN_30 = {ldq_uop_7_fu_code_6, ldq_uop_6_fu_code_6, ldq_uop_5_fu_code_6, ldq_uop_4_fu_code_6, ldq_uop_3_fu_code_6, ldq_uop_2_fu_code_6, ldq_uop_1_fu_code_6, ldq_uop_0_fu_code_6};
	wire [7:0] _GEN_31 = {ldq_uop_7_fu_code_7, ldq_uop_6_fu_code_7, ldq_uop_5_fu_code_7, ldq_uop_4_fu_code_7, ldq_uop_3_fu_code_7, ldq_uop_2_fu_code_7, ldq_uop_1_fu_code_7, ldq_uop_0_fu_code_7};
	wire [7:0] _GEN_32 = {ldq_uop_7_fu_code_8, ldq_uop_6_fu_code_8, ldq_uop_5_fu_code_8, ldq_uop_4_fu_code_8, ldq_uop_3_fu_code_8, ldq_uop_2_fu_code_8, ldq_uop_1_fu_code_8, ldq_uop_0_fu_code_8};
	wire [7:0] _GEN_33 = {ldq_uop_7_fu_code_9, ldq_uop_6_fu_code_9, ldq_uop_5_fu_code_9, ldq_uop_4_fu_code_9, ldq_uop_3_fu_code_9, ldq_uop_2_fu_code_9, ldq_uop_1_fu_code_9, ldq_uop_0_fu_code_9};
	wire [7:0] _GEN_34 = {ldq_uop_7_iw_issued, ldq_uop_6_iw_issued, ldq_uop_5_iw_issued, ldq_uop_4_iw_issued, ldq_uop_3_iw_issued, ldq_uop_2_iw_issued, ldq_uop_1_iw_issued, ldq_uop_0_iw_issued};
	wire [7:0] _GEN_35 = {ldq_uop_7_iw_issued_partial_agen, ldq_uop_6_iw_issued_partial_agen, ldq_uop_5_iw_issued_partial_agen, ldq_uop_4_iw_issued_partial_agen, ldq_uop_3_iw_issued_partial_agen, ldq_uop_2_iw_issued_partial_agen, ldq_uop_1_iw_issued_partial_agen, ldq_uop_0_iw_issued_partial_agen};
	wire [7:0] _GEN_36 = {ldq_uop_7_iw_issued_partial_dgen, ldq_uop_6_iw_issued_partial_dgen, ldq_uop_5_iw_issued_partial_dgen, ldq_uop_4_iw_issued_partial_dgen, ldq_uop_3_iw_issued_partial_dgen, ldq_uop_2_iw_issued_partial_dgen, ldq_uop_1_iw_issued_partial_dgen, ldq_uop_0_iw_issued_partial_dgen};
	wire [7:0] _GEN_37 = {ldq_uop_7_iw_p1_speculative_child, ldq_uop_6_iw_p1_speculative_child, ldq_uop_5_iw_p1_speculative_child, ldq_uop_4_iw_p1_speculative_child, ldq_uop_3_iw_p1_speculative_child, ldq_uop_2_iw_p1_speculative_child, ldq_uop_1_iw_p1_speculative_child, ldq_uop_0_iw_p1_speculative_child};
	wire [7:0] _GEN_38 = {ldq_uop_7_iw_p2_speculative_child, ldq_uop_6_iw_p2_speculative_child, ldq_uop_5_iw_p2_speculative_child, ldq_uop_4_iw_p2_speculative_child, ldq_uop_3_iw_p2_speculative_child, ldq_uop_2_iw_p2_speculative_child, ldq_uop_1_iw_p2_speculative_child, ldq_uop_0_iw_p2_speculative_child};
	wire [7:0] _GEN_39 = {ldq_uop_7_iw_p1_bypass_hint, ldq_uop_6_iw_p1_bypass_hint, ldq_uop_5_iw_p1_bypass_hint, ldq_uop_4_iw_p1_bypass_hint, ldq_uop_3_iw_p1_bypass_hint, ldq_uop_2_iw_p1_bypass_hint, ldq_uop_1_iw_p1_bypass_hint, ldq_uop_0_iw_p1_bypass_hint};
	wire [7:0] _GEN_40 = {ldq_uop_7_iw_p2_bypass_hint, ldq_uop_6_iw_p2_bypass_hint, ldq_uop_5_iw_p2_bypass_hint, ldq_uop_4_iw_p2_bypass_hint, ldq_uop_3_iw_p2_bypass_hint, ldq_uop_2_iw_p2_bypass_hint, ldq_uop_1_iw_p2_bypass_hint, ldq_uop_0_iw_p2_bypass_hint};
	wire [7:0] _GEN_41 = {ldq_uop_7_iw_p3_bypass_hint, ldq_uop_6_iw_p3_bypass_hint, ldq_uop_5_iw_p3_bypass_hint, ldq_uop_4_iw_p3_bypass_hint, ldq_uop_3_iw_p3_bypass_hint, ldq_uop_2_iw_p3_bypass_hint, ldq_uop_1_iw_p3_bypass_hint, ldq_uop_0_iw_p3_bypass_hint};
	wire [63:0] _GEN_42 = {ldq_uop_7_br_mask, ldq_uop_6_br_mask, ldq_uop_5_br_mask, ldq_uop_4_br_mask, ldq_uop_3_br_mask, ldq_uop_2_br_mask, ldq_uop_1_br_mask, ldq_uop_0_br_mask};
	wire [7:0] ldq_incoming_e_0_bits_uop_br_mask = _GEN_42[io_core_agen_0_bits_uop_ldq_idx[2:0] * 8+:8];
	wire [23:0] _GEN_43 = {ldq_uop_7_br_tag, ldq_uop_6_br_tag, ldq_uop_5_br_tag, ldq_uop_4_br_tag, ldq_uop_3_br_tag, ldq_uop_2_br_tag, ldq_uop_1_br_tag, ldq_uop_0_br_tag};
	wire [31:0] _GEN_44 = {ldq_uop_7_br_type, ldq_uop_6_br_type, ldq_uop_5_br_type, ldq_uop_4_br_type, ldq_uop_3_br_type, ldq_uop_2_br_type, ldq_uop_1_br_type, ldq_uop_0_br_type};
	wire [7:0] _GEN_45 = {ldq_uop_7_is_sfb, ldq_uop_6_is_sfb, ldq_uop_5_is_sfb, ldq_uop_4_is_sfb, ldq_uop_3_is_sfb, ldq_uop_2_is_sfb, ldq_uop_1_is_sfb, ldq_uop_0_is_sfb};
	wire [7:0] _GEN_46 = {ldq_uop_7_is_fence, ldq_uop_6_is_fence, ldq_uop_5_is_fence, ldq_uop_4_is_fence, ldq_uop_3_is_fence, ldq_uop_2_is_fence, ldq_uop_1_is_fence, ldq_uop_0_is_fence};
	wire [7:0] _GEN_47 = {ldq_uop_7_is_fencei, ldq_uop_6_is_fencei, ldq_uop_5_is_fencei, ldq_uop_4_is_fencei, ldq_uop_3_is_fencei, ldq_uop_2_is_fencei, ldq_uop_1_is_fencei, ldq_uop_0_is_fencei};
	wire [7:0] _GEN_48 = {ldq_uop_7_is_sfence, ldq_uop_6_is_sfence, ldq_uop_5_is_sfence, ldq_uop_4_is_sfence, ldq_uop_3_is_sfence, ldq_uop_2_is_sfence, ldq_uop_1_is_sfence, ldq_uop_0_is_sfence};
	wire [7:0] _GEN_49 = {ldq_uop_7_is_amo, ldq_uop_6_is_amo, ldq_uop_5_is_amo, ldq_uop_4_is_amo, ldq_uop_3_is_amo, ldq_uop_2_is_amo, ldq_uop_1_is_amo, ldq_uop_0_is_amo};
	wire [7:0] _GEN_50 = {ldq_uop_7_is_eret, ldq_uop_6_is_eret, ldq_uop_5_is_eret, ldq_uop_4_is_eret, ldq_uop_3_is_eret, ldq_uop_2_is_eret, ldq_uop_1_is_eret, ldq_uop_0_is_eret};
	wire [7:0] _GEN_51 = {ldq_uop_7_is_sys_pc2epc, ldq_uop_6_is_sys_pc2epc, ldq_uop_5_is_sys_pc2epc, ldq_uop_4_is_sys_pc2epc, ldq_uop_3_is_sys_pc2epc, ldq_uop_2_is_sys_pc2epc, ldq_uop_1_is_sys_pc2epc, ldq_uop_0_is_sys_pc2epc};
	wire [7:0] _GEN_52 = {ldq_uop_7_is_rocc, ldq_uop_6_is_rocc, ldq_uop_5_is_rocc, ldq_uop_4_is_rocc, ldq_uop_3_is_rocc, ldq_uop_2_is_rocc, ldq_uop_1_is_rocc, ldq_uop_0_is_rocc};
	wire [7:0] _GEN_53 = {ldq_uop_7_is_mov, ldq_uop_6_is_mov, ldq_uop_5_is_mov, ldq_uop_4_is_mov, ldq_uop_3_is_mov, ldq_uop_2_is_mov, ldq_uop_1_is_mov, ldq_uop_0_is_mov};
	wire [31:0] _GEN_54 = {ldq_uop_7_ftq_idx, ldq_uop_6_ftq_idx, ldq_uop_5_ftq_idx, ldq_uop_4_ftq_idx, ldq_uop_3_ftq_idx, ldq_uop_2_ftq_idx, ldq_uop_1_ftq_idx, ldq_uop_0_ftq_idx};
	wire [7:0] _GEN_55 = {ldq_uop_7_edge_inst, ldq_uop_6_edge_inst, ldq_uop_5_edge_inst, ldq_uop_4_edge_inst, ldq_uop_3_edge_inst, ldq_uop_2_edge_inst, ldq_uop_1_edge_inst, ldq_uop_0_edge_inst};
	wire [47:0] _GEN_56 = {ldq_uop_7_pc_lob, ldq_uop_6_pc_lob, ldq_uop_5_pc_lob, ldq_uop_4_pc_lob, ldq_uop_3_pc_lob, ldq_uop_2_pc_lob, ldq_uop_1_pc_lob, ldq_uop_0_pc_lob};
	wire [7:0] _GEN_57 = {ldq_uop_7_taken, ldq_uop_6_taken, ldq_uop_5_taken, ldq_uop_4_taken, ldq_uop_3_taken, ldq_uop_2_taken, ldq_uop_1_taken, ldq_uop_0_taken};
	wire [7:0] _GEN_58 = {ldq_uop_7_imm_rename, ldq_uop_6_imm_rename, ldq_uop_5_imm_rename, ldq_uop_4_imm_rename, ldq_uop_3_imm_rename, ldq_uop_2_imm_rename, ldq_uop_1_imm_rename, ldq_uop_0_imm_rename};
	wire [23:0] _GEN_59 = {ldq_uop_7_imm_sel, ldq_uop_6_imm_sel, ldq_uop_5_imm_sel, ldq_uop_4_imm_sel, ldq_uop_3_imm_sel, ldq_uop_2_imm_sel, ldq_uop_1_imm_sel, ldq_uop_0_imm_sel};
	wire [39:0] _GEN_60 = {ldq_uop_7_pimm, ldq_uop_6_pimm, ldq_uop_5_pimm, ldq_uop_4_pimm, ldq_uop_3_pimm, ldq_uop_2_pimm, ldq_uop_1_pimm, ldq_uop_0_pimm};
	wire [159:0] _GEN_61 = {ldq_uop_7_imm_packed, ldq_uop_6_imm_packed, ldq_uop_5_imm_packed, ldq_uop_4_imm_packed, ldq_uop_3_imm_packed, ldq_uop_2_imm_packed, ldq_uop_1_imm_packed, ldq_uop_0_imm_packed};
	wire [15:0] _GEN_62 = {ldq_uop_7_op1_sel, ldq_uop_6_op1_sel, ldq_uop_5_op1_sel, ldq_uop_4_op1_sel, ldq_uop_3_op1_sel, ldq_uop_2_op1_sel, ldq_uop_1_op1_sel, ldq_uop_0_op1_sel};
	wire [23:0] _GEN_63 = {ldq_uop_7_op2_sel, ldq_uop_6_op2_sel, ldq_uop_5_op2_sel, ldq_uop_4_op2_sel, ldq_uop_3_op2_sel, ldq_uop_2_op2_sel, ldq_uop_1_op2_sel, ldq_uop_0_op2_sel};
	wire [7:0] _GEN_64 = {ldq_uop_7_fp_ctrl_ldst, ldq_uop_6_fp_ctrl_ldst, ldq_uop_5_fp_ctrl_ldst, ldq_uop_4_fp_ctrl_ldst, ldq_uop_3_fp_ctrl_ldst, ldq_uop_2_fp_ctrl_ldst, ldq_uop_1_fp_ctrl_ldst, ldq_uop_0_fp_ctrl_ldst};
	wire [7:0] _GEN_65 = {ldq_uop_7_fp_ctrl_wen, ldq_uop_6_fp_ctrl_wen, ldq_uop_5_fp_ctrl_wen, ldq_uop_4_fp_ctrl_wen, ldq_uop_3_fp_ctrl_wen, ldq_uop_2_fp_ctrl_wen, ldq_uop_1_fp_ctrl_wen, ldq_uop_0_fp_ctrl_wen};
	wire [7:0] _GEN_66 = {ldq_uop_7_fp_ctrl_ren1, ldq_uop_6_fp_ctrl_ren1, ldq_uop_5_fp_ctrl_ren1, ldq_uop_4_fp_ctrl_ren1, ldq_uop_3_fp_ctrl_ren1, ldq_uop_2_fp_ctrl_ren1, ldq_uop_1_fp_ctrl_ren1, ldq_uop_0_fp_ctrl_ren1};
	wire [7:0] _GEN_67 = {ldq_uop_7_fp_ctrl_ren2, ldq_uop_6_fp_ctrl_ren2, ldq_uop_5_fp_ctrl_ren2, ldq_uop_4_fp_ctrl_ren2, ldq_uop_3_fp_ctrl_ren2, ldq_uop_2_fp_ctrl_ren2, ldq_uop_1_fp_ctrl_ren2, ldq_uop_0_fp_ctrl_ren2};
	wire [7:0] _GEN_68 = {ldq_uop_7_fp_ctrl_ren3, ldq_uop_6_fp_ctrl_ren3, ldq_uop_5_fp_ctrl_ren3, ldq_uop_4_fp_ctrl_ren3, ldq_uop_3_fp_ctrl_ren3, ldq_uop_2_fp_ctrl_ren3, ldq_uop_1_fp_ctrl_ren3, ldq_uop_0_fp_ctrl_ren3};
	wire [7:0] _GEN_69 = {ldq_uop_7_fp_ctrl_swap12, ldq_uop_6_fp_ctrl_swap12, ldq_uop_5_fp_ctrl_swap12, ldq_uop_4_fp_ctrl_swap12, ldq_uop_3_fp_ctrl_swap12, ldq_uop_2_fp_ctrl_swap12, ldq_uop_1_fp_ctrl_swap12, ldq_uop_0_fp_ctrl_swap12};
	wire [7:0] _GEN_70 = {ldq_uop_7_fp_ctrl_swap23, ldq_uop_6_fp_ctrl_swap23, ldq_uop_5_fp_ctrl_swap23, ldq_uop_4_fp_ctrl_swap23, ldq_uop_3_fp_ctrl_swap23, ldq_uop_2_fp_ctrl_swap23, ldq_uop_1_fp_ctrl_swap23, ldq_uop_0_fp_ctrl_swap23};
	wire [15:0] _GEN_71 = {ldq_uop_7_fp_ctrl_typeTagIn, ldq_uop_6_fp_ctrl_typeTagIn, ldq_uop_5_fp_ctrl_typeTagIn, ldq_uop_4_fp_ctrl_typeTagIn, ldq_uop_3_fp_ctrl_typeTagIn, ldq_uop_2_fp_ctrl_typeTagIn, ldq_uop_1_fp_ctrl_typeTagIn, ldq_uop_0_fp_ctrl_typeTagIn};
	wire [15:0] _GEN_72 = {ldq_uop_7_fp_ctrl_typeTagOut, ldq_uop_6_fp_ctrl_typeTagOut, ldq_uop_5_fp_ctrl_typeTagOut, ldq_uop_4_fp_ctrl_typeTagOut, ldq_uop_3_fp_ctrl_typeTagOut, ldq_uop_2_fp_ctrl_typeTagOut, ldq_uop_1_fp_ctrl_typeTagOut, ldq_uop_0_fp_ctrl_typeTagOut};
	wire [7:0] _GEN_73 = {ldq_uop_7_fp_ctrl_fromint, ldq_uop_6_fp_ctrl_fromint, ldq_uop_5_fp_ctrl_fromint, ldq_uop_4_fp_ctrl_fromint, ldq_uop_3_fp_ctrl_fromint, ldq_uop_2_fp_ctrl_fromint, ldq_uop_1_fp_ctrl_fromint, ldq_uop_0_fp_ctrl_fromint};
	wire [7:0] _GEN_74 = {ldq_uop_7_fp_ctrl_toint, ldq_uop_6_fp_ctrl_toint, ldq_uop_5_fp_ctrl_toint, ldq_uop_4_fp_ctrl_toint, ldq_uop_3_fp_ctrl_toint, ldq_uop_2_fp_ctrl_toint, ldq_uop_1_fp_ctrl_toint, ldq_uop_0_fp_ctrl_toint};
	wire [7:0] _GEN_75 = {ldq_uop_7_fp_ctrl_fastpipe, ldq_uop_6_fp_ctrl_fastpipe, ldq_uop_5_fp_ctrl_fastpipe, ldq_uop_4_fp_ctrl_fastpipe, ldq_uop_3_fp_ctrl_fastpipe, ldq_uop_2_fp_ctrl_fastpipe, ldq_uop_1_fp_ctrl_fastpipe, ldq_uop_0_fp_ctrl_fastpipe};
	wire [7:0] _GEN_76 = {ldq_uop_7_fp_ctrl_fma, ldq_uop_6_fp_ctrl_fma, ldq_uop_5_fp_ctrl_fma, ldq_uop_4_fp_ctrl_fma, ldq_uop_3_fp_ctrl_fma, ldq_uop_2_fp_ctrl_fma, ldq_uop_1_fp_ctrl_fma, ldq_uop_0_fp_ctrl_fma};
	wire [7:0] _GEN_77 = {ldq_uop_7_fp_ctrl_div, ldq_uop_6_fp_ctrl_div, ldq_uop_5_fp_ctrl_div, ldq_uop_4_fp_ctrl_div, ldq_uop_3_fp_ctrl_div, ldq_uop_2_fp_ctrl_div, ldq_uop_1_fp_ctrl_div, ldq_uop_0_fp_ctrl_div};
	wire [7:0] _GEN_78 = {ldq_uop_7_fp_ctrl_sqrt, ldq_uop_6_fp_ctrl_sqrt, ldq_uop_5_fp_ctrl_sqrt, ldq_uop_4_fp_ctrl_sqrt, ldq_uop_3_fp_ctrl_sqrt, ldq_uop_2_fp_ctrl_sqrt, ldq_uop_1_fp_ctrl_sqrt, ldq_uop_0_fp_ctrl_sqrt};
	wire [7:0] _GEN_79 = {ldq_uop_7_fp_ctrl_wflags, ldq_uop_6_fp_ctrl_wflags, ldq_uop_5_fp_ctrl_wflags, ldq_uop_4_fp_ctrl_wflags, ldq_uop_3_fp_ctrl_wflags, ldq_uop_2_fp_ctrl_wflags, ldq_uop_1_fp_ctrl_wflags, ldq_uop_0_fp_ctrl_wflags};
	wire [7:0] _GEN_80 = {ldq_uop_7_fp_ctrl_vec, ldq_uop_6_fp_ctrl_vec, ldq_uop_5_fp_ctrl_vec, ldq_uop_4_fp_ctrl_vec, ldq_uop_3_fp_ctrl_vec, ldq_uop_2_fp_ctrl_vec, ldq_uop_1_fp_ctrl_vec, ldq_uop_0_fp_ctrl_vec};
	wire [39:0] _GEN_81 = {ldq_uop_7_rob_idx, ldq_uop_6_rob_idx, ldq_uop_5_rob_idx, ldq_uop_4_rob_idx, ldq_uop_3_rob_idx, ldq_uop_2_rob_idx, ldq_uop_1_rob_idx, ldq_uop_0_rob_idx};
	wire [4:0] ldq_incoming_e_0_bits_uop_rob_idx = _GEN_81[io_core_agen_0_bits_uop_ldq_idx[2:0] * 5+:5];
	wire [31:0] _GEN_82 = {ldq_uop_7_ldq_idx, ldq_uop_6_ldq_idx, ldq_uop_5_ldq_idx, ldq_uop_4_ldq_idx, ldq_uop_3_ldq_idx, ldq_uop_2_ldq_idx, ldq_uop_1_ldq_idx, ldq_uop_0_ldq_idx};
	wire [31:0] _GEN_83 = {ldq_uop_7_stq_idx, ldq_uop_6_stq_idx, ldq_uop_5_stq_idx, ldq_uop_4_stq_idx, ldq_uop_3_stq_idx, ldq_uop_2_stq_idx, ldq_uop_1_stq_idx, ldq_uop_0_stq_idx};
	wire [3:0] ldq_incoming_e_0_bits_uop_stq_idx = _GEN_83[io_core_agen_0_bits_uop_ldq_idx[2:0] * 4+:4];
	wire [15:0] _GEN_84 = {ldq_uop_7_rxq_idx, ldq_uop_6_rxq_idx, ldq_uop_5_rxq_idx, ldq_uop_4_rxq_idx, ldq_uop_3_rxq_idx, ldq_uop_2_rxq_idx, ldq_uop_1_rxq_idx, ldq_uop_0_rxq_idx};
	wire [47:0] _GEN_85 = {ldq_uop_7_pdst, ldq_uop_6_pdst, ldq_uop_5_pdst, ldq_uop_4_pdst, ldq_uop_3_pdst, ldq_uop_2_pdst, ldq_uop_1_pdst, ldq_uop_0_pdst};
	wire [5:0] ldq_incoming_e_0_bits_uop_pdst = _GEN_85[io_core_agen_0_bits_uop_ldq_idx[2:0] * 6+:6];
	wire [47:0] _GEN_86 = {ldq_uop_7_prs1, ldq_uop_6_prs1, ldq_uop_5_prs1, ldq_uop_4_prs1, ldq_uop_3_prs1, ldq_uop_2_prs1, ldq_uop_1_prs1, ldq_uop_0_prs1};
	wire [47:0] _GEN_87 = {ldq_uop_7_prs2, ldq_uop_6_prs2, ldq_uop_5_prs2, ldq_uop_4_prs2, ldq_uop_3_prs2, ldq_uop_2_prs2, ldq_uop_1_prs2, ldq_uop_0_prs2};
	wire [47:0] _GEN_88 = {ldq_uop_7_prs3, ldq_uop_6_prs3, ldq_uop_5_prs3, ldq_uop_4_prs3, ldq_uop_3_prs3, ldq_uop_2_prs3, ldq_uop_1_prs3, ldq_uop_0_prs3};
	wire [31:0] _GEN_89 = {ldq_uop_7_ppred, ldq_uop_6_ppred, ldq_uop_5_ppred, ldq_uop_4_ppred, ldq_uop_3_ppred, ldq_uop_2_ppred, ldq_uop_1_ppred, ldq_uop_0_ppred};
	wire [7:0] _GEN_90 = {ldq_uop_7_prs1_busy, ldq_uop_6_prs1_busy, ldq_uop_5_prs1_busy, ldq_uop_4_prs1_busy, ldq_uop_3_prs1_busy, ldq_uop_2_prs1_busy, ldq_uop_1_prs1_busy, ldq_uop_0_prs1_busy};
	wire [7:0] _GEN_91 = {ldq_uop_7_prs2_busy, ldq_uop_6_prs2_busy, ldq_uop_5_prs2_busy, ldq_uop_4_prs2_busy, ldq_uop_3_prs2_busy, ldq_uop_2_prs2_busy, ldq_uop_1_prs2_busy, ldq_uop_0_prs2_busy};
	wire [7:0] _GEN_92 = {ldq_uop_7_prs3_busy, ldq_uop_6_prs3_busy, ldq_uop_5_prs3_busy, ldq_uop_4_prs3_busy, ldq_uop_3_prs3_busy, ldq_uop_2_prs3_busy, ldq_uop_1_prs3_busy, ldq_uop_0_prs3_busy};
	wire [7:0] _GEN_93 = {ldq_uop_7_ppred_busy, ldq_uop_6_ppred_busy, ldq_uop_5_ppred_busy, ldq_uop_4_ppred_busy, ldq_uop_3_ppred_busy, ldq_uop_2_ppred_busy, ldq_uop_1_ppred_busy, ldq_uop_0_ppred_busy};
	wire [47:0] _GEN_94 = {ldq_uop_7_stale_pdst, ldq_uop_6_stale_pdst, ldq_uop_5_stale_pdst, ldq_uop_4_stale_pdst, ldq_uop_3_stale_pdst, ldq_uop_2_stale_pdst, ldq_uop_1_stale_pdst, ldq_uop_0_stale_pdst};
	wire [7:0] _GEN_95 = {ldq_uop_7_exception, ldq_uop_6_exception, ldq_uop_5_exception, ldq_uop_4_exception, ldq_uop_3_exception, ldq_uop_2_exception, ldq_uop_1_exception, ldq_uop_0_exception};
	wire [511:0] _GEN_96 = {ldq_uop_7_exc_cause, ldq_uop_6_exc_cause, ldq_uop_5_exc_cause, ldq_uop_4_exc_cause, ldq_uop_3_exc_cause, ldq_uop_2_exc_cause, ldq_uop_1_exc_cause, ldq_uop_0_exc_cause};
	wire [39:0] _GEN_97 = {ldq_uop_7_mem_cmd, ldq_uop_6_mem_cmd, ldq_uop_5_mem_cmd, ldq_uop_4_mem_cmd, ldq_uop_3_mem_cmd, ldq_uop_2_mem_cmd, ldq_uop_1_mem_cmd, ldq_uop_0_mem_cmd};
	wire [15:0] _GEN_98 = {ldq_uop_7_mem_size, ldq_uop_6_mem_size, ldq_uop_5_mem_size, ldq_uop_4_mem_size, ldq_uop_3_mem_size, ldq_uop_2_mem_size, ldq_uop_1_mem_size, ldq_uop_0_mem_size};
	wire [1:0] ldq_incoming_e_0_bits_uop_mem_size = _GEN_98[io_core_agen_0_bits_uop_ldq_idx[2:0] * 2+:2];
	wire [7:0] _GEN_99 = {ldq_uop_7_mem_signed, ldq_uop_6_mem_signed, ldq_uop_5_mem_signed, ldq_uop_4_mem_signed, ldq_uop_3_mem_signed, ldq_uop_2_mem_signed, ldq_uop_1_mem_signed, ldq_uop_0_mem_signed};
	wire [7:0] _GEN_100 = {ldq_uop_7_uses_ldq, ldq_uop_6_uses_ldq, ldq_uop_5_uses_ldq, ldq_uop_4_uses_ldq, ldq_uop_3_uses_ldq, ldq_uop_2_uses_ldq, ldq_uop_1_uses_ldq, ldq_uop_0_uses_ldq};
	wire [7:0] _GEN_101 = {ldq_uop_7_uses_stq, ldq_uop_6_uses_stq, ldq_uop_5_uses_stq, ldq_uop_4_uses_stq, ldq_uop_3_uses_stq, ldq_uop_2_uses_stq, ldq_uop_1_uses_stq, ldq_uop_0_uses_stq};
	wire [7:0] _GEN_102 = {ldq_uop_7_is_unique, ldq_uop_6_is_unique, ldq_uop_5_is_unique, ldq_uop_4_is_unique, ldq_uop_3_is_unique, ldq_uop_2_is_unique, ldq_uop_1_is_unique, ldq_uop_0_is_unique};
	wire [7:0] _GEN_103 = {ldq_uop_7_flush_on_commit, ldq_uop_6_flush_on_commit, ldq_uop_5_flush_on_commit, ldq_uop_4_flush_on_commit, ldq_uop_3_flush_on_commit, ldq_uop_2_flush_on_commit, ldq_uop_1_flush_on_commit, ldq_uop_0_flush_on_commit};
	wire [23:0] _GEN_104 = {ldq_uop_7_csr_cmd, ldq_uop_6_csr_cmd, ldq_uop_5_csr_cmd, ldq_uop_4_csr_cmd, ldq_uop_3_csr_cmd, ldq_uop_2_csr_cmd, ldq_uop_1_csr_cmd, ldq_uop_0_csr_cmd};
	wire [7:0] _GEN_105 = {ldq_uop_7_ldst_is_rs1, ldq_uop_6_ldst_is_rs1, ldq_uop_5_ldst_is_rs1, ldq_uop_4_ldst_is_rs1, ldq_uop_3_ldst_is_rs1, ldq_uop_2_ldst_is_rs1, ldq_uop_1_ldst_is_rs1, ldq_uop_0_ldst_is_rs1};
	wire [47:0] _GEN_106 = {ldq_uop_7_ldst, ldq_uop_6_ldst, ldq_uop_5_ldst, ldq_uop_4_ldst, ldq_uop_3_ldst, ldq_uop_2_ldst, ldq_uop_1_ldst, ldq_uop_0_ldst};
	wire [47:0] _GEN_107 = {ldq_uop_7_lrs1, ldq_uop_6_lrs1, ldq_uop_5_lrs1, ldq_uop_4_lrs1, ldq_uop_3_lrs1, ldq_uop_2_lrs1, ldq_uop_1_lrs1, ldq_uop_0_lrs1};
	wire [47:0] _GEN_108 = {ldq_uop_7_lrs2, ldq_uop_6_lrs2, ldq_uop_5_lrs2, ldq_uop_4_lrs2, ldq_uop_3_lrs2, ldq_uop_2_lrs2, ldq_uop_1_lrs2, ldq_uop_0_lrs2};
	wire [47:0] _GEN_109 = {ldq_uop_7_lrs3, ldq_uop_6_lrs3, ldq_uop_5_lrs3, ldq_uop_4_lrs3, ldq_uop_3_lrs3, ldq_uop_2_lrs3, ldq_uop_1_lrs3, ldq_uop_0_lrs3};
	wire [15:0] _GEN_110 = {ldq_uop_7_dst_rtype, ldq_uop_6_dst_rtype, ldq_uop_5_dst_rtype, ldq_uop_4_dst_rtype, ldq_uop_3_dst_rtype, ldq_uop_2_dst_rtype, ldq_uop_1_dst_rtype, ldq_uop_0_dst_rtype};
	wire [15:0] _GEN_111 = {ldq_uop_7_lrs1_rtype, ldq_uop_6_lrs1_rtype, ldq_uop_5_lrs1_rtype, ldq_uop_4_lrs1_rtype, ldq_uop_3_lrs1_rtype, ldq_uop_2_lrs1_rtype, ldq_uop_1_lrs1_rtype, ldq_uop_0_lrs1_rtype};
	wire [15:0] _GEN_112 = {ldq_uop_7_lrs2_rtype, ldq_uop_6_lrs2_rtype, ldq_uop_5_lrs2_rtype, ldq_uop_4_lrs2_rtype, ldq_uop_3_lrs2_rtype, ldq_uop_2_lrs2_rtype, ldq_uop_1_lrs2_rtype, ldq_uop_0_lrs2_rtype};
	wire [7:0] _GEN_113 = {ldq_uop_7_frs3_en, ldq_uop_6_frs3_en, ldq_uop_5_frs3_en, ldq_uop_4_frs3_en, ldq_uop_3_frs3_en, ldq_uop_2_frs3_en, ldq_uop_1_frs3_en, ldq_uop_0_frs3_en};
	wire [7:0] _GEN_114 = {ldq_uop_7_fcn_dw, ldq_uop_6_fcn_dw, ldq_uop_5_fcn_dw, ldq_uop_4_fcn_dw, ldq_uop_3_fcn_dw, ldq_uop_2_fcn_dw, ldq_uop_1_fcn_dw, ldq_uop_0_fcn_dw};
	wire [39:0] _GEN_115 = {ldq_uop_7_fcn_op, ldq_uop_6_fcn_op, ldq_uop_5_fcn_op, ldq_uop_4_fcn_op, ldq_uop_3_fcn_op, ldq_uop_2_fcn_op, ldq_uop_1_fcn_op, ldq_uop_0_fcn_op};
	wire [7:0] _GEN_116 = {ldq_uop_7_fp_val, ldq_uop_6_fp_val, ldq_uop_5_fp_val, ldq_uop_4_fp_val, ldq_uop_3_fp_val, ldq_uop_2_fp_val, ldq_uop_1_fp_val, ldq_uop_0_fp_val};
	wire [23:0] _GEN_117 = {ldq_uop_7_fp_rm, ldq_uop_6_fp_rm, ldq_uop_5_fp_rm, ldq_uop_4_fp_rm, ldq_uop_3_fp_rm, ldq_uop_2_fp_rm, ldq_uop_1_fp_rm, ldq_uop_0_fp_rm};
	wire [15:0] _GEN_118 = {ldq_uop_7_fp_typ, ldq_uop_6_fp_typ, ldq_uop_5_fp_typ, ldq_uop_4_fp_typ, ldq_uop_3_fp_typ, ldq_uop_2_fp_typ, ldq_uop_1_fp_typ, ldq_uop_0_fp_typ};
	wire [7:0] _GEN_119 = {ldq_uop_7_xcpt_pf_if, ldq_uop_6_xcpt_pf_if, ldq_uop_5_xcpt_pf_if, ldq_uop_4_xcpt_pf_if, ldq_uop_3_xcpt_pf_if, ldq_uop_2_xcpt_pf_if, ldq_uop_1_xcpt_pf_if, ldq_uop_0_xcpt_pf_if};
	wire [7:0] _GEN_120 = {ldq_uop_7_xcpt_ae_if, ldq_uop_6_xcpt_ae_if, ldq_uop_5_xcpt_ae_if, ldq_uop_4_xcpt_ae_if, ldq_uop_3_xcpt_ae_if, ldq_uop_2_xcpt_ae_if, ldq_uop_1_xcpt_ae_if, ldq_uop_0_xcpt_ae_if};
	wire [7:0] _GEN_121 = {ldq_uop_7_xcpt_ma_if, ldq_uop_6_xcpt_ma_if, ldq_uop_5_xcpt_ma_if, ldq_uop_4_xcpt_ma_if, ldq_uop_3_xcpt_ma_if, ldq_uop_2_xcpt_ma_if, ldq_uop_1_xcpt_ma_if, ldq_uop_0_xcpt_ma_if};
	wire [7:0] _GEN_122 = {ldq_uop_7_bp_debug_if, ldq_uop_6_bp_debug_if, ldq_uop_5_bp_debug_if, ldq_uop_4_bp_debug_if, ldq_uop_3_bp_debug_if, ldq_uop_2_bp_debug_if, ldq_uop_1_bp_debug_if, ldq_uop_0_bp_debug_if};
	wire [7:0] _GEN_123 = {ldq_uop_7_bp_xcpt_if, ldq_uop_6_bp_xcpt_if, ldq_uop_5_bp_xcpt_if, ldq_uop_4_bp_xcpt_if, ldq_uop_3_bp_xcpt_if, ldq_uop_2_bp_xcpt_if, ldq_uop_1_bp_xcpt_if, ldq_uop_0_bp_xcpt_if};
	wire [23:0] _GEN_124 = {ldq_uop_7_debug_fsrc, ldq_uop_6_debug_fsrc, ldq_uop_5_debug_fsrc, ldq_uop_4_debug_fsrc, ldq_uop_3_debug_fsrc, ldq_uop_2_debug_fsrc, ldq_uop_1_debug_fsrc, ldq_uop_0_debug_fsrc};
	wire [23:0] _GEN_125 = {ldq_uop_7_debug_tsrc, ldq_uop_6_debug_tsrc, ldq_uop_5_debug_tsrc, ldq_uop_4_debug_tsrc, ldq_uop_3_debug_tsrc, ldq_uop_2_debug_tsrc, ldq_uop_1_debug_tsrc, ldq_uop_0_debug_tsrc};
	wire [7:0] _GEN_126 = {ldq_executed_7, ldq_executed_6, ldq_executed_5, ldq_executed_4, ldq_executed_3, ldq_executed_2, ldq_executed_1, ldq_executed_0};
	wire [31:0] _GEN_127 = {ldq_next_stq_idx_7, ldq_next_stq_idx_6, ldq_next_stq_idx_5, ldq_next_stq_idx_4, ldq_next_stq_idx_3, ldq_next_stq_idx_2, ldq_next_stq_idx_1, ldq_next_stq_idx_0};
	wire [255:0] _GEN_128 = {stq_uop_7_inst, stq_uop_6_inst, stq_uop_5_inst, stq_uop_4_inst, stq_uop_3_inst, stq_uop_2_inst, stq_uop_1_inst, stq_uop_0_inst};
	wire [255:0] _GEN_129 = {stq_uop_7_debug_inst, stq_uop_6_debug_inst, stq_uop_5_debug_inst, stq_uop_4_debug_inst, stq_uop_3_debug_inst, stq_uop_2_debug_inst, stq_uop_1_debug_inst, stq_uop_0_debug_inst};
	wire [7:0] _GEN_130 = {stq_uop_7_is_rvc, stq_uop_6_is_rvc, stq_uop_5_is_rvc, stq_uop_4_is_rvc, stq_uop_3_is_rvc, stq_uop_2_is_rvc, stq_uop_1_is_rvc, stq_uop_0_is_rvc};
	wire [319:0] _GEN_131 = {stq_uop_7_debug_pc, stq_uop_6_debug_pc, stq_uop_5_debug_pc, stq_uop_4_debug_pc, stq_uop_3_debug_pc, stq_uop_2_debug_pc, stq_uop_1_debug_pc, stq_uop_0_debug_pc};
	wire [7:0] _GEN_132 = {stq_uop_7_iq_type_0, stq_uop_6_iq_type_0, stq_uop_5_iq_type_0, stq_uop_4_iq_type_0, stq_uop_3_iq_type_0, stq_uop_2_iq_type_0, stq_uop_1_iq_type_0, stq_uop_0_iq_type_0};
	wire [7:0] _GEN_133 = {stq_uop_7_iq_type_1, stq_uop_6_iq_type_1, stq_uop_5_iq_type_1, stq_uop_4_iq_type_1, stq_uop_3_iq_type_1, stq_uop_2_iq_type_1, stq_uop_1_iq_type_1, stq_uop_0_iq_type_1};
	wire [7:0] _GEN_134 = {stq_uop_7_iq_type_2, stq_uop_6_iq_type_2, stq_uop_5_iq_type_2, stq_uop_4_iq_type_2, stq_uop_3_iq_type_2, stq_uop_2_iq_type_2, stq_uop_1_iq_type_2, stq_uop_0_iq_type_2};
	wire [7:0] _GEN_135 = {stq_uop_7_iq_type_3, stq_uop_6_iq_type_3, stq_uop_5_iq_type_3, stq_uop_4_iq_type_3, stq_uop_3_iq_type_3, stq_uop_2_iq_type_3, stq_uop_1_iq_type_3, stq_uop_0_iq_type_3};
	wire [7:0] _GEN_136 = {stq_uop_7_fu_code_0, stq_uop_6_fu_code_0, stq_uop_5_fu_code_0, stq_uop_4_fu_code_0, stq_uop_3_fu_code_0, stq_uop_2_fu_code_0, stq_uop_1_fu_code_0, stq_uop_0_fu_code_0};
	wire [7:0] _GEN_137 = {stq_uop_7_fu_code_1, stq_uop_6_fu_code_1, stq_uop_5_fu_code_1, stq_uop_4_fu_code_1, stq_uop_3_fu_code_1, stq_uop_2_fu_code_1, stq_uop_1_fu_code_1, stq_uop_0_fu_code_1};
	wire [7:0] _GEN_138 = {stq_uop_7_fu_code_2, stq_uop_6_fu_code_2, stq_uop_5_fu_code_2, stq_uop_4_fu_code_2, stq_uop_3_fu_code_2, stq_uop_2_fu_code_2, stq_uop_1_fu_code_2, stq_uop_0_fu_code_2};
	wire [7:0] _GEN_139 = {stq_uop_7_fu_code_3, stq_uop_6_fu_code_3, stq_uop_5_fu_code_3, stq_uop_4_fu_code_3, stq_uop_3_fu_code_3, stq_uop_2_fu_code_3, stq_uop_1_fu_code_3, stq_uop_0_fu_code_3};
	wire [7:0] _GEN_140 = {stq_uop_7_fu_code_4, stq_uop_6_fu_code_4, stq_uop_5_fu_code_4, stq_uop_4_fu_code_4, stq_uop_3_fu_code_4, stq_uop_2_fu_code_4, stq_uop_1_fu_code_4, stq_uop_0_fu_code_4};
	wire [7:0] _GEN_141 = {stq_uop_7_fu_code_5, stq_uop_6_fu_code_5, stq_uop_5_fu_code_5, stq_uop_4_fu_code_5, stq_uop_3_fu_code_5, stq_uop_2_fu_code_5, stq_uop_1_fu_code_5, stq_uop_0_fu_code_5};
	wire [7:0] _GEN_142 = {stq_uop_7_fu_code_6, stq_uop_6_fu_code_6, stq_uop_5_fu_code_6, stq_uop_4_fu_code_6, stq_uop_3_fu_code_6, stq_uop_2_fu_code_6, stq_uop_1_fu_code_6, stq_uop_0_fu_code_6};
	wire [7:0] _GEN_143 = {stq_uop_7_fu_code_7, stq_uop_6_fu_code_7, stq_uop_5_fu_code_7, stq_uop_4_fu_code_7, stq_uop_3_fu_code_7, stq_uop_2_fu_code_7, stq_uop_1_fu_code_7, stq_uop_0_fu_code_7};
	wire [7:0] _GEN_144 = {stq_uop_7_fu_code_8, stq_uop_6_fu_code_8, stq_uop_5_fu_code_8, stq_uop_4_fu_code_8, stq_uop_3_fu_code_8, stq_uop_2_fu_code_8, stq_uop_1_fu_code_8, stq_uop_0_fu_code_8};
	wire [7:0] _GEN_145 = {stq_uop_7_fu_code_9, stq_uop_6_fu_code_9, stq_uop_5_fu_code_9, stq_uop_4_fu_code_9, stq_uop_3_fu_code_9, stq_uop_2_fu_code_9, stq_uop_1_fu_code_9, stq_uop_0_fu_code_9};
	wire [7:0] _GEN_146 = {stq_uop_7_iw_issued, stq_uop_6_iw_issued, stq_uop_5_iw_issued, stq_uop_4_iw_issued, stq_uop_3_iw_issued, stq_uop_2_iw_issued, stq_uop_1_iw_issued, stq_uop_0_iw_issued};
	wire [7:0] _GEN_147 = {stq_uop_7_iw_issued_partial_agen, stq_uop_6_iw_issued_partial_agen, stq_uop_5_iw_issued_partial_agen, stq_uop_4_iw_issued_partial_agen, stq_uop_3_iw_issued_partial_agen, stq_uop_2_iw_issued_partial_agen, stq_uop_1_iw_issued_partial_agen, stq_uop_0_iw_issued_partial_agen};
	wire [7:0] _GEN_148 = {stq_uop_7_iw_issued_partial_dgen, stq_uop_6_iw_issued_partial_dgen, stq_uop_5_iw_issued_partial_dgen, stq_uop_4_iw_issued_partial_dgen, stq_uop_3_iw_issued_partial_dgen, stq_uop_2_iw_issued_partial_dgen, stq_uop_1_iw_issued_partial_dgen, stq_uop_0_iw_issued_partial_dgen};
	wire [7:0] _GEN_149 = {stq_uop_7_iw_p1_speculative_child, stq_uop_6_iw_p1_speculative_child, stq_uop_5_iw_p1_speculative_child, stq_uop_4_iw_p1_speculative_child, stq_uop_3_iw_p1_speculative_child, stq_uop_2_iw_p1_speculative_child, stq_uop_1_iw_p1_speculative_child, stq_uop_0_iw_p1_speculative_child};
	wire [7:0] _GEN_150 = {stq_uop_7_iw_p2_speculative_child, stq_uop_6_iw_p2_speculative_child, stq_uop_5_iw_p2_speculative_child, stq_uop_4_iw_p2_speculative_child, stq_uop_3_iw_p2_speculative_child, stq_uop_2_iw_p2_speculative_child, stq_uop_1_iw_p2_speculative_child, stq_uop_0_iw_p2_speculative_child};
	wire [7:0] _GEN_151 = {stq_uop_7_iw_p1_bypass_hint, stq_uop_6_iw_p1_bypass_hint, stq_uop_5_iw_p1_bypass_hint, stq_uop_4_iw_p1_bypass_hint, stq_uop_3_iw_p1_bypass_hint, stq_uop_2_iw_p1_bypass_hint, stq_uop_1_iw_p1_bypass_hint, stq_uop_0_iw_p1_bypass_hint};
	wire [7:0] _GEN_152 = {stq_uop_7_iw_p2_bypass_hint, stq_uop_6_iw_p2_bypass_hint, stq_uop_5_iw_p2_bypass_hint, stq_uop_4_iw_p2_bypass_hint, stq_uop_3_iw_p2_bypass_hint, stq_uop_2_iw_p2_bypass_hint, stq_uop_1_iw_p2_bypass_hint, stq_uop_0_iw_p2_bypass_hint};
	wire [7:0] _GEN_153 = {stq_uop_7_iw_p3_bypass_hint, stq_uop_6_iw_p3_bypass_hint, stq_uop_5_iw_p3_bypass_hint, stq_uop_4_iw_p3_bypass_hint, stq_uop_3_iw_p3_bypass_hint, stq_uop_2_iw_p3_bypass_hint, stq_uop_1_iw_p3_bypass_hint, stq_uop_0_iw_p3_bypass_hint};
	wire [63:0] _GEN_154 = {stq_uop_7_br_mask, stq_uop_6_br_mask, stq_uop_5_br_mask, stq_uop_4_br_mask, stq_uop_3_br_mask, stq_uop_2_br_mask, stq_uop_1_br_mask, stq_uop_0_br_mask};
	wire [7:0] stq_incoming_e_0_bits_uop_br_mask = _GEN_154[io_core_agen_0_bits_uop_stq_idx[2:0] * 8+:8];
	wire [23:0] _GEN_155 = {stq_uop_7_br_tag, stq_uop_6_br_tag, stq_uop_5_br_tag, stq_uop_4_br_tag, stq_uop_3_br_tag, stq_uop_2_br_tag, stq_uop_1_br_tag, stq_uop_0_br_tag};
	wire [31:0] _GEN_156 = {stq_uop_7_br_type, stq_uop_6_br_type, stq_uop_5_br_type, stq_uop_4_br_type, stq_uop_3_br_type, stq_uop_2_br_type, stq_uop_1_br_type, stq_uop_0_br_type};
	wire [7:0] _GEN_157 = {stq_uop_7_is_sfb, stq_uop_6_is_sfb, stq_uop_5_is_sfb, stq_uop_4_is_sfb, stq_uop_3_is_sfb, stq_uop_2_is_sfb, stq_uop_1_is_sfb, stq_uop_0_is_sfb};
	wire [7:0] _GEN_158 = {stq_uop_7_is_fence, stq_uop_6_is_fence, stq_uop_5_is_fence, stq_uop_4_is_fence, stq_uop_3_is_fence, stq_uop_2_is_fence, stq_uop_1_is_fence, stq_uop_0_is_fence};
	wire [7:0] _GEN_159 = {stq_uop_7_is_fencei, stq_uop_6_is_fencei, stq_uop_5_is_fencei, stq_uop_4_is_fencei, stq_uop_3_is_fencei, stq_uop_2_is_fencei, stq_uop_1_is_fencei, stq_uop_0_is_fencei};
	wire [7:0] _GEN_160 = {stq_uop_7_is_sfence, stq_uop_6_is_sfence, stq_uop_5_is_sfence, stq_uop_4_is_sfence, stq_uop_3_is_sfence, stq_uop_2_is_sfence, stq_uop_1_is_sfence, stq_uop_0_is_sfence};
	wire [7:0] _GEN_161 = {stq_uop_7_is_amo, stq_uop_6_is_amo, stq_uop_5_is_amo, stq_uop_4_is_amo, stq_uop_3_is_amo, stq_uop_2_is_amo, stq_uop_1_is_amo, stq_uop_0_is_amo};
	wire [7:0] _GEN_162 = {stq_uop_7_is_eret, stq_uop_6_is_eret, stq_uop_5_is_eret, stq_uop_4_is_eret, stq_uop_3_is_eret, stq_uop_2_is_eret, stq_uop_1_is_eret, stq_uop_0_is_eret};
	wire [7:0] _GEN_163 = {stq_uop_7_is_sys_pc2epc, stq_uop_6_is_sys_pc2epc, stq_uop_5_is_sys_pc2epc, stq_uop_4_is_sys_pc2epc, stq_uop_3_is_sys_pc2epc, stq_uop_2_is_sys_pc2epc, stq_uop_1_is_sys_pc2epc, stq_uop_0_is_sys_pc2epc};
	wire [7:0] _GEN_164 = {stq_uop_7_is_rocc, stq_uop_6_is_rocc, stq_uop_5_is_rocc, stq_uop_4_is_rocc, stq_uop_3_is_rocc, stq_uop_2_is_rocc, stq_uop_1_is_rocc, stq_uop_0_is_rocc};
	wire [7:0] _GEN_165 = {stq_uop_7_is_mov, stq_uop_6_is_mov, stq_uop_5_is_mov, stq_uop_4_is_mov, stq_uop_3_is_mov, stq_uop_2_is_mov, stq_uop_1_is_mov, stq_uop_0_is_mov};
	wire [31:0] _GEN_166 = {stq_uop_7_ftq_idx, stq_uop_6_ftq_idx, stq_uop_5_ftq_idx, stq_uop_4_ftq_idx, stq_uop_3_ftq_idx, stq_uop_2_ftq_idx, stq_uop_1_ftq_idx, stq_uop_0_ftq_idx};
	wire [7:0] _GEN_167 = {stq_uop_7_edge_inst, stq_uop_6_edge_inst, stq_uop_5_edge_inst, stq_uop_4_edge_inst, stq_uop_3_edge_inst, stq_uop_2_edge_inst, stq_uop_1_edge_inst, stq_uop_0_edge_inst};
	wire [47:0] _GEN_168 = {stq_uop_7_pc_lob, stq_uop_6_pc_lob, stq_uop_5_pc_lob, stq_uop_4_pc_lob, stq_uop_3_pc_lob, stq_uop_2_pc_lob, stq_uop_1_pc_lob, stq_uop_0_pc_lob};
	wire [7:0] _GEN_169 = {stq_uop_7_taken, stq_uop_6_taken, stq_uop_5_taken, stq_uop_4_taken, stq_uop_3_taken, stq_uop_2_taken, stq_uop_1_taken, stq_uop_0_taken};
	wire [7:0] _GEN_170 = {stq_uop_7_imm_rename, stq_uop_6_imm_rename, stq_uop_5_imm_rename, stq_uop_4_imm_rename, stq_uop_3_imm_rename, stq_uop_2_imm_rename, stq_uop_1_imm_rename, stq_uop_0_imm_rename};
	wire [23:0] _GEN_171 = {stq_uop_7_imm_sel, stq_uop_6_imm_sel, stq_uop_5_imm_sel, stq_uop_4_imm_sel, stq_uop_3_imm_sel, stq_uop_2_imm_sel, stq_uop_1_imm_sel, stq_uop_0_imm_sel};
	wire [39:0] _GEN_172 = {stq_uop_7_pimm, stq_uop_6_pimm, stq_uop_5_pimm, stq_uop_4_pimm, stq_uop_3_pimm, stq_uop_2_pimm, stq_uop_1_pimm, stq_uop_0_pimm};
	wire [159:0] _GEN_173 = {stq_uop_7_imm_packed, stq_uop_6_imm_packed, stq_uop_5_imm_packed, stq_uop_4_imm_packed, stq_uop_3_imm_packed, stq_uop_2_imm_packed, stq_uop_1_imm_packed, stq_uop_0_imm_packed};
	wire [15:0] _GEN_174 = {stq_uop_7_op1_sel, stq_uop_6_op1_sel, stq_uop_5_op1_sel, stq_uop_4_op1_sel, stq_uop_3_op1_sel, stq_uop_2_op1_sel, stq_uop_1_op1_sel, stq_uop_0_op1_sel};
	wire [23:0] _GEN_175 = {stq_uop_7_op2_sel, stq_uop_6_op2_sel, stq_uop_5_op2_sel, stq_uop_4_op2_sel, stq_uop_3_op2_sel, stq_uop_2_op2_sel, stq_uop_1_op2_sel, stq_uop_0_op2_sel};
	wire [7:0] _GEN_176 = {stq_uop_7_fp_ctrl_ldst, stq_uop_6_fp_ctrl_ldst, stq_uop_5_fp_ctrl_ldst, stq_uop_4_fp_ctrl_ldst, stq_uop_3_fp_ctrl_ldst, stq_uop_2_fp_ctrl_ldst, stq_uop_1_fp_ctrl_ldst, stq_uop_0_fp_ctrl_ldst};
	wire [7:0] _GEN_177 = {stq_uop_7_fp_ctrl_wen, stq_uop_6_fp_ctrl_wen, stq_uop_5_fp_ctrl_wen, stq_uop_4_fp_ctrl_wen, stq_uop_3_fp_ctrl_wen, stq_uop_2_fp_ctrl_wen, stq_uop_1_fp_ctrl_wen, stq_uop_0_fp_ctrl_wen};
	wire [7:0] _GEN_178 = {stq_uop_7_fp_ctrl_ren1, stq_uop_6_fp_ctrl_ren1, stq_uop_5_fp_ctrl_ren1, stq_uop_4_fp_ctrl_ren1, stq_uop_3_fp_ctrl_ren1, stq_uop_2_fp_ctrl_ren1, stq_uop_1_fp_ctrl_ren1, stq_uop_0_fp_ctrl_ren1};
	wire [7:0] _GEN_179 = {stq_uop_7_fp_ctrl_ren2, stq_uop_6_fp_ctrl_ren2, stq_uop_5_fp_ctrl_ren2, stq_uop_4_fp_ctrl_ren2, stq_uop_3_fp_ctrl_ren2, stq_uop_2_fp_ctrl_ren2, stq_uop_1_fp_ctrl_ren2, stq_uop_0_fp_ctrl_ren2};
	wire [7:0] _GEN_180 = {stq_uop_7_fp_ctrl_ren3, stq_uop_6_fp_ctrl_ren3, stq_uop_5_fp_ctrl_ren3, stq_uop_4_fp_ctrl_ren3, stq_uop_3_fp_ctrl_ren3, stq_uop_2_fp_ctrl_ren3, stq_uop_1_fp_ctrl_ren3, stq_uop_0_fp_ctrl_ren3};
	wire [7:0] _GEN_181 = {stq_uop_7_fp_ctrl_swap12, stq_uop_6_fp_ctrl_swap12, stq_uop_5_fp_ctrl_swap12, stq_uop_4_fp_ctrl_swap12, stq_uop_3_fp_ctrl_swap12, stq_uop_2_fp_ctrl_swap12, stq_uop_1_fp_ctrl_swap12, stq_uop_0_fp_ctrl_swap12};
	wire [7:0] _GEN_182 = {stq_uop_7_fp_ctrl_swap23, stq_uop_6_fp_ctrl_swap23, stq_uop_5_fp_ctrl_swap23, stq_uop_4_fp_ctrl_swap23, stq_uop_3_fp_ctrl_swap23, stq_uop_2_fp_ctrl_swap23, stq_uop_1_fp_ctrl_swap23, stq_uop_0_fp_ctrl_swap23};
	wire [15:0] _GEN_183 = {stq_uop_7_fp_ctrl_typeTagIn, stq_uop_6_fp_ctrl_typeTagIn, stq_uop_5_fp_ctrl_typeTagIn, stq_uop_4_fp_ctrl_typeTagIn, stq_uop_3_fp_ctrl_typeTagIn, stq_uop_2_fp_ctrl_typeTagIn, stq_uop_1_fp_ctrl_typeTagIn, stq_uop_0_fp_ctrl_typeTagIn};
	wire [15:0] _GEN_184 = {stq_uop_7_fp_ctrl_typeTagOut, stq_uop_6_fp_ctrl_typeTagOut, stq_uop_5_fp_ctrl_typeTagOut, stq_uop_4_fp_ctrl_typeTagOut, stq_uop_3_fp_ctrl_typeTagOut, stq_uop_2_fp_ctrl_typeTagOut, stq_uop_1_fp_ctrl_typeTagOut, stq_uop_0_fp_ctrl_typeTagOut};
	wire [7:0] _GEN_185 = {stq_uop_7_fp_ctrl_fromint, stq_uop_6_fp_ctrl_fromint, stq_uop_5_fp_ctrl_fromint, stq_uop_4_fp_ctrl_fromint, stq_uop_3_fp_ctrl_fromint, stq_uop_2_fp_ctrl_fromint, stq_uop_1_fp_ctrl_fromint, stq_uop_0_fp_ctrl_fromint};
	wire [7:0] _GEN_186 = {stq_uop_7_fp_ctrl_toint, stq_uop_6_fp_ctrl_toint, stq_uop_5_fp_ctrl_toint, stq_uop_4_fp_ctrl_toint, stq_uop_3_fp_ctrl_toint, stq_uop_2_fp_ctrl_toint, stq_uop_1_fp_ctrl_toint, stq_uop_0_fp_ctrl_toint};
	wire [7:0] _GEN_187 = {stq_uop_7_fp_ctrl_fastpipe, stq_uop_6_fp_ctrl_fastpipe, stq_uop_5_fp_ctrl_fastpipe, stq_uop_4_fp_ctrl_fastpipe, stq_uop_3_fp_ctrl_fastpipe, stq_uop_2_fp_ctrl_fastpipe, stq_uop_1_fp_ctrl_fastpipe, stq_uop_0_fp_ctrl_fastpipe};
	wire [7:0] _GEN_188 = {stq_uop_7_fp_ctrl_fma, stq_uop_6_fp_ctrl_fma, stq_uop_5_fp_ctrl_fma, stq_uop_4_fp_ctrl_fma, stq_uop_3_fp_ctrl_fma, stq_uop_2_fp_ctrl_fma, stq_uop_1_fp_ctrl_fma, stq_uop_0_fp_ctrl_fma};
	wire [7:0] _GEN_189 = {stq_uop_7_fp_ctrl_div, stq_uop_6_fp_ctrl_div, stq_uop_5_fp_ctrl_div, stq_uop_4_fp_ctrl_div, stq_uop_3_fp_ctrl_div, stq_uop_2_fp_ctrl_div, stq_uop_1_fp_ctrl_div, stq_uop_0_fp_ctrl_div};
	wire [7:0] _GEN_190 = {stq_uop_7_fp_ctrl_sqrt, stq_uop_6_fp_ctrl_sqrt, stq_uop_5_fp_ctrl_sqrt, stq_uop_4_fp_ctrl_sqrt, stq_uop_3_fp_ctrl_sqrt, stq_uop_2_fp_ctrl_sqrt, stq_uop_1_fp_ctrl_sqrt, stq_uop_0_fp_ctrl_sqrt};
	wire [7:0] _GEN_191 = {stq_uop_7_fp_ctrl_wflags, stq_uop_6_fp_ctrl_wflags, stq_uop_5_fp_ctrl_wflags, stq_uop_4_fp_ctrl_wflags, stq_uop_3_fp_ctrl_wflags, stq_uop_2_fp_ctrl_wflags, stq_uop_1_fp_ctrl_wflags, stq_uop_0_fp_ctrl_wflags};
	wire [7:0] _GEN_192 = {stq_uop_7_fp_ctrl_vec, stq_uop_6_fp_ctrl_vec, stq_uop_5_fp_ctrl_vec, stq_uop_4_fp_ctrl_vec, stq_uop_3_fp_ctrl_vec, stq_uop_2_fp_ctrl_vec, stq_uop_1_fp_ctrl_vec, stq_uop_0_fp_ctrl_vec};
	wire [39:0] _GEN_193 = {stq_uop_7_rob_idx, stq_uop_6_rob_idx, stq_uop_5_rob_idx, stq_uop_4_rob_idx, stq_uop_3_rob_idx, stq_uop_2_rob_idx, stq_uop_1_rob_idx, stq_uop_0_rob_idx};
	wire [4:0] stq_incoming_e_0_bits_uop_rob_idx = _GEN_193[io_core_agen_0_bits_uop_stq_idx[2:0] * 5+:5];
	wire [31:0] _GEN_194 = {stq_uop_7_ldq_idx, stq_uop_6_ldq_idx, stq_uop_5_ldq_idx, stq_uop_4_ldq_idx, stq_uop_3_ldq_idx, stq_uop_2_ldq_idx, stq_uop_1_ldq_idx, stq_uop_0_ldq_idx};
	wire [31:0] _GEN_195 = {stq_uop_7_stq_idx, stq_uop_6_stq_idx, stq_uop_5_stq_idx, stq_uop_4_stq_idx, stq_uop_3_stq_idx, stq_uop_2_stq_idx, stq_uop_1_stq_idx, stq_uop_0_stq_idx};
	wire [3:0] stq_incoming_e_0_bits_uop_stq_idx = _GEN_195[io_core_agen_0_bits_uop_stq_idx[2:0] * 4+:4];
	wire [15:0] _GEN_196 = {stq_uop_7_rxq_idx, stq_uop_6_rxq_idx, stq_uop_5_rxq_idx, stq_uop_4_rxq_idx, stq_uop_3_rxq_idx, stq_uop_2_rxq_idx, stq_uop_1_rxq_idx, stq_uop_0_rxq_idx};
	wire [47:0] _GEN_197 = {stq_uop_7_pdst, stq_uop_6_pdst, stq_uop_5_pdst, stq_uop_4_pdst, stq_uop_3_pdst, stq_uop_2_pdst, stq_uop_1_pdst, stq_uop_0_pdst};
	wire [5:0] stq_incoming_e_0_bits_uop_pdst = _GEN_197[io_core_agen_0_bits_uop_stq_idx[2:0] * 6+:6];
	wire [47:0] _GEN_198 = {stq_uop_7_prs1, stq_uop_6_prs1, stq_uop_5_prs1, stq_uop_4_prs1, stq_uop_3_prs1, stq_uop_2_prs1, stq_uop_1_prs1, stq_uop_0_prs1};
	wire [47:0] _GEN_199 = {stq_uop_7_prs2, stq_uop_6_prs2, stq_uop_5_prs2, stq_uop_4_prs2, stq_uop_3_prs2, stq_uop_2_prs2, stq_uop_1_prs2, stq_uop_0_prs2};
	wire [47:0] _GEN_200 = {stq_uop_7_prs3, stq_uop_6_prs3, stq_uop_5_prs3, stq_uop_4_prs3, stq_uop_3_prs3, stq_uop_2_prs3, stq_uop_1_prs3, stq_uop_0_prs3};
	wire [31:0] _GEN_201 = {stq_uop_7_ppred, stq_uop_6_ppred, stq_uop_5_ppred, stq_uop_4_ppred, stq_uop_3_ppred, stq_uop_2_ppred, stq_uop_1_ppred, stq_uop_0_ppred};
	wire [7:0] _GEN_202 = {stq_uop_7_prs1_busy, stq_uop_6_prs1_busy, stq_uop_5_prs1_busy, stq_uop_4_prs1_busy, stq_uop_3_prs1_busy, stq_uop_2_prs1_busy, stq_uop_1_prs1_busy, stq_uop_0_prs1_busy};
	wire [7:0] _GEN_203 = {stq_uop_7_prs2_busy, stq_uop_6_prs2_busy, stq_uop_5_prs2_busy, stq_uop_4_prs2_busy, stq_uop_3_prs2_busy, stq_uop_2_prs2_busy, stq_uop_1_prs2_busy, stq_uop_0_prs2_busy};
	wire [7:0] _GEN_204 = {stq_uop_7_prs3_busy, stq_uop_6_prs3_busy, stq_uop_5_prs3_busy, stq_uop_4_prs3_busy, stq_uop_3_prs3_busy, stq_uop_2_prs3_busy, stq_uop_1_prs3_busy, stq_uop_0_prs3_busy};
	wire [7:0] _GEN_205 = {stq_uop_7_ppred_busy, stq_uop_6_ppred_busy, stq_uop_5_ppred_busy, stq_uop_4_ppred_busy, stq_uop_3_ppred_busy, stq_uop_2_ppred_busy, stq_uop_1_ppred_busy, stq_uop_0_ppred_busy};
	wire [47:0] _GEN_206 = {stq_uop_7_stale_pdst, stq_uop_6_stale_pdst, stq_uop_5_stale_pdst, stq_uop_4_stale_pdst, stq_uop_3_stale_pdst, stq_uop_2_stale_pdst, stq_uop_1_stale_pdst, stq_uop_0_stale_pdst};
	wire [7:0] _GEN_207 = {stq_uop_7_exception, stq_uop_6_exception, stq_uop_5_exception, stq_uop_4_exception, stq_uop_3_exception, stq_uop_2_exception, stq_uop_1_exception, stq_uop_0_exception};
	wire [511:0] _GEN_208 = {stq_uop_7_exc_cause, stq_uop_6_exc_cause, stq_uop_5_exc_cause, stq_uop_4_exc_cause, stq_uop_3_exc_cause, stq_uop_2_exc_cause, stq_uop_1_exc_cause, stq_uop_0_exc_cause};
	wire [39:0] _GEN_209 = {stq_uop_7_mem_cmd, stq_uop_6_mem_cmd, stq_uop_5_mem_cmd, stq_uop_4_mem_cmd, stq_uop_3_mem_cmd, stq_uop_2_mem_cmd, stq_uop_1_mem_cmd, stq_uop_0_mem_cmd};
	wire [15:0] _GEN_210 = {stq_uop_7_mem_size, stq_uop_6_mem_size, stq_uop_5_mem_size, stq_uop_4_mem_size, stq_uop_3_mem_size, stq_uop_2_mem_size, stq_uop_1_mem_size, stq_uop_0_mem_size};
	wire [1:0] stq_incoming_e_0_bits_uop_mem_size = _GEN_210[io_core_agen_0_bits_uop_stq_idx[2:0] * 2+:2];
	wire [7:0] _GEN_211 = {stq_uop_7_mem_signed, stq_uop_6_mem_signed, stq_uop_5_mem_signed, stq_uop_4_mem_signed, stq_uop_3_mem_signed, stq_uop_2_mem_signed, stq_uop_1_mem_signed, stq_uop_0_mem_signed};
	wire [7:0] _GEN_212 = {stq_uop_7_uses_ldq, stq_uop_6_uses_ldq, stq_uop_5_uses_ldq, stq_uop_4_uses_ldq, stq_uop_3_uses_ldq, stq_uop_2_uses_ldq, stq_uop_1_uses_ldq, stq_uop_0_uses_ldq};
	wire [7:0] _GEN_213 = {stq_uop_7_uses_stq, stq_uop_6_uses_stq, stq_uop_5_uses_stq, stq_uop_4_uses_stq, stq_uop_3_uses_stq, stq_uop_2_uses_stq, stq_uop_1_uses_stq, stq_uop_0_uses_stq};
	wire [7:0] _GEN_214 = {stq_uop_7_is_unique, stq_uop_6_is_unique, stq_uop_5_is_unique, stq_uop_4_is_unique, stq_uop_3_is_unique, stq_uop_2_is_unique, stq_uop_1_is_unique, stq_uop_0_is_unique};
	wire [7:0] _GEN_215 = {stq_uop_7_flush_on_commit, stq_uop_6_flush_on_commit, stq_uop_5_flush_on_commit, stq_uop_4_flush_on_commit, stq_uop_3_flush_on_commit, stq_uop_2_flush_on_commit, stq_uop_1_flush_on_commit, stq_uop_0_flush_on_commit};
	wire [23:0] _GEN_216 = {stq_uop_7_csr_cmd, stq_uop_6_csr_cmd, stq_uop_5_csr_cmd, stq_uop_4_csr_cmd, stq_uop_3_csr_cmd, stq_uop_2_csr_cmd, stq_uop_1_csr_cmd, stq_uop_0_csr_cmd};
	wire [7:0] _GEN_217 = {stq_uop_7_ldst_is_rs1, stq_uop_6_ldst_is_rs1, stq_uop_5_ldst_is_rs1, stq_uop_4_ldst_is_rs1, stq_uop_3_ldst_is_rs1, stq_uop_2_ldst_is_rs1, stq_uop_1_ldst_is_rs1, stq_uop_0_ldst_is_rs1};
	wire [47:0] _GEN_218 = {stq_uop_7_ldst, stq_uop_6_ldst, stq_uop_5_ldst, stq_uop_4_ldst, stq_uop_3_ldst, stq_uop_2_ldst, stq_uop_1_ldst, stq_uop_0_ldst};
	wire [47:0] _GEN_219 = {stq_uop_7_lrs1, stq_uop_6_lrs1, stq_uop_5_lrs1, stq_uop_4_lrs1, stq_uop_3_lrs1, stq_uop_2_lrs1, stq_uop_1_lrs1, stq_uop_0_lrs1};
	wire [47:0] _GEN_220 = {stq_uop_7_lrs2, stq_uop_6_lrs2, stq_uop_5_lrs2, stq_uop_4_lrs2, stq_uop_3_lrs2, stq_uop_2_lrs2, stq_uop_1_lrs2, stq_uop_0_lrs2};
	wire [47:0] _GEN_221 = {stq_uop_7_lrs3, stq_uop_6_lrs3, stq_uop_5_lrs3, stq_uop_4_lrs3, stq_uop_3_lrs3, stq_uop_2_lrs3, stq_uop_1_lrs3, stq_uop_0_lrs3};
	wire [15:0] _GEN_222 = {stq_uop_7_dst_rtype, stq_uop_6_dst_rtype, stq_uop_5_dst_rtype, stq_uop_4_dst_rtype, stq_uop_3_dst_rtype, stq_uop_2_dst_rtype, stq_uop_1_dst_rtype, stq_uop_0_dst_rtype};
	wire [15:0] _GEN_223 = {stq_uop_7_lrs1_rtype, stq_uop_6_lrs1_rtype, stq_uop_5_lrs1_rtype, stq_uop_4_lrs1_rtype, stq_uop_3_lrs1_rtype, stq_uop_2_lrs1_rtype, stq_uop_1_lrs1_rtype, stq_uop_0_lrs1_rtype};
	wire [15:0] _GEN_224 = {stq_uop_7_lrs2_rtype, stq_uop_6_lrs2_rtype, stq_uop_5_lrs2_rtype, stq_uop_4_lrs2_rtype, stq_uop_3_lrs2_rtype, stq_uop_2_lrs2_rtype, stq_uop_1_lrs2_rtype, stq_uop_0_lrs2_rtype};
	wire [7:0] _GEN_225 = {stq_uop_7_frs3_en, stq_uop_6_frs3_en, stq_uop_5_frs3_en, stq_uop_4_frs3_en, stq_uop_3_frs3_en, stq_uop_2_frs3_en, stq_uop_1_frs3_en, stq_uop_0_frs3_en};
	wire [7:0] _GEN_226 = {stq_uop_7_fcn_dw, stq_uop_6_fcn_dw, stq_uop_5_fcn_dw, stq_uop_4_fcn_dw, stq_uop_3_fcn_dw, stq_uop_2_fcn_dw, stq_uop_1_fcn_dw, stq_uop_0_fcn_dw};
	wire [39:0] _GEN_227 = {stq_uop_7_fcn_op, stq_uop_6_fcn_op, stq_uop_5_fcn_op, stq_uop_4_fcn_op, stq_uop_3_fcn_op, stq_uop_2_fcn_op, stq_uop_1_fcn_op, stq_uop_0_fcn_op};
	wire [7:0] _GEN_228 = {stq_uop_7_fp_val, stq_uop_6_fp_val, stq_uop_5_fp_val, stq_uop_4_fp_val, stq_uop_3_fp_val, stq_uop_2_fp_val, stq_uop_1_fp_val, stq_uop_0_fp_val};
	wire [23:0] _GEN_229 = {stq_uop_7_fp_rm, stq_uop_6_fp_rm, stq_uop_5_fp_rm, stq_uop_4_fp_rm, stq_uop_3_fp_rm, stq_uop_2_fp_rm, stq_uop_1_fp_rm, stq_uop_0_fp_rm};
	wire [15:0] _GEN_230 = {stq_uop_7_fp_typ, stq_uop_6_fp_typ, stq_uop_5_fp_typ, stq_uop_4_fp_typ, stq_uop_3_fp_typ, stq_uop_2_fp_typ, stq_uop_1_fp_typ, stq_uop_0_fp_typ};
	wire [7:0] _GEN_231 = {stq_uop_7_xcpt_pf_if, stq_uop_6_xcpt_pf_if, stq_uop_5_xcpt_pf_if, stq_uop_4_xcpt_pf_if, stq_uop_3_xcpt_pf_if, stq_uop_2_xcpt_pf_if, stq_uop_1_xcpt_pf_if, stq_uop_0_xcpt_pf_if};
	wire [7:0] _GEN_232 = {stq_uop_7_xcpt_ae_if, stq_uop_6_xcpt_ae_if, stq_uop_5_xcpt_ae_if, stq_uop_4_xcpt_ae_if, stq_uop_3_xcpt_ae_if, stq_uop_2_xcpt_ae_if, stq_uop_1_xcpt_ae_if, stq_uop_0_xcpt_ae_if};
	wire [7:0] _GEN_233 = {stq_uop_7_xcpt_ma_if, stq_uop_6_xcpt_ma_if, stq_uop_5_xcpt_ma_if, stq_uop_4_xcpt_ma_if, stq_uop_3_xcpt_ma_if, stq_uop_2_xcpt_ma_if, stq_uop_1_xcpt_ma_if, stq_uop_0_xcpt_ma_if};
	wire [7:0] _GEN_234 = {stq_uop_7_bp_debug_if, stq_uop_6_bp_debug_if, stq_uop_5_bp_debug_if, stq_uop_4_bp_debug_if, stq_uop_3_bp_debug_if, stq_uop_2_bp_debug_if, stq_uop_1_bp_debug_if, stq_uop_0_bp_debug_if};
	wire [7:0] _GEN_235 = {stq_uop_7_bp_xcpt_if, stq_uop_6_bp_xcpt_if, stq_uop_5_bp_xcpt_if, stq_uop_4_bp_xcpt_if, stq_uop_3_bp_xcpt_if, stq_uop_2_bp_xcpt_if, stq_uop_1_bp_xcpt_if, stq_uop_0_bp_xcpt_if};
	wire [23:0] _GEN_236 = {stq_uop_7_debug_fsrc, stq_uop_6_debug_fsrc, stq_uop_5_debug_fsrc, stq_uop_4_debug_fsrc, stq_uop_3_debug_fsrc, stq_uop_2_debug_fsrc, stq_uop_1_debug_fsrc, stq_uop_0_debug_fsrc};
	wire [23:0] _GEN_237 = {stq_uop_7_debug_tsrc, stq_uop_6_debug_tsrc, stq_uop_5_debug_tsrc, stq_uop_4_debug_tsrc, stq_uop_3_debug_tsrc, stq_uop_2_debug_tsrc, stq_uop_1_debug_tsrc, stq_uop_0_debug_tsrc};
	reg [3:0] ldq_wakeup_idx;
	wire [7:0] ldq_wakeup_e_bits_uop_br_mask = _GEN_42[ldq_wakeup_idx[2:0] * 8+:8];
	wire [4:0] ldq_wakeup_e_bits_uop_rob_idx = _GEN_81[ldq_wakeup_idx[2:0] * 5+:5];
	wire [3:0] ldq_wakeup_e_bits_uop_stq_idx = _GEN_83[ldq_wakeup_idx[2:0] * 4+:4];
	wire [1:0] ldq_wakeup_e_bits_uop_mem_size = _GEN_98[ldq_wakeup_idx[2:0] * 2+:2];
	wire [7:0] _GEN_238 = {ldq_addr_7_valid, ldq_addr_6_valid, ldq_addr_5_valid, ldq_addr_4_valid, ldq_addr_3_valid, ldq_addr_2_valid, ldq_addr_1_valid, ldq_addr_0_valid};
	wire [319:0] _GEN_239 = {ldq_addr_7_bits, ldq_addr_6_bits, ldq_addr_5_bits, ldq_addr_4_bits, ldq_addr_3_bits, ldq_addr_2_bits, ldq_addr_1_bits, ldq_addr_0_bits};
	wire [7:0] _GEN_240 = {ldq_addr_is_virtual_7, ldq_addr_is_virtual_6, ldq_addr_is_virtual_5, ldq_addr_is_virtual_4, ldq_addr_is_virtual_3, ldq_addr_is_virtual_2, ldq_addr_is_virtual_1, ldq_addr_is_virtual_0};
	wire ldq_wakeup_e_bits_addr_is_virtual = _GEN_240[ldq_wakeup_idx[2:0]];
	wire [7:0] _GEN_241 = {ldq_addr_is_uncacheable_7, ldq_addr_is_uncacheable_6, ldq_addr_is_uncacheable_5, ldq_addr_is_uncacheable_4, ldq_addr_is_uncacheable_3, ldq_addr_is_uncacheable_2, ldq_addr_is_uncacheable_1, ldq_addr_is_uncacheable_0};
	wire ldq_wakeup_e_bits_addr_is_uncacheable = _GEN_241[ldq_wakeup_idx[2:0]];
	wire ldq_wakeup_e_bits_executed = _GEN_126[ldq_wakeup_idx[2:0]];
	wire [7:0] _GEN_242 = {ldq_succeeded_7, ldq_succeeded_6, ldq_succeeded_5, ldq_succeeded_4, ldq_succeeded_3, ldq_succeeded_2, ldq_succeeded_1, ldq_succeeded_0};
	wire [7:0] _GEN_243 = {ldq_order_fail_7, ldq_order_fail_6, ldq_order_fail_5, ldq_order_fail_4, ldq_order_fail_3, ldq_order_fail_2, ldq_order_fail_1, ldq_order_fail_0};
	wire [3:0] ldq_wakeup_e_bits_next_stq_idx = _GEN_127[ldq_wakeup_idx[2:0] * 4+:4];
	reg [3:0] ldq_enq_retry_idx;
	reg [3:0] stq_enq_retry_idx;
	wire [7:0] _GEN_244 = {stq_addr_7_valid, stq_addr_6_valid, stq_addr_5_valid, stq_addr_4_valid, stq_addr_3_valid, stq_addr_2_valid, stq_addr_1_valid, stq_addr_0_valid};
	wire [319:0] _GEN_245 = {stq_addr_7_bits, stq_addr_6_bits, stq_addr_5_bits, stq_addr_4_bits, stq_addr_3_bits, stq_addr_2_bits, stq_addr_1_bits, stq_addr_0_bits};
	wire [7:0] _GEN_246 = {stq_addr_is_virtual_7, stq_addr_is_virtual_6, stq_addr_is_virtual_5, stq_addr_is_virtual_4, stq_addr_is_virtual_3, stq_addr_is_virtual_2, stq_addr_is_virtual_1, stq_addr_is_virtual_0};
	wire can_enq_load_retry = (_GEN_5[ldq_enq_retry_idx[2:0]] & _GEN_238[ldq_enq_retry_idx[2:0]]) & _GEN_240[ldq_enq_retry_idx[2:0]];
	wire can_enq_store_retry = (_GEN_6[stq_enq_retry_idx[2:0]] & _GEN_244[stq_enq_retry_idx[2:0]]) & _GEN_246[stq_enq_retry_idx[2:0]];
	wire _retry_queue_io_enq_valid_T = can_enq_store_retry | can_enq_load_retry;
	wire will_fire_store_retry_0_will_fire;
	wire will_fire_load_retry_0_will_fire;
	wire _exe_tlb_vaddr_T_2 = will_fire_load_retry_0_will_fire | will_fire_store_retry_0_will_fire;
	wire stq_enq_e_bits_uop_is_fence = _GEN_158[stq_execute_head[2:0]];
	wire stq_enq_e_bits_uop_is_amo = _GEN_161[stq_execute_head[2:0]];
	wire stq_enq_e_bits_uop_exception = _GEN_207[stq_execute_head[2:0]];
	wire stq_enq_e_bits_addr_valid = _GEN_244[stq_execute_head[2:0]];
	wire stq_enq_e_bits_addr_is_virtual = _GEN_246[stq_execute_head[2:0]];
	wire [7:0] _GEN_247 = {stq_data_7_valid, stq_data_6_valid, stq_data_5_valid, stq_data_4_valid, stq_data_3_valid, stq_data_2_valid, stq_data_1_valid, stq_data_0_valid};
	wire stq_enq_e_bits_data_valid = _GEN_247[stq_execute_head[2:0]];
	wire [511:0] _GEN_248 = {stq_data_7_bits, stq_data_6_bits, stq_data_5_bits, stq_data_4_bits, stq_data_3_bits, stq_data_2_bits, stq_data_1_bits, stq_data_0_bits};
	wire [7:0] _GEN_249 = {stq_committed_7, stq_committed_6, stq_committed_5, stq_committed_4, stq_committed_3, stq_committed_2, stq_committed_1, stq_committed_0};
	wire stq_enq_e_bits_committed = _GEN_249[stq_execute_head[2:0]];
	wire [7:0] _GEN_250 = {stq_succeeded_7, stq_succeeded_6, stq_succeeded_5, stq_succeeded_4, stq_succeeded_3, stq_succeeded_2, stq_succeeded_1, stq_succeeded_0};
	wire [7:0] _GEN_251 = {stq_can_execute_7, stq_can_execute_6, stq_can_execute_5, stq_can_execute_4, stq_can_execute_3, stq_can_execute_2, stq_can_execute_1, stq_can_execute_0};
	wire [7:0] _GEN_252 = {stq_cleared_7, stq_cleared_6, stq_cleared_5, stq_cleared_4, stq_cleared_3, stq_cleared_2, stq_cleared_1, stq_cleared_0};
	wire [511:0] _GEN_253 = {stq_debug_wb_data_7, stq_debug_wb_data_6, stq_debug_wb_data_5, stq_debug_wb_data_4, stq_debug_wb_data_3, stq_debug_wb_data_2, stq_debug_wb_data_1, stq_debug_wb_data_0};
	wire [31:0] _GEN_254 = {stq_next_ldq_idx_7, stq_next_ldq_idx_6, stq_next_ldq_idx_5, stq_next_ldq_idx_4, stq_next_ldq_idx_3, stq_next_ldq_idx_2, stq_next_ldq_idx_1, stq_next_ldq_idx_0};
	wire will_fire_store_commit_fast_0_will_fire;
	wire will_fire_store_commit_slow_0_will_fire;
	wire _stq_execute_queue_io_deq_ready_T = will_fire_store_commit_fast_0_will_fire | will_fire_store_commit_slow_0_will_fire;
	wire can_enq_store_execute = (((((_GEN_6[stq_execute_head[2:0]] & stq_enq_e_bits_addr_valid) & stq_enq_e_bits_data_valid) & ~stq_enq_e_bits_addr_is_virtual) & ~stq_enq_e_bits_uop_exception) & ~stq_enq_e_bits_uop_is_fence) & (stq_enq_e_bits_committed | stq_enq_e_bits_uop_is_amo);
	wire can_fire_load_agen_exec_0 = io_core_agen_0_valid & io_core_agen_0_bits_uop_uses_ldq;
	reg can_fire_load_retry_REG;
	wire can_fire_store_commit_slow_0 = _stq_execute_queue_io_deq_valid & ~mem_xcpt_valids_0;
	assign will_fire_store_commit_fast_0_will_fire = can_fire_store_commit_slow_0 & stq_almost_full;
	wire [7:0] _GEN_255 = {p1_block_load_mask_7, p1_block_load_mask_6, p1_block_load_mask_5, p1_block_load_mask_4, p1_block_load_mask_3, p1_block_load_mask_2, p1_block_load_mask_1, p1_block_load_mask_0};
	wire [7:0] _GEN_256 = {p2_block_load_mask_7, p2_block_load_mask_6, p2_block_load_mask_5, p2_block_load_mask_4, p2_block_load_mask_3, p2_block_load_mask_2, p2_block_load_mask_1, p2_block_load_mask_0};
	reg can_fire_load_wakeup_REG;
	wire will_fire_load_agen_exec_0_will_fire = (can_fire_load_agen_exec_0 & ~will_fire_sfence_0_will_fire) & ~will_fire_store_commit_fast_0_will_fire;
	wire _will_fire_load_agen_0_will_fire_T_2 = ~will_fire_sfence_0_will_fire & ~will_fire_load_agen_exec_0_will_fire;
	wire _will_fire_hella_incoming_0_will_fire_T_10 = ~will_fire_store_commit_fast_0_will_fire & ~will_fire_load_agen_exec_0_will_fire;
	wire will_fire_load_agen_0_will_fire = (can_fire_load_agen_exec_0 & _will_fire_load_agen_0_will_fire_T_2) & ~will_fire_load_agen_exec_0_will_fire;
	wire _will_fire_store_agen_0_will_fire_T_2 = _will_fire_load_agen_0_will_fire_T_2 & ~will_fire_load_agen_0_will_fire;
	wire _will_fire_store_agen_0_will_fire_T_6 = ~will_fire_load_agen_exec_0_will_fire & ~will_fire_load_agen_0_will_fire;
	wire will_fire_store_agen_0_will_fire = ((io_core_agen_0_valid & io_core_agen_0_bits_uop_uses_stq) & _will_fire_store_agen_0_will_fire_T_2) & _will_fire_store_agen_0_will_fire_T_6;
	wire _will_fire_hella_incoming_0_will_fire_T_2 = _will_fire_store_agen_0_will_fire_T_2 & ~will_fire_store_agen_0_will_fire;
	wire _will_fire_release_0_will_fire_T_6 = _will_fire_store_agen_0_will_fire_T_6 & ~will_fire_store_agen_0_will_fire;
	wire will_fire_release_0_will_fire = io_dmem_release_valid & _will_fire_release_0_will_fire_T_6;
	wire _will_fire_store_retry_0_will_fire_T_6 = _will_fire_release_0_will_fire_T_6 & ~will_fire_release_0_will_fire;
	wire will_fire_hella_incoming_0_will_fire = ((_GEN_0 & _GEN_3) & _will_fire_hella_incoming_0_will_fire_T_2) & _will_fire_hella_incoming_0_will_fire_T_10;
	wire _will_fire_store_retry_0_will_fire_T_2 = _will_fire_hella_incoming_0_will_fire_T_2 & ~will_fire_hella_incoming_0_will_fire;
	wire _will_fire_hella_wakeup_0_will_fire_T_10 = _will_fire_hella_incoming_0_will_fire_T_10 & ~will_fire_hella_incoming_0_will_fire;
	wire will_fire_hella_wakeup_0_will_fire = (_GEN & _GEN_2) & _will_fire_hella_wakeup_0_will_fire_T_10;
	wire _will_fire_load_retry_0_will_fire_T_10 = _will_fire_hella_wakeup_0_will_fire_T_10 & ~will_fire_hella_wakeup_0_will_fire;
	assign will_fire_store_retry_0_will_fire = ((_retry_queue_io_deq_valid & _retry_queue_io_deq_bits_uop_uses_stq) & _will_fire_store_retry_0_will_fire_T_2) & _will_fire_store_retry_0_will_fire_T_6;
	wire _will_fire_load_retry_0_will_fire_T_2 = _will_fire_store_retry_0_will_fire_T_2 & ~will_fire_store_retry_0_will_fire;
	wire _will_fire_load_retry_0_will_fire_T_6 = _will_fire_store_retry_0_will_fire_T_6 & ~will_fire_store_retry_0_will_fire;
	assign will_fire_load_retry_0_will_fire = ((((_retry_queue_io_deq_valid & _retry_queue_io_deq_bits_uop_uses_ldq) & ~can_fire_load_retry_REG) & _will_fire_load_retry_0_will_fire_T_2) & _will_fire_load_retry_0_will_fire_T_6) & _will_fire_load_retry_0_will_fire_T_10;
	assign _will_fire_store_commit_slow_0_T_2 = _will_fire_load_retry_0_will_fire_T_2 & ~will_fire_load_retry_0_will_fire;
	wire _will_fire_load_wakeup_0_will_fire_T_10 = _will_fire_load_retry_0_will_fire_T_10 & ~will_fire_load_retry_0_will_fire;
	wire will_fire_load_wakeup_0_will_fire = ((((((((((((_GEN_5[ldq_wakeup_idx[2:0]] & _GEN_238[ldq_wakeup_idx[2:0]]) & ~_GEN_242[ldq_wakeup_idx[2:0]]) & ~ldq_wakeup_e_bits_addr_is_virtual) & ~ldq_wakeup_e_bits_executed) & ~_GEN_243[ldq_wakeup_idx[2:0]]) & ~_GEN_255[ldq_wakeup_idx[2:0]]) & ~_GEN_256[ldq_wakeup_idx[2:0]]) & ~can_fire_load_wakeup_REG) & ~block_load_wakeup) & (~ldq_wakeup_e_bits_addr_is_uncacheable | ((io_core_commit_load_at_rob_head & (ldq_head == ldq_wakeup_idx)) & ((((stq_head[3] == ldq_wakeup_e_bits_next_stq_idx[3]) & (stq_head[2:0] > ldq_wakeup_e_bits_next_stq_idx[2:0])) | ((stq_head[3] != ldq_wakeup_e_bits_next_stq_idx[3]) & (stq_head[2:0] < ldq_wakeup_e_bits_next_stq_idx[2:0]))) | (stq_head[2:0] == ldq_wakeup_e_bits_next_stq_idx[2:0]))))) & _will_fire_load_retry_0_will_fire_T_6) & ~will_fire_load_retry_0_will_fire) & _will_fire_load_wakeup_0_will_fire_T_10;
	assign will_fire_store_commit_slow_0_will_fire = (can_fire_store_commit_slow_0 & _will_fire_load_wakeup_0_will_fire_T_10) & ~will_fire_load_wakeup_0_will_fire;
	wire _exe_cmd_T = will_fire_load_agen_exec_0_will_fire | will_fire_load_agen_0_will_fire;
	wire _GEN_257 = _exe_cmd_T | will_fire_store_agen_0_will_fire;
	wire _GEN_258 = ldq_wakeup_idx[2:0] == 3'h0;
	wire _GEN_259 = ldq_wakeup_idx[2:0] == 3'h1;
	wire _GEN_260 = ldq_wakeup_idx[2:0] == 3'h2;
	wire _GEN_261 = ldq_wakeup_idx[2:0] == 3'h3;
	wire _GEN_262 = ldq_wakeup_idx[2:0] == 3'h4;
	wire _GEN_263 = ldq_wakeup_idx[2:0] == 3'h5;
	wire _GEN_264 = ldq_wakeup_idx[2:0] == 3'h6;
	wire _GEN_265 = will_fire_load_agen_0_will_fire | will_fire_load_agen_exec_0_will_fire;
	wire _GEN_266 = _retry_queue_io_deq_bits_uop_ldq_idx[2:0] == 3'h0;
	wire _GEN_267 = (_GEN_265 ? io_core_agen_0_bits_uop_ldq_idx[2:0] == 3'h0 : will_fire_load_retry_0_will_fire & _GEN_266);
	wire _GEN_268 = _retry_queue_io_deq_bits_uop_ldq_idx[2:0] == 3'h1;
	wire _GEN_269 = (_GEN_265 ? io_core_agen_0_bits_uop_ldq_idx[2:0] == 3'h1 : will_fire_load_retry_0_will_fire & _GEN_268);
	wire _GEN_270 = _retry_queue_io_deq_bits_uop_ldq_idx[2:0] == 3'h2;
	wire _GEN_271 = (_GEN_265 ? io_core_agen_0_bits_uop_ldq_idx[2:0] == 3'h2 : will_fire_load_retry_0_will_fire & _GEN_270);
	wire _GEN_272 = _retry_queue_io_deq_bits_uop_ldq_idx[2:0] == 3'h3;
	wire _GEN_273 = (_GEN_265 ? io_core_agen_0_bits_uop_ldq_idx[2:0] == 3'h3 : will_fire_load_retry_0_will_fire & _GEN_272);
	wire _GEN_274 = _retry_queue_io_deq_bits_uop_ldq_idx[2:0] == 3'h4;
	wire _GEN_275 = (_GEN_265 ? io_core_agen_0_bits_uop_ldq_idx[2:0] == 3'h4 : will_fire_load_retry_0_will_fire & _GEN_274);
	wire _GEN_276 = _retry_queue_io_deq_bits_uop_ldq_idx[2:0] == 3'h5;
	wire _GEN_277 = (_GEN_265 ? io_core_agen_0_bits_uop_ldq_idx[2:0] == 3'h5 : will_fire_load_retry_0_will_fire & _GEN_276);
	wire _GEN_278 = _retry_queue_io_deq_bits_uop_ldq_idx[2:0] == 3'h6;
	wire _GEN_279 = (_GEN_265 ? io_core_agen_0_bits_uop_ldq_idx[2:0] == 3'h6 : will_fire_load_retry_0_will_fire & _GEN_278);
	wire _GEN_280 = (_GEN_265 ? &io_core_agen_0_bits_uop_ldq_idx[2:0] : will_fire_load_retry_0_will_fire & (&_retry_queue_io_deq_bits_uop_ldq_idx[2:0]));
	wire [5:0] _exe_tlb_uop_T_3_pdst = (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_pdst : 6'h00);
	wire [5:0] _exe_tlb_uop_T_4_pdst = (will_fire_store_agen_0_will_fire ? stq_incoming_e_0_bits_uop_pdst : _exe_tlb_uop_T_3_pdst);
	wire [7:0] exe_tlb_uop_0_br_mask = (_exe_cmd_T ? ldq_incoming_e_0_bits_uop_br_mask : (will_fire_store_agen_0_will_fire ? stq_incoming_e_0_bits_uop_br_mask : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_br_mask : 8'h00)));
	wire exe_tlb_uop_0_is_fence = (_exe_cmd_T ? _GEN_46[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_158[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_is_fence));
	wire [4:0] exe_tlb_uop_0_rob_idx = (_exe_cmd_T ? ldq_incoming_e_0_bits_uop_rob_idx : (will_fire_store_agen_0_will_fire ? stq_incoming_e_0_bits_uop_rob_idx : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_rob_idx : 5'h00)));
	wire [3:0] exe_tlb_uop_0_ldq_idx = (_exe_cmd_T ? _GEN_82[io_core_agen_0_bits_uop_ldq_idx[2:0] * 4+:4] : (will_fire_store_agen_0_will_fire ? _GEN_194[io_core_agen_0_bits_uop_stq_idx[2:0] * 4+:4] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_ldq_idx : 4'h0)));
	wire [3:0] exe_tlb_uop_0_stq_idx = (_exe_cmd_T ? ldq_incoming_e_0_bits_uop_stq_idx : (will_fire_store_agen_0_will_fire ? stq_incoming_e_0_bits_uop_stq_idx : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_stq_idx : 4'h0)));
	wire [4:0] exe_tlb_uop_0_mem_cmd = (_exe_cmd_T ? _GEN_97[io_core_agen_0_bits_uop_ldq_idx[2:0] * 5+:5] : (will_fire_store_agen_0_will_fire ? _GEN_209[io_core_agen_0_bits_uop_stq_idx[2:0] * 5+:5] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_mem_cmd : 5'h00)));
	wire [1:0] exe_tlb_uop_0_mem_size = (_exe_cmd_T ? ldq_incoming_e_0_bits_uop_mem_size : (will_fire_store_agen_0_will_fire ? stq_incoming_e_0_bits_uop_mem_size : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_mem_size : 2'h0)));
	wire exe_tlb_uop_0_uses_ldq = (_exe_cmd_T ? _GEN_100[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_212[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_uses_ldq));
	wire exe_tlb_uop_0_uses_stq = (_exe_cmd_T ? _GEN_101[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_213[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_uses_stq));
	wire [63:0] exe_tlb_vaddr_0 = (_exe_cmd_T | will_fire_store_agen_0_will_fire ? io_core_agen_0_bits_data : (will_fire_sfence_0_will_fire ? {25'h0000000, io_core_sfence_bits_addr} : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_data : {24'h000000, (will_fire_hella_incoming_0_will_fire ? hella_req_addr : 40'h0000000000)})));
	wire ma_ld_0 = _dtlb_io_resp_0_ma_ld & exe_tlb_uop_0_uses_ldq;
	wire pf_ld_0 = _dtlb_io_resp_0_pf_ld & exe_tlb_uop_0_uses_ldq;
	wire ae_ld_0 = _dtlb_io_resp_0_ae_ld & exe_tlb_uop_0_uses_ldq;
	reg [7:0] mem_xcpt_uops_0_br_mask;
	reg [4:0] mem_xcpt_uops_0_rob_idx;
	reg [3:0] mem_xcpt_uops_0_ldq_idx;
	reg [3:0] mem_xcpt_uops_0_stq_idx;
	reg mem_xcpt_uops_0_uses_ldq;
	reg mem_xcpt_uops_0_uses_stq;
	reg [3:0] mem_xcpt_causes_0;
	reg [63:0] mem_xcpt_vaddrs_0;
	wire exe_tlb_miss_0 = ~_will_fire_store_commit_slow_0_T_2 & _dtlb_io_resp_0_miss;
	wire [31:0] exe_tlb_paddr_0 = {_dtlb_io_resp_0_paddr[31:12], exe_tlb_vaddr_0[11:0]};
	reg REG;
	wire dmem_req_fire_0 = dmem_req_0_valid & io_dmem_req_ready;
	reg io_dmem_s1_kill_0_REG;
	wire [39:0] _GEN_281 = {8'h00, _dtlb_io_resp_0_paddr[31:12], exe_tlb_vaddr_0[11:0]};
	wire s0_kills_0 = (will_fire_load_agen_exec_0_will_fire ? (((exe_tlb_miss_0 | ~_dtlb_io_resp_0_cacheable) | ma_ld_0) | ae_ld_0) | pf_ld_0 : will_fire_load_retry_0_will_fire & ((((exe_tlb_miss_0 | ~_dtlb_io_resp_0_cacheable) | ma_ld_0) | ae_ld_0) | pf_ld_0));
	wire _GEN_282 = will_fire_store_commit_slow_0_will_fire | will_fire_store_commit_fast_0_will_fire;
	wire [255:0] _GEN_283 = {_stq_execute_queue_io_deq_bits_data_bits, {2 {_stq_execute_queue_io_deq_bits_data_bits[31:0]}}, {2 {{2 {_stq_execute_queue_io_deq_bits_data_bits[15:0]}}}}, {2 {{2 {{2 {_stq_execute_queue_io_deq_bits_data_bits[7:0]}}}}}}};
	wire _GEN_284 = will_fire_load_agen_exec_0_will_fire | will_fire_load_retry_0_will_fire;
	assign _GEN_4 = (~_GEN_284 & _GEN_282) & ~dmem_req_fire_0;
	assign _GEN_3 = hella_state == 3'h1;
	wire _GEN_285 = ((will_fire_load_agen_exec_0_will_fire | will_fire_load_retry_0_will_fire) | _GEN_282) | will_fire_load_wakeup_0_will_fire;
	assign _GEN_2 = hella_state == 3'h5;
	assign dmem_req_0_valid = _GEN_285 | (will_fire_hella_incoming_0_will_fire ? ~io_hellacache_s1_kill : will_fire_hella_wakeup_0_will_fire);
	wire [39:0] dmem_req_0_bits_addr = (will_fire_load_agen_exec_0_will_fire | will_fire_load_retry_0_will_fire ? _GEN_281 : (_GEN_282 ? _stq_execute_queue_io_deq_bits_addr_bits : (will_fire_load_wakeup_0_will_fire ? _GEN_239[ldq_wakeup_idx[2:0] * 40+:40] : (will_fire_hella_incoming_0_will_fire ? _GEN_281 : (will_fire_hella_wakeup_0_will_fire ? {8'h00, hella_paddr} : 40'h0000000000)))));
	wire _ldq_idx_T = will_fire_load_agen_0_will_fire | will_fire_load_agen_exec_0_will_fire;
	wire _GEN_286 = _ldq_idx_T | will_fire_load_retry_0_will_fire;
	wire [2:0] ldq_idx = (_ldq_idx_T ? io_core_agen_0_bits_uop_ldq_idx[2:0] : _retry_queue_io_deq_bits_uop_ldq_idx[2:0]);
	wire _GEN_287 = will_fire_store_agen_0_will_fire | will_fire_store_retry_0_will_fire;
	wire [2:0] stq_idx = (will_fire_store_agen_0_will_fire ? io_core_agen_0_bits_uop_stq_idx[2:0] : _retry_queue_io_deq_bits_uop_stq_idx[2:0]);
	reg fired_load_agen_exec_REG;
	reg fired_load_agen_REG;
	reg fired_store_agen_REG;
	reg fired_release_0;
	reg fired_load_retry_REG;
	reg fired_store_retry_REG;
	reg fired_load_wakeup_REG;
	reg [7:0] mem_incoming_uop_0_br_mask;
	reg [3:0] mem_incoming_uop_0_ldq_idx;
	reg [3:0] mem_incoming_uop_0_stq_idx;
	reg [5:0] mem_incoming_uop_0_pdst;
	reg [1:0] mem_incoming_uop_0_dst_rtype;
	reg mem_incoming_uop_0_fp_val;
	reg [7:0] mem_ldq_incoming_e_0_bits_uop_br_mask;
	reg [4:0] mem_ldq_incoming_e_0_bits_uop_rob_idx;
	reg [3:0] mem_ldq_incoming_e_0_bits_uop_stq_idx;
	reg [1:0] mem_ldq_incoming_e_0_bits_uop_mem_size;
	reg [3:0] mem_ldq_incoming_e_0_bits_next_stq_idx;
	reg [7:0] mem_stq_incoming_e_0_bits_uop_br_mask;
	reg [4:0] mem_stq_incoming_e_0_bits_uop_rob_idx;
	reg [3:0] mem_stq_incoming_e_0_bits_uop_stq_idx;
	reg [1:0] mem_stq_incoming_e_0_bits_uop_mem_size;
	reg [7:0] mem_ldq_wakeup_e_bits_uop_br_mask;
	reg [4:0] mem_ldq_wakeup_e_bits_uop_rob_idx;
	reg [3:0] mem_ldq_wakeup_e_bits_uop_stq_idx;
	reg [1:0] mem_ldq_wakeup_e_bits_uop_mem_size;
	reg mem_ldq_wakeup_e_bits_addr_is_uncacheable;
	reg [3:0] mem_ldq_wakeup_e_bits_next_stq_idx;
	reg [7:0] mem_ldq_retry_e_bits_uop_br_mask;
	reg [4:0] mem_ldq_retry_e_bits_uop_rob_idx;
	reg [3:0] mem_ldq_retry_e_bits_uop_stq_idx;
	reg [1:0] mem_ldq_retry_e_bits_uop_mem_size;
	reg [3:0] mem_ldq_retry_e_bits_next_stq_idx;
	reg [7:0] mem_stq_retry_e_bits_uop_br_mask;
	reg [4:0] mem_stq_retry_e_bits_uop_rob_idx;
	reg [3:0] mem_stq_retry_e_bits_uop_stq_idx;
	reg [1:0] mem_stq_retry_e_bits_uop_mem_size;
	wire _can_forward_T = fired_load_agen_REG | fired_load_agen_exec_REG;
	wire [3:0] lcam_next_stq_idx_0 = (_can_forward_T ? mem_ldq_incoming_e_0_bits_next_stq_idx : (fired_load_retry_REG ? mem_ldq_retry_e_bits_next_stq_idx : (fired_load_wakeup_REG ? mem_ldq_wakeup_e_bits_next_stq_idx : 4'h0)));
	reg mem_tlb_miss_0;
	reg mem_tlb_uncacheable_0;
	reg [39:0] mem_paddr_0;
	reg [3:0] stq_clr_head_idx;
	reg clr_valid;
	reg [7:0] clr_uop_br_mask;
	reg [4:0] clr_uop_rob_idx;
	reg clr_valid_1;
	reg [7:0] clr_uop_1_br_mask;
	reg [4:0] clr_uop_1_rob_idx;
	wire _lcam_addr_T = fired_store_agen_REG | fired_store_retry_REG;
	wire do_st_search_0 = _lcam_addr_T & ~mem_tlb_miss_0;
	wire do_ld_search_0 = ((_can_forward_T | fired_load_retry_REG) & ~mem_tlb_miss_0) | fired_load_wakeup_REG;
	reg [31:0] lcam_addr_REG;
	reg [31:0] lcam_addr_REG_1;
	wire [39:0] lcam_addr_0 = ((_lcam_addr_T | fired_load_agen_REG) | fired_load_agen_exec_REG ? {8'h00, lcam_addr_REG} : (fired_release_0 ? {8'h00, lcam_addr_REG_1} : mem_paddr_0));
	wire [2:0] lcam_uop_0_stq_idx = (do_st_search_0 ? (fired_store_agen_REG ? mem_stq_incoming_e_0_bits_uop_stq_idx[2:0] : (fired_store_retry_REG ? mem_stq_retry_e_bits_uop_stq_idx[2:0] : 3'h0)) : (do_ld_search_0 ? (_can_forward_T ? mem_ldq_incoming_e_0_bits_uop_stq_idx[2:0] : (fired_load_retry_REG ? mem_ldq_retry_e_bits_uop_stq_idx[2:0] : (fired_load_wakeup_REG ? mem_ldq_wakeup_e_bits_uop_stq_idx[2:0] : 3'h0))) : 3'h0));
	wire [14:0] _lcam_mask_mask_T_2 = 15'h0001 << lcam_addr_0[2:0];
	wire [14:0] _lcam_mask_mask_T_6 = 15'h0003 << {12'h000, lcam_addr_0[2:1], 1'h0};
	wire [31:0] _GEN_288 = {8'hff, (lcam_addr_0[2] ? 8'hf0 : 8'h0f), _lcam_mask_mask_T_6[7:0], _lcam_mask_mask_T_2[7:0]};
	wire [7:0] lcam_mask_0 = _GEN_288[(do_st_search_0 ? (fired_store_agen_REG ? mem_stq_incoming_e_0_bits_uop_mem_size : (fired_store_retry_REG ? mem_stq_retry_e_bits_uop_mem_size : 2'h0)) : (do_ld_search_0 ? (_can_forward_T ? mem_ldq_incoming_e_0_bits_uop_mem_size : (fired_load_retry_REG ? mem_ldq_retry_e_bits_uop_mem_size : (fired_load_wakeup_REG ? mem_ldq_wakeup_e_bits_uop_mem_size : 2'h0))) : 2'h0)) * 8+:8];
	reg [3:0] lcam_ldq_idx_reg;
	reg [3:0] lcam_ldq_idx_reg_1;
	wire [3:0] lcam_ldq_idx_0 = (_can_forward_T ? mem_incoming_uop_0_ldq_idx : (fired_load_wakeup_REG ? lcam_ldq_idx_reg : (fired_load_retry_REG ? lcam_ldq_idx_reg_1 : 4'h0)));
	reg [3:0] lcam_stq_idx_reg;
	wire [3:0] lcam_stq_idx_0 = (fired_store_agen_REG ? mem_incoming_uop_0_stq_idx : (fired_store_retry_REG ? lcam_stq_idx_reg : 4'h0));
	wire _lcam_younger_load_mask_0_0_T_4 = lcam_ldq_idx_0[2:0] == 3'h0;
	wire lcam_younger_load_mask_0_0 = (lcam_ldq_idx_0[3] == ldq_tail[3] ? _lcam_younger_load_mask_0_0_T_4 & |ldq_tail[2:0] : _lcam_younger_load_mask_0_0_T_4 | (|ldq_tail[2:0])) & |lcam_ldq_idx_0[2:0];
	wire _lcam_younger_load_mask_0_1_T_4 = lcam_ldq_idx_0[2:0] < 3'h2;
	wire lcam_younger_load_mask_0_1 = (lcam_ldq_idx_0[3] == ldq_tail[3] ? _lcam_younger_load_mask_0_1_T_4 & |ldq_tail[2:1] : _lcam_younger_load_mask_0_1_T_4 | (|ldq_tail[2:1])) & (lcam_ldq_idx_0[2:0] != 3'h1);
	wire _lcam_younger_load_mask_0_2_T_4 = lcam_ldq_idx_0[2:0] < 3'h3;
	wire _lcam_younger_load_mask_0_2_T_5 = ldq_tail[2:0] > 3'h2;
	wire lcam_younger_load_mask_0_2 = (lcam_ldq_idx_0[3] == ldq_tail[3] ? _lcam_younger_load_mask_0_2_T_4 & _lcam_younger_load_mask_0_2_T_5 : _lcam_younger_load_mask_0_2_T_4 | _lcam_younger_load_mask_0_2_T_5) & (lcam_ldq_idx_0[2:0] != 3'h2);
	wire lcam_younger_load_mask_0_3 = (lcam_ldq_idx_0[3] == ldq_tail[3] ? ~lcam_ldq_idx_0[2] & ldq_tail[2] : ~lcam_ldq_idx_0[2] | ldq_tail[2]) & (lcam_ldq_idx_0[2:0] != 3'h3);
	wire _lcam_younger_load_mask_0_4_T_4 = lcam_ldq_idx_0[2:0] < 3'h5;
	wire _lcam_younger_load_mask_0_4_T_5 = ldq_tail[2:0] > 3'h4;
	wire lcam_younger_load_mask_0_4 = (lcam_ldq_idx_0[3] == ldq_tail[3] ? _lcam_younger_load_mask_0_4_T_4 & _lcam_younger_load_mask_0_4_T_5 : _lcam_younger_load_mask_0_4_T_4 | _lcam_younger_load_mask_0_4_T_5) & (lcam_ldq_idx_0[2:0] != 3'h4);
	wire _lcam_younger_load_mask_0_5_T_4 = lcam_ldq_idx_0[2:1] != 2'h3;
	wire _lcam_younger_load_mask_0_5_T_5 = ldq_tail[2:0] > 3'h5;
	wire lcam_younger_load_mask_0_5 = (lcam_ldq_idx_0[3] == ldq_tail[3] ? _lcam_younger_load_mask_0_5_T_4 & _lcam_younger_load_mask_0_5_T_5 : _lcam_younger_load_mask_0_5_T_4 | _lcam_younger_load_mask_0_5_T_5) & (lcam_ldq_idx_0[2:0] != 3'h5);
	wire _lcam_younger_load_mask_0_6_T_4 = lcam_ldq_idx_0[2:0] != 3'h7;
	wire lcam_younger_load_mask_0_6 = (lcam_ldq_idx_0[3] == ldq_tail[3] ? _lcam_younger_load_mask_0_6_T_4 & (&ldq_tail[2:0]) : _lcam_younger_load_mask_0_6_T_4 | &ldq_tail[2:0]) & (lcam_ldq_idx_0[2:0] != 3'h6);
	wire lcam_younger_load_mask_0_7 = (lcam_ldq_idx_0[3] != ldq_tail[3]) & ~(&lcam_ldq_idx_0[2:0]);
	reg s1_executing_loads_0;
	reg s1_executing_loads_1;
	reg s1_executing_loads_2;
	reg s1_executing_loads_3;
	reg s1_executing_loads_4;
	reg s1_executing_loads_5;
	reg s1_executing_loads_6;
	reg s1_executing_loads_7;
	reg [7:0] wb_ldst_forward_e_REG_uop_br_mask;
	reg [4:0] wb_ldst_forward_e_REG_uop_rob_idx;
	reg [3:0] wb_ldst_forward_e_REG_uop_ldq_idx;
	reg [3:0] wb_ldst_forward_e_REG_uop_stq_idx;
	reg [5:0] wb_ldst_forward_e_REG_uop_pdst;
	reg [1:0] wb_ldst_forward_e_REG_uop_mem_size;
	reg wb_ldst_forward_e_REG_uop_mem_signed;
	reg [1:0] wb_ldst_forward_e_REG_uop_dst_rtype;
	reg wb_ldst_forward_e_REG_observed;
	reg [3:0] wb_ldst_forward_e_REG_next_stq_idx;
	reg [3:0] wb_ldst_forward_ldq_idx_0;
	reg [39:0] wb_ldst_forward_ld_addr_0;
	wire block_addr_matches_0 = lcam_addr_0[39:6] == ldq_addr_0_bits[39:6];
	wire dword_addr_matches_0 = block_addr_matches_0 & (lcam_addr_0[5:3] == ldq_addr_0_bits[5:3]);
	wire [7:0] _mask_overlap_T = ldq_ld_byte_mask_0 & lcam_mask_0;
	wire _GEN_289 = ldq_executed_0 | ldq_succeeded_0;
	wire _GEN_290 = ldq_next_stq_idx_0[3] == lcam_stq_idx_0[3];
	wire _GEN_291 = ((((((do_st_search_0 & ldq_valid_0) & ldq_addr_0_valid) & _GEN_289) & ~ldq_addr_is_virtual_0) & ((_GEN_290 & (ldq_next_stq_idx_0[2:0] > lcam_stq_idx_0[2:0])) | (~_GEN_290 & (ldq_next_stq_idx_0[2:0] < lcam_stq_idx_0[2:0])))) & dword_addr_matches_0) & |_mask_overlap_T;
	wire _GEN_292 = ((((do_ld_search_0 & ldq_valid_0) & ldq_addr_0_valid) & ~ldq_addr_is_virtual_0) & dword_addr_matches_0) & |_mask_overlap_T;
	wire _GEN_293 = ldq_executed_0 & (ldq_succeeded_0 | ldq_will_succeed_0);
	wire _GEN_294 = lcam_ldq_idx_0[2:0] == 3'h1;
	wire _GEN_295 = lcam_ldq_idx_0[2:0] == 3'h2;
	wire _GEN_296 = lcam_ldq_idx_0[2:0] == 3'h3;
	wire _GEN_297 = lcam_ldq_idx_0[2:0] == 3'h4;
	wire _GEN_298 = lcam_ldq_idx_0[2:0] == 3'h5;
	wire _GEN_299 = lcam_ldq_idx_0[2:0] == 3'h6;
	reg REG_1;
	wire block_addr_matches_1_0 = lcam_addr_0[39:6] == ldq_addr_1_bits[39:6];
	wire dword_addr_matches_1_0 = block_addr_matches_1_0 & (lcam_addr_0[5:3] == ldq_addr_1_bits[5:3]);
	wire [7:0] _mask_overlap_T_2 = ldq_ld_byte_mask_1 & lcam_mask_0;
	wire _GEN_300 = ldq_executed_1 | ldq_succeeded_1;
	wire _GEN_301 = ldq_next_stq_idx_1[3] == lcam_stq_idx_0[3];
	wire _GEN_302 = ((((((do_st_search_0 & ldq_valid_1) & ldq_addr_1_valid) & _GEN_300) & ~ldq_addr_is_virtual_1) & ((_GEN_301 & (ldq_next_stq_idx_1[2:0] > lcam_stq_idx_0[2:0])) | (~_GEN_301 & (ldq_next_stq_idx_1[2:0] < lcam_stq_idx_0[2:0])))) & dword_addr_matches_1_0) & |_mask_overlap_T_2;
	wire _GEN_303 = ((((do_ld_search_0 & ldq_valid_1) & ldq_addr_1_valid) & ~ldq_addr_is_virtual_1) & dword_addr_matches_1_0) & |_mask_overlap_T_2;
	wire _GEN_304 = ldq_executed_1 & (ldq_succeeded_1 | ldq_will_succeed_1);
	wire _GEN_305 = lcam_younger_load_mask_0_1 | _GEN_294;
	reg REG_2;
	wire block_addr_matches_2_0 = lcam_addr_0[39:6] == ldq_addr_2_bits[39:6];
	wire dword_addr_matches_2_0 = block_addr_matches_2_0 & (lcam_addr_0[5:3] == ldq_addr_2_bits[5:3]);
	wire [7:0] _mask_overlap_T_4 = ldq_ld_byte_mask_2 & lcam_mask_0;
	wire _GEN_306 = ldq_executed_2 | ldq_succeeded_2;
	wire _GEN_307 = ldq_next_stq_idx_2[3] == lcam_stq_idx_0[3];
	wire _GEN_308 = ((((((do_st_search_0 & ldq_valid_2) & ldq_addr_2_valid) & _GEN_306) & ~ldq_addr_is_virtual_2) & ((_GEN_307 & (ldq_next_stq_idx_2[2:0] > lcam_stq_idx_0[2:0])) | (~_GEN_307 & (ldq_next_stq_idx_2[2:0] < lcam_stq_idx_0[2:0])))) & dword_addr_matches_2_0) & |_mask_overlap_T_4;
	wire _GEN_309 = ((((do_ld_search_0 & ldq_valid_2) & ldq_addr_2_valid) & ~ldq_addr_is_virtual_2) & dword_addr_matches_2_0) & |_mask_overlap_T_4;
	wire _GEN_310 = ldq_executed_2 & (ldq_succeeded_2 | ldq_will_succeed_2);
	wire _GEN_311 = lcam_younger_load_mask_0_2 | _GEN_295;
	reg REG_3;
	wire block_addr_matches_3_0 = lcam_addr_0[39:6] == ldq_addr_3_bits[39:6];
	wire dword_addr_matches_3_0 = block_addr_matches_3_0 & (lcam_addr_0[5:3] == ldq_addr_3_bits[5:3]);
	wire [7:0] _mask_overlap_T_6 = ldq_ld_byte_mask_3 & lcam_mask_0;
	wire _GEN_312 = ldq_executed_3 | ldq_succeeded_3;
	wire _GEN_313 = ldq_next_stq_idx_3[3] == lcam_stq_idx_0[3];
	wire _GEN_314 = ((((((do_st_search_0 & ldq_valid_3) & ldq_addr_3_valid) & _GEN_312) & ~ldq_addr_is_virtual_3) & ((_GEN_313 & (ldq_next_stq_idx_3[2:0] > lcam_stq_idx_0[2:0])) | (~_GEN_313 & (ldq_next_stq_idx_3[2:0] < lcam_stq_idx_0[2:0])))) & dword_addr_matches_3_0) & |_mask_overlap_T_6;
	wire _GEN_315 = ((((do_ld_search_0 & ldq_valid_3) & ldq_addr_3_valid) & ~ldq_addr_is_virtual_3) & dword_addr_matches_3_0) & |_mask_overlap_T_6;
	wire _GEN_316 = ldq_executed_3 & (ldq_succeeded_3 | ldq_will_succeed_3);
	wire _GEN_317 = lcam_younger_load_mask_0_3 | _GEN_296;
	reg REG_4;
	wire block_addr_matches_4_0 = lcam_addr_0[39:6] == ldq_addr_4_bits[39:6];
	wire dword_addr_matches_4_0 = block_addr_matches_4_0 & (lcam_addr_0[5:3] == ldq_addr_4_bits[5:3]);
	wire [7:0] _mask_overlap_T_8 = ldq_ld_byte_mask_4 & lcam_mask_0;
	wire _GEN_318 = ldq_executed_4 | ldq_succeeded_4;
	wire _GEN_319 = ldq_next_stq_idx_4[3] == lcam_stq_idx_0[3];
	wire _GEN_320 = ((((((do_st_search_0 & ldq_valid_4) & ldq_addr_4_valid) & _GEN_318) & ~ldq_addr_is_virtual_4) & ((_GEN_319 & (ldq_next_stq_idx_4[2:0] > lcam_stq_idx_0[2:0])) | (~_GEN_319 & (ldq_next_stq_idx_4[2:0] < lcam_stq_idx_0[2:0])))) & dword_addr_matches_4_0) & |_mask_overlap_T_8;
	wire _GEN_321 = ((((do_ld_search_0 & ldq_valid_4) & ldq_addr_4_valid) & ~ldq_addr_is_virtual_4) & dword_addr_matches_4_0) & |_mask_overlap_T_8;
	wire _GEN_322 = ldq_executed_4 & (ldq_succeeded_4 | ldq_will_succeed_4);
	wire _GEN_323 = lcam_younger_load_mask_0_4 | _GEN_297;
	reg REG_5;
	wire block_addr_matches_5_0 = lcam_addr_0[39:6] == ldq_addr_5_bits[39:6];
	wire dword_addr_matches_5_0 = block_addr_matches_5_0 & (lcam_addr_0[5:3] == ldq_addr_5_bits[5:3]);
	wire [7:0] _mask_overlap_T_10 = ldq_ld_byte_mask_5 & lcam_mask_0;
	wire _GEN_324 = ldq_executed_5 | ldq_succeeded_5;
	wire _GEN_325 = ldq_next_stq_idx_5[3] == lcam_stq_idx_0[3];
	wire _GEN_326 = ((((((do_st_search_0 & ldq_valid_5) & ldq_addr_5_valid) & _GEN_324) & ~ldq_addr_is_virtual_5) & ((_GEN_325 & (ldq_next_stq_idx_5[2:0] > lcam_stq_idx_0[2:0])) | (~_GEN_325 & (ldq_next_stq_idx_5[2:0] < lcam_stq_idx_0[2:0])))) & dword_addr_matches_5_0) & |_mask_overlap_T_10;
	wire _GEN_327 = ((((do_ld_search_0 & ldq_valid_5) & ldq_addr_5_valid) & ~ldq_addr_is_virtual_5) & dword_addr_matches_5_0) & |_mask_overlap_T_10;
	wire _GEN_328 = ldq_executed_5 & (ldq_succeeded_5 | ldq_will_succeed_5);
	wire _GEN_329 = lcam_younger_load_mask_0_5 | _GEN_298;
	reg REG_6;
	wire block_addr_matches_6_0 = lcam_addr_0[39:6] == ldq_addr_6_bits[39:6];
	wire dword_addr_matches_6_0 = block_addr_matches_6_0 & (lcam_addr_0[5:3] == ldq_addr_6_bits[5:3]);
	wire [7:0] _mask_overlap_T_12 = ldq_ld_byte_mask_6 & lcam_mask_0;
	wire _GEN_330 = ldq_executed_6 | ldq_succeeded_6;
	wire _GEN_331 = ldq_next_stq_idx_6[3] == lcam_stq_idx_0[3];
	wire _GEN_332 = ((((((do_st_search_0 & ldq_valid_6) & ldq_addr_6_valid) & _GEN_330) & ~ldq_addr_is_virtual_6) & ((_GEN_331 & (ldq_next_stq_idx_6[2:0] > lcam_stq_idx_0[2:0])) | (~_GEN_331 & (ldq_next_stq_idx_6[2:0] < lcam_stq_idx_0[2:0])))) & dword_addr_matches_6_0) & |_mask_overlap_T_12;
	wire _GEN_333 = ((((do_ld_search_0 & ldq_valid_6) & ldq_addr_6_valid) & ~ldq_addr_is_virtual_6) & dword_addr_matches_6_0) & |_mask_overlap_T_12;
	wire _GEN_334 = ldq_executed_6 & (ldq_succeeded_6 | ldq_will_succeed_6);
	wire _GEN_335 = lcam_younger_load_mask_0_6 | _GEN_299;
	reg REG_7;
	wire block_addr_matches_7_0 = lcam_addr_0[39:6] == ldq_addr_7_bits[39:6];
	wire dword_addr_matches_7_0 = block_addr_matches_7_0 & (lcam_addr_0[5:3] == ldq_addr_7_bits[5:3]);
	wire [7:0] _mask_overlap_T_14 = ldq_ld_byte_mask_7 & lcam_mask_0;
	wire _GEN_336 = ldq_executed_7 | ldq_succeeded_7;
	wire _GEN_337 = ldq_next_stq_idx_7[3] == lcam_stq_idx_0[3];
	wire _GEN_338 = ((((((do_st_search_0 & ldq_valid_7) & ldq_addr_7_valid) & _GEN_336) & ~ldq_addr_is_virtual_7) & ((_GEN_337 & (ldq_next_stq_idx_7[2:0] > lcam_stq_idx_0[2:0])) | (~_GEN_337 & (ldq_next_stq_idx_7[2:0] < lcam_stq_idx_0[2:0])))) & dword_addr_matches_7_0) & |_mask_overlap_T_14;
	wire _GEN_339 = ((((do_ld_search_0 & ldq_valid_7) & ldq_addr_7_valid) & ~ldq_addr_is_virtual_7) & dword_addr_matches_7_0) & |_mask_overlap_T_14;
	wire _GEN_340 = ldq_executed_7 & (ldq_succeeded_7 | ldq_will_succeed_7);
	reg REG_8;
	wire _GEN_341 = ((((((((((((_GEN_339 & ~lcam_younger_load_mask_0_7) & ~(&lcam_ldq_idx_0[2:0])) & ~_GEN_340) & REG_8) & ~fired_load_agen_REG) | ((((_GEN_333 & ~_GEN_335) & ~_GEN_334) & REG_7) & ~fired_load_agen_REG)) | ((((_GEN_327 & ~_GEN_329) & ~_GEN_328) & REG_6) & ~fired_load_agen_REG)) | ((((_GEN_321 & ~_GEN_323) & ~_GEN_322) & REG_5) & ~fired_load_agen_REG)) | ((((_GEN_315 & ~_GEN_317) & ~_GEN_316) & REG_4) & ~fired_load_agen_REG)) | ((((_GEN_309 & ~_GEN_311) & ~_GEN_310) & REG_3) & ~fired_load_agen_REG)) | ((((_GEN_303 & ~_GEN_305) & ~_GEN_304) & REG_2) & ~fired_load_agen_REG)) | (((((_GEN_292 & ~lcam_younger_load_mask_0_0) & |lcam_ldq_idx_0[2:0]) & ~_GEN_293) & REG_1) & ~fired_load_agen_REG)) | io_dmem_s1_kill_0_REG;
	wire [14:0] _nack_mask_mask_T_2 = 15'h0001 << io_dmem_nack_0_bits_addr[2:0];
	wire [14:0] _nack_mask_mask_T_6 = 15'h0003 << {12'h000, io_dmem_nack_0_bits_addr[2:1], 1'h0};
	wire [31:0] _GEN_342 = {8'hff, (io_dmem_nack_0_bits_addr[2] ? 8'hf0 : 8'h0f), _nack_mask_mask_T_6[7:0], _nack_mask_mask_T_2[7:0]};
	wire _GEN_343 = lcam_ldq_idx_0[3] == io_dmem_nack_0_bits_uop_ldq_idx[3];
	wire _GEN_344 = ldq_head[3] == io_dmem_nack_0_bits_uop_ldq_idx[3];
	wire _GEN_345 = ldq_head[3] == lcam_ldq_idx_0[3];
	wire _GEN_346 = (_GEN_345 & (ldq_head[2:0] > lcam_ldq_idx_0[2:0])) | (~_GEN_345 & (ldq_head[2:0] < lcam_ldq_idx_0[2:0]));
	wire _GEN_347 = ((((do_ld_search_0 & io_dmem_nack_0_valid) & io_dmem_nack_0_bits_uop_uses_ldq) & (lcam_addr_0[39:3] == io_dmem_nack_0_bits_addr[39:3])) & |(_GEN_342[io_dmem_nack_0_bits_uop_mem_size * 8+:8] & lcam_mask_0)) & ((((_GEN_343 & (lcam_ldq_idx_0[2:0] > io_dmem_nack_0_bits_uop_ldq_idx[2:0])) | (~_GEN_343 & (lcam_ldq_idx_0[2:0] < io_dmem_nack_0_bits_uop_ldq_idx[2:0]))) ^ ((_GEN_344 & (ldq_head[2:0] > io_dmem_nack_0_bits_uop_ldq_idx[2:0])) | (~_GEN_344 & (ldq_head[2:0] < io_dmem_nack_0_bits_uop_ldq_idx[2:0])))) ^ _GEN_346);
	reg REG_9;
	wire _GEN_348 = (_GEN_347 & REG_9) & ~fired_load_agen_REG;
	wire _GEN_349 = wb_ldst_forward_ldq_idx_0[2:0] == 3'h0;
	wire _GEN_350 = wb_ldst_forward_ldq_idx_0[2:0] == 3'h1;
	wire _GEN_351 = wb_ldst_forward_ldq_idx_0[2:0] == 3'h2;
	wire _GEN_352 = wb_ldst_forward_ldq_idx_0[2:0] == 3'h3;
	wire _GEN_353 = wb_ldst_forward_ldq_idx_0[2:0] == 3'h4;
	wire _GEN_354 = wb_ldst_forward_ldq_idx_0[2:0] == 3'h5;
	wire _GEN_355 = wb_ldst_forward_ldq_idx_0[2:0] == 3'h6;
	wire [14:0] _write_mask_mask_T_2 = 15'h0001 << stq_addr_0_bits[2:0];
	wire [14:0] _write_mask_mask_T_6 = 15'h0003 << {12'h000, stq_addr_0_bits[2:1], 1'h0};
	wire [31:0] _GEN_356 = {8'hff, (stq_addr_0_bits[2] ? 8'hf0 : 8'h0f), _write_mask_mask_T_6[7:0], _write_mask_mask_T_2[7:0]};
	wire [7:0] mask_union = lcam_mask_0 & _GEN_356[stq_uop_0_mem_size * 8+:8];
	wire addr_matches_0_0 = (((|mask_union & stq_addr_0_valid) & ~stq_uop_0_is_amo) & ~stq_addr_is_virtual_0) & (stq_addr_0_bits[31:3] == lcam_addr_0[31:3]);
	wire _GEN_357 = stq_head[2:0] == 3'h0;
	wire _age_matches_0_0_T_4 = stq_head[2:0] == 3'h0;
	wire age_matches_0_0 = (stq_head[3] == lcam_next_stq_idx_0[3] ? _age_matches_0_0_T_4 & |lcam_next_stq_idx_0[2:0] : _age_matches_0_0_T_4 | (|lcam_next_stq_idx_0[2:0]));
	wire [14:0] _write_mask_mask_T_17 = 15'h0001 << stq_addr_1_bits[2:0];
	wire [14:0] _write_mask_mask_T_21 = 15'h0003 << {12'h000, stq_addr_1_bits[2:1], 1'h0};
	wire [31:0] _GEN_358 = {8'hff, (stq_addr_1_bits[2] ? 8'hf0 : 8'h0f), _write_mask_mask_T_21[7:0], _write_mask_mask_T_17[7:0]};
	wire [7:0] mask_union_1 = lcam_mask_0 & _GEN_358[stq_uop_1_mem_size * 8+:8];
	wire addr_matches_0_1 = (((|mask_union_1 & stq_addr_1_valid) & ~stq_uop_1_is_amo) & ~stq_addr_is_virtual_1) & (stq_addr_1_bits[31:3] == lcam_addr_0[31:3]);
	wire _age_matches_0_1_T_4 = stq_head[2:0] < 3'h2;
	wire age_matches_0_1 = (stq_head[3] == lcam_next_stq_idx_0[3] ? _age_matches_0_1_T_4 & |lcam_next_stq_idx_0[2:1] : _age_matches_0_1_T_4 | (|lcam_next_stq_idx_0[2:1]));
	wire [14:0] _write_mask_mask_T_32 = 15'h0001 << stq_addr_2_bits[2:0];
	wire [14:0] _write_mask_mask_T_36 = 15'h0003 << {12'h000, stq_addr_2_bits[2:1], 1'h0};
	wire [31:0] _GEN_359 = {8'hff, (stq_addr_2_bits[2] ? 8'hf0 : 8'h0f), _write_mask_mask_T_36[7:0], _write_mask_mask_T_32[7:0]};
	wire [7:0] mask_union_2 = lcam_mask_0 & _GEN_359[stq_uop_2_mem_size * 8+:8];
	wire addr_matches_0_2 = (((|mask_union_2 & stq_addr_2_valid) & ~stq_uop_2_is_amo) & ~stq_addr_is_virtual_2) & (stq_addr_2_bits[31:3] == lcam_addr_0[31:3]);
	wire _age_matches_0_2_T_4 = stq_head[2:0] < 3'h3;
	wire _age_matches_0_2_T_5 = lcam_next_stq_idx_0[2:0] > 3'h2;
	wire age_matches_0_2 = (stq_head[3] == lcam_next_stq_idx_0[3] ? _age_matches_0_2_T_4 & _age_matches_0_2_T_5 : _age_matches_0_2_T_4 | _age_matches_0_2_T_5);
	wire [14:0] _write_mask_mask_T_47 = 15'h0001 << stq_addr_3_bits[2:0];
	wire [14:0] _write_mask_mask_T_51 = 15'h0003 << {12'h000, stq_addr_3_bits[2:1], 1'h0};
	wire [31:0] _GEN_360 = {8'hff, (stq_addr_3_bits[2] ? 8'hf0 : 8'h0f), _write_mask_mask_T_51[7:0], _write_mask_mask_T_47[7:0]};
	wire [7:0] mask_union_3 = lcam_mask_0 & _GEN_360[stq_uop_3_mem_size * 8+:8];
	wire addr_matches_0_3 = (((|mask_union_3 & stq_addr_3_valid) & ~stq_uop_3_is_amo) & ~stq_addr_is_virtual_3) & (stq_addr_3_bits[31:3] == lcam_addr_0[31:3]);
	wire age_matches_0_3 = (stq_head[3] == lcam_next_stq_idx_0[3] ? ~stq_head[2] & lcam_next_stq_idx_0[2] : ~stq_head[2] | lcam_next_stq_idx_0[2]);
	wire [14:0] _write_mask_mask_T_62 = 15'h0001 << stq_addr_4_bits[2:0];
	wire [14:0] _write_mask_mask_T_66 = 15'h0003 << {12'h000, stq_addr_4_bits[2:1], 1'h0};
	wire [31:0] _GEN_361 = {8'hff, (stq_addr_4_bits[2] ? 8'hf0 : 8'h0f), _write_mask_mask_T_66[7:0], _write_mask_mask_T_62[7:0]};
	wire [7:0] mask_union_4 = lcam_mask_0 & _GEN_361[stq_uop_4_mem_size * 8+:8];
	wire addr_matches_0_4 = (((|mask_union_4 & stq_addr_4_valid) & ~stq_uop_4_is_amo) & ~stq_addr_is_virtual_4) & (stq_addr_4_bits[31:3] == lcam_addr_0[31:3]);
	wire _age_matches_0_4_T_4 = stq_head[2:0] < 3'h5;
	wire _age_matches_0_4_T_5 = lcam_next_stq_idx_0[2:0] > 3'h4;
	wire age_matches_0_4 = (stq_head[3] == lcam_next_stq_idx_0[3] ? _age_matches_0_4_T_4 & _age_matches_0_4_T_5 : _age_matches_0_4_T_4 | _age_matches_0_4_T_5);
	wire [14:0] _write_mask_mask_T_77 = 15'h0001 << stq_addr_5_bits[2:0];
	wire [14:0] _write_mask_mask_T_81 = 15'h0003 << {12'h000, stq_addr_5_bits[2:1], 1'h0};
	wire [31:0] _GEN_362 = {8'hff, (stq_addr_5_bits[2] ? 8'hf0 : 8'h0f), _write_mask_mask_T_81[7:0], _write_mask_mask_T_77[7:0]};
	wire [7:0] mask_union_5 = lcam_mask_0 & _GEN_362[stq_uop_5_mem_size * 8+:8];
	wire addr_matches_0_5 = (((|mask_union_5 & stq_addr_5_valid) & ~stq_uop_5_is_amo) & ~stq_addr_is_virtual_5) & (stq_addr_5_bits[31:3] == lcam_addr_0[31:3]);
	wire _age_matches_0_5_T_4 = stq_head[2:1] != 2'h3;
	wire _age_matches_0_5_T_5 = lcam_next_stq_idx_0[2:0] > 3'h5;
	wire age_matches_0_5 = (stq_head[3] == lcam_next_stq_idx_0[3] ? _age_matches_0_5_T_4 & _age_matches_0_5_T_5 : _age_matches_0_5_T_4 | _age_matches_0_5_T_5);
	wire [14:0] _write_mask_mask_T_92 = 15'h0001 << stq_addr_6_bits[2:0];
	wire [14:0] _write_mask_mask_T_96 = 15'h0003 << {12'h000, stq_addr_6_bits[2:1], 1'h0};
	wire [31:0] _GEN_363 = {8'hff, (stq_addr_6_bits[2] ? 8'hf0 : 8'h0f), _write_mask_mask_T_96[7:0], _write_mask_mask_T_92[7:0]};
	wire [7:0] mask_union_6 = lcam_mask_0 & _GEN_363[stq_uop_6_mem_size * 8+:8];
	wire addr_matches_0_6 = (((|mask_union_6 & stq_addr_6_valid) & ~stq_uop_6_is_amo) & ~stq_addr_is_virtual_6) & (stq_addr_6_bits[31:3] == lcam_addr_0[31:3]);
	wire _age_matches_0_6_T_4 = stq_head[2:0] != 3'h7;
	wire age_matches_0_6 = (stq_head[3] == lcam_next_stq_idx_0[3] ? _age_matches_0_6_T_4 & (&lcam_next_stq_idx_0[2:0]) : _age_matches_0_6_T_4 | &lcam_next_stq_idx_0[2:0]);
	wire [14:0] _write_mask_mask_T_107 = 15'h0001 << stq_addr_7_bits[2:0];
	wire [14:0] _write_mask_mask_T_111 = 15'h0003 << {12'h000, stq_addr_7_bits[2:1], 1'h0};
	wire [31:0] _GEN_364 = {8'hff, (stq_addr_7_bits[2] ? 8'hf0 : 8'h0f), _write_mask_mask_T_111[7:0], _write_mask_mask_T_107[7:0]};
	wire [7:0] mask_union_7 = lcam_mask_0 & _GEN_364[stq_uop_7_mem_size * 8+:8];
	wire addr_matches_0_7 = (((|mask_union_7 & stq_addr_7_valid) & ~stq_uop_7_is_amo) & ~stq_addr_is_virtual_7) & (stq_addr_7_bits[31:3] == lcam_addr_0[31:3]);
	wire age_matches_0_7 = stq_head[3] != lcam_next_stq_idx_0[3];
	wire [7:0] fast_stq_valids = {stq_valid_7, stq_valid_6, stq_valid_5, stq_valid_4, stq_valid_3, stq_valid_2, stq_valid_1, stq_valid_0};
	wire [7:0] ldst_addr_matches_0 = ({addr_matches_0_7, addr_matches_0_6, addr_matches_0_5, addr_matches_0_4, addr_matches_0_3, addr_matches_0_2, addr_matches_0_1, addr_matches_0_0} & {age_matches_0_7, age_matches_0_6, age_matches_0_5, age_matches_0_4, age_matches_0_3, age_matches_0_2, age_matches_0_1, age_matches_0_0}) & fast_stq_valids;
	wire [7:0] _has_older_amo_T_2 = {stq_uop_7_is_fence | stq_uop_7_is_amo, stq_uop_6_is_fence | stq_uop_6_is_amo, stq_uop_5_is_fence | stq_uop_5_is_amo, stq_uop_4_is_fence | stq_uop_4_is_amo, stq_uop_3_is_fence | stq_uop_3_is_amo, stq_uop_2_is_fence | stq_uop_2_is_amo, stq_uop_1_is_fence | stq_uop_1_is_amo, stq_uop_0_is_fence | stq_uop_0_is_amo} & {age_matches_0_7, age_matches_0_6, age_matches_0_5, age_matches_0_4, age_matches_0_3, age_matches_0_2, age_matches_0_1, age_matches_0_0};
	wire _GEN_365 = do_ld_search_0 & (|_has_older_amo_T_2 | (|ldst_addr_matches_0));
	reg REG_10;
	wire io_dmem_s1_kill_0_0 = (_GEN_365 ? ((REG_10 & ~fired_load_agen_REG) | _GEN_348) | _GEN_341 : _GEN_348 | _GEN_341);
	reg wb_ldst_forward_valid_0_REG;
	reg wb_ldst_forward_valid_0_REG_1;
	wire wb_ldst_forward_valid_0 = ((((_logic_io_found_idx == _logic_1_io_found_idx) & _logic_io_found) & _logic_1_io_found) & wb_ldst_forward_valid_0_REG) & ~wb_ldst_forward_valid_0_REG_1;
	reg REG_11;
	reg [3:0] store_blocked_counter;
	assign block_load_wakeup = &store_blocked_counter | (REG_11 & ~wb_ldst_forward_valid_0);
	reg io_core_clr_unsafe_0_valid_REG;
	reg io_core_clr_unsafe_0_valid_REG_1;
	reg io_core_clr_unsafe_0_valid_REG_2;
	reg io_core_clr_unsafe_0_valid_REG_3;
	reg [4:0] io_core_clr_unsafe_0_bits_REG;
	reg r_xcpt_valid;
	reg [7:0] r_xcpt_uop_br_mask;
	reg [4:0] r_xcpt_uop_rob_idx;
	reg [4:0] r_xcpt_cause;
	reg [39:0] r_xcpt_badvaddr;
	reg wakeupArbs_0_io_in_1_valid_REG;
	wire _wakeupArbs_0_io_in_1_valid_T_4 = (fired_load_agen_exec_REG & wakeupArbs_0_io_in_1_valid_REG) & ~mem_incoming_uop_0_fp_val;
	reg io_core_iresp_0_REG_valid;
	reg [7:0] io_core_iresp_0_REG_bits_uop_br_mask;
	reg [4:0] io_core_iresp_0_REG_bits_uop_rob_idx;
	reg [5:0] io_core_iresp_0_REG_bits_uop_pdst;
	reg [63:0] io_core_iresp_0_REG_bits_data;
	reg w1_valid;
	reg [7:0] w1_bits_uop_br_mask;
	reg [3:0] w1_bits_uop_ldq_idx;
	reg [5:0] w1_bits_uop_pdst;
	reg [1:0] w1_bits_uop_dst_rtype;
	reg w2_valid;
	reg [3:0] w2_bits_uop_ldq_idx;
	reg [5:0] w2_bits_uop_pdst;
	reg [1:0] w2_bits_uop_dst_rtype;
	wire _GEN_366 = io_dmem_nack_0_valid & io_dmem_nack_0_bits_is_hella;
	wire _GEN_367 = hella_state == 3'h4;
	wire _GEN_368 = hella_state == 3'h6;
	wire _GEN_369 = io_dmem_nack_0_valid & ~io_dmem_nack_0_bits_is_hella;
	wire _GEN_370 = (_GEN_369 & io_dmem_nack_0_bits_uop_uses_ldq) & ~reset;
	wire _GEN_371 = _GEN_126[io_dmem_nack_0_bits_uop_ldq_idx[2:0]];
	wire _GEN_372 = stq_execute_head[3] == io_dmem_nack_0_bits_uop_stq_idx[3];
	wire _GEN_373 = stq_head[3] == io_dmem_nack_0_bits_uop_stq_idx[3];
	wire _GEN_374 = stq_head[3] == stq_execute_head[3];
	wire _GEN_375 = (((_GEN_372 & (stq_execute_head[2:0] > io_dmem_nack_0_bits_uop_stq_idx[2:0])) | (~_GEN_372 & (stq_execute_head[2:0] < io_dmem_nack_0_bits_uop_stq_idx[2:0]))) ^ ((_GEN_373 & (stq_head[2:0] > io_dmem_nack_0_bits_uop_stq_idx[2:0])) | (~_GEN_373 & (stq_head[2:0] < io_dmem_nack_0_bits_uop_stq_idx[2:0])))) ^ ((_GEN_374 & (stq_head[2:0] > stq_execute_head[2:0])) | (~_GEN_374 & (stq_head[2:0] < stq_execute_head[2:0])));
	wire _GEN_376 = io_dmem_nack_0_bits_is_hella | io_dmem_nack_0_bits_uop_uses_ldq;
	assign _GEN_1 = (io_dmem_nack_0_valid & ~_GEN_376) & _GEN_375;
	wire [2:0] resp_uop_ldq_idx = (io_dmem_resp_0_valid ? io_dmem_resp_0_bits_uop_ldq_idx[2:0] : io_dmem_ll_resp_bits_uop_ldq_idx[2:0]);
	wire [2:0] resp_uop_stq_idx = (io_dmem_resp_0_valid ? io_dmem_resp_0_bits_uop_stq_idx[2:0] : io_dmem_ll_resp_bits_uop_stq_idx[2:0]);
	wire resp_uop_uses_ldq = (io_dmem_resp_0_valid ? io_dmem_resp_0_bits_uop_uses_ldq : io_dmem_ll_resp_bits_uop_uses_ldq);
	wire resp_uop_uses_stq = (io_dmem_resp_0_valid ? io_dmem_resp_0_bits_uop_uses_stq : io_dmem_ll_resp_bits_uop_uses_stq);
	wire [63:0] resp_data = (io_dmem_resp_0_valid ? io_dmem_resp_0_bits_data : io_dmem_ll_resp_bits_data);
	wire io_dmem_ll_resp_ready_0 = ~io_dmem_resp_0_valid & ~w1_valid;
	wire _GEN_377 = io_dmem_ll_resp_ready_0 & io_dmem_ll_resp_valid;
	wire _GEN_378 = io_dmem_resp_0_valid | _GEN_377;
	wire _GEN_379 = _GEN_378 & resp_uop_uses_ldq;
	wire send_iresp = _GEN_110[resp_uop_ldq_idx * 2+:2] == 2'h0;
	wire send_fresp = _GEN_110[resp_uop_ldq_idx * 2+:2] == 2'h1;
	wire _ldq_will_succeed_T = iresp_0_valid | fresp_0_valid;
	wire dmem_resp_fired_0 = _GEN_378 & (resp_uop_uses_stq | resp_uop_uses_ldq);
	wire _GEN_380 = dmem_resp_fired_0 & wb_ldst_forward_valid_0;
	wire _GEN_381 = ~dmem_resp_fired_0 & wb_ldst_forward_valid_0;
	wire [63:0] _GEN_382 = _GEN_248[_logic_1_io_found_idx * 64+:64];
	wire [255:0] _GEN_383 = {_GEN_382, {2 {_GEN_382[31:0]}}, {2 {{2 {_GEN_382[15:0]}}}}, {2 {{2 {{2 {_GEN_382[7:0]}}}}}}};
	wire [63:0] _GEN_384 = _GEN_383[_GEN_210[_logic_1_io_found_idx * 2+:2] * 64+:64];
	wire _GEN_385 = _GEN_380 | ~_GEN_381;
	assign iresp_0_valid = (_GEN_385 ? _GEN_378 & (resp_uop_uses_stq | (resp_uop_uses_ldq & send_iresp)) : wb_ldst_forward_e_REG_uop_dst_rtype == 2'h0);
	wire [7:0] iresp_0_bits_uop_br_mask = (_GEN_385 ? (resp_uop_uses_stq ? _GEN_154[resp_uop_stq_idx * 8+:8] : _GEN_42[resp_uop_ldq_idx * 8+:8]) : wb_ldst_forward_e_REG_uop_br_mask);
	assign fresp_0_valid = (_GEN_385 ? _GEN_379 & send_fresp : wb_ldst_forward_e_REG_uop_dst_rtype == 2'h1);
	wire _ldq_debug_wb_data_T_1 = wb_ldst_forward_e_REG_uop_mem_size == 2'h2;
	wire _ldq_debug_wb_data_T_9 = wb_ldst_forward_e_REG_uop_mem_size == 2'h1;
	wire _ldq_debug_wb_data_T_17 = wb_ldst_forward_e_REG_uop_mem_size == 2'h0;
	wire [31:0] fresp_0_bits_data_zeroed = (wb_ldst_forward_ld_addr_0[2] ? _GEN_384[63:32] : _GEN_384[31:0]);
	wire [15:0] fresp_0_bits_data_zeroed_1 = (wb_ldst_forward_ld_addr_0[1] ? fresp_0_bits_data_zeroed[31:16] : fresp_0_bits_data_zeroed[15:0]);
	wire [7:0] fresp_0_bits_data_zeroed_2 = (wb_ldst_forward_ld_addr_0[0] ? fresp_0_bits_data_zeroed_1[15:8] : fresp_0_bits_data_zeroed_1[7:0]);
	wire _GEN_386 = _GEN_381 & _GEN_349;
	wire _GEN_387 = ~_GEN_380 & _GEN_386;
	assign ldq_will_succeed_0 = _GEN_387 | ((_GEN_378 & resp_uop_uses_ldq) & (resp_uop_ldq_idx == 3'h0) ? _ldq_will_succeed_T : ~_GEN_8 & ldq_succeeded_0);
	wire _GEN_388 = _GEN_381 & _GEN_350;
	wire _GEN_389 = ~_GEN_380 & _GEN_388;
	assign ldq_will_succeed_1 = _GEN_389 | ((_GEN_378 & resp_uop_uses_ldq) & (resp_uop_ldq_idx == 3'h1) ? _ldq_will_succeed_T : ~_GEN_9 & ldq_succeeded_1);
	wire _GEN_390 = _GEN_381 & _GEN_351;
	wire _GEN_391 = ~_GEN_380 & _GEN_390;
	assign ldq_will_succeed_2 = _GEN_391 | ((_GEN_378 & resp_uop_uses_ldq) & (resp_uop_ldq_idx == 3'h2) ? _ldq_will_succeed_T : ~_GEN_10 & ldq_succeeded_2);
	wire _GEN_392 = _GEN_381 & _GEN_352;
	wire _GEN_393 = ~_GEN_380 & _GEN_392;
	assign ldq_will_succeed_3 = _GEN_393 | ((_GEN_378 & resp_uop_uses_ldq) & (resp_uop_ldq_idx == 3'h3) ? _ldq_will_succeed_T : ~_GEN_11 & ldq_succeeded_3);
	wire _GEN_394 = _GEN_381 & _GEN_353;
	wire _GEN_395 = ~_GEN_380 & _GEN_394;
	assign ldq_will_succeed_4 = _GEN_395 | ((_GEN_378 & resp_uop_uses_ldq) & (resp_uop_ldq_idx == 3'h4) ? _ldq_will_succeed_T : ~_GEN_12 & ldq_succeeded_4);
	wire _GEN_396 = _GEN_381 & _GEN_354;
	wire _GEN_397 = ~_GEN_380 & _GEN_396;
	assign ldq_will_succeed_5 = _GEN_397 | ((_GEN_378 & resp_uop_uses_ldq) & (resp_uop_ldq_idx == 3'h5) ? _ldq_will_succeed_T : ~_GEN_13 & ldq_succeeded_5);
	wire _GEN_398 = _GEN_381 & _GEN_355;
	wire _GEN_399 = ~_GEN_380 & _GEN_398;
	assign ldq_will_succeed_6 = _GEN_399 | ((_GEN_378 & resp_uop_uses_ldq) & (resp_uop_ldq_idx == 3'h6) ? _ldq_will_succeed_T : ~_GEN_14 & ldq_succeeded_6);
	wire _GEN_400 = _GEN_381 & (&wb_ldst_forward_ldq_idx_0[2:0]);
	wire _GEN_401 = ~_GEN_380 & _GEN_400;
	assign ldq_will_succeed_7 = _GEN_401 | ((_GEN_378 & resp_uop_uses_ldq) & (&resp_uop_ldq_idx) ? _ldq_will_succeed_T : ~_GEN_15 & ldq_succeeded_7);
	reg [3:0] slow_wakeups_0_REG_bits_uop_ldq_idx;
	reg [5:0] slow_wakeups_0_REG_bits_uop_pdst;
	reg [1:0] slow_wakeups_0_REG_bits_uop_dst_rtype;
	wire [7:0] _GEN_402 = io_core_brupdate_b1_mispredict_mask & stq_uop_0_br_mask;
	wire [7:0] _GEN_403 = io_core_brupdate_b1_mispredict_mask & stq_uop_1_br_mask;
	wire [7:0] _GEN_404 = io_core_brupdate_b1_mispredict_mask & stq_uop_2_br_mask;
	wire [7:0] _GEN_405 = io_core_brupdate_b1_mispredict_mask & stq_uop_3_br_mask;
	wire [7:0] _GEN_406 = io_core_brupdate_b1_mispredict_mask & stq_uop_4_br_mask;
	wire [7:0] _GEN_407 = io_core_brupdate_b1_mispredict_mask & stq_uop_5_br_mask;
	wire [7:0] _GEN_408 = io_core_brupdate_b1_mispredict_mask & stq_uop_6_br_mask;
	wire [7:0] _GEN_409 = io_core_brupdate_b1_mispredict_mask & stq_uop_7_br_mask;
	wire commit_store = io_core_commit_valids_0 & io_core_commit_uops_0_uses_stq;
	wire commit_load = io_core_commit_valids_0 & io_core_commit_uops_0_uses_ldq;
	wire _GEN_410 = (~commit_store & commit_load) & ~reset;
	wire _GEN_411 = _GEN_5[ldq_head[2:0]];
	wire _GEN_429 = _GEN_6[stq_head[2:0]] & _GEN_249[stq_head[2:0]];
	wire _GEN_430 = _GEN_158[stq_head[2:0]];
	wire _GEN_431 = _GEN_430 & ~io_dmem_ordered;
	wire io_hellacache_req_ready_0 = hella_state == 3'h0;
	assign _GEN_0 = ~io_hellacache_req_ready_0;
	wire _GEN_432 = hella_state == 3'h3;
	wire _GEN_433 = hella_state == 3'h2;
	wire _GEN_434 = _GEN_377 & io_dmem_ll_resp_bits_is_hella;
	wire _GEN_435 = io_dmem_resp_0_valid & io_dmem_resp_0_bits_is_hella;
	wire _GEN_436 = _GEN_435 | (io_dmem_store_ack_0_valid & io_dmem_store_ack_0_bits_is_hella);
	wire _GEN_437 = ((io_hellacache_req_ready_0 | _GEN_3) | _GEN_432) | _GEN_433;
	assign _GEN = ~((((io_hellacache_req_ready_0 | _GEN_3) | _GEN_432) | _GEN_433) | _GEN_367);
	always @(posedge clock) begin : sv2v_autoblock_1
		reg _GEN_438;
		reg _GEN_439;
		reg _GEN_440;
		reg _GEN_441;
		reg _GEN_442;
		reg _GEN_443;
		reg _GEN_444;
		reg _GEN_445;
		reg _GEN_446;
		reg _GEN_447;
		reg _GEN_448;
		reg _GEN_449;
		reg _GEN_450;
		reg _GEN_451;
		reg _ldq_valid_T_2;
		reg _GEN_452;
		reg _GEN_453;
		reg _GEN_454;
		reg _GEN_455;
		reg _GEN_456;
		reg _GEN_457;
		reg _GEN_458;
		reg _GEN_459;
		reg [7:0] ldq_uop_out_br_mask;
		reg _GEN_460;
		reg _GEN_461;
		reg _GEN_462;
		reg _GEN_463;
		reg _GEN_464;
		reg _GEN_465;
		reg _GEN_466;
		reg _GEN_467;
		reg _GEN_468;
		reg _stq_valid_T_2;
		reg _GEN_469;
		reg _GEN_470;
		reg _GEN_471;
		reg _GEN_472;
		reg _GEN_473;
		reg _GEN_474;
		reg _GEN_475;
		reg _GEN_476;
		reg _GEN_477;
		reg _GEN_478;
		reg _GEN_479;
		reg _GEN_480;
		reg _GEN_481;
		reg _GEN_482;
		reg _GEN_483;
		reg _GEN_484;
		reg [7:0] stq_uop_out_br_mask;
		reg _GEN_485;
		reg _GEN_486;
		reg _GEN_487;
		reg _GEN_488;
		reg _GEN_489;
		reg _GEN_490;
		reg _GEN_491;
		reg _GEN_492;
		reg [3:0] _stq_tail_plus_T;
		reg _ldq_wakeup_idx_T_7;
		reg _ldq_wakeup_idx_T_15;
		reg _ldq_wakeup_idx_T_23;
		reg _ldq_wakeup_idx_T_31;
		reg _ldq_wakeup_idx_T_39;
		reg _ldq_wakeup_idx_T_47;
		reg _ldq_wakeup_idx_T_55;
		reg [2:0] ldq_wakeup_idx_base_idx;
		reg _ldq_enq_retry_idx_T_3;
		reg _ldq_enq_retry_idx_T_7;
		reg _ldq_enq_retry_idx_T_11;
		reg _ldq_enq_retry_idx_T_15;
		reg _ldq_enq_retry_idx_T_19;
		reg _ldq_enq_retry_idx_T_23;
		reg _ldq_enq_retry_idx_T_27;
		reg [2:0] ldq_enq_retry_idx_base_idx;
		reg _stq_enq_retry_idx_T_3;
		reg _stq_enq_retry_idx_T_7;
		reg _stq_enq_retry_idx_T_11;
		reg _stq_enq_retry_idx_T_15;
		reg _stq_enq_retry_idx_T_19;
		reg _stq_enq_retry_idx_T_23;
		reg _stq_enq_retry_idx_T_27;
		reg [2:0] stq_enq_retry_idx_base_idx;
		reg _GEN_493;
		reg _GEN_494;
		reg _GEN_495;
		reg ma_st_0;
		reg pf_st_0;
		reg ae_st_0;
		reg exe_agen_killed_0;
		reg _s0_executing_loads_T_1;
		reg _s0_executing_loads_T_3;
		reg _GEN_496;
		reg _ldq_addr_valid_T_1;
		reg _GEN_497;
		reg _GEN_498;
		reg _GEN_499;
		reg _GEN_500;
		reg _GEN_501;
		reg _GEN_502;
		reg _GEN_503;
		reg _GEN_504;
		reg [39:0] _ldq_addr_bits_T;
		reg [14:0] _ldq_ld_byte_mask_mask_T_2;
		reg [14:0] _ldq_ld_byte_mask_mask_T_6;
		reg [31:0] _GEN_505;
		reg [7:0] _ldq_ld_byte_mask_mask_T_14;
		reg _ldq_addr_is_uncacheable_T_1;
		reg _stq_addr_valid_T_3;
		reg _GEN_506;
		reg _GEN_507;
		reg _GEN_508;
		reg _GEN_509;
		reg _GEN_510;
		reg _GEN_511;
		reg _GEN_512;
		reg _GEN_513;
		reg [39:0] _stq_addr_bits_T;
		reg _GEN_514;
		reg _GEN_515;
		reg _GEN_516;
		reg _GEN_517;
		reg _GEN_518;
		reg _GEN_519;
		reg _GEN_520;
		reg _GEN_521;
		reg _GEN_522;
		reg _GEN_523;
		reg _GEN_524;
		reg _GEN_525;
		reg _GEN_526;
		reg _GEN_527;
		reg _GEN_528;
		reg _GEN_529;
		reg _GEN_530;
		reg _GEN_531;
		reg _GEN_532;
		reg _GEN_533;
		reg _GEN_534;
		reg _GEN_535;
		reg _GEN_536;
		reg [7:0] _fired_store_retry_T;
		reg _stq_clr_head_idx_T_1;
		reg _stq_clr_head_idx_T_3;
		reg _stq_clr_head_idx_T_5;
		reg _stq_clr_head_idx_T_7;
		reg _stq_clr_head_idx_T_9;
		reg _stq_clr_head_idx_T_11;
		reg _stq_clr_head_idx_T_13;
		reg [2:0] stq_clr_head_idx_base_idx;
		reg [7:0] s_uop_br_mask;
		reg _GEN_537;
		reg _GEN_538;
		reg _GEN_539;
		reg _GEN_540;
		reg _GEN_541;
		reg _GEN_542;
		reg _GEN_543;
		reg _GEN_544;
		reg _GEN_545;
		reg _GEN_546;
		reg _GEN_547;
		reg _GEN_548;
		reg _GEN_549;
		reg _GEN_550;
		reg _GEN_551;
		reg _GEN_552;
		reg _GEN_553;
		reg _GEN_554;
		reg _GEN_555;
		reg _GEN_556;
		reg _GEN_557;
		reg _GEN_558;
		reg _GEN_559;
		reg _GEN_560;
		reg _GEN_561;
		reg _GEN_562;
		reg _GEN_563;
		reg _GEN_564;
		reg _GEN_565;
		reg _GEN_566;
		reg _GEN_567;
		reg _GEN_568;
		reg _GEN_569;
		reg _GEN_570;
		reg forward_dword_addr_matches;
		reg [14:0] _forward_mask_mask_T_2;
		reg [14:0] _forward_mask_mask_T_6;
		reg [31:0] _GEN_571;
		reg [7:0] _forward_mask_overlap_T;
		reg _GEN_572;
		reg _GEN_573;
		reg _GEN_574;
		reg _GEN_575;
		reg _GEN_576;
		reg [3:0] wb_ldst_forward_stq_idx_0;
		reg [7:0] _ld_xcpt_valid_T_2;
		reg _l_idx_T;
		reg _l_idx_T_1;
		reg _l_idx_T_2;
		reg _l_idx_T_3;
		reg _l_idx_T_4;
		reg _l_idx_T_5;
		reg _l_idx_T_6;
		reg [2:0] l_idx_base_idx;
		reg use_mem_xcpt;
		reg [7:0] xcpt_uop_br_mask;
		reg [5:0] iresp_0_bits_uop_pdst;
		reg [31:0] iresp_0_bits_data_zeroed;
		reg [15:0] iresp_0_bits_data_zeroed_1;
		reg [7:0] iresp_0_bits_data_zeroed_2;
		reg _GEN_577;
		reg _GEN_578;
		reg _GEN_579;
		reg _GEN_580;
		reg _GEN_581;
		reg _GEN_582;
		reg _GEN_583;
		reg _GEN_584;
		reg _GEN_585;
		reg _GEN_586;
		reg _GEN_587;
		reg _GEN_588;
		reg _GEN_589;
		reg _GEN_590;
		reg _GEN_591;
		reg _GEN_592;
		reg _GEN_593;
		reg _GEN_594;
		reg _GEN_595;
		reg _GEN_596;
		reg _GEN_597;
		reg _GEN_598;
		reg _GEN_599;
		reg _GEN_600;
		reg _GEN_601;
		reg store_needs_order;
		reg clear_store;
		reg _GEN_602;
		reg _GEN_603;
		reg _GEN_604;
		reg [7:0] _GEN_605;
		_GEN_493 = _retry_queue_io_enq_ready & _retry_queue_io_enq_valid_T;
		_GEN_494 = can_enq_store_retry & _GEN_493;
		_GEN_495 = _GEN_494 | ~(can_enq_load_retry & _GEN_493);
		ma_st_0 = (_dtlb_io_resp_0_ma_st & exe_tlb_uop_0_uses_stq) & ~exe_tlb_uop_0_is_fence;
		pf_st_0 = _dtlb_io_resp_0_pf_st & exe_tlb_uop_0_uses_stq;
		ae_st_0 = _dtlb_io_resp_0_ae_st & exe_tlb_uop_0_uses_stq;
		exe_agen_killed_0 = |(io_core_brupdate_b1_mispredict_mask & io_core_agen_0_bits_uop_br_mask) | io_core_exception;
		_s0_executing_loads_T_1 = dmem_req_fire_0 & ~s0_kills_0;
		_s0_executing_loads_T_3 = dmem_req_fire_0 & ~s0_kills_0;
		_GEN_496 = _GEN_284 | ~_GEN_282;
		_ldq_addr_valid_T_1 = ~exe_agen_killed_0 | will_fire_load_retry_0_will_fire;
		_GEN_497 = _GEN_286 & (ldq_idx == 3'h0);
		_GEN_498 = _GEN_286 & (ldq_idx == 3'h1);
		_GEN_499 = _GEN_286 & (ldq_idx == 3'h2);
		_GEN_500 = _GEN_286 & (ldq_idx == 3'h3);
		_GEN_501 = _GEN_286 & (ldq_idx == 3'h4);
		_GEN_502 = _GEN_286 & (ldq_idx == 3'h5);
		_GEN_503 = _GEN_286 & (ldq_idx == 3'h6);
		_GEN_504 = _GEN_286 & (&ldq_idx);
		_ldq_ld_byte_mask_mask_T_2 = 15'h0001 << exe_tlb_vaddr_0[2:0];
		_ldq_ld_byte_mask_mask_T_6 = 15'h0003 << {12'h000, exe_tlb_vaddr_0[2:1], 1'h0};
		_GEN_505 = {8'hff, (exe_tlb_vaddr_0[2] ? 8'hf0 : 8'h0f), _ldq_ld_byte_mask_mask_T_6[7:0], _ldq_ld_byte_mask_mask_T_2[7:0]};
		_stq_addr_valid_T_3 = (~exe_agen_killed_0 | will_fire_store_retry_0_will_fire) & ~pf_st_0;
		_GEN_506 = _GEN_287 & (stq_idx == 3'h0);
		_GEN_507 = _GEN_287 & (stq_idx == 3'h1);
		_GEN_508 = _GEN_287 & (stq_idx == 3'h2);
		_GEN_509 = _GEN_287 & (stq_idx == 3'h3);
		_GEN_510 = _GEN_287 & (stq_idx == 3'h4);
		_GEN_511 = _GEN_287 & (stq_idx == 3'h5);
		_GEN_512 = _GEN_287 & (stq_idx == 3'h6);
		_GEN_513 = _GEN_287 & (&stq_idx);
		_GEN_529 = io_core_dgen_2_valid & (io_core_dgen_2_bits_uop_stq_idx[2:0] == 3'h0);
		_GEN_530 = io_core_dgen_2_valid & (io_core_dgen_2_bits_uop_stq_idx[2:0] == 3'h1);
		_GEN_531 = io_core_dgen_2_valid & (io_core_dgen_2_bits_uop_stq_idx[2:0] == 3'h2);
		_GEN_532 = io_core_dgen_2_valid & (io_core_dgen_2_bits_uop_stq_idx[2:0] == 3'h3);
		_GEN_533 = io_core_dgen_2_valid & (io_core_dgen_2_bits_uop_stq_idx[2:0] == 3'h4);
		_GEN_534 = io_core_dgen_2_valid & (io_core_dgen_2_bits_uop_stq_idx[2:0] == 3'h5);
		_GEN_535 = io_core_dgen_2_valid & (io_core_dgen_2_bits_uop_stq_idx[2:0] == 3'h6);
		_GEN_536 = io_core_dgen_2_valid & (&io_core_dgen_2_bits_uop_stq_idx[2:0]);
		_fired_store_retry_T = io_core_brupdate_b1_mispredict_mask & _retry_queue_io_deq_bits_uop_br_mask;
		_GEN_541 = dmem_req_fire_0 & ~s0_kills_0;
		_GEN_562 = (((((((((_GEN_339 & ~lcam_younger_load_mask_0_7) & ~(&lcam_ldq_idx_0[2:0])) & ~_GEN_340) | ((_GEN_333 & ~_GEN_335) & ~_GEN_334)) | ((_GEN_327 & ~_GEN_329) & ~_GEN_328)) | ((_GEN_321 & ~_GEN_323) & ~_GEN_322)) | ((_GEN_315 & ~_GEN_317) & ~_GEN_316)) | ((_GEN_309 & ~_GEN_311) & ~_GEN_310)) | ((_GEN_303 & ~_GEN_305) & ~_GEN_304)) | (((_GEN_292 & ~lcam_younger_load_mask_0_0) & |lcam_ldq_idx_0[2:0]) & ~_GEN_293);
		_GEN_563 = _GEN_347 & ~(|lcam_ldq_idx_0[2:0]);
		_GEN_564 = _GEN_347 & _GEN_294;
		_GEN_565 = _GEN_347 & _GEN_295;
		_GEN_566 = _GEN_347 & _GEN_296;
		_GEN_567 = _GEN_347 & _GEN_297;
		_GEN_568 = _GEN_347 & _GEN_298;
		_GEN_569 = _GEN_347 & _GEN_299;
		_GEN_570 = _GEN_347 & (&lcam_ldq_idx_0[2:0]);
		_GEN_601 = commit_store | ~commit_load;
		store_needs_order = _GEN_429 & _GEN_431;
		_GEN_603 = io_hellacache_req_ready_0 | ~_GEN_3;
		_GEN_604 = reset | io_core_exception;
		_GEN_438 = ldq_tail[2:0] == 3'h0;
		_GEN_439 = ldq_tail[2:0] == 3'h1;
		_GEN_440 = ldq_tail[2:0] == 3'h2;
		_GEN_441 = ldq_tail[2:0] == 3'h3;
		_GEN_442 = ldq_tail[2:0] == 3'h4;
		_GEN_443 = ldq_tail[2:0] == 3'h5;
		_GEN_444 = ldq_tail[2:0] == 3'h6;
		_GEN_445 = stq_tail[2:0] == 3'h0;
		_GEN_446 = stq_tail[2:0] == 3'h1;
		_GEN_447 = stq_tail[2:0] == 3'h2;
		_GEN_448 = stq_tail[2:0] == 3'h3;
		_GEN_449 = stq_tail[2:0] == 3'h4;
		_GEN_450 = stq_tail[2:0] == 3'h5;
		_GEN_451 = stq_tail[2:0] == 3'h6;
		_ldq_valid_T_2 = |(io_core_brupdate_b1_mispredict_mask & dis_uops_0_bits_br_mask) | io_core_exception;
		_GEN_452 = (_GEN_8 ? ~_ldq_valid_T_2 : ldq_valid_0);
		_GEN_453 = (_GEN_9 ? ~_ldq_valid_T_2 : ldq_valid_1);
		_GEN_454 = (_GEN_10 ? ~_ldq_valid_T_2 : ldq_valid_2);
		_GEN_455 = (_GEN_11 ? ~_ldq_valid_T_2 : ldq_valid_3);
		_GEN_456 = (_GEN_12 ? ~_ldq_valid_T_2 : ldq_valid_4);
		_GEN_457 = (_GEN_13 ? ~_ldq_valid_T_2 : ldq_valid_5);
		_GEN_458 = (_GEN_14 ? ~_ldq_valid_T_2 : ldq_valid_6);
		_GEN_459 = (_GEN_15 ? ~_ldq_valid_T_2 : ldq_valid_7);
		ldq_uop_out_br_mask = dis_uops_0_bits_br_mask & ~io_core_brupdate_b1_resolve_mask;
		_GEN_460 = ~_GEN_8 & ldq_order_fail_0;
		_GEN_461 = ~_GEN_9 & ldq_order_fail_1;
		_GEN_462 = ~_GEN_10 & ldq_order_fail_2;
		_GEN_463 = ~_GEN_11 & ldq_order_fail_3;
		_GEN_464 = ~_GEN_12 & ldq_order_fail_4;
		_GEN_465 = ~_GEN_13 & ldq_order_fail_5;
		_GEN_466 = ~_GEN_14 & ldq_order_fail_6;
		_GEN_467 = ~_GEN_15 & ldq_order_fail_7;
		_GEN_468 = dis_uops_0_valid & dis_uops_0_bits_uses_stq;
		_stq_valid_T_2 = |(io_core_brupdate_b1_mispredict_mask & dis_uops_0_bits_br_mask) | io_core_exception;
		_GEN_469 = _GEN_468 & (dis_uops_0_bits_stq_idx[2:0] == 3'h0);
		_GEN_470 = (_GEN_469 ? ~_stq_valid_T_2 : stq_valid_0);
		_GEN_471 = _GEN_468 & (dis_uops_0_bits_stq_idx[2:0] == 3'h1);
		_GEN_472 = (_GEN_471 ? ~_stq_valid_T_2 : stq_valid_1);
		_GEN_473 = _GEN_468 & (dis_uops_0_bits_stq_idx[2:0] == 3'h2);
		_GEN_474 = (_GEN_473 ? ~_stq_valid_T_2 : stq_valid_2);
		_GEN_475 = _GEN_468 & (dis_uops_0_bits_stq_idx[2:0] == 3'h3);
		_GEN_476 = (_GEN_475 ? ~_stq_valid_T_2 : stq_valid_3);
		_GEN_477 = _GEN_468 & (dis_uops_0_bits_stq_idx[2:0] == 3'h4);
		_GEN_478 = (_GEN_477 ? ~_stq_valid_T_2 : stq_valid_4);
		_GEN_479 = _GEN_468 & (dis_uops_0_bits_stq_idx[2:0] == 3'h5);
		_GEN_480 = (_GEN_479 ? ~_stq_valid_T_2 : stq_valid_5);
		_GEN_481 = _GEN_468 & (dis_uops_0_bits_stq_idx[2:0] == 3'h6);
		_GEN_482 = (_GEN_481 ? ~_stq_valid_T_2 : stq_valid_6);
		_GEN_483 = _GEN_468 & (&dis_uops_0_bits_stq_idx[2:0]);
		_GEN_484 = (_GEN_483 ? ~_stq_valid_T_2 : stq_valid_7);
		stq_uop_out_br_mask = dis_uops_0_bits_br_mask & ~io_core_brupdate_b1_resolve_mask;
		_GEN_485 = ~_GEN_469 & stq_data_0_valid;
		_GEN_486 = ~_GEN_471 & stq_data_1_valid;
		_GEN_487 = ~_GEN_473 & stq_data_2_valid;
		_GEN_488 = ~_GEN_475 & stq_data_3_valid;
		_GEN_489 = ~_GEN_477 & stq_data_4_valid;
		_GEN_490 = ~_GEN_479 & stq_data_5_valid;
		_GEN_491 = ~_GEN_481 & stq_data_6_valid;
		_GEN_492 = ~_GEN_483 & stq_data_7_valid;
		_stq_tail_plus_T = stq_tail + 4'h2;
		_ldq_wakeup_idx_T_7 = (((ldq_addr_0_valid & ~ldq_executed_0) & ~ldq_succeeded_0) & ~ldq_addr_is_virtual_0) & ~((will_fire_load_wakeup_0_will_fire ? _GEN_258 : _GEN_267) | p1_block_load_mask_0);
		_ldq_wakeup_idx_T_15 = (((ldq_addr_1_valid & ~ldq_executed_1) & ~ldq_succeeded_1) & ~ldq_addr_is_virtual_1) & ~((will_fire_load_wakeup_0_will_fire ? _GEN_259 : _GEN_269) | p1_block_load_mask_1);
		_ldq_wakeup_idx_T_23 = (((ldq_addr_2_valid & ~ldq_executed_2) & ~ldq_succeeded_2) & ~ldq_addr_is_virtual_2) & ~((will_fire_load_wakeup_0_will_fire ? _GEN_260 : _GEN_271) | p1_block_load_mask_2);
		_ldq_wakeup_idx_T_31 = (((ldq_addr_3_valid & ~ldq_executed_3) & ~ldq_succeeded_3) & ~ldq_addr_is_virtual_3) & ~((will_fire_load_wakeup_0_will_fire ? _GEN_261 : _GEN_273) | p1_block_load_mask_3);
		_ldq_wakeup_idx_T_39 = (((ldq_addr_4_valid & ~ldq_executed_4) & ~ldq_succeeded_4) & ~ldq_addr_is_virtual_4) & ~((will_fire_load_wakeup_0_will_fire ? _GEN_262 : _GEN_275) | p1_block_load_mask_4);
		_ldq_wakeup_idx_T_47 = (((ldq_addr_5_valid & ~ldq_executed_5) & ~ldq_succeeded_5) & ~ldq_addr_is_virtual_5) & ~((will_fire_load_wakeup_0_will_fire ? _GEN_263 : _GEN_277) | p1_block_load_mask_5);
		_ldq_wakeup_idx_T_55 = (((ldq_addr_6_valid & ~ldq_executed_6) & ~ldq_succeeded_6) & ~ldq_addr_is_virtual_6) & ~((will_fire_load_wakeup_0_will_fire ? _GEN_264 : _GEN_279) | p1_block_load_mask_6);
		ldq_wakeup_idx_base_idx = (_ldq_wakeup_idx_T_7 & (ldq_head[2:0] == 3'h0) ? 3'h0 : (_ldq_wakeup_idx_T_15 & (ldq_head[2:0] < 3'h2) ? 3'h1 : (_ldq_wakeup_idx_T_23 & (ldq_head[2:0] < 3'h3) ? 3'h2 : (_ldq_wakeup_idx_T_31 & ~ldq_head[2] ? 3'h3 : (_ldq_wakeup_idx_T_39 & (ldq_head[2:0] < 3'h5) ? 3'h4 : (_ldq_wakeup_idx_T_47 & (ldq_head[2:1] != 2'h3) ? 3'h5 : (_ldq_wakeup_idx_T_55 & (ldq_head[2:0] != 3'h7) ? 3'h6 : ((((ldq_addr_7_valid & ~ldq_executed_7) & ~ldq_succeeded_7) & ~ldq_addr_is_virtual_7) & ~((will_fire_load_wakeup_0_will_fire ? &ldq_wakeup_idx[2:0] : _GEN_280) | p1_block_load_mask_7) ? 3'h7 : (_ldq_wakeup_idx_T_7 ? 3'h0 : (_ldq_wakeup_idx_T_15 ? 3'h1 : (_ldq_wakeup_idx_T_23 ? 3'h2 : (_ldq_wakeup_idx_T_31 ? 3'h3 : (_ldq_wakeup_idx_T_39 ? 3'h4 : (_ldq_wakeup_idx_T_47 ? 3'h5 : {2'h3, ~_ldq_wakeup_idx_T_55}))))))))))))));
		_ldq_enq_retry_idx_T_3 = (ldq_addr_0_valid & ldq_addr_is_virtual_0) & |ldq_enq_retry_idx[2:0];
		_ldq_enq_retry_idx_T_7 = (ldq_addr_1_valid & ldq_addr_is_virtual_1) & (ldq_enq_retry_idx[2:0] != 3'h1);
		_ldq_enq_retry_idx_T_11 = (ldq_addr_2_valid & ldq_addr_is_virtual_2) & (ldq_enq_retry_idx[2:0] != 3'h2);
		_ldq_enq_retry_idx_T_15 = (ldq_addr_3_valid & ldq_addr_is_virtual_3) & (ldq_enq_retry_idx[2:0] != 3'h3);
		_ldq_enq_retry_idx_T_19 = (ldq_addr_4_valid & ldq_addr_is_virtual_4) & (ldq_enq_retry_idx[2:0] != 3'h4);
		_ldq_enq_retry_idx_T_23 = (ldq_addr_5_valid & ldq_addr_is_virtual_5) & (ldq_enq_retry_idx[2:0] != 3'h5);
		_ldq_enq_retry_idx_T_27 = (ldq_addr_6_valid & ldq_addr_is_virtual_6) & (ldq_enq_retry_idx[2:0] != 3'h6);
		ldq_enq_retry_idx_base_idx = (_ldq_enq_retry_idx_T_3 & (ldq_head[2:0] == 3'h0) ? 3'h0 : (_ldq_enq_retry_idx_T_7 & (ldq_head[2:0] < 3'h2) ? 3'h1 : (_ldq_enq_retry_idx_T_11 & (ldq_head[2:0] < 3'h3) ? 3'h2 : (_ldq_enq_retry_idx_T_15 & ~ldq_head[2] ? 3'h3 : (_ldq_enq_retry_idx_T_19 & (ldq_head[2:0] < 3'h5) ? 3'h4 : (_ldq_enq_retry_idx_T_23 & (ldq_head[2:1] != 2'h3) ? 3'h5 : (_ldq_enq_retry_idx_T_27 & (ldq_head[2:0] != 3'h7) ? 3'h6 : ((ldq_addr_7_valid & ldq_addr_is_virtual_7) & ~(&ldq_enq_retry_idx[2:0]) ? 3'h7 : (_ldq_enq_retry_idx_T_3 ? 3'h0 : (_ldq_enq_retry_idx_T_7 ? 3'h1 : (_ldq_enq_retry_idx_T_11 ? 3'h2 : (_ldq_enq_retry_idx_T_15 ? 3'h3 : (_ldq_enq_retry_idx_T_19 ? 3'h4 : (_ldq_enq_retry_idx_T_23 ? 3'h5 : {2'h3, ~_ldq_enq_retry_idx_T_27}))))))))))))));
		_stq_enq_retry_idx_T_3 = (stq_addr_0_valid & stq_addr_is_virtual_0) & |stq_enq_retry_idx[2:0];
		_stq_enq_retry_idx_T_7 = (stq_addr_1_valid & stq_addr_is_virtual_1) & (stq_enq_retry_idx[2:0] != 3'h1);
		_stq_enq_retry_idx_T_11 = (stq_addr_2_valid & stq_addr_is_virtual_2) & (stq_enq_retry_idx[2:0] != 3'h2);
		_stq_enq_retry_idx_T_15 = (stq_addr_3_valid & stq_addr_is_virtual_3) & (stq_enq_retry_idx[2:0] != 3'h3);
		_stq_enq_retry_idx_T_19 = (stq_addr_4_valid & stq_addr_is_virtual_4) & (stq_enq_retry_idx[2:0] != 3'h4);
		_stq_enq_retry_idx_T_23 = (stq_addr_5_valid & stq_addr_is_virtual_5) & (stq_enq_retry_idx[2:0] != 3'h5);
		_stq_enq_retry_idx_T_27 = (stq_addr_6_valid & stq_addr_is_virtual_6) & (stq_enq_retry_idx[2:0] != 3'h6);
		stq_enq_retry_idx_base_idx = (_stq_enq_retry_idx_T_3 & (stq_commit_head[2:0] == 3'h0) ? 3'h0 : (_stq_enq_retry_idx_T_7 & (stq_commit_head[2:0] < 3'h2) ? 3'h1 : (_stq_enq_retry_idx_T_11 & (stq_commit_head[2:0] < 3'h3) ? 3'h2 : (_stq_enq_retry_idx_T_15 & ~stq_commit_head[2] ? 3'h3 : (_stq_enq_retry_idx_T_19 & (stq_commit_head[2:0] < 3'h5) ? 3'h4 : (_stq_enq_retry_idx_T_23 & (stq_commit_head[2:1] != 2'h3) ? 3'h5 : (_stq_enq_retry_idx_T_27 & (stq_commit_head[2:0] != 3'h7) ? 3'h6 : ((stq_addr_7_valid & stq_addr_is_virtual_7) & ~(&stq_enq_retry_idx[2:0]) ? 3'h7 : (_stq_enq_retry_idx_T_3 ? 3'h0 : (_stq_enq_retry_idx_T_7 ? 3'h1 : (_stq_enq_retry_idx_T_11 ? 3'h2 : (_stq_enq_retry_idx_T_15 ? 3'h3 : (_stq_enq_retry_idx_T_19 ? 3'h4 : (_stq_enq_retry_idx_T_23 ? 3'h5 : {2'h3, ~_stq_enq_retry_idx_T_27}))))))))))))));
		_ldq_addr_bits_T = (exe_tlb_miss_0 ? exe_tlb_vaddr_0[39:0] : _GEN_281);
		_ldq_ld_byte_mask_mask_T_14 = _GEN_505[exe_tlb_uop_0_mem_size * 8+:8];
		_ldq_addr_is_uncacheable_T_1 = ~_dtlb_io_resp_0_cacheable & ~exe_tlb_miss_0;
		_stq_addr_bits_T = (exe_tlb_miss_0 ? exe_tlb_vaddr_0[39:0] : _GEN_281);
		_GEN_514 = io_core_dgen_0_valid & (io_core_dgen_0_bits_uop_stq_idx[2:0] == 3'h0);
		_GEN_515 = io_core_dgen_0_valid & (io_core_dgen_0_bits_uop_stq_idx[2:0] == 3'h1);
		_GEN_516 = io_core_dgen_0_valid & (io_core_dgen_0_bits_uop_stq_idx[2:0] == 3'h2);
		_GEN_517 = io_core_dgen_0_valid & (io_core_dgen_0_bits_uop_stq_idx[2:0] == 3'h3);
		_GEN_518 = io_core_dgen_0_valid & (io_core_dgen_0_bits_uop_stq_idx[2:0] == 3'h4);
		_GEN_519 = io_core_dgen_0_valid & (io_core_dgen_0_bits_uop_stq_idx[2:0] == 3'h5);
		_GEN_520 = io_core_dgen_0_valid & (io_core_dgen_0_bits_uop_stq_idx[2:0] == 3'h6);
		_GEN_521 = io_core_dgen_0_valid & (&io_core_dgen_0_bits_uop_stq_idx[2:0]);
		_GEN_522 = io_core_dgen_1_bits_uop_stq_idx[2:0] == 3'h0;
		_GEN_523 = io_core_dgen_1_bits_uop_stq_idx[2:0] == 3'h1;
		_GEN_524 = io_core_dgen_1_bits_uop_stq_idx[2:0] == 3'h2;
		_GEN_525 = io_core_dgen_1_bits_uop_stq_idx[2:0] == 3'h3;
		_GEN_526 = io_core_dgen_1_bits_uop_stq_idx[2:0] == 3'h4;
		_GEN_527 = io_core_dgen_1_bits_uop_stq_idx[2:0] == 3'h5;
		_GEN_528 = io_core_dgen_1_bits_uop_stq_idx[2:0] == 3'h6;
		_stq_clr_head_idx_T_1 = stq_valid_0 & ~stq_cleared_0;
		_stq_clr_head_idx_T_3 = stq_valid_1 & ~stq_cleared_1;
		_stq_clr_head_idx_T_5 = stq_valid_2 & ~stq_cleared_2;
		_stq_clr_head_idx_T_7 = stq_valid_3 & ~stq_cleared_3;
		_stq_clr_head_idx_T_9 = stq_valid_4 & ~stq_cleared_4;
		_stq_clr_head_idx_T_11 = stq_valid_5 & ~stq_cleared_5;
		_stq_clr_head_idx_T_13 = stq_valid_6 & ~stq_cleared_6;
		stq_clr_head_idx_base_idx = (_stq_clr_head_idx_T_1 & (stq_commit_head[2:0] == 3'h0) ? 3'h0 : (_stq_clr_head_idx_T_3 & (stq_commit_head[2:0] < 3'h2) ? 3'h1 : (_stq_clr_head_idx_T_5 & (stq_commit_head[2:0] < 3'h3) ? 3'h2 : (_stq_clr_head_idx_T_7 & ~stq_commit_head[2] ? 3'h3 : (_stq_clr_head_idx_T_9 & (stq_commit_head[2:0] < 3'h5) ? 3'h4 : (_stq_clr_head_idx_T_11 & (stq_commit_head[2:1] != 2'h3) ? 3'h5 : (_stq_clr_head_idx_T_13 & (stq_commit_head[2:0] != 3'h7) ? 3'h6 : (stq_valid_7 & ~stq_cleared_7 ? 3'h7 : (_stq_clr_head_idx_T_1 ? 3'h0 : (_stq_clr_head_idx_T_3 ? 3'h1 : (_stq_clr_head_idx_T_5 ? 3'h2 : (_stq_clr_head_idx_T_7 ? 3'h3 : (_stq_clr_head_idx_T_9 ? 3'h4 : (_stq_clr_head_idx_T_11 ? 3'h5 : {2'h3, ~_stq_clr_head_idx_T_13}))))))))))))));
		s_uop_br_mask = _GEN_154[stq_clr_head_idx[2:0] * 8+:8];
		_GEN_537 = (((((_GEN_6[stq_clr_head_idx[2:0]] & _GEN_244[stq_clr_head_idx[2:0]]) & _GEN_247[stq_clr_head_idx[2:0]]) & ~_GEN_246[stq_clr_head_idx[2:0]]) & ~_GEN_161[stq_clr_head_idx[2:0]]) & ~_GEN_252[stq_clr_head_idx[2:0]]) & ~(|(io_core_brupdate_b1_mispredict_mask & s_uop_br_mask) | io_core_exception);
		_GEN_538 = ~ldq_forward_std_val_0 | ((ldq_forward_stq_idx_0 != lcam_stq_idx_0) & (((((lcam_stq_idx_0[3] == ldq_forward_stq_idx_0[3]) & (lcam_stq_idx_0[2:0] > ldq_forward_stq_idx_0[2:0])) | ((lcam_stq_idx_0[3] != ldq_forward_stq_idx_0[3]) & (lcam_stq_idx_0[2:0] < ldq_forward_stq_idx_0[2:0]))) ^ (((ldq_uop_0_stq_idx[3] == ldq_forward_stq_idx_0[3]) & (ldq_uop_0_stq_idx[2:0] > ldq_forward_stq_idx_0[2:0])) | ((ldq_uop_0_stq_idx[3] != ldq_forward_stq_idx_0[3]) & (ldq_uop_0_stq_idx[2:0] < ldq_forward_stq_idx_0[2:0])))) ^ (((ldq_uop_0_stq_idx[3] == lcam_stq_idx_0[3]) & (ldq_uop_0_stq_idx[2:0] > lcam_stq_idx_0[2:0])) | ((ldq_uop_0_stq_idx[3] != lcam_stq_idx_0[3]) & (ldq_uop_0_stq_idx[2:0] < lcam_stq_idx_0[2:0])))));
		_GEN_539 = _GEN_291 & _GEN_538;
		_GEN_540 = _GEN_291 & _GEN_538;
		_GEN_542 = _GEN_302 & (~ldq_forward_std_val_1 | ((ldq_forward_stq_idx_1 != lcam_stq_idx_0) & (((((lcam_stq_idx_0[3] == ldq_forward_stq_idx_1[3]) & (lcam_stq_idx_0[2:0] > ldq_forward_stq_idx_1[2:0])) | ((lcam_stq_idx_0[3] != ldq_forward_stq_idx_1[3]) & (lcam_stq_idx_0[2:0] < ldq_forward_stq_idx_1[2:0]))) ^ (((ldq_uop_1_stq_idx[3] == ldq_forward_stq_idx_1[3]) & (ldq_uop_1_stq_idx[2:0] > ldq_forward_stq_idx_1[2:0])) | ((ldq_uop_1_stq_idx[3] != ldq_forward_stq_idx_1[3]) & (ldq_uop_1_stq_idx[2:0] < ldq_forward_stq_idx_1[2:0])))) ^ (((ldq_uop_1_stq_idx[3] == lcam_stq_idx_0[3]) & (ldq_uop_1_stq_idx[2:0] > lcam_stq_idx_0[2:0])) | ((ldq_uop_1_stq_idx[3] != lcam_stq_idx_0[3]) & (ldq_uop_1_stq_idx[2:0] < lcam_stq_idx_0[2:0]))))));
		_GEN_543 = ~ldq_forward_std_val_2 | ((ldq_forward_stq_idx_2 != lcam_stq_idx_0) & (((((lcam_stq_idx_0[3] == ldq_forward_stq_idx_2[3]) & (lcam_stq_idx_0[2:0] > ldq_forward_stq_idx_2[2:0])) | ((lcam_stq_idx_0[3] != ldq_forward_stq_idx_2[3]) & (lcam_stq_idx_0[2:0] < ldq_forward_stq_idx_2[2:0]))) ^ (((ldq_uop_2_stq_idx[3] == ldq_forward_stq_idx_2[3]) & (ldq_uop_2_stq_idx[2:0] > ldq_forward_stq_idx_2[2:0])) | ((ldq_uop_2_stq_idx[3] != ldq_forward_stq_idx_2[3]) & (ldq_uop_2_stq_idx[2:0] < ldq_forward_stq_idx_2[2:0])))) ^ (((ldq_uop_2_stq_idx[3] == lcam_stq_idx_0[3]) & (ldq_uop_2_stq_idx[2:0] > lcam_stq_idx_0[2:0])) | ((ldq_uop_2_stq_idx[3] != lcam_stq_idx_0[3]) & (ldq_uop_2_stq_idx[2:0] < lcam_stq_idx_0[2:0])))));
		_GEN_544 = _GEN_308 & _GEN_543;
		_GEN_545 = (_GEN_308 ? (_GEN_543 | _GEN_542) | _GEN_540 : _GEN_542 | _GEN_540);
		_GEN_546 = _GEN_314 & (~ldq_forward_std_val_3 | ((ldq_forward_stq_idx_3 != lcam_stq_idx_0) & (((((lcam_stq_idx_0[3] == ldq_forward_stq_idx_3[3]) & (lcam_stq_idx_0[2:0] > ldq_forward_stq_idx_3[2:0])) | ((lcam_stq_idx_0[3] != ldq_forward_stq_idx_3[3]) & (lcam_stq_idx_0[2:0] < ldq_forward_stq_idx_3[2:0]))) ^ (((ldq_uop_3_stq_idx[3] == ldq_forward_stq_idx_3[3]) & (ldq_uop_3_stq_idx[2:0] > ldq_forward_stq_idx_3[2:0])) | ((ldq_uop_3_stq_idx[3] != ldq_forward_stq_idx_3[3]) & (ldq_uop_3_stq_idx[2:0] < ldq_forward_stq_idx_3[2:0])))) ^ (((ldq_uop_3_stq_idx[3] == lcam_stq_idx_0[3]) & (ldq_uop_3_stq_idx[2:0] > lcam_stq_idx_0[2:0])) | ((ldq_uop_3_stq_idx[3] != lcam_stq_idx_0[3]) & (ldq_uop_3_stq_idx[2:0] < lcam_stq_idx_0[2:0]))))));
		_GEN_547 = ~ldq_forward_std_val_4 | ((ldq_forward_stq_idx_4 != lcam_stq_idx_0) & (((((lcam_stq_idx_0[3] == ldq_forward_stq_idx_4[3]) & (lcam_stq_idx_0[2:0] > ldq_forward_stq_idx_4[2:0])) | ((lcam_stq_idx_0[3] != ldq_forward_stq_idx_4[3]) & (lcam_stq_idx_0[2:0] < ldq_forward_stq_idx_4[2:0]))) ^ (((ldq_uop_4_stq_idx[3] == ldq_forward_stq_idx_4[3]) & (ldq_uop_4_stq_idx[2:0] > ldq_forward_stq_idx_4[2:0])) | ((ldq_uop_4_stq_idx[3] != ldq_forward_stq_idx_4[3]) & (ldq_uop_4_stq_idx[2:0] < ldq_forward_stq_idx_4[2:0])))) ^ (((ldq_uop_4_stq_idx[3] == lcam_stq_idx_0[3]) & (ldq_uop_4_stq_idx[2:0] > lcam_stq_idx_0[2:0])) | ((ldq_uop_4_stq_idx[3] != lcam_stq_idx_0[3]) & (ldq_uop_4_stq_idx[2:0] < lcam_stq_idx_0[2:0])))));
		_GEN_548 = _GEN_320 & _GEN_547;
		_GEN_549 = (_GEN_320 ? (_GEN_547 | _GEN_546) | _GEN_545 : _GEN_546 | _GEN_545);
		_GEN_550 = _GEN_326 & (~ldq_forward_std_val_5 | ((ldq_forward_stq_idx_5 != lcam_stq_idx_0) & (((((lcam_stq_idx_0[3] == ldq_forward_stq_idx_5[3]) & (lcam_stq_idx_0[2:0] > ldq_forward_stq_idx_5[2:0])) | ((lcam_stq_idx_0[3] != ldq_forward_stq_idx_5[3]) & (lcam_stq_idx_0[2:0] < ldq_forward_stq_idx_5[2:0]))) ^ (((ldq_uop_5_stq_idx[3] == ldq_forward_stq_idx_5[3]) & (ldq_uop_5_stq_idx[2:0] > ldq_forward_stq_idx_5[2:0])) | ((ldq_uop_5_stq_idx[3] != ldq_forward_stq_idx_5[3]) & (ldq_uop_5_stq_idx[2:0] < ldq_forward_stq_idx_5[2:0])))) ^ (((ldq_uop_5_stq_idx[3] == lcam_stq_idx_0[3]) & (ldq_uop_5_stq_idx[2:0] > lcam_stq_idx_0[2:0])) | ((ldq_uop_5_stq_idx[3] != lcam_stq_idx_0[3]) & (ldq_uop_5_stq_idx[2:0] < lcam_stq_idx_0[2:0]))))));
		_GEN_551 = ~ldq_forward_std_val_6 | ((ldq_forward_stq_idx_6 != lcam_stq_idx_0) & (((((lcam_stq_idx_0[3] == ldq_forward_stq_idx_6[3]) & (lcam_stq_idx_0[2:0] > ldq_forward_stq_idx_6[2:0])) | ((lcam_stq_idx_0[3] != ldq_forward_stq_idx_6[3]) & (lcam_stq_idx_0[2:0] < ldq_forward_stq_idx_6[2:0]))) ^ (((ldq_uop_6_stq_idx[3] == ldq_forward_stq_idx_6[3]) & (ldq_uop_6_stq_idx[2:0] > ldq_forward_stq_idx_6[2:0])) | ((ldq_uop_6_stq_idx[3] != ldq_forward_stq_idx_6[3]) & (ldq_uop_6_stq_idx[2:0] < ldq_forward_stq_idx_6[2:0])))) ^ (((ldq_uop_6_stq_idx[3] == lcam_stq_idx_0[3]) & (ldq_uop_6_stq_idx[2:0] > lcam_stq_idx_0[2:0])) | ((ldq_uop_6_stq_idx[3] != lcam_stq_idx_0[3]) & (ldq_uop_6_stq_idx[2:0] < lcam_stq_idx_0[2:0])))));
		_GEN_552 = _GEN_332 & _GEN_551;
		_GEN_553 = ((((((((~_GEN_333 | _GEN_335) | ~(~_GEN_334 & (&lcam_ldq_idx_0[2:0]))) & ((~_GEN_327 | _GEN_329) | ~(~_GEN_328 & (&lcam_ldq_idx_0[2:0])))) & ((~_GEN_321 | _GEN_323) | ~(~_GEN_322 & (&lcam_ldq_idx_0[2:0])))) & ((~_GEN_315 | _GEN_317) | ~(~_GEN_316 & (&lcam_ldq_idx_0[2:0])))) & ((~_GEN_309 | _GEN_311) | ~(~_GEN_310 & (&lcam_ldq_idx_0[2:0])))) & ((~_GEN_303 | _GEN_305) | ~(~_GEN_304 & (&lcam_ldq_idx_0[2:0])))) & ((~_GEN_292 | lcam_younger_load_mask_0_0) | ~((|lcam_ldq_idx_0[2:0] & ~_GEN_293) & (&lcam_ldq_idx_0[2:0])))) & s1_executing_loads_7;
		_GEN_554 = _GEN_338 & (~ldq_forward_std_val_7 | ((ldq_forward_stq_idx_7 != lcam_stq_idx_0) & (((((lcam_stq_idx_0[3] == ldq_forward_stq_idx_7[3]) & (lcam_stq_idx_0[2:0] > ldq_forward_stq_idx_7[2:0])) | ((lcam_stq_idx_0[3] != ldq_forward_stq_idx_7[3]) & (lcam_stq_idx_0[2:0] < ldq_forward_stq_idx_7[2:0]))) ^ (((ldq_uop_7_stq_idx[3] == ldq_forward_stq_idx_7[3]) & (ldq_uop_7_stq_idx[2:0] > ldq_forward_stq_idx_7[2:0])) | ((ldq_uop_7_stq_idx[3] != ldq_forward_stq_idx_7[3]) & (ldq_uop_7_stq_idx[2:0] < ldq_forward_stq_idx_7[2:0])))) ^ (((ldq_uop_7_stq_idx[3] == lcam_stq_idx_0[3]) & (ldq_uop_7_stq_idx[2:0] > lcam_stq_idx_0[2:0])) | ((ldq_uop_7_stq_idx[3] != lcam_stq_idx_0[3]) & (ldq_uop_7_stq_idx[2:0] < lcam_stq_idx_0[2:0]))))));
		_GEN_555 = ((((((((~_GEN_339 | lcam_younger_load_mask_0_7) | ~((~(&lcam_ldq_idx_0[2:0]) & ~_GEN_340) & ~(|lcam_ldq_idx_0[2:0]))) & ((~_GEN_333 | _GEN_335) | ~(~_GEN_334 & ~(|lcam_ldq_idx_0[2:0])))) & ((~_GEN_327 | _GEN_329) | ~(~_GEN_328 & ~(|lcam_ldq_idx_0[2:0])))) & ((~_GEN_321 | _GEN_323) | ~(~_GEN_322 & ~(|lcam_ldq_idx_0[2:0])))) & ((~_GEN_315 | _GEN_317) | ~(~_GEN_316 & ~(|lcam_ldq_idx_0[2:0])))) & ((~_GEN_309 | _GEN_311) | ~(~_GEN_310 & ~(|lcam_ldq_idx_0[2:0])))) & ((~_GEN_303 | _GEN_305) | ~(~_GEN_304 & ~(|lcam_ldq_idx_0[2:0])))) & s1_executing_loads_0;
		_GEN_556 = (((((((((~_GEN_339 | lcam_younger_load_mask_0_7) | ~((~(&lcam_ldq_idx_0[2:0]) & ~_GEN_340) & _GEN_294)) & ((~_GEN_333 | _GEN_335) | ~(~_GEN_334 & _GEN_294))) & ((~_GEN_327 | _GEN_329) | ~(~_GEN_328 & _GEN_294))) & ((~_GEN_321 | _GEN_323) | ~(~_GEN_322 & _GEN_294))) & ((~_GEN_315 | _GEN_317) | ~(~_GEN_316 & _GEN_294))) & ((~_GEN_309 | _GEN_311) | ~(~_GEN_310 & _GEN_294))) & ((~_GEN_303 | _GEN_305) | ~(~_GEN_304 & _GEN_294))) & ((~_GEN_292 | lcam_younger_load_mask_0_0) | ~((|lcam_ldq_idx_0[2:0] & ~_GEN_293) & _GEN_294))) & s1_executing_loads_1;
		_GEN_557 = (((((((((~_GEN_339 | lcam_younger_load_mask_0_7) | ~((~(&lcam_ldq_idx_0[2:0]) & ~_GEN_340) & _GEN_295)) & ((~_GEN_333 | _GEN_335) | ~(~_GEN_334 & _GEN_295))) & ((~_GEN_327 | _GEN_329) | ~(~_GEN_328 & _GEN_295))) & ((~_GEN_321 | _GEN_323) | ~(~_GEN_322 & _GEN_295))) & ((~_GEN_315 | _GEN_317) | ~(~_GEN_316 & _GEN_295))) & ((~_GEN_309 | _GEN_311) | ~(~_GEN_310 & _GEN_295))) & ((~_GEN_303 | _GEN_305) | ~(~_GEN_304 & _GEN_295))) & ((~_GEN_292 | lcam_younger_load_mask_0_0) | ~((|lcam_ldq_idx_0[2:0] & ~_GEN_293) & _GEN_295))) & s1_executing_loads_2;
		_GEN_558 = (((((((((~_GEN_339 | lcam_younger_load_mask_0_7) | ~((~(&lcam_ldq_idx_0[2:0]) & ~_GEN_340) & _GEN_296)) & ((~_GEN_333 | _GEN_335) | ~(~_GEN_334 & _GEN_296))) & ((~_GEN_327 | _GEN_329) | ~(~_GEN_328 & _GEN_296))) & ((~_GEN_321 | _GEN_323) | ~(~_GEN_322 & _GEN_296))) & ((~_GEN_315 | _GEN_317) | ~(~_GEN_316 & _GEN_296))) & ((~_GEN_309 | _GEN_311) | ~(~_GEN_310 & _GEN_296))) & ((~_GEN_303 | _GEN_305) | ~(~_GEN_304 & _GEN_296))) & ((~_GEN_292 | lcam_younger_load_mask_0_0) | ~((|lcam_ldq_idx_0[2:0] & ~_GEN_293) & _GEN_296))) & s1_executing_loads_3;
		_GEN_559 = (((((((((~_GEN_339 | lcam_younger_load_mask_0_7) | ~((~(&lcam_ldq_idx_0[2:0]) & ~_GEN_340) & _GEN_297)) & ((~_GEN_333 | _GEN_335) | ~(~_GEN_334 & _GEN_297))) & ((~_GEN_327 | _GEN_329) | ~(~_GEN_328 & _GEN_297))) & ((~_GEN_321 | _GEN_323) | ~(~_GEN_322 & _GEN_297))) & ((~_GEN_315 | _GEN_317) | ~(~_GEN_316 & _GEN_297))) & ((~_GEN_309 | _GEN_311) | ~(~_GEN_310 & _GEN_297))) & ((~_GEN_303 | _GEN_305) | ~(~_GEN_304 & _GEN_297))) & ((~_GEN_292 | lcam_younger_load_mask_0_0) | ~((|lcam_ldq_idx_0[2:0] & ~_GEN_293) & _GEN_297))) & s1_executing_loads_4;
		_GEN_560 = (((((((((~_GEN_339 | lcam_younger_load_mask_0_7) | ~((~(&lcam_ldq_idx_0[2:0]) & ~_GEN_340) & _GEN_298)) & ((~_GEN_333 | _GEN_335) | ~(~_GEN_334 & _GEN_298))) & ((~_GEN_327 | _GEN_329) | ~(~_GEN_328 & _GEN_298))) & ((~_GEN_321 | _GEN_323) | ~(~_GEN_322 & _GEN_298))) & ((~_GEN_315 | _GEN_317) | ~(~_GEN_316 & _GEN_298))) & ((~_GEN_309 | _GEN_311) | ~(~_GEN_310 & _GEN_298))) & ((~_GEN_303 | _GEN_305) | ~(~_GEN_304 & _GEN_298))) & ((~_GEN_292 | lcam_younger_load_mask_0_0) | ~((|lcam_ldq_idx_0[2:0] & ~_GEN_293) & _GEN_298))) & s1_executing_loads_5;
		_GEN_561 = (((((((((~_GEN_339 | lcam_younger_load_mask_0_7) | ~((~(&lcam_ldq_idx_0[2:0]) & ~_GEN_340) & _GEN_299)) & ((~_GEN_333 | _GEN_335) | ~(~_GEN_334 & _GEN_299))) & ((~_GEN_327 | _GEN_329) | ~(~_GEN_328 & _GEN_299))) & ((~_GEN_321 | _GEN_323) | ~(~_GEN_322 & _GEN_299))) & ((~_GEN_315 | _GEN_317) | ~(~_GEN_316 & _GEN_299))) & ((~_GEN_309 | _GEN_311) | ~(~_GEN_310 & _GEN_299))) & ((~_GEN_303 | _GEN_305) | ~(~_GEN_304 & _GEN_299))) & ((~_GEN_292 | lcam_younger_load_mask_0_0) | ~((|lcam_ldq_idx_0[2:0] & ~_GEN_293) & _GEN_299))) & s1_executing_loads_6;
		forward_dword_addr_matches = lcam_addr_0[39:3] == wb_ldst_forward_ld_addr_0[39:3];
		_forward_mask_mask_T_2 = 15'h0001 << wb_ldst_forward_ld_addr_0[2:0];
		_forward_mask_mask_T_6 = 15'h0003 << {12'h000, wb_ldst_forward_ld_addr_0[2:1], 1'h0};
		_GEN_571 = {8'hff, (wb_ldst_forward_ld_addr_0[2] ? 8'hf0 : 8'h0f), _forward_mask_mask_T_6[7:0], _forward_mask_mask_T_2[7:0]};
		_forward_mask_overlap_T = _GEN_571[wb_ldst_forward_e_REG_uop_mem_size * 8+:8] & lcam_mask_0;
		_GEN_572 = wb_ldst_forward_ldq_idx_0[3] == lcam_ldq_idx_0[3];
		_GEN_573 = ldq_head[3] == wb_ldst_forward_ldq_idx_0[3];
		_GEN_574 = ((((do_ld_search_0 & wb_ldst_forward_valid_0) & forward_dword_addr_matches) & |_forward_mask_overlap_T) & wb_ldst_forward_e_REG_observed) & ((((_GEN_572 & (wb_ldst_forward_ldq_idx_0[2:0] > lcam_ldq_idx_0[2:0])) | (~_GEN_572 & (wb_ldst_forward_ldq_idx_0[2:0] < lcam_ldq_idx_0[2:0]))) ^ _GEN_346) ^ ((_GEN_573 & (ldq_head[2:0] > wb_ldst_forward_ldq_idx_0[2:0])) | (~_GEN_573 & (ldq_head[2:0] < wb_ldst_forward_ldq_idx_0[2:0]))));
		_GEN_575 = wb_ldst_forward_e_REG_next_stq_idx[3] == lcam_stq_idx_0[3];
		_GEN_576 = ((((do_st_search_0 & wb_ldst_forward_valid_0) & forward_dword_addr_matches) & |_forward_mask_overlap_T) & ((_GEN_575 & (wb_ldst_forward_e_REG_next_stq_idx[2:0] > lcam_stq_idx_0[2:0])) | (~_GEN_575 & (wb_ldst_forward_e_REG_next_stq_idx[2:0] < lcam_stq_idx_0[2:0])))) & ((((~lcam_stq_idx_0[3] & (lcam_stq_idx_0[2:0] > _logic_1_io_found_idx)) | (lcam_stq_idx_0[3] & (lcam_stq_idx_0[2:0] < _logic_1_io_found_idx))) ^ ((~wb_ldst_forward_e_REG_uop_stq_idx[3] & (wb_ldst_forward_e_REG_uop_stq_idx[2:0] > _logic_1_io_found_idx)) | (wb_ldst_forward_e_REG_uop_stq_idx[3] & (wb_ldst_forward_e_REG_uop_stq_idx[2:0] < _logic_1_io_found_idx)))) ^ (((wb_ldst_forward_e_REG_uop_stq_idx[3] == lcam_stq_idx_0[3]) & (wb_ldst_forward_e_REG_uop_stq_idx[2:0] > lcam_stq_idx_0[2:0])) | ((wb_ldst_forward_e_REG_uop_stq_idx[3] != lcam_stq_idx_0[3]) & (wb_ldst_forward_e_REG_uop_stq_idx[2:0] < lcam_stq_idx_0[2:0]))));
		wb_ldst_forward_stq_idx_0 = {1'h0, _logic_1_io_found_idx};
		_ld_xcpt_valid_T_2 = {ldq_order_fail_7, ldq_order_fail_6, ldq_order_fail_5, ldq_order_fail_4, ldq_order_fail_3, ldq_order_fail_2, ldq_order_fail_1, ldq_order_fail_0} & {ldq_valid_7, ldq_valid_6, ldq_valid_5, ldq_valid_4, ldq_valid_3, ldq_valid_2, ldq_valid_1, ldq_valid_0};
		_l_idx_T = ldq_valid_0 & ldq_order_fail_0;
		_l_idx_T_1 = ldq_valid_1 & ldq_order_fail_1;
		_l_idx_T_2 = ldq_valid_2 & ldq_order_fail_2;
		_l_idx_T_3 = ldq_valid_3 & ldq_order_fail_3;
		_l_idx_T_4 = ldq_valid_4 & ldq_order_fail_4;
		_l_idx_T_5 = ldq_valid_5 & ldq_order_fail_5;
		_l_idx_T_6 = ldq_valid_6 & ldq_order_fail_6;
		l_idx_base_idx = (_l_idx_T & (ldq_head[2:0] == 3'h0) ? 3'h0 : (_l_idx_T_1 & (ldq_head[2:0] < 3'h2) ? 3'h1 : (_l_idx_T_2 & (ldq_head[2:0] < 3'h3) ? 3'h2 : (_l_idx_T_3 & ~ldq_head[2] ? 3'h3 : (_l_idx_T_4 & (ldq_head[2:0] < 3'h5) ? 3'h4 : (_l_idx_T_5 & (ldq_head[2:1] != 2'h3) ? 3'h5 : (_l_idx_T_6 & (ldq_head[2:0] != 3'h7) ? 3'h6 : (ldq_valid_7 & ldq_order_fail_7 ? 3'h7 : (_l_idx_T ? 3'h0 : (_l_idx_T_1 ? 3'h1 : (_l_idx_T_2 ? 3'h2 : (_l_idx_T_3 ? 3'h3 : (_l_idx_T_4 ? 3'h4 : (_l_idx_T_5 ? 3'h5 : {2'h3, ~_l_idx_T_6}))))))))))))));
		use_mem_xcpt = (mem_xcpt_valids_0 & (((mem_xcpt_uops_0_rob_idx < _GEN_81[l_idx_base_idx * 5+:5]) ^ (mem_xcpt_uops_0_rob_idx < io_core_rob_head_idx)) ^ (_GEN_81[l_idx_base_idx * 5+:5] < io_core_rob_head_idx))) | ~(|_ld_xcpt_valid_T_2);
		xcpt_uop_br_mask = (use_mem_xcpt ? mem_xcpt_uops_0_br_mask : _GEN_42[l_idx_base_idx * 8+:8]);
		iresp_0_bits_uop_pdst = (_GEN_385 ? (resp_uop_uses_stq ? _GEN_197[resp_uop_stq_idx * 6+:6] : _GEN_85[resp_uop_ldq_idx * 6+:6]) : wb_ldst_forward_e_REG_uop_pdst);
		iresp_0_bits_data_zeroed = (wb_ldst_forward_ld_addr_0[2] ? _GEN_384[63:32] : _GEN_384[31:0]);
		iresp_0_bits_data_zeroed_1 = (wb_ldst_forward_ld_addr_0[1] ? iresp_0_bits_data_zeroed[31:16] : iresp_0_bits_data_zeroed[15:0]);
		iresp_0_bits_data_zeroed_2 = (wb_ldst_forward_ld_addr_0[0] ? iresp_0_bits_data_zeroed_1[15:8] : iresp_0_bits_data_zeroed_1[7:0]);
		_GEN_577 = stq_valid_0 & |_GEN_402;
		_GEN_578 = stq_valid_1 & |_GEN_403;
		_GEN_579 = stq_valid_2 & |_GEN_404;
		_GEN_580 = stq_valid_3 & |_GEN_405;
		_GEN_581 = stq_valid_4 & |_GEN_406;
		_GEN_582 = stq_valid_5 & |_GEN_407;
		_GEN_583 = stq_valid_6 & |_GEN_408;
		_GEN_584 = stq_valid_7 & |_GEN_409;
		_GEN_585 = ldq_valid_0 & (|(io_core_brupdate_b1_mispredict_mask & ldq_uop_0_br_mask) | io_core_exception);
		_GEN_586 = ldq_valid_1 & (|(io_core_brupdate_b1_mispredict_mask & ldq_uop_1_br_mask) | io_core_exception);
		_GEN_587 = ldq_valid_2 & (|(io_core_brupdate_b1_mispredict_mask & ldq_uop_2_br_mask) | io_core_exception);
		_GEN_588 = ldq_valid_3 & (|(io_core_brupdate_b1_mispredict_mask & ldq_uop_3_br_mask) | io_core_exception);
		_GEN_589 = ldq_valid_4 & (|(io_core_brupdate_b1_mispredict_mask & ldq_uop_4_br_mask) | io_core_exception);
		_GEN_590 = ldq_valid_5 & (|(io_core_brupdate_b1_mispredict_mask & ldq_uop_5_br_mask) | io_core_exception);
		_GEN_591 = ldq_valid_6 & (|(io_core_brupdate_b1_mispredict_mask & ldq_uop_6_br_mask) | io_core_exception);
		_GEN_592 = ldq_valid_7 & (|(io_core_brupdate_b1_mispredict_mask & ldq_uop_7_br_mask) | io_core_exception);
		_GEN_593 = commit_store & (stq_commit_head[2:0] == 3'h0);
		_GEN_594 = commit_store & (stq_commit_head[2:0] == 3'h1);
		_GEN_595 = commit_store & (stq_commit_head[2:0] == 3'h2);
		_GEN_596 = commit_store & (stq_commit_head[2:0] == 3'h3);
		_GEN_597 = commit_store & (stq_commit_head[2:0] == 3'h4);
		_GEN_598 = commit_store & (stq_commit_head[2:0] == 3'h5);
		_GEN_599 = commit_store & (stq_commit_head[2:0] == 3'h6);
		_GEN_600 = commit_store & (&stq_commit_head[2:0]);
		clear_store = _GEN_429 & (_GEN_430 ? io_dmem_ordered : _GEN_250[stq_head[2:0]]);
		_GEN_602 = io_hellacache_req_ready_0 & io_hellacache_req_valid;
		if (_GEN_370) begin : assert__assert_47
			
		end
		if (_GEN_410) begin : assert__assert_61
			
		end
		ldq_valid_0 <= ~_GEN_604 & (_GEN_601 ? ~_GEN_585 & _GEN_452 : ~((ldq_head[2:0] == 3'h0) | _GEN_585) & _GEN_452);
		ldq_valid_1 <= ~_GEN_604 & (_GEN_601 ? ~_GEN_586 & _GEN_453 : ~((ldq_head[2:0] == 3'h1) | _GEN_586) & _GEN_453);
		ldq_valid_2 <= ~_GEN_604 & (_GEN_601 ? ~_GEN_587 & _GEN_454 : ~((ldq_head[2:0] == 3'h2) | _GEN_587) & _GEN_454);
		ldq_valid_3 <= ~_GEN_604 & (_GEN_601 ? ~_GEN_588 & _GEN_455 : ~((ldq_head[2:0] == 3'h3) | _GEN_588) & _GEN_455);
		ldq_valid_4 <= ~_GEN_604 & (_GEN_601 ? ~_GEN_589 & _GEN_456 : ~((ldq_head[2:0] == 3'h4) | _GEN_589) & _GEN_456);
		ldq_valid_5 <= ~_GEN_604 & (_GEN_601 ? ~_GEN_590 & _GEN_457 : ~((ldq_head[2:0] == 3'h5) | _GEN_590) & _GEN_457);
		ldq_valid_6 <= ~_GEN_604 & (_GEN_601 ? ~_GEN_591 & _GEN_458 : ~((ldq_head[2:0] == 3'h6) | _GEN_591) & _GEN_458);
		ldq_valid_7 <= ~_GEN_604 & (_GEN_601 ? ~_GEN_592 & _GEN_459 : ~(&ldq_head[2:0] | _GEN_592) & _GEN_459);
		if (_GEN_8) begin
			ldq_uop_0_inst <= dis_uops_0_bits_inst;
			ldq_uop_0_debug_inst <= dis_uops_0_bits_debug_inst;
			ldq_uop_0_is_rvc <= dis_uops_0_bits_is_rvc;
			ldq_uop_0_debug_pc <= dis_uops_0_bits_debug_pc;
			ldq_uop_0_iq_type_0 <= dis_uops_0_bits_iq_type_0;
			ldq_uop_0_iq_type_1 <= dis_uops_0_bits_iq_type_1;
			ldq_uop_0_iq_type_2 <= dis_uops_0_bits_iq_type_2;
			ldq_uop_0_iq_type_3 <= dis_uops_0_bits_iq_type_3;
			ldq_uop_0_fu_code_0 <= dis_uops_0_bits_fu_code_0;
			ldq_uop_0_fu_code_1 <= dis_uops_0_bits_fu_code_1;
			ldq_uop_0_fu_code_2 <= dis_uops_0_bits_fu_code_2;
			ldq_uop_0_fu_code_3 <= dis_uops_0_bits_fu_code_3;
			ldq_uop_0_fu_code_4 <= dis_uops_0_bits_fu_code_4;
			ldq_uop_0_fu_code_5 <= dis_uops_0_bits_fu_code_5;
			ldq_uop_0_fu_code_6 <= dis_uops_0_bits_fu_code_6;
			ldq_uop_0_fu_code_7 <= dis_uops_0_bits_fu_code_7;
			ldq_uop_0_fu_code_8 <= dis_uops_0_bits_fu_code_8;
			ldq_uop_0_fu_code_9 <= dis_uops_0_bits_fu_code_9;
			ldq_uop_0_iw_issued <= dis_uops_0_bits_iw_issued;
			ldq_uop_0_iw_issued_partial_agen <= dis_uops_0_bits_iw_issued_partial_agen;
			ldq_uop_0_iw_issued_partial_dgen <= dis_uops_0_bits_iw_issued_partial_dgen;
			ldq_uop_0_iw_p1_speculative_child <= dis_uops_0_bits_iw_p1_speculative_child;
			ldq_uop_0_iw_p2_speculative_child <= dis_uops_0_bits_iw_p2_speculative_child;
			ldq_uop_0_iw_p1_bypass_hint <= dis_uops_0_bits_iw_p1_bypass_hint;
			ldq_uop_0_iw_p2_bypass_hint <= dis_uops_0_bits_iw_p2_bypass_hint;
			ldq_uop_0_iw_p3_bypass_hint <= dis_uops_0_bits_iw_p3_bypass_hint;
			ldq_uop_0_br_tag <= dis_uops_0_bits_br_tag;
			ldq_uop_0_br_type <= dis_uops_0_bits_br_type;
			ldq_uop_0_is_sfb <= dis_uops_0_bits_is_sfb;
			ldq_uop_0_is_fence <= dis_uops_0_bits_is_fence;
			ldq_uop_0_is_fencei <= dis_uops_0_bits_is_fencei;
			ldq_uop_0_is_sfence <= dis_uops_0_bits_is_sfence;
			ldq_uop_0_is_amo <= dis_uops_0_bits_is_amo;
			ldq_uop_0_is_eret <= dis_uops_0_bits_is_eret;
			ldq_uop_0_is_sys_pc2epc <= dis_uops_0_bits_is_sys_pc2epc;
			ldq_uop_0_is_rocc <= dis_uops_0_bits_is_rocc;
			ldq_uop_0_is_mov <= dis_uops_0_bits_is_mov;
			ldq_uop_0_ftq_idx <= dis_uops_0_bits_ftq_idx;
			ldq_uop_0_edge_inst <= dis_uops_0_bits_edge_inst;
			ldq_uop_0_pc_lob <= dis_uops_0_bits_pc_lob;
			ldq_uop_0_taken <= dis_uops_0_bits_taken;
			ldq_uop_0_imm_rename <= dis_uops_0_bits_imm_rename;
			ldq_uop_0_imm_sel <= dis_uops_0_bits_imm_sel;
			ldq_uop_0_pimm <= dis_uops_0_bits_pimm;
			ldq_uop_0_imm_packed <= dis_uops_0_bits_imm_packed;
			ldq_uop_0_op1_sel <= dis_uops_0_bits_op1_sel;
			ldq_uop_0_op2_sel <= dis_uops_0_bits_op2_sel;
			ldq_uop_0_fp_ctrl_ldst <= dis_uops_0_bits_fp_ctrl_ldst;
			ldq_uop_0_fp_ctrl_wen <= dis_uops_0_bits_fp_ctrl_wen;
			ldq_uop_0_fp_ctrl_ren1 <= dis_uops_0_bits_fp_ctrl_ren1;
			ldq_uop_0_fp_ctrl_ren2 <= dis_uops_0_bits_fp_ctrl_ren2;
			ldq_uop_0_fp_ctrl_ren3 <= dis_uops_0_bits_fp_ctrl_ren3;
			ldq_uop_0_fp_ctrl_swap12 <= dis_uops_0_bits_fp_ctrl_swap12;
			ldq_uop_0_fp_ctrl_swap23 <= dis_uops_0_bits_fp_ctrl_swap23;
			ldq_uop_0_fp_ctrl_typeTagIn <= dis_uops_0_bits_fp_ctrl_typeTagIn;
			ldq_uop_0_fp_ctrl_typeTagOut <= dis_uops_0_bits_fp_ctrl_typeTagOut;
			ldq_uop_0_fp_ctrl_fromint <= dis_uops_0_bits_fp_ctrl_fromint;
			ldq_uop_0_fp_ctrl_toint <= dis_uops_0_bits_fp_ctrl_toint;
			ldq_uop_0_fp_ctrl_fastpipe <= dis_uops_0_bits_fp_ctrl_fastpipe;
			ldq_uop_0_fp_ctrl_fma <= dis_uops_0_bits_fp_ctrl_fma;
			ldq_uop_0_fp_ctrl_div <= dis_uops_0_bits_fp_ctrl_div;
			ldq_uop_0_fp_ctrl_sqrt <= dis_uops_0_bits_fp_ctrl_sqrt;
			ldq_uop_0_fp_ctrl_wflags <= dis_uops_0_bits_fp_ctrl_wflags;
			ldq_uop_0_fp_ctrl_vec <= dis_uops_0_bits_fp_ctrl_vec;
			ldq_uop_0_rob_idx <= dis_uops_0_bits_rob_idx;
			ldq_uop_0_ldq_idx <= dis_uops_0_bits_ldq_idx;
			ldq_uop_0_stq_idx <= dis_uops_0_bits_stq_idx;
			ldq_uop_0_rxq_idx <= dis_uops_0_bits_rxq_idx;
			ldq_uop_0_prs1 <= dis_uops_0_bits_prs1;
			ldq_uop_0_prs2 <= dis_uops_0_bits_prs2;
			ldq_uop_0_prs3 <= dis_uops_0_bits_prs3;
			ldq_uop_0_ppred <= dis_uops_0_bits_ppred;
			ldq_uop_0_prs1_busy <= dis_uops_0_bits_prs1_busy;
			ldq_uop_0_prs2_busy <= dis_uops_0_bits_prs2_busy;
			ldq_uop_0_prs3_busy <= dis_uops_0_bits_prs3_busy;
			ldq_uop_0_ppred_busy <= dis_uops_0_bits_ppred_busy;
			ldq_uop_0_stale_pdst <= dis_uops_0_bits_stale_pdst;
			ldq_uop_0_exc_cause <= dis_uops_0_bits_exc_cause;
			ldq_uop_0_mem_cmd <= dis_uops_0_bits_mem_cmd;
			ldq_uop_0_mem_size <= dis_uops_0_bits_mem_size;
			ldq_uop_0_mem_signed <= dis_uops_0_bits_mem_signed;
			ldq_uop_0_uses_ldq <= dis_uops_0_bits_uses_ldq;
			ldq_uop_0_uses_stq <= dis_uops_0_bits_uses_stq;
			ldq_uop_0_is_unique <= dis_uops_0_bits_is_unique;
			ldq_uop_0_flush_on_commit <= dis_uops_0_bits_flush_on_commit;
			ldq_uop_0_csr_cmd <= dis_uops_0_bits_csr_cmd;
			ldq_uop_0_ldst_is_rs1 <= dis_uops_0_bits_ldst_is_rs1;
			ldq_uop_0_ldst <= dis_uops_0_bits_ldst;
			ldq_uop_0_lrs1 <= dis_uops_0_bits_lrs1;
			ldq_uop_0_lrs2 <= dis_uops_0_bits_lrs2;
			ldq_uop_0_lrs3 <= dis_uops_0_bits_lrs3;
			ldq_uop_0_dst_rtype <= dis_uops_0_bits_dst_rtype;
			ldq_uop_0_lrs1_rtype <= dis_uops_0_bits_lrs1_rtype;
			ldq_uop_0_lrs2_rtype <= dis_uops_0_bits_lrs2_rtype;
			ldq_uop_0_frs3_en <= dis_uops_0_bits_frs3_en;
			ldq_uop_0_fcn_dw <= dis_uops_0_bits_fcn_dw;
			ldq_uop_0_fcn_op <= dis_uops_0_bits_fcn_op;
			ldq_uop_0_fp_val <= dis_uops_0_bits_fp_val;
			ldq_uop_0_fp_rm <= dis_uops_0_bits_fp_rm;
			ldq_uop_0_fp_typ <= dis_uops_0_bits_fp_typ;
			ldq_uop_0_xcpt_pf_if <= dis_uops_0_bits_xcpt_pf_if;
			ldq_uop_0_xcpt_ae_if <= dis_uops_0_bits_xcpt_ae_if;
			ldq_uop_0_xcpt_ma_if <= dis_uops_0_bits_xcpt_ma_if;
			ldq_uop_0_bp_debug_if <= dis_uops_0_bits_bp_debug_if;
			ldq_uop_0_bp_xcpt_if <= dis_uops_0_bits_bp_xcpt_if;
			ldq_uop_0_debug_fsrc <= dis_uops_0_bits_debug_fsrc;
			ldq_uop_0_debug_tsrc <= dis_uops_0_bits_debug_tsrc;
		end
		if (ldq_valid_0)
			ldq_uop_0_br_mask <= ldq_uop_0_br_mask & ~io_core_brupdate_b1_resolve_mask;
		else if (_GEN_8)
			ldq_uop_0_br_mask <= ldq_uop_out_br_mask;
		if (_GEN_497) begin
			if (_exe_cmd_T)
				ldq_uop_0_pdst <= ldq_incoming_e_0_bits_uop_pdst;
			else
				ldq_uop_0_pdst <= _exe_tlb_uop_T_4_pdst;
			ldq_addr_0_bits <= _ldq_addr_bits_T;
			ldq_addr_is_virtual_0 <= exe_tlb_miss_0;
			ldq_addr_is_uncacheable_0 <= _ldq_addr_is_uncacheable_T_1;
			ldq_ld_byte_mask_0 <= _ldq_ld_byte_mask_mask_T_14;
		end
		else if (_GEN_8)
			ldq_uop_0_pdst <= dis_uops_0_bits_pdst;
		ldq_uop_0_exception <= ((mem_xcpt_valids_0 & mem_xcpt_uops_0_uses_ldq) & (mem_xcpt_uops_0_ldq_idx[2:0] == 3'h0)) | (_GEN_8 ? dis_uops_0_bits_exception : ldq_uop_0_exception);
		if (_GEN_9) begin
			ldq_uop_1_inst <= dis_uops_0_bits_inst;
			ldq_uop_1_debug_inst <= dis_uops_0_bits_debug_inst;
			ldq_uop_1_is_rvc <= dis_uops_0_bits_is_rvc;
			ldq_uop_1_debug_pc <= dis_uops_0_bits_debug_pc;
			ldq_uop_1_iq_type_0 <= dis_uops_0_bits_iq_type_0;
			ldq_uop_1_iq_type_1 <= dis_uops_0_bits_iq_type_1;
			ldq_uop_1_iq_type_2 <= dis_uops_0_bits_iq_type_2;
			ldq_uop_1_iq_type_3 <= dis_uops_0_bits_iq_type_3;
			ldq_uop_1_fu_code_0 <= dis_uops_0_bits_fu_code_0;
			ldq_uop_1_fu_code_1 <= dis_uops_0_bits_fu_code_1;
			ldq_uop_1_fu_code_2 <= dis_uops_0_bits_fu_code_2;
			ldq_uop_1_fu_code_3 <= dis_uops_0_bits_fu_code_3;
			ldq_uop_1_fu_code_4 <= dis_uops_0_bits_fu_code_4;
			ldq_uop_1_fu_code_5 <= dis_uops_0_bits_fu_code_5;
			ldq_uop_1_fu_code_6 <= dis_uops_0_bits_fu_code_6;
			ldq_uop_1_fu_code_7 <= dis_uops_0_bits_fu_code_7;
			ldq_uop_1_fu_code_8 <= dis_uops_0_bits_fu_code_8;
			ldq_uop_1_fu_code_9 <= dis_uops_0_bits_fu_code_9;
			ldq_uop_1_iw_issued <= dis_uops_0_bits_iw_issued;
			ldq_uop_1_iw_issued_partial_agen <= dis_uops_0_bits_iw_issued_partial_agen;
			ldq_uop_1_iw_issued_partial_dgen <= dis_uops_0_bits_iw_issued_partial_dgen;
			ldq_uop_1_iw_p1_speculative_child <= dis_uops_0_bits_iw_p1_speculative_child;
			ldq_uop_1_iw_p2_speculative_child <= dis_uops_0_bits_iw_p2_speculative_child;
			ldq_uop_1_iw_p1_bypass_hint <= dis_uops_0_bits_iw_p1_bypass_hint;
			ldq_uop_1_iw_p2_bypass_hint <= dis_uops_0_bits_iw_p2_bypass_hint;
			ldq_uop_1_iw_p3_bypass_hint <= dis_uops_0_bits_iw_p3_bypass_hint;
			ldq_uop_1_br_tag <= dis_uops_0_bits_br_tag;
			ldq_uop_1_br_type <= dis_uops_0_bits_br_type;
			ldq_uop_1_is_sfb <= dis_uops_0_bits_is_sfb;
			ldq_uop_1_is_fence <= dis_uops_0_bits_is_fence;
			ldq_uop_1_is_fencei <= dis_uops_0_bits_is_fencei;
			ldq_uop_1_is_sfence <= dis_uops_0_bits_is_sfence;
			ldq_uop_1_is_amo <= dis_uops_0_bits_is_amo;
			ldq_uop_1_is_eret <= dis_uops_0_bits_is_eret;
			ldq_uop_1_is_sys_pc2epc <= dis_uops_0_bits_is_sys_pc2epc;
			ldq_uop_1_is_rocc <= dis_uops_0_bits_is_rocc;
			ldq_uop_1_is_mov <= dis_uops_0_bits_is_mov;
			ldq_uop_1_ftq_idx <= dis_uops_0_bits_ftq_idx;
			ldq_uop_1_edge_inst <= dis_uops_0_bits_edge_inst;
			ldq_uop_1_pc_lob <= dis_uops_0_bits_pc_lob;
			ldq_uop_1_taken <= dis_uops_0_bits_taken;
			ldq_uop_1_imm_rename <= dis_uops_0_bits_imm_rename;
			ldq_uop_1_imm_sel <= dis_uops_0_bits_imm_sel;
			ldq_uop_1_pimm <= dis_uops_0_bits_pimm;
			ldq_uop_1_imm_packed <= dis_uops_0_bits_imm_packed;
			ldq_uop_1_op1_sel <= dis_uops_0_bits_op1_sel;
			ldq_uop_1_op2_sel <= dis_uops_0_bits_op2_sel;
			ldq_uop_1_fp_ctrl_ldst <= dis_uops_0_bits_fp_ctrl_ldst;
			ldq_uop_1_fp_ctrl_wen <= dis_uops_0_bits_fp_ctrl_wen;
			ldq_uop_1_fp_ctrl_ren1 <= dis_uops_0_bits_fp_ctrl_ren1;
			ldq_uop_1_fp_ctrl_ren2 <= dis_uops_0_bits_fp_ctrl_ren2;
			ldq_uop_1_fp_ctrl_ren3 <= dis_uops_0_bits_fp_ctrl_ren3;
			ldq_uop_1_fp_ctrl_swap12 <= dis_uops_0_bits_fp_ctrl_swap12;
			ldq_uop_1_fp_ctrl_swap23 <= dis_uops_0_bits_fp_ctrl_swap23;
			ldq_uop_1_fp_ctrl_typeTagIn <= dis_uops_0_bits_fp_ctrl_typeTagIn;
			ldq_uop_1_fp_ctrl_typeTagOut <= dis_uops_0_bits_fp_ctrl_typeTagOut;
			ldq_uop_1_fp_ctrl_fromint <= dis_uops_0_bits_fp_ctrl_fromint;
			ldq_uop_1_fp_ctrl_toint <= dis_uops_0_bits_fp_ctrl_toint;
			ldq_uop_1_fp_ctrl_fastpipe <= dis_uops_0_bits_fp_ctrl_fastpipe;
			ldq_uop_1_fp_ctrl_fma <= dis_uops_0_bits_fp_ctrl_fma;
			ldq_uop_1_fp_ctrl_div <= dis_uops_0_bits_fp_ctrl_div;
			ldq_uop_1_fp_ctrl_sqrt <= dis_uops_0_bits_fp_ctrl_sqrt;
			ldq_uop_1_fp_ctrl_wflags <= dis_uops_0_bits_fp_ctrl_wflags;
			ldq_uop_1_fp_ctrl_vec <= dis_uops_0_bits_fp_ctrl_vec;
			ldq_uop_1_rob_idx <= dis_uops_0_bits_rob_idx;
			ldq_uop_1_ldq_idx <= dis_uops_0_bits_ldq_idx;
			ldq_uop_1_stq_idx <= dis_uops_0_bits_stq_idx;
			ldq_uop_1_rxq_idx <= dis_uops_0_bits_rxq_idx;
			ldq_uop_1_prs1 <= dis_uops_0_bits_prs1;
			ldq_uop_1_prs2 <= dis_uops_0_bits_prs2;
			ldq_uop_1_prs3 <= dis_uops_0_bits_prs3;
			ldq_uop_1_ppred <= dis_uops_0_bits_ppred;
			ldq_uop_1_prs1_busy <= dis_uops_0_bits_prs1_busy;
			ldq_uop_1_prs2_busy <= dis_uops_0_bits_prs2_busy;
			ldq_uop_1_prs3_busy <= dis_uops_0_bits_prs3_busy;
			ldq_uop_1_ppred_busy <= dis_uops_0_bits_ppred_busy;
			ldq_uop_1_stale_pdst <= dis_uops_0_bits_stale_pdst;
			ldq_uop_1_exc_cause <= dis_uops_0_bits_exc_cause;
			ldq_uop_1_mem_cmd <= dis_uops_0_bits_mem_cmd;
			ldq_uop_1_mem_size <= dis_uops_0_bits_mem_size;
			ldq_uop_1_mem_signed <= dis_uops_0_bits_mem_signed;
			ldq_uop_1_uses_ldq <= dis_uops_0_bits_uses_ldq;
			ldq_uop_1_uses_stq <= dis_uops_0_bits_uses_stq;
			ldq_uop_1_is_unique <= dis_uops_0_bits_is_unique;
			ldq_uop_1_flush_on_commit <= dis_uops_0_bits_flush_on_commit;
			ldq_uop_1_csr_cmd <= dis_uops_0_bits_csr_cmd;
			ldq_uop_1_ldst_is_rs1 <= dis_uops_0_bits_ldst_is_rs1;
			ldq_uop_1_ldst <= dis_uops_0_bits_ldst;
			ldq_uop_1_lrs1 <= dis_uops_0_bits_lrs1;
			ldq_uop_1_lrs2 <= dis_uops_0_bits_lrs2;
			ldq_uop_1_lrs3 <= dis_uops_0_bits_lrs3;
			ldq_uop_1_dst_rtype <= dis_uops_0_bits_dst_rtype;
			ldq_uop_1_lrs1_rtype <= dis_uops_0_bits_lrs1_rtype;
			ldq_uop_1_lrs2_rtype <= dis_uops_0_bits_lrs2_rtype;
			ldq_uop_1_frs3_en <= dis_uops_0_bits_frs3_en;
			ldq_uop_1_fcn_dw <= dis_uops_0_bits_fcn_dw;
			ldq_uop_1_fcn_op <= dis_uops_0_bits_fcn_op;
			ldq_uop_1_fp_val <= dis_uops_0_bits_fp_val;
			ldq_uop_1_fp_rm <= dis_uops_0_bits_fp_rm;
			ldq_uop_1_fp_typ <= dis_uops_0_bits_fp_typ;
			ldq_uop_1_xcpt_pf_if <= dis_uops_0_bits_xcpt_pf_if;
			ldq_uop_1_xcpt_ae_if <= dis_uops_0_bits_xcpt_ae_if;
			ldq_uop_1_xcpt_ma_if <= dis_uops_0_bits_xcpt_ma_if;
			ldq_uop_1_bp_debug_if <= dis_uops_0_bits_bp_debug_if;
			ldq_uop_1_bp_xcpt_if <= dis_uops_0_bits_bp_xcpt_if;
			ldq_uop_1_debug_fsrc <= dis_uops_0_bits_debug_fsrc;
			ldq_uop_1_debug_tsrc <= dis_uops_0_bits_debug_tsrc;
		end
		if (ldq_valid_1)
			ldq_uop_1_br_mask <= ldq_uop_1_br_mask & ~io_core_brupdate_b1_resolve_mask;
		else if (_GEN_9)
			ldq_uop_1_br_mask <= ldq_uop_out_br_mask;
		if (_GEN_498) begin
			if (_exe_cmd_T)
				ldq_uop_1_pdst <= ldq_incoming_e_0_bits_uop_pdst;
			else
				ldq_uop_1_pdst <= _exe_tlb_uop_T_4_pdst;
			ldq_addr_1_bits <= _ldq_addr_bits_T;
			ldq_addr_is_virtual_1 <= exe_tlb_miss_0;
			ldq_addr_is_uncacheable_1 <= _ldq_addr_is_uncacheable_T_1;
			ldq_ld_byte_mask_1 <= _ldq_ld_byte_mask_mask_T_14;
		end
		else if (_GEN_9)
			ldq_uop_1_pdst <= dis_uops_0_bits_pdst;
		ldq_uop_1_exception <= ((mem_xcpt_valids_0 & mem_xcpt_uops_0_uses_ldq) & (mem_xcpt_uops_0_ldq_idx[2:0] == 3'h1)) | (_GEN_9 ? dis_uops_0_bits_exception : ldq_uop_1_exception);
		if (_GEN_10) begin
			ldq_uop_2_inst <= dis_uops_0_bits_inst;
			ldq_uop_2_debug_inst <= dis_uops_0_bits_debug_inst;
			ldq_uop_2_is_rvc <= dis_uops_0_bits_is_rvc;
			ldq_uop_2_debug_pc <= dis_uops_0_bits_debug_pc;
			ldq_uop_2_iq_type_0 <= dis_uops_0_bits_iq_type_0;
			ldq_uop_2_iq_type_1 <= dis_uops_0_bits_iq_type_1;
			ldq_uop_2_iq_type_2 <= dis_uops_0_bits_iq_type_2;
			ldq_uop_2_iq_type_3 <= dis_uops_0_bits_iq_type_3;
			ldq_uop_2_fu_code_0 <= dis_uops_0_bits_fu_code_0;
			ldq_uop_2_fu_code_1 <= dis_uops_0_bits_fu_code_1;
			ldq_uop_2_fu_code_2 <= dis_uops_0_bits_fu_code_2;
			ldq_uop_2_fu_code_3 <= dis_uops_0_bits_fu_code_3;
			ldq_uop_2_fu_code_4 <= dis_uops_0_bits_fu_code_4;
			ldq_uop_2_fu_code_5 <= dis_uops_0_bits_fu_code_5;
			ldq_uop_2_fu_code_6 <= dis_uops_0_bits_fu_code_6;
			ldq_uop_2_fu_code_7 <= dis_uops_0_bits_fu_code_7;
			ldq_uop_2_fu_code_8 <= dis_uops_0_bits_fu_code_8;
			ldq_uop_2_fu_code_9 <= dis_uops_0_bits_fu_code_9;
			ldq_uop_2_iw_issued <= dis_uops_0_bits_iw_issued;
			ldq_uop_2_iw_issued_partial_agen <= dis_uops_0_bits_iw_issued_partial_agen;
			ldq_uop_2_iw_issued_partial_dgen <= dis_uops_0_bits_iw_issued_partial_dgen;
			ldq_uop_2_iw_p1_speculative_child <= dis_uops_0_bits_iw_p1_speculative_child;
			ldq_uop_2_iw_p2_speculative_child <= dis_uops_0_bits_iw_p2_speculative_child;
			ldq_uop_2_iw_p1_bypass_hint <= dis_uops_0_bits_iw_p1_bypass_hint;
			ldq_uop_2_iw_p2_bypass_hint <= dis_uops_0_bits_iw_p2_bypass_hint;
			ldq_uop_2_iw_p3_bypass_hint <= dis_uops_0_bits_iw_p3_bypass_hint;
			ldq_uop_2_br_tag <= dis_uops_0_bits_br_tag;
			ldq_uop_2_br_type <= dis_uops_0_bits_br_type;
			ldq_uop_2_is_sfb <= dis_uops_0_bits_is_sfb;
			ldq_uop_2_is_fence <= dis_uops_0_bits_is_fence;
			ldq_uop_2_is_fencei <= dis_uops_0_bits_is_fencei;
			ldq_uop_2_is_sfence <= dis_uops_0_bits_is_sfence;
			ldq_uop_2_is_amo <= dis_uops_0_bits_is_amo;
			ldq_uop_2_is_eret <= dis_uops_0_bits_is_eret;
			ldq_uop_2_is_sys_pc2epc <= dis_uops_0_bits_is_sys_pc2epc;
			ldq_uop_2_is_rocc <= dis_uops_0_bits_is_rocc;
			ldq_uop_2_is_mov <= dis_uops_0_bits_is_mov;
			ldq_uop_2_ftq_idx <= dis_uops_0_bits_ftq_idx;
			ldq_uop_2_edge_inst <= dis_uops_0_bits_edge_inst;
			ldq_uop_2_pc_lob <= dis_uops_0_bits_pc_lob;
			ldq_uop_2_taken <= dis_uops_0_bits_taken;
			ldq_uop_2_imm_rename <= dis_uops_0_bits_imm_rename;
			ldq_uop_2_imm_sel <= dis_uops_0_bits_imm_sel;
			ldq_uop_2_pimm <= dis_uops_0_bits_pimm;
			ldq_uop_2_imm_packed <= dis_uops_0_bits_imm_packed;
			ldq_uop_2_op1_sel <= dis_uops_0_bits_op1_sel;
			ldq_uop_2_op2_sel <= dis_uops_0_bits_op2_sel;
			ldq_uop_2_fp_ctrl_ldst <= dis_uops_0_bits_fp_ctrl_ldst;
			ldq_uop_2_fp_ctrl_wen <= dis_uops_0_bits_fp_ctrl_wen;
			ldq_uop_2_fp_ctrl_ren1 <= dis_uops_0_bits_fp_ctrl_ren1;
			ldq_uop_2_fp_ctrl_ren2 <= dis_uops_0_bits_fp_ctrl_ren2;
			ldq_uop_2_fp_ctrl_ren3 <= dis_uops_0_bits_fp_ctrl_ren3;
			ldq_uop_2_fp_ctrl_swap12 <= dis_uops_0_bits_fp_ctrl_swap12;
			ldq_uop_2_fp_ctrl_swap23 <= dis_uops_0_bits_fp_ctrl_swap23;
			ldq_uop_2_fp_ctrl_typeTagIn <= dis_uops_0_bits_fp_ctrl_typeTagIn;
			ldq_uop_2_fp_ctrl_typeTagOut <= dis_uops_0_bits_fp_ctrl_typeTagOut;
			ldq_uop_2_fp_ctrl_fromint <= dis_uops_0_bits_fp_ctrl_fromint;
			ldq_uop_2_fp_ctrl_toint <= dis_uops_0_bits_fp_ctrl_toint;
			ldq_uop_2_fp_ctrl_fastpipe <= dis_uops_0_bits_fp_ctrl_fastpipe;
			ldq_uop_2_fp_ctrl_fma <= dis_uops_0_bits_fp_ctrl_fma;
			ldq_uop_2_fp_ctrl_div <= dis_uops_0_bits_fp_ctrl_div;
			ldq_uop_2_fp_ctrl_sqrt <= dis_uops_0_bits_fp_ctrl_sqrt;
			ldq_uop_2_fp_ctrl_wflags <= dis_uops_0_bits_fp_ctrl_wflags;
			ldq_uop_2_fp_ctrl_vec <= dis_uops_0_bits_fp_ctrl_vec;
			ldq_uop_2_rob_idx <= dis_uops_0_bits_rob_idx;
			ldq_uop_2_ldq_idx <= dis_uops_0_bits_ldq_idx;
			ldq_uop_2_stq_idx <= dis_uops_0_bits_stq_idx;
			ldq_uop_2_rxq_idx <= dis_uops_0_bits_rxq_idx;
			ldq_uop_2_prs1 <= dis_uops_0_bits_prs1;
			ldq_uop_2_prs2 <= dis_uops_0_bits_prs2;
			ldq_uop_2_prs3 <= dis_uops_0_bits_prs3;
			ldq_uop_2_ppred <= dis_uops_0_bits_ppred;
			ldq_uop_2_prs1_busy <= dis_uops_0_bits_prs1_busy;
			ldq_uop_2_prs2_busy <= dis_uops_0_bits_prs2_busy;
			ldq_uop_2_prs3_busy <= dis_uops_0_bits_prs3_busy;
			ldq_uop_2_ppred_busy <= dis_uops_0_bits_ppred_busy;
			ldq_uop_2_stale_pdst <= dis_uops_0_bits_stale_pdst;
			ldq_uop_2_exc_cause <= dis_uops_0_bits_exc_cause;
			ldq_uop_2_mem_cmd <= dis_uops_0_bits_mem_cmd;
			ldq_uop_2_mem_size <= dis_uops_0_bits_mem_size;
			ldq_uop_2_mem_signed <= dis_uops_0_bits_mem_signed;
			ldq_uop_2_uses_ldq <= dis_uops_0_bits_uses_ldq;
			ldq_uop_2_uses_stq <= dis_uops_0_bits_uses_stq;
			ldq_uop_2_is_unique <= dis_uops_0_bits_is_unique;
			ldq_uop_2_flush_on_commit <= dis_uops_0_bits_flush_on_commit;
			ldq_uop_2_csr_cmd <= dis_uops_0_bits_csr_cmd;
			ldq_uop_2_ldst_is_rs1 <= dis_uops_0_bits_ldst_is_rs1;
			ldq_uop_2_ldst <= dis_uops_0_bits_ldst;
			ldq_uop_2_lrs1 <= dis_uops_0_bits_lrs1;
			ldq_uop_2_lrs2 <= dis_uops_0_bits_lrs2;
			ldq_uop_2_lrs3 <= dis_uops_0_bits_lrs3;
			ldq_uop_2_dst_rtype <= dis_uops_0_bits_dst_rtype;
			ldq_uop_2_lrs1_rtype <= dis_uops_0_bits_lrs1_rtype;
			ldq_uop_2_lrs2_rtype <= dis_uops_0_bits_lrs2_rtype;
			ldq_uop_2_frs3_en <= dis_uops_0_bits_frs3_en;
			ldq_uop_2_fcn_dw <= dis_uops_0_bits_fcn_dw;
			ldq_uop_2_fcn_op <= dis_uops_0_bits_fcn_op;
			ldq_uop_2_fp_val <= dis_uops_0_bits_fp_val;
			ldq_uop_2_fp_rm <= dis_uops_0_bits_fp_rm;
			ldq_uop_2_fp_typ <= dis_uops_0_bits_fp_typ;
			ldq_uop_2_xcpt_pf_if <= dis_uops_0_bits_xcpt_pf_if;
			ldq_uop_2_xcpt_ae_if <= dis_uops_0_bits_xcpt_ae_if;
			ldq_uop_2_xcpt_ma_if <= dis_uops_0_bits_xcpt_ma_if;
			ldq_uop_2_bp_debug_if <= dis_uops_0_bits_bp_debug_if;
			ldq_uop_2_bp_xcpt_if <= dis_uops_0_bits_bp_xcpt_if;
			ldq_uop_2_debug_fsrc <= dis_uops_0_bits_debug_fsrc;
			ldq_uop_2_debug_tsrc <= dis_uops_0_bits_debug_tsrc;
		end
		if (ldq_valid_2)
			ldq_uop_2_br_mask <= ldq_uop_2_br_mask & ~io_core_brupdate_b1_resolve_mask;
		else if (_GEN_10)
			ldq_uop_2_br_mask <= ldq_uop_out_br_mask;
		if (_GEN_499) begin
			if (_exe_cmd_T)
				ldq_uop_2_pdst <= ldq_incoming_e_0_bits_uop_pdst;
			else
				ldq_uop_2_pdst <= _exe_tlb_uop_T_4_pdst;
			ldq_addr_2_bits <= _ldq_addr_bits_T;
			ldq_addr_is_virtual_2 <= exe_tlb_miss_0;
			ldq_addr_is_uncacheable_2 <= _ldq_addr_is_uncacheable_T_1;
			ldq_ld_byte_mask_2 <= _ldq_ld_byte_mask_mask_T_14;
		end
		else if (_GEN_10)
			ldq_uop_2_pdst <= dis_uops_0_bits_pdst;
		ldq_uop_2_exception <= ((mem_xcpt_valids_0 & mem_xcpt_uops_0_uses_ldq) & (mem_xcpt_uops_0_ldq_idx[2:0] == 3'h2)) | (_GEN_10 ? dis_uops_0_bits_exception : ldq_uop_2_exception);
		if (_GEN_11) begin
			ldq_uop_3_inst <= dis_uops_0_bits_inst;
			ldq_uop_3_debug_inst <= dis_uops_0_bits_debug_inst;
			ldq_uop_3_is_rvc <= dis_uops_0_bits_is_rvc;
			ldq_uop_3_debug_pc <= dis_uops_0_bits_debug_pc;
			ldq_uop_3_iq_type_0 <= dis_uops_0_bits_iq_type_0;
			ldq_uop_3_iq_type_1 <= dis_uops_0_bits_iq_type_1;
			ldq_uop_3_iq_type_2 <= dis_uops_0_bits_iq_type_2;
			ldq_uop_3_iq_type_3 <= dis_uops_0_bits_iq_type_3;
			ldq_uop_3_fu_code_0 <= dis_uops_0_bits_fu_code_0;
			ldq_uop_3_fu_code_1 <= dis_uops_0_bits_fu_code_1;
			ldq_uop_3_fu_code_2 <= dis_uops_0_bits_fu_code_2;
			ldq_uop_3_fu_code_3 <= dis_uops_0_bits_fu_code_3;
			ldq_uop_3_fu_code_4 <= dis_uops_0_bits_fu_code_4;
			ldq_uop_3_fu_code_5 <= dis_uops_0_bits_fu_code_5;
			ldq_uop_3_fu_code_6 <= dis_uops_0_bits_fu_code_6;
			ldq_uop_3_fu_code_7 <= dis_uops_0_bits_fu_code_7;
			ldq_uop_3_fu_code_8 <= dis_uops_0_bits_fu_code_8;
			ldq_uop_3_fu_code_9 <= dis_uops_0_bits_fu_code_9;
			ldq_uop_3_iw_issued <= dis_uops_0_bits_iw_issued;
			ldq_uop_3_iw_issued_partial_agen <= dis_uops_0_bits_iw_issued_partial_agen;
			ldq_uop_3_iw_issued_partial_dgen <= dis_uops_0_bits_iw_issued_partial_dgen;
			ldq_uop_3_iw_p1_speculative_child <= dis_uops_0_bits_iw_p1_speculative_child;
			ldq_uop_3_iw_p2_speculative_child <= dis_uops_0_bits_iw_p2_speculative_child;
			ldq_uop_3_iw_p1_bypass_hint <= dis_uops_0_bits_iw_p1_bypass_hint;
			ldq_uop_3_iw_p2_bypass_hint <= dis_uops_0_bits_iw_p2_bypass_hint;
			ldq_uop_3_iw_p3_bypass_hint <= dis_uops_0_bits_iw_p3_bypass_hint;
			ldq_uop_3_br_tag <= dis_uops_0_bits_br_tag;
			ldq_uop_3_br_type <= dis_uops_0_bits_br_type;
			ldq_uop_3_is_sfb <= dis_uops_0_bits_is_sfb;
			ldq_uop_3_is_fence <= dis_uops_0_bits_is_fence;
			ldq_uop_3_is_fencei <= dis_uops_0_bits_is_fencei;
			ldq_uop_3_is_sfence <= dis_uops_0_bits_is_sfence;
			ldq_uop_3_is_amo <= dis_uops_0_bits_is_amo;
			ldq_uop_3_is_eret <= dis_uops_0_bits_is_eret;
			ldq_uop_3_is_sys_pc2epc <= dis_uops_0_bits_is_sys_pc2epc;
			ldq_uop_3_is_rocc <= dis_uops_0_bits_is_rocc;
			ldq_uop_3_is_mov <= dis_uops_0_bits_is_mov;
			ldq_uop_3_ftq_idx <= dis_uops_0_bits_ftq_idx;
			ldq_uop_3_edge_inst <= dis_uops_0_bits_edge_inst;
			ldq_uop_3_pc_lob <= dis_uops_0_bits_pc_lob;
			ldq_uop_3_taken <= dis_uops_0_bits_taken;
			ldq_uop_3_imm_rename <= dis_uops_0_bits_imm_rename;
			ldq_uop_3_imm_sel <= dis_uops_0_bits_imm_sel;
			ldq_uop_3_pimm <= dis_uops_0_bits_pimm;
			ldq_uop_3_imm_packed <= dis_uops_0_bits_imm_packed;
			ldq_uop_3_op1_sel <= dis_uops_0_bits_op1_sel;
			ldq_uop_3_op2_sel <= dis_uops_0_bits_op2_sel;
			ldq_uop_3_fp_ctrl_ldst <= dis_uops_0_bits_fp_ctrl_ldst;
			ldq_uop_3_fp_ctrl_wen <= dis_uops_0_bits_fp_ctrl_wen;
			ldq_uop_3_fp_ctrl_ren1 <= dis_uops_0_bits_fp_ctrl_ren1;
			ldq_uop_3_fp_ctrl_ren2 <= dis_uops_0_bits_fp_ctrl_ren2;
			ldq_uop_3_fp_ctrl_ren3 <= dis_uops_0_bits_fp_ctrl_ren3;
			ldq_uop_3_fp_ctrl_swap12 <= dis_uops_0_bits_fp_ctrl_swap12;
			ldq_uop_3_fp_ctrl_swap23 <= dis_uops_0_bits_fp_ctrl_swap23;
			ldq_uop_3_fp_ctrl_typeTagIn <= dis_uops_0_bits_fp_ctrl_typeTagIn;
			ldq_uop_3_fp_ctrl_typeTagOut <= dis_uops_0_bits_fp_ctrl_typeTagOut;
			ldq_uop_3_fp_ctrl_fromint <= dis_uops_0_bits_fp_ctrl_fromint;
			ldq_uop_3_fp_ctrl_toint <= dis_uops_0_bits_fp_ctrl_toint;
			ldq_uop_3_fp_ctrl_fastpipe <= dis_uops_0_bits_fp_ctrl_fastpipe;
			ldq_uop_3_fp_ctrl_fma <= dis_uops_0_bits_fp_ctrl_fma;
			ldq_uop_3_fp_ctrl_div <= dis_uops_0_bits_fp_ctrl_div;
			ldq_uop_3_fp_ctrl_sqrt <= dis_uops_0_bits_fp_ctrl_sqrt;
			ldq_uop_3_fp_ctrl_wflags <= dis_uops_0_bits_fp_ctrl_wflags;
			ldq_uop_3_fp_ctrl_vec <= dis_uops_0_bits_fp_ctrl_vec;
			ldq_uop_3_rob_idx <= dis_uops_0_bits_rob_idx;
			ldq_uop_3_ldq_idx <= dis_uops_0_bits_ldq_idx;
			ldq_uop_3_stq_idx <= dis_uops_0_bits_stq_idx;
			ldq_uop_3_rxq_idx <= dis_uops_0_bits_rxq_idx;
			ldq_uop_3_prs1 <= dis_uops_0_bits_prs1;
			ldq_uop_3_prs2 <= dis_uops_0_bits_prs2;
			ldq_uop_3_prs3 <= dis_uops_0_bits_prs3;
			ldq_uop_3_ppred <= dis_uops_0_bits_ppred;
			ldq_uop_3_prs1_busy <= dis_uops_0_bits_prs1_busy;
			ldq_uop_3_prs2_busy <= dis_uops_0_bits_prs2_busy;
			ldq_uop_3_prs3_busy <= dis_uops_0_bits_prs3_busy;
			ldq_uop_3_ppred_busy <= dis_uops_0_bits_ppred_busy;
			ldq_uop_3_stale_pdst <= dis_uops_0_bits_stale_pdst;
			ldq_uop_3_exc_cause <= dis_uops_0_bits_exc_cause;
			ldq_uop_3_mem_cmd <= dis_uops_0_bits_mem_cmd;
			ldq_uop_3_mem_size <= dis_uops_0_bits_mem_size;
			ldq_uop_3_mem_signed <= dis_uops_0_bits_mem_signed;
			ldq_uop_3_uses_ldq <= dis_uops_0_bits_uses_ldq;
			ldq_uop_3_uses_stq <= dis_uops_0_bits_uses_stq;
			ldq_uop_3_is_unique <= dis_uops_0_bits_is_unique;
			ldq_uop_3_flush_on_commit <= dis_uops_0_bits_flush_on_commit;
			ldq_uop_3_csr_cmd <= dis_uops_0_bits_csr_cmd;
			ldq_uop_3_ldst_is_rs1 <= dis_uops_0_bits_ldst_is_rs1;
			ldq_uop_3_ldst <= dis_uops_0_bits_ldst;
			ldq_uop_3_lrs1 <= dis_uops_0_bits_lrs1;
			ldq_uop_3_lrs2 <= dis_uops_0_bits_lrs2;
			ldq_uop_3_lrs3 <= dis_uops_0_bits_lrs3;
			ldq_uop_3_dst_rtype <= dis_uops_0_bits_dst_rtype;
			ldq_uop_3_lrs1_rtype <= dis_uops_0_bits_lrs1_rtype;
			ldq_uop_3_lrs2_rtype <= dis_uops_0_bits_lrs2_rtype;
			ldq_uop_3_frs3_en <= dis_uops_0_bits_frs3_en;
			ldq_uop_3_fcn_dw <= dis_uops_0_bits_fcn_dw;
			ldq_uop_3_fcn_op <= dis_uops_0_bits_fcn_op;
			ldq_uop_3_fp_val <= dis_uops_0_bits_fp_val;
			ldq_uop_3_fp_rm <= dis_uops_0_bits_fp_rm;
			ldq_uop_3_fp_typ <= dis_uops_0_bits_fp_typ;
			ldq_uop_3_xcpt_pf_if <= dis_uops_0_bits_xcpt_pf_if;
			ldq_uop_3_xcpt_ae_if <= dis_uops_0_bits_xcpt_ae_if;
			ldq_uop_3_xcpt_ma_if <= dis_uops_0_bits_xcpt_ma_if;
			ldq_uop_3_bp_debug_if <= dis_uops_0_bits_bp_debug_if;
			ldq_uop_3_bp_xcpt_if <= dis_uops_0_bits_bp_xcpt_if;
			ldq_uop_3_debug_fsrc <= dis_uops_0_bits_debug_fsrc;
			ldq_uop_3_debug_tsrc <= dis_uops_0_bits_debug_tsrc;
		end
		if (ldq_valid_3)
			ldq_uop_3_br_mask <= ldq_uop_3_br_mask & ~io_core_brupdate_b1_resolve_mask;
		else if (_GEN_11)
			ldq_uop_3_br_mask <= ldq_uop_out_br_mask;
		if (_GEN_500) begin
			if (_exe_cmd_T)
				ldq_uop_3_pdst <= ldq_incoming_e_0_bits_uop_pdst;
			else
				ldq_uop_3_pdst <= _exe_tlb_uop_T_4_pdst;
			ldq_addr_3_bits <= _ldq_addr_bits_T;
			ldq_addr_is_virtual_3 <= exe_tlb_miss_0;
			ldq_addr_is_uncacheable_3 <= _ldq_addr_is_uncacheable_T_1;
			ldq_ld_byte_mask_3 <= _ldq_ld_byte_mask_mask_T_14;
		end
		else if (_GEN_11)
			ldq_uop_3_pdst <= dis_uops_0_bits_pdst;
		ldq_uop_3_exception <= ((mem_xcpt_valids_0 & mem_xcpt_uops_0_uses_ldq) & (mem_xcpt_uops_0_ldq_idx[2:0] == 3'h3)) | (_GEN_11 ? dis_uops_0_bits_exception : ldq_uop_3_exception);
		if (_GEN_12) begin
			ldq_uop_4_inst <= dis_uops_0_bits_inst;
			ldq_uop_4_debug_inst <= dis_uops_0_bits_debug_inst;
			ldq_uop_4_is_rvc <= dis_uops_0_bits_is_rvc;
			ldq_uop_4_debug_pc <= dis_uops_0_bits_debug_pc;
			ldq_uop_4_iq_type_0 <= dis_uops_0_bits_iq_type_0;
			ldq_uop_4_iq_type_1 <= dis_uops_0_bits_iq_type_1;
			ldq_uop_4_iq_type_2 <= dis_uops_0_bits_iq_type_2;
			ldq_uop_4_iq_type_3 <= dis_uops_0_bits_iq_type_3;
			ldq_uop_4_fu_code_0 <= dis_uops_0_bits_fu_code_0;
			ldq_uop_4_fu_code_1 <= dis_uops_0_bits_fu_code_1;
			ldq_uop_4_fu_code_2 <= dis_uops_0_bits_fu_code_2;
			ldq_uop_4_fu_code_3 <= dis_uops_0_bits_fu_code_3;
			ldq_uop_4_fu_code_4 <= dis_uops_0_bits_fu_code_4;
			ldq_uop_4_fu_code_5 <= dis_uops_0_bits_fu_code_5;
			ldq_uop_4_fu_code_6 <= dis_uops_0_bits_fu_code_6;
			ldq_uop_4_fu_code_7 <= dis_uops_0_bits_fu_code_7;
			ldq_uop_4_fu_code_8 <= dis_uops_0_bits_fu_code_8;
			ldq_uop_4_fu_code_9 <= dis_uops_0_bits_fu_code_9;
			ldq_uop_4_iw_issued <= dis_uops_0_bits_iw_issued;
			ldq_uop_4_iw_issued_partial_agen <= dis_uops_0_bits_iw_issued_partial_agen;
			ldq_uop_4_iw_issued_partial_dgen <= dis_uops_0_bits_iw_issued_partial_dgen;
			ldq_uop_4_iw_p1_speculative_child <= dis_uops_0_bits_iw_p1_speculative_child;
			ldq_uop_4_iw_p2_speculative_child <= dis_uops_0_bits_iw_p2_speculative_child;
			ldq_uop_4_iw_p1_bypass_hint <= dis_uops_0_bits_iw_p1_bypass_hint;
			ldq_uop_4_iw_p2_bypass_hint <= dis_uops_0_bits_iw_p2_bypass_hint;
			ldq_uop_4_iw_p3_bypass_hint <= dis_uops_0_bits_iw_p3_bypass_hint;
			ldq_uop_4_br_tag <= dis_uops_0_bits_br_tag;
			ldq_uop_4_br_type <= dis_uops_0_bits_br_type;
			ldq_uop_4_is_sfb <= dis_uops_0_bits_is_sfb;
			ldq_uop_4_is_fence <= dis_uops_0_bits_is_fence;
			ldq_uop_4_is_fencei <= dis_uops_0_bits_is_fencei;
			ldq_uop_4_is_sfence <= dis_uops_0_bits_is_sfence;
			ldq_uop_4_is_amo <= dis_uops_0_bits_is_amo;
			ldq_uop_4_is_eret <= dis_uops_0_bits_is_eret;
			ldq_uop_4_is_sys_pc2epc <= dis_uops_0_bits_is_sys_pc2epc;
			ldq_uop_4_is_rocc <= dis_uops_0_bits_is_rocc;
			ldq_uop_4_is_mov <= dis_uops_0_bits_is_mov;
			ldq_uop_4_ftq_idx <= dis_uops_0_bits_ftq_idx;
			ldq_uop_4_edge_inst <= dis_uops_0_bits_edge_inst;
			ldq_uop_4_pc_lob <= dis_uops_0_bits_pc_lob;
			ldq_uop_4_taken <= dis_uops_0_bits_taken;
			ldq_uop_4_imm_rename <= dis_uops_0_bits_imm_rename;
			ldq_uop_4_imm_sel <= dis_uops_0_bits_imm_sel;
			ldq_uop_4_pimm <= dis_uops_0_bits_pimm;
			ldq_uop_4_imm_packed <= dis_uops_0_bits_imm_packed;
			ldq_uop_4_op1_sel <= dis_uops_0_bits_op1_sel;
			ldq_uop_4_op2_sel <= dis_uops_0_bits_op2_sel;
			ldq_uop_4_fp_ctrl_ldst <= dis_uops_0_bits_fp_ctrl_ldst;
			ldq_uop_4_fp_ctrl_wen <= dis_uops_0_bits_fp_ctrl_wen;
			ldq_uop_4_fp_ctrl_ren1 <= dis_uops_0_bits_fp_ctrl_ren1;
			ldq_uop_4_fp_ctrl_ren2 <= dis_uops_0_bits_fp_ctrl_ren2;
			ldq_uop_4_fp_ctrl_ren3 <= dis_uops_0_bits_fp_ctrl_ren3;
			ldq_uop_4_fp_ctrl_swap12 <= dis_uops_0_bits_fp_ctrl_swap12;
			ldq_uop_4_fp_ctrl_swap23 <= dis_uops_0_bits_fp_ctrl_swap23;
			ldq_uop_4_fp_ctrl_typeTagIn <= dis_uops_0_bits_fp_ctrl_typeTagIn;
			ldq_uop_4_fp_ctrl_typeTagOut <= dis_uops_0_bits_fp_ctrl_typeTagOut;
			ldq_uop_4_fp_ctrl_fromint <= dis_uops_0_bits_fp_ctrl_fromint;
			ldq_uop_4_fp_ctrl_toint <= dis_uops_0_bits_fp_ctrl_toint;
			ldq_uop_4_fp_ctrl_fastpipe <= dis_uops_0_bits_fp_ctrl_fastpipe;
			ldq_uop_4_fp_ctrl_fma <= dis_uops_0_bits_fp_ctrl_fma;
			ldq_uop_4_fp_ctrl_div <= dis_uops_0_bits_fp_ctrl_div;
			ldq_uop_4_fp_ctrl_sqrt <= dis_uops_0_bits_fp_ctrl_sqrt;
			ldq_uop_4_fp_ctrl_wflags <= dis_uops_0_bits_fp_ctrl_wflags;
			ldq_uop_4_fp_ctrl_vec <= dis_uops_0_bits_fp_ctrl_vec;
			ldq_uop_4_rob_idx <= dis_uops_0_bits_rob_idx;
			ldq_uop_4_ldq_idx <= dis_uops_0_bits_ldq_idx;
			ldq_uop_4_stq_idx <= dis_uops_0_bits_stq_idx;
			ldq_uop_4_rxq_idx <= dis_uops_0_bits_rxq_idx;
			ldq_uop_4_prs1 <= dis_uops_0_bits_prs1;
			ldq_uop_4_prs2 <= dis_uops_0_bits_prs2;
			ldq_uop_4_prs3 <= dis_uops_0_bits_prs3;
			ldq_uop_4_ppred <= dis_uops_0_bits_ppred;
			ldq_uop_4_prs1_busy <= dis_uops_0_bits_prs1_busy;
			ldq_uop_4_prs2_busy <= dis_uops_0_bits_prs2_busy;
			ldq_uop_4_prs3_busy <= dis_uops_0_bits_prs3_busy;
			ldq_uop_4_ppred_busy <= dis_uops_0_bits_ppred_busy;
			ldq_uop_4_stale_pdst <= dis_uops_0_bits_stale_pdst;
			ldq_uop_4_exc_cause <= dis_uops_0_bits_exc_cause;
			ldq_uop_4_mem_cmd <= dis_uops_0_bits_mem_cmd;
			ldq_uop_4_mem_size <= dis_uops_0_bits_mem_size;
			ldq_uop_4_mem_signed <= dis_uops_0_bits_mem_signed;
			ldq_uop_4_uses_ldq <= dis_uops_0_bits_uses_ldq;
			ldq_uop_4_uses_stq <= dis_uops_0_bits_uses_stq;
			ldq_uop_4_is_unique <= dis_uops_0_bits_is_unique;
			ldq_uop_4_flush_on_commit <= dis_uops_0_bits_flush_on_commit;
			ldq_uop_4_csr_cmd <= dis_uops_0_bits_csr_cmd;
			ldq_uop_4_ldst_is_rs1 <= dis_uops_0_bits_ldst_is_rs1;
			ldq_uop_4_ldst <= dis_uops_0_bits_ldst;
			ldq_uop_4_lrs1 <= dis_uops_0_bits_lrs1;
			ldq_uop_4_lrs2 <= dis_uops_0_bits_lrs2;
			ldq_uop_4_lrs3 <= dis_uops_0_bits_lrs3;
			ldq_uop_4_dst_rtype <= dis_uops_0_bits_dst_rtype;
			ldq_uop_4_lrs1_rtype <= dis_uops_0_bits_lrs1_rtype;
			ldq_uop_4_lrs2_rtype <= dis_uops_0_bits_lrs2_rtype;
			ldq_uop_4_frs3_en <= dis_uops_0_bits_frs3_en;
			ldq_uop_4_fcn_dw <= dis_uops_0_bits_fcn_dw;
			ldq_uop_4_fcn_op <= dis_uops_0_bits_fcn_op;
			ldq_uop_4_fp_val <= dis_uops_0_bits_fp_val;
			ldq_uop_4_fp_rm <= dis_uops_0_bits_fp_rm;
			ldq_uop_4_fp_typ <= dis_uops_0_bits_fp_typ;
			ldq_uop_4_xcpt_pf_if <= dis_uops_0_bits_xcpt_pf_if;
			ldq_uop_4_xcpt_ae_if <= dis_uops_0_bits_xcpt_ae_if;
			ldq_uop_4_xcpt_ma_if <= dis_uops_0_bits_xcpt_ma_if;
			ldq_uop_4_bp_debug_if <= dis_uops_0_bits_bp_debug_if;
			ldq_uop_4_bp_xcpt_if <= dis_uops_0_bits_bp_xcpt_if;
			ldq_uop_4_debug_fsrc <= dis_uops_0_bits_debug_fsrc;
			ldq_uop_4_debug_tsrc <= dis_uops_0_bits_debug_tsrc;
		end
		if (ldq_valid_4)
			ldq_uop_4_br_mask <= ldq_uop_4_br_mask & ~io_core_brupdate_b1_resolve_mask;
		else if (_GEN_12)
			ldq_uop_4_br_mask <= ldq_uop_out_br_mask;
		if (_GEN_501) begin
			if (_exe_cmd_T)
				ldq_uop_4_pdst <= ldq_incoming_e_0_bits_uop_pdst;
			else
				ldq_uop_4_pdst <= _exe_tlb_uop_T_4_pdst;
			ldq_addr_4_bits <= _ldq_addr_bits_T;
			ldq_addr_is_virtual_4 <= exe_tlb_miss_0;
			ldq_addr_is_uncacheable_4 <= _ldq_addr_is_uncacheable_T_1;
			ldq_ld_byte_mask_4 <= _ldq_ld_byte_mask_mask_T_14;
		end
		else if (_GEN_12)
			ldq_uop_4_pdst <= dis_uops_0_bits_pdst;
		ldq_uop_4_exception <= ((mem_xcpt_valids_0 & mem_xcpt_uops_0_uses_ldq) & (mem_xcpt_uops_0_ldq_idx[2:0] == 3'h4)) | (_GEN_12 ? dis_uops_0_bits_exception : ldq_uop_4_exception);
		if (_GEN_13) begin
			ldq_uop_5_inst <= dis_uops_0_bits_inst;
			ldq_uop_5_debug_inst <= dis_uops_0_bits_debug_inst;
			ldq_uop_5_is_rvc <= dis_uops_0_bits_is_rvc;
			ldq_uop_5_debug_pc <= dis_uops_0_bits_debug_pc;
			ldq_uop_5_iq_type_0 <= dis_uops_0_bits_iq_type_0;
			ldq_uop_5_iq_type_1 <= dis_uops_0_bits_iq_type_1;
			ldq_uop_5_iq_type_2 <= dis_uops_0_bits_iq_type_2;
			ldq_uop_5_iq_type_3 <= dis_uops_0_bits_iq_type_3;
			ldq_uop_5_fu_code_0 <= dis_uops_0_bits_fu_code_0;
			ldq_uop_5_fu_code_1 <= dis_uops_0_bits_fu_code_1;
			ldq_uop_5_fu_code_2 <= dis_uops_0_bits_fu_code_2;
			ldq_uop_5_fu_code_3 <= dis_uops_0_bits_fu_code_3;
			ldq_uop_5_fu_code_4 <= dis_uops_0_bits_fu_code_4;
			ldq_uop_5_fu_code_5 <= dis_uops_0_bits_fu_code_5;
			ldq_uop_5_fu_code_6 <= dis_uops_0_bits_fu_code_6;
			ldq_uop_5_fu_code_7 <= dis_uops_0_bits_fu_code_7;
			ldq_uop_5_fu_code_8 <= dis_uops_0_bits_fu_code_8;
			ldq_uop_5_fu_code_9 <= dis_uops_0_bits_fu_code_9;
			ldq_uop_5_iw_issued <= dis_uops_0_bits_iw_issued;
			ldq_uop_5_iw_issued_partial_agen <= dis_uops_0_bits_iw_issued_partial_agen;
			ldq_uop_5_iw_issued_partial_dgen <= dis_uops_0_bits_iw_issued_partial_dgen;
			ldq_uop_5_iw_p1_speculative_child <= dis_uops_0_bits_iw_p1_speculative_child;
			ldq_uop_5_iw_p2_speculative_child <= dis_uops_0_bits_iw_p2_speculative_child;
			ldq_uop_5_iw_p1_bypass_hint <= dis_uops_0_bits_iw_p1_bypass_hint;
			ldq_uop_5_iw_p2_bypass_hint <= dis_uops_0_bits_iw_p2_bypass_hint;
			ldq_uop_5_iw_p3_bypass_hint <= dis_uops_0_bits_iw_p3_bypass_hint;
			ldq_uop_5_br_tag <= dis_uops_0_bits_br_tag;
			ldq_uop_5_br_type <= dis_uops_0_bits_br_type;
			ldq_uop_5_is_sfb <= dis_uops_0_bits_is_sfb;
			ldq_uop_5_is_fence <= dis_uops_0_bits_is_fence;
			ldq_uop_5_is_fencei <= dis_uops_0_bits_is_fencei;
			ldq_uop_5_is_sfence <= dis_uops_0_bits_is_sfence;
			ldq_uop_5_is_amo <= dis_uops_0_bits_is_amo;
			ldq_uop_5_is_eret <= dis_uops_0_bits_is_eret;
			ldq_uop_5_is_sys_pc2epc <= dis_uops_0_bits_is_sys_pc2epc;
			ldq_uop_5_is_rocc <= dis_uops_0_bits_is_rocc;
			ldq_uop_5_is_mov <= dis_uops_0_bits_is_mov;
			ldq_uop_5_ftq_idx <= dis_uops_0_bits_ftq_idx;
			ldq_uop_5_edge_inst <= dis_uops_0_bits_edge_inst;
			ldq_uop_5_pc_lob <= dis_uops_0_bits_pc_lob;
			ldq_uop_5_taken <= dis_uops_0_bits_taken;
			ldq_uop_5_imm_rename <= dis_uops_0_bits_imm_rename;
			ldq_uop_5_imm_sel <= dis_uops_0_bits_imm_sel;
			ldq_uop_5_pimm <= dis_uops_0_bits_pimm;
			ldq_uop_5_imm_packed <= dis_uops_0_bits_imm_packed;
			ldq_uop_5_op1_sel <= dis_uops_0_bits_op1_sel;
			ldq_uop_5_op2_sel <= dis_uops_0_bits_op2_sel;
			ldq_uop_5_fp_ctrl_ldst <= dis_uops_0_bits_fp_ctrl_ldst;
			ldq_uop_5_fp_ctrl_wen <= dis_uops_0_bits_fp_ctrl_wen;
			ldq_uop_5_fp_ctrl_ren1 <= dis_uops_0_bits_fp_ctrl_ren1;
			ldq_uop_5_fp_ctrl_ren2 <= dis_uops_0_bits_fp_ctrl_ren2;
			ldq_uop_5_fp_ctrl_ren3 <= dis_uops_0_bits_fp_ctrl_ren3;
			ldq_uop_5_fp_ctrl_swap12 <= dis_uops_0_bits_fp_ctrl_swap12;
			ldq_uop_5_fp_ctrl_swap23 <= dis_uops_0_bits_fp_ctrl_swap23;
			ldq_uop_5_fp_ctrl_typeTagIn <= dis_uops_0_bits_fp_ctrl_typeTagIn;
			ldq_uop_5_fp_ctrl_typeTagOut <= dis_uops_0_bits_fp_ctrl_typeTagOut;
			ldq_uop_5_fp_ctrl_fromint <= dis_uops_0_bits_fp_ctrl_fromint;
			ldq_uop_5_fp_ctrl_toint <= dis_uops_0_bits_fp_ctrl_toint;
			ldq_uop_5_fp_ctrl_fastpipe <= dis_uops_0_bits_fp_ctrl_fastpipe;
			ldq_uop_5_fp_ctrl_fma <= dis_uops_0_bits_fp_ctrl_fma;
			ldq_uop_5_fp_ctrl_div <= dis_uops_0_bits_fp_ctrl_div;
			ldq_uop_5_fp_ctrl_sqrt <= dis_uops_0_bits_fp_ctrl_sqrt;
			ldq_uop_5_fp_ctrl_wflags <= dis_uops_0_bits_fp_ctrl_wflags;
			ldq_uop_5_fp_ctrl_vec <= dis_uops_0_bits_fp_ctrl_vec;
			ldq_uop_5_rob_idx <= dis_uops_0_bits_rob_idx;
			ldq_uop_5_ldq_idx <= dis_uops_0_bits_ldq_idx;
			ldq_uop_5_stq_idx <= dis_uops_0_bits_stq_idx;
			ldq_uop_5_rxq_idx <= dis_uops_0_bits_rxq_idx;
			ldq_uop_5_prs1 <= dis_uops_0_bits_prs1;
			ldq_uop_5_prs2 <= dis_uops_0_bits_prs2;
			ldq_uop_5_prs3 <= dis_uops_0_bits_prs3;
			ldq_uop_5_ppred <= dis_uops_0_bits_ppred;
			ldq_uop_5_prs1_busy <= dis_uops_0_bits_prs1_busy;
			ldq_uop_5_prs2_busy <= dis_uops_0_bits_prs2_busy;
			ldq_uop_5_prs3_busy <= dis_uops_0_bits_prs3_busy;
			ldq_uop_5_ppred_busy <= dis_uops_0_bits_ppred_busy;
			ldq_uop_5_stale_pdst <= dis_uops_0_bits_stale_pdst;
			ldq_uop_5_exc_cause <= dis_uops_0_bits_exc_cause;
			ldq_uop_5_mem_cmd <= dis_uops_0_bits_mem_cmd;
			ldq_uop_5_mem_size <= dis_uops_0_bits_mem_size;
			ldq_uop_5_mem_signed <= dis_uops_0_bits_mem_signed;
			ldq_uop_5_uses_ldq <= dis_uops_0_bits_uses_ldq;
			ldq_uop_5_uses_stq <= dis_uops_0_bits_uses_stq;
			ldq_uop_5_is_unique <= dis_uops_0_bits_is_unique;
			ldq_uop_5_flush_on_commit <= dis_uops_0_bits_flush_on_commit;
			ldq_uop_5_csr_cmd <= dis_uops_0_bits_csr_cmd;
			ldq_uop_5_ldst_is_rs1 <= dis_uops_0_bits_ldst_is_rs1;
			ldq_uop_5_ldst <= dis_uops_0_bits_ldst;
			ldq_uop_5_lrs1 <= dis_uops_0_bits_lrs1;
			ldq_uop_5_lrs2 <= dis_uops_0_bits_lrs2;
			ldq_uop_5_lrs3 <= dis_uops_0_bits_lrs3;
			ldq_uop_5_dst_rtype <= dis_uops_0_bits_dst_rtype;
			ldq_uop_5_lrs1_rtype <= dis_uops_0_bits_lrs1_rtype;
			ldq_uop_5_lrs2_rtype <= dis_uops_0_bits_lrs2_rtype;
			ldq_uop_5_frs3_en <= dis_uops_0_bits_frs3_en;
			ldq_uop_5_fcn_dw <= dis_uops_0_bits_fcn_dw;
			ldq_uop_5_fcn_op <= dis_uops_0_bits_fcn_op;
			ldq_uop_5_fp_val <= dis_uops_0_bits_fp_val;
			ldq_uop_5_fp_rm <= dis_uops_0_bits_fp_rm;
			ldq_uop_5_fp_typ <= dis_uops_0_bits_fp_typ;
			ldq_uop_5_xcpt_pf_if <= dis_uops_0_bits_xcpt_pf_if;
			ldq_uop_5_xcpt_ae_if <= dis_uops_0_bits_xcpt_ae_if;
			ldq_uop_5_xcpt_ma_if <= dis_uops_0_bits_xcpt_ma_if;
			ldq_uop_5_bp_debug_if <= dis_uops_0_bits_bp_debug_if;
			ldq_uop_5_bp_xcpt_if <= dis_uops_0_bits_bp_xcpt_if;
			ldq_uop_5_debug_fsrc <= dis_uops_0_bits_debug_fsrc;
			ldq_uop_5_debug_tsrc <= dis_uops_0_bits_debug_tsrc;
		end
		if (ldq_valid_5)
			ldq_uop_5_br_mask <= ldq_uop_5_br_mask & ~io_core_brupdate_b1_resolve_mask;
		else if (_GEN_13)
			ldq_uop_5_br_mask <= ldq_uop_out_br_mask;
		if (_GEN_502) begin
			if (_exe_cmd_T)
				ldq_uop_5_pdst <= ldq_incoming_e_0_bits_uop_pdst;
			else
				ldq_uop_5_pdst <= _exe_tlb_uop_T_4_pdst;
			ldq_addr_5_bits <= _ldq_addr_bits_T;
			ldq_addr_is_virtual_5 <= exe_tlb_miss_0;
			ldq_addr_is_uncacheable_5 <= _ldq_addr_is_uncacheable_T_1;
			ldq_ld_byte_mask_5 <= _ldq_ld_byte_mask_mask_T_14;
		end
		else if (_GEN_13)
			ldq_uop_5_pdst <= dis_uops_0_bits_pdst;
		ldq_uop_5_exception <= ((mem_xcpt_valids_0 & mem_xcpt_uops_0_uses_ldq) & (mem_xcpt_uops_0_ldq_idx[2:0] == 3'h5)) | (_GEN_13 ? dis_uops_0_bits_exception : ldq_uop_5_exception);
		if (_GEN_14) begin
			ldq_uop_6_inst <= dis_uops_0_bits_inst;
			ldq_uop_6_debug_inst <= dis_uops_0_bits_debug_inst;
			ldq_uop_6_is_rvc <= dis_uops_0_bits_is_rvc;
			ldq_uop_6_debug_pc <= dis_uops_0_bits_debug_pc;
			ldq_uop_6_iq_type_0 <= dis_uops_0_bits_iq_type_0;
			ldq_uop_6_iq_type_1 <= dis_uops_0_bits_iq_type_1;
			ldq_uop_6_iq_type_2 <= dis_uops_0_bits_iq_type_2;
			ldq_uop_6_iq_type_3 <= dis_uops_0_bits_iq_type_3;
			ldq_uop_6_fu_code_0 <= dis_uops_0_bits_fu_code_0;
			ldq_uop_6_fu_code_1 <= dis_uops_0_bits_fu_code_1;
			ldq_uop_6_fu_code_2 <= dis_uops_0_bits_fu_code_2;
			ldq_uop_6_fu_code_3 <= dis_uops_0_bits_fu_code_3;
			ldq_uop_6_fu_code_4 <= dis_uops_0_bits_fu_code_4;
			ldq_uop_6_fu_code_5 <= dis_uops_0_bits_fu_code_5;
			ldq_uop_6_fu_code_6 <= dis_uops_0_bits_fu_code_6;
			ldq_uop_6_fu_code_7 <= dis_uops_0_bits_fu_code_7;
			ldq_uop_6_fu_code_8 <= dis_uops_0_bits_fu_code_8;
			ldq_uop_6_fu_code_9 <= dis_uops_0_bits_fu_code_9;
			ldq_uop_6_iw_issued <= dis_uops_0_bits_iw_issued;
			ldq_uop_6_iw_issued_partial_agen <= dis_uops_0_bits_iw_issued_partial_agen;
			ldq_uop_6_iw_issued_partial_dgen <= dis_uops_0_bits_iw_issued_partial_dgen;
			ldq_uop_6_iw_p1_speculative_child <= dis_uops_0_bits_iw_p1_speculative_child;
			ldq_uop_6_iw_p2_speculative_child <= dis_uops_0_bits_iw_p2_speculative_child;
			ldq_uop_6_iw_p1_bypass_hint <= dis_uops_0_bits_iw_p1_bypass_hint;
			ldq_uop_6_iw_p2_bypass_hint <= dis_uops_0_bits_iw_p2_bypass_hint;
			ldq_uop_6_iw_p3_bypass_hint <= dis_uops_0_bits_iw_p3_bypass_hint;
			ldq_uop_6_br_tag <= dis_uops_0_bits_br_tag;
			ldq_uop_6_br_type <= dis_uops_0_bits_br_type;
			ldq_uop_6_is_sfb <= dis_uops_0_bits_is_sfb;
			ldq_uop_6_is_fence <= dis_uops_0_bits_is_fence;
			ldq_uop_6_is_fencei <= dis_uops_0_bits_is_fencei;
			ldq_uop_6_is_sfence <= dis_uops_0_bits_is_sfence;
			ldq_uop_6_is_amo <= dis_uops_0_bits_is_amo;
			ldq_uop_6_is_eret <= dis_uops_0_bits_is_eret;
			ldq_uop_6_is_sys_pc2epc <= dis_uops_0_bits_is_sys_pc2epc;
			ldq_uop_6_is_rocc <= dis_uops_0_bits_is_rocc;
			ldq_uop_6_is_mov <= dis_uops_0_bits_is_mov;
			ldq_uop_6_ftq_idx <= dis_uops_0_bits_ftq_idx;
			ldq_uop_6_edge_inst <= dis_uops_0_bits_edge_inst;
			ldq_uop_6_pc_lob <= dis_uops_0_bits_pc_lob;
			ldq_uop_6_taken <= dis_uops_0_bits_taken;
			ldq_uop_6_imm_rename <= dis_uops_0_bits_imm_rename;
			ldq_uop_6_imm_sel <= dis_uops_0_bits_imm_sel;
			ldq_uop_6_pimm <= dis_uops_0_bits_pimm;
			ldq_uop_6_imm_packed <= dis_uops_0_bits_imm_packed;
			ldq_uop_6_op1_sel <= dis_uops_0_bits_op1_sel;
			ldq_uop_6_op2_sel <= dis_uops_0_bits_op2_sel;
			ldq_uop_6_fp_ctrl_ldst <= dis_uops_0_bits_fp_ctrl_ldst;
			ldq_uop_6_fp_ctrl_wen <= dis_uops_0_bits_fp_ctrl_wen;
			ldq_uop_6_fp_ctrl_ren1 <= dis_uops_0_bits_fp_ctrl_ren1;
			ldq_uop_6_fp_ctrl_ren2 <= dis_uops_0_bits_fp_ctrl_ren2;
			ldq_uop_6_fp_ctrl_ren3 <= dis_uops_0_bits_fp_ctrl_ren3;
			ldq_uop_6_fp_ctrl_swap12 <= dis_uops_0_bits_fp_ctrl_swap12;
			ldq_uop_6_fp_ctrl_swap23 <= dis_uops_0_bits_fp_ctrl_swap23;
			ldq_uop_6_fp_ctrl_typeTagIn <= dis_uops_0_bits_fp_ctrl_typeTagIn;
			ldq_uop_6_fp_ctrl_typeTagOut <= dis_uops_0_bits_fp_ctrl_typeTagOut;
			ldq_uop_6_fp_ctrl_fromint <= dis_uops_0_bits_fp_ctrl_fromint;
			ldq_uop_6_fp_ctrl_toint <= dis_uops_0_bits_fp_ctrl_toint;
			ldq_uop_6_fp_ctrl_fastpipe <= dis_uops_0_bits_fp_ctrl_fastpipe;
			ldq_uop_6_fp_ctrl_fma <= dis_uops_0_bits_fp_ctrl_fma;
			ldq_uop_6_fp_ctrl_div <= dis_uops_0_bits_fp_ctrl_div;
			ldq_uop_6_fp_ctrl_sqrt <= dis_uops_0_bits_fp_ctrl_sqrt;
			ldq_uop_6_fp_ctrl_wflags <= dis_uops_0_bits_fp_ctrl_wflags;
			ldq_uop_6_fp_ctrl_vec <= dis_uops_0_bits_fp_ctrl_vec;
			ldq_uop_6_rob_idx <= dis_uops_0_bits_rob_idx;
			ldq_uop_6_ldq_idx <= dis_uops_0_bits_ldq_idx;
			ldq_uop_6_stq_idx <= dis_uops_0_bits_stq_idx;
			ldq_uop_6_rxq_idx <= dis_uops_0_bits_rxq_idx;
			ldq_uop_6_prs1 <= dis_uops_0_bits_prs1;
			ldq_uop_6_prs2 <= dis_uops_0_bits_prs2;
			ldq_uop_6_prs3 <= dis_uops_0_bits_prs3;
			ldq_uop_6_ppred <= dis_uops_0_bits_ppred;
			ldq_uop_6_prs1_busy <= dis_uops_0_bits_prs1_busy;
			ldq_uop_6_prs2_busy <= dis_uops_0_bits_prs2_busy;
			ldq_uop_6_prs3_busy <= dis_uops_0_bits_prs3_busy;
			ldq_uop_6_ppred_busy <= dis_uops_0_bits_ppred_busy;
			ldq_uop_6_stale_pdst <= dis_uops_0_bits_stale_pdst;
			ldq_uop_6_exc_cause <= dis_uops_0_bits_exc_cause;
			ldq_uop_6_mem_cmd <= dis_uops_0_bits_mem_cmd;
			ldq_uop_6_mem_size <= dis_uops_0_bits_mem_size;
			ldq_uop_6_mem_signed <= dis_uops_0_bits_mem_signed;
			ldq_uop_6_uses_ldq <= dis_uops_0_bits_uses_ldq;
			ldq_uop_6_uses_stq <= dis_uops_0_bits_uses_stq;
			ldq_uop_6_is_unique <= dis_uops_0_bits_is_unique;
			ldq_uop_6_flush_on_commit <= dis_uops_0_bits_flush_on_commit;
			ldq_uop_6_csr_cmd <= dis_uops_0_bits_csr_cmd;
			ldq_uop_6_ldst_is_rs1 <= dis_uops_0_bits_ldst_is_rs1;
			ldq_uop_6_ldst <= dis_uops_0_bits_ldst;
			ldq_uop_6_lrs1 <= dis_uops_0_bits_lrs1;
			ldq_uop_6_lrs2 <= dis_uops_0_bits_lrs2;
			ldq_uop_6_lrs3 <= dis_uops_0_bits_lrs3;
			ldq_uop_6_dst_rtype <= dis_uops_0_bits_dst_rtype;
			ldq_uop_6_lrs1_rtype <= dis_uops_0_bits_lrs1_rtype;
			ldq_uop_6_lrs2_rtype <= dis_uops_0_bits_lrs2_rtype;
			ldq_uop_6_frs3_en <= dis_uops_0_bits_frs3_en;
			ldq_uop_6_fcn_dw <= dis_uops_0_bits_fcn_dw;
			ldq_uop_6_fcn_op <= dis_uops_0_bits_fcn_op;
			ldq_uop_6_fp_val <= dis_uops_0_bits_fp_val;
			ldq_uop_6_fp_rm <= dis_uops_0_bits_fp_rm;
			ldq_uop_6_fp_typ <= dis_uops_0_bits_fp_typ;
			ldq_uop_6_xcpt_pf_if <= dis_uops_0_bits_xcpt_pf_if;
			ldq_uop_6_xcpt_ae_if <= dis_uops_0_bits_xcpt_ae_if;
			ldq_uop_6_xcpt_ma_if <= dis_uops_0_bits_xcpt_ma_if;
			ldq_uop_6_bp_debug_if <= dis_uops_0_bits_bp_debug_if;
			ldq_uop_6_bp_xcpt_if <= dis_uops_0_bits_bp_xcpt_if;
			ldq_uop_6_debug_fsrc <= dis_uops_0_bits_debug_fsrc;
			ldq_uop_6_debug_tsrc <= dis_uops_0_bits_debug_tsrc;
		end
		if (ldq_valid_6)
			ldq_uop_6_br_mask <= ldq_uop_6_br_mask & ~io_core_brupdate_b1_resolve_mask;
		else if (_GEN_14)
			ldq_uop_6_br_mask <= ldq_uop_out_br_mask;
		if (_GEN_503) begin
			if (_exe_cmd_T)
				ldq_uop_6_pdst <= ldq_incoming_e_0_bits_uop_pdst;
			else
				ldq_uop_6_pdst <= _exe_tlb_uop_T_4_pdst;
			ldq_addr_6_bits <= _ldq_addr_bits_T;
			ldq_addr_is_virtual_6 <= exe_tlb_miss_0;
			ldq_addr_is_uncacheable_6 <= _ldq_addr_is_uncacheable_T_1;
			ldq_ld_byte_mask_6 <= _ldq_ld_byte_mask_mask_T_14;
		end
		else if (_GEN_14)
			ldq_uop_6_pdst <= dis_uops_0_bits_pdst;
		ldq_uop_6_exception <= ((mem_xcpt_valids_0 & mem_xcpt_uops_0_uses_ldq) & (mem_xcpt_uops_0_ldq_idx[2:0] == 3'h6)) | (_GEN_14 ? dis_uops_0_bits_exception : ldq_uop_6_exception);
		if (_GEN_15) begin
			ldq_uop_7_inst <= dis_uops_0_bits_inst;
			ldq_uop_7_debug_inst <= dis_uops_0_bits_debug_inst;
			ldq_uop_7_is_rvc <= dis_uops_0_bits_is_rvc;
			ldq_uop_7_debug_pc <= dis_uops_0_bits_debug_pc;
			ldq_uop_7_iq_type_0 <= dis_uops_0_bits_iq_type_0;
			ldq_uop_7_iq_type_1 <= dis_uops_0_bits_iq_type_1;
			ldq_uop_7_iq_type_2 <= dis_uops_0_bits_iq_type_2;
			ldq_uop_7_iq_type_3 <= dis_uops_0_bits_iq_type_3;
			ldq_uop_7_fu_code_0 <= dis_uops_0_bits_fu_code_0;
			ldq_uop_7_fu_code_1 <= dis_uops_0_bits_fu_code_1;
			ldq_uop_7_fu_code_2 <= dis_uops_0_bits_fu_code_2;
			ldq_uop_7_fu_code_3 <= dis_uops_0_bits_fu_code_3;
			ldq_uop_7_fu_code_4 <= dis_uops_0_bits_fu_code_4;
			ldq_uop_7_fu_code_5 <= dis_uops_0_bits_fu_code_5;
			ldq_uop_7_fu_code_6 <= dis_uops_0_bits_fu_code_6;
			ldq_uop_7_fu_code_7 <= dis_uops_0_bits_fu_code_7;
			ldq_uop_7_fu_code_8 <= dis_uops_0_bits_fu_code_8;
			ldq_uop_7_fu_code_9 <= dis_uops_0_bits_fu_code_9;
			ldq_uop_7_iw_issued <= dis_uops_0_bits_iw_issued;
			ldq_uop_7_iw_issued_partial_agen <= dis_uops_0_bits_iw_issued_partial_agen;
			ldq_uop_7_iw_issued_partial_dgen <= dis_uops_0_bits_iw_issued_partial_dgen;
			ldq_uop_7_iw_p1_speculative_child <= dis_uops_0_bits_iw_p1_speculative_child;
			ldq_uop_7_iw_p2_speculative_child <= dis_uops_0_bits_iw_p2_speculative_child;
			ldq_uop_7_iw_p1_bypass_hint <= dis_uops_0_bits_iw_p1_bypass_hint;
			ldq_uop_7_iw_p2_bypass_hint <= dis_uops_0_bits_iw_p2_bypass_hint;
			ldq_uop_7_iw_p3_bypass_hint <= dis_uops_0_bits_iw_p3_bypass_hint;
			ldq_uop_7_br_tag <= dis_uops_0_bits_br_tag;
			ldq_uop_7_br_type <= dis_uops_0_bits_br_type;
			ldq_uop_7_is_sfb <= dis_uops_0_bits_is_sfb;
			ldq_uop_7_is_fence <= dis_uops_0_bits_is_fence;
			ldq_uop_7_is_fencei <= dis_uops_0_bits_is_fencei;
			ldq_uop_7_is_sfence <= dis_uops_0_bits_is_sfence;
			ldq_uop_7_is_amo <= dis_uops_0_bits_is_amo;
			ldq_uop_7_is_eret <= dis_uops_0_bits_is_eret;
			ldq_uop_7_is_sys_pc2epc <= dis_uops_0_bits_is_sys_pc2epc;
			ldq_uop_7_is_rocc <= dis_uops_0_bits_is_rocc;
			ldq_uop_7_is_mov <= dis_uops_0_bits_is_mov;
			ldq_uop_7_ftq_idx <= dis_uops_0_bits_ftq_idx;
			ldq_uop_7_edge_inst <= dis_uops_0_bits_edge_inst;
			ldq_uop_7_pc_lob <= dis_uops_0_bits_pc_lob;
			ldq_uop_7_taken <= dis_uops_0_bits_taken;
			ldq_uop_7_imm_rename <= dis_uops_0_bits_imm_rename;
			ldq_uop_7_imm_sel <= dis_uops_0_bits_imm_sel;
			ldq_uop_7_pimm <= dis_uops_0_bits_pimm;
			ldq_uop_7_imm_packed <= dis_uops_0_bits_imm_packed;
			ldq_uop_7_op1_sel <= dis_uops_0_bits_op1_sel;
			ldq_uop_7_op2_sel <= dis_uops_0_bits_op2_sel;
			ldq_uop_7_fp_ctrl_ldst <= dis_uops_0_bits_fp_ctrl_ldst;
			ldq_uop_7_fp_ctrl_wen <= dis_uops_0_bits_fp_ctrl_wen;
			ldq_uop_7_fp_ctrl_ren1 <= dis_uops_0_bits_fp_ctrl_ren1;
			ldq_uop_7_fp_ctrl_ren2 <= dis_uops_0_bits_fp_ctrl_ren2;
			ldq_uop_7_fp_ctrl_ren3 <= dis_uops_0_bits_fp_ctrl_ren3;
			ldq_uop_7_fp_ctrl_swap12 <= dis_uops_0_bits_fp_ctrl_swap12;
			ldq_uop_7_fp_ctrl_swap23 <= dis_uops_0_bits_fp_ctrl_swap23;
			ldq_uop_7_fp_ctrl_typeTagIn <= dis_uops_0_bits_fp_ctrl_typeTagIn;
			ldq_uop_7_fp_ctrl_typeTagOut <= dis_uops_0_bits_fp_ctrl_typeTagOut;
			ldq_uop_7_fp_ctrl_fromint <= dis_uops_0_bits_fp_ctrl_fromint;
			ldq_uop_7_fp_ctrl_toint <= dis_uops_0_bits_fp_ctrl_toint;
			ldq_uop_7_fp_ctrl_fastpipe <= dis_uops_0_bits_fp_ctrl_fastpipe;
			ldq_uop_7_fp_ctrl_fma <= dis_uops_0_bits_fp_ctrl_fma;
			ldq_uop_7_fp_ctrl_div <= dis_uops_0_bits_fp_ctrl_div;
			ldq_uop_7_fp_ctrl_sqrt <= dis_uops_0_bits_fp_ctrl_sqrt;
			ldq_uop_7_fp_ctrl_wflags <= dis_uops_0_bits_fp_ctrl_wflags;
			ldq_uop_7_fp_ctrl_vec <= dis_uops_0_bits_fp_ctrl_vec;
			ldq_uop_7_rob_idx <= dis_uops_0_bits_rob_idx;
			ldq_uop_7_ldq_idx <= dis_uops_0_bits_ldq_idx;
			ldq_uop_7_stq_idx <= dis_uops_0_bits_stq_idx;
			ldq_uop_7_rxq_idx <= dis_uops_0_bits_rxq_idx;
			ldq_uop_7_prs1 <= dis_uops_0_bits_prs1;
			ldq_uop_7_prs2 <= dis_uops_0_bits_prs2;
			ldq_uop_7_prs3 <= dis_uops_0_bits_prs3;
			ldq_uop_7_ppred <= dis_uops_0_bits_ppred;
			ldq_uop_7_prs1_busy <= dis_uops_0_bits_prs1_busy;
			ldq_uop_7_prs2_busy <= dis_uops_0_bits_prs2_busy;
			ldq_uop_7_prs3_busy <= dis_uops_0_bits_prs3_busy;
			ldq_uop_7_ppred_busy <= dis_uops_0_bits_ppred_busy;
			ldq_uop_7_stale_pdst <= dis_uops_0_bits_stale_pdst;
			ldq_uop_7_exc_cause <= dis_uops_0_bits_exc_cause;
			ldq_uop_7_mem_cmd <= dis_uops_0_bits_mem_cmd;
			ldq_uop_7_mem_size <= dis_uops_0_bits_mem_size;
			ldq_uop_7_mem_signed <= dis_uops_0_bits_mem_signed;
			ldq_uop_7_uses_ldq <= dis_uops_0_bits_uses_ldq;
			ldq_uop_7_uses_stq <= dis_uops_0_bits_uses_stq;
			ldq_uop_7_is_unique <= dis_uops_0_bits_is_unique;
			ldq_uop_7_flush_on_commit <= dis_uops_0_bits_flush_on_commit;
			ldq_uop_7_csr_cmd <= dis_uops_0_bits_csr_cmd;
			ldq_uop_7_ldst_is_rs1 <= dis_uops_0_bits_ldst_is_rs1;
			ldq_uop_7_ldst <= dis_uops_0_bits_ldst;
			ldq_uop_7_lrs1 <= dis_uops_0_bits_lrs1;
			ldq_uop_7_lrs2 <= dis_uops_0_bits_lrs2;
			ldq_uop_7_lrs3 <= dis_uops_0_bits_lrs3;
			ldq_uop_7_dst_rtype <= dis_uops_0_bits_dst_rtype;
			ldq_uop_7_lrs1_rtype <= dis_uops_0_bits_lrs1_rtype;
			ldq_uop_7_lrs2_rtype <= dis_uops_0_bits_lrs2_rtype;
			ldq_uop_7_frs3_en <= dis_uops_0_bits_frs3_en;
			ldq_uop_7_fcn_dw <= dis_uops_0_bits_fcn_dw;
			ldq_uop_7_fcn_op <= dis_uops_0_bits_fcn_op;
			ldq_uop_7_fp_val <= dis_uops_0_bits_fp_val;
			ldq_uop_7_fp_rm <= dis_uops_0_bits_fp_rm;
			ldq_uop_7_fp_typ <= dis_uops_0_bits_fp_typ;
			ldq_uop_7_xcpt_pf_if <= dis_uops_0_bits_xcpt_pf_if;
			ldq_uop_7_xcpt_ae_if <= dis_uops_0_bits_xcpt_ae_if;
			ldq_uop_7_xcpt_ma_if <= dis_uops_0_bits_xcpt_ma_if;
			ldq_uop_7_bp_debug_if <= dis_uops_0_bits_bp_debug_if;
			ldq_uop_7_bp_xcpt_if <= dis_uops_0_bits_bp_xcpt_if;
			ldq_uop_7_debug_fsrc <= dis_uops_0_bits_debug_fsrc;
			ldq_uop_7_debug_tsrc <= dis_uops_0_bits_debug_tsrc;
		end
		if (ldq_valid_7)
			ldq_uop_7_br_mask <= ldq_uop_7_br_mask & ~io_core_brupdate_b1_resolve_mask;
		else if (_GEN_15)
			ldq_uop_7_br_mask <= ldq_uop_out_br_mask;
		if (_GEN_504) begin
			if (_exe_cmd_T)
				ldq_uop_7_pdst <= ldq_incoming_e_0_bits_uop_pdst;
			else
				ldq_uop_7_pdst <= _exe_tlb_uop_T_4_pdst;
			ldq_addr_7_bits <= _ldq_addr_bits_T;
			ldq_addr_is_virtual_7 <= exe_tlb_miss_0;
			ldq_addr_is_uncacheable_7 <= _ldq_addr_is_uncacheable_T_1;
			ldq_ld_byte_mask_7 <= _ldq_ld_byte_mask_mask_T_14;
		end
		else if (_GEN_15)
			ldq_uop_7_pdst <= dis_uops_0_bits_pdst;
		ldq_uop_7_exception <= ((mem_xcpt_valids_0 & mem_xcpt_uops_0_uses_ldq) & (&mem_xcpt_uops_0_ldq_idx[2:0])) | (_GEN_15 ? dis_uops_0_bits_exception : ldq_uop_7_exception);
		ldq_addr_0_valid <= ~_GEN_585 & (_GEN_497 ? _ldq_addr_valid_T_1 : (_GEN_495 ? ~_GEN_8 & ldq_addr_0_valid : ~((ldq_enq_retry_idx[2:0] == 3'h0) | _GEN_8) & ldq_addr_0_valid));
		ldq_addr_1_valid <= ~_GEN_586 & (_GEN_498 ? _ldq_addr_valid_T_1 : (_GEN_495 ? ~_GEN_9 & ldq_addr_1_valid : ~((ldq_enq_retry_idx[2:0] == 3'h1) | _GEN_9) & ldq_addr_1_valid));
		ldq_addr_2_valid <= ~_GEN_587 & (_GEN_499 ? _ldq_addr_valid_T_1 : (_GEN_495 ? ~_GEN_10 & ldq_addr_2_valid : ~((ldq_enq_retry_idx[2:0] == 3'h2) | _GEN_10) & ldq_addr_2_valid));
		ldq_addr_3_valid <= ~_GEN_588 & (_GEN_500 ? _ldq_addr_valid_T_1 : (_GEN_495 ? ~_GEN_11 & ldq_addr_3_valid : ~((ldq_enq_retry_idx[2:0] == 3'h3) | _GEN_11) & ldq_addr_3_valid));
		ldq_addr_4_valid <= ~_GEN_589 & (_GEN_501 ? _ldq_addr_valid_T_1 : (_GEN_495 ? ~_GEN_12 & ldq_addr_4_valid : ~((ldq_enq_retry_idx[2:0] == 3'h4) | _GEN_12) & ldq_addr_4_valid));
		ldq_addr_5_valid <= ~_GEN_590 & (_GEN_502 ? _ldq_addr_valid_T_1 : (_GEN_495 ? ~_GEN_13 & ldq_addr_5_valid : ~((ldq_enq_retry_idx[2:0] == 3'h5) | _GEN_13) & ldq_addr_5_valid));
		ldq_addr_6_valid <= ~_GEN_591 & (_GEN_503 ? _ldq_addr_valid_T_1 : (_GEN_495 ? ~_GEN_14 & ldq_addr_6_valid : ~((ldq_enq_retry_idx[2:0] == 3'h6) | _GEN_14) & ldq_addr_6_valid));
		ldq_addr_7_valid <= ~_GEN_592 & (_GEN_504 ? _ldq_addr_valid_T_1 : (_GEN_495 ? ~_GEN_15 & ldq_addr_7_valid : ~(&ldq_enq_retry_idx[2:0] | _GEN_15) & ldq_addr_7_valid));
		ldq_executed_0 <= ((~io_dmem_nack_0_valid | io_dmem_nack_0_bits_is_hella) | ~(io_dmem_nack_0_bits_uop_uses_ldq & (io_dmem_nack_0_bits_uop_ldq_idx[2:0] == 3'h0))) & ((_GEN_365 ? ~(~(|lcam_ldq_idx_0[2:0]) | _GEN_563) & _GEN_555 : ~_GEN_563 & _GEN_555) | (~_GEN_8 & ldq_executed_0));
		ldq_executed_1 <= ((~io_dmem_nack_0_valid | io_dmem_nack_0_bits_is_hella) | ~(io_dmem_nack_0_bits_uop_uses_ldq & (io_dmem_nack_0_bits_uop_ldq_idx[2:0] == 3'h1))) & ((_GEN_365 ? ~(_GEN_294 | _GEN_564) & _GEN_556 : ~_GEN_564 & _GEN_556) | (~_GEN_9 & ldq_executed_1));
		ldq_executed_2 <= ((~io_dmem_nack_0_valid | io_dmem_nack_0_bits_is_hella) | ~(io_dmem_nack_0_bits_uop_uses_ldq & (io_dmem_nack_0_bits_uop_ldq_idx[2:0] == 3'h2))) & ((_GEN_365 ? ~(_GEN_295 | _GEN_565) & _GEN_557 : ~_GEN_565 & _GEN_557) | (~_GEN_10 & ldq_executed_2));
		ldq_executed_3 <= ((~io_dmem_nack_0_valid | io_dmem_nack_0_bits_is_hella) | ~(io_dmem_nack_0_bits_uop_uses_ldq & (io_dmem_nack_0_bits_uop_ldq_idx[2:0] == 3'h3))) & ((_GEN_365 ? ~(_GEN_296 | _GEN_566) & _GEN_558 : ~_GEN_566 & _GEN_558) | (~_GEN_11 & ldq_executed_3));
		ldq_executed_4 <= ((~io_dmem_nack_0_valid | io_dmem_nack_0_bits_is_hella) | ~(io_dmem_nack_0_bits_uop_uses_ldq & (io_dmem_nack_0_bits_uop_ldq_idx[2:0] == 3'h4))) & ((_GEN_365 ? ~(_GEN_297 | _GEN_567) & _GEN_559 : ~_GEN_567 & _GEN_559) | (~_GEN_12 & ldq_executed_4));
		ldq_executed_5 <= ((~io_dmem_nack_0_valid | io_dmem_nack_0_bits_is_hella) | ~(io_dmem_nack_0_bits_uop_uses_ldq & (io_dmem_nack_0_bits_uop_ldq_idx[2:0] == 3'h5))) & ((_GEN_365 ? ~(_GEN_298 | _GEN_568) & _GEN_560 : ~_GEN_568 & _GEN_560) | (~_GEN_13 & ldq_executed_5));
		ldq_executed_6 <= ((~io_dmem_nack_0_valid | io_dmem_nack_0_bits_is_hella) | ~(io_dmem_nack_0_bits_uop_uses_ldq & (io_dmem_nack_0_bits_uop_ldq_idx[2:0] == 3'h6))) & ((_GEN_365 ? ~(_GEN_299 | _GEN_569) & _GEN_561 : ~_GEN_569 & _GEN_561) | (~_GEN_14 & ldq_executed_6));
		ldq_executed_7 <= ((~io_dmem_nack_0_valid | io_dmem_nack_0_bits_is_hella) | ~(io_dmem_nack_0_bits_uop_uses_ldq & (&io_dmem_nack_0_bits_uop_ldq_idx[2:0]))) & ((_GEN_365 ? ~(&lcam_ldq_idx_0[2:0] | _GEN_570) & _GEN_553 : ~_GEN_570 & _GEN_553) | (~_GEN_15 & ldq_executed_7));
		ldq_succeeded_0 <= ldq_will_succeed_0;
		ldq_succeeded_1 <= ldq_will_succeed_1;
		ldq_succeeded_2 <= ldq_will_succeed_2;
		ldq_succeeded_3 <= ldq_will_succeed_3;
		ldq_succeeded_4 <= ldq_will_succeed_4;
		ldq_succeeded_5 <= ldq_will_succeed_5;
		ldq_succeeded_6 <= ldq_will_succeed_6;
		ldq_succeeded_7 <= ldq_will_succeed_7;
		ldq_order_fail_0 <= (_GEN_576 & _GEN_349) | (_GEN_574 ? (_GEN_349 | _GEN_539) | _GEN_460 : _GEN_539 | _GEN_460);
		ldq_order_fail_1 <= (_GEN_576 & _GEN_350) | (_GEN_574 ? (_GEN_350 | _GEN_542) | _GEN_461 : _GEN_542 | _GEN_461);
		ldq_order_fail_2 <= (_GEN_576 & _GEN_351) | (_GEN_574 ? (_GEN_351 | _GEN_544) | _GEN_462 : _GEN_544 | _GEN_462);
		ldq_order_fail_3 <= (_GEN_576 & _GEN_352) | (_GEN_574 ? (_GEN_352 | _GEN_546) | _GEN_463 : _GEN_546 | _GEN_463);
		ldq_order_fail_4 <= (_GEN_576 & _GEN_353) | (_GEN_574 ? (_GEN_353 | _GEN_548) | _GEN_464 : _GEN_548 | _GEN_464);
		ldq_order_fail_5 <= (_GEN_576 & _GEN_354) | (_GEN_574 ? (_GEN_354 | _GEN_550) | _GEN_465 : _GEN_550 | _GEN_465);
		ldq_order_fail_6 <= (_GEN_576 & _GEN_355) | (_GEN_574 ? (_GEN_355 | _GEN_552) | _GEN_466 : _GEN_552 | _GEN_466);
		ldq_order_fail_7 <= (_GEN_576 & (&wb_ldst_forward_ldq_idx_0[2:0])) | (_GEN_574 ? (&wb_ldst_forward_ldq_idx_0[2:0] | _GEN_554) | _GEN_467 : _GEN_554 | _GEN_467);
		ldq_observed_0 <= ((((fired_release_0 & ldq_valid_0) & ldq_addr_0_valid) & ~ldq_addr_is_virtual_0) & block_addr_matches_0) | (~_GEN_8 & ldq_observed_0);
		ldq_observed_1 <= ((((fired_release_0 & ldq_valid_1) & ldq_addr_1_valid) & ~ldq_addr_is_virtual_1) & block_addr_matches_1_0) | (~_GEN_9 & ldq_observed_1);
		ldq_observed_2 <= ((((fired_release_0 & ldq_valid_2) & ldq_addr_2_valid) & ~ldq_addr_is_virtual_2) & block_addr_matches_2_0) | (~_GEN_10 & ldq_observed_2);
		ldq_observed_3 <= ((((fired_release_0 & ldq_valid_3) & ldq_addr_3_valid) & ~ldq_addr_is_virtual_3) & block_addr_matches_3_0) | (~_GEN_11 & ldq_observed_3);
		ldq_observed_4 <= ((((fired_release_0 & ldq_valid_4) & ldq_addr_4_valid) & ~ldq_addr_is_virtual_4) & block_addr_matches_4_0) | (~_GEN_12 & ldq_observed_4);
		ldq_observed_5 <= ((((fired_release_0 & ldq_valid_5) & ldq_addr_5_valid) & ~ldq_addr_is_virtual_5) & block_addr_matches_5_0) | (~_GEN_13 & ldq_observed_5);
		ldq_observed_6 <= ((((fired_release_0 & ldq_valid_6) & ldq_addr_6_valid) & ~ldq_addr_is_virtual_6) & block_addr_matches_6_0) | (~_GEN_14 & ldq_observed_6);
		ldq_observed_7 <= ((((fired_release_0 & ldq_valid_7) & ldq_addr_7_valid) & ~ldq_addr_is_virtual_7) & block_addr_matches_7_0) | (~_GEN_15 & ldq_observed_7);
		if (dis_ld_val & _GEN_438)
			ldq_next_stq_idx_0 <= stq_tail;
		if (dis_ld_val & _GEN_439)
			ldq_next_stq_idx_1 <= stq_tail;
		if (dis_ld_val & _GEN_440)
			ldq_next_stq_idx_2 <= stq_tail;
		if (dis_ld_val & _GEN_441)
			ldq_next_stq_idx_3 <= stq_tail;
		if (dis_ld_val & _GEN_442)
			ldq_next_stq_idx_4 <= stq_tail;
		if (dis_ld_val & _GEN_443)
			ldq_next_stq_idx_5 <= stq_tail;
		if (dis_ld_val & _GEN_444)
			ldq_next_stq_idx_6 <= stq_tail;
		if (dis_ld_val & (&ldq_tail[2:0]))
			ldq_next_stq_idx_7 <= stq_tail;
		ldq_forward_std_val_0 <= _GEN_387 | (~_GEN_8 & ldq_forward_std_val_0);
		ldq_forward_std_val_1 <= _GEN_389 | (~_GEN_9 & ldq_forward_std_val_1);
		ldq_forward_std_val_2 <= _GEN_391 | (~_GEN_10 & ldq_forward_std_val_2);
		ldq_forward_std_val_3 <= _GEN_393 | (~_GEN_11 & ldq_forward_std_val_3);
		ldq_forward_std_val_4 <= _GEN_395 | (~_GEN_12 & ldq_forward_std_val_4);
		ldq_forward_std_val_5 <= _GEN_397 | (~_GEN_13 & ldq_forward_std_val_5);
		ldq_forward_std_val_6 <= _GEN_399 | (~_GEN_14 & ldq_forward_std_val_6);
		ldq_forward_std_val_7 <= _GEN_401 | (~_GEN_15 & ldq_forward_std_val_7);
		if (_GEN_380 | ~_GEN_386)
			;
		else
			ldq_forward_stq_idx_0 <= wb_ldst_forward_stq_idx_0;
		if (_GEN_380 | ~_GEN_388)
			;
		else
			ldq_forward_stq_idx_1 <= wb_ldst_forward_stq_idx_0;
		if (_GEN_380 | ~_GEN_390)
			;
		else
			ldq_forward_stq_idx_2 <= wb_ldst_forward_stq_idx_0;
		if (_GEN_380 | ~_GEN_392)
			;
		else
			ldq_forward_stq_idx_3 <= wb_ldst_forward_stq_idx_0;
		if (_GEN_380 | ~_GEN_394)
			;
		else
			ldq_forward_stq_idx_4 <= wb_ldst_forward_stq_idx_0;
		if (_GEN_380 | ~_GEN_396)
			;
		else
			ldq_forward_stq_idx_5 <= wb_ldst_forward_stq_idx_0;
		if (_GEN_380 | ~_GEN_398)
			;
		else
			ldq_forward_stq_idx_6 <= wb_ldst_forward_stq_idx_0;
		if (_GEN_380 | ~_GEN_400)
			;
		else
			ldq_forward_stq_idx_7 <= wb_ldst_forward_stq_idx_0;
		stq_valid_0 <= ~(_GEN_604 & (reset | (~stq_committed_0 & ~stq_succeeded_0))) & (clear_store ? ~(_GEN_357 | _GEN_577) & _GEN_470 : ~_GEN_577 & _GEN_470);
		stq_valid_1 <= ~(_GEN_604 & (reset | (~stq_committed_1 & ~stq_succeeded_1))) & (clear_store ? ~((stq_head[2:0] == 3'h1) | _GEN_578) & _GEN_472 : ~_GEN_578 & _GEN_472);
		stq_valid_2 <= ~(_GEN_604 & (reset | (~stq_committed_2 & ~stq_succeeded_2))) & (clear_store ? ~((stq_head[2:0] == 3'h2) | _GEN_579) & _GEN_474 : ~_GEN_579 & _GEN_474);
		stq_valid_3 <= ~(_GEN_604 & (reset | (~stq_committed_3 & ~stq_succeeded_3))) & (clear_store ? ~((stq_head[2:0] == 3'h3) | _GEN_580) & _GEN_476 : ~_GEN_580 & _GEN_476);
		stq_valid_4 <= ~(_GEN_604 & (reset | (~stq_committed_4 & ~stq_succeeded_4))) & (clear_store ? ~((stq_head[2:0] == 3'h4) | _GEN_581) & _GEN_478 : ~_GEN_581 & _GEN_478);
		stq_valid_5 <= ~(_GEN_604 & (reset | (~stq_committed_5 & ~stq_succeeded_5))) & (clear_store ? ~((stq_head[2:0] == 3'h5) | _GEN_582) & _GEN_480 : ~_GEN_582 & _GEN_480);
		stq_valid_6 <= ~(_GEN_604 & (reset | (~stq_committed_6 & ~stq_succeeded_6))) & (clear_store ? ~((stq_head[2:0] == 3'h6) | _GEN_583) & _GEN_482 : ~_GEN_583 & _GEN_482);
		stq_valid_7 <= ~(_GEN_604 & (reset | (~stq_committed_7 & ~stq_succeeded_7))) & (clear_store ? ~(&stq_head[2:0] | _GEN_584) & _GEN_484 : ~_GEN_584 & _GEN_484);
		if (_GEN_469) begin
			stq_uop_0_inst <= dis_uops_0_bits_inst;
			stq_uop_0_debug_inst <= dis_uops_0_bits_debug_inst;
			stq_uop_0_is_rvc <= dis_uops_0_bits_is_rvc;
			stq_uop_0_debug_pc <= dis_uops_0_bits_debug_pc;
			stq_uop_0_iq_type_0 <= dis_uops_0_bits_iq_type_0;
			stq_uop_0_iq_type_1 <= dis_uops_0_bits_iq_type_1;
			stq_uop_0_iq_type_2 <= dis_uops_0_bits_iq_type_2;
			stq_uop_0_iq_type_3 <= dis_uops_0_bits_iq_type_3;
			stq_uop_0_fu_code_0 <= dis_uops_0_bits_fu_code_0;
			stq_uop_0_fu_code_1 <= dis_uops_0_bits_fu_code_1;
			stq_uop_0_fu_code_2 <= dis_uops_0_bits_fu_code_2;
			stq_uop_0_fu_code_3 <= dis_uops_0_bits_fu_code_3;
			stq_uop_0_fu_code_4 <= dis_uops_0_bits_fu_code_4;
			stq_uop_0_fu_code_5 <= dis_uops_0_bits_fu_code_5;
			stq_uop_0_fu_code_6 <= dis_uops_0_bits_fu_code_6;
			stq_uop_0_fu_code_7 <= dis_uops_0_bits_fu_code_7;
			stq_uop_0_fu_code_8 <= dis_uops_0_bits_fu_code_8;
			stq_uop_0_fu_code_9 <= dis_uops_0_bits_fu_code_9;
			stq_uop_0_iw_issued <= dis_uops_0_bits_iw_issued;
			stq_uop_0_iw_issued_partial_agen <= dis_uops_0_bits_iw_issued_partial_agen;
			stq_uop_0_iw_issued_partial_dgen <= dis_uops_0_bits_iw_issued_partial_dgen;
			stq_uop_0_iw_p1_speculative_child <= dis_uops_0_bits_iw_p1_speculative_child;
			stq_uop_0_iw_p2_speculative_child <= dis_uops_0_bits_iw_p2_speculative_child;
			stq_uop_0_iw_p1_bypass_hint <= dis_uops_0_bits_iw_p1_bypass_hint;
			stq_uop_0_iw_p2_bypass_hint <= dis_uops_0_bits_iw_p2_bypass_hint;
			stq_uop_0_iw_p3_bypass_hint <= dis_uops_0_bits_iw_p3_bypass_hint;
			stq_uop_0_br_tag <= dis_uops_0_bits_br_tag;
			stq_uop_0_br_type <= dis_uops_0_bits_br_type;
			stq_uop_0_is_sfb <= dis_uops_0_bits_is_sfb;
			stq_uop_0_is_fence <= dis_uops_0_bits_is_fence;
			stq_uop_0_is_fencei <= dis_uops_0_bits_is_fencei;
			stq_uop_0_is_sfence <= dis_uops_0_bits_is_sfence;
			stq_uop_0_is_amo <= dis_uops_0_bits_is_amo;
			stq_uop_0_is_eret <= dis_uops_0_bits_is_eret;
			stq_uop_0_is_sys_pc2epc <= dis_uops_0_bits_is_sys_pc2epc;
			stq_uop_0_is_rocc <= dis_uops_0_bits_is_rocc;
			stq_uop_0_is_mov <= dis_uops_0_bits_is_mov;
			stq_uop_0_ftq_idx <= dis_uops_0_bits_ftq_idx;
			stq_uop_0_edge_inst <= dis_uops_0_bits_edge_inst;
			stq_uop_0_pc_lob <= dis_uops_0_bits_pc_lob;
			stq_uop_0_taken <= dis_uops_0_bits_taken;
			stq_uop_0_imm_rename <= dis_uops_0_bits_imm_rename;
			stq_uop_0_imm_sel <= dis_uops_0_bits_imm_sel;
			stq_uop_0_pimm <= dis_uops_0_bits_pimm;
			stq_uop_0_imm_packed <= dis_uops_0_bits_imm_packed;
			stq_uop_0_op1_sel <= dis_uops_0_bits_op1_sel;
			stq_uop_0_op2_sel <= dis_uops_0_bits_op2_sel;
			stq_uop_0_fp_ctrl_ldst <= dis_uops_0_bits_fp_ctrl_ldst;
			stq_uop_0_fp_ctrl_wen <= dis_uops_0_bits_fp_ctrl_wen;
			stq_uop_0_fp_ctrl_ren1 <= dis_uops_0_bits_fp_ctrl_ren1;
			stq_uop_0_fp_ctrl_ren2 <= dis_uops_0_bits_fp_ctrl_ren2;
			stq_uop_0_fp_ctrl_ren3 <= dis_uops_0_bits_fp_ctrl_ren3;
			stq_uop_0_fp_ctrl_swap12 <= dis_uops_0_bits_fp_ctrl_swap12;
			stq_uop_0_fp_ctrl_swap23 <= dis_uops_0_bits_fp_ctrl_swap23;
			stq_uop_0_fp_ctrl_typeTagIn <= dis_uops_0_bits_fp_ctrl_typeTagIn;
			stq_uop_0_fp_ctrl_typeTagOut <= dis_uops_0_bits_fp_ctrl_typeTagOut;
			stq_uop_0_fp_ctrl_fromint <= dis_uops_0_bits_fp_ctrl_fromint;
			stq_uop_0_fp_ctrl_toint <= dis_uops_0_bits_fp_ctrl_toint;
			stq_uop_0_fp_ctrl_fastpipe <= dis_uops_0_bits_fp_ctrl_fastpipe;
			stq_uop_0_fp_ctrl_fma <= dis_uops_0_bits_fp_ctrl_fma;
			stq_uop_0_fp_ctrl_div <= dis_uops_0_bits_fp_ctrl_div;
			stq_uop_0_fp_ctrl_sqrt <= dis_uops_0_bits_fp_ctrl_sqrt;
			stq_uop_0_fp_ctrl_wflags <= dis_uops_0_bits_fp_ctrl_wflags;
			stq_uop_0_fp_ctrl_vec <= dis_uops_0_bits_fp_ctrl_vec;
			stq_uop_0_rob_idx <= dis_uops_0_bits_rob_idx;
			stq_uop_0_ldq_idx <= dis_uops_0_bits_ldq_idx;
			stq_uop_0_stq_idx <= dis_uops_0_bits_stq_idx;
			stq_uop_0_rxq_idx <= dis_uops_0_bits_rxq_idx;
			stq_uop_0_prs1 <= dis_uops_0_bits_prs1;
			stq_uop_0_prs2 <= dis_uops_0_bits_prs2;
			stq_uop_0_prs3 <= dis_uops_0_bits_prs3;
			stq_uop_0_ppred <= dis_uops_0_bits_ppred;
			stq_uop_0_prs1_busy <= dis_uops_0_bits_prs1_busy;
			stq_uop_0_prs2_busy <= dis_uops_0_bits_prs2_busy;
			stq_uop_0_prs3_busy <= dis_uops_0_bits_prs3_busy;
			stq_uop_0_ppred_busy <= dis_uops_0_bits_ppred_busy;
			stq_uop_0_stale_pdst <= dis_uops_0_bits_stale_pdst;
			stq_uop_0_exc_cause <= dis_uops_0_bits_exc_cause;
			stq_uop_0_mem_cmd <= dis_uops_0_bits_mem_cmd;
			stq_uop_0_mem_size <= dis_uops_0_bits_mem_size;
			stq_uop_0_mem_signed <= dis_uops_0_bits_mem_signed;
			stq_uop_0_uses_ldq <= dis_uops_0_bits_uses_ldq;
			stq_uop_0_uses_stq <= dis_uops_0_bits_uses_stq;
			stq_uop_0_is_unique <= dis_uops_0_bits_is_unique;
			stq_uop_0_flush_on_commit <= dis_uops_0_bits_flush_on_commit;
			stq_uop_0_csr_cmd <= dis_uops_0_bits_csr_cmd;
			stq_uop_0_ldst_is_rs1 <= dis_uops_0_bits_ldst_is_rs1;
			stq_uop_0_ldst <= dis_uops_0_bits_ldst;
			stq_uop_0_lrs1 <= dis_uops_0_bits_lrs1;
			stq_uop_0_lrs2 <= dis_uops_0_bits_lrs2;
			stq_uop_0_lrs3 <= dis_uops_0_bits_lrs3;
			stq_uop_0_dst_rtype <= dis_uops_0_bits_dst_rtype;
			stq_uop_0_lrs1_rtype <= dis_uops_0_bits_lrs1_rtype;
			stq_uop_0_lrs2_rtype <= dis_uops_0_bits_lrs2_rtype;
			stq_uop_0_frs3_en <= dis_uops_0_bits_frs3_en;
			stq_uop_0_fcn_dw <= dis_uops_0_bits_fcn_dw;
			stq_uop_0_fcn_op <= dis_uops_0_bits_fcn_op;
			stq_uop_0_fp_val <= dis_uops_0_bits_fp_val;
			stq_uop_0_fp_rm <= dis_uops_0_bits_fp_rm;
			stq_uop_0_fp_typ <= dis_uops_0_bits_fp_typ;
			stq_uop_0_xcpt_pf_if <= dis_uops_0_bits_xcpt_pf_if;
			stq_uop_0_xcpt_ae_if <= dis_uops_0_bits_xcpt_ae_if;
			stq_uop_0_xcpt_ma_if <= dis_uops_0_bits_xcpt_ma_if;
			stq_uop_0_bp_debug_if <= dis_uops_0_bits_bp_debug_if;
			stq_uop_0_bp_xcpt_if <= dis_uops_0_bits_bp_xcpt_if;
			stq_uop_0_debug_fsrc <= dis_uops_0_bits_debug_fsrc;
			stq_uop_0_debug_tsrc <= dis_uops_0_bits_debug_tsrc;
		end
		if (stq_valid_0)
			stq_uop_0_br_mask <= stq_uop_0_br_mask & ~io_core_brupdate_b1_resolve_mask;
		else if (_GEN_469)
			stq_uop_0_br_mask <= stq_uop_out_br_mask;
		if (_GEN_506) begin
			if (_exe_cmd_T)
				stq_uop_0_pdst <= ldq_incoming_e_0_bits_uop_pdst;
			else if (will_fire_store_agen_0_will_fire)
				stq_uop_0_pdst <= stq_incoming_e_0_bits_uop_pdst;
			else
				stq_uop_0_pdst <= _exe_tlb_uop_T_3_pdst;
			stq_addr_0_bits <= _stq_addr_bits_T;
			stq_addr_is_virtual_0 <= exe_tlb_miss_0;
		end
		else if (_GEN_469)
			stq_uop_0_pdst <= dis_uops_0_bits_pdst;
		stq_uop_0_exception <= ((mem_xcpt_valids_0 & ~mem_xcpt_uops_0_uses_ldq) & (mem_xcpt_uops_0_stq_idx[2:0] == 3'h0)) | (_GEN_469 ? dis_uops_0_bits_exception : stq_uop_0_exception);
		if (_GEN_471) begin
			stq_uop_1_inst <= dis_uops_0_bits_inst;
			stq_uop_1_debug_inst <= dis_uops_0_bits_debug_inst;
			stq_uop_1_is_rvc <= dis_uops_0_bits_is_rvc;
			stq_uop_1_debug_pc <= dis_uops_0_bits_debug_pc;
			stq_uop_1_iq_type_0 <= dis_uops_0_bits_iq_type_0;
			stq_uop_1_iq_type_1 <= dis_uops_0_bits_iq_type_1;
			stq_uop_1_iq_type_2 <= dis_uops_0_bits_iq_type_2;
			stq_uop_1_iq_type_3 <= dis_uops_0_bits_iq_type_3;
			stq_uop_1_fu_code_0 <= dis_uops_0_bits_fu_code_0;
			stq_uop_1_fu_code_1 <= dis_uops_0_bits_fu_code_1;
			stq_uop_1_fu_code_2 <= dis_uops_0_bits_fu_code_2;
			stq_uop_1_fu_code_3 <= dis_uops_0_bits_fu_code_3;
			stq_uop_1_fu_code_4 <= dis_uops_0_bits_fu_code_4;
			stq_uop_1_fu_code_5 <= dis_uops_0_bits_fu_code_5;
			stq_uop_1_fu_code_6 <= dis_uops_0_bits_fu_code_6;
			stq_uop_1_fu_code_7 <= dis_uops_0_bits_fu_code_7;
			stq_uop_1_fu_code_8 <= dis_uops_0_bits_fu_code_8;
			stq_uop_1_fu_code_9 <= dis_uops_0_bits_fu_code_9;
			stq_uop_1_iw_issued <= dis_uops_0_bits_iw_issued;
			stq_uop_1_iw_issued_partial_agen <= dis_uops_0_bits_iw_issued_partial_agen;
			stq_uop_1_iw_issued_partial_dgen <= dis_uops_0_bits_iw_issued_partial_dgen;
			stq_uop_1_iw_p1_speculative_child <= dis_uops_0_bits_iw_p1_speculative_child;
			stq_uop_1_iw_p2_speculative_child <= dis_uops_0_bits_iw_p2_speculative_child;
			stq_uop_1_iw_p1_bypass_hint <= dis_uops_0_bits_iw_p1_bypass_hint;
			stq_uop_1_iw_p2_bypass_hint <= dis_uops_0_bits_iw_p2_bypass_hint;
			stq_uop_1_iw_p3_bypass_hint <= dis_uops_0_bits_iw_p3_bypass_hint;
			stq_uop_1_br_tag <= dis_uops_0_bits_br_tag;
			stq_uop_1_br_type <= dis_uops_0_bits_br_type;
			stq_uop_1_is_sfb <= dis_uops_0_bits_is_sfb;
			stq_uop_1_is_fence <= dis_uops_0_bits_is_fence;
			stq_uop_1_is_fencei <= dis_uops_0_bits_is_fencei;
			stq_uop_1_is_sfence <= dis_uops_0_bits_is_sfence;
			stq_uop_1_is_amo <= dis_uops_0_bits_is_amo;
			stq_uop_1_is_eret <= dis_uops_0_bits_is_eret;
			stq_uop_1_is_sys_pc2epc <= dis_uops_0_bits_is_sys_pc2epc;
			stq_uop_1_is_rocc <= dis_uops_0_bits_is_rocc;
			stq_uop_1_is_mov <= dis_uops_0_bits_is_mov;
			stq_uop_1_ftq_idx <= dis_uops_0_bits_ftq_idx;
			stq_uop_1_edge_inst <= dis_uops_0_bits_edge_inst;
			stq_uop_1_pc_lob <= dis_uops_0_bits_pc_lob;
			stq_uop_1_taken <= dis_uops_0_bits_taken;
			stq_uop_1_imm_rename <= dis_uops_0_bits_imm_rename;
			stq_uop_1_imm_sel <= dis_uops_0_bits_imm_sel;
			stq_uop_1_pimm <= dis_uops_0_bits_pimm;
			stq_uop_1_imm_packed <= dis_uops_0_bits_imm_packed;
			stq_uop_1_op1_sel <= dis_uops_0_bits_op1_sel;
			stq_uop_1_op2_sel <= dis_uops_0_bits_op2_sel;
			stq_uop_1_fp_ctrl_ldst <= dis_uops_0_bits_fp_ctrl_ldst;
			stq_uop_1_fp_ctrl_wen <= dis_uops_0_bits_fp_ctrl_wen;
			stq_uop_1_fp_ctrl_ren1 <= dis_uops_0_bits_fp_ctrl_ren1;
			stq_uop_1_fp_ctrl_ren2 <= dis_uops_0_bits_fp_ctrl_ren2;
			stq_uop_1_fp_ctrl_ren3 <= dis_uops_0_bits_fp_ctrl_ren3;
			stq_uop_1_fp_ctrl_swap12 <= dis_uops_0_bits_fp_ctrl_swap12;
			stq_uop_1_fp_ctrl_swap23 <= dis_uops_0_bits_fp_ctrl_swap23;
			stq_uop_1_fp_ctrl_typeTagIn <= dis_uops_0_bits_fp_ctrl_typeTagIn;
			stq_uop_1_fp_ctrl_typeTagOut <= dis_uops_0_bits_fp_ctrl_typeTagOut;
			stq_uop_1_fp_ctrl_fromint <= dis_uops_0_bits_fp_ctrl_fromint;
			stq_uop_1_fp_ctrl_toint <= dis_uops_0_bits_fp_ctrl_toint;
			stq_uop_1_fp_ctrl_fastpipe <= dis_uops_0_bits_fp_ctrl_fastpipe;
			stq_uop_1_fp_ctrl_fma <= dis_uops_0_bits_fp_ctrl_fma;
			stq_uop_1_fp_ctrl_div <= dis_uops_0_bits_fp_ctrl_div;
			stq_uop_1_fp_ctrl_sqrt <= dis_uops_0_bits_fp_ctrl_sqrt;
			stq_uop_1_fp_ctrl_wflags <= dis_uops_0_bits_fp_ctrl_wflags;
			stq_uop_1_fp_ctrl_vec <= dis_uops_0_bits_fp_ctrl_vec;
			stq_uop_1_rob_idx <= dis_uops_0_bits_rob_idx;
			stq_uop_1_ldq_idx <= dis_uops_0_bits_ldq_idx;
			stq_uop_1_stq_idx <= dis_uops_0_bits_stq_idx;
			stq_uop_1_rxq_idx <= dis_uops_0_bits_rxq_idx;
			stq_uop_1_prs1 <= dis_uops_0_bits_prs1;
			stq_uop_1_prs2 <= dis_uops_0_bits_prs2;
			stq_uop_1_prs3 <= dis_uops_0_bits_prs3;
			stq_uop_1_ppred <= dis_uops_0_bits_ppred;
			stq_uop_1_prs1_busy <= dis_uops_0_bits_prs1_busy;
			stq_uop_1_prs2_busy <= dis_uops_0_bits_prs2_busy;
			stq_uop_1_prs3_busy <= dis_uops_0_bits_prs3_busy;
			stq_uop_1_ppred_busy <= dis_uops_0_bits_ppred_busy;
			stq_uop_1_stale_pdst <= dis_uops_0_bits_stale_pdst;
			stq_uop_1_exc_cause <= dis_uops_0_bits_exc_cause;
			stq_uop_1_mem_cmd <= dis_uops_0_bits_mem_cmd;
			stq_uop_1_mem_size <= dis_uops_0_bits_mem_size;
			stq_uop_1_mem_signed <= dis_uops_0_bits_mem_signed;
			stq_uop_1_uses_ldq <= dis_uops_0_bits_uses_ldq;
			stq_uop_1_uses_stq <= dis_uops_0_bits_uses_stq;
			stq_uop_1_is_unique <= dis_uops_0_bits_is_unique;
			stq_uop_1_flush_on_commit <= dis_uops_0_bits_flush_on_commit;
			stq_uop_1_csr_cmd <= dis_uops_0_bits_csr_cmd;
			stq_uop_1_ldst_is_rs1 <= dis_uops_0_bits_ldst_is_rs1;
			stq_uop_1_ldst <= dis_uops_0_bits_ldst;
			stq_uop_1_lrs1 <= dis_uops_0_bits_lrs1;
			stq_uop_1_lrs2 <= dis_uops_0_bits_lrs2;
			stq_uop_1_lrs3 <= dis_uops_0_bits_lrs3;
			stq_uop_1_dst_rtype <= dis_uops_0_bits_dst_rtype;
			stq_uop_1_lrs1_rtype <= dis_uops_0_bits_lrs1_rtype;
			stq_uop_1_lrs2_rtype <= dis_uops_0_bits_lrs2_rtype;
			stq_uop_1_frs3_en <= dis_uops_0_bits_frs3_en;
			stq_uop_1_fcn_dw <= dis_uops_0_bits_fcn_dw;
			stq_uop_1_fcn_op <= dis_uops_0_bits_fcn_op;
			stq_uop_1_fp_val <= dis_uops_0_bits_fp_val;
			stq_uop_1_fp_rm <= dis_uops_0_bits_fp_rm;
			stq_uop_1_fp_typ <= dis_uops_0_bits_fp_typ;
			stq_uop_1_xcpt_pf_if <= dis_uops_0_bits_xcpt_pf_if;
			stq_uop_1_xcpt_ae_if <= dis_uops_0_bits_xcpt_ae_if;
			stq_uop_1_xcpt_ma_if <= dis_uops_0_bits_xcpt_ma_if;
			stq_uop_1_bp_debug_if <= dis_uops_0_bits_bp_debug_if;
			stq_uop_1_bp_xcpt_if <= dis_uops_0_bits_bp_xcpt_if;
			stq_uop_1_debug_fsrc <= dis_uops_0_bits_debug_fsrc;
			stq_uop_1_debug_tsrc <= dis_uops_0_bits_debug_tsrc;
		end
		if (stq_valid_1)
			stq_uop_1_br_mask <= stq_uop_1_br_mask & ~io_core_brupdate_b1_resolve_mask;
		else if (_GEN_471)
			stq_uop_1_br_mask <= stq_uop_out_br_mask;
		if (_GEN_507) begin
			if (_exe_cmd_T)
				stq_uop_1_pdst <= ldq_incoming_e_0_bits_uop_pdst;
			else if (will_fire_store_agen_0_will_fire)
				stq_uop_1_pdst <= stq_incoming_e_0_bits_uop_pdst;
			else
				stq_uop_1_pdst <= _exe_tlb_uop_T_3_pdst;
			stq_addr_1_bits <= _stq_addr_bits_T;
			stq_addr_is_virtual_1 <= exe_tlb_miss_0;
		end
		else if (_GEN_471)
			stq_uop_1_pdst <= dis_uops_0_bits_pdst;
		stq_uop_1_exception <= ((mem_xcpt_valids_0 & ~mem_xcpt_uops_0_uses_ldq) & (mem_xcpt_uops_0_stq_idx[2:0] == 3'h1)) | (_GEN_471 ? dis_uops_0_bits_exception : stq_uop_1_exception);
		if (_GEN_473) begin
			stq_uop_2_inst <= dis_uops_0_bits_inst;
			stq_uop_2_debug_inst <= dis_uops_0_bits_debug_inst;
			stq_uop_2_is_rvc <= dis_uops_0_bits_is_rvc;
			stq_uop_2_debug_pc <= dis_uops_0_bits_debug_pc;
			stq_uop_2_iq_type_0 <= dis_uops_0_bits_iq_type_0;
			stq_uop_2_iq_type_1 <= dis_uops_0_bits_iq_type_1;
			stq_uop_2_iq_type_2 <= dis_uops_0_bits_iq_type_2;
			stq_uop_2_iq_type_3 <= dis_uops_0_bits_iq_type_3;
			stq_uop_2_fu_code_0 <= dis_uops_0_bits_fu_code_0;
			stq_uop_2_fu_code_1 <= dis_uops_0_bits_fu_code_1;
			stq_uop_2_fu_code_2 <= dis_uops_0_bits_fu_code_2;
			stq_uop_2_fu_code_3 <= dis_uops_0_bits_fu_code_3;
			stq_uop_2_fu_code_4 <= dis_uops_0_bits_fu_code_4;
			stq_uop_2_fu_code_5 <= dis_uops_0_bits_fu_code_5;
			stq_uop_2_fu_code_6 <= dis_uops_0_bits_fu_code_6;
			stq_uop_2_fu_code_7 <= dis_uops_0_bits_fu_code_7;
			stq_uop_2_fu_code_8 <= dis_uops_0_bits_fu_code_8;
			stq_uop_2_fu_code_9 <= dis_uops_0_bits_fu_code_9;
			stq_uop_2_iw_issued <= dis_uops_0_bits_iw_issued;
			stq_uop_2_iw_issued_partial_agen <= dis_uops_0_bits_iw_issued_partial_agen;
			stq_uop_2_iw_issued_partial_dgen <= dis_uops_0_bits_iw_issued_partial_dgen;
			stq_uop_2_iw_p1_speculative_child <= dis_uops_0_bits_iw_p1_speculative_child;
			stq_uop_2_iw_p2_speculative_child <= dis_uops_0_bits_iw_p2_speculative_child;
			stq_uop_2_iw_p1_bypass_hint <= dis_uops_0_bits_iw_p1_bypass_hint;
			stq_uop_2_iw_p2_bypass_hint <= dis_uops_0_bits_iw_p2_bypass_hint;
			stq_uop_2_iw_p3_bypass_hint <= dis_uops_0_bits_iw_p3_bypass_hint;
			stq_uop_2_br_tag <= dis_uops_0_bits_br_tag;
			stq_uop_2_br_type <= dis_uops_0_bits_br_type;
			stq_uop_2_is_sfb <= dis_uops_0_bits_is_sfb;
			stq_uop_2_is_fence <= dis_uops_0_bits_is_fence;
			stq_uop_2_is_fencei <= dis_uops_0_bits_is_fencei;
			stq_uop_2_is_sfence <= dis_uops_0_bits_is_sfence;
			stq_uop_2_is_amo <= dis_uops_0_bits_is_amo;
			stq_uop_2_is_eret <= dis_uops_0_bits_is_eret;
			stq_uop_2_is_sys_pc2epc <= dis_uops_0_bits_is_sys_pc2epc;
			stq_uop_2_is_rocc <= dis_uops_0_bits_is_rocc;
			stq_uop_2_is_mov <= dis_uops_0_bits_is_mov;
			stq_uop_2_ftq_idx <= dis_uops_0_bits_ftq_idx;
			stq_uop_2_edge_inst <= dis_uops_0_bits_edge_inst;
			stq_uop_2_pc_lob <= dis_uops_0_bits_pc_lob;
			stq_uop_2_taken <= dis_uops_0_bits_taken;
			stq_uop_2_imm_rename <= dis_uops_0_bits_imm_rename;
			stq_uop_2_imm_sel <= dis_uops_0_bits_imm_sel;
			stq_uop_2_pimm <= dis_uops_0_bits_pimm;
			stq_uop_2_imm_packed <= dis_uops_0_bits_imm_packed;
			stq_uop_2_op1_sel <= dis_uops_0_bits_op1_sel;
			stq_uop_2_op2_sel <= dis_uops_0_bits_op2_sel;
			stq_uop_2_fp_ctrl_ldst <= dis_uops_0_bits_fp_ctrl_ldst;
			stq_uop_2_fp_ctrl_wen <= dis_uops_0_bits_fp_ctrl_wen;
			stq_uop_2_fp_ctrl_ren1 <= dis_uops_0_bits_fp_ctrl_ren1;
			stq_uop_2_fp_ctrl_ren2 <= dis_uops_0_bits_fp_ctrl_ren2;
			stq_uop_2_fp_ctrl_ren3 <= dis_uops_0_bits_fp_ctrl_ren3;
			stq_uop_2_fp_ctrl_swap12 <= dis_uops_0_bits_fp_ctrl_swap12;
			stq_uop_2_fp_ctrl_swap23 <= dis_uops_0_bits_fp_ctrl_swap23;
			stq_uop_2_fp_ctrl_typeTagIn <= dis_uops_0_bits_fp_ctrl_typeTagIn;
			stq_uop_2_fp_ctrl_typeTagOut <= dis_uops_0_bits_fp_ctrl_typeTagOut;
			stq_uop_2_fp_ctrl_fromint <= dis_uops_0_bits_fp_ctrl_fromint;
			stq_uop_2_fp_ctrl_toint <= dis_uops_0_bits_fp_ctrl_toint;
			stq_uop_2_fp_ctrl_fastpipe <= dis_uops_0_bits_fp_ctrl_fastpipe;
			stq_uop_2_fp_ctrl_fma <= dis_uops_0_bits_fp_ctrl_fma;
			stq_uop_2_fp_ctrl_div <= dis_uops_0_bits_fp_ctrl_div;
			stq_uop_2_fp_ctrl_sqrt <= dis_uops_0_bits_fp_ctrl_sqrt;
			stq_uop_2_fp_ctrl_wflags <= dis_uops_0_bits_fp_ctrl_wflags;
			stq_uop_2_fp_ctrl_vec <= dis_uops_0_bits_fp_ctrl_vec;
			stq_uop_2_rob_idx <= dis_uops_0_bits_rob_idx;
			stq_uop_2_ldq_idx <= dis_uops_0_bits_ldq_idx;
			stq_uop_2_stq_idx <= dis_uops_0_bits_stq_idx;
			stq_uop_2_rxq_idx <= dis_uops_0_bits_rxq_idx;
			stq_uop_2_prs1 <= dis_uops_0_bits_prs1;
			stq_uop_2_prs2 <= dis_uops_0_bits_prs2;
			stq_uop_2_prs3 <= dis_uops_0_bits_prs3;
			stq_uop_2_ppred <= dis_uops_0_bits_ppred;
			stq_uop_2_prs1_busy <= dis_uops_0_bits_prs1_busy;
			stq_uop_2_prs2_busy <= dis_uops_0_bits_prs2_busy;
			stq_uop_2_prs3_busy <= dis_uops_0_bits_prs3_busy;
			stq_uop_2_ppred_busy <= dis_uops_0_bits_ppred_busy;
			stq_uop_2_stale_pdst <= dis_uops_0_bits_stale_pdst;
			stq_uop_2_exc_cause <= dis_uops_0_bits_exc_cause;
			stq_uop_2_mem_cmd <= dis_uops_0_bits_mem_cmd;
			stq_uop_2_mem_size <= dis_uops_0_bits_mem_size;
			stq_uop_2_mem_signed <= dis_uops_0_bits_mem_signed;
			stq_uop_2_uses_ldq <= dis_uops_0_bits_uses_ldq;
			stq_uop_2_uses_stq <= dis_uops_0_bits_uses_stq;
			stq_uop_2_is_unique <= dis_uops_0_bits_is_unique;
			stq_uop_2_flush_on_commit <= dis_uops_0_bits_flush_on_commit;
			stq_uop_2_csr_cmd <= dis_uops_0_bits_csr_cmd;
			stq_uop_2_ldst_is_rs1 <= dis_uops_0_bits_ldst_is_rs1;
			stq_uop_2_ldst <= dis_uops_0_bits_ldst;
			stq_uop_2_lrs1 <= dis_uops_0_bits_lrs1;
			stq_uop_2_lrs2 <= dis_uops_0_bits_lrs2;
			stq_uop_2_lrs3 <= dis_uops_0_bits_lrs3;
			stq_uop_2_dst_rtype <= dis_uops_0_bits_dst_rtype;
			stq_uop_2_lrs1_rtype <= dis_uops_0_bits_lrs1_rtype;
			stq_uop_2_lrs2_rtype <= dis_uops_0_bits_lrs2_rtype;
			stq_uop_2_frs3_en <= dis_uops_0_bits_frs3_en;
			stq_uop_2_fcn_dw <= dis_uops_0_bits_fcn_dw;
			stq_uop_2_fcn_op <= dis_uops_0_bits_fcn_op;
			stq_uop_2_fp_val <= dis_uops_0_bits_fp_val;
			stq_uop_2_fp_rm <= dis_uops_0_bits_fp_rm;
			stq_uop_2_fp_typ <= dis_uops_0_bits_fp_typ;
			stq_uop_2_xcpt_pf_if <= dis_uops_0_bits_xcpt_pf_if;
			stq_uop_2_xcpt_ae_if <= dis_uops_0_bits_xcpt_ae_if;
			stq_uop_2_xcpt_ma_if <= dis_uops_0_bits_xcpt_ma_if;
			stq_uop_2_bp_debug_if <= dis_uops_0_bits_bp_debug_if;
			stq_uop_2_bp_xcpt_if <= dis_uops_0_bits_bp_xcpt_if;
			stq_uop_2_debug_fsrc <= dis_uops_0_bits_debug_fsrc;
			stq_uop_2_debug_tsrc <= dis_uops_0_bits_debug_tsrc;
		end
		if (stq_valid_2)
			stq_uop_2_br_mask <= stq_uop_2_br_mask & ~io_core_brupdate_b1_resolve_mask;
		else if (_GEN_473)
			stq_uop_2_br_mask <= stq_uop_out_br_mask;
		if (_GEN_508) begin
			if (_exe_cmd_T)
				stq_uop_2_pdst <= ldq_incoming_e_0_bits_uop_pdst;
			else if (will_fire_store_agen_0_will_fire)
				stq_uop_2_pdst <= stq_incoming_e_0_bits_uop_pdst;
			else
				stq_uop_2_pdst <= _exe_tlb_uop_T_3_pdst;
			stq_addr_2_bits <= _stq_addr_bits_T;
			stq_addr_is_virtual_2 <= exe_tlb_miss_0;
		end
		else if (_GEN_473)
			stq_uop_2_pdst <= dis_uops_0_bits_pdst;
		stq_uop_2_exception <= ((mem_xcpt_valids_0 & ~mem_xcpt_uops_0_uses_ldq) & (mem_xcpt_uops_0_stq_idx[2:0] == 3'h2)) | (_GEN_473 ? dis_uops_0_bits_exception : stq_uop_2_exception);
		if (_GEN_475) begin
			stq_uop_3_inst <= dis_uops_0_bits_inst;
			stq_uop_3_debug_inst <= dis_uops_0_bits_debug_inst;
			stq_uop_3_is_rvc <= dis_uops_0_bits_is_rvc;
			stq_uop_3_debug_pc <= dis_uops_0_bits_debug_pc;
			stq_uop_3_iq_type_0 <= dis_uops_0_bits_iq_type_0;
			stq_uop_3_iq_type_1 <= dis_uops_0_bits_iq_type_1;
			stq_uop_3_iq_type_2 <= dis_uops_0_bits_iq_type_2;
			stq_uop_3_iq_type_3 <= dis_uops_0_bits_iq_type_3;
			stq_uop_3_fu_code_0 <= dis_uops_0_bits_fu_code_0;
			stq_uop_3_fu_code_1 <= dis_uops_0_bits_fu_code_1;
			stq_uop_3_fu_code_2 <= dis_uops_0_bits_fu_code_2;
			stq_uop_3_fu_code_3 <= dis_uops_0_bits_fu_code_3;
			stq_uop_3_fu_code_4 <= dis_uops_0_bits_fu_code_4;
			stq_uop_3_fu_code_5 <= dis_uops_0_bits_fu_code_5;
			stq_uop_3_fu_code_6 <= dis_uops_0_bits_fu_code_6;
			stq_uop_3_fu_code_7 <= dis_uops_0_bits_fu_code_7;
			stq_uop_3_fu_code_8 <= dis_uops_0_bits_fu_code_8;
			stq_uop_3_fu_code_9 <= dis_uops_0_bits_fu_code_9;
			stq_uop_3_iw_issued <= dis_uops_0_bits_iw_issued;
			stq_uop_3_iw_issued_partial_agen <= dis_uops_0_bits_iw_issued_partial_agen;
			stq_uop_3_iw_issued_partial_dgen <= dis_uops_0_bits_iw_issued_partial_dgen;
			stq_uop_3_iw_p1_speculative_child <= dis_uops_0_bits_iw_p1_speculative_child;
			stq_uop_3_iw_p2_speculative_child <= dis_uops_0_bits_iw_p2_speculative_child;
			stq_uop_3_iw_p1_bypass_hint <= dis_uops_0_bits_iw_p1_bypass_hint;
			stq_uop_3_iw_p2_bypass_hint <= dis_uops_0_bits_iw_p2_bypass_hint;
			stq_uop_3_iw_p3_bypass_hint <= dis_uops_0_bits_iw_p3_bypass_hint;
			stq_uop_3_br_tag <= dis_uops_0_bits_br_tag;
			stq_uop_3_br_type <= dis_uops_0_bits_br_type;
			stq_uop_3_is_sfb <= dis_uops_0_bits_is_sfb;
			stq_uop_3_is_fence <= dis_uops_0_bits_is_fence;
			stq_uop_3_is_fencei <= dis_uops_0_bits_is_fencei;
			stq_uop_3_is_sfence <= dis_uops_0_bits_is_sfence;
			stq_uop_3_is_amo <= dis_uops_0_bits_is_amo;
			stq_uop_3_is_eret <= dis_uops_0_bits_is_eret;
			stq_uop_3_is_sys_pc2epc <= dis_uops_0_bits_is_sys_pc2epc;
			stq_uop_3_is_rocc <= dis_uops_0_bits_is_rocc;
			stq_uop_3_is_mov <= dis_uops_0_bits_is_mov;
			stq_uop_3_ftq_idx <= dis_uops_0_bits_ftq_idx;
			stq_uop_3_edge_inst <= dis_uops_0_bits_edge_inst;
			stq_uop_3_pc_lob <= dis_uops_0_bits_pc_lob;
			stq_uop_3_taken <= dis_uops_0_bits_taken;
			stq_uop_3_imm_rename <= dis_uops_0_bits_imm_rename;
			stq_uop_3_imm_sel <= dis_uops_0_bits_imm_sel;
			stq_uop_3_pimm <= dis_uops_0_bits_pimm;
			stq_uop_3_imm_packed <= dis_uops_0_bits_imm_packed;
			stq_uop_3_op1_sel <= dis_uops_0_bits_op1_sel;
			stq_uop_3_op2_sel <= dis_uops_0_bits_op2_sel;
			stq_uop_3_fp_ctrl_ldst <= dis_uops_0_bits_fp_ctrl_ldst;
			stq_uop_3_fp_ctrl_wen <= dis_uops_0_bits_fp_ctrl_wen;
			stq_uop_3_fp_ctrl_ren1 <= dis_uops_0_bits_fp_ctrl_ren1;
			stq_uop_3_fp_ctrl_ren2 <= dis_uops_0_bits_fp_ctrl_ren2;
			stq_uop_3_fp_ctrl_ren3 <= dis_uops_0_bits_fp_ctrl_ren3;
			stq_uop_3_fp_ctrl_swap12 <= dis_uops_0_bits_fp_ctrl_swap12;
			stq_uop_3_fp_ctrl_swap23 <= dis_uops_0_bits_fp_ctrl_swap23;
			stq_uop_3_fp_ctrl_typeTagIn <= dis_uops_0_bits_fp_ctrl_typeTagIn;
			stq_uop_3_fp_ctrl_typeTagOut <= dis_uops_0_bits_fp_ctrl_typeTagOut;
			stq_uop_3_fp_ctrl_fromint <= dis_uops_0_bits_fp_ctrl_fromint;
			stq_uop_3_fp_ctrl_toint <= dis_uops_0_bits_fp_ctrl_toint;
			stq_uop_3_fp_ctrl_fastpipe <= dis_uops_0_bits_fp_ctrl_fastpipe;
			stq_uop_3_fp_ctrl_fma <= dis_uops_0_bits_fp_ctrl_fma;
			stq_uop_3_fp_ctrl_div <= dis_uops_0_bits_fp_ctrl_div;
			stq_uop_3_fp_ctrl_sqrt <= dis_uops_0_bits_fp_ctrl_sqrt;
			stq_uop_3_fp_ctrl_wflags <= dis_uops_0_bits_fp_ctrl_wflags;
			stq_uop_3_fp_ctrl_vec <= dis_uops_0_bits_fp_ctrl_vec;
			stq_uop_3_rob_idx <= dis_uops_0_bits_rob_idx;
			stq_uop_3_ldq_idx <= dis_uops_0_bits_ldq_idx;
			stq_uop_3_stq_idx <= dis_uops_0_bits_stq_idx;
			stq_uop_3_rxq_idx <= dis_uops_0_bits_rxq_idx;
			stq_uop_3_prs1 <= dis_uops_0_bits_prs1;
			stq_uop_3_prs2 <= dis_uops_0_bits_prs2;
			stq_uop_3_prs3 <= dis_uops_0_bits_prs3;
			stq_uop_3_ppred <= dis_uops_0_bits_ppred;
			stq_uop_3_prs1_busy <= dis_uops_0_bits_prs1_busy;
			stq_uop_3_prs2_busy <= dis_uops_0_bits_prs2_busy;
			stq_uop_3_prs3_busy <= dis_uops_0_bits_prs3_busy;
			stq_uop_3_ppred_busy <= dis_uops_0_bits_ppred_busy;
			stq_uop_3_stale_pdst <= dis_uops_0_bits_stale_pdst;
			stq_uop_3_exc_cause <= dis_uops_0_bits_exc_cause;
			stq_uop_3_mem_cmd <= dis_uops_0_bits_mem_cmd;
			stq_uop_3_mem_size <= dis_uops_0_bits_mem_size;
			stq_uop_3_mem_signed <= dis_uops_0_bits_mem_signed;
			stq_uop_3_uses_ldq <= dis_uops_0_bits_uses_ldq;
			stq_uop_3_uses_stq <= dis_uops_0_bits_uses_stq;
			stq_uop_3_is_unique <= dis_uops_0_bits_is_unique;
			stq_uop_3_flush_on_commit <= dis_uops_0_bits_flush_on_commit;
			stq_uop_3_csr_cmd <= dis_uops_0_bits_csr_cmd;
			stq_uop_3_ldst_is_rs1 <= dis_uops_0_bits_ldst_is_rs1;
			stq_uop_3_ldst <= dis_uops_0_bits_ldst;
			stq_uop_3_lrs1 <= dis_uops_0_bits_lrs1;
			stq_uop_3_lrs2 <= dis_uops_0_bits_lrs2;
			stq_uop_3_lrs3 <= dis_uops_0_bits_lrs3;
			stq_uop_3_dst_rtype <= dis_uops_0_bits_dst_rtype;
			stq_uop_3_lrs1_rtype <= dis_uops_0_bits_lrs1_rtype;
			stq_uop_3_lrs2_rtype <= dis_uops_0_bits_lrs2_rtype;
			stq_uop_3_frs3_en <= dis_uops_0_bits_frs3_en;
			stq_uop_3_fcn_dw <= dis_uops_0_bits_fcn_dw;
			stq_uop_3_fcn_op <= dis_uops_0_bits_fcn_op;
			stq_uop_3_fp_val <= dis_uops_0_bits_fp_val;
			stq_uop_3_fp_rm <= dis_uops_0_bits_fp_rm;
			stq_uop_3_fp_typ <= dis_uops_0_bits_fp_typ;
			stq_uop_3_xcpt_pf_if <= dis_uops_0_bits_xcpt_pf_if;
			stq_uop_3_xcpt_ae_if <= dis_uops_0_bits_xcpt_ae_if;
			stq_uop_3_xcpt_ma_if <= dis_uops_0_bits_xcpt_ma_if;
			stq_uop_3_bp_debug_if <= dis_uops_0_bits_bp_debug_if;
			stq_uop_3_bp_xcpt_if <= dis_uops_0_bits_bp_xcpt_if;
			stq_uop_3_debug_fsrc <= dis_uops_0_bits_debug_fsrc;
			stq_uop_3_debug_tsrc <= dis_uops_0_bits_debug_tsrc;
		end
		if (stq_valid_3)
			stq_uop_3_br_mask <= stq_uop_3_br_mask & ~io_core_brupdate_b1_resolve_mask;
		else if (_GEN_475)
			stq_uop_3_br_mask <= stq_uop_out_br_mask;
		if (_GEN_509) begin
			if (_exe_cmd_T)
				stq_uop_3_pdst <= ldq_incoming_e_0_bits_uop_pdst;
			else if (will_fire_store_agen_0_will_fire)
				stq_uop_3_pdst <= stq_incoming_e_0_bits_uop_pdst;
			else
				stq_uop_3_pdst <= _exe_tlb_uop_T_3_pdst;
			stq_addr_3_bits <= _stq_addr_bits_T;
			stq_addr_is_virtual_3 <= exe_tlb_miss_0;
		end
		else if (_GEN_475)
			stq_uop_3_pdst <= dis_uops_0_bits_pdst;
		stq_uop_3_exception <= ((mem_xcpt_valids_0 & ~mem_xcpt_uops_0_uses_ldq) & (mem_xcpt_uops_0_stq_idx[2:0] == 3'h3)) | (_GEN_475 ? dis_uops_0_bits_exception : stq_uop_3_exception);
		if (_GEN_477) begin
			stq_uop_4_inst <= dis_uops_0_bits_inst;
			stq_uop_4_debug_inst <= dis_uops_0_bits_debug_inst;
			stq_uop_4_is_rvc <= dis_uops_0_bits_is_rvc;
			stq_uop_4_debug_pc <= dis_uops_0_bits_debug_pc;
			stq_uop_4_iq_type_0 <= dis_uops_0_bits_iq_type_0;
			stq_uop_4_iq_type_1 <= dis_uops_0_bits_iq_type_1;
			stq_uop_4_iq_type_2 <= dis_uops_0_bits_iq_type_2;
			stq_uop_4_iq_type_3 <= dis_uops_0_bits_iq_type_3;
			stq_uop_4_fu_code_0 <= dis_uops_0_bits_fu_code_0;
			stq_uop_4_fu_code_1 <= dis_uops_0_bits_fu_code_1;
			stq_uop_4_fu_code_2 <= dis_uops_0_bits_fu_code_2;
			stq_uop_4_fu_code_3 <= dis_uops_0_bits_fu_code_3;
			stq_uop_4_fu_code_4 <= dis_uops_0_bits_fu_code_4;
			stq_uop_4_fu_code_5 <= dis_uops_0_bits_fu_code_5;
			stq_uop_4_fu_code_6 <= dis_uops_0_bits_fu_code_6;
			stq_uop_4_fu_code_7 <= dis_uops_0_bits_fu_code_7;
			stq_uop_4_fu_code_8 <= dis_uops_0_bits_fu_code_8;
			stq_uop_4_fu_code_9 <= dis_uops_0_bits_fu_code_9;
			stq_uop_4_iw_issued <= dis_uops_0_bits_iw_issued;
			stq_uop_4_iw_issued_partial_agen <= dis_uops_0_bits_iw_issued_partial_agen;
			stq_uop_4_iw_issued_partial_dgen <= dis_uops_0_bits_iw_issued_partial_dgen;
			stq_uop_4_iw_p1_speculative_child <= dis_uops_0_bits_iw_p1_speculative_child;
			stq_uop_4_iw_p2_speculative_child <= dis_uops_0_bits_iw_p2_speculative_child;
			stq_uop_4_iw_p1_bypass_hint <= dis_uops_0_bits_iw_p1_bypass_hint;
			stq_uop_4_iw_p2_bypass_hint <= dis_uops_0_bits_iw_p2_bypass_hint;
			stq_uop_4_iw_p3_bypass_hint <= dis_uops_0_bits_iw_p3_bypass_hint;
			stq_uop_4_br_tag <= dis_uops_0_bits_br_tag;
			stq_uop_4_br_type <= dis_uops_0_bits_br_type;
			stq_uop_4_is_sfb <= dis_uops_0_bits_is_sfb;
			stq_uop_4_is_fence <= dis_uops_0_bits_is_fence;
			stq_uop_4_is_fencei <= dis_uops_0_bits_is_fencei;
			stq_uop_4_is_sfence <= dis_uops_0_bits_is_sfence;
			stq_uop_4_is_amo <= dis_uops_0_bits_is_amo;
			stq_uop_4_is_eret <= dis_uops_0_bits_is_eret;
			stq_uop_4_is_sys_pc2epc <= dis_uops_0_bits_is_sys_pc2epc;
			stq_uop_4_is_rocc <= dis_uops_0_bits_is_rocc;
			stq_uop_4_is_mov <= dis_uops_0_bits_is_mov;
			stq_uop_4_ftq_idx <= dis_uops_0_bits_ftq_idx;
			stq_uop_4_edge_inst <= dis_uops_0_bits_edge_inst;
			stq_uop_4_pc_lob <= dis_uops_0_bits_pc_lob;
			stq_uop_4_taken <= dis_uops_0_bits_taken;
			stq_uop_4_imm_rename <= dis_uops_0_bits_imm_rename;
			stq_uop_4_imm_sel <= dis_uops_0_bits_imm_sel;
			stq_uop_4_pimm <= dis_uops_0_bits_pimm;
			stq_uop_4_imm_packed <= dis_uops_0_bits_imm_packed;
			stq_uop_4_op1_sel <= dis_uops_0_bits_op1_sel;
			stq_uop_4_op2_sel <= dis_uops_0_bits_op2_sel;
			stq_uop_4_fp_ctrl_ldst <= dis_uops_0_bits_fp_ctrl_ldst;
			stq_uop_4_fp_ctrl_wen <= dis_uops_0_bits_fp_ctrl_wen;
			stq_uop_4_fp_ctrl_ren1 <= dis_uops_0_bits_fp_ctrl_ren1;
			stq_uop_4_fp_ctrl_ren2 <= dis_uops_0_bits_fp_ctrl_ren2;
			stq_uop_4_fp_ctrl_ren3 <= dis_uops_0_bits_fp_ctrl_ren3;
			stq_uop_4_fp_ctrl_swap12 <= dis_uops_0_bits_fp_ctrl_swap12;
			stq_uop_4_fp_ctrl_swap23 <= dis_uops_0_bits_fp_ctrl_swap23;
			stq_uop_4_fp_ctrl_typeTagIn <= dis_uops_0_bits_fp_ctrl_typeTagIn;
			stq_uop_4_fp_ctrl_typeTagOut <= dis_uops_0_bits_fp_ctrl_typeTagOut;
			stq_uop_4_fp_ctrl_fromint <= dis_uops_0_bits_fp_ctrl_fromint;
			stq_uop_4_fp_ctrl_toint <= dis_uops_0_bits_fp_ctrl_toint;
			stq_uop_4_fp_ctrl_fastpipe <= dis_uops_0_bits_fp_ctrl_fastpipe;
			stq_uop_4_fp_ctrl_fma <= dis_uops_0_bits_fp_ctrl_fma;
			stq_uop_4_fp_ctrl_div <= dis_uops_0_bits_fp_ctrl_div;
			stq_uop_4_fp_ctrl_sqrt <= dis_uops_0_bits_fp_ctrl_sqrt;
			stq_uop_4_fp_ctrl_wflags <= dis_uops_0_bits_fp_ctrl_wflags;
			stq_uop_4_fp_ctrl_vec <= dis_uops_0_bits_fp_ctrl_vec;
			stq_uop_4_rob_idx <= dis_uops_0_bits_rob_idx;
			stq_uop_4_ldq_idx <= dis_uops_0_bits_ldq_idx;
			stq_uop_4_stq_idx <= dis_uops_0_bits_stq_idx;
			stq_uop_4_rxq_idx <= dis_uops_0_bits_rxq_idx;
			stq_uop_4_prs1 <= dis_uops_0_bits_prs1;
			stq_uop_4_prs2 <= dis_uops_0_bits_prs2;
			stq_uop_4_prs3 <= dis_uops_0_bits_prs3;
			stq_uop_4_ppred <= dis_uops_0_bits_ppred;
			stq_uop_4_prs1_busy <= dis_uops_0_bits_prs1_busy;
			stq_uop_4_prs2_busy <= dis_uops_0_bits_prs2_busy;
			stq_uop_4_prs3_busy <= dis_uops_0_bits_prs3_busy;
			stq_uop_4_ppred_busy <= dis_uops_0_bits_ppred_busy;
			stq_uop_4_stale_pdst <= dis_uops_0_bits_stale_pdst;
			stq_uop_4_exc_cause <= dis_uops_0_bits_exc_cause;
			stq_uop_4_mem_cmd <= dis_uops_0_bits_mem_cmd;
			stq_uop_4_mem_size <= dis_uops_0_bits_mem_size;
			stq_uop_4_mem_signed <= dis_uops_0_bits_mem_signed;
			stq_uop_4_uses_ldq <= dis_uops_0_bits_uses_ldq;
			stq_uop_4_uses_stq <= dis_uops_0_bits_uses_stq;
			stq_uop_4_is_unique <= dis_uops_0_bits_is_unique;
			stq_uop_4_flush_on_commit <= dis_uops_0_bits_flush_on_commit;
			stq_uop_4_csr_cmd <= dis_uops_0_bits_csr_cmd;
			stq_uop_4_ldst_is_rs1 <= dis_uops_0_bits_ldst_is_rs1;
			stq_uop_4_ldst <= dis_uops_0_bits_ldst;
			stq_uop_4_lrs1 <= dis_uops_0_bits_lrs1;
			stq_uop_4_lrs2 <= dis_uops_0_bits_lrs2;
			stq_uop_4_lrs3 <= dis_uops_0_bits_lrs3;
			stq_uop_4_dst_rtype <= dis_uops_0_bits_dst_rtype;
			stq_uop_4_lrs1_rtype <= dis_uops_0_bits_lrs1_rtype;
			stq_uop_4_lrs2_rtype <= dis_uops_0_bits_lrs2_rtype;
			stq_uop_4_frs3_en <= dis_uops_0_bits_frs3_en;
			stq_uop_4_fcn_dw <= dis_uops_0_bits_fcn_dw;
			stq_uop_4_fcn_op <= dis_uops_0_bits_fcn_op;
			stq_uop_4_fp_val <= dis_uops_0_bits_fp_val;
			stq_uop_4_fp_rm <= dis_uops_0_bits_fp_rm;
			stq_uop_4_fp_typ <= dis_uops_0_bits_fp_typ;
			stq_uop_4_xcpt_pf_if <= dis_uops_0_bits_xcpt_pf_if;
			stq_uop_4_xcpt_ae_if <= dis_uops_0_bits_xcpt_ae_if;
			stq_uop_4_xcpt_ma_if <= dis_uops_0_bits_xcpt_ma_if;
			stq_uop_4_bp_debug_if <= dis_uops_0_bits_bp_debug_if;
			stq_uop_4_bp_xcpt_if <= dis_uops_0_bits_bp_xcpt_if;
			stq_uop_4_debug_fsrc <= dis_uops_0_bits_debug_fsrc;
			stq_uop_4_debug_tsrc <= dis_uops_0_bits_debug_tsrc;
		end
		if (stq_valid_4)
			stq_uop_4_br_mask <= stq_uop_4_br_mask & ~io_core_brupdate_b1_resolve_mask;
		else if (_GEN_477)
			stq_uop_4_br_mask <= stq_uop_out_br_mask;
		if (_GEN_510) begin
			if (_exe_cmd_T)
				stq_uop_4_pdst <= ldq_incoming_e_0_bits_uop_pdst;
			else if (will_fire_store_agen_0_will_fire)
				stq_uop_4_pdst <= stq_incoming_e_0_bits_uop_pdst;
			else
				stq_uop_4_pdst <= _exe_tlb_uop_T_3_pdst;
			stq_addr_4_bits <= _stq_addr_bits_T;
			stq_addr_is_virtual_4 <= exe_tlb_miss_0;
		end
		else if (_GEN_477)
			stq_uop_4_pdst <= dis_uops_0_bits_pdst;
		stq_uop_4_exception <= ((mem_xcpt_valids_0 & ~mem_xcpt_uops_0_uses_ldq) & (mem_xcpt_uops_0_stq_idx[2:0] == 3'h4)) | (_GEN_477 ? dis_uops_0_bits_exception : stq_uop_4_exception);
		if (_GEN_479) begin
			stq_uop_5_inst <= dis_uops_0_bits_inst;
			stq_uop_5_debug_inst <= dis_uops_0_bits_debug_inst;
			stq_uop_5_is_rvc <= dis_uops_0_bits_is_rvc;
			stq_uop_5_debug_pc <= dis_uops_0_bits_debug_pc;
			stq_uop_5_iq_type_0 <= dis_uops_0_bits_iq_type_0;
			stq_uop_5_iq_type_1 <= dis_uops_0_bits_iq_type_1;
			stq_uop_5_iq_type_2 <= dis_uops_0_bits_iq_type_2;
			stq_uop_5_iq_type_3 <= dis_uops_0_bits_iq_type_3;
			stq_uop_5_fu_code_0 <= dis_uops_0_bits_fu_code_0;
			stq_uop_5_fu_code_1 <= dis_uops_0_bits_fu_code_1;
			stq_uop_5_fu_code_2 <= dis_uops_0_bits_fu_code_2;
			stq_uop_5_fu_code_3 <= dis_uops_0_bits_fu_code_3;
			stq_uop_5_fu_code_4 <= dis_uops_0_bits_fu_code_4;
			stq_uop_5_fu_code_5 <= dis_uops_0_bits_fu_code_5;
			stq_uop_5_fu_code_6 <= dis_uops_0_bits_fu_code_6;
			stq_uop_5_fu_code_7 <= dis_uops_0_bits_fu_code_7;
			stq_uop_5_fu_code_8 <= dis_uops_0_bits_fu_code_8;
			stq_uop_5_fu_code_9 <= dis_uops_0_bits_fu_code_9;
			stq_uop_5_iw_issued <= dis_uops_0_bits_iw_issued;
			stq_uop_5_iw_issued_partial_agen <= dis_uops_0_bits_iw_issued_partial_agen;
			stq_uop_5_iw_issued_partial_dgen <= dis_uops_0_bits_iw_issued_partial_dgen;
			stq_uop_5_iw_p1_speculative_child <= dis_uops_0_bits_iw_p1_speculative_child;
			stq_uop_5_iw_p2_speculative_child <= dis_uops_0_bits_iw_p2_speculative_child;
			stq_uop_5_iw_p1_bypass_hint <= dis_uops_0_bits_iw_p1_bypass_hint;
			stq_uop_5_iw_p2_bypass_hint <= dis_uops_0_bits_iw_p2_bypass_hint;
			stq_uop_5_iw_p3_bypass_hint <= dis_uops_0_bits_iw_p3_bypass_hint;
			stq_uop_5_br_tag <= dis_uops_0_bits_br_tag;
			stq_uop_5_br_type <= dis_uops_0_bits_br_type;
			stq_uop_5_is_sfb <= dis_uops_0_bits_is_sfb;
			stq_uop_5_is_fence <= dis_uops_0_bits_is_fence;
			stq_uop_5_is_fencei <= dis_uops_0_bits_is_fencei;
			stq_uop_5_is_sfence <= dis_uops_0_bits_is_sfence;
			stq_uop_5_is_amo <= dis_uops_0_bits_is_amo;
			stq_uop_5_is_eret <= dis_uops_0_bits_is_eret;
			stq_uop_5_is_sys_pc2epc <= dis_uops_0_bits_is_sys_pc2epc;
			stq_uop_5_is_rocc <= dis_uops_0_bits_is_rocc;
			stq_uop_5_is_mov <= dis_uops_0_bits_is_mov;
			stq_uop_5_ftq_idx <= dis_uops_0_bits_ftq_idx;
			stq_uop_5_edge_inst <= dis_uops_0_bits_edge_inst;
			stq_uop_5_pc_lob <= dis_uops_0_bits_pc_lob;
			stq_uop_5_taken <= dis_uops_0_bits_taken;
			stq_uop_5_imm_rename <= dis_uops_0_bits_imm_rename;
			stq_uop_5_imm_sel <= dis_uops_0_bits_imm_sel;
			stq_uop_5_pimm <= dis_uops_0_bits_pimm;
			stq_uop_5_imm_packed <= dis_uops_0_bits_imm_packed;
			stq_uop_5_op1_sel <= dis_uops_0_bits_op1_sel;
			stq_uop_5_op2_sel <= dis_uops_0_bits_op2_sel;
			stq_uop_5_fp_ctrl_ldst <= dis_uops_0_bits_fp_ctrl_ldst;
			stq_uop_5_fp_ctrl_wen <= dis_uops_0_bits_fp_ctrl_wen;
			stq_uop_5_fp_ctrl_ren1 <= dis_uops_0_bits_fp_ctrl_ren1;
			stq_uop_5_fp_ctrl_ren2 <= dis_uops_0_bits_fp_ctrl_ren2;
			stq_uop_5_fp_ctrl_ren3 <= dis_uops_0_bits_fp_ctrl_ren3;
			stq_uop_5_fp_ctrl_swap12 <= dis_uops_0_bits_fp_ctrl_swap12;
			stq_uop_5_fp_ctrl_swap23 <= dis_uops_0_bits_fp_ctrl_swap23;
			stq_uop_5_fp_ctrl_typeTagIn <= dis_uops_0_bits_fp_ctrl_typeTagIn;
			stq_uop_5_fp_ctrl_typeTagOut <= dis_uops_0_bits_fp_ctrl_typeTagOut;
			stq_uop_5_fp_ctrl_fromint <= dis_uops_0_bits_fp_ctrl_fromint;
			stq_uop_5_fp_ctrl_toint <= dis_uops_0_bits_fp_ctrl_toint;
			stq_uop_5_fp_ctrl_fastpipe <= dis_uops_0_bits_fp_ctrl_fastpipe;
			stq_uop_5_fp_ctrl_fma <= dis_uops_0_bits_fp_ctrl_fma;
			stq_uop_5_fp_ctrl_div <= dis_uops_0_bits_fp_ctrl_div;
			stq_uop_5_fp_ctrl_sqrt <= dis_uops_0_bits_fp_ctrl_sqrt;
			stq_uop_5_fp_ctrl_wflags <= dis_uops_0_bits_fp_ctrl_wflags;
			stq_uop_5_fp_ctrl_vec <= dis_uops_0_bits_fp_ctrl_vec;
			stq_uop_5_rob_idx <= dis_uops_0_bits_rob_idx;
			stq_uop_5_ldq_idx <= dis_uops_0_bits_ldq_idx;
			stq_uop_5_stq_idx <= dis_uops_0_bits_stq_idx;
			stq_uop_5_rxq_idx <= dis_uops_0_bits_rxq_idx;
			stq_uop_5_prs1 <= dis_uops_0_bits_prs1;
			stq_uop_5_prs2 <= dis_uops_0_bits_prs2;
			stq_uop_5_prs3 <= dis_uops_0_bits_prs3;
			stq_uop_5_ppred <= dis_uops_0_bits_ppred;
			stq_uop_5_prs1_busy <= dis_uops_0_bits_prs1_busy;
			stq_uop_5_prs2_busy <= dis_uops_0_bits_prs2_busy;
			stq_uop_5_prs3_busy <= dis_uops_0_bits_prs3_busy;
			stq_uop_5_ppred_busy <= dis_uops_0_bits_ppred_busy;
			stq_uop_5_stale_pdst <= dis_uops_0_bits_stale_pdst;
			stq_uop_5_exc_cause <= dis_uops_0_bits_exc_cause;
			stq_uop_5_mem_cmd <= dis_uops_0_bits_mem_cmd;
			stq_uop_5_mem_size <= dis_uops_0_bits_mem_size;
			stq_uop_5_mem_signed <= dis_uops_0_bits_mem_signed;
			stq_uop_5_uses_ldq <= dis_uops_0_bits_uses_ldq;
			stq_uop_5_uses_stq <= dis_uops_0_bits_uses_stq;
			stq_uop_5_is_unique <= dis_uops_0_bits_is_unique;
			stq_uop_5_flush_on_commit <= dis_uops_0_bits_flush_on_commit;
			stq_uop_5_csr_cmd <= dis_uops_0_bits_csr_cmd;
			stq_uop_5_ldst_is_rs1 <= dis_uops_0_bits_ldst_is_rs1;
			stq_uop_5_ldst <= dis_uops_0_bits_ldst;
			stq_uop_5_lrs1 <= dis_uops_0_bits_lrs1;
			stq_uop_5_lrs2 <= dis_uops_0_bits_lrs2;
			stq_uop_5_lrs3 <= dis_uops_0_bits_lrs3;
			stq_uop_5_dst_rtype <= dis_uops_0_bits_dst_rtype;
			stq_uop_5_lrs1_rtype <= dis_uops_0_bits_lrs1_rtype;
			stq_uop_5_lrs2_rtype <= dis_uops_0_bits_lrs2_rtype;
			stq_uop_5_frs3_en <= dis_uops_0_bits_frs3_en;
			stq_uop_5_fcn_dw <= dis_uops_0_bits_fcn_dw;
			stq_uop_5_fcn_op <= dis_uops_0_bits_fcn_op;
			stq_uop_5_fp_val <= dis_uops_0_bits_fp_val;
			stq_uop_5_fp_rm <= dis_uops_0_bits_fp_rm;
			stq_uop_5_fp_typ <= dis_uops_0_bits_fp_typ;
			stq_uop_5_xcpt_pf_if <= dis_uops_0_bits_xcpt_pf_if;
			stq_uop_5_xcpt_ae_if <= dis_uops_0_bits_xcpt_ae_if;
			stq_uop_5_xcpt_ma_if <= dis_uops_0_bits_xcpt_ma_if;
			stq_uop_5_bp_debug_if <= dis_uops_0_bits_bp_debug_if;
			stq_uop_5_bp_xcpt_if <= dis_uops_0_bits_bp_xcpt_if;
			stq_uop_5_debug_fsrc <= dis_uops_0_bits_debug_fsrc;
			stq_uop_5_debug_tsrc <= dis_uops_0_bits_debug_tsrc;
		end
		if (stq_valid_5)
			stq_uop_5_br_mask <= stq_uop_5_br_mask & ~io_core_brupdate_b1_resolve_mask;
		else if (_GEN_479)
			stq_uop_5_br_mask <= stq_uop_out_br_mask;
		if (_GEN_511) begin
			if (_exe_cmd_T)
				stq_uop_5_pdst <= ldq_incoming_e_0_bits_uop_pdst;
			else if (will_fire_store_agen_0_will_fire)
				stq_uop_5_pdst <= stq_incoming_e_0_bits_uop_pdst;
			else
				stq_uop_5_pdst <= _exe_tlb_uop_T_3_pdst;
			stq_addr_5_bits <= _stq_addr_bits_T;
			stq_addr_is_virtual_5 <= exe_tlb_miss_0;
		end
		else if (_GEN_479)
			stq_uop_5_pdst <= dis_uops_0_bits_pdst;
		stq_uop_5_exception <= ((mem_xcpt_valids_0 & ~mem_xcpt_uops_0_uses_ldq) & (mem_xcpt_uops_0_stq_idx[2:0] == 3'h5)) | (_GEN_479 ? dis_uops_0_bits_exception : stq_uop_5_exception);
		if (_GEN_481) begin
			stq_uop_6_inst <= dis_uops_0_bits_inst;
			stq_uop_6_debug_inst <= dis_uops_0_bits_debug_inst;
			stq_uop_6_is_rvc <= dis_uops_0_bits_is_rvc;
			stq_uop_6_debug_pc <= dis_uops_0_bits_debug_pc;
			stq_uop_6_iq_type_0 <= dis_uops_0_bits_iq_type_0;
			stq_uop_6_iq_type_1 <= dis_uops_0_bits_iq_type_1;
			stq_uop_6_iq_type_2 <= dis_uops_0_bits_iq_type_2;
			stq_uop_6_iq_type_3 <= dis_uops_0_bits_iq_type_3;
			stq_uop_6_fu_code_0 <= dis_uops_0_bits_fu_code_0;
			stq_uop_6_fu_code_1 <= dis_uops_0_bits_fu_code_1;
			stq_uop_6_fu_code_2 <= dis_uops_0_bits_fu_code_2;
			stq_uop_6_fu_code_3 <= dis_uops_0_bits_fu_code_3;
			stq_uop_6_fu_code_4 <= dis_uops_0_bits_fu_code_4;
			stq_uop_6_fu_code_5 <= dis_uops_0_bits_fu_code_5;
			stq_uop_6_fu_code_6 <= dis_uops_0_bits_fu_code_6;
			stq_uop_6_fu_code_7 <= dis_uops_0_bits_fu_code_7;
			stq_uop_6_fu_code_8 <= dis_uops_0_bits_fu_code_8;
			stq_uop_6_fu_code_9 <= dis_uops_0_bits_fu_code_9;
			stq_uop_6_iw_issued <= dis_uops_0_bits_iw_issued;
			stq_uop_6_iw_issued_partial_agen <= dis_uops_0_bits_iw_issued_partial_agen;
			stq_uop_6_iw_issued_partial_dgen <= dis_uops_0_bits_iw_issued_partial_dgen;
			stq_uop_6_iw_p1_speculative_child <= dis_uops_0_bits_iw_p1_speculative_child;
			stq_uop_6_iw_p2_speculative_child <= dis_uops_0_bits_iw_p2_speculative_child;
			stq_uop_6_iw_p1_bypass_hint <= dis_uops_0_bits_iw_p1_bypass_hint;
			stq_uop_6_iw_p2_bypass_hint <= dis_uops_0_bits_iw_p2_bypass_hint;
			stq_uop_6_iw_p3_bypass_hint <= dis_uops_0_bits_iw_p3_bypass_hint;
			stq_uop_6_br_tag <= dis_uops_0_bits_br_tag;
			stq_uop_6_br_type <= dis_uops_0_bits_br_type;
			stq_uop_6_is_sfb <= dis_uops_0_bits_is_sfb;
			stq_uop_6_is_fence <= dis_uops_0_bits_is_fence;
			stq_uop_6_is_fencei <= dis_uops_0_bits_is_fencei;
			stq_uop_6_is_sfence <= dis_uops_0_bits_is_sfence;
			stq_uop_6_is_amo <= dis_uops_0_bits_is_amo;
			stq_uop_6_is_eret <= dis_uops_0_bits_is_eret;
			stq_uop_6_is_sys_pc2epc <= dis_uops_0_bits_is_sys_pc2epc;
			stq_uop_6_is_rocc <= dis_uops_0_bits_is_rocc;
			stq_uop_6_is_mov <= dis_uops_0_bits_is_mov;
			stq_uop_6_ftq_idx <= dis_uops_0_bits_ftq_idx;
			stq_uop_6_edge_inst <= dis_uops_0_bits_edge_inst;
			stq_uop_6_pc_lob <= dis_uops_0_bits_pc_lob;
			stq_uop_6_taken <= dis_uops_0_bits_taken;
			stq_uop_6_imm_rename <= dis_uops_0_bits_imm_rename;
			stq_uop_6_imm_sel <= dis_uops_0_bits_imm_sel;
			stq_uop_6_pimm <= dis_uops_0_bits_pimm;
			stq_uop_6_imm_packed <= dis_uops_0_bits_imm_packed;
			stq_uop_6_op1_sel <= dis_uops_0_bits_op1_sel;
			stq_uop_6_op2_sel <= dis_uops_0_bits_op2_sel;
			stq_uop_6_fp_ctrl_ldst <= dis_uops_0_bits_fp_ctrl_ldst;
			stq_uop_6_fp_ctrl_wen <= dis_uops_0_bits_fp_ctrl_wen;
			stq_uop_6_fp_ctrl_ren1 <= dis_uops_0_bits_fp_ctrl_ren1;
			stq_uop_6_fp_ctrl_ren2 <= dis_uops_0_bits_fp_ctrl_ren2;
			stq_uop_6_fp_ctrl_ren3 <= dis_uops_0_bits_fp_ctrl_ren3;
			stq_uop_6_fp_ctrl_swap12 <= dis_uops_0_bits_fp_ctrl_swap12;
			stq_uop_6_fp_ctrl_swap23 <= dis_uops_0_bits_fp_ctrl_swap23;
			stq_uop_6_fp_ctrl_typeTagIn <= dis_uops_0_bits_fp_ctrl_typeTagIn;
			stq_uop_6_fp_ctrl_typeTagOut <= dis_uops_0_bits_fp_ctrl_typeTagOut;
			stq_uop_6_fp_ctrl_fromint <= dis_uops_0_bits_fp_ctrl_fromint;
			stq_uop_6_fp_ctrl_toint <= dis_uops_0_bits_fp_ctrl_toint;
			stq_uop_6_fp_ctrl_fastpipe <= dis_uops_0_bits_fp_ctrl_fastpipe;
			stq_uop_6_fp_ctrl_fma <= dis_uops_0_bits_fp_ctrl_fma;
			stq_uop_6_fp_ctrl_div <= dis_uops_0_bits_fp_ctrl_div;
			stq_uop_6_fp_ctrl_sqrt <= dis_uops_0_bits_fp_ctrl_sqrt;
			stq_uop_6_fp_ctrl_wflags <= dis_uops_0_bits_fp_ctrl_wflags;
			stq_uop_6_fp_ctrl_vec <= dis_uops_0_bits_fp_ctrl_vec;
			stq_uop_6_rob_idx <= dis_uops_0_bits_rob_idx;
			stq_uop_6_ldq_idx <= dis_uops_0_bits_ldq_idx;
			stq_uop_6_stq_idx <= dis_uops_0_bits_stq_idx;
			stq_uop_6_rxq_idx <= dis_uops_0_bits_rxq_idx;
			stq_uop_6_prs1 <= dis_uops_0_bits_prs1;
			stq_uop_6_prs2 <= dis_uops_0_bits_prs2;
			stq_uop_6_prs3 <= dis_uops_0_bits_prs3;
			stq_uop_6_ppred <= dis_uops_0_bits_ppred;
			stq_uop_6_prs1_busy <= dis_uops_0_bits_prs1_busy;
			stq_uop_6_prs2_busy <= dis_uops_0_bits_prs2_busy;
			stq_uop_6_prs3_busy <= dis_uops_0_bits_prs3_busy;
			stq_uop_6_ppred_busy <= dis_uops_0_bits_ppred_busy;
			stq_uop_6_stale_pdst <= dis_uops_0_bits_stale_pdst;
			stq_uop_6_exc_cause <= dis_uops_0_bits_exc_cause;
			stq_uop_6_mem_cmd <= dis_uops_0_bits_mem_cmd;
			stq_uop_6_mem_size <= dis_uops_0_bits_mem_size;
			stq_uop_6_mem_signed <= dis_uops_0_bits_mem_signed;
			stq_uop_6_uses_ldq <= dis_uops_0_bits_uses_ldq;
			stq_uop_6_uses_stq <= dis_uops_0_bits_uses_stq;
			stq_uop_6_is_unique <= dis_uops_0_bits_is_unique;
			stq_uop_6_flush_on_commit <= dis_uops_0_bits_flush_on_commit;
			stq_uop_6_csr_cmd <= dis_uops_0_bits_csr_cmd;
			stq_uop_6_ldst_is_rs1 <= dis_uops_0_bits_ldst_is_rs1;
			stq_uop_6_ldst <= dis_uops_0_bits_ldst;
			stq_uop_6_lrs1 <= dis_uops_0_bits_lrs1;
			stq_uop_6_lrs2 <= dis_uops_0_bits_lrs2;
			stq_uop_6_lrs3 <= dis_uops_0_bits_lrs3;
			stq_uop_6_dst_rtype <= dis_uops_0_bits_dst_rtype;
			stq_uop_6_lrs1_rtype <= dis_uops_0_bits_lrs1_rtype;
			stq_uop_6_lrs2_rtype <= dis_uops_0_bits_lrs2_rtype;
			stq_uop_6_frs3_en <= dis_uops_0_bits_frs3_en;
			stq_uop_6_fcn_dw <= dis_uops_0_bits_fcn_dw;
			stq_uop_6_fcn_op <= dis_uops_0_bits_fcn_op;
			stq_uop_6_fp_val <= dis_uops_0_bits_fp_val;
			stq_uop_6_fp_rm <= dis_uops_0_bits_fp_rm;
			stq_uop_6_fp_typ <= dis_uops_0_bits_fp_typ;
			stq_uop_6_xcpt_pf_if <= dis_uops_0_bits_xcpt_pf_if;
			stq_uop_6_xcpt_ae_if <= dis_uops_0_bits_xcpt_ae_if;
			stq_uop_6_xcpt_ma_if <= dis_uops_0_bits_xcpt_ma_if;
			stq_uop_6_bp_debug_if <= dis_uops_0_bits_bp_debug_if;
			stq_uop_6_bp_xcpt_if <= dis_uops_0_bits_bp_xcpt_if;
			stq_uop_6_debug_fsrc <= dis_uops_0_bits_debug_fsrc;
			stq_uop_6_debug_tsrc <= dis_uops_0_bits_debug_tsrc;
		end
		if (stq_valid_6)
			stq_uop_6_br_mask <= stq_uop_6_br_mask & ~io_core_brupdate_b1_resolve_mask;
		else if (_GEN_481)
			stq_uop_6_br_mask <= stq_uop_out_br_mask;
		if (_GEN_512) begin
			if (_exe_cmd_T)
				stq_uop_6_pdst <= ldq_incoming_e_0_bits_uop_pdst;
			else if (will_fire_store_agen_0_will_fire)
				stq_uop_6_pdst <= stq_incoming_e_0_bits_uop_pdst;
			else
				stq_uop_6_pdst <= _exe_tlb_uop_T_3_pdst;
			stq_addr_6_bits <= _stq_addr_bits_T;
			stq_addr_is_virtual_6 <= exe_tlb_miss_0;
		end
		else if (_GEN_481)
			stq_uop_6_pdst <= dis_uops_0_bits_pdst;
		stq_uop_6_exception <= ((mem_xcpt_valids_0 & ~mem_xcpt_uops_0_uses_ldq) & (mem_xcpt_uops_0_stq_idx[2:0] == 3'h6)) | (_GEN_481 ? dis_uops_0_bits_exception : stq_uop_6_exception);
		if (_GEN_483) begin
			stq_uop_7_inst <= dis_uops_0_bits_inst;
			stq_uop_7_debug_inst <= dis_uops_0_bits_debug_inst;
			stq_uop_7_is_rvc <= dis_uops_0_bits_is_rvc;
			stq_uop_7_debug_pc <= dis_uops_0_bits_debug_pc;
			stq_uop_7_iq_type_0 <= dis_uops_0_bits_iq_type_0;
			stq_uop_7_iq_type_1 <= dis_uops_0_bits_iq_type_1;
			stq_uop_7_iq_type_2 <= dis_uops_0_bits_iq_type_2;
			stq_uop_7_iq_type_3 <= dis_uops_0_bits_iq_type_3;
			stq_uop_7_fu_code_0 <= dis_uops_0_bits_fu_code_0;
			stq_uop_7_fu_code_1 <= dis_uops_0_bits_fu_code_1;
			stq_uop_7_fu_code_2 <= dis_uops_0_bits_fu_code_2;
			stq_uop_7_fu_code_3 <= dis_uops_0_bits_fu_code_3;
			stq_uop_7_fu_code_4 <= dis_uops_0_bits_fu_code_4;
			stq_uop_7_fu_code_5 <= dis_uops_0_bits_fu_code_5;
			stq_uop_7_fu_code_6 <= dis_uops_0_bits_fu_code_6;
			stq_uop_7_fu_code_7 <= dis_uops_0_bits_fu_code_7;
			stq_uop_7_fu_code_8 <= dis_uops_0_bits_fu_code_8;
			stq_uop_7_fu_code_9 <= dis_uops_0_bits_fu_code_9;
			stq_uop_7_iw_issued <= dis_uops_0_bits_iw_issued;
			stq_uop_7_iw_issued_partial_agen <= dis_uops_0_bits_iw_issued_partial_agen;
			stq_uop_7_iw_issued_partial_dgen <= dis_uops_0_bits_iw_issued_partial_dgen;
			stq_uop_7_iw_p1_speculative_child <= dis_uops_0_bits_iw_p1_speculative_child;
			stq_uop_7_iw_p2_speculative_child <= dis_uops_0_bits_iw_p2_speculative_child;
			stq_uop_7_iw_p1_bypass_hint <= dis_uops_0_bits_iw_p1_bypass_hint;
			stq_uop_7_iw_p2_bypass_hint <= dis_uops_0_bits_iw_p2_bypass_hint;
			stq_uop_7_iw_p3_bypass_hint <= dis_uops_0_bits_iw_p3_bypass_hint;
			stq_uop_7_br_tag <= dis_uops_0_bits_br_tag;
			stq_uop_7_br_type <= dis_uops_0_bits_br_type;
			stq_uop_7_is_sfb <= dis_uops_0_bits_is_sfb;
			stq_uop_7_is_fence <= dis_uops_0_bits_is_fence;
			stq_uop_7_is_fencei <= dis_uops_0_bits_is_fencei;
			stq_uop_7_is_sfence <= dis_uops_0_bits_is_sfence;
			stq_uop_7_is_amo <= dis_uops_0_bits_is_amo;
			stq_uop_7_is_eret <= dis_uops_0_bits_is_eret;
			stq_uop_7_is_sys_pc2epc <= dis_uops_0_bits_is_sys_pc2epc;
			stq_uop_7_is_rocc <= dis_uops_0_bits_is_rocc;
			stq_uop_7_is_mov <= dis_uops_0_bits_is_mov;
			stq_uop_7_ftq_idx <= dis_uops_0_bits_ftq_idx;
			stq_uop_7_edge_inst <= dis_uops_0_bits_edge_inst;
			stq_uop_7_pc_lob <= dis_uops_0_bits_pc_lob;
			stq_uop_7_taken <= dis_uops_0_bits_taken;
			stq_uop_7_imm_rename <= dis_uops_0_bits_imm_rename;
			stq_uop_7_imm_sel <= dis_uops_0_bits_imm_sel;
			stq_uop_7_pimm <= dis_uops_0_bits_pimm;
			stq_uop_7_imm_packed <= dis_uops_0_bits_imm_packed;
			stq_uop_7_op1_sel <= dis_uops_0_bits_op1_sel;
			stq_uop_7_op2_sel <= dis_uops_0_bits_op2_sel;
			stq_uop_7_fp_ctrl_ldst <= dis_uops_0_bits_fp_ctrl_ldst;
			stq_uop_7_fp_ctrl_wen <= dis_uops_0_bits_fp_ctrl_wen;
			stq_uop_7_fp_ctrl_ren1 <= dis_uops_0_bits_fp_ctrl_ren1;
			stq_uop_7_fp_ctrl_ren2 <= dis_uops_0_bits_fp_ctrl_ren2;
			stq_uop_7_fp_ctrl_ren3 <= dis_uops_0_bits_fp_ctrl_ren3;
			stq_uop_7_fp_ctrl_swap12 <= dis_uops_0_bits_fp_ctrl_swap12;
			stq_uop_7_fp_ctrl_swap23 <= dis_uops_0_bits_fp_ctrl_swap23;
			stq_uop_7_fp_ctrl_typeTagIn <= dis_uops_0_bits_fp_ctrl_typeTagIn;
			stq_uop_7_fp_ctrl_typeTagOut <= dis_uops_0_bits_fp_ctrl_typeTagOut;
			stq_uop_7_fp_ctrl_fromint <= dis_uops_0_bits_fp_ctrl_fromint;
			stq_uop_7_fp_ctrl_toint <= dis_uops_0_bits_fp_ctrl_toint;
			stq_uop_7_fp_ctrl_fastpipe <= dis_uops_0_bits_fp_ctrl_fastpipe;
			stq_uop_7_fp_ctrl_fma <= dis_uops_0_bits_fp_ctrl_fma;
			stq_uop_7_fp_ctrl_div <= dis_uops_0_bits_fp_ctrl_div;
			stq_uop_7_fp_ctrl_sqrt <= dis_uops_0_bits_fp_ctrl_sqrt;
			stq_uop_7_fp_ctrl_wflags <= dis_uops_0_bits_fp_ctrl_wflags;
			stq_uop_7_fp_ctrl_vec <= dis_uops_0_bits_fp_ctrl_vec;
			stq_uop_7_rob_idx <= dis_uops_0_bits_rob_idx;
			stq_uop_7_ldq_idx <= dis_uops_0_bits_ldq_idx;
			stq_uop_7_stq_idx <= dis_uops_0_bits_stq_idx;
			stq_uop_7_rxq_idx <= dis_uops_0_bits_rxq_idx;
			stq_uop_7_prs1 <= dis_uops_0_bits_prs1;
			stq_uop_7_prs2 <= dis_uops_0_bits_prs2;
			stq_uop_7_prs3 <= dis_uops_0_bits_prs3;
			stq_uop_7_ppred <= dis_uops_0_bits_ppred;
			stq_uop_7_prs1_busy <= dis_uops_0_bits_prs1_busy;
			stq_uop_7_prs2_busy <= dis_uops_0_bits_prs2_busy;
			stq_uop_7_prs3_busy <= dis_uops_0_bits_prs3_busy;
			stq_uop_7_ppred_busy <= dis_uops_0_bits_ppred_busy;
			stq_uop_7_stale_pdst <= dis_uops_0_bits_stale_pdst;
			stq_uop_7_exc_cause <= dis_uops_0_bits_exc_cause;
			stq_uop_7_mem_cmd <= dis_uops_0_bits_mem_cmd;
			stq_uop_7_mem_size <= dis_uops_0_bits_mem_size;
			stq_uop_7_mem_signed <= dis_uops_0_bits_mem_signed;
			stq_uop_7_uses_ldq <= dis_uops_0_bits_uses_ldq;
			stq_uop_7_uses_stq <= dis_uops_0_bits_uses_stq;
			stq_uop_7_is_unique <= dis_uops_0_bits_is_unique;
			stq_uop_7_flush_on_commit <= dis_uops_0_bits_flush_on_commit;
			stq_uop_7_csr_cmd <= dis_uops_0_bits_csr_cmd;
			stq_uop_7_ldst_is_rs1 <= dis_uops_0_bits_ldst_is_rs1;
			stq_uop_7_ldst <= dis_uops_0_bits_ldst;
			stq_uop_7_lrs1 <= dis_uops_0_bits_lrs1;
			stq_uop_7_lrs2 <= dis_uops_0_bits_lrs2;
			stq_uop_7_lrs3 <= dis_uops_0_bits_lrs3;
			stq_uop_7_dst_rtype <= dis_uops_0_bits_dst_rtype;
			stq_uop_7_lrs1_rtype <= dis_uops_0_bits_lrs1_rtype;
			stq_uop_7_lrs2_rtype <= dis_uops_0_bits_lrs2_rtype;
			stq_uop_7_frs3_en <= dis_uops_0_bits_frs3_en;
			stq_uop_7_fcn_dw <= dis_uops_0_bits_fcn_dw;
			stq_uop_7_fcn_op <= dis_uops_0_bits_fcn_op;
			stq_uop_7_fp_val <= dis_uops_0_bits_fp_val;
			stq_uop_7_fp_rm <= dis_uops_0_bits_fp_rm;
			stq_uop_7_fp_typ <= dis_uops_0_bits_fp_typ;
			stq_uop_7_xcpt_pf_if <= dis_uops_0_bits_xcpt_pf_if;
			stq_uop_7_xcpt_ae_if <= dis_uops_0_bits_xcpt_ae_if;
			stq_uop_7_xcpt_ma_if <= dis_uops_0_bits_xcpt_ma_if;
			stq_uop_7_bp_debug_if <= dis_uops_0_bits_bp_debug_if;
			stq_uop_7_bp_xcpt_if <= dis_uops_0_bits_bp_xcpt_if;
			stq_uop_7_debug_fsrc <= dis_uops_0_bits_debug_fsrc;
			stq_uop_7_debug_tsrc <= dis_uops_0_bits_debug_tsrc;
		end
		if (stq_valid_7)
			stq_uop_7_br_mask <= stq_uop_7_br_mask & ~io_core_brupdate_b1_resolve_mask;
		else if (_GEN_483)
			stq_uop_7_br_mask <= stq_uop_out_br_mask;
		if (_GEN_513) begin
			if (_exe_cmd_T)
				stq_uop_7_pdst <= ldq_incoming_e_0_bits_uop_pdst;
			else if (will_fire_store_agen_0_will_fire)
				stq_uop_7_pdst <= stq_incoming_e_0_bits_uop_pdst;
			else
				stq_uop_7_pdst <= _exe_tlb_uop_T_3_pdst;
			stq_addr_7_bits <= _stq_addr_bits_T;
			stq_addr_is_virtual_7 <= exe_tlb_miss_0;
		end
		else if (_GEN_483)
			stq_uop_7_pdst <= dis_uops_0_bits_pdst;
		stq_uop_7_exception <= ((mem_xcpt_valids_0 & ~mem_xcpt_uops_0_uses_ldq) & (&mem_xcpt_uops_0_stq_idx[2:0])) | (_GEN_483 ? dis_uops_0_bits_exception : stq_uop_7_exception);
		stq_addr_0_valid <= ~_GEN_577 & (_GEN_506 ? _stq_addr_valid_T_3 : (_GEN_494 ? ~((stq_enq_retry_idx[2:0] == 3'h0) | _GEN_469) & stq_addr_0_valid : ~_GEN_469 & stq_addr_0_valid));
		stq_addr_1_valid <= ~_GEN_578 & (_GEN_507 ? _stq_addr_valid_T_3 : (_GEN_494 ? ~((stq_enq_retry_idx[2:0] == 3'h1) | _GEN_471) & stq_addr_1_valid : ~_GEN_471 & stq_addr_1_valid));
		stq_addr_2_valid <= ~_GEN_579 & (_GEN_508 ? _stq_addr_valid_T_3 : (_GEN_494 ? ~((stq_enq_retry_idx[2:0] == 3'h2) | _GEN_473) & stq_addr_2_valid : ~_GEN_473 & stq_addr_2_valid));
		stq_addr_3_valid <= ~_GEN_580 & (_GEN_509 ? _stq_addr_valid_T_3 : (_GEN_494 ? ~((stq_enq_retry_idx[2:0] == 3'h3) | _GEN_475) & stq_addr_3_valid : ~_GEN_475 & stq_addr_3_valid));
		stq_addr_4_valid <= ~_GEN_581 & (_GEN_510 ? _stq_addr_valid_T_3 : (_GEN_494 ? ~((stq_enq_retry_idx[2:0] == 3'h4) | _GEN_477) & stq_addr_4_valid : ~_GEN_477 & stq_addr_4_valid));
		stq_addr_5_valid <= ~_GEN_582 & (_GEN_511 ? _stq_addr_valid_T_3 : (_GEN_494 ? ~((stq_enq_retry_idx[2:0] == 3'h5) | _GEN_479) & stq_addr_5_valid : ~_GEN_479 & stq_addr_5_valid));
		stq_addr_6_valid <= ~_GEN_583 & (_GEN_512 ? _stq_addr_valid_T_3 : (_GEN_494 ? ~((stq_enq_retry_idx[2:0] == 3'h6) | _GEN_481) & stq_addr_6_valid : ~_GEN_481 & stq_addr_6_valid));
		stq_addr_7_valid <= ~_GEN_584 & (_GEN_513 ? _stq_addr_valid_T_3 : (_GEN_494 ? ~(&stq_enq_retry_idx[2:0] | _GEN_483) & stq_addr_7_valid : ~_GEN_483 & stq_addr_7_valid));
		stq_data_0_valid <= ~_GEN_577 & (_GEN_529 | (io_core_dgen_1_valid ? (_GEN_522 | _GEN_514) | _GEN_485 : _GEN_514 | _GEN_485));
		if (_GEN_529)
			stq_data_0_bits <= io_core_dgen_2_bits_data;
		else if (io_core_dgen_1_valid & _GEN_522)
			stq_data_0_bits <= io_core_dgen_1_bits_data;
		else if (_GEN_514)
			stq_data_0_bits <= io_core_dgen_0_bits_data;
		stq_data_1_valid <= ~_GEN_578 & (_GEN_530 | (io_core_dgen_1_valid ? (_GEN_523 | _GEN_515) | _GEN_486 : _GEN_515 | _GEN_486));
		if (_GEN_530)
			stq_data_1_bits <= io_core_dgen_2_bits_data;
		else if (io_core_dgen_1_valid & _GEN_523)
			stq_data_1_bits <= io_core_dgen_1_bits_data;
		else if (_GEN_515)
			stq_data_1_bits <= io_core_dgen_0_bits_data;
		stq_data_2_valid <= ~_GEN_579 & (_GEN_531 | (io_core_dgen_1_valid ? (_GEN_524 | _GEN_516) | _GEN_487 : _GEN_516 | _GEN_487));
		if (_GEN_531)
			stq_data_2_bits <= io_core_dgen_2_bits_data;
		else if (io_core_dgen_1_valid & _GEN_524)
			stq_data_2_bits <= io_core_dgen_1_bits_data;
		else if (_GEN_516)
			stq_data_2_bits <= io_core_dgen_0_bits_data;
		stq_data_3_valid <= ~_GEN_580 & (_GEN_532 | (io_core_dgen_1_valid ? (_GEN_525 | _GEN_517) | _GEN_488 : _GEN_517 | _GEN_488));
		if (_GEN_532)
			stq_data_3_bits <= io_core_dgen_2_bits_data;
		else if (io_core_dgen_1_valid & _GEN_525)
			stq_data_3_bits <= io_core_dgen_1_bits_data;
		else if (_GEN_517)
			stq_data_3_bits <= io_core_dgen_0_bits_data;
		stq_data_4_valid <= ~_GEN_581 & (_GEN_533 | (io_core_dgen_1_valid ? (_GEN_526 | _GEN_518) | _GEN_489 : _GEN_518 | _GEN_489));
		if (_GEN_533)
			stq_data_4_bits <= io_core_dgen_2_bits_data;
		else if (io_core_dgen_1_valid & _GEN_526)
			stq_data_4_bits <= io_core_dgen_1_bits_data;
		else if (_GEN_518)
			stq_data_4_bits <= io_core_dgen_0_bits_data;
		stq_data_5_valid <= ~_GEN_582 & (_GEN_534 | (io_core_dgen_1_valid ? (_GEN_527 | _GEN_519) | _GEN_490 : _GEN_519 | _GEN_490));
		if (_GEN_534)
			stq_data_5_bits <= io_core_dgen_2_bits_data;
		else if (io_core_dgen_1_valid & _GEN_527)
			stq_data_5_bits <= io_core_dgen_1_bits_data;
		else if (_GEN_519)
			stq_data_5_bits <= io_core_dgen_0_bits_data;
		stq_data_6_valid <= ~_GEN_583 & (_GEN_535 | (io_core_dgen_1_valid ? (_GEN_528 | _GEN_520) | _GEN_491 : _GEN_520 | _GEN_491));
		if (_GEN_535)
			stq_data_6_bits <= io_core_dgen_2_bits_data;
		else if (io_core_dgen_1_valid & _GEN_528)
			stq_data_6_bits <= io_core_dgen_1_bits_data;
		else if (_GEN_520)
			stq_data_6_bits <= io_core_dgen_0_bits_data;
		stq_data_7_valid <= ~_GEN_584 & (_GEN_536 | (io_core_dgen_1_valid ? (&io_core_dgen_1_bits_uop_stq_idx[2:0] | _GEN_521) | _GEN_492 : _GEN_521 | _GEN_492));
		if (_GEN_536)
			stq_data_7_bits <= io_core_dgen_2_bits_data;
		else if (io_core_dgen_1_valid & (&io_core_dgen_1_bits_uop_stq_idx[2:0]))
			stq_data_7_bits <= io_core_dgen_1_bits_data;
		else if (_GEN_521)
			stq_data_7_bits <= io_core_dgen_0_bits_data;
		stq_committed_0 <= _GEN_593 | (~_GEN_469 & stq_committed_0);
		stq_committed_1 <= _GEN_594 | (~_GEN_471 & stq_committed_1);
		stq_committed_2 <= _GEN_595 | (~_GEN_473 & stq_committed_2);
		stq_committed_3 <= _GEN_596 | (~_GEN_475 & stq_committed_3);
		stq_committed_4 <= _GEN_597 | (~_GEN_477 & stq_committed_4);
		stq_committed_5 <= _GEN_598 | (~_GEN_479 & stq_committed_5);
		stq_committed_6 <= _GEN_599 | (~_GEN_481 & stq_committed_6);
		stq_committed_7 <= _GEN_600 | (~_GEN_483 & stq_committed_7);
		stq_succeeded_0 <= (io_dmem_store_ack_0_valid & (io_dmem_store_ack_0_bits_uop_stq_idx[2:0] == 3'h0)) | (_GEN_496 ? ~_GEN_469 & stq_succeeded_0 : ~((_stq_execute_queue_io_deq_bits_uop_stq_idx[2:0] == 3'h0) | _GEN_469) & stq_succeeded_0);
		stq_succeeded_1 <= (io_dmem_store_ack_0_valid & (io_dmem_store_ack_0_bits_uop_stq_idx[2:0] == 3'h1)) | (_GEN_496 ? ~_GEN_471 & stq_succeeded_1 : ~((_stq_execute_queue_io_deq_bits_uop_stq_idx[2:0] == 3'h1) | _GEN_471) & stq_succeeded_1);
		stq_succeeded_2 <= (io_dmem_store_ack_0_valid & (io_dmem_store_ack_0_bits_uop_stq_idx[2:0] == 3'h2)) | (_GEN_496 ? ~_GEN_473 & stq_succeeded_2 : ~((_stq_execute_queue_io_deq_bits_uop_stq_idx[2:0] == 3'h2) | _GEN_473) & stq_succeeded_2);
		stq_succeeded_3 <= (io_dmem_store_ack_0_valid & (io_dmem_store_ack_0_bits_uop_stq_idx[2:0] == 3'h3)) | (_GEN_496 ? ~_GEN_475 & stq_succeeded_3 : ~((_stq_execute_queue_io_deq_bits_uop_stq_idx[2:0] == 3'h3) | _GEN_475) & stq_succeeded_3);
		stq_succeeded_4 <= (io_dmem_store_ack_0_valid & (io_dmem_store_ack_0_bits_uop_stq_idx[2:0] == 3'h4)) | (_GEN_496 ? ~_GEN_477 & stq_succeeded_4 : ~((_stq_execute_queue_io_deq_bits_uop_stq_idx[2:0] == 3'h4) | _GEN_477) & stq_succeeded_4);
		stq_succeeded_5 <= (io_dmem_store_ack_0_valid & (io_dmem_store_ack_0_bits_uop_stq_idx[2:0] == 3'h5)) | (_GEN_496 ? ~_GEN_479 & stq_succeeded_5 : ~((_stq_execute_queue_io_deq_bits_uop_stq_idx[2:0] == 3'h5) | _GEN_479) & stq_succeeded_5);
		stq_succeeded_6 <= (io_dmem_store_ack_0_valid & (io_dmem_store_ack_0_bits_uop_stq_idx[2:0] == 3'h6)) | (_GEN_496 ? ~_GEN_481 & stq_succeeded_6 : ~((_stq_execute_queue_io_deq_bits_uop_stq_idx[2:0] == 3'h6) | _GEN_481) & stq_succeeded_6);
		stq_succeeded_7 <= (io_dmem_store_ack_0_valid & (&io_dmem_store_ack_0_bits_uop_stq_idx[2:0])) | (_GEN_496 ? ~_GEN_483 & stq_succeeded_7 : ~(&_stq_execute_queue_io_deq_bits_uop_stq_idx[2:0] | _GEN_483) & stq_succeeded_7);
		stq_can_execute_0 <= _GEN_593 | (~_GEN_469 & stq_can_execute_0);
		stq_can_execute_1 <= _GEN_594 | (~_GEN_471 & stq_can_execute_1);
		stq_can_execute_2 <= _GEN_595 | (~_GEN_473 & stq_can_execute_2);
		stq_can_execute_3 <= _GEN_596 | (~_GEN_475 & stq_can_execute_3);
		stq_can_execute_4 <= _GEN_597 | (~_GEN_477 & stq_can_execute_4);
		stq_can_execute_5 <= _GEN_598 | (~_GEN_479 & stq_can_execute_5);
		stq_can_execute_6 <= _GEN_599 | (~_GEN_481 & stq_can_execute_6);
		stq_can_execute_7 <= _GEN_600 | (~_GEN_483 & stq_can_execute_7);
		stq_cleared_0 <= (_GEN_537 & (stq_clr_head_idx[2:0] == 3'h0)) | (~_GEN_469 & stq_cleared_0);
		stq_cleared_1 <= (_GEN_537 & (stq_clr_head_idx[2:0] == 3'h1)) | (~_GEN_471 & stq_cleared_1);
		stq_cleared_2 <= (_GEN_537 & (stq_clr_head_idx[2:0] == 3'h2)) | (~_GEN_473 & stq_cleared_2);
		stq_cleared_3 <= (_GEN_537 & (stq_clr_head_idx[2:0] == 3'h3)) | (~_GEN_475 & stq_cleared_3);
		stq_cleared_4 <= (_GEN_537 & (stq_clr_head_idx[2:0] == 3'h4)) | (~_GEN_477 & stq_cleared_4);
		stq_cleared_5 <= (_GEN_537 & (stq_clr_head_idx[2:0] == 3'h5)) | (~_GEN_479 & stq_cleared_5);
		stq_cleared_6 <= (_GEN_537 & (stq_clr_head_idx[2:0] == 3'h6)) | (~_GEN_481 & stq_cleared_6);
		stq_cleared_7 <= (_GEN_537 & (&stq_clr_head_idx[2:0])) | (~_GEN_483 & stq_cleared_7);
		if ((_GEN_378 & resp_uop_uses_stq) & (resp_uop_stq_idx == 3'h0))
			stq_debug_wb_data_0 <= resp_data;
		if ((_GEN_378 & resp_uop_uses_stq) & (resp_uop_stq_idx == 3'h1))
			stq_debug_wb_data_1 <= resp_data;
		if ((_GEN_378 & resp_uop_uses_stq) & (resp_uop_stq_idx == 3'h2))
			stq_debug_wb_data_2 <= resp_data;
		if ((_GEN_378 & resp_uop_uses_stq) & (resp_uop_stq_idx == 3'h3))
			stq_debug_wb_data_3 <= resp_data;
		if ((_GEN_378 & resp_uop_uses_stq) & (resp_uop_stq_idx == 3'h4))
			stq_debug_wb_data_4 <= resp_data;
		if ((_GEN_378 & resp_uop_uses_stq) & (resp_uop_stq_idx == 3'h5))
			stq_debug_wb_data_5 <= resp_data;
		if ((_GEN_378 & resp_uop_uses_stq) & (resp_uop_stq_idx == 3'h6))
			stq_debug_wb_data_6 <= resp_data;
		if ((_GEN_378 & resp_uop_uses_stq) & (&resp_uop_stq_idx))
			stq_debug_wb_data_7 <= resp_data;
		if (dis_st_val & _GEN_445)
			stq_next_ldq_idx_0 <= ldq_tail;
		if (dis_st_val & _GEN_446)
			stq_next_ldq_idx_1 <= ldq_tail;
		if (dis_st_val & _GEN_447)
			stq_next_ldq_idx_2 <= ldq_tail;
		if (dis_st_val & _GEN_448)
			stq_next_ldq_idx_3 <= ldq_tail;
		if (dis_st_val & _GEN_449)
			stq_next_ldq_idx_4 <= ldq_tail;
		if (dis_st_val & _GEN_450)
			stq_next_ldq_idx_5 <= ldq_tail;
		if (dis_st_val & _GEN_451)
			stq_next_ldq_idx_6 <= ldq_tail;
		if (dis_st_val & (&stq_tail[2:0]))
			stq_next_ldq_idx_7 <= ldq_tail;
		if (_GEN_604) begin
			ldq_head <= 4'h0;
			ldq_tail <= 4'h0;
			stq_tail <= (reset ? 4'h0 : stq_commit_head);
		end
		else begin
			if (commit_load)
				ldq_head <= ldq_head + 4'h1;
			if (io_core_brupdate_b2_mispredict & ~io_core_exception) begin
				ldq_tail <= io_core_brupdate_b2_uop_ldq_idx;
				stq_tail <= io_core_brupdate_b2_uop_stq_idx;
			end
			else begin
				if (dis_ld_val)
					ldq_tail <= ldq_tail + 4'h1;
				if (dis_st_val)
					stq_tail <= stq_tail + 4'h1;
			end
		end
		if (_GEN_604 & reset) begin
			stq_head <= 4'h0;
			stq_commit_head <= 4'h0;
			stq_execute_head <= 4'h0;
		end
		else begin
			if (clear_store)
				stq_head <= stq_head + 4'h1;
			if (commit_store)
				stq_commit_head <= stq_commit_head + 4'h1;
			if (clear_store & _GEN_430)
				stq_execute_head <= stq_execute_head + 4'h1;
			else if ((~io_dmem_nack_0_valid | _GEN_376) | ~_GEN_375) begin
				if (_GEN_284 | ~(_GEN_282 & ~dmem_req_fire_0)) begin
					if (can_enq_store_execute & _stq_execute_queue_io_enq_ready)
						stq_execute_head <= stq_execute_head + 4'h1;
				end
				else
					stq_execute_head <= _stq_execute_queue_io_deq_bits_uop_stq_idx;
			end
			else
				stq_execute_head <= io_dmem_nack_0_bits_uop_stq_idx;
		end
		if (io_hellacache_req_ready_0 & _GEN_602)
			hella_req_addr <= io_hellacache_req_bits_addr;
		if (_GEN_603)
			;
		else
			hella_data_data <= 64'h0000000000000000;
		if (_GEN_285 | ~will_fire_hella_incoming_0_will_fire)
			;
		else
			hella_paddr <= exe_tlb_paddr_0;
		if (_GEN_603)
			;
		else begin
			hella_xcpt_ma_ld <= _dtlb_io_resp_0_ma_ld;
			hella_xcpt_ma_st <= _dtlb_io_resp_0_ma_st;
			hella_xcpt_pf_ld <= _dtlb_io_resp_0_pf_ld;
			hella_xcpt_pf_st <= _dtlb_io_resp_0_pf_st;
		end
		hella_xcpt_gf_ld <= _GEN_603 & hella_xcpt_gf_ld;
		hella_xcpt_gf_st <= _GEN_603 & hella_xcpt_gf_st;
		if (_GEN_603)
			;
		else begin
			hella_xcpt_ae_ld <= _dtlb_io_resp_0_ae_ld;
			hella_xcpt_ae_st <= _dtlb_io_resp_0_ae_st;
		end
		dis_ldq_oh_0 <= dis_ld_val & _GEN_438;
		dis_ldq_oh_1 <= dis_ld_val & _GEN_439;
		dis_ldq_oh_2 <= dis_ld_val & _GEN_440;
		dis_ldq_oh_3 <= dis_ld_val & _GEN_441;
		dis_ldq_oh_4 <= dis_ld_val & _GEN_442;
		dis_ldq_oh_5 <= dis_ld_val & _GEN_443;
		dis_ldq_oh_6 <= dis_ld_val & _GEN_444;
		dis_ldq_oh_7 <= dis_ld_val & (&ldq_tail[2:0]);
		dis_stq_oh_0 <= dis_st_val & _GEN_445;
		dis_stq_oh_1 <= dis_st_val & _GEN_446;
		dis_stq_oh_2 <= dis_st_val & _GEN_447;
		dis_stq_oh_3 <= dis_st_val & _GEN_448;
		dis_stq_oh_4 <= dis_st_val & _GEN_449;
		dis_stq_oh_5 <= dis_st_val & _GEN_450;
		dis_stq_oh_6 <= dis_st_val & _GEN_451;
		dis_stq_oh_7 <= dis_st_val & (&stq_tail[2:0]);
		dis_uops_0_valid <= dis_ld_val | dis_st_val;
		dis_uops_0_bits_inst <= io_core_dis_uops_0_bits_inst;
		dis_uops_0_bits_debug_inst <= io_core_dis_uops_0_bits_debug_inst;
		dis_uops_0_bits_is_rvc <= io_core_dis_uops_0_bits_is_rvc;
		dis_uops_0_bits_debug_pc <= io_core_dis_uops_0_bits_debug_pc;
		dis_uops_0_bits_iq_type_0 <= io_core_dis_uops_0_bits_iq_type_0;
		dis_uops_0_bits_iq_type_1 <= io_core_dis_uops_0_bits_iq_type_1;
		dis_uops_0_bits_iq_type_2 <= io_core_dis_uops_0_bits_iq_type_2;
		dis_uops_0_bits_iq_type_3 <= io_core_dis_uops_0_bits_iq_type_3;
		dis_uops_0_bits_fu_code_0 <= io_core_dis_uops_0_bits_fu_code_0;
		dis_uops_0_bits_fu_code_1 <= io_core_dis_uops_0_bits_fu_code_1;
		dis_uops_0_bits_fu_code_2 <= io_core_dis_uops_0_bits_fu_code_2;
		dis_uops_0_bits_fu_code_3 <= io_core_dis_uops_0_bits_fu_code_3;
		dis_uops_0_bits_fu_code_4 <= io_core_dis_uops_0_bits_fu_code_4;
		dis_uops_0_bits_fu_code_5 <= io_core_dis_uops_0_bits_fu_code_5;
		dis_uops_0_bits_fu_code_6 <= io_core_dis_uops_0_bits_fu_code_6;
		dis_uops_0_bits_fu_code_7 <= io_core_dis_uops_0_bits_fu_code_7;
		dis_uops_0_bits_fu_code_8 <= io_core_dis_uops_0_bits_fu_code_8;
		dis_uops_0_bits_fu_code_9 <= io_core_dis_uops_0_bits_fu_code_9;
		dis_uops_0_bits_iw_issued <= io_core_dis_uops_0_bits_iw_issued;
		dis_uops_0_bits_iw_issued_partial_agen <= io_core_dis_uops_0_bits_iw_issued_partial_agen;
		dis_uops_0_bits_iw_issued_partial_dgen <= io_core_dis_uops_0_bits_iw_issued_partial_dgen;
		dis_uops_0_bits_iw_p1_speculative_child <= io_core_dis_uops_0_bits_iw_p1_speculative_child;
		dis_uops_0_bits_iw_p2_speculative_child <= io_core_dis_uops_0_bits_iw_p2_speculative_child;
		dis_uops_0_bits_iw_p1_bypass_hint <= io_core_dis_uops_0_bits_iw_p1_bypass_hint;
		dis_uops_0_bits_iw_p2_bypass_hint <= io_core_dis_uops_0_bits_iw_p2_bypass_hint;
		dis_uops_0_bits_iw_p3_bypass_hint <= io_core_dis_uops_0_bits_iw_p3_bypass_hint;
		dis_uops_0_bits_br_mask <= io_core_dis_uops_0_bits_br_mask;
		dis_uops_0_bits_br_tag <= io_core_dis_uops_0_bits_br_tag;
		dis_uops_0_bits_br_type <= io_core_dis_uops_0_bits_br_type;
		dis_uops_0_bits_is_sfb <= io_core_dis_uops_0_bits_is_sfb;
		dis_uops_0_bits_is_fence <= io_core_dis_uops_0_bits_is_fence;
		dis_uops_0_bits_is_fencei <= io_core_dis_uops_0_bits_is_fencei;
		dis_uops_0_bits_is_sfence <= io_core_dis_uops_0_bits_is_sfence;
		dis_uops_0_bits_is_amo <= io_core_dis_uops_0_bits_is_amo;
		dis_uops_0_bits_is_eret <= io_core_dis_uops_0_bits_is_eret;
		dis_uops_0_bits_is_sys_pc2epc <= io_core_dis_uops_0_bits_is_sys_pc2epc;
		dis_uops_0_bits_is_rocc <= io_core_dis_uops_0_bits_is_rocc;
		dis_uops_0_bits_is_mov <= io_core_dis_uops_0_bits_is_mov;
		dis_uops_0_bits_ftq_idx <= io_core_dis_uops_0_bits_ftq_idx;
		dis_uops_0_bits_edge_inst <= io_core_dis_uops_0_bits_edge_inst;
		dis_uops_0_bits_pc_lob <= io_core_dis_uops_0_bits_pc_lob;
		dis_uops_0_bits_taken <= io_core_dis_uops_0_bits_taken;
		dis_uops_0_bits_imm_rename <= io_core_dis_uops_0_bits_imm_rename;
		dis_uops_0_bits_imm_sel <= io_core_dis_uops_0_bits_imm_sel;
		dis_uops_0_bits_pimm <= io_core_dis_uops_0_bits_pimm;
		dis_uops_0_bits_imm_packed <= io_core_dis_uops_0_bits_imm_packed;
		dis_uops_0_bits_op1_sel <= io_core_dis_uops_0_bits_op1_sel;
		dis_uops_0_bits_op2_sel <= io_core_dis_uops_0_bits_op2_sel;
		dis_uops_0_bits_fp_ctrl_ldst <= io_core_dis_uops_0_bits_fp_ctrl_ldst;
		dis_uops_0_bits_fp_ctrl_wen <= io_core_dis_uops_0_bits_fp_ctrl_wen;
		dis_uops_0_bits_fp_ctrl_ren1 <= io_core_dis_uops_0_bits_fp_ctrl_ren1;
		dis_uops_0_bits_fp_ctrl_ren2 <= io_core_dis_uops_0_bits_fp_ctrl_ren2;
		dis_uops_0_bits_fp_ctrl_ren3 <= io_core_dis_uops_0_bits_fp_ctrl_ren3;
		dis_uops_0_bits_fp_ctrl_swap12 <= io_core_dis_uops_0_bits_fp_ctrl_swap12;
		dis_uops_0_bits_fp_ctrl_swap23 <= io_core_dis_uops_0_bits_fp_ctrl_swap23;
		dis_uops_0_bits_fp_ctrl_typeTagIn <= io_core_dis_uops_0_bits_fp_ctrl_typeTagIn;
		dis_uops_0_bits_fp_ctrl_typeTagOut <= io_core_dis_uops_0_bits_fp_ctrl_typeTagOut;
		dis_uops_0_bits_fp_ctrl_fromint <= io_core_dis_uops_0_bits_fp_ctrl_fromint;
		dis_uops_0_bits_fp_ctrl_toint <= io_core_dis_uops_0_bits_fp_ctrl_toint;
		dis_uops_0_bits_fp_ctrl_fastpipe <= io_core_dis_uops_0_bits_fp_ctrl_fastpipe;
		dis_uops_0_bits_fp_ctrl_fma <= io_core_dis_uops_0_bits_fp_ctrl_fma;
		dis_uops_0_bits_fp_ctrl_div <= io_core_dis_uops_0_bits_fp_ctrl_div;
		dis_uops_0_bits_fp_ctrl_sqrt <= io_core_dis_uops_0_bits_fp_ctrl_sqrt;
		dis_uops_0_bits_fp_ctrl_wflags <= io_core_dis_uops_0_bits_fp_ctrl_wflags;
		dis_uops_0_bits_fp_ctrl_vec <= io_core_dis_uops_0_bits_fp_ctrl_vec;
		dis_uops_0_bits_rob_idx <= io_core_dis_uops_0_bits_rob_idx;
		dis_uops_0_bits_ldq_idx <= io_core_dis_uops_0_bits_ldq_idx;
		dis_uops_0_bits_stq_idx <= io_core_dis_uops_0_bits_stq_idx;
		dis_uops_0_bits_rxq_idx <= io_core_dis_uops_0_bits_rxq_idx;
		dis_uops_0_bits_pdst <= io_core_dis_uops_0_bits_pdst;
		dis_uops_0_bits_prs1 <= io_core_dis_uops_0_bits_prs1;
		dis_uops_0_bits_prs2 <= io_core_dis_uops_0_bits_prs2;
		dis_uops_0_bits_prs3 <= io_core_dis_uops_0_bits_prs3;
		dis_uops_0_bits_ppred <= io_core_dis_uops_0_bits_ppred;
		dis_uops_0_bits_prs1_busy <= io_core_dis_uops_0_bits_prs1_busy;
		dis_uops_0_bits_prs2_busy <= io_core_dis_uops_0_bits_prs2_busy;
		dis_uops_0_bits_prs3_busy <= io_core_dis_uops_0_bits_prs3_busy;
		dis_uops_0_bits_ppred_busy <= io_core_dis_uops_0_bits_ppred_busy;
		dis_uops_0_bits_stale_pdst <= io_core_dis_uops_0_bits_stale_pdst;
		dis_uops_0_bits_exception <= io_core_dis_uops_0_bits_exception;
		dis_uops_0_bits_exc_cause <= io_core_dis_uops_0_bits_exc_cause;
		dis_uops_0_bits_mem_cmd <= io_core_dis_uops_0_bits_mem_cmd;
		dis_uops_0_bits_mem_size <= io_core_dis_uops_0_bits_mem_size;
		dis_uops_0_bits_mem_signed <= io_core_dis_uops_0_bits_mem_signed;
		dis_uops_0_bits_uses_ldq <= io_core_dis_uops_0_bits_uses_ldq;
		dis_uops_0_bits_uses_stq <= io_core_dis_uops_0_bits_uses_stq;
		dis_uops_0_bits_is_unique <= io_core_dis_uops_0_bits_is_unique;
		dis_uops_0_bits_flush_on_commit <= io_core_dis_uops_0_bits_flush_on_commit;
		dis_uops_0_bits_csr_cmd <= io_core_dis_uops_0_bits_csr_cmd;
		dis_uops_0_bits_ldst_is_rs1 <= io_core_dis_uops_0_bits_ldst_is_rs1;
		dis_uops_0_bits_ldst <= io_core_dis_uops_0_bits_ldst;
		dis_uops_0_bits_lrs1 <= io_core_dis_uops_0_bits_lrs1;
		dis_uops_0_bits_lrs2 <= io_core_dis_uops_0_bits_lrs2;
		dis_uops_0_bits_lrs3 <= io_core_dis_uops_0_bits_lrs3;
		dis_uops_0_bits_dst_rtype <= io_core_dis_uops_0_bits_dst_rtype;
		dis_uops_0_bits_lrs1_rtype <= io_core_dis_uops_0_bits_lrs1_rtype;
		dis_uops_0_bits_lrs2_rtype <= io_core_dis_uops_0_bits_lrs2_rtype;
		dis_uops_0_bits_frs3_en <= io_core_dis_uops_0_bits_frs3_en;
		dis_uops_0_bits_fcn_dw <= io_core_dis_uops_0_bits_fcn_dw;
		dis_uops_0_bits_fcn_op <= io_core_dis_uops_0_bits_fcn_op;
		dis_uops_0_bits_fp_val <= io_core_dis_uops_0_bits_fp_val;
		dis_uops_0_bits_fp_rm <= io_core_dis_uops_0_bits_fp_rm;
		dis_uops_0_bits_fp_typ <= io_core_dis_uops_0_bits_fp_typ;
		dis_uops_0_bits_xcpt_pf_if <= io_core_dis_uops_0_bits_xcpt_pf_if;
		dis_uops_0_bits_xcpt_ae_if <= io_core_dis_uops_0_bits_xcpt_ae_if;
		dis_uops_0_bits_xcpt_ma_if <= io_core_dis_uops_0_bits_xcpt_ma_if;
		dis_uops_0_bits_bp_debug_if <= io_core_dis_uops_0_bits_bp_debug_if;
		dis_uops_0_bits_bp_xcpt_if <= io_core_dis_uops_0_bits_bp_xcpt_if;
		dis_uops_0_bits_debug_fsrc <= io_core_dis_uops_0_bits_debug_fsrc;
		dis_uops_0_bits_debug_tsrc <= io_core_dis_uops_0_bits_debug_tsrc;
		if (will_fire_load_wakeup_0_will_fire) begin
			p1_block_load_mask_0 <= _GEN_258;
			p1_block_load_mask_1 <= _GEN_259;
			p1_block_load_mask_2 <= _GEN_260;
			p1_block_load_mask_3 <= _GEN_261;
			p1_block_load_mask_4 <= _GEN_262;
			p1_block_load_mask_5 <= _GEN_263;
			p1_block_load_mask_6 <= _GEN_264;
			p1_block_load_mask_7 <= &ldq_wakeup_idx[2:0];
		end
		else begin
			p1_block_load_mask_0 <= _GEN_267;
			p1_block_load_mask_1 <= _GEN_269;
			p1_block_load_mask_2 <= _GEN_271;
			p1_block_load_mask_3 <= _GEN_273;
			p1_block_load_mask_4 <= _GEN_275;
			p1_block_load_mask_5 <= _GEN_277;
			p1_block_load_mask_6 <= _GEN_279;
			p1_block_load_mask_7 <= _GEN_280;
		end
		p2_block_load_mask_0 <= p1_block_load_mask_0;
		p2_block_load_mask_1 <= p1_block_load_mask_1;
		p2_block_load_mask_2 <= p1_block_load_mask_2;
		p2_block_load_mask_3 <= p1_block_load_mask_3;
		p2_block_load_mask_4 <= p1_block_load_mask_4;
		p2_block_load_mask_5 <= p1_block_load_mask_5;
		p2_block_load_mask_6 <= p1_block_load_mask_6;
		p2_block_load_mask_7 <= p1_block_load_mask_7;
		stq_almost_full <= ((((_stq_tail_plus_T[3] == stq_head[3]) & (_stq_tail_plus_T[2:0] > stq_head[2:0])) | ((_stq_tail_plus_T[3] != stq_head[3]) & (_stq_tail_plus_T[2:0] < stq_head[2:0]))) ^ (((stq_tail[3] == stq_head[3]) & (stq_tail[2:0] > stq_head[2:0])) | ((stq_tail[3] != stq_head[3]) & (stq_tail[2:0] < stq_head[2:0])))) ^ (((stq_tail[3] == _stq_tail_plus_T[3]) & (stq_tail[2:0] > _stq_tail_plus_T[2:0])) | ((stq_tail[3] != _stq_tail_plus_T[3]) & (stq_tail[2:0] < _stq_tail_plus_T[2:0])));
		ldq_wakeup_idx <= {ldq_head[3] ^ (ldq_wakeup_idx_base_idx < ldq_head[2:0]), ldq_wakeup_idx_base_idx};
		ldq_enq_retry_idx <= {ldq_head[3] ^ (ldq_enq_retry_idx_base_idx < ldq_head[2:0]), ldq_enq_retry_idx_base_idx};
		stq_enq_retry_idx <= {stq_commit_head[3] ^ (stq_enq_retry_idx_base_idx < stq_commit_head[2:0]), stq_enq_retry_idx_base_idx};
		can_fire_load_retry_REG <= store_needs_order;
		can_fire_load_wakeup_REG <= store_needs_order;
		mem_xcpt_valids_0 <= (~_will_fire_store_commit_slow_0_T_2 & (((((pf_ld_0 | pf_st_0) | ae_ld_0) | ae_st_0) | ma_ld_0) | ma_st_0)) & ~(|(io_core_brupdate_b1_mispredict_mask & exe_tlb_uop_0_br_mask) | io_core_exception);
		mem_xcpt_uops_0_br_mask <= exe_tlb_uop_0_br_mask & ~io_core_brupdate_b1_resolve_mask;
		mem_xcpt_uops_0_rob_idx <= exe_tlb_uop_0_rob_idx;
		mem_xcpt_uops_0_ldq_idx <= exe_tlb_uop_0_ldq_idx;
		mem_xcpt_uops_0_stq_idx <= exe_tlb_uop_0_stq_idx;
		mem_xcpt_uops_0_uses_ldq <= exe_tlb_uop_0_uses_ldq;
		mem_xcpt_uops_0_uses_stq <= exe_tlb_uop_0_uses_stq;
		mem_xcpt_causes_0 <= (ma_st_0 ? 4'h6 : (ma_ld_0 ? 4'h4 : (pf_st_0 ? 4'hf : (pf_ld_0 ? 4'hd : {1'h0, (ae_st_0 ? 3'h7 : (ae_ld_0 ? 3'h5 : 3'h0))}))));
		mem_xcpt_vaddrs_0 <= exe_tlb_vaddr_0;
		REG <= (_GEN_257 | will_fire_load_retry_0_will_fire) | will_fire_store_retry_0_will_fire;
		io_dmem_s1_kill_0_REG <= s0_kills_0 & dmem_req_fire_0;
		fired_load_agen_exec_REG <= will_fire_load_agen_exec_0_will_fire & ~exe_agen_killed_0;
		fired_load_agen_REG <= will_fire_load_agen_0_will_fire & ~exe_agen_killed_0;
		fired_store_agen_REG <= will_fire_store_agen_0_will_fire & ~exe_agen_killed_0;
		fired_release_0 <= will_fire_release_0_will_fire;
		fired_load_retry_REG <= will_fire_load_retry_0_will_fire & ~(|_fired_store_retry_T | io_core_exception);
		fired_store_retry_REG <= will_fire_store_retry_0_will_fire & ~(|_fired_store_retry_T | io_core_exception);
		fired_load_wakeup_REG <= will_fire_load_wakeup_0_will_fire & ~(|(io_core_brupdate_b1_mispredict_mask & ldq_wakeup_e_bits_uop_br_mask) | io_core_exception);
		mem_incoming_uop_0_br_mask <= io_core_agen_0_bits_uop_br_mask & ~io_core_brupdate_b1_resolve_mask;
		mem_incoming_uop_0_ldq_idx <= io_core_agen_0_bits_uop_ldq_idx;
		mem_incoming_uop_0_stq_idx <= io_core_agen_0_bits_uop_stq_idx;
		mem_incoming_uop_0_pdst <= io_core_agen_0_bits_uop_pdst;
		mem_incoming_uop_0_dst_rtype <= io_core_agen_0_bits_uop_dst_rtype;
		mem_incoming_uop_0_fp_val <= io_core_agen_0_bits_uop_fp_val;
		mem_ldq_incoming_e_0_bits_uop_br_mask <= ldq_incoming_e_0_bits_uop_br_mask & ~io_core_brupdate_b1_resolve_mask;
		mem_ldq_incoming_e_0_bits_uop_rob_idx <= ldq_incoming_e_0_bits_uop_rob_idx;
		mem_ldq_incoming_e_0_bits_uop_stq_idx <= ldq_incoming_e_0_bits_uop_stq_idx;
		mem_ldq_incoming_e_0_bits_uop_mem_size <= ldq_incoming_e_0_bits_uop_mem_size;
		mem_ldq_incoming_e_0_bits_next_stq_idx <= _GEN_127[io_core_agen_0_bits_uop_ldq_idx[2:0] * 4+:4];
		mem_stq_incoming_e_0_bits_uop_br_mask <= stq_incoming_e_0_bits_uop_br_mask & ~io_core_brupdate_b1_resolve_mask;
		mem_stq_incoming_e_0_bits_uop_rob_idx <= stq_incoming_e_0_bits_uop_rob_idx;
		mem_stq_incoming_e_0_bits_uop_stq_idx <= stq_incoming_e_0_bits_uop_stq_idx;
		mem_stq_incoming_e_0_bits_uop_mem_size <= stq_incoming_e_0_bits_uop_mem_size;
		mem_ldq_wakeup_e_bits_uop_br_mask <= ldq_wakeup_e_bits_uop_br_mask & ~io_core_brupdate_b1_resolve_mask;
		mem_ldq_wakeup_e_bits_uop_rob_idx <= ldq_wakeup_e_bits_uop_rob_idx;
		mem_ldq_wakeup_e_bits_uop_stq_idx <= ldq_wakeup_e_bits_uop_stq_idx;
		mem_ldq_wakeup_e_bits_uop_mem_size <= ldq_wakeup_e_bits_uop_mem_size;
		mem_ldq_wakeup_e_bits_addr_is_uncacheable <= ldq_wakeup_e_bits_addr_is_uncacheable;
		mem_ldq_wakeup_e_bits_next_stq_idx <= ldq_wakeup_e_bits_next_stq_idx;
		mem_ldq_retry_e_bits_uop_br_mask <= _GEN_42[_retry_queue_io_deq_bits_uop_ldq_idx[2:0] * 8+:8] & ~io_core_brupdate_b1_resolve_mask;
		mem_ldq_retry_e_bits_uop_rob_idx <= _GEN_81[_retry_queue_io_deq_bits_uop_ldq_idx[2:0] * 5+:5];
		mem_ldq_retry_e_bits_uop_stq_idx <= _GEN_83[_retry_queue_io_deq_bits_uop_ldq_idx[2:0] * 4+:4];
		mem_ldq_retry_e_bits_uop_mem_size <= _GEN_98[_retry_queue_io_deq_bits_uop_ldq_idx[2:0] * 2+:2];
		mem_ldq_retry_e_bits_next_stq_idx <= _GEN_127[_retry_queue_io_deq_bits_uop_ldq_idx[2:0] * 4+:4];
		mem_stq_retry_e_bits_uop_br_mask <= _GEN_154[_retry_queue_io_deq_bits_uop_stq_idx[2:0] * 8+:8] & ~io_core_brupdate_b1_resolve_mask;
		mem_stq_retry_e_bits_uop_rob_idx <= _GEN_193[_retry_queue_io_deq_bits_uop_stq_idx[2:0] * 5+:5];
		mem_stq_retry_e_bits_uop_stq_idx <= _GEN_195[_retry_queue_io_deq_bits_uop_stq_idx[2:0] * 4+:4];
		mem_stq_retry_e_bits_uop_mem_size <= _GEN_210[_retry_queue_io_deq_bits_uop_stq_idx[2:0] * 2+:2];
		mem_tlb_miss_0 <= exe_tlb_miss_0;
		mem_tlb_uncacheable_0 <= ~_dtlb_io_resp_0_cacheable;
		mem_paddr_0 <= dmem_req_0_bits_addr;
		stq_clr_head_idx <= {stq_commit_head[3] ^ (stq_clr_head_idx_base_idx < stq_commit_head[2:0]), stq_clr_head_idx_base_idx};
		clr_valid <= _GEN_537;
		if (_GEN_537) begin
			clr_uop_br_mask <= s_uop_br_mask & ~io_core_brupdate_b1_resolve_mask;
			clr_uop_rob_idx <= _GEN_193[stq_clr_head_idx[2:0] * 5+:5];
		end
		clr_valid_1 <= clr_valid & ~(|(io_core_brupdate_b1_mispredict_mask & clr_uop_br_mask) | io_core_exception);
		clr_uop_1_br_mask <= clr_uop_br_mask & ~io_core_brupdate_b1_resolve_mask;
		clr_uop_1_rob_idx <= clr_uop_rob_idx;
		lcam_addr_REG <= exe_tlb_paddr_0;
		lcam_addr_REG_1 <= io_dmem_release_bits_address;
		lcam_ldq_idx_reg <= ldq_wakeup_idx;
		lcam_ldq_idx_reg_1 <= _retry_queue_io_deq_bits_uop_ldq_idx;
		lcam_stq_idx_reg <= _retry_queue_io_deq_bits_uop_stq_idx;
		s1_executing_loads_0 <= (will_fire_load_agen_exec_0_will_fire ? (io_core_agen_0_bits_uop_ldq_idx[2:0] == 3'h0) & _s0_executing_loads_T_1 : (will_fire_load_retry_0_will_fire ? _GEN_266 & _s0_executing_loads_T_3 : ((~_GEN_282 & will_fire_load_wakeup_0_will_fire) & _GEN_258) & dmem_req_fire_0));
		s1_executing_loads_1 <= (will_fire_load_agen_exec_0_will_fire ? (io_core_agen_0_bits_uop_ldq_idx[2:0] == 3'h1) & _s0_executing_loads_T_1 : (will_fire_load_retry_0_will_fire ? _GEN_268 & _s0_executing_loads_T_3 : ((~_GEN_282 & will_fire_load_wakeup_0_will_fire) & _GEN_259) & dmem_req_fire_0));
		s1_executing_loads_2 <= (will_fire_load_agen_exec_0_will_fire ? (io_core_agen_0_bits_uop_ldq_idx[2:0] == 3'h2) & _s0_executing_loads_T_1 : (will_fire_load_retry_0_will_fire ? _GEN_270 & _s0_executing_loads_T_3 : ((~_GEN_282 & will_fire_load_wakeup_0_will_fire) & _GEN_260) & dmem_req_fire_0));
		s1_executing_loads_3 <= (will_fire_load_agen_exec_0_will_fire ? (io_core_agen_0_bits_uop_ldq_idx[2:0] == 3'h3) & _s0_executing_loads_T_1 : (will_fire_load_retry_0_will_fire ? _GEN_272 & _s0_executing_loads_T_3 : ((~_GEN_282 & will_fire_load_wakeup_0_will_fire) & _GEN_261) & dmem_req_fire_0));
		s1_executing_loads_4 <= (will_fire_load_agen_exec_0_will_fire ? (io_core_agen_0_bits_uop_ldq_idx[2:0] == 3'h4) & _s0_executing_loads_T_1 : (will_fire_load_retry_0_will_fire ? _GEN_274 & _s0_executing_loads_T_3 : ((~_GEN_282 & will_fire_load_wakeup_0_will_fire) & _GEN_262) & dmem_req_fire_0));
		s1_executing_loads_5 <= (will_fire_load_agen_exec_0_will_fire ? (io_core_agen_0_bits_uop_ldq_idx[2:0] == 3'h5) & _s0_executing_loads_T_1 : (will_fire_load_retry_0_will_fire ? _GEN_276 & _s0_executing_loads_T_3 : ((~_GEN_282 & will_fire_load_wakeup_0_will_fire) & _GEN_263) & dmem_req_fire_0));
		s1_executing_loads_6 <= (will_fire_load_agen_exec_0_will_fire ? (io_core_agen_0_bits_uop_ldq_idx[2:0] == 3'h6) & _s0_executing_loads_T_1 : (will_fire_load_retry_0_will_fire ? _GEN_278 & _s0_executing_loads_T_3 : ((~_GEN_282 & will_fire_load_wakeup_0_will_fire) & _GEN_264) & dmem_req_fire_0));
		s1_executing_loads_7 <= (will_fire_load_agen_exec_0_will_fire ? &io_core_agen_0_bits_uop_ldq_idx[2:0] & _s0_executing_loads_T_1 : (will_fire_load_retry_0_will_fire ? &_retry_queue_io_deq_bits_uop_ldq_idx[2:0] & _s0_executing_loads_T_3 : ((~_GEN_282 & will_fire_load_wakeup_0_will_fire) & (&ldq_wakeup_idx[2:0])) & dmem_req_fire_0));
		wb_ldst_forward_e_REG_uop_br_mask <= _GEN_42[lcam_ldq_idx_0[2:0] * 8+:8] & ~io_core_brupdate_b1_resolve_mask;
		wb_ldst_forward_e_REG_uop_rob_idx <= _GEN_81[lcam_ldq_idx_0[2:0] * 5+:5];
		wb_ldst_forward_e_REG_uop_ldq_idx <= _GEN_82[lcam_ldq_idx_0[2:0] * 4+:4];
		wb_ldst_forward_e_REG_uop_stq_idx <= _GEN_83[lcam_ldq_idx_0[2:0] * 4+:4];
		wb_ldst_forward_e_REG_uop_pdst <= _GEN_85[lcam_ldq_idx_0[2:0] * 6+:6];
		wb_ldst_forward_e_REG_uop_mem_size <= _GEN_98[lcam_ldq_idx_0[2:0] * 2+:2];
		wb_ldst_forward_e_REG_uop_mem_signed <= _GEN_99[lcam_ldq_idx_0[2:0]];
		wb_ldst_forward_e_REG_uop_dst_rtype <= _GEN_110[lcam_ldq_idx_0[2:0] * 2+:2];
		_GEN_605 = {ldq_observed_7, ldq_observed_6, ldq_observed_5, ldq_observed_4, ldq_observed_3, ldq_observed_2, ldq_observed_1, ldq_observed_0};
		wb_ldst_forward_e_REG_observed <= _GEN_605[lcam_ldq_idx_0[2:0]];
		wb_ldst_forward_e_REG_next_stq_idx <= _GEN_127[lcam_ldq_idx_0[2:0] * 4+:4];
		wb_ldst_forward_ldq_idx_0 <= lcam_ldq_idx_0;
		wb_ldst_forward_ld_addr_0 <= lcam_addr_0;
		REG_1 <= _GEN_541;
		REG_2 <= _GEN_541;
		REG_3 <= _GEN_541;
		REG_4 <= _GEN_541;
		REG_5 <= _GEN_541;
		REG_6 <= _GEN_541;
		REG_7 <= _GEN_541;
		REG_8 <= _GEN_541;
		REG_9 <= _GEN_541;
		REG_10 <= _GEN_541;
		wb_ldst_forward_valid_0_REG <= ((_can_forward_T | fired_load_retry_REG ? ~mem_tlb_uncacheable_0 : ~mem_ldq_wakeup_e_bits_addr_is_uncacheable) & ~(_GEN_365 ? (|_has_older_amo_T_2 | _GEN_347) | _GEN_562 : _GEN_347 | _GEN_562)) & do_ld_search_0;
		wb_ldst_forward_valid_0_REG_1 <= |(io_core_brupdate_b1_mispredict_mask & (do_st_search_0 ? (fired_store_agen_REG ? mem_stq_incoming_e_0_bits_uop_br_mask : (fired_store_retry_REG ? mem_stq_retry_e_bits_uop_br_mask : 8'h00)) : (do_ld_search_0 ? (_can_forward_T ? mem_ldq_incoming_e_0_bits_uop_br_mask : (fired_load_retry_REG ? mem_ldq_retry_e_bits_uop_br_mask : (fired_load_wakeup_REG ? mem_ldq_wakeup_e_bits_uop_br_mask : 8'h00))) : 8'h00))) | io_core_exception;
		REG_11 <= |ldst_addr_matches_0;
		if (_stq_execute_queue_io_deq_ready_T | ~can_fire_store_commit_slow_0)
			store_blocked_counter <= 4'h0;
		else if (can_fire_store_commit_slow_0 & ~(will_fire_store_commit_slow_0_will_fire | will_fire_store_commit_fast_0_will_fire)) begin
			if (&store_blocked_counter)
				store_blocked_counter <= 4'hf;
			else
				store_blocked_counter <= store_blocked_counter + 4'h1;
		end
		io_core_clr_unsafe_0_valid_REG <= do_st_search_0;
		io_core_clr_unsafe_0_valid_REG_1 <= dmem_req_fire_0;
		io_core_clr_unsafe_0_valid_REG_2 <= ((do_ld_search_0 & ~fired_load_agen_REG) & ~io_dmem_s1_kill_0_0) & io_core_clr_unsafe_0_valid_REG_1;
		io_core_clr_unsafe_0_valid_REG_3 <= ((_GEN_576 | _GEN_574) | _GEN_554) | (_GEN_332 ? (_GEN_551 | _GEN_550) | _GEN_549 : _GEN_550 | _GEN_549);
		io_core_clr_unsafe_0_bits_REG <= (do_st_search_0 ? (fired_store_agen_REG ? mem_stq_incoming_e_0_bits_uop_rob_idx : (fired_store_retry_REG ? mem_stq_retry_e_bits_uop_rob_idx : 5'h00)) : (do_ld_search_0 ? (_can_forward_T ? mem_ldq_incoming_e_0_bits_uop_rob_idx : (fired_load_retry_REG ? mem_ldq_retry_e_bits_uop_rob_idx : (fired_load_wakeup_REG ? mem_ldq_wakeup_e_bits_uop_rob_idx : 5'h00))) : 5'h00));
		r_xcpt_uop_br_mask <= xcpt_uop_br_mask & ~io_core_brupdate_b1_resolve_mask;
		r_xcpt_uop_rob_idx <= (use_mem_xcpt ? mem_xcpt_uops_0_rob_idx : _GEN_81[l_idx_base_idx * 5+:5]);
		r_xcpt_cause <= (use_mem_xcpt ? {1'h0, mem_xcpt_causes_0} : 5'h10);
		r_xcpt_badvaddr <= mem_xcpt_vaddrs_0[39:0];
		wakeupArbs_0_io_in_1_valid_REG <= dmem_req_fire_0;
		io_core_iresp_0_REG_valid <= iresp_0_valid & ~(|(io_core_brupdate_b1_mispredict_mask & iresp_0_bits_uop_br_mask) | io_core_exception);
		io_core_iresp_0_REG_bits_uop_br_mask <= iresp_0_bits_uop_br_mask & ~io_core_brupdate_b1_resolve_mask;
		io_core_iresp_0_REG_bits_uop_rob_idx <= (_GEN_385 ? (resp_uop_uses_stq ? _GEN_193[resp_uop_stq_idx * 5+:5] : _GEN_81[resp_uop_ldq_idx * 5+:5]) : wb_ldst_forward_e_REG_uop_rob_idx);
		io_core_iresp_0_REG_bits_uop_pdst <= iresp_0_bits_uop_pdst;
		io_core_iresp_0_REG_bits_data <= (_GEN_385 ? resp_data : {(_ldq_debug_wb_data_T_17 ? {56 {wb_ldst_forward_e_REG_uop_mem_signed & iresp_0_bits_data_zeroed_2[7]}} : {(_ldq_debug_wb_data_T_9 ? {48 {wb_ldst_forward_e_REG_uop_mem_signed & iresp_0_bits_data_zeroed_1[15]}} : {(_ldq_debug_wb_data_T_1 ? {32 {wb_ldst_forward_e_REG_uop_mem_signed & iresp_0_bits_data_zeroed[31]}} : _GEN_384[63:32]), iresp_0_bits_data_zeroed[31:16]}), iresp_0_bits_data_zeroed_1[15:8]}), iresp_0_bits_data_zeroed_2});
		w1_valid <= (_wakeupArbs_0_io_in_1_ready & _wakeupArbs_0_io_in_1_valid_T_4) & ~(|(io_core_brupdate_b1_mispredict_mask & mem_incoming_uop_0_br_mask) | io_core_exception);
		w1_bits_uop_br_mask <= mem_incoming_uop_0_br_mask & ~io_core_brupdate_b1_resolve_mask;
		w1_bits_uop_ldq_idx <= mem_incoming_uop_0_ldq_idx;
		w1_bits_uop_pdst <= mem_incoming_uop_0_pdst;
		w1_bits_uop_dst_rtype <= mem_incoming_uop_0_dst_rtype;
		w2_valid <= w1_valid & ~(|(io_core_brupdate_b1_mispredict_mask & w1_bits_uop_br_mask) | io_core_exception);
		w2_bits_uop_ldq_idx <= w1_bits_uop_ldq_idx;
		w2_bits_uop_pdst <= w1_bits_uop_pdst;
		w2_bits_uop_dst_rtype <= w1_bits_uop_dst_rtype;
		slow_wakeups_0_REG_valid <= iresp_0_valid & ~(|(io_core_brupdate_b1_mispredict_mask & iresp_0_bits_uop_br_mask) | io_core_exception);
		slow_wakeups_0_REG_bits_uop_ldq_idx <= (_GEN_385 ? (resp_uop_uses_stq ? _GEN_194[resp_uop_stq_idx * 4+:4] : _GEN_82[resp_uop_ldq_idx * 4+:4]) : wb_ldst_forward_e_REG_uop_ldq_idx);
		slow_wakeups_0_REG_bits_uop_pdst <= iresp_0_bits_uop_pdst;
		slow_wakeups_0_REG_bits_uop_dst_rtype <= (_GEN_385 ? (resp_uop_uses_stq ? _GEN_222[resp_uop_stq_idx * 2+:2] : _GEN_110[resp_uop_ldq_idx * 2+:2]) : wb_ldst_forward_e_REG_uop_dst_rtype);
		if (reset) begin
			hella_state <= 3'h0;
			r_xcpt_valid <= 1'h0;
		end
		else begin : sv2v_autoblock_2
			reg _GEN_606;
			reg [2:0] _GEN_607;
			reg [23:0] _GEN_608;
			_GEN_606 = will_fire_hella_incoming_0_will_fire & dmem_req_fire_0;
			_GEN_607 = (_GEN_368 & (_GEN_435 | _GEN_434) ? 3'h0 : hella_state);
			_GEN_608 = {_GEN_607, _GEN_607, (will_fire_hella_wakeup_0_will_fire & dmem_req_fire_0 ? 3'h4 : hella_state), (_GEN_366 ? 3'h5 : (_GEN_436 | _GEN_434 ? 3'h0 : hella_state)), 4'h1, |{hella_xcpt_ma_ld, hella_xcpt_ma_st, hella_xcpt_pf_ld, hella_xcpt_pf_st, hella_xcpt_gf_ld, hella_xcpt_gf_st, hella_xcpt_ae_ld, hella_xcpt_ae_st}, 1'h0, (io_hellacache_s1_kill ? (_GEN_606 ? 3'h6 : 3'h0) : {2'h1, ~_GEN_606}), (_GEN_602 ? 3'h1 : hella_state)};
			hella_state <= _GEN_608[hella_state * 3+:3];
			r_xcpt_valid <= (|_ld_xcpt_valid_T_2 | mem_xcpt_valids_0) & ~(|(io_core_brupdate_b1_mispredict_mask & xcpt_uop_br_mask) | io_core_exception);
		end
	end
	NBDTLB dtlb(
		.clock(clock),
		.reset(reset),
		.io_req_0_valid(~_will_fire_store_commit_slow_0_T_2),
		.io_req_0_bits_vaddr(exe_tlb_vaddr_0[39:0]),
		.io_req_0_bits_passthrough(will_fire_hella_incoming_0_will_fire),
		.io_req_0_bits_size((((_exe_cmd_T | will_fire_store_agen_0_will_fire) | will_fire_load_retry_0_will_fire) | will_fire_store_retry_0_will_fire ? exe_tlb_uop_0_mem_size : {2 {will_fire_hella_incoming_0_will_fire}})),
		.io_req_0_bits_cmd((((_exe_cmd_T | will_fire_store_agen_0_will_fire) | will_fire_load_retry_0_will_fire) | will_fire_store_retry_0_will_fire ? exe_tlb_uop_0_mem_cmd : (will_fire_hella_incoming_0_will_fire | ~will_fire_sfence_0_will_fire ? 5'h00 : 5'h14))),
		.io_resp_0_miss(_dtlb_io_resp_0_miss),
		.io_resp_0_paddr(_dtlb_io_resp_0_paddr),
		.io_resp_0_pf_ld(_dtlb_io_resp_0_pf_ld),
		.io_resp_0_pf_st(_dtlb_io_resp_0_pf_st),
		.io_resp_0_ae_ld(_dtlb_io_resp_0_ae_ld),
		.io_resp_0_ae_st(_dtlb_io_resp_0_ae_st),
		.io_resp_0_ma_ld(_dtlb_io_resp_0_ma_ld),
		.io_resp_0_ma_st(_dtlb_io_resp_0_ma_st),
		.io_resp_0_cacheable(_dtlb_io_resp_0_cacheable),
		.io_sfence_valid(io_core_sfence_valid),
		.io_sfence_bits_rs1(io_core_sfence_bits_rs1),
		.io_sfence_bits_rs2(io_core_sfence_bits_rs2),
		.io_sfence_bits_addr(io_core_sfence_bits_addr),
		.io_ptw_req_ready(io_ptw_req_ready),
		.io_ptw_req_valid(_dtlb_io_ptw_req_valid),
		.io_ptw_req_bits_valid(io_ptw_req_bits_valid),
		.io_ptw_req_bits_bits_addr(io_ptw_req_bits_bits_addr),
		.io_ptw_resp_valid(io_ptw_resp_valid),
		.io_ptw_resp_bits_ae_final(io_ptw_resp_bits_ae_final),
		.io_ptw_resp_bits_pte_ppn(io_ptw_resp_bits_pte_ppn),
		.io_ptw_resp_bits_pte_d(io_ptw_resp_bits_pte_d),
		.io_ptw_resp_bits_pte_a(io_ptw_resp_bits_pte_a),
		.io_ptw_resp_bits_pte_g(io_ptw_resp_bits_pte_g),
		.io_ptw_resp_bits_pte_u(io_ptw_resp_bits_pte_u),
		.io_ptw_resp_bits_pte_x(io_ptw_resp_bits_pte_x),
		.io_ptw_resp_bits_pte_w(io_ptw_resp_bits_pte_w),
		.io_ptw_resp_bits_pte_r(io_ptw_resp_bits_pte_r),
		.io_ptw_resp_bits_pte_v(io_ptw_resp_bits_pte_v),
		.io_ptw_resp_bits_level(io_ptw_resp_bits_level),
		.io_ptw_resp_bits_homogeneous(io_ptw_resp_bits_homogeneous),
		.io_ptw_ptbr_mode(io_ptw_ptbr_mode),
		.io_ptw_status_dprv(io_ptw_status_dprv),
		.io_ptw_status_mxr(io_ptw_status_mxr),
		.io_ptw_status_sum(io_ptw_status_sum),
		.io_ptw_pmp_0_cfg_l(io_ptw_pmp_0_cfg_l),
		.io_ptw_pmp_0_cfg_a(io_ptw_pmp_0_cfg_a),
		.io_ptw_pmp_0_cfg_x(io_ptw_pmp_0_cfg_x),
		.io_ptw_pmp_0_cfg_w(io_ptw_pmp_0_cfg_w),
		.io_ptw_pmp_0_cfg_r(io_ptw_pmp_0_cfg_r),
		.io_ptw_pmp_0_addr(io_ptw_pmp_0_addr),
		.io_ptw_pmp_0_mask(io_ptw_pmp_0_mask),
		.io_ptw_pmp_1_cfg_l(io_ptw_pmp_1_cfg_l),
		.io_ptw_pmp_1_cfg_a(io_ptw_pmp_1_cfg_a),
		.io_ptw_pmp_1_cfg_x(io_ptw_pmp_1_cfg_x),
		.io_ptw_pmp_1_cfg_w(io_ptw_pmp_1_cfg_w),
		.io_ptw_pmp_1_cfg_r(io_ptw_pmp_1_cfg_r),
		.io_ptw_pmp_1_addr(io_ptw_pmp_1_addr),
		.io_ptw_pmp_1_mask(io_ptw_pmp_1_mask),
		.io_ptw_pmp_2_cfg_l(io_ptw_pmp_2_cfg_l),
		.io_ptw_pmp_2_cfg_a(io_ptw_pmp_2_cfg_a),
		.io_ptw_pmp_2_cfg_x(io_ptw_pmp_2_cfg_x),
		.io_ptw_pmp_2_cfg_w(io_ptw_pmp_2_cfg_w),
		.io_ptw_pmp_2_cfg_r(io_ptw_pmp_2_cfg_r),
		.io_ptw_pmp_2_addr(io_ptw_pmp_2_addr),
		.io_ptw_pmp_2_mask(io_ptw_pmp_2_mask),
		.io_ptw_pmp_3_cfg_l(io_ptw_pmp_3_cfg_l),
		.io_ptw_pmp_3_cfg_a(io_ptw_pmp_3_cfg_a),
		.io_ptw_pmp_3_cfg_x(io_ptw_pmp_3_cfg_x),
		.io_ptw_pmp_3_cfg_w(io_ptw_pmp_3_cfg_w),
		.io_ptw_pmp_3_cfg_r(io_ptw_pmp_3_cfg_r),
		.io_ptw_pmp_3_addr(io_ptw_pmp_3_addr),
		.io_ptw_pmp_3_mask(io_ptw_pmp_3_mask),
		.io_ptw_pmp_4_cfg_l(io_ptw_pmp_4_cfg_l),
		.io_ptw_pmp_4_cfg_a(io_ptw_pmp_4_cfg_a),
		.io_ptw_pmp_4_cfg_x(io_ptw_pmp_4_cfg_x),
		.io_ptw_pmp_4_cfg_w(io_ptw_pmp_4_cfg_w),
		.io_ptw_pmp_4_cfg_r(io_ptw_pmp_4_cfg_r),
		.io_ptw_pmp_4_addr(io_ptw_pmp_4_addr),
		.io_ptw_pmp_4_mask(io_ptw_pmp_4_mask),
		.io_ptw_pmp_5_cfg_l(io_ptw_pmp_5_cfg_l),
		.io_ptw_pmp_5_cfg_a(io_ptw_pmp_5_cfg_a),
		.io_ptw_pmp_5_cfg_x(io_ptw_pmp_5_cfg_x),
		.io_ptw_pmp_5_cfg_w(io_ptw_pmp_5_cfg_w),
		.io_ptw_pmp_5_cfg_r(io_ptw_pmp_5_cfg_r),
		.io_ptw_pmp_5_addr(io_ptw_pmp_5_addr),
		.io_ptw_pmp_5_mask(io_ptw_pmp_5_mask),
		.io_ptw_pmp_6_cfg_l(io_ptw_pmp_6_cfg_l),
		.io_ptw_pmp_6_cfg_a(io_ptw_pmp_6_cfg_a),
		.io_ptw_pmp_6_cfg_x(io_ptw_pmp_6_cfg_x),
		.io_ptw_pmp_6_cfg_w(io_ptw_pmp_6_cfg_w),
		.io_ptw_pmp_6_cfg_r(io_ptw_pmp_6_cfg_r),
		.io_ptw_pmp_6_addr(io_ptw_pmp_6_addr),
		.io_ptw_pmp_6_mask(io_ptw_pmp_6_mask),
		.io_ptw_pmp_7_cfg_l(io_ptw_pmp_7_cfg_l),
		.io_ptw_pmp_7_cfg_a(io_ptw_pmp_7_cfg_a),
		.io_ptw_pmp_7_cfg_x(io_ptw_pmp_7_cfg_x),
		.io_ptw_pmp_7_cfg_w(io_ptw_pmp_7_cfg_w),
		.io_ptw_pmp_7_cfg_r(io_ptw_pmp_7_cfg_r),
		.io_ptw_pmp_7_addr(io_ptw_pmp_7_addr),
		.io_ptw_pmp_7_mask(io_ptw_pmp_7_mask),
		.io_kill(will_fire_hella_incoming_0_will_fire & io_hellacache_s1_kill)
	);
	BranchKillableQueue_7 retry_queue(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_retry_queue_io_enq_ready),
		.io_enq_valid(_retry_queue_io_enq_valid_T),
		.io_enq_bits_uop_inst((can_enq_store_retry ? _GEN_128[stq_enq_retry_idx[2:0] * 32+:32] : _GEN_16[ldq_enq_retry_idx[2:0] * 32+:32])),
		.io_enq_bits_uop_debug_inst((can_enq_store_retry ? _GEN_129[stq_enq_retry_idx[2:0] * 32+:32] : _GEN_17[ldq_enq_retry_idx[2:0] * 32+:32])),
		.io_enq_bits_uop_is_rvc((can_enq_store_retry ? _GEN_130[stq_enq_retry_idx[2:0]] : _GEN_18[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_debug_pc((can_enq_store_retry ? _GEN_131[stq_enq_retry_idx[2:0] * 40+:40] : _GEN_19[ldq_enq_retry_idx[2:0] * 40+:40])),
		.io_enq_bits_uop_iq_type_0((can_enq_store_retry ? _GEN_132[stq_enq_retry_idx[2:0]] : _GEN_20[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_iq_type_1((can_enq_store_retry ? _GEN_133[stq_enq_retry_idx[2:0]] : _GEN_21[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_iq_type_2((can_enq_store_retry ? _GEN_134[stq_enq_retry_idx[2:0]] : _GEN_22[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_iq_type_3((can_enq_store_retry ? _GEN_135[stq_enq_retry_idx[2:0]] : _GEN_23[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_fu_code_0((can_enq_store_retry ? _GEN_136[stq_enq_retry_idx[2:0]] : _GEN_24[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_fu_code_1((can_enq_store_retry ? _GEN_137[stq_enq_retry_idx[2:0]] : _GEN_25[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_fu_code_2((can_enq_store_retry ? _GEN_138[stq_enq_retry_idx[2:0]] : _GEN_26[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_fu_code_3((can_enq_store_retry ? _GEN_139[stq_enq_retry_idx[2:0]] : _GEN_27[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_fu_code_4((can_enq_store_retry ? _GEN_140[stq_enq_retry_idx[2:0]] : _GEN_28[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_fu_code_5((can_enq_store_retry ? _GEN_141[stq_enq_retry_idx[2:0]] : _GEN_29[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_fu_code_6((can_enq_store_retry ? _GEN_142[stq_enq_retry_idx[2:0]] : _GEN_30[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_fu_code_7((can_enq_store_retry ? _GEN_143[stq_enq_retry_idx[2:0]] : _GEN_31[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_fu_code_8((can_enq_store_retry ? _GEN_144[stq_enq_retry_idx[2:0]] : _GEN_32[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_fu_code_9((can_enq_store_retry ? _GEN_145[stq_enq_retry_idx[2:0]] : _GEN_33[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_iw_issued((can_enq_store_retry ? _GEN_146[stq_enq_retry_idx[2:0]] : _GEN_34[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_iw_issued_partial_agen((can_enq_store_retry ? _GEN_147[stq_enq_retry_idx[2:0]] : _GEN_35[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_iw_issued_partial_dgen((can_enq_store_retry ? _GEN_148[stq_enq_retry_idx[2:0]] : _GEN_36[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_iw_p1_speculative_child((can_enq_store_retry ? _GEN_149[stq_enq_retry_idx[2:0]] : _GEN_37[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_iw_p2_speculative_child((can_enq_store_retry ? _GEN_150[stq_enq_retry_idx[2:0]] : _GEN_38[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_iw_p1_bypass_hint((can_enq_store_retry ? _GEN_151[stq_enq_retry_idx[2:0]] : _GEN_39[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_iw_p2_bypass_hint((can_enq_store_retry ? _GEN_152[stq_enq_retry_idx[2:0]] : _GEN_40[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_iw_p3_bypass_hint((can_enq_store_retry ? _GEN_153[stq_enq_retry_idx[2:0]] : _GEN_41[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_br_mask((can_enq_store_retry ? _GEN_154[stq_enq_retry_idx[2:0] * 8+:8] : _GEN_42[ldq_enq_retry_idx[2:0] * 8+:8])),
		.io_enq_bits_uop_br_tag((can_enq_store_retry ? _GEN_155[stq_enq_retry_idx[2:0] * 3+:3] : _GEN_43[ldq_enq_retry_idx[2:0] * 3+:3])),
		.io_enq_bits_uop_br_type((can_enq_store_retry ? _GEN_156[stq_enq_retry_idx[2:0] * 4+:4] : _GEN_44[ldq_enq_retry_idx[2:0] * 4+:4])),
		.io_enq_bits_uop_is_sfb((can_enq_store_retry ? _GEN_157[stq_enq_retry_idx[2:0]] : _GEN_45[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_is_fence((can_enq_store_retry ? _GEN_158[stq_enq_retry_idx[2:0]] : _GEN_46[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_is_fencei((can_enq_store_retry ? _GEN_159[stq_enq_retry_idx[2:0]] : _GEN_47[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_is_sfence((can_enq_store_retry ? _GEN_160[stq_enq_retry_idx[2:0]] : _GEN_48[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_is_amo((can_enq_store_retry ? _GEN_161[stq_enq_retry_idx[2:0]] : _GEN_49[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_is_eret((can_enq_store_retry ? _GEN_162[stq_enq_retry_idx[2:0]] : _GEN_50[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_is_sys_pc2epc((can_enq_store_retry ? _GEN_163[stq_enq_retry_idx[2:0]] : _GEN_51[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_is_rocc((can_enq_store_retry ? _GEN_164[stq_enq_retry_idx[2:0]] : _GEN_52[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_is_mov((can_enq_store_retry ? _GEN_165[stq_enq_retry_idx[2:0]] : _GEN_53[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_ftq_idx((can_enq_store_retry ? _GEN_166[stq_enq_retry_idx[2:0] * 4+:4] : _GEN_54[ldq_enq_retry_idx[2:0] * 4+:4])),
		.io_enq_bits_uop_edge_inst((can_enq_store_retry ? _GEN_167[stq_enq_retry_idx[2:0]] : _GEN_55[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_pc_lob((can_enq_store_retry ? _GEN_168[stq_enq_retry_idx[2:0] * 6+:6] : _GEN_56[ldq_enq_retry_idx[2:0] * 6+:6])),
		.io_enq_bits_uop_taken((can_enq_store_retry ? _GEN_169[stq_enq_retry_idx[2:0]] : _GEN_57[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_imm_rename((can_enq_store_retry ? _GEN_170[stq_enq_retry_idx[2:0]] : _GEN_58[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_imm_sel((can_enq_store_retry ? _GEN_171[stq_enq_retry_idx[2:0] * 3+:3] : _GEN_59[ldq_enq_retry_idx[2:0] * 3+:3])),
		.io_enq_bits_uop_pimm((can_enq_store_retry ? _GEN_172[stq_enq_retry_idx[2:0] * 5+:5] : _GEN_60[ldq_enq_retry_idx[2:0] * 5+:5])),
		.io_enq_bits_uop_imm_packed((can_enq_store_retry ? _GEN_173[stq_enq_retry_idx[2:0] * 20+:20] : _GEN_61[ldq_enq_retry_idx[2:0] * 20+:20])),
		.io_enq_bits_uop_op1_sel((can_enq_store_retry ? _GEN_174[stq_enq_retry_idx[2:0] * 2+:2] : _GEN_62[ldq_enq_retry_idx[2:0] * 2+:2])),
		.io_enq_bits_uop_op2_sel((can_enq_store_retry ? _GEN_175[stq_enq_retry_idx[2:0] * 3+:3] : _GEN_63[ldq_enq_retry_idx[2:0] * 3+:3])),
		.io_enq_bits_uop_fp_ctrl_ldst((can_enq_store_retry ? _GEN_176[stq_enq_retry_idx[2:0]] : _GEN_64[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_fp_ctrl_wen((can_enq_store_retry ? _GEN_177[stq_enq_retry_idx[2:0]] : _GEN_65[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_fp_ctrl_ren1((can_enq_store_retry ? _GEN_178[stq_enq_retry_idx[2:0]] : _GEN_66[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_fp_ctrl_ren2((can_enq_store_retry ? _GEN_179[stq_enq_retry_idx[2:0]] : _GEN_67[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_fp_ctrl_ren3((can_enq_store_retry ? _GEN_180[stq_enq_retry_idx[2:0]] : _GEN_68[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_fp_ctrl_swap12((can_enq_store_retry ? _GEN_181[stq_enq_retry_idx[2:0]] : _GEN_69[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_fp_ctrl_swap23((can_enq_store_retry ? _GEN_182[stq_enq_retry_idx[2:0]] : _GEN_70[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_fp_ctrl_typeTagIn((can_enq_store_retry ? _GEN_183[stq_enq_retry_idx[2:0] * 2+:2] : _GEN_71[ldq_enq_retry_idx[2:0] * 2+:2])),
		.io_enq_bits_uop_fp_ctrl_typeTagOut((can_enq_store_retry ? _GEN_184[stq_enq_retry_idx[2:0] * 2+:2] : _GEN_72[ldq_enq_retry_idx[2:0] * 2+:2])),
		.io_enq_bits_uop_fp_ctrl_fromint((can_enq_store_retry ? _GEN_185[stq_enq_retry_idx[2:0]] : _GEN_73[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_fp_ctrl_toint((can_enq_store_retry ? _GEN_186[stq_enq_retry_idx[2:0]] : _GEN_74[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_fp_ctrl_fastpipe((can_enq_store_retry ? _GEN_187[stq_enq_retry_idx[2:0]] : _GEN_75[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_fp_ctrl_fma((can_enq_store_retry ? _GEN_188[stq_enq_retry_idx[2:0]] : _GEN_76[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_fp_ctrl_div((can_enq_store_retry ? _GEN_189[stq_enq_retry_idx[2:0]] : _GEN_77[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_fp_ctrl_sqrt((can_enq_store_retry ? _GEN_190[stq_enq_retry_idx[2:0]] : _GEN_78[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_fp_ctrl_wflags((can_enq_store_retry ? _GEN_191[stq_enq_retry_idx[2:0]] : _GEN_79[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_fp_ctrl_vec((can_enq_store_retry ? _GEN_192[stq_enq_retry_idx[2:0]] : _GEN_80[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_rob_idx((can_enq_store_retry ? _GEN_193[stq_enq_retry_idx[2:0] * 5+:5] : _GEN_81[ldq_enq_retry_idx[2:0] * 5+:5])),
		.io_enq_bits_uop_ldq_idx(ldq_enq_retry_idx),
		.io_enq_bits_uop_stq_idx(stq_enq_retry_idx),
		.io_enq_bits_uop_rxq_idx((can_enq_store_retry ? _GEN_196[stq_enq_retry_idx[2:0] * 2+:2] : _GEN_84[ldq_enq_retry_idx[2:0] * 2+:2])),
		.io_enq_bits_uop_pdst((can_enq_store_retry ? _GEN_197[stq_enq_retry_idx[2:0] * 6+:6] : _GEN_85[ldq_enq_retry_idx[2:0] * 6+:6])),
		.io_enq_bits_uop_prs1((can_enq_store_retry ? _GEN_198[stq_enq_retry_idx[2:0] * 6+:6] : _GEN_86[ldq_enq_retry_idx[2:0] * 6+:6])),
		.io_enq_bits_uop_prs2((can_enq_store_retry ? _GEN_199[stq_enq_retry_idx[2:0] * 6+:6] : _GEN_87[ldq_enq_retry_idx[2:0] * 6+:6])),
		.io_enq_bits_uop_prs3((can_enq_store_retry ? _GEN_200[stq_enq_retry_idx[2:0] * 6+:6] : _GEN_88[ldq_enq_retry_idx[2:0] * 6+:6])),
		.io_enq_bits_uop_ppred((can_enq_store_retry ? _GEN_201[stq_enq_retry_idx[2:0] * 4+:4] : _GEN_89[ldq_enq_retry_idx[2:0] * 4+:4])),
		.io_enq_bits_uop_prs1_busy((can_enq_store_retry ? _GEN_202[stq_enq_retry_idx[2:0]] : _GEN_90[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_prs2_busy((can_enq_store_retry ? _GEN_203[stq_enq_retry_idx[2:0]] : _GEN_91[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_prs3_busy((can_enq_store_retry ? _GEN_204[stq_enq_retry_idx[2:0]] : _GEN_92[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_ppred_busy((can_enq_store_retry ? _GEN_205[stq_enq_retry_idx[2:0]] : _GEN_93[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_stale_pdst((can_enq_store_retry ? _GEN_206[stq_enq_retry_idx[2:0] * 6+:6] : _GEN_94[ldq_enq_retry_idx[2:0] * 6+:6])),
		.io_enq_bits_uop_exception((can_enq_store_retry ? _GEN_207[stq_enq_retry_idx[2:0]] : _GEN_95[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_exc_cause((can_enq_store_retry ? _GEN_208[stq_enq_retry_idx[2:0] * 64+:64] : _GEN_96[ldq_enq_retry_idx[2:0] * 64+:64])),
		.io_enq_bits_uop_mem_cmd((can_enq_store_retry ? _GEN_209[stq_enq_retry_idx[2:0] * 5+:5] : _GEN_97[ldq_enq_retry_idx[2:0] * 5+:5])),
		.io_enq_bits_uop_mem_size((can_enq_store_retry ? _GEN_210[stq_enq_retry_idx[2:0] * 2+:2] : _GEN_98[ldq_enq_retry_idx[2:0] * 2+:2])),
		.io_enq_bits_uop_mem_signed((can_enq_store_retry ? _GEN_211[stq_enq_retry_idx[2:0]] : _GEN_99[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_uses_ldq(can_enq_load_retry & ~can_enq_store_retry),
		.io_enq_bits_uop_uses_stq(can_enq_store_retry),
		.io_enq_bits_uop_is_unique((can_enq_store_retry ? _GEN_214[stq_enq_retry_idx[2:0]] : _GEN_102[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_flush_on_commit((can_enq_store_retry ? _GEN_215[stq_enq_retry_idx[2:0]] : _GEN_103[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_csr_cmd((can_enq_store_retry ? _GEN_216[stq_enq_retry_idx[2:0] * 3+:3] : _GEN_104[ldq_enq_retry_idx[2:0] * 3+:3])),
		.io_enq_bits_uop_ldst_is_rs1((can_enq_store_retry ? _GEN_217[stq_enq_retry_idx[2:0]] : _GEN_105[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_ldst((can_enq_store_retry ? _GEN_218[stq_enq_retry_idx[2:0] * 6+:6] : _GEN_106[ldq_enq_retry_idx[2:0] * 6+:6])),
		.io_enq_bits_uop_lrs1((can_enq_store_retry ? _GEN_219[stq_enq_retry_idx[2:0] * 6+:6] : _GEN_107[ldq_enq_retry_idx[2:0] * 6+:6])),
		.io_enq_bits_uop_lrs2((can_enq_store_retry ? _GEN_220[stq_enq_retry_idx[2:0] * 6+:6] : _GEN_108[ldq_enq_retry_idx[2:0] * 6+:6])),
		.io_enq_bits_uop_lrs3((can_enq_store_retry ? _GEN_221[stq_enq_retry_idx[2:0] * 6+:6] : _GEN_109[ldq_enq_retry_idx[2:0] * 6+:6])),
		.io_enq_bits_uop_dst_rtype((can_enq_store_retry ? _GEN_222[stq_enq_retry_idx[2:0] * 2+:2] : _GEN_110[ldq_enq_retry_idx[2:0] * 2+:2])),
		.io_enq_bits_uop_lrs1_rtype((can_enq_store_retry ? _GEN_223[stq_enq_retry_idx[2:0] * 2+:2] : _GEN_111[ldq_enq_retry_idx[2:0] * 2+:2])),
		.io_enq_bits_uop_lrs2_rtype((can_enq_store_retry ? _GEN_224[stq_enq_retry_idx[2:0] * 2+:2] : _GEN_112[ldq_enq_retry_idx[2:0] * 2+:2])),
		.io_enq_bits_uop_frs3_en((can_enq_store_retry ? _GEN_225[stq_enq_retry_idx[2:0]] : _GEN_113[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_fcn_dw((can_enq_store_retry ? _GEN_226[stq_enq_retry_idx[2:0]] : _GEN_114[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_fcn_op((can_enq_store_retry ? _GEN_227[stq_enq_retry_idx[2:0] * 5+:5] : _GEN_115[ldq_enq_retry_idx[2:0] * 5+:5])),
		.io_enq_bits_uop_fp_val((can_enq_store_retry ? _GEN_228[stq_enq_retry_idx[2:0]] : _GEN_116[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_fp_rm((can_enq_store_retry ? _GEN_229[stq_enq_retry_idx[2:0] * 3+:3] : _GEN_117[ldq_enq_retry_idx[2:0] * 3+:3])),
		.io_enq_bits_uop_fp_typ((can_enq_store_retry ? _GEN_230[stq_enq_retry_idx[2:0] * 2+:2] : _GEN_118[ldq_enq_retry_idx[2:0] * 2+:2])),
		.io_enq_bits_uop_xcpt_pf_if((can_enq_store_retry ? _GEN_231[stq_enq_retry_idx[2:0]] : _GEN_119[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_xcpt_ae_if((can_enq_store_retry ? _GEN_232[stq_enq_retry_idx[2:0]] : _GEN_120[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_xcpt_ma_if((can_enq_store_retry ? _GEN_233[stq_enq_retry_idx[2:0]] : _GEN_121[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_bp_debug_if((can_enq_store_retry ? _GEN_234[stq_enq_retry_idx[2:0]] : _GEN_122[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_bp_xcpt_if((can_enq_store_retry ? _GEN_235[stq_enq_retry_idx[2:0]] : _GEN_123[ldq_enq_retry_idx[2:0]])),
		.io_enq_bits_uop_debug_fsrc((can_enq_store_retry ? _GEN_236[stq_enq_retry_idx[2:0] * 3+:3] : _GEN_124[ldq_enq_retry_idx[2:0] * 3+:3])),
		.io_enq_bits_uop_debug_tsrc((can_enq_store_retry ? _GEN_237[stq_enq_retry_idx[2:0] * 3+:3] : _GEN_125[ldq_enq_retry_idx[2:0] * 3+:3])),
		.io_enq_bits_data({24'h000000, (can_enq_store_retry ? _GEN_245[stq_enq_retry_idx[2:0] * 40+:40] : _GEN_239[ldq_enq_retry_idx[2:0] * 40+:40])}),
		.io_deq_ready(_exe_tlb_vaddr_T_2),
		.io_deq_valid(_retry_queue_io_deq_valid),
		.io_deq_bits_uop_inst(_retry_queue_io_deq_bits_uop_inst),
		.io_deq_bits_uop_debug_inst(_retry_queue_io_deq_bits_uop_debug_inst),
		.io_deq_bits_uop_is_rvc(_retry_queue_io_deq_bits_uop_is_rvc),
		.io_deq_bits_uop_debug_pc(_retry_queue_io_deq_bits_uop_debug_pc),
		.io_deq_bits_uop_iq_type_0(_retry_queue_io_deq_bits_uop_iq_type_0),
		.io_deq_bits_uop_iq_type_1(_retry_queue_io_deq_bits_uop_iq_type_1),
		.io_deq_bits_uop_iq_type_2(_retry_queue_io_deq_bits_uop_iq_type_2),
		.io_deq_bits_uop_iq_type_3(_retry_queue_io_deq_bits_uop_iq_type_3),
		.io_deq_bits_uop_fu_code_0(_retry_queue_io_deq_bits_uop_fu_code_0),
		.io_deq_bits_uop_fu_code_1(_retry_queue_io_deq_bits_uop_fu_code_1),
		.io_deq_bits_uop_fu_code_2(_retry_queue_io_deq_bits_uop_fu_code_2),
		.io_deq_bits_uop_fu_code_3(_retry_queue_io_deq_bits_uop_fu_code_3),
		.io_deq_bits_uop_fu_code_4(_retry_queue_io_deq_bits_uop_fu_code_4),
		.io_deq_bits_uop_fu_code_5(_retry_queue_io_deq_bits_uop_fu_code_5),
		.io_deq_bits_uop_fu_code_6(_retry_queue_io_deq_bits_uop_fu_code_6),
		.io_deq_bits_uop_fu_code_7(_retry_queue_io_deq_bits_uop_fu_code_7),
		.io_deq_bits_uop_fu_code_8(_retry_queue_io_deq_bits_uop_fu_code_8),
		.io_deq_bits_uop_fu_code_9(_retry_queue_io_deq_bits_uop_fu_code_9),
		.io_deq_bits_uop_iw_issued(_retry_queue_io_deq_bits_uop_iw_issued),
		.io_deq_bits_uop_iw_issued_partial_agen(_retry_queue_io_deq_bits_uop_iw_issued_partial_agen),
		.io_deq_bits_uop_iw_issued_partial_dgen(_retry_queue_io_deq_bits_uop_iw_issued_partial_dgen),
		.io_deq_bits_uop_iw_p1_speculative_child(_retry_queue_io_deq_bits_uop_iw_p1_speculative_child),
		.io_deq_bits_uop_iw_p2_speculative_child(_retry_queue_io_deq_bits_uop_iw_p2_speculative_child),
		.io_deq_bits_uop_iw_p1_bypass_hint(_retry_queue_io_deq_bits_uop_iw_p1_bypass_hint),
		.io_deq_bits_uop_iw_p2_bypass_hint(_retry_queue_io_deq_bits_uop_iw_p2_bypass_hint),
		.io_deq_bits_uop_iw_p3_bypass_hint(_retry_queue_io_deq_bits_uop_iw_p3_bypass_hint),
		.io_deq_bits_uop_dis_col_sel(_retry_queue_io_deq_bits_uop_dis_col_sel),
		.io_deq_bits_uop_br_mask(_retry_queue_io_deq_bits_uop_br_mask),
		.io_deq_bits_uop_br_tag(_retry_queue_io_deq_bits_uop_br_tag),
		.io_deq_bits_uop_br_type(_retry_queue_io_deq_bits_uop_br_type),
		.io_deq_bits_uop_is_sfb(_retry_queue_io_deq_bits_uop_is_sfb),
		.io_deq_bits_uop_is_fence(_retry_queue_io_deq_bits_uop_is_fence),
		.io_deq_bits_uop_is_fencei(_retry_queue_io_deq_bits_uop_is_fencei),
		.io_deq_bits_uop_is_sfence(_retry_queue_io_deq_bits_uop_is_sfence),
		.io_deq_bits_uop_is_amo(_retry_queue_io_deq_bits_uop_is_amo),
		.io_deq_bits_uop_is_eret(_retry_queue_io_deq_bits_uop_is_eret),
		.io_deq_bits_uop_is_sys_pc2epc(_retry_queue_io_deq_bits_uop_is_sys_pc2epc),
		.io_deq_bits_uop_is_rocc(_retry_queue_io_deq_bits_uop_is_rocc),
		.io_deq_bits_uop_is_mov(_retry_queue_io_deq_bits_uop_is_mov),
		.io_deq_bits_uop_ftq_idx(_retry_queue_io_deq_bits_uop_ftq_idx),
		.io_deq_bits_uop_edge_inst(_retry_queue_io_deq_bits_uop_edge_inst),
		.io_deq_bits_uop_pc_lob(_retry_queue_io_deq_bits_uop_pc_lob),
		.io_deq_bits_uop_taken(_retry_queue_io_deq_bits_uop_taken),
		.io_deq_bits_uop_imm_rename(_retry_queue_io_deq_bits_uop_imm_rename),
		.io_deq_bits_uop_imm_sel(_retry_queue_io_deq_bits_uop_imm_sel),
		.io_deq_bits_uop_pimm(_retry_queue_io_deq_bits_uop_pimm),
		.io_deq_bits_uop_imm_packed(_retry_queue_io_deq_bits_uop_imm_packed),
		.io_deq_bits_uop_op1_sel(_retry_queue_io_deq_bits_uop_op1_sel),
		.io_deq_bits_uop_op2_sel(_retry_queue_io_deq_bits_uop_op2_sel),
		.io_deq_bits_uop_fp_ctrl_ldst(_retry_queue_io_deq_bits_uop_fp_ctrl_ldst),
		.io_deq_bits_uop_fp_ctrl_wen(_retry_queue_io_deq_bits_uop_fp_ctrl_wen),
		.io_deq_bits_uop_fp_ctrl_ren1(_retry_queue_io_deq_bits_uop_fp_ctrl_ren1),
		.io_deq_bits_uop_fp_ctrl_ren2(_retry_queue_io_deq_bits_uop_fp_ctrl_ren2),
		.io_deq_bits_uop_fp_ctrl_ren3(_retry_queue_io_deq_bits_uop_fp_ctrl_ren3),
		.io_deq_bits_uop_fp_ctrl_swap12(_retry_queue_io_deq_bits_uop_fp_ctrl_swap12),
		.io_deq_bits_uop_fp_ctrl_swap23(_retry_queue_io_deq_bits_uop_fp_ctrl_swap23),
		.io_deq_bits_uop_fp_ctrl_typeTagIn(_retry_queue_io_deq_bits_uop_fp_ctrl_typeTagIn),
		.io_deq_bits_uop_fp_ctrl_typeTagOut(_retry_queue_io_deq_bits_uop_fp_ctrl_typeTagOut),
		.io_deq_bits_uop_fp_ctrl_fromint(_retry_queue_io_deq_bits_uop_fp_ctrl_fromint),
		.io_deq_bits_uop_fp_ctrl_toint(_retry_queue_io_deq_bits_uop_fp_ctrl_toint),
		.io_deq_bits_uop_fp_ctrl_fastpipe(_retry_queue_io_deq_bits_uop_fp_ctrl_fastpipe),
		.io_deq_bits_uop_fp_ctrl_fma(_retry_queue_io_deq_bits_uop_fp_ctrl_fma),
		.io_deq_bits_uop_fp_ctrl_div(_retry_queue_io_deq_bits_uop_fp_ctrl_div),
		.io_deq_bits_uop_fp_ctrl_sqrt(_retry_queue_io_deq_bits_uop_fp_ctrl_sqrt),
		.io_deq_bits_uop_fp_ctrl_wflags(_retry_queue_io_deq_bits_uop_fp_ctrl_wflags),
		.io_deq_bits_uop_fp_ctrl_vec(_retry_queue_io_deq_bits_uop_fp_ctrl_vec),
		.io_deq_bits_uop_rob_idx(_retry_queue_io_deq_bits_uop_rob_idx),
		.io_deq_bits_uop_ldq_idx(_retry_queue_io_deq_bits_uop_ldq_idx),
		.io_deq_bits_uop_stq_idx(_retry_queue_io_deq_bits_uop_stq_idx),
		.io_deq_bits_uop_rxq_idx(_retry_queue_io_deq_bits_uop_rxq_idx),
		.io_deq_bits_uop_pdst(_retry_queue_io_deq_bits_uop_pdst),
		.io_deq_bits_uop_prs1(_retry_queue_io_deq_bits_uop_prs1),
		.io_deq_bits_uop_prs2(_retry_queue_io_deq_bits_uop_prs2),
		.io_deq_bits_uop_prs3(_retry_queue_io_deq_bits_uop_prs3),
		.io_deq_bits_uop_ppred(_retry_queue_io_deq_bits_uop_ppred),
		.io_deq_bits_uop_prs1_busy(_retry_queue_io_deq_bits_uop_prs1_busy),
		.io_deq_bits_uop_prs2_busy(_retry_queue_io_deq_bits_uop_prs2_busy),
		.io_deq_bits_uop_prs3_busy(_retry_queue_io_deq_bits_uop_prs3_busy),
		.io_deq_bits_uop_ppred_busy(_retry_queue_io_deq_bits_uop_ppred_busy),
		.io_deq_bits_uop_stale_pdst(_retry_queue_io_deq_bits_uop_stale_pdst),
		.io_deq_bits_uop_exception(_retry_queue_io_deq_bits_uop_exception),
		.io_deq_bits_uop_exc_cause(_retry_queue_io_deq_bits_uop_exc_cause),
		.io_deq_bits_uop_mem_cmd(_retry_queue_io_deq_bits_uop_mem_cmd),
		.io_deq_bits_uop_mem_size(_retry_queue_io_deq_bits_uop_mem_size),
		.io_deq_bits_uop_mem_signed(_retry_queue_io_deq_bits_uop_mem_signed),
		.io_deq_bits_uop_uses_ldq(_retry_queue_io_deq_bits_uop_uses_ldq),
		.io_deq_bits_uop_uses_stq(_retry_queue_io_deq_bits_uop_uses_stq),
		.io_deq_bits_uop_is_unique(_retry_queue_io_deq_bits_uop_is_unique),
		.io_deq_bits_uop_flush_on_commit(_retry_queue_io_deq_bits_uop_flush_on_commit),
		.io_deq_bits_uop_csr_cmd(_retry_queue_io_deq_bits_uop_csr_cmd),
		.io_deq_bits_uop_ldst_is_rs1(_retry_queue_io_deq_bits_uop_ldst_is_rs1),
		.io_deq_bits_uop_ldst(_retry_queue_io_deq_bits_uop_ldst),
		.io_deq_bits_uop_lrs1(_retry_queue_io_deq_bits_uop_lrs1),
		.io_deq_bits_uop_lrs2(_retry_queue_io_deq_bits_uop_lrs2),
		.io_deq_bits_uop_lrs3(_retry_queue_io_deq_bits_uop_lrs3),
		.io_deq_bits_uop_dst_rtype(_retry_queue_io_deq_bits_uop_dst_rtype),
		.io_deq_bits_uop_lrs1_rtype(_retry_queue_io_deq_bits_uop_lrs1_rtype),
		.io_deq_bits_uop_lrs2_rtype(_retry_queue_io_deq_bits_uop_lrs2_rtype),
		.io_deq_bits_uop_frs3_en(_retry_queue_io_deq_bits_uop_frs3_en),
		.io_deq_bits_uop_fcn_dw(_retry_queue_io_deq_bits_uop_fcn_dw),
		.io_deq_bits_uop_fcn_op(_retry_queue_io_deq_bits_uop_fcn_op),
		.io_deq_bits_uop_fp_val(_retry_queue_io_deq_bits_uop_fp_val),
		.io_deq_bits_uop_fp_rm(_retry_queue_io_deq_bits_uop_fp_rm),
		.io_deq_bits_uop_fp_typ(_retry_queue_io_deq_bits_uop_fp_typ),
		.io_deq_bits_uop_xcpt_pf_if(_retry_queue_io_deq_bits_uop_xcpt_pf_if),
		.io_deq_bits_uop_xcpt_ae_if(_retry_queue_io_deq_bits_uop_xcpt_ae_if),
		.io_deq_bits_uop_xcpt_ma_if(_retry_queue_io_deq_bits_uop_xcpt_ma_if),
		.io_deq_bits_uop_bp_debug_if(_retry_queue_io_deq_bits_uop_bp_debug_if),
		.io_deq_bits_uop_bp_xcpt_if(_retry_queue_io_deq_bits_uop_bp_xcpt_if),
		.io_deq_bits_uop_debug_fsrc(_retry_queue_io_deq_bits_uop_debug_fsrc),
		.io_deq_bits_uop_debug_tsrc(_retry_queue_io_deq_bits_uop_debug_tsrc),
		.io_deq_bits_data(_retry_queue_io_deq_bits_data),
		.io_brupdate_b1_resolve_mask(io_core_brupdate_b1_resolve_mask),
		.io_brupdate_b1_mispredict_mask(io_core_brupdate_b1_mispredict_mask),
		.io_flush(io_core_exception)
	);
	Queue4_STQEntry stq_execute_queue(
		.clock(clock),
		.reset((reset | _GEN_1) | _GEN_4),
		.io_enq_ready(_stq_execute_queue_io_enq_ready),
		.io_enq_valid(can_enq_store_execute),
		.io_enq_bits_uop_inst(_GEN_128[stq_execute_head[2:0] * 32+:32]),
		.io_enq_bits_uop_debug_inst(_GEN_129[stq_execute_head[2:0] * 32+:32]),
		.io_enq_bits_uop_is_rvc(_GEN_130[stq_execute_head[2:0]]),
		.io_enq_bits_uop_debug_pc(_GEN_131[stq_execute_head[2:0] * 40+:40]),
		.io_enq_bits_uop_iq_type_0(_GEN_132[stq_execute_head[2:0]]),
		.io_enq_bits_uop_iq_type_1(_GEN_133[stq_execute_head[2:0]]),
		.io_enq_bits_uop_iq_type_2(_GEN_134[stq_execute_head[2:0]]),
		.io_enq_bits_uop_iq_type_3(_GEN_135[stq_execute_head[2:0]]),
		.io_enq_bits_uop_fu_code_0(_GEN_136[stq_execute_head[2:0]]),
		.io_enq_bits_uop_fu_code_1(_GEN_137[stq_execute_head[2:0]]),
		.io_enq_bits_uop_fu_code_2(_GEN_138[stq_execute_head[2:0]]),
		.io_enq_bits_uop_fu_code_3(_GEN_139[stq_execute_head[2:0]]),
		.io_enq_bits_uop_fu_code_4(_GEN_140[stq_execute_head[2:0]]),
		.io_enq_bits_uop_fu_code_5(_GEN_141[stq_execute_head[2:0]]),
		.io_enq_bits_uop_fu_code_6(_GEN_142[stq_execute_head[2:0]]),
		.io_enq_bits_uop_fu_code_7(_GEN_143[stq_execute_head[2:0]]),
		.io_enq_bits_uop_fu_code_8(_GEN_144[stq_execute_head[2:0]]),
		.io_enq_bits_uop_fu_code_9(_GEN_145[stq_execute_head[2:0]]),
		.io_enq_bits_uop_iw_issued(_GEN_146[stq_execute_head[2:0]]),
		.io_enq_bits_uop_iw_issued_partial_agen(_GEN_147[stq_execute_head[2:0]]),
		.io_enq_bits_uop_iw_issued_partial_dgen(_GEN_148[stq_execute_head[2:0]]),
		.io_enq_bits_uop_iw_p1_speculative_child(_GEN_149[stq_execute_head[2:0]]),
		.io_enq_bits_uop_iw_p2_speculative_child(_GEN_150[stq_execute_head[2:0]]),
		.io_enq_bits_uop_iw_p1_bypass_hint(_GEN_151[stq_execute_head[2:0]]),
		.io_enq_bits_uop_iw_p2_bypass_hint(_GEN_152[stq_execute_head[2:0]]),
		.io_enq_bits_uop_iw_p3_bypass_hint(_GEN_153[stq_execute_head[2:0]]),
		.io_enq_bits_uop_br_mask(_GEN_154[stq_execute_head[2:0] * 8+:8]),
		.io_enq_bits_uop_br_tag(_GEN_155[stq_execute_head[2:0] * 3+:3]),
		.io_enq_bits_uop_br_type(_GEN_156[stq_execute_head[2:0] * 4+:4]),
		.io_enq_bits_uop_is_sfb(_GEN_157[stq_execute_head[2:0]]),
		.io_enq_bits_uop_is_fence(stq_enq_e_bits_uop_is_fence),
		.io_enq_bits_uop_is_fencei(_GEN_159[stq_execute_head[2:0]]),
		.io_enq_bits_uop_is_sfence(_GEN_160[stq_execute_head[2:0]]),
		.io_enq_bits_uop_is_amo(stq_enq_e_bits_uop_is_amo),
		.io_enq_bits_uop_is_eret(_GEN_162[stq_execute_head[2:0]]),
		.io_enq_bits_uop_is_sys_pc2epc(_GEN_163[stq_execute_head[2:0]]),
		.io_enq_bits_uop_is_rocc(_GEN_164[stq_execute_head[2:0]]),
		.io_enq_bits_uop_is_mov(_GEN_165[stq_execute_head[2:0]]),
		.io_enq_bits_uop_ftq_idx(_GEN_166[stq_execute_head[2:0] * 4+:4]),
		.io_enq_bits_uop_edge_inst(_GEN_167[stq_execute_head[2:0]]),
		.io_enq_bits_uop_pc_lob(_GEN_168[stq_execute_head[2:0] * 6+:6]),
		.io_enq_bits_uop_taken(_GEN_169[stq_execute_head[2:0]]),
		.io_enq_bits_uop_imm_rename(_GEN_170[stq_execute_head[2:0]]),
		.io_enq_bits_uop_imm_sel(_GEN_171[stq_execute_head[2:0] * 3+:3]),
		.io_enq_bits_uop_pimm(_GEN_172[stq_execute_head[2:0] * 5+:5]),
		.io_enq_bits_uop_imm_packed(_GEN_173[stq_execute_head[2:0] * 20+:20]),
		.io_enq_bits_uop_op1_sel(_GEN_174[stq_execute_head[2:0] * 2+:2]),
		.io_enq_bits_uop_op2_sel(_GEN_175[stq_execute_head[2:0] * 3+:3]),
		.io_enq_bits_uop_fp_ctrl_ldst(_GEN_176[stq_execute_head[2:0]]),
		.io_enq_bits_uop_fp_ctrl_wen(_GEN_177[stq_execute_head[2:0]]),
		.io_enq_bits_uop_fp_ctrl_ren1(_GEN_178[stq_execute_head[2:0]]),
		.io_enq_bits_uop_fp_ctrl_ren2(_GEN_179[stq_execute_head[2:0]]),
		.io_enq_bits_uop_fp_ctrl_ren3(_GEN_180[stq_execute_head[2:0]]),
		.io_enq_bits_uop_fp_ctrl_swap12(_GEN_181[stq_execute_head[2:0]]),
		.io_enq_bits_uop_fp_ctrl_swap23(_GEN_182[stq_execute_head[2:0]]),
		.io_enq_bits_uop_fp_ctrl_typeTagIn(_GEN_183[stq_execute_head[2:0] * 2+:2]),
		.io_enq_bits_uop_fp_ctrl_typeTagOut(_GEN_184[stq_execute_head[2:0] * 2+:2]),
		.io_enq_bits_uop_fp_ctrl_fromint(_GEN_185[stq_execute_head[2:0]]),
		.io_enq_bits_uop_fp_ctrl_toint(_GEN_186[stq_execute_head[2:0]]),
		.io_enq_bits_uop_fp_ctrl_fastpipe(_GEN_187[stq_execute_head[2:0]]),
		.io_enq_bits_uop_fp_ctrl_fma(_GEN_188[stq_execute_head[2:0]]),
		.io_enq_bits_uop_fp_ctrl_div(_GEN_189[stq_execute_head[2:0]]),
		.io_enq_bits_uop_fp_ctrl_sqrt(_GEN_190[stq_execute_head[2:0]]),
		.io_enq_bits_uop_fp_ctrl_wflags(_GEN_191[stq_execute_head[2:0]]),
		.io_enq_bits_uop_fp_ctrl_vec(_GEN_192[stq_execute_head[2:0]]),
		.io_enq_bits_uop_rob_idx(_GEN_193[stq_execute_head[2:0] * 5+:5]),
		.io_enq_bits_uop_ldq_idx(_GEN_194[stq_execute_head[2:0] * 4+:4]),
		.io_enq_bits_uop_stq_idx(stq_execute_head),
		.io_enq_bits_uop_rxq_idx(_GEN_196[stq_execute_head[2:0] * 2+:2]),
		.io_enq_bits_uop_pdst(_GEN_197[stq_execute_head[2:0] * 6+:6]),
		.io_enq_bits_uop_prs1(_GEN_198[stq_execute_head[2:0] * 6+:6]),
		.io_enq_bits_uop_prs2(_GEN_199[stq_execute_head[2:0] * 6+:6]),
		.io_enq_bits_uop_prs3(_GEN_200[stq_execute_head[2:0] * 6+:6]),
		.io_enq_bits_uop_ppred(_GEN_201[stq_execute_head[2:0] * 4+:4]),
		.io_enq_bits_uop_prs1_busy(_GEN_202[stq_execute_head[2:0]]),
		.io_enq_bits_uop_prs2_busy(_GEN_203[stq_execute_head[2:0]]),
		.io_enq_bits_uop_prs3_busy(_GEN_204[stq_execute_head[2:0]]),
		.io_enq_bits_uop_ppred_busy(_GEN_205[stq_execute_head[2:0]]),
		.io_enq_bits_uop_stale_pdst(_GEN_206[stq_execute_head[2:0] * 6+:6]),
		.io_enq_bits_uop_exception(stq_enq_e_bits_uop_exception),
		.io_enq_bits_uop_exc_cause(_GEN_208[stq_execute_head[2:0] * 64+:64]),
		.io_enq_bits_uop_mem_cmd(_GEN_209[stq_execute_head[2:0] * 5+:5]),
		.io_enq_bits_uop_mem_size(_GEN_210[stq_execute_head[2:0] * 2+:2]),
		.io_enq_bits_uop_mem_signed(_GEN_211[stq_execute_head[2:0]]),
		.io_enq_bits_uop_uses_ldq(_GEN_212[stq_execute_head[2:0]]),
		.io_enq_bits_uop_uses_stq(_GEN_213[stq_execute_head[2:0]]),
		.io_enq_bits_uop_is_unique(_GEN_214[stq_execute_head[2:0]]),
		.io_enq_bits_uop_flush_on_commit(_GEN_215[stq_execute_head[2:0]]),
		.io_enq_bits_uop_csr_cmd(_GEN_216[stq_execute_head[2:0] * 3+:3]),
		.io_enq_bits_uop_ldst_is_rs1(_GEN_217[stq_execute_head[2:0]]),
		.io_enq_bits_uop_ldst(_GEN_218[stq_execute_head[2:0] * 6+:6]),
		.io_enq_bits_uop_lrs1(_GEN_219[stq_execute_head[2:0] * 6+:6]),
		.io_enq_bits_uop_lrs2(_GEN_220[stq_execute_head[2:0] * 6+:6]),
		.io_enq_bits_uop_lrs3(_GEN_221[stq_execute_head[2:0] * 6+:6]),
		.io_enq_bits_uop_dst_rtype(_GEN_222[stq_execute_head[2:0] * 2+:2]),
		.io_enq_bits_uop_lrs1_rtype(_GEN_223[stq_execute_head[2:0] * 2+:2]),
		.io_enq_bits_uop_lrs2_rtype(_GEN_224[stq_execute_head[2:0] * 2+:2]),
		.io_enq_bits_uop_frs3_en(_GEN_225[stq_execute_head[2:0]]),
		.io_enq_bits_uop_fcn_dw(_GEN_226[stq_execute_head[2:0]]),
		.io_enq_bits_uop_fcn_op(_GEN_227[stq_execute_head[2:0] * 5+:5]),
		.io_enq_bits_uop_fp_val(_GEN_228[stq_execute_head[2:0]]),
		.io_enq_bits_uop_fp_rm(_GEN_229[stq_execute_head[2:0] * 3+:3]),
		.io_enq_bits_uop_fp_typ(_GEN_230[stq_execute_head[2:0] * 2+:2]),
		.io_enq_bits_uop_xcpt_pf_if(_GEN_231[stq_execute_head[2:0]]),
		.io_enq_bits_uop_xcpt_ae_if(_GEN_232[stq_execute_head[2:0]]),
		.io_enq_bits_uop_xcpt_ma_if(_GEN_233[stq_execute_head[2:0]]),
		.io_enq_bits_uop_bp_debug_if(_GEN_234[stq_execute_head[2:0]]),
		.io_enq_bits_uop_bp_xcpt_if(_GEN_235[stq_execute_head[2:0]]),
		.io_enq_bits_uop_debug_fsrc(_GEN_236[stq_execute_head[2:0] * 3+:3]),
		.io_enq_bits_uop_debug_tsrc(_GEN_237[stq_execute_head[2:0] * 3+:3]),
		.io_enq_bits_addr_valid(stq_enq_e_bits_addr_valid),
		.io_enq_bits_addr_bits(_GEN_245[stq_execute_head[2:0] * 40+:40]),
		.io_enq_bits_addr_is_virtual(stq_enq_e_bits_addr_is_virtual),
		.io_enq_bits_data_valid(stq_enq_e_bits_data_valid),
		.io_enq_bits_data_bits(_GEN_248[stq_execute_head[2:0] * 64+:64]),
		.io_enq_bits_committed(stq_enq_e_bits_committed),
		.io_enq_bits_succeeded(_GEN_250[stq_execute_head[2:0]]),
		.io_enq_bits_can_execute(_GEN_251[stq_execute_head[2:0]]),
		.io_enq_bits_cleared(_GEN_252[stq_execute_head[2:0]]),
		.io_enq_bits_next_ldq_idx(_GEN_254[stq_execute_head[2:0] * 4+:4]),
		.io_enq_bits_debug_wb_data(_GEN_253[stq_execute_head[2:0] * 64+:64]),
		.io_deq_ready(_stq_execute_queue_io_deq_ready_T),
		.io_deq_valid(_stq_execute_queue_io_deq_valid),
		.io_deq_bits_uop_inst(_stq_execute_queue_io_deq_bits_uop_inst),
		.io_deq_bits_uop_debug_inst(_stq_execute_queue_io_deq_bits_uop_debug_inst),
		.io_deq_bits_uop_is_rvc(_stq_execute_queue_io_deq_bits_uop_is_rvc),
		.io_deq_bits_uop_debug_pc(_stq_execute_queue_io_deq_bits_uop_debug_pc),
		.io_deq_bits_uop_iq_type_0(_stq_execute_queue_io_deq_bits_uop_iq_type_0),
		.io_deq_bits_uop_iq_type_1(_stq_execute_queue_io_deq_bits_uop_iq_type_1),
		.io_deq_bits_uop_iq_type_2(_stq_execute_queue_io_deq_bits_uop_iq_type_2),
		.io_deq_bits_uop_iq_type_3(_stq_execute_queue_io_deq_bits_uop_iq_type_3),
		.io_deq_bits_uop_fu_code_0(_stq_execute_queue_io_deq_bits_uop_fu_code_0),
		.io_deq_bits_uop_fu_code_1(_stq_execute_queue_io_deq_bits_uop_fu_code_1),
		.io_deq_bits_uop_fu_code_2(_stq_execute_queue_io_deq_bits_uop_fu_code_2),
		.io_deq_bits_uop_fu_code_3(_stq_execute_queue_io_deq_bits_uop_fu_code_3),
		.io_deq_bits_uop_fu_code_4(_stq_execute_queue_io_deq_bits_uop_fu_code_4),
		.io_deq_bits_uop_fu_code_5(_stq_execute_queue_io_deq_bits_uop_fu_code_5),
		.io_deq_bits_uop_fu_code_6(_stq_execute_queue_io_deq_bits_uop_fu_code_6),
		.io_deq_bits_uop_fu_code_7(_stq_execute_queue_io_deq_bits_uop_fu_code_7),
		.io_deq_bits_uop_fu_code_8(_stq_execute_queue_io_deq_bits_uop_fu_code_8),
		.io_deq_bits_uop_fu_code_9(_stq_execute_queue_io_deq_bits_uop_fu_code_9),
		.io_deq_bits_uop_iw_issued(_stq_execute_queue_io_deq_bits_uop_iw_issued),
		.io_deq_bits_uop_iw_issued_partial_agen(_stq_execute_queue_io_deq_bits_uop_iw_issued_partial_agen),
		.io_deq_bits_uop_iw_issued_partial_dgen(_stq_execute_queue_io_deq_bits_uop_iw_issued_partial_dgen),
		.io_deq_bits_uop_iw_p1_speculative_child(_stq_execute_queue_io_deq_bits_uop_iw_p1_speculative_child),
		.io_deq_bits_uop_iw_p2_speculative_child(_stq_execute_queue_io_deq_bits_uop_iw_p2_speculative_child),
		.io_deq_bits_uop_iw_p1_bypass_hint(_stq_execute_queue_io_deq_bits_uop_iw_p1_bypass_hint),
		.io_deq_bits_uop_iw_p2_bypass_hint(_stq_execute_queue_io_deq_bits_uop_iw_p2_bypass_hint),
		.io_deq_bits_uop_iw_p3_bypass_hint(_stq_execute_queue_io_deq_bits_uop_iw_p3_bypass_hint),
		.io_deq_bits_uop_dis_col_sel(_stq_execute_queue_io_deq_bits_uop_dis_col_sel),
		.io_deq_bits_uop_br_mask(_stq_execute_queue_io_deq_bits_uop_br_mask),
		.io_deq_bits_uop_br_tag(_stq_execute_queue_io_deq_bits_uop_br_tag),
		.io_deq_bits_uop_br_type(_stq_execute_queue_io_deq_bits_uop_br_type),
		.io_deq_bits_uop_is_sfb(_stq_execute_queue_io_deq_bits_uop_is_sfb),
		.io_deq_bits_uop_is_fence(_stq_execute_queue_io_deq_bits_uop_is_fence),
		.io_deq_bits_uop_is_fencei(_stq_execute_queue_io_deq_bits_uop_is_fencei),
		.io_deq_bits_uop_is_sfence(_stq_execute_queue_io_deq_bits_uop_is_sfence),
		.io_deq_bits_uop_is_amo(_stq_execute_queue_io_deq_bits_uop_is_amo),
		.io_deq_bits_uop_is_eret(_stq_execute_queue_io_deq_bits_uop_is_eret),
		.io_deq_bits_uop_is_sys_pc2epc(_stq_execute_queue_io_deq_bits_uop_is_sys_pc2epc),
		.io_deq_bits_uop_is_rocc(_stq_execute_queue_io_deq_bits_uop_is_rocc),
		.io_deq_bits_uop_is_mov(_stq_execute_queue_io_deq_bits_uop_is_mov),
		.io_deq_bits_uop_ftq_idx(_stq_execute_queue_io_deq_bits_uop_ftq_idx),
		.io_deq_bits_uop_edge_inst(_stq_execute_queue_io_deq_bits_uop_edge_inst),
		.io_deq_bits_uop_pc_lob(_stq_execute_queue_io_deq_bits_uop_pc_lob),
		.io_deq_bits_uop_taken(_stq_execute_queue_io_deq_bits_uop_taken),
		.io_deq_bits_uop_imm_rename(_stq_execute_queue_io_deq_bits_uop_imm_rename),
		.io_deq_bits_uop_imm_sel(_stq_execute_queue_io_deq_bits_uop_imm_sel),
		.io_deq_bits_uop_pimm(_stq_execute_queue_io_deq_bits_uop_pimm),
		.io_deq_bits_uop_imm_packed(_stq_execute_queue_io_deq_bits_uop_imm_packed),
		.io_deq_bits_uop_op1_sel(_stq_execute_queue_io_deq_bits_uop_op1_sel),
		.io_deq_bits_uop_op2_sel(_stq_execute_queue_io_deq_bits_uop_op2_sel),
		.io_deq_bits_uop_fp_ctrl_ldst(_stq_execute_queue_io_deq_bits_uop_fp_ctrl_ldst),
		.io_deq_bits_uop_fp_ctrl_wen(_stq_execute_queue_io_deq_bits_uop_fp_ctrl_wen),
		.io_deq_bits_uop_fp_ctrl_ren1(_stq_execute_queue_io_deq_bits_uop_fp_ctrl_ren1),
		.io_deq_bits_uop_fp_ctrl_ren2(_stq_execute_queue_io_deq_bits_uop_fp_ctrl_ren2),
		.io_deq_bits_uop_fp_ctrl_ren3(_stq_execute_queue_io_deq_bits_uop_fp_ctrl_ren3),
		.io_deq_bits_uop_fp_ctrl_swap12(_stq_execute_queue_io_deq_bits_uop_fp_ctrl_swap12),
		.io_deq_bits_uop_fp_ctrl_swap23(_stq_execute_queue_io_deq_bits_uop_fp_ctrl_swap23),
		.io_deq_bits_uop_fp_ctrl_typeTagIn(_stq_execute_queue_io_deq_bits_uop_fp_ctrl_typeTagIn),
		.io_deq_bits_uop_fp_ctrl_typeTagOut(_stq_execute_queue_io_deq_bits_uop_fp_ctrl_typeTagOut),
		.io_deq_bits_uop_fp_ctrl_fromint(_stq_execute_queue_io_deq_bits_uop_fp_ctrl_fromint),
		.io_deq_bits_uop_fp_ctrl_toint(_stq_execute_queue_io_deq_bits_uop_fp_ctrl_toint),
		.io_deq_bits_uop_fp_ctrl_fastpipe(_stq_execute_queue_io_deq_bits_uop_fp_ctrl_fastpipe),
		.io_deq_bits_uop_fp_ctrl_fma(_stq_execute_queue_io_deq_bits_uop_fp_ctrl_fma),
		.io_deq_bits_uop_fp_ctrl_div(_stq_execute_queue_io_deq_bits_uop_fp_ctrl_div),
		.io_deq_bits_uop_fp_ctrl_sqrt(_stq_execute_queue_io_deq_bits_uop_fp_ctrl_sqrt),
		.io_deq_bits_uop_fp_ctrl_wflags(_stq_execute_queue_io_deq_bits_uop_fp_ctrl_wflags),
		.io_deq_bits_uop_fp_ctrl_vec(_stq_execute_queue_io_deq_bits_uop_fp_ctrl_vec),
		.io_deq_bits_uop_rob_idx(_stq_execute_queue_io_deq_bits_uop_rob_idx),
		.io_deq_bits_uop_ldq_idx(_stq_execute_queue_io_deq_bits_uop_ldq_idx),
		.io_deq_bits_uop_stq_idx(_stq_execute_queue_io_deq_bits_uop_stq_idx),
		.io_deq_bits_uop_rxq_idx(_stq_execute_queue_io_deq_bits_uop_rxq_idx),
		.io_deq_bits_uop_pdst(_stq_execute_queue_io_deq_bits_uop_pdst),
		.io_deq_bits_uop_prs1(_stq_execute_queue_io_deq_bits_uop_prs1),
		.io_deq_bits_uop_prs2(_stq_execute_queue_io_deq_bits_uop_prs2),
		.io_deq_bits_uop_prs3(_stq_execute_queue_io_deq_bits_uop_prs3),
		.io_deq_bits_uop_ppred(_stq_execute_queue_io_deq_bits_uop_ppred),
		.io_deq_bits_uop_prs1_busy(_stq_execute_queue_io_deq_bits_uop_prs1_busy),
		.io_deq_bits_uop_prs2_busy(_stq_execute_queue_io_deq_bits_uop_prs2_busy),
		.io_deq_bits_uop_prs3_busy(_stq_execute_queue_io_deq_bits_uop_prs3_busy),
		.io_deq_bits_uop_ppred_busy(_stq_execute_queue_io_deq_bits_uop_ppred_busy),
		.io_deq_bits_uop_stale_pdst(_stq_execute_queue_io_deq_bits_uop_stale_pdst),
		.io_deq_bits_uop_exception(_stq_execute_queue_io_deq_bits_uop_exception),
		.io_deq_bits_uop_exc_cause(_stq_execute_queue_io_deq_bits_uop_exc_cause),
		.io_deq_bits_uop_mem_cmd(_stq_execute_queue_io_deq_bits_uop_mem_cmd),
		.io_deq_bits_uop_mem_size(_stq_execute_queue_io_deq_bits_uop_mem_size),
		.io_deq_bits_uop_mem_signed(_stq_execute_queue_io_deq_bits_uop_mem_signed),
		.io_deq_bits_uop_uses_ldq(_stq_execute_queue_io_deq_bits_uop_uses_ldq),
		.io_deq_bits_uop_uses_stq(_stq_execute_queue_io_deq_bits_uop_uses_stq),
		.io_deq_bits_uop_is_unique(_stq_execute_queue_io_deq_bits_uop_is_unique),
		.io_deq_bits_uop_flush_on_commit(_stq_execute_queue_io_deq_bits_uop_flush_on_commit),
		.io_deq_bits_uop_csr_cmd(_stq_execute_queue_io_deq_bits_uop_csr_cmd),
		.io_deq_bits_uop_ldst_is_rs1(_stq_execute_queue_io_deq_bits_uop_ldst_is_rs1),
		.io_deq_bits_uop_ldst(_stq_execute_queue_io_deq_bits_uop_ldst),
		.io_deq_bits_uop_lrs1(_stq_execute_queue_io_deq_bits_uop_lrs1),
		.io_deq_bits_uop_lrs2(_stq_execute_queue_io_deq_bits_uop_lrs2),
		.io_deq_bits_uop_lrs3(_stq_execute_queue_io_deq_bits_uop_lrs3),
		.io_deq_bits_uop_dst_rtype(_stq_execute_queue_io_deq_bits_uop_dst_rtype),
		.io_deq_bits_uop_lrs1_rtype(_stq_execute_queue_io_deq_bits_uop_lrs1_rtype),
		.io_deq_bits_uop_lrs2_rtype(_stq_execute_queue_io_deq_bits_uop_lrs2_rtype),
		.io_deq_bits_uop_frs3_en(_stq_execute_queue_io_deq_bits_uop_frs3_en),
		.io_deq_bits_uop_fcn_dw(_stq_execute_queue_io_deq_bits_uop_fcn_dw),
		.io_deq_bits_uop_fcn_op(_stq_execute_queue_io_deq_bits_uop_fcn_op),
		.io_deq_bits_uop_fp_val(_stq_execute_queue_io_deq_bits_uop_fp_val),
		.io_deq_bits_uop_fp_rm(_stq_execute_queue_io_deq_bits_uop_fp_rm),
		.io_deq_bits_uop_fp_typ(_stq_execute_queue_io_deq_bits_uop_fp_typ),
		.io_deq_bits_uop_xcpt_pf_if(_stq_execute_queue_io_deq_bits_uop_xcpt_pf_if),
		.io_deq_bits_uop_xcpt_ae_if(_stq_execute_queue_io_deq_bits_uop_xcpt_ae_if),
		.io_deq_bits_uop_xcpt_ma_if(_stq_execute_queue_io_deq_bits_uop_xcpt_ma_if),
		.io_deq_bits_uop_bp_debug_if(_stq_execute_queue_io_deq_bits_uop_bp_debug_if),
		.io_deq_bits_uop_bp_xcpt_if(_stq_execute_queue_io_deq_bits_uop_bp_xcpt_if),
		.io_deq_bits_uop_debug_fsrc(_stq_execute_queue_io_deq_bits_uop_debug_fsrc),
		.io_deq_bits_uop_debug_tsrc(_stq_execute_queue_io_deq_bits_uop_debug_tsrc),
		.io_deq_bits_addr_bits(_stq_execute_queue_io_deq_bits_addr_bits),
		.io_deq_bits_data_bits(_stq_execute_queue_io_deq_bits_data_bits)
	);
	Arbiter2_Wakeup wakeupArbs_0(
		.io_in_0_valid((slow_wakeups_0_REG_valid ? ~w2_valid & slow_wakeups_0_REG_valid : w2_valid)),
		.io_in_0_bits_uop_pdst((slow_wakeups_0_REG_valid ? slow_wakeups_0_REG_bits_uop_pdst : w2_bits_uop_pdst)),
		.io_in_0_bits_uop_dst_rtype((slow_wakeups_0_REG_valid ? slow_wakeups_0_REG_bits_uop_dst_rtype : w2_bits_uop_dst_rtype)),
		.io_in_0_bits_bypassable(~slow_wakeups_0_REG_valid),
		.io_in_0_bits_rebusy(~slow_wakeups_0_REG_valid),
		.io_in_1_ready(_wakeupArbs_0_io_in_1_ready),
		.io_in_1_valid(_wakeupArbs_0_io_in_1_valid_T_4),
		.io_in_1_bits_uop_pdst(mem_incoming_uop_0_pdst),
		.io_in_1_bits_uop_dst_rtype(mem_incoming_uop_0_dst_rtype),
		.io_out_valid(io_core_iwakeups_0_valid),
		.io_out_bits_uop_pdst(io_core_iwakeups_0_bits_uop_pdst),
		.io_out_bits_uop_dst_rtype(io_core_iwakeups_0_bits_uop_dst_rtype),
		.io_out_bits_bypassable(io_core_iwakeups_0_bits_bypassable),
		.io_out_bits_rebusy(io_core_iwakeups_0_bits_rebusy)
	);
	ForwardingAgeLogic logic_0(
		.clock(clock),
		.io_matches(ldst_addr_matches_0),
		.io_youngest(lcam_uop_0_stq_idx),
		.io_found(_logic_io_found),
		.io_found_idx(_logic_io_found_idx)
	);
	ForwardingAgeLogic logic_1(
		.clock(clock),
		.io_matches(({(addr_matches_0_7 & stq_data_7_valid) & (mask_union_7 == lcam_mask_0), (addr_matches_0_6 & stq_data_6_valid) & (mask_union_6 == lcam_mask_0), (addr_matches_0_5 & stq_data_5_valid) & (mask_union_5 == lcam_mask_0), (addr_matches_0_4 & stq_data_4_valid) & (mask_union_4 == lcam_mask_0), (addr_matches_0_3 & stq_data_3_valid) & (mask_union_3 == lcam_mask_0), (addr_matches_0_2 & stq_data_2_valid) & (mask_union_2 == lcam_mask_0), (addr_matches_0_1 & stq_data_1_valid) & (mask_union_1 == lcam_mask_0), (addr_matches_0_0 & stq_data_0_valid) & (mask_union == lcam_mask_0)} & {age_matches_0_7, age_matches_0_6, age_matches_0_5, age_matches_0_4, age_matches_0_3, age_matches_0_2, age_matches_0_1, age_matches_0_0}) & fast_stq_valids),
		.io_youngest(lcam_uop_0_stq_idx),
		.io_found(_logic_1_io_found),
		.io_found_idx(_logic_1_io_found_idx)
	);
	assign io_ptw_req_valid = _dtlb_io_ptw_req_valid;
	assign io_core_iresp_0_valid = io_core_iresp_0_REG_valid;
	assign io_core_iresp_0_bits_uop_br_mask = io_core_iresp_0_REG_bits_uop_br_mask;
	assign io_core_iresp_0_bits_uop_rob_idx = io_core_iresp_0_REG_bits_uop_rob_idx;
	assign io_core_iresp_0_bits_uop_pdst = io_core_iresp_0_REG_bits_uop_pdst;
	assign io_core_iresp_0_bits_data = io_core_iresp_0_REG_bits_data;
	assign io_core_fresp_0_valid = fresp_0_valid;
	assign io_core_fresp_0_bits_uop_br_mask = (_GEN_385 ? _GEN_42[resp_uop_ldq_idx * 8+:8] : wb_ldst_forward_e_REG_uop_br_mask);
	assign io_core_fresp_0_bits_uop_rob_idx = (_GEN_385 ? _GEN_81[resp_uop_ldq_idx * 5+:5] : wb_ldst_forward_e_REG_uop_rob_idx);
	assign io_core_fresp_0_bits_uop_pdst = (_GEN_385 ? _GEN_85[resp_uop_ldq_idx * 6+:6] : wb_ldst_forward_e_REG_uop_pdst);
	assign io_core_fresp_0_bits_uop_mem_size = (_GEN_385 ? _GEN_98[resp_uop_ldq_idx * 2+:2] : wb_ldst_forward_e_REG_uop_mem_size);
	assign io_core_fresp_0_bits_uop_dst_rtype = (_GEN_385 ? _GEN_110[resp_uop_ldq_idx * 2+:2] : wb_ldst_forward_e_REG_uop_dst_rtype);
	assign io_core_fresp_0_bits_data = (_GEN_385 ? resp_data : {(_ldq_debug_wb_data_T_17 ? {56 {wb_ldst_forward_e_REG_uop_mem_signed & fresp_0_bits_data_zeroed_2[7]}} : {(_ldq_debug_wb_data_T_9 ? {48 {wb_ldst_forward_e_REG_uop_mem_signed & fresp_0_bits_data_zeroed_1[15]}} : {(_ldq_debug_wb_data_T_1 ? {32 {wb_ldst_forward_e_REG_uop_mem_signed & fresp_0_bits_data_zeroed[31]}} : _GEN_384[63:32]), fresp_0_bits_data_zeroed[31:16]}), fresp_0_bits_data_zeroed_1[15:8]}), fresp_0_bits_data_zeroed_2});
	assign io_core_dis_ldq_idx_0 = ldq_tail;
	assign io_core_dis_stq_idx_0 = stq_tail;
	assign io_core_ldq_full_0 = |((8'h01 << ldq_tail[2:0]) & ({ldq_valid_7, ldq_valid_6, ldq_valid_5, ldq_valid_4, ldq_valid_3, ldq_valid_2, ldq_valid_1, ldq_valid_0} | {dis_ldq_oh_7, dis_ldq_oh_6, dis_ldq_oh_5, dis_ldq_oh_4, dis_ldq_oh_3, dis_ldq_oh_2, dis_ldq_oh_1, dis_ldq_oh_0}));
	assign io_core_stq_full_0 = |((8'h01 << stq_tail[2:0]) & stq_valids);
	assign io_core_clr_bsy_0_valid = clr_valid_1 & ~(|(io_core_brupdate_b1_mispredict_mask & clr_uop_1_br_mask) | io_core_exception);
	assign io_core_clr_bsy_0_bits = clr_uop_1_rob_idx;
	assign io_core_clr_unsafe_0_valid = (io_core_clr_unsafe_0_valid_REG | (~io_dmem_nack_0_valid & io_core_clr_unsafe_0_valid_REG_2)) & ~io_core_clr_unsafe_0_valid_REG_3;
	assign io_core_clr_unsafe_0_bits = io_core_clr_unsafe_0_bits_REG;
	assign io_core_fencei_rdy = ~(((((((stq_valid_0 | stq_valid_1) | stq_valid_2) | stq_valid_3) | stq_valid_4) | stq_valid_5) | stq_valid_6) | stq_valid_7) & io_dmem_ordered;
	assign io_core_lxcpt_valid = r_xcpt_valid & ~(|(io_core_brupdate_b1_mispredict_mask & r_xcpt_uop_br_mask) | io_core_exception);
	assign io_core_lxcpt_bits_uop_br_mask = r_xcpt_uop_br_mask;
	assign io_core_lxcpt_bits_uop_rob_idx = r_xcpt_uop_rob_idx;
	assign io_core_lxcpt_bits_cause = r_xcpt_cause;
	assign io_core_lxcpt_bits_badvaddr = r_xcpt_badvaddr;
	assign io_core_perf_acquire = io_dmem_perf_acquire;
	assign io_core_perf_release = io_dmem_perf_release;
	assign io_core_perf_tlbMiss = io_ptw_req_ready & _dtlb_io_ptw_req_valid;
	assign io_dmem_req_valid = dmem_req_0_valid;
	assign io_dmem_req_bits_0_valid = dmem_req_0_valid;
	assign io_dmem_req_bits_0_bits_uop_inst = (_GEN_284 ? (_exe_cmd_T ? _GEN_16[io_core_agen_0_bits_uop_ldq_idx[2:0] * 32+:32] : (will_fire_store_agen_0_will_fire ? _GEN_128[io_core_agen_0_bits_uop_stq_idx[2:0] * 32+:32] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_inst : 32'h00000000))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_inst : (will_fire_load_wakeup_0_will_fire ? _GEN_16[ldq_wakeup_idx[2:0] * 32+:32] : 32'h00000000)));
	assign io_dmem_req_bits_0_bits_uop_debug_inst = (_GEN_284 ? (_exe_cmd_T ? _GEN_17[io_core_agen_0_bits_uop_ldq_idx[2:0] * 32+:32] : (will_fire_store_agen_0_will_fire ? _GEN_129[io_core_agen_0_bits_uop_stq_idx[2:0] * 32+:32] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_debug_inst : 32'h00000000))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_debug_inst : (will_fire_load_wakeup_0_will_fire ? _GEN_17[ldq_wakeup_idx[2:0] * 32+:32] : 32'h00000000)));
	assign io_dmem_req_bits_0_bits_uop_is_rvc = (_GEN_284 ? (_exe_cmd_T ? _GEN_18[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_130[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_is_rvc)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_is_rvc : will_fire_load_wakeup_0_will_fire & _GEN_18[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_debug_pc = (_GEN_284 ? (_exe_cmd_T ? _GEN_19[io_core_agen_0_bits_uop_ldq_idx[2:0] * 40+:40] : (will_fire_store_agen_0_will_fire ? _GEN_131[io_core_agen_0_bits_uop_stq_idx[2:0] * 40+:40] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_debug_pc : 40'h0000000000))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_debug_pc : (will_fire_load_wakeup_0_will_fire ? _GEN_19[ldq_wakeup_idx[2:0] * 40+:40] : 40'h0000000000)));
	assign io_dmem_req_bits_0_bits_uop_iq_type_0 = (_GEN_284 ? (_exe_cmd_T ? _GEN_20[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_132[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_iq_type_0)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_iq_type_0 : will_fire_load_wakeup_0_will_fire & _GEN_20[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_iq_type_1 = (_GEN_284 ? (_exe_cmd_T ? _GEN_21[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_133[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_iq_type_1)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_iq_type_1 : will_fire_load_wakeup_0_will_fire & _GEN_21[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_iq_type_2 = (_GEN_284 ? (_exe_cmd_T ? _GEN_22[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_134[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_iq_type_2)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_iq_type_2 : will_fire_load_wakeup_0_will_fire & _GEN_22[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_iq_type_3 = (_GEN_284 ? (_exe_cmd_T ? _GEN_23[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_135[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_iq_type_3)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_iq_type_3 : will_fire_load_wakeup_0_will_fire & _GEN_23[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_fu_code_0 = (_GEN_284 ? (_exe_cmd_T ? _GEN_24[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_136[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_fu_code_0)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_fu_code_0 : will_fire_load_wakeup_0_will_fire & _GEN_24[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_fu_code_1 = (_GEN_284 ? (_exe_cmd_T ? _GEN_25[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_137[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_fu_code_1)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_fu_code_1 : will_fire_load_wakeup_0_will_fire & _GEN_25[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_fu_code_2 = (_GEN_284 ? (_exe_cmd_T ? _GEN_26[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_138[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_fu_code_2)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_fu_code_2 : will_fire_load_wakeup_0_will_fire & _GEN_26[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_fu_code_3 = (_GEN_284 ? (_exe_cmd_T ? _GEN_27[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_139[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_fu_code_3)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_fu_code_3 : will_fire_load_wakeup_0_will_fire & _GEN_27[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_fu_code_4 = (_GEN_284 ? (_exe_cmd_T ? _GEN_28[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_140[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_fu_code_4)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_fu_code_4 : will_fire_load_wakeup_0_will_fire & _GEN_28[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_fu_code_5 = (_GEN_284 ? (_exe_cmd_T ? _GEN_29[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_141[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_fu_code_5)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_fu_code_5 : will_fire_load_wakeup_0_will_fire & _GEN_29[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_fu_code_6 = (_GEN_284 ? (_exe_cmd_T ? _GEN_30[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_142[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_fu_code_6)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_fu_code_6 : will_fire_load_wakeup_0_will_fire & _GEN_30[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_fu_code_7 = (_GEN_284 ? (_exe_cmd_T ? _GEN_31[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_143[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_fu_code_7)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_fu_code_7 : will_fire_load_wakeup_0_will_fire & _GEN_31[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_fu_code_8 = (_GEN_284 ? (_exe_cmd_T ? _GEN_32[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_144[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_fu_code_8)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_fu_code_8 : will_fire_load_wakeup_0_will_fire & _GEN_32[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_fu_code_9 = (_GEN_284 ? (_exe_cmd_T ? _GEN_33[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_145[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_fu_code_9)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_fu_code_9 : will_fire_load_wakeup_0_will_fire & _GEN_33[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_iw_issued = (_GEN_284 ? (_exe_cmd_T ? _GEN_34[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_146[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_iw_issued)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_iw_issued : will_fire_load_wakeup_0_will_fire & _GEN_34[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_iw_issued_partial_agen = (_GEN_284 ? (_exe_cmd_T ? _GEN_35[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_147[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_iw_issued_partial_agen)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_iw_issued_partial_agen : will_fire_load_wakeup_0_will_fire & _GEN_35[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_iw_issued_partial_dgen = (_GEN_284 ? (_exe_cmd_T ? _GEN_36[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_148[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_iw_issued_partial_dgen)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_iw_issued_partial_dgen : will_fire_load_wakeup_0_will_fire & _GEN_36[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_iw_p1_speculative_child = (_GEN_284 ? (_exe_cmd_T ? _GEN_37[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_149[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_iw_p1_speculative_child)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_iw_p1_speculative_child : will_fire_load_wakeup_0_will_fire & _GEN_37[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_iw_p2_speculative_child = (_GEN_284 ? (_exe_cmd_T ? _GEN_38[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_150[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_iw_p2_speculative_child)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_iw_p2_speculative_child : will_fire_load_wakeup_0_will_fire & _GEN_38[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_iw_p1_bypass_hint = (_GEN_284 ? (_exe_cmd_T ? _GEN_39[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_151[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_iw_p1_bypass_hint)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_iw_p1_bypass_hint : will_fire_load_wakeup_0_will_fire & _GEN_39[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_iw_p2_bypass_hint = (_GEN_284 ? (_exe_cmd_T ? _GEN_40[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_152[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_iw_p2_bypass_hint)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_iw_p2_bypass_hint : will_fire_load_wakeup_0_will_fire & _GEN_40[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_iw_p3_bypass_hint = (_GEN_284 ? (_exe_cmd_T ? _GEN_41[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_153[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_iw_p3_bypass_hint)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_iw_p3_bypass_hint : will_fire_load_wakeup_0_will_fire & _GEN_41[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_dis_col_sel = (_GEN_284 ? (~_GEN_257 & _exe_tlb_vaddr_T_2) & _retry_queue_io_deq_bits_uop_dis_col_sel : _GEN_282 & _stq_execute_queue_io_deq_bits_uop_dis_col_sel);
	assign io_dmem_req_bits_0_bits_uop_br_mask = (_GEN_284 ? exe_tlb_uop_0_br_mask : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_br_mask : (will_fire_load_wakeup_0_will_fire ? ldq_wakeup_e_bits_uop_br_mask : 8'h00)));
	assign io_dmem_req_bits_0_bits_uop_br_tag = (_GEN_284 ? (_exe_cmd_T ? _GEN_43[io_core_agen_0_bits_uop_ldq_idx[2:0] * 3+:3] : (will_fire_store_agen_0_will_fire ? _GEN_155[io_core_agen_0_bits_uop_stq_idx[2:0] * 3+:3] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_br_tag : 3'h0))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_br_tag : (will_fire_load_wakeup_0_will_fire ? _GEN_43[ldq_wakeup_idx[2:0] * 3+:3] : 3'h0)));
	assign io_dmem_req_bits_0_bits_uop_br_type = (_GEN_284 ? (_exe_cmd_T ? _GEN_44[io_core_agen_0_bits_uop_ldq_idx[2:0] * 4+:4] : (will_fire_store_agen_0_will_fire ? _GEN_156[io_core_agen_0_bits_uop_stq_idx[2:0] * 4+:4] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_br_type : 4'h0))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_br_type : (will_fire_load_wakeup_0_will_fire ? _GEN_44[ldq_wakeup_idx[2:0] * 4+:4] : 4'h0)));
	assign io_dmem_req_bits_0_bits_uop_is_sfb = (_GEN_284 ? (_exe_cmd_T ? _GEN_45[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_157[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_is_sfb)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_is_sfb : will_fire_load_wakeup_0_will_fire & _GEN_45[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_is_fence = (_GEN_284 ? exe_tlb_uop_0_is_fence : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_is_fence : will_fire_load_wakeup_0_will_fire & _GEN_46[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_is_fencei = (_GEN_284 ? (_exe_cmd_T ? _GEN_47[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_159[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_is_fencei)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_is_fencei : will_fire_load_wakeup_0_will_fire & _GEN_47[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_is_sfence = (_GEN_284 ? (_exe_cmd_T ? _GEN_48[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_160[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_is_sfence)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_is_sfence : will_fire_load_wakeup_0_will_fire & _GEN_48[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_is_amo = (_GEN_284 ? (_exe_cmd_T ? _GEN_49[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_161[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_is_amo)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_is_amo : will_fire_load_wakeup_0_will_fire & _GEN_49[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_is_eret = (_GEN_284 ? (_exe_cmd_T ? _GEN_50[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_162[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_is_eret)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_is_eret : will_fire_load_wakeup_0_will_fire & _GEN_50[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_is_sys_pc2epc = (_GEN_284 ? (_exe_cmd_T ? _GEN_51[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_163[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_is_sys_pc2epc)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_is_sys_pc2epc : will_fire_load_wakeup_0_will_fire & _GEN_51[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_is_rocc = (_GEN_284 ? (_exe_cmd_T ? _GEN_52[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_164[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_is_rocc)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_is_rocc : will_fire_load_wakeup_0_will_fire & _GEN_52[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_is_mov = (_GEN_284 ? (_exe_cmd_T ? _GEN_53[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_165[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_is_mov)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_is_mov : will_fire_load_wakeup_0_will_fire & _GEN_53[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_ftq_idx = (_GEN_284 ? (_exe_cmd_T ? _GEN_54[io_core_agen_0_bits_uop_ldq_idx[2:0] * 4+:4] : (will_fire_store_agen_0_will_fire ? _GEN_166[io_core_agen_0_bits_uop_stq_idx[2:0] * 4+:4] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_ftq_idx : 4'h0))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_ftq_idx : (will_fire_load_wakeup_0_will_fire ? _GEN_54[ldq_wakeup_idx[2:0] * 4+:4] : 4'h0)));
	assign io_dmem_req_bits_0_bits_uop_edge_inst = (_GEN_284 ? (_exe_cmd_T ? _GEN_55[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_167[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_edge_inst)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_edge_inst : will_fire_load_wakeup_0_will_fire & _GEN_55[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_pc_lob = (_GEN_284 ? (_exe_cmd_T ? _GEN_56[io_core_agen_0_bits_uop_ldq_idx[2:0] * 6+:6] : (will_fire_store_agen_0_will_fire ? _GEN_168[io_core_agen_0_bits_uop_stq_idx[2:0] * 6+:6] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_pc_lob : 6'h00))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_pc_lob : (will_fire_load_wakeup_0_will_fire ? _GEN_56[ldq_wakeup_idx[2:0] * 6+:6] : 6'h00)));
	assign io_dmem_req_bits_0_bits_uop_taken = (_GEN_284 ? (_exe_cmd_T ? _GEN_57[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_169[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_taken)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_taken : will_fire_load_wakeup_0_will_fire & _GEN_57[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_imm_rename = (_GEN_284 ? (_exe_cmd_T ? _GEN_58[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_170[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_imm_rename)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_imm_rename : will_fire_load_wakeup_0_will_fire & _GEN_58[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_imm_sel = (_GEN_284 ? (_exe_cmd_T ? _GEN_59[io_core_agen_0_bits_uop_ldq_idx[2:0] * 3+:3] : (will_fire_store_agen_0_will_fire ? _GEN_171[io_core_agen_0_bits_uop_stq_idx[2:0] * 3+:3] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_imm_sel : 3'h0))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_imm_sel : (will_fire_load_wakeup_0_will_fire ? _GEN_59[ldq_wakeup_idx[2:0] * 3+:3] : 3'h0)));
	assign io_dmem_req_bits_0_bits_uop_pimm = (_GEN_284 ? (_exe_cmd_T ? _GEN_60[io_core_agen_0_bits_uop_ldq_idx[2:0] * 5+:5] : (will_fire_store_agen_0_will_fire ? _GEN_172[io_core_agen_0_bits_uop_stq_idx[2:0] * 5+:5] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_pimm : 5'h00))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_pimm : (will_fire_load_wakeup_0_will_fire ? _GEN_60[ldq_wakeup_idx[2:0] * 5+:5] : 5'h00)));
	assign io_dmem_req_bits_0_bits_uop_imm_packed = (_GEN_284 ? (_exe_cmd_T ? _GEN_61[io_core_agen_0_bits_uop_ldq_idx[2:0] * 20+:20] : (will_fire_store_agen_0_will_fire ? _GEN_173[io_core_agen_0_bits_uop_stq_idx[2:0] * 20+:20] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_imm_packed : 20'h00000))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_imm_packed : (will_fire_load_wakeup_0_will_fire ? _GEN_61[ldq_wakeup_idx[2:0] * 20+:20] : 20'h00000)));
	assign io_dmem_req_bits_0_bits_uop_op1_sel = (_GEN_284 ? (_exe_cmd_T ? _GEN_62[io_core_agen_0_bits_uop_ldq_idx[2:0] * 2+:2] : (will_fire_store_agen_0_will_fire ? _GEN_174[io_core_agen_0_bits_uop_stq_idx[2:0] * 2+:2] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_op1_sel : 2'h0))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_op1_sel : (will_fire_load_wakeup_0_will_fire ? _GEN_62[ldq_wakeup_idx[2:0] * 2+:2] : 2'h0)));
	assign io_dmem_req_bits_0_bits_uop_op2_sel = (_GEN_284 ? (_exe_cmd_T ? _GEN_63[io_core_agen_0_bits_uop_ldq_idx[2:0] * 3+:3] : (will_fire_store_agen_0_will_fire ? _GEN_175[io_core_agen_0_bits_uop_stq_idx[2:0] * 3+:3] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_op2_sel : 3'h0))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_op2_sel : (will_fire_load_wakeup_0_will_fire ? _GEN_63[ldq_wakeup_idx[2:0] * 3+:3] : 3'h0)));
	assign io_dmem_req_bits_0_bits_uop_fp_ctrl_ldst = (_GEN_284 ? (_exe_cmd_T ? _GEN_64[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_176[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_fp_ctrl_ldst)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_fp_ctrl_ldst : will_fire_load_wakeup_0_will_fire & _GEN_64[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_fp_ctrl_wen = (_GEN_284 ? (_exe_cmd_T ? _GEN_65[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_177[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_fp_ctrl_wen)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_fp_ctrl_wen : will_fire_load_wakeup_0_will_fire & _GEN_65[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_fp_ctrl_ren1 = (_GEN_284 ? (_exe_cmd_T ? _GEN_66[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_178[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_fp_ctrl_ren1)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_fp_ctrl_ren1 : will_fire_load_wakeup_0_will_fire & _GEN_66[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_fp_ctrl_ren2 = (_GEN_284 ? (_exe_cmd_T ? _GEN_67[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_179[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_fp_ctrl_ren2)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_fp_ctrl_ren2 : will_fire_load_wakeup_0_will_fire & _GEN_67[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_fp_ctrl_ren3 = (_GEN_284 ? (_exe_cmd_T ? _GEN_68[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_180[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_fp_ctrl_ren3)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_fp_ctrl_ren3 : will_fire_load_wakeup_0_will_fire & _GEN_68[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_fp_ctrl_swap12 = (_GEN_284 ? (_exe_cmd_T ? _GEN_69[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_181[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_fp_ctrl_swap12)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_fp_ctrl_swap12 : will_fire_load_wakeup_0_will_fire & _GEN_69[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_fp_ctrl_swap23 = (_GEN_284 ? (_exe_cmd_T ? _GEN_70[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_182[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_fp_ctrl_swap23)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_fp_ctrl_swap23 : will_fire_load_wakeup_0_will_fire & _GEN_70[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_fp_ctrl_typeTagIn = (_GEN_284 ? (_exe_cmd_T ? _GEN_71[io_core_agen_0_bits_uop_ldq_idx[2:0] * 2+:2] : (will_fire_store_agen_0_will_fire ? _GEN_183[io_core_agen_0_bits_uop_stq_idx[2:0] * 2+:2] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_fp_ctrl_typeTagIn : 2'h0))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_fp_ctrl_typeTagIn : (will_fire_load_wakeup_0_will_fire ? _GEN_71[ldq_wakeup_idx[2:0] * 2+:2] : 2'h0)));
	assign io_dmem_req_bits_0_bits_uop_fp_ctrl_typeTagOut = (_GEN_284 ? (_exe_cmd_T ? _GEN_72[io_core_agen_0_bits_uop_ldq_idx[2:0] * 2+:2] : (will_fire_store_agen_0_will_fire ? _GEN_184[io_core_agen_0_bits_uop_stq_idx[2:0] * 2+:2] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_fp_ctrl_typeTagOut : 2'h0))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_fp_ctrl_typeTagOut : (will_fire_load_wakeup_0_will_fire ? _GEN_72[ldq_wakeup_idx[2:0] * 2+:2] : 2'h0)));
	assign io_dmem_req_bits_0_bits_uop_fp_ctrl_fromint = (_GEN_284 ? (_exe_cmd_T ? _GEN_73[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_185[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_fp_ctrl_fromint)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_fp_ctrl_fromint : will_fire_load_wakeup_0_will_fire & _GEN_73[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_fp_ctrl_toint = (_GEN_284 ? (_exe_cmd_T ? _GEN_74[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_186[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_fp_ctrl_toint)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_fp_ctrl_toint : will_fire_load_wakeup_0_will_fire & _GEN_74[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_fp_ctrl_fastpipe = (_GEN_284 ? (_exe_cmd_T ? _GEN_75[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_187[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_fp_ctrl_fastpipe)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_fp_ctrl_fastpipe : will_fire_load_wakeup_0_will_fire & _GEN_75[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_fp_ctrl_fma = (_GEN_284 ? (_exe_cmd_T ? _GEN_76[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_188[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_fp_ctrl_fma)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_fp_ctrl_fma : will_fire_load_wakeup_0_will_fire & _GEN_76[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_fp_ctrl_div = (_GEN_284 ? (_exe_cmd_T ? _GEN_77[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_189[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_fp_ctrl_div)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_fp_ctrl_div : will_fire_load_wakeup_0_will_fire & _GEN_77[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_fp_ctrl_sqrt = (_GEN_284 ? (_exe_cmd_T ? _GEN_78[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_190[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_fp_ctrl_sqrt)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_fp_ctrl_sqrt : will_fire_load_wakeup_0_will_fire & _GEN_78[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_fp_ctrl_wflags = (_GEN_284 ? (_exe_cmd_T ? _GEN_79[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_191[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_fp_ctrl_wflags)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_fp_ctrl_wflags : will_fire_load_wakeup_0_will_fire & _GEN_79[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_fp_ctrl_vec = (_GEN_284 ? (_exe_cmd_T ? _GEN_80[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_192[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_fp_ctrl_vec)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_fp_ctrl_vec : will_fire_load_wakeup_0_will_fire & _GEN_80[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_rob_idx = (_GEN_284 ? exe_tlb_uop_0_rob_idx : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_rob_idx : (will_fire_load_wakeup_0_will_fire ? ldq_wakeup_e_bits_uop_rob_idx : 5'h00)));
	assign io_dmem_req_bits_0_bits_uop_ldq_idx = (_GEN_284 ? exe_tlb_uop_0_ldq_idx : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_ldq_idx : (will_fire_load_wakeup_0_will_fire ? _GEN_82[ldq_wakeup_idx[2:0] * 4+:4] : 4'h0)));
	assign io_dmem_req_bits_0_bits_uop_stq_idx = (_GEN_284 ? exe_tlb_uop_0_stq_idx : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_stq_idx : (will_fire_load_wakeup_0_will_fire ? ldq_wakeup_e_bits_uop_stq_idx : 4'h0)));
	assign io_dmem_req_bits_0_bits_uop_rxq_idx = (_GEN_284 ? (_exe_cmd_T ? _GEN_84[io_core_agen_0_bits_uop_ldq_idx[2:0] * 2+:2] : (will_fire_store_agen_0_will_fire ? _GEN_196[io_core_agen_0_bits_uop_stq_idx[2:0] * 2+:2] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_rxq_idx : 2'h0))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_rxq_idx : (will_fire_load_wakeup_0_will_fire ? _GEN_84[ldq_wakeup_idx[2:0] * 2+:2] : 2'h0)));
	assign io_dmem_req_bits_0_bits_uop_pdst = (_GEN_284 ? (_exe_cmd_T ? ldq_incoming_e_0_bits_uop_pdst : _exe_tlb_uop_T_4_pdst) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_pdst : (will_fire_load_wakeup_0_will_fire ? _GEN_85[ldq_wakeup_idx[2:0] * 6+:6] : 6'h00)));
	assign io_dmem_req_bits_0_bits_uop_prs1 = (_GEN_284 ? (_exe_cmd_T ? _GEN_86[io_core_agen_0_bits_uop_ldq_idx[2:0] * 6+:6] : (will_fire_store_agen_0_will_fire ? _GEN_198[io_core_agen_0_bits_uop_stq_idx[2:0] * 6+:6] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_prs1 : 6'h00))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_prs1 : (will_fire_load_wakeup_0_will_fire ? _GEN_86[ldq_wakeup_idx[2:0] * 6+:6] : 6'h00)));
	assign io_dmem_req_bits_0_bits_uop_prs2 = (_GEN_284 ? (_exe_cmd_T ? _GEN_87[io_core_agen_0_bits_uop_ldq_idx[2:0] * 6+:6] : (will_fire_store_agen_0_will_fire ? _GEN_199[io_core_agen_0_bits_uop_stq_idx[2:0] * 6+:6] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_prs2 : 6'h00))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_prs2 : (will_fire_load_wakeup_0_will_fire ? _GEN_87[ldq_wakeup_idx[2:0] * 6+:6] : 6'h00)));
	assign io_dmem_req_bits_0_bits_uop_prs3 = (_GEN_284 ? (_exe_cmd_T ? _GEN_88[io_core_agen_0_bits_uop_ldq_idx[2:0] * 6+:6] : (will_fire_store_agen_0_will_fire ? _GEN_200[io_core_agen_0_bits_uop_stq_idx[2:0] * 6+:6] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_prs3 : 6'h00))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_prs3 : (will_fire_load_wakeup_0_will_fire ? _GEN_88[ldq_wakeup_idx[2:0] * 6+:6] : 6'h00)));
	assign io_dmem_req_bits_0_bits_uop_ppred = (_GEN_284 ? (_exe_cmd_T ? _GEN_89[io_core_agen_0_bits_uop_ldq_idx[2:0] * 4+:4] : (will_fire_store_agen_0_will_fire ? _GEN_201[io_core_agen_0_bits_uop_stq_idx[2:0] * 4+:4] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_ppred : 4'h0))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_ppred : (will_fire_load_wakeup_0_will_fire ? _GEN_89[ldq_wakeup_idx[2:0] * 4+:4] : 4'h0)));
	assign io_dmem_req_bits_0_bits_uop_prs1_busy = (_GEN_284 ? (_exe_cmd_T ? _GEN_90[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_202[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_prs1_busy)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_prs1_busy : will_fire_load_wakeup_0_will_fire & _GEN_90[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_prs2_busy = (_GEN_284 ? (_exe_cmd_T ? _GEN_91[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_203[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_prs2_busy)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_prs2_busy : will_fire_load_wakeup_0_will_fire & _GEN_91[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_prs3_busy = (_GEN_284 ? (_exe_cmd_T ? _GEN_92[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_204[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_prs3_busy)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_prs3_busy : will_fire_load_wakeup_0_will_fire & _GEN_92[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_ppred_busy = (_GEN_284 ? (_exe_cmd_T ? _GEN_93[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_205[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_ppred_busy)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_ppred_busy : will_fire_load_wakeup_0_will_fire & _GEN_93[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_stale_pdst = (_GEN_284 ? (_exe_cmd_T ? _GEN_94[io_core_agen_0_bits_uop_ldq_idx[2:0] * 6+:6] : (will_fire_store_agen_0_will_fire ? _GEN_206[io_core_agen_0_bits_uop_stq_idx[2:0] * 6+:6] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_stale_pdst : 6'h00))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_stale_pdst : (will_fire_load_wakeup_0_will_fire ? _GEN_94[ldq_wakeup_idx[2:0] * 6+:6] : 6'h00)));
	assign io_dmem_req_bits_0_bits_uop_exception = (_GEN_284 ? (_exe_cmd_T ? _GEN_95[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_207[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_exception)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_exception : will_fire_load_wakeup_0_will_fire & _GEN_95[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_exc_cause = (_GEN_284 ? (_exe_cmd_T ? _GEN_96[io_core_agen_0_bits_uop_ldq_idx[2:0] * 64+:64] : (will_fire_store_agen_0_will_fire ? _GEN_208[io_core_agen_0_bits_uop_stq_idx[2:0] * 64+:64] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_exc_cause : 64'h0000000000000000))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_exc_cause : (will_fire_load_wakeup_0_will_fire ? _GEN_96[ldq_wakeup_idx[2:0] * 64+:64] : 64'h0000000000000000)));
	assign io_dmem_req_bits_0_bits_uop_mem_cmd = (_GEN_284 ? exe_tlb_uop_0_mem_cmd : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_mem_cmd : (will_fire_load_wakeup_0_will_fire ? _GEN_97[ldq_wakeup_idx[2:0] * 5+:5] : 5'h00)));
	assign io_dmem_req_bits_0_bits_uop_mem_size = (_GEN_284 ? exe_tlb_uop_0_mem_size : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_mem_size : (will_fire_load_wakeup_0_will_fire ? ldq_wakeup_e_bits_uop_mem_size : {2 {will_fire_hella_incoming_0_will_fire | will_fire_hella_wakeup_0_will_fire}})));
	assign io_dmem_req_bits_0_bits_uop_mem_signed = (_GEN_284 ? (_exe_cmd_T ? _GEN_99[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_211[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_mem_signed)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_mem_signed : will_fire_load_wakeup_0_will_fire & _GEN_99[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_uses_ldq = (_GEN_284 ? exe_tlb_uop_0_uses_ldq : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_uses_ldq : will_fire_load_wakeup_0_will_fire & _GEN_100[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_uses_stq = (_GEN_284 ? exe_tlb_uop_0_uses_stq : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_uses_stq : will_fire_load_wakeup_0_will_fire & _GEN_101[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_is_unique = (_GEN_284 ? (_exe_cmd_T ? _GEN_102[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_214[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_is_unique)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_is_unique : will_fire_load_wakeup_0_will_fire & _GEN_102[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_flush_on_commit = (_GEN_284 ? (_exe_cmd_T ? _GEN_103[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_215[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_flush_on_commit)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_flush_on_commit : will_fire_load_wakeup_0_will_fire & _GEN_103[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_csr_cmd = (_GEN_284 ? (_exe_cmd_T ? _GEN_104[io_core_agen_0_bits_uop_ldq_idx[2:0] * 3+:3] : (will_fire_store_agen_0_will_fire ? _GEN_216[io_core_agen_0_bits_uop_stq_idx[2:0] * 3+:3] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_csr_cmd : 3'h0))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_csr_cmd : (will_fire_load_wakeup_0_will_fire ? _GEN_104[ldq_wakeup_idx[2:0] * 3+:3] : 3'h0)));
	assign io_dmem_req_bits_0_bits_uop_ldst_is_rs1 = (_GEN_284 ? (_exe_cmd_T ? _GEN_105[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_217[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_ldst_is_rs1)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_ldst_is_rs1 : will_fire_load_wakeup_0_will_fire & _GEN_105[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_ldst = (_GEN_284 ? (_exe_cmd_T ? _GEN_106[io_core_agen_0_bits_uop_ldq_idx[2:0] * 6+:6] : (will_fire_store_agen_0_will_fire ? _GEN_218[io_core_agen_0_bits_uop_stq_idx[2:0] * 6+:6] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_ldst : 6'h00))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_ldst : (will_fire_load_wakeup_0_will_fire ? _GEN_106[ldq_wakeup_idx[2:0] * 6+:6] : 6'h00)));
	assign io_dmem_req_bits_0_bits_uop_lrs1 = (_GEN_284 ? (_exe_cmd_T ? _GEN_107[io_core_agen_0_bits_uop_ldq_idx[2:0] * 6+:6] : (will_fire_store_agen_0_will_fire ? _GEN_219[io_core_agen_0_bits_uop_stq_idx[2:0] * 6+:6] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_lrs1 : 6'h00))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_lrs1 : (will_fire_load_wakeup_0_will_fire ? _GEN_107[ldq_wakeup_idx[2:0] * 6+:6] : 6'h00)));
	assign io_dmem_req_bits_0_bits_uop_lrs2 = (_GEN_284 ? (_exe_cmd_T ? _GEN_108[io_core_agen_0_bits_uop_ldq_idx[2:0] * 6+:6] : (will_fire_store_agen_0_will_fire ? _GEN_220[io_core_agen_0_bits_uop_stq_idx[2:0] * 6+:6] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_lrs2 : 6'h00))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_lrs2 : (will_fire_load_wakeup_0_will_fire ? _GEN_108[ldq_wakeup_idx[2:0] * 6+:6] : 6'h00)));
	assign io_dmem_req_bits_0_bits_uop_lrs3 = (_GEN_284 ? (_exe_cmd_T ? _GEN_109[io_core_agen_0_bits_uop_ldq_idx[2:0] * 6+:6] : (will_fire_store_agen_0_will_fire ? _GEN_221[io_core_agen_0_bits_uop_stq_idx[2:0] * 6+:6] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_lrs3 : 6'h00))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_lrs3 : (will_fire_load_wakeup_0_will_fire ? _GEN_109[ldq_wakeup_idx[2:0] * 6+:6] : 6'h00)));
	assign io_dmem_req_bits_0_bits_uop_dst_rtype = (_GEN_284 ? (_exe_cmd_T ? _GEN_110[io_core_agen_0_bits_uop_ldq_idx[2:0] * 2+:2] : (will_fire_store_agen_0_will_fire ? _GEN_222[io_core_agen_0_bits_uop_stq_idx[2:0] * 2+:2] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_dst_rtype : 2'h0))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_dst_rtype : (will_fire_load_wakeup_0_will_fire ? _GEN_110[ldq_wakeup_idx[2:0] * 2+:2] : 2'h0)));
	assign io_dmem_req_bits_0_bits_uop_lrs1_rtype = (_GEN_284 ? (_exe_cmd_T ? _GEN_111[io_core_agen_0_bits_uop_ldq_idx[2:0] * 2+:2] : (will_fire_store_agen_0_will_fire ? _GEN_223[io_core_agen_0_bits_uop_stq_idx[2:0] * 2+:2] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_lrs1_rtype : 2'h0))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_lrs1_rtype : (will_fire_load_wakeup_0_will_fire ? _GEN_111[ldq_wakeup_idx[2:0] * 2+:2] : 2'h0)));
	assign io_dmem_req_bits_0_bits_uop_lrs2_rtype = (_GEN_284 ? (_exe_cmd_T ? _GEN_112[io_core_agen_0_bits_uop_ldq_idx[2:0] * 2+:2] : (will_fire_store_agen_0_will_fire ? _GEN_224[io_core_agen_0_bits_uop_stq_idx[2:0] * 2+:2] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_lrs2_rtype : 2'h0))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_lrs2_rtype : (will_fire_load_wakeup_0_will_fire ? _GEN_112[ldq_wakeup_idx[2:0] * 2+:2] : 2'h0)));
	assign io_dmem_req_bits_0_bits_uop_frs3_en = (_GEN_284 ? (_exe_cmd_T ? _GEN_113[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_225[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_frs3_en)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_frs3_en : will_fire_load_wakeup_0_will_fire & _GEN_113[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_fcn_dw = (_GEN_284 ? (_exe_cmd_T ? _GEN_114[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_226[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_fcn_dw)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_fcn_dw : will_fire_load_wakeup_0_will_fire & _GEN_114[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_fcn_op = (_GEN_284 ? (_exe_cmd_T ? _GEN_115[io_core_agen_0_bits_uop_ldq_idx[2:0] * 5+:5] : (will_fire_store_agen_0_will_fire ? _GEN_227[io_core_agen_0_bits_uop_stq_idx[2:0] * 5+:5] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_fcn_op : 5'h00))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_fcn_op : (will_fire_load_wakeup_0_will_fire ? _GEN_115[ldq_wakeup_idx[2:0] * 5+:5] : 5'h00)));
	assign io_dmem_req_bits_0_bits_uop_fp_val = (_GEN_284 ? (_exe_cmd_T ? _GEN_116[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_228[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_fp_val)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_fp_val : will_fire_load_wakeup_0_will_fire & _GEN_116[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_fp_rm = (_GEN_284 ? (_exe_cmd_T ? _GEN_117[io_core_agen_0_bits_uop_ldq_idx[2:0] * 3+:3] : (will_fire_store_agen_0_will_fire ? _GEN_229[io_core_agen_0_bits_uop_stq_idx[2:0] * 3+:3] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_fp_rm : 3'h0))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_fp_rm : (will_fire_load_wakeup_0_will_fire ? _GEN_117[ldq_wakeup_idx[2:0] * 3+:3] : 3'h0)));
	assign io_dmem_req_bits_0_bits_uop_fp_typ = (_GEN_284 ? (_exe_cmd_T ? _GEN_118[io_core_agen_0_bits_uop_ldq_idx[2:0] * 2+:2] : (will_fire_store_agen_0_will_fire ? _GEN_230[io_core_agen_0_bits_uop_stq_idx[2:0] * 2+:2] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_fp_typ : 2'h0))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_fp_typ : (will_fire_load_wakeup_0_will_fire ? _GEN_118[ldq_wakeup_idx[2:0] * 2+:2] : 2'h0)));
	assign io_dmem_req_bits_0_bits_uop_xcpt_pf_if = (_GEN_284 ? (_exe_cmd_T ? _GEN_119[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_231[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_xcpt_pf_if)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_xcpt_pf_if : will_fire_load_wakeup_0_will_fire & _GEN_119[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_xcpt_ae_if = (_GEN_284 ? (_exe_cmd_T ? _GEN_120[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_232[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_xcpt_ae_if)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_xcpt_ae_if : will_fire_load_wakeup_0_will_fire & _GEN_120[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_xcpt_ma_if = (_GEN_284 ? (_exe_cmd_T ? _GEN_121[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_233[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_xcpt_ma_if)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_xcpt_ma_if : will_fire_load_wakeup_0_will_fire & _GEN_121[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_bp_debug_if = (_GEN_284 ? (_exe_cmd_T ? _GEN_122[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_234[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_bp_debug_if)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_bp_debug_if : will_fire_load_wakeup_0_will_fire & _GEN_122[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_bp_xcpt_if = (_GEN_284 ? (_exe_cmd_T ? _GEN_123[io_core_agen_0_bits_uop_ldq_idx[2:0]] : (will_fire_store_agen_0_will_fire ? _GEN_235[io_core_agen_0_bits_uop_stq_idx[2:0]] : _exe_tlb_vaddr_T_2 & _retry_queue_io_deq_bits_uop_bp_xcpt_if)) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_bp_xcpt_if : will_fire_load_wakeup_0_will_fire & _GEN_123[ldq_wakeup_idx[2:0]]));
	assign io_dmem_req_bits_0_bits_uop_debug_fsrc = (_GEN_284 ? (_exe_cmd_T ? _GEN_124[io_core_agen_0_bits_uop_ldq_idx[2:0] * 3+:3] : (will_fire_store_agen_0_will_fire ? _GEN_236[io_core_agen_0_bits_uop_stq_idx[2:0] * 3+:3] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_debug_fsrc : 3'h0))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_debug_fsrc : (will_fire_load_wakeup_0_will_fire ? _GEN_124[ldq_wakeup_idx[2:0] * 3+:3] : 3'h0)));
	assign io_dmem_req_bits_0_bits_uop_debug_tsrc = (_GEN_284 ? (_exe_cmd_T ? _GEN_125[io_core_agen_0_bits_uop_ldq_idx[2:0] * 3+:3] : (will_fire_store_agen_0_will_fire ? _GEN_237[io_core_agen_0_bits_uop_stq_idx[2:0] * 3+:3] : (_exe_tlb_vaddr_T_2 ? _retry_queue_io_deq_bits_uop_debug_tsrc : 3'h0))) : (_GEN_282 ? _stq_execute_queue_io_deq_bits_uop_debug_tsrc : (will_fire_load_wakeup_0_will_fire ? _GEN_125[ldq_wakeup_idx[2:0] * 3+:3] : 3'h0)));
	assign io_dmem_req_bits_0_bits_addr = dmem_req_0_bits_addr;
	assign io_dmem_req_bits_0_bits_data = (_GEN_284 ? 64'h0000000000000000 : (_GEN_282 ? _GEN_283[_stq_execute_queue_io_deq_bits_uop_mem_size * 64+:64] : ((will_fire_load_wakeup_0_will_fire | will_fire_hella_incoming_0_will_fire) | ~will_fire_hella_wakeup_0_will_fire ? 64'h0000000000000000 : hella_data_data)));
	assign io_dmem_req_bits_0_bits_is_hella = ~_GEN_285 & (will_fire_hella_incoming_0_will_fire | will_fire_hella_wakeup_0_will_fire);
	assign io_dmem_s1_kill_0 = io_dmem_s1_kill_0_0;
	assign io_dmem_ll_resp_ready = io_dmem_ll_resp_ready_0;
	assign io_dmem_brupdate_b1_resolve_mask = io_core_brupdate_b1_resolve_mask;
	assign io_dmem_brupdate_b1_mispredict_mask = io_core_brupdate_b1_mispredict_mask;
	assign io_dmem_exception = io_core_exception;
	assign io_dmem_release_ready = will_fire_release_0_will_fire;
	assign io_dmem_force_order = (_GEN_429 & _GEN_431) | io_core_fence_dmem;
	assign io_hellacache_req_ready = io_hellacache_req_ready_0;
	assign io_hellacache_s2_nack = ~(io_hellacache_req_ready_0 | _GEN_3) & _GEN_432;
	assign io_hellacache_resp_valid = (~_GEN_437 & _GEN_367) & (_GEN_436 | _GEN_434);
	assign io_hellacache_resp_bits_data = (_GEN_437 | ~(_GEN_367 & _GEN_436) ? io_dmem_ll_resp_bits_data : io_dmem_resp_0_bits_data);
	assign io_hellacache_s2_xcpt_ae_ld = (~((io_hellacache_req_ready_0 | _GEN_3) | _GEN_432) & _GEN_433) & hella_xcpt_ae_ld;
endmodule
