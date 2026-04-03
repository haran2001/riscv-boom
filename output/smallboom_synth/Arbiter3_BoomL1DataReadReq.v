module Arbiter3_BoomL1DataReadReq (
	io_in_0_valid,
	io_in_0_bits_req_0_addr,
	io_in_1_ready,
	io_in_1_valid,
	io_in_1_bits_req_0_addr,
	io_in_2_ready,
	io_in_2_valid,
	io_in_2_bits_req_0_addr,
	io_in_2_bits_valid_0,
	io_out_valid,
	io_out_bits_req_0_addr,
	io_out_bits_valid_0
);
	input io_in_0_valid;
	input [11:0] io_in_0_bits_req_0_addr;
	output wire io_in_1_ready;
	input io_in_1_valid;
	input [11:0] io_in_1_bits_req_0_addr;
	output wire io_in_2_ready;
	input io_in_2_valid;
	input [11:0] io_in_2_bits_req_0_addr;
	input io_in_2_bits_valid_0;
	output wire io_out_valid;
	output wire [11:0] io_out_bits_req_0_addr;
	output wire io_out_bits_valid_0;
	wire _io_out_valid_T = io_in_0_valid | io_in_1_valid;
	assign io_in_1_ready = ~io_in_0_valid;
	assign io_in_2_ready = ~_io_out_valid_T;
	assign io_out_valid = _io_out_valid_T | io_in_2_valid;
	assign io_out_bits_req_0_addr = (io_in_0_valid ? io_in_0_bits_req_0_addr : (io_in_1_valid ? io_in_1_bits_req_0_addr : io_in_2_bits_req_0_addr));
	assign io_out_bits_valid_0 = (io_in_0_valid | io_in_1_valid) | io_in_2_bits_valid_0;
endmodule
