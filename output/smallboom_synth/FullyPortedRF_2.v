module FullyPortedRF_2 (
	clock,
	io_arb_read_reqs_0_bits,
	io_rrd_read_resps_0,
	io_write_ports_0_valid,
	io_write_ports_0_bits_addr,
	io_write_ports_0_bits_data
);
	input clock;
	input [3:0] io_arb_read_reqs_0_bits;
	output wire io_rrd_read_resps_0;
	input io_write_ports_0_valid;
	input [5:0] io_write_ports_0_bits_addr;
	input io_write_ports_0_bits_data;
	reg [3:0] io_rrd_read_resps_0_REG;
	always @(posedge clock) io_rrd_read_resps_0_REG <= io_arb_read_reqs_0_bits;
	regfile_16x1 regfile_ext(
		.R0_addr(io_rrd_read_resps_0_REG),
		.R0_en(1'h1),
		.R0_clk(clock),
		.R0_data(io_rrd_read_resps_0),
		.W0_addr(io_write_ports_0_bits_addr[3:0]),
		.W0_en(io_write_ports_0_valid),
		.W0_clk(clock),
		.W0_data(io_write_ports_0_bits_data)
	);
endmodule
