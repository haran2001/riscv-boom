module Arbiter2_TLBundleC_a32d64s2k2z4c (
	io_in_0_ready,
	io_in_0_valid,
	io_in_0_bits_address,
	io_in_1_ready,
	io_in_1_valid,
	io_in_1_bits_address,
	io_out_ready,
	io_out_valid,
	io_out_bits_address
);
	output wire io_in_0_ready;
	input io_in_0_valid;
	input [31:0] io_in_0_bits_address;
	output wire io_in_1_ready;
	input io_in_1_valid;
	input [31:0] io_in_1_bits_address;
	input io_out_ready;
	output wire io_out_valid;
	output wire [31:0] io_out_bits_address;
	assign io_in_0_ready = io_out_ready;
	assign io_in_1_ready = ~io_in_0_valid & io_out_ready;
	assign io_out_valid = io_in_0_valid | io_in_1_valid;
	assign io_out_bits_address = (io_in_0_valid ? io_in_0_bits_address : io_in_1_bits_address);
endmodule
