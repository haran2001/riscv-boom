module IssueSlot_8 (
	clock,
	reset,
	io_valid,
	io_will_be_valid,
	io_request,
	io_grant,
	io_iss_uop_fu_code_1,
	io_iss_uop_fu_code_2,
	io_iss_uop_iw_p1_bypass_hint,
	io_iss_uop_br_mask,
	io_iss_uop_imm_sel,
	io_iss_uop_pimm,
	io_iss_uop_ldq_idx,
	io_iss_uop_stq_idx,
	io_iss_uop_pdst,
	io_iss_uop_prs1,
	io_iss_uop_uses_ldq,
	io_iss_uop_uses_stq,
	io_iss_uop_dst_rtype,
	io_iss_uop_lrs1_rtype,
	io_iss_uop_fp_val,
	io_in_uop_valid,
	io_in_uop_bits_fu_code_1,
	io_in_uop_bits_fu_code_2,
	io_in_uop_bits_iw_issued,
	io_in_uop_bits_iw_issued_partial_agen,
	io_in_uop_bits_iw_issued_partial_dgen,
	io_in_uop_bits_iw_p1_speculative_child,
	io_in_uop_bits_iw_p2_speculative_child,
	io_in_uop_bits_iw_p1_bypass_hint,
	io_in_uop_bits_iw_p2_bypass_hint,
	io_in_uop_bits_br_mask,
	io_in_uop_bits_imm_sel,
	io_in_uop_bits_pimm,
	io_in_uop_bits_ldq_idx,
	io_in_uop_bits_stq_idx,
	io_in_uop_bits_pdst,
	io_in_uop_bits_prs1,
	io_in_uop_bits_prs2,
	io_in_uop_bits_prs1_busy,
	io_in_uop_bits_prs2_busy,
	io_in_uop_bits_ppred_busy,
	io_in_uop_bits_uses_ldq,
	io_in_uop_bits_uses_stq,
	io_in_uop_bits_dst_rtype,
	io_in_uop_bits_lrs1_rtype,
	io_in_uop_bits_lrs2_rtype,
	io_in_uop_bits_fp_val,
	io_out_uop_fu_code_1,
	io_out_uop_fu_code_2,
	io_out_uop_iw_issued,
	io_out_uop_iw_issued_partial_agen,
	io_out_uop_iw_issued_partial_dgen,
	io_out_uop_iw_p1_speculative_child,
	io_out_uop_iw_p2_speculative_child,
	io_out_uop_iw_p1_bypass_hint,
	io_out_uop_iw_p2_bypass_hint,
	io_out_uop_br_mask,
	io_out_uop_imm_sel,
	io_out_uop_pimm,
	io_out_uop_ldq_idx,
	io_out_uop_stq_idx,
	io_out_uop_pdst,
	io_out_uop_prs1,
	io_out_uop_prs2,
	io_out_uop_prs1_busy,
	io_out_uop_prs2_busy,
	io_out_uop_ppred_busy,
	io_out_uop_uses_ldq,
	io_out_uop_uses_stq,
	io_out_uop_dst_rtype,
	io_out_uop_lrs1_rtype,
	io_out_uop_lrs2_rtype,
	io_out_uop_fp_val,
	io_brupdate_b1_resolve_mask,
	io_brupdate_b1_mispredict_mask,
	io_kill,
	io_clear,
	io_squash_grant,
	io_wakeup_ports_0_valid,
	io_wakeup_ports_0_bits_uop_pdst,
	io_wakeup_ports_0_bits_bypassable,
	io_wakeup_ports_0_bits_rebusy,
	io_wakeup_ports_1_valid,
	io_wakeup_ports_1_bits_uop_pdst,
	io_wakeup_ports_2_valid,
	io_wakeup_ports_2_bits_uop_pdst,
	io_child_rebusys
);
	input clock;
	input reset;
	output wire io_valid;
	output wire io_will_be_valid;
	output wire io_request;
	input io_grant;
	output wire io_iss_uop_fu_code_1;
	output wire io_iss_uop_fu_code_2;
	output wire io_iss_uop_iw_p1_bypass_hint;
	output wire [7:0] io_iss_uop_br_mask;
	output wire [2:0] io_iss_uop_imm_sel;
	output wire [4:0] io_iss_uop_pimm;
	output wire [3:0] io_iss_uop_ldq_idx;
	output wire [3:0] io_iss_uop_stq_idx;
	output wire [5:0] io_iss_uop_pdst;
	output wire [5:0] io_iss_uop_prs1;
	output wire io_iss_uop_uses_ldq;
	output wire io_iss_uop_uses_stq;
	output wire [1:0] io_iss_uop_dst_rtype;
	output wire [1:0] io_iss_uop_lrs1_rtype;
	output wire io_iss_uop_fp_val;
	input io_in_uop_valid;
	input io_in_uop_bits_fu_code_1;
	input io_in_uop_bits_fu_code_2;
	input io_in_uop_bits_iw_issued;
	input io_in_uop_bits_iw_issued_partial_agen;
	input io_in_uop_bits_iw_issued_partial_dgen;
	input io_in_uop_bits_iw_p1_speculative_child;
	input io_in_uop_bits_iw_p2_speculative_child;
	input io_in_uop_bits_iw_p1_bypass_hint;
	input io_in_uop_bits_iw_p2_bypass_hint;
	input [7:0] io_in_uop_bits_br_mask;
	input [2:0] io_in_uop_bits_imm_sel;
	input [4:0] io_in_uop_bits_pimm;
	input [3:0] io_in_uop_bits_ldq_idx;
	input [3:0] io_in_uop_bits_stq_idx;
	input [5:0] io_in_uop_bits_pdst;
	input [5:0] io_in_uop_bits_prs1;
	input [5:0] io_in_uop_bits_prs2;
	input io_in_uop_bits_prs1_busy;
	input io_in_uop_bits_prs2_busy;
	input io_in_uop_bits_ppred_busy;
	input io_in_uop_bits_uses_ldq;
	input io_in_uop_bits_uses_stq;
	input [1:0] io_in_uop_bits_dst_rtype;
	input [1:0] io_in_uop_bits_lrs1_rtype;
	input [1:0] io_in_uop_bits_lrs2_rtype;
	input io_in_uop_bits_fp_val;
	output wire io_out_uop_fu_code_1;
	output wire io_out_uop_fu_code_2;
	output wire io_out_uop_iw_issued;
	output wire io_out_uop_iw_issued_partial_agen;
	output wire io_out_uop_iw_issued_partial_dgen;
	output wire io_out_uop_iw_p1_speculative_child;
	output wire io_out_uop_iw_p2_speculative_child;
	output wire io_out_uop_iw_p1_bypass_hint;
	output wire io_out_uop_iw_p2_bypass_hint;
	output wire [7:0] io_out_uop_br_mask;
	output wire [2:0] io_out_uop_imm_sel;
	output wire [4:0] io_out_uop_pimm;
	output wire [3:0] io_out_uop_ldq_idx;
	output wire [3:0] io_out_uop_stq_idx;
	output wire [5:0] io_out_uop_pdst;
	output wire [5:0] io_out_uop_prs1;
	output wire [5:0] io_out_uop_prs2;
	output wire io_out_uop_prs1_busy;
	output wire io_out_uop_prs2_busy;
	output wire io_out_uop_ppred_busy;
	output wire io_out_uop_uses_ldq;
	output wire io_out_uop_uses_stq;
	output wire [1:0] io_out_uop_dst_rtype;
	output wire [1:0] io_out_uop_lrs1_rtype;
	output wire [1:0] io_out_uop_lrs2_rtype;
	output wire io_out_uop_fp_val;
	input [7:0] io_brupdate_b1_resolve_mask;
	input [7:0] io_brupdate_b1_mispredict_mask;
	input io_kill;
	input io_clear;
	input io_squash_grant;
	input io_wakeup_ports_0_valid;
	input [5:0] io_wakeup_ports_0_bits_uop_pdst;
	input io_wakeup_ports_0_bits_bypassable;
	input io_wakeup_ports_0_bits_rebusy;
	input io_wakeup_ports_1_valid;
	input [5:0] io_wakeup_ports_1_bits_uop_pdst;
	input io_wakeup_ports_2_valid;
	input [5:0] io_wakeup_ports_2_bits_uop_pdst;
	input io_child_rebusys;
	wire next_valid;
	wire agen_ready;
	reg slot_valid;
	reg slot_uop_fu_code_1;
	reg slot_uop_fu_code_2;
	reg slot_uop_iw_issued;
	reg slot_uop_iw_issued_partial_agen;
	reg slot_uop_iw_issued_partial_dgen;
	reg slot_uop_iw_p1_speculative_child;
	reg slot_uop_iw_p2_speculative_child;
	reg slot_uop_iw_p1_bypass_hint;
	reg slot_uop_iw_p2_bypass_hint;
	reg [7:0] slot_uop_br_mask;
	reg [2:0] slot_uop_imm_sel;
	reg [4:0] slot_uop_pimm;
	reg [3:0] slot_uop_ldq_idx;
	reg [3:0] slot_uop_stq_idx;
	reg [5:0] slot_uop_pdst;
	reg [5:0] slot_uop_prs1;
	reg [5:0] slot_uop_prs2;
	reg slot_uop_prs1_busy;
	reg slot_uop_prs2_busy;
	reg slot_uop_ppred_busy;
	reg slot_uop_uses_ldq;
	reg slot_uop_uses_stq;
	reg [1:0] slot_uop_dst_rtype;
	reg [1:0] slot_uop_lrs1_rtype;
	reg [1:0] slot_uop_lrs2_rtype;
	reg slot_uop_fp_val;
	wire [7:0] next_uop_br_mask = slot_uop_br_mask & ~io_brupdate_b1_resolve_mask;
	wire killed = |(io_brupdate_b1_mispredict_mask & slot_uop_br_mask) | io_kill;
	wire prs1_matches_0 = io_wakeup_ports_0_bits_uop_pdst == slot_uop_prs1;
	wire prs2_matches_0 = io_wakeup_ports_0_bits_uop_pdst == slot_uop_prs2;
	wire prs1_wakeups_0 = io_wakeup_ports_0_valid & prs1_matches_0;
	wire prs1_wakeups_2 = io_wakeup_ports_2_valid & (io_wakeup_ports_2_bits_uop_pdst == slot_uop_prs1);
	wire prs2_wakeups_0 = io_wakeup_ports_0_valid & prs2_matches_0;
	wire prs2_wakeups_2 = io_wakeup_ports_2_valid & (io_wakeup_ports_2_bits_uop_pdst == slot_uop_prs2);
	wire _GEN = (prs1_wakeups_0 | (io_wakeup_ports_1_valid & (io_wakeup_ports_1_bits_uop_pdst == slot_uop_prs1))) | prs1_wakeups_2;
	wire next_uop_iw_p1_speculative_child = _GEN & prs1_wakeups_2;
	wire next_uop_iw_p1_bypass_hint = _GEN & ((prs1_wakeups_0 & io_wakeup_ports_0_bits_bypassable) | prs1_wakeups_2);
	wire rebusied_prs1 = ((io_wakeup_ports_0_bits_rebusy & prs1_matches_0) | (io_child_rebusys & slot_uop_iw_p1_speculative_child)) & (slot_uop_lrs1_rtype == 2'h0);
	wire next_uop_prs1_busy = rebusied_prs1 | (~_GEN & slot_uop_prs1_busy);
	wire _GEN_0 = (prs2_wakeups_0 | (io_wakeup_ports_1_valid & (io_wakeup_ports_1_bits_uop_pdst == slot_uop_prs2))) | prs2_wakeups_2;
	wire next_uop_iw_p2_speculative_child = _GEN_0 & prs2_wakeups_2;
	wire next_uop_iw_p2_bypass_hint = _GEN_0 & ((prs2_wakeups_0 & io_wakeup_ports_0_bits_bypassable) | prs2_wakeups_2);
	wire rebusied_prs2 = ((io_wakeup_ports_0_bits_rebusy & prs2_matches_0) | (io_child_rebusys & slot_uop_iw_p2_speculative_child)) & (slot_uop_lrs2_rtype == 2'h0);
	wire next_uop_prs2_busy = rebusied_prs2 | (~_GEN_0 & slot_uop_prs2_busy);
	wire next_uop_iw_issued = io_grant & ~io_squash_grant;
	wire _GEN_1 = slot_uop_fu_code_1 & slot_uop_fu_code_2;
	wire next_uop_iw_issued_partial_agen = (_GEN_1 & agen_ready) & next_uop_iw_issued;
	wire next_uop_iw_issued_partial_dgen = (_GEN_1 & ~agen_ready) & next_uop_iw_issued;
	wire _GEN_2 = ~slot_uop_prs1_busy & ~slot_uop_ppred_busy;
	assign agen_ready = _GEN_2 & slot_uop_fu_code_1;
	wire _GEN_3 = slot_valid & slot_uop_iw_issued;
	wire _GEN_4 = rebusied_prs1 & slot_uop_fu_code_1;
	wire _GEN_5 = ~rebusied_prs1 | slot_uop_fu_code_2;
	assign next_valid = (_GEN_3 ? ((slot_uop_iw_issued_partial_agen | slot_uop_iw_issued_partial_dgen) | rebusied_prs1) | rebusied_prs2 : slot_valid);
	wire _GEN_6 = slot_uop_iw_issued_partial_dgen & ~rebusied_prs2;
	wire _GEN_7 = _GEN_6 | slot_uop_fu_code_1;
	wire _GEN_8 = ~_GEN_6 & slot_uop_fu_code_2;
	always @(posedge clock) begin
		if (reset)
			slot_valid <= 1'h0;
		else
			slot_valid <= ~io_kill & (io_in_uop_valid | ((~io_clear & next_valid) & ~killed));
		if (io_in_uop_valid) begin
			slot_uop_fu_code_1 <= io_in_uop_bits_fu_code_1;
			slot_uop_fu_code_2 <= io_in_uop_bits_fu_code_2;
			slot_uop_br_mask <= io_in_uop_bits_br_mask;
			slot_uop_imm_sel <= io_in_uop_bits_imm_sel;
			slot_uop_pimm <= io_in_uop_bits_pimm;
			slot_uop_ldq_idx <= io_in_uop_bits_ldq_idx;
			slot_uop_stq_idx <= io_in_uop_bits_stq_idx;
			slot_uop_pdst <= io_in_uop_bits_pdst;
			slot_uop_prs1 <= io_in_uop_bits_prs1;
			slot_uop_prs2 <= io_in_uop_bits_prs2;
			slot_uop_prs1_busy <= io_in_uop_bits_prs1_busy;
			slot_uop_prs2_busy <= io_in_uop_bits_prs2_busy;
			slot_uop_ppred_busy <= io_in_uop_bits_ppred_busy;
			slot_uop_uses_ldq <= io_in_uop_bits_uses_ldq;
			slot_uop_uses_stq <= io_in_uop_bits_uses_stq;
			slot_uop_dst_rtype <= io_in_uop_bits_dst_rtype;
			slot_uop_lrs1_rtype <= io_in_uop_bits_lrs1_rtype;
			slot_uop_lrs2_rtype <= io_in_uop_bits_lrs2_rtype;
			slot_uop_fp_val <= io_in_uop_bits_fp_val;
		end
		else begin
			if (_GEN_3) begin
				if (slot_uop_iw_issued_partial_agen) begin
					slot_uop_fu_code_1 <= _GEN_4;
					slot_uop_fu_code_2 <= _GEN_5;
				end
				else begin
					slot_uop_fu_code_1 <= _GEN_7;
					slot_uop_fu_code_2 <= _GEN_8;
				end
			end
			slot_uop_br_mask <= next_uop_br_mask;
			slot_uop_prs1_busy <= next_uop_prs1_busy;
			slot_uop_prs2_busy <= next_uop_prs2_busy;
		end
		slot_uop_iw_issued <= (io_in_uop_valid ? io_in_uop_bits_iw_issued : next_uop_iw_issued);
		slot_uop_iw_issued_partial_agen <= (io_in_uop_valid ? io_in_uop_bits_iw_issued_partial_agen : next_uop_iw_issued_partial_agen);
		slot_uop_iw_issued_partial_dgen <= (io_in_uop_valid ? io_in_uop_bits_iw_issued_partial_dgen : next_uop_iw_issued_partial_dgen);
		slot_uop_iw_p1_speculative_child <= (io_in_uop_valid ? io_in_uop_bits_iw_p1_speculative_child : next_uop_iw_p1_speculative_child);
		slot_uop_iw_p2_speculative_child <= (io_in_uop_valid ? io_in_uop_bits_iw_p2_speculative_child : next_uop_iw_p2_speculative_child);
		slot_uop_iw_p1_bypass_hint <= (io_in_uop_valid ? io_in_uop_bits_iw_p1_bypass_hint : next_uop_iw_p1_bypass_hint);
		slot_uop_iw_p2_bypass_hint <= (io_in_uop_valid ? io_in_uop_bits_iw_p2_bypass_hint : next_uop_iw_p2_bypass_hint);
	end
	assign io_valid = slot_valid;
	assign io_will_be_valid = next_valid & ~killed;
	assign io_request = (slot_valid & ~slot_uop_iw_issued) & ((((~slot_uop_prs1_busy & ~slot_uop_prs2_busy) & ~slot_uop_ppred_busy) | agen_ready) | ((slot_uop_fu_code_2 & ~slot_uop_prs2_busy) & ~slot_uop_ppred_busy));
	assign io_iss_uop_fu_code_1 = (~_GEN_1 | _GEN_2) & slot_uop_fu_code_1;
	assign io_iss_uop_fu_code_2 = (_GEN_1 ? ~agen_ready : slot_uop_fu_code_2);
	assign io_iss_uop_iw_p1_bypass_hint = (_GEN_1 ? (agen_ready ? slot_uop_iw_p1_bypass_hint : slot_uop_iw_p2_bypass_hint) : (slot_uop_fu_code_2 ? slot_uop_iw_p2_bypass_hint : slot_uop_iw_p1_bypass_hint));
	assign io_iss_uop_br_mask = slot_uop_br_mask;
	assign io_iss_uop_imm_sel = (_GEN_1 ? (agen_ready ? slot_uop_imm_sel : 3'h6) : (slot_uop_fu_code_2 ? 3'h6 : slot_uop_imm_sel));
	assign io_iss_uop_pimm = slot_uop_pimm;
	assign io_iss_uop_ldq_idx = slot_uop_ldq_idx;
	assign io_iss_uop_stq_idx = slot_uop_stq_idx;
	assign io_iss_uop_pdst = slot_uop_pdst;
	assign io_iss_uop_prs1 = (_GEN_1 ? (agen_ready ? slot_uop_prs1 : slot_uop_prs2) : (slot_uop_fu_code_2 ? slot_uop_prs2 : slot_uop_prs1));
	assign io_iss_uop_uses_ldq = slot_uop_uses_ldq;
	assign io_iss_uop_uses_stq = slot_uop_uses_stq;
	assign io_iss_uop_dst_rtype = slot_uop_dst_rtype;
	assign io_iss_uop_lrs1_rtype = (_GEN_1 ? (agen_ready ? slot_uop_lrs1_rtype : slot_uop_lrs2_rtype) : (slot_uop_fu_code_2 ? slot_uop_lrs2_rtype : slot_uop_lrs1_rtype));
	assign io_iss_uop_fp_val = slot_uop_fp_val;
	assign io_out_uop_fu_code_1 = (_GEN_3 ? (slot_uop_iw_issued_partial_agen ? _GEN_4 : _GEN_7) : slot_uop_fu_code_1);
	assign io_out_uop_fu_code_2 = (_GEN_3 ? (slot_uop_iw_issued_partial_agen ? _GEN_5 : _GEN_8) : slot_uop_fu_code_2);
	assign io_out_uop_iw_issued = next_uop_iw_issued;
	assign io_out_uop_iw_issued_partial_agen = next_uop_iw_issued_partial_agen;
	assign io_out_uop_iw_issued_partial_dgen = next_uop_iw_issued_partial_dgen;
	assign io_out_uop_iw_p1_speculative_child = next_uop_iw_p1_speculative_child;
	assign io_out_uop_iw_p2_speculative_child = next_uop_iw_p2_speculative_child;
	assign io_out_uop_iw_p1_bypass_hint = next_uop_iw_p1_bypass_hint;
	assign io_out_uop_iw_p2_bypass_hint = next_uop_iw_p2_bypass_hint;
	assign io_out_uop_br_mask = next_uop_br_mask;
	assign io_out_uop_imm_sel = slot_uop_imm_sel;
	assign io_out_uop_pimm = slot_uop_pimm;
	assign io_out_uop_ldq_idx = slot_uop_ldq_idx;
	assign io_out_uop_stq_idx = slot_uop_stq_idx;
	assign io_out_uop_pdst = slot_uop_pdst;
	assign io_out_uop_prs1 = slot_uop_prs1;
	assign io_out_uop_prs2 = slot_uop_prs2;
	assign io_out_uop_prs1_busy = next_uop_prs1_busy;
	assign io_out_uop_prs2_busy = next_uop_prs2_busy;
	assign io_out_uop_ppred_busy = slot_uop_ppred_busy;
	assign io_out_uop_uses_ldq = slot_uop_uses_ldq;
	assign io_out_uop_uses_stq = slot_uop_uses_stq;
	assign io_out_uop_dst_rtype = slot_uop_dst_rtype;
	assign io_out_uop_lrs1_rtype = slot_uop_lrs1_rtype;
	assign io_out_uop_lrs2_rtype = slot_uop_lrs2_rtype;
	assign io_out_uop_fp_val = slot_uop_fp_val;
endmodule
