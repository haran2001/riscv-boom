module regfile_32x20 (
	R0_addr,
	R0_en,
	R0_clk,
	R0_data,
	R1_addr,
	R1_en,
	R1_clk,
	R1_data,
	R2_addr,
	R2_en,
	R2_clk,
	R2_data,
	W0_addr,
	W0_en,
	W0_clk,
	W0_data
);
	input [4:0] R0_addr;
	input R0_en;
	input R0_clk;
	output wire [19:0] R0_data;
	input [4:0] R1_addr;
	input R1_en;
	input R1_clk;
	output wire [19:0] R1_data;
	input [4:0] R2_addr;
	input R2_en;
	input R2_clk;
	output wire [19:0] R2_data;
	input [4:0] W0_addr;
	input W0_en;
	input W0_clk;
	input [19:0] W0_data;
	reg [19:0] Memory [0:31];
	always @(posedge W0_clk)
		if (W0_en & 1'h1)
			Memory[W0_addr] <= W0_data;
	assign R0_data = (R0_en ? Memory[R0_addr] : 20'bxxxxxxxxxxxxxxxxxxxx);
	assign R1_data = (R1_en ? Memory[R1_addr] : 20'bxxxxxxxxxxxxxxxxxxxx);
	assign R2_data = (R2_en ? Memory[R2_addr] : 20'bxxxxxxxxxxxxxxxxxxxx);
endmodule
