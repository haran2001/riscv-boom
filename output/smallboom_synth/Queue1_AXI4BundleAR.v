module Queue1_AXI4BundleAR (
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
	io_enq_bits_echo_extra_id,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits_id,
	io_deq_bits_addr,
	io_deq_bits_len,
	io_deq_bits_size,
	io_deq_bits_burst,
	io_deq_bits_cache,
	io_deq_bits_prot,
	io_deq_bits_echo_extra_id
);
	input clock;
	input reset;
	output wire io_enq_ready;
	input io_enq_valid;
	input io_enq_bits_id;
	input [31:0] io_enq_bits_addr;
	input [7:0] io_enq_bits_len;
	input [2:0] io_enq_bits_size;
	input [1:0] io_enq_bits_burst;
	input io_enq_bits_lock;
	input [3:0] io_enq_bits_cache;
	input [2:0] io_enq_bits_prot;
	input [3:0] io_enq_bits_qos;
	input [6:0] io_enq_bits_echo_extra_id;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire io_deq_bits_id;
	output wire [31:0] io_deq_bits_addr;
	output wire [7:0] io_deq_bits_len;
	output wire [2:0] io_deq_bits_size;
	output wire [1:0] io_deq_bits_burst;
	output wire [3:0] io_deq_bits_cache;
	output wire [2:0] io_deq_bits_prot;
	output wire [6:0] io_deq_bits_echo_extra_id;
	reg [64:0] ram;
	reg full;
	wire io_deq_valid_0 = io_enq_valid | full;
	wire do_enq = (~(~full & io_deq_ready) & ~full) & io_enq_valid;
	always @(posedge clock) begin
		if (do_enq)
			ram <= {io_enq_bits_echo_extra_id, io_enq_bits_qos, io_enq_bits_prot, io_enq_bits_cache, io_enq_bits_lock, io_enq_bits_burst, io_enq_bits_size, io_enq_bits_len, io_enq_bits_addr, io_enq_bits_id};
		if (reset)
			full <= 1'h0;
		else if (~(do_enq == ((full & io_deq_ready) & io_deq_valid_0)))
			full <= do_enq;
	end
	assign io_enq_ready = ~full;
	assign io_deq_valid = io_deq_valid_0;
	assign io_deq_bits_id = (full ? ram[0] : io_enq_bits_id);
	assign io_deq_bits_addr = (full ? ram[32:1] : io_enq_bits_addr);
	assign io_deq_bits_len = (full ? ram[40:33] : io_enq_bits_len);
	assign io_deq_bits_size = (full ? ram[43:41] : io_enq_bits_size);
	assign io_deq_bits_burst = (full ? ram[45:44] : io_enq_bits_burst);
	assign io_deq_bits_cache = (full ? ram[50:47] : io_enq_bits_cache);
	assign io_deq_bits_prot = (full ? ram[53:51] : io_enq_bits_prot);
	assign io_deq_bits_echo_extra_id = (full ? ram[64:58] : io_enq_bits_echo_extra_id);
endmodule
