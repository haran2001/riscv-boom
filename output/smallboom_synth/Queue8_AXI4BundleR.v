module Queue8_AXI4BundleR (
	clock,
	reset,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits_id,
	io_enq_bits_data,
	io_enq_bits_resp,
	io_enq_bits_echo_tl_state_size,
	io_enq_bits_echo_tl_state_source,
	io_enq_bits_last,
	io_deq_ready,
	io_deq_bits_id,
	io_deq_bits_data,
	io_deq_bits_resp,
	io_deq_bits_echo_tl_state_size,
	io_deq_bits_echo_tl_state_source,
	io_deq_bits_last
);
	input clock;
	input reset;
	output wire io_enq_ready;
	input io_enq_valid;
	input [3:0] io_enq_bits_id;
	input [63:0] io_enq_bits_data;
	input [1:0] io_enq_bits_resp;
	input [3:0] io_enq_bits_echo_tl_state_size;
	input [4:0] io_enq_bits_echo_tl_state_source;
	input io_enq_bits_last;
	input io_deq_ready;
	output wire [3:0] io_deq_bits_id;
	output wire [63:0] io_deq_bits_data;
	output wire [1:0] io_deq_bits_resp;
	output wire [3:0] io_deq_bits_echo_tl_state_size;
	output wire [4:0] io_deq_bits_echo_tl_state_source;
	output wire io_deq_bits_last;
	wire [79:0] _ram_ext_R0_data;
	reg [2:0] enq_ptr_value;
	reg [2:0] deq_ptr_value;
	reg maybe_full;
	wire ptr_match = enq_ptr_value == deq_ptr_value;
	wire full = ptr_match & maybe_full;
	wire do_enq = ~full & io_enq_valid;
	always @(posedge clock)
		if (reset) begin
			enq_ptr_value <= 3'h0;
			deq_ptr_value <= 3'h0;
			maybe_full <= 1'h0;
		end
		else begin : sv2v_autoblock_1
			reg do_deq;
			do_deq = io_deq_ready & ~(ptr_match & ~maybe_full);
			if (do_enq)
				enq_ptr_value <= enq_ptr_value + 3'h1;
			if (do_deq)
				deq_ptr_value <= deq_ptr_value + 3'h1;
			if (~(do_enq == do_deq))
				maybe_full <= do_enq;
		end
	ram_8x80 ram_ext(
		.R0_addr(deq_ptr_value),
		.R0_en(1'h1),
		.R0_clk(clock),
		.R0_data(_ram_ext_R0_data),
		.W0_addr(enq_ptr_value),
		.W0_en(do_enq),
		.W0_clk(clock),
		.W0_data({io_enq_bits_last, io_enq_bits_echo_tl_state_source, io_enq_bits_echo_tl_state_size, io_enq_bits_resp, io_enq_bits_data, io_enq_bits_id})
	);
	assign io_enq_ready = ~full;
	assign io_deq_bits_id = _ram_ext_R0_data[3:0];
	assign io_deq_bits_data = _ram_ext_R0_data[67:4];
	assign io_deq_bits_resp = _ram_ext_R0_data[69:68];
	assign io_deq_bits_echo_tl_state_size = _ram_ext_R0_data[73:70];
	assign io_deq_bits_echo_tl_state_source = _ram_ext_R0_data[78:74];
	assign io_deq_bits_last = _ram_ext_R0_data[79];
endmodule
