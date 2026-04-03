module AsyncValidSync (
	io_in,
	io_out,
	clock,
	reset
);
	input io_in;
	output wire io_out;
	input clock;
	input reset;
	AsyncResetSynchronizerShiftReg_w1_d3_i0_1 io_out_source_valid_0(
		.clock(clock),
		.reset(reset),
		.io_d(io_in),
		.io_q(io_out)
	);
endmodule
