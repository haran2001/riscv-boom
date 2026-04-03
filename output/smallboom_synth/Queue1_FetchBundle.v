module Queue1_FetchBundle (
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
	io_enq_bits_cfi_idx_valid,
	io_enq_bits_cfi_idx_bits,
	io_enq_bits_mask,
	io_enq_bits_ghist_old_history,
	io_enq_bits_ghist_current_saw_branch_not_taken,
	io_enq_bits_ghist_new_saw_branch_not_taken,
	io_enq_bits_ghist_new_saw_branch_taken,
	io_enq_bits_ghist_ras_idx,
	io_enq_bits_xcpt_pf_if,
	io_enq_bits_xcpt_ae_if,
	io_enq_bits_end_half_valid,
	io_enq_bits_end_half_bits,
	io_enq_bits_fsrc,
	io_enq_bits_tsrc,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits_pc,
	io_deq_bits_next_fetch,
	io_deq_bits_edge_inst_0,
	io_deq_bits_insts_0,
	io_deq_bits_insts_1,
	io_deq_bits_insts_2,
	io_deq_bits_insts_3,
	io_deq_bits_exp_insts_0,
	io_deq_bits_exp_insts_1,
	io_deq_bits_exp_insts_2,
	io_deq_bits_exp_insts_3,
	io_deq_bits_pcs_0,
	io_deq_bits_pcs_1,
	io_deq_bits_pcs_2,
	io_deq_bits_pcs_3,
	io_deq_bits_ras_top,
	io_deq_bits_mask,
	io_deq_bits_ghist_old_history,
	io_deq_bits_ghist_current_saw_branch_not_taken,
	io_deq_bits_ghist_new_saw_branch_not_taken,
	io_deq_bits_ghist_new_saw_branch_taken,
	io_deq_bits_ghist_ras_idx,
	io_deq_bits_xcpt_pf_if,
	io_deq_bits_xcpt_ae_if,
	io_deq_bits_end_half_valid,
	io_deq_bits_end_half_bits,
	io_deq_bits_fsrc,
	io_deq_bits_tsrc
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
	input io_enq_bits_cfi_idx_valid;
	input [1:0] io_enq_bits_cfi_idx_bits;
	input [3:0] io_enq_bits_mask;
	input [63:0] io_enq_bits_ghist_old_history;
	input io_enq_bits_ghist_current_saw_branch_not_taken;
	input io_enq_bits_ghist_new_saw_branch_not_taken;
	input io_enq_bits_ghist_new_saw_branch_taken;
	input [4:0] io_enq_bits_ghist_ras_idx;
	input io_enq_bits_xcpt_pf_if;
	input io_enq_bits_xcpt_ae_if;
	input io_enq_bits_end_half_valid;
	input [15:0] io_enq_bits_end_half_bits;
	input [2:0] io_enq_bits_fsrc;
	input [2:0] io_enq_bits_tsrc;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire [39:0] io_deq_bits_pc;
	output wire [39:0] io_deq_bits_next_fetch;
	output wire io_deq_bits_edge_inst_0;
	output wire [31:0] io_deq_bits_insts_0;
	output wire [31:0] io_deq_bits_insts_1;
	output wire [31:0] io_deq_bits_insts_2;
	output wire [31:0] io_deq_bits_insts_3;
	output wire [31:0] io_deq_bits_exp_insts_0;
	output wire [31:0] io_deq_bits_exp_insts_1;
	output wire [31:0] io_deq_bits_exp_insts_2;
	output wire [31:0] io_deq_bits_exp_insts_3;
	output wire [39:0] io_deq_bits_pcs_0;
	output wire [39:0] io_deq_bits_pcs_1;
	output wire [39:0] io_deq_bits_pcs_2;
	output wire [39:0] io_deq_bits_pcs_3;
	output wire [39:0] io_deq_bits_ras_top;
	output wire [3:0] io_deq_bits_mask;
	output wire [63:0] io_deq_bits_ghist_old_history;
	output wire io_deq_bits_ghist_current_saw_branch_not_taken;
	output wire io_deq_bits_ghist_new_saw_branch_not_taken;
	output wire io_deq_bits_ghist_new_saw_branch_taken;
	output wire [4:0] io_deq_bits_ghist_ras_idx;
	output wire io_deq_bits_xcpt_pf_if;
	output wire io_deq_bits_xcpt_ae_if;
	output wire io_deq_bits_end_half_valid;
	output wire [15:0] io_deq_bits_end_half_bits;
	output wire [2:0] io_deq_bits_fsrc;
	output wire [2:0] io_deq_bits_tsrc;
	reg [764:0] ram;
	reg full;
	wire io_enq_ready_0 = io_deq_ready | ~full;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg do_enq;
		do_enq = io_enq_ready_0 & io_enq_valid;
		if (do_enq)
			ram <= {io_enq_bits_tsrc, io_enq_bits_fsrc, 1'h0, io_enq_bits_end_half_bits, io_enq_bits_end_half_valid, 8'h00, io_enq_bits_xcpt_ae_if, io_enq_bits_xcpt_pf_if, 1'h0, io_enq_bits_ghist_ras_idx, io_enq_bits_ghist_new_saw_branch_taken, io_enq_bits_ghist_new_saw_branch_not_taken, io_enq_bits_ghist_current_saw_branch_not_taken, io_enq_bits_ghist_old_history, 4'h0, io_enq_bits_mask, 50'h0000000000000, io_enq_bits_cfi_idx_bits, io_enq_bits_cfi_idx_valid, 60'h000000000000000, io_enq_bits_pcs_3, io_enq_bits_pcs_2, io_enq_bits_pcs_1, io_enq_bits_pcs_0, io_enq_bits_exp_insts_3, io_enq_bits_exp_insts_2, io_enq_bits_exp_insts_1, io_enq_bits_exp_insts_0, io_enq_bits_insts_3, io_enq_bits_insts_2, io_enq_bits_insts_1, io_enq_bits_insts_0, io_enq_bits_edge_inst_0, io_enq_bits_next_fetch, io_enq_bits_next_pc, io_enq_bits_pc};
		if (reset)
			full <= 1'h0;
		else if (~(do_enq == (io_deq_ready & full)))
			full <= do_enq;
	end
	assign io_enq_ready = io_enq_ready_0;
	assign io_deq_valid = full;
	assign io_deq_bits_pc = ram[39:0];
	assign io_deq_bits_next_fetch = ram[119:80];
	assign io_deq_bits_edge_inst_0 = ram[120];
	assign io_deq_bits_insts_0 = ram[152:121];
	assign io_deq_bits_insts_1 = ram[184:153];
	assign io_deq_bits_insts_2 = ram[216:185];
	assign io_deq_bits_insts_3 = ram[248:217];
	assign io_deq_bits_exp_insts_0 = ram[280:249];
	assign io_deq_bits_exp_insts_1 = ram[312:281];
	assign io_deq_bits_exp_insts_2 = ram[344:313];
	assign io_deq_bits_exp_insts_3 = ram[376:345];
	assign io_deq_bits_pcs_0 = ram[416:377];
	assign io_deq_bits_pcs_1 = ram[456:417];
	assign io_deq_bits_pcs_2 = ram[496:457];
	assign io_deq_bits_pcs_3 = ram[536:497];
	assign io_deq_bits_ras_top = ram[645:606];
	assign io_deq_bits_mask = ram[653:650];
	assign io_deq_bits_ghist_old_history = ram[721:658];
	assign io_deq_bits_ghist_current_saw_branch_not_taken = ram[722];
	assign io_deq_bits_ghist_new_saw_branch_not_taken = ram[723];
	assign io_deq_bits_ghist_new_saw_branch_taken = ram[724];
	assign io_deq_bits_ghist_ras_idx = ram[729:725];
	assign io_deq_bits_xcpt_pf_if = ram[731];
	assign io_deq_bits_xcpt_ae_if = ram[732];
	assign io_deq_bits_end_half_valid = ram[741];
	assign io_deq_bits_end_half_bits = ram[757:742];
	assign io_deq_bits_fsrc = ram[761:759];
	assign io_deq_bits_tsrc = ram[764:762];
endmodule
