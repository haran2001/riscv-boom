module TLMonitor_17 (
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
	input [16:0] io_in_a_bits_address;
	input [7:0] io_in_a_bits_mask;
	input io_in_a_bits_corrupt;
	input io_in_d_ready;
	input io_in_d_valid;
	input [2:0] io_in_d_bits_size;
	input [4:0] io_in_d_bits_source;
	wire [31:0] _plusarg_reader_out;
	wire a_first_done = io_in_a_ready & io_in_a_valid;
	reg [2:0] a_first_counter;
	reg [2:0] opcode;
	reg [2:0] param;
	reg [2:0] size;
	reg [4:0] source;
	reg [16:0] address;
	reg [2:0] d_first_counter;
	reg [2:0] size_1;
	reg [4:0] source_1;
	reg [20:0] inflight;
	reg [83:0] inflight_opcodes;
	reg [83:0] inflight_sizes;
	reg [2:0] a_first_counter_1;
	wire a_first_1 = a_first_counter_1 == 3'h0;
	reg [2:0] d_first_counter_1;
	wire d_first_1 = d_first_counter_1 == 3'h0;
	wire _GEN = a_first_done & a_first_1;
	reg [31:0] watchdog;
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
		end
		else begin : sv2v_autoblock_2
			reg [258:0] _GEN_24;
			reg _GEN_25;
			reg [270:0] _GEN_26;
			reg [31:0] _d_clr_T;
			reg [31:0] _a_set_T;
			reg [270:0] _d_opcodes_clr_T_5;
			reg [258:0] _a_opcodes_set_T_1;
			reg [270:0] _d_sizes_clr_T_5;
			reg [258:0] _a_sizes_set_T_1;
			_GEN_24 = {252'h000000000000000000000000000000000000000000000000000000000000000, io_in_a_bits_source, 2'h0};
			_GEN_26 = {264'h0, io_in_d_bits_source, 2'h0};
			_d_clr_T = 32'h00000001 << io_in_d_bits_source;
			_a_set_T = 32'h00000001 << io_in_a_bits_source;
			_d_opcodes_clr_T_5 = 271'hf << _GEN_26;
			_a_opcodes_set_T_1 = {255'h0000000000000000000000000000000000000000000000000000000000000000, (_GEN ? {io_in_a_bits_opcode, 1'h1} : 4'h0)} << _GEN_24;
			_d_sizes_clr_T_5 = 271'hf << _GEN_26;
			_a_sizes_set_T_1 = {255'h0000000000000000000000000000000000000000000000000000000000000000, (_GEN ? {io_in_a_bits_size, 1'h1} : 4'h0)} << _GEN_24;
			_GEN_25 = _d_first_T_2 & d_first_1;
			if (a_first_done) begin
				if (|a_first_counter)
					a_first_counter <= a_first_counter - 3'h1;
				else
					a_first_counter <= 3'h0;
				if (a_first_1)
					a_first_counter_1 <= 3'h0;
				else
					a_first_counter_1 <= a_first_counter_1 - 3'h1;
			end
			if (_d_first_T_2) begin : sv2v_autoblock_3
				reg [12:0] _d_first_beats1_decode_T_6;
				_d_first_beats1_decode_T_6 = 13'h003f << io_in_d_bits_size;
				if (|d_first_counter)
					d_first_counter <= d_first_counter - 3'h1;
				else
					d_first_counter <= ~_d_first_beats1_decode_T_6[5:3];
				if (d_first_1)
					d_first_counter_1 <= ~_d_first_beats1_decode_T_6[5:3];
				else
					d_first_counter_1 <= d_first_counter_1 - 3'h1;
			end
			inflight <= (inflight | (_GEN ? _a_set_T[20:0] : 21'h000000)) & ~(_GEN_25 ? _d_clr_T[20:0] : 21'h000000);
			inflight_opcodes <= (inflight_opcodes | (_GEN ? _a_opcodes_set_T_1[83:0] : 84'h000000000000000000000)) & ~(_GEN_25 ? _d_opcodes_clr_T_5[83:0] : 84'h000000000000000000000);
			inflight_sizes <= (inflight_sizes | (_GEN ? _a_sizes_set_T_1[83:0] : 84'h000000000000000000000)) & ~(_GEN_25 ? _d_sizes_clr_T_5[83:0] : 84'h000000000000000000000);
			if (a_first_done | _d_first_T_2)
				watchdog <= 32'h00000000;
			else
				watchdog <= watchdog + 32'h00000001;
		end
		if (a_first_done & ~(|a_first_counter)) begin
			opcode <= io_in_a_bits_opcode;
			param <= io_in_a_bits_param;
			size <= io_in_a_bits_size;
			source <= io_in_a_bits_source;
			address <= io_in_a_bits_address;
		end
		if (_d_first_T_2 & ~(|d_first_counter)) begin
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
	) plusarg_reader_1(.out());
endmodule
