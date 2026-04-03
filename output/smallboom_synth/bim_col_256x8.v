module bim_col_256x8 (
	RW0_addr,
	RW0_en,
	RW0_clk,
	RW0_wmode,
	RW0_wdata,
	RW0_rdata,
	RW0_wmask
);
	input [7:0] RW0_addr;
	input RW0_en;
	input RW0_clk;
	input RW0_wmode;
	input [7:0] RW0_wdata;
	output wire [7:0] RW0_rdata;
	input [3:0] RW0_wmask;
	reg [7:0] Memory [0:255];
	reg [7:0] _RW0_raddr_d0;
	reg _RW0_ren_d0;
	reg _RW0_rmode_d0;
	always @(posedge RW0_clk) begin
		_RW0_raddr_d0 <= RW0_addr;
		_RW0_ren_d0 <= RW0_en;
		_RW0_rmode_d0 <= RW0_wmode;
		if ((RW0_en & RW0_wmask[0]) & RW0_wmode)
			Memory[RW0_addr][32'h00000000+:2] <= RW0_wdata[1:0];
		if ((RW0_en & RW0_wmask[1]) & RW0_wmode)
			Memory[RW0_addr][32'h00000002+:2] <= RW0_wdata[3:2];
		if ((RW0_en & RW0_wmask[2]) & RW0_wmode)
			Memory[RW0_addr][32'h00000004+:2] <= RW0_wdata[5:4];
		if ((RW0_en & RW0_wmask[3]) & RW0_wmode)
			Memory[RW0_addr][32'h00000006+:2] <= RW0_wdata[7:6];
	end
	assign RW0_rdata = (_RW0_ren_d0 & ~_RW0_rmode_d0 ? Memory[_RW0_raddr_d0] : 8'bxxxxxxxx);
endmodule
