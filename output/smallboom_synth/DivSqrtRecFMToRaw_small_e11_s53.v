module DivSqrtRecFMToRaw_small_e11_s53 (
	clock,
	reset,
	io_inReady,
	io_inValid,
	io_sqrtOp,
	io_a,
	io_b,
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
	input [64:0] io_a;
	input [64:0] io_b;
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
	output wire [12:0] io_rawOut_sExp;
	output wire [55:0] io_rawOut_sig;
	DivSqrtRawFN_small_e11_s53 divSqrtRawFN(
		.clock(clock),
		.reset(reset),
		.io_inReady(io_inReady),
		.io_inValid(io_inValid),
		.io_sqrtOp(io_sqrtOp),
		.io_a_isNaN(&io_a[63:62] & io_a[61]),
		.io_a_isInf(&io_a[63:62] & ~io_a[61]),
		.io_a_isZero(~(|io_a[63:61])),
		.io_a_sign(io_a[64]),
		.io_a_sExp({1'h0, io_a[63:52]}),
		.io_a_sig({1'h0, |io_a[63:61], io_a[51:0]}),
		.io_b_isNaN(&io_b[63:62] & io_b[61]),
		.io_b_isInf(&io_b[63:62] & ~io_b[61]),
		.io_b_isZero(~(|io_b[63:61])),
		.io_b_sign(io_b[64]),
		.io_b_sExp({1'h0, io_b[63:52]}),
		.io_b_sig({1'h0, |io_b[63:61], io_b[51:0]}),
		.io_roundingMode(io_roundingMode),
		.io_rawOutValid_div(io_rawOutValid_div),
		.io_rawOutValid_sqrt(io_rawOutValid_sqrt),
		.io_roundingModeOut(io_roundingModeOut),
		.io_invalidExc(io_invalidExc),
		.io_infiniteExc(io_infiniteExc),
		.io_rawOut_isNaN(io_rawOut_isNaN),
		.io_rawOut_isInf(io_rawOut_isInf),
		.io_rawOut_isZero(io_rawOut_isZero),
		.io_rawOut_sign(io_rawOut_sign),
		.io_rawOut_sExp(io_rawOut_sExp),
		.io_rawOut_sig(io_rawOut_sig)
	);
endmodule
