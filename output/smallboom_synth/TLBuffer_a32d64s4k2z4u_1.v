module TLBuffer_a32d64s4k2z4u_1 (
	clock,
	reset,
	auto_in_a_ready,
	auto_in_a_valid,
	auto_in_a_bits_opcode,
	auto_in_a_bits_size,
	auto_in_a_bits_source,
	auto_in_a_bits_address,
	auto_in_a_bits_user_amba_prot_bufferable,
	auto_in_a_bits_user_amba_prot_modifiable,
	auto_in_a_bits_user_amba_prot_readalloc,
	auto_in_a_bits_user_amba_prot_writealloc,
	auto_in_a_bits_user_amba_prot_privileged,
	auto_in_a_bits_user_amba_prot_secure,
	auto_in_a_bits_user_amba_prot_fetch,
	auto_in_a_bits_mask,
	auto_in_a_bits_data,
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
	auto_out_a_ready,
	auto_out_a_valid,
	auto_out_a_bits_opcode,
	auto_out_a_bits_param,
	auto_out_a_bits_size,
	auto_out_a_bits_source,
	auto_out_a_bits_address,
	auto_out_a_bits_user_amba_prot_bufferable,
	auto_out_a_bits_user_amba_prot_modifiable,
	auto_out_a_bits_user_amba_prot_readalloc,
	auto_out_a_bits_user_amba_prot_writealloc,
	auto_out_a_bits_user_amba_prot_privileged,
	auto_out_a_bits_user_amba_prot_secure,
	auto_out_a_bits_user_amba_prot_fetch,
	auto_out_a_bits_mask,
	auto_out_a_bits_data,
	auto_out_a_bits_corrupt,
	auto_out_d_ready,
	auto_out_d_valid,
	auto_out_d_bits_opcode,
	auto_out_d_bits_param,
	auto_out_d_bits_size,
	auto_out_d_bits_source,
	auto_out_d_bits_sink,
	auto_out_d_bits_denied,
	auto_out_d_bits_data,
	auto_out_d_bits_corrupt
);
	input clock;
	input reset;
	output wire auto_in_a_ready;
	input auto_in_a_valid;
	input [2:0] auto_in_a_bits_opcode;
	input [3:0] auto_in_a_bits_size;
	input [3:0] auto_in_a_bits_source;
	input [31:0] auto_in_a_bits_address;
	input auto_in_a_bits_user_amba_prot_bufferable;
	input auto_in_a_bits_user_amba_prot_modifiable;
	input auto_in_a_bits_user_amba_prot_readalloc;
	input auto_in_a_bits_user_amba_prot_writealloc;
	input auto_in_a_bits_user_amba_prot_privileged;
	input auto_in_a_bits_user_amba_prot_secure;
	input auto_in_a_bits_user_amba_prot_fetch;
	input [7:0] auto_in_a_bits_mask;
	input [63:0] auto_in_a_bits_data;
	input auto_in_d_ready;
	output wire auto_in_d_valid;
	output wire [2:0] auto_in_d_bits_opcode;
	output wire [1:0] auto_in_d_bits_param;
	output wire [3:0] auto_in_d_bits_size;
	output wire [3:0] auto_in_d_bits_source;
	output wire [1:0] auto_in_d_bits_sink;
	output wire auto_in_d_bits_denied;
	output wire [63:0] auto_in_d_bits_data;
	output wire auto_in_d_bits_corrupt;
	input auto_out_a_ready;
	output wire auto_out_a_valid;
	output wire [2:0] auto_out_a_bits_opcode;
	output wire [2:0] auto_out_a_bits_param;
	output wire [3:0] auto_out_a_bits_size;
	output wire [3:0] auto_out_a_bits_source;
	output wire [31:0] auto_out_a_bits_address;
	output wire auto_out_a_bits_user_amba_prot_bufferable;
	output wire auto_out_a_bits_user_amba_prot_modifiable;
	output wire auto_out_a_bits_user_amba_prot_readalloc;
	output wire auto_out_a_bits_user_amba_prot_writealloc;
	output wire auto_out_a_bits_user_amba_prot_privileged;
	output wire auto_out_a_bits_user_amba_prot_secure;
	output wire auto_out_a_bits_user_amba_prot_fetch;
	output wire [7:0] auto_out_a_bits_mask;
	output wire [63:0] auto_out_a_bits_data;
	output wire auto_out_a_bits_corrupt;
	output wire auto_out_d_ready;
	input auto_out_d_valid;
	input [2:0] auto_out_d_bits_opcode;
	input [1:0] auto_out_d_bits_param;
	input [3:0] auto_out_d_bits_size;
	input [3:0] auto_out_d_bits_source;
	input [1:0] auto_out_d_bits_sink;
	input auto_out_d_bits_denied;
	input [63:0] auto_out_d_bits_data;
	input auto_out_d_bits_corrupt;
	wire _nodeIn_d_q_io_deq_valid;
	wire [2:0] _nodeIn_d_q_io_deq_bits_opcode;
	wire [1:0] _nodeIn_d_q_io_deq_bits_param;
	wire [3:0] _nodeIn_d_q_io_deq_bits_size;
	wire [3:0] _nodeIn_d_q_io_deq_bits_source;
	wire [1:0] _nodeIn_d_q_io_deq_bits_sink;
	wire _nodeIn_d_q_io_deq_bits_denied;
	wire _nodeIn_d_q_io_deq_bits_corrupt;
	wire _nodeOut_a_q_io_enq_ready;
	TLMonitor_6 monitor(
		.clock(clock),
		.reset(reset),
		.io_in_a_ready(_nodeOut_a_q_io_enq_ready),
		.io_in_a_valid(auto_in_a_valid),
		.io_in_a_bits_opcode(auto_in_a_bits_opcode),
		.io_in_a_bits_size(auto_in_a_bits_size),
		.io_in_a_bits_source(auto_in_a_bits_source),
		.io_in_a_bits_address(auto_in_a_bits_address),
		.io_in_a_bits_mask(auto_in_a_bits_mask),
		.io_in_d_ready(auto_in_d_ready),
		.io_in_d_valid(_nodeIn_d_q_io_deq_valid),
		.io_in_d_bits_opcode(_nodeIn_d_q_io_deq_bits_opcode),
		.io_in_d_bits_param(_nodeIn_d_q_io_deq_bits_param),
		.io_in_d_bits_size(_nodeIn_d_q_io_deq_bits_size),
		.io_in_d_bits_source(_nodeIn_d_q_io_deq_bits_source),
		.io_in_d_bits_sink(_nodeIn_d_q_io_deq_bits_sink),
		.io_in_d_bits_denied(_nodeIn_d_q_io_deq_bits_denied),
		.io_in_d_bits_corrupt(_nodeIn_d_q_io_deq_bits_corrupt)
	);
	Queue2_TLBundleA_a32d64s4k2z4u nodeOut_a_q(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_nodeOut_a_q_io_enq_ready),
		.io_enq_valid(auto_in_a_valid),
		.io_enq_bits_opcode(auto_in_a_bits_opcode),
		.io_enq_bits_param(3'h0),
		.io_enq_bits_size(auto_in_a_bits_size),
		.io_enq_bits_source(auto_in_a_bits_source),
		.io_enq_bits_address(auto_in_a_bits_address),
		.io_enq_bits_user_amba_prot_bufferable(auto_in_a_bits_user_amba_prot_bufferable),
		.io_enq_bits_user_amba_prot_modifiable(auto_in_a_bits_user_amba_prot_modifiable),
		.io_enq_bits_user_amba_prot_readalloc(auto_in_a_bits_user_amba_prot_readalloc),
		.io_enq_bits_user_amba_prot_writealloc(auto_in_a_bits_user_amba_prot_writealloc),
		.io_enq_bits_user_amba_prot_privileged(auto_in_a_bits_user_amba_prot_privileged),
		.io_enq_bits_user_amba_prot_secure(auto_in_a_bits_user_amba_prot_secure),
		.io_enq_bits_user_amba_prot_fetch(auto_in_a_bits_user_amba_prot_fetch),
		.io_enq_bits_mask(auto_in_a_bits_mask),
		.io_enq_bits_data(auto_in_a_bits_data),
		.io_enq_bits_corrupt(1'h0),
		.io_deq_ready(auto_out_a_ready),
		.io_deq_valid(auto_out_a_valid),
		.io_deq_bits_opcode(auto_out_a_bits_opcode),
		.io_deq_bits_param(auto_out_a_bits_param),
		.io_deq_bits_size(auto_out_a_bits_size),
		.io_deq_bits_source(auto_out_a_bits_source),
		.io_deq_bits_address(auto_out_a_bits_address),
		.io_deq_bits_user_amba_prot_bufferable(auto_out_a_bits_user_amba_prot_bufferable),
		.io_deq_bits_user_amba_prot_modifiable(auto_out_a_bits_user_amba_prot_modifiable),
		.io_deq_bits_user_amba_prot_readalloc(auto_out_a_bits_user_amba_prot_readalloc),
		.io_deq_bits_user_amba_prot_writealloc(auto_out_a_bits_user_amba_prot_writealloc),
		.io_deq_bits_user_amba_prot_privileged(auto_out_a_bits_user_amba_prot_privileged),
		.io_deq_bits_user_amba_prot_secure(auto_out_a_bits_user_amba_prot_secure),
		.io_deq_bits_user_amba_prot_fetch(auto_out_a_bits_user_amba_prot_fetch),
		.io_deq_bits_mask(auto_out_a_bits_mask),
		.io_deq_bits_data(auto_out_a_bits_data),
		.io_deq_bits_corrupt(auto_out_a_bits_corrupt)
	);
	Queue2_TLBundleD_a32d64s4k2z4u nodeIn_d_q(
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
	assign auto_in_a_ready = _nodeOut_a_q_io_enq_ready;
	assign auto_in_d_valid = _nodeIn_d_q_io_deq_valid;
	assign auto_in_d_bits_opcode = _nodeIn_d_q_io_deq_bits_opcode;
	assign auto_in_d_bits_param = _nodeIn_d_q_io_deq_bits_param;
	assign auto_in_d_bits_size = _nodeIn_d_q_io_deq_bits_size;
	assign auto_in_d_bits_source = _nodeIn_d_q_io_deq_bits_source;
	assign auto_in_d_bits_sink = _nodeIn_d_q_io_deq_bits_sink;
	assign auto_in_d_bits_denied = _nodeIn_d_q_io_deq_bits_denied;
	assign auto_in_d_bits_corrupt = _nodeIn_d_q_io_deq_bits_corrupt;
endmodule
