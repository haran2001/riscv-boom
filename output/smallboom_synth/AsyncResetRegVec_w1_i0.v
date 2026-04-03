module AsyncResetRegVec_w1_i0 (
	clock,
	reset,
	io_d,
	io_q
);
	input clock;
	input reset;
	input io_d;
	output wire io_q;
	reg reg_0;
	always @(posedge clock or posedge reset)
		if (reset)
			reg_0 <= 1'h0;
		else
			reg_0 <= io_d;
	assign io_q = reg_0;
endmodule
