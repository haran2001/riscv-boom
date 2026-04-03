module Queue1_RegMapperInput_i23_m8 (
	clock,
	reset,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits_read,
	io_enq_bits_index,
	io_enq_bits_data,
	io_enq_bits_mask,
	io_enq_bits_extra_tlrr_extra_source,
	io_enq_bits_extra_tlrr_extra_size,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits_read,
	io_deq_bits_index,
	io_deq_bits_data,
	io_deq_bits_mask,
	io_deq_bits_extra_tlrr_extra_source,
	io_deq_bits_extra_tlrr_extra_size
);
	input clock;
	input reset;
	output wire io_enq_ready;
	input io_enq_valid;
	input io_enq_bits_read;
	input [22:0] io_enq_bits_index;
	input [63:0] io_enq_bits_data;
	input [7:0] io_enq_bits_mask;
	input [8:0] io_enq_bits_extra_tlrr_extra_source;
	input [1:0] io_enq_bits_extra_tlrr_extra_size;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire io_deq_bits_read;
	output wire [22:0] io_deq_bits_index;
	output wire [63:0] io_deq_bits_data;
	output wire [7:0] io_deq_bits_mask;
	output wire [8:0] io_deq_bits_extra_tlrr_extra_source;
	output wire [1:0] io_deq_bits_extra_tlrr_extra_size;
	reg [106:0] ram;
	reg full;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg do_enq;
		do_enq = ~full & io_enq_valid;
		if (do_enq)
			ram <= {io_enq_bits_extra_tlrr_extra_size, io_enq_bits_extra_tlrr_extra_source, io_enq_bits_mask, io_enq_bits_data, io_enq_bits_index, io_enq_bits_read};
		if (reset)
			full <= 1'h0;
		else if (~(do_enq == (io_deq_ready & full)))
			full <= do_enq;
	end
	assign io_enq_ready = ~full;
	assign io_deq_valid = full;
	assign io_deq_bits_read = ram[0];
	assign io_deq_bits_index = ram[23:1];
	assign io_deq_bits_data = ram[87:24];
	assign io_deq_bits_mask = ram[95:88];
	assign io_deq_bits_extra_tlrr_extra_source = ram[104:96];
	assign io_deq_bits_extra_tlrr_extra_size = ram[106:105];
endmodule
