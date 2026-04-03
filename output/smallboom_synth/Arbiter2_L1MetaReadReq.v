module Arbiter2_L1MetaReadReq (
	io_in_0_ready,
	io_in_0_valid,
	io_in_0_bits_idx,
	io_in_0_bits_way_en,
	io_in_0_bits_tag,
	io_in_1_ready,
	io_in_1_valid,
	io_in_1_bits_idx,
	io_in_1_bits_way_en,
	io_in_1_bits_tag,
	io_out_ready,
	io_out_valid,
	io_out_bits_idx,
	io_out_bits_way_en,
	io_out_bits_tag
);
	output wire io_in_0_ready;
	input io_in_0_valid;
	input [5:0] io_in_0_bits_idx;
	input [3:0] io_in_0_bits_way_en;
	input [19:0] io_in_0_bits_tag;
	output wire io_in_1_ready;
	input io_in_1_valid;
	input [5:0] io_in_1_bits_idx;
	input [3:0] io_in_1_bits_way_en;
	input [19:0] io_in_1_bits_tag;
	input io_out_ready;
	output wire io_out_valid;
	output wire [5:0] io_out_bits_idx;
	output wire [3:0] io_out_bits_way_en;
	output wire [19:0] io_out_bits_tag;
	assign io_in_0_ready = io_out_ready;
	assign io_in_1_ready = ~io_in_0_valid & io_out_ready;
	assign io_out_valid = io_in_0_valid | io_in_1_valid;
	assign io_out_bits_idx = (io_in_0_valid ? io_in_0_bits_idx : io_in_1_bits_idx);
	assign io_out_bits_way_en = (io_in_0_valid ? io_in_0_bits_way_en : io_in_1_bits_way_en);
	assign io_out_bits_tag = (io_in_0_valid ? io_in_0_bits_tag : io_in_1_bits_tag);
endmodule
