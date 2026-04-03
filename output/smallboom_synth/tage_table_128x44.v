module tage_table_128x44 (
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
	output wire [43:0] R0_data;
	input [6:0] W0_addr;
	input W0_en;
	input W0_clk;
	input [43:0] W0_data;
	input [3:0] W0_mask;
	reg [43:0] Memory [0:127];
	reg _R0_en_d0;
	reg [6:0] _R0_addr_d0;
	always @(posedge R0_clk) begin
		_R0_en_d0 <= R0_en;
		_R0_addr_d0 <= R0_addr;
	end
	always @(posedge W0_clk) begin
		if (W0_en & W0_mask[0])
			Memory[W0_addr][32'h00000000+:11] <= W0_data[10:0];
		if (W0_en & W0_mask[1])
			Memory[W0_addr][32'h0000000b+:11] <= W0_data[21:11];
		if (W0_en & W0_mask[2])
			Memory[W0_addr][32'h00000016+:11] <= W0_data[32:22];
		if (W0_en & W0_mask[3])
			Memory[W0_addr][32'h00000021+:11] <= W0_data[43:33];
	end
	assign R0_data = (_R0_en_d0 ? Memory[_R0_addr_d0] : 44'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
endmodule
