module Queue1_AXI4BundleARW (
	clock,
	reset,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits_id,
	io_enq_bits_addr,
	io_enq_bits_len,
	io_enq_bits_size,
	io_enq_bits_cache,
	io_enq_bits_prot,
	io_enq_bits_echo_tl_state_size,
	io_enq_bits_echo_tl_state_source,
	io_enq_bits_wen,
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
	io_deq_bits_qos,
	io_deq_bits_echo_tl_state_size,
	io_deq_bits_echo_tl_state_source,
	io_deq_bits_wen
);
	input clock;
	input reset;
	output wire io_enq_ready;
	input io_enq_valid;
	input [2:0] io_enq_bits_id;
	input [30:0] io_enq_bits_addr;
	input [7:0] io_enq_bits_len;
	input [2:0] io_enq_bits_size;
	input [3:0] io_enq_bits_cache;
	input [2:0] io_enq_bits_prot;
	input [3:0] io_enq_bits_echo_tl_state_size;
	input [4:0] io_enq_bits_echo_tl_state_source;
	input io_enq_bits_wen;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire [2:0] io_deq_bits_id;
	output wire [30:0] io_deq_bits_addr;
	output wire [7:0] io_deq_bits_len;
	output wire [2:0] io_deq_bits_size;
	output wire [1:0] io_deq_bits_burst;
	output wire io_deq_bits_lock;
	output wire [3:0] io_deq_bits_cache;
	output wire [2:0] io_deq_bits_prot;
	output wire [3:0] io_deq_bits_qos;
	output wire [3:0] io_deq_bits_echo_tl_state_size;
	output wire [4:0] io_deq_bits_echo_tl_state_source;
	output wire io_deq_bits_wen;
	reg [68:0] ram;
	reg full;
	wire io_deq_valid_0 = io_enq_valid | full;
	wire do_enq = (~(~full & io_deq_ready) & ~full) & io_enq_valid;
	always @(posedge clock) begin
		if (do_enq)
			ram <= {io_enq_bits_wen, io_enq_bits_echo_tl_state_source, io_enq_bits_echo_tl_state_size, 4'h0, io_enq_bits_prot, io_enq_bits_cache, 3'h1, io_enq_bits_size, io_enq_bits_len, io_enq_bits_addr, io_enq_bits_id};
		if (reset)
			full <= 1'h0;
		else if (~(do_enq == ((full & io_deq_ready) & io_deq_valid_0)))
			full <= do_enq;
	end
	assign io_enq_ready = ~full;
	assign io_deq_valid = io_deq_valid_0;
	assign io_deq_bits_id = (full ? ram[2:0] : io_enq_bits_id);
	assign io_deq_bits_addr = (full ? ram[33:3] : io_enq_bits_addr);
	assign io_deq_bits_len = (full ? ram[41:34] : io_enq_bits_len);
	assign io_deq_bits_size = (full ? ram[44:42] : io_enq_bits_size);
	assign io_deq_bits_burst = (full ? ram[46:45] : 2'h1);
	assign io_deq_bits_lock = full & ram[47];
	assign io_deq_bits_cache = (full ? ram[51:48] : io_enq_bits_cache);
	assign io_deq_bits_prot = (full ? ram[54:52] : io_enq_bits_prot);
	assign io_deq_bits_qos = (full ? ram[58:55] : 4'h0);
	assign io_deq_bits_echo_tl_state_size = (full ? ram[62:59] : io_enq_bits_echo_tl_state_size);
	assign io_deq_bits_echo_tl_state_source = (full ? ram[67:63] : io_enq_bits_echo_tl_state_source);
	assign io_deq_bits_wen = (full ? ram[68] : io_enq_bits_wen);
endmodule
