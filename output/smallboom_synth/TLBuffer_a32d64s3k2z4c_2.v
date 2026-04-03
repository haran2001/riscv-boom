module TLBuffer_a32d64s3k2z4c_2 (
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
	auto_in_b_ready,
	auto_in_b_valid,
	auto_in_b_bits_opcode,
	auto_in_b_bits_param,
	auto_in_b_bits_size,
	auto_in_b_bits_source,
	auto_in_b_bits_address,
	auto_in_b_bits_mask,
	auto_in_b_bits_data,
	auto_in_b_bits_corrupt,
	auto_in_c_ready,
	auto_in_c_valid,
	auto_in_c_bits_opcode,
	auto_in_c_bits_param,
	auto_in_c_bits_size,
	auto_in_c_bits_source,
	auto_in_c_bits_address,
	auto_in_c_bits_data,
	auto_in_c_bits_corrupt,
	auto_in_d_ready,
	auto_in_d_valid,
	auto_in_d_bits_opcode,
	auto_in_d_bits_param,
	auto_in_d_bits_size,
	auto_in_d_bits_source,
	auto_in_d_bits_sink,
	auto_in_d_bits_denied,
	auto_in_d_bits_data,
	auto_in_d_bits_corrupt,
	auto_in_e_ready,
	auto_in_e_valid,
	auto_in_e_bits_sink,
	auto_out_a_ready,
	auto_out_a_valid,
	auto_out_a_bits_opcode,
	auto_out_a_bits_param,
	auto_out_a_bits_size,
	auto_out_a_bits_source,
	auto_out_a_bits_address,
	auto_out_a_bits_mask,
	auto_out_a_bits_data,
	auto_out_a_bits_corrupt,
	auto_out_b_ready,
	auto_out_b_valid,
	auto_out_b_bits_param,
	auto_out_b_bits_address,
	auto_out_c_ready,
	auto_out_c_valid,
	auto_out_c_bits_opcode,
	auto_out_c_bits_param,
	auto_out_c_bits_size,
	auto_out_c_bits_source,
	auto_out_c_bits_address,
	auto_out_c_bits_data,
	auto_out_c_bits_corrupt,
	auto_out_d_ready,
	auto_out_d_valid,
	auto_out_d_bits_opcode,
	auto_out_d_bits_param,
	auto_out_d_bits_size,
	auto_out_d_bits_source,
	auto_out_d_bits_sink,
	auto_out_d_bits_denied,
	auto_out_d_bits_data,
	auto_out_d_bits_corrupt,
	auto_out_e_valid,
	auto_out_e_bits_sink
);
	input clock;
	input reset;
	output wire auto_in_a_ready;
	input auto_in_a_valid;
	input [2:0] auto_in_a_bits_opcode;
	input [2:0] auto_in_a_bits_param;
	input [3:0] auto_in_a_bits_size;
	input [2:0] auto_in_a_bits_source;
	input [31:0] auto_in_a_bits_address;
	input [7:0] auto_in_a_bits_mask;
	input [63:0] auto_in_a_bits_data;
	input auto_in_a_bits_corrupt;
	input auto_in_b_ready;
	output wire auto_in_b_valid;
	output wire [2:0] auto_in_b_bits_opcode;
	output wire [1:0] auto_in_b_bits_param;
	output wire [3:0] auto_in_b_bits_size;
	output wire [2:0] auto_in_b_bits_source;
	output wire [31:0] auto_in_b_bits_address;
	output wire [7:0] auto_in_b_bits_mask;
	output wire [63:0] auto_in_b_bits_data;
	output wire auto_in_b_bits_corrupt;
	output wire auto_in_c_ready;
	input auto_in_c_valid;
	input [2:0] auto_in_c_bits_opcode;
	input [2:0] auto_in_c_bits_param;
	input [3:0] auto_in_c_bits_size;
	input [2:0] auto_in_c_bits_source;
	input [31:0] auto_in_c_bits_address;
	input [63:0] auto_in_c_bits_data;
	input auto_in_c_bits_corrupt;
	input auto_in_d_ready;
	output wire auto_in_d_valid;
	output wire [2:0] auto_in_d_bits_opcode;
	output wire [1:0] auto_in_d_bits_param;
	output wire [3:0] auto_in_d_bits_size;
	output wire [2:0] auto_in_d_bits_source;
	output wire [1:0] auto_in_d_bits_sink;
	output wire auto_in_d_bits_denied;
	output wire [63:0] auto_in_d_bits_data;
	output wire auto_in_d_bits_corrupt;
	output wire auto_in_e_ready;
	input auto_in_e_valid;
	input [1:0] auto_in_e_bits_sink;
	input auto_out_a_ready;
	output wire auto_out_a_valid;
	output wire [2:0] auto_out_a_bits_opcode;
	output wire [2:0] auto_out_a_bits_param;
	output wire [3:0] auto_out_a_bits_size;
	output wire [2:0] auto_out_a_bits_source;
	output wire [31:0] auto_out_a_bits_address;
	output wire [7:0] auto_out_a_bits_mask;
	output wire [63:0] auto_out_a_bits_data;
	output wire auto_out_a_bits_corrupt;
	output wire auto_out_b_ready;
	input auto_out_b_valid;
	input [1:0] auto_out_b_bits_param;
	input [31:0] auto_out_b_bits_address;
	input auto_out_c_ready;
	output wire auto_out_c_valid;
	output wire [2:0] auto_out_c_bits_opcode;
	output wire [2:0] auto_out_c_bits_param;
	output wire [3:0] auto_out_c_bits_size;
	output wire [2:0] auto_out_c_bits_source;
	output wire [31:0] auto_out_c_bits_address;
	output wire [63:0] auto_out_c_bits_data;
	output wire auto_out_c_bits_corrupt;
	output wire auto_out_d_ready;
	input auto_out_d_valid;
	input [2:0] auto_out_d_bits_opcode;
	input [1:0] auto_out_d_bits_param;
	input [3:0] auto_out_d_bits_size;
	input [2:0] auto_out_d_bits_source;
	input [1:0] auto_out_d_bits_sink;
	input auto_out_d_bits_denied;
	input [63:0] auto_out_d_bits_data;
	input auto_out_d_bits_corrupt;
	output wire auto_out_e_valid;
	output wire [1:0] auto_out_e_bits_sink;
	wire _nodeOut_e_q_io_enq_ready;
	wire _nodeOut_c_q_io_enq_ready;
	wire _nodeIn_b_q_io_deq_valid;
	wire [2:0] _nodeIn_b_q_io_deq_bits_opcode;
	wire [1:0] _nodeIn_b_q_io_deq_bits_param;
	wire [3:0] _nodeIn_b_q_io_deq_bits_size;
	wire [2:0] _nodeIn_b_q_io_deq_bits_source;
	wire [31:0] _nodeIn_b_q_io_deq_bits_address;
	wire [7:0] _nodeIn_b_q_io_deq_bits_mask;
	wire _nodeIn_b_q_io_deq_bits_corrupt;
	wire _nodeIn_d_q_io_deq_valid;
	wire [2:0] _nodeIn_d_q_io_deq_bits_opcode;
	wire [1:0] _nodeIn_d_q_io_deq_bits_param;
	wire [3:0] _nodeIn_d_q_io_deq_bits_size;
	wire [2:0] _nodeIn_d_q_io_deq_bits_source;
	wire [1:0] _nodeIn_d_q_io_deq_bits_sink;
	wire _nodeIn_d_q_io_deq_bits_denied;
	wire _nodeIn_d_q_io_deq_bits_corrupt;
	wire _nodeOut_a_q_io_enq_ready;
	TLMonitor_27 monitor(
		.clock(clock),
		.reset(reset),
		.io_in_a_ready(_nodeOut_a_q_io_enq_ready),
		.io_in_a_valid(auto_in_a_valid),
		.io_in_a_bits_opcode(auto_in_a_bits_opcode),
		.io_in_a_bits_param(auto_in_a_bits_param),
		.io_in_a_bits_size(auto_in_a_bits_size),
		.io_in_a_bits_source(auto_in_a_bits_source),
		.io_in_a_bits_address(auto_in_a_bits_address),
		.io_in_a_bits_mask(auto_in_a_bits_mask),
		.io_in_a_bits_corrupt(auto_in_a_bits_corrupt),
		.io_in_b_ready(auto_in_b_ready),
		.io_in_b_valid(_nodeIn_b_q_io_deq_valid),
		.io_in_b_bits_opcode(_nodeIn_b_q_io_deq_bits_opcode),
		.io_in_b_bits_param(_nodeIn_b_q_io_deq_bits_param),
		.io_in_b_bits_size(_nodeIn_b_q_io_deq_bits_size),
		.io_in_b_bits_source(_nodeIn_b_q_io_deq_bits_source),
		.io_in_b_bits_address(_nodeIn_b_q_io_deq_bits_address),
		.io_in_b_bits_mask(_nodeIn_b_q_io_deq_bits_mask),
		.io_in_b_bits_corrupt(_nodeIn_b_q_io_deq_bits_corrupt),
		.io_in_c_ready(_nodeOut_c_q_io_enq_ready),
		.io_in_c_valid(auto_in_c_valid),
		.io_in_c_bits_opcode(auto_in_c_bits_opcode),
		.io_in_c_bits_param(auto_in_c_bits_param),
		.io_in_c_bits_size(auto_in_c_bits_size),
		.io_in_c_bits_source(auto_in_c_bits_source),
		.io_in_c_bits_address(auto_in_c_bits_address),
		.io_in_c_bits_corrupt(auto_in_c_bits_corrupt),
		.io_in_d_ready(auto_in_d_ready),
		.io_in_d_valid(_nodeIn_d_q_io_deq_valid),
		.io_in_d_bits_opcode(_nodeIn_d_q_io_deq_bits_opcode),
		.io_in_d_bits_param(_nodeIn_d_q_io_deq_bits_param),
		.io_in_d_bits_size(_nodeIn_d_q_io_deq_bits_size),
		.io_in_d_bits_source(_nodeIn_d_q_io_deq_bits_source),
		.io_in_d_bits_sink(_nodeIn_d_q_io_deq_bits_sink),
		.io_in_d_bits_denied(_nodeIn_d_q_io_deq_bits_denied),
		.io_in_d_bits_corrupt(_nodeIn_d_q_io_deq_bits_corrupt),
		.io_in_e_ready(_nodeOut_e_q_io_enq_ready),
		.io_in_e_valid(auto_in_e_valid),
		.io_in_e_bits_sink(auto_in_e_bits_sink)
	);
	Queue2_TLBundleA_a32d64s3k2z4c nodeOut_a_q(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_nodeOut_a_q_io_enq_ready),
		.io_enq_valid(auto_in_a_valid),
		.io_enq_bits_opcode(auto_in_a_bits_opcode),
		.io_enq_bits_param(auto_in_a_bits_param),
		.io_enq_bits_size(auto_in_a_bits_size),
		.io_enq_bits_source(auto_in_a_bits_source),
		.io_enq_bits_address(auto_in_a_bits_address),
		.io_enq_bits_mask(auto_in_a_bits_mask),
		.io_enq_bits_data(auto_in_a_bits_data),
		.io_enq_bits_corrupt(auto_in_a_bits_corrupt),
		.io_deq_ready(auto_out_a_ready),
		.io_deq_valid(auto_out_a_valid),
		.io_deq_bits_opcode(auto_out_a_bits_opcode),
		.io_deq_bits_param(auto_out_a_bits_param),
		.io_deq_bits_size(auto_out_a_bits_size),
		.io_deq_bits_source(auto_out_a_bits_source),
		.io_deq_bits_address(auto_out_a_bits_address),
		.io_deq_bits_mask(auto_out_a_bits_mask),
		.io_deq_bits_data(auto_out_a_bits_data),
		.io_deq_bits_corrupt(auto_out_a_bits_corrupt)
	);
	Queue2_TLBundleD_a32d64s3k2z4c nodeIn_d_q(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(auto_out_d_ready),
		.io_enq_valid(auto_out_d_valid),
		.io_enq_bits_opcode(auto_out_d_bits_opcode),
		.io_enq_bits_param(auto_out_d_bits_param),
		.io_enq_bits_size(auto_out_d_bits_size),
		.io_enq_bits_source(auto_out_d_bits_source),
		.io_enq_bits_sink(auto_out_d_bits_sink),
		.io_enq_bits_denied(auto_out_d_bits_denied),
		.io_enq_bits_data(auto_out_d_bits_data),
		.io_enq_bits_corrupt(auto_out_d_bits_corrupt),
		.io_deq_ready(auto_in_d_ready),
		.io_deq_valid(_nodeIn_d_q_io_deq_valid),
		.io_deq_bits_opcode(_nodeIn_d_q_io_deq_bits_opcode),
		.io_deq_bits_param(_nodeIn_d_q_io_deq_bits_param),
		.io_deq_bits_size(_nodeIn_d_q_io_deq_bits_size),
		.io_deq_bits_source(_nodeIn_d_q_io_deq_bits_source),
		.io_deq_bits_sink(_nodeIn_d_q_io_deq_bits_sink),
		.io_deq_bits_denied(_nodeIn_d_q_io_deq_bits_denied),
		.io_deq_bits_data(auto_in_d_bits_data),
		.io_deq_bits_corrupt(_nodeIn_d_q_io_deq_bits_corrupt)
	);
	Queue2_TLBundleB_a32d64s3k2z4c nodeIn_b_q(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(auto_out_b_ready),
		.io_enq_valid(auto_out_b_valid),
		.io_enq_bits_opcode(3'h6),
		.io_enq_bits_param(auto_out_b_bits_param),
		.io_enq_bits_size(4'h6),
		.io_enq_bits_source(3'h0),
		.io_enq_bits_address(auto_out_b_bits_address),
		.io_enq_bits_mask(8'hff),
		.io_enq_bits_data(64'h0000000000000000),
		.io_enq_bits_corrupt(1'h0),
		.io_deq_ready(auto_in_b_ready),
		.io_deq_valid(_nodeIn_b_q_io_deq_valid),
		.io_deq_bits_opcode(_nodeIn_b_q_io_deq_bits_opcode),
		.io_deq_bits_param(_nodeIn_b_q_io_deq_bits_param),
		.io_deq_bits_size(_nodeIn_b_q_io_deq_bits_size),
		.io_deq_bits_source(_nodeIn_b_q_io_deq_bits_source),
		.io_deq_bits_address(_nodeIn_b_q_io_deq_bits_address),
		.io_deq_bits_mask(_nodeIn_b_q_io_deq_bits_mask),
		.io_deq_bits_data(auto_in_b_bits_data),
		.io_deq_bits_corrupt(_nodeIn_b_q_io_deq_bits_corrupt)
	);
	Queue2_TLBundleC_a32d64s3k2z4c nodeOut_c_q(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_nodeOut_c_q_io_enq_ready),
		.io_enq_valid(auto_in_c_valid),
		.io_enq_bits_opcode(auto_in_c_bits_opcode),
		.io_enq_bits_param(auto_in_c_bits_param),
		.io_enq_bits_size(auto_in_c_bits_size),
		.io_enq_bits_source(auto_in_c_bits_source),
		.io_enq_bits_address(auto_in_c_bits_address),
		.io_enq_bits_data(auto_in_c_bits_data),
		.io_enq_bits_corrupt(auto_in_c_bits_corrupt),
		.io_deq_ready(auto_out_c_ready),
		.io_deq_valid(auto_out_c_valid),
		.io_deq_bits_opcode(auto_out_c_bits_opcode),
		.io_deq_bits_param(auto_out_c_bits_param),
		.io_deq_bits_size(auto_out_c_bits_size),
		.io_deq_bits_source(auto_out_c_bits_source),
		.io_deq_bits_address(auto_out_c_bits_address),
		.io_deq_bits_data(auto_out_c_bits_data),
		.io_deq_bits_corrupt(auto_out_c_bits_corrupt)
	);
	Queue2_TLBundleE_a32d64s3k2z4c nodeOut_e_q(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_nodeOut_e_q_io_enq_ready),
		.io_enq_valid(auto_in_e_valid),
		.io_enq_bits_sink(auto_in_e_bits_sink),
		.io_deq_ready(1'h1),
		.io_deq_valid(auto_out_e_valid),
		.io_deq_bits_sink(auto_out_e_bits_sink)
	);
	assign auto_in_a_ready = _nodeOut_a_q_io_enq_ready;
	assign auto_in_b_valid = _nodeIn_b_q_io_deq_valid;
	assign auto_in_b_bits_opcode = _nodeIn_b_q_io_deq_bits_opcode;
	assign auto_in_b_bits_param = _nodeIn_b_q_io_deq_bits_param;
	assign auto_in_b_bits_size = _nodeIn_b_q_io_deq_bits_size;
	assign auto_in_b_bits_source = _nodeIn_b_q_io_deq_bits_source;
	assign auto_in_b_bits_address = _nodeIn_b_q_io_deq_bits_address;
	assign auto_in_b_bits_mask = _nodeIn_b_q_io_deq_bits_mask;
	assign auto_in_b_bits_corrupt = _nodeIn_b_q_io_deq_bits_corrupt;
	assign auto_in_c_ready = _nodeOut_c_q_io_enq_ready;
	assign auto_in_d_valid = _nodeIn_d_q_io_deq_valid;
	assign auto_in_d_bits_opcode = _nodeIn_d_q_io_deq_bits_opcode;
	assign auto_in_d_bits_param = _nodeIn_d_q_io_deq_bits_param;
	assign auto_in_d_bits_size = _nodeIn_d_q_io_deq_bits_size;
	assign auto_in_d_bits_source = _nodeIn_d_q_io_deq_bits_source;
	assign auto_in_d_bits_sink = _nodeIn_d_q_io_deq_bits_sink;
	assign auto_in_d_bits_denied = _nodeIn_d_q_io_deq_bits_denied;
	assign auto_in_d_bits_corrupt = _nodeIn_d_q_io_deq_bits_corrupt;
	assign auto_in_e_ready = _nodeOut_e_q_io_enq_ready;
endmodule
