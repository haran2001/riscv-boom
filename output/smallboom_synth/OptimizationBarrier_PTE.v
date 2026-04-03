module OptimizationBarrier_PTE (
	io_x_ppn,
	io_x_d,
	io_x_a,
	io_x_g,
	io_x_u,
	io_x_x,
	io_x_w,
	io_x_r,
	io_x_v,
	io_y_ppn,
	io_y_d,
	io_y_a,
	io_y_g,
	io_y_u,
	io_y_x,
	io_y_w,
	io_y_r,
	io_y_v
);
	input [43:0] io_x_ppn;
	input io_x_d;
	input io_x_a;
	input io_x_g;
	input io_x_u;
	input io_x_x;
	input io_x_w;
	input io_x_r;
	input io_x_v;
	output wire [43:0] io_y_ppn;
	output wire io_y_d;
	output wire io_y_a;
	output wire io_y_g;
	output wire io_y_u;
	output wire io_y_x;
	output wire io_y_w;
	output wire io_y_r;
	output wire io_y_v;
	assign io_y_ppn = io_x_ppn;
	assign io_y_d = io_x_d;
	assign io_y_a = io_x_a;
	assign io_y_g = io_x_g;
	assign io_y_u = io_x_u;
	assign io_y_x = io_x_x;
	assign io_y_w = io_x_w;
	assign io_y_r = io_x_r;
	assign io_y_v = io_x_v;
endmodule
