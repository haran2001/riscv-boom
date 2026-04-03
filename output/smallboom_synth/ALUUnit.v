module ALUUnit (
	io_req_valid,
	io_req_bits_uop_is_rvc,
	io_req_bits_uop_br_mask,
	io_req_bits_uop_br_tag,
	io_req_bits_uop_br_type,
	io_req_bits_uop_is_sfb,
	io_req_bits_uop_is_mov,
	io_req_bits_uop_ftq_idx,
	io_req_bits_uop_edge_inst,
	io_req_bits_uop_pc_lob,
	io_req_bits_uop_taken,
	io_req_bits_uop_pimm,
	io_req_bits_uop_op1_sel,
	io_req_bits_uop_op2_sel,
	io_req_bits_uop_rob_idx,
	io_req_bits_uop_ldq_idx,
	io_req_bits_uop_stq_idx,
	io_req_bits_uop_pdst,
	io_req_bits_uop_prs1,
	io_req_bits_uop_csr_cmd,
	io_req_bits_uop_ldst_is_rs1,
	io_req_bits_uop_dst_rtype,
	io_req_bits_uop_fcn_dw,
	io_req_bits_uop_fcn_op,
	io_req_bits_rs1_data,
	io_req_bits_rs2_data,
	io_req_bits_ftq_info_0_entry_cfi_idx_valid,
	io_req_bits_ftq_info_0_entry_cfi_idx_bits,
	io_req_bits_ftq_info_0_entry_start_bank,
	io_req_bits_ftq_info_0_pc,
	io_req_bits_ftq_info_1_valid,
	io_req_bits_ftq_info_1_pc,
	io_req_bits_pred_data,
	io_req_bits_imm_data,
	io_resp_valid,
	io_resp_bits_uop_br_mask,
	io_resp_bits_uop_br_type,
	io_resp_bits_uop_is_sfb,
	io_resp_bits_uop_rob_idx,
	io_resp_bits_uop_pdst,
	io_resp_bits_uop_csr_cmd,
	io_resp_bits_uop_dst_rtype,
	io_resp_bits_data,
	io_resp_bits_predicated,
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
	input io_req_valid;
	input io_req_bits_uop_is_rvc;
	input [7:0] io_req_bits_uop_br_mask;
	input [2:0] io_req_bits_uop_br_tag;
	input [3:0] io_req_bits_uop_br_type;
	input io_req_bits_uop_is_sfb;
	input io_req_bits_uop_is_mov;
	input [3:0] io_req_bits_uop_ftq_idx;
	input io_req_bits_uop_edge_inst;
	input [5:0] io_req_bits_uop_pc_lob;
	input io_req_bits_uop_taken;
	input [4:0] io_req_bits_uop_pimm;
	input [1:0] io_req_bits_uop_op1_sel;
	input [2:0] io_req_bits_uop_op2_sel;
	input [4:0] io_req_bits_uop_rob_idx;
	input [3:0] io_req_bits_uop_ldq_idx;
	input [3:0] io_req_bits_uop_stq_idx;
	input [5:0] io_req_bits_uop_pdst;
	input [5:0] io_req_bits_uop_prs1;
	input [2:0] io_req_bits_uop_csr_cmd;
	input io_req_bits_uop_ldst_is_rs1;
	input [1:0] io_req_bits_uop_dst_rtype;
	input io_req_bits_uop_fcn_dw;
	input [4:0] io_req_bits_uop_fcn_op;
	input [63:0] io_req_bits_rs1_data;
	input [63:0] io_req_bits_rs2_data;
	input io_req_bits_ftq_info_0_entry_cfi_idx_valid;
	input [1:0] io_req_bits_ftq_info_0_entry_cfi_idx_bits;
	input io_req_bits_ftq_info_0_entry_start_bank;
	input [39:0] io_req_bits_ftq_info_0_pc;
	input io_req_bits_ftq_info_1_valid;
	input [39:0] io_req_bits_ftq_info_1_pc;
	input io_req_bits_pred_data;
	input [63:0] io_req_bits_imm_data;
	output wire io_resp_valid;
	output wire [7:0] io_resp_bits_uop_br_mask;
	output wire [3:0] io_resp_bits_uop_br_type;
	output wire io_resp_bits_uop_is_sfb;
	output wire [4:0] io_resp_bits_uop_rob_idx;
	output wire [5:0] io_resp_bits_uop_pdst;
	output wire [2:0] io_resp_bits_uop_csr_cmd;
	output wire [1:0] io_resp_bits_uop_dst_rtype;
	output wire [63:0] io_resp_bits_data;
	output wire io_resp_bits_predicated;
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
	wire [63:0] _alu_io_out;
	wire [39:0] _uop_pc_T_2 = {io_req_bits_ftq_info_0_pc[39:6], io_req_bits_uop_pc_lob} - {38'h0000000000, io_req_bits_uop_edge_inst, 1'h0};
	wire [66:0] op1_shl = {3'h0, (io_req_bits_uop_fcn_dw ? io_req_bits_rs1_data : {32'h00000000, io_req_bits_rs1_data[31:0]})} << (io_req_bits_uop_fcn_op == 5'h00 ? io_req_bits_uop_pimm[2:1] : 2'h0);
	wire [255:0] _GEN = {op1_shl[63:0], {24 {_uop_pc_T_2[39]}}, _uop_pc_T_2, 64'h0000000000000000, io_req_bits_rs1_data};
	wire br_eq = io_req_bits_rs1_data == io_req_bits_rs2_data;
	wire br_ltu = io_req_bits_rs1_data < io_req_bits_rs2_data;
	wire br_lt = ((io_req_bits_rs1_data[63] ^ ~io_req_bits_rs2_data[63]) & br_ltu) | (io_req_bits_rs1_data[63] & ~io_req_bits_rs2_data[63]);
	wire [1:0] pc_sel = (io_req_bits_uop_br_type == 4'h8 ? 2'h2 : (io_req_bits_uop_br_type == 4'h7 ? 2'h1 : {1'h0, (io_req_bits_uop_br_type == 4'h6 ? br_ltu : (io_req_bits_uop_br_type == 4'h5 ? br_lt : (io_req_bits_uop_br_type == 4'h4 ? ~br_ltu : (io_req_bits_uop_br_type == 4'h3 ? ~br_lt : (io_req_bits_uop_br_type == 4'h2 ? br_eq : (io_req_bits_uop_br_type == 4'h1) & ~br_eq)))))}));
	wire is_br = (io_req_valid & ((((((io_req_bits_uop_br_type == 4'h1) | (io_req_bits_uop_br_type == 4'h2)) | (io_req_bits_uop_br_type == 4'h3)) | (io_req_bits_uop_br_type == 4'h4)) | (io_req_bits_uop_br_type == 4'h5)) | (io_req_bits_uop_br_type == 4'h6))) & ~io_req_bits_uop_is_sfb;
	wire is_jalr = io_req_valid & (io_req_bits_uop_br_type == 4'h8);
	wire [63:0] _jalr_target_xlen_T = io_req_bits_rs1_data + {{43 {io_req_bits_imm_data[20]}}, io_req_bits_imm_data[20:0]};
	wire [39:0] jalr_target = {((_jalr_target_xlen_T[63:39] == 25'h0000000) | &_jalr_target_xlen_T[63:39] ? _jalr_target_xlen_T[39] : ~_jalr_target_xlen_T[38]), _jalr_target_xlen_T[38:0]} & 40'hfffffffffe;
	wire brinfo_valid = is_br | is_jalr;
	wire _io_resp_bits_predicated_T = io_req_bits_uop_br_type == 4'h0;
	RocketALU alu(
		.io_dw(&io_req_bits_uop_op1_sel | io_req_bits_uop_fcn_dw),
		.io_fn(io_req_bits_uop_fcn_op),
		.io_in2(((io_req_bits_uop_op2_sel == 3'h6) | (io_req_bits_uop_op2_sel == 3'h5) ? 64'h0000000000000001 << (io_req_bits_uop_op2_sel[0] ? io_req_bits_rs2_data[5:0] : io_req_bits_imm_data[5:0]) : (io_req_bits_uop_op2_sel == 3'h3 ? {61'h0000000000000000, (io_req_bits_uop_is_rvc ? 3'h2 : 3'h4)} : (io_req_bits_uop_op2_sel == 3'h0 ? io_req_bits_rs2_data : (io_req_bits_uop_op2_sel == 3'h4 ? {59'h000000000000000, io_req_bits_uop_prs1[4:0]} : (io_req_bits_uop_op2_sel == 3'h1 ? io_req_bits_imm_data : 64'h0000000000000000)))))),
		.io_in1(_GEN[io_req_bits_uop_op1_sel * 64+:64]),
		.io_out(_alu_io_out)
	);
	assign io_resp_valid = io_req_valid;
	assign io_resp_bits_uop_br_mask = io_req_bits_uop_br_mask;
	assign io_resp_bits_uop_br_type = io_req_bits_uop_br_type;
	assign io_resp_bits_uop_is_sfb = io_req_bits_uop_is_sfb;
	assign io_resp_bits_uop_rob_idx = io_req_bits_uop_rob_idx;
	assign io_resp_bits_uop_pdst = io_req_bits_uop_pdst;
	assign io_resp_bits_uop_csr_cmd = io_req_bits_uop_csr_cmd;
	assign io_resp_bits_uop_dst_rtype = io_req_bits_uop_dst_rtype;
	assign io_resp_bits_data = (|io_req_bits_uop_br_type & io_req_bits_uop_is_sfb ? {63'h0000000000000000, pc_sel == 2'h1} : ((_io_resp_bits_predicated_T & io_req_bits_uop_is_sfb) & io_req_bits_pred_data ? (io_req_bits_uop_ldst_is_rs1 ? io_req_bits_rs1_data : io_req_bits_rs2_data) : (io_req_bits_uop_is_mov ? io_req_bits_rs2_data : _alu_io_out)));
	assign io_resp_bits_predicated = (_io_resp_bits_predicated_T & io_req_bits_uop_is_sfb) & io_req_bits_pred_data;
	assign io_brinfo_valid = brinfo_valid;
	assign io_brinfo_bits_uop_is_rvc = io_req_bits_uop_is_rvc;
	assign io_brinfo_bits_uop_br_mask = io_req_bits_uop_br_mask;
	assign io_brinfo_bits_uop_br_tag = io_req_bits_uop_br_tag;
	assign io_brinfo_bits_uop_ftq_idx = io_req_bits_uop_ftq_idx;
	assign io_brinfo_bits_uop_edge_inst = io_req_bits_uop_edge_inst;
	assign io_brinfo_bits_uop_pc_lob = io_req_bits_uop_pc_lob;
	assign io_brinfo_bits_uop_rob_idx = io_req_bits_uop_rob_idx;
	assign io_brinfo_bits_uop_ldq_idx = io_req_bits_uop_ldq_idx;
	assign io_brinfo_bits_uop_stq_idx = io_req_bits_uop_stq_idx;
	assign io_brinfo_bits_mispredict = brinfo_valid & (pc_sel == 2'h2 ? ((~io_req_bits_ftq_info_1_valid | (io_req_bits_ftq_info_1_pc != jalr_target)) | ~io_req_bits_ftq_info_0_entry_cfi_idx_valid) | (io_req_bits_ftq_info_0_entry_cfi_idx_bits != io_req_bits_uop_pc_lob[2:1]) : (pc_sel == 2'h1 ? ~io_req_bits_uop_taken : (pc_sel == 2'h0) & io_req_bits_uop_taken));
	assign io_brinfo_bits_taken = (io_req_valid & |io_req_bits_uop_br_type) & |pc_sel;
	assign io_brinfo_bits_cfi_type = (is_jalr ? 3'h3 : {2'h0, is_br});
	assign io_brinfo_bits_pc_sel = pc_sel;
	assign io_brinfo_bits_jalr_target = jalr_target;
	assign io_brinfo_bits_target_offset = io_req_bits_imm_data[20:0];
endmodule
