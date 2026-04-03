module TLInterconnectCoupler_fbus_from_port_named_slave_port_axi4 (
	clock,
	reset,
	auto_axi4index_in_aw_ready,
	auto_axi4index_in_aw_valid,
	auto_axi4index_in_aw_bits_id,
	auto_axi4index_in_aw_bits_addr,
	auto_axi4index_in_aw_bits_len,
	auto_axi4index_in_aw_bits_size,
	auto_axi4index_in_aw_bits_burst,
	auto_axi4index_in_aw_bits_lock,
	auto_axi4index_in_aw_bits_cache,
	auto_axi4index_in_aw_bits_prot,
	auto_axi4index_in_aw_bits_qos,
	auto_axi4index_in_w_ready,
	auto_axi4index_in_w_valid,
	auto_axi4index_in_w_bits_data,
	auto_axi4index_in_w_bits_strb,
	auto_axi4index_in_w_bits_last,
	auto_axi4index_in_b_ready,
	auto_axi4index_in_b_valid,
	auto_axi4index_in_b_bits_id,
	auto_axi4index_in_b_bits_resp,
	auto_axi4index_in_ar_ready,
	auto_axi4index_in_ar_valid,
	auto_axi4index_in_ar_bits_id,
	auto_axi4index_in_ar_bits_addr,
	auto_axi4index_in_ar_bits_len,
	auto_axi4index_in_ar_bits_size,
	auto_axi4index_in_ar_bits_burst,
	auto_axi4index_in_ar_bits_lock,
	auto_axi4index_in_ar_bits_cache,
	auto_axi4index_in_ar_bits_prot,
	auto_axi4index_in_ar_bits_qos,
	auto_axi4index_in_r_ready,
	auto_axi4index_in_r_valid,
	auto_axi4index_in_r_bits_id,
	auto_axi4index_in_r_bits_data,
	auto_axi4index_in_r_bits_resp,
	auto_axi4index_in_r_bits_last,
	auto_tl_out_a_ready,
	auto_tl_out_a_valid,
	auto_tl_out_a_bits_opcode,
	auto_tl_out_a_bits_param,
	auto_tl_out_a_bits_size,
	auto_tl_out_a_bits_source,
	auto_tl_out_a_bits_address,
	auto_tl_out_a_bits_user_amba_prot_bufferable,
	auto_tl_out_a_bits_user_amba_prot_modifiable,
	auto_tl_out_a_bits_user_amba_prot_readalloc,
	auto_tl_out_a_bits_user_amba_prot_writealloc,
	auto_tl_out_a_bits_user_amba_prot_privileged,
	auto_tl_out_a_bits_user_amba_prot_secure,
	auto_tl_out_a_bits_user_amba_prot_fetch,
	auto_tl_out_a_bits_mask,
	auto_tl_out_a_bits_data,
	auto_tl_out_a_bits_corrupt,
	auto_tl_out_d_ready,
	auto_tl_out_d_valid,
	auto_tl_out_d_bits_opcode,
	auto_tl_out_d_bits_param,
	auto_tl_out_d_bits_size,
	auto_tl_out_d_bits_source,
	auto_tl_out_d_bits_sink,
	auto_tl_out_d_bits_denied,
	auto_tl_out_d_bits_data,
	auto_tl_out_d_bits_corrupt
);
	input clock;
	input reset;
	output wire auto_axi4index_in_aw_ready;
	input auto_axi4index_in_aw_valid;
	input [7:0] auto_axi4index_in_aw_bits_id;
	input [31:0] auto_axi4index_in_aw_bits_addr;
	input [7:0] auto_axi4index_in_aw_bits_len;
	input [2:0] auto_axi4index_in_aw_bits_size;
	input [1:0] auto_axi4index_in_aw_bits_burst;
	input auto_axi4index_in_aw_bits_lock;
	input [3:0] auto_axi4index_in_aw_bits_cache;
	input [2:0] auto_axi4index_in_aw_bits_prot;
	input [3:0] auto_axi4index_in_aw_bits_qos;
	output wire auto_axi4index_in_w_ready;
	input auto_axi4index_in_w_valid;
	input [63:0] auto_axi4index_in_w_bits_data;
	input [7:0] auto_axi4index_in_w_bits_strb;
	input auto_axi4index_in_w_bits_last;
	input auto_axi4index_in_b_ready;
	output wire auto_axi4index_in_b_valid;
	output wire [7:0] auto_axi4index_in_b_bits_id;
	output wire [1:0] auto_axi4index_in_b_bits_resp;
	output wire auto_axi4index_in_ar_ready;
	input auto_axi4index_in_ar_valid;
	input [7:0] auto_axi4index_in_ar_bits_id;
	input [31:0] auto_axi4index_in_ar_bits_addr;
	input [7:0] auto_axi4index_in_ar_bits_len;
	input [2:0] auto_axi4index_in_ar_bits_size;
	input [1:0] auto_axi4index_in_ar_bits_burst;
	input auto_axi4index_in_ar_bits_lock;
	input [3:0] auto_axi4index_in_ar_bits_cache;
	input [2:0] auto_axi4index_in_ar_bits_prot;
	input [3:0] auto_axi4index_in_ar_bits_qos;
	input auto_axi4index_in_r_ready;
	output wire auto_axi4index_in_r_valid;
	output wire [7:0] auto_axi4index_in_r_bits_id;
	output wire [63:0] auto_axi4index_in_r_bits_data;
	output wire [1:0] auto_axi4index_in_r_bits_resp;
	output wire auto_axi4index_in_r_bits_last;
	input auto_tl_out_a_ready;
	output wire auto_tl_out_a_valid;
	output wire [2:0] auto_tl_out_a_bits_opcode;
	output wire [2:0] auto_tl_out_a_bits_param;
	output wire [3:0] auto_tl_out_a_bits_size;
	output wire [3:0] auto_tl_out_a_bits_source;
	output wire [31:0] auto_tl_out_a_bits_address;
	output wire auto_tl_out_a_bits_user_amba_prot_bufferable;
	output wire auto_tl_out_a_bits_user_amba_prot_modifiable;
	output wire auto_tl_out_a_bits_user_amba_prot_readalloc;
	output wire auto_tl_out_a_bits_user_amba_prot_writealloc;
	output wire auto_tl_out_a_bits_user_amba_prot_privileged;
	output wire auto_tl_out_a_bits_user_amba_prot_secure;
	output wire auto_tl_out_a_bits_user_amba_prot_fetch;
	output wire [7:0] auto_tl_out_a_bits_mask;
	output wire [63:0] auto_tl_out_a_bits_data;
	output wire auto_tl_out_a_bits_corrupt;
	output wire auto_tl_out_d_ready;
	input auto_tl_out_d_valid;
	input [2:0] auto_tl_out_d_bits_opcode;
	input [1:0] auto_tl_out_d_bits_param;
	input [3:0] auto_tl_out_d_bits_size;
	input [3:0] auto_tl_out_d_bits_source;
	input [1:0] auto_tl_out_d_bits_sink;
	input auto_tl_out_d_bits_denied;
	input [63:0] auto_tl_out_d_bits_data;
	input auto_tl_out_d_bits_corrupt;
	wire _axi4index_auto_out_aw_valid;
	wire _axi4index_auto_out_aw_bits_id;
	wire [31:0] _axi4index_auto_out_aw_bits_addr;
	wire [7:0] _axi4index_auto_out_aw_bits_len;
	wire [2:0] _axi4index_auto_out_aw_bits_size;
	wire [1:0] _axi4index_auto_out_aw_bits_burst;
	wire _axi4index_auto_out_aw_bits_lock;
	wire [3:0] _axi4index_auto_out_aw_bits_cache;
	wire [2:0] _axi4index_auto_out_aw_bits_prot;
	wire [3:0] _axi4index_auto_out_aw_bits_qos;
	wire [6:0] _axi4index_auto_out_aw_bits_echo_extra_id;
	wire _axi4index_auto_out_w_valid;
	wire [63:0] _axi4index_auto_out_w_bits_data;
	wire [7:0] _axi4index_auto_out_w_bits_strb;
	wire _axi4index_auto_out_w_bits_last;
	wire _axi4index_auto_out_b_ready;
	wire _axi4index_auto_out_ar_valid;
	wire _axi4index_auto_out_ar_bits_id;
	wire [31:0] _axi4index_auto_out_ar_bits_addr;
	wire [7:0] _axi4index_auto_out_ar_bits_len;
	wire [2:0] _axi4index_auto_out_ar_bits_size;
	wire [1:0] _axi4index_auto_out_ar_bits_burst;
	wire _axi4index_auto_out_ar_bits_lock;
	wire [3:0] _axi4index_auto_out_ar_bits_cache;
	wire [2:0] _axi4index_auto_out_ar_bits_prot;
	wire [3:0] _axi4index_auto_out_ar_bits_qos;
	wire [6:0] _axi4index_auto_out_ar_bits_echo_extra_id;
	wire _axi4index_auto_out_r_ready;
	wire _axi4frag_auto_in_aw_ready;
	wire _axi4frag_auto_in_w_ready;
	wire _axi4frag_auto_in_b_valid;
	wire _axi4frag_auto_in_b_bits_id;
	wire [1:0] _axi4frag_auto_in_b_bits_resp;
	wire [6:0] _axi4frag_auto_in_b_bits_echo_extra_id;
	wire _axi4frag_auto_in_ar_ready;
	wire _axi4frag_auto_in_r_valid;
	wire _axi4frag_auto_in_r_bits_id;
	wire [63:0] _axi4frag_auto_in_r_bits_data;
	wire [1:0] _axi4frag_auto_in_r_bits_resp;
	wire [6:0] _axi4frag_auto_in_r_bits_echo_extra_id;
	wire _axi4frag_auto_in_r_bits_last;
	wire _axi4frag_auto_out_aw_valid;
	wire _axi4frag_auto_out_aw_bits_id;
	wire [31:0] _axi4frag_auto_out_aw_bits_addr;
	wire [7:0] _axi4frag_auto_out_aw_bits_len;
	wire [2:0] _axi4frag_auto_out_aw_bits_size;
	wire [3:0] _axi4frag_auto_out_aw_bits_cache;
	wire [2:0] _axi4frag_auto_out_aw_bits_prot;
	wire [6:0] _axi4frag_auto_out_aw_bits_echo_extra_id;
	wire _axi4frag_auto_out_aw_bits_echo_real_last;
	wire _axi4frag_auto_out_w_valid;
	wire [63:0] _axi4frag_auto_out_w_bits_data;
	wire [7:0] _axi4frag_auto_out_w_bits_strb;
	wire _axi4frag_auto_out_w_bits_last;
	wire _axi4frag_auto_out_b_ready;
	wire _axi4frag_auto_out_ar_valid;
	wire _axi4frag_auto_out_ar_bits_id;
	wire [31:0] _axi4frag_auto_out_ar_bits_addr;
	wire [7:0] _axi4frag_auto_out_ar_bits_len;
	wire [2:0] _axi4frag_auto_out_ar_bits_size;
	wire [3:0] _axi4frag_auto_out_ar_bits_cache;
	wire [2:0] _axi4frag_auto_out_ar_bits_prot;
	wire [6:0] _axi4frag_auto_out_ar_bits_echo_extra_id;
	wire _axi4frag_auto_out_ar_bits_echo_real_last;
	wire _axi4frag_auto_out_r_ready;
	wire _axi4yank_auto_in_aw_ready;
	wire _axi4yank_auto_in_w_ready;
	wire _axi4yank_auto_in_b_valid;
	wire _axi4yank_auto_in_b_bits_id;
	wire [1:0] _axi4yank_auto_in_b_bits_resp;
	wire [6:0] _axi4yank_auto_in_b_bits_echo_extra_id;
	wire _axi4yank_auto_in_b_bits_echo_real_last;
	wire _axi4yank_auto_in_ar_ready;
	wire _axi4yank_auto_in_r_valid;
	wire _axi4yank_auto_in_r_bits_id;
	wire [63:0] _axi4yank_auto_in_r_bits_data;
	wire [1:0] _axi4yank_auto_in_r_bits_resp;
	wire [6:0] _axi4yank_auto_in_r_bits_echo_extra_id;
	wire _axi4yank_auto_in_r_bits_echo_real_last;
	wire _axi4yank_auto_in_r_bits_last;
	wire _axi4yank_auto_out_aw_valid;
	wire _axi4yank_auto_out_aw_bits_id;
	wire [31:0] _axi4yank_auto_out_aw_bits_addr;
	wire [7:0] _axi4yank_auto_out_aw_bits_len;
	wire [2:0] _axi4yank_auto_out_aw_bits_size;
	wire [3:0] _axi4yank_auto_out_aw_bits_cache;
	wire [2:0] _axi4yank_auto_out_aw_bits_prot;
	wire _axi4yank_auto_out_w_valid;
	wire [63:0] _axi4yank_auto_out_w_bits_data;
	wire [7:0] _axi4yank_auto_out_w_bits_strb;
	wire _axi4yank_auto_out_w_bits_last;
	wire _axi4yank_auto_out_b_ready;
	wire _axi4yank_auto_out_ar_valid;
	wire _axi4yank_auto_out_ar_bits_id;
	wire [31:0] _axi4yank_auto_out_ar_bits_addr;
	wire [7:0] _axi4yank_auto_out_ar_bits_len;
	wire [2:0] _axi4yank_auto_out_ar_bits_size;
	wire [3:0] _axi4yank_auto_out_ar_bits_cache;
	wire [2:0] _axi4yank_auto_out_ar_bits_prot;
	wire _axi4yank_auto_out_r_ready;
	wire _axi42tl_auto_in_aw_ready;
	wire _axi42tl_auto_in_w_ready;
	wire _axi42tl_auto_in_b_valid;
	wire _axi42tl_auto_in_b_bits_id;
	wire [1:0] _axi42tl_auto_in_b_bits_resp;
	wire _axi42tl_auto_in_ar_ready;
	wire _axi42tl_auto_in_r_valid;
	wire _axi42tl_auto_in_r_bits_id;
	wire [63:0] _axi42tl_auto_in_r_bits_data;
	wire [1:0] _axi42tl_auto_in_r_bits_resp;
	wire _axi42tl_auto_in_r_bits_last;
	wire _axi42tl_auto_out_a_valid;
	wire [2:0] _axi42tl_auto_out_a_bits_opcode;
	wire [3:0] _axi42tl_auto_out_a_bits_size;
	wire [3:0] _axi42tl_auto_out_a_bits_source;
	wire [31:0] _axi42tl_auto_out_a_bits_address;
	wire _axi42tl_auto_out_a_bits_user_amba_prot_bufferable;
	wire _axi42tl_auto_out_a_bits_user_amba_prot_modifiable;
	wire _axi42tl_auto_out_a_bits_user_amba_prot_readalloc;
	wire _axi42tl_auto_out_a_bits_user_amba_prot_writealloc;
	wire _axi42tl_auto_out_a_bits_user_amba_prot_privileged;
	wire _axi42tl_auto_out_a_bits_user_amba_prot_secure;
	wire _axi42tl_auto_out_a_bits_user_amba_prot_fetch;
	wire [7:0] _axi42tl_auto_out_a_bits_mask;
	wire [63:0] _axi42tl_auto_out_a_bits_data;
	wire _axi42tl_auto_out_d_ready;
	wire _fixer_auto_anon_in_a_ready;
	wire _fixer_auto_anon_in_d_valid;
	wire [2:0] _fixer_auto_anon_in_d_bits_opcode;
	wire [3:0] _fixer_auto_anon_in_d_bits_size;
	wire [3:0] _fixer_auto_anon_in_d_bits_source;
	wire _fixer_auto_anon_in_d_bits_denied;
	wire [63:0] _fixer_auto_anon_in_d_bits_data;
	wire _fixer_auto_anon_in_d_bits_corrupt;
	wire _fixer_auto_anon_out_a_valid;
	wire [2:0] _fixer_auto_anon_out_a_bits_opcode;
	wire [3:0] _fixer_auto_anon_out_a_bits_size;
	wire [3:0] _fixer_auto_anon_out_a_bits_source;
	wire [31:0] _fixer_auto_anon_out_a_bits_address;
	wire _fixer_auto_anon_out_a_bits_user_amba_prot_bufferable;
	wire _fixer_auto_anon_out_a_bits_user_amba_prot_modifiable;
	wire _fixer_auto_anon_out_a_bits_user_amba_prot_readalloc;
	wire _fixer_auto_anon_out_a_bits_user_amba_prot_writealloc;
	wire _fixer_auto_anon_out_a_bits_user_amba_prot_privileged;
	wire _fixer_auto_anon_out_a_bits_user_amba_prot_secure;
	wire _fixer_auto_anon_out_a_bits_user_amba_prot_fetch;
	wire [7:0] _fixer_auto_anon_out_a_bits_mask;
	wire [63:0] _fixer_auto_anon_out_a_bits_data;
	wire _fixer_auto_anon_out_d_ready;
	wire _buffer_auto_in_a_ready;
	wire _buffer_auto_in_d_valid;
	wire [2:0] _buffer_auto_in_d_bits_opcode;
	wire [1:0] _buffer_auto_in_d_bits_param;
	wire [3:0] _buffer_auto_in_d_bits_size;
	wire [3:0] _buffer_auto_in_d_bits_source;
	wire [1:0] _buffer_auto_in_d_bits_sink;
	wire _buffer_auto_in_d_bits_denied;
	wire [63:0] _buffer_auto_in_d_bits_data;
	wire _buffer_auto_in_d_bits_corrupt;
	TLBuffer_a32d64s4k2z4u_1 buffer(
		.clock(clock),
		.reset(reset),
		.auto_in_a_ready(_buffer_auto_in_a_ready),
		.auto_in_a_valid(_fixer_auto_anon_out_a_valid),
		.auto_in_a_bits_opcode(_fixer_auto_anon_out_a_bits_opcode),
		.auto_in_a_bits_size(_fixer_auto_anon_out_a_bits_size),
		.auto_in_a_bits_source(_fixer_auto_anon_out_a_bits_source),
		.auto_in_a_bits_address(_fixer_auto_anon_out_a_bits_address),
		.auto_in_a_bits_user_amba_prot_bufferable(_fixer_auto_anon_out_a_bits_user_amba_prot_bufferable),
		.auto_in_a_bits_user_amba_prot_modifiable(_fixer_auto_anon_out_a_bits_user_amba_prot_modifiable),
		.auto_in_a_bits_user_amba_prot_readalloc(_fixer_auto_anon_out_a_bits_user_amba_prot_readalloc),
		.auto_in_a_bits_user_amba_prot_writealloc(_fixer_auto_anon_out_a_bits_user_amba_prot_writealloc),
		.auto_in_a_bits_user_amba_prot_privileged(_fixer_auto_anon_out_a_bits_user_amba_prot_privileged),
		.auto_in_a_bits_user_amba_prot_secure(_fixer_auto_anon_out_a_bits_user_amba_prot_secure),
		.auto_in_a_bits_user_amba_prot_fetch(_fixer_auto_anon_out_a_bits_user_amba_prot_fetch),
		.auto_in_a_bits_mask(_fixer_auto_anon_out_a_bits_mask),
		.auto_in_a_bits_data(_fixer_auto_anon_out_a_bits_data),
		.auto_in_d_ready(_fixer_auto_anon_out_d_ready),
		.auto_in_d_valid(_buffer_auto_in_d_valid),
		.auto_in_d_bits_opcode(_buffer_auto_in_d_bits_opcode),
		.auto_in_d_bits_param(_buffer_auto_in_d_bits_param),
		.auto_in_d_bits_size(_buffer_auto_in_d_bits_size),
		.auto_in_d_bits_source(_buffer_auto_in_d_bits_source),
		.auto_in_d_bits_sink(_buffer_auto_in_d_bits_sink),
		.auto_in_d_bits_denied(_buffer_auto_in_d_bits_denied),
		.auto_in_d_bits_data(_buffer_auto_in_d_bits_data),
		.auto_in_d_bits_corrupt(_buffer_auto_in_d_bits_corrupt),
		.auto_out_a_ready(auto_tl_out_a_ready),
		.auto_out_a_valid(auto_tl_out_a_valid),
		.auto_out_a_bits_opcode(auto_tl_out_a_bits_opcode),
		.auto_out_a_bits_param(auto_tl_out_a_bits_param),
		.auto_out_a_bits_size(auto_tl_out_a_bits_size),
		.auto_out_a_bits_source(auto_tl_out_a_bits_source),
		.auto_out_a_bits_address(auto_tl_out_a_bits_address),
		.auto_out_a_bits_user_amba_prot_bufferable(auto_tl_out_a_bits_user_amba_prot_bufferable),
		.auto_out_a_bits_user_amba_prot_modifiable(auto_tl_out_a_bits_user_amba_prot_modifiable),
		.auto_out_a_bits_user_amba_prot_readalloc(auto_tl_out_a_bits_user_amba_prot_readalloc),
		.auto_out_a_bits_user_amba_prot_writealloc(auto_tl_out_a_bits_user_amba_prot_writealloc),
		.auto_out_a_bits_user_amba_prot_privileged(auto_tl_out_a_bits_user_amba_prot_privileged),
		.auto_out_a_bits_user_amba_prot_secure(auto_tl_out_a_bits_user_amba_prot_secure),
		.auto_out_a_bits_user_amba_prot_fetch(auto_tl_out_a_bits_user_amba_prot_fetch),
		.auto_out_a_bits_mask(auto_tl_out_a_bits_mask),
		.auto_out_a_bits_data(auto_tl_out_a_bits_data),
		.auto_out_a_bits_corrupt(auto_tl_out_a_bits_corrupt),
		.auto_out_d_ready(auto_tl_out_d_ready),
		.auto_out_d_valid(auto_tl_out_d_valid),
		.auto_out_d_bits_opcode(auto_tl_out_d_bits_opcode),
		.auto_out_d_bits_param(auto_tl_out_d_bits_param),
		.auto_out_d_bits_size(auto_tl_out_d_bits_size),
		.auto_out_d_bits_source(auto_tl_out_d_bits_source),
		.auto_out_d_bits_sink(auto_tl_out_d_bits_sink),
		.auto_out_d_bits_denied(auto_tl_out_d_bits_denied),
		.auto_out_d_bits_data(auto_tl_out_d_bits_data),
		.auto_out_d_bits_corrupt(auto_tl_out_d_bits_corrupt)
	);
	TLFIFOFixer_2 fixer(
		.clock(clock),
		.reset(reset),
		.auto_anon_in_a_ready(_fixer_auto_anon_in_a_ready),
		.auto_anon_in_a_valid(_axi42tl_auto_out_a_valid),
		.auto_anon_in_a_bits_opcode(_axi42tl_auto_out_a_bits_opcode),
		.auto_anon_in_a_bits_size(_axi42tl_auto_out_a_bits_size),
		.auto_anon_in_a_bits_source(_axi42tl_auto_out_a_bits_source),
		.auto_anon_in_a_bits_address(_axi42tl_auto_out_a_bits_address),
		.auto_anon_in_a_bits_user_amba_prot_bufferable(_axi42tl_auto_out_a_bits_user_amba_prot_bufferable),
		.auto_anon_in_a_bits_user_amba_prot_modifiable(_axi42tl_auto_out_a_bits_user_amba_prot_modifiable),
		.auto_anon_in_a_bits_user_amba_prot_readalloc(_axi42tl_auto_out_a_bits_user_amba_prot_readalloc),
		.auto_anon_in_a_bits_user_amba_prot_writealloc(_axi42tl_auto_out_a_bits_user_amba_prot_writealloc),
		.auto_anon_in_a_bits_user_amba_prot_privileged(_axi42tl_auto_out_a_bits_user_amba_prot_privileged),
		.auto_anon_in_a_bits_user_amba_prot_secure(_axi42tl_auto_out_a_bits_user_amba_prot_secure),
		.auto_anon_in_a_bits_user_amba_prot_fetch(_axi42tl_auto_out_a_bits_user_amba_prot_fetch),
		.auto_anon_in_a_bits_mask(_axi42tl_auto_out_a_bits_mask),
		.auto_anon_in_a_bits_data(_axi42tl_auto_out_a_bits_data),
		.auto_anon_in_d_ready(_axi42tl_auto_out_d_ready),
		.auto_anon_in_d_valid(_fixer_auto_anon_in_d_valid),
		.auto_anon_in_d_bits_opcode(_fixer_auto_anon_in_d_bits_opcode),
		.auto_anon_in_d_bits_size(_fixer_auto_anon_in_d_bits_size),
		.auto_anon_in_d_bits_source(_fixer_auto_anon_in_d_bits_source),
		.auto_anon_in_d_bits_denied(_fixer_auto_anon_in_d_bits_denied),
		.auto_anon_in_d_bits_data(_fixer_auto_anon_in_d_bits_data),
		.auto_anon_in_d_bits_corrupt(_fixer_auto_anon_in_d_bits_corrupt),
		.auto_anon_out_a_ready(_buffer_auto_in_a_ready),
		.auto_anon_out_a_valid(_fixer_auto_anon_out_a_valid),
		.auto_anon_out_a_bits_opcode(_fixer_auto_anon_out_a_bits_opcode),
		.auto_anon_out_a_bits_size(_fixer_auto_anon_out_a_bits_size),
		.auto_anon_out_a_bits_source(_fixer_auto_anon_out_a_bits_source),
		.auto_anon_out_a_bits_address(_fixer_auto_anon_out_a_bits_address),
		.auto_anon_out_a_bits_user_amba_prot_bufferable(_fixer_auto_anon_out_a_bits_user_amba_prot_bufferable),
		.auto_anon_out_a_bits_user_amba_prot_modifiable(_fixer_auto_anon_out_a_bits_user_amba_prot_modifiable),
		.auto_anon_out_a_bits_user_amba_prot_readalloc(_fixer_auto_anon_out_a_bits_user_amba_prot_readalloc),
		.auto_anon_out_a_bits_user_amba_prot_writealloc(_fixer_auto_anon_out_a_bits_user_amba_prot_writealloc),
		.auto_anon_out_a_bits_user_amba_prot_privileged(_fixer_auto_anon_out_a_bits_user_amba_prot_privileged),
		.auto_anon_out_a_bits_user_amba_prot_secure(_fixer_auto_anon_out_a_bits_user_amba_prot_secure),
		.auto_anon_out_a_bits_user_amba_prot_fetch(_fixer_auto_anon_out_a_bits_user_amba_prot_fetch),
		.auto_anon_out_a_bits_mask(_fixer_auto_anon_out_a_bits_mask),
		.auto_anon_out_a_bits_data(_fixer_auto_anon_out_a_bits_data),
		.auto_anon_out_d_ready(_fixer_auto_anon_out_d_ready),
		.auto_anon_out_d_valid(_buffer_auto_in_d_valid),
		.auto_anon_out_d_bits_opcode(_buffer_auto_in_d_bits_opcode),
		.auto_anon_out_d_bits_param(_buffer_auto_in_d_bits_param),
		.auto_anon_out_d_bits_size(_buffer_auto_in_d_bits_size),
		.auto_anon_out_d_bits_source(_buffer_auto_in_d_bits_source),
		.auto_anon_out_d_bits_sink(_buffer_auto_in_d_bits_sink),
		.auto_anon_out_d_bits_denied(_buffer_auto_in_d_bits_denied),
		.auto_anon_out_d_bits_data(_buffer_auto_in_d_bits_data),
		.auto_anon_out_d_bits_corrupt(_buffer_auto_in_d_bits_corrupt)
	);
	AXI4ToTL axi42tl(
		.clock(clock),
		.reset(reset),
		.auto_in_aw_ready(_axi42tl_auto_in_aw_ready),
		.auto_in_aw_valid(_axi4yank_auto_out_aw_valid),
		.auto_in_aw_bits_id(_axi4yank_auto_out_aw_bits_id),
		.auto_in_aw_bits_addr(_axi4yank_auto_out_aw_bits_addr),
		.auto_in_aw_bits_len(_axi4yank_auto_out_aw_bits_len),
		.auto_in_aw_bits_size(_axi4yank_auto_out_aw_bits_size),
		.auto_in_aw_bits_cache(_axi4yank_auto_out_aw_bits_cache),
		.auto_in_aw_bits_prot(_axi4yank_auto_out_aw_bits_prot),
		.auto_in_w_ready(_axi42tl_auto_in_w_ready),
		.auto_in_w_valid(_axi4yank_auto_out_w_valid),
		.auto_in_w_bits_data(_axi4yank_auto_out_w_bits_data),
		.auto_in_w_bits_strb(_axi4yank_auto_out_w_bits_strb),
		.auto_in_w_bits_last(_axi4yank_auto_out_w_bits_last),
		.auto_in_b_ready(_axi4yank_auto_out_b_ready),
		.auto_in_b_valid(_axi42tl_auto_in_b_valid),
		.auto_in_b_bits_id(_axi42tl_auto_in_b_bits_id),
		.auto_in_b_bits_resp(_axi42tl_auto_in_b_bits_resp),
		.auto_in_ar_ready(_axi42tl_auto_in_ar_ready),
		.auto_in_ar_valid(_axi4yank_auto_out_ar_valid),
		.auto_in_ar_bits_id(_axi4yank_auto_out_ar_bits_id),
		.auto_in_ar_bits_addr(_axi4yank_auto_out_ar_bits_addr),
		.auto_in_ar_bits_len(_axi4yank_auto_out_ar_bits_len),
		.auto_in_ar_bits_size(_axi4yank_auto_out_ar_bits_size),
		.auto_in_ar_bits_cache(_axi4yank_auto_out_ar_bits_cache),
		.auto_in_ar_bits_prot(_axi4yank_auto_out_ar_bits_prot),
		.auto_in_r_ready(_axi4yank_auto_out_r_ready),
		.auto_in_r_valid(_axi42tl_auto_in_r_valid),
		.auto_in_r_bits_id(_axi42tl_auto_in_r_bits_id),
		.auto_in_r_bits_data(_axi42tl_auto_in_r_bits_data),
		.auto_in_r_bits_resp(_axi42tl_auto_in_r_bits_resp),
		.auto_in_r_bits_last(_axi42tl_auto_in_r_bits_last),
		.auto_out_a_ready(_fixer_auto_anon_in_a_ready),
		.auto_out_a_valid(_axi42tl_auto_out_a_valid),
		.auto_out_a_bits_opcode(_axi42tl_auto_out_a_bits_opcode),
		.auto_out_a_bits_size(_axi42tl_auto_out_a_bits_size),
		.auto_out_a_bits_source(_axi42tl_auto_out_a_bits_source),
		.auto_out_a_bits_address(_axi42tl_auto_out_a_bits_address),
		.auto_out_a_bits_user_amba_prot_bufferable(_axi42tl_auto_out_a_bits_user_amba_prot_bufferable),
		.auto_out_a_bits_user_amba_prot_modifiable(_axi42tl_auto_out_a_bits_user_amba_prot_modifiable),
		.auto_out_a_bits_user_amba_prot_readalloc(_axi42tl_auto_out_a_bits_user_amba_prot_readalloc),
		.auto_out_a_bits_user_amba_prot_writealloc(_axi42tl_auto_out_a_bits_user_amba_prot_writealloc),
		.auto_out_a_bits_user_amba_prot_privileged(_axi42tl_auto_out_a_bits_user_amba_prot_privileged),
		.auto_out_a_bits_user_amba_prot_secure(_axi42tl_auto_out_a_bits_user_amba_prot_secure),
		.auto_out_a_bits_user_amba_prot_fetch(_axi42tl_auto_out_a_bits_user_amba_prot_fetch),
		.auto_out_a_bits_mask(_axi42tl_auto_out_a_bits_mask),
		.auto_out_a_bits_data(_axi42tl_auto_out_a_bits_data),
		.auto_out_d_ready(_axi42tl_auto_out_d_ready),
		.auto_out_d_valid(_fixer_auto_anon_in_d_valid),
		.auto_out_d_bits_opcode(_fixer_auto_anon_in_d_bits_opcode),
		.auto_out_d_bits_size(_fixer_auto_anon_in_d_bits_size),
		.auto_out_d_bits_source(_fixer_auto_anon_in_d_bits_source),
		.auto_out_d_bits_denied(_fixer_auto_anon_in_d_bits_denied),
		.auto_out_d_bits_data(_fixer_auto_anon_in_d_bits_data),
		.auto_out_d_bits_corrupt(_fixer_auto_anon_in_d_bits_corrupt)
	);
	AXI4UserYanker_1 axi4yank(
		.clock(clock),
		.reset(reset),
		.auto_in_aw_ready(_axi4yank_auto_in_aw_ready),
		.auto_in_aw_valid(_axi4frag_auto_out_aw_valid),
		.auto_in_aw_bits_id(_axi4frag_auto_out_aw_bits_id),
		.auto_in_aw_bits_addr(_axi4frag_auto_out_aw_bits_addr),
		.auto_in_aw_bits_len(_axi4frag_auto_out_aw_bits_len),
		.auto_in_aw_bits_size(_axi4frag_auto_out_aw_bits_size),
		.auto_in_aw_bits_cache(_axi4frag_auto_out_aw_bits_cache),
		.auto_in_aw_bits_prot(_axi4frag_auto_out_aw_bits_prot),
		.auto_in_aw_bits_echo_extra_id(_axi4frag_auto_out_aw_bits_echo_extra_id),
		.auto_in_aw_bits_echo_real_last(_axi4frag_auto_out_aw_bits_echo_real_last),
		.auto_in_w_ready(_axi4yank_auto_in_w_ready),
		.auto_in_w_valid(_axi4frag_auto_out_w_valid),
		.auto_in_w_bits_data(_axi4frag_auto_out_w_bits_data),
		.auto_in_w_bits_strb(_axi4frag_auto_out_w_bits_strb),
		.auto_in_w_bits_last(_axi4frag_auto_out_w_bits_last),
		.auto_in_b_ready(_axi4frag_auto_out_b_ready),
		.auto_in_b_valid(_axi4yank_auto_in_b_valid),
		.auto_in_b_bits_id(_axi4yank_auto_in_b_bits_id),
		.auto_in_b_bits_resp(_axi4yank_auto_in_b_bits_resp),
		.auto_in_b_bits_echo_extra_id(_axi4yank_auto_in_b_bits_echo_extra_id),
		.auto_in_b_bits_echo_real_last(_axi4yank_auto_in_b_bits_echo_real_last),
		.auto_in_ar_ready(_axi4yank_auto_in_ar_ready),
		.auto_in_ar_valid(_axi4frag_auto_out_ar_valid),
		.auto_in_ar_bits_id(_axi4frag_auto_out_ar_bits_id),
		.auto_in_ar_bits_addr(_axi4frag_auto_out_ar_bits_addr),
		.auto_in_ar_bits_len(_axi4frag_auto_out_ar_bits_len),
		.auto_in_ar_bits_size(_axi4frag_auto_out_ar_bits_size),
		.auto_in_ar_bits_cache(_axi4frag_auto_out_ar_bits_cache),
		.auto_in_ar_bits_prot(_axi4frag_auto_out_ar_bits_prot),
		.auto_in_ar_bits_echo_extra_id(_axi4frag_auto_out_ar_bits_echo_extra_id),
		.auto_in_ar_bits_echo_real_last(_axi4frag_auto_out_ar_bits_echo_real_last),
		.auto_in_r_ready(_axi4frag_auto_out_r_ready),
		.auto_in_r_valid(_axi4yank_auto_in_r_valid),
		.auto_in_r_bits_id(_axi4yank_auto_in_r_bits_id),
		.auto_in_r_bits_data(_axi4yank_auto_in_r_bits_data),
		.auto_in_r_bits_resp(_axi4yank_auto_in_r_bits_resp),
		.auto_in_r_bits_echo_extra_id(_axi4yank_auto_in_r_bits_echo_extra_id),
		.auto_in_r_bits_echo_real_last(_axi4yank_auto_in_r_bits_echo_real_last),
		.auto_in_r_bits_last(_axi4yank_auto_in_r_bits_last),
		.auto_out_aw_ready(_axi42tl_auto_in_aw_ready),
		.auto_out_aw_valid(_axi4yank_auto_out_aw_valid),
		.auto_out_aw_bits_id(_axi4yank_auto_out_aw_bits_id),
		.auto_out_aw_bits_addr(_axi4yank_auto_out_aw_bits_addr),
		.auto_out_aw_bits_len(_axi4yank_auto_out_aw_bits_len),
		.auto_out_aw_bits_size(_axi4yank_auto_out_aw_bits_size),
		.auto_out_aw_bits_cache(_axi4yank_auto_out_aw_bits_cache),
		.auto_out_aw_bits_prot(_axi4yank_auto_out_aw_bits_prot),
		.auto_out_w_ready(_axi42tl_auto_in_w_ready),
		.auto_out_w_valid(_axi4yank_auto_out_w_valid),
		.auto_out_w_bits_data(_axi4yank_auto_out_w_bits_data),
		.auto_out_w_bits_strb(_axi4yank_auto_out_w_bits_strb),
		.auto_out_w_bits_last(_axi4yank_auto_out_w_bits_last),
		.auto_out_b_ready(_axi4yank_auto_out_b_ready),
		.auto_out_b_valid(_axi42tl_auto_in_b_valid),
		.auto_out_b_bits_id(_axi42tl_auto_in_b_bits_id),
		.auto_out_b_bits_resp(_axi42tl_auto_in_b_bits_resp),
		.auto_out_ar_ready(_axi42tl_auto_in_ar_ready),
		.auto_out_ar_valid(_axi4yank_auto_out_ar_valid),
		.auto_out_ar_bits_id(_axi4yank_auto_out_ar_bits_id),
		.auto_out_ar_bits_addr(_axi4yank_auto_out_ar_bits_addr),
		.auto_out_ar_bits_len(_axi4yank_auto_out_ar_bits_len),
		.auto_out_ar_bits_size(_axi4yank_auto_out_ar_bits_size),
		.auto_out_ar_bits_cache(_axi4yank_auto_out_ar_bits_cache),
		.auto_out_ar_bits_prot(_axi4yank_auto_out_ar_bits_prot),
		.auto_out_r_ready(_axi4yank_auto_out_r_ready),
		.auto_out_r_valid(_axi42tl_auto_in_r_valid),
		.auto_out_r_bits_id(_axi42tl_auto_in_r_bits_id),
		.auto_out_r_bits_data(_axi42tl_auto_in_r_bits_data),
		.auto_out_r_bits_resp(_axi42tl_auto_in_r_bits_resp),
		.auto_out_r_bits_last(_axi42tl_auto_in_r_bits_last)
	);
	AXI4Fragmenter axi4frag(
		.clock(clock),
		.reset(reset),
		.auto_in_aw_ready(_axi4frag_auto_in_aw_ready),
		.auto_in_aw_valid(_axi4index_auto_out_aw_valid),
		.auto_in_aw_bits_id(_axi4index_auto_out_aw_bits_id),
		.auto_in_aw_bits_addr(_axi4index_auto_out_aw_bits_addr),
		.auto_in_aw_bits_len(_axi4index_auto_out_aw_bits_len),
		.auto_in_aw_bits_size(_axi4index_auto_out_aw_bits_size),
		.auto_in_aw_bits_burst(_axi4index_auto_out_aw_bits_burst),
		.auto_in_aw_bits_lock(_axi4index_auto_out_aw_bits_lock),
		.auto_in_aw_bits_cache(_axi4index_auto_out_aw_bits_cache),
		.auto_in_aw_bits_prot(_axi4index_auto_out_aw_bits_prot),
		.auto_in_aw_bits_qos(_axi4index_auto_out_aw_bits_qos),
		.auto_in_aw_bits_echo_extra_id(_axi4index_auto_out_aw_bits_echo_extra_id),
		.auto_in_w_ready(_axi4frag_auto_in_w_ready),
		.auto_in_w_valid(_axi4index_auto_out_w_valid),
		.auto_in_w_bits_data(_axi4index_auto_out_w_bits_data),
		.auto_in_w_bits_strb(_axi4index_auto_out_w_bits_strb),
		.auto_in_w_bits_last(_axi4index_auto_out_w_bits_last),
		.auto_in_b_ready(_axi4index_auto_out_b_ready),
		.auto_in_b_valid(_axi4frag_auto_in_b_valid),
		.auto_in_b_bits_id(_axi4frag_auto_in_b_bits_id),
		.auto_in_b_bits_resp(_axi4frag_auto_in_b_bits_resp),
		.auto_in_b_bits_echo_extra_id(_axi4frag_auto_in_b_bits_echo_extra_id),
		.auto_in_ar_ready(_axi4frag_auto_in_ar_ready),
		.auto_in_ar_valid(_axi4index_auto_out_ar_valid),
		.auto_in_ar_bits_id(_axi4index_auto_out_ar_bits_id),
		.auto_in_ar_bits_addr(_axi4index_auto_out_ar_bits_addr),
		.auto_in_ar_bits_len(_axi4index_auto_out_ar_bits_len),
		.auto_in_ar_bits_size(_axi4index_auto_out_ar_bits_size),
		.auto_in_ar_bits_burst(_axi4index_auto_out_ar_bits_burst),
		.auto_in_ar_bits_lock(_axi4index_auto_out_ar_bits_lock),
		.auto_in_ar_bits_cache(_axi4index_auto_out_ar_bits_cache),
		.auto_in_ar_bits_prot(_axi4index_auto_out_ar_bits_prot),
		.auto_in_ar_bits_qos(_axi4index_auto_out_ar_bits_qos),
		.auto_in_ar_bits_echo_extra_id(_axi4index_auto_out_ar_bits_echo_extra_id),
		.auto_in_r_ready(_axi4index_auto_out_r_ready),
		.auto_in_r_valid(_axi4frag_auto_in_r_valid),
		.auto_in_r_bits_id(_axi4frag_auto_in_r_bits_id),
		.auto_in_r_bits_data(_axi4frag_auto_in_r_bits_data),
		.auto_in_r_bits_resp(_axi4frag_auto_in_r_bits_resp),
		.auto_in_r_bits_echo_extra_id(_axi4frag_auto_in_r_bits_echo_extra_id),
		.auto_in_r_bits_last(_axi4frag_auto_in_r_bits_last),
		.auto_out_aw_ready(_axi4yank_auto_in_aw_ready),
		.auto_out_aw_valid(_axi4frag_auto_out_aw_valid),
		.auto_out_aw_bits_id(_axi4frag_auto_out_aw_bits_id),
		.auto_out_aw_bits_addr(_axi4frag_auto_out_aw_bits_addr),
		.auto_out_aw_bits_len(_axi4frag_auto_out_aw_bits_len),
		.auto_out_aw_bits_size(_axi4frag_auto_out_aw_bits_size),
		.auto_out_aw_bits_cache(_axi4frag_auto_out_aw_bits_cache),
		.auto_out_aw_bits_prot(_axi4frag_auto_out_aw_bits_prot),
		.auto_out_aw_bits_echo_extra_id(_axi4frag_auto_out_aw_bits_echo_extra_id),
		.auto_out_aw_bits_echo_real_last(_axi4frag_auto_out_aw_bits_echo_real_last),
		.auto_out_w_ready(_axi4yank_auto_in_w_ready),
		.auto_out_w_valid(_axi4frag_auto_out_w_valid),
		.auto_out_w_bits_data(_axi4frag_auto_out_w_bits_data),
		.auto_out_w_bits_strb(_axi4frag_auto_out_w_bits_strb),
		.auto_out_w_bits_last(_axi4frag_auto_out_w_bits_last),
		.auto_out_b_ready(_axi4frag_auto_out_b_ready),
		.auto_out_b_valid(_axi4yank_auto_in_b_valid),
		.auto_out_b_bits_id(_axi4yank_auto_in_b_bits_id),
		.auto_out_b_bits_resp(_axi4yank_auto_in_b_bits_resp),
		.auto_out_b_bits_echo_extra_id(_axi4yank_auto_in_b_bits_echo_extra_id),
		.auto_out_b_bits_echo_real_last(_axi4yank_auto_in_b_bits_echo_real_last),
		.auto_out_ar_ready(_axi4yank_auto_in_ar_ready),
		.auto_out_ar_valid(_axi4frag_auto_out_ar_valid),
		.auto_out_ar_bits_id(_axi4frag_auto_out_ar_bits_id),
		.auto_out_ar_bits_addr(_axi4frag_auto_out_ar_bits_addr),
		.auto_out_ar_bits_len(_axi4frag_auto_out_ar_bits_len),
		.auto_out_ar_bits_size(_axi4frag_auto_out_ar_bits_size),
		.auto_out_ar_bits_cache(_axi4frag_auto_out_ar_bits_cache),
		.auto_out_ar_bits_prot(_axi4frag_auto_out_ar_bits_prot),
		.auto_out_ar_bits_echo_extra_id(_axi4frag_auto_out_ar_bits_echo_extra_id),
		.auto_out_ar_bits_echo_real_last(_axi4frag_auto_out_ar_bits_echo_real_last),
		.auto_out_r_ready(_axi4frag_auto_out_r_ready),
		.auto_out_r_valid(_axi4yank_auto_in_r_valid),
		.auto_out_r_bits_id(_axi4yank_auto_in_r_bits_id),
		.auto_out_r_bits_data(_axi4yank_auto_in_r_bits_data),
		.auto_out_r_bits_resp(_axi4yank_auto_in_r_bits_resp),
		.auto_out_r_bits_echo_extra_id(_axi4yank_auto_in_r_bits_echo_extra_id),
		.auto_out_r_bits_echo_real_last(_axi4yank_auto_in_r_bits_echo_real_last),
		.auto_out_r_bits_last(_axi4yank_auto_in_r_bits_last)
	);
	AXI4IdIndexer_1 axi4index(
		.auto_in_aw_ready(auto_axi4index_in_aw_ready),
		.auto_in_aw_valid(auto_axi4index_in_aw_valid),
		.auto_in_aw_bits_id(auto_axi4index_in_aw_bits_id),
		.auto_in_aw_bits_addr(auto_axi4index_in_aw_bits_addr),
		.auto_in_aw_bits_len(auto_axi4index_in_aw_bits_len),
		.auto_in_aw_bits_size(auto_axi4index_in_aw_bits_size),
		.auto_in_aw_bits_burst(auto_axi4index_in_aw_bits_burst),
		.auto_in_aw_bits_lock(auto_axi4index_in_aw_bits_lock),
		.auto_in_aw_bits_cache(auto_axi4index_in_aw_bits_cache),
		.auto_in_aw_bits_prot(auto_axi4index_in_aw_bits_prot),
		.auto_in_aw_bits_qos(auto_axi4index_in_aw_bits_qos),
		.auto_in_w_ready(auto_axi4index_in_w_ready),
		.auto_in_w_valid(auto_axi4index_in_w_valid),
		.auto_in_w_bits_data(auto_axi4index_in_w_bits_data),
		.auto_in_w_bits_strb(auto_axi4index_in_w_bits_strb),
		.auto_in_w_bits_last(auto_axi4index_in_w_bits_last),
		.auto_in_b_ready(auto_axi4index_in_b_ready),
		.auto_in_b_valid(auto_axi4index_in_b_valid),
		.auto_in_b_bits_id(auto_axi4index_in_b_bits_id),
		.auto_in_b_bits_resp(auto_axi4index_in_b_bits_resp),
		.auto_in_ar_ready(auto_axi4index_in_ar_ready),
		.auto_in_ar_valid(auto_axi4index_in_ar_valid),
		.auto_in_ar_bits_id(auto_axi4index_in_ar_bits_id),
		.auto_in_ar_bits_addr(auto_axi4index_in_ar_bits_addr),
		.auto_in_ar_bits_len(auto_axi4index_in_ar_bits_len),
		.auto_in_ar_bits_size(auto_axi4index_in_ar_bits_size),
		.auto_in_ar_bits_burst(auto_axi4index_in_ar_bits_burst),
		.auto_in_ar_bits_lock(auto_axi4index_in_ar_bits_lock),
		.auto_in_ar_bits_cache(auto_axi4index_in_ar_bits_cache),
		.auto_in_ar_bits_prot(auto_axi4index_in_ar_bits_prot),
		.auto_in_ar_bits_qos(auto_axi4index_in_ar_bits_qos),
		.auto_in_r_ready(auto_axi4index_in_r_ready),
		.auto_in_r_valid(auto_axi4index_in_r_valid),
		.auto_in_r_bits_id(auto_axi4index_in_r_bits_id),
		.auto_in_r_bits_data(auto_axi4index_in_r_bits_data),
		.auto_in_r_bits_resp(auto_axi4index_in_r_bits_resp),
		.auto_in_r_bits_last(auto_axi4index_in_r_bits_last),
		.auto_out_aw_ready(_axi4frag_auto_in_aw_ready),
		.auto_out_aw_valid(_axi4index_auto_out_aw_valid),
		.auto_out_aw_bits_id(_axi4index_auto_out_aw_bits_id),
		.auto_out_aw_bits_addr(_axi4index_auto_out_aw_bits_addr),
		.auto_out_aw_bits_len(_axi4index_auto_out_aw_bits_len),
		.auto_out_aw_bits_size(_axi4index_auto_out_aw_bits_size),
		.auto_out_aw_bits_burst(_axi4index_auto_out_aw_bits_burst),
		.auto_out_aw_bits_lock(_axi4index_auto_out_aw_bits_lock),
		.auto_out_aw_bits_cache(_axi4index_auto_out_aw_bits_cache),
		.auto_out_aw_bits_prot(_axi4index_auto_out_aw_bits_prot),
		.auto_out_aw_bits_qos(_axi4index_auto_out_aw_bits_qos),
		.auto_out_aw_bits_echo_extra_id(_axi4index_auto_out_aw_bits_echo_extra_id),
		.auto_out_w_ready(_axi4frag_auto_in_w_ready),
		.auto_out_w_valid(_axi4index_auto_out_w_valid),
		.auto_out_w_bits_data(_axi4index_auto_out_w_bits_data),
		.auto_out_w_bits_strb(_axi4index_auto_out_w_bits_strb),
		.auto_out_w_bits_last(_axi4index_auto_out_w_bits_last),
		.auto_out_b_ready(_axi4index_auto_out_b_ready),
		.auto_out_b_valid(_axi4frag_auto_in_b_valid),
		.auto_out_b_bits_id(_axi4frag_auto_in_b_bits_id),
		.auto_out_b_bits_resp(_axi4frag_auto_in_b_bits_resp),
		.auto_out_b_bits_echo_extra_id(_axi4frag_auto_in_b_bits_echo_extra_id),
		.auto_out_ar_ready(_axi4frag_auto_in_ar_ready),
		.auto_out_ar_valid(_axi4index_auto_out_ar_valid),
		.auto_out_ar_bits_id(_axi4index_auto_out_ar_bits_id),
		.auto_out_ar_bits_addr(_axi4index_auto_out_ar_bits_addr),
		.auto_out_ar_bits_len(_axi4index_auto_out_ar_bits_len),
		.auto_out_ar_bits_size(_axi4index_auto_out_ar_bits_size),
		.auto_out_ar_bits_burst(_axi4index_auto_out_ar_bits_burst),
		.auto_out_ar_bits_lock(_axi4index_auto_out_ar_bits_lock),
		.auto_out_ar_bits_cache(_axi4index_auto_out_ar_bits_cache),
		.auto_out_ar_bits_prot(_axi4index_auto_out_ar_bits_prot),
		.auto_out_ar_bits_qos(_axi4index_auto_out_ar_bits_qos),
		.auto_out_ar_bits_echo_extra_id(_axi4index_auto_out_ar_bits_echo_extra_id),
		.auto_out_r_ready(_axi4index_auto_out_r_ready),
		.auto_out_r_valid(_axi4frag_auto_in_r_valid),
		.auto_out_r_bits_id(_axi4frag_auto_in_r_bits_id),
		.auto_out_r_bits_data(_axi4frag_auto_in_r_bits_data),
		.auto_out_r_bits_resp(_axi4frag_auto_in_r_bits_resp),
		.auto_out_r_bits_echo_extra_id(_axi4frag_auto_in_r_bits_echo_extra_id),
		.auto_out_r_bits_last(_axi4frag_auto_in_r_bits_last)
	);
endmodule
