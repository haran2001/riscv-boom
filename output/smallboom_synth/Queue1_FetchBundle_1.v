module Queue1_FetchBundle_1 (
	clock,
	reset,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits_pc,
	io_enq_bits_next_pc,
	io_enq_bits_next_fetch,
	io_enq_bits_edge_inst_0,
	io_enq_bits_insts_0,
	io_enq_bits_insts_1,
	io_enq_bits_insts_2,
	io_enq_bits_insts_3,
	io_enq_bits_exp_insts_0,
	io_enq_bits_exp_insts_1,
	io_enq_bits_exp_insts_2,
	io_enq_bits_exp_insts_3,
	io_enq_bits_pcs_0,
	io_enq_bits_pcs_1,
	io_enq_bits_pcs_2,
	io_enq_bits_pcs_3,
	io_enq_bits_sfbs_0,
	io_enq_bits_sfbs_1,
	io_enq_bits_sfbs_2,
	io_enq_bits_sfbs_3,
	io_enq_bits_sfb_masks_0,
	io_enq_bits_sfb_masks_1,
	io_enq_bits_sfb_masks_2,
	io_enq_bits_sfb_masks_3,
	io_enq_bits_sfb_dests_0,
	io_enq_bits_sfb_dests_1,
	io_enq_bits_sfb_dests_2,
	io_enq_bits_sfb_dests_3,
	io_enq_bits_shadowable_mask_0,
	io_enq_bits_shadowable_mask_1,
	io_enq_bits_shadowable_mask_2,
	io_enq_bits_shadowable_mask_3,
	io_enq_bits_shadowed_mask_0,
	io_enq_bits_shadowed_mask_1,
	io_enq_bits_shadowed_mask_2,
	io_enq_bits_shadowed_mask_3,
	io_enq_bits_cfi_idx_valid,
	io_enq_bits_cfi_idx_bits,
	io_enq_bits_cfi_type,
	io_enq_bits_cfi_is_call,
	io_enq_bits_cfi_is_ret,
	io_enq_bits_cfi_npc_plus4,
	io_enq_bits_ras_top,
	io_enq_bits_mask,
	io_enq_bits_br_mask,
	io_enq_bits_ghist_old_history,
	io_enq_bits_ghist_current_saw_branch_not_taken,
	io_enq_bits_ghist_new_saw_branch_not_taken,
	io_enq_bits_ghist_new_saw_branch_taken,
	io_enq_bits_ghist_ras_idx,
	io_enq_bits_lhist_0,
	io_enq_bits_xcpt_pf_if,
	io_enq_bits_xcpt_ae_if,
	io_enq_bits_end_half_valid,
	io_enq_bits_end_half_bits,
	io_enq_bits_bpd_meta_0,
	io_enq_bits_fsrc,
	io_enq_bits_tsrc,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits_pc,
	io_deq_bits_next_pc,
	io_deq_bits_edge_inst_0,
	io_deq_bits_insts_0,
	io_deq_bits_insts_1,
	io_deq_bits_insts_2,
	io_deq_bits_insts_3,
	io_deq_bits_exp_insts_0,
	io_deq_bits_exp_insts_1,
	io_deq_bits_exp_insts_2,
	io_deq_bits_exp_insts_3,
	io_deq_bits_sfbs_0,
	io_deq_bits_sfbs_1,
	io_deq_bits_sfbs_2,
	io_deq_bits_sfbs_3,
	io_deq_bits_sfb_masks_0,
	io_deq_bits_sfb_masks_1,
	io_deq_bits_sfb_masks_2,
	io_deq_bits_sfb_masks_3,
	io_deq_bits_sfb_dests_0,
	io_deq_bits_sfb_dests_1,
	io_deq_bits_sfb_dests_2,
	io_deq_bits_sfb_dests_3,
	io_deq_bits_shadowable_mask_0,
	io_deq_bits_shadowable_mask_1,
	io_deq_bits_shadowable_mask_2,
	io_deq_bits_shadowable_mask_3,
	io_deq_bits_shadowed_mask_0,
	io_deq_bits_shadowed_mask_1,
	io_deq_bits_shadowed_mask_2,
	io_deq_bits_shadowed_mask_3,
	io_deq_bits_cfi_idx_valid,
	io_deq_bits_cfi_idx_bits,
	io_deq_bits_cfi_type,
	io_deq_bits_cfi_is_call,
	io_deq_bits_cfi_is_ret,
	io_deq_bits_cfi_npc_plus4,
	io_deq_bits_mask,
	io_deq_bits_br_mask,
	io_deq_bits_ghist_old_history,
	io_deq_bits_ghist_current_saw_branch_not_taken,
	io_deq_bits_ghist_new_saw_branch_not_taken,
	io_deq_bits_ghist_new_saw_branch_taken,
	io_deq_bits_ghist_ras_idx,
	io_deq_bits_xcpt_pf_if,
	io_deq_bits_xcpt_ae_if,
	io_deq_bits_bp_debug_if_oh_0,
	io_deq_bits_bp_debug_if_oh_1,
	io_deq_bits_bp_debug_if_oh_2,
	io_deq_bits_bp_debug_if_oh_3,
	io_deq_bits_bp_xcpt_if_oh_0,
	io_deq_bits_bp_xcpt_if_oh_1,
	io_deq_bits_bp_xcpt_if_oh_2,
	io_deq_bits_bp_xcpt_if_oh_3,
	io_deq_bits_end_half_valid,
	io_deq_bits_end_half_bits,
	io_deq_bits_bpd_meta_0,
	io_deq_bits_fsrc
);
	input clock;
	input reset;
	output wire io_enq_ready;
	input io_enq_valid;
	input [39:0] io_enq_bits_pc;
	input [39:0] io_enq_bits_next_pc;
	input [39:0] io_enq_bits_next_fetch;
	input io_enq_bits_edge_inst_0;
	input [31:0] io_enq_bits_insts_0;
	input [31:0] io_enq_bits_insts_1;
	input [31:0] io_enq_bits_insts_2;
	input [31:0] io_enq_bits_insts_3;
	input [31:0] io_enq_bits_exp_insts_0;
	input [31:0] io_enq_bits_exp_insts_1;
	input [31:0] io_enq_bits_exp_insts_2;
	input [31:0] io_enq_bits_exp_insts_3;
	input [39:0] io_enq_bits_pcs_0;
	input [39:0] io_enq_bits_pcs_1;
	input [39:0] io_enq_bits_pcs_2;
	input [39:0] io_enq_bits_pcs_3;
	input io_enq_bits_sfbs_0;
	input io_enq_bits_sfbs_1;
	input io_enq_bits_sfbs_2;
	input io_enq_bits_sfbs_3;
	input [7:0] io_enq_bits_sfb_masks_0;
	input [7:0] io_enq_bits_sfb_masks_1;
	input [7:0] io_enq_bits_sfb_masks_2;
	input [7:0] io_enq_bits_sfb_masks_3;
	input [3:0] io_enq_bits_sfb_dests_0;
	input [3:0] io_enq_bits_sfb_dests_1;
	input [3:0] io_enq_bits_sfb_dests_2;
	input [3:0] io_enq_bits_sfb_dests_3;
	input io_enq_bits_shadowable_mask_0;
	input io_enq_bits_shadowable_mask_1;
	input io_enq_bits_shadowable_mask_2;
	input io_enq_bits_shadowable_mask_3;
	input io_enq_bits_shadowed_mask_0;
	input io_enq_bits_shadowed_mask_1;
	input io_enq_bits_shadowed_mask_2;
	input io_enq_bits_shadowed_mask_3;
	input io_enq_bits_cfi_idx_valid;
	input [1:0] io_enq_bits_cfi_idx_bits;
	input [2:0] io_enq_bits_cfi_type;
	input io_enq_bits_cfi_is_call;
	input io_enq_bits_cfi_is_ret;
	input io_enq_bits_cfi_npc_plus4;
	input [39:0] io_enq_bits_ras_top;
	input [3:0] io_enq_bits_mask;
	input [3:0] io_enq_bits_br_mask;
	input [63:0] io_enq_bits_ghist_old_history;
	input io_enq_bits_ghist_current_saw_branch_not_taken;
	input io_enq_bits_ghist_new_saw_branch_not_taken;
	input io_enq_bits_ghist_new_saw_branch_taken;
	input [4:0] io_enq_bits_ghist_ras_idx;
	input io_enq_bits_lhist_0;
	input io_enq_bits_xcpt_pf_if;
	input io_enq_bits_xcpt_ae_if;
	input io_enq_bits_end_half_valid;
	input [15:0] io_enq_bits_end_half_bits;
	input [119:0] io_enq_bits_bpd_meta_0;
	input [2:0] io_enq_bits_fsrc;
	input [2:0] io_enq_bits_tsrc;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire [39:0] io_deq_bits_pc;
	output wire [39:0] io_deq_bits_next_pc;
	output wire io_deq_bits_edge_inst_0;
	output wire [31:0] io_deq_bits_insts_0;
	output wire [31:0] io_deq_bits_insts_1;
	output wire [31:0] io_deq_bits_insts_2;
	output wire [31:0] io_deq_bits_insts_3;
	output wire [31:0] io_deq_bits_exp_insts_0;
	output wire [31:0] io_deq_bits_exp_insts_1;
	output wire [31:0] io_deq_bits_exp_insts_2;
	output wire [31:0] io_deq_bits_exp_insts_3;
	output wire io_deq_bits_sfbs_0;
	output wire io_deq_bits_sfbs_1;
	output wire io_deq_bits_sfbs_2;
	output wire io_deq_bits_sfbs_3;
	output wire [7:0] io_deq_bits_sfb_masks_0;
	output wire [7:0] io_deq_bits_sfb_masks_1;
	output wire [7:0] io_deq_bits_sfb_masks_2;
	output wire [7:0] io_deq_bits_sfb_masks_3;
	output wire [3:0] io_deq_bits_sfb_dests_0;
	output wire [3:0] io_deq_bits_sfb_dests_1;
	output wire [3:0] io_deq_bits_sfb_dests_2;
	output wire [3:0] io_deq_bits_sfb_dests_3;
	output wire io_deq_bits_shadowable_mask_0;
	output wire io_deq_bits_shadowable_mask_1;
	output wire io_deq_bits_shadowable_mask_2;
	output wire io_deq_bits_shadowable_mask_3;
	output wire io_deq_bits_shadowed_mask_0;
	output wire io_deq_bits_shadowed_mask_1;
	output wire io_deq_bits_shadowed_mask_2;
	output wire io_deq_bits_shadowed_mask_3;
	output wire io_deq_bits_cfi_idx_valid;
	output wire [1:0] io_deq_bits_cfi_idx_bits;
	output wire [2:0] io_deq_bits_cfi_type;
	output wire io_deq_bits_cfi_is_call;
	output wire io_deq_bits_cfi_is_ret;
	output wire io_deq_bits_cfi_npc_plus4;
	output wire [3:0] io_deq_bits_mask;
	output wire [3:0] io_deq_bits_br_mask;
	output wire [63:0] io_deq_bits_ghist_old_history;
	output wire io_deq_bits_ghist_current_saw_branch_not_taken;
	output wire io_deq_bits_ghist_new_saw_branch_not_taken;
	output wire io_deq_bits_ghist_new_saw_branch_taken;
	output wire [4:0] io_deq_bits_ghist_ras_idx;
	output wire io_deq_bits_xcpt_pf_if;
	output wire io_deq_bits_xcpt_ae_if;
	output wire io_deq_bits_bp_debug_if_oh_0;
	output wire io_deq_bits_bp_debug_if_oh_1;
	output wire io_deq_bits_bp_debug_if_oh_2;
	output wire io_deq_bits_bp_debug_if_oh_3;
	output wire io_deq_bits_bp_xcpt_if_oh_0;
	output wire io_deq_bits_bp_xcpt_if_oh_1;
	output wire io_deq_bits_bp_xcpt_if_oh_2;
	output wire io_deq_bits_bp_xcpt_if_oh_3;
	output wire io_deq_bits_end_half_valid;
	output wire [15:0] io_deq_bits_end_half_bits;
	output wire [119:0] io_deq_bits_bpd_meta_0;
	output wire [2:0] io_deq_bits_fsrc;
	reg [883:0] ram;
	reg full;
	wire io_enq_ready_0 = io_deq_ready | ~full;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg do_enq;
		do_enq = io_enq_ready_0 & io_enq_valid;
		if (do_enq)
			ram <= {io_enq_bits_tsrc, io_enq_bits_fsrc, io_enq_bits_bpd_meta_0, io_enq_bits_end_half_bits, io_enq_bits_end_half_valid, 8'h00, io_enq_bits_xcpt_ae_if, io_enq_bits_xcpt_pf_if, io_enq_bits_lhist_0, io_enq_bits_ghist_ras_idx, io_enq_bits_ghist_new_saw_branch_taken, io_enq_bits_ghist_new_saw_branch_not_taken, io_enq_bits_ghist_current_saw_branch_not_taken, io_enq_bits_ghist_old_history, io_enq_bits_br_mask, io_enq_bits_mask, 4'h0, io_enq_bits_ras_top, io_enq_bits_cfi_npc_plus4, io_enq_bits_cfi_is_ret, io_enq_bits_cfi_is_call, io_enq_bits_cfi_type, io_enq_bits_cfi_idx_bits, io_enq_bits_cfi_idx_valid, io_enq_bits_shadowed_mask_3, io_enq_bits_shadowed_mask_2, io_enq_bits_shadowed_mask_1, io_enq_bits_shadowed_mask_0, io_enq_bits_shadowable_mask_3, io_enq_bits_shadowable_mask_2, io_enq_bits_shadowable_mask_1, io_enq_bits_shadowable_mask_0, io_enq_bits_sfb_dests_3, io_enq_bits_sfb_dests_2, io_enq_bits_sfb_dests_1, io_enq_bits_sfb_dests_0, io_enq_bits_sfb_masks_3, io_enq_bits_sfb_masks_2, io_enq_bits_sfb_masks_1, io_enq_bits_sfb_masks_0, io_enq_bits_sfbs_3, io_enq_bits_sfbs_2, io_enq_bits_sfbs_1, io_enq_bits_sfbs_0, io_enq_bits_pcs_3, io_enq_bits_pcs_2, io_enq_bits_pcs_1, io_enq_bits_pcs_0, io_enq_bits_exp_insts_3, io_enq_bits_exp_insts_2, io_enq_bits_exp_insts_1, io_enq_bits_exp_insts_0, io_enq_bits_insts_3, io_enq_bits_insts_2, io_enq_bits_insts_1, io_enq_bits_insts_0, io_enq_bits_edge_inst_0, io_enq_bits_next_fetch, io_enq_bits_next_pc, io_enq_bits_pc};
		if (reset)
			full <= 1'h0;
		else if (~(do_enq == (io_deq_ready & full)))
			full <= do_enq;
	end
	assign io_enq_ready = io_enq_ready_0;
	assign io_deq_valid = full;
	assign io_deq_bits_pc = ram[39:0];
	assign io_deq_bits_next_pc = ram[79:40];
	assign io_deq_bits_edge_inst_0 = ram[120];
	assign io_deq_bits_insts_0 = ram[152:121];
	assign io_deq_bits_insts_1 = ram[184:153];
	assign io_deq_bits_insts_2 = ram[216:185];
	assign io_deq_bits_insts_3 = ram[248:217];
	assign io_deq_bits_exp_insts_0 = ram[280:249];
	assign io_deq_bits_exp_insts_1 = ram[312:281];
	assign io_deq_bits_exp_insts_2 = ram[344:313];
	assign io_deq_bits_exp_insts_3 = ram[376:345];
	assign io_deq_bits_sfbs_0 = ram[537];
	assign io_deq_bits_sfbs_1 = ram[538];
	assign io_deq_bits_sfbs_2 = ram[539];
	assign io_deq_bits_sfbs_3 = ram[540];
	assign io_deq_bits_sfb_masks_0 = ram[548:541];
	assign io_deq_bits_sfb_masks_1 = ram[556:549];
	assign io_deq_bits_sfb_masks_2 = ram[564:557];
	assign io_deq_bits_sfb_masks_3 = ram[572:565];
	assign io_deq_bits_sfb_dests_0 = ram[576:573];
	assign io_deq_bits_sfb_dests_1 = ram[580:577];
	assign io_deq_bits_sfb_dests_2 = ram[584:581];
	assign io_deq_bits_sfb_dests_3 = ram[588:585];
	assign io_deq_bits_shadowable_mask_0 = ram[589];
	assign io_deq_bits_shadowable_mask_1 = ram[590];
	assign io_deq_bits_shadowable_mask_2 = ram[591];
	assign io_deq_bits_shadowable_mask_3 = ram[592];
	assign io_deq_bits_shadowed_mask_0 = ram[593];
	assign io_deq_bits_shadowed_mask_1 = ram[594];
	assign io_deq_bits_shadowed_mask_2 = ram[595];
	assign io_deq_bits_shadowed_mask_3 = ram[596];
	assign io_deq_bits_cfi_idx_valid = ram[597];
	assign io_deq_bits_cfi_idx_bits = ram[599:598];
	assign io_deq_bits_cfi_type = ram[602:600];
	assign io_deq_bits_cfi_is_call = ram[603];
	assign io_deq_bits_cfi_is_ret = ram[604];
	assign io_deq_bits_cfi_npc_plus4 = ram[605];
	assign io_deq_bits_mask = ram[653:650];
	assign io_deq_bits_br_mask = ram[657:654];
	assign io_deq_bits_ghist_old_history = ram[721:658];
	assign io_deq_bits_ghist_current_saw_branch_not_taken = ram[722];
	assign io_deq_bits_ghist_new_saw_branch_not_taken = ram[723];
	assign io_deq_bits_ghist_new_saw_branch_taken = ram[724];
	assign io_deq_bits_ghist_ras_idx = ram[729:725];
	assign io_deq_bits_xcpt_pf_if = ram[731];
	assign io_deq_bits_xcpt_ae_if = ram[732];
	assign io_deq_bits_bp_debug_if_oh_0 = ram[733];
	assign io_deq_bits_bp_debug_if_oh_1 = ram[734];
	assign io_deq_bits_bp_debug_if_oh_2 = ram[735];
	assign io_deq_bits_bp_debug_if_oh_3 = ram[736];
	assign io_deq_bits_bp_xcpt_if_oh_0 = ram[737];
	assign io_deq_bits_bp_xcpt_if_oh_1 = ram[738];
	assign io_deq_bits_bp_xcpt_if_oh_2 = ram[739];
	assign io_deq_bits_bp_xcpt_if_oh_3 = ram[740];
	assign io_deq_bits_end_half_valid = ram[741];
	assign io_deq_bits_end_half_bits = ram[757:742];
	assign io_deq_bits_bpd_meta_0 = ram[877:758];
	assign io_deq_bits_fsrc = ram[880:878];
endmodule
