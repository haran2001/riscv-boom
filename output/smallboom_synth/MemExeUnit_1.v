module MemExeUnit_1 (
	clock,
	reset,
	io_kill,
	io_brupdate_b1_resolve_mask,
	io_brupdate_b1_mispredict_mask,
	io_ready_fu_types_1,
	io_iss_uop_valid,
	io_iss_uop_bits_fu_code_1,
	io_iss_uop_bits_fu_code_2,
	io_iss_uop_bits_iw_p1_bypass_hint,
	io_iss_uop_bits_br_mask,
	io_iss_uop_bits_imm_sel,
	io_iss_uop_bits_pimm,
	io_iss_uop_bits_ldq_idx,
	io_iss_uop_bits_stq_idx,
	io_iss_uop_bits_pdst,
	io_iss_uop_bits_prs1,
	io_iss_uop_bits_uses_ldq,
	io_iss_uop_bits_uses_stq,
	io_iss_uop_bits_dst_rtype,
	io_iss_uop_bits_lrs1_rtype,
	io_iss_uop_bits_fp_val,
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
	io_arb_immrf_req_bits,
	io_rrd_immrf_resp,
	io_rrd_immrf_wakeup_valid,
	io_rrd_immrf_wakeup_bits_uop_pimm,
	io_squash_iss,
	io_agen_valid,
	io_agen_bits_uop_br_mask,
	io_agen_bits_uop_ldq_idx,
	io_agen_bits_uop_stq_idx,
	io_agen_bits_uop_pdst,
	io_agen_bits_uop_uses_ldq,
	io_agen_bits_uop_uses_stq,
	io_agen_bits_uop_dst_rtype,
	io_agen_bits_uop_fp_val,
	io_agen_bits_data,
	io_dgen_valid,
	io_dgen_bits_uop_stq_idx,
	io_dgen_bits_data
);
	input clock;
	input reset;
	input io_kill;
	input [7:0] io_brupdate_b1_resolve_mask;
	input [7:0] io_brupdate_b1_mispredict_mask;
	output wire io_ready_fu_types_1;
	input io_iss_uop_valid;
	input io_iss_uop_bits_fu_code_1;
	input io_iss_uop_bits_fu_code_2;
	input io_iss_uop_bits_iw_p1_bypass_hint;
	input [7:0] io_iss_uop_bits_br_mask;
	input [2:0] io_iss_uop_bits_imm_sel;
	input [4:0] io_iss_uop_bits_pimm;
	input [3:0] io_iss_uop_bits_ldq_idx;
	input [3:0] io_iss_uop_bits_stq_idx;
	input [5:0] io_iss_uop_bits_pdst;
	input [5:0] io_iss_uop_bits_prs1;
	input io_iss_uop_bits_uses_ldq;
	input io_iss_uop_bits_uses_stq;
	input [1:0] io_iss_uop_bits_dst_rtype;
	input [1:0] io_iss_uop_bits_lrs1_rtype;
	input io_iss_uop_bits_fp_val;
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
	output wire [4:0] io_arb_immrf_req_bits;
	input [63:0] io_rrd_immrf_resp;
	output wire io_rrd_immrf_wakeup_valid;
	output wire [4:0] io_rrd_immrf_wakeup_bits_uop_pimm;
	output wire io_squash_iss;
	output wire io_agen_valid;
	output wire [7:0] io_agen_bits_uop_br_mask;
	output wire [3:0] io_agen_bits_uop_ldq_idx;
	output wire [3:0] io_agen_bits_uop_stq_idx;
	output wire [5:0] io_agen_bits_uop_pdst;
	output wire io_agen_bits_uop_uses_ldq;
	output wire io_agen_bits_uop_uses_stq;
	output wire [1:0] io_agen_bits_uop_dst_rtype;
	output wire io_agen_bits_uop_fp_val;
	output wire [63:0] io_agen_bits_data;
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
	reg [3:0] arb_uop_bits_ldq_idx;
	reg [3:0] arb_uop_bits_stq_idx;
	reg [5:0] arb_uop_bits_pdst;
	reg [5:0] arb_uop_bits_prs1;
	reg arb_uop_bits_uses_ldq;
	reg arb_uop_bits_uses_stq;
	reg [1:0] arb_uop_bits_dst_rtype;
	reg [1:0] arb_uop_bits_lrs1_rtype;
	reg arb_uop_bits_fp_val;
	reg rrd_uop_valid;
	reg rrd_uop_bits_fu_code_1;
	reg rrd_uop_bits_fu_code_2;
	reg rrd_uop_bits_iw_p1_bypass_hint;
	reg [7:0] rrd_uop_bits_br_mask;
	reg [2:0] rrd_uop_bits_imm_sel;
	reg [4:0] rrd_uop_bits_pimm;
	reg [3:0] rrd_uop_bits_ldq_idx;
	reg [3:0] rrd_uop_bits_stq_idx;
	reg [5:0] rrd_uop_bits_pdst;
	reg [5:0] rrd_uop_bits_prs1;
	reg rrd_uop_bits_uses_ldq;
	reg rrd_uop_bits_uses_stq;
	reg [1:0] rrd_uop_bits_dst_rtype;
	reg [1:0] rrd_uop_bits_lrs1_rtype;
	reg rrd_uop_bits_fp_val;
	reg exe_uop_valid;
	reg exe_uop_bits_fu_code_1;
	reg exe_uop_bits_fu_code_2;
	reg [7:0] exe_uop_bits_br_mask;
	reg [3:0] exe_uop_bits_ldq_idx;
	reg [3:0] exe_uop_bits_stq_idx;
	reg [5:0] exe_uop_bits_pdst;
	reg exe_uop_bits_uses_ldq;
	reg exe_uop_bits_uses_stq;
	reg [1:0] exe_uop_bits_dst_rtype;
	reg exe_uop_bits_fp_val;
	wire _arb_rebusied_prs1_T = arb_uop_bits_lrs1_rtype == 2'h0;
	wire io_arb_irf_reqs_0_valid_0 = (arb_uop_valid & _arb_rebusied_prs1_T) & ~arb_uop_bits_iw_p1_bypass_hint;
	reg [63:0] exe_rs1_data;
	wire hits_0 = io_rrd_irf_bypasses_0_valid & (rrd_uop_bits_prs1 == io_rrd_irf_bypasses_0_bits_uop_pdst);
	wire hits_1 = io_rrd_irf_bypasses_1_valid & (rrd_uop_bits_prs1 == io_rrd_irf_bypasses_1_bits_uop_pdst);
	wire rs1_hit = hits_0 | hits_1;
	wire _exe_imm_data_ip_T = rrd_uop_bits_imm_sel == 3'h6;
	wire _exe_imm_data_T = rrd_uop_bits_imm_sel == 3'h5;
	reg [63:0] exe_imm_data;
	wire _io_squash_iss_output = io_arb_irf_reqs_0_valid_0 & ~io_arb_irf_reqs_0_ready;
	reg [4:0] io_agen_saturating_loads_counter;
	reg io_agen_pause_mem_REG;
	wire [63:0] _io_agen_sum_T_2 = exe_rs1_data + exe_imm_data;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg [7:0] _will_replay_T;
		reg arb_rebusied;
		reg [19:0] exe_imm_data_ip;
		reg _exe_imm_data_i4_1_T;
		reg _exe_imm_data_i11_T_1;
		reg _GEN;
		reg io_agen_loads_saturating;
		exe_imm_data_ip = (_exe_imm_data_ip_T ? 20'h00000 : io_rrd_immrf_resp[19:0]);
		_will_replay_T = io_brupdate_b1_mispredict_mask & arb_uop_bits_br_mask;
		arb_rebusied = ((_arb_rebusied_prs1_T & io_arb_rebusys_0_valid) & io_arb_rebusys_0_bits_rebusy) & (io_arb_rebusys_0_bits_uop_pdst == arb_uop_bits_prs1);
		_exe_imm_data_i4_1_T = rrd_uop_bits_imm_sel == 3'h3;
		_exe_imm_data_i11_T_1 = rrd_uop_bits_imm_sel == 3'h4;
		_GEN = _io_squash_iss_output | arb_rebusied;
		io_agen_loads_saturating = (exe_uop_valid & exe_uop_bits_uses_ldq) & exe_uop_bits_fu_code_1;
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
			arb_uop_bits_ldq_idx <= io_iss_uop_bits_ldq_idx;
			arb_uop_bits_stq_idx <= io_iss_uop_bits_stq_idx;
			arb_uop_bits_pdst <= io_iss_uop_bits_pdst;
			arb_uop_bits_prs1 <= io_iss_uop_bits_prs1;
			arb_uop_bits_uses_ldq <= io_iss_uop_bits_uses_ldq;
			arb_uop_bits_uses_stq <= io_iss_uop_bits_uses_stq;
			arb_uop_bits_dst_rtype <= io_iss_uop_bits_dst_rtype;
			arb_uop_bits_lrs1_rtype <= io_iss_uop_bits_lrs1_rtype;
			arb_uop_bits_fp_val <= io_iss_uop_bits_fp_val;
		end
		arb_uop_bits_iw_p1_bypass_hint <= ~_GEN & io_iss_uop_bits_iw_p1_bypass_hint;
		rrd_uop_valid <= (~_GEN & arb_uop_valid) & ~(|_will_replay_T | io_kill);
		rrd_uop_bits_fu_code_1 <= arb_uop_bits_fu_code_1;
		rrd_uop_bits_fu_code_2 <= arb_uop_bits_fu_code_2;
		rrd_uop_bits_iw_p1_bypass_hint <= arb_uop_bits_iw_p1_bypass_hint;
		rrd_uop_bits_br_mask <= arb_uop_bits_br_mask & ~io_brupdate_b1_resolve_mask;
		rrd_uop_bits_imm_sel <= arb_uop_bits_imm_sel;
		rrd_uop_bits_pimm <= arb_uop_bits_pimm;
		rrd_uop_bits_ldq_idx <= arb_uop_bits_ldq_idx;
		rrd_uop_bits_stq_idx <= arb_uop_bits_stq_idx;
		rrd_uop_bits_pdst <= arb_uop_bits_pdst;
		rrd_uop_bits_prs1 <= arb_uop_bits_prs1;
		rrd_uop_bits_uses_ldq <= arb_uop_bits_uses_ldq;
		rrd_uop_bits_uses_stq <= arb_uop_bits_uses_stq;
		rrd_uop_bits_dst_rtype <= arb_uop_bits_dst_rtype;
		rrd_uop_bits_lrs1_rtype <= arb_uop_bits_lrs1_rtype;
		rrd_uop_bits_fp_val <= arb_uop_bits_fp_val;
		exe_uop_valid <= rrd_uop_valid & ~(|(io_brupdate_b1_mispredict_mask & rrd_uop_bits_br_mask) | io_kill);
		exe_uop_bits_fu_code_1 <= rrd_uop_bits_fu_code_1;
		exe_uop_bits_fu_code_2 <= rrd_uop_bits_fu_code_2;
		exe_uop_bits_br_mask <= rrd_uop_bits_br_mask & ~io_brupdate_b1_resolve_mask;
		exe_uop_bits_ldq_idx <= rrd_uop_bits_ldq_idx;
		exe_uop_bits_stq_idx <= rrd_uop_bits_stq_idx;
		exe_uop_bits_pdst <= rrd_uop_bits_pdst;
		exe_uop_bits_uses_ldq <= rrd_uop_bits_uses_ldq;
		exe_uop_bits_uses_stq <= rrd_uop_bits_uses_stq;
		exe_uop_bits_dst_rtype <= rrd_uop_bits_dst_rtype;
		exe_uop_bits_fp_val <= rrd_uop_bits_fp_val;
		exe_rs1_data <= (&rrd_uop_bits_lrs1_rtype ? 64'h0000000000000000 : (rs1_hit ? (hits_0 ? io_rrd_irf_bypasses_0_bits_data : 64'h0000000000000000) | (hits_1 ? io_rrd_irf_bypasses_1_bits_data : 64'h0000000000000000) : io_rrd_irf_resps_0));
		exe_imm_data <= (_exe_imm_data_T ? {{59 {rrd_uop_bits_pimm[4]}}, rrd_uop_bits_pimm} : {{33 {exe_imm_data_ip[19]}}, (_exe_imm_data_i4_1_T ? exe_imm_data_ip[18:8] : {11 {exe_imm_data_ip[19]}}), (_exe_imm_data_i4_1_T | _exe_imm_data_i11_T_1 ? exe_imm_data_ip[7:0] : {8 {exe_imm_data_ip[19]}}), ~_exe_imm_data_i4_1_T & (_exe_imm_data_i11_T_1 | (rrd_uop_bits_imm_sel == 3'h2) ? exe_imm_data_ip[8] : exe_imm_data_ip[19]), (_exe_imm_data_i4_1_T ? 5'h00 : exe_imm_data_ip[18:14]), (_exe_imm_data_i4_1_T ? 5'h00 : exe_imm_data_ip[13:9]), ((rrd_uop_bits_imm_sel == 3'h1) | (rrd_uop_bits_imm_sel == 3'h0)) & exe_imm_data_ip[8]});
		io_agen_pause_mem_REG <= io_agen_loads_saturating;
		if (reset)
			io_agen_saturating_loads_counter <= 5'h00;
		else if (io_agen_loads_saturating)
			io_agen_saturating_loads_counter <= io_agen_saturating_loads_counter + 5'h01;
		else
			io_agen_saturating_loads_counter <= 5'h00;
	end
	assign io_ready_fu_types_1 = ~(io_agen_pause_mem_REG & (&io_agen_saturating_loads_counter));
	assign io_arb_irf_reqs_0_valid = io_arb_irf_reqs_0_valid_0;
	assign io_arb_irf_reqs_0_bits = arb_uop_bits_prs1;
	assign io_arb_immrf_req_bits = arb_uop_bits_pimm;
	assign io_rrd_immrf_wakeup_valid = rrd_uop_valid & ~(_exe_imm_data_ip_T | _exe_imm_data_T);
	assign io_rrd_immrf_wakeup_bits_uop_pimm = rrd_uop_bits_pimm;
	assign io_squash_iss = _io_squash_iss_output;
	assign io_agen_valid = exe_uop_valid & exe_uop_bits_fu_code_1;
	assign io_agen_bits_uop_br_mask = exe_uop_bits_br_mask;
	assign io_agen_bits_uop_ldq_idx = exe_uop_bits_ldq_idx;
	assign io_agen_bits_uop_stq_idx = exe_uop_bits_stq_idx;
	assign io_agen_bits_uop_pdst = exe_uop_bits_pdst;
	assign io_agen_bits_uop_uses_ldq = exe_uop_bits_uses_ldq;
	assign io_agen_bits_uop_uses_stq = exe_uop_bits_uses_stq;
	assign io_agen_bits_uop_dst_rtype = exe_uop_bits_dst_rtype;
	assign io_agen_bits_uop_fp_val = exe_uop_bits_fp_val;
	assign io_agen_bits_data = {{25 {(_io_agen_sum_T_2[38] ? &_io_agen_sum_T_2[63:39] : |_io_agen_sum_T_2[63:39])}}, _io_agen_sum_T_2[38:0]};
	assign io_dgen_valid = exe_uop_valid & exe_uop_bits_fu_code_2;
	assign io_dgen_bits_uop_stq_idx = exe_uop_bits_stq_idx;
	assign io_dgen_bits_data = exe_rs1_data;
endmodule
