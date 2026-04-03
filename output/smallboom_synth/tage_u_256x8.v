module tage_u_256x8 (
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
	output wire [7:0] R0_data;
	input [7:0] W0_addr;
	input W0_en;
	input W0_clk;
	input [7:0] W0_data;
	input [7:0] W0_mask;
	reg [7:0] Memory [0:255];
	reg _R0_en_d0;
	reg [7:0] _R0_addr_d0;
	always @(posedge R0_clk) begin
		_R0_en_d0 <= R0_en;
		_R0_addr_d0 <= R0_addr;
	end
	always @(posedge W0_clk) begin
		if (W0_en & W0_mask[0])
			Memory[W0_addr][32'h00000000+:1] <= W0_data[0];
		if (W0_en & W0_mask[1])
			Memory[W0_addr][32'h00000001+:1] <= W0_data[1];
		if (W0_en & W0_mask[2])
			Memory[W0_addr][32'h00000002+:1] <= W0_data[2];
		if (W0_en & W0_mask[3])
			Memory[W0_addr][32'h00000003+:1] <= W0_data[3];
		if (W0_en & W0_mask[4])
			Memory[W0_addr][32'h00000004+:1] <= W0_data[4];
		if (W0_en & W0_mask[5])
			Memory[W0_addr][32'h00000005+:1] <= W0_data[5];
		if (W0_en & W0_mask[6])
			Memory[W0_addr][32'h00000006+:1] <= W0_data[6];
		if (W0_en & W0_mask[7])
			Memory[W0_addr][32'h00000007+:1] <= W0_data[7];
	end
	assign R0_data = (_R0_en_d0 ? Memory[_R0_addr_d0] : 8'bxxxxxxxx);
endmodule
