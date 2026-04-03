module IntSyncAsyncCrossingSink_n1x2 (
	clock,
	auto_in_sync_0,
	auto_in_sync_1,
	auto_out_0,
	auto_out_1
);
	input clock;
	input auto_in_sync_0;
	input auto_in_sync_1;
	output wire auto_out_0;
	output wire auto_out_1;
	wire [1:0] _chain_io_q;
	SynchronizerShiftReg_w2_d3 chain(
		.clock(clock),
		.io_d({auto_in_sync_1, auto_in_sync_0}),
		.io_q(_chain_io_q)
	);
	assign auto_out_0 = _chain_io_q[0];
	assign auto_out_1 = _chain_io_q[1];
endmodule
