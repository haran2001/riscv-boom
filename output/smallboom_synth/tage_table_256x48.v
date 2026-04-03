module tage_table_256x48 (
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
	input [7:0] R0_addr;
	input R0_en;
	input R0_clk;
	output wire [47:0] R0_data;
	input [7:0] W0_addr;
	input W0_en;
	input W0_clk;
	input [47:0] W0_data;
	input [3:0] W0_mask;
	reg [47:0] Memory [0:255];
	reg _R0_en_d0;
	reg [7:0] _R0_addr_d0;
	always @(posedge R0_clk) begin
		_R0_en_d0 <= R0_en;
		_R0_addr_d0 <= R0_addr;
	end
	always @(posedge W0_clk) begin
		if (W0_en & W0_mask[0])
			Memory[W0_addr][32'h00000000+:12] <= W0_data[11:0];
		if (W0_en & W0_mask[1])
			Memory[W0_addr][32'h0000000c+:12] <= W0_data[23:12];
		if (W0_en & W0_mask[2])
			Memory[W0_addr][32'h00000018+:12] <= W0_data[35:24];
		if (W0_en & W0_mask[3])
			Memory[W0_addr][32'h00000024+:12] <= W0_data[47:36];
	end
	assign R0_data = (_R0_en_d0 ? Memory[_R0_addr_d0] : 48'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
endmodule
