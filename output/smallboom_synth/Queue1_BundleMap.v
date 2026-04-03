module Queue1_BundleMap (
	clock,
	reset,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits_tl_state_size,
	io_enq_bits_tl_state_source,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits_tl_state_size,
	io_deq_bits_tl_state_source
);
	input clock;
	input reset;
	output wire io_enq_ready;
	input io_enq_valid;
	input [3:0] io_enq_bits_tl_state_size;
	input [4:0] io_enq_bits_tl_state_source;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire [3:0] io_deq_bits_tl_state_size;
	output wire [4:0] io_deq_bits_tl_state_source;
	reg [8:0] ram;
	reg full;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg do_enq;
		do_enq = ~full & io_enq_valid;
		if (do_enq)
			ram <= {io_enq_bits_tl_state_source, io_enq_bits_tl_state_size};
		if (reset)
			full <= 1'h0;
		else if (~(do_enq == (io_deq_ready & full)))
			full <= do_enq;
	end
	assign io_enq_ready = ~full;
	assign io_deq_valid = full;
	assign io_deq_bits_tl_state_size = ram[3:0];
	assign io_deq_bits_tl_state_source = ram[8:4];
endmodule
