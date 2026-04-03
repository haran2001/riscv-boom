module TLToAXI4_1 (
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
	input auto_out_aw_ready;
	output wire auto_out_aw_valid;
	output wire [6:0] auto_out_aw_bits_id;
	output wire [31:0] auto_out_aw_bits_addr;
	output wire [7:0] auto_out_aw_bits_len;
	output wire [2:0] auto_out_aw_bits_size;
	output wire [1:0] auto_out_aw_bits_burst;
	output wire auto_out_aw_bits_lock;
	output wire [3:0] auto_out_aw_bits_cache;
	output wire [2:0] auto_out_aw_bits_prot;
	output wire [3:0] auto_out_aw_bits_qos;
	output wire [3:0] auto_out_aw_bits_echo_tl_state_size;
	output wire [6:0] auto_out_aw_bits_echo_tl_state_source;
	input auto_out_w_ready;
	output wire auto_out_w_valid;
	output wire [63:0] auto_out_w_bits_data;
	output wire [7:0] auto_out_w_bits_strb;
	output wire auto_out_w_bits_last;
	output wire auto_out_b_ready;
	input auto_out_b_valid;
	input [6:0] auto_out_b_bits_id;
	input [1:0] auto_out_b_bits_resp;
	input [3:0] auto_out_b_bits_echo_tl_state_size;
	input [6:0] auto_out_b_bits_echo_tl_state_source;
	input auto_out_ar_ready;
	output wire auto_out_ar_valid;
	output wire [6:0] auto_out_ar_bits_id;
	output wire [31:0] auto_out_ar_bits_addr;
	output wire [7:0] auto_out_ar_bits_len;
	output wire [2:0] auto_out_ar_bits_size;
	output wire [1:0] auto_out_ar_bits_burst;
	output wire auto_out_ar_bits_lock;
	output wire [3:0] auto_out_ar_bits_cache;
	output wire [2:0] auto_out_ar_bits_prot;
	output wire [3:0] auto_out_ar_bits_qos;
	output wire [3:0] auto_out_ar_bits_echo_tl_state_size;
	output wire [6:0] auto_out_ar_bits_echo_tl_state_source;
	output wire auto_out_r_ready;
	input auto_out_r_valid;
	input [6:0] auto_out_r_bits_id;
	input [63:0] auto_out_r_bits_data;
	input [1:0] auto_out_r_bits_resp;
	input [3:0] auto_out_r_bits_echo_tl_state_size;
	input [6:0] auto_out_r_bits_echo_tl_state_source;
	input auto_out_r_bits_last;
	reg count_127;
	reg count_126;
	reg count_125;
	reg count_124;
	reg count_123;
	reg count_122;
	reg count_121;
	reg count_120;
	reg count_119;
	reg count_118;
	reg count_117;
	reg count_116;
	reg count_115;
	reg count_114;
	reg count_113;
	reg count_112;
	reg count_111;
	reg count_110;
	reg count_109;
	reg count_108;
	reg count_107;
	reg count_106;
	reg count_105;
	reg count_104;
	reg count_103;
	reg count_102;
	reg count_101;
	reg count_100;
	reg count_99;
	reg count_98;
	reg count_97;
	reg count_96;
	reg count_95;
	reg count_94;
	reg count_93;
	reg count_92;
	reg count_91;
	reg count_90;
	reg count_89;
	reg count_88;
	reg count_87;
	reg count_86;
	reg count_85;
	reg count_84;
	reg count_83;
	reg count_82;
	reg count_81;
	reg count_80;
	reg count_79;
	reg count_78;
	reg count_77;
	reg count_76;
	reg count_75;
	reg count_74;
	reg count_73;
	reg count_72;
	reg count_71;
	reg count_70;
	reg count_69;
	reg count_68;
	reg count_67;
	reg count_66;
	reg count_65;
	reg count_64;
	reg count_63;
	reg count_62;
	reg count_61;
	reg count_60;
	reg count_59;
	reg count_58;
	reg count_57;
	reg count_56;
	reg count_55;
	reg count_54;
	reg count_53;
	reg count_52;
	reg count_51;
	reg count_50;
	reg count_49;
	reg count_48;
	reg count_47;
	reg count_46;
	reg count_45;
	reg count_44;
	reg count_43;
	reg count_42;
	reg count_41;
	reg count_40;
	reg count_39;
	reg count_38;
	reg count_37;
	reg count_36;
	reg count_35;
	reg count_34;
	reg count_33;
	reg count_32;
	reg count_31;
	reg count_30;
	reg count_29;
	reg count_28;
	reg count_27;
	reg count_26;
	reg count_25;
	reg count_24;
	reg count_23;
	reg count_22;
	reg count_21;
	reg count_20;
	reg count_19;
	reg count_18;
	reg count_17;
	reg count_16;
	reg count_15;
	reg count_14;
	reg count_13;
	reg count_12;
	reg count_11;
	reg count_10;
	reg count_9;
	reg count_8;
	reg count_7;
	reg count_6;
	reg count_5;
	reg count_4;
	reg count_3;
	reg count_2;
	reg count_1;
	reg count;
	wire _queue_arw_deq_q_io_enq_ready;
	wire _queue_arw_deq_q_io_deq_valid;
	wire [6:0] _queue_arw_deq_q_io_deq_bits_id;
	wire [31:0] _queue_arw_deq_q_io_deq_bits_addr;
	wire [7:0] _queue_arw_deq_q_io_deq_bits_len;
	wire [2:0] _queue_arw_deq_q_io_deq_bits_size;
	wire [1:0] _queue_arw_deq_q_io_deq_bits_burst;
	wire _queue_arw_deq_q_io_deq_bits_lock;
	wire [3:0] _queue_arw_deq_q_io_deq_bits_cache;
	wire [2:0] _queue_arw_deq_q_io_deq_bits_prot;
	wire [3:0] _queue_arw_deq_q_io_deq_bits_qos;
	wire [3:0] _queue_arw_deq_q_io_deq_bits_echo_tl_state_size;
	wire [6:0] _queue_arw_deq_q_io_deq_bits_echo_tl_state_source;
	wire _queue_arw_deq_q_io_deq_bits_wen;
	wire _nodeOut_w_deq_q_io_enq_ready;
	wire [895:0] _GEN = 896'hfffbefcf7ebcf8efdbaf4e7cb8f0dfbb6ecd7ab4e8cf9b2e4c78b0e0bf7aedcb76acd8af5aad4a74a8d09f3a6cc972a4c88f1a2c4870a0c07ef9ebc76e9cb86ed9ab466c98b05eb96ac56a94a84e992a446890a03e78e9c3668c982e58a9426488901e3868c16284880e182840608080;
	wire [12:0] _r_beats1_decode_T = 13'h003f << auto_in_a_bits_size;
	wire [2:0] r_beats1 = (auto_in_a_bits_opcode[2] ? 3'h0 : ~_r_beats1_decode_T[5:3]);
	reg [2:0] r_counter;
	wire a_first = r_counter == 3'h0;
	wire a_last = (r_counter == 3'h1) | (r_beats1 == 3'h0);
	reg doneAW;
	wire [17:0] _out_arw_bits_len_T = 18'h007ff << auto_in_a_bits_size;
	wire [127:0] _GEN_0 = {count_127, count_126, count_125, count_124, count_123, count_122, count_121, count_120, count_119, count_118, count_117, count_116, count_115, count_114, count_113, count_112, count_111, count_110, count_109, count_108, count_107, count_106, count_105, count_104, count_103, count_102, count_101, count_100, count_99, count_98, count_97, count_96, count_95, count_94, count_93, count_92, count_91, count_90, count_89, count_88, count_87, count_86, count_85, count_84, count_83, count_82, count_81, count_80, count_79, count_78, count_77, count_76, count_75, count_74, count_73, count_72, count_71, count_70, count_69, count_68, count_67, count_66, count_65, count_64, count_63, count_62, count_61, count_60, count_59, count_58, count_57, count_56, count_55, count_54, count_53, count_52, count_51, count_50, count_49, count_48, count_47, count_46, count_45, count_44, count_43, count_42, count_41, count_40, count_39, count_38, count_37, count_36, count_35, count_34, count_33, count_32, count_31, count_30, count_29, count_28, count_27, count_26, count_25, count_24, count_23, count_22, count_21, count_20, count_19, count_18, count_17, count_16, count_15, count_14, count_13, count_12, count_11, count_10, count_9, count_8, count_7, count_6, count_5, count_4, count_3, count_2, count_1, count};
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
	wire [2:0] nodeIn_d_bits_size = (r_wins ? auto_out_r_bits_echo_tl_state_size[2:0] : auto_out_b_bits_echo_tl_state_size[2:0]);
	wire [6:0] nodeIn_d_bits_source = (r_wins ? auto_out_r_bits_echo_tl_state_source : auto_out_b_bits_echo_tl_state_source);
	wire nodeIn_d_bits_denied = (r_wins ? r_denied : |auto_out_b_bits_resp);
	wire nodeIn_d_bits_corrupt = r_wins & (|auto_out_r_bits_resp | r_denied);
	wire [6:0] d_sel_shiftAmount = (r_wins ? auto_out_r_bits_id : auto_out_b_bits_id);
	wire d_last = ~r_wins | auto_out_r_bits_last;
	wire _inc_T_127 = _queue_arw_deq_q_io_enq_ready & out_arw_valid;
	wire inc = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h00) & _inc_T_127;
	wire _dec_T_255 = auto_in_d_ready & nodeIn_d_valid;
	wire dec = ((d_sel_shiftAmount == 7'h00) & d_last) & _dec_T_255;
	wire inc_1 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h01) & _inc_T_127;
	wire dec_1 = ((d_sel_shiftAmount == 7'h01) & d_last) & _dec_T_255;
	wire inc_2 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h02) & _inc_T_127;
	wire dec_2 = ((d_sel_shiftAmount == 7'h02) & d_last) & _dec_T_255;
	wire inc_3 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h03) & _inc_T_127;
	wire dec_3 = ((d_sel_shiftAmount == 7'h03) & d_last) & _dec_T_255;
	wire inc_4 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h04) & _inc_T_127;
	wire dec_4 = ((d_sel_shiftAmount == 7'h04) & d_last) & _dec_T_255;
	wire inc_5 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h05) & _inc_T_127;
	wire dec_5 = ((d_sel_shiftAmount == 7'h05) & d_last) & _dec_T_255;
	wire inc_6 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h06) & _inc_T_127;
	wire dec_6 = ((d_sel_shiftAmount == 7'h06) & d_last) & _dec_T_255;
	wire inc_7 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h07) & _inc_T_127;
	wire dec_7 = ((d_sel_shiftAmount == 7'h07) & d_last) & _dec_T_255;
	wire inc_8 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h08) & _inc_T_127;
	wire dec_8 = ((d_sel_shiftAmount == 7'h08) & d_last) & _dec_T_255;
	wire inc_9 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h09) & _inc_T_127;
	wire dec_9 = ((d_sel_shiftAmount == 7'h09) & d_last) & _dec_T_255;
	wire inc_10 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h0a) & _inc_T_127;
	wire dec_10 = ((d_sel_shiftAmount == 7'h0a) & d_last) & _dec_T_255;
	wire inc_11 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h0b) & _inc_T_127;
	wire dec_11 = ((d_sel_shiftAmount == 7'h0b) & d_last) & _dec_T_255;
	wire inc_12 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h0c) & _inc_T_127;
	wire dec_12 = ((d_sel_shiftAmount == 7'h0c) & d_last) & _dec_T_255;
	wire inc_13 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h0d) & _inc_T_127;
	wire dec_13 = ((d_sel_shiftAmount == 7'h0d) & d_last) & _dec_T_255;
	wire inc_14 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h0e) & _inc_T_127;
	wire dec_14 = ((d_sel_shiftAmount == 7'h0e) & d_last) & _dec_T_255;
	wire inc_15 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h0f) & _inc_T_127;
	wire dec_15 = ((d_sel_shiftAmount == 7'h0f) & d_last) & _dec_T_255;
	wire inc_16 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h10) & _inc_T_127;
	wire dec_16 = ((d_sel_shiftAmount == 7'h10) & d_last) & _dec_T_255;
	wire inc_17 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h11) & _inc_T_127;
	wire dec_17 = ((d_sel_shiftAmount == 7'h11) & d_last) & _dec_T_255;
	wire inc_18 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h12) & _inc_T_127;
	wire dec_18 = ((d_sel_shiftAmount == 7'h12) & d_last) & _dec_T_255;
	wire inc_19 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h13) & _inc_T_127;
	wire dec_19 = ((d_sel_shiftAmount == 7'h13) & d_last) & _dec_T_255;
	wire inc_20 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h14) & _inc_T_127;
	wire dec_20 = ((d_sel_shiftAmount == 7'h14) & d_last) & _dec_T_255;
	wire inc_21 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h15) & _inc_T_127;
	wire dec_21 = ((d_sel_shiftAmount == 7'h15) & d_last) & _dec_T_255;
	wire inc_22 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h16) & _inc_T_127;
	wire dec_22 = ((d_sel_shiftAmount == 7'h16) & d_last) & _dec_T_255;
	wire inc_23 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h17) & _inc_T_127;
	wire dec_23 = ((d_sel_shiftAmount == 7'h17) & d_last) & _dec_T_255;
	wire inc_24 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h18) & _inc_T_127;
	wire dec_24 = ((d_sel_shiftAmount == 7'h18) & d_last) & _dec_T_255;
	wire inc_25 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h19) & _inc_T_127;
	wire dec_25 = ((d_sel_shiftAmount == 7'h19) & d_last) & _dec_T_255;
	wire inc_26 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h1a) & _inc_T_127;
	wire dec_26 = ((d_sel_shiftAmount == 7'h1a) & d_last) & _dec_T_255;
	wire inc_27 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h1b) & _inc_T_127;
	wire dec_27 = ((d_sel_shiftAmount == 7'h1b) & d_last) & _dec_T_255;
	wire inc_28 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h1c) & _inc_T_127;
	wire dec_28 = ((d_sel_shiftAmount == 7'h1c) & d_last) & _dec_T_255;
	wire inc_29 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h1d) & _inc_T_127;
	wire dec_29 = ((d_sel_shiftAmount == 7'h1d) & d_last) & _dec_T_255;
	wire inc_30 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h1e) & _inc_T_127;
	wire dec_30 = ((d_sel_shiftAmount == 7'h1e) & d_last) & _dec_T_255;
	wire inc_31 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h1f) & _inc_T_127;
	wire dec_31 = ((d_sel_shiftAmount == 7'h1f) & d_last) & _dec_T_255;
	wire inc_32 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h20) & _inc_T_127;
	wire dec_32 = ((d_sel_shiftAmount == 7'h20) & d_last) & _dec_T_255;
	wire inc_33 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h21) & _inc_T_127;
	wire dec_33 = ((d_sel_shiftAmount == 7'h21) & d_last) & _dec_T_255;
	wire inc_34 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h22) & _inc_T_127;
	wire dec_34 = ((d_sel_shiftAmount == 7'h22) & d_last) & _dec_T_255;
	wire inc_35 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h23) & _inc_T_127;
	wire dec_35 = ((d_sel_shiftAmount == 7'h23) & d_last) & _dec_T_255;
	wire inc_36 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h24) & _inc_T_127;
	wire dec_36 = ((d_sel_shiftAmount == 7'h24) & d_last) & _dec_T_255;
	wire inc_37 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h25) & _inc_T_127;
	wire dec_37 = ((d_sel_shiftAmount == 7'h25) & d_last) & _dec_T_255;
	wire inc_38 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h26) & _inc_T_127;
	wire dec_38 = ((d_sel_shiftAmount == 7'h26) & d_last) & _dec_T_255;
	wire inc_39 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h27) & _inc_T_127;
	wire dec_39 = ((d_sel_shiftAmount == 7'h27) & d_last) & _dec_T_255;
	wire inc_40 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h28) & _inc_T_127;
	wire dec_40 = ((d_sel_shiftAmount == 7'h28) & d_last) & _dec_T_255;
	wire inc_41 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h29) & _inc_T_127;
	wire dec_41 = ((d_sel_shiftAmount == 7'h29) & d_last) & _dec_T_255;
	wire inc_42 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h2a) & _inc_T_127;
	wire dec_42 = ((d_sel_shiftAmount == 7'h2a) & d_last) & _dec_T_255;
	wire inc_43 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h2b) & _inc_T_127;
	wire dec_43 = ((d_sel_shiftAmount == 7'h2b) & d_last) & _dec_T_255;
	wire inc_44 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h2c) & _inc_T_127;
	wire dec_44 = ((d_sel_shiftAmount == 7'h2c) & d_last) & _dec_T_255;
	wire inc_45 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h2d) & _inc_T_127;
	wire dec_45 = ((d_sel_shiftAmount == 7'h2d) & d_last) & _dec_T_255;
	wire inc_46 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h2e) & _inc_T_127;
	wire dec_46 = ((d_sel_shiftAmount == 7'h2e) & d_last) & _dec_T_255;
	wire inc_47 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h2f) & _inc_T_127;
	wire dec_47 = ((d_sel_shiftAmount == 7'h2f) & d_last) & _dec_T_255;
	wire inc_48 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h30) & _inc_T_127;
	wire dec_48 = ((d_sel_shiftAmount == 7'h30) & d_last) & _dec_T_255;
	wire inc_49 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h31) & _inc_T_127;
	wire dec_49 = ((d_sel_shiftAmount == 7'h31) & d_last) & _dec_T_255;
	wire inc_50 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h32) & _inc_T_127;
	wire dec_50 = ((d_sel_shiftAmount == 7'h32) & d_last) & _dec_T_255;
	wire inc_51 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h33) & _inc_T_127;
	wire dec_51 = ((d_sel_shiftAmount == 7'h33) & d_last) & _dec_T_255;
	wire inc_52 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h34) & _inc_T_127;
	wire dec_52 = ((d_sel_shiftAmount == 7'h34) & d_last) & _dec_T_255;
	wire inc_53 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h35) & _inc_T_127;
	wire dec_53 = ((d_sel_shiftAmount == 7'h35) & d_last) & _dec_T_255;
	wire inc_54 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h36) & _inc_T_127;
	wire dec_54 = ((d_sel_shiftAmount == 7'h36) & d_last) & _dec_T_255;
	wire inc_55 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h37) & _inc_T_127;
	wire dec_55 = ((d_sel_shiftAmount == 7'h37) & d_last) & _dec_T_255;
	wire inc_56 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h38) & _inc_T_127;
	wire dec_56 = ((d_sel_shiftAmount == 7'h38) & d_last) & _dec_T_255;
	wire inc_57 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h39) & _inc_T_127;
	wire dec_57 = ((d_sel_shiftAmount == 7'h39) & d_last) & _dec_T_255;
	wire inc_58 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h3a) & _inc_T_127;
	wire dec_58 = ((d_sel_shiftAmount == 7'h3a) & d_last) & _dec_T_255;
	wire inc_59 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h3b) & _inc_T_127;
	wire dec_59 = ((d_sel_shiftAmount == 7'h3b) & d_last) & _dec_T_255;
	wire inc_60 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h3c) & _inc_T_127;
	wire dec_60 = ((d_sel_shiftAmount == 7'h3c) & d_last) & _dec_T_255;
	wire inc_61 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h3d) & _inc_T_127;
	wire dec_61 = ((d_sel_shiftAmount == 7'h3d) & d_last) & _dec_T_255;
	wire inc_62 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h3e) & _inc_T_127;
	wire dec_62 = ((d_sel_shiftAmount == 7'h3e) & d_last) & _dec_T_255;
	wire inc_63 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h3f) & _inc_T_127;
	wire dec_63 = ((d_sel_shiftAmount == 7'h3f) & d_last) & _dec_T_255;
	wire inc_64 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h40) & _inc_T_127;
	wire dec_64 = ((d_sel_shiftAmount == 7'h40) & d_last) & _dec_T_255;
	wire inc_65 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h41) & _inc_T_127;
	wire dec_65 = ((d_sel_shiftAmount == 7'h41) & d_last) & _dec_T_255;
	wire inc_66 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h42) & _inc_T_127;
	wire dec_66 = ((d_sel_shiftAmount == 7'h42) & d_last) & _dec_T_255;
	wire inc_67 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h43) & _inc_T_127;
	wire dec_67 = ((d_sel_shiftAmount == 7'h43) & d_last) & _dec_T_255;
	wire inc_68 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h44) & _inc_T_127;
	wire dec_68 = ((d_sel_shiftAmount == 7'h44) & d_last) & _dec_T_255;
	wire inc_69 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h45) & _inc_T_127;
	wire dec_69 = ((d_sel_shiftAmount == 7'h45) & d_last) & _dec_T_255;
	wire inc_70 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h46) & _inc_T_127;
	wire dec_70 = ((d_sel_shiftAmount == 7'h46) & d_last) & _dec_T_255;
	wire inc_71 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h47) & _inc_T_127;
	wire dec_71 = ((d_sel_shiftAmount == 7'h47) & d_last) & _dec_T_255;
	wire inc_72 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h48) & _inc_T_127;
	wire dec_72 = ((d_sel_shiftAmount == 7'h48) & d_last) & _dec_T_255;
	wire inc_73 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h49) & _inc_T_127;
	wire dec_73 = ((d_sel_shiftAmount == 7'h49) & d_last) & _dec_T_255;
	wire inc_74 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h4a) & _inc_T_127;
	wire dec_74 = ((d_sel_shiftAmount == 7'h4a) & d_last) & _dec_T_255;
	wire inc_75 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h4b) & _inc_T_127;
	wire dec_75 = ((d_sel_shiftAmount == 7'h4b) & d_last) & _dec_T_255;
	wire inc_76 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h4c) & _inc_T_127;
	wire dec_76 = ((d_sel_shiftAmount == 7'h4c) & d_last) & _dec_T_255;
	wire inc_77 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h4d) & _inc_T_127;
	wire dec_77 = ((d_sel_shiftAmount == 7'h4d) & d_last) & _dec_T_255;
	wire inc_78 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h4e) & _inc_T_127;
	wire dec_78 = ((d_sel_shiftAmount == 7'h4e) & d_last) & _dec_T_255;
	wire inc_79 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h4f) & _inc_T_127;
	wire dec_79 = ((d_sel_shiftAmount == 7'h4f) & d_last) & _dec_T_255;
	wire inc_80 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h50) & _inc_T_127;
	wire dec_80 = ((d_sel_shiftAmount == 7'h50) & d_last) & _dec_T_255;
	wire inc_81 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h51) & _inc_T_127;
	wire dec_81 = ((d_sel_shiftAmount == 7'h51) & d_last) & _dec_T_255;
	wire inc_82 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h52) & _inc_T_127;
	wire dec_82 = ((d_sel_shiftAmount == 7'h52) & d_last) & _dec_T_255;
	wire inc_83 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h53) & _inc_T_127;
	wire dec_83 = ((d_sel_shiftAmount == 7'h53) & d_last) & _dec_T_255;
	wire inc_84 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h54) & _inc_T_127;
	wire dec_84 = ((d_sel_shiftAmount == 7'h54) & d_last) & _dec_T_255;
	wire inc_85 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h55) & _inc_T_127;
	wire dec_85 = ((d_sel_shiftAmount == 7'h55) & d_last) & _dec_T_255;
	wire inc_86 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h56) & _inc_T_127;
	wire dec_86 = ((d_sel_shiftAmount == 7'h56) & d_last) & _dec_T_255;
	wire inc_87 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h57) & _inc_T_127;
	wire dec_87 = ((d_sel_shiftAmount == 7'h57) & d_last) & _dec_T_255;
	wire inc_88 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h58) & _inc_T_127;
	wire dec_88 = ((d_sel_shiftAmount == 7'h58) & d_last) & _dec_T_255;
	wire inc_89 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h59) & _inc_T_127;
	wire dec_89 = ((d_sel_shiftAmount == 7'h59) & d_last) & _dec_T_255;
	wire inc_90 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h5a) & _inc_T_127;
	wire dec_90 = ((d_sel_shiftAmount == 7'h5a) & d_last) & _dec_T_255;
	wire inc_91 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h5b) & _inc_T_127;
	wire dec_91 = ((d_sel_shiftAmount == 7'h5b) & d_last) & _dec_T_255;
	wire inc_92 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h5c) & _inc_T_127;
	wire dec_92 = ((d_sel_shiftAmount == 7'h5c) & d_last) & _dec_T_255;
	wire inc_93 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h5d) & _inc_T_127;
	wire dec_93 = ((d_sel_shiftAmount == 7'h5d) & d_last) & _dec_T_255;
	wire inc_94 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h5e) & _inc_T_127;
	wire dec_94 = ((d_sel_shiftAmount == 7'h5e) & d_last) & _dec_T_255;
	wire inc_95 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h5f) & _inc_T_127;
	wire dec_95 = ((d_sel_shiftAmount == 7'h5f) & d_last) & _dec_T_255;
	wire inc_96 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h60) & _inc_T_127;
	wire dec_96 = ((d_sel_shiftAmount == 7'h60) & d_last) & _dec_T_255;
	wire inc_97 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h61) & _inc_T_127;
	wire dec_97 = ((d_sel_shiftAmount == 7'h61) & d_last) & _dec_T_255;
	wire inc_98 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h62) & _inc_T_127;
	wire dec_98 = ((d_sel_shiftAmount == 7'h62) & d_last) & _dec_T_255;
	wire inc_99 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h63) & _inc_T_127;
	wire dec_99 = ((d_sel_shiftAmount == 7'h63) & d_last) & _dec_T_255;
	wire inc_100 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h64) & _inc_T_127;
	wire dec_100 = ((d_sel_shiftAmount == 7'h64) & d_last) & _dec_T_255;
	wire inc_101 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h65) & _inc_T_127;
	wire dec_101 = ((d_sel_shiftAmount == 7'h65) & d_last) & _dec_T_255;
	wire inc_102 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h66) & _inc_T_127;
	wire dec_102 = ((d_sel_shiftAmount == 7'h66) & d_last) & _dec_T_255;
	wire inc_103 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h67) & _inc_T_127;
	wire dec_103 = ((d_sel_shiftAmount == 7'h67) & d_last) & _dec_T_255;
	wire inc_104 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h68) & _inc_T_127;
	wire dec_104 = ((d_sel_shiftAmount == 7'h68) & d_last) & _dec_T_255;
	wire inc_105 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h69) & _inc_T_127;
	wire dec_105 = ((d_sel_shiftAmount == 7'h69) & d_last) & _dec_T_255;
	wire inc_106 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h6a) & _inc_T_127;
	wire dec_106 = ((d_sel_shiftAmount == 7'h6a) & d_last) & _dec_T_255;
	wire inc_107 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h6b) & _inc_T_127;
	wire dec_107 = ((d_sel_shiftAmount == 7'h6b) & d_last) & _dec_T_255;
	wire inc_108 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h6c) & _inc_T_127;
	wire dec_108 = ((d_sel_shiftAmount == 7'h6c) & d_last) & _dec_T_255;
	wire inc_109 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h6d) & _inc_T_127;
	wire dec_109 = ((d_sel_shiftAmount == 7'h6d) & d_last) & _dec_T_255;
	wire inc_110 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h6e) & _inc_T_127;
	wire dec_110 = ((d_sel_shiftAmount == 7'h6e) & d_last) & _dec_T_255;
	wire inc_111 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h6f) & _inc_T_127;
	wire dec_111 = ((d_sel_shiftAmount == 7'h6f) & d_last) & _dec_T_255;
	wire inc_112 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h70) & _inc_T_127;
	wire dec_112 = ((d_sel_shiftAmount == 7'h70) & d_last) & _dec_T_255;
	wire inc_113 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h71) & _inc_T_127;
	wire dec_113 = ((d_sel_shiftAmount == 7'h71) & d_last) & _dec_T_255;
	wire inc_114 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h72) & _inc_T_127;
	wire dec_114 = ((d_sel_shiftAmount == 7'h72) & d_last) & _dec_T_255;
	wire inc_115 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h73) & _inc_T_127;
	wire dec_115 = ((d_sel_shiftAmount == 7'h73) & d_last) & _dec_T_255;
	wire inc_116 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h74) & _inc_T_127;
	wire dec_116 = ((d_sel_shiftAmount == 7'h74) & d_last) & _dec_T_255;
	wire inc_117 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h75) & _inc_T_127;
	wire dec_117 = ((d_sel_shiftAmount == 7'h75) & d_last) & _dec_T_255;
	wire inc_118 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h76) & _inc_T_127;
	wire dec_118 = ((d_sel_shiftAmount == 7'h76) & d_last) & _dec_T_255;
	wire inc_119 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h77) & _inc_T_127;
	wire dec_119 = ((d_sel_shiftAmount == 7'h77) & d_last) & _dec_T_255;
	wire inc_120 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h78) & _inc_T_127;
	wire dec_120 = ((d_sel_shiftAmount == 7'h78) & d_last) & _dec_T_255;
	wire inc_121 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h79) & _inc_T_127;
	wire dec_121 = ((d_sel_shiftAmount == 7'h79) & d_last) & _dec_T_255;
	wire inc_122 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h7a) & _inc_T_127;
	wire dec_122 = ((d_sel_shiftAmount == 7'h7a) & d_last) & _dec_T_255;
	wire inc_123 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h7b) & _inc_T_127;
	wire dec_123 = ((d_sel_shiftAmount == 7'h7b) & d_last) & _dec_T_255;
	wire inc_124 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h7c) & _inc_T_127;
	wire dec_124 = ((d_sel_shiftAmount == 7'h7c) & d_last) & _dec_T_255;
	wire inc_125 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h7d) & _inc_T_127;
	wire dec_125 = ((d_sel_shiftAmount == 7'h7d) & d_last) & _dec_T_255;
	wire inc_126 = (_GEN[auto_in_a_bits_source * 7+:7] == 7'h7e) & _inc_T_127;
	wire dec_126 = ((d_sel_shiftAmount == 7'h7e) & d_last) & _dec_T_255;
	wire inc_127 = &_GEN[auto_in_a_bits_source * 7+:7] & _inc_T_127;
	wire dec_127 = (&d_sel_shiftAmount & d_last) & _dec_T_255;
	always @(posedge clock) begin
		if (reset) begin
			r_counter <= 3'h0;
			doneAW <= 1'h0;
			r_holds_d <= 1'h0;
			r_first <= 1'h1;
			count <= 1'h0;
			count_1 <= 1'h0;
			count_2 <= 1'h0;
			count_3 <= 1'h0;
			count_4 <= 1'h0;
			count_5 <= 1'h0;
			count_6 <= 1'h0;
			count_7 <= 1'h0;
			count_8 <= 1'h0;
			count_9 <= 1'h0;
			count_10 <= 1'h0;
			count_11 <= 1'h0;
			count_12 <= 1'h0;
			count_13 <= 1'h0;
			count_14 <= 1'h0;
			count_15 <= 1'h0;
			count_16 <= 1'h0;
			count_17 <= 1'h0;
			count_18 <= 1'h0;
			count_19 <= 1'h0;
			count_20 <= 1'h0;
			count_21 <= 1'h0;
			count_22 <= 1'h0;
			count_23 <= 1'h0;
			count_24 <= 1'h0;
			count_25 <= 1'h0;
			count_26 <= 1'h0;
			count_27 <= 1'h0;
			count_28 <= 1'h0;
			count_29 <= 1'h0;
			count_30 <= 1'h0;
			count_31 <= 1'h0;
			count_32 <= 1'h0;
			count_33 <= 1'h0;
			count_34 <= 1'h0;
			count_35 <= 1'h0;
			count_36 <= 1'h0;
			count_37 <= 1'h0;
			count_38 <= 1'h0;
			count_39 <= 1'h0;
			count_40 <= 1'h0;
			count_41 <= 1'h0;
			count_42 <= 1'h0;
			count_43 <= 1'h0;
			count_44 <= 1'h0;
			count_45 <= 1'h0;
			count_46 <= 1'h0;
			count_47 <= 1'h0;
			count_48 <= 1'h0;
			count_49 <= 1'h0;
			count_50 <= 1'h0;
			count_51 <= 1'h0;
			count_52 <= 1'h0;
			count_53 <= 1'h0;
			count_54 <= 1'h0;
			count_55 <= 1'h0;
			count_56 <= 1'h0;
			count_57 <= 1'h0;
			count_58 <= 1'h0;
			count_59 <= 1'h0;
			count_60 <= 1'h0;
			count_61 <= 1'h0;
			count_62 <= 1'h0;
			count_63 <= 1'h0;
			count_64 <= 1'h0;
			count_65 <= 1'h0;
			count_66 <= 1'h0;
			count_67 <= 1'h0;
			count_68 <= 1'h0;
			count_69 <= 1'h0;
			count_70 <= 1'h0;
			count_71 <= 1'h0;
			count_72 <= 1'h0;
			count_73 <= 1'h0;
			count_74 <= 1'h0;
			count_75 <= 1'h0;
			count_76 <= 1'h0;
			count_77 <= 1'h0;
			count_78 <= 1'h0;
			count_79 <= 1'h0;
			count_80 <= 1'h0;
			count_81 <= 1'h0;
			count_82 <= 1'h0;
			count_83 <= 1'h0;
			count_84 <= 1'h0;
			count_85 <= 1'h0;
			count_86 <= 1'h0;
			count_87 <= 1'h0;
			count_88 <= 1'h0;
			count_89 <= 1'h0;
			count_90 <= 1'h0;
			count_91 <= 1'h0;
			count_92 <= 1'h0;
			count_93 <= 1'h0;
			count_94 <= 1'h0;
			count_95 <= 1'h0;
			count_96 <= 1'h0;
			count_97 <= 1'h0;
			count_98 <= 1'h0;
			count_99 <= 1'h0;
			count_100 <= 1'h0;
			count_101 <= 1'h0;
			count_102 <= 1'h0;
			count_103 <= 1'h0;
			count_104 <= 1'h0;
			count_105 <= 1'h0;
			count_106 <= 1'h0;
			count_107 <= 1'h0;
			count_108 <= 1'h0;
			count_109 <= 1'h0;
			count_110 <= 1'h0;
			count_111 <= 1'h0;
			count_112 <= 1'h0;
			count_113 <= 1'h0;
			count_114 <= 1'h0;
			count_115 <= 1'h0;
			count_116 <= 1'h0;
			count_117 <= 1'h0;
			count_118 <= 1'h0;
			count_119 <= 1'h0;
			count_120 <= 1'h0;
			count_121 <= 1'h0;
			count_122 <= 1'h0;
			count_123 <= 1'h0;
			count_124 <= 1'h0;
			count_125 <= 1'h0;
			count_126 <= 1'h0;
			count_127 <= 1'h0;
		end
		else begin
			if (nodeIn_a_ready & auto_in_a_valid) begin
				if (a_first)
					r_counter <= r_beats1;
				else
					r_counter <= r_counter - 3'h1;
				doneAW <= ~a_last;
			end
			if (nodeOut_r_ready & auto_out_r_valid) begin
				r_holds_d <= ~auto_out_r_bits_last;
				r_first <= auto_out_r_bits_last;
			end
			count <= (count + inc) - dec;
			count_1 <= (count_1 + inc_1) - dec_1;
			count_2 <= (count_2 + inc_2) - dec_2;
			count_3 <= (count_3 + inc_3) - dec_3;
			count_4 <= (count_4 + inc_4) - dec_4;
			count_5 <= (count_5 + inc_5) - dec_5;
			count_6 <= (count_6 + inc_6) - dec_6;
			count_7 <= (count_7 + inc_7) - dec_7;
			count_8 <= (count_8 + inc_8) - dec_8;
			count_9 <= (count_9 + inc_9) - dec_9;
			count_10 <= (count_10 + inc_10) - dec_10;
			count_11 <= (count_11 + inc_11) - dec_11;
			count_12 <= (count_12 + inc_12) - dec_12;
			count_13 <= (count_13 + inc_13) - dec_13;
			count_14 <= (count_14 + inc_14) - dec_14;
			count_15 <= (count_15 + inc_15) - dec_15;
			count_16 <= (count_16 + inc_16) - dec_16;
			count_17 <= (count_17 + inc_17) - dec_17;
			count_18 <= (count_18 + inc_18) - dec_18;
			count_19 <= (count_19 + inc_19) - dec_19;
			count_20 <= (count_20 + inc_20) - dec_20;
			count_21 <= (count_21 + inc_21) - dec_21;
			count_22 <= (count_22 + inc_22) - dec_22;
			count_23 <= (count_23 + inc_23) - dec_23;
			count_24 <= (count_24 + inc_24) - dec_24;
			count_25 <= (count_25 + inc_25) - dec_25;
			count_26 <= (count_26 + inc_26) - dec_26;
			count_27 <= (count_27 + inc_27) - dec_27;
			count_28 <= (count_28 + inc_28) - dec_28;
			count_29 <= (count_29 + inc_29) - dec_29;
			count_30 <= (count_30 + inc_30) - dec_30;
			count_31 <= (count_31 + inc_31) - dec_31;
			count_32 <= (count_32 + inc_32) - dec_32;
			count_33 <= (count_33 + inc_33) - dec_33;
			count_34 <= (count_34 + inc_34) - dec_34;
			count_35 <= (count_35 + inc_35) - dec_35;
			count_36 <= (count_36 + inc_36) - dec_36;
			count_37 <= (count_37 + inc_37) - dec_37;
			count_38 <= (count_38 + inc_38) - dec_38;
			count_39 <= (count_39 + inc_39) - dec_39;
			count_40 <= (count_40 + inc_40) - dec_40;
			count_41 <= (count_41 + inc_41) - dec_41;
			count_42 <= (count_42 + inc_42) - dec_42;
			count_43 <= (count_43 + inc_43) - dec_43;
			count_44 <= (count_44 + inc_44) - dec_44;
			count_45 <= (count_45 + inc_45) - dec_45;
			count_46 <= (count_46 + inc_46) - dec_46;
			count_47 <= (count_47 + inc_47) - dec_47;
			count_48 <= (count_48 + inc_48) - dec_48;
			count_49 <= (count_49 + inc_49) - dec_49;
			count_50 <= (count_50 + inc_50) - dec_50;
			count_51 <= (count_51 + inc_51) - dec_51;
			count_52 <= (count_52 + inc_52) - dec_52;
			count_53 <= (count_53 + inc_53) - dec_53;
			count_54 <= (count_54 + inc_54) - dec_54;
			count_55 <= (count_55 + inc_55) - dec_55;
			count_56 <= (count_56 + inc_56) - dec_56;
			count_57 <= (count_57 + inc_57) - dec_57;
			count_58 <= (count_58 + inc_58) - dec_58;
			count_59 <= (count_59 + inc_59) - dec_59;
			count_60 <= (count_60 + inc_60) - dec_60;
			count_61 <= (count_61 + inc_61) - dec_61;
			count_62 <= (count_62 + inc_62) - dec_62;
			count_63 <= (count_63 + inc_63) - dec_63;
			count_64 <= (count_64 + inc_64) - dec_64;
			count_65 <= (count_65 + inc_65) - dec_65;
			count_66 <= (count_66 + inc_66) - dec_66;
			count_67 <= (count_67 + inc_67) - dec_67;
			count_68 <= (count_68 + inc_68) - dec_68;
			count_69 <= (count_69 + inc_69) - dec_69;
			count_70 <= (count_70 + inc_70) - dec_70;
			count_71 <= (count_71 + inc_71) - dec_71;
			count_72 <= (count_72 + inc_72) - dec_72;
			count_73 <= (count_73 + inc_73) - dec_73;
			count_74 <= (count_74 + inc_74) - dec_74;
			count_75 <= (count_75 + inc_75) - dec_75;
			count_76 <= (count_76 + inc_76) - dec_76;
			count_77 <= (count_77 + inc_77) - dec_77;
			count_78 <= (count_78 + inc_78) - dec_78;
			count_79 <= (count_79 + inc_79) - dec_79;
			count_80 <= (count_80 + inc_80) - dec_80;
			count_81 <= (count_81 + inc_81) - dec_81;
			count_82 <= (count_82 + inc_82) - dec_82;
			count_83 <= (count_83 + inc_83) - dec_83;
			count_84 <= (count_84 + inc_84) - dec_84;
			count_85 <= (count_85 + inc_85) - dec_85;
			count_86 <= (count_86 + inc_86) - dec_86;
			count_87 <= (count_87 + inc_87) - dec_87;
			count_88 <= (count_88 + inc_88) - dec_88;
			count_89 <= (count_89 + inc_89) - dec_89;
			count_90 <= (count_90 + inc_90) - dec_90;
			count_91 <= (count_91 + inc_91) - dec_91;
			count_92 <= (count_92 + inc_92) - dec_92;
			count_93 <= (count_93 + inc_93) - dec_93;
			count_94 <= (count_94 + inc_94) - dec_94;
			count_95 <= (count_95 + inc_95) - dec_95;
			count_96 <= (count_96 + inc_96) - dec_96;
			count_97 <= (count_97 + inc_97) - dec_97;
			count_98 <= (count_98 + inc_98) - dec_98;
			count_99 <= (count_99 + inc_99) - dec_99;
			count_100 <= (count_100 + inc_100) - dec_100;
			count_101 <= (count_101 + inc_101) - dec_101;
			count_102 <= (count_102 + inc_102) - dec_102;
			count_103 <= (count_103 + inc_103) - dec_103;
			count_104 <= (count_104 + inc_104) - dec_104;
			count_105 <= (count_105 + inc_105) - dec_105;
			count_106 <= (count_106 + inc_106) - dec_106;
			count_107 <= (count_107 + inc_107) - dec_107;
			count_108 <= (count_108 + inc_108) - dec_108;
			count_109 <= (count_109 + inc_109) - dec_109;
			count_110 <= (count_110 + inc_110) - dec_110;
			count_111 <= (count_111 + inc_111) - dec_111;
			count_112 <= (count_112 + inc_112) - dec_112;
			count_113 <= (count_113 + inc_113) - dec_113;
			count_114 <= (count_114 + inc_114) - dec_114;
			count_115 <= (count_115 + inc_115) - dec_115;
			count_116 <= (count_116 + inc_116) - dec_116;
			count_117 <= (count_117 + inc_117) - dec_117;
			count_118 <= (count_118 + inc_118) - dec_118;
			count_119 <= (count_119 + inc_119) - dec_119;
			count_120 <= (count_120 + inc_120) - dec_120;
			count_121 <= (count_121 + inc_121) - dec_121;
			count_122 <= (count_122 + inc_122) - dec_122;
			count_123 <= (count_123 + inc_123) - dec_123;
			count_124 <= (count_124 + inc_124) - dec_124;
			count_125 <= (count_125 + inc_125) - dec_125;
			count_126 <= (count_126 + inc_126) - dec_126;
			count_127 <= (count_127 + inc_127) - dec_127;
		end
		if (auto_out_b_valid & ~nodeOut_b_ready)
			b_delay <= b_delay + 3'h1;
		else
			b_delay <= 3'h0;
		if (r_first)
			r_denied_r <= &auto_out_r_bits_resp;
	end
	TLMonitor_19 monitor(
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
	Queue1_AXI4BundleARW_1 queue_arw_deq_q(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_queue_arw_deq_q_io_enq_ready),
		.io_enq_valid(out_arw_valid),
		.io_enq_bits_id(_GEN[auto_in_a_bits_source * 7+:7]),
		.io_enq_bits_addr(auto_in_a_bits_address),
		.io_enq_bits_len(~_out_arw_bits_len_T[10:3]),
		.io_enq_bits_size((auto_in_a_bits_size > 3'h2 ? 3'h3 : auto_in_a_bits_size)),
		.io_enq_bits_cache({auto_in_a_bits_user_amba_prot_writealloc, auto_in_a_bits_user_amba_prot_readalloc, auto_in_a_bits_user_amba_prot_modifiable, auto_in_a_bits_user_amba_prot_bufferable}),
		.io_enq_bits_prot({auto_in_a_bits_user_amba_prot_fetch, ~auto_in_a_bits_user_amba_prot_secure, auto_in_a_bits_user_amba_prot_privileged}),
		.io_enq_bits_echo_tl_state_size({1'h0, auto_in_a_bits_size}),
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
