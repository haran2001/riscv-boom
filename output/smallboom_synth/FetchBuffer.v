module FetchBuffer (
	clock,
	reset,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits_pc,
	io_enq_bits_edge_inst_0,
	io_enq_bits_insts_0,
	io_enq_bits_insts_1,
	io_enq_bits_insts_2,
	io_enq_bits_insts_3,
	io_enq_bits_exp_insts_0,
	io_enq_bits_exp_insts_1,
	io_enq_bits_exp_insts_2,
	io_enq_bits_exp_insts_3,
	io_enq_bits_sfbs_0,
	io_enq_bits_sfbs_1,
	io_enq_bits_sfbs_2,
	io_enq_bits_sfbs_3,
	io_enq_bits_shadowed_mask_0,
	io_enq_bits_shadowed_mask_1,
	io_enq_bits_shadowed_mask_2,
	io_enq_bits_shadowed_mask_3,
	io_enq_bits_cfi_idx_valid,
	io_enq_bits_cfi_idx_bits,
	io_enq_bits_ftq_idx,
	io_enq_bits_mask,
	io_enq_bits_xcpt_pf_if,
	io_enq_bits_xcpt_ae_if,
	io_enq_bits_bp_debug_if_oh_0,
	io_enq_bits_bp_debug_if_oh_1,
	io_enq_bits_bp_debug_if_oh_2,
	io_enq_bits_bp_debug_if_oh_3,
	io_enq_bits_bp_xcpt_if_oh_0,
	io_enq_bits_bp_xcpt_if_oh_1,
	io_enq_bits_bp_xcpt_if_oh_2,
	io_enq_bits_bp_xcpt_if_oh_3,
	io_enq_bits_fsrc,
	io_deq_ready,
	io_deq_valid,
	io_deq_bits_uops_0_valid,
	io_deq_bits_uops_0_bits_inst,
	io_deq_bits_uops_0_bits_debug_inst,
	io_deq_bits_uops_0_bits_is_rvc,
	io_deq_bits_uops_0_bits_debug_pc,
	io_deq_bits_uops_0_bits_is_sfb,
	io_deq_bits_uops_0_bits_ftq_idx,
	io_deq_bits_uops_0_bits_edge_inst,
	io_deq_bits_uops_0_bits_pc_lob,
	io_deq_bits_uops_0_bits_taken,
	io_deq_bits_uops_0_bits_xcpt_pf_if,
	io_deq_bits_uops_0_bits_xcpt_ae_if,
	io_deq_bits_uops_0_bits_bp_debug_if,
	io_deq_bits_uops_0_bits_bp_xcpt_if,
	io_deq_bits_uops_0_bits_debug_fsrc,
	io_clear
);
	input clock;
	input reset;
	output wire io_enq_ready;
	input io_enq_valid;
	input [39:0] io_enq_bits_pc;
	input io_enq_bits_edge_inst_0;
	input [31:0] io_enq_bits_insts_0;
	input [31:0] io_enq_bits_insts_1;
	input [31:0] io_enq_bits_insts_2;
	input [31:0] io_enq_bits_insts_3;
	input [31:0] io_enq_bits_exp_insts_0;
	input [31:0] io_enq_bits_exp_insts_1;
	input [31:0] io_enq_bits_exp_insts_2;
	input [31:0] io_enq_bits_exp_insts_3;
	input io_enq_bits_sfbs_0;
	input io_enq_bits_sfbs_1;
	input io_enq_bits_sfbs_2;
	input io_enq_bits_sfbs_3;
	input io_enq_bits_shadowed_mask_0;
	input io_enq_bits_shadowed_mask_1;
	input io_enq_bits_shadowed_mask_2;
	input io_enq_bits_shadowed_mask_3;
	input io_enq_bits_cfi_idx_valid;
	input [1:0] io_enq_bits_cfi_idx_bits;
	input [3:0] io_enq_bits_ftq_idx;
	input [3:0] io_enq_bits_mask;
	input io_enq_bits_xcpt_pf_if;
	input io_enq_bits_xcpt_ae_if;
	input io_enq_bits_bp_debug_if_oh_0;
	input io_enq_bits_bp_debug_if_oh_1;
	input io_enq_bits_bp_debug_if_oh_2;
	input io_enq_bits_bp_debug_if_oh_3;
	input io_enq_bits_bp_xcpt_if_oh_0;
	input io_enq_bits_bp_xcpt_if_oh_1;
	input io_enq_bits_bp_xcpt_if_oh_2;
	input io_enq_bits_bp_xcpt_if_oh_3;
	input [2:0] io_enq_bits_fsrc;
	input io_deq_ready;
	output wire io_deq_valid;
	output wire io_deq_bits_uops_0_valid;
	output wire [31:0] io_deq_bits_uops_0_bits_inst;
	output wire [31:0] io_deq_bits_uops_0_bits_debug_inst;
	output wire io_deq_bits_uops_0_bits_is_rvc;
	output wire [39:0] io_deq_bits_uops_0_bits_debug_pc;
	output wire io_deq_bits_uops_0_bits_is_sfb;
	output wire [3:0] io_deq_bits_uops_0_bits_ftq_idx;
	output wire io_deq_bits_uops_0_bits_edge_inst;
	output wire [5:0] io_deq_bits_uops_0_bits_pc_lob;
	output wire io_deq_bits_uops_0_bits_taken;
	output wire io_deq_bits_uops_0_bits_xcpt_pf_if;
	output wire io_deq_bits_uops_0_bits_xcpt_ae_if;
	output wire io_deq_bits_uops_0_bits_bp_debug_if;
	output wire io_deq_bits_uops_0_bits_bp_xcpt_if;
	output wire [2:0] io_deq_bits_uops_0_bits_debug_fsrc;
	input io_clear;
	reg [31:0] fb_uop_ram_0_inst;
	reg [31:0] fb_uop_ram_0_debug_inst;
	reg fb_uop_ram_0_is_rvc;
	reg [39:0] fb_uop_ram_0_debug_pc;
	reg fb_uop_ram_0_is_sfb;
	reg [3:0] fb_uop_ram_0_ftq_idx;
	reg fb_uop_ram_0_edge_inst;
	reg [5:0] fb_uop_ram_0_pc_lob;
	reg fb_uop_ram_0_taken;
	reg fb_uop_ram_0_xcpt_pf_if;
	reg fb_uop_ram_0_xcpt_ae_if;
	reg fb_uop_ram_0_bp_debug_if;
	reg fb_uop_ram_0_bp_xcpt_if;
	reg [2:0] fb_uop_ram_0_debug_fsrc;
	reg [31:0] fb_uop_ram_1_inst;
	reg [31:0] fb_uop_ram_1_debug_inst;
	reg fb_uop_ram_1_is_rvc;
	reg [39:0] fb_uop_ram_1_debug_pc;
	reg fb_uop_ram_1_is_sfb;
	reg [3:0] fb_uop_ram_1_ftq_idx;
	reg fb_uop_ram_1_edge_inst;
	reg [5:0] fb_uop_ram_1_pc_lob;
	reg fb_uop_ram_1_taken;
	reg fb_uop_ram_1_xcpt_pf_if;
	reg fb_uop_ram_1_xcpt_ae_if;
	reg fb_uop_ram_1_bp_debug_if;
	reg fb_uop_ram_1_bp_xcpt_if;
	reg [2:0] fb_uop_ram_1_debug_fsrc;
	reg [31:0] fb_uop_ram_2_inst;
	reg [31:0] fb_uop_ram_2_debug_inst;
	reg fb_uop_ram_2_is_rvc;
	reg [39:0] fb_uop_ram_2_debug_pc;
	reg fb_uop_ram_2_is_sfb;
	reg [3:0] fb_uop_ram_2_ftq_idx;
	reg fb_uop_ram_2_edge_inst;
	reg [5:0] fb_uop_ram_2_pc_lob;
	reg fb_uop_ram_2_taken;
	reg fb_uop_ram_2_xcpt_pf_if;
	reg fb_uop_ram_2_xcpt_ae_if;
	reg fb_uop_ram_2_bp_debug_if;
	reg fb_uop_ram_2_bp_xcpt_if;
	reg [2:0] fb_uop_ram_2_debug_fsrc;
	reg [31:0] fb_uop_ram_3_inst;
	reg [31:0] fb_uop_ram_3_debug_inst;
	reg fb_uop_ram_3_is_rvc;
	reg [39:0] fb_uop_ram_3_debug_pc;
	reg fb_uop_ram_3_is_sfb;
	reg [3:0] fb_uop_ram_3_ftq_idx;
	reg fb_uop_ram_3_edge_inst;
	reg [5:0] fb_uop_ram_3_pc_lob;
	reg fb_uop_ram_3_taken;
	reg fb_uop_ram_3_xcpt_pf_if;
	reg fb_uop_ram_3_xcpt_ae_if;
	reg fb_uop_ram_3_bp_debug_if;
	reg fb_uop_ram_3_bp_xcpt_if;
	reg [2:0] fb_uop_ram_3_debug_fsrc;
	reg [31:0] fb_uop_ram_4_inst;
	reg [31:0] fb_uop_ram_4_debug_inst;
	reg fb_uop_ram_4_is_rvc;
	reg [39:0] fb_uop_ram_4_debug_pc;
	reg fb_uop_ram_4_is_sfb;
	reg [3:0] fb_uop_ram_4_ftq_idx;
	reg fb_uop_ram_4_edge_inst;
	reg [5:0] fb_uop_ram_4_pc_lob;
	reg fb_uop_ram_4_taken;
	reg fb_uop_ram_4_xcpt_pf_if;
	reg fb_uop_ram_4_xcpt_ae_if;
	reg fb_uop_ram_4_bp_debug_if;
	reg fb_uop_ram_4_bp_xcpt_if;
	reg [2:0] fb_uop_ram_4_debug_fsrc;
	reg [31:0] fb_uop_ram_5_inst;
	reg [31:0] fb_uop_ram_5_debug_inst;
	reg fb_uop_ram_5_is_rvc;
	reg [39:0] fb_uop_ram_5_debug_pc;
	reg fb_uop_ram_5_is_sfb;
	reg [3:0] fb_uop_ram_5_ftq_idx;
	reg fb_uop_ram_5_edge_inst;
	reg [5:0] fb_uop_ram_5_pc_lob;
	reg fb_uop_ram_5_taken;
	reg fb_uop_ram_5_xcpt_pf_if;
	reg fb_uop_ram_5_xcpt_ae_if;
	reg fb_uop_ram_5_bp_debug_if;
	reg fb_uop_ram_5_bp_xcpt_if;
	reg [2:0] fb_uop_ram_5_debug_fsrc;
	reg [31:0] fb_uop_ram_6_inst;
	reg [31:0] fb_uop_ram_6_debug_inst;
	reg fb_uop_ram_6_is_rvc;
	reg [39:0] fb_uop_ram_6_debug_pc;
	reg fb_uop_ram_6_is_sfb;
	reg [3:0] fb_uop_ram_6_ftq_idx;
	reg fb_uop_ram_6_edge_inst;
	reg [5:0] fb_uop_ram_6_pc_lob;
	reg fb_uop_ram_6_taken;
	reg fb_uop_ram_6_xcpt_pf_if;
	reg fb_uop_ram_6_xcpt_ae_if;
	reg fb_uop_ram_6_bp_debug_if;
	reg fb_uop_ram_6_bp_xcpt_if;
	reg [2:0] fb_uop_ram_6_debug_fsrc;
	reg [31:0] fb_uop_ram_7_inst;
	reg [31:0] fb_uop_ram_7_debug_inst;
	reg fb_uop_ram_7_is_rvc;
	reg [39:0] fb_uop_ram_7_debug_pc;
	reg fb_uop_ram_7_is_sfb;
	reg [3:0] fb_uop_ram_7_ftq_idx;
	reg fb_uop_ram_7_edge_inst;
	reg [5:0] fb_uop_ram_7_pc_lob;
	reg fb_uop_ram_7_taken;
	reg fb_uop_ram_7_xcpt_pf_if;
	reg fb_uop_ram_7_xcpt_ae_if;
	reg fb_uop_ram_7_bp_debug_if;
	reg fb_uop_ram_7_bp_xcpt_if;
	reg [2:0] fb_uop_ram_7_debug_fsrc;
	reg [7:0] head;
	reg [7:0] tail;
	reg maybe_full;
	wire _do_enq_T_1 = (|(tail & head) & maybe_full) | (|(((head & {tail[6:0], tail[7]}) | (head & {tail[5:0], tail[7:6]})) | (head & {tail[4:0], tail[7:5]})));
	wire will_hit_tail = ((((((((head[0] & ~maybe_full) & tail[0]) | ((head[1] & ~maybe_full) & tail[1])) | ((head[2] & ~maybe_full) & tail[2])) | ((head[3] & ~maybe_full) & tail[3])) | ((head[4] & ~maybe_full) & tail[4])) | ((head[5] & ~maybe_full) & tail[5])) | ((head[6] & ~maybe_full) & tail[6])) | ((head[7] & ~maybe_full) & tail[7]);
	always @(posedge clock) begin : sv2v_autoblock_1
		reg in_mask_0;
		reg in_uops_0_is_sfb;
		reg [39:0] _GEN;
		reg [39:0] in_uops_0_debug_pc;
		reg [5:0] in_uops_0_pc_lob;
		reg in_uops_0_is_rvc;
		reg in_uops_0_taken;
		reg [39:0] _pc_T_7;
		reg in_mask_1;
		reg in_uops_1_is_sfb;
		reg in_uops_1_is_rvc;
		reg in_uops_1_taken;
		reg [39:0] _pc_T_11;
		reg in_mask_2;
		reg in_uops_2_is_sfb;
		reg in_uops_2_is_rvc;
		reg in_uops_2_taken;
		reg [39:0] _pc_T_15;
		reg in_mask_3;
		reg in_uops_3_is_sfb;
		reg in_uops_3_is_rvc;
		reg in_uops_3_taken;
		reg [7:0] _GEN_0;
		reg [7:0] enq_idxs_1;
		reg [7:0] _GEN_1;
		reg [7:0] enq_idxs_2;
		reg [7:0] _GEN_2;
		reg [7:0] enq_idxs_3;
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
		reg _GEN_24;
		reg _GEN_25;
		reg _GEN_26;
		reg _GEN_27;
		reg _GEN_28;
		reg _GEN_29;
		reg _GEN_30;
		reg _GEN_31;
		reg _GEN_32;
		reg _GEN_33;
		reg _GEN_34;
		reg _GEN_35;
		reg _GEN_36;
		reg _GEN_37;
		reg _GEN_38;
		_GEN = {io_enq_bits_pc[39:3], 3'h0};
		in_mask_0 = io_enq_valid & io_enq_bits_mask[0];
		in_uops_0_is_sfb = io_enq_bits_sfbs_0 | io_enq_bits_shadowed_mask_0;
		in_uops_0_debug_pc = (io_enq_bits_edge_inst_0 ? _GEN - 40'h0000000002 : {io_enq_bits_pc[39:3], 3'h0});
		in_uops_0_pc_lob = {io_enq_bits_pc[5:3], 3'h0};
		in_uops_0_is_rvc = io_enq_bits_insts_0[1:0] != 2'h3;
		in_uops_0_taken = (io_enq_bits_cfi_idx_bits == 2'h0) & io_enq_bits_cfi_idx_valid;
		_pc_T_7 = _GEN + 40'h0000000002;
		in_mask_1 = io_enq_valid & io_enq_bits_mask[1];
		in_uops_1_is_sfb = io_enq_bits_sfbs_1 | io_enq_bits_shadowed_mask_1;
		in_uops_1_is_rvc = io_enq_bits_insts_1[1:0] != 2'h3;
		in_uops_1_taken = (io_enq_bits_cfi_idx_bits == 2'h1) & io_enq_bits_cfi_idx_valid;
		_pc_T_11 = _GEN + 40'h0000000004;
		in_mask_2 = io_enq_valid & io_enq_bits_mask[2];
		in_uops_2_is_sfb = io_enq_bits_sfbs_2 | io_enq_bits_shadowed_mask_2;
		in_uops_2_is_rvc = io_enq_bits_insts_2[1:0] != 2'h3;
		in_uops_2_taken = (io_enq_bits_cfi_idx_bits == 2'h2) & io_enq_bits_cfi_idx_valid;
		_pc_T_15 = _GEN + 40'h0000000006;
		in_mask_3 = io_enq_valid & io_enq_bits_mask[3];
		in_uops_3_is_sfb = io_enq_bits_sfbs_3 | io_enq_bits_shadowed_mask_3;
		in_uops_3_is_rvc = io_enq_bits_insts_3[1:0] != 2'h3;
		in_uops_3_taken = &io_enq_bits_cfi_idx_bits & io_enq_bits_cfi_idx_valid;
		_GEN_0 = {tail[6:0], tail[7]};
		enq_idxs_1 = (in_mask_0 ? _GEN_0 : tail);
		_GEN_1 = {enq_idxs_1[6:0], enq_idxs_1[7]};
		enq_idxs_2 = (in_mask_1 ? _GEN_1 : enq_idxs_1);
		_GEN_2 = {enq_idxs_2[6:0], enq_idxs_2[7]};
		enq_idxs_3 = (in_mask_2 ? _GEN_2 : enq_idxs_2);
		_GEN_3 = ~_do_enq_T_1 & in_mask_0;
		_GEN_4 = _GEN_3 & tail[0];
		_GEN_5 = _GEN_3 & tail[1];
		_GEN_6 = _GEN_3 & tail[2];
		_GEN_7 = _GEN_3 & tail[3];
		_GEN_8 = _GEN_3 & tail[4];
		_GEN_9 = _GEN_3 & tail[5];
		_GEN_10 = _GEN_3 & tail[6];
		_GEN_11 = _GEN_3 & tail[7];
		_GEN_12 = ~_do_enq_T_1 & in_mask_1;
		_GEN_13 = _GEN_12 & enq_idxs_1[0];
		_GEN_14 = _GEN_12 & enq_idxs_1[1];
		_GEN_15 = _GEN_12 & enq_idxs_1[2];
		_GEN_16 = _GEN_12 & enq_idxs_1[3];
		_GEN_17 = _GEN_12 & enq_idxs_1[4];
		_GEN_18 = _GEN_12 & enq_idxs_1[5];
		_GEN_19 = _GEN_12 & enq_idxs_1[6];
		_GEN_20 = _GEN_12 & enq_idxs_1[7];
		_GEN_21 = ~_do_enq_T_1 & in_mask_2;
		_GEN_22 = _GEN_21 & enq_idxs_2[0];
		_GEN_23 = _GEN_21 & enq_idxs_2[1];
		_GEN_24 = _GEN_21 & enq_idxs_2[2];
		_GEN_25 = _GEN_21 & enq_idxs_2[3];
		_GEN_26 = _GEN_21 & enq_idxs_2[4];
		_GEN_27 = _GEN_21 & enq_idxs_2[5];
		_GEN_28 = _GEN_21 & enq_idxs_2[6];
		_GEN_29 = _GEN_21 & enq_idxs_2[7];
		_GEN_30 = ~_do_enq_T_1 & in_mask_3;
		_GEN_31 = _GEN_30 & enq_idxs_3[0];
		_GEN_32 = _GEN_30 & enq_idxs_3[1];
		_GEN_33 = _GEN_30 & enq_idxs_3[2];
		_GEN_34 = _GEN_30 & enq_idxs_3[3];
		_GEN_35 = _GEN_30 & enq_idxs_3[4];
		_GEN_36 = _GEN_30 & enq_idxs_3[5];
		_GEN_37 = _GEN_30 & enq_idxs_3[6];
		_GEN_38 = _GEN_30 & enq_idxs_3[7];
		if (_GEN_31) begin
			fb_uop_ram_0_inst <= io_enq_bits_exp_insts_3;
			fb_uop_ram_0_debug_inst <= io_enq_bits_insts_3;
			fb_uop_ram_0_is_rvc <= in_uops_3_is_rvc;
			fb_uop_ram_0_debug_pc <= _pc_T_15;
			fb_uop_ram_0_is_sfb <= in_uops_3_is_sfb;
			fb_uop_ram_0_pc_lob <= _pc_T_15[5:0];
			fb_uop_ram_0_taken <= in_uops_3_taken;
			fb_uop_ram_0_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
			fb_uop_ram_0_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
		end
		else if (_GEN_22) begin
			fb_uop_ram_0_inst <= io_enq_bits_exp_insts_2;
			fb_uop_ram_0_debug_inst <= io_enq_bits_insts_2;
			fb_uop_ram_0_is_rvc <= in_uops_2_is_rvc;
			fb_uop_ram_0_debug_pc <= _pc_T_11;
			fb_uop_ram_0_is_sfb <= in_uops_2_is_sfb;
			fb_uop_ram_0_pc_lob <= _pc_T_11[5:0];
			fb_uop_ram_0_taken <= in_uops_2_taken;
			fb_uop_ram_0_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
			fb_uop_ram_0_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
		end
		else if (_GEN_13) begin
			fb_uop_ram_0_inst <= io_enq_bits_exp_insts_1;
			fb_uop_ram_0_debug_inst <= io_enq_bits_insts_1;
			fb_uop_ram_0_is_rvc <= in_uops_1_is_rvc;
			fb_uop_ram_0_debug_pc <= _pc_T_7;
			fb_uop_ram_0_is_sfb <= in_uops_1_is_sfb;
			fb_uop_ram_0_pc_lob <= _pc_T_7[5:0];
			fb_uop_ram_0_taken <= in_uops_1_taken;
			fb_uop_ram_0_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
			fb_uop_ram_0_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
		end
		else if (_GEN_4) begin
			fb_uop_ram_0_inst <= io_enq_bits_exp_insts_0;
			fb_uop_ram_0_debug_inst <= io_enq_bits_insts_0;
			fb_uop_ram_0_is_rvc <= in_uops_0_is_rvc;
			fb_uop_ram_0_debug_pc <= in_uops_0_debug_pc;
			fb_uop_ram_0_is_sfb <= in_uops_0_is_sfb;
			fb_uop_ram_0_pc_lob <= in_uops_0_pc_lob;
			fb_uop_ram_0_taken <= in_uops_0_taken;
			fb_uop_ram_0_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
			fb_uop_ram_0_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
		end
		if (((_GEN_31 | _GEN_22) | _GEN_13) | _GEN_4) begin
			fb_uop_ram_0_ftq_idx <= io_enq_bits_ftq_idx;
			fb_uop_ram_0_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
			fb_uop_ram_0_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
			fb_uop_ram_0_debug_fsrc <= io_enq_bits_fsrc;
		end
		fb_uop_ram_0_edge_inst <= ~((_GEN_31 | _GEN_22) | _GEN_13) & (_GEN_4 ? io_enq_bits_edge_inst_0 : fb_uop_ram_0_edge_inst);
		if (_GEN_32) begin
			fb_uop_ram_1_inst <= io_enq_bits_exp_insts_3;
			fb_uop_ram_1_debug_inst <= io_enq_bits_insts_3;
			fb_uop_ram_1_is_rvc <= in_uops_3_is_rvc;
			fb_uop_ram_1_debug_pc <= _pc_T_15;
			fb_uop_ram_1_is_sfb <= in_uops_3_is_sfb;
			fb_uop_ram_1_pc_lob <= _pc_T_15[5:0];
			fb_uop_ram_1_taken <= in_uops_3_taken;
			fb_uop_ram_1_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
			fb_uop_ram_1_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
		end
		else if (_GEN_23) begin
			fb_uop_ram_1_inst <= io_enq_bits_exp_insts_2;
			fb_uop_ram_1_debug_inst <= io_enq_bits_insts_2;
			fb_uop_ram_1_is_rvc <= in_uops_2_is_rvc;
			fb_uop_ram_1_debug_pc <= _pc_T_11;
			fb_uop_ram_1_is_sfb <= in_uops_2_is_sfb;
			fb_uop_ram_1_pc_lob <= _pc_T_11[5:0];
			fb_uop_ram_1_taken <= in_uops_2_taken;
			fb_uop_ram_1_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
			fb_uop_ram_1_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
		end
		else if (_GEN_14) begin
			fb_uop_ram_1_inst <= io_enq_bits_exp_insts_1;
			fb_uop_ram_1_debug_inst <= io_enq_bits_insts_1;
			fb_uop_ram_1_is_rvc <= in_uops_1_is_rvc;
			fb_uop_ram_1_debug_pc <= _pc_T_7;
			fb_uop_ram_1_is_sfb <= in_uops_1_is_sfb;
			fb_uop_ram_1_pc_lob <= _pc_T_7[5:0];
			fb_uop_ram_1_taken <= in_uops_1_taken;
			fb_uop_ram_1_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
			fb_uop_ram_1_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
		end
		else if (_GEN_5) begin
			fb_uop_ram_1_inst <= io_enq_bits_exp_insts_0;
			fb_uop_ram_1_debug_inst <= io_enq_bits_insts_0;
			fb_uop_ram_1_is_rvc <= in_uops_0_is_rvc;
			fb_uop_ram_1_debug_pc <= in_uops_0_debug_pc;
			fb_uop_ram_1_is_sfb <= in_uops_0_is_sfb;
			fb_uop_ram_1_pc_lob <= in_uops_0_pc_lob;
			fb_uop_ram_1_taken <= in_uops_0_taken;
			fb_uop_ram_1_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
			fb_uop_ram_1_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
		end
		if (((_GEN_32 | _GEN_23) | _GEN_14) | _GEN_5) begin
			fb_uop_ram_1_ftq_idx <= io_enq_bits_ftq_idx;
			fb_uop_ram_1_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
			fb_uop_ram_1_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
			fb_uop_ram_1_debug_fsrc <= io_enq_bits_fsrc;
		end
		fb_uop_ram_1_edge_inst <= ~((_GEN_32 | _GEN_23) | _GEN_14) & (_GEN_5 ? io_enq_bits_edge_inst_0 : fb_uop_ram_1_edge_inst);
		if (_GEN_33) begin
			fb_uop_ram_2_inst <= io_enq_bits_exp_insts_3;
			fb_uop_ram_2_debug_inst <= io_enq_bits_insts_3;
			fb_uop_ram_2_is_rvc <= in_uops_3_is_rvc;
			fb_uop_ram_2_debug_pc <= _pc_T_15;
			fb_uop_ram_2_is_sfb <= in_uops_3_is_sfb;
			fb_uop_ram_2_pc_lob <= _pc_T_15[5:0];
			fb_uop_ram_2_taken <= in_uops_3_taken;
			fb_uop_ram_2_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
			fb_uop_ram_2_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
		end
		else if (_GEN_24) begin
			fb_uop_ram_2_inst <= io_enq_bits_exp_insts_2;
			fb_uop_ram_2_debug_inst <= io_enq_bits_insts_2;
			fb_uop_ram_2_is_rvc <= in_uops_2_is_rvc;
			fb_uop_ram_2_debug_pc <= _pc_T_11;
			fb_uop_ram_2_is_sfb <= in_uops_2_is_sfb;
			fb_uop_ram_2_pc_lob <= _pc_T_11[5:0];
			fb_uop_ram_2_taken <= in_uops_2_taken;
			fb_uop_ram_2_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
			fb_uop_ram_2_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
		end
		else if (_GEN_15) begin
			fb_uop_ram_2_inst <= io_enq_bits_exp_insts_1;
			fb_uop_ram_2_debug_inst <= io_enq_bits_insts_1;
			fb_uop_ram_2_is_rvc <= in_uops_1_is_rvc;
			fb_uop_ram_2_debug_pc <= _pc_T_7;
			fb_uop_ram_2_is_sfb <= in_uops_1_is_sfb;
			fb_uop_ram_2_pc_lob <= _pc_T_7[5:0];
			fb_uop_ram_2_taken <= in_uops_1_taken;
			fb_uop_ram_2_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
			fb_uop_ram_2_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
		end
		else if (_GEN_6) begin
			fb_uop_ram_2_inst <= io_enq_bits_exp_insts_0;
			fb_uop_ram_2_debug_inst <= io_enq_bits_insts_0;
			fb_uop_ram_2_is_rvc <= in_uops_0_is_rvc;
			fb_uop_ram_2_debug_pc <= in_uops_0_debug_pc;
			fb_uop_ram_2_is_sfb <= in_uops_0_is_sfb;
			fb_uop_ram_2_pc_lob <= in_uops_0_pc_lob;
			fb_uop_ram_2_taken <= in_uops_0_taken;
			fb_uop_ram_2_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
			fb_uop_ram_2_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
		end
		if (((_GEN_33 | _GEN_24) | _GEN_15) | _GEN_6) begin
			fb_uop_ram_2_ftq_idx <= io_enq_bits_ftq_idx;
			fb_uop_ram_2_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
			fb_uop_ram_2_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
			fb_uop_ram_2_debug_fsrc <= io_enq_bits_fsrc;
		end
		fb_uop_ram_2_edge_inst <= ~((_GEN_33 | _GEN_24) | _GEN_15) & (_GEN_6 ? io_enq_bits_edge_inst_0 : fb_uop_ram_2_edge_inst);
		if (_GEN_34) begin
			fb_uop_ram_3_inst <= io_enq_bits_exp_insts_3;
			fb_uop_ram_3_debug_inst <= io_enq_bits_insts_3;
			fb_uop_ram_3_is_rvc <= in_uops_3_is_rvc;
			fb_uop_ram_3_debug_pc <= _pc_T_15;
			fb_uop_ram_3_is_sfb <= in_uops_3_is_sfb;
			fb_uop_ram_3_pc_lob <= _pc_T_15[5:0];
			fb_uop_ram_3_taken <= in_uops_3_taken;
			fb_uop_ram_3_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
			fb_uop_ram_3_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
		end
		else if (_GEN_25) begin
			fb_uop_ram_3_inst <= io_enq_bits_exp_insts_2;
			fb_uop_ram_3_debug_inst <= io_enq_bits_insts_2;
			fb_uop_ram_3_is_rvc <= in_uops_2_is_rvc;
			fb_uop_ram_3_debug_pc <= _pc_T_11;
			fb_uop_ram_3_is_sfb <= in_uops_2_is_sfb;
			fb_uop_ram_3_pc_lob <= _pc_T_11[5:0];
			fb_uop_ram_3_taken <= in_uops_2_taken;
			fb_uop_ram_3_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
			fb_uop_ram_3_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
		end
		else if (_GEN_16) begin
			fb_uop_ram_3_inst <= io_enq_bits_exp_insts_1;
			fb_uop_ram_3_debug_inst <= io_enq_bits_insts_1;
			fb_uop_ram_3_is_rvc <= in_uops_1_is_rvc;
			fb_uop_ram_3_debug_pc <= _pc_T_7;
			fb_uop_ram_3_is_sfb <= in_uops_1_is_sfb;
			fb_uop_ram_3_pc_lob <= _pc_T_7[5:0];
			fb_uop_ram_3_taken <= in_uops_1_taken;
			fb_uop_ram_3_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
			fb_uop_ram_3_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
		end
		else if (_GEN_7) begin
			fb_uop_ram_3_inst <= io_enq_bits_exp_insts_0;
			fb_uop_ram_3_debug_inst <= io_enq_bits_insts_0;
			fb_uop_ram_3_is_rvc <= in_uops_0_is_rvc;
			fb_uop_ram_3_debug_pc <= in_uops_0_debug_pc;
			fb_uop_ram_3_is_sfb <= in_uops_0_is_sfb;
			fb_uop_ram_3_pc_lob <= in_uops_0_pc_lob;
			fb_uop_ram_3_taken <= in_uops_0_taken;
			fb_uop_ram_3_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
			fb_uop_ram_3_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
		end
		if (((_GEN_34 | _GEN_25) | _GEN_16) | _GEN_7) begin
			fb_uop_ram_3_ftq_idx <= io_enq_bits_ftq_idx;
			fb_uop_ram_3_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
			fb_uop_ram_3_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
			fb_uop_ram_3_debug_fsrc <= io_enq_bits_fsrc;
		end
		fb_uop_ram_3_edge_inst <= ~((_GEN_34 | _GEN_25) | _GEN_16) & (_GEN_7 ? io_enq_bits_edge_inst_0 : fb_uop_ram_3_edge_inst);
		if (_GEN_35) begin
			fb_uop_ram_4_inst <= io_enq_bits_exp_insts_3;
			fb_uop_ram_4_debug_inst <= io_enq_bits_insts_3;
			fb_uop_ram_4_is_rvc <= in_uops_3_is_rvc;
			fb_uop_ram_4_debug_pc <= _pc_T_15;
			fb_uop_ram_4_is_sfb <= in_uops_3_is_sfb;
			fb_uop_ram_4_pc_lob <= _pc_T_15[5:0];
			fb_uop_ram_4_taken <= in_uops_3_taken;
			fb_uop_ram_4_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
			fb_uop_ram_4_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
		end
		else if (_GEN_26) begin
			fb_uop_ram_4_inst <= io_enq_bits_exp_insts_2;
			fb_uop_ram_4_debug_inst <= io_enq_bits_insts_2;
			fb_uop_ram_4_is_rvc <= in_uops_2_is_rvc;
			fb_uop_ram_4_debug_pc <= _pc_T_11;
			fb_uop_ram_4_is_sfb <= in_uops_2_is_sfb;
			fb_uop_ram_4_pc_lob <= _pc_T_11[5:0];
			fb_uop_ram_4_taken <= in_uops_2_taken;
			fb_uop_ram_4_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
			fb_uop_ram_4_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
		end
		else if (_GEN_17) begin
			fb_uop_ram_4_inst <= io_enq_bits_exp_insts_1;
			fb_uop_ram_4_debug_inst <= io_enq_bits_insts_1;
			fb_uop_ram_4_is_rvc <= in_uops_1_is_rvc;
			fb_uop_ram_4_debug_pc <= _pc_T_7;
			fb_uop_ram_4_is_sfb <= in_uops_1_is_sfb;
			fb_uop_ram_4_pc_lob <= _pc_T_7[5:0];
			fb_uop_ram_4_taken <= in_uops_1_taken;
			fb_uop_ram_4_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
			fb_uop_ram_4_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
		end
		else if (_GEN_8) begin
			fb_uop_ram_4_inst <= io_enq_bits_exp_insts_0;
			fb_uop_ram_4_debug_inst <= io_enq_bits_insts_0;
			fb_uop_ram_4_is_rvc <= in_uops_0_is_rvc;
			fb_uop_ram_4_debug_pc <= in_uops_0_debug_pc;
			fb_uop_ram_4_is_sfb <= in_uops_0_is_sfb;
			fb_uop_ram_4_pc_lob <= in_uops_0_pc_lob;
			fb_uop_ram_4_taken <= in_uops_0_taken;
			fb_uop_ram_4_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
			fb_uop_ram_4_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
		end
		if (((_GEN_35 | _GEN_26) | _GEN_17) | _GEN_8) begin
			fb_uop_ram_4_ftq_idx <= io_enq_bits_ftq_idx;
			fb_uop_ram_4_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
			fb_uop_ram_4_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
			fb_uop_ram_4_debug_fsrc <= io_enq_bits_fsrc;
		end
		fb_uop_ram_4_edge_inst <= ~((_GEN_35 | _GEN_26) | _GEN_17) & (_GEN_8 ? io_enq_bits_edge_inst_0 : fb_uop_ram_4_edge_inst);
		if (_GEN_36) begin
			fb_uop_ram_5_inst <= io_enq_bits_exp_insts_3;
			fb_uop_ram_5_debug_inst <= io_enq_bits_insts_3;
			fb_uop_ram_5_is_rvc <= in_uops_3_is_rvc;
			fb_uop_ram_5_debug_pc <= _pc_T_15;
			fb_uop_ram_5_is_sfb <= in_uops_3_is_sfb;
			fb_uop_ram_5_pc_lob <= _pc_T_15[5:0];
			fb_uop_ram_5_taken <= in_uops_3_taken;
			fb_uop_ram_5_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
			fb_uop_ram_5_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
		end
		else if (_GEN_27) begin
			fb_uop_ram_5_inst <= io_enq_bits_exp_insts_2;
			fb_uop_ram_5_debug_inst <= io_enq_bits_insts_2;
			fb_uop_ram_5_is_rvc <= in_uops_2_is_rvc;
			fb_uop_ram_5_debug_pc <= _pc_T_11;
			fb_uop_ram_5_is_sfb <= in_uops_2_is_sfb;
			fb_uop_ram_5_pc_lob <= _pc_T_11[5:0];
			fb_uop_ram_5_taken <= in_uops_2_taken;
			fb_uop_ram_5_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
			fb_uop_ram_5_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
		end
		else if (_GEN_18) begin
			fb_uop_ram_5_inst <= io_enq_bits_exp_insts_1;
			fb_uop_ram_5_debug_inst <= io_enq_bits_insts_1;
			fb_uop_ram_5_is_rvc <= in_uops_1_is_rvc;
			fb_uop_ram_5_debug_pc <= _pc_T_7;
			fb_uop_ram_5_is_sfb <= in_uops_1_is_sfb;
			fb_uop_ram_5_pc_lob <= _pc_T_7[5:0];
			fb_uop_ram_5_taken <= in_uops_1_taken;
			fb_uop_ram_5_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
			fb_uop_ram_5_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
		end
		else if (_GEN_9) begin
			fb_uop_ram_5_inst <= io_enq_bits_exp_insts_0;
			fb_uop_ram_5_debug_inst <= io_enq_bits_insts_0;
			fb_uop_ram_5_is_rvc <= in_uops_0_is_rvc;
			fb_uop_ram_5_debug_pc <= in_uops_0_debug_pc;
			fb_uop_ram_5_is_sfb <= in_uops_0_is_sfb;
			fb_uop_ram_5_pc_lob <= in_uops_0_pc_lob;
			fb_uop_ram_5_taken <= in_uops_0_taken;
			fb_uop_ram_5_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
			fb_uop_ram_5_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
		end
		if (((_GEN_36 | _GEN_27) | _GEN_18) | _GEN_9) begin
			fb_uop_ram_5_ftq_idx <= io_enq_bits_ftq_idx;
			fb_uop_ram_5_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
			fb_uop_ram_5_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
			fb_uop_ram_5_debug_fsrc <= io_enq_bits_fsrc;
		end
		fb_uop_ram_5_edge_inst <= ~((_GEN_36 | _GEN_27) | _GEN_18) & (_GEN_9 ? io_enq_bits_edge_inst_0 : fb_uop_ram_5_edge_inst);
		if (_GEN_37) begin
			fb_uop_ram_6_inst <= io_enq_bits_exp_insts_3;
			fb_uop_ram_6_debug_inst <= io_enq_bits_insts_3;
			fb_uop_ram_6_is_rvc <= in_uops_3_is_rvc;
			fb_uop_ram_6_debug_pc <= _pc_T_15;
			fb_uop_ram_6_is_sfb <= in_uops_3_is_sfb;
			fb_uop_ram_6_pc_lob <= _pc_T_15[5:0];
			fb_uop_ram_6_taken <= in_uops_3_taken;
			fb_uop_ram_6_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
			fb_uop_ram_6_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
		end
		else if (_GEN_28) begin
			fb_uop_ram_6_inst <= io_enq_bits_exp_insts_2;
			fb_uop_ram_6_debug_inst <= io_enq_bits_insts_2;
			fb_uop_ram_6_is_rvc <= in_uops_2_is_rvc;
			fb_uop_ram_6_debug_pc <= _pc_T_11;
			fb_uop_ram_6_is_sfb <= in_uops_2_is_sfb;
			fb_uop_ram_6_pc_lob <= _pc_T_11[5:0];
			fb_uop_ram_6_taken <= in_uops_2_taken;
			fb_uop_ram_6_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
			fb_uop_ram_6_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
		end
		else if (_GEN_19) begin
			fb_uop_ram_6_inst <= io_enq_bits_exp_insts_1;
			fb_uop_ram_6_debug_inst <= io_enq_bits_insts_1;
			fb_uop_ram_6_is_rvc <= in_uops_1_is_rvc;
			fb_uop_ram_6_debug_pc <= _pc_T_7;
			fb_uop_ram_6_is_sfb <= in_uops_1_is_sfb;
			fb_uop_ram_6_pc_lob <= _pc_T_7[5:0];
			fb_uop_ram_6_taken <= in_uops_1_taken;
			fb_uop_ram_6_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
			fb_uop_ram_6_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
		end
		else if (_GEN_10) begin
			fb_uop_ram_6_inst <= io_enq_bits_exp_insts_0;
			fb_uop_ram_6_debug_inst <= io_enq_bits_insts_0;
			fb_uop_ram_6_is_rvc <= in_uops_0_is_rvc;
			fb_uop_ram_6_debug_pc <= in_uops_0_debug_pc;
			fb_uop_ram_6_is_sfb <= in_uops_0_is_sfb;
			fb_uop_ram_6_pc_lob <= in_uops_0_pc_lob;
			fb_uop_ram_6_taken <= in_uops_0_taken;
			fb_uop_ram_6_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
			fb_uop_ram_6_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
		end
		if (((_GEN_37 | _GEN_28) | _GEN_19) | _GEN_10) begin
			fb_uop_ram_6_ftq_idx <= io_enq_bits_ftq_idx;
			fb_uop_ram_6_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
			fb_uop_ram_6_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
			fb_uop_ram_6_debug_fsrc <= io_enq_bits_fsrc;
		end
		fb_uop_ram_6_edge_inst <= ~((_GEN_37 | _GEN_28) | _GEN_19) & (_GEN_10 ? io_enq_bits_edge_inst_0 : fb_uop_ram_6_edge_inst);
		if (_GEN_38) begin
			fb_uop_ram_7_inst <= io_enq_bits_exp_insts_3;
			fb_uop_ram_7_debug_inst <= io_enq_bits_insts_3;
			fb_uop_ram_7_is_rvc <= in_uops_3_is_rvc;
			fb_uop_ram_7_debug_pc <= _pc_T_15;
			fb_uop_ram_7_is_sfb <= in_uops_3_is_sfb;
			fb_uop_ram_7_pc_lob <= _pc_T_15[5:0];
			fb_uop_ram_7_taken <= in_uops_3_taken;
			fb_uop_ram_7_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
			fb_uop_ram_7_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
		end
		else if (_GEN_29) begin
			fb_uop_ram_7_inst <= io_enq_bits_exp_insts_2;
			fb_uop_ram_7_debug_inst <= io_enq_bits_insts_2;
			fb_uop_ram_7_is_rvc <= in_uops_2_is_rvc;
			fb_uop_ram_7_debug_pc <= _pc_T_11;
			fb_uop_ram_7_is_sfb <= in_uops_2_is_sfb;
			fb_uop_ram_7_pc_lob <= _pc_T_11[5:0];
			fb_uop_ram_7_taken <= in_uops_2_taken;
			fb_uop_ram_7_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
			fb_uop_ram_7_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
		end
		else if (_GEN_20) begin
			fb_uop_ram_7_inst <= io_enq_bits_exp_insts_1;
			fb_uop_ram_7_debug_inst <= io_enq_bits_insts_1;
			fb_uop_ram_7_is_rvc <= in_uops_1_is_rvc;
			fb_uop_ram_7_debug_pc <= _pc_T_7;
			fb_uop_ram_7_is_sfb <= in_uops_1_is_sfb;
			fb_uop_ram_7_pc_lob <= _pc_T_7[5:0];
			fb_uop_ram_7_taken <= in_uops_1_taken;
			fb_uop_ram_7_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
			fb_uop_ram_7_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
		end
		else if (_GEN_11) begin
			fb_uop_ram_7_inst <= io_enq_bits_exp_insts_0;
			fb_uop_ram_7_debug_inst <= io_enq_bits_insts_0;
			fb_uop_ram_7_is_rvc <= in_uops_0_is_rvc;
			fb_uop_ram_7_debug_pc <= in_uops_0_debug_pc;
			fb_uop_ram_7_is_sfb <= in_uops_0_is_sfb;
			fb_uop_ram_7_pc_lob <= in_uops_0_pc_lob;
			fb_uop_ram_7_taken <= in_uops_0_taken;
			fb_uop_ram_7_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
			fb_uop_ram_7_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
		end
		if (((_GEN_38 | _GEN_29) | _GEN_20) | _GEN_11) begin
			fb_uop_ram_7_ftq_idx <= io_enq_bits_ftq_idx;
			fb_uop_ram_7_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
			fb_uop_ram_7_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
			fb_uop_ram_7_debug_fsrc <= io_enq_bits_fsrc;
		end
		fb_uop_ram_7_edge_inst <= ~((_GEN_38 | _GEN_29) | _GEN_20) & (_GEN_11 ? io_enq_bits_edge_inst_0 : fb_uop_ram_7_edge_inst);
		if (reset) begin
			head <= 8'h01;
			tail <= 8'h01;
			maybe_full <= 1'h0;
		end
		else begin : sv2v_autoblock_2
			reg do_deq;
			do_deq = io_deq_ready & ~will_hit_tail;
			if (io_clear) begin
				head <= 8'h01;
				tail <= 8'h01;
			end
			else begin
				if (do_deq)
					head <= {head[6:0], head[7]};
				if (~_do_enq_T_1) begin
					if (in_mask_3)
						tail <= {enq_idxs_3[6:0], enq_idxs_3[7]};
					else if (in_mask_2)
						tail <= _GEN_2;
					else if (in_mask_1)
						tail <= _GEN_1;
					else if (in_mask_0)
						tail <= _GEN_0;
				end
			end
			maybe_full <= ~(io_clear | do_deq) & ((~_do_enq_T_1 & (((in_mask_0 | in_mask_1) | in_mask_2) | in_mask_3)) | maybe_full);
		end
	end
	assign io_enq_ready = ~_do_enq_T_1;
	assign io_deq_valid = ~will_hit_tail;
	assign io_deq_bits_uops_0_valid = ~reset & ~will_hit_tail;
	assign io_deq_bits_uops_0_bits_inst = (((((((head[0] ? fb_uop_ram_0_inst : 32'h00000000) | (head[1] ? fb_uop_ram_1_inst : 32'h00000000)) | (head[2] ? fb_uop_ram_2_inst : 32'h00000000)) | (head[3] ? fb_uop_ram_3_inst : 32'h00000000)) | (head[4] ? fb_uop_ram_4_inst : 32'h00000000)) | (head[5] ? fb_uop_ram_5_inst : 32'h00000000)) | (head[6] ? fb_uop_ram_6_inst : 32'h00000000)) | (head[7] ? fb_uop_ram_7_inst : 32'h00000000);
	assign io_deq_bits_uops_0_bits_debug_inst = (((((((head[0] ? fb_uop_ram_0_debug_inst : 32'h00000000) | (head[1] ? fb_uop_ram_1_debug_inst : 32'h00000000)) | (head[2] ? fb_uop_ram_2_debug_inst : 32'h00000000)) | (head[3] ? fb_uop_ram_3_debug_inst : 32'h00000000)) | (head[4] ? fb_uop_ram_4_debug_inst : 32'h00000000)) | (head[5] ? fb_uop_ram_5_debug_inst : 32'h00000000)) | (head[6] ? fb_uop_ram_6_debug_inst : 32'h00000000)) | (head[7] ? fb_uop_ram_7_debug_inst : 32'h00000000);
	assign io_deq_bits_uops_0_bits_is_rvc = (((((((head[0] & fb_uop_ram_0_is_rvc) | (head[1] & fb_uop_ram_1_is_rvc)) | (head[2] & fb_uop_ram_2_is_rvc)) | (head[3] & fb_uop_ram_3_is_rvc)) | (head[4] & fb_uop_ram_4_is_rvc)) | (head[5] & fb_uop_ram_5_is_rvc)) | (head[6] & fb_uop_ram_6_is_rvc)) | (head[7] & fb_uop_ram_7_is_rvc);
	assign io_deq_bits_uops_0_bits_debug_pc = (((((((head[0] ? fb_uop_ram_0_debug_pc : 40'h0000000000) | (head[1] ? fb_uop_ram_1_debug_pc : 40'h0000000000)) | (head[2] ? fb_uop_ram_2_debug_pc : 40'h0000000000)) | (head[3] ? fb_uop_ram_3_debug_pc : 40'h0000000000)) | (head[4] ? fb_uop_ram_4_debug_pc : 40'h0000000000)) | (head[5] ? fb_uop_ram_5_debug_pc : 40'h0000000000)) | (head[6] ? fb_uop_ram_6_debug_pc : 40'h0000000000)) | (head[7] ? fb_uop_ram_7_debug_pc : 40'h0000000000);
	assign io_deq_bits_uops_0_bits_is_sfb = (((((((head[0] & fb_uop_ram_0_is_sfb) | (head[1] & fb_uop_ram_1_is_sfb)) | (head[2] & fb_uop_ram_2_is_sfb)) | (head[3] & fb_uop_ram_3_is_sfb)) | (head[4] & fb_uop_ram_4_is_sfb)) | (head[5] & fb_uop_ram_5_is_sfb)) | (head[6] & fb_uop_ram_6_is_sfb)) | (head[7] & fb_uop_ram_7_is_sfb);
	assign io_deq_bits_uops_0_bits_ftq_idx = (((((((head[0] ? fb_uop_ram_0_ftq_idx : 4'h0) | (head[1] ? fb_uop_ram_1_ftq_idx : 4'h0)) | (head[2] ? fb_uop_ram_2_ftq_idx : 4'h0)) | (head[3] ? fb_uop_ram_3_ftq_idx : 4'h0)) | (head[4] ? fb_uop_ram_4_ftq_idx : 4'h0)) | (head[5] ? fb_uop_ram_5_ftq_idx : 4'h0)) | (head[6] ? fb_uop_ram_6_ftq_idx : 4'h0)) | (head[7] ? fb_uop_ram_7_ftq_idx : 4'h0);
	assign io_deq_bits_uops_0_bits_edge_inst = (((((((head[0] & fb_uop_ram_0_edge_inst) | (head[1] & fb_uop_ram_1_edge_inst)) | (head[2] & fb_uop_ram_2_edge_inst)) | (head[3] & fb_uop_ram_3_edge_inst)) | (head[4] & fb_uop_ram_4_edge_inst)) | (head[5] & fb_uop_ram_5_edge_inst)) | (head[6] & fb_uop_ram_6_edge_inst)) | (head[7] & fb_uop_ram_7_edge_inst);
	assign io_deq_bits_uops_0_bits_pc_lob = (((((((head[0] ? fb_uop_ram_0_pc_lob : 6'h00) | (head[1] ? fb_uop_ram_1_pc_lob : 6'h00)) | (head[2] ? fb_uop_ram_2_pc_lob : 6'h00)) | (head[3] ? fb_uop_ram_3_pc_lob : 6'h00)) | (head[4] ? fb_uop_ram_4_pc_lob : 6'h00)) | (head[5] ? fb_uop_ram_5_pc_lob : 6'h00)) | (head[6] ? fb_uop_ram_6_pc_lob : 6'h00)) | (head[7] ? fb_uop_ram_7_pc_lob : 6'h00);
	assign io_deq_bits_uops_0_bits_taken = (((((((head[0] & fb_uop_ram_0_taken) | (head[1] & fb_uop_ram_1_taken)) | (head[2] & fb_uop_ram_2_taken)) | (head[3] & fb_uop_ram_3_taken)) | (head[4] & fb_uop_ram_4_taken)) | (head[5] & fb_uop_ram_5_taken)) | (head[6] & fb_uop_ram_6_taken)) | (head[7] & fb_uop_ram_7_taken);
	assign io_deq_bits_uops_0_bits_xcpt_pf_if = (((((((head[0] & fb_uop_ram_0_xcpt_pf_if) | (head[1] & fb_uop_ram_1_xcpt_pf_if)) | (head[2] & fb_uop_ram_2_xcpt_pf_if)) | (head[3] & fb_uop_ram_3_xcpt_pf_if)) | (head[4] & fb_uop_ram_4_xcpt_pf_if)) | (head[5] & fb_uop_ram_5_xcpt_pf_if)) | (head[6] & fb_uop_ram_6_xcpt_pf_if)) | (head[7] & fb_uop_ram_7_xcpt_pf_if);
	assign io_deq_bits_uops_0_bits_xcpt_ae_if = (((((((head[0] & fb_uop_ram_0_xcpt_ae_if) | (head[1] & fb_uop_ram_1_xcpt_ae_if)) | (head[2] & fb_uop_ram_2_xcpt_ae_if)) | (head[3] & fb_uop_ram_3_xcpt_ae_if)) | (head[4] & fb_uop_ram_4_xcpt_ae_if)) | (head[5] & fb_uop_ram_5_xcpt_ae_if)) | (head[6] & fb_uop_ram_6_xcpt_ae_if)) | (head[7] & fb_uop_ram_7_xcpt_ae_if);
	assign io_deq_bits_uops_0_bits_bp_debug_if = (((((((head[0] & fb_uop_ram_0_bp_debug_if) | (head[1] & fb_uop_ram_1_bp_debug_if)) | (head[2] & fb_uop_ram_2_bp_debug_if)) | (head[3] & fb_uop_ram_3_bp_debug_if)) | (head[4] & fb_uop_ram_4_bp_debug_if)) | (head[5] & fb_uop_ram_5_bp_debug_if)) | (head[6] & fb_uop_ram_6_bp_debug_if)) | (head[7] & fb_uop_ram_7_bp_debug_if);
	assign io_deq_bits_uops_0_bits_bp_xcpt_if = (((((((head[0] & fb_uop_ram_0_bp_xcpt_if) | (head[1] & fb_uop_ram_1_bp_xcpt_if)) | (head[2] & fb_uop_ram_2_bp_xcpt_if)) | (head[3] & fb_uop_ram_3_bp_xcpt_if)) | (head[4] & fb_uop_ram_4_bp_xcpt_if)) | (head[5] & fb_uop_ram_5_bp_xcpt_if)) | (head[6] & fb_uop_ram_6_bp_xcpt_if)) | (head[7] & fb_uop_ram_7_bp_xcpt_if);
	assign io_deq_bits_uops_0_bits_debug_fsrc = (((((((head[0] ? fb_uop_ram_0_debug_fsrc : 3'h0) | (head[1] ? fb_uop_ram_1_debug_fsrc : 3'h0)) | (head[2] ? fb_uop_ram_2_debug_fsrc : 3'h0)) | (head[3] ? fb_uop_ram_3_debug_fsrc : 3'h0)) | (head[4] ? fb_uop_ram_4_debug_fsrc : 3'h0)) | (head[5] ? fb_uop_ram_5_debug_fsrc : 3'h0)) | (head[6] ? fb_uop_ram_6_debug_fsrc : 3'h0)) | (head[7] ? fb_uop_ram_7_debug_fsrc : 3'h0);
endmodule
