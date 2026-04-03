module TageBranchPredictorBank (
	clock,
	reset,
	io_f0_valid,
	io_f0_pc,
	io_f1_ghist,
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
	io_resp_in_0_f2_0_predicted_pc_valid,
	io_resp_in_0_f2_0_predicted_pc_bits,
	io_resp_in_0_f2_1_taken,
	io_resp_in_0_f2_1_is_br,
	io_resp_in_0_f2_1_predicted_pc_valid,
	io_resp_in_0_f2_1_predicted_pc_bits,
	io_resp_in_0_f2_2_taken,
	io_resp_in_0_f2_2_is_br,
	io_resp_in_0_f2_2_predicted_pc_valid,
	io_resp_in_0_f2_2_predicted_pc_bits,
	io_resp_in_0_f2_3_taken,
	io_resp_in_0_f2_3_is_br,
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
	io_update_bits_cfi_mispredicted,
	io_update_bits_ghist,
	io_update_bits_meta
);
	input clock;
	input reset;
	input io_f0_valid;
	input [39:0] io_f0_pc;
	input [63:0] io_f1_ghist;
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
	input io_resp_in_0_f2_0_predicted_pc_valid;
	input [39:0] io_resp_in_0_f2_0_predicted_pc_bits;
	input io_resp_in_0_f2_1_taken;
	input io_resp_in_0_f2_1_is_br;
	input io_resp_in_0_f2_1_predicted_pc_valid;
	input [39:0] io_resp_in_0_f2_1_predicted_pc_bits;
	input io_resp_in_0_f2_2_taken;
	input io_resp_in_0_f2_2_is_br;
	input io_resp_in_0_f2_2_predicted_pc_valid;
	input [39:0] io_resp_in_0_f2_2_predicted_pc_bits;
	input io_resp_in_0_f2_3_taken;
	input io_resp_in_0_f2_3_is_br;
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
	input io_update_bits_cfi_mispredicted;
	input [63:0] io_update_bits_ghist;
	input [119:0] io_update_bits_meta;
	wire _alloc_lfsr_prng_3_io_out_0;
	wire _alloc_lfsr_prng_3_io_out_1;
	wire _alloc_lfsr_prng_3_io_out_2;
	wire _alloc_lfsr_prng_3_io_out_3;
	wire _alloc_lfsr_prng_3_io_out_4;
	wire _alloc_lfsr_prng_3_io_out_5;
	wire _alloc_lfsr_prng_2_io_out_0;
	wire _alloc_lfsr_prng_2_io_out_1;
	wire _alloc_lfsr_prng_2_io_out_2;
	wire _alloc_lfsr_prng_2_io_out_3;
	wire _alloc_lfsr_prng_2_io_out_4;
	wire _alloc_lfsr_prng_2_io_out_5;
	wire _alloc_lfsr_prng_1_io_out_0;
	wire _alloc_lfsr_prng_1_io_out_1;
	wire _alloc_lfsr_prng_1_io_out_2;
	wire _alloc_lfsr_prng_1_io_out_3;
	wire _alloc_lfsr_prng_1_io_out_4;
	wire _alloc_lfsr_prng_1_io_out_5;
	wire _alloc_lfsr_prng_io_out_0;
	wire _alloc_lfsr_prng_io_out_1;
	wire _alloc_lfsr_prng_io_out_2;
	wire _alloc_lfsr_prng_io_out_3;
	wire _alloc_lfsr_prng_io_out_4;
	wire _alloc_lfsr_prng_io_out_5;
	wire _tt_5_1_io_f2_resp_0_valid;
	wire [2:0] _tt_5_1_io_f2_resp_0_bits_ctr;
	wire [1:0] _tt_5_1_io_f2_resp_0_bits_u;
	wire _tt_5_1_io_f2_resp_1_valid;
	wire [2:0] _tt_5_1_io_f2_resp_1_bits_ctr;
	wire [1:0] _tt_5_1_io_f2_resp_1_bits_u;
	wire _tt_5_1_io_f2_resp_2_valid;
	wire [2:0] _tt_5_1_io_f2_resp_2_bits_ctr;
	wire [1:0] _tt_5_1_io_f2_resp_2_bits_u;
	wire _tt_5_1_io_f2_resp_3_valid;
	wire [2:0] _tt_5_1_io_f2_resp_3_bits_ctr;
	wire [1:0] _tt_5_1_io_f2_resp_3_bits_u;
	wire _tt_4_1_io_f2_resp_0_valid;
	wire [2:0] _tt_4_1_io_f2_resp_0_bits_ctr;
	wire [1:0] _tt_4_1_io_f2_resp_0_bits_u;
	wire _tt_4_1_io_f2_resp_1_valid;
	wire [2:0] _tt_4_1_io_f2_resp_1_bits_ctr;
	wire [1:0] _tt_4_1_io_f2_resp_1_bits_u;
	wire _tt_4_1_io_f2_resp_2_valid;
	wire [2:0] _tt_4_1_io_f2_resp_2_bits_ctr;
	wire [1:0] _tt_4_1_io_f2_resp_2_bits_u;
	wire _tt_4_1_io_f2_resp_3_valid;
	wire [2:0] _tt_4_1_io_f2_resp_3_bits_ctr;
	wire [1:0] _tt_4_1_io_f2_resp_3_bits_u;
	wire _tt_3_1_io_f2_resp_0_valid;
	wire [2:0] _tt_3_1_io_f2_resp_0_bits_ctr;
	wire [1:0] _tt_3_1_io_f2_resp_0_bits_u;
	wire _tt_3_1_io_f2_resp_1_valid;
	wire [2:0] _tt_3_1_io_f2_resp_1_bits_ctr;
	wire [1:0] _tt_3_1_io_f2_resp_1_bits_u;
	wire _tt_3_1_io_f2_resp_2_valid;
	wire [2:0] _tt_3_1_io_f2_resp_2_bits_ctr;
	wire [1:0] _tt_3_1_io_f2_resp_2_bits_u;
	wire _tt_3_1_io_f2_resp_3_valid;
	wire [2:0] _tt_3_1_io_f2_resp_3_bits_ctr;
	wire [1:0] _tt_3_1_io_f2_resp_3_bits_u;
	wire _tt_2_1_io_f2_resp_0_valid;
	wire [2:0] _tt_2_1_io_f2_resp_0_bits_ctr;
	wire [1:0] _tt_2_1_io_f2_resp_0_bits_u;
	wire _tt_2_1_io_f2_resp_1_valid;
	wire [2:0] _tt_2_1_io_f2_resp_1_bits_ctr;
	wire [1:0] _tt_2_1_io_f2_resp_1_bits_u;
	wire _tt_2_1_io_f2_resp_2_valid;
	wire [2:0] _tt_2_1_io_f2_resp_2_bits_ctr;
	wire [1:0] _tt_2_1_io_f2_resp_2_bits_u;
	wire _tt_2_1_io_f2_resp_3_valid;
	wire [2:0] _tt_2_1_io_f2_resp_3_bits_ctr;
	wire [1:0] _tt_2_1_io_f2_resp_3_bits_u;
	wire _tt_1_1_io_f2_resp_0_valid;
	wire [2:0] _tt_1_1_io_f2_resp_0_bits_ctr;
	wire [1:0] _tt_1_1_io_f2_resp_0_bits_u;
	wire _tt_1_1_io_f2_resp_1_valid;
	wire [2:0] _tt_1_1_io_f2_resp_1_bits_ctr;
	wire [1:0] _tt_1_1_io_f2_resp_1_bits_u;
	wire _tt_1_1_io_f2_resp_2_valid;
	wire [2:0] _tt_1_1_io_f2_resp_2_bits_ctr;
	wire [1:0] _tt_1_1_io_f2_resp_2_bits_u;
	wire _tt_1_1_io_f2_resp_3_valid;
	wire [2:0] _tt_1_1_io_f2_resp_3_bits_ctr;
	wire [1:0] _tt_1_1_io_f2_resp_3_bits_u;
	wire _tt_0_1_io_f2_resp_0_valid;
	wire [2:0] _tt_0_1_io_f2_resp_0_bits_ctr;
	wire [1:0] _tt_0_1_io_f2_resp_0_bits_u;
	wire _tt_0_1_io_f2_resp_1_valid;
	wire [2:0] _tt_0_1_io_f2_resp_1_bits_ctr;
	wire [1:0] _tt_0_1_io_f2_resp_1_bits_u;
	wire _tt_0_1_io_f2_resp_2_valid;
	wire [2:0] _tt_0_1_io_f2_resp_2_bits_ctr;
	wire [1:0] _tt_0_1_io_f2_resp_2_bits_u;
	wire _tt_0_1_io_f2_resp_3_valid;
	wire [2:0] _tt_0_1_io_f2_resp_3_bits_ctr;
	wire [1:0] _tt_0_1_io_f2_resp_3_bits_u;
	reg s1_update_valid;
	reg s1_update_bits_is_mispredict_update;
	reg s1_update_bits_is_repair_update;
	reg [3:0] s1_update_bits_btb_mispredicts;
	reg [39:0] s1_update_bits_pc;
	reg [3:0] s1_update_bits_br_mask;
	reg s1_update_bits_cfi_idx_valid;
	reg [1:0] s1_update_bits_cfi_idx_bits;
	reg s1_update_bits_cfi_taken;
	reg s1_update_bits_cfi_mispredicted;
	reg [63:0] s1_update_bits_ghist;
	reg [119:0] s1_update_bits_meta;
	reg t_io_f1_req_valid_REG;
	reg [39:0] t_io_f1_req_pc_REG;
	reg t_io_f1_req_valid_REG_1;
	reg [39:0] t_io_f1_req_pc_REG_1;
	reg t_io_f1_req_valid_REG_2;
	reg [39:0] t_io_f1_req_pc_REG_2;
	reg t_io_f1_req_valid_REG_3;
	reg [39:0] t_io_f1_req_pc_REG_3;
	reg t_io_f1_req_valid_REG_4;
	reg [39:0] t_io_f1_req_pc_REG_4;
	reg t_io_f1_req_valid_REG_5;
	reg [39:0] t_io_f1_req_pc_REG_5;
	reg f3_resps_0_0_valid;
	reg [1:0] f3_resps_0_0_bits_u;
	reg f3_resps_0_1_valid;
	reg [1:0] f3_resps_0_1_bits_u;
	reg f3_resps_0_2_valid;
	reg [1:0] f3_resps_0_2_bits_u;
	reg f3_resps_0_3_valid;
	reg [1:0] f3_resps_0_3_bits_u;
	reg f3_resps_1_0_valid;
	reg [1:0] f3_resps_1_0_bits_u;
	reg f3_resps_1_1_valid;
	reg [1:0] f3_resps_1_1_bits_u;
	reg f3_resps_1_2_valid;
	reg [1:0] f3_resps_1_2_bits_u;
	reg f3_resps_1_3_valid;
	reg [1:0] f3_resps_1_3_bits_u;
	reg f3_resps_2_0_valid;
	reg [1:0] f3_resps_2_0_bits_u;
	reg f3_resps_2_1_valid;
	reg [1:0] f3_resps_2_1_bits_u;
	reg f3_resps_2_2_valid;
	reg [1:0] f3_resps_2_2_bits_u;
	reg f3_resps_2_3_valid;
	reg [1:0] f3_resps_2_3_bits_u;
	reg f3_resps_3_0_valid;
	reg [1:0] f3_resps_3_0_bits_u;
	reg f3_resps_3_1_valid;
	reg [1:0] f3_resps_3_1_bits_u;
	reg f3_resps_3_2_valid;
	reg [1:0] f3_resps_3_2_bits_u;
	reg f3_resps_3_3_valid;
	reg [1:0] f3_resps_3_3_bits_u;
	reg f3_resps_4_0_valid;
	reg [1:0] f3_resps_4_0_bits_u;
	reg f3_resps_4_1_valid;
	reg [1:0] f3_resps_4_1_bits_u;
	reg f3_resps_4_2_valid;
	reg [1:0] f3_resps_4_2_bits_u;
	reg f3_resps_4_3_valid;
	reg [1:0] f3_resps_4_3_bits_u;
	reg f3_resps_5_0_valid;
	reg [1:0] f3_resps_5_0_bits_u;
	reg f3_resps_5_1_valid;
	reg [1:0] f3_resps_5_1_bits_u;
	reg f3_resps_5_2_valid;
	reg [1:0] f3_resps_5_2_bits_u;
	reg f3_resps_5_3_valid;
	reg [1:0] f3_resps_5_3_bits_u;
	reg s3_provided;
	reg [2:0] s3_provider;
	reg s3_alt_provided;
	reg [2:0] prov_ctr;
	reg [1:0] prov_u;
	reg [2:0] alt_ctr;
	wire io_resp_f3_0_taken_0 = (s3_provided ? ((prov_ctr == 3'h3) | (prov_ctr == 3'h4) ? (s3_alt_provided ? alt_ctr[2] : io_resp_in_0_f3_0_taken) : prov_ctr[2]) : io_resp_in_0_f3_0_taken);
	wire [7:0] _allocatable_slots_T_20 = 8'h01 << s3_provider;
	wire [5:0] _GEN = (_allocatable_slots_T_20[5:0] | _allocatable_slots_T_20[6:1]) | _allocatable_slots_T_20[7:2];
	wire [4:0] _GEN_0 = _GEN[4:0] | _allocatable_slots_T_20[7:3];
	wire [3:0] _GEN_1 = _GEN_0[3:0] | _allocatable_slots_T_20[7:4];
	wire [2:0] _GEN_2 = _GEN_1[2:0] | _allocatable_slots_T_20[7:5];
	wire [1:0] _GEN_3 = _GEN_2[1:0] | _allocatable_slots_T_20[7:6];
	wire [5:0] _GEN_4 = ~({_GEN[5], _GEN_0[4], _GEN_1[3], _GEN_2[2], _GEN_3[1], _GEN_3[0] | &s3_provider} & {6 {s3_provided}}) & {~f3_resps_5_0_valid & (f3_resps_5_0_bits_u == 2'h0), ~f3_resps_4_0_valid & (f3_resps_4_0_bits_u == 2'h0), ~f3_resps_3_0_valid & (f3_resps_3_0_bits_u == 2'h0), ~f3_resps_2_0_valid & (f3_resps_2_0_bits_u == 2'h0), ~f3_resps_1_0_valid & (f3_resps_1_0_bits_u == 2'h0), ~f3_resps_0_0_valid & (f3_resps_0_0_bits_u == 2'h0)};
	wire [5:0] _GEN_5 = _GEN_4 & {_alloc_lfsr_prng_io_out_5, _alloc_lfsr_prng_io_out_4, _alloc_lfsr_prng_io_out_3, _alloc_lfsr_prng_io_out_2, _alloc_lfsr_prng_io_out_1, _alloc_lfsr_prng_io_out_0};
	wire [2:0] masked_entry = (_GEN_5[0] ? 3'h0 : (_GEN_5[1] ? 3'h1 : (_GEN_5[2] ? 3'h2 : (_GEN_5[3] ? 3'h3 : (_GEN_5[4] ? 3'h4 : {1'h1, ~_GEN_5[5], 1'h1})))));
	wire [7:0] _alloc_entry_T = {2'h0, _GEN_4} >> masked_entry;
	reg s3_provided_1;
	reg [2:0] s3_provider_1;
	reg s3_alt_provided_1;
	reg [2:0] prov_1_ctr;
	reg [1:0] prov_1_u;
	reg [2:0] alt_1_ctr;
	wire io_resp_f3_1_taken_0 = (s3_provided_1 ? ((prov_1_ctr == 3'h3) | (prov_1_ctr == 3'h4) ? (s3_alt_provided_1 ? alt_1_ctr[2] : io_resp_in_0_f3_1_taken) : prov_1_ctr[2]) : io_resp_in_0_f3_1_taken);
	wire [7:0] _allocatable_slots_T_58 = 8'h01 << s3_provider_1;
	wire [5:0] _GEN_6 = (_allocatable_slots_T_58[5:0] | _allocatable_slots_T_58[6:1]) | _allocatable_slots_T_58[7:2];
	wire [4:0] _GEN_7 = _GEN_6[4:0] | _allocatable_slots_T_58[7:3];
	wire [3:0] _GEN_8 = _GEN_7[3:0] | _allocatable_slots_T_58[7:4];
	wire [2:0] _GEN_9 = _GEN_8[2:0] | _allocatable_slots_T_58[7:5];
	wire [1:0] _GEN_10 = _GEN_9[1:0] | _allocatable_slots_T_58[7:6];
	wire [5:0] _GEN_11 = ~({_GEN_6[5], _GEN_7[4], _GEN_8[3], _GEN_9[2], _GEN_10[1], _GEN_10[0] | &s3_provider_1} & {6 {s3_provided_1}}) & {~f3_resps_5_1_valid & (f3_resps_5_1_bits_u == 2'h0), ~f3_resps_4_1_valid & (f3_resps_4_1_bits_u == 2'h0), ~f3_resps_3_1_valid & (f3_resps_3_1_bits_u == 2'h0), ~f3_resps_2_1_valid & (f3_resps_2_1_bits_u == 2'h0), ~f3_resps_1_1_valid & (f3_resps_1_1_bits_u == 2'h0), ~f3_resps_0_1_valid & (f3_resps_0_1_bits_u == 2'h0)};
	wire [5:0] _GEN_12 = _GEN_11 & {_alloc_lfsr_prng_1_io_out_5, _alloc_lfsr_prng_1_io_out_4, _alloc_lfsr_prng_1_io_out_3, _alloc_lfsr_prng_1_io_out_2, _alloc_lfsr_prng_1_io_out_1, _alloc_lfsr_prng_1_io_out_0};
	wire [2:0] masked_entry_1 = (_GEN_12[0] ? 3'h0 : (_GEN_12[1] ? 3'h1 : (_GEN_12[2] ? 3'h2 : (_GEN_12[3] ? 3'h3 : (_GEN_12[4] ? 3'h4 : {1'h1, ~_GEN_12[5], 1'h1})))));
	wire [7:0] _alloc_entry_T_2 = {2'h0, _GEN_11} >> masked_entry_1;
	reg s3_provided_2;
	reg [2:0] s3_provider_2;
	reg s3_alt_provided_2;
	reg [2:0] prov_2_ctr;
	reg [1:0] prov_2_u;
	reg [2:0] alt_2_ctr;
	wire io_resp_f3_2_taken_0 = (s3_provided_2 ? ((prov_2_ctr == 3'h3) | (prov_2_ctr == 3'h4) ? (s3_alt_provided_2 ? alt_2_ctr[2] : io_resp_in_0_f3_2_taken) : prov_2_ctr[2]) : io_resp_in_0_f3_2_taken);
	wire [7:0] _allocatable_slots_T_96 = 8'h01 << s3_provider_2;
	wire [5:0] _GEN_13 = (_allocatable_slots_T_96[5:0] | _allocatable_slots_T_96[6:1]) | _allocatable_slots_T_96[7:2];
	wire [4:0] _GEN_14 = _GEN_13[4:0] | _allocatable_slots_T_96[7:3];
	wire [3:0] _GEN_15 = _GEN_14[3:0] | _allocatable_slots_T_96[7:4];
	wire [2:0] _GEN_16 = _GEN_15[2:0] | _allocatable_slots_T_96[7:5];
	wire [1:0] _GEN_17 = _GEN_16[1:0] | _allocatable_slots_T_96[7:6];
	wire [5:0] _GEN_18 = ~({_GEN_13[5], _GEN_14[4], _GEN_15[3], _GEN_16[2], _GEN_17[1], _GEN_17[0] | &s3_provider_2} & {6 {s3_provided_2}}) & {~f3_resps_5_2_valid & (f3_resps_5_2_bits_u == 2'h0), ~f3_resps_4_2_valid & (f3_resps_4_2_bits_u == 2'h0), ~f3_resps_3_2_valid & (f3_resps_3_2_bits_u == 2'h0), ~f3_resps_2_2_valid & (f3_resps_2_2_bits_u == 2'h0), ~f3_resps_1_2_valid & (f3_resps_1_2_bits_u == 2'h0), ~f3_resps_0_2_valid & (f3_resps_0_2_bits_u == 2'h0)};
	wire [5:0] _GEN_19 = _GEN_18 & {_alloc_lfsr_prng_2_io_out_5, _alloc_lfsr_prng_2_io_out_4, _alloc_lfsr_prng_2_io_out_3, _alloc_lfsr_prng_2_io_out_2, _alloc_lfsr_prng_2_io_out_1, _alloc_lfsr_prng_2_io_out_0};
	wire [2:0] masked_entry_2 = (_GEN_19[0] ? 3'h0 : (_GEN_19[1] ? 3'h1 : (_GEN_19[2] ? 3'h2 : (_GEN_19[3] ? 3'h3 : (_GEN_19[4] ? 3'h4 : {1'h1, ~_GEN_19[5], 1'h1})))));
	wire [7:0] _alloc_entry_T_4 = {2'h0, _GEN_18} >> masked_entry_2;
	reg s3_provided_3;
	reg [2:0] s3_provider_3;
	reg s3_alt_provided_3;
	reg [2:0] prov_3_ctr;
	reg [1:0] prov_3_u;
	reg [2:0] alt_3_ctr;
	wire io_resp_f3_3_taken_0 = (s3_provided_3 ? ((prov_3_ctr == 3'h3) | (prov_3_ctr == 3'h4) ? (s3_alt_provided_3 ? alt_3_ctr[2] : io_resp_in_0_f3_3_taken) : prov_3_ctr[2]) : io_resp_in_0_f3_3_taken);
	wire [7:0] _allocatable_slots_T_134 = 8'h01 << s3_provider_3;
	wire [5:0] _GEN_20 = (_allocatable_slots_T_134[5:0] | _allocatable_slots_T_134[6:1]) | _allocatable_slots_T_134[7:2];
	wire [4:0] _GEN_21 = _GEN_20[4:0] | _allocatable_slots_T_134[7:3];
	wire [3:0] _GEN_22 = _GEN_21[3:0] | _allocatable_slots_T_134[7:4];
	wire [2:0] _GEN_23 = _GEN_22[2:0] | _allocatable_slots_T_134[7:5];
	wire [1:0] _GEN_24 = _GEN_23[1:0] | _allocatable_slots_T_134[7:6];
	wire [5:0] _GEN_25 = ~({_GEN_20[5], _GEN_21[4], _GEN_22[3], _GEN_23[2], _GEN_24[1], _GEN_24[0] | &s3_provider_3} & {6 {s3_provided_3}}) & {~f3_resps_5_3_valid & (f3_resps_5_3_bits_u == 2'h0), ~f3_resps_4_3_valid & (f3_resps_4_3_bits_u == 2'h0), ~f3_resps_3_3_valid & (f3_resps_3_3_bits_u == 2'h0), ~f3_resps_2_3_valid & (f3_resps_2_3_bits_u == 2'h0), ~f3_resps_1_3_valid & (f3_resps_1_3_bits_u == 2'h0), ~f3_resps_0_3_valid & (f3_resps_0_3_bits_u == 2'h0)};
	wire [5:0] _GEN_26 = _GEN_25 & {_alloc_lfsr_prng_3_io_out_5, _alloc_lfsr_prng_3_io_out_4, _alloc_lfsr_prng_3_io_out_3, _alloc_lfsr_prng_3_io_out_2, _alloc_lfsr_prng_3_io_out_1, _alloc_lfsr_prng_3_io_out_0};
	wire [2:0] masked_entry_3 = (_GEN_26[0] ? 3'h0 : (_GEN_26[1] ? 3'h1 : (_GEN_26[2] ? 3'h2 : (_GEN_26[3] ? 3'h3 : (_GEN_26[4] ? 3'h4 : {1'h1, ~_GEN_26[5], 1'h1})))));
	wire [7:0] _alloc_entry_T_6 = {2'h0, _GEN_25} >> masked_entry_3;
	reg tt_0_1_io_update_mask_0_REG;
	reg tt_0_1_io_update_taken_0_REG;
	reg tt_0_1_io_update_alloc_0_REG;
	reg [2:0] tt_0_1_io_update_old_ctr_0_REG;
	reg tt_0_1_io_update_u_mask_0_REG;
	reg [1:0] tt_0_1_io_update_u_0_REG;
	reg tt_0_1_io_update_mask_1_REG;
	reg tt_0_1_io_update_taken_1_REG;
	reg tt_0_1_io_update_alloc_1_REG;
	reg [2:0] tt_0_1_io_update_old_ctr_1_REG;
	reg tt_0_1_io_update_u_mask_1_REG;
	reg [1:0] tt_0_1_io_update_u_1_REG;
	reg tt_0_1_io_update_mask_2_REG;
	reg tt_0_1_io_update_taken_2_REG;
	reg tt_0_1_io_update_alloc_2_REG;
	reg [2:0] tt_0_1_io_update_old_ctr_2_REG;
	reg tt_0_1_io_update_u_mask_2_REG;
	reg [1:0] tt_0_1_io_update_u_2_REG;
	reg tt_0_1_io_update_mask_3_REG;
	reg tt_0_1_io_update_taken_3_REG;
	reg tt_0_1_io_update_alloc_3_REG;
	reg [2:0] tt_0_1_io_update_old_ctr_3_REG;
	reg tt_0_1_io_update_u_mask_3_REG;
	reg [1:0] tt_0_1_io_update_u_3_REG;
	reg [39:0] tt_0_1_io_update_pc_REG;
	reg [63:0] tt_0_1_io_update_hist_REG;
	reg tt_1_1_io_update_mask_0_REG;
	reg tt_1_1_io_update_taken_0_REG;
	reg tt_1_1_io_update_alloc_0_REG;
	reg [2:0] tt_1_1_io_update_old_ctr_0_REG;
	reg tt_1_1_io_update_u_mask_0_REG;
	reg [1:0] tt_1_1_io_update_u_0_REG;
	reg tt_1_1_io_update_mask_1_REG;
	reg tt_1_1_io_update_taken_1_REG;
	reg tt_1_1_io_update_alloc_1_REG;
	reg [2:0] tt_1_1_io_update_old_ctr_1_REG;
	reg tt_1_1_io_update_u_mask_1_REG;
	reg [1:0] tt_1_1_io_update_u_1_REG;
	reg tt_1_1_io_update_mask_2_REG;
	reg tt_1_1_io_update_taken_2_REG;
	reg tt_1_1_io_update_alloc_2_REG;
	reg [2:0] tt_1_1_io_update_old_ctr_2_REG;
	reg tt_1_1_io_update_u_mask_2_REG;
	reg [1:0] tt_1_1_io_update_u_2_REG;
	reg tt_1_1_io_update_mask_3_REG;
	reg tt_1_1_io_update_taken_3_REG;
	reg tt_1_1_io_update_alloc_3_REG;
	reg [2:0] tt_1_1_io_update_old_ctr_3_REG;
	reg tt_1_1_io_update_u_mask_3_REG;
	reg [1:0] tt_1_1_io_update_u_3_REG;
	reg [39:0] tt_1_1_io_update_pc_REG;
	reg [63:0] tt_1_1_io_update_hist_REG;
	reg tt_2_1_io_update_mask_0_REG;
	reg tt_2_1_io_update_taken_0_REG;
	reg tt_2_1_io_update_alloc_0_REG;
	reg [2:0] tt_2_1_io_update_old_ctr_0_REG;
	reg tt_2_1_io_update_u_mask_0_REG;
	reg [1:0] tt_2_1_io_update_u_0_REG;
	reg tt_2_1_io_update_mask_1_REG;
	reg tt_2_1_io_update_taken_1_REG;
	reg tt_2_1_io_update_alloc_1_REG;
	reg [2:0] tt_2_1_io_update_old_ctr_1_REG;
	reg tt_2_1_io_update_u_mask_1_REG;
	reg [1:0] tt_2_1_io_update_u_1_REG;
	reg tt_2_1_io_update_mask_2_REG;
	reg tt_2_1_io_update_taken_2_REG;
	reg tt_2_1_io_update_alloc_2_REG;
	reg [2:0] tt_2_1_io_update_old_ctr_2_REG;
	reg tt_2_1_io_update_u_mask_2_REG;
	reg [1:0] tt_2_1_io_update_u_2_REG;
	reg tt_2_1_io_update_mask_3_REG;
	reg tt_2_1_io_update_taken_3_REG;
	reg tt_2_1_io_update_alloc_3_REG;
	reg [2:0] tt_2_1_io_update_old_ctr_3_REG;
	reg tt_2_1_io_update_u_mask_3_REG;
	reg [1:0] tt_2_1_io_update_u_3_REG;
	reg [39:0] tt_2_1_io_update_pc_REG;
	reg [63:0] tt_2_1_io_update_hist_REG;
	reg tt_3_1_io_update_mask_0_REG;
	reg tt_3_1_io_update_taken_0_REG;
	reg tt_3_1_io_update_alloc_0_REG;
	reg [2:0] tt_3_1_io_update_old_ctr_0_REG;
	reg tt_3_1_io_update_u_mask_0_REG;
	reg [1:0] tt_3_1_io_update_u_0_REG;
	reg tt_3_1_io_update_mask_1_REG;
	reg tt_3_1_io_update_taken_1_REG;
	reg tt_3_1_io_update_alloc_1_REG;
	reg [2:0] tt_3_1_io_update_old_ctr_1_REG;
	reg tt_3_1_io_update_u_mask_1_REG;
	reg [1:0] tt_3_1_io_update_u_1_REG;
	reg tt_3_1_io_update_mask_2_REG;
	reg tt_3_1_io_update_taken_2_REG;
	reg tt_3_1_io_update_alloc_2_REG;
	reg [2:0] tt_3_1_io_update_old_ctr_2_REG;
	reg tt_3_1_io_update_u_mask_2_REG;
	reg [1:0] tt_3_1_io_update_u_2_REG;
	reg tt_3_1_io_update_mask_3_REG;
	reg tt_3_1_io_update_taken_3_REG;
	reg tt_3_1_io_update_alloc_3_REG;
	reg [2:0] tt_3_1_io_update_old_ctr_3_REG;
	reg tt_3_1_io_update_u_mask_3_REG;
	reg [1:0] tt_3_1_io_update_u_3_REG;
	reg [39:0] tt_3_1_io_update_pc_REG;
	reg [63:0] tt_3_1_io_update_hist_REG;
	reg tt_4_1_io_update_mask_0_REG;
	reg tt_4_1_io_update_taken_0_REG;
	reg tt_4_1_io_update_alloc_0_REG;
	reg [2:0] tt_4_1_io_update_old_ctr_0_REG;
	reg tt_4_1_io_update_u_mask_0_REG;
	reg [1:0] tt_4_1_io_update_u_0_REG;
	reg tt_4_1_io_update_mask_1_REG;
	reg tt_4_1_io_update_taken_1_REG;
	reg tt_4_1_io_update_alloc_1_REG;
	reg [2:0] tt_4_1_io_update_old_ctr_1_REG;
	reg tt_4_1_io_update_u_mask_1_REG;
	reg [1:0] tt_4_1_io_update_u_1_REG;
	reg tt_4_1_io_update_mask_2_REG;
	reg tt_4_1_io_update_taken_2_REG;
	reg tt_4_1_io_update_alloc_2_REG;
	reg [2:0] tt_4_1_io_update_old_ctr_2_REG;
	reg tt_4_1_io_update_u_mask_2_REG;
	reg [1:0] tt_4_1_io_update_u_2_REG;
	reg tt_4_1_io_update_mask_3_REG;
	reg tt_4_1_io_update_taken_3_REG;
	reg tt_4_1_io_update_alloc_3_REG;
	reg [2:0] tt_4_1_io_update_old_ctr_3_REG;
	reg tt_4_1_io_update_u_mask_3_REG;
	reg [1:0] tt_4_1_io_update_u_3_REG;
	reg [39:0] tt_4_1_io_update_pc_REG;
	reg [63:0] tt_4_1_io_update_hist_REG;
	reg tt_5_1_io_update_mask_0_REG;
	reg tt_5_1_io_update_taken_0_REG;
	reg tt_5_1_io_update_alloc_0_REG;
	reg [2:0] tt_5_1_io_update_old_ctr_0_REG;
	reg tt_5_1_io_update_u_mask_0_REG;
	reg [1:0] tt_5_1_io_update_u_0_REG;
	reg tt_5_1_io_update_mask_1_REG;
	reg tt_5_1_io_update_taken_1_REG;
	reg tt_5_1_io_update_alloc_1_REG;
	reg [2:0] tt_5_1_io_update_old_ctr_1_REG;
	reg tt_5_1_io_update_u_mask_1_REG;
	reg [1:0] tt_5_1_io_update_u_1_REG;
	reg tt_5_1_io_update_mask_2_REG;
	reg tt_5_1_io_update_taken_2_REG;
	reg tt_5_1_io_update_alloc_2_REG;
	reg [2:0] tt_5_1_io_update_old_ctr_2_REG;
	reg tt_5_1_io_update_u_mask_2_REG;
	reg [1:0] tt_5_1_io_update_u_2_REG;
	reg tt_5_1_io_update_mask_3_REG;
	reg tt_5_1_io_update_taken_3_REG;
	reg tt_5_1_io_update_alloc_3_REG;
	reg [2:0] tt_5_1_io_update_old_ctr_3_REG;
	reg tt_5_1_io_update_u_mask_3_REG;
	reg [1:0] tt_5_1_io_update_u_3_REG;
	reg [39:0] tt_5_1_io_update_pc_REG;
	reg [63:0] tt_5_1_io_update_hist_REG;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg _GEN_27;
		reg _GEN_28;
		reg [1:0] _GEN_29;
		reg _GEN_30;
		reg [1:0] _GEN_31;
		reg _GEN_32;
		reg [2:0] _GEN_33;
		reg [2:0] _GEN_34;
		reg [23:0] _GEN_35;
		reg _GEN_36;
		reg _GEN_37;
		reg _GEN_38;
		reg _GEN_39;
		reg _GEN_40;
		reg _GEN_41;
		reg _GEN_42;
		reg _GEN_43;
		reg [1:0] new_u;
		reg _GEN_44;
		reg _GEN_45;
		reg [1:0] _GEN_46;
		reg _GEN_47;
		reg [1:0] _GEN_48;
		reg _GEN_49;
		reg [2:0] _GEN_50;
		reg [2:0] _GEN_51;
		reg [23:0] _GEN_52;
		reg _GEN_53;
		reg _GEN_54;
		reg _GEN_55;
		reg _GEN_56;
		reg _GEN_57;
		reg _GEN_58;
		reg _GEN_59;
		reg [1:0] new_u_1;
		reg _GEN_60;
		reg _GEN_61;
		reg [1:0] _GEN_62;
		reg _GEN_63;
		reg [1:0] _GEN_64;
		reg _GEN_65;
		reg [2:0] _GEN_66;
		reg [2:0] _GEN_67;
		reg [23:0] _GEN_68;
		reg _GEN_69;
		reg _GEN_70;
		reg _GEN_71;
		reg _GEN_72;
		reg _GEN_73;
		reg _GEN_74;
		reg _GEN_75;
		reg [1:0] new_u_2;
		reg _GEN_76;
		reg _GEN_77;
		reg [1:0] _GEN_78;
		reg _GEN_79;
		reg [1:0] _GEN_80;
		reg _GEN_81;
		reg [2:0] _GEN_82;
		reg [2:0] _GEN_83;
		reg [23:0] _GEN_84;
		reg _GEN_85;
		reg _GEN_86;
		reg _GEN_87;
		reg _GEN_88;
		reg _GEN_89;
		reg _GEN_90;
		reg _GEN_91;
		reg [1:0] new_u_3;
		reg _GEN_92;
		reg [3:0] _GEN_93;
		reg _GEN_94;
		reg [11:0] _GEN_95;
		reg [2:0] _GEN_96;
		reg _GEN_97;
		reg _GEN_98;
		reg _GEN_99;
		reg _GEN_100;
		reg _GEN_101;
		reg _GEN_102;
		reg _GEN_103;
		reg _GEN_104;
		reg _GEN_105;
		reg _GEN_106;
		reg _GEN_107;
		reg _GEN_108;
		reg _GEN_109;
		reg _GEN_110;
		reg _GEN_111;
		reg _GEN_112;
		reg _GEN_113;
		reg _GEN_114;
		reg _GEN_115;
		reg _GEN_116;
		reg _GEN_117;
		reg _GEN_118;
		reg _GEN_119;
		reg _GEN_120;
		reg _GEN_121;
		reg _GEN_122;
		reg _GEN_123;
		reg _GEN_124;
		reg _GEN_125;
		reg _GEN_126;
		reg _GEN_127;
		reg _GEN_128;
		reg _GEN_129;
		reg _GEN_130;
		reg _GEN_131;
		reg _GEN_132;
		reg _GEN_133;
		reg _GEN_134;
		reg _GEN_135;
		reg _GEN_136;
		reg _GEN_137;
		reg _GEN_138;
		reg _GEN_139;
		reg _GEN_140;
		reg _GEN_141;
		reg _GEN_142;
		reg _GEN_143;
		reg _GEN_144;
		reg _GEN_145;
		reg _GEN_146;
		reg _GEN_147;
		reg _GEN_148;
		reg _GEN_149;
		reg _GEN_150;
		reg _GEN_151;
		reg _GEN_152;
		reg _GEN_153;
		reg _GEN_154;
		reg _GEN_155;
		reg _GEN_156;
		reg _GEN_157;
		reg _GEN_158;
		reg _GEN_159;
		reg _GEN_160;
		reg _GEN_161;
		reg _GEN_162;
		reg [11:0] _GEN_163;
		reg [2:0] _GEN_164;
		reg [7:0] _decr_mask_T_1;
		reg [5:0] _GEN_165;
		reg [4:0] _GEN_166;
		reg [3:0] _GEN_167;
		reg [2:0] _GEN_168;
		reg [1:0] _GEN_169;
		reg [3:0] _GEN_170;
		reg [5:0] decr_mask;
		reg _GEN_171;
		reg _GEN_172;
		reg _GEN_173;
		reg _GEN_174;
		reg _GEN_175;
		reg _GEN_176;
		reg _GEN_177;
		reg _GEN_178;
		reg _GEN_179;
		reg _GEN_180;
		reg _GEN_181;
		reg _GEN_182;
		reg _GEN_183;
		reg _GEN_184;
		reg _GEN_185;
		reg _GEN_186;
		reg _GEN_187;
		reg _GEN_188;
		reg _GEN_189;
		reg _GEN_190;
		reg _GEN_191;
		reg _GEN_192;
		reg _GEN_193;
		reg _GEN_194;
		reg [15:0] _GEN_195;
		reg [15:0] _GEN_196;
		reg [15:0] _GEN_197;
		reg [15:0] _GEN_198;
		_GEN_27 = _tt_0_1_io_f2_resp_0_valid | _tt_1_1_io_f2_resp_0_valid;
		_GEN_28 = _GEN_27 | _tt_2_1_io_f2_resp_0_valid;
		_GEN_29 = (_tt_2_1_io_f2_resp_0_valid ? 2'h2 : {1'h0, _tt_1_1_io_f2_resp_0_valid});
		_GEN_30 = _GEN_28 | _tt_3_1_io_f2_resp_0_valid;
		_GEN_31 = (_tt_3_1_io_f2_resp_0_valid ? 2'h3 : _GEN_29);
		_GEN_32 = _GEN_30 | _tt_4_1_io_f2_resp_0_valid;
		_GEN_33 = (_tt_4_1_io_f2_resp_0_valid ? 3'h4 : {1'h0, _GEN_31});
		_GEN_34 = (_tt_5_1_io_f2_resp_0_valid ? 3'h5 : _GEN_33);
		_GEN_35 = {_tt_0_1_io_f2_resp_0_bits_ctr, _tt_0_1_io_f2_resp_0_bits_ctr, _tt_5_1_io_f2_resp_0_bits_ctr, _tt_4_1_io_f2_resp_0_bits_ctr, _tt_3_1_io_f2_resp_0_bits_ctr, _tt_2_1_io_f2_resp_0_bits_ctr, _tt_1_1_io_f2_resp_0_bits_ctr, _tt_0_1_io_f2_resp_0_bits_ctr};
		_GEN_44 = _tt_0_1_io_f2_resp_1_valid | _tt_1_1_io_f2_resp_1_valid;
		_GEN_45 = _GEN_44 | _tt_2_1_io_f2_resp_1_valid;
		_GEN_46 = (_tt_2_1_io_f2_resp_1_valid ? 2'h2 : {1'h0, _tt_1_1_io_f2_resp_1_valid});
		_GEN_47 = _GEN_45 | _tt_3_1_io_f2_resp_1_valid;
		_GEN_48 = (_tt_3_1_io_f2_resp_1_valid ? 2'h3 : _GEN_46);
		_GEN_49 = _GEN_47 | _tt_4_1_io_f2_resp_1_valid;
		_GEN_50 = (_tt_4_1_io_f2_resp_1_valid ? 3'h4 : {1'h0, _GEN_48});
		_GEN_51 = (_tt_5_1_io_f2_resp_1_valid ? 3'h5 : _GEN_50);
		_GEN_52 = {_tt_0_1_io_f2_resp_1_bits_ctr, _tt_0_1_io_f2_resp_1_bits_ctr, _tt_5_1_io_f2_resp_1_bits_ctr, _tt_4_1_io_f2_resp_1_bits_ctr, _tt_3_1_io_f2_resp_1_bits_ctr, _tt_2_1_io_f2_resp_1_bits_ctr, _tt_1_1_io_f2_resp_1_bits_ctr, _tt_0_1_io_f2_resp_1_bits_ctr};
		_GEN_60 = _tt_0_1_io_f2_resp_2_valid | _tt_1_1_io_f2_resp_2_valid;
		_GEN_61 = _GEN_60 | _tt_2_1_io_f2_resp_2_valid;
		_GEN_62 = (_tt_2_1_io_f2_resp_2_valid ? 2'h2 : {1'h0, _tt_1_1_io_f2_resp_2_valid});
		_GEN_63 = _GEN_61 | _tt_3_1_io_f2_resp_2_valid;
		_GEN_64 = (_tt_3_1_io_f2_resp_2_valid ? 2'h3 : _GEN_62);
		_GEN_65 = _GEN_63 | _tt_4_1_io_f2_resp_2_valid;
		_GEN_66 = (_tt_4_1_io_f2_resp_2_valid ? 3'h4 : {1'h0, _GEN_64});
		_GEN_67 = (_tt_5_1_io_f2_resp_2_valid ? 3'h5 : _GEN_66);
		_GEN_68 = {_tt_0_1_io_f2_resp_2_bits_ctr, _tt_0_1_io_f2_resp_2_bits_ctr, _tt_5_1_io_f2_resp_2_bits_ctr, _tt_4_1_io_f2_resp_2_bits_ctr, _tt_3_1_io_f2_resp_2_bits_ctr, _tt_2_1_io_f2_resp_2_bits_ctr, _tt_1_1_io_f2_resp_2_bits_ctr, _tt_0_1_io_f2_resp_2_bits_ctr};
		_GEN_76 = _tt_0_1_io_f2_resp_3_valid | _tt_1_1_io_f2_resp_3_valid;
		_GEN_77 = _GEN_76 | _tt_2_1_io_f2_resp_3_valid;
		_GEN_78 = (_tt_2_1_io_f2_resp_3_valid ? 2'h2 : {1'h0, _tt_1_1_io_f2_resp_3_valid});
		_GEN_79 = _GEN_77 | _tt_3_1_io_f2_resp_3_valid;
		_GEN_80 = (_tt_3_1_io_f2_resp_3_valid ? 2'h3 : _GEN_78);
		_GEN_81 = _GEN_79 | _tt_4_1_io_f2_resp_3_valid;
		_GEN_82 = (_tt_4_1_io_f2_resp_3_valid ? 3'h4 : {1'h0, _GEN_80});
		_GEN_83 = (_tt_5_1_io_f2_resp_3_valid ? 3'h5 : _GEN_82);
		_GEN_84 = {_tt_0_1_io_f2_resp_3_bits_ctr, _tt_0_1_io_f2_resp_3_bits_ctr, _tt_5_1_io_f2_resp_3_bits_ctr, _tt_4_1_io_f2_resp_3_bits_ctr, _tt_3_1_io_f2_resp_3_bits_ctr, _tt_2_1_io_f2_resp_3_bits_ctr, _tt_1_1_io_f2_resp_3_bits_ctr, _tt_0_1_io_f2_resp_3_bits_ctr};
		_GEN_195 = {_tt_0_1_io_f2_resp_0_bits_u, _tt_0_1_io_f2_resp_0_bits_u, _tt_5_1_io_f2_resp_0_bits_u, _tt_4_1_io_f2_resp_0_bits_u, _tt_3_1_io_f2_resp_0_bits_u, _tt_2_1_io_f2_resp_0_bits_u, _tt_1_1_io_f2_resp_0_bits_u, _tt_0_1_io_f2_resp_0_bits_u};
		_GEN_196 = {_tt_0_1_io_f2_resp_1_bits_u, _tt_0_1_io_f2_resp_1_bits_u, _tt_5_1_io_f2_resp_1_bits_u, _tt_4_1_io_f2_resp_1_bits_u, _tt_3_1_io_f2_resp_1_bits_u, _tt_2_1_io_f2_resp_1_bits_u, _tt_1_1_io_f2_resp_1_bits_u, _tt_0_1_io_f2_resp_1_bits_u};
		_GEN_197 = {_tt_0_1_io_f2_resp_2_bits_u, _tt_0_1_io_f2_resp_2_bits_u, _tt_5_1_io_f2_resp_2_bits_u, _tt_4_1_io_f2_resp_2_bits_u, _tt_3_1_io_f2_resp_2_bits_u, _tt_2_1_io_f2_resp_2_bits_u, _tt_1_1_io_f2_resp_2_bits_u, _tt_0_1_io_f2_resp_2_bits_u};
		_GEN_198 = {_tt_0_1_io_f2_resp_3_bits_u, _tt_0_1_io_f2_resp_3_bits_u, _tt_5_1_io_f2_resp_3_bits_u, _tt_4_1_io_f2_resp_3_bits_u, _tt_3_1_io_f2_resp_3_bits_u, _tt_2_1_io_f2_resp_3_bits_u, _tt_1_1_io_f2_resp_3_bits_u, _tt_0_1_io_f2_resp_3_bits_u};
		_GEN_36 = (s1_update_bits_is_mispredict_update | s1_update_bits_is_repair_update) | (|s1_update_bits_btb_mispredicts);
		_GEN_37 = ((s1_update_bits_br_mask[0] & s1_update_valid) & ~_GEN_36) & s1_update_bits_meta[43];
		_GEN_38 = _GEN_37 & (s1_update_bits_meta[42:40] == 3'h0);
		_GEN_39 = _GEN_37 & (s1_update_bits_meta[42:40] == 3'h1);
		_GEN_40 = _GEN_37 & (s1_update_bits_meta[42:40] == 3'h2);
		_GEN_41 = _GEN_37 & (s1_update_bits_meta[42:40] == 3'h3);
		_GEN_42 = _GEN_37 & (s1_update_bits_meta[42:40] == 3'h4);
		_GEN_43 = _GEN_37 & (s1_update_bits_meta[42:40] == 3'h5);
		new_u = (s1_update_bits_meta[36] ? ((s1_update_bits_cfi_idx_bits == 2'h0) & s1_update_bits_cfi_mispredicted ? (s1_update_bits_meta[29:28] == 2'h0 ? 2'h0 : s1_update_bits_meta[29:28] - 2'h1) : (&s1_update_bits_meta[29:28] ? 2'h3 : s1_update_bits_meta[29:28] + 2'h1)) : s1_update_bits_meta[29:28]);
		_GEN_53 = ((s1_update_bits_br_mask[1] & s1_update_valid) & ~_GEN_36) & s1_update_bits_meta[47];
		_GEN_54 = _GEN_53 & (s1_update_bits_meta[46:44] == 3'h0);
		_GEN_55 = _GEN_53 & (s1_update_bits_meta[46:44] == 3'h1);
		_GEN_56 = _GEN_53 & (s1_update_bits_meta[46:44] == 3'h2);
		_GEN_57 = _GEN_53 & (s1_update_bits_meta[46:44] == 3'h3);
		_GEN_58 = _GEN_53 & (s1_update_bits_meta[46:44] == 3'h4);
		_GEN_59 = _GEN_53 & (s1_update_bits_meta[46:44] == 3'h5);
		new_u_1 = (s1_update_bits_meta[37] ? ((s1_update_bits_cfi_idx_bits == 2'h1) & s1_update_bits_cfi_mispredicted ? (s1_update_bits_meta[31:30] == 2'h0 ? 2'h0 : s1_update_bits_meta[31:30] - 2'h1) : (&s1_update_bits_meta[31:30] ? 2'h3 : s1_update_bits_meta[31:30] + 2'h1)) : s1_update_bits_meta[31:30]);
		_GEN_69 = ((s1_update_bits_br_mask[2] & s1_update_valid) & ~_GEN_36) & s1_update_bits_meta[51];
		_GEN_70 = _GEN_69 & (s1_update_bits_meta[50:48] == 3'h0);
		_GEN_71 = _GEN_69 & (s1_update_bits_meta[50:48] == 3'h1);
		_GEN_72 = _GEN_69 & (s1_update_bits_meta[50:48] == 3'h2);
		_GEN_73 = _GEN_69 & (s1_update_bits_meta[50:48] == 3'h3);
		_GEN_74 = _GEN_69 & (s1_update_bits_meta[50:48] == 3'h4);
		_GEN_75 = _GEN_69 & (s1_update_bits_meta[50:48] == 3'h5);
		new_u_2 = (s1_update_bits_meta[38] ? ((s1_update_bits_cfi_idx_bits == 2'h2) & s1_update_bits_cfi_mispredicted ? (s1_update_bits_meta[33:32] == 2'h0 ? 2'h0 : s1_update_bits_meta[33:32] - 2'h1) : (&s1_update_bits_meta[33:32] ? 2'h3 : s1_update_bits_meta[33:32] + 2'h1)) : s1_update_bits_meta[33:32]);
		_GEN_85 = ((s1_update_bits_br_mask[3] & s1_update_valid) & ~_GEN_36) & s1_update_bits_meta[55];
		_GEN_86 = _GEN_85 & (s1_update_bits_meta[54:52] == 3'h0);
		_GEN_87 = _GEN_85 & (s1_update_bits_meta[54:52] == 3'h1);
		_GEN_88 = _GEN_85 & (s1_update_bits_meta[54:52] == 3'h2);
		_GEN_89 = _GEN_85 & (s1_update_bits_meta[54:52] == 3'h3);
		_GEN_90 = _GEN_85 & (s1_update_bits_meta[54:52] == 3'h4);
		_GEN_91 = _GEN_85 & (s1_update_bits_meta[54:52] == 3'h5);
		new_u_3 = (s1_update_bits_meta[39] ? (&s1_update_bits_cfi_idx_bits & s1_update_bits_cfi_mispredicted ? (s1_update_bits_meta[35:34] == 2'h0 ? 2'h0 : s1_update_bits_meta[35:34] - 2'h1) : (&s1_update_bits_meta[35:34] ? 2'h3 : s1_update_bits_meta[35:34] + 2'h1)) : s1_update_bits_meta[35:34]);
		_GEN_92 = ((s1_update_valid & ~_GEN_36) & s1_update_bits_cfi_mispredicted) & s1_update_bits_cfi_idx_valid;
		_GEN_93 = {s1_update_bits_meta[15], s1_update_bits_meta[11], s1_update_bits_meta[7], s1_update_bits_meta[3]};
		_GEN_94 = _GEN_93[s1_update_bits_cfi_idx_bits];
		_GEN_95 = {s1_update_bits_meta[14:12], s1_update_bits_meta[10:8], s1_update_bits_meta[6:4], s1_update_bits_meta[2:0]};
		_GEN_96 = _GEN_95[s1_update_bits_cfi_idx_bits * 3+:3];
		_GEN_97 = _GEN_96 == 3'h0;
		_GEN_98 = _GEN_97 & ~(|s1_update_bits_cfi_idx_bits);
		_GEN_99 = (_GEN_92 & _GEN_94) & _GEN_98;
		_GEN_100 = s1_update_bits_cfi_idx_bits == 2'h1;
		_GEN_101 = _GEN_97 & _GEN_100;
		_GEN_102 = (_GEN_92 & _GEN_94) & _GEN_101;
		_GEN_103 = s1_update_bits_cfi_idx_bits == 2'h2;
		_GEN_104 = _GEN_97 & _GEN_103;
		_GEN_105 = (_GEN_92 & _GEN_94) & _GEN_104;
		_GEN_106 = _GEN_97 & (&s1_update_bits_cfi_idx_bits);
		_GEN_107 = (_GEN_92 & _GEN_94) & _GEN_106;
		_GEN_108 = _GEN_96 == 3'h1;
		_GEN_109 = _GEN_108 & ~(|s1_update_bits_cfi_idx_bits);
		_GEN_110 = (_GEN_92 & _GEN_94) & _GEN_109;
		_GEN_111 = _GEN_108 & _GEN_100;
		_GEN_112 = (_GEN_92 & _GEN_94) & _GEN_111;
		_GEN_113 = _GEN_108 & _GEN_103;
		_GEN_114 = (_GEN_92 & _GEN_94) & _GEN_113;
		_GEN_115 = _GEN_108 & (&s1_update_bits_cfi_idx_bits);
		_GEN_116 = (_GEN_92 & _GEN_94) & _GEN_115;
		_GEN_117 = _GEN_96 == 3'h2;
		_GEN_118 = _GEN_117 & ~(|s1_update_bits_cfi_idx_bits);
		_GEN_119 = (_GEN_92 & _GEN_94) & _GEN_118;
		_GEN_120 = _GEN_117 & _GEN_100;
		_GEN_121 = (_GEN_92 & _GEN_94) & _GEN_120;
		_GEN_122 = _GEN_117 & _GEN_103;
		_GEN_123 = (_GEN_92 & _GEN_94) & _GEN_122;
		_GEN_124 = _GEN_117 & (&s1_update_bits_cfi_idx_bits);
		_GEN_125 = (_GEN_92 & _GEN_94) & _GEN_124;
		_GEN_126 = _GEN_96 == 3'h3;
		_GEN_127 = _GEN_126 & ~(|s1_update_bits_cfi_idx_bits);
		_GEN_128 = (_GEN_92 & _GEN_94) & _GEN_127;
		_GEN_129 = _GEN_126 & _GEN_100;
		_GEN_130 = (_GEN_92 & _GEN_94) & _GEN_129;
		_GEN_131 = _GEN_126 & _GEN_103;
		_GEN_132 = (_GEN_92 & _GEN_94) & _GEN_131;
		_GEN_133 = _GEN_126 & (&s1_update_bits_cfi_idx_bits);
		_GEN_134 = (_GEN_92 & _GEN_94) & _GEN_133;
		_GEN_135 = _GEN_96 == 3'h4;
		_GEN_136 = _GEN_135 & ~(|s1_update_bits_cfi_idx_bits);
		_GEN_137 = (_GEN_92 & _GEN_94) & _GEN_136;
		_GEN_138 = _GEN_135 & _GEN_100;
		_GEN_139 = (_GEN_92 & _GEN_94) & _GEN_138;
		_GEN_140 = _GEN_135 & _GEN_103;
		_GEN_141 = (_GEN_92 & _GEN_94) & _GEN_140;
		_GEN_142 = _GEN_135 & (&s1_update_bits_cfi_idx_bits);
		_GEN_143 = (_GEN_92 & _GEN_94) & _GEN_142;
		_GEN_144 = _GEN_96 == 3'h5;
		_GEN_145 = _GEN_144 & ~(|s1_update_bits_cfi_idx_bits);
		_GEN_146 = (_GEN_92 & _GEN_94) & _GEN_145;
		_GEN_147 = _GEN_144 & _GEN_100;
		_GEN_148 = (_GEN_92 & _GEN_94) & _GEN_147;
		_GEN_149 = _GEN_144 & _GEN_103;
		_GEN_150 = (_GEN_92 & _GEN_94) & _GEN_149;
		_GEN_151 = _GEN_144 & (&s1_update_bits_cfi_idx_bits);
		_GEN_152 = (_GEN_92 & _GEN_94) & _GEN_151;
		_GEN_153 = s1_update_bits_cfi_idx_valid & ~(|s1_update_bits_cfi_idx_bits);
		_GEN_154 = s1_update_bits_cfi_idx_valid & (s1_update_bits_cfi_idx_bits == 2'h1);
		_GEN_155 = s1_update_bits_cfi_idx_valid & (s1_update_bits_cfi_idx_bits == 2'h2);
		_GEN_156 = s1_update_bits_cfi_idx_valid & (&s1_update_bits_cfi_idx_bits);
		_GEN_157 = (_GEN_92 & _GEN_94) & _GEN_97;
		_GEN_158 = (_GEN_92 & _GEN_94) & _GEN_108;
		_GEN_159 = (_GEN_92 & _GEN_94) & _GEN_117;
		_GEN_160 = (_GEN_92 & _GEN_94) & _GEN_126;
		_GEN_161 = (_GEN_92 & _GEN_94) & _GEN_135;
		_GEN_162 = (_GEN_92 & _GEN_94) & _GEN_144;
		_GEN_163 = {s1_update_bits_meta[54:52], s1_update_bits_meta[50:48], s1_update_bits_meta[46:44], s1_update_bits_meta[42:40]};
		_GEN_164 = _GEN_163[s1_update_bits_cfi_idx_bits * 3+:3];
		_decr_mask_T_1 = 8'h01 << _GEN_164;
		_GEN_165 = (_decr_mask_T_1[5:0] | _decr_mask_T_1[6:1]) | _decr_mask_T_1[7:2];
		_GEN_166 = _GEN_165[4:0] | _decr_mask_T_1[7:3];
		_GEN_167 = _GEN_166[3:0] | _decr_mask_T_1[7:4];
		_GEN_168 = _GEN_167[2:0] | _decr_mask_T_1[7:5];
		_GEN_169 = _GEN_168[1:0] | _decr_mask_T_1[7:6];
		_GEN_170 = {s1_update_bits_meta[55], s1_update_bits_meta[51], s1_update_bits_meta[47], s1_update_bits_meta[43]};
		decr_mask = (_GEN_170[s1_update_bits_cfi_idx_bits] ? ~{_GEN_165[5], _GEN_166[4], _GEN_167[3], _GEN_168[2], _GEN_169[1], _GEN_169[0] | &_GEN_164} : 6'h00);
		_GEN_171 = decr_mask[0] & ~(|s1_update_bits_cfi_idx_bits);
		_GEN_172 = decr_mask[0] & _GEN_100;
		_GEN_173 = decr_mask[0] & _GEN_103;
		_GEN_174 = decr_mask[0] & (&s1_update_bits_cfi_idx_bits);
		_GEN_175 = decr_mask[1] & ~(|s1_update_bits_cfi_idx_bits);
		_GEN_176 = decr_mask[1] & _GEN_100;
		_GEN_177 = decr_mask[1] & _GEN_103;
		_GEN_178 = decr_mask[1] & (&s1_update_bits_cfi_idx_bits);
		_GEN_179 = decr_mask[2] & ~(|s1_update_bits_cfi_idx_bits);
		_GEN_180 = decr_mask[2] & _GEN_100;
		_GEN_181 = decr_mask[2] & _GEN_103;
		_GEN_182 = decr_mask[2] & (&s1_update_bits_cfi_idx_bits);
		_GEN_183 = decr_mask[3] & ~(|s1_update_bits_cfi_idx_bits);
		_GEN_184 = decr_mask[3] & _GEN_100;
		_GEN_185 = decr_mask[3] & _GEN_103;
		_GEN_186 = decr_mask[3] & (&s1_update_bits_cfi_idx_bits);
		_GEN_187 = decr_mask[4] & ~(|s1_update_bits_cfi_idx_bits);
		_GEN_188 = decr_mask[4] & _GEN_100;
		_GEN_189 = decr_mask[4] & _GEN_103;
		_GEN_190 = decr_mask[4] & (&s1_update_bits_cfi_idx_bits);
		_GEN_191 = decr_mask[5] & ~(|s1_update_bits_cfi_idx_bits);
		_GEN_192 = decr_mask[5] & _GEN_100;
		_GEN_193 = decr_mask[5] & _GEN_103;
		_GEN_194 = decr_mask[5] & (&s1_update_bits_cfi_idx_bits);
		s1_update_valid <= io_update_valid;
		s1_update_bits_is_mispredict_update <= io_update_bits_is_mispredict_update;
		s1_update_bits_is_repair_update <= io_update_bits_is_repair_update;
		s1_update_bits_btb_mispredicts <= io_update_bits_btb_mispredicts;
		s1_update_bits_pc <= {io_update_bits_pc[39:3], 3'h0};
		s1_update_bits_br_mask <= io_update_bits_br_mask;
		s1_update_bits_cfi_idx_valid <= io_update_bits_cfi_idx_valid;
		s1_update_bits_cfi_idx_bits <= io_update_bits_cfi_idx_bits;
		s1_update_bits_cfi_taken <= io_update_bits_cfi_taken;
		s1_update_bits_cfi_mispredicted <= io_update_bits_cfi_mispredicted;
		s1_update_bits_ghist <= io_update_bits_ghist;
		s1_update_bits_meta <= io_update_bits_meta;
		t_io_f1_req_valid_REG <= io_f0_valid;
		t_io_f1_req_pc_REG <= {io_f0_pc[39:3], 3'h0};
		t_io_f1_req_valid_REG_1 <= io_f0_valid;
		t_io_f1_req_pc_REG_1 <= {io_f0_pc[39:3], 3'h0};
		t_io_f1_req_valid_REG_2 <= io_f0_valid;
		t_io_f1_req_pc_REG_2 <= {io_f0_pc[39:3], 3'h0};
		t_io_f1_req_valid_REG_3 <= io_f0_valid;
		t_io_f1_req_pc_REG_3 <= {io_f0_pc[39:3], 3'h0};
		t_io_f1_req_valid_REG_4 <= io_f0_valid;
		t_io_f1_req_pc_REG_4 <= {io_f0_pc[39:3], 3'h0};
		t_io_f1_req_valid_REG_5 <= io_f0_valid;
		t_io_f1_req_pc_REG_5 <= {io_f0_pc[39:3], 3'h0};
		f3_resps_0_0_valid <= _tt_0_1_io_f2_resp_0_valid;
		f3_resps_0_0_bits_u <= _tt_0_1_io_f2_resp_0_bits_u;
		f3_resps_0_1_valid <= _tt_0_1_io_f2_resp_1_valid;
		f3_resps_0_1_bits_u <= _tt_0_1_io_f2_resp_1_bits_u;
		f3_resps_0_2_valid <= _tt_0_1_io_f2_resp_2_valid;
		f3_resps_0_2_bits_u <= _tt_0_1_io_f2_resp_2_bits_u;
		f3_resps_0_3_valid <= _tt_0_1_io_f2_resp_3_valid;
		f3_resps_0_3_bits_u <= _tt_0_1_io_f2_resp_3_bits_u;
		f3_resps_1_0_valid <= _tt_1_1_io_f2_resp_0_valid;
		f3_resps_1_0_bits_u <= _tt_1_1_io_f2_resp_0_bits_u;
		f3_resps_1_1_valid <= _tt_1_1_io_f2_resp_1_valid;
		f3_resps_1_1_bits_u <= _tt_1_1_io_f2_resp_1_bits_u;
		f3_resps_1_2_valid <= _tt_1_1_io_f2_resp_2_valid;
		f3_resps_1_2_bits_u <= _tt_1_1_io_f2_resp_2_bits_u;
		f3_resps_1_3_valid <= _tt_1_1_io_f2_resp_3_valid;
		f3_resps_1_3_bits_u <= _tt_1_1_io_f2_resp_3_bits_u;
		f3_resps_2_0_valid <= _tt_2_1_io_f2_resp_0_valid;
		f3_resps_2_0_bits_u <= _tt_2_1_io_f2_resp_0_bits_u;
		f3_resps_2_1_valid <= _tt_2_1_io_f2_resp_1_valid;
		f3_resps_2_1_bits_u <= _tt_2_1_io_f2_resp_1_bits_u;
		f3_resps_2_2_valid <= _tt_2_1_io_f2_resp_2_valid;
		f3_resps_2_2_bits_u <= _tt_2_1_io_f2_resp_2_bits_u;
		f3_resps_2_3_valid <= _tt_2_1_io_f2_resp_3_valid;
		f3_resps_2_3_bits_u <= _tt_2_1_io_f2_resp_3_bits_u;
		f3_resps_3_0_valid <= _tt_3_1_io_f2_resp_0_valid;
		f3_resps_3_0_bits_u <= _tt_3_1_io_f2_resp_0_bits_u;
		f3_resps_3_1_valid <= _tt_3_1_io_f2_resp_1_valid;
		f3_resps_3_1_bits_u <= _tt_3_1_io_f2_resp_1_bits_u;
		f3_resps_3_2_valid <= _tt_3_1_io_f2_resp_2_valid;
		f3_resps_3_2_bits_u <= _tt_3_1_io_f2_resp_2_bits_u;
		f3_resps_3_3_valid <= _tt_3_1_io_f2_resp_3_valid;
		f3_resps_3_3_bits_u <= _tt_3_1_io_f2_resp_3_bits_u;
		f3_resps_4_0_valid <= _tt_4_1_io_f2_resp_0_valid;
		f3_resps_4_0_bits_u <= _tt_4_1_io_f2_resp_0_bits_u;
		f3_resps_4_1_valid <= _tt_4_1_io_f2_resp_1_valid;
		f3_resps_4_1_bits_u <= _tt_4_1_io_f2_resp_1_bits_u;
		f3_resps_4_2_valid <= _tt_4_1_io_f2_resp_2_valid;
		f3_resps_4_2_bits_u <= _tt_4_1_io_f2_resp_2_bits_u;
		f3_resps_4_3_valid <= _tt_4_1_io_f2_resp_3_valid;
		f3_resps_4_3_bits_u <= _tt_4_1_io_f2_resp_3_bits_u;
		f3_resps_5_0_valid <= _tt_5_1_io_f2_resp_0_valid;
		f3_resps_5_0_bits_u <= _tt_5_1_io_f2_resp_0_bits_u;
		f3_resps_5_1_valid <= _tt_5_1_io_f2_resp_1_valid;
		f3_resps_5_1_bits_u <= _tt_5_1_io_f2_resp_1_bits_u;
		f3_resps_5_2_valid <= _tt_5_1_io_f2_resp_2_valid;
		f3_resps_5_2_bits_u <= _tt_5_1_io_f2_resp_2_bits_u;
		f3_resps_5_3_valid <= _tt_5_1_io_f2_resp_3_valid;
		f3_resps_5_3_bits_u <= _tt_5_1_io_f2_resp_3_bits_u;
		s3_provided <= _GEN_32 | _tt_5_1_io_f2_resp_0_valid;
		s3_provider <= _GEN_34;
		s3_alt_provided <= ((((_tt_0_1_io_f2_resp_0_valid & _tt_1_1_io_f2_resp_0_valid) | (_GEN_27 & _tt_2_1_io_f2_resp_0_valid)) | (_GEN_28 & _tt_3_1_io_f2_resp_0_valid)) | (_GEN_30 & _tt_4_1_io_f2_resp_0_valid)) | (_GEN_32 & _tt_5_1_io_f2_resp_0_valid);
		prov_ctr <= _GEN_35[_GEN_34 * 3+:3];
		prov_u <= _GEN_195[_GEN_34 * 2+:2];
		alt_ctr <= _GEN_35[(_tt_5_1_io_f2_resp_0_valid ? _GEN_33 : {1'h0, (_tt_4_1_io_f2_resp_0_valid ? _GEN_31 : (_tt_3_1_io_f2_resp_0_valid ? _GEN_29 : {1'h0, _tt_2_1_io_f2_resp_0_valid & _tt_1_1_io_f2_resp_0_valid}))}) * 3+:3];
		s3_provided_1 <= _GEN_49 | _tt_5_1_io_f2_resp_1_valid;
		s3_provider_1 <= _GEN_51;
		s3_alt_provided_1 <= ((((_tt_0_1_io_f2_resp_1_valid & _tt_1_1_io_f2_resp_1_valid) | (_GEN_44 & _tt_2_1_io_f2_resp_1_valid)) | (_GEN_45 & _tt_3_1_io_f2_resp_1_valid)) | (_GEN_47 & _tt_4_1_io_f2_resp_1_valid)) | (_GEN_49 & _tt_5_1_io_f2_resp_1_valid);
		prov_1_ctr <= _GEN_52[_GEN_51 * 3+:3];
		prov_1_u <= _GEN_196[_GEN_51 * 2+:2];
		alt_1_ctr <= _GEN_52[(_tt_5_1_io_f2_resp_1_valid ? _GEN_50 : {1'h0, (_tt_4_1_io_f2_resp_1_valid ? _GEN_48 : (_tt_3_1_io_f2_resp_1_valid ? _GEN_46 : {1'h0, _tt_2_1_io_f2_resp_1_valid & _tt_1_1_io_f2_resp_1_valid}))}) * 3+:3];
		s3_provided_2 <= _GEN_65 | _tt_5_1_io_f2_resp_2_valid;
		s3_provider_2 <= _GEN_67;
		s3_alt_provided_2 <= ((((_tt_0_1_io_f2_resp_2_valid & _tt_1_1_io_f2_resp_2_valid) | (_GEN_60 & _tt_2_1_io_f2_resp_2_valid)) | (_GEN_61 & _tt_3_1_io_f2_resp_2_valid)) | (_GEN_63 & _tt_4_1_io_f2_resp_2_valid)) | (_GEN_65 & _tt_5_1_io_f2_resp_2_valid);
		prov_2_ctr <= _GEN_68[_GEN_67 * 3+:3];
		prov_2_u <= _GEN_197[_GEN_67 * 2+:2];
		alt_2_ctr <= _GEN_68[(_tt_5_1_io_f2_resp_2_valid ? _GEN_66 : {1'h0, (_tt_4_1_io_f2_resp_2_valid ? _GEN_64 : (_tt_3_1_io_f2_resp_2_valid ? _GEN_62 : {1'h0, _tt_2_1_io_f2_resp_2_valid & _tt_1_1_io_f2_resp_2_valid}))}) * 3+:3];
		s3_provided_3 <= _GEN_81 | _tt_5_1_io_f2_resp_3_valid;
		s3_provider_3 <= _GEN_83;
		s3_alt_provided_3 <= ((((_tt_0_1_io_f2_resp_3_valid & _tt_1_1_io_f2_resp_3_valid) | (_GEN_76 & _tt_2_1_io_f2_resp_3_valid)) | (_GEN_77 & _tt_3_1_io_f2_resp_3_valid)) | (_GEN_79 & _tt_4_1_io_f2_resp_3_valid)) | (_GEN_81 & _tt_5_1_io_f2_resp_3_valid);
		prov_3_ctr <= _GEN_84[_GEN_83 * 3+:3];
		prov_3_u <= _GEN_198[_GEN_83 * 2+:2];
		alt_3_ctr <= _GEN_84[(_tt_5_1_io_f2_resp_3_valid ? _GEN_82 : {1'h0, (_tt_4_1_io_f2_resp_3_valid ? _GEN_80 : (_tt_3_1_io_f2_resp_3_valid ? _GEN_78 : {1'h0, _tt_2_1_io_f2_resp_3_valid & _tt_1_1_io_f2_resp_3_valid}))}) * 3+:3];
		tt_0_1_io_update_mask_0_REG <= _GEN_99 | _GEN_38;
		tt_0_1_io_update_taken_0_REG <= (_GEN_99 | _GEN_153) & s1_update_bits_cfi_taken;
		tt_0_1_io_update_alloc_0_REG <= _GEN_157 & ~(|s1_update_bits_cfi_idx_bits);
		tt_0_1_io_update_old_ctr_0_REG <= s1_update_bits_meta[18:16];
		tt_0_1_io_update_u_mask_0_REG <= (_GEN_92 ? (_GEN_94 ? _GEN_98 | _GEN_38 : _GEN_171 | _GEN_38) : _GEN_38);
		tt_0_1_io_update_u_0_REG <= (_GEN_92 & (_GEN_94 ? _GEN_98 : _GEN_171) ? 2'h0 : new_u);
		tt_0_1_io_update_mask_1_REG <= _GEN_102 | _GEN_54;
		tt_0_1_io_update_taken_1_REG <= (_GEN_102 | _GEN_154) & s1_update_bits_cfi_taken;
		tt_0_1_io_update_alloc_1_REG <= _GEN_157 & _GEN_100;
		tt_0_1_io_update_old_ctr_1_REG <= s1_update_bits_meta[21:19];
		tt_0_1_io_update_u_mask_1_REG <= (_GEN_92 ? (_GEN_94 ? _GEN_101 | _GEN_54 : _GEN_172 | _GEN_54) : _GEN_54);
		tt_0_1_io_update_u_1_REG <= (_GEN_92 & (_GEN_94 ? _GEN_101 : _GEN_172) ? 2'h0 : new_u_1);
		tt_0_1_io_update_mask_2_REG <= _GEN_105 | _GEN_70;
		tt_0_1_io_update_taken_2_REG <= (_GEN_105 | _GEN_155) & s1_update_bits_cfi_taken;
		tt_0_1_io_update_alloc_2_REG <= _GEN_157 & _GEN_103;
		tt_0_1_io_update_old_ctr_2_REG <= s1_update_bits_meta[24:22];
		tt_0_1_io_update_u_mask_2_REG <= (_GEN_92 ? (_GEN_94 ? _GEN_104 | _GEN_70 : _GEN_173 | _GEN_70) : _GEN_70);
		tt_0_1_io_update_u_2_REG <= (_GEN_92 & (_GEN_94 ? _GEN_104 : _GEN_173) ? 2'h0 : new_u_2);
		tt_0_1_io_update_mask_3_REG <= _GEN_107 | _GEN_86;
		tt_0_1_io_update_taken_3_REG <= (_GEN_107 | _GEN_156) & s1_update_bits_cfi_taken;
		tt_0_1_io_update_alloc_3_REG <= _GEN_157 & (&s1_update_bits_cfi_idx_bits);
		tt_0_1_io_update_old_ctr_3_REG <= s1_update_bits_meta[27:25];
		tt_0_1_io_update_u_mask_3_REG <= (_GEN_92 ? (_GEN_94 ? _GEN_106 | _GEN_86 : _GEN_174 | _GEN_86) : _GEN_86);
		tt_0_1_io_update_u_3_REG <= (_GEN_92 & (_GEN_94 ? _GEN_106 : _GEN_174) ? 2'h0 : new_u_3);
		tt_0_1_io_update_pc_REG <= s1_update_bits_pc;
		tt_0_1_io_update_hist_REG <= s1_update_bits_ghist;
		tt_1_1_io_update_mask_0_REG <= _GEN_110 | _GEN_39;
		tt_1_1_io_update_taken_0_REG <= (_GEN_110 | _GEN_153) & s1_update_bits_cfi_taken;
		tt_1_1_io_update_alloc_0_REG <= _GEN_158 & ~(|s1_update_bits_cfi_idx_bits);
		tt_1_1_io_update_old_ctr_0_REG <= s1_update_bits_meta[18:16];
		tt_1_1_io_update_u_mask_0_REG <= (_GEN_92 ? (_GEN_94 ? _GEN_109 | _GEN_39 : _GEN_175 | _GEN_39) : _GEN_39);
		tt_1_1_io_update_u_0_REG <= (_GEN_92 & (_GEN_94 ? _GEN_109 : _GEN_175) ? 2'h0 : new_u);
		tt_1_1_io_update_mask_1_REG <= _GEN_112 | _GEN_55;
		tt_1_1_io_update_taken_1_REG <= (_GEN_112 | _GEN_154) & s1_update_bits_cfi_taken;
		tt_1_1_io_update_alloc_1_REG <= _GEN_158 & _GEN_100;
		tt_1_1_io_update_old_ctr_1_REG <= s1_update_bits_meta[21:19];
		tt_1_1_io_update_u_mask_1_REG <= (_GEN_92 ? (_GEN_94 ? _GEN_111 | _GEN_55 : _GEN_176 | _GEN_55) : _GEN_55);
		tt_1_1_io_update_u_1_REG <= (_GEN_92 & (_GEN_94 ? _GEN_111 : _GEN_176) ? 2'h0 : new_u_1);
		tt_1_1_io_update_mask_2_REG <= _GEN_114 | _GEN_71;
		tt_1_1_io_update_taken_2_REG <= (_GEN_114 | _GEN_155) & s1_update_bits_cfi_taken;
		tt_1_1_io_update_alloc_2_REG <= _GEN_158 & _GEN_103;
		tt_1_1_io_update_old_ctr_2_REG <= s1_update_bits_meta[24:22];
		tt_1_1_io_update_u_mask_2_REG <= (_GEN_92 ? (_GEN_94 ? _GEN_113 | _GEN_71 : _GEN_177 | _GEN_71) : _GEN_71);
		tt_1_1_io_update_u_2_REG <= (_GEN_92 & (_GEN_94 ? _GEN_113 : _GEN_177) ? 2'h0 : new_u_2);
		tt_1_1_io_update_mask_3_REG <= _GEN_116 | _GEN_87;
		tt_1_1_io_update_taken_3_REG <= (_GEN_116 | _GEN_156) & s1_update_bits_cfi_taken;
		tt_1_1_io_update_alloc_3_REG <= _GEN_158 & (&s1_update_bits_cfi_idx_bits);
		tt_1_1_io_update_old_ctr_3_REG <= s1_update_bits_meta[27:25];
		tt_1_1_io_update_u_mask_3_REG <= (_GEN_92 ? (_GEN_94 ? _GEN_115 | _GEN_87 : _GEN_178 | _GEN_87) : _GEN_87);
		tt_1_1_io_update_u_3_REG <= (_GEN_92 & (_GEN_94 ? _GEN_115 : _GEN_178) ? 2'h0 : new_u_3);
		tt_1_1_io_update_pc_REG <= s1_update_bits_pc;
		tt_1_1_io_update_hist_REG <= s1_update_bits_ghist;
		tt_2_1_io_update_mask_0_REG <= _GEN_119 | _GEN_40;
		tt_2_1_io_update_taken_0_REG <= (_GEN_119 | _GEN_153) & s1_update_bits_cfi_taken;
		tt_2_1_io_update_alloc_0_REG <= _GEN_159 & ~(|s1_update_bits_cfi_idx_bits);
		tt_2_1_io_update_old_ctr_0_REG <= s1_update_bits_meta[18:16];
		tt_2_1_io_update_u_mask_0_REG <= (_GEN_92 ? (_GEN_94 ? _GEN_118 | _GEN_40 : _GEN_179 | _GEN_40) : _GEN_40);
		tt_2_1_io_update_u_0_REG <= (_GEN_92 & (_GEN_94 ? _GEN_118 : _GEN_179) ? 2'h0 : new_u);
		tt_2_1_io_update_mask_1_REG <= _GEN_121 | _GEN_56;
		tt_2_1_io_update_taken_1_REG <= (_GEN_121 | _GEN_154) & s1_update_bits_cfi_taken;
		tt_2_1_io_update_alloc_1_REG <= _GEN_159 & _GEN_100;
		tt_2_1_io_update_old_ctr_1_REG <= s1_update_bits_meta[21:19];
		tt_2_1_io_update_u_mask_1_REG <= (_GEN_92 ? (_GEN_94 ? _GEN_120 | _GEN_56 : _GEN_180 | _GEN_56) : _GEN_56);
		tt_2_1_io_update_u_1_REG <= (_GEN_92 & (_GEN_94 ? _GEN_120 : _GEN_180) ? 2'h0 : new_u_1);
		tt_2_1_io_update_mask_2_REG <= _GEN_123 | _GEN_72;
		tt_2_1_io_update_taken_2_REG <= (_GEN_123 | _GEN_155) & s1_update_bits_cfi_taken;
		tt_2_1_io_update_alloc_2_REG <= _GEN_159 & _GEN_103;
		tt_2_1_io_update_old_ctr_2_REG <= s1_update_bits_meta[24:22];
		tt_2_1_io_update_u_mask_2_REG <= (_GEN_92 ? (_GEN_94 ? _GEN_122 | _GEN_72 : _GEN_181 | _GEN_72) : _GEN_72);
		tt_2_1_io_update_u_2_REG <= (_GEN_92 & (_GEN_94 ? _GEN_122 : _GEN_181) ? 2'h0 : new_u_2);
		tt_2_1_io_update_mask_3_REG <= _GEN_125 | _GEN_88;
		tt_2_1_io_update_taken_3_REG <= (_GEN_125 | _GEN_156) & s1_update_bits_cfi_taken;
		tt_2_1_io_update_alloc_3_REG <= _GEN_159 & (&s1_update_bits_cfi_idx_bits);
		tt_2_1_io_update_old_ctr_3_REG <= s1_update_bits_meta[27:25];
		tt_2_1_io_update_u_mask_3_REG <= (_GEN_92 ? (_GEN_94 ? _GEN_124 | _GEN_88 : _GEN_182 | _GEN_88) : _GEN_88);
		tt_2_1_io_update_u_3_REG <= (_GEN_92 & (_GEN_94 ? _GEN_124 : _GEN_182) ? 2'h0 : new_u_3);
		tt_2_1_io_update_pc_REG <= s1_update_bits_pc;
		tt_2_1_io_update_hist_REG <= s1_update_bits_ghist;
		tt_3_1_io_update_mask_0_REG <= _GEN_128 | _GEN_41;
		tt_3_1_io_update_taken_0_REG <= (_GEN_128 | _GEN_153) & s1_update_bits_cfi_taken;
		tt_3_1_io_update_alloc_0_REG <= _GEN_160 & ~(|s1_update_bits_cfi_idx_bits);
		tt_3_1_io_update_old_ctr_0_REG <= s1_update_bits_meta[18:16];
		tt_3_1_io_update_u_mask_0_REG <= (_GEN_92 ? (_GEN_94 ? _GEN_127 | _GEN_41 : _GEN_183 | _GEN_41) : _GEN_41);
		tt_3_1_io_update_u_0_REG <= (_GEN_92 & (_GEN_94 ? _GEN_127 : _GEN_183) ? 2'h0 : new_u);
		tt_3_1_io_update_mask_1_REG <= _GEN_130 | _GEN_57;
		tt_3_1_io_update_taken_1_REG <= (_GEN_130 | _GEN_154) & s1_update_bits_cfi_taken;
		tt_3_1_io_update_alloc_1_REG <= _GEN_160 & _GEN_100;
		tt_3_1_io_update_old_ctr_1_REG <= s1_update_bits_meta[21:19];
		tt_3_1_io_update_u_mask_1_REG <= (_GEN_92 ? (_GEN_94 ? _GEN_129 | _GEN_57 : _GEN_184 | _GEN_57) : _GEN_57);
		tt_3_1_io_update_u_1_REG <= (_GEN_92 & (_GEN_94 ? _GEN_129 : _GEN_184) ? 2'h0 : new_u_1);
		tt_3_1_io_update_mask_2_REG <= _GEN_132 | _GEN_73;
		tt_3_1_io_update_taken_2_REG <= (_GEN_132 | _GEN_155) & s1_update_bits_cfi_taken;
		tt_3_1_io_update_alloc_2_REG <= _GEN_160 & _GEN_103;
		tt_3_1_io_update_old_ctr_2_REG <= s1_update_bits_meta[24:22];
		tt_3_1_io_update_u_mask_2_REG <= (_GEN_92 ? (_GEN_94 ? _GEN_131 | _GEN_73 : _GEN_185 | _GEN_73) : _GEN_73);
		tt_3_1_io_update_u_2_REG <= (_GEN_92 & (_GEN_94 ? _GEN_131 : _GEN_185) ? 2'h0 : new_u_2);
		tt_3_1_io_update_mask_3_REG <= _GEN_134 | _GEN_89;
		tt_3_1_io_update_taken_3_REG <= (_GEN_134 | _GEN_156) & s1_update_bits_cfi_taken;
		tt_3_1_io_update_alloc_3_REG <= _GEN_160 & (&s1_update_bits_cfi_idx_bits);
		tt_3_1_io_update_old_ctr_3_REG <= s1_update_bits_meta[27:25];
		tt_3_1_io_update_u_mask_3_REG <= (_GEN_92 ? (_GEN_94 ? _GEN_133 | _GEN_89 : _GEN_186 | _GEN_89) : _GEN_89);
		tt_3_1_io_update_u_3_REG <= (_GEN_92 & (_GEN_94 ? _GEN_133 : _GEN_186) ? 2'h0 : new_u_3);
		tt_3_1_io_update_pc_REG <= s1_update_bits_pc;
		tt_3_1_io_update_hist_REG <= s1_update_bits_ghist;
		tt_4_1_io_update_mask_0_REG <= _GEN_137 | _GEN_42;
		tt_4_1_io_update_taken_0_REG <= (_GEN_137 | _GEN_153) & s1_update_bits_cfi_taken;
		tt_4_1_io_update_alloc_0_REG <= _GEN_161 & ~(|s1_update_bits_cfi_idx_bits);
		tt_4_1_io_update_old_ctr_0_REG <= s1_update_bits_meta[18:16];
		tt_4_1_io_update_u_mask_0_REG <= (_GEN_92 ? (_GEN_94 ? _GEN_136 | _GEN_42 : _GEN_187 | _GEN_42) : _GEN_42);
		tt_4_1_io_update_u_0_REG <= (_GEN_92 & (_GEN_94 ? _GEN_136 : _GEN_187) ? 2'h0 : new_u);
		tt_4_1_io_update_mask_1_REG <= _GEN_139 | _GEN_58;
		tt_4_1_io_update_taken_1_REG <= (_GEN_139 | _GEN_154) & s1_update_bits_cfi_taken;
		tt_4_1_io_update_alloc_1_REG <= _GEN_161 & _GEN_100;
		tt_4_1_io_update_old_ctr_1_REG <= s1_update_bits_meta[21:19];
		tt_4_1_io_update_u_mask_1_REG <= (_GEN_92 ? (_GEN_94 ? _GEN_138 | _GEN_58 : _GEN_188 | _GEN_58) : _GEN_58);
		tt_4_1_io_update_u_1_REG <= (_GEN_92 & (_GEN_94 ? _GEN_138 : _GEN_188) ? 2'h0 : new_u_1);
		tt_4_1_io_update_mask_2_REG <= _GEN_141 | _GEN_74;
		tt_4_1_io_update_taken_2_REG <= (_GEN_141 | _GEN_155) & s1_update_bits_cfi_taken;
		tt_4_1_io_update_alloc_2_REG <= _GEN_161 & _GEN_103;
		tt_4_1_io_update_old_ctr_2_REG <= s1_update_bits_meta[24:22];
		tt_4_1_io_update_u_mask_2_REG <= (_GEN_92 ? (_GEN_94 ? _GEN_140 | _GEN_74 : _GEN_189 | _GEN_74) : _GEN_74);
		tt_4_1_io_update_u_2_REG <= (_GEN_92 & (_GEN_94 ? _GEN_140 : _GEN_189) ? 2'h0 : new_u_2);
		tt_4_1_io_update_mask_3_REG <= _GEN_143 | _GEN_90;
		tt_4_1_io_update_taken_3_REG <= (_GEN_143 | _GEN_156) & s1_update_bits_cfi_taken;
		tt_4_1_io_update_alloc_3_REG <= _GEN_161 & (&s1_update_bits_cfi_idx_bits);
		tt_4_1_io_update_old_ctr_3_REG <= s1_update_bits_meta[27:25];
		tt_4_1_io_update_u_mask_3_REG <= (_GEN_92 ? (_GEN_94 ? _GEN_142 | _GEN_90 : _GEN_190 | _GEN_90) : _GEN_90);
		tt_4_1_io_update_u_3_REG <= (_GEN_92 & (_GEN_94 ? _GEN_142 : _GEN_190) ? 2'h0 : new_u_3);
		tt_4_1_io_update_pc_REG <= s1_update_bits_pc;
		tt_4_1_io_update_hist_REG <= s1_update_bits_ghist;
		tt_5_1_io_update_mask_0_REG <= _GEN_146 | _GEN_43;
		tt_5_1_io_update_taken_0_REG <= (_GEN_146 | _GEN_153) & s1_update_bits_cfi_taken;
		tt_5_1_io_update_alloc_0_REG <= _GEN_162 & ~(|s1_update_bits_cfi_idx_bits);
		tt_5_1_io_update_old_ctr_0_REG <= s1_update_bits_meta[18:16];
		tt_5_1_io_update_u_mask_0_REG <= (_GEN_92 ? (_GEN_94 ? _GEN_145 | _GEN_43 : _GEN_191 | _GEN_43) : _GEN_43);
		tt_5_1_io_update_u_0_REG <= (_GEN_92 & (_GEN_94 ? _GEN_145 : _GEN_191) ? 2'h0 : new_u);
		tt_5_1_io_update_mask_1_REG <= _GEN_148 | _GEN_59;
		tt_5_1_io_update_taken_1_REG <= (_GEN_148 | _GEN_154) & s1_update_bits_cfi_taken;
		tt_5_1_io_update_alloc_1_REG <= _GEN_162 & _GEN_100;
		tt_5_1_io_update_old_ctr_1_REG <= s1_update_bits_meta[21:19];
		tt_5_1_io_update_u_mask_1_REG <= (_GEN_92 ? (_GEN_94 ? _GEN_147 | _GEN_59 : _GEN_192 | _GEN_59) : _GEN_59);
		tt_5_1_io_update_u_1_REG <= (_GEN_92 & (_GEN_94 ? _GEN_147 : _GEN_192) ? 2'h0 : new_u_1);
		tt_5_1_io_update_mask_2_REG <= _GEN_150 | _GEN_75;
		tt_5_1_io_update_taken_2_REG <= (_GEN_150 | _GEN_155) & s1_update_bits_cfi_taken;
		tt_5_1_io_update_alloc_2_REG <= _GEN_162 & _GEN_103;
		tt_5_1_io_update_old_ctr_2_REG <= s1_update_bits_meta[24:22];
		tt_5_1_io_update_u_mask_2_REG <= (_GEN_92 ? (_GEN_94 ? _GEN_149 | _GEN_75 : _GEN_193 | _GEN_75) : _GEN_75);
		tt_5_1_io_update_u_2_REG <= (_GEN_92 & (_GEN_94 ? _GEN_149 : _GEN_193) ? 2'h0 : new_u_2);
		tt_5_1_io_update_mask_3_REG <= _GEN_152 | _GEN_91;
		tt_5_1_io_update_taken_3_REG <= (_GEN_152 | _GEN_156) & s1_update_bits_cfi_taken;
		tt_5_1_io_update_alloc_3_REG <= _GEN_162 & (&s1_update_bits_cfi_idx_bits);
		tt_5_1_io_update_old_ctr_3_REG <= s1_update_bits_meta[27:25];
		tt_5_1_io_update_u_mask_3_REG <= (_GEN_92 ? (_GEN_94 ? _GEN_151 | _GEN_91 : _GEN_194 | _GEN_91) : _GEN_91);
		tt_5_1_io_update_u_3_REG <= (_GEN_92 & (_GEN_94 ? _GEN_151 : _GEN_194) ? 2'h0 : new_u_3);
		tt_5_1_io_update_pc_REG <= s1_update_bits_pc;
		tt_5_1_io_update_hist_REG <= s1_update_bits_ghist;
	end
	TageTable tt_0_1(
		.clock(clock),
		.reset(reset),
		.io_f1_req_valid(t_io_f1_req_valid_REG),
		.io_f1_req_pc(t_io_f1_req_pc_REG),
		.io_f1_req_ghist(io_f1_ghist),
		.io_f2_resp_0_valid(_tt_0_1_io_f2_resp_0_valid),
		.io_f2_resp_0_bits_ctr(_tt_0_1_io_f2_resp_0_bits_ctr),
		.io_f2_resp_0_bits_u(_tt_0_1_io_f2_resp_0_bits_u),
		.io_f2_resp_1_valid(_tt_0_1_io_f2_resp_1_valid),
		.io_f2_resp_1_bits_ctr(_tt_0_1_io_f2_resp_1_bits_ctr),
		.io_f2_resp_1_bits_u(_tt_0_1_io_f2_resp_1_bits_u),
		.io_f2_resp_2_valid(_tt_0_1_io_f2_resp_2_valid),
		.io_f2_resp_2_bits_ctr(_tt_0_1_io_f2_resp_2_bits_ctr),
		.io_f2_resp_2_bits_u(_tt_0_1_io_f2_resp_2_bits_u),
		.io_f2_resp_3_valid(_tt_0_1_io_f2_resp_3_valid),
		.io_f2_resp_3_bits_ctr(_tt_0_1_io_f2_resp_3_bits_ctr),
		.io_f2_resp_3_bits_u(_tt_0_1_io_f2_resp_3_bits_u),
		.io_update_mask_0(tt_0_1_io_update_mask_0_REG),
		.io_update_mask_1(tt_0_1_io_update_mask_1_REG),
		.io_update_mask_2(tt_0_1_io_update_mask_2_REG),
		.io_update_mask_3(tt_0_1_io_update_mask_3_REG),
		.io_update_taken_0(tt_0_1_io_update_taken_0_REG),
		.io_update_taken_1(tt_0_1_io_update_taken_1_REG),
		.io_update_taken_2(tt_0_1_io_update_taken_2_REG),
		.io_update_taken_3(tt_0_1_io_update_taken_3_REG),
		.io_update_alloc_0(tt_0_1_io_update_alloc_0_REG),
		.io_update_alloc_1(tt_0_1_io_update_alloc_1_REG),
		.io_update_alloc_2(tt_0_1_io_update_alloc_2_REG),
		.io_update_alloc_3(tt_0_1_io_update_alloc_3_REG),
		.io_update_old_ctr_0(tt_0_1_io_update_old_ctr_0_REG),
		.io_update_old_ctr_1(tt_0_1_io_update_old_ctr_1_REG),
		.io_update_old_ctr_2(tt_0_1_io_update_old_ctr_2_REG),
		.io_update_old_ctr_3(tt_0_1_io_update_old_ctr_3_REG),
		.io_update_pc(tt_0_1_io_update_pc_REG),
		.io_update_hist(tt_0_1_io_update_hist_REG),
		.io_update_u_mask_0(tt_0_1_io_update_u_mask_0_REG),
		.io_update_u_mask_1(tt_0_1_io_update_u_mask_1_REG),
		.io_update_u_mask_2(tt_0_1_io_update_u_mask_2_REG),
		.io_update_u_mask_3(tt_0_1_io_update_u_mask_3_REG),
		.io_update_u_0(tt_0_1_io_update_u_0_REG),
		.io_update_u_1(tt_0_1_io_update_u_1_REG),
		.io_update_u_2(tt_0_1_io_update_u_2_REG),
		.io_update_u_3(tt_0_1_io_update_u_3_REG)
	);
	TageTable_1 tt_1_1(
		.clock(clock),
		.reset(reset),
		.io_f1_req_valid(t_io_f1_req_valid_REG_1),
		.io_f1_req_pc(t_io_f1_req_pc_REG_1),
		.io_f1_req_ghist(io_f1_ghist),
		.io_f2_resp_0_valid(_tt_1_1_io_f2_resp_0_valid),
		.io_f2_resp_0_bits_ctr(_tt_1_1_io_f2_resp_0_bits_ctr),
		.io_f2_resp_0_bits_u(_tt_1_1_io_f2_resp_0_bits_u),
		.io_f2_resp_1_valid(_tt_1_1_io_f2_resp_1_valid),
		.io_f2_resp_1_bits_ctr(_tt_1_1_io_f2_resp_1_bits_ctr),
		.io_f2_resp_1_bits_u(_tt_1_1_io_f2_resp_1_bits_u),
		.io_f2_resp_2_valid(_tt_1_1_io_f2_resp_2_valid),
		.io_f2_resp_2_bits_ctr(_tt_1_1_io_f2_resp_2_bits_ctr),
		.io_f2_resp_2_bits_u(_tt_1_1_io_f2_resp_2_bits_u),
		.io_f2_resp_3_valid(_tt_1_1_io_f2_resp_3_valid),
		.io_f2_resp_3_bits_ctr(_tt_1_1_io_f2_resp_3_bits_ctr),
		.io_f2_resp_3_bits_u(_tt_1_1_io_f2_resp_3_bits_u),
		.io_update_mask_0(tt_1_1_io_update_mask_0_REG),
		.io_update_mask_1(tt_1_1_io_update_mask_1_REG),
		.io_update_mask_2(tt_1_1_io_update_mask_2_REG),
		.io_update_mask_3(tt_1_1_io_update_mask_3_REG),
		.io_update_taken_0(tt_1_1_io_update_taken_0_REG),
		.io_update_taken_1(tt_1_1_io_update_taken_1_REG),
		.io_update_taken_2(tt_1_1_io_update_taken_2_REG),
		.io_update_taken_3(tt_1_1_io_update_taken_3_REG),
		.io_update_alloc_0(tt_1_1_io_update_alloc_0_REG),
		.io_update_alloc_1(tt_1_1_io_update_alloc_1_REG),
		.io_update_alloc_2(tt_1_1_io_update_alloc_2_REG),
		.io_update_alloc_3(tt_1_1_io_update_alloc_3_REG),
		.io_update_old_ctr_0(tt_1_1_io_update_old_ctr_0_REG),
		.io_update_old_ctr_1(tt_1_1_io_update_old_ctr_1_REG),
		.io_update_old_ctr_2(tt_1_1_io_update_old_ctr_2_REG),
		.io_update_old_ctr_3(tt_1_1_io_update_old_ctr_3_REG),
		.io_update_pc(tt_1_1_io_update_pc_REG),
		.io_update_hist(tt_1_1_io_update_hist_REG),
		.io_update_u_mask_0(tt_1_1_io_update_u_mask_0_REG),
		.io_update_u_mask_1(tt_1_1_io_update_u_mask_1_REG),
		.io_update_u_mask_2(tt_1_1_io_update_u_mask_2_REG),
		.io_update_u_mask_3(tt_1_1_io_update_u_mask_3_REG),
		.io_update_u_0(tt_1_1_io_update_u_0_REG),
		.io_update_u_1(tt_1_1_io_update_u_1_REG),
		.io_update_u_2(tt_1_1_io_update_u_2_REG),
		.io_update_u_3(tt_1_1_io_update_u_3_REG)
	);
	TageTable_2 tt_2_1(
		.clock(clock),
		.reset(reset),
		.io_f1_req_valid(t_io_f1_req_valid_REG_2),
		.io_f1_req_pc(t_io_f1_req_pc_REG_2),
		.io_f1_req_ghist(io_f1_ghist),
		.io_f2_resp_0_valid(_tt_2_1_io_f2_resp_0_valid),
		.io_f2_resp_0_bits_ctr(_tt_2_1_io_f2_resp_0_bits_ctr),
		.io_f2_resp_0_bits_u(_tt_2_1_io_f2_resp_0_bits_u),
		.io_f2_resp_1_valid(_tt_2_1_io_f2_resp_1_valid),
		.io_f2_resp_1_bits_ctr(_tt_2_1_io_f2_resp_1_bits_ctr),
		.io_f2_resp_1_bits_u(_tt_2_1_io_f2_resp_1_bits_u),
		.io_f2_resp_2_valid(_tt_2_1_io_f2_resp_2_valid),
		.io_f2_resp_2_bits_ctr(_tt_2_1_io_f2_resp_2_bits_ctr),
		.io_f2_resp_2_bits_u(_tt_2_1_io_f2_resp_2_bits_u),
		.io_f2_resp_3_valid(_tt_2_1_io_f2_resp_3_valid),
		.io_f2_resp_3_bits_ctr(_tt_2_1_io_f2_resp_3_bits_ctr),
		.io_f2_resp_3_bits_u(_tt_2_1_io_f2_resp_3_bits_u),
		.io_update_mask_0(tt_2_1_io_update_mask_0_REG),
		.io_update_mask_1(tt_2_1_io_update_mask_1_REG),
		.io_update_mask_2(tt_2_1_io_update_mask_2_REG),
		.io_update_mask_3(tt_2_1_io_update_mask_3_REG),
		.io_update_taken_0(tt_2_1_io_update_taken_0_REG),
		.io_update_taken_1(tt_2_1_io_update_taken_1_REG),
		.io_update_taken_2(tt_2_1_io_update_taken_2_REG),
		.io_update_taken_3(tt_2_1_io_update_taken_3_REG),
		.io_update_alloc_0(tt_2_1_io_update_alloc_0_REG),
		.io_update_alloc_1(tt_2_1_io_update_alloc_1_REG),
		.io_update_alloc_2(tt_2_1_io_update_alloc_2_REG),
		.io_update_alloc_3(tt_2_1_io_update_alloc_3_REG),
		.io_update_old_ctr_0(tt_2_1_io_update_old_ctr_0_REG),
		.io_update_old_ctr_1(tt_2_1_io_update_old_ctr_1_REG),
		.io_update_old_ctr_2(tt_2_1_io_update_old_ctr_2_REG),
		.io_update_old_ctr_3(tt_2_1_io_update_old_ctr_3_REG),
		.io_update_pc(tt_2_1_io_update_pc_REG),
		.io_update_hist(tt_2_1_io_update_hist_REG),
		.io_update_u_mask_0(tt_2_1_io_update_u_mask_0_REG),
		.io_update_u_mask_1(tt_2_1_io_update_u_mask_1_REG),
		.io_update_u_mask_2(tt_2_1_io_update_u_mask_2_REG),
		.io_update_u_mask_3(tt_2_1_io_update_u_mask_3_REG),
		.io_update_u_0(tt_2_1_io_update_u_0_REG),
		.io_update_u_1(tt_2_1_io_update_u_1_REG),
		.io_update_u_2(tt_2_1_io_update_u_2_REG),
		.io_update_u_3(tt_2_1_io_update_u_3_REG)
	);
	TageTable_3 tt_3_1(
		.clock(clock),
		.reset(reset),
		.io_f1_req_valid(t_io_f1_req_valid_REG_3),
		.io_f1_req_pc(t_io_f1_req_pc_REG_3),
		.io_f1_req_ghist(io_f1_ghist),
		.io_f2_resp_0_valid(_tt_3_1_io_f2_resp_0_valid),
		.io_f2_resp_0_bits_ctr(_tt_3_1_io_f2_resp_0_bits_ctr),
		.io_f2_resp_0_bits_u(_tt_3_1_io_f2_resp_0_bits_u),
		.io_f2_resp_1_valid(_tt_3_1_io_f2_resp_1_valid),
		.io_f2_resp_1_bits_ctr(_tt_3_1_io_f2_resp_1_bits_ctr),
		.io_f2_resp_1_bits_u(_tt_3_1_io_f2_resp_1_bits_u),
		.io_f2_resp_2_valid(_tt_3_1_io_f2_resp_2_valid),
		.io_f2_resp_2_bits_ctr(_tt_3_1_io_f2_resp_2_bits_ctr),
		.io_f2_resp_2_bits_u(_tt_3_1_io_f2_resp_2_bits_u),
		.io_f2_resp_3_valid(_tt_3_1_io_f2_resp_3_valid),
		.io_f2_resp_3_bits_ctr(_tt_3_1_io_f2_resp_3_bits_ctr),
		.io_f2_resp_3_bits_u(_tt_3_1_io_f2_resp_3_bits_u),
		.io_update_mask_0(tt_3_1_io_update_mask_0_REG),
		.io_update_mask_1(tt_3_1_io_update_mask_1_REG),
		.io_update_mask_2(tt_3_1_io_update_mask_2_REG),
		.io_update_mask_3(tt_3_1_io_update_mask_3_REG),
		.io_update_taken_0(tt_3_1_io_update_taken_0_REG),
		.io_update_taken_1(tt_3_1_io_update_taken_1_REG),
		.io_update_taken_2(tt_3_1_io_update_taken_2_REG),
		.io_update_taken_3(tt_3_1_io_update_taken_3_REG),
		.io_update_alloc_0(tt_3_1_io_update_alloc_0_REG),
		.io_update_alloc_1(tt_3_1_io_update_alloc_1_REG),
		.io_update_alloc_2(tt_3_1_io_update_alloc_2_REG),
		.io_update_alloc_3(tt_3_1_io_update_alloc_3_REG),
		.io_update_old_ctr_0(tt_3_1_io_update_old_ctr_0_REG),
		.io_update_old_ctr_1(tt_3_1_io_update_old_ctr_1_REG),
		.io_update_old_ctr_2(tt_3_1_io_update_old_ctr_2_REG),
		.io_update_old_ctr_3(tt_3_1_io_update_old_ctr_3_REG),
		.io_update_pc(tt_3_1_io_update_pc_REG),
		.io_update_hist(tt_3_1_io_update_hist_REG),
		.io_update_u_mask_0(tt_3_1_io_update_u_mask_0_REG),
		.io_update_u_mask_1(tt_3_1_io_update_u_mask_1_REG),
		.io_update_u_mask_2(tt_3_1_io_update_u_mask_2_REG),
		.io_update_u_mask_3(tt_3_1_io_update_u_mask_3_REG),
		.io_update_u_0(tt_3_1_io_update_u_0_REG),
		.io_update_u_1(tt_3_1_io_update_u_1_REG),
		.io_update_u_2(tt_3_1_io_update_u_2_REG),
		.io_update_u_3(tt_3_1_io_update_u_3_REG)
	);
	TageTable_4 tt_4_1(
		.clock(clock),
		.reset(reset),
		.io_f1_req_valid(t_io_f1_req_valid_REG_4),
		.io_f1_req_pc(t_io_f1_req_pc_REG_4),
		.io_f1_req_ghist(io_f1_ghist),
		.io_f2_resp_0_valid(_tt_4_1_io_f2_resp_0_valid),
		.io_f2_resp_0_bits_ctr(_tt_4_1_io_f2_resp_0_bits_ctr),
		.io_f2_resp_0_bits_u(_tt_4_1_io_f2_resp_0_bits_u),
		.io_f2_resp_1_valid(_tt_4_1_io_f2_resp_1_valid),
		.io_f2_resp_1_bits_ctr(_tt_4_1_io_f2_resp_1_bits_ctr),
		.io_f2_resp_1_bits_u(_tt_4_1_io_f2_resp_1_bits_u),
		.io_f2_resp_2_valid(_tt_4_1_io_f2_resp_2_valid),
		.io_f2_resp_2_bits_ctr(_tt_4_1_io_f2_resp_2_bits_ctr),
		.io_f2_resp_2_bits_u(_tt_4_1_io_f2_resp_2_bits_u),
		.io_f2_resp_3_valid(_tt_4_1_io_f2_resp_3_valid),
		.io_f2_resp_3_bits_ctr(_tt_4_1_io_f2_resp_3_bits_ctr),
		.io_f2_resp_3_bits_u(_tt_4_1_io_f2_resp_3_bits_u),
		.io_update_mask_0(tt_4_1_io_update_mask_0_REG),
		.io_update_mask_1(tt_4_1_io_update_mask_1_REG),
		.io_update_mask_2(tt_4_1_io_update_mask_2_REG),
		.io_update_mask_3(tt_4_1_io_update_mask_3_REG),
		.io_update_taken_0(tt_4_1_io_update_taken_0_REG),
		.io_update_taken_1(tt_4_1_io_update_taken_1_REG),
		.io_update_taken_2(tt_4_1_io_update_taken_2_REG),
		.io_update_taken_3(tt_4_1_io_update_taken_3_REG),
		.io_update_alloc_0(tt_4_1_io_update_alloc_0_REG),
		.io_update_alloc_1(tt_4_1_io_update_alloc_1_REG),
		.io_update_alloc_2(tt_4_1_io_update_alloc_2_REG),
		.io_update_alloc_3(tt_4_1_io_update_alloc_3_REG),
		.io_update_old_ctr_0(tt_4_1_io_update_old_ctr_0_REG),
		.io_update_old_ctr_1(tt_4_1_io_update_old_ctr_1_REG),
		.io_update_old_ctr_2(tt_4_1_io_update_old_ctr_2_REG),
		.io_update_old_ctr_3(tt_4_1_io_update_old_ctr_3_REG),
		.io_update_pc(tt_4_1_io_update_pc_REG),
		.io_update_hist(tt_4_1_io_update_hist_REG),
		.io_update_u_mask_0(tt_4_1_io_update_u_mask_0_REG),
		.io_update_u_mask_1(tt_4_1_io_update_u_mask_1_REG),
		.io_update_u_mask_2(tt_4_1_io_update_u_mask_2_REG),
		.io_update_u_mask_3(tt_4_1_io_update_u_mask_3_REG),
		.io_update_u_0(tt_4_1_io_update_u_0_REG),
		.io_update_u_1(tt_4_1_io_update_u_1_REG),
		.io_update_u_2(tt_4_1_io_update_u_2_REG),
		.io_update_u_3(tt_4_1_io_update_u_3_REG)
	);
	TageTable_5 tt_5_1(
		.clock(clock),
		.reset(reset),
		.io_f1_req_valid(t_io_f1_req_valid_REG_5),
		.io_f1_req_pc(t_io_f1_req_pc_REG_5),
		.io_f1_req_ghist(io_f1_ghist),
		.io_f2_resp_0_valid(_tt_5_1_io_f2_resp_0_valid),
		.io_f2_resp_0_bits_ctr(_tt_5_1_io_f2_resp_0_bits_ctr),
		.io_f2_resp_0_bits_u(_tt_5_1_io_f2_resp_0_bits_u),
		.io_f2_resp_1_valid(_tt_5_1_io_f2_resp_1_valid),
		.io_f2_resp_1_bits_ctr(_tt_5_1_io_f2_resp_1_bits_ctr),
		.io_f2_resp_1_bits_u(_tt_5_1_io_f2_resp_1_bits_u),
		.io_f2_resp_2_valid(_tt_5_1_io_f2_resp_2_valid),
		.io_f2_resp_2_bits_ctr(_tt_5_1_io_f2_resp_2_bits_ctr),
		.io_f2_resp_2_bits_u(_tt_5_1_io_f2_resp_2_bits_u),
		.io_f2_resp_3_valid(_tt_5_1_io_f2_resp_3_valid),
		.io_f2_resp_3_bits_ctr(_tt_5_1_io_f2_resp_3_bits_ctr),
		.io_f2_resp_3_bits_u(_tt_5_1_io_f2_resp_3_bits_u),
		.io_update_mask_0(tt_5_1_io_update_mask_0_REG),
		.io_update_mask_1(tt_5_1_io_update_mask_1_REG),
		.io_update_mask_2(tt_5_1_io_update_mask_2_REG),
		.io_update_mask_3(tt_5_1_io_update_mask_3_REG),
		.io_update_taken_0(tt_5_1_io_update_taken_0_REG),
		.io_update_taken_1(tt_5_1_io_update_taken_1_REG),
		.io_update_taken_2(tt_5_1_io_update_taken_2_REG),
		.io_update_taken_3(tt_5_1_io_update_taken_3_REG),
		.io_update_alloc_0(tt_5_1_io_update_alloc_0_REG),
		.io_update_alloc_1(tt_5_1_io_update_alloc_1_REG),
		.io_update_alloc_2(tt_5_1_io_update_alloc_2_REG),
		.io_update_alloc_3(tt_5_1_io_update_alloc_3_REG),
		.io_update_old_ctr_0(tt_5_1_io_update_old_ctr_0_REG),
		.io_update_old_ctr_1(tt_5_1_io_update_old_ctr_1_REG),
		.io_update_old_ctr_2(tt_5_1_io_update_old_ctr_2_REG),
		.io_update_old_ctr_3(tt_5_1_io_update_old_ctr_3_REG),
		.io_update_pc(tt_5_1_io_update_pc_REG),
		.io_update_hist(tt_5_1_io_update_hist_REG),
		.io_update_u_mask_0(tt_5_1_io_update_u_mask_0_REG),
		.io_update_u_mask_1(tt_5_1_io_update_u_mask_1_REG),
		.io_update_u_mask_2(tt_5_1_io_update_u_mask_2_REG),
		.io_update_u_mask_3(tt_5_1_io_update_u_mask_3_REG),
		.io_update_u_0(tt_5_1_io_update_u_0_REG),
		.io_update_u_1(tt_5_1_io_update_u_1_REG),
		.io_update_u_2(tt_5_1_io_update_u_2_REG),
		.io_update_u_3(tt_5_1_io_update_u_3_REG)
	);
	MaxPeriodFibonacciLFSR_2 alloc_lfsr_prng(
		.clock(clock),
		.reset(reset),
		.io_out_0(_alloc_lfsr_prng_io_out_0),
		.io_out_1(_alloc_lfsr_prng_io_out_1),
		.io_out_2(_alloc_lfsr_prng_io_out_2),
		.io_out_3(_alloc_lfsr_prng_io_out_3),
		.io_out_4(_alloc_lfsr_prng_io_out_4),
		.io_out_5(_alloc_lfsr_prng_io_out_5)
	);
	MaxPeriodFibonacciLFSR_2 alloc_lfsr_prng_1(
		.clock(clock),
		.reset(reset),
		.io_out_0(_alloc_lfsr_prng_1_io_out_0),
		.io_out_1(_alloc_lfsr_prng_1_io_out_1),
		.io_out_2(_alloc_lfsr_prng_1_io_out_2),
		.io_out_3(_alloc_lfsr_prng_1_io_out_3),
		.io_out_4(_alloc_lfsr_prng_1_io_out_4),
		.io_out_5(_alloc_lfsr_prng_1_io_out_5)
	);
	MaxPeriodFibonacciLFSR_2 alloc_lfsr_prng_2(
		.clock(clock),
		.reset(reset),
		.io_out_0(_alloc_lfsr_prng_2_io_out_0),
		.io_out_1(_alloc_lfsr_prng_2_io_out_1),
		.io_out_2(_alloc_lfsr_prng_2_io_out_2),
		.io_out_3(_alloc_lfsr_prng_2_io_out_3),
		.io_out_4(_alloc_lfsr_prng_2_io_out_4),
		.io_out_5(_alloc_lfsr_prng_2_io_out_5)
	);
	MaxPeriodFibonacciLFSR_2 alloc_lfsr_prng_3(
		.clock(clock),
		.reset(reset),
		.io_out_0(_alloc_lfsr_prng_3_io_out_0),
		.io_out_1(_alloc_lfsr_prng_3_io_out_1),
		.io_out_2(_alloc_lfsr_prng_3_io_out_2),
		.io_out_3(_alloc_lfsr_prng_3_io_out_3),
		.io_out_4(_alloc_lfsr_prng_3_io_out_4),
		.io_out_5(_alloc_lfsr_prng_3_io_out_5)
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
	assign io_resp_f2_0_taken = io_resp_in_0_f2_0_taken;
	assign io_resp_f2_0_is_br = io_resp_in_0_f2_0_is_br;
	assign io_resp_f2_0_predicted_pc_valid = io_resp_in_0_f2_0_predicted_pc_valid;
	assign io_resp_f2_0_predicted_pc_bits = io_resp_in_0_f2_0_predicted_pc_bits;
	assign io_resp_f2_1_taken = io_resp_in_0_f2_1_taken;
	assign io_resp_f2_1_is_br = io_resp_in_0_f2_1_is_br;
	assign io_resp_f2_1_predicted_pc_valid = io_resp_in_0_f2_1_predicted_pc_valid;
	assign io_resp_f2_1_predicted_pc_bits = io_resp_in_0_f2_1_predicted_pc_bits;
	assign io_resp_f2_2_taken = io_resp_in_0_f2_2_taken;
	assign io_resp_f2_2_is_br = io_resp_in_0_f2_2_is_br;
	assign io_resp_f2_2_predicted_pc_valid = io_resp_in_0_f2_2_predicted_pc_valid;
	assign io_resp_f2_2_predicted_pc_bits = io_resp_in_0_f2_2_predicted_pc_bits;
	assign io_resp_f2_3_taken = io_resp_in_0_f2_3_taken;
	assign io_resp_f2_3_is_br = io_resp_in_0_f2_3_is_br;
	assign io_resp_f2_3_predicted_pc_valid = io_resp_in_0_f2_3_predicted_pc_valid;
	assign io_resp_f2_3_predicted_pc_bits = io_resp_in_0_f2_3_predicted_pc_bits;
	assign io_resp_f3_0_taken = io_resp_f3_0_taken_0;
	assign io_resp_f3_0_is_br = io_resp_in_0_f3_0_is_br;
	assign io_resp_f3_0_is_jal = io_resp_in_0_f3_0_is_jal;
	assign io_resp_f3_0_predicted_pc_valid = io_resp_in_0_f3_0_predicted_pc_valid;
	assign io_resp_f3_0_predicted_pc_bits = io_resp_in_0_f3_0_predicted_pc_bits;
	assign io_resp_f3_1_taken = io_resp_f3_1_taken_0;
	assign io_resp_f3_1_is_br = io_resp_in_0_f3_1_is_br;
	assign io_resp_f3_1_is_jal = io_resp_in_0_f3_1_is_jal;
	assign io_resp_f3_1_predicted_pc_valid = io_resp_in_0_f3_1_predicted_pc_valid;
	assign io_resp_f3_1_predicted_pc_bits = io_resp_in_0_f3_1_predicted_pc_bits;
	assign io_resp_f3_2_taken = io_resp_f3_2_taken_0;
	assign io_resp_f3_2_is_br = io_resp_in_0_f3_2_is_br;
	assign io_resp_f3_2_is_jal = io_resp_in_0_f3_2_is_jal;
	assign io_resp_f3_2_predicted_pc_valid = io_resp_in_0_f3_2_predicted_pc_valid;
	assign io_resp_f3_2_predicted_pc_bits = io_resp_in_0_f3_2_predicted_pc_bits;
	assign io_resp_f3_3_taken = io_resp_f3_3_taken_0;
	assign io_resp_f3_3_is_br = io_resp_in_0_f3_3_is_br;
	assign io_resp_f3_3_is_jal = io_resp_in_0_f3_3_is_jal;
	assign io_resp_f3_3_predicted_pc_valid = io_resp_in_0_f3_3_predicted_pc_valid;
	assign io_resp_f3_3_predicted_pc_bits = io_resp_in_0_f3_3_predicted_pc_bits;
	assign io_f3_meta = {64'h0000000000000000, s3_provided_3, s3_provider_3, s3_provided_2, s3_provider_2, s3_provided_1, s3_provider_1, s3_provided, s3_provider, s3_alt_provided_3 & (alt_3_ctr[2] != io_resp_f3_3_taken_0), s3_alt_provided_2 & (alt_2_ctr[2] != io_resp_f3_2_taken_0), s3_alt_provided_1 & (alt_1_ctr[2] != io_resp_f3_1_taken_0), s3_alt_provided & (alt_ctr[2] != io_resp_f3_0_taken_0), prov_3_u, prov_2_u, prov_1_u, prov_u, prov_3_ctr, prov_2_ctr, prov_1_ctr, prov_ctr, |_GEN_25, (_alloc_entry_T_6[0] ? masked_entry_3 : (_GEN_25[0] ? 3'h0 : (_GEN_25[1] ? 3'h1 : (_GEN_25[2] ? 3'h2 : (_GEN_25[3] ? 3'h3 : (_GEN_25[4] ? 3'h4 : {1'h1, ~_GEN_25[5], 1'h1})))))), |_GEN_18, (_alloc_entry_T_4[0] ? masked_entry_2 : (_GEN_18[0] ? 3'h0 : (_GEN_18[1] ? 3'h1 : (_GEN_18[2] ? 3'h2 : (_GEN_18[3] ? 3'h3 : (_GEN_18[4] ? 3'h4 : {1'h1, ~_GEN_18[5], 1'h1})))))), |_GEN_11, (_alloc_entry_T_2[0] ? masked_entry_1 : (_GEN_11[0] ? 3'h0 : (_GEN_11[1] ? 3'h1 : (_GEN_11[2] ? 3'h2 : (_GEN_11[3] ? 3'h3 : (_GEN_11[4] ? 3'h4 : {1'h1, ~_GEN_11[5], 1'h1})))))), |_GEN_4, (_alloc_entry_T[0] ? masked_entry : (_GEN_4[0] ? 3'h0 : (_GEN_4[1] ? 3'h1 : (_GEN_4[2] ? 3'h2 : (_GEN_4[3] ? 3'h3 : (_GEN_4[4] ? 3'h4 : {1'h1, ~_GEN_4[5], 1'h1}))))))};
endmodule
