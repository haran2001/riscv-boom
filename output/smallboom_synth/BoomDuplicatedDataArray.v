module BoomDuplicatedDataArray (
	clock,
	io_read_0_valid,
	io_read_0_bits_addr,
	io_write_valid,
	io_write_bits_way_en,
	io_write_bits_addr,
	io_write_bits_data,
	io_resp_0_0,
	io_resp_0_1,
	io_resp_0_2,
	io_resp_0_3
);
	input clock;
	input io_read_0_valid;
	input [11:0] io_read_0_bits_addr;
	input io_write_valid;
	input [3:0] io_write_bits_way_en;
	input [11:0] io_write_bits_addr;
	input [63:0] io_write_bits_data;
	output wire [63:0] io_resp_0_0;
	output wire [63:0] io_resp_0_1;
	output wire [63:0] io_resp_0_2;
	output wire [63:0] io_resp_0_3;
	wire [63:0] _array_3_0_0_ext_R0_data;
	wire [63:0] _array_2_0_0_ext_R0_data;
	wire [63:0] _array_1_0_0_ext_R0_data;
	wire [63:0] _array_0_0_0_ext_R0_data;
	reg [63:0] io_resp_0_0_REG;
	reg [63:0] io_resp_0_1_REG;
	reg [63:0] io_resp_0_2_REG;
	reg [63:0] io_resp_0_3_REG;
	always @(posedge clock) begin
		io_resp_0_0_REG <= _array_0_0_0_ext_R0_data;
		io_resp_0_1_REG <= _array_1_0_0_ext_R0_data;
		io_resp_0_2_REG <= _array_2_0_0_ext_R0_data;
		io_resp_0_3_REG <= _array_3_0_0_ext_R0_data;
	end
	array_512x64 array_0_0_0_ext(
		.R0_addr(io_read_0_bits_addr[11:3]),
		.R0_en(io_read_0_valid),
		.R0_clk(clock),
		.R0_data(_array_0_0_0_ext_R0_data),
		.W0_addr(io_write_bits_addr[11:3]),
		.W0_en(io_write_bits_way_en[0] & io_write_valid),
		.W0_clk(clock),
		.W0_data(io_write_bits_data)
	);
	array_512x64 array_1_0_0_ext(
		.R0_addr(io_read_0_bits_addr[11:3]),
		.R0_en(io_read_0_valid),
		.R0_clk(clock),
		.R0_data(_array_1_0_0_ext_R0_data),
		.W0_addr(io_write_bits_addr[11:3]),
		.W0_en(io_write_bits_way_en[1] & io_write_valid),
		.W0_clk(clock),
		.W0_data(io_write_bits_data)
	);
	array_512x64 array_2_0_0_ext(
		.R0_addr(io_read_0_bits_addr[11:3]),
		.R0_en(io_read_0_valid),
		.R0_clk(clock),
		.R0_data(_array_2_0_0_ext_R0_data),
		.W0_addr(io_write_bits_addr[11:3]),
		.W0_en(io_write_bits_way_en[2] & io_write_valid),
		.W0_clk(clock),
		.W0_data(io_write_bits_data)
	);
	array_512x64 array_3_0_0_ext(
		.R0_addr(io_read_0_bits_addr[11:3]),
		.R0_en(io_read_0_valid),
		.R0_clk(clock),
		.R0_data(_array_3_0_0_ext_R0_data),
		.W0_addr(io_write_bits_addr[11:3]),
		.W0_en(io_write_bits_way_en[3] & io_write_valid),
		.W0_clk(clock),
		.W0_data(io_write_bits_data)
	);
	assign io_resp_0_0 = io_resp_0_0_REG;
	assign io_resp_0_1 = io_resp_0_1_REG;
	assign io_resp_0_2 = io_resp_0_2_REG;
	assign io_resp_0_3 = io_resp_0_3_REG;
endmodule
