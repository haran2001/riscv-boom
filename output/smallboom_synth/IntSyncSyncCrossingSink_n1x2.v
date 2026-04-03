module IntSyncSyncCrossingSink_n1x2 (
	auto_in_sync_0,
	auto_in_sync_1,
	auto_out_0,
	auto_out_1
);
	input auto_in_sync_0;
	input auto_in_sync_1;
	output wire auto_out_0;
	output wire auto_out_1;
	assign auto_out_0 = auto_in_sync_0;
	assign auto_out_1 = auto_in_sync_1;
endmodule
