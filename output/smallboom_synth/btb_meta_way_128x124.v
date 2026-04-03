module btb_meta_way_128x124 (
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
	output wire [123:0] R0_data;
	input [6:0] W0_addr;
	input W0_en;
	input W0_clk;
	input [123:0] W0_data;
	input [3:0] W0_mask;
	reg [123:0] Memory [0:127];
	reg _R0_en_d0;
	reg [6:0] _R0_addr_d0;
	always @(posedge R0_clk) begin
		_R0_en_d0 <= R0_en;
		_R0_addr_d0 <= R0_addr;
	end
	always @(posedge W0_clk) begin
		if (W0_en & W0_mask[0])
			Memory[W0_addr][32'h00000000+:31] <= W0_data[30:0];
		if (W0_en & W0_mask[1])
			Memory[W0_addr][32'h0000001f+:31] <= W0_data[61:31];
		if (W0_en & W0_mask[2])
			Memory[W0_addr][32'h0000003e+:31] <= W0_data[92:62];
		if (W0_en & W0_mask[3])
			Memory[W0_addr][32'h0000005d+:31] <= W0_data[123:93];
	end
	assign R0_data = (_R0_en_d0 ? Memory[_R0_addr_d0] : 124'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
endmodule
