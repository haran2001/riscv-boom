module RenameFreeList (
	clock,
	reset,
	io_reqs_0,
	io_alloc_pregs_0_valid,
	io_alloc_pregs_0_bits,
	io_despec_0_valid,
	io_despec_0_bits,
	io_dealloc_0_valid,
	io_dealloc_0_bits,
	io_ren_br_tags_1_valid,
	io_ren_br_tags_1_bits,
	io_brupdate_b2_uop_br_tag,
	io_brupdate_b2_mispredict,
	io_rollback,
	io_debug_freelist
);
	input clock;
	input reset;
	input io_reqs_0;
	output wire io_alloc_pregs_0_valid;
	output wire [5:0] io_alloc_pregs_0_bits;
	input io_despec_0_valid;
	input [5:0] io_despec_0_bits;
	input io_dealloc_0_valid;
	input [5:0] io_dealloc_0_bits;
	input io_ren_br_tags_1_valid;
	input [2:0] io_ren_br_tags_1_bits;
	input [2:0] io_brupdate_b2_uop_br_tag;
	input io_brupdate_b2_mispredict;
	input io_rollback;
	output wire [51:0] io_debug_freelist;
	reg [5:0] r_sel;
	reg [51:0] free_list;
	reg [51:0] spec_alloc_list;
	reg [51:0] br_alloc_lists_0;
	reg [51:0] br_alloc_lists_1;
	reg [51:0] br_alloc_lists_2;
	reg [51:0] br_alloc_lists_3;
	reg [51:0] br_alloc_lists_4;
	reg [51:0] br_alloc_lists_5;
	reg [51:0] br_alloc_lists_6;
	reg [51:0] br_alloc_lists_7;
	wire [51:0] sels_0 = (free_list[0] ? 52'h0000000000001 : (free_list[1] ? 52'h0000000000002 : (free_list[2] ? 52'h0000000000004 : (free_list[3] ? 52'h0000000000008 : (free_list[4] ? 52'h0000000000010 : (free_list[5] ? 52'h0000000000020 : (free_list[6] ? 52'h0000000000040 : (free_list[7] ? 52'h0000000000080 : (free_list[8] ? 52'h0000000000100 : (free_list[9] ? 52'h0000000000200 : (free_list[10] ? 52'h0000000000400 : (free_list[11] ? 52'h0000000000800 : (free_list[12] ? 52'h0000000001000 : (free_list[13] ? 52'h0000000002000 : (free_list[14] ? 52'h0000000004000 : (free_list[15] ? 52'h0000000008000 : (free_list[16] ? 52'h0000000010000 : (free_list[17] ? 52'h0000000020000 : (free_list[18] ? 52'h0000000040000 : (free_list[19] ? 52'h0000000080000 : (free_list[20] ? 52'h0000000100000 : (free_list[21] ? 52'h0000000200000 : (free_list[22] ? 52'h0000000400000 : (free_list[23] ? 52'h0000000800000 : (free_list[24] ? 52'h0000001000000 : (free_list[25] ? 52'h0000002000000 : (free_list[26] ? 52'h0000004000000 : (free_list[27] ? 52'h0000008000000 : (free_list[28] ? 52'h0000010000000 : (free_list[29] ? 52'h0000020000000 : (free_list[30] ? 52'h0000040000000 : (free_list[31] ? 52'h0000080000000 : (free_list[32] ? 52'h0000100000000 : (free_list[33] ? 52'h0000200000000 : (free_list[34] ? 52'h0000400000000 : (free_list[35] ? 52'h0000800000000 : (free_list[36] ? 52'h0001000000000 : (free_list[37] ? 52'h0002000000000 : (free_list[38] ? 52'h0004000000000 : (free_list[39] ? 52'h0008000000000 : (free_list[40] ? 52'h0010000000000 : (free_list[41] ? 52'h0020000000000 : (free_list[42] ? 52'h0040000000000 : (free_list[43] ? 52'h0080000000000 : (free_list[44] ? 52'h0100000000000 : (free_list[45] ? 52'h0200000000000 : (free_list[46] ? 52'h0400000000000 : (free_list[47] ? 52'h0800000000000 : (free_list[48] ? 52'h1000000000000 : (free_list[49] ? 52'h2000000000000 : (free_list[50] ? 52'h4000000000000 : {free_list[51], 51'h0000000000000})))))))))))))))))))))))))))))))))))))))))))))))))));
	wire [63:0] _io_debug_freelist_T = 64'h0000000000000001 << r_sel;
	wire [415:0] _GEN = {br_alloc_lists_7, br_alloc_lists_6, br_alloc_lists_5, br_alloc_lists_4, br_alloc_lists_3, br_alloc_lists_2, br_alloc_lists_1, br_alloc_lists_0};
	wire [51:0] br_deallocs = _GEN[io_brupdate_b2_uop_br_tag * 52+:52] & {52 {io_brupdate_b2_mispredict}};
	reg com_deallocs_REG_0_valid;
	reg [5:0] com_deallocs_REG_0_bits;
	wire [63:0] _com_deallocs_T = 64'h0000000000000001 << com_deallocs_REG_0_bits;
	wire [51:0] dealloc_mask = ((_com_deallocs_T[51:0] & {52 {com_deallocs_REG_0_valid}}) | br_deallocs) | (spec_alloc_list & {52 {io_rollback}});
	reg r_valid;
	wire sel_fire_0 = (~r_valid | io_reqs_0) & |sels_0;
	wire [51:0] io_debug_freelist_0 = free_list | (_io_debug_freelist_T[51:0] & {52 {r_valid}});
	always @(posedge clock) begin : sv2v_autoblock_1
		reg [51:0] alloc_masks_0;
		alloc_masks_0 = _io_debug_freelist_T[51:0] & {52 {io_reqs_0}};
		if (reset) begin
			free_list <= 52'hfffff00000000;
			spec_alloc_list <= 52'h0000000000000;
			r_valid <= 1'h0;
		end
		else begin : sv2v_autoblock_2
			reg [63:0] _com_despec_T;
			_com_despec_T = 64'h0000000000000001 << io_despec_0_bits;
			free_list <= (free_list & ~(sels_0 & {52 {sel_fire_0}})) | dealloc_mask;
			spec_alloc_list <= ((spec_alloc_list | alloc_masks_0) & ~dealloc_mask) & ~(_com_despec_T[51:0] & {52 {io_despec_0_valid}});
			r_valid <= (r_valid & ~io_reqs_0) | (|sels_0);
		end
		if ((io_ren_br_tags_1_bits == 3'h0) & io_ren_br_tags_1_valid)
			br_alloc_lists_0 <= 52'h0000000000000;
		else
			br_alloc_lists_0 <= (br_alloc_lists_0 & ~br_deallocs) | alloc_masks_0;
		if ((io_ren_br_tags_1_bits == 3'h1) & io_ren_br_tags_1_valid)
			br_alloc_lists_1 <= 52'h0000000000000;
		else
			br_alloc_lists_1 <= (br_alloc_lists_1 & ~br_deallocs) | alloc_masks_0;
		if ((io_ren_br_tags_1_bits == 3'h2) & io_ren_br_tags_1_valid)
			br_alloc_lists_2 <= 52'h0000000000000;
		else
			br_alloc_lists_2 <= (br_alloc_lists_2 & ~br_deallocs) | alloc_masks_0;
		if ((io_ren_br_tags_1_bits == 3'h3) & io_ren_br_tags_1_valid)
			br_alloc_lists_3 <= 52'h0000000000000;
		else
			br_alloc_lists_3 <= (br_alloc_lists_3 & ~br_deallocs) | alloc_masks_0;
		if ((io_ren_br_tags_1_bits == 3'h4) & io_ren_br_tags_1_valid)
			br_alloc_lists_4 <= 52'h0000000000000;
		else
			br_alloc_lists_4 <= (br_alloc_lists_4 & ~br_deallocs) | alloc_masks_0;
		if ((io_ren_br_tags_1_bits == 3'h5) & io_ren_br_tags_1_valid)
			br_alloc_lists_5 <= 52'h0000000000000;
		else
			br_alloc_lists_5 <= (br_alloc_lists_5 & ~br_deallocs) | alloc_masks_0;
		if ((io_ren_br_tags_1_bits == 3'h6) & io_ren_br_tags_1_valid)
			br_alloc_lists_6 <= 52'h0000000000000;
		else
			br_alloc_lists_6 <= (br_alloc_lists_6 & ~br_deallocs) | alloc_masks_0;
		if (&io_ren_br_tags_1_bits & io_ren_br_tags_1_valid)
			br_alloc_lists_7 <= 52'h0000000000000;
		else
			br_alloc_lists_7 <= (br_alloc_lists_7 & ~br_deallocs) | alloc_masks_0;
		com_deallocs_REG_0_valid <= io_dealloc_0_valid;
		com_deallocs_REG_0_bits <= io_dealloc_0_bits;
		if (sel_fire_0) begin : sv2v_autoblock_3
			reg [30:0] _r_sel_T_1;
			reg [14:0] _r_sel_T_3;
			reg [6:0] _r_sel_T_5;
			reg [2:0] _r_sel_T_7;
			_r_sel_T_1 = {12'h000, sels_0[51:33]} | sels_0[31:1];
			_r_sel_T_3 = _r_sel_T_1[30:16] | _r_sel_T_1[14:0];
			_r_sel_T_5 = _r_sel_T_3[14:8] | _r_sel_T_3[6:0];
			_r_sel_T_7 = _r_sel_T_5[6:4] | _r_sel_T_5[2:0];
			r_sel <= {|sels_0[51:32], |_r_sel_T_1[30:15], |_r_sel_T_3[14:7], |_r_sel_T_5[6:3], |_r_sel_T_7[2:1], _r_sel_T_7[2] | _r_sel_T_7[0]};
		end
	end
	assign io_alloc_pregs_0_valid = r_valid;
	assign io_alloc_pregs_0_bits = r_sel;
	assign io_debug_freelist = io_debug_freelist_0;
endmodule
