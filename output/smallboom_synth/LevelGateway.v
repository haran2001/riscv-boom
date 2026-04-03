module LevelGateway (
	clock,
	reset,
	io_interrupt,
	io_plic_valid,
	io_plic_ready,
	io_plic_complete
);
	input clock;
	input reset;
	input io_interrupt;
	output wire io_plic_valid;
	input io_plic_ready;
	input io_plic_complete;
	reg inFlight;
	always @(posedge clock)
		if (reset)
			inFlight <= 1'h0;
		else
			inFlight <= ~io_plic_complete & ((io_interrupt & io_plic_ready) | inFlight);
	assign io_plic_valid = io_interrupt & ~inFlight;
endmodule
