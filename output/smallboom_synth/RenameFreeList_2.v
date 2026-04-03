module RenameFreeList_2 (
	clock,
	reset,
	io_reqs_0,
	io_alloc_pregs_0_valid,
	io_alloc_pregs_0_bits,
	io_dealloc_0_valid,
	io_dealloc_0_bits,
	io_dealloc_1_valid,
	io_dealloc_1_bits,
	io_dealloc_2_valid,
	io_dealloc_2_bits,
	io_dealloc_3_valid,
	io_dealloc_3_bits,
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
	output wire [4:0] io_alloc_pregs_0_bits;
	input io_dealloc_0_valid;
	input [4:0] io_dealloc_0_bits;
	input io_dealloc_1_valid;
	input [4:0] io_dealloc_1_bits;
	input io_dealloc_2_valid;
	input [4:0] io_dealloc_2_bits;
	input io_dealloc_3_valid;
	input [4:0] io_dealloc_3_bits;
	input io_ren_br_tags_1_valid;
	input [2:0] io_ren_br_tags_1_bits;
	input [2:0] io_brupdate_b2_uop_br_tag;
	input io_brupdate_b2_mispredict;
	input io_rollback;
	output wire [31:0] io_debug_freelist;
	reg [4:0] r_sel;
	reg [31:0] free_list;
	reg [31:0] spec_alloc_list;
	reg [31:0] br_alloc_lists_0;
	reg [31:0] br_alloc_lists_1;
	reg [31:0] br_alloc_lists_2;
	reg [31:0] br_alloc_lists_3;
	reg [31:0] br_alloc_lists_4;
	reg [31:0] br_alloc_lists_5;
	reg [31:0] br_alloc_lists_6;
	reg [31:0] br_alloc_lists_7;
	wire [31:0] sels_0 = (free_list[0] ? 32'h00000001 : (free_list[1] ? 32'h00000002 : (free_list[2] ? 32'h00000004 : (free_list[3] ? 32'h00000008 : (free_list[4] ? 32'h00000010 : (free_list[5] ? 32'h00000020 : (free_list[6] ? 32'h00000040 : (free_list[7] ? 32'h00000080 : (free_list[8] ? 32'h00000100 : (free_list[9] ? 32'h00000200 : (free_list[10] ? 32'h00000400 : (free_list[11] ? 32'h00000800 : (free_list[12] ? 32'h00001000 : (free_list[13] ? 32'h00002000 : (free_list[14] ? 32'h00004000 : (free_list[15] ? 32'h00008000 : (free_list[16] ? 32'h00010000 : (free_list[17] ? 32'h00020000 : (free_list[18] ? 32'h00040000 : (free_list[19] ? 32'h00080000 : (free_list[20] ? 32'h00100000 : (free_list[21] ? 32'h00200000 : (free_list[22] ? 32'h00400000 : (free_list[23] ? 32'h00800000 : (free_list[24] ? 32'h01000000 : (free_list[25] ? 32'h02000000 : (free_list[26] ? 32'h04000000 : (free_list[27] ? 32'h08000000 : (free_list[28] ? 32'h10000000 : (free_list[29] ? 32'h20000000 : (free_list[30] ? 32'h40000000 : {free_list[31], 31'h00000000})))))))))))))))))))))))))))))));
	wire [31:0] allocs_0 = 32'h00000001 << r_sel;
	reg com_deallocs_REG_0_valid;
	reg [4:0] com_deallocs_REG_0_bits;
	reg com_deallocs_REG_1_valid;
	reg [4:0] com_deallocs_REG_1_bits;
	reg com_deallocs_REG_2_valid;
	reg [4:0] com_deallocs_REG_2_bits;
	reg com_deallocs_REG_3_valid;
	reg [4:0] com_deallocs_REG_3_bits;
	reg r_valid;
	wire sel_fire_0 = (~r_valid | io_reqs_0) & |sels_0;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg [31:0] alloc_masks_0;
		reg [255:0] _GEN;
		reg [31:0] br_deallocs;
		reg [31:0] com_deallocs;
		alloc_masks_0 = allocs_0 & {32 {io_reqs_0}};
		_GEN = {br_alloc_lists_7, br_alloc_lists_6, br_alloc_lists_5, br_alloc_lists_4, br_alloc_lists_3, br_alloc_lists_2, br_alloc_lists_1, br_alloc_lists_0};
		br_deallocs = _GEN[io_brupdate_b2_uop_br_tag * 32+:32] & {32 {io_brupdate_b2_mispredict}};
		com_deallocs = ((((32'h00000001 << com_deallocs_REG_0_bits) & {32 {com_deallocs_REG_0_valid}}) | ((32'h00000001 << com_deallocs_REG_1_bits) & {32 {com_deallocs_REG_1_valid}})) | ((32'h00000001 << com_deallocs_REG_2_bits) & {32 {com_deallocs_REG_2_valid}})) | ((32'h00000001 << com_deallocs_REG_3_bits) & {32 {com_deallocs_REG_3_valid}});
		if (reset) begin
			free_list <= 32'hffffffff;
			spec_alloc_list <= 32'h00000000;
			r_valid <= 1'h0;
		end
		else begin : sv2v_autoblock_2
			reg [31:0] dealloc_mask;
			dealloc_mask = (com_deallocs | br_deallocs) | (spec_alloc_list & {32 {io_rollback}});
			free_list <= (free_list & ~(sels_0 & {32 {sel_fire_0}})) | dealloc_mask;
			spec_alloc_list <= (spec_alloc_list | alloc_masks_0) & ~dealloc_mask;
			r_valid <= (r_valid & ~io_reqs_0) | (|sels_0);
		end
		if ((io_ren_br_tags_1_bits == 3'h0) & io_ren_br_tags_1_valid)
			br_alloc_lists_0 <= 32'h00000000;
		else
			br_alloc_lists_0 <= ((br_alloc_lists_0 & ~br_deallocs) & ~com_deallocs) | alloc_masks_0;
		if ((io_ren_br_tags_1_bits == 3'h1) & io_ren_br_tags_1_valid)
			br_alloc_lists_1 <= 32'h00000000;
		else
			br_alloc_lists_1 <= ((br_alloc_lists_1 & ~br_deallocs) & ~com_deallocs) | alloc_masks_0;
		if ((io_ren_br_tags_1_bits == 3'h2) & io_ren_br_tags_1_valid)
			br_alloc_lists_2 <= 32'h00000000;
		else
			br_alloc_lists_2 <= ((br_alloc_lists_2 & ~br_deallocs) & ~com_deallocs) | alloc_masks_0;
		if ((io_ren_br_tags_1_bits == 3'h3) & io_ren_br_tags_1_valid)
			br_alloc_lists_3 <= 32'h00000000;
		else
			br_alloc_lists_3 <= ((br_alloc_lists_3 & ~br_deallocs) & ~com_deallocs) | alloc_masks_0;
		if ((io_ren_br_tags_1_bits == 3'h4) & io_ren_br_tags_1_valid)
			br_alloc_lists_4 <= 32'h00000000;
		else
			br_alloc_lists_4 <= ((br_alloc_lists_4 & ~br_deallocs) & ~com_deallocs) | alloc_masks_0;
		if ((io_ren_br_tags_1_bits == 3'h5) & io_ren_br_tags_1_valid)
			br_alloc_lists_5 <= 32'h00000000;
		else
			br_alloc_lists_5 <= ((br_alloc_lists_5 & ~br_deallocs) & ~com_deallocs) | alloc_masks_0;
		if ((io_ren_br_tags_1_bits == 3'h6) & io_ren_br_tags_1_valid)
			br_alloc_lists_6 <= 32'h00000000;
		else
			br_alloc_lists_6 <= ((br_alloc_lists_6 & ~br_deallocs) & ~com_deallocs) | alloc_masks_0;
		if (&io_ren_br_tags_1_bits & io_ren_br_tags_1_valid)
			br_alloc_lists_7 <= 32'h00000000;
		else
			br_alloc_lists_7 <= ((br_alloc_lists_7 & ~br_deallocs) & ~com_deallocs) | alloc_masks_0;
		com_deallocs_REG_0_valid <= io_dealloc_0_valid;
		com_deallocs_REG_0_bits <= io_dealloc_0_bits;
		com_deallocs_REG_1_valid <= io_dealloc_1_valid;
		com_deallocs_REG_1_bits <= io_dealloc_1_bits;
		com_deallocs_REG_2_valid <= io_dealloc_2_valid;
		com_deallocs_REG_2_bits <= io_dealloc_2_bits;
		com_deallocs_REG_3_valid <= io_dealloc_3_valid;
		com_deallocs_REG_3_bits <= io_dealloc_3_bits;
		if (sel_fire_0) begin : sv2v_autoblock_3
			reg [14:0] _r_sel_T_1;
			reg [6:0] _r_sel_T_3;
			reg [2:0] _r_sel_T_5;
			_r_sel_T_1 = sels_0[31:17] | sels_0[15:1];
			_r_sel_T_3 = _r_sel_T_1[14:8] | _r_sel_T_1[6:0];
			_r_sel_T_5 = _r_sel_T_3[6:4] | _r_sel_T_3[2:0];
			r_sel <= {|sels_0[31:16], |_r_sel_T_1[14:7], |_r_sel_T_3[6:3], |_r_sel_T_5[2:1], _r_sel_T_5[2] | _r_sel_T_5[0]};
		end
	end
	assign io_alloc_pregs_0_valid = r_valid;
	assign io_alloc_pregs_0_bits = r_sel;
	assign io_debug_freelist = free_list | (allocs_0 & {32 {r_valid}});
endmodule
