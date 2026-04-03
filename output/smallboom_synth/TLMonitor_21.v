module TLMonitor_21 (
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
	io_in_d_ready,
	io_in_d_valid,
	io_in_d_bits_opcode,
	io_in_d_bits_size,
	io_in_d_bits_source,
	io_in_d_bits_denied,
	io_in_d_bits_corrupt
);
	input clock;
	input reset;
	input io_in_a_ready;
	input io_in_a_valid;
	input [2:0] io_in_a_bits_opcode;
	input [2:0] io_in_a_bits_param;
	input [2:0] io_in_a_bits_size;
	input [6:0] io_in_a_bits_source;
	input [31:0] io_in_a_bits_address;
	input [7:0] io_in_a_bits_mask;
	input io_in_d_ready;
	input io_in_d_valid;
	input [2:0] io_in_d_bits_opcode;
	input [2:0] io_in_d_bits_size;
	input [6:0] io_in_d_bits_source;
	input io_in_d_bits_denied;
	input io_in_d_bits_corrupt;
	wire [31:0] _plusarg_reader_1_out;
	wire [31:0] _plusarg_reader_out;
	wire [12:0] _GEN = {10'h000, io_in_a_bits_size};
	wire _a_first_T_1 = io_in_a_ready & io_in_a_valid;
	reg [2:0] a_first_counter;
	reg [2:0] opcode;
	reg [2:0] param;
	reg [2:0] size;
	reg [6:0] source;
	reg [31:0] address;
	reg [2:0] d_first_counter;
	reg [2:0] opcode_1;
	reg [2:0] size_1;
	reg [6:0] source_1;
	reg denied;
	reg [127:0] inflight;
	reg [511:0] inflight_opcodes;
	reg [511:0] inflight_sizes;
	reg [2:0] a_first_counter_1;
	wire a_first_1 = a_first_counter_1 == 3'h0;
	reg [2:0] d_first_counter_1;
	wire d_first_1 = d_first_counter_1 == 3'h0;
	wire [127:0] _GEN_0 = {121'h0000000000000000000000000000000, io_in_a_bits_source};
	wire _GEN_1 = _a_first_T_1 & a_first_1;
	wire d_release_ack = io_in_d_bits_opcode == 3'h6;
	wire [127:0] _GEN_2 = {121'h0000000000000000000000000000000, io_in_d_bits_source};
	reg [31:0] watchdog;
	reg [127:0] inflight_1;
	reg [511:0] inflight_sizes_1;
	reg [2:0] d_first_counter_2;
	wire d_first_2 = d_first_counter_2 == 3'h0;
	reg [31:0] watchdog_1;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg _d_first_T_2;
		_d_first_T_2 = io_in_d_ready & io_in_d_valid;
		if (reset) begin
			a_first_counter <= 3'h0;
			d_first_counter <= 3'h0;
			inflight <= 128'h00000000000000000000000000000000;
			inflight_opcodes <= 512'h0;
			inflight_sizes <= 512'h0;
			a_first_counter_1 <= 3'h0;
			d_first_counter_1 <= 3'h0;
			watchdog <= 32'h00000000;
			inflight_1 <= 128'h00000000000000000000000000000000;
			inflight_sizes_1 <= 512'h0;
			d_first_counter_2 <= 3'h0;
			watchdog_1 <= 32'h00000000;
		end
		else begin : sv2v_autoblock_2
			reg [1026:0] _GEN_34;
			reg _GEN_35;
			reg [1038:0] _GEN_36;
			reg _GEN_37;
			reg [1038:0] _d_opcodes_clr_T_5;
			reg [1026:0] _a_opcodes_set_T_1;
			reg [1038:0] _d_sizes_clr_T_5;
			reg [1026:0] _a_sizes_set_T_1;
			reg [1038:0] _d_sizes_clr_T_11;
			_GEN_34 = {1018'h0, io_in_a_bits_source, 2'h0};
			_GEN_36 = {1030'h0, io_in_d_bits_source, 2'h0};
			_d_opcodes_clr_T_5 = 1039'hf << _GEN_36;
			_a_opcodes_set_T_1 = {1023'h0, (_GEN_1 ? {io_in_a_bits_opcode, 1'h1} : 4'h0)} << _GEN_34;
			_d_sizes_clr_T_5 = 1039'hf << _GEN_36;
			_a_sizes_set_T_1 = {1023'h0, (_GEN_1 ? {io_in_a_bits_size, 1'h1} : 4'h0)} << _GEN_34;
			_d_sizes_clr_T_11 = 1039'hf << _GEN_36;
			_GEN_35 = (_d_first_T_2 & d_first_1) & ~d_release_ack;
			_GEN_37 = (_d_first_T_2 & d_first_2) & d_release_ack;
			if (_a_first_T_1) begin : sv2v_autoblock_3
				reg [12:0] _a_first_beats1_decode_T_3;
				_a_first_beats1_decode_T_3 = 13'h003f << _GEN;
				if (|a_first_counter)
					a_first_counter <= a_first_counter - 3'h1;
				else
					a_first_counter <= (io_in_a_bits_opcode[2] ? 3'h0 : ~_a_first_beats1_decode_T_3[5:3]);
				if (a_first_1)
					a_first_counter_1 <= (io_in_a_bits_opcode[2] ? 3'h0 : ~_a_first_beats1_decode_T_3[5:3]);
				else
					a_first_counter_1 <= a_first_counter_1 - 3'h1;
			end
			if (_d_first_T_2) begin : sv2v_autoblock_4
				reg [12:0] _d_first_beats1_decode_T_6;
				_d_first_beats1_decode_T_6 = 13'h003f << io_in_d_bits_size;
				if (|d_first_counter)
					d_first_counter <= d_first_counter - 3'h1;
				else
					d_first_counter <= (io_in_d_bits_opcode[0] ? ~_d_first_beats1_decode_T_6[5:3] : 3'h0);
				if (d_first_1)
					d_first_counter_1 <= (io_in_d_bits_opcode[0] ? ~_d_first_beats1_decode_T_6[5:3] : 3'h0);
				else
					d_first_counter_1 <= d_first_counter_1 - 3'h1;
				if (d_first_2)
					d_first_counter_2 <= (io_in_d_bits_opcode[0] ? ~_d_first_beats1_decode_T_6[5:3] : 3'h0);
				else
					d_first_counter_2 <= d_first_counter_2 - 3'h1;
				watchdog_1 <= 32'h00000000;
			end
			else
				watchdog_1 <= watchdog_1 + 32'h00000001;
			inflight <= (inflight | (_GEN_1 ? 128'h00000000000000000000000000000001 << _GEN_0 : 128'h00000000000000000000000000000000)) & ~(_GEN_35 ? 128'h00000000000000000000000000000001 << _GEN_2 : 128'h00000000000000000000000000000000);
			inflight_opcodes <= (inflight_opcodes | (_GEN_1 ? _a_opcodes_set_T_1[511:0] : 512'h0)) & ~(_GEN_35 ? _d_opcodes_clr_T_5[511:0] : 512'h0);
			inflight_sizes <= (inflight_sizes | (_GEN_1 ? _a_sizes_set_T_1[511:0] : 512'h0)) & ~(_GEN_35 ? _d_sizes_clr_T_5[511:0] : 512'h0);
			if (_a_first_T_1 | _d_first_T_2)
				watchdog <= 32'h00000000;
			else
				watchdog <= watchdog + 32'h00000001;
			inflight_1 <= inflight_1 & ~(_GEN_37 ? 128'h00000000000000000000000000000001 << _GEN_2 : 128'h00000000000000000000000000000000);
			inflight_sizes_1 <= inflight_sizes_1 & ~(_GEN_37 ? _d_sizes_clr_T_11[511:0] : 512'h0);
		end
		if (_a_first_T_1 & ~(|a_first_counter)) begin
			opcode <= io_in_a_bits_opcode;
			param <= io_in_a_bits_param;
			size <= io_in_a_bits_size;
			source <= io_in_a_bits_source;
			address <= io_in_a_bits_address;
		end
		if (_d_first_T_2 & ~(|d_first_counter)) begin
			opcode_1 <= io_in_d_bits_opcode;
			size_1 <= io_in_d_bits_size;
			source_1 <= io_in_d_bits_source;
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
