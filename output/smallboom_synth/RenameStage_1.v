module RenameStage_1 (
	clock,
	reset,
	io_ren_stalls_0,
	io_kill,
	io_dec_fire_0,
	io_dec_uops_0_br_tag,
	io_dec_uops_0_br_type,
	io_dec_uops_0_is_sfb,
	io_dec_uops_0_ldst,
	io_dec_uops_0_lrs1,
	io_dec_uops_0_lrs2,
	io_dec_uops_0_lrs3,
	io_dec_uops_0_dst_rtype,
	io_dec_uops_0_lrs1_rtype,
	io_dec_uops_0_lrs2_rtype,
	io_dec_uops_0_frs3_en,
	io_ren2_uops_0_pdst,
	io_ren2_uops_0_prs1,
	io_ren2_uops_0_prs2,
	io_ren2_uops_0_prs3,
	io_ren2_uops_0_prs1_busy,
	io_ren2_uops_0_prs2_busy,
	io_ren2_uops_0_prs3_busy,
	io_ren2_uops_0_stale_pdst,
	io_brupdate_b2_uop_br_tag,
	io_brupdate_b2_mispredict,
	io_dis_fire_0,
	io_dis_ready,
	io_wakeups_0_valid,
	io_wakeups_0_bits_uop_pdst,
	io_wakeups_0_bits_uop_dst_rtype,
	io_wakeups_1_valid,
	io_wakeups_1_bits_uop_pdst,
	io_wakeups_1_bits_uop_dst_rtype,
	io_com_valids_0,
	io_com_uops_0_pdst,
	io_com_uops_0_stale_pdst,
	io_com_uops_0_ldst,
	io_com_uops_0_dst_rtype,
	io_rollback
);
	input clock;
	input reset;
	output wire io_ren_stalls_0;
	input io_kill;
	input io_dec_fire_0;
	input [2:0] io_dec_uops_0_br_tag;
	input [3:0] io_dec_uops_0_br_type;
	input io_dec_uops_0_is_sfb;
	input [5:0] io_dec_uops_0_ldst;
	input [5:0] io_dec_uops_0_lrs1;
	input [5:0] io_dec_uops_0_lrs2;
	input [5:0] io_dec_uops_0_lrs3;
	input [1:0] io_dec_uops_0_dst_rtype;
	input [1:0] io_dec_uops_0_lrs1_rtype;
	input [1:0] io_dec_uops_0_lrs2_rtype;
	input io_dec_uops_0_frs3_en;
	output wire [5:0] io_ren2_uops_0_pdst;
	output wire [5:0] io_ren2_uops_0_prs1;
	output wire [5:0] io_ren2_uops_0_prs2;
	output wire [5:0] io_ren2_uops_0_prs3;
	output wire io_ren2_uops_0_prs1_busy;
	output wire io_ren2_uops_0_prs2_busy;
	output wire io_ren2_uops_0_prs3_busy;
	output wire [5:0] io_ren2_uops_0_stale_pdst;
	input [2:0] io_brupdate_b2_uop_br_tag;
	input io_brupdate_b2_mispredict;
	input io_dis_fire_0;
	input io_dis_ready;
	input io_wakeups_0_valid;
	input [5:0] io_wakeups_0_bits_uop_pdst;
	input [1:0] io_wakeups_0_bits_uop_dst_rtype;
	input io_wakeups_1_valid;
	input [5:0] io_wakeups_1_bits_uop_pdst;
	input [1:0] io_wakeups_1_bits_uop_dst_rtype;
	input io_com_valids_0;
	input [5:0] io_com_uops_0_pdst;
	input [5:0] io_com_uops_0_stale_pdst;
	input [5:0] io_com_uops_0_ldst;
	input [1:0] io_com_uops_0_dst_rtype;
	input io_rollback;
	wire _io_ren_stalls_0_T;
	reg r_valid;
	wire _busytable_io_busy_resps_0_prs1_busy;
	wire _busytable_io_busy_resps_0_prs2_busy;
	wire _busytable_io_busy_resps_0_prs3_busy;
	wire _freelist_io_alloc_pregs_0_valid;
	wire [5:0] _freelist_io_alloc_pregs_0_bits;
	wire [47:0] _freelist_io_debug_freelist;
	wire [5:0] _maptable_io_map_resps_0_prs1;
	wire [5:0] _maptable_io_map_resps_0_prs2;
	wire [5:0] _maptable_io_map_resps_0_prs3;
	wire [5:0] _maptable_io_map_resps_0_stale_pdst;
	wire ren2_alloc_fire_0 = (io_dis_fire_0 & _io_ren_stalls_0_T) & r_valid;
	reg [2:0] r_uop_br_tag;
	reg [3:0] r_uop_br_type;
	reg r_uop_is_sfb;
	reg [5:0] r_uop_prs1;
	reg [5:0] r_uop_prs2;
	reg [5:0] r_uop_prs3;
	reg [5:0] r_uop_stale_pdst;
	reg [5:0] r_uop_ldst;
	reg [5:0] r_uop_lrs1;
	reg [5:0] r_uop_lrs2;
	reg [5:0] r_uop_lrs3;
	reg [1:0] r_uop_dst_rtype;
	reg [1:0] r_uop_lrs1_rtype;
	reg [1:0] r_uop_lrs2_rtype;
	reg r_uop_frs3_en;
	wire ren2_br_tags_1_valid = io_dis_fire_0 & ((((((((r_uop_br_type == 4'h1) | (r_uop_br_type == 4'h2)) | (r_uop_br_type == 4'h3)) | (r_uop_br_type == 4'h4)) | (r_uop_br_type == 4'h5)) | (r_uop_br_type == 4'h6)) & ~r_uop_is_sfb) | (r_uop_br_type == 4'h8));
	assign _io_ren_stalls_0_T = r_uop_dst_rtype == 2'h1;
	wire com_valids_0 = (io_com_uops_0_dst_rtype == 2'h1) & io_com_valids_0;
	reg REG;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg _GEN;
		_GEN = io_kill | ~io_dis_ready;
		if (reset)
			r_valid <= 1'h0;
		else
			r_valid <= ~io_kill & (io_dis_ready ? io_dec_fire_0 : r_valid & ~io_dis_fire_0);
		if (_GEN)
			;
		else begin
			r_uop_br_tag <= io_dec_uops_0_br_tag;
			r_uop_br_type <= io_dec_uops_0_br_type;
			r_uop_is_sfb <= io_dec_uops_0_is_sfb;
		end
		if (ren2_alloc_fire_0 & (r_uop_ldst == (_GEN ? r_uop_lrs1 : io_dec_uops_0_lrs1)))
			r_uop_prs1 <= _freelist_io_alloc_pregs_0_bits;
		else if (_GEN)
			;
		else
			r_uop_prs1 <= _maptable_io_map_resps_0_prs1;
		if (ren2_alloc_fire_0 & (r_uop_ldst == (_GEN ? r_uop_lrs2 : io_dec_uops_0_lrs2)))
			r_uop_prs2 <= _freelist_io_alloc_pregs_0_bits;
		else if (_GEN)
			;
		else
			r_uop_prs2 <= _maptable_io_map_resps_0_prs2;
		if (ren2_alloc_fire_0 & (r_uop_ldst == (_GEN ? r_uop_lrs3 : io_dec_uops_0_lrs3)))
			r_uop_prs3 <= _freelist_io_alloc_pregs_0_bits;
		else if (_GEN)
			;
		else
			r_uop_prs3 <= _maptable_io_map_resps_0_prs3;
		if (ren2_alloc_fire_0 & (r_uop_ldst == (_GEN ? r_uop_ldst : io_dec_uops_0_ldst)))
			r_uop_stale_pdst <= _freelist_io_alloc_pregs_0_bits;
		else if (_GEN)
			;
		else
			r_uop_stale_pdst <= _maptable_io_map_resps_0_stale_pdst;
		if (_GEN)
			;
		else begin
			r_uop_ldst <= io_dec_uops_0_ldst;
			r_uop_lrs1 <= io_dec_uops_0_lrs1;
			r_uop_lrs2 <= io_dec_uops_0_lrs2;
			r_uop_lrs3 <= io_dec_uops_0_lrs3;
			r_uop_dst_rtype <= io_dec_uops_0_dst_rtype;
			r_uop_lrs1_rtype <= io_dec_uops_0_lrs1_rtype;
			r_uop_lrs2_rtype <= io_dec_uops_0_lrs2_rtype;
			r_uop_frs3_en <= io_dec_uops_0_frs3_en;
		end
		REG <= io_rollback;
	end
	RenameMapTable_1 maptable(
		.clock(clock),
		.reset(reset),
		.io_map_reqs_0_lrs1(io_dec_uops_0_lrs1),
		.io_map_reqs_0_lrs2(io_dec_uops_0_lrs2),
		.io_map_reqs_0_lrs3(io_dec_uops_0_lrs3),
		.io_map_reqs_0_ldst(io_dec_uops_0_ldst),
		.io_map_resps_0_prs1(_maptable_io_map_resps_0_prs1),
		.io_map_resps_0_prs2(_maptable_io_map_resps_0_prs2),
		.io_map_resps_0_prs3(_maptable_io_map_resps_0_prs3),
		.io_map_resps_0_stale_pdst(_maptable_io_map_resps_0_stale_pdst),
		.io_remap_reqs_0_ldst(r_uop_ldst),
		.io_remap_reqs_0_pdst(_freelist_io_alloc_pregs_0_bits),
		.io_remap_reqs_0_valid(ren2_alloc_fire_0),
		.io_com_remap_reqs_0_ldst(io_com_uops_0_ldst),
		.io_com_remap_reqs_0_pdst(io_com_uops_0_pdst),
		.io_com_remap_reqs_0_valid(com_valids_0),
		.io_ren_br_tags_1_valid(ren2_br_tags_1_valid),
		.io_ren_br_tags_1_bits(r_uop_br_tag),
		.io_brupdate_b2_uop_br_tag(io_brupdate_b2_uop_br_tag),
		.io_brupdate_b2_mispredict(io_brupdate_b2_mispredict),
		.io_rollback(io_rollback)
	);
	RenameFreeList_1 freelist(
		.clock(clock),
		.reset(reset),
		.io_reqs_0(ren2_alloc_fire_0),
		.io_alloc_pregs_0_valid(_freelist_io_alloc_pregs_0_valid),
		.io_alloc_pregs_0_bits(_freelist_io_alloc_pregs_0_bits),
		.io_despec_0_valid(com_valids_0),
		.io_despec_0_bits(io_com_uops_0_pdst),
		.io_dealloc_0_valid(com_valids_0),
		.io_dealloc_0_bits(io_com_uops_0_stale_pdst),
		.io_ren_br_tags_1_valid(ren2_br_tags_1_valid),
		.io_ren_br_tags_1_bits(r_uop_br_tag),
		.io_brupdate_b2_uop_br_tag(io_brupdate_b2_uop_br_tag),
		.io_brupdate_b2_mispredict(io_brupdate_b2_mispredict),
		.io_rollback(io_rollback),
		.io_debug_freelist(_freelist_io_debug_freelist)
	);
	RenameBusyTable_1 busytable(
		.clock(clock),
		.reset(reset),
		.io_ren_uops_0_pdst(_freelist_io_alloc_pregs_0_bits),
		.io_ren_uops_0_prs1(r_uop_prs1),
		.io_ren_uops_0_prs2(r_uop_prs2),
		.io_ren_uops_0_prs3(r_uop_prs3),
		.io_busy_resps_0_prs1_busy(_busytable_io_busy_resps_0_prs1_busy),
		.io_busy_resps_0_prs2_busy(_busytable_io_busy_resps_0_prs2_busy),
		.io_busy_resps_0_prs3_busy(_busytable_io_busy_resps_0_prs3_busy),
		.io_rebusy_reqs_0(ren2_alloc_fire_0),
		.io_wakeups_0_valid(io_wakeups_0_valid),
		.io_wakeups_0_bits_uop_pdst(io_wakeups_0_bits_uop_pdst),
		.io_wakeups_1_valid(io_wakeups_1_valid),
		.io_wakeups_1_bits_uop_pdst(io_wakeups_1_bits_uop_pdst)
	);
	assign io_ren_stalls_0 = _io_ren_stalls_0_T & ~_freelist_io_alloc_pregs_0_valid;
	assign io_ren2_uops_0_pdst = _freelist_io_alloc_pregs_0_bits;
	assign io_ren2_uops_0_prs1 = r_uop_prs1;
	assign io_ren2_uops_0_prs2 = r_uop_prs2;
	assign io_ren2_uops_0_prs3 = r_uop_prs3;
	assign io_ren2_uops_0_prs1_busy = (r_uop_lrs1_rtype == 2'h1) & _busytable_io_busy_resps_0_prs1_busy;
	assign io_ren2_uops_0_prs2_busy = (r_uop_lrs2_rtype == 2'h1) & _busytable_io_busy_resps_0_prs2_busy;
	assign io_ren2_uops_0_prs3_busy = r_uop_frs3_en & _busytable_io_busy_resps_0_prs3_busy;
	assign io_ren2_uops_0_stale_pdst = r_uop_stale_pdst;
endmodule
