module SynchronizerShiftReg_w1_d3 (
	clock,
	io_d,
	io_q
);
	input clock;
	input io_d;
	output wire io_q;
	NonSyncResetSynchronizerPrimitiveShiftReg_d3 output_chain(
		.clock(clock),
		.io_d(io_d),
		.io_q(io_q)
	);
endmodule
