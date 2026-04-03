module tag_array_64x88 (
	RW0_addr,
	RW0_en,
	RW0_clk,
	RW0_wmode,
	RW0_wdata,
	RW0_rdata,
	RW0_wmask
);
	input [5:0] RW0_addr;
	input RW0_en;
	input RW0_clk;
	input RW0_wmode;
	input [87:0] RW0_wdata;
	output wire [87:0] RW0_rdata;
	input [3:0] RW0_wmask;
	reg [87:0] Memory [0:63];
	reg [5:0] _RW0_raddr_d0;
	reg _RW0_ren_d0;
	reg _RW0_rmode_d0;
	always @(posedge RW0_clk) begin
		_RW0_raddr_d0 <= RW0_addr;
		_RW0_ren_d0 <= RW0_en;
		_RW0_rmode_d0 <= RW0_wmode;
		if ((RW0_en & RW0_wmask[0]) & RW0_wmode)
			Memory[RW0_addr][32'h00000000+:22] <= RW0_wdata[21:0];
		if ((RW0_en & RW0_wmask[1]) & RW0_wmode)
			Memory[RW0_addr][32'h00000016+:22] <= RW0_wdata[43:22];
		if ((RW0_en & RW0_wmask[2]) & RW0_wmode)
			Memory[RW0_addr][32'h0000002c+:22] <= RW0_wdata[65:44];
		if ((RW0_en & RW0_wmask[3]) & RW0_wmode)
			Memory[RW0_addr][32'h00000042+:22] <= RW0_wdata[87:66];
	end
	assign RW0_rdata = (_RW0_ren_d0 & ~_RW0_rmode_d0 ? Memory[_RW0_raddr_d0] : 88'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
endmodule
