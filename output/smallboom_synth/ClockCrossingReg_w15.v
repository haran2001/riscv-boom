module ClockCrossingReg_w15 (
	clock,
	io_d,
	io_q,
	io_en
);
	input clock;
	input [14:0] io_d;
	output wire [14:0] io_q;
	input io_en;
	reg [14:0] cdc_reg;
	always @(posedge clock)
		if (io_en)
			cdc_reg <= io_d;
	assign io_q = cdc_reg;
endmodule
