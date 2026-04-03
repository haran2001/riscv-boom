module Arbiter3_BoomDCacheResp (
	io_in_0_ready,
	io_in_0_valid,
	io_in_0_bits_uop_inst,
	io_in_0_bits_uop_debug_inst,
	io_in_0_bits_uop_is_rvc,
	io_in_0_bits_uop_debug_pc,
	io_in_0_bits_uop_iq_type_0,
	io_in_0_bits_uop_iq_type_1,
	io_in_0_bits_uop_iq_type_2,
	io_in_0_bits_uop_iq_type_3,
	io_in_0_bits_uop_fu_code_0,
	io_in_0_bits_uop_fu_code_1,
	io_in_0_bits_uop_fu_code_2,
	io_in_0_bits_uop_fu_code_3,
	io_in_0_bits_uop_fu_code_4,
	io_in_0_bits_uop_fu_code_5,
	io_in_0_bits_uop_fu_code_6,
	io_in_0_bits_uop_fu_code_7,
	io_in_0_bits_uop_fu_code_8,
	io_in_0_bits_uop_fu_code_9,
	io_in_0_bits_uop_iw_issued,
	io_in_0_bits_uop_iw_issued_partial_agen,
	io_in_0_bits_uop_iw_issued_partial_dgen,
	io_in_0_bits_uop_iw_p1_speculative_child,
	io_in_0_bits_uop_iw_p2_speculative_child,
	io_in_0_bits_uop_iw_p1_bypass_hint,
	io_in_0_bits_uop_iw_p2_bypass_hint,
	io_in_0_bits_uop_iw_p3_bypass_hint,
	io_in_0_bits_uop_dis_col_sel,
	io_in_0_bits_uop_br_mask,
	io_in_0_bits_uop_br_tag,
	io_in_0_bits_uop_br_type,
	io_in_0_bits_uop_is_sfb,
	io_in_0_bits_uop_is_fence,
	io_in_0_bits_uop_is_fencei,
	io_in_0_bits_uop_is_sfence,
	io_in_0_bits_uop_is_amo,
	io_in_0_bits_uop_is_eret,
	io_in_0_bits_uop_is_sys_pc2epc,
	io_in_0_bits_uop_is_rocc,
	io_in_0_bits_uop_is_mov,
	io_in_0_bits_uop_ftq_idx,
	io_in_0_bits_uop_edge_inst,
	io_in_0_bits_uop_pc_lob,
	io_in_0_bits_uop_taken,
	io_in_0_bits_uop_imm_rename,
	io_in_0_bits_uop_imm_sel,
	io_in_0_bits_uop_pimm,
	io_in_0_bits_uop_imm_packed,
	io_in_0_bits_uop_op1_sel,
	io_in_0_bits_uop_op2_sel,
	io_in_0_bits_uop_fp_ctrl_ldst,
	io_in_0_bits_uop_fp_ctrl_wen,
	io_in_0_bits_uop_fp_ctrl_ren1,
	io_in_0_bits_uop_fp_ctrl_ren2,
	io_in_0_bits_uop_fp_ctrl_ren3,
	io_in_0_bits_uop_fp_ctrl_swap12,
	io_in_0_bits_uop_fp_ctrl_swap23,
	io_in_0_bits_uop_fp_ctrl_typeTagIn,
	io_in_0_bits_uop_fp_ctrl_typeTagOut,
	io_in_0_bits_uop_fp_ctrl_fromint,
	io_in_0_bits_uop_fp_ctrl_toint,
	io_in_0_bits_uop_fp_ctrl_fastpipe,
	io_in_0_bits_uop_fp_ctrl_fma,
	io_in_0_bits_uop_fp_ctrl_div,
	io_in_0_bits_uop_fp_ctrl_sqrt,
	io_in_0_bits_uop_fp_ctrl_wflags,
	io_in_0_bits_uop_fp_ctrl_vec,
	io_in_0_bits_uop_rob_idx,
	io_in_0_bits_uop_ldq_idx,
	io_in_0_bits_uop_stq_idx,
	io_in_0_bits_uop_rxq_idx,
	io_in_0_bits_uop_pdst,
	io_in_0_bits_uop_prs1,
	io_in_0_bits_uop_prs2,
	io_in_0_bits_uop_prs3,
	io_in_0_bits_uop_ppred,
	io_in_0_bits_uop_prs1_busy,
	io_in_0_bits_uop_prs2_busy,
	io_in_0_bits_uop_prs3_busy,
	io_in_0_bits_uop_ppred_busy,
	io_in_0_bits_uop_stale_pdst,
	io_in_0_bits_uop_exception,
	io_in_0_bits_uop_exc_cause,
	io_in_0_bits_uop_mem_cmd,
	io_in_0_bits_uop_mem_size,
	io_in_0_bits_uop_mem_signed,
	io_in_0_bits_uop_uses_ldq,
	io_in_0_bits_uop_uses_stq,
	io_in_0_bits_uop_is_unique,
	io_in_0_bits_uop_flush_on_commit,
	io_in_0_bits_uop_csr_cmd,
	io_in_0_bits_uop_ldst_is_rs1,
	io_in_0_bits_uop_ldst,
	io_in_0_bits_uop_lrs1,
	io_in_0_bits_uop_lrs2,
	io_in_0_bits_uop_lrs3,
	io_in_0_bits_uop_dst_rtype,
	io_in_0_bits_uop_lrs1_rtype,
	io_in_0_bits_uop_lrs2_rtype,
	io_in_0_bits_uop_frs3_en,
	io_in_0_bits_uop_fcn_dw,
	io_in_0_bits_uop_fcn_op,
	io_in_0_bits_uop_fp_val,
	io_in_0_bits_uop_fp_rm,
	io_in_0_bits_uop_fp_typ,
	io_in_0_bits_uop_xcpt_pf_if,
	io_in_0_bits_uop_xcpt_ae_if,
	io_in_0_bits_uop_xcpt_ma_if,
	io_in_0_bits_uop_bp_debug_if,
	io_in_0_bits_uop_bp_xcpt_if,
	io_in_0_bits_uop_debug_fsrc,
	io_in_0_bits_uop_debug_tsrc,
	io_in_0_bits_data,
	io_in_0_bits_is_hella,
	io_in_1_ready,
	io_in_1_valid,
	io_in_1_bits_uop_inst,
	io_in_1_bits_uop_debug_inst,
	io_in_1_bits_uop_is_rvc,
	io_in_1_bits_uop_debug_pc,
	io_in_1_bits_uop_iq_type_0,
	io_in_1_bits_uop_iq_type_1,
	io_in_1_bits_uop_iq_type_2,
	io_in_1_bits_uop_iq_type_3,
	io_in_1_bits_uop_fu_code_0,
	io_in_1_bits_uop_fu_code_1,
	io_in_1_bits_uop_fu_code_2,
	io_in_1_bits_uop_fu_code_3,
	io_in_1_bits_uop_fu_code_4,
	io_in_1_bits_uop_fu_code_5,
	io_in_1_bits_uop_fu_code_6,
	io_in_1_bits_uop_fu_code_7,
	io_in_1_bits_uop_fu_code_8,
	io_in_1_bits_uop_fu_code_9,
	io_in_1_bits_uop_iw_issued,
	io_in_1_bits_uop_iw_issued_partial_agen,
	io_in_1_bits_uop_iw_issued_partial_dgen,
	io_in_1_bits_uop_iw_p1_speculative_child,
	io_in_1_bits_uop_iw_p2_speculative_child,
	io_in_1_bits_uop_iw_p1_bypass_hint,
	io_in_1_bits_uop_iw_p2_bypass_hint,
	io_in_1_bits_uop_iw_p3_bypass_hint,
	io_in_1_bits_uop_dis_col_sel,
	io_in_1_bits_uop_br_mask,
	io_in_1_bits_uop_br_tag,
	io_in_1_bits_uop_br_type,
	io_in_1_bits_uop_is_sfb,
	io_in_1_bits_uop_is_fence,
	io_in_1_bits_uop_is_fencei,
	io_in_1_bits_uop_is_sfence,
	io_in_1_bits_uop_is_amo,
	io_in_1_bits_uop_is_eret,
	io_in_1_bits_uop_is_sys_pc2epc,
	io_in_1_bits_uop_is_rocc,
	io_in_1_bits_uop_is_mov,
	io_in_1_bits_uop_ftq_idx,
	io_in_1_bits_uop_edge_inst,
	io_in_1_bits_uop_pc_lob,
	io_in_1_bits_uop_taken,
	io_in_1_bits_uop_imm_rename,
	io_in_1_bits_uop_imm_sel,
	io_in_1_bits_uop_pimm,
	io_in_1_bits_uop_imm_packed,
	io_in_1_bits_uop_op1_sel,
	io_in_1_bits_uop_op2_sel,
	io_in_1_bits_uop_fp_ctrl_ldst,
	io_in_1_bits_uop_fp_ctrl_wen,
	io_in_1_bits_uop_fp_ctrl_ren1,
	io_in_1_bits_uop_fp_ctrl_ren2,
	io_in_1_bits_uop_fp_ctrl_ren3,
	io_in_1_bits_uop_fp_ctrl_swap12,
	io_in_1_bits_uop_fp_ctrl_swap23,
	io_in_1_bits_uop_fp_ctrl_typeTagIn,
	io_in_1_bits_uop_fp_ctrl_typeTagOut,
	io_in_1_bits_uop_fp_ctrl_fromint,
	io_in_1_bits_uop_fp_ctrl_toint,
	io_in_1_bits_uop_fp_ctrl_fastpipe,
	io_in_1_bits_uop_fp_ctrl_fma,
	io_in_1_bits_uop_fp_ctrl_div,
	io_in_1_bits_uop_fp_ctrl_sqrt,
	io_in_1_bits_uop_fp_ctrl_wflags,
	io_in_1_bits_uop_fp_ctrl_vec,
	io_in_1_bits_uop_rob_idx,
	io_in_1_bits_uop_ldq_idx,
	io_in_1_bits_uop_stq_idx,
	io_in_1_bits_uop_rxq_idx,
	io_in_1_bits_uop_pdst,
	io_in_1_bits_uop_prs1,
	io_in_1_bits_uop_prs2,
	io_in_1_bits_uop_prs3,
	io_in_1_bits_uop_ppred,
	io_in_1_bits_uop_prs1_busy,
	io_in_1_bits_uop_prs2_busy,
	io_in_1_bits_uop_prs3_busy,
	io_in_1_bits_uop_ppred_busy,
	io_in_1_bits_uop_stale_pdst,
	io_in_1_bits_uop_exception,
	io_in_1_bits_uop_exc_cause,
	io_in_1_bits_uop_mem_cmd,
	io_in_1_bits_uop_mem_size,
	io_in_1_bits_uop_mem_signed,
	io_in_1_bits_uop_uses_ldq,
	io_in_1_bits_uop_uses_stq,
	io_in_1_bits_uop_is_unique,
	io_in_1_bits_uop_flush_on_commit,
	io_in_1_bits_uop_csr_cmd,
	io_in_1_bits_uop_ldst_is_rs1,
	io_in_1_bits_uop_ldst,
	io_in_1_bits_uop_lrs1,
	io_in_1_bits_uop_lrs2,
	io_in_1_bits_uop_lrs3,
	io_in_1_bits_uop_dst_rtype,
	io_in_1_bits_uop_lrs1_rtype,
	io_in_1_bits_uop_lrs2_rtype,
	io_in_1_bits_uop_frs3_en,
	io_in_1_bits_uop_fcn_dw,
	io_in_1_bits_uop_fcn_op,
	io_in_1_bits_uop_fp_val,
	io_in_1_bits_uop_fp_rm,
	io_in_1_bits_uop_fp_typ,
	io_in_1_bits_uop_xcpt_pf_if,
	io_in_1_bits_uop_xcpt_ae_if,
	io_in_1_bits_uop_xcpt_ma_if,
	io_in_1_bits_uop_bp_debug_if,
	io_in_1_bits_uop_bp_xcpt_if,
	io_in_1_bits_uop_debug_fsrc,
	io_in_1_bits_uop_debug_tsrc,
	io_in_1_bits_data,
	io_in_1_bits_is_hella,
	io_in_2_ready,
	io_in_2_valid,
	io_in_2_bits_uop_inst,
	io_in_2_bits_uop_debug_inst,
	io_in_2_bits_uop_is_rvc,
	io_in_2_bits_uop_debug_pc,
	io_in_2_bits_uop_iq_type_0,
	io_in_2_bits_uop_iq_type_1,
	io_in_2_bits_uop_iq_type_2,
	io_in_2_bits_uop_iq_type_3,
	io_in_2_bits_uop_fu_code_0,
	io_in_2_bits_uop_fu_code_1,
	io_in_2_bits_uop_fu_code_2,
	io_in_2_bits_uop_fu_code_3,
	io_in_2_bits_uop_fu_code_4,
	io_in_2_bits_uop_fu_code_5,
	io_in_2_bits_uop_fu_code_6,
	io_in_2_bits_uop_fu_code_7,
	io_in_2_bits_uop_fu_code_8,
	io_in_2_bits_uop_fu_code_9,
	io_in_2_bits_uop_iw_issued,
	io_in_2_bits_uop_iw_issued_partial_agen,
	io_in_2_bits_uop_iw_issued_partial_dgen,
	io_in_2_bits_uop_iw_p1_speculative_child,
	io_in_2_bits_uop_iw_p2_speculative_child,
	io_in_2_bits_uop_iw_p1_bypass_hint,
	io_in_2_bits_uop_iw_p2_bypass_hint,
	io_in_2_bits_uop_iw_p3_bypass_hint,
	io_in_2_bits_uop_dis_col_sel,
	io_in_2_bits_uop_br_mask,
	io_in_2_bits_uop_br_tag,
	io_in_2_bits_uop_br_type,
	io_in_2_bits_uop_is_sfb,
	io_in_2_bits_uop_is_fence,
	io_in_2_bits_uop_is_fencei,
	io_in_2_bits_uop_is_sfence,
	io_in_2_bits_uop_is_amo,
	io_in_2_bits_uop_is_eret,
	io_in_2_bits_uop_is_sys_pc2epc,
	io_in_2_bits_uop_is_rocc,
	io_in_2_bits_uop_is_mov,
	io_in_2_bits_uop_ftq_idx,
	io_in_2_bits_uop_edge_inst,
	io_in_2_bits_uop_pc_lob,
	io_in_2_bits_uop_taken,
	io_in_2_bits_uop_imm_rename,
	io_in_2_bits_uop_imm_sel,
	io_in_2_bits_uop_pimm,
	io_in_2_bits_uop_imm_packed,
	io_in_2_bits_uop_op1_sel,
	io_in_2_bits_uop_op2_sel,
	io_in_2_bits_uop_fp_ctrl_ldst,
	io_in_2_bits_uop_fp_ctrl_wen,
	io_in_2_bits_uop_fp_ctrl_ren1,
	io_in_2_bits_uop_fp_ctrl_ren2,
	io_in_2_bits_uop_fp_ctrl_ren3,
	io_in_2_bits_uop_fp_ctrl_swap12,
	io_in_2_bits_uop_fp_ctrl_swap23,
	io_in_2_bits_uop_fp_ctrl_typeTagIn,
	io_in_2_bits_uop_fp_ctrl_typeTagOut,
	io_in_2_bits_uop_fp_ctrl_fromint,
	io_in_2_bits_uop_fp_ctrl_toint,
	io_in_2_bits_uop_fp_ctrl_fastpipe,
	io_in_2_bits_uop_fp_ctrl_fma,
	io_in_2_bits_uop_fp_ctrl_div,
	io_in_2_bits_uop_fp_ctrl_sqrt,
	io_in_2_bits_uop_fp_ctrl_wflags,
	io_in_2_bits_uop_fp_ctrl_vec,
	io_in_2_bits_uop_rob_idx,
	io_in_2_bits_uop_ldq_idx,
	io_in_2_bits_uop_stq_idx,
	io_in_2_bits_uop_rxq_idx,
	io_in_2_bits_uop_pdst,
	io_in_2_bits_uop_prs1,
	io_in_2_bits_uop_prs2,
	io_in_2_bits_uop_prs3,
	io_in_2_bits_uop_ppred,
	io_in_2_bits_uop_prs1_busy,
	io_in_2_bits_uop_prs2_busy,
	io_in_2_bits_uop_prs3_busy,
	io_in_2_bits_uop_ppred_busy,
	io_in_2_bits_uop_stale_pdst,
	io_in_2_bits_uop_exception,
	io_in_2_bits_uop_exc_cause,
	io_in_2_bits_uop_mem_cmd,
	io_in_2_bits_uop_mem_size,
	io_in_2_bits_uop_mem_signed,
	io_in_2_bits_uop_uses_ldq,
	io_in_2_bits_uop_uses_stq,
	io_in_2_bits_uop_is_unique,
	io_in_2_bits_uop_flush_on_commit,
	io_in_2_bits_uop_csr_cmd,
	io_in_2_bits_uop_ldst_is_rs1,
	io_in_2_bits_uop_ldst,
	io_in_2_bits_uop_lrs1,
	io_in_2_bits_uop_lrs2,
	io_in_2_bits_uop_lrs3,
	io_in_2_bits_uop_dst_rtype,
	io_in_2_bits_uop_lrs1_rtype,
	io_in_2_bits_uop_lrs2_rtype,
	io_in_2_bits_uop_frs3_en,
	io_in_2_bits_uop_fcn_dw,
	io_in_2_bits_uop_fcn_op,
	io_in_2_bits_uop_fp_val,
	io_in_2_bits_uop_fp_rm,
	io_in_2_bits_uop_fp_typ,
	io_in_2_bits_uop_xcpt_pf_if,
	io_in_2_bits_uop_xcpt_ae_if,
	io_in_2_bits_uop_xcpt_ma_if,
	io_in_2_bits_uop_bp_debug_if,
	io_in_2_bits_uop_bp_xcpt_if,
	io_in_2_bits_uop_debug_fsrc,
	io_in_2_bits_uop_debug_tsrc,
	io_in_2_bits_data,
	io_in_2_bits_is_hella,
	io_out_ready,
	io_out_valid,
	io_out_bits_uop_inst,
	io_out_bits_uop_debug_inst,
	io_out_bits_uop_is_rvc,
	io_out_bits_uop_debug_pc,
	io_out_bits_uop_iq_type_0,
	io_out_bits_uop_iq_type_1,
	io_out_bits_uop_iq_type_2,
	io_out_bits_uop_iq_type_3,
	io_out_bits_uop_fu_code_0,
	io_out_bits_uop_fu_code_1,
	io_out_bits_uop_fu_code_2,
	io_out_bits_uop_fu_code_3,
	io_out_bits_uop_fu_code_4,
	io_out_bits_uop_fu_code_5,
	io_out_bits_uop_fu_code_6,
	io_out_bits_uop_fu_code_7,
	io_out_bits_uop_fu_code_8,
	io_out_bits_uop_fu_code_9,
	io_out_bits_uop_iw_issued,
	io_out_bits_uop_iw_issued_partial_agen,
	io_out_bits_uop_iw_issued_partial_dgen,
	io_out_bits_uop_iw_p1_speculative_child,
	io_out_bits_uop_iw_p2_speculative_child,
	io_out_bits_uop_iw_p1_bypass_hint,
	io_out_bits_uop_iw_p2_bypass_hint,
	io_out_bits_uop_iw_p3_bypass_hint,
	io_out_bits_uop_dis_col_sel,
	io_out_bits_uop_br_mask,
	io_out_bits_uop_br_tag,
	io_out_bits_uop_br_type,
	io_out_bits_uop_is_sfb,
	io_out_bits_uop_is_fence,
	io_out_bits_uop_is_fencei,
	io_out_bits_uop_is_sfence,
	io_out_bits_uop_is_amo,
	io_out_bits_uop_is_eret,
	io_out_bits_uop_is_sys_pc2epc,
	io_out_bits_uop_is_rocc,
	io_out_bits_uop_is_mov,
	io_out_bits_uop_ftq_idx,
	io_out_bits_uop_edge_inst,
	io_out_bits_uop_pc_lob,
	io_out_bits_uop_taken,
	io_out_bits_uop_imm_rename,
	io_out_bits_uop_imm_sel,
	io_out_bits_uop_pimm,
	io_out_bits_uop_imm_packed,
	io_out_bits_uop_op1_sel,
	io_out_bits_uop_op2_sel,
	io_out_bits_uop_fp_ctrl_ldst,
	io_out_bits_uop_fp_ctrl_wen,
	io_out_bits_uop_fp_ctrl_ren1,
	io_out_bits_uop_fp_ctrl_ren2,
	io_out_bits_uop_fp_ctrl_ren3,
	io_out_bits_uop_fp_ctrl_swap12,
	io_out_bits_uop_fp_ctrl_swap23,
	io_out_bits_uop_fp_ctrl_typeTagIn,
	io_out_bits_uop_fp_ctrl_typeTagOut,
	io_out_bits_uop_fp_ctrl_fromint,
	io_out_bits_uop_fp_ctrl_toint,
	io_out_bits_uop_fp_ctrl_fastpipe,
	io_out_bits_uop_fp_ctrl_fma,
	io_out_bits_uop_fp_ctrl_div,
	io_out_bits_uop_fp_ctrl_sqrt,
	io_out_bits_uop_fp_ctrl_wflags,
	io_out_bits_uop_fp_ctrl_vec,
	io_out_bits_uop_rob_idx,
	io_out_bits_uop_ldq_idx,
	io_out_bits_uop_stq_idx,
	io_out_bits_uop_rxq_idx,
	io_out_bits_uop_pdst,
	io_out_bits_uop_prs1,
	io_out_bits_uop_prs2,
	io_out_bits_uop_prs3,
	io_out_bits_uop_ppred,
	io_out_bits_uop_prs1_busy,
	io_out_bits_uop_prs2_busy,
	io_out_bits_uop_prs3_busy,
	io_out_bits_uop_ppred_busy,
	io_out_bits_uop_stale_pdst,
	io_out_bits_uop_exception,
	io_out_bits_uop_exc_cause,
	io_out_bits_uop_mem_cmd,
	io_out_bits_uop_mem_size,
	io_out_bits_uop_mem_signed,
	io_out_bits_uop_uses_ldq,
	io_out_bits_uop_uses_stq,
	io_out_bits_uop_is_unique,
	io_out_bits_uop_flush_on_commit,
	io_out_bits_uop_csr_cmd,
	io_out_bits_uop_ldst_is_rs1,
	io_out_bits_uop_ldst,
	io_out_bits_uop_lrs1,
	io_out_bits_uop_lrs2,
	io_out_bits_uop_lrs3,
	io_out_bits_uop_dst_rtype,
	io_out_bits_uop_lrs1_rtype,
	io_out_bits_uop_lrs2_rtype,
	io_out_bits_uop_frs3_en,
	io_out_bits_uop_fcn_dw,
	io_out_bits_uop_fcn_op,
	io_out_bits_uop_fp_val,
	io_out_bits_uop_fp_rm,
	io_out_bits_uop_fp_typ,
	io_out_bits_uop_xcpt_pf_if,
	io_out_bits_uop_xcpt_ae_if,
	io_out_bits_uop_xcpt_ma_if,
	io_out_bits_uop_bp_debug_if,
	io_out_bits_uop_bp_xcpt_if,
	io_out_bits_uop_debug_fsrc,
	io_out_bits_uop_debug_tsrc,
	io_out_bits_data,
	io_out_bits_is_hella
);
	output wire io_in_0_ready;
	input io_in_0_valid;
	input [31:0] io_in_0_bits_uop_inst;
	input [31:0] io_in_0_bits_uop_debug_inst;
	input io_in_0_bits_uop_is_rvc;
	input [39:0] io_in_0_bits_uop_debug_pc;
	input io_in_0_bits_uop_iq_type_0;
	input io_in_0_bits_uop_iq_type_1;
	input io_in_0_bits_uop_iq_type_2;
	input io_in_0_bits_uop_iq_type_3;
	input io_in_0_bits_uop_fu_code_0;
	input io_in_0_bits_uop_fu_code_1;
	input io_in_0_bits_uop_fu_code_2;
	input io_in_0_bits_uop_fu_code_3;
	input io_in_0_bits_uop_fu_code_4;
	input io_in_0_bits_uop_fu_code_5;
	input io_in_0_bits_uop_fu_code_6;
	input io_in_0_bits_uop_fu_code_7;
	input io_in_0_bits_uop_fu_code_8;
	input io_in_0_bits_uop_fu_code_9;
	input io_in_0_bits_uop_iw_issued;
	input io_in_0_bits_uop_iw_issued_partial_agen;
	input io_in_0_bits_uop_iw_issued_partial_dgen;
	input io_in_0_bits_uop_iw_p1_speculative_child;
	input io_in_0_bits_uop_iw_p2_speculative_child;
	input io_in_0_bits_uop_iw_p1_bypass_hint;
	input io_in_0_bits_uop_iw_p2_bypass_hint;
	input io_in_0_bits_uop_iw_p3_bypass_hint;
	input io_in_0_bits_uop_dis_col_sel;
	input [7:0] io_in_0_bits_uop_br_mask;
	input [2:0] io_in_0_bits_uop_br_tag;
	input [3:0] io_in_0_bits_uop_br_type;
	input io_in_0_bits_uop_is_sfb;
	input io_in_0_bits_uop_is_fence;
	input io_in_0_bits_uop_is_fencei;
	input io_in_0_bits_uop_is_sfence;
	input io_in_0_bits_uop_is_amo;
	input io_in_0_bits_uop_is_eret;
	input io_in_0_bits_uop_is_sys_pc2epc;
	input io_in_0_bits_uop_is_rocc;
	input io_in_0_bits_uop_is_mov;
	input [3:0] io_in_0_bits_uop_ftq_idx;
	input io_in_0_bits_uop_edge_inst;
	input [5:0] io_in_0_bits_uop_pc_lob;
	input io_in_0_bits_uop_taken;
	input io_in_0_bits_uop_imm_rename;
	input [2:0] io_in_0_bits_uop_imm_sel;
	input [4:0] io_in_0_bits_uop_pimm;
	input [19:0] io_in_0_bits_uop_imm_packed;
	input [1:0] io_in_0_bits_uop_op1_sel;
	input [2:0] io_in_0_bits_uop_op2_sel;
	input io_in_0_bits_uop_fp_ctrl_ldst;
	input io_in_0_bits_uop_fp_ctrl_wen;
	input io_in_0_bits_uop_fp_ctrl_ren1;
	input io_in_0_bits_uop_fp_ctrl_ren2;
	input io_in_0_bits_uop_fp_ctrl_ren3;
	input io_in_0_bits_uop_fp_ctrl_swap12;
	input io_in_0_bits_uop_fp_ctrl_swap23;
	input [1:0] io_in_0_bits_uop_fp_ctrl_typeTagIn;
	input [1:0] io_in_0_bits_uop_fp_ctrl_typeTagOut;
	input io_in_0_bits_uop_fp_ctrl_fromint;
	input io_in_0_bits_uop_fp_ctrl_toint;
	input io_in_0_bits_uop_fp_ctrl_fastpipe;
	input io_in_0_bits_uop_fp_ctrl_fma;
	input io_in_0_bits_uop_fp_ctrl_div;
	input io_in_0_bits_uop_fp_ctrl_sqrt;
	input io_in_0_bits_uop_fp_ctrl_wflags;
	input io_in_0_bits_uop_fp_ctrl_vec;
	input [4:0] io_in_0_bits_uop_rob_idx;
	input [3:0] io_in_0_bits_uop_ldq_idx;
	input [3:0] io_in_0_bits_uop_stq_idx;
	input [1:0] io_in_0_bits_uop_rxq_idx;
	input [5:0] io_in_0_bits_uop_pdst;
	input [5:0] io_in_0_bits_uop_prs1;
	input [5:0] io_in_0_bits_uop_prs2;
	input [5:0] io_in_0_bits_uop_prs3;
	input [3:0] io_in_0_bits_uop_ppred;
	input io_in_0_bits_uop_prs1_busy;
	input io_in_0_bits_uop_prs2_busy;
	input io_in_0_bits_uop_prs3_busy;
	input io_in_0_bits_uop_ppred_busy;
	input [5:0] io_in_0_bits_uop_stale_pdst;
	input io_in_0_bits_uop_exception;
	input [63:0] io_in_0_bits_uop_exc_cause;
	input [4:0] io_in_0_bits_uop_mem_cmd;
	input [1:0] io_in_0_bits_uop_mem_size;
	input io_in_0_bits_uop_mem_signed;
	input io_in_0_bits_uop_uses_ldq;
	input io_in_0_bits_uop_uses_stq;
	input io_in_0_bits_uop_is_unique;
	input io_in_0_bits_uop_flush_on_commit;
	input [2:0] io_in_0_bits_uop_csr_cmd;
	input io_in_0_bits_uop_ldst_is_rs1;
	input [5:0] io_in_0_bits_uop_ldst;
	input [5:0] io_in_0_bits_uop_lrs1;
	input [5:0] io_in_0_bits_uop_lrs2;
	input [5:0] io_in_0_bits_uop_lrs3;
	input [1:0] io_in_0_bits_uop_dst_rtype;
	input [1:0] io_in_0_bits_uop_lrs1_rtype;
	input [1:0] io_in_0_bits_uop_lrs2_rtype;
	input io_in_0_bits_uop_frs3_en;
	input io_in_0_bits_uop_fcn_dw;
	input [4:0] io_in_0_bits_uop_fcn_op;
	input io_in_0_bits_uop_fp_val;
	input [2:0] io_in_0_bits_uop_fp_rm;
	input [1:0] io_in_0_bits_uop_fp_typ;
	input io_in_0_bits_uop_xcpt_pf_if;
	input io_in_0_bits_uop_xcpt_ae_if;
	input io_in_0_bits_uop_xcpt_ma_if;
	input io_in_0_bits_uop_bp_debug_if;
	input io_in_0_bits_uop_bp_xcpt_if;
	input [2:0] io_in_0_bits_uop_debug_fsrc;
	input [2:0] io_in_0_bits_uop_debug_tsrc;
	input [63:0] io_in_0_bits_data;
	input io_in_0_bits_is_hella;
	output wire io_in_1_ready;
	input io_in_1_valid;
	input [31:0] io_in_1_bits_uop_inst;
	input [31:0] io_in_1_bits_uop_debug_inst;
	input io_in_1_bits_uop_is_rvc;
	input [39:0] io_in_1_bits_uop_debug_pc;
	input io_in_1_bits_uop_iq_type_0;
	input io_in_1_bits_uop_iq_type_1;
	input io_in_1_bits_uop_iq_type_2;
	input io_in_1_bits_uop_iq_type_3;
	input io_in_1_bits_uop_fu_code_0;
	input io_in_1_bits_uop_fu_code_1;
	input io_in_1_bits_uop_fu_code_2;
	input io_in_1_bits_uop_fu_code_3;
	input io_in_1_bits_uop_fu_code_4;
	input io_in_1_bits_uop_fu_code_5;
	input io_in_1_bits_uop_fu_code_6;
	input io_in_1_bits_uop_fu_code_7;
	input io_in_1_bits_uop_fu_code_8;
	input io_in_1_bits_uop_fu_code_9;
	input io_in_1_bits_uop_iw_issued;
	input io_in_1_bits_uop_iw_issued_partial_agen;
	input io_in_1_bits_uop_iw_issued_partial_dgen;
	input io_in_1_bits_uop_iw_p1_speculative_child;
	input io_in_1_bits_uop_iw_p2_speculative_child;
	input io_in_1_bits_uop_iw_p1_bypass_hint;
	input io_in_1_bits_uop_iw_p2_bypass_hint;
	input io_in_1_bits_uop_iw_p3_bypass_hint;
	input io_in_1_bits_uop_dis_col_sel;
	input [7:0] io_in_1_bits_uop_br_mask;
	input [2:0] io_in_1_bits_uop_br_tag;
	input [3:0] io_in_1_bits_uop_br_type;
	input io_in_1_bits_uop_is_sfb;
	input io_in_1_bits_uop_is_fence;
	input io_in_1_bits_uop_is_fencei;
	input io_in_1_bits_uop_is_sfence;
	input io_in_1_bits_uop_is_amo;
	input io_in_1_bits_uop_is_eret;
	input io_in_1_bits_uop_is_sys_pc2epc;
	input io_in_1_bits_uop_is_rocc;
	input io_in_1_bits_uop_is_mov;
	input [3:0] io_in_1_bits_uop_ftq_idx;
	input io_in_1_bits_uop_edge_inst;
	input [5:0] io_in_1_bits_uop_pc_lob;
	input io_in_1_bits_uop_taken;
	input io_in_1_bits_uop_imm_rename;
	input [2:0] io_in_1_bits_uop_imm_sel;
	input [4:0] io_in_1_bits_uop_pimm;
	input [19:0] io_in_1_bits_uop_imm_packed;
	input [1:0] io_in_1_bits_uop_op1_sel;
	input [2:0] io_in_1_bits_uop_op2_sel;
	input io_in_1_bits_uop_fp_ctrl_ldst;
	input io_in_1_bits_uop_fp_ctrl_wen;
	input io_in_1_bits_uop_fp_ctrl_ren1;
	input io_in_1_bits_uop_fp_ctrl_ren2;
	input io_in_1_bits_uop_fp_ctrl_ren3;
	input io_in_1_bits_uop_fp_ctrl_swap12;
	input io_in_1_bits_uop_fp_ctrl_swap23;
	input [1:0] io_in_1_bits_uop_fp_ctrl_typeTagIn;
	input [1:0] io_in_1_bits_uop_fp_ctrl_typeTagOut;
	input io_in_1_bits_uop_fp_ctrl_fromint;
	input io_in_1_bits_uop_fp_ctrl_toint;
	input io_in_1_bits_uop_fp_ctrl_fastpipe;
	input io_in_1_bits_uop_fp_ctrl_fma;
	input io_in_1_bits_uop_fp_ctrl_div;
	input io_in_1_bits_uop_fp_ctrl_sqrt;
	input io_in_1_bits_uop_fp_ctrl_wflags;
	input io_in_1_bits_uop_fp_ctrl_vec;
	input [4:0] io_in_1_bits_uop_rob_idx;
	input [3:0] io_in_1_bits_uop_ldq_idx;
	input [3:0] io_in_1_bits_uop_stq_idx;
	input [1:0] io_in_1_bits_uop_rxq_idx;
	input [5:0] io_in_1_bits_uop_pdst;
	input [5:0] io_in_1_bits_uop_prs1;
	input [5:0] io_in_1_bits_uop_prs2;
	input [5:0] io_in_1_bits_uop_prs3;
	input [3:0] io_in_1_bits_uop_ppred;
	input io_in_1_bits_uop_prs1_busy;
	input io_in_1_bits_uop_prs2_busy;
	input io_in_1_bits_uop_prs3_busy;
	input io_in_1_bits_uop_ppred_busy;
	input [5:0] io_in_1_bits_uop_stale_pdst;
	input io_in_1_bits_uop_exception;
	input [63:0] io_in_1_bits_uop_exc_cause;
	input [4:0] io_in_1_bits_uop_mem_cmd;
	input [1:0] io_in_1_bits_uop_mem_size;
	input io_in_1_bits_uop_mem_signed;
	input io_in_1_bits_uop_uses_ldq;
	input io_in_1_bits_uop_uses_stq;
	input io_in_1_bits_uop_is_unique;
	input io_in_1_bits_uop_flush_on_commit;
	input [2:0] io_in_1_bits_uop_csr_cmd;
	input io_in_1_bits_uop_ldst_is_rs1;
	input [5:0] io_in_1_bits_uop_ldst;
	input [5:0] io_in_1_bits_uop_lrs1;
	input [5:0] io_in_1_bits_uop_lrs2;
	input [5:0] io_in_1_bits_uop_lrs3;
	input [1:0] io_in_1_bits_uop_dst_rtype;
	input [1:0] io_in_1_bits_uop_lrs1_rtype;
	input [1:0] io_in_1_bits_uop_lrs2_rtype;
	input io_in_1_bits_uop_frs3_en;
	input io_in_1_bits_uop_fcn_dw;
	input [4:0] io_in_1_bits_uop_fcn_op;
	input io_in_1_bits_uop_fp_val;
	input [2:0] io_in_1_bits_uop_fp_rm;
	input [1:0] io_in_1_bits_uop_fp_typ;
	input io_in_1_bits_uop_xcpt_pf_if;
	input io_in_1_bits_uop_xcpt_ae_if;
	input io_in_1_bits_uop_xcpt_ma_if;
	input io_in_1_bits_uop_bp_debug_if;
	input io_in_1_bits_uop_bp_xcpt_if;
	input [2:0] io_in_1_bits_uop_debug_fsrc;
	input [2:0] io_in_1_bits_uop_debug_tsrc;
	input [63:0] io_in_1_bits_data;
	input io_in_1_bits_is_hella;
	output wire io_in_2_ready;
	input io_in_2_valid;
	input [31:0] io_in_2_bits_uop_inst;
	input [31:0] io_in_2_bits_uop_debug_inst;
	input io_in_2_bits_uop_is_rvc;
	input [39:0] io_in_2_bits_uop_debug_pc;
	input io_in_2_bits_uop_iq_type_0;
	input io_in_2_bits_uop_iq_type_1;
	input io_in_2_bits_uop_iq_type_2;
	input io_in_2_bits_uop_iq_type_3;
	input io_in_2_bits_uop_fu_code_0;
	input io_in_2_bits_uop_fu_code_1;
	input io_in_2_bits_uop_fu_code_2;
	input io_in_2_bits_uop_fu_code_3;
	input io_in_2_bits_uop_fu_code_4;
	input io_in_2_bits_uop_fu_code_5;
	input io_in_2_bits_uop_fu_code_6;
	input io_in_2_bits_uop_fu_code_7;
	input io_in_2_bits_uop_fu_code_8;
	input io_in_2_bits_uop_fu_code_9;
	input io_in_2_bits_uop_iw_issued;
	input io_in_2_bits_uop_iw_issued_partial_agen;
	input io_in_2_bits_uop_iw_issued_partial_dgen;
	input io_in_2_bits_uop_iw_p1_speculative_child;
	input io_in_2_bits_uop_iw_p2_speculative_child;
	input io_in_2_bits_uop_iw_p1_bypass_hint;
	input io_in_2_bits_uop_iw_p2_bypass_hint;
	input io_in_2_bits_uop_iw_p3_bypass_hint;
	input io_in_2_bits_uop_dis_col_sel;
	input [7:0] io_in_2_bits_uop_br_mask;
	input [2:0] io_in_2_bits_uop_br_tag;
	input [3:0] io_in_2_bits_uop_br_type;
	input io_in_2_bits_uop_is_sfb;
	input io_in_2_bits_uop_is_fence;
	input io_in_2_bits_uop_is_fencei;
	input io_in_2_bits_uop_is_sfence;
	input io_in_2_bits_uop_is_amo;
	input io_in_2_bits_uop_is_eret;
	input io_in_2_bits_uop_is_sys_pc2epc;
	input io_in_2_bits_uop_is_rocc;
	input io_in_2_bits_uop_is_mov;
	input [3:0] io_in_2_bits_uop_ftq_idx;
	input io_in_2_bits_uop_edge_inst;
	input [5:0] io_in_2_bits_uop_pc_lob;
	input io_in_2_bits_uop_taken;
	input io_in_2_bits_uop_imm_rename;
	input [2:0] io_in_2_bits_uop_imm_sel;
	input [4:0] io_in_2_bits_uop_pimm;
	input [19:0] io_in_2_bits_uop_imm_packed;
	input [1:0] io_in_2_bits_uop_op1_sel;
	input [2:0] io_in_2_bits_uop_op2_sel;
	input io_in_2_bits_uop_fp_ctrl_ldst;
	input io_in_2_bits_uop_fp_ctrl_wen;
	input io_in_2_bits_uop_fp_ctrl_ren1;
	input io_in_2_bits_uop_fp_ctrl_ren2;
	input io_in_2_bits_uop_fp_ctrl_ren3;
	input io_in_2_bits_uop_fp_ctrl_swap12;
	input io_in_2_bits_uop_fp_ctrl_swap23;
	input [1:0] io_in_2_bits_uop_fp_ctrl_typeTagIn;
	input [1:0] io_in_2_bits_uop_fp_ctrl_typeTagOut;
	input io_in_2_bits_uop_fp_ctrl_fromint;
	input io_in_2_bits_uop_fp_ctrl_toint;
	input io_in_2_bits_uop_fp_ctrl_fastpipe;
	input io_in_2_bits_uop_fp_ctrl_fma;
	input io_in_2_bits_uop_fp_ctrl_div;
	input io_in_2_bits_uop_fp_ctrl_sqrt;
	input io_in_2_bits_uop_fp_ctrl_wflags;
	input io_in_2_bits_uop_fp_ctrl_vec;
	input [4:0] io_in_2_bits_uop_rob_idx;
	input [3:0] io_in_2_bits_uop_ldq_idx;
	input [3:0] io_in_2_bits_uop_stq_idx;
	input [1:0] io_in_2_bits_uop_rxq_idx;
	input [5:0] io_in_2_bits_uop_pdst;
	input [5:0] io_in_2_bits_uop_prs1;
	input [5:0] io_in_2_bits_uop_prs2;
	input [5:0] io_in_2_bits_uop_prs3;
	input [3:0] io_in_2_bits_uop_ppred;
	input io_in_2_bits_uop_prs1_busy;
	input io_in_2_bits_uop_prs2_busy;
	input io_in_2_bits_uop_prs3_busy;
	input io_in_2_bits_uop_ppred_busy;
	input [5:0] io_in_2_bits_uop_stale_pdst;
	input io_in_2_bits_uop_exception;
	input [63:0] io_in_2_bits_uop_exc_cause;
	input [4:0] io_in_2_bits_uop_mem_cmd;
	input [1:0] io_in_2_bits_uop_mem_size;
	input io_in_2_bits_uop_mem_signed;
	input io_in_2_bits_uop_uses_ldq;
	input io_in_2_bits_uop_uses_stq;
	input io_in_2_bits_uop_is_unique;
	input io_in_2_bits_uop_flush_on_commit;
	input [2:0] io_in_2_bits_uop_csr_cmd;
	input io_in_2_bits_uop_ldst_is_rs1;
	input [5:0] io_in_2_bits_uop_ldst;
	input [5:0] io_in_2_bits_uop_lrs1;
	input [5:0] io_in_2_bits_uop_lrs2;
	input [5:0] io_in_2_bits_uop_lrs3;
	input [1:0] io_in_2_bits_uop_dst_rtype;
	input [1:0] io_in_2_bits_uop_lrs1_rtype;
	input [1:0] io_in_2_bits_uop_lrs2_rtype;
	input io_in_2_bits_uop_frs3_en;
	input io_in_2_bits_uop_fcn_dw;
	input [4:0] io_in_2_bits_uop_fcn_op;
	input io_in_2_bits_uop_fp_val;
	input [2:0] io_in_2_bits_uop_fp_rm;
	input [1:0] io_in_2_bits_uop_fp_typ;
	input io_in_2_bits_uop_xcpt_pf_if;
	input io_in_2_bits_uop_xcpt_ae_if;
	input io_in_2_bits_uop_xcpt_ma_if;
	input io_in_2_bits_uop_bp_debug_if;
	input io_in_2_bits_uop_bp_xcpt_if;
	input [2:0] io_in_2_bits_uop_debug_fsrc;
	input [2:0] io_in_2_bits_uop_debug_tsrc;
	input [63:0] io_in_2_bits_data;
	input io_in_2_bits_is_hella;
	input io_out_ready;
	output wire io_out_valid;
	output wire [31:0] io_out_bits_uop_inst;
	output wire [31:0] io_out_bits_uop_debug_inst;
	output wire io_out_bits_uop_is_rvc;
	output wire [39:0] io_out_bits_uop_debug_pc;
	output wire io_out_bits_uop_iq_type_0;
	output wire io_out_bits_uop_iq_type_1;
	output wire io_out_bits_uop_iq_type_2;
	output wire io_out_bits_uop_iq_type_3;
	output wire io_out_bits_uop_fu_code_0;
	output wire io_out_bits_uop_fu_code_1;
	output wire io_out_bits_uop_fu_code_2;
	output wire io_out_bits_uop_fu_code_3;
	output wire io_out_bits_uop_fu_code_4;
	output wire io_out_bits_uop_fu_code_5;
	output wire io_out_bits_uop_fu_code_6;
	output wire io_out_bits_uop_fu_code_7;
	output wire io_out_bits_uop_fu_code_8;
	output wire io_out_bits_uop_fu_code_9;
	output wire io_out_bits_uop_iw_issued;
	output wire io_out_bits_uop_iw_issued_partial_agen;
	output wire io_out_bits_uop_iw_issued_partial_dgen;
	output wire io_out_bits_uop_iw_p1_speculative_child;
	output wire io_out_bits_uop_iw_p2_speculative_child;
	output wire io_out_bits_uop_iw_p1_bypass_hint;
	output wire io_out_bits_uop_iw_p2_bypass_hint;
	output wire io_out_bits_uop_iw_p3_bypass_hint;
	output wire io_out_bits_uop_dis_col_sel;
	output wire [7:0] io_out_bits_uop_br_mask;
	output wire [2:0] io_out_bits_uop_br_tag;
	output wire [3:0] io_out_bits_uop_br_type;
	output wire io_out_bits_uop_is_sfb;
	output wire io_out_bits_uop_is_fence;
	output wire io_out_bits_uop_is_fencei;
	output wire io_out_bits_uop_is_sfence;
	output wire io_out_bits_uop_is_amo;
	output wire io_out_bits_uop_is_eret;
	output wire io_out_bits_uop_is_sys_pc2epc;
	output wire io_out_bits_uop_is_rocc;
	output wire io_out_bits_uop_is_mov;
	output wire [3:0] io_out_bits_uop_ftq_idx;
	output wire io_out_bits_uop_edge_inst;
	output wire [5:0] io_out_bits_uop_pc_lob;
	output wire io_out_bits_uop_taken;
	output wire io_out_bits_uop_imm_rename;
	output wire [2:0] io_out_bits_uop_imm_sel;
	output wire [4:0] io_out_bits_uop_pimm;
	output wire [19:0] io_out_bits_uop_imm_packed;
	output wire [1:0] io_out_bits_uop_op1_sel;
	output wire [2:0] io_out_bits_uop_op2_sel;
	output wire io_out_bits_uop_fp_ctrl_ldst;
	output wire io_out_bits_uop_fp_ctrl_wen;
	output wire io_out_bits_uop_fp_ctrl_ren1;
	output wire io_out_bits_uop_fp_ctrl_ren2;
	output wire io_out_bits_uop_fp_ctrl_ren3;
	output wire io_out_bits_uop_fp_ctrl_swap12;
	output wire io_out_bits_uop_fp_ctrl_swap23;
	output wire [1:0] io_out_bits_uop_fp_ctrl_typeTagIn;
	output wire [1:0] io_out_bits_uop_fp_ctrl_typeTagOut;
	output wire io_out_bits_uop_fp_ctrl_fromint;
	output wire io_out_bits_uop_fp_ctrl_toint;
	output wire io_out_bits_uop_fp_ctrl_fastpipe;
	output wire io_out_bits_uop_fp_ctrl_fma;
	output wire io_out_bits_uop_fp_ctrl_div;
	output wire io_out_bits_uop_fp_ctrl_sqrt;
	output wire io_out_bits_uop_fp_ctrl_wflags;
	output wire io_out_bits_uop_fp_ctrl_vec;
	output wire [4:0] io_out_bits_uop_rob_idx;
	output wire [3:0] io_out_bits_uop_ldq_idx;
	output wire [3:0] io_out_bits_uop_stq_idx;
	output wire [1:0] io_out_bits_uop_rxq_idx;
	output wire [5:0] io_out_bits_uop_pdst;
	output wire [5:0] io_out_bits_uop_prs1;
	output wire [5:0] io_out_bits_uop_prs2;
	output wire [5:0] io_out_bits_uop_prs3;
	output wire [3:0] io_out_bits_uop_ppred;
	output wire io_out_bits_uop_prs1_busy;
	output wire io_out_bits_uop_prs2_busy;
	output wire io_out_bits_uop_prs3_busy;
	output wire io_out_bits_uop_ppred_busy;
	output wire [5:0] io_out_bits_uop_stale_pdst;
	output wire io_out_bits_uop_exception;
	output wire [63:0] io_out_bits_uop_exc_cause;
	output wire [4:0] io_out_bits_uop_mem_cmd;
	output wire [1:0] io_out_bits_uop_mem_size;
	output wire io_out_bits_uop_mem_signed;
	output wire io_out_bits_uop_uses_ldq;
	output wire io_out_bits_uop_uses_stq;
	output wire io_out_bits_uop_is_unique;
	output wire io_out_bits_uop_flush_on_commit;
	output wire [2:0] io_out_bits_uop_csr_cmd;
	output wire io_out_bits_uop_ldst_is_rs1;
	output wire [5:0] io_out_bits_uop_ldst;
	output wire [5:0] io_out_bits_uop_lrs1;
	output wire [5:0] io_out_bits_uop_lrs2;
	output wire [5:0] io_out_bits_uop_lrs3;
	output wire [1:0] io_out_bits_uop_dst_rtype;
	output wire [1:0] io_out_bits_uop_lrs1_rtype;
	output wire [1:0] io_out_bits_uop_lrs2_rtype;
	output wire io_out_bits_uop_frs3_en;
	output wire io_out_bits_uop_fcn_dw;
	output wire [4:0] io_out_bits_uop_fcn_op;
	output wire io_out_bits_uop_fp_val;
	output wire [2:0] io_out_bits_uop_fp_rm;
	output wire [1:0] io_out_bits_uop_fp_typ;
	output wire io_out_bits_uop_xcpt_pf_if;
	output wire io_out_bits_uop_xcpt_ae_if;
	output wire io_out_bits_uop_xcpt_ma_if;
	output wire io_out_bits_uop_bp_debug_if;
	output wire io_out_bits_uop_bp_xcpt_if;
	output wire [2:0] io_out_bits_uop_debug_fsrc;
	output wire [2:0] io_out_bits_uop_debug_tsrc;
	output wire [63:0] io_out_bits_data;
	output wire io_out_bits_is_hella;
	wire _io_out_valid_T = io_in_0_valid | io_in_1_valid;
	assign io_in_0_ready = io_out_ready;
	assign io_in_1_ready = ~io_in_0_valid & io_out_ready;
	assign io_in_2_ready = ~_io_out_valid_T & io_out_ready;
	assign io_out_valid = _io_out_valid_T | io_in_2_valid;
	assign io_out_bits_uop_inst = (io_in_0_valid ? io_in_0_bits_uop_inst : (io_in_1_valid ? io_in_1_bits_uop_inst : io_in_2_bits_uop_inst));
	assign io_out_bits_uop_debug_inst = (io_in_0_valid ? io_in_0_bits_uop_debug_inst : (io_in_1_valid ? io_in_1_bits_uop_debug_inst : io_in_2_bits_uop_debug_inst));
	assign io_out_bits_uop_is_rvc = (io_in_0_valid ? io_in_0_bits_uop_is_rvc : (io_in_1_valid ? io_in_1_bits_uop_is_rvc : io_in_2_bits_uop_is_rvc));
	assign io_out_bits_uop_debug_pc = (io_in_0_valid ? io_in_0_bits_uop_debug_pc : (io_in_1_valid ? io_in_1_bits_uop_debug_pc : io_in_2_bits_uop_debug_pc));
	assign io_out_bits_uop_iq_type_0 = (io_in_0_valid ? io_in_0_bits_uop_iq_type_0 : (io_in_1_valid ? io_in_1_bits_uop_iq_type_0 : io_in_2_bits_uop_iq_type_0));
	assign io_out_bits_uop_iq_type_1 = (io_in_0_valid ? io_in_0_bits_uop_iq_type_1 : (io_in_1_valid ? io_in_1_bits_uop_iq_type_1 : io_in_2_bits_uop_iq_type_1));
	assign io_out_bits_uop_iq_type_2 = (io_in_0_valid ? io_in_0_bits_uop_iq_type_2 : (io_in_1_valid ? io_in_1_bits_uop_iq_type_2 : io_in_2_bits_uop_iq_type_2));
	assign io_out_bits_uop_iq_type_3 = (io_in_0_valid ? io_in_0_bits_uop_iq_type_3 : (io_in_1_valid ? io_in_1_bits_uop_iq_type_3 : io_in_2_bits_uop_iq_type_3));
	assign io_out_bits_uop_fu_code_0 = (io_in_0_valid ? io_in_0_bits_uop_fu_code_0 : (io_in_1_valid ? io_in_1_bits_uop_fu_code_0 : io_in_2_bits_uop_fu_code_0));
	assign io_out_bits_uop_fu_code_1 = (io_in_0_valid ? io_in_0_bits_uop_fu_code_1 : (io_in_1_valid ? io_in_1_bits_uop_fu_code_1 : io_in_2_bits_uop_fu_code_1));
	assign io_out_bits_uop_fu_code_2 = (io_in_0_valid ? io_in_0_bits_uop_fu_code_2 : (io_in_1_valid ? io_in_1_bits_uop_fu_code_2 : io_in_2_bits_uop_fu_code_2));
	assign io_out_bits_uop_fu_code_3 = (io_in_0_valid ? io_in_0_bits_uop_fu_code_3 : (io_in_1_valid ? io_in_1_bits_uop_fu_code_3 : io_in_2_bits_uop_fu_code_3));
	assign io_out_bits_uop_fu_code_4 = (io_in_0_valid ? io_in_0_bits_uop_fu_code_4 : (io_in_1_valid ? io_in_1_bits_uop_fu_code_4 : io_in_2_bits_uop_fu_code_4));
	assign io_out_bits_uop_fu_code_5 = (io_in_0_valid ? io_in_0_bits_uop_fu_code_5 : (io_in_1_valid ? io_in_1_bits_uop_fu_code_5 : io_in_2_bits_uop_fu_code_5));
	assign io_out_bits_uop_fu_code_6 = (io_in_0_valid ? io_in_0_bits_uop_fu_code_6 : (io_in_1_valid ? io_in_1_bits_uop_fu_code_6 : io_in_2_bits_uop_fu_code_6));
	assign io_out_bits_uop_fu_code_7 = (io_in_0_valid ? io_in_0_bits_uop_fu_code_7 : (io_in_1_valid ? io_in_1_bits_uop_fu_code_7 : io_in_2_bits_uop_fu_code_7));
	assign io_out_bits_uop_fu_code_8 = (io_in_0_valid ? io_in_0_bits_uop_fu_code_8 : (io_in_1_valid ? io_in_1_bits_uop_fu_code_8 : io_in_2_bits_uop_fu_code_8));
	assign io_out_bits_uop_fu_code_9 = (io_in_0_valid ? io_in_0_bits_uop_fu_code_9 : (io_in_1_valid ? io_in_1_bits_uop_fu_code_9 : io_in_2_bits_uop_fu_code_9));
	assign io_out_bits_uop_iw_issued = (io_in_0_valid ? io_in_0_bits_uop_iw_issued : (io_in_1_valid ? io_in_1_bits_uop_iw_issued : io_in_2_bits_uop_iw_issued));
	assign io_out_bits_uop_iw_issued_partial_agen = (io_in_0_valid ? io_in_0_bits_uop_iw_issued_partial_agen : (io_in_1_valid ? io_in_1_bits_uop_iw_issued_partial_agen : io_in_2_bits_uop_iw_issued_partial_agen));
	assign io_out_bits_uop_iw_issued_partial_dgen = (io_in_0_valid ? io_in_0_bits_uop_iw_issued_partial_dgen : (io_in_1_valid ? io_in_1_bits_uop_iw_issued_partial_dgen : io_in_2_bits_uop_iw_issued_partial_dgen));
	assign io_out_bits_uop_iw_p1_speculative_child = (io_in_0_valid ? io_in_0_bits_uop_iw_p1_speculative_child : (io_in_1_valid ? io_in_1_bits_uop_iw_p1_speculative_child : io_in_2_bits_uop_iw_p1_speculative_child));
	assign io_out_bits_uop_iw_p2_speculative_child = (io_in_0_valid ? io_in_0_bits_uop_iw_p2_speculative_child : (io_in_1_valid ? io_in_1_bits_uop_iw_p2_speculative_child : io_in_2_bits_uop_iw_p2_speculative_child));
	assign io_out_bits_uop_iw_p1_bypass_hint = (io_in_0_valid ? io_in_0_bits_uop_iw_p1_bypass_hint : (io_in_1_valid ? io_in_1_bits_uop_iw_p1_bypass_hint : io_in_2_bits_uop_iw_p1_bypass_hint));
	assign io_out_bits_uop_iw_p2_bypass_hint = (io_in_0_valid ? io_in_0_bits_uop_iw_p2_bypass_hint : (io_in_1_valid ? io_in_1_bits_uop_iw_p2_bypass_hint : io_in_2_bits_uop_iw_p2_bypass_hint));
	assign io_out_bits_uop_iw_p3_bypass_hint = (io_in_0_valid ? io_in_0_bits_uop_iw_p3_bypass_hint : (io_in_1_valid ? io_in_1_bits_uop_iw_p3_bypass_hint : io_in_2_bits_uop_iw_p3_bypass_hint));
	assign io_out_bits_uop_dis_col_sel = (io_in_0_valid ? io_in_0_bits_uop_dis_col_sel : (io_in_1_valid ? io_in_1_bits_uop_dis_col_sel : io_in_2_bits_uop_dis_col_sel));
	assign io_out_bits_uop_br_mask = (io_in_0_valid ? io_in_0_bits_uop_br_mask : (io_in_1_valid ? io_in_1_bits_uop_br_mask : io_in_2_bits_uop_br_mask));
	assign io_out_bits_uop_br_tag = (io_in_0_valid ? io_in_0_bits_uop_br_tag : (io_in_1_valid ? io_in_1_bits_uop_br_tag : io_in_2_bits_uop_br_tag));
	assign io_out_bits_uop_br_type = (io_in_0_valid ? io_in_0_bits_uop_br_type : (io_in_1_valid ? io_in_1_bits_uop_br_type : io_in_2_bits_uop_br_type));
	assign io_out_bits_uop_is_sfb = (io_in_0_valid ? io_in_0_bits_uop_is_sfb : (io_in_1_valid ? io_in_1_bits_uop_is_sfb : io_in_2_bits_uop_is_sfb));
	assign io_out_bits_uop_is_fence = (io_in_0_valid ? io_in_0_bits_uop_is_fence : (io_in_1_valid ? io_in_1_bits_uop_is_fence : io_in_2_bits_uop_is_fence));
	assign io_out_bits_uop_is_fencei = (io_in_0_valid ? io_in_0_bits_uop_is_fencei : (io_in_1_valid ? io_in_1_bits_uop_is_fencei : io_in_2_bits_uop_is_fencei));
	assign io_out_bits_uop_is_sfence = (io_in_0_valid ? io_in_0_bits_uop_is_sfence : (io_in_1_valid ? io_in_1_bits_uop_is_sfence : io_in_2_bits_uop_is_sfence));
	assign io_out_bits_uop_is_amo = (io_in_0_valid ? io_in_0_bits_uop_is_amo : (io_in_1_valid ? io_in_1_bits_uop_is_amo : io_in_2_bits_uop_is_amo));
	assign io_out_bits_uop_is_eret = (io_in_0_valid ? io_in_0_bits_uop_is_eret : (io_in_1_valid ? io_in_1_bits_uop_is_eret : io_in_2_bits_uop_is_eret));
	assign io_out_bits_uop_is_sys_pc2epc = (io_in_0_valid ? io_in_0_bits_uop_is_sys_pc2epc : (io_in_1_valid ? io_in_1_bits_uop_is_sys_pc2epc : io_in_2_bits_uop_is_sys_pc2epc));
	assign io_out_bits_uop_is_rocc = (io_in_0_valid ? io_in_0_bits_uop_is_rocc : (io_in_1_valid ? io_in_1_bits_uop_is_rocc : io_in_2_bits_uop_is_rocc));
	assign io_out_bits_uop_is_mov = (io_in_0_valid ? io_in_0_bits_uop_is_mov : (io_in_1_valid ? io_in_1_bits_uop_is_mov : io_in_2_bits_uop_is_mov));
	assign io_out_bits_uop_ftq_idx = (io_in_0_valid ? io_in_0_bits_uop_ftq_idx : (io_in_1_valid ? io_in_1_bits_uop_ftq_idx : io_in_2_bits_uop_ftq_idx));
	assign io_out_bits_uop_edge_inst = (io_in_0_valid ? io_in_0_bits_uop_edge_inst : (io_in_1_valid ? io_in_1_bits_uop_edge_inst : io_in_2_bits_uop_edge_inst));
	assign io_out_bits_uop_pc_lob = (io_in_0_valid ? io_in_0_bits_uop_pc_lob : (io_in_1_valid ? io_in_1_bits_uop_pc_lob : io_in_2_bits_uop_pc_lob));
	assign io_out_bits_uop_taken = (io_in_0_valid ? io_in_0_bits_uop_taken : (io_in_1_valid ? io_in_1_bits_uop_taken : io_in_2_bits_uop_taken));
	assign io_out_bits_uop_imm_rename = (io_in_0_valid ? io_in_0_bits_uop_imm_rename : (io_in_1_valid ? io_in_1_bits_uop_imm_rename : io_in_2_bits_uop_imm_rename));
	assign io_out_bits_uop_imm_sel = (io_in_0_valid ? io_in_0_bits_uop_imm_sel : (io_in_1_valid ? io_in_1_bits_uop_imm_sel : io_in_2_bits_uop_imm_sel));
	assign io_out_bits_uop_pimm = (io_in_0_valid ? io_in_0_bits_uop_pimm : (io_in_1_valid ? io_in_1_bits_uop_pimm : io_in_2_bits_uop_pimm));
	assign io_out_bits_uop_imm_packed = (io_in_0_valid ? io_in_0_bits_uop_imm_packed : (io_in_1_valid ? io_in_1_bits_uop_imm_packed : io_in_2_bits_uop_imm_packed));
	assign io_out_bits_uop_op1_sel = (io_in_0_valid ? io_in_0_bits_uop_op1_sel : (io_in_1_valid ? io_in_1_bits_uop_op1_sel : io_in_2_bits_uop_op1_sel));
	assign io_out_bits_uop_op2_sel = (io_in_0_valid ? io_in_0_bits_uop_op2_sel : (io_in_1_valid ? io_in_1_bits_uop_op2_sel : io_in_2_bits_uop_op2_sel));
	assign io_out_bits_uop_fp_ctrl_ldst = (io_in_0_valid ? io_in_0_bits_uop_fp_ctrl_ldst : (io_in_1_valid ? io_in_1_bits_uop_fp_ctrl_ldst : io_in_2_bits_uop_fp_ctrl_ldst));
	assign io_out_bits_uop_fp_ctrl_wen = (io_in_0_valid ? io_in_0_bits_uop_fp_ctrl_wen : (io_in_1_valid ? io_in_1_bits_uop_fp_ctrl_wen : io_in_2_bits_uop_fp_ctrl_wen));
	assign io_out_bits_uop_fp_ctrl_ren1 = (io_in_0_valid ? io_in_0_bits_uop_fp_ctrl_ren1 : (io_in_1_valid ? io_in_1_bits_uop_fp_ctrl_ren1 : io_in_2_bits_uop_fp_ctrl_ren1));
	assign io_out_bits_uop_fp_ctrl_ren2 = (io_in_0_valid ? io_in_0_bits_uop_fp_ctrl_ren2 : (io_in_1_valid ? io_in_1_bits_uop_fp_ctrl_ren2 : io_in_2_bits_uop_fp_ctrl_ren2));
	assign io_out_bits_uop_fp_ctrl_ren3 = (io_in_0_valid ? io_in_0_bits_uop_fp_ctrl_ren3 : (io_in_1_valid ? io_in_1_bits_uop_fp_ctrl_ren3 : io_in_2_bits_uop_fp_ctrl_ren3));
	assign io_out_bits_uop_fp_ctrl_swap12 = (io_in_0_valid ? io_in_0_bits_uop_fp_ctrl_swap12 : (io_in_1_valid ? io_in_1_bits_uop_fp_ctrl_swap12 : io_in_2_bits_uop_fp_ctrl_swap12));
	assign io_out_bits_uop_fp_ctrl_swap23 = (io_in_0_valid ? io_in_0_bits_uop_fp_ctrl_swap23 : (io_in_1_valid ? io_in_1_bits_uop_fp_ctrl_swap23 : io_in_2_bits_uop_fp_ctrl_swap23));
	assign io_out_bits_uop_fp_ctrl_typeTagIn = (io_in_0_valid ? io_in_0_bits_uop_fp_ctrl_typeTagIn : (io_in_1_valid ? io_in_1_bits_uop_fp_ctrl_typeTagIn : io_in_2_bits_uop_fp_ctrl_typeTagIn));
	assign io_out_bits_uop_fp_ctrl_typeTagOut = (io_in_0_valid ? io_in_0_bits_uop_fp_ctrl_typeTagOut : (io_in_1_valid ? io_in_1_bits_uop_fp_ctrl_typeTagOut : io_in_2_bits_uop_fp_ctrl_typeTagOut));
	assign io_out_bits_uop_fp_ctrl_fromint = (io_in_0_valid ? io_in_0_bits_uop_fp_ctrl_fromint : (io_in_1_valid ? io_in_1_bits_uop_fp_ctrl_fromint : io_in_2_bits_uop_fp_ctrl_fromint));
	assign io_out_bits_uop_fp_ctrl_toint = (io_in_0_valid ? io_in_0_bits_uop_fp_ctrl_toint : (io_in_1_valid ? io_in_1_bits_uop_fp_ctrl_toint : io_in_2_bits_uop_fp_ctrl_toint));
	assign io_out_bits_uop_fp_ctrl_fastpipe = (io_in_0_valid ? io_in_0_bits_uop_fp_ctrl_fastpipe : (io_in_1_valid ? io_in_1_bits_uop_fp_ctrl_fastpipe : io_in_2_bits_uop_fp_ctrl_fastpipe));
	assign io_out_bits_uop_fp_ctrl_fma = (io_in_0_valid ? io_in_0_bits_uop_fp_ctrl_fma : (io_in_1_valid ? io_in_1_bits_uop_fp_ctrl_fma : io_in_2_bits_uop_fp_ctrl_fma));
	assign io_out_bits_uop_fp_ctrl_div = (io_in_0_valid ? io_in_0_bits_uop_fp_ctrl_div : (io_in_1_valid ? io_in_1_bits_uop_fp_ctrl_div : io_in_2_bits_uop_fp_ctrl_div));
	assign io_out_bits_uop_fp_ctrl_sqrt = (io_in_0_valid ? io_in_0_bits_uop_fp_ctrl_sqrt : (io_in_1_valid ? io_in_1_bits_uop_fp_ctrl_sqrt : io_in_2_bits_uop_fp_ctrl_sqrt));
	assign io_out_bits_uop_fp_ctrl_wflags = (io_in_0_valid ? io_in_0_bits_uop_fp_ctrl_wflags : (io_in_1_valid ? io_in_1_bits_uop_fp_ctrl_wflags : io_in_2_bits_uop_fp_ctrl_wflags));
	assign io_out_bits_uop_fp_ctrl_vec = (io_in_0_valid ? io_in_0_bits_uop_fp_ctrl_vec : (io_in_1_valid ? io_in_1_bits_uop_fp_ctrl_vec : io_in_2_bits_uop_fp_ctrl_vec));
	assign io_out_bits_uop_rob_idx = (io_in_0_valid ? io_in_0_bits_uop_rob_idx : (io_in_1_valid ? io_in_1_bits_uop_rob_idx : io_in_2_bits_uop_rob_idx));
	assign io_out_bits_uop_ldq_idx = (io_in_0_valid ? io_in_0_bits_uop_ldq_idx : (io_in_1_valid ? io_in_1_bits_uop_ldq_idx : io_in_2_bits_uop_ldq_idx));
	assign io_out_bits_uop_stq_idx = (io_in_0_valid ? io_in_0_bits_uop_stq_idx : (io_in_1_valid ? io_in_1_bits_uop_stq_idx : io_in_2_bits_uop_stq_idx));
	assign io_out_bits_uop_rxq_idx = (io_in_0_valid ? io_in_0_bits_uop_rxq_idx : (io_in_1_valid ? io_in_1_bits_uop_rxq_idx : io_in_2_bits_uop_rxq_idx));
	assign io_out_bits_uop_pdst = (io_in_0_valid ? io_in_0_bits_uop_pdst : (io_in_1_valid ? io_in_1_bits_uop_pdst : io_in_2_bits_uop_pdst));
	assign io_out_bits_uop_prs1 = (io_in_0_valid ? io_in_0_bits_uop_prs1 : (io_in_1_valid ? io_in_1_bits_uop_prs1 : io_in_2_bits_uop_prs1));
	assign io_out_bits_uop_prs2 = (io_in_0_valid ? io_in_0_bits_uop_prs2 : (io_in_1_valid ? io_in_1_bits_uop_prs2 : io_in_2_bits_uop_prs2));
	assign io_out_bits_uop_prs3 = (io_in_0_valid ? io_in_0_bits_uop_prs3 : (io_in_1_valid ? io_in_1_bits_uop_prs3 : io_in_2_bits_uop_prs3));
	assign io_out_bits_uop_ppred = (io_in_0_valid ? io_in_0_bits_uop_ppred : (io_in_1_valid ? io_in_1_bits_uop_ppred : io_in_2_bits_uop_ppred));
	assign io_out_bits_uop_prs1_busy = (io_in_0_valid ? io_in_0_bits_uop_prs1_busy : (io_in_1_valid ? io_in_1_bits_uop_prs1_busy : io_in_2_bits_uop_prs1_busy));
	assign io_out_bits_uop_prs2_busy = (io_in_0_valid ? io_in_0_bits_uop_prs2_busy : (io_in_1_valid ? io_in_1_bits_uop_prs2_busy : io_in_2_bits_uop_prs2_busy));
	assign io_out_bits_uop_prs3_busy = (io_in_0_valid ? io_in_0_bits_uop_prs3_busy : (io_in_1_valid ? io_in_1_bits_uop_prs3_busy : io_in_2_bits_uop_prs3_busy));
	assign io_out_bits_uop_ppred_busy = (io_in_0_valid ? io_in_0_bits_uop_ppred_busy : (io_in_1_valid ? io_in_1_bits_uop_ppred_busy : io_in_2_bits_uop_ppred_busy));
	assign io_out_bits_uop_stale_pdst = (io_in_0_valid ? io_in_0_bits_uop_stale_pdst : (io_in_1_valid ? io_in_1_bits_uop_stale_pdst : io_in_2_bits_uop_stale_pdst));
	assign io_out_bits_uop_exception = (io_in_0_valid ? io_in_0_bits_uop_exception : (io_in_1_valid ? io_in_1_bits_uop_exception : io_in_2_bits_uop_exception));
	assign io_out_bits_uop_exc_cause = (io_in_0_valid ? io_in_0_bits_uop_exc_cause : (io_in_1_valid ? io_in_1_bits_uop_exc_cause : io_in_2_bits_uop_exc_cause));
	assign io_out_bits_uop_mem_cmd = (io_in_0_valid ? io_in_0_bits_uop_mem_cmd : (io_in_1_valid ? io_in_1_bits_uop_mem_cmd : io_in_2_bits_uop_mem_cmd));
	assign io_out_bits_uop_mem_size = (io_in_0_valid ? io_in_0_bits_uop_mem_size : (io_in_1_valid ? io_in_1_bits_uop_mem_size : io_in_2_bits_uop_mem_size));
	assign io_out_bits_uop_mem_signed = (io_in_0_valid ? io_in_0_bits_uop_mem_signed : (io_in_1_valid ? io_in_1_bits_uop_mem_signed : io_in_2_bits_uop_mem_signed));
	assign io_out_bits_uop_uses_ldq = (io_in_0_valid ? io_in_0_bits_uop_uses_ldq : (io_in_1_valid ? io_in_1_bits_uop_uses_ldq : io_in_2_bits_uop_uses_ldq));
	assign io_out_bits_uop_uses_stq = (io_in_0_valid ? io_in_0_bits_uop_uses_stq : (io_in_1_valid ? io_in_1_bits_uop_uses_stq : io_in_2_bits_uop_uses_stq));
	assign io_out_bits_uop_is_unique = (io_in_0_valid ? io_in_0_bits_uop_is_unique : (io_in_1_valid ? io_in_1_bits_uop_is_unique : io_in_2_bits_uop_is_unique));
	assign io_out_bits_uop_flush_on_commit = (io_in_0_valid ? io_in_0_bits_uop_flush_on_commit : (io_in_1_valid ? io_in_1_bits_uop_flush_on_commit : io_in_2_bits_uop_flush_on_commit));
	assign io_out_bits_uop_csr_cmd = (io_in_0_valid ? io_in_0_bits_uop_csr_cmd : (io_in_1_valid ? io_in_1_bits_uop_csr_cmd : io_in_2_bits_uop_csr_cmd));
	assign io_out_bits_uop_ldst_is_rs1 = (io_in_0_valid ? io_in_0_bits_uop_ldst_is_rs1 : (io_in_1_valid ? io_in_1_bits_uop_ldst_is_rs1 : io_in_2_bits_uop_ldst_is_rs1));
	assign io_out_bits_uop_ldst = (io_in_0_valid ? io_in_0_bits_uop_ldst : (io_in_1_valid ? io_in_1_bits_uop_ldst : io_in_2_bits_uop_ldst));
	assign io_out_bits_uop_lrs1 = (io_in_0_valid ? io_in_0_bits_uop_lrs1 : (io_in_1_valid ? io_in_1_bits_uop_lrs1 : io_in_2_bits_uop_lrs1));
	assign io_out_bits_uop_lrs2 = (io_in_0_valid ? io_in_0_bits_uop_lrs2 : (io_in_1_valid ? io_in_1_bits_uop_lrs2 : io_in_2_bits_uop_lrs2));
	assign io_out_bits_uop_lrs3 = (io_in_0_valid ? io_in_0_bits_uop_lrs3 : (io_in_1_valid ? io_in_1_bits_uop_lrs3 : io_in_2_bits_uop_lrs3));
	assign io_out_bits_uop_dst_rtype = (io_in_0_valid ? io_in_0_bits_uop_dst_rtype : (io_in_1_valid ? io_in_1_bits_uop_dst_rtype : io_in_2_bits_uop_dst_rtype));
	assign io_out_bits_uop_lrs1_rtype = (io_in_0_valid ? io_in_0_bits_uop_lrs1_rtype : (io_in_1_valid ? io_in_1_bits_uop_lrs1_rtype : io_in_2_bits_uop_lrs1_rtype));
	assign io_out_bits_uop_lrs2_rtype = (io_in_0_valid ? io_in_0_bits_uop_lrs2_rtype : (io_in_1_valid ? io_in_1_bits_uop_lrs2_rtype : io_in_2_bits_uop_lrs2_rtype));
	assign io_out_bits_uop_frs3_en = (io_in_0_valid ? io_in_0_bits_uop_frs3_en : (io_in_1_valid ? io_in_1_bits_uop_frs3_en : io_in_2_bits_uop_frs3_en));
	assign io_out_bits_uop_fcn_dw = (io_in_0_valid ? io_in_0_bits_uop_fcn_dw : (io_in_1_valid ? io_in_1_bits_uop_fcn_dw : io_in_2_bits_uop_fcn_dw));
	assign io_out_bits_uop_fcn_op = (io_in_0_valid ? io_in_0_bits_uop_fcn_op : (io_in_1_valid ? io_in_1_bits_uop_fcn_op : io_in_2_bits_uop_fcn_op));
	assign io_out_bits_uop_fp_val = (io_in_0_valid ? io_in_0_bits_uop_fp_val : (io_in_1_valid ? io_in_1_bits_uop_fp_val : io_in_2_bits_uop_fp_val));
	assign io_out_bits_uop_fp_rm = (io_in_0_valid ? io_in_0_bits_uop_fp_rm : (io_in_1_valid ? io_in_1_bits_uop_fp_rm : io_in_2_bits_uop_fp_rm));
	assign io_out_bits_uop_fp_typ = (io_in_0_valid ? io_in_0_bits_uop_fp_typ : (io_in_1_valid ? io_in_1_bits_uop_fp_typ : io_in_2_bits_uop_fp_typ));
	assign io_out_bits_uop_xcpt_pf_if = (io_in_0_valid ? io_in_0_bits_uop_xcpt_pf_if : (io_in_1_valid ? io_in_1_bits_uop_xcpt_pf_if : io_in_2_bits_uop_xcpt_pf_if));
	assign io_out_bits_uop_xcpt_ae_if = (io_in_0_valid ? io_in_0_bits_uop_xcpt_ae_if : (io_in_1_valid ? io_in_1_bits_uop_xcpt_ae_if : io_in_2_bits_uop_xcpt_ae_if));
	assign io_out_bits_uop_xcpt_ma_if = (io_in_0_valid ? io_in_0_bits_uop_xcpt_ma_if : (io_in_1_valid ? io_in_1_bits_uop_xcpt_ma_if : io_in_2_bits_uop_xcpt_ma_if));
	assign io_out_bits_uop_bp_debug_if = (io_in_0_valid ? io_in_0_bits_uop_bp_debug_if : (io_in_1_valid ? io_in_1_bits_uop_bp_debug_if : io_in_2_bits_uop_bp_debug_if));
	assign io_out_bits_uop_bp_xcpt_if = (io_in_0_valid ? io_in_0_bits_uop_bp_xcpt_if : (io_in_1_valid ? io_in_1_bits_uop_bp_xcpt_if : io_in_2_bits_uop_bp_xcpt_if));
	assign io_out_bits_uop_debug_fsrc = (io_in_0_valid ? io_in_0_bits_uop_debug_fsrc : (io_in_1_valid ? io_in_1_bits_uop_debug_fsrc : io_in_2_bits_uop_debug_fsrc));
	assign io_out_bits_uop_debug_tsrc = (io_in_0_valid ? io_in_0_bits_uop_debug_tsrc : (io_in_1_valid ? io_in_1_bits_uop_debug_tsrc : io_in_2_bits_uop_debug_tsrc));
	assign io_out_bits_data = (io_in_0_valid ? io_in_0_bits_data : (io_in_1_valid ? io_in_1_bits_data : io_in_2_bits_data));
	assign io_out_bits_is_hella = (io_in_0_valid ? io_in_0_bits_is_hella : (io_in_1_valid ? io_in_1_bits_is_hella : io_in_2_bits_is_hella));
endmodule
