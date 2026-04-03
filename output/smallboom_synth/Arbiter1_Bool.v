module Arbiter1_Bool (
	io_in_0_ready,
	io_out_ready
);
	output wire io_in_0_ready;
	input io_out_ready;
	assign io_in_0_ready = io_out_ready;
endmodule
