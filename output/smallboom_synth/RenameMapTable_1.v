module RenameMapTable_1 (
	clock,
	reset,
	io_map_reqs_0_lrs1,
	io_map_reqs_0_lrs2,
	io_map_reqs_0_lrs3,
	io_map_reqs_0_ldst,
	io_map_resps_0_prs1,
	io_map_resps_0_prs2,
	io_map_resps_0_prs3,
	io_map_resps_0_stale_pdst,
	io_remap_reqs_0_ldst,
	io_remap_reqs_0_pdst,
	io_remap_reqs_0_valid,
	io_com_remap_reqs_0_ldst,
	io_com_remap_reqs_0_pdst,
	io_com_remap_reqs_0_valid,
	io_ren_br_tags_1_valid,
	io_ren_br_tags_1_bits,
	io_brupdate_b2_uop_br_tag,
	io_brupdate_b2_mispredict,
	io_rollback
);
	input clock;
	input reset;
	input [5:0] io_map_reqs_0_lrs1;
	input [5:0] io_map_reqs_0_lrs2;
	input [5:0] io_map_reqs_0_lrs3;
	input [5:0] io_map_reqs_0_ldst;
	output wire [5:0] io_map_resps_0_prs1;
	output wire [5:0] io_map_resps_0_prs2;
	output wire [5:0] io_map_resps_0_prs3;
	output wire [5:0] io_map_resps_0_stale_pdst;
	input [5:0] io_remap_reqs_0_ldst;
	input [5:0] io_remap_reqs_0_pdst;
	input io_remap_reqs_0_valid;
	input [5:0] io_com_remap_reqs_0_ldst;
	input [5:0] io_com_remap_reqs_0_pdst;
	input io_com_remap_reqs_0_valid;
	input io_ren_br_tags_1_valid;
	input [2:0] io_ren_br_tags_1_bits;
	input [2:0] io_brupdate_b2_uop_br_tag;
	input io_brupdate_b2_mispredict;
	input io_rollback;
	reg [5:0] map_table_0;
	reg [5:0] map_table_1;
	reg [5:0] map_table_2;
	reg [5:0] map_table_3;
	reg [5:0] map_table_4;
	reg [5:0] map_table_5;
	reg [5:0] map_table_6;
	reg [5:0] map_table_7;
	reg [5:0] map_table_8;
	reg [5:0] map_table_9;
	reg [5:0] map_table_10;
	reg [5:0] map_table_11;
	reg [5:0] map_table_12;
	reg [5:0] map_table_13;
	reg [5:0] map_table_14;
	reg [5:0] map_table_15;
	reg [5:0] map_table_16;
	reg [5:0] map_table_17;
	reg [5:0] map_table_18;
	reg [5:0] map_table_19;
	reg [5:0] map_table_20;
	reg [5:0] map_table_21;
	reg [5:0] map_table_22;
	reg [5:0] map_table_23;
	reg [5:0] map_table_24;
	reg [5:0] map_table_25;
	reg [5:0] map_table_26;
	reg [5:0] map_table_27;
	reg [5:0] map_table_28;
	reg [5:0] map_table_29;
	reg [5:0] map_table_30;
	reg [5:0] map_table_31;
	reg [5:0] com_map_table_0;
	reg [5:0] com_map_table_1;
	reg [5:0] com_map_table_2;
	reg [5:0] com_map_table_3;
	reg [5:0] com_map_table_4;
	reg [5:0] com_map_table_5;
	reg [5:0] com_map_table_6;
	reg [5:0] com_map_table_7;
	reg [5:0] com_map_table_8;
	reg [5:0] com_map_table_9;
	reg [5:0] com_map_table_10;
	reg [5:0] com_map_table_11;
	reg [5:0] com_map_table_12;
	reg [5:0] com_map_table_13;
	reg [5:0] com_map_table_14;
	reg [5:0] com_map_table_15;
	reg [5:0] com_map_table_16;
	reg [5:0] com_map_table_17;
	reg [5:0] com_map_table_18;
	reg [5:0] com_map_table_19;
	reg [5:0] com_map_table_20;
	reg [5:0] com_map_table_21;
	reg [5:0] com_map_table_22;
	reg [5:0] com_map_table_23;
	reg [5:0] com_map_table_24;
	reg [5:0] com_map_table_25;
	reg [5:0] com_map_table_26;
	reg [5:0] com_map_table_27;
	reg [5:0] com_map_table_28;
	reg [5:0] com_map_table_29;
	reg [5:0] com_map_table_30;
	reg [5:0] com_map_table_31;
	reg [5:0] br_snapshots_0_0;
	reg [5:0] br_snapshots_0_1;
	reg [5:0] br_snapshots_0_2;
	reg [5:0] br_snapshots_0_3;
	reg [5:0] br_snapshots_0_4;
	reg [5:0] br_snapshots_0_5;
	reg [5:0] br_snapshots_0_6;
	reg [5:0] br_snapshots_0_7;
	reg [5:0] br_snapshots_0_8;
	reg [5:0] br_snapshots_0_9;
	reg [5:0] br_snapshots_0_10;
	reg [5:0] br_snapshots_0_11;
	reg [5:0] br_snapshots_0_12;
	reg [5:0] br_snapshots_0_13;
	reg [5:0] br_snapshots_0_14;
	reg [5:0] br_snapshots_0_15;
	reg [5:0] br_snapshots_0_16;
	reg [5:0] br_snapshots_0_17;
	reg [5:0] br_snapshots_0_18;
	reg [5:0] br_snapshots_0_19;
	reg [5:0] br_snapshots_0_20;
	reg [5:0] br_snapshots_0_21;
	reg [5:0] br_snapshots_0_22;
	reg [5:0] br_snapshots_0_23;
	reg [5:0] br_snapshots_0_24;
	reg [5:0] br_snapshots_0_25;
	reg [5:0] br_snapshots_0_26;
	reg [5:0] br_snapshots_0_27;
	reg [5:0] br_snapshots_0_28;
	reg [5:0] br_snapshots_0_29;
	reg [5:0] br_snapshots_0_30;
	reg [5:0] br_snapshots_0_31;
	reg [5:0] br_snapshots_1_0;
	reg [5:0] br_snapshots_1_1;
	reg [5:0] br_snapshots_1_2;
	reg [5:0] br_snapshots_1_3;
	reg [5:0] br_snapshots_1_4;
	reg [5:0] br_snapshots_1_5;
	reg [5:0] br_snapshots_1_6;
	reg [5:0] br_snapshots_1_7;
	reg [5:0] br_snapshots_1_8;
	reg [5:0] br_snapshots_1_9;
	reg [5:0] br_snapshots_1_10;
	reg [5:0] br_snapshots_1_11;
	reg [5:0] br_snapshots_1_12;
	reg [5:0] br_snapshots_1_13;
	reg [5:0] br_snapshots_1_14;
	reg [5:0] br_snapshots_1_15;
	reg [5:0] br_snapshots_1_16;
	reg [5:0] br_snapshots_1_17;
	reg [5:0] br_snapshots_1_18;
	reg [5:0] br_snapshots_1_19;
	reg [5:0] br_snapshots_1_20;
	reg [5:0] br_snapshots_1_21;
	reg [5:0] br_snapshots_1_22;
	reg [5:0] br_snapshots_1_23;
	reg [5:0] br_snapshots_1_24;
	reg [5:0] br_snapshots_1_25;
	reg [5:0] br_snapshots_1_26;
	reg [5:0] br_snapshots_1_27;
	reg [5:0] br_snapshots_1_28;
	reg [5:0] br_snapshots_1_29;
	reg [5:0] br_snapshots_1_30;
	reg [5:0] br_snapshots_1_31;
	reg [5:0] br_snapshots_2_0;
	reg [5:0] br_snapshots_2_1;
	reg [5:0] br_snapshots_2_2;
	reg [5:0] br_snapshots_2_3;
	reg [5:0] br_snapshots_2_4;
	reg [5:0] br_snapshots_2_5;
	reg [5:0] br_snapshots_2_6;
	reg [5:0] br_snapshots_2_7;
	reg [5:0] br_snapshots_2_8;
	reg [5:0] br_snapshots_2_9;
	reg [5:0] br_snapshots_2_10;
	reg [5:0] br_snapshots_2_11;
	reg [5:0] br_snapshots_2_12;
	reg [5:0] br_snapshots_2_13;
	reg [5:0] br_snapshots_2_14;
	reg [5:0] br_snapshots_2_15;
	reg [5:0] br_snapshots_2_16;
	reg [5:0] br_snapshots_2_17;
	reg [5:0] br_snapshots_2_18;
	reg [5:0] br_snapshots_2_19;
	reg [5:0] br_snapshots_2_20;
	reg [5:0] br_snapshots_2_21;
	reg [5:0] br_snapshots_2_22;
	reg [5:0] br_snapshots_2_23;
	reg [5:0] br_snapshots_2_24;
	reg [5:0] br_snapshots_2_25;
	reg [5:0] br_snapshots_2_26;
	reg [5:0] br_snapshots_2_27;
	reg [5:0] br_snapshots_2_28;
	reg [5:0] br_snapshots_2_29;
	reg [5:0] br_snapshots_2_30;
	reg [5:0] br_snapshots_2_31;
	reg [5:0] br_snapshots_3_0;
	reg [5:0] br_snapshots_3_1;
	reg [5:0] br_snapshots_3_2;
	reg [5:0] br_snapshots_3_3;
	reg [5:0] br_snapshots_3_4;
	reg [5:0] br_snapshots_3_5;
	reg [5:0] br_snapshots_3_6;
	reg [5:0] br_snapshots_3_7;
	reg [5:0] br_snapshots_3_8;
	reg [5:0] br_snapshots_3_9;
	reg [5:0] br_snapshots_3_10;
	reg [5:0] br_snapshots_3_11;
	reg [5:0] br_snapshots_3_12;
	reg [5:0] br_snapshots_3_13;
	reg [5:0] br_snapshots_3_14;
	reg [5:0] br_snapshots_3_15;
	reg [5:0] br_snapshots_3_16;
	reg [5:0] br_snapshots_3_17;
	reg [5:0] br_snapshots_3_18;
	reg [5:0] br_snapshots_3_19;
	reg [5:0] br_snapshots_3_20;
	reg [5:0] br_snapshots_3_21;
	reg [5:0] br_snapshots_3_22;
	reg [5:0] br_snapshots_3_23;
	reg [5:0] br_snapshots_3_24;
	reg [5:0] br_snapshots_3_25;
	reg [5:0] br_snapshots_3_26;
	reg [5:0] br_snapshots_3_27;
	reg [5:0] br_snapshots_3_28;
	reg [5:0] br_snapshots_3_29;
	reg [5:0] br_snapshots_3_30;
	reg [5:0] br_snapshots_3_31;
	reg [5:0] br_snapshots_4_0;
	reg [5:0] br_snapshots_4_1;
	reg [5:0] br_snapshots_4_2;
	reg [5:0] br_snapshots_4_3;
	reg [5:0] br_snapshots_4_4;
	reg [5:0] br_snapshots_4_5;
	reg [5:0] br_snapshots_4_6;
	reg [5:0] br_snapshots_4_7;
	reg [5:0] br_snapshots_4_8;
	reg [5:0] br_snapshots_4_9;
	reg [5:0] br_snapshots_4_10;
	reg [5:0] br_snapshots_4_11;
	reg [5:0] br_snapshots_4_12;
	reg [5:0] br_snapshots_4_13;
	reg [5:0] br_snapshots_4_14;
	reg [5:0] br_snapshots_4_15;
	reg [5:0] br_snapshots_4_16;
	reg [5:0] br_snapshots_4_17;
	reg [5:0] br_snapshots_4_18;
	reg [5:0] br_snapshots_4_19;
	reg [5:0] br_snapshots_4_20;
	reg [5:0] br_snapshots_4_21;
	reg [5:0] br_snapshots_4_22;
	reg [5:0] br_snapshots_4_23;
	reg [5:0] br_snapshots_4_24;
	reg [5:0] br_snapshots_4_25;
	reg [5:0] br_snapshots_4_26;
	reg [5:0] br_snapshots_4_27;
	reg [5:0] br_snapshots_4_28;
	reg [5:0] br_snapshots_4_29;
	reg [5:0] br_snapshots_4_30;
	reg [5:0] br_snapshots_4_31;
	reg [5:0] br_snapshots_5_0;
	reg [5:0] br_snapshots_5_1;
	reg [5:0] br_snapshots_5_2;
	reg [5:0] br_snapshots_5_3;
	reg [5:0] br_snapshots_5_4;
	reg [5:0] br_snapshots_5_5;
	reg [5:0] br_snapshots_5_6;
	reg [5:0] br_snapshots_5_7;
	reg [5:0] br_snapshots_5_8;
	reg [5:0] br_snapshots_5_9;
	reg [5:0] br_snapshots_5_10;
	reg [5:0] br_snapshots_5_11;
	reg [5:0] br_snapshots_5_12;
	reg [5:0] br_snapshots_5_13;
	reg [5:0] br_snapshots_5_14;
	reg [5:0] br_snapshots_5_15;
	reg [5:0] br_snapshots_5_16;
	reg [5:0] br_snapshots_5_17;
	reg [5:0] br_snapshots_5_18;
	reg [5:0] br_snapshots_5_19;
	reg [5:0] br_snapshots_5_20;
	reg [5:0] br_snapshots_5_21;
	reg [5:0] br_snapshots_5_22;
	reg [5:0] br_snapshots_5_23;
	reg [5:0] br_snapshots_5_24;
	reg [5:0] br_snapshots_5_25;
	reg [5:0] br_snapshots_5_26;
	reg [5:0] br_snapshots_5_27;
	reg [5:0] br_snapshots_5_28;
	reg [5:0] br_snapshots_5_29;
	reg [5:0] br_snapshots_5_30;
	reg [5:0] br_snapshots_5_31;
	reg [5:0] br_snapshots_6_0;
	reg [5:0] br_snapshots_6_1;
	reg [5:0] br_snapshots_6_2;
	reg [5:0] br_snapshots_6_3;
	reg [5:0] br_snapshots_6_4;
	reg [5:0] br_snapshots_6_5;
	reg [5:0] br_snapshots_6_6;
	reg [5:0] br_snapshots_6_7;
	reg [5:0] br_snapshots_6_8;
	reg [5:0] br_snapshots_6_9;
	reg [5:0] br_snapshots_6_10;
	reg [5:0] br_snapshots_6_11;
	reg [5:0] br_snapshots_6_12;
	reg [5:0] br_snapshots_6_13;
	reg [5:0] br_snapshots_6_14;
	reg [5:0] br_snapshots_6_15;
	reg [5:0] br_snapshots_6_16;
	reg [5:0] br_snapshots_6_17;
	reg [5:0] br_snapshots_6_18;
	reg [5:0] br_snapshots_6_19;
	reg [5:0] br_snapshots_6_20;
	reg [5:0] br_snapshots_6_21;
	reg [5:0] br_snapshots_6_22;
	reg [5:0] br_snapshots_6_23;
	reg [5:0] br_snapshots_6_24;
	reg [5:0] br_snapshots_6_25;
	reg [5:0] br_snapshots_6_26;
	reg [5:0] br_snapshots_6_27;
	reg [5:0] br_snapshots_6_28;
	reg [5:0] br_snapshots_6_29;
	reg [5:0] br_snapshots_6_30;
	reg [5:0] br_snapshots_6_31;
	reg [5:0] br_snapshots_7_0;
	reg [5:0] br_snapshots_7_1;
	reg [5:0] br_snapshots_7_2;
	reg [5:0] br_snapshots_7_3;
	reg [5:0] br_snapshots_7_4;
	reg [5:0] br_snapshots_7_5;
	reg [5:0] br_snapshots_7_6;
	reg [5:0] br_snapshots_7_7;
	reg [5:0] br_snapshots_7_8;
	reg [5:0] br_snapshots_7_9;
	reg [5:0] br_snapshots_7_10;
	reg [5:0] br_snapshots_7_11;
	reg [5:0] br_snapshots_7_12;
	reg [5:0] br_snapshots_7_13;
	reg [5:0] br_snapshots_7_14;
	reg [5:0] br_snapshots_7_15;
	reg [5:0] br_snapshots_7_16;
	reg [5:0] br_snapshots_7_17;
	reg [5:0] br_snapshots_7_18;
	reg [5:0] br_snapshots_7_19;
	reg [5:0] br_snapshots_7_20;
	reg [5:0] br_snapshots_7_21;
	reg [5:0] br_snapshots_7_22;
	reg [5:0] br_snapshots_7_23;
	reg [5:0] br_snapshots_7_24;
	reg [5:0] br_snapshots_7_25;
	reg [5:0] br_snapshots_7_26;
	reg [5:0] br_snapshots_7_27;
	reg [5:0] br_snapshots_7_28;
	reg [5:0] br_snapshots_7_29;
	reg [5:0] br_snapshots_7_30;
	reg [5:0] br_snapshots_7_31;
	wire [191:0] _GEN = {map_table_31, map_table_30, map_table_29, map_table_28, map_table_27, map_table_26, map_table_25, map_table_24, map_table_23, map_table_22, map_table_21, map_table_20, map_table_19, map_table_18, map_table_17, map_table_16, map_table_15, map_table_14, map_table_13, map_table_12, map_table_11, map_table_10, map_table_9, map_table_8, map_table_7, map_table_6, map_table_5, map_table_4, map_table_3, map_table_2, map_table_1, map_table_0};
	always @(posedge clock) begin : sv2v_autoblock_1
		reg [63:0] _remap_ldsts_oh_T;
		reg [31:0] _GEN_0;
		reg [5:0] remapped_row_1;
		reg [5:0] remap_table_1_1;
		reg [5:0] remap_table_1_2;
		reg [5:0] remap_table_1_3;
		reg [5:0] remap_table_1_4;
		reg [5:0] remap_table_1_5;
		reg [5:0] remap_table_1_6;
		reg [5:0] remap_table_1_7;
		reg [5:0] remap_table_1_8;
		reg [5:0] remap_table_1_9;
		reg [5:0] remap_table_1_10;
		reg [5:0] remap_table_1_11;
		reg [5:0] remap_table_1_12;
		reg [5:0] remap_table_1_13;
		reg [5:0] remap_table_1_14;
		reg [5:0] remap_table_1_15;
		reg [5:0] remap_table_1_16;
		reg [5:0] remap_table_1_17;
		reg [5:0] remap_table_1_18;
		reg [5:0] remap_table_1_19;
		reg [5:0] remap_table_1_20;
		reg [5:0] remap_table_1_21;
		reg [5:0] remap_table_1_22;
		reg [5:0] remap_table_1_23;
		reg [5:0] remap_table_1_24;
		reg [5:0] remap_table_1_25;
		reg [5:0] remap_table_1_26;
		reg [5:0] remap_table_1_27;
		reg [5:0] remap_table_1_28;
		reg [5:0] remap_table_1_29;
		reg [5:0] remap_table_1_30;
		reg [5:0] remap_table_1_31;
		_remap_ldsts_oh_T = 64'h0000000000000001 << io_remap_reqs_0_ldst;
		_GEN_0 = _remap_ldsts_oh_T[31:0] & {32 {io_remap_reqs_0_valid}};
		remapped_row_1 = (_GEN_0[0] ? io_remap_reqs_0_pdst : map_table_0);
		remap_table_1_1 = (_GEN_0[1] ? io_remap_reqs_0_pdst : map_table_1);
		remap_table_1_2 = (_GEN_0[2] ? io_remap_reqs_0_pdst : map_table_2);
		remap_table_1_3 = (_GEN_0[3] ? io_remap_reqs_0_pdst : map_table_3);
		remap_table_1_4 = (_GEN_0[4] ? io_remap_reqs_0_pdst : map_table_4);
		remap_table_1_5 = (_GEN_0[5] ? io_remap_reqs_0_pdst : map_table_5);
		remap_table_1_6 = (_GEN_0[6] ? io_remap_reqs_0_pdst : map_table_6);
		remap_table_1_7 = (_GEN_0[7] ? io_remap_reqs_0_pdst : map_table_7);
		remap_table_1_8 = (_GEN_0[8] ? io_remap_reqs_0_pdst : map_table_8);
		remap_table_1_9 = (_GEN_0[9] ? io_remap_reqs_0_pdst : map_table_9);
		remap_table_1_10 = (_GEN_0[10] ? io_remap_reqs_0_pdst : map_table_10);
		remap_table_1_11 = (_GEN_0[11] ? io_remap_reqs_0_pdst : map_table_11);
		remap_table_1_12 = (_GEN_0[12] ? io_remap_reqs_0_pdst : map_table_12);
		remap_table_1_13 = (_GEN_0[13] ? io_remap_reqs_0_pdst : map_table_13);
		remap_table_1_14 = (_GEN_0[14] ? io_remap_reqs_0_pdst : map_table_14);
		remap_table_1_15 = (_GEN_0[15] ? io_remap_reqs_0_pdst : map_table_15);
		remap_table_1_16 = (_GEN_0[16] ? io_remap_reqs_0_pdst : map_table_16);
		remap_table_1_17 = (_GEN_0[17] ? io_remap_reqs_0_pdst : map_table_17);
		remap_table_1_18 = (_GEN_0[18] ? io_remap_reqs_0_pdst : map_table_18);
		remap_table_1_19 = (_GEN_0[19] ? io_remap_reqs_0_pdst : map_table_19);
		remap_table_1_20 = (_GEN_0[20] ? io_remap_reqs_0_pdst : map_table_20);
		remap_table_1_21 = (_GEN_0[21] ? io_remap_reqs_0_pdst : map_table_21);
		remap_table_1_22 = (_GEN_0[22] ? io_remap_reqs_0_pdst : map_table_22);
		remap_table_1_23 = (_GEN_0[23] ? io_remap_reqs_0_pdst : map_table_23);
		remap_table_1_24 = (_GEN_0[24] ? io_remap_reqs_0_pdst : map_table_24);
		remap_table_1_25 = (_GEN_0[25] ? io_remap_reqs_0_pdst : map_table_25);
		remap_table_1_26 = (_GEN_0[26] ? io_remap_reqs_0_pdst : map_table_26);
		remap_table_1_27 = (_GEN_0[27] ? io_remap_reqs_0_pdst : map_table_27);
		remap_table_1_28 = (_GEN_0[28] ? io_remap_reqs_0_pdst : map_table_28);
		remap_table_1_29 = (_GEN_0[29] ? io_remap_reqs_0_pdst : map_table_29);
		remap_table_1_30 = (_GEN_0[30] ? io_remap_reqs_0_pdst : map_table_30);
		remap_table_1_31 = (_GEN_0[31] ? io_remap_reqs_0_pdst : map_table_31);
		if (reset) begin
			map_table_0 <= 6'h00;
			map_table_1 <= 6'h01;
			map_table_2 <= 6'h02;
			map_table_3 <= 6'h03;
			map_table_4 <= 6'h04;
			map_table_5 <= 6'h05;
			map_table_6 <= 6'h06;
			map_table_7 <= 6'h07;
			map_table_8 <= 6'h08;
			map_table_9 <= 6'h09;
			map_table_10 <= 6'h0a;
			map_table_11 <= 6'h0b;
			map_table_12 <= 6'h0c;
			map_table_13 <= 6'h0d;
			map_table_14 <= 6'h0e;
			map_table_15 <= 6'h0f;
			map_table_16 <= 6'h10;
			map_table_17 <= 6'h11;
			map_table_18 <= 6'h12;
			map_table_19 <= 6'h13;
			map_table_20 <= 6'h14;
			map_table_21 <= 6'h15;
			map_table_22 <= 6'h16;
			map_table_23 <= 6'h17;
			map_table_24 <= 6'h18;
			map_table_25 <= 6'h19;
			map_table_26 <= 6'h1a;
			map_table_27 <= 6'h1b;
			map_table_28 <= 6'h1c;
			map_table_29 <= 6'h1d;
			map_table_30 <= 6'h1e;
			map_table_31 <= 6'h1f;
			com_map_table_0 <= 6'h00;
			com_map_table_1 <= 6'h01;
			com_map_table_2 <= 6'h02;
			com_map_table_3 <= 6'h03;
			com_map_table_4 <= 6'h04;
			com_map_table_5 <= 6'h05;
			com_map_table_6 <= 6'h06;
			com_map_table_7 <= 6'h07;
			com_map_table_8 <= 6'h08;
			com_map_table_9 <= 6'h09;
			com_map_table_10 <= 6'h0a;
			com_map_table_11 <= 6'h0b;
			com_map_table_12 <= 6'h0c;
			com_map_table_13 <= 6'h0d;
			com_map_table_14 <= 6'h0e;
			com_map_table_15 <= 6'h0f;
			com_map_table_16 <= 6'h10;
			com_map_table_17 <= 6'h11;
			com_map_table_18 <= 6'h12;
			com_map_table_19 <= 6'h13;
			com_map_table_20 <= 6'h14;
			com_map_table_21 <= 6'h15;
			com_map_table_22 <= 6'h16;
			com_map_table_23 <= 6'h17;
			com_map_table_24 <= 6'h18;
			com_map_table_25 <= 6'h19;
			com_map_table_26 <= 6'h1a;
			com_map_table_27 <= 6'h1b;
			com_map_table_28 <= 6'h1c;
			com_map_table_29 <= 6'h1d;
			com_map_table_30 <= 6'h1e;
			com_map_table_31 <= 6'h1f;
		end
		else begin : sv2v_autoblock_2
			reg [63:0] _com_remap_ldsts_oh_T;
			reg [31:0] _GEN_1;
			_com_remap_ldsts_oh_T = 64'h0000000000000001 << io_com_remap_reqs_0_ldst;
			_GEN_1 = _com_remap_ldsts_oh_T[31:0] & {32 {io_com_remap_reqs_0_valid}};
			if (io_brupdate_b2_mispredict) begin : sv2v_autoblock_3
				reg [47:0] _GEN_2;
				reg [47:0] _GEN_3;
				reg [47:0] _GEN_4;
				reg [47:0] _GEN_5;
				reg [47:0] _GEN_6;
				reg [47:0] _GEN_7;
				reg [47:0] _GEN_8;
				reg [47:0] _GEN_9;
				reg [47:0] _GEN_10;
				reg [47:0] _GEN_11;
				reg [47:0] _GEN_12;
				reg [47:0] _GEN_13;
				reg [47:0] _GEN_14;
				reg [47:0] _GEN_15;
				reg [47:0] _GEN_16;
				reg [47:0] _GEN_17;
				reg [47:0] _GEN_18;
				reg [47:0] _GEN_19;
				reg [47:0] _GEN_20;
				reg [47:0] _GEN_21;
				reg [47:0] _GEN_22;
				reg [47:0] _GEN_23;
				reg [47:0] _GEN_24;
				reg [47:0] _GEN_25;
				reg [47:0] _GEN_26;
				reg [47:0] _GEN_27;
				reg [47:0] _GEN_28;
				reg [47:0] _GEN_29;
				reg [47:0] _GEN_30;
				reg [47:0] _GEN_31;
				reg [47:0] _GEN_32;
				reg [47:0] _GEN_33;
				_GEN_2 = {br_snapshots_7_0, br_snapshots_6_0, br_snapshots_5_0, br_snapshots_4_0, br_snapshots_3_0, br_snapshots_2_0, br_snapshots_1_0, br_snapshots_0_0};
				map_table_0 <= _GEN_2[io_brupdate_b2_uop_br_tag * 6+:6];
				_GEN_3 = {br_snapshots_7_1, br_snapshots_6_1, br_snapshots_5_1, br_snapshots_4_1, br_snapshots_3_1, br_snapshots_2_1, br_snapshots_1_1, br_snapshots_0_1};
				map_table_1 <= _GEN_3[io_brupdate_b2_uop_br_tag * 6+:6];
				_GEN_4 = {br_snapshots_7_2, br_snapshots_6_2, br_snapshots_5_2, br_snapshots_4_2, br_snapshots_3_2, br_snapshots_2_2, br_snapshots_1_2, br_snapshots_0_2};
				map_table_2 <= _GEN_4[io_brupdate_b2_uop_br_tag * 6+:6];
				_GEN_5 = {br_snapshots_7_3, br_snapshots_6_3, br_snapshots_5_3, br_snapshots_4_3, br_snapshots_3_3, br_snapshots_2_3, br_snapshots_1_3, br_snapshots_0_3};
				map_table_3 <= _GEN_5[io_brupdate_b2_uop_br_tag * 6+:6];
				_GEN_6 = {br_snapshots_7_4, br_snapshots_6_4, br_snapshots_5_4, br_snapshots_4_4, br_snapshots_3_4, br_snapshots_2_4, br_snapshots_1_4, br_snapshots_0_4};
				map_table_4 <= _GEN_6[io_brupdate_b2_uop_br_tag * 6+:6];
				_GEN_7 = {br_snapshots_7_5, br_snapshots_6_5, br_snapshots_5_5, br_snapshots_4_5, br_snapshots_3_5, br_snapshots_2_5, br_snapshots_1_5, br_snapshots_0_5};
				map_table_5 <= _GEN_7[io_brupdate_b2_uop_br_tag * 6+:6];
				_GEN_8 = {br_snapshots_7_6, br_snapshots_6_6, br_snapshots_5_6, br_snapshots_4_6, br_snapshots_3_6, br_snapshots_2_6, br_snapshots_1_6, br_snapshots_0_6};
				map_table_6 <= _GEN_8[io_brupdate_b2_uop_br_tag * 6+:6];
				_GEN_9 = {br_snapshots_7_7, br_snapshots_6_7, br_snapshots_5_7, br_snapshots_4_7, br_snapshots_3_7, br_snapshots_2_7, br_snapshots_1_7, br_snapshots_0_7};
				map_table_7 <= _GEN_9[io_brupdate_b2_uop_br_tag * 6+:6];
				_GEN_10 = {br_snapshots_7_8, br_snapshots_6_8, br_snapshots_5_8, br_snapshots_4_8, br_snapshots_3_8, br_snapshots_2_8, br_snapshots_1_8, br_snapshots_0_8};
				map_table_8 <= _GEN_10[io_brupdate_b2_uop_br_tag * 6+:6];
				_GEN_11 = {br_snapshots_7_9, br_snapshots_6_9, br_snapshots_5_9, br_snapshots_4_9, br_snapshots_3_9, br_snapshots_2_9, br_snapshots_1_9, br_snapshots_0_9};
				map_table_9 <= _GEN_11[io_brupdate_b2_uop_br_tag * 6+:6];
				_GEN_12 = {br_snapshots_7_10, br_snapshots_6_10, br_snapshots_5_10, br_snapshots_4_10, br_snapshots_3_10, br_snapshots_2_10, br_snapshots_1_10, br_snapshots_0_10};
				map_table_10 <= _GEN_12[io_brupdate_b2_uop_br_tag * 6+:6];
				_GEN_13 = {br_snapshots_7_11, br_snapshots_6_11, br_snapshots_5_11, br_snapshots_4_11, br_snapshots_3_11, br_snapshots_2_11, br_snapshots_1_11, br_snapshots_0_11};
				map_table_11 <= _GEN_13[io_brupdate_b2_uop_br_tag * 6+:6];
				_GEN_14 = {br_snapshots_7_12, br_snapshots_6_12, br_snapshots_5_12, br_snapshots_4_12, br_snapshots_3_12, br_snapshots_2_12, br_snapshots_1_12, br_snapshots_0_12};
				map_table_12 <= _GEN_14[io_brupdate_b2_uop_br_tag * 6+:6];
				_GEN_15 = {br_snapshots_7_13, br_snapshots_6_13, br_snapshots_5_13, br_snapshots_4_13, br_snapshots_3_13, br_snapshots_2_13, br_snapshots_1_13, br_snapshots_0_13};
				map_table_13 <= _GEN_15[io_brupdate_b2_uop_br_tag * 6+:6];
				_GEN_16 = {br_snapshots_7_14, br_snapshots_6_14, br_snapshots_5_14, br_snapshots_4_14, br_snapshots_3_14, br_snapshots_2_14, br_snapshots_1_14, br_snapshots_0_14};
				map_table_14 <= _GEN_16[io_brupdate_b2_uop_br_tag * 6+:6];
				_GEN_17 = {br_snapshots_7_15, br_snapshots_6_15, br_snapshots_5_15, br_snapshots_4_15, br_snapshots_3_15, br_snapshots_2_15, br_snapshots_1_15, br_snapshots_0_15};
				map_table_15 <= _GEN_17[io_brupdate_b2_uop_br_tag * 6+:6];
				_GEN_18 = {br_snapshots_7_16, br_snapshots_6_16, br_snapshots_5_16, br_snapshots_4_16, br_snapshots_3_16, br_snapshots_2_16, br_snapshots_1_16, br_snapshots_0_16};
				map_table_16 <= _GEN_18[io_brupdate_b2_uop_br_tag * 6+:6];
				_GEN_19 = {br_snapshots_7_17, br_snapshots_6_17, br_snapshots_5_17, br_snapshots_4_17, br_snapshots_3_17, br_snapshots_2_17, br_snapshots_1_17, br_snapshots_0_17};
				map_table_17 <= _GEN_19[io_brupdate_b2_uop_br_tag * 6+:6];
				_GEN_20 = {br_snapshots_7_18, br_snapshots_6_18, br_snapshots_5_18, br_snapshots_4_18, br_snapshots_3_18, br_snapshots_2_18, br_snapshots_1_18, br_snapshots_0_18};
				map_table_18 <= _GEN_20[io_brupdate_b2_uop_br_tag * 6+:6];
				_GEN_21 = {br_snapshots_7_19, br_snapshots_6_19, br_snapshots_5_19, br_snapshots_4_19, br_snapshots_3_19, br_snapshots_2_19, br_snapshots_1_19, br_snapshots_0_19};
				map_table_19 <= _GEN_21[io_brupdate_b2_uop_br_tag * 6+:6];
				_GEN_22 = {br_snapshots_7_20, br_snapshots_6_20, br_snapshots_5_20, br_snapshots_4_20, br_snapshots_3_20, br_snapshots_2_20, br_snapshots_1_20, br_snapshots_0_20};
				map_table_20 <= _GEN_22[io_brupdate_b2_uop_br_tag * 6+:6];
				_GEN_23 = {br_snapshots_7_21, br_snapshots_6_21, br_snapshots_5_21, br_snapshots_4_21, br_snapshots_3_21, br_snapshots_2_21, br_snapshots_1_21, br_snapshots_0_21};
				map_table_21 <= _GEN_23[io_brupdate_b2_uop_br_tag * 6+:6];
				_GEN_24 = {br_snapshots_7_22, br_snapshots_6_22, br_snapshots_5_22, br_snapshots_4_22, br_snapshots_3_22, br_snapshots_2_22, br_snapshots_1_22, br_snapshots_0_22};
				map_table_22 <= _GEN_24[io_brupdate_b2_uop_br_tag * 6+:6];
				_GEN_25 = {br_snapshots_7_23, br_snapshots_6_23, br_snapshots_5_23, br_snapshots_4_23, br_snapshots_3_23, br_snapshots_2_23, br_snapshots_1_23, br_snapshots_0_23};
				map_table_23 <= _GEN_25[io_brupdate_b2_uop_br_tag * 6+:6];
				_GEN_26 = {br_snapshots_7_24, br_snapshots_6_24, br_snapshots_5_24, br_snapshots_4_24, br_snapshots_3_24, br_snapshots_2_24, br_snapshots_1_24, br_snapshots_0_24};
				map_table_24 <= _GEN_26[io_brupdate_b2_uop_br_tag * 6+:6];
				_GEN_27 = {br_snapshots_7_25, br_snapshots_6_25, br_snapshots_5_25, br_snapshots_4_25, br_snapshots_3_25, br_snapshots_2_25, br_snapshots_1_25, br_snapshots_0_25};
				map_table_25 <= _GEN_27[io_brupdate_b2_uop_br_tag * 6+:6];
				_GEN_28 = {br_snapshots_7_26, br_snapshots_6_26, br_snapshots_5_26, br_snapshots_4_26, br_snapshots_3_26, br_snapshots_2_26, br_snapshots_1_26, br_snapshots_0_26};
				map_table_26 <= _GEN_28[io_brupdate_b2_uop_br_tag * 6+:6];
				_GEN_29 = {br_snapshots_7_27, br_snapshots_6_27, br_snapshots_5_27, br_snapshots_4_27, br_snapshots_3_27, br_snapshots_2_27, br_snapshots_1_27, br_snapshots_0_27};
				map_table_27 <= _GEN_29[io_brupdate_b2_uop_br_tag * 6+:6];
				_GEN_30 = {br_snapshots_7_28, br_snapshots_6_28, br_snapshots_5_28, br_snapshots_4_28, br_snapshots_3_28, br_snapshots_2_28, br_snapshots_1_28, br_snapshots_0_28};
				map_table_28 <= _GEN_30[io_brupdate_b2_uop_br_tag * 6+:6];
				_GEN_31 = {br_snapshots_7_29, br_snapshots_6_29, br_snapshots_5_29, br_snapshots_4_29, br_snapshots_3_29, br_snapshots_2_29, br_snapshots_1_29, br_snapshots_0_29};
				map_table_29 <= _GEN_31[io_brupdate_b2_uop_br_tag * 6+:6];
				_GEN_32 = {br_snapshots_7_30, br_snapshots_6_30, br_snapshots_5_30, br_snapshots_4_30, br_snapshots_3_30, br_snapshots_2_30, br_snapshots_1_30, br_snapshots_0_30};
				map_table_30 <= _GEN_32[io_brupdate_b2_uop_br_tag * 6+:6];
				_GEN_33 = {br_snapshots_7_31, br_snapshots_6_31, br_snapshots_5_31, br_snapshots_4_31, br_snapshots_3_31, br_snapshots_2_31, br_snapshots_1_31, br_snapshots_0_31};
				map_table_31 <= _GEN_33[io_brupdate_b2_uop_br_tag * 6+:6];
			end
			else if (io_rollback) begin
				map_table_0 <= com_map_table_0;
				map_table_1 <= com_map_table_1;
				map_table_2 <= com_map_table_2;
				map_table_3 <= com_map_table_3;
				map_table_4 <= com_map_table_4;
				map_table_5 <= com_map_table_5;
				map_table_6 <= com_map_table_6;
				map_table_7 <= com_map_table_7;
				map_table_8 <= com_map_table_8;
				map_table_9 <= com_map_table_9;
				map_table_10 <= com_map_table_10;
				map_table_11 <= com_map_table_11;
				map_table_12 <= com_map_table_12;
				map_table_13 <= com_map_table_13;
				map_table_14 <= com_map_table_14;
				map_table_15 <= com_map_table_15;
				map_table_16 <= com_map_table_16;
				map_table_17 <= com_map_table_17;
				map_table_18 <= com_map_table_18;
				map_table_19 <= com_map_table_19;
				map_table_20 <= com_map_table_20;
				map_table_21 <= com_map_table_21;
				map_table_22 <= com_map_table_22;
				map_table_23 <= com_map_table_23;
				map_table_24 <= com_map_table_24;
				map_table_25 <= com_map_table_25;
				map_table_26 <= com_map_table_26;
				map_table_27 <= com_map_table_27;
				map_table_28 <= com_map_table_28;
				map_table_29 <= com_map_table_29;
				map_table_30 <= com_map_table_30;
				map_table_31 <= com_map_table_31;
			end
			else begin
				if (_GEN_0[0])
					map_table_0 <= io_remap_reqs_0_pdst;
				if (_GEN_0[1])
					map_table_1 <= io_remap_reqs_0_pdst;
				if (_GEN_0[2])
					map_table_2 <= io_remap_reqs_0_pdst;
				if (_GEN_0[3])
					map_table_3 <= io_remap_reqs_0_pdst;
				if (_GEN_0[4])
					map_table_4 <= io_remap_reqs_0_pdst;
				if (_GEN_0[5])
					map_table_5 <= io_remap_reqs_0_pdst;
				if (_GEN_0[6])
					map_table_6 <= io_remap_reqs_0_pdst;
				if (_GEN_0[7])
					map_table_7 <= io_remap_reqs_0_pdst;
				if (_GEN_0[8])
					map_table_8 <= io_remap_reqs_0_pdst;
				if (_GEN_0[9])
					map_table_9 <= io_remap_reqs_0_pdst;
				if (_GEN_0[10])
					map_table_10 <= io_remap_reqs_0_pdst;
				if (_GEN_0[11])
					map_table_11 <= io_remap_reqs_0_pdst;
				if (_GEN_0[12])
					map_table_12 <= io_remap_reqs_0_pdst;
				if (_GEN_0[13])
					map_table_13 <= io_remap_reqs_0_pdst;
				if (_GEN_0[14])
					map_table_14 <= io_remap_reqs_0_pdst;
				if (_GEN_0[15])
					map_table_15 <= io_remap_reqs_0_pdst;
				if (_GEN_0[16])
					map_table_16 <= io_remap_reqs_0_pdst;
				if (_GEN_0[17])
					map_table_17 <= io_remap_reqs_0_pdst;
				if (_GEN_0[18])
					map_table_18 <= io_remap_reqs_0_pdst;
				if (_GEN_0[19])
					map_table_19 <= io_remap_reqs_0_pdst;
				if (_GEN_0[20])
					map_table_20 <= io_remap_reqs_0_pdst;
				if (_GEN_0[21])
					map_table_21 <= io_remap_reqs_0_pdst;
				if (_GEN_0[22])
					map_table_22 <= io_remap_reqs_0_pdst;
				if (_GEN_0[23])
					map_table_23 <= io_remap_reqs_0_pdst;
				if (_GEN_0[24])
					map_table_24 <= io_remap_reqs_0_pdst;
				if (_GEN_0[25])
					map_table_25 <= io_remap_reqs_0_pdst;
				if (_GEN_0[26])
					map_table_26 <= io_remap_reqs_0_pdst;
				if (_GEN_0[27])
					map_table_27 <= io_remap_reqs_0_pdst;
				if (_GEN_0[28])
					map_table_28 <= io_remap_reqs_0_pdst;
				if (_GEN_0[29])
					map_table_29 <= io_remap_reqs_0_pdst;
				if (_GEN_0[30])
					map_table_30 <= io_remap_reqs_0_pdst;
				if (_GEN_0[31])
					map_table_31 <= io_remap_reqs_0_pdst;
			end
			if (_GEN_1[0])
				com_map_table_0 <= io_com_remap_reqs_0_pdst;
			if (_GEN_1[1])
				com_map_table_1 <= io_com_remap_reqs_0_pdst;
			if (_GEN_1[2])
				com_map_table_2 <= io_com_remap_reqs_0_pdst;
			if (_GEN_1[3])
				com_map_table_3 <= io_com_remap_reqs_0_pdst;
			if (_GEN_1[4])
				com_map_table_4 <= io_com_remap_reqs_0_pdst;
			if (_GEN_1[5])
				com_map_table_5 <= io_com_remap_reqs_0_pdst;
			if (_GEN_1[6])
				com_map_table_6 <= io_com_remap_reqs_0_pdst;
			if (_GEN_1[7])
				com_map_table_7 <= io_com_remap_reqs_0_pdst;
			if (_GEN_1[8])
				com_map_table_8 <= io_com_remap_reqs_0_pdst;
			if (_GEN_1[9])
				com_map_table_9 <= io_com_remap_reqs_0_pdst;
			if (_GEN_1[10])
				com_map_table_10 <= io_com_remap_reqs_0_pdst;
			if (_GEN_1[11])
				com_map_table_11 <= io_com_remap_reqs_0_pdst;
			if (_GEN_1[12])
				com_map_table_12 <= io_com_remap_reqs_0_pdst;
			if (_GEN_1[13])
				com_map_table_13 <= io_com_remap_reqs_0_pdst;
			if (_GEN_1[14])
				com_map_table_14 <= io_com_remap_reqs_0_pdst;
			if (_GEN_1[15])
				com_map_table_15 <= io_com_remap_reqs_0_pdst;
			if (_GEN_1[16])
				com_map_table_16 <= io_com_remap_reqs_0_pdst;
			if (_GEN_1[17])
				com_map_table_17 <= io_com_remap_reqs_0_pdst;
			if (_GEN_1[18])
				com_map_table_18 <= io_com_remap_reqs_0_pdst;
			if (_GEN_1[19])
				com_map_table_19 <= io_com_remap_reqs_0_pdst;
			if (_GEN_1[20])
				com_map_table_20 <= io_com_remap_reqs_0_pdst;
			if (_GEN_1[21])
				com_map_table_21 <= io_com_remap_reqs_0_pdst;
			if (_GEN_1[22])
				com_map_table_22 <= io_com_remap_reqs_0_pdst;
			if (_GEN_1[23])
				com_map_table_23 <= io_com_remap_reqs_0_pdst;
			if (_GEN_1[24])
				com_map_table_24 <= io_com_remap_reqs_0_pdst;
			if (_GEN_1[25])
				com_map_table_25 <= io_com_remap_reqs_0_pdst;
			if (_GEN_1[26])
				com_map_table_26 <= io_com_remap_reqs_0_pdst;
			if (_GEN_1[27])
				com_map_table_27 <= io_com_remap_reqs_0_pdst;
			if (_GEN_1[28])
				com_map_table_28 <= io_com_remap_reqs_0_pdst;
			if (_GEN_1[29])
				com_map_table_29 <= io_com_remap_reqs_0_pdst;
			if (_GEN_1[30])
				com_map_table_30 <= io_com_remap_reqs_0_pdst;
			if (_GEN_1[31])
				com_map_table_31 <= io_com_remap_reqs_0_pdst;
		end
		if (io_ren_br_tags_1_valid & (io_ren_br_tags_1_bits == 3'h0)) begin
			br_snapshots_0_0 <= remapped_row_1;
			br_snapshots_0_1 <= remap_table_1_1;
			br_snapshots_0_2 <= remap_table_1_2;
			br_snapshots_0_3 <= remap_table_1_3;
			br_snapshots_0_4 <= remap_table_1_4;
			br_snapshots_0_5 <= remap_table_1_5;
			br_snapshots_0_6 <= remap_table_1_6;
			br_snapshots_0_7 <= remap_table_1_7;
			br_snapshots_0_8 <= remap_table_1_8;
			br_snapshots_0_9 <= remap_table_1_9;
			br_snapshots_0_10 <= remap_table_1_10;
			br_snapshots_0_11 <= remap_table_1_11;
			br_snapshots_0_12 <= remap_table_1_12;
			br_snapshots_0_13 <= remap_table_1_13;
			br_snapshots_0_14 <= remap_table_1_14;
			br_snapshots_0_15 <= remap_table_1_15;
			br_snapshots_0_16 <= remap_table_1_16;
			br_snapshots_0_17 <= remap_table_1_17;
			br_snapshots_0_18 <= remap_table_1_18;
			br_snapshots_0_19 <= remap_table_1_19;
			br_snapshots_0_20 <= remap_table_1_20;
			br_snapshots_0_21 <= remap_table_1_21;
			br_snapshots_0_22 <= remap_table_1_22;
			br_snapshots_0_23 <= remap_table_1_23;
			br_snapshots_0_24 <= remap_table_1_24;
			br_snapshots_0_25 <= remap_table_1_25;
			br_snapshots_0_26 <= remap_table_1_26;
			br_snapshots_0_27 <= remap_table_1_27;
			br_snapshots_0_28 <= remap_table_1_28;
			br_snapshots_0_29 <= remap_table_1_29;
			br_snapshots_0_30 <= remap_table_1_30;
			br_snapshots_0_31 <= remap_table_1_31;
		end
		if (io_ren_br_tags_1_valid & (io_ren_br_tags_1_bits == 3'h1)) begin
			br_snapshots_1_0 <= remapped_row_1;
			br_snapshots_1_1 <= remap_table_1_1;
			br_snapshots_1_2 <= remap_table_1_2;
			br_snapshots_1_3 <= remap_table_1_3;
			br_snapshots_1_4 <= remap_table_1_4;
			br_snapshots_1_5 <= remap_table_1_5;
			br_snapshots_1_6 <= remap_table_1_6;
			br_snapshots_1_7 <= remap_table_1_7;
			br_snapshots_1_8 <= remap_table_1_8;
			br_snapshots_1_9 <= remap_table_1_9;
			br_snapshots_1_10 <= remap_table_1_10;
			br_snapshots_1_11 <= remap_table_1_11;
			br_snapshots_1_12 <= remap_table_1_12;
			br_snapshots_1_13 <= remap_table_1_13;
			br_snapshots_1_14 <= remap_table_1_14;
			br_snapshots_1_15 <= remap_table_1_15;
			br_snapshots_1_16 <= remap_table_1_16;
			br_snapshots_1_17 <= remap_table_1_17;
			br_snapshots_1_18 <= remap_table_1_18;
			br_snapshots_1_19 <= remap_table_1_19;
			br_snapshots_1_20 <= remap_table_1_20;
			br_snapshots_1_21 <= remap_table_1_21;
			br_snapshots_1_22 <= remap_table_1_22;
			br_snapshots_1_23 <= remap_table_1_23;
			br_snapshots_1_24 <= remap_table_1_24;
			br_snapshots_1_25 <= remap_table_1_25;
			br_snapshots_1_26 <= remap_table_1_26;
			br_snapshots_1_27 <= remap_table_1_27;
			br_snapshots_1_28 <= remap_table_1_28;
			br_snapshots_1_29 <= remap_table_1_29;
			br_snapshots_1_30 <= remap_table_1_30;
			br_snapshots_1_31 <= remap_table_1_31;
		end
		if (io_ren_br_tags_1_valid & (io_ren_br_tags_1_bits == 3'h2)) begin
			br_snapshots_2_0 <= remapped_row_1;
			br_snapshots_2_1 <= remap_table_1_1;
			br_snapshots_2_2 <= remap_table_1_2;
			br_snapshots_2_3 <= remap_table_1_3;
			br_snapshots_2_4 <= remap_table_1_4;
			br_snapshots_2_5 <= remap_table_1_5;
			br_snapshots_2_6 <= remap_table_1_6;
			br_snapshots_2_7 <= remap_table_1_7;
			br_snapshots_2_8 <= remap_table_1_8;
			br_snapshots_2_9 <= remap_table_1_9;
			br_snapshots_2_10 <= remap_table_1_10;
			br_snapshots_2_11 <= remap_table_1_11;
			br_snapshots_2_12 <= remap_table_1_12;
			br_snapshots_2_13 <= remap_table_1_13;
			br_snapshots_2_14 <= remap_table_1_14;
			br_snapshots_2_15 <= remap_table_1_15;
			br_snapshots_2_16 <= remap_table_1_16;
			br_snapshots_2_17 <= remap_table_1_17;
			br_snapshots_2_18 <= remap_table_1_18;
			br_snapshots_2_19 <= remap_table_1_19;
			br_snapshots_2_20 <= remap_table_1_20;
			br_snapshots_2_21 <= remap_table_1_21;
			br_snapshots_2_22 <= remap_table_1_22;
			br_snapshots_2_23 <= remap_table_1_23;
			br_snapshots_2_24 <= remap_table_1_24;
			br_snapshots_2_25 <= remap_table_1_25;
			br_snapshots_2_26 <= remap_table_1_26;
			br_snapshots_2_27 <= remap_table_1_27;
			br_snapshots_2_28 <= remap_table_1_28;
			br_snapshots_2_29 <= remap_table_1_29;
			br_snapshots_2_30 <= remap_table_1_30;
			br_snapshots_2_31 <= remap_table_1_31;
		end
		if (io_ren_br_tags_1_valid & (io_ren_br_tags_1_bits == 3'h3)) begin
			br_snapshots_3_0 <= remapped_row_1;
			br_snapshots_3_1 <= remap_table_1_1;
			br_snapshots_3_2 <= remap_table_1_2;
			br_snapshots_3_3 <= remap_table_1_3;
			br_snapshots_3_4 <= remap_table_1_4;
			br_snapshots_3_5 <= remap_table_1_5;
			br_snapshots_3_6 <= remap_table_1_6;
			br_snapshots_3_7 <= remap_table_1_7;
			br_snapshots_3_8 <= remap_table_1_8;
			br_snapshots_3_9 <= remap_table_1_9;
			br_snapshots_3_10 <= remap_table_1_10;
			br_snapshots_3_11 <= remap_table_1_11;
			br_snapshots_3_12 <= remap_table_1_12;
			br_snapshots_3_13 <= remap_table_1_13;
			br_snapshots_3_14 <= remap_table_1_14;
			br_snapshots_3_15 <= remap_table_1_15;
			br_snapshots_3_16 <= remap_table_1_16;
			br_snapshots_3_17 <= remap_table_1_17;
			br_snapshots_3_18 <= remap_table_1_18;
			br_snapshots_3_19 <= remap_table_1_19;
			br_snapshots_3_20 <= remap_table_1_20;
			br_snapshots_3_21 <= remap_table_1_21;
			br_snapshots_3_22 <= remap_table_1_22;
			br_snapshots_3_23 <= remap_table_1_23;
			br_snapshots_3_24 <= remap_table_1_24;
			br_snapshots_3_25 <= remap_table_1_25;
			br_snapshots_3_26 <= remap_table_1_26;
			br_snapshots_3_27 <= remap_table_1_27;
			br_snapshots_3_28 <= remap_table_1_28;
			br_snapshots_3_29 <= remap_table_1_29;
			br_snapshots_3_30 <= remap_table_1_30;
			br_snapshots_3_31 <= remap_table_1_31;
		end
		if (io_ren_br_tags_1_valid & (io_ren_br_tags_1_bits == 3'h4)) begin
			br_snapshots_4_0 <= remapped_row_1;
			br_snapshots_4_1 <= remap_table_1_1;
			br_snapshots_4_2 <= remap_table_1_2;
			br_snapshots_4_3 <= remap_table_1_3;
			br_snapshots_4_4 <= remap_table_1_4;
			br_snapshots_4_5 <= remap_table_1_5;
			br_snapshots_4_6 <= remap_table_1_6;
			br_snapshots_4_7 <= remap_table_1_7;
			br_snapshots_4_8 <= remap_table_1_8;
			br_snapshots_4_9 <= remap_table_1_9;
			br_snapshots_4_10 <= remap_table_1_10;
			br_snapshots_4_11 <= remap_table_1_11;
			br_snapshots_4_12 <= remap_table_1_12;
			br_snapshots_4_13 <= remap_table_1_13;
			br_snapshots_4_14 <= remap_table_1_14;
			br_snapshots_4_15 <= remap_table_1_15;
			br_snapshots_4_16 <= remap_table_1_16;
			br_snapshots_4_17 <= remap_table_1_17;
			br_snapshots_4_18 <= remap_table_1_18;
			br_snapshots_4_19 <= remap_table_1_19;
			br_snapshots_4_20 <= remap_table_1_20;
			br_snapshots_4_21 <= remap_table_1_21;
			br_snapshots_4_22 <= remap_table_1_22;
			br_snapshots_4_23 <= remap_table_1_23;
			br_snapshots_4_24 <= remap_table_1_24;
			br_snapshots_4_25 <= remap_table_1_25;
			br_snapshots_4_26 <= remap_table_1_26;
			br_snapshots_4_27 <= remap_table_1_27;
			br_snapshots_4_28 <= remap_table_1_28;
			br_snapshots_4_29 <= remap_table_1_29;
			br_snapshots_4_30 <= remap_table_1_30;
			br_snapshots_4_31 <= remap_table_1_31;
		end
		if (io_ren_br_tags_1_valid & (io_ren_br_tags_1_bits == 3'h5)) begin
			br_snapshots_5_0 <= remapped_row_1;
			br_snapshots_5_1 <= remap_table_1_1;
			br_snapshots_5_2 <= remap_table_1_2;
			br_snapshots_5_3 <= remap_table_1_3;
			br_snapshots_5_4 <= remap_table_1_4;
			br_snapshots_5_5 <= remap_table_1_5;
			br_snapshots_5_6 <= remap_table_1_6;
			br_snapshots_5_7 <= remap_table_1_7;
			br_snapshots_5_8 <= remap_table_1_8;
			br_snapshots_5_9 <= remap_table_1_9;
			br_snapshots_5_10 <= remap_table_1_10;
			br_snapshots_5_11 <= remap_table_1_11;
			br_snapshots_5_12 <= remap_table_1_12;
			br_snapshots_5_13 <= remap_table_1_13;
			br_snapshots_5_14 <= remap_table_1_14;
			br_snapshots_5_15 <= remap_table_1_15;
			br_snapshots_5_16 <= remap_table_1_16;
			br_snapshots_5_17 <= remap_table_1_17;
			br_snapshots_5_18 <= remap_table_1_18;
			br_snapshots_5_19 <= remap_table_1_19;
			br_snapshots_5_20 <= remap_table_1_20;
			br_snapshots_5_21 <= remap_table_1_21;
			br_snapshots_5_22 <= remap_table_1_22;
			br_snapshots_5_23 <= remap_table_1_23;
			br_snapshots_5_24 <= remap_table_1_24;
			br_snapshots_5_25 <= remap_table_1_25;
			br_snapshots_5_26 <= remap_table_1_26;
			br_snapshots_5_27 <= remap_table_1_27;
			br_snapshots_5_28 <= remap_table_1_28;
			br_snapshots_5_29 <= remap_table_1_29;
			br_snapshots_5_30 <= remap_table_1_30;
			br_snapshots_5_31 <= remap_table_1_31;
		end
		if (io_ren_br_tags_1_valid & (io_ren_br_tags_1_bits == 3'h6)) begin
			br_snapshots_6_0 <= remapped_row_1;
			br_snapshots_6_1 <= remap_table_1_1;
			br_snapshots_6_2 <= remap_table_1_2;
			br_snapshots_6_3 <= remap_table_1_3;
			br_snapshots_6_4 <= remap_table_1_4;
			br_snapshots_6_5 <= remap_table_1_5;
			br_snapshots_6_6 <= remap_table_1_6;
			br_snapshots_6_7 <= remap_table_1_7;
			br_snapshots_6_8 <= remap_table_1_8;
			br_snapshots_6_9 <= remap_table_1_9;
			br_snapshots_6_10 <= remap_table_1_10;
			br_snapshots_6_11 <= remap_table_1_11;
			br_snapshots_6_12 <= remap_table_1_12;
			br_snapshots_6_13 <= remap_table_1_13;
			br_snapshots_6_14 <= remap_table_1_14;
			br_snapshots_6_15 <= remap_table_1_15;
			br_snapshots_6_16 <= remap_table_1_16;
			br_snapshots_6_17 <= remap_table_1_17;
			br_snapshots_6_18 <= remap_table_1_18;
			br_snapshots_6_19 <= remap_table_1_19;
			br_snapshots_6_20 <= remap_table_1_20;
			br_snapshots_6_21 <= remap_table_1_21;
			br_snapshots_6_22 <= remap_table_1_22;
			br_snapshots_6_23 <= remap_table_1_23;
			br_snapshots_6_24 <= remap_table_1_24;
			br_snapshots_6_25 <= remap_table_1_25;
			br_snapshots_6_26 <= remap_table_1_26;
			br_snapshots_6_27 <= remap_table_1_27;
			br_snapshots_6_28 <= remap_table_1_28;
			br_snapshots_6_29 <= remap_table_1_29;
			br_snapshots_6_30 <= remap_table_1_30;
			br_snapshots_6_31 <= remap_table_1_31;
		end
		if (io_ren_br_tags_1_valid & (&io_ren_br_tags_1_bits)) begin
			br_snapshots_7_0 <= remapped_row_1;
			br_snapshots_7_1 <= remap_table_1_1;
			br_snapshots_7_2 <= remap_table_1_2;
			br_snapshots_7_3 <= remap_table_1_3;
			br_snapshots_7_4 <= remap_table_1_4;
			br_snapshots_7_5 <= remap_table_1_5;
			br_snapshots_7_6 <= remap_table_1_6;
			br_snapshots_7_7 <= remap_table_1_7;
			br_snapshots_7_8 <= remap_table_1_8;
			br_snapshots_7_9 <= remap_table_1_9;
			br_snapshots_7_10 <= remap_table_1_10;
			br_snapshots_7_11 <= remap_table_1_11;
			br_snapshots_7_12 <= remap_table_1_12;
			br_snapshots_7_13 <= remap_table_1_13;
			br_snapshots_7_14 <= remap_table_1_14;
			br_snapshots_7_15 <= remap_table_1_15;
			br_snapshots_7_16 <= remap_table_1_16;
			br_snapshots_7_17 <= remap_table_1_17;
			br_snapshots_7_18 <= remap_table_1_18;
			br_snapshots_7_19 <= remap_table_1_19;
			br_snapshots_7_20 <= remap_table_1_20;
			br_snapshots_7_21 <= remap_table_1_21;
			br_snapshots_7_22 <= remap_table_1_22;
			br_snapshots_7_23 <= remap_table_1_23;
			br_snapshots_7_24 <= remap_table_1_24;
			br_snapshots_7_25 <= remap_table_1_25;
			br_snapshots_7_26 <= remap_table_1_26;
			br_snapshots_7_27 <= remap_table_1_27;
			br_snapshots_7_28 <= remap_table_1_28;
			br_snapshots_7_29 <= remap_table_1_29;
			br_snapshots_7_30 <= remap_table_1_30;
			br_snapshots_7_31 <= remap_table_1_31;
		end
	end
	assign io_map_resps_0_prs1 = _GEN[io_map_reqs_0_lrs1[4:0] * 6+:6];
	assign io_map_resps_0_prs2 = _GEN[io_map_reqs_0_lrs2[4:0] * 6+:6];
	assign io_map_resps_0_prs3 = _GEN[io_map_reqs_0_lrs3[4:0] * 6+:6];
	assign io_map_resps_0_stale_pdst = _GEN[io_map_reqs_0_ldst[4:0] * 6+:6];
endmodule
