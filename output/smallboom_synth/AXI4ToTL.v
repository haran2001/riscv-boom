module AXI4ToTL (
	clock,
	reset,
	auto_in_aw_ready,
	auto_in_aw_valid,
	auto_in_aw_bits_id,
	auto_in_aw_bits_addr,
	auto_in_aw_bits_len,
	auto_in_aw_bits_size,
	auto_in_aw_bits_cache,
	auto_in_aw_bits_prot,
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
	auto_in_ar_bits_cache,
	auto_in_ar_bits_prot,
	auto_in_r_ready,
	auto_in_r_valid,
	auto_in_r_bits_id,
	auto_in_r_bits_data,
	auto_in_r_bits_resp,
	auto_in_r_bits_last,
	auto_out_a_ready,
	auto_out_a_valid,
	auto_out_a_bits_opcode,
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
	output wire auto_in_aw_ready;
	input auto_in_aw_valid;
	input auto_in_aw_bits_id;
	input [31:0] auto_in_aw_bits_addr;
	input [7:0] auto_in_aw_bits_len;
	input [2:0] auto_in_aw_bits_size;
	input [3:0] auto_in_aw_bits_cache;
	input [2:0] auto_in_aw_bits_prot;
	output wire auto_in_w_ready;
	input auto_in_w_valid;
	input [63:0] auto_in_w_bits_data;
	input [7:0] auto_in_w_bits_strb;
	input auto_in_w_bits_last;
	input auto_in_b_ready;
	output wire auto_in_b_valid;
	output wire auto_in_b_bits_id;
	output wire [1:0] auto_in_b_bits_resp;
	output wire auto_in_ar_ready;
	input auto_in_ar_valid;
	input auto_in_ar_bits_id;
	input [31:0] auto_in_ar_bits_addr;
	input [7:0] auto_in_ar_bits_len;
	input [2:0] auto_in_ar_bits_size;
	input [3:0] auto_in_ar_bits_cache;
	input [2:0] auto_in_ar_bits_prot;
	input auto_in_r_ready;
	output wire auto_in_r_valid;
	output wire auto_in_r_bits_id;
	output wire [63:0] auto_in_r_bits_data;
	output wire [1:0] auto_in_r_bits_resp;
	output wire auto_in_r_bits_last;
	input auto_out_a_ready;
	output wire auto_out_a_valid;
	output wire [2:0] auto_out_a_bits_opcode;
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
	output wire auto_out_d_ready;
	input auto_out_d_valid;
	input [2:0] auto_out_d_bits_opcode;
	input [3:0] auto_out_d_bits_size;
	input [3:0] auto_out_d_bits_source;
	input auto_out_d_bits_denied;
	input [63:0] auto_out_d_bits_data;
	input auto_out_d_bits_corrupt;
	wire w_out_ready;
	wire _q_b_deq_q_io_enq_ready;
	wire _q_b_deq_q_io_deq_valid;
	wire _q_b_deq_q_io_deq_bits_id;
	wire _nodeIn_r_deq_q_io_enq_ready;
	wire [22:0] _r_size1_T_1 = {7'h00, auto_in_ar_bits_len, 8'hff} << auto_in_ar_bits_size;
	wire [13:0] _GEN = ~_r_size1_T_1[22:9];
	wire [7:0] r_size_hi = _r_size1_T_1[22:15] & {1'h1, _GEN[13:7]};
	wire [6:0] _r_size_T_6 = r_size_hi[7:1] | (_r_size1_T_1[14:8] & _GEN[6:0]);
	wire [2:0] _r_size_T_8 = _r_size_T_6[6:4] | _r_size_T_6[2:0];
	wire _r_size_T_10 = _r_size_T_8[2] | _r_size_T_8[0];
	wire [3:0] r_size = {|r_size_hi, |_r_size_T_6[6:3], |_r_size_T_8[2:1], _r_size_T_10};
	wire [31:0] r_addr = (((r_size < 4'hd) & ({auto_in_ar_bits_addr[31:14], ~auto_in_ar_bits_addr[13:12]} == 20'h00000)) | ((r_size < 4'h7) & ((((((auto_in_ar_bits_addr[31:12] == 20'h00000) | ({auto_in_ar_bits_addr[31:17], ~auto_in_ar_bits_addr[16]} == 16'h0000)) | ({auto_in_ar_bits_addr[31:26], auto_in_ar_bits_addr[25:16] ^ 10'h200} == 16'h0000)) | ({auto_in_ar_bits_addr[31:28], ~auto_in_ar_bits_addr[27:26]} == 6'h00)) | ({auto_in_ar_bits_addr[31], ~auto_in_ar_bits_addr[30:29]} == 3'h0)) | (auto_in_ar_bits_addr[31:28] == 4'h8))) ? auto_in_ar_bits_addr : {29'h00000600, auto_in_ar_bits_addr[2:0]});
	reg [2:0] r_count_0;
	reg [2:0] r_count_1;
	wire r_out_bits_a_mask_sub_sub_sub_0_1 = r_size > 4'h2;
	wire [1:0] _GEN_0 = {|_r_size_T_8[2:1], _r_size_T_10};
	wire r_out_bits_a_mask_sub_sub_size = _GEN_0 == 2'h2;
	wire r_out_bits_a_mask_sub_sub_0_1 = r_out_bits_a_mask_sub_sub_sub_0_1 | (r_out_bits_a_mask_sub_sub_size & ~r_addr[2]);
	wire r_out_bits_a_mask_sub_sub_1_1 = r_out_bits_a_mask_sub_sub_sub_0_1 | (r_out_bits_a_mask_sub_sub_size & r_addr[2]);
	wire r_out_bits_a_mask_sub_size = _GEN_0 == 2'h1;
	wire r_out_bits_a_mask_sub_0_2 = ~r_addr[2] & ~r_addr[1];
	wire r_out_bits_a_mask_sub_0_1 = r_out_bits_a_mask_sub_sub_0_1 | (r_out_bits_a_mask_sub_size & r_out_bits_a_mask_sub_0_2);
	wire r_out_bits_a_mask_sub_1_2 = ~r_addr[2] & r_addr[1];
	wire r_out_bits_a_mask_sub_1_1 = r_out_bits_a_mask_sub_sub_0_1 | (r_out_bits_a_mask_sub_size & r_out_bits_a_mask_sub_1_2);
	wire r_out_bits_a_mask_sub_2_2 = r_addr[2] & ~r_addr[1];
	wire r_out_bits_a_mask_sub_2_1 = r_out_bits_a_mask_sub_sub_1_1 | (r_out_bits_a_mask_sub_size & r_out_bits_a_mask_sub_2_2);
	wire r_out_bits_a_mask_sub_3_2 = r_addr[2] & r_addr[1];
	wire r_out_bits_a_mask_sub_3_1 = r_out_bits_a_mask_sub_sub_1_1 | (r_out_bits_a_mask_sub_size & r_out_bits_a_mask_sub_3_2);
	wire [22:0] _w_size1_T_1 = {7'h00, auto_in_aw_bits_len, 8'hff} << auto_in_aw_bits_size;
	wire [13:0] _GEN_1 = ~_w_size1_T_1[22:9];
	wire [7:0] w_size_hi = _w_size1_T_1[22:15] & {1'h1, _GEN_1[13:7]};
	wire [6:0] _w_size_T_6 = w_size_hi[7:1] | (_w_size1_T_1[14:8] & _GEN_1[6:0]);
	wire [2:0] _w_size_T_8 = _w_size_T_6[6:4] | _w_size_T_6[2:0];
	wire _w_size_T_10 = _w_size_T_8[2] | _w_size_T_8[0];
	wire [3:0] w_size = {|w_size_hi, |_w_size_T_6[6:3], |_w_size_T_8[2:1], _w_size_T_10};
	reg [2:0] w_count_0;
	reg [2:0] w_count_1;
	wire nodeIn_aw_ready = (w_out_ready & auto_in_w_valid) & auto_in_w_bits_last;
	wire w_out_valid = auto_in_aw_valid & auto_in_w_valid;
	reg [7:0] beatsLeft;
	wire idle = beatsLeft == 8'h00;
	wire [1:0] readys_valid = {w_out_valid, auto_in_ar_valid};
	reg [1:0] readys_mask;
	wire [1:0] _readys_filter_T_1 = readys_valid & ~readys_mask;
	wire [1:0] readys_readys = ~({readys_mask[1], _readys_filter_T_1[1] | readys_mask[0]} & ({_readys_filter_T_1[0], w_out_valid} | _readys_filter_T_1));
	wire winner_0 = readys_readys[0] & auto_in_ar_valid;
	wire winner_1 = readys_readys[1] & w_out_valid;
	wire _nodeOut_a_valid_T = auto_in_ar_valid | w_out_valid;
	reg state_0;
	reg state_1;
	wire muxState_0 = (idle ? winner_0 : state_0);
	wire muxState_1 = (idle ? winner_1 : state_1);
	wire r_out_ready = auto_out_a_ready & (idle ? readys_readys[0] : state_0);
	assign w_out_ready = auto_out_a_ready & (idle ? readys_readys[1] : state_1);
	wire nodeOut_a_valid = (idle ? _nodeOut_a_valid_T : (state_0 & auto_in_ar_valid) | (state_1 & w_out_valid));
	wire [1:0] d_resp = {auto_out_d_bits_denied | auto_out_d_bits_corrupt, 1'h0};
	wire [26:0] _d_last_beats1_decode_T = 27'h0000fff << auto_out_d_bits_size;
	wire [8:0] d_last_beats1 = (auto_out_d_bits_opcode[0] ? ~_d_last_beats1_decode_T[11:3] : 9'h000);
	reg [8:0] d_last_counter;
	wire nodeOut_d_ready = (auto_out_d_bits_opcode[0] ? _nodeIn_r_deq_q_io_enq_ready : _q_b_deq_q_io_enq_ready);
	reg [2:0] b_count_0;
	reg [2:0] b_count_1;
	wire b_allow = (_q_b_deq_q_io_deq_bits_id ? b_count_1 : b_count_0) != (_q_b_deq_q_io_deq_bits_id ? w_count_1 : w_count_0);
	wire nodeIn_b_valid = _q_b_deq_q_io_deq_valid & b_allow;
	always @(posedge clock)
		if (reset) begin
			r_count_0 <= 3'h0;
			r_count_1 <= 3'h0;
			w_count_0 <= 3'h0;
			w_count_1 <= 3'h0;
			beatsLeft <= 8'h00;
			readys_mask <= 2'h3;
			state_0 <= 1'h0;
			state_1 <= 1'h0;
			d_last_counter <= 9'h000;
			b_count_0 <= 3'h0;
			b_count_1 <= 3'h0;
		end
		else begin : sv2v_autoblock_1
			reg _GEN_4;
			reg _GEN_5;
			reg latch;
			reg _GEN_6;
			_GEN_4 = r_out_ready & auto_in_ar_valid;
			_GEN_5 = nodeIn_aw_ready & auto_in_aw_valid;
			latch = idle & auto_out_a_ready;
			_GEN_6 = auto_in_b_ready & nodeIn_b_valid;
			if (_GEN_4 & ~auto_in_ar_bits_id)
				r_count_0 <= r_count_0 + 3'h1;
			if (_GEN_4 & auto_in_ar_bits_id)
				r_count_1 <= r_count_1 + 3'h1;
			if (_GEN_5 & ~auto_in_aw_bits_id)
				w_count_0 <= w_count_0 + 3'h1;
			if (_GEN_5 & auto_in_aw_bits_id)
				w_count_1 <= w_count_1 + 3'h1;
			if (latch)
				beatsLeft <= (winner_1 ? auto_in_aw_bits_len : 8'h00);
			else
				beatsLeft <= beatsLeft - {7'h00, auto_out_a_ready & nodeOut_a_valid};
			if (latch & |readys_valid) begin : sv2v_autoblock_2
				reg [1:0] _readys_mask_T;
				_readys_mask_T = readys_readys & readys_valid;
				readys_mask <= _readys_mask_T | {_readys_mask_T[0], 1'h0};
			end
			if (idle) begin
				state_0 <= winner_0;
				state_1 <= winner_1;
			end
			if (nodeOut_d_ready & auto_out_d_valid) begin
				if (d_last_counter == 9'h000)
					d_last_counter <= d_last_beats1;
				else
					d_last_counter <= d_last_counter - 9'h001;
			end
			if (_GEN_6 & ~_q_b_deq_q_io_deq_bits_id)
				b_count_0 <= b_count_0 + 3'h1;
			if (_GEN_6 & _q_b_deq_q_io_deq_bits_id)
				b_count_1 <= b_count_1 + 3'h1;
		end
	Queue1_AXI4BundleR nodeIn_r_deq_q(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_nodeIn_r_deq_q_io_enq_ready),
		.io_enq_valid(auto_out_d_valid & auto_out_d_bits_opcode[0]),
		.io_enq_bits_id(auto_out_d_bits_source[3]),
		.io_enq_bits_data(auto_out_d_bits_data),
		.io_enq_bits_resp(d_resp),
		.io_enq_bits_last((d_last_counter == 9'h001) | (d_last_beats1 == 9'h000)),
		.io_deq_ready(auto_in_r_ready),
		.io_deq_valid(auto_in_r_valid),
		.io_deq_bits_id(auto_in_r_bits_id),
		.io_deq_bits_data(auto_in_r_bits_data),
		.io_deq_bits_resp(auto_in_r_bits_resp),
		.io_deq_bits_last(auto_in_r_bits_last)
	);
	Queue1_AXI4BundleB q_b_deq_q(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_q_b_deq_q_io_enq_ready),
		.io_enq_valid(auto_out_d_valid & ~auto_out_d_bits_opcode[0]),
		.io_enq_bits_id(auto_out_d_bits_source[3]),
		.io_enq_bits_resp(d_resp),
		.io_deq_ready(auto_in_b_ready & b_allow),
		.io_deq_valid(_q_b_deq_q_io_deq_valid),
		.io_deq_bits_id(_q_b_deq_q_io_deq_bits_id),
		.io_deq_bits_resp(auto_in_b_bits_resp)
	);
	assign auto_in_aw_ready = nodeIn_aw_ready;
	assign auto_in_w_ready = w_out_ready & auto_in_aw_valid;
	assign auto_in_b_valid = nodeIn_b_valid;
	assign auto_in_b_bits_id = _q_b_deq_q_io_deq_bits_id;
	assign auto_in_ar_ready = r_out_ready;
	assign auto_out_a_valid = nodeOut_a_valid;
	assign auto_out_a_bits_opcode = {muxState_0, 1'h0, muxState_1};
	assign auto_out_a_bits_size = (muxState_0 ? r_size : 4'h0) | (muxState_1 ? w_size : 4'h0);
	assign auto_out_a_bits_source = (muxState_0 ? {auto_in_ar_bits_id, (auto_in_ar_bits_id ? r_count_1[1:0] : r_count_0[1:0]), 1'h0} : 4'h0) | (muxState_1 ? {auto_in_aw_bits_id, (auto_in_aw_bits_id ? w_count_1[1:0] : w_count_0[1:0]), 1'h1} : 4'h0);
	assign auto_out_a_bits_address = (muxState_0 ? r_addr : 32'h00000000) | (muxState_1 ? ((((w_size < 4'hd) & ({auto_in_aw_bits_addr[31:14], ~auto_in_aw_bits_addr[13:12]} == 20'h00000)) | ((w_size < 4'h7) & ((((auto_in_aw_bits_addr[31:12] == 20'h00000) | ({auto_in_aw_bits_addr[31:26], auto_in_aw_bits_addr[25:16] ^ 10'h200} == 16'h0000)) | ({auto_in_aw_bits_addr[31:28], ~auto_in_aw_bits_addr[27:26]} == 6'h00)) | (auto_in_aw_bits_addr[31:28] == 4'h8)))) | ((w_size < 4'h9) & ({auto_in_aw_bits_addr[31], ~auto_in_aw_bits_addr[30:29]} == 3'h0)) ? auto_in_aw_bits_addr : {29'h00000600, auto_in_aw_bits_addr[2:0]}) : 32'h00000000);
	assign auto_out_a_bits_user_amba_prot_bufferable = (muxState_0 & auto_in_ar_bits_cache[0]) | (muxState_1 & auto_in_aw_bits_cache[0]);
	assign auto_out_a_bits_user_amba_prot_modifiable = (muxState_0 & auto_in_ar_bits_cache[1]) | (muxState_1 & auto_in_aw_bits_cache[1]);
	assign auto_out_a_bits_user_amba_prot_readalloc = (muxState_0 & auto_in_ar_bits_cache[2]) | (muxState_1 & auto_in_aw_bits_cache[2]);
	assign auto_out_a_bits_user_amba_prot_writealloc = (muxState_0 & auto_in_ar_bits_cache[3]) | (muxState_1 & auto_in_aw_bits_cache[3]);
	assign auto_out_a_bits_user_amba_prot_privileged = (muxState_0 & auto_in_ar_bits_prot[0]) | (muxState_1 & auto_in_aw_bits_prot[0]);
	assign auto_out_a_bits_user_amba_prot_secure = (muxState_0 & ~auto_in_ar_bits_prot[1]) | (muxState_1 & ~auto_in_aw_bits_prot[1]);
	assign auto_out_a_bits_user_amba_prot_fetch = (muxState_0 & auto_in_ar_bits_prot[2]) | (muxState_1 & auto_in_aw_bits_prot[2]);
	assign auto_out_a_bits_mask = (muxState_0 ? {r_out_bits_a_mask_sub_3_1 | (r_out_bits_a_mask_sub_3_2 & r_addr[0]), r_out_bits_a_mask_sub_3_1 | (r_out_bits_a_mask_sub_3_2 & ~r_addr[0]), r_out_bits_a_mask_sub_2_1 | (r_out_bits_a_mask_sub_2_2 & r_addr[0]), r_out_bits_a_mask_sub_2_1 | (r_out_bits_a_mask_sub_2_2 & ~r_addr[0]), r_out_bits_a_mask_sub_1_1 | (r_out_bits_a_mask_sub_1_2 & r_addr[0]), r_out_bits_a_mask_sub_1_1 | (r_out_bits_a_mask_sub_1_2 & ~r_addr[0]), r_out_bits_a_mask_sub_0_1 | (r_out_bits_a_mask_sub_0_2 & r_addr[0]), r_out_bits_a_mask_sub_0_1 | (r_out_bits_a_mask_sub_0_2 & ~r_addr[0])} : 8'h00) | (muxState_1 ? auto_in_w_bits_strb : 8'h00);
	assign auto_out_a_bits_data = (muxState_1 ? auto_in_w_bits_data : 64'h0000000000000000);
	assign auto_out_d_ready = nodeOut_d_ready;
endmodule
