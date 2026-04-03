module BankedRF_1 (
	clock,
	reset,
	io_arb_read_reqs_0_valid,
	io_arb_read_reqs_0_bits,
	io_arb_read_reqs_1_valid,
	io_arb_read_reqs_1_bits,
	io_arb_read_reqs_2_ready,
	io_arb_read_reqs_2_valid,
	io_arb_read_reqs_2_bits,
	io_arb_read_reqs_3_ready,
	io_arb_read_reqs_3_valid,
	io_arb_read_reqs_3_bits,
	io_arb_read_reqs_4_ready,
	io_arb_read_reqs_4_valid,
	io_arb_read_reqs_4_bits,
	io_arb_read_reqs_5_ready,
	io_arb_read_reqs_5_valid,
	io_arb_read_reqs_5_bits,
	io_rrd_read_resps_0,
	io_rrd_read_resps_1,
	io_rrd_read_resps_2,
	io_rrd_read_resps_3,
	io_rrd_read_resps_4,
	io_rrd_read_resps_5,
	io_write_ports_0_valid,
	io_write_ports_0_bits_addr,
	io_write_ports_0_bits_data,
	io_write_ports_1_valid,
	io_write_ports_1_bits_addr,
	io_write_ports_1_bits_data,
	io_write_ports_2_valid,
	io_write_ports_2_bits_addr,
	io_write_ports_2_bits_data
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
	output wire io_arb_read_reqs_3_ready;
	input io_arb_read_reqs_3_valid;
	input [5:0] io_arb_read_reqs_3_bits;
	output wire io_arb_read_reqs_4_ready;
	input io_arb_read_reqs_4_valid;
	input [5:0] io_arb_read_reqs_4_bits;
	output wire io_arb_read_reqs_5_ready;
	input io_arb_read_reqs_5_valid;
	input [5:0] io_arb_read_reqs_5_bits;
	output wire [63:0] io_rrd_read_resps_0;
	output wire [63:0] io_rrd_read_resps_1;
	output wire [63:0] io_rrd_read_resps_2;
	output wire [63:0] io_rrd_read_resps_3;
	output wire [63:0] io_rrd_read_resps_4;
	output wire [63:0] io_rrd_read_resps_5;
	input io_write_ports_0_valid;
	input [5:0] io_write_ports_0_bits_addr;
	input [63:0] io_write_ports_0_bits_data;
	input io_write_ports_1_valid;
	input [5:0] io_write_ports_1_bits_addr;
	input [63:0] io_write_ports_1_bits_data;
	input io_write_ports_2_valid;
	input [5:0] io_write_ports_2_bits_addr;
	input [63:0] io_write_ports_2_bits_data;
	PartiallyPortedRF_1 rfs_0(
		.clock(clock),
		.reset(reset),
		.io_arb_read_reqs_0_valid(io_arb_read_reqs_0_valid),
		.io_arb_read_reqs_0_bits(io_arb_read_reqs_0_bits),
		.io_arb_read_reqs_1_valid(io_arb_read_reqs_1_valid),
		.io_arb_read_reqs_1_bits(io_arb_read_reqs_1_bits),
		.io_arb_read_reqs_2_ready(io_arb_read_reqs_2_ready),
		.io_arb_read_reqs_2_valid(io_arb_read_reqs_2_valid),
		.io_arb_read_reqs_2_bits(io_arb_read_reqs_2_bits),
		.io_arb_read_reqs_3_ready(io_arb_read_reqs_3_ready),
		.io_arb_read_reqs_3_valid(io_arb_read_reqs_3_valid),
		.io_arb_read_reqs_3_bits(io_arb_read_reqs_3_bits),
		.io_arb_read_reqs_4_ready(io_arb_read_reqs_4_ready),
		.io_arb_read_reqs_4_valid(io_arb_read_reqs_4_valid),
		.io_arb_read_reqs_4_bits(io_arb_read_reqs_4_bits),
		.io_arb_read_reqs_5_ready(io_arb_read_reqs_5_ready),
		.io_arb_read_reqs_5_valid(io_arb_read_reqs_5_valid),
		.io_arb_read_reqs_5_bits(io_arb_read_reqs_5_bits),
		.io_rrd_read_resps_0(io_rrd_read_resps_0),
		.io_rrd_read_resps_1(io_rrd_read_resps_1),
		.io_rrd_read_resps_2(io_rrd_read_resps_2),
		.io_rrd_read_resps_3(io_rrd_read_resps_3),
		.io_rrd_read_resps_4(io_rrd_read_resps_4),
		.io_rrd_read_resps_5(io_rrd_read_resps_5),
		.io_write_ports_0_valid(io_write_ports_0_valid),
		.io_write_ports_0_bits_addr(io_write_ports_0_bits_addr),
		.io_write_ports_0_bits_data(io_write_ports_0_bits_data),
		.io_write_ports_1_valid(io_write_ports_1_valid),
		.io_write_ports_1_bits_addr(io_write_ports_1_bits_addr),
		.io_write_ports_1_bits_data(io_write_ports_1_bits_data),
		.io_write_ports_2_valid(io_write_ports_2_valid),
		.io_write_ports_2_bits_addr(io_write_ports_2_bits_addr),
		.io_write_ports_2_bits_data(io_write_ports_2_bits_data)
	);
endmodule
