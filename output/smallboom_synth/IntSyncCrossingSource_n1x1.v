module IntSyncCrossingSource_n1x1 (
	clock,
	reset,
	auto_in_0,
	auto_out_sync_0
);
	input clock;
	input reset;
	input auto_in_0;
	output wire auto_out_sync_0;
	AsyncResetRegVec_w1_i0 reg_0(
		.clock(clock),
		.reset(reset),
		.io_d(auto_in_0),
		.io_q(auto_out_sync_0)
	);
endmodule
