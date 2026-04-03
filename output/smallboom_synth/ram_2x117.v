module ram_2x117 (
	R0_addr,
	R0_en,
	R0_clk,
	R0_data,
	W0_addr,
	W0_en,
	W0_clk,
	W0_data
);
	input R0_addr;
	input R0_en;
	input R0_clk;
	output wire [116:0] R0_data;
	input W0_addr;
	input W0_en;
	input W0_clk;
	input [116:0] W0_data;
	reg [116:0] Memory [0:1];
	always @(posedge W0_clk)
		if (W0_en & 1'h1)
			Memory[W0_addr] <= W0_data;
	assign R0_data = (R0_en ? Memory[R0_addr] : 117'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
endmodule
