module ram_8x72 (
	R0_addr,
	R0_en,
	R0_clk,
	R0_data,
	W0_addr,
	W0_en,
	W0_clk,
	W0_data
);
	input [2:0] R0_addr;
	input R0_en;
	input R0_clk;
	output wire [71:0] R0_data;
	input [2:0] W0_addr;
	input W0_en;
	input W0_clk;
	input [71:0] W0_data;
	reg [71:0] Memory [0:7];
	always @(posedge W0_clk)
		if (W0_en & 1'h1)
			Memory[W0_addr] <= W0_data;
	assign R0_data = (R0_en ? Memory[R0_addr] : 72'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
endmodule
