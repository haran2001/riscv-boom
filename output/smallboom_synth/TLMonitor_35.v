module TLMonitor_35 (
	clock,
	reset,
	io_in_a_ready,
	io_in_a_valid,
	io_in_a_bits_opcode,
	io_in_a_bits_param,
	io_in_a_bits_size,
	io_in_a_bits_source,
	io_in_a_bits_address,
	io_in_a_bits_mask,
	io_in_a_bits_corrupt,
	io_in_d_ready,
	io_in_d_valid,
	io_in_d_bits_opcode,
	io_in_d_bits_size,
	io_in_d_bits_source
);
	input clock;
	input reset;
	input io_in_a_ready;
	input io_in_a_valid;
	input [2:0] io_in_a_bits_opcode;
	input [2:0] io_in_a_bits_param;
	input [1:0] io_in_a_bits_size;
	input io_in_a_bits_source;
	input [8:0] io_in_a_bits_address;
	input [3:0] io_in_a_bits_mask;
	input io_in_a_bits_corrupt;
	input io_in_d_ready;
	input io_in_d_valid;
	input [2:0] io_in_d_bits_opcode;
	input [1:0] io_in_d_bits_size;
	input io_in_d_bits_source;
	wire [31:0] _plusarg_reader_1_out;
	wire [31:0] _plusarg_reader_out;
	wire a_first_done = io_in_a_ready & io_in_a_valid;
	reg a_first_counter;
	reg [2:0] opcode;
	reg [2:0] param;
	reg [1:0] size;
	reg source;
	reg [8:0] address;
	reg d_first_counter;
	reg [2:0] opcode_1;
	reg [1:0] size_1;
	reg source_1;
	reg [1:0] inflight;
	reg [3:0] inflight_opcodes;
	reg [3:0] inflight_sizes;
	reg a_first_counter_1;
	reg d_first_counter_1;
	wire _GEN = a_first_done & ~a_first_counter_1;
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
			reg _GEN_33;
			reg [30:0] _GEN_34;
			reg _GEN_35;
			reg [30:0] _d_opcodes_clr_T_5;
			reg [18:0] _a_opcodes_set_T_1;
			reg [30:0] _d_sizes_clr_T_5;
			reg [17:0] _a_sizes_set_T_1;
			reg [30:0] _d_sizes_clr_T_11;
			_GEN_34 = {28'h0000000, io_in_d_bits_source, 2'h0};
			_d_opcodes_clr_T_5 = 31'h0000000f << _GEN_34;
			_a_opcodes_set_T_1 = {15'h0000, (_GEN ? {io_in_a_bits_opcode, 1'h1} : 4'h0)} << {16'h0000, io_in_a_bits_source, 2'h0};
			_d_sizes_clr_T_5 = 31'h0000000f << _GEN_34;
			_a_sizes_set_T_1 = {15'h0000, (_GEN ? {io_in_a_bits_size, 1'h1} : 3'h0)} << {15'h0000, io_in_a_bits_source, 2'h0};
			_d_sizes_clr_T_11 = 31'h0000000f << _GEN_34;
			_GEN_33 = (d_first_done & ~d_first_counter_1) & ~d_release_ack;
			_GEN_35 = (d_first_done & ~d_first_counter_2) & d_release_ack;
			a_first_counter <= (~a_first_done | (a_first_counter - 1'h1)) & a_first_counter;
			d_first_counter <= (~d_first_done | (d_first_counter - 1'h1)) & d_first_counter;
			inflight <= {1'h0, (inflight[0] | (_GEN & ~io_in_a_bits_source)) & ~(_GEN_33 & ~io_in_d_bits_source)};
			inflight_opcodes <= (inflight_opcodes | (_GEN ? _a_opcodes_set_T_1[3:0] : 4'h0)) & ~(_GEN_33 ? _d_opcodes_clr_T_5[3:0] : 4'h0);
			inflight_sizes <= (inflight_sizes | (_GEN ? _a_sizes_set_T_1[3:0] : 4'h0)) & ~(_GEN_33 ? _d_sizes_clr_T_5[3:0] : 4'h0);
			a_first_counter_1 <= (~a_first_done | (a_first_counter_1 - 1'h1)) & a_first_counter_1;
			d_first_counter_1 <= (~d_first_done | (d_first_counter_1 - 1'h1)) & d_first_counter_1;
			if (a_first_done | d_first_done)
				watchdog <= 32'h00000000;
			else
				watchdog <= watchdog + 32'h00000001;
			inflight_1 <= {1'h0, inflight_1[0] & ~(_GEN_35 & ~io_in_d_bits_source)};
			inflight_sizes_1 <= inflight_sizes_1 & ~(_GEN_35 ? _d_sizes_clr_T_11[3:0] : 4'h0);
			d_first_counter_2 <= (~d_first_done | (d_first_counter_2 - 1'h1)) & d_first_counter_2;
			if (d_first_done)
				watchdog_1 <= 32'h00000000;
			else
				watchdog_1 <= watchdog_1 + 32'h00000001;
		end
		if (a_first_done & ~a_first_counter) begin
			opcode <= io_in_a_bits_opcode;
			param <= io_in_a_bits_param;
			size <= io_in_a_bits_size;
			source <= io_in_a_bits_source;
			address <= io_in_a_bits_address;
		end
		if (d_first_done & ~d_first_counter) begin
			opcode_1 <= io_in_d_bits_opcode;
			size_1 <= io_in_d_bits_size;
			source_1 <= io_in_d_bits_source;
		end
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
