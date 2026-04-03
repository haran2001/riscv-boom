module OptimizationBarrier_TLBEntryData (
	io_x_ppn,
	io_x_u,
	io_x_ae_ptw,
	io_x_ae_final,
	io_x_pf,
	io_x_gf,
	io_x_sx,
	io_x_px,
	io_y_ppn,
	io_y_u,
	io_y_ae_ptw,
	io_y_ae_final,
	io_y_pf,
	io_y_gf,
	io_y_sx,
	io_y_px
);
	input [19:0] io_x_ppn;
	input io_x_u;
	input io_x_ae_ptw;
	input io_x_ae_final;
	input io_x_pf;
	input io_x_gf;
	input io_x_sx;
	input io_x_px;
	output wire [19:0] io_y_ppn;
	output wire io_y_u;
	output wire io_y_ae_ptw;
	output wire io_y_ae_final;
	output wire io_y_pf;
	output wire io_y_gf;
	output wire io_y_sx;
	output wire io_y_px;
	assign io_y_ppn = io_x_ppn;
	assign io_y_u = io_x_u;
	assign io_y_ae_ptw = io_x_ae_ptw;
	assign io_y_ae_final = io_x_ae_final;
	assign io_y_pf = io_x_pf;
	assign io_y_gf = io_x_gf;
	assign io_y_sx = io_x_sx;
	assign io_y_px = io_x_px;
endmodule
