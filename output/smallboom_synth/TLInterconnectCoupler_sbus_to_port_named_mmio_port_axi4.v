module TLInterconnectCoupler_sbus_to_port_named_mmio_port_axi4 (
	clock,
	reset,
	auto_axi4buf_out_aw_ready,
	auto_axi4buf_out_aw_valid,
	auto_axi4buf_out_aw_bits_id,
	auto_axi4buf_out_aw_bits_addr,
	auto_axi4buf_out_aw_bits_len,
	auto_axi4buf_out_aw_bits_size,
	auto_axi4buf_out_aw_bits_burst,
	auto_axi4buf_out_aw_bits_lock,
	auto_axi4buf_out_aw_bits_cache,
	auto_axi4buf_out_aw_bits_prot,
	auto_axi4buf_out_aw_bits_qos,
	auto_axi4buf_out_w_ready,
	auto_axi4buf_out_w_valid,
	auto_axi4buf_out_w_bits_data,
	auto_axi4buf_out_w_bits_strb,
	auto_axi4buf_out_w_bits_last,
	auto_axi4buf_out_b_ready,
	auto_axi4buf_out_b_valid,
	auto_axi4buf_out_b_bits_id,
	auto_axi4buf_out_b_bits_resp,
	auto_axi4buf_out_ar_ready,
	auto_axi4buf_out_ar_valid,
	auto_axi4buf_out_ar_bits_id,
	auto_axi4buf_out_ar_bits_addr,
	auto_axi4buf_out_ar_bits_len,
	auto_axi4buf_out_ar_bits_size,
	auto_axi4buf_out_ar_bits_burst,
	auto_axi4buf_out_ar_bits_lock,
	auto_axi4buf_out_ar_bits_cache,
	auto_axi4buf_out_ar_bits_prot,
	auto_axi4buf_out_ar_bits_qos,
	auto_axi4buf_out_r_ready,
	auto_axi4buf_out_r_valid,
	auto_axi4buf_out_r_bits_id,
	auto_axi4buf_out_r_bits_data,
	auto_axi4buf_out_r_bits_resp,
	auto_axi4buf_out_r_bits_last,
	auto_tl_in_a_ready,
	auto_tl_in_a_valid,
	auto_tl_in_a_bits_opcode,
	auto_tl_in_a_bits_param,
	auto_tl_in_a_bits_size,
	auto_tl_in_a_bits_source,
	auto_tl_in_a_bits_address,
	auto_tl_in_a_bits_user_amba_prot_bufferable,
	auto_tl_in_a_bits_user_amba_prot_modifiable,
	auto_tl_in_a_bits_user_amba_prot_readalloc,
	auto_tl_in_a_bits_user_amba_prot_writealloc,
	auto_tl_in_a_bits_user_amba_prot_privileged,
	auto_tl_in_a_bits_user_amba_prot_secure,
	auto_tl_in_a_bits_user_amba_prot_fetch,
	auto_tl_in_a_bits_mask,
	auto_tl_in_a_bits_data,
	auto_tl_in_a_bits_corrupt,
	auto_tl_in_d_ready,
	auto_tl_in_d_valid,
	auto_tl_in_d_bits_opcode,
	auto_tl_in_d_bits_size,
	auto_tl_in_d_bits_source,
	auto_tl_in_d_bits_denied,
	auto_tl_in_d_bits_data,
	auto_tl_in_d_bits_corrupt
);
	input clock;
	input reset;
	input auto_axi4buf_out_aw_ready;
	output wire auto_axi4buf_out_aw_valid;
	output wire [3:0] auto_axi4buf_out_aw_bits_id;
	output wire [30:0] auto_axi4buf_out_aw_bits_addr;
	output wire [7:0] auto_axi4buf_out_aw_bits_len;
	output wire [2:0] auto_axi4buf_out_aw_bits_size;
	output wire [1:0] auto_axi4buf_out_aw_bits_burst;
	output wire auto_axi4buf_out_aw_bits_lock;
	output wire [3:0] auto_axi4buf_out_aw_bits_cache;
	output wire [2:0] auto_axi4buf_out_aw_bits_prot;
	output wire [3:0] auto_axi4buf_out_aw_bits_qos;
	input auto_axi4buf_out_w_ready;
	output wire auto_axi4buf_out_w_valid;
	output wire [63:0] auto_axi4buf_out_w_bits_data;
	output wire [7:0] auto_axi4buf_out_w_bits_strb;
	output wire auto_axi4buf_out_w_bits_last;
	output wire auto_axi4buf_out_b_ready;
	input auto_axi4buf_out_b_valid;
	input [3:0] auto_axi4buf_out_b_bits_id;
	input [1:0] auto_axi4buf_out_b_bits_resp;
	input auto_axi4buf_out_ar_ready;
	output wire auto_axi4buf_out_ar_valid;
	output wire [3:0] auto_axi4buf_out_ar_bits_id;
	output wire [30:0] auto_axi4buf_out_ar_bits_addr;
	output wire [7:0] auto_axi4buf_out_ar_bits_len;
	output wire [2:0] auto_axi4buf_out_ar_bits_size;
	output wire [1:0] auto_axi4buf_out_ar_bits_burst;
	output wire auto_axi4buf_out_ar_bits_lock;
	output wire [3:0] auto_axi4buf_out_ar_bits_cache;
	output wire [2:0] auto_axi4buf_out_ar_bits_prot;
	output wire [3:0] auto_axi4buf_out_ar_bits_qos;
	output wire auto_axi4buf_out_r_ready;
	input auto_axi4buf_out_r_valid;
	input [3:0] auto_axi4buf_out_r_bits_id;
	input [63:0] auto_axi4buf_out_r_bits_data;
	input [1:0] auto_axi4buf_out_r_bits_resp;
	input auto_axi4buf_out_r_bits_last;
	output wire auto_tl_in_a_ready;
	input auto_tl_in_a_valid;
	input [2:0] auto_tl_in_a_bits_opcode;
	input [2:0] auto_tl_in_a_bits_param;
	input [3:0] auto_tl_in_a_bits_size;
	input [4:0] auto_tl_in_a_bits_source;
	input [30:0] auto_tl_in_a_bits_address;
	input auto_tl_in_a_bits_user_amba_prot_bufferable;
	input auto_tl_in_a_bits_user_amba_prot_modifiable;
	input auto_tl_in_a_bits_user_amba_prot_readalloc;
	input auto_tl_in_a_bits_user_amba_prot_writealloc;
	input auto_tl_in_a_bits_user_amba_prot_privileged;
	input auto_tl_in_a_bits_user_amba_prot_secure;
	input auto_tl_in_a_bits_user_amba_prot_fetch;
	input [7:0] auto_tl_in_a_bits_mask;
	input [63:0] auto_tl_in_a_bits_data;
	input auto_tl_in_a_bits_corrupt;
	input auto_tl_in_d_ready;
	output wire auto_tl_in_d_valid;
	output wire [2:0] auto_tl_in_d_bits_opcode;
	output wire [3:0] auto_tl_in_d_bits_size;
	output wire [4:0] auto_tl_in_d_bits_source;
	output wire auto_tl_in_d_bits_denied;
	output wire [63:0] auto_tl_in_d_bits_data;
	output wire auto_tl_in_d_bits_corrupt;
	wire _tl2axi4_auto_out_aw_valid;
	wire [2:0] _tl2axi4_auto_out_aw_bits_id;
	wire [30:0] _tl2axi4_auto_out_aw_bits_addr;
	wire [7:0] _tl2axi4_auto_out_aw_bits_len;
	wire [2:0] _tl2axi4_auto_out_aw_bits_size;
	wire [1:0] _tl2axi4_auto_out_aw_bits_burst;
	wire _tl2axi4_auto_out_aw_bits_lock;
	wire [3:0] _tl2axi4_auto_out_aw_bits_cache;
	wire [2:0] _tl2axi4_auto_out_aw_bits_prot;
	wire [3:0] _tl2axi4_auto_out_aw_bits_qos;
	wire [3:0] _tl2axi4_auto_out_aw_bits_echo_tl_state_size;
	wire [4:0] _tl2axi4_auto_out_aw_bits_echo_tl_state_source;
	wire _tl2axi4_auto_out_w_valid;
	wire [63:0] _tl2axi4_auto_out_w_bits_data;
	wire [7:0] _tl2axi4_auto_out_w_bits_strb;
	wire _tl2axi4_auto_out_w_bits_last;
	wire _tl2axi4_auto_out_b_ready;
	wire _tl2axi4_auto_out_ar_valid;
	wire [2:0] _tl2axi4_auto_out_ar_bits_id;
	wire [30:0] _tl2axi4_auto_out_ar_bits_addr;
	wire [7:0] _tl2axi4_auto_out_ar_bits_len;
	wire [2:0] _tl2axi4_auto_out_ar_bits_size;
	wire [1:0] _tl2axi4_auto_out_ar_bits_burst;
	wire _tl2axi4_auto_out_ar_bits_lock;
	wire [3:0] _tl2axi4_auto_out_ar_bits_cache;
	wire [2:0] _tl2axi4_auto_out_ar_bits_prot;
	wire [3:0] _tl2axi4_auto_out_ar_bits_qos;
	wire [3:0] _tl2axi4_auto_out_ar_bits_echo_tl_state_size;
	wire [4:0] _tl2axi4_auto_out_ar_bits_echo_tl_state_source;
	wire _tl2axi4_auto_out_r_ready;
	wire _axi4index_auto_in_aw_ready;
	wire _axi4index_auto_in_w_ready;
	wire _axi4index_auto_in_b_valid;
	wire [2:0] _axi4index_auto_in_b_bits_id;
	wire [1:0] _axi4index_auto_in_b_bits_resp;
	wire [3:0] _axi4index_auto_in_b_bits_echo_tl_state_size;
	wire [4:0] _axi4index_auto_in_b_bits_echo_tl_state_source;
	wire _axi4index_auto_in_ar_ready;
	wire _axi4index_auto_in_r_valid;
	wire [2:0] _axi4index_auto_in_r_bits_id;
	wire [63:0] _axi4index_auto_in_r_bits_data;
	wire [1:0] _axi4index_auto_in_r_bits_resp;
	wire [3:0] _axi4index_auto_in_r_bits_echo_tl_state_size;
	wire [4:0] _axi4index_auto_in_r_bits_echo_tl_state_source;
	wire _axi4index_auto_in_r_bits_last;
	wire _axi4index_auto_out_aw_valid;
	wire [3:0] _axi4index_auto_out_aw_bits_id;
	wire [30:0] _axi4index_auto_out_aw_bits_addr;
	wire [7:0] _axi4index_auto_out_aw_bits_len;
	wire [2:0] _axi4index_auto_out_aw_bits_size;
	wire [1:0] _axi4index_auto_out_aw_bits_burst;
	wire _axi4index_auto_out_aw_bits_lock;
	wire [3:0] _axi4index_auto_out_aw_bits_cache;
	wire [2:0] _axi4index_auto_out_aw_bits_prot;
	wire [3:0] _axi4index_auto_out_aw_bits_qos;
	wire [3:0] _axi4index_auto_out_aw_bits_echo_tl_state_size;
	wire [4:0] _axi4index_auto_out_aw_bits_echo_tl_state_source;
	wire _axi4index_auto_out_w_valid;
	wire [63:0] _axi4index_auto_out_w_bits_data;
	wire [7:0] _axi4index_auto_out_w_bits_strb;
	wire _axi4index_auto_out_w_bits_last;
	wire _axi4index_auto_out_b_ready;
	wire _axi4index_auto_out_ar_valid;
	wire [3:0] _axi4index_auto_out_ar_bits_id;
	wire [30:0] _axi4index_auto_out_ar_bits_addr;
	wire [7:0] _axi4index_auto_out_ar_bits_len;
	wire [2:0] _axi4index_auto_out_ar_bits_size;
	wire [1:0] _axi4index_auto_out_ar_bits_burst;
	wire _axi4index_auto_out_ar_bits_lock;
	wire [3:0] _axi4index_auto_out_ar_bits_cache;
	wire [2:0] _axi4index_auto_out_ar_bits_prot;
	wire [3:0] _axi4index_auto_out_ar_bits_qos;
	wire [3:0] _axi4index_auto_out_ar_bits_echo_tl_state_size;
	wire [4:0] _axi4index_auto_out_ar_bits_echo_tl_state_source;
	wire _axi4index_auto_out_r_ready;
	wire _axi4deint_auto_anon_in_aw_ready;
	wire _axi4deint_auto_anon_in_w_ready;
	wire _axi4deint_auto_anon_in_b_valid;
	wire [3:0] _axi4deint_auto_anon_in_b_bits_id;
	wire [1:0] _axi4deint_auto_anon_in_b_bits_resp;
	wire [3:0] _axi4deint_auto_anon_in_b_bits_echo_tl_state_size;
	wire [4:0] _axi4deint_auto_anon_in_b_bits_echo_tl_state_source;
	wire _axi4deint_auto_anon_in_ar_ready;
	wire _axi4deint_auto_anon_in_r_valid;
	wire [3:0] _axi4deint_auto_anon_in_r_bits_id;
	wire [63:0] _axi4deint_auto_anon_in_r_bits_data;
	wire [1:0] _axi4deint_auto_anon_in_r_bits_resp;
	wire [3:0] _axi4deint_auto_anon_in_r_bits_echo_tl_state_size;
	wire [4:0] _axi4deint_auto_anon_in_r_bits_echo_tl_state_source;
	wire _axi4deint_auto_anon_in_r_bits_last;
	wire _axi4deint_auto_anon_out_aw_valid;
	wire [3:0] _axi4deint_auto_anon_out_aw_bits_id;
	wire [30:0] _axi4deint_auto_anon_out_aw_bits_addr;
	wire [7:0] _axi4deint_auto_anon_out_aw_bits_len;
	wire [2:0] _axi4deint_auto_anon_out_aw_bits_size;
	wire [1:0] _axi4deint_auto_anon_out_aw_bits_burst;
	wire _axi4deint_auto_anon_out_aw_bits_lock;
	wire [3:0] _axi4deint_auto_anon_out_aw_bits_cache;
	wire [2:0] _axi4deint_auto_anon_out_aw_bits_prot;
	wire [3:0] _axi4deint_auto_anon_out_aw_bits_qos;
	wire [3:0] _axi4deint_auto_anon_out_aw_bits_echo_tl_state_size;
	wire [4:0] _axi4deint_auto_anon_out_aw_bits_echo_tl_state_source;
	wire _axi4deint_auto_anon_out_w_valid;
	wire [63:0] _axi4deint_auto_anon_out_w_bits_data;
	wire [7:0] _axi4deint_auto_anon_out_w_bits_strb;
	wire _axi4deint_auto_anon_out_w_bits_last;
	wire _axi4deint_auto_anon_out_b_ready;
	wire _axi4deint_auto_anon_out_ar_valid;
	wire [3:0] _axi4deint_auto_anon_out_ar_bits_id;
	wire [30:0] _axi4deint_auto_anon_out_ar_bits_addr;
	wire [7:0] _axi4deint_auto_anon_out_ar_bits_len;
	wire [2:0] _axi4deint_auto_anon_out_ar_bits_size;
	wire [1:0] _axi4deint_auto_anon_out_ar_bits_burst;
	wire _axi4deint_auto_anon_out_ar_bits_lock;
	wire [3:0] _axi4deint_auto_anon_out_ar_bits_cache;
	wire [2:0] _axi4deint_auto_anon_out_ar_bits_prot;
	wire [3:0] _axi4deint_auto_anon_out_ar_bits_qos;
	wire [3:0] _axi4deint_auto_anon_out_ar_bits_echo_tl_state_size;
	wire [4:0] _axi4deint_auto_anon_out_ar_bits_echo_tl_state_source;
	wire _axi4deint_auto_anon_out_r_ready;
	wire _axi4yank_auto_in_aw_ready;
	wire _axi4yank_auto_in_w_ready;
	wire _axi4yank_auto_in_b_valid;
	wire [3:0] _axi4yank_auto_in_b_bits_id;
	wire [1:0] _axi4yank_auto_in_b_bits_resp;
	wire [3:0] _axi4yank_auto_in_b_bits_echo_tl_state_size;
	wire [4:0] _axi4yank_auto_in_b_bits_echo_tl_state_source;
	wire _axi4yank_auto_in_ar_ready;
	wire _axi4yank_auto_in_r_valid;
	wire [3:0] _axi4yank_auto_in_r_bits_id;
	wire [63:0] _axi4yank_auto_in_r_bits_data;
	wire [1:0] _axi4yank_auto_in_r_bits_resp;
	wire [3:0] _axi4yank_auto_in_r_bits_echo_tl_state_size;
	wire [4:0] _axi4yank_auto_in_r_bits_echo_tl_state_source;
	wire _axi4yank_auto_in_r_bits_last;
	wire _axi4yank_auto_out_aw_valid;
	wire [3:0] _axi4yank_auto_out_aw_bits_id;
	wire [30:0] _axi4yank_auto_out_aw_bits_addr;
	wire [7:0] _axi4yank_auto_out_aw_bits_len;
	wire [2:0] _axi4yank_auto_out_aw_bits_size;
	wire [1:0] _axi4yank_auto_out_aw_bits_burst;
	wire _axi4yank_auto_out_aw_bits_lock;
	wire [3:0] _axi4yank_auto_out_aw_bits_cache;
	wire [2:0] _axi4yank_auto_out_aw_bits_prot;
	wire [3:0] _axi4yank_auto_out_aw_bits_qos;
	wire _axi4yank_auto_out_w_valid;
	wire [63:0] _axi4yank_auto_out_w_bits_data;
	wire [7:0] _axi4yank_auto_out_w_bits_strb;
	wire _axi4yank_auto_out_w_bits_last;
	wire _axi4yank_auto_out_b_ready;
	wire _axi4yank_auto_out_ar_valid;
	wire [3:0] _axi4yank_auto_out_ar_bits_id;
	wire [30:0] _axi4yank_auto_out_ar_bits_addr;
	wire [7:0] _axi4yank_auto_out_ar_bits_len;
	wire [2:0] _axi4yank_auto_out_ar_bits_size;
	wire [1:0] _axi4yank_auto_out_ar_bits_burst;
	wire _axi4yank_auto_out_ar_bits_lock;
	wire [3:0] _axi4yank_auto_out_ar_bits_cache;
	wire [2:0] _axi4yank_auto_out_ar_bits_prot;
	wire [3:0] _axi4yank_auto_out_ar_bits_qos;
	wire _axi4yank_auto_out_r_ready;
	wire _axi4buf_auto_in_aw_ready;
	wire _axi4buf_auto_in_w_ready;
	wire _axi4buf_auto_in_b_valid;
	wire [3:0] _axi4buf_auto_in_b_bits_id;
	wire [1:0] _axi4buf_auto_in_b_bits_resp;
	wire _axi4buf_auto_in_ar_ready;
	wire _axi4buf_auto_in_r_valid;
	wire [3:0] _axi4buf_auto_in_r_bits_id;
	wire [63:0] _axi4buf_auto_in_r_bits_data;
	wire [1:0] _axi4buf_auto_in_r_bits_resp;
	wire _axi4buf_auto_in_r_bits_last;
	AXI4Buffer axi4buf(
		.clock(clock),
		.reset(reset),
		.auto_in_aw_ready(_axi4buf_auto_in_aw_ready),
		.auto_in_aw_valid(_axi4yank_auto_out_aw_valid),
		.auto_in_aw_bits_id(_axi4yank_auto_out_aw_bits_id),
		.auto_in_aw_bits_addr(_axi4yank_auto_out_aw_bits_addr),
		.auto_in_aw_bits_len(_axi4yank_auto_out_aw_bits_len),
		.auto_in_aw_bits_size(_axi4yank_auto_out_aw_bits_size),
		.auto_in_aw_bits_burst(_axi4yank_auto_out_aw_bits_burst),
		.auto_in_aw_bits_lock(_axi4yank_auto_out_aw_bits_lock),
		.auto_in_aw_bits_cache(_axi4yank_auto_out_aw_bits_cache),
		.auto_in_aw_bits_prot(_axi4yank_auto_out_aw_bits_prot),
		.auto_in_aw_bits_qos(_axi4yank_auto_out_aw_bits_qos),
		.auto_in_w_ready(_axi4buf_auto_in_w_ready),
		.auto_in_w_valid(_axi4yank_auto_out_w_valid),
		.auto_in_w_bits_data(_axi4yank_auto_out_w_bits_data),
		.auto_in_w_bits_strb(_axi4yank_auto_out_w_bits_strb),
		.auto_in_w_bits_last(_axi4yank_auto_out_w_bits_last),
		.auto_in_b_ready(_axi4yank_auto_out_b_ready),
		.auto_in_b_valid(_axi4buf_auto_in_b_valid),
		.auto_in_b_bits_id(_axi4buf_auto_in_b_bits_id),
		.auto_in_b_bits_resp(_axi4buf_auto_in_b_bits_resp),
		.auto_in_ar_ready(_axi4buf_auto_in_ar_ready),
		.auto_in_ar_valid(_axi4yank_auto_out_ar_valid),
		.auto_in_ar_bits_id(_axi4yank_auto_out_ar_bits_id),
		.auto_in_ar_bits_addr(_axi4yank_auto_out_ar_bits_addr),
		.auto_in_ar_bits_len(_axi4yank_auto_out_ar_bits_len),
		.auto_in_ar_bits_size(_axi4yank_auto_out_ar_bits_size),
		.auto_in_ar_bits_burst(_axi4yank_auto_out_ar_bits_burst),
		.auto_in_ar_bits_lock(_axi4yank_auto_out_ar_bits_lock),
		.auto_in_ar_bits_cache(_axi4yank_auto_out_ar_bits_cache),
		.auto_in_ar_bits_prot(_axi4yank_auto_out_ar_bits_prot),
		.auto_in_ar_bits_qos(_axi4yank_auto_out_ar_bits_qos),
		.auto_in_r_ready(_axi4yank_auto_out_r_ready),
		.auto_in_r_valid(_axi4buf_auto_in_r_valid),
		.auto_in_r_bits_id(_axi4buf_auto_in_r_bits_id),
		.auto_in_r_bits_data(_axi4buf_auto_in_r_bits_data),
		.auto_in_r_bits_resp(_axi4buf_auto_in_r_bits_resp),
		.auto_in_r_bits_last(_axi4buf_auto_in_r_bits_last),
		.auto_out_aw_ready(auto_axi4buf_out_aw_ready),
		.auto_out_aw_valid(auto_axi4buf_out_aw_valid),
		.auto_out_aw_bits_id(auto_axi4buf_out_aw_bits_id),
		.auto_out_aw_bits_addr(auto_axi4buf_out_aw_bits_addr),
		.auto_out_aw_bits_len(auto_axi4buf_out_aw_bits_len),
		.auto_out_aw_bits_size(auto_axi4buf_out_aw_bits_size),
		.auto_out_aw_bits_burst(auto_axi4buf_out_aw_bits_burst),
		.auto_out_aw_bits_lock(auto_axi4buf_out_aw_bits_lock),
		.auto_out_aw_bits_cache(auto_axi4buf_out_aw_bits_cache),
		.auto_out_aw_bits_prot(auto_axi4buf_out_aw_bits_prot),
		.auto_out_aw_bits_qos(auto_axi4buf_out_aw_bits_qos),
		.auto_out_w_ready(auto_axi4buf_out_w_ready),
		.auto_out_w_valid(auto_axi4buf_out_w_valid),
		.auto_out_w_bits_data(auto_axi4buf_out_w_bits_data),
		.auto_out_w_bits_strb(auto_axi4buf_out_w_bits_strb),
		.auto_out_w_bits_last(auto_axi4buf_out_w_bits_last),
		.auto_out_b_ready(auto_axi4buf_out_b_ready),
		.auto_out_b_valid(auto_axi4buf_out_b_valid),
		.auto_out_b_bits_id(auto_axi4buf_out_b_bits_id),
		.auto_out_b_bits_resp(auto_axi4buf_out_b_bits_resp),
		.auto_out_ar_ready(auto_axi4buf_out_ar_ready),
		.auto_out_ar_valid(auto_axi4buf_out_ar_valid),
		.auto_out_ar_bits_id(auto_axi4buf_out_ar_bits_id),
		.auto_out_ar_bits_addr(auto_axi4buf_out_ar_bits_addr),
		.auto_out_ar_bits_len(auto_axi4buf_out_ar_bits_len),
		.auto_out_ar_bits_size(auto_axi4buf_out_ar_bits_size),
		.auto_out_ar_bits_burst(auto_axi4buf_out_ar_bits_burst),
		.auto_out_ar_bits_lock(auto_axi4buf_out_ar_bits_lock),
		.auto_out_ar_bits_cache(auto_axi4buf_out_ar_bits_cache),
		.auto_out_ar_bits_prot(auto_axi4buf_out_ar_bits_prot),
		.auto_out_ar_bits_qos(auto_axi4buf_out_ar_bits_qos),
		.auto_out_r_ready(auto_axi4buf_out_r_ready),
		.auto_out_r_valid(auto_axi4buf_out_r_valid),
		.auto_out_r_bits_id(auto_axi4buf_out_r_bits_id),
		.auto_out_r_bits_data(auto_axi4buf_out_r_bits_data),
		.auto_out_r_bits_resp(auto_axi4buf_out_r_bits_resp),
		.auto_out_r_bits_last(auto_axi4buf_out_r_bits_last)
	);
	AXI4UserYanker axi4yank(
		.clock(clock),
		.reset(reset),
		.auto_in_aw_ready(_axi4yank_auto_in_aw_ready),
		.auto_in_aw_valid(_axi4deint_auto_anon_out_aw_valid),
		.auto_in_aw_bits_id(_axi4deint_auto_anon_out_aw_bits_id),
		.auto_in_aw_bits_addr(_axi4deint_auto_anon_out_aw_bits_addr),
		.auto_in_aw_bits_len(_axi4deint_auto_anon_out_aw_bits_len),
		.auto_in_aw_bits_size(_axi4deint_auto_anon_out_aw_bits_size),
		.auto_in_aw_bits_burst(_axi4deint_auto_anon_out_aw_bits_burst),
		.auto_in_aw_bits_lock(_axi4deint_auto_anon_out_aw_bits_lock),
		.auto_in_aw_bits_cache(_axi4deint_auto_anon_out_aw_bits_cache),
		.auto_in_aw_bits_prot(_axi4deint_auto_anon_out_aw_bits_prot),
		.auto_in_aw_bits_qos(_axi4deint_auto_anon_out_aw_bits_qos),
		.auto_in_aw_bits_echo_tl_state_size(_axi4deint_auto_anon_out_aw_bits_echo_tl_state_size),
		.auto_in_aw_bits_echo_tl_state_source(_axi4deint_auto_anon_out_aw_bits_echo_tl_state_source),
		.auto_in_w_ready(_axi4yank_auto_in_w_ready),
		.auto_in_w_valid(_axi4deint_auto_anon_out_w_valid),
		.auto_in_w_bits_data(_axi4deint_auto_anon_out_w_bits_data),
		.auto_in_w_bits_strb(_axi4deint_auto_anon_out_w_bits_strb),
		.auto_in_w_bits_last(_axi4deint_auto_anon_out_w_bits_last),
		.auto_in_b_ready(_axi4deint_auto_anon_out_b_ready),
		.auto_in_b_valid(_axi4yank_auto_in_b_valid),
		.auto_in_b_bits_id(_axi4yank_auto_in_b_bits_id),
		.auto_in_b_bits_resp(_axi4yank_auto_in_b_bits_resp),
		.auto_in_b_bits_echo_tl_state_size(_axi4yank_auto_in_b_bits_echo_tl_state_size),
		.auto_in_b_bits_echo_tl_state_source(_axi4yank_auto_in_b_bits_echo_tl_state_source),
		.auto_in_ar_ready(_axi4yank_auto_in_ar_ready),
		.auto_in_ar_valid(_axi4deint_auto_anon_out_ar_valid),
		.auto_in_ar_bits_id(_axi4deint_auto_anon_out_ar_bits_id),
		.auto_in_ar_bits_addr(_axi4deint_auto_anon_out_ar_bits_addr),
		.auto_in_ar_bits_len(_axi4deint_auto_anon_out_ar_bits_len),
		.auto_in_ar_bits_size(_axi4deint_auto_anon_out_ar_bits_size),
		.auto_in_ar_bits_burst(_axi4deint_auto_anon_out_ar_bits_burst),
		.auto_in_ar_bits_lock(_axi4deint_auto_anon_out_ar_bits_lock),
		.auto_in_ar_bits_cache(_axi4deint_auto_anon_out_ar_bits_cache),
		.auto_in_ar_bits_prot(_axi4deint_auto_anon_out_ar_bits_prot),
		.auto_in_ar_bits_qos(_axi4deint_auto_anon_out_ar_bits_qos),
		.auto_in_ar_bits_echo_tl_state_size(_axi4deint_auto_anon_out_ar_bits_echo_tl_state_size),
		.auto_in_ar_bits_echo_tl_state_source(_axi4deint_auto_anon_out_ar_bits_echo_tl_state_source),
		.auto_in_r_ready(_axi4deint_auto_anon_out_r_ready),
		.auto_in_r_valid(_axi4yank_auto_in_r_valid),
		.auto_in_r_bits_id(_axi4yank_auto_in_r_bits_id),
		.auto_in_r_bits_data(_axi4yank_auto_in_r_bits_data),
		.auto_in_r_bits_resp(_axi4yank_auto_in_r_bits_resp),
		.auto_in_r_bits_echo_tl_state_size(_axi4yank_auto_in_r_bits_echo_tl_state_size),
		.auto_in_r_bits_echo_tl_state_source(_axi4yank_auto_in_r_bits_echo_tl_state_source),
		.auto_in_r_bits_last(_axi4yank_auto_in_r_bits_last),
		.auto_out_aw_ready(_axi4buf_auto_in_aw_ready),
		.auto_out_aw_valid(_axi4yank_auto_out_aw_valid),
		.auto_out_aw_bits_id(_axi4yank_auto_out_aw_bits_id),
		.auto_out_aw_bits_addr(_axi4yank_auto_out_aw_bits_addr),
		.auto_out_aw_bits_len(_axi4yank_auto_out_aw_bits_len),
		.auto_out_aw_bits_size(_axi4yank_auto_out_aw_bits_size),
		.auto_out_aw_bits_burst(_axi4yank_auto_out_aw_bits_burst),
		.auto_out_aw_bits_lock(_axi4yank_auto_out_aw_bits_lock),
		.auto_out_aw_bits_cache(_axi4yank_auto_out_aw_bits_cache),
		.auto_out_aw_bits_prot(_axi4yank_auto_out_aw_bits_prot),
		.auto_out_aw_bits_qos(_axi4yank_auto_out_aw_bits_qos),
		.auto_out_w_ready(_axi4buf_auto_in_w_ready),
		.auto_out_w_valid(_axi4yank_auto_out_w_valid),
		.auto_out_w_bits_data(_axi4yank_auto_out_w_bits_data),
		.auto_out_w_bits_strb(_axi4yank_auto_out_w_bits_strb),
		.auto_out_w_bits_last(_axi4yank_auto_out_w_bits_last),
		.auto_out_b_ready(_axi4yank_auto_out_b_ready),
		.auto_out_b_valid(_axi4buf_auto_in_b_valid),
		.auto_out_b_bits_id(_axi4buf_auto_in_b_bits_id),
		.auto_out_b_bits_resp(_axi4buf_auto_in_b_bits_resp),
		.auto_out_ar_ready(_axi4buf_auto_in_ar_ready),
		.auto_out_ar_valid(_axi4yank_auto_out_ar_valid),
		.auto_out_ar_bits_id(_axi4yank_auto_out_ar_bits_id),
		.auto_out_ar_bits_addr(_axi4yank_auto_out_ar_bits_addr),
		.auto_out_ar_bits_len(_axi4yank_auto_out_ar_bits_len),
		.auto_out_ar_bits_size(_axi4yank_auto_out_ar_bits_size),
		.auto_out_ar_bits_burst(_axi4yank_auto_out_ar_bits_burst),
		.auto_out_ar_bits_lock(_axi4yank_auto_out_ar_bits_lock),
		.auto_out_ar_bits_cache(_axi4yank_auto_out_ar_bits_cache),
		.auto_out_ar_bits_prot(_axi4yank_auto_out_ar_bits_prot),
		.auto_out_ar_bits_qos(_axi4yank_auto_out_ar_bits_qos),
		.auto_out_r_ready(_axi4yank_auto_out_r_ready),
		.auto_out_r_valid(_axi4buf_auto_in_r_valid),
		.auto_out_r_bits_id(_axi4buf_auto_in_r_bits_id),
		.auto_out_r_bits_data(_axi4buf_auto_in_r_bits_data),
		.auto_out_r_bits_resp(_axi4buf_auto_in_r_bits_resp),
		.auto_out_r_bits_last(_axi4buf_auto_in_r_bits_last)
	);
	AXI4Deinterleaver axi4deint(
		.clock(clock),
		.reset(reset),
		.auto_anon_in_aw_ready(_axi4deint_auto_anon_in_aw_ready),
		.auto_anon_in_aw_valid(_axi4index_auto_out_aw_valid),
		.auto_anon_in_aw_bits_id(_axi4index_auto_out_aw_bits_id),
		.auto_anon_in_aw_bits_addr(_axi4index_auto_out_aw_bits_addr),
		.auto_anon_in_aw_bits_len(_axi4index_auto_out_aw_bits_len),
		.auto_anon_in_aw_bits_size(_axi4index_auto_out_aw_bits_size),
		.auto_anon_in_aw_bits_burst(_axi4index_auto_out_aw_bits_burst),
		.auto_anon_in_aw_bits_lock(_axi4index_auto_out_aw_bits_lock),
		.auto_anon_in_aw_bits_cache(_axi4index_auto_out_aw_bits_cache),
		.auto_anon_in_aw_bits_prot(_axi4index_auto_out_aw_bits_prot),
		.auto_anon_in_aw_bits_qos(_axi4index_auto_out_aw_bits_qos),
		.auto_anon_in_aw_bits_echo_tl_state_size(_axi4index_auto_out_aw_bits_echo_tl_state_size),
		.auto_anon_in_aw_bits_echo_tl_state_source(_axi4index_auto_out_aw_bits_echo_tl_state_source),
		.auto_anon_in_w_ready(_axi4deint_auto_anon_in_w_ready),
		.auto_anon_in_w_valid(_axi4index_auto_out_w_valid),
		.auto_anon_in_w_bits_data(_axi4index_auto_out_w_bits_data),
		.auto_anon_in_w_bits_strb(_axi4index_auto_out_w_bits_strb),
		.auto_anon_in_w_bits_last(_axi4index_auto_out_w_bits_last),
		.auto_anon_in_b_ready(_axi4index_auto_out_b_ready),
		.auto_anon_in_b_valid(_axi4deint_auto_anon_in_b_valid),
		.auto_anon_in_b_bits_id(_axi4deint_auto_anon_in_b_bits_id),
		.auto_anon_in_b_bits_resp(_axi4deint_auto_anon_in_b_bits_resp),
		.auto_anon_in_b_bits_echo_tl_state_size(_axi4deint_auto_anon_in_b_bits_echo_tl_state_size),
		.auto_anon_in_b_bits_echo_tl_state_source(_axi4deint_auto_anon_in_b_bits_echo_tl_state_source),
		.auto_anon_in_ar_ready(_axi4deint_auto_anon_in_ar_ready),
		.auto_anon_in_ar_valid(_axi4index_auto_out_ar_valid),
		.auto_anon_in_ar_bits_id(_axi4index_auto_out_ar_bits_id),
		.auto_anon_in_ar_bits_addr(_axi4index_auto_out_ar_bits_addr),
		.auto_anon_in_ar_bits_len(_axi4index_auto_out_ar_bits_len),
		.auto_anon_in_ar_bits_size(_axi4index_auto_out_ar_bits_size),
		.auto_anon_in_ar_bits_burst(_axi4index_auto_out_ar_bits_burst),
		.auto_anon_in_ar_bits_lock(_axi4index_auto_out_ar_bits_lock),
		.auto_anon_in_ar_bits_cache(_axi4index_auto_out_ar_bits_cache),
		.auto_anon_in_ar_bits_prot(_axi4index_auto_out_ar_bits_prot),
		.auto_anon_in_ar_bits_qos(_axi4index_auto_out_ar_bits_qos),
		.auto_anon_in_ar_bits_echo_tl_state_size(_axi4index_auto_out_ar_bits_echo_tl_state_size),
		.auto_anon_in_ar_bits_echo_tl_state_source(_axi4index_auto_out_ar_bits_echo_tl_state_source),
		.auto_anon_in_r_ready(_axi4index_auto_out_r_ready),
		.auto_anon_in_r_valid(_axi4deint_auto_anon_in_r_valid),
		.auto_anon_in_r_bits_id(_axi4deint_auto_anon_in_r_bits_id),
		.auto_anon_in_r_bits_data(_axi4deint_auto_anon_in_r_bits_data),
		.auto_anon_in_r_bits_resp(_axi4deint_auto_anon_in_r_bits_resp),
		.auto_anon_in_r_bits_echo_tl_state_size(_axi4deint_auto_anon_in_r_bits_echo_tl_state_size),
		.auto_anon_in_r_bits_echo_tl_state_source(_axi4deint_auto_anon_in_r_bits_echo_tl_state_source),
		.auto_anon_in_r_bits_last(_axi4deint_auto_anon_in_r_bits_last),
		.auto_anon_out_aw_ready(_axi4yank_auto_in_aw_ready),
		.auto_anon_out_aw_valid(_axi4deint_auto_anon_out_aw_valid),
		.auto_anon_out_aw_bits_id(_axi4deint_auto_anon_out_aw_bits_id),
		.auto_anon_out_aw_bits_addr(_axi4deint_auto_anon_out_aw_bits_addr),
		.auto_anon_out_aw_bits_len(_axi4deint_auto_anon_out_aw_bits_len),
		.auto_anon_out_aw_bits_size(_axi4deint_auto_anon_out_aw_bits_size),
		.auto_anon_out_aw_bits_burst(_axi4deint_auto_anon_out_aw_bits_burst),
		.auto_anon_out_aw_bits_lock(_axi4deint_auto_anon_out_aw_bits_lock),
		.auto_anon_out_aw_bits_cache(_axi4deint_auto_anon_out_aw_bits_cache),
		.auto_anon_out_aw_bits_prot(_axi4deint_auto_anon_out_aw_bits_prot),
		.auto_anon_out_aw_bits_qos(_axi4deint_auto_anon_out_aw_bits_qos),
		.auto_anon_out_aw_bits_echo_tl_state_size(_axi4deint_auto_anon_out_aw_bits_echo_tl_state_size),
		.auto_anon_out_aw_bits_echo_tl_state_source(_axi4deint_auto_anon_out_aw_bits_echo_tl_state_source),
		.auto_anon_out_w_ready(_axi4yank_auto_in_w_ready),
		.auto_anon_out_w_valid(_axi4deint_auto_anon_out_w_valid),
		.auto_anon_out_w_bits_data(_axi4deint_auto_anon_out_w_bits_data),
		.auto_anon_out_w_bits_strb(_axi4deint_auto_anon_out_w_bits_strb),
		.auto_anon_out_w_bits_last(_axi4deint_auto_anon_out_w_bits_last),
		.auto_anon_out_b_ready(_axi4deint_auto_anon_out_b_ready),
		.auto_anon_out_b_valid(_axi4yank_auto_in_b_valid),
		.auto_anon_out_b_bits_id(_axi4yank_auto_in_b_bits_id),
		.auto_anon_out_b_bits_resp(_axi4yank_auto_in_b_bits_resp),
		.auto_anon_out_b_bits_echo_tl_state_size(_axi4yank_auto_in_b_bits_echo_tl_state_size),
		.auto_anon_out_b_bits_echo_tl_state_source(_axi4yank_auto_in_b_bits_echo_tl_state_source),
		.auto_anon_out_ar_ready(_axi4yank_auto_in_ar_ready),
		.auto_anon_out_ar_valid(_axi4deint_auto_anon_out_ar_valid),
		.auto_anon_out_ar_bits_id(_axi4deint_auto_anon_out_ar_bits_id),
		.auto_anon_out_ar_bits_addr(_axi4deint_auto_anon_out_ar_bits_addr),
		.auto_anon_out_ar_bits_len(_axi4deint_auto_anon_out_ar_bits_len),
		.auto_anon_out_ar_bits_size(_axi4deint_auto_anon_out_ar_bits_size),
		.auto_anon_out_ar_bits_burst(_axi4deint_auto_anon_out_ar_bits_burst),
		.auto_anon_out_ar_bits_lock(_axi4deint_auto_anon_out_ar_bits_lock),
		.auto_anon_out_ar_bits_cache(_axi4deint_auto_anon_out_ar_bits_cache),
		.auto_anon_out_ar_bits_prot(_axi4deint_auto_anon_out_ar_bits_prot),
		.auto_anon_out_ar_bits_qos(_axi4deint_auto_anon_out_ar_bits_qos),
		.auto_anon_out_ar_bits_echo_tl_state_size(_axi4deint_auto_anon_out_ar_bits_echo_tl_state_size),
		.auto_anon_out_ar_bits_echo_tl_state_source(_axi4deint_auto_anon_out_ar_bits_echo_tl_state_source),
		.auto_anon_out_r_ready(_axi4deint_auto_anon_out_r_ready),
		.auto_anon_out_r_valid(_axi4yank_auto_in_r_valid),
		.auto_anon_out_r_bits_id(_axi4yank_auto_in_r_bits_id),
		.auto_anon_out_r_bits_data(_axi4yank_auto_in_r_bits_data),
		.auto_anon_out_r_bits_resp(_axi4yank_auto_in_r_bits_resp),
		.auto_anon_out_r_bits_echo_tl_state_size(_axi4yank_auto_in_r_bits_echo_tl_state_size),
		.auto_anon_out_r_bits_echo_tl_state_source(_axi4yank_auto_in_r_bits_echo_tl_state_source),
		.auto_anon_out_r_bits_last(_axi4yank_auto_in_r_bits_last)
	);
	AXI4IdIndexer axi4index(
		.auto_in_aw_ready(_axi4index_auto_in_aw_ready),
		.auto_in_aw_valid(_tl2axi4_auto_out_aw_valid),
		.auto_in_aw_bits_id(_tl2axi4_auto_out_aw_bits_id),
		.auto_in_aw_bits_addr(_tl2axi4_auto_out_aw_bits_addr),
		.auto_in_aw_bits_len(_tl2axi4_auto_out_aw_bits_len),
		.auto_in_aw_bits_size(_tl2axi4_auto_out_aw_bits_size),
		.auto_in_aw_bits_burst(_tl2axi4_auto_out_aw_bits_burst),
		.auto_in_aw_bits_lock(_tl2axi4_auto_out_aw_bits_lock),
		.auto_in_aw_bits_cache(_tl2axi4_auto_out_aw_bits_cache),
		.auto_in_aw_bits_prot(_tl2axi4_auto_out_aw_bits_prot),
		.auto_in_aw_bits_qos(_tl2axi4_auto_out_aw_bits_qos),
		.auto_in_aw_bits_echo_tl_state_size(_tl2axi4_auto_out_aw_bits_echo_tl_state_size),
		.auto_in_aw_bits_echo_tl_state_source(_tl2axi4_auto_out_aw_bits_echo_tl_state_source),
		.auto_in_w_ready(_axi4index_auto_in_w_ready),
		.auto_in_w_valid(_tl2axi4_auto_out_w_valid),
		.auto_in_w_bits_data(_tl2axi4_auto_out_w_bits_data),
		.auto_in_w_bits_strb(_tl2axi4_auto_out_w_bits_strb),
		.auto_in_w_bits_last(_tl2axi4_auto_out_w_bits_last),
		.auto_in_b_ready(_tl2axi4_auto_out_b_ready),
		.auto_in_b_valid(_axi4index_auto_in_b_valid),
		.auto_in_b_bits_id(_axi4index_auto_in_b_bits_id),
		.auto_in_b_bits_resp(_axi4index_auto_in_b_bits_resp),
		.auto_in_b_bits_echo_tl_state_size(_axi4index_auto_in_b_bits_echo_tl_state_size),
		.auto_in_b_bits_echo_tl_state_source(_axi4index_auto_in_b_bits_echo_tl_state_source),
		.auto_in_ar_ready(_axi4index_auto_in_ar_ready),
		.auto_in_ar_valid(_tl2axi4_auto_out_ar_valid),
		.auto_in_ar_bits_id(_tl2axi4_auto_out_ar_bits_id),
		.auto_in_ar_bits_addr(_tl2axi4_auto_out_ar_bits_addr),
		.auto_in_ar_bits_len(_tl2axi4_auto_out_ar_bits_len),
		.auto_in_ar_bits_size(_tl2axi4_auto_out_ar_bits_size),
		.auto_in_ar_bits_burst(_tl2axi4_auto_out_ar_bits_burst),
		.auto_in_ar_bits_lock(_tl2axi4_auto_out_ar_bits_lock),
		.auto_in_ar_bits_cache(_tl2axi4_auto_out_ar_bits_cache),
		.auto_in_ar_bits_prot(_tl2axi4_auto_out_ar_bits_prot),
		.auto_in_ar_bits_qos(_tl2axi4_auto_out_ar_bits_qos),
		.auto_in_ar_bits_echo_tl_state_size(_tl2axi4_auto_out_ar_bits_echo_tl_state_size),
		.auto_in_ar_bits_echo_tl_state_source(_tl2axi4_auto_out_ar_bits_echo_tl_state_source),
		.auto_in_r_ready(_tl2axi4_auto_out_r_ready),
		.auto_in_r_valid(_axi4index_auto_in_r_valid),
		.auto_in_r_bits_id(_axi4index_auto_in_r_bits_id),
		.auto_in_r_bits_data(_axi4index_auto_in_r_bits_data),
		.auto_in_r_bits_resp(_axi4index_auto_in_r_bits_resp),
		.auto_in_r_bits_echo_tl_state_size(_axi4index_auto_in_r_bits_echo_tl_state_size),
		.auto_in_r_bits_echo_tl_state_source(_axi4index_auto_in_r_bits_echo_tl_state_source),
		.auto_in_r_bits_last(_axi4index_auto_in_r_bits_last),
		.auto_out_aw_ready(_axi4deint_auto_anon_in_aw_ready),
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
		.auto_out_aw_bits_echo_tl_state_size(_axi4index_auto_out_aw_bits_echo_tl_state_size),
		.auto_out_aw_bits_echo_tl_state_source(_axi4index_auto_out_aw_bits_echo_tl_state_source),
		.auto_out_w_ready(_axi4deint_auto_anon_in_w_ready),
		.auto_out_w_valid(_axi4index_auto_out_w_valid),
		.auto_out_w_bits_data(_axi4index_auto_out_w_bits_data),
		.auto_out_w_bits_strb(_axi4index_auto_out_w_bits_strb),
		.auto_out_w_bits_last(_axi4index_auto_out_w_bits_last),
		.auto_out_b_ready(_axi4index_auto_out_b_ready),
		.auto_out_b_valid(_axi4deint_auto_anon_in_b_valid),
		.auto_out_b_bits_id(_axi4deint_auto_anon_in_b_bits_id),
		.auto_out_b_bits_resp(_axi4deint_auto_anon_in_b_bits_resp),
		.auto_out_b_bits_echo_tl_state_size(_axi4deint_auto_anon_in_b_bits_echo_tl_state_size),
		.auto_out_b_bits_echo_tl_state_source(_axi4deint_auto_anon_in_b_bits_echo_tl_state_source),
		.auto_out_ar_ready(_axi4deint_auto_anon_in_ar_ready),
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
		.auto_out_ar_bits_echo_tl_state_size(_axi4index_auto_out_ar_bits_echo_tl_state_size),
		.auto_out_ar_bits_echo_tl_state_source(_axi4index_auto_out_ar_bits_echo_tl_state_source),
		.auto_out_r_ready(_axi4index_auto_out_r_ready),
		.auto_out_r_valid(_axi4deint_auto_anon_in_r_valid),
		.auto_out_r_bits_id(_axi4deint_auto_anon_in_r_bits_id),
		.auto_out_r_bits_data(_axi4deint_auto_anon_in_r_bits_data),
		.auto_out_r_bits_resp(_axi4deint_auto_anon_in_r_bits_resp),
		.auto_out_r_bits_echo_tl_state_size(_axi4deint_auto_anon_in_r_bits_echo_tl_state_size),
		.auto_out_r_bits_echo_tl_state_source(_axi4deint_auto_anon_in_r_bits_echo_tl_state_source),
		.auto_out_r_bits_last(_axi4deint_auto_anon_in_r_bits_last)
	);
	TLToAXI4 tl2axi4(
		.clock(clock),
		.reset(reset),
		.auto_in_a_ready(auto_tl_in_a_ready),
		.auto_in_a_valid(auto_tl_in_a_valid),
		.auto_in_a_bits_opcode(auto_tl_in_a_bits_opcode),
		.auto_in_a_bits_param(auto_tl_in_a_bits_param),
		.auto_in_a_bits_size(auto_tl_in_a_bits_size),
		.auto_in_a_bits_source(auto_tl_in_a_bits_source),
		.auto_in_a_bits_address(auto_tl_in_a_bits_address),
		.auto_in_a_bits_user_amba_prot_bufferable(auto_tl_in_a_bits_user_amba_prot_bufferable),
		.auto_in_a_bits_user_amba_prot_modifiable(auto_tl_in_a_bits_user_amba_prot_modifiable),
		.auto_in_a_bits_user_amba_prot_readalloc(auto_tl_in_a_bits_user_amba_prot_readalloc),
		.auto_in_a_bits_user_amba_prot_writealloc(auto_tl_in_a_bits_user_amba_prot_writealloc),
		.auto_in_a_bits_user_amba_prot_privileged(auto_tl_in_a_bits_user_amba_prot_privileged),
		.auto_in_a_bits_user_amba_prot_secure(auto_tl_in_a_bits_user_amba_prot_secure),
		.auto_in_a_bits_user_amba_prot_fetch(auto_tl_in_a_bits_user_amba_prot_fetch),
		.auto_in_a_bits_mask(auto_tl_in_a_bits_mask),
		.auto_in_a_bits_data(auto_tl_in_a_bits_data),
		.auto_in_a_bits_corrupt(auto_tl_in_a_bits_corrupt),
		.auto_in_d_ready(auto_tl_in_d_ready),
		.auto_in_d_valid(auto_tl_in_d_valid),
		.auto_in_d_bits_opcode(auto_tl_in_d_bits_opcode),
		.auto_in_d_bits_size(auto_tl_in_d_bits_size),
		.auto_in_d_bits_source(auto_tl_in_d_bits_source),
		.auto_in_d_bits_denied(auto_tl_in_d_bits_denied),
		.auto_in_d_bits_data(auto_tl_in_d_bits_data),
		.auto_in_d_bits_corrupt(auto_tl_in_d_bits_corrupt),
		.auto_out_aw_ready(_axi4index_auto_in_aw_ready),
		.auto_out_aw_valid(_tl2axi4_auto_out_aw_valid),
		.auto_out_aw_bits_id(_tl2axi4_auto_out_aw_bits_id),
		.auto_out_aw_bits_addr(_tl2axi4_auto_out_aw_bits_addr),
		.auto_out_aw_bits_len(_tl2axi4_auto_out_aw_bits_len),
		.auto_out_aw_bits_size(_tl2axi4_auto_out_aw_bits_size),
		.auto_out_aw_bits_burst(_tl2axi4_auto_out_aw_bits_burst),
		.auto_out_aw_bits_lock(_tl2axi4_auto_out_aw_bits_lock),
		.auto_out_aw_bits_cache(_tl2axi4_auto_out_aw_bits_cache),
		.auto_out_aw_bits_prot(_tl2axi4_auto_out_aw_bits_prot),
		.auto_out_aw_bits_qos(_tl2axi4_auto_out_aw_bits_qos),
		.auto_out_aw_bits_echo_tl_state_size(_tl2axi4_auto_out_aw_bits_echo_tl_state_size),
		.auto_out_aw_bits_echo_tl_state_source(_tl2axi4_auto_out_aw_bits_echo_tl_state_source),
		.auto_out_w_ready(_axi4index_auto_in_w_ready),
		.auto_out_w_valid(_tl2axi4_auto_out_w_valid),
		.auto_out_w_bits_data(_tl2axi4_auto_out_w_bits_data),
		.auto_out_w_bits_strb(_tl2axi4_auto_out_w_bits_strb),
		.auto_out_w_bits_last(_tl2axi4_auto_out_w_bits_last),
		.auto_out_b_ready(_tl2axi4_auto_out_b_ready),
		.auto_out_b_valid(_axi4index_auto_in_b_valid),
		.auto_out_b_bits_id(_axi4index_auto_in_b_bits_id),
		.auto_out_b_bits_resp(_axi4index_auto_in_b_bits_resp),
		.auto_out_b_bits_echo_tl_state_size(_axi4index_auto_in_b_bits_echo_tl_state_size),
		.auto_out_b_bits_echo_tl_state_source(_axi4index_auto_in_b_bits_echo_tl_state_source),
		.auto_out_ar_ready(_axi4index_auto_in_ar_ready),
		.auto_out_ar_valid(_tl2axi4_auto_out_ar_valid),
		.auto_out_ar_bits_id(_tl2axi4_auto_out_ar_bits_id),
		.auto_out_ar_bits_addr(_tl2axi4_auto_out_ar_bits_addr),
		.auto_out_ar_bits_len(_tl2axi4_auto_out_ar_bits_len),
		.auto_out_ar_bits_size(_tl2axi4_auto_out_ar_bits_size),
		.auto_out_ar_bits_burst(_tl2axi4_auto_out_ar_bits_burst),
		.auto_out_ar_bits_lock(_tl2axi4_auto_out_ar_bits_lock),
		.auto_out_ar_bits_cache(_tl2axi4_auto_out_ar_bits_cache),
		.auto_out_ar_bits_prot(_tl2axi4_auto_out_ar_bits_prot),
		.auto_out_ar_bits_qos(_tl2axi4_auto_out_ar_bits_qos),
		.auto_out_ar_bits_echo_tl_state_size(_tl2axi4_auto_out_ar_bits_echo_tl_state_size),
		.auto_out_ar_bits_echo_tl_state_source(_tl2axi4_auto_out_ar_bits_echo_tl_state_source),
		.auto_out_r_ready(_tl2axi4_auto_out_r_ready),
		.auto_out_r_valid(_axi4index_auto_in_r_valid),
		.auto_out_r_bits_id(_axi4index_auto_in_r_bits_id),
		.auto_out_r_bits_data(_axi4index_auto_in_r_bits_data),
		.auto_out_r_bits_resp(_axi4index_auto_in_r_bits_resp),
		.auto_out_r_bits_echo_tl_state_size(_axi4index_auto_in_r_bits_echo_tl_state_size),
		.auto_out_r_bits_echo_tl_state_source(_axi4index_auto_in_r_bits_echo_tl_state_source),
		.auto_out_r_bits_last(_axi4index_auto_in_r_bits_last)
	);
endmodule
