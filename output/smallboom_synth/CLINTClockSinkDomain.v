module CLINTClockSinkDomain (
	auto_clint_in_a_ready,
	auto_clint_in_a_valid,
	auto_clint_in_a_bits_opcode,
	auto_clint_in_a_bits_param,
	auto_clint_in_a_bits_size,
	auto_clint_in_a_bits_source,
	auto_clint_in_a_bits_address,
	auto_clint_in_a_bits_mask,
	auto_clint_in_a_bits_data,
	auto_clint_in_a_bits_corrupt,
	auto_clint_in_d_ready,
	auto_clint_in_d_valid,
	auto_clint_in_d_bits_opcode,
	auto_clint_in_d_bits_size,
	auto_clint_in_d_bits_source,
	auto_clint_in_d_bits_data,
	auto_int_in_clock_xing_out_sync_0,
	auto_int_in_clock_xing_out_sync_1,
	auto_clock_in_clock,
	auto_clock_in_reset,
	tick,
	clock,
	reset
);
	output wire auto_clint_in_a_ready;
	input auto_clint_in_a_valid;
	input [2:0] auto_clint_in_a_bits_opcode;
	input [2:0] auto_clint_in_a_bits_param;
	input [1:0] auto_clint_in_a_bits_size;
	input [8:0] auto_clint_in_a_bits_source;
	input [25:0] auto_clint_in_a_bits_address;
	input [7:0] auto_clint_in_a_bits_mask;
	input [63:0] auto_clint_in_a_bits_data;
	input auto_clint_in_a_bits_corrupt;
	input auto_clint_in_d_ready;
	output wire auto_clint_in_d_valid;
	output wire [2:0] auto_clint_in_d_bits_opcode;
	output wire [1:0] auto_clint_in_d_bits_size;
	output wire [8:0] auto_clint_in_d_bits_source;
	output wire [63:0] auto_clint_in_d_bits_data;
	output wire auto_int_in_clock_xing_out_sync_0;
	output wire auto_int_in_clock_xing_out_sync_1;
	input auto_clock_in_clock;
	input auto_clock_in_reset;
	input tick;
	output wire clock;
	output wire reset;
	wire _clint_auto_int_out_0;
	wire _clint_auto_int_out_1;
	CLINT clint(
		.clock(auto_clock_in_clock),
		.reset(auto_clock_in_reset),
		.auto_int_out_0(_clint_auto_int_out_0),
		.auto_int_out_1(_clint_auto_int_out_1),
		.auto_in_a_ready(auto_clint_in_a_ready),
		.auto_in_a_valid(auto_clint_in_a_valid),
		.auto_in_a_bits_opcode(auto_clint_in_a_bits_opcode),
		.auto_in_a_bits_param(auto_clint_in_a_bits_param),
		.auto_in_a_bits_size(auto_clint_in_a_bits_size),
		.auto_in_a_bits_source(auto_clint_in_a_bits_source),
		.auto_in_a_bits_address(auto_clint_in_a_bits_address),
		.auto_in_a_bits_mask(auto_clint_in_a_bits_mask),
		.auto_in_a_bits_data(auto_clint_in_a_bits_data),
		.auto_in_a_bits_corrupt(auto_clint_in_a_bits_corrupt),
		.auto_in_d_ready(auto_clint_in_d_ready),
		.auto_in_d_valid(auto_clint_in_d_valid),
		.auto_in_d_bits_opcode(auto_clint_in_d_bits_opcode),
		.auto_in_d_bits_size(auto_clint_in_d_bits_size),
		.auto_in_d_bits_source(auto_clint_in_d_bits_source),
		.auto_in_d_bits_data(auto_clint_in_d_bits_data),
		.io_rtcTick(tick)
	);
	IntSyncCrossingSource_n1x2 intsource(
		.clock(auto_clock_in_clock),
		.reset(auto_clock_in_reset),
		.auto_in_0(_clint_auto_int_out_0),
		.auto_in_1(_clint_auto_int_out_1),
		.auto_out_sync_0(auto_int_in_clock_xing_out_sync_0),
		.auto_out_sync_1(auto_int_in_clock_xing_out_sync_1)
	);
	assign clock = auto_clock_in_clock;
	assign reset = auto_clock_in_reset;
endmodule
