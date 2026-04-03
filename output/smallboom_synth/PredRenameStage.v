module PredRenameStage (
	clock,
	reset,
	io_kill,
	io_dec_fire_0,
	io_dec_uops_0_br_type,
	io_dec_uops_0_is_sfb,
	io_dec_uops_0_ftq_idx,
	io_dec_uops_0_lrs1,
	io_dec_uops_0_lrs2,
	io_dec_uops_0_lrs1_rtype,
	io_dec_uops_0_lrs2_rtype,
	io_ren2_uops_0_pdst,
	io_ren2_uops_0_ppred,
	io_ren2_uops_0_ppred_busy,
	io_dis_fire_0,
	io_dis_ready,
	io_wakeups_0_valid,
	io_wakeups_0_bits_uop_pdst
);
	input clock;
	input reset;
	input io_kill;
	input io_dec_fire_0;
	input [3:0] io_dec_uops_0_br_type;
	input io_dec_uops_0_is_sfb;
	input [3:0] io_dec_uops_0_ftq_idx;
	input [5:0] io_dec_uops_0_lrs1;
	input [5:0] io_dec_uops_0_lrs2;
	input [1:0] io_dec_uops_0_lrs1_rtype;
	input [1:0] io_dec_uops_0_lrs2_rtype;
	output wire [5:0] io_ren2_uops_0_pdst;
	output wire [3:0] io_ren2_uops_0_ppred;
	output wire io_ren2_uops_0_ppred_busy;
	input io_dis_fire_0;
	input io_dis_ready;
	input io_wakeups_0_valid;
	input [5:0] io_wakeups_0_bits_uop_pdst;
	wire _GEN;
	wire _GEN_0;
	wire _GEN_1;
	wire _GEN_2;
	wire _GEN_3;
	wire _GEN_4;
	wire _GEN_5;
	wire _GEN_6;
	wire _GEN_7;
	wire _GEN_8;
	wire _GEN_9;
	wire _GEN_10;
	wire _GEN_11;
	wire _GEN_12;
	wire _GEN_13;
	wire [3:0] _io_dis_fire_0_3to0;
	wire [15:0] _GEN_14 = 16'h0000;
	reg r_valid;
	reg [3:0] r_uop_br_type;
	reg r_uop_is_sfb;
	reg [3:0] r_uop_ftq_idx;
	reg [5:0] r_uop_pdst;
	reg [3:0] r_uop_ppred;
	reg [5:0] r_uop_lrs1;
	reg [5:0] r_uop_lrs2;
	reg [1:0] r_uop_lrs1_rtype;
	reg [1:0] r_uop_lrs2_rtype;
	reg [3:0] ren1_current_ftq_idx;
	reg busy_table_0;
	reg busy_table_1;
	reg busy_table_2;
	reg busy_table_3;
	reg busy_table_4;
	reg busy_table_5;
	reg busy_table_6;
	reg busy_table_7;
	reg busy_table_8;
	reg busy_table_9;
	reg busy_table_10;
	reg busy_table_11;
	reg busy_table_12;
	reg busy_table_13;
	reg busy_table_14;
	reg busy_table_15;
	wire ren2_alloc_reqs_0 = (|r_uop_br_type & r_uop_is_sfb) & r_valid;
	wire [15:0] _GEN_15 = {busy_table_15, busy_table_14, busy_table_13, busy_table_12, busy_table_11, busy_table_10, busy_table_9, busy_table_8, busy_table_7, busy_table_6, busy_table_5, busy_table_4, busy_table_3, busy_table_2, busy_table_1, busy_table_0};
	wire [15:0] _GEN_16 = (io_wakeups_0_valid ? {&_io_dis_fire_0_3to0, _GEN, _GEN_0, _GEN_1, _GEN_2, _GEN_3, _GEN_4, _GEN_5, _GEN_6, _GEN_7, _GEN_8, _GEN_9, _GEN_10, _GEN_11, _GEN_12, _GEN_13} : _GEN_14);
	assign _io_dis_fire_0_3to0 = io_wakeups_0_bits_uop_pdst[3:0];
	assign _GEN_13 = _io_dis_fire_0_3to0 == 4'h0;
	assign _GEN_12 = _io_dis_fire_0_3to0 == 4'h1;
	assign _GEN_11 = _io_dis_fire_0_3to0 == 4'h2;
	assign _GEN_10 = _io_dis_fire_0_3to0 == 4'h3;
	assign _GEN_9 = _io_dis_fire_0_3to0 == 4'h4;
	assign _GEN_8 = _io_dis_fire_0_3to0 == 4'h5;
	assign _GEN_7 = _io_dis_fire_0_3to0 == 4'h6;
	assign _GEN_6 = _io_dis_fire_0_3to0 == 4'h7;
	assign _GEN_5 = _io_dis_fire_0_3to0 == 4'h8;
	assign _GEN_4 = _io_dis_fire_0_3to0 == 4'h9;
	assign _GEN_3 = _io_dis_fire_0_3to0 == 4'ha;
	assign _GEN_2 = _io_dis_fire_0_3to0 == 4'hb;
	assign _GEN_1 = _io_dis_fire_0_3to0 == 4'hc;
	assign _GEN_0 = _io_dis_fire_0_3to0 == 4'hd;
	assign _GEN = _io_dis_fire_0_3to0 == 4'he;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg _GEN_17;
		reg _GEN_18;
		_GEN_17 = io_kill | ~io_dis_ready;
		_GEN_18 = |io_dec_uops_0_br_type & io_dec_uops_0_is_sfb;
		if (reset) begin
			r_valid <= 1'h0;
			busy_table_0 <= 1'h0;
			busy_table_1 <= 1'h0;
			busy_table_2 <= 1'h0;
			busy_table_3 <= 1'h0;
			busy_table_4 <= 1'h0;
			busy_table_5 <= 1'h0;
			busy_table_6 <= 1'h0;
			busy_table_7 <= 1'h0;
			busy_table_8 <= 1'h0;
			busy_table_9 <= 1'h0;
			busy_table_10 <= 1'h0;
			busy_table_11 <= 1'h0;
			busy_table_12 <= 1'h0;
			busy_table_13 <= 1'h0;
			busy_table_14 <= 1'h0;
			busy_table_15 <= 1'h0;
		end
		else begin : sv2v_autoblock_2
			reg _GEN_19;
			reg [15:0] _GEN_20;
			reg [15:0] _GEN_21;
			_GEN_19 = ren2_alloc_reqs_0 & io_dis_fire_0;
			_GEN_21 = ~{io_wakeups_0_valid & (&_io_dis_fire_0_3to0), io_wakeups_0_valid & _GEN, io_wakeups_0_valid & _GEN_0, io_wakeups_0_valid & _GEN_1, io_wakeups_0_valid & _GEN_2, io_wakeups_0_valid & _GEN_3, io_wakeups_0_valid & _GEN_4, io_wakeups_0_valid & _GEN_5, io_wakeups_0_valid & _GEN_6, io_wakeups_0_valid & _GEN_7, io_wakeups_0_valid & _GEN_8, io_wakeups_0_valid & _GEN_9, io_wakeups_0_valid & _GEN_10, io_wakeups_0_valid & _GEN_11, io_wakeups_0_valid & _GEN_12, io_wakeups_0_valid & _GEN_13};
			_GEN_20 = {busy_table_15, busy_table_14, busy_table_13, busy_table_12, busy_table_11, busy_table_10, busy_table_9, busy_table_8, busy_table_7, busy_table_6, busy_table_5, busy_table_4, busy_table_3, busy_table_2, busy_table_1, busy_table_0} | {_GEN_19 & (&r_uop_ftq_idx), _GEN_19 & (r_uop_ftq_idx == 4'he), _GEN_19 & (r_uop_ftq_idx == 4'hd), _GEN_19 & (r_uop_ftq_idx == 4'hc), _GEN_19 & (r_uop_ftq_idx == 4'hb), _GEN_19 & (r_uop_ftq_idx == 4'ha), _GEN_19 & (r_uop_ftq_idx == 4'h9), _GEN_19 & (r_uop_ftq_idx == 4'h8), _GEN_19 & (r_uop_ftq_idx == 4'h7), _GEN_19 & (r_uop_ftq_idx == 4'h6), _GEN_19 & (r_uop_ftq_idx == 4'h5), _GEN_19 & (r_uop_ftq_idx == 4'h4), _GEN_19 & (r_uop_ftq_idx == 4'h3), _GEN_19 & (r_uop_ftq_idx == 4'h2), _GEN_19 & (r_uop_ftq_idx == 4'h1), _GEN_19 & (r_uop_ftq_idx == 4'h0)};
			r_valid <= ~io_kill & (io_dis_ready ? io_dec_fire_0 : r_valid & ~io_dis_fire_0);
			busy_table_0 <= _GEN_20[0] & _GEN_21[0];
			busy_table_1 <= _GEN_20[1] & _GEN_21[1];
			busy_table_2 <= _GEN_20[2] & _GEN_21[2];
			busy_table_3 <= _GEN_20[3] & _GEN_21[3];
			busy_table_4 <= _GEN_20[4] & _GEN_21[4];
			busy_table_5 <= _GEN_20[5] & _GEN_21[5];
			busy_table_6 <= _GEN_20[6] & _GEN_21[6];
			busy_table_7 <= _GEN_20[7] & _GEN_21[7];
			busy_table_8 <= _GEN_20[8] & _GEN_21[8];
			busy_table_9 <= _GEN_20[9] & _GEN_21[9];
			busy_table_10 <= _GEN_20[10] & _GEN_21[10];
			busy_table_11 <= _GEN_20[11] & _GEN_21[11];
			busy_table_12 <= _GEN_20[12] & _GEN_21[12];
			busy_table_13 <= _GEN_20[13] & _GEN_21[13];
			busy_table_14 <= _GEN_20[14] & _GEN_21[14];
			busy_table_15 <= _GEN_20[15] & _GEN_21[15];
		end
		if (_GEN_17)
			;
		else begin
			r_uop_br_type <= io_dec_uops_0_br_type;
			r_uop_is_sfb <= io_dec_uops_0_is_sfb;
			r_uop_ftq_idx <= io_dec_uops_0_ftq_idx;
			r_uop_pdst <= (_GEN_18 ? {2'h0, io_dec_uops_0_ftq_idx} : 6'h00);
		end
		if (io_dis_fire_0 & ren2_alloc_reqs_0)
			r_uop_ppred <= r_uop_ftq_idx;
		else if (_GEN_17)
			;
		else
			r_uop_ppred <= ren1_current_ftq_idx;
		if (_GEN_17)
			;
		else begin
			r_uop_lrs1 <= io_dec_uops_0_lrs1;
			r_uop_lrs2 <= io_dec_uops_0_lrs2;
			r_uop_lrs1_rtype <= io_dec_uops_0_lrs1_rtype;
			r_uop_lrs2_rtype <= io_dec_uops_0_lrs2_rtype;
		end
		if (_GEN_18 & io_dec_fire_0)
			ren1_current_ftq_idx <= io_dec_uops_0_ftq_idx;
	end
	assign io_ren2_uops_0_pdst = r_uop_pdst;
	assign io_ren2_uops_0_ppred = r_uop_ppred;
	assign io_ren2_uops_0_ppred_busy = (((r_uop_br_type == 4'h0) & r_uop_is_sfb) & _GEN_15[r_uop_ppred]) & ~_GEN_16[r_uop_ppred];
endmodule
