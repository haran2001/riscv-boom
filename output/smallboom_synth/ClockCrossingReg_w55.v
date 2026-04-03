module ClockCrossingReg_w55 (
	clock,
	io_d,
	io_q,
	io_en
);
	input clock;
	input [54:0] io_d;
	output wire [54:0] io_q;
	input io_en;
	reg [54:0] cdc_reg;
	always @(posedge clock)
		if (io_en)
			cdc_reg <= io_d;
	assign io_q = cdc_reg;
endmodule
