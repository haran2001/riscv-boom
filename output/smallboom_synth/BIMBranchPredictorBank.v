module BIMBranchPredictorBank (
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
	io_resp_in_0_f2_0_is_br,
	io_resp_in_0_f2_0_is_jal,
	io_resp_in_0_f2_0_predicted_pc_valid,
	io_resp_in_0_f2_0_predicted_pc_bits,
	io_resp_in_0_f2_1_is_br,
	io_resp_in_0_f2_1_is_jal,
	io_resp_in_0_f2_1_predicted_pc_valid,
	io_resp_in_0_f2_1_predicted_pc_bits,
	io_resp_in_0_f2_2_is_br,
	io_resp_in_0_f2_2_is_jal,
	io_resp_in_0_f2_2_predicted_pc_valid,
	io_resp_in_0_f2_2_predicted_pc_bits,
	io_resp_in_0_f2_3_is_br,
	io_resp_in_0_f2_3_is_jal,
	io_resp_in_0_f2_3_predicted_pc_valid,
	io_resp_in_0_f2_3_predicted_pc_bits,
	io_resp_in_0_f3_0_is_br,
	io_resp_in_0_f3_0_is_jal,
	io_resp_in_0_f3_0_predicted_pc_valid,
	io_resp_in_0_f3_0_predicted_pc_bits,
	io_resp_in_0_f3_1_is_br,
	io_resp_in_0_f3_1_is_jal,
	io_resp_in_0_f3_1_predicted_pc_valid,
	io_resp_in_0_f3_1_predicted_pc_bits,
	io_resp_in_0_f3_2_is_br,
	io_resp_in_0_f3_2_is_jal,
	io_resp_in_0_f3_2_predicted_pc_valid,
	io_resp_in_0_f3_2_predicted_pc_bits,
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
	io_resp_f2_0_is_jal,
	io_resp_f2_0_predicted_pc_valid,
	io_resp_f2_0_predicted_pc_bits,
	io_resp_f2_1_taken,
	io_resp_f2_1_is_br,
	io_resp_f2_1_is_jal,
	io_resp_f2_1_predicted_pc_valid,
	io_resp_f2_1_predicted_pc_bits,
	io_resp_f2_2_taken,
	io_resp_f2_2_is_br,
	io_resp_f2_2_is_jal,
	io_resp_f2_2_predicted_pc_valid,
	io_resp_f2_2_predicted_pc_bits,
	io_resp_f2_3_taken,
	io_resp_f2_3_is_br,
	io_resp_f2_3_is_jal,
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
	io_update_bits_cfi_is_br,
	io_update_bits_cfi_is_jal,
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
	input io_resp_in_0_f2_0_is_br;
	input io_resp_in_0_f2_0_is_jal;
	input io_resp_in_0_f2_0_predicted_pc_valid;
	input [39:0] io_resp_in_0_f2_0_predicted_pc_bits;
	input io_resp_in_0_f2_1_is_br;
	input io_resp_in_0_f2_1_is_jal;
	input io_resp_in_0_f2_1_predicted_pc_valid;
	input [39:0] io_resp_in_0_f2_1_predicted_pc_bits;
	input io_resp_in_0_f2_2_is_br;
	input io_resp_in_0_f2_2_is_jal;
	input io_resp_in_0_f2_2_predicted_pc_valid;
	input [39:0] io_resp_in_0_f2_2_predicted_pc_bits;
	input io_resp_in_0_f2_3_is_br;
	input io_resp_in_0_f2_3_is_jal;
	input io_resp_in_0_f2_3_predicted_pc_valid;
	input [39:0] io_resp_in_0_f2_3_predicted_pc_bits;
	input io_resp_in_0_f3_0_is_br;
	input io_resp_in_0_f3_0_is_jal;
	input io_resp_in_0_f3_0_predicted_pc_valid;
	input [39:0] io_resp_in_0_f3_0_predicted_pc_bits;
	input io_resp_in_0_f3_1_is_br;
	input io_resp_in_0_f3_1_is_jal;
	input io_resp_in_0_f3_1_predicted_pc_valid;
	input [39:0] io_resp_in_0_f3_1_predicted_pc_bits;
	input io_resp_in_0_f3_2_is_br;
	input io_resp_in_0_f3_2_is_jal;
	input io_resp_in_0_f3_2_predicted_pc_valid;
	input [39:0] io_resp_in_0_f3_2_predicted_pc_bits;
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
	output wire io_resp_f2_0_is_jal;
	output wire io_resp_f2_0_predicted_pc_valid;
	output wire [39:0] io_resp_f2_0_predicted_pc_bits;
	output wire io_resp_f2_1_taken;
	output wire io_resp_f2_1_is_br;
	output wire io_resp_f2_1_is_jal;
	output wire io_resp_f2_1_predicted_pc_valid;
	output wire [39:0] io_resp_f2_1_predicted_pc_bits;
	output wire io_resp_f2_2_taken;
	output wire io_resp_f2_2_is_br;
	output wire io_resp_f2_2_is_jal;
	output wire io_resp_f2_2_predicted_pc_valid;
	output wire [39:0] io_resp_f2_2_predicted_pc_bits;
	output wire io_resp_f2_3_taken;
	output wire io_resp_f2_3_is_br;
	output wire io_resp_f2_3_is_jal;
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
	input io_update_bits_cfi_is_br;
	input io_update_bits_cfi_is_jal;
	input [119:0] io_update_bits_meta;
	wire [1:0] wdata_7_3;
	wire [1:0] wdata_7_2;
	wire [1:0] wdata_7_1;
	wire [1:0] wdata_7_0;
	wire [7:0] widx_7;
	wire [7:0] bim_col_7_r_7_addr;
	wire bim_col_7_r_7_en;
	reg [1:0] REG_7_3;
	reg [1:0] REG_7_2;
	reg [1:0] REG_7_1;
	reg [1:0] REG_7_0;
	wire [1:0] wdata_6_3;
	wire [1:0] wdata_6_2;
	wire [1:0] wdata_6_1;
	wire [1:0] wdata_6_0;
	wire [7:0] widx_6;
	wire [7:0] bim_col_6_r_6_addr;
	wire bim_col_6_r_6_en;
	reg [1:0] REG_6_3;
	reg [1:0] REG_6_2;
	reg [1:0] REG_6_1;
	reg [1:0] REG_6_0;
	wire [1:0] wdata_5_3;
	wire [1:0] wdata_5_2;
	wire [1:0] wdata_5_1;
	wire [1:0] wdata_5_0;
	wire [7:0] widx_5;
	wire [7:0] bim_col_5_r_5_addr;
	wire bim_col_5_r_5_en;
	reg [1:0] REG_5_3;
	reg [1:0] REG_5_2;
	reg [1:0] REG_5_1;
	reg [1:0] REG_5_0;
	wire [1:0] wdata_4_3;
	wire [1:0] wdata_4_2;
	wire [1:0] wdata_4_1;
	wire [1:0] wdata_4_0;
	wire [7:0] widx_4;
	wire [7:0] bim_col_4_r_4_addr;
	wire bim_col_4_r_4_en;
	reg [1:0] REG_4_3;
	reg [1:0] REG_4_2;
	reg [1:0] REG_4_1;
	reg [1:0] REG_4_0;
	wire [1:0] wdata_3_3;
	wire [1:0] wdata_3_2;
	wire [1:0] wdata_3_1;
	wire [1:0] wdata_3_0;
	wire [7:0] widx_3;
	wire [7:0] bim_col_3_r_3_addr;
	wire bim_col_3_r_3_en;
	reg [1:0] REG_3_3;
	reg [1:0] REG_3_2;
	reg [1:0] REG_3_1;
	reg [1:0] REG_3_0;
	wire [1:0] wdata_2_3;
	wire [1:0] wdata_2_2;
	wire [1:0] wdata_2_1;
	wire [1:0] wdata_2_0;
	wire [7:0] widx_2;
	wire [7:0] bim_col_2_r_2_addr;
	wire bim_col_2_r_2_en;
	reg [1:0] REG_2_3;
	reg [1:0] REG_2_2;
	reg [1:0] REG_2_1;
	reg [1:0] REG_2_0;
	wire [1:0] wdata_1_3;
	wire [1:0] wdata_1_2;
	wire [1:0] wdata_1_1;
	wire [1:0] wdata_1_0;
	wire [7:0] widx_1;
	wire [7:0] bim_col_1_r_1_addr;
	wire bim_col_1_r_1_en;
	reg [1:0] REG_1_3;
	reg [1:0] REG_1_2;
	reg [1:0] REG_1_1;
	reg [1:0] REG_1_0;
	wire [1:0] wdata_3;
	wire [1:0] wdata_2;
	wire [1:0] wdata_1;
	wire [1:0] wdata_0;
	wire [7:0] widx;
	wire [7:0] bim_col_0_r_addr;
	wire bim_col_0_r_en;
	reg [1:0] REG_3;
	reg [1:0] REG_2;
	reg [1:0] REG_1;
	reg [1:0] REG_0;
	wire [7:0] _bim_col_7_ext_RW0_rdata;
	wire [7:0] _bim_col_6_ext_RW0_rdata;
	wire [7:0] _bim_col_5_ext_RW0_rdata;
	wire [7:0] _bim_col_4_ext_RW0_rdata;
	wire [7:0] _bim_col_3_ext_RW0_rdata;
	wire [7:0] _bim_col_2_ext_RW0_rdata;
	wire [7:0] _bim_col_1_ext_RW0_rdata;
	wire [7:0] _bim_col_0_ext_RW0_rdata;
	reg s1_valid;
	reg s2_valid;
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
	reg [119:0] s1_update_bits_meta;
	reg [36:0] s1_update_idx;
	reg doing_reset;
	reg [7:0] reset_idx;
	reg [7:0] s1_col_mask;
	reg [7:0] s2_req_rdata_REG;
	wire [1:0] _s2_req_rdata_T_22 = (((((((s2_req_rdata_REG[0] ? REG_0 : 2'h0) | (s2_req_rdata_REG[1] ? REG_1_0 : 2'h0)) | (s2_req_rdata_REG[2] ? REG_2_0 : 2'h0)) | (s2_req_rdata_REG[3] ? REG_3_0 : 2'h0)) | (s2_req_rdata_REG[4] ? REG_4_0 : 2'h0)) | (s2_req_rdata_REG[5] ? REG_5_0 : 2'h0)) | (s2_req_rdata_REG[6] ? REG_6_0 : 2'h0)) | (s2_req_rdata_REG[7] ? REG_7_0 : 2'h0);
	wire [1:0] _s2_req_rdata_T_37 = (((((((s2_req_rdata_REG[0] ? REG_1 : 2'h0) | (s2_req_rdata_REG[1] ? REG_1_1 : 2'h0)) | (s2_req_rdata_REG[2] ? REG_2_1 : 2'h0)) | (s2_req_rdata_REG[3] ? REG_3_1 : 2'h0)) | (s2_req_rdata_REG[4] ? REG_4_1 : 2'h0)) | (s2_req_rdata_REG[5] ? REG_5_1 : 2'h0)) | (s2_req_rdata_REG[6] ? REG_6_1 : 2'h0)) | (s2_req_rdata_REG[7] ? REG_7_1 : 2'h0);
	wire [1:0] _s2_req_rdata_T_52 = (((((((s2_req_rdata_REG[0] ? REG_2 : 2'h0) | (s2_req_rdata_REG[1] ? REG_1_2 : 2'h0)) | (s2_req_rdata_REG[2] ? REG_2_2 : 2'h0)) | (s2_req_rdata_REG[3] ? REG_3_2 : 2'h0)) | (s2_req_rdata_REG[4] ? REG_4_2 : 2'h0)) | (s2_req_rdata_REG[5] ? REG_5_2 : 2'h0)) | (s2_req_rdata_REG[6] ? REG_6_2 : 2'h0)) | (s2_req_rdata_REG[7] ? REG_7_2 : 2'h0);
	wire [1:0] _s2_req_rdata_T_67 = (((((((s2_req_rdata_REG[0] ? REG_3 : 2'h0) | (s2_req_rdata_REG[1] ? REG_1_3 : 2'h0)) | (s2_req_rdata_REG[2] ? REG_2_3 : 2'h0)) | (s2_req_rdata_REG[3] ? REG_3_3 : 2'h0)) | (s2_req_rdata_REG[4] ? REG_4_3 : 2'h0)) | (s2_req_rdata_REG[5] ? REG_5_3 : 2'h0)) | (s2_req_rdata_REG[6] ? REG_6_3 : 2'h0)) | (s2_req_rdata_REG[7] ? REG_7_3 : 2'h0);
	wire s2_resp_0 = (s2_valid & _s2_req_rdata_T_22[1]) & ~doing_reset;
	reg io_resp_f3_0_taken_REG;
	wire s2_resp_1 = (s2_valid & _s2_req_rdata_T_37[1]) & ~doing_reset;
	reg io_resp_f3_1_taken_REG;
	wire s2_resp_2 = (s2_valid & _s2_req_rdata_T_52[1]) & ~doing_reset;
	reg io_resp_f3_2_taken_REG;
	wire s2_resp_3 = (s2_valid & _s2_req_rdata_T_67[1]) & ~doing_reset;
	reg io_resp_f3_3_taken_REG;
	reg [7:0] io_f3_meta_REG;
	reg [10:0] wrbypass_idxs_0;
	reg [10:0] wrbypass_idxs_1;
	reg [1:0] wrbypass_0_0;
	reg [1:0] wrbypass_0_1;
	reg [1:0] wrbypass_0_2;
	reg [1:0] wrbypass_0_3;
	reg [1:0] wrbypass_1_0;
	reg [1:0] wrbypass_1_1;
	reg [1:0] wrbypass_1_2;
	reg [1:0] wrbypass_1_3;
	reg wrbypass_enq_idx;
	wire wrbypass_hits_0 = ~doing_reset & (wrbypass_idxs_0 == s1_update_idx[10:0]);
	wire wrbypass_hit = wrbypass_hits_0 | (~doing_reset & (wrbypass_idxs_1 == s1_update_idx[10:0]));
	wire _was_taken_T = s1_update_bits_cfi_idx_bits == 2'h0;
	wire s1_update_wmask_0 = s1_update_bits_br_mask[0] | (s1_update_bits_cfi_idx_valid & _was_taken_T);
	wire was_taken = (s1_update_bits_cfi_idx_valid & _was_taken_T) & (((s1_update_bits_cfi_is_br & s1_update_bits_br_mask[0]) & s1_update_bits_cfi_taken) | s1_update_bits_cfi_is_jal);
	wire [1:0] old_bim_value = (wrbypass_hit ? (wrbypass_hits_0 ? wrbypass_0_0 : wrbypass_1_0) : s1_update_bits_meta[1:0]);
	wire _s1_update_wdata_0_T = &old_bim_value & was_taken;
	wire _s1_update_wdata_0_T_2 = (old_bim_value == 2'h0) & ~was_taken;
	wire [1:0] _s1_update_wdata_0_T_3 = old_bim_value + 2'h1;
	wire [1:0] _s1_update_wdata_0_T_5 = old_bim_value - 2'h1;
	wire [1:0] s1_update_wdata_0 = (_s1_update_wdata_0_T ? 2'h3 : (_s1_update_wdata_0_T_2 ? 2'h0 : (was_taken ? _s1_update_wdata_0_T_3 : _s1_update_wdata_0_T_5)));
	wire _was_taken_T_6 = s1_update_bits_cfi_idx_bits == 2'h1;
	wire s1_update_wmask_1 = s1_update_bits_br_mask[1] | (s1_update_bits_cfi_idx_valid & _was_taken_T_6);
	wire was_taken_1 = (s1_update_bits_cfi_idx_valid & _was_taken_T_6) & (((s1_update_bits_cfi_is_br & s1_update_bits_br_mask[1]) & s1_update_bits_cfi_taken) | s1_update_bits_cfi_is_jal);
	wire [1:0] old_bim_value_1 = (wrbypass_hit ? (wrbypass_hits_0 ? wrbypass_0_1 : wrbypass_1_1) : s1_update_bits_meta[3:2]);
	wire _s1_update_wdata_1_T = &old_bim_value_1 & was_taken_1;
	wire _s1_update_wdata_1_T_2 = (old_bim_value_1 == 2'h0) & ~was_taken_1;
	wire [1:0] _s1_update_wdata_1_T_3 = old_bim_value_1 + 2'h1;
	wire [1:0] _s1_update_wdata_1_T_5 = old_bim_value_1 - 2'h1;
	wire [1:0] s1_update_wdata_1 = (_s1_update_wdata_1_T ? 2'h3 : (_s1_update_wdata_1_T_2 ? 2'h0 : (was_taken_1 ? _s1_update_wdata_1_T_3 : _s1_update_wdata_1_T_5)));
	wire _was_taken_T_12 = s1_update_bits_cfi_idx_bits == 2'h2;
	wire s1_update_wmask_2 = s1_update_bits_br_mask[2] | (s1_update_bits_cfi_idx_valid & _was_taken_T_12);
	wire was_taken_2 = (s1_update_bits_cfi_idx_valid & _was_taken_T_12) & (((s1_update_bits_cfi_is_br & s1_update_bits_br_mask[2]) & s1_update_bits_cfi_taken) | s1_update_bits_cfi_is_jal);
	wire [1:0] old_bim_value_2 = (wrbypass_hit ? (wrbypass_hits_0 ? wrbypass_0_2 : wrbypass_1_2) : s1_update_bits_meta[5:4]);
	wire _s1_update_wdata_2_T = &old_bim_value_2 & was_taken_2;
	wire _s1_update_wdata_2_T_2 = (old_bim_value_2 == 2'h0) & ~was_taken_2;
	wire [1:0] _s1_update_wdata_2_T_3 = old_bim_value_2 + 2'h1;
	wire [1:0] _s1_update_wdata_2_T_5 = old_bim_value_2 - 2'h1;
	wire [1:0] s1_update_wdata_2 = (_s1_update_wdata_2_T ? 2'h3 : (_s1_update_wdata_2_T_2 ? 2'h0 : (was_taken_2 ? _s1_update_wdata_2_T_3 : _s1_update_wdata_2_T_5)));
	wire s1_update_wmask_3 = s1_update_bits_br_mask[3] | (s1_update_bits_cfi_idx_valid & (&s1_update_bits_cfi_idx_bits));
	wire was_taken_3 = (s1_update_bits_cfi_idx_valid & (&s1_update_bits_cfi_idx_bits)) & (((s1_update_bits_cfi_is_br & s1_update_bits_br_mask[3]) & s1_update_bits_cfi_taken) | s1_update_bits_cfi_is_jal);
	wire [1:0] old_bim_value_3 = (wrbypass_hit ? (wrbypass_hits_0 ? wrbypass_0_3 : wrbypass_1_3) : s1_update_bits_meta[7:6]);
	wire _s1_update_wdata_3_T = &old_bim_value_3 & was_taken_3;
	wire _s1_update_wdata_3_T_2 = (old_bim_value_3 == 2'h0) & ~was_taken_3;
	wire [1:0] _s1_update_wdata_3_T_3 = old_bim_value_3 + 2'h1;
	wire [1:0] _s1_update_wdata_3_T_5 = old_bim_value_3 - 2'h1;
	wire [1:0] s1_update_wdata_3 = (_s1_update_wdata_3_T ? 2'h3 : (_s1_update_wdata_3_T_2 ? 2'h0 : (was_taken_3 ? _s1_update_wdata_3_T_3 : _s1_update_wdata_3_T_5)));
	wire ren = (io_f0_pc[5:3] == 3'h0) & io_f0_valid;
	wire _wen_T_70 = s1_update_bits_is_mispredict_update | s1_update_bits_is_repair_update;
	wire wen = doing_reset | (((s1_update_valid & ~(_wen_T_70 | (|s1_update_bits_btb_mispredicts))) & (s1_update_idx[2:0] == 3'h0)) & ~ren);
	assign bim_col_0_r_en = ren & ~wen;
	assign bim_col_0_r_addr = io_f0_pc[13:6];
	assign widx = (doing_reset ? reset_idx : s1_update_idx[10:3]);
	assign wdata_0 = (doing_reset ? 2'h2 : s1_update_wdata_0);
	assign wdata_1 = (doing_reset ? 2'h2 : s1_update_wdata_1);
	assign wdata_2 = (doing_reset ? 2'h2 : s1_update_wdata_2);
	assign wdata_3 = (doing_reset ? 2'h2 : s1_update_wdata_3);
	wire ren_1 = (io_f0_pc[5:3] == 3'h1) & io_f0_valid;
	wire wen_1 = doing_reset | (((s1_update_valid & ~(_wen_T_70 | (|s1_update_bits_btb_mispredicts))) & (s1_update_idx[2:0] == 3'h1)) & ~ren_1);
	assign bim_col_1_r_1_en = ren_1 & ~wen_1;
	assign bim_col_1_r_1_addr = io_f0_pc[13:6];
	assign widx_1 = (doing_reset ? reset_idx : s1_update_idx[10:3]);
	assign wdata_1_0 = (doing_reset ? 2'h2 : s1_update_wdata_0);
	assign wdata_1_1 = (doing_reset ? 2'h2 : s1_update_wdata_1);
	assign wdata_1_2 = (doing_reset ? 2'h2 : s1_update_wdata_2);
	assign wdata_1_3 = (doing_reset ? 2'h2 : s1_update_wdata_3);
	wire ren_2 = (io_f0_pc[5:3] == 3'h2) & io_f0_valid;
	wire wen_2 = doing_reset | (((s1_update_valid & ~(_wen_T_70 | (|s1_update_bits_btb_mispredicts))) & (s1_update_idx[2:0] == 3'h2)) & ~ren_2);
	assign bim_col_2_r_2_en = ren_2 & ~wen_2;
	assign bim_col_2_r_2_addr = io_f0_pc[13:6];
	assign widx_2 = (doing_reset ? reset_idx : s1_update_idx[10:3]);
	assign wdata_2_0 = (doing_reset ? 2'h2 : s1_update_wdata_0);
	assign wdata_2_1 = (doing_reset ? 2'h2 : s1_update_wdata_1);
	assign wdata_2_2 = (doing_reset ? 2'h2 : s1_update_wdata_2);
	assign wdata_2_3 = (doing_reset ? 2'h2 : s1_update_wdata_3);
	wire ren_3 = (io_f0_pc[5:3] == 3'h3) & io_f0_valid;
	wire wen_3 = doing_reset | (((s1_update_valid & ~(_wen_T_70 | (|s1_update_bits_btb_mispredicts))) & (s1_update_idx[2:0] == 3'h3)) & ~ren_3);
	assign bim_col_3_r_3_en = ren_3 & ~wen_3;
	assign bim_col_3_r_3_addr = io_f0_pc[13:6];
	assign widx_3 = (doing_reset ? reset_idx : s1_update_idx[10:3]);
	assign wdata_3_0 = (doing_reset ? 2'h2 : s1_update_wdata_0);
	assign wdata_3_1 = (doing_reset ? 2'h2 : s1_update_wdata_1);
	assign wdata_3_2 = (doing_reset ? 2'h2 : s1_update_wdata_2);
	assign wdata_3_3 = (doing_reset ? 2'h2 : s1_update_wdata_3);
	wire ren_4 = (io_f0_pc[5:3] == 3'h4) & io_f0_valid;
	wire wen_4 = doing_reset | (((s1_update_valid & ~(_wen_T_70 | (|s1_update_bits_btb_mispredicts))) & (s1_update_idx[2:0] == 3'h4)) & ~ren_4);
	assign bim_col_4_r_4_en = ren_4 & ~wen_4;
	assign bim_col_4_r_4_addr = io_f0_pc[13:6];
	assign widx_4 = (doing_reset ? reset_idx : s1_update_idx[10:3]);
	assign wdata_4_0 = (doing_reset ? 2'h2 : s1_update_wdata_0);
	assign wdata_4_1 = (doing_reset ? 2'h2 : s1_update_wdata_1);
	assign wdata_4_2 = (doing_reset ? 2'h2 : s1_update_wdata_2);
	assign wdata_4_3 = (doing_reset ? 2'h2 : s1_update_wdata_3);
	wire ren_5 = (io_f0_pc[5:3] == 3'h5) & io_f0_valid;
	wire wen_5 = doing_reset | (((s1_update_valid & ~(_wen_T_70 | (|s1_update_bits_btb_mispredicts))) & (s1_update_idx[2:0] == 3'h5)) & ~ren_5);
	assign bim_col_5_r_5_en = ren_5 & ~wen_5;
	assign bim_col_5_r_5_addr = io_f0_pc[13:6];
	assign widx_5 = (doing_reset ? reset_idx : s1_update_idx[10:3]);
	assign wdata_5_0 = (doing_reset ? 2'h2 : s1_update_wdata_0);
	assign wdata_5_1 = (doing_reset ? 2'h2 : s1_update_wdata_1);
	assign wdata_5_2 = (doing_reset ? 2'h2 : s1_update_wdata_2);
	assign wdata_5_3 = (doing_reset ? 2'h2 : s1_update_wdata_3);
	wire ren_6 = (io_f0_pc[5:3] == 3'h6) & io_f0_valid;
	wire wen_6 = doing_reset | (((s1_update_valid & ~(_wen_T_70 | (|s1_update_bits_btb_mispredicts))) & (s1_update_idx[2:0] == 3'h6)) & ~ren_6);
	assign bim_col_6_r_6_en = ren_6 & ~wen_6;
	assign bim_col_6_r_6_addr = io_f0_pc[13:6];
	assign widx_6 = (doing_reset ? reset_idx : s1_update_idx[10:3]);
	assign wdata_6_0 = (doing_reset ? 2'h2 : s1_update_wdata_0);
	assign wdata_6_1 = (doing_reset ? 2'h2 : s1_update_wdata_1);
	assign wdata_6_2 = (doing_reset ? 2'h2 : s1_update_wdata_2);
	assign wdata_6_3 = (doing_reset ? 2'h2 : s1_update_wdata_3);
	wire ren_7 = &io_f0_pc[5:3] & io_f0_valid;
	wire wen_7 = doing_reset | (((s1_update_valid & ~(_wen_T_70 | (|s1_update_bits_btb_mispredicts))) & (&s1_update_idx[2:0])) & ~ren_7);
	assign bim_col_7_r_7_en = ren_7 & ~wen_7;
	assign bim_col_7_r_7_addr = io_f0_pc[13:6];
	assign widx_7 = (doing_reset ? reset_idx : s1_update_idx[10:3]);
	assign wdata_7_0 = (doing_reset ? 2'h2 : s1_update_wdata_0);
	assign wdata_7_1 = (doing_reset ? 2'h2 : s1_update_wdata_1);
	assign wdata_7_2 = (doing_reset ? 2'h2 : s1_update_wdata_2);
	assign wdata_7_3 = (doing_reset ? 2'h2 : s1_update_wdata_3);
	always @(posedge clock) begin : sv2v_autoblock_1
		reg _GEN;
		_GEN = ((((s1_update_wmask_0 | s1_update_wmask_1) | s1_update_wmask_2) | s1_update_wmask_3) & s1_update_valid) & ~(_wen_T_70 | (|s1_update_bits_btb_mispredicts));
		s1_valid <= io_f0_valid;
		s2_valid <= s1_valid;
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
		s1_update_bits_meta <= io_update_bits_meta;
		s1_update_idx <= io_update_bits_pc[39:3];
		s1_col_mask <= (8'h01 << io_f0_pc[5:3]) & {8 {io_f0_valid}};
		s2_req_rdata_REG <= s1_col_mask;
		io_resp_f3_0_taken_REG <= s2_resp_0;
		io_resp_f3_1_taken_REG <= s2_resp_1;
		io_resp_f3_2_taken_REG <= s2_resp_2;
		io_resp_f3_3_taken_REG <= s2_resp_3;
		io_f3_meta_REG <= {_s2_req_rdata_T_67, _s2_req_rdata_T_52, _s2_req_rdata_T_37, _s2_req_rdata_T_22};
		if ((~_GEN | wrbypass_hit) | wrbypass_enq_idx)
			;
		else
			wrbypass_idxs_0 <= s1_update_idx[10:0];
		if ((~_GEN | wrbypass_hit) | ~wrbypass_enq_idx)
			;
		else
			wrbypass_idxs_1 <= s1_update_idx[10:0];
		if (_GEN) begin
			if (wrbypass_hit) begin
				if (wrbypass_hits_0) begin
					if (_s1_update_wdata_0_T)
						wrbypass_0_0 <= 2'h3;
					else if (_s1_update_wdata_0_T_2)
						wrbypass_0_0 <= 2'h0;
					else if (was_taken)
						wrbypass_0_0 <= _s1_update_wdata_0_T_3;
					else
						wrbypass_0_0 <= _s1_update_wdata_0_T_5;
					if (_s1_update_wdata_1_T)
						wrbypass_0_1 <= 2'h3;
					else if (_s1_update_wdata_1_T_2)
						wrbypass_0_1 <= 2'h0;
					else if (was_taken_1)
						wrbypass_0_1 <= _s1_update_wdata_1_T_3;
					else
						wrbypass_0_1 <= _s1_update_wdata_1_T_5;
					if (_s1_update_wdata_2_T)
						wrbypass_0_2 <= 2'h3;
					else if (_s1_update_wdata_2_T_2)
						wrbypass_0_2 <= 2'h0;
					else if (was_taken_2)
						wrbypass_0_2 <= _s1_update_wdata_2_T_3;
					else
						wrbypass_0_2 <= _s1_update_wdata_2_T_5;
					if (_s1_update_wdata_3_T)
						wrbypass_0_3 <= 2'h3;
					else if (_s1_update_wdata_3_T_2)
						wrbypass_0_3 <= 2'h0;
					else if (was_taken_3)
						wrbypass_0_3 <= _s1_update_wdata_3_T_3;
					else
						wrbypass_0_3 <= _s1_update_wdata_3_T_5;
				end
				else begin
					if (_s1_update_wdata_0_T)
						wrbypass_1_0 <= 2'h3;
					else if (_s1_update_wdata_0_T_2)
						wrbypass_1_0 <= 2'h0;
					else if (was_taken)
						wrbypass_1_0 <= _s1_update_wdata_0_T_3;
					else
						wrbypass_1_0 <= _s1_update_wdata_0_T_5;
					if (_s1_update_wdata_1_T)
						wrbypass_1_1 <= 2'h3;
					else if (_s1_update_wdata_1_T_2)
						wrbypass_1_1 <= 2'h0;
					else if (was_taken_1)
						wrbypass_1_1 <= _s1_update_wdata_1_T_3;
					else
						wrbypass_1_1 <= _s1_update_wdata_1_T_5;
					if (_s1_update_wdata_2_T)
						wrbypass_1_2 <= 2'h3;
					else if (_s1_update_wdata_2_T_2)
						wrbypass_1_2 <= 2'h0;
					else if (was_taken_2)
						wrbypass_1_2 <= _s1_update_wdata_2_T_3;
					else
						wrbypass_1_2 <= _s1_update_wdata_2_T_5;
					if (_s1_update_wdata_3_T)
						wrbypass_1_3 <= 2'h3;
					else if (_s1_update_wdata_3_T_2)
						wrbypass_1_3 <= 2'h0;
					else if (was_taken_3)
						wrbypass_1_3 <= _s1_update_wdata_3_T_3;
					else
						wrbypass_1_3 <= _s1_update_wdata_3_T_5;
				end
			end
			else if (wrbypass_enq_idx) begin
				if (_s1_update_wdata_0_T)
					wrbypass_1_0 <= 2'h3;
				else if (_s1_update_wdata_0_T_2)
					wrbypass_1_0 <= 2'h0;
				else if (was_taken)
					wrbypass_1_0 <= _s1_update_wdata_0_T_3;
				else
					wrbypass_1_0 <= _s1_update_wdata_0_T_5;
				if (_s1_update_wdata_1_T)
					wrbypass_1_1 <= 2'h3;
				else if (_s1_update_wdata_1_T_2)
					wrbypass_1_1 <= 2'h0;
				else if (was_taken_1)
					wrbypass_1_1 <= _s1_update_wdata_1_T_3;
				else
					wrbypass_1_1 <= _s1_update_wdata_1_T_5;
				if (_s1_update_wdata_2_T)
					wrbypass_1_2 <= 2'h3;
				else if (_s1_update_wdata_2_T_2)
					wrbypass_1_2 <= 2'h0;
				else if (was_taken_2)
					wrbypass_1_2 <= _s1_update_wdata_2_T_3;
				else
					wrbypass_1_2 <= _s1_update_wdata_2_T_5;
				if (_s1_update_wdata_3_T)
					wrbypass_1_3 <= 2'h3;
				else if (_s1_update_wdata_3_T_2)
					wrbypass_1_3 <= 2'h0;
				else if (was_taken_3)
					wrbypass_1_3 <= _s1_update_wdata_3_T_3;
				else
					wrbypass_1_3 <= _s1_update_wdata_3_T_5;
			end
			else begin
				if (_s1_update_wdata_0_T)
					wrbypass_0_0 <= 2'h3;
				else if (_s1_update_wdata_0_T_2)
					wrbypass_0_0 <= 2'h0;
				else if (was_taken)
					wrbypass_0_0 <= _s1_update_wdata_0_T_3;
				else
					wrbypass_0_0 <= _s1_update_wdata_0_T_5;
				if (_s1_update_wdata_1_T)
					wrbypass_0_1 <= 2'h3;
				else if (_s1_update_wdata_1_T_2)
					wrbypass_0_1 <= 2'h0;
				else if (was_taken_1)
					wrbypass_0_1 <= _s1_update_wdata_1_T_3;
				else
					wrbypass_0_1 <= _s1_update_wdata_1_T_5;
				if (_s1_update_wdata_2_T)
					wrbypass_0_2 <= 2'h3;
				else if (_s1_update_wdata_2_T_2)
					wrbypass_0_2 <= 2'h0;
				else if (was_taken_2)
					wrbypass_0_2 <= _s1_update_wdata_2_T_3;
				else
					wrbypass_0_2 <= _s1_update_wdata_2_T_5;
				if (_s1_update_wdata_3_T)
					wrbypass_0_3 <= 2'h3;
				else if (_s1_update_wdata_3_T_2)
					wrbypass_0_3 <= 2'h0;
				else if (was_taken_3)
					wrbypass_0_3 <= _s1_update_wdata_3_T_3;
				else
					wrbypass_0_3 <= _s1_update_wdata_3_T_5;
			end
		end
		REG_0 <= _bim_col_0_ext_RW0_rdata[1:0];
		REG_1 <= _bim_col_0_ext_RW0_rdata[3:2];
		REG_2 <= _bim_col_0_ext_RW0_rdata[5:4];
		REG_3 <= _bim_col_0_ext_RW0_rdata[7:6];
		REG_1_0 <= _bim_col_1_ext_RW0_rdata[1:0];
		REG_1_1 <= _bim_col_1_ext_RW0_rdata[3:2];
		REG_1_2 <= _bim_col_1_ext_RW0_rdata[5:4];
		REG_1_3 <= _bim_col_1_ext_RW0_rdata[7:6];
		REG_2_0 <= _bim_col_2_ext_RW0_rdata[1:0];
		REG_2_1 <= _bim_col_2_ext_RW0_rdata[3:2];
		REG_2_2 <= _bim_col_2_ext_RW0_rdata[5:4];
		REG_2_3 <= _bim_col_2_ext_RW0_rdata[7:6];
		REG_3_0 <= _bim_col_3_ext_RW0_rdata[1:0];
		REG_3_1 <= _bim_col_3_ext_RW0_rdata[3:2];
		REG_3_2 <= _bim_col_3_ext_RW0_rdata[5:4];
		REG_3_3 <= _bim_col_3_ext_RW0_rdata[7:6];
		REG_4_0 <= _bim_col_4_ext_RW0_rdata[1:0];
		REG_4_1 <= _bim_col_4_ext_RW0_rdata[3:2];
		REG_4_2 <= _bim_col_4_ext_RW0_rdata[5:4];
		REG_4_3 <= _bim_col_4_ext_RW0_rdata[7:6];
		REG_5_0 <= _bim_col_5_ext_RW0_rdata[1:0];
		REG_5_1 <= _bim_col_5_ext_RW0_rdata[3:2];
		REG_5_2 <= _bim_col_5_ext_RW0_rdata[5:4];
		REG_5_3 <= _bim_col_5_ext_RW0_rdata[7:6];
		REG_6_0 <= _bim_col_6_ext_RW0_rdata[1:0];
		REG_6_1 <= _bim_col_6_ext_RW0_rdata[3:2];
		REG_6_2 <= _bim_col_6_ext_RW0_rdata[5:4];
		REG_6_3 <= _bim_col_6_ext_RW0_rdata[7:6];
		REG_7_0 <= _bim_col_7_ext_RW0_rdata[1:0];
		REG_7_1 <= _bim_col_7_ext_RW0_rdata[3:2];
		REG_7_2 <= _bim_col_7_ext_RW0_rdata[5:4];
		REG_7_3 <= _bim_col_7_ext_RW0_rdata[7:6];
		if (reset) begin
			doing_reset <= 1'h1;
			reset_idx <= 8'h00;
			wrbypass_enq_idx <= 1'h0;
		end
		else begin
			doing_reset <= (reset_idx != 8'hff) & doing_reset;
			reset_idx <= reset_idx + {7'h00, doing_reset};
			if (~_GEN | wrbypass_hit)
				;
			else
				wrbypass_enq_idx <= wrbypass_enq_idx - 1'h1;
		end
	end
	bim_col_256x8 bim_col_0_ext(
		.RW0_addr((wen ? widx : bim_col_0_r_addr)),
		.RW0_en(bim_col_0_r_en | wen),
		.RW0_clk(clock),
		.RW0_wmode(wen),
		.RW0_wdata({wdata_3, wdata_2, wdata_1, wdata_0}),
		.RW0_rdata(_bim_col_0_ext_RW0_rdata),
		.RW0_wmask((doing_reset ? 4'hf : {s1_update_wmask_3, s1_update_wmask_2, s1_update_wmask_1, s1_update_wmask_0}))
	);
	bim_col_256x8 bim_col_1_ext(
		.RW0_addr((wen_1 ? widx_1 : bim_col_1_r_1_addr)),
		.RW0_en(bim_col_1_r_1_en | wen_1),
		.RW0_clk(clock),
		.RW0_wmode(wen_1),
		.RW0_wdata({wdata_1_3, wdata_1_2, wdata_1_1, wdata_1_0}),
		.RW0_rdata(_bim_col_1_ext_RW0_rdata),
		.RW0_wmask((doing_reset ? 4'hf : {s1_update_wmask_3, s1_update_wmask_2, s1_update_wmask_1, s1_update_wmask_0}))
	);
	bim_col_256x8 bim_col_2_ext(
		.RW0_addr((wen_2 ? widx_2 : bim_col_2_r_2_addr)),
		.RW0_en(bim_col_2_r_2_en | wen_2),
		.RW0_clk(clock),
		.RW0_wmode(wen_2),
		.RW0_wdata({wdata_2_3, wdata_2_2, wdata_2_1, wdata_2_0}),
		.RW0_rdata(_bim_col_2_ext_RW0_rdata),
		.RW0_wmask((doing_reset ? 4'hf : {s1_update_wmask_3, s1_update_wmask_2, s1_update_wmask_1, s1_update_wmask_0}))
	);
	bim_col_256x8 bim_col_3_ext(
		.RW0_addr((wen_3 ? widx_3 : bim_col_3_r_3_addr)),
		.RW0_en(bim_col_3_r_3_en | wen_3),
		.RW0_clk(clock),
		.RW0_wmode(wen_3),
		.RW0_wdata({wdata_3_3, wdata_3_2, wdata_3_1, wdata_3_0}),
		.RW0_rdata(_bim_col_3_ext_RW0_rdata),
		.RW0_wmask((doing_reset ? 4'hf : {s1_update_wmask_3, s1_update_wmask_2, s1_update_wmask_1, s1_update_wmask_0}))
	);
	bim_col_256x8 bim_col_4_ext(
		.RW0_addr((wen_4 ? widx_4 : bim_col_4_r_4_addr)),
		.RW0_en(bim_col_4_r_4_en | wen_4),
		.RW0_clk(clock),
		.RW0_wmode(wen_4),
		.RW0_wdata({wdata_4_3, wdata_4_2, wdata_4_1, wdata_4_0}),
		.RW0_rdata(_bim_col_4_ext_RW0_rdata),
		.RW0_wmask((doing_reset ? 4'hf : {s1_update_wmask_3, s1_update_wmask_2, s1_update_wmask_1, s1_update_wmask_0}))
	);
	bim_col_256x8 bim_col_5_ext(
		.RW0_addr((wen_5 ? widx_5 : bim_col_5_r_5_addr)),
		.RW0_en(bim_col_5_r_5_en | wen_5),
		.RW0_clk(clock),
		.RW0_wmode(wen_5),
		.RW0_wdata({wdata_5_3, wdata_5_2, wdata_5_1, wdata_5_0}),
		.RW0_rdata(_bim_col_5_ext_RW0_rdata),
		.RW0_wmask((doing_reset ? 4'hf : {s1_update_wmask_3, s1_update_wmask_2, s1_update_wmask_1, s1_update_wmask_0}))
	);
	bim_col_256x8 bim_col_6_ext(
		.RW0_addr((wen_6 ? widx_6 : bim_col_6_r_6_addr)),
		.RW0_en(bim_col_6_r_6_en | wen_6),
		.RW0_clk(clock),
		.RW0_wmode(wen_6),
		.RW0_wdata({wdata_6_3, wdata_6_2, wdata_6_1, wdata_6_0}),
		.RW0_rdata(_bim_col_6_ext_RW0_rdata),
		.RW0_wmask((doing_reset ? 4'hf : {s1_update_wmask_3, s1_update_wmask_2, s1_update_wmask_1, s1_update_wmask_0}))
	);
	bim_col_256x8 bim_col_7_ext(
		.RW0_addr((wen_7 ? widx_7 : bim_col_7_r_7_addr)),
		.RW0_en(bim_col_7_r_7_en | wen_7),
		.RW0_clk(clock),
		.RW0_wmode(wen_7),
		.RW0_wdata({wdata_7_3, wdata_7_2, wdata_7_1, wdata_7_0}),
		.RW0_rdata(_bim_col_7_ext_RW0_rdata),
		.RW0_wmask((doing_reset ? 4'hf : {s1_update_wmask_3, s1_update_wmask_2, s1_update_wmask_1, s1_update_wmask_0}))
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
	assign io_resp_f2_0_taken = s2_resp_0;
	assign io_resp_f2_0_is_br = io_resp_in_0_f2_0_is_br;
	assign io_resp_f2_0_is_jal = io_resp_in_0_f2_0_is_jal;
	assign io_resp_f2_0_predicted_pc_valid = io_resp_in_0_f2_0_predicted_pc_valid;
	assign io_resp_f2_0_predicted_pc_bits = io_resp_in_0_f2_0_predicted_pc_bits;
	assign io_resp_f2_1_taken = s2_resp_1;
	assign io_resp_f2_1_is_br = io_resp_in_0_f2_1_is_br;
	assign io_resp_f2_1_is_jal = io_resp_in_0_f2_1_is_jal;
	assign io_resp_f2_1_predicted_pc_valid = io_resp_in_0_f2_1_predicted_pc_valid;
	assign io_resp_f2_1_predicted_pc_bits = io_resp_in_0_f2_1_predicted_pc_bits;
	assign io_resp_f2_2_taken = s2_resp_2;
	assign io_resp_f2_2_is_br = io_resp_in_0_f2_2_is_br;
	assign io_resp_f2_2_is_jal = io_resp_in_0_f2_2_is_jal;
	assign io_resp_f2_2_predicted_pc_valid = io_resp_in_0_f2_2_predicted_pc_valid;
	assign io_resp_f2_2_predicted_pc_bits = io_resp_in_0_f2_2_predicted_pc_bits;
	assign io_resp_f2_3_taken = s2_resp_3;
	assign io_resp_f2_3_is_br = io_resp_in_0_f2_3_is_br;
	assign io_resp_f2_3_is_jal = io_resp_in_0_f2_3_is_jal;
	assign io_resp_f2_3_predicted_pc_valid = io_resp_in_0_f2_3_predicted_pc_valid;
	assign io_resp_f2_3_predicted_pc_bits = io_resp_in_0_f2_3_predicted_pc_bits;
	assign io_resp_f3_0_taken = io_resp_f3_0_taken_REG;
	assign io_resp_f3_0_is_br = io_resp_in_0_f3_0_is_br;
	assign io_resp_f3_0_is_jal = io_resp_in_0_f3_0_is_jal;
	assign io_resp_f3_0_predicted_pc_valid = io_resp_in_0_f3_0_predicted_pc_valid;
	assign io_resp_f3_0_predicted_pc_bits = io_resp_in_0_f3_0_predicted_pc_bits;
	assign io_resp_f3_1_taken = io_resp_f3_1_taken_REG;
	assign io_resp_f3_1_is_br = io_resp_in_0_f3_1_is_br;
	assign io_resp_f3_1_is_jal = io_resp_in_0_f3_1_is_jal;
	assign io_resp_f3_1_predicted_pc_valid = io_resp_in_0_f3_1_predicted_pc_valid;
	assign io_resp_f3_1_predicted_pc_bits = io_resp_in_0_f3_1_predicted_pc_bits;
	assign io_resp_f3_2_taken = io_resp_f3_2_taken_REG;
	assign io_resp_f3_2_is_br = io_resp_in_0_f3_2_is_br;
	assign io_resp_f3_2_is_jal = io_resp_in_0_f3_2_is_jal;
	assign io_resp_f3_2_predicted_pc_valid = io_resp_in_0_f3_2_predicted_pc_valid;
	assign io_resp_f3_2_predicted_pc_bits = io_resp_in_0_f3_2_predicted_pc_bits;
	assign io_resp_f3_3_taken = io_resp_f3_3_taken_REG;
	assign io_resp_f3_3_is_br = io_resp_in_0_f3_3_is_br;
	assign io_resp_f3_3_is_jal = io_resp_in_0_f3_3_is_jal;
	assign io_resp_f3_3_predicted_pc_valid = io_resp_in_0_f3_3_predicted_pc_valid;
	assign io_resp_f3_3_predicted_pc_bits = io_resp_in_0_f3_3_predicted_pc_bits;
	assign io_f3_meta = {112'h0000000000000000000000000000, io_f3_meta_REG};
endmodule
