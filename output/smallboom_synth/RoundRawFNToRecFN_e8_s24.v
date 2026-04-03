module RoundRawFNToRecFN_e8_s24 (
	io_invalidExc,
	io_infiniteExc,
	io_in_isNaN,
	io_in_isInf,
	io_in_isZero,
	io_in_sign,
	io_in_sExp,
	io_in_sig,
	io_roundingMode,
	io_out,
	io_exceptionFlags
);
	input io_invalidExc;
	input io_infiniteExc;
	input io_in_isNaN;
	input io_in_isInf;
	input io_in_isZero;
	input io_in_sign;
	input [9:0] io_in_sExp;
	input [26:0] io_in_sig;
	input [2:0] io_roundingMode;
	output wire [32:0] io_out;
	output wire [4:0] io_exceptionFlags;
	RoundAnyRawFNToRecFN_ie8_is26_oe8_os24 roundAnyRawFNToRecFN(
		.io_invalidExc(io_invalidExc),
		.io_infiniteExc(io_infiniteExc),
		.io_in_isNaN(io_in_isNaN),
		.io_in_isInf(io_in_isInf),
		.io_in_isZero(io_in_isZero),
		.io_in_sign(io_in_sign),
		.io_in_sExp(io_in_sExp),
		.io_in_sig(io_in_sig),
		.io_roundingMode(io_roundingMode),
		.io_out(io_out),
		.io_exceptionFlags(io_exceptionFlags)
	);
endmodule
