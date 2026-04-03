module BasicDispatcher (
	io_ren_uops_0_ready,
	io_ren_uops_0_valid,
	io_ren_uops_0_bits_inst,
	io_ren_uops_0_bits_debug_inst,
	io_ren_uops_0_bits_is_rvc,
	io_ren_uops_0_bits_debug_pc,
	io_ren_uops_0_bits_iq_type_0,
	io_ren_uops_0_bits_iq_type_1,
	io_ren_uops_0_bits_iq_type_2,
	io_ren_uops_0_bits_iq_type_3,
	io_ren_uops_0_bits_fu_code_0,
	io_ren_uops_0_bits_fu_code_1,
	io_ren_uops_0_bits_fu_code_2,
	io_ren_uops_0_bits_fu_code_3,
	io_ren_uops_0_bits_fu_code_4,
	io_ren_uops_0_bits_fu_code_5,
	io_ren_uops_0_bits_fu_code_6,
	io_ren_uops_0_bits_fu_code_7,
	io_ren_uops_0_bits_fu_code_8,
	io_ren_uops_0_bits_fu_code_9,
	io_ren_uops_0_bits_iw_p1_speculative_child,
	io_ren_uops_0_bits_iw_p2_speculative_child,
	io_ren_uops_0_bits_br_mask,
	io_ren_uops_0_bits_br_tag,
	io_ren_uops_0_bits_br_type,
	io_ren_uops_0_bits_is_sfb,
	io_ren_uops_0_bits_is_fence,
	io_ren_uops_0_bits_is_fencei,
	io_ren_uops_0_bits_is_sfence,
	io_ren_uops_0_bits_is_amo,
	io_ren_uops_0_bits_is_eret,
	io_ren_uops_0_bits_is_sys_pc2epc,
	io_ren_uops_0_bits_is_rocc,
	io_ren_uops_0_bits_is_mov,
	io_ren_uops_0_bits_ftq_idx,
	io_ren_uops_0_bits_edge_inst,
	io_ren_uops_0_bits_pc_lob,
	io_ren_uops_0_bits_taken,
	io_ren_uops_0_bits_imm_rename,
	io_ren_uops_0_bits_imm_sel,
	io_ren_uops_0_bits_pimm,
	io_ren_uops_0_bits_imm_packed,
	io_ren_uops_0_bits_op1_sel,
	io_ren_uops_0_bits_op2_sel,
	io_ren_uops_0_bits_fp_ctrl_ldst,
	io_ren_uops_0_bits_fp_ctrl_wen,
	io_ren_uops_0_bits_fp_ctrl_ren1,
	io_ren_uops_0_bits_fp_ctrl_ren2,
	io_ren_uops_0_bits_fp_ctrl_ren3,
	io_ren_uops_0_bits_fp_ctrl_swap12,
	io_ren_uops_0_bits_fp_ctrl_swap23,
	io_ren_uops_0_bits_fp_ctrl_typeTagIn,
	io_ren_uops_0_bits_fp_ctrl_typeTagOut,
	io_ren_uops_0_bits_fp_ctrl_fromint,
	io_ren_uops_0_bits_fp_ctrl_toint,
	io_ren_uops_0_bits_fp_ctrl_fastpipe,
	io_ren_uops_0_bits_fp_ctrl_fma,
	io_ren_uops_0_bits_fp_ctrl_div,
	io_ren_uops_0_bits_fp_ctrl_sqrt,
	io_ren_uops_0_bits_fp_ctrl_wflags,
	io_ren_uops_0_bits_fp_ctrl_vec,
	io_ren_uops_0_bits_rob_idx,
	io_ren_uops_0_bits_ldq_idx,
	io_ren_uops_0_bits_stq_idx,
	io_ren_uops_0_bits_rxq_idx,
	io_ren_uops_0_bits_pdst,
	io_ren_uops_0_bits_prs1,
	io_ren_uops_0_bits_prs2,
	io_ren_uops_0_bits_prs3,
	io_ren_uops_0_bits_ppred,
	io_ren_uops_0_bits_prs1_busy,
	io_ren_uops_0_bits_prs2_busy,
	io_ren_uops_0_bits_prs3_busy,
	io_ren_uops_0_bits_ppred_busy,
	io_ren_uops_0_bits_stale_pdst,
	io_ren_uops_0_bits_exception,
	io_ren_uops_0_bits_exc_cause,
	io_ren_uops_0_bits_mem_cmd,
	io_ren_uops_0_bits_mem_size,
	io_ren_uops_0_bits_mem_signed,
	io_ren_uops_0_bits_uses_ldq,
	io_ren_uops_0_bits_uses_stq,
	io_ren_uops_0_bits_is_unique,
	io_ren_uops_0_bits_flush_on_commit,
	io_ren_uops_0_bits_csr_cmd,
	io_ren_uops_0_bits_ldst_is_rs1,
	io_ren_uops_0_bits_ldst,
	io_ren_uops_0_bits_lrs1,
	io_ren_uops_0_bits_lrs2,
	io_ren_uops_0_bits_lrs3,
	io_ren_uops_0_bits_dst_rtype,
	io_ren_uops_0_bits_lrs1_rtype,
	io_ren_uops_0_bits_lrs2_rtype,
	io_ren_uops_0_bits_frs3_en,
	io_ren_uops_0_bits_fcn_dw,
	io_ren_uops_0_bits_fcn_op,
	io_ren_uops_0_bits_fp_val,
	io_ren_uops_0_bits_fp_rm,
	io_ren_uops_0_bits_fp_typ,
	io_ren_uops_0_bits_xcpt_pf_if,
	io_ren_uops_0_bits_xcpt_ae_if,
	io_ren_uops_0_bits_xcpt_ma_if,
	io_ren_uops_0_bits_bp_debug_if,
	io_ren_uops_0_bits_bp_xcpt_if,
	io_ren_uops_0_bits_debug_fsrc,
	io_ren_uops_0_bits_debug_tsrc,
	io_dis_uops_3_0_ready,
	io_dis_uops_3_0_valid,
	io_dis_uops_3_0_bits_inst,
	io_dis_uops_3_0_bits_debug_inst,
	io_dis_uops_3_0_bits_is_rvc,
	io_dis_uops_3_0_bits_debug_pc,
	io_dis_uops_3_0_bits_iq_type_0,
	io_dis_uops_3_0_bits_iq_type_1,
	io_dis_uops_3_0_bits_iq_type_2,
	io_dis_uops_3_0_bits_iq_type_3,
	io_dis_uops_3_0_bits_fu_code_0,
	io_dis_uops_3_0_bits_fu_code_1,
	io_dis_uops_3_0_bits_fu_code_2,
	io_dis_uops_3_0_bits_fu_code_3,
	io_dis_uops_3_0_bits_fu_code_4,
	io_dis_uops_3_0_bits_fu_code_5,
	io_dis_uops_3_0_bits_fu_code_6,
	io_dis_uops_3_0_bits_fu_code_7,
	io_dis_uops_3_0_bits_fu_code_8,
	io_dis_uops_3_0_bits_fu_code_9,
	io_dis_uops_3_0_bits_iw_p1_speculative_child,
	io_dis_uops_3_0_bits_iw_p2_speculative_child,
	io_dis_uops_3_0_bits_br_mask,
	io_dis_uops_3_0_bits_br_tag,
	io_dis_uops_3_0_bits_br_type,
	io_dis_uops_3_0_bits_is_sfb,
	io_dis_uops_3_0_bits_is_fence,
	io_dis_uops_3_0_bits_is_fencei,
	io_dis_uops_3_0_bits_is_sfence,
	io_dis_uops_3_0_bits_is_amo,
	io_dis_uops_3_0_bits_is_eret,
	io_dis_uops_3_0_bits_is_sys_pc2epc,
	io_dis_uops_3_0_bits_is_rocc,
	io_dis_uops_3_0_bits_is_mov,
	io_dis_uops_3_0_bits_ftq_idx,
	io_dis_uops_3_0_bits_edge_inst,
	io_dis_uops_3_0_bits_pc_lob,
	io_dis_uops_3_0_bits_taken,
	io_dis_uops_3_0_bits_imm_rename,
	io_dis_uops_3_0_bits_imm_sel,
	io_dis_uops_3_0_bits_pimm,
	io_dis_uops_3_0_bits_imm_packed,
	io_dis_uops_3_0_bits_op1_sel,
	io_dis_uops_3_0_bits_op2_sel,
	io_dis_uops_3_0_bits_fp_ctrl_ldst,
	io_dis_uops_3_0_bits_fp_ctrl_wen,
	io_dis_uops_3_0_bits_fp_ctrl_ren1,
	io_dis_uops_3_0_bits_fp_ctrl_ren2,
	io_dis_uops_3_0_bits_fp_ctrl_ren3,
	io_dis_uops_3_0_bits_fp_ctrl_swap12,
	io_dis_uops_3_0_bits_fp_ctrl_swap23,
	io_dis_uops_3_0_bits_fp_ctrl_typeTagIn,
	io_dis_uops_3_0_bits_fp_ctrl_typeTagOut,
	io_dis_uops_3_0_bits_fp_ctrl_fromint,
	io_dis_uops_3_0_bits_fp_ctrl_toint,
	io_dis_uops_3_0_bits_fp_ctrl_fastpipe,
	io_dis_uops_3_0_bits_fp_ctrl_fma,
	io_dis_uops_3_0_bits_fp_ctrl_div,
	io_dis_uops_3_0_bits_fp_ctrl_sqrt,
	io_dis_uops_3_0_bits_fp_ctrl_wflags,
	io_dis_uops_3_0_bits_fp_ctrl_vec,
	io_dis_uops_3_0_bits_rob_idx,
	io_dis_uops_3_0_bits_ldq_idx,
	io_dis_uops_3_0_bits_stq_idx,
	io_dis_uops_3_0_bits_rxq_idx,
	io_dis_uops_3_0_bits_pdst,
	io_dis_uops_3_0_bits_prs1,
	io_dis_uops_3_0_bits_prs2,
	io_dis_uops_3_0_bits_prs3,
	io_dis_uops_3_0_bits_ppred,
	io_dis_uops_3_0_bits_prs1_busy,
	io_dis_uops_3_0_bits_prs2_busy,
	io_dis_uops_3_0_bits_prs3_busy,
	io_dis_uops_3_0_bits_ppred_busy,
	io_dis_uops_3_0_bits_stale_pdst,
	io_dis_uops_3_0_bits_exception,
	io_dis_uops_3_0_bits_exc_cause,
	io_dis_uops_3_0_bits_mem_cmd,
	io_dis_uops_3_0_bits_mem_size,
	io_dis_uops_3_0_bits_mem_signed,
	io_dis_uops_3_0_bits_uses_ldq,
	io_dis_uops_3_0_bits_uses_stq,
	io_dis_uops_3_0_bits_is_unique,
	io_dis_uops_3_0_bits_flush_on_commit,
	io_dis_uops_3_0_bits_csr_cmd,
	io_dis_uops_3_0_bits_ldst_is_rs1,
	io_dis_uops_3_0_bits_ldst,
	io_dis_uops_3_0_bits_lrs1,
	io_dis_uops_3_0_bits_lrs2,
	io_dis_uops_3_0_bits_lrs3,
	io_dis_uops_3_0_bits_dst_rtype,
	io_dis_uops_3_0_bits_lrs1_rtype,
	io_dis_uops_3_0_bits_lrs2_rtype,
	io_dis_uops_3_0_bits_frs3_en,
	io_dis_uops_3_0_bits_fcn_dw,
	io_dis_uops_3_0_bits_fcn_op,
	io_dis_uops_3_0_bits_fp_val,
	io_dis_uops_3_0_bits_fp_rm,
	io_dis_uops_3_0_bits_fp_typ,
	io_dis_uops_3_0_bits_xcpt_pf_if,
	io_dis_uops_3_0_bits_xcpt_ae_if,
	io_dis_uops_3_0_bits_xcpt_ma_if,
	io_dis_uops_3_0_bits_bp_debug_if,
	io_dis_uops_3_0_bits_bp_xcpt_if,
	io_dis_uops_3_0_bits_debug_fsrc,
	io_dis_uops_3_0_bits_debug_tsrc,
	io_dis_uops_2_0_ready,
	io_dis_uops_2_0_valid,
	io_dis_uops_2_0_bits_inst,
	io_dis_uops_2_0_bits_debug_inst,
	io_dis_uops_2_0_bits_is_rvc,
	io_dis_uops_2_0_bits_debug_pc,
	io_dis_uops_2_0_bits_iq_type_0,
	io_dis_uops_2_0_bits_iq_type_1,
	io_dis_uops_2_0_bits_iq_type_2,
	io_dis_uops_2_0_bits_iq_type_3,
	io_dis_uops_2_0_bits_fu_code_0,
	io_dis_uops_2_0_bits_fu_code_1,
	io_dis_uops_2_0_bits_fu_code_2,
	io_dis_uops_2_0_bits_fu_code_3,
	io_dis_uops_2_0_bits_fu_code_4,
	io_dis_uops_2_0_bits_fu_code_5,
	io_dis_uops_2_0_bits_fu_code_6,
	io_dis_uops_2_0_bits_fu_code_7,
	io_dis_uops_2_0_bits_fu_code_8,
	io_dis_uops_2_0_bits_fu_code_9,
	io_dis_uops_2_0_bits_iw_p1_speculative_child,
	io_dis_uops_2_0_bits_iw_p2_speculative_child,
	io_dis_uops_2_0_bits_br_mask,
	io_dis_uops_2_0_bits_br_tag,
	io_dis_uops_2_0_bits_br_type,
	io_dis_uops_2_0_bits_is_sfb,
	io_dis_uops_2_0_bits_is_fence,
	io_dis_uops_2_0_bits_is_fencei,
	io_dis_uops_2_0_bits_is_sfence,
	io_dis_uops_2_0_bits_is_amo,
	io_dis_uops_2_0_bits_is_eret,
	io_dis_uops_2_0_bits_is_sys_pc2epc,
	io_dis_uops_2_0_bits_is_rocc,
	io_dis_uops_2_0_bits_is_mov,
	io_dis_uops_2_0_bits_ftq_idx,
	io_dis_uops_2_0_bits_edge_inst,
	io_dis_uops_2_0_bits_pc_lob,
	io_dis_uops_2_0_bits_taken,
	io_dis_uops_2_0_bits_imm_rename,
	io_dis_uops_2_0_bits_imm_sel,
	io_dis_uops_2_0_bits_pimm,
	io_dis_uops_2_0_bits_imm_packed,
	io_dis_uops_2_0_bits_op1_sel,
	io_dis_uops_2_0_bits_op2_sel,
	io_dis_uops_2_0_bits_fp_ctrl_ldst,
	io_dis_uops_2_0_bits_fp_ctrl_wen,
	io_dis_uops_2_0_bits_fp_ctrl_ren1,
	io_dis_uops_2_0_bits_fp_ctrl_ren2,
	io_dis_uops_2_0_bits_fp_ctrl_ren3,
	io_dis_uops_2_0_bits_fp_ctrl_swap12,
	io_dis_uops_2_0_bits_fp_ctrl_swap23,
	io_dis_uops_2_0_bits_fp_ctrl_typeTagIn,
	io_dis_uops_2_0_bits_fp_ctrl_typeTagOut,
	io_dis_uops_2_0_bits_fp_ctrl_fromint,
	io_dis_uops_2_0_bits_fp_ctrl_toint,
	io_dis_uops_2_0_bits_fp_ctrl_fastpipe,
	io_dis_uops_2_0_bits_fp_ctrl_fma,
	io_dis_uops_2_0_bits_fp_ctrl_div,
	io_dis_uops_2_0_bits_fp_ctrl_sqrt,
	io_dis_uops_2_0_bits_fp_ctrl_wflags,
	io_dis_uops_2_0_bits_fp_ctrl_vec,
	io_dis_uops_2_0_bits_rob_idx,
	io_dis_uops_2_0_bits_ldq_idx,
	io_dis_uops_2_0_bits_stq_idx,
	io_dis_uops_2_0_bits_rxq_idx,
	io_dis_uops_2_0_bits_pdst,
	io_dis_uops_2_0_bits_prs1,
	io_dis_uops_2_0_bits_prs2,
	io_dis_uops_2_0_bits_prs3,
	io_dis_uops_2_0_bits_ppred,
	io_dis_uops_2_0_bits_prs1_busy,
	io_dis_uops_2_0_bits_prs2_busy,
	io_dis_uops_2_0_bits_prs3_busy,
	io_dis_uops_2_0_bits_ppred_busy,
	io_dis_uops_2_0_bits_stale_pdst,
	io_dis_uops_2_0_bits_exception,
	io_dis_uops_2_0_bits_exc_cause,
	io_dis_uops_2_0_bits_mem_cmd,
	io_dis_uops_2_0_bits_mem_size,
	io_dis_uops_2_0_bits_mem_signed,
	io_dis_uops_2_0_bits_uses_ldq,
	io_dis_uops_2_0_bits_uses_stq,
	io_dis_uops_2_0_bits_is_unique,
	io_dis_uops_2_0_bits_flush_on_commit,
	io_dis_uops_2_0_bits_csr_cmd,
	io_dis_uops_2_0_bits_ldst_is_rs1,
	io_dis_uops_2_0_bits_ldst,
	io_dis_uops_2_0_bits_lrs1,
	io_dis_uops_2_0_bits_lrs2,
	io_dis_uops_2_0_bits_lrs3,
	io_dis_uops_2_0_bits_dst_rtype,
	io_dis_uops_2_0_bits_lrs1_rtype,
	io_dis_uops_2_0_bits_lrs2_rtype,
	io_dis_uops_2_0_bits_frs3_en,
	io_dis_uops_2_0_bits_fcn_dw,
	io_dis_uops_2_0_bits_fcn_op,
	io_dis_uops_2_0_bits_fp_val,
	io_dis_uops_2_0_bits_xcpt_pf_if,
	io_dis_uops_2_0_bits_xcpt_ae_if,
	io_dis_uops_2_0_bits_xcpt_ma_if,
	io_dis_uops_2_0_bits_bp_debug_if,
	io_dis_uops_2_0_bits_bp_xcpt_if,
	io_dis_uops_2_0_bits_debug_fsrc,
	io_dis_uops_2_0_bits_debug_tsrc,
	io_dis_uops_1_0_ready,
	io_dis_uops_1_0_valid,
	io_dis_uops_1_0_bits_inst,
	io_dis_uops_1_0_bits_debug_inst,
	io_dis_uops_1_0_bits_is_rvc,
	io_dis_uops_1_0_bits_debug_pc,
	io_dis_uops_1_0_bits_iq_type_0,
	io_dis_uops_1_0_bits_iq_type_1,
	io_dis_uops_1_0_bits_iq_type_2,
	io_dis_uops_1_0_bits_iq_type_3,
	io_dis_uops_1_0_bits_fu_code_0,
	io_dis_uops_1_0_bits_fu_code_1,
	io_dis_uops_1_0_bits_fu_code_2,
	io_dis_uops_1_0_bits_fu_code_3,
	io_dis_uops_1_0_bits_fu_code_4,
	io_dis_uops_1_0_bits_fu_code_5,
	io_dis_uops_1_0_bits_fu_code_6,
	io_dis_uops_1_0_bits_fu_code_7,
	io_dis_uops_1_0_bits_fu_code_8,
	io_dis_uops_1_0_bits_fu_code_9,
	io_dis_uops_1_0_bits_iw_p1_speculative_child,
	io_dis_uops_1_0_bits_iw_p2_speculative_child,
	io_dis_uops_1_0_bits_br_mask,
	io_dis_uops_1_0_bits_br_tag,
	io_dis_uops_1_0_bits_br_type,
	io_dis_uops_1_0_bits_is_sfb,
	io_dis_uops_1_0_bits_is_fence,
	io_dis_uops_1_0_bits_is_fencei,
	io_dis_uops_1_0_bits_is_sfence,
	io_dis_uops_1_0_bits_is_amo,
	io_dis_uops_1_0_bits_is_eret,
	io_dis_uops_1_0_bits_is_sys_pc2epc,
	io_dis_uops_1_0_bits_is_rocc,
	io_dis_uops_1_0_bits_is_mov,
	io_dis_uops_1_0_bits_ftq_idx,
	io_dis_uops_1_0_bits_edge_inst,
	io_dis_uops_1_0_bits_pc_lob,
	io_dis_uops_1_0_bits_taken,
	io_dis_uops_1_0_bits_imm_rename,
	io_dis_uops_1_0_bits_imm_sel,
	io_dis_uops_1_0_bits_pimm,
	io_dis_uops_1_0_bits_imm_packed,
	io_dis_uops_1_0_bits_op1_sel,
	io_dis_uops_1_0_bits_op2_sel,
	io_dis_uops_1_0_bits_fp_ctrl_ldst,
	io_dis_uops_1_0_bits_fp_ctrl_wen,
	io_dis_uops_1_0_bits_fp_ctrl_ren1,
	io_dis_uops_1_0_bits_fp_ctrl_ren2,
	io_dis_uops_1_0_bits_fp_ctrl_ren3,
	io_dis_uops_1_0_bits_fp_ctrl_swap12,
	io_dis_uops_1_0_bits_fp_ctrl_swap23,
	io_dis_uops_1_0_bits_fp_ctrl_typeTagIn,
	io_dis_uops_1_0_bits_fp_ctrl_typeTagOut,
	io_dis_uops_1_0_bits_fp_ctrl_fromint,
	io_dis_uops_1_0_bits_fp_ctrl_toint,
	io_dis_uops_1_0_bits_fp_ctrl_fastpipe,
	io_dis_uops_1_0_bits_fp_ctrl_fma,
	io_dis_uops_1_0_bits_fp_ctrl_div,
	io_dis_uops_1_0_bits_fp_ctrl_sqrt,
	io_dis_uops_1_0_bits_fp_ctrl_wflags,
	io_dis_uops_1_0_bits_fp_ctrl_vec,
	io_dis_uops_1_0_bits_rob_idx,
	io_dis_uops_1_0_bits_ldq_idx,
	io_dis_uops_1_0_bits_stq_idx,
	io_dis_uops_1_0_bits_rxq_idx,
	io_dis_uops_1_0_bits_pdst,
	io_dis_uops_1_0_bits_prs1,
	io_dis_uops_1_0_bits_prs2,
	io_dis_uops_1_0_bits_prs3,
	io_dis_uops_1_0_bits_ppred,
	io_dis_uops_1_0_bits_prs1_busy,
	io_dis_uops_1_0_bits_prs2_busy,
	io_dis_uops_1_0_bits_prs3_busy,
	io_dis_uops_1_0_bits_ppred_busy,
	io_dis_uops_1_0_bits_stale_pdst,
	io_dis_uops_1_0_bits_exception,
	io_dis_uops_1_0_bits_exc_cause,
	io_dis_uops_1_0_bits_mem_cmd,
	io_dis_uops_1_0_bits_mem_size,
	io_dis_uops_1_0_bits_mem_signed,
	io_dis_uops_1_0_bits_uses_ldq,
	io_dis_uops_1_0_bits_uses_stq,
	io_dis_uops_1_0_bits_is_unique,
	io_dis_uops_1_0_bits_flush_on_commit,
	io_dis_uops_1_0_bits_csr_cmd,
	io_dis_uops_1_0_bits_ldst_is_rs1,
	io_dis_uops_1_0_bits_ldst,
	io_dis_uops_1_0_bits_lrs1,
	io_dis_uops_1_0_bits_lrs2,
	io_dis_uops_1_0_bits_lrs3,
	io_dis_uops_1_0_bits_dst_rtype,
	io_dis_uops_1_0_bits_lrs1_rtype,
	io_dis_uops_1_0_bits_lrs2_rtype,
	io_dis_uops_1_0_bits_frs3_en,
	io_dis_uops_1_0_bits_fcn_dw,
	io_dis_uops_1_0_bits_fcn_op,
	io_dis_uops_1_0_bits_fp_val,
	io_dis_uops_1_0_bits_fp_rm,
	io_dis_uops_1_0_bits_fp_typ,
	io_dis_uops_1_0_bits_xcpt_pf_if,
	io_dis_uops_1_0_bits_xcpt_ae_if,
	io_dis_uops_1_0_bits_xcpt_ma_if,
	io_dis_uops_1_0_bits_bp_debug_if,
	io_dis_uops_1_0_bits_bp_xcpt_if,
	io_dis_uops_1_0_bits_debug_fsrc,
	io_dis_uops_1_0_bits_debug_tsrc,
	io_dis_uops_0_0_ready,
	io_dis_uops_0_0_valid,
	io_dis_uops_0_0_bits_fu_code_1,
	io_dis_uops_0_0_bits_fu_code_2,
	io_dis_uops_0_0_bits_iw_p1_speculative_child,
	io_dis_uops_0_0_bits_iw_p2_speculative_child,
	io_dis_uops_0_0_bits_br_mask,
	io_dis_uops_0_0_bits_is_fence,
	io_dis_uops_0_0_bits_is_fencei,
	io_dis_uops_0_0_bits_imm_sel,
	io_dis_uops_0_0_bits_pimm,
	io_dis_uops_0_0_bits_ldq_idx,
	io_dis_uops_0_0_bits_stq_idx,
	io_dis_uops_0_0_bits_pdst,
	io_dis_uops_0_0_bits_prs1,
	io_dis_uops_0_0_bits_prs2,
	io_dis_uops_0_0_bits_prs1_busy,
	io_dis_uops_0_0_bits_prs2_busy,
	io_dis_uops_0_0_bits_ppred_busy,
	io_dis_uops_0_0_bits_exception,
	io_dis_uops_0_0_bits_uses_ldq,
	io_dis_uops_0_0_bits_uses_stq,
	io_dis_uops_0_0_bits_dst_rtype,
	io_dis_uops_0_0_bits_lrs1_rtype,
	io_dis_uops_0_0_bits_lrs2_rtype,
	io_dis_uops_0_0_bits_fp_val
);
	output wire io_ren_uops_0_ready;
	input io_ren_uops_0_valid;
	input [31:0] io_ren_uops_0_bits_inst;
	input [31:0] io_ren_uops_0_bits_debug_inst;
	input io_ren_uops_0_bits_is_rvc;
	input [39:0] io_ren_uops_0_bits_debug_pc;
	input io_ren_uops_0_bits_iq_type_0;
	input io_ren_uops_0_bits_iq_type_1;
	input io_ren_uops_0_bits_iq_type_2;
	input io_ren_uops_0_bits_iq_type_3;
	input io_ren_uops_0_bits_fu_code_0;
	input io_ren_uops_0_bits_fu_code_1;
	input io_ren_uops_0_bits_fu_code_2;
	input io_ren_uops_0_bits_fu_code_3;
	input io_ren_uops_0_bits_fu_code_4;
	input io_ren_uops_0_bits_fu_code_5;
	input io_ren_uops_0_bits_fu_code_6;
	input io_ren_uops_0_bits_fu_code_7;
	input io_ren_uops_0_bits_fu_code_8;
	input io_ren_uops_0_bits_fu_code_9;
	input io_ren_uops_0_bits_iw_p1_speculative_child;
	input io_ren_uops_0_bits_iw_p2_speculative_child;
	input [7:0] io_ren_uops_0_bits_br_mask;
	input [2:0] io_ren_uops_0_bits_br_tag;
	input [3:0] io_ren_uops_0_bits_br_type;
	input io_ren_uops_0_bits_is_sfb;
	input io_ren_uops_0_bits_is_fence;
	input io_ren_uops_0_bits_is_fencei;
	input io_ren_uops_0_bits_is_sfence;
	input io_ren_uops_0_bits_is_amo;
	input io_ren_uops_0_bits_is_eret;
	input io_ren_uops_0_bits_is_sys_pc2epc;
	input io_ren_uops_0_bits_is_rocc;
	input io_ren_uops_0_bits_is_mov;
	input [3:0] io_ren_uops_0_bits_ftq_idx;
	input io_ren_uops_0_bits_edge_inst;
	input [5:0] io_ren_uops_0_bits_pc_lob;
	input io_ren_uops_0_bits_taken;
	input io_ren_uops_0_bits_imm_rename;
	input [2:0] io_ren_uops_0_bits_imm_sel;
	input [4:0] io_ren_uops_0_bits_pimm;
	input [19:0] io_ren_uops_0_bits_imm_packed;
	input [1:0] io_ren_uops_0_bits_op1_sel;
	input [2:0] io_ren_uops_0_bits_op2_sel;
	input io_ren_uops_0_bits_fp_ctrl_ldst;
	input io_ren_uops_0_bits_fp_ctrl_wen;
	input io_ren_uops_0_bits_fp_ctrl_ren1;
	input io_ren_uops_0_bits_fp_ctrl_ren2;
	input io_ren_uops_0_bits_fp_ctrl_ren3;
	input io_ren_uops_0_bits_fp_ctrl_swap12;
	input io_ren_uops_0_bits_fp_ctrl_swap23;
	input [1:0] io_ren_uops_0_bits_fp_ctrl_typeTagIn;
	input [1:0] io_ren_uops_0_bits_fp_ctrl_typeTagOut;
	input io_ren_uops_0_bits_fp_ctrl_fromint;
	input io_ren_uops_0_bits_fp_ctrl_toint;
	input io_ren_uops_0_bits_fp_ctrl_fastpipe;
	input io_ren_uops_0_bits_fp_ctrl_fma;
	input io_ren_uops_0_bits_fp_ctrl_div;
	input io_ren_uops_0_bits_fp_ctrl_sqrt;
	input io_ren_uops_0_bits_fp_ctrl_wflags;
	input io_ren_uops_0_bits_fp_ctrl_vec;
	input [4:0] io_ren_uops_0_bits_rob_idx;
	input [3:0] io_ren_uops_0_bits_ldq_idx;
	input [3:0] io_ren_uops_0_bits_stq_idx;
	input [1:0] io_ren_uops_0_bits_rxq_idx;
	input [5:0] io_ren_uops_0_bits_pdst;
	input [5:0] io_ren_uops_0_bits_prs1;
	input [5:0] io_ren_uops_0_bits_prs2;
	input [5:0] io_ren_uops_0_bits_prs3;
	input [3:0] io_ren_uops_0_bits_ppred;
	input io_ren_uops_0_bits_prs1_busy;
	input io_ren_uops_0_bits_prs2_busy;
	input io_ren_uops_0_bits_prs3_busy;
	input io_ren_uops_0_bits_ppred_busy;
	input [5:0] io_ren_uops_0_bits_stale_pdst;
	input io_ren_uops_0_bits_exception;
	input [63:0] io_ren_uops_0_bits_exc_cause;
	input [4:0] io_ren_uops_0_bits_mem_cmd;
	input [1:0] io_ren_uops_0_bits_mem_size;
	input io_ren_uops_0_bits_mem_signed;
	input io_ren_uops_0_bits_uses_ldq;
	input io_ren_uops_0_bits_uses_stq;
	input io_ren_uops_0_bits_is_unique;
	input io_ren_uops_0_bits_flush_on_commit;
	input [2:0] io_ren_uops_0_bits_csr_cmd;
	input io_ren_uops_0_bits_ldst_is_rs1;
	input [5:0] io_ren_uops_0_bits_ldst;
	input [5:0] io_ren_uops_0_bits_lrs1;
	input [5:0] io_ren_uops_0_bits_lrs2;
	input [5:0] io_ren_uops_0_bits_lrs3;
	input [1:0] io_ren_uops_0_bits_dst_rtype;
	input [1:0] io_ren_uops_0_bits_lrs1_rtype;
	input [1:0] io_ren_uops_0_bits_lrs2_rtype;
	input io_ren_uops_0_bits_frs3_en;
	input io_ren_uops_0_bits_fcn_dw;
	input [4:0] io_ren_uops_0_bits_fcn_op;
	input io_ren_uops_0_bits_fp_val;
	input [2:0] io_ren_uops_0_bits_fp_rm;
	input [1:0] io_ren_uops_0_bits_fp_typ;
	input io_ren_uops_0_bits_xcpt_pf_if;
	input io_ren_uops_0_bits_xcpt_ae_if;
	input io_ren_uops_0_bits_xcpt_ma_if;
	input io_ren_uops_0_bits_bp_debug_if;
	input io_ren_uops_0_bits_bp_xcpt_if;
	input [2:0] io_ren_uops_0_bits_debug_fsrc;
	input [2:0] io_ren_uops_0_bits_debug_tsrc;
	input io_dis_uops_3_0_ready;
	output wire io_dis_uops_3_0_valid;
	output wire [31:0] io_dis_uops_3_0_bits_inst;
	output wire [31:0] io_dis_uops_3_0_bits_debug_inst;
	output wire io_dis_uops_3_0_bits_is_rvc;
	output wire [39:0] io_dis_uops_3_0_bits_debug_pc;
	output wire io_dis_uops_3_0_bits_iq_type_0;
	output wire io_dis_uops_3_0_bits_iq_type_1;
	output wire io_dis_uops_3_0_bits_iq_type_2;
	output wire io_dis_uops_3_0_bits_iq_type_3;
	output wire io_dis_uops_3_0_bits_fu_code_0;
	output wire io_dis_uops_3_0_bits_fu_code_1;
	output wire io_dis_uops_3_0_bits_fu_code_2;
	output wire io_dis_uops_3_0_bits_fu_code_3;
	output wire io_dis_uops_3_0_bits_fu_code_4;
	output wire io_dis_uops_3_0_bits_fu_code_5;
	output wire io_dis_uops_3_0_bits_fu_code_6;
	output wire io_dis_uops_3_0_bits_fu_code_7;
	output wire io_dis_uops_3_0_bits_fu_code_8;
	output wire io_dis_uops_3_0_bits_fu_code_9;
	output wire io_dis_uops_3_0_bits_iw_p1_speculative_child;
	output wire io_dis_uops_3_0_bits_iw_p2_speculative_child;
	output wire [7:0] io_dis_uops_3_0_bits_br_mask;
	output wire [2:0] io_dis_uops_3_0_bits_br_tag;
	output wire [3:0] io_dis_uops_3_0_bits_br_type;
	output wire io_dis_uops_3_0_bits_is_sfb;
	output wire io_dis_uops_3_0_bits_is_fence;
	output wire io_dis_uops_3_0_bits_is_fencei;
	output wire io_dis_uops_3_0_bits_is_sfence;
	output wire io_dis_uops_3_0_bits_is_amo;
	output wire io_dis_uops_3_0_bits_is_eret;
	output wire io_dis_uops_3_0_bits_is_sys_pc2epc;
	output wire io_dis_uops_3_0_bits_is_rocc;
	output wire io_dis_uops_3_0_bits_is_mov;
	output wire [3:0] io_dis_uops_3_0_bits_ftq_idx;
	output wire io_dis_uops_3_0_bits_edge_inst;
	output wire [5:0] io_dis_uops_3_0_bits_pc_lob;
	output wire io_dis_uops_3_0_bits_taken;
	output wire io_dis_uops_3_0_bits_imm_rename;
	output wire [2:0] io_dis_uops_3_0_bits_imm_sel;
	output wire [4:0] io_dis_uops_3_0_bits_pimm;
	output wire [19:0] io_dis_uops_3_0_bits_imm_packed;
	output wire [1:0] io_dis_uops_3_0_bits_op1_sel;
	output wire [2:0] io_dis_uops_3_0_bits_op2_sel;
	output wire io_dis_uops_3_0_bits_fp_ctrl_ldst;
	output wire io_dis_uops_3_0_bits_fp_ctrl_wen;
	output wire io_dis_uops_3_0_bits_fp_ctrl_ren1;
	output wire io_dis_uops_3_0_bits_fp_ctrl_ren2;
	output wire io_dis_uops_3_0_bits_fp_ctrl_ren3;
	output wire io_dis_uops_3_0_bits_fp_ctrl_swap12;
	output wire io_dis_uops_3_0_bits_fp_ctrl_swap23;
	output wire [1:0] io_dis_uops_3_0_bits_fp_ctrl_typeTagIn;
	output wire [1:0] io_dis_uops_3_0_bits_fp_ctrl_typeTagOut;
	output wire io_dis_uops_3_0_bits_fp_ctrl_fromint;
	output wire io_dis_uops_3_0_bits_fp_ctrl_toint;
	output wire io_dis_uops_3_0_bits_fp_ctrl_fastpipe;
	output wire io_dis_uops_3_0_bits_fp_ctrl_fma;
	output wire io_dis_uops_3_0_bits_fp_ctrl_div;
	output wire io_dis_uops_3_0_bits_fp_ctrl_sqrt;
	output wire io_dis_uops_3_0_bits_fp_ctrl_wflags;
	output wire io_dis_uops_3_0_bits_fp_ctrl_vec;
	output wire [4:0] io_dis_uops_3_0_bits_rob_idx;
	output wire [3:0] io_dis_uops_3_0_bits_ldq_idx;
	output wire [3:0] io_dis_uops_3_0_bits_stq_idx;
	output wire [1:0] io_dis_uops_3_0_bits_rxq_idx;
	output wire [5:0] io_dis_uops_3_0_bits_pdst;
	output wire [5:0] io_dis_uops_3_0_bits_prs1;
	output wire [5:0] io_dis_uops_3_0_bits_prs2;
	output wire [5:0] io_dis_uops_3_0_bits_prs3;
	output wire [3:0] io_dis_uops_3_0_bits_ppred;
	output wire io_dis_uops_3_0_bits_prs1_busy;
	output wire io_dis_uops_3_0_bits_prs2_busy;
	output wire io_dis_uops_3_0_bits_prs3_busy;
	output wire io_dis_uops_3_0_bits_ppred_busy;
	output wire [5:0] io_dis_uops_3_0_bits_stale_pdst;
	output wire io_dis_uops_3_0_bits_exception;
	output wire [63:0] io_dis_uops_3_0_bits_exc_cause;
	output wire [4:0] io_dis_uops_3_0_bits_mem_cmd;
	output wire [1:0] io_dis_uops_3_0_bits_mem_size;
	output wire io_dis_uops_3_0_bits_mem_signed;
	output wire io_dis_uops_3_0_bits_uses_ldq;
	output wire io_dis_uops_3_0_bits_uses_stq;
	output wire io_dis_uops_3_0_bits_is_unique;
	output wire io_dis_uops_3_0_bits_flush_on_commit;
	output wire [2:0] io_dis_uops_3_0_bits_csr_cmd;
	output wire io_dis_uops_3_0_bits_ldst_is_rs1;
	output wire [5:0] io_dis_uops_3_0_bits_ldst;
	output wire [5:0] io_dis_uops_3_0_bits_lrs1;
	output wire [5:0] io_dis_uops_3_0_bits_lrs2;
	output wire [5:0] io_dis_uops_3_0_bits_lrs3;
	output wire [1:0] io_dis_uops_3_0_bits_dst_rtype;
	output wire [1:0] io_dis_uops_3_0_bits_lrs1_rtype;
	output wire [1:0] io_dis_uops_3_0_bits_lrs2_rtype;
	output wire io_dis_uops_3_0_bits_frs3_en;
	output wire io_dis_uops_3_0_bits_fcn_dw;
	output wire [4:0] io_dis_uops_3_0_bits_fcn_op;
	output wire io_dis_uops_3_0_bits_fp_val;
	output wire [2:0] io_dis_uops_3_0_bits_fp_rm;
	output wire [1:0] io_dis_uops_3_0_bits_fp_typ;
	output wire io_dis_uops_3_0_bits_xcpt_pf_if;
	output wire io_dis_uops_3_0_bits_xcpt_ae_if;
	output wire io_dis_uops_3_0_bits_xcpt_ma_if;
	output wire io_dis_uops_3_0_bits_bp_debug_if;
	output wire io_dis_uops_3_0_bits_bp_xcpt_if;
	output wire [2:0] io_dis_uops_3_0_bits_debug_fsrc;
	output wire [2:0] io_dis_uops_3_0_bits_debug_tsrc;
	input io_dis_uops_2_0_ready;
	output wire io_dis_uops_2_0_valid;
	output wire [31:0] io_dis_uops_2_0_bits_inst;
	output wire [31:0] io_dis_uops_2_0_bits_debug_inst;
	output wire io_dis_uops_2_0_bits_is_rvc;
	output wire [39:0] io_dis_uops_2_0_bits_debug_pc;
	output wire io_dis_uops_2_0_bits_iq_type_0;
	output wire io_dis_uops_2_0_bits_iq_type_1;
	output wire io_dis_uops_2_0_bits_iq_type_2;
	output wire io_dis_uops_2_0_bits_iq_type_3;
	output wire io_dis_uops_2_0_bits_fu_code_0;
	output wire io_dis_uops_2_0_bits_fu_code_1;
	output wire io_dis_uops_2_0_bits_fu_code_2;
	output wire io_dis_uops_2_0_bits_fu_code_3;
	output wire io_dis_uops_2_0_bits_fu_code_4;
	output wire io_dis_uops_2_0_bits_fu_code_5;
	output wire io_dis_uops_2_0_bits_fu_code_6;
	output wire io_dis_uops_2_0_bits_fu_code_7;
	output wire io_dis_uops_2_0_bits_fu_code_8;
	output wire io_dis_uops_2_0_bits_fu_code_9;
	output wire io_dis_uops_2_0_bits_iw_p1_speculative_child;
	output wire io_dis_uops_2_0_bits_iw_p2_speculative_child;
	output wire [7:0] io_dis_uops_2_0_bits_br_mask;
	output wire [2:0] io_dis_uops_2_0_bits_br_tag;
	output wire [3:0] io_dis_uops_2_0_bits_br_type;
	output wire io_dis_uops_2_0_bits_is_sfb;
	output wire io_dis_uops_2_0_bits_is_fence;
	output wire io_dis_uops_2_0_bits_is_fencei;
	output wire io_dis_uops_2_0_bits_is_sfence;
	output wire io_dis_uops_2_0_bits_is_amo;
	output wire io_dis_uops_2_0_bits_is_eret;
	output wire io_dis_uops_2_0_bits_is_sys_pc2epc;
	output wire io_dis_uops_2_0_bits_is_rocc;
	output wire io_dis_uops_2_0_bits_is_mov;
	output wire [3:0] io_dis_uops_2_0_bits_ftq_idx;
	output wire io_dis_uops_2_0_bits_edge_inst;
	output wire [5:0] io_dis_uops_2_0_bits_pc_lob;
	output wire io_dis_uops_2_0_bits_taken;
	output wire io_dis_uops_2_0_bits_imm_rename;
	output wire [2:0] io_dis_uops_2_0_bits_imm_sel;
	output wire [4:0] io_dis_uops_2_0_bits_pimm;
	output wire [19:0] io_dis_uops_2_0_bits_imm_packed;
	output wire [1:0] io_dis_uops_2_0_bits_op1_sel;
	output wire [2:0] io_dis_uops_2_0_bits_op2_sel;
	output wire io_dis_uops_2_0_bits_fp_ctrl_ldst;
	output wire io_dis_uops_2_0_bits_fp_ctrl_wen;
	output wire io_dis_uops_2_0_bits_fp_ctrl_ren1;
	output wire io_dis_uops_2_0_bits_fp_ctrl_ren2;
	output wire io_dis_uops_2_0_bits_fp_ctrl_ren3;
	output wire io_dis_uops_2_0_bits_fp_ctrl_swap12;
	output wire io_dis_uops_2_0_bits_fp_ctrl_swap23;
	output wire [1:0] io_dis_uops_2_0_bits_fp_ctrl_typeTagIn;
	output wire [1:0] io_dis_uops_2_0_bits_fp_ctrl_typeTagOut;
	output wire io_dis_uops_2_0_bits_fp_ctrl_fromint;
	output wire io_dis_uops_2_0_bits_fp_ctrl_toint;
	output wire io_dis_uops_2_0_bits_fp_ctrl_fastpipe;
	output wire io_dis_uops_2_0_bits_fp_ctrl_fma;
	output wire io_dis_uops_2_0_bits_fp_ctrl_div;
	output wire io_dis_uops_2_0_bits_fp_ctrl_sqrt;
	output wire io_dis_uops_2_0_bits_fp_ctrl_wflags;
	output wire io_dis_uops_2_0_bits_fp_ctrl_vec;
	output wire [4:0] io_dis_uops_2_0_bits_rob_idx;
	output wire [3:0] io_dis_uops_2_0_bits_ldq_idx;
	output wire [3:0] io_dis_uops_2_0_bits_stq_idx;
	output wire [1:0] io_dis_uops_2_0_bits_rxq_idx;
	output wire [5:0] io_dis_uops_2_0_bits_pdst;
	output wire [5:0] io_dis_uops_2_0_bits_prs1;
	output wire [5:0] io_dis_uops_2_0_bits_prs2;
	output wire [5:0] io_dis_uops_2_0_bits_prs3;
	output wire [3:0] io_dis_uops_2_0_bits_ppred;
	output wire io_dis_uops_2_0_bits_prs1_busy;
	output wire io_dis_uops_2_0_bits_prs2_busy;
	output wire io_dis_uops_2_0_bits_prs3_busy;
	output wire io_dis_uops_2_0_bits_ppred_busy;
	output wire [5:0] io_dis_uops_2_0_bits_stale_pdst;
	output wire io_dis_uops_2_0_bits_exception;
	output wire [63:0] io_dis_uops_2_0_bits_exc_cause;
	output wire [4:0] io_dis_uops_2_0_bits_mem_cmd;
	output wire [1:0] io_dis_uops_2_0_bits_mem_size;
	output wire io_dis_uops_2_0_bits_mem_signed;
	output wire io_dis_uops_2_0_bits_uses_ldq;
	output wire io_dis_uops_2_0_bits_uses_stq;
	output wire io_dis_uops_2_0_bits_is_unique;
	output wire io_dis_uops_2_0_bits_flush_on_commit;
	output wire [2:0] io_dis_uops_2_0_bits_csr_cmd;
	output wire io_dis_uops_2_0_bits_ldst_is_rs1;
	output wire [5:0] io_dis_uops_2_0_bits_ldst;
	output wire [5:0] io_dis_uops_2_0_bits_lrs1;
	output wire [5:0] io_dis_uops_2_0_bits_lrs2;
	output wire [5:0] io_dis_uops_2_0_bits_lrs3;
	output wire [1:0] io_dis_uops_2_0_bits_dst_rtype;
	output wire [1:0] io_dis_uops_2_0_bits_lrs1_rtype;
	output wire [1:0] io_dis_uops_2_0_bits_lrs2_rtype;
	output wire io_dis_uops_2_0_bits_frs3_en;
	output wire io_dis_uops_2_0_bits_fcn_dw;
	output wire [4:0] io_dis_uops_2_0_bits_fcn_op;
	output wire io_dis_uops_2_0_bits_fp_val;
	output wire io_dis_uops_2_0_bits_xcpt_pf_if;
	output wire io_dis_uops_2_0_bits_xcpt_ae_if;
	output wire io_dis_uops_2_0_bits_xcpt_ma_if;
	output wire io_dis_uops_2_0_bits_bp_debug_if;
	output wire io_dis_uops_2_0_bits_bp_xcpt_if;
	output wire [2:0] io_dis_uops_2_0_bits_debug_fsrc;
	output wire [2:0] io_dis_uops_2_0_bits_debug_tsrc;
	input io_dis_uops_1_0_ready;
	output wire io_dis_uops_1_0_valid;
	output wire [31:0] io_dis_uops_1_0_bits_inst;
	output wire [31:0] io_dis_uops_1_0_bits_debug_inst;
	output wire io_dis_uops_1_0_bits_is_rvc;
	output wire [39:0] io_dis_uops_1_0_bits_debug_pc;
	output wire io_dis_uops_1_0_bits_iq_type_0;
	output wire io_dis_uops_1_0_bits_iq_type_1;
	output wire io_dis_uops_1_0_bits_iq_type_2;
	output wire io_dis_uops_1_0_bits_iq_type_3;
	output wire io_dis_uops_1_0_bits_fu_code_0;
	output wire io_dis_uops_1_0_bits_fu_code_1;
	output wire io_dis_uops_1_0_bits_fu_code_2;
	output wire io_dis_uops_1_0_bits_fu_code_3;
	output wire io_dis_uops_1_0_bits_fu_code_4;
	output wire io_dis_uops_1_0_bits_fu_code_5;
	output wire io_dis_uops_1_0_bits_fu_code_6;
	output wire io_dis_uops_1_0_bits_fu_code_7;
	output wire io_dis_uops_1_0_bits_fu_code_8;
	output wire io_dis_uops_1_0_bits_fu_code_9;
	output wire io_dis_uops_1_0_bits_iw_p1_speculative_child;
	output wire io_dis_uops_1_0_bits_iw_p2_speculative_child;
	output wire [7:0] io_dis_uops_1_0_bits_br_mask;
	output wire [2:0] io_dis_uops_1_0_bits_br_tag;
	output wire [3:0] io_dis_uops_1_0_bits_br_type;
	output wire io_dis_uops_1_0_bits_is_sfb;
	output wire io_dis_uops_1_0_bits_is_fence;
	output wire io_dis_uops_1_0_bits_is_fencei;
	output wire io_dis_uops_1_0_bits_is_sfence;
	output wire io_dis_uops_1_0_bits_is_amo;
	output wire io_dis_uops_1_0_bits_is_eret;
	output wire io_dis_uops_1_0_bits_is_sys_pc2epc;
	output wire io_dis_uops_1_0_bits_is_rocc;
	output wire io_dis_uops_1_0_bits_is_mov;
	output wire [3:0] io_dis_uops_1_0_bits_ftq_idx;
	output wire io_dis_uops_1_0_bits_edge_inst;
	output wire [5:0] io_dis_uops_1_0_bits_pc_lob;
	output wire io_dis_uops_1_0_bits_taken;
	output wire io_dis_uops_1_0_bits_imm_rename;
	output wire [2:0] io_dis_uops_1_0_bits_imm_sel;
	output wire [4:0] io_dis_uops_1_0_bits_pimm;
	output wire [19:0] io_dis_uops_1_0_bits_imm_packed;
	output wire [1:0] io_dis_uops_1_0_bits_op1_sel;
	output wire [2:0] io_dis_uops_1_0_bits_op2_sel;
	output wire io_dis_uops_1_0_bits_fp_ctrl_ldst;
	output wire io_dis_uops_1_0_bits_fp_ctrl_wen;
	output wire io_dis_uops_1_0_bits_fp_ctrl_ren1;
	output wire io_dis_uops_1_0_bits_fp_ctrl_ren2;
	output wire io_dis_uops_1_0_bits_fp_ctrl_ren3;
	output wire io_dis_uops_1_0_bits_fp_ctrl_swap12;
	output wire io_dis_uops_1_0_bits_fp_ctrl_swap23;
	output wire [1:0] io_dis_uops_1_0_bits_fp_ctrl_typeTagIn;
	output wire [1:0] io_dis_uops_1_0_bits_fp_ctrl_typeTagOut;
	output wire io_dis_uops_1_0_bits_fp_ctrl_fromint;
	output wire io_dis_uops_1_0_bits_fp_ctrl_toint;
	output wire io_dis_uops_1_0_bits_fp_ctrl_fastpipe;
	output wire io_dis_uops_1_0_bits_fp_ctrl_fma;
	output wire io_dis_uops_1_0_bits_fp_ctrl_div;
	output wire io_dis_uops_1_0_bits_fp_ctrl_sqrt;
	output wire io_dis_uops_1_0_bits_fp_ctrl_wflags;
	output wire io_dis_uops_1_0_bits_fp_ctrl_vec;
	output wire [4:0] io_dis_uops_1_0_bits_rob_idx;
	output wire [3:0] io_dis_uops_1_0_bits_ldq_idx;
	output wire [3:0] io_dis_uops_1_0_bits_stq_idx;
	output wire [1:0] io_dis_uops_1_0_bits_rxq_idx;
	output wire [5:0] io_dis_uops_1_0_bits_pdst;
	output wire [5:0] io_dis_uops_1_0_bits_prs1;
	output wire [5:0] io_dis_uops_1_0_bits_prs2;
	output wire [5:0] io_dis_uops_1_0_bits_prs3;
	output wire [3:0] io_dis_uops_1_0_bits_ppred;
	output wire io_dis_uops_1_0_bits_prs1_busy;
	output wire io_dis_uops_1_0_bits_prs2_busy;
	output wire io_dis_uops_1_0_bits_prs3_busy;
	output wire io_dis_uops_1_0_bits_ppred_busy;
	output wire [5:0] io_dis_uops_1_0_bits_stale_pdst;
	output wire io_dis_uops_1_0_bits_exception;
	output wire [63:0] io_dis_uops_1_0_bits_exc_cause;
	output wire [4:0] io_dis_uops_1_0_bits_mem_cmd;
	output wire [1:0] io_dis_uops_1_0_bits_mem_size;
	output wire io_dis_uops_1_0_bits_mem_signed;
	output wire io_dis_uops_1_0_bits_uses_ldq;
	output wire io_dis_uops_1_0_bits_uses_stq;
	output wire io_dis_uops_1_0_bits_is_unique;
	output wire io_dis_uops_1_0_bits_flush_on_commit;
	output wire [2:0] io_dis_uops_1_0_bits_csr_cmd;
	output wire io_dis_uops_1_0_bits_ldst_is_rs1;
	output wire [5:0] io_dis_uops_1_0_bits_ldst;
	output wire [5:0] io_dis_uops_1_0_bits_lrs1;
	output wire [5:0] io_dis_uops_1_0_bits_lrs2;
	output wire [5:0] io_dis_uops_1_0_bits_lrs3;
	output wire [1:0] io_dis_uops_1_0_bits_dst_rtype;
	output wire [1:0] io_dis_uops_1_0_bits_lrs1_rtype;
	output wire [1:0] io_dis_uops_1_0_bits_lrs2_rtype;
	output wire io_dis_uops_1_0_bits_frs3_en;
	output wire io_dis_uops_1_0_bits_fcn_dw;
	output wire [4:0] io_dis_uops_1_0_bits_fcn_op;
	output wire io_dis_uops_1_0_bits_fp_val;
	output wire [2:0] io_dis_uops_1_0_bits_fp_rm;
	output wire [1:0] io_dis_uops_1_0_bits_fp_typ;
	output wire io_dis_uops_1_0_bits_xcpt_pf_if;
	output wire io_dis_uops_1_0_bits_xcpt_ae_if;
	output wire io_dis_uops_1_0_bits_xcpt_ma_if;
	output wire io_dis_uops_1_0_bits_bp_debug_if;
	output wire io_dis_uops_1_0_bits_bp_xcpt_if;
	output wire [2:0] io_dis_uops_1_0_bits_debug_fsrc;
	output wire [2:0] io_dis_uops_1_0_bits_debug_tsrc;
	input io_dis_uops_0_0_ready;
	output wire io_dis_uops_0_0_valid;
	output wire io_dis_uops_0_0_bits_fu_code_1;
	output wire io_dis_uops_0_0_bits_fu_code_2;
	output wire io_dis_uops_0_0_bits_iw_p1_speculative_child;
	output wire io_dis_uops_0_0_bits_iw_p2_speculative_child;
	output wire [7:0] io_dis_uops_0_0_bits_br_mask;
	output wire io_dis_uops_0_0_bits_is_fence;
	output wire io_dis_uops_0_0_bits_is_fencei;
	output wire [2:0] io_dis_uops_0_0_bits_imm_sel;
	output wire [4:0] io_dis_uops_0_0_bits_pimm;
	output wire [3:0] io_dis_uops_0_0_bits_ldq_idx;
	output wire [3:0] io_dis_uops_0_0_bits_stq_idx;
	output wire [5:0] io_dis_uops_0_0_bits_pdst;
	output wire [5:0] io_dis_uops_0_0_bits_prs1;
	output wire [5:0] io_dis_uops_0_0_bits_prs2;
	output wire io_dis_uops_0_0_bits_prs1_busy;
	output wire io_dis_uops_0_0_bits_prs2_busy;
	output wire io_dis_uops_0_0_bits_ppred_busy;
	output wire io_dis_uops_0_0_bits_exception;
	output wire io_dis_uops_0_0_bits_uses_ldq;
	output wire io_dis_uops_0_0_bits_uses_stq;
	output wire [1:0] io_dis_uops_0_0_bits_dst_rtype;
	output wire [1:0] io_dis_uops_0_0_bits_lrs1_rtype;
	output wire [1:0] io_dis_uops_0_0_bits_lrs2_rtype;
	output wire io_dis_uops_0_0_bits_fp_val;
	assign io_ren_uops_0_ready = ((io_dis_uops_0_0_ready & io_dis_uops_1_0_ready) & io_dis_uops_2_0_ready) & io_dis_uops_3_0_ready;
	assign io_dis_uops_3_0_valid = io_ren_uops_0_valid & io_ren_uops_0_bits_iq_type_3;
	assign io_dis_uops_3_0_bits_inst = io_ren_uops_0_bits_inst;
	assign io_dis_uops_3_0_bits_debug_inst = io_ren_uops_0_bits_debug_inst;
	assign io_dis_uops_3_0_bits_is_rvc = io_ren_uops_0_bits_is_rvc;
	assign io_dis_uops_3_0_bits_debug_pc = io_ren_uops_0_bits_debug_pc;
	assign io_dis_uops_3_0_bits_iq_type_0 = io_ren_uops_0_bits_iq_type_0;
	assign io_dis_uops_3_0_bits_iq_type_1 = io_ren_uops_0_bits_iq_type_1;
	assign io_dis_uops_3_0_bits_iq_type_2 = io_ren_uops_0_bits_iq_type_2;
	assign io_dis_uops_3_0_bits_iq_type_3 = io_ren_uops_0_bits_iq_type_3;
	assign io_dis_uops_3_0_bits_fu_code_0 = io_ren_uops_0_bits_fu_code_0;
	assign io_dis_uops_3_0_bits_fu_code_1 = io_ren_uops_0_bits_fu_code_1;
	assign io_dis_uops_3_0_bits_fu_code_2 = io_ren_uops_0_bits_fu_code_2;
	assign io_dis_uops_3_0_bits_fu_code_3 = io_ren_uops_0_bits_fu_code_3;
	assign io_dis_uops_3_0_bits_fu_code_4 = io_ren_uops_0_bits_fu_code_4;
	assign io_dis_uops_3_0_bits_fu_code_5 = io_ren_uops_0_bits_fu_code_5;
	assign io_dis_uops_3_0_bits_fu_code_6 = io_ren_uops_0_bits_fu_code_6;
	assign io_dis_uops_3_0_bits_fu_code_7 = io_ren_uops_0_bits_fu_code_7;
	assign io_dis_uops_3_0_bits_fu_code_8 = io_ren_uops_0_bits_fu_code_8;
	assign io_dis_uops_3_0_bits_fu_code_9 = io_ren_uops_0_bits_fu_code_9;
	assign io_dis_uops_3_0_bits_iw_p1_speculative_child = io_ren_uops_0_bits_iw_p1_speculative_child;
	assign io_dis_uops_3_0_bits_iw_p2_speculative_child = io_ren_uops_0_bits_iw_p2_speculative_child;
	assign io_dis_uops_3_0_bits_br_mask = io_ren_uops_0_bits_br_mask;
	assign io_dis_uops_3_0_bits_br_tag = io_ren_uops_0_bits_br_tag;
	assign io_dis_uops_3_0_bits_br_type = io_ren_uops_0_bits_br_type;
	assign io_dis_uops_3_0_bits_is_sfb = io_ren_uops_0_bits_is_sfb;
	assign io_dis_uops_3_0_bits_is_fence = io_ren_uops_0_bits_is_fence;
	assign io_dis_uops_3_0_bits_is_fencei = io_ren_uops_0_bits_is_fencei;
	assign io_dis_uops_3_0_bits_is_sfence = io_ren_uops_0_bits_is_sfence;
	assign io_dis_uops_3_0_bits_is_amo = io_ren_uops_0_bits_is_amo;
	assign io_dis_uops_3_0_bits_is_eret = io_ren_uops_0_bits_is_eret;
	assign io_dis_uops_3_0_bits_is_sys_pc2epc = io_ren_uops_0_bits_is_sys_pc2epc;
	assign io_dis_uops_3_0_bits_is_rocc = io_ren_uops_0_bits_is_rocc;
	assign io_dis_uops_3_0_bits_is_mov = io_ren_uops_0_bits_is_mov;
	assign io_dis_uops_3_0_bits_ftq_idx = io_ren_uops_0_bits_ftq_idx;
	assign io_dis_uops_3_0_bits_edge_inst = io_ren_uops_0_bits_edge_inst;
	assign io_dis_uops_3_0_bits_pc_lob = io_ren_uops_0_bits_pc_lob;
	assign io_dis_uops_3_0_bits_taken = io_ren_uops_0_bits_taken;
	assign io_dis_uops_3_0_bits_imm_rename = io_ren_uops_0_bits_imm_rename;
	assign io_dis_uops_3_0_bits_imm_sel = io_ren_uops_0_bits_imm_sel;
	assign io_dis_uops_3_0_bits_pimm = io_ren_uops_0_bits_pimm;
	assign io_dis_uops_3_0_bits_imm_packed = io_ren_uops_0_bits_imm_packed;
	assign io_dis_uops_3_0_bits_op1_sel = io_ren_uops_0_bits_op1_sel;
	assign io_dis_uops_3_0_bits_op2_sel = io_ren_uops_0_bits_op2_sel;
	assign io_dis_uops_3_0_bits_fp_ctrl_ldst = io_ren_uops_0_bits_fp_ctrl_ldst;
	assign io_dis_uops_3_0_bits_fp_ctrl_wen = io_ren_uops_0_bits_fp_ctrl_wen;
	assign io_dis_uops_3_0_bits_fp_ctrl_ren1 = io_ren_uops_0_bits_fp_ctrl_ren1;
	assign io_dis_uops_3_0_bits_fp_ctrl_ren2 = io_ren_uops_0_bits_fp_ctrl_ren2;
	assign io_dis_uops_3_0_bits_fp_ctrl_ren3 = io_ren_uops_0_bits_fp_ctrl_ren3;
	assign io_dis_uops_3_0_bits_fp_ctrl_swap12 = io_ren_uops_0_bits_fp_ctrl_swap12;
	assign io_dis_uops_3_0_bits_fp_ctrl_swap23 = io_ren_uops_0_bits_fp_ctrl_swap23;
	assign io_dis_uops_3_0_bits_fp_ctrl_typeTagIn = io_ren_uops_0_bits_fp_ctrl_typeTagIn;
	assign io_dis_uops_3_0_bits_fp_ctrl_typeTagOut = io_ren_uops_0_bits_fp_ctrl_typeTagOut;
	assign io_dis_uops_3_0_bits_fp_ctrl_fromint = io_ren_uops_0_bits_fp_ctrl_fromint;
	assign io_dis_uops_3_0_bits_fp_ctrl_toint = io_ren_uops_0_bits_fp_ctrl_toint;
	assign io_dis_uops_3_0_bits_fp_ctrl_fastpipe = io_ren_uops_0_bits_fp_ctrl_fastpipe;
	assign io_dis_uops_3_0_bits_fp_ctrl_fma = io_ren_uops_0_bits_fp_ctrl_fma;
	assign io_dis_uops_3_0_bits_fp_ctrl_div = io_ren_uops_0_bits_fp_ctrl_div;
	assign io_dis_uops_3_0_bits_fp_ctrl_sqrt = io_ren_uops_0_bits_fp_ctrl_sqrt;
	assign io_dis_uops_3_0_bits_fp_ctrl_wflags = io_ren_uops_0_bits_fp_ctrl_wflags;
	assign io_dis_uops_3_0_bits_fp_ctrl_vec = io_ren_uops_0_bits_fp_ctrl_vec;
	assign io_dis_uops_3_0_bits_rob_idx = io_ren_uops_0_bits_rob_idx;
	assign io_dis_uops_3_0_bits_ldq_idx = io_ren_uops_0_bits_ldq_idx;
	assign io_dis_uops_3_0_bits_stq_idx = io_ren_uops_0_bits_stq_idx;
	assign io_dis_uops_3_0_bits_rxq_idx = io_ren_uops_0_bits_rxq_idx;
	assign io_dis_uops_3_0_bits_pdst = io_ren_uops_0_bits_pdst;
	assign io_dis_uops_3_0_bits_prs1 = io_ren_uops_0_bits_prs1;
	assign io_dis_uops_3_0_bits_prs2 = io_ren_uops_0_bits_prs2;
	assign io_dis_uops_3_0_bits_prs3 = io_ren_uops_0_bits_prs3;
	assign io_dis_uops_3_0_bits_ppred = io_ren_uops_0_bits_ppred;
	assign io_dis_uops_3_0_bits_prs1_busy = io_ren_uops_0_bits_prs1_busy;
	assign io_dis_uops_3_0_bits_prs2_busy = io_ren_uops_0_bits_prs2_busy;
	assign io_dis_uops_3_0_bits_prs3_busy = io_ren_uops_0_bits_prs3_busy;
	assign io_dis_uops_3_0_bits_ppred_busy = io_ren_uops_0_bits_ppred_busy;
	assign io_dis_uops_3_0_bits_stale_pdst = io_ren_uops_0_bits_stale_pdst;
	assign io_dis_uops_3_0_bits_exception = io_ren_uops_0_bits_exception;
	assign io_dis_uops_3_0_bits_exc_cause = io_ren_uops_0_bits_exc_cause;
	assign io_dis_uops_3_0_bits_mem_cmd = io_ren_uops_0_bits_mem_cmd;
	assign io_dis_uops_3_0_bits_mem_size = io_ren_uops_0_bits_mem_size;
	assign io_dis_uops_3_0_bits_mem_signed = io_ren_uops_0_bits_mem_signed;
	assign io_dis_uops_3_0_bits_uses_ldq = io_ren_uops_0_bits_uses_ldq;
	assign io_dis_uops_3_0_bits_uses_stq = io_ren_uops_0_bits_uses_stq;
	assign io_dis_uops_3_0_bits_is_unique = io_ren_uops_0_bits_is_unique;
	assign io_dis_uops_3_0_bits_flush_on_commit = io_ren_uops_0_bits_flush_on_commit;
	assign io_dis_uops_3_0_bits_csr_cmd = io_ren_uops_0_bits_csr_cmd;
	assign io_dis_uops_3_0_bits_ldst_is_rs1 = io_ren_uops_0_bits_ldst_is_rs1;
	assign io_dis_uops_3_0_bits_ldst = io_ren_uops_0_bits_ldst;
	assign io_dis_uops_3_0_bits_lrs1 = io_ren_uops_0_bits_lrs1;
	assign io_dis_uops_3_0_bits_lrs2 = io_ren_uops_0_bits_lrs2;
	assign io_dis_uops_3_0_bits_lrs3 = io_ren_uops_0_bits_lrs3;
	assign io_dis_uops_3_0_bits_dst_rtype = io_ren_uops_0_bits_dst_rtype;
	assign io_dis_uops_3_0_bits_lrs1_rtype = io_ren_uops_0_bits_lrs1_rtype;
	assign io_dis_uops_3_0_bits_lrs2_rtype = io_ren_uops_0_bits_lrs2_rtype;
	assign io_dis_uops_3_0_bits_frs3_en = io_ren_uops_0_bits_frs3_en;
	assign io_dis_uops_3_0_bits_fcn_dw = io_ren_uops_0_bits_fcn_dw;
	assign io_dis_uops_3_0_bits_fcn_op = io_ren_uops_0_bits_fcn_op;
	assign io_dis_uops_3_0_bits_fp_val = io_ren_uops_0_bits_fp_val;
	assign io_dis_uops_3_0_bits_fp_rm = io_ren_uops_0_bits_fp_rm;
	assign io_dis_uops_3_0_bits_fp_typ = io_ren_uops_0_bits_fp_typ;
	assign io_dis_uops_3_0_bits_xcpt_pf_if = io_ren_uops_0_bits_xcpt_pf_if;
	assign io_dis_uops_3_0_bits_xcpt_ae_if = io_ren_uops_0_bits_xcpt_ae_if;
	assign io_dis_uops_3_0_bits_xcpt_ma_if = io_ren_uops_0_bits_xcpt_ma_if;
	assign io_dis_uops_3_0_bits_bp_debug_if = io_ren_uops_0_bits_bp_debug_if;
	assign io_dis_uops_3_0_bits_bp_xcpt_if = io_ren_uops_0_bits_bp_xcpt_if;
	assign io_dis_uops_3_0_bits_debug_fsrc = io_ren_uops_0_bits_debug_fsrc;
	assign io_dis_uops_3_0_bits_debug_tsrc = io_ren_uops_0_bits_debug_tsrc;
	assign io_dis_uops_2_0_valid = io_ren_uops_0_valid & io_ren_uops_0_bits_iq_type_2;
	assign io_dis_uops_2_0_bits_inst = io_ren_uops_0_bits_inst;
	assign io_dis_uops_2_0_bits_debug_inst = io_ren_uops_0_bits_debug_inst;
	assign io_dis_uops_2_0_bits_is_rvc = io_ren_uops_0_bits_is_rvc;
	assign io_dis_uops_2_0_bits_debug_pc = io_ren_uops_0_bits_debug_pc;
	assign io_dis_uops_2_0_bits_iq_type_0 = io_ren_uops_0_bits_iq_type_0;
	assign io_dis_uops_2_0_bits_iq_type_1 = io_ren_uops_0_bits_iq_type_1;
	assign io_dis_uops_2_0_bits_iq_type_2 = io_ren_uops_0_bits_iq_type_2;
	assign io_dis_uops_2_0_bits_iq_type_3 = io_ren_uops_0_bits_iq_type_3;
	assign io_dis_uops_2_0_bits_fu_code_0 = io_ren_uops_0_bits_fu_code_0;
	assign io_dis_uops_2_0_bits_fu_code_1 = io_ren_uops_0_bits_fu_code_1;
	assign io_dis_uops_2_0_bits_fu_code_2 = io_ren_uops_0_bits_fu_code_2;
	assign io_dis_uops_2_0_bits_fu_code_3 = io_ren_uops_0_bits_fu_code_3;
	assign io_dis_uops_2_0_bits_fu_code_4 = io_ren_uops_0_bits_fu_code_4;
	assign io_dis_uops_2_0_bits_fu_code_5 = io_ren_uops_0_bits_fu_code_5;
	assign io_dis_uops_2_0_bits_fu_code_6 = io_ren_uops_0_bits_fu_code_6;
	assign io_dis_uops_2_0_bits_fu_code_7 = io_ren_uops_0_bits_fu_code_7;
	assign io_dis_uops_2_0_bits_fu_code_8 = io_ren_uops_0_bits_fu_code_8;
	assign io_dis_uops_2_0_bits_fu_code_9 = io_ren_uops_0_bits_fu_code_9;
	assign io_dis_uops_2_0_bits_iw_p1_speculative_child = io_ren_uops_0_bits_iw_p1_speculative_child;
	assign io_dis_uops_2_0_bits_iw_p2_speculative_child = io_ren_uops_0_bits_iw_p2_speculative_child;
	assign io_dis_uops_2_0_bits_br_mask = io_ren_uops_0_bits_br_mask;
	assign io_dis_uops_2_0_bits_br_tag = io_ren_uops_0_bits_br_tag;
	assign io_dis_uops_2_0_bits_br_type = io_ren_uops_0_bits_br_type;
	assign io_dis_uops_2_0_bits_is_sfb = io_ren_uops_0_bits_is_sfb;
	assign io_dis_uops_2_0_bits_is_fence = io_ren_uops_0_bits_is_fence;
	assign io_dis_uops_2_0_bits_is_fencei = io_ren_uops_0_bits_is_fencei;
	assign io_dis_uops_2_0_bits_is_sfence = io_ren_uops_0_bits_is_sfence;
	assign io_dis_uops_2_0_bits_is_amo = io_ren_uops_0_bits_is_amo;
	assign io_dis_uops_2_0_bits_is_eret = io_ren_uops_0_bits_is_eret;
	assign io_dis_uops_2_0_bits_is_sys_pc2epc = io_ren_uops_0_bits_is_sys_pc2epc;
	assign io_dis_uops_2_0_bits_is_rocc = io_ren_uops_0_bits_is_rocc;
	assign io_dis_uops_2_0_bits_is_mov = io_ren_uops_0_bits_is_mov;
	assign io_dis_uops_2_0_bits_ftq_idx = io_ren_uops_0_bits_ftq_idx;
	assign io_dis_uops_2_0_bits_edge_inst = io_ren_uops_0_bits_edge_inst;
	assign io_dis_uops_2_0_bits_pc_lob = io_ren_uops_0_bits_pc_lob;
	assign io_dis_uops_2_0_bits_taken = io_ren_uops_0_bits_taken;
	assign io_dis_uops_2_0_bits_imm_rename = io_ren_uops_0_bits_imm_rename;
	assign io_dis_uops_2_0_bits_imm_sel = io_ren_uops_0_bits_imm_sel;
	assign io_dis_uops_2_0_bits_pimm = io_ren_uops_0_bits_pimm;
	assign io_dis_uops_2_0_bits_imm_packed = io_ren_uops_0_bits_imm_packed;
	assign io_dis_uops_2_0_bits_op1_sel = io_ren_uops_0_bits_op1_sel;
	assign io_dis_uops_2_0_bits_op2_sel = io_ren_uops_0_bits_op2_sel;
	assign io_dis_uops_2_0_bits_fp_ctrl_ldst = io_ren_uops_0_bits_fp_ctrl_ldst;
	assign io_dis_uops_2_0_bits_fp_ctrl_wen = io_ren_uops_0_bits_fp_ctrl_wen;
	assign io_dis_uops_2_0_bits_fp_ctrl_ren1 = io_ren_uops_0_bits_fp_ctrl_ren1;
	assign io_dis_uops_2_0_bits_fp_ctrl_ren2 = io_ren_uops_0_bits_fp_ctrl_ren2;
	assign io_dis_uops_2_0_bits_fp_ctrl_ren3 = io_ren_uops_0_bits_fp_ctrl_ren3;
	assign io_dis_uops_2_0_bits_fp_ctrl_swap12 = io_ren_uops_0_bits_fp_ctrl_swap12;
	assign io_dis_uops_2_0_bits_fp_ctrl_swap23 = io_ren_uops_0_bits_fp_ctrl_swap23;
	assign io_dis_uops_2_0_bits_fp_ctrl_typeTagIn = io_ren_uops_0_bits_fp_ctrl_typeTagIn;
	assign io_dis_uops_2_0_bits_fp_ctrl_typeTagOut = io_ren_uops_0_bits_fp_ctrl_typeTagOut;
	assign io_dis_uops_2_0_bits_fp_ctrl_fromint = io_ren_uops_0_bits_fp_ctrl_fromint;
	assign io_dis_uops_2_0_bits_fp_ctrl_toint = io_ren_uops_0_bits_fp_ctrl_toint;
	assign io_dis_uops_2_0_bits_fp_ctrl_fastpipe = io_ren_uops_0_bits_fp_ctrl_fastpipe;
	assign io_dis_uops_2_0_bits_fp_ctrl_fma = io_ren_uops_0_bits_fp_ctrl_fma;
	assign io_dis_uops_2_0_bits_fp_ctrl_div = io_ren_uops_0_bits_fp_ctrl_div;
	assign io_dis_uops_2_0_bits_fp_ctrl_sqrt = io_ren_uops_0_bits_fp_ctrl_sqrt;
	assign io_dis_uops_2_0_bits_fp_ctrl_wflags = io_ren_uops_0_bits_fp_ctrl_wflags;
	assign io_dis_uops_2_0_bits_fp_ctrl_vec = io_ren_uops_0_bits_fp_ctrl_vec;
	assign io_dis_uops_2_0_bits_rob_idx = io_ren_uops_0_bits_rob_idx;
	assign io_dis_uops_2_0_bits_ldq_idx = io_ren_uops_0_bits_ldq_idx;
	assign io_dis_uops_2_0_bits_stq_idx = io_ren_uops_0_bits_stq_idx;
	assign io_dis_uops_2_0_bits_rxq_idx = io_ren_uops_0_bits_rxq_idx;
	assign io_dis_uops_2_0_bits_pdst = io_ren_uops_0_bits_pdst;
	assign io_dis_uops_2_0_bits_prs1 = io_ren_uops_0_bits_prs1;
	assign io_dis_uops_2_0_bits_prs2 = io_ren_uops_0_bits_prs2;
	assign io_dis_uops_2_0_bits_prs3 = io_ren_uops_0_bits_prs3;
	assign io_dis_uops_2_0_bits_ppred = io_ren_uops_0_bits_ppred;
	assign io_dis_uops_2_0_bits_prs1_busy = io_ren_uops_0_bits_prs1_busy;
	assign io_dis_uops_2_0_bits_prs2_busy = io_ren_uops_0_bits_prs2_busy;
	assign io_dis_uops_2_0_bits_prs3_busy = io_ren_uops_0_bits_prs3_busy;
	assign io_dis_uops_2_0_bits_ppred_busy = io_ren_uops_0_bits_ppred_busy;
	assign io_dis_uops_2_0_bits_stale_pdst = io_ren_uops_0_bits_stale_pdst;
	assign io_dis_uops_2_0_bits_exception = io_ren_uops_0_bits_exception;
	assign io_dis_uops_2_0_bits_exc_cause = io_ren_uops_0_bits_exc_cause;
	assign io_dis_uops_2_0_bits_mem_cmd = io_ren_uops_0_bits_mem_cmd;
	assign io_dis_uops_2_0_bits_mem_size = io_ren_uops_0_bits_mem_size;
	assign io_dis_uops_2_0_bits_mem_signed = io_ren_uops_0_bits_mem_signed;
	assign io_dis_uops_2_0_bits_uses_ldq = io_ren_uops_0_bits_uses_ldq;
	assign io_dis_uops_2_0_bits_uses_stq = io_ren_uops_0_bits_uses_stq;
	assign io_dis_uops_2_0_bits_is_unique = io_ren_uops_0_bits_is_unique;
	assign io_dis_uops_2_0_bits_flush_on_commit = io_ren_uops_0_bits_flush_on_commit;
	assign io_dis_uops_2_0_bits_csr_cmd = io_ren_uops_0_bits_csr_cmd;
	assign io_dis_uops_2_0_bits_ldst_is_rs1 = io_ren_uops_0_bits_ldst_is_rs1;
	assign io_dis_uops_2_0_bits_ldst = io_ren_uops_0_bits_ldst;
	assign io_dis_uops_2_0_bits_lrs1 = io_ren_uops_0_bits_lrs1;
	assign io_dis_uops_2_0_bits_lrs2 = io_ren_uops_0_bits_lrs2;
	assign io_dis_uops_2_0_bits_lrs3 = io_ren_uops_0_bits_lrs3;
	assign io_dis_uops_2_0_bits_dst_rtype = io_ren_uops_0_bits_dst_rtype;
	assign io_dis_uops_2_0_bits_lrs1_rtype = io_ren_uops_0_bits_lrs1_rtype;
	assign io_dis_uops_2_0_bits_lrs2_rtype = io_ren_uops_0_bits_lrs2_rtype;
	assign io_dis_uops_2_0_bits_frs3_en = io_ren_uops_0_bits_frs3_en;
	assign io_dis_uops_2_0_bits_fcn_dw = io_ren_uops_0_bits_fcn_dw;
	assign io_dis_uops_2_0_bits_fcn_op = io_ren_uops_0_bits_fcn_op;
	assign io_dis_uops_2_0_bits_fp_val = io_ren_uops_0_bits_fp_val;
	assign io_dis_uops_2_0_bits_xcpt_pf_if = io_ren_uops_0_bits_xcpt_pf_if;
	assign io_dis_uops_2_0_bits_xcpt_ae_if = io_ren_uops_0_bits_xcpt_ae_if;
	assign io_dis_uops_2_0_bits_xcpt_ma_if = io_ren_uops_0_bits_xcpt_ma_if;
	assign io_dis_uops_2_0_bits_bp_debug_if = io_ren_uops_0_bits_bp_debug_if;
	assign io_dis_uops_2_0_bits_bp_xcpt_if = io_ren_uops_0_bits_bp_xcpt_if;
	assign io_dis_uops_2_0_bits_debug_fsrc = io_ren_uops_0_bits_debug_fsrc;
	assign io_dis_uops_2_0_bits_debug_tsrc = io_ren_uops_0_bits_debug_tsrc;
	assign io_dis_uops_1_0_valid = io_ren_uops_0_valid & io_ren_uops_0_bits_iq_type_1;
	assign io_dis_uops_1_0_bits_inst = io_ren_uops_0_bits_inst;
	assign io_dis_uops_1_0_bits_debug_inst = io_ren_uops_0_bits_debug_inst;
	assign io_dis_uops_1_0_bits_is_rvc = io_ren_uops_0_bits_is_rvc;
	assign io_dis_uops_1_0_bits_debug_pc = io_ren_uops_0_bits_debug_pc;
	assign io_dis_uops_1_0_bits_iq_type_0 = io_ren_uops_0_bits_iq_type_0;
	assign io_dis_uops_1_0_bits_iq_type_1 = io_ren_uops_0_bits_iq_type_1;
	assign io_dis_uops_1_0_bits_iq_type_2 = io_ren_uops_0_bits_iq_type_2;
	assign io_dis_uops_1_0_bits_iq_type_3 = io_ren_uops_0_bits_iq_type_3;
	assign io_dis_uops_1_0_bits_fu_code_0 = io_ren_uops_0_bits_fu_code_0;
	assign io_dis_uops_1_0_bits_fu_code_1 = io_ren_uops_0_bits_fu_code_1;
	assign io_dis_uops_1_0_bits_fu_code_2 = io_ren_uops_0_bits_fu_code_2;
	assign io_dis_uops_1_0_bits_fu_code_3 = io_ren_uops_0_bits_fu_code_3;
	assign io_dis_uops_1_0_bits_fu_code_4 = io_ren_uops_0_bits_fu_code_4;
	assign io_dis_uops_1_0_bits_fu_code_5 = io_ren_uops_0_bits_fu_code_5;
	assign io_dis_uops_1_0_bits_fu_code_6 = io_ren_uops_0_bits_fu_code_6;
	assign io_dis_uops_1_0_bits_fu_code_7 = io_ren_uops_0_bits_fu_code_7;
	assign io_dis_uops_1_0_bits_fu_code_8 = io_ren_uops_0_bits_fu_code_8;
	assign io_dis_uops_1_0_bits_fu_code_9 = io_ren_uops_0_bits_fu_code_9;
	assign io_dis_uops_1_0_bits_iw_p1_speculative_child = io_ren_uops_0_bits_iw_p1_speculative_child;
	assign io_dis_uops_1_0_bits_iw_p2_speculative_child = io_ren_uops_0_bits_iw_p2_speculative_child;
	assign io_dis_uops_1_0_bits_br_mask = io_ren_uops_0_bits_br_mask;
	assign io_dis_uops_1_0_bits_br_tag = io_ren_uops_0_bits_br_tag;
	assign io_dis_uops_1_0_bits_br_type = io_ren_uops_0_bits_br_type;
	assign io_dis_uops_1_0_bits_is_sfb = io_ren_uops_0_bits_is_sfb;
	assign io_dis_uops_1_0_bits_is_fence = io_ren_uops_0_bits_is_fence;
	assign io_dis_uops_1_0_bits_is_fencei = io_ren_uops_0_bits_is_fencei;
	assign io_dis_uops_1_0_bits_is_sfence = io_ren_uops_0_bits_is_sfence;
	assign io_dis_uops_1_0_bits_is_amo = io_ren_uops_0_bits_is_amo;
	assign io_dis_uops_1_0_bits_is_eret = io_ren_uops_0_bits_is_eret;
	assign io_dis_uops_1_0_bits_is_sys_pc2epc = io_ren_uops_0_bits_is_sys_pc2epc;
	assign io_dis_uops_1_0_bits_is_rocc = io_ren_uops_0_bits_is_rocc;
	assign io_dis_uops_1_0_bits_is_mov = io_ren_uops_0_bits_is_mov;
	assign io_dis_uops_1_0_bits_ftq_idx = io_ren_uops_0_bits_ftq_idx;
	assign io_dis_uops_1_0_bits_edge_inst = io_ren_uops_0_bits_edge_inst;
	assign io_dis_uops_1_0_bits_pc_lob = io_ren_uops_0_bits_pc_lob;
	assign io_dis_uops_1_0_bits_taken = io_ren_uops_0_bits_taken;
	assign io_dis_uops_1_0_bits_imm_rename = io_ren_uops_0_bits_imm_rename;
	assign io_dis_uops_1_0_bits_imm_sel = io_ren_uops_0_bits_imm_sel;
	assign io_dis_uops_1_0_bits_pimm = io_ren_uops_0_bits_pimm;
	assign io_dis_uops_1_0_bits_imm_packed = io_ren_uops_0_bits_imm_packed;
	assign io_dis_uops_1_0_bits_op1_sel = io_ren_uops_0_bits_op1_sel;
	assign io_dis_uops_1_0_bits_op2_sel = io_ren_uops_0_bits_op2_sel;
	assign io_dis_uops_1_0_bits_fp_ctrl_ldst = io_ren_uops_0_bits_fp_ctrl_ldst;
	assign io_dis_uops_1_0_bits_fp_ctrl_wen = io_ren_uops_0_bits_fp_ctrl_wen;
	assign io_dis_uops_1_0_bits_fp_ctrl_ren1 = io_ren_uops_0_bits_fp_ctrl_ren1;
	assign io_dis_uops_1_0_bits_fp_ctrl_ren2 = io_ren_uops_0_bits_fp_ctrl_ren2;
	assign io_dis_uops_1_0_bits_fp_ctrl_ren3 = io_ren_uops_0_bits_fp_ctrl_ren3;
	assign io_dis_uops_1_0_bits_fp_ctrl_swap12 = io_ren_uops_0_bits_fp_ctrl_swap12;
	assign io_dis_uops_1_0_bits_fp_ctrl_swap23 = io_ren_uops_0_bits_fp_ctrl_swap23;
	assign io_dis_uops_1_0_bits_fp_ctrl_typeTagIn = io_ren_uops_0_bits_fp_ctrl_typeTagIn;
	assign io_dis_uops_1_0_bits_fp_ctrl_typeTagOut = io_ren_uops_0_bits_fp_ctrl_typeTagOut;
	assign io_dis_uops_1_0_bits_fp_ctrl_fromint = io_ren_uops_0_bits_fp_ctrl_fromint;
	assign io_dis_uops_1_0_bits_fp_ctrl_toint = io_ren_uops_0_bits_fp_ctrl_toint;
	assign io_dis_uops_1_0_bits_fp_ctrl_fastpipe = io_ren_uops_0_bits_fp_ctrl_fastpipe;
	assign io_dis_uops_1_0_bits_fp_ctrl_fma = io_ren_uops_0_bits_fp_ctrl_fma;
	assign io_dis_uops_1_0_bits_fp_ctrl_div = io_ren_uops_0_bits_fp_ctrl_div;
	assign io_dis_uops_1_0_bits_fp_ctrl_sqrt = io_ren_uops_0_bits_fp_ctrl_sqrt;
	assign io_dis_uops_1_0_bits_fp_ctrl_wflags = io_ren_uops_0_bits_fp_ctrl_wflags;
	assign io_dis_uops_1_0_bits_fp_ctrl_vec = io_ren_uops_0_bits_fp_ctrl_vec;
	assign io_dis_uops_1_0_bits_rob_idx = io_ren_uops_0_bits_rob_idx;
	assign io_dis_uops_1_0_bits_ldq_idx = io_ren_uops_0_bits_ldq_idx;
	assign io_dis_uops_1_0_bits_stq_idx = io_ren_uops_0_bits_stq_idx;
	assign io_dis_uops_1_0_bits_rxq_idx = io_ren_uops_0_bits_rxq_idx;
	assign io_dis_uops_1_0_bits_pdst = io_ren_uops_0_bits_pdst;
	assign io_dis_uops_1_0_bits_prs1 = io_ren_uops_0_bits_prs1;
	assign io_dis_uops_1_0_bits_prs2 = io_ren_uops_0_bits_prs2;
	assign io_dis_uops_1_0_bits_prs3 = io_ren_uops_0_bits_prs3;
	assign io_dis_uops_1_0_bits_ppred = io_ren_uops_0_bits_ppred;
	assign io_dis_uops_1_0_bits_prs1_busy = io_ren_uops_0_bits_prs1_busy;
	assign io_dis_uops_1_0_bits_prs2_busy = io_ren_uops_0_bits_prs2_busy;
	assign io_dis_uops_1_0_bits_prs3_busy = io_ren_uops_0_bits_prs3_busy;
	assign io_dis_uops_1_0_bits_ppred_busy = io_ren_uops_0_bits_ppred_busy;
	assign io_dis_uops_1_0_bits_stale_pdst = io_ren_uops_0_bits_stale_pdst;
	assign io_dis_uops_1_0_bits_exception = io_ren_uops_0_bits_exception;
	assign io_dis_uops_1_0_bits_exc_cause = io_ren_uops_0_bits_exc_cause;
	assign io_dis_uops_1_0_bits_mem_cmd = io_ren_uops_0_bits_mem_cmd;
	assign io_dis_uops_1_0_bits_mem_size = io_ren_uops_0_bits_mem_size;
	assign io_dis_uops_1_0_bits_mem_signed = io_ren_uops_0_bits_mem_signed;
	assign io_dis_uops_1_0_bits_uses_ldq = io_ren_uops_0_bits_uses_ldq;
	assign io_dis_uops_1_0_bits_uses_stq = io_ren_uops_0_bits_uses_stq;
	assign io_dis_uops_1_0_bits_is_unique = io_ren_uops_0_bits_is_unique;
	assign io_dis_uops_1_0_bits_flush_on_commit = io_ren_uops_0_bits_flush_on_commit;
	assign io_dis_uops_1_0_bits_csr_cmd = io_ren_uops_0_bits_csr_cmd;
	assign io_dis_uops_1_0_bits_ldst_is_rs1 = io_ren_uops_0_bits_ldst_is_rs1;
	assign io_dis_uops_1_0_bits_ldst = io_ren_uops_0_bits_ldst;
	assign io_dis_uops_1_0_bits_lrs1 = io_ren_uops_0_bits_lrs1;
	assign io_dis_uops_1_0_bits_lrs2 = io_ren_uops_0_bits_lrs2;
	assign io_dis_uops_1_0_bits_lrs3 = io_ren_uops_0_bits_lrs3;
	assign io_dis_uops_1_0_bits_dst_rtype = io_ren_uops_0_bits_dst_rtype;
	assign io_dis_uops_1_0_bits_lrs1_rtype = io_ren_uops_0_bits_lrs1_rtype;
	assign io_dis_uops_1_0_bits_lrs2_rtype = io_ren_uops_0_bits_lrs2_rtype;
	assign io_dis_uops_1_0_bits_frs3_en = io_ren_uops_0_bits_frs3_en;
	assign io_dis_uops_1_0_bits_fcn_dw = io_ren_uops_0_bits_fcn_dw;
	assign io_dis_uops_1_0_bits_fcn_op = io_ren_uops_0_bits_fcn_op;
	assign io_dis_uops_1_0_bits_fp_val = io_ren_uops_0_bits_fp_val;
	assign io_dis_uops_1_0_bits_fp_rm = io_ren_uops_0_bits_fp_rm;
	assign io_dis_uops_1_0_bits_fp_typ = io_ren_uops_0_bits_fp_typ;
	assign io_dis_uops_1_0_bits_xcpt_pf_if = io_ren_uops_0_bits_xcpt_pf_if;
	assign io_dis_uops_1_0_bits_xcpt_ae_if = io_ren_uops_0_bits_xcpt_ae_if;
	assign io_dis_uops_1_0_bits_xcpt_ma_if = io_ren_uops_0_bits_xcpt_ma_if;
	assign io_dis_uops_1_0_bits_bp_debug_if = io_ren_uops_0_bits_bp_debug_if;
	assign io_dis_uops_1_0_bits_bp_xcpt_if = io_ren_uops_0_bits_bp_xcpt_if;
	assign io_dis_uops_1_0_bits_debug_fsrc = io_ren_uops_0_bits_debug_fsrc;
	assign io_dis_uops_1_0_bits_debug_tsrc = io_ren_uops_0_bits_debug_tsrc;
	assign io_dis_uops_0_0_valid = io_ren_uops_0_valid & io_ren_uops_0_bits_iq_type_0;
	assign io_dis_uops_0_0_bits_fu_code_1 = io_ren_uops_0_bits_fu_code_1;
	assign io_dis_uops_0_0_bits_fu_code_2 = io_ren_uops_0_bits_fu_code_2;
	assign io_dis_uops_0_0_bits_iw_p1_speculative_child = io_ren_uops_0_bits_iw_p1_speculative_child;
	assign io_dis_uops_0_0_bits_iw_p2_speculative_child = io_ren_uops_0_bits_iw_p2_speculative_child;
	assign io_dis_uops_0_0_bits_br_mask = io_ren_uops_0_bits_br_mask;
	assign io_dis_uops_0_0_bits_is_fence = io_ren_uops_0_bits_is_fence;
	assign io_dis_uops_0_0_bits_is_fencei = io_ren_uops_0_bits_is_fencei;
	assign io_dis_uops_0_0_bits_imm_sel = io_ren_uops_0_bits_imm_sel;
	assign io_dis_uops_0_0_bits_pimm = io_ren_uops_0_bits_pimm;
	assign io_dis_uops_0_0_bits_ldq_idx = io_ren_uops_0_bits_ldq_idx;
	assign io_dis_uops_0_0_bits_stq_idx = io_ren_uops_0_bits_stq_idx;
	assign io_dis_uops_0_0_bits_pdst = io_ren_uops_0_bits_pdst;
	assign io_dis_uops_0_0_bits_prs1 = io_ren_uops_0_bits_prs1;
	assign io_dis_uops_0_0_bits_prs2 = io_ren_uops_0_bits_prs2;
	assign io_dis_uops_0_0_bits_prs1_busy = io_ren_uops_0_bits_prs1_busy;
	assign io_dis_uops_0_0_bits_prs2_busy = io_ren_uops_0_bits_prs2_busy;
	assign io_dis_uops_0_0_bits_ppred_busy = io_ren_uops_0_bits_ppred_busy;
	assign io_dis_uops_0_0_bits_exception = io_ren_uops_0_bits_exception;
	assign io_dis_uops_0_0_bits_uses_ldq = io_ren_uops_0_bits_uses_ldq;
	assign io_dis_uops_0_0_bits_uses_stq = io_ren_uops_0_bits_uses_stq;
	assign io_dis_uops_0_0_bits_dst_rtype = io_ren_uops_0_bits_dst_rtype;
	assign io_dis_uops_0_0_bits_lrs1_rtype = io_ren_uops_0_bits_lrs1_rtype;
	assign io_dis_uops_0_0_bits_lrs2_rtype = io_ren_uops_0_bits_lrs2_rtype;
	assign io_dis_uops_0_0_bits_fp_val = io_ren_uops_0_bits_fp_val;
endmodule
