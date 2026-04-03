module OptimizationBarrier_EntryData (
	io_x_ppn,
	io_x_u,
	io_x_ae,
	io_x_sw,
	io_x_sx,
	io_x_sr,
	io_x_pw,
	io_x_pr,
	io_x_pal,
	io_x_paa,
	io_x_eff,
	io_x_c,
	io_y_ppn,
	io_y_u,
	io_y_ae,
	io_y_sw,
	io_y_sx,
	io_y_sr,
	io_y_pw,
	io_y_pr,
	io_y_pal,
	io_y_paa,
	io_y_eff,
	io_y_c
);
	input [19:0] io_x_ppn;
	input io_x_u;
	input io_x_ae;
	input io_x_sw;
	input io_x_sx;
	input io_x_sr;
	input io_x_pw;
	input io_x_pr;
	input io_x_pal;
	input io_x_paa;
	input io_x_eff;
	input io_x_c;
	output wire [19:0] io_y_ppn;
	output wire io_y_u;
	output wire io_y_ae;
	output wire io_y_sw;
	output wire io_y_sx;
	output wire io_y_sr;
	output wire io_y_pw;
	output wire io_y_pr;
	output wire io_y_pal;
	output wire io_y_paa;
	output wire io_y_eff;
	output wire io_y_c;
	assign io_y_ppn = io_x_ppn;
	assign io_y_u = io_x_u;
	assign io_y_ae = io_x_ae;
	assign io_y_sw = io_x_sw;
	assign io_y_sx = io_x_sx;
	assign io_y_sr = io_x_sr;
	assign io_y_pw = io_x_pw;
	assign io_y_pr = io_x_pr;
	assign io_y_pal = io_x_pal;
	assign io_y_paa = io_x_paa;
	assign io_y_eff = io_x_eff;
	assign io_y_c = io_x_c;
endmodule
