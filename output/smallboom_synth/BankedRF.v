module BankedRF (
	clock,
	reset,
	io_arb_read_reqs_0_valid,
	io_arb_read_reqs_0_bits,
	io_arb_read_reqs_1_valid,
	io_arb_read_reqs_1_bits,
	io_arb_read_reqs_2_ready,
	io_arb_read_reqs_2_valid,
	io_arb_read_reqs_2_bits,
	io_rrd_read_resps_0,
	io_rrd_read_resps_1,
	io_rrd_read_resps_2,
	io_write_ports_0_valid,
	io_write_ports_0_bits_addr,
	io_write_ports_0_bits_data,
	io_write_ports_1_valid,
	io_write_ports_1_bits_addr,
	io_write_ports_1_bits_data
);
	input clock;
	input reset;
	input io_arb_read_reqs_0_valid;
	input [5:0] io_arb_read_reqs_0_bits;
	input io_arb_read_reqs_1_valid;
	input [5:0] io_arb_read_reqs_1_bits;
	output wire io_arb_read_reqs_2_ready;
	input io_arb_read_reqs_2_valid;
	input [5:0] io_arb_read_reqs_2_bits;
	output wire [64:0] io_rrd_read_resps_0;
	output wire [64:0] io_rrd_read_resps_1;
	output wire [64:0] io_rrd_read_resps_2;
	input io_write_ports_0_valid;
	input [5:0] io_write_ports_0_bits_addr;
	input [64:0] io_write_ports_0_bits_data;
	input io_write_ports_1_valid;
	input [5:0] io_write_ports_1_bits_addr;
	input [64:0] io_write_ports_1_bits_data;
	PartiallyPortedRF rfs_0(
		.clock(clock),
		.reset(reset),
		.io_arb_read_reqs_0_valid(io_arb_read_reqs_0_valid),
		.io_arb_read_reqs_0_bits(io_arb_read_reqs_0_bits),
		.io_arb_read_reqs_1_valid(io_arb_read_reqs_1_valid),
		.io_arb_read_reqs_1_bits(io_arb_read_reqs_1_bits),
		.io_arb_read_reqs_2_ready(io_arb_read_reqs_2_ready),
		.io_arb_read_reqs_2_valid(io_arb_read_reqs_2_valid),
		.io_arb_read_reqs_2_bits(io_arb_read_reqs_2_bits),
		.io_rrd_read_resps_0(io_rrd_read_resps_0),
		.io_rrd_read_resps_1(io_rrd_read_resps_1),
		.io_rrd_read_resps_2(io_rrd_read_resps_2),
		.io_write_ports_0_valid(io_write_ports_0_valid),
		.io_write_ports_0_bits_addr(io_write_ports_0_bits_addr),
		.io_write_ports_0_bits_data(io_write_ports_0_bits_data),
		.io_write_ports_1_valid(io_write_ports_1_valid),
		.io_write_ports_1_bits_addr(io_write_ports_1_bits_addr),
		.io_write_ports_1_bits_data(io_write_ports_1_bits_data)
	);
endmodule
