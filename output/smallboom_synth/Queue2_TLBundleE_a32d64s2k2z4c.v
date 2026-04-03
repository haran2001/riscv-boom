module Queue2_TLBundleE_a32d64s2k2z4c (
	clock,
	reset,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits_sink,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits_sink
);
	input clock;
	input reset;
	output wire io_enq_ready;
	input io_enq_valid;
	input [1:0] io_enq_bits_sink;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire [1:0] io_deq_bits_sink;
	reg wrap;
	reg wrap_1;
	reg maybe_full;
	wire ptr_match = wrap == wrap_1;
	wire empty = ptr_match & ~maybe_full;
	wire full = ptr_match & maybe_full;
	wire do_enq = ~full & io_enq_valid;
	always @(posedge clock)
		if (reset) begin
			wrap <= 1'h0;
			wrap_1 <= 1'h0;
			maybe_full <= 1'h0;
		end
		else begin : sv2v_autoblock_1
			reg do_deq;
			do_deq = io_deq_ready & ~empty;
			if (do_enq)
				wrap <= wrap - 1'h1;
			if (do_deq)
				wrap_1 <= wrap_1 - 1'h1;
			if (~(do_enq == do_deq))
				maybe_full <= do_enq;
		end
	ram_sink_2x2 ram_sink_ext(
		.R0_addr(wrap_1),
		.R0_en(1'h1),
		.R0_clk(clock),
		.R0_data(io_deq_bits_sink),
		.W0_addr(wrap),
		.W0_en(do_enq),
		.W0_clk(clock),
		.W0_data(io_enq_bits_sink)
	);
	assign io_enq_ready = ~full;
	assign io_deq_valid = ~empty;
endmodule
