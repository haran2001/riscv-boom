module PipelinedMulUnit (
	clock,
	reset,
	io_kill,
	io_req_valid,
	io_req_bits_uop_br_mask,
	io_req_bits_uop_rob_idx,
	io_req_bits_uop_pdst,
	io_req_bits_uop_dst_rtype,
	io_req_bits_uop_fcn_dw,
	io_req_bits_uop_fcn_op,
	io_req_bits_rs1_data,
	io_req_bits_rs2_data,
	io_resp_valid,
	io_resp_bits_uop_br_mask,
	io_resp_bits_uop_rob_idx,
	io_resp_bits_uop_pdst,
	io_resp_bits_uop_dst_rtype,
	io_resp_bits_data,
	io_brupdate_b1_resolve_mask,
	io_brupdate_b1_mispredict_mask
);
	input clock;
	input reset;
	input io_kill;
	input io_req_valid;
	input [7:0] io_req_bits_uop_br_mask;
	input [4:0] io_req_bits_uop_rob_idx;
	input [5:0] io_req_bits_uop_pdst;
	input [1:0] io_req_bits_uop_dst_rtype;
	input io_req_bits_uop_fcn_dw;
	input [4:0] io_req_bits_uop_fcn_op;
	input [63:0] io_req_bits_rs1_data;
	input [63:0] io_req_bits_rs2_data;
	output wire io_resp_valid;
	output wire [7:0] io_resp_bits_uop_br_mask;
	output wire [4:0] io_resp_bits_uop_rob_idx;
	output wire [5:0] io_resp_bits_uop_pdst;
	output wire [1:0] io_resp_bits_uop_dst_rtype;
	output wire [63:0] io_resp_bits_data;
	input [7:0] io_brupdate_b1_resolve_mask;
	input [7:0] io_brupdate_b1_mispredict_mask;
	PipelinedMultiplier imul(
		.clock(clock),
		.reset(reset),
		.io_req_valid(io_req_valid),
		.io_req_bits_fn(io_req_bits_uop_fcn_op),
		.io_req_bits_dw(io_req_bits_uop_fcn_dw),
		.io_req_bits_in1(io_req_bits_rs1_data),
		.io_req_bits_in2(io_req_bits_rs2_data),
		.io_resp_bits_data(io_resp_bits_data)
	);
	BranchKillablePipeline pipe(
		.clock(clock),
		.reset(reset),
		.io_req_valid(io_req_valid),
		.io_req_bits_uop_br_mask(io_req_bits_uop_br_mask),
		.io_req_bits_uop_rob_idx(io_req_bits_uop_rob_idx),
		.io_req_bits_uop_pdst(io_req_bits_uop_pdst),
		.io_req_bits_uop_dst_rtype(io_req_bits_uop_dst_rtype),
		.io_flush(io_kill),
		.io_brupdate_b1_resolve_mask(io_brupdate_b1_resolve_mask),
		.io_brupdate_b1_mispredict_mask(io_brupdate_b1_mispredict_mask),
		.io_resp_2_valid(io_resp_valid),
		.io_resp_2_bits_uop_br_mask(io_resp_bits_uop_br_mask),
		.io_resp_2_bits_uop_rob_idx(io_resp_bits_uop_rob_idx),
		.io_resp_2_bits_uop_pdst(io_resp_bits_uop_pdst),
		.io_resp_2_bits_uop_dst_rtype(io_resp_bits_uop_dst_rtype)
	);
endmodule
