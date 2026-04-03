module TLMonitor_26 (
	clock,
	reset,
	io_in_a_ready,
	io_in_a_valid,
	io_in_a_bits_address,
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
	input [31:0] io_in_a_bits_address;
	input io_in_d_valid;
	input [2:0] io_in_d_bits_opcode;
	input [1:0] io_in_d_bits_param;
	input [3:0] io_in_d_bits_size;
	input io_in_d_bits_source;
	input [1:0] io_in_d_bits_sink;
	input io_in_d_bits_denied;
	input io_in_d_bits_corrupt;
	wire [31:0] _plusarg_reader_1_out;
	wire [31:0] _plusarg_reader_out;
	wire _a_first_T_1 = io_in_a_ready & io_in_a_valid;
	reg [8:0] a_first_counter;
	reg [31:0] address;
	reg [8:0] d_first_counter;
	reg [2:0] opcode_1;
	reg [1:0] param_1;
	reg [3:0] size_1;
	reg source_1;
	reg [1:0] sink;
	reg denied;
	reg [1:0] inflight;
	reg [3:0] inflight_opcodes;
	reg [7:0] inflight_sizes;
	reg [8:0] a_first_counter_1;
	wire a_first_1 = a_first_counter_1 == 9'h000;
	reg [8:0] d_first_counter_1;
	wire d_first_1 = d_first_counter_1 == 9'h000;
	wire a_set = _a_first_T_1 & a_first_1;
	wire d_release_ack = io_in_d_bits_opcode == 3'h6;
	wire _GEN = io_in_d_valid & d_first_1;
	wire _GEN_0 = _GEN & ~d_release_ack;
	reg [31:0] watchdog;
	reg [1:0] inflight_1;
	reg [7:0] inflight_sizes_1;
	reg [8:0] d_first_counter_2;
	wire d_first_2 = d_first_counter_2 == 9'h000;
	wire _GEN_1 = (io_in_d_valid & d_first_2) & d_release_ack;
	reg [31:0] watchdog_1;
	always @(posedge clock) begin
		if (reset) begin
			a_first_counter <= 9'h000;
			d_first_counter <= 9'h000;
			inflight <= 2'h0;
			inflight_opcodes <= 4'h0;
			inflight_sizes <= 8'h00;
			a_first_counter_1 <= 9'h000;
			d_first_counter_1 <= 9'h000;
			watchdog <= 32'h00000000;
			inflight_1 <= 2'h0;
			inflight_sizes_1 <= 8'h00;
			d_first_counter_2 <= 9'h000;
			watchdog_1 <= 32'h00000000;
		end
		else begin : sv2v_autoblock_1
			reg [30:0] _GEN_24;
			reg [30:0] _d_opcodes_clr_T_5;
			reg [30:0] _d_sizes_clr_T_5;
			reg [30:0] _d_sizes_clr_T_11;
			_GEN_24 = {27'h0000000, io_in_d_bits_source, 3'h0};
			_d_opcodes_clr_T_5 = 31'h0000000f << {28'h0000000, io_in_d_bits_source, 2'h0};
			_d_sizes_clr_T_5 = 31'h000000ff << _GEN_24;
			_d_sizes_clr_T_11 = 31'h000000ff << _GEN_24;
			if (_a_first_T_1) begin
				if (|a_first_counter)
					a_first_counter <= a_first_counter - 9'h001;
				else
					a_first_counter <= 9'h000;
				if (a_first_1)
					a_first_counter_1 <= 9'h000;
				else
					a_first_counter_1 <= a_first_counter_1 - 9'h001;
			end
			if (io_in_d_valid) begin : sv2v_autoblock_2
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
			inflight <= {1'h0, (inflight[0] | a_set) & ~(_GEN_0 & ~io_in_d_bits_source)};
			inflight_opcodes <= (inflight_opcodes | (a_set ? 4'h9 : 4'h0)) & ~(_GEN_0 ? _d_opcodes_clr_T_5[3:0] : 4'h0);
			inflight_sizes <= (inflight_sizes | (a_set ? {3'h0, (a_set ? 5'h0d : 5'h00)} : 8'h00)) & ~(_GEN_0 ? _d_sizes_clr_T_5[7:0] : 8'h00);
			if (_a_first_T_1 | io_in_d_valid)
				watchdog <= 32'h00000000;
			else
				watchdog <= watchdog + 32'h00000001;
			inflight_1 <= {1'h0, inflight_1[0] & ~(_GEN_1 & ~io_in_d_bits_source)};
			inflight_sizes_1 <= inflight_sizes_1 & ~(_GEN_1 ? _d_sizes_clr_T_11[7:0] : 8'h00);
		end
		if (_a_first_T_1 & ~(|a_first_counter))
			address <= io_in_a_bits_address;
		if (io_in_d_valid & ~(|d_first_counter)) begin
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
