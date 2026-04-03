module Arbiter6_BoomL1MetaReadReq (
	io_in_0_ready,
	io_in_0_valid,
	io_in_0_bits_req_0_idx,
	io_in_1_ready,
	io_in_1_valid,
	io_in_1_bits_req_0_idx,
	io_in_2_ready,
	io_in_2_valid,
	io_in_2_bits_req_0_idx,
	io_in_3_ready,
	io_in_3_valid,
	io_in_3_bits_req_0_idx,
	io_in_4_ready,
	io_in_4_valid,
	io_in_4_bits_req_0_idx,
	io_out_ready,
	io_out_valid,
	io_out_bits_req_0_idx
);
	output wire io_in_0_ready;
	input io_in_0_valid;
	input [5:0] io_in_0_bits_req_0_idx;
	output wire io_in_1_ready;
	input io_in_1_valid;
	input [5:0] io_in_1_bits_req_0_idx;
	output wire io_in_2_ready;
	input io_in_2_valid;
	input [5:0] io_in_2_bits_req_0_idx;
	output wire io_in_3_ready;
	input io_in_3_valid;
	input [5:0] io_in_3_bits_req_0_idx;
	output wire io_in_4_ready;
	input io_in_4_valid;
	input [5:0] io_in_4_bits_req_0_idx;
	input io_out_ready;
	output wire io_out_valid;
	output wire [5:0] io_out_bits_req_0_idx;
	wire _grant_T = io_in_0_valid | io_in_1_valid;
	wire _grant_T_1 = _grant_T | io_in_2_valid;
	wire _grant_T_2 = _grant_T_1 | io_in_3_valid;
	assign io_in_0_ready = io_out_ready;
	assign io_in_1_ready = ~io_in_0_valid & io_out_ready;
	assign io_in_2_ready = ~_grant_T & io_out_ready;
	assign io_in_3_ready = ~_grant_T_1 & io_out_ready;
	assign io_in_4_ready = ~_grant_T_2 & io_out_ready;
	assign io_out_valid = _grant_T_2 | io_in_4_valid;
	assign io_out_bits_req_0_idx = (io_in_0_valid ? io_in_0_bits_req_0_idx : (io_in_1_valid ? io_in_1_bits_req_0_idx : (io_in_2_valid ? io_in_2_bits_req_0_idx : (io_in_3_valid ? io_in_3_bits_req_0_idx : (io_in_4_valid ? io_in_4_bits_req_0_idx : 6'h00)))));
endmodule
