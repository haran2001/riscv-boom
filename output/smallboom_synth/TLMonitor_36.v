module TLMonitor_36 (
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
	input [8:0] io_in_a_bits_source;
	input [11:0] io_in_a_bits_address;
	input [7:0] io_in_a_bits_mask;
	input io_in_a_bits_corrupt;
	input io_in_d_ready;
	input io_in_d_valid;
	input [2:0] io_in_d_bits_opcode;
	input [1:0] io_in_d_bits_size;
	input [8:0] io_in_d_bits_source;
	wire [31:0] _plusarg_reader_1_out;
	wire [31:0] _plusarg_reader_out;
	wire a_first_done = io_in_a_ready & io_in_a_valid;
	reg a_first_counter;
	reg [2:0] opcode;
	reg [2:0] param;
	reg [1:0] size;
	reg [8:0] source;
	reg [11:0] address;
	reg d_first_counter;
	reg [2:0] opcode_1;
	reg [1:0] size_1;
	reg [8:0] source_1;
	reg [335:0] inflight;
	reg [1343:0] inflight_opcodes;
	reg [1343:0] inflight_sizes;
	reg a_first_counter_1;
	reg d_first_counter_1;
	wire _GEN = a_first_done & ~a_first_counter_1;
	wire d_release_ack = io_in_d_bits_opcode == 3'h6;
	reg [31:0] watchdog;
	reg [335:0] inflight_1;
	reg [1343:0] inflight_sizes_1;
	reg d_first_counter_2;
	reg [31:0] watchdog_1;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg d_first_done;
		d_first_done = io_in_d_ready & io_in_d_valid;
		if (reset) begin
			a_first_counter <= 1'h0;
			d_first_counter <= 1'h0;
			inflight <= 336'h0;
			inflight_opcodes <= 1344'h0;
			inflight_sizes <= 1344'h0;
			a_first_counter_1 <= 1'h0;
			d_first_counter_1 <= 1'h0;
			watchdog <= 32'h00000000;
			inflight_1 <= 336'h0;
			inflight_sizes_1 <= 1344'h0;
			d_first_counter_2 <= 1'h0;
			watchdog_1 <= 32'h00000000;
		end
		else begin : sv2v_autoblock_2
			reg _GEN_33;
			reg [511:0] _GEN_34;
			reg [4110:0] _GEN_35;
			reg _GEN_36;
			reg [511:0] _d_clr_T;
			reg [511:0] _a_set_T;
			reg [4110:0] _d_opcodes_clr_T_5;
			reg [4098:0] _a_opcodes_set_T_1;
			reg [4110:0] _d_sizes_clr_T_5;
			reg [4097:0] _a_sizes_set_T_1;
			reg [511:0] _d_clr_T_1;
			reg [4110:0] _d_sizes_clr_T_11;
			_GEN_34 = {503'h0, io_in_d_bits_source};
			_GEN_35 = {4100'h0, io_in_d_bits_source, 2'h0};
			_d_clr_T = 512'h1 << _GEN_34;
			_a_set_T = 512'h1 << io_in_a_bits_source;
			_d_opcodes_clr_T_5 = 4111'hf << _GEN_35;
			_a_opcodes_set_T_1 = {4095'h0, (_GEN ? {io_in_a_bits_opcode, 1'h1} : 4'h0)} << {4088'h0, io_in_a_bits_source, 2'h0};
			_d_sizes_clr_T_5 = 4111'hf << _GEN_35;
			_a_sizes_set_T_1 = {4095'h0, (_GEN ? {io_in_a_bits_size, 1'h1} : 3'h0)} << {4087'h0, io_in_a_bits_source, 2'h0};
			_d_clr_T_1 = 512'h1 << _GEN_34;
			_d_sizes_clr_T_11 = 4111'hf << _GEN_35;
			_GEN_33 = (d_first_done & ~d_first_counter_1) & ~d_release_ack;
			_GEN_36 = (d_first_done & ~d_first_counter_2) & d_release_ack;
			a_first_counter <= (~a_first_done | (a_first_counter - 1'h1)) & a_first_counter;
			d_first_counter <= (~d_first_done | (d_first_counter - 1'h1)) & d_first_counter;
			inflight <= (inflight | (_GEN ? _a_set_T[335:0] : 336'h0)) & ~(_GEN_33 ? _d_clr_T[335:0] : 336'h0);
			inflight_opcodes <= (inflight_opcodes | (_GEN ? _a_opcodes_set_T_1[1343:0] : 1344'h0)) & ~(_GEN_33 ? _d_opcodes_clr_T_5[1343:0] : 1344'h0);
			inflight_sizes <= (inflight_sizes | (_GEN ? _a_sizes_set_T_1[1343:0] : 1344'h0)) & ~(_GEN_33 ? _d_sizes_clr_T_5[1343:0] : 1344'h0);
			a_first_counter_1 <= (~a_first_done | (a_first_counter_1 - 1'h1)) & a_first_counter_1;
			d_first_counter_1 <= (~d_first_done | (d_first_counter_1 - 1'h1)) & d_first_counter_1;
			if (a_first_done | d_first_done)
				watchdog <= 32'h00000000;
			else
				watchdog <= watchdog + 32'h00000001;
			inflight_1 <= inflight_1 & ~(_GEN_36 ? _d_clr_T_1[335:0] : 336'h0);
			inflight_sizes_1 <= inflight_sizes_1 & ~(_GEN_36 ? _d_sizes_clr_T_11[1343:0] : 1344'h0);
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
