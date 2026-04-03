module BranchPredictor (
	clock,
	reset,
	io_f0_req_valid,
	io_f0_req_bits_pc,
	io_f0_req_bits_ghist_old_history,
	io_resp_f1_preds_0_taken,
	io_resp_f1_preds_0_is_br,
	io_resp_f1_preds_0_predicted_pc_valid,
	io_resp_f1_preds_0_predicted_pc_bits,
	io_resp_f1_preds_1_taken,
	io_resp_f1_preds_1_is_br,
	io_resp_f1_preds_1_predicted_pc_valid,
	io_resp_f1_preds_1_predicted_pc_bits,
	io_resp_f1_preds_2_taken,
	io_resp_f1_preds_2_is_br,
	io_resp_f1_preds_2_predicted_pc_valid,
	io_resp_f1_preds_2_predicted_pc_bits,
	io_resp_f1_preds_3_taken,
	io_resp_f1_preds_3_is_br,
	io_resp_f1_preds_3_predicted_pc_valid,
	io_resp_f1_preds_3_predicted_pc_bits,
	io_resp_f2_preds_0_taken,
	io_resp_f2_preds_0_is_br,
	io_resp_f2_preds_0_predicted_pc_valid,
	io_resp_f2_preds_0_predicted_pc_bits,
	io_resp_f2_preds_1_taken,
	io_resp_f2_preds_1_is_br,
	io_resp_f2_preds_1_predicted_pc_valid,
	io_resp_f2_preds_1_predicted_pc_bits,
	io_resp_f2_preds_2_taken,
	io_resp_f2_preds_2_is_br,
	io_resp_f2_preds_2_predicted_pc_valid,
	io_resp_f2_preds_2_predicted_pc_bits,
	io_resp_f2_preds_3_taken,
	io_resp_f2_preds_3_is_br,
	io_resp_f2_preds_3_predicted_pc_valid,
	io_resp_f2_preds_3_predicted_pc_bits,
	io_resp_f3_pc,
	io_resp_f3_preds_0_taken,
	io_resp_f3_preds_0_is_br,
	io_resp_f3_preds_0_is_jal,
	io_resp_f3_preds_0_predicted_pc_valid,
	io_resp_f3_preds_0_predicted_pc_bits,
	io_resp_f3_preds_1_taken,
	io_resp_f3_preds_1_is_br,
	io_resp_f3_preds_1_is_jal,
	io_resp_f3_preds_1_predicted_pc_valid,
	io_resp_f3_preds_1_predicted_pc_bits,
	io_resp_f3_preds_2_taken,
	io_resp_f3_preds_2_is_br,
	io_resp_f3_preds_2_is_jal,
	io_resp_f3_preds_2_predicted_pc_valid,
	io_resp_f3_preds_2_predicted_pc_bits,
	io_resp_f3_preds_3_taken,
	io_resp_f3_preds_3_is_br,
	io_resp_f3_preds_3_is_jal,
	io_resp_f3_preds_3_predicted_pc_valid,
	io_resp_f3_preds_3_predicted_pc_bits,
	io_resp_f3_meta_0,
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
	io_update_bits_ghist_old_history,
	io_update_bits_target,
	io_update_bits_meta_0
);
	input clock;
	input reset;
	input io_f0_req_valid;
	input [39:0] io_f0_req_bits_pc;
	input [63:0] io_f0_req_bits_ghist_old_history;
	output wire io_resp_f1_preds_0_taken;
	output wire io_resp_f1_preds_0_is_br;
	output wire io_resp_f1_preds_0_predicted_pc_valid;
	output wire [39:0] io_resp_f1_preds_0_predicted_pc_bits;
	output wire io_resp_f1_preds_1_taken;
	output wire io_resp_f1_preds_1_is_br;
	output wire io_resp_f1_preds_1_predicted_pc_valid;
	output wire [39:0] io_resp_f1_preds_1_predicted_pc_bits;
	output wire io_resp_f1_preds_2_taken;
	output wire io_resp_f1_preds_2_is_br;
	output wire io_resp_f1_preds_2_predicted_pc_valid;
	output wire [39:0] io_resp_f1_preds_2_predicted_pc_bits;
	output wire io_resp_f1_preds_3_taken;
	output wire io_resp_f1_preds_3_is_br;
	output wire io_resp_f1_preds_3_predicted_pc_valid;
	output wire [39:0] io_resp_f1_preds_3_predicted_pc_bits;
	output wire io_resp_f2_preds_0_taken;
	output wire io_resp_f2_preds_0_is_br;
	output wire io_resp_f2_preds_0_predicted_pc_valid;
	output wire [39:0] io_resp_f2_preds_0_predicted_pc_bits;
	output wire io_resp_f2_preds_1_taken;
	output wire io_resp_f2_preds_1_is_br;
	output wire io_resp_f2_preds_1_predicted_pc_valid;
	output wire [39:0] io_resp_f2_preds_1_predicted_pc_bits;
	output wire io_resp_f2_preds_2_taken;
	output wire io_resp_f2_preds_2_is_br;
	output wire io_resp_f2_preds_2_predicted_pc_valid;
	output wire [39:0] io_resp_f2_preds_2_predicted_pc_bits;
	output wire io_resp_f2_preds_3_taken;
	output wire io_resp_f2_preds_3_is_br;
	output wire io_resp_f2_preds_3_predicted_pc_valid;
	output wire [39:0] io_resp_f2_preds_3_predicted_pc_bits;
	output wire [39:0] io_resp_f3_pc;
	output wire io_resp_f3_preds_0_taken;
	output wire io_resp_f3_preds_0_is_br;
	output wire io_resp_f3_preds_0_is_jal;
	output wire io_resp_f3_preds_0_predicted_pc_valid;
	output wire [39:0] io_resp_f3_preds_0_predicted_pc_bits;
	output wire io_resp_f3_preds_1_taken;
	output wire io_resp_f3_preds_1_is_br;
	output wire io_resp_f3_preds_1_is_jal;
	output wire io_resp_f3_preds_1_predicted_pc_valid;
	output wire [39:0] io_resp_f3_preds_1_predicted_pc_bits;
	output wire io_resp_f3_preds_2_taken;
	output wire io_resp_f3_preds_2_is_br;
	output wire io_resp_f3_preds_2_is_jal;
	output wire io_resp_f3_preds_2_predicted_pc_valid;
	output wire [39:0] io_resp_f3_preds_2_predicted_pc_bits;
	output wire io_resp_f3_preds_3_taken;
	output wire io_resp_f3_preds_3_is_br;
	output wire io_resp_f3_preds_3_is_jal;
	output wire io_resp_f3_preds_3_predicted_pc_valid;
	output wire [39:0] io_resp_f3_preds_3_predicted_pc_bits;
	output wire [119:0] io_resp_f3_meta_0;
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
	input [63:0] io_update_bits_ghist_old_history;
	input [39:0] io_update_bits_target;
	input [119:0] io_update_bits_meta_0;
	wire [6:0] _banked_predictors_0_io_f0_mask_T = 7'h0f << io_f0_req_bits_pc[2:1];
	reg [63:0] banked_predictors_0_io_f1_ghist_REG;
	reg [39:0] io_resp_f1_pc_REG;
	reg [39:0] io_resp_f2_pc_REG;
	reg [39:0] io_resp_f3_pc_REG;
	always @(posedge clock) begin
		banked_predictors_0_io_f1_ghist_REG <= io_f0_req_bits_ghist_old_history;
		io_resp_f1_pc_REG <= io_f0_req_bits_pc;
		io_resp_f2_pc_REG <= io_resp_f1_pc_REG;
		io_resp_f3_pc_REG <= io_resp_f2_pc_REG;
	end
	ComposedBranchPredictorBank banked_predictors_0(
		.clock(clock),
		.reset(reset),
		.io_f0_valid(io_f0_req_valid),
		.io_f0_pc(io_f0_req_bits_pc),
		.io_f0_mask(_banked_predictors_0_io_f0_mask_T[3:0]),
		.io_f1_ghist(banked_predictors_0_io_f1_ghist_REG),
		.io_resp_f1_0_taken(io_resp_f1_preds_0_taken),
		.io_resp_f1_0_is_br(io_resp_f1_preds_0_is_br),
		.io_resp_f1_0_predicted_pc_valid(io_resp_f1_preds_0_predicted_pc_valid),
		.io_resp_f1_0_predicted_pc_bits(io_resp_f1_preds_0_predicted_pc_bits),
		.io_resp_f1_1_taken(io_resp_f1_preds_1_taken),
		.io_resp_f1_1_is_br(io_resp_f1_preds_1_is_br),
		.io_resp_f1_1_predicted_pc_valid(io_resp_f1_preds_1_predicted_pc_valid),
		.io_resp_f1_1_predicted_pc_bits(io_resp_f1_preds_1_predicted_pc_bits),
		.io_resp_f1_2_taken(io_resp_f1_preds_2_taken),
		.io_resp_f1_2_is_br(io_resp_f1_preds_2_is_br),
		.io_resp_f1_2_predicted_pc_valid(io_resp_f1_preds_2_predicted_pc_valid),
		.io_resp_f1_2_predicted_pc_bits(io_resp_f1_preds_2_predicted_pc_bits),
		.io_resp_f1_3_taken(io_resp_f1_preds_3_taken),
		.io_resp_f1_3_is_br(io_resp_f1_preds_3_is_br),
		.io_resp_f1_3_predicted_pc_valid(io_resp_f1_preds_3_predicted_pc_valid),
		.io_resp_f1_3_predicted_pc_bits(io_resp_f1_preds_3_predicted_pc_bits),
		.io_resp_f2_0_taken(io_resp_f2_preds_0_taken),
		.io_resp_f2_0_is_br(io_resp_f2_preds_0_is_br),
		.io_resp_f2_0_predicted_pc_valid(io_resp_f2_preds_0_predicted_pc_valid),
		.io_resp_f2_0_predicted_pc_bits(io_resp_f2_preds_0_predicted_pc_bits),
		.io_resp_f2_1_taken(io_resp_f2_preds_1_taken),
		.io_resp_f2_1_is_br(io_resp_f2_preds_1_is_br),
		.io_resp_f2_1_predicted_pc_valid(io_resp_f2_preds_1_predicted_pc_valid),
		.io_resp_f2_1_predicted_pc_bits(io_resp_f2_preds_1_predicted_pc_bits),
		.io_resp_f2_2_taken(io_resp_f2_preds_2_taken),
		.io_resp_f2_2_is_br(io_resp_f2_preds_2_is_br),
		.io_resp_f2_2_predicted_pc_valid(io_resp_f2_preds_2_predicted_pc_valid),
		.io_resp_f2_2_predicted_pc_bits(io_resp_f2_preds_2_predicted_pc_bits),
		.io_resp_f2_3_taken(io_resp_f2_preds_3_taken),
		.io_resp_f2_3_is_br(io_resp_f2_preds_3_is_br),
		.io_resp_f2_3_predicted_pc_valid(io_resp_f2_preds_3_predicted_pc_valid),
		.io_resp_f2_3_predicted_pc_bits(io_resp_f2_preds_3_predicted_pc_bits),
		.io_resp_f3_0_taken(io_resp_f3_preds_0_taken),
		.io_resp_f3_0_is_br(io_resp_f3_preds_0_is_br),
		.io_resp_f3_0_is_jal(io_resp_f3_preds_0_is_jal),
		.io_resp_f3_0_predicted_pc_valid(io_resp_f3_preds_0_predicted_pc_valid),
		.io_resp_f3_0_predicted_pc_bits(io_resp_f3_preds_0_predicted_pc_bits),
		.io_resp_f3_1_taken(io_resp_f3_preds_1_taken),
		.io_resp_f3_1_is_br(io_resp_f3_preds_1_is_br),
		.io_resp_f3_1_is_jal(io_resp_f3_preds_1_is_jal),
		.io_resp_f3_1_predicted_pc_valid(io_resp_f3_preds_1_predicted_pc_valid),
		.io_resp_f3_1_predicted_pc_bits(io_resp_f3_preds_1_predicted_pc_bits),
		.io_resp_f3_2_taken(io_resp_f3_preds_2_taken),
		.io_resp_f3_2_is_br(io_resp_f3_preds_2_is_br),
		.io_resp_f3_2_is_jal(io_resp_f3_preds_2_is_jal),
		.io_resp_f3_2_predicted_pc_valid(io_resp_f3_preds_2_predicted_pc_valid),
		.io_resp_f3_2_predicted_pc_bits(io_resp_f3_preds_2_predicted_pc_bits),
		.io_resp_f3_3_taken(io_resp_f3_preds_3_taken),
		.io_resp_f3_3_is_br(io_resp_f3_preds_3_is_br),
		.io_resp_f3_3_is_jal(io_resp_f3_preds_3_is_jal),
		.io_resp_f3_3_predicted_pc_valid(io_resp_f3_preds_3_predicted_pc_valid),
		.io_resp_f3_3_predicted_pc_bits(io_resp_f3_preds_3_predicted_pc_bits),
		.io_f3_meta(io_resp_f3_meta_0),
		.io_f3_fire(io_f3_fire),
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
		.io_update_bits_cfi_is_br(io_update_bits_cfi_is_br),
		.io_update_bits_cfi_is_jal(io_update_bits_cfi_is_jal),
		.io_update_bits_cfi_is_jalr(io_update_bits_cfi_is_jalr),
		.io_update_bits_ghist(io_update_bits_ghist_old_history),
		.io_update_bits_target(io_update_bits_target),
		.io_update_bits_meta(io_update_bits_meta_0)
	);
	assign io_resp_f3_pc = io_resp_f3_pc_REG;
endmodule
