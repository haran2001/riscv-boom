module AsyncResetRegVec_w2_i0 (
	clock,
	reset,
	io_d,
	io_q
);
	input clock;
	input reset;
	input [1:0] io_d;
	output wire [1:0] io_q;
	reg [1:0] reg_0;
	always @(posedge clock or posedge reset)
		if (reset)
			reg_0 <= 2'h0;
		else
			reg_0 <= io_d;
	assign io_q = reg_0;
endmodule
