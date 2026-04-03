module Arbiter2_BranchPredictionUpdate (
	io_in_0_valid,
	io_in_0_bits_is_mispredict_update,
	io_in_0_bits_is_repair_update,
	io_in_0_bits_pc,
	io_in_0_bits_br_mask,
	io_in_0_bits_cfi_idx_valid,
	io_in_0_bits_cfi_idx_bits,
	io_in_0_bits_cfi_taken,
	io_in_0_bits_cfi_mispredicted,
	io_in_0_bits_cfi_is_br,
	io_in_0_bits_cfi_is_jal,
	io_in_0_bits_ghist_old_history,
	io_in_0_bits_target,
	io_in_0_bits_meta_0,
	io_in_1_ready,
	io_in_1_valid,
	io_in_1_bits_is_mispredict_update,
	io_in_1_bits_is_repair_update,
	io_in_1_bits_btb_mispredicts,
	io_in_1_bits_pc,
	io_in_1_bits_br_mask,
	io_in_1_bits_cfi_idx_valid,
	io_in_1_bits_cfi_idx_bits,
	io_in_1_bits_cfi_taken,
	io_in_1_bits_cfi_mispredicted,
	io_in_1_bits_cfi_is_br,
	io_in_1_bits_cfi_is_jal,
	io_in_1_bits_cfi_is_jalr,
	io_in_1_bits_ghist_old_history,
	io_in_1_bits_target,
	io_in_1_bits_meta_0,
	io_out_valid,
	io_out_bits_is_mispredict_update,
	io_out_bits_is_repair_update,
	io_out_bits_btb_mispredicts,
	io_out_bits_pc,
	io_out_bits_br_mask,
	io_out_bits_cfi_idx_valid,
	io_out_bits_cfi_idx_bits,
	io_out_bits_cfi_taken,
	io_out_bits_cfi_mispredicted,
	io_out_bits_cfi_is_br,
	io_out_bits_cfi_is_jal,
	io_out_bits_cfi_is_jalr,
	io_out_bits_ghist_old_history,
	io_out_bits_target,
	io_out_bits_meta_0
);
	input io_in_0_valid;
	input io_in_0_bits_is_mispredict_update;
	input io_in_0_bits_is_repair_update;
	input [39:0] io_in_0_bits_pc;
	input [3:0] io_in_0_bits_br_mask;
	input io_in_0_bits_cfi_idx_valid;
	input [1:0] io_in_0_bits_cfi_idx_bits;
	input io_in_0_bits_cfi_taken;
	input io_in_0_bits_cfi_mispredicted;
	input io_in_0_bits_cfi_is_br;
	input io_in_0_bits_cfi_is_jal;
	input [63:0] io_in_0_bits_ghist_old_history;
	input [39:0] io_in_0_bits_target;
	input [119:0] io_in_0_bits_meta_0;
	output wire io_in_1_ready;
	input io_in_1_valid;
	input io_in_1_bits_is_mispredict_update;
	input io_in_1_bits_is_repair_update;
	input [3:0] io_in_1_bits_btb_mispredicts;
	input [39:0] io_in_1_bits_pc;
	input [3:0] io_in_1_bits_br_mask;
	input io_in_1_bits_cfi_idx_valid;
	input [1:0] io_in_1_bits_cfi_idx_bits;
	input io_in_1_bits_cfi_taken;
	input io_in_1_bits_cfi_mispredicted;
	input io_in_1_bits_cfi_is_br;
	input io_in_1_bits_cfi_is_jal;
	input io_in_1_bits_cfi_is_jalr;
	input [63:0] io_in_1_bits_ghist_old_history;
	input [39:0] io_in_1_bits_target;
	input [119:0] io_in_1_bits_meta_0;
	output wire io_out_valid;
	output wire io_out_bits_is_mispredict_update;
	output wire io_out_bits_is_repair_update;
	output wire [3:0] io_out_bits_btb_mispredicts;
	output wire [39:0] io_out_bits_pc;
	output wire [3:0] io_out_bits_br_mask;
	output wire io_out_bits_cfi_idx_valid;
	output wire [1:0] io_out_bits_cfi_idx_bits;
	output wire io_out_bits_cfi_taken;
	output wire io_out_bits_cfi_mispredicted;
	output wire io_out_bits_cfi_is_br;
	output wire io_out_bits_cfi_is_jal;
	output wire io_out_bits_cfi_is_jalr;
	output wire [63:0] io_out_bits_ghist_old_history;
	output wire [39:0] io_out_bits_target;
	output wire [119:0] io_out_bits_meta_0;
	assign io_in_1_ready = ~io_in_0_valid;
	assign io_out_valid = io_in_0_valid | io_in_1_valid;
	assign io_out_bits_is_mispredict_update = (io_in_0_valid ? io_in_0_bits_is_mispredict_update : io_in_1_bits_is_mispredict_update);
	assign io_out_bits_is_repair_update = (io_in_0_valid ? io_in_0_bits_is_repair_update : io_in_1_bits_is_repair_update);
	assign io_out_bits_btb_mispredicts = (io_in_0_valid ? 4'h0 : io_in_1_bits_btb_mispredicts);
	assign io_out_bits_pc = (io_in_0_valid ? io_in_0_bits_pc : io_in_1_bits_pc);
	assign io_out_bits_br_mask = (io_in_0_valid ? io_in_0_bits_br_mask : io_in_1_bits_br_mask);
	assign io_out_bits_cfi_idx_valid = (io_in_0_valid ? io_in_0_bits_cfi_idx_valid : io_in_1_bits_cfi_idx_valid);
	assign io_out_bits_cfi_idx_bits = (io_in_0_valid ? io_in_0_bits_cfi_idx_bits : io_in_1_bits_cfi_idx_bits);
	assign io_out_bits_cfi_taken = (io_in_0_valid ? io_in_0_bits_cfi_taken : io_in_1_bits_cfi_taken);
	assign io_out_bits_cfi_mispredicted = (io_in_0_valid ? io_in_0_bits_cfi_mispredicted : io_in_1_bits_cfi_mispredicted);
	assign io_out_bits_cfi_is_br = (io_in_0_valid ? io_in_0_bits_cfi_is_br : io_in_1_bits_cfi_is_br);
	assign io_out_bits_cfi_is_jal = (io_in_0_valid ? io_in_0_bits_cfi_is_jal : io_in_1_bits_cfi_is_jal);
	assign io_out_bits_cfi_is_jalr = ~io_in_0_valid & io_in_1_bits_cfi_is_jalr;
	assign io_out_bits_ghist_old_history = (io_in_0_valid ? io_in_0_bits_ghist_old_history : io_in_1_bits_ghist_old_history);
	assign io_out_bits_target = (io_in_0_valid ? io_in_0_bits_target : io_in_1_bits_target);
	assign io_out_bits_meta_0 = (io_in_0_valid ? io_in_0_bits_meta_0 : io_in_1_bits_meta_0);
endmodule
