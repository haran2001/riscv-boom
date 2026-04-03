module TLError (
	clock,
	reset,
	auto_in_a_ready,
	auto_in_a_valid,
	auto_in_a_bits_opcode,
	auto_in_a_bits_param,
	auto_in_a_bits_size,
	auto_in_a_bits_source,
	auto_in_a_bits_address,
	auto_in_a_bits_mask,
	auto_in_a_bits_data,
	auto_in_a_bits_corrupt,
	auto_in_d_ready,
	auto_in_d_valid,
	auto_in_d_bits_opcode,
	auto_in_d_bits_size,
	auto_in_d_bits_source,
	auto_in_d_bits_corrupt
);
	input clock;
	input reset;
	output wire auto_in_a_ready;
	input auto_in_a_valid;
	input [2:0] auto_in_a_bits_opcode;
	input [2:0] auto_in_a_bits_param;
	input [3:0] auto_in_a_bits_size;
	input [4:0] auto_in_a_bits_source;
	input [13:0] auto_in_a_bits_address;
	input [7:0] auto_in_a_bits_mask;
	input [63:0] auto_in_a_bits_data;
	input auto_in_a_bits_corrupt;
	input auto_in_d_ready;
	output wire auto_in_d_valid;
	output wire [2:0] auto_in_d_bits_opcode;
	output wire [3:0] auto_in_d_bits_size;
	output wire [4:0] auto_in_d_bits_source;
	output wire auto_in_d_bits_corrupt;
	wire [2:0] da_bits_opcode;
	wire _a_q_io_enq_ready;
	wire _a_q_io_deq_valid;
	wire [2:0] _a_q_io_deq_bits_opcode;
	wire [3:0] _a_q_io_deq_bits_size;
	wire [4:0] _a_q_io_deq_bits_source;
	wire [23:0] _GEN = 24'h911240;
	wire [26:0] _GEN_0 = {23'h000000, _a_q_io_deq_bits_size};
	wire [26:0] _a_last_beats1_decode_T = 27'h0000fff << _GEN_0;
	wire [8:0] a_last_beats1 = (_a_q_io_deq_bits_opcode[2] ? 9'h000 : ~_a_last_beats1_decode_T[11:3]);
	reg [8:0] a_last_counter;
	wire a_last = (a_last_counter == 9'h001) | (a_last_beats1 == 9'h000);
	wire [26:0] _r_beats1_decode_T = 27'h0000fff << _GEN_0;
	wire [8:0] r_beats1 = (da_bits_opcode[0] ? ~_r_beats1_decode_T[11:3] : 9'h000);
	reg [8:0] r_counter;
	wire _q_io_deq_ready_T_3 = (auto_in_d_ready & ((r_counter == 9'h001) | (r_beats1 == 9'h000))) | ~a_last;
	wire da_valid = _a_q_io_deq_valid & a_last;
	assign da_bits_opcode = _GEN[_a_q_io_deq_bits_opcode * 3+:3];
	always @(posedge clock)
		if (reset) begin
			a_last_counter <= 9'h000;
			r_counter <= 9'h000;
		end
		else begin
			if (_q_io_deq_ready_T_3 & _a_q_io_deq_valid) begin
				if (a_last_counter == 9'h000)
					a_last_counter <= a_last_beats1;
				else
					a_last_counter <= a_last_counter - 9'h001;
			end
			if (auto_in_d_ready & da_valid) begin
				if (r_counter == 9'h000)
					r_counter <= r_beats1;
				else
					r_counter <= r_counter - 9'h001;
			end
		end
	TLMonitor_12 monitor(
		.clock(clock),
		.reset(reset),
		.io_in_a_ready(_a_q_io_enq_ready),
		.io_in_a_valid(auto_in_a_valid),
		.io_in_a_bits_opcode(auto_in_a_bits_opcode),
		.io_in_a_bits_param(auto_in_a_bits_param),
		.io_in_a_bits_size(auto_in_a_bits_size),
		.io_in_a_bits_source(auto_in_a_bits_source),
		.io_in_a_bits_address(auto_in_a_bits_address),
		.io_in_a_bits_mask(auto_in_a_bits_mask),
		.io_in_a_bits_corrupt(auto_in_a_bits_corrupt),
		.io_in_d_ready(auto_in_d_ready),
		.io_in_d_valid(da_valid),
		.io_in_d_bits_opcode(da_bits_opcode),
		.io_in_d_bits_size(_a_q_io_deq_bits_size),
		.io_in_d_bits_source(_a_q_io_deq_bits_source),
		.io_in_d_bits_corrupt(da_bits_opcode[0])
	);
	Queue1_TLBundleA_a14d64s5k1z4u a_q(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_a_q_io_enq_ready),
		.io_enq_valid(auto_in_a_valid),
		.io_enq_bits_opcode(auto_in_a_bits_opcode),
		.io_enq_bits_param(auto_in_a_bits_param),
		.io_enq_bits_size(auto_in_a_bits_size),
		.io_enq_bits_source(auto_in_a_bits_source),
		.io_enq_bits_address(auto_in_a_bits_address),
		.io_enq_bits_mask(auto_in_a_bits_mask),
		.io_enq_bits_data(auto_in_a_bits_data),
		.io_enq_bits_corrupt(auto_in_a_bits_corrupt),
		.io_deq_ready(_q_io_deq_ready_T_3),
		.io_deq_valid(_a_q_io_deq_valid),
		.io_deq_bits_opcode(_a_q_io_deq_bits_opcode),
		.io_deq_bits_size(_a_q_io_deq_bits_size),
		.io_deq_bits_source(_a_q_io_deq_bits_source)
	);
	assign auto_in_a_ready = _a_q_io_enq_ready;
	assign auto_in_d_valid = da_valid;
	assign auto_in_d_bits_opcode = da_bits_opcode;
	assign auto_in_d_bits_size = _a_q_io_deq_bits_size;
	assign auto_in_d_bits_source = _a_q_io_deq_bits_source;
	assign auto_in_d_bits_corrupt = da_bits_opcode[0];
endmodule
