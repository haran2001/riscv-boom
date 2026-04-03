module SynchronizerShiftReg_w2_d3 (
	clock,
	io_d,
	io_q
);
	input clock;
	input [1:0] io_d;
	output wire [1:0] io_q;
	wire _output_chain_1_io_q;
	wire _output_chain_io_q;
	NonSyncResetSynchronizerPrimitiveShiftReg_d3 output_chain(
		.clock(clock),
		.io_d(io_d[0]),
		.io_q(_output_chain_io_q)
	);
	NonSyncResetSynchronizerPrimitiveShiftReg_d3 output_chain_1(
		.clock(clock),
		.io_d(io_d[1]),
		.io_q(_output_chain_1_io_q)
	);
	assign io_q = {_output_chain_1_io_q, _output_chain_io_q};
endmodule
