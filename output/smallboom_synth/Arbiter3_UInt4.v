module Arbiter3_UInt4 (
	io_in_0_valid,
	io_in_0_bits,
	io_in_1_valid,
	io_in_1_bits,
	io_in_2_ready,
	io_in_2_bits,
	io_out_bits
);
	input io_in_0_valid;
	input [3:0] io_in_0_bits;
	input io_in_1_valid;
	input [3:0] io_in_1_bits;
	output wire io_in_2_ready;
	input [3:0] io_in_2_bits;
	output wire [3:0] io_out_bits;
	assign io_in_2_ready = ~(io_in_0_valid | io_in_1_valid);
	assign io_out_bits = (io_in_0_valid ? io_in_0_bits : (io_in_1_valid ? io_in_1_bits : io_in_2_bits));
endmodule
