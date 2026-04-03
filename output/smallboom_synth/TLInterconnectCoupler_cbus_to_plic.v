module TLInterconnectCoupler_cbus_to_plic (
	clock,
	reset,
	auto_fragmenter_anon_out_a_ready,
	auto_fragmenter_anon_out_a_valid,
	auto_fragmenter_anon_out_a_bits_opcode,
	auto_fragmenter_anon_out_a_bits_param,
	auto_fragmenter_anon_out_a_bits_size,
	auto_fragmenter_anon_out_a_bits_source,
	auto_fragmenter_anon_out_a_bits_address,
	auto_fragmenter_anon_out_a_bits_mask,
	auto_fragmenter_anon_out_a_bits_data,
	auto_fragmenter_anon_out_a_bits_corrupt,
	auto_fragmenter_anon_out_d_ready,
	auto_fragmenter_anon_out_d_valid,
	auto_fragmenter_anon_out_d_bits_opcode,
	auto_fragmenter_anon_out_d_bits_size,
	auto_fragmenter_anon_out_d_bits_source,
	auto_fragmenter_anon_out_d_bits_data,
	auto_tl_in_a_ready,
	auto_tl_in_a_valid,
	auto_tl_in_a_bits_opcode,
	auto_tl_in_a_bits_param,
	auto_tl_in_a_bits_size,
	auto_tl_in_a_bits_source,
	auto_tl_in_a_bits_address,
	auto_tl_in_a_bits_mask,
	auto_tl_in_a_bits_data,
	auto_tl_in_a_bits_corrupt,
	auto_tl_in_d_ready,
	auto_tl_in_d_valid,
	auto_tl_in_d_bits_opcode,
	auto_tl_in_d_bits_size,
	auto_tl_in_d_bits_source,
	auto_tl_in_d_bits_data
);
	input clock;
	input reset;
	input auto_fragmenter_anon_out_a_ready;
	output wire auto_fragmenter_anon_out_a_valid;
	output wire [2:0] auto_fragmenter_anon_out_a_bits_opcode;
	output wire [2:0] auto_fragmenter_anon_out_a_bits_param;
	output wire [1:0] auto_fragmenter_anon_out_a_bits_size;
	output wire [8:0] auto_fragmenter_anon_out_a_bits_source;
	output wire [27:0] auto_fragmenter_anon_out_a_bits_address;
	output wire [7:0] auto_fragmenter_anon_out_a_bits_mask;
	output wire [63:0] auto_fragmenter_anon_out_a_bits_data;
	output wire auto_fragmenter_anon_out_a_bits_corrupt;
	output wire auto_fragmenter_anon_out_d_ready;
	input auto_fragmenter_anon_out_d_valid;
	input [2:0] auto_fragmenter_anon_out_d_bits_opcode;
	input [1:0] auto_fragmenter_anon_out_d_bits_size;
	input [8:0] auto_fragmenter_anon_out_d_bits_source;
	input [63:0] auto_fragmenter_anon_out_d_bits_data;
	output wire auto_tl_in_a_ready;
	input auto_tl_in_a_valid;
	input [2:0] auto_tl_in_a_bits_opcode;
	input [2:0] auto_tl_in_a_bits_param;
	input [2:0] auto_tl_in_a_bits_size;
	input [4:0] auto_tl_in_a_bits_source;
	input [27:0] auto_tl_in_a_bits_address;
	input [7:0] auto_tl_in_a_bits_mask;
	input [63:0] auto_tl_in_a_bits_data;
	input auto_tl_in_a_bits_corrupt;
	input auto_tl_in_d_ready;
	output wire auto_tl_in_d_valid;
	output wire [2:0] auto_tl_in_d_bits_opcode;
	output wire [2:0] auto_tl_in_d_bits_size;
	output wire [4:0] auto_tl_in_d_bits_source;
	output wire [63:0] auto_tl_in_d_bits_data;
	TLFragmenter_PLIC fragmenter(
		.clock(clock),
		.reset(reset),
		.auto_anon_in_a_ready(auto_tl_in_a_ready),
		.auto_anon_in_a_valid(auto_tl_in_a_valid),
		.auto_anon_in_a_bits_opcode(auto_tl_in_a_bits_opcode),
		.auto_anon_in_a_bits_param(auto_tl_in_a_bits_param),
		.auto_anon_in_a_bits_size(auto_tl_in_a_bits_size),
		.auto_anon_in_a_bits_source(auto_tl_in_a_bits_source),
		.auto_anon_in_a_bits_address(auto_tl_in_a_bits_address),
		.auto_anon_in_a_bits_mask(auto_tl_in_a_bits_mask),
		.auto_anon_in_a_bits_data(auto_tl_in_a_bits_data),
		.auto_anon_in_a_bits_corrupt(auto_tl_in_a_bits_corrupt),
		.auto_anon_in_d_ready(auto_tl_in_d_ready),
		.auto_anon_in_d_valid(auto_tl_in_d_valid),
		.auto_anon_in_d_bits_opcode(auto_tl_in_d_bits_opcode),
		.auto_anon_in_d_bits_size(auto_tl_in_d_bits_size),
		.auto_anon_in_d_bits_source(auto_tl_in_d_bits_source),
		.auto_anon_in_d_bits_data(auto_tl_in_d_bits_data),
		.auto_anon_out_a_ready(auto_fragmenter_anon_out_a_ready),
		.auto_anon_out_a_valid(auto_fragmenter_anon_out_a_valid),
		.auto_anon_out_a_bits_opcode(auto_fragmenter_anon_out_a_bits_opcode),
		.auto_anon_out_a_bits_param(auto_fragmenter_anon_out_a_bits_param),
		.auto_anon_out_a_bits_size(auto_fragmenter_anon_out_a_bits_size),
		.auto_anon_out_a_bits_source(auto_fragmenter_anon_out_a_bits_source),
		.auto_anon_out_a_bits_address(auto_fragmenter_anon_out_a_bits_address),
		.auto_anon_out_a_bits_mask(auto_fragmenter_anon_out_a_bits_mask),
		.auto_anon_out_a_bits_data(auto_fragmenter_anon_out_a_bits_data),
		.auto_anon_out_a_bits_corrupt(auto_fragmenter_anon_out_a_bits_corrupt),
		.auto_anon_out_d_ready(auto_fragmenter_anon_out_d_ready),
		.auto_anon_out_d_valid(auto_fragmenter_anon_out_d_valid),
		.auto_anon_out_d_bits_opcode(auto_fragmenter_anon_out_d_bits_opcode),
		.auto_anon_out_d_bits_size(auto_fragmenter_anon_out_d_bits_size),
		.auto_anon_out_d_bits_source(auto_fragmenter_anon_out_d_bits_source),
		.auto_anon_out_d_bits_data(auto_fragmenter_anon_out_d_bits_data)
	);
endmodule
