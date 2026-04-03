module BoomTile (
	clock,
	reset,
	auto_buffer_out_a_ready,
	auto_buffer_out_a_valid,
	auto_buffer_out_a_bits_opcode,
	auto_buffer_out_a_bits_param,
	auto_buffer_out_a_bits_size,
	auto_buffer_out_a_bits_source,
	auto_buffer_out_a_bits_address,
	auto_buffer_out_a_bits_mask,
	auto_buffer_out_a_bits_data,
	auto_buffer_out_a_bits_corrupt,
	auto_buffer_out_b_ready,
	auto_buffer_out_b_valid,
	auto_buffer_out_b_bits_opcode,
	auto_buffer_out_b_bits_param,
	auto_buffer_out_b_bits_size,
	auto_buffer_out_b_bits_source,
	auto_buffer_out_b_bits_address,
	auto_buffer_out_b_bits_mask,
	auto_buffer_out_b_bits_data,
	auto_buffer_out_b_bits_corrupt,
	auto_buffer_out_c_ready,
	auto_buffer_out_c_valid,
	auto_buffer_out_c_bits_opcode,
	auto_buffer_out_c_bits_param,
	auto_buffer_out_c_bits_size,
	auto_buffer_out_c_bits_source,
	auto_buffer_out_c_bits_address,
	auto_buffer_out_c_bits_data,
	auto_buffer_out_c_bits_corrupt,
	auto_buffer_out_d_ready,
	auto_buffer_out_d_valid,
	auto_buffer_out_d_bits_opcode,
	auto_buffer_out_d_bits_param,
	auto_buffer_out_d_bits_size,
	auto_buffer_out_d_bits_source,
	auto_buffer_out_d_bits_sink,
	auto_buffer_out_d_bits_denied,
	auto_buffer_out_d_bits_data,
	auto_buffer_out_d_bits_corrupt,
	auto_buffer_out_e_ready,
	auto_buffer_out_e_valid,
	auto_buffer_out_e_bits_sink,
	auto_int_local_in_3_0,
	auto_int_local_in_2_0,
	auto_int_local_in_1_0,
	auto_int_local_in_1_1,
	auto_int_local_in_0_0,
	auto_hartid_in
);
	input clock;
	input reset;
	input auto_buffer_out_a_ready;
	output wire auto_buffer_out_a_valid;
	output wire [2:0] auto_buffer_out_a_bits_opcode;
	output wire [2:0] auto_buffer_out_a_bits_param;
	output wire [3:0] auto_buffer_out_a_bits_size;
	output wire [2:0] auto_buffer_out_a_bits_source;
	output wire [31:0] auto_buffer_out_a_bits_address;
	output wire [7:0] auto_buffer_out_a_bits_mask;
	output wire [63:0] auto_buffer_out_a_bits_data;
	output wire auto_buffer_out_a_bits_corrupt;
	output wire auto_buffer_out_b_ready;
	input auto_buffer_out_b_valid;
	input [2:0] auto_buffer_out_b_bits_opcode;
	input [1:0] auto_buffer_out_b_bits_param;
	input [3:0] auto_buffer_out_b_bits_size;
	input [2:0] auto_buffer_out_b_bits_source;
	input [31:0] auto_buffer_out_b_bits_address;
	input [7:0] auto_buffer_out_b_bits_mask;
	input [63:0] auto_buffer_out_b_bits_data;
	input auto_buffer_out_b_bits_corrupt;
	input auto_buffer_out_c_ready;
	output wire auto_buffer_out_c_valid;
	output wire [2:0] auto_buffer_out_c_bits_opcode;
	output wire [2:0] auto_buffer_out_c_bits_param;
	output wire [3:0] auto_buffer_out_c_bits_size;
	output wire [2:0] auto_buffer_out_c_bits_source;
	output wire [31:0] auto_buffer_out_c_bits_address;
	output wire [63:0] auto_buffer_out_c_bits_data;
	output wire auto_buffer_out_c_bits_corrupt;
	output wire auto_buffer_out_d_ready;
	input auto_buffer_out_d_valid;
	input [2:0] auto_buffer_out_d_bits_opcode;
	input [1:0] auto_buffer_out_d_bits_param;
	input [3:0] auto_buffer_out_d_bits_size;
	input [2:0] auto_buffer_out_d_bits_source;
	input [1:0] auto_buffer_out_d_bits_sink;
	input auto_buffer_out_d_bits_denied;
	input [63:0] auto_buffer_out_d_bits_data;
	input auto_buffer_out_d_bits_corrupt;
	input auto_buffer_out_e_ready;
	output wire auto_buffer_out_e_valid;
	output wire [1:0] auto_buffer_out_e_bits_sink;
	input auto_int_local_in_3_0;
	input auto_int_local_in_2_0;
	input auto_int_local_in_1_0;
	input auto_int_local_in_1_1;
	input auto_int_local_in_0_0;
	input auto_hartid_in;
	wire _hellaCacheArb_io_requestor_0_req_ready;
	wire _hellaCacheArb_io_requestor_0_s2_nack;
	wire _hellaCacheArb_io_requestor_0_resp_valid;
	wire [63:0] _hellaCacheArb_io_requestor_0_resp_bits_data;
	wire _hellaCacheArb_io_requestor_0_s2_xcpt_ae_ld;
	wire _hellaCacheArb_io_mem_req_valid;
	wire [39:0] _hellaCacheArb_io_mem_req_bits_addr;
	wire _hellaCacheArb_io_mem_s1_kill;
	wire _ptw_io_requestor_0_req_ready;
	wire _ptw_io_requestor_0_resp_valid;
	wire _ptw_io_requestor_0_resp_bits_ae_final;
	wire [43:0] _ptw_io_requestor_0_resp_bits_pte_ppn;
	wire _ptw_io_requestor_0_resp_bits_pte_d;
	wire _ptw_io_requestor_0_resp_bits_pte_a;
	wire _ptw_io_requestor_0_resp_bits_pte_g;
	wire _ptw_io_requestor_0_resp_bits_pte_u;
	wire _ptw_io_requestor_0_resp_bits_pte_x;
	wire _ptw_io_requestor_0_resp_bits_pte_w;
	wire _ptw_io_requestor_0_resp_bits_pte_r;
	wire _ptw_io_requestor_0_resp_bits_pte_v;
	wire [1:0] _ptw_io_requestor_0_resp_bits_level;
	wire _ptw_io_requestor_0_resp_bits_homogeneous;
	wire [3:0] _ptw_io_requestor_0_ptbr_mode;
	wire [1:0] _ptw_io_requestor_0_status_dprv;
	wire _ptw_io_requestor_0_status_mxr;
	wire _ptw_io_requestor_0_status_sum;
	wire _ptw_io_requestor_0_pmp_0_cfg_l;
	wire [1:0] _ptw_io_requestor_0_pmp_0_cfg_a;
	wire _ptw_io_requestor_0_pmp_0_cfg_x;
	wire _ptw_io_requestor_0_pmp_0_cfg_w;
	wire _ptw_io_requestor_0_pmp_0_cfg_r;
	wire [29:0] _ptw_io_requestor_0_pmp_0_addr;
	wire [31:0] _ptw_io_requestor_0_pmp_0_mask;
	wire _ptw_io_requestor_0_pmp_1_cfg_l;
	wire [1:0] _ptw_io_requestor_0_pmp_1_cfg_a;
	wire _ptw_io_requestor_0_pmp_1_cfg_x;
	wire _ptw_io_requestor_0_pmp_1_cfg_w;
	wire _ptw_io_requestor_0_pmp_1_cfg_r;
	wire [29:0] _ptw_io_requestor_0_pmp_1_addr;
	wire [31:0] _ptw_io_requestor_0_pmp_1_mask;
	wire _ptw_io_requestor_0_pmp_2_cfg_l;
	wire [1:0] _ptw_io_requestor_0_pmp_2_cfg_a;
	wire _ptw_io_requestor_0_pmp_2_cfg_x;
	wire _ptw_io_requestor_0_pmp_2_cfg_w;
	wire _ptw_io_requestor_0_pmp_2_cfg_r;
	wire [29:0] _ptw_io_requestor_0_pmp_2_addr;
	wire [31:0] _ptw_io_requestor_0_pmp_2_mask;
	wire _ptw_io_requestor_0_pmp_3_cfg_l;
	wire [1:0] _ptw_io_requestor_0_pmp_3_cfg_a;
	wire _ptw_io_requestor_0_pmp_3_cfg_x;
	wire _ptw_io_requestor_0_pmp_3_cfg_w;
	wire _ptw_io_requestor_0_pmp_3_cfg_r;
	wire [29:0] _ptw_io_requestor_0_pmp_3_addr;
	wire [31:0] _ptw_io_requestor_0_pmp_3_mask;
	wire _ptw_io_requestor_0_pmp_4_cfg_l;
	wire [1:0] _ptw_io_requestor_0_pmp_4_cfg_a;
	wire _ptw_io_requestor_0_pmp_4_cfg_x;
	wire _ptw_io_requestor_0_pmp_4_cfg_w;
	wire _ptw_io_requestor_0_pmp_4_cfg_r;
	wire [29:0] _ptw_io_requestor_0_pmp_4_addr;
	wire [31:0] _ptw_io_requestor_0_pmp_4_mask;
	wire _ptw_io_requestor_0_pmp_5_cfg_l;
	wire [1:0] _ptw_io_requestor_0_pmp_5_cfg_a;
	wire _ptw_io_requestor_0_pmp_5_cfg_x;
	wire _ptw_io_requestor_0_pmp_5_cfg_w;
	wire _ptw_io_requestor_0_pmp_5_cfg_r;
	wire [29:0] _ptw_io_requestor_0_pmp_5_addr;
	wire [31:0] _ptw_io_requestor_0_pmp_5_mask;
	wire _ptw_io_requestor_0_pmp_6_cfg_l;
	wire [1:0] _ptw_io_requestor_0_pmp_6_cfg_a;
	wire _ptw_io_requestor_0_pmp_6_cfg_x;
	wire _ptw_io_requestor_0_pmp_6_cfg_w;
	wire _ptw_io_requestor_0_pmp_6_cfg_r;
	wire [29:0] _ptw_io_requestor_0_pmp_6_addr;
	wire [31:0] _ptw_io_requestor_0_pmp_6_mask;
	wire _ptw_io_requestor_0_pmp_7_cfg_l;
	wire [1:0] _ptw_io_requestor_0_pmp_7_cfg_a;
	wire _ptw_io_requestor_0_pmp_7_cfg_x;
	wire _ptw_io_requestor_0_pmp_7_cfg_w;
	wire _ptw_io_requestor_0_pmp_7_cfg_r;
	wire [29:0] _ptw_io_requestor_0_pmp_7_addr;
	wire [31:0] _ptw_io_requestor_0_pmp_7_mask;
	wire _ptw_io_requestor_1_req_ready;
	wire _ptw_io_requestor_1_resp_valid;
	wire _ptw_io_requestor_1_resp_bits_ae_ptw;
	wire _ptw_io_requestor_1_resp_bits_ae_final;
	wire _ptw_io_requestor_1_resp_bits_pf;
	wire _ptw_io_requestor_1_resp_bits_gf;
	wire _ptw_io_requestor_1_resp_bits_hr;
	wire _ptw_io_requestor_1_resp_bits_hw;
	wire _ptw_io_requestor_1_resp_bits_hx;
	wire [43:0] _ptw_io_requestor_1_resp_bits_pte_ppn;
	wire _ptw_io_requestor_1_resp_bits_pte_d;
	wire _ptw_io_requestor_1_resp_bits_pte_a;
	wire _ptw_io_requestor_1_resp_bits_pte_g;
	wire _ptw_io_requestor_1_resp_bits_pte_u;
	wire _ptw_io_requestor_1_resp_bits_pte_x;
	wire _ptw_io_requestor_1_resp_bits_pte_w;
	wire _ptw_io_requestor_1_resp_bits_pte_r;
	wire _ptw_io_requestor_1_resp_bits_pte_v;
	wire [1:0] _ptw_io_requestor_1_resp_bits_level;
	wire _ptw_io_requestor_1_resp_bits_homogeneous;
	wire [3:0] _ptw_io_requestor_1_ptbr_mode;
	wire _ptw_io_requestor_1_status_debug;
	wire [1:0] _ptw_io_requestor_1_status_prv;
	wire _ptw_io_requestor_1_pmp_0_cfg_l;
	wire [1:0] _ptw_io_requestor_1_pmp_0_cfg_a;
	wire _ptw_io_requestor_1_pmp_0_cfg_x;
	wire _ptw_io_requestor_1_pmp_0_cfg_w;
	wire _ptw_io_requestor_1_pmp_0_cfg_r;
	wire [29:0] _ptw_io_requestor_1_pmp_0_addr;
	wire [31:0] _ptw_io_requestor_1_pmp_0_mask;
	wire _ptw_io_requestor_1_pmp_1_cfg_l;
	wire [1:0] _ptw_io_requestor_1_pmp_1_cfg_a;
	wire _ptw_io_requestor_1_pmp_1_cfg_x;
	wire _ptw_io_requestor_1_pmp_1_cfg_w;
	wire _ptw_io_requestor_1_pmp_1_cfg_r;
	wire [29:0] _ptw_io_requestor_1_pmp_1_addr;
	wire [31:0] _ptw_io_requestor_1_pmp_1_mask;
	wire _ptw_io_requestor_1_pmp_2_cfg_l;
	wire [1:0] _ptw_io_requestor_1_pmp_2_cfg_a;
	wire _ptw_io_requestor_1_pmp_2_cfg_x;
	wire _ptw_io_requestor_1_pmp_2_cfg_w;
	wire _ptw_io_requestor_1_pmp_2_cfg_r;
	wire [29:0] _ptw_io_requestor_1_pmp_2_addr;
	wire [31:0] _ptw_io_requestor_1_pmp_2_mask;
	wire _ptw_io_requestor_1_pmp_3_cfg_l;
	wire [1:0] _ptw_io_requestor_1_pmp_3_cfg_a;
	wire _ptw_io_requestor_1_pmp_3_cfg_x;
	wire _ptw_io_requestor_1_pmp_3_cfg_w;
	wire _ptw_io_requestor_1_pmp_3_cfg_r;
	wire [29:0] _ptw_io_requestor_1_pmp_3_addr;
	wire [31:0] _ptw_io_requestor_1_pmp_3_mask;
	wire _ptw_io_requestor_1_pmp_4_cfg_l;
	wire [1:0] _ptw_io_requestor_1_pmp_4_cfg_a;
	wire _ptw_io_requestor_1_pmp_4_cfg_x;
	wire _ptw_io_requestor_1_pmp_4_cfg_w;
	wire _ptw_io_requestor_1_pmp_4_cfg_r;
	wire [29:0] _ptw_io_requestor_1_pmp_4_addr;
	wire [31:0] _ptw_io_requestor_1_pmp_4_mask;
	wire _ptw_io_requestor_1_pmp_5_cfg_l;
	wire [1:0] _ptw_io_requestor_1_pmp_5_cfg_a;
	wire _ptw_io_requestor_1_pmp_5_cfg_x;
	wire _ptw_io_requestor_1_pmp_5_cfg_w;
	wire _ptw_io_requestor_1_pmp_5_cfg_r;
	wire [29:0] _ptw_io_requestor_1_pmp_5_addr;
	wire [31:0] _ptw_io_requestor_1_pmp_5_mask;
	wire _ptw_io_requestor_1_pmp_6_cfg_l;
	wire [1:0] _ptw_io_requestor_1_pmp_6_cfg_a;
	wire _ptw_io_requestor_1_pmp_6_cfg_x;
	wire _ptw_io_requestor_1_pmp_6_cfg_w;
	wire _ptw_io_requestor_1_pmp_6_cfg_r;
	wire [29:0] _ptw_io_requestor_1_pmp_6_addr;
	wire [31:0] _ptw_io_requestor_1_pmp_6_mask;
	wire _ptw_io_requestor_1_pmp_7_cfg_l;
	wire [1:0] _ptw_io_requestor_1_pmp_7_cfg_a;
	wire _ptw_io_requestor_1_pmp_7_cfg_x;
	wire _ptw_io_requestor_1_pmp_7_cfg_w;
	wire _ptw_io_requestor_1_pmp_7_cfg_r;
	wire [29:0] _ptw_io_requestor_1_pmp_7_addr;
	wire [31:0] _ptw_io_requestor_1_pmp_7_mask;
	wire _ptw_io_mem_req_valid;
	wire [39:0] _ptw_io_mem_req_bits_addr;
	wire _ptw_io_mem_s1_kill;
	wire _ptw_io_dpath_perf_l2miss;
	wire _lsu_io_ptw_req_valid;
	wire _lsu_io_ptw_req_bits_valid;
	wire [26:0] _lsu_io_ptw_req_bits_bits_addr;
	wire _lsu_io_core_iwakeups_0_valid;
	wire [5:0] _lsu_io_core_iwakeups_0_bits_uop_pdst;
	wire [1:0] _lsu_io_core_iwakeups_0_bits_uop_dst_rtype;
	wire _lsu_io_core_iwakeups_0_bits_bypassable;
	wire _lsu_io_core_iwakeups_0_bits_rebusy;
	wire _lsu_io_core_iresp_0_valid;
	wire [7:0] _lsu_io_core_iresp_0_bits_uop_br_mask;
	wire [4:0] _lsu_io_core_iresp_0_bits_uop_rob_idx;
	wire [5:0] _lsu_io_core_iresp_0_bits_uop_pdst;
	wire [63:0] _lsu_io_core_iresp_0_bits_data;
	wire _lsu_io_core_fresp_0_valid;
	wire [7:0] _lsu_io_core_fresp_0_bits_uop_br_mask;
	wire [4:0] _lsu_io_core_fresp_0_bits_uop_rob_idx;
	wire [5:0] _lsu_io_core_fresp_0_bits_uop_pdst;
	wire [1:0] _lsu_io_core_fresp_0_bits_uop_mem_size;
	wire [1:0] _lsu_io_core_fresp_0_bits_uop_dst_rtype;
	wire [63:0] _lsu_io_core_fresp_0_bits_data;
	wire [3:0] _lsu_io_core_dis_ldq_idx_0;
	wire [3:0] _lsu_io_core_dis_stq_idx_0;
	wire _lsu_io_core_ldq_full_0;
	wire _lsu_io_core_stq_full_0;
	wire _lsu_io_core_clr_bsy_0_valid;
	wire [4:0] _lsu_io_core_clr_bsy_0_bits;
	wire _lsu_io_core_clr_unsafe_0_valid;
	wire [4:0] _lsu_io_core_clr_unsafe_0_bits;
	wire _lsu_io_core_fencei_rdy;
	wire _lsu_io_core_lxcpt_valid;
	wire [7:0] _lsu_io_core_lxcpt_bits_uop_br_mask;
	wire [4:0] _lsu_io_core_lxcpt_bits_uop_rob_idx;
	wire [4:0] _lsu_io_core_lxcpt_bits_cause;
	wire [39:0] _lsu_io_core_lxcpt_bits_badvaddr;
	wire _lsu_io_core_perf_acquire;
	wire _lsu_io_core_perf_release;
	wire _lsu_io_core_perf_tlbMiss;
	wire _lsu_io_dmem_req_valid;
	wire _lsu_io_dmem_req_bits_0_valid;
	wire [31:0] _lsu_io_dmem_req_bits_0_bits_uop_inst;
	wire [31:0] _lsu_io_dmem_req_bits_0_bits_uop_debug_inst;
	wire _lsu_io_dmem_req_bits_0_bits_uop_is_rvc;
	wire [39:0] _lsu_io_dmem_req_bits_0_bits_uop_debug_pc;
	wire _lsu_io_dmem_req_bits_0_bits_uop_iq_type_0;
	wire _lsu_io_dmem_req_bits_0_bits_uop_iq_type_1;
	wire _lsu_io_dmem_req_bits_0_bits_uop_iq_type_2;
	wire _lsu_io_dmem_req_bits_0_bits_uop_iq_type_3;
	wire _lsu_io_dmem_req_bits_0_bits_uop_fu_code_0;
	wire _lsu_io_dmem_req_bits_0_bits_uop_fu_code_1;
	wire _lsu_io_dmem_req_bits_0_bits_uop_fu_code_2;
	wire _lsu_io_dmem_req_bits_0_bits_uop_fu_code_3;
	wire _lsu_io_dmem_req_bits_0_bits_uop_fu_code_4;
	wire _lsu_io_dmem_req_bits_0_bits_uop_fu_code_5;
	wire _lsu_io_dmem_req_bits_0_bits_uop_fu_code_6;
	wire _lsu_io_dmem_req_bits_0_bits_uop_fu_code_7;
	wire _lsu_io_dmem_req_bits_0_bits_uop_fu_code_8;
	wire _lsu_io_dmem_req_bits_0_bits_uop_fu_code_9;
	wire _lsu_io_dmem_req_bits_0_bits_uop_iw_issued;
	wire _lsu_io_dmem_req_bits_0_bits_uop_iw_issued_partial_agen;
	wire _lsu_io_dmem_req_bits_0_bits_uop_iw_issued_partial_dgen;
	wire _lsu_io_dmem_req_bits_0_bits_uop_iw_p1_speculative_child;
	wire _lsu_io_dmem_req_bits_0_bits_uop_iw_p2_speculative_child;
	wire _lsu_io_dmem_req_bits_0_bits_uop_iw_p1_bypass_hint;
	wire _lsu_io_dmem_req_bits_0_bits_uop_iw_p2_bypass_hint;
	wire _lsu_io_dmem_req_bits_0_bits_uop_iw_p3_bypass_hint;
	wire _lsu_io_dmem_req_bits_0_bits_uop_dis_col_sel;
	wire [7:0] _lsu_io_dmem_req_bits_0_bits_uop_br_mask;
	wire [2:0] _lsu_io_dmem_req_bits_0_bits_uop_br_tag;
	wire [3:0] _lsu_io_dmem_req_bits_0_bits_uop_br_type;
	wire _lsu_io_dmem_req_bits_0_bits_uop_is_sfb;
	wire _lsu_io_dmem_req_bits_0_bits_uop_is_fence;
	wire _lsu_io_dmem_req_bits_0_bits_uop_is_fencei;
	wire _lsu_io_dmem_req_bits_0_bits_uop_is_sfence;
	wire _lsu_io_dmem_req_bits_0_bits_uop_is_amo;
	wire _lsu_io_dmem_req_bits_0_bits_uop_is_eret;
	wire _lsu_io_dmem_req_bits_0_bits_uop_is_sys_pc2epc;
	wire _lsu_io_dmem_req_bits_0_bits_uop_is_rocc;
	wire _lsu_io_dmem_req_bits_0_bits_uop_is_mov;
	wire [3:0] _lsu_io_dmem_req_bits_0_bits_uop_ftq_idx;
	wire _lsu_io_dmem_req_bits_0_bits_uop_edge_inst;
	wire [5:0] _lsu_io_dmem_req_bits_0_bits_uop_pc_lob;
	wire _lsu_io_dmem_req_bits_0_bits_uop_taken;
	wire _lsu_io_dmem_req_bits_0_bits_uop_imm_rename;
	wire [2:0] _lsu_io_dmem_req_bits_0_bits_uop_imm_sel;
	wire [4:0] _lsu_io_dmem_req_bits_0_bits_uop_pimm;
	wire [19:0] _lsu_io_dmem_req_bits_0_bits_uop_imm_packed;
	wire [1:0] _lsu_io_dmem_req_bits_0_bits_uop_op1_sel;
	wire [2:0] _lsu_io_dmem_req_bits_0_bits_uop_op2_sel;
	wire _lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_ldst;
	wire _lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_wen;
	wire _lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_ren1;
	wire _lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_ren2;
	wire _lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_ren3;
	wire _lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_swap12;
	wire _lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_swap23;
	wire [1:0] _lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_typeTagIn;
	wire [1:0] _lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_typeTagOut;
	wire _lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_fromint;
	wire _lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_toint;
	wire _lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_fastpipe;
	wire _lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_fma;
	wire _lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_div;
	wire _lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_sqrt;
	wire _lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_wflags;
	wire _lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_vec;
	wire [4:0] _lsu_io_dmem_req_bits_0_bits_uop_rob_idx;
	wire [3:0] _lsu_io_dmem_req_bits_0_bits_uop_ldq_idx;
	wire [3:0] _lsu_io_dmem_req_bits_0_bits_uop_stq_idx;
	wire [1:0] _lsu_io_dmem_req_bits_0_bits_uop_rxq_idx;
	wire [5:0] _lsu_io_dmem_req_bits_0_bits_uop_pdst;
	wire [5:0] _lsu_io_dmem_req_bits_0_bits_uop_prs1;
	wire [5:0] _lsu_io_dmem_req_bits_0_bits_uop_prs2;
	wire [5:0] _lsu_io_dmem_req_bits_0_bits_uop_prs3;
	wire [3:0] _lsu_io_dmem_req_bits_0_bits_uop_ppred;
	wire _lsu_io_dmem_req_bits_0_bits_uop_prs1_busy;
	wire _lsu_io_dmem_req_bits_0_bits_uop_prs2_busy;
	wire _lsu_io_dmem_req_bits_0_bits_uop_prs3_busy;
	wire _lsu_io_dmem_req_bits_0_bits_uop_ppred_busy;
	wire [5:0] _lsu_io_dmem_req_bits_0_bits_uop_stale_pdst;
	wire _lsu_io_dmem_req_bits_0_bits_uop_exception;
	wire [63:0] _lsu_io_dmem_req_bits_0_bits_uop_exc_cause;
	wire [4:0] _lsu_io_dmem_req_bits_0_bits_uop_mem_cmd;
	wire [1:0] _lsu_io_dmem_req_bits_0_bits_uop_mem_size;
	wire _lsu_io_dmem_req_bits_0_bits_uop_mem_signed;
	wire _lsu_io_dmem_req_bits_0_bits_uop_uses_ldq;
	wire _lsu_io_dmem_req_bits_0_bits_uop_uses_stq;
	wire _lsu_io_dmem_req_bits_0_bits_uop_is_unique;
	wire _lsu_io_dmem_req_bits_0_bits_uop_flush_on_commit;
	wire [2:0] _lsu_io_dmem_req_bits_0_bits_uop_csr_cmd;
	wire _lsu_io_dmem_req_bits_0_bits_uop_ldst_is_rs1;
	wire [5:0] _lsu_io_dmem_req_bits_0_bits_uop_ldst;
	wire [5:0] _lsu_io_dmem_req_bits_0_bits_uop_lrs1;
	wire [5:0] _lsu_io_dmem_req_bits_0_bits_uop_lrs2;
	wire [5:0] _lsu_io_dmem_req_bits_0_bits_uop_lrs3;
	wire [1:0] _lsu_io_dmem_req_bits_0_bits_uop_dst_rtype;
	wire [1:0] _lsu_io_dmem_req_bits_0_bits_uop_lrs1_rtype;
	wire [1:0] _lsu_io_dmem_req_bits_0_bits_uop_lrs2_rtype;
	wire _lsu_io_dmem_req_bits_0_bits_uop_frs3_en;
	wire _lsu_io_dmem_req_bits_0_bits_uop_fcn_dw;
	wire [4:0] _lsu_io_dmem_req_bits_0_bits_uop_fcn_op;
	wire _lsu_io_dmem_req_bits_0_bits_uop_fp_val;
	wire [2:0] _lsu_io_dmem_req_bits_0_bits_uop_fp_rm;
	wire [1:0] _lsu_io_dmem_req_bits_0_bits_uop_fp_typ;
	wire _lsu_io_dmem_req_bits_0_bits_uop_xcpt_pf_if;
	wire _lsu_io_dmem_req_bits_0_bits_uop_xcpt_ae_if;
	wire _lsu_io_dmem_req_bits_0_bits_uop_xcpt_ma_if;
	wire _lsu_io_dmem_req_bits_0_bits_uop_bp_debug_if;
	wire _lsu_io_dmem_req_bits_0_bits_uop_bp_xcpt_if;
	wire [2:0] _lsu_io_dmem_req_bits_0_bits_uop_debug_fsrc;
	wire [2:0] _lsu_io_dmem_req_bits_0_bits_uop_debug_tsrc;
	wire [39:0] _lsu_io_dmem_req_bits_0_bits_addr;
	wire [63:0] _lsu_io_dmem_req_bits_0_bits_data;
	wire _lsu_io_dmem_req_bits_0_bits_is_hella;
	wire _lsu_io_dmem_s1_kill_0;
	wire _lsu_io_dmem_ll_resp_ready;
	wire [7:0] _lsu_io_dmem_brupdate_b1_resolve_mask;
	wire [7:0] _lsu_io_dmem_brupdate_b1_mispredict_mask;
	wire _lsu_io_dmem_exception;
	wire _lsu_io_dmem_release_ready;
	wire _lsu_io_dmem_force_order;
	wire _lsu_io_hellacache_req_ready;
	wire _lsu_io_hellacache_s2_nack;
	wire _lsu_io_hellacache_resp_valid;
	wire [63:0] _lsu_io_hellacache_resp_bits_data;
	wire _lsu_io_hellacache_s2_xcpt_ae_ld;
	wire _core_io_ifu_fetchpacket_ready;
	wire [3:0] _core_io_ifu_arb_ftq_reqs_0;
	wire [3:0] _core_io_ifu_arb_ftq_reqs_1;
	wire [3:0] _core_io_ifu_arb_ftq_reqs_2;
	wire _core_io_ifu_sfence_valid;
	wire _core_io_ifu_sfence_bits_rs1;
	wire _core_io_ifu_sfence_bits_rs2;
	wire [38:0] _core_io_ifu_sfence_bits_addr;
	wire [3:0] _core_io_ifu_brupdate_b2_uop_ftq_idx;
	wire [5:0] _core_io_ifu_brupdate_b2_uop_pc_lob;
	wire _core_io_ifu_brupdate_b2_mispredict;
	wire _core_io_ifu_brupdate_b2_taken;
	wire _core_io_ifu_redirect_flush;
	wire _core_io_ifu_redirect_val;
	wire [39:0] _core_io_ifu_redirect_pc;
	wire [3:0] _core_io_ifu_redirect_ftq_idx;
	wire [63:0] _core_io_ifu_redirect_ghist_old_history;
	wire _core_io_ifu_redirect_ghist_current_saw_branch_not_taken;
	wire _core_io_ifu_redirect_ghist_new_saw_branch_not_taken;
	wire _core_io_ifu_redirect_ghist_new_saw_branch_taken;
	wire [4:0] _core_io_ifu_redirect_ghist_ras_idx;
	wire _core_io_ifu_commit_valid;
	wire [15:0] _core_io_ifu_commit_bits;
	wire _core_io_ifu_flush_icache;
	wire _core_io_ifu_enable_bpd;
	wire [3:0] _core_io_ptw_ptbr_mode;
	wire [43:0] _core_io_ptw_ptbr_ppn;
	wire _core_io_ptw_sfence_valid;
	wire _core_io_ptw_sfence_bits_rs1;
	wire _core_io_ptw_sfence_bits_rs2;
	wire [38:0] _core_io_ptw_sfence_bits_addr;
	wire _core_io_ptw_status_debug;
	wire [1:0] _core_io_ptw_status_dprv;
	wire [1:0] _core_io_ptw_status_prv;
	wire _core_io_ptw_status_mxr;
	wire _core_io_ptw_status_sum;
	wire _core_io_ptw_pmp_0_cfg_l;
	wire [1:0] _core_io_ptw_pmp_0_cfg_a;
	wire _core_io_ptw_pmp_0_cfg_x;
	wire _core_io_ptw_pmp_0_cfg_w;
	wire _core_io_ptw_pmp_0_cfg_r;
	wire [29:0] _core_io_ptw_pmp_0_addr;
	wire [31:0] _core_io_ptw_pmp_0_mask;
	wire _core_io_ptw_pmp_1_cfg_l;
	wire [1:0] _core_io_ptw_pmp_1_cfg_a;
	wire _core_io_ptw_pmp_1_cfg_x;
	wire _core_io_ptw_pmp_1_cfg_w;
	wire _core_io_ptw_pmp_1_cfg_r;
	wire [29:0] _core_io_ptw_pmp_1_addr;
	wire [31:0] _core_io_ptw_pmp_1_mask;
	wire _core_io_ptw_pmp_2_cfg_l;
	wire [1:0] _core_io_ptw_pmp_2_cfg_a;
	wire _core_io_ptw_pmp_2_cfg_x;
	wire _core_io_ptw_pmp_2_cfg_w;
	wire _core_io_ptw_pmp_2_cfg_r;
	wire [29:0] _core_io_ptw_pmp_2_addr;
	wire [31:0] _core_io_ptw_pmp_2_mask;
	wire _core_io_ptw_pmp_3_cfg_l;
	wire [1:0] _core_io_ptw_pmp_3_cfg_a;
	wire _core_io_ptw_pmp_3_cfg_x;
	wire _core_io_ptw_pmp_3_cfg_w;
	wire _core_io_ptw_pmp_3_cfg_r;
	wire [29:0] _core_io_ptw_pmp_3_addr;
	wire [31:0] _core_io_ptw_pmp_3_mask;
	wire _core_io_ptw_pmp_4_cfg_l;
	wire [1:0] _core_io_ptw_pmp_4_cfg_a;
	wire _core_io_ptw_pmp_4_cfg_x;
	wire _core_io_ptw_pmp_4_cfg_w;
	wire _core_io_ptw_pmp_4_cfg_r;
	wire [29:0] _core_io_ptw_pmp_4_addr;
	wire [31:0] _core_io_ptw_pmp_4_mask;
	wire _core_io_ptw_pmp_5_cfg_l;
	wire [1:0] _core_io_ptw_pmp_5_cfg_a;
	wire _core_io_ptw_pmp_5_cfg_x;
	wire _core_io_ptw_pmp_5_cfg_w;
	wire _core_io_ptw_pmp_5_cfg_r;
	wire [29:0] _core_io_ptw_pmp_5_addr;
	wire [31:0] _core_io_ptw_pmp_5_mask;
	wire _core_io_ptw_pmp_6_cfg_l;
	wire [1:0] _core_io_ptw_pmp_6_cfg_a;
	wire _core_io_ptw_pmp_6_cfg_x;
	wire _core_io_ptw_pmp_6_cfg_w;
	wire _core_io_ptw_pmp_6_cfg_r;
	wire [29:0] _core_io_ptw_pmp_6_addr;
	wire [31:0] _core_io_ptw_pmp_6_mask;
	wire _core_io_ptw_pmp_7_cfg_l;
	wire [1:0] _core_io_ptw_pmp_7_cfg_a;
	wire _core_io_ptw_pmp_7_cfg_x;
	wire _core_io_ptw_pmp_7_cfg_w;
	wire _core_io_ptw_pmp_7_cfg_r;
	wire [29:0] _core_io_ptw_pmp_7_addr;
	wire [31:0] _core_io_ptw_pmp_7_mask;
	wire _core_io_lsu_agen_0_valid;
	wire [7:0] _core_io_lsu_agen_0_bits_uop_br_mask;
	wire [3:0] _core_io_lsu_agen_0_bits_uop_ldq_idx;
	wire [3:0] _core_io_lsu_agen_0_bits_uop_stq_idx;
	wire [5:0] _core_io_lsu_agen_0_bits_uop_pdst;
	wire _core_io_lsu_agen_0_bits_uop_uses_ldq;
	wire _core_io_lsu_agen_0_bits_uop_uses_stq;
	wire [1:0] _core_io_lsu_agen_0_bits_uop_dst_rtype;
	wire _core_io_lsu_agen_0_bits_uop_fp_val;
	wire [63:0] _core_io_lsu_agen_0_bits_data;
	wire _core_io_lsu_dgen_0_valid;
	wire [3:0] _core_io_lsu_dgen_0_bits_uop_stq_idx;
	wire [63:0] _core_io_lsu_dgen_0_bits_data;
	wire _core_io_lsu_dgen_1_valid;
	wire [3:0] _core_io_lsu_dgen_1_bits_uop_stq_idx;
	wire [63:0] _core_io_lsu_dgen_1_bits_data;
	wire _core_io_lsu_dgen_2_valid;
	wire [3:0] _core_io_lsu_dgen_2_bits_uop_stq_idx;
	wire [63:0] _core_io_lsu_dgen_2_bits_data;
	wire _core_io_lsu_sfence_valid;
	wire _core_io_lsu_sfence_bits_rs1;
	wire _core_io_lsu_sfence_bits_rs2;
	wire [38:0] _core_io_lsu_sfence_bits_addr;
	wire _core_io_lsu_dis_uops_0_valid;
	wire [31:0] _core_io_lsu_dis_uops_0_bits_inst;
	wire [31:0] _core_io_lsu_dis_uops_0_bits_debug_inst;
	wire _core_io_lsu_dis_uops_0_bits_is_rvc;
	wire [39:0] _core_io_lsu_dis_uops_0_bits_debug_pc;
	wire _core_io_lsu_dis_uops_0_bits_iq_type_0;
	wire _core_io_lsu_dis_uops_0_bits_iq_type_1;
	wire _core_io_lsu_dis_uops_0_bits_iq_type_2;
	wire _core_io_lsu_dis_uops_0_bits_iq_type_3;
	wire _core_io_lsu_dis_uops_0_bits_fu_code_0;
	wire _core_io_lsu_dis_uops_0_bits_fu_code_1;
	wire _core_io_lsu_dis_uops_0_bits_fu_code_2;
	wire _core_io_lsu_dis_uops_0_bits_fu_code_3;
	wire _core_io_lsu_dis_uops_0_bits_fu_code_4;
	wire _core_io_lsu_dis_uops_0_bits_fu_code_5;
	wire _core_io_lsu_dis_uops_0_bits_fu_code_6;
	wire _core_io_lsu_dis_uops_0_bits_fu_code_7;
	wire _core_io_lsu_dis_uops_0_bits_fu_code_8;
	wire _core_io_lsu_dis_uops_0_bits_fu_code_9;
	wire _core_io_lsu_dis_uops_0_bits_iw_issued;
	wire _core_io_lsu_dis_uops_0_bits_iw_issued_partial_agen;
	wire _core_io_lsu_dis_uops_0_bits_iw_issued_partial_dgen;
	wire _core_io_lsu_dis_uops_0_bits_iw_p1_speculative_child;
	wire _core_io_lsu_dis_uops_0_bits_iw_p2_speculative_child;
	wire _core_io_lsu_dis_uops_0_bits_iw_p1_bypass_hint;
	wire _core_io_lsu_dis_uops_0_bits_iw_p2_bypass_hint;
	wire _core_io_lsu_dis_uops_0_bits_iw_p3_bypass_hint;
	wire [7:0] _core_io_lsu_dis_uops_0_bits_br_mask;
	wire [2:0] _core_io_lsu_dis_uops_0_bits_br_tag;
	wire [3:0] _core_io_lsu_dis_uops_0_bits_br_type;
	wire _core_io_lsu_dis_uops_0_bits_is_sfb;
	wire _core_io_lsu_dis_uops_0_bits_is_fence;
	wire _core_io_lsu_dis_uops_0_bits_is_fencei;
	wire _core_io_lsu_dis_uops_0_bits_is_sfence;
	wire _core_io_lsu_dis_uops_0_bits_is_amo;
	wire _core_io_lsu_dis_uops_0_bits_is_eret;
	wire _core_io_lsu_dis_uops_0_bits_is_sys_pc2epc;
	wire _core_io_lsu_dis_uops_0_bits_is_rocc;
	wire _core_io_lsu_dis_uops_0_bits_is_mov;
	wire [3:0] _core_io_lsu_dis_uops_0_bits_ftq_idx;
	wire _core_io_lsu_dis_uops_0_bits_edge_inst;
	wire [5:0] _core_io_lsu_dis_uops_0_bits_pc_lob;
	wire _core_io_lsu_dis_uops_0_bits_taken;
	wire _core_io_lsu_dis_uops_0_bits_imm_rename;
	wire [2:0] _core_io_lsu_dis_uops_0_bits_imm_sel;
	wire [4:0] _core_io_lsu_dis_uops_0_bits_pimm;
	wire [19:0] _core_io_lsu_dis_uops_0_bits_imm_packed;
	wire [1:0] _core_io_lsu_dis_uops_0_bits_op1_sel;
	wire [2:0] _core_io_lsu_dis_uops_0_bits_op2_sel;
	wire _core_io_lsu_dis_uops_0_bits_fp_ctrl_ldst;
	wire _core_io_lsu_dis_uops_0_bits_fp_ctrl_wen;
	wire _core_io_lsu_dis_uops_0_bits_fp_ctrl_ren1;
	wire _core_io_lsu_dis_uops_0_bits_fp_ctrl_ren2;
	wire _core_io_lsu_dis_uops_0_bits_fp_ctrl_ren3;
	wire _core_io_lsu_dis_uops_0_bits_fp_ctrl_swap12;
	wire _core_io_lsu_dis_uops_0_bits_fp_ctrl_swap23;
	wire [1:0] _core_io_lsu_dis_uops_0_bits_fp_ctrl_typeTagIn;
	wire [1:0] _core_io_lsu_dis_uops_0_bits_fp_ctrl_typeTagOut;
	wire _core_io_lsu_dis_uops_0_bits_fp_ctrl_fromint;
	wire _core_io_lsu_dis_uops_0_bits_fp_ctrl_toint;
	wire _core_io_lsu_dis_uops_0_bits_fp_ctrl_fastpipe;
	wire _core_io_lsu_dis_uops_0_bits_fp_ctrl_fma;
	wire _core_io_lsu_dis_uops_0_bits_fp_ctrl_div;
	wire _core_io_lsu_dis_uops_0_bits_fp_ctrl_sqrt;
	wire _core_io_lsu_dis_uops_0_bits_fp_ctrl_wflags;
	wire _core_io_lsu_dis_uops_0_bits_fp_ctrl_vec;
	wire [4:0] _core_io_lsu_dis_uops_0_bits_rob_idx;
	wire [3:0] _core_io_lsu_dis_uops_0_bits_ldq_idx;
	wire [3:0] _core_io_lsu_dis_uops_0_bits_stq_idx;
	wire [1:0] _core_io_lsu_dis_uops_0_bits_rxq_idx;
	wire [5:0] _core_io_lsu_dis_uops_0_bits_pdst;
	wire [5:0] _core_io_lsu_dis_uops_0_bits_prs1;
	wire [5:0] _core_io_lsu_dis_uops_0_bits_prs2;
	wire [5:0] _core_io_lsu_dis_uops_0_bits_prs3;
	wire [3:0] _core_io_lsu_dis_uops_0_bits_ppred;
	wire _core_io_lsu_dis_uops_0_bits_prs1_busy;
	wire _core_io_lsu_dis_uops_0_bits_prs2_busy;
	wire _core_io_lsu_dis_uops_0_bits_prs3_busy;
	wire _core_io_lsu_dis_uops_0_bits_ppred_busy;
	wire [5:0] _core_io_lsu_dis_uops_0_bits_stale_pdst;
	wire _core_io_lsu_dis_uops_0_bits_exception;
	wire [63:0] _core_io_lsu_dis_uops_0_bits_exc_cause;
	wire [4:0] _core_io_lsu_dis_uops_0_bits_mem_cmd;
	wire [1:0] _core_io_lsu_dis_uops_0_bits_mem_size;
	wire _core_io_lsu_dis_uops_0_bits_mem_signed;
	wire _core_io_lsu_dis_uops_0_bits_uses_ldq;
	wire _core_io_lsu_dis_uops_0_bits_uses_stq;
	wire _core_io_lsu_dis_uops_0_bits_is_unique;
	wire _core_io_lsu_dis_uops_0_bits_flush_on_commit;
	wire [2:0] _core_io_lsu_dis_uops_0_bits_csr_cmd;
	wire _core_io_lsu_dis_uops_0_bits_ldst_is_rs1;
	wire [5:0] _core_io_lsu_dis_uops_0_bits_ldst;
	wire [5:0] _core_io_lsu_dis_uops_0_bits_lrs1;
	wire [5:0] _core_io_lsu_dis_uops_0_bits_lrs2;
	wire [5:0] _core_io_lsu_dis_uops_0_bits_lrs3;
	wire [1:0] _core_io_lsu_dis_uops_0_bits_dst_rtype;
	wire [1:0] _core_io_lsu_dis_uops_0_bits_lrs1_rtype;
	wire [1:0] _core_io_lsu_dis_uops_0_bits_lrs2_rtype;
	wire _core_io_lsu_dis_uops_0_bits_frs3_en;
	wire _core_io_lsu_dis_uops_0_bits_fcn_dw;
	wire [4:0] _core_io_lsu_dis_uops_0_bits_fcn_op;
	wire _core_io_lsu_dis_uops_0_bits_fp_val;
	wire [2:0] _core_io_lsu_dis_uops_0_bits_fp_rm;
	wire [1:0] _core_io_lsu_dis_uops_0_bits_fp_typ;
	wire _core_io_lsu_dis_uops_0_bits_xcpt_pf_if;
	wire _core_io_lsu_dis_uops_0_bits_xcpt_ae_if;
	wire _core_io_lsu_dis_uops_0_bits_xcpt_ma_if;
	wire _core_io_lsu_dis_uops_0_bits_bp_debug_if;
	wire _core_io_lsu_dis_uops_0_bits_bp_xcpt_if;
	wire [2:0] _core_io_lsu_dis_uops_0_bits_debug_fsrc;
	wire [2:0] _core_io_lsu_dis_uops_0_bits_debug_tsrc;
	wire _core_io_lsu_commit_valids_0;
	wire _core_io_lsu_commit_uops_0_uses_ldq;
	wire _core_io_lsu_commit_uops_0_uses_stq;
	wire _core_io_lsu_commit_load_at_rob_head;
	wire _core_io_lsu_fence_dmem;
	wire [7:0] _core_io_lsu_brupdate_b1_resolve_mask;
	wire [7:0] _core_io_lsu_brupdate_b1_mispredict_mask;
	wire [3:0] _core_io_lsu_brupdate_b2_uop_ldq_idx;
	wire [3:0] _core_io_lsu_brupdate_b2_uop_stq_idx;
	wire _core_io_lsu_brupdate_b2_mispredict;
	wire [4:0] _core_io_lsu_rob_head_idx;
	wire _core_io_lsu_exception;
	wire _buffer_2_auto_in_a_ready;
	wire _buffer_2_auto_in_d_valid;
	wire [2:0] _buffer_2_auto_in_d_bits_opcode;
	wire [3:0] _buffer_2_auto_in_d_bits_size;
	wire [63:0] _buffer_2_auto_in_d_bits_data;
	wire _buffer_2_auto_out_a_valid;
	wire [2:0] _buffer_2_auto_out_a_bits_opcode;
	wire [2:0] _buffer_2_auto_out_a_bits_param;
	wire [3:0] _buffer_2_auto_out_a_bits_size;
	wire _buffer_2_auto_out_a_bits_source;
	wire [31:0] _buffer_2_auto_out_a_bits_address;
	wire [7:0] _buffer_2_auto_out_a_bits_mask;
	wire [63:0] _buffer_2_auto_out_a_bits_data;
	wire _buffer_2_auto_out_a_bits_corrupt;
	wire _buffer_2_auto_out_d_ready;
	wire _frontend_auto_icache_master_out_a_valid;
	wire [31:0] _frontend_auto_icache_master_out_a_bits_address;
	wire _frontend_io_cpu_fetchpacket_valid;
	wire _frontend_io_cpu_fetchpacket_bits_uops_0_valid;
	wire [31:0] _frontend_io_cpu_fetchpacket_bits_uops_0_bits_inst;
	wire [31:0] _frontend_io_cpu_fetchpacket_bits_uops_0_bits_debug_inst;
	wire _frontend_io_cpu_fetchpacket_bits_uops_0_bits_is_rvc;
	wire [39:0] _frontend_io_cpu_fetchpacket_bits_uops_0_bits_debug_pc;
	wire _frontend_io_cpu_fetchpacket_bits_uops_0_bits_is_sfb;
	wire [3:0] _frontend_io_cpu_fetchpacket_bits_uops_0_bits_ftq_idx;
	wire _frontend_io_cpu_fetchpacket_bits_uops_0_bits_edge_inst;
	wire [5:0] _frontend_io_cpu_fetchpacket_bits_uops_0_bits_pc_lob;
	wire _frontend_io_cpu_fetchpacket_bits_uops_0_bits_taken;
	wire _frontend_io_cpu_fetchpacket_bits_uops_0_bits_xcpt_pf_if;
	wire _frontend_io_cpu_fetchpacket_bits_uops_0_bits_xcpt_ae_if;
	wire _frontend_io_cpu_fetchpacket_bits_uops_0_bits_bp_debug_if;
	wire _frontend_io_cpu_fetchpacket_bits_uops_0_bits_bp_xcpt_if;
	wire [2:0] _frontend_io_cpu_fetchpacket_bits_uops_0_bits_debug_fsrc;
	wire [1:0] _frontend_io_cpu_rrd_ftq_resps_0_entry_cfi_idx_bits;
	wire [3:0] _frontend_io_cpu_rrd_ftq_resps_0_entry_br_mask;
	wire _frontend_io_cpu_rrd_ftq_resps_0_entry_cfi_is_call;
	wire _frontend_io_cpu_rrd_ftq_resps_0_entry_cfi_is_ret;
	wire [4:0] _frontend_io_cpu_rrd_ftq_resps_0_entry_ras_idx;
	wire _frontend_io_cpu_rrd_ftq_resps_0_entry_start_bank;
	wire [63:0] _frontend_io_cpu_rrd_ftq_resps_0_ghist_old_history;
	wire _frontend_io_cpu_rrd_ftq_resps_0_ghist_current_saw_branch_not_taken;
	wire _frontend_io_cpu_rrd_ftq_resps_0_ghist_new_saw_branch_not_taken;
	wire _frontend_io_cpu_rrd_ftq_resps_0_ghist_new_saw_branch_taken;
	wire [4:0] _frontend_io_cpu_rrd_ftq_resps_0_ghist_ras_idx;
	wire [39:0] _frontend_io_cpu_rrd_ftq_resps_0_pc;
	wire _frontend_io_cpu_rrd_ftq_resps_1_valid;
	wire _frontend_io_cpu_rrd_ftq_resps_1_entry_cfi_idx_valid;
	wire [1:0] _frontend_io_cpu_rrd_ftq_resps_1_entry_cfi_idx_bits;
	wire _frontend_io_cpu_rrd_ftq_resps_1_entry_start_bank;
	wire [39:0] _frontend_io_cpu_rrd_ftq_resps_1_pc;
	wire _frontend_io_cpu_rrd_ftq_resps_2_valid;
	wire _frontend_io_cpu_rrd_ftq_resps_2_entry_cfi_idx_valid;
	wire [1:0] _frontend_io_cpu_rrd_ftq_resps_2_entry_cfi_idx_bits;
	wire _frontend_io_cpu_rrd_ftq_resps_2_entry_start_bank;
	wire [39:0] _frontend_io_cpu_rrd_ftq_resps_2_pc;
	wire [39:0] _frontend_io_cpu_com_pc;
	wire _frontend_io_cpu_perf_acquire;
	wire _frontend_io_cpu_perf_tlbMiss;
	wire _frontend_io_ptw_req_valid;
	wire [26:0] _frontend_io_ptw_req_bits_bits_addr;
	wire _frontend_io_ptw_req_bits_bits_need_gpa;
	wire _dcache_auto_out_a_valid;
	wire [2:0] _dcache_auto_out_a_bits_opcode;
	wire [2:0] _dcache_auto_out_a_bits_param;
	wire [3:0] _dcache_auto_out_a_bits_size;
	wire [1:0] _dcache_auto_out_a_bits_source;
	wire [31:0] _dcache_auto_out_a_bits_address;
	wire [7:0] _dcache_auto_out_a_bits_mask;
	wire [63:0] _dcache_auto_out_a_bits_data;
	wire _dcache_auto_out_b_ready;
	wire _dcache_auto_out_c_valid;
	wire [2:0] _dcache_auto_out_c_bits_opcode;
	wire [2:0] _dcache_auto_out_c_bits_param;
	wire [3:0] _dcache_auto_out_c_bits_size;
	wire [1:0] _dcache_auto_out_c_bits_source;
	wire [31:0] _dcache_auto_out_c_bits_address;
	wire [63:0] _dcache_auto_out_c_bits_data;
	wire _dcache_auto_out_d_ready;
	wire _dcache_auto_out_e_valid;
	wire [1:0] _dcache_auto_out_e_bits_sink;
	wire _dcache_io_lsu_req_ready;
	wire _dcache_io_lsu_resp_0_valid;
	wire _dcache_io_lsu_resp_0_bits_uop_is_amo;
	wire [3:0] _dcache_io_lsu_resp_0_bits_uop_ldq_idx;
	wire [3:0] _dcache_io_lsu_resp_0_bits_uop_stq_idx;
	wire _dcache_io_lsu_resp_0_bits_uop_uses_ldq;
	wire _dcache_io_lsu_resp_0_bits_uop_uses_stq;
	wire [63:0] _dcache_io_lsu_resp_0_bits_data;
	wire _dcache_io_lsu_resp_0_bits_is_hella;
	wire _dcache_io_lsu_store_ack_0_valid;
	wire [3:0] _dcache_io_lsu_store_ack_0_bits_uop_stq_idx;
	wire _dcache_io_lsu_store_ack_0_bits_is_hella;
	wire _dcache_io_lsu_nack_0_valid;
	wire [3:0] _dcache_io_lsu_nack_0_bits_uop_ldq_idx;
	wire [3:0] _dcache_io_lsu_nack_0_bits_uop_stq_idx;
	wire [1:0] _dcache_io_lsu_nack_0_bits_uop_mem_size;
	wire _dcache_io_lsu_nack_0_bits_uop_uses_ldq;
	wire _dcache_io_lsu_nack_0_bits_uop_uses_stq;
	wire [39:0] _dcache_io_lsu_nack_0_bits_addr;
	wire _dcache_io_lsu_nack_0_bits_is_hella;
	wire _dcache_io_lsu_ll_resp_valid;
	wire _dcache_io_lsu_ll_resp_bits_uop_is_amo;
	wire [3:0] _dcache_io_lsu_ll_resp_bits_uop_ldq_idx;
	wire [3:0] _dcache_io_lsu_ll_resp_bits_uop_stq_idx;
	wire _dcache_io_lsu_ll_resp_bits_uop_uses_ldq;
	wire _dcache_io_lsu_ll_resp_bits_uop_uses_stq;
	wire [63:0] _dcache_io_lsu_ll_resp_bits_data;
	wire _dcache_io_lsu_ll_resp_bits_is_hella;
	wire _dcache_io_lsu_release_valid;
	wire [31:0] _dcache_io_lsu_release_bits_address;
	wire _dcache_io_lsu_ordered;
	wire _dcache_io_lsu_perf_acquire;
	wire _dcache_io_lsu_perf_release;
	wire _buffer_1_auto_in_a_ready;
	wire _buffer_1_auto_in_b_valid;
	wire [1:0] _buffer_1_auto_in_b_bits_param;
	wire [3:0] _buffer_1_auto_in_b_bits_size;
	wire [1:0] _buffer_1_auto_in_b_bits_source;
	wire [31:0] _buffer_1_auto_in_b_bits_address;
	wire _buffer_1_auto_in_c_ready;
	wire _buffer_1_auto_in_d_valid;
	wire [2:0] _buffer_1_auto_in_d_bits_opcode;
	wire [1:0] _buffer_1_auto_in_d_bits_param;
	wire [3:0] _buffer_1_auto_in_d_bits_size;
	wire [1:0] _buffer_1_auto_in_d_bits_source;
	wire [1:0] _buffer_1_auto_in_d_bits_sink;
	wire [63:0] _buffer_1_auto_in_d_bits_data;
	wire _buffer_1_auto_in_e_ready;
	wire _buffer_1_auto_out_a_valid;
	wire [2:0] _buffer_1_auto_out_a_bits_opcode;
	wire [2:0] _buffer_1_auto_out_a_bits_param;
	wire [3:0] _buffer_1_auto_out_a_bits_size;
	wire [1:0] _buffer_1_auto_out_a_bits_source;
	wire [31:0] _buffer_1_auto_out_a_bits_address;
	wire [7:0] _buffer_1_auto_out_a_bits_mask;
	wire [63:0] _buffer_1_auto_out_a_bits_data;
	wire _buffer_1_auto_out_a_bits_corrupt;
	wire _buffer_1_auto_out_b_ready;
	wire _buffer_1_auto_out_c_valid;
	wire [2:0] _buffer_1_auto_out_c_bits_opcode;
	wire [2:0] _buffer_1_auto_out_c_bits_param;
	wire [3:0] _buffer_1_auto_out_c_bits_size;
	wire [1:0] _buffer_1_auto_out_c_bits_source;
	wire [31:0] _buffer_1_auto_out_c_bits_address;
	wire [63:0] _buffer_1_auto_out_c_bits_data;
	wire _buffer_1_auto_out_c_bits_corrupt;
	wire _buffer_1_auto_out_d_ready;
	wire _buffer_1_auto_out_e_valid;
	wire [1:0] _buffer_1_auto_out_e_bits_sink;
	wire _buffer_auto_in_a_ready;
	wire _buffer_auto_in_b_valid;
	wire [2:0] _buffer_auto_in_b_bits_opcode;
	wire [1:0] _buffer_auto_in_b_bits_param;
	wire [3:0] _buffer_auto_in_b_bits_size;
	wire [2:0] _buffer_auto_in_b_bits_source;
	wire [31:0] _buffer_auto_in_b_bits_address;
	wire [7:0] _buffer_auto_in_b_bits_mask;
	wire [63:0] _buffer_auto_in_b_bits_data;
	wire _buffer_auto_in_b_bits_corrupt;
	wire _buffer_auto_in_c_ready;
	wire _buffer_auto_in_d_valid;
	wire [2:0] _buffer_auto_in_d_bits_opcode;
	wire [1:0] _buffer_auto_in_d_bits_param;
	wire [3:0] _buffer_auto_in_d_bits_size;
	wire [2:0] _buffer_auto_in_d_bits_source;
	wire [1:0] _buffer_auto_in_d_bits_sink;
	wire _buffer_auto_in_d_bits_denied;
	wire [63:0] _buffer_auto_in_d_bits_data;
	wire _buffer_auto_in_d_bits_corrupt;
	wire _buffer_auto_in_e_ready;
	wire _intXbar_auto_anon_out_0;
	wire _intXbar_auto_anon_out_1;
	wire _intXbar_auto_anon_out_2;
	wire _intXbar_auto_anon_out_3;
	wire _intXbar_auto_anon_out_4;
	wire _tlMasterXbar_auto_anon_in_1_a_ready;
	wire _tlMasterXbar_auto_anon_in_1_d_valid;
	wire [2:0] _tlMasterXbar_auto_anon_in_1_d_bits_opcode;
	wire [1:0] _tlMasterXbar_auto_anon_in_1_d_bits_param;
	wire [3:0] _tlMasterXbar_auto_anon_in_1_d_bits_size;
	wire [1:0] _tlMasterXbar_auto_anon_in_1_d_bits_sink;
	wire _tlMasterXbar_auto_anon_in_1_d_bits_denied;
	wire [63:0] _tlMasterXbar_auto_anon_in_1_d_bits_data;
	wire _tlMasterXbar_auto_anon_in_1_d_bits_corrupt;
	wire _tlMasterXbar_auto_anon_in_0_a_ready;
	wire _tlMasterXbar_auto_anon_in_0_b_valid;
	wire [2:0] _tlMasterXbar_auto_anon_in_0_b_bits_opcode;
	wire [1:0] _tlMasterXbar_auto_anon_in_0_b_bits_param;
	wire [3:0] _tlMasterXbar_auto_anon_in_0_b_bits_size;
	wire [1:0] _tlMasterXbar_auto_anon_in_0_b_bits_source;
	wire [31:0] _tlMasterXbar_auto_anon_in_0_b_bits_address;
	wire [7:0] _tlMasterXbar_auto_anon_in_0_b_bits_mask;
	wire [63:0] _tlMasterXbar_auto_anon_in_0_b_bits_data;
	wire _tlMasterXbar_auto_anon_in_0_b_bits_corrupt;
	wire _tlMasterXbar_auto_anon_in_0_c_ready;
	wire _tlMasterXbar_auto_anon_in_0_d_valid;
	wire [2:0] _tlMasterXbar_auto_anon_in_0_d_bits_opcode;
	wire [1:0] _tlMasterXbar_auto_anon_in_0_d_bits_param;
	wire [3:0] _tlMasterXbar_auto_anon_in_0_d_bits_size;
	wire [1:0] _tlMasterXbar_auto_anon_in_0_d_bits_source;
	wire [1:0] _tlMasterXbar_auto_anon_in_0_d_bits_sink;
	wire _tlMasterXbar_auto_anon_in_0_d_bits_denied;
	wire [63:0] _tlMasterXbar_auto_anon_in_0_d_bits_data;
	wire _tlMasterXbar_auto_anon_in_0_d_bits_corrupt;
	wire _tlMasterXbar_auto_anon_in_0_e_ready;
	wire _tlMasterXbar_auto_anon_out_a_valid;
	wire [2:0] _tlMasterXbar_auto_anon_out_a_bits_opcode;
	wire [2:0] _tlMasterXbar_auto_anon_out_a_bits_param;
	wire [3:0] _tlMasterXbar_auto_anon_out_a_bits_size;
	wire [2:0] _tlMasterXbar_auto_anon_out_a_bits_source;
	wire [31:0] _tlMasterXbar_auto_anon_out_a_bits_address;
	wire [7:0] _tlMasterXbar_auto_anon_out_a_bits_mask;
	wire [63:0] _tlMasterXbar_auto_anon_out_a_bits_data;
	wire _tlMasterXbar_auto_anon_out_a_bits_corrupt;
	wire _tlMasterXbar_auto_anon_out_b_ready;
	wire _tlMasterXbar_auto_anon_out_c_valid;
	wire [2:0] _tlMasterXbar_auto_anon_out_c_bits_opcode;
	wire [2:0] _tlMasterXbar_auto_anon_out_c_bits_param;
	wire [3:0] _tlMasterXbar_auto_anon_out_c_bits_size;
	wire [2:0] _tlMasterXbar_auto_anon_out_c_bits_source;
	wire [31:0] _tlMasterXbar_auto_anon_out_c_bits_address;
	wire [63:0] _tlMasterXbar_auto_anon_out_c_bits_data;
	wire _tlMasterXbar_auto_anon_out_c_bits_corrupt;
	wire _tlMasterXbar_auto_anon_out_d_ready;
	wire _tlMasterXbar_auto_anon_out_e_valid;
	wire [1:0] _tlMasterXbar_auto_anon_out_e_bits_sink;
	TLXbar_MasterXbar_BoomTile_i2_o1_a32d64s3k2z4c tlMasterXbar(
		.clock(clock),
		.reset(reset),
		.auto_anon_in_1_a_ready(_tlMasterXbar_auto_anon_in_1_a_ready),
		.auto_anon_in_1_a_valid(_buffer_2_auto_out_a_valid),
		.auto_anon_in_1_a_bits_opcode(_buffer_2_auto_out_a_bits_opcode),
		.auto_anon_in_1_a_bits_param(_buffer_2_auto_out_a_bits_param),
		.auto_anon_in_1_a_bits_size(_buffer_2_auto_out_a_bits_size),
		.auto_anon_in_1_a_bits_source(_buffer_2_auto_out_a_bits_source),
		.auto_anon_in_1_a_bits_address(_buffer_2_auto_out_a_bits_address),
		.auto_anon_in_1_a_bits_mask(_buffer_2_auto_out_a_bits_mask),
		.auto_anon_in_1_a_bits_data(_buffer_2_auto_out_a_bits_data),
		.auto_anon_in_1_a_bits_corrupt(_buffer_2_auto_out_a_bits_corrupt),
		.auto_anon_in_1_d_ready(_buffer_2_auto_out_d_ready),
		.auto_anon_in_1_d_valid(_tlMasterXbar_auto_anon_in_1_d_valid),
		.auto_anon_in_1_d_bits_opcode(_tlMasterXbar_auto_anon_in_1_d_bits_opcode),
		.auto_anon_in_1_d_bits_param(_tlMasterXbar_auto_anon_in_1_d_bits_param),
		.auto_anon_in_1_d_bits_size(_tlMasterXbar_auto_anon_in_1_d_bits_size),
		.auto_anon_in_1_d_bits_sink(_tlMasterXbar_auto_anon_in_1_d_bits_sink),
		.auto_anon_in_1_d_bits_denied(_tlMasterXbar_auto_anon_in_1_d_bits_denied),
		.auto_anon_in_1_d_bits_data(_tlMasterXbar_auto_anon_in_1_d_bits_data),
		.auto_anon_in_1_d_bits_corrupt(_tlMasterXbar_auto_anon_in_1_d_bits_corrupt),
		.auto_anon_in_0_a_ready(_tlMasterXbar_auto_anon_in_0_a_ready),
		.auto_anon_in_0_a_valid(_buffer_1_auto_out_a_valid),
		.auto_anon_in_0_a_bits_opcode(_buffer_1_auto_out_a_bits_opcode),
		.auto_anon_in_0_a_bits_param(_buffer_1_auto_out_a_bits_param),
		.auto_anon_in_0_a_bits_size(_buffer_1_auto_out_a_bits_size),
		.auto_anon_in_0_a_bits_source(_buffer_1_auto_out_a_bits_source),
		.auto_anon_in_0_a_bits_address(_buffer_1_auto_out_a_bits_address),
		.auto_anon_in_0_a_bits_mask(_buffer_1_auto_out_a_bits_mask),
		.auto_anon_in_0_a_bits_data(_buffer_1_auto_out_a_bits_data),
		.auto_anon_in_0_a_bits_corrupt(_buffer_1_auto_out_a_bits_corrupt),
		.auto_anon_in_0_b_ready(_buffer_1_auto_out_b_ready),
		.auto_anon_in_0_b_valid(_tlMasterXbar_auto_anon_in_0_b_valid),
		.auto_anon_in_0_b_bits_opcode(_tlMasterXbar_auto_anon_in_0_b_bits_opcode),
		.auto_anon_in_0_b_bits_param(_tlMasterXbar_auto_anon_in_0_b_bits_param),
		.auto_anon_in_0_b_bits_size(_tlMasterXbar_auto_anon_in_0_b_bits_size),
		.auto_anon_in_0_b_bits_source(_tlMasterXbar_auto_anon_in_0_b_bits_source),
		.auto_anon_in_0_b_bits_address(_tlMasterXbar_auto_anon_in_0_b_bits_address),
		.auto_anon_in_0_b_bits_mask(_tlMasterXbar_auto_anon_in_0_b_bits_mask),
		.auto_anon_in_0_b_bits_data(_tlMasterXbar_auto_anon_in_0_b_bits_data),
		.auto_anon_in_0_b_bits_corrupt(_tlMasterXbar_auto_anon_in_0_b_bits_corrupt),
		.auto_anon_in_0_c_ready(_tlMasterXbar_auto_anon_in_0_c_ready),
		.auto_anon_in_0_c_valid(_buffer_1_auto_out_c_valid),
		.auto_anon_in_0_c_bits_opcode(_buffer_1_auto_out_c_bits_opcode),
		.auto_anon_in_0_c_bits_param(_buffer_1_auto_out_c_bits_param),
		.auto_anon_in_0_c_bits_size(_buffer_1_auto_out_c_bits_size),
		.auto_anon_in_0_c_bits_source(_buffer_1_auto_out_c_bits_source),
		.auto_anon_in_0_c_bits_address(_buffer_1_auto_out_c_bits_address),
		.auto_anon_in_0_c_bits_data(_buffer_1_auto_out_c_bits_data),
		.auto_anon_in_0_c_bits_corrupt(_buffer_1_auto_out_c_bits_corrupt),
		.auto_anon_in_0_d_ready(_buffer_1_auto_out_d_ready),
		.auto_anon_in_0_d_valid(_tlMasterXbar_auto_anon_in_0_d_valid),
		.auto_anon_in_0_d_bits_opcode(_tlMasterXbar_auto_anon_in_0_d_bits_opcode),
		.auto_anon_in_0_d_bits_param(_tlMasterXbar_auto_anon_in_0_d_bits_param),
		.auto_anon_in_0_d_bits_size(_tlMasterXbar_auto_anon_in_0_d_bits_size),
		.auto_anon_in_0_d_bits_source(_tlMasterXbar_auto_anon_in_0_d_bits_source),
		.auto_anon_in_0_d_bits_sink(_tlMasterXbar_auto_anon_in_0_d_bits_sink),
		.auto_anon_in_0_d_bits_denied(_tlMasterXbar_auto_anon_in_0_d_bits_denied),
		.auto_anon_in_0_d_bits_data(_tlMasterXbar_auto_anon_in_0_d_bits_data),
		.auto_anon_in_0_d_bits_corrupt(_tlMasterXbar_auto_anon_in_0_d_bits_corrupt),
		.auto_anon_in_0_e_ready(_tlMasterXbar_auto_anon_in_0_e_ready),
		.auto_anon_in_0_e_valid(_buffer_1_auto_out_e_valid),
		.auto_anon_in_0_e_bits_sink(_buffer_1_auto_out_e_bits_sink),
		.auto_anon_out_a_ready(_buffer_auto_in_a_ready),
		.auto_anon_out_a_valid(_tlMasterXbar_auto_anon_out_a_valid),
		.auto_anon_out_a_bits_opcode(_tlMasterXbar_auto_anon_out_a_bits_opcode),
		.auto_anon_out_a_bits_param(_tlMasterXbar_auto_anon_out_a_bits_param),
		.auto_anon_out_a_bits_size(_tlMasterXbar_auto_anon_out_a_bits_size),
		.auto_anon_out_a_bits_source(_tlMasterXbar_auto_anon_out_a_bits_source),
		.auto_anon_out_a_bits_address(_tlMasterXbar_auto_anon_out_a_bits_address),
		.auto_anon_out_a_bits_mask(_tlMasterXbar_auto_anon_out_a_bits_mask),
		.auto_anon_out_a_bits_data(_tlMasterXbar_auto_anon_out_a_bits_data),
		.auto_anon_out_a_bits_corrupt(_tlMasterXbar_auto_anon_out_a_bits_corrupt),
		.auto_anon_out_b_ready(_tlMasterXbar_auto_anon_out_b_ready),
		.auto_anon_out_b_valid(_buffer_auto_in_b_valid),
		.auto_anon_out_b_bits_opcode(_buffer_auto_in_b_bits_opcode),
		.auto_anon_out_b_bits_param(_buffer_auto_in_b_bits_param),
		.auto_anon_out_b_bits_size(_buffer_auto_in_b_bits_size),
		.auto_anon_out_b_bits_source(_buffer_auto_in_b_bits_source),
		.auto_anon_out_b_bits_address(_buffer_auto_in_b_bits_address),
		.auto_anon_out_b_bits_mask(_buffer_auto_in_b_bits_mask),
		.auto_anon_out_b_bits_data(_buffer_auto_in_b_bits_data),
		.auto_anon_out_b_bits_corrupt(_buffer_auto_in_b_bits_corrupt),
		.auto_anon_out_c_ready(_buffer_auto_in_c_ready),
		.auto_anon_out_c_valid(_tlMasterXbar_auto_anon_out_c_valid),
		.auto_anon_out_c_bits_opcode(_tlMasterXbar_auto_anon_out_c_bits_opcode),
		.auto_anon_out_c_bits_param(_tlMasterXbar_auto_anon_out_c_bits_param),
		.auto_anon_out_c_bits_size(_tlMasterXbar_auto_anon_out_c_bits_size),
		.auto_anon_out_c_bits_source(_tlMasterXbar_auto_anon_out_c_bits_source),
		.auto_anon_out_c_bits_address(_tlMasterXbar_auto_anon_out_c_bits_address),
		.auto_anon_out_c_bits_data(_tlMasterXbar_auto_anon_out_c_bits_data),
		.auto_anon_out_c_bits_corrupt(_tlMasterXbar_auto_anon_out_c_bits_corrupt),
		.auto_anon_out_d_ready(_tlMasterXbar_auto_anon_out_d_ready),
		.auto_anon_out_d_valid(_buffer_auto_in_d_valid),
		.auto_anon_out_d_bits_opcode(_buffer_auto_in_d_bits_opcode),
		.auto_anon_out_d_bits_param(_buffer_auto_in_d_bits_param),
		.auto_anon_out_d_bits_size(_buffer_auto_in_d_bits_size),
		.auto_anon_out_d_bits_source(_buffer_auto_in_d_bits_source),
		.auto_anon_out_d_bits_sink(_buffer_auto_in_d_bits_sink),
		.auto_anon_out_d_bits_denied(_buffer_auto_in_d_bits_denied),
		.auto_anon_out_d_bits_data(_buffer_auto_in_d_bits_data),
		.auto_anon_out_d_bits_corrupt(_buffer_auto_in_d_bits_corrupt),
		.auto_anon_out_e_ready(_buffer_auto_in_e_ready),
		.auto_anon_out_e_valid(_tlMasterXbar_auto_anon_out_e_valid),
		.auto_anon_out_e_bits_sink(_tlMasterXbar_auto_anon_out_e_bits_sink)
	);
	IntXbar_i4_o1 intXbar(
		.auto_anon_in_3_0(auto_int_local_in_3_0),
		.auto_anon_in_2_0(auto_int_local_in_2_0),
		.auto_anon_in_1_0(auto_int_local_in_1_0),
		.auto_anon_in_1_1(auto_int_local_in_1_1),
		.auto_anon_in_0_0(auto_int_local_in_0_0),
		.auto_anon_out_0(_intXbar_auto_anon_out_0),
		.auto_anon_out_1(_intXbar_auto_anon_out_1),
		.auto_anon_out_2(_intXbar_auto_anon_out_2),
		.auto_anon_out_3(_intXbar_auto_anon_out_3),
		.auto_anon_out_4(_intXbar_auto_anon_out_4)
	);
	TLBuffer_a32d64s3k2z4c buffer(
		.clock(clock),
		.reset(reset),
		.auto_in_a_ready(_buffer_auto_in_a_ready),
		.auto_in_a_valid(_tlMasterXbar_auto_anon_out_a_valid),
		.auto_in_a_bits_opcode(_tlMasterXbar_auto_anon_out_a_bits_opcode),
		.auto_in_a_bits_param(_tlMasterXbar_auto_anon_out_a_bits_param),
		.auto_in_a_bits_size(_tlMasterXbar_auto_anon_out_a_bits_size),
		.auto_in_a_bits_source(_tlMasterXbar_auto_anon_out_a_bits_source),
		.auto_in_a_bits_address(_tlMasterXbar_auto_anon_out_a_bits_address),
		.auto_in_a_bits_mask(_tlMasterXbar_auto_anon_out_a_bits_mask),
		.auto_in_a_bits_data(_tlMasterXbar_auto_anon_out_a_bits_data),
		.auto_in_a_bits_corrupt(_tlMasterXbar_auto_anon_out_a_bits_corrupt),
		.auto_in_b_ready(_tlMasterXbar_auto_anon_out_b_ready),
		.auto_in_b_valid(_buffer_auto_in_b_valid),
		.auto_in_b_bits_opcode(_buffer_auto_in_b_bits_opcode),
		.auto_in_b_bits_param(_buffer_auto_in_b_bits_param),
		.auto_in_b_bits_size(_buffer_auto_in_b_bits_size),
		.auto_in_b_bits_source(_buffer_auto_in_b_bits_source),
		.auto_in_b_bits_address(_buffer_auto_in_b_bits_address),
		.auto_in_b_bits_mask(_buffer_auto_in_b_bits_mask),
		.auto_in_b_bits_data(_buffer_auto_in_b_bits_data),
		.auto_in_b_bits_corrupt(_buffer_auto_in_b_bits_corrupt),
		.auto_in_c_ready(_buffer_auto_in_c_ready),
		.auto_in_c_valid(_tlMasterXbar_auto_anon_out_c_valid),
		.auto_in_c_bits_opcode(_tlMasterXbar_auto_anon_out_c_bits_opcode),
		.auto_in_c_bits_param(_tlMasterXbar_auto_anon_out_c_bits_param),
		.auto_in_c_bits_size(_tlMasterXbar_auto_anon_out_c_bits_size),
		.auto_in_c_bits_source(_tlMasterXbar_auto_anon_out_c_bits_source),
		.auto_in_c_bits_address(_tlMasterXbar_auto_anon_out_c_bits_address),
		.auto_in_c_bits_data(_tlMasterXbar_auto_anon_out_c_bits_data),
		.auto_in_c_bits_corrupt(_tlMasterXbar_auto_anon_out_c_bits_corrupt),
		.auto_in_d_ready(_tlMasterXbar_auto_anon_out_d_ready),
		.auto_in_d_valid(_buffer_auto_in_d_valid),
		.auto_in_d_bits_opcode(_buffer_auto_in_d_bits_opcode),
		.auto_in_d_bits_param(_buffer_auto_in_d_bits_param),
		.auto_in_d_bits_size(_buffer_auto_in_d_bits_size),
		.auto_in_d_bits_source(_buffer_auto_in_d_bits_source),
		.auto_in_d_bits_sink(_buffer_auto_in_d_bits_sink),
		.auto_in_d_bits_denied(_buffer_auto_in_d_bits_denied),
		.auto_in_d_bits_data(_buffer_auto_in_d_bits_data),
		.auto_in_d_bits_corrupt(_buffer_auto_in_d_bits_corrupt),
		.auto_in_e_ready(_buffer_auto_in_e_ready),
		.auto_in_e_valid(_tlMasterXbar_auto_anon_out_e_valid),
		.auto_in_e_bits_sink(_tlMasterXbar_auto_anon_out_e_bits_sink),
		.auto_out_a_ready(auto_buffer_out_a_ready),
		.auto_out_a_valid(auto_buffer_out_a_valid),
		.auto_out_a_bits_opcode(auto_buffer_out_a_bits_opcode),
		.auto_out_a_bits_param(auto_buffer_out_a_bits_param),
		.auto_out_a_bits_size(auto_buffer_out_a_bits_size),
		.auto_out_a_bits_source(auto_buffer_out_a_bits_source),
		.auto_out_a_bits_address(auto_buffer_out_a_bits_address),
		.auto_out_a_bits_mask(auto_buffer_out_a_bits_mask),
		.auto_out_a_bits_data(auto_buffer_out_a_bits_data),
		.auto_out_a_bits_corrupt(auto_buffer_out_a_bits_corrupt),
		.auto_out_b_ready(auto_buffer_out_b_ready),
		.auto_out_b_valid(auto_buffer_out_b_valid),
		.auto_out_b_bits_opcode(auto_buffer_out_b_bits_opcode),
		.auto_out_b_bits_param(auto_buffer_out_b_bits_param),
		.auto_out_b_bits_size(auto_buffer_out_b_bits_size),
		.auto_out_b_bits_source(auto_buffer_out_b_bits_source),
		.auto_out_b_bits_address(auto_buffer_out_b_bits_address),
		.auto_out_b_bits_mask(auto_buffer_out_b_bits_mask),
		.auto_out_b_bits_data(auto_buffer_out_b_bits_data),
		.auto_out_b_bits_corrupt(auto_buffer_out_b_bits_corrupt),
		.auto_out_c_ready(auto_buffer_out_c_ready),
		.auto_out_c_valid(auto_buffer_out_c_valid),
		.auto_out_c_bits_opcode(auto_buffer_out_c_bits_opcode),
		.auto_out_c_bits_param(auto_buffer_out_c_bits_param),
		.auto_out_c_bits_size(auto_buffer_out_c_bits_size),
		.auto_out_c_bits_source(auto_buffer_out_c_bits_source),
		.auto_out_c_bits_address(auto_buffer_out_c_bits_address),
		.auto_out_c_bits_data(auto_buffer_out_c_bits_data),
		.auto_out_c_bits_corrupt(auto_buffer_out_c_bits_corrupt),
		.auto_out_d_ready(auto_buffer_out_d_ready),
		.auto_out_d_valid(auto_buffer_out_d_valid),
		.auto_out_d_bits_opcode(auto_buffer_out_d_bits_opcode),
		.auto_out_d_bits_param(auto_buffer_out_d_bits_param),
		.auto_out_d_bits_size(auto_buffer_out_d_bits_size),
		.auto_out_d_bits_source(auto_buffer_out_d_bits_source),
		.auto_out_d_bits_sink(auto_buffer_out_d_bits_sink),
		.auto_out_d_bits_denied(auto_buffer_out_d_bits_denied),
		.auto_out_d_bits_data(auto_buffer_out_d_bits_data),
		.auto_out_d_bits_corrupt(auto_buffer_out_d_bits_corrupt),
		.auto_out_e_ready(auto_buffer_out_e_ready),
		.auto_out_e_valid(auto_buffer_out_e_valid),
		.auto_out_e_bits_sink(auto_buffer_out_e_bits_sink)
	);
	TLBuffer_a32d64s2k2z4c buffer_1(
		.clock(clock),
		.reset(reset),
		.auto_in_a_ready(_buffer_1_auto_in_a_ready),
		.auto_in_a_valid(_dcache_auto_out_a_valid),
		.auto_in_a_bits_opcode(_dcache_auto_out_a_bits_opcode),
		.auto_in_a_bits_param(_dcache_auto_out_a_bits_param),
		.auto_in_a_bits_size(_dcache_auto_out_a_bits_size),
		.auto_in_a_bits_source(_dcache_auto_out_a_bits_source),
		.auto_in_a_bits_address(_dcache_auto_out_a_bits_address),
		.auto_in_a_bits_mask(_dcache_auto_out_a_bits_mask),
		.auto_in_a_bits_data(_dcache_auto_out_a_bits_data),
		.auto_in_b_ready(_dcache_auto_out_b_ready),
		.auto_in_b_valid(_buffer_1_auto_in_b_valid),
		.auto_in_b_bits_param(_buffer_1_auto_in_b_bits_param),
		.auto_in_b_bits_size(_buffer_1_auto_in_b_bits_size),
		.auto_in_b_bits_source(_buffer_1_auto_in_b_bits_source),
		.auto_in_b_bits_address(_buffer_1_auto_in_b_bits_address),
		.auto_in_c_ready(_buffer_1_auto_in_c_ready),
		.auto_in_c_valid(_dcache_auto_out_c_valid),
		.auto_in_c_bits_opcode(_dcache_auto_out_c_bits_opcode),
		.auto_in_c_bits_param(_dcache_auto_out_c_bits_param),
		.auto_in_c_bits_size(_dcache_auto_out_c_bits_size),
		.auto_in_c_bits_source(_dcache_auto_out_c_bits_source),
		.auto_in_c_bits_address(_dcache_auto_out_c_bits_address),
		.auto_in_c_bits_data(_dcache_auto_out_c_bits_data),
		.auto_in_d_ready(_dcache_auto_out_d_ready),
		.auto_in_d_valid(_buffer_1_auto_in_d_valid),
		.auto_in_d_bits_opcode(_buffer_1_auto_in_d_bits_opcode),
		.auto_in_d_bits_param(_buffer_1_auto_in_d_bits_param),
		.auto_in_d_bits_size(_buffer_1_auto_in_d_bits_size),
		.auto_in_d_bits_source(_buffer_1_auto_in_d_bits_source),
		.auto_in_d_bits_sink(_buffer_1_auto_in_d_bits_sink),
		.auto_in_d_bits_data(_buffer_1_auto_in_d_bits_data),
		.auto_in_e_ready(_buffer_1_auto_in_e_ready),
		.auto_in_e_valid(_dcache_auto_out_e_valid),
		.auto_in_e_bits_sink(_dcache_auto_out_e_bits_sink),
		.auto_out_a_ready(_tlMasterXbar_auto_anon_in_0_a_ready),
		.auto_out_a_valid(_buffer_1_auto_out_a_valid),
		.auto_out_a_bits_opcode(_buffer_1_auto_out_a_bits_opcode),
		.auto_out_a_bits_param(_buffer_1_auto_out_a_bits_param),
		.auto_out_a_bits_size(_buffer_1_auto_out_a_bits_size),
		.auto_out_a_bits_source(_buffer_1_auto_out_a_bits_source),
		.auto_out_a_bits_address(_buffer_1_auto_out_a_bits_address),
		.auto_out_a_bits_mask(_buffer_1_auto_out_a_bits_mask),
		.auto_out_a_bits_data(_buffer_1_auto_out_a_bits_data),
		.auto_out_a_bits_corrupt(_buffer_1_auto_out_a_bits_corrupt),
		.auto_out_b_ready(_buffer_1_auto_out_b_ready),
		.auto_out_b_valid(_tlMasterXbar_auto_anon_in_0_b_valid),
		.auto_out_b_bits_opcode(_tlMasterXbar_auto_anon_in_0_b_bits_opcode),
		.auto_out_b_bits_param(_tlMasterXbar_auto_anon_in_0_b_bits_param),
		.auto_out_b_bits_size(_tlMasterXbar_auto_anon_in_0_b_bits_size),
		.auto_out_b_bits_source(_tlMasterXbar_auto_anon_in_0_b_bits_source),
		.auto_out_b_bits_address(_tlMasterXbar_auto_anon_in_0_b_bits_address),
		.auto_out_b_bits_mask(_tlMasterXbar_auto_anon_in_0_b_bits_mask),
		.auto_out_b_bits_data(_tlMasterXbar_auto_anon_in_0_b_bits_data),
		.auto_out_b_bits_corrupt(_tlMasterXbar_auto_anon_in_0_b_bits_corrupt),
		.auto_out_c_ready(_tlMasterXbar_auto_anon_in_0_c_ready),
		.auto_out_c_valid(_buffer_1_auto_out_c_valid),
		.auto_out_c_bits_opcode(_buffer_1_auto_out_c_bits_opcode),
		.auto_out_c_bits_param(_buffer_1_auto_out_c_bits_param),
		.auto_out_c_bits_size(_buffer_1_auto_out_c_bits_size),
		.auto_out_c_bits_source(_buffer_1_auto_out_c_bits_source),
		.auto_out_c_bits_address(_buffer_1_auto_out_c_bits_address),
		.auto_out_c_bits_data(_buffer_1_auto_out_c_bits_data),
		.auto_out_c_bits_corrupt(_buffer_1_auto_out_c_bits_corrupt),
		.auto_out_d_ready(_buffer_1_auto_out_d_ready),
		.auto_out_d_valid(_tlMasterXbar_auto_anon_in_0_d_valid),
		.auto_out_d_bits_opcode(_tlMasterXbar_auto_anon_in_0_d_bits_opcode),
		.auto_out_d_bits_param(_tlMasterXbar_auto_anon_in_0_d_bits_param),
		.auto_out_d_bits_size(_tlMasterXbar_auto_anon_in_0_d_bits_size),
		.auto_out_d_bits_source(_tlMasterXbar_auto_anon_in_0_d_bits_source),
		.auto_out_d_bits_sink(_tlMasterXbar_auto_anon_in_0_d_bits_sink),
		.auto_out_d_bits_denied(_tlMasterXbar_auto_anon_in_0_d_bits_denied),
		.auto_out_d_bits_data(_tlMasterXbar_auto_anon_in_0_d_bits_data),
		.auto_out_d_bits_corrupt(_tlMasterXbar_auto_anon_in_0_d_bits_corrupt),
		.auto_out_e_ready(_tlMasterXbar_auto_anon_in_0_e_ready),
		.auto_out_e_valid(_buffer_1_auto_out_e_valid),
		.auto_out_e_bits_sink(_buffer_1_auto_out_e_bits_sink)
	);
	BoomNonBlockingDCache dcache(
		.clock(clock),
		.reset(reset),
		.auto_out_a_ready(_buffer_1_auto_in_a_ready),
		.auto_out_a_valid(_dcache_auto_out_a_valid),
		.auto_out_a_bits_opcode(_dcache_auto_out_a_bits_opcode),
		.auto_out_a_bits_param(_dcache_auto_out_a_bits_param),
		.auto_out_a_bits_size(_dcache_auto_out_a_bits_size),
		.auto_out_a_bits_source(_dcache_auto_out_a_bits_source),
		.auto_out_a_bits_address(_dcache_auto_out_a_bits_address),
		.auto_out_a_bits_mask(_dcache_auto_out_a_bits_mask),
		.auto_out_a_bits_data(_dcache_auto_out_a_bits_data),
		.auto_out_b_ready(_dcache_auto_out_b_ready),
		.auto_out_b_valid(_buffer_1_auto_in_b_valid),
		.auto_out_b_bits_param(_buffer_1_auto_in_b_bits_param),
		.auto_out_b_bits_size(_buffer_1_auto_in_b_bits_size),
		.auto_out_b_bits_source(_buffer_1_auto_in_b_bits_source),
		.auto_out_b_bits_address(_buffer_1_auto_in_b_bits_address),
		.auto_out_c_ready(_buffer_1_auto_in_c_ready),
		.auto_out_c_valid(_dcache_auto_out_c_valid),
		.auto_out_c_bits_opcode(_dcache_auto_out_c_bits_opcode),
		.auto_out_c_bits_param(_dcache_auto_out_c_bits_param),
		.auto_out_c_bits_size(_dcache_auto_out_c_bits_size),
		.auto_out_c_bits_source(_dcache_auto_out_c_bits_source),
		.auto_out_c_bits_address(_dcache_auto_out_c_bits_address),
		.auto_out_c_bits_data(_dcache_auto_out_c_bits_data),
		.auto_out_d_ready(_dcache_auto_out_d_ready),
		.auto_out_d_valid(_buffer_1_auto_in_d_valid),
		.auto_out_d_bits_opcode(_buffer_1_auto_in_d_bits_opcode),
		.auto_out_d_bits_param(_buffer_1_auto_in_d_bits_param),
		.auto_out_d_bits_size(_buffer_1_auto_in_d_bits_size),
		.auto_out_d_bits_source(_buffer_1_auto_in_d_bits_source),
		.auto_out_d_bits_sink(_buffer_1_auto_in_d_bits_sink),
		.auto_out_d_bits_data(_buffer_1_auto_in_d_bits_data),
		.auto_out_e_ready(_buffer_1_auto_in_e_ready),
		.auto_out_e_valid(_dcache_auto_out_e_valid),
		.auto_out_e_bits_sink(_dcache_auto_out_e_bits_sink),
		.io_lsu_req_ready(_dcache_io_lsu_req_ready),
		.io_lsu_req_valid(_lsu_io_dmem_req_valid),
		.io_lsu_req_bits_0_valid(_lsu_io_dmem_req_bits_0_valid),
		.io_lsu_req_bits_0_bits_uop_inst(_lsu_io_dmem_req_bits_0_bits_uop_inst),
		.io_lsu_req_bits_0_bits_uop_debug_inst(_lsu_io_dmem_req_bits_0_bits_uop_debug_inst),
		.io_lsu_req_bits_0_bits_uop_is_rvc(_lsu_io_dmem_req_bits_0_bits_uop_is_rvc),
		.io_lsu_req_bits_0_bits_uop_debug_pc(_lsu_io_dmem_req_bits_0_bits_uop_debug_pc),
		.io_lsu_req_bits_0_bits_uop_iq_type_0(_lsu_io_dmem_req_bits_0_bits_uop_iq_type_0),
		.io_lsu_req_bits_0_bits_uop_iq_type_1(_lsu_io_dmem_req_bits_0_bits_uop_iq_type_1),
		.io_lsu_req_bits_0_bits_uop_iq_type_2(_lsu_io_dmem_req_bits_0_bits_uop_iq_type_2),
		.io_lsu_req_bits_0_bits_uop_iq_type_3(_lsu_io_dmem_req_bits_0_bits_uop_iq_type_3),
		.io_lsu_req_bits_0_bits_uop_fu_code_0(_lsu_io_dmem_req_bits_0_bits_uop_fu_code_0),
		.io_lsu_req_bits_0_bits_uop_fu_code_1(_lsu_io_dmem_req_bits_0_bits_uop_fu_code_1),
		.io_lsu_req_bits_0_bits_uop_fu_code_2(_lsu_io_dmem_req_bits_0_bits_uop_fu_code_2),
		.io_lsu_req_bits_0_bits_uop_fu_code_3(_lsu_io_dmem_req_bits_0_bits_uop_fu_code_3),
		.io_lsu_req_bits_0_bits_uop_fu_code_4(_lsu_io_dmem_req_bits_0_bits_uop_fu_code_4),
		.io_lsu_req_bits_0_bits_uop_fu_code_5(_lsu_io_dmem_req_bits_0_bits_uop_fu_code_5),
		.io_lsu_req_bits_0_bits_uop_fu_code_6(_lsu_io_dmem_req_bits_0_bits_uop_fu_code_6),
		.io_lsu_req_bits_0_bits_uop_fu_code_7(_lsu_io_dmem_req_bits_0_bits_uop_fu_code_7),
		.io_lsu_req_bits_0_bits_uop_fu_code_8(_lsu_io_dmem_req_bits_0_bits_uop_fu_code_8),
		.io_lsu_req_bits_0_bits_uop_fu_code_9(_lsu_io_dmem_req_bits_0_bits_uop_fu_code_9),
		.io_lsu_req_bits_0_bits_uop_iw_issued(_lsu_io_dmem_req_bits_0_bits_uop_iw_issued),
		.io_lsu_req_bits_0_bits_uop_iw_issued_partial_agen(_lsu_io_dmem_req_bits_0_bits_uop_iw_issued_partial_agen),
		.io_lsu_req_bits_0_bits_uop_iw_issued_partial_dgen(_lsu_io_dmem_req_bits_0_bits_uop_iw_issued_partial_dgen),
		.io_lsu_req_bits_0_bits_uop_iw_p1_speculative_child(_lsu_io_dmem_req_bits_0_bits_uop_iw_p1_speculative_child),
		.io_lsu_req_bits_0_bits_uop_iw_p2_speculative_child(_lsu_io_dmem_req_bits_0_bits_uop_iw_p2_speculative_child),
		.io_lsu_req_bits_0_bits_uop_iw_p1_bypass_hint(_lsu_io_dmem_req_bits_0_bits_uop_iw_p1_bypass_hint),
		.io_lsu_req_bits_0_bits_uop_iw_p2_bypass_hint(_lsu_io_dmem_req_bits_0_bits_uop_iw_p2_bypass_hint),
		.io_lsu_req_bits_0_bits_uop_iw_p3_bypass_hint(_lsu_io_dmem_req_bits_0_bits_uop_iw_p3_bypass_hint),
		.io_lsu_req_bits_0_bits_uop_dis_col_sel(_lsu_io_dmem_req_bits_0_bits_uop_dis_col_sel),
		.io_lsu_req_bits_0_bits_uop_br_mask(_lsu_io_dmem_req_bits_0_bits_uop_br_mask),
		.io_lsu_req_bits_0_bits_uop_br_tag(_lsu_io_dmem_req_bits_0_bits_uop_br_tag),
		.io_lsu_req_bits_0_bits_uop_br_type(_lsu_io_dmem_req_bits_0_bits_uop_br_type),
		.io_lsu_req_bits_0_bits_uop_is_sfb(_lsu_io_dmem_req_bits_0_bits_uop_is_sfb),
		.io_lsu_req_bits_0_bits_uop_is_fence(_lsu_io_dmem_req_bits_0_bits_uop_is_fence),
		.io_lsu_req_bits_0_bits_uop_is_fencei(_lsu_io_dmem_req_bits_0_bits_uop_is_fencei),
		.io_lsu_req_bits_0_bits_uop_is_sfence(_lsu_io_dmem_req_bits_0_bits_uop_is_sfence),
		.io_lsu_req_bits_0_bits_uop_is_amo(_lsu_io_dmem_req_bits_0_bits_uop_is_amo),
		.io_lsu_req_bits_0_bits_uop_is_eret(_lsu_io_dmem_req_bits_0_bits_uop_is_eret),
		.io_lsu_req_bits_0_bits_uop_is_sys_pc2epc(_lsu_io_dmem_req_bits_0_bits_uop_is_sys_pc2epc),
		.io_lsu_req_bits_0_bits_uop_is_rocc(_lsu_io_dmem_req_bits_0_bits_uop_is_rocc),
		.io_lsu_req_bits_0_bits_uop_is_mov(_lsu_io_dmem_req_bits_0_bits_uop_is_mov),
		.io_lsu_req_bits_0_bits_uop_ftq_idx(_lsu_io_dmem_req_bits_0_bits_uop_ftq_idx),
		.io_lsu_req_bits_0_bits_uop_edge_inst(_lsu_io_dmem_req_bits_0_bits_uop_edge_inst),
		.io_lsu_req_bits_0_bits_uop_pc_lob(_lsu_io_dmem_req_bits_0_bits_uop_pc_lob),
		.io_lsu_req_bits_0_bits_uop_taken(_lsu_io_dmem_req_bits_0_bits_uop_taken),
		.io_lsu_req_bits_0_bits_uop_imm_rename(_lsu_io_dmem_req_bits_0_bits_uop_imm_rename),
		.io_lsu_req_bits_0_bits_uop_imm_sel(_lsu_io_dmem_req_bits_0_bits_uop_imm_sel),
		.io_lsu_req_bits_0_bits_uop_pimm(_lsu_io_dmem_req_bits_0_bits_uop_pimm),
		.io_lsu_req_bits_0_bits_uop_imm_packed(_lsu_io_dmem_req_bits_0_bits_uop_imm_packed),
		.io_lsu_req_bits_0_bits_uop_op1_sel(_lsu_io_dmem_req_bits_0_bits_uop_op1_sel),
		.io_lsu_req_bits_0_bits_uop_op2_sel(_lsu_io_dmem_req_bits_0_bits_uop_op2_sel),
		.io_lsu_req_bits_0_bits_uop_fp_ctrl_ldst(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_ldst),
		.io_lsu_req_bits_0_bits_uop_fp_ctrl_wen(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_wen),
		.io_lsu_req_bits_0_bits_uop_fp_ctrl_ren1(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_ren1),
		.io_lsu_req_bits_0_bits_uop_fp_ctrl_ren2(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_ren2),
		.io_lsu_req_bits_0_bits_uop_fp_ctrl_ren3(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_ren3),
		.io_lsu_req_bits_0_bits_uop_fp_ctrl_swap12(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_swap12),
		.io_lsu_req_bits_0_bits_uop_fp_ctrl_swap23(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_swap23),
		.io_lsu_req_bits_0_bits_uop_fp_ctrl_typeTagIn(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_typeTagIn),
		.io_lsu_req_bits_0_bits_uop_fp_ctrl_typeTagOut(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_typeTagOut),
		.io_lsu_req_bits_0_bits_uop_fp_ctrl_fromint(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_fromint),
		.io_lsu_req_bits_0_bits_uop_fp_ctrl_toint(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_toint),
		.io_lsu_req_bits_0_bits_uop_fp_ctrl_fastpipe(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_fastpipe),
		.io_lsu_req_bits_0_bits_uop_fp_ctrl_fma(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_fma),
		.io_lsu_req_bits_0_bits_uop_fp_ctrl_div(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_div),
		.io_lsu_req_bits_0_bits_uop_fp_ctrl_sqrt(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_sqrt),
		.io_lsu_req_bits_0_bits_uop_fp_ctrl_wflags(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_wflags),
		.io_lsu_req_bits_0_bits_uop_fp_ctrl_vec(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_vec),
		.io_lsu_req_bits_0_bits_uop_rob_idx(_lsu_io_dmem_req_bits_0_bits_uop_rob_idx),
		.io_lsu_req_bits_0_bits_uop_ldq_idx(_lsu_io_dmem_req_bits_0_bits_uop_ldq_idx),
		.io_lsu_req_bits_0_bits_uop_stq_idx(_lsu_io_dmem_req_bits_0_bits_uop_stq_idx),
		.io_lsu_req_bits_0_bits_uop_rxq_idx(_lsu_io_dmem_req_bits_0_bits_uop_rxq_idx),
		.io_lsu_req_bits_0_bits_uop_pdst(_lsu_io_dmem_req_bits_0_bits_uop_pdst),
		.io_lsu_req_bits_0_bits_uop_prs1(_lsu_io_dmem_req_bits_0_bits_uop_prs1),
		.io_lsu_req_bits_0_bits_uop_prs2(_lsu_io_dmem_req_bits_0_bits_uop_prs2),
		.io_lsu_req_bits_0_bits_uop_prs3(_lsu_io_dmem_req_bits_0_bits_uop_prs3),
		.io_lsu_req_bits_0_bits_uop_ppred(_lsu_io_dmem_req_bits_0_bits_uop_ppred),
		.io_lsu_req_bits_0_bits_uop_prs1_busy(_lsu_io_dmem_req_bits_0_bits_uop_prs1_busy),
		.io_lsu_req_bits_0_bits_uop_prs2_busy(_lsu_io_dmem_req_bits_0_bits_uop_prs2_busy),
		.io_lsu_req_bits_0_bits_uop_prs3_busy(_lsu_io_dmem_req_bits_0_bits_uop_prs3_busy),
		.io_lsu_req_bits_0_bits_uop_ppred_busy(_lsu_io_dmem_req_bits_0_bits_uop_ppred_busy),
		.io_lsu_req_bits_0_bits_uop_stale_pdst(_lsu_io_dmem_req_bits_0_bits_uop_stale_pdst),
		.io_lsu_req_bits_0_bits_uop_exception(_lsu_io_dmem_req_bits_0_bits_uop_exception),
		.io_lsu_req_bits_0_bits_uop_exc_cause(_lsu_io_dmem_req_bits_0_bits_uop_exc_cause),
		.io_lsu_req_bits_0_bits_uop_mem_cmd(_lsu_io_dmem_req_bits_0_bits_uop_mem_cmd),
		.io_lsu_req_bits_0_bits_uop_mem_size(_lsu_io_dmem_req_bits_0_bits_uop_mem_size),
		.io_lsu_req_bits_0_bits_uop_mem_signed(_lsu_io_dmem_req_bits_0_bits_uop_mem_signed),
		.io_lsu_req_bits_0_bits_uop_uses_ldq(_lsu_io_dmem_req_bits_0_bits_uop_uses_ldq),
		.io_lsu_req_bits_0_bits_uop_uses_stq(_lsu_io_dmem_req_bits_0_bits_uop_uses_stq),
		.io_lsu_req_bits_0_bits_uop_is_unique(_lsu_io_dmem_req_bits_0_bits_uop_is_unique),
		.io_lsu_req_bits_0_bits_uop_flush_on_commit(_lsu_io_dmem_req_bits_0_bits_uop_flush_on_commit),
		.io_lsu_req_bits_0_bits_uop_csr_cmd(_lsu_io_dmem_req_bits_0_bits_uop_csr_cmd),
		.io_lsu_req_bits_0_bits_uop_ldst_is_rs1(_lsu_io_dmem_req_bits_0_bits_uop_ldst_is_rs1),
		.io_lsu_req_bits_0_bits_uop_ldst(_lsu_io_dmem_req_bits_0_bits_uop_ldst),
		.io_lsu_req_bits_0_bits_uop_lrs1(_lsu_io_dmem_req_bits_0_bits_uop_lrs1),
		.io_lsu_req_bits_0_bits_uop_lrs2(_lsu_io_dmem_req_bits_0_bits_uop_lrs2),
		.io_lsu_req_bits_0_bits_uop_lrs3(_lsu_io_dmem_req_bits_0_bits_uop_lrs3),
		.io_lsu_req_bits_0_bits_uop_dst_rtype(_lsu_io_dmem_req_bits_0_bits_uop_dst_rtype),
		.io_lsu_req_bits_0_bits_uop_lrs1_rtype(_lsu_io_dmem_req_bits_0_bits_uop_lrs1_rtype),
		.io_lsu_req_bits_0_bits_uop_lrs2_rtype(_lsu_io_dmem_req_bits_0_bits_uop_lrs2_rtype),
		.io_lsu_req_bits_0_bits_uop_frs3_en(_lsu_io_dmem_req_bits_0_bits_uop_frs3_en),
		.io_lsu_req_bits_0_bits_uop_fcn_dw(_lsu_io_dmem_req_bits_0_bits_uop_fcn_dw),
		.io_lsu_req_bits_0_bits_uop_fcn_op(_lsu_io_dmem_req_bits_0_bits_uop_fcn_op),
		.io_lsu_req_bits_0_bits_uop_fp_val(_lsu_io_dmem_req_bits_0_bits_uop_fp_val),
		.io_lsu_req_bits_0_bits_uop_fp_rm(_lsu_io_dmem_req_bits_0_bits_uop_fp_rm),
		.io_lsu_req_bits_0_bits_uop_fp_typ(_lsu_io_dmem_req_bits_0_bits_uop_fp_typ),
		.io_lsu_req_bits_0_bits_uop_xcpt_pf_if(_lsu_io_dmem_req_bits_0_bits_uop_xcpt_pf_if),
		.io_lsu_req_bits_0_bits_uop_xcpt_ae_if(_lsu_io_dmem_req_bits_0_bits_uop_xcpt_ae_if),
		.io_lsu_req_bits_0_bits_uop_xcpt_ma_if(_lsu_io_dmem_req_bits_0_bits_uop_xcpt_ma_if),
		.io_lsu_req_bits_0_bits_uop_bp_debug_if(_lsu_io_dmem_req_bits_0_bits_uop_bp_debug_if),
		.io_lsu_req_bits_0_bits_uop_bp_xcpt_if(_lsu_io_dmem_req_bits_0_bits_uop_bp_xcpt_if),
		.io_lsu_req_bits_0_bits_uop_debug_fsrc(_lsu_io_dmem_req_bits_0_bits_uop_debug_fsrc),
		.io_lsu_req_bits_0_bits_uop_debug_tsrc(_lsu_io_dmem_req_bits_0_bits_uop_debug_tsrc),
		.io_lsu_req_bits_0_bits_addr(_lsu_io_dmem_req_bits_0_bits_addr),
		.io_lsu_req_bits_0_bits_data(_lsu_io_dmem_req_bits_0_bits_data),
		.io_lsu_req_bits_0_bits_is_hella(_lsu_io_dmem_req_bits_0_bits_is_hella),
		.io_lsu_s1_kill_0(_lsu_io_dmem_s1_kill_0),
		.io_lsu_resp_0_valid(_dcache_io_lsu_resp_0_valid),
		.io_lsu_resp_0_bits_uop_is_amo(_dcache_io_lsu_resp_0_bits_uop_is_amo),
		.io_lsu_resp_0_bits_uop_ldq_idx(_dcache_io_lsu_resp_0_bits_uop_ldq_idx),
		.io_lsu_resp_0_bits_uop_stq_idx(_dcache_io_lsu_resp_0_bits_uop_stq_idx),
		.io_lsu_resp_0_bits_uop_uses_ldq(_dcache_io_lsu_resp_0_bits_uop_uses_ldq),
		.io_lsu_resp_0_bits_uop_uses_stq(_dcache_io_lsu_resp_0_bits_uop_uses_stq),
		.io_lsu_resp_0_bits_data(_dcache_io_lsu_resp_0_bits_data),
		.io_lsu_resp_0_bits_is_hella(_dcache_io_lsu_resp_0_bits_is_hella),
		.io_lsu_store_ack_0_valid(_dcache_io_lsu_store_ack_0_valid),
		.io_lsu_store_ack_0_bits_uop_stq_idx(_dcache_io_lsu_store_ack_0_bits_uop_stq_idx),
		.io_lsu_store_ack_0_bits_is_hella(_dcache_io_lsu_store_ack_0_bits_is_hella),
		.io_lsu_nack_0_valid(_dcache_io_lsu_nack_0_valid),
		.io_lsu_nack_0_bits_uop_ldq_idx(_dcache_io_lsu_nack_0_bits_uop_ldq_idx),
		.io_lsu_nack_0_bits_uop_stq_idx(_dcache_io_lsu_nack_0_bits_uop_stq_idx),
		.io_lsu_nack_0_bits_uop_mem_size(_dcache_io_lsu_nack_0_bits_uop_mem_size),
		.io_lsu_nack_0_bits_uop_uses_ldq(_dcache_io_lsu_nack_0_bits_uop_uses_ldq),
		.io_lsu_nack_0_bits_uop_uses_stq(_dcache_io_lsu_nack_0_bits_uop_uses_stq),
		.io_lsu_nack_0_bits_addr(_dcache_io_lsu_nack_0_bits_addr),
		.io_lsu_nack_0_bits_is_hella(_dcache_io_lsu_nack_0_bits_is_hella),
		.io_lsu_ll_resp_ready(_lsu_io_dmem_ll_resp_ready),
		.io_lsu_ll_resp_valid(_dcache_io_lsu_ll_resp_valid),
		.io_lsu_ll_resp_bits_uop_is_amo(_dcache_io_lsu_ll_resp_bits_uop_is_amo),
		.io_lsu_ll_resp_bits_uop_ldq_idx(_dcache_io_lsu_ll_resp_bits_uop_ldq_idx),
		.io_lsu_ll_resp_bits_uop_stq_idx(_dcache_io_lsu_ll_resp_bits_uop_stq_idx),
		.io_lsu_ll_resp_bits_uop_uses_ldq(_dcache_io_lsu_ll_resp_bits_uop_uses_ldq),
		.io_lsu_ll_resp_bits_uop_uses_stq(_dcache_io_lsu_ll_resp_bits_uop_uses_stq),
		.io_lsu_ll_resp_bits_data(_dcache_io_lsu_ll_resp_bits_data),
		.io_lsu_ll_resp_bits_is_hella(_dcache_io_lsu_ll_resp_bits_is_hella),
		.io_lsu_brupdate_b1_resolve_mask(_lsu_io_dmem_brupdate_b1_resolve_mask),
		.io_lsu_brupdate_b1_mispredict_mask(_lsu_io_dmem_brupdate_b1_mispredict_mask),
		.io_lsu_exception(_lsu_io_dmem_exception),
		.io_lsu_release_ready(_lsu_io_dmem_release_ready),
		.io_lsu_release_valid(_dcache_io_lsu_release_valid),
		.io_lsu_release_bits_address(_dcache_io_lsu_release_bits_address),
		.io_lsu_force_order(_lsu_io_dmem_force_order),
		.io_lsu_ordered(_dcache_io_lsu_ordered),
		.io_lsu_perf_acquire(_dcache_io_lsu_perf_acquire),
		.io_lsu_perf_release(_dcache_io_lsu_perf_release)
	);
	BoomFrontend frontend(
		.clock(clock),
		.reset(reset),
		.auto_icache_master_out_a_ready(_buffer_2_auto_in_a_ready),
		.auto_icache_master_out_a_valid(_frontend_auto_icache_master_out_a_valid),
		.auto_icache_master_out_a_bits_address(_frontend_auto_icache_master_out_a_bits_address),
		.auto_icache_master_out_d_valid(_buffer_2_auto_in_d_valid),
		.auto_icache_master_out_d_bits_opcode(_buffer_2_auto_in_d_bits_opcode),
		.auto_icache_master_out_d_bits_size(_buffer_2_auto_in_d_bits_size),
		.auto_icache_master_out_d_bits_data(_buffer_2_auto_in_d_bits_data),
		.io_cpu_fetchpacket_ready(_core_io_ifu_fetchpacket_ready),
		.io_cpu_fetchpacket_valid(_frontend_io_cpu_fetchpacket_valid),
		.io_cpu_fetchpacket_bits_uops_0_valid(_frontend_io_cpu_fetchpacket_bits_uops_0_valid),
		.io_cpu_fetchpacket_bits_uops_0_bits_inst(_frontend_io_cpu_fetchpacket_bits_uops_0_bits_inst),
		.io_cpu_fetchpacket_bits_uops_0_bits_debug_inst(_frontend_io_cpu_fetchpacket_bits_uops_0_bits_debug_inst),
		.io_cpu_fetchpacket_bits_uops_0_bits_is_rvc(_frontend_io_cpu_fetchpacket_bits_uops_0_bits_is_rvc),
		.io_cpu_fetchpacket_bits_uops_0_bits_debug_pc(_frontend_io_cpu_fetchpacket_bits_uops_0_bits_debug_pc),
		.io_cpu_fetchpacket_bits_uops_0_bits_is_sfb(_frontend_io_cpu_fetchpacket_bits_uops_0_bits_is_sfb),
		.io_cpu_fetchpacket_bits_uops_0_bits_ftq_idx(_frontend_io_cpu_fetchpacket_bits_uops_0_bits_ftq_idx),
		.io_cpu_fetchpacket_bits_uops_0_bits_edge_inst(_frontend_io_cpu_fetchpacket_bits_uops_0_bits_edge_inst),
		.io_cpu_fetchpacket_bits_uops_0_bits_pc_lob(_frontend_io_cpu_fetchpacket_bits_uops_0_bits_pc_lob),
		.io_cpu_fetchpacket_bits_uops_0_bits_taken(_frontend_io_cpu_fetchpacket_bits_uops_0_bits_taken),
		.io_cpu_fetchpacket_bits_uops_0_bits_xcpt_pf_if(_frontend_io_cpu_fetchpacket_bits_uops_0_bits_xcpt_pf_if),
		.io_cpu_fetchpacket_bits_uops_0_bits_xcpt_ae_if(_frontend_io_cpu_fetchpacket_bits_uops_0_bits_xcpt_ae_if),
		.io_cpu_fetchpacket_bits_uops_0_bits_bp_debug_if(_frontend_io_cpu_fetchpacket_bits_uops_0_bits_bp_debug_if),
		.io_cpu_fetchpacket_bits_uops_0_bits_bp_xcpt_if(_frontend_io_cpu_fetchpacket_bits_uops_0_bits_bp_xcpt_if),
		.io_cpu_fetchpacket_bits_uops_0_bits_debug_fsrc(_frontend_io_cpu_fetchpacket_bits_uops_0_bits_debug_fsrc),
		.io_cpu_arb_ftq_reqs_0(_core_io_ifu_arb_ftq_reqs_0),
		.io_cpu_arb_ftq_reqs_1(_core_io_ifu_arb_ftq_reqs_1),
		.io_cpu_arb_ftq_reqs_2(_core_io_ifu_arb_ftq_reqs_2),
		.io_cpu_rrd_ftq_resps_0_entry_cfi_idx_bits(_frontend_io_cpu_rrd_ftq_resps_0_entry_cfi_idx_bits),
		.io_cpu_rrd_ftq_resps_0_entry_br_mask(_frontend_io_cpu_rrd_ftq_resps_0_entry_br_mask),
		.io_cpu_rrd_ftq_resps_0_entry_cfi_is_call(_frontend_io_cpu_rrd_ftq_resps_0_entry_cfi_is_call),
		.io_cpu_rrd_ftq_resps_0_entry_cfi_is_ret(_frontend_io_cpu_rrd_ftq_resps_0_entry_cfi_is_ret),
		.io_cpu_rrd_ftq_resps_0_entry_ras_idx(_frontend_io_cpu_rrd_ftq_resps_0_entry_ras_idx),
		.io_cpu_rrd_ftq_resps_0_entry_start_bank(_frontend_io_cpu_rrd_ftq_resps_0_entry_start_bank),
		.io_cpu_rrd_ftq_resps_0_ghist_old_history(_frontend_io_cpu_rrd_ftq_resps_0_ghist_old_history),
		.io_cpu_rrd_ftq_resps_0_ghist_current_saw_branch_not_taken(_frontend_io_cpu_rrd_ftq_resps_0_ghist_current_saw_branch_not_taken),
		.io_cpu_rrd_ftq_resps_0_ghist_new_saw_branch_not_taken(_frontend_io_cpu_rrd_ftq_resps_0_ghist_new_saw_branch_not_taken),
		.io_cpu_rrd_ftq_resps_0_ghist_new_saw_branch_taken(_frontend_io_cpu_rrd_ftq_resps_0_ghist_new_saw_branch_taken),
		.io_cpu_rrd_ftq_resps_0_ghist_ras_idx(_frontend_io_cpu_rrd_ftq_resps_0_ghist_ras_idx),
		.io_cpu_rrd_ftq_resps_0_pc(_frontend_io_cpu_rrd_ftq_resps_0_pc),
		.io_cpu_rrd_ftq_resps_1_valid(_frontend_io_cpu_rrd_ftq_resps_1_valid),
		.io_cpu_rrd_ftq_resps_1_entry_cfi_idx_valid(_frontend_io_cpu_rrd_ftq_resps_1_entry_cfi_idx_valid),
		.io_cpu_rrd_ftq_resps_1_entry_cfi_idx_bits(_frontend_io_cpu_rrd_ftq_resps_1_entry_cfi_idx_bits),
		.io_cpu_rrd_ftq_resps_1_entry_start_bank(_frontend_io_cpu_rrd_ftq_resps_1_entry_start_bank),
		.io_cpu_rrd_ftq_resps_1_pc(_frontend_io_cpu_rrd_ftq_resps_1_pc),
		.io_cpu_rrd_ftq_resps_2_valid(_frontend_io_cpu_rrd_ftq_resps_2_valid),
		.io_cpu_rrd_ftq_resps_2_entry_cfi_idx_valid(_frontend_io_cpu_rrd_ftq_resps_2_entry_cfi_idx_valid),
		.io_cpu_rrd_ftq_resps_2_entry_cfi_idx_bits(_frontend_io_cpu_rrd_ftq_resps_2_entry_cfi_idx_bits),
		.io_cpu_rrd_ftq_resps_2_entry_start_bank(_frontend_io_cpu_rrd_ftq_resps_2_entry_start_bank),
		.io_cpu_rrd_ftq_resps_2_pc(_frontend_io_cpu_rrd_ftq_resps_2_pc),
		.io_cpu_com_pc(_frontend_io_cpu_com_pc),
		.io_cpu_sfence_valid(_core_io_ifu_sfence_valid),
		.io_cpu_sfence_bits_rs1(_core_io_ifu_sfence_bits_rs1),
		.io_cpu_sfence_bits_rs2(_core_io_ifu_sfence_bits_rs2),
		.io_cpu_sfence_bits_addr(_core_io_ifu_sfence_bits_addr),
		.io_cpu_brupdate_b2_uop_ftq_idx(_core_io_ifu_brupdate_b2_uop_ftq_idx),
		.io_cpu_brupdate_b2_uop_pc_lob(_core_io_ifu_brupdate_b2_uop_pc_lob),
		.io_cpu_brupdate_b2_mispredict(_core_io_ifu_brupdate_b2_mispredict),
		.io_cpu_brupdate_b2_taken(_core_io_ifu_brupdate_b2_taken),
		.io_cpu_redirect_flush(_core_io_ifu_redirect_flush),
		.io_cpu_redirect_val(_core_io_ifu_redirect_val),
		.io_cpu_redirect_pc(_core_io_ifu_redirect_pc),
		.io_cpu_redirect_ftq_idx(_core_io_ifu_redirect_ftq_idx),
		.io_cpu_redirect_ghist_old_history(_core_io_ifu_redirect_ghist_old_history),
		.io_cpu_redirect_ghist_current_saw_branch_not_taken(_core_io_ifu_redirect_ghist_current_saw_branch_not_taken),
		.io_cpu_redirect_ghist_new_saw_branch_not_taken(_core_io_ifu_redirect_ghist_new_saw_branch_not_taken),
		.io_cpu_redirect_ghist_new_saw_branch_taken(_core_io_ifu_redirect_ghist_new_saw_branch_taken),
		.io_cpu_redirect_ghist_ras_idx(_core_io_ifu_redirect_ghist_ras_idx),
		.io_cpu_commit_valid(_core_io_ifu_commit_valid),
		.io_cpu_commit_bits(_core_io_ifu_commit_bits),
		.io_cpu_flush_icache(_core_io_ifu_flush_icache),
		.io_cpu_enable_bpd(_core_io_ifu_enable_bpd),
		.io_cpu_perf_acquire(_frontend_io_cpu_perf_acquire),
		.io_cpu_perf_tlbMiss(_frontend_io_cpu_perf_tlbMiss),
		.io_ptw_req_ready(_ptw_io_requestor_1_req_ready),
		.io_ptw_req_valid(_frontend_io_ptw_req_valid),
		.io_ptw_req_bits_bits_addr(_frontend_io_ptw_req_bits_bits_addr),
		.io_ptw_req_bits_bits_need_gpa(_frontend_io_ptw_req_bits_bits_need_gpa),
		.io_ptw_resp_valid(_ptw_io_requestor_1_resp_valid),
		.io_ptw_resp_bits_ae_ptw(_ptw_io_requestor_1_resp_bits_ae_ptw),
		.io_ptw_resp_bits_ae_final(_ptw_io_requestor_1_resp_bits_ae_final),
		.io_ptw_resp_bits_pf(_ptw_io_requestor_1_resp_bits_pf),
		.io_ptw_resp_bits_gf(_ptw_io_requestor_1_resp_bits_gf),
		.io_ptw_resp_bits_hr(_ptw_io_requestor_1_resp_bits_hr),
		.io_ptw_resp_bits_hw(_ptw_io_requestor_1_resp_bits_hw),
		.io_ptw_resp_bits_hx(_ptw_io_requestor_1_resp_bits_hx),
		.io_ptw_resp_bits_pte_ppn(_ptw_io_requestor_1_resp_bits_pte_ppn),
		.io_ptw_resp_bits_pte_d(_ptw_io_requestor_1_resp_bits_pte_d),
		.io_ptw_resp_bits_pte_a(_ptw_io_requestor_1_resp_bits_pte_a),
		.io_ptw_resp_bits_pte_g(_ptw_io_requestor_1_resp_bits_pte_g),
		.io_ptw_resp_bits_pte_u(_ptw_io_requestor_1_resp_bits_pte_u),
		.io_ptw_resp_bits_pte_x(_ptw_io_requestor_1_resp_bits_pte_x),
		.io_ptw_resp_bits_pte_w(_ptw_io_requestor_1_resp_bits_pte_w),
		.io_ptw_resp_bits_pte_r(_ptw_io_requestor_1_resp_bits_pte_r),
		.io_ptw_resp_bits_pte_v(_ptw_io_requestor_1_resp_bits_pte_v),
		.io_ptw_resp_bits_level(_ptw_io_requestor_1_resp_bits_level),
		.io_ptw_resp_bits_homogeneous(_ptw_io_requestor_1_resp_bits_homogeneous),
		.io_ptw_ptbr_mode(_ptw_io_requestor_1_ptbr_mode),
		.io_ptw_status_debug(_ptw_io_requestor_1_status_debug),
		.io_ptw_status_prv(_ptw_io_requestor_1_status_prv),
		.io_ptw_pmp_0_cfg_l(_ptw_io_requestor_1_pmp_0_cfg_l),
		.io_ptw_pmp_0_cfg_a(_ptw_io_requestor_1_pmp_0_cfg_a),
		.io_ptw_pmp_0_cfg_x(_ptw_io_requestor_1_pmp_0_cfg_x),
		.io_ptw_pmp_0_cfg_w(_ptw_io_requestor_1_pmp_0_cfg_w),
		.io_ptw_pmp_0_cfg_r(_ptw_io_requestor_1_pmp_0_cfg_r),
		.io_ptw_pmp_0_addr(_ptw_io_requestor_1_pmp_0_addr),
		.io_ptw_pmp_0_mask(_ptw_io_requestor_1_pmp_0_mask),
		.io_ptw_pmp_1_cfg_l(_ptw_io_requestor_1_pmp_1_cfg_l),
		.io_ptw_pmp_1_cfg_a(_ptw_io_requestor_1_pmp_1_cfg_a),
		.io_ptw_pmp_1_cfg_x(_ptw_io_requestor_1_pmp_1_cfg_x),
		.io_ptw_pmp_1_cfg_w(_ptw_io_requestor_1_pmp_1_cfg_w),
		.io_ptw_pmp_1_cfg_r(_ptw_io_requestor_1_pmp_1_cfg_r),
		.io_ptw_pmp_1_addr(_ptw_io_requestor_1_pmp_1_addr),
		.io_ptw_pmp_1_mask(_ptw_io_requestor_1_pmp_1_mask),
		.io_ptw_pmp_2_cfg_l(_ptw_io_requestor_1_pmp_2_cfg_l),
		.io_ptw_pmp_2_cfg_a(_ptw_io_requestor_1_pmp_2_cfg_a),
		.io_ptw_pmp_2_cfg_x(_ptw_io_requestor_1_pmp_2_cfg_x),
		.io_ptw_pmp_2_cfg_w(_ptw_io_requestor_1_pmp_2_cfg_w),
		.io_ptw_pmp_2_cfg_r(_ptw_io_requestor_1_pmp_2_cfg_r),
		.io_ptw_pmp_2_addr(_ptw_io_requestor_1_pmp_2_addr),
		.io_ptw_pmp_2_mask(_ptw_io_requestor_1_pmp_2_mask),
		.io_ptw_pmp_3_cfg_l(_ptw_io_requestor_1_pmp_3_cfg_l),
		.io_ptw_pmp_3_cfg_a(_ptw_io_requestor_1_pmp_3_cfg_a),
		.io_ptw_pmp_3_cfg_x(_ptw_io_requestor_1_pmp_3_cfg_x),
		.io_ptw_pmp_3_cfg_w(_ptw_io_requestor_1_pmp_3_cfg_w),
		.io_ptw_pmp_3_cfg_r(_ptw_io_requestor_1_pmp_3_cfg_r),
		.io_ptw_pmp_3_addr(_ptw_io_requestor_1_pmp_3_addr),
		.io_ptw_pmp_3_mask(_ptw_io_requestor_1_pmp_3_mask),
		.io_ptw_pmp_4_cfg_l(_ptw_io_requestor_1_pmp_4_cfg_l),
		.io_ptw_pmp_4_cfg_a(_ptw_io_requestor_1_pmp_4_cfg_a),
		.io_ptw_pmp_4_cfg_x(_ptw_io_requestor_1_pmp_4_cfg_x),
		.io_ptw_pmp_4_cfg_w(_ptw_io_requestor_1_pmp_4_cfg_w),
		.io_ptw_pmp_4_cfg_r(_ptw_io_requestor_1_pmp_4_cfg_r),
		.io_ptw_pmp_4_addr(_ptw_io_requestor_1_pmp_4_addr),
		.io_ptw_pmp_4_mask(_ptw_io_requestor_1_pmp_4_mask),
		.io_ptw_pmp_5_cfg_l(_ptw_io_requestor_1_pmp_5_cfg_l),
		.io_ptw_pmp_5_cfg_a(_ptw_io_requestor_1_pmp_5_cfg_a),
		.io_ptw_pmp_5_cfg_x(_ptw_io_requestor_1_pmp_5_cfg_x),
		.io_ptw_pmp_5_cfg_w(_ptw_io_requestor_1_pmp_5_cfg_w),
		.io_ptw_pmp_5_cfg_r(_ptw_io_requestor_1_pmp_5_cfg_r),
		.io_ptw_pmp_5_addr(_ptw_io_requestor_1_pmp_5_addr),
		.io_ptw_pmp_5_mask(_ptw_io_requestor_1_pmp_5_mask),
		.io_ptw_pmp_6_cfg_l(_ptw_io_requestor_1_pmp_6_cfg_l),
		.io_ptw_pmp_6_cfg_a(_ptw_io_requestor_1_pmp_6_cfg_a),
		.io_ptw_pmp_6_cfg_x(_ptw_io_requestor_1_pmp_6_cfg_x),
		.io_ptw_pmp_6_cfg_w(_ptw_io_requestor_1_pmp_6_cfg_w),
		.io_ptw_pmp_6_cfg_r(_ptw_io_requestor_1_pmp_6_cfg_r),
		.io_ptw_pmp_6_addr(_ptw_io_requestor_1_pmp_6_addr),
		.io_ptw_pmp_6_mask(_ptw_io_requestor_1_pmp_6_mask),
		.io_ptw_pmp_7_cfg_l(_ptw_io_requestor_1_pmp_7_cfg_l),
		.io_ptw_pmp_7_cfg_a(_ptw_io_requestor_1_pmp_7_cfg_a),
		.io_ptw_pmp_7_cfg_x(_ptw_io_requestor_1_pmp_7_cfg_x),
		.io_ptw_pmp_7_cfg_w(_ptw_io_requestor_1_pmp_7_cfg_w),
		.io_ptw_pmp_7_cfg_r(_ptw_io_requestor_1_pmp_7_cfg_r),
		.io_ptw_pmp_7_addr(_ptw_io_requestor_1_pmp_7_addr),
		.io_ptw_pmp_7_mask(_ptw_io_requestor_1_pmp_7_mask)
	);
	TLBuffer_a32d64s1k2z4u buffer_2(
		.clock(clock),
		.reset(reset),
		.auto_in_a_ready(_buffer_2_auto_in_a_ready),
		.auto_in_a_valid(_frontend_auto_icache_master_out_a_valid),
		.auto_in_a_bits_address(_frontend_auto_icache_master_out_a_bits_address),
		.auto_in_d_valid(_buffer_2_auto_in_d_valid),
		.auto_in_d_bits_opcode(_buffer_2_auto_in_d_bits_opcode),
		.auto_in_d_bits_size(_buffer_2_auto_in_d_bits_size),
		.auto_in_d_bits_data(_buffer_2_auto_in_d_bits_data),
		.auto_out_a_ready(_tlMasterXbar_auto_anon_in_1_a_ready),
		.auto_out_a_valid(_buffer_2_auto_out_a_valid),
		.auto_out_a_bits_opcode(_buffer_2_auto_out_a_bits_opcode),
		.auto_out_a_bits_param(_buffer_2_auto_out_a_bits_param),
		.auto_out_a_bits_size(_buffer_2_auto_out_a_bits_size),
		.auto_out_a_bits_source(_buffer_2_auto_out_a_bits_source),
		.auto_out_a_bits_address(_buffer_2_auto_out_a_bits_address),
		.auto_out_a_bits_mask(_buffer_2_auto_out_a_bits_mask),
		.auto_out_a_bits_data(_buffer_2_auto_out_a_bits_data),
		.auto_out_a_bits_corrupt(_buffer_2_auto_out_a_bits_corrupt),
		.auto_out_d_ready(_buffer_2_auto_out_d_ready),
		.auto_out_d_valid(_tlMasterXbar_auto_anon_in_1_d_valid),
		.auto_out_d_bits_opcode(_tlMasterXbar_auto_anon_in_1_d_bits_opcode),
		.auto_out_d_bits_param(_tlMasterXbar_auto_anon_in_1_d_bits_param),
		.auto_out_d_bits_size(_tlMasterXbar_auto_anon_in_1_d_bits_size),
		.auto_out_d_bits_sink(_tlMasterXbar_auto_anon_in_1_d_bits_sink),
		.auto_out_d_bits_denied(_tlMasterXbar_auto_anon_in_1_d_bits_denied),
		.auto_out_d_bits_data(_tlMasterXbar_auto_anon_in_1_d_bits_data),
		.auto_out_d_bits_corrupt(_tlMasterXbar_auto_anon_in_1_d_bits_corrupt)
	);
	BoomCore core(
		.clock(clock),
		.reset(reset),
		.io_hartid(auto_hartid_in),
		.io_interrupts_debug(_intXbar_auto_anon_out_0),
		.io_interrupts_mtip(_intXbar_auto_anon_out_2),
		.io_interrupts_msip(_intXbar_auto_anon_out_1),
		.io_interrupts_meip(_intXbar_auto_anon_out_3),
		.io_interrupts_seip(_intXbar_auto_anon_out_4),
		.io_ifu_fetchpacket_ready(_core_io_ifu_fetchpacket_ready),
		.io_ifu_fetchpacket_valid(_frontend_io_cpu_fetchpacket_valid),
		.io_ifu_fetchpacket_bits_uops_0_valid(_frontend_io_cpu_fetchpacket_bits_uops_0_valid),
		.io_ifu_fetchpacket_bits_uops_0_bits_inst(_frontend_io_cpu_fetchpacket_bits_uops_0_bits_inst),
		.io_ifu_fetchpacket_bits_uops_0_bits_debug_inst(_frontend_io_cpu_fetchpacket_bits_uops_0_bits_debug_inst),
		.io_ifu_fetchpacket_bits_uops_0_bits_is_rvc(_frontend_io_cpu_fetchpacket_bits_uops_0_bits_is_rvc),
		.io_ifu_fetchpacket_bits_uops_0_bits_debug_pc(_frontend_io_cpu_fetchpacket_bits_uops_0_bits_debug_pc),
		.io_ifu_fetchpacket_bits_uops_0_bits_is_sfb(_frontend_io_cpu_fetchpacket_bits_uops_0_bits_is_sfb),
		.io_ifu_fetchpacket_bits_uops_0_bits_ftq_idx(_frontend_io_cpu_fetchpacket_bits_uops_0_bits_ftq_idx),
		.io_ifu_fetchpacket_bits_uops_0_bits_edge_inst(_frontend_io_cpu_fetchpacket_bits_uops_0_bits_edge_inst),
		.io_ifu_fetchpacket_bits_uops_0_bits_pc_lob(_frontend_io_cpu_fetchpacket_bits_uops_0_bits_pc_lob),
		.io_ifu_fetchpacket_bits_uops_0_bits_taken(_frontend_io_cpu_fetchpacket_bits_uops_0_bits_taken),
		.io_ifu_fetchpacket_bits_uops_0_bits_xcpt_pf_if(_frontend_io_cpu_fetchpacket_bits_uops_0_bits_xcpt_pf_if),
		.io_ifu_fetchpacket_bits_uops_0_bits_xcpt_ae_if(_frontend_io_cpu_fetchpacket_bits_uops_0_bits_xcpt_ae_if),
		.io_ifu_fetchpacket_bits_uops_0_bits_bp_debug_if(_frontend_io_cpu_fetchpacket_bits_uops_0_bits_bp_debug_if),
		.io_ifu_fetchpacket_bits_uops_0_bits_bp_xcpt_if(_frontend_io_cpu_fetchpacket_bits_uops_0_bits_bp_xcpt_if),
		.io_ifu_fetchpacket_bits_uops_0_bits_debug_fsrc(_frontend_io_cpu_fetchpacket_bits_uops_0_bits_debug_fsrc),
		.io_ifu_arb_ftq_reqs_0(_core_io_ifu_arb_ftq_reqs_0),
		.io_ifu_arb_ftq_reqs_1(_core_io_ifu_arb_ftq_reqs_1),
		.io_ifu_arb_ftq_reqs_2(_core_io_ifu_arb_ftq_reqs_2),
		.io_ifu_rrd_ftq_resps_0_entry_cfi_idx_bits(_frontend_io_cpu_rrd_ftq_resps_0_entry_cfi_idx_bits),
		.io_ifu_rrd_ftq_resps_0_entry_br_mask(_frontend_io_cpu_rrd_ftq_resps_0_entry_br_mask),
		.io_ifu_rrd_ftq_resps_0_entry_cfi_is_call(_frontend_io_cpu_rrd_ftq_resps_0_entry_cfi_is_call),
		.io_ifu_rrd_ftq_resps_0_entry_cfi_is_ret(_frontend_io_cpu_rrd_ftq_resps_0_entry_cfi_is_ret),
		.io_ifu_rrd_ftq_resps_0_entry_ras_idx(_frontend_io_cpu_rrd_ftq_resps_0_entry_ras_idx),
		.io_ifu_rrd_ftq_resps_0_entry_start_bank(_frontend_io_cpu_rrd_ftq_resps_0_entry_start_bank),
		.io_ifu_rrd_ftq_resps_0_ghist_old_history(_frontend_io_cpu_rrd_ftq_resps_0_ghist_old_history),
		.io_ifu_rrd_ftq_resps_0_ghist_current_saw_branch_not_taken(_frontend_io_cpu_rrd_ftq_resps_0_ghist_current_saw_branch_not_taken),
		.io_ifu_rrd_ftq_resps_0_ghist_new_saw_branch_not_taken(_frontend_io_cpu_rrd_ftq_resps_0_ghist_new_saw_branch_not_taken),
		.io_ifu_rrd_ftq_resps_0_ghist_new_saw_branch_taken(_frontend_io_cpu_rrd_ftq_resps_0_ghist_new_saw_branch_taken),
		.io_ifu_rrd_ftq_resps_0_ghist_ras_idx(_frontend_io_cpu_rrd_ftq_resps_0_ghist_ras_idx),
		.io_ifu_rrd_ftq_resps_0_pc(_frontend_io_cpu_rrd_ftq_resps_0_pc),
		.io_ifu_rrd_ftq_resps_1_valid(_frontend_io_cpu_rrd_ftq_resps_1_valid),
		.io_ifu_rrd_ftq_resps_1_entry_cfi_idx_valid(_frontend_io_cpu_rrd_ftq_resps_1_entry_cfi_idx_valid),
		.io_ifu_rrd_ftq_resps_1_entry_cfi_idx_bits(_frontend_io_cpu_rrd_ftq_resps_1_entry_cfi_idx_bits),
		.io_ifu_rrd_ftq_resps_1_entry_start_bank(_frontend_io_cpu_rrd_ftq_resps_1_entry_start_bank),
		.io_ifu_rrd_ftq_resps_1_pc(_frontend_io_cpu_rrd_ftq_resps_1_pc),
		.io_ifu_rrd_ftq_resps_2_valid(_frontend_io_cpu_rrd_ftq_resps_2_valid),
		.io_ifu_rrd_ftq_resps_2_entry_cfi_idx_valid(_frontend_io_cpu_rrd_ftq_resps_2_entry_cfi_idx_valid),
		.io_ifu_rrd_ftq_resps_2_entry_cfi_idx_bits(_frontend_io_cpu_rrd_ftq_resps_2_entry_cfi_idx_bits),
		.io_ifu_rrd_ftq_resps_2_entry_start_bank(_frontend_io_cpu_rrd_ftq_resps_2_entry_start_bank),
		.io_ifu_rrd_ftq_resps_2_pc(_frontend_io_cpu_rrd_ftq_resps_2_pc),
		.io_ifu_com_pc(_frontend_io_cpu_com_pc),
		.io_ifu_sfence_valid(_core_io_ifu_sfence_valid),
		.io_ifu_sfence_bits_rs1(_core_io_ifu_sfence_bits_rs1),
		.io_ifu_sfence_bits_rs2(_core_io_ifu_sfence_bits_rs2),
		.io_ifu_sfence_bits_addr(_core_io_ifu_sfence_bits_addr),
		.io_ifu_brupdate_b2_uop_ftq_idx(_core_io_ifu_brupdate_b2_uop_ftq_idx),
		.io_ifu_brupdate_b2_uop_pc_lob(_core_io_ifu_brupdate_b2_uop_pc_lob),
		.io_ifu_brupdate_b2_mispredict(_core_io_ifu_brupdate_b2_mispredict),
		.io_ifu_brupdate_b2_taken(_core_io_ifu_brupdate_b2_taken),
		.io_ifu_redirect_flush(_core_io_ifu_redirect_flush),
		.io_ifu_redirect_val(_core_io_ifu_redirect_val),
		.io_ifu_redirect_pc(_core_io_ifu_redirect_pc),
		.io_ifu_redirect_ftq_idx(_core_io_ifu_redirect_ftq_idx),
		.io_ifu_redirect_ghist_old_history(_core_io_ifu_redirect_ghist_old_history),
		.io_ifu_redirect_ghist_current_saw_branch_not_taken(_core_io_ifu_redirect_ghist_current_saw_branch_not_taken),
		.io_ifu_redirect_ghist_new_saw_branch_not_taken(_core_io_ifu_redirect_ghist_new_saw_branch_not_taken),
		.io_ifu_redirect_ghist_new_saw_branch_taken(_core_io_ifu_redirect_ghist_new_saw_branch_taken),
		.io_ifu_redirect_ghist_ras_idx(_core_io_ifu_redirect_ghist_ras_idx),
		.io_ifu_commit_valid(_core_io_ifu_commit_valid),
		.io_ifu_commit_bits(_core_io_ifu_commit_bits),
		.io_ifu_flush_icache(_core_io_ifu_flush_icache),
		.io_ifu_enable_bpd(_core_io_ifu_enable_bpd),
		.io_ifu_perf_acquire(_frontend_io_cpu_perf_acquire),
		.io_ifu_perf_tlbMiss(_frontend_io_cpu_perf_tlbMiss),
		.io_ptw_ptbr_mode(_core_io_ptw_ptbr_mode),
		.io_ptw_ptbr_ppn(_core_io_ptw_ptbr_ppn),
		.io_ptw_sfence_valid(_core_io_ptw_sfence_valid),
		.io_ptw_sfence_bits_rs1(_core_io_ptw_sfence_bits_rs1),
		.io_ptw_sfence_bits_rs2(_core_io_ptw_sfence_bits_rs2),
		.io_ptw_sfence_bits_addr(_core_io_ptw_sfence_bits_addr),
		.io_ptw_status_debug(_core_io_ptw_status_debug),
		.io_ptw_status_dprv(_core_io_ptw_status_dprv),
		.io_ptw_status_prv(_core_io_ptw_status_prv),
		.io_ptw_status_mxr(_core_io_ptw_status_mxr),
		.io_ptw_status_sum(_core_io_ptw_status_sum),
		.io_ptw_pmp_0_cfg_l(_core_io_ptw_pmp_0_cfg_l),
		.io_ptw_pmp_0_cfg_a(_core_io_ptw_pmp_0_cfg_a),
		.io_ptw_pmp_0_cfg_x(_core_io_ptw_pmp_0_cfg_x),
		.io_ptw_pmp_0_cfg_w(_core_io_ptw_pmp_0_cfg_w),
		.io_ptw_pmp_0_cfg_r(_core_io_ptw_pmp_0_cfg_r),
		.io_ptw_pmp_0_addr(_core_io_ptw_pmp_0_addr),
		.io_ptw_pmp_0_mask(_core_io_ptw_pmp_0_mask),
		.io_ptw_pmp_1_cfg_l(_core_io_ptw_pmp_1_cfg_l),
		.io_ptw_pmp_1_cfg_a(_core_io_ptw_pmp_1_cfg_a),
		.io_ptw_pmp_1_cfg_x(_core_io_ptw_pmp_1_cfg_x),
		.io_ptw_pmp_1_cfg_w(_core_io_ptw_pmp_1_cfg_w),
		.io_ptw_pmp_1_cfg_r(_core_io_ptw_pmp_1_cfg_r),
		.io_ptw_pmp_1_addr(_core_io_ptw_pmp_1_addr),
		.io_ptw_pmp_1_mask(_core_io_ptw_pmp_1_mask),
		.io_ptw_pmp_2_cfg_l(_core_io_ptw_pmp_2_cfg_l),
		.io_ptw_pmp_2_cfg_a(_core_io_ptw_pmp_2_cfg_a),
		.io_ptw_pmp_2_cfg_x(_core_io_ptw_pmp_2_cfg_x),
		.io_ptw_pmp_2_cfg_w(_core_io_ptw_pmp_2_cfg_w),
		.io_ptw_pmp_2_cfg_r(_core_io_ptw_pmp_2_cfg_r),
		.io_ptw_pmp_2_addr(_core_io_ptw_pmp_2_addr),
		.io_ptw_pmp_2_mask(_core_io_ptw_pmp_2_mask),
		.io_ptw_pmp_3_cfg_l(_core_io_ptw_pmp_3_cfg_l),
		.io_ptw_pmp_3_cfg_a(_core_io_ptw_pmp_3_cfg_a),
		.io_ptw_pmp_3_cfg_x(_core_io_ptw_pmp_3_cfg_x),
		.io_ptw_pmp_3_cfg_w(_core_io_ptw_pmp_3_cfg_w),
		.io_ptw_pmp_3_cfg_r(_core_io_ptw_pmp_3_cfg_r),
		.io_ptw_pmp_3_addr(_core_io_ptw_pmp_3_addr),
		.io_ptw_pmp_3_mask(_core_io_ptw_pmp_3_mask),
		.io_ptw_pmp_4_cfg_l(_core_io_ptw_pmp_4_cfg_l),
		.io_ptw_pmp_4_cfg_a(_core_io_ptw_pmp_4_cfg_a),
		.io_ptw_pmp_4_cfg_x(_core_io_ptw_pmp_4_cfg_x),
		.io_ptw_pmp_4_cfg_w(_core_io_ptw_pmp_4_cfg_w),
		.io_ptw_pmp_4_cfg_r(_core_io_ptw_pmp_4_cfg_r),
		.io_ptw_pmp_4_addr(_core_io_ptw_pmp_4_addr),
		.io_ptw_pmp_4_mask(_core_io_ptw_pmp_4_mask),
		.io_ptw_pmp_5_cfg_l(_core_io_ptw_pmp_5_cfg_l),
		.io_ptw_pmp_5_cfg_a(_core_io_ptw_pmp_5_cfg_a),
		.io_ptw_pmp_5_cfg_x(_core_io_ptw_pmp_5_cfg_x),
		.io_ptw_pmp_5_cfg_w(_core_io_ptw_pmp_5_cfg_w),
		.io_ptw_pmp_5_cfg_r(_core_io_ptw_pmp_5_cfg_r),
		.io_ptw_pmp_5_addr(_core_io_ptw_pmp_5_addr),
		.io_ptw_pmp_5_mask(_core_io_ptw_pmp_5_mask),
		.io_ptw_pmp_6_cfg_l(_core_io_ptw_pmp_6_cfg_l),
		.io_ptw_pmp_6_cfg_a(_core_io_ptw_pmp_6_cfg_a),
		.io_ptw_pmp_6_cfg_x(_core_io_ptw_pmp_6_cfg_x),
		.io_ptw_pmp_6_cfg_w(_core_io_ptw_pmp_6_cfg_w),
		.io_ptw_pmp_6_cfg_r(_core_io_ptw_pmp_6_cfg_r),
		.io_ptw_pmp_6_addr(_core_io_ptw_pmp_6_addr),
		.io_ptw_pmp_6_mask(_core_io_ptw_pmp_6_mask),
		.io_ptw_pmp_7_cfg_l(_core_io_ptw_pmp_7_cfg_l),
		.io_ptw_pmp_7_cfg_a(_core_io_ptw_pmp_7_cfg_a),
		.io_ptw_pmp_7_cfg_x(_core_io_ptw_pmp_7_cfg_x),
		.io_ptw_pmp_7_cfg_w(_core_io_ptw_pmp_7_cfg_w),
		.io_ptw_pmp_7_cfg_r(_core_io_ptw_pmp_7_cfg_r),
		.io_ptw_pmp_7_addr(_core_io_ptw_pmp_7_addr),
		.io_ptw_pmp_7_mask(_core_io_ptw_pmp_7_mask),
		.io_ptw_perf_l2miss(_ptw_io_dpath_perf_l2miss),
		.io_lsu_agen_0_valid(_core_io_lsu_agen_0_valid),
		.io_lsu_agen_0_bits_uop_br_mask(_core_io_lsu_agen_0_bits_uop_br_mask),
		.io_lsu_agen_0_bits_uop_ldq_idx(_core_io_lsu_agen_0_bits_uop_ldq_idx),
		.io_lsu_agen_0_bits_uop_stq_idx(_core_io_lsu_agen_0_bits_uop_stq_idx),
		.io_lsu_agen_0_bits_uop_pdst(_core_io_lsu_agen_0_bits_uop_pdst),
		.io_lsu_agen_0_bits_uop_uses_ldq(_core_io_lsu_agen_0_bits_uop_uses_ldq),
		.io_lsu_agen_0_bits_uop_uses_stq(_core_io_lsu_agen_0_bits_uop_uses_stq),
		.io_lsu_agen_0_bits_uop_dst_rtype(_core_io_lsu_agen_0_bits_uop_dst_rtype),
		.io_lsu_agen_0_bits_uop_fp_val(_core_io_lsu_agen_0_bits_uop_fp_val),
		.io_lsu_agen_0_bits_data(_core_io_lsu_agen_0_bits_data),
		.io_lsu_dgen_0_valid(_core_io_lsu_dgen_0_valid),
		.io_lsu_dgen_0_bits_uop_stq_idx(_core_io_lsu_dgen_0_bits_uop_stq_idx),
		.io_lsu_dgen_0_bits_data(_core_io_lsu_dgen_0_bits_data),
		.io_lsu_dgen_1_valid(_core_io_lsu_dgen_1_valid),
		.io_lsu_dgen_1_bits_uop_stq_idx(_core_io_lsu_dgen_1_bits_uop_stq_idx),
		.io_lsu_dgen_1_bits_data(_core_io_lsu_dgen_1_bits_data),
		.io_lsu_dgen_2_valid(_core_io_lsu_dgen_2_valid),
		.io_lsu_dgen_2_bits_uop_stq_idx(_core_io_lsu_dgen_2_bits_uop_stq_idx),
		.io_lsu_dgen_2_bits_data(_core_io_lsu_dgen_2_bits_data),
		.io_lsu_iwakeups_0_valid(_lsu_io_core_iwakeups_0_valid),
		.io_lsu_iwakeups_0_bits_uop_pdst(_lsu_io_core_iwakeups_0_bits_uop_pdst),
		.io_lsu_iwakeups_0_bits_uop_dst_rtype(_lsu_io_core_iwakeups_0_bits_uop_dst_rtype),
		.io_lsu_iwakeups_0_bits_bypassable(_lsu_io_core_iwakeups_0_bits_bypassable),
		.io_lsu_iwakeups_0_bits_rebusy(_lsu_io_core_iwakeups_0_bits_rebusy),
		.io_lsu_iresp_0_valid(_lsu_io_core_iresp_0_valid),
		.io_lsu_iresp_0_bits_uop_br_mask(_lsu_io_core_iresp_0_bits_uop_br_mask),
		.io_lsu_iresp_0_bits_uop_rob_idx(_lsu_io_core_iresp_0_bits_uop_rob_idx),
		.io_lsu_iresp_0_bits_uop_pdst(_lsu_io_core_iresp_0_bits_uop_pdst),
		.io_lsu_iresp_0_bits_data(_lsu_io_core_iresp_0_bits_data),
		.io_lsu_fresp_0_valid(_lsu_io_core_fresp_0_valid),
		.io_lsu_fresp_0_bits_uop_br_mask(_lsu_io_core_fresp_0_bits_uop_br_mask),
		.io_lsu_fresp_0_bits_uop_rob_idx(_lsu_io_core_fresp_0_bits_uop_rob_idx),
		.io_lsu_fresp_0_bits_uop_pdst(_lsu_io_core_fresp_0_bits_uop_pdst),
		.io_lsu_fresp_0_bits_uop_mem_size(_lsu_io_core_fresp_0_bits_uop_mem_size),
		.io_lsu_fresp_0_bits_uop_dst_rtype(_lsu_io_core_fresp_0_bits_uop_dst_rtype),
		.io_lsu_fresp_0_bits_data(_lsu_io_core_fresp_0_bits_data),
		.io_lsu_sfence_valid(_core_io_lsu_sfence_valid),
		.io_lsu_sfence_bits_rs1(_core_io_lsu_sfence_bits_rs1),
		.io_lsu_sfence_bits_rs2(_core_io_lsu_sfence_bits_rs2),
		.io_lsu_sfence_bits_addr(_core_io_lsu_sfence_bits_addr),
		.io_lsu_dis_uops_0_valid(_core_io_lsu_dis_uops_0_valid),
		.io_lsu_dis_uops_0_bits_inst(_core_io_lsu_dis_uops_0_bits_inst),
		.io_lsu_dis_uops_0_bits_debug_inst(_core_io_lsu_dis_uops_0_bits_debug_inst),
		.io_lsu_dis_uops_0_bits_is_rvc(_core_io_lsu_dis_uops_0_bits_is_rvc),
		.io_lsu_dis_uops_0_bits_debug_pc(_core_io_lsu_dis_uops_0_bits_debug_pc),
		.io_lsu_dis_uops_0_bits_iq_type_0(_core_io_lsu_dis_uops_0_bits_iq_type_0),
		.io_lsu_dis_uops_0_bits_iq_type_1(_core_io_lsu_dis_uops_0_bits_iq_type_1),
		.io_lsu_dis_uops_0_bits_iq_type_2(_core_io_lsu_dis_uops_0_bits_iq_type_2),
		.io_lsu_dis_uops_0_bits_iq_type_3(_core_io_lsu_dis_uops_0_bits_iq_type_3),
		.io_lsu_dis_uops_0_bits_fu_code_0(_core_io_lsu_dis_uops_0_bits_fu_code_0),
		.io_lsu_dis_uops_0_bits_fu_code_1(_core_io_lsu_dis_uops_0_bits_fu_code_1),
		.io_lsu_dis_uops_0_bits_fu_code_2(_core_io_lsu_dis_uops_0_bits_fu_code_2),
		.io_lsu_dis_uops_0_bits_fu_code_3(_core_io_lsu_dis_uops_0_bits_fu_code_3),
		.io_lsu_dis_uops_0_bits_fu_code_4(_core_io_lsu_dis_uops_0_bits_fu_code_4),
		.io_lsu_dis_uops_0_bits_fu_code_5(_core_io_lsu_dis_uops_0_bits_fu_code_5),
		.io_lsu_dis_uops_0_bits_fu_code_6(_core_io_lsu_dis_uops_0_bits_fu_code_6),
		.io_lsu_dis_uops_0_bits_fu_code_7(_core_io_lsu_dis_uops_0_bits_fu_code_7),
		.io_lsu_dis_uops_0_bits_fu_code_8(_core_io_lsu_dis_uops_0_bits_fu_code_8),
		.io_lsu_dis_uops_0_bits_fu_code_9(_core_io_lsu_dis_uops_0_bits_fu_code_9),
		.io_lsu_dis_uops_0_bits_iw_issued(_core_io_lsu_dis_uops_0_bits_iw_issued),
		.io_lsu_dis_uops_0_bits_iw_issued_partial_agen(_core_io_lsu_dis_uops_0_bits_iw_issued_partial_agen),
		.io_lsu_dis_uops_0_bits_iw_issued_partial_dgen(_core_io_lsu_dis_uops_0_bits_iw_issued_partial_dgen),
		.io_lsu_dis_uops_0_bits_iw_p1_speculative_child(_core_io_lsu_dis_uops_0_bits_iw_p1_speculative_child),
		.io_lsu_dis_uops_0_bits_iw_p2_speculative_child(_core_io_lsu_dis_uops_0_bits_iw_p2_speculative_child),
		.io_lsu_dis_uops_0_bits_iw_p1_bypass_hint(_core_io_lsu_dis_uops_0_bits_iw_p1_bypass_hint),
		.io_lsu_dis_uops_0_bits_iw_p2_bypass_hint(_core_io_lsu_dis_uops_0_bits_iw_p2_bypass_hint),
		.io_lsu_dis_uops_0_bits_iw_p3_bypass_hint(_core_io_lsu_dis_uops_0_bits_iw_p3_bypass_hint),
		.io_lsu_dis_uops_0_bits_br_mask(_core_io_lsu_dis_uops_0_bits_br_mask),
		.io_lsu_dis_uops_0_bits_br_tag(_core_io_lsu_dis_uops_0_bits_br_tag),
		.io_lsu_dis_uops_0_bits_br_type(_core_io_lsu_dis_uops_0_bits_br_type),
		.io_lsu_dis_uops_0_bits_is_sfb(_core_io_lsu_dis_uops_0_bits_is_sfb),
		.io_lsu_dis_uops_0_bits_is_fence(_core_io_lsu_dis_uops_0_bits_is_fence),
		.io_lsu_dis_uops_0_bits_is_fencei(_core_io_lsu_dis_uops_0_bits_is_fencei),
		.io_lsu_dis_uops_0_bits_is_sfence(_core_io_lsu_dis_uops_0_bits_is_sfence),
		.io_lsu_dis_uops_0_bits_is_amo(_core_io_lsu_dis_uops_0_bits_is_amo),
		.io_lsu_dis_uops_0_bits_is_eret(_core_io_lsu_dis_uops_0_bits_is_eret),
		.io_lsu_dis_uops_0_bits_is_sys_pc2epc(_core_io_lsu_dis_uops_0_bits_is_sys_pc2epc),
		.io_lsu_dis_uops_0_bits_is_rocc(_core_io_lsu_dis_uops_0_bits_is_rocc),
		.io_lsu_dis_uops_0_bits_is_mov(_core_io_lsu_dis_uops_0_bits_is_mov),
		.io_lsu_dis_uops_0_bits_ftq_idx(_core_io_lsu_dis_uops_0_bits_ftq_idx),
		.io_lsu_dis_uops_0_bits_edge_inst(_core_io_lsu_dis_uops_0_bits_edge_inst),
		.io_lsu_dis_uops_0_bits_pc_lob(_core_io_lsu_dis_uops_0_bits_pc_lob),
		.io_lsu_dis_uops_0_bits_taken(_core_io_lsu_dis_uops_0_bits_taken),
		.io_lsu_dis_uops_0_bits_imm_rename(_core_io_lsu_dis_uops_0_bits_imm_rename),
		.io_lsu_dis_uops_0_bits_imm_sel(_core_io_lsu_dis_uops_0_bits_imm_sel),
		.io_lsu_dis_uops_0_bits_pimm(_core_io_lsu_dis_uops_0_bits_pimm),
		.io_lsu_dis_uops_0_bits_imm_packed(_core_io_lsu_dis_uops_0_bits_imm_packed),
		.io_lsu_dis_uops_0_bits_op1_sel(_core_io_lsu_dis_uops_0_bits_op1_sel),
		.io_lsu_dis_uops_0_bits_op2_sel(_core_io_lsu_dis_uops_0_bits_op2_sel),
		.io_lsu_dis_uops_0_bits_fp_ctrl_ldst(_core_io_lsu_dis_uops_0_bits_fp_ctrl_ldst),
		.io_lsu_dis_uops_0_bits_fp_ctrl_wen(_core_io_lsu_dis_uops_0_bits_fp_ctrl_wen),
		.io_lsu_dis_uops_0_bits_fp_ctrl_ren1(_core_io_lsu_dis_uops_0_bits_fp_ctrl_ren1),
		.io_lsu_dis_uops_0_bits_fp_ctrl_ren2(_core_io_lsu_dis_uops_0_bits_fp_ctrl_ren2),
		.io_lsu_dis_uops_0_bits_fp_ctrl_ren3(_core_io_lsu_dis_uops_0_bits_fp_ctrl_ren3),
		.io_lsu_dis_uops_0_bits_fp_ctrl_swap12(_core_io_lsu_dis_uops_0_bits_fp_ctrl_swap12),
		.io_lsu_dis_uops_0_bits_fp_ctrl_swap23(_core_io_lsu_dis_uops_0_bits_fp_ctrl_swap23),
		.io_lsu_dis_uops_0_bits_fp_ctrl_typeTagIn(_core_io_lsu_dis_uops_0_bits_fp_ctrl_typeTagIn),
		.io_lsu_dis_uops_0_bits_fp_ctrl_typeTagOut(_core_io_lsu_dis_uops_0_bits_fp_ctrl_typeTagOut),
		.io_lsu_dis_uops_0_bits_fp_ctrl_fromint(_core_io_lsu_dis_uops_0_bits_fp_ctrl_fromint),
		.io_lsu_dis_uops_0_bits_fp_ctrl_toint(_core_io_lsu_dis_uops_0_bits_fp_ctrl_toint),
		.io_lsu_dis_uops_0_bits_fp_ctrl_fastpipe(_core_io_lsu_dis_uops_0_bits_fp_ctrl_fastpipe),
		.io_lsu_dis_uops_0_bits_fp_ctrl_fma(_core_io_lsu_dis_uops_0_bits_fp_ctrl_fma),
		.io_lsu_dis_uops_0_bits_fp_ctrl_div(_core_io_lsu_dis_uops_0_bits_fp_ctrl_div),
		.io_lsu_dis_uops_0_bits_fp_ctrl_sqrt(_core_io_lsu_dis_uops_0_bits_fp_ctrl_sqrt),
		.io_lsu_dis_uops_0_bits_fp_ctrl_wflags(_core_io_lsu_dis_uops_0_bits_fp_ctrl_wflags),
		.io_lsu_dis_uops_0_bits_fp_ctrl_vec(_core_io_lsu_dis_uops_0_bits_fp_ctrl_vec),
		.io_lsu_dis_uops_0_bits_rob_idx(_core_io_lsu_dis_uops_0_bits_rob_idx),
		.io_lsu_dis_uops_0_bits_ldq_idx(_core_io_lsu_dis_uops_0_bits_ldq_idx),
		.io_lsu_dis_uops_0_bits_stq_idx(_core_io_lsu_dis_uops_0_bits_stq_idx),
		.io_lsu_dis_uops_0_bits_rxq_idx(_core_io_lsu_dis_uops_0_bits_rxq_idx),
		.io_lsu_dis_uops_0_bits_pdst(_core_io_lsu_dis_uops_0_bits_pdst),
		.io_lsu_dis_uops_0_bits_prs1(_core_io_lsu_dis_uops_0_bits_prs1),
		.io_lsu_dis_uops_0_bits_prs2(_core_io_lsu_dis_uops_0_bits_prs2),
		.io_lsu_dis_uops_0_bits_prs3(_core_io_lsu_dis_uops_0_bits_prs3),
		.io_lsu_dis_uops_0_bits_ppred(_core_io_lsu_dis_uops_0_bits_ppred),
		.io_lsu_dis_uops_0_bits_prs1_busy(_core_io_lsu_dis_uops_0_bits_prs1_busy),
		.io_lsu_dis_uops_0_bits_prs2_busy(_core_io_lsu_dis_uops_0_bits_prs2_busy),
		.io_lsu_dis_uops_0_bits_prs3_busy(_core_io_lsu_dis_uops_0_bits_prs3_busy),
		.io_lsu_dis_uops_0_bits_ppred_busy(_core_io_lsu_dis_uops_0_bits_ppred_busy),
		.io_lsu_dis_uops_0_bits_stale_pdst(_core_io_lsu_dis_uops_0_bits_stale_pdst),
		.io_lsu_dis_uops_0_bits_exception(_core_io_lsu_dis_uops_0_bits_exception),
		.io_lsu_dis_uops_0_bits_exc_cause(_core_io_lsu_dis_uops_0_bits_exc_cause),
		.io_lsu_dis_uops_0_bits_mem_cmd(_core_io_lsu_dis_uops_0_bits_mem_cmd),
		.io_lsu_dis_uops_0_bits_mem_size(_core_io_lsu_dis_uops_0_bits_mem_size),
		.io_lsu_dis_uops_0_bits_mem_signed(_core_io_lsu_dis_uops_0_bits_mem_signed),
		.io_lsu_dis_uops_0_bits_uses_ldq(_core_io_lsu_dis_uops_0_bits_uses_ldq),
		.io_lsu_dis_uops_0_bits_uses_stq(_core_io_lsu_dis_uops_0_bits_uses_stq),
		.io_lsu_dis_uops_0_bits_is_unique(_core_io_lsu_dis_uops_0_bits_is_unique),
		.io_lsu_dis_uops_0_bits_flush_on_commit(_core_io_lsu_dis_uops_0_bits_flush_on_commit),
		.io_lsu_dis_uops_0_bits_csr_cmd(_core_io_lsu_dis_uops_0_bits_csr_cmd),
		.io_lsu_dis_uops_0_bits_ldst_is_rs1(_core_io_lsu_dis_uops_0_bits_ldst_is_rs1),
		.io_lsu_dis_uops_0_bits_ldst(_core_io_lsu_dis_uops_0_bits_ldst),
		.io_lsu_dis_uops_0_bits_lrs1(_core_io_lsu_dis_uops_0_bits_lrs1),
		.io_lsu_dis_uops_0_bits_lrs2(_core_io_lsu_dis_uops_0_bits_lrs2),
		.io_lsu_dis_uops_0_bits_lrs3(_core_io_lsu_dis_uops_0_bits_lrs3),
		.io_lsu_dis_uops_0_bits_dst_rtype(_core_io_lsu_dis_uops_0_bits_dst_rtype),
		.io_lsu_dis_uops_0_bits_lrs1_rtype(_core_io_lsu_dis_uops_0_bits_lrs1_rtype),
		.io_lsu_dis_uops_0_bits_lrs2_rtype(_core_io_lsu_dis_uops_0_bits_lrs2_rtype),
		.io_lsu_dis_uops_0_bits_frs3_en(_core_io_lsu_dis_uops_0_bits_frs3_en),
		.io_lsu_dis_uops_0_bits_fcn_dw(_core_io_lsu_dis_uops_0_bits_fcn_dw),
		.io_lsu_dis_uops_0_bits_fcn_op(_core_io_lsu_dis_uops_0_bits_fcn_op),
		.io_lsu_dis_uops_0_bits_fp_val(_core_io_lsu_dis_uops_0_bits_fp_val),
		.io_lsu_dis_uops_0_bits_fp_rm(_core_io_lsu_dis_uops_0_bits_fp_rm),
		.io_lsu_dis_uops_0_bits_fp_typ(_core_io_lsu_dis_uops_0_bits_fp_typ),
		.io_lsu_dis_uops_0_bits_xcpt_pf_if(_core_io_lsu_dis_uops_0_bits_xcpt_pf_if),
		.io_lsu_dis_uops_0_bits_xcpt_ae_if(_core_io_lsu_dis_uops_0_bits_xcpt_ae_if),
		.io_lsu_dis_uops_0_bits_xcpt_ma_if(_core_io_lsu_dis_uops_0_bits_xcpt_ma_if),
		.io_lsu_dis_uops_0_bits_bp_debug_if(_core_io_lsu_dis_uops_0_bits_bp_debug_if),
		.io_lsu_dis_uops_0_bits_bp_xcpt_if(_core_io_lsu_dis_uops_0_bits_bp_xcpt_if),
		.io_lsu_dis_uops_0_bits_debug_fsrc(_core_io_lsu_dis_uops_0_bits_debug_fsrc),
		.io_lsu_dis_uops_0_bits_debug_tsrc(_core_io_lsu_dis_uops_0_bits_debug_tsrc),
		.io_lsu_dis_ldq_idx_0(_lsu_io_core_dis_ldq_idx_0),
		.io_lsu_dis_stq_idx_0(_lsu_io_core_dis_stq_idx_0),
		.io_lsu_ldq_full_0(_lsu_io_core_ldq_full_0),
		.io_lsu_stq_full_0(_lsu_io_core_stq_full_0),
		.io_lsu_commit_valids_0(_core_io_lsu_commit_valids_0),
		.io_lsu_commit_uops_0_uses_ldq(_core_io_lsu_commit_uops_0_uses_ldq),
		.io_lsu_commit_uops_0_uses_stq(_core_io_lsu_commit_uops_0_uses_stq),
		.io_lsu_commit_load_at_rob_head(_core_io_lsu_commit_load_at_rob_head),
		.io_lsu_clr_bsy_0_valid(_lsu_io_core_clr_bsy_0_valid),
		.io_lsu_clr_bsy_0_bits(_lsu_io_core_clr_bsy_0_bits),
		.io_lsu_clr_unsafe_0_valid(_lsu_io_core_clr_unsafe_0_valid),
		.io_lsu_clr_unsafe_0_bits(_lsu_io_core_clr_unsafe_0_bits),
		.io_lsu_fence_dmem(_core_io_lsu_fence_dmem),
		.io_lsu_brupdate_b1_resolve_mask(_core_io_lsu_brupdate_b1_resolve_mask),
		.io_lsu_brupdate_b1_mispredict_mask(_core_io_lsu_brupdate_b1_mispredict_mask),
		.io_lsu_brupdate_b2_uop_ldq_idx(_core_io_lsu_brupdate_b2_uop_ldq_idx),
		.io_lsu_brupdate_b2_uop_stq_idx(_core_io_lsu_brupdate_b2_uop_stq_idx),
		.io_lsu_brupdate_b2_mispredict(_core_io_lsu_brupdate_b2_mispredict),
		.io_lsu_rob_head_idx(_core_io_lsu_rob_head_idx),
		.io_lsu_exception(_core_io_lsu_exception),
		.io_lsu_fencei_rdy(_lsu_io_core_fencei_rdy),
		.io_lsu_lxcpt_valid(_lsu_io_core_lxcpt_valid),
		.io_lsu_lxcpt_bits_uop_br_mask(_lsu_io_core_lxcpt_bits_uop_br_mask),
		.io_lsu_lxcpt_bits_uop_rob_idx(_lsu_io_core_lxcpt_bits_uop_rob_idx),
		.io_lsu_lxcpt_bits_cause(_lsu_io_core_lxcpt_bits_cause),
		.io_lsu_lxcpt_bits_badvaddr(_lsu_io_core_lxcpt_bits_badvaddr),
		.io_lsu_perf_acquire(_lsu_io_core_perf_acquire),
		.io_lsu_perf_release(_lsu_io_core_perf_release),
		.io_lsu_perf_tlbMiss(_lsu_io_core_perf_tlbMiss)
	);
	LSU lsu(
		.clock(clock),
		.reset(reset),
		.io_ptw_req_ready(_ptw_io_requestor_0_req_ready),
		.io_ptw_req_valid(_lsu_io_ptw_req_valid),
		.io_ptw_req_bits_valid(_lsu_io_ptw_req_bits_valid),
		.io_ptw_req_bits_bits_addr(_lsu_io_ptw_req_bits_bits_addr),
		.io_ptw_resp_valid(_ptw_io_requestor_0_resp_valid),
		.io_ptw_resp_bits_ae_final(_ptw_io_requestor_0_resp_bits_ae_final),
		.io_ptw_resp_bits_pte_ppn(_ptw_io_requestor_0_resp_bits_pte_ppn),
		.io_ptw_resp_bits_pte_d(_ptw_io_requestor_0_resp_bits_pte_d),
		.io_ptw_resp_bits_pte_a(_ptw_io_requestor_0_resp_bits_pte_a),
		.io_ptw_resp_bits_pte_g(_ptw_io_requestor_0_resp_bits_pte_g),
		.io_ptw_resp_bits_pte_u(_ptw_io_requestor_0_resp_bits_pte_u),
		.io_ptw_resp_bits_pte_x(_ptw_io_requestor_0_resp_bits_pte_x),
		.io_ptw_resp_bits_pte_w(_ptw_io_requestor_0_resp_bits_pte_w),
		.io_ptw_resp_bits_pte_r(_ptw_io_requestor_0_resp_bits_pte_r),
		.io_ptw_resp_bits_pte_v(_ptw_io_requestor_0_resp_bits_pte_v),
		.io_ptw_resp_bits_level(_ptw_io_requestor_0_resp_bits_level),
		.io_ptw_resp_bits_homogeneous(_ptw_io_requestor_0_resp_bits_homogeneous),
		.io_ptw_ptbr_mode(_ptw_io_requestor_0_ptbr_mode),
		.io_ptw_status_dprv(_ptw_io_requestor_0_status_dprv),
		.io_ptw_status_mxr(_ptw_io_requestor_0_status_mxr),
		.io_ptw_status_sum(_ptw_io_requestor_0_status_sum),
		.io_ptw_pmp_0_cfg_l(_ptw_io_requestor_0_pmp_0_cfg_l),
		.io_ptw_pmp_0_cfg_a(_ptw_io_requestor_0_pmp_0_cfg_a),
		.io_ptw_pmp_0_cfg_x(_ptw_io_requestor_0_pmp_0_cfg_x),
		.io_ptw_pmp_0_cfg_w(_ptw_io_requestor_0_pmp_0_cfg_w),
		.io_ptw_pmp_0_cfg_r(_ptw_io_requestor_0_pmp_0_cfg_r),
		.io_ptw_pmp_0_addr(_ptw_io_requestor_0_pmp_0_addr),
		.io_ptw_pmp_0_mask(_ptw_io_requestor_0_pmp_0_mask),
		.io_ptw_pmp_1_cfg_l(_ptw_io_requestor_0_pmp_1_cfg_l),
		.io_ptw_pmp_1_cfg_a(_ptw_io_requestor_0_pmp_1_cfg_a),
		.io_ptw_pmp_1_cfg_x(_ptw_io_requestor_0_pmp_1_cfg_x),
		.io_ptw_pmp_1_cfg_w(_ptw_io_requestor_0_pmp_1_cfg_w),
		.io_ptw_pmp_1_cfg_r(_ptw_io_requestor_0_pmp_1_cfg_r),
		.io_ptw_pmp_1_addr(_ptw_io_requestor_0_pmp_1_addr),
		.io_ptw_pmp_1_mask(_ptw_io_requestor_0_pmp_1_mask),
		.io_ptw_pmp_2_cfg_l(_ptw_io_requestor_0_pmp_2_cfg_l),
		.io_ptw_pmp_2_cfg_a(_ptw_io_requestor_0_pmp_2_cfg_a),
		.io_ptw_pmp_2_cfg_x(_ptw_io_requestor_0_pmp_2_cfg_x),
		.io_ptw_pmp_2_cfg_w(_ptw_io_requestor_0_pmp_2_cfg_w),
		.io_ptw_pmp_2_cfg_r(_ptw_io_requestor_0_pmp_2_cfg_r),
		.io_ptw_pmp_2_addr(_ptw_io_requestor_0_pmp_2_addr),
		.io_ptw_pmp_2_mask(_ptw_io_requestor_0_pmp_2_mask),
		.io_ptw_pmp_3_cfg_l(_ptw_io_requestor_0_pmp_3_cfg_l),
		.io_ptw_pmp_3_cfg_a(_ptw_io_requestor_0_pmp_3_cfg_a),
		.io_ptw_pmp_3_cfg_x(_ptw_io_requestor_0_pmp_3_cfg_x),
		.io_ptw_pmp_3_cfg_w(_ptw_io_requestor_0_pmp_3_cfg_w),
		.io_ptw_pmp_3_cfg_r(_ptw_io_requestor_0_pmp_3_cfg_r),
		.io_ptw_pmp_3_addr(_ptw_io_requestor_0_pmp_3_addr),
		.io_ptw_pmp_3_mask(_ptw_io_requestor_0_pmp_3_mask),
		.io_ptw_pmp_4_cfg_l(_ptw_io_requestor_0_pmp_4_cfg_l),
		.io_ptw_pmp_4_cfg_a(_ptw_io_requestor_0_pmp_4_cfg_a),
		.io_ptw_pmp_4_cfg_x(_ptw_io_requestor_0_pmp_4_cfg_x),
		.io_ptw_pmp_4_cfg_w(_ptw_io_requestor_0_pmp_4_cfg_w),
		.io_ptw_pmp_4_cfg_r(_ptw_io_requestor_0_pmp_4_cfg_r),
		.io_ptw_pmp_4_addr(_ptw_io_requestor_0_pmp_4_addr),
		.io_ptw_pmp_4_mask(_ptw_io_requestor_0_pmp_4_mask),
		.io_ptw_pmp_5_cfg_l(_ptw_io_requestor_0_pmp_5_cfg_l),
		.io_ptw_pmp_5_cfg_a(_ptw_io_requestor_0_pmp_5_cfg_a),
		.io_ptw_pmp_5_cfg_x(_ptw_io_requestor_0_pmp_5_cfg_x),
		.io_ptw_pmp_5_cfg_w(_ptw_io_requestor_0_pmp_5_cfg_w),
		.io_ptw_pmp_5_cfg_r(_ptw_io_requestor_0_pmp_5_cfg_r),
		.io_ptw_pmp_5_addr(_ptw_io_requestor_0_pmp_5_addr),
		.io_ptw_pmp_5_mask(_ptw_io_requestor_0_pmp_5_mask),
		.io_ptw_pmp_6_cfg_l(_ptw_io_requestor_0_pmp_6_cfg_l),
		.io_ptw_pmp_6_cfg_a(_ptw_io_requestor_0_pmp_6_cfg_a),
		.io_ptw_pmp_6_cfg_x(_ptw_io_requestor_0_pmp_6_cfg_x),
		.io_ptw_pmp_6_cfg_w(_ptw_io_requestor_0_pmp_6_cfg_w),
		.io_ptw_pmp_6_cfg_r(_ptw_io_requestor_0_pmp_6_cfg_r),
		.io_ptw_pmp_6_addr(_ptw_io_requestor_0_pmp_6_addr),
		.io_ptw_pmp_6_mask(_ptw_io_requestor_0_pmp_6_mask),
		.io_ptw_pmp_7_cfg_l(_ptw_io_requestor_0_pmp_7_cfg_l),
		.io_ptw_pmp_7_cfg_a(_ptw_io_requestor_0_pmp_7_cfg_a),
		.io_ptw_pmp_7_cfg_x(_ptw_io_requestor_0_pmp_7_cfg_x),
		.io_ptw_pmp_7_cfg_w(_ptw_io_requestor_0_pmp_7_cfg_w),
		.io_ptw_pmp_7_cfg_r(_ptw_io_requestor_0_pmp_7_cfg_r),
		.io_ptw_pmp_7_addr(_ptw_io_requestor_0_pmp_7_addr),
		.io_ptw_pmp_7_mask(_ptw_io_requestor_0_pmp_7_mask),
		.io_core_agen_0_valid(_core_io_lsu_agen_0_valid),
		.io_core_agen_0_bits_uop_br_mask(_core_io_lsu_agen_0_bits_uop_br_mask),
		.io_core_agen_0_bits_uop_ldq_idx(_core_io_lsu_agen_0_bits_uop_ldq_idx),
		.io_core_agen_0_bits_uop_stq_idx(_core_io_lsu_agen_0_bits_uop_stq_idx),
		.io_core_agen_0_bits_uop_pdst(_core_io_lsu_agen_0_bits_uop_pdst),
		.io_core_agen_0_bits_uop_uses_ldq(_core_io_lsu_agen_0_bits_uop_uses_ldq),
		.io_core_agen_0_bits_uop_uses_stq(_core_io_lsu_agen_0_bits_uop_uses_stq),
		.io_core_agen_0_bits_uop_dst_rtype(_core_io_lsu_agen_0_bits_uop_dst_rtype),
		.io_core_agen_0_bits_uop_fp_val(_core_io_lsu_agen_0_bits_uop_fp_val),
		.io_core_agen_0_bits_data(_core_io_lsu_agen_0_bits_data),
		.io_core_dgen_0_valid(_core_io_lsu_dgen_0_valid),
		.io_core_dgen_0_bits_uop_stq_idx(_core_io_lsu_dgen_0_bits_uop_stq_idx),
		.io_core_dgen_0_bits_data(_core_io_lsu_dgen_0_bits_data),
		.io_core_dgen_1_valid(_core_io_lsu_dgen_1_valid),
		.io_core_dgen_1_bits_uop_stq_idx(_core_io_lsu_dgen_1_bits_uop_stq_idx),
		.io_core_dgen_1_bits_data(_core_io_lsu_dgen_1_bits_data),
		.io_core_dgen_2_valid(_core_io_lsu_dgen_2_valid),
		.io_core_dgen_2_bits_uop_stq_idx(_core_io_lsu_dgen_2_bits_uop_stq_idx),
		.io_core_dgen_2_bits_data(_core_io_lsu_dgen_2_bits_data),
		.io_core_iwakeups_0_valid(_lsu_io_core_iwakeups_0_valid),
		.io_core_iwakeups_0_bits_uop_pdst(_lsu_io_core_iwakeups_0_bits_uop_pdst),
		.io_core_iwakeups_0_bits_uop_dst_rtype(_lsu_io_core_iwakeups_0_bits_uop_dst_rtype),
		.io_core_iwakeups_0_bits_bypassable(_lsu_io_core_iwakeups_0_bits_bypassable),
		.io_core_iwakeups_0_bits_rebusy(_lsu_io_core_iwakeups_0_bits_rebusy),
		.io_core_iresp_0_valid(_lsu_io_core_iresp_0_valid),
		.io_core_iresp_0_bits_uop_br_mask(_lsu_io_core_iresp_0_bits_uop_br_mask),
		.io_core_iresp_0_bits_uop_rob_idx(_lsu_io_core_iresp_0_bits_uop_rob_idx),
		.io_core_iresp_0_bits_uop_pdst(_lsu_io_core_iresp_0_bits_uop_pdst),
		.io_core_iresp_0_bits_data(_lsu_io_core_iresp_0_bits_data),
		.io_core_fresp_0_valid(_lsu_io_core_fresp_0_valid),
		.io_core_fresp_0_bits_uop_br_mask(_lsu_io_core_fresp_0_bits_uop_br_mask),
		.io_core_fresp_0_bits_uop_rob_idx(_lsu_io_core_fresp_0_bits_uop_rob_idx),
		.io_core_fresp_0_bits_uop_pdst(_lsu_io_core_fresp_0_bits_uop_pdst),
		.io_core_fresp_0_bits_uop_mem_size(_lsu_io_core_fresp_0_bits_uop_mem_size),
		.io_core_fresp_0_bits_uop_dst_rtype(_lsu_io_core_fresp_0_bits_uop_dst_rtype),
		.io_core_fresp_0_bits_data(_lsu_io_core_fresp_0_bits_data),
		.io_core_sfence_valid(_core_io_lsu_sfence_valid),
		.io_core_sfence_bits_rs1(_core_io_lsu_sfence_bits_rs1),
		.io_core_sfence_bits_rs2(_core_io_lsu_sfence_bits_rs2),
		.io_core_sfence_bits_addr(_core_io_lsu_sfence_bits_addr),
		.io_core_dis_uops_0_valid(_core_io_lsu_dis_uops_0_valid),
		.io_core_dis_uops_0_bits_inst(_core_io_lsu_dis_uops_0_bits_inst),
		.io_core_dis_uops_0_bits_debug_inst(_core_io_lsu_dis_uops_0_bits_debug_inst),
		.io_core_dis_uops_0_bits_is_rvc(_core_io_lsu_dis_uops_0_bits_is_rvc),
		.io_core_dis_uops_0_bits_debug_pc(_core_io_lsu_dis_uops_0_bits_debug_pc),
		.io_core_dis_uops_0_bits_iq_type_0(_core_io_lsu_dis_uops_0_bits_iq_type_0),
		.io_core_dis_uops_0_bits_iq_type_1(_core_io_lsu_dis_uops_0_bits_iq_type_1),
		.io_core_dis_uops_0_bits_iq_type_2(_core_io_lsu_dis_uops_0_bits_iq_type_2),
		.io_core_dis_uops_0_bits_iq_type_3(_core_io_lsu_dis_uops_0_bits_iq_type_3),
		.io_core_dis_uops_0_bits_fu_code_0(_core_io_lsu_dis_uops_0_bits_fu_code_0),
		.io_core_dis_uops_0_bits_fu_code_1(_core_io_lsu_dis_uops_0_bits_fu_code_1),
		.io_core_dis_uops_0_bits_fu_code_2(_core_io_lsu_dis_uops_0_bits_fu_code_2),
		.io_core_dis_uops_0_bits_fu_code_3(_core_io_lsu_dis_uops_0_bits_fu_code_3),
		.io_core_dis_uops_0_bits_fu_code_4(_core_io_lsu_dis_uops_0_bits_fu_code_4),
		.io_core_dis_uops_0_bits_fu_code_5(_core_io_lsu_dis_uops_0_bits_fu_code_5),
		.io_core_dis_uops_0_bits_fu_code_6(_core_io_lsu_dis_uops_0_bits_fu_code_6),
		.io_core_dis_uops_0_bits_fu_code_7(_core_io_lsu_dis_uops_0_bits_fu_code_7),
		.io_core_dis_uops_0_bits_fu_code_8(_core_io_lsu_dis_uops_0_bits_fu_code_8),
		.io_core_dis_uops_0_bits_fu_code_9(_core_io_lsu_dis_uops_0_bits_fu_code_9),
		.io_core_dis_uops_0_bits_iw_issued(_core_io_lsu_dis_uops_0_bits_iw_issued),
		.io_core_dis_uops_0_bits_iw_issued_partial_agen(_core_io_lsu_dis_uops_0_bits_iw_issued_partial_agen),
		.io_core_dis_uops_0_bits_iw_issued_partial_dgen(_core_io_lsu_dis_uops_0_bits_iw_issued_partial_dgen),
		.io_core_dis_uops_0_bits_iw_p1_speculative_child(_core_io_lsu_dis_uops_0_bits_iw_p1_speculative_child),
		.io_core_dis_uops_0_bits_iw_p2_speculative_child(_core_io_lsu_dis_uops_0_bits_iw_p2_speculative_child),
		.io_core_dis_uops_0_bits_iw_p1_bypass_hint(_core_io_lsu_dis_uops_0_bits_iw_p1_bypass_hint),
		.io_core_dis_uops_0_bits_iw_p2_bypass_hint(_core_io_lsu_dis_uops_0_bits_iw_p2_bypass_hint),
		.io_core_dis_uops_0_bits_iw_p3_bypass_hint(_core_io_lsu_dis_uops_0_bits_iw_p3_bypass_hint),
		.io_core_dis_uops_0_bits_br_mask(_core_io_lsu_dis_uops_0_bits_br_mask),
		.io_core_dis_uops_0_bits_br_tag(_core_io_lsu_dis_uops_0_bits_br_tag),
		.io_core_dis_uops_0_bits_br_type(_core_io_lsu_dis_uops_0_bits_br_type),
		.io_core_dis_uops_0_bits_is_sfb(_core_io_lsu_dis_uops_0_bits_is_sfb),
		.io_core_dis_uops_0_bits_is_fence(_core_io_lsu_dis_uops_0_bits_is_fence),
		.io_core_dis_uops_0_bits_is_fencei(_core_io_lsu_dis_uops_0_bits_is_fencei),
		.io_core_dis_uops_0_bits_is_sfence(_core_io_lsu_dis_uops_0_bits_is_sfence),
		.io_core_dis_uops_0_bits_is_amo(_core_io_lsu_dis_uops_0_bits_is_amo),
		.io_core_dis_uops_0_bits_is_eret(_core_io_lsu_dis_uops_0_bits_is_eret),
		.io_core_dis_uops_0_bits_is_sys_pc2epc(_core_io_lsu_dis_uops_0_bits_is_sys_pc2epc),
		.io_core_dis_uops_0_bits_is_rocc(_core_io_lsu_dis_uops_0_bits_is_rocc),
		.io_core_dis_uops_0_bits_is_mov(_core_io_lsu_dis_uops_0_bits_is_mov),
		.io_core_dis_uops_0_bits_ftq_idx(_core_io_lsu_dis_uops_0_bits_ftq_idx),
		.io_core_dis_uops_0_bits_edge_inst(_core_io_lsu_dis_uops_0_bits_edge_inst),
		.io_core_dis_uops_0_bits_pc_lob(_core_io_lsu_dis_uops_0_bits_pc_lob),
		.io_core_dis_uops_0_bits_taken(_core_io_lsu_dis_uops_0_bits_taken),
		.io_core_dis_uops_0_bits_imm_rename(_core_io_lsu_dis_uops_0_bits_imm_rename),
		.io_core_dis_uops_0_bits_imm_sel(_core_io_lsu_dis_uops_0_bits_imm_sel),
		.io_core_dis_uops_0_bits_pimm(_core_io_lsu_dis_uops_0_bits_pimm),
		.io_core_dis_uops_0_bits_imm_packed(_core_io_lsu_dis_uops_0_bits_imm_packed),
		.io_core_dis_uops_0_bits_op1_sel(_core_io_lsu_dis_uops_0_bits_op1_sel),
		.io_core_dis_uops_0_bits_op2_sel(_core_io_lsu_dis_uops_0_bits_op2_sel),
		.io_core_dis_uops_0_bits_fp_ctrl_ldst(_core_io_lsu_dis_uops_0_bits_fp_ctrl_ldst),
		.io_core_dis_uops_0_bits_fp_ctrl_wen(_core_io_lsu_dis_uops_0_bits_fp_ctrl_wen),
		.io_core_dis_uops_0_bits_fp_ctrl_ren1(_core_io_lsu_dis_uops_0_bits_fp_ctrl_ren1),
		.io_core_dis_uops_0_bits_fp_ctrl_ren2(_core_io_lsu_dis_uops_0_bits_fp_ctrl_ren2),
		.io_core_dis_uops_0_bits_fp_ctrl_ren3(_core_io_lsu_dis_uops_0_bits_fp_ctrl_ren3),
		.io_core_dis_uops_0_bits_fp_ctrl_swap12(_core_io_lsu_dis_uops_0_bits_fp_ctrl_swap12),
		.io_core_dis_uops_0_bits_fp_ctrl_swap23(_core_io_lsu_dis_uops_0_bits_fp_ctrl_swap23),
		.io_core_dis_uops_0_bits_fp_ctrl_typeTagIn(_core_io_lsu_dis_uops_0_bits_fp_ctrl_typeTagIn),
		.io_core_dis_uops_0_bits_fp_ctrl_typeTagOut(_core_io_lsu_dis_uops_0_bits_fp_ctrl_typeTagOut),
		.io_core_dis_uops_0_bits_fp_ctrl_fromint(_core_io_lsu_dis_uops_0_bits_fp_ctrl_fromint),
		.io_core_dis_uops_0_bits_fp_ctrl_toint(_core_io_lsu_dis_uops_0_bits_fp_ctrl_toint),
		.io_core_dis_uops_0_bits_fp_ctrl_fastpipe(_core_io_lsu_dis_uops_0_bits_fp_ctrl_fastpipe),
		.io_core_dis_uops_0_bits_fp_ctrl_fma(_core_io_lsu_dis_uops_0_bits_fp_ctrl_fma),
		.io_core_dis_uops_0_bits_fp_ctrl_div(_core_io_lsu_dis_uops_0_bits_fp_ctrl_div),
		.io_core_dis_uops_0_bits_fp_ctrl_sqrt(_core_io_lsu_dis_uops_0_bits_fp_ctrl_sqrt),
		.io_core_dis_uops_0_bits_fp_ctrl_wflags(_core_io_lsu_dis_uops_0_bits_fp_ctrl_wflags),
		.io_core_dis_uops_0_bits_fp_ctrl_vec(_core_io_lsu_dis_uops_0_bits_fp_ctrl_vec),
		.io_core_dis_uops_0_bits_rob_idx(_core_io_lsu_dis_uops_0_bits_rob_idx),
		.io_core_dis_uops_0_bits_ldq_idx(_core_io_lsu_dis_uops_0_bits_ldq_idx),
		.io_core_dis_uops_0_bits_stq_idx(_core_io_lsu_dis_uops_0_bits_stq_idx),
		.io_core_dis_uops_0_bits_rxq_idx(_core_io_lsu_dis_uops_0_bits_rxq_idx),
		.io_core_dis_uops_0_bits_pdst(_core_io_lsu_dis_uops_0_bits_pdst),
		.io_core_dis_uops_0_bits_prs1(_core_io_lsu_dis_uops_0_bits_prs1),
		.io_core_dis_uops_0_bits_prs2(_core_io_lsu_dis_uops_0_bits_prs2),
		.io_core_dis_uops_0_bits_prs3(_core_io_lsu_dis_uops_0_bits_prs3),
		.io_core_dis_uops_0_bits_ppred(_core_io_lsu_dis_uops_0_bits_ppred),
		.io_core_dis_uops_0_bits_prs1_busy(_core_io_lsu_dis_uops_0_bits_prs1_busy),
		.io_core_dis_uops_0_bits_prs2_busy(_core_io_lsu_dis_uops_0_bits_prs2_busy),
		.io_core_dis_uops_0_bits_prs3_busy(_core_io_lsu_dis_uops_0_bits_prs3_busy),
		.io_core_dis_uops_0_bits_ppred_busy(_core_io_lsu_dis_uops_0_bits_ppred_busy),
		.io_core_dis_uops_0_bits_stale_pdst(_core_io_lsu_dis_uops_0_bits_stale_pdst),
		.io_core_dis_uops_0_bits_exception(_core_io_lsu_dis_uops_0_bits_exception),
		.io_core_dis_uops_0_bits_exc_cause(_core_io_lsu_dis_uops_0_bits_exc_cause),
		.io_core_dis_uops_0_bits_mem_cmd(_core_io_lsu_dis_uops_0_bits_mem_cmd),
		.io_core_dis_uops_0_bits_mem_size(_core_io_lsu_dis_uops_0_bits_mem_size),
		.io_core_dis_uops_0_bits_mem_signed(_core_io_lsu_dis_uops_0_bits_mem_signed),
		.io_core_dis_uops_0_bits_uses_ldq(_core_io_lsu_dis_uops_0_bits_uses_ldq),
		.io_core_dis_uops_0_bits_uses_stq(_core_io_lsu_dis_uops_0_bits_uses_stq),
		.io_core_dis_uops_0_bits_is_unique(_core_io_lsu_dis_uops_0_bits_is_unique),
		.io_core_dis_uops_0_bits_flush_on_commit(_core_io_lsu_dis_uops_0_bits_flush_on_commit),
		.io_core_dis_uops_0_bits_csr_cmd(_core_io_lsu_dis_uops_0_bits_csr_cmd),
		.io_core_dis_uops_0_bits_ldst_is_rs1(_core_io_lsu_dis_uops_0_bits_ldst_is_rs1),
		.io_core_dis_uops_0_bits_ldst(_core_io_lsu_dis_uops_0_bits_ldst),
		.io_core_dis_uops_0_bits_lrs1(_core_io_lsu_dis_uops_0_bits_lrs1),
		.io_core_dis_uops_0_bits_lrs2(_core_io_lsu_dis_uops_0_bits_lrs2),
		.io_core_dis_uops_0_bits_lrs3(_core_io_lsu_dis_uops_0_bits_lrs3),
		.io_core_dis_uops_0_bits_dst_rtype(_core_io_lsu_dis_uops_0_bits_dst_rtype),
		.io_core_dis_uops_0_bits_lrs1_rtype(_core_io_lsu_dis_uops_0_bits_lrs1_rtype),
		.io_core_dis_uops_0_bits_lrs2_rtype(_core_io_lsu_dis_uops_0_bits_lrs2_rtype),
		.io_core_dis_uops_0_bits_frs3_en(_core_io_lsu_dis_uops_0_bits_frs3_en),
		.io_core_dis_uops_0_bits_fcn_dw(_core_io_lsu_dis_uops_0_bits_fcn_dw),
		.io_core_dis_uops_0_bits_fcn_op(_core_io_lsu_dis_uops_0_bits_fcn_op),
		.io_core_dis_uops_0_bits_fp_val(_core_io_lsu_dis_uops_0_bits_fp_val),
		.io_core_dis_uops_0_bits_fp_rm(_core_io_lsu_dis_uops_0_bits_fp_rm),
		.io_core_dis_uops_0_bits_fp_typ(_core_io_lsu_dis_uops_0_bits_fp_typ),
		.io_core_dis_uops_0_bits_xcpt_pf_if(_core_io_lsu_dis_uops_0_bits_xcpt_pf_if),
		.io_core_dis_uops_0_bits_xcpt_ae_if(_core_io_lsu_dis_uops_0_bits_xcpt_ae_if),
		.io_core_dis_uops_0_bits_xcpt_ma_if(_core_io_lsu_dis_uops_0_bits_xcpt_ma_if),
		.io_core_dis_uops_0_bits_bp_debug_if(_core_io_lsu_dis_uops_0_bits_bp_debug_if),
		.io_core_dis_uops_0_bits_bp_xcpt_if(_core_io_lsu_dis_uops_0_bits_bp_xcpt_if),
		.io_core_dis_uops_0_bits_debug_fsrc(_core_io_lsu_dis_uops_0_bits_debug_fsrc),
		.io_core_dis_uops_0_bits_debug_tsrc(_core_io_lsu_dis_uops_0_bits_debug_tsrc),
		.io_core_dis_ldq_idx_0(_lsu_io_core_dis_ldq_idx_0),
		.io_core_dis_stq_idx_0(_lsu_io_core_dis_stq_idx_0),
		.io_core_ldq_full_0(_lsu_io_core_ldq_full_0),
		.io_core_stq_full_0(_lsu_io_core_stq_full_0),
		.io_core_commit_valids_0(_core_io_lsu_commit_valids_0),
		.io_core_commit_uops_0_uses_ldq(_core_io_lsu_commit_uops_0_uses_ldq),
		.io_core_commit_uops_0_uses_stq(_core_io_lsu_commit_uops_0_uses_stq),
		.io_core_commit_load_at_rob_head(_core_io_lsu_commit_load_at_rob_head),
		.io_core_clr_bsy_0_valid(_lsu_io_core_clr_bsy_0_valid),
		.io_core_clr_bsy_0_bits(_lsu_io_core_clr_bsy_0_bits),
		.io_core_clr_unsafe_0_valid(_lsu_io_core_clr_unsafe_0_valid),
		.io_core_clr_unsafe_0_bits(_lsu_io_core_clr_unsafe_0_bits),
		.io_core_fence_dmem(_core_io_lsu_fence_dmem),
		.io_core_brupdate_b1_resolve_mask(_core_io_lsu_brupdate_b1_resolve_mask),
		.io_core_brupdate_b1_mispredict_mask(_core_io_lsu_brupdate_b1_mispredict_mask),
		.io_core_brupdate_b2_uop_ldq_idx(_core_io_lsu_brupdate_b2_uop_ldq_idx),
		.io_core_brupdate_b2_uop_stq_idx(_core_io_lsu_brupdate_b2_uop_stq_idx),
		.io_core_brupdate_b2_mispredict(_core_io_lsu_brupdate_b2_mispredict),
		.io_core_rob_head_idx(_core_io_lsu_rob_head_idx),
		.io_core_exception(_core_io_lsu_exception),
		.io_core_fencei_rdy(_lsu_io_core_fencei_rdy),
		.io_core_lxcpt_valid(_lsu_io_core_lxcpt_valid),
		.io_core_lxcpt_bits_uop_br_mask(_lsu_io_core_lxcpt_bits_uop_br_mask),
		.io_core_lxcpt_bits_uop_rob_idx(_lsu_io_core_lxcpt_bits_uop_rob_idx),
		.io_core_lxcpt_bits_cause(_lsu_io_core_lxcpt_bits_cause),
		.io_core_lxcpt_bits_badvaddr(_lsu_io_core_lxcpt_bits_badvaddr),
		.io_core_perf_acquire(_lsu_io_core_perf_acquire),
		.io_core_perf_release(_lsu_io_core_perf_release),
		.io_core_perf_tlbMiss(_lsu_io_core_perf_tlbMiss),
		.io_dmem_req_ready(_dcache_io_lsu_req_ready),
		.io_dmem_req_valid(_lsu_io_dmem_req_valid),
		.io_dmem_req_bits_0_valid(_lsu_io_dmem_req_bits_0_valid),
		.io_dmem_req_bits_0_bits_uop_inst(_lsu_io_dmem_req_bits_0_bits_uop_inst),
		.io_dmem_req_bits_0_bits_uop_debug_inst(_lsu_io_dmem_req_bits_0_bits_uop_debug_inst),
		.io_dmem_req_bits_0_bits_uop_is_rvc(_lsu_io_dmem_req_bits_0_bits_uop_is_rvc),
		.io_dmem_req_bits_0_bits_uop_debug_pc(_lsu_io_dmem_req_bits_0_bits_uop_debug_pc),
		.io_dmem_req_bits_0_bits_uop_iq_type_0(_lsu_io_dmem_req_bits_0_bits_uop_iq_type_0),
		.io_dmem_req_bits_0_bits_uop_iq_type_1(_lsu_io_dmem_req_bits_0_bits_uop_iq_type_1),
		.io_dmem_req_bits_0_bits_uop_iq_type_2(_lsu_io_dmem_req_bits_0_bits_uop_iq_type_2),
		.io_dmem_req_bits_0_bits_uop_iq_type_3(_lsu_io_dmem_req_bits_0_bits_uop_iq_type_3),
		.io_dmem_req_bits_0_bits_uop_fu_code_0(_lsu_io_dmem_req_bits_0_bits_uop_fu_code_0),
		.io_dmem_req_bits_0_bits_uop_fu_code_1(_lsu_io_dmem_req_bits_0_bits_uop_fu_code_1),
		.io_dmem_req_bits_0_bits_uop_fu_code_2(_lsu_io_dmem_req_bits_0_bits_uop_fu_code_2),
		.io_dmem_req_bits_0_bits_uop_fu_code_3(_lsu_io_dmem_req_bits_0_bits_uop_fu_code_3),
		.io_dmem_req_bits_0_bits_uop_fu_code_4(_lsu_io_dmem_req_bits_0_bits_uop_fu_code_4),
		.io_dmem_req_bits_0_bits_uop_fu_code_5(_lsu_io_dmem_req_bits_0_bits_uop_fu_code_5),
		.io_dmem_req_bits_0_bits_uop_fu_code_6(_lsu_io_dmem_req_bits_0_bits_uop_fu_code_6),
		.io_dmem_req_bits_0_bits_uop_fu_code_7(_lsu_io_dmem_req_bits_0_bits_uop_fu_code_7),
		.io_dmem_req_bits_0_bits_uop_fu_code_8(_lsu_io_dmem_req_bits_0_bits_uop_fu_code_8),
		.io_dmem_req_bits_0_bits_uop_fu_code_9(_lsu_io_dmem_req_bits_0_bits_uop_fu_code_9),
		.io_dmem_req_bits_0_bits_uop_iw_issued(_lsu_io_dmem_req_bits_0_bits_uop_iw_issued),
		.io_dmem_req_bits_0_bits_uop_iw_issued_partial_agen(_lsu_io_dmem_req_bits_0_bits_uop_iw_issued_partial_agen),
		.io_dmem_req_bits_0_bits_uop_iw_issued_partial_dgen(_lsu_io_dmem_req_bits_0_bits_uop_iw_issued_partial_dgen),
		.io_dmem_req_bits_0_bits_uop_iw_p1_speculative_child(_lsu_io_dmem_req_bits_0_bits_uop_iw_p1_speculative_child),
		.io_dmem_req_bits_0_bits_uop_iw_p2_speculative_child(_lsu_io_dmem_req_bits_0_bits_uop_iw_p2_speculative_child),
		.io_dmem_req_bits_0_bits_uop_iw_p1_bypass_hint(_lsu_io_dmem_req_bits_0_bits_uop_iw_p1_bypass_hint),
		.io_dmem_req_bits_0_bits_uop_iw_p2_bypass_hint(_lsu_io_dmem_req_bits_0_bits_uop_iw_p2_bypass_hint),
		.io_dmem_req_bits_0_bits_uop_iw_p3_bypass_hint(_lsu_io_dmem_req_bits_0_bits_uop_iw_p3_bypass_hint),
		.io_dmem_req_bits_0_bits_uop_dis_col_sel(_lsu_io_dmem_req_bits_0_bits_uop_dis_col_sel),
		.io_dmem_req_bits_0_bits_uop_br_mask(_lsu_io_dmem_req_bits_0_bits_uop_br_mask),
		.io_dmem_req_bits_0_bits_uop_br_tag(_lsu_io_dmem_req_bits_0_bits_uop_br_tag),
		.io_dmem_req_bits_0_bits_uop_br_type(_lsu_io_dmem_req_bits_0_bits_uop_br_type),
		.io_dmem_req_bits_0_bits_uop_is_sfb(_lsu_io_dmem_req_bits_0_bits_uop_is_sfb),
		.io_dmem_req_bits_0_bits_uop_is_fence(_lsu_io_dmem_req_bits_0_bits_uop_is_fence),
		.io_dmem_req_bits_0_bits_uop_is_fencei(_lsu_io_dmem_req_bits_0_bits_uop_is_fencei),
		.io_dmem_req_bits_0_bits_uop_is_sfence(_lsu_io_dmem_req_bits_0_bits_uop_is_sfence),
		.io_dmem_req_bits_0_bits_uop_is_amo(_lsu_io_dmem_req_bits_0_bits_uop_is_amo),
		.io_dmem_req_bits_0_bits_uop_is_eret(_lsu_io_dmem_req_bits_0_bits_uop_is_eret),
		.io_dmem_req_bits_0_bits_uop_is_sys_pc2epc(_lsu_io_dmem_req_bits_0_bits_uop_is_sys_pc2epc),
		.io_dmem_req_bits_0_bits_uop_is_rocc(_lsu_io_dmem_req_bits_0_bits_uop_is_rocc),
		.io_dmem_req_bits_0_bits_uop_is_mov(_lsu_io_dmem_req_bits_0_bits_uop_is_mov),
		.io_dmem_req_bits_0_bits_uop_ftq_idx(_lsu_io_dmem_req_bits_0_bits_uop_ftq_idx),
		.io_dmem_req_bits_0_bits_uop_edge_inst(_lsu_io_dmem_req_bits_0_bits_uop_edge_inst),
		.io_dmem_req_bits_0_bits_uop_pc_lob(_lsu_io_dmem_req_bits_0_bits_uop_pc_lob),
		.io_dmem_req_bits_0_bits_uop_taken(_lsu_io_dmem_req_bits_0_bits_uop_taken),
		.io_dmem_req_bits_0_bits_uop_imm_rename(_lsu_io_dmem_req_bits_0_bits_uop_imm_rename),
		.io_dmem_req_bits_0_bits_uop_imm_sel(_lsu_io_dmem_req_bits_0_bits_uop_imm_sel),
		.io_dmem_req_bits_0_bits_uop_pimm(_lsu_io_dmem_req_bits_0_bits_uop_pimm),
		.io_dmem_req_bits_0_bits_uop_imm_packed(_lsu_io_dmem_req_bits_0_bits_uop_imm_packed),
		.io_dmem_req_bits_0_bits_uop_op1_sel(_lsu_io_dmem_req_bits_0_bits_uop_op1_sel),
		.io_dmem_req_bits_0_bits_uop_op2_sel(_lsu_io_dmem_req_bits_0_bits_uop_op2_sel),
		.io_dmem_req_bits_0_bits_uop_fp_ctrl_ldst(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_ldst),
		.io_dmem_req_bits_0_bits_uop_fp_ctrl_wen(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_wen),
		.io_dmem_req_bits_0_bits_uop_fp_ctrl_ren1(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_ren1),
		.io_dmem_req_bits_0_bits_uop_fp_ctrl_ren2(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_ren2),
		.io_dmem_req_bits_0_bits_uop_fp_ctrl_ren3(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_ren3),
		.io_dmem_req_bits_0_bits_uop_fp_ctrl_swap12(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_swap12),
		.io_dmem_req_bits_0_bits_uop_fp_ctrl_swap23(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_swap23),
		.io_dmem_req_bits_0_bits_uop_fp_ctrl_typeTagIn(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_typeTagIn),
		.io_dmem_req_bits_0_bits_uop_fp_ctrl_typeTagOut(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_typeTagOut),
		.io_dmem_req_bits_0_bits_uop_fp_ctrl_fromint(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_fromint),
		.io_dmem_req_bits_0_bits_uop_fp_ctrl_toint(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_toint),
		.io_dmem_req_bits_0_bits_uop_fp_ctrl_fastpipe(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_fastpipe),
		.io_dmem_req_bits_0_bits_uop_fp_ctrl_fma(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_fma),
		.io_dmem_req_bits_0_bits_uop_fp_ctrl_div(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_div),
		.io_dmem_req_bits_0_bits_uop_fp_ctrl_sqrt(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_sqrt),
		.io_dmem_req_bits_0_bits_uop_fp_ctrl_wflags(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_wflags),
		.io_dmem_req_bits_0_bits_uop_fp_ctrl_vec(_lsu_io_dmem_req_bits_0_bits_uop_fp_ctrl_vec),
		.io_dmem_req_bits_0_bits_uop_rob_idx(_lsu_io_dmem_req_bits_0_bits_uop_rob_idx),
		.io_dmem_req_bits_0_bits_uop_ldq_idx(_lsu_io_dmem_req_bits_0_bits_uop_ldq_idx),
		.io_dmem_req_bits_0_bits_uop_stq_idx(_lsu_io_dmem_req_bits_0_bits_uop_stq_idx),
		.io_dmem_req_bits_0_bits_uop_rxq_idx(_lsu_io_dmem_req_bits_0_bits_uop_rxq_idx),
		.io_dmem_req_bits_0_bits_uop_pdst(_lsu_io_dmem_req_bits_0_bits_uop_pdst),
		.io_dmem_req_bits_0_bits_uop_prs1(_lsu_io_dmem_req_bits_0_bits_uop_prs1),
		.io_dmem_req_bits_0_bits_uop_prs2(_lsu_io_dmem_req_bits_0_bits_uop_prs2),
		.io_dmem_req_bits_0_bits_uop_prs3(_lsu_io_dmem_req_bits_0_bits_uop_prs3),
		.io_dmem_req_bits_0_bits_uop_ppred(_lsu_io_dmem_req_bits_0_bits_uop_ppred),
		.io_dmem_req_bits_0_bits_uop_prs1_busy(_lsu_io_dmem_req_bits_0_bits_uop_prs1_busy),
		.io_dmem_req_bits_0_bits_uop_prs2_busy(_lsu_io_dmem_req_bits_0_bits_uop_prs2_busy),
		.io_dmem_req_bits_0_bits_uop_prs3_busy(_lsu_io_dmem_req_bits_0_bits_uop_prs3_busy),
		.io_dmem_req_bits_0_bits_uop_ppred_busy(_lsu_io_dmem_req_bits_0_bits_uop_ppred_busy),
		.io_dmem_req_bits_0_bits_uop_stale_pdst(_lsu_io_dmem_req_bits_0_bits_uop_stale_pdst),
		.io_dmem_req_bits_0_bits_uop_exception(_lsu_io_dmem_req_bits_0_bits_uop_exception),
		.io_dmem_req_bits_0_bits_uop_exc_cause(_lsu_io_dmem_req_bits_0_bits_uop_exc_cause),
		.io_dmem_req_bits_0_bits_uop_mem_cmd(_lsu_io_dmem_req_bits_0_bits_uop_mem_cmd),
		.io_dmem_req_bits_0_bits_uop_mem_size(_lsu_io_dmem_req_bits_0_bits_uop_mem_size),
		.io_dmem_req_bits_0_bits_uop_mem_signed(_lsu_io_dmem_req_bits_0_bits_uop_mem_signed),
		.io_dmem_req_bits_0_bits_uop_uses_ldq(_lsu_io_dmem_req_bits_0_bits_uop_uses_ldq),
		.io_dmem_req_bits_0_bits_uop_uses_stq(_lsu_io_dmem_req_bits_0_bits_uop_uses_stq),
		.io_dmem_req_bits_0_bits_uop_is_unique(_lsu_io_dmem_req_bits_0_bits_uop_is_unique),
		.io_dmem_req_bits_0_bits_uop_flush_on_commit(_lsu_io_dmem_req_bits_0_bits_uop_flush_on_commit),
		.io_dmem_req_bits_0_bits_uop_csr_cmd(_lsu_io_dmem_req_bits_0_bits_uop_csr_cmd),
		.io_dmem_req_bits_0_bits_uop_ldst_is_rs1(_lsu_io_dmem_req_bits_0_bits_uop_ldst_is_rs1),
		.io_dmem_req_bits_0_bits_uop_ldst(_lsu_io_dmem_req_bits_0_bits_uop_ldst),
		.io_dmem_req_bits_0_bits_uop_lrs1(_lsu_io_dmem_req_bits_0_bits_uop_lrs1),
		.io_dmem_req_bits_0_bits_uop_lrs2(_lsu_io_dmem_req_bits_0_bits_uop_lrs2),
		.io_dmem_req_bits_0_bits_uop_lrs3(_lsu_io_dmem_req_bits_0_bits_uop_lrs3),
		.io_dmem_req_bits_0_bits_uop_dst_rtype(_lsu_io_dmem_req_bits_0_bits_uop_dst_rtype),
		.io_dmem_req_bits_0_bits_uop_lrs1_rtype(_lsu_io_dmem_req_bits_0_bits_uop_lrs1_rtype),
		.io_dmem_req_bits_0_bits_uop_lrs2_rtype(_lsu_io_dmem_req_bits_0_bits_uop_lrs2_rtype),
		.io_dmem_req_bits_0_bits_uop_frs3_en(_lsu_io_dmem_req_bits_0_bits_uop_frs3_en),
		.io_dmem_req_bits_0_bits_uop_fcn_dw(_lsu_io_dmem_req_bits_0_bits_uop_fcn_dw),
		.io_dmem_req_bits_0_bits_uop_fcn_op(_lsu_io_dmem_req_bits_0_bits_uop_fcn_op),
		.io_dmem_req_bits_0_bits_uop_fp_val(_lsu_io_dmem_req_bits_0_bits_uop_fp_val),
		.io_dmem_req_bits_0_bits_uop_fp_rm(_lsu_io_dmem_req_bits_0_bits_uop_fp_rm),
		.io_dmem_req_bits_0_bits_uop_fp_typ(_lsu_io_dmem_req_bits_0_bits_uop_fp_typ),
		.io_dmem_req_bits_0_bits_uop_xcpt_pf_if(_lsu_io_dmem_req_bits_0_bits_uop_xcpt_pf_if),
		.io_dmem_req_bits_0_bits_uop_xcpt_ae_if(_lsu_io_dmem_req_bits_0_bits_uop_xcpt_ae_if),
		.io_dmem_req_bits_0_bits_uop_xcpt_ma_if(_lsu_io_dmem_req_bits_0_bits_uop_xcpt_ma_if),
		.io_dmem_req_bits_0_bits_uop_bp_debug_if(_lsu_io_dmem_req_bits_0_bits_uop_bp_debug_if),
		.io_dmem_req_bits_0_bits_uop_bp_xcpt_if(_lsu_io_dmem_req_bits_0_bits_uop_bp_xcpt_if),
		.io_dmem_req_bits_0_bits_uop_debug_fsrc(_lsu_io_dmem_req_bits_0_bits_uop_debug_fsrc),
		.io_dmem_req_bits_0_bits_uop_debug_tsrc(_lsu_io_dmem_req_bits_0_bits_uop_debug_tsrc),
		.io_dmem_req_bits_0_bits_addr(_lsu_io_dmem_req_bits_0_bits_addr),
		.io_dmem_req_bits_0_bits_data(_lsu_io_dmem_req_bits_0_bits_data),
		.io_dmem_req_bits_0_bits_is_hella(_lsu_io_dmem_req_bits_0_bits_is_hella),
		.io_dmem_s1_kill_0(_lsu_io_dmem_s1_kill_0),
		.io_dmem_resp_0_valid(_dcache_io_lsu_resp_0_valid),
		.io_dmem_resp_0_bits_uop_is_amo(_dcache_io_lsu_resp_0_bits_uop_is_amo),
		.io_dmem_resp_0_bits_uop_ldq_idx(_dcache_io_lsu_resp_0_bits_uop_ldq_idx),
		.io_dmem_resp_0_bits_uop_stq_idx(_dcache_io_lsu_resp_0_bits_uop_stq_idx),
		.io_dmem_resp_0_bits_uop_uses_ldq(_dcache_io_lsu_resp_0_bits_uop_uses_ldq),
		.io_dmem_resp_0_bits_uop_uses_stq(_dcache_io_lsu_resp_0_bits_uop_uses_stq),
		.io_dmem_resp_0_bits_data(_dcache_io_lsu_resp_0_bits_data),
		.io_dmem_resp_0_bits_is_hella(_dcache_io_lsu_resp_0_bits_is_hella),
		.io_dmem_store_ack_0_valid(_dcache_io_lsu_store_ack_0_valid),
		.io_dmem_store_ack_0_bits_uop_stq_idx(_dcache_io_lsu_store_ack_0_bits_uop_stq_idx),
		.io_dmem_store_ack_0_bits_is_hella(_dcache_io_lsu_store_ack_0_bits_is_hella),
		.io_dmem_nack_0_valid(_dcache_io_lsu_nack_0_valid),
		.io_dmem_nack_0_bits_uop_ldq_idx(_dcache_io_lsu_nack_0_bits_uop_ldq_idx),
		.io_dmem_nack_0_bits_uop_stq_idx(_dcache_io_lsu_nack_0_bits_uop_stq_idx),
		.io_dmem_nack_0_bits_uop_mem_size(_dcache_io_lsu_nack_0_bits_uop_mem_size),
		.io_dmem_nack_0_bits_uop_uses_ldq(_dcache_io_lsu_nack_0_bits_uop_uses_ldq),
		.io_dmem_nack_0_bits_uop_uses_stq(_dcache_io_lsu_nack_0_bits_uop_uses_stq),
		.io_dmem_nack_0_bits_addr(_dcache_io_lsu_nack_0_bits_addr),
		.io_dmem_nack_0_bits_is_hella(_dcache_io_lsu_nack_0_bits_is_hella),
		.io_dmem_ll_resp_ready(_lsu_io_dmem_ll_resp_ready),
		.io_dmem_ll_resp_valid(_dcache_io_lsu_ll_resp_valid),
		.io_dmem_ll_resp_bits_uop_is_amo(_dcache_io_lsu_ll_resp_bits_uop_is_amo),
		.io_dmem_ll_resp_bits_uop_ldq_idx(_dcache_io_lsu_ll_resp_bits_uop_ldq_idx),
		.io_dmem_ll_resp_bits_uop_stq_idx(_dcache_io_lsu_ll_resp_bits_uop_stq_idx),
		.io_dmem_ll_resp_bits_uop_uses_ldq(_dcache_io_lsu_ll_resp_bits_uop_uses_ldq),
		.io_dmem_ll_resp_bits_uop_uses_stq(_dcache_io_lsu_ll_resp_bits_uop_uses_stq),
		.io_dmem_ll_resp_bits_data(_dcache_io_lsu_ll_resp_bits_data),
		.io_dmem_ll_resp_bits_is_hella(_dcache_io_lsu_ll_resp_bits_is_hella),
		.io_dmem_brupdate_b1_resolve_mask(_lsu_io_dmem_brupdate_b1_resolve_mask),
		.io_dmem_brupdate_b1_mispredict_mask(_lsu_io_dmem_brupdate_b1_mispredict_mask),
		.io_dmem_exception(_lsu_io_dmem_exception),
		.io_dmem_release_ready(_lsu_io_dmem_release_ready),
		.io_dmem_release_valid(_dcache_io_lsu_release_valid),
		.io_dmem_release_bits_address(_dcache_io_lsu_release_bits_address),
		.io_dmem_force_order(_lsu_io_dmem_force_order),
		.io_dmem_ordered(_dcache_io_lsu_ordered),
		.io_dmem_perf_acquire(_dcache_io_lsu_perf_acquire),
		.io_dmem_perf_release(_dcache_io_lsu_perf_release),
		.io_hellacache_req_ready(_lsu_io_hellacache_req_ready),
		.io_hellacache_req_valid(_hellaCacheArb_io_mem_req_valid),
		.io_hellacache_req_bits_addr(_hellaCacheArb_io_mem_req_bits_addr),
		.io_hellacache_s1_kill(_hellaCacheArb_io_mem_s1_kill),
		.io_hellacache_s2_nack(_lsu_io_hellacache_s2_nack),
		.io_hellacache_resp_valid(_lsu_io_hellacache_resp_valid),
		.io_hellacache_resp_bits_data(_lsu_io_hellacache_resp_bits_data),
		.io_hellacache_s2_xcpt_ae_ld(_lsu_io_hellacache_s2_xcpt_ae_ld)
	);
	PTW ptw(
		.clock(clock),
		.reset(reset),
		.io_requestor_0_req_ready(_ptw_io_requestor_0_req_ready),
		.io_requestor_0_req_valid(_lsu_io_ptw_req_valid),
		.io_requestor_0_req_bits_valid(_lsu_io_ptw_req_bits_valid),
		.io_requestor_0_req_bits_bits_addr(_lsu_io_ptw_req_bits_bits_addr),
		.io_requestor_0_resp_valid(_ptw_io_requestor_0_resp_valid),
		.io_requestor_0_resp_bits_ae_final(_ptw_io_requestor_0_resp_bits_ae_final),
		.io_requestor_0_resp_bits_pte_ppn(_ptw_io_requestor_0_resp_bits_pte_ppn),
		.io_requestor_0_resp_bits_pte_d(_ptw_io_requestor_0_resp_bits_pte_d),
		.io_requestor_0_resp_bits_pte_a(_ptw_io_requestor_0_resp_bits_pte_a),
		.io_requestor_0_resp_bits_pte_g(_ptw_io_requestor_0_resp_bits_pte_g),
		.io_requestor_0_resp_bits_pte_u(_ptw_io_requestor_0_resp_bits_pte_u),
		.io_requestor_0_resp_bits_pte_x(_ptw_io_requestor_0_resp_bits_pte_x),
		.io_requestor_0_resp_bits_pte_w(_ptw_io_requestor_0_resp_bits_pte_w),
		.io_requestor_0_resp_bits_pte_r(_ptw_io_requestor_0_resp_bits_pte_r),
		.io_requestor_0_resp_bits_pte_v(_ptw_io_requestor_0_resp_bits_pte_v),
		.io_requestor_0_resp_bits_level(_ptw_io_requestor_0_resp_bits_level),
		.io_requestor_0_resp_bits_homogeneous(_ptw_io_requestor_0_resp_bits_homogeneous),
		.io_requestor_0_ptbr_mode(_ptw_io_requestor_0_ptbr_mode),
		.io_requestor_0_status_dprv(_ptw_io_requestor_0_status_dprv),
		.io_requestor_0_status_mxr(_ptw_io_requestor_0_status_mxr),
		.io_requestor_0_status_sum(_ptw_io_requestor_0_status_sum),
		.io_requestor_0_pmp_0_cfg_l(_ptw_io_requestor_0_pmp_0_cfg_l),
		.io_requestor_0_pmp_0_cfg_a(_ptw_io_requestor_0_pmp_0_cfg_a),
		.io_requestor_0_pmp_0_cfg_x(_ptw_io_requestor_0_pmp_0_cfg_x),
		.io_requestor_0_pmp_0_cfg_w(_ptw_io_requestor_0_pmp_0_cfg_w),
		.io_requestor_0_pmp_0_cfg_r(_ptw_io_requestor_0_pmp_0_cfg_r),
		.io_requestor_0_pmp_0_addr(_ptw_io_requestor_0_pmp_0_addr),
		.io_requestor_0_pmp_0_mask(_ptw_io_requestor_0_pmp_0_mask),
		.io_requestor_0_pmp_1_cfg_l(_ptw_io_requestor_0_pmp_1_cfg_l),
		.io_requestor_0_pmp_1_cfg_a(_ptw_io_requestor_0_pmp_1_cfg_a),
		.io_requestor_0_pmp_1_cfg_x(_ptw_io_requestor_0_pmp_1_cfg_x),
		.io_requestor_0_pmp_1_cfg_w(_ptw_io_requestor_0_pmp_1_cfg_w),
		.io_requestor_0_pmp_1_cfg_r(_ptw_io_requestor_0_pmp_1_cfg_r),
		.io_requestor_0_pmp_1_addr(_ptw_io_requestor_0_pmp_1_addr),
		.io_requestor_0_pmp_1_mask(_ptw_io_requestor_0_pmp_1_mask),
		.io_requestor_0_pmp_2_cfg_l(_ptw_io_requestor_0_pmp_2_cfg_l),
		.io_requestor_0_pmp_2_cfg_a(_ptw_io_requestor_0_pmp_2_cfg_a),
		.io_requestor_0_pmp_2_cfg_x(_ptw_io_requestor_0_pmp_2_cfg_x),
		.io_requestor_0_pmp_2_cfg_w(_ptw_io_requestor_0_pmp_2_cfg_w),
		.io_requestor_0_pmp_2_cfg_r(_ptw_io_requestor_0_pmp_2_cfg_r),
		.io_requestor_0_pmp_2_addr(_ptw_io_requestor_0_pmp_2_addr),
		.io_requestor_0_pmp_2_mask(_ptw_io_requestor_0_pmp_2_mask),
		.io_requestor_0_pmp_3_cfg_l(_ptw_io_requestor_0_pmp_3_cfg_l),
		.io_requestor_0_pmp_3_cfg_a(_ptw_io_requestor_0_pmp_3_cfg_a),
		.io_requestor_0_pmp_3_cfg_x(_ptw_io_requestor_0_pmp_3_cfg_x),
		.io_requestor_0_pmp_3_cfg_w(_ptw_io_requestor_0_pmp_3_cfg_w),
		.io_requestor_0_pmp_3_cfg_r(_ptw_io_requestor_0_pmp_3_cfg_r),
		.io_requestor_0_pmp_3_addr(_ptw_io_requestor_0_pmp_3_addr),
		.io_requestor_0_pmp_3_mask(_ptw_io_requestor_0_pmp_3_mask),
		.io_requestor_0_pmp_4_cfg_l(_ptw_io_requestor_0_pmp_4_cfg_l),
		.io_requestor_0_pmp_4_cfg_a(_ptw_io_requestor_0_pmp_4_cfg_a),
		.io_requestor_0_pmp_4_cfg_x(_ptw_io_requestor_0_pmp_4_cfg_x),
		.io_requestor_0_pmp_4_cfg_w(_ptw_io_requestor_0_pmp_4_cfg_w),
		.io_requestor_0_pmp_4_cfg_r(_ptw_io_requestor_0_pmp_4_cfg_r),
		.io_requestor_0_pmp_4_addr(_ptw_io_requestor_0_pmp_4_addr),
		.io_requestor_0_pmp_4_mask(_ptw_io_requestor_0_pmp_4_mask),
		.io_requestor_0_pmp_5_cfg_l(_ptw_io_requestor_0_pmp_5_cfg_l),
		.io_requestor_0_pmp_5_cfg_a(_ptw_io_requestor_0_pmp_5_cfg_a),
		.io_requestor_0_pmp_5_cfg_x(_ptw_io_requestor_0_pmp_5_cfg_x),
		.io_requestor_0_pmp_5_cfg_w(_ptw_io_requestor_0_pmp_5_cfg_w),
		.io_requestor_0_pmp_5_cfg_r(_ptw_io_requestor_0_pmp_5_cfg_r),
		.io_requestor_0_pmp_5_addr(_ptw_io_requestor_0_pmp_5_addr),
		.io_requestor_0_pmp_5_mask(_ptw_io_requestor_0_pmp_5_mask),
		.io_requestor_0_pmp_6_cfg_l(_ptw_io_requestor_0_pmp_6_cfg_l),
		.io_requestor_0_pmp_6_cfg_a(_ptw_io_requestor_0_pmp_6_cfg_a),
		.io_requestor_0_pmp_6_cfg_x(_ptw_io_requestor_0_pmp_6_cfg_x),
		.io_requestor_0_pmp_6_cfg_w(_ptw_io_requestor_0_pmp_6_cfg_w),
		.io_requestor_0_pmp_6_cfg_r(_ptw_io_requestor_0_pmp_6_cfg_r),
		.io_requestor_0_pmp_6_addr(_ptw_io_requestor_0_pmp_6_addr),
		.io_requestor_0_pmp_6_mask(_ptw_io_requestor_0_pmp_6_mask),
		.io_requestor_0_pmp_7_cfg_l(_ptw_io_requestor_0_pmp_7_cfg_l),
		.io_requestor_0_pmp_7_cfg_a(_ptw_io_requestor_0_pmp_7_cfg_a),
		.io_requestor_0_pmp_7_cfg_x(_ptw_io_requestor_0_pmp_7_cfg_x),
		.io_requestor_0_pmp_7_cfg_w(_ptw_io_requestor_0_pmp_7_cfg_w),
		.io_requestor_0_pmp_7_cfg_r(_ptw_io_requestor_0_pmp_7_cfg_r),
		.io_requestor_0_pmp_7_addr(_ptw_io_requestor_0_pmp_7_addr),
		.io_requestor_0_pmp_7_mask(_ptw_io_requestor_0_pmp_7_mask),
		.io_requestor_1_req_ready(_ptw_io_requestor_1_req_ready),
		.io_requestor_1_req_valid(_frontend_io_ptw_req_valid),
		.io_requestor_1_req_bits_bits_addr(_frontend_io_ptw_req_bits_bits_addr),
		.io_requestor_1_req_bits_bits_need_gpa(_frontend_io_ptw_req_bits_bits_need_gpa),
		.io_requestor_1_resp_valid(_ptw_io_requestor_1_resp_valid),
		.io_requestor_1_resp_bits_ae_ptw(_ptw_io_requestor_1_resp_bits_ae_ptw),
		.io_requestor_1_resp_bits_ae_final(_ptw_io_requestor_1_resp_bits_ae_final),
		.io_requestor_1_resp_bits_pf(_ptw_io_requestor_1_resp_bits_pf),
		.io_requestor_1_resp_bits_gf(_ptw_io_requestor_1_resp_bits_gf),
		.io_requestor_1_resp_bits_hr(_ptw_io_requestor_1_resp_bits_hr),
		.io_requestor_1_resp_bits_hw(_ptw_io_requestor_1_resp_bits_hw),
		.io_requestor_1_resp_bits_hx(_ptw_io_requestor_1_resp_bits_hx),
		.io_requestor_1_resp_bits_pte_ppn(_ptw_io_requestor_1_resp_bits_pte_ppn),
		.io_requestor_1_resp_bits_pte_d(_ptw_io_requestor_1_resp_bits_pte_d),
		.io_requestor_1_resp_bits_pte_a(_ptw_io_requestor_1_resp_bits_pte_a),
		.io_requestor_1_resp_bits_pte_g(_ptw_io_requestor_1_resp_bits_pte_g),
		.io_requestor_1_resp_bits_pte_u(_ptw_io_requestor_1_resp_bits_pte_u),
		.io_requestor_1_resp_bits_pte_x(_ptw_io_requestor_1_resp_bits_pte_x),
		.io_requestor_1_resp_bits_pte_w(_ptw_io_requestor_1_resp_bits_pte_w),
		.io_requestor_1_resp_bits_pte_r(_ptw_io_requestor_1_resp_bits_pte_r),
		.io_requestor_1_resp_bits_pte_v(_ptw_io_requestor_1_resp_bits_pte_v),
		.io_requestor_1_resp_bits_level(_ptw_io_requestor_1_resp_bits_level),
		.io_requestor_1_resp_bits_homogeneous(_ptw_io_requestor_1_resp_bits_homogeneous),
		.io_requestor_1_ptbr_mode(_ptw_io_requestor_1_ptbr_mode),
		.io_requestor_1_status_debug(_ptw_io_requestor_1_status_debug),
		.io_requestor_1_status_prv(_ptw_io_requestor_1_status_prv),
		.io_requestor_1_pmp_0_cfg_l(_ptw_io_requestor_1_pmp_0_cfg_l),
		.io_requestor_1_pmp_0_cfg_a(_ptw_io_requestor_1_pmp_0_cfg_a),
		.io_requestor_1_pmp_0_cfg_x(_ptw_io_requestor_1_pmp_0_cfg_x),
		.io_requestor_1_pmp_0_cfg_w(_ptw_io_requestor_1_pmp_0_cfg_w),
		.io_requestor_1_pmp_0_cfg_r(_ptw_io_requestor_1_pmp_0_cfg_r),
		.io_requestor_1_pmp_0_addr(_ptw_io_requestor_1_pmp_0_addr),
		.io_requestor_1_pmp_0_mask(_ptw_io_requestor_1_pmp_0_mask),
		.io_requestor_1_pmp_1_cfg_l(_ptw_io_requestor_1_pmp_1_cfg_l),
		.io_requestor_1_pmp_1_cfg_a(_ptw_io_requestor_1_pmp_1_cfg_a),
		.io_requestor_1_pmp_1_cfg_x(_ptw_io_requestor_1_pmp_1_cfg_x),
		.io_requestor_1_pmp_1_cfg_w(_ptw_io_requestor_1_pmp_1_cfg_w),
		.io_requestor_1_pmp_1_cfg_r(_ptw_io_requestor_1_pmp_1_cfg_r),
		.io_requestor_1_pmp_1_addr(_ptw_io_requestor_1_pmp_1_addr),
		.io_requestor_1_pmp_1_mask(_ptw_io_requestor_1_pmp_1_mask),
		.io_requestor_1_pmp_2_cfg_l(_ptw_io_requestor_1_pmp_2_cfg_l),
		.io_requestor_1_pmp_2_cfg_a(_ptw_io_requestor_1_pmp_2_cfg_a),
		.io_requestor_1_pmp_2_cfg_x(_ptw_io_requestor_1_pmp_2_cfg_x),
		.io_requestor_1_pmp_2_cfg_w(_ptw_io_requestor_1_pmp_2_cfg_w),
		.io_requestor_1_pmp_2_cfg_r(_ptw_io_requestor_1_pmp_2_cfg_r),
		.io_requestor_1_pmp_2_addr(_ptw_io_requestor_1_pmp_2_addr),
		.io_requestor_1_pmp_2_mask(_ptw_io_requestor_1_pmp_2_mask),
		.io_requestor_1_pmp_3_cfg_l(_ptw_io_requestor_1_pmp_3_cfg_l),
		.io_requestor_1_pmp_3_cfg_a(_ptw_io_requestor_1_pmp_3_cfg_a),
		.io_requestor_1_pmp_3_cfg_x(_ptw_io_requestor_1_pmp_3_cfg_x),
		.io_requestor_1_pmp_3_cfg_w(_ptw_io_requestor_1_pmp_3_cfg_w),
		.io_requestor_1_pmp_3_cfg_r(_ptw_io_requestor_1_pmp_3_cfg_r),
		.io_requestor_1_pmp_3_addr(_ptw_io_requestor_1_pmp_3_addr),
		.io_requestor_1_pmp_3_mask(_ptw_io_requestor_1_pmp_3_mask),
		.io_requestor_1_pmp_4_cfg_l(_ptw_io_requestor_1_pmp_4_cfg_l),
		.io_requestor_1_pmp_4_cfg_a(_ptw_io_requestor_1_pmp_4_cfg_a),
		.io_requestor_1_pmp_4_cfg_x(_ptw_io_requestor_1_pmp_4_cfg_x),
		.io_requestor_1_pmp_4_cfg_w(_ptw_io_requestor_1_pmp_4_cfg_w),
		.io_requestor_1_pmp_4_cfg_r(_ptw_io_requestor_1_pmp_4_cfg_r),
		.io_requestor_1_pmp_4_addr(_ptw_io_requestor_1_pmp_4_addr),
		.io_requestor_1_pmp_4_mask(_ptw_io_requestor_1_pmp_4_mask),
		.io_requestor_1_pmp_5_cfg_l(_ptw_io_requestor_1_pmp_5_cfg_l),
		.io_requestor_1_pmp_5_cfg_a(_ptw_io_requestor_1_pmp_5_cfg_a),
		.io_requestor_1_pmp_5_cfg_x(_ptw_io_requestor_1_pmp_5_cfg_x),
		.io_requestor_1_pmp_5_cfg_w(_ptw_io_requestor_1_pmp_5_cfg_w),
		.io_requestor_1_pmp_5_cfg_r(_ptw_io_requestor_1_pmp_5_cfg_r),
		.io_requestor_1_pmp_5_addr(_ptw_io_requestor_1_pmp_5_addr),
		.io_requestor_1_pmp_5_mask(_ptw_io_requestor_1_pmp_5_mask),
		.io_requestor_1_pmp_6_cfg_l(_ptw_io_requestor_1_pmp_6_cfg_l),
		.io_requestor_1_pmp_6_cfg_a(_ptw_io_requestor_1_pmp_6_cfg_a),
		.io_requestor_1_pmp_6_cfg_x(_ptw_io_requestor_1_pmp_6_cfg_x),
		.io_requestor_1_pmp_6_cfg_w(_ptw_io_requestor_1_pmp_6_cfg_w),
		.io_requestor_1_pmp_6_cfg_r(_ptw_io_requestor_1_pmp_6_cfg_r),
		.io_requestor_1_pmp_6_addr(_ptw_io_requestor_1_pmp_6_addr),
		.io_requestor_1_pmp_6_mask(_ptw_io_requestor_1_pmp_6_mask),
		.io_requestor_1_pmp_7_cfg_l(_ptw_io_requestor_1_pmp_7_cfg_l),
		.io_requestor_1_pmp_7_cfg_a(_ptw_io_requestor_1_pmp_7_cfg_a),
		.io_requestor_1_pmp_7_cfg_x(_ptw_io_requestor_1_pmp_7_cfg_x),
		.io_requestor_1_pmp_7_cfg_w(_ptw_io_requestor_1_pmp_7_cfg_w),
		.io_requestor_1_pmp_7_cfg_r(_ptw_io_requestor_1_pmp_7_cfg_r),
		.io_requestor_1_pmp_7_addr(_ptw_io_requestor_1_pmp_7_addr),
		.io_requestor_1_pmp_7_mask(_ptw_io_requestor_1_pmp_7_mask),
		.io_mem_req_ready(_hellaCacheArb_io_requestor_0_req_ready),
		.io_mem_req_valid(_ptw_io_mem_req_valid),
		.io_mem_req_bits_addr(_ptw_io_mem_req_bits_addr),
		.io_mem_s1_kill(_ptw_io_mem_s1_kill),
		.io_mem_s2_nack(_hellaCacheArb_io_requestor_0_s2_nack),
		.io_mem_resp_valid(_hellaCacheArb_io_requestor_0_resp_valid),
		.io_mem_resp_bits_data(_hellaCacheArb_io_requestor_0_resp_bits_data),
		.io_mem_s2_xcpt_ae_ld(_hellaCacheArb_io_requestor_0_s2_xcpt_ae_ld),
		.io_dpath_ptbr_mode(_core_io_ptw_ptbr_mode),
		.io_dpath_ptbr_ppn(_core_io_ptw_ptbr_ppn),
		.io_dpath_sfence_valid(_core_io_ptw_sfence_valid),
		.io_dpath_sfence_bits_rs1(_core_io_ptw_sfence_bits_rs1),
		.io_dpath_sfence_bits_rs2(_core_io_ptw_sfence_bits_rs2),
		.io_dpath_sfence_bits_addr(_core_io_ptw_sfence_bits_addr),
		.io_dpath_status_debug(_core_io_ptw_status_debug),
		.io_dpath_status_dprv(_core_io_ptw_status_dprv),
		.io_dpath_status_prv(_core_io_ptw_status_prv),
		.io_dpath_status_mxr(_core_io_ptw_status_mxr),
		.io_dpath_status_sum(_core_io_ptw_status_sum),
		.io_dpath_pmp_0_cfg_l(_core_io_ptw_pmp_0_cfg_l),
		.io_dpath_pmp_0_cfg_a(_core_io_ptw_pmp_0_cfg_a),
		.io_dpath_pmp_0_cfg_x(_core_io_ptw_pmp_0_cfg_x),
		.io_dpath_pmp_0_cfg_w(_core_io_ptw_pmp_0_cfg_w),
		.io_dpath_pmp_0_cfg_r(_core_io_ptw_pmp_0_cfg_r),
		.io_dpath_pmp_0_addr(_core_io_ptw_pmp_0_addr),
		.io_dpath_pmp_0_mask(_core_io_ptw_pmp_0_mask),
		.io_dpath_pmp_1_cfg_l(_core_io_ptw_pmp_1_cfg_l),
		.io_dpath_pmp_1_cfg_a(_core_io_ptw_pmp_1_cfg_a),
		.io_dpath_pmp_1_cfg_x(_core_io_ptw_pmp_1_cfg_x),
		.io_dpath_pmp_1_cfg_w(_core_io_ptw_pmp_1_cfg_w),
		.io_dpath_pmp_1_cfg_r(_core_io_ptw_pmp_1_cfg_r),
		.io_dpath_pmp_1_addr(_core_io_ptw_pmp_1_addr),
		.io_dpath_pmp_1_mask(_core_io_ptw_pmp_1_mask),
		.io_dpath_pmp_2_cfg_l(_core_io_ptw_pmp_2_cfg_l),
		.io_dpath_pmp_2_cfg_a(_core_io_ptw_pmp_2_cfg_a),
		.io_dpath_pmp_2_cfg_x(_core_io_ptw_pmp_2_cfg_x),
		.io_dpath_pmp_2_cfg_w(_core_io_ptw_pmp_2_cfg_w),
		.io_dpath_pmp_2_cfg_r(_core_io_ptw_pmp_2_cfg_r),
		.io_dpath_pmp_2_addr(_core_io_ptw_pmp_2_addr),
		.io_dpath_pmp_2_mask(_core_io_ptw_pmp_2_mask),
		.io_dpath_pmp_3_cfg_l(_core_io_ptw_pmp_3_cfg_l),
		.io_dpath_pmp_3_cfg_a(_core_io_ptw_pmp_3_cfg_a),
		.io_dpath_pmp_3_cfg_x(_core_io_ptw_pmp_3_cfg_x),
		.io_dpath_pmp_3_cfg_w(_core_io_ptw_pmp_3_cfg_w),
		.io_dpath_pmp_3_cfg_r(_core_io_ptw_pmp_3_cfg_r),
		.io_dpath_pmp_3_addr(_core_io_ptw_pmp_3_addr),
		.io_dpath_pmp_3_mask(_core_io_ptw_pmp_3_mask),
		.io_dpath_pmp_4_cfg_l(_core_io_ptw_pmp_4_cfg_l),
		.io_dpath_pmp_4_cfg_a(_core_io_ptw_pmp_4_cfg_a),
		.io_dpath_pmp_4_cfg_x(_core_io_ptw_pmp_4_cfg_x),
		.io_dpath_pmp_4_cfg_w(_core_io_ptw_pmp_4_cfg_w),
		.io_dpath_pmp_4_cfg_r(_core_io_ptw_pmp_4_cfg_r),
		.io_dpath_pmp_4_addr(_core_io_ptw_pmp_4_addr),
		.io_dpath_pmp_4_mask(_core_io_ptw_pmp_4_mask),
		.io_dpath_pmp_5_cfg_l(_core_io_ptw_pmp_5_cfg_l),
		.io_dpath_pmp_5_cfg_a(_core_io_ptw_pmp_5_cfg_a),
		.io_dpath_pmp_5_cfg_x(_core_io_ptw_pmp_5_cfg_x),
		.io_dpath_pmp_5_cfg_w(_core_io_ptw_pmp_5_cfg_w),
		.io_dpath_pmp_5_cfg_r(_core_io_ptw_pmp_5_cfg_r),
		.io_dpath_pmp_5_addr(_core_io_ptw_pmp_5_addr),
		.io_dpath_pmp_5_mask(_core_io_ptw_pmp_5_mask),
		.io_dpath_pmp_6_cfg_l(_core_io_ptw_pmp_6_cfg_l),
		.io_dpath_pmp_6_cfg_a(_core_io_ptw_pmp_6_cfg_a),
		.io_dpath_pmp_6_cfg_x(_core_io_ptw_pmp_6_cfg_x),
		.io_dpath_pmp_6_cfg_w(_core_io_ptw_pmp_6_cfg_w),
		.io_dpath_pmp_6_cfg_r(_core_io_ptw_pmp_6_cfg_r),
		.io_dpath_pmp_6_addr(_core_io_ptw_pmp_6_addr),
		.io_dpath_pmp_6_mask(_core_io_ptw_pmp_6_mask),
		.io_dpath_pmp_7_cfg_l(_core_io_ptw_pmp_7_cfg_l),
		.io_dpath_pmp_7_cfg_a(_core_io_ptw_pmp_7_cfg_a),
		.io_dpath_pmp_7_cfg_x(_core_io_ptw_pmp_7_cfg_x),
		.io_dpath_pmp_7_cfg_w(_core_io_ptw_pmp_7_cfg_w),
		.io_dpath_pmp_7_cfg_r(_core_io_ptw_pmp_7_cfg_r),
		.io_dpath_pmp_7_addr(_core_io_ptw_pmp_7_addr),
		.io_dpath_pmp_7_mask(_core_io_ptw_pmp_7_mask),
		.io_dpath_perf_l2miss(_ptw_io_dpath_perf_l2miss)
	);
	HellaCacheArbiter hellaCacheArb(
		.io_requestor_0_req_ready(_hellaCacheArb_io_requestor_0_req_ready),
		.io_requestor_0_req_valid(_ptw_io_mem_req_valid),
		.io_requestor_0_req_bits_addr(_ptw_io_mem_req_bits_addr),
		.io_requestor_0_s1_kill(_ptw_io_mem_s1_kill),
		.io_requestor_0_s2_nack(_hellaCacheArb_io_requestor_0_s2_nack),
		.io_requestor_0_resp_valid(_hellaCacheArb_io_requestor_0_resp_valid),
		.io_requestor_0_resp_bits_data(_hellaCacheArb_io_requestor_0_resp_bits_data),
		.io_requestor_0_s2_xcpt_ae_ld(_hellaCacheArb_io_requestor_0_s2_xcpt_ae_ld),
		.io_mem_req_ready(_lsu_io_hellacache_req_ready),
		.io_mem_req_valid(_hellaCacheArb_io_mem_req_valid),
		.io_mem_req_bits_addr(_hellaCacheArb_io_mem_req_bits_addr),
		.io_mem_s1_kill(_hellaCacheArb_io_mem_s1_kill),
		.io_mem_s2_nack(_lsu_io_hellacache_s2_nack),
		.io_mem_resp_valid(_lsu_io_hellacache_resp_valid),
		.io_mem_resp_bits_data(_lsu_io_hellacache_resp_bits_data),
		.io_mem_s2_xcpt_ae_ld(_lsu_io_hellacache_s2_xcpt_ae_ld)
	);
endmodule
