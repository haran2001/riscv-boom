module Arbiter3_Valid_PTWReq (
	io_in_0_ready,
	io_in_0_valid,
	io_in_0_bits_valid,
	io_in_0_bits_bits_addr,
	io_in_1_ready,
	io_in_1_valid,
	io_in_1_bits_bits_addr,
	io_in_1_bits_bits_need_gpa,
	io_out_ready,
	io_out_valid,
	io_out_bits_valid,
	io_out_bits_bits_addr,
	io_out_bits_bits_need_gpa,
	io_chosen
);
	output wire io_in_0_ready;
	input io_in_0_valid;
	input io_in_0_bits_valid;
	input [26:0] io_in_0_bits_bits_addr;
	output wire io_in_1_ready;
	input io_in_1_valid;
	input [26:0] io_in_1_bits_bits_addr;
	input io_in_1_bits_bits_need_gpa;
	input io_out_ready;
	output wire io_out_valid;
	output wire io_out_bits_valid;
	output wire [26:0] io_out_bits_bits_addr;
	output wire io_out_bits_bits_need_gpa;
	output wire [1:0] io_chosen;
	assign io_in_0_ready = io_out_ready;
	assign io_in_1_ready = ~io_in_0_valid & io_out_ready;
	assign io_out_valid = io_in_0_valid | io_in_1_valid;
	assign io_out_bits_valid = (io_in_0_valid ? io_in_0_bits_valid : io_in_1_valid);
	assign io_out_bits_bits_addr = (io_in_0_valid ? io_in_0_bits_bits_addr : (io_in_1_valid ? io_in_1_bits_bits_addr : 27'h0000000));
	assign io_out_bits_bits_need_gpa = (~io_in_0_valid & io_in_1_valid) & io_in_1_bits_bits_need_gpa;
	assign io_chosen = (io_in_0_valid ? 2'h0 : (io_in_1_valid ? 2'h1 : 2'h2));
endmodule
