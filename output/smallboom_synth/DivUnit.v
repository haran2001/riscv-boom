module DivUnit (
	clock,
	reset,
	io_kill,
	io_req_ready,
	io_req_valid,
	io_req_bits_uop_br_mask,
	io_req_bits_uop_rob_idx,
	io_req_bits_uop_pdst,
	io_req_bits_uop_dst_rtype,
	io_req_bits_uop_fcn_dw,
	io_req_bits_uop_fcn_op,
	io_req_bits_rs1_data,
	io_req_bits_rs2_data,
	io_resp_ready,
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
	output wire io_req_ready;
	input io_req_valid;
	input [7:0] io_req_bits_uop_br_mask;
	input [4:0] io_req_bits_uop_rob_idx;
	input [5:0] io_req_bits_uop_pdst;
	input [1:0] io_req_bits_uop_dst_rtype;
	input io_req_bits_uop_fcn_dw;
	input [4:0] io_req_bits_uop_fcn_op;
	input [63:0] io_req_bits_rs1_data;
	input [63:0] io_req_bits_rs2_data;
	input io_resp_ready;
	output wire io_resp_valid;
	output wire [7:0] io_resp_bits_uop_br_mask;
	output wire [4:0] io_resp_bits_uop_rob_idx;
	output wire [5:0] io_resp_bits_uop_pdst;
	output wire [1:0] io_resp_bits_uop_dst_rtype;
	output wire [63:0] io_resp_bits_data;
	input [7:0] io_brupdate_b1_resolve_mask;
	input [7:0] io_brupdate_b1_mispredict_mask;
	wire _div_io_req_ready;
	wire _div_io_resp_valid;
	reg req_valid;
	reg [7:0] req_bits_br_mask;
	reg [4:0] req_bits_rob_idx;
	reg [5:0] req_bits_pdst;
	reg [1:0] req_bits_dst_rtype;
	wire io_req_ready_0 = _div_io_req_ready & ~req_valid;
	wire io_resp_valid_0 = _div_io_resp_valid & req_valid;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg _GEN;
		_GEN = io_req_ready_0 & io_req_valid;
		req_valid <= ~((io_resp_ready & io_resp_valid_0) | reset) & (_GEN ? ~(|(io_brupdate_b1_mispredict_mask & io_req_bits_uop_br_mask) | io_kill) : ~(|(io_brupdate_b1_mispredict_mask & req_bits_br_mask) | io_kill) & req_valid);
		if (_GEN) begin
			req_bits_br_mask <= io_req_bits_uop_br_mask & ~io_brupdate_b1_resolve_mask;
			req_bits_rob_idx <= io_req_bits_uop_rob_idx;
			req_bits_pdst <= io_req_bits_uop_pdst;
			req_bits_dst_rtype <= io_req_bits_uop_dst_rtype;
		end
		else
			req_bits_br_mask <= req_bits_br_mask & ~io_brupdate_b1_resolve_mask;
	end
	MulDiv div(
		.clock(clock),
		.reset(reset),
		.io_req_ready(_div_io_req_ready),
		.io_req_valid(io_req_valid & ~(|(io_brupdate_b1_mispredict_mask & io_req_bits_uop_br_mask) | io_kill)),
		.io_req_bits_fn(io_req_bits_uop_fcn_op),
		.io_req_bits_dw(io_req_bits_uop_fcn_dw),
		.io_req_bits_in1(io_req_bits_rs1_data),
		.io_req_bits_in2(io_req_bits_rs2_data),
		.io_kill(req_valid & (|(io_brupdate_b1_mispredict_mask & req_bits_br_mask) | io_kill)),
		.io_resp_ready(io_resp_ready),
		.io_resp_valid(_div_io_resp_valid),
		.io_resp_bits_data(io_resp_bits_data)
	);
	assign io_req_ready = io_req_ready_0;
	assign io_resp_valid = io_resp_valid_0;
	assign io_resp_bits_uop_br_mask = req_bits_br_mask;
	assign io_resp_bits_uop_rob_idx = req_bits_rob_idx;
	assign io_resp_bits_uop_pdst = req_bits_pdst;
	assign io_resp_bits_uop_dst_rtype = req_bits_dst_rtype;
endmodule
