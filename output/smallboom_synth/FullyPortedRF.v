module FullyPortedRF (
	clock,
	reset,
	io_arb_read_reqs_0_bits,
	io_arb_read_reqs_1_bits,
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
	input [5:0] io_arb_read_reqs_0_bits;
	input [5:0] io_arb_read_reqs_1_bits;
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
	reg [5:0] io_rrd_read_resps_0_REG;
	reg [5:0] io_rrd_read_resps_1_REG;
	reg [5:0] io_rrd_read_resps_2_REG;
	always @(posedge clock) begin
		io_rrd_read_resps_0_REG <= io_arb_read_reqs_0_bits;
		io_rrd_read_resps_1_REG <= io_arb_read_reqs_1_bits;
		io_rrd_read_resps_2_REG <= io_arb_read_reqs_2_bits;
	end
	regfile_48x65 regfile_ext(
		.R0_addr(io_rrd_read_resps_2_REG),
		.R0_en(1'h1),
		.R0_clk(clock),
		.R0_data(io_rrd_read_resps_2),
		.R1_addr(io_rrd_read_resps_1_REG),
		.R1_en(1'h1),
		.R1_clk(clock),
		.R1_data(io_rrd_read_resps_1),
		.R2_addr(io_rrd_read_resps_0_REG),
		.R2_en(1'h1),
		.R2_clk(clock),
		.R2_data(io_rrd_read_resps_0),
		.W0_addr(io_write_ports_1_bits_addr),
		.W0_en(io_write_ports_1_valid),
		.W0_clk(clock),
		.W0_data(io_write_ports_1_bits_data),
		.W1_addr(io_write_ports_0_bits_addr),
		.W1_en(io_write_ports_0_valid),
		.W1_clk(clock),
		.W1_data(io_write_ports_0_bits_data)
	);
endmodule
