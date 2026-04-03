module AsyncResetSynchronizerPrimitiveShiftReg_d3_i0 (
	clock,
	reset,
	io_d,
	io_q
);
	input clock;
	input reset;
	input io_d;
	output wire io_q;
	reg sync_0;
	reg sync_1;
	reg sync_2;
	always @(posedge clock or posedge reset)
		if (reset) begin
			sync_0 <= 1'h0;
			sync_1 <= 1'h0;
			sync_2 <= 1'h0;
		end
		else begin
			sync_0 <= sync_1;
			sync_1 <= sync_2;
			sync_2 <= io_d;
		end
	assign io_q = sync_0;
endmodule
