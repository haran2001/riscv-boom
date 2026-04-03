module Queue2_AXI4BundleR (
	clock,
	reset,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits_id,
	io_enq_bits_data,
	io_enq_bits_resp,
	io_enq_bits_last,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits_id,
	io_deq_bits_data,
	io_deq_bits_resp,
	io_deq_bits_last
);
	input clock;
	input reset;
	output wire io_enq_ready;
	input io_enq_valid;
	input [3:0] io_enq_bits_id;
	input [63:0] io_enq_bits_data;
	input [1:0] io_enq_bits_resp;
	input io_enq_bits_last;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire [3:0] io_deq_bits_id;
	output wire [63:0] io_deq_bits_data;
	output wire [1:0] io_deq_bits_resp;
	output wire io_deq_bits_last;
	wire [70:0] _ram_ext_R0_data;
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
	ram_2x71 ram_ext(
		.R0_addr(wrap_1),
		.R0_en(1'h1),
		.R0_clk(clock),
		.R0_data(_ram_ext_R0_data),
		.W0_addr(wrap),
		.W0_en(do_enq),
		.W0_clk(clock),
		.W0_data({io_enq_bits_last, io_enq_bits_resp, io_enq_bits_data, io_enq_bits_id})
	);
	assign io_enq_ready = ~full;
	assign io_deq_valid = ~empty;
	assign io_deq_bits_id = _ram_ext_R0_data[3:0];
	assign io_deq_bits_data = _ram_ext_R0_data[67:4];
	assign io_deq_bits_resp = _ram_ext_R0_data[69:68];
	assign io_deq_bits_last = _ram_ext_R0_data[70];
endmodule
