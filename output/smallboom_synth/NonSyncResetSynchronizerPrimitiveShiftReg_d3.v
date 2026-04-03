module NonSyncResetSynchronizerPrimitiveShiftReg_d3 (
	clock,
	io_d,
	io_q
);
	input clock;
	input io_d;
	output wire io_q;
	reg sync_0;
	reg sync_1;
	reg sync_2;
	always @(posedge clock) begin
		sync_0 <= sync_1;
		sync_1 <= sync_2;
		sync_2 <= io_d;
	end
	assign io_q = sync_0;
endmodule
