module PLICFanIn (
	io_prio_0,
	io_prio_1,
	io_ip,
	io_dev,
	io_max
);
	input [1:0] io_prio_0;
	input [1:0] io_prio_1;
	input [1:0] io_ip;
	output wire [1:0] io_dev;
	output wire [1:0] io_max;
	wire [2:0] effectivePriority_1 = {io_ip[0], io_prio_0};
	wire _left_T = effectivePriority_1 < 3'h5;
	wire [2:0] left_1 = (_left_T ? 3'h4 : effectivePriority_1);
	wire _GEN = left_1 >= {io_ip[1], io_prio_1};
	assign io_dev = (_GEN ? {1'h0, ~_left_T} : 2'h2);
	assign io_max = (_GEN ? left_1[1:0] : io_prio_1);
endmodule
