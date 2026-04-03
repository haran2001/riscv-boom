module AXI4UserYanker_2 (
	clock,
	reset,
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
	auto_in_aw_bits_echo_tl_state_size,
	auto_in_aw_bits_echo_tl_state_source,
	auto_in_aw_bits_echo_extra_id,
	auto_in_w_ready,
	auto_in_w_valid,
	auto_in_w_bits_data,
	auto_in_w_bits_strb,
	auto_in_w_bits_last,
	auto_in_b_ready,
	auto_in_b_valid,
	auto_in_b_bits_id,
	auto_in_b_bits_resp,
	auto_in_b_bits_echo_tl_state_size,
	auto_in_b_bits_echo_tl_state_source,
	auto_in_b_bits_echo_extra_id,
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
	auto_in_ar_bits_echo_tl_state_size,
	auto_in_ar_bits_echo_tl_state_source,
	auto_in_ar_bits_echo_extra_id,
	auto_in_r_ready,
	auto_in_r_valid,
	auto_in_r_bits_id,
	auto_in_r_bits_data,
	auto_in_r_bits_resp,
	auto_in_r_bits_echo_tl_state_size,
	auto_in_r_bits_echo_tl_state_source,
	auto_in_r_bits_echo_extra_id,
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
	auto_out_w_ready,
	auto_out_w_valid,
	auto_out_w_bits_data,
	auto_out_w_bits_strb,
	auto_out_w_bits_last,
	auto_out_b_ready,
	auto_out_b_valid,
	auto_out_b_bits_id,
	auto_out_b_bits_resp,
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
	auto_out_r_ready,
	auto_out_r_valid,
	auto_out_r_bits_id,
	auto_out_r_bits_data,
	auto_out_r_bits_resp,
	auto_out_r_bits_last
);
	input clock;
	input reset;
	output wire auto_in_aw_ready;
	input auto_in_aw_valid;
	input [3:0] auto_in_aw_bits_id;
	input [31:0] auto_in_aw_bits_addr;
	input [7:0] auto_in_aw_bits_len;
	input [2:0] auto_in_aw_bits_size;
	input [1:0] auto_in_aw_bits_burst;
	input auto_in_aw_bits_lock;
	input [3:0] auto_in_aw_bits_cache;
	input [2:0] auto_in_aw_bits_prot;
	input [3:0] auto_in_aw_bits_qos;
	input [3:0] auto_in_aw_bits_echo_tl_state_size;
	input [6:0] auto_in_aw_bits_echo_tl_state_source;
	input [2:0] auto_in_aw_bits_echo_extra_id;
	output wire auto_in_w_ready;
	input auto_in_w_valid;
	input [63:0] auto_in_w_bits_data;
	input [7:0] auto_in_w_bits_strb;
	input auto_in_w_bits_last;
	input auto_in_b_ready;
	output wire auto_in_b_valid;
	output wire [3:0] auto_in_b_bits_id;
	output wire [1:0] auto_in_b_bits_resp;
	output wire [3:0] auto_in_b_bits_echo_tl_state_size;
	output wire [6:0] auto_in_b_bits_echo_tl_state_source;
	output wire [2:0] auto_in_b_bits_echo_extra_id;
	output wire auto_in_ar_ready;
	input auto_in_ar_valid;
	input [3:0] auto_in_ar_bits_id;
	input [31:0] auto_in_ar_bits_addr;
	input [7:0] auto_in_ar_bits_len;
	input [2:0] auto_in_ar_bits_size;
	input [1:0] auto_in_ar_bits_burst;
	input auto_in_ar_bits_lock;
	input [3:0] auto_in_ar_bits_cache;
	input [2:0] auto_in_ar_bits_prot;
	input [3:0] auto_in_ar_bits_qos;
	input [3:0] auto_in_ar_bits_echo_tl_state_size;
	input [6:0] auto_in_ar_bits_echo_tl_state_source;
	input [2:0] auto_in_ar_bits_echo_extra_id;
	input auto_in_r_ready;
	output wire auto_in_r_valid;
	output wire [3:0] auto_in_r_bits_id;
	output wire [63:0] auto_in_r_bits_data;
	output wire [1:0] auto_in_r_bits_resp;
	output wire [3:0] auto_in_r_bits_echo_tl_state_size;
	output wire [6:0] auto_in_r_bits_echo_tl_state_source;
	output wire [2:0] auto_in_r_bits_echo_extra_id;
	output wire auto_in_r_bits_last;
	input auto_out_aw_ready;
	output wire auto_out_aw_valid;
	output wire [3:0] auto_out_aw_bits_id;
	output wire [31:0] auto_out_aw_bits_addr;
	output wire [7:0] auto_out_aw_bits_len;
	output wire [2:0] auto_out_aw_bits_size;
	output wire [1:0] auto_out_aw_bits_burst;
	output wire auto_out_aw_bits_lock;
	output wire [3:0] auto_out_aw_bits_cache;
	output wire [2:0] auto_out_aw_bits_prot;
	output wire [3:0] auto_out_aw_bits_qos;
	input auto_out_w_ready;
	output wire auto_out_w_valid;
	output wire [63:0] auto_out_w_bits_data;
	output wire [7:0] auto_out_w_bits_strb;
	output wire auto_out_w_bits_last;
	output wire auto_out_b_ready;
	input auto_out_b_valid;
	input [3:0] auto_out_b_bits_id;
	input [1:0] auto_out_b_bits_resp;
	input auto_out_ar_ready;
	output wire auto_out_ar_valid;
	output wire [3:0] auto_out_ar_bits_id;
	output wire [31:0] auto_out_ar_bits_addr;
	output wire [7:0] auto_out_ar_bits_len;
	output wire [2:0] auto_out_ar_bits_size;
	output wire [1:0] auto_out_ar_bits_burst;
	output wire auto_out_ar_bits_lock;
	output wire [3:0] auto_out_ar_bits_cache;
	output wire [2:0] auto_out_ar_bits_prot;
	output wire [3:0] auto_out_ar_bits_qos;
	output wire auto_out_r_ready;
	input auto_out_r_valid;
	input [3:0] auto_out_r_bits_id;
	input [63:0] auto_out_r_bits_data;
	input [1:0] auto_out_r_bits_resp;
	input auto_out_r_bits_last;
	wire _Queue8_BundleMap_31_io_enq_ready;
	wire _Queue8_BundleMap_31_io_deq_valid;
	wire [3:0] _Queue8_BundleMap_31_io_deq_bits_tl_state_size;
	wire [6:0] _Queue8_BundleMap_31_io_deq_bits_tl_state_source;
	wire [2:0] _Queue8_BundleMap_31_io_deq_bits_extra_id;
	wire _Queue8_BundleMap_30_io_enq_ready;
	wire _Queue8_BundleMap_30_io_deq_valid;
	wire [3:0] _Queue8_BundleMap_30_io_deq_bits_tl_state_size;
	wire [6:0] _Queue8_BundleMap_30_io_deq_bits_tl_state_source;
	wire [2:0] _Queue8_BundleMap_30_io_deq_bits_extra_id;
	wire _Queue8_BundleMap_29_io_enq_ready;
	wire _Queue8_BundleMap_29_io_deq_valid;
	wire [3:0] _Queue8_BundleMap_29_io_deq_bits_tl_state_size;
	wire [6:0] _Queue8_BundleMap_29_io_deq_bits_tl_state_source;
	wire [2:0] _Queue8_BundleMap_29_io_deq_bits_extra_id;
	wire _Queue8_BundleMap_28_io_enq_ready;
	wire _Queue8_BundleMap_28_io_deq_valid;
	wire [3:0] _Queue8_BundleMap_28_io_deq_bits_tl_state_size;
	wire [6:0] _Queue8_BundleMap_28_io_deq_bits_tl_state_source;
	wire [2:0] _Queue8_BundleMap_28_io_deq_bits_extra_id;
	wire _Queue8_BundleMap_27_io_enq_ready;
	wire _Queue8_BundleMap_27_io_deq_valid;
	wire [3:0] _Queue8_BundleMap_27_io_deq_bits_tl_state_size;
	wire [6:0] _Queue8_BundleMap_27_io_deq_bits_tl_state_source;
	wire [2:0] _Queue8_BundleMap_27_io_deq_bits_extra_id;
	wire _Queue8_BundleMap_26_io_enq_ready;
	wire _Queue8_BundleMap_26_io_deq_valid;
	wire [3:0] _Queue8_BundleMap_26_io_deq_bits_tl_state_size;
	wire [6:0] _Queue8_BundleMap_26_io_deq_bits_tl_state_source;
	wire [2:0] _Queue8_BundleMap_26_io_deq_bits_extra_id;
	wire _Queue8_BundleMap_25_io_enq_ready;
	wire _Queue8_BundleMap_25_io_deq_valid;
	wire [3:0] _Queue8_BundleMap_25_io_deq_bits_tl_state_size;
	wire [6:0] _Queue8_BundleMap_25_io_deq_bits_tl_state_source;
	wire [2:0] _Queue8_BundleMap_25_io_deq_bits_extra_id;
	wire _Queue8_BundleMap_24_io_enq_ready;
	wire _Queue8_BundleMap_24_io_deq_valid;
	wire [3:0] _Queue8_BundleMap_24_io_deq_bits_tl_state_size;
	wire [6:0] _Queue8_BundleMap_24_io_deq_bits_tl_state_source;
	wire [2:0] _Queue8_BundleMap_24_io_deq_bits_extra_id;
	wire _Queue8_BundleMap_23_io_enq_ready;
	wire _Queue8_BundleMap_23_io_deq_valid;
	wire [3:0] _Queue8_BundleMap_23_io_deq_bits_tl_state_size;
	wire [6:0] _Queue8_BundleMap_23_io_deq_bits_tl_state_source;
	wire [2:0] _Queue8_BundleMap_23_io_deq_bits_extra_id;
	wire _Queue8_BundleMap_22_io_enq_ready;
	wire _Queue8_BundleMap_22_io_deq_valid;
	wire [3:0] _Queue8_BundleMap_22_io_deq_bits_tl_state_size;
	wire [6:0] _Queue8_BundleMap_22_io_deq_bits_tl_state_source;
	wire [2:0] _Queue8_BundleMap_22_io_deq_bits_extra_id;
	wire _Queue8_BundleMap_21_io_enq_ready;
	wire _Queue8_BundleMap_21_io_deq_valid;
	wire [3:0] _Queue8_BundleMap_21_io_deq_bits_tl_state_size;
	wire [6:0] _Queue8_BundleMap_21_io_deq_bits_tl_state_source;
	wire [2:0] _Queue8_BundleMap_21_io_deq_bits_extra_id;
	wire _Queue8_BundleMap_20_io_enq_ready;
	wire _Queue8_BundleMap_20_io_deq_valid;
	wire [3:0] _Queue8_BundleMap_20_io_deq_bits_tl_state_size;
	wire [6:0] _Queue8_BundleMap_20_io_deq_bits_tl_state_source;
	wire [2:0] _Queue8_BundleMap_20_io_deq_bits_extra_id;
	wire _Queue8_BundleMap_19_io_enq_ready;
	wire _Queue8_BundleMap_19_io_deq_valid;
	wire [3:0] _Queue8_BundleMap_19_io_deq_bits_tl_state_size;
	wire [6:0] _Queue8_BundleMap_19_io_deq_bits_tl_state_source;
	wire [2:0] _Queue8_BundleMap_19_io_deq_bits_extra_id;
	wire _Queue8_BundleMap_18_io_enq_ready;
	wire _Queue8_BundleMap_18_io_deq_valid;
	wire [3:0] _Queue8_BundleMap_18_io_deq_bits_tl_state_size;
	wire [6:0] _Queue8_BundleMap_18_io_deq_bits_tl_state_source;
	wire [2:0] _Queue8_BundleMap_18_io_deq_bits_extra_id;
	wire _Queue8_BundleMap_17_io_enq_ready;
	wire _Queue8_BundleMap_17_io_deq_valid;
	wire [3:0] _Queue8_BundleMap_17_io_deq_bits_tl_state_size;
	wire [6:0] _Queue8_BundleMap_17_io_deq_bits_tl_state_source;
	wire [2:0] _Queue8_BundleMap_17_io_deq_bits_extra_id;
	wire _Queue8_BundleMap_16_io_enq_ready;
	wire _Queue8_BundleMap_16_io_deq_valid;
	wire [3:0] _Queue8_BundleMap_16_io_deq_bits_tl_state_size;
	wire [6:0] _Queue8_BundleMap_16_io_deq_bits_tl_state_source;
	wire [2:0] _Queue8_BundleMap_16_io_deq_bits_extra_id;
	wire _Queue8_BundleMap_15_io_enq_ready;
	wire _Queue8_BundleMap_15_io_deq_valid;
	wire [3:0] _Queue8_BundleMap_15_io_deq_bits_tl_state_size;
	wire [6:0] _Queue8_BundleMap_15_io_deq_bits_tl_state_source;
	wire [2:0] _Queue8_BundleMap_15_io_deq_bits_extra_id;
	wire _Queue8_BundleMap_14_io_enq_ready;
	wire _Queue8_BundleMap_14_io_deq_valid;
	wire [3:0] _Queue8_BundleMap_14_io_deq_bits_tl_state_size;
	wire [6:0] _Queue8_BundleMap_14_io_deq_bits_tl_state_source;
	wire [2:0] _Queue8_BundleMap_14_io_deq_bits_extra_id;
	wire _Queue8_BundleMap_13_io_enq_ready;
	wire _Queue8_BundleMap_13_io_deq_valid;
	wire [3:0] _Queue8_BundleMap_13_io_deq_bits_tl_state_size;
	wire [6:0] _Queue8_BundleMap_13_io_deq_bits_tl_state_source;
	wire [2:0] _Queue8_BundleMap_13_io_deq_bits_extra_id;
	wire _Queue8_BundleMap_12_io_enq_ready;
	wire _Queue8_BundleMap_12_io_deq_valid;
	wire [3:0] _Queue8_BundleMap_12_io_deq_bits_tl_state_size;
	wire [6:0] _Queue8_BundleMap_12_io_deq_bits_tl_state_source;
	wire [2:0] _Queue8_BundleMap_12_io_deq_bits_extra_id;
	wire _Queue8_BundleMap_11_io_enq_ready;
	wire _Queue8_BundleMap_11_io_deq_valid;
	wire [3:0] _Queue8_BundleMap_11_io_deq_bits_tl_state_size;
	wire [6:0] _Queue8_BundleMap_11_io_deq_bits_tl_state_source;
	wire [2:0] _Queue8_BundleMap_11_io_deq_bits_extra_id;
	wire _Queue8_BundleMap_10_io_enq_ready;
	wire _Queue8_BundleMap_10_io_deq_valid;
	wire [3:0] _Queue8_BundleMap_10_io_deq_bits_tl_state_size;
	wire [6:0] _Queue8_BundleMap_10_io_deq_bits_tl_state_source;
	wire [2:0] _Queue8_BundleMap_10_io_deq_bits_extra_id;
	wire _Queue8_BundleMap_9_io_enq_ready;
	wire _Queue8_BundleMap_9_io_deq_valid;
	wire [3:0] _Queue8_BundleMap_9_io_deq_bits_tl_state_size;
	wire [6:0] _Queue8_BundleMap_9_io_deq_bits_tl_state_source;
	wire [2:0] _Queue8_BundleMap_9_io_deq_bits_extra_id;
	wire _Queue8_BundleMap_8_io_enq_ready;
	wire _Queue8_BundleMap_8_io_deq_valid;
	wire [3:0] _Queue8_BundleMap_8_io_deq_bits_tl_state_size;
	wire [6:0] _Queue8_BundleMap_8_io_deq_bits_tl_state_source;
	wire [2:0] _Queue8_BundleMap_8_io_deq_bits_extra_id;
	wire _Queue8_BundleMap_7_io_enq_ready;
	wire _Queue8_BundleMap_7_io_deq_valid;
	wire [3:0] _Queue8_BundleMap_7_io_deq_bits_tl_state_size;
	wire [6:0] _Queue8_BundleMap_7_io_deq_bits_tl_state_source;
	wire [2:0] _Queue8_BundleMap_7_io_deq_bits_extra_id;
	wire _Queue8_BundleMap_6_io_enq_ready;
	wire _Queue8_BundleMap_6_io_deq_valid;
	wire [3:0] _Queue8_BundleMap_6_io_deq_bits_tl_state_size;
	wire [6:0] _Queue8_BundleMap_6_io_deq_bits_tl_state_source;
	wire [2:0] _Queue8_BundleMap_6_io_deq_bits_extra_id;
	wire _Queue8_BundleMap_5_io_enq_ready;
	wire _Queue8_BundleMap_5_io_deq_valid;
	wire [3:0] _Queue8_BundleMap_5_io_deq_bits_tl_state_size;
	wire [6:0] _Queue8_BundleMap_5_io_deq_bits_tl_state_source;
	wire [2:0] _Queue8_BundleMap_5_io_deq_bits_extra_id;
	wire _Queue8_BundleMap_4_io_enq_ready;
	wire _Queue8_BundleMap_4_io_deq_valid;
	wire [3:0] _Queue8_BundleMap_4_io_deq_bits_tl_state_size;
	wire [6:0] _Queue8_BundleMap_4_io_deq_bits_tl_state_source;
	wire [2:0] _Queue8_BundleMap_4_io_deq_bits_extra_id;
	wire _Queue8_BundleMap_3_io_enq_ready;
	wire _Queue8_BundleMap_3_io_deq_valid;
	wire [3:0] _Queue8_BundleMap_3_io_deq_bits_tl_state_size;
	wire [6:0] _Queue8_BundleMap_3_io_deq_bits_tl_state_source;
	wire [2:0] _Queue8_BundleMap_3_io_deq_bits_extra_id;
	wire _Queue8_BundleMap_2_io_enq_ready;
	wire _Queue8_BundleMap_2_io_deq_valid;
	wire [3:0] _Queue8_BundleMap_2_io_deq_bits_tl_state_size;
	wire [6:0] _Queue8_BundleMap_2_io_deq_bits_tl_state_source;
	wire [2:0] _Queue8_BundleMap_2_io_deq_bits_extra_id;
	wire _Queue8_BundleMap_1_io_enq_ready;
	wire _Queue8_BundleMap_1_io_deq_valid;
	wire [3:0] _Queue8_BundleMap_1_io_deq_bits_tl_state_size;
	wire [6:0] _Queue8_BundleMap_1_io_deq_bits_tl_state_source;
	wire [2:0] _Queue8_BundleMap_1_io_deq_bits_extra_id;
	wire _Queue8_BundleMap_io_enq_ready;
	wire _Queue8_BundleMap_io_deq_valid;
	wire [3:0] _Queue8_BundleMap_io_deq_bits_tl_state_size;
	wire [6:0] _Queue8_BundleMap_io_deq_bits_tl_state_source;
	wire [2:0] _Queue8_BundleMap_io_deq_bits_extra_id;
	wire [15:0] _GEN = {_Queue8_BundleMap_15_io_enq_ready, _Queue8_BundleMap_14_io_enq_ready, _Queue8_BundleMap_13_io_enq_ready, _Queue8_BundleMap_12_io_enq_ready, _Queue8_BundleMap_11_io_enq_ready, _Queue8_BundleMap_10_io_enq_ready, _Queue8_BundleMap_9_io_enq_ready, _Queue8_BundleMap_8_io_enq_ready, _Queue8_BundleMap_7_io_enq_ready, _Queue8_BundleMap_6_io_enq_ready, _Queue8_BundleMap_5_io_enq_ready, _Queue8_BundleMap_4_io_enq_ready, _Queue8_BundleMap_3_io_enq_ready, _Queue8_BundleMap_2_io_enq_ready, _Queue8_BundleMap_1_io_enq_ready, _Queue8_BundleMap_io_enq_ready};
	wire [63:0] _GEN_0 = {_Queue8_BundleMap_15_io_deq_bits_tl_state_size, _Queue8_BundleMap_14_io_deq_bits_tl_state_size, _Queue8_BundleMap_13_io_deq_bits_tl_state_size, _Queue8_BundleMap_12_io_deq_bits_tl_state_size, _Queue8_BundleMap_11_io_deq_bits_tl_state_size, _Queue8_BundleMap_10_io_deq_bits_tl_state_size, _Queue8_BundleMap_9_io_deq_bits_tl_state_size, _Queue8_BundleMap_8_io_deq_bits_tl_state_size, _Queue8_BundleMap_7_io_deq_bits_tl_state_size, _Queue8_BundleMap_6_io_deq_bits_tl_state_size, _Queue8_BundleMap_5_io_deq_bits_tl_state_size, _Queue8_BundleMap_4_io_deq_bits_tl_state_size, _Queue8_BundleMap_3_io_deq_bits_tl_state_size, _Queue8_BundleMap_2_io_deq_bits_tl_state_size, _Queue8_BundleMap_1_io_deq_bits_tl_state_size, _Queue8_BundleMap_io_deq_bits_tl_state_size};
	wire [111:0] _GEN_1 = {_Queue8_BundleMap_15_io_deq_bits_tl_state_source, _Queue8_BundleMap_14_io_deq_bits_tl_state_source, _Queue8_BundleMap_13_io_deq_bits_tl_state_source, _Queue8_BundleMap_12_io_deq_bits_tl_state_source, _Queue8_BundleMap_11_io_deq_bits_tl_state_source, _Queue8_BundleMap_10_io_deq_bits_tl_state_source, _Queue8_BundleMap_9_io_deq_bits_tl_state_source, _Queue8_BundleMap_8_io_deq_bits_tl_state_source, _Queue8_BundleMap_7_io_deq_bits_tl_state_source, _Queue8_BundleMap_6_io_deq_bits_tl_state_source, _Queue8_BundleMap_5_io_deq_bits_tl_state_source, _Queue8_BundleMap_4_io_deq_bits_tl_state_source, _Queue8_BundleMap_3_io_deq_bits_tl_state_source, _Queue8_BundleMap_2_io_deq_bits_tl_state_source, _Queue8_BundleMap_1_io_deq_bits_tl_state_source, _Queue8_BundleMap_io_deq_bits_tl_state_source};
	wire [47:0] _GEN_2 = {_Queue8_BundleMap_15_io_deq_bits_extra_id, _Queue8_BundleMap_14_io_deq_bits_extra_id, _Queue8_BundleMap_13_io_deq_bits_extra_id, _Queue8_BundleMap_12_io_deq_bits_extra_id, _Queue8_BundleMap_11_io_deq_bits_extra_id, _Queue8_BundleMap_10_io_deq_bits_extra_id, _Queue8_BundleMap_9_io_deq_bits_extra_id, _Queue8_BundleMap_8_io_deq_bits_extra_id, _Queue8_BundleMap_7_io_deq_bits_extra_id, _Queue8_BundleMap_6_io_deq_bits_extra_id, _Queue8_BundleMap_5_io_deq_bits_extra_id, _Queue8_BundleMap_4_io_deq_bits_extra_id, _Queue8_BundleMap_3_io_deq_bits_extra_id, _Queue8_BundleMap_2_io_deq_bits_extra_id, _Queue8_BundleMap_1_io_deq_bits_extra_id, _Queue8_BundleMap_io_deq_bits_extra_id};
	wire _GEN_3 = auto_out_r_valid & auto_in_r_ready;
	wire _GEN_4 = auto_in_ar_valid & auto_out_ar_ready;
	wire [15:0] _GEN_5 = {_Queue8_BundleMap_31_io_enq_ready, _Queue8_BundleMap_30_io_enq_ready, _Queue8_BundleMap_29_io_enq_ready, _Queue8_BundleMap_28_io_enq_ready, _Queue8_BundleMap_27_io_enq_ready, _Queue8_BundleMap_26_io_enq_ready, _Queue8_BundleMap_25_io_enq_ready, _Queue8_BundleMap_24_io_enq_ready, _Queue8_BundleMap_23_io_enq_ready, _Queue8_BundleMap_22_io_enq_ready, _Queue8_BundleMap_21_io_enq_ready, _Queue8_BundleMap_20_io_enq_ready, _Queue8_BundleMap_19_io_enq_ready, _Queue8_BundleMap_18_io_enq_ready, _Queue8_BundleMap_17_io_enq_ready, _Queue8_BundleMap_16_io_enq_ready};
	wire [63:0] _GEN_8 = {_Queue8_BundleMap_31_io_deq_bits_tl_state_size, _Queue8_BundleMap_30_io_deq_bits_tl_state_size, _Queue8_BundleMap_29_io_deq_bits_tl_state_size, _Queue8_BundleMap_28_io_deq_bits_tl_state_size, _Queue8_BundleMap_27_io_deq_bits_tl_state_size, _Queue8_BundleMap_26_io_deq_bits_tl_state_size, _Queue8_BundleMap_25_io_deq_bits_tl_state_size, _Queue8_BundleMap_24_io_deq_bits_tl_state_size, _Queue8_BundleMap_23_io_deq_bits_tl_state_size, _Queue8_BundleMap_22_io_deq_bits_tl_state_size, _Queue8_BundleMap_21_io_deq_bits_tl_state_size, _Queue8_BundleMap_20_io_deq_bits_tl_state_size, _Queue8_BundleMap_19_io_deq_bits_tl_state_size, _Queue8_BundleMap_18_io_deq_bits_tl_state_size, _Queue8_BundleMap_17_io_deq_bits_tl_state_size, _Queue8_BundleMap_16_io_deq_bits_tl_state_size};
	wire [111:0] _GEN_9 = {_Queue8_BundleMap_31_io_deq_bits_tl_state_source, _Queue8_BundleMap_30_io_deq_bits_tl_state_source, _Queue8_BundleMap_29_io_deq_bits_tl_state_source, _Queue8_BundleMap_28_io_deq_bits_tl_state_source, _Queue8_BundleMap_27_io_deq_bits_tl_state_source, _Queue8_BundleMap_26_io_deq_bits_tl_state_source, _Queue8_BundleMap_25_io_deq_bits_tl_state_source, _Queue8_BundleMap_24_io_deq_bits_tl_state_source, _Queue8_BundleMap_23_io_deq_bits_tl_state_source, _Queue8_BundleMap_22_io_deq_bits_tl_state_source, _Queue8_BundleMap_21_io_deq_bits_tl_state_source, _Queue8_BundleMap_20_io_deq_bits_tl_state_source, _Queue8_BundleMap_19_io_deq_bits_tl_state_source, _Queue8_BundleMap_18_io_deq_bits_tl_state_source, _Queue8_BundleMap_17_io_deq_bits_tl_state_source, _Queue8_BundleMap_16_io_deq_bits_tl_state_source};
	wire [47:0] _GEN_10 = {_Queue8_BundleMap_31_io_deq_bits_extra_id, _Queue8_BundleMap_30_io_deq_bits_extra_id, _Queue8_BundleMap_29_io_deq_bits_extra_id, _Queue8_BundleMap_28_io_deq_bits_extra_id, _Queue8_BundleMap_27_io_deq_bits_extra_id, _Queue8_BundleMap_26_io_deq_bits_extra_id, _Queue8_BundleMap_25_io_deq_bits_extra_id, _Queue8_BundleMap_24_io_deq_bits_extra_id, _Queue8_BundleMap_23_io_deq_bits_extra_id, _Queue8_BundleMap_22_io_deq_bits_extra_id, _Queue8_BundleMap_21_io_deq_bits_extra_id, _Queue8_BundleMap_20_io_deq_bits_extra_id, _Queue8_BundleMap_19_io_deq_bits_extra_id, _Queue8_BundleMap_18_io_deq_bits_extra_id, _Queue8_BundleMap_17_io_deq_bits_extra_id, _Queue8_BundleMap_16_io_deq_bits_extra_id};
	wire _GEN_11 = auto_out_b_valid & auto_in_b_ready;
	wire _GEN_12 = auto_in_aw_valid & auto_out_aw_ready;
	Queue8_BundleMap_4 Queue8_BundleMap(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_Queue8_BundleMap_io_enq_ready),
		.io_enq_valid(_GEN_4 & (auto_in_ar_bits_id == 4'h0)),
		.io_enq_bits_tl_state_size(auto_in_ar_bits_echo_tl_state_size),
		.io_enq_bits_tl_state_source(auto_in_ar_bits_echo_tl_state_source),
		.io_enq_bits_extra_id(auto_in_ar_bits_echo_extra_id),
		.io_deq_ready((_GEN_3 & (auto_out_r_bits_id == 4'h0)) & auto_out_r_bits_last),
		.io_deq_valid(_Queue8_BundleMap_io_deq_valid),
		.io_deq_bits_tl_state_size(_Queue8_BundleMap_io_deq_bits_tl_state_size),
		.io_deq_bits_tl_state_source(_Queue8_BundleMap_io_deq_bits_tl_state_source),
		.io_deq_bits_extra_id(_Queue8_BundleMap_io_deq_bits_extra_id)
	);
	Queue8_BundleMap_4 Queue8_BundleMap_1(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_Queue8_BundleMap_1_io_enq_ready),
		.io_enq_valid(_GEN_4 & (auto_in_ar_bits_id == 4'h1)),
		.io_enq_bits_tl_state_size(auto_in_ar_bits_echo_tl_state_size),
		.io_enq_bits_tl_state_source(auto_in_ar_bits_echo_tl_state_source),
		.io_enq_bits_extra_id(auto_in_ar_bits_echo_extra_id),
		.io_deq_ready((_GEN_3 & (auto_out_r_bits_id == 4'h1)) & auto_out_r_bits_last),
		.io_deq_valid(_Queue8_BundleMap_1_io_deq_valid),
		.io_deq_bits_tl_state_size(_Queue8_BundleMap_1_io_deq_bits_tl_state_size),
		.io_deq_bits_tl_state_source(_Queue8_BundleMap_1_io_deq_bits_tl_state_source),
		.io_deq_bits_extra_id(_Queue8_BundleMap_1_io_deq_bits_extra_id)
	);
	Queue8_BundleMap_4 Queue8_BundleMap_2(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_Queue8_BundleMap_2_io_enq_ready),
		.io_enq_valid(_GEN_4 & (auto_in_ar_bits_id == 4'h2)),
		.io_enq_bits_tl_state_size(auto_in_ar_bits_echo_tl_state_size),
		.io_enq_bits_tl_state_source(auto_in_ar_bits_echo_tl_state_source),
		.io_enq_bits_extra_id(auto_in_ar_bits_echo_extra_id),
		.io_deq_ready((_GEN_3 & (auto_out_r_bits_id == 4'h2)) & auto_out_r_bits_last),
		.io_deq_valid(_Queue8_BundleMap_2_io_deq_valid),
		.io_deq_bits_tl_state_size(_Queue8_BundleMap_2_io_deq_bits_tl_state_size),
		.io_deq_bits_tl_state_source(_Queue8_BundleMap_2_io_deq_bits_tl_state_source),
		.io_deq_bits_extra_id(_Queue8_BundleMap_2_io_deq_bits_extra_id)
	);
	Queue8_BundleMap_4 Queue8_BundleMap_3(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_Queue8_BundleMap_3_io_enq_ready),
		.io_enq_valid(_GEN_4 & (auto_in_ar_bits_id == 4'h3)),
		.io_enq_bits_tl_state_size(auto_in_ar_bits_echo_tl_state_size),
		.io_enq_bits_tl_state_source(auto_in_ar_bits_echo_tl_state_source),
		.io_enq_bits_extra_id(auto_in_ar_bits_echo_extra_id),
		.io_deq_ready((_GEN_3 & (auto_out_r_bits_id == 4'h3)) & auto_out_r_bits_last),
		.io_deq_valid(_Queue8_BundleMap_3_io_deq_valid),
		.io_deq_bits_tl_state_size(_Queue8_BundleMap_3_io_deq_bits_tl_state_size),
		.io_deq_bits_tl_state_source(_Queue8_BundleMap_3_io_deq_bits_tl_state_source),
		.io_deq_bits_extra_id(_Queue8_BundleMap_3_io_deq_bits_extra_id)
	);
	Queue8_BundleMap_4 Queue8_BundleMap_4(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_Queue8_BundleMap_4_io_enq_ready),
		.io_enq_valid(_GEN_4 & (auto_in_ar_bits_id == 4'h4)),
		.io_enq_bits_tl_state_size(auto_in_ar_bits_echo_tl_state_size),
		.io_enq_bits_tl_state_source(auto_in_ar_bits_echo_tl_state_source),
		.io_enq_bits_extra_id(auto_in_ar_bits_echo_extra_id),
		.io_deq_ready((_GEN_3 & (auto_out_r_bits_id == 4'h4)) & auto_out_r_bits_last),
		.io_deq_valid(_Queue8_BundleMap_4_io_deq_valid),
		.io_deq_bits_tl_state_size(_Queue8_BundleMap_4_io_deq_bits_tl_state_size),
		.io_deq_bits_tl_state_source(_Queue8_BundleMap_4_io_deq_bits_tl_state_source),
		.io_deq_bits_extra_id(_Queue8_BundleMap_4_io_deq_bits_extra_id)
	);
	Queue8_BundleMap_4 Queue8_BundleMap_5(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_Queue8_BundleMap_5_io_enq_ready),
		.io_enq_valid(_GEN_4 & (auto_in_ar_bits_id == 4'h5)),
		.io_enq_bits_tl_state_size(auto_in_ar_bits_echo_tl_state_size),
		.io_enq_bits_tl_state_source(auto_in_ar_bits_echo_tl_state_source),
		.io_enq_bits_extra_id(auto_in_ar_bits_echo_extra_id),
		.io_deq_ready((_GEN_3 & (auto_out_r_bits_id == 4'h5)) & auto_out_r_bits_last),
		.io_deq_valid(_Queue8_BundleMap_5_io_deq_valid),
		.io_deq_bits_tl_state_size(_Queue8_BundleMap_5_io_deq_bits_tl_state_size),
		.io_deq_bits_tl_state_source(_Queue8_BundleMap_5_io_deq_bits_tl_state_source),
		.io_deq_bits_extra_id(_Queue8_BundleMap_5_io_deq_bits_extra_id)
	);
	Queue8_BundleMap_4 Queue8_BundleMap_6(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_Queue8_BundleMap_6_io_enq_ready),
		.io_enq_valid(_GEN_4 & (auto_in_ar_bits_id == 4'h6)),
		.io_enq_bits_tl_state_size(auto_in_ar_bits_echo_tl_state_size),
		.io_enq_bits_tl_state_source(auto_in_ar_bits_echo_tl_state_source),
		.io_enq_bits_extra_id(auto_in_ar_bits_echo_extra_id),
		.io_deq_ready((_GEN_3 & (auto_out_r_bits_id == 4'h6)) & auto_out_r_bits_last),
		.io_deq_valid(_Queue8_BundleMap_6_io_deq_valid),
		.io_deq_bits_tl_state_size(_Queue8_BundleMap_6_io_deq_bits_tl_state_size),
		.io_deq_bits_tl_state_source(_Queue8_BundleMap_6_io_deq_bits_tl_state_source),
		.io_deq_bits_extra_id(_Queue8_BundleMap_6_io_deq_bits_extra_id)
	);
	Queue8_BundleMap_4 Queue8_BundleMap_7(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_Queue8_BundleMap_7_io_enq_ready),
		.io_enq_valid(_GEN_4 & (auto_in_ar_bits_id == 4'h7)),
		.io_enq_bits_tl_state_size(auto_in_ar_bits_echo_tl_state_size),
		.io_enq_bits_tl_state_source(auto_in_ar_bits_echo_tl_state_source),
		.io_enq_bits_extra_id(auto_in_ar_bits_echo_extra_id),
		.io_deq_ready((_GEN_3 & (auto_out_r_bits_id == 4'h7)) & auto_out_r_bits_last),
		.io_deq_valid(_Queue8_BundleMap_7_io_deq_valid),
		.io_deq_bits_tl_state_size(_Queue8_BundleMap_7_io_deq_bits_tl_state_size),
		.io_deq_bits_tl_state_source(_Queue8_BundleMap_7_io_deq_bits_tl_state_source),
		.io_deq_bits_extra_id(_Queue8_BundleMap_7_io_deq_bits_extra_id)
	);
	Queue8_BundleMap_4 Queue8_BundleMap_8(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_Queue8_BundleMap_8_io_enq_ready),
		.io_enq_valid(_GEN_4 & (auto_in_ar_bits_id == 4'h8)),
		.io_enq_bits_tl_state_size(auto_in_ar_bits_echo_tl_state_size),
		.io_enq_bits_tl_state_source(auto_in_ar_bits_echo_tl_state_source),
		.io_enq_bits_extra_id(auto_in_ar_bits_echo_extra_id),
		.io_deq_ready((_GEN_3 & (auto_out_r_bits_id == 4'h8)) & auto_out_r_bits_last),
		.io_deq_valid(_Queue8_BundleMap_8_io_deq_valid),
		.io_deq_bits_tl_state_size(_Queue8_BundleMap_8_io_deq_bits_tl_state_size),
		.io_deq_bits_tl_state_source(_Queue8_BundleMap_8_io_deq_bits_tl_state_source),
		.io_deq_bits_extra_id(_Queue8_BundleMap_8_io_deq_bits_extra_id)
	);
	Queue8_BundleMap_4 Queue8_BundleMap_9(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_Queue8_BundleMap_9_io_enq_ready),
		.io_enq_valid(_GEN_4 & (auto_in_ar_bits_id == 4'h9)),
		.io_enq_bits_tl_state_size(auto_in_ar_bits_echo_tl_state_size),
		.io_enq_bits_tl_state_source(auto_in_ar_bits_echo_tl_state_source),
		.io_enq_bits_extra_id(auto_in_ar_bits_echo_extra_id),
		.io_deq_ready((_GEN_3 & (auto_out_r_bits_id == 4'h9)) & auto_out_r_bits_last),
		.io_deq_valid(_Queue8_BundleMap_9_io_deq_valid),
		.io_deq_bits_tl_state_size(_Queue8_BundleMap_9_io_deq_bits_tl_state_size),
		.io_deq_bits_tl_state_source(_Queue8_BundleMap_9_io_deq_bits_tl_state_source),
		.io_deq_bits_extra_id(_Queue8_BundleMap_9_io_deq_bits_extra_id)
	);
	Queue8_BundleMap_4 Queue8_BundleMap_10(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_Queue8_BundleMap_10_io_enq_ready),
		.io_enq_valid(_GEN_4 & (auto_in_ar_bits_id == 4'ha)),
		.io_enq_bits_tl_state_size(auto_in_ar_bits_echo_tl_state_size),
		.io_enq_bits_tl_state_source(auto_in_ar_bits_echo_tl_state_source),
		.io_enq_bits_extra_id(auto_in_ar_bits_echo_extra_id),
		.io_deq_ready((_GEN_3 & (auto_out_r_bits_id == 4'ha)) & auto_out_r_bits_last),
		.io_deq_valid(_Queue8_BundleMap_10_io_deq_valid),
		.io_deq_bits_tl_state_size(_Queue8_BundleMap_10_io_deq_bits_tl_state_size),
		.io_deq_bits_tl_state_source(_Queue8_BundleMap_10_io_deq_bits_tl_state_source),
		.io_deq_bits_extra_id(_Queue8_BundleMap_10_io_deq_bits_extra_id)
	);
	Queue8_BundleMap_4 Queue8_BundleMap_11(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_Queue8_BundleMap_11_io_enq_ready),
		.io_enq_valid(_GEN_4 & (auto_in_ar_bits_id == 4'hb)),
		.io_enq_bits_tl_state_size(auto_in_ar_bits_echo_tl_state_size),
		.io_enq_bits_tl_state_source(auto_in_ar_bits_echo_tl_state_source),
		.io_enq_bits_extra_id(auto_in_ar_bits_echo_extra_id),
		.io_deq_ready((_GEN_3 & (auto_out_r_bits_id == 4'hb)) & auto_out_r_bits_last),
		.io_deq_valid(_Queue8_BundleMap_11_io_deq_valid),
		.io_deq_bits_tl_state_size(_Queue8_BundleMap_11_io_deq_bits_tl_state_size),
		.io_deq_bits_tl_state_source(_Queue8_BundleMap_11_io_deq_bits_tl_state_source),
		.io_deq_bits_extra_id(_Queue8_BundleMap_11_io_deq_bits_extra_id)
	);
	Queue8_BundleMap_4 Queue8_BundleMap_12(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_Queue8_BundleMap_12_io_enq_ready),
		.io_enq_valid(_GEN_4 & (auto_in_ar_bits_id == 4'hc)),
		.io_enq_bits_tl_state_size(auto_in_ar_bits_echo_tl_state_size),
		.io_enq_bits_tl_state_source(auto_in_ar_bits_echo_tl_state_source),
		.io_enq_bits_extra_id(auto_in_ar_bits_echo_extra_id),
		.io_deq_ready((_GEN_3 & (auto_out_r_bits_id == 4'hc)) & auto_out_r_bits_last),
		.io_deq_valid(_Queue8_BundleMap_12_io_deq_valid),
		.io_deq_bits_tl_state_size(_Queue8_BundleMap_12_io_deq_bits_tl_state_size),
		.io_deq_bits_tl_state_source(_Queue8_BundleMap_12_io_deq_bits_tl_state_source),
		.io_deq_bits_extra_id(_Queue8_BundleMap_12_io_deq_bits_extra_id)
	);
	Queue8_BundleMap_4 Queue8_BundleMap_13(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_Queue8_BundleMap_13_io_enq_ready),
		.io_enq_valid(_GEN_4 & (auto_in_ar_bits_id == 4'hd)),
		.io_enq_bits_tl_state_size(auto_in_ar_bits_echo_tl_state_size),
		.io_enq_bits_tl_state_source(auto_in_ar_bits_echo_tl_state_source),
		.io_enq_bits_extra_id(auto_in_ar_bits_echo_extra_id),
		.io_deq_ready((_GEN_3 & (auto_out_r_bits_id == 4'hd)) & auto_out_r_bits_last),
		.io_deq_valid(_Queue8_BundleMap_13_io_deq_valid),
		.io_deq_bits_tl_state_size(_Queue8_BundleMap_13_io_deq_bits_tl_state_size),
		.io_deq_bits_tl_state_source(_Queue8_BundleMap_13_io_deq_bits_tl_state_source),
		.io_deq_bits_extra_id(_Queue8_BundleMap_13_io_deq_bits_extra_id)
	);
	Queue8_BundleMap_4 Queue8_BundleMap_14(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_Queue8_BundleMap_14_io_enq_ready),
		.io_enq_valid(_GEN_4 & (auto_in_ar_bits_id == 4'he)),
		.io_enq_bits_tl_state_size(auto_in_ar_bits_echo_tl_state_size),
		.io_enq_bits_tl_state_source(auto_in_ar_bits_echo_tl_state_source),
		.io_enq_bits_extra_id(auto_in_ar_bits_echo_extra_id),
		.io_deq_ready((_GEN_3 & (auto_out_r_bits_id == 4'he)) & auto_out_r_bits_last),
		.io_deq_valid(_Queue8_BundleMap_14_io_deq_valid),
		.io_deq_bits_tl_state_size(_Queue8_BundleMap_14_io_deq_bits_tl_state_size),
		.io_deq_bits_tl_state_source(_Queue8_BundleMap_14_io_deq_bits_tl_state_source),
		.io_deq_bits_extra_id(_Queue8_BundleMap_14_io_deq_bits_extra_id)
	);
	Queue8_BundleMap_4 Queue8_BundleMap_15(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_Queue8_BundleMap_15_io_enq_ready),
		.io_enq_valid(_GEN_4 & (&auto_in_ar_bits_id)),
		.io_enq_bits_tl_state_size(auto_in_ar_bits_echo_tl_state_size),
		.io_enq_bits_tl_state_source(auto_in_ar_bits_echo_tl_state_source),
		.io_enq_bits_extra_id(auto_in_ar_bits_echo_extra_id),
		.io_deq_ready((_GEN_3 & (&auto_out_r_bits_id)) & auto_out_r_bits_last),
		.io_deq_valid(_Queue8_BundleMap_15_io_deq_valid),
		.io_deq_bits_tl_state_size(_Queue8_BundleMap_15_io_deq_bits_tl_state_size),
		.io_deq_bits_tl_state_source(_Queue8_BundleMap_15_io_deq_bits_tl_state_source),
		.io_deq_bits_extra_id(_Queue8_BundleMap_15_io_deq_bits_extra_id)
	);
	Queue8_BundleMap_4 Queue8_BundleMap_16(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_Queue8_BundleMap_16_io_enq_ready),
		.io_enq_valid(_GEN_12 & (auto_in_aw_bits_id == 4'h0)),
		.io_enq_bits_tl_state_size(auto_in_aw_bits_echo_tl_state_size),
		.io_enq_bits_tl_state_source(auto_in_aw_bits_echo_tl_state_source),
		.io_enq_bits_extra_id(auto_in_aw_bits_echo_extra_id),
		.io_deq_ready(_GEN_11 & (auto_out_b_bits_id == 4'h0)),
		.io_deq_valid(_Queue8_BundleMap_16_io_deq_valid),
		.io_deq_bits_tl_state_size(_Queue8_BundleMap_16_io_deq_bits_tl_state_size),
		.io_deq_bits_tl_state_source(_Queue8_BundleMap_16_io_deq_bits_tl_state_source),
		.io_deq_bits_extra_id(_Queue8_BundleMap_16_io_deq_bits_extra_id)
	);
	Queue8_BundleMap_4 Queue8_BundleMap_17(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_Queue8_BundleMap_17_io_enq_ready),
		.io_enq_valid(_GEN_12 & (auto_in_aw_bits_id == 4'h1)),
		.io_enq_bits_tl_state_size(auto_in_aw_bits_echo_tl_state_size),
		.io_enq_bits_tl_state_source(auto_in_aw_bits_echo_tl_state_source),
		.io_enq_bits_extra_id(auto_in_aw_bits_echo_extra_id),
		.io_deq_ready(_GEN_11 & (auto_out_b_bits_id == 4'h1)),
		.io_deq_valid(_Queue8_BundleMap_17_io_deq_valid),
		.io_deq_bits_tl_state_size(_Queue8_BundleMap_17_io_deq_bits_tl_state_size),
		.io_deq_bits_tl_state_source(_Queue8_BundleMap_17_io_deq_bits_tl_state_source),
		.io_deq_bits_extra_id(_Queue8_BundleMap_17_io_deq_bits_extra_id)
	);
	Queue8_BundleMap_4 Queue8_BundleMap_18(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_Queue8_BundleMap_18_io_enq_ready),
		.io_enq_valid(_GEN_12 & (auto_in_aw_bits_id == 4'h2)),
		.io_enq_bits_tl_state_size(auto_in_aw_bits_echo_tl_state_size),
		.io_enq_bits_tl_state_source(auto_in_aw_bits_echo_tl_state_source),
		.io_enq_bits_extra_id(auto_in_aw_bits_echo_extra_id),
		.io_deq_ready(_GEN_11 & (auto_out_b_bits_id == 4'h2)),
		.io_deq_valid(_Queue8_BundleMap_18_io_deq_valid),
		.io_deq_bits_tl_state_size(_Queue8_BundleMap_18_io_deq_bits_tl_state_size),
		.io_deq_bits_tl_state_source(_Queue8_BundleMap_18_io_deq_bits_tl_state_source),
		.io_deq_bits_extra_id(_Queue8_BundleMap_18_io_deq_bits_extra_id)
	);
	Queue8_BundleMap_4 Queue8_BundleMap_19(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_Queue8_BundleMap_19_io_enq_ready),
		.io_enq_valid(_GEN_12 & (auto_in_aw_bits_id == 4'h3)),
		.io_enq_bits_tl_state_size(auto_in_aw_bits_echo_tl_state_size),
		.io_enq_bits_tl_state_source(auto_in_aw_bits_echo_tl_state_source),
		.io_enq_bits_extra_id(auto_in_aw_bits_echo_extra_id),
		.io_deq_ready(_GEN_11 & (auto_out_b_bits_id == 4'h3)),
		.io_deq_valid(_Queue8_BundleMap_19_io_deq_valid),
		.io_deq_bits_tl_state_size(_Queue8_BundleMap_19_io_deq_bits_tl_state_size),
		.io_deq_bits_tl_state_source(_Queue8_BundleMap_19_io_deq_bits_tl_state_source),
		.io_deq_bits_extra_id(_Queue8_BundleMap_19_io_deq_bits_extra_id)
	);
	Queue8_BundleMap_4 Queue8_BundleMap_20(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_Queue8_BundleMap_20_io_enq_ready),
		.io_enq_valid(_GEN_12 & (auto_in_aw_bits_id == 4'h4)),
		.io_enq_bits_tl_state_size(auto_in_aw_bits_echo_tl_state_size),
		.io_enq_bits_tl_state_source(auto_in_aw_bits_echo_tl_state_source),
		.io_enq_bits_extra_id(auto_in_aw_bits_echo_extra_id),
		.io_deq_ready(_GEN_11 & (auto_out_b_bits_id == 4'h4)),
		.io_deq_valid(_Queue8_BundleMap_20_io_deq_valid),
		.io_deq_bits_tl_state_size(_Queue8_BundleMap_20_io_deq_bits_tl_state_size),
		.io_deq_bits_tl_state_source(_Queue8_BundleMap_20_io_deq_bits_tl_state_source),
		.io_deq_bits_extra_id(_Queue8_BundleMap_20_io_deq_bits_extra_id)
	);
	Queue8_BundleMap_4 Queue8_BundleMap_21(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_Queue8_BundleMap_21_io_enq_ready),
		.io_enq_valid(_GEN_12 & (auto_in_aw_bits_id == 4'h5)),
		.io_enq_bits_tl_state_size(auto_in_aw_bits_echo_tl_state_size),
		.io_enq_bits_tl_state_source(auto_in_aw_bits_echo_tl_state_source),
		.io_enq_bits_extra_id(auto_in_aw_bits_echo_extra_id),
		.io_deq_ready(_GEN_11 & (auto_out_b_bits_id == 4'h5)),
		.io_deq_valid(_Queue8_BundleMap_21_io_deq_valid),
		.io_deq_bits_tl_state_size(_Queue8_BundleMap_21_io_deq_bits_tl_state_size),
		.io_deq_bits_tl_state_source(_Queue8_BundleMap_21_io_deq_bits_tl_state_source),
		.io_deq_bits_extra_id(_Queue8_BundleMap_21_io_deq_bits_extra_id)
	);
	Queue8_BundleMap_4 Queue8_BundleMap_22(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_Queue8_BundleMap_22_io_enq_ready),
		.io_enq_valid(_GEN_12 & (auto_in_aw_bits_id == 4'h6)),
		.io_enq_bits_tl_state_size(auto_in_aw_bits_echo_tl_state_size),
		.io_enq_bits_tl_state_source(auto_in_aw_bits_echo_tl_state_source),
		.io_enq_bits_extra_id(auto_in_aw_bits_echo_extra_id),
		.io_deq_ready(_GEN_11 & (auto_out_b_bits_id == 4'h6)),
		.io_deq_valid(_Queue8_BundleMap_22_io_deq_valid),
		.io_deq_bits_tl_state_size(_Queue8_BundleMap_22_io_deq_bits_tl_state_size),
		.io_deq_bits_tl_state_source(_Queue8_BundleMap_22_io_deq_bits_tl_state_source),
		.io_deq_bits_extra_id(_Queue8_BundleMap_22_io_deq_bits_extra_id)
	);
	Queue8_BundleMap_4 Queue8_BundleMap_23(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_Queue8_BundleMap_23_io_enq_ready),
		.io_enq_valid(_GEN_12 & (auto_in_aw_bits_id == 4'h7)),
		.io_enq_bits_tl_state_size(auto_in_aw_bits_echo_tl_state_size),
		.io_enq_bits_tl_state_source(auto_in_aw_bits_echo_tl_state_source),
		.io_enq_bits_extra_id(auto_in_aw_bits_echo_extra_id),
		.io_deq_ready(_GEN_11 & (auto_out_b_bits_id == 4'h7)),
		.io_deq_valid(_Queue8_BundleMap_23_io_deq_valid),
		.io_deq_bits_tl_state_size(_Queue8_BundleMap_23_io_deq_bits_tl_state_size),
		.io_deq_bits_tl_state_source(_Queue8_BundleMap_23_io_deq_bits_tl_state_source),
		.io_deq_bits_extra_id(_Queue8_BundleMap_23_io_deq_bits_extra_id)
	);
	Queue8_BundleMap_4 Queue8_BundleMap_24(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_Queue8_BundleMap_24_io_enq_ready),
		.io_enq_valid(_GEN_12 & (auto_in_aw_bits_id == 4'h8)),
		.io_enq_bits_tl_state_size(auto_in_aw_bits_echo_tl_state_size),
		.io_enq_bits_tl_state_source(auto_in_aw_bits_echo_tl_state_source),
		.io_enq_bits_extra_id(auto_in_aw_bits_echo_extra_id),
		.io_deq_ready(_GEN_11 & (auto_out_b_bits_id == 4'h8)),
		.io_deq_valid(_Queue8_BundleMap_24_io_deq_valid),
		.io_deq_bits_tl_state_size(_Queue8_BundleMap_24_io_deq_bits_tl_state_size),
		.io_deq_bits_tl_state_source(_Queue8_BundleMap_24_io_deq_bits_tl_state_source),
		.io_deq_bits_extra_id(_Queue8_BundleMap_24_io_deq_bits_extra_id)
	);
	Queue8_BundleMap_4 Queue8_BundleMap_25(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_Queue8_BundleMap_25_io_enq_ready),
		.io_enq_valid(_GEN_12 & (auto_in_aw_bits_id == 4'h9)),
		.io_enq_bits_tl_state_size(auto_in_aw_bits_echo_tl_state_size),
		.io_enq_bits_tl_state_source(auto_in_aw_bits_echo_tl_state_source),
		.io_enq_bits_extra_id(auto_in_aw_bits_echo_extra_id),
		.io_deq_ready(_GEN_11 & (auto_out_b_bits_id == 4'h9)),
		.io_deq_valid(_Queue8_BundleMap_25_io_deq_valid),
		.io_deq_bits_tl_state_size(_Queue8_BundleMap_25_io_deq_bits_tl_state_size),
		.io_deq_bits_tl_state_source(_Queue8_BundleMap_25_io_deq_bits_tl_state_source),
		.io_deq_bits_extra_id(_Queue8_BundleMap_25_io_deq_bits_extra_id)
	);
	Queue8_BundleMap_4 Queue8_BundleMap_26(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_Queue8_BundleMap_26_io_enq_ready),
		.io_enq_valid(_GEN_12 & (auto_in_aw_bits_id == 4'ha)),
		.io_enq_bits_tl_state_size(auto_in_aw_bits_echo_tl_state_size),
		.io_enq_bits_tl_state_source(auto_in_aw_bits_echo_tl_state_source),
		.io_enq_bits_extra_id(auto_in_aw_bits_echo_extra_id),
		.io_deq_ready(_GEN_11 & (auto_out_b_bits_id == 4'ha)),
		.io_deq_valid(_Queue8_BundleMap_26_io_deq_valid),
		.io_deq_bits_tl_state_size(_Queue8_BundleMap_26_io_deq_bits_tl_state_size),
		.io_deq_bits_tl_state_source(_Queue8_BundleMap_26_io_deq_bits_tl_state_source),
		.io_deq_bits_extra_id(_Queue8_BundleMap_26_io_deq_bits_extra_id)
	);
	Queue8_BundleMap_4 Queue8_BundleMap_27(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_Queue8_BundleMap_27_io_enq_ready),
		.io_enq_valid(_GEN_12 & (auto_in_aw_bits_id == 4'hb)),
		.io_enq_bits_tl_state_size(auto_in_aw_bits_echo_tl_state_size),
		.io_enq_bits_tl_state_source(auto_in_aw_bits_echo_tl_state_source),
		.io_enq_bits_extra_id(auto_in_aw_bits_echo_extra_id),
		.io_deq_ready(_GEN_11 & (auto_out_b_bits_id == 4'hb)),
		.io_deq_valid(_Queue8_BundleMap_27_io_deq_valid),
		.io_deq_bits_tl_state_size(_Queue8_BundleMap_27_io_deq_bits_tl_state_size),
		.io_deq_bits_tl_state_source(_Queue8_BundleMap_27_io_deq_bits_tl_state_source),
		.io_deq_bits_extra_id(_Queue8_BundleMap_27_io_deq_bits_extra_id)
	);
	Queue8_BundleMap_4 Queue8_BundleMap_28(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_Queue8_BundleMap_28_io_enq_ready),
		.io_enq_valid(_GEN_12 & (auto_in_aw_bits_id == 4'hc)),
		.io_enq_bits_tl_state_size(auto_in_aw_bits_echo_tl_state_size),
		.io_enq_bits_tl_state_source(auto_in_aw_bits_echo_tl_state_source),
		.io_enq_bits_extra_id(auto_in_aw_bits_echo_extra_id),
		.io_deq_ready(_GEN_11 & (auto_out_b_bits_id == 4'hc)),
		.io_deq_valid(_Queue8_BundleMap_28_io_deq_valid),
		.io_deq_bits_tl_state_size(_Queue8_BundleMap_28_io_deq_bits_tl_state_size),
		.io_deq_bits_tl_state_source(_Queue8_BundleMap_28_io_deq_bits_tl_state_source),
		.io_deq_bits_extra_id(_Queue8_BundleMap_28_io_deq_bits_extra_id)
	);
	Queue8_BundleMap_4 Queue8_BundleMap_29(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_Queue8_BundleMap_29_io_enq_ready),
		.io_enq_valid(_GEN_12 & (auto_in_aw_bits_id == 4'hd)),
		.io_enq_bits_tl_state_size(auto_in_aw_bits_echo_tl_state_size),
		.io_enq_bits_tl_state_source(auto_in_aw_bits_echo_tl_state_source),
		.io_enq_bits_extra_id(auto_in_aw_bits_echo_extra_id),
		.io_deq_ready(_GEN_11 & (auto_out_b_bits_id == 4'hd)),
		.io_deq_valid(_Queue8_BundleMap_29_io_deq_valid),
		.io_deq_bits_tl_state_size(_Queue8_BundleMap_29_io_deq_bits_tl_state_size),
		.io_deq_bits_tl_state_source(_Queue8_BundleMap_29_io_deq_bits_tl_state_source),
		.io_deq_bits_extra_id(_Queue8_BundleMap_29_io_deq_bits_extra_id)
	);
	Queue8_BundleMap_4 Queue8_BundleMap_30(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_Queue8_BundleMap_30_io_enq_ready),
		.io_enq_valid(_GEN_12 & (auto_in_aw_bits_id == 4'he)),
		.io_enq_bits_tl_state_size(auto_in_aw_bits_echo_tl_state_size),
		.io_enq_bits_tl_state_source(auto_in_aw_bits_echo_tl_state_source),
		.io_enq_bits_extra_id(auto_in_aw_bits_echo_extra_id),
		.io_deq_ready(_GEN_11 & (auto_out_b_bits_id == 4'he)),
		.io_deq_valid(_Queue8_BundleMap_30_io_deq_valid),
		.io_deq_bits_tl_state_size(_Queue8_BundleMap_30_io_deq_bits_tl_state_size),
		.io_deq_bits_tl_state_source(_Queue8_BundleMap_30_io_deq_bits_tl_state_source),
		.io_deq_bits_extra_id(_Queue8_BundleMap_30_io_deq_bits_extra_id)
	);
	Queue8_BundleMap_4 Queue8_BundleMap_31(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_Queue8_BundleMap_31_io_enq_ready),
		.io_enq_valid(_GEN_12 & (&auto_in_aw_bits_id)),
		.io_enq_bits_tl_state_size(auto_in_aw_bits_echo_tl_state_size),
		.io_enq_bits_tl_state_source(auto_in_aw_bits_echo_tl_state_source),
		.io_enq_bits_extra_id(auto_in_aw_bits_echo_extra_id),
		.io_deq_ready(_GEN_11 & (&auto_out_b_bits_id)),
		.io_deq_valid(_Queue8_BundleMap_31_io_deq_valid),
		.io_deq_bits_tl_state_size(_Queue8_BundleMap_31_io_deq_bits_tl_state_size),
		.io_deq_bits_tl_state_source(_Queue8_BundleMap_31_io_deq_bits_tl_state_source),
		.io_deq_bits_extra_id(_Queue8_BundleMap_31_io_deq_bits_extra_id)
	);
	assign auto_in_aw_ready = auto_out_aw_ready & _GEN_5[auto_in_aw_bits_id];
	assign auto_in_w_ready = auto_out_w_ready;
	assign auto_in_b_valid = auto_out_b_valid;
	assign auto_in_b_bits_id = auto_out_b_bits_id;
	assign auto_in_b_bits_resp = auto_out_b_bits_resp;
	assign auto_in_b_bits_echo_tl_state_size = _GEN_8[auto_out_b_bits_id * 4+:4];
	assign auto_in_b_bits_echo_tl_state_source = _GEN_9[auto_out_b_bits_id * 7+:7];
	assign auto_in_b_bits_echo_extra_id = _GEN_10[auto_out_b_bits_id * 3+:3];
	assign auto_in_ar_ready = auto_out_ar_ready & _GEN[auto_in_ar_bits_id];
	assign auto_in_r_valid = auto_out_r_valid;
	assign auto_in_r_bits_id = auto_out_r_bits_id;
	assign auto_in_r_bits_data = auto_out_r_bits_data;
	assign auto_in_r_bits_resp = auto_out_r_bits_resp;
	assign auto_in_r_bits_echo_tl_state_size = _GEN_0[auto_out_r_bits_id * 4+:4];
	assign auto_in_r_bits_echo_tl_state_source = _GEN_1[auto_out_r_bits_id * 7+:7];
	assign auto_in_r_bits_echo_extra_id = _GEN_2[auto_out_r_bits_id * 3+:3];
	assign auto_in_r_bits_last = auto_out_r_bits_last;
	assign auto_out_aw_valid = auto_in_aw_valid & _GEN_5[auto_in_aw_bits_id];
	assign auto_out_aw_bits_id = auto_in_aw_bits_id;
	assign auto_out_aw_bits_addr = auto_in_aw_bits_addr;
	assign auto_out_aw_bits_len = auto_in_aw_bits_len;
	assign auto_out_aw_bits_size = auto_in_aw_bits_size;
	assign auto_out_aw_bits_burst = auto_in_aw_bits_burst;
	assign auto_out_aw_bits_lock = auto_in_aw_bits_lock;
	assign auto_out_aw_bits_cache = auto_in_aw_bits_cache;
	assign auto_out_aw_bits_prot = auto_in_aw_bits_prot;
	assign auto_out_aw_bits_qos = auto_in_aw_bits_qos;
	assign auto_out_w_valid = auto_in_w_valid;
	assign auto_out_w_bits_data = auto_in_w_bits_data;
	assign auto_out_w_bits_strb = auto_in_w_bits_strb;
	assign auto_out_w_bits_last = auto_in_w_bits_last;
	assign auto_out_b_ready = auto_in_b_ready;
	assign auto_out_ar_valid = auto_in_ar_valid & _GEN[auto_in_ar_bits_id];
	assign auto_out_ar_bits_id = auto_in_ar_bits_id;
	assign auto_out_ar_bits_addr = auto_in_ar_bits_addr;
	assign auto_out_ar_bits_len = auto_in_ar_bits_len;
	assign auto_out_ar_bits_size = auto_in_ar_bits_size;
	assign auto_out_ar_bits_burst = auto_in_ar_bits_burst;
	assign auto_out_ar_bits_lock = auto_in_ar_bits_lock;
	assign auto_out_ar_bits_cache = auto_in_ar_bits_cache;
	assign auto_out_ar_bits_prot = auto_in_ar_bits_prot;
	assign auto_out_ar_bits_qos = auto_in_ar_bits_qos;
	assign auto_out_r_ready = auto_in_r_ready;
endmodule
