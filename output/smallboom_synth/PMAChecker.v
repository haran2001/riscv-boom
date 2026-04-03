module PMAChecker (
	io_paddr,
	io_resp_cacheable,
	io_resp_r,
	io_resp_w,
	io_resp_pp,
	io_resp_al,
	io_resp_aa,
	io_resp_x,
	io_resp_eff
);
	input [39:0] io_paddr;
	output wire io_resp_cacheable;
	output wire io_resp_r;
	output wire io_resp_w;
	output wire io_resp_pp;
	output wire io_resp_al;
	output wire io_resp_aa;
	output wire io_resp_x;
	output wire io_resp_eff;
	wire [9:0] _GEN = io_paddr[25:16] ^ 10'h200;
	wire [3:0] _GEN_0 = io_paddr[31:28] ^ 4'h8;
	wire legal_address = ((((((io_paddr[39:12] == 28'h0000000) | ({io_paddr[39:14], ~io_paddr[13:12]} == 28'h0000000)) | ({io_paddr[39:17], ~io_paddr[16]} == 24'h000000)) | ({io_paddr[39:26], _GEN} == 24'h000000)) | ({io_paddr[39:28], ~io_paddr[27:26]} == 14'h0000)) | ({io_paddr[39:31], ~io_paddr[30:29]} == 11'h000)) | ({io_paddr[39:32], _GEN_0} == 12'h000);
	wire [3:0] _GEN_1 = {io_paddr[31:30], io_paddr[27], io_paddr[16]};
	wire [2:0] _GEN_2 = {io_paddr[31:30], ~io_paddr[27]};
	wire [1:0] _GEN_3 = {io_paddr[31], ~io_paddr[30]};
	assign io_resp_cacheable = legal_address & ~_GEN_0[3];
	assign io_resp_r = legal_address;
	assign io_resp_w = legal_address & (((~(|_GEN_1) | ~(|_GEN_2)) | ~(|_GEN_3)) | ~(|_GEN_0[3:2]));
	assign io_resp_pp = legal_address & (((~(|_GEN_1) | ~(|_GEN_2)) | ~(|_GEN_3)) | ~(|_GEN_0[3:2]));
	assign io_resp_al = legal_address & (~(|_GEN_1) | ~(|_GEN_2));
	assign io_resp_aa = legal_address & (~(|_GEN_1) | ~(|_GEN_2));
	assign io_resp_x = legal_address & ((({io_paddr[31:30], io_paddr[27], io_paddr[25]} == 4'h0) | ~(|_GEN_3)) | ~(|_GEN_0[3:2]));
	assign io_resp_eff = legal_address & (((({io_paddr[31:30], io_paddr[27], io_paddr[25], io_paddr[16], io_paddr[13]} == 6'h00) | ({io_paddr[31:30], io_paddr[27], _GEN[9], io_paddr[16]} == 5'h00)) | ~(|_GEN_2)) | ~(|_GEN_3));
endmodule
