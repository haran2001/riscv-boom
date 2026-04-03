module Queue2_BranchPredictionUpdate (
	clock,
	reset,
	io_enq_valid,
	io_enq_bits_btb_mispredicts,
	io_enq_bits_pc,
	io_enq_bits_ghist_old_history,
	io_enq_bits_ghist_current_saw_branch_not_taken,
	io_enq_bits_ghist_new_saw_branch_not_taken,
	io_enq_bits_ghist_new_saw_branch_taken,
	io_enq_bits_ghist_ras_idx,
	io_enq_bits_lhist_0,
	io_enq_bits_meta_0,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits_is_mispredict_update,
	io_deq_bits_is_repair_update,
	io_deq_bits_btb_mispredicts,
	io_deq_bits_pc,
	io_deq_bits_br_mask,
	io_deq_bits_cfi_idx_valid,
	io_deq_bits_cfi_idx_bits,
	io_deq_bits_cfi_taken,
	io_deq_bits_cfi_mispredicted,
	io_deq_bits_cfi_is_br,
	io_deq_bits_cfi_is_jal,
	io_deq_bits_cfi_is_jalr,
	io_deq_bits_ghist_old_history,
	io_deq_bits_target,
	io_deq_bits_meta_0
);
	input clock;
	input reset;
	input io_enq_valid;
	input [3:0] io_enq_bits_btb_mispredicts;
	input [39:0] io_enq_bits_pc;
	input [63:0] io_enq_bits_ghist_old_history;
	input io_enq_bits_ghist_current_saw_branch_not_taken;
	input io_enq_bits_ghist_new_saw_branch_not_taken;
	input io_enq_bits_ghist_new_saw_branch_taken;
	input [4:0] io_enq_bits_ghist_ras_idx;
	input io_enq_bits_lhist_0;
	input [119:0] io_enq_bits_meta_0;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire io_deq_bits_is_mispredict_update;
	output wire io_deq_bits_is_repair_update;
	output wire [3:0] io_deq_bits_btb_mispredicts;
	output wire [39:0] io_deq_bits_pc;
	output wire [3:0] io_deq_bits_br_mask;
	output wire io_deq_bits_cfi_idx_valid;
	output wire [1:0] io_deq_bits_cfi_idx_bits;
	output wire io_deq_bits_cfi_taken;
	output wire io_deq_bits_cfi_mispredicted;
	output wire io_deq_bits_cfi_is_br;
	output wire io_deq_bits_cfi_is_jal;
	output wire io_deq_bits_cfi_is_jalr;
	output wire [63:0] io_deq_bits_ghist_old_history;
	output wire [39:0] io_deq_bits_target;
	output wire [119:0] io_deq_bits_meta_0;
	wire io_enq_ready;
	wire [281:0] _ram_ext_R0_data;
	reg wrap;
	reg wrap_1;
	reg maybe_full;
	wire ptr_match = wrap == wrap_1;
	wire empty = ptr_match & ~maybe_full;
	wire do_enq = io_enq_ready & io_enq_valid;
	assign io_enq_ready = ~(ptr_match & maybe_full);
	always @(posedge clock)
		if (reset) begin
			wrap <= 1'h0;
			wrap_1 <= 1'h0;
			maybe_full <= 1'h0;
		end
		else begin : sv2v_autoblock_1
			reg do_deq;
			do_deq = io_deq_ready & ~empty;
			if (do_enq)
				wrap <= wrap - 1'h1;
			if (do_deq)
				wrap_1 <= wrap_1 - 1'h1;
			if (~(do_enq == do_deq))
				maybe_full <= do_enq;
		end
	ram_2x282 ram_ext(
		.R0_addr(wrap_1),
		.R0_en(1'h1),
		.R0_clk(clock),
		.R0_data(_ram_ext_R0_data),
		.W0_addr(wrap),
		.W0_en(do_enq),
		.W0_clk(clock),
		.W0_data({io_enq_bits_meta_0, 40'h0000000000, io_enq_bits_ghist_old_history, 12'h000, io_enq_bits_pc, io_enq_bits_btb_mispredicts, 2'h0})
	);
	assign io_deq_valid = ~empty;
	assign io_deq_bits_is_mispredict_update = _ram_ext_R0_data[0];
	assign io_deq_bits_is_repair_update = _ram_ext_R0_data[1];
	assign io_deq_bits_btb_mispredicts = _ram_ext_R0_data[5:2];
	assign io_deq_bits_pc = _ram_ext_R0_data[45:6];
	assign io_deq_bits_br_mask = _ram_ext_R0_data[49:46];
	assign io_deq_bits_cfi_idx_valid = _ram_ext_R0_data[50];
	assign io_deq_bits_cfi_idx_bits = _ram_ext_R0_data[52:51];
	assign io_deq_bits_cfi_taken = _ram_ext_R0_data[53];
	assign io_deq_bits_cfi_mispredicted = _ram_ext_R0_data[54];
	assign io_deq_bits_cfi_is_br = _ram_ext_R0_data[55];
	assign io_deq_bits_cfi_is_jal = _ram_ext_R0_data[56];
	assign io_deq_bits_cfi_is_jalr = _ram_ext_R0_data[57];
	assign io_deq_bits_ghist_old_history = _ram_ext_R0_data[121:58];
	assign io_deq_bits_target = _ram_ext_R0_data[161:122];
	assign io_deq_bits_meta_0 = _ram_ext_R0_data[281:162];
endmodule
