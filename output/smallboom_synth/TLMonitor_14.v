module TLMonitor_14 (
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
	input [2:0] io_in_a_bits_size;
	input [4:0] io_in_a_bits_source;
	input [25:0] io_in_a_bits_address;
	input [7:0] io_in_a_bits_mask;
	input io_in_a_bits_corrupt;
	input io_in_d_ready;
	input io_in_d_valid;
	input [2:0] io_in_d_bits_opcode;
	input [2:0] io_in_d_bits_size;
	input [4:0] io_in_d_bits_source;
	wire [31:0] _plusarg_reader_1_out;
	wire [31:0] _plusarg_reader_out;
	wire [12:0] _GEN = {10'h000, io_in_a_bits_size};
	wire _a_first_T_1 = io_in_a_ready & io_in_a_valid;
	reg [2:0] a_first_counter;
	reg [2:0] opcode;
	reg [2:0] param;
	reg [2:0] size;
	reg [4:0] source;
	reg [25:0] address;
	reg [2:0] d_first_counter;
	reg [2:0] opcode_1;
	reg [2:0] size_1;
	reg [4:0] source_1;
	reg [20:0] inflight;
	reg [83:0] inflight_opcodes;
	reg [83:0] inflight_sizes;
	reg [2:0] a_first_counter_1;
	wire a_first_1 = a_first_counter_1 == 3'h0;
	reg [2:0] d_first_counter_1;
	wire d_first_1 = d_first_counter_1 == 3'h0;
	wire _GEN_0 = _a_first_T_1 & a_first_1;
	wire d_release_ack = io_in_d_bits_opcode == 3'h6;
	reg [31:0] watchdog;
	reg [20:0] inflight_1;
	reg [83:0] inflight_sizes_1;
	reg [2:0] d_first_counter_2;
	wire d_first_2 = d_first_counter_2 == 3'h0;
	reg [31:0] watchdog_1;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg _d_first_T_2;
		_d_first_T_2 = io_in_d_ready & io_in_d_valid;
		if (reset) begin
			a_first_counter <= 3'h0;
			d_first_counter <= 3'h0;
			inflight <= 21'h000000;
			inflight_opcodes <= 84'h000000000000000000000;
			inflight_sizes <= 84'h000000000000000000000;
			a_first_counter_1 <= 3'h0;
			d_first_counter_1 <= 3'h0;
			watchdog <= 32'h00000000;
			inflight_1 <= 21'h000000;
			inflight_sizes_1 <= 84'h000000000000000000000;
			d_first_counter_2 <= 3'h0;
			watchdog_1 <= 32'h00000000;
		end
		else begin : sv2v_autoblock_2
			reg [258:0] _GEN_36;
			reg _GEN_37;
			reg [31:0] _GEN_38;
			reg [270:0] _GEN_39;
			reg _GEN_40;
			reg [31:0] _d_clr_T;
			reg [31:0] _a_set_T;
			reg [270:0] _d_opcodes_clr_T_5;
			reg [258:0] _a_opcodes_set_T_1;
			reg [270:0] _d_sizes_clr_T_5;
			reg [258:0] _a_sizes_set_T_1;
			reg [31:0] _d_clr_T_1;
			reg [270:0] _d_sizes_clr_T_11;
			_GEN_36 = {252'h000000000000000000000000000000000000000000000000000000000000000, io_in_a_bits_source, 2'h0};
			_GEN_38 = {27'h0000000, io_in_d_bits_source};
			_GEN_39 = {264'h0, io_in_d_bits_source, 2'h0};
			_d_clr_T = 32'h00000001 << _GEN_38;
			_a_set_T = 32'h00000001 << io_in_a_bits_source;
			_d_opcodes_clr_T_5 = 271'hf << _GEN_39;
			_a_opcodes_set_T_1 = {255'h0000000000000000000000000000000000000000000000000000000000000000, (_GEN_0 ? {io_in_a_bits_opcode, 1'h1} : 4'h0)} << _GEN_36;
			_d_sizes_clr_T_5 = 271'hf << _GEN_39;
			_a_sizes_set_T_1 = {255'h0000000000000000000000000000000000000000000000000000000000000000, (_GEN_0 ? {io_in_a_bits_size, 1'h1} : 4'h0)} << _GEN_36;
			_d_clr_T_1 = 32'h00000001 << _GEN_38;
			_d_sizes_clr_T_11 = 271'hf << _GEN_39;
			_GEN_37 = (_d_first_T_2 & d_first_1) & ~d_release_ack;
			_GEN_40 = (_d_first_T_2 & d_first_2) & d_release_ack;
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
			inflight <= (inflight | (_GEN_0 ? _a_set_T[20:0] : 21'h000000)) & ~(_GEN_37 ? _d_clr_T[20:0] : 21'h000000);
			inflight_opcodes <= (inflight_opcodes | (_GEN_0 ? _a_opcodes_set_T_1[83:0] : 84'h000000000000000000000)) & ~(_GEN_37 ? _d_opcodes_clr_T_5[83:0] : 84'h000000000000000000000);
			inflight_sizes <= (inflight_sizes | (_GEN_0 ? _a_sizes_set_T_1[83:0] : 84'h000000000000000000000)) & ~(_GEN_37 ? _d_sizes_clr_T_5[83:0] : 84'h000000000000000000000);
			if (_a_first_T_1 | _d_first_T_2)
				watchdog <= 32'h00000000;
			else
				watchdog <= watchdog + 32'h00000001;
			inflight_1 <= inflight_1 & ~(_GEN_40 ? _d_clr_T_1[20:0] : 21'h000000);
			inflight_sizes_1 <= inflight_sizes_1 & ~(_GEN_40 ? _d_sizes_clr_T_11[83:0] : 84'h000000000000000000000);
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
