module Arbiter3_ExeUnitResp (
	io_in_0_valid,
	io_in_0_bits_uop_rob_idx,
	io_in_0_bits_uop_pdst,
	io_in_0_bits_uop_dst_rtype,
	io_in_0_bits_data,
	io_in_1_ready,
	io_in_1_valid,
	io_in_1_bits_uop_rob_idx,
	io_in_1_bits_uop_pdst,
	io_in_1_bits_uop_dst_rtype,
	io_in_1_bits_data,
	io_in_1_bits_predicated,
	io_in_1_bits_fflags_valid,
	io_in_1_bits_fflags_bits,
	io_in_2_ready,
	io_in_2_valid,
	io_in_2_bits_uop_rob_idx,
	io_in_2_bits_uop_pdst,
	io_in_2_bits_uop_dst_rtype,
	io_in_2_bits_data,
	io_in_2_bits_fflags_valid,
	io_in_2_bits_fflags_bits,
	io_out_valid,
	io_out_bits_uop_rob_idx,
	io_out_bits_uop_pdst,
	io_out_bits_uop_dst_rtype,
	io_out_bits_data,
	io_out_bits_predicated,
	io_out_bits_fflags_valid,
	io_out_bits_fflags_bits
);
	input io_in_0_valid;
	input [4:0] io_in_0_bits_uop_rob_idx;
	input [5:0] io_in_0_bits_uop_pdst;
	input [1:0] io_in_0_bits_uop_dst_rtype;
	input [64:0] io_in_0_bits_data;
	output wire io_in_1_ready;
	input io_in_1_valid;
	input [4:0] io_in_1_bits_uop_rob_idx;
	input [5:0] io_in_1_bits_uop_pdst;
	input [1:0] io_in_1_bits_uop_dst_rtype;
	input [64:0] io_in_1_bits_data;
	input io_in_1_bits_predicated;
	input io_in_1_bits_fflags_valid;
	input [4:0] io_in_1_bits_fflags_bits;
	output wire io_in_2_ready;
	input io_in_2_valid;
	input [4:0] io_in_2_bits_uop_rob_idx;
	input [5:0] io_in_2_bits_uop_pdst;
	input [1:0] io_in_2_bits_uop_dst_rtype;
	input [64:0] io_in_2_bits_data;
	input io_in_2_bits_fflags_valid;
	input [4:0] io_in_2_bits_fflags_bits;
	output wire io_out_valid;
	output wire [4:0] io_out_bits_uop_rob_idx;
	output wire [5:0] io_out_bits_uop_pdst;
	output wire [1:0] io_out_bits_uop_dst_rtype;
	output wire [64:0] io_out_bits_data;
	output wire io_out_bits_predicated;
	output wire io_out_bits_fflags_valid;
	output wire [4:0] io_out_bits_fflags_bits;
	wire _io_out_valid_T = io_in_0_valid | io_in_1_valid;
	assign io_in_1_ready = ~io_in_0_valid;
	assign io_in_2_ready = ~_io_out_valid_T;
	assign io_out_valid = _io_out_valid_T | io_in_2_valid;
	assign io_out_bits_uop_rob_idx = (io_in_0_valid ? io_in_0_bits_uop_rob_idx : (io_in_1_valid ? io_in_1_bits_uop_rob_idx : io_in_2_bits_uop_rob_idx));
	assign io_out_bits_uop_pdst = (io_in_0_valid ? io_in_0_bits_uop_pdst : (io_in_1_valid ? io_in_1_bits_uop_pdst : io_in_2_bits_uop_pdst));
	assign io_out_bits_uop_dst_rtype = (io_in_0_valid ? io_in_0_bits_uop_dst_rtype : (io_in_1_valid ? io_in_1_bits_uop_dst_rtype : io_in_2_bits_uop_dst_rtype));
	assign io_out_bits_data = (io_in_0_valid ? io_in_0_bits_data : (io_in_1_valid ? io_in_1_bits_data : io_in_2_bits_data));
	assign io_out_bits_predicated = (~io_in_0_valid & io_in_1_valid) & io_in_1_bits_predicated;
	assign io_out_bits_fflags_valid = ~io_in_0_valid & (io_in_1_valid ? io_in_1_bits_fflags_valid : io_in_2_bits_fflags_valid);
	assign io_out_bits_fflags_bits = (io_in_0_valid ? 5'h00 : (io_in_1_valid ? io_in_1_bits_fflags_bits : io_in_2_bits_fflags_bits));
endmodule
