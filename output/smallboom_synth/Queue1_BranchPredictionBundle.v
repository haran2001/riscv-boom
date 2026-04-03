module Queue1_BranchPredictionBundle (
	clock,
	reset,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits_pc,
	io_enq_bits_preds_0_taken,
	io_enq_bits_preds_0_is_br,
	io_enq_bits_preds_0_is_jal,
	io_enq_bits_preds_0_predicted_pc_valid,
	io_enq_bits_preds_0_predicted_pc_bits,
	io_enq_bits_preds_1_taken,
	io_enq_bits_preds_1_is_br,
	io_enq_bits_preds_1_is_jal,
	io_enq_bits_preds_1_predicted_pc_valid,
	io_enq_bits_preds_1_predicted_pc_bits,
	io_enq_bits_preds_2_taken,
	io_enq_bits_preds_2_is_br,
	io_enq_bits_preds_2_is_jal,
	io_enq_bits_preds_2_predicted_pc_valid,
	io_enq_bits_preds_2_predicted_pc_bits,
	io_enq_bits_preds_3_taken,
	io_enq_bits_preds_3_is_br,
	io_enq_bits_preds_3_is_jal,
	io_enq_bits_preds_3_predicted_pc_valid,
	io_enq_bits_preds_3_predicted_pc_bits,
	io_enq_bits_meta_0,
	io_deq_ready,
	io_deq_bits_pc,
	io_deq_bits_preds_0_taken,
	io_deq_bits_preds_0_is_br,
	io_deq_bits_preds_0_predicted_pc_valid,
	io_deq_bits_preds_0_predicted_pc_bits,
	io_deq_bits_preds_1_taken,
	io_deq_bits_preds_1_is_br,
	io_deq_bits_preds_1_predicted_pc_valid,
	io_deq_bits_preds_1_predicted_pc_bits,
	io_deq_bits_preds_2_taken,
	io_deq_bits_preds_2_is_br,
	io_deq_bits_preds_2_predicted_pc_valid,
	io_deq_bits_preds_2_predicted_pc_bits,
	io_deq_bits_preds_3_taken,
	io_deq_bits_preds_3_is_br,
	io_deq_bits_preds_3_predicted_pc_valid,
	io_deq_bits_preds_3_predicted_pc_bits,
	io_deq_bits_meta_0,
	io_deq_bits_lhist_0
);
	input clock;
	input reset;
	output wire io_enq_ready;
	input io_enq_valid;
	input [39:0] io_enq_bits_pc;
	input io_enq_bits_preds_0_taken;
	input io_enq_bits_preds_0_is_br;
	input io_enq_bits_preds_0_is_jal;
	input io_enq_bits_preds_0_predicted_pc_valid;
	input [39:0] io_enq_bits_preds_0_predicted_pc_bits;
	input io_enq_bits_preds_1_taken;
	input io_enq_bits_preds_1_is_br;
	input io_enq_bits_preds_1_is_jal;
	input io_enq_bits_preds_1_predicted_pc_valid;
	input [39:0] io_enq_bits_preds_1_predicted_pc_bits;
	input io_enq_bits_preds_2_taken;
	input io_enq_bits_preds_2_is_br;
	input io_enq_bits_preds_2_is_jal;
	input io_enq_bits_preds_2_predicted_pc_valid;
	input [39:0] io_enq_bits_preds_2_predicted_pc_bits;
	input io_enq_bits_preds_3_taken;
	input io_enq_bits_preds_3_is_br;
	input io_enq_bits_preds_3_is_jal;
	input io_enq_bits_preds_3_predicted_pc_valid;
	input [39:0] io_enq_bits_preds_3_predicted_pc_bits;
	input [119:0] io_enq_bits_meta_0;
	input io_deq_ready;
	output wire [39:0] io_deq_bits_pc;
	output wire io_deq_bits_preds_0_taken;
	output wire io_deq_bits_preds_0_is_br;
	output wire io_deq_bits_preds_0_predicted_pc_valid;
	output wire [39:0] io_deq_bits_preds_0_predicted_pc_bits;
	output wire io_deq_bits_preds_1_taken;
	output wire io_deq_bits_preds_1_is_br;
	output wire io_deq_bits_preds_1_predicted_pc_valid;
	output wire [39:0] io_deq_bits_preds_1_predicted_pc_bits;
	output wire io_deq_bits_preds_2_taken;
	output wire io_deq_bits_preds_2_is_br;
	output wire io_deq_bits_preds_2_predicted_pc_valid;
	output wire [39:0] io_deq_bits_preds_2_predicted_pc_bits;
	output wire io_deq_bits_preds_3_taken;
	output wire io_deq_bits_preds_3_is_br;
	output wire io_deq_bits_preds_3_predicted_pc_valid;
	output wire [39:0] io_deq_bits_preds_3_predicted_pc_bits;
	output wire [119:0] io_deq_bits_meta_0;
	output wire io_deq_bits_lhist_0;
	wire io_enq_ready_0;
	reg [336:0] ram;
	reg full;
	wire do_enq = (~(~full & io_deq_ready) & io_enq_ready_0) & io_enq_valid;
	assign io_enq_ready_0 = io_deq_ready | ~full;
	always @(posedge clock) begin
		if (do_enq)
			ram <= {1'h0, io_enq_bits_meta_0, io_enq_bits_preds_3_predicted_pc_bits, io_enq_bits_preds_3_predicted_pc_valid, io_enq_bits_preds_3_is_jal, io_enq_bits_preds_3_is_br, io_enq_bits_preds_3_taken, io_enq_bits_preds_2_predicted_pc_bits, io_enq_bits_preds_2_predicted_pc_valid, io_enq_bits_preds_2_is_jal, io_enq_bits_preds_2_is_br, io_enq_bits_preds_2_taken, io_enq_bits_preds_1_predicted_pc_bits, io_enq_bits_preds_1_predicted_pc_valid, io_enq_bits_preds_1_is_jal, io_enq_bits_preds_1_is_br, io_enq_bits_preds_1_taken, io_enq_bits_preds_0_predicted_pc_bits, io_enq_bits_preds_0_predicted_pc_valid, io_enq_bits_preds_0_is_jal, io_enq_bits_preds_0_is_br, io_enq_bits_preds_0_taken, io_enq_bits_pc};
		if (reset)
			full <= 1'h0;
		else if (~(do_enq == ((full & io_deq_ready) & (io_enq_valid | full))))
			full <= do_enq;
	end
	assign io_enq_ready = io_enq_ready_0;
	assign io_deq_bits_pc = (full ? ram[39:0] : io_enq_bits_pc);
	assign io_deq_bits_preds_0_taken = (full ? ram[40] : io_enq_bits_preds_0_taken);
	assign io_deq_bits_preds_0_is_br = (full ? ram[41] : io_enq_bits_preds_0_is_br);
	assign io_deq_bits_preds_0_predicted_pc_valid = (full ? ram[43] : io_enq_bits_preds_0_predicted_pc_valid);
	assign io_deq_bits_preds_0_predicted_pc_bits = (full ? ram[83:44] : io_enq_bits_preds_0_predicted_pc_bits);
	assign io_deq_bits_preds_1_taken = (full ? ram[84] : io_enq_bits_preds_1_taken);
	assign io_deq_bits_preds_1_is_br = (full ? ram[85] : io_enq_bits_preds_1_is_br);
	assign io_deq_bits_preds_1_predicted_pc_valid = (full ? ram[87] : io_enq_bits_preds_1_predicted_pc_valid);
	assign io_deq_bits_preds_1_predicted_pc_bits = (full ? ram[127:88] : io_enq_bits_preds_1_predicted_pc_bits);
	assign io_deq_bits_preds_2_taken = (full ? ram[128] : io_enq_bits_preds_2_taken);
	assign io_deq_bits_preds_2_is_br = (full ? ram[129] : io_enq_bits_preds_2_is_br);
	assign io_deq_bits_preds_2_predicted_pc_valid = (full ? ram[131] : io_enq_bits_preds_2_predicted_pc_valid);
	assign io_deq_bits_preds_2_predicted_pc_bits = (full ? ram[171:132] : io_enq_bits_preds_2_predicted_pc_bits);
	assign io_deq_bits_preds_3_taken = (full ? ram[172] : io_enq_bits_preds_3_taken);
	assign io_deq_bits_preds_3_is_br = (full ? ram[173] : io_enq_bits_preds_3_is_br);
	assign io_deq_bits_preds_3_predicted_pc_valid = (full ? ram[175] : io_enq_bits_preds_3_predicted_pc_valid);
	assign io_deq_bits_preds_3_predicted_pc_bits = (full ? ram[215:176] : io_enq_bits_preds_3_predicted_pc_bits);
	assign io_deq_bits_meta_0 = (full ? ram[335:216] : io_enq_bits_meta_0);
	assign io_deq_bits_lhist_0 = full & ram[336];
endmodule
