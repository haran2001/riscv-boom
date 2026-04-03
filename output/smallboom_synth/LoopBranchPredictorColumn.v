module LoopBranchPredictorColumn (
	clock,
	reset,
	io_f2_req_idx,
	io_f3_req_fire,
	io_f3_pred_in,
	io_f3_pred,
	io_f3_meta_s_cnt,
	io_update_mispredict,
	io_update_repair,
	io_update_idx,
	io_update_meta_s_cnt
);
	input clock;
	input reset;
	input [36:0] io_f2_req_idx;
	input io_f3_req_fire;
	input io_f3_pred_in;
	output wire io_f3_pred;
	output wire [9:0] io_f3_meta_s_cnt;
	input io_update_mispredict;
	input io_update_repair;
	input [36:0] io_update_idx;
	input [9:0] io_update_meta_s_cnt;
	reg doing_reset;
	reg [3:0] reset_idx;
	reg [9:0] entries_0_tag;
	reg [2:0] entries_0_conf;
	reg [2:0] entries_0_age;
	reg [9:0] entries_0_p_cnt;
	reg [9:0] entries_0_s_cnt;
	reg [9:0] entries_1_tag;
	reg [2:0] entries_1_conf;
	reg [2:0] entries_1_age;
	reg [9:0] entries_1_p_cnt;
	reg [9:0] entries_1_s_cnt;
	reg [9:0] entries_2_tag;
	reg [2:0] entries_2_conf;
	reg [2:0] entries_2_age;
	reg [9:0] entries_2_p_cnt;
	reg [9:0] entries_2_s_cnt;
	reg [9:0] entries_3_tag;
	reg [2:0] entries_3_conf;
	reg [2:0] entries_3_age;
	reg [9:0] entries_3_p_cnt;
	reg [9:0] entries_3_s_cnt;
	reg [9:0] entries_4_tag;
	reg [2:0] entries_4_conf;
	reg [2:0] entries_4_age;
	reg [9:0] entries_4_p_cnt;
	reg [9:0] entries_4_s_cnt;
	reg [9:0] entries_5_tag;
	reg [2:0] entries_5_conf;
	reg [2:0] entries_5_age;
	reg [9:0] entries_5_p_cnt;
	reg [9:0] entries_5_s_cnt;
	reg [9:0] entries_6_tag;
	reg [2:0] entries_6_conf;
	reg [2:0] entries_6_age;
	reg [9:0] entries_6_p_cnt;
	reg [9:0] entries_6_s_cnt;
	reg [9:0] entries_7_tag;
	reg [2:0] entries_7_conf;
	reg [2:0] entries_7_age;
	reg [9:0] entries_7_p_cnt;
	reg [9:0] entries_7_s_cnt;
	reg [9:0] entries_8_tag;
	reg [2:0] entries_8_conf;
	reg [2:0] entries_8_age;
	reg [9:0] entries_8_p_cnt;
	reg [9:0] entries_8_s_cnt;
	reg [9:0] entries_9_tag;
	reg [2:0] entries_9_conf;
	reg [2:0] entries_9_age;
	reg [9:0] entries_9_p_cnt;
	reg [9:0] entries_9_s_cnt;
	reg [9:0] entries_10_tag;
	reg [2:0] entries_10_conf;
	reg [2:0] entries_10_age;
	reg [9:0] entries_10_p_cnt;
	reg [9:0] entries_10_s_cnt;
	reg [9:0] entries_11_tag;
	reg [2:0] entries_11_conf;
	reg [2:0] entries_11_age;
	reg [9:0] entries_11_p_cnt;
	reg [9:0] entries_11_s_cnt;
	reg [9:0] entries_12_tag;
	reg [2:0] entries_12_conf;
	reg [2:0] entries_12_age;
	reg [9:0] entries_12_p_cnt;
	reg [9:0] entries_12_s_cnt;
	reg [9:0] entries_13_tag;
	reg [2:0] entries_13_conf;
	reg [2:0] entries_13_age;
	reg [9:0] entries_13_p_cnt;
	reg [9:0] entries_13_s_cnt;
	reg [9:0] entries_14_tag;
	reg [2:0] entries_14_conf;
	reg [2:0] entries_14_age;
	reg [9:0] entries_14_p_cnt;
	reg [9:0] entries_14_s_cnt;
	reg [9:0] entries_15_tag;
	reg [2:0] entries_15_conf;
	reg [2:0] entries_15_age;
	reg [9:0] entries_15_p_cnt;
	reg [9:0] entries_15_s_cnt;
	reg [9:0] f3_entry_tag;
	reg [2:0] f3_entry_conf;
	reg [2:0] f3_entry_age;
	reg [9:0] f3_entry_p_cnt;
	reg [9:0] f3_entry_s_cnt;
	reg [36:0] f3_scnt_REG;
	wire [9:0] f3_scnt = (io_update_repair & (io_update_idx == f3_scnt_REG) ? io_update_meta_s_cnt : f3_entry_s_cnt);
	reg [9:0] f3_tag;
	reg f4_fire;
	reg [9:0] f4_entry_tag;
	reg [2:0] f4_entry_conf;
	reg [2:0] f4_entry_age;
	reg [9:0] f4_entry_p_cnt;
	reg [9:0] f4_tag;
	reg [9:0] f4_scnt;
	reg [36:0] f4_idx_REG;
	reg [36:0] f4_idx;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg [159:0] _GEN;
		reg [47:0] _GEN_0;
		reg [47:0] _GEN_1;
		reg [159:0] _GEN_2;
		reg [159:0] _GEN_3;
		reg _GEN_4;
		reg _GEN_5;
		reg [9:0] _GEN_6;
		reg _GEN_7;
		reg [2:0] _GEN_8;
		reg [9:0] _GEN_9;
		reg [2:0] _GEN_10;
		reg [2:0] _GEN_11;
		reg [9:0] _GEN_12;
		reg [9:0] _GEN_13;
		reg tag_match;
		reg ctr_match;
		reg _GEN_14;
		reg _GEN_15;
		reg [2:0] _wentry_conf_T;
		reg _GEN_16;
		reg _GEN_17;
		reg _GEN_18;
		reg [2:0] _wentry_conf_T_2;
		reg _GEN_19;
		reg _GEN_20;
		reg _GEN_21;
		reg _GEN_22;
		reg [2:0] _wentry_age_T;
		reg _GEN_23;
		reg _GEN_24;
		reg _GEN_25;
		reg _GEN_26;
		reg _GEN_27;
		reg _GEN_28;
		reg _GEN_29;
		reg _GEN_30;
		reg _GEN_31;
		reg _GEN_32;
		reg _GEN_33;
		reg _GEN_34;
		reg _GEN_35;
		reg _GEN_36;
		reg _GEN_37;
		reg _GEN_38;
		reg _GEN_39;
		_GEN_4 = io_update_idx == io_f2_req_idx;
		_GEN = {entries_15_tag, entries_14_tag, entries_13_tag, entries_12_tag, entries_11_tag, entries_10_tag, entries_9_tag, entries_8_tag, entries_7_tag, entries_6_tag, entries_5_tag, entries_4_tag, entries_3_tag, entries_2_tag, entries_1_tag, entries_0_tag};
		_GEN_0 = {entries_15_conf, entries_14_conf, entries_13_conf, entries_12_conf, entries_11_conf, entries_10_conf, entries_9_conf, entries_8_conf, entries_7_conf, entries_6_conf, entries_5_conf, entries_4_conf, entries_3_conf, entries_2_conf, entries_1_conf, entries_0_conf};
		_GEN_1 = {entries_15_age, entries_14_age, entries_13_age, entries_12_age, entries_11_age, entries_10_age, entries_9_age, entries_8_age, entries_7_age, entries_6_age, entries_5_age, entries_4_age, entries_3_age, entries_2_age, entries_1_age, entries_0_age};
		_GEN_2 = {entries_15_p_cnt, entries_14_p_cnt, entries_13_p_cnt, entries_12_p_cnt, entries_11_p_cnt, entries_10_p_cnt, entries_9_p_cnt, entries_8_p_cnt, entries_7_p_cnt, entries_6_p_cnt, entries_5_p_cnt, entries_4_p_cnt, entries_3_p_cnt, entries_2_p_cnt, entries_1_p_cnt, entries_0_p_cnt};
		_GEN_3 = {entries_15_s_cnt, entries_14_s_cnt, entries_13_s_cnt, entries_12_s_cnt, entries_11_s_cnt, entries_10_s_cnt, entries_9_s_cnt, entries_8_s_cnt, entries_7_s_cnt, entries_6_s_cnt, entries_5_s_cnt, entries_4_s_cnt, entries_3_s_cnt, entries_2_s_cnt, entries_1_s_cnt, entries_0_s_cnt};
		_GEN_5 = (f4_scnt == f4_entry_p_cnt) & (&f4_entry_conf);
		_GEN_6 = (_GEN_5 ? 10'h000 : f4_scnt + 10'h001);
		_GEN_7 = f4_fire & (f4_entry_tag == f4_tag);
		_GEN_8 = (_GEN_5 | &f4_entry_age ? 3'h7 : f4_entry_age + 3'h1);
		_GEN_9 = _GEN[io_update_idx[3:0] * 10+:10];
		_GEN_10 = _GEN_0[io_update_idx[3:0] * 3+:3];
		_GEN_11 = _GEN_1[io_update_idx[3:0] * 3+:3];
		_GEN_12 = _GEN_2[io_update_idx[3:0] * 10+:10];
		_GEN_13 = _GEN_3[io_update_idx[3:0] * 10+:10];
		tag_match = _GEN_9 == io_update_idx[13:4];
		ctr_match = _GEN_12 == io_update_meta_s_cnt;
		_GEN_14 = io_update_mispredict & ~doing_reset;
		_GEN_15 = &_GEN_10 & tag_match;
		_wentry_conf_T = _GEN_10 - 3'h1;
		_GEN_16 = &_GEN_10 & ~tag_match;
		_GEN_17 = |_GEN_10 & tag_match;
		_GEN_18 = _GEN_17 & ctr_match;
		_wentry_conf_T_2 = _GEN_10 + 3'h1;
		_GEN_19 = _GEN_17 & ~ctr_match;
		_GEN_20 = |_GEN_10 & ~tag_match;
		_GEN_21 = _GEN_20 & ~(|_GEN_11);
		_GEN_22 = _GEN_20 & |_GEN_11;
		_wentry_age_T = _GEN_11 - 3'h1;
		_GEN_23 = ~(|_GEN_10) & tag_match;
		_GEN_24 = _GEN_23 & ctr_match;
		_GEN_25 = _GEN_23 & ~ctr_match;
		_GEN_26 = ~(|_GEN_10) & ~tag_match;
		_GEN_27 = ((((~_GEN_14 | _GEN_15) | _GEN_16) | _GEN_18) | _GEN_19) | ~(_GEN_21 | ~(((_GEN_22 | _GEN_24) | _GEN_25) | ~_GEN_26));
		_GEN_28 = _GEN_21 | ~(_GEN_22 | ~(_GEN_24 | ~(_GEN_25 | ~_GEN_26)));
		_GEN_29 = _GEN_25 | _GEN_26;
		_GEN_30 = _GEN_24 | _GEN_29;
		_GEN_31 = _GEN_19 | _GEN_21;
		_GEN_32 = _GEN_18 | _GEN_31;
		_GEN_33 = ((~_GEN_14 | _GEN_15) | _GEN_16) | _GEN_32;
		_GEN_34 = _GEN_15 | ~(_GEN_16 | ~(_GEN_32 | ~(_GEN_22 | ~_GEN_30)));
		_GEN_35 = (((~_GEN_14 | _GEN_15) | _GEN_16) | _GEN_18) | ~(_GEN_31 | ~((_GEN_22 | _GEN_24) | ~_GEN_29));
		_GEN_36 = io_update_repair & ~doing_reset;
		_GEN_37 = tag_match & ~(f4_fire & (io_update_idx == f4_idx));
		_GEN_38 = _GEN_36 & _GEN_37;
		_GEN_39 = _GEN_14 | (_GEN_36 & _GEN_37);
		if (reset) begin
			doing_reset <= 1'h1;
			reset_idx <= 4'h0;
		end
		else begin
			doing_reset <= ~(&reset_idx) & doing_reset;
			reset_idx <= reset_idx + {3'h0, doing_reset};
		end
		if (doing_reset & (reset_idx == 4'h0)) begin
			entries_0_tag <= 10'h000;
			entries_0_conf <= 3'h0;
			entries_0_age <= 3'h0;
			entries_0_p_cnt <= 10'h000;
			entries_0_s_cnt <= 10'h000;
		end
		else if (_GEN_39 & (io_update_idx[3:0] == 4'h0)) begin
			if (_GEN_27)
				entries_0_tag <= _GEN_9;
			else
				entries_0_tag <= io_update_idx[13:4];
			if (_GEN_14) begin
				if (_GEN_15)
					entries_0_conf <= _wentry_conf_T;
				else if (_GEN_16)
					entries_0_conf <= _GEN_10;
				else if (_GEN_18)
					entries_0_conf <= _wentry_conf_T_2;
				else if (_GEN_19)
					entries_0_conf <= 3'h0;
				else if (_GEN_28)
					entries_0_conf <= 3'h1;
				else
					entries_0_conf <= _GEN_10;
			end
			else
				entries_0_conf <= _GEN_10;
			if (_GEN_33)
				entries_0_age <= _GEN_11;
			else if (_GEN_22)
				entries_0_age <= _wentry_age_T;
			else if (_GEN_30)
				entries_0_age <= 3'h7;
			else
				entries_0_age <= _GEN_11;
			if (_GEN_35)
				entries_0_p_cnt <= _GEN_12;
			else
				entries_0_p_cnt <= io_update_meta_s_cnt;
			if (_GEN_14) begin
				if (_GEN_34)
					entries_0_s_cnt <= 10'h000;
				else
					entries_0_s_cnt <= _GEN_13;
			end
			else if (_GEN_38)
				entries_0_s_cnt <= io_update_meta_s_cnt;
			else
				entries_0_s_cnt <= _GEN_13;
		end
		else if (_GEN_7 & (f4_idx[3:0] == 4'h0)) begin
			entries_0_age <= _GEN_8;
			entries_0_s_cnt <= _GEN_6;
		end
		if (doing_reset & (reset_idx == 4'h1)) begin
			entries_1_tag <= 10'h000;
			entries_1_conf <= 3'h0;
			entries_1_age <= 3'h0;
			entries_1_p_cnt <= 10'h000;
			entries_1_s_cnt <= 10'h000;
		end
		else if (_GEN_39 & (io_update_idx[3:0] == 4'h1)) begin
			if (_GEN_27)
				entries_1_tag <= _GEN_9;
			else
				entries_1_tag <= io_update_idx[13:4];
			if (_GEN_14) begin
				if (_GEN_15)
					entries_1_conf <= _wentry_conf_T;
				else if (_GEN_16)
					entries_1_conf <= _GEN_10;
				else if (_GEN_18)
					entries_1_conf <= _wentry_conf_T_2;
				else if (_GEN_19)
					entries_1_conf <= 3'h0;
				else if (_GEN_28)
					entries_1_conf <= 3'h1;
				else
					entries_1_conf <= _GEN_10;
			end
			else
				entries_1_conf <= _GEN_10;
			if (_GEN_33)
				entries_1_age <= _GEN_11;
			else if (_GEN_22)
				entries_1_age <= _wentry_age_T;
			else if (_GEN_30)
				entries_1_age <= 3'h7;
			else
				entries_1_age <= _GEN_11;
			if (_GEN_35)
				entries_1_p_cnt <= _GEN_12;
			else
				entries_1_p_cnt <= io_update_meta_s_cnt;
			if (_GEN_14) begin
				if (_GEN_34)
					entries_1_s_cnt <= 10'h000;
				else
					entries_1_s_cnt <= _GEN_13;
			end
			else if (_GEN_38)
				entries_1_s_cnt <= io_update_meta_s_cnt;
			else
				entries_1_s_cnt <= _GEN_13;
		end
		else if (_GEN_7 & (f4_idx[3:0] == 4'h1)) begin
			entries_1_age <= _GEN_8;
			entries_1_s_cnt <= _GEN_6;
		end
		if (doing_reset & (reset_idx == 4'h2)) begin
			entries_2_tag <= 10'h000;
			entries_2_conf <= 3'h0;
			entries_2_age <= 3'h0;
			entries_2_p_cnt <= 10'h000;
			entries_2_s_cnt <= 10'h000;
		end
		else if (_GEN_39 & (io_update_idx[3:0] == 4'h2)) begin
			if (_GEN_27)
				entries_2_tag <= _GEN_9;
			else
				entries_2_tag <= io_update_idx[13:4];
			if (_GEN_14) begin
				if (_GEN_15)
					entries_2_conf <= _wentry_conf_T;
				else if (_GEN_16)
					entries_2_conf <= _GEN_10;
				else if (_GEN_18)
					entries_2_conf <= _wentry_conf_T_2;
				else if (_GEN_19)
					entries_2_conf <= 3'h0;
				else if (_GEN_28)
					entries_2_conf <= 3'h1;
				else
					entries_2_conf <= _GEN_10;
			end
			else
				entries_2_conf <= _GEN_10;
			if (_GEN_33)
				entries_2_age <= _GEN_11;
			else if (_GEN_22)
				entries_2_age <= _wentry_age_T;
			else if (_GEN_30)
				entries_2_age <= 3'h7;
			else
				entries_2_age <= _GEN_11;
			if (_GEN_35)
				entries_2_p_cnt <= _GEN_12;
			else
				entries_2_p_cnt <= io_update_meta_s_cnt;
			if (_GEN_14) begin
				if (_GEN_34)
					entries_2_s_cnt <= 10'h000;
				else
					entries_2_s_cnt <= _GEN_13;
			end
			else if (_GEN_38)
				entries_2_s_cnt <= io_update_meta_s_cnt;
			else
				entries_2_s_cnt <= _GEN_13;
		end
		else if (_GEN_7 & (f4_idx[3:0] == 4'h2)) begin
			entries_2_age <= _GEN_8;
			entries_2_s_cnt <= _GEN_6;
		end
		if (doing_reset & (reset_idx == 4'h3)) begin
			entries_3_tag <= 10'h000;
			entries_3_conf <= 3'h0;
			entries_3_age <= 3'h0;
			entries_3_p_cnt <= 10'h000;
			entries_3_s_cnt <= 10'h000;
		end
		else if (_GEN_39 & (io_update_idx[3:0] == 4'h3)) begin
			if (_GEN_27)
				entries_3_tag <= _GEN_9;
			else
				entries_3_tag <= io_update_idx[13:4];
			if (_GEN_14) begin
				if (_GEN_15)
					entries_3_conf <= _wentry_conf_T;
				else if (_GEN_16)
					entries_3_conf <= _GEN_10;
				else if (_GEN_18)
					entries_3_conf <= _wentry_conf_T_2;
				else if (_GEN_19)
					entries_3_conf <= 3'h0;
				else if (_GEN_28)
					entries_3_conf <= 3'h1;
				else
					entries_3_conf <= _GEN_10;
			end
			else
				entries_3_conf <= _GEN_10;
			if (_GEN_33)
				entries_3_age <= _GEN_11;
			else if (_GEN_22)
				entries_3_age <= _wentry_age_T;
			else if (_GEN_30)
				entries_3_age <= 3'h7;
			else
				entries_3_age <= _GEN_11;
			if (_GEN_35)
				entries_3_p_cnt <= _GEN_12;
			else
				entries_3_p_cnt <= io_update_meta_s_cnt;
			if (_GEN_14) begin
				if (_GEN_34)
					entries_3_s_cnt <= 10'h000;
				else
					entries_3_s_cnt <= _GEN_13;
			end
			else if (_GEN_38)
				entries_3_s_cnt <= io_update_meta_s_cnt;
			else
				entries_3_s_cnt <= _GEN_13;
		end
		else if (_GEN_7 & (f4_idx[3:0] == 4'h3)) begin
			entries_3_age <= _GEN_8;
			entries_3_s_cnt <= _GEN_6;
		end
		if (doing_reset & (reset_idx == 4'h4)) begin
			entries_4_tag <= 10'h000;
			entries_4_conf <= 3'h0;
			entries_4_age <= 3'h0;
			entries_4_p_cnt <= 10'h000;
			entries_4_s_cnt <= 10'h000;
		end
		else if (_GEN_39 & (io_update_idx[3:0] == 4'h4)) begin
			if (_GEN_27)
				entries_4_tag <= _GEN_9;
			else
				entries_4_tag <= io_update_idx[13:4];
			if (_GEN_14) begin
				if (_GEN_15)
					entries_4_conf <= _wentry_conf_T;
				else if (_GEN_16)
					entries_4_conf <= _GEN_10;
				else if (_GEN_18)
					entries_4_conf <= _wentry_conf_T_2;
				else if (_GEN_19)
					entries_4_conf <= 3'h0;
				else if (_GEN_28)
					entries_4_conf <= 3'h1;
				else
					entries_4_conf <= _GEN_10;
			end
			else
				entries_4_conf <= _GEN_10;
			if (_GEN_33)
				entries_4_age <= _GEN_11;
			else if (_GEN_22)
				entries_4_age <= _wentry_age_T;
			else if (_GEN_30)
				entries_4_age <= 3'h7;
			else
				entries_4_age <= _GEN_11;
			if (_GEN_35)
				entries_4_p_cnt <= _GEN_12;
			else
				entries_4_p_cnt <= io_update_meta_s_cnt;
			if (_GEN_14) begin
				if (_GEN_34)
					entries_4_s_cnt <= 10'h000;
				else
					entries_4_s_cnt <= _GEN_13;
			end
			else if (_GEN_38)
				entries_4_s_cnt <= io_update_meta_s_cnt;
			else
				entries_4_s_cnt <= _GEN_13;
		end
		else if (_GEN_7 & (f4_idx[3:0] == 4'h4)) begin
			entries_4_age <= _GEN_8;
			entries_4_s_cnt <= _GEN_6;
		end
		if (doing_reset & (reset_idx == 4'h5)) begin
			entries_5_tag <= 10'h000;
			entries_5_conf <= 3'h0;
			entries_5_age <= 3'h0;
			entries_5_p_cnt <= 10'h000;
			entries_5_s_cnt <= 10'h000;
		end
		else if (_GEN_39 & (io_update_idx[3:0] == 4'h5)) begin
			if (_GEN_27)
				entries_5_tag <= _GEN_9;
			else
				entries_5_tag <= io_update_idx[13:4];
			if (_GEN_14) begin
				if (_GEN_15)
					entries_5_conf <= _wentry_conf_T;
				else if (_GEN_16)
					entries_5_conf <= _GEN_10;
				else if (_GEN_18)
					entries_5_conf <= _wentry_conf_T_2;
				else if (_GEN_19)
					entries_5_conf <= 3'h0;
				else if (_GEN_28)
					entries_5_conf <= 3'h1;
				else
					entries_5_conf <= _GEN_10;
			end
			else
				entries_5_conf <= _GEN_10;
			if (_GEN_33)
				entries_5_age <= _GEN_11;
			else if (_GEN_22)
				entries_5_age <= _wentry_age_T;
			else if (_GEN_30)
				entries_5_age <= 3'h7;
			else
				entries_5_age <= _GEN_11;
			if (_GEN_35)
				entries_5_p_cnt <= _GEN_12;
			else
				entries_5_p_cnt <= io_update_meta_s_cnt;
			if (_GEN_14) begin
				if (_GEN_34)
					entries_5_s_cnt <= 10'h000;
				else
					entries_5_s_cnt <= _GEN_13;
			end
			else if (_GEN_38)
				entries_5_s_cnt <= io_update_meta_s_cnt;
			else
				entries_5_s_cnt <= _GEN_13;
		end
		else if (_GEN_7 & (f4_idx[3:0] == 4'h5)) begin
			entries_5_age <= _GEN_8;
			entries_5_s_cnt <= _GEN_6;
		end
		if (doing_reset & (reset_idx == 4'h6)) begin
			entries_6_tag <= 10'h000;
			entries_6_conf <= 3'h0;
			entries_6_age <= 3'h0;
			entries_6_p_cnt <= 10'h000;
			entries_6_s_cnt <= 10'h000;
		end
		else if (_GEN_39 & (io_update_idx[3:0] == 4'h6)) begin
			if (_GEN_27)
				entries_6_tag <= _GEN_9;
			else
				entries_6_tag <= io_update_idx[13:4];
			if (_GEN_14) begin
				if (_GEN_15)
					entries_6_conf <= _wentry_conf_T;
				else if (_GEN_16)
					entries_6_conf <= _GEN_10;
				else if (_GEN_18)
					entries_6_conf <= _wentry_conf_T_2;
				else if (_GEN_19)
					entries_6_conf <= 3'h0;
				else if (_GEN_28)
					entries_6_conf <= 3'h1;
				else
					entries_6_conf <= _GEN_10;
			end
			else
				entries_6_conf <= _GEN_10;
			if (_GEN_33)
				entries_6_age <= _GEN_11;
			else if (_GEN_22)
				entries_6_age <= _wentry_age_T;
			else if (_GEN_30)
				entries_6_age <= 3'h7;
			else
				entries_6_age <= _GEN_11;
			if (_GEN_35)
				entries_6_p_cnt <= _GEN_12;
			else
				entries_6_p_cnt <= io_update_meta_s_cnt;
			if (_GEN_14) begin
				if (_GEN_34)
					entries_6_s_cnt <= 10'h000;
				else
					entries_6_s_cnt <= _GEN_13;
			end
			else if (_GEN_38)
				entries_6_s_cnt <= io_update_meta_s_cnt;
			else
				entries_6_s_cnt <= _GEN_13;
		end
		else if (_GEN_7 & (f4_idx[3:0] == 4'h6)) begin
			entries_6_age <= _GEN_8;
			entries_6_s_cnt <= _GEN_6;
		end
		if (doing_reset & (reset_idx == 4'h7)) begin
			entries_7_tag <= 10'h000;
			entries_7_conf <= 3'h0;
			entries_7_age <= 3'h0;
			entries_7_p_cnt <= 10'h000;
			entries_7_s_cnt <= 10'h000;
		end
		else if (_GEN_39 & (io_update_idx[3:0] == 4'h7)) begin
			if (_GEN_27)
				entries_7_tag <= _GEN_9;
			else
				entries_7_tag <= io_update_idx[13:4];
			if (_GEN_14) begin
				if (_GEN_15)
					entries_7_conf <= _wentry_conf_T;
				else if (_GEN_16)
					entries_7_conf <= _GEN_10;
				else if (_GEN_18)
					entries_7_conf <= _wentry_conf_T_2;
				else if (_GEN_19)
					entries_7_conf <= 3'h0;
				else if (_GEN_28)
					entries_7_conf <= 3'h1;
				else
					entries_7_conf <= _GEN_10;
			end
			else
				entries_7_conf <= _GEN_10;
			if (_GEN_33)
				entries_7_age <= _GEN_11;
			else if (_GEN_22)
				entries_7_age <= _wentry_age_T;
			else if (_GEN_30)
				entries_7_age <= 3'h7;
			else
				entries_7_age <= _GEN_11;
			if (_GEN_35)
				entries_7_p_cnt <= _GEN_12;
			else
				entries_7_p_cnt <= io_update_meta_s_cnt;
			if (_GEN_14) begin
				if (_GEN_34)
					entries_7_s_cnt <= 10'h000;
				else
					entries_7_s_cnt <= _GEN_13;
			end
			else if (_GEN_38)
				entries_7_s_cnt <= io_update_meta_s_cnt;
			else
				entries_7_s_cnt <= _GEN_13;
		end
		else if (_GEN_7 & (f4_idx[3:0] == 4'h7)) begin
			entries_7_age <= _GEN_8;
			entries_7_s_cnt <= _GEN_6;
		end
		if (doing_reset & (reset_idx == 4'h8)) begin
			entries_8_tag <= 10'h000;
			entries_8_conf <= 3'h0;
			entries_8_age <= 3'h0;
			entries_8_p_cnt <= 10'h000;
			entries_8_s_cnt <= 10'h000;
		end
		else if (_GEN_39 & (io_update_idx[3:0] == 4'h8)) begin
			if (_GEN_27)
				entries_8_tag <= _GEN_9;
			else
				entries_8_tag <= io_update_idx[13:4];
			if (_GEN_14) begin
				if (_GEN_15)
					entries_8_conf <= _wentry_conf_T;
				else if (_GEN_16)
					entries_8_conf <= _GEN_10;
				else if (_GEN_18)
					entries_8_conf <= _wentry_conf_T_2;
				else if (_GEN_19)
					entries_8_conf <= 3'h0;
				else if (_GEN_28)
					entries_8_conf <= 3'h1;
				else
					entries_8_conf <= _GEN_10;
			end
			else
				entries_8_conf <= _GEN_10;
			if (_GEN_33)
				entries_8_age <= _GEN_11;
			else if (_GEN_22)
				entries_8_age <= _wentry_age_T;
			else if (_GEN_30)
				entries_8_age <= 3'h7;
			else
				entries_8_age <= _GEN_11;
			if (_GEN_35)
				entries_8_p_cnt <= _GEN_12;
			else
				entries_8_p_cnt <= io_update_meta_s_cnt;
			if (_GEN_14) begin
				if (_GEN_34)
					entries_8_s_cnt <= 10'h000;
				else
					entries_8_s_cnt <= _GEN_13;
			end
			else if (_GEN_38)
				entries_8_s_cnt <= io_update_meta_s_cnt;
			else
				entries_8_s_cnt <= _GEN_13;
		end
		else if (_GEN_7 & (f4_idx[3:0] == 4'h8)) begin
			entries_8_age <= _GEN_8;
			entries_8_s_cnt <= _GEN_6;
		end
		if (doing_reset & (reset_idx == 4'h9)) begin
			entries_9_tag <= 10'h000;
			entries_9_conf <= 3'h0;
			entries_9_age <= 3'h0;
			entries_9_p_cnt <= 10'h000;
			entries_9_s_cnt <= 10'h000;
		end
		else if (_GEN_39 & (io_update_idx[3:0] == 4'h9)) begin
			if (_GEN_27)
				entries_9_tag <= _GEN_9;
			else
				entries_9_tag <= io_update_idx[13:4];
			if (_GEN_14) begin
				if (_GEN_15)
					entries_9_conf <= _wentry_conf_T;
				else if (_GEN_16)
					entries_9_conf <= _GEN_10;
				else if (_GEN_18)
					entries_9_conf <= _wentry_conf_T_2;
				else if (_GEN_19)
					entries_9_conf <= 3'h0;
				else if (_GEN_28)
					entries_9_conf <= 3'h1;
				else
					entries_9_conf <= _GEN_10;
			end
			else
				entries_9_conf <= _GEN_10;
			if (_GEN_33)
				entries_9_age <= _GEN_11;
			else if (_GEN_22)
				entries_9_age <= _wentry_age_T;
			else if (_GEN_30)
				entries_9_age <= 3'h7;
			else
				entries_9_age <= _GEN_11;
			if (_GEN_35)
				entries_9_p_cnt <= _GEN_12;
			else
				entries_9_p_cnt <= io_update_meta_s_cnt;
			if (_GEN_14) begin
				if (_GEN_34)
					entries_9_s_cnt <= 10'h000;
				else
					entries_9_s_cnt <= _GEN_13;
			end
			else if (_GEN_38)
				entries_9_s_cnt <= io_update_meta_s_cnt;
			else
				entries_9_s_cnt <= _GEN_13;
		end
		else if (_GEN_7 & (f4_idx[3:0] == 4'h9)) begin
			entries_9_age <= _GEN_8;
			entries_9_s_cnt <= _GEN_6;
		end
		if (doing_reset & (reset_idx == 4'ha)) begin
			entries_10_tag <= 10'h000;
			entries_10_conf <= 3'h0;
			entries_10_age <= 3'h0;
			entries_10_p_cnt <= 10'h000;
			entries_10_s_cnt <= 10'h000;
		end
		else if (_GEN_39 & (io_update_idx[3:0] == 4'ha)) begin
			if (_GEN_27)
				entries_10_tag <= _GEN_9;
			else
				entries_10_tag <= io_update_idx[13:4];
			if (_GEN_14) begin
				if (_GEN_15)
					entries_10_conf <= _wentry_conf_T;
				else if (_GEN_16)
					entries_10_conf <= _GEN_10;
				else if (_GEN_18)
					entries_10_conf <= _wentry_conf_T_2;
				else if (_GEN_19)
					entries_10_conf <= 3'h0;
				else if (_GEN_28)
					entries_10_conf <= 3'h1;
				else
					entries_10_conf <= _GEN_10;
			end
			else
				entries_10_conf <= _GEN_10;
			if (_GEN_33)
				entries_10_age <= _GEN_11;
			else if (_GEN_22)
				entries_10_age <= _wentry_age_T;
			else if (_GEN_30)
				entries_10_age <= 3'h7;
			else
				entries_10_age <= _GEN_11;
			if (_GEN_35)
				entries_10_p_cnt <= _GEN_12;
			else
				entries_10_p_cnt <= io_update_meta_s_cnt;
			if (_GEN_14) begin
				if (_GEN_34)
					entries_10_s_cnt <= 10'h000;
				else
					entries_10_s_cnt <= _GEN_13;
			end
			else if (_GEN_38)
				entries_10_s_cnt <= io_update_meta_s_cnt;
			else
				entries_10_s_cnt <= _GEN_13;
		end
		else if (_GEN_7 & (f4_idx[3:0] == 4'ha)) begin
			entries_10_age <= _GEN_8;
			entries_10_s_cnt <= _GEN_6;
		end
		if (doing_reset & (reset_idx == 4'hb)) begin
			entries_11_tag <= 10'h000;
			entries_11_conf <= 3'h0;
			entries_11_age <= 3'h0;
			entries_11_p_cnt <= 10'h000;
			entries_11_s_cnt <= 10'h000;
		end
		else if (_GEN_39 & (io_update_idx[3:0] == 4'hb)) begin
			if (_GEN_27)
				entries_11_tag <= _GEN_9;
			else
				entries_11_tag <= io_update_idx[13:4];
			if (_GEN_14) begin
				if (_GEN_15)
					entries_11_conf <= _wentry_conf_T;
				else if (_GEN_16)
					entries_11_conf <= _GEN_10;
				else if (_GEN_18)
					entries_11_conf <= _wentry_conf_T_2;
				else if (_GEN_19)
					entries_11_conf <= 3'h0;
				else if (_GEN_28)
					entries_11_conf <= 3'h1;
				else
					entries_11_conf <= _GEN_10;
			end
			else
				entries_11_conf <= _GEN_10;
			if (_GEN_33)
				entries_11_age <= _GEN_11;
			else if (_GEN_22)
				entries_11_age <= _wentry_age_T;
			else if (_GEN_30)
				entries_11_age <= 3'h7;
			else
				entries_11_age <= _GEN_11;
			if (_GEN_35)
				entries_11_p_cnt <= _GEN_12;
			else
				entries_11_p_cnt <= io_update_meta_s_cnt;
			if (_GEN_14) begin
				if (_GEN_34)
					entries_11_s_cnt <= 10'h000;
				else
					entries_11_s_cnt <= _GEN_13;
			end
			else if (_GEN_38)
				entries_11_s_cnt <= io_update_meta_s_cnt;
			else
				entries_11_s_cnt <= _GEN_13;
		end
		else if (_GEN_7 & (f4_idx[3:0] == 4'hb)) begin
			entries_11_age <= _GEN_8;
			entries_11_s_cnt <= _GEN_6;
		end
		if (doing_reset & (reset_idx == 4'hc)) begin
			entries_12_tag <= 10'h000;
			entries_12_conf <= 3'h0;
			entries_12_age <= 3'h0;
			entries_12_p_cnt <= 10'h000;
			entries_12_s_cnt <= 10'h000;
		end
		else if (_GEN_39 & (io_update_idx[3:0] == 4'hc)) begin
			if (_GEN_27)
				entries_12_tag <= _GEN_9;
			else
				entries_12_tag <= io_update_idx[13:4];
			if (_GEN_14) begin
				if (_GEN_15)
					entries_12_conf <= _wentry_conf_T;
				else if (_GEN_16)
					entries_12_conf <= _GEN_10;
				else if (_GEN_18)
					entries_12_conf <= _wentry_conf_T_2;
				else if (_GEN_19)
					entries_12_conf <= 3'h0;
				else if (_GEN_28)
					entries_12_conf <= 3'h1;
				else
					entries_12_conf <= _GEN_10;
			end
			else
				entries_12_conf <= _GEN_10;
			if (_GEN_33)
				entries_12_age <= _GEN_11;
			else if (_GEN_22)
				entries_12_age <= _wentry_age_T;
			else if (_GEN_30)
				entries_12_age <= 3'h7;
			else
				entries_12_age <= _GEN_11;
			if (_GEN_35)
				entries_12_p_cnt <= _GEN_12;
			else
				entries_12_p_cnt <= io_update_meta_s_cnt;
			if (_GEN_14) begin
				if (_GEN_34)
					entries_12_s_cnt <= 10'h000;
				else
					entries_12_s_cnt <= _GEN_13;
			end
			else if (_GEN_38)
				entries_12_s_cnt <= io_update_meta_s_cnt;
			else
				entries_12_s_cnt <= _GEN_13;
		end
		else if (_GEN_7 & (f4_idx[3:0] == 4'hc)) begin
			entries_12_age <= _GEN_8;
			entries_12_s_cnt <= _GEN_6;
		end
		if (doing_reset & (reset_idx == 4'hd)) begin
			entries_13_tag <= 10'h000;
			entries_13_conf <= 3'h0;
			entries_13_age <= 3'h0;
			entries_13_p_cnt <= 10'h000;
			entries_13_s_cnt <= 10'h000;
		end
		else if (_GEN_39 & (io_update_idx[3:0] == 4'hd)) begin
			if (_GEN_27)
				entries_13_tag <= _GEN_9;
			else
				entries_13_tag <= io_update_idx[13:4];
			if (_GEN_14) begin
				if (_GEN_15)
					entries_13_conf <= _wentry_conf_T;
				else if (_GEN_16)
					entries_13_conf <= _GEN_10;
				else if (_GEN_18)
					entries_13_conf <= _wentry_conf_T_2;
				else if (_GEN_19)
					entries_13_conf <= 3'h0;
				else if (_GEN_28)
					entries_13_conf <= 3'h1;
				else
					entries_13_conf <= _GEN_10;
			end
			else
				entries_13_conf <= _GEN_10;
			if (_GEN_33)
				entries_13_age <= _GEN_11;
			else if (_GEN_22)
				entries_13_age <= _wentry_age_T;
			else if (_GEN_30)
				entries_13_age <= 3'h7;
			else
				entries_13_age <= _GEN_11;
			if (_GEN_35)
				entries_13_p_cnt <= _GEN_12;
			else
				entries_13_p_cnt <= io_update_meta_s_cnt;
			if (_GEN_14) begin
				if (_GEN_34)
					entries_13_s_cnt <= 10'h000;
				else
					entries_13_s_cnt <= _GEN_13;
			end
			else if (_GEN_38)
				entries_13_s_cnt <= io_update_meta_s_cnt;
			else
				entries_13_s_cnt <= _GEN_13;
		end
		else if (_GEN_7 & (f4_idx[3:0] == 4'hd)) begin
			entries_13_age <= _GEN_8;
			entries_13_s_cnt <= _GEN_6;
		end
		if (doing_reset & (reset_idx == 4'he)) begin
			entries_14_tag <= 10'h000;
			entries_14_conf <= 3'h0;
			entries_14_age <= 3'h0;
			entries_14_p_cnt <= 10'h000;
			entries_14_s_cnt <= 10'h000;
		end
		else if (_GEN_39 & (io_update_idx[3:0] == 4'he)) begin
			if (_GEN_27)
				entries_14_tag <= _GEN_9;
			else
				entries_14_tag <= io_update_idx[13:4];
			if (_GEN_14) begin
				if (_GEN_15)
					entries_14_conf <= _wentry_conf_T;
				else if (_GEN_16)
					entries_14_conf <= _GEN_10;
				else if (_GEN_18)
					entries_14_conf <= _wentry_conf_T_2;
				else if (_GEN_19)
					entries_14_conf <= 3'h0;
				else if (_GEN_28)
					entries_14_conf <= 3'h1;
				else
					entries_14_conf <= _GEN_10;
			end
			else
				entries_14_conf <= _GEN_10;
			if (_GEN_33)
				entries_14_age <= _GEN_11;
			else if (_GEN_22)
				entries_14_age <= _wentry_age_T;
			else if (_GEN_30)
				entries_14_age <= 3'h7;
			else
				entries_14_age <= _GEN_11;
			if (_GEN_35)
				entries_14_p_cnt <= _GEN_12;
			else
				entries_14_p_cnt <= io_update_meta_s_cnt;
			if (_GEN_14) begin
				if (_GEN_34)
					entries_14_s_cnt <= 10'h000;
				else
					entries_14_s_cnt <= _GEN_13;
			end
			else if (_GEN_38)
				entries_14_s_cnt <= io_update_meta_s_cnt;
			else
				entries_14_s_cnt <= _GEN_13;
		end
		else if (_GEN_7 & (f4_idx[3:0] == 4'he)) begin
			entries_14_age <= _GEN_8;
			entries_14_s_cnt <= _GEN_6;
		end
		if (doing_reset & (&reset_idx)) begin
			entries_15_tag <= 10'h000;
			entries_15_conf <= 3'h0;
			entries_15_age <= 3'h0;
			entries_15_p_cnt <= 10'h000;
			entries_15_s_cnt <= 10'h000;
		end
		else if (_GEN_39 & (&io_update_idx[3:0])) begin
			if (_GEN_27)
				entries_15_tag <= _GEN_9;
			else
				entries_15_tag <= io_update_idx[13:4];
			if (_GEN_14) begin
				if (_GEN_15)
					entries_15_conf <= _wentry_conf_T;
				else if (_GEN_16)
					entries_15_conf <= _GEN_10;
				else if (_GEN_18)
					entries_15_conf <= _wentry_conf_T_2;
				else if (_GEN_19)
					entries_15_conf <= 3'h0;
				else if (_GEN_28)
					entries_15_conf <= 3'h1;
				else
					entries_15_conf <= _GEN_10;
			end
			else
				entries_15_conf <= _GEN_10;
			if (_GEN_33)
				entries_15_age <= _GEN_11;
			else if (_GEN_22)
				entries_15_age <= _wentry_age_T;
			else if (_GEN_30)
				entries_15_age <= 3'h7;
			else
				entries_15_age <= _GEN_11;
			if (_GEN_35)
				entries_15_p_cnt <= _GEN_12;
			else
				entries_15_p_cnt <= io_update_meta_s_cnt;
			if (_GEN_14) begin
				if (_GEN_34)
					entries_15_s_cnt <= 10'h000;
				else
					entries_15_s_cnt <= _GEN_13;
			end
			else if (_GEN_38)
				entries_15_s_cnt <= io_update_meta_s_cnt;
			else
				entries_15_s_cnt <= _GEN_13;
		end
		else if (_GEN_7 & (&f4_idx[3:0])) begin
			entries_15_age <= _GEN_8;
			entries_15_s_cnt <= _GEN_6;
		end
		f3_entry_tag <= _GEN[io_f2_req_idx[3:0] * 10+:10];
		f3_entry_conf <= _GEN_0[io_f2_req_idx[3:0] * 3+:3];
		f3_entry_age <= _GEN_1[io_f2_req_idx[3:0] * 3+:3];
		f3_entry_p_cnt <= _GEN_2[io_f2_req_idx[3:0] * 10+:10];
		f3_entry_s_cnt <= (io_update_repair & _GEN_4 ? io_update_meta_s_cnt : (io_update_mispredict & _GEN_4 ? 10'h000 : _GEN_3[io_f2_req_idx[3:0] * 10+:10]));
		f3_scnt_REG <= io_f2_req_idx;
		f3_tag <= io_f2_req_idx[13:4];
		f4_fire <= io_f3_req_fire;
		f4_entry_tag <= f3_entry_tag;
		f4_entry_conf <= f3_entry_conf;
		f4_entry_age <= f3_entry_age;
		f4_entry_p_cnt <= f3_entry_p_cnt;
		f4_tag <= f3_tag;
		f4_scnt <= f3_scnt;
		f4_idx_REG <= io_f2_req_idx;
		f4_idx <= f4_idx_REG;
	end
	assign io_f3_pred = (((f3_entry_tag == f3_tag) & (f3_scnt == f3_entry_p_cnt)) & (&f3_entry_conf)) ^ io_f3_pred_in;
	assign io_f3_meta_s_cnt = f3_scnt;
endmodule
