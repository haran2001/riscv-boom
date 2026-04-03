module BTBBranchPredictorBank (
	clock,
	reset,
	io_f0_valid,
	io_f0_pc,
	io_resp_in_0_f1_0_taken,
	io_resp_in_0_f1_0_is_br,
	io_resp_in_0_f1_0_predicted_pc_valid,
	io_resp_in_0_f1_0_predicted_pc_bits,
	io_resp_in_0_f1_1_taken,
	io_resp_in_0_f1_1_is_br,
	io_resp_in_0_f1_1_predicted_pc_valid,
	io_resp_in_0_f1_1_predicted_pc_bits,
	io_resp_in_0_f1_2_taken,
	io_resp_in_0_f1_2_is_br,
	io_resp_in_0_f1_2_predicted_pc_valid,
	io_resp_in_0_f1_2_predicted_pc_bits,
	io_resp_in_0_f1_3_taken,
	io_resp_in_0_f1_3_is_br,
	io_resp_in_0_f1_3_predicted_pc_valid,
	io_resp_in_0_f1_3_predicted_pc_bits,
	io_resp_in_0_f2_0_taken,
	io_resp_in_0_f2_0_is_br,
	io_resp_in_0_f2_0_is_jal,
	io_resp_in_0_f2_0_predicted_pc_valid,
	io_resp_in_0_f2_0_predicted_pc_bits,
	io_resp_in_0_f2_1_taken,
	io_resp_in_0_f2_1_is_br,
	io_resp_in_0_f2_1_is_jal,
	io_resp_in_0_f2_1_predicted_pc_valid,
	io_resp_in_0_f2_1_predicted_pc_bits,
	io_resp_in_0_f2_2_taken,
	io_resp_in_0_f2_2_is_br,
	io_resp_in_0_f2_2_is_jal,
	io_resp_in_0_f2_2_predicted_pc_valid,
	io_resp_in_0_f2_2_predicted_pc_bits,
	io_resp_in_0_f2_3_taken,
	io_resp_in_0_f2_3_is_br,
	io_resp_in_0_f2_3_is_jal,
	io_resp_in_0_f2_3_predicted_pc_valid,
	io_resp_in_0_f2_3_predicted_pc_bits,
	io_resp_in_0_f3_0_taken,
	io_resp_in_0_f3_0_is_br,
	io_resp_in_0_f3_0_is_jal,
	io_resp_in_0_f3_0_predicted_pc_valid,
	io_resp_in_0_f3_0_predicted_pc_bits,
	io_resp_in_0_f3_1_taken,
	io_resp_in_0_f3_1_is_br,
	io_resp_in_0_f3_1_is_jal,
	io_resp_in_0_f3_1_predicted_pc_valid,
	io_resp_in_0_f3_1_predicted_pc_bits,
	io_resp_in_0_f3_2_taken,
	io_resp_in_0_f3_2_is_br,
	io_resp_in_0_f3_2_is_jal,
	io_resp_in_0_f3_2_predicted_pc_valid,
	io_resp_in_0_f3_2_predicted_pc_bits,
	io_resp_in_0_f3_3_taken,
	io_resp_in_0_f3_3_is_br,
	io_resp_in_0_f3_3_is_jal,
	io_resp_in_0_f3_3_predicted_pc_valid,
	io_resp_in_0_f3_3_predicted_pc_bits,
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
	io_resp_f2_0_taken,
	io_resp_f2_0_is_br,
	io_resp_f2_0_predicted_pc_valid,
	io_resp_f2_0_predicted_pc_bits,
	io_resp_f2_1_taken,
	io_resp_f2_1_is_br,
	io_resp_f2_1_predicted_pc_valid,
	io_resp_f2_1_predicted_pc_bits,
	io_resp_f2_2_taken,
	io_resp_f2_2_is_br,
	io_resp_f2_2_predicted_pc_valid,
	io_resp_f2_2_predicted_pc_bits,
	io_resp_f2_3_taken,
	io_resp_f2_3_is_br,
	io_resp_f2_3_predicted_pc_valid,
	io_resp_f2_3_predicted_pc_bits,
	io_resp_f3_0_taken,
	io_resp_f3_0_is_br,
	io_resp_f3_0_is_jal,
	io_resp_f3_0_predicted_pc_valid,
	io_resp_f3_0_predicted_pc_bits,
	io_resp_f3_1_taken,
	io_resp_f3_1_is_br,
	io_resp_f3_1_is_jal,
	io_resp_f3_1_predicted_pc_valid,
	io_resp_f3_1_predicted_pc_bits,
	io_resp_f3_2_taken,
	io_resp_f3_2_is_br,
	io_resp_f3_2_is_jal,
	io_resp_f3_2_predicted_pc_valid,
	io_resp_f3_2_predicted_pc_bits,
	io_resp_f3_3_taken,
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
	io_update_bits_target,
	io_update_bits_meta
);
	input clock;
	input reset;
	input io_f0_valid;
	input [39:0] io_f0_pc;
	input io_resp_in_0_f1_0_taken;
	input io_resp_in_0_f1_0_is_br;
	input io_resp_in_0_f1_0_predicted_pc_valid;
	input [39:0] io_resp_in_0_f1_0_predicted_pc_bits;
	input io_resp_in_0_f1_1_taken;
	input io_resp_in_0_f1_1_is_br;
	input io_resp_in_0_f1_1_predicted_pc_valid;
	input [39:0] io_resp_in_0_f1_1_predicted_pc_bits;
	input io_resp_in_0_f1_2_taken;
	input io_resp_in_0_f1_2_is_br;
	input io_resp_in_0_f1_2_predicted_pc_valid;
	input [39:0] io_resp_in_0_f1_2_predicted_pc_bits;
	input io_resp_in_0_f1_3_taken;
	input io_resp_in_0_f1_3_is_br;
	input io_resp_in_0_f1_3_predicted_pc_valid;
	input [39:0] io_resp_in_0_f1_3_predicted_pc_bits;
	input io_resp_in_0_f2_0_taken;
	input io_resp_in_0_f2_0_is_br;
	input io_resp_in_0_f2_0_is_jal;
	input io_resp_in_0_f2_0_predicted_pc_valid;
	input [39:0] io_resp_in_0_f2_0_predicted_pc_bits;
	input io_resp_in_0_f2_1_taken;
	input io_resp_in_0_f2_1_is_br;
	input io_resp_in_0_f2_1_is_jal;
	input io_resp_in_0_f2_1_predicted_pc_valid;
	input [39:0] io_resp_in_0_f2_1_predicted_pc_bits;
	input io_resp_in_0_f2_2_taken;
	input io_resp_in_0_f2_2_is_br;
	input io_resp_in_0_f2_2_is_jal;
	input io_resp_in_0_f2_2_predicted_pc_valid;
	input [39:0] io_resp_in_0_f2_2_predicted_pc_bits;
	input io_resp_in_0_f2_3_taken;
	input io_resp_in_0_f2_3_is_br;
	input io_resp_in_0_f2_3_is_jal;
	input io_resp_in_0_f2_3_predicted_pc_valid;
	input [39:0] io_resp_in_0_f2_3_predicted_pc_bits;
	input io_resp_in_0_f3_0_taken;
	input io_resp_in_0_f3_0_is_br;
	input io_resp_in_0_f3_0_is_jal;
	input io_resp_in_0_f3_0_predicted_pc_valid;
	input [39:0] io_resp_in_0_f3_0_predicted_pc_bits;
	input io_resp_in_0_f3_1_taken;
	input io_resp_in_0_f3_1_is_br;
	input io_resp_in_0_f3_1_is_jal;
	input io_resp_in_0_f3_1_predicted_pc_valid;
	input [39:0] io_resp_in_0_f3_1_predicted_pc_bits;
	input io_resp_in_0_f3_2_taken;
	input io_resp_in_0_f3_2_is_br;
	input io_resp_in_0_f3_2_is_jal;
	input io_resp_in_0_f3_2_predicted_pc_valid;
	input [39:0] io_resp_in_0_f3_2_predicted_pc_bits;
	input io_resp_in_0_f3_3_taken;
	input io_resp_in_0_f3_3_is_br;
	input io_resp_in_0_f3_3_is_jal;
	input io_resp_in_0_f3_3_predicted_pc_valid;
	input [39:0] io_resp_in_0_f3_3_predicted_pc_bits;
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
	output wire io_resp_f2_0_taken;
	output wire io_resp_f2_0_is_br;
	output wire io_resp_f2_0_predicted_pc_valid;
	output wire [39:0] io_resp_f2_0_predicted_pc_bits;
	output wire io_resp_f2_1_taken;
	output wire io_resp_f2_1_is_br;
	output wire io_resp_f2_1_predicted_pc_valid;
	output wire [39:0] io_resp_f2_1_predicted_pc_bits;
	output wire io_resp_f2_2_taken;
	output wire io_resp_f2_2_is_br;
	output wire io_resp_f2_2_predicted_pc_valid;
	output wire [39:0] io_resp_f2_2_predicted_pc_bits;
	output wire io_resp_f2_3_taken;
	output wire io_resp_f2_3_is_br;
	output wire io_resp_f2_3_predicted_pc_valid;
	output wire [39:0] io_resp_f2_3_predicted_pc_bits;
	output wire io_resp_f3_0_taken;
	output wire io_resp_f3_0_is_br;
	output wire io_resp_f3_0_is_jal;
	output wire io_resp_f3_0_predicted_pc_valid;
	output wire [39:0] io_resp_f3_0_predicted_pc_bits;
	output wire io_resp_f3_1_taken;
	output wire io_resp_f3_1_is_br;
	output wire io_resp_f3_1_is_jal;
	output wire io_resp_f3_1_predicted_pc_valid;
	output wire [39:0] io_resp_f3_1_predicted_pc_bits;
	output wire io_resp_f3_2_taken;
	output wire io_resp_f3_2_is_br;
	output wire io_resp_f3_2_is_jal;
	output wire io_resp_f3_2_predicted_pc_valid;
	output wire [39:0] io_resp_f3_2_predicted_pc_bits;
	output wire io_resp_f3_3_taken;
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
	input [39:0] io_update_bits_target;
	input [119:0] io_update_bits_meta;
	wire [30:0] btb_meta_way_1_MPORT_7_data_3;
	wire [30:0] btb_meta_way_1_MPORT_7_data_2;
	wire [30:0] btb_meta_way_1_MPORT_7_data_1;
	wire [30:0] btb_meta_way_1_MPORT_7_data_0;
	wire [13:0] btb_data_way_1_MPORT_6_data_3;
	wire [13:0] btb_data_way_1_MPORT_6_data_2;
	wire [13:0] btb_data_way_1_MPORT_6_data_1;
	wire [13:0] btb_data_way_1_MPORT_6_data_0;
	wire [30:0] btb_meta_way_0_MPORT_3_data_3;
	wire [30:0] btb_meta_way_0_MPORT_3_data_2;
	wire [30:0] btb_meta_way_0_MPORT_3_data_1;
	wire [30:0] btb_meta_way_0_MPORT_3_data_0;
	wire [13:0] btb_data_way_0_MPORT_2_data_3;
	wire [13:0] btb_data_way_0_MPORT_2_data_2;
	wire [13:0] btb_data_way_0_MPORT_2_data_1;
	wire [13:0] btb_data_way_0_MPORT_2_data_0;
	wire [39:0] _btb_ebtb_ext_R0_data;
	wire [55:0] _btb_data_way_1_ext_R0_data;
	wire [123:0] _btb_meta_way_1_ext_R0_data;
	wire [55:0] _btb_data_way_0_ext_R0_data;
	wire [123:0] _btb_meta_way_0_ext_R0_data;
	reg [36:0] s1_idx;
	reg s1_valid;
	reg [39:0] s1_pc;
	reg s1_update_valid;
	reg s1_update_bits_is_mispredict_update;
	reg s1_update_bits_is_repair_update;
	reg [3:0] s1_update_bits_btb_mispredicts;
	reg [39:0] s1_update_bits_pc;
	reg [3:0] s1_update_bits_br_mask;
	reg s1_update_bits_cfi_idx_valid;
	reg [1:0] s1_update_bits_cfi_idx_bits;
	reg s1_update_bits_cfi_taken;
	reg [39:0] s1_update_bits_target;
	reg [119:0] s1_update_bits_meta;
	reg [36:0] s1_update_idx;
	reg f3_meta_REG_write_way;
	reg f3_meta_write_way;
	reg doing_reset;
	reg [6:0] reset_idx;
	reg REG;
	reg io_resp_f2_0_predicted_pc_REG_valid;
	reg [39:0] io_resp_f2_0_predicted_pc_REG_bits;
	wire io_resp_f2_0_predicted_pc_valid_0 = (REG ? io_resp_f2_0_predicted_pc_REG_valid : io_resp_in_0_f2_0_predicted_pc_valid);
	wire [39:0] io_resp_f2_0_predicted_pc_bits_0 = (REG ? io_resp_f2_0_predicted_pc_REG_bits : io_resp_in_0_f2_0_predicted_pc_bits);
	reg io_resp_f2_0_is_br_REG;
	wire io_resp_f2_0_is_br_0 = (REG ? io_resp_f2_0_is_br_REG : io_resp_in_0_f2_0_is_br);
	reg io_resp_f2_0_is_jal_REG;
	reg REG_1;
	reg REG_2;
	reg REG_3;
	reg io_resp_f3_0_predicted_pc_REG_valid;
	reg [39:0] io_resp_f3_0_predicted_pc_REG_bits;
	reg io_resp_f3_0_is_br_REG;
	reg io_resp_f3_0_is_jal_REG;
	reg REG_4;
	reg REG_5;
	reg REG_6;
	reg io_resp_f2_1_predicted_pc_REG_valid;
	reg [39:0] io_resp_f2_1_predicted_pc_REG_bits;
	wire io_resp_f2_1_predicted_pc_valid_0 = (REG_6 ? io_resp_f2_1_predicted_pc_REG_valid : io_resp_in_0_f2_1_predicted_pc_valid);
	wire [39:0] io_resp_f2_1_predicted_pc_bits_0 = (REG_6 ? io_resp_f2_1_predicted_pc_REG_bits : io_resp_in_0_f2_1_predicted_pc_bits);
	reg io_resp_f2_1_is_br_REG;
	wire io_resp_f2_1_is_br_0 = (REG_6 ? io_resp_f2_1_is_br_REG : io_resp_in_0_f2_1_is_br);
	reg io_resp_f2_1_is_jal_REG;
	reg REG_7;
	reg REG_8;
	reg REG_9;
	reg io_resp_f3_1_predicted_pc_REG_valid;
	reg [39:0] io_resp_f3_1_predicted_pc_REG_bits;
	reg io_resp_f3_1_is_br_REG;
	reg io_resp_f3_1_is_jal_REG;
	reg REG_10;
	reg REG_11;
	reg REG_12;
	reg io_resp_f2_2_predicted_pc_REG_valid;
	reg [39:0] io_resp_f2_2_predicted_pc_REG_bits;
	wire io_resp_f2_2_predicted_pc_valid_0 = (REG_12 ? io_resp_f2_2_predicted_pc_REG_valid : io_resp_in_0_f2_2_predicted_pc_valid);
	wire [39:0] io_resp_f2_2_predicted_pc_bits_0 = (REG_12 ? io_resp_f2_2_predicted_pc_REG_bits : io_resp_in_0_f2_2_predicted_pc_bits);
	reg io_resp_f2_2_is_br_REG;
	wire io_resp_f2_2_is_br_0 = (REG_12 ? io_resp_f2_2_is_br_REG : io_resp_in_0_f2_2_is_br);
	reg io_resp_f2_2_is_jal_REG;
	reg REG_13;
	reg REG_14;
	reg REG_15;
	reg io_resp_f3_2_predicted_pc_REG_valid;
	reg [39:0] io_resp_f3_2_predicted_pc_REG_bits;
	reg io_resp_f3_2_is_br_REG;
	reg io_resp_f3_2_is_jal_REG;
	reg REG_16;
	reg REG_17;
	reg REG_18;
	reg io_resp_f2_3_predicted_pc_REG_valid;
	reg [39:0] io_resp_f2_3_predicted_pc_REG_bits;
	wire io_resp_f2_3_predicted_pc_valid_0 = (REG_18 ? io_resp_f2_3_predicted_pc_REG_valid : io_resp_in_0_f2_3_predicted_pc_valid);
	wire [39:0] io_resp_f2_3_predicted_pc_bits_0 = (REG_18 ? io_resp_f2_3_predicted_pc_REG_bits : io_resp_in_0_f2_3_predicted_pc_bits);
	reg io_resp_f2_3_is_br_REG;
	wire io_resp_f2_3_is_br_0 = (REG_18 ? io_resp_f2_3_is_br_REG : io_resp_in_0_f2_3_is_br);
	reg io_resp_f2_3_is_jal_REG;
	reg REG_19;
	reg REG_20;
	reg REG_21;
	reg io_resp_f3_3_predicted_pc_REG_valid;
	reg [39:0] io_resp_f3_3_predicted_pc_REG_bits;
	reg io_resp_f3_3_is_br_REG;
	reg io_resp_f3_3_is_jal_REG;
	reg REG_22;
	reg REG_23;
	wire [39:0] _new_offset_value_T_5 = s1_update_bits_target - (s1_update_bits_pc + {37'h0000000000, s1_update_bits_cfi_idx_bits, 1'h0});
	wire offset_is_extended = ($signed(_new_offset_value_T_5) > 40'sh0000000fff) | ($signed(_new_offset_value_T_5) < -40'sh0000001000);
	wire _s1_update_wmeta_mask_T_1 = s1_update_bits_is_mispredict_update | s1_update_bits_is_repair_update;
	wire [3:0] s1_update_wbtb_mask = (4'h1 << s1_update_bits_cfi_idx_bits) & {4 {((s1_update_bits_cfi_idx_valid & s1_update_valid) & s1_update_bits_cfi_taken) & ~(_s1_update_wmeta_mask_T_1 | (|s1_update_bits_btb_mispredicts))}};
	wire btb_data_way_0_MPORT_2_en = doing_reset | ~s1_update_bits_meta[0];
	wire [6:0] btb_data_way_1_MPORT_6_addr = (doing_reset ? reset_idx : s1_update_idx[6:0]);
	wire [13:0] _GEN = {_new_offset_value_T_5[12:0], offset_is_extended};
	assign btb_data_way_0_MPORT_2_data_0 = (doing_reset ? 14'h0000 : _GEN);
	assign btb_data_way_0_MPORT_2_data_1 = (doing_reset ? 14'h0000 : _GEN);
	assign btb_data_way_0_MPORT_2_data_2 = (doing_reset ? 14'h0000 : _GEN);
	assign btb_data_way_0_MPORT_2_data_3 = (doing_reset ? 14'h0000 : _GEN);
	wire [3:0] _GEN_0 = (doing_reset ? 4'hf : s1_update_wbtb_mask);
	wire [30:0] _GEN_1 = {s1_update_bits_br_mask[0], (s1_update_bits_btb_mispredicts[0] ? 30'h00000000 : s1_update_idx[36:7])};
	wire [30:0] _GEN_2 = {s1_update_bits_br_mask[1], (s1_update_bits_btb_mispredicts[1] ? 30'h00000000 : s1_update_idx[36:7])};
	wire [30:0] _GEN_3 = {s1_update_bits_br_mask[2], (s1_update_bits_btb_mispredicts[2] ? 30'h00000000 : s1_update_idx[36:7])};
	wire [30:0] _GEN_4 = {s1_update_bits_br_mask[3], (s1_update_bits_btb_mispredicts[3] ? 30'h00000000 : s1_update_idx[36:7])};
	assign btb_meta_way_0_MPORT_3_data_0 = (doing_reset ? 31'h00000000 : _GEN_1);
	assign btb_meta_way_0_MPORT_3_data_1 = (doing_reset ? 31'h00000000 : _GEN_2);
	assign btb_meta_way_0_MPORT_3_data_2 = (doing_reset ? 31'h00000000 : _GEN_3);
	assign btb_meta_way_0_MPORT_3_data_3 = (doing_reset ? 31'h00000000 : _GEN_4);
	wire [3:0] _GEN_5 = (doing_reset ? 4'hf : (s1_update_wbtb_mask | s1_update_bits_br_mask) & ({4 {s1_update_valid & ~(_s1_update_wmeta_mask_T_1 | (|s1_update_bits_btb_mispredicts))}} | ({4 {s1_update_valid}} & s1_update_bits_btb_mispredicts)));
	wire btb_data_way_1_MPORT_6_en = doing_reset | s1_update_bits_meta[0];
	assign btb_data_way_1_MPORT_6_data_0 = (doing_reset ? 14'h0000 : _GEN);
	assign btb_data_way_1_MPORT_6_data_1 = (doing_reset ? 14'h0000 : _GEN);
	assign btb_data_way_1_MPORT_6_data_2 = (doing_reset ? 14'h0000 : _GEN);
	assign btb_data_way_1_MPORT_6_data_3 = (doing_reset ? 14'h0000 : _GEN);
	assign btb_meta_way_1_MPORT_7_data_0 = (doing_reset ? 31'h00000000 : _GEN_1);
	assign btb_meta_way_1_MPORT_7_data_1 = (doing_reset ? 31'h00000000 : _GEN_2);
	assign btb_meta_way_1_MPORT_7_data_2 = (doing_reset ? 31'h00000000 : _GEN_3);
	assign btb_meta_way_1_MPORT_7_data_3 = (doing_reset ? 31'h00000000 : _GEN_4);
	always @(posedge clock) begin : sv2v_autoblock_1
		reg s1_hit_ohs_0_0;
		reg s1_hit_ohs_1_0;
		reg s1_hit_ohs_2_0;
		reg s1_hit_ohs_3_0;
		reg s1_hits_0;
		reg s1_hits_1;
		reg s1_hits_2;
		reg s1_hits_3;
		reg s1_resp_0_valid;
		reg _GEN_6;
		reg s1_is_jal_0;
		reg s1_resp_1_valid;
		reg _GEN_7;
		reg s1_is_jal_1;
		reg s1_resp_2_valid;
		reg _GEN_8;
		reg s1_is_jal_2;
		reg s1_resp_3_valid;
		reg _GEN_9;
		reg s1_is_jal_3;
		s1_hit_ohs_0_0 = _btb_meta_way_0_ext_R0_data[29:0] == s1_idx[36:7];
		s1_hit_ohs_1_0 = _btb_meta_way_0_ext_R0_data[60:31] == s1_idx[36:7];
		s1_hit_ohs_2_0 = _btb_meta_way_0_ext_R0_data[91:62] == s1_idx[36:7];
		s1_hit_ohs_3_0 = _btb_meta_way_0_ext_R0_data[122:93] == s1_idx[36:7];
		s1_hits_0 = s1_hit_ohs_0_0 | (_btb_meta_way_1_ext_R0_data[29:0] == s1_idx[36:7]);
		s1_hits_1 = s1_hit_ohs_1_0 | (_btb_meta_way_1_ext_R0_data[60:31] == s1_idx[36:7]);
		s1_hits_2 = s1_hit_ohs_2_0 | (_btb_meta_way_1_ext_R0_data[91:62] == s1_idx[36:7]);
		s1_hits_3 = s1_hit_ohs_3_0 | (_btb_meta_way_1_ext_R0_data[122:93] == s1_idx[36:7]);
		s1_resp_0_valid = (~doing_reset & s1_valid) & s1_hits_0;
		_GEN_6 = (s1_hit_ohs_0_0 ? _btb_meta_way_0_ext_R0_data[30] : _btb_meta_way_1_ext_R0_data[30]);
		s1_is_jal_0 = (~doing_reset & s1_resp_0_valid) & ~_GEN_6;
		s1_resp_1_valid = (~doing_reset & s1_valid) & s1_hits_1;
		_GEN_7 = (s1_hit_ohs_1_0 ? _btb_meta_way_0_ext_R0_data[61] : _btb_meta_way_1_ext_R0_data[61]);
		s1_is_jal_1 = (~doing_reset & s1_resp_1_valid) & ~_GEN_7;
		s1_resp_2_valid = (~doing_reset & s1_valid) & s1_hits_2;
		_GEN_8 = (s1_hit_ohs_2_0 ? _btb_meta_way_0_ext_R0_data[92] : _btb_meta_way_1_ext_R0_data[92]);
		s1_is_jal_2 = (~doing_reset & s1_resp_2_valid) & ~_GEN_8;
		s1_resp_3_valid = (~doing_reset & s1_valid) & s1_hits_3;
		_GEN_9 = (s1_hit_ohs_3_0 ? _btb_meta_way_0_ext_R0_data[123] : _btb_meta_way_1_ext_R0_data[123]);
		s1_is_jal_3 = (~doing_reset & s1_resp_3_valid) & ~_GEN_9;
		s1_idx <= io_f0_pc[39:3];
		s1_valid <= io_f0_valid;
		s1_pc <= {io_f0_pc[39:3], 3'h0};
		s1_update_valid <= io_update_valid;
		s1_update_bits_is_mispredict_update <= io_update_bits_is_mispredict_update;
		s1_update_bits_is_repair_update <= io_update_bits_is_repair_update;
		s1_update_bits_btb_mispredicts <= io_update_bits_btb_mispredicts;
		s1_update_bits_pc <= {io_update_bits_pc[39:3], 3'h0};
		s1_update_bits_br_mask <= io_update_bits_br_mask;
		s1_update_bits_cfi_idx_valid <= io_update_bits_cfi_idx_valid;
		s1_update_bits_cfi_idx_bits <= io_update_bits_cfi_idx_bits;
		s1_update_bits_cfi_taken <= io_update_bits_cfi_taken;
		s1_update_bits_target <= io_update_bits_target;
		s1_update_bits_meta <= io_update_bits_meta;
		s1_update_idx <= io_update_bits_pc[39:3];
		f3_meta_REG_write_way <= (((s1_hits_0 | s1_hits_1) | s1_hits_2) | s1_hits_3 ? ~(((s1_hit_ohs_0_0 | s1_hit_ohs_1_0) | s1_hit_ohs_2_0) | s1_hit_ohs_3_0) : ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((s1_idx[7] ^ s1_idx[8]) ^ s1_idx[9]) ^ s1_idx[10]) ^ s1_idx[11]) ^ s1_idx[12]) ^ s1_idx[13]) ^ s1_idx[14]) ^ s1_idx[15]) ^ s1_idx[16]) ^ s1_idx[17]) ^ s1_idx[18]) ^ s1_idx[19]) ^ s1_idx[20]) ^ s1_idx[21]) ^ s1_idx[22]) ^ s1_idx[23]) ^ s1_idx[24]) ^ s1_idx[25]) ^ s1_idx[26]) ^ s1_idx[27]) ^ s1_idx[28]) ^ s1_idx[29]) ^ s1_idx[30]) ^ s1_idx[31]) ^ s1_idx[32]) ^ s1_idx[33]) ^ s1_idx[34]) ^ s1_idx[35]) ^ s1_idx[36]) ^ _btb_meta_way_0_ext_R0_data[0]) ^ _btb_meta_way_0_ext_R0_data[1]) ^ _btb_meta_way_0_ext_R0_data[2]) ^ _btb_meta_way_0_ext_R0_data[3]) ^ _btb_meta_way_0_ext_R0_data[4]) ^ _btb_meta_way_0_ext_R0_data[5]) ^ _btb_meta_way_0_ext_R0_data[6]) ^ _btb_meta_way_0_ext_R0_data[7]) ^ _btb_meta_way_0_ext_R0_data[8]) ^ _btb_meta_way_0_ext_R0_data[9]) ^ _btb_meta_way_0_ext_R0_data[10]) ^ _btb_meta_way_0_ext_R0_data[11]) ^ _btb_meta_way_0_ext_R0_data[12]) ^ _btb_meta_way_0_ext_R0_data[13]) ^ _btb_meta_way_0_ext_R0_data[14]) ^ _btb_meta_way_0_ext_R0_data[15]) ^ _btb_meta_way_0_ext_R0_data[16]) ^ _btb_meta_way_0_ext_R0_data[17]) ^ _btb_meta_way_0_ext_R0_data[18]) ^ _btb_meta_way_0_ext_R0_data[19]) ^ _btb_meta_way_0_ext_R0_data[20]) ^ _btb_meta_way_0_ext_R0_data[21]) ^ _btb_meta_way_0_ext_R0_data[22]) ^ _btb_meta_way_0_ext_R0_data[23]) ^ _btb_meta_way_0_ext_R0_data[24]) ^ _btb_meta_way_0_ext_R0_data[25]) ^ _btb_meta_way_0_ext_R0_data[26]) ^ _btb_meta_way_0_ext_R0_data[27]) ^ _btb_meta_way_0_ext_R0_data[28]) ^ _btb_meta_way_0_ext_R0_data[29]) ^ _btb_meta_way_0_ext_R0_data[31]) ^ _btb_meta_way_0_ext_R0_data[32]) ^ _btb_meta_way_0_ext_R0_data[33]) ^ _btb_meta_way_0_ext_R0_data[34]) ^ _btb_meta_way_0_ext_R0_data[35]) ^ _btb_meta_way_0_ext_R0_data[36]) ^ _btb_meta_way_0_ext_R0_data[37]) ^ _btb_meta_way_0_ext_R0_data[38]) ^ _btb_meta_way_0_ext_R0_data[39]) ^ _btb_meta_way_0_ext_R0_data[40]) ^ _btb_meta_way_0_ext_R0_data[41]) ^ _btb_meta_way_0_ext_R0_data[42]) ^ _btb_meta_way_0_ext_R0_data[43]) ^ _btb_meta_way_0_ext_R0_data[44]) ^ _btb_meta_way_0_ext_R0_data[45]) ^ _btb_meta_way_0_ext_R0_data[46]) ^ _btb_meta_way_0_ext_R0_data[47]) ^ _btb_meta_way_0_ext_R0_data[48]) ^ _btb_meta_way_0_ext_R0_data[49]) ^ _btb_meta_way_0_ext_R0_data[50]) ^ _btb_meta_way_0_ext_R0_data[51]) ^ _btb_meta_way_0_ext_R0_data[52]) ^ _btb_meta_way_0_ext_R0_data[53]) ^ _btb_meta_way_0_ext_R0_data[54]) ^ _btb_meta_way_0_ext_R0_data[55]) ^ _btb_meta_way_0_ext_R0_data[56]) ^ _btb_meta_way_0_ext_R0_data[57]) ^ _btb_meta_way_0_ext_R0_data[58]) ^ _btb_meta_way_0_ext_R0_data[59]) ^ _btb_meta_way_0_ext_R0_data[60]) ^ _btb_meta_way_0_ext_R0_data[62]) ^ _btb_meta_way_0_ext_R0_data[63]) ^ _btb_meta_way_0_ext_R0_data[64]) ^ _btb_meta_way_0_ext_R0_data[65]) ^ _btb_meta_way_0_ext_R0_data[66]) ^ _btb_meta_way_0_ext_R0_data[67]) ^ _btb_meta_way_0_ext_R0_data[68]) ^ _btb_meta_way_0_ext_R0_data[69]) ^ _btb_meta_way_0_ext_R0_data[70]) ^ _btb_meta_way_0_ext_R0_data[71]) ^ _btb_meta_way_0_ext_R0_data[72]) ^ _btb_meta_way_0_ext_R0_data[73]) ^ _btb_meta_way_0_ext_R0_data[74]) ^ _btb_meta_way_0_ext_R0_data[75]) ^ _btb_meta_way_0_ext_R0_data[76]) ^ _btb_meta_way_0_ext_R0_data[77]) ^ _btb_meta_way_0_ext_R0_data[78]) ^ _btb_meta_way_0_ext_R0_data[79]) ^ _btb_meta_way_0_ext_R0_data[80]) ^ _btb_meta_way_0_ext_R0_data[81]) ^ _btb_meta_way_0_ext_R0_data[82]) ^ _btb_meta_way_0_ext_R0_data[83]) ^ _btb_meta_way_0_ext_R0_data[84]) ^ _btb_meta_way_0_ext_R0_data[85]) ^ _btb_meta_way_0_ext_R0_data[86]) ^ _btb_meta_way_0_ext_R0_data[87]) ^ _btb_meta_way_0_ext_R0_data[88]) ^ _btb_meta_way_0_ext_R0_data[89]) ^ _btb_meta_way_0_ext_R0_data[90]) ^ _btb_meta_way_0_ext_R0_data[91]) ^ _btb_meta_way_0_ext_R0_data[93]) ^ _btb_meta_way_0_ext_R0_data[94]) ^ _btb_meta_way_0_ext_R0_data[95]) ^ _btb_meta_way_0_ext_R0_data[96]) ^ _btb_meta_way_0_ext_R0_data[97]) ^ _btb_meta_way_0_ext_R0_data[98]) ^ _btb_meta_way_0_ext_R0_data[99]) ^ _btb_meta_way_0_ext_R0_data[100]) ^ _btb_meta_way_0_ext_R0_data[101]) ^ _btb_meta_way_0_ext_R0_data[102]) ^ _btb_meta_way_0_ext_R0_data[103]) ^ _btb_meta_way_0_ext_R0_data[104]) ^ _btb_meta_way_0_ext_R0_data[105]) ^ _btb_meta_way_0_ext_R0_data[106]) ^ _btb_meta_way_0_ext_R0_data[107]) ^ _btb_meta_way_0_ext_R0_data[108]) ^ _btb_meta_way_0_ext_R0_data[109]) ^ _btb_meta_way_0_ext_R0_data[110]) ^ _btb_meta_way_0_ext_R0_data[111]) ^ _btb_meta_way_0_ext_R0_data[112]) ^ _btb_meta_way_0_ext_R0_data[113]) ^ _btb_meta_way_0_ext_R0_data[114]) ^ _btb_meta_way_0_ext_R0_data[115]) ^ _btb_meta_way_0_ext_R0_data[116]) ^ _btb_meta_way_0_ext_R0_data[117]) ^ _btb_meta_way_0_ext_R0_data[118]) ^ _btb_meta_way_0_ext_R0_data[119]) ^ _btb_meta_way_0_ext_R0_data[120]) ^ _btb_meta_way_0_ext_R0_data[121]) ^ _btb_meta_way_0_ext_R0_data[122]) ^ _btb_meta_way_1_ext_R0_data[0]) ^ _btb_meta_way_1_ext_R0_data[1]) ^ _btb_meta_way_1_ext_R0_data[2]) ^ _btb_meta_way_1_ext_R0_data[3]) ^ _btb_meta_way_1_ext_R0_data[4]) ^ _btb_meta_way_1_ext_R0_data[5]) ^ _btb_meta_way_1_ext_R0_data[6]) ^ _btb_meta_way_1_ext_R0_data[7]) ^ _btb_meta_way_1_ext_R0_data[8]) ^ _btb_meta_way_1_ext_R0_data[9]) ^ _btb_meta_way_1_ext_R0_data[10]) ^ _btb_meta_way_1_ext_R0_data[11]) ^ _btb_meta_way_1_ext_R0_data[12]) ^ _btb_meta_way_1_ext_R0_data[13]) ^ _btb_meta_way_1_ext_R0_data[14]) ^ _btb_meta_way_1_ext_R0_data[15]) ^ _btb_meta_way_1_ext_R0_data[16]) ^ _btb_meta_way_1_ext_R0_data[17]) ^ _btb_meta_way_1_ext_R0_data[18]) ^ _btb_meta_way_1_ext_R0_data[19]) ^ _btb_meta_way_1_ext_R0_data[20]) ^ _btb_meta_way_1_ext_R0_data[21]) ^ _btb_meta_way_1_ext_R0_data[22]) ^ _btb_meta_way_1_ext_R0_data[23]) ^ _btb_meta_way_1_ext_R0_data[24]) ^ _btb_meta_way_1_ext_R0_data[25]) ^ _btb_meta_way_1_ext_R0_data[26]) ^ _btb_meta_way_1_ext_R0_data[27]) ^ _btb_meta_way_1_ext_R0_data[28]) ^ _btb_meta_way_1_ext_R0_data[29]) ^ _btb_meta_way_1_ext_R0_data[31]) ^ _btb_meta_way_1_ext_R0_data[32]) ^ _btb_meta_way_1_ext_R0_data[33]) ^ _btb_meta_way_1_ext_R0_data[34]) ^ _btb_meta_way_1_ext_R0_data[35]) ^ _btb_meta_way_1_ext_R0_data[36]) ^ _btb_meta_way_1_ext_R0_data[37]) ^ _btb_meta_way_1_ext_R0_data[38]) ^ _btb_meta_way_1_ext_R0_data[39]) ^ _btb_meta_way_1_ext_R0_data[40]) ^ _btb_meta_way_1_ext_R0_data[41]) ^ _btb_meta_way_1_ext_R0_data[42]) ^ _btb_meta_way_1_ext_R0_data[43]) ^ _btb_meta_way_1_ext_R0_data[44]) ^ _btb_meta_way_1_ext_R0_data[45]) ^ _btb_meta_way_1_ext_R0_data[46]) ^ _btb_meta_way_1_ext_R0_data[47]) ^ _btb_meta_way_1_ext_R0_data[48]) ^ _btb_meta_way_1_ext_R0_data[49]) ^ _btb_meta_way_1_ext_R0_data[50]) ^ _btb_meta_way_1_ext_R0_data[51]) ^ _btb_meta_way_1_ext_R0_data[52]) ^ _btb_meta_way_1_ext_R0_data[53]) ^ _btb_meta_way_1_ext_R0_data[54]) ^ _btb_meta_way_1_ext_R0_data[55]) ^ _btb_meta_way_1_ext_R0_data[56]) ^ _btb_meta_way_1_ext_R0_data[57]) ^ _btb_meta_way_1_ext_R0_data[58]) ^ _btb_meta_way_1_ext_R0_data[59]) ^ _btb_meta_way_1_ext_R0_data[60]) ^ _btb_meta_way_1_ext_R0_data[62]) ^ _btb_meta_way_1_ext_R0_data[63]) ^ _btb_meta_way_1_ext_R0_data[64]) ^ _btb_meta_way_1_ext_R0_data[65]) ^ _btb_meta_way_1_ext_R0_data[66]) ^ _btb_meta_way_1_ext_R0_data[67]) ^ _btb_meta_way_1_ext_R0_data[68]) ^ _btb_meta_way_1_ext_R0_data[69]) ^ _btb_meta_way_1_ext_R0_data[70]) ^ _btb_meta_way_1_ext_R0_data[71]) ^ _btb_meta_way_1_ext_R0_data[72]) ^ _btb_meta_way_1_ext_R0_data[73]) ^ _btb_meta_way_1_ext_R0_data[74]) ^ _btb_meta_way_1_ext_R0_data[75]) ^ _btb_meta_way_1_ext_R0_data[76]) ^ _btb_meta_way_1_ext_R0_data[77]) ^ _btb_meta_way_1_ext_R0_data[78]) ^ _btb_meta_way_1_ext_R0_data[79]) ^ _btb_meta_way_1_ext_R0_data[80]) ^ _btb_meta_way_1_ext_R0_data[81]) ^ _btb_meta_way_1_ext_R0_data[82]) ^ _btb_meta_way_1_ext_R0_data[83]) ^ _btb_meta_way_1_ext_R0_data[84]) ^ _btb_meta_way_1_ext_R0_data[85]) ^ _btb_meta_way_1_ext_R0_data[86]) ^ _btb_meta_way_1_ext_R0_data[87]) ^ _btb_meta_way_1_ext_R0_data[88]) ^ _btb_meta_way_1_ext_R0_data[89]) ^ _btb_meta_way_1_ext_R0_data[90]) ^ _btb_meta_way_1_ext_R0_data[91]) ^ _btb_meta_way_1_ext_R0_data[93]) ^ _btb_meta_way_1_ext_R0_data[94]) ^ _btb_meta_way_1_ext_R0_data[95]) ^ _btb_meta_way_1_ext_R0_data[96]) ^ _btb_meta_way_1_ext_R0_data[97]) ^ _btb_meta_way_1_ext_R0_data[98]) ^ _btb_meta_way_1_ext_R0_data[99]) ^ _btb_meta_way_1_ext_R0_data[100]) ^ _btb_meta_way_1_ext_R0_data[101]) ^ _btb_meta_way_1_ext_R0_data[102]) ^ _btb_meta_way_1_ext_R0_data[103]) ^ _btb_meta_way_1_ext_R0_data[104]) ^ _btb_meta_way_1_ext_R0_data[105]) ^ _btb_meta_way_1_ext_R0_data[106]) ^ _btb_meta_way_1_ext_R0_data[107]) ^ _btb_meta_way_1_ext_R0_data[108]) ^ _btb_meta_way_1_ext_R0_data[109]) ^ _btb_meta_way_1_ext_R0_data[110]) ^ _btb_meta_way_1_ext_R0_data[111]) ^ _btb_meta_way_1_ext_R0_data[112]) ^ _btb_meta_way_1_ext_R0_data[113]) ^ _btb_meta_way_1_ext_R0_data[114]) ^ _btb_meta_way_1_ext_R0_data[115]) ^ _btb_meta_way_1_ext_R0_data[116]) ^ _btb_meta_way_1_ext_R0_data[117]) ^ _btb_meta_way_1_ext_R0_data[118]) ^ _btb_meta_way_1_ext_R0_data[119]) ^ _btb_meta_way_1_ext_R0_data[120]) ^ _btb_meta_way_1_ext_R0_data[121]) ^ _btb_meta_way_1_ext_R0_data[122]);
		f3_meta_write_way <= f3_meta_REG_write_way;
		REG <= s1_hits_0;
		io_resp_f2_0_predicted_pc_REG_valid <= s1_resp_0_valid;
		io_resp_f2_0_predicted_pc_REG_bits <= (s1_hit_ohs_0_0 ? (_btb_data_way_0_ext_R0_data[0] ? _btb_ebtb_ext_R0_data : s1_pc + {{27 {_btb_data_way_0_ext_R0_data[13]}}, _btb_data_way_0_ext_R0_data[13:1]}) : (_btb_data_way_1_ext_R0_data[0] ? _btb_ebtb_ext_R0_data : s1_pc + {{27 {_btb_data_way_1_ext_R0_data[13]}}, _btb_data_way_1_ext_R0_data[13:1]}));
		io_resp_f2_0_is_br_REG <= (~doing_reset & s1_resp_0_valid) & _GEN_6;
		io_resp_f2_0_is_jal_REG <= s1_is_jal_0;
		REG_1 <= s1_is_jal_0;
		REG_2 <= s1_hits_0;
		REG_3 <= REG_2;
		io_resp_f3_0_predicted_pc_REG_valid <= io_resp_f2_0_predicted_pc_valid_0;
		io_resp_f3_0_predicted_pc_REG_bits <= io_resp_f2_0_predicted_pc_bits_0;
		io_resp_f3_0_is_br_REG <= io_resp_f2_0_is_br_0;
		io_resp_f3_0_is_jal_REG <= (REG ? io_resp_f2_0_is_jal_REG : io_resp_in_0_f2_0_is_jal);
		REG_4 <= s1_is_jal_0;
		REG_5 <= REG_4;
		REG_6 <= s1_hits_1;
		io_resp_f2_1_predicted_pc_REG_valid <= s1_resp_1_valid;
		io_resp_f2_1_predicted_pc_REG_bits <= (s1_hit_ohs_1_0 ? (_btb_data_way_0_ext_R0_data[14] ? _btb_ebtb_ext_R0_data : (s1_pc + {{27 {_btb_data_way_0_ext_R0_data[27]}}, _btb_data_way_0_ext_R0_data[27:15]}) + 40'h0000000002) : (_btb_data_way_1_ext_R0_data[14] ? _btb_ebtb_ext_R0_data : (s1_pc + {{27 {_btb_data_way_1_ext_R0_data[27]}}, _btb_data_way_1_ext_R0_data[27:15]}) + 40'h0000000002));
		io_resp_f2_1_is_br_REG <= (~doing_reset & s1_resp_1_valid) & _GEN_7;
		io_resp_f2_1_is_jal_REG <= s1_is_jal_1;
		REG_7 <= s1_is_jal_1;
		REG_8 <= s1_hits_1;
		REG_9 <= REG_8;
		io_resp_f3_1_predicted_pc_REG_valid <= io_resp_f2_1_predicted_pc_valid_0;
		io_resp_f3_1_predicted_pc_REG_bits <= io_resp_f2_1_predicted_pc_bits_0;
		io_resp_f3_1_is_br_REG <= io_resp_f2_1_is_br_0;
		io_resp_f3_1_is_jal_REG <= (REG_6 ? io_resp_f2_1_is_jal_REG : io_resp_in_0_f2_1_is_jal);
		REG_10 <= s1_is_jal_1;
		REG_11 <= REG_10;
		REG_12 <= s1_hits_2;
		io_resp_f2_2_predicted_pc_REG_valid <= s1_resp_2_valid;
		io_resp_f2_2_predicted_pc_REG_bits <= (s1_hit_ohs_2_0 ? (_btb_data_way_0_ext_R0_data[28] ? _btb_ebtb_ext_R0_data : (s1_pc + {{27 {_btb_data_way_0_ext_R0_data[41]}}, _btb_data_way_0_ext_R0_data[41:29]}) + 40'h0000000004) : (_btb_data_way_1_ext_R0_data[28] ? _btb_ebtb_ext_R0_data : (s1_pc + {{27 {_btb_data_way_1_ext_R0_data[41]}}, _btb_data_way_1_ext_R0_data[41:29]}) + 40'h0000000004));
		io_resp_f2_2_is_br_REG <= (~doing_reset & s1_resp_2_valid) & _GEN_8;
		io_resp_f2_2_is_jal_REG <= s1_is_jal_2;
		REG_13 <= s1_is_jal_2;
		REG_14 <= s1_hits_2;
		REG_15 <= REG_14;
		io_resp_f3_2_predicted_pc_REG_valid <= io_resp_f2_2_predicted_pc_valid_0;
		io_resp_f3_2_predicted_pc_REG_bits <= io_resp_f2_2_predicted_pc_bits_0;
		io_resp_f3_2_is_br_REG <= io_resp_f2_2_is_br_0;
		io_resp_f3_2_is_jal_REG <= (REG_12 ? io_resp_f2_2_is_jal_REG : io_resp_in_0_f2_2_is_jal);
		REG_16 <= s1_is_jal_2;
		REG_17 <= REG_16;
		REG_18 <= s1_hits_3;
		io_resp_f2_3_predicted_pc_REG_valid <= s1_resp_3_valid;
		io_resp_f2_3_predicted_pc_REG_bits <= (s1_hit_ohs_3_0 ? (_btb_data_way_0_ext_R0_data[42] ? _btb_ebtb_ext_R0_data : (s1_pc + {{27 {_btb_data_way_0_ext_R0_data[55]}}, _btb_data_way_0_ext_R0_data[55:43]}) + 40'h0000000006) : (_btb_data_way_1_ext_R0_data[42] ? _btb_ebtb_ext_R0_data : (s1_pc + {{27 {_btb_data_way_1_ext_R0_data[55]}}, _btb_data_way_1_ext_R0_data[55:43]}) + 40'h0000000006));
		io_resp_f2_3_is_br_REG <= (~doing_reset & s1_resp_3_valid) & _GEN_9;
		io_resp_f2_3_is_jal_REG <= s1_is_jal_3;
		REG_19 <= s1_is_jal_3;
		REG_20 <= s1_hits_3;
		REG_21 <= REG_20;
		io_resp_f3_3_predicted_pc_REG_valid <= io_resp_f2_3_predicted_pc_valid_0;
		io_resp_f3_3_predicted_pc_REG_bits <= io_resp_f2_3_predicted_pc_bits_0;
		io_resp_f3_3_is_br_REG <= io_resp_f2_3_is_br_0;
		io_resp_f3_3_is_jal_REG <= (REG_18 ? io_resp_f2_3_is_jal_REG : io_resp_in_0_f2_3_is_jal);
		REG_22 <= s1_is_jal_3;
		REG_23 <= REG_22;
		if (reset) begin
			doing_reset <= 1'h1;
			reset_idx <= 7'h00;
		end
		else begin
			doing_reset <= (reset_idx != 7'h7f) & doing_reset;
			reset_idx <= reset_idx + {6'h00, doing_reset};
		end
	end
	btb_meta_way_128x124 btb_meta_way_0_ext(
		.R0_addr(io_f0_pc[9:3]),
		.R0_en(io_f0_valid),
		.R0_clk(clock),
		.R0_data(_btb_meta_way_0_ext_R0_data),
		.W0_addr(btb_data_way_1_MPORT_6_addr),
		.W0_en(btb_data_way_0_MPORT_2_en),
		.W0_clk(clock),
		.W0_data({btb_meta_way_0_MPORT_3_data_3, btb_meta_way_0_MPORT_3_data_2, btb_meta_way_0_MPORT_3_data_1, btb_meta_way_0_MPORT_3_data_0}),
		.W0_mask(_GEN_5)
	);
	btb_data_way_128x56 btb_data_way_0_ext(
		.R0_addr(io_f0_pc[9:3]),
		.R0_en(io_f0_valid),
		.R0_clk(clock),
		.R0_data(_btb_data_way_0_ext_R0_data),
		.W0_addr(btb_data_way_1_MPORT_6_addr),
		.W0_en(btb_data_way_0_MPORT_2_en),
		.W0_clk(clock),
		.W0_data({btb_data_way_0_MPORT_2_data_3, btb_data_way_0_MPORT_2_data_2, btb_data_way_0_MPORT_2_data_1, btb_data_way_0_MPORT_2_data_0}),
		.W0_mask(_GEN_0)
	);
	btb_meta_way_128x124 btb_meta_way_1_ext(
		.R0_addr(io_f0_pc[9:3]),
		.R0_en(io_f0_valid),
		.R0_clk(clock),
		.R0_data(_btb_meta_way_1_ext_R0_data),
		.W0_addr(btb_data_way_1_MPORT_6_addr),
		.W0_en(btb_data_way_1_MPORT_6_en),
		.W0_clk(clock),
		.W0_data({btb_meta_way_1_MPORT_7_data_3, btb_meta_way_1_MPORT_7_data_2, btb_meta_way_1_MPORT_7_data_1, btb_meta_way_1_MPORT_7_data_0}),
		.W0_mask(_GEN_5)
	);
	btb_data_way_128x56 btb_data_way_1_ext(
		.R0_addr(io_f0_pc[9:3]),
		.R0_en(io_f0_valid),
		.R0_clk(clock),
		.R0_data(_btb_data_way_1_ext_R0_data),
		.W0_addr(btb_data_way_1_MPORT_6_addr),
		.W0_en(btb_data_way_1_MPORT_6_en),
		.W0_clk(clock),
		.W0_data({btb_data_way_1_MPORT_6_data_3, btb_data_way_1_MPORT_6_data_2, btb_data_way_1_MPORT_6_data_1, btb_data_way_1_MPORT_6_data_0}),
		.W0_mask(_GEN_0)
	);
	btb_ebtb_128x40 btb_ebtb_ext(
		.R0_addr(io_f0_pc[9:3]),
		.R0_en(io_f0_valid),
		.R0_clk(clock),
		.R0_data(_btb_ebtb_ext_R0_data),
		.W0_addr(s1_update_idx[6:0]),
		.W0_en(|s1_update_wbtb_mask & offset_is_extended),
		.W0_clk(clock),
		.W0_data(s1_update_bits_target)
	);
	assign io_resp_f1_0_taken = io_resp_in_0_f1_0_taken;
	assign io_resp_f1_0_is_br = io_resp_in_0_f1_0_is_br;
	assign io_resp_f1_0_predicted_pc_valid = io_resp_in_0_f1_0_predicted_pc_valid;
	assign io_resp_f1_0_predicted_pc_bits = io_resp_in_0_f1_0_predicted_pc_bits;
	assign io_resp_f1_1_taken = io_resp_in_0_f1_1_taken;
	assign io_resp_f1_1_is_br = io_resp_in_0_f1_1_is_br;
	assign io_resp_f1_1_predicted_pc_valid = io_resp_in_0_f1_1_predicted_pc_valid;
	assign io_resp_f1_1_predicted_pc_bits = io_resp_in_0_f1_1_predicted_pc_bits;
	assign io_resp_f1_2_taken = io_resp_in_0_f1_2_taken;
	assign io_resp_f1_2_is_br = io_resp_in_0_f1_2_is_br;
	assign io_resp_f1_2_predicted_pc_valid = io_resp_in_0_f1_2_predicted_pc_valid;
	assign io_resp_f1_2_predicted_pc_bits = io_resp_in_0_f1_2_predicted_pc_bits;
	assign io_resp_f1_3_taken = io_resp_in_0_f1_3_taken;
	assign io_resp_f1_3_is_br = io_resp_in_0_f1_3_is_br;
	assign io_resp_f1_3_predicted_pc_valid = io_resp_in_0_f1_3_predicted_pc_valid;
	assign io_resp_f1_3_predicted_pc_bits = io_resp_in_0_f1_3_predicted_pc_bits;
	assign io_resp_f2_0_taken = (REG & REG_1) | io_resp_in_0_f2_0_taken;
	assign io_resp_f2_0_is_br = io_resp_f2_0_is_br_0;
	assign io_resp_f2_0_predicted_pc_valid = io_resp_f2_0_predicted_pc_valid_0;
	assign io_resp_f2_0_predicted_pc_bits = io_resp_f2_0_predicted_pc_bits_0;
	assign io_resp_f2_1_taken = (REG_6 & REG_7) | io_resp_in_0_f2_1_taken;
	assign io_resp_f2_1_is_br = io_resp_f2_1_is_br_0;
	assign io_resp_f2_1_predicted_pc_valid = io_resp_f2_1_predicted_pc_valid_0;
	assign io_resp_f2_1_predicted_pc_bits = io_resp_f2_1_predicted_pc_bits_0;
	assign io_resp_f2_2_taken = (REG_12 & REG_13) | io_resp_in_0_f2_2_taken;
	assign io_resp_f2_2_is_br = io_resp_f2_2_is_br_0;
	assign io_resp_f2_2_predicted_pc_valid = io_resp_f2_2_predicted_pc_valid_0;
	assign io_resp_f2_2_predicted_pc_bits = io_resp_f2_2_predicted_pc_bits_0;
	assign io_resp_f2_3_taken = (REG_18 & REG_19) | io_resp_in_0_f2_3_taken;
	assign io_resp_f2_3_is_br = io_resp_f2_3_is_br_0;
	assign io_resp_f2_3_predicted_pc_valid = io_resp_f2_3_predicted_pc_valid_0;
	assign io_resp_f2_3_predicted_pc_bits = io_resp_f2_3_predicted_pc_bits_0;
	assign io_resp_f3_0_taken = (REG_3 & REG_5) | io_resp_in_0_f3_0_taken;
	assign io_resp_f3_0_is_br = (REG_3 ? io_resp_f3_0_is_br_REG : io_resp_in_0_f3_0_is_br);
	assign io_resp_f3_0_is_jal = (REG_3 ? io_resp_f3_0_is_jal_REG : io_resp_in_0_f3_0_is_jal);
	assign io_resp_f3_0_predicted_pc_valid = (REG_3 ? io_resp_f3_0_predicted_pc_REG_valid : io_resp_in_0_f3_0_predicted_pc_valid);
	assign io_resp_f3_0_predicted_pc_bits = (REG_3 ? io_resp_f3_0_predicted_pc_REG_bits : io_resp_in_0_f3_0_predicted_pc_bits);
	assign io_resp_f3_1_taken = (REG_9 & REG_11) | io_resp_in_0_f3_1_taken;
	assign io_resp_f3_1_is_br = (REG_9 ? io_resp_f3_1_is_br_REG : io_resp_in_0_f3_1_is_br);
	assign io_resp_f3_1_is_jal = (REG_9 ? io_resp_f3_1_is_jal_REG : io_resp_in_0_f3_1_is_jal);
	assign io_resp_f3_1_predicted_pc_valid = (REG_9 ? io_resp_f3_1_predicted_pc_REG_valid : io_resp_in_0_f3_1_predicted_pc_valid);
	assign io_resp_f3_1_predicted_pc_bits = (REG_9 ? io_resp_f3_1_predicted_pc_REG_bits : io_resp_in_0_f3_1_predicted_pc_bits);
	assign io_resp_f3_2_taken = (REG_15 & REG_17) | io_resp_in_0_f3_2_taken;
	assign io_resp_f3_2_is_br = (REG_15 ? io_resp_f3_2_is_br_REG : io_resp_in_0_f3_2_is_br);
	assign io_resp_f3_2_is_jal = (REG_15 ? io_resp_f3_2_is_jal_REG : io_resp_in_0_f3_2_is_jal);
	assign io_resp_f3_2_predicted_pc_valid = (REG_15 ? io_resp_f3_2_predicted_pc_REG_valid : io_resp_in_0_f3_2_predicted_pc_valid);
	assign io_resp_f3_2_predicted_pc_bits = (REG_15 ? io_resp_f3_2_predicted_pc_REG_bits : io_resp_in_0_f3_2_predicted_pc_bits);
	assign io_resp_f3_3_taken = (REG_21 & REG_23) | io_resp_in_0_f3_3_taken;
	assign io_resp_f3_3_is_br = (REG_21 ? io_resp_f3_3_is_br_REG : io_resp_in_0_f3_3_is_br);
	assign io_resp_f3_3_is_jal = (REG_21 ? io_resp_f3_3_is_jal_REG : io_resp_in_0_f3_3_is_jal);
	assign io_resp_f3_3_predicted_pc_valid = (REG_21 ? io_resp_f3_3_predicted_pc_REG_valid : io_resp_in_0_f3_3_predicted_pc_valid);
	assign io_resp_f3_3_predicted_pc_bits = (REG_21 ? io_resp_f3_3_predicted_pc_REG_bits : io_resp_in_0_f3_3_predicted_pc_bits);
	assign io_f3_meta = {119'h000000000000000000000000000000, f3_meta_write_way};
endmodule
