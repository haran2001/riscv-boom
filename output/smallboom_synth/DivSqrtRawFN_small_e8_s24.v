module DivSqrtRawFN_small_e8_s24 (
	clock,
	reset,
	io_inReady,
	io_inValid,
	io_sqrtOp,
	io_a_isNaN,
	io_a_isInf,
	io_a_isZero,
	io_a_sign,
	io_a_sExp,
	io_a_sig,
	io_b_isNaN,
	io_b_isInf,
	io_b_isZero,
	io_b_sign,
	io_b_sExp,
	io_b_sig,
	io_roundingMode,
	io_rawOutValid_div,
	io_rawOutValid_sqrt,
	io_roundingModeOut,
	io_invalidExc,
	io_infiniteExc,
	io_rawOut_isNaN,
	io_rawOut_isInf,
	io_rawOut_isZero,
	io_rawOut_sign,
	io_rawOut_sExp,
	io_rawOut_sig
);
	input clock;
	input reset;
	output wire io_inReady;
	input io_inValid;
	input io_sqrtOp;
	input io_a_isNaN;
	input io_a_isInf;
	input io_a_isZero;
	input io_a_sign;
	input [9:0] io_a_sExp;
	input [24:0] io_a_sig;
	input io_b_isNaN;
	input io_b_isInf;
	input io_b_isZero;
	input io_b_sign;
	input [9:0] io_b_sExp;
	input [24:0] io_b_sig;
	input [2:0] io_roundingMode;
	output wire io_rawOutValid_div;
	output wire io_rawOutValid_sqrt;
	output wire [2:0] io_roundingModeOut;
	output wire io_invalidExc;
	output wire io_infiniteExc;
	output wire io_rawOut_isNaN;
	output wire io_rawOut_isInf;
	output wire io_rawOut_isZero;
	output wire io_rawOut_sign;
	output wire [9:0] io_rawOut_sExp;
	output wire [26:0] io_rawOut_sig;
	reg [4:0] cycleNum;
	reg inReady;
	reg rawOutValid;
	reg sqrtOp_Z;
	reg majorExc_Z;
	reg isNaN_Z;
	reg isInf_Z;
	reg isZero_Z;
	reg sign_Z;
	reg [9:0] sExp_Z;
	reg [23:0] fractB_Z;
	reg [2:0] roundingMode_Z;
	reg [25:0] rem_Z;
	reg notZeroRem_Z;
	reg [25:0] sigX_Z;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg oddSqrt_S;
		reg entering;
		reg _sigX_Z_T_7;
		reg [26:0] rem;
		reg [25:0] _trialTerm_T_3;
		reg [25:0] _trialTerm_T_9;
		reg [28:0] trialRem;
		reg newBit;
		reg _GEN;
		oddSqrt_S = io_sqrtOp & io_a_sExp[0];
		entering = inReady & io_inValid;
		_sigX_Z_T_7 = inReady & oddSqrt_S;
		rem = ({1'h0, (inReady & ~oddSqrt_S ? {io_a_sig, 1'h0} : 26'h0000000)} | (_sigX_Z_T_7 ? {io_a_sig[23:22] - 2'h1, io_a_sig[21:0], 3'h0} : 27'h0000000)) | (inReady ? 27'h0000000 : {rem_Z, 1'h0});
		_trialTerm_T_3 = (inReady & ~io_sqrtOp ? {io_b_sig, 1'h0} : 26'h0000000);
		_trialTerm_T_9 = {_trialTerm_T_3[25], _trialTerm_T_3[24:0] | {(inReady & io_sqrtOp) & ~io_a_sExp[0], 24'h000000}} | (_sigX_Z_T_7 ? 26'h2800000 : 26'h0000000);
		trialRem = {2'h0, rem} - {2'h0, {1'h0, _trialTerm_T_9[25], _trialTerm_T_9[24] | (~inReady & ~sqrtOp_Z), _trialTerm_T_9[23:0] | (inReady ? 24'h000000 : fractB_Z)} | (~inReady & sqrtOp_Z ? {sigX_Z, 1'h0} : 27'h0000000)};
		newBit = $signed(trialRem) > -29'sh00000001;
		_GEN = entering | ~inReady;
		if (reset) begin
			cycleNum <= 5'h00;
			inReady <= 1'h1;
			rawOutValid <= 1'h0;
		end
		else if (|cycleNum | entering) begin : sv2v_autoblock_2
			reg specialCaseA_S;
			reg normalCase_S;
			reg skipCycle2;
			reg [4:0] _cycleNum_T_15;
			specialCaseA_S = (io_a_isNaN | io_a_isInf) | io_a_isZero;
			normalCase_S = (io_sqrtOp ? ~specialCaseA_S & ~io_a_sign : ~specialCaseA_S & ~((io_b_isNaN | io_b_isInf) | io_b_isZero));
			skipCycle2 = (cycleNum == 5'h03) & sigX_Z[25];
			_cycleNum_T_15 = ({4'h0, entering & ~normalCase_S} | (entering & normalCase_S ? (io_sqrtOp ? {4'hc, ~io_a_sExp[0]} : 5'h1a) : 5'h00)) | (entering | skipCycle2 ? 5'h00 : cycleNum - 5'h01);
			cycleNum <= {_cycleNum_T_15[4:1], _cycleNum_T_15[0] | skipCycle2};
			inReady <= ((entering & ~normalCase_S) | ((~entering & ~skipCycle2) & ((cycleNum - 5'h01) < 5'h02))) | skipCycle2;
			rawOutValid <= ((entering & ~normalCase_S) | ((~entering & ~skipCycle2) & ((cycleNum - 5'h01) == 5'h01))) | skipCycle2;
		end
		if (entering) begin : sv2v_autoblock_3
			reg notSigNaNIn_invalidExc_S_div;
			reg notSigNaNIn_invalidExc_S_sqrt;
			reg [10:0] sExpQuot_S_div;
			notSigNaNIn_invalidExc_S_div = (io_a_isZero & io_b_isZero) | (io_a_isInf & io_b_isInf);
			notSigNaNIn_invalidExc_S_sqrt = (~io_a_isNaN & ~io_a_isZero) & io_a_sign;
			sExpQuot_S_div = {io_a_sExp[9], io_a_sExp} + {{3 {io_b_sExp[8]}}, ~io_b_sExp[7:0]};
			sqrtOp_Z <= io_sqrtOp;
			majorExc_Z <= (io_sqrtOp ? (io_a_isNaN & ~io_a_sig[22]) | notSigNaNIn_invalidExc_S_sqrt : (((io_a_isNaN & ~io_a_sig[22]) | (io_b_isNaN & ~io_b_sig[22])) | notSigNaNIn_invalidExc_S_div) | ((~io_a_isNaN & ~io_a_isInf) & io_b_isZero));
			isNaN_Z <= (io_sqrtOp ? io_a_isNaN | notSigNaNIn_invalidExc_S_sqrt : (io_a_isNaN | io_b_isNaN) | notSigNaNIn_invalidExc_S_div);
			isInf_Z <= (~io_sqrtOp & io_b_isZero) | io_a_isInf;
			isZero_Z <= (~io_sqrtOp & io_b_isInf) | io_a_isZero;
			sign_Z <= io_a_sign ^ (~io_sqrtOp & io_b_sign);
			sExp_Z <= (io_sqrtOp ? {io_a_sExp[9], io_a_sExp[9:1]} + 10'h080 : {($signed(sExpQuot_S_div) > 11'sh1bf ? 4'h6 : sExpQuot_S_div[9:6]), sExpQuot_S_div[5:0]});
			roundingMode_Z <= io_roundingMode;
		end
		if (entering | (~inReady & sqrtOp_Z)) begin : sv2v_autoblock_4
			reg [23:0] _fractB_Z_T_4;
			reg _fractB_Z_T_10;
			_fractB_Z_T_4 = (inReady & ~io_sqrtOp ? {io_b_sig[22:0], 1'h0} : 24'h000000);
			_fractB_Z_T_10 = inReady & io_sqrtOp;
			fractB_Z <= {_fractB_Z_T_4[23] | (_fractB_Z_T_10 & ~io_a_sExp[0]), (_fractB_Z_T_4[22:0] | {_fractB_Z_T_10 & io_a_sExp[0], 22'h000000}) | (inReady ? 23'h000000 : fractB_Z[23:1])};
		end
		if (_GEN) begin : sv2v_autoblock_5
			reg [25:0] _sigX_Z_T_3;
			reg [24:0] _GEN_0;
			reg [31:0] _bitMask_T;
			_sigX_Z_T_3 = (inReady & ~io_sqrtOp ? {newBit, 25'h0000000} : 26'h0000000);
			_GEN_0 = _sigX_Z_T_3[24:0] | {inReady & io_sqrtOp, 24'h000000};
			rem_Z <= (newBit ? trialRem[25:0] : rem[25:0]);
			_bitMask_T = 32'h00000001 << cycleNum;
			sigX_Z <= ({_sigX_Z_T_3[25], _GEN_0[24], _GEN_0[23:0] | (_sigX_Z_T_7 ? {newBit, 23'h000000} : 24'h000000)} | (inReady ? 26'h0000000 : sigX_Z)) | (~inReady & newBit ? _bitMask_T[27:2] : 26'h0000000);
		end
		if (_GEN & (inReady | newBit))
			notZeroRem_Z <= |trialRem;
	end
	assign io_inReady = inReady;
	assign io_rawOutValid_div = rawOutValid & ~sqrtOp_Z;
	assign io_rawOutValid_sqrt = rawOutValid & sqrtOp_Z;
	assign io_roundingModeOut = roundingMode_Z;
	assign io_invalidExc = majorExc_Z & isNaN_Z;
	assign io_infiniteExc = majorExc_Z & ~isNaN_Z;
	assign io_rawOut_isNaN = isNaN_Z;
	assign io_rawOut_isInf = isInf_Z;
	assign io_rawOut_isZero = isZero_Z;
	assign io_rawOut_sign = sign_Z;
	assign io_rawOut_sExp = sExp_Z;
	assign io_rawOut_sig = {sigX_Z, notZeroRem_Z};
endmodule
