module RoundAnyRawFNToRecFN_ie7_is64_oe11_os53 (
	io_in_isZero,
	io_in_sign,
	io_in_sExp,
	io_in_sig,
	io_roundingMode,
	io_out,
	io_exceptionFlags
);
	input io_in_isZero;
	input io_in_sign;
	input [8:0] io_in_sExp;
	input [64:0] io_in_sig;
	input [2:0] io_roundingMode;
	output wire [64:0] io_out;
	output wire [4:0] io_exceptionFlags;
	wire roundingMode_near_even = io_roundingMode == 3'h0;
	wire anyRound = io_in_sig[10] | (|io_in_sig[9:0]);
	wire [54:0] roundedSig = (((roundingMode_near_even | (io_roundingMode == 3'h4)) & io_in_sig[10]) | ((((io_roundingMode == 3'h2) & io_in_sign) | ((io_roundingMode == 3'h3) & ~io_in_sign)) & anyRound) ? ({1'h0, io_in_sig[64:11]} + 55'h00000000000001) & {54'h3fffffffffffff, ~((roundingMode_near_even & io_in_sig[10]) & ~(|io_in_sig[9:0]))} : {1'h0, io_in_sig[64:12], io_in_sig[11] | ((io_roundingMode == 3'h6) & anyRound)});
	assign io_out = {io_in_sign, (({{3 {io_in_sExp[8]}}, io_in_sExp} + {10'h000, roundedSig[54:53]}) + 12'h780) & ~(io_in_isZero ? 12'he00 : 12'h000), (io_in_isZero ? 52'h0000000000000 : roundedSig[51:0])};
	assign io_exceptionFlags = {4'h0, ~io_in_isZero & anyRound};
endmodule
