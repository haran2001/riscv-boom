module BranchMaskGenerationLogic (
	clock,
	reset,
	io_is_branch_0,
	io_will_fire_0,
	io_br_tag_0,
	io_br_mask_0,
	io_is_full_0,
	io_brupdate_b1_resolve_mask,
	io_brupdate_b2_uop_br_mask,
	io_brupdate_b2_mispredict,
	io_flush_pipeline
);
	input clock;
	input reset;
	input io_is_branch_0;
	input io_will_fire_0;
	output wire [2:0] io_br_tag_0;
	output wire [7:0] io_br_mask_0;
	output wire io_is_full_0;
	input [7:0] io_brupdate_b1_resolve_mask;
	input [7:0] io_brupdate_b2_uop_br_mask;
	input io_brupdate_b2_mispredict;
	input io_flush_pipeline;
	reg [7:0] branch_mask;
	always @(posedge clock)
		if (reset)
			branch_mask <= 8'h00;
		else if (io_flush_pipeline)
			branch_mask <= 8'h00;
		else
			branch_mask <= ((({8 {io_will_fire_0}} & (branch_mask[0] ? (branch_mask[1] ? (branch_mask[2] ? (branch_mask[3] ? (branch_mask[4] ? (branch_mask[5] ? (branch_mask[6] ? {~branch_mask[7], 7'h00} : 8'h40) : 8'h20) : 8'h10) : 8'h08) : 8'h04) : 8'h02) : 8'h01)) | branch_mask) & ~io_brupdate_b1_resolve_mask) & (io_brupdate_b2_mispredict ? io_brupdate_b2_uop_br_mask : 8'hff);
	assign io_br_tag_0 = (branch_mask[0] ? (branch_mask[1] ? (branch_mask[2] ? (branch_mask[3] ? (branch_mask[4] ? (branch_mask[5] ? (branch_mask[6] ? {3 {~branch_mask[7]}} : 3'h6) : 3'h5) : 3'h4) : 3'h3) : 3'h2) : 3'h1) : 3'h0);
	assign io_br_mask_0 = branch_mask & ~io_brupdate_b1_resolve_mask;
	assign io_is_full_0 = &branch_mask & io_is_branch_0;
endmodule
