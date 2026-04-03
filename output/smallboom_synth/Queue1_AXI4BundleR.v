module Queue1_AXI4BundleR (
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
	input io_enq_bits_id;
	input [63:0] io_enq_bits_data;
	input [1:0] io_enq_bits_resp;
	input io_enq_bits_last;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire io_deq_bits_id;
	output wire [63:0] io_deq_bits_data;
	output wire [1:0] io_deq_bits_resp;
	output wire io_deq_bits_last;
	reg [67:0] ram;
	reg full;
	wire io_deq_valid_0 = io_enq_valid | full;
	wire do_enq = (~(~full & io_deq_ready) & ~full) & io_enq_valid;
	always @(posedge clock) begin
		if (do_enq)
			ram <= {io_enq_bits_last, io_enq_bits_resp, io_enq_bits_data, io_enq_bits_id};
		if (reset)
			full <= 1'h0;
		else if (~(do_enq == ((full & io_deq_ready) & io_deq_valid_0)))
			full <= do_enq;
	end
	assign io_enq_ready = ~full;
	assign io_deq_valid = io_deq_valid_0;
	assign io_deq_bits_id = (full ? ram[0] : io_enq_bits_id);
	assign io_deq_bits_data = (full ? ram[64:1] : io_enq_bits_data);
	assign io_deq_bits_resp = (full ? ram[66:65] : io_enq_bits_resp);
	assign io_deq_bits_last = (full ? ram[67] : io_enq_bits_last);
endmodule
