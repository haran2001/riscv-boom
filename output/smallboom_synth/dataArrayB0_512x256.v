module dataArrayB0_512x256 (
	RW0_addr,
	RW0_en,
	RW0_clk,
	RW0_wmode,
	RW0_wdata,
	RW0_rdata,
	RW0_wmask
);
	input [8:0] RW0_addr;
	input RW0_en;
	input RW0_clk;
	input RW0_wmode;
	input [255:0] RW0_wdata;
	output wire [255:0] RW0_rdata;
	input [3:0] RW0_wmask;
	reg [255:0] Memory [0:511];
	reg [8:0] _RW0_raddr_d0;
	reg _RW0_ren_d0;
	reg _RW0_rmode_d0;
	always @(posedge RW0_clk) begin
		_RW0_raddr_d0 <= RW0_addr;
		_RW0_ren_d0 <= RW0_en;
		_RW0_rmode_d0 <= RW0_wmode;
		if ((RW0_en & RW0_wmask[0]) & RW0_wmode)
			Memory[RW0_addr][32'h00000000+:64] <= RW0_wdata[63:0];
		if ((RW0_en & RW0_wmask[1]) & RW0_wmode)
			Memory[RW0_addr][32'h00000040+:64] <= RW0_wdata[127:64];
		if ((RW0_en & RW0_wmask[2]) & RW0_wmode)
			Memory[RW0_addr][32'h00000080+:64] <= RW0_wdata[191:128];
		if ((RW0_en & RW0_wmask[3]) & RW0_wmode)
			Memory[RW0_addr][32'h000000c0+:64] <= RW0_wdata[255:192];
	end
	assign RW0_rdata = (_RW0_ren_d0 & ~_RW0_rmode_d0 ? Memory[_RW0_raddr_d0] : 256'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx);
endmodule
