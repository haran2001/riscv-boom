module Queue1_AXI4BundleW (
	clock,
	reset,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits_data,
	io_enq_bits_strb,
	io_enq_bits_last,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits_data,
	io_deq_bits_strb,
	io_deq_bits_last
);
	input clock;
	input reset;
	output wire io_enq_ready;
	input io_enq_valid;
	input [63:0] io_enq_bits_data;
	input [7:0] io_enq_bits_strb;
	input io_enq_bits_last;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire [63:0] io_deq_bits_data;
	output wire [7:0] io_deq_bits_strb;
	output wire io_deq_bits_last;
	reg [72:0] ram;
	reg full;
	wire io_deq_valid_0 = io_enq_valid | full;
	wire do_enq = (~(~full & io_deq_ready) & ~full) & io_enq_valid;
	always @(posedge clock) begin
		if (do_enq)
			ram <= {io_enq_bits_last, io_enq_bits_strb, io_enq_bits_data};
		if (reset)
			full <= 1'h0;
		else if (~(do_enq == ((full & io_deq_ready) & io_deq_valid_0)))
			full <= do_enq;
	end
	assign io_enq_ready = ~full;
	assign io_deq_valid = io_deq_valid_0;
	assign io_deq_bits_data = (full ? ram[63:0] : io_enq_bits_data);
	assign io_deq_bits_strb = (full ? ram[71:64] : io_enq_bits_strb);
	assign io_deq_bits_last = (full ? ram[72] : io_enq_bits_last);
endmodule
