module IntToFP (
	clock,
	reset,
	io_in_valid,
	io_in_bits_typeTagIn,
	io_in_bits_wflags,
	io_in_bits_rm,
	io_in_bits_typ,
	io_in_bits_in1,
	io_out_bits_data,
	io_out_bits_exc
);
	input clock;
	input reset;
	input io_in_valid;
	input [1:0] io_in_bits_typeTagIn;
	input io_in_bits_wflags;
	input [2:0] io_in_bits_rm;
	input [1:0] io_in_bits_typ;
	input [63:0] io_in_bits_in1;
	output wire [64:0] io_out_bits_data;
	output wire [4:0] io_out_bits_exc;
	wire [64:0] _i2fResults_i2f_1_io_out;
	wire [4:0] _i2fResults_i2f_1_io_exceptionFlags;
	wire [32:0] _i2fResults_i2f_io_out;
	wire [4:0] _i2fResults_i2f_io_exceptionFlags;
	reg in_pipe_v;
	reg [1:0] in_pipe_b_typeTagIn;
	reg in_pipe_b_wflags;
	reg [2:0] in_pipe_b_rm;
	reg [1:0] in_pipe_b_typ;
	reg [63:0] in_pipe_b_in1;
	wire [63:0] intValue_res = (in_pipe_b_typ[1] ? in_pipe_b_in1 : {{32 {~in_pipe_b_typ[0] & in_pipe_b_in1[31]}}, in_pipe_b_in1[31:0]});
	reg [64:0] io_out_pipe_b_data;
	reg [4:0] io_out_pipe_b_exc;
	always @(posedge clock) begin
		if (reset)
			in_pipe_v <= 1'h0;
		else
			in_pipe_v <= io_in_valid;
		if (io_in_valid) begin
			in_pipe_b_typeTagIn <= io_in_bits_typeTagIn;
			in_pipe_b_wflags <= io_in_bits_wflags;
			in_pipe_b_rm <= io_in_bits_rm;
			in_pipe_b_typ <= io_in_bits_typ;
			in_pipe_b_in1 <= io_in_bits_in1;
		end
		if (in_pipe_v) begin : sv2v_autoblock_1
			reg [63:0] _mux_data_T_2;
			reg mux_data_rawIn_isZeroExpIn;
			reg [5:0] mux_data_rawIn_normDist;
			reg [11:0] _mux_data_rawIn_adjustedExp_T_4;
			reg [114:0] _mux_data_rawIn_subnormFract_T;
			reg [51:0] _mux_data_rawIn_out_sig_T_2;
			reg [2:0] _mux_data_T_4;
			reg _GEN;
			reg mux_data_rawIn_isZeroExpIn_1;
			reg [4:0] mux_data_rawIn_normDist_1;
			reg [8:0] _mux_data_rawIn_adjustedExp_T_9;
			reg [2:0] _mux_data_T_13;
			reg [64:0] i2fResults_1_1;
			reg [53:0] _mux_data_rawIn_subnormFract_T_2;
			i2fResults_1_1 = ({65 {_i2fResults_i2f_1_io_out[63:61] != 3'h7}} | 65'h1efefffffffffffff) & _i2fResults_i2f_1_io_out;
			_mux_data_T_2 = (in_pipe_b_typeTagIn[0] ? 64'h0000000000000000 : 64'hffffffff00000000) | in_pipe_b_in1;
			mux_data_rawIn_isZeroExpIn = _mux_data_T_2[62:52] == 11'h000;
			mux_data_rawIn_normDist = (_mux_data_T_2[51] ? 6'h00 : (_mux_data_T_2[50] ? 6'h01 : (_mux_data_T_2[49] ? 6'h02 : (_mux_data_T_2[48] ? 6'h03 : (_mux_data_T_2[47] ? 6'h04 : (_mux_data_T_2[46] ? 6'h05 : (_mux_data_T_2[45] ? 6'h06 : (_mux_data_T_2[44] ? 6'h07 : (_mux_data_T_2[43] ? 6'h08 : (_mux_data_T_2[42] ? 6'h09 : (_mux_data_T_2[41] ? 6'h0a : (_mux_data_T_2[40] ? 6'h0b : (_mux_data_T_2[39] ? 6'h0c : (_mux_data_T_2[38] ? 6'h0d : (_mux_data_T_2[37] ? 6'h0e : (_mux_data_T_2[36] ? 6'h0f : (_mux_data_T_2[35] ? 6'h10 : (_mux_data_T_2[34] ? 6'h11 : (_mux_data_T_2[33] ? 6'h12 : (_mux_data_T_2[32] ? 6'h13 : (_mux_data_T_2[31] ? 6'h14 : (_mux_data_T_2[30] ? 6'h15 : (_mux_data_T_2[29] ? 6'h16 : (_mux_data_T_2[28] ? 6'h17 : (_mux_data_T_2[27] ? 6'h18 : (_mux_data_T_2[26] ? 6'h19 : (_mux_data_T_2[25] ? 6'h1a : (_mux_data_T_2[24] ? 6'h1b : (_mux_data_T_2[23] ? 6'h1c : (_mux_data_T_2[22] ? 6'h1d : (_mux_data_T_2[21] ? 6'h1e : (_mux_data_T_2[20] ? 6'h1f : (_mux_data_T_2[19] ? 6'h20 : (_mux_data_T_2[18] ? 6'h21 : (_mux_data_T_2[17] ? 6'h22 : (_mux_data_T_2[16] ? 6'h23 : (_mux_data_T_2[15] ? 6'h24 : (_mux_data_T_2[14] ? 6'h25 : (_mux_data_T_2[13] ? 6'h26 : (_mux_data_T_2[12] ? 6'h27 : (_mux_data_T_2[11] ? 6'h28 : (_mux_data_T_2[10] ? 6'h29 : (_mux_data_T_2[9] ? 6'h2a : (_mux_data_T_2[8] ? 6'h2b : (_mux_data_T_2[7] ? 6'h2c : (_mux_data_T_2[6] ? 6'h2d : (_mux_data_T_2[5] ? 6'h2e : (_mux_data_T_2[4] ? 6'h2f : (_mux_data_T_2[3] ? 6'h30 : (_mux_data_T_2[2] ? 6'h31 : {5'h19, ~_mux_data_T_2[1]}))))))))))))))))))))))))))))))))))))))))))))))))));
			_mux_data_rawIn_adjustedExp_T_4 = (mux_data_rawIn_isZeroExpIn ? {6'h3f, ~mux_data_rawIn_normDist} : {1'h0, _mux_data_T_2[62:52]}) + {10'h100, (mux_data_rawIn_isZeroExpIn ? 2'h2 : 2'h1)};
			_mux_data_rawIn_subnormFract_T = {63'h0000000000000000, _mux_data_T_2[51:0]} << mux_data_rawIn_normDist;
			_mux_data_rawIn_out_sig_T_2 = (mux_data_rawIn_isZeroExpIn ? {_mux_data_rawIn_subnormFract_T[50:0], 1'h0} : _mux_data_T_2[51:0]);
			_mux_data_T_4 = (mux_data_rawIn_isZeroExpIn & ~(|_mux_data_T_2[51:0]) ? 3'h0 : _mux_data_rawIn_adjustedExp_T_4[11:9]);
			_GEN = _mux_data_T_4[0] | (&_mux_data_rawIn_adjustedExp_T_4[11:10] & |_mux_data_T_2[51:0]);
			mux_data_rawIn_isZeroExpIn_1 = _mux_data_T_2[30:23] == 8'h00;
			mux_data_rawIn_normDist_1 = (_mux_data_T_2[22] ? 5'h00 : (_mux_data_T_2[21] ? 5'h01 : (_mux_data_T_2[20] ? 5'h02 : (_mux_data_T_2[19] ? 5'h03 : (_mux_data_T_2[18] ? 5'h04 : (_mux_data_T_2[17] ? 5'h05 : (_mux_data_T_2[16] ? 5'h06 : (_mux_data_T_2[15] ? 5'h07 : (_mux_data_T_2[14] ? 5'h08 : (_mux_data_T_2[13] ? 5'h09 : (_mux_data_T_2[12] ? 5'h0a : (_mux_data_T_2[11] ? 5'h0b : (_mux_data_T_2[10] ? 5'h0c : (_mux_data_T_2[9] ? 5'h0d : (_mux_data_T_2[8] ? 5'h0e : (_mux_data_T_2[7] ? 5'h0f : (_mux_data_T_2[6] ? 5'h10 : (_mux_data_T_2[5] ? 5'h11 : (_mux_data_T_2[4] ? 5'h12 : (_mux_data_T_2[3] ? 5'h13 : (_mux_data_T_2[2] ? 5'h14 : (_mux_data_T_2[1] ? 5'h15 : 5'h16))))))))))))))))))))));
			_mux_data_rawIn_adjustedExp_T_9 = (mux_data_rawIn_isZeroExpIn_1 ? {4'hf, ~mux_data_rawIn_normDist_1} : {1'h0, _mux_data_T_2[30:23]}) + {7'h20, (mux_data_rawIn_isZeroExpIn_1 ? 2'h2 : 2'h1)};
			_mux_data_T_13 = (mux_data_rawIn_isZeroExpIn_1 & ~(|_mux_data_T_2[22:0]) ? 3'h0 : _mux_data_rawIn_adjustedExp_T_9[8:6]);
			_mux_data_rawIn_subnormFract_T_2 = {31'h00000000, _mux_data_T_2[22:0]} << mux_data_rawIn_normDist_1;
			io_out_pipe_b_data <= (in_pipe_b_wflags ? (in_pipe_b_typeTagIn[0] ? i2fResults_1_1 : {i2fResults_1_1[64:33], _i2fResults_i2f_io_out}) : {_mux_data_T_2[63], _mux_data_T_4[2:1], _GEN, (&{_mux_data_T_4[2:1], _GEN} ? {&_mux_data_rawIn_out_sig_T_2[51:32], _mux_data_rawIn_adjustedExp_T_4[7:1], _mux_data_T_13[2], _mux_data_rawIn_out_sig_T_2[51:32], _mux_data_T_2[31], _mux_data_T_13[1], _mux_data_T_13[0] | (&_mux_data_rawIn_adjustedExp_T_9[8:7] & |_mux_data_T_2[22:0]), _mux_data_rawIn_adjustedExp_T_9[5:0], (mux_data_rawIn_isZeroExpIn_1 ? {_mux_data_rawIn_subnormFract_T_2[21:0], 1'h0} : _mux_data_T_2[22:0])} : {_mux_data_rawIn_adjustedExp_T_4[8:0], _mux_data_rawIn_out_sig_T_2})});
			io_out_pipe_b_exc <= (in_pipe_b_wflags ? (in_pipe_b_typeTagIn[0] ? _i2fResults_i2f_1_io_exceptionFlags : _i2fResults_i2f_io_exceptionFlags) : 5'h00);
		end
	end
	INToRecFN_i64_e8_s24 i2fResults_i2f(
		.io_signedIn(~in_pipe_b_typ[0]),
		.io_in(intValue_res),
		.io_roundingMode(in_pipe_b_rm),
		.io_out(_i2fResults_i2f_io_out),
		.io_exceptionFlags(_i2fResults_i2f_io_exceptionFlags)
	);
	INToRecFN_i64_e11_s53 i2fResults_i2f_1(
		.io_signedIn(~in_pipe_b_typ[0]),
		.io_in(intValue_res),
		.io_roundingMode(in_pipe_b_rm),
		.io_out(_i2fResults_i2f_1_io_out),
		.io_exceptionFlags(_i2fResults_i2f_1_io_exceptionFlags)
	);
	assign io_out_bits_data = io_out_pipe_b_data;
	assign io_out_bits_exc = io_out_pipe_b_exc;
endmodule
