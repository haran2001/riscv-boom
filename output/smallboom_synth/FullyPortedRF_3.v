module FullyPortedRF_3 (
	clock,
	io_arb_read_reqs_0_bits,
	io_arb_read_reqs_2_bits,
	io_arb_read_reqs_3_bits,
	io_rrd_read_resps_0,
	io_rrd_read_resps_2,
	io_rrd_read_resps_3,
	io_write_ports_0_valid,
	io_write_ports_0_bits_addr,
	io_write_ports_0_bits_data
);
	input clock;
	input [4:0] io_arb_read_reqs_0_bits;
	input [4:0] io_arb_read_reqs_2_bits;
	input [4:0] io_arb_read_reqs_3_bits;
	output wire [19:0] io_rrd_read_resps_0;
	output wire [19:0] io_rrd_read_resps_2;
	output wire [19:0] io_rrd_read_resps_3;
	input io_write_ports_0_valid;
	input [5:0] io_write_ports_0_bits_addr;
	input [19:0] io_write_ports_0_bits_data;
	reg [4:0] io_rrd_read_resps_0_REG;
	reg [4:0] io_rrd_read_resps_2_REG;
	reg [4:0] io_rrd_read_resps_3_REG;
	always @(posedge clock) begin
		io_rrd_read_resps_0_REG <= io_arb_read_reqs_0_bits;
		io_rrd_read_resps_2_REG <= io_arb_read_reqs_2_bits;
		io_rrd_read_resps_3_REG <= io_arb_read_reqs_3_bits;
	end
	regfile_32x20 regfile_ext(
		.R0_addr(io_rrd_read_resps_3_REG),
		.R0_en(1'h1),
		.R0_clk(clock),
		.R0_data(io_rrd_read_resps_3),
		.R1_addr(io_rrd_read_resps_2_REG),
		.R1_en(1'h1),
		.R1_clk(clock),
		.R1_data(io_rrd_read_resps_2),
		.R2_addr(io_rrd_read_resps_0_REG),
		.R2_en(1'h1),
		.R2_clk(clock),
		.R2_data(io_rrd_read_resps_0),
		.W0_addr(io_write_ports_0_bits_addr[4:0]),
		.W0_en(io_write_ports_0_valid),
		.W0_clk(clock),
		.W0_data(io_write_ports_0_bits_data)
	);
endmodule
