module MemExeUnit (
	clock,
	reset,
	io_kill,
	io_brupdate_b1_resolve_mask,
	io_brupdate_b1_mispredict_mask,
	io_iss_uop_valid,
	io_iss_uop_bits_fu_code_1,
	io_iss_uop_bits_fu_code_2,
	io_iss_uop_bits_iw_p1_bypass_hint,
	io_iss_uop_bits_br_mask,
	io_iss_uop_bits_imm_sel,
	io_iss_uop_bits_pimm,
	io_iss_uop_bits_stq_idx,
	io_iss_uop_bits_prs1,
	io_iss_uop_bits_lrs1_rtype,
	io_arb_irf_reqs_0_ready,
	io_arb_irf_reqs_0_valid,
	io_arb_irf_reqs_0_bits,
	io_arb_rebusys_0_valid,
	io_arb_rebusys_0_bits_uop_pdst,
	io_arb_rebusys_0_bits_rebusy,
	io_rrd_irf_resps_0,
	io_rrd_irf_bypasses_0_valid,
	io_rrd_irf_bypasses_0_bits_uop_pdst,
	io_rrd_irf_bypasses_0_bits_data,
	io_rrd_irf_bypasses_1_valid,
	io_rrd_irf_bypasses_1_bits_uop_pdst,
	io_rrd_irf_bypasses_1_bits_data,
	io_rrd_immrf_wakeup_valid,
	io_rrd_immrf_wakeup_bits_uop_pimm,
	io_squash_iss,
	io_dgen_valid,
	io_dgen_bits_uop_stq_idx,
	io_dgen_bits_data
);
	input clock;
	input reset;
	input io_kill;
	input [7:0] io_brupdate_b1_resolve_mask;
	input [7:0] io_brupdate_b1_mispredict_mask;
	input io_iss_uop_valid;
	input io_iss_uop_bits_fu_code_1;
	input io_iss_uop_bits_fu_code_2;
	input io_iss_uop_bits_iw_p1_bypass_hint;
	input [7:0] io_iss_uop_bits_br_mask;
	input [2:0] io_iss_uop_bits_imm_sel;
	input [4:0] io_iss_uop_bits_pimm;
	input [3:0] io_iss_uop_bits_stq_idx;
	input [5:0] io_iss_uop_bits_prs1;
	input [1:0] io_iss_uop_bits_lrs1_rtype;
	input io_arb_irf_reqs_0_ready;
	output wire io_arb_irf_reqs_0_valid;
	output wire [5:0] io_arb_irf_reqs_0_bits;
	input io_arb_rebusys_0_valid;
	input [5:0] io_arb_rebusys_0_bits_uop_pdst;
	input io_arb_rebusys_0_bits_rebusy;
	input [63:0] io_rrd_irf_resps_0;
	input io_rrd_irf_bypasses_0_valid;
	input [5:0] io_rrd_irf_bypasses_0_bits_uop_pdst;
	input [63:0] io_rrd_irf_bypasses_0_bits_data;
	input io_rrd_irf_bypasses_1_valid;
	input [5:0] io_rrd_irf_bypasses_1_bits_uop_pdst;
	input [63:0] io_rrd_irf_bypasses_1_bits_data;
	output wire io_rrd_immrf_wakeup_valid;
	output wire [4:0] io_rrd_immrf_wakeup_bits_uop_pimm;
	output wire io_squash_iss;
	output wire io_dgen_valid;
	output wire [3:0] io_dgen_bits_uop_stq_idx;
	output wire [63:0] io_dgen_bits_data;
	reg arb_uop_valid;
	reg arb_uop_bits_fu_code_1;
	reg arb_uop_bits_fu_code_2;
	reg arb_uop_bits_iw_p1_bypass_hint;
	reg [7:0] arb_uop_bits_br_mask;
	reg [2:0] arb_uop_bits_imm_sel;
	reg [4:0] arb_uop_bits_pimm;
	reg [3:0] arb_uop_bits_stq_idx;
	reg [5:0] arb_uop_bits_prs1;
	reg [1:0] arb_uop_bits_lrs1_rtype;
	reg rrd_uop_valid;
	reg rrd_uop_bits_fu_code_1;
	reg rrd_uop_bits_fu_code_2;
	reg rrd_uop_bits_iw_p1_bypass_hint;
	reg [7:0] rrd_uop_bits_br_mask;
	reg [2:0] rrd_uop_bits_imm_sel;
	reg [4:0] rrd_uop_bits_pimm;
	reg [3:0] rrd_uop_bits_stq_idx;
	reg [5:0] rrd_uop_bits_prs1;
	reg [1:0] rrd_uop_bits_lrs1_rtype;
	reg exe_uop_valid;
	reg exe_uop_bits_fu_code_1;
	reg exe_uop_bits_fu_code_2;
	reg [3:0] exe_uop_bits_stq_idx;
	wire _arb_rebusied_prs1_T = arb_uop_bits_lrs1_rtype == 2'h0;
	wire io_arb_irf_reqs_0_valid_0 = (arb_uop_valid & _arb_rebusied_prs1_T) & ~arb_uop_bits_iw_p1_bypass_hint;
	reg [63:0] exe_rs1_data;
	wire hits_0 = io_rrd_irf_bypasses_0_valid & (rrd_uop_bits_prs1 == io_rrd_irf_bypasses_0_bits_uop_pdst);
	wire hits_1 = io_rrd_irf_bypasses_1_valid & (rrd_uop_bits_prs1 == io_rrd_irf_bypasses_1_bits_uop_pdst);
	wire rs1_hit = hits_0 | hits_1;
	wire _io_squash_iss_output = io_arb_irf_reqs_0_valid_0 & ~io_arb_irf_reqs_0_ready;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg [7:0] _will_replay_T;
		reg arb_rebusied;
		reg _GEN;
		_will_replay_T = io_brupdate_b1_mispredict_mask & arb_uop_bits_br_mask;
		arb_rebusied = ((_arb_rebusied_prs1_T & io_arb_rebusys_0_valid) & io_arb_rebusys_0_bits_rebusy) & (io_arb_rebusys_0_bits_uop_pdst == arb_uop_bits_prs1);
		_GEN = _io_squash_iss_output | arb_rebusied;
		if (_GEN) begin
			arb_uop_valid <= (arb_uop_valid & ~(|_will_replay_T | io_kill)) & ~arb_rebusied;
			arb_uop_bits_br_mask <= arb_uop_bits_br_mask & ~io_brupdate_b1_resolve_mask;
		end
		else begin
			arb_uop_valid <= io_iss_uop_valid & ~(|(io_brupdate_b1_mispredict_mask & io_iss_uop_bits_br_mask) | io_kill);
			arb_uop_bits_fu_code_1 <= io_iss_uop_bits_fu_code_1;
			arb_uop_bits_fu_code_2 <= io_iss_uop_bits_fu_code_2;
			arb_uop_bits_br_mask <= io_iss_uop_bits_br_mask & ~io_brupdate_b1_resolve_mask;
			arb_uop_bits_imm_sel <= io_iss_uop_bits_imm_sel;
			arb_uop_bits_pimm <= io_iss_uop_bits_pimm;
			arb_uop_bits_stq_idx <= io_iss_uop_bits_stq_idx;
			arb_uop_bits_prs1 <= io_iss_uop_bits_prs1;
			arb_uop_bits_lrs1_rtype <= io_iss_uop_bits_lrs1_rtype;
		end
		arb_uop_bits_iw_p1_bypass_hint <= ~_GEN & io_iss_uop_bits_iw_p1_bypass_hint;
		rrd_uop_valid <= (~_GEN & arb_uop_valid) & ~(|_will_replay_T | io_kill);
		rrd_uop_bits_fu_code_1 <= arb_uop_bits_fu_code_1;
		rrd_uop_bits_fu_code_2 <= arb_uop_bits_fu_code_2;
		rrd_uop_bits_iw_p1_bypass_hint <= arb_uop_bits_iw_p1_bypass_hint;
		rrd_uop_bits_br_mask <= arb_uop_bits_br_mask & ~io_brupdate_b1_resolve_mask;
		rrd_uop_bits_imm_sel <= arb_uop_bits_imm_sel;
		rrd_uop_bits_pimm <= arb_uop_bits_pimm;
		rrd_uop_bits_stq_idx <= arb_uop_bits_stq_idx;
		rrd_uop_bits_prs1 <= arb_uop_bits_prs1;
		rrd_uop_bits_lrs1_rtype <= arb_uop_bits_lrs1_rtype;
		exe_uop_valid <= rrd_uop_valid & ~(|(io_brupdate_b1_mispredict_mask & rrd_uop_bits_br_mask) | io_kill);
		exe_uop_bits_fu_code_1 <= rrd_uop_bits_fu_code_1;
		exe_uop_bits_fu_code_2 <= rrd_uop_bits_fu_code_2;
		exe_uop_bits_stq_idx <= rrd_uop_bits_stq_idx;
		exe_rs1_data <= (&rrd_uop_bits_lrs1_rtype ? 64'h0000000000000000 : (rs1_hit ? (hits_0 ? io_rrd_irf_bypasses_0_bits_data : 64'h0000000000000000) | (hits_1 ? io_rrd_irf_bypasses_1_bits_data : 64'h0000000000000000) : io_rrd_irf_resps_0));
	end
	assign io_arb_irf_reqs_0_valid = io_arb_irf_reqs_0_valid_0;
	assign io_arb_irf_reqs_0_bits = arb_uop_bits_prs1;
	assign io_rrd_immrf_wakeup_valid = rrd_uop_valid & ~((rrd_uop_bits_imm_sel == 3'h6) | (rrd_uop_bits_imm_sel == 3'h5));
	assign io_rrd_immrf_wakeup_bits_uop_pimm = rrd_uop_bits_pimm;
	assign io_squash_iss = _io_squash_iss_output;
	assign io_dgen_valid = exe_uop_valid & exe_uop_bits_fu_code_2;
	assign io_dgen_bits_uop_stq_idx = exe_uop_bits_stq_idx;
	assign io_dgen_bits_data = exe_rs1_data;
endmodule
