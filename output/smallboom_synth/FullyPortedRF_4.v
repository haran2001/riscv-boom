module FullyPortedRF_4 (
	clock,
	io_arb_read_reqs_0_bits,
	io_rrd_read_resps_0_ldq_idx,
	io_rrd_read_resps_0_stq_idx,
	io_write_ports_0_valid,
	io_write_ports_0_bits_addr,
	io_write_ports_0_bits_data_ldq_idx,
	io_write_ports_0_bits_data_stq_idx,
	io_write_ports_0_bits_data_rxq_idx
);
	input clock;
	input [2:0] io_arb_read_reqs_0_bits;
	output wire [3:0] io_rrd_read_resps_0_ldq_idx;
	output wire [3:0] io_rrd_read_resps_0_stq_idx;
	input io_write_ports_0_valid;
	input [5:0] io_write_ports_0_bits_addr;
	input [3:0] io_write_ports_0_bits_data_ldq_idx;
	input [3:0] io_write_ports_0_bits_data_stq_idx;
	input [1:0] io_write_ports_0_bits_data_rxq_idx;
	wire [7:0] _regfile_ext_R0_data;
	reg [2:0] io_rrd_read_resps_0_REG;
	always @(posedge clock) io_rrd_read_resps_0_REG <= io_arb_read_reqs_0_bits;
	regfile_8x8 regfile_ext(
		.R0_addr(io_rrd_read_resps_0_REG),
		.R0_en(1'h1),
		.R0_clk(clock),
		.R0_data(_regfile_ext_R0_data),
		.W0_addr(io_write_ports_0_bits_addr[2:0]),
		.W0_en(io_write_ports_0_valid),
		.W0_clk(clock),
		.W0_data({io_write_ports_0_bits_data_stq_idx, io_write_ports_0_bits_data_ldq_idx})
	);
	assign io_rrd_read_resps_0_ldq_idx = _regfile_ext_R0_data[3:0];
	assign io_rrd_read_resps_0_stq_idx = _regfile_ext_R0_data[7:4];
endmodule
