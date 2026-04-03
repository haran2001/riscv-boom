module AXI4IdIndexer_1 (
	auto_in_aw_ready,
	auto_in_aw_valid,
	auto_in_aw_bits_id,
	auto_in_aw_bits_addr,
	auto_in_aw_bits_len,
	auto_in_aw_bits_size,
	auto_in_aw_bits_burst,
	auto_in_aw_bits_lock,
	auto_in_aw_bits_cache,
	auto_in_aw_bits_prot,
	auto_in_aw_bits_qos,
	auto_in_w_ready,
	auto_in_w_valid,
	auto_in_w_bits_data,
	auto_in_w_bits_strb,
	auto_in_w_bits_last,
	auto_in_b_ready,
	auto_in_b_valid,
	auto_in_b_bits_id,
	auto_in_b_bits_resp,
	auto_in_ar_ready,
	auto_in_ar_valid,
	auto_in_ar_bits_id,
	auto_in_ar_bits_addr,
	auto_in_ar_bits_len,
	auto_in_ar_bits_size,
	auto_in_ar_bits_burst,
	auto_in_ar_bits_lock,
	auto_in_ar_bits_cache,
	auto_in_ar_bits_prot,
	auto_in_ar_bits_qos,
	auto_in_r_ready,
	auto_in_r_valid,
	auto_in_r_bits_id,
	auto_in_r_bits_data,
	auto_in_r_bits_resp,
	auto_in_r_bits_last,
	auto_out_aw_ready,
	auto_out_aw_valid,
	auto_out_aw_bits_id,
	auto_out_aw_bits_addr,
	auto_out_aw_bits_len,
	auto_out_aw_bits_size,
	auto_out_aw_bits_burst,
	auto_out_aw_bits_lock,
	auto_out_aw_bits_cache,
	auto_out_aw_bits_prot,
	auto_out_aw_bits_qos,
	auto_out_aw_bits_echo_extra_id,
	auto_out_w_ready,
	auto_out_w_valid,
	auto_out_w_bits_data,
	auto_out_w_bits_strb,
	auto_out_w_bits_last,
	auto_out_b_ready,
	auto_out_b_valid,
	auto_out_b_bits_id,
	auto_out_b_bits_resp,
	auto_out_b_bits_echo_extra_id,
	auto_out_ar_ready,
	auto_out_ar_valid,
	auto_out_ar_bits_id,
	auto_out_ar_bits_addr,
	auto_out_ar_bits_len,
	auto_out_ar_bits_size,
	auto_out_ar_bits_burst,
	auto_out_ar_bits_lock,
	auto_out_ar_bits_cache,
	auto_out_ar_bits_prot,
	auto_out_ar_bits_qos,
	auto_out_ar_bits_echo_extra_id,
	auto_out_r_ready,
	auto_out_r_valid,
	auto_out_r_bits_id,
	auto_out_r_bits_data,
	auto_out_r_bits_resp,
	auto_out_r_bits_echo_extra_id,
	auto_out_r_bits_last
);
	output wire auto_in_aw_ready;
	input auto_in_aw_valid;
	input [7:0] auto_in_aw_bits_id;
	input [31:0] auto_in_aw_bits_addr;
	input [7:0] auto_in_aw_bits_len;
	input [2:0] auto_in_aw_bits_size;
	input [1:0] auto_in_aw_bits_burst;
	input auto_in_aw_bits_lock;
	input [3:0] auto_in_aw_bits_cache;
	input [2:0] auto_in_aw_bits_prot;
	input [3:0] auto_in_aw_bits_qos;
	output wire auto_in_w_ready;
	input auto_in_w_valid;
	input [63:0] auto_in_w_bits_data;
	input [7:0] auto_in_w_bits_strb;
	input auto_in_w_bits_last;
	input auto_in_b_ready;
	output wire auto_in_b_valid;
	output wire [7:0] auto_in_b_bits_id;
	output wire [1:0] auto_in_b_bits_resp;
	output wire auto_in_ar_ready;
	input auto_in_ar_valid;
	input [7:0] auto_in_ar_bits_id;
	input [31:0] auto_in_ar_bits_addr;
	input [7:0] auto_in_ar_bits_len;
	input [2:0] auto_in_ar_bits_size;
	input [1:0] auto_in_ar_bits_burst;
	input auto_in_ar_bits_lock;
	input [3:0] auto_in_ar_bits_cache;
	input [2:0] auto_in_ar_bits_prot;
	input [3:0] auto_in_ar_bits_qos;
	input auto_in_r_ready;
	output wire auto_in_r_valid;
	output wire [7:0] auto_in_r_bits_id;
	output wire [63:0] auto_in_r_bits_data;
	output wire [1:0] auto_in_r_bits_resp;
	output wire auto_in_r_bits_last;
	input auto_out_aw_ready;
	output wire auto_out_aw_valid;
	output wire auto_out_aw_bits_id;
	output wire [31:0] auto_out_aw_bits_addr;
	output wire [7:0] auto_out_aw_bits_len;
	output wire [2:0] auto_out_aw_bits_size;
	output wire [1:0] auto_out_aw_bits_burst;
	output wire auto_out_aw_bits_lock;
	output wire [3:0] auto_out_aw_bits_cache;
	output wire [2:0] auto_out_aw_bits_prot;
	output wire [3:0] auto_out_aw_bits_qos;
	output wire [6:0] auto_out_aw_bits_echo_extra_id;
	input auto_out_w_ready;
	output wire auto_out_w_valid;
	output wire [63:0] auto_out_w_bits_data;
	output wire [7:0] auto_out_w_bits_strb;
	output wire auto_out_w_bits_last;
	output wire auto_out_b_ready;
	input auto_out_b_valid;
	input auto_out_b_bits_id;
	input [1:0] auto_out_b_bits_resp;
	input [6:0] auto_out_b_bits_echo_extra_id;
	input auto_out_ar_ready;
	output wire auto_out_ar_valid;
	output wire auto_out_ar_bits_id;
	output wire [31:0] auto_out_ar_bits_addr;
	output wire [7:0] auto_out_ar_bits_len;
	output wire [2:0] auto_out_ar_bits_size;
	output wire [1:0] auto_out_ar_bits_burst;
	output wire auto_out_ar_bits_lock;
	output wire [3:0] auto_out_ar_bits_cache;
	output wire [2:0] auto_out_ar_bits_prot;
	output wire [3:0] auto_out_ar_bits_qos;
	output wire [6:0] auto_out_ar_bits_echo_extra_id;
	output wire auto_out_r_ready;
	input auto_out_r_valid;
	input auto_out_r_bits_id;
	input [63:0] auto_out_r_bits_data;
	input [1:0] auto_out_r_bits_resp;
	input [6:0] auto_out_r_bits_echo_extra_id;
	input auto_out_r_bits_last;
	assign auto_in_aw_ready = auto_out_aw_ready;
	assign auto_in_w_ready = auto_out_w_ready;
	assign auto_in_b_valid = auto_out_b_valid;
	assign auto_in_b_bits_id = {auto_out_b_bits_echo_extra_id, auto_out_b_bits_id};
	assign auto_in_b_bits_resp = auto_out_b_bits_resp;
	assign auto_in_ar_ready = auto_out_ar_ready;
	assign auto_in_r_valid = auto_out_r_valid;
	assign auto_in_r_bits_id = {auto_out_r_bits_echo_extra_id, auto_out_r_bits_id};
	assign auto_in_r_bits_data = auto_out_r_bits_data;
	assign auto_in_r_bits_resp = auto_out_r_bits_resp;
	assign auto_in_r_bits_last = auto_out_r_bits_last;
	assign auto_out_aw_valid = auto_in_aw_valid;
	assign auto_out_aw_bits_id = auto_in_aw_bits_id[0];
	assign auto_out_aw_bits_addr = auto_in_aw_bits_addr;
	assign auto_out_aw_bits_len = auto_in_aw_bits_len;
	assign auto_out_aw_bits_size = auto_in_aw_bits_size;
	assign auto_out_aw_bits_burst = auto_in_aw_bits_burst;
	assign auto_out_aw_bits_lock = auto_in_aw_bits_lock;
	assign auto_out_aw_bits_cache = auto_in_aw_bits_cache;
	assign auto_out_aw_bits_prot = auto_in_aw_bits_prot;
	assign auto_out_aw_bits_qos = auto_in_aw_bits_qos;
	assign auto_out_aw_bits_echo_extra_id = auto_in_aw_bits_id[7:1];
	assign auto_out_w_valid = auto_in_w_valid;
	assign auto_out_w_bits_data = auto_in_w_bits_data;
	assign auto_out_w_bits_strb = auto_in_w_bits_strb;
	assign auto_out_w_bits_last = auto_in_w_bits_last;
	assign auto_out_b_ready = auto_in_b_ready;
	assign auto_out_ar_valid = auto_in_ar_valid;
	assign auto_out_ar_bits_id = auto_in_ar_bits_id[0];
	assign auto_out_ar_bits_addr = auto_in_ar_bits_addr;
	assign auto_out_ar_bits_len = auto_in_ar_bits_len;
	assign auto_out_ar_bits_size = auto_in_ar_bits_size;
	assign auto_out_ar_bits_burst = auto_in_ar_bits_burst;
	assign auto_out_ar_bits_lock = auto_in_ar_bits_lock;
	assign auto_out_ar_bits_cache = auto_in_ar_bits_cache;
	assign auto_out_ar_bits_prot = auto_in_ar_bits_prot;
	assign auto_out_ar_bits_qos = auto_in_ar_bits_qos;
	assign auto_out_ar_bits_echo_extra_id = auto_in_ar_bits_id[7:1];
	assign auto_out_r_ready = auto_in_r_ready;
endmodule
