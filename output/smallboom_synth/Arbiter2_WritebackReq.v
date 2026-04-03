module Arbiter2_WritebackReq (
	io_in_0_ready,
	io_in_0_valid,
	io_in_0_bits_tag,
	io_in_0_bits_idx,
	io_in_0_bits_source,
	io_in_0_bits_param,
	io_in_0_bits_way_en,
	io_in_0_bits_voluntary,
	io_in_1_ready,
	io_in_1_valid,
	io_in_1_bits_tag,
	io_in_1_bits_idx,
	io_in_1_bits_source,
	io_in_1_bits_param,
	io_in_1_bits_way_en,
	io_in_1_bits_voluntary,
	io_out_ready,
	io_out_valid,
	io_out_bits_tag,
	io_out_bits_idx,
	io_out_bits_source,
	io_out_bits_param,
	io_out_bits_way_en,
	io_out_bits_voluntary
);
	output wire io_in_0_ready;
	input io_in_0_valid;
	input [19:0] io_in_0_bits_tag;
	input [5:0] io_in_0_bits_idx;
	input [1:0] io_in_0_bits_source;
	input [2:0] io_in_0_bits_param;
	input [3:0] io_in_0_bits_way_en;
	input io_in_0_bits_voluntary;
	output wire io_in_1_ready;
	input io_in_1_valid;
	input [19:0] io_in_1_bits_tag;
	input [5:0] io_in_1_bits_idx;
	input [1:0] io_in_1_bits_source;
	input [2:0] io_in_1_bits_param;
	input [3:0] io_in_1_bits_way_en;
	input io_in_1_bits_voluntary;
	input io_out_ready;
	output wire io_out_valid;
	output wire [19:0] io_out_bits_tag;
	output wire [5:0] io_out_bits_idx;
	output wire [1:0] io_out_bits_source;
	output wire [2:0] io_out_bits_param;
	output wire [3:0] io_out_bits_way_en;
	output wire io_out_bits_voluntary;
	assign io_in_0_ready = io_out_ready;
	assign io_in_1_ready = ~io_in_0_valid & io_out_ready;
	assign io_out_valid = io_in_0_valid | io_in_1_valid;
	assign io_out_bits_tag = (io_in_0_valid ? io_in_0_bits_tag : io_in_1_bits_tag);
	assign io_out_bits_idx = (io_in_0_valid ? io_in_0_bits_idx : io_in_1_bits_idx);
	assign io_out_bits_source = (io_in_0_valid ? io_in_0_bits_source : io_in_1_bits_source);
	assign io_out_bits_param = (io_in_0_valid ? io_in_0_bits_param : io_in_1_bits_param);
	assign io_out_bits_way_en = (io_in_0_valid ? io_in_0_bits_way_en : io_in_1_bits_way_en);
	assign io_out_bits_voluntary = (io_in_0_valid ? io_in_0_bits_voluntary : io_in_1_bits_voluntary);
endmodule
