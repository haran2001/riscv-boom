module AsyncResetSynchronizerShiftReg_w1_d3_i0_1 (
	clock,
	reset,
	io_d,
	io_q
);
	input clock;
	input reset;
	input io_d;
	output wire io_q;
	AsyncResetSynchronizerPrimitiveShiftReg_d3_i0 output_chain(
		.clock(clock),
		.reset(reset),
		.io_d(io_d),
		.io_q(io_q)
	);
endmodule
