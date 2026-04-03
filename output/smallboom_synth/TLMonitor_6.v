module TLMonitor_6 (
	clock,
	reset,
	io_in_a_ready,
	io_in_a_valid,
	io_in_a_bits_opcode,
	io_in_a_bits_size,
	io_in_a_bits_source,
	io_in_a_bits_address,
	io_in_a_bits_mask,
	io_in_d_ready,
	io_in_d_valid,
	io_in_d_bits_opcode,
	io_in_d_bits_param,
	io_in_d_bits_size,
	io_in_d_bits_source,
	io_in_d_bits_sink,
	io_in_d_bits_denied,
	io_in_d_bits_corrupt
);
	input clock;
	input reset;
	input io_in_a_ready;
	input io_in_a_valid;
	input [2:0] io_in_a_bits_opcode;
	input [3:0] io_in_a_bits_size;
	input [3:0] io_in_a_bits_source;
	input [31:0] io_in_a_bits_address;
	input [7:0] io_in_a_bits_mask;
	input io_in_d_ready;
	input io_in_d_valid;
	input [2:0] io_in_d_bits_opcode;
	input [1:0] io_in_d_bits_param;
	input [3:0] io_in_d_bits_size;
	input [3:0] io_in_d_bits_source;
	input [1:0] io_in_d_bits_sink;
	input io_in_d_bits_denied;
	input io_in_d_bits_corrupt;
	wire [31:0] _plusarg_reader_1_out;
	wire [31:0] _plusarg_reader_out;
	wire [26:0] _GEN = {23'h000000, io_in_a_bits_size};
	wire _a_first_T_1 = io_in_a_ready & io_in_a_valid;
	reg [8:0] a_first_counter;
	reg [2:0] opcode;
	reg [3:0] size;
	reg [3:0] source;
	reg [31:0] address;
	reg [8:0] d_first_counter;
	reg [2:0] opcode_1;
	reg [1:0] param_1;
	reg [3:0] size_1;
	reg [3:0] source_1;
	reg [1:0] sink;
	reg denied;
	reg [15:0] inflight;
	reg [63:0] inflight_opcodes;
	reg [127:0] inflight_sizes;
	reg [8:0] a_first_counter_1;
	wire a_first_1 = a_first_counter_1 == 9'h000;
	reg [8:0] d_first_counter_1;
	wire d_first_1 = d_first_counter_1 == 9'h000;
	wire [15:0] _GEN_0 = {12'h000, io_in_a_bits_source};
	wire _GEN_1 = _a_first_T_1 & a_first_1;
	wire d_release_ack = io_in_d_bits_opcode == 3'h6;
	wire [15:0] _GEN_2 = {12'h000, io_in_d_bits_source};
	reg [31:0] watchdog;
	reg [15:0] inflight_1;
	reg [127:0] inflight_sizes_1;
	reg [8:0] d_first_counter_2;
	wire d_first_2 = d_first_counter_2 == 9'h000;
	reg [31:0] watchdog_1;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg _d_first_T_2;
		_d_first_T_2 = io_in_d_ready & io_in_d_valid;
		if (reset) begin
			a_first_counter <= 9'h000;
			d_first_counter <= 9'h000;
			inflight <= 16'h0000;
			inflight_opcodes <= 64'h0000000000000000;
			inflight_sizes <= 128'h00000000000000000000000000000000;
			a_first_counter_1 <= 9'h000;
			d_first_counter_1 <= 9'h000;
			watchdog <= 32'h00000000;
			inflight_1 <= 16'h0000;
			inflight_sizes_1 <= 128'h00000000000000000000000000000000;
			d_first_counter_2 <= 9'h000;
			watchdog_1 <= 32'h00000000;
		end
		else begin : sv2v_autoblock_2
			reg _GEN_49;
			reg [142:0] _GEN_50;
			reg _GEN_51;
			reg [142:0] _d_opcodes_clr_T_5;
			reg [130:0] _a_opcodes_set_T_1;
			reg [142:0] _d_sizes_clr_T_5;
			reg [131:0] _a_sizes_set_T_1;
			reg [142:0] _d_sizes_clr_T_11;
			_GEN_50 = {136'h0000000000000000000000000000000000, io_in_d_bits_source, 3'h0};
			_d_opcodes_clr_T_5 = 143'h00000000000000000000000000000000000f << {137'h00000000000000000000000000000000000, io_in_d_bits_source, 2'h0};
			_a_opcodes_set_T_1 = {127'h00000000000000000000000000000000, (_GEN_1 ? {io_in_a_bits_opcode, 1'h1} : 4'h0)} << {125'h00000000000000000000000000000000, io_in_a_bits_source, 2'h0};
			_d_sizes_clr_T_5 = 143'h0000000000000000000000000000000000ff << _GEN_50;
			_a_sizes_set_T_1 = {127'h00000000000000000000000000000000, (_GEN_1 ? {io_in_a_bits_size, 1'h1} : 5'h00)} << {125'h00000000000000000000000000000000, io_in_a_bits_source, 3'h0};
			_d_sizes_clr_T_11 = 143'h0000000000000000000000000000000000ff << _GEN_50;
			_GEN_49 = (_d_first_T_2 & d_first_1) & ~d_release_ack;
			_GEN_51 = (_d_first_T_2 & d_first_2) & d_release_ack;
			if (_a_first_T_1) begin : sv2v_autoblock_3
				reg [26:0] _a_first_beats1_decode_T_3;
				_a_first_beats1_decode_T_3 = 27'h0000fff << _GEN;
				if (|a_first_counter)
					a_first_counter <= a_first_counter - 9'h001;
				else
					a_first_counter <= (io_in_a_bits_opcode[2] ? 9'h000 : ~_a_first_beats1_decode_T_3[11:3]);
				if (a_first_1)
					a_first_counter_1 <= (io_in_a_bits_opcode[2] ? 9'h000 : ~_a_first_beats1_decode_T_3[11:3]);
				else
					a_first_counter_1 <= a_first_counter_1 - 9'h001;
			end
			if (_d_first_T_2) begin : sv2v_autoblock_4
				reg [26:0] _d_first_beats1_decode_T_6;
				_d_first_beats1_decode_T_6 = 27'h0000fff << io_in_d_bits_size;
				if (|d_first_counter)
					d_first_counter <= d_first_counter - 9'h001;
				else
					d_first_counter <= (io_in_d_bits_opcode[0] ? ~_d_first_beats1_decode_T_6[11:3] : 9'h000);
				if (d_first_1)
					d_first_counter_1 <= (io_in_d_bits_opcode[0] ? ~_d_first_beats1_decode_T_6[11:3] : 9'h000);
				else
					d_first_counter_1 <= d_first_counter_1 - 9'h001;
				if (d_first_2)
					d_first_counter_2 <= (io_in_d_bits_opcode[0] ? ~_d_first_beats1_decode_T_6[11:3] : 9'h000);
				else
					d_first_counter_2 <= d_first_counter_2 - 9'h001;
				watchdog_1 <= 32'h00000000;
			end
			else
				watchdog_1 <= watchdog_1 + 32'h00000001;
			inflight <= (inflight | (_GEN_1 ? 16'h0001 << _GEN_0 : 16'h0000)) & ~(_GEN_49 ? 16'h0001 << _GEN_2 : 16'h0000);
			inflight_opcodes <= (inflight_opcodes | (_GEN_1 ? _a_opcodes_set_T_1[63:0] : 64'h0000000000000000)) & ~(_GEN_49 ? _d_opcodes_clr_T_5[63:0] : 64'h0000000000000000);
			inflight_sizes <= (inflight_sizes | (_GEN_1 ? _a_sizes_set_T_1[127:0] : 128'h00000000000000000000000000000000)) & ~(_GEN_49 ? _d_sizes_clr_T_5[127:0] : 128'h00000000000000000000000000000000);
			if (_a_first_T_1 | _d_first_T_2)
				watchdog <= 32'h00000000;
			else
				watchdog <= watchdog + 32'h00000001;
			inflight_1 <= inflight_1 & ~(_GEN_51 ? 16'h0001 << _GEN_2 : 16'h0000);
			inflight_sizes_1 <= inflight_sizes_1 & ~(_GEN_51 ? _d_sizes_clr_T_11[127:0] : 128'h00000000000000000000000000000000);
		end
		if (_a_first_T_1 & ~(|a_first_counter)) begin
			opcode <= io_in_a_bits_opcode;
			size <= io_in_a_bits_size;
			source <= io_in_a_bits_source;
			address <= io_in_a_bits_address;
		end
		if (_d_first_T_2 & ~(|d_first_counter)) begin
			opcode_1 <= io_in_d_bits_opcode;
			param_1 <= io_in_d_bits_param;
			size_1 <= io_in_d_bits_size;
			source_1 <= io_in_d_bits_source;
			sink <= io_in_d_bits_sink;
			denied <= io_in_d_bits_denied;
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
