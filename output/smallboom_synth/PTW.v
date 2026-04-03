module PTW (
	clock,
	reset,
	io_requestor_0_req_ready,
	io_requestor_0_req_valid,
	io_requestor_0_req_bits_valid,
	io_requestor_0_req_bits_bits_addr,
	io_requestor_0_resp_valid,
	io_requestor_0_resp_bits_ae_final,
	io_requestor_0_resp_bits_pte_ppn,
	io_requestor_0_resp_bits_pte_d,
	io_requestor_0_resp_bits_pte_a,
	io_requestor_0_resp_bits_pte_g,
	io_requestor_0_resp_bits_pte_u,
	io_requestor_0_resp_bits_pte_x,
	io_requestor_0_resp_bits_pte_w,
	io_requestor_0_resp_bits_pte_r,
	io_requestor_0_resp_bits_pte_v,
	io_requestor_0_resp_bits_level,
	io_requestor_0_resp_bits_homogeneous,
	io_requestor_0_ptbr_mode,
	io_requestor_0_status_dprv,
	io_requestor_0_status_mxr,
	io_requestor_0_status_sum,
	io_requestor_0_pmp_0_cfg_l,
	io_requestor_0_pmp_0_cfg_a,
	io_requestor_0_pmp_0_cfg_x,
	io_requestor_0_pmp_0_cfg_w,
	io_requestor_0_pmp_0_cfg_r,
	io_requestor_0_pmp_0_addr,
	io_requestor_0_pmp_0_mask,
	io_requestor_0_pmp_1_cfg_l,
	io_requestor_0_pmp_1_cfg_a,
	io_requestor_0_pmp_1_cfg_x,
	io_requestor_0_pmp_1_cfg_w,
	io_requestor_0_pmp_1_cfg_r,
	io_requestor_0_pmp_1_addr,
	io_requestor_0_pmp_1_mask,
	io_requestor_0_pmp_2_cfg_l,
	io_requestor_0_pmp_2_cfg_a,
	io_requestor_0_pmp_2_cfg_x,
	io_requestor_0_pmp_2_cfg_w,
	io_requestor_0_pmp_2_cfg_r,
	io_requestor_0_pmp_2_addr,
	io_requestor_0_pmp_2_mask,
	io_requestor_0_pmp_3_cfg_l,
	io_requestor_0_pmp_3_cfg_a,
	io_requestor_0_pmp_3_cfg_x,
	io_requestor_0_pmp_3_cfg_w,
	io_requestor_0_pmp_3_cfg_r,
	io_requestor_0_pmp_3_addr,
	io_requestor_0_pmp_3_mask,
	io_requestor_0_pmp_4_cfg_l,
	io_requestor_0_pmp_4_cfg_a,
	io_requestor_0_pmp_4_cfg_x,
	io_requestor_0_pmp_4_cfg_w,
	io_requestor_0_pmp_4_cfg_r,
	io_requestor_0_pmp_4_addr,
	io_requestor_0_pmp_4_mask,
	io_requestor_0_pmp_5_cfg_l,
	io_requestor_0_pmp_5_cfg_a,
	io_requestor_0_pmp_5_cfg_x,
	io_requestor_0_pmp_5_cfg_w,
	io_requestor_0_pmp_5_cfg_r,
	io_requestor_0_pmp_5_addr,
	io_requestor_0_pmp_5_mask,
	io_requestor_0_pmp_6_cfg_l,
	io_requestor_0_pmp_6_cfg_a,
	io_requestor_0_pmp_6_cfg_x,
	io_requestor_0_pmp_6_cfg_w,
	io_requestor_0_pmp_6_cfg_r,
	io_requestor_0_pmp_6_addr,
	io_requestor_0_pmp_6_mask,
	io_requestor_0_pmp_7_cfg_l,
	io_requestor_0_pmp_7_cfg_a,
	io_requestor_0_pmp_7_cfg_x,
	io_requestor_0_pmp_7_cfg_w,
	io_requestor_0_pmp_7_cfg_r,
	io_requestor_0_pmp_7_addr,
	io_requestor_0_pmp_7_mask,
	io_requestor_1_req_ready,
	io_requestor_1_req_valid,
	io_requestor_1_req_bits_bits_addr,
	io_requestor_1_req_bits_bits_need_gpa,
	io_requestor_1_resp_valid,
	io_requestor_1_resp_bits_ae_ptw,
	io_requestor_1_resp_bits_ae_final,
	io_requestor_1_resp_bits_pf,
	io_requestor_1_resp_bits_gf,
	io_requestor_1_resp_bits_hr,
	io_requestor_1_resp_bits_hw,
	io_requestor_1_resp_bits_hx,
	io_requestor_1_resp_bits_pte_ppn,
	io_requestor_1_resp_bits_pte_d,
	io_requestor_1_resp_bits_pte_a,
	io_requestor_1_resp_bits_pte_g,
	io_requestor_1_resp_bits_pte_u,
	io_requestor_1_resp_bits_pte_x,
	io_requestor_1_resp_bits_pte_w,
	io_requestor_1_resp_bits_pte_r,
	io_requestor_1_resp_bits_pte_v,
	io_requestor_1_resp_bits_level,
	io_requestor_1_resp_bits_homogeneous,
	io_requestor_1_ptbr_mode,
	io_requestor_1_status_debug,
	io_requestor_1_status_prv,
	io_requestor_1_pmp_0_cfg_l,
	io_requestor_1_pmp_0_cfg_a,
	io_requestor_1_pmp_0_cfg_x,
	io_requestor_1_pmp_0_cfg_w,
	io_requestor_1_pmp_0_cfg_r,
	io_requestor_1_pmp_0_addr,
	io_requestor_1_pmp_0_mask,
	io_requestor_1_pmp_1_cfg_l,
	io_requestor_1_pmp_1_cfg_a,
	io_requestor_1_pmp_1_cfg_x,
	io_requestor_1_pmp_1_cfg_w,
	io_requestor_1_pmp_1_cfg_r,
	io_requestor_1_pmp_1_addr,
	io_requestor_1_pmp_1_mask,
	io_requestor_1_pmp_2_cfg_l,
	io_requestor_1_pmp_2_cfg_a,
	io_requestor_1_pmp_2_cfg_x,
	io_requestor_1_pmp_2_cfg_w,
	io_requestor_1_pmp_2_cfg_r,
	io_requestor_1_pmp_2_addr,
	io_requestor_1_pmp_2_mask,
	io_requestor_1_pmp_3_cfg_l,
	io_requestor_1_pmp_3_cfg_a,
	io_requestor_1_pmp_3_cfg_x,
	io_requestor_1_pmp_3_cfg_w,
	io_requestor_1_pmp_3_cfg_r,
	io_requestor_1_pmp_3_addr,
	io_requestor_1_pmp_3_mask,
	io_requestor_1_pmp_4_cfg_l,
	io_requestor_1_pmp_4_cfg_a,
	io_requestor_1_pmp_4_cfg_x,
	io_requestor_1_pmp_4_cfg_w,
	io_requestor_1_pmp_4_cfg_r,
	io_requestor_1_pmp_4_addr,
	io_requestor_1_pmp_4_mask,
	io_requestor_1_pmp_5_cfg_l,
	io_requestor_1_pmp_5_cfg_a,
	io_requestor_1_pmp_5_cfg_x,
	io_requestor_1_pmp_5_cfg_w,
	io_requestor_1_pmp_5_cfg_r,
	io_requestor_1_pmp_5_addr,
	io_requestor_1_pmp_5_mask,
	io_requestor_1_pmp_6_cfg_l,
	io_requestor_1_pmp_6_cfg_a,
	io_requestor_1_pmp_6_cfg_x,
	io_requestor_1_pmp_6_cfg_w,
	io_requestor_1_pmp_6_cfg_r,
	io_requestor_1_pmp_6_addr,
	io_requestor_1_pmp_6_mask,
	io_requestor_1_pmp_7_cfg_l,
	io_requestor_1_pmp_7_cfg_a,
	io_requestor_1_pmp_7_cfg_x,
	io_requestor_1_pmp_7_cfg_w,
	io_requestor_1_pmp_7_cfg_r,
	io_requestor_1_pmp_7_addr,
	io_requestor_1_pmp_7_mask,
	io_mem_req_ready,
	io_mem_req_valid,
	io_mem_req_bits_addr,
	io_mem_s1_kill,
	io_mem_s2_nack,
	io_mem_resp_valid,
	io_mem_resp_bits_data,
	io_mem_s2_xcpt_ae_ld,
	io_dpath_ptbr_mode,
	io_dpath_ptbr_ppn,
	io_dpath_sfence_valid,
	io_dpath_sfence_bits_rs1,
	io_dpath_sfence_bits_rs2,
	io_dpath_sfence_bits_addr,
	io_dpath_status_debug,
	io_dpath_status_dprv,
	io_dpath_status_prv,
	io_dpath_status_mxr,
	io_dpath_status_sum,
	io_dpath_pmp_0_cfg_l,
	io_dpath_pmp_0_cfg_a,
	io_dpath_pmp_0_cfg_x,
	io_dpath_pmp_0_cfg_w,
	io_dpath_pmp_0_cfg_r,
	io_dpath_pmp_0_addr,
	io_dpath_pmp_0_mask,
	io_dpath_pmp_1_cfg_l,
	io_dpath_pmp_1_cfg_a,
	io_dpath_pmp_1_cfg_x,
	io_dpath_pmp_1_cfg_w,
	io_dpath_pmp_1_cfg_r,
	io_dpath_pmp_1_addr,
	io_dpath_pmp_1_mask,
	io_dpath_pmp_2_cfg_l,
	io_dpath_pmp_2_cfg_a,
	io_dpath_pmp_2_cfg_x,
	io_dpath_pmp_2_cfg_w,
	io_dpath_pmp_2_cfg_r,
	io_dpath_pmp_2_addr,
	io_dpath_pmp_2_mask,
	io_dpath_pmp_3_cfg_l,
	io_dpath_pmp_3_cfg_a,
	io_dpath_pmp_3_cfg_x,
	io_dpath_pmp_3_cfg_w,
	io_dpath_pmp_3_cfg_r,
	io_dpath_pmp_3_addr,
	io_dpath_pmp_3_mask,
	io_dpath_pmp_4_cfg_l,
	io_dpath_pmp_4_cfg_a,
	io_dpath_pmp_4_cfg_x,
	io_dpath_pmp_4_cfg_w,
	io_dpath_pmp_4_cfg_r,
	io_dpath_pmp_4_addr,
	io_dpath_pmp_4_mask,
	io_dpath_pmp_5_cfg_l,
	io_dpath_pmp_5_cfg_a,
	io_dpath_pmp_5_cfg_x,
	io_dpath_pmp_5_cfg_w,
	io_dpath_pmp_5_cfg_r,
	io_dpath_pmp_5_addr,
	io_dpath_pmp_5_mask,
	io_dpath_pmp_6_cfg_l,
	io_dpath_pmp_6_cfg_a,
	io_dpath_pmp_6_cfg_x,
	io_dpath_pmp_6_cfg_w,
	io_dpath_pmp_6_cfg_r,
	io_dpath_pmp_6_addr,
	io_dpath_pmp_6_mask,
	io_dpath_pmp_7_cfg_l,
	io_dpath_pmp_7_cfg_a,
	io_dpath_pmp_7_cfg_x,
	io_dpath_pmp_7_cfg_w,
	io_dpath_pmp_7_cfg_r,
	io_dpath_pmp_7_addr,
	io_dpath_pmp_7_mask,
	io_dpath_perf_l2miss
);
	input clock;
	input reset;
	output wire io_requestor_0_req_ready;
	input io_requestor_0_req_valid;
	input io_requestor_0_req_bits_valid;
	input [26:0] io_requestor_0_req_bits_bits_addr;
	output wire io_requestor_0_resp_valid;
	output wire io_requestor_0_resp_bits_ae_final;
	output wire [43:0] io_requestor_0_resp_bits_pte_ppn;
	output wire io_requestor_0_resp_bits_pte_d;
	output wire io_requestor_0_resp_bits_pte_a;
	output wire io_requestor_0_resp_bits_pte_g;
	output wire io_requestor_0_resp_bits_pte_u;
	output wire io_requestor_0_resp_bits_pte_x;
	output wire io_requestor_0_resp_bits_pte_w;
	output wire io_requestor_0_resp_bits_pte_r;
	output wire io_requestor_0_resp_bits_pte_v;
	output wire [1:0] io_requestor_0_resp_bits_level;
	output wire io_requestor_0_resp_bits_homogeneous;
	output wire [3:0] io_requestor_0_ptbr_mode;
	output wire [1:0] io_requestor_0_status_dprv;
	output wire io_requestor_0_status_mxr;
	output wire io_requestor_0_status_sum;
	output wire io_requestor_0_pmp_0_cfg_l;
	output wire [1:0] io_requestor_0_pmp_0_cfg_a;
	output wire io_requestor_0_pmp_0_cfg_x;
	output wire io_requestor_0_pmp_0_cfg_w;
	output wire io_requestor_0_pmp_0_cfg_r;
	output wire [29:0] io_requestor_0_pmp_0_addr;
	output wire [31:0] io_requestor_0_pmp_0_mask;
	output wire io_requestor_0_pmp_1_cfg_l;
	output wire [1:0] io_requestor_0_pmp_1_cfg_a;
	output wire io_requestor_0_pmp_1_cfg_x;
	output wire io_requestor_0_pmp_1_cfg_w;
	output wire io_requestor_0_pmp_1_cfg_r;
	output wire [29:0] io_requestor_0_pmp_1_addr;
	output wire [31:0] io_requestor_0_pmp_1_mask;
	output wire io_requestor_0_pmp_2_cfg_l;
	output wire [1:0] io_requestor_0_pmp_2_cfg_a;
	output wire io_requestor_0_pmp_2_cfg_x;
	output wire io_requestor_0_pmp_2_cfg_w;
	output wire io_requestor_0_pmp_2_cfg_r;
	output wire [29:0] io_requestor_0_pmp_2_addr;
	output wire [31:0] io_requestor_0_pmp_2_mask;
	output wire io_requestor_0_pmp_3_cfg_l;
	output wire [1:0] io_requestor_0_pmp_3_cfg_a;
	output wire io_requestor_0_pmp_3_cfg_x;
	output wire io_requestor_0_pmp_3_cfg_w;
	output wire io_requestor_0_pmp_3_cfg_r;
	output wire [29:0] io_requestor_0_pmp_3_addr;
	output wire [31:0] io_requestor_0_pmp_3_mask;
	output wire io_requestor_0_pmp_4_cfg_l;
	output wire [1:0] io_requestor_0_pmp_4_cfg_a;
	output wire io_requestor_0_pmp_4_cfg_x;
	output wire io_requestor_0_pmp_4_cfg_w;
	output wire io_requestor_0_pmp_4_cfg_r;
	output wire [29:0] io_requestor_0_pmp_4_addr;
	output wire [31:0] io_requestor_0_pmp_4_mask;
	output wire io_requestor_0_pmp_5_cfg_l;
	output wire [1:0] io_requestor_0_pmp_5_cfg_a;
	output wire io_requestor_0_pmp_5_cfg_x;
	output wire io_requestor_0_pmp_5_cfg_w;
	output wire io_requestor_0_pmp_5_cfg_r;
	output wire [29:0] io_requestor_0_pmp_5_addr;
	output wire [31:0] io_requestor_0_pmp_5_mask;
	output wire io_requestor_0_pmp_6_cfg_l;
	output wire [1:0] io_requestor_0_pmp_6_cfg_a;
	output wire io_requestor_0_pmp_6_cfg_x;
	output wire io_requestor_0_pmp_6_cfg_w;
	output wire io_requestor_0_pmp_6_cfg_r;
	output wire [29:0] io_requestor_0_pmp_6_addr;
	output wire [31:0] io_requestor_0_pmp_6_mask;
	output wire io_requestor_0_pmp_7_cfg_l;
	output wire [1:0] io_requestor_0_pmp_7_cfg_a;
	output wire io_requestor_0_pmp_7_cfg_x;
	output wire io_requestor_0_pmp_7_cfg_w;
	output wire io_requestor_0_pmp_7_cfg_r;
	output wire [29:0] io_requestor_0_pmp_7_addr;
	output wire [31:0] io_requestor_0_pmp_7_mask;
	output wire io_requestor_1_req_ready;
	input io_requestor_1_req_valid;
	input [26:0] io_requestor_1_req_bits_bits_addr;
	input io_requestor_1_req_bits_bits_need_gpa;
	output wire io_requestor_1_resp_valid;
	output wire io_requestor_1_resp_bits_ae_ptw;
	output wire io_requestor_1_resp_bits_ae_final;
	output wire io_requestor_1_resp_bits_pf;
	output wire io_requestor_1_resp_bits_gf;
	output wire io_requestor_1_resp_bits_hr;
	output wire io_requestor_1_resp_bits_hw;
	output wire io_requestor_1_resp_bits_hx;
	output wire [43:0] io_requestor_1_resp_bits_pte_ppn;
	output wire io_requestor_1_resp_bits_pte_d;
	output wire io_requestor_1_resp_bits_pte_a;
	output wire io_requestor_1_resp_bits_pte_g;
	output wire io_requestor_1_resp_bits_pte_u;
	output wire io_requestor_1_resp_bits_pte_x;
	output wire io_requestor_1_resp_bits_pte_w;
	output wire io_requestor_1_resp_bits_pte_r;
	output wire io_requestor_1_resp_bits_pte_v;
	output wire [1:0] io_requestor_1_resp_bits_level;
	output wire io_requestor_1_resp_bits_homogeneous;
	output wire [3:0] io_requestor_1_ptbr_mode;
	output wire io_requestor_1_status_debug;
	output wire [1:0] io_requestor_1_status_prv;
	output wire io_requestor_1_pmp_0_cfg_l;
	output wire [1:0] io_requestor_1_pmp_0_cfg_a;
	output wire io_requestor_1_pmp_0_cfg_x;
	output wire io_requestor_1_pmp_0_cfg_w;
	output wire io_requestor_1_pmp_0_cfg_r;
	output wire [29:0] io_requestor_1_pmp_0_addr;
	output wire [31:0] io_requestor_1_pmp_0_mask;
	output wire io_requestor_1_pmp_1_cfg_l;
	output wire [1:0] io_requestor_1_pmp_1_cfg_a;
	output wire io_requestor_1_pmp_1_cfg_x;
	output wire io_requestor_1_pmp_1_cfg_w;
	output wire io_requestor_1_pmp_1_cfg_r;
	output wire [29:0] io_requestor_1_pmp_1_addr;
	output wire [31:0] io_requestor_1_pmp_1_mask;
	output wire io_requestor_1_pmp_2_cfg_l;
	output wire [1:0] io_requestor_1_pmp_2_cfg_a;
	output wire io_requestor_1_pmp_2_cfg_x;
	output wire io_requestor_1_pmp_2_cfg_w;
	output wire io_requestor_1_pmp_2_cfg_r;
	output wire [29:0] io_requestor_1_pmp_2_addr;
	output wire [31:0] io_requestor_1_pmp_2_mask;
	output wire io_requestor_1_pmp_3_cfg_l;
	output wire [1:0] io_requestor_1_pmp_3_cfg_a;
	output wire io_requestor_1_pmp_3_cfg_x;
	output wire io_requestor_1_pmp_3_cfg_w;
	output wire io_requestor_1_pmp_3_cfg_r;
	output wire [29:0] io_requestor_1_pmp_3_addr;
	output wire [31:0] io_requestor_1_pmp_3_mask;
	output wire io_requestor_1_pmp_4_cfg_l;
	output wire [1:0] io_requestor_1_pmp_4_cfg_a;
	output wire io_requestor_1_pmp_4_cfg_x;
	output wire io_requestor_1_pmp_4_cfg_w;
	output wire io_requestor_1_pmp_4_cfg_r;
	output wire [29:0] io_requestor_1_pmp_4_addr;
	output wire [31:0] io_requestor_1_pmp_4_mask;
	output wire io_requestor_1_pmp_5_cfg_l;
	output wire [1:0] io_requestor_1_pmp_5_cfg_a;
	output wire io_requestor_1_pmp_5_cfg_x;
	output wire io_requestor_1_pmp_5_cfg_w;
	output wire io_requestor_1_pmp_5_cfg_r;
	output wire [29:0] io_requestor_1_pmp_5_addr;
	output wire [31:0] io_requestor_1_pmp_5_mask;
	output wire io_requestor_1_pmp_6_cfg_l;
	output wire [1:0] io_requestor_1_pmp_6_cfg_a;
	output wire io_requestor_1_pmp_6_cfg_x;
	output wire io_requestor_1_pmp_6_cfg_w;
	output wire io_requestor_1_pmp_6_cfg_r;
	output wire [29:0] io_requestor_1_pmp_6_addr;
	output wire [31:0] io_requestor_1_pmp_6_mask;
	output wire io_requestor_1_pmp_7_cfg_l;
	output wire [1:0] io_requestor_1_pmp_7_cfg_a;
	output wire io_requestor_1_pmp_7_cfg_x;
	output wire io_requestor_1_pmp_7_cfg_w;
	output wire io_requestor_1_pmp_7_cfg_r;
	output wire [29:0] io_requestor_1_pmp_7_addr;
	output wire [31:0] io_requestor_1_pmp_7_mask;
	input io_mem_req_ready;
	output wire io_mem_req_valid;
	output wire [39:0] io_mem_req_bits_addr;
	output wire io_mem_s1_kill;
	input io_mem_s2_nack;
	input io_mem_resp_valid;
	input [63:0] io_mem_resp_bits_data;
	input io_mem_s2_xcpt_ae_ld;
	input [3:0] io_dpath_ptbr_mode;
	input [43:0] io_dpath_ptbr_ppn;
	input io_dpath_sfence_valid;
	input io_dpath_sfence_bits_rs1;
	input io_dpath_sfence_bits_rs2;
	input [38:0] io_dpath_sfence_bits_addr;
	input io_dpath_status_debug;
	input [1:0] io_dpath_status_dprv;
	input [1:0] io_dpath_status_prv;
	input io_dpath_status_mxr;
	input io_dpath_status_sum;
	input io_dpath_pmp_0_cfg_l;
	input [1:0] io_dpath_pmp_0_cfg_a;
	input io_dpath_pmp_0_cfg_x;
	input io_dpath_pmp_0_cfg_w;
	input io_dpath_pmp_0_cfg_r;
	input [29:0] io_dpath_pmp_0_addr;
	input [31:0] io_dpath_pmp_0_mask;
	input io_dpath_pmp_1_cfg_l;
	input [1:0] io_dpath_pmp_1_cfg_a;
	input io_dpath_pmp_1_cfg_x;
	input io_dpath_pmp_1_cfg_w;
	input io_dpath_pmp_1_cfg_r;
	input [29:0] io_dpath_pmp_1_addr;
	input [31:0] io_dpath_pmp_1_mask;
	input io_dpath_pmp_2_cfg_l;
	input [1:0] io_dpath_pmp_2_cfg_a;
	input io_dpath_pmp_2_cfg_x;
	input io_dpath_pmp_2_cfg_w;
	input io_dpath_pmp_2_cfg_r;
	input [29:0] io_dpath_pmp_2_addr;
	input [31:0] io_dpath_pmp_2_mask;
	input io_dpath_pmp_3_cfg_l;
	input [1:0] io_dpath_pmp_3_cfg_a;
	input io_dpath_pmp_3_cfg_x;
	input io_dpath_pmp_3_cfg_w;
	input io_dpath_pmp_3_cfg_r;
	input [29:0] io_dpath_pmp_3_addr;
	input [31:0] io_dpath_pmp_3_mask;
	input io_dpath_pmp_4_cfg_l;
	input [1:0] io_dpath_pmp_4_cfg_a;
	input io_dpath_pmp_4_cfg_x;
	input io_dpath_pmp_4_cfg_w;
	input io_dpath_pmp_4_cfg_r;
	input [29:0] io_dpath_pmp_4_addr;
	input [31:0] io_dpath_pmp_4_mask;
	input io_dpath_pmp_5_cfg_l;
	input [1:0] io_dpath_pmp_5_cfg_a;
	input io_dpath_pmp_5_cfg_x;
	input io_dpath_pmp_5_cfg_w;
	input io_dpath_pmp_5_cfg_r;
	input [29:0] io_dpath_pmp_5_addr;
	input [31:0] io_dpath_pmp_5_mask;
	input io_dpath_pmp_6_cfg_l;
	input [1:0] io_dpath_pmp_6_cfg_a;
	input io_dpath_pmp_6_cfg_x;
	input io_dpath_pmp_6_cfg_w;
	input io_dpath_pmp_6_cfg_r;
	input [29:0] io_dpath_pmp_6_addr;
	input [31:0] io_dpath_pmp_6_mask;
	input io_dpath_pmp_7_cfg_l;
	input [1:0] io_dpath_pmp_7_cfg_a;
	input io_dpath_pmp_7_cfg_x;
	input io_dpath_pmp_7_cfg_w;
	input io_dpath_pmp_7_cfg_r;
	input [29:0] io_dpath_pmp_7_addr;
	input [31:0] io_dpath_pmp_7_mask;
	output wire io_dpath_perf_l2miss;
	wire [8:0] _s1_rdata_T;
	wire readEnable;
	wire writeEnable;
	wire [8:0] writeAddr;
	reg l2_refill;
	wire [43:0] _r_pte_barrier_io_y_ppn;
	wire _r_pte_barrier_io_y_d;
	wire _r_pte_barrier_io_y_a;
	wire _r_pte_barrier_io_y_g;
	wire _r_pte_barrier_io_y_u;
	wire _r_pte_barrier_io_y_x;
	wire _r_pte_barrier_io_y_w;
	wire _r_pte_barrier_io_y_r;
	wire _r_pte_barrier_io_y_v;
	wire [2:0] _state_barrier_io_y;
	wire [44:0] _l2_tlb_ram_0_ext_RW0_rdata;
	wire _arb_io_out_valid;
	wire _arb_io_out_bits_valid;
	wire [26:0] _arb_io_out_bits_bits_addr;
	wire _arb_io_out_bits_bits_need_gpa;
	wire [1:0] _arb_io_chosen;
	reg [2:0] state;
	wire _arb_io_out_ready_T_2 = ~(|state) & ~l2_refill;
	reg resp_valid_0;
	reg resp_valid_1;
	reg invalidated;
	reg [1:0] count;
	reg resp_ae_ptw;
	reg resp_ae_final;
	reg resp_pf;
	reg resp_gf;
	reg resp_hr;
	reg resp_hw;
	reg resp_hx;
	reg [26:0] r_req_addr;
	reg r_req_need_gpa;
	reg [1:0] r_req_dest;
	reg [43:0] r_pte_ppn;
	reg r_pte_d;
	reg r_pte_a;
	reg r_pte_g;
	reg r_pte_u;
	reg r_pte_x;
	reg r_pte_w;
	reg r_pte_r;
	reg r_pte_v;
	reg stage2;
	reg mem_resp_valid;
	reg [63:0] mem_resp_data;
	wire pte_v = ~(((mem_resp_data[1] | mem_resp_data[2]) | mem_resp_data[3]) & ((~count[1] & |mem_resp_data[18:10]) | ((count == 2'h0) & |mem_resp_data[27:19]))) & mem_resp_data[0];
	wire _resp_ae_ptw_T_14 = mem_resp_data[63:54] == 10'h000;
	wire traverse = ((((((((pte_v & ~mem_resp_data[1]) & ~mem_resp_data[2]) & ~mem_resp_data[3]) & ~mem_resp_data[7]) & ~mem_resp_data[6]) & ~mem_resp_data[4]) & _resp_ae_ptw_T_14) & ~(|mem_resp_data[53:30])) & ~count[1];
	wire _leaf_T_5 = count == 2'h1;
	wire _leaf_T_8 = count == 2'h2;
	wire _GEN = &count | _leaf_T_8;
	wire _r_pte_T_6 = state == 3'h1;
	reg [511:0] g_0;
	reg [511:0] valid_0;
	assign writeAddr = r_req_addr[8:0];
	assign writeEnable = l2_refill & ~invalidated;
	wire _r_pte_T_25 = _arb_io_out_ready_T_2 & _arb_io_out_valid;
	assign readEnable = ~l2_refill & _r_pte_T_25;
	reg s1_valid;
	reg s2_valid;
	assign _s1_rdata_T = _arb_io_out_bits_bits_addr[8:0];
	reg [44:0] r;
	reg s2_valid_vec;
	reg s2_g_vec_0;
	wire l2_error = s2_valid_vec & ^r;
	wire s2_hit_vec_0 = s2_valid_vec & (r_req_addr[26:9] == r[43:26]);
	wire l2_hit = s2_valid & s2_hit_vec_0;
	wire [55:0] _pmpHomogeneous_T = {r_pte_ppn, 12'h000};
	wire [29:0] _GEN_0 = {r_pte_ppn[43:16], ~r_pte_ppn[15:14]};
	wire [26:0] _GEN_1 = {r_pte_ppn[43:19], ~r_pte_ppn[18:17]};
	wire [31:0] _GEN_2 = {r_pte_ppn[19:0], 12'h000};
	wire [27:0] _GEN_3 = {r_pte_ppn[43:20], r_pte_ppn[19:16] ^ 4'h8};
	wire [55:0] _GEN_4 = {24'h000000, io_dpath_pmp_0_addr, 2'h0};
	wire [31:0] pmpHomogeneous_pgMask = (_GEN ? 32'hfffff000 : (_leaf_T_5 ? 32'hffe00000 : 32'hc0000000));
	wire [55:0] _GEN_5 = {24'h000000, io_dpath_pmp_1_addr, 2'h0};
	wire [31:0] pmpHomogeneous_pgMask_1 = (_GEN ? 32'hfffff000 : (_leaf_T_5 ? 32'hffe00000 : 32'hc0000000));
	wire [31:0] _GEN_6 = _GEN_2 & pmpHomogeneous_pgMask_1;
	wire [55:0] _GEN_7 = {24'h000000, io_dpath_pmp_2_addr, 2'h0};
	wire [31:0] pmpHomogeneous_pgMask_2 = (_GEN ? 32'hfffff000 : (_leaf_T_5 ? 32'hffe00000 : 32'hc0000000));
	wire [31:0] _GEN_8 = _GEN_2 & pmpHomogeneous_pgMask_2;
	wire [55:0] _GEN_9 = {24'h000000, io_dpath_pmp_3_addr, 2'h0};
	wire [31:0] pmpHomogeneous_pgMask_3 = (_GEN ? 32'hfffff000 : (_leaf_T_5 ? 32'hffe00000 : 32'hc0000000));
	wire [31:0] _GEN_10 = _GEN_2 & pmpHomogeneous_pgMask_3;
	wire [55:0] _GEN_11 = {24'h000000, io_dpath_pmp_4_addr, 2'h0};
	wire [31:0] pmpHomogeneous_pgMask_4 = (_GEN ? 32'hfffff000 : (_leaf_T_5 ? 32'hffe00000 : 32'hc0000000));
	wire [31:0] _GEN_12 = _GEN_2 & pmpHomogeneous_pgMask_4;
	wire [55:0] _GEN_13 = {24'h000000, io_dpath_pmp_5_addr, 2'h0};
	wire [31:0] pmpHomogeneous_pgMask_5 = (_GEN ? 32'hfffff000 : (_leaf_T_5 ? 32'hffe00000 : 32'hc0000000));
	wire [31:0] _GEN_14 = _GEN_2 & pmpHomogeneous_pgMask_5;
	wire [55:0] _GEN_15 = {24'h000000, io_dpath_pmp_6_addr, 2'h0};
	wire [31:0] pmpHomogeneous_pgMask_6 = (_GEN ? 32'hfffff000 : (_leaf_T_5 ? 32'hffe00000 : 32'hc0000000));
	wire [31:0] _GEN_16 = _GEN_2 & pmpHomogeneous_pgMask_6;
	wire [31:0] pmpHomogeneous_pgMask_7 = (_GEN ? 32'hfffff000 : (_leaf_T_5 ? 32'hffe00000 : 32'hc0000000));
	wire [31:0] _GEN_17 = _GEN_2 & pmpHomogeneous_pgMask_7;
	wire homogeneous = ((((((((_GEN ? ((((((r_pte_ppn == 44'h00000000000) | ({r_pte_ppn[43:2], ~r_pte_ppn[1:0]} == 44'h00000000000)) | ({r_pte_ppn[43:5], ~r_pte_ppn[4]} == 40'h0000000000)) | ({r_pte_ppn[43:14], r_pte_ppn[13:4] ^ 10'h200} == 40'h0000000000)) | (_GEN_0 == 30'h00000000)) | (_GEN_1 == 27'h0000000)) | (_GEN_3 == 28'h0000000) : _leaf_T_5 & (((_GEN_0 == 30'h00000000) | (_GEN_1 == 27'h0000000)) | (_GEN_3 == 28'h0000000))) & (io_dpath_pmp_0_cfg_a[1] ? (_GEN ? io_dpath_pmp_0_mask[11] : (_leaf_T_5 ? io_dpath_pmp_0_mask[20] : io_dpath_pmp_0_mask[29])) | (_GEN ? |{r_pte_ppn[43:20], r_pte_ppn[19:0] ^ io_dpath_pmp_0_addr[29:10]} : (_leaf_T_5 ? |{r_pte_ppn[43:20], r_pte_ppn[19:9] ^ io_dpath_pmp_0_addr[29:19]} : |{r_pte_ppn[43:20], r_pte_ppn[19:18] ^ io_dpath_pmp_0_addr[29:28]})) : (~io_dpath_pmp_0_cfg_a[0] | (_pmpHomogeneous_T >= _GEN_4)) | ((_GEN_2 & pmpHomogeneous_pgMask) < ({io_dpath_pmp_0_addr, 2'h0} & pmpHomogeneous_pgMask)))) & (io_dpath_pmp_1_cfg_a[1] ? (_GEN ? io_dpath_pmp_1_mask[11] : (_leaf_T_5 ? io_dpath_pmp_1_mask[20] : io_dpath_pmp_1_mask[29])) | (_GEN ? |{r_pte_ppn[43:20], r_pte_ppn[19:0] ^ io_dpath_pmp_1_addr[29:10]} : (_leaf_T_5 ? |{r_pte_ppn[43:20], r_pte_ppn[19:9] ^ io_dpath_pmp_1_addr[29:19]} : |{r_pte_ppn[43:20], r_pte_ppn[19:18] ^ io_dpath_pmp_1_addr[29:28]})) : ((~io_dpath_pmp_1_cfg_a[0] | (_GEN_6 < ({io_dpath_pmp_0_addr, 2'h0} & pmpHomogeneous_pgMask_1))) | (_pmpHomogeneous_T >= _GEN_5)) | ((_pmpHomogeneous_T >= _GEN_4) & (_GEN_6 < ({io_dpath_pmp_1_addr, 2'h0} & pmpHomogeneous_pgMask_1))))) & (io_dpath_pmp_2_cfg_a[1] ? (_GEN ? io_dpath_pmp_2_mask[11] : (_leaf_T_5 ? io_dpath_pmp_2_mask[20] : io_dpath_pmp_2_mask[29])) | (_GEN ? |{r_pte_ppn[43:20], r_pte_ppn[19:0] ^ io_dpath_pmp_2_addr[29:10]} : (_leaf_T_5 ? |{r_pte_ppn[43:20], r_pte_ppn[19:9] ^ io_dpath_pmp_2_addr[29:19]} : |{r_pte_ppn[43:20], r_pte_ppn[19:18] ^ io_dpath_pmp_2_addr[29:28]})) : ((~io_dpath_pmp_2_cfg_a[0] | (_GEN_8 < ({io_dpath_pmp_1_addr, 2'h0} & pmpHomogeneous_pgMask_2))) | (_pmpHomogeneous_T >= _GEN_7)) | ((_pmpHomogeneous_T >= _GEN_5) & (_GEN_8 < ({io_dpath_pmp_2_addr, 2'h0} & pmpHomogeneous_pgMask_2))))) & (io_dpath_pmp_3_cfg_a[1] ? (_GEN ? io_dpath_pmp_3_mask[11] : (_leaf_T_5 ? io_dpath_pmp_3_mask[20] : io_dpath_pmp_3_mask[29])) | (_GEN ? |{r_pte_ppn[43:20], r_pte_ppn[19:0] ^ io_dpath_pmp_3_addr[29:10]} : (_leaf_T_5 ? |{r_pte_ppn[43:20], r_pte_ppn[19:9] ^ io_dpath_pmp_3_addr[29:19]} : |{r_pte_ppn[43:20], r_pte_ppn[19:18] ^ io_dpath_pmp_3_addr[29:28]})) : ((~io_dpath_pmp_3_cfg_a[0] | (_GEN_10 < ({io_dpath_pmp_2_addr, 2'h0} & pmpHomogeneous_pgMask_3))) | (_pmpHomogeneous_T >= _GEN_9)) | ((_pmpHomogeneous_T >= _GEN_7) & (_GEN_10 < ({io_dpath_pmp_3_addr, 2'h0} & pmpHomogeneous_pgMask_3))))) & (io_dpath_pmp_4_cfg_a[1] ? (_GEN ? io_dpath_pmp_4_mask[11] : (_leaf_T_5 ? io_dpath_pmp_4_mask[20] : io_dpath_pmp_4_mask[29])) | (_GEN ? |{r_pte_ppn[43:20], r_pte_ppn[19:0] ^ io_dpath_pmp_4_addr[29:10]} : (_leaf_T_5 ? |{r_pte_ppn[43:20], r_pte_ppn[19:9] ^ io_dpath_pmp_4_addr[29:19]} : |{r_pte_ppn[43:20], r_pte_ppn[19:18] ^ io_dpath_pmp_4_addr[29:28]})) : ((~io_dpath_pmp_4_cfg_a[0] | (_GEN_12 < ({io_dpath_pmp_3_addr, 2'h0} & pmpHomogeneous_pgMask_4))) | (_pmpHomogeneous_T >= _GEN_11)) | ((_pmpHomogeneous_T >= _GEN_9) & (_GEN_12 < ({io_dpath_pmp_4_addr, 2'h0} & pmpHomogeneous_pgMask_4))))) & (io_dpath_pmp_5_cfg_a[1] ? (_GEN ? io_dpath_pmp_5_mask[11] : (_leaf_T_5 ? io_dpath_pmp_5_mask[20] : io_dpath_pmp_5_mask[29])) | (_GEN ? |{r_pte_ppn[43:20], r_pte_ppn[19:0] ^ io_dpath_pmp_5_addr[29:10]} : (_leaf_T_5 ? |{r_pte_ppn[43:20], r_pte_ppn[19:9] ^ io_dpath_pmp_5_addr[29:19]} : |{r_pte_ppn[43:20], r_pte_ppn[19:18] ^ io_dpath_pmp_5_addr[29:28]})) : ((~io_dpath_pmp_5_cfg_a[0] | (_GEN_14 < ({io_dpath_pmp_4_addr, 2'h0} & pmpHomogeneous_pgMask_5))) | (_pmpHomogeneous_T >= _GEN_13)) | ((_pmpHomogeneous_T >= _GEN_11) & (_GEN_14 < ({io_dpath_pmp_5_addr, 2'h0} & pmpHomogeneous_pgMask_5))))) & (io_dpath_pmp_6_cfg_a[1] ? (_GEN ? io_dpath_pmp_6_mask[11] : (_leaf_T_5 ? io_dpath_pmp_6_mask[20] : io_dpath_pmp_6_mask[29])) | (_GEN ? |{r_pte_ppn[43:20], r_pte_ppn[19:0] ^ io_dpath_pmp_6_addr[29:10]} : (_leaf_T_5 ? |{r_pte_ppn[43:20], r_pte_ppn[19:9] ^ io_dpath_pmp_6_addr[29:19]} : |{r_pte_ppn[43:20], r_pte_ppn[19:18] ^ io_dpath_pmp_6_addr[29:28]})) : ((~io_dpath_pmp_6_cfg_a[0] | (_GEN_16 < ({io_dpath_pmp_5_addr, 2'h0} & pmpHomogeneous_pgMask_6))) | (_pmpHomogeneous_T >= _GEN_15)) | ((_pmpHomogeneous_T >= _GEN_13) & (_GEN_16 < ({io_dpath_pmp_6_addr, 2'h0} & pmpHomogeneous_pgMask_6))))) & (io_dpath_pmp_7_cfg_a[1] ? (_GEN ? io_dpath_pmp_7_mask[11] : (_leaf_T_5 ? io_dpath_pmp_7_mask[20] : io_dpath_pmp_7_mask[29])) | (_GEN ? |{r_pte_ppn[43:20], r_pte_ppn[19:0] ^ io_dpath_pmp_7_addr[29:10]} : (_leaf_T_5 ? |{r_pte_ppn[43:20], r_pte_ppn[19:9] ^ io_dpath_pmp_7_addr[29:19]} : |{r_pte_ppn[43:20], r_pte_ppn[19:18] ^ io_dpath_pmp_7_addr[29:28]})) : ((~io_dpath_pmp_7_cfg_a[0] | (_GEN_17 < ({io_dpath_pmp_6_addr, 2'h0} & pmpHomogeneous_pgMask_7))) | (_pmpHomogeneous_T >= {24'h000000, io_dpath_pmp_7_addr, 2'h0})) | ((_pmpHomogeneous_T >= _GEN_15) & (_GEN_17 < ({io_dpath_pmp_7_addr, 2'h0} & pmpHomogeneous_pgMask_7))));
	wire _GEN_18 = ~(|state) & _r_pte_T_25;
	wire _GEN_19 = state == 3'h1;
	wire _GEN_20 = state == 3'h2;
	wire _GEN_21 = state == 3'h4;
	wire _r_pte_T_3 = (l2_hit & ~l2_error) & ~resp_gf;
	wire _GEN_22 = (l2_hit & ~l2_error) & ~resp_gf;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg [511:0] _GEN_23;
		reg [511:0] mask;
		reg _GEN_24;
		reg _GEN_25;
		reg _GEN_26;
		reg _GEN_27;
		reg _GEN_28;
		reg _GEN_29;
		reg _gf_T_10;
		reg ae;
		reg pf;
		reg _GEN_30;
		_GEN_23 = {503'h0, writeAddr};
		mask = 512'h1 << _GEN_23;
		_GEN_24 = r_req_dest == 2'h0;
		_GEN_25 = r_req_dest == 2'h1;
		_GEN_26 = |state & (_GEN_19 ? resp_gf & _GEN_24 : ~_GEN_20 & (_GEN_21 ? io_mem_s2_xcpt_ae_ld & _GEN_24 : &state & _GEN_24));
		_GEN_27 = |state & (_GEN_19 ? resp_gf & _GEN_25 : ~_GEN_20 & (_GEN_21 ? io_mem_s2_xcpt_ae_ld & _GEN_25 : &state & _GEN_25));
		_GEN_28 = _GEN_22 & _GEN_24;
		_GEN_29 = _GEN_22 & _GEN_25;
		_gf_T_10 = stage2 & ~((((pte_v & (mem_resp_data[1] | (mem_resp_data[3] & ~mem_resp_data[2]))) & mem_resp_data[6]) & mem_resp_data[1]) & mem_resp_data[4]);
		ae = pte_v & |mem_resp_data[53:30];
		pf = pte_v & |mem_resp_data[63:54];
		_GEN_30 = ~mem_resp_valid | traverse;
		if (reset) begin
			state <= 3'h0;
			valid_0 <= 512'h0;
		end
		else begin
			state <= _state_barrier_io_y;
			if (s2_valid & l2_error)
				valid_0 <= 512'h0;
			else if (io_dpath_sfence_valid) begin
				if (io_dpath_sfence_bits_rs1)
					valid_0 <= valid_0 & ~(512'h1 << io_dpath_sfence_bits_addr[20:12]);
				else if (io_dpath_sfence_bits_rs2)
					valid_0 <= valid_0 & g_0;
				else
					valid_0 <= 512'h0;
			end
			else
				valid_0 <= ({512 {writeEnable}} & mask) | valid_0;
		end
		resp_valid_0 <= (_GEN_30 ? _GEN_28 | _GEN_26 : (_GEN_24 | _GEN_28) | _GEN_26);
		resp_valid_1 <= (_GEN_30 ? _GEN_29 | _GEN_27 : (_GEN_25 | _GEN_29) | _GEN_27);
		invalidated <= io_dpath_sfence_valid | (invalidated & |state);
		if (mem_resp_valid) begin
			if (traverse)
				count <= count + 2'h1;
		end
		else if (_GEN_22)
			count <= 2'h2;
		else if (|state) begin
			if (((_GEN_19 | _GEN_20) | _GEN_21) | ~(&state & ~homogeneous))
				;
			else
				count <= 2'h2;
		end
		else if (_r_pte_T_25)
			count <= 2'h0;
		if (_GEN_30) begin
			if (|state)
				resp_ae_ptw <= ((~(_GEN_19 | _GEN_20) & _GEN_21) & io_mem_s2_xcpt_ae_ld) | resp_ae_ptw;
			else
				resp_ae_ptw <= ~_r_pte_T_25 & resp_ae_ptw;
			resp_ae_final <= ~_GEN_18 & resp_ae_final;
			resp_pf <= ~_GEN_18 & resp_pf;
			resp_gf <= ~_GEN_18 & resp_gf;
			resp_hr <= _GEN_18 | resp_hr;
			resp_hw <= _GEN_18 | resp_hw;
			resp_hx <= _GEN_18 | resp_hx;
		end
		else begin
			resp_ae_ptw <= ((((((((ae & ~count[1]) & pte_v) & ~mem_resp_data[1]) & ~mem_resp_data[2]) & ~mem_resp_data[3]) & ~mem_resp_data[7]) & ~mem_resp_data[6]) & ~mem_resp_data[4]) & _resp_ae_ptw_T_14;
			resp_ae_final <= ((ae & pte_v) & (mem_resp_data[1] | (mem_resp_data[3] & ~mem_resp_data[2]))) & mem_resp_data[6];
			resp_pf <= pf & ~stage2;
			resp_gf <= _gf_T_10 | (pf & stage2);
			resp_hr <= ~stage2 | ((((((~pf & ~_gf_T_10) & pte_v) & (mem_resp_data[1] | (mem_resp_data[3] & ~mem_resp_data[2]))) & mem_resp_data[6]) & mem_resp_data[1]) & mem_resp_data[4]);
			resp_hw <= ~stage2 | (((((((~pf & ~_gf_T_10) & pte_v) & (mem_resp_data[1] | (mem_resp_data[3] & ~mem_resp_data[2]))) & mem_resp_data[6]) & mem_resp_data[2]) & mem_resp_data[7]) & mem_resp_data[4]);
			resp_hx <= ~stage2 | ((((((~pf & ~_gf_T_10) & pte_v) & (mem_resp_data[1] | (mem_resp_data[3] & ~mem_resp_data[2]))) & mem_resp_data[6]) & mem_resp_data[3]) & mem_resp_data[4]);
		end
		if (_GEN_18) begin
			r_req_addr <= _arb_io_out_bits_bits_addr;
			r_req_need_gpa <= _arb_io_out_bits_bits_need_gpa;
			r_req_dest <= _arb_io_chosen;
		end
		r_pte_ppn <= _r_pte_barrier_io_y_ppn;
		r_pte_d <= _r_pte_barrier_io_y_d;
		r_pte_a <= _r_pte_barrier_io_y_a;
		r_pte_g <= _r_pte_barrier_io_y_g;
		r_pte_u <= _r_pte_barrier_io_y_u;
		r_pte_x <= _r_pte_barrier_io_y_x;
		r_pte_w <= _r_pte_barrier_io_y_w;
		r_pte_r <= _r_pte_barrier_io_y_r;
		r_pte_v <= _r_pte_barrier_io_y_v;
		stage2 <= ~_GEN_18 & stage2;
		mem_resp_valid <= io_mem_resp_valid;
		mem_resp_data <= io_mem_resp_bits_data;
		l2_refill <= ((((((mem_resp_valid & ~traverse) & pte_v) & ~ae) & ~pf) & ~_gf_T_10) & _leaf_T_8) & ~r_req_need_gpa;
		if (writeEnable) begin
			if (r_pte_g)
				g_0 <= g_0 | mask;
			else
				g_0 <= g_0 & ~mask;
		end
		s1_valid <= (readEnable & ~_arb_io_out_bits_bits_need_gpa) & _arb_io_out_bits_valid;
		s2_valid <= s1_valid;
		if (s1_valid) begin : sv2v_autoblock_2
			reg [511:0] _r_valid_vec_T;
			reg [511:0] _s2_g_vec_T;
			r <= _l2_tlb_ram_0_ext_RW0_rdata;
			_r_valid_vec_T = valid_0 >> _GEN_23;
			s2_valid_vec <= _r_valid_vec_T[0];
			_s2_g_vec_T = g_0 >> _GEN_23;
			s2_g_vec_0 <= _s2_g_vec_T[0];
		end
	end
	Arbiter3_Valid_PTWReq arb(
		.io_in_0_ready(io_requestor_0_req_ready),
		.io_in_0_valid(io_requestor_0_req_valid),
		.io_in_0_bits_valid(io_requestor_0_req_bits_valid),
		.io_in_0_bits_bits_addr(io_requestor_0_req_bits_bits_addr),
		.io_in_1_ready(io_requestor_1_req_ready),
		.io_in_1_valid(io_requestor_1_req_valid),
		.io_in_1_bits_bits_addr(io_requestor_1_req_bits_bits_addr),
		.io_in_1_bits_bits_need_gpa(io_requestor_1_req_bits_bits_need_gpa),
		.io_out_ready(_arb_io_out_ready_T_2),
		.io_out_valid(_arb_io_out_valid),
		.io_out_bits_valid(_arb_io_out_bits_valid),
		.io_out_bits_bits_addr(_arb_io_out_bits_bits_addr),
		.io_out_bits_bits_need_gpa(_arb_io_out_bits_bits_need_gpa),
		.io_chosen(_arb_io_chosen)
	);
	l2_tlb_ram_0_512x45 l2_tlb_ram_0_ext(
		.RW0_addr((writeEnable ? writeAddr : _s1_rdata_T)),
		.RW0_en(readEnable | writeEnable),
		.RW0_clk(clock),
		.RW0_wmode(l2_refill),
		.RW0_wdata({^{r_req_addr[26:9], r_pte_ppn[19:0], r_pte_d, r_pte_a, r_pte_u, r_pte_x, r_pte_w, r_pte_r}, r_req_addr[26:9], r_pte_ppn[19:0], r_pte_d, r_pte_a, r_pte_u, r_pte_x, r_pte_w, r_pte_r}),
		.RW0_rdata(_l2_tlb_ram_0_ext_RW0_rdata)
	);
	OptimizationBarrier_UInt state_barrier(
		.io_x((io_mem_s2_nack ? 3'h1 : (mem_resp_valid ? {2'h0, traverse} : (_GEN_22 ? 3'h0 : (|state ? (_GEN_19 ? (resp_gf ? 3'h0 : (io_mem_req_ready ? 3'h2 : 3'h1)) : (_GEN_20 ? (l2_hit ? 3'h1 : 3'h4) : (_GEN_21 ? (io_mem_s2_xcpt_ae_ld ? 3'h0 : 3'h5) : (&state ? 3'h0 : state)))) : (_r_pte_T_25 ? {2'h0, _arb_io_out_bits_valid} : state)))))),
		.io_y(_state_barrier_io_y)
	);
	OptimizationBarrier_PTE r_pte_barrier(
		.io_x_ppn((_r_pte_T_3 ? {24'h000000, r[25:6]} : (mem_resp_valid ? {24'h000000, mem_resp_data[29:10]} : ((&state & ~homogeneous) & (count != 2'h2) ? (count[0] ? {r_pte_ppn[43:9], r_req_addr[8:0]} : {r_pte_ppn[43:18], r_req_addr[17:0]}) : (_r_pte_T_25 ? io_dpath_ptbr_ppn : r_pte_ppn))))),
		.io_x_d((_r_pte_T_3 ? r[5] : (mem_resp_valid ? mem_resp_data[7] : r_pte_d))),
		.io_x_a((_r_pte_T_3 ? r[4] : (mem_resp_valid ? mem_resp_data[6] : r_pte_a))),
		.io_x_g((_r_pte_T_3 ? s2_g_vec_0 : (mem_resp_valid ? mem_resp_data[5] : r_pte_g))),
		.io_x_u((_r_pte_T_3 ? r[3] : (mem_resp_valid ? mem_resp_data[4] : r_pte_u))),
		.io_x_x((_r_pte_T_3 ? r[2] : (mem_resp_valid ? mem_resp_data[3] : r_pte_x))),
		.io_x_w((_r_pte_T_3 ? r[1] : (mem_resp_valid ? mem_resp_data[2] : r_pte_w))),
		.io_x_r((_r_pte_T_3 ? r[0] : (mem_resp_valid ? mem_resp_data[1] : r_pte_r))),
		.io_x_v(_r_pte_T_3 | (mem_resp_valid ? pte_v : r_pte_v)),
		.io_y_ppn(_r_pte_barrier_io_y_ppn),
		.io_y_d(_r_pte_barrier_io_y_d),
		.io_y_a(_r_pte_barrier_io_y_a),
		.io_y_g(_r_pte_barrier_io_y_g),
		.io_y_u(_r_pte_barrier_io_y_u),
		.io_y_x(_r_pte_barrier_io_y_x),
		.io_y_w(_r_pte_barrier_io_y_w),
		.io_y_r(_r_pte_barrier_io_y_r),
		.io_y_v(_r_pte_barrier_io_y_v)
	);
	assign io_requestor_0_resp_valid = resp_valid_0;
	assign io_requestor_0_resp_bits_ae_final = resp_ae_final;
	assign io_requestor_0_resp_bits_pte_ppn = r_pte_ppn;
	assign io_requestor_0_resp_bits_pte_d = r_pte_d;
	assign io_requestor_0_resp_bits_pte_a = r_pte_a;
	assign io_requestor_0_resp_bits_pte_g = r_pte_g;
	assign io_requestor_0_resp_bits_pte_u = r_pte_u;
	assign io_requestor_0_resp_bits_pte_x = r_pte_x;
	assign io_requestor_0_resp_bits_pte_w = r_pte_w;
	assign io_requestor_0_resp_bits_pte_r = r_pte_r;
	assign io_requestor_0_resp_bits_pte_v = r_pte_v;
	assign io_requestor_0_resp_bits_level = count;
	assign io_requestor_0_resp_bits_homogeneous = homogeneous;
	assign io_requestor_0_ptbr_mode = io_dpath_ptbr_mode;
	assign io_requestor_0_status_dprv = io_dpath_status_dprv;
	assign io_requestor_0_status_mxr = io_dpath_status_mxr;
	assign io_requestor_0_status_sum = io_dpath_status_sum;
	assign io_requestor_0_pmp_0_cfg_l = io_dpath_pmp_0_cfg_l;
	assign io_requestor_0_pmp_0_cfg_a = io_dpath_pmp_0_cfg_a;
	assign io_requestor_0_pmp_0_cfg_x = io_dpath_pmp_0_cfg_x;
	assign io_requestor_0_pmp_0_cfg_w = io_dpath_pmp_0_cfg_w;
	assign io_requestor_0_pmp_0_cfg_r = io_dpath_pmp_0_cfg_r;
	assign io_requestor_0_pmp_0_addr = io_dpath_pmp_0_addr;
	assign io_requestor_0_pmp_0_mask = io_dpath_pmp_0_mask;
	assign io_requestor_0_pmp_1_cfg_l = io_dpath_pmp_1_cfg_l;
	assign io_requestor_0_pmp_1_cfg_a = io_dpath_pmp_1_cfg_a;
	assign io_requestor_0_pmp_1_cfg_x = io_dpath_pmp_1_cfg_x;
	assign io_requestor_0_pmp_1_cfg_w = io_dpath_pmp_1_cfg_w;
	assign io_requestor_0_pmp_1_cfg_r = io_dpath_pmp_1_cfg_r;
	assign io_requestor_0_pmp_1_addr = io_dpath_pmp_1_addr;
	assign io_requestor_0_pmp_1_mask = io_dpath_pmp_1_mask;
	assign io_requestor_0_pmp_2_cfg_l = io_dpath_pmp_2_cfg_l;
	assign io_requestor_0_pmp_2_cfg_a = io_dpath_pmp_2_cfg_a;
	assign io_requestor_0_pmp_2_cfg_x = io_dpath_pmp_2_cfg_x;
	assign io_requestor_0_pmp_2_cfg_w = io_dpath_pmp_2_cfg_w;
	assign io_requestor_0_pmp_2_cfg_r = io_dpath_pmp_2_cfg_r;
	assign io_requestor_0_pmp_2_addr = io_dpath_pmp_2_addr;
	assign io_requestor_0_pmp_2_mask = io_dpath_pmp_2_mask;
	assign io_requestor_0_pmp_3_cfg_l = io_dpath_pmp_3_cfg_l;
	assign io_requestor_0_pmp_3_cfg_a = io_dpath_pmp_3_cfg_a;
	assign io_requestor_0_pmp_3_cfg_x = io_dpath_pmp_3_cfg_x;
	assign io_requestor_0_pmp_3_cfg_w = io_dpath_pmp_3_cfg_w;
	assign io_requestor_0_pmp_3_cfg_r = io_dpath_pmp_3_cfg_r;
	assign io_requestor_0_pmp_3_addr = io_dpath_pmp_3_addr;
	assign io_requestor_0_pmp_3_mask = io_dpath_pmp_3_mask;
	assign io_requestor_0_pmp_4_cfg_l = io_dpath_pmp_4_cfg_l;
	assign io_requestor_0_pmp_4_cfg_a = io_dpath_pmp_4_cfg_a;
	assign io_requestor_0_pmp_4_cfg_x = io_dpath_pmp_4_cfg_x;
	assign io_requestor_0_pmp_4_cfg_w = io_dpath_pmp_4_cfg_w;
	assign io_requestor_0_pmp_4_cfg_r = io_dpath_pmp_4_cfg_r;
	assign io_requestor_0_pmp_4_addr = io_dpath_pmp_4_addr;
	assign io_requestor_0_pmp_4_mask = io_dpath_pmp_4_mask;
	assign io_requestor_0_pmp_5_cfg_l = io_dpath_pmp_5_cfg_l;
	assign io_requestor_0_pmp_5_cfg_a = io_dpath_pmp_5_cfg_a;
	assign io_requestor_0_pmp_5_cfg_x = io_dpath_pmp_5_cfg_x;
	assign io_requestor_0_pmp_5_cfg_w = io_dpath_pmp_5_cfg_w;
	assign io_requestor_0_pmp_5_cfg_r = io_dpath_pmp_5_cfg_r;
	assign io_requestor_0_pmp_5_addr = io_dpath_pmp_5_addr;
	assign io_requestor_0_pmp_5_mask = io_dpath_pmp_5_mask;
	assign io_requestor_0_pmp_6_cfg_l = io_dpath_pmp_6_cfg_l;
	assign io_requestor_0_pmp_6_cfg_a = io_dpath_pmp_6_cfg_a;
	assign io_requestor_0_pmp_6_cfg_x = io_dpath_pmp_6_cfg_x;
	assign io_requestor_0_pmp_6_cfg_w = io_dpath_pmp_6_cfg_w;
	assign io_requestor_0_pmp_6_cfg_r = io_dpath_pmp_6_cfg_r;
	assign io_requestor_0_pmp_6_addr = io_dpath_pmp_6_addr;
	assign io_requestor_0_pmp_6_mask = io_dpath_pmp_6_mask;
	assign io_requestor_0_pmp_7_cfg_l = io_dpath_pmp_7_cfg_l;
	assign io_requestor_0_pmp_7_cfg_a = io_dpath_pmp_7_cfg_a;
	assign io_requestor_0_pmp_7_cfg_x = io_dpath_pmp_7_cfg_x;
	assign io_requestor_0_pmp_7_cfg_w = io_dpath_pmp_7_cfg_w;
	assign io_requestor_0_pmp_7_cfg_r = io_dpath_pmp_7_cfg_r;
	assign io_requestor_0_pmp_7_addr = io_dpath_pmp_7_addr;
	assign io_requestor_0_pmp_7_mask = io_dpath_pmp_7_mask;
	assign io_requestor_1_resp_valid = resp_valid_1;
	assign io_requestor_1_resp_bits_ae_ptw = resp_ae_ptw;
	assign io_requestor_1_resp_bits_ae_final = resp_ae_final;
	assign io_requestor_1_resp_bits_pf = resp_pf;
	assign io_requestor_1_resp_bits_gf = resp_gf;
	assign io_requestor_1_resp_bits_hr = resp_hr;
	assign io_requestor_1_resp_bits_hw = resp_hw;
	assign io_requestor_1_resp_bits_hx = resp_hx;
	assign io_requestor_1_resp_bits_pte_ppn = r_pte_ppn;
	assign io_requestor_1_resp_bits_pte_d = r_pte_d;
	assign io_requestor_1_resp_bits_pte_a = r_pte_a;
	assign io_requestor_1_resp_bits_pte_g = r_pte_g;
	assign io_requestor_1_resp_bits_pte_u = r_pte_u;
	assign io_requestor_1_resp_bits_pte_x = r_pte_x;
	assign io_requestor_1_resp_bits_pte_w = r_pte_w;
	assign io_requestor_1_resp_bits_pte_r = r_pte_r;
	assign io_requestor_1_resp_bits_pte_v = r_pte_v;
	assign io_requestor_1_resp_bits_level = count;
	assign io_requestor_1_resp_bits_homogeneous = homogeneous;
	assign io_requestor_1_ptbr_mode = io_dpath_ptbr_mode;
	assign io_requestor_1_status_debug = io_dpath_status_debug;
	assign io_requestor_1_status_prv = io_dpath_status_prv;
	assign io_requestor_1_pmp_0_cfg_l = io_dpath_pmp_0_cfg_l;
	assign io_requestor_1_pmp_0_cfg_a = io_dpath_pmp_0_cfg_a;
	assign io_requestor_1_pmp_0_cfg_x = io_dpath_pmp_0_cfg_x;
	assign io_requestor_1_pmp_0_cfg_w = io_dpath_pmp_0_cfg_w;
	assign io_requestor_1_pmp_0_cfg_r = io_dpath_pmp_0_cfg_r;
	assign io_requestor_1_pmp_0_addr = io_dpath_pmp_0_addr;
	assign io_requestor_1_pmp_0_mask = io_dpath_pmp_0_mask;
	assign io_requestor_1_pmp_1_cfg_l = io_dpath_pmp_1_cfg_l;
	assign io_requestor_1_pmp_1_cfg_a = io_dpath_pmp_1_cfg_a;
	assign io_requestor_1_pmp_1_cfg_x = io_dpath_pmp_1_cfg_x;
	assign io_requestor_1_pmp_1_cfg_w = io_dpath_pmp_1_cfg_w;
	assign io_requestor_1_pmp_1_cfg_r = io_dpath_pmp_1_cfg_r;
	assign io_requestor_1_pmp_1_addr = io_dpath_pmp_1_addr;
	assign io_requestor_1_pmp_1_mask = io_dpath_pmp_1_mask;
	assign io_requestor_1_pmp_2_cfg_l = io_dpath_pmp_2_cfg_l;
	assign io_requestor_1_pmp_2_cfg_a = io_dpath_pmp_2_cfg_a;
	assign io_requestor_1_pmp_2_cfg_x = io_dpath_pmp_2_cfg_x;
	assign io_requestor_1_pmp_2_cfg_w = io_dpath_pmp_2_cfg_w;
	assign io_requestor_1_pmp_2_cfg_r = io_dpath_pmp_2_cfg_r;
	assign io_requestor_1_pmp_2_addr = io_dpath_pmp_2_addr;
	assign io_requestor_1_pmp_2_mask = io_dpath_pmp_2_mask;
	assign io_requestor_1_pmp_3_cfg_l = io_dpath_pmp_3_cfg_l;
	assign io_requestor_1_pmp_3_cfg_a = io_dpath_pmp_3_cfg_a;
	assign io_requestor_1_pmp_3_cfg_x = io_dpath_pmp_3_cfg_x;
	assign io_requestor_1_pmp_3_cfg_w = io_dpath_pmp_3_cfg_w;
	assign io_requestor_1_pmp_3_cfg_r = io_dpath_pmp_3_cfg_r;
	assign io_requestor_1_pmp_3_addr = io_dpath_pmp_3_addr;
	assign io_requestor_1_pmp_3_mask = io_dpath_pmp_3_mask;
	assign io_requestor_1_pmp_4_cfg_l = io_dpath_pmp_4_cfg_l;
	assign io_requestor_1_pmp_4_cfg_a = io_dpath_pmp_4_cfg_a;
	assign io_requestor_1_pmp_4_cfg_x = io_dpath_pmp_4_cfg_x;
	assign io_requestor_1_pmp_4_cfg_w = io_dpath_pmp_4_cfg_w;
	assign io_requestor_1_pmp_4_cfg_r = io_dpath_pmp_4_cfg_r;
	assign io_requestor_1_pmp_4_addr = io_dpath_pmp_4_addr;
	assign io_requestor_1_pmp_4_mask = io_dpath_pmp_4_mask;
	assign io_requestor_1_pmp_5_cfg_l = io_dpath_pmp_5_cfg_l;
	assign io_requestor_1_pmp_5_cfg_a = io_dpath_pmp_5_cfg_a;
	assign io_requestor_1_pmp_5_cfg_x = io_dpath_pmp_5_cfg_x;
	assign io_requestor_1_pmp_5_cfg_w = io_dpath_pmp_5_cfg_w;
	assign io_requestor_1_pmp_5_cfg_r = io_dpath_pmp_5_cfg_r;
	assign io_requestor_1_pmp_5_addr = io_dpath_pmp_5_addr;
	assign io_requestor_1_pmp_5_mask = io_dpath_pmp_5_mask;
	assign io_requestor_1_pmp_6_cfg_l = io_dpath_pmp_6_cfg_l;
	assign io_requestor_1_pmp_6_cfg_a = io_dpath_pmp_6_cfg_a;
	assign io_requestor_1_pmp_6_cfg_x = io_dpath_pmp_6_cfg_x;
	assign io_requestor_1_pmp_6_cfg_w = io_dpath_pmp_6_cfg_w;
	assign io_requestor_1_pmp_6_cfg_r = io_dpath_pmp_6_cfg_r;
	assign io_requestor_1_pmp_6_addr = io_dpath_pmp_6_addr;
	assign io_requestor_1_pmp_6_mask = io_dpath_pmp_6_mask;
	assign io_requestor_1_pmp_7_cfg_l = io_dpath_pmp_7_cfg_l;
	assign io_requestor_1_pmp_7_cfg_a = io_dpath_pmp_7_cfg_a;
	assign io_requestor_1_pmp_7_cfg_x = io_dpath_pmp_7_cfg_x;
	assign io_requestor_1_pmp_7_cfg_w = io_dpath_pmp_7_cfg_w;
	assign io_requestor_1_pmp_7_cfg_r = io_dpath_pmp_7_cfg_r;
	assign io_requestor_1_pmp_7_addr = io_dpath_pmp_7_addr;
	assign io_requestor_1_pmp_7_mask = io_dpath_pmp_7_mask;
	assign io_mem_req_valid = _r_pte_T_6 | (state == 3'h3);
	assign io_mem_req_bits_addr = {8'h00, r_pte_ppn[19:0], (_GEN ? r_req_addr[8:0] : (_leaf_T_5 ? r_req_addr[17:9] : r_req_addr[26:18])), 3'h0};
	assign io_mem_s1_kill = (l2_hit | (state != 3'h2)) | resp_gf;
	assign io_dpath_perf_l2miss = s2_valid & ~s2_hit_vec_0;
endmodule
