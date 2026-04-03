module RecFNToRecFN (
	io_in,
	io_roundingMode,
	io_out,
	io_exceptionFlags
);
	input [64:0] io_in;
	input [2:0] io_roundingMode;
	output wire [32:0] io_out;
	output wire [4:0] io_exceptionFlags;
	wire rawIn_isNaN = &io_in[63:62] & io_in[61];
	RoundAnyRawFNToRecFN_ie11_is53_oe8_os24 roundAnyRawFNToRecFN(
		.io_invalidExc(rawIn_isNaN & ~io_in[51]),
		.io_in_isNaN(rawIn_isNaN),
		.io_in_isInf(&io_in[63:62] & ~io_in[61]),
		.io_in_isZero(~(|io_in[63:61])),
		.io_in_sign(io_in[64]),
		.io_in_sExp({1'h0, io_in[63:52]}),
		.io_in_sig({1'h0, |io_in[63:61], io_in[51:0]}),
		.io_roundingMode(io_roundingMode),
		.io_out(io_out),
		.io_exceptionFlags(io_exceptionFlags)
	);
endmodule
