module PLICClockSinkDomain (
	auto_plic_int_in_0,
	auto_plic_int_in_1,
	auto_plic_in_a_ready,
	auto_plic_in_a_valid,
	auto_plic_in_a_bits_opcode,
	auto_plic_in_a_bits_param,
	auto_plic_in_a_bits_size,
	auto_plic_in_a_bits_source,
	auto_plic_in_a_bits_address,
	auto_plic_in_a_bits_mask,
	auto_plic_in_a_bits_data,
	auto_plic_in_a_bits_corrupt,
	auto_plic_in_d_ready,
	auto_plic_in_d_valid,
	auto_plic_in_d_bits_opcode,
	auto_plic_in_d_bits_size,
	auto_plic_in_d_bits_source,
	auto_plic_in_d_bits_data,
	auto_int_in_clock_xing_out_1_sync_0,
	auto_int_in_clock_xing_out_0_sync_0,
	auto_clock_in_clock,
	auto_clock_in_reset
);
	input auto_plic_int_in_0;
	input auto_plic_int_in_1;
	output wire auto_plic_in_a_ready;
	input auto_plic_in_a_valid;
	input [2:0] auto_plic_in_a_bits_opcode;
	input [2:0] auto_plic_in_a_bits_param;
	input [1:0] auto_plic_in_a_bits_size;
	input [8:0] auto_plic_in_a_bits_source;
	input [27:0] auto_plic_in_a_bits_address;
	input [7:0] auto_plic_in_a_bits_mask;
	input [63:0] auto_plic_in_a_bits_data;
	input auto_plic_in_a_bits_corrupt;
	input auto_plic_in_d_ready;
	output wire auto_plic_in_d_valid;
	output wire [2:0] auto_plic_in_d_bits_opcode;
	output wire [1:0] auto_plic_in_d_bits_size;
	output wire [8:0] auto_plic_in_d_bits_source;
	output wire [63:0] auto_plic_in_d_bits_data;
	output wire auto_int_in_clock_xing_out_1_sync_0;
	output wire auto_int_in_clock_xing_out_0_sync_0;
	input auto_clock_in_clock;
	input auto_clock_in_reset;
	wire _plic_auto_int_out_1_0;
	wire _plic_auto_int_out_0_0;
	TLPLIC plic(
		.clock(auto_clock_in_clock),
		.reset(auto_clock_in_reset),
		.auto_int_in_0(auto_plic_int_in_0),
		.auto_int_in_1(auto_plic_int_in_1),
		.auto_int_out_1_0(_plic_auto_int_out_1_0),
		.auto_int_out_0_0(_plic_auto_int_out_0_0),
		.auto_in_a_ready(auto_plic_in_a_ready),
		.auto_in_a_valid(auto_plic_in_a_valid),
		.auto_in_a_bits_opcode(auto_plic_in_a_bits_opcode),
		.auto_in_a_bits_param(auto_plic_in_a_bits_param),
		.auto_in_a_bits_size(auto_plic_in_a_bits_size),
		.auto_in_a_bits_source(auto_plic_in_a_bits_source),
		.auto_in_a_bits_address(auto_plic_in_a_bits_address),
		.auto_in_a_bits_mask(auto_plic_in_a_bits_mask),
		.auto_in_a_bits_data(auto_plic_in_a_bits_data),
		.auto_in_a_bits_corrupt(auto_plic_in_a_bits_corrupt),
		.auto_in_d_ready(auto_plic_in_d_ready),
		.auto_in_d_valid(auto_plic_in_d_valid),
		.auto_in_d_bits_opcode(auto_plic_in_d_bits_opcode),
		.auto_in_d_bits_size(auto_plic_in_d_bits_size),
		.auto_in_d_bits_source(auto_plic_in_d_bits_source),
		.auto_in_d_bits_data(auto_plic_in_d_bits_data)
	);
	IntSyncCrossingSource_n1x1 intsource(
		.clock(auto_clock_in_clock),
		.reset(auto_clock_in_reset),
		.auto_in_0(_plic_auto_int_out_0_0),
		.auto_out_sync_0(auto_int_in_clock_xing_out_0_sync_0)
	);
	IntSyncCrossingSource_n1x1 intsource_1(
		.clock(auto_clock_in_clock),
		.reset(auto_clock_in_reset),
		.auto_in_0(_plic_auto_int_out_1_0),
		.auto_out_sync_0(auto_int_in_clock_xing_out_1_sync_0)
	);
endmodule
