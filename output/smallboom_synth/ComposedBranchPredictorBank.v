module ComposedBranchPredictorBank (
	clock,
	reset,
	io_f0_valid,
	io_f0_pc,
	io_f0_mask,
	io_f1_ghist,
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
	io_f3_fire,
	io_update_valid,
	io_update_bits_is_mispredict_update,
	io_update_bits_is_repair_update,
	io_update_bits_btb_mispredicts,
	io_update_bits_pc,
	io_update_bits_br_mask,
	io_update_bits_cfi_idx_valid,
	io_update_bits_cfi_idx_bits,
	io_update_bits_cfi_taken,
	io_update_bits_cfi_mispredicted,
	io_update_bits_cfi_is_br,
	io_update_bits_cfi_is_jal,
	io_update_bits_cfi_is_jalr,
	io_update_bits_ghist,
	io_update_bits_target,
	io_update_bits_meta
);
	input clock;
	input reset;
	input io_f0_valid;
	input [39:0] io_f0_pc;
	input [3:0] io_f0_mask;
	input [63:0] io_f1_ghist;
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
	input io_f3_fire;
	input io_update_valid;
	input io_update_bits_is_mispredict_update;
	input io_update_bits_is_repair_update;
	input [3:0] io_update_bits_btb_mispredicts;
	input [39:0] io_update_bits_pc;
	input [3:0] io_update_bits_br_mask;
	input io_update_bits_cfi_idx_valid;
	input [1:0] io_update_bits_cfi_idx_bits;
	input io_update_bits_cfi_taken;
	input io_update_bits_cfi_mispredicted;
	input io_update_bits_cfi_is_br;
	input io_update_bits_cfi_is_jal;
	input io_update_bits_cfi_is_jalr;
	input [63:0] io_update_bits_ghist;
	input [39:0] io_update_bits_target;
	input [119:0] io_update_bits_meta;
	wire _ubtb_io_resp_f1_0_taken;
	wire _ubtb_io_resp_f1_0_is_br;
	wire _ubtb_io_resp_f1_0_predicted_pc_valid;
	wire [39:0] _ubtb_io_resp_f1_0_predicted_pc_bits;
	wire _ubtb_io_resp_f1_1_taken;
	wire _ubtb_io_resp_f1_1_is_br;
	wire _ubtb_io_resp_f1_1_predicted_pc_valid;
	wire [39:0] _ubtb_io_resp_f1_1_predicted_pc_bits;
	wire _ubtb_io_resp_f1_2_taken;
	wire _ubtb_io_resp_f1_2_is_br;
	wire _ubtb_io_resp_f1_2_predicted_pc_valid;
	wire [39:0] _ubtb_io_resp_f1_2_predicted_pc_bits;
	wire _ubtb_io_resp_f1_3_taken;
	wire _ubtb_io_resp_f1_3_is_br;
	wire _ubtb_io_resp_f1_3_predicted_pc_valid;
	wire [39:0] _ubtb_io_resp_f1_3_predicted_pc_bits;
	wire _ubtb_io_resp_f2_0_is_br;
	wire _ubtb_io_resp_f2_0_is_jal;
	wire _ubtb_io_resp_f2_0_predicted_pc_valid;
	wire [39:0] _ubtb_io_resp_f2_0_predicted_pc_bits;
	wire _ubtb_io_resp_f2_1_is_br;
	wire _ubtb_io_resp_f2_1_is_jal;
	wire _ubtb_io_resp_f2_1_predicted_pc_valid;
	wire [39:0] _ubtb_io_resp_f2_1_predicted_pc_bits;
	wire _ubtb_io_resp_f2_2_is_br;
	wire _ubtb_io_resp_f2_2_is_jal;
	wire _ubtb_io_resp_f2_2_predicted_pc_valid;
	wire [39:0] _ubtb_io_resp_f2_2_predicted_pc_bits;
	wire _ubtb_io_resp_f2_3_is_br;
	wire _ubtb_io_resp_f2_3_is_jal;
	wire _ubtb_io_resp_f2_3_predicted_pc_valid;
	wire [39:0] _ubtb_io_resp_f2_3_predicted_pc_bits;
	wire _ubtb_io_resp_f3_0_is_br;
	wire _ubtb_io_resp_f3_0_is_jal;
	wire _ubtb_io_resp_f3_0_predicted_pc_valid;
	wire [39:0] _ubtb_io_resp_f3_0_predicted_pc_bits;
	wire _ubtb_io_resp_f3_1_is_br;
	wire _ubtb_io_resp_f3_1_is_jal;
	wire _ubtb_io_resp_f3_1_predicted_pc_valid;
	wire [39:0] _ubtb_io_resp_f3_1_predicted_pc_bits;
	wire _ubtb_io_resp_f3_2_is_br;
	wire _ubtb_io_resp_f3_2_is_jal;
	wire _ubtb_io_resp_f3_2_predicted_pc_valid;
	wire [39:0] _ubtb_io_resp_f3_2_predicted_pc_bits;
	wire _ubtb_io_resp_f3_3_is_br;
	wire _ubtb_io_resp_f3_3_is_jal;
	wire _ubtb_io_resp_f3_3_predicted_pc_valid;
	wire [39:0] _ubtb_io_resp_f3_3_predicted_pc_bits;
	wire [119:0] _ubtb_io_f3_meta;
	wire _bim_io_resp_f1_0_taken;
	wire _bim_io_resp_f1_0_is_br;
	wire _bim_io_resp_f1_0_predicted_pc_valid;
	wire [39:0] _bim_io_resp_f1_0_predicted_pc_bits;
	wire _bim_io_resp_f1_1_taken;
	wire _bim_io_resp_f1_1_is_br;
	wire _bim_io_resp_f1_1_predicted_pc_valid;
	wire [39:0] _bim_io_resp_f1_1_predicted_pc_bits;
	wire _bim_io_resp_f1_2_taken;
	wire _bim_io_resp_f1_2_is_br;
	wire _bim_io_resp_f1_2_predicted_pc_valid;
	wire [39:0] _bim_io_resp_f1_2_predicted_pc_bits;
	wire _bim_io_resp_f1_3_taken;
	wire _bim_io_resp_f1_3_is_br;
	wire _bim_io_resp_f1_3_predicted_pc_valid;
	wire [39:0] _bim_io_resp_f1_3_predicted_pc_bits;
	wire _bim_io_resp_f2_0_taken;
	wire _bim_io_resp_f2_0_is_br;
	wire _bim_io_resp_f2_0_is_jal;
	wire _bim_io_resp_f2_0_predicted_pc_valid;
	wire [39:0] _bim_io_resp_f2_0_predicted_pc_bits;
	wire _bim_io_resp_f2_1_taken;
	wire _bim_io_resp_f2_1_is_br;
	wire _bim_io_resp_f2_1_is_jal;
	wire _bim_io_resp_f2_1_predicted_pc_valid;
	wire [39:0] _bim_io_resp_f2_1_predicted_pc_bits;
	wire _bim_io_resp_f2_2_taken;
	wire _bim_io_resp_f2_2_is_br;
	wire _bim_io_resp_f2_2_is_jal;
	wire _bim_io_resp_f2_2_predicted_pc_valid;
	wire [39:0] _bim_io_resp_f2_2_predicted_pc_bits;
	wire _bim_io_resp_f2_3_taken;
	wire _bim_io_resp_f2_3_is_br;
	wire _bim_io_resp_f2_3_is_jal;
	wire _bim_io_resp_f2_3_predicted_pc_valid;
	wire [39:0] _bim_io_resp_f2_3_predicted_pc_bits;
	wire _bim_io_resp_f3_0_taken;
	wire _bim_io_resp_f3_0_is_br;
	wire _bim_io_resp_f3_0_is_jal;
	wire _bim_io_resp_f3_0_predicted_pc_valid;
	wire [39:0] _bim_io_resp_f3_0_predicted_pc_bits;
	wire _bim_io_resp_f3_1_taken;
	wire _bim_io_resp_f3_1_is_br;
	wire _bim_io_resp_f3_1_is_jal;
	wire _bim_io_resp_f3_1_predicted_pc_valid;
	wire [39:0] _bim_io_resp_f3_1_predicted_pc_bits;
	wire _bim_io_resp_f3_2_taken;
	wire _bim_io_resp_f3_2_is_br;
	wire _bim_io_resp_f3_2_is_jal;
	wire _bim_io_resp_f3_2_predicted_pc_valid;
	wire [39:0] _bim_io_resp_f3_2_predicted_pc_bits;
	wire _bim_io_resp_f3_3_taken;
	wire _bim_io_resp_f3_3_is_br;
	wire _bim_io_resp_f3_3_is_jal;
	wire _bim_io_resp_f3_3_predicted_pc_valid;
	wire [39:0] _bim_io_resp_f3_3_predicted_pc_bits;
	wire [119:0] _bim_io_f3_meta;
	wire _btb_io_resp_f1_0_taken;
	wire _btb_io_resp_f1_0_is_br;
	wire _btb_io_resp_f1_0_predicted_pc_valid;
	wire [39:0] _btb_io_resp_f1_0_predicted_pc_bits;
	wire _btb_io_resp_f1_1_taken;
	wire _btb_io_resp_f1_1_is_br;
	wire _btb_io_resp_f1_1_predicted_pc_valid;
	wire [39:0] _btb_io_resp_f1_1_predicted_pc_bits;
	wire _btb_io_resp_f1_2_taken;
	wire _btb_io_resp_f1_2_is_br;
	wire _btb_io_resp_f1_2_predicted_pc_valid;
	wire [39:0] _btb_io_resp_f1_2_predicted_pc_bits;
	wire _btb_io_resp_f1_3_taken;
	wire _btb_io_resp_f1_3_is_br;
	wire _btb_io_resp_f1_3_predicted_pc_valid;
	wire [39:0] _btb_io_resp_f1_3_predicted_pc_bits;
	wire _btb_io_resp_f2_0_taken;
	wire _btb_io_resp_f2_0_is_br;
	wire _btb_io_resp_f2_0_predicted_pc_valid;
	wire [39:0] _btb_io_resp_f2_0_predicted_pc_bits;
	wire _btb_io_resp_f2_1_taken;
	wire _btb_io_resp_f2_1_is_br;
	wire _btb_io_resp_f2_1_predicted_pc_valid;
	wire [39:0] _btb_io_resp_f2_1_predicted_pc_bits;
	wire _btb_io_resp_f2_2_taken;
	wire _btb_io_resp_f2_2_is_br;
	wire _btb_io_resp_f2_2_predicted_pc_valid;
	wire [39:0] _btb_io_resp_f2_2_predicted_pc_bits;
	wire _btb_io_resp_f2_3_taken;
	wire _btb_io_resp_f2_3_is_br;
	wire _btb_io_resp_f2_3_predicted_pc_valid;
	wire [39:0] _btb_io_resp_f2_3_predicted_pc_bits;
	wire _btb_io_resp_f3_0_taken;
	wire _btb_io_resp_f3_0_is_br;
	wire _btb_io_resp_f3_0_is_jal;
	wire _btb_io_resp_f3_0_predicted_pc_valid;
	wire [39:0] _btb_io_resp_f3_0_predicted_pc_bits;
	wire _btb_io_resp_f3_1_taken;
	wire _btb_io_resp_f3_1_is_br;
	wire _btb_io_resp_f3_1_is_jal;
	wire _btb_io_resp_f3_1_predicted_pc_valid;
	wire [39:0] _btb_io_resp_f3_1_predicted_pc_bits;
	wire _btb_io_resp_f3_2_taken;
	wire _btb_io_resp_f3_2_is_br;
	wire _btb_io_resp_f3_2_is_jal;
	wire _btb_io_resp_f3_2_predicted_pc_valid;
	wire [39:0] _btb_io_resp_f3_2_predicted_pc_bits;
	wire _btb_io_resp_f3_3_taken;
	wire _btb_io_resp_f3_3_is_br;
	wire _btb_io_resp_f3_3_is_jal;
	wire _btb_io_resp_f3_3_predicted_pc_valid;
	wire [39:0] _btb_io_resp_f3_3_predicted_pc_bits;
	wire [119:0] _btb_io_f3_meta;
	wire _tage_io_resp_f1_0_taken;
	wire _tage_io_resp_f1_0_is_br;
	wire _tage_io_resp_f1_0_predicted_pc_valid;
	wire [39:0] _tage_io_resp_f1_0_predicted_pc_bits;
	wire _tage_io_resp_f1_1_taken;
	wire _tage_io_resp_f1_1_is_br;
	wire _tage_io_resp_f1_1_predicted_pc_valid;
	wire [39:0] _tage_io_resp_f1_1_predicted_pc_bits;
	wire _tage_io_resp_f1_2_taken;
	wire _tage_io_resp_f1_2_is_br;
	wire _tage_io_resp_f1_2_predicted_pc_valid;
	wire [39:0] _tage_io_resp_f1_2_predicted_pc_bits;
	wire _tage_io_resp_f1_3_taken;
	wire _tage_io_resp_f1_3_is_br;
	wire _tage_io_resp_f1_3_predicted_pc_valid;
	wire [39:0] _tage_io_resp_f1_3_predicted_pc_bits;
	wire _tage_io_resp_f2_0_taken;
	wire _tage_io_resp_f2_0_is_br;
	wire _tage_io_resp_f2_0_predicted_pc_valid;
	wire [39:0] _tage_io_resp_f2_0_predicted_pc_bits;
	wire _tage_io_resp_f2_1_taken;
	wire _tage_io_resp_f2_1_is_br;
	wire _tage_io_resp_f2_1_predicted_pc_valid;
	wire [39:0] _tage_io_resp_f2_1_predicted_pc_bits;
	wire _tage_io_resp_f2_2_taken;
	wire _tage_io_resp_f2_2_is_br;
	wire _tage_io_resp_f2_2_predicted_pc_valid;
	wire [39:0] _tage_io_resp_f2_2_predicted_pc_bits;
	wire _tage_io_resp_f2_3_taken;
	wire _tage_io_resp_f2_3_is_br;
	wire _tage_io_resp_f2_3_predicted_pc_valid;
	wire [39:0] _tage_io_resp_f2_3_predicted_pc_bits;
	wire _tage_io_resp_f3_0_taken;
	wire _tage_io_resp_f3_0_is_br;
	wire _tage_io_resp_f3_0_is_jal;
	wire _tage_io_resp_f3_0_predicted_pc_valid;
	wire [39:0] _tage_io_resp_f3_0_predicted_pc_bits;
	wire _tage_io_resp_f3_1_taken;
	wire _tage_io_resp_f3_1_is_br;
	wire _tage_io_resp_f3_1_is_jal;
	wire _tage_io_resp_f3_1_predicted_pc_valid;
	wire [39:0] _tage_io_resp_f3_1_predicted_pc_bits;
	wire _tage_io_resp_f3_2_taken;
	wire _tage_io_resp_f3_2_is_br;
	wire _tage_io_resp_f3_2_is_jal;
	wire _tage_io_resp_f3_2_predicted_pc_valid;
	wire [39:0] _tage_io_resp_f3_2_predicted_pc_bits;
	wire _tage_io_resp_f3_3_taken;
	wire _tage_io_resp_f3_3_is_br;
	wire _tage_io_resp_f3_3_is_jal;
	wire _tage_io_resp_f3_3_predicted_pc_valid;
	wire [39:0] _tage_io_resp_f3_3_predicted_pc_bits;
	wire [119:0] _tage_io_f3_meta;
	wire [119:0] _loop_io_f3_meta;
	LoopBranchPredictorBank loop(
		.clock(clock),
		.reset(reset),
		.io_f0_valid(io_f0_valid),
		.io_f0_pc(io_f0_pc),
		.io_f0_mask(io_f0_mask),
		.io_resp_in_0_f1_0_taken(_tage_io_resp_f1_0_taken),
		.io_resp_in_0_f1_0_is_br(_tage_io_resp_f1_0_is_br),
		.io_resp_in_0_f1_0_predicted_pc_valid(_tage_io_resp_f1_0_predicted_pc_valid),
		.io_resp_in_0_f1_0_predicted_pc_bits(_tage_io_resp_f1_0_predicted_pc_bits),
		.io_resp_in_0_f1_1_taken(_tage_io_resp_f1_1_taken),
		.io_resp_in_0_f1_1_is_br(_tage_io_resp_f1_1_is_br),
		.io_resp_in_0_f1_1_predicted_pc_valid(_tage_io_resp_f1_1_predicted_pc_valid),
		.io_resp_in_0_f1_1_predicted_pc_bits(_tage_io_resp_f1_1_predicted_pc_bits),
		.io_resp_in_0_f1_2_taken(_tage_io_resp_f1_2_taken),
		.io_resp_in_0_f1_2_is_br(_tage_io_resp_f1_2_is_br),
		.io_resp_in_0_f1_2_predicted_pc_valid(_tage_io_resp_f1_2_predicted_pc_valid),
		.io_resp_in_0_f1_2_predicted_pc_bits(_tage_io_resp_f1_2_predicted_pc_bits),
		.io_resp_in_0_f1_3_taken(_tage_io_resp_f1_3_taken),
		.io_resp_in_0_f1_3_is_br(_tage_io_resp_f1_3_is_br),
		.io_resp_in_0_f1_3_predicted_pc_valid(_tage_io_resp_f1_3_predicted_pc_valid),
		.io_resp_in_0_f1_3_predicted_pc_bits(_tage_io_resp_f1_3_predicted_pc_bits),
		.io_resp_in_0_f2_0_taken(_tage_io_resp_f2_0_taken),
		.io_resp_in_0_f2_0_is_br(_tage_io_resp_f2_0_is_br),
		.io_resp_in_0_f2_0_predicted_pc_valid(_tage_io_resp_f2_0_predicted_pc_valid),
		.io_resp_in_0_f2_0_predicted_pc_bits(_tage_io_resp_f2_0_predicted_pc_bits),
		.io_resp_in_0_f2_1_taken(_tage_io_resp_f2_1_taken),
		.io_resp_in_0_f2_1_is_br(_tage_io_resp_f2_1_is_br),
		.io_resp_in_0_f2_1_predicted_pc_valid(_tage_io_resp_f2_1_predicted_pc_valid),
		.io_resp_in_0_f2_1_predicted_pc_bits(_tage_io_resp_f2_1_predicted_pc_bits),
		.io_resp_in_0_f2_2_taken(_tage_io_resp_f2_2_taken),
		.io_resp_in_0_f2_2_is_br(_tage_io_resp_f2_2_is_br),
		.io_resp_in_0_f2_2_predicted_pc_valid(_tage_io_resp_f2_2_predicted_pc_valid),
		.io_resp_in_0_f2_2_predicted_pc_bits(_tage_io_resp_f2_2_predicted_pc_bits),
		.io_resp_in_0_f2_3_taken(_tage_io_resp_f2_3_taken),
		.io_resp_in_0_f2_3_is_br(_tage_io_resp_f2_3_is_br),
		.io_resp_in_0_f2_3_predicted_pc_valid(_tage_io_resp_f2_3_predicted_pc_valid),
		.io_resp_in_0_f2_3_predicted_pc_bits(_tage_io_resp_f2_3_predicted_pc_bits),
		.io_resp_in_0_f3_0_taken(_tage_io_resp_f3_0_taken),
		.io_resp_in_0_f3_0_is_br(_tage_io_resp_f3_0_is_br),
		.io_resp_in_0_f3_0_is_jal(_tage_io_resp_f3_0_is_jal),
		.io_resp_in_0_f3_0_predicted_pc_valid(_tage_io_resp_f3_0_predicted_pc_valid),
		.io_resp_in_0_f3_0_predicted_pc_bits(_tage_io_resp_f3_0_predicted_pc_bits),
		.io_resp_in_0_f3_1_taken(_tage_io_resp_f3_1_taken),
		.io_resp_in_0_f3_1_is_br(_tage_io_resp_f3_1_is_br),
		.io_resp_in_0_f3_1_is_jal(_tage_io_resp_f3_1_is_jal),
		.io_resp_in_0_f3_1_predicted_pc_valid(_tage_io_resp_f3_1_predicted_pc_valid),
		.io_resp_in_0_f3_1_predicted_pc_bits(_tage_io_resp_f3_1_predicted_pc_bits),
		.io_resp_in_0_f3_2_taken(_tage_io_resp_f3_2_taken),
		.io_resp_in_0_f3_2_is_br(_tage_io_resp_f3_2_is_br),
		.io_resp_in_0_f3_2_is_jal(_tage_io_resp_f3_2_is_jal),
		.io_resp_in_0_f3_2_predicted_pc_valid(_tage_io_resp_f3_2_predicted_pc_valid),
		.io_resp_in_0_f3_2_predicted_pc_bits(_tage_io_resp_f3_2_predicted_pc_bits),
		.io_resp_in_0_f3_3_taken(_tage_io_resp_f3_3_taken),
		.io_resp_in_0_f3_3_is_br(_tage_io_resp_f3_3_is_br),
		.io_resp_in_0_f3_3_is_jal(_tage_io_resp_f3_3_is_jal),
		.io_resp_in_0_f3_3_predicted_pc_valid(_tage_io_resp_f3_3_predicted_pc_valid),
		.io_resp_in_0_f3_3_predicted_pc_bits(_tage_io_resp_f3_3_predicted_pc_bits),
		.io_resp_f1_0_taken(io_resp_f1_0_taken),
		.io_resp_f1_0_is_br(io_resp_f1_0_is_br),
		.io_resp_f1_0_predicted_pc_valid(io_resp_f1_0_predicted_pc_valid),
		.io_resp_f1_0_predicted_pc_bits(io_resp_f1_0_predicted_pc_bits),
		.io_resp_f1_1_taken(io_resp_f1_1_taken),
		.io_resp_f1_1_is_br(io_resp_f1_1_is_br),
		.io_resp_f1_1_predicted_pc_valid(io_resp_f1_1_predicted_pc_valid),
		.io_resp_f1_1_predicted_pc_bits(io_resp_f1_1_predicted_pc_bits),
		.io_resp_f1_2_taken(io_resp_f1_2_taken),
		.io_resp_f1_2_is_br(io_resp_f1_2_is_br),
		.io_resp_f1_2_predicted_pc_valid(io_resp_f1_2_predicted_pc_valid),
		.io_resp_f1_2_predicted_pc_bits(io_resp_f1_2_predicted_pc_bits),
		.io_resp_f1_3_taken(io_resp_f1_3_taken),
		.io_resp_f1_3_is_br(io_resp_f1_3_is_br),
		.io_resp_f1_3_predicted_pc_valid(io_resp_f1_3_predicted_pc_valid),
		.io_resp_f1_3_predicted_pc_bits(io_resp_f1_3_predicted_pc_bits),
		.io_resp_f2_0_taken(io_resp_f2_0_taken),
		.io_resp_f2_0_is_br(io_resp_f2_0_is_br),
		.io_resp_f2_0_predicted_pc_valid(io_resp_f2_0_predicted_pc_valid),
		.io_resp_f2_0_predicted_pc_bits(io_resp_f2_0_predicted_pc_bits),
		.io_resp_f2_1_taken(io_resp_f2_1_taken),
		.io_resp_f2_1_is_br(io_resp_f2_1_is_br),
		.io_resp_f2_1_predicted_pc_valid(io_resp_f2_1_predicted_pc_valid),
		.io_resp_f2_1_predicted_pc_bits(io_resp_f2_1_predicted_pc_bits),
		.io_resp_f2_2_taken(io_resp_f2_2_taken),
		.io_resp_f2_2_is_br(io_resp_f2_2_is_br),
		.io_resp_f2_2_predicted_pc_valid(io_resp_f2_2_predicted_pc_valid),
		.io_resp_f2_2_predicted_pc_bits(io_resp_f2_2_predicted_pc_bits),
		.io_resp_f2_3_taken(io_resp_f2_3_taken),
		.io_resp_f2_3_is_br(io_resp_f2_3_is_br),
		.io_resp_f2_3_predicted_pc_valid(io_resp_f2_3_predicted_pc_valid),
		.io_resp_f2_3_predicted_pc_bits(io_resp_f2_3_predicted_pc_bits),
		.io_resp_f3_0_taken(io_resp_f3_0_taken),
		.io_resp_f3_0_is_br(io_resp_f3_0_is_br),
		.io_resp_f3_0_is_jal(io_resp_f3_0_is_jal),
		.io_resp_f3_0_predicted_pc_valid(io_resp_f3_0_predicted_pc_valid),
		.io_resp_f3_0_predicted_pc_bits(io_resp_f3_0_predicted_pc_bits),
		.io_resp_f3_1_taken(io_resp_f3_1_taken),
		.io_resp_f3_1_is_br(io_resp_f3_1_is_br),
		.io_resp_f3_1_is_jal(io_resp_f3_1_is_jal),
		.io_resp_f3_1_predicted_pc_valid(io_resp_f3_1_predicted_pc_valid),
		.io_resp_f3_1_predicted_pc_bits(io_resp_f3_1_predicted_pc_bits),
		.io_resp_f3_2_taken(io_resp_f3_2_taken),
		.io_resp_f3_2_is_br(io_resp_f3_2_is_br),
		.io_resp_f3_2_is_jal(io_resp_f3_2_is_jal),
		.io_resp_f3_2_predicted_pc_valid(io_resp_f3_2_predicted_pc_valid),
		.io_resp_f3_2_predicted_pc_bits(io_resp_f3_2_predicted_pc_bits),
		.io_resp_f3_3_taken(io_resp_f3_3_taken),
		.io_resp_f3_3_is_br(io_resp_f3_3_is_br),
		.io_resp_f3_3_is_jal(io_resp_f3_3_is_jal),
		.io_resp_f3_3_predicted_pc_valid(io_resp_f3_3_predicted_pc_valid),
		.io_resp_f3_3_predicted_pc_bits(io_resp_f3_3_predicted_pc_bits),
		.io_f3_meta(_loop_io_f3_meta),
		.io_f3_fire(io_f3_fire),
		.io_update_valid(io_update_valid),
		.io_update_bits_is_mispredict_update(io_update_bits_is_mispredict_update),
		.io_update_bits_is_repair_update(io_update_bits_is_repair_update),
		.io_update_bits_pc(io_update_bits_pc),
		.io_update_bits_br_mask(io_update_bits_br_mask),
		.io_update_bits_cfi_mispredicted(io_update_bits_cfi_mispredicted),
		.io_update_bits_meta({66'h00000000000000000, io_update_bits_meta[119:66]})
	);
	TageBranchPredictorBank tage(
		.clock(clock),
		.reset(reset),
		.io_f0_valid(io_f0_valid),
		.io_f0_pc(io_f0_pc),
		.io_f1_ghist(io_f1_ghist),
		.io_resp_in_0_f1_0_taken(_btb_io_resp_f1_0_taken),
		.io_resp_in_0_f1_0_is_br(_btb_io_resp_f1_0_is_br),
		.io_resp_in_0_f1_0_predicted_pc_valid(_btb_io_resp_f1_0_predicted_pc_valid),
		.io_resp_in_0_f1_0_predicted_pc_bits(_btb_io_resp_f1_0_predicted_pc_bits),
		.io_resp_in_0_f1_1_taken(_btb_io_resp_f1_1_taken),
		.io_resp_in_0_f1_1_is_br(_btb_io_resp_f1_1_is_br),
		.io_resp_in_0_f1_1_predicted_pc_valid(_btb_io_resp_f1_1_predicted_pc_valid),
		.io_resp_in_0_f1_1_predicted_pc_bits(_btb_io_resp_f1_1_predicted_pc_bits),
		.io_resp_in_0_f1_2_taken(_btb_io_resp_f1_2_taken),
		.io_resp_in_0_f1_2_is_br(_btb_io_resp_f1_2_is_br),
		.io_resp_in_0_f1_2_predicted_pc_valid(_btb_io_resp_f1_2_predicted_pc_valid),
		.io_resp_in_0_f1_2_predicted_pc_bits(_btb_io_resp_f1_2_predicted_pc_bits),
		.io_resp_in_0_f1_3_taken(_btb_io_resp_f1_3_taken),
		.io_resp_in_0_f1_3_is_br(_btb_io_resp_f1_3_is_br),
		.io_resp_in_0_f1_3_predicted_pc_valid(_btb_io_resp_f1_3_predicted_pc_valid),
		.io_resp_in_0_f1_3_predicted_pc_bits(_btb_io_resp_f1_3_predicted_pc_bits),
		.io_resp_in_0_f2_0_taken(_btb_io_resp_f2_0_taken),
		.io_resp_in_0_f2_0_is_br(_btb_io_resp_f2_0_is_br),
		.io_resp_in_0_f2_0_predicted_pc_valid(_btb_io_resp_f2_0_predicted_pc_valid),
		.io_resp_in_0_f2_0_predicted_pc_bits(_btb_io_resp_f2_0_predicted_pc_bits),
		.io_resp_in_0_f2_1_taken(_btb_io_resp_f2_1_taken),
		.io_resp_in_0_f2_1_is_br(_btb_io_resp_f2_1_is_br),
		.io_resp_in_0_f2_1_predicted_pc_valid(_btb_io_resp_f2_1_predicted_pc_valid),
		.io_resp_in_0_f2_1_predicted_pc_bits(_btb_io_resp_f2_1_predicted_pc_bits),
		.io_resp_in_0_f2_2_taken(_btb_io_resp_f2_2_taken),
		.io_resp_in_0_f2_2_is_br(_btb_io_resp_f2_2_is_br),
		.io_resp_in_0_f2_2_predicted_pc_valid(_btb_io_resp_f2_2_predicted_pc_valid),
		.io_resp_in_0_f2_2_predicted_pc_bits(_btb_io_resp_f2_2_predicted_pc_bits),
		.io_resp_in_0_f2_3_taken(_btb_io_resp_f2_3_taken),
		.io_resp_in_0_f2_3_is_br(_btb_io_resp_f2_3_is_br),
		.io_resp_in_0_f2_3_predicted_pc_valid(_btb_io_resp_f2_3_predicted_pc_valid),
		.io_resp_in_0_f2_3_predicted_pc_bits(_btb_io_resp_f2_3_predicted_pc_bits),
		.io_resp_in_0_f3_0_taken(_btb_io_resp_f3_0_taken),
		.io_resp_in_0_f3_0_is_br(_btb_io_resp_f3_0_is_br),
		.io_resp_in_0_f3_0_is_jal(_btb_io_resp_f3_0_is_jal),
		.io_resp_in_0_f3_0_predicted_pc_valid(_btb_io_resp_f3_0_predicted_pc_valid),
		.io_resp_in_0_f3_0_predicted_pc_bits(_btb_io_resp_f3_0_predicted_pc_bits),
		.io_resp_in_0_f3_1_taken(_btb_io_resp_f3_1_taken),
		.io_resp_in_0_f3_1_is_br(_btb_io_resp_f3_1_is_br),
		.io_resp_in_0_f3_1_is_jal(_btb_io_resp_f3_1_is_jal),
		.io_resp_in_0_f3_1_predicted_pc_valid(_btb_io_resp_f3_1_predicted_pc_valid),
		.io_resp_in_0_f3_1_predicted_pc_bits(_btb_io_resp_f3_1_predicted_pc_bits),
		.io_resp_in_0_f3_2_taken(_btb_io_resp_f3_2_taken),
		.io_resp_in_0_f3_2_is_br(_btb_io_resp_f3_2_is_br),
		.io_resp_in_0_f3_2_is_jal(_btb_io_resp_f3_2_is_jal),
		.io_resp_in_0_f3_2_predicted_pc_valid(_btb_io_resp_f3_2_predicted_pc_valid),
		.io_resp_in_0_f3_2_predicted_pc_bits(_btb_io_resp_f3_2_predicted_pc_bits),
		.io_resp_in_0_f3_3_taken(_btb_io_resp_f3_3_taken),
		.io_resp_in_0_f3_3_is_br(_btb_io_resp_f3_3_is_br),
		.io_resp_in_0_f3_3_is_jal(_btb_io_resp_f3_3_is_jal),
		.io_resp_in_0_f3_3_predicted_pc_valid(_btb_io_resp_f3_3_predicted_pc_valid),
		.io_resp_in_0_f3_3_predicted_pc_bits(_btb_io_resp_f3_3_predicted_pc_bits),
		.io_resp_f1_0_taken(_tage_io_resp_f1_0_taken),
		.io_resp_f1_0_is_br(_tage_io_resp_f1_0_is_br),
		.io_resp_f1_0_predicted_pc_valid(_tage_io_resp_f1_0_predicted_pc_valid),
		.io_resp_f1_0_predicted_pc_bits(_tage_io_resp_f1_0_predicted_pc_bits),
		.io_resp_f1_1_taken(_tage_io_resp_f1_1_taken),
		.io_resp_f1_1_is_br(_tage_io_resp_f1_1_is_br),
		.io_resp_f1_1_predicted_pc_valid(_tage_io_resp_f1_1_predicted_pc_valid),
		.io_resp_f1_1_predicted_pc_bits(_tage_io_resp_f1_1_predicted_pc_bits),
		.io_resp_f1_2_taken(_tage_io_resp_f1_2_taken),
		.io_resp_f1_2_is_br(_tage_io_resp_f1_2_is_br),
		.io_resp_f1_2_predicted_pc_valid(_tage_io_resp_f1_2_predicted_pc_valid),
		.io_resp_f1_2_predicted_pc_bits(_tage_io_resp_f1_2_predicted_pc_bits),
		.io_resp_f1_3_taken(_tage_io_resp_f1_3_taken),
		.io_resp_f1_3_is_br(_tage_io_resp_f1_3_is_br),
		.io_resp_f1_3_predicted_pc_valid(_tage_io_resp_f1_3_predicted_pc_valid),
		.io_resp_f1_3_predicted_pc_bits(_tage_io_resp_f1_3_predicted_pc_bits),
		.io_resp_f2_0_taken(_tage_io_resp_f2_0_taken),
		.io_resp_f2_0_is_br(_tage_io_resp_f2_0_is_br),
		.io_resp_f2_0_predicted_pc_valid(_tage_io_resp_f2_0_predicted_pc_valid),
		.io_resp_f2_0_predicted_pc_bits(_tage_io_resp_f2_0_predicted_pc_bits),
		.io_resp_f2_1_taken(_tage_io_resp_f2_1_taken),
		.io_resp_f2_1_is_br(_tage_io_resp_f2_1_is_br),
		.io_resp_f2_1_predicted_pc_valid(_tage_io_resp_f2_1_predicted_pc_valid),
		.io_resp_f2_1_predicted_pc_bits(_tage_io_resp_f2_1_predicted_pc_bits),
		.io_resp_f2_2_taken(_tage_io_resp_f2_2_taken),
		.io_resp_f2_2_is_br(_tage_io_resp_f2_2_is_br),
		.io_resp_f2_2_predicted_pc_valid(_tage_io_resp_f2_2_predicted_pc_valid),
		.io_resp_f2_2_predicted_pc_bits(_tage_io_resp_f2_2_predicted_pc_bits),
		.io_resp_f2_3_taken(_tage_io_resp_f2_3_taken),
		.io_resp_f2_3_is_br(_tage_io_resp_f2_3_is_br),
		.io_resp_f2_3_predicted_pc_valid(_tage_io_resp_f2_3_predicted_pc_valid),
		.io_resp_f2_3_predicted_pc_bits(_tage_io_resp_f2_3_predicted_pc_bits),
		.io_resp_f3_0_taken(_tage_io_resp_f3_0_taken),
		.io_resp_f3_0_is_br(_tage_io_resp_f3_0_is_br),
		.io_resp_f3_0_is_jal(_tage_io_resp_f3_0_is_jal),
		.io_resp_f3_0_predicted_pc_valid(_tage_io_resp_f3_0_predicted_pc_valid),
		.io_resp_f3_0_predicted_pc_bits(_tage_io_resp_f3_0_predicted_pc_bits),
		.io_resp_f3_1_taken(_tage_io_resp_f3_1_taken),
		.io_resp_f3_1_is_br(_tage_io_resp_f3_1_is_br),
		.io_resp_f3_1_is_jal(_tage_io_resp_f3_1_is_jal),
		.io_resp_f3_1_predicted_pc_valid(_tage_io_resp_f3_1_predicted_pc_valid),
		.io_resp_f3_1_predicted_pc_bits(_tage_io_resp_f3_1_predicted_pc_bits),
		.io_resp_f3_2_taken(_tage_io_resp_f3_2_taken),
		.io_resp_f3_2_is_br(_tage_io_resp_f3_2_is_br),
		.io_resp_f3_2_is_jal(_tage_io_resp_f3_2_is_jal),
		.io_resp_f3_2_predicted_pc_valid(_tage_io_resp_f3_2_predicted_pc_valid),
		.io_resp_f3_2_predicted_pc_bits(_tage_io_resp_f3_2_predicted_pc_bits),
		.io_resp_f3_3_taken(_tage_io_resp_f3_3_taken),
		.io_resp_f3_3_is_br(_tage_io_resp_f3_3_is_br),
		.io_resp_f3_3_is_jal(_tage_io_resp_f3_3_is_jal),
		.io_resp_f3_3_predicted_pc_valid(_tage_io_resp_f3_3_predicted_pc_valid),
		.io_resp_f3_3_predicted_pc_bits(_tage_io_resp_f3_3_predicted_pc_bits),
		.io_f3_meta(_tage_io_f3_meta),
		.io_update_valid(io_update_valid),
		.io_update_bits_is_mispredict_update(io_update_bits_is_mispredict_update),
		.io_update_bits_is_repair_update(io_update_bits_is_repair_update),
		.io_update_bits_btb_mispredicts(io_update_bits_btb_mispredicts),
		.io_update_bits_pc(io_update_bits_pc),
		.io_update_bits_br_mask(io_update_bits_br_mask),
		.io_update_bits_cfi_idx_valid(io_update_bits_cfi_idx_valid),
		.io_update_bits_cfi_idx_bits(io_update_bits_cfi_idx_bits),
		.io_update_bits_cfi_taken(io_update_bits_cfi_taken),
		.io_update_bits_cfi_mispredicted(io_update_bits_cfi_mispredicted),
		.io_update_bits_ghist(io_update_bits_ghist),
		.io_update_bits_meta({10'h000, io_update_bits_meta[119:10]})
	);
	BTBBranchPredictorBank btb(
		.clock(clock),
		.reset(reset),
		.io_f0_valid(io_f0_valid),
		.io_f0_pc(io_f0_pc),
		.io_resp_in_0_f1_0_taken(_bim_io_resp_f1_0_taken),
		.io_resp_in_0_f1_0_is_br(_bim_io_resp_f1_0_is_br),
		.io_resp_in_0_f1_0_predicted_pc_valid(_bim_io_resp_f1_0_predicted_pc_valid),
		.io_resp_in_0_f1_0_predicted_pc_bits(_bim_io_resp_f1_0_predicted_pc_bits),
		.io_resp_in_0_f1_1_taken(_bim_io_resp_f1_1_taken),
		.io_resp_in_0_f1_1_is_br(_bim_io_resp_f1_1_is_br),
		.io_resp_in_0_f1_1_predicted_pc_valid(_bim_io_resp_f1_1_predicted_pc_valid),
		.io_resp_in_0_f1_1_predicted_pc_bits(_bim_io_resp_f1_1_predicted_pc_bits),
		.io_resp_in_0_f1_2_taken(_bim_io_resp_f1_2_taken),
		.io_resp_in_0_f1_2_is_br(_bim_io_resp_f1_2_is_br),
		.io_resp_in_0_f1_2_predicted_pc_valid(_bim_io_resp_f1_2_predicted_pc_valid),
		.io_resp_in_0_f1_2_predicted_pc_bits(_bim_io_resp_f1_2_predicted_pc_bits),
		.io_resp_in_0_f1_3_taken(_bim_io_resp_f1_3_taken),
		.io_resp_in_0_f1_3_is_br(_bim_io_resp_f1_3_is_br),
		.io_resp_in_0_f1_3_predicted_pc_valid(_bim_io_resp_f1_3_predicted_pc_valid),
		.io_resp_in_0_f1_3_predicted_pc_bits(_bim_io_resp_f1_3_predicted_pc_bits),
		.io_resp_in_0_f2_0_taken(_bim_io_resp_f2_0_taken),
		.io_resp_in_0_f2_0_is_br(_bim_io_resp_f2_0_is_br),
		.io_resp_in_0_f2_0_is_jal(_bim_io_resp_f2_0_is_jal),
		.io_resp_in_0_f2_0_predicted_pc_valid(_bim_io_resp_f2_0_predicted_pc_valid),
		.io_resp_in_0_f2_0_predicted_pc_bits(_bim_io_resp_f2_0_predicted_pc_bits),
		.io_resp_in_0_f2_1_taken(_bim_io_resp_f2_1_taken),
		.io_resp_in_0_f2_1_is_br(_bim_io_resp_f2_1_is_br),
		.io_resp_in_0_f2_1_is_jal(_bim_io_resp_f2_1_is_jal),
		.io_resp_in_0_f2_1_predicted_pc_valid(_bim_io_resp_f2_1_predicted_pc_valid),
		.io_resp_in_0_f2_1_predicted_pc_bits(_bim_io_resp_f2_1_predicted_pc_bits),
		.io_resp_in_0_f2_2_taken(_bim_io_resp_f2_2_taken),
		.io_resp_in_0_f2_2_is_br(_bim_io_resp_f2_2_is_br),
		.io_resp_in_0_f2_2_is_jal(_bim_io_resp_f2_2_is_jal),
		.io_resp_in_0_f2_2_predicted_pc_valid(_bim_io_resp_f2_2_predicted_pc_valid),
		.io_resp_in_0_f2_2_predicted_pc_bits(_bim_io_resp_f2_2_predicted_pc_bits),
		.io_resp_in_0_f2_3_taken(_bim_io_resp_f2_3_taken),
		.io_resp_in_0_f2_3_is_br(_bim_io_resp_f2_3_is_br),
		.io_resp_in_0_f2_3_is_jal(_bim_io_resp_f2_3_is_jal),
		.io_resp_in_0_f2_3_predicted_pc_valid(_bim_io_resp_f2_3_predicted_pc_valid),
		.io_resp_in_0_f2_3_predicted_pc_bits(_bim_io_resp_f2_3_predicted_pc_bits),
		.io_resp_in_0_f3_0_taken(_bim_io_resp_f3_0_taken),
		.io_resp_in_0_f3_0_is_br(_bim_io_resp_f3_0_is_br),
		.io_resp_in_0_f3_0_is_jal(_bim_io_resp_f3_0_is_jal),
		.io_resp_in_0_f3_0_predicted_pc_valid(_bim_io_resp_f3_0_predicted_pc_valid),
		.io_resp_in_0_f3_0_predicted_pc_bits(_bim_io_resp_f3_0_predicted_pc_bits),
		.io_resp_in_0_f3_1_taken(_bim_io_resp_f3_1_taken),
		.io_resp_in_0_f3_1_is_br(_bim_io_resp_f3_1_is_br),
		.io_resp_in_0_f3_1_is_jal(_bim_io_resp_f3_1_is_jal),
		.io_resp_in_0_f3_1_predicted_pc_valid(_bim_io_resp_f3_1_predicted_pc_valid),
		.io_resp_in_0_f3_1_predicted_pc_bits(_bim_io_resp_f3_1_predicted_pc_bits),
		.io_resp_in_0_f3_2_taken(_bim_io_resp_f3_2_taken),
		.io_resp_in_0_f3_2_is_br(_bim_io_resp_f3_2_is_br),
		.io_resp_in_0_f3_2_is_jal(_bim_io_resp_f3_2_is_jal),
		.io_resp_in_0_f3_2_predicted_pc_valid(_bim_io_resp_f3_2_predicted_pc_valid),
		.io_resp_in_0_f3_2_predicted_pc_bits(_bim_io_resp_f3_2_predicted_pc_bits),
		.io_resp_in_0_f3_3_taken(_bim_io_resp_f3_3_taken),
		.io_resp_in_0_f3_3_is_br(_bim_io_resp_f3_3_is_br),
		.io_resp_in_0_f3_3_is_jal(_bim_io_resp_f3_3_is_jal),
		.io_resp_in_0_f3_3_predicted_pc_valid(_bim_io_resp_f3_3_predicted_pc_valid),
		.io_resp_in_0_f3_3_predicted_pc_bits(_bim_io_resp_f3_3_predicted_pc_bits),
		.io_resp_f1_0_taken(_btb_io_resp_f1_0_taken),
		.io_resp_f1_0_is_br(_btb_io_resp_f1_0_is_br),
		.io_resp_f1_0_predicted_pc_valid(_btb_io_resp_f1_0_predicted_pc_valid),
		.io_resp_f1_0_predicted_pc_bits(_btb_io_resp_f1_0_predicted_pc_bits),
		.io_resp_f1_1_taken(_btb_io_resp_f1_1_taken),
		.io_resp_f1_1_is_br(_btb_io_resp_f1_1_is_br),
		.io_resp_f1_1_predicted_pc_valid(_btb_io_resp_f1_1_predicted_pc_valid),
		.io_resp_f1_1_predicted_pc_bits(_btb_io_resp_f1_1_predicted_pc_bits),
		.io_resp_f1_2_taken(_btb_io_resp_f1_2_taken),
		.io_resp_f1_2_is_br(_btb_io_resp_f1_2_is_br),
		.io_resp_f1_2_predicted_pc_valid(_btb_io_resp_f1_2_predicted_pc_valid),
		.io_resp_f1_2_predicted_pc_bits(_btb_io_resp_f1_2_predicted_pc_bits),
		.io_resp_f1_3_taken(_btb_io_resp_f1_3_taken),
		.io_resp_f1_3_is_br(_btb_io_resp_f1_3_is_br),
		.io_resp_f1_3_predicted_pc_valid(_btb_io_resp_f1_3_predicted_pc_valid),
		.io_resp_f1_3_predicted_pc_bits(_btb_io_resp_f1_3_predicted_pc_bits),
		.io_resp_f2_0_taken(_btb_io_resp_f2_0_taken),
		.io_resp_f2_0_is_br(_btb_io_resp_f2_0_is_br),
		.io_resp_f2_0_predicted_pc_valid(_btb_io_resp_f2_0_predicted_pc_valid),
		.io_resp_f2_0_predicted_pc_bits(_btb_io_resp_f2_0_predicted_pc_bits),
		.io_resp_f2_1_taken(_btb_io_resp_f2_1_taken),
		.io_resp_f2_1_is_br(_btb_io_resp_f2_1_is_br),
		.io_resp_f2_1_predicted_pc_valid(_btb_io_resp_f2_1_predicted_pc_valid),
		.io_resp_f2_1_predicted_pc_bits(_btb_io_resp_f2_1_predicted_pc_bits),
		.io_resp_f2_2_taken(_btb_io_resp_f2_2_taken),
		.io_resp_f2_2_is_br(_btb_io_resp_f2_2_is_br),
		.io_resp_f2_2_predicted_pc_valid(_btb_io_resp_f2_2_predicted_pc_valid),
		.io_resp_f2_2_predicted_pc_bits(_btb_io_resp_f2_2_predicted_pc_bits),
		.io_resp_f2_3_taken(_btb_io_resp_f2_3_taken),
		.io_resp_f2_3_is_br(_btb_io_resp_f2_3_is_br),
		.io_resp_f2_3_predicted_pc_valid(_btb_io_resp_f2_3_predicted_pc_valid),
		.io_resp_f2_3_predicted_pc_bits(_btb_io_resp_f2_3_predicted_pc_bits),
		.io_resp_f3_0_taken(_btb_io_resp_f3_0_taken),
		.io_resp_f3_0_is_br(_btb_io_resp_f3_0_is_br),
		.io_resp_f3_0_is_jal(_btb_io_resp_f3_0_is_jal),
		.io_resp_f3_0_predicted_pc_valid(_btb_io_resp_f3_0_predicted_pc_valid),
		.io_resp_f3_0_predicted_pc_bits(_btb_io_resp_f3_0_predicted_pc_bits),
		.io_resp_f3_1_taken(_btb_io_resp_f3_1_taken),
		.io_resp_f3_1_is_br(_btb_io_resp_f3_1_is_br),
		.io_resp_f3_1_is_jal(_btb_io_resp_f3_1_is_jal),
		.io_resp_f3_1_predicted_pc_valid(_btb_io_resp_f3_1_predicted_pc_valid),
		.io_resp_f3_1_predicted_pc_bits(_btb_io_resp_f3_1_predicted_pc_bits),
		.io_resp_f3_2_taken(_btb_io_resp_f3_2_taken),
		.io_resp_f3_2_is_br(_btb_io_resp_f3_2_is_br),
		.io_resp_f3_2_is_jal(_btb_io_resp_f3_2_is_jal),
		.io_resp_f3_2_predicted_pc_valid(_btb_io_resp_f3_2_predicted_pc_valid),
		.io_resp_f3_2_predicted_pc_bits(_btb_io_resp_f3_2_predicted_pc_bits),
		.io_resp_f3_3_taken(_btb_io_resp_f3_3_taken),
		.io_resp_f3_3_is_br(_btb_io_resp_f3_3_is_br),
		.io_resp_f3_3_is_jal(_btb_io_resp_f3_3_is_jal),
		.io_resp_f3_3_predicted_pc_valid(_btb_io_resp_f3_3_predicted_pc_valid),
		.io_resp_f3_3_predicted_pc_bits(_btb_io_resp_f3_3_predicted_pc_bits),
		.io_f3_meta(_btb_io_f3_meta),
		.io_update_valid(io_update_valid),
		.io_update_bits_is_mispredict_update(io_update_bits_is_mispredict_update),
		.io_update_bits_is_repair_update(io_update_bits_is_repair_update),
		.io_update_bits_btb_mispredicts(io_update_bits_btb_mispredicts),
		.io_update_bits_pc(io_update_bits_pc),
		.io_update_bits_br_mask(io_update_bits_br_mask),
		.io_update_bits_cfi_idx_valid(io_update_bits_cfi_idx_valid),
		.io_update_bits_cfi_idx_bits(io_update_bits_cfi_idx_bits),
		.io_update_bits_cfi_taken(io_update_bits_cfi_taken),
		.io_update_bits_target(io_update_bits_target),
		.io_update_bits_meta({9'h000, io_update_bits_meta[119:9]})
	);
	BIMBranchPredictorBank bim(
		.clock(clock),
		.reset(reset),
		.io_f0_valid(io_f0_valid),
		.io_f0_pc(io_f0_pc),
		.io_resp_in_0_f1_0_taken(_ubtb_io_resp_f1_0_taken),
		.io_resp_in_0_f1_0_is_br(_ubtb_io_resp_f1_0_is_br),
		.io_resp_in_0_f1_0_predicted_pc_valid(_ubtb_io_resp_f1_0_predicted_pc_valid),
		.io_resp_in_0_f1_0_predicted_pc_bits(_ubtb_io_resp_f1_0_predicted_pc_bits),
		.io_resp_in_0_f1_1_taken(_ubtb_io_resp_f1_1_taken),
		.io_resp_in_0_f1_1_is_br(_ubtb_io_resp_f1_1_is_br),
		.io_resp_in_0_f1_1_predicted_pc_valid(_ubtb_io_resp_f1_1_predicted_pc_valid),
		.io_resp_in_0_f1_1_predicted_pc_bits(_ubtb_io_resp_f1_1_predicted_pc_bits),
		.io_resp_in_0_f1_2_taken(_ubtb_io_resp_f1_2_taken),
		.io_resp_in_0_f1_2_is_br(_ubtb_io_resp_f1_2_is_br),
		.io_resp_in_0_f1_2_predicted_pc_valid(_ubtb_io_resp_f1_2_predicted_pc_valid),
		.io_resp_in_0_f1_2_predicted_pc_bits(_ubtb_io_resp_f1_2_predicted_pc_bits),
		.io_resp_in_0_f1_3_taken(_ubtb_io_resp_f1_3_taken),
		.io_resp_in_0_f1_3_is_br(_ubtb_io_resp_f1_3_is_br),
		.io_resp_in_0_f1_3_predicted_pc_valid(_ubtb_io_resp_f1_3_predicted_pc_valid),
		.io_resp_in_0_f1_3_predicted_pc_bits(_ubtb_io_resp_f1_3_predicted_pc_bits),
		.io_resp_in_0_f2_0_is_br(_ubtb_io_resp_f2_0_is_br),
		.io_resp_in_0_f2_0_is_jal(_ubtb_io_resp_f2_0_is_jal),
		.io_resp_in_0_f2_0_predicted_pc_valid(_ubtb_io_resp_f2_0_predicted_pc_valid),
		.io_resp_in_0_f2_0_predicted_pc_bits(_ubtb_io_resp_f2_0_predicted_pc_bits),
		.io_resp_in_0_f2_1_is_br(_ubtb_io_resp_f2_1_is_br),
		.io_resp_in_0_f2_1_is_jal(_ubtb_io_resp_f2_1_is_jal),
		.io_resp_in_0_f2_1_predicted_pc_valid(_ubtb_io_resp_f2_1_predicted_pc_valid),
		.io_resp_in_0_f2_1_predicted_pc_bits(_ubtb_io_resp_f2_1_predicted_pc_bits),
		.io_resp_in_0_f2_2_is_br(_ubtb_io_resp_f2_2_is_br),
		.io_resp_in_0_f2_2_is_jal(_ubtb_io_resp_f2_2_is_jal),
		.io_resp_in_0_f2_2_predicted_pc_valid(_ubtb_io_resp_f2_2_predicted_pc_valid),
		.io_resp_in_0_f2_2_predicted_pc_bits(_ubtb_io_resp_f2_2_predicted_pc_bits),
		.io_resp_in_0_f2_3_is_br(_ubtb_io_resp_f2_3_is_br),
		.io_resp_in_0_f2_3_is_jal(_ubtb_io_resp_f2_3_is_jal),
		.io_resp_in_0_f2_3_predicted_pc_valid(_ubtb_io_resp_f2_3_predicted_pc_valid),
		.io_resp_in_0_f2_3_predicted_pc_bits(_ubtb_io_resp_f2_3_predicted_pc_bits),
		.io_resp_in_0_f3_0_is_br(_ubtb_io_resp_f3_0_is_br),
		.io_resp_in_0_f3_0_is_jal(_ubtb_io_resp_f3_0_is_jal),
		.io_resp_in_0_f3_0_predicted_pc_valid(_ubtb_io_resp_f3_0_predicted_pc_valid),
		.io_resp_in_0_f3_0_predicted_pc_bits(_ubtb_io_resp_f3_0_predicted_pc_bits),
		.io_resp_in_0_f3_1_is_br(_ubtb_io_resp_f3_1_is_br),
		.io_resp_in_0_f3_1_is_jal(_ubtb_io_resp_f3_1_is_jal),
		.io_resp_in_0_f3_1_predicted_pc_valid(_ubtb_io_resp_f3_1_predicted_pc_valid),
		.io_resp_in_0_f3_1_predicted_pc_bits(_ubtb_io_resp_f3_1_predicted_pc_bits),
		.io_resp_in_0_f3_2_is_br(_ubtb_io_resp_f3_2_is_br),
		.io_resp_in_0_f3_2_is_jal(_ubtb_io_resp_f3_2_is_jal),
		.io_resp_in_0_f3_2_predicted_pc_valid(_ubtb_io_resp_f3_2_predicted_pc_valid),
		.io_resp_in_0_f3_2_predicted_pc_bits(_ubtb_io_resp_f3_2_predicted_pc_bits),
		.io_resp_in_0_f3_3_is_br(_ubtb_io_resp_f3_3_is_br),
		.io_resp_in_0_f3_3_is_jal(_ubtb_io_resp_f3_3_is_jal),
		.io_resp_in_0_f3_3_predicted_pc_valid(_ubtb_io_resp_f3_3_predicted_pc_valid),
		.io_resp_in_0_f3_3_predicted_pc_bits(_ubtb_io_resp_f3_3_predicted_pc_bits),
		.io_resp_f1_0_taken(_bim_io_resp_f1_0_taken),
		.io_resp_f1_0_is_br(_bim_io_resp_f1_0_is_br),
		.io_resp_f1_0_predicted_pc_valid(_bim_io_resp_f1_0_predicted_pc_valid),
		.io_resp_f1_0_predicted_pc_bits(_bim_io_resp_f1_0_predicted_pc_bits),
		.io_resp_f1_1_taken(_bim_io_resp_f1_1_taken),
		.io_resp_f1_1_is_br(_bim_io_resp_f1_1_is_br),
		.io_resp_f1_1_predicted_pc_valid(_bim_io_resp_f1_1_predicted_pc_valid),
		.io_resp_f1_1_predicted_pc_bits(_bim_io_resp_f1_1_predicted_pc_bits),
		.io_resp_f1_2_taken(_bim_io_resp_f1_2_taken),
		.io_resp_f1_2_is_br(_bim_io_resp_f1_2_is_br),
		.io_resp_f1_2_predicted_pc_valid(_bim_io_resp_f1_2_predicted_pc_valid),
		.io_resp_f1_2_predicted_pc_bits(_bim_io_resp_f1_2_predicted_pc_bits),
		.io_resp_f1_3_taken(_bim_io_resp_f1_3_taken),
		.io_resp_f1_3_is_br(_bim_io_resp_f1_3_is_br),
		.io_resp_f1_3_predicted_pc_valid(_bim_io_resp_f1_3_predicted_pc_valid),
		.io_resp_f1_3_predicted_pc_bits(_bim_io_resp_f1_3_predicted_pc_bits),
		.io_resp_f2_0_taken(_bim_io_resp_f2_0_taken),
		.io_resp_f2_0_is_br(_bim_io_resp_f2_0_is_br),
		.io_resp_f2_0_is_jal(_bim_io_resp_f2_0_is_jal),
		.io_resp_f2_0_predicted_pc_valid(_bim_io_resp_f2_0_predicted_pc_valid),
		.io_resp_f2_0_predicted_pc_bits(_bim_io_resp_f2_0_predicted_pc_bits),
		.io_resp_f2_1_taken(_bim_io_resp_f2_1_taken),
		.io_resp_f2_1_is_br(_bim_io_resp_f2_1_is_br),
		.io_resp_f2_1_is_jal(_bim_io_resp_f2_1_is_jal),
		.io_resp_f2_1_predicted_pc_valid(_bim_io_resp_f2_1_predicted_pc_valid),
		.io_resp_f2_1_predicted_pc_bits(_bim_io_resp_f2_1_predicted_pc_bits),
		.io_resp_f2_2_taken(_bim_io_resp_f2_2_taken),
		.io_resp_f2_2_is_br(_bim_io_resp_f2_2_is_br),
		.io_resp_f2_2_is_jal(_bim_io_resp_f2_2_is_jal),
		.io_resp_f2_2_predicted_pc_valid(_bim_io_resp_f2_2_predicted_pc_valid),
		.io_resp_f2_2_predicted_pc_bits(_bim_io_resp_f2_2_predicted_pc_bits),
		.io_resp_f2_3_taken(_bim_io_resp_f2_3_taken),
		.io_resp_f2_3_is_br(_bim_io_resp_f2_3_is_br),
		.io_resp_f2_3_is_jal(_bim_io_resp_f2_3_is_jal),
		.io_resp_f2_3_predicted_pc_valid(_bim_io_resp_f2_3_predicted_pc_valid),
		.io_resp_f2_3_predicted_pc_bits(_bim_io_resp_f2_3_predicted_pc_bits),
		.io_resp_f3_0_taken(_bim_io_resp_f3_0_taken),
		.io_resp_f3_0_is_br(_bim_io_resp_f3_0_is_br),
		.io_resp_f3_0_is_jal(_bim_io_resp_f3_0_is_jal),
		.io_resp_f3_0_predicted_pc_valid(_bim_io_resp_f3_0_predicted_pc_valid),
		.io_resp_f3_0_predicted_pc_bits(_bim_io_resp_f3_0_predicted_pc_bits),
		.io_resp_f3_1_taken(_bim_io_resp_f3_1_taken),
		.io_resp_f3_1_is_br(_bim_io_resp_f3_1_is_br),
		.io_resp_f3_1_is_jal(_bim_io_resp_f3_1_is_jal),
		.io_resp_f3_1_predicted_pc_valid(_bim_io_resp_f3_1_predicted_pc_valid),
		.io_resp_f3_1_predicted_pc_bits(_bim_io_resp_f3_1_predicted_pc_bits),
		.io_resp_f3_2_taken(_bim_io_resp_f3_2_taken),
		.io_resp_f3_2_is_br(_bim_io_resp_f3_2_is_br),
		.io_resp_f3_2_is_jal(_bim_io_resp_f3_2_is_jal),
		.io_resp_f3_2_predicted_pc_valid(_bim_io_resp_f3_2_predicted_pc_valid),
		.io_resp_f3_2_predicted_pc_bits(_bim_io_resp_f3_2_predicted_pc_bits),
		.io_resp_f3_3_taken(_bim_io_resp_f3_3_taken),
		.io_resp_f3_3_is_br(_bim_io_resp_f3_3_is_br),
		.io_resp_f3_3_is_jal(_bim_io_resp_f3_3_is_jal),
		.io_resp_f3_3_predicted_pc_valid(_bim_io_resp_f3_3_predicted_pc_valid),
		.io_resp_f3_3_predicted_pc_bits(_bim_io_resp_f3_3_predicted_pc_bits),
		.io_f3_meta(_bim_io_f3_meta),
		.io_update_valid(io_update_valid),
		.io_update_bits_is_mispredict_update(io_update_bits_is_mispredict_update),
		.io_update_bits_is_repair_update(io_update_bits_is_repair_update),
		.io_update_bits_btb_mispredicts(io_update_bits_btb_mispredicts),
		.io_update_bits_pc(io_update_bits_pc),
		.io_update_bits_br_mask(io_update_bits_br_mask),
		.io_update_bits_cfi_idx_valid(io_update_bits_cfi_idx_valid),
		.io_update_bits_cfi_idx_bits(io_update_bits_cfi_idx_bits),
		.io_update_bits_cfi_taken(io_update_bits_cfi_taken),
		.io_update_bits_cfi_is_br(io_update_bits_cfi_is_br),
		.io_update_bits_cfi_is_jal(io_update_bits_cfi_is_jal),
		.io_update_bits_meta(io_update_bits_meta)
	);
	FA2MicroBTBBranchPredictorBank ubtb(
		.clock(clock),
		.reset(reset),
		.io_f0_valid(io_f0_valid),
		.io_f0_pc(io_f0_pc),
		.io_resp_f1_0_taken(_ubtb_io_resp_f1_0_taken),
		.io_resp_f1_0_is_br(_ubtb_io_resp_f1_0_is_br),
		.io_resp_f1_0_predicted_pc_valid(_ubtb_io_resp_f1_0_predicted_pc_valid),
		.io_resp_f1_0_predicted_pc_bits(_ubtb_io_resp_f1_0_predicted_pc_bits),
		.io_resp_f1_1_taken(_ubtb_io_resp_f1_1_taken),
		.io_resp_f1_1_is_br(_ubtb_io_resp_f1_1_is_br),
		.io_resp_f1_1_predicted_pc_valid(_ubtb_io_resp_f1_1_predicted_pc_valid),
		.io_resp_f1_1_predicted_pc_bits(_ubtb_io_resp_f1_1_predicted_pc_bits),
		.io_resp_f1_2_taken(_ubtb_io_resp_f1_2_taken),
		.io_resp_f1_2_is_br(_ubtb_io_resp_f1_2_is_br),
		.io_resp_f1_2_predicted_pc_valid(_ubtb_io_resp_f1_2_predicted_pc_valid),
		.io_resp_f1_2_predicted_pc_bits(_ubtb_io_resp_f1_2_predicted_pc_bits),
		.io_resp_f1_3_taken(_ubtb_io_resp_f1_3_taken),
		.io_resp_f1_3_is_br(_ubtb_io_resp_f1_3_is_br),
		.io_resp_f1_3_predicted_pc_valid(_ubtb_io_resp_f1_3_predicted_pc_valid),
		.io_resp_f1_3_predicted_pc_bits(_ubtb_io_resp_f1_3_predicted_pc_bits),
		.io_resp_f2_0_is_br(_ubtb_io_resp_f2_0_is_br),
		.io_resp_f2_0_is_jal(_ubtb_io_resp_f2_0_is_jal),
		.io_resp_f2_0_predicted_pc_valid(_ubtb_io_resp_f2_0_predicted_pc_valid),
		.io_resp_f2_0_predicted_pc_bits(_ubtb_io_resp_f2_0_predicted_pc_bits),
		.io_resp_f2_1_is_br(_ubtb_io_resp_f2_1_is_br),
		.io_resp_f2_1_is_jal(_ubtb_io_resp_f2_1_is_jal),
		.io_resp_f2_1_predicted_pc_valid(_ubtb_io_resp_f2_1_predicted_pc_valid),
		.io_resp_f2_1_predicted_pc_bits(_ubtb_io_resp_f2_1_predicted_pc_bits),
		.io_resp_f2_2_is_br(_ubtb_io_resp_f2_2_is_br),
		.io_resp_f2_2_is_jal(_ubtb_io_resp_f2_2_is_jal),
		.io_resp_f2_2_predicted_pc_valid(_ubtb_io_resp_f2_2_predicted_pc_valid),
		.io_resp_f2_2_predicted_pc_bits(_ubtb_io_resp_f2_2_predicted_pc_bits),
		.io_resp_f2_3_is_br(_ubtb_io_resp_f2_3_is_br),
		.io_resp_f2_3_is_jal(_ubtb_io_resp_f2_3_is_jal),
		.io_resp_f2_3_predicted_pc_valid(_ubtb_io_resp_f2_3_predicted_pc_valid),
		.io_resp_f2_3_predicted_pc_bits(_ubtb_io_resp_f2_3_predicted_pc_bits),
		.io_resp_f3_0_is_br(_ubtb_io_resp_f3_0_is_br),
		.io_resp_f3_0_is_jal(_ubtb_io_resp_f3_0_is_jal),
		.io_resp_f3_0_predicted_pc_valid(_ubtb_io_resp_f3_0_predicted_pc_valid),
		.io_resp_f3_0_predicted_pc_bits(_ubtb_io_resp_f3_0_predicted_pc_bits),
		.io_resp_f3_1_is_br(_ubtb_io_resp_f3_1_is_br),
		.io_resp_f3_1_is_jal(_ubtb_io_resp_f3_1_is_jal),
		.io_resp_f3_1_predicted_pc_valid(_ubtb_io_resp_f3_1_predicted_pc_valid),
		.io_resp_f3_1_predicted_pc_bits(_ubtb_io_resp_f3_1_predicted_pc_bits),
		.io_resp_f3_2_is_br(_ubtb_io_resp_f3_2_is_br),
		.io_resp_f3_2_is_jal(_ubtb_io_resp_f3_2_is_jal),
		.io_resp_f3_2_predicted_pc_valid(_ubtb_io_resp_f3_2_predicted_pc_valid),
		.io_resp_f3_2_predicted_pc_bits(_ubtb_io_resp_f3_2_predicted_pc_bits),
		.io_resp_f3_3_is_br(_ubtb_io_resp_f3_3_is_br),
		.io_resp_f3_3_is_jal(_ubtb_io_resp_f3_3_is_jal),
		.io_resp_f3_3_predicted_pc_valid(_ubtb_io_resp_f3_3_predicted_pc_valid),
		.io_resp_f3_3_predicted_pc_bits(_ubtb_io_resp_f3_3_predicted_pc_bits),
		.io_f3_meta(_ubtb_io_f3_meta),
		.io_update_valid(io_update_valid),
		.io_update_bits_is_mispredict_update(io_update_bits_is_mispredict_update),
		.io_update_bits_is_repair_update(io_update_bits_is_repair_update),
		.io_update_bits_btb_mispredicts(io_update_bits_btb_mispredicts),
		.io_update_bits_pc(io_update_bits_pc),
		.io_update_bits_br_mask(io_update_bits_br_mask),
		.io_update_bits_cfi_idx_valid(io_update_bits_cfi_idx_valid),
		.io_update_bits_cfi_idx_bits(io_update_bits_cfi_idx_bits),
		.io_update_bits_cfi_taken(io_update_bits_cfi_taken),
		.io_update_bits_cfi_is_br(io_update_bits_cfi_is_br),
		.io_update_bits_cfi_is_jal(io_update_bits_cfi_is_jal),
		.io_update_bits_cfi_is_jalr(io_update_bits_cfi_is_jalr),
		.io_update_bits_target(io_update_bits_target)
	);
	assign io_f3_meta = {14'h0000, _loop_io_f3_meta[39:0], _tage_io_f3_meta[55:0], _btb_io_f3_meta[0], _ubtb_io_f3_meta[0], _bim_io_f3_meta[7:0]};
endmodule
