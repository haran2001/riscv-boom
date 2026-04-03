module FPU (
	clock,
	reset,
	io_req_valid,
	io_req_bits_uop_fp_ctrl_ren2,
	io_req_bits_uop_fp_ctrl_ren3,
	io_req_bits_uop_fp_ctrl_swap23,
	io_req_bits_uop_fp_ctrl_typeTagIn,
	io_req_bits_uop_fp_ctrl_typeTagOut,
	io_req_bits_uop_fp_ctrl_toint,
	io_req_bits_uop_fp_ctrl_fastpipe,
	io_req_bits_uop_fp_ctrl_fma,
	io_req_bits_uop_fp_ctrl_wflags,
	io_req_bits_uop_fcn_op,
	io_req_bits_uop_fp_rm,
	io_req_bits_uop_fp_typ,
	io_req_bits_rs1_data,
	io_req_bits_rs2_data,
	io_req_bits_rs3_data,
	io_resp_bits_data,
	io_resp_bits_fflags_bits
);
	input clock;
	input reset;
	input io_req_valid;
	input io_req_bits_uop_fp_ctrl_ren2;
	input io_req_bits_uop_fp_ctrl_ren3;
	input io_req_bits_uop_fp_ctrl_swap23;
	input [1:0] io_req_bits_uop_fp_ctrl_typeTagIn;
	input [1:0] io_req_bits_uop_fp_ctrl_typeTagOut;
	input io_req_bits_uop_fp_ctrl_toint;
	input io_req_bits_uop_fp_ctrl_fastpipe;
	input io_req_bits_uop_fp_ctrl_fma;
	input io_req_bits_uop_fp_ctrl_wflags;
	input [4:0] io_req_bits_uop_fcn_op;
	input [2:0] io_req_bits_uop_fp_rm;
	input [1:0] io_req_bits_uop_fp_typ;
	input [64:0] io_req_bits_rs1_data;
	input [64:0] io_req_bits_rs2_data;
	input [64:0] io_req_bits_rs3_data;
	output wire [64:0] io_resp_bits_data;
	output wire [4:0] io_resp_bits_fflags_bits;
	wire [64:0] _fpmu_io_out_bits_data;
	wire [4:0] _fpmu_io_out_bits_exc;
	wire _fpiu_io_out_bits_lt;
	wire [63:0] _fpiu_io_out_bits_toint;
	wire [4:0] _fpiu_io_out_bits_exc;
	wire _sfma_io_out_valid;
	wire [64:0] _sfma_io_out_bits_data;
	wire [4:0] _sfma_io_out_bits_exc;
	wire _dfma_io_out_valid;
	wire [64:0] _dfma_io_out_bits_data;
	wire [4:0] _dfma_io_out_bits_exc;
	wire _sfma_io_in_valid_T = io_req_valid & io_req_bits_uop_fp_ctrl_fma;
	wire _fpmu_double_T_1 = io_req_bits_uop_fp_ctrl_typeTagOut == 2'h1;
	wire _fpiu_io_in_bits_T = io_req_bits_uop_fp_ctrl_typeTagOut == 2'h0;
	wire [32:0] _sfma_io_in_bits_req_in2_T_1 = {io_req_bits_rs2_data[31], io_req_bits_rs2_data[52], io_req_bits_rs2_data[30:0]} | (&io_req_bits_rs2_data[64:60] ? 33'h000000000 : 33'h0e0400000);
	wire _fpiu_io_in_valid_T_2 = io_req_valid & (io_req_bits_uop_fp_ctrl_toint | (io_req_bits_uop_fp_ctrl_fastpipe & io_req_bits_uop_fp_ctrl_wflags));
	wire [2:0] fpiu_io_in_bits_req_in1_prev_prev_expOut_expCode = {io_req_bits_rs1_data[52], io_req_bits_rs1_data[30:29]};
	wire [11:0] _fpiu_io_in_bits_req_in1_prev_prev_expOut_commonCase_T_2 = {3'h0, io_req_bits_rs1_data[52], io_req_bits_rs1_data[30:23]} + 12'h700;
	wire [64:0] fpiu_io_in_bits_req_in1 = (io_req_bits_uop_fp_ctrl_typeTagIn[0] | &io_req_bits_rs1_data[64:60] ? (io_req_bits_uop_fp_ctrl_typeTagIn[0] ? io_req_bits_rs1_data : {io_req_bits_rs1_data[31], ((fpiu_io_in_bits_req_in1_prev_prev_expOut_expCode == 3'h0) | (fpiu_io_in_bits_req_in1_prev_prev_expOut_expCode > 3'h5) ? {io_req_bits_rs1_data[52], io_req_bits_rs1_data[30:29], _fpiu_io_in_bits_req_in1_prev_prev_expOut_commonCase_T_2[8:0]} : _fpiu_io_in_bits_req_in1_prev_prev_expOut_commonCase_T_2), io_req_bits_rs1_data[22:0], 29'h00000000}) : 65'h0e008000000000000);
	wire [2:0] fpiu_io_in_bits_req_in2_prev_prev_expOut_expCode = {io_req_bits_rs2_data[52], io_req_bits_rs2_data[30:29]};
	wire [11:0] _fpiu_io_in_bits_req_in2_prev_prev_expOut_commonCase_T_2 = {3'h0, io_req_bits_rs2_data[52], io_req_bits_rs2_data[30:23]} + 12'h700;
	wire [64:0] fpiu_io_in_bits_req_in2 = (io_req_bits_uop_fp_ctrl_typeTagIn[0] | &io_req_bits_rs2_data[64:60] ? (io_req_bits_uop_fp_ctrl_typeTagIn[0] ? io_req_bits_rs2_data : {io_req_bits_rs2_data[31], ((fpiu_io_in_bits_req_in2_prev_prev_expOut_expCode == 3'h0) | (fpiu_io_in_bits_req_in2_prev_prev_expOut_expCode > 3'h5) ? {io_req_bits_rs2_data[52], io_req_bits_rs2_data[30:29], _fpiu_io_in_bits_req_in2_prev_prev_expOut_commonCase_T_2[8:0]} : _fpiu_io_in_bits_req_in2_prev_prev_expOut_commonCase_T_2), io_req_bits_rs2_data[22:0], 29'h00000000}) : 65'h0e008000000000000);
	reg fpiu_out_REG;
	reg fpiu_out_pipe_v;
	reg [63:0] fpiu_out_pipe_b_toint;
	reg [4:0] fpiu_out_pipe_b_exc;
	reg fpiu_out_pipe_pipe_v;
	reg [63:0] fpiu_out_pipe_pipe_b_toint;
	reg [4:0] fpiu_out_pipe_pipe_b_exc;
	reg fpiu_out_pipe_pipe_pipe_v;
	reg [63:0] fpiu_out_pipe_pipe_pipe_b_toint;
	reg [4:0] fpiu_out_pipe_pipe_pipe_b_exc;
	wire _fpmu_double_T = io_req_valid & io_req_bits_uop_fp_ctrl_fastpipe;
	reg fpmu_double_pipe_v;
	reg fpmu_double_pipe_b;
	reg fpmu_double_pipe_pipe_v;
	reg fpmu_double_pipe_pipe_b;
	reg fpmu_double_pipe_pipe_pipe_v;
	reg fpmu_double_pipe_pipe_pipe_b;
	reg fpmu_double_pipe_pipe_pipe_pipe_b;
	always @(posedge clock) begin
		fpiu_out_REG <= _fpiu_io_in_valid_T_2 & ~io_req_bits_uop_fp_ctrl_fastpipe;
		if (fpiu_out_REG) begin
			fpiu_out_pipe_b_toint <= _fpiu_io_out_bits_toint;
			fpiu_out_pipe_b_exc <= _fpiu_io_out_bits_exc;
		end
		if (fpiu_out_pipe_v) begin
			fpiu_out_pipe_pipe_b_toint <= fpiu_out_pipe_b_toint;
			fpiu_out_pipe_pipe_b_exc <= fpiu_out_pipe_b_exc;
		end
		if (fpiu_out_pipe_pipe_v) begin
			fpiu_out_pipe_pipe_pipe_b_toint <= fpiu_out_pipe_pipe_b_toint;
			fpiu_out_pipe_pipe_pipe_b_exc <= fpiu_out_pipe_pipe_b_exc;
		end
		if (_fpmu_double_T)
			fpmu_double_pipe_b <= _fpmu_double_T_1;
		if (fpmu_double_pipe_v)
			fpmu_double_pipe_pipe_b <= fpmu_double_pipe_b;
		if (fpmu_double_pipe_pipe_v)
			fpmu_double_pipe_pipe_pipe_b <= fpmu_double_pipe_pipe_b;
		if (fpmu_double_pipe_pipe_pipe_v)
			fpmu_double_pipe_pipe_pipe_pipe_b <= fpmu_double_pipe_pipe_pipe_b;
		if (reset) begin
			fpiu_out_pipe_v <= 1'h0;
			fpiu_out_pipe_pipe_v <= 1'h0;
			fpiu_out_pipe_pipe_pipe_v <= 1'h0;
			fpmu_double_pipe_v <= 1'h0;
			fpmu_double_pipe_pipe_v <= 1'h0;
			fpmu_double_pipe_pipe_pipe_v <= 1'h0;
		end
		else begin
			fpiu_out_pipe_v <= fpiu_out_REG;
			fpiu_out_pipe_pipe_v <= fpiu_out_pipe_v;
			fpiu_out_pipe_pipe_pipe_v <= fpiu_out_pipe_pipe_v;
			fpmu_double_pipe_v <= _fpmu_double_T;
			fpmu_double_pipe_pipe_v <= fpmu_double_pipe_v;
			fpmu_double_pipe_pipe_pipe_v <= fpmu_double_pipe_pipe_v;
		end
	end
	FPUFMAPipe_l4_f64 dfma(
		.clock(clock),
		.reset(reset),
		.io_in_valid(_sfma_io_in_valid_T & _fpmu_double_T_1),
		.io_in_bits_ren3(io_req_bits_uop_fp_ctrl_ren3),
		.io_in_bits_swap23(io_req_bits_uop_fp_ctrl_swap23),
		.io_in_bits_rm(io_req_bits_uop_fp_rm),
		.io_in_bits_fmaCmd(io_req_bits_uop_fcn_op[1:0]),
		.io_in_bits_in1(io_req_bits_rs1_data),
		.io_in_bits_in2(io_req_bits_rs2_data),
		.io_in_bits_in3((io_req_bits_uop_fp_ctrl_swap23 ? io_req_bits_rs2_data : io_req_bits_rs3_data)),
		.io_out_valid(_dfma_io_out_valid),
		.io_out_bits_data(_dfma_io_out_bits_data),
		.io_out_bits_exc(_dfma_io_out_bits_exc)
	);
	FPUFMAPipe_l4_f32 sfma(
		.clock(clock),
		.reset(reset),
		.io_in_valid(_sfma_io_in_valid_T & _fpiu_io_in_bits_T),
		.io_in_bits_ren3(io_req_bits_uop_fp_ctrl_ren3),
		.io_in_bits_swap23(io_req_bits_uop_fp_ctrl_swap23),
		.io_in_bits_rm(io_req_bits_uop_fp_rm),
		.io_in_bits_fmaCmd(io_req_bits_uop_fcn_op[1:0]),
		.io_in_bits_in1({32'h00000000, {io_req_bits_rs1_data[31], io_req_bits_rs1_data[52], io_req_bits_rs1_data[30:0]} | (&io_req_bits_rs1_data[64:60] ? 33'h000000000 : 33'h0e0400000)}),
		.io_in_bits_in2({32'h00000000, _sfma_io_in_bits_req_in2_T_1}),
		.io_in_bits_in3({32'h00000000, (io_req_bits_uop_fp_ctrl_swap23 ? _sfma_io_in_bits_req_in2_T_1 : {io_req_bits_rs3_data[31], io_req_bits_rs3_data[52], io_req_bits_rs3_data[30:0]} | (&io_req_bits_rs3_data[64:60] ? 33'h000000000 : 33'h0e0400000))}),
		.io_out_valid(_sfma_io_out_valid),
		.io_out_bits_data(_sfma_io_out_bits_data),
		.io_out_bits_exc(_sfma_io_out_bits_exc)
	);
	FPToInt fpiu(
		.clock(clock),
		.io_in_valid(_fpiu_io_in_valid_T_2),
		.io_in_bits_ren2(io_req_bits_uop_fp_ctrl_ren2),
		.io_in_bits_typeTagOut(io_req_bits_uop_fp_ctrl_typeTagOut),
		.io_in_bits_wflags(io_req_bits_uop_fp_ctrl_wflags),
		.io_in_bits_rm(io_req_bits_uop_fp_rm),
		.io_in_bits_typ(io_req_bits_uop_fp_typ),
		.io_in_bits_fmt(((io_req_bits_uop_fp_ctrl_toint & _fpiu_io_in_bits_T) & ~io_req_bits_uop_fp_ctrl_wflags ? 2'h0 : {1'h0, |io_req_bits_uop_fp_ctrl_typeTagIn})),
		.io_in_bits_in1(fpiu_io_in_bits_req_in1),
		.io_in_bits_in2(fpiu_io_in_bits_req_in2),
		.io_out_bits_in_rm(),
		.io_out_bits_in_in1(),
		.io_out_bits_in_in2(),
		.io_out_bits_lt(_fpiu_io_out_bits_lt),
		.io_out_bits_toint(_fpiu_io_out_bits_toint),
		.io_out_bits_exc(_fpiu_io_out_bits_exc)
	);
	FPToFP fpmu(
		.clock(clock),
		.reset(reset),
		.io_in_valid(_fpmu_double_T),
		.io_in_bits_ren2(io_req_bits_uop_fp_ctrl_ren2),
		.io_in_bits_typeTagOut(io_req_bits_uop_fp_ctrl_typeTagOut),
		.io_in_bits_wflags(io_req_bits_uop_fp_ctrl_wflags),
		.io_in_bits_rm(io_req_bits_uop_fp_rm),
		.io_in_bits_in1(fpiu_io_in_bits_req_in1),
		.io_in_bits_in2(fpiu_io_in_bits_req_in2),
		.io_out_bits_data(_fpmu_io_out_bits_data),
		.io_out_bits_exc(_fpmu_io_out_bits_exc),
		.io_lt(_fpiu_io_out_bits_lt)
	);
	assign io_resp_bits_data = (_dfma_io_out_valid ? _dfma_io_out_bits_data : (_sfma_io_out_valid ? {12'hfff, _sfma_io_out_bits_data[31], 20'hfffff, _sfma_io_out_bits_data[32], _sfma_io_out_bits_data[30:0]} : (fpiu_out_pipe_pipe_pipe_v ? {1'h0, fpiu_out_pipe_pipe_pipe_b_toint} : (fpmu_double_pipe_pipe_pipe_pipe_b ? _fpmu_io_out_bits_data : {12'hfff, _fpmu_io_out_bits_data[31], 20'hfffff, _fpmu_io_out_bits_data[32], _fpmu_io_out_bits_data[30:0]}))));
	assign io_resp_bits_fflags_bits = (_dfma_io_out_valid ? _dfma_io_out_bits_exc : (_sfma_io_out_valid ? _sfma_io_out_bits_exc : (fpiu_out_pipe_pipe_pipe_v ? fpiu_out_pipe_pipe_pipe_b_exc : _fpmu_io_out_bits_exc)));
endmodule
