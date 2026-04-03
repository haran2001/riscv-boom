module TLMonitor_31 (
	clock,
	reset,
	io_in_a_ready,
	io_in_a_valid,
	io_in_a_bits_opcode,
	io_in_a_bits_address,
	io_in_d_ready,
	io_in_d_valid,
	io_in_d_bits_opcode
);
	input clock;
	input reset;
	input io_in_a_ready;
	input io_in_a_valid;
	input [2:0] io_in_a_bits_opcode;
	input [6:0] io_in_a_bits_address;
	input io_in_d_ready;
	input io_in_d_valid;
	input [2:0] io_in_d_bits_opcode;
	wire [31:0] _plusarg_reader_1_out;
	wire [31:0] _plusarg_reader_out;
	wire a_first_done = io_in_a_ready & io_in_a_valid;
	reg a_first_counter;
	reg [2:0] opcode;
	reg [6:0] address;
	reg d_first_counter;
	reg [2:0] opcode_1;
	reg [1:0] inflight;
	reg [3:0] inflight_opcodes;
	reg [3:0] inflight_sizes;
	reg a_first_counter_1;
	reg d_first_counter_1;
	wire a_set = a_first_done & ~a_first_counter_1;
	wire d_release_ack = io_in_d_bits_opcode == 3'h6;
	reg [31:0] watchdog;
	reg [1:0] inflight_1;
	reg [3:0] inflight_sizes_1;
	reg d_first_counter_2;
	reg [31:0] watchdog_1;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg d_first_done;
		d_first_done = io_in_d_ready & io_in_d_valid;
		if (reset) begin
			a_first_counter <= 1'h0;
			d_first_counter <= 1'h0;
			inflight <= 2'h0;
			inflight_opcodes <= 4'h0;
			inflight_sizes <= 4'h0;
			a_first_counter_1 <= 1'h0;
			d_first_counter_1 <= 1'h0;
			watchdog <= 32'h00000000;
			inflight_1 <= 2'h0;
			inflight_sizes_1 <= 4'h0;
			d_first_counter_2 <= 1'h0;
			watchdog_1 <= 32'h00000000;
		end
		else begin : sv2v_autoblock_2
			reg d_clr;
			reg [3:0] d_sizes_clr;
			reg d_clr_1;
			d_clr = (d_first_done & ~d_first_counter_1) & ~d_release_ack;
			d_sizes_clr = {4 {d_clr}};
			d_clr_1 = (d_first_done & ~d_first_counter_2) & d_release_ack;
			a_first_counter <= (~a_first_done | (a_first_counter - 1'h1)) & a_first_counter;
			d_first_counter <= (~d_first_done | (d_first_counter - 1'h1)) & d_first_counter;
			inflight <= {1'h0, (inflight[0] | a_set) & ~d_clr};
			inflight_opcodes <= (inflight_opcodes | (a_set ? {io_in_a_bits_opcode, 1'h1} : 4'h0)) & ~d_sizes_clr;
			inflight_sizes <= (inflight_sizes | (a_set ? {1'h0, (a_set ? 3'h5 : 3'h0)} : 4'h0)) & ~d_sizes_clr;
			a_first_counter_1 <= (~a_first_done | (a_first_counter_1 - 1'h1)) & a_first_counter_1;
			d_first_counter_1 <= (~d_first_done | (d_first_counter_1 - 1'h1)) & d_first_counter_1;
			if (a_first_done | d_first_done)
				watchdog <= 32'h00000000;
			else
				watchdog <= watchdog + 32'h00000001;
			inflight_1 <= {1'h0, inflight_1[0] & ~d_clr_1};
			inflight_sizes_1 <= inflight_sizes_1 & ~{4 {d_clr_1}};
			d_first_counter_2 <= (~d_first_done | (d_first_counter_2 - 1'h1)) & d_first_counter_2;
			if (d_first_done)
				watchdog_1 <= 32'h00000000;
			else
				watchdog_1 <= watchdog_1 + 32'h00000001;
		end
		if (a_first_done & ~a_first_counter) begin
			opcode <= io_in_a_bits_opcode;
			address <= io_in_a_bits_address;
		end
		if (d_first_done & ~d_first_counter)
			opcode_1 <= io_in_d_bits_opcode;
	end
	plusarg_reader #(
		.DEFAULT(0),
		.FORMAT("tilelink_timeout=%d"),
		.WIDTH(32)
	) plusarg_reader(.out(_plusarg_reader_out));
	plusarg_reader #(
		.DEFAULT(0),
		.FORMAT("tilelink_timeout=%d"),
		.WIDTH(32)
	) plusarg_reader_1(.out(_plusarg_reader_1_out));
endmodule
