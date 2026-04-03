module IntSyncAsyncCrossingSink_n1x1 (
	clock,
	auto_in_sync_0,
	auto_out_0
);
	input clock;
	input auto_in_sync_0;
	output wire auto_out_0;
	SynchronizerShiftReg_w1_d3 chain(
		.clock(clock),
		.io_d(auto_in_sync_0),
		.io_q(auto_out_0)
	);
endmodule
