module PartiallyPortedRF_1 (
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
	wire [63:0] _rf_io_rrd_read_resps_0;
	wire [63:0] _rf_io_rrd_read_resps_1;
	wire [63:0] _rf_io_rrd_read_resps_2;
	wire use_port_3 = ~io_arb_read_reqs_0_valid & io_arb_read_reqs_1_valid;
	wire _GEN = use_port_3 | io_arb_read_reqs_0_valid;
	wire use_port_4 = ~use_port_3 & io_arb_read_reqs_1_valid;
	wire _GEN_0 = use_port_4 | use_port_3;
	wire use_port_5 = ~_GEN_0 & io_arb_read_reqs_1_valid;
	wire use_port_6 = ~_GEN & io_arb_read_reqs_2_valid;
	wire _GEN_1 = use_port_6 | _GEN;
	wire use_port_7 = (~use_port_6 & ~use_port_4) & io_arb_read_reqs_2_valid;
	wire _GEN_2 = use_port_7 | use_port_4;
	wire _GEN_3 = use_port_7 | use_port_6;
	wire use_port_8 = (~_GEN_3 & ~use_port_5) & io_arb_read_reqs_2_valid;
	wire _GEN_4 = use_port_8 | use_port_5;
	wire [1:0] _GEN_5 = {1'h0, io_arb_read_reqs_0_valid};
	wire [1:0] _GEN_6 = {1'h0, io_arb_read_reqs_1_valid};
	wire [1:0] _io_arb_read_reqs_5_ready_T_1 = _GEN_5 + _GEN_6;
	wire io_arb_read_reqs_2_ready_0 = _io_arb_read_reqs_5_ready_T_1 != 2'h3;
	wire use_port_9 = ~_GEN_1 & io_arb_read_reqs_3_valid;
	wire _GEN_7 = use_port_9 | _GEN_1;
	wire use_port_10 = (~use_port_9 & ~_GEN_2) & io_arb_read_reqs_3_valid;
	wire _GEN_8 = use_port_10 | _GEN_2;
	wire _GEN_9 = use_port_10 | use_port_9;
	wire use_port_11 = (~_GEN_9 & ~_GEN_4) & io_arb_read_reqs_3_valid;
	wire _GEN_10 = use_port_11 | _GEN_4;
	wire [1:0] _GEN_11 = {1'h0, io_arb_read_reqs_2_valid};
	wire io_arb_read_reqs_3_ready_0 = ((_GEN_5 + _GEN_6) + _GEN_11) != 2'h3;
	wire use_port_12 = ~_GEN_7 & io_arb_read_reqs_4_valid;
	wire _GEN_12 = use_port_12 | _GEN_7;
	wire use_port_13 = (~use_port_12 & ~_GEN_8) & io_arb_read_reqs_4_valid;
	wire _GEN_13 = use_port_13 | _GEN_8;
	wire _GEN_14 = use_port_13 | use_port_12;
	wire use_port_14 = (~_GEN_14 & ~_GEN_10) & io_arb_read_reqs_4_valid;
	wire _GEN_15 = use_port_14 | _GEN_10;
	wire [1:0] _GEN_16 = {1'h0, io_arb_read_reqs_3_valid};
	wire [2:0] _GEN_17 = {1'h0, _io_arb_read_reqs_5_ready_T_1};
	wire io_arb_read_reqs_4_ready_0 = (_GEN_17 + {1'h0, _GEN_11 + _GEN_16}) < 3'h3;
	wire use_port_15 = ~_GEN_12 & io_arb_read_reqs_5_valid;
	wire use_port_16 = (~use_port_15 & ~_GEN_13) & io_arb_read_reqs_5_valid;
	wire _GEN_18 = use_port_16 | use_port_15;
	wire use_port_17 = (~_GEN_18 & ~_GEN_15) & io_arb_read_reqs_5_valid;
	wire io_arb_read_reqs_5_ready_0 = (_GEN_17 + {1'h0, (_GEN_11 + _GEN_16) + {1'h0, io_arb_read_reqs_4_valid}}) < 3'h3;
	reg [2:0] rrd_data_sels_0;
	reg [2:0] rrd_data_sels_1;
	reg [2:0] rrd_data_sels_2;
	reg [2:0] rrd_data_sels_3;
	reg [2:0] rrd_data_sels_4;
	reg [2:0] rrd_data_sels_5;
	always @(posedge clock) begin
		rrd_data_sels_0 <= 3'h1;
		rrd_data_sels_1 <= (use_port_5 ? 3'h4 : (use_port_4 ? 3'h2 : 3'h1));
		rrd_data_sels_2 <= (use_port_8 ? 3'h4 : (use_port_7 ? 3'h2 : 3'h1));
		rrd_data_sels_3 <= (use_port_11 ? 3'h4 : (use_port_10 ? 3'h2 : 3'h1));
		rrd_data_sels_4 <= (use_port_14 ? 3'h4 : (use_port_13 ? 3'h2 : 3'h1));
		rrd_data_sels_5 <= (use_port_17 ? 3'h4 : (use_port_16 ? 3'h2 : 3'h1));
	end
	FullyPortedRF_1 rf(
		.clock(clock),
		.reset(reset),
		.io_arb_read_reqs_0_bits((((((io_arb_read_reqs_0_valid ? io_arb_read_reqs_0_bits : 6'h00) | (io_arb_read_reqs_0_valid | ~use_port_3 ? 6'h00 : io_arb_read_reqs_1_bits)) | (_GEN | ~use_port_6 ? 6'h00 : io_arb_read_reqs_2_bits)) | (_GEN_1 | ~use_port_9 ? 6'h00 : io_arb_read_reqs_3_bits)) | (_GEN_7 | ~use_port_12 ? 6'h00 : io_arb_read_reqs_4_bits)) | (_GEN_12 | ~use_port_15 ? 6'h00 : io_arb_read_reqs_5_bits)),
		.io_arb_read_reqs_1_bits(((((use_port_4 ? io_arb_read_reqs_1_bits : 6'h00) | (use_port_4 | ~use_port_7 ? 6'h00 : io_arb_read_reqs_2_bits)) | (_GEN_2 | ~use_port_10 ? 6'h00 : io_arb_read_reqs_3_bits)) | (_GEN_8 | ~use_port_13 ? 6'h00 : io_arb_read_reqs_4_bits)) | (_GEN_13 | ~use_port_16 ? 6'h00 : io_arb_read_reqs_5_bits)),
		.io_arb_read_reqs_2_bits(((((use_port_5 ? io_arb_read_reqs_1_bits : 6'h00) | (use_port_5 | ~use_port_8 ? 6'h00 : io_arb_read_reqs_2_bits)) | (_GEN_4 | ~use_port_11 ? 6'h00 : io_arb_read_reqs_3_bits)) | (_GEN_10 | ~use_port_14 ? 6'h00 : io_arb_read_reqs_4_bits)) | (_GEN_15 | ~use_port_17 ? 6'h00 : io_arb_read_reqs_5_bits)),
		.io_rrd_read_resps_0(_rf_io_rrd_read_resps_0),
		.io_rrd_read_resps_1(_rf_io_rrd_read_resps_1),
		.io_rrd_read_resps_2(_rf_io_rrd_read_resps_2),
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
	assign io_arb_read_reqs_2_ready = io_arb_read_reqs_2_ready_0;
	assign io_arb_read_reqs_3_ready = io_arb_read_reqs_3_ready_0;
	assign io_arb_read_reqs_4_ready = io_arb_read_reqs_4_ready_0;
	assign io_arb_read_reqs_5_ready = io_arb_read_reqs_5_ready_0;
	assign io_rrd_read_resps_0 = ((rrd_data_sels_0[0] ? _rf_io_rrd_read_resps_0 : 64'h0000000000000000) | (rrd_data_sels_0[1] ? _rf_io_rrd_read_resps_1 : 64'h0000000000000000)) | (rrd_data_sels_0[2] ? _rf_io_rrd_read_resps_2 : 64'h0000000000000000);
	assign io_rrd_read_resps_1 = ((rrd_data_sels_1[0] ? _rf_io_rrd_read_resps_0 : 64'h0000000000000000) | (rrd_data_sels_1[1] ? _rf_io_rrd_read_resps_1 : 64'h0000000000000000)) | (rrd_data_sels_1[2] ? _rf_io_rrd_read_resps_2 : 64'h0000000000000000);
	assign io_rrd_read_resps_2 = ((rrd_data_sels_2[0] ? _rf_io_rrd_read_resps_0 : 64'h0000000000000000) | (rrd_data_sels_2[1] ? _rf_io_rrd_read_resps_1 : 64'h0000000000000000)) | (rrd_data_sels_2[2] ? _rf_io_rrd_read_resps_2 : 64'h0000000000000000);
	assign io_rrd_read_resps_3 = ((rrd_data_sels_3[0] ? _rf_io_rrd_read_resps_0 : 64'h0000000000000000) | (rrd_data_sels_3[1] ? _rf_io_rrd_read_resps_1 : 64'h0000000000000000)) | (rrd_data_sels_3[2] ? _rf_io_rrd_read_resps_2 : 64'h0000000000000000);
	assign io_rrd_read_resps_4 = ((rrd_data_sels_4[0] ? _rf_io_rrd_read_resps_0 : 64'h0000000000000000) | (rrd_data_sels_4[1] ? _rf_io_rrd_read_resps_1 : 64'h0000000000000000)) | (rrd_data_sels_4[2] ? _rf_io_rrd_read_resps_2 : 64'h0000000000000000);
	assign io_rrd_read_resps_5 = ((rrd_data_sels_5[0] ? _rf_io_rrd_read_resps_0 : 64'h0000000000000000) | (rrd_data_sels_5[1] ? _rf_io_rrd_read_resps_1 : 64'h0000000000000000)) | (rrd_data_sels_5[2] ? _rf_io_rrd_read_resps_2 : 64'h0000000000000000);
endmodule
