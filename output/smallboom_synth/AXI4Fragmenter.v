module AXI4Fragmenter (
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
	auto_in_ar_bits_echo_extra_id,
	auto_in_r_ready,
	auto_in_r_valid,
	auto_in_r_bits_id,
	auto_in_r_bits_data,
	auto_in_r_bits_resp,
	auto_in_r_bits_echo_extra_id,
	auto_in_r_bits_last,
	auto_out_aw_ready,
	auto_out_aw_valid,
	auto_out_aw_bits_id,
	auto_out_aw_bits_addr,
	auto_out_aw_bits_len,
	auto_out_aw_bits_size,
	auto_out_aw_bits_cache,
	auto_out_aw_bits_prot,
	auto_out_aw_bits_echo_extra_id,
	auto_out_aw_bits_echo_real_last,
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
	auto_out_b_bits_echo_real_last,
	auto_out_ar_ready,
	auto_out_ar_valid,
	auto_out_ar_bits_id,
	auto_out_ar_bits_addr,
	auto_out_ar_bits_len,
	auto_out_ar_bits_size,
	auto_out_ar_bits_cache,
	auto_out_ar_bits_prot,
	auto_out_ar_bits_echo_extra_id,
	auto_out_ar_bits_echo_real_last,
	auto_out_r_ready,
	auto_out_r_valid,
	auto_out_r_bits_id,
	auto_out_r_bits_data,
	auto_out_r_bits_resp,
	auto_out_r_bits_echo_extra_id,
	auto_out_r_bits_echo_real_last,
	auto_out_r_bits_last
);
	input clock;
	input reset;
	output wire auto_in_aw_ready;
	input auto_in_aw_valid;
	input auto_in_aw_bits_id;
	input [31:0] auto_in_aw_bits_addr;
	input [7:0] auto_in_aw_bits_len;
	input [2:0] auto_in_aw_bits_size;
	input [1:0] auto_in_aw_bits_burst;
	input auto_in_aw_bits_lock;
	input [3:0] auto_in_aw_bits_cache;
	input [2:0] auto_in_aw_bits_prot;
	input [3:0] auto_in_aw_bits_qos;
	input [6:0] auto_in_aw_bits_echo_extra_id;
	output wire auto_in_w_ready;
	input auto_in_w_valid;
	input [63:0] auto_in_w_bits_data;
	input [7:0] auto_in_w_bits_strb;
	input auto_in_w_bits_last;
	input auto_in_b_ready;
	output wire auto_in_b_valid;
	output wire auto_in_b_bits_id;
	output wire [1:0] auto_in_b_bits_resp;
	output wire [6:0] auto_in_b_bits_echo_extra_id;
	output wire auto_in_ar_ready;
	input auto_in_ar_valid;
	input auto_in_ar_bits_id;
	input [31:0] auto_in_ar_bits_addr;
	input [7:0] auto_in_ar_bits_len;
	input [2:0] auto_in_ar_bits_size;
	input [1:0] auto_in_ar_bits_burst;
	input auto_in_ar_bits_lock;
	input [3:0] auto_in_ar_bits_cache;
	input [2:0] auto_in_ar_bits_prot;
	input [3:0] auto_in_ar_bits_qos;
	input [6:0] auto_in_ar_bits_echo_extra_id;
	input auto_in_r_ready;
	output wire auto_in_r_valid;
	output wire auto_in_r_bits_id;
	output wire [63:0] auto_in_r_bits_data;
	output wire [1:0] auto_in_r_bits_resp;
	output wire [6:0] auto_in_r_bits_echo_extra_id;
	output wire auto_in_r_bits_last;
	input auto_out_aw_ready;
	output wire auto_out_aw_valid;
	output wire auto_out_aw_bits_id;
	output wire [31:0] auto_out_aw_bits_addr;
	output wire [7:0] auto_out_aw_bits_len;
	output wire [2:0] auto_out_aw_bits_size;
	output wire [3:0] auto_out_aw_bits_cache;
	output wire [2:0] auto_out_aw_bits_prot;
	output wire [6:0] auto_out_aw_bits_echo_extra_id;
	output wire auto_out_aw_bits_echo_real_last;
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
	input auto_out_b_bits_echo_real_last;
	input auto_out_ar_ready;
	output wire auto_out_ar_valid;
	output wire auto_out_ar_bits_id;
	output wire [31:0] auto_out_ar_bits_addr;
	output wire [7:0] auto_out_ar_bits_len;
	output wire [2:0] auto_out_ar_bits_size;
	output wire [3:0] auto_out_ar_bits_cache;
	output wire [2:0] auto_out_ar_bits_prot;
	output wire [6:0] auto_out_ar_bits_echo_extra_id;
	output wire auto_out_ar_bits_echo_real_last;
	output wire auto_out_r_ready;
	input auto_out_r_valid;
	input auto_out_r_bits_id;
	input [63:0] auto_out_r_bits_data;
	input [1:0] auto_out_r_bits_resp;
	input [6:0] auto_out_r_bits_echo_extra_id;
	input auto_out_r_bits_echo_real_last;
	input auto_out_r_bits_last;
	wire nodeOut_w_valid;
	wire w_idle;
	wire in_aw_ready;
	wire _in_w_deq_q_io_deq_valid;
	wire _in_w_deq_q_io_deq_bits_last;
	wire _deq_q_1_io_deq_valid;
	wire [31:0] _deq_q_1_io_deq_bits_addr;
	wire [7:0] _deq_q_1_io_deq_bits_len;
	wire [2:0] _deq_q_1_io_deq_bits_size;
	wire [1:0] _deq_q_1_io_deq_bits_burst;
	wire _deq_q_io_deq_valid;
	wire [31:0] _deq_q_io_deq_bits_addr;
	wire [7:0] _deq_q_io_deq_bits_len;
	wire [2:0] _deq_q_io_deq_bits_size;
	wire [1:0] _deq_q_io_deq_bits_burst;
	reg busy;
	reg [31:0] r_addr;
	reg [7:0] r_len;
	wire [7:0] len = (busy ? r_len : _deq_q_io_deq_bits_len);
	wire [31:0] addr = (busy ? r_addr : _deq_q_io_deq_bits_addr);
	wire [5:0] _GEN = len[6:1] | len[7:2];
	wire [4:0] _GEN_0 = _GEN[4:0] | {len[7], _GEN[5:2]};
	wire [7:0] _wipeHigh_T = ~len;
	wire [7:0] _wipeHigh_T_3 = _wipeHigh_T | {_wipeHigh_T[6:0], 1'h0};
	wire [7:0] _wipeHigh_T_6 = _wipeHigh_T_3 | {_wipeHigh_T_3[5:0], 2'h0};
	wire [7:0] _align1_T_2 = addr[10:3] | {addr[9:3], 1'h0};
	wire [7:0] _align1_T_5 = _align1_T_2 | {_align1_T_2[5:0], 2'h0};
	wire fixed = _deq_q_io_deq_bits_burst == 2'h0;
	wire [7:0] beats1 = (fixed | (_deq_q_io_deq_bits_size != 3'h3) ? 8'h00 : (({1'h0, len[7], _GEN[5], _GEN_0[4:3], _GEN_0[2:0] | {len[7], _GEN[5], _GEN_0[4]}} | ~(_wipeHigh_T_6 | {_wipeHigh_T_6[3:0], 4'h0})) & ~(_align1_T_5 | {_align1_T_5[3:0], 4'h0})) & ({5'h00, {3 {((((({addr[31:30], addr[27], addr[25], addr[16], addr[13]} == 6'h00) | ({addr[31:30], addr[27], addr[25], ~addr[16]} == 5'h00)) | ({addr[31:30], addr[27], ~addr[25], addr[16]} == 5'h00)) | ({addr[31:30], ~addr[27]} == 3'h0)) | ({addr[31], ~addr[30]} == 2'h0)) | (addr[31:30] == 2'h2)}}} | {8 {{addr[31:30], addr[27], addr[25], addr[16], ~addr[13]} == 6'h00}}));
	wire ar_last = beats1 == len;
	wire [31:0] _out_bits_addr_T = ~addr;
	wire [9:0] _out_bits_addr_T_1 = 10'h007 << _deq_q_io_deq_bits_size;
	reg busy_1;
	reg [31:0] r_addr_1;
	reg [7:0] r_len_1;
	wire [7:0] len_1 = (busy_1 ? r_len_1 : _deq_q_1_io_deq_bits_len);
	wire [31:0] addr_1 = (busy_1 ? r_addr_1 : _deq_q_1_io_deq_bits_addr);
	wire [7:0] _support1_T_79 = {5'h00, {3 {((({addr_1[31:30], addr_1[27], addr_1[25], addr_1[13]} == 5'h00) | ({addr_1[31:30], addr_1[27], ~addr_1[25]} == 4'h0)) | ({addr_1[31:30], ~addr_1[27]} == 3'h0)) | (addr_1[31:30] == 2'h2)}}} | {8 {{addr_1[31:30], addr_1[27], addr_1[25], ~addr_1[13]} == 5'h00}};
	wire [5:0] _GEN_1 = len_1[6:1] | len_1[7:2];
	wire [4:0] _GEN_2 = _GEN_1[4:0] | {len_1[7], _GEN_1[5:2]};
	wire [7:0] _wipeHigh_T_11 = ~len_1;
	wire [7:0] _wipeHigh_T_14 = _wipeHigh_T_11 | {_wipeHigh_T_11[6:0], 1'h0};
	wire [7:0] _wipeHigh_T_17 = _wipeHigh_T_14 | {_wipeHigh_T_14[5:0], 2'h0};
	wire [7:0] _align1_T_12 = addr_1[10:3] | {addr_1[9:3], 1'h0};
	wire [7:0] _align1_T_15 = _align1_T_12 | {_align1_T_12[5:0], 2'h0};
	wire fixed_1 = _deq_q_1_io_deq_bits_burst == 2'h0;
	wire [7:0] beats1_1 = (fixed_1 | (_deq_q_1_io_deq_bits_size != 3'h3) ? 8'h00 : (({1'h0, len_1[7], _GEN_1[5], _GEN_2[4:3], _GEN_2[2:0] | {len_1[7], _GEN_1[5], _GEN_2[4]}} | ~(_wipeHigh_T_17 | {_wipeHigh_T_17[3:0], 4'h0})) & ~(_align1_T_15 | {_align1_T_15[3:0], 4'h0})) & {_support1_T_79[7:5], _support1_T_79[4:0] | {5 {{addr_1[31], ~addr_1[30]} == 2'h0}}});
	wire [8:0] w_beats = {beats1_1, 1'h1} & {1'h1, ~beats1_1};
	wire aw_last = beats1_1 == len_1;
	wire [31:0] _out_bits_addr_T_6 = ~addr_1;
	wire [9:0] _out_bits_addr_T_7 = 10'h007 << _deq_q_1_io_deq_bits_size;
	reg wbeats_latched;
	wire _in_aw_ready_T = w_idle | wbeats_latched;
	wire nodeOut_aw_valid = _deq_q_1_io_deq_valid & _in_aw_ready_T;
	assign in_aw_ready = auto_out_aw_ready & _in_aw_ready_T;
	wire wbeats_valid = _deq_q_1_io_deq_valid & ~wbeats_latched;
	reg [8:0] w_counter;
	assign w_idle = w_counter == 9'h000;
	wire [8:0] w_todo = (w_idle ? (wbeats_valid ? w_beats : 9'h000) : w_counter);
	wire w_last = w_todo == 9'h001;
	wire _w_counter_T = auto_out_w_ready & nodeOut_w_valid;
	assign nodeOut_w_valid = _in_w_deq_q_io_deq_valid & (~w_idle | wbeats_valid);
	wire nodeOut_b_ready = auto_in_b_ready | ~auto_out_b_bits_echo_real_last;
	reg [1:0] error_0;
	reg [1:0] error_1;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg _GEN_3;
		reg _GEN_4;
		_GEN_3 = auto_out_ar_ready & _deq_q_io_deq_valid;
		_GEN_4 = in_aw_ready & _deq_q_1_io_deq_valid;
		if (reset) begin
			busy <= 1'h0;
			busy_1 <= 1'h0;
			wbeats_latched <= 1'h0;
			w_counter <= 9'h000;
			error_0 <= 2'h0;
			error_1 <= 2'h0;
		end
		else begin : sv2v_autoblock_2
			reg _GEN_5;
			_GEN_5 = nodeOut_b_ready & auto_out_b_valid;
			if (_GEN_3)
				busy <= ~ar_last;
			if (_GEN_4)
				busy_1 <= ~aw_last;
			wbeats_latched <= ~(auto_out_aw_ready & nodeOut_aw_valid) & ((wbeats_valid & w_idle) | wbeats_latched);
			w_counter <= w_todo - {8'h00, _w_counter_T};
			if (~auto_out_b_bits_id & _GEN_5) begin
				if (auto_out_b_bits_echo_real_last)
					error_0 <= 2'h0;
				else
					error_0 <= error_0 | auto_out_b_bits_resp;
			end
			if (auto_out_b_bits_id & _GEN_5) begin
				if (auto_out_b_bits_echo_real_last)
					error_1 <= 2'h0;
				else
					error_1 <= error_1 | auto_out_b_bits_resp;
			end
		end
		if (_GEN_3) begin : sv2v_autoblock_3
			reg [8:0] beats;
			beats = {beats1, 1'h1} & {1'h1, ~beats1};
			if (fixed)
				r_addr <= _deq_q_io_deq_bits_addr;
			else begin : sv2v_autoblock_4
				reg [31:0] _inc_addr_T_1;
				_inc_addr_T_1 = addr + {16'h0000, {7'h00, beats} << _deq_q_io_deq_bits_size};
				if (_deq_q_io_deq_bits_burst == 2'h2) begin : sv2v_autoblock_5
					reg [22:0] _wrapMask_T_1;
					reg [31:0] _mux_addr_T_1;
					_wrapMask_T_1 = {7'h00, _deq_q_io_deq_bits_len, 8'hff} << _deq_q_io_deq_bits_size;
					_mux_addr_T_1 = ~_deq_q_io_deq_bits_addr;
					r_addr <= {17'h00000, _inc_addr_T_1[14:0] & _wrapMask_T_1[22:8]} | ~{_mux_addr_T_1[31:15], _mux_addr_T_1[14:0] | _wrapMask_T_1[22:8]};
				end
				else
					r_addr <= _inc_addr_T_1;
			end
			r_len <= len - beats[7:0];
		end
		if (_GEN_4) begin
			if (fixed_1)
				r_addr_1 <= _deq_q_1_io_deq_bits_addr;
			else begin : sv2v_autoblock_6
				reg [31:0] _inc_addr_T_3;
				_inc_addr_T_3 = addr_1 + {16'h0000, {7'h00, w_beats} << _deq_q_1_io_deq_bits_size};
				if (_deq_q_1_io_deq_bits_burst == 2'h2) begin : sv2v_autoblock_7
					reg [22:0] _wrapMask_T_3;
					reg [31:0] _mux_addr_T_6;
					_wrapMask_T_3 = {7'h00, _deq_q_1_io_deq_bits_len, 8'hff} << _deq_q_1_io_deq_bits_size;
					_mux_addr_T_6 = ~_deq_q_1_io_deq_bits_addr;
					r_addr_1 <= {17'h00000, _inc_addr_T_3[14:0] & _wrapMask_T_3[22:8]} | ~{_mux_addr_T_6[31:15], _mux_addr_T_6[14:0] | _wrapMask_T_3[22:8]};
				end
				else
					r_addr_1 <= _inc_addr_T_3;
			end
			r_len_1 <= len_1 - w_beats[7:0];
		end
	end
	Queue1_AXI4BundleAR deq_q(
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
		.io_enq_bits_echo_extra_id(auto_in_ar_bits_echo_extra_id),
		.io_deq_ready(auto_out_ar_ready & ar_last),
		.io_deq_valid(_deq_q_io_deq_valid),
		.io_deq_bits_id(auto_out_ar_bits_id),
		.io_deq_bits_addr(_deq_q_io_deq_bits_addr),
		.io_deq_bits_len(_deq_q_io_deq_bits_len),
		.io_deq_bits_size(_deq_q_io_deq_bits_size),
		.io_deq_bits_burst(_deq_q_io_deq_bits_burst),
		.io_deq_bits_cache(auto_out_ar_bits_cache),
		.io_deq_bits_prot(auto_out_ar_bits_prot),
		.io_deq_bits_echo_extra_id(auto_out_ar_bits_echo_extra_id)
	);
	Queue1_AXI4BundleAW deq_q_1(
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
		.io_enq_bits_echo_extra_id(auto_in_aw_bits_echo_extra_id),
		.io_deq_ready(in_aw_ready & aw_last),
		.io_deq_valid(_deq_q_1_io_deq_valid),
		.io_deq_bits_id(auto_out_aw_bits_id),
		.io_deq_bits_addr(_deq_q_1_io_deq_bits_addr),
		.io_deq_bits_len(_deq_q_1_io_deq_bits_len),
		.io_deq_bits_size(_deq_q_1_io_deq_bits_size),
		.io_deq_bits_burst(_deq_q_1_io_deq_bits_burst),
		.io_deq_bits_cache(auto_out_aw_bits_cache),
		.io_deq_bits_prot(auto_out_aw_bits_prot),
		.io_deq_bits_echo_extra_id(auto_out_aw_bits_echo_extra_id)
	);
	Queue1_AXI4BundleW in_w_deq_q(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(auto_in_w_ready),
		.io_enq_valid(auto_in_w_valid),
		.io_enq_bits_data(auto_in_w_bits_data),
		.io_enq_bits_strb(auto_in_w_bits_strb),
		.io_enq_bits_last(auto_in_w_bits_last),
		.io_deq_ready(auto_out_w_ready & (~w_idle | wbeats_valid)),
		.io_deq_valid(_in_w_deq_q_io_deq_valid),
		.io_deq_bits_data(auto_out_w_bits_data),
		.io_deq_bits_strb(auto_out_w_bits_strb),
		.io_deq_bits_last(_in_w_deq_q_io_deq_bits_last)
	);
	assign auto_in_b_valid = auto_out_b_valid & auto_out_b_bits_echo_real_last;
	assign auto_in_b_bits_id = auto_out_b_bits_id;
	assign auto_in_b_bits_resp = auto_out_b_bits_resp | (auto_out_b_bits_id ? error_1 : error_0);
	assign auto_in_b_bits_echo_extra_id = auto_out_b_bits_echo_extra_id;
	assign auto_in_r_valid = auto_out_r_valid;
	assign auto_in_r_bits_id = auto_out_r_bits_id;
	assign auto_in_r_bits_data = auto_out_r_bits_data;
	assign auto_in_r_bits_resp = auto_out_r_bits_resp;
	assign auto_in_r_bits_echo_extra_id = auto_out_r_bits_echo_extra_id;
	assign auto_in_r_bits_last = auto_out_r_bits_last & auto_out_r_bits_echo_real_last;
	assign auto_out_aw_valid = nodeOut_aw_valid;
	assign auto_out_aw_bits_addr = ~{_out_bits_addr_T_6[31:3], _out_bits_addr_T_6[2:0] | ~_out_bits_addr_T_7[2:0]};
	assign auto_out_aw_bits_len = beats1_1;
	assign auto_out_aw_bits_size = _deq_q_1_io_deq_bits_size;
	assign auto_out_aw_bits_echo_real_last = aw_last;
	assign auto_out_w_valid = nodeOut_w_valid;
	assign auto_out_w_bits_last = w_last;
	assign auto_out_b_ready = nodeOut_b_ready;
	assign auto_out_ar_valid = _deq_q_io_deq_valid;
	assign auto_out_ar_bits_addr = ~{_out_bits_addr_T[31:3], _out_bits_addr_T[2:0] | ~_out_bits_addr_T_1[2:0]};
	assign auto_out_ar_bits_len = beats1;
	assign auto_out_ar_bits_size = _deq_q_io_deq_bits_size;
	assign auto_out_ar_bits_echo_real_last = ar_last;
	assign auto_out_r_ready = auto_in_r_ready;
endmodule
