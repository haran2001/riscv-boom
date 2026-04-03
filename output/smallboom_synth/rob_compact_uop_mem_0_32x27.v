module rob_compact_uop_mem_0_32x27 (
	R0_addr,
	R0_en,
	R0_clk,
	R0_data,
	W0_addr,
	W0_en,
	W0_clk,
	W0_data
);
	input [4:0] R0_addr;
	input R0_en;
	input R0_clk;
	output wire [26:0] R0_data;
	input [4:0] W0_addr;
	input W0_en;
	input W0_clk;
	input [26:0] W0_data;
	reg [26:0] Memory [0:31];
	reg _R0_en_d0;
	reg [4:0] _R0_addr_d0;
	always @(posedge R0_clk) begin
		_R0_en_d0 <= R0_en;
		_R0_addr_d0 <= R0_addr;
	end
	always @(posedge W0_clk)
		if (W0_en & 1'h1)
			Memory[W0_addr] <= W0_data;
	assign R0_data = (_R0_en_d0 ? Memory[_R0_addr_d0] : 27'bxxxxxxxxxxxxxxxxxxxxxxxxxxx);
endmodule
