module ALUExeUnit (
	clock,
	reset,
	io_kill,
	io_brupdate_b1_resolve_mask,
	io_brupdate_b1_mispredict_mask,
	io_iss_uop_valid,
	io_iss_uop_bits_is_rvc,
	io_iss_uop_bits_fu_code_0,
	io_iss_uop_bits_iw_p1_bypass_hint,
	io_iss_uop_bits_iw_p2_bypass_hint,
	io_iss_uop_bits_br_mask,
	io_iss_uop_bits_br_tag,
	io_iss_uop_bits_br_type,
	io_iss_uop_bits_is_sfb,
	io_iss_uop_bits_is_mov,
	io_iss_uop_bits_ftq_idx,
	io_iss_uop_bits_edge_inst,
	io_iss_uop_bits_pc_lob,
	io_iss_uop_bits_taken,
	io_iss_uop_bits_imm_sel,
	io_iss_uop_bits_pimm,
	io_iss_uop_bits_op1_sel,
	io_iss_uop_bits_op2_sel,
	io_iss_uop_bits_rob_idx,
	io_iss_uop_bits_pdst,
	io_iss_uop_bits_prs1,
	io_iss_uop_bits_prs2,
	io_iss_uop_bits_ppred,
	io_iss_uop_bits_csr_cmd,
	io_iss_uop_bits_ldst_is_rs1,
	io_iss_uop_bits_dst_rtype,
	io_iss_uop_bits_lrs1_rtype,
	io_iss_uop_bits_lrs2_rtype,
	io_iss_uop_bits_fcn_dw,
	io_iss_uop_bits_fcn_op,
	io_arb_irf_reqs_0_valid,
	io_arb_irf_reqs_0_bits,
	io_arb_irf_reqs_1_valid,
	io_arb_irf_reqs_1_bits,
	io_arb_rebusys_0_valid,
	io_arb_rebusys_0_bits_uop_pdst,
	io_arb_rebusys_0_bits_rebusy,
	io_rrd_irf_resps_0,
	io_rrd_irf_resps_1,
	io_rrd_irf_bypasses_0_valid,
	io_rrd_irf_bypasses_0_bits_uop_pdst,
	io_rrd_irf_bypasses_0_bits_data,
	io_rrd_irf_bypasses_1_valid,
	io_rrd_irf_bypasses_1_bits_uop_pdst,
	io_rrd_irf_bypasses_1_bits_data,
	io_arb_prf_req_bits,
	io_rrd_prf_resp,
	io_arb_immrf_req_bits,
	io_rrd_immrf_resp,
	io_rrd_immrf_wakeup_valid,
	io_rrd_immrf_wakeup_bits_uop_pimm,
	io_arb_brf_req_bits,
	io_rrd_brf_resp_ldq_idx,
	io_rrd_brf_resp_stq_idx,
	io_arb_ftq_reqs_0_ready,
	io_arb_ftq_reqs_0_valid,
	io_arb_ftq_reqs_0_bits,
	io_arb_ftq_reqs_1_ready,
	io_arb_ftq_reqs_1_valid,
	io_arb_ftq_reqs_1_bits,
	io_rrd_ftq_resps_0_entry_cfi_idx_valid,
	io_rrd_ftq_resps_0_entry_cfi_idx_bits,
	io_rrd_ftq_resps_0_entry_start_bank,
	io_rrd_ftq_resps_0_pc,
	io_rrd_ftq_resps_1_valid,
	io_rrd_ftq_resps_1_pc,
	io_fast_wakeup_valid,
	io_fast_wakeup_bits_uop_pdst,
	io_fast_wakeup_bits_uop_dst_rtype,
	io_fast_pred_wakeup_valid,
	io_fast_pred_wakeup_bits_uop_pdst,
	io_squash_iss,
	io_child_rebusy,
	io_alu_resp_valid,
	io_alu_resp_bits_uop_br_mask,
	io_alu_resp_bits_uop_br_type,
	io_alu_resp_bits_uop_is_sfb,
	io_alu_resp_bits_uop_rob_idx,
	io_alu_resp_bits_uop_pdst,
	io_alu_resp_bits_uop_dst_rtype,
	io_alu_resp_bits_data,
	io_alu_resp_bits_predicated,
	io_brinfo_valid,
	io_brinfo_bits_uop_is_rvc,
	io_brinfo_bits_uop_br_mask,
	io_brinfo_bits_uop_br_tag,
	io_brinfo_bits_uop_ftq_idx,
	io_brinfo_bits_uop_edge_inst,
	io_brinfo_bits_uop_pc_lob,
	io_brinfo_bits_uop_rob_idx,
	io_brinfo_bits_uop_ldq_idx,
	io_brinfo_bits_uop_stq_idx,
	io_brinfo_bits_mispredict,
	io_brinfo_bits_taken,
	io_brinfo_bits_cfi_type,
	io_brinfo_bits_pc_sel,
	io_brinfo_bits_jalr_target,
	io_brinfo_bits_target_offset
);
	input clock;
	input reset;
	input io_kill;
	input [7:0] io_brupdate_b1_resolve_mask;
	input [7:0] io_brupdate_b1_mispredict_mask;
	input io_iss_uop_valid;
	input io_iss_uop_bits_is_rvc;
	input io_iss_uop_bits_fu_code_0;
	input io_iss_uop_bits_iw_p1_bypass_hint;
	input io_iss_uop_bits_iw_p2_bypass_hint;
	input [7:0] io_iss_uop_bits_br_mask;
	input [2:0] io_iss_uop_bits_br_tag;
	input [3:0] io_iss_uop_bits_br_type;
	input io_iss_uop_bits_is_sfb;
	input io_iss_uop_bits_is_mov;
	input [3:0] io_iss_uop_bits_ftq_idx;
	input io_iss_uop_bits_edge_inst;
	input [5:0] io_iss_uop_bits_pc_lob;
	input io_iss_uop_bits_taken;
	input [2:0] io_iss_uop_bits_imm_sel;
	input [4:0] io_iss_uop_bits_pimm;
	input [1:0] io_iss_uop_bits_op1_sel;
	input [2:0] io_iss_uop_bits_op2_sel;
	input [4:0] io_iss_uop_bits_rob_idx;
	input [5:0] io_iss_uop_bits_pdst;
	input [5:0] io_iss_uop_bits_prs1;
	input [5:0] io_iss_uop_bits_prs2;
	input [3:0] io_iss_uop_bits_ppred;
	input [2:0] io_iss_uop_bits_csr_cmd;
	input io_iss_uop_bits_ldst_is_rs1;
	input [1:0] io_iss_uop_bits_dst_rtype;
	input [1:0] io_iss_uop_bits_lrs1_rtype;
	input [1:0] io_iss_uop_bits_lrs2_rtype;
	input io_iss_uop_bits_fcn_dw;
	input [4:0] io_iss_uop_bits_fcn_op;
	output wire io_arb_irf_reqs_0_valid;
	output wire [5:0] io_arb_irf_reqs_0_bits;
	output wire io_arb_irf_reqs_1_valid;
	output wire [5:0] io_arb_irf_reqs_1_bits;
	input io_arb_rebusys_0_valid;
	input [5:0] io_arb_rebusys_0_bits_uop_pdst;
	input io_arb_rebusys_0_bits_rebusy;
	input [63:0] io_rrd_irf_resps_0;
	input [63:0] io_rrd_irf_resps_1;
	input io_rrd_irf_bypasses_0_valid;
	input [5:0] io_rrd_irf_bypasses_0_bits_uop_pdst;
	input [63:0] io_rrd_irf_bypasses_0_bits_data;
	input io_rrd_irf_bypasses_1_valid;
	input [5:0] io_rrd_irf_bypasses_1_bits_uop_pdst;
	input [63:0] io_rrd_irf_bypasses_1_bits_data;
	output wire [3:0] io_arb_prf_req_bits;
	input io_rrd_prf_resp;
	output wire [4:0] io_arb_immrf_req_bits;
	input [63:0] io_rrd_immrf_resp;
	output wire io_rrd_immrf_wakeup_valid;
	output wire [4:0] io_rrd_immrf_wakeup_bits_uop_pimm;
	output wire [2:0] io_arb_brf_req_bits;
	input [3:0] io_rrd_brf_resp_ldq_idx;
	input [3:0] io_rrd_brf_resp_stq_idx;
	input io_arb_ftq_reqs_0_ready;
	output wire io_arb_ftq_reqs_0_valid;
	output wire [3:0] io_arb_ftq_reqs_0_bits;
	input io_arb_ftq_reqs_1_ready;
	output wire io_arb_ftq_reqs_1_valid;
	output wire [3:0] io_arb_ftq_reqs_1_bits;
	input io_rrd_ftq_resps_0_entry_cfi_idx_valid;
	input [1:0] io_rrd_ftq_resps_0_entry_cfi_idx_bits;
	input io_rrd_ftq_resps_0_entry_start_bank;
	input [39:0] io_rrd_ftq_resps_0_pc;
	input io_rrd_ftq_resps_1_valid;
	input [39:0] io_rrd_ftq_resps_1_pc;
	output wire io_fast_wakeup_valid;
	output wire [5:0] io_fast_wakeup_bits_uop_pdst;
	output wire [1:0] io_fast_wakeup_bits_uop_dst_rtype;
	output wire io_fast_pred_wakeup_valid;
	output wire [5:0] io_fast_pred_wakeup_bits_uop_pdst;
	output wire io_squash_iss;
	output wire io_child_rebusy;
	output wire io_alu_resp_valid;
	output wire [7:0] io_alu_resp_bits_uop_br_mask;
	output wire [3:0] io_alu_resp_bits_uop_br_type;
	output wire io_alu_resp_bits_uop_is_sfb;
	output wire [4:0] io_alu_resp_bits_uop_rob_idx;
	output wire [5:0] io_alu_resp_bits_uop_pdst;
	output wire [1:0] io_alu_resp_bits_uop_dst_rtype;
	output wire [63:0] io_alu_resp_bits_data;
	output wire io_alu_resp_bits_predicated;
	output wire io_brinfo_valid;
	output wire io_brinfo_bits_uop_is_rvc;
	output wire [7:0] io_brinfo_bits_uop_br_mask;
	output wire [2:0] io_brinfo_bits_uop_br_tag;
	output wire [3:0] io_brinfo_bits_uop_ftq_idx;
	output wire io_brinfo_bits_uop_edge_inst;
	output wire [5:0] io_brinfo_bits_uop_pc_lob;
	output wire [4:0] io_brinfo_bits_uop_rob_idx;
	output wire [3:0] io_brinfo_bits_uop_ldq_idx;
	output wire [3:0] io_brinfo_bits_uop_stq_idx;
	output wire io_brinfo_bits_mispredict;
	output wire io_brinfo_bits_taken;
	output wire [2:0] io_brinfo_bits_cfi_type;
	output wire [1:0] io_brinfo_bits_pc_sel;
	output wire [39:0] io_brinfo_bits_jalr_target;
	output wire [20:0] io_brinfo_bits_target_offset;
	reg arb_uop_valid;
	reg arb_uop_bits_is_rvc;
	reg arb_uop_bits_fu_code_0;
	reg arb_uop_bits_iw_p1_bypass_hint;
	reg arb_uop_bits_iw_p2_bypass_hint;
	reg [7:0] arb_uop_bits_br_mask;
	reg [2:0] arb_uop_bits_br_tag;
	reg [3:0] arb_uop_bits_br_type;
	reg arb_uop_bits_is_sfb;
	reg arb_uop_bits_is_mov;
	reg [3:0] arb_uop_bits_ftq_idx;
	reg arb_uop_bits_edge_inst;
	reg [5:0] arb_uop_bits_pc_lob;
	reg arb_uop_bits_taken;
	reg [2:0] arb_uop_bits_imm_sel;
	reg [4:0] arb_uop_bits_pimm;
	reg [1:0] arb_uop_bits_op1_sel;
	reg [2:0] arb_uop_bits_op2_sel;
	reg [4:0] arb_uop_bits_rob_idx;
	reg [5:0] arb_uop_bits_pdst;
	reg [5:0] arb_uop_bits_prs1;
	reg [5:0] arb_uop_bits_prs2;
	reg [3:0] arb_uop_bits_ppred;
	reg [2:0] arb_uop_bits_csr_cmd;
	reg arb_uop_bits_ldst_is_rs1;
	reg [1:0] arb_uop_bits_dst_rtype;
	reg [1:0] arb_uop_bits_lrs1_rtype;
	reg [1:0] arb_uop_bits_lrs2_rtype;
	reg arb_uop_bits_fcn_dw;
	reg [4:0] arb_uop_bits_fcn_op;
	reg rrd_uop_valid;
	reg rrd_uop_bits_is_rvc;
	reg rrd_uop_bits_fu_code_0;
	reg rrd_uop_bits_iw_p1_bypass_hint;
	reg rrd_uop_bits_iw_p2_bypass_hint;
	reg [7:0] rrd_uop_bits_br_mask;
	reg [2:0] rrd_uop_bits_br_tag;
	reg [3:0] rrd_uop_bits_br_type;
	reg rrd_uop_bits_is_sfb;
	reg rrd_uop_bits_is_mov;
	reg [3:0] rrd_uop_bits_ftq_idx;
	reg rrd_uop_bits_edge_inst;
	reg [5:0] rrd_uop_bits_pc_lob;
	reg rrd_uop_bits_taken;
	reg [2:0] rrd_uop_bits_imm_sel;
	reg [4:0] rrd_uop_bits_pimm;
	reg [1:0] rrd_uop_bits_op1_sel;
	reg [2:0] rrd_uop_bits_op2_sel;
	reg [4:0] rrd_uop_bits_rob_idx;
	reg [5:0] rrd_uop_bits_pdst;
	reg [5:0] rrd_uop_bits_prs1;
	reg [5:0] rrd_uop_bits_prs2;
	reg [2:0] rrd_uop_bits_csr_cmd;
	reg rrd_uop_bits_ldst_is_rs1;
	reg [1:0] rrd_uop_bits_dst_rtype;
	reg [1:0] rrd_uop_bits_lrs1_rtype;
	reg [1:0] rrd_uop_bits_lrs2_rtype;
	reg rrd_uop_bits_fcn_dw;
	reg [4:0] rrd_uop_bits_fcn_op;
	reg exe_uop_valid;
	reg exe_uop_bits_is_rvc;
	reg exe_uop_bits_fu_code_0;
	reg [7:0] exe_uop_bits_br_mask;
	reg [2:0] exe_uop_bits_br_tag;
	reg [3:0] exe_uop_bits_br_type;
	reg exe_uop_bits_is_sfb;
	reg exe_uop_bits_is_mov;
	reg [3:0] exe_uop_bits_ftq_idx;
	reg exe_uop_bits_edge_inst;
	reg [5:0] exe_uop_bits_pc_lob;
	reg exe_uop_bits_taken;
	reg [4:0] exe_uop_bits_pimm;
	reg [1:0] exe_uop_bits_op1_sel;
	reg [2:0] exe_uop_bits_op2_sel;
	reg [4:0] exe_uop_bits_rob_idx;
	reg [3:0] exe_uop_bits_ldq_idx;
	reg [3:0] exe_uop_bits_stq_idx;
	reg [5:0] exe_uop_bits_pdst;
	reg [5:0] exe_uop_bits_prs1;
	reg [2:0] exe_uop_bits_csr_cmd;
	reg exe_uop_bits_ldst_is_rs1;
	reg [1:0] exe_uop_bits_dst_rtype;
	reg exe_uop_bits_fcn_dw;
	reg [4:0] exe_uop_bits_fcn_op;
	wire _arb_rebusied_prs1_T = arb_uop_bits_lrs1_rtype == 2'h0;
	wire _arb_rebusied_prs2_T = arb_uop_bits_lrs2_rtype == 2'h0;
	wire _arb_rebusied_prs2_T_1 = io_arb_rebusys_0_valid & io_arb_rebusys_0_bits_rebusy;
	wire arb_rebusied = ((_arb_rebusied_prs1_T & _arb_rebusied_prs2_T_1) & (io_arb_rebusys_0_bits_uop_pdst == arb_uop_bits_prs1)) | ((_arb_rebusied_prs2_T & _arb_rebusied_prs2_T_1) & (io_arb_rebusys_0_bits_uop_pdst == arb_uop_bits_prs2));
	reg [63:0] exe_rs1_data;
	reg [63:0] exe_rs2_data;
	wire hits_0 = io_rrd_irf_bypasses_0_valid & (rrd_uop_bits_prs1 == io_rrd_irf_bypasses_0_bits_uop_pdst);
	wire hits_1 = io_rrd_irf_bypasses_1_valid & (rrd_uop_bits_prs1 == io_rrd_irf_bypasses_1_bits_uop_pdst);
	wire rs1_hit = hits_0 | hits_1;
	wire hits_0_1 = io_rrd_irf_bypasses_0_valid & (rrd_uop_bits_prs2 == io_rrd_irf_bypasses_0_bits_uop_pdst);
	wire hits_1_1 = io_rrd_irf_bypasses_1_valid & (rrd_uop_bits_prs2 == io_rrd_irf_bypasses_1_bits_uop_pdst);
	wire rs2_hit = hits_0_1 | hits_1_1;
	reg exe_pred_data;
	wire _exe_imm_data_ip_T = rrd_uop_bits_imm_sel == 3'h6;
	wire _exe_imm_data_T = rrd_uop_bits_imm_sel == 3'h5;
	reg [63:0] exe_imm_data;
	wire io_arb_ftq_reqs_0_valid_0 = arb_uop_valid & ((arb_uop_bits_op1_sel == 2'h2) | (|arb_uop_bits_br_type & arb_uop_bits_is_sfb));
	wire io_arb_ftq_reqs_1_valid_0 = arb_uop_valid & ((arb_uop_bits_br_type == 4'h8) | (|arb_uop_bits_br_type & arb_uop_bits_is_sfb));
	reg exe_ftq_data_0_entry_cfi_idx_valid;
	reg [1:0] exe_ftq_data_0_entry_cfi_idx_bits;
	reg exe_ftq_data_0_entry_start_bank;
	reg [39:0] exe_ftq_data_0_pc;
	reg exe_ftq_data_1_valid;
	reg [39:0] exe_ftq_data_1_pc;
	wire _io_squash_iss_output = (io_arb_ftq_reqs_0_valid_0 & ~io_arb_ftq_reqs_0_ready) | (io_arb_ftq_reqs_1_valid_0 & ~io_arb_ftq_reqs_1_ready);
	always @(posedge clock) begin : sv2v_autoblock_1
		reg [7:0] _will_replay_T;
		reg [19:0] exe_imm_data_ip;
		reg _exe_imm_data_i4_1_T;
		reg _exe_imm_data_i11_T_1;
		reg _GEN;
		exe_imm_data_ip = (_exe_imm_data_ip_T ? 20'h00000 : io_rrd_immrf_resp[19:0]);
		_GEN = _io_squash_iss_output | arb_rebusied;
		_will_replay_T = io_brupdate_b1_mispredict_mask & arb_uop_bits_br_mask;
		_exe_imm_data_i4_1_T = rrd_uop_bits_imm_sel == 3'h3;
		_exe_imm_data_i11_T_1 = rrd_uop_bits_imm_sel == 3'h4;
		if (_GEN) begin
			arb_uop_valid <= (arb_uop_valid & ~(|_will_replay_T | io_kill)) & ~arb_rebusied;
			arb_uop_bits_br_mask <= arb_uop_bits_br_mask & ~io_brupdate_b1_resolve_mask;
		end
		else begin
			arb_uop_valid <= io_iss_uop_valid & ~(|(io_brupdate_b1_mispredict_mask & io_iss_uop_bits_br_mask) | io_kill);
			arb_uop_bits_is_rvc <= io_iss_uop_bits_is_rvc;
			arb_uop_bits_fu_code_0 <= io_iss_uop_bits_fu_code_0;
			arb_uop_bits_br_mask <= io_iss_uop_bits_br_mask & ~io_brupdate_b1_resolve_mask;
			arb_uop_bits_br_tag <= io_iss_uop_bits_br_tag;
			arb_uop_bits_br_type <= io_iss_uop_bits_br_type;
			arb_uop_bits_is_sfb <= io_iss_uop_bits_is_sfb;
			arb_uop_bits_is_mov <= io_iss_uop_bits_is_mov;
			arb_uop_bits_ftq_idx <= io_iss_uop_bits_ftq_idx;
			arb_uop_bits_edge_inst <= io_iss_uop_bits_edge_inst;
			arb_uop_bits_pc_lob <= io_iss_uop_bits_pc_lob;
			arb_uop_bits_taken <= io_iss_uop_bits_taken;
			arb_uop_bits_imm_sel <= io_iss_uop_bits_imm_sel;
			arb_uop_bits_pimm <= io_iss_uop_bits_pimm;
			arb_uop_bits_op1_sel <= io_iss_uop_bits_op1_sel;
			arb_uop_bits_op2_sel <= io_iss_uop_bits_op2_sel;
			arb_uop_bits_rob_idx <= io_iss_uop_bits_rob_idx;
			arb_uop_bits_pdst <= io_iss_uop_bits_pdst;
			arb_uop_bits_prs1 <= io_iss_uop_bits_prs1;
			arb_uop_bits_prs2 <= io_iss_uop_bits_prs2;
			arb_uop_bits_ppred <= io_iss_uop_bits_ppred;
			arb_uop_bits_csr_cmd <= io_iss_uop_bits_csr_cmd;
			arb_uop_bits_ldst_is_rs1 <= io_iss_uop_bits_ldst_is_rs1;
			arb_uop_bits_dst_rtype <= io_iss_uop_bits_dst_rtype;
			arb_uop_bits_lrs1_rtype <= io_iss_uop_bits_lrs1_rtype;
			arb_uop_bits_lrs2_rtype <= io_iss_uop_bits_lrs2_rtype;
			arb_uop_bits_fcn_dw <= io_iss_uop_bits_fcn_dw;
			arb_uop_bits_fcn_op <= io_iss_uop_bits_fcn_op;
		end
		arb_uop_bits_iw_p1_bypass_hint <= ~_GEN & io_iss_uop_bits_iw_p1_bypass_hint;
		arb_uop_bits_iw_p2_bypass_hint <= ~_GEN & io_iss_uop_bits_iw_p2_bypass_hint;
		rrd_uop_valid <= (~_GEN & arb_uop_valid) & ~(|_will_replay_T | io_kill);
		rrd_uop_bits_is_rvc <= arb_uop_bits_is_rvc;
		rrd_uop_bits_fu_code_0 <= arb_uop_bits_fu_code_0;
		rrd_uop_bits_iw_p1_bypass_hint <= arb_uop_bits_iw_p1_bypass_hint;
		rrd_uop_bits_iw_p2_bypass_hint <= arb_uop_bits_iw_p2_bypass_hint;
		rrd_uop_bits_br_mask <= arb_uop_bits_br_mask & ~io_brupdate_b1_resolve_mask;
		rrd_uop_bits_br_tag <= arb_uop_bits_br_tag;
		rrd_uop_bits_br_type <= arb_uop_bits_br_type;
		rrd_uop_bits_is_sfb <= arb_uop_bits_is_sfb;
		rrd_uop_bits_is_mov <= arb_uop_bits_is_mov;
		rrd_uop_bits_ftq_idx <= arb_uop_bits_ftq_idx;
		rrd_uop_bits_edge_inst <= arb_uop_bits_edge_inst;
		rrd_uop_bits_pc_lob <= arb_uop_bits_pc_lob;
		rrd_uop_bits_taken <= arb_uop_bits_taken;
		rrd_uop_bits_imm_sel <= arb_uop_bits_imm_sel;
		rrd_uop_bits_pimm <= arb_uop_bits_pimm;
		rrd_uop_bits_op1_sel <= arb_uop_bits_op1_sel;
		rrd_uop_bits_op2_sel <= arb_uop_bits_op2_sel;
		rrd_uop_bits_rob_idx <= arb_uop_bits_rob_idx;
		rrd_uop_bits_pdst <= arb_uop_bits_pdst;
		rrd_uop_bits_prs1 <= arb_uop_bits_prs1;
		rrd_uop_bits_prs2 <= arb_uop_bits_prs2;
		rrd_uop_bits_csr_cmd <= arb_uop_bits_csr_cmd;
		rrd_uop_bits_ldst_is_rs1 <= arb_uop_bits_ldst_is_rs1;
		rrd_uop_bits_dst_rtype <= arb_uop_bits_dst_rtype;
		rrd_uop_bits_lrs1_rtype <= arb_uop_bits_lrs1_rtype;
		rrd_uop_bits_lrs2_rtype <= arb_uop_bits_lrs2_rtype;
		rrd_uop_bits_fcn_dw <= arb_uop_bits_fcn_dw;
		rrd_uop_bits_fcn_op <= arb_uop_bits_fcn_op;
		exe_uop_valid <= rrd_uop_valid & ~(|(io_brupdate_b1_mispredict_mask & rrd_uop_bits_br_mask) | io_kill);
		exe_uop_bits_is_rvc <= rrd_uop_bits_is_rvc;
		exe_uop_bits_fu_code_0 <= rrd_uop_bits_fu_code_0;
		exe_uop_bits_br_mask <= rrd_uop_bits_br_mask & ~io_brupdate_b1_resolve_mask;
		exe_uop_bits_br_tag <= rrd_uop_bits_br_tag;
		exe_uop_bits_br_type <= rrd_uop_bits_br_type;
		exe_uop_bits_is_sfb <= rrd_uop_bits_is_sfb;
		exe_uop_bits_is_mov <= rrd_uop_bits_is_mov;
		exe_uop_bits_ftq_idx <= rrd_uop_bits_ftq_idx;
		exe_uop_bits_edge_inst <= rrd_uop_bits_edge_inst;
		exe_uop_bits_pc_lob <= rrd_uop_bits_pc_lob;
		exe_uop_bits_taken <= rrd_uop_bits_taken;
		exe_uop_bits_pimm <= rrd_uop_bits_pimm;
		exe_uop_bits_op1_sel <= rrd_uop_bits_op1_sel;
		exe_uop_bits_op2_sel <= rrd_uop_bits_op2_sel;
		exe_uop_bits_rob_idx <= rrd_uop_bits_rob_idx;
		exe_uop_bits_ldq_idx <= io_rrd_brf_resp_ldq_idx;
		exe_uop_bits_stq_idx <= io_rrd_brf_resp_stq_idx;
		exe_uop_bits_pdst <= rrd_uop_bits_pdst;
		exe_uop_bits_prs1 <= rrd_uop_bits_prs1;
		exe_uop_bits_csr_cmd <= rrd_uop_bits_csr_cmd;
		exe_uop_bits_ldst_is_rs1 <= rrd_uop_bits_ldst_is_rs1;
		exe_uop_bits_dst_rtype <= rrd_uop_bits_dst_rtype;
		exe_uop_bits_fcn_dw <= rrd_uop_bits_fcn_dw;
		exe_uop_bits_fcn_op <= rrd_uop_bits_fcn_op;
		exe_rs1_data <= (&rrd_uop_bits_lrs1_rtype ? 64'h0000000000000000 : (rs1_hit ? (hits_0 ? io_rrd_irf_bypasses_0_bits_data : 64'h0000000000000000) | (hits_1 ? io_rrd_irf_bypasses_1_bits_data : 64'h0000000000000000) : io_rrd_irf_resps_0));
		exe_rs2_data <= (&rrd_uop_bits_lrs2_rtype ? 64'h0000000000000000 : (rs2_hit ? (hits_0_1 ? io_rrd_irf_bypasses_0_bits_data : 64'h0000000000000000) | (hits_1_1 ? io_rrd_irf_bypasses_1_bits_data : 64'h0000000000000000) : io_rrd_irf_resps_1));
		exe_pred_data <= io_rrd_prf_resp;
		exe_imm_data <= (_exe_imm_data_T ? {{59 {rrd_uop_bits_pimm[4]}}, rrd_uop_bits_pimm} : {{33 {exe_imm_data_ip[19]}}, (_exe_imm_data_i4_1_T ? exe_imm_data_ip[18:8] : {11 {exe_imm_data_ip[19]}}), (_exe_imm_data_i4_1_T | _exe_imm_data_i11_T_1 ? exe_imm_data_ip[7:0] : {8 {exe_imm_data_ip[19]}}), ~_exe_imm_data_i4_1_T & (_exe_imm_data_i11_T_1 | (rrd_uop_bits_imm_sel == 3'h2) ? exe_imm_data_ip[8] : exe_imm_data_ip[19]), (_exe_imm_data_i4_1_T ? 5'h00 : exe_imm_data_ip[18:14]), (_exe_imm_data_i4_1_T ? 5'h00 : exe_imm_data_ip[13:9]), ((rrd_uop_bits_imm_sel == 3'h1) | (rrd_uop_bits_imm_sel == 3'h0)) & exe_imm_data_ip[8]});
		exe_ftq_data_0_entry_cfi_idx_valid <= io_rrd_ftq_resps_0_entry_cfi_idx_valid;
		exe_ftq_data_0_entry_cfi_idx_bits <= io_rrd_ftq_resps_0_entry_cfi_idx_bits;
		exe_ftq_data_0_entry_start_bank <= io_rrd_ftq_resps_0_entry_start_bank;
		exe_ftq_data_0_pc <= io_rrd_ftq_resps_0_pc;
		exe_ftq_data_1_valid <= io_rrd_ftq_resps_1_valid;
		exe_ftq_data_1_pc <= io_rrd_ftq_resps_1_pc;
	end
	ALUUnit alu(
		.io_req_valid(exe_uop_valid & exe_uop_bits_fu_code_0),
		.io_req_bits_uop_is_rvc(exe_uop_bits_is_rvc),
		.io_req_bits_uop_br_mask(exe_uop_bits_br_mask),
		.io_req_bits_uop_br_tag(exe_uop_bits_br_tag),
		.io_req_bits_uop_br_type(exe_uop_bits_br_type),
		.io_req_bits_uop_is_sfb(exe_uop_bits_is_sfb),
		.io_req_bits_uop_is_mov(exe_uop_bits_is_mov),
		.io_req_bits_uop_ftq_idx(exe_uop_bits_ftq_idx),
		.io_req_bits_uop_edge_inst(exe_uop_bits_edge_inst),
		.io_req_bits_uop_pc_lob(exe_uop_bits_pc_lob),
		.io_req_bits_uop_taken(exe_uop_bits_taken),
		.io_req_bits_uop_pimm(exe_uop_bits_pimm),
		.io_req_bits_uop_op1_sel(exe_uop_bits_op1_sel),
		.io_req_bits_uop_op2_sel(exe_uop_bits_op2_sel),
		.io_req_bits_uop_rob_idx(exe_uop_bits_rob_idx),
		.io_req_bits_uop_ldq_idx(exe_uop_bits_ldq_idx),
		.io_req_bits_uop_stq_idx(exe_uop_bits_stq_idx),
		.io_req_bits_uop_pdst(exe_uop_bits_pdst),
		.io_req_bits_uop_prs1(exe_uop_bits_prs1),
		.io_req_bits_uop_csr_cmd(exe_uop_bits_csr_cmd),
		.io_req_bits_uop_ldst_is_rs1(exe_uop_bits_ldst_is_rs1),
		.io_req_bits_uop_dst_rtype(exe_uop_bits_dst_rtype),
		.io_req_bits_uop_fcn_dw(exe_uop_bits_fcn_dw),
		.io_req_bits_uop_fcn_op(exe_uop_bits_fcn_op),
		.io_req_bits_rs1_data(exe_rs1_data),
		.io_req_bits_rs2_data(exe_rs2_data),
		.io_req_bits_ftq_info_0_entry_cfi_idx_valid(exe_ftq_data_0_entry_cfi_idx_valid),
		.io_req_bits_ftq_info_0_entry_cfi_idx_bits(exe_ftq_data_0_entry_cfi_idx_bits),
		.io_req_bits_ftq_info_0_entry_start_bank(exe_ftq_data_0_entry_start_bank),
		.io_req_bits_ftq_info_0_pc(exe_ftq_data_0_pc),
		.io_req_bits_ftq_info_1_valid(exe_ftq_data_1_valid),
		.io_req_bits_ftq_info_1_pc(exe_ftq_data_1_pc),
		.io_req_bits_pred_data(exe_pred_data),
		.io_req_bits_imm_data(exe_imm_data),
		.io_resp_valid(io_alu_resp_valid),
		.io_resp_bits_uop_br_mask(io_alu_resp_bits_uop_br_mask),
		.io_resp_bits_uop_br_type(io_alu_resp_bits_uop_br_type),
		.io_resp_bits_uop_is_sfb(io_alu_resp_bits_uop_is_sfb),
		.io_resp_bits_uop_rob_idx(io_alu_resp_bits_uop_rob_idx),
		.io_resp_bits_uop_pdst(io_alu_resp_bits_uop_pdst),
		.io_resp_bits_uop_csr_cmd(),
		.io_resp_bits_uop_dst_rtype(io_alu_resp_bits_uop_dst_rtype),
		.io_resp_bits_data(io_alu_resp_bits_data),
		.io_resp_bits_predicated(io_alu_resp_bits_predicated),
		.io_brinfo_valid(io_brinfo_valid),
		.io_brinfo_bits_uop_is_rvc(io_brinfo_bits_uop_is_rvc),
		.io_brinfo_bits_uop_br_mask(io_brinfo_bits_uop_br_mask),
		.io_brinfo_bits_uop_br_tag(io_brinfo_bits_uop_br_tag),
		.io_brinfo_bits_uop_ftq_idx(io_brinfo_bits_uop_ftq_idx),
		.io_brinfo_bits_uop_edge_inst(io_brinfo_bits_uop_edge_inst),
		.io_brinfo_bits_uop_pc_lob(io_brinfo_bits_uop_pc_lob),
		.io_brinfo_bits_uop_rob_idx(io_brinfo_bits_uop_rob_idx),
		.io_brinfo_bits_uop_ldq_idx(io_brinfo_bits_uop_ldq_idx),
		.io_brinfo_bits_uop_stq_idx(io_brinfo_bits_uop_stq_idx),
		.io_brinfo_bits_mispredict(io_brinfo_bits_mispredict),
		.io_brinfo_bits_taken(io_brinfo_bits_taken),
		.io_brinfo_bits_cfi_type(io_brinfo_bits_cfi_type),
		.io_brinfo_bits_pc_sel(io_brinfo_bits_pc_sel),
		.io_brinfo_bits_jalr_target(io_brinfo_bits_jalr_target),
		.io_brinfo_bits_target_offset(io_brinfo_bits_target_offset)
	);
	assign io_arb_irf_reqs_0_valid = (arb_uop_valid & _arb_rebusied_prs1_T) & ~arb_uop_bits_iw_p1_bypass_hint;
	assign io_arb_irf_reqs_0_bits = arb_uop_bits_prs1;
	assign io_arb_irf_reqs_1_valid = (arb_uop_valid & _arb_rebusied_prs2_T) & ~arb_uop_bits_iw_p2_bypass_hint;
	assign io_arb_irf_reqs_1_bits = arb_uop_bits_prs2;
	assign io_arb_prf_req_bits = arb_uop_bits_ppred;
	assign io_arb_immrf_req_bits = arb_uop_bits_pimm;
	assign io_rrd_immrf_wakeup_valid = rrd_uop_valid & ~(_exe_imm_data_ip_T | _exe_imm_data_T);
	assign io_rrd_immrf_wakeup_bits_uop_pimm = rrd_uop_bits_pimm;
	assign io_arb_brf_req_bits = arb_uop_bits_br_tag;
	assign io_arb_ftq_reqs_0_valid = io_arb_ftq_reqs_0_valid_0;
	assign io_arb_ftq_reqs_0_bits = arb_uop_bits_ftq_idx;
	assign io_arb_ftq_reqs_1_valid = io_arb_ftq_reqs_1_valid_0;
	assign io_arb_ftq_reqs_1_bits = arb_uop_bits_ftq_idx + 4'h1;
	assign io_fast_wakeup_valid = io_iss_uop_valid & (io_iss_uop_bits_dst_rtype == 2'h0);
	assign io_fast_wakeup_bits_uop_pdst = io_iss_uop_bits_pdst;
	assign io_fast_wakeup_bits_uop_dst_rtype = io_iss_uop_bits_dst_rtype;
	assign io_fast_pred_wakeup_valid = (rrd_uop_valid & |rrd_uop_bits_br_type) & rrd_uop_bits_is_sfb;
	assign io_fast_pred_wakeup_bits_uop_pdst = rrd_uop_bits_pdst;
	assign io_squash_iss = _io_squash_iss_output;
	assign io_child_rebusy = arb_rebusied & arb_uop_valid;
endmodule
