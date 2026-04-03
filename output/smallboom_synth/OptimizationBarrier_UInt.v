module OptimizationBarrier_UInt (
	io_x,
	io_y
);
	input [2:0] io_x;
	output wire [2:0] io_y;
	assign io_y = io_x;
endmodule
