module TLMonitor_22 (
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
	io_in_b_ready,
	io_in_b_valid,
	io_in_b_bits_opcode,
	io_in_b_bits_param,
	io_in_b_bits_size,
	io_in_b_bits_source,
	io_in_b_bits_address,
	io_in_b_bits_mask,
	io_in_b_bits_corrupt,
	io_in_c_ready,
	io_in_c_valid,
	io_in_c_bits_opcode,
	io_in_c_bits_param,
	io_in_c_bits_size,
	io_in_c_bits_source,
	io_in_c_bits_address,
	io_in_c_bits_corrupt,
	io_in_d_ready,
	io_in_d_valid,
	io_in_d_bits_opcode,
	io_in_d_bits_param,
	io_in_d_bits_size,
	io_in_d_bits_source,
	io_in_d_bits_sink,
	io_in_d_bits_denied,
	io_in_d_bits_corrupt,
	io_in_e_ready,
	io_in_e_valid,
	io_in_e_bits_sink
);
	input clock;
	input reset;
	input io_in_a_ready;
	input io_in_a_valid;
	input [2:0] io_in_a_bits_opcode;
	input [2:0] io_in_a_bits_param;
	input [3:0] io_in_a_bits_size;
	input [1:0] io_in_a_bits_source;
	input [31:0] io_in_a_bits_address;
	input [7:0] io_in_a_bits_mask;
	input io_in_a_bits_corrupt;
	input io_in_b_ready;
	input io_in_b_valid;
	input [2:0] io_in_b_bits_opcode;
	input [1:0] io_in_b_bits_param;
	input [3:0] io_in_b_bits_size;
	input [1:0] io_in_b_bits_source;
	input [31:0] io_in_b_bits_address;
	input [7:0] io_in_b_bits_mask;
	input io_in_b_bits_corrupt;
	input io_in_c_ready;
	input io_in_c_valid;
	input [2:0] io_in_c_bits_opcode;
	input [2:0] io_in_c_bits_param;
	input [3:0] io_in_c_bits_size;
	input [1:0] io_in_c_bits_source;
	input [31:0] io_in_c_bits_address;
	input io_in_c_bits_corrupt;
	input io_in_d_ready;
	input io_in_d_valid;
	input [2:0] io_in_d_bits_opcode;
	input [1:0] io_in_d_bits_param;
	input [3:0] io_in_d_bits_size;
	input [1:0] io_in_d_bits_source;
	input [1:0] io_in_d_bits_sink;
	input io_in_d_bits_denied;
	input io_in_d_bits_corrupt;
	input io_in_e_ready;
	input io_in_e_valid;
	input [1:0] io_in_e_bits_sink;
	wire [31:0] _plusarg_reader_1_out;
	wire [31:0] _plusarg_reader_out;
	wire [26:0] _GEN = {23'h000000, io_in_a_bits_size};
	wire [26:0] _GEN_0 = {23'h000000, io_in_c_bits_size};
	wire _a_first_T_1 = io_in_a_ready & io_in_a_valid;
	reg [8:0] a_first_counter;
	reg [2:0] opcode;
	reg [2:0] param;
	reg [3:0] size;
	reg [1:0] source;
	reg [31:0] address;
	wire _d_first_T_3 = io_in_d_ready & io_in_d_valid;
	reg [8:0] d_first_counter;
	reg [2:0] opcode_1;
	reg [1:0] param_1;
	reg [3:0] size_1;
	reg [1:0] source_1;
	reg [1:0] sink;
	reg denied;
	reg [8:0] b_first_counter;
	reg [2:0] opcode_2;
	reg [1:0] param_2;
	reg [3:0] size_2;
	reg [1:0] source_2;
	reg [31:0] address_1;
	wire _c_first_T_1 = io_in_c_ready & io_in_c_valid;
	reg [8:0] c_first_counter;
	reg [2:0] opcode_3;
	reg [2:0] param_3;
	reg [3:0] size_3;
	reg [1:0] source_3;
	reg [31:0] address_2;
	reg [3:0] inflight;
	reg [15:0] inflight_opcodes;
	reg [31:0] inflight_sizes;
	reg [8:0] a_first_counter_1;
	wire a_first_1 = a_first_counter_1 == 9'h000;
	reg [8:0] d_first_counter_1;
	wire d_first_1 = d_first_counter_1 == 9'h000;
	wire [3:0] _GEN_1 = {2'h0, io_in_a_bits_source};
	wire _GEN_2 = _a_first_T_1 & a_first_1;
	wire d_release_ack = io_in_d_bits_opcode == 3'h6;
	wire [3:0] _GEN_3 = {2'h0, io_in_d_bits_source};
	reg [31:0] watchdog;
	reg [3:0] inflight_1;
	reg [31:0] inflight_sizes_1;
	reg [8:0] c_first_counter_1;
	wire c_first_1 = c_first_counter_1 == 9'h000;
	reg [8:0] d_first_counter_2;
	wire d_first_2 = d_first_counter_2 == 9'h000;
	wire _GEN_4 = io_in_c_bits_opcode[2] & io_in_c_bits_opcode[1];
	wire [3:0] _GEN_5 = {2'h0, io_in_c_bits_source};
	wire _GEN_6 = (_c_first_T_1 & c_first_1) & _GEN_4;
	reg [31:0] watchdog_1;
	reg [3:0] inflight_2;
	reg [8:0] d_first_counter_3;
	wire d_first_3 = d_first_counter_3 == 9'h000;
	wire _GEN_7 = ((_d_first_T_3 & d_first_3) & io_in_d_bits_opcode[2]) & ~io_in_d_bits_opcode[1];
	wire [3:0] _GEN_8 = {2'h0, io_in_d_bits_sink};
	wire [3:0] d_set = (_GEN_7 ? 4'h1 << _GEN_8 : 4'h0);
	wire _GEN_9 = io_in_e_ready & io_in_e_valid;
	wire [3:0] _GEN_10 = {2'h0, io_in_e_bits_sink};
	always @(posedge clock) begin : sv2v_autoblock_1
		reg b_first_done;
		b_first_done = io_in_b_ready & io_in_b_valid;
		if (reset) begin
			a_first_counter <= 9'h000;
			d_first_counter <= 9'h000;
			b_first_counter <= 9'h000;
			c_first_counter <= 9'h000;
			inflight <= 4'h0;
			inflight_opcodes <= 16'h0000;
			inflight_sizes <= 32'h00000000;
			a_first_counter_1 <= 9'h000;
			d_first_counter_1 <= 9'h000;
			watchdog <= 32'h00000000;
			inflight_1 <= 4'h0;
			inflight_sizes_1 <= 32'h00000000;
			c_first_counter_1 <= 9'h000;
			d_first_counter_2 <= 9'h000;
			watchdog_1 <= 32'h00000000;
			inflight_2 <= 4'h0;
			d_first_counter_3 <= 9'h000;
		end
		else begin : sv2v_autoblock_2
			reg _GEN_101;
			reg [46:0] _GEN_102;
			reg _GEN_103;
			reg [46:0] _d_opcodes_clr_T_5;
			reg [34:0] _a_opcodes_set_T_1;
			reg [46:0] _d_sizes_clr_T_5;
			reg [35:0] _a_sizes_set_T_1;
			reg [46:0] _d_sizes_clr_T_11;
			reg [35:0] _c_sizes_set_T_1;
			_GEN_101 = (_d_first_T_3 & d_first_1) & ~d_release_ack;
			_GEN_102 = {42'h00000000000, io_in_d_bits_source, 3'h0};
			_GEN_103 = (_d_first_T_3 & d_first_2) & d_release_ack;
			_d_opcodes_clr_T_5 = 47'h00000000000f << {43'h00000000000, io_in_d_bits_source, 2'h0};
			_a_opcodes_set_T_1 = {31'h00000000, (_GEN_2 ? {io_in_a_bits_opcode, 1'h1} : 4'h0)} << {31'h00000000, io_in_a_bits_source, 2'h0};
			_d_sizes_clr_T_5 = 47'h0000000000ff << _GEN_102;
			_a_sizes_set_T_1 = {31'h00000000, (_GEN_2 ? {io_in_a_bits_size, 1'h1} : 5'h00)} << {31'h00000000, io_in_a_bits_source, 3'h0};
			_d_sizes_clr_T_11 = 47'h0000000000ff << _GEN_102;
			_c_sizes_set_T_1 = {31'h00000000, (_GEN_6 ? {io_in_c_bits_size, 1'h1} : 5'h00)} << {31'h00000000, io_in_c_bits_source, 3'h0};
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
			if (_d_first_T_3) begin : sv2v_autoblock_4
				reg [26:0] _d_first_beats1_decode_T_9;
				_d_first_beats1_decode_T_9 = 27'h0000fff << io_in_d_bits_size;
				if (|d_first_counter)
					d_first_counter <= d_first_counter - 9'h001;
				else
					d_first_counter <= (io_in_d_bits_opcode[0] ? ~_d_first_beats1_decode_T_9[11:3] : 9'h000);
				if (d_first_1)
					d_first_counter_1 <= (io_in_d_bits_opcode[0] ? ~_d_first_beats1_decode_T_9[11:3] : 9'h000);
				else
					d_first_counter_1 <= d_first_counter_1 - 9'h001;
				if (d_first_2)
					d_first_counter_2 <= (io_in_d_bits_opcode[0] ? ~_d_first_beats1_decode_T_9[11:3] : 9'h000);
				else
					d_first_counter_2 <= d_first_counter_2 - 9'h001;
				if (d_first_3)
					d_first_counter_3 <= (io_in_d_bits_opcode[0] ? ~_d_first_beats1_decode_T_9[11:3] : 9'h000);
				else
					d_first_counter_3 <= d_first_counter_3 - 9'h001;
			end
			if (b_first_done) begin
				if (|b_first_counter)
					b_first_counter <= b_first_counter - 9'h001;
				else
					b_first_counter <= 9'h000;
			end
			if (_c_first_T_1) begin : sv2v_autoblock_5
				reg [26:0] _c_first_beats1_decode_T_3;
				_c_first_beats1_decode_T_3 = 27'h0000fff << _GEN_0;
				if (|c_first_counter)
					c_first_counter <= c_first_counter - 9'h001;
				else
					c_first_counter <= (io_in_c_bits_opcode[0] ? ~_c_first_beats1_decode_T_3[11:3] : 9'h000);
				if (c_first_1)
					c_first_counter_1 <= (io_in_c_bits_opcode[0] ? ~_c_first_beats1_decode_T_3[11:3] : 9'h000);
				else
					c_first_counter_1 <= c_first_counter_1 - 9'h001;
			end
			inflight <= (inflight | (_GEN_2 ? 4'h1 << _GEN_1 : 4'h0)) & ~(_GEN_101 ? 4'h1 << _GEN_3 : 4'h0);
			inflight_opcodes <= (inflight_opcodes | (_GEN_2 ? _a_opcodes_set_T_1[15:0] : 16'h0000)) & ~(_GEN_101 ? _d_opcodes_clr_T_5[15:0] : 16'h0000);
			inflight_sizes <= (inflight_sizes | (_GEN_2 ? _a_sizes_set_T_1[31:0] : 32'h00000000)) & ~(_GEN_101 ? _d_sizes_clr_T_5[31:0] : 32'h00000000);
			if (_a_first_T_1 | _d_first_T_3)
				watchdog <= 32'h00000000;
			else
				watchdog <= watchdog + 32'h00000001;
			inflight_1 <= (inflight_1 | (_GEN_6 ? 4'h1 << _GEN_5 : 4'h0)) & ~(_GEN_103 ? 4'h1 << _GEN_3 : 4'h0);
			inflight_sizes_1 <= (inflight_sizes_1 | (_GEN_6 ? _c_sizes_set_T_1[31:0] : 32'h00000000)) & ~(_GEN_103 ? _d_sizes_clr_T_11[31:0] : 32'h00000000);
			if (_c_first_T_1 | _d_first_T_3)
				watchdog_1 <= 32'h00000000;
			else
				watchdog_1 <= watchdog_1 + 32'h00000001;
			inflight_2 <= (inflight_2 | d_set) & ~(_GEN_9 ? 4'h1 << _GEN_10 : 4'h0);
		end
		if (_a_first_T_1 & ~(|a_first_counter)) begin
			opcode <= io_in_a_bits_opcode;
			param <= io_in_a_bits_param;
			size <= io_in_a_bits_size;
			source <= io_in_a_bits_source;
			address <= io_in_a_bits_address;
		end
		if (_d_first_T_3 & ~(|d_first_counter)) begin
			opcode_1 <= io_in_d_bits_opcode;
			param_1 <= io_in_d_bits_param;
			size_1 <= io_in_d_bits_size;
			source_1 <= io_in_d_bits_source;
			sink <= io_in_d_bits_sink;
			denied <= io_in_d_bits_denied;
		end
		if (b_first_done & ~(|b_first_counter)) begin
			opcode_2 <= io_in_b_bits_opcode;
			param_2 <= io_in_b_bits_param;
			size_2 <= io_in_b_bits_size;
			source_2 <= io_in_b_bits_source;
			address_1 <= io_in_b_bits_address;
		end
		if (_c_first_T_1 & ~(|c_first_counter)) begin
			opcode_3 <= io_in_c_bits_opcode;
			param_3 <= io_in_c_bits_param;
			size_3 <= io_in_c_bits_size;
			source_3 <= io_in_c_bits_source;
			address_2 <= io_in_c_bits_address;
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
