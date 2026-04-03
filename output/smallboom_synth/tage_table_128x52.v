module tage_table_128x52 (
	R0_addr,
	R0_en,
	R0_clk,
	R0_data,
	W0_addr,
	W0_en,
	W0_clk,
	W0_data,
	W0_mask
);
	input [6:0] R0_addr;
	input R0_en;
	input R0_clk;
	output wire [51:0] R0_data;
	input [6:0] W0_addr;
	input W0_en;
	input W0_clk;
	input [51:0] W0_data;
	input [3:0] W0_mask;
	reg [51:0] Memory [0:127];
	reg _R0_en_d0;
	reg [6:0] _R0_addr_d0;
	always @(posedge R0_clk) begin
		_R0_en_d0 <= R0_en;
		_R0_addr_d0 <= R0_addr;
	end
	always @(posedge W0_clk) begin
		if (W0_en & W0_mask[0])
			Memory[W0_addr][32'h00000000+:13] <= W0_data[12:0];
		if (W0_en & W0_mask[1])
			Memory[W0_addr][32'h0000000d+:13] <= W0_data[25:13];
		if (W0_en & W0_mask[2])
			Memory[W0_addr][32'h0000001a+:13] <= W0_data[38:26];
		if (W0_en & W0_mask[3])
			Memory[W0_addr][32'h00000027+:13] <= W0_data[51:39];
	end
	assign R0_data = (_R0_en_d0 ? Memory[_R0_addr_d0] : 52'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
endmodule
