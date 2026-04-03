module Queue1_TLBundleA_a14d64s5k1z4u (
	clock,
	reset,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits_opcode,
	io_enq_bits_param,
	io_enq_bits_size,
	io_enq_bits_source,
	io_enq_bits_address,
	io_enq_bits_mask,
	io_enq_bits_data,
	io_enq_bits_corrupt,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits_opcode,
	io_deq_bits_size,
	io_deq_bits_source
);
	input clock;
	input reset;
	output wire io_enq_ready;
	input io_enq_valid;
	input [2:0] io_enq_bits_opcode;
	input [2:0] io_enq_bits_param;
	input [3:0] io_enq_bits_size;
	input [4:0] io_enq_bits_source;
	input [13:0] io_enq_bits_address;
	input [7:0] io_enq_bits_mask;
	input [63:0] io_enq_bits_data;
	input io_enq_bits_corrupt;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire [2:0] io_deq_bits_opcode;
	output wire [3:0] io_deq_bits_size;
	output wire [4:0] io_deq_bits_source;
	reg [101:0] ram;
	reg full;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg do_enq;
		do_enq = ~full & io_enq_valid;
		if (do_enq)
			ram <= {io_enq_bits_corrupt, io_enq_bits_data, io_enq_bits_mask, io_enq_bits_address, io_enq_bits_source, io_enq_bits_size, io_enq_bits_param, io_enq_bits_opcode};
		if (reset)
			full <= 1'h0;
		else if (~(do_enq == (io_deq_ready & full)))
			full <= do_enq;
	end
	assign io_enq_ready = ~full;
	assign io_deq_valid = full;
	assign io_deq_bits_opcode = ram[2:0];
	assign io_deq_bits_size = ram[9:6];
	assign io_deq_bits_source = ram[14:10];
endmodule
