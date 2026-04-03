module Arbiter2_Wakeup (
	io_in_0_valid,
	io_in_0_bits_uop_pdst,
	io_in_0_bits_uop_dst_rtype,
	io_in_0_bits_bypassable,
	io_in_0_bits_rebusy,
	io_in_1_ready,
	io_in_1_valid,
	io_in_1_bits_uop_pdst,
	io_in_1_bits_uop_dst_rtype,
	io_out_valid,
	io_out_bits_uop_pdst,
	io_out_bits_uop_dst_rtype,
	io_out_bits_bypassable,
	io_out_bits_rebusy
);
	input io_in_0_valid;
	input [5:0] io_in_0_bits_uop_pdst;
	input [1:0] io_in_0_bits_uop_dst_rtype;
	input io_in_0_bits_bypassable;
	input io_in_0_bits_rebusy;
	output wire io_in_1_ready;
	input io_in_1_valid;
	input [5:0] io_in_1_bits_uop_pdst;
	input [1:0] io_in_1_bits_uop_dst_rtype;
	output wire io_out_valid;
	output wire [5:0] io_out_bits_uop_pdst;
	output wire [1:0] io_out_bits_uop_dst_rtype;
	output wire io_out_bits_bypassable;
	output wire io_out_bits_rebusy;
	assign io_in_1_ready = ~io_in_0_valid;
	assign io_out_valid = io_in_0_valid | io_in_1_valid;
	assign io_out_bits_uop_pdst = (io_in_0_valid ? io_in_0_bits_uop_pdst : io_in_1_bits_uop_pdst);
	assign io_out_bits_uop_dst_rtype = (io_in_0_valid ? io_in_0_bits_uop_dst_rtype : io_in_1_bits_uop_dst_rtype);
	assign io_out_bits_bypassable = ~io_in_0_valid | io_in_0_bits_bypassable;
	assign io_out_bits_rebusy = io_in_0_valid & io_in_0_bits_rebusy;
endmodule
