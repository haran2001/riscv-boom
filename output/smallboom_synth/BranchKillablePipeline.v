module BranchKillablePipeline (
	clock,
	reset,
	io_req_valid,
	io_req_bits_uop_br_mask,
	io_req_bits_uop_rob_idx,
	io_req_bits_uop_pdst,
	io_req_bits_uop_dst_rtype,
	io_flush,
	io_brupdate_b1_resolve_mask,
	io_brupdate_b1_mispredict_mask,
	io_resp_2_valid,
	io_resp_2_bits_uop_br_mask,
	io_resp_2_bits_uop_rob_idx,
	io_resp_2_bits_uop_pdst,
	io_resp_2_bits_uop_dst_rtype
);
	input clock;
	input reset;
	input io_req_valid;
	input [7:0] io_req_bits_uop_br_mask;
	input [4:0] io_req_bits_uop_rob_idx;
	input [5:0] io_req_bits_uop_pdst;
	input [1:0] io_req_bits_uop_dst_rtype;
	input io_flush;
	input [7:0] io_brupdate_b1_resolve_mask;
	input [7:0] io_brupdate_b1_mispredict_mask;
	output wire io_resp_2_valid;
	output wire [7:0] io_resp_2_bits_uop_br_mask;
	output wire [4:0] io_resp_2_bits_uop_rob_idx;
	output wire [5:0] io_resp_2_bits_uop_pdst;
	output wire [1:0] io_resp_2_bits_uop_dst_rtype;
	reg uops_0_valid;
	reg [7:0] uops_0_bits_uop_br_mask;
	reg [4:0] uops_0_bits_uop_rob_idx;
	reg [5:0] uops_0_bits_uop_pdst;
	reg [1:0] uops_0_bits_uop_dst_rtype;
	reg uops_1_valid;
	reg [7:0] uops_1_bits_uop_br_mask;
	reg [4:0] uops_1_bits_uop_rob_idx;
	reg [5:0] uops_1_bits_uop_pdst;
	reg [1:0] uops_1_bits_uop_dst_rtype;
	reg uops_2_valid;
	reg [7:0] uops_2_bits_uop_br_mask;
	reg [4:0] uops_2_bits_uop_rob_idx;
	reg [5:0] uops_2_bits_uop_pdst;
	reg [1:0] uops_2_bits_uop_dst_rtype;
	always @(posedge clock) begin
		if (reset) begin
			uops_0_valid <= 1'h0;
			uops_1_valid <= 1'h0;
			uops_2_valid <= 1'h0;
		end
		else begin
			uops_0_valid <= io_req_valid & ~(|(io_brupdate_b1_mispredict_mask & io_req_bits_uop_br_mask) | io_flush);
			uops_1_valid <= uops_0_valid & ~(|(io_brupdate_b1_mispredict_mask & uops_0_bits_uop_br_mask) | io_flush);
			uops_2_valid <= uops_1_valid & ~(|(io_brupdate_b1_mispredict_mask & uops_1_bits_uop_br_mask) | io_flush);
		end
		uops_0_bits_uop_br_mask <= io_req_bits_uop_br_mask & ~io_brupdate_b1_resolve_mask;
		uops_0_bits_uop_rob_idx <= io_req_bits_uop_rob_idx;
		uops_0_bits_uop_pdst <= io_req_bits_uop_pdst;
		uops_0_bits_uop_dst_rtype <= io_req_bits_uop_dst_rtype;
		uops_1_bits_uop_br_mask <= uops_0_bits_uop_br_mask & ~io_brupdate_b1_resolve_mask;
		uops_1_bits_uop_rob_idx <= uops_0_bits_uop_rob_idx;
		uops_1_bits_uop_pdst <= uops_0_bits_uop_pdst;
		uops_1_bits_uop_dst_rtype <= uops_0_bits_uop_dst_rtype;
		uops_2_bits_uop_br_mask <= uops_1_bits_uop_br_mask & ~io_brupdate_b1_resolve_mask;
		uops_2_bits_uop_rob_idx <= uops_1_bits_uop_rob_idx;
		uops_2_bits_uop_pdst <= uops_1_bits_uop_pdst;
		uops_2_bits_uop_dst_rtype <= uops_1_bits_uop_dst_rtype;
	end
	assign io_resp_2_valid = uops_2_valid;
	assign io_resp_2_bits_uop_br_mask = uops_2_bits_uop_br_mask;
	assign io_resp_2_bits_uop_rob_idx = uops_2_bits_uop_rob_idx;
	assign io_resp_2_bits_uop_pdst = uops_2_bits_uop_pdst;
	assign io_resp_2_bits_uop_dst_rtype = uops_2_bits_uop_dst_rtype;
endmodule
