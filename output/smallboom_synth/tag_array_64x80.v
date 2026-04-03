module tag_array_64x80 (
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
	input [79:0] RW0_wdata;
	output wire [79:0] RW0_rdata;
	input [3:0] RW0_wmask;
	reg [79:0] Memory [0:63];
	reg [5:0] _RW0_raddr_d0;
	reg _RW0_ren_d0;
	reg _RW0_rmode_d0;
	always @(posedge RW0_clk) begin
		_RW0_raddr_d0 <= RW0_addr;
		_RW0_ren_d0 <= RW0_en;
		_RW0_rmode_d0 <= RW0_wmode;
		if ((RW0_en & RW0_wmask[0]) & RW0_wmode)
			Memory[RW0_addr][32'h00000000+:20] <= RW0_wdata[19:0];
		if ((RW0_en & RW0_wmask[1]) & RW0_wmode)
			Memory[RW0_addr][32'h00000014+:20] <= RW0_wdata[39:20];
		if ((RW0_en & RW0_wmask[2]) & RW0_wmode)
			Memory[RW0_addr][32'h00000028+:20] <= RW0_wdata[59:40];
		if ((RW0_en & RW0_wmask[3]) & RW0_wmode)
			Memory[RW0_addr][32'h0000003c+:20] <= RW0_wdata[79:60];
	end
	assign RW0_rdata = (_RW0_ren_d0 & ~_RW0_rmode_d0 ? Memory[_RW0_raddr_d0] : 80'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
endmodule
