module DivSqrtRecFM_small_e8_s24 (
	clock,
	reset,
	io_inReady,
	io_inValid,
	io_sqrtOp,
	io_a,
	io_b,
	io_roundingMode,
	io_outValid_div,
	io_outValid_sqrt,
	io_out,
	io_exceptionFlags
);
	input clock;
	input reset;
	output wire io_inReady;
	input io_inValid;
	input io_sqrtOp;
	input [32:0] io_a;
	input [32:0] io_b;
	input [2:0] io_roundingMode;
	output wire io_outValid_div;
	output wire io_outValid_sqrt;
	output wire [32:0] io_out;
	output wire [4:0] io_exceptionFlags;
	wire [2:0] _divSqrtRecFNToRaw_io_roundingModeOut;
	wire _divSqrtRecFNToRaw_io_invalidExc;
	wire _divSqrtRecFNToRaw_io_infiniteExc;
	wire _divSqrtRecFNToRaw_io_rawOut_isNaN;
	wire _divSqrtRecFNToRaw_io_rawOut_isInf;
	wire _divSqrtRecFNToRaw_io_rawOut_isZero;
	wire _divSqrtRecFNToRaw_io_rawOut_sign;
	wire [9:0] _divSqrtRecFNToRaw_io_rawOut_sExp;
	wire [26:0] _divSqrtRecFNToRaw_io_rawOut_sig;
	DivSqrtRecFMToRaw_small_e8_s24 divSqrtRecFNToRaw(
		.clock(clock),
		.reset(reset),
		.io_inReady(io_inReady),
		.io_inValid(io_inValid),
		.io_sqrtOp(io_sqrtOp),
		.io_a(io_a),
		.io_b(io_b),
		.io_roundingMode(io_roundingMode),
		.io_rawOutValid_div(io_outValid_div),
		.io_rawOutValid_sqrt(io_outValid_sqrt),
		.io_roundingModeOut(_divSqrtRecFNToRaw_io_roundingModeOut),
		.io_invalidExc(_divSqrtRecFNToRaw_io_invalidExc),
		.io_infiniteExc(_divSqrtRecFNToRaw_io_infiniteExc),
		.io_rawOut_isNaN(_divSqrtRecFNToRaw_io_rawOut_isNaN),
		.io_rawOut_isInf(_divSqrtRecFNToRaw_io_rawOut_isInf),
		.io_rawOut_isZero(_divSqrtRecFNToRaw_io_rawOut_isZero),
		.io_rawOut_sign(_divSqrtRecFNToRaw_io_rawOut_sign),
		.io_rawOut_sExp(_divSqrtRecFNToRaw_io_rawOut_sExp),
		.io_rawOut_sig(_divSqrtRecFNToRaw_io_rawOut_sig)
	);
	RoundRawFNToRecFN_e8_s24 roundRawFNToRecFN(
		.io_invalidExc(_divSqrtRecFNToRaw_io_invalidExc),
		.io_infiniteExc(_divSqrtRecFNToRaw_io_infiniteExc),
		.io_in_isNaN(_divSqrtRecFNToRaw_io_rawOut_isNaN),
		.io_in_isInf(_divSqrtRecFNToRaw_io_rawOut_isInf),
		.io_in_isZero(_divSqrtRecFNToRaw_io_rawOut_isZero),
		.io_in_sign(_divSqrtRecFNToRaw_io_rawOut_sign),
		.io_in_sExp(_divSqrtRecFNToRaw_io_rawOut_sExp),
		.io_in_sig(_divSqrtRecFNToRaw_io_rawOut_sig),
		.io_roundingMode(_divSqrtRecFNToRaw_io_roundingModeOut),
		.io_out(io_out),
		.io_exceptionFlags(io_exceptionFlags)
	);
endmodule
