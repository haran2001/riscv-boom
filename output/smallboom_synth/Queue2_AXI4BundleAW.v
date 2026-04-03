module Queue2_AXI4BundleAW (
	clock,
	reset,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits_id,
	io_enq_bits_addr,
	io_enq_bits_len,
	io_enq_bits_size,
	io_enq_bits_burst,
	io_enq_bits_lock,
	io_enq_bits_cache,
	io_enq_bits_prot,
	io_enq_bits_qos,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits_id,
	io_deq_bits_addr,
	io_deq_bits_len,
	io_deq_bits_size,
	io_deq_bits_burst,
	io_deq_bits_lock,
	io_deq_bits_cache,
	io_deq_bits_prot,
	io_deq_bits_qos
);
	input clock;
	input reset;
	output wire io_enq_ready;
	input io_enq_valid;
	input [3:0] io_enq_bits_id;
	input [30:0] io_enq_bits_addr;
	input [7:0] io_enq_bits_len;
	input [2:0] io_enq_bits_size;
	input [1:0] io_enq_bits_burst;
	input io_enq_bits_lock;
	input [3:0] io_enq_bits_cache;
	input [2:0] io_enq_bits_prot;
	input [3:0] io_enq_bits_qos;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire [3:0] io_deq_bits_id;
	output wire [30:0] io_deq_bits_addr;
	output wire [7:0] io_deq_bits_len;
	output wire [2:0] io_deq_bits_size;
	output wire [1:0] io_deq_bits_burst;
	output wire io_deq_bits_lock;
	output wire [3:0] io_deq_bits_cache;
	output wire [2:0] io_deq_bits_prot;
	output wire [3:0] io_deq_bits_qos;
	wire [59:0] _ram_ext_R0_data;
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
	ram_2x60 ram_ext(
		.R0_addr(wrap_1),
		.R0_en(1'h1),
		.R0_clk(clock),
		.R0_data(_ram_ext_R0_data),
		.W0_addr(wrap),
		.W0_en(do_enq),
		.W0_clk(clock),
		.W0_data({io_enq_bits_qos, io_enq_bits_prot, io_enq_bits_cache, io_enq_bits_lock, io_enq_bits_burst, io_enq_bits_size, io_enq_bits_len, io_enq_bits_addr, io_enq_bits_id})
	);
	assign io_enq_ready = ~full;
	assign io_deq_valid = ~empty;
	assign io_deq_bits_id = _ram_ext_R0_data[3:0];
	assign io_deq_bits_addr = _ram_ext_R0_data[34:4];
	assign io_deq_bits_len = _ram_ext_R0_data[42:35];
	assign io_deq_bits_size = _ram_ext_R0_data[45:43];
	assign io_deq_bits_burst = _ram_ext_R0_data[47:46];
	assign io_deq_bits_lock = _ram_ext_R0_data[48];
	assign io_deq_bits_cache = _ram_ext_R0_data[52:49];
	assign io_deq_bits_prot = _ram_ext_R0_data[55:53];
	assign io_deq_bits_qos = _ram_ext_R0_data[59:56];
endmodule
