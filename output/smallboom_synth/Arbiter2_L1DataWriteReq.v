module Arbiter2_L1DataWriteReq (
	io_in_0_ready,
	io_in_0_valid,
	io_in_0_bits_way_en,
	io_in_0_bits_addr,
	io_in_0_bits_data,
	io_in_1_ready,
	io_in_1_valid,
	io_in_1_bits_way_en,
	io_in_1_bits_addr,
	io_in_1_bits_data,
	io_out_ready,
	io_out_valid,
	io_out_bits_way_en,
	io_out_bits_addr,
	io_out_bits_data
);
	output wire io_in_0_ready;
	input io_in_0_valid;
	input [3:0] io_in_0_bits_way_en;
	input [11:0] io_in_0_bits_addr;
	input [63:0] io_in_0_bits_data;
	output wire io_in_1_ready;
	input io_in_1_valid;
	input [3:0] io_in_1_bits_way_en;
	input [11:0] io_in_1_bits_addr;
	input [63:0] io_in_1_bits_data;
	input io_out_ready;
	output wire io_out_valid;
	output wire [3:0] io_out_bits_way_en;
	output wire [11:0] io_out_bits_addr;
	output wire [63:0] io_out_bits_data;
	assign io_in_0_ready = io_out_ready;
	assign io_in_1_ready = ~io_in_0_valid & io_out_ready;
	assign io_out_valid = io_in_0_valid | io_in_1_valid;
	assign io_out_bits_way_en = (io_in_0_valid ? io_in_0_bits_way_en : io_in_1_bits_way_en);
	assign io_out_bits_addr = (io_in_0_valid ? io_in_0_bits_addr : io_in_1_bits_addr);
	assign io_out_bits_data = (io_in_0_valid ? io_in_0_bits_data : io_in_1_bits_data);
endmodule
