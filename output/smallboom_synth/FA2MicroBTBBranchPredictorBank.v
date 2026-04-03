module FA2MicroBTBBranchPredictorBank (
	clock,
	reset,
	io_f0_valid,
	io_f0_pc,
	io_resp_f1_0_taken,
	io_resp_f1_0_is_br,
	io_resp_f1_0_predicted_pc_valid,
	io_resp_f1_0_predicted_pc_bits,
	io_resp_f1_1_taken,
	io_resp_f1_1_is_br,
	io_resp_f1_1_predicted_pc_valid,
	io_resp_f1_1_predicted_pc_bits,
	io_resp_f1_2_taken,
	io_resp_f1_2_is_br,
	io_resp_f1_2_predicted_pc_valid,
	io_resp_f1_2_predicted_pc_bits,
	io_resp_f1_3_taken,
	io_resp_f1_3_is_br,
	io_resp_f1_3_predicted_pc_valid,
	io_resp_f1_3_predicted_pc_bits,
	io_resp_f2_0_is_br,
	io_resp_f2_0_is_jal,
	io_resp_f2_0_predicted_pc_valid,
	io_resp_f2_0_predicted_pc_bits,
	io_resp_f2_1_is_br,
	io_resp_f2_1_is_jal,
	io_resp_f2_1_predicted_pc_valid,
	io_resp_f2_1_predicted_pc_bits,
	io_resp_f2_2_is_br,
	io_resp_f2_2_is_jal,
	io_resp_f2_2_predicted_pc_valid,
	io_resp_f2_2_predicted_pc_bits,
	io_resp_f2_3_is_br,
	io_resp_f2_3_is_jal,
	io_resp_f2_3_predicted_pc_valid,
	io_resp_f2_3_predicted_pc_bits,
	io_resp_f3_0_is_br,
	io_resp_f3_0_is_jal,
	io_resp_f3_0_predicted_pc_valid,
	io_resp_f3_0_predicted_pc_bits,
	io_resp_f3_1_is_br,
	io_resp_f3_1_is_jal,
	io_resp_f3_1_predicted_pc_valid,
	io_resp_f3_1_predicted_pc_bits,
	io_resp_f3_2_is_br,
	io_resp_f3_2_is_jal,
	io_resp_f3_2_predicted_pc_valid,
	io_resp_f3_2_predicted_pc_bits,
	io_resp_f3_3_is_br,
	io_resp_f3_3_is_jal,
	io_resp_f3_3_predicted_pc_valid,
	io_resp_f3_3_predicted_pc_bits,
	io_f3_meta,
	io_update_valid,
	io_update_bits_is_mispredict_update,
	io_update_bits_is_repair_update,
	io_update_bits_btb_mispredicts,
	io_update_bits_pc,
	io_update_bits_br_mask,
	io_update_bits_cfi_idx_valid,
	io_update_bits_cfi_idx_bits,
	io_update_bits_cfi_taken,
	io_update_bits_cfi_is_br,
	io_update_bits_cfi_is_jal,
	io_update_bits_cfi_is_jalr,
	io_update_bits_target
);
	input clock;
	input reset;
	input io_f0_valid;
	input [39:0] io_f0_pc;
	output wire io_resp_f1_0_taken;
	output wire io_resp_f1_0_is_br;
	output wire io_resp_f1_0_predicted_pc_valid;
	output wire [39:0] io_resp_f1_0_predicted_pc_bits;
	output wire io_resp_f1_1_taken;
	output wire io_resp_f1_1_is_br;
	output wire io_resp_f1_1_predicted_pc_valid;
	output wire [39:0] io_resp_f1_1_predicted_pc_bits;
	output wire io_resp_f1_2_taken;
	output wire io_resp_f1_2_is_br;
	output wire io_resp_f1_2_predicted_pc_valid;
	output wire [39:0] io_resp_f1_2_predicted_pc_bits;
	output wire io_resp_f1_3_taken;
	output wire io_resp_f1_3_is_br;
	output wire io_resp_f1_3_predicted_pc_valid;
	output wire [39:0] io_resp_f1_3_predicted_pc_bits;
	output wire io_resp_f2_0_is_br;
	output wire io_resp_f2_0_is_jal;
	output wire io_resp_f2_0_predicted_pc_valid;
	output wire [39:0] io_resp_f2_0_predicted_pc_bits;
	output wire io_resp_f2_1_is_br;
	output wire io_resp_f2_1_is_jal;
	output wire io_resp_f2_1_predicted_pc_valid;
	output wire [39:0] io_resp_f2_1_predicted_pc_bits;
	output wire io_resp_f2_2_is_br;
	output wire io_resp_f2_2_is_jal;
	output wire io_resp_f2_2_predicted_pc_valid;
	output wire [39:0] io_resp_f2_2_predicted_pc_bits;
	output wire io_resp_f2_3_is_br;
	output wire io_resp_f2_3_is_jal;
	output wire io_resp_f2_3_predicted_pc_valid;
	output wire [39:0] io_resp_f2_3_predicted_pc_bits;
	output wire io_resp_f3_0_is_br;
	output wire io_resp_f3_0_is_jal;
	output wire io_resp_f3_0_predicted_pc_valid;
	output wire [39:0] io_resp_f3_0_predicted_pc_bits;
	output wire io_resp_f3_1_is_br;
	output wire io_resp_f3_1_is_jal;
	output wire io_resp_f3_1_predicted_pc_valid;
	output wire [39:0] io_resp_f3_1_predicted_pc_bits;
	output wire io_resp_f3_2_is_br;
	output wire io_resp_f3_2_is_jal;
	output wire io_resp_f3_2_predicted_pc_valid;
	output wire [39:0] io_resp_f3_2_predicted_pc_bits;
	output wire io_resp_f3_3_is_br;
	output wire io_resp_f3_3_is_jal;
	output wire io_resp_f3_3_predicted_pc_valid;
	output wire [39:0] io_resp_f3_3_predicted_pc_bits;
	output wire [119:0] io_f3_meta;
	input io_update_valid;
	input io_update_bits_is_mispredict_update;
	input io_update_bits_is_repair_update;
	input [3:0] io_update_bits_btb_mispredicts;
	input [39:0] io_update_bits_pc;
	input [3:0] io_update_bits_br_mask;
	input io_update_bits_cfi_idx_valid;
	input [1:0] io_update_bits_cfi_idx_bits;
	input io_update_bits_cfi_taken;
	input io_update_bits_cfi_is_br;
	input io_update_bits_cfi_is_jal;
	input io_update_bits_cfi_is_jalr;
	input [39:0] io_update_bits_target;
	wire _s1_update_write_way_prng_io_out_0;
	wire _s1_update_write_way_prng_io_out_1;
	wire _s1_update_write_way_prng_io_out_2;
	wire _s1_update_write_way_prng_io_out_3;
	wire _s1_update_write_way_prng_io_out_4;
	reg [36:0] s1_idx;
	reg s1_valid;
	reg s1_update_valid;
	reg s1_update_bits_is_mispredict_update;
	reg s1_update_bits_is_repair_update;
	reg [3:0] s1_update_bits_btb_mispredicts;
	reg [3:0] s1_update_bits_br_mask;
	reg s1_update_bits_cfi_idx_valid;
	reg [1:0] s1_update_bits_cfi_idx_bits;
	reg s1_update_bits_cfi_taken;
	reg s1_update_bits_cfi_is_br;
	reg s1_update_bits_cfi_is_jal;
	reg s1_update_bits_cfi_is_jalr;
	reg [39:0] s1_update_bits_target;
	reg [36:0] s1_update_idx;
	reg valids_0;
	reg valids_1;
	reg valids_2;
	reg valids_3;
	reg valids_4;
	reg valids_5;
	reg valids_6;
	reg valids_7;
	reg valids_8;
	reg valids_9;
	reg valids_10;
	reg valids_11;
	reg valids_12;
	reg valids_13;
	reg valids_14;
	reg valids_15;
	reg valids_16;
	reg valids_17;
	reg valids_18;
	reg valids_19;
	reg valids_20;
	reg valids_21;
	reg valids_22;
	reg valids_23;
	reg [11:0] meta_0_tag;
	reg [1:0] meta_0_ctr;
	reg [1:0] meta_0_cfi_idx;
	reg [3:0] meta_0_br_mask;
	reg [3:0] meta_0_jal_mask;
	reg [11:0] meta_1_tag;
	reg [1:0] meta_1_ctr;
	reg [1:0] meta_1_cfi_idx;
	reg [3:0] meta_1_br_mask;
	reg [3:0] meta_1_jal_mask;
	reg [11:0] meta_2_tag;
	reg [1:0] meta_2_ctr;
	reg [1:0] meta_2_cfi_idx;
	reg [3:0] meta_2_br_mask;
	reg [3:0] meta_2_jal_mask;
	reg [11:0] meta_3_tag;
	reg [1:0] meta_3_ctr;
	reg [1:0] meta_3_cfi_idx;
	reg [3:0] meta_3_br_mask;
	reg [3:0] meta_3_jal_mask;
	reg [11:0] meta_4_tag;
	reg [1:0] meta_4_ctr;
	reg [1:0] meta_4_cfi_idx;
	reg [3:0] meta_4_br_mask;
	reg [3:0] meta_4_jal_mask;
	reg [11:0] meta_5_tag;
	reg [1:0] meta_5_ctr;
	reg [1:0] meta_5_cfi_idx;
	reg [3:0] meta_5_br_mask;
	reg [3:0] meta_5_jal_mask;
	reg [11:0] meta_6_tag;
	reg [1:0] meta_6_ctr;
	reg [1:0] meta_6_cfi_idx;
	reg [3:0] meta_6_br_mask;
	reg [3:0] meta_6_jal_mask;
	reg [11:0] meta_7_tag;
	reg [1:0] meta_7_ctr;
	reg [1:0] meta_7_cfi_idx;
	reg [3:0] meta_7_br_mask;
	reg [3:0] meta_7_jal_mask;
	reg [11:0] meta_8_tag;
	reg [1:0] meta_8_ctr;
	reg [1:0] meta_8_cfi_idx;
	reg [3:0] meta_8_br_mask;
	reg [3:0] meta_8_jal_mask;
	reg [11:0] meta_9_tag;
	reg [1:0] meta_9_ctr;
	reg [1:0] meta_9_cfi_idx;
	reg [3:0] meta_9_br_mask;
	reg [3:0] meta_9_jal_mask;
	reg [11:0] meta_10_tag;
	reg [1:0] meta_10_ctr;
	reg [1:0] meta_10_cfi_idx;
	reg [3:0] meta_10_br_mask;
	reg [3:0] meta_10_jal_mask;
	reg [11:0] meta_11_tag;
	reg [1:0] meta_11_ctr;
	reg [1:0] meta_11_cfi_idx;
	reg [3:0] meta_11_br_mask;
	reg [3:0] meta_11_jal_mask;
	reg [11:0] meta_12_tag;
	reg [1:0] meta_12_ctr;
	reg [1:0] meta_12_cfi_idx;
	reg [3:0] meta_12_br_mask;
	reg [3:0] meta_12_jal_mask;
	reg [11:0] meta_13_tag;
	reg [1:0] meta_13_ctr;
	reg [1:0] meta_13_cfi_idx;
	reg [3:0] meta_13_br_mask;
	reg [3:0] meta_13_jal_mask;
	reg [11:0] meta_14_tag;
	reg [1:0] meta_14_ctr;
	reg [1:0] meta_14_cfi_idx;
	reg [3:0] meta_14_br_mask;
	reg [3:0] meta_14_jal_mask;
	reg [11:0] meta_15_tag;
	reg [1:0] meta_15_ctr;
	reg [1:0] meta_15_cfi_idx;
	reg [3:0] meta_15_br_mask;
	reg [3:0] meta_15_jal_mask;
	reg [11:0] meta_16_tag;
	reg [1:0] meta_16_ctr;
	reg [1:0] meta_16_cfi_idx;
	reg [3:0] meta_16_br_mask;
	reg [3:0] meta_16_jal_mask;
	reg [11:0] meta_17_tag;
	reg [1:0] meta_17_ctr;
	reg [1:0] meta_17_cfi_idx;
	reg [3:0] meta_17_br_mask;
	reg [3:0] meta_17_jal_mask;
	reg [11:0] meta_18_tag;
	reg [1:0] meta_18_ctr;
	reg [1:0] meta_18_cfi_idx;
	reg [3:0] meta_18_br_mask;
	reg [3:0] meta_18_jal_mask;
	reg [11:0] meta_19_tag;
	reg [1:0] meta_19_ctr;
	reg [1:0] meta_19_cfi_idx;
	reg [3:0] meta_19_br_mask;
	reg [3:0] meta_19_jal_mask;
	reg [11:0] meta_20_tag;
	reg [1:0] meta_20_ctr;
	reg [1:0] meta_20_cfi_idx;
	reg [3:0] meta_20_br_mask;
	reg [3:0] meta_20_jal_mask;
	reg [11:0] meta_21_tag;
	reg [1:0] meta_21_ctr;
	reg [1:0] meta_21_cfi_idx;
	reg [3:0] meta_21_br_mask;
	reg [3:0] meta_21_jal_mask;
	reg [11:0] meta_22_tag;
	reg [1:0] meta_22_ctr;
	reg [1:0] meta_22_cfi_idx;
	reg [3:0] meta_22_br_mask;
	reg [3:0] meta_22_jal_mask;
	reg [11:0] meta_23_tag;
	reg [1:0] meta_23_ctr;
	reg [1:0] meta_23_cfi_idx;
	reg [3:0] meta_23_br_mask;
	reg [3:0] meta_23_jal_mask;
	reg [39:0] btb_0_0;
	reg [39:0] btb_0_1;
	reg [39:0] btb_1_0;
	reg [39:0] btb_1_1;
	reg [39:0] btb_2_0;
	reg [39:0] btb_2_1;
	reg [39:0] btb_3_0;
	reg [39:0] btb_3_1;
	reg [39:0] btb_4_0;
	reg [39:0] btb_4_1;
	reg [39:0] btb_5_0;
	reg [39:0] btb_5_1;
	reg [39:0] btb_6_0;
	reg [39:0] btb_6_1;
	reg [39:0] btb_7_0;
	reg [39:0] btb_7_1;
	reg [39:0] btb_8_0;
	reg [39:0] btb_8_1;
	reg [39:0] btb_9_0;
	reg [39:0] btb_9_1;
	reg [39:0] btb_10_0;
	reg [39:0] btb_10_1;
	reg [39:0] btb_11_0;
	reg [39:0] btb_11_1;
	reg [39:0] btb_12_0;
	reg [39:0] btb_12_1;
	reg [39:0] btb_13_0;
	reg [39:0] btb_13_1;
	reg [39:0] btb_14_0;
	reg [39:0] btb_14_1;
	reg [39:0] btb_15_0;
	reg [39:0] btb_15_1;
	reg [39:0] btb_16_0;
	reg [39:0] btb_16_1;
	reg [39:0] btb_17_0;
	reg [39:0] btb_17_1;
	reg [39:0] btb_18_0;
	reg [39:0] btb_18_1;
	reg [39:0] btb_19_0;
	reg [39:0] btb_19_1;
	reg [39:0] btb_20_0;
	reg [39:0] btb_20_1;
	reg [39:0] btb_21_0;
	reg [39:0] btb_21_1;
	reg [39:0] btb_22_0;
	reg [39:0] btb_22_1;
	reg [39:0] btb_23_0;
	reg [39:0] btb_23_1;
	wire s1_hit_oh_0 = valids_0 & (meta_0_tag == s1_idx[11:0]);
	wire s1_hit_oh_1 = valids_1 & (meta_1_tag == s1_idx[11:0]);
	wire s1_hit_oh_2 = valids_2 & (meta_2_tag == s1_idx[11:0]);
	wire s1_hit_oh_3 = valids_3 & (meta_3_tag == s1_idx[11:0]);
	wire s1_hit_oh_4 = valids_4 & (meta_4_tag == s1_idx[11:0]);
	wire s1_hit_oh_5 = valids_5 & (meta_5_tag == s1_idx[11:0]);
	wire s1_hit_oh_6 = valids_6 & (meta_6_tag == s1_idx[11:0]);
	wire s1_hit_oh_7 = valids_7 & (meta_7_tag == s1_idx[11:0]);
	wire s1_hit_oh_8 = valids_8 & (meta_8_tag == s1_idx[11:0]);
	wire s1_hit_oh_9 = valids_9 & (meta_9_tag == s1_idx[11:0]);
	wire s1_hit_oh_10 = valids_10 & (meta_10_tag == s1_idx[11:0]);
	wire s1_hit_oh_11 = valids_11 & (meta_11_tag == s1_idx[11:0]);
	wire s1_hit_oh_12 = valids_12 & (meta_12_tag == s1_idx[11:0]);
	wire s1_hit_oh_13 = valids_13 & (meta_13_tag == s1_idx[11:0]);
	wire s1_hit_oh_14 = valids_14 & (meta_14_tag == s1_idx[11:0]);
	wire s1_hit_oh_15 = valids_15 & (meta_15_tag == s1_idx[11:0]);
	wire s1_hit_oh_16 = valids_16 & (meta_16_tag == s1_idx[11:0]);
	wire s1_hit_oh_17 = valids_17 & (meta_17_tag == s1_idx[11:0]);
	wire s1_hit_oh_18 = valids_18 & (meta_18_tag == s1_idx[11:0]);
	wire s1_hit_oh_19 = valids_19 & (meta_19_tag == s1_idx[11:0]);
	wire s1_hit_oh_20 = valids_20 & (meta_20_tag == s1_idx[11:0]);
	wire s1_hit_oh_21 = valids_21 & (meta_21_tag == s1_idx[11:0]);
	wire s1_hit_oh_22 = valids_22 & (meta_22_tag == s1_idx[11:0]);
	wire s1_hit_oh_23 = valids_23 & (meta_23_tag == s1_idx[11:0]);
	wire s1_hit = (((((((((((((((((((((((s1_hit_oh_0 | s1_hit_oh_1) | s1_hit_oh_2) | s1_hit_oh_3) | s1_hit_oh_4) | s1_hit_oh_5) | s1_hit_oh_6) | s1_hit_oh_7) | s1_hit_oh_8) | s1_hit_oh_9) | s1_hit_oh_10) | s1_hit_oh_11) | s1_hit_oh_12) | s1_hit_oh_13) | s1_hit_oh_14) | s1_hit_oh_15) | s1_hit_oh_16) | s1_hit_oh_17) | s1_hit_oh_18) | s1_hit_oh_19) | s1_hit_oh_20) | s1_hit_oh_21) | s1_hit_oh_22) | s1_hit_oh_23) & s1_valid;
	wire [3:0] _s1_hit_meta_T_46 = (((((((((((((((((((((((s1_hit_oh_0 ? meta_0_jal_mask : 4'h0) | (s1_hit_oh_1 ? meta_1_jal_mask : 4'h0)) | (s1_hit_oh_2 ? meta_2_jal_mask : 4'h0)) | (s1_hit_oh_3 ? meta_3_jal_mask : 4'h0)) | (s1_hit_oh_4 ? meta_4_jal_mask : 4'h0)) | (s1_hit_oh_5 ? meta_5_jal_mask : 4'h0)) | (s1_hit_oh_6 ? meta_6_jal_mask : 4'h0)) | (s1_hit_oh_7 ? meta_7_jal_mask : 4'h0)) | (s1_hit_oh_8 ? meta_8_jal_mask : 4'h0)) | (s1_hit_oh_9 ? meta_9_jal_mask : 4'h0)) | (s1_hit_oh_10 ? meta_10_jal_mask : 4'h0)) | (s1_hit_oh_11 ? meta_11_jal_mask : 4'h0)) | (s1_hit_oh_12 ? meta_12_jal_mask : 4'h0)) | (s1_hit_oh_13 ? meta_13_jal_mask : 4'h0)) | (s1_hit_oh_14 ? meta_14_jal_mask : 4'h0)) | (s1_hit_oh_15 ? meta_15_jal_mask : 4'h0)) | (s1_hit_oh_16 ? meta_16_jal_mask : 4'h0)) | (s1_hit_oh_17 ? meta_17_jal_mask : 4'h0)) | (s1_hit_oh_18 ? meta_18_jal_mask : 4'h0)) | (s1_hit_oh_19 ? meta_19_jal_mask : 4'h0)) | (s1_hit_oh_20 ? meta_20_jal_mask : 4'h0)) | (s1_hit_oh_21 ? meta_21_jal_mask : 4'h0)) | (s1_hit_oh_22 ? meta_22_jal_mask : 4'h0)) | (s1_hit_oh_23 ? meta_23_jal_mask : 4'h0);
	wire [3:0] _s1_hit_meta_T_93 = (((((((((((((((((((((((s1_hit_oh_0 ? meta_0_br_mask : 4'h0) | (s1_hit_oh_1 ? meta_1_br_mask : 4'h0)) | (s1_hit_oh_2 ? meta_2_br_mask : 4'h0)) | (s1_hit_oh_3 ? meta_3_br_mask : 4'h0)) | (s1_hit_oh_4 ? meta_4_br_mask : 4'h0)) | (s1_hit_oh_5 ? meta_5_br_mask : 4'h0)) | (s1_hit_oh_6 ? meta_6_br_mask : 4'h0)) | (s1_hit_oh_7 ? meta_7_br_mask : 4'h0)) | (s1_hit_oh_8 ? meta_8_br_mask : 4'h0)) | (s1_hit_oh_9 ? meta_9_br_mask : 4'h0)) | (s1_hit_oh_10 ? meta_10_br_mask : 4'h0)) | (s1_hit_oh_11 ? meta_11_br_mask : 4'h0)) | (s1_hit_oh_12 ? meta_12_br_mask : 4'h0)) | (s1_hit_oh_13 ? meta_13_br_mask : 4'h0)) | (s1_hit_oh_14 ? meta_14_br_mask : 4'h0)) | (s1_hit_oh_15 ? meta_15_br_mask : 4'h0)) | (s1_hit_oh_16 ? meta_16_br_mask : 4'h0)) | (s1_hit_oh_17 ? meta_17_br_mask : 4'h0)) | (s1_hit_oh_18 ? meta_18_br_mask : 4'h0)) | (s1_hit_oh_19 ? meta_19_br_mask : 4'h0)) | (s1_hit_oh_20 ? meta_20_br_mask : 4'h0)) | (s1_hit_oh_21 ? meta_21_br_mask : 4'h0)) | (s1_hit_oh_22 ? meta_22_br_mask : 4'h0)) | (s1_hit_oh_23 ? meta_23_br_mask : 4'h0);
	wire [1:0] _s1_hit_meta_T_140 = (((((((((((((((((((((((s1_hit_oh_0 ? meta_0_cfi_idx : 2'h0) | (s1_hit_oh_1 ? meta_1_cfi_idx : 2'h0)) | (s1_hit_oh_2 ? meta_2_cfi_idx : 2'h0)) | (s1_hit_oh_3 ? meta_3_cfi_idx : 2'h0)) | (s1_hit_oh_4 ? meta_4_cfi_idx : 2'h0)) | (s1_hit_oh_5 ? meta_5_cfi_idx : 2'h0)) | (s1_hit_oh_6 ? meta_6_cfi_idx : 2'h0)) | (s1_hit_oh_7 ? meta_7_cfi_idx : 2'h0)) | (s1_hit_oh_8 ? meta_8_cfi_idx : 2'h0)) | (s1_hit_oh_9 ? meta_9_cfi_idx : 2'h0)) | (s1_hit_oh_10 ? meta_10_cfi_idx : 2'h0)) | (s1_hit_oh_11 ? meta_11_cfi_idx : 2'h0)) | (s1_hit_oh_12 ? meta_12_cfi_idx : 2'h0)) | (s1_hit_oh_13 ? meta_13_cfi_idx : 2'h0)) | (s1_hit_oh_14 ? meta_14_cfi_idx : 2'h0)) | (s1_hit_oh_15 ? meta_15_cfi_idx : 2'h0)) | (s1_hit_oh_16 ? meta_16_cfi_idx : 2'h0)) | (s1_hit_oh_17 ? meta_17_cfi_idx : 2'h0)) | (s1_hit_oh_18 ? meta_18_cfi_idx : 2'h0)) | (s1_hit_oh_19 ? meta_19_cfi_idx : 2'h0)) | (s1_hit_oh_20 ? meta_20_cfi_idx : 2'h0)) | (s1_hit_oh_21 ? meta_21_cfi_idx : 2'h0)) | (s1_hit_oh_22 ? meta_22_cfi_idx : 2'h0)) | (s1_hit_oh_23 ? meta_23_cfi_idx : 2'h0);
	wire _s1_hit_meta_T_187 = (((((((((((((((((((((((s1_hit_oh_0 & meta_0_ctr[1]) | (s1_hit_oh_1 & meta_1_ctr[1])) | (s1_hit_oh_2 & meta_2_ctr[1])) | (s1_hit_oh_3 & meta_3_ctr[1])) | (s1_hit_oh_4 & meta_4_ctr[1])) | (s1_hit_oh_5 & meta_5_ctr[1])) | (s1_hit_oh_6 & meta_6_ctr[1])) | (s1_hit_oh_7 & meta_7_ctr[1])) | (s1_hit_oh_8 & meta_8_ctr[1])) | (s1_hit_oh_9 & meta_9_ctr[1])) | (s1_hit_oh_10 & meta_10_ctr[1])) | (s1_hit_oh_11 & meta_11_ctr[1])) | (s1_hit_oh_12 & meta_12_ctr[1])) | (s1_hit_oh_13 & meta_13_ctr[1])) | (s1_hit_oh_14 & meta_14_ctr[1])) | (s1_hit_oh_15 & meta_15_ctr[1])) | (s1_hit_oh_16 & meta_16_ctr[1])) | (s1_hit_oh_17 & meta_17_ctr[1])) | (s1_hit_oh_18 & meta_18_ctr[1])) | (s1_hit_oh_19 & meta_19_ctr[1])) | (s1_hit_oh_20 & meta_20_ctr[1])) | (s1_hit_oh_21 & meta_21_ctr[1])) | (s1_hit_oh_22 & meta_22_ctr[1])) | (s1_hit_oh_23 & meta_23_ctr[1]);
	wire [39:0] _s1_hit_btb_T_46 = (((((((((((((((((((((((s1_hit_oh_0 ? btb_0_0 : 40'h0000000000) | (s1_hit_oh_1 ? btb_1_0 : 40'h0000000000)) | (s1_hit_oh_2 ? btb_2_0 : 40'h0000000000)) | (s1_hit_oh_3 ? btb_3_0 : 40'h0000000000)) | (s1_hit_oh_4 ? btb_4_0 : 40'h0000000000)) | (s1_hit_oh_5 ? btb_5_0 : 40'h0000000000)) | (s1_hit_oh_6 ? btb_6_0 : 40'h0000000000)) | (s1_hit_oh_7 ? btb_7_0 : 40'h0000000000)) | (s1_hit_oh_8 ? btb_8_0 : 40'h0000000000)) | (s1_hit_oh_9 ? btb_9_0 : 40'h0000000000)) | (s1_hit_oh_10 ? btb_10_0 : 40'h0000000000)) | (s1_hit_oh_11 ? btb_11_0 : 40'h0000000000)) | (s1_hit_oh_12 ? btb_12_0 : 40'h0000000000)) | (s1_hit_oh_13 ? btb_13_0 : 40'h0000000000)) | (s1_hit_oh_14 ? btb_14_0 : 40'h0000000000)) | (s1_hit_oh_15 ? btb_15_0 : 40'h0000000000)) | (s1_hit_oh_16 ? btb_16_0 : 40'h0000000000)) | (s1_hit_oh_17 ? btb_17_0 : 40'h0000000000)) | (s1_hit_oh_18 ? btb_18_0 : 40'h0000000000)) | (s1_hit_oh_19 ? btb_19_0 : 40'h0000000000)) | (s1_hit_oh_20 ? btb_20_0 : 40'h0000000000)) | (s1_hit_oh_21 ? btb_21_0 : 40'h0000000000)) | (s1_hit_oh_22 ? btb_22_0 : 40'h0000000000)) | (s1_hit_oh_23 ? btb_23_0 : 40'h0000000000);
	wire [39:0] _s1_hit_btb_T_93 = (((((((((((((((((((((((s1_hit_oh_0 ? btb_0_1 : 40'h0000000000) | (s1_hit_oh_1 ? btb_1_1 : 40'h0000000000)) | (s1_hit_oh_2 ? btb_2_1 : 40'h0000000000)) | (s1_hit_oh_3 ? btb_3_1 : 40'h0000000000)) | (s1_hit_oh_4 ? btb_4_1 : 40'h0000000000)) | (s1_hit_oh_5 ? btb_5_1 : 40'h0000000000)) | (s1_hit_oh_6 ? btb_6_1 : 40'h0000000000)) | (s1_hit_oh_7 ? btb_7_1 : 40'h0000000000)) | (s1_hit_oh_8 ? btb_8_1 : 40'h0000000000)) | (s1_hit_oh_9 ? btb_9_1 : 40'h0000000000)) | (s1_hit_oh_10 ? btb_10_1 : 40'h0000000000)) | (s1_hit_oh_11 ? btb_11_1 : 40'h0000000000)) | (s1_hit_oh_12 ? btb_12_1 : 40'h0000000000)) | (s1_hit_oh_13 ? btb_13_1 : 40'h0000000000)) | (s1_hit_oh_14 ? btb_14_1 : 40'h0000000000)) | (s1_hit_oh_15 ? btb_15_1 : 40'h0000000000)) | (s1_hit_oh_16 ? btb_16_1 : 40'h0000000000)) | (s1_hit_oh_17 ? btb_17_1 : 40'h0000000000)) | (s1_hit_oh_18 ? btb_18_1 : 40'h0000000000)) | (s1_hit_oh_19 ? btb_19_1 : 40'h0000000000)) | (s1_hit_oh_20 ? btb_20_1 : 40'h0000000000)) | (s1_hit_oh_21 ? btb_21_1 : 40'h0000000000)) | (s1_hit_oh_22 ? btb_22_1 : 40'h0000000000)) | (s1_hit_oh_23 ? btb_23_1 : 40'h0000000000);
	wire s1_resp_0_valid = s1_hit & (((_s1_hit_meta_T_140 == 2'h0) & _s1_hit_meta_T_93[0]) | _s1_hit_meta_T_46[0]);
	wire [39:0] s1_resp_0_bits = (_s1_hit_meta_T_93[0] ? _s1_hit_btb_T_93 : _s1_hit_btb_T_46);
	wire s1_is_br_0 = s1_hit & _s1_hit_meta_T_93[0];
	wire s1_is_jal_0 = s1_hit & _s1_hit_meta_T_46[0];
	wire s1_resp_1_valid = s1_hit & (((_s1_hit_meta_T_140 == 2'h1) & _s1_hit_meta_T_93[1]) | _s1_hit_meta_T_46[1]);
	wire [39:0] s1_resp_1_bits = (_s1_hit_meta_T_93[1] ? _s1_hit_btb_T_93 : _s1_hit_btb_T_46);
	wire s1_is_br_1 = s1_hit & _s1_hit_meta_T_93[1];
	wire s1_is_jal_1 = s1_hit & _s1_hit_meta_T_46[1];
	wire s1_resp_2_valid = s1_hit & (((_s1_hit_meta_T_140 == 2'h2) & _s1_hit_meta_T_93[2]) | _s1_hit_meta_T_46[2]);
	wire [39:0] s1_resp_2_bits = (_s1_hit_meta_T_93[2] ? _s1_hit_btb_T_93 : _s1_hit_btb_T_46);
	wire s1_is_br_2 = s1_hit & _s1_hit_meta_T_93[2];
	wire s1_is_jal_2 = s1_hit & _s1_hit_meta_T_46[2];
	wire s1_resp_3_valid = s1_hit & ((&_s1_hit_meta_T_140 & _s1_hit_meta_T_93[3]) | _s1_hit_meta_T_46[3]);
	wire [39:0] s1_resp_3_bits = (_s1_hit_meta_T_93[3] ? _s1_hit_btb_T_93 : _s1_hit_btb_T_46);
	wire s1_is_br_3 = s1_hit & _s1_hit_meta_T_93[3];
	wire s1_is_jal_3 = s1_hit & _s1_hit_meta_T_46[3];
	reg io_resp_f2_0_REG_is_br;
	reg io_resp_f2_0_REG_is_jal;
	reg io_resp_f2_0_REG_predicted_pc_valid;
	reg [39:0] io_resp_f2_0_REG_predicted_pc_bits;
	reg io_resp_f3_0_REG_is_br;
	reg io_resp_f3_0_REG_is_jal;
	reg io_resp_f3_0_REG_predicted_pc_valid;
	reg [39:0] io_resp_f3_0_REG_predicted_pc_bits;
	reg io_resp_f2_1_REG_is_br;
	reg io_resp_f2_1_REG_is_jal;
	reg io_resp_f2_1_REG_predicted_pc_valid;
	reg [39:0] io_resp_f2_1_REG_predicted_pc_bits;
	reg io_resp_f3_1_REG_is_br;
	reg io_resp_f3_1_REG_is_jal;
	reg io_resp_f3_1_REG_predicted_pc_valid;
	reg [39:0] io_resp_f3_1_REG_predicted_pc_bits;
	reg io_resp_f2_2_REG_is_br;
	reg io_resp_f2_2_REG_is_jal;
	reg io_resp_f2_2_REG_predicted_pc_valid;
	reg [39:0] io_resp_f2_2_REG_predicted_pc_bits;
	reg io_resp_f3_2_REG_is_br;
	reg io_resp_f3_2_REG_is_jal;
	reg io_resp_f3_2_REG_predicted_pc_valid;
	reg [39:0] io_resp_f3_2_REG_predicted_pc_bits;
	reg io_resp_f2_3_REG_is_br;
	reg io_resp_f2_3_REG_is_jal;
	reg io_resp_f2_3_REG_predicted_pc_valid;
	reg [39:0] io_resp_f2_3_REG_predicted_pc_bits;
	reg io_resp_f3_3_REG_is_br;
	reg io_resp_f3_3_REG_is_jal;
	reg io_resp_f3_3_REG_predicted_pc_valid;
	reg [39:0] io_resp_f3_3_REG_predicted_pc_bits;
	reg io_f3_meta_REG;
	reg io_f3_meta_REG_1;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg s1_update_hit_oh_1;
		reg s1_update_hit_oh_2;
		reg s1_update_hit_oh_3;
		reg s1_update_hit_oh_4;
		reg s1_update_hit_oh_5;
		reg s1_update_hit_oh_6;
		reg s1_update_hit_oh_7;
		reg s1_update_hit_oh_8;
		reg s1_update_hit_oh_9;
		reg s1_update_hit_oh_10;
		reg s1_update_hit_oh_11;
		reg s1_update_hit_oh_12;
		reg s1_update_hit_oh_13;
		reg s1_update_hit_oh_14;
		reg s1_update_hit_oh_15;
		reg s1_update_hit_oh_16;
		reg s1_update_hit_oh_17;
		reg s1_update_hit_oh_18;
		reg s1_update_hit_oh_19;
		reg s1_update_hit_oh_20;
		reg s1_update_hit_oh_21;
		reg s1_update_hit_oh_22;
		reg s1_update_hit_oh_23;
		reg s1_update_hit;
		reg [6:0] _s1_update_write_way_T_4;
		reg [2:0] _s1_update_write_way_T_6;
		reg [4:0] s1_update_write_way;
		reg _GEN;
		reg _GEN_0;
		reg _GEN_1;
		reg _GEN_2;
		reg _GEN_3;
		reg _GEN_4;
		reg _GEN_5;
		reg _GEN_6;
		reg _GEN_7;
		reg _GEN_8;
		reg _GEN_9;
		reg _GEN_10;
		reg _GEN_11;
		reg _GEN_12;
		reg _GEN_13;
		reg _GEN_14;
		reg _GEN_15;
		reg _GEN_16;
		reg _GEN_17;
		reg _GEN_18;
		reg _GEN_19;
		reg _GEN_20;
		reg _GEN_21;
		reg _GEN_22;
		reg _GEN_23;
		reg [1:0] _wmeta_ctr_T_1;
		reg [3:0] _GEN_24;
		reg [3:0] _wmeta_jal_mask_T_4;
		reg [63:0] _GEN_25;
		reg [63:0] _GEN_26;
		reg [127:0] _GEN_27;
		reg [3:0] wmeta_br_mask;
		reg _wmeta_ctr_T_2;
		reg wmeta_ctr_old_bim_sat_ntaken;
		reg _wmeta_ctr_T_3;
		reg _wmeta_ctr_T_5;
		reg [1:0] _wmeta_ctr_T_20;
		reg [1:0] _wmeta_ctr_T_22;
		reg [1:0] _wmeta_ctr_T_13;
		reg [3:0] _wmeta_ctr_T_15;
		reg [127:0] _GEN_28;
		reg [3:0] _wmeta_jal_mask_T_10;
		reg _GEN_29;
		s1_update_hit_oh_1 = (meta_1_tag == s1_update_idx[11:0]) & valids_1;
		s1_update_hit_oh_2 = (meta_2_tag == s1_update_idx[11:0]) & valids_2;
		s1_update_hit_oh_3 = (meta_3_tag == s1_update_idx[11:0]) & valids_3;
		s1_update_hit_oh_4 = (meta_4_tag == s1_update_idx[11:0]) & valids_4;
		s1_update_hit_oh_5 = (meta_5_tag == s1_update_idx[11:0]) & valids_5;
		s1_update_hit_oh_6 = (meta_6_tag == s1_update_idx[11:0]) & valids_6;
		s1_update_hit_oh_7 = (meta_7_tag == s1_update_idx[11:0]) & valids_7;
		s1_update_hit_oh_8 = (meta_8_tag == s1_update_idx[11:0]) & valids_8;
		s1_update_hit_oh_9 = (meta_9_tag == s1_update_idx[11:0]) & valids_9;
		s1_update_hit_oh_10 = (meta_10_tag == s1_update_idx[11:0]) & valids_10;
		s1_update_hit_oh_11 = (meta_11_tag == s1_update_idx[11:0]) & valids_11;
		s1_update_hit_oh_12 = (meta_12_tag == s1_update_idx[11:0]) & valids_12;
		s1_update_hit_oh_13 = (meta_13_tag == s1_update_idx[11:0]) & valids_13;
		s1_update_hit_oh_14 = (meta_14_tag == s1_update_idx[11:0]) & valids_14;
		s1_update_hit_oh_15 = (meta_15_tag == s1_update_idx[11:0]) & valids_15;
		s1_update_hit_oh_16 = (meta_16_tag == s1_update_idx[11:0]) & valids_16;
		s1_update_hit_oh_17 = (meta_17_tag == s1_update_idx[11:0]) & valids_17;
		s1_update_hit_oh_18 = (meta_18_tag == s1_update_idx[11:0]) & valids_18;
		s1_update_hit_oh_19 = (meta_19_tag == s1_update_idx[11:0]) & valids_19;
		s1_update_hit_oh_20 = (meta_20_tag == s1_update_idx[11:0]) & valids_20;
		s1_update_hit_oh_21 = (meta_21_tag == s1_update_idx[11:0]) & valids_21;
		s1_update_hit_oh_22 = (meta_22_tag == s1_update_idx[11:0]) & valids_22;
		s1_update_hit_oh_23 = (meta_23_tag == s1_update_idx[11:0]) & valids_23;
		s1_update_hit = ((((((((((((((((((((((((meta_0_tag == s1_update_idx[11:0]) & valids_0) | s1_update_hit_oh_1) | s1_update_hit_oh_2) | s1_update_hit_oh_3) | s1_update_hit_oh_4) | s1_update_hit_oh_5) | s1_update_hit_oh_6) | s1_update_hit_oh_7) | s1_update_hit_oh_8) | s1_update_hit_oh_9) | s1_update_hit_oh_10) | s1_update_hit_oh_11) | s1_update_hit_oh_12) | s1_update_hit_oh_13) | s1_update_hit_oh_14) | s1_update_hit_oh_15) | s1_update_hit_oh_16) | s1_update_hit_oh_17) | s1_update_hit_oh_18) | s1_update_hit_oh_19) | s1_update_hit_oh_20) | s1_update_hit_oh_21) | s1_update_hit_oh_22) | s1_update_hit_oh_23;
		_s1_update_write_way_T_4 = {s1_update_hit_oh_15, s1_update_hit_oh_14, s1_update_hit_oh_13, s1_update_hit_oh_12, s1_update_hit_oh_11, s1_update_hit_oh_10, s1_update_hit_oh_9} | {s1_update_hit_oh_23 | s1_update_hit_oh_7, s1_update_hit_oh_22 | s1_update_hit_oh_6, s1_update_hit_oh_21 | s1_update_hit_oh_5, s1_update_hit_oh_20 | s1_update_hit_oh_4, s1_update_hit_oh_19 | s1_update_hit_oh_3, s1_update_hit_oh_18 | s1_update_hit_oh_2, s1_update_hit_oh_17 | s1_update_hit_oh_1};
		_s1_update_write_way_T_6 = _s1_update_write_way_T_4[6:4] | _s1_update_write_way_T_4[2:0];
		s1_update_write_way = (s1_update_hit ? {|{s1_update_hit_oh_23, s1_update_hit_oh_22, s1_update_hit_oh_21, s1_update_hit_oh_20, s1_update_hit_oh_19, s1_update_hit_oh_18, s1_update_hit_oh_17, s1_update_hit_oh_16}, |{s1_update_hit_oh_15, s1_update_hit_oh_14, s1_update_hit_oh_13, s1_update_hit_oh_12, s1_update_hit_oh_11, s1_update_hit_oh_10, s1_update_hit_oh_9, s1_update_hit_oh_8}, |_s1_update_write_way_T_4[6:3], |_s1_update_write_way_T_6[2:1], _s1_update_write_way_T_6[2] | _s1_update_write_way_T_6[0]} : {_s1_update_write_way_prng_io_out_4, _s1_update_write_way_prng_io_out_3, _s1_update_write_way_prng_io_out_2, _s1_update_write_way_prng_io_out_1, _s1_update_write_way_prng_io_out_0});
		_GEN = s1_update_valid & ~((s1_update_bits_is_mispredict_update | s1_update_bits_is_repair_update) | (|s1_update_bits_btb_mispredicts));
		_GEN_0 = s1_update_write_way == 5'h00;
		_GEN_1 = s1_update_write_way == 5'h01;
		_GEN_2 = s1_update_write_way == 5'h02;
		_GEN_3 = s1_update_write_way == 5'h03;
		_GEN_4 = s1_update_write_way == 5'h04;
		_GEN_5 = s1_update_write_way == 5'h05;
		_GEN_6 = s1_update_write_way == 5'h06;
		_GEN_7 = s1_update_write_way == 5'h07;
		_GEN_8 = s1_update_write_way == 5'h08;
		_GEN_9 = s1_update_write_way == 5'h09;
		_GEN_10 = s1_update_write_way == 5'h0a;
		_GEN_11 = s1_update_write_way == 5'h0b;
		_GEN_12 = s1_update_write_way == 5'h0c;
		_GEN_13 = s1_update_write_way == 5'h0d;
		_GEN_14 = s1_update_write_way == 5'h0e;
		_GEN_15 = s1_update_write_way == 5'h0f;
		_GEN_16 = s1_update_write_way == 5'h10;
		_GEN_17 = s1_update_write_way == 5'h11;
		_GEN_18 = s1_update_write_way == 5'h12;
		_GEN_19 = s1_update_write_way == 5'h13;
		_GEN_20 = s1_update_write_way == 5'h14;
		_GEN_21 = s1_update_write_way == 5'h15;
		_GEN_22 = s1_update_write_way == 5'h16;
		_GEN_23 = s1_update_write_way == 5'h17;
		_wmeta_ctr_T_1 = {2 {s1_update_bits_cfi_idx_valid & s1_update_bits_cfi_taken}};
		_GEN_24 = {2'h0, s1_update_bits_cfi_idx_bits};
		_wmeta_jal_mask_T_4 = (4'h1 << _GEN_24) & {4 {s1_update_bits_cfi_idx_valid & (s1_update_bits_cfi_is_jal | s1_update_bits_cfi_is_jalr)}};
		_GEN_25 = {meta_0_ctr, meta_0_ctr, meta_0_ctr, meta_0_ctr, meta_0_ctr, meta_0_ctr, meta_0_ctr, meta_0_ctr, meta_23_ctr, meta_22_ctr, meta_21_ctr, meta_20_ctr, meta_19_ctr, meta_18_ctr, meta_17_ctr, meta_16_ctr, meta_15_ctr, meta_14_ctr, meta_13_ctr, meta_12_ctr, meta_11_ctr, meta_10_ctr, meta_9_ctr, meta_8_ctr, meta_7_ctr, meta_6_ctr, meta_5_ctr, meta_4_ctr, meta_3_ctr, meta_2_ctr, meta_1_ctr, meta_0_ctr};
		_GEN_26 = {meta_0_cfi_idx, meta_0_cfi_idx, meta_0_cfi_idx, meta_0_cfi_idx, meta_0_cfi_idx, meta_0_cfi_idx, meta_0_cfi_idx, meta_0_cfi_idx, meta_23_cfi_idx, meta_22_cfi_idx, meta_21_cfi_idx, meta_20_cfi_idx, meta_19_cfi_idx, meta_18_cfi_idx, meta_17_cfi_idx, meta_16_cfi_idx, meta_15_cfi_idx, meta_14_cfi_idx, meta_13_cfi_idx, meta_12_cfi_idx, meta_11_cfi_idx, meta_10_cfi_idx, meta_9_cfi_idx, meta_8_cfi_idx, meta_7_cfi_idx, meta_6_cfi_idx, meta_5_cfi_idx, meta_4_cfi_idx, meta_3_cfi_idx, meta_2_cfi_idx, meta_1_cfi_idx, meta_0_cfi_idx};
		_GEN_27 = {meta_0_br_mask, meta_0_br_mask, meta_0_br_mask, meta_0_br_mask, meta_0_br_mask, meta_0_br_mask, meta_0_br_mask, meta_0_br_mask, meta_23_br_mask, meta_22_br_mask, meta_21_br_mask, meta_20_br_mask, meta_19_br_mask, meta_18_br_mask, meta_17_br_mask, meta_16_br_mask, meta_15_br_mask, meta_14_br_mask, meta_13_br_mask, meta_12_br_mask, meta_11_br_mask, meta_10_br_mask, meta_9_br_mask, meta_8_br_mask, meta_7_br_mask, meta_6_br_mask, meta_5_br_mask, meta_4_br_mask, meta_3_br_mask, meta_2_br_mask, meta_1_br_mask, meta_0_br_mask};
		wmeta_br_mask = ({4 {s1_update_hit}} & _GEN_27[s1_update_write_way * 4+:4]) | s1_update_bits_br_mask;
		_wmeta_ctr_T_2 = s1_update_bits_cfi_idx_bits == _GEN_26[s1_update_write_way * 2+:2];
		wmeta_ctr_old_bim_sat_ntaken = _GEN_25[s1_update_write_way * 2+:2] == 2'h0;
		_wmeta_ctr_T_3 = &_GEN_25[s1_update_write_way * 2+:2] & s1_update_bits_cfi_taken;
		_wmeta_ctr_T_5 = wmeta_ctr_old_bim_sat_ntaken & ~s1_update_bits_cfi_taken;
		_wmeta_ctr_T_20 = _GEN_25[s1_update_write_way * 2+:2] + 2'h1;
		_wmeta_ctr_T_22 = _GEN_25[s1_update_write_way * 2+:2] - 2'h1;
		_wmeta_ctr_T_13 = {2 {s1_update_bits_cfi_taken}};
		_wmeta_ctr_T_15 = s1_update_bits_br_mask >> _GEN_26[s1_update_write_way * 2+:2];
		_GEN_28 = {meta_0_jal_mask, meta_0_jal_mask, meta_0_jal_mask, meta_0_jal_mask, meta_0_jal_mask, meta_0_jal_mask, meta_0_jal_mask, meta_0_jal_mask, meta_23_jal_mask, meta_22_jal_mask, meta_21_jal_mask, meta_20_jal_mask, meta_19_jal_mask, meta_18_jal_mask, meta_17_jal_mask, meta_16_jal_mask, meta_15_jal_mask, meta_14_jal_mask, meta_13_jal_mask, meta_12_jal_mask, meta_11_jal_mask, meta_10_jal_mask, meta_9_jal_mask, meta_8_jal_mask, meta_7_jal_mask, meta_6_jal_mask, meta_5_jal_mask, meta_4_jal_mask, meta_3_jal_mask, meta_2_jal_mask, meta_1_jal_mask, meta_0_jal_mask};
		_wmeta_jal_mask_T_10 = _GEN_28[s1_update_write_way * 4+:4] | ((4'h1 << _GEN_24) & {4 {s1_update_bits_cfi_idx_valid & (s1_update_bits_cfi_is_jal | s1_update_bits_cfi_is_jalr)}});
		_GEN_29 = s1_update_bits_cfi_idx_valid | (|s1_update_bits_br_mask);
		s1_idx <= io_f0_pc[39:3];
		s1_valid <= io_f0_valid;
		s1_update_valid <= io_update_valid;
		s1_update_bits_is_mispredict_update <= io_update_bits_is_mispredict_update;
		s1_update_bits_is_repair_update <= io_update_bits_is_repair_update;
		s1_update_bits_btb_mispredicts <= io_update_bits_btb_mispredicts;
		s1_update_bits_br_mask <= io_update_bits_br_mask;
		s1_update_bits_cfi_idx_valid <= io_update_bits_cfi_idx_valid;
		s1_update_bits_cfi_idx_bits <= io_update_bits_cfi_idx_bits;
		s1_update_bits_cfi_taken <= io_update_bits_cfi_taken;
		s1_update_bits_cfi_is_br <= io_update_bits_cfi_is_br;
		s1_update_bits_cfi_is_jal <= io_update_bits_cfi_is_jal;
		s1_update_bits_cfi_is_jalr <= io_update_bits_cfi_is_jalr;
		s1_update_bits_target <= io_update_bits_target;
		s1_update_idx <= io_update_bits_pc[39:3];
		if ((_GEN & _GEN_29) & _GEN_0) begin
			meta_0_tag <= s1_update_idx[11:0];
			if (s1_update_hit) begin
				if (s1_update_bits_cfi_idx_valid) begin
					if (_wmeta_ctr_T_2) begin
						if (_wmeta_ctr_T_3)
							meta_0_ctr <= 2'h3;
						else if (_wmeta_ctr_T_5)
							meta_0_ctr <= 2'h0;
						else if (s1_update_bits_cfi_taken)
							meta_0_ctr <= _wmeta_ctr_T_20;
						else
							meta_0_ctr <= _wmeta_ctr_T_22;
					end
					else
						meta_0_ctr <= _wmeta_ctr_T_13;
				end
				else if (_wmeta_ctr_T_15[0]) begin
					if (wmeta_ctr_old_bim_sat_ntaken)
						meta_0_ctr <= 2'h0;
					else
						meta_0_ctr <= _wmeta_ctr_T_22;
				end
				else
					meta_0_ctr <= _GEN_25[s1_update_write_way * 2+:2];
				meta_0_jal_mask <= _wmeta_jal_mask_T_10;
			end
			else begin
				meta_0_ctr <= _wmeta_ctr_T_1;
				meta_0_jal_mask <= _wmeta_jal_mask_T_4;
			end
			if (s1_update_bits_cfi_idx_valid)
				meta_0_cfi_idx <= s1_update_bits_cfi_idx_bits;
			else
				meta_0_cfi_idx <= _GEN_26[s1_update_write_way * 2+:2];
			meta_0_br_mask <= wmeta_br_mask;
		end
		if ((_GEN & _GEN_29) & _GEN_1) begin
			meta_1_tag <= s1_update_idx[11:0];
			if (s1_update_hit) begin
				if (s1_update_bits_cfi_idx_valid) begin
					if (_wmeta_ctr_T_2) begin
						if (_wmeta_ctr_T_3)
							meta_1_ctr <= 2'h3;
						else if (_wmeta_ctr_T_5)
							meta_1_ctr <= 2'h0;
						else if (s1_update_bits_cfi_taken)
							meta_1_ctr <= _wmeta_ctr_T_20;
						else
							meta_1_ctr <= _wmeta_ctr_T_22;
					end
					else
						meta_1_ctr <= _wmeta_ctr_T_13;
				end
				else if (_wmeta_ctr_T_15[0]) begin
					if (wmeta_ctr_old_bim_sat_ntaken)
						meta_1_ctr <= 2'h0;
					else
						meta_1_ctr <= _wmeta_ctr_T_22;
				end
				else
					meta_1_ctr <= _GEN_25[s1_update_write_way * 2+:2];
				meta_1_jal_mask <= _wmeta_jal_mask_T_10;
			end
			else begin
				meta_1_ctr <= _wmeta_ctr_T_1;
				meta_1_jal_mask <= _wmeta_jal_mask_T_4;
			end
			if (s1_update_bits_cfi_idx_valid)
				meta_1_cfi_idx <= s1_update_bits_cfi_idx_bits;
			else
				meta_1_cfi_idx <= _GEN_26[s1_update_write_way * 2+:2];
			meta_1_br_mask <= wmeta_br_mask;
		end
		if ((_GEN & _GEN_29) & _GEN_2) begin
			meta_2_tag <= s1_update_idx[11:0];
			if (s1_update_hit) begin
				if (s1_update_bits_cfi_idx_valid) begin
					if (_wmeta_ctr_T_2) begin
						if (_wmeta_ctr_T_3)
							meta_2_ctr <= 2'h3;
						else if (_wmeta_ctr_T_5)
							meta_2_ctr <= 2'h0;
						else if (s1_update_bits_cfi_taken)
							meta_2_ctr <= _wmeta_ctr_T_20;
						else
							meta_2_ctr <= _wmeta_ctr_T_22;
					end
					else
						meta_2_ctr <= _wmeta_ctr_T_13;
				end
				else if (_wmeta_ctr_T_15[0]) begin
					if (wmeta_ctr_old_bim_sat_ntaken)
						meta_2_ctr <= 2'h0;
					else
						meta_2_ctr <= _wmeta_ctr_T_22;
				end
				else
					meta_2_ctr <= _GEN_25[s1_update_write_way * 2+:2];
				meta_2_jal_mask <= _wmeta_jal_mask_T_10;
			end
			else begin
				meta_2_ctr <= _wmeta_ctr_T_1;
				meta_2_jal_mask <= _wmeta_jal_mask_T_4;
			end
			if (s1_update_bits_cfi_idx_valid)
				meta_2_cfi_idx <= s1_update_bits_cfi_idx_bits;
			else
				meta_2_cfi_idx <= _GEN_26[s1_update_write_way * 2+:2];
			meta_2_br_mask <= wmeta_br_mask;
		end
		if ((_GEN & _GEN_29) & _GEN_3) begin
			meta_3_tag <= s1_update_idx[11:0];
			if (s1_update_hit) begin
				if (s1_update_bits_cfi_idx_valid) begin
					if (_wmeta_ctr_T_2) begin
						if (_wmeta_ctr_T_3)
							meta_3_ctr <= 2'h3;
						else if (_wmeta_ctr_T_5)
							meta_3_ctr <= 2'h0;
						else if (s1_update_bits_cfi_taken)
							meta_3_ctr <= _wmeta_ctr_T_20;
						else
							meta_3_ctr <= _wmeta_ctr_T_22;
					end
					else
						meta_3_ctr <= _wmeta_ctr_T_13;
				end
				else if (_wmeta_ctr_T_15[0]) begin
					if (wmeta_ctr_old_bim_sat_ntaken)
						meta_3_ctr <= 2'h0;
					else
						meta_3_ctr <= _wmeta_ctr_T_22;
				end
				else
					meta_3_ctr <= _GEN_25[s1_update_write_way * 2+:2];
				meta_3_jal_mask <= _wmeta_jal_mask_T_10;
			end
			else begin
				meta_3_ctr <= _wmeta_ctr_T_1;
				meta_3_jal_mask <= _wmeta_jal_mask_T_4;
			end
			if (s1_update_bits_cfi_idx_valid)
				meta_3_cfi_idx <= s1_update_bits_cfi_idx_bits;
			else
				meta_3_cfi_idx <= _GEN_26[s1_update_write_way * 2+:2];
			meta_3_br_mask <= wmeta_br_mask;
		end
		if ((_GEN & _GEN_29) & _GEN_4) begin
			meta_4_tag <= s1_update_idx[11:0];
			if (s1_update_hit) begin
				if (s1_update_bits_cfi_idx_valid) begin
					if (_wmeta_ctr_T_2) begin
						if (_wmeta_ctr_T_3)
							meta_4_ctr <= 2'h3;
						else if (_wmeta_ctr_T_5)
							meta_4_ctr <= 2'h0;
						else if (s1_update_bits_cfi_taken)
							meta_4_ctr <= _wmeta_ctr_T_20;
						else
							meta_4_ctr <= _wmeta_ctr_T_22;
					end
					else
						meta_4_ctr <= _wmeta_ctr_T_13;
				end
				else if (_wmeta_ctr_T_15[0]) begin
					if (wmeta_ctr_old_bim_sat_ntaken)
						meta_4_ctr <= 2'h0;
					else
						meta_4_ctr <= _wmeta_ctr_T_22;
				end
				else
					meta_4_ctr <= _GEN_25[s1_update_write_way * 2+:2];
				meta_4_jal_mask <= _wmeta_jal_mask_T_10;
			end
			else begin
				meta_4_ctr <= _wmeta_ctr_T_1;
				meta_4_jal_mask <= _wmeta_jal_mask_T_4;
			end
			if (s1_update_bits_cfi_idx_valid)
				meta_4_cfi_idx <= s1_update_bits_cfi_idx_bits;
			else
				meta_4_cfi_idx <= _GEN_26[s1_update_write_way * 2+:2];
			meta_4_br_mask <= wmeta_br_mask;
		end
		if ((_GEN & _GEN_29) & _GEN_5) begin
			meta_5_tag <= s1_update_idx[11:0];
			if (s1_update_hit) begin
				if (s1_update_bits_cfi_idx_valid) begin
					if (_wmeta_ctr_T_2) begin
						if (_wmeta_ctr_T_3)
							meta_5_ctr <= 2'h3;
						else if (_wmeta_ctr_T_5)
							meta_5_ctr <= 2'h0;
						else if (s1_update_bits_cfi_taken)
							meta_5_ctr <= _wmeta_ctr_T_20;
						else
							meta_5_ctr <= _wmeta_ctr_T_22;
					end
					else
						meta_5_ctr <= _wmeta_ctr_T_13;
				end
				else if (_wmeta_ctr_T_15[0]) begin
					if (wmeta_ctr_old_bim_sat_ntaken)
						meta_5_ctr <= 2'h0;
					else
						meta_5_ctr <= _wmeta_ctr_T_22;
				end
				else
					meta_5_ctr <= _GEN_25[s1_update_write_way * 2+:2];
				meta_5_jal_mask <= _wmeta_jal_mask_T_10;
			end
			else begin
				meta_5_ctr <= _wmeta_ctr_T_1;
				meta_5_jal_mask <= _wmeta_jal_mask_T_4;
			end
			if (s1_update_bits_cfi_idx_valid)
				meta_5_cfi_idx <= s1_update_bits_cfi_idx_bits;
			else
				meta_5_cfi_idx <= _GEN_26[s1_update_write_way * 2+:2];
			meta_5_br_mask <= wmeta_br_mask;
		end
		if ((_GEN & _GEN_29) & _GEN_6) begin
			meta_6_tag <= s1_update_idx[11:0];
			if (s1_update_hit) begin
				if (s1_update_bits_cfi_idx_valid) begin
					if (_wmeta_ctr_T_2) begin
						if (_wmeta_ctr_T_3)
							meta_6_ctr <= 2'h3;
						else if (_wmeta_ctr_T_5)
							meta_6_ctr <= 2'h0;
						else if (s1_update_bits_cfi_taken)
							meta_6_ctr <= _wmeta_ctr_T_20;
						else
							meta_6_ctr <= _wmeta_ctr_T_22;
					end
					else
						meta_6_ctr <= _wmeta_ctr_T_13;
				end
				else if (_wmeta_ctr_T_15[0]) begin
					if (wmeta_ctr_old_bim_sat_ntaken)
						meta_6_ctr <= 2'h0;
					else
						meta_6_ctr <= _wmeta_ctr_T_22;
				end
				else
					meta_6_ctr <= _GEN_25[s1_update_write_way * 2+:2];
				meta_6_jal_mask <= _wmeta_jal_mask_T_10;
			end
			else begin
				meta_6_ctr <= _wmeta_ctr_T_1;
				meta_6_jal_mask <= _wmeta_jal_mask_T_4;
			end
			if (s1_update_bits_cfi_idx_valid)
				meta_6_cfi_idx <= s1_update_bits_cfi_idx_bits;
			else
				meta_6_cfi_idx <= _GEN_26[s1_update_write_way * 2+:2];
			meta_6_br_mask <= wmeta_br_mask;
		end
		if ((_GEN & _GEN_29) & _GEN_7) begin
			meta_7_tag <= s1_update_idx[11:0];
			if (s1_update_hit) begin
				if (s1_update_bits_cfi_idx_valid) begin
					if (_wmeta_ctr_T_2) begin
						if (_wmeta_ctr_T_3)
							meta_7_ctr <= 2'h3;
						else if (_wmeta_ctr_T_5)
							meta_7_ctr <= 2'h0;
						else if (s1_update_bits_cfi_taken)
							meta_7_ctr <= _wmeta_ctr_T_20;
						else
							meta_7_ctr <= _wmeta_ctr_T_22;
					end
					else
						meta_7_ctr <= _wmeta_ctr_T_13;
				end
				else if (_wmeta_ctr_T_15[0]) begin
					if (wmeta_ctr_old_bim_sat_ntaken)
						meta_7_ctr <= 2'h0;
					else
						meta_7_ctr <= _wmeta_ctr_T_22;
				end
				else
					meta_7_ctr <= _GEN_25[s1_update_write_way * 2+:2];
				meta_7_jal_mask <= _wmeta_jal_mask_T_10;
			end
			else begin
				meta_7_ctr <= _wmeta_ctr_T_1;
				meta_7_jal_mask <= _wmeta_jal_mask_T_4;
			end
			if (s1_update_bits_cfi_idx_valid)
				meta_7_cfi_idx <= s1_update_bits_cfi_idx_bits;
			else
				meta_7_cfi_idx <= _GEN_26[s1_update_write_way * 2+:2];
			meta_7_br_mask <= wmeta_br_mask;
		end
		if ((_GEN & _GEN_29) & _GEN_8) begin
			meta_8_tag <= s1_update_idx[11:0];
			if (s1_update_hit) begin
				if (s1_update_bits_cfi_idx_valid) begin
					if (_wmeta_ctr_T_2) begin
						if (_wmeta_ctr_T_3)
							meta_8_ctr <= 2'h3;
						else if (_wmeta_ctr_T_5)
							meta_8_ctr <= 2'h0;
						else if (s1_update_bits_cfi_taken)
							meta_8_ctr <= _wmeta_ctr_T_20;
						else
							meta_8_ctr <= _wmeta_ctr_T_22;
					end
					else
						meta_8_ctr <= _wmeta_ctr_T_13;
				end
				else if (_wmeta_ctr_T_15[0]) begin
					if (wmeta_ctr_old_bim_sat_ntaken)
						meta_8_ctr <= 2'h0;
					else
						meta_8_ctr <= _wmeta_ctr_T_22;
				end
				else
					meta_8_ctr <= _GEN_25[s1_update_write_way * 2+:2];
				meta_8_jal_mask <= _wmeta_jal_mask_T_10;
			end
			else begin
				meta_8_ctr <= _wmeta_ctr_T_1;
				meta_8_jal_mask <= _wmeta_jal_mask_T_4;
			end
			if (s1_update_bits_cfi_idx_valid)
				meta_8_cfi_idx <= s1_update_bits_cfi_idx_bits;
			else
				meta_8_cfi_idx <= _GEN_26[s1_update_write_way * 2+:2];
			meta_8_br_mask <= wmeta_br_mask;
		end
		if ((_GEN & _GEN_29) & _GEN_9) begin
			meta_9_tag <= s1_update_idx[11:0];
			if (s1_update_hit) begin
				if (s1_update_bits_cfi_idx_valid) begin
					if (_wmeta_ctr_T_2) begin
						if (_wmeta_ctr_T_3)
							meta_9_ctr <= 2'h3;
						else if (_wmeta_ctr_T_5)
							meta_9_ctr <= 2'h0;
						else if (s1_update_bits_cfi_taken)
							meta_9_ctr <= _wmeta_ctr_T_20;
						else
							meta_9_ctr <= _wmeta_ctr_T_22;
					end
					else
						meta_9_ctr <= _wmeta_ctr_T_13;
				end
				else if (_wmeta_ctr_T_15[0]) begin
					if (wmeta_ctr_old_bim_sat_ntaken)
						meta_9_ctr <= 2'h0;
					else
						meta_9_ctr <= _wmeta_ctr_T_22;
				end
				else
					meta_9_ctr <= _GEN_25[s1_update_write_way * 2+:2];
				meta_9_jal_mask <= _wmeta_jal_mask_T_10;
			end
			else begin
				meta_9_ctr <= _wmeta_ctr_T_1;
				meta_9_jal_mask <= _wmeta_jal_mask_T_4;
			end
			if (s1_update_bits_cfi_idx_valid)
				meta_9_cfi_idx <= s1_update_bits_cfi_idx_bits;
			else
				meta_9_cfi_idx <= _GEN_26[s1_update_write_way * 2+:2];
			meta_9_br_mask <= wmeta_br_mask;
		end
		if ((_GEN & _GEN_29) & _GEN_10) begin
			meta_10_tag <= s1_update_idx[11:0];
			if (s1_update_hit) begin
				if (s1_update_bits_cfi_idx_valid) begin
					if (_wmeta_ctr_T_2) begin
						if (_wmeta_ctr_T_3)
							meta_10_ctr <= 2'h3;
						else if (_wmeta_ctr_T_5)
							meta_10_ctr <= 2'h0;
						else if (s1_update_bits_cfi_taken)
							meta_10_ctr <= _wmeta_ctr_T_20;
						else
							meta_10_ctr <= _wmeta_ctr_T_22;
					end
					else
						meta_10_ctr <= _wmeta_ctr_T_13;
				end
				else if (_wmeta_ctr_T_15[0]) begin
					if (wmeta_ctr_old_bim_sat_ntaken)
						meta_10_ctr <= 2'h0;
					else
						meta_10_ctr <= _wmeta_ctr_T_22;
				end
				else
					meta_10_ctr <= _GEN_25[s1_update_write_way * 2+:2];
				meta_10_jal_mask <= _wmeta_jal_mask_T_10;
			end
			else begin
				meta_10_ctr <= _wmeta_ctr_T_1;
				meta_10_jal_mask <= _wmeta_jal_mask_T_4;
			end
			if (s1_update_bits_cfi_idx_valid)
				meta_10_cfi_idx <= s1_update_bits_cfi_idx_bits;
			else
				meta_10_cfi_idx <= _GEN_26[s1_update_write_way * 2+:2];
			meta_10_br_mask <= wmeta_br_mask;
		end
		if ((_GEN & _GEN_29) & _GEN_11) begin
			meta_11_tag <= s1_update_idx[11:0];
			if (s1_update_hit) begin
				if (s1_update_bits_cfi_idx_valid) begin
					if (_wmeta_ctr_T_2) begin
						if (_wmeta_ctr_T_3)
							meta_11_ctr <= 2'h3;
						else if (_wmeta_ctr_T_5)
							meta_11_ctr <= 2'h0;
						else if (s1_update_bits_cfi_taken)
							meta_11_ctr <= _wmeta_ctr_T_20;
						else
							meta_11_ctr <= _wmeta_ctr_T_22;
					end
					else
						meta_11_ctr <= _wmeta_ctr_T_13;
				end
				else if (_wmeta_ctr_T_15[0]) begin
					if (wmeta_ctr_old_bim_sat_ntaken)
						meta_11_ctr <= 2'h0;
					else
						meta_11_ctr <= _wmeta_ctr_T_22;
				end
				else
					meta_11_ctr <= _GEN_25[s1_update_write_way * 2+:2];
				meta_11_jal_mask <= _wmeta_jal_mask_T_10;
			end
			else begin
				meta_11_ctr <= _wmeta_ctr_T_1;
				meta_11_jal_mask <= _wmeta_jal_mask_T_4;
			end
			if (s1_update_bits_cfi_idx_valid)
				meta_11_cfi_idx <= s1_update_bits_cfi_idx_bits;
			else
				meta_11_cfi_idx <= _GEN_26[s1_update_write_way * 2+:2];
			meta_11_br_mask <= wmeta_br_mask;
		end
		if ((_GEN & _GEN_29) & _GEN_12) begin
			meta_12_tag <= s1_update_idx[11:0];
			if (s1_update_hit) begin
				if (s1_update_bits_cfi_idx_valid) begin
					if (_wmeta_ctr_T_2) begin
						if (_wmeta_ctr_T_3)
							meta_12_ctr <= 2'h3;
						else if (_wmeta_ctr_T_5)
							meta_12_ctr <= 2'h0;
						else if (s1_update_bits_cfi_taken)
							meta_12_ctr <= _wmeta_ctr_T_20;
						else
							meta_12_ctr <= _wmeta_ctr_T_22;
					end
					else
						meta_12_ctr <= _wmeta_ctr_T_13;
				end
				else if (_wmeta_ctr_T_15[0]) begin
					if (wmeta_ctr_old_bim_sat_ntaken)
						meta_12_ctr <= 2'h0;
					else
						meta_12_ctr <= _wmeta_ctr_T_22;
				end
				else
					meta_12_ctr <= _GEN_25[s1_update_write_way * 2+:2];
				meta_12_jal_mask <= _wmeta_jal_mask_T_10;
			end
			else begin
				meta_12_ctr <= _wmeta_ctr_T_1;
				meta_12_jal_mask <= _wmeta_jal_mask_T_4;
			end
			if (s1_update_bits_cfi_idx_valid)
				meta_12_cfi_idx <= s1_update_bits_cfi_idx_bits;
			else
				meta_12_cfi_idx <= _GEN_26[s1_update_write_way * 2+:2];
			meta_12_br_mask <= wmeta_br_mask;
		end
		if ((_GEN & _GEN_29) & _GEN_13) begin
			meta_13_tag <= s1_update_idx[11:0];
			if (s1_update_hit) begin
				if (s1_update_bits_cfi_idx_valid) begin
					if (_wmeta_ctr_T_2) begin
						if (_wmeta_ctr_T_3)
							meta_13_ctr <= 2'h3;
						else if (_wmeta_ctr_T_5)
							meta_13_ctr <= 2'h0;
						else if (s1_update_bits_cfi_taken)
							meta_13_ctr <= _wmeta_ctr_T_20;
						else
							meta_13_ctr <= _wmeta_ctr_T_22;
					end
					else
						meta_13_ctr <= _wmeta_ctr_T_13;
				end
				else if (_wmeta_ctr_T_15[0]) begin
					if (wmeta_ctr_old_bim_sat_ntaken)
						meta_13_ctr <= 2'h0;
					else
						meta_13_ctr <= _wmeta_ctr_T_22;
				end
				else
					meta_13_ctr <= _GEN_25[s1_update_write_way * 2+:2];
				meta_13_jal_mask <= _wmeta_jal_mask_T_10;
			end
			else begin
				meta_13_ctr <= _wmeta_ctr_T_1;
				meta_13_jal_mask <= _wmeta_jal_mask_T_4;
			end
			if (s1_update_bits_cfi_idx_valid)
				meta_13_cfi_idx <= s1_update_bits_cfi_idx_bits;
			else
				meta_13_cfi_idx <= _GEN_26[s1_update_write_way * 2+:2];
			meta_13_br_mask <= wmeta_br_mask;
		end
		if ((_GEN & _GEN_29) & _GEN_14) begin
			meta_14_tag <= s1_update_idx[11:0];
			if (s1_update_hit) begin
				if (s1_update_bits_cfi_idx_valid) begin
					if (_wmeta_ctr_T_2) begin
						if (_wmeta_ctr_T_3)
							meta_14_ctr <= 2'h3;
						else if (_wmeta_ctr_T_5)
							meta_14_ctr <= 2'h0;
						else if (s1_update_bits_cfi_taken)
							meta_14_ctr <= _wmeta_ctr_T_20;
						else
							meta_14_ctr <= _wmeta_ctr_T_22;
					end
					else
						meta_14_ctr <= _wmeta_ctr_T_13;
				end
				else if (_wmeta_ctr_T_15[0]) begin
					if (wmeta_ctr_old_bim_sat_ntaken)
						meta_14_ctr <= 2'h0;
					else
						meta_14_ctr <= _wmeta_ctr_T_22;
				end
				else
					meta_14_ctr <= _GEN_25[s1_update_write_way * 2+:2];
				meta_14_jal_mask <= _wmeta_jal_mask_T_10;
			end
			else begin
				meta_14_ctr <= _wmeta_ctr_T_1;
				meta_14_jal_mask <= _wmeta_jal_mask_T_4;
			end
			if (s1_update_bits_cfi_idx_valid)
				meta_14_cfi_idx <= s1_update_bits_cfi_idx_bits;
			else
				meta_14_cfi_idx <= _GEN_26[s1_update_write_way * 2+:2];
			meta_14_br_mask <= wmeta_br_mask;
		end
		if ((_GEN & _GEN_29) & _GEN_15) begin
			meta_15_tag <= s1_update_idx[11:0];
			if (s1_update_hit) begin
				if (s1_update_bits_cfi_idx_valid) begin
					if (_wmeta_ctr_T_2) begin
						if (_wmeta_ctr_T_3)
							meta_15_ctr <= 2'h3;
						else if (_wmeta_ctr_T_5)
							meta_15_ctr <= 2'h0;
						else if (s1_update_bits_cfi_taken)
							meta_15_ctr <= _wmeta_ctr_T_20;
						else
							meta_15_ctr <= _wmeta_ctr_T_22;
					end
					else
						meta_15_ctr <= _wmeta_ctr_T_13;
				end
				else if (_wmeta_ctr_T_15[0]) begin
					if (wmeta_ctr_old_bim_sat_ntaken)
						meta_15_ctr <= 2'h0;
					else
						meta_15_ctr <= _wmeta_ctr_T_22;
				end
				else
					meta_15_ctr <= _GEN_25[s1_update_write_way * 2+:2];
				meta_15_jal_mask <= _wmeta_jal_mask_T_10;
			end
			else begin
				meta_15_ctr <= _wmeta_ctr_T_1;
				meta_15_jal_mask <= _wmeta_jal_mask_T_4;
			end
			if (s1_update_bits_cfi_idx_valid)
				meta_15_cfi_idx <= s1_update_bits_cfi_idx_bits;
			else
				meta_15_cfi_idx <= _GEN_26[s1_update_write_way * 2+:2];
			meta_15_br_mask <= wmeta_br_mask;
		end
		if ((_GEN & _GEN_29) & _GEN_16) begin
			meta_16_tag <= s1_update_idx[11:0];
			if (s1_update_hit) begin
				if (s1_update_bits_cfi_idx_valid) begin
					if (_wmeta_ctr_T_2) begin
						if (_wmeta_ctr_T_3)
							meta_16_ctr <= 2'h3;
						else if (_wmeta_ctr_T_5)
							meta_16_ctr <= 2'h0;
						else if (s1_update_bits_cfi_taken)
							meta_16_ctr <= _wmeta_ctr_T_20;
						else
							meta_16_ctr <= _wmeta_ctr_T_22;
					end
					else
						meta_16_ctr <= _wmeta_ctr_T_13;
				end
				else if (_wmeta_ctr_T_15[0]) begin
					if (wmeta_ctr_old_bim_sat_ntaken)
						meta_16_ctr <= 2'h0;
					else
						meta_16_ctr <= _wmeta_ctr_T_22;
				end
				else
					meta_16_ctr <= _GEN_25[s1_update_write_way * 2+:2];
				meta_16_jal_mask <= _wmeta_jal_mask_T_10;
			end
			else begin
				meta_16_ctr <= _wmeta_ctr_T_1;
				meta_16_jal_mask <= _wmeta_jal_mask_T_4;
			end
			if (s1_update_bits_cfi_idx_valid)
				meta_16_cfi_idx <= s1_update_bits_cfi_idx_bits;
			else
				meta_16_cfi_idx <= _GEN_26[s1_update_write_way * 2+:2];
			meta_16_br_mask <= wmeta_br_mask;
		end
		if ((_GEN & _GEN_29) & _GEN_17) begin
			meta_17_tag <= s1_update_idx[11:0];
			if (s1_update_hit) begin
				if (s1_update_bits_cfi_idx_valid) begin
					if (_wmeta_ctr_T_2) begin
						if (_wmeta_ctr_T_3)
							meta_17_ctr <= 2'h3;
						else if (_wmeta_ctr_T_5)
							meta_17_ctr <= 2'h0;
						else if (s1_update_bits_cfi_taken)
							meta_17_ctr <= _wmeta_ctr_T_20;
						else
							meta_17_ctr <= _wmeta_ctr_T_22;
					end
					else
						meta_17_ctr <= _wmeta_ctr_T_13;
				end
				else if (_wmeta_ctr_T_15[0]) begin
					if (wmeta_ctr_old_bim_sat_ntaken)
						meta_17_ctr <= 2'h0;
					else
						meta_17_ctr <= _wmeta_ctr_T_22;
				end
				else
					meta_17_ctr <= _GEN_25[s1_update_write_way * 2+:2];
				meta_17_jal_mask <= _wmeta_jal_mask_T_10;
			end
			else begin
				meta_17_ctr <= _wmeta_ctr_T_1;
				meta_17_jal_mask <= _wmeta_jal_mask_T_4;
			end
			if (s1_update_bits_cfi_idx_valid)
				meta_17_cfi_idx <= s1_update_bits_cfi_idx_bits;
			else
				meta_17_cfi_idx <= _GEN_26[s1_update_write_way * 2+:2];
			meta_17_br_mask <= wmeta_br_mask;
		end
		if ((_GEN & _GEN_29) & _GEN_18) begin
			meta_18_tag <= s1_update_idx[11:0];
			if (s1_update_hit) begin
				if (s1_update_bits_cfi_idx_valid) begin
					if (_wmeta_ctr_T_2) begin
						if (_wmeta_ctr_T_3)
							meta_18_ctr <= 2'h3;
						else if (_wmeta_ctr_T_5)
							meta_18_ctr <= 2'h0;
						else if (s1_update_bits_cfi_taken)
							meta_18_ctr <= _wmeta_ctr_T_20;
						else
							meta_18_ctr <= _wmeta_ctr_T_22;
					end
					else
						meta_18_ctr <= _wmeta_ctr_T_13;
				end
				else if (_wmeta_ctr_T_15[0]) begin
					if (wmeta_ctr_old_bim_sat_ntaken)
						meta_18_ctr <= 2'h0;
					else
						meta_18_ctr <= _wmeta_ctr_T_22;
				end
				else
					meta_18_ctr <= _GEN_25[s1_update_write_way * 2+:2];
				meta_18_jal_mask <= _wmeta_jal_mask_T_10;
			end
			else begin
				meta_18_ctr <= _wmeta_ctr_T_1;
				meta_18_jal_mask <= _wmeta_jal_mask_T_4;
			end
			if (s1_update_bits_cfi_idx_valid)
				meta_18_cfi_idx <= s1_update_bits_cfi_idx_bits;
			else
				meta_18_cfi_idx <= _GEN_26[s1_update_write_way * 2+:2];
			meta_18_br_mask <= wmeta_br_mask;
		end
		if ((_GEN & _GEN_29) & _GEN_19) begin
			meta_19_tag <= s1_update_idx[11:0];
			if (s1_update_hit) begin
				if (s1_update_bits_cfi_idx_valid) begin
					if (_wmeta_ctr_T_2) begin
						if (_wmeta_ctr_T_3)
							meta_19_ctr <= 2'h3;
						else if (_wmeta_ctr_T_5)
							meta_19_ctr <= 2'h0;
						else if (s1_update_bits_cfi_taken)
							meta_19_ctr <= _wmeta_ctr_T_20;
						else
							meta_19_ctr <= _wmeta_ctr_T_22;
					end
					else
						meta_19_ctr <= _wmeta_ctr_T_13;
				end
				else if (_wmeta_ctr_T_15[0]) begin
					if (wmeta_ctr_old_bim_sat_ntaken)
						meta_19_ctr <= 2'h0;
					else
						meta_19_ctr <= _wmeta_ctr_T_22;
				end
				else
					meta_19_ctr <= _GEN_25[s1_update_write_way * 2+:2];
				meta_19_jal_mask <= _wmeta_jal_mask_T_10;
			end
			else begin
				meta_19_ctr <= _wmeta_ctr_T_1;
				meta_19_jal_mask <= _wmeta_jal_mask_T_4;
			end
			if (s1_update_bits_cfi_idx_valid)
				meta_19_cfi_idx <= s1_update_bits_cfi_idx_bits;
			else
				meta_19_cfi_idx <= _GEN_26[s1_update_write_way * 2+:2];
			meta_19_br_mask <= wmeta_br_mask;
		end
		if ((_GEN & _GEN_29) & _GEN_20) begin
			meta_20_tag <= s1_update_idx[11:0];
			if (s1_update_hit) begin
				if (s1_update_bits_cfi_idx_valid) begin
					if (_wmeta_ctr_T_2) begin
						if (_wmeta_ctr_T_3)
							meta_20_ctr <= 2'h3;
						else if (_wmeta_ctr_T_5)
							meta_20_ctr <= 2'h0;
						else if (s1_update_bits_cfi_taken)
							meta_20_ctr <= _wmeta_ctr_T_20;
						else
							meta_20_ctr <= _wmeta_ctr_T_22;
					end
					else
						meta_20_ctr <= _wmeta_ctr_T_13;
				end
				else if (_wmeta_ctr_T_15[0]) begin
					if (wmeta_ctr_old_bim_sat_ntaken)
						meta_20_ctr <= 2'h0;
					else
						meta_20_ctr <= _wmeta_ctr_T_22;
				end
				else
					meta_20_ctr <= _GEN_25[s1_update_write_way * 2+:2];
				meta_20_jal_mask <= _wmeta_jal_mask_T_10;
			end
			else begin
				meta_20_ctr <= _wmeta_ctr_T_1;
				meta_20_jal_mask <= _wmeta_jal_mask_T_4;
			end
			if (s1_update_bits_cfi_idx_valid)
				meta_20_cfi_idx <= s1_update_bits_cfi_idx_bits;
			else
				meta_20_cfi_idx <= _GEN_26[s1_update_write_way * 2+:2];
			meta_20_br_mask <= wmeta_br_mask;
		end
		if ((_GEN & _GEN_29) & _GEN_21) begin
			meta_21_tag <= s1_update_idx[11:0];
			if (s1_update_hit) begin
				if (s1_update_bits_cfi_idx_valid) begin
					if (_wmeta_ctr_T_2) begin
						if (_wmeta_ctr_T_3)
							meta_21_ctr <= 2'h3;
						else if (_wmeta_ctr_T_5)
							meta_21_ctr <= 2'h0;
						else if (s1_update_bits_cfi_taken)
							meta_21_ctr <= _wmeta_ctr_T_20;
						else
							meta_21_ctr <= _wmeta_ctr_T_22;
					end
					else
						meta_21_ctr <= _wmeta_ctr_T_13;
				end
				else if (_wmeta_ctr_T_15[0]) begin
					if (wmeta_ctr_old_bim_sat_ntaken)
						meta_21_ctr <= 2'h0;
					else
						meta_21_ctr <= _wmeta_ctr_T_22;
				end
				else
					meta_21_ctr <= _GEN_25[s1_update_write_way * 2+:2];
				meta_21_jal_mask <= _wmeta_jal_mask_T_10;
			end
			else begin
				meta_21_ctr <= _wmeta_ctr_T_1;
				meta_21_jal_mask <= _wmeta_jal_mask_T_4;
			end
			if (s1_update_bits_cfi_idx_valid)
				meta_21_cfi_idx <= s1_update_bits_cfi_idx_bits;
			else
				meta_21_cfi_idx <= _GEN_26[s1_update_write_way * 2+:2];
			meta_21_br_mask <= wmeta_br_mask;
		end
		if ((_GEN & _GEN_29) & _GEN_22) begin
			meta_22_tag <= s1_update_idx[11:0];
			if (s1_update_hit) begin
				if (s1_update_bits_cfi_idx_valid) begin
					if (_wmeta_ctr_T_2) begin
						if (_wmeta_ctr_T_3)
							meta_22_ctr <= 2'h3;
						else if (_wmeta_ctr_T_5)
							meta_22_ctr <= 2'h0;
						else if (s1_update_bits_cfi_taken)
							meta_22_ctr <= _wmeta_ctr_T_20;
						else
							meta_22_ctr <= _wmeta_ctr_T_22;
					end
					else
						meta_22_ctr <= _wmeta_ctr_T_13;
				end
				else if (_wmeta_ctr_T_15[0]) begin
					if (wmeta_ctr_old_bim_sat_ntaken)
						meta_22_ctr <= 2'h0;
					else
						meta_22_ctr <= _wmeta_ctr_T_22;
				end
				else
					meta_22_ctr <= _GEN_25[s1_update_write_way * 2+:2];
				meta_22_jal_mask <= _wmeta_jal_mask_T_10;
			end
			else begin
				meta_22_ctr <= _wmeta_ctr_T_1;
				meta_22_jal_mask <= _wmeta_jal_mask_T_4;
			end
			if (s1_update_bits_cfi_idx_valid)
				meta_22_cfi_idx <= s1_update_bits_cfi_idx_bits;
			else
				meta_22_cfi_idx <= _GEN_26[s1_update_write_way * 2+:2];
			meta_22_br_mask <= wmeta_br_mask;
		end
		if ((_GEN & _GEN_29) & _GEN_23) begin
			meta_23_tag <= s1_update_idx[11:0];
			if (s1_update_hit) begin
				if (s1_update_bits_cfi_idx_valid) begin
					if (_wmeta_ctr_T_2) begin
						if (_wmeta_ctr_T_3)
							meta_23_ctr <= 2'h3;
						else if (_wmeta_ctr_T_5)
							meta_23_ctr <= 2'h0;
						else if (s1_update_bits_cfi_taken)
							meta_23_ctr <= _wmeta_ctr_T_20;
						else
							meta_23_ctr <= _wmeta_ctr_T_22;
					end
					else
						meta_23_ctr <= _wmeta_ctr_T_13;
				end
				else if (_wmeta_ctr_T_15[0]) begin
					if (wmeta_ctr_old_bim_sat_ntaken)
						meta_23_ctr <= 2'h0;
					else
						meta_23_ctr <= _wmeta_ctr_T_22;
				end
				else
					meta_23_ctr <= _GEN_25[s1_update_write_way * 2+:2];
				meta_23_jal_mask <= _wmeta_jal_mask_T_10;
			end
			else begin
				meta_23_ctr <= _wmeta_ctr_T_1;
				meta_23_jal_mask <= _wmeta_jal_mask_T_4;
			end
			if (s1_update_bits_cfi_idx_valid)
				meta_23_cfi_idx <= s1_update_bits_cfi_idx_bits;
			else
				meta_23_cfi_idx <= _GEN_26[s1_update_write_way * 2+:2];
			meta_23_br_mask <= wmeta_br_mask;
		end
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_0) & ~s1_update_bits_cfi_is_br)
			btb_0_0 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_0) & s1_update_bits_cfi_is_br)
			btb_0_1 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_1) & ~s1_update_bits_cfi_is_br)
			btb_1_0 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_1) & s1_update_bits_cfi_is_br)
			btb_1_1 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_2) & ~s1_update_bits_cfi_is_br)
			btb_2_0 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_2) & s1_update_bits_cfi_is_br)
			btb_2_1 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_3) & ~s1_update_bits_cfi_is_br)
			btb_3_0 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_3) & s1_update_bits_cfi_is_br)
			btb_3_1 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_4) & ~s1_update_bits_cfi_is_br)
			btb_4_0 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_4) & s1_update_bits_cfi_is_br)
			btb_4_1 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_5) & ~s1_update_bits_cfi_is_br)
			btb_5_0 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_5) & s1_update_bits_cfi_is_br)
			btb_5_1 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_6) & ~s1_update_bits_cfi_is_br)
			btb_6_0 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_6) & s1_update_bits_cfi_is_br)
			btb_6_1 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_7) & ~s1_update_bits_cfi_is_br)
			btb_7_0 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_7) & s1_update_bits_cfi_is_br)
			btb_7_1 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_8) & ~s1_update_bits_cfi_is_br)
			btb_8_0 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_8) & s1_update_bits_cfi_is_br)
			btb_8_1 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_9) & ~s1_update_bits_cfi_is_br)
			btb_9_0 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_9) & s1_update_bits_cfi_is_br)
			btb_9_1 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_10) & ~s1_update_bits_cfi_is_br)
			btb_10_0 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_10) & s1_update_bits_cfi_is_br)
			btb_10_1 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_11) & ~s1_update_bits_cfi_is_br)
			btb_11_0 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_11) & s1_update_bits_cfi_is_br)
			btb_11_1 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_12) & ~s1_update_bits_cfi_is_br)
			btb_12_0 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_12) & s1_update_bits_cfi_is_br)
			btb_12_1 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_13) & ~s1_update_bits_cfi_is_br)
			btb_13_0 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_13) & s1_update_bits_cfi_is_br)
			btb_13_1 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_14) & ~s1_update_bits_cfi_is_br)
			btb_14_0 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_14) & s1_update_bits_cfi_is_br)
			btb_14_1 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_15) & ~s1_update_bits_cfi_is_br)
			btb_15_0 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_15) & s1_update_bits_cfi_is_br)
			btb_15_1 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_16) & ~s1_update_bits_cfi_is_br)
			btb_16_0 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_16) & s1_update_bits_cfi_is_br)
			btb_16_1 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_17) & ~s1_update_bits_cfi_is_br)
			btb_17_0 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_17) & s1_update_bits_cfi_is_br)
			btb_17_1 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_18) & ~s1_update_bits_cfi_is_br)
			btb_18_0 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_18) & s1_update_bits_cfi_is_br)
			btb_18_1 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_19) & ~s1_update_bits_cfi_is_br)
			btb_19_0 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_19) & s1_update_bits_cfi_is_br)
			btb_19_1 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_20) & ~s1_update_bits_cfi_is_br)
			btb_20_0 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_20) & s1_update_bits_cfi_is_br)
			btb_20_1 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_21) & ~s1_update_bits_cfi_is_br)
			btb_21_0 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_21) & s1_update_bits_cfi_is_br)
			btb_21_1 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_22) & ~s1_update_bits_cfi_is_br)
			btb_22_0 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_22) & s1_update_bits_cfi_is_br)
			btb_22_1 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_23) & ~s1_update_bits_cfi_is_br)
			btb_23_0 <= s1_update_bits_target;
		if (((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_23) & s1_update_bits_cfi_is_br)
			btb_23_1 <= s1_update_bits_target;
		io_resp_f2_0_REG_is_br <= s1_is_br_0;
		io_resp_f2_0_REG_is_jal <= s1_is_jal_0;
		io_resp_f2_0_REG_predicted_pc_valid <= s1_resp_0_valid;
		io_resp_f2_0_REG_predicted_pc_bits <= s1_resp_0_bits;
		io_resp_f3_0_REG_is_br <= io_resp_f2_0_REG_is_br;
		io_resp_f3_0_REG_is_jal <= io_resp_f2_0_REG_is_jal;
		io_resp_f3_0_REG_predicted_pc_valid <= io_resp_f2_0_REG_predicted_pc_valid;
		io_resp_f3_0_REG_predicted_pc_bits <= io_resp_f2_0_REG_predicted_pc_bits;
		io_resp_f2_1_REG_is_br <= s1_is_br_1;
		io_resp_f2_1_REG_is_jal <= s1_is_jal_1;
		io_resp_f2_1_REG_predicted_pc_valid <= s1_resp_1_valid;
		io_resp_f2_1_REG_predicted_pc_bits <= s1_resp_1_bits;
		io_resp_f3_1_REG_is_br <= io_resp_f2_1_REG_is_br;
		io_resp_f3_1_REG_is_jal <= io_resp_f2_1_REG_is_jal;
		io_resp_f3_1_REG_predicted_pc_valid <= io_resp_f2_1_REG_predicted_pc_valid;
		io_resp_f3_1_REG_predicted_pc_bits <= io_resp_f2_1_REG_predicted_pc_bits;
		io_resp_f2_2_REG_is_br <= s1_is_br_2;
		io_resp_f2_2_REG_is_jal <= s1_is_jal_2;
		io_resp_f2_2_REG_predicted_pc_valid <= s1_resp_2_valid;
		io_resp_f2_2_REG_predicted_pc_bits <= s1_resp_2_bits;
		io_resp_f3_2_REG_is_br <= io_resp_f2_2_REG_is_br;
		io_resp_f3_2_REG_is_jal <= io_resp_f2_2_REG_is_jal;
		io_resp_f3_2_REG_predicted_pc_valid <= io_resp_f2_2_REG_predicted_pc_valid;
		io_resp_f3_2_REG_predicted_pc_bits <= io_resp_f2_2_REG_predicted_pc_bits;
		io_resp_f2_3_REG_is_br <= s1_is_br_3;
		io_resp_f2_3_REG_is_jal <= s1_is_jal_3;
		io_resp_f2_3_REG_predicted_pc_valid <= s1_resp_3_valid;
		io_resp_f2_3_REG_predicted_pc_bits <= s1_resp_3_bits;
		io_resp_f3_3_REG_is_br <= io_resp_f2_3_REG_is_br;
		io_resp_f3_3_REG_is_jal <= io_resp_f2_3_REG_is_jal;
		io_resp_f3_3_REG_predicted_pc_valid <= io_resp_f2_3_REG_predicted_pc_valid;
		io_resp_f3_3_REG_predicted_pc_bits <= io_resp_f2_3_REG_predicted_pc_bits;
		io_f3_meta_REG <= s1_hit;
		io_f3_meta_REG_1 <= io_f3_meta_REG;
		if (reset) begin
			valids_0 <= 1'h0;
			valids_1 <= 1'h0;
			valids_2 <= 1'h0;
			valids_3 <= 1'h0;
			valids_4 <= 1'h0;
			valids_5 <= 1'h0;
			valids_6 <= 1'h0;
			valids_7 <= 1'h0;
			valids_8 <= 1'h0;
			valids_9 <= 1'h0;
			valids_10 <= 1'h0;
			valids_11 <= 1'h0;
			valids_12 <= 1'h0;
			valids_13 <= 1'h0;
			valids_14 <= 1'h0;
			valids_15 <= 1'h0;
			valids_16 <= 1'h0;
			valids_17 <= 1'h0;
			valids_18 <= 1'h0;
			valids_19 <= 1'h0;
			valids_20 <= 1'h0;
			valids_21 <= 1'h0;
			valids_22 <= 1'h0;
			valids_23 <= 1'h0;
		end
		else begin
			valids_0 <= ((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_0) | valids_0;
			valids_1 <= ((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_1) | valids_1;
			valids_2 <= ((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_2) | valids_2;
			valids_3 <= ((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_3) | valids_3;
			valids_4 <= ((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_4) | valids_4;
			valids_5 <= ((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_5) | valids_5;
			valids_6 <= ((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_6) | valids_6;
			valids_7 <= ((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_7) | valids_7;
			valids_8 <= ((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_8) | valids_8;
			valids_9 <= ((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_9) | valids_9;
			valids_10 <= ((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_10) | valids_10;
			valids_11 <= ((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_11) | valids_11;
			valids_12 <= ((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_12) | valids_12;
			valids_13 <= ((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_13) | valids_13;
			valids_14 <= ((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_14) | valids_14;
			valids_15 <= ((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_15) | valids_15;
			valids_16 <= ((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_16) | valids_16;
			valids_17 <= ((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_17) | valids_17;
			valids_18 <= ((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_18) | valids_18;
			valids_19 <= ((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_19) | valids_19;
			valids_20 <= ((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_20) | valids_20;
			valids_21 <= ((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_21) | valids_21;
			valids_22 <= ((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_22) | valids_22;
			valids_23 <= ((_GEN & s1_update_bits_cfi_idx_valid) & _GEN_23) | valids_23;
		end
	end
	MaxPeriodFibonacciLFSR s1_update_write_way_prng(
		.clock(clock),
		.reset(reset),
		.io_increment(1'h1),
		.io_out_0(_s1_update_write_way_prng_io_out_0),
		.io_out_1(_s1_update_write_way_prng_io_out_1),
		.io_out_2(_s1_update_write_way_prng_io_out_2),
		.io_out_3(_s1_update_write_way_prng_io_out_3),
		.io_out_4(_s1_update_write_way_prng_io_out_4),
		.io_out_5(),
		.io_out_6(),
		.io_out_7(),
		.io_out_8(),
		.io_out_9(),
		.io_out_10(),
		.io_out_11(),
		.io_out_12(),
		.io_out_13(),
		.io_out_14(),
		.io_out_15()
	);
	assign io_resp_f1_0_taken = s1_hit & (s1_is_jal_0 | _s1_hit_meta_T_187);
	assign io_resp_f1_0_is_br = s1_is_br_0;
	assign io_resp_f1_0_predicted_pc_valid = s1_resp_0_valid;
	assign io_resp_f1_0_predicted_pc_bits = s1_resp_0_bits;
	assign io_resp_f1_1_taken = s1_hit & (s1_is_jal_1 | _s1_hit_meta_T_187);
	assign io_resp_f1_1_is_br = s1_is_br_1;
	assign io_resp_f1_1_predicted_pc_valid = s1_resp_1_valid;
	assign io_resp_f1_1_predicted_pc_bits = s1_resp_1_bits;
	assign io_resp_f1_2_taken = s1_hit & (s1_is_jal_2 | _s1_hit_meta_T_187);
	assign io_resp_f1_2_is_br = s1_is_br_2;
	assign io_resp_f1_2_predicted_pc_valid = s1_resp_2_valid;
	assign io_resp_f1_2_predicted_pc_bits = s1_resp_2_bits;
	assign io_resp_f1_3_taken = s1_hit & (s1_is_jal_3 | _s1_hit_meta_T_187);
	assign io_resp_f1_3_is_br = s1_is_br_3;
	assign io_resp_f1_3_predicted_pc_valid = s1_resp_3_valid;
	assign io_resp_f1_3_predicted_pc_bits = s1_resp_3_bits;
	assign io_resp_f2_0_is_br = io_resp_f2_0_REG_is_br;
	assign io_resp_f2_0_is_jal = io_resp_f2_0_REG_is_jal;
	assign io_resp_f2_0_predicted_pc_valid = io_resp_f2_0_REG_predicted_pc_valid;
	assign io_resp_f2_0_predicted_pc_bits = io_resp_f2_0_REG_predicted_pc_bits;
	assign io_resp_f2_1_is_br = io_resp_f2_1_REG_is_br;
	assign io_resp_f2_1_is_jal = io_resp_f2_1_REG_is_jal;
	assign io_resp_f2_1_predicted_pc_valid = io_resp_f2_1_REG_predicted_pc_valid;
	assign io_resp_f2_1_predicted_pc_bits = io_resp_f2_1_REG_predicted_pc_bits;
	assign io_resp_f2_2_is_br = io_resp_f2_2_REG_is_br;
	assign io_resp_f2_2_is_jal = io_resp_f2_2_REG_is_jal;
	assign io_resp_f2_2_predicted_pc_valid = io_resp_f2_2_REG_predicted_pc_valid;
	assign io_resp_f2_2_predicted_pc_bits = io_resp_f2_2_REG_predicted_pc_bits;
	assign io_resp_f2_3_is_br = io_resp_f2_3_REG_is_br;
	assign io_resp_f2_3_is_jal = io_resp_f2_3_REG_is_jal;
	assign io_resp_f2_3_predicted_pc_valid = io_resp_f2_3_REG_predicted_pc_valid;
	assign io_resp_f2_3_predicted_pc_bits = io_resp_f2_3_REG_predicted_pc_bits;
	assign io_resp_f3_0_is_br = io_resp_f3_0_REG_is_br;
	assign io_resp_f3_0_is_jal = io_resp_f3_0_REG_is_jal;
	assign io_resp_f3_0_predicted_pc_valid = io_resp_f3_0_REG_predicted_pc_valid;
	assign io_resp_f3_0_predicted_pc_bits = io_resp_f3_0_REG_predicted_pc_bits;
	assign io_resp_f3_1_is_br = io_resp_f3_1_REG_is_br;
	assign io_resp_f3_1_is_jal = io_resp_f3_1_REG_is_jal;
	assign io_resp_f3_1_predicted_pc_valid = io_resp_f3_1_REG_predicted_pc_valid;
	assign io_resp_f3_1_predicted_pc_bits = io_resp_f3_1_REG_predicted_pc_bits;
	assign io_resp_f3_2_is_br = io_resp_f3_2_REG_is_br;
	assign io_resp_f3_2_is_jal = io_resp_f3_2_REG_is_jal;
	assign io_resp_f3_2_predicted_pc_valid = io_resp_f3_2_REG_predicted_pc_valid;
	assign io_resp_f3_2_predicted_pc_bits = io_resp_f3_2_REG_predicted_pc_bits;
	assign io_resp_f3_3_is_br = io_resp_f3_3_REG_is_br;
	assign io_resp_f3_3_is_jal = io_resp_f3_3_REG_is_jal;
	assign io_resp_f3_3_predicted_pc_valid = io_resp_f3_3_REG_predicted_pc_valid;
	assign io_resp_f3_3_predicted_pc_bits = io_resp_f3_3_REG_predicted_pc_bits;
	assign io_f3_meta = {119'h000000000000000000000000000000, io_f3_meta_REG_1};
endmodule
