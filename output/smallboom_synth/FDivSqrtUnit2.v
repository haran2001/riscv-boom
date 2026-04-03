module FDivSqrtUnit2 (
	clock,
	reset,
	io_kill,
	io_req_ready,
	io_req_valid,
	io_req_bits_uop_br_mask,
	io_req_bits_uop_fp_ctrl_ren2,
	io_req_bits_uop_fp_ctrl_typeTagIn,
	io_req_bits_uop_fp_ctrl_typeTagOut,
	io_req_bits_uop_fp_ctrl_div,
	io_req_bits_uop_fp_ctrl_sqrt,
	io_req_bits_uop_fp_ctrl_wflags,
	io_req_bits_uop_rob_idx,
	io_req_bits_uop_pdst,
	io_req_bits_uop_dst_rtype,
	io_req_bits_uop_fp_rm,
	io_req_bits_uop_fp_typ,
	io_req_bits_rs1_data,
	io_req_bits_rs2_data,
	io_resp_ready,
	io_resp_valid,
	io_resp_bits_uop_rob_idx,
	io_resp_bits_uop_pdst,
	io_resp_bits_uop_dst_rtype,
	io_resp_bits_data,
	io_resp_bits_fflags_valid,
	io_resp_bits_fflags_bits,
	io_brupdate_b1_resolve_mask,
	io_brupdate_b1_mispredict_mask
);
	input clock;
	input reset;
	input io_kill;
	output wire io_req_ready;
	input io_req_valid;
	input [7:0] io_req_bits_uop_br_mask;
	input io_req_bits_uop_fp_ctrl_ren2;
	input [1:0] io_req_bits_uop_fp_ctrl_typeTagIn;
	input [1:0] io_req_bits_uop_fp_ctrl_typeTagOut;
	input io_req_bits_uop_fp_ctrl_div;
	input io_req_bits_uop_fp_ctrl_sqrt;
	input io_req_bits_uop_fp_ctrl_wflags;
	input [4:0] io_req_bits_uop_rob_idx;
	input [5:0] io_req_bits_uop_pdst;
	input [1:0] io_req_bits_uop_dst_rtype;
	input [2:0] io_req_bits_uop_fp_rm;
	input [1:0] io_req_bits_uop_fp_typ;
	input [64:0] io_req_bits_rs1_data;
	input [64:0] io_req_bits_rs2_data;
	input io_resp_ready;
	output wire io_resp_valid;
	output wire [4:0] io_resp_bits_uop_rob_idx;
	output wire [5:0] io_resp_bits_uop_pdst;
	output wire [1:0] io_resp_bits_uop_dst_rtype;
	output wire [64:0] io_resp_bits_data;
	output wire io_resp_bits_fflags_valid;
	output wire [4:0] io_resp_bits_fflags_bits;
	input [7:0] io_brupdate_b1_resolve_mask;
	input [7:0] io_brupdate_b1_mispredict_mask;
	wire divSqrt_inFlight;
	wire _divSqrt_1_io_inReady;
	wire _divSqrt_1_io_outValid_div;
	wire _divSqrt_1_io_outValid_sqrt;
	wire [64:0] _divSqrt_1_io_out;
	wire [4:0] _divSqrt_1_io_exceptionFlags;
	wire _divSqrt_io_inReady;
	wire _divSqrt_io_outValid_div;
	wire _divSqrt_io_outValid_sqrt;
	wire [32:0] _divSqrt_io_out;
	wire [4:0] _divSqrt_io_exceptionFlags;
	wire [2:0] _fpiu_io_out_bits_in_rm;
	wire [64:0] _fpiu_io_out_bits_in_in1;
	wire [64:0] _fpiu_io_out_bits_in_in2;
	reg r_req_valid;
	reg [7:0] r_req_bits_uop_br_mask;
	reg [4:0] r_req_bits_uop_rob_idx;
	reg [5:0] r_req_bits_uop_pdst;
	reg [1:0] r_req_bits_uop_dst_rtype;
	reg [1:0] r_sigs_typeTagOut;
	reg r_sigs_div;
	reg r_sigs_sqrt;
	reg r_out_valid;
	reg [4:0] r_out_flags;
	reg [64:0] r_out_wdata;
	wire io_req_ready_0 = (~r_req_valid & ~divSqrt_inFlight) & ~r_out_valid;
	wire [2:0] fpiu_io_in_bits_in1_prev_prev_expOut_expCode = {io_req_bits_rs1_data[52], io_req_bits_rs1_data[30:29]};
	wire [11:0] _fpiu_io_in_bits_in1_prev_prev_expOut_commonCase_T_2 = {3'h0, io_req_bits_rs1_data[52], io_req_bits_rs1_data[30:23]} + 12'h700;
	wire [2:0] fpiu_io_in_bits_in2_prev_prev_expOut_expCode = {io_req_bits_rs2_data[52], io_req_bits_rs2_data[30:29]};
	wire [11:0] _fpiu_io_in_bits_in2_prev_prev_expOut_commonCase_T_2 = {3'h0, io_req_bits_rs2_data[52], io_req_bits_rs2_data[30:23]} + 12'h700;
	wire _divSqrt_io_inValid_T_10 = r_sigs_div | r_sigs_sqrt;
	wire [8:0] _divSqrt_io_a_expOut_commonCase_T = _fpiu_io_out_bits_in_in1[60:52] - 9'h100;
	wire [8:0] _divSqrt_io_b_expOut_commonCase_T = _fpiu_io_out_bits_in_in2[60:52] - 9'h100;
	assign divSqrt_inFlight = ((((~_divSqrt_1_io_inReady | _divSqrt_1_io_outValid_div) | _divSqrt_1_io_outValid_sqrt) | ~_divSqrt_io_inReady) | _divSqrt_io_outValid_div) | _divSqrt_io_outValid_sqrt;
	wire io_resp_valid_0 = r_out_valid & r_req_valid;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg [7:0] _r_req_out_valid_T;
		reg kill;
		reg _GEN;
		reg _GEN_0;
		reg _GEN_1;
		reg _GEN_2;
		_GEN = io_req_ready_0 & io_req_valid;
		_GEN_1 = _divSqrt_1_io_outValid_div | _divSqrt_1_io_outValid_sqrt;
		_GEN_2 = (io_resp_ready & io_resp_valid_0) | reset;
		_r_req_out_valid_T = io_brupdate_b1_mispredict_mask & r_req_bits_uop_br_mask;
		kill = |_r_req_out_valid_T | io_kill;
		_GEN_0 = _divSqrt_io_outValid_div | _divSqrt_io_outValid_sqrt;
		r_req_valid <= ~_GEN_2 & (_GEN ? ~(|(io_brupdate_b1_mispredict_mask & io_req_bits_uop_br_mask) | io_kill) : r_req_valid & ~(|_r_req_out_valid_T | io_kill));
		if (_GEN) begin
			r_req_bits_uop_br_mask <= io_req_bits_uop_br_mask & ~io_brupdate_b1_resolve_mask;
			r_req_bits_uop_rob_idx <= io_req_bits_uop_rob_idx;
			r_req_bits_uop_pdst <= io_req_bits_uop_pdst;
			r_req_bits_uop_dst_rtype <= io_req_bits_uop_dst_rtype;
			r_sigs_typeTagOut <= io_req_bits_uop_fp_ctrl_typeTagOut;
			r_sigs_div <= io_req_bits_uop_fp_ctrl_div;
			r_sigs_sqrt <= io_req_bits_uop_fp_ctrl_sqrt;
		end
		else
			r_req_bits_uop_br_mask <= r_req_bits_uop_br_mask & ~io_brupdate_b1_resolve_mask;
		r_out_valid <= ~_GEN_2 & (_GEN_1 ? r_req_valid & ~kill : (_GEN_0 ? r_req_valid & ~kill : r_out_valid & ~kill));
		if (_GEN_1) begin : sv2v_autoblock_2
			reg [64:0] _r_out_wdata_T_4;
			_r_out_wdata_T_4 = ({65 {_divSqrt_1_io_out[63:61] != 3'h7}} | 65'h1efefffffffffffff) & _divSqrt_1_io_out;
			r_out_flags <= _divSqrt_1_io_exceptionFlags;
			r_out_wdata <= (r_sigs_typeTagOut[0] ? _r_out_wdata_T_4 : {12'hfff, _r_out_wdata_T_4[31], 20'hfffff, _r_out_wdata_T_4[32], _r_out_wdata_T_4[30:0]});
		end
		else if (_GEN_0) begin
			r_out_flags <= _divSqrt_io_exceptionFlags;
			r_out_wdata <= (r_sigs_typeTagOut[0] ? {32'h00000000, _divSqrt_io_out} : {12'hfff, _divSqrt_io_out[31], 20'hfffff, _divSqrt_io_out[32], _divSqrt_io_out[30:0]});
		end
	end
	FPToInt fpiu(
		.clock(clock),
		.io_in_valid(io_req_valid),
		.io_in_bits_ren2(io_req_bits_uop_fp_ctrl_ren2),
		.io_in_bits_typeTagOut(io_req_bits_uop_fp_ctrl_typeTagOut),
		.io_in_bits_wflags(io_req_bits_uop_fp_ctrl_wflags),
		.io_in_bits_rm(io_req_bits_uop_fp_rm),
		.io_in_bits_typ(io_req_bits_uop_fp_typ),
		.io_in_bits_fmt(2'h0),
		.io_in_bits_in1((io_req_bits_uop_fp_ctrl_typeTagIn[0] | &io_req_bits_rs1_data[64:60] ? (io_req_bits_uop_fp_ctrl_typeTagIn[0] ? io_req_bits_rs1_data : {io_req_bits_rs1_data[31], ((fpiu_io_in_bits_in1_prev_prev_expOut_expCode == 3'h0) | (fpiu_io_in_bits_in1_prev_prev_expOut_expCode > 3'h5) ? {io_req_bits_rs1_data[52], io_req_bits_rs1_data[30:29], _fpiu_io_in_bits_in1_prev_prev_expOut_commonCase_T_2[8:0]} : _fpiu_io_in_bits_in1_prev_prev_expOut_commonCase_T_2), io_req_bits_rs1_data[22:0], 29'h00000000}) : 65'h0e008000000000000)),
		.io_in_bits_in2((io_req_bits_uop_fp_ctrl_typeTagIn[0] | &io_req_bits_rs2_data[64:60] ? (io_req_bits_uop_fp_ctrl_typeTagIn[0] ? io_req_bits_rs2_data : {io_req_bits_rs2_data[31], ((fpiu_io_in_bits_in2_prev_prev_expOut_expCode == 3'h0) | (fpiu_io_in_bits_in2_prev_prev_expOut_expCode > 3'h5) ? {io_req_bits_rs2_data[52], io_req_bits_rs2_data[30:29], _fpiu_io_in_bits_in2_prev_prev_expOut_commonCase_T_2[8:0]} : _fpiu_io_in_bits_in2_prev_prev_expOut_commonCase_T_2), io_req_bits_rs2_data[22:0], 29'h00000000}) : 65'h0e008000000000000)),
		.io_out_bits_in_rm(_fpiu_io_out_bits_in_rm),
		.io_out_bits_in_in1(_fpiu_io_out_bits_in_in1),
		.io_out_bits_in_in2(_fpiu_io_out_bits_in_in2),
		.io_out_bits_lt(),
		.io_out_bits_toint(),
		.io_out_bits_exc()
	);
	DivSqrtRecFM_small_e8_s24 divSqrt(
		.clock(clock),
		.reset(reset),
		.io_inReady(_divSqrt_io_inReady),
		.io_inValid((((r_req_valid & (r_sigs_typeTagOut == 2'h0)) & _divSqrt_io_inValid_T_10) & ~divSqrt_inFlight) & ~r_out_valid),
		.io_sqrtOp(r_sigs_sqrt),
		.io_a({_fpiu_io_out_bits_in_in1[64], ((_fpiu_io_out_bits_in_in1[63:61] == 3'h0) | (_fpiu_io_out_bits_in_in1[63:61] > 3'h5) ? {_fpiu_io_out_bits_in_in1[63:61], _divSqrt_io_a_expOut_commonCase_T[5:0]} : _divSqrt_io_a_expOut_commonCase_T), _fpiu_io_out_bits_in_in1[51:29]}),
		.io_b({_fpiu_io_out_bits_in_in2[64], ((_fpiu_io_out_bits_in_in2[63:61] == 3'h0) | (_fpiu_io_out_bits_in_in2[63:61] > 3'h5) ? {_fpiu_io_out_bits_in_in2[63:61], _divSqrt_io_b_expOut_commonCase_T[5:0]} : _divSqrt_io_b_expOut_commonCase_T), _fpiu_io_out_bits_in_in2[51:29]}),
		.io_roundingMode(_fpiu_io_out_bits_in_rm),
		.io_outValid_div(_divSqrt_io_outValid_div),
		.io_outValid_sqrt(_divSqrt_io_outValid_sqrt),
		.io_out(_divSqrt_io_out),
		.io_exceptionFlags(_divSqrt_io_exceptionFlags)
	);
	DivSqrtRecFM_small_e11_s53 divSqrt_1(
		.clock(clock),
		.reset(reset),
		.io_inReady(_divSqrt_1_io_inReady),
		.io_inValid((((r_req_valid & (r_sigs_typeTagOut == 2'h1)) & _divSqrt_io_inValid_T_10) & ~divSqrt_inFlight) & ~r_out_valid),
		.io_sqrtOp(r_sigs_sqrt),
		.io_a(_fpiu_io_out_bits_in_in1),
		.io_b(_fpiu_io_out_bits_in_in2),
		.io_roundingMode(_fpiu_io_out_bits_in_rm),
		.io_outValid_div(_divSqrt_1_io_outValid_div),
		.io_outValid_sqrt(_divSqrt_1_io_outValid_sqrt),
		.io_out(_divSqrt_1_io_out),
		.io_exceptionFlags(_divSqrt_1_io_exceptionFlags)
	);
	assign io_req_ready = io_req_ready_0;
	assign io_resp_valid = io_resp_valid_0;
	assign io_resp_bits_uop_rob_idx = r_req_bits_uop_rob_idx;
	assign io_resp_bits_uop_pdst = r_req_bits_uop_pdst;
	assign io_resp_bits_uop_dst_rtype = r_req_bits_uop_dst_rtype;
	assign io_resp_bits_data = r_out_wdata;
	assign io_resp_bits_fflags_valid = io_resp_valid_0;
	assign io_resp_bits_fflags_bits = r_out_flags;
endmodule
