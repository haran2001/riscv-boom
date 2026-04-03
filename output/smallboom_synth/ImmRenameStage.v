module ImmRenameStage (
	clock,
	reset,
	io_ren_stalls_0,
	io_kill,
	io_dec_fire_0,
	io_dec_uops_0_iq_type_0,
	io_dec_uops_0_iq_type_1,
	io_dec_uops_0_iq_type_2,
	io_dec_uops_0_br_tag,
	io_dec_uops_0_br_type,
	io_dec_uops_0_is_sfb,
	io_dec_uops_0_imm_rename,
	io_dec_uops_0_imm_sel,
	io_dec_uops_0_pimm,
	io_dec_uops_0_lrs1,
	io_dec_uops_0_lrs2,
	io_dec_uops_0_lrs1_rtype,
	io_dec_uops_0_lrs2_rtype,
	io_ren2_uops_0_imm_sel,
	io_ren2_uops_0_pimm,
	io_brupdate_b2_uop_br_tag,
	io_brupdate_b2_mispredict,
	io_dis_fire_0,
	io_dis_ready,
	io_wakeups_0_valid,
	io_wakeups_0_bits_uop_pimm,
	io_wakeups_1_valid,
	io_wakeups_1_bits_uop_pimm,
	io_wakeups_2_valid,
	io_wakeups_2_bits_uop_pimm,
	io_wakeups_3_valid,
	io_wakeups_3_bits_uop_pimm,
	io_rollback
);
	input clock;
	input reset;
	output wire io_ren_stalls_0;
	input io_kill;
	input io_dec_fire_0;
	input io_dec_uops_0_iq_type_0;
	input io_dec_uops_0_iq_type_1;
	input io_dec_uops_0_iq_type_2;
	input [2:0] io_dec_uops_0_br_tag;
	input [3:0] io_dec_uops_0_br_type;
	input io_dec_uops_0_is_sfb;
	input io_dec_uops_0_imm_rename;
	input [2:0] io_dec_uops_0_imm_sel;
	input [4:0] io_dec_uops_0_pimm;
	input [5:0] io_dec_uops_0_lrs1;
	input [5:0] io_dec_uops_0_lrs2;
	input [1:0] io_dec_uops_0_lrs1_rtype;
	input [1:0] io_dec_uops_0_lrs2_rtype;
	output wire [2:0] io_ren2_uops_0_imm_sel;
	output wire [4:0] io_ren2_uops_0_pimm;
	input [2:0] io_brupdate_b2_uop_br_tag;
	input io_brupdate_b2_mispredict;
	input io_dis_fire_0;
	input io_dis_ready;
	input io_wakeups_0_valid;
	input [4:0] io_wakeups_0_bits_uop_pimm;
	input io_wakeups_1_valid;
	input [4:0] io_wakeups_1_bits_uop_pimm;
	input io_wakeups_2_valid;
	input [4:0] io_wakeups_2_bits_uop_pimm;
	input io_wakeups_3_valid;
	input [4:0] io_wakeups_3_bits_uop_pimm;
	input io_rollback;
	reg r_uop_imm_rename;
	wire _freelist_io_alloc_pregs_0_valid;
	wire [4:0] _freelist_io_alloc_pregs_0_bits;
	wire [31:0] _freelist_io_debug_freelist;
	wire ren2_alloc_fire_0 = io_dis_fire_0 & r_uop_imm_rename;
	reg r_valid;
	reg r_uop_iq_type_0;
	reg r_uop_iq_type_1;
	reg r_uop_iq_type_2;
	reg [2:0] r_uop_br_tag;
	reg [3:0] r_uop_br_type;
	reg r_uop_is_sfb;
	reg [2:0] r_uop_imm_sel;
	reg [4:0] r_uop_pimm;
	reg [5:0] r_uop_lrs1;
	reg [5:0] r_uop_lrs2;
	reg [1:0] r_uop_lrs1_rtype;
	reg [1:0] r_uop_lrs2_rtype;
	reg REG;
	always @(posedge clock) begin
		if (reset)
			r_valid <= 1'h0;
		else
			r_valid <= ~io_kill & (io_dis_ready ? io_dec_fire_0 : r_valid & ~io_dis_fire_0);
		if (io_kill | ~io_dis_ready)
			;
		else begin
			r_uop_iq_type_0 <= io_dec_uops_0_iq_type_0;
			r_uop_iq_type_1 <= io_dec_uops_0_iq_type_1;
			r_uop_iq_type_2 <= io_dec_uops_0_iq_type_2;
			r_uop_br_tag <= io_dec_uops_0_br_tag;
			r_uop_br_type <= io_dec_uops_0_br_type;
			r_uop_is_sfb <= io_dec_uops_0_is_sfb;
			r_uop_imm_rename <= io_dec_uops_0_imm_rename;
			r_uop_imm_sel <= io_dec_uops_0_imm_sel;
			r_uop_pimm <= io_dec_uops_0_pimm;
			r_uop_lrs1 <= io_dec_uops_0_lrs1;
			r_uop_lrs2 <= io_dec_uops_0_lrs2;
			r_uop_lrs1_rtype <= io_dec_uops_0_lrs1_rtype;
			r_uop_lrs2_rtype <= io_dec_uops_0_lrs2_rtype;
		end
		REG <= io_rollback;
	end
	RenameFreeList_2 freelist(
		.clock(clock),
		.reset(reset),
		.io_reqs_0(ren2_alloc_fire_0),
		.io_alloc_pregs_0_valid(_freelist_io_alloc_pregs_0_valid),
		.io_alloc_pregs_0_bits(_freelist_io_alloc_pregs_0_bits),
		.io_dealloc_0_valid(io_wakeups_0_valid),
		.io_dealloc_0_bits(io_wakeups_0_bits_uop_pimm),
		.io_dealloc_1_valid(io_wakeups_1_valid),
		.io_dealloc_1_bits(io_wakeups_1_bits_uop_pimm),
		.io_dealloc_2_valid(io_wakeups_2_valid),
		.io_dealloc_2_bits(io_wakeups_2_bits_uop_pimm),
		.io_dealloc_3_valid(io_wakeups_3_valid),
		.io_dealloc_3_bits(io_wakeups_3_bits_uop_pimm),
		.io_ren_br_tags_1_valid(io_dis_fire_0 & ((((((((r_uop_br_type == 4'h1) | (r_uop_br_type == 4'h2)) | (r_uop_br_type == 4'h3)) | (r_uop_br_type == 4'h4)) | (r_uop_br_type == 4'h5)) | (r_uop_br_type == 4'h6)) & ~r_uop_is_sfb) | (r_uop_br_type == 4'h8))),
		.io_ren_br_tags_1_bits(r_uop_br_tag),
		.io_brupdate_b2_uop_br_tag(io_brupdate_b2_uop_br_tag),
		.io_brupdate_b2_mispredict(io_brupdate_b2_mispredict),
		.io_rollback(io_rollback),
		.io_debug_freelist(_freelist_io_debug_freelist)
	);
	assign io_ren_stalls_0 = r_uop_imm_rename & ~_freelist_io_alloc_pregs_0_valid;
	assign io_ren2_uops_0_imm_sel = r_uop_imm_sel;
	assign io_ren2_uops_0_pimm = (r_uop_imm_rename ? _freelist_io_alloc_pregs_0_bits : r_uop_pimm);
endmodule
