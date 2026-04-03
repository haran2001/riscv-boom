module FetchTargetQueue (
	clock,
	reset,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits_pc,
	io_enq_bits_cfi_idx_valid,
	io_enq_bits_cfi_idx_bits,
	io_enq_bits_cfi_type,
	io_enq_bits_cfi_is_call,
	io_enq_bits_cfi_is_ret,
	io_enq_bits_ras_top,
	io_enq_bits_mask,
	io_enq_bits_br_mask,
	io_enq_bits_ghist_old_history,
	io_enq_bits_ghist_current_saw_branch_not_taken,
	io_enq_bits_ghist_new_saw_branch_not_taken,
	io_enq_bits_ghist_new_saw_branch_taken,
	io_enq_bits_ghist_ras_idx,
	io_enq_bits_bpd_meta_0,
	io_enq_idx,
	io_deq_valid,
	io_deq_bits,
	io_arb_ftq_reqs_0,
	io_arb_ftq_reqs_1,
	io_arb_ftq_reqs_2,
	io_rrd_ftq_resps_0_entry_cfi_idx_bits,
	io_rrd_ftq_resps_0_entry_br_mask,
	io_rrd_ftq_resps_0_entry_cfi_is_call,
	io_rrd_ftq_resps_0_entry_cfi_is_ret,
	io_rrd_ftq_resps_0_entry_ras_idx,
	io_rrd_ftq_resps_0_entry_start_bank,
	io_rrd_ftq_resps_0_ghist_old_history,
	io_rrd_ftq_resps_0_ghist_current_saw_branch_not_taken,
	io_rrd_ftq_resps_0_ghist_new_saw_branch_not_taken,
	io_rrd_ftq_resps_0_ghist_new_saw_branch_taken,
	io_rrd_ftq_resps_0_ghist_ras_idx,
	io_rrd_ftq_resps_0_pc,
	io_rrd_ftq_resps_1_valid,
	io_rrd_ftq_resps_1_entry_cfi_idx_valid,
	io_rrd_ftq_resps_1_entry_cfi_idx_bits,
	io_rrd_ftq_resps_1_entry_start_bank,
	io_rrd_ftq_resps_1_pc,
	io_rrd_ftq_resps_2_valid,
	io_rrd_ftq_resps_2_entry_cfi_idx_valid,
	io_rrd_ftq_resps_2_entry_cfi_idx_bits,
	io_rrd_ftq_resps_2_entry_start_bank,
	io_rrd_ftq_resps_2_pc,
	io_com_pc,
	io_redirect_valid,
	io_redirect_bits,
	io_brupdate_b2_uop_ftq_idx,
	io_brupdate_b2_uop_pc_lob,
	io_brupdate_b2_mispredict,
	io_brupdate_b2_taken,
	io_bpdupdate_valid,
	io_bpdupdate_bits_is_mispredict_update,
	io_bpdupdate_bits_is_repair_update,
	io_bpdupdate_bits_pc,
	io_bpdupdate_bits_br_mask,
	io_bpdupdate_bits_cfi_idx_valid,
	io_bpdupdate_bits_cfi_idx_bits,
	io_bpdupdate_bits_cfi_taken,
	io_bpdupdate_bits_cfi_mispredicted,
	io_bpdupdate_bits_cfi_is_br,
	io_bpdupdate_bits_cfi_is_jal,
	io_bpdupdate_bits_ghist_old_history,
	io_bpdupdate_bits_target,
	io_bpdupdate_bits_meta_0,
	io_ras_update,
	io_ras_update_idx,
	io_ras_update_pc
);
	input clock;
	input reset;
	output wire io_enq_ready;
	input io_enq_valid;
	input [39:0] io_enq_bits_pc;
	input io_enq_bits_cfi_idx_valid;
	input [1:0] io_enq_bits_cfi_idx_bits;
	input [2:0] io_enq_bits_cfi_type;
	input io_enq_bits_cfi_is_call;
	input io_enq_bits_cfi_is_ret;
	input [39:0] io_enq_bits_ras_top;
	input [3:0] io_enq_bits_mask;
	input [3:0] io_enq_bits_br_mask;
	input [63:0] io_enq_bits_ghist_old_history;
	input io_enq_bits_ghist_current_saw_branch_not_taken;
	input io_enq_bits_ghist_new_saw_branch_not_taken;
	input io_enq_bits_ghist_new_saw_branch_taken;
	input [4:0] io_enq_bits_ghist_ras_idx;
	input [119:0] io_enq_bits_bpd_meta_0;
	output wire [3:0] io_enq_idx;
	input io_deq_valid;
	input [3:0] io_deq_bits;
	input [3:0] io_arb_ftq_reqs_0;
	input [3:0] io_arb_ftq_reqs_1;
	input [3:0] io_arb_ftq_reqs_2;
	output wire [1:0] io_rrd_ftq_resps_0_entry_cfi_idx_bits;
	output wire [3:0] io_rrd_ftq_resps_0_entry_br_mask;
	output wire io_rrd_ftq_resps_0_entry_cfi_is_call;
	output wire io_rrd_ftq_resps_0_entry_cfi_is_ret;
	output wire [4:0] io_rrd_ftq_resps_0_entry_ras_idx;
	output wire io_rrd_ftq_resps_0_entry_start_bank;
	output wire [63:0] io_rrd_ftq_resps_0_ghist_old_history;
	output wire io_rrd_ftq_resps_0_ghist_current_saw_branch_not_taken;
	output wire io_rrd_ftq_resps_0_ghist_new_saw_branch_not_taken;
	output wire io_rrd_ftq_resps_0_ghist_new_saw_branch_taken;
	output wire [4:0] io_rrd_ftq_resps_0_ghist_ras_idx;
	output wire [39:0] io_rrd_ftq_resps_0_pc;
	output wire io_rrd_ftq_resps_1_valid;
	output wire io_rrd_ftq_resps_1_entry_cfi_idx_valid;
	output wire [1:0] io_rrd_ftq_resps_1_entry_cfi_idx_bits;
	output wire io_rrd_ftq_resps_1_entry_start_bank;
	output wire [39:0] io_rrd_ftq_resps_1_pc;
	output wire io_rrd_ftq_resps_2_valid;
	output wire io_rrd_ftq_resps_2_entry_cfi_idx_valid;
	output wire [1:0] io_rrd_ftq_resps_2_entry_cfi_idx_bits;
	output wire io_rrd_ftq_resps_2_entry_start_bank;
	output wire [39:0] io_rrd_ftq_resps_2_pc;
	output wire [39:0] io_com_pc;
	input io_redirect_valid;
	input [3:0] io_redirect_bits;
	input [3:0] io_brupdate_b2_uop_ftq_idx;
	input [5:0] io_brupdate_b2_uop_pc_lob;
	input io_brupdate_b2_mispredict;
	input io_brupdate_b2_taken;
	output wire io_bpdupdate_valid;
	output wire io_bpdupdate_bits_is_mispredict_update;
	output wire io_bpdupdate_bits_is_repair_update;
	output wire [39:0] io_bpdupdate_bits_pc;
	output wire [3:0] io_bpdupdate_bits_br_mask;
	output wire io_bpdupdate_bits_cfi_idx_valid;
	output wire [1:0] io_bpdupdate_bits_cfi_idx_bits;
	output wire io_bpdupdate_bits_cfi_taken;
	output wire io_bpdupdate_bits_cfi_mispredicted;
	output wire io_bpdupdate_bits_cfi_is_br;
	output wire io_bpdupdate_bits_cfi_is_jal;
	output wire [63:0] io_bpdupdate_bits_ghist_old_history;
	output wire [39:0] io_bpdupdate_bits_target;
	output wire [119:0] io_bpdupdate_bits_meta_0;
	output wire io_ras_update;
	output wire [4:0] io_ras_update_idx;
	output wire [39:0] io_ras_update_pc;
	reg io_enq_ready_REG;
	wire [4:0] new_ghist_ras_idx;
	wire new_ghist_new_saw_branch_taken;
	wire new_ghist_new_saw_branch_not_taken;
	wire [63:0] new_ghist_old_history;
	wire [71:0] _ghist_1_ext_R0_data;
	wire [71:0] _ghist_0_ext_R0_data;
	reg [3:0] bpd_ptr;
	reg [3:0] deq_ptr;
	reg [3:0] enq_ptr;
	reg [39:0] pcs_0;
	reg [39:0] pcs_1;
	reg [39:0] pcs_2;
	reg [39:0] pcs_3;
	reg [39:0] pcs_4;
	reg [39:0] pcs_5;
	reg [39:0] pcs_6;
	reg [39:0] pcs_7;
	reg [39:0] pcs_8;
	reg [39:0] pcs_9;
	reg [39:0] pcs_10;
	reg [39:0] pcs_11;
	reg [39:0] pcs_12;
	reg [39:0] pcs_13;
	reg [39:0] pcs_14;
	reg [39:0] pcs_15;
	reg ram_0_cfi_idx_valid;
	reg [1:0] ram_0_cfi_idx_bits;
	reg ram_0_cfi_taken;
	reg ram_0_cfi_mispredicted;
	reg [2:0] ram_0_cfi_type;
	reg [3:0] ram_0_br_mask;
	reg ram_0_cfi_is_call;
	reg ram_0_cfi_is_ret;
	reg [39:0] ram_0_ras_top;
	reg [4:0] ram_0_ras_idx;
	reg ram_0_start_bank;
	reg ram_1_cfi_idx_valid;
	reg [1:0] ram_1_cfi_idx_bits;
	reg ram_1_cfi_taken;
	reg ram_1_cfi_mispredicted;
	reg [2:0] ram_1_cfi_type;
	reg [3:0] ram_1_br_mask;
	reg ram_1_cfi_is_call;
	reg ram_1_cfi_is_ret;
	reg [39:0] ram_1_ras_top;
	reg [4:0] ram_1_ras_idx;
	reg ram_1_start_bank;
	reg ram_2_cfi_idx_valid;
	reg [1:0] ram_2_cfi_idx_bits;
	reg ram_2_cfi_taken;
	reg ram_2_cfi_mispredicted;
	reg [2:0] ram_2_cfi_type;
	reg [3:0] ram_2_br_mask;
	reg ram_2_cfi_is_call;
	reg ram_2_cfi_is_ret;
	reg [39:0] ram_2_ras_top;
	reg [4:0] ram_2_ras_idx;
	reg ram_2_start_bank;
	reg ram_3_cfi_idx_valid;
	reg [1:0] ram_3_cfi_idx_bits;
	reg ram_3_cfi_taken;
	reg ram_3_cfi_mispredicted;
	reg [2:0] ram_3_cfi_type;
	reg [3:0] ram_3_br_mask;
	reg ram_3_cfi_is_call;
	reg ram_3_cfi_is_ret;
	reg [39:0] ram_3_ras_top;
	reg [4:0] ram_3_ras_idx;
	reg ram_3_start_bank;
	reg ram_4_cfi_idx_valid;
	reg [1:0] ram_4_cfi_idx_bits;
	reg ram_4_cfi_taken;
	reg ram_4_cfi_mispredicted;
	reg [2:0] ram_4_cfi_type;
	reg [3:0] ram_4_br_mask;
	reg ram_4_cfi_is_call;
	reg ram_4_cfi_is_ret;
	reg [39:0] ram_4_ras_top;
	reg [4:0] ram_4_ras_idx;
	reg ram_4_start_bank;
	reg ram_5_cfi_idx_valid;
	reg [1:0] ram_5_cfi_idx_bits;
	reg ram_5_cfi_taken;
	reg ram_5_cfi_mispredicted;
	reg [2:0] ram_5_cfi_type;
	reg [3:0] ram_5_br_mask;
	reg ram_5_cfi_is_call;
	reg ram_5_cfi_is_ret;
	reg [39:0] ram_5_ras_top;
	reg [4:0] ram_5_ras_idx;
	reg ram_5_start_bank;
	reg ram_6_cfi_idx_valid;
	reg [1:0] ram_6_cfi_idx_bits;
	reg ram_6_cfi_taken;
	reg ram_6_cfi_mispredicted;
	reg [2:0] ram_6_cfi_type;
	reg [3:0] ram_6_br_mask;
	reg ram_6_cfi_is_call;
	reg ram_6_cfi_is_ret;
	reg [39:0] ram_6_ras_top;
	reg [4:0] ram_6_ras_idx;
	reg ram_6_start_bank;
	reg ram_7_cfi_idx_valid;
	reg [1:0] ram_7_cfi_idx_bits;
	reg ram_7_cfi_taken;
	reg ram_7_cfi_mispredicted;
	reg [2:0] ram_7_cfi_type;
	reg [3:0] ram_7_br_mask;
	reg ram_7_cfi_is_call;
	reg ram_7_cfi_is_ret;
	reg [39:0] ram_7_ras_top;
	reg [4:0] ram_7_ras_idx;
	reg ram_7_start_bank;
	reg ram_8_cfi_idx_valid;
	reg [1:0] ram_8_cfi_idx_bits;
	reg ram_8_cfi_taken;
	reg ram_8_cfi_mispredicted;
	reg [2:0] ram_8_cfi_type;
	reg [3:0] ram_8_br_mask;
	reg ram_8_cfi_is_call;
	reg ram_8_cfi_is_ret;
	reg [39:0] ram_8_ras_top;
	reg [4:0] ram_8_ras_idx;
	reg ram_8_start_bank;
	reg ram_9_cfi_idx_valid;
	reg [1:0] ram_9_cfi_idx_bits;
	reg ram_9_cfi_taken;
	reg ram_9_cfi_mispredicted;
	reg [2:0] ram_9_cfi_type;
	reg [3:0] ram_9_br_mask;
	reg ram_9_cfi_is_call;
	reg ram_9_cfi_is_ret;
	reg [39:0] ram_9_ras_top;
	reg [4:0] ram_9_ras_idx;
	reg ram_9_start_bank;
	reg ram_10_cfi_idx_valid;
	reg [1:0] ram_10_cfi_idx_bits;
	reg ram_10_cfi_taken;
	reg ram_10_cfi_mispredicted;
	reg [2:0] ram_10_cfi_type;
	reg [3:0] ram_10_br_mask;
	reg ram_10_cfi_is_call;
	reg ram_10_cfi_is_ret;
	reg [39:0] ram_10_ras_top;
	reg [4:0] ram_10_ras_idx;
	reg ram_10_start_bank;
	reg ram_11_cfi_idx_valid;
	reg [1:0] ram_11_cfi_idx_bits;
	reg ram_11_cfi_taken;
	reg ram_11_cfi_mispredicted;
	reg [2:0] ram_11_cfi_type;
	reg [3:0] ram_11_br_mask;
	reg ram_11_cfi_is_call;
	reg ram_11_cfi_is_ret;
	reg [39:0] ram_11_ras_top;
	reg [4:0] ram_11_ras_idx;
	reg ram_11_start_bank;
	reg ram_12_cfi_idx_valid;
	reg [1:0] ram_12_cfi_idx_bits;
	reg ram_12_cfi_taken;
	reg ram_12_cfi_mispredicted;
	reg [2:0] ram_12_cfi_type;
	reg [3:0] ram_12_br_mask;
	reg ram_12_cfi_is_call;
	reg ram_12_cfi_is_ret;
	reg [39:0] ram_12_ras_top;
	reg [4:0] ram_12_ras_idx;
	reg ram_12_start_bank;
	reg ram_13_cfi_idx_valid;
	reg [1:0] ram_13_cfi_idx_bits;
	reg ram_13_cfi_taken;
	reg ram_13_cfi_mispredicted;
	reg [2:0] ram_13_cfi_type;
	reg [3:0] ram_13_br_mask;
	reg ram_13_cfi_is_call;
	reg ram_13_cfi_is_ret;
	reg [39:0] ram_13_ras_top;
	reg [4:0] ram_13_ras_idx;
	reg ram_13_start_bank;
	reg ram_14_cfi_idx_valid;
	reg [1:0] ram_14_cfi_idx_bits;
	reg ram_14_cfi_taken;
	reg ram_14_cfi_mispredicted;
	reg [2:0] ram_14_cfi_type;
	reg [3:0] ram_14_br_mask;
	reg ram_14_cfi_is_call;
	reg ram_14_cfi_is_ret;
	reg [39:0] ram_14_ras_top;
	reg [4:0] ram_14_ras_idx;
	reg ram_14_start_bank;
	reg ram_15_cfi_idx_valid;
	reg [1:0] ram_15_cfi_idx_bits;
	reg ram_15_cfi_taken;
	reg ram_15_cfi_mispredicted;
	reg [2:0] ram_15_cfi_type;
	reg [3:0] ram_15_br_mask;
	reg ram_15_cfi_is_call;
	reg ram_15_cfi_is_ret;
	reg [39:0] ram_15_ras_top;
	reg [4:0] ram_15_ras_idx;
	reg ram_15_start_bank;
	wire [71:0] _GEN = {new_ghist_ras_idx, new_ghist_new_saw_branch_taken, new_ghist_new_saw_branch_not_taken, io_enq_bits_ghist_current_saw_branch_not_taken, new_ghist_old_history};
	wire do_enq = io_enq_ready_REG & io_enq_valid;
	reg [63:0] prev_ghist_old_history;
	reg prev_ghist_current_saw_branch_not_taken;
	reg [4:0] prev_ghist_ras_idx;
	reg prev_entry_cfi_idx_valid;
	reg [1:0] prev_entry_cfi_idx_bits;
	reg prev_entry_cfi_taken;
	reg [3:0] prev_entry_br_mask;
	reg prev_entry_cfi_is_call;
	reg prev_entry_cfi_is_ret;
	wire [3:0] _GEN_0 = {2'h0, prev_entry_cfi_idx_bits};
	wire [3:0] _new_ghist_T = prev_entry_br_mask >> _GEN_0;
	wire [3:0] new_ghist_cfi_idx_oh = 4'h1 << _GEN_0;
	wire [2:0] _GEN_1 = new_ghist_cfi_idx_oh[2:0] | new_ghist_cfi_idx_oh[3:1];
	wire [1:0] _GEN_2 = _GEN_1[1:0] | new_ghist_cfi_idx_oh[3:2];
	wire _new_ghist_new_history_old_history_T = _new_ghist_T[0] & prev_entry_cfi_taken;
	wire [63:0] _new_ghist_new_history_old_history_T_6 = (_new_ghist_new_history_old_history_T & prev_entry_cfi_idx_valid ? {prev_ghist_old_history[62:0], 1'h1} : (|(prev_entry_br_mask & (prev_entry_cfi_idx_valid ? {&prev_entry_cfi_idx_bits, _GEN_1[2], _GEN_2[1], _GEN_2[0] | &prev_entry_cfi_idx_bits} & ~(_new_ghist_new_history_old_history_T ? new_ghist_cfi_idx_oh : 4'h0) : 4'hf)) | prev_ghist_current_saw_branch_not_taken ? {prev_ghist_old_history[62:0], 1'h0} : prev_ghist_old_history));
	wire _new_ghist_new_history_ras_idx_T = prev_entry_cfi_idx_valid & prev_entry_cfi_is_call;
	wire [4:0] _new_ghist_new_history_ras_idx_T_1 = prev_ghist_ras_idx + 5'h01;
	wire _new_ghist_new_history_ras_idx_T_4 = prev_entry_cfi_idx_valid & prev_entry_cfi_is_ret;
	wire [4:0] _new_ghist_new_history_ras_idx_T_5 = prev_ghist_ras_idx - 5'h01;
	assign new_ghist_old_history = (io_enq_bits_ghist_current_saw_branch_not_taken ? io_enq_bits_ghist_old_history : _new_ghist_new_history_old_history_T_6);
	assign new_ghist_new_saw_branch_not_taken = io_enq_bits_ghist_current_saw_branch_not_taken & io_enq_bits_ghist_new_saw_branch_not_taken;
	assign new_ghist_new_saw_branch_taken = io_enq_bits_ghist_current_saw_branch_not_taken & io_enq_bits_ghist_new_saw_branch_taken;
	assign new_ghist_ras_idx = (io_enq_bits_ghist_current_saw_branch_not_taken ? io_enq_bits_ghist_ras_idx : (_new_ghist_new_history_ras_idx_T ? _new_ghist_new_history_ras_idx_T_1 : (_new_ghist_new_history_ras_idx_T_4 ? _new_ghist_new_history_ras_idx_T_5 : prev_ghist_ras_idx)));
	reg first_empty;
	reg io_ras_update_REG;
	reg [39:0] io_ras_update_pc_REG;
	reg [4:0] io_ras_update_idx_REG;
	reg bpd_update_mispredict;
	reg bpd_update_repair;
	reg [3:0] bpd_repair_idx;
	reg [3:0] bpd_end_idx;
	reg [39:0] bpd_repair_pc;
	wire [3:0] bpd_idx = (io_redirect_valid ? io_redirect_bits : (bpd_update_repair | bpd_update_mispredict ? bpd_repair_idx : bpd_ptr));
	reg bpd_entry_cfi_idx_valid;
	reg [1:0] bpd_entry_cfi_idx_bits;
	reg bpd_entry_cfi_taken;
	reg bpd_entry_cfi_mispredicted;
	reg [2:0] bpd_entry_cfi_type;
	reg [3:0] bpd_entry_br_mask;
	reg [39:0] bpd_pc;
	reg [39:0] bpd_target;
	reg REG;
	reg [3:0] bpd_repair_idx_REG;
	reg [3:0] bpd_end_idx_REG;
	reg REG_1;
	reg do_commit_update_REG;
	reg REG_2;
	reg io_bpdupdate_valid_REG;
	reg io_bpdupdate_bits_is_mispredict_update_REG;
	reg io_bpdupdate_bits_is_repair_update_REG;
	wire [3:0] _GEN_3 = {2'h0, bpd_entry_cfi_idx_bits};
	wire [3:0] _io_bpdupdate_bits_br_mask_T_1 = 4'h1 << _GEN_3;
	wire [2:0] _GEN_4 = _io_bpdupdate_bits_br_mask_T_1[2:0] | _io_bpdupdate_bits_br_mask_T_1[3:1];
	wire [1:0] _GEN_5 = _GEN_4[1:0] | _io_bpdupdate_bits_br_mask_T_1[3:2];
	wire [3:0] _io_bpdupdate_bits_cfi_is_br_T = bpd_entry_br_mask >> _GEN_3;
	reg REG_3;
	reg prev_entry_REG_cfi_idx_valid;
	reg [1:0] prev_entry_REG_cfi_idx_bits;
	reg prev_entry_REG_cfi_taken;
	reg [3:0] prev_entry_REG_br_mask;
	reg prev_entry_REG_cfi_is_call;
	reg prev_entry_REG_cfi_is_ret;
	reg [3:0] REG_4;
	reg ram_REG_cfi_idx_valid;
	reg [1:0] ram_REG_cfi_idx_bits;
	reg ram_REG_cfi_taken;
	reg ram_REG_cfi_mispredicted;
	reg [2:0] ram_REG_cfi_type;
	reg [3:0] ram_REG_br_mask;
	reg ram_REG_cfi_is_call;
	reg ram_REG_cfi_is_ret;
	reg [39:0] ram_REG_ras_top;
	reg [4:0] ram_REG_ras_idx;
	reg ram_REG_start_bank;
	wire [3:0] idx = (reset ? 4'h0 : io_arb_ftq_reqs_0);
	reg [1:0] io_rrd_ftq_resps_0_entry_REG_cfi_idx_bits;
	reg [3:0] io_rrd_ftq_resps_0_entry_REG_br_mask;
	reg io_rrd_ftq_resps_0_entry_REG_cfi_is_call;
	reg io_rrd_ftq_resps_0_entry_REG_cfi_is_ret;
	reg [4:0] io_rrd_ftq_resps_0_entry_REG_ras_idx;
	reg io_rrd_ftq_resps_0_entry_REG_start_bank;
	reg [39:0] io_rrd_ftq_resps_0_pc_REG;
	reg io_rrd_ftq_resps_1_entry_REG_cfi_idx_valid;
	reg [1:0] io_rrd_ftq_resps_1_entry_REG_cfi_idx_bits;
	reg io_rrd_ftq_resps_1_entry_REG_start_bank;
	reg [39:0] io_rrd_ftq_resps_1_pc_REG;
	reg io_rrd_ftq_resps_1_valid_REG;
	reg io_rrd_ftq_resps_2_entry_REG_cfi_idx_valid;
	reg [1:0] io_rrd_ftq_resps_2_entry_REG_cfi_idx_bits;
	reg io_rrd_ftq_resps_2_entry_REG_start_bank;
	reg [39:0] io_rrd_ftq_resps_2_pc_REG;
	reg io_rrd_ftq_resps_2_valid_REG;
	reg [39:0] io_com_pc_REG;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg [3:0] _enq_ptr_T;
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
		reg [3:0] new_entry_br_mask;
		reg [15:0] _GEN_22;
		reg [31:0] _GEN_23;
		reg [15:0] _GEN_24;
		reg [15:0] _GEN_25;
		reg [47:0] _GEN_26;
		reg [63:0] _GEN_27;
		reg [639:0] _GEN_28;
		reg _GEN_29;
		reg [3:0] _bpd_repair_idx_T_6;
		reg [3:0] _bpd_ptr_T;
		reg do_commit_update;
		reg [15:0] _GEN_30;
		reg [15:0] _GEN_31;
		reg [639:0] _GEN_32;
		reg [79:0] _GEN_33;
		reg [15:0] _GEN_34;
		reg _GEN_35;
		reg redirect_new_entry_cfi_idx_valid;
		reg [1:0] redirect_new_entry_cfi_idx_bits;
		reg redirect_new_entry_cfi_taken;
		reg _GEN_36;
		reg redirect_new_entry_cfi_is_call;
		reg redirect_new_entry_cfi_is_ret;
		reg [3:0] idx_1;
		reg is_enq_1;
		reg [3:0] idx_2;
		reg is_enq_2;
		_GEN_35 = io_redirect_valid & io_brupdate_b2_mispredict;
		idx_1 = (reset ? 4'h0 : io_arb_ftq_reqs_1);
		idx_2 = (reset ? 4'h0 : io_arb_ftq_reqs_2);
		_enq_ptr_T = enq_ptr + 4'h1;
		_GEN_6 = do_enq & (enq_ptr == 4'h0);
		_GEN_7 = do_enq & (enq_ptr == 4'h1);
		_GEN_8 = do_enq & (enq_ptr == 4'h2);
		_GEN_9 = do_enq & (enq_ptr == 4'h3);
		_GEN_10 = do_enq & (enq_ptr == 4'h4);
		_GEN_11 = do_enq & (enq_ptr == 4'h5);
		_GEN_12 = do_enq & (enq_ptr == 4'h6);
		_GEN_13 = do_enq & (enq_ptr == 4'h7);
		_GEN_14 = do_enq & (enq_ptr == 4'h8);
		_GEN_15 = do_enq & (enq_ptr == 4'h9);
		_GEN_16 = do_enq & (enq_ptr == 4'ha);
		_GEN_17 = do_enq & (enq_ptr == 4'hb);
		_GEN_18 = do_enq & (enq_ptr == 4'hc);
		_GEN_19 = do_enq & (enq_ptr == 4'hd);
		_GEN_20 = do_enq & (enq_ptr == 4'he);
		_GEN_21 = do_enq & (&enq_ptr);
		new_entry_br_mask = io_enq_bits_br_mask & io_enq_bits_mask;
		_GEN_22 = {ram_15_cfi_idx_valid, ram_14_cfi_idx_valid, ram_13_cfi_idx_valid, ram_12_cfi_idx_valid, ram_11_cfi_idx_valid, ram_10_cfi_idx_valid, ram_9_cfi_idx_valid, ram_8_cfi_idx_valid, ram_7_cfi_idx_valid, ram_6_cfi_idx_valid, ram_5_cfi_idx_valid, ram_4_cfi_idx_valid, ram_3_cfi_idx_valid, ram_2_cfi_idx_valid, ram_1_cfi_idx_valid, ram_0_cfi_idx_valid};
		_GEN_23 = {ram_15_cfi_idx_bits, ram_14_cfi_idx_bits, ram_13_cfi_idx_bits, ram_12_cfi_idx_bits, ram_11_cfi_idx_bits, ram_10_cfi_idx_bits, ram_9_cfi_idx_bits, ram_8_cfi_idx_bits, ram_7_cfi_idx_bits, ram_6_cfi_idx_bits, ram_5_cfi_idx_bits, ram_4_cfi_idx_bits, ram_3_cfi_idx_bits, ram_2_cfi_idx_bits, ram_1_cfi_idx_bits, ram_0_cfi_idx_bits};
		_GEN_24 = {ram_15_cfi_taken, ram_14_cfi_taken, ram_13_cfi_taken, ram_12_cfi_taken, ram_11_cfi_taken, ram_10_cfi_taken, ram_9_cfi_taken, ram_8_cfi_taken, ram_7_cfi_taken, ram_6_cfi_taken, ram_5_cfi_taken, ram_4_cfi_taken, ram_3_cfi_taken, ram_2_cfi_taken, ram_1_cfi_taken, ram_0_cfi_taken};
		_GEN_25 = {ram_15_cfi_mispredicted, ram_14_cfi_mispredicted, ram_13_cfi_mispredicted, ram_12_cfi_mispredicted, ram_11_cfi_mispredicted, ram_10_cfi_mispredicted, ram_9_cfi_mispredicted, ram_8_cfi_mispredicted, ram_7_cfi_mispredicted, ram_6_cfi_mispredicted, ram_5_cfi_mispredicted, ram_4_cfi_mispredicted, ram_3_cfi_mispredicted, ram_2_cfi_mispredicted, ram_1_cfi_mispredicted, ram_0_cfi_mispredicted};
		_GEN_26 = {ram_15_cfi_type, ram_14_cfi_type, ram_13_cfi_type, ram_12_cfi_type, ram_11_cfi_type, ram_10_cfi_type, ram_9_cfi_type, ram_8_cfi_type, ram_7_cfi_type, ram_6_cfi_type, ram_5_cfi_type, ram_4_cfi_type, ram_3_cfi_type, ram_2_cfi_type, ram_1_cfi_type, ram_0_cfi_type};
		_GEN_27 = {ram_15_br_mask, ram_14_br_mask, ram_13_br_mask, ram_12_br_mask, ram_11_br_mask, ram_10_br_mask, ram_9_br_mask, ram_8_br_mask, ram_7_br_mask, ram_6_br_mask, ram_5_br_mask, ram_4_br_mask, ram_3_br_mask, ram_2_br_mask, ram_1_br_mask, ram_0_br_mask};
		_GEN_28 = {pcs_15, pcs_14, pcs_13, pcs_12, pcs_11, pcs_10, pcs_9, pcs_8, pcs_7, pcs_6, pcs_5, pcs_4, pcs_3, pcs_2, pcs_1, pcs_0};
		_GEN_29 = bpd_update_repair & REG_1;
		_bpd_repair_idx_T_6 = bpd_repair_idx + 4'h1;
		_bpd_ptr_T = bpd_ptr + 4'h1;
		do_commit_update = (((((~bpd_update_mispredict & ~bpd_update_repair) & (bpd_ptr != deq_ptr)) & (enq_ptr != _bpd_ptr_T)) & ~io_brupdate_b2_mispredict) & ~io_redirect_valid) & ~do_commit_update_REG;
		_GEN_30 = {ram_15_cfi_is_call, ram_14_cfi_is_call, ram_13_cfi_is_call, ram_12_cfi_is_call, ram_11_cfi_is_call, ram_10_cfi_is_call, ram_9_cfi_is_call, ram_8_cfi_is_call, ram_7_cfi_is_call, ram_6_cfi_is_call, ram_5_cfi_is_call, ram_4_cfi_is_call, ram_3_cfi_is_call, ram_2_cfi_is_call, ram_1_cfi_is_call, ram_0_cfi_is_call};
		_GEN_31 = {ram_15_cfi_is_ret, ram_14_cfi_is_ret, ram_13_cfi_is_ret, ram_12_cfi_is_ret, ram_11_cfi_is_ret, ram_10_cfi_is_ret, ram_9_cfi_is_ret, ram_8_cfi_is_ret, ram_7_cfi_is_ret, ram_6_cfi_is_ret, ram_5_cfi_is_ret, ram_4_cfi_is_ret, ram_3_cfi_is_ret, ram_2_cfi_is_ret, ram_1_cfi_is_ret, ram_0_cfi_is_ret};
		_GEN_32 = {ram_15_ras_top, ram_14_ras_top, ram_13_ras_top, ram_12_ras_top, ram_11_ras_top, ram_10_ras_top, ram_9_ras_top, ram_8_ras_top, ram_7_ras_top, ram_6_ras_top, ram_5_ras_top, ram_4_ras_top, ram_3_ras_top, ram_2_ras_top, ram_1_ras_top, ram_0_ras_top};
		_GEN_33 = {ram_15_ras_idx, ram_14_ras_idx, ram_13_ras_idx, ram_12_ras_idx, ram_11_ras_idx, ram_10_ras_idx, ram_9_ras_idx, ram_8_ras_idx, ram_7_ras_idx, ram_6_ras_idx, ram_5_ras_idx, ram_4_ras_idx, ram_3_ras_idx, ram_2_ras_idx, ram_1_ras_idx, ram_0_ras_idx};
		_GEN_34 = {ram_15_start_bank, ram_14_start_bank, ram_13_start_bank, ram_12_start_bank, ram_11_start_bank, ram_10_start_bank, ram_9_start_bank, ram_8_start_bank, ram_7_start_bank, ram_6_start_bank, ram_5_start_bank, ram_4_start_bank, ram_3_start_bank, ram_2_start_bank, ram_1_start_bank, ram_0_start_bank};
		redirect_new_entry_cfi_idx_valid = _GEN_35 | _GEN_22[io_redirect_bits];
		redirect_new_entry_cfi_idx_bits = (_GEN_35 ? io_brupdate_b2_uop_pc_lob[2:1] : _GEN_23[io_redirect_bits * 2+:2]);
		redirect_new_entry_cfi_taken = (_GEN_35 ? io_brupdate_b2_taken : _GEN_24[io_redirect_bits]);
		_GEN_36 = ~_GEN_35 | (_GEN_23[io_redirect_bits * 2+:2] == io_brupdate_b2_uop_pc_lob[2:1]);
		redirect_new_entry_cfi_is_call = _GEN_36 & _GEN_30[io_redirect_bits];
		redirect_new_entry_cfi_is_ret = _GEN_36 & _GEN_31[io_redirect_bits];
		is_enq_1 = (idx_1 == enq_ptr) & do_enq;
		is_enq_2 = (idx_2 == enq_ptr) & do_enq;
		if (reset) begin
			bpd_ptr <= 4'h0;
			deq_ptr <= 4'h0;
			enq_ptr <= 4'h1;
			prev_ghist_old_history <= 64'h0000000000000000;
			prev_ghist_current_saw_branch_not_taken <= 1'h0;
			prev_ghist_ras_idx <= 5'h00;
			prev_entry_cfi_idx_valid <= 1'h0;
			prev_entry_cfi_idx_bits <= 2'h0;
			prev_entry_cfi_taken <= 1'h0;
			prev_entry_br_mask <= 4'h0;
			prev_entry_cfi_is_call <= 1'h0;
			prev_entry_cfi_is_ret <= 1'h0;
			first_empty <= 1'h1;
			bpd_update_mispredict <= 1'h0;
			bpd_update_repair <= 1'h0;
		end
		else begin
			if (do_commit_update)
				bpd_ptr <= _bpd_ptr_T;
			if (io_deq_valid)
				deq_ptr <= io_deq_bits;
			if (io_redirect_valid)
				enq_ptr <= io_redirect_bits + 4'h1;
			else if (do_enq)
				enq_ptr <= _enq_ptr_T;
			if (io_redirect_valid | ~REG_3) begin
				if (do_enq) begin
					if (io_enq_bits_ghist_current_saw_branch_not_taken)
						prev_ghist_old_history <= io_enq_bits_ghist_old_history;
					else
						prev_ghist_old_history <= _new_ghist_new_history_old_history_T_6;
					prev_ghist_current_saw_branch_not_taken <= io_enq_bits_ghist_current_saw_branch_not_taken;
					if (io_enq_bits_ghist_current_saw_branch_not_taken)
						prev_ghist_ras_idx <= io_enq_bits_ghist_ras_idx;
					else if (_new_ghist_new_history_ras_idx_T)
						prev_ghist_ras_idx <= _new_ghist_new_history_ras_idx_T_1;
					else if (_new_ghist_new_history_ras_idx_T_4)
						prev_ghist_ras_idx <= _new_ghist_new_history_ras_idx_T_5;
					prev_entry_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
					prev_entry_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
					prev_entry_cfi_taken <= io_enq_bits_cfi_idx_valid;
					prev_entry_br_mask <= new_entry_br_mask;
					prev_entry_cfi_is_call <= io_enq_bits_cfi_is_call;
					prev_entry_cfi_is_ret <= io_enq_bits_cfi_is_ret;
				end
			end
			else begin
				prev_ghist_old_history <= _ghist_0_ext_R0_data[63:0];
				prev_ghist_current_saw_branch_not_taken <= _ghist_0_ext_R0_data[64];
				prev_ghist_ras_idx <= _ghist_0_ext_R0_data[71:67];
				prev_entry_cfi_idx_valid <= prev_entry_REG_cfi_idx_valid;
				prev_entry_cfi_idx_bits <= prev_entry_REG_cfi_idx_bits;
				prev_entry_cfi_taken <= prev_entry_REG_cfi_taken;
				prev_entry_br_mask <= prev_entry_REG_br_mask;
				prev_entry_cfi_is_call <= prev_entry_REG_cfi_is_call;
				prev_entry_cfi_is_ret <= prev_entry_REG_cfi_is_ret;
			end
			first_empty <= ~REG_2 & first_empty;
			bpd_update_mispredict <= ~io_redirect_valid & REG;
			bpd_update_repair <= ~io_redirect_valid & (REG ? bpd_update_repair : bpd_update_mispredict | ((_GEN_29 | ~(bpd_update_repair & ((_bpd_repair_idx_T_6 == bpd_end_idx) | (bpd_pc == bpd_repair_pc)))) & bpd_update_repair));
		end
		if (_GEN_6)
			pcs_0 <= io_enq_bits_pc;
		if (_GEN_7)
			pcs_1 <= io_enq_bits_pc;
		if (_GEN_8)
			pcs_2 <= io_enq_bits_pc;
		if (_GEN_9)
			pcs_3 <= io_enq_bits_pc;
		if (_GEN_10)
			pcs_4 <= io_enq_bits_pc;
		if (_GEN_11)
			pcs_5 <= io_enq_bits_pc;
		if (_GEN_12)
			pcs_6 <= io_enq_bits_pc;
		if (_GEN_13)
			pcs_7 <= io_enq_bits_pc;
		if (_GEN_14)
			pcs_8 <= io_enq_bits_pc;
		if (_GEN_15)
			pcs_9 <= io_enq_bits_pc;
		if (_GEN_16)
			pcs_10 <= io_enq_bits_pc;
		if (_GEN_17)
			pcs_11 <= io_enq_bits_pc;
		if (_GEN_18)
			pcs_12 <= io_enq_bits_pc;
		if (_GEN_19)
			pcs_13 <= io_enq_bits_pc;
		if (_GEN_20)
			pcs_14 <= io_enq_bits_pc;
		if (_GEN_21)
			pcs_15 <= io_enq_bits_pc;
		if (io_redirect_valid | ~(REG_3 & (REG_4 == 4'h0))) begin
			if (_GEN_6) begin
				ram_0_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
				ram_0_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
				ram_0_cfi_taken <= io_enq_bits_cfi_idx_valid;
			end
			ram_0_cfi_mispredicted <= ~_GEN_6 & ram_0_cfi_mispredicted;
			if (_GEN_6) begin
				ram_0_cfi_type <= io_enq_bits_cfi_type;
				ram_0_br_mask <= new_entry_br_mask;
				ram_0_cfi_is_call <= io_enq_bits_cfi_is_call;
				ram_0_cfi_is_ret <= io_enq_bits_cfi_is_ret;
				ram_0_ras_top <= io_enq_bits_ras_top;
				ram_0_ras_idx <= io_enq_bits_ghist_ras_idx;
			end
			ram_0_start_bank <= ~_GEN_6 & ram_0_start_bank;
		end
		else begin
			ram_0_cfi_idx_valid <= ram_REG_cfi_idx_valid;
			ram_0_cfi_idx_bits <= ram_REG_cfi_idx_bits;
			ram_0_cfi_taken <= ram_REG_cfi_taken;
			ram_0_cfi_mispredicted <= ram_REG_cfi_mispredicted;
			ram_0_cfi_type <= ram_REG_cfi_type;
			ram_0_br_mask <= ram_REG_br_mask;
			ram_0_cfi_is_call <= ram_REG_cfi_is_call;
			ram_0_cfi_is_ret <= ram_REG_cfi_is_ret;
			ram_0_ras_top <= ram_REG_ras_top;
			ram_0_ras_idx <= ram_REG_ras_idx;
			ram_0_start_bank <= ram_REG_start_bank;
		end
		if (io_redirect_valid | ~(REG_3 & (REG_4 == 4'h1))) begin
			if (_GEN_7) begin
				ram_1_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
				ram_1_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
				ram_1_cfi_taken <= io_enq_bits_cfi_idx_valid;
			end
			ram_1_cfi_mispredicted <= ~_GEN_7 & ram_1_cfi_mispredicted;
			if (_GEN_7) begin
				ram_1_cfi_type <= io_enq_bits_cfi_type;
				ram_1_br_mask <= new_entry_br_mask;
				ram_1_cfi_is_call <= io_enq_bits_cfi_is_call;
				ram_1_cfi_is_ret <= io_enq_bits_cfi_is_ret;
				ram_1_ras_top <= io_enq_bits_ras_top;
				ram_1_ras_idx <= io_enq_bits_ghist_ras_idx;
			end
			ram_1_start_bank <= ~_GEN_7 & ram_1_start_bank;
		end
		else begin
			ram_1_cfi_idx_valid <= ram_REG_cfi_idx_valid;
			ram_1_cfi_idx_bits <= ram_REG_cfi_idx_bits;
			ram_1_cfi_taken <= ram_REG_cfi_taken;
			ram_1_cfi_mispredicted <= ram_REG_cfi_mispredicted;
			ram_1_cfi_type <= ram_REG_cfi_type;
			ram_1_br_mask <= ram_REG_br_mask;
			ram_1_cfi_is_call <= ram_REG_cfi_is_call;
			ram_1_cfi_is_ret <= ram_REG_cfi_is_ret;
			ram_1_ras_top <= ram_REG_ras_top;
			ram_1_ras_idx <= ram_REG_ras_idx;
			ram_1_start_bank <= ram_REG_start_bank;
		end
		if (io_redirect_valid | ~(REG_3 & (REG_4 == 4'h2))) begin
			if (_GEN_8) begin
				ram_2_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
				ram_2_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
				ram_2_cfi_taken <= io_enq_bits_cfi_idx_valid;
			end
			ram_2_cfi_mispredicted <= ~_GEN_8 & ram_2_cfi_mispredicted;
			if (_GEN_8) begin
				ram_2_cfi_type <= io_enq_bits_cfi_type;
				ram_2_br_mask <= new_entry_br_mask;
				ram_2_cfi_is_call <= io_enq_bits_cfi_is_call;
				ram_2_cfi_is_ret <= io_enq_bits_cfi_is_ret;
				ram_2_ras_top <= io_enq_bits_ras_top;
				ram_2_ras_idx <= io_enq_bits_ghist_ras_idx;
			end
			ram_2_start_bank <= ~_GEN_8 & ram_2_start_bank;
		end
		else begin
			ram_2_cfi_idx_valid <= ram_REG_cfi_idx_valid;
			ram_2_cfi_idx_bits <= ram_REG_cfi_idx_bits;
			ram_2_cfi_taken <= ram_REG_cfi_taken;
			ram_2_cfi_mispredicted <= ram_REG_cfi_mispredicted;
			ram_2_cfi_type <= ram_REG_cfi_type;
			ram_2_br_mask <= ram_REG_br_mask;
			ram_2_cfi_is_call <= ram_REG_cfi_is_call;
			ram_2_cfi_is_ret <= ram_REG_cfi_is_ret;
			ram_2_ras_top <= ram_REG_ras_top;
			ram_2_ras_idx <= ram_REG_ras_idx;
			ram_2_start_bank <= ram_REG_start_bank;
		end
		if (io_redirect_valid | ~(REG_3 & (REG_4 == 4'h3))) begin
			if (_GEN_9) begin
				ram_3_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
				ram_3_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
				ram_3_cfi_taken <= io_enq_bits_cfi_idx_valid;
			end
			ram_3_cfi_mispredicted <= ~_GEN_9 & ram_3_cfi_mispredicted;
			if (_GEN_9) begin
				ram_3_cfi_type <= io_enq_bits_cfi_type;
				ram_3_br_mask <= new_entry_br_mask;
				ram_3_cfi_is_call <= io_enq_bits_cfi_is_call;
				ram_3_cfi_is_ret <= io_enq_bits_cfi_is_ret;
				ram_3_ras_top <= io_enq_bits_ras_top;
				ram_3_ras_idx <= io_enq_bits_ghist_ras_idx;
			end
			ram_3_start_bank <= ~_GEN_9 & ram_3_start_bank;
		end
		else begin
			ram_3_cfi_idx_valid <= ram_REG_cfi_idx_valid;
			ram_3_cfi_idx_bits <= ram_REG_cfi_idx_bits;
			ram_3_cfi_taken <= ram_REG_cfi_taken;
			ram_3_cfi_mispredicted <= ram_REG_cfi_mispredicted;
			ram_3_cfi_type <= ram_REG_cfi_type;
			ram_3_br_mask <= ram_REG_br_mask;
			ram_3_cfi_is_call <= ram_REG_cfi_is_call;
			ram_3_cfi_is_ret <= ram_REG_cfi_is_ret;
			ram_3_ras_top <= ram_REG_ras_top;
			ram_3_ras_idx <= ram_REG_ras_idx;
			ram_3_start_bank <= ram_REG_start_bank;
		end
		if (io_redirect_valid | ~(REG_3 & (REG_4 == 4'h4))) begin
			if (_GEN_10) begin
				ram_4_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
				ram_4_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
				ram_4_cfi_taken <= io_enq_bits_cfi_idx_valid;
			end
			ram_4_cfi_mispredicted <= ~_GEN_10 & ram_4_cfi_mispredicted;
			if (_GEN_10) begin
				ram_4_cfi_type <= io_enq_bits_cfi_type;
				ram_4_br_mask <= new_entry_br_mask;
				ram_4_cfi_is_call <= io_enq_bits_cfi_is_call;
				ram_4_cfi_is_ret <= io_enq_bits_cfi_is_ret;
				ram_4_ras_top <= io_enq_bits_ras_top;
				ram_4_ras_idx <= io_enq_bits_ghist_ras_idx;
			end
			ram_4_start_bank <= ~_GEN_10 & ram_4_start_bank;
		end
		else begin
			ram_4_cfi_idx_valid <= ram_REG_cfi_idx_valid;
			ram_4_cfi_idx_bits <= ram_REG_cfi_idx_bits;
			ram_4_cfi_taken <= ram_REG_cfi_taken;
			ram_4_cfi_mispredicted <= ram_REG_cfi_mispredicted;
			ram_4_cfi_type <= ram_REG_cfi_type;
			ram_4_br_mask <= ram_REG_br_mask;
			ram_4_cfi_is_call <= ram_REG_cfi_is_call;
			ram_4_cfi_is_ret <= ram_REG_cfi_is_ret;
			ram_4_ras_top <= ram_REG_ras_top;
			ram_4_ras_idx <= ram_REG_ras_idx;
			ram_4_start_bank <= ram_REG_start_bank;
		end
		if (io_redirect_valid | ~(REG_3 & (REG_4 == 4'h5))) begin
			if (_GEN_11) begin
				ram_5_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
				ram_5_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
				ram_5_cfi_taken <= io_enq_bits_cfi_idx_valid;
			end
			ram_5_cfi_mispredicted <= ~_GEN_11 & ram_5_cfi_mispredicted;
			if (_GEN_11) begin
				ram_5_cfi_type <= io_enq_bits_cfi_type;
				ram_5_br_mask <= new_entry_br_mask;
				ram_5_cfi_is_call <= io_enq_bits_cfi_is_call;
				ram_5_cfi_is_ret <= io_enq_bits_cfi_is_ret;
				ram_5_ras_top <= io_enq_bits_ras_top;
				ram_5_ras_idx <= io_enq_bits_ghist_ras_idx;
			end
			ram_5_start_bank <= ~_GEN_11 & ram_5_start_bank;
		end
		else begin
			ram_5_cfi_idx_valid <= ram_REG_cfi_idx_valid;
			ram_5_cfi_idx_bits <= ram_REG_cfi_idx_bits;
			ram_5_cfi_taken <= ram_REG_cfi_taken;
			ram_5_cfi_mispredicted <= ram_REG_cfi_mispredicted;
			ram_5_cfi_type <= ram_REG_cfi_type;
			ram_5_br_mask <= ram_REG_br_mask;
			ram_5_cfi_is_call <= ram_REG_cfi_is_call;
			ram_5_cfi_is_ret <= ram_REG_cfi_is_ret;
			ram_5_ras_top <= ram_REG_ras_top;
			ram_5_ras_idx <= ram_REG_ras_idx;
			ram_5_start_bank <= ram_REG_start_bank;
		end
		if (io_redirect_valid | ~(REG_3 & (REG_4 == 4'h6))) begin
			if (_GEN_12) begin
				ram_6_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
				ram_6_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
				ram_6_cfi_taken <= io_enq_bits_cfi_idx_valid;
			end
			ram_6_cfi_mispredicted <= ~_GEN_12 & ram_6_cfi_mispredicted;
			if (_GEN_12) begin
				ram_6_cfi_type <= io_enq_bits_cfi_type;
				ram_6_br_mask <= new_entry_br_mask;
				ram_6_cfi_is_call <= io_enq_bits_cfi_is_call;
				ram_6_cfi_is_ret <= io_enq_bits_cfi_is_ret;
				ram_6_ras_top <= io_enq_bits_ras_top;
				ram_6_ras_idx <= io_enq_bits_ghist_ras_idx;
			end
			ram_6_start_bank <= ~_GEN_12 & ram_6_start_bank;
		end
		else begin
			ram_6_cfi_idx_valid <= ram_REG_cfi_idx_valid;
			ram_6_cfi_idx_bits <= ram_REG_cfi_idx_bits;
			ram_6_cfi_taken <= ram_REG_cfi_taken;
			ram_6_cfi_mispredicted <= ram_REG_cfi_mispredicted;
			ram_6_cfi_type <= ram_REG_cfi_type;
			ram_6_br_mask <= ram_REG_br_mask;
			ram_6_cfi_is_call <= ram_REG_cfi_is_call;
			ram_6_cfi_is_ret <= ram_REG_cfi_is_ret;
			ram_6_ras_top <= ram_REG_ras_top;
			ram_6_ras_idx <= ram_REG_ras_idx;
			ram_6_start_bank <= ram_REG_start_bank;
		end
		if (io_redirect_valid | ~(REG_3 & (REG_4 == 4'h7))) begin
			if (_GEN_13) begin
				ram_7_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
				ram_7_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
				ram_7_cfi_taken <= io_enq_bits_cfi_idx_valid;
			end
			ram_7_cfi_mispredicted <= ~_GEN_13 & ram_7_cfi_mispredicted;
			if (_GEN_13) begin
				ram_7_cfi_type <= io_enq_bits_cfi_type;
				ram_7_br_mask <= new_entry_br_mask;
				ram_7_cfi_is_call <= io_enq_bits_cfi_is_call;
				ram_7_cfi_is_ret <= io_enq_bits_cfi_is_ret;
				ram_7_ras_top <= io_enq_bits_ras_top;
				ram_7_ras_idx <= io_enq_bits_ghist_ras_idx;
			end
			ram_7_start_bank <= ~_GEN_13 & ram_7_start_bank;
		end
		else begin
			ram_7_cfi_idx_valid <= ram_REG_cfi_idx_valid;
			ram_7_cfi_idx_bits <= ram_REG_cfi_idx_bits;
			ram_7_cfi_taken <= ram_REG_cfi_taken;
			ram_7_cfi_mispredicted <= ram_REG_cfi_mispredicted;
			ram_7_cfi_type <= ram_REG_cfi_type;
			ram_7_br_mask <= ram_REG_br_mask;
			ram_7_cfi_is_call <= ram_REG_cfi_is_call;
			ram_7_cfi_is_ret <= ram_REG_cfi_is_ret;
			ram_7_ras_top <= ram_REG_ras_top;
			ram_7_ras_idx <= ram_REG_ras_idx;
			ram_7_start_bank <= ram_REG_start_bank;
		end
		if (io_redirect_valid | ~(REG_3 & (REG_4 == 4'h8))) begin
			if (_GEN_14) begin
				ram_8_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
				ram_8_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
				ram_8_cfi_taken <= io_enq_bits_cfi_idx_valid;
			end
			ram_8_cfi_mispredicted <= ~_GEN_14 & ram_8_cfi_mispredicted;
			if (_GEN_14) begin
				ram_8_cfi_type <= io_enq_bits_cfi_type;
				ram_8_br_mask <= new_entry_br_mask;
				ram_8_cfi_is_call <= io_enq_bits_cfi_is_call;
				ram_8_cfi_is_ret <= io_enq_bits_cfi_is_ret;
				ram_8_ras_top <= io_enq_bits_ras_top;
				ram_8_ras_idx <= io_enq_bits_ghist_ras_idx;
			end
			ram_8_start_bank <= ~_GEN_14 & ram_8_start_bank;
		end
		else begin
			ram_8_cfi_idx_valid <= ram_REG_cfi_idx_valid;
			ram_8_cfi_idx_bits <= ram_REG_cfi_idx_bits;
			ram_8_cfi_taken <= ram_REG_cfi_taken;
			ram_8_cfi_mispredicted <= ram_REG_cfi_mispredicted;
			ram_8_cfi_type <= ram_REG_cfi_type;
			ram_8_br_mask <= ram_REG_br_mask;
			ram_8_cfi_is_call <= ram_REG_cfi_is_call;
			ram_8_cfi_is_ret <= ram_REG_cfi_is_ret;
			ram_8_ras_top <= ram_REG_ras_top;
			ram_8_ras_idx <= ram_REG_ras_idx;
			ram_8_start_bank <= ram_REG_start_bank;
		end
		if (io_redirect_valid | ~(REG_3 & (REG_4 == 4'h9))) begin
			if (_GEN_15) begin
				ram_9_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
				ram_9_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
				ram_9_cfi_taken <= io_enq_bits_cfi_idx_valid;
			end
			ram_9_cfi_mispredicted <= ~_GEN_15 & ram_9_cfi_mispredicted;
			if (_GEN_15) begin
				ram_9_cfi_type <= io_enq_bits_cfi_type;
				ram_9_br_mask <= new_entry_br_mask;
				ram_9_cfi_is_call <= io_enq_bits_cfi_is_call;
				ram_9_cfi_is_ret <= io_enq_bits_cfi_is_ret;
				ram_9_ras_top <= io_enq_bits_ras_top;
				ram_9_ras_idx <= io_enq_bits_ghist_ras_idx;
			end
			ram_9_start_bank <= ~_GEN_15 & ram_9_start_bank;
		end
		else begin
			ram_9_cfi_idx_valid <= ram_REG_cfi_idx_valid;
			ram_9_cfi_idx_bits <= ram_REG_cfi_idx_bits;
			ram_9_cfi_taken <= ram_REG_cfi_taken;
			ram_9_cfi_mispredicted <= ram_REG_cfi_mispredicted;
			ram_9_cfi_type <= ram_REG_cfi_type;
			ram_9_br_mask <= ram_REG_br_mask;
			ram_9_cfi_is_call <= ram_REG_cfi_is_call;
			ram_9_cfi_is_ret <= ram_REG_cfi_is_ret;
			ram_9_ras_top <= ram_REG_ras_top;
			ram_9_ras_idx <= ram_REG_ras_idx;
			ram_9_start_bank <= ram_REG_start_bank;
		end
		if (io_redirect_valid | ~(REG_3 & (REG_4 == 4'ha))) begin
			if (_GEN_16) begin
				ram_10_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
				ram_10_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
				ram_10_cfi_taken <= io_enq_bits_cfi_idx_valid;
			end
			ram_10_cfi_mispredicted <= ~_GEN_16 & ram_10_cfi_mispredicted;
			if (_GEN_16) begin
				ram_10_cfi_type <= io_enq_bits_cfi_type;
				ram_10_br_mask <= new_entry_br_mask;
				ram_10_cfi_is_call <= io_enq_bits_cfi_is_call;
				ram_10_cfi_is_ret <= io_enq_bits_cfi_is_ret;
				ram_10_ras_top <= io_enq_bits_ras_top;
				ram_10_ras_idx <= io_enq_bits_ghist_ras_idx;
			end
			ram_10_start_bank <= ~_GEN_16 & ram_10_start_bank;
		end
		else begin
			ram_10_cfi_idx_valid <= ram_REG_cfi_idx_valid;
			ram_10_cfi_idx_bits <= ram_REG_cfi_idx_bits;
			ram_10_cfi_taken <= ram_REG_cfi_taken;
			ram_10_cfi_mispredicted <= ram_REG_cfi_mispredicted;
			ram_10_cfi_type <= ram_REG_cfi_type;
			ram_10_br_mask <= ram_REG_br_mask;
			ram_10_cfi_is_call <= ram_REG_cfi_is_call;
			ram_10_cfi_is_ret <= ram_REG_cfi_is_ret;
			ram_10_ras_top <= ram_REG_ras_top;
			ram_10_ras_idx <= ram_REG_ras_idx;
			ram_10_start_bank <= ram_REG_start_bank;
		end
		if (io_redirect_valid | ~(REG_3 & (REG_4 == 4'hb))) begin
			if (_GEN_17) begin
				ram_11_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
				ram_11_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
				ram_11_cfi_taken <= io_enq_bits_cfi_idx_valid;
			end
			ram_11_cfi_mispredicted <= ~_GEN_17 & ram_11_cfi_mispredicted;
			if (_GEN_17) begin
				ram_11_cfi_type <= io_enq_bits_cfi_type;
				ram_11_br_mask <= new_entry_br_mask;
				ram_11_cfi_is_call <= io_enq_bits_cfi_is_call;
				ram_11_cfi_is_ret <= io_enq_bits_cfi_is_ret;
				ram_11_ras_top <= io_enq_bits_ras_top;
				ram_11_ras_idx <= io_enq_bits_ghist_ras_idx;
			end
			ram_11_start_bank <= ~_GEN_17 & ram_11_start_bank;
		end
		else begin
			ram_11_cfi_idx_valid <= ram_REG_cfi_idx_valid;
			ram_11_cfi_idx_bits <= ram_REG_cfi_idx_bits;
			ram_11_cfi_taken <= ram_REG_cfi_taken;
			ram_11_cfi_mispredicted <= ram_REG_cfi_mispredicted;
			ram_11_cfi_type <= ram_REG_cfi_type;
			ram_11_br_mask <= ram_REG_br_mask;
			ram_11_cfi_is_call <= ram_REG_cfi_is_call;
			ram_11_cfi_is_ret <= ram_REG_cfi_is_ret;
			ram_11_ras_top <= ram_REG_ras_top;
			ram_11_ras_idx <= ram_REG_ras_idx;
			ram_11_start_bank <= ram_REG_start_bank;
		end
		if (io_redirect_valid | ~(REG_3 & (REG_4 == 4'hc))) begin
			if (_GEN_18) begin
				ram_12_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
				ram_12_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
				ram_12_cfi_taken <= io_enq_bits_cfi_idx_valid;
			end
			ram_12_cfi_mispredicted <= ~_GEN_18 & ram_12_cfi_mispredicted;
			if (_GEN_18) begin
				ram_12_cfi_type <= io_enq_bits_cfi_type;
				ram_12_br_mask <= new_entry_br_mask;
				ram_12_cfi_is_call <= io_enq_bits_cfi_is_call;
				ram_12_cfi_is_ret <= io_enq_bits_cfi_is_ret;
				ram_12_ras_top <= io_enq_bits_ras_top;
				ram_12_ras_idx <= io_enq_bits_ghist_ras_idx;
			end
			ram_12_start_bank <= ~_GEN_18 & ram_12_start_bank;
		end
		else begin
			ram_12_cfi_idx_valid <= ram_REG_cfi_idx_valid;
			ram_12_cfi_idx_bits <= ram_REG_cfi_idx_bits;
			ram_12_cfi_taken <= ram_REG_cfi_taken;
			ram_12_cfi_mispredicted <= ram_REG_cfi_mispredicted;
			ram_12_cfi_type <= ram_REG_cfi_type;
			ram_12_br_mask <= ram_REG_br_mask;
			ram_12_cfi_is_call <= ram_REG_cfi_is_call;
			ram_12_cfi_is_ret <= ram_REG_cfi_is_ret;
			ram_12_ras_top <= ram_REG_ras_top;
			ram_12_ras_idx <= ram_REG_ras_idx;
			ram_12_start_bank <= ram_REG_start_bank;
		end
		if (io_redirect_valid | ~(REG_3 & (REG_4 == 4'hd))) begin
			if (_GEN_19) begin
				ram_13_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
				ram_13_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
				ram_13_cfi_taken <= io_enq_bits_cfi_idx_valid;
			end
			ram_13_cfi_mispredicted <= ~_GEN_19 & ram_13_cfi_mispredicted;
			if (_GEN_19) begin
				ram_13_cfi_type <= io_enq_bits_cfi_type;
				ram_13_br_mask <= new_entry_br_mask;
				ram_13_cfi_is_call <= io_enq_bits_cfi_is_call;
				ram_13_cfi_is_ret <= io_enq_bits_cfi_is_ret;
				ram_13_ras_top <= io_enq_bits_ras_top;
				ram_13_ras_idx <= io_enq_bits_ghist_ras_idx;
			end
			ram_13_start_bank <= ~_GEN_19 & ram_13_start_bank;
		end
		else begin
			ram_13_cfi_idx_valid <= ram_REG_cfi_idx_valid;
			ram_13_cfi_idx_bits <= ram_REG_cfi_idx_bits;
			ram_13_cfi_taken <= ram_REG_cfi_taken;
			ram_13_cfi_mispredicted <= ram_REG_cfi_mispredicted;
			ram_13_cfi_type <= ram_REG_cfi_type;
			ram_13_br_mask <= ram_REG_br_mask;
			ram_13_cfi_is_call <= ram_REG_cfi_is_call;
			ram_13_cfi_is_ret <= ram_REG_cfi_is_ret;
			ram_13_ras_top <= ram_REG_ras_top;
			ram_13_ras_idx <= ram_REG_ras_idx;
			ram_13_start_bank <= ram_REG_start_bank;
		end
		if (io_redirect_valid | ~(REG_3 & (REG_4 == 4'he))) begin
			if (_GEN_20) begin
				ram_14_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
				ram_14_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
				ram_14_cfi_taken <= io_enq_bits_cfi_idx_valid;
			end
			ram_14_cfi_mispredicted <= ~_GEN_20 & ram_14_cfi_mispredicted;
			if (_GEN_20) begin
				ram_14_cfi_type <= io_enq_bits_cfi_type;
				ram_14_br_mask <= new_entry_br_mask;
				ram_14_cfi_is_call <= io_enq_bits_cfi_is_call;
				ram_14_cfi_is_ret <= io_enq_bits_cfi_is_ret;
				ram_14_ras_top <= io_enq_bits_ras_top;
				ram_14_ras_idx <= io_enq_bits_ghist_ras_idx;
			end
			ram_14_start_bank <= ~_GEN_20 & ram_14_start_bank;
		end
		else begin
			ram_14_cfi_idx_valid <= ram_REG_cfi_idx_valid;
			ram_14_cfi_idx_bits <= ram_REG_cfi_idx_bits;
			ram_14_cfi_taken <= ram_REG_cfi_taken;
			ram_14_cfi_mispredicted <= ram_REG_cfi_mispredicted;
			ram_14_cfi_type <= ram_REG_cfi_type;
			ram_14_br_mask <= ram_REG_br_mask;
			ram_14_cfi_is_call <= ram_REG_cfi_is_call;
			ram_14_cfi_is_ret <= ram_REG_cfi_is_ret;
			ram_14_ras_top <= ram_REG_ras_top;
			ram_14_ras_idx <= ram_REG_ras_idx;
			ram_14_start_bank <= ram_REG_start_bank;
		end
		if (io_redirect_valid | ~(REG_3 & (&REG_4))) begin
			if (_GEN_21) begin
				ram_15_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
				ram_15_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
				ram_15_cfi_taken <= io_enq_bits_cfi_idx_valid;
			end
			ram_15_cfi_mispredicted <= ~_GEN_21 & ram_15_cfi_mispredicted;
			if (_GEN_21) begin
				ram_15_cfi_type <= io_enq_bits_cfi_type;
				ram_15_br_mask <= new_entry_br_mask;
				ram_15_cfi_is_call <= io_enq_bits_cfi_is_call;
				ram_15_cfi_is_ret <= io_enq_bits_cfi_is_ret;
				ram_15_ras_top <= io_enq_bits_ras_top;
				ram_15_ras_idx <= io_enq_bits_ghist_ras_idx;
			end
			ram_15_start_bank <= ~_GEN_21 & ram_15_start_bank;
		end
		else begin
			ram_15_cfi_idx_valid <= ram_REG_cfi_idx_valid;
			ram_15_cfi_idx_bits <= ram_REG_cfi_idx_bits;
			ram_15_cfi_taken <= ram_REG_cfi_taken;
			ram_15_cfi_mispredicted <= ram_REG_cfi_mispredicted;
			ram_15_cfi_type <= ram_REG_cfi_type;
			ram_15_br_mask <= ram_REG_br_mask;
			ram_15_cfi_is_call <= ram_REG_cfi_is_call;
			ram_15_cfi_is_ret <= ram_REG_cfi_is_ret;
			ram_15_ras_top <= ram_REG_ras_top;
			ram_15_ras_idx <= ram_REG_ras_idx;
			ram_15_start_bank <= ram_REG_start_bank;
		end
		io_ras_update_REG <= io_redirect_valid;
		io_ras_update_pc_REG <= (io_redirect_valid ? _GEN_32[io_redirect_bits * 40+:40] : 40'h0000000000);
		io_ras_update_idx_REG <= (io_redirect_valid ? _GEN_33[io_redirect_bits * 5+:5] : 5'h00);
		if (io_redirect_valid)
			;
		else if (REG)
			bpd_repair_idx <= bpd_repair_idx_REG;
		else if (bpd_update_mispredict)
			bpd_repair_idx <= bpd_repair_idx + 4'h1;
		else if (_GEN_29)
			bpd_repair_idx <= bpd_repair_idx + 4'h1;
		else if (bpd_update_repair)
			bpd_repair_idx <= _bpd_repair_idx_T_6;
		if (io_redirect_valid | ~REG)
			;
		else
			bpd_end_idx <= bpd_end_idx_REG;
		if (((io_redirect_valid | REG) | bpd_update_mispredict) | ~_GEN_29)
			;
		else
			bpd_repair_pc <= bpd_pc;
		bpd_entry_cfi_idx_valid <= _GEN_22[bpd_idx];
		bpd_entry_cfi_idx_bits <= _GEN_23[bpd_idx * 2+:2];
		bpd_entry_cfi_taken <= _GEN_24[bpd_idx];
		bpd_entry_cfi_mispredicted <= _GEN_25[bpd_idx];
		bpd_entry_cfi_type <= _GEN_26[bpd_idx * 3+:3];
		bpd_entry_br_mask <= _GEN_27[bpd_idx * 4+:4];
		bpd_pc <= _GEN_28[bpd_idx * 40+:40];
		bpd_target <= _GEN_28[(bpd_idx + 4'h1) * 40+:40];
		REG <= io_brupdate_b2_mispredict;
		bpd_repair_idx_REG <= io_brupdate_b2_uop_ftq_idx;
		bpd_end_idx_REG <= enq_ptr;
		REG_1 <= bpd_update_mispredict;
		do_commit_update_REG <= io_redirect_valid;
		REG_2 <= (do_commit_update | bpd_update_repair) | bpd_update_mispredict;
		io_bpdupdate_valid_REG <= bpd_update_repair;
		io_bpdupdate_bits_is_mispredict_update_REG <= bpd_update_mispredict;
		io_bpdupdate_bits_is_repair_update_REG <= bpd_update_repair;
		io_enq_ready_REG <= ~(((enq_ptr + 4'h2) == bpd_ptr) | (_enq_ptr_T == bpd_ptr)) | do_commit_update;
		REG_3 <= io_redirect_valid;
		prev_entry_REG_cfi_idx_valid <= redirect_new_entry_cfi_idx_valid;
		prev_entry_REG_cfi_idx_bits <= redirect_new_entry_cfi_idx_bits;
		prev_entry_REG_cfi_taken <= redirect_new_entry_cfi_taken;
		prev_entry_REG_br_mask <= _GEN_27[io_redirect_bits * 4+:4];
		prev_entry_REG_cfi_is_call <= redirect_new_entry_cfi_is_call;
		prev_entry_REG_cfi_is_ret <= redirect_new_entry_cfi_is_ret;
		REG_4 <= io_redirect_bits;
		ram_REG_cfi_idx_valid <= redirect_new_entry_cfi_idx_valid;
		ram_REG_cfi_idx_bits <= redirect_new_entry_cfi_idx_bits;
		ram_REG_cfi_taken <= redirect_new_entry_cfi_taken;
		ram_REG_cfi_mispredicted <= _GEN_35 | _GEN_25[io_redirect_bits];
		ram_REG_cfi_type <= _GEN_26[io_redirect_bits * 3+:3];
		ram_REG_br_mask <= _GEN_27[io_redirect_bits * 4+:4];
		ram_REG_cfi_is_call <= redirect_new_entry_cfi_is_call;
		ram_REG_cfi_is_ret <= redirect_new_entry_cfi_is_ret;
		ram_REG_ras_top <= _GEN_32[io_redirect_bits * 40+:40];
		ram_REG_ras_idx <= _GEN_33[io_redirect_bits * 5+:5];
		ram_REG_start_bank <= _GEN_34[io_redirect_bits];
		io_rrd_ftq_resps_0_entry_REG_cfi_idx_bits <= _GEN_23[idx * 2+:2];
		io_rrd_ftq_resps_0_entry_REG_br_mask <= _GEN_27[idx * 4+:4];
		io_rrd_ftq_resps_0_entry_REG_cfi_is_call <= _GEN_30[idx];
		io_rrd_ftq_resps_0_entry_REG_cfi_is_ret <= _GEN_31[idx];
		io_rrd_ftq_resps_0_entry_REG_ras_idx <= _GEN_33[idx * 5+:5];
		io_rrd_ftq_resps_0_entry_REG_start_bank <= _GEN_34[idx];
		io_rrd_ftq_resps_0_pc_REG <= ((idx == enq_ptr) & do_enq ? io_enq_bits_pc : _GEN_28[idx * 40+:40]);
		io_rrd_ftq_resps_1_entry_REG_cfi_idx_valid <= _GEN_22[idx_1];
		io_rrd_ftq_resps_1_entry_REG_cfi_idx_bits <= _GEN_23[idx_1 * 2+:2];
		io_rrd_ftq_resps_1_entry_REG_start_bank <= _GEN_34[idx_1];
		io_rrd_ftq_resps_1_pc_REG <= (is_enq_1 ? io_enq_bits_pc : _GEN_28[idx_1 * 40+:40]);
		io_rrd_ftq_resps_1_valid_REG <= (idx_1 != enq_ptr) | is_enq_1;
		io_rrd_ftq_resps_2_entry_REG_cfi_idx_valid <= _GEN_22[idx_2];
		io_rrd_ftq_resps_2_entry_REG_cfi_idx_bits <= _GEN_23[idx_2 * 2+:2];
		io_rrd_ftq_resps_2_entry_REG_start_bank <= _GEN_34[idx_2];
		io_rrd_ftq_resps_2_pc_REG <= (is_enq_2 ? io_enq_bits_pc : _GEN_28[idx_2 * 40+:40]);
		io_rrd_ftq_resps_2_valid_REG <= (idx_2 != enq_ptr) | is_enq_2;
		io_com_pc_REG <= _GEN_28[(io_deq_valid ? io_deq_bits : deq_ptr) * 40+:40];
	end
	meta_0_16x120 meta_0_ext(
		.R0_addr(bpd_idx),
		.R0_en(1'h1),
		.R0_clk(clock),
		.R0_data(io_bpdupdate_bits_meta_0),
		.W0_addr(enq_ptr),
		.W0_en(do_enq),
		.W0_clk(clock),
		.W0_data(io_enq_bits_bpd_meta_0)
	);
	ghist_16x72 ghist_0_ext(
		.R0_addr(bpd_idx),
		.R0_en(1'h1),
		.R0_clk(clock),
		.R0_data(_ghist_0_ext_R0_data),
		.W0_addr(enq_ptr),
		.W0_en(do_enq),
		.W0_clk(clock),
		.W0_data(_GEN)
	);
	ghist_16x72 ghist_1_ext(
		.R0_addr(idx),
		.R0_en(1'h1),
		.R0_clk(clock),
		.R0_data(_ghist_1_ext_R0_data),
		.W0_addr(enq_ptr),
		.W0_en(do_enq),
		.W0_clk(clock),
		.W0_data(_GEN)
	);
	assign io_enq_ready = io_enq_ready_REG;
	assign io_enq_idx = enq_ptr;
	assign io_rrd_ftq_resps_0_entry_cfi_idx_bits = io_rrd_ftq_resps_0_entry_REG_cfi_idx_bits;
	assign io_rrd_ftq_resps_0_entry_br_mask = io_rrd_ftq_resps_0_entry_REG_br_mask;
	assign io_rrd_ftq_resps_0_entry_cfi_is_call = io_rrd_ftq_resps_0_entry_REG_cfi_is_call;
	assign io_rrd_ftq_resps_0_entry_cfi_is_ret = io_rrd_ftq_resps_0_entry_REG_cfi_is_ret;
	assign io_rrd_ftq_resps_0_entry_ras_idx = io_rrd_ftq_resps_0_entry_REG_ras_idx;
	assign io_rrd_ftq_resps_0_entry_start_bank = io_rrd_ftq_resps_0_entry_REG_start_bank;
	assign io_rrd_ftq_resps_0_ghist_old_history = _ghist_1_ext_R0_data[63:0];
	assign io_rrd_ftq_resps_0_ghist_current_saw_branch_not_taken = _ghist_1_ext_R0_data[64];
	assign io_rrd_ftq_resps_0_ghist_new_saw_branch_not_taken = _ghist_1_ext_R0_data[65];
	assign io_rrd_ftq_resps_0_ghist_new_saw_branch_taken = _ghist_1_ext_R0_data[66];
	assign io_rrd_ftq_resps_0_ghist_ras_idx = _ghist_1_ext_R0_data[71:67];
	assign io_rrd_ftq_resps_0_pc = io_rrd_ftq_resps_0_pc_REG;
	assign io_rrd_ftq_resps_1_valid = io_rrd_ftq_resps_1_valid_REG;
	assign io_rrd_ftq_resps_1_entry_cfi_idx_valid = io_rrd_ftq_resps_1_entry_REG_cfi_idx_valid;
	assign io_rrd_ftq_resps_1_entry_cfi_idx_bits = io_rrd_ftq_resps_1_entry_REG_cfi_idx_bits;
	assign io_rrd_ftq_resps_1_entry_start_bank = io_rrd_ftq_resps_1_entry_REG_start_bank;
	assign io_rrd_ftq_resps_1_pc = io_rrd_ftq_resps_1_pc_REG;
	assign io_rrd_ftq_resps_2_valid = io_rrd_ftq_resps_2_valid_REG;
	assign io_rrd_ftq_resps_2_entry_cfi_idx_valid = io_rrd_ftq_resps_2_entry_REG_cfi_idx_valid;
	assign io_rrd_ftq_resps_2_entry_cfi_idx_bits = io_rrd_ftq_resps_2_entry_REG_cfi_idx_bits;
	assign io_rrd_ftq_resps_2_entry_start_bank = io_rrd_ftq_resps_2_entry_REG_start_bank;
	assign io_rrd_ftq_resps_2_pc = io_rrd_ftq_resps_2_pc_REG;
	assign io_com_pc = io_com_pc_REG;
	assign io_bpdupdate_valid = ((REG_2 & ~first_empty) & (bpd_entry_cfi_idx_valid | (|bpd_entry_br_mask))) & ~(io_bpdupdate_valid_REG & (bpd_pc == bpd_repair_pc));
	assign io_bpdupdate_bits_is_mispredict_update = io_bpdupdate_bits_is_mispredict_update_REG;
	assign io_bpdupdate_bits_is_repair_update = io_bpdupdate_bits_is_repair_update_REG;
	assign io_bpdupdate_bits_pc = bpd_pc;
	assign io_bpdupdate_bits_br_mask = ({4 {~bpd_entry_cfi_idx_valid}} | {&bpd_entry_cfi_idx_bits, _GEN_4[2], _GEN_5[1], _GEN_5[0] | &bpd_entry_cfi_idx_bits}) & bpd_entry_br_mask;
	assign io_bpdupdate_bits_cfi_idx_valid = bpd_entry_cfi_idx_valid;
	assign io_bpdupdate_bits_cfi_idx_bits = bpd_entry_cfi_idx_bits;
	assign io_bpdupdate_bits_cfi_taken = bpd_entry_cfi_taken;
	assign io_bpdupdate_bits_cfi_mispredicted = bpd_entry_cfi_mispredicted;
	assign io_bpdupdate_bits_cfi_is_br = _io_bpdupdate_bits_cfi_is_br_T[0];
	assign io_bpdupdate_bits_cfi_is_jal = (bpd_entry_cfi_type == 3'h2) | (bpd_entry_cfi_type == 3'h3);
	assign io_bpdupdate_bits_ghist_old_history = _ghist_0_ext_R0_data[63:0];
	assign io_bpdupdate_bits_target = bpd_target;
	assign io_ras_update = io_ras_update_REG;
	assign io_ras_update_idx = io_ras_update_idx_REG;
	assign io_ras_update_pc = io_ras_update_pc_REG;
endmodule
