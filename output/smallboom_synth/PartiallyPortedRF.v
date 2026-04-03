module PartiallyPortedRF (
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
	wire [64:0] _rf_io_rrd_read_resps_0;
	wire [64:0] _rf_io_rrd_read_resps_1;
	wire [64:0] _rf_io_rrd_read_resps_2;
	wire use_port_3 = ~io_arb_read_reqs_0_valid & io_arb_read_reqs_1_valid;
	wire _GEN = use_port_3 | io_arb_read_reqs_0_valid;
	wire use_port_4 = ~use_port_3 & io_arb_read_reqs_1_valid;
	wire _GEN_0 = use_port_4 | use_port_3;
	wire use_port_5 = ~_GEN_0 & io_arb_read_reqs_1_valid;
	wire use_port_6 = ~_GEN & io_arb_read_reqs_2_valid;
	wire use_port_7 = (~use_port_6 & ~use_port_4) & io_arb_read_reqs_2_valid;
	wire _GEN_1 = use_port_7 | use_port_6;
	wire use_port_8 = (~_GEN_1 & ~use_port_5) & io_arb_read_reqs_2_valid;
	wire io_arb_read_reqs_2_ready_0 = ({1'h0, io_arb_read_reqs_0_valid} + {1'h0, io_arb_read_reqs_1_valid}) != 2'h3;
	reg [2:0] rrd_data_sels_0;
	reg [2:0] rrd_data_sels_1;
	reg [2:0] rrd_data_sels_2;
	always @(posedge clock) begin
		rrd_data_sels_0 <= 3'h1;
		rrd_data_sels_1 <= (use_port_5 ? 3'h4 : (use_port_4 ? 3'h2 : 3'h1));
		rrd_data_sels_2 <= (use_port_8 ? 3'h4 : (use_port_7 ? 3'h2 : 3'h1));
	end
	FullyPortedRF rf(
		.clock(clock),
		.reset(reset),
		.io_arb_read_reqs_0_bits(((io_arb_read_reqs_0_valid ? io_arb_read_reqs_0_bits : 6'h00) | (io_arb_read_reqs_0_valid | ~use_port_3 ? 6'h00 : io_arb_read_reqs_1_bits)) | (_GEN | ~use_port_6 ? 6'h00 : io_arb_read_reqs_2_bits)),
		.io_arb_read_reqs_1_bits((use_port_4 ? io_arb_read_reqs_1_bits : 6'h00) | (use_port_4 | ~use_port_7 ? 6'h00 : io_arb_read_reqs_2_bits)),
		.io_arb_read_reqs_2_bits((use_port_5 ? io_arb_read_reqs_1_bits : 6'h00) | (use_port_5 | ~use_port_8 ? 6'h00 : io_arb_read_reqs_2_bits)),
		.io_rrd_read_resps_0(_rf_io_rrd_read_resps_0),
		.io_rrd_read_resps_1(_rf_io_rrd_read_resps_1),
		.io_rrd_read_resps_2(_rf_io_rrd_read_resps_2),
		.io_write_ports_0_valid(io_write_ports_0_valid),
		.io_write_ports_0_bits_addr(io_write_ports_0_bits_addr),
		.io_write_ports_0_bits_data(io_write_ports_0_bits_data),
		.io_write_ports_1_valid(io_write_ports_1_valid),
		.io_write_ports_1_bits_addr(io_write_ports_1_bits_addr),
		.io_write_ports_1_bits_data(io_write_ports_1_bits_data)
	);
	assign io_arb_read_reqs_2_ready = io_arb_read_reqs_2_ready_0;
	assign io_rrd_read_resps_0 = ((rrd_data_sels_0[0] ? _rf_io_rrd_read_resps_0 : 65'h00000000000000000) | (rrd_data_sels_0[1] ? _rf_io_rrd_read_resps_1 : 65'h00000000000000000)) | (rrd_data_sels_0[2] ? _rf_io_rrd_read_resps_2 : 65'h00000000000000000);
	assign io_rrd_read_resps_1 = ((rrd_data_sels_1[0] ? _rf_io_rrd_read_resps_0 : 65'h00000000000000000) | (rrd_data_sels_1[1] ? _rf_io_rrd_read_resps_1 : 65'h00000000000000000)) | (rrd_data_sels_1[2] ? _rf_io_rrd_read_resps_2 : 65'h00000000000000000);
	assign io_rrd_read_resps_2 = ((rrd_data_sels_2[0] ? _rf_io_rrd_read_resps_0 : 65'h00000000000000000) | (rrd_data_sels_2[1] ? _rf_io_rrd_read_resps_1 : 65'h00000000000000000)) | (rrd_data_sels_2[2] ? _rf_io_rrd_read_resps_2 : 65'h00000000000000000);
endmodule
