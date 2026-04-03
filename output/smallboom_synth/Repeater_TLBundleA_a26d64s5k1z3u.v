module Repeater_TLBundleA_a26d64s5k1z3u (
	clock,
	reset,
	io_repeat,
	io_full,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits_opcode,
	io_enq_bits_param,
	io_enq_bits_size,
	io_enq_bits_source,
	io_enq_bits_address,
	io_enq_bits_mask,
	io_enq_bits_corrupt,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits_opcode,
	io_deq_bits_param,
	io_deq_bits_size,
	io_deq_bits_source,
	io_deq_bits_address,
	io_deq_bits_mask,
	io_deq_bits_corrupt
);
	input clock;
	input reset;
	input io_repeat;
	output wire io_full;
	output wire io_enq_ready;
	input io_enq_valid;
	input [2:0] io_enq_bits_opcode;
	input [2:0] io_enq_bits_param;
	input [2:0] io_enq_bits_size;
	input [4:0] io_enq_bits_source;
	input [25:0] io_enq_bits_address;
	input [7:0] io_enq_bits_mask;
	input io_enq_bits_corrupt;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire [2:0] io_deq_bits_opcode;
	output wire [2:0] io_deq_bits_param;
	output wire [2:0] io_deq_bits_size;
	output wire [4:0] io_deq_bits_source;
	output wire [25:0] io_deq_bits_address;
	output wire [7:0] io_deq_bits_mask;
	output wire io_deq_bits_corrupt;
	reg full;
	reg [2:0] saved_opcode;
	reg [2:0] saved_param;
	reg [2:0] saved_size;
	reg [4:0] saved_source;
	reg [25:0] saved_address;
	reg [7:0] saved_mask;
	reg saved_corrupt;
	wire io_deq_valid_0 = io_enq_valid | full;
	wire io_enq_ready_0 = io_deq_ready & ~full;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg _GEN;
		_GEN = (io_enq_ready_0 & io_enq_valid) & io_repeat;
		if (reset)
			full <= 1'h0;
		else
			full <= ~((io_deq_ready & io_deq_valid_0) & ~io_repeat) & (_GEN | full);
		if (_GEN) begin
			saved_opcode <= io_enq_bits_opcode;
			saved_param <= io_enq_bits_param;
			saved_size <= io_enq_bits_size;
			saved_source <= io_enq_bits_source;
			saved_address <= io_enq_bits_address;
			saved_mask <= io_enq_bits_mask;
			saved_corrupt <= io_enq_bits_corrupt;
		end
	end
	assign io_full = full;
	assign io_enq_ready = io_enq_ready_0;
	assign io_deq_valid = io_deq_valid_0;
	assign io_deq_bits_opcode = (full ? saved_opcode : io_enq_bits_opcode);
	assign io_deq_bits_param = (full ? saved_param : io_enq_bits_param);
	assign io_deq_bits_size = (full ? saved_size : io_enq_bits_size);
	assign io_deq_bits_source = (full ? saved_source : io_enq_bits_source);
	assign io_deq_bits_address = (full ? saved_address : io_enq_bits_address);
	assign io_deq_bits_mask = (full ? saved_mask : io_enq_bits_mask);
	assign io_deq_bits_corrupt = (full ? saved_corrupt : io_enq_bits_corrupt);
endmodule
