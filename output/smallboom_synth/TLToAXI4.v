module TLToAXI4 (
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
	auto_in_a_bits_corrupt,
	auto_in_d_ready,
	auto_in_d_valid,
	auto_in_d_bits_opcode,
	auto_in_d_bits_size,
	auto_in_d_bits_source,
	auto_in_d_bits_denied,
	auto_in_d_bits_data,
	auto_in_d_bits_corrupt,
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
	auto_out_aw_bits_echo_tl_state_size,
	auto_out_aw_bits_echo_tl_state_source,
	auto_out_w_ready,
	auto_out_w_valid,
	auto_out_w_bits_data,
	auto_out_w_bits_strb,
	auto_out_w_bits_last,
	auto_out_b_ready,
	auto_out_b_valid,
	auto_out_b_bits_id,
	auto_out_b_bits_resp,
	auto_out_b_bits_echo_tl_state_size,
	auto_out_b_bits_echo_tl_state_source,
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
	auto_out_ar_bits_echo_tl_state_size,
	auto_out_ar_bits_echo_tl_state_source,
	auto_out_r_ready,
	auto_out_r_valid,
	auto_out_r_bits_id,
	auto_out_r_bits_data,
	auto_out_r_bits_resp,
	auto_out_r_bits_echo_tl_state_size,
	auto_out_r_bits_echo_tl_state_source,
	auto_out_r_bits_last
);
	input clock;
	input reset;
	output wire auto_in_a_ready;
	input auto_in_a_valid;
	input [2:0] auto_in_a_bits_opcode;
	input [2:0] auto_in_a_bits_param;
	input [3:0] auto_in_a_bits_size;
	input [4:0] auto_in_a_bits_source;
	input [30:0] auto_in_a_bits_address;
	input auto_in_a_bits_user_amba_prot_bufferable;
	input auto_in_a_bits_user_amba_prot_modifiable;
	input auto_in_a_bits_user_amba_prot_readalloc;
	input auto_in_a_bits_user_amba_prot_writealloc;
	input auto_in_a_bits_user_amba_prot_privileged;
	input auto_in_a_bits_user_amba_prot_secure;
	input auto_in_a_bits_user_amba_prot_fetch;
	input [7:0] auto_in_a_bits_mask;
	input [63:0] auto_in_a_bits_data;
	input auto_in_a_bits_corrupt;
	input auto_in_d_ready;
	output wire auto_in_d_valid;
	output wire [2:0] auto_in_d_bits_opcode;
	output wire [3:0] auto_in_d_bits_size;
	output wire [4:0] auto_in_d_bits_source;
	output wire auto_in_d_bits_denied;
	output wire [63:0] auto_in_d_bits_data;
	output wire auto_in_d_bits_corrupt;
	input auto_out_aw_ready;
	output wire auto_out_aw_valid;
	output wire [2:0] auto_out_aw_bits_id;
	output wire [30:0] auto_out_aw_bits_addr;
	output wire [7:0] auto_out_aw_bits_len;
	output wire [2:0] auto_out_aw_bits_size;
	output wire [1:0] auto_out_aw_bits_burst;
	output wire auto_out_aw_bits_lock;
	output wire [3:0] auto_out_aw_bits_cache;
	output wire [2:0] auto_out_aw_bits_prot;
	output wire [3:0] auto_out_aw_bits_qos;
	output wire [3:0] auto_out_aw_bits_echo_tl_state_size;
	output wire [4:0] auto_out_aw_bits_echo_tl_state_source;
	input auto_out_w_ready;
	output wire auto_out_w_valid;
	output wire [63:0] auto_out_w_bits_data;
	output wire [7:0] auto_out_w_bits_strb;
	output wire auto_out_w_bits_last;
	output wire auto_out_b_ready;
	input auto_out_b_valid;
	input [2:0] auto_out_b_bits_id;
	input [1:0] auto_out_b_bits_resp;
	input [3:0] auto_out_b_bits_echo_tl_state_size;
	input [4:0] auto_out_b_bits_echo_tl_state_source;
	input auto_out_ar_ready;
	output wire auto_out_ar_valid;
	output wire [2:0] auto_out_ar_bits_id;
	output wire [30:0] auto_out_ar_bits_addr;
	output wire [7:0] auto_out_ar_bits_len;
	output wire [2:0] auto_out_ar_bits_size;
	output wire [1:0] auto_out_ar_bits_burst;
	output wire auto_out_ar_bits_lock;
	output wire [3:0] auto_out_ar_bits_cache;
	output wire [2:0] auto_out_ar_bits_prot;
	output wire [3:0] auto_out_ar_bits_qos;
	output wire [3:0] auto_out_ar_bits_echo_tl_state_size;
	output wire [4:0] auto_out_ar_bits_echo_tl_state_source;
	output wire auto_out_r_ready;
	input auto_out_r_valid;
	input [2:0] auto_out_r_bits_id;
	input [63:0] auto_out_r_bits_data;
	input [1:0] auto_out_r_bits_resp;
	input [3:0] auto_out_r_bits_echo_tl_state_size;
	input [4:0] auto_out_r_bits_echo_tl_state_source;
	input auto_out_r_bits_last;
	reg count_6;
	reg count_5;
	reg count_4;
	reg count_3;
	wire idStall_2;
	wire idStall_1;
	reg count;
	wire _queue_arw_deq_q_io_enq_ready;
	wire _queue_arw_deq_q_io_deq_valid;
	wire [2:0] _queue_arw_deq_q_io_deq_bits_id;
	wire [30:0] _queue_arw_deq_q_io_deq_bits_addr;
	wire [7:0] _queue_arw_deq_q_io_deq_bits_len;
	wire [2:0] _queue_arw_deq_q_io_deq_bits_size;
	wire [1:0] _queue_arw_deq_q_io_deq_bits_burst;
	wire _queue_arw_deq_q_io_deq_bits_lock;
	wire [3:0] _queue_arw_deq_q_io_deq_bits_cache;
	wire [2:0] _queue_arw_deq_q_io_deq_bits_prot;
	wire [3:0] _queue_arw_deq_q_io_deq_bits_qos;
	wire [3:0] _queue_arw_deq_q_io_deq_bits_echo_tl_state_size;
	wire [4:0] _queue_arw_deq_q_io_deq_bits_echo_tl_state_source;
	wire _queue_arw_deq_q_io_deq_bits_wen;
	wire _nodeOut_w_deq_q_io_enq_ready;
	wire [95:0] _GEN = 96'h2492492487ac492492249249;
	wire [22:0] _r_beats1_decode_T = 23'h0000ff << auto_in_a_bits_size;
	wire [4:0] r_beats1 = (auto_in_a_bits_opcode[2] ? 5'h00 : ~_r_beats1_decode_T[7:3]);
	reg [4:0] r_counter;
	wire a_first = r_counter == 5'h00;
	wire a_last = (r_counter == 5'h01) | (r_beats1 == 5'h00);
	reg doneAW;
	wire [25:0] _out_arw_bits_len_T = 26'h00007ff << auto_in_a_bits_size;
	wire [31:0] _GEN_0 = {idStall_1, idStall_1, idStall_1, idStall_1, idStall_1, idStall_1, idStall_1, idStall_1, idStall_1, idStall_1, idStall_1, count, count_3, count_6, count_5, count_4, idStall_2, idStall_2, idStall_2, idStall_2, idStall_2, idStall_2, idStall_2, idStall_2, idStall_1, idStall_1, idStall_1, idStall_1, idStall_1, idStall_1, idStall_1, idStall_1};
	wire stall = _GEN_0[auto_in_a_bits_source] & a_first;
	wire _out_w_valid_T_3 = doneAW | _queue_arw_deq_q_io_enq_ready;
	wire nodeIn_a_ready = ~stall & (auto_in_a_bits_opcode[2] ? _queue_arw_deq_q_io_enq_ready : _out_w_valid_T_3 & _nodeOut_w_deq_q_io_enq_ready);
	wire out_arw_valid = (~stall & auto_in_a_valid) & (auto_in_a_bits_opcode[2] | (~doneAW & _nodeOut_w_deq_q_io_enq_ready));
	reg r_holds_d;
	reg [2:0] b_delay;
	wire r_wins = (auto_out_r_valid & (b_delay != 3'h7)) | r_holds_d;
	wire nodeOut_r_ready = auto_in_d_ready & r_wins;
	wire nodeOut_b_ready = auto_in_d_ready & ~r_wins;
	wire nodeIn_d_valid = (r_wins ? auto_out_r_valid : auto_out_b_valid);
	reg r_first;
	reg r_denied_r;
	wire r_denied = (r_first ? &auto_out_r_bits_resp : r_denied_r);
	wire [2:0] nodeIn_d_bits_opcode = {2'h0, r_wins};
	wire [3:0] nodeIn_d_bits_size = (r_wins ? auto_out_r_bits_echo_tl_state_size : auto_out_b_bits_echo_tl_state_size);
	wire [4:0] nodeIn_d_bits_source = (r_wins ? auto_out_r_bits_echo_tl_state_source : auto_out_b_bits_echo_tl_state_source);
	wire nodeIn_d_bits_denied = (r_wins ? r_denied : |auto_out_b_bits_resp);
	wire nodeIn_d_bits_corrupt = r_wins & (|auto_out_r_bits_resp | r_denied);
	wire [2:0] d_sel_shiftAmount = (r_wins ? auto_out_r_bits_id : auto_out_b_bits_id);
	wire d_last = ~r_wins | auto_out_r_bits_last;
	wire _inc_T_6 = _queue_arw_deq_q_io_enq_ready & out_arw_valid;
	wire inc = (_GEN[auto_in_a_bits_source * 3+:3] == 3'h0) & _inc_T_6;
	wire _dec_T_13 = auto_in_d_ready & nodeIn_d_valid;
	wire dec = ((d_sel_shiftAmount == 3'h0) & d_last) & _dec_T_13;
	reg [3:0] count_1;
	reg write_1;
	wire inc_1 = (_GEN[auto_in_a_bits_source * 3+:3] == 3'h1) & _inc_T_6;
	wire dec_1 = ((d_sel_shiftAmount == 3'h1) & d_last) & _dec_T_13;
	assign idStall_1 = (|count_1 & (write_1 != ~auto_in_a_bits_opcode[2])) | (count_1 == 4'h8);
	reg [3:0] count_2;
	reg write_2;
	wire inc_2 = (_GEN[auto_in_a_bits_source * 3+:3] == 3'h2) & _inc_T_6;
	wire dec_2 = ((d_sel_shiftAmount == 3'h2) & d_last) & _dec_T_13;
	assign idStall_2 = (|count_2 & (write_2 != ~auto_in_a_bits_opcode[2])) | (count_2 == 4'h8);
	wire inc_3 = (_GEN[auto_in_a_bits_source * 3+:3] == 3'h3) & _inc_T_6;
	wire dec_3 = ((d_sel_shiftAmount == 3'h3) & d_last) & _dec_T_13;
	wire inc_4 = (_GEN[auto_in_a_bits_source * 3+:3] == 3'h4) & _inc_T_6;
	wire dec_4 = ((d_sel_shiftAmount == 3'h4) & d_last) & _dec_T_13;
	wire inc_5 = (_GEN[auto_in_a_bits_source * 3+:3] == 3'h5) & _inc_T_6;
	wire dec_5 = ((d_sel_shiftAmount == 3'h5) & d_last) & _dec_T_13;
	wire inc_6 = (_GEN[auto_in_a_bits_source * 3+:3] == 3'h6) & _inc_T_6;
	wire dec_6 = ((d_sel_shiftAmount == 3'h6) & d_last) & _dec_T_13;
	always @(posedge clock) begin
		if (reset) begin
			r_counter <= 5'h00;
			doneAW <= 1'h0;
			r_holds_d <= 1'h0;
			r_first <= 1'h1;
			count <= 1'h0;
			count_1 <= 4'h0;
			count_2 <= 4'h0;
			count_3 <= 1'h0;
			count_4 <= 1'h0;
			count_5 <= 1'h0;
			count_6 <= 1'h0;
		end
		else begin
			if (nodeIn_a_ready & auto_in_a_valid) begin
				if (a_first)
					r_counter <= r_beats1;
				else
					r_counter <= r_counter - 5'h01;
				doneAW <= ~a_last;
			end
			if (nodeOut_r_ready & auto_out_r_valid) begin
				r_holds_d <= ~auto_out_r_bits_last;
				r_first <= auto_out_r_bits_last;
			end
			count <= (count + inc) - dec;
			count_1 <= (count_1 + {3'h0, inc_1}) - {3'h0, dec_1};
			count_2 <= (count_2 + {3'h0, inc_2}) - {3'h0, dec_2};
			count_3 <= (count_3 + inc_3) - dec_3;
			count_4 <= (count_4 + inc_4) - dec_4;
			count_5 <= (count_5 + inc_5) - dec_5;
			count_6 <= (count_6 + inc_6) - dec_6;
		end
		if (auto_out_b_valid & ~nodeOut_b_ready)
			b_delay <= b_delay + 3'h1;
		else
			b_delay <= 3'h0;
		if (r_first)
			r_denied_r <= &auto_out_r_bits_resp;
		if (inc_1)
			write_1 <= ~auto_in_a_bits_opcode[2];
		if (inc_2)
			write_2 <= ~auto_in_a_bits_opcode[2];
	end
	TLMonitor_4 monitor(
		.clock(clock),
		.reset(reset),
		.io_in_a_ready(nodeIn_a_ready),
		.io_in_a_valid(auto_in_a_valid),
		.io_in_a_bits_opcode(auto_in_a_bits_opcode),
		.io_in_a_bits_param(auto_in_a_bits_param),
		.io_in_a_bits_size(auto_in_a_bits_size),
		.io_in_a_bits_source(auto_in_a_bits_source),
		.io_in_a_bits_address(auto_in_a_bits_address),
		.io_in_a_bits_mask(auto_in_a_bits_mask),
		.io_in_a_bits_corrupt(auto_in_a_bits_corrupt),
		.io_in_d_ready(auto_in_d_ready),
		.io_in_d_valid(nodeIn_d_valid),
		.io_in_d_bits_opcode(nodeIn_d_bits_opcode),
		.io_in_d_bits_size(nodeIn_d_bits_size),
		.io_in_d_bits_source(nodeIn_d_bits_source),
		.io_in_d_bits_denied(nodeIn_d_bits_denied),
		.io_in_d_bits_corrupt(nodeIn_d_bits_corrupt)
	);
	Queue1_AXI4BundleW nodeOut_w_deq_q(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_nodeOut_w_deq_q_io_enq_ready),
		.io_enq_valid(((~stall & auto_in_a_valid) & ~auto_in_a_bits_opcode[2]) & _out_w_valid_T_3),
		.io_enq_bits_data(auto_in_a_bits_data),
		.io_enq_bits_strb(auto_in_a_bits_mask),
		.io_enq_bits_last(a_last),
		.io_deq_ready(auto_out_w_ready),
		.io_deq_valid(auto_out_w_valid),
		.io_deq_bits_data(auto_out_w_bits_data),
		.io_deq_bits_strb(auto_out_w_bits_strb),
		.io_deq_bits_last(auto_out_w_bits_last)
	);
	Queue1_AXI4BundleARW queue_arw_deq_q(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_queue_arw_deq_q_io_enq_ready),
		.io_enq_valid(out_arw_valid),
		.io_enq_bits_id(_GEN[auto_in_a_bits_source * 3+:3]),
		.io_enq_bits_addr(auto_in_a_bits_address),
		.io_enq_bits_len(~_out_arw_bits_len_T[10:3]),
		.io_enq_bits_size((auto_in_a_bits_size > 4'h2 ? 3'h3 : auto_in_a_bits_size[2:0])),
		.io_enq_bits_cache({auto_in_a_bits_user_amba_prot_writealloc, auto_in_a_bits_user_amba_prot_readalloc, auto_in_a_bits_user_amba_prot_modifiable, auto_in_a_bits_user_amba_prot_bufferable}),
		.io_enq_bits_prot({auto_in_a_bits_user_amba_prot_fetch, ~auto_in_a_bits_user_amba_prot_secure, auto_in_a_bits_user_amba_prot_privileged}),
		.io_enq_bits_echo_tl_state_size(auto_in_a_bits_size),
		.io_enq_bits_echo_tl_state_source(auto_in_a_bits_source),
		.io_enq_bits_wen(~auto_in_a_bits_opcode[2]),
		.io_deq_ready((_queue_arw_deq_q_io_deq_bits_wen ? auto_out_aw_ready : auto_out_ar_ready)),
		.io_deq_valid(_queue_arw_deq_q_io_deq_valid),
		.io_deq_bits_id(_queue_arw_deq_q_io_deq_bits_id),
		.io_deq_bits_addr(_queue_arw_deq_q_io_deq_bits_addr),
		.io_deq_bits_len(_queue_arw_deq_q_io_deq_bits_len),
		.io_deq_bits_size(_queue_arw_deq_q_io_deq_bits_size),
		.io_deq_bits_burst(_queue_arw_deq_q_io_deq_bits_burst),
		.io_deq_bits_lock(_queue_arw_deq_q_io_deq_bits_lock),
		.io_deq_bits_cache(_queue_arw_deq_q_io_deq_bits_cache),
		.io_deq_bits_prot(_queue_arw_deq_q_io_deq_bits_prot),
		.io_deq_bits_qos(_queue_arw_deq_q_io_deq_bits_qos),
		.io_deq_bits_echo_tl_state_size(_queue_arw_deq_q_io_deq_bits_echo_tl_state_size),
		.io_deq_bits_echo_tl_state_source(_queue_arw_deq_q_io_deq_bits_echo_tl_state_source),
		.io_deq_bits_wen(_queue_arw_deq_q_io_deq_bits_wen)
	);
	assign auto_in_a_ready = nodeIn_a_ready;
	assign auto_in_d_valid = nodeIn_d_valid;
	assign auto_in_d_bits_opcode = nodeIn_d_bits_opcode;
	assign auto_in_d_bits_size = nodeIn_d_bits_size;
	assign auto_in_d_bits_source = nodeIn_d_bits_source;
	assign auto_in_d_bits_denied = nodeIn_d_bits_denied;
	assign auto_in_d_bits_data = auto_out_r_bits_data;
	assign auto_in_d_bits_corrupt = nodeIn_d_bits_corrupt;
	assign auto_out_aw_valid = _queue_arw_deq_q_io_deq_valid & _queue_arw_deq_q_io_deq_bits_wen;
	assign auto_out_aw_bits_id = _queue_arw_deq_q_io_deq_bits_id;
	assign auto_out_aw_bits_addr = _queue_arw_deq_q_io_deq_bits_addr;
	assign auto_out_aw_bits_len = _queue_arw_deq_q_io_deq_bits_len;
	assign auto_out_aw_bits_size = _queue_arw_deq_q_io_deq_bits_size;
	assign auto_out_aw_bits_burst = _queue_arw_deq_q_io_deq_bits_burst;
	assign auto_out_aw_bits_lock = _queue_arw_deq_q_io_deq_bits_lock;
	assign auto_out_aw_bits_cache = _queue_arw_deq_q_io_deq_bits_cache;
	assign auto_out_aw_bits_prot = _queue_arw_deq_q_io_deq_bits_prot;
	assign auto_out_aw_bits_qos = _queue_arw_deq_q_io_deq_bits_qos;
	assign auto_out_aw_bits_echo_tl_state_size = _queue_arw_deq_q_io_deq_bits_echo_tl_state_size;
	assign auto_out_aw_bits_echo_tl_state_source = _queue_arw_deq_q_io_deq_bits_echo_tl_state_source;
	assign auto_out_b_ready = nodeOut_b_ready;
	assign auto_out_ar_valid = _queue_arw_deq_q_io_deq_valid & ~_queue_arw_deq_q_io_deq_bits_wen;
	assign auto_out_ar_bits_id = _queue_arw_deq_q_io_deq_bits_id;
	assign auto_out_ar_bits_addr = _queue_arw_deq_q_io_deq_bits_addr;
	assign auto_out_ar_bits_len = _queue_arw_deq_q_io_deq_bits_len;
	assign auto_out_ar_bits_size = _queue_arw_deq_q_io_deq_bits_size;
	assign auto_out_ar_bits_burst = _queue_arw_deq_q_io_deq_bits_burst;
	assign auto_out_ar_bits_lock = _queue_arw_deq_q_io_deq_bits_lock;
	assign auto_out_ar_bits_cache = _queue_arw_deq_q_io_deq_bits_cache;
	assign auto_out_ar_bits_prot = _queue_arw_deq_q_io_deq_bits_prot;
	assign auto_out_ar_bits_qos = _queue_arw_deq_q_io_deq_bits_qos;
	assign auto_out_ar_bits_echo_tl_state_size = _queue_arw_deq_q_io_deq_bits_echo_tl_state_size;
	assign auto_out_ar_bits_echo_tl_state_source = _queue_arw_deq_q_io_deq_bits_echo_tl_state_source;
	assign auto_out_r_ready = nodeOut_r_ready;
endmodule
