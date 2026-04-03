module FixedClockBroadcast_3 (
	auto_anon_in_clock,
	auto_anon_in_reset,
	auto_anon_out_2_clock,
	auto_anon_out_2_reset,
	auto_anon_out_1_clock,
	auto_anon_out_1_reset,
	auto_anon_out_0_clock,
	auto_anon_out_0_reset
);
	input auto_anon_in_clock;
	input auto_anon_in_reset;
	output wire auto_anon_out_2_clock;
	output wire auto_anon_out_2_reset;
	output wire auto_anon_out_1_clock;
	output wire auto_anon_out_1_reset;
	output wire auto_anon_out_0_clock;
	output wire auto_anon_out_0_reset;
	assign auto_anon_out_2_clock = auto_anon_in_clock;
	assign auto_anon_out_2_reset = auto_anon_in_reset;
	assign auto_anon_out_1_clock = auto_anon_in_clock;
	assign auto_anon_out_1_reset = auto_anon_in_reset;
	assign auto_anon_out_0_clock = auto_anon_in_clock;
	assign auto_anon_out_0_reset = auto_anon_in_reset;
endmodule
