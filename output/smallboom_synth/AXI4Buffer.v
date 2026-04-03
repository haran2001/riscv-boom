module AXI4Buffer (
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
	input [30:0] auto_in_aw_bits_addr;
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
	output wire [3:0] auto_in_b_bits_id;
	output wire [1:0] auto_in_b_bits_resp;
	output wire auto_in_ar_ready;
	input auto_in_ar_valid;
	input [3:0] auto_in_ar_bits_id;
	input [30:0] auto_in_ar_bits_addr;
	input [7:0] auto_in_ar_bits_len;
	input [2:0] auto_in_ar_bits_size;
	input [1:0] auto_in_ar_bits_burst;
	input auto_in_ar_bits_lock;
	input [3:0] auto_in_ar_bits_cache;
	input [2:0] auto_in_ar_bits_prot;
	input [3:0] auto_in_ar_bits_qos;
	input auto_in_r_ready;
	output wire auto_in_r_valid;
	output wire [3:0] auto_in_r_bits_id;
	output wire [63:0] auto_in_r_bits_data;
	output wire [1:0] auto_in_r_bits_resp;
	output wire auto_in_r_bits_last;
	input auto_out_aw_ready;
	output wire auto_out_aw_valid;
	output wire [3:0] auto_out_aw_bits_id;
	output wire [30:0] auto_out_aw_bits_addr;
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
	output wire [30:0] auto_out_ar_bits_addr;
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
	Queue2_AXI4BundleAW nodeOut_aw_deq_q(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(auto_in_aw_ready),
		.io_enq_valid(auto_in_aw_valid),
		.io_enq_bits_id(auto_in_aw_bits_id),
		.io_enq_bits_addr(auto_in_aw_bits_addr),
		.io_enq_bits_len(auto_in_aw_bits_len),
		.io_enq_bits_size(auto_in_aw_bits_size),
		.io_enq_bits_burst(auto_in_aw_bits_burst),
		.io_enq_bits_lock(auto_in_aw_bits_lock),
		.io_enq_bits_cache(auto_in_aw_bits_cache),
		.io_enq_bits_prot(auto_in_aw_bits_prot),
		.io_enq_bits_qos(auto_in_aw_bits_qos),
		.io_deq_ready(auto_out_aw_ready),
		.io_deq_valid(auto_out_aw_valid),
		.io_deq_bits_id(auto_out_aw_bits_id),
		.io_deq_bits_addr(auto_out_aw_bits_addr),
		.io_deq_bits_len(auto_out_aw_bits_len),
		.io_deq_bits_size(auto_out_aw_bits_size),
		.io_deq_bits_burst(auto_out_aw_bits_burst),
		.io_deq_bits_lock(auto_out_aw_bits_lock),
		.io_deq_bits_cache(auto_out_aw_bits_cache),
		.io_deq_bits_prot(auto_out_aw_bits_prot),
		.io_deq_bits_qos(auto_out_aw_bits_qos)
	);
	Queue2_AXI4BundleW nodeOut_w_deq_q(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(auto_in_w_ready),
		.io_enq_valid(auto_in_w_valid),
		.io_enq_bits_data(auto_in_w_bits_data),
		.io_enq_bits_strb(auto_in_w_bits_strb),
		.io_enq_bits_last(auto_in_w_bits_last),
		.io_deq_ready(auto_out_w_ready),
		.io_deq_valid(auto_out_w_valid),
		.io_deq_bits_data(auto_out_w_bits_data),
		.io_deq_bits_strb(auto_out_w_bits_strb),
		.io_deq_bits_last(auto_out_w_bits_last)
	);
	Queue2_AXI4BundleB nodeIn_b_deq_q(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(auto_out_b_ready),
		.io_enq_valid(auto_out_b_valid),
		.io_enq_bits_id(auto_out_b_bits_id),
		.io_enq_bits_resp(auto_out_b_bits_resp),
		.io_deq_ready(auto_in_b_ready),
		.io_deq_valid(auto_in_b_valid),
		.io_deq_bits_id(auto_in_b_bits_id),
		.io_deq_bits_resp(auto_in_b_bits_resp)
	);
	Queue2_AXI4BundleAR nodeOut_ar_deq_q(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(auto_in_ar_ready),
		.io_enq_valid(auto_in_ar_valid),
		.io_enq_bits_id(auto_in_ar_bits_id),
		.io_enq_bits_addr(auto_in_ar_bits_addr),
		.io_enq_bits_len(auto_in_ar_bits_len),
		.io_enq_bits_size(auto_in_ar_bits_size),
		.io_enq_bits_burst(auto_in_ar_bits_burst),
		.io_enq_bits_lock(auto_in_ar_bits_lock),
		.io_enq_bits_cache(auto_in_ar_bits_cache),
		.io_enq_bits_prot(auto_in_ar_bits_prot),
		.io_enq_bits_qos(auto_in_ar_bits_qos),
		.io_deq_ready(auto_out_ar_ready),
		.io_deq_valid(auto_out_ar_valid),
		.io_deq_bits_id(auto_out_ar_bits_id),
		.io_deq_bits_addr(auto_out_ar_bits_addr),
		.io_deq_bits_len(auto_out_ar_bits_len),
		.io_deq_bits_size(auto_out_ar_bits_size),
		.io_deq_bits_burst(auto_out_ar_bits_burst),
		.io_deq_bits_lock(auto_out_ar_bits_lock),
		.io_deq_bits_cache(auto_out_ar_bits_cache),
		.io_deq_bits_prot(auto_out_ar_bits_prot),
		.io_deq_bits_qos(auto_out_ar_bits_qos)
	);
	Queue2_AXI4BundleR nodeIn_r_deq_q(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(auto_out_r_ready),
		.io_enq_valid(auto_out_r_valid),
		.io_enq_bits_id(auto_out_r_bits_id),
		.io_enq_bits_data(auto_out_r_bits_data),
		.io_enq_bits_resp(auto_out_r_bits_resp),
		.io_enq_bits_last(auto_out_r_bits_last),
		.io_deq_ready(auto_in_r_ready),
		.io_deq_valid(auto_in_r_valid),
		.io_deq_bits_id(auto_in_r_bits_id),
		.io_deq_bits_data(auto_in_r_bits_data),
		.io_deq_bits_resp(auto_in_r_bits_resp),
		.io_deq_bits_last(auto_in_r_bits_last)
	);
endmodule
