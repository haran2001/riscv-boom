module ProbePicker (
	clock,
	reset,
	auto_in_a_ready,
	auto_in_a_valid,
	auto_in_a_bits_opcode,
	auto_in_a_bits_param,
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
	auto_in_d_bits_size,
	auto_in_d_bits_source,
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
	auto_out_d_ready,
	auto_out_d_valid,
	auto_out_d_bits_opcode,
	auto_out_d_bits_size,
	auto_out_d_bits_source,
	auto_out_d_bits_denied,
	auto_out_d_bits_data,
	auto_out_d_bits_corrupt
);
	input clock;
	input reset;
	output wire auto_in_a_ready;
	input auto_in_a_valid;
	input [2:0] auto_in_a_bits_opcode;
	input [2:0] auto_in_a_bits_param;
	input [2:0] auto_in_a_bits_size;
	input [6:0] auto_in_a_bits_source;
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
	output wire [2:0] auto_in_d_bits_size;
	output wire [6:0] auto_in_d_bits_source;
	output wire auto_in_d_bits_denied;
	output wire [63:0] auto_in_d_bits_data;
	output wire auto_in_d_bits_corrupt;
	input auto_out_a_ready;
	output wire auto_out_a_valid;
	output wire [2:0] auto_out_a_bits_opcode;
	output wire [2:0] auto_out_a_bits_param;
	output wire [2:0] auto_out_a_bits_size;
	output wire [6:0] auto_out_a_bits_source;
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
	output wire auto_out_d_ready;
	input auto_out_d_valid;
	input [2:0] auto_out_d_bits_opcode;
	input [2:0] auto_out_d_bits_size;
	input [6:0] auto_out_d_bits_source;
	input auto_out_d_bits_denied;
	input [63:0] auto_out_d_bits_data;
	input auto_out_d_bits_corrupt;
	TLMonitor_18 monitor(
		.clock(clock),
		.reset(reset),
		.io_in_a_ready(auto_out_a_ready),
		.io_in_a_valid(auto_in_a_valid),
		.io_in_a_bits_opcode(auto_in_a_bits_opcode),
		.io_in_a_bits_param(auto_in_a_bits_param),
		.io_in_a_bits_size(auto_in_a_bits_size),
		.io_in_a_bits_source(auto_in_a_bits_source),
		.io_in_a_bits_address(auto_in_a_bits_address),
		.io_in_a_bits_mask(auto_in_a_bits_mask),
		.io_in_d_ready(auto_in_d_ready),
		.io_in_d_valid(auto_out_d_valid),
		.io_in_d_bits_opcode(auto_out_d_bits_opcode),
		.io_in_d_bits_size(auto_out_d_bits_size),
		.io_in_d_bits_source(auto_out_d_bits_source),
		.io_in_d_bits_denied(auto_out_d_bits_denied),
		.io_in_d_bits_corrupt(auto_out_d_bits_corrupt)
	);
	assign auto_in_a_ready = auto_out_a_ready;
	assign auto_in_d_valid = auto_out_d_valid;
	assign auto_in_d_bits_opcode = auto_out_d_bits_opcode;
	assign auto_in_d_bits_size = auto_out_d_bits_size;
	assign auto_in_d_bits_source = auto_out_d_bits_source;
	assign auto_in_d_bits_denied = auto_out_d_bits_denied;
	assign auto_in_d_bits_data = auto_out_d_bits_data;
	assign auto_in_d_bits_corrupt = auto_out_d_bits_corrupt;
	assign auto_out_a_valid = auto_in_a_valid;
	assign auto_out_a_bits_opcode = auto_in_a_bits_opcode;
	assign auto_out_a_bits_param = auto_in_a_bits_param;
	assign auto_out_a_bits_size = auto_in_a_bits_size;
	assign auto_out_a_bits_source = auto_in_a_bits_source;
	assign auto_out_a_bits_address = auto_in_a_bits_address;
	assign auto_out_a_bits_user_amba_prot_bufferable = auto_in_a_bits_user_amba_prot_bufferable;
	assign auto_out_a_bits_user_amba_prot_modifiable = auto_in_a_bits_user_amba_prot_modifiable;
	assign auto_out_a_bits_user_amba_prot_readalloc = auto_in_a_bits_user_amba_prot_readalloc;
	assign auto_out_a_bits_user_amba_prot_writealloc = auto_in_a_bits_user_amba_prot_writealloc;
	assign auto_out_a_bits_user_amba_prot_privileged = auto_in_a_bits_user_amba_prot_privileged;
	assign auto_out_a_bits_user_amba_prot_secure = auto_in_a_bits_user_amba_prot_secure;
	assign auto_out_a_bits_user_amba_prot_fetch = auto_in_a_bits_user_amba_prot_fetch;
	assign auto_out_a_bits_mask = auto_in_a_bits_mask;
	assign auto_out_a_bits_data = auto_in_a_bits_data;
	assign auto_out_d_ready = auto_in_d_ready;
endmodule
