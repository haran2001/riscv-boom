module ITLB (
	clock,
	reset,
	io_req_valid,
	io_req_bits_vaddr,
	io_req_bits_prv,
	io_resp_miss,
	io_resp_paddr,
	io_resp_pf_inst,
	io_resp_ae_inst,
	io_sfence_valid,
	io_sfence_bits_rs1,
	io_sfence_bits_rs2,
	io_sfence_bits_addr,
	io_ptw_req_ready,
	io_ptw_req_valid,
	io_ptw_req_bits_bits_addr,
	io_ptw_req_bits_bits_need_gpa,
	io_ptw_resp_valid,
	io_ptw_resp_bits_ae_ptw,
	io_ptw_resp_bits_ae_final,
	io_ptw_resp_bits_pf,
	io_ptw_resp_bits_gf,
	io_ptw_resp_bits_hr,
	io_ptw_resp_bits_hw,
	io_ptw_resp_bits_hx,
	io_ptw_resp_bits_pte_ppn,
	io_ptw_resp_bits_pte_d,
	io_ptw_resp_bits_pte_a,
	io_ptw_resp_bits_pte_g,
	io_ptw_resp_bits_pte_u,
	io_ptw_resp_bits_pte_x,
	io_ptw_resp_bits_pte_w,
	io_ptw_resp_bits_pte_r,
	io_ptw_resp_bits_pte_v,
	io_ptw_resp_bits_level,
	io_ptw_resp_bits_homogeneous,
	io_ptw_ptbr_mode,
	io_ptw_status_debug,
	io_ptw_pmp_0_cfg_l,
	io_ptw_pmp_0_cfg_a,
	io_ptw_pmp_0_cfg_x,
	io_ptw_pmp_0_cfg_w,
	io_ptw_pmp_0_cfg_r,
	io_ptw_pmp_0_addr,
	io_ptw_pmp_0_mask,
	io_ptw_pmp_1_cfg_l,
	io_ptw_pmp_1_cfg_a,
	io_ptw_pmp_1_cfg_x,
	io_ptw_pmp_1_cfg_w,
	io_ptw_pmp_1_cfg_r,
	io_ptw_pmp_1_addr,
	io_ptw_pmp_1_mask,
	io_ptw_pmp_2_cfg_l,
	io_ptw_pmp_2_cfg_a,
	io_ptw_pmp_2_cfg_x,
	io_ptw_pmp_2_cfg_w,
	io_ptw_pmp_2_cfg_r,
	io_ptw_pmp_2_addr,
	io_ptw_pmp_2_mask,
	io_ptw_pmp_3_cfg_l,
	io_ptw_pmp_3_cfg_a,
	io_ptw_pmp_3_cfg_x,
	io_ptw_pmp_3_cfg_w,
	io_ptw_pmp_3_cfg_r,
	io_ptw_pmp_3_addr,
	io_ptw_pmp_3_mask,
	io_ptw_pmp_4_cfg_l,
	io_ptw_pmp_4_cfg_a,
	io_ptw_pmp_4_cfg_x,
	io_ptw_pmp_4_cfg_w,
	io_ptw_pmp_4_cfg_r,
	io_ptw_pmp_4_addr,
	io_ptw_pmp_4_mask,
	io_ptw_pmp_5_cfg_l,
	io_ptw_pmp_5_cfg_a,
	io_ptw_pmp_5_cfg_x,
	io_ptw_pmp_5_cfg_w,
	io_ptw_pmp_5_cfg_r,
	io_ptw_pmp_5_addr,
	io_ptw_pmp_5_mask,
	io_ptw_pmp_6_cfg_l,
	io_ptw_pmp_6_cfg_a,
	io_ptw_pmp_6_cfg_x,
	io_ptw_pmp_6_cfg_w,
	io_ptw_pmp_6_cfg_r,
	io_ptw_pmp_6_addr,
	io_ptw_pmp_6_mask,
	io_ptw_pmp_7_cfg_l,
	io_ptw_pmp_7_cfg_a,
	io_ptw_pmp_7_cfg_x,
	io_ptw_pmp_7_cfg_w,
	io_ptw_pmp_7_cfg_r,
	io_ptw_pmp_7_addr,
	io_ptw_pmp_7_mask
);
	input clock;
	input reset;
	input io_req_valid;
	input [39:0] io_req_bits_vaddr;
	input [1:0] io_req_bits_prv;
	output wire io_resp_miss;
	output wire [31:0] io_resp_paddr;
	output wire io_resp_pf_inst;
	output wire io_resp_ae_inst;
	input io_sfence_valid;
	input io_sfence_bits_rs1;
	input io_sfence_bits_rs2;
	input [38:0] io_sfence_bits_addr;
	input io_ptw_req_ready;
	output wire io_ptw_req_valid;
	output wire [26:0] io_ptw_req_bits_bits_addr;
	output wire io_ptw_req_bits_bits_need_gpa;
	input io_ptw_resp_valid;
	input io_ptw_resp_bits_ae_ptw;
	input io_ptw_resp_bits_ae_final;
	input io_ptw_resp_bits_pf;
	input io_ptw_resp_bits_gf;
	input io_ptw_resp_bits_hr;
	input io_ptw_resp_bits_hw;
	input io_ptw_resp_bits_hx;
	input [43:0] io_ptw_resp_bits_pte_ppn;
	input io_ptw_resp_bits_pte_d;
	input io_ptw_resp_bits_pte_a;
	input io_ptw_resp_bits_pte_g;
	input io_ptw_resp_bits_pte_u;
	input io_ptw_resp_bits_pte_x;
	input io_ptw_resp_bits_pte_w;
	input io_ptw_resp_bits_pte_r;
	input io_ptw_resp_bits_pte_v;
	input [1:0] io_ptw_resp_bits_level;
	input io_ptw_resp_bits_homogeneous;
	input [3:0] io_ptw_ptbr_mode;
	input io_ptw_status_debug;
	input io_ptw_pmp_0_cfg_l;
	input [1:0] io_ptw_pmp_0_cfg_a;
	input io_ptw_pmp_0_cfg_x;
	input io_ptw_pmp_0_cfg_w;
	input io_ptw_pmp_0_cfg_r;
	input [29:0] io_ptw_pmp_0_addr;
	input [31:0] io_ptw_pmp_0_mask;
	input io_ptw_pmp_1_cfg_l;
	input [1:0] io_ptw_pmp_1_cfg_a;
	input io_ptw_pmp_1_cfg_x;
	input io_ptw_pmp_1_cfg_w;
	input io_ptw_pmp_1_cfg_r;
	input [29:0] io_ptw_pmp_1_addr;
	input [31:0] io_ptw_pmp_1_mask;
	input io_ptw_pmp_2_cfg_l;
	input [1:0] io_ptw_pmp_2_cfg_a;
	input io_ptw_pmp_2_cfg_x;
	input io_ptw_pmp_2_cfg_w;
	input io_ptw_pmp_2_cfg_r;
	input [29:0] io_ptw_pmp_2_addr;
	input [31:0] io_ptw_pmp_2_mask;
	input io_ptw_pmp_3_cfg_l;
	input [1:0] io_ptw_pmp_3_cfg_a;
	input io_ptw_pmp_3_cfg_x;
	input io_ptw_pmp_3_cfg_w;
	input io_ptw_pmp_3_cfg_r;
	input [29:0] io_ptw_pmp_3_addr;
	input [31:0] io_ptw_pmp_3_mask;
	input io_ptw_pmp_4_cfg_l;
	input [1:0] io_ptw_pmp_4_cfg_a;
	input io_ptw_pmp_4_cfg_x;
	input io_ptw_pmp_4_cfg_w;
	input io_ptw_pmp_4_cfg_r;
	input [29:0] io_ptw_pmp_4_addr;
	input [31:0] io_ptw_pmp_4_mask;
	input io_ptw_pmp_5_cfg_l;
	input [1:0] io_ptw_pmp_5_cfg_a;
	input io_ptw_pmp_5_cfg_x;
	input io_ptw_pmp_5_cfg_w;
	input io_ptw_pmp_5_cfg_r;
	input [29:0] io_ptw_pmp_5_addr;
	input [31:0] io_ptw_pmp_5_mask;
	input io_ptw_pmp_6_cfg_l;
	input [1:0] io_ptw_pmp_6_cfg_a;
	input io_ptw_pmp_6_cfg_x;
	input io_ptw_pmp_6_cfg_w;
	input io_ptw_pmp_6_cfg_r;
	input [29:0] io_ptw_pmp_6_addr;
	input [31:0] io_ptw_pmp_6_mask;
	input io_ptw_pmp_7_cfg_l;
	input [1:0] io_ptw_pmp_7_cfg_a;
	input io_ptw_pmp_7_cfg_x;
	input io_ptw_pmp_7_cfg_w;
	input io_ptw_pmp_7_cfg_r;
	input [29:0] io_ptw_pmp_7_addr;
	input [31:0] io_ptw_pmp_7_mask;
	wire [19:0] _entries_barrier_12_io_y_ppn;
	wire _entries_barrier_12_io_y_u;
	wire _entries_barrier_12_io_y_ae_ptw;
	wire _entries_barrier_12_io_y_ae_final;
	wire _entries_barrier_12_io_y_pf;
	wire _entries_barrier_12_io_y_gf;
	wire _entries_barrier_12_io_y_sx;
	wire [19:0] _entries_barrier_11_io_y_ppn;
	wire _entries_barrier_11_io_y_u;
	wire _entries_barrier_11_io_y_ae_ptw;
	wire _entries_barrier_11_io_y_ae_final;
	wire _entries_barrier_11_io_y_pf;
	wire _entries_barrier_11_io_y_gf;
	wire _entries_barrier_11_io_y_sx;
	wire _entries_barrier_11_io_y_px;
	wire [19:0] _entries_barrier_10_io_y_ppn;
	wire _entries_barrier_10_io_y_u;
	wire _entries_barrier_10_io_y_ae_ptw;
	wire _entries_barrier_10_io_y_ae_final;
	wire _entries_barrier_10_io_y_pf;
	wire _entries_barrier_10_io_y_gf;
	wire _entries_barrier_10_io_y_sx;
	wire _entries_barrier_10_io_y_px;
	wire [19:0] _entries_barrier_9_io_y_ppn;
	wire _entries_barrier_9_io_y_u;
	wire _entries_barrier_9_io_y_ae_ptw;
	wire _entries_barrier_9_io_y_ae_final;
	wire _entries_barrier_9_io_y_pf;
	wire _entries_barrier_9_io_y_gf;
	wire _entries_barrier_9_io_y_sx;
	wire _entries_barrier_9_io_y_px;
	wire [19:0] _entries_barrier_8_io_y_ppn;
	wire _entries_barrier_8_io_y_u;
	wire _entries_barrier_8_io_y_ae_ptw;
	wire _entries_barrier_8_io_y_ae_final;
	wire _entries_barrier_8_io_y_pf;
	wire _entries_barrier_8_io_y_gf;
	wire _entries_barrier_8_io_y_sx;
	wire _entries_barrier_8_io_y_px;
	wire [19:0] _entries_barrier_7_io_y_ppn;
	wire _entries_barrier_7_io_y_u;
	wire _entries_barrier_7_io_y_ae_ptw;
	wire _entries_barrier_7_io_y_ae_final;
	wire _entries_barrier_7_io_y_pf;
	wire _entries_barrier_7_io_y_gf;
	wire _entries_barrier_7_io_y_sx;
	wire _entries_barrier_7_io_y_px;
	wire [19:0] _entries_barrier_6_io_y_ppn;
	wire _entries_barrier_6_io_y_u;
	wire _entries_barrier_6_io_y_ae_ptw;
	wire _entries_barrier_6_io_y_ae_final;
	wire _entries_barrier_6_io_y_pf;
	wire _entries_barrier_6_io_y_gf;
	wire _entries_barrier_6_io_y_sx;
	wire _entries_barrier_6_io_y_px;
	wire [19:0] _entries_barrier_5_io_y_ppn;
	wire _entries_barrier_5_io_y_u;
	wire _entries_barrier_5_io_y_ae_ptw;
	wire _entries_barrier_5_io_y_ae_final;
	wire _entries_barrier_5_io_y_pf;
	wire _entries_barrier_5_io_y_gf;
	wire _entries_barrier_5_io_y_sx;
	wire _entries_barrier_5_io_y_px;
	wire [19:0] _entries_barrier_4_io_y_ppn;
	wire _entries_barrier_4_io_y_u;
	wire _entries_barrier_4_io_y_ae_ptw;
	wire _entries_barrier_4_io_y_ae_final;
	wire _entries_barrier_4_io_y_pf;
	wire _entries_barrier_4_io_y_gf;
	wire _entries_barrier_4_io_y_sx;
	wire _entries_barrier_4_io_y_px;
	wire [19:0] _entries_barrier_3_io_y_ppn;
	wire _entries_barrier_3_io_y_u;
	wire _entries_barrier_3_io_y_ae_ptw;
	wire _entries_barrier_3_io_y_ae_final;
	wire _entries_barrier_3_io_y_pf;
	wire _entries_barrier_3_io_y_gf;
	wire _entries_barrier_3_io_y_sx;
	wire _entries_barrier_3_io_y_px;
	wire [19:0] _entries_barrier_2_io_y_ppn;
	wire _entries_barrier_2_io_y_u;
	wire _entries_barrier_2_io_y_ae_ptw;
	wire _entries_barrier_2_io_y_ae_final;
	wire _entries_barrier_2_io_y_pf;
	wire _entries_barrier_2_io_y_gf;
	wire _entries_barrier_2_io_y_sx;
	wire _entries_barrier_2_io_y_px;
	wire [19:0] _entries_barrier_1_io_y_ppn;
	wire _entries_barrier_1_io_y_u;
	wire _entries_barrier_1_io_y_ae_ptw;
	wire _entries_barrier_1_io_y_ae_final;
	wire _entries_barrier_1_io_y_pf;
	wire _entries_barrier_1_io_y_gf;
	wire _entries_barrier_1_io_y_sx;
	wire _entries_barrier_1_io_y_px;
	wire [19:0] _entries_barrier_io_y_ppn;
	wire _entries_barrier_io_y_u;
	wire _entries_barrier_io_y_ae_ptw;
	wire _entries_barrier_io_y_ae_final;
	wire _entries_barrier_io_y_pf;
	wire _entries_barrier_io_y_gf;
	wire _entries_barrier_io_y_sx;
	wire _entries_barrier_io_y_px;
	wire _pma_io_resp_cacheable;
	wire _pma_io_resp_r;
	wire _pma_io_resp_w;
	wire _pma_io_resp_pp;
	wire _pma_io_resp_al;
	wire _pma_io_resp_aa;
	wire _pma_io_resp_x;
	wire _pma_io_resp_eff;
	wire _pmp_io_r;
	wire _pmp_io_w;
	wire _pmp_io_x;
	wire [19:0] _mpu_ppn_barrier_io_y_ppn;
	reg [26:0] sectored_entries_0_0_tag_vpn;
	reg sectored_entries_0_0_tag_v;
	reg [41:0] sectored_entries_0_0_data_0;
	reg [41:0] sectored_entries_0_0_data_1;
	reg [41:0] sectored_entries_0_0_data_2;
	reg [41:0] sectored_entries_0_0_data_3;
	reg sectored_entries_0_0_valid_0;
	reg sectored_entries_0_0_valid_1;
	reg sectored_entries_0_0_valid_2;
	reg sectored_entries_0_0_valid_3;
	reg [26:0] sectored_entries_0_1_tag_vpn;
	reg sectored_entries_0_1_tag_v;
	reg [41:0] sectored_entries_0_1_data_0;
	reg [41:0] sectored_entries_0_1_data_1;
	reg [41:0] sectored_entries_0_1_data_2;
	reg [41:0] sectored_entries_0_1_data_3;
	reg sectored_entries_0_1_valid_0;
	reg sectored_entries_0_1_valid_1;
	reg sectored_entries_0_1_valid_2;
	reg sectored_entries_0_1_valid_3;
	reg [26:0] sectored_entries_0_2_tag_vpn;
	reg sectored_entries_0_2_tag_v;
	reg [41:0] sectored_entries_0_2_data_0;
	reg [41:0] sectored_entries_0_2_data_1;
	reg [41:0] sectored_entries_0_2_data_2;
	reg [41:0] sectored_entries_0_2_data_3;
	reg sectored_entries_0_2_valid_0;
	reg sectored_entries_0_2_valid_1;
	reg sectored_entries_0_2_valid_2;
	reg sectored_entries_0_2_valid_3;
	reg [26:0] sectored_entries_0_3_tag_vpn;
	reg sectored_entries_0_3_tag_v;
	reg [41:0] sectored_entries_0_3_data_0;
	reg [41:0] sectored_entries_0_3_data_1;
	reg [41:0] sectored_entries_0_3_data_2;
	reg [41:0] sectored_entries_0_3_data_3;
	reg sectored_entries_0_3_valid_0;
	reg sectored_entries_0_3_valid_1;
	reg sectored_entries_0_3_valid_2;
	reg sectored_entries_0_3_valid_3;
	reg [26:0] sectored_entries_0_4_tag_vpn;
	reg sectored_entries_0_4_tag_v;
	reg [41:0] sectored_entries_0_4_data_0;
	reg [41:0] sectored_entries_0_4_data_1;
	reg [41:0] sectored_entries_0_4_data_2;
	reg [41:0] sectored_entries_0_4_data_3;
	reg sectored_entries_0_4_valid_0;
	reg sectored_entries_0_4_valid_1;
	reg sectored_entries_0_4_valid_2;
	reg sectored_entries_0_4_valid_3;
	reg [26:0] sectored_entries_0_5_tag_vpn;
	reg sectored_entries_0_5_tag_v;
	reg [41:0] sectored_entries_0_5_data_0;
	reg [41:0] sectored_entries_0_5_data_1;
	reg [41:0] sectored_entries_0_5_data_2;
	reg [41:0] sectored_entries_0_5_data_3;
	reg sectored_entries_0_5_valid_0;
	reg sectored_entries_0_5_valid_1;
	reg sectored_entries_0_5_valid_2;
	reg sectored_entries_0_5_valid_3;
	reg [26:0] sectored_entries_0_6_tag_vpn;
	reg sectored_entries_0_6_tag_v;
	reg [41:0] sectored_entries_0_6_data_0;
	reg [41:0] sectored_entries_0_6_data_1;
	reg [41:0] sectored_entries_0_6_data_2;
	reg [41:0] sectored_entries_0_6_data_3;
	reg sectored_entries_0_6_valid_0;
	reg sectored_entries_0_6_valid_1;
	reg sectored_entries_0_6_valid_2;
	reg sectored_entries_0_6_valid_3;
	reg [26:0] sectored_entries_0_7_tag_vpn;
	reg sectored_entries_0_7_tag_v;
	reg [41:0] sectored_entries_0_7_data_0;
	reg [41:0] sectored_entries_0_7_data_1;
	reg [41:0] sectored_entries_0_7_data_2;
	reg [41:0] sectored_entries_0_7_data_3;
	reg sectored_entries_0_7_valid_0;
	reg sectored_entries_0_7_valid_1;
	reg sectored_entries_0_7_valid_2;
	reg sectored_entries_0_7_valid_3;
	reg [1:0] superpage_entries_0_level;
	reg [26:0] superpage_entries_0_tag_vpn;
	reg superpage_entries_0_tag_v;
	reg [41:0] superpage_entries_0_data_0;
	reg superpage_entries_0_valid_0;
	reg [1:0] superpage_entries_1_level;
	reg [26:0] superpage_entries_1_tag_vpn;
	reg superpage_entries_1_tag_v;
	reg [41:0] superpage_entries_1_data_0;
	reg superpage_entries_1_valid_0;
	reg [1:0] superpage_entries_2_level;
	reg [26:0] superpage_entries_2_tag_vpn;
	reg superpage_entries_2_tag_v;
	reg [41:0] superpage_entries_2_data_0;
	reg superpage_entries_2_valid_0;
	reg [1:0] superpage_entries_3_level;
	reg [26:0] superpage_entries_3_tag_vpn;
	reg superpage_entries_3_tag_v;
	reg [41:0] superpage_entries_3_data_0;
	reg superpage_entries_3_valid_0;
	reg [1:0] special_entry_level;
	reg [26:0] special_entry_tag_vpn;
	reg [41:0] special_entry_data_0;
	reg special_entry_valid_0;
	reg [1:0] state;
	reg [26:0] r_refill_tag;
	reg [1:0] waddr;
	reg [2:0] r_sectored_repl_addr;
	reg r_sectored_hit_valid;
	reg [2:0] r_sectored_hit_bits;
	reg r_need_gpa;
	wire _vm_enabled_T_1 = io_ptw_ptbr_mode[3] & ~io_req_bits_prv[1];
	wire io_ptw_req_valid_0 = state == 2'h1;
	wire ignore_13 = special_entry_level == 2'h0;
	wire [27:0] mpu_ppn = (io_ptw_resp_valid ? {8'h00, io_ptw_resp_bits_pte_ppn[19:0]} : (_vm_enabled_T_1 ? {8'h00, _mpu_ppn_barrier_io_y_ppn[19:18], (ignore_13 ? io_req_bits_vaddr[29:21] : 9'h000) | _mpu_ppn_barrier_io_y_ppn[17:9], (special_entry_level[1] ? 9'h000 : io_req_bits_vaddr[20:12]) | _mpu_ppn_barrier_io_y_ppn[8:0]} : io_req_bits_vaddr[39:12]));
	wire [2:0] mpu_priv = (io_ptw_resp_valid ? 3'h1 : {io_ptw_status_debug, io_req_bits_prv});
	wire deny_access_to_debug = ~mpu_priv[2] & (mpu_ppn == 28'h0000000);
	wire prot_x = (_pma_io_resp_x & ~deny_access_to_debug) & _pmp_io_x;
	wire [24:0] _hitsVec_T = sectored_entries_0_0_tag_vpn[26:2] ^ io_req_bits_vaddr[38:14];
	wire [24:0] _hitsVec_T_6 = sectored_entries_0_1_tag_vpn[26:2] ^ io_req_bits_vaddr[38:14];
	wire [24:0] _hitsVec_T_12 = sectored_entries_0_2_tag_vpn[26:2] ^ io_req_bits_vaddr[38:14];
	wire [24:0] _hitsVec_T_18 = sectored_entries_0_3_tag_vpn[26:2] ^ io_req_bits_vaddr[38:14];
	wire [24:0] _hitsVec_T_24 = sectored_entries_0_4_tag_vpn[26:2] ^ io_req_bits_vaddr[38:14];
	wire [24:0] _hitsVec_T_30 = sectored_entries_0_5_tag_vpn[26:2] ^ io_req_bits_vaddr[38:14];
	wire [24:0] _hitsVec_T_36 = sectored_entries_0_6_tag_vpn[26:2] ^ io_req_bits_vaddr[38:14];
	wire [24:0] _hitsVec_T_42 = sectored_entries_0_7_tag_vpn[26:2] ^ io_req_bits_vaddr[38:14];
	wire [17:0] _hitsVec_T_58 = superpage_entries_0_tag_vpn[26:9] ^ io_req_bits_vaddr[38:21];
	wire ignore_1 = superpage_entries_0_level == 2'h0;
	wire [17:0] _hitsVec_T_73 = superpage_entries_1_tag_vpn[26:9] ^ io_req_bits_vaddr[38:21];
	wire ignore_4 = superpage_entries_1_level == 2'h0;
	wire [17:0] _hitsVec_T_88 = superpage_entries_2_tag_vpn[26:9] ^ io_req_bits_vaddr[38:21];
	wire ignore_7 = superpage_entries_2_level == 2'h0;
	wire [17:0] _hitsVec_T_103 = superpage_entries_3_tag_vpn[26:9] ^ io_req_bits_vaddr[38:21];
	wire ignore_10 = superpage_entries_3_level == 2'h0;
	wire [3:0] _GEN = {sectored_entries_0_0_valid_3, sectored_entries_0_0_valid_2, sectored_entries_0_0_valid_1, sectored_entries_0_0_valid_0};
	wire hitsVec_0 = ((_vm_enabled_T_1 & _GEN[io_req_bits_vaddr[13:12]]) & (_hitsVec_T == 25'h0000000)) & ~sectored_entries_0_0_tag_v;
	wire [3:0] _GEN_0 = {sectored_entries_0_1_valid_3, sectored_entries_0_1_valid_2, sectored_entries_0_1_valid_1, sectored_entries_0_1_valid_0};
	wire hitsVec_1 = ((_vm_enabled_T_1 & _GEN_0[io_req_bits_vaddr[13:12]]) & (_hitsVec_T_6 == 25'h0000000)) & ~sectored_entries_0_1_tag_v;
	wire [3:0] _GEN_1 = {sectored_entries_0_2_valid_3, sectored_entries_0_2_valid_2, sectored_entries_0_2_valid_1, sectored_entries_0_2_valid_0};
	wire hitsVec_2 = ((_vm_enabled_T_1 & _GEN_1[io_req_bits_vaddr[13:12]]) & (_hitsVec_T_12 == 25'h0000000)) & ~sectored_entries_0_2_tag_v;
	wire [3:0] _GEN_2 = {sectored_entries_0_3_valid_3, sectored_entries_0_3_valid_2, sectored_entries_0_3_valid_1, sectored_entries_0_3_valid_0};
	wire hitsVec_3 = ((_vm_enabled_T_1 & _GEN_2[io_req_bits_vaddr[13:12]]) & (_hitsVec_T_18 == 25'h0000000)) & ~sectored_entries_0_3_tag_v;
	wire [3:0] _GEN_3 = {sectored_entries_0_4_valid_3, sectored_entries_0_4_valid_2, sectored_entries_0_4_valid_1, sectored_entries_0_4_valid_0};
	wire hitsVec_4 = ((_vm_enabled_T_1 & _GEN_3[io_req_bits_vaddr[13:12]]) & (_hitsVec_T_24 == 25'h0000000)) & ~sectored_entries_0_4_tag_v;
	wire [3:0] _GEN_4 = {sectored_entries_0_5_valid_3, sectored_entries_0_5_valid_2, sectored_entries_0_5_valid_1, sectored_entries_0_5_valid_0};
	wire hitsVec_5 = ((_vm_enabled_T_1 & _GEN_4[io_req_bits_vaddr[13:12]]) & (_hitsVec_T_30 == 25'h0000000)) & ~sectored_entries_0_5_tag_v;
	wire [3:0] _GEN_5 = {sectored_entries_0_6_valid_3, sectored_entries_0_6_valid_2, sectored_entries_0_6_valid_1, sectored_entries_0_6_valid_0};
	wire hitsVec_6 = ((_vm_enabled_T_1 & _GEN_5[io_req_bits_vaddr[13:12]]) & (_hitsVec_T_36 == 25'h0000000)) & ~sectored_entries_0_6_tag_v;
	wire [3:0] _GEN_6 = {sectored_entries_0_7_valid_3, sectored_entries_0_7_valid_2, sectored_entries_0_7_valid_1, sectored_entries_0_7_valid_0};
	wire hitsVec_7 = ((_vm_enabled_T_1 & _GEN_6[io_req_bits_vaddr[13:12]]) & (_hitsVec_T_42 == 25'h0000000)) & ~sectored_entries_0_7_tag_v;
	wire hitsVec_8 = (((_vm_enabled_T_1 & superpage_entries_0_valid_0) & ~superpage_entries_0_tag_v) & (_hitsVec_T_58[17:9] == 9'h000)) & (ignore_1 | (_hitsVec_T_58[8:0] == 9'h000));
	wire hitsVec_9 = (((_vm_enabled_T_1 & superpage_entries_1_valid_0) & ~superpage_entries_1_tag_v) & (_hitsVec_T_73[17:9] == 9'h000)) & (ignore_4 | (_hitsVec_T_73[8:0] == 9'h000));
	wire hitsVec_10 = (((_vm_enabled_T_1 & superpage_entries_2_valid_0) & ~superpage_entries_2_tag_v) & (_hitsVec_T_88[17:9] == 9'h000)) & (ignore_7 | (_hitsVec_T_88[8:0] == 9'h000));
	wire hitsVec_11 = (((_vm_enabled_T_1 & superpage_entries_3_valid_0) & ~superpage_entries_3_tag_v) & (_hitsVec_T_103[17:9] == 9'h000)) & (ignore_10 | (_hitsVec_T_103[8:0] == 9'h000));
	wire [26:0] _hitsVec_T_118 = special_entry_tag_vpn ^ io_req_bits_vaddr[38:12];
	wire hitsVec_12 = (((_vm_enabled_T_1 & special_entry_valid_0) & (_hitsVec_T_118[26:18] == 9'h000)) & (ignore_13 | (_hitsVec_T_118[17:9] == 9'h000))) & (~special_entry_level[1] | (_hitsVec_T_118[8:0] == 9'h000));
	wire [12:0] real_hits = {hitsVec_12, hitsVec_11, hitsVec_10, hitsVec_9, hitsVec_8, hitsVec_7, hitsVec_6, hitsVec_5, hitsVec_4, hitsVec_3, hitsVec_2, hitsVec_1, hitsVec_0};
	wire [167:0] _GEN_7 = {sectored_entries_0_0_data_3, sectored_entries_0_0_data_2, sectored_entries_0_0_data_1, sectored_entries_0_0_data_0};
	wire [41:0] _entries_WIRE_1 = _GEN_7[io_req_bits_vaddr[13:12] * 42+:42];
	wire [167:0] _GEN_8 = {sectored_entries_0_1_data_3, sectored_entries_0_1_data_2, sectored_entries_0_1_data_1, sectored_entries_0_1_data_0};
	wire [41:0] _entries_WIRE_3 = _GEN_8[io_req_bits_vaddr[13:12] * 42+:42];
	wire [167:0] _GEN_9 = {sectored_entries_0_2_data_3, sectored_entries_0_2_data_2, sectored_entries_0_2_data_1, sectored_entries_0_2_data_0};
	wire [41:0] _entries_WIRE_5 = _GEN_9[io_req_bits_vaddr[13:12] * 42+:42];
	wire [167:0] _GEN_10 = {sectored_entries_0_3_data_3, sectored_entries_0_3_data_2, sectored_entries_0_3_data_1, sectored_entries_0_3_data_0};
	wire [41:0] _entries_WIRE_7 = _GEN_10[io_req_bits_vaddr[13:12] * 42+:42];
	wire [167:0] _GEN_11 = {sectored_entries_0_4_data_3, sectored_entries_0_4_data_2, sectored_entries_0_4_data_1, sectored_entries_0_4_data_0};
	wire [41:0] _entries_WIRE_9 = _GEN_11[io_req_bits_vaddr[13:12] * 42+:42];
	wire [167:0] _GEN_12 = {sectored_entries_0_5_data_3, sectored_entries_0_5_data_2, sectored_entries_0_5_data_1, sectored_entries_0_5_data_0};
	wire [41:0] _entries_WIRE_11 = _GEN_12[io_req_bits_vaddr[13:12] * 42+:42];
	wire [167:0] _GEN_13 = {sectored_entries_0_6_data_3, sectored_entries_0_6_data_2, sectored_entries_0_6_data_1, sectored_entries_0_6_data_0};
	wire [41:0] _entries_WIRE_13 = _GEN_13[io_req_bits_vaddr[13:12] * 42+:42];
	wire [167:0] _GEN_14 = {sectored_entries_0_7_data_3, sectored_entries_0_7_data_2, sectored_entries_0_7_data_1, sectored_entries_0_7_data_0};
	wire [41:0] _entries_WIRE_15 = _GEN_14[io_req_bits_vaddr[13:12] * 42+:42];
	wire bad_va = (_vm_enabled_T_1 & io_ptw_ptbr_mode[3]) & ~((io_req_bits_vaddr[39:38] == 2'h0) | &io_req_bits_vaddr[39:38]);
	wire tlb_miss = (_vm_enabled_T_1 & ~bad_va) & (real_hits == 13'h0000);
	reg [6:0] state_vec_0;
	reg [2:0] state_reg_1;
	wire multipleHits_rightOne_1 = hitsVec_1 | hitsVec_2;
	wire multipleHits_leftOne_2 = hitsVec_0 | multipleHits_rightOne_1;
	wire multipleHits_rightOne_3 = hitsVec_4 | hitsVec_5;
	wire multipleHits_rightOne_4 = hitsVec_3 | multipleHits_rightOne_3;
	wire multipleHits_rightOne_6 = hitsVec_7 | hitsVec_8;
	wire multipleHits_leftOne_8 = hitsVec_6 | multipleHits_rightOne_6;
	wire multipleHits_leftOne_10 = hitsVec_9 | hitsVec_10;
	wire multipleHits_rightOne_9 = hitsVec_11 | hitsVec_12;
	wire multipleHits_rightOne_10 = multipleHits_leftOne_10 | multipleHits_rightOne_9;
	wire multipleHits = (((((((((((hitsVec_1 & hitsVec_2) | (hitsVec_0 & multipleHits_rightOne_1)) | (hitsVec_4 & hitsVec_5)) | (hitsVec_3 & multipleHits_rightOne_3)) | (multipleHits_leftOne_2 & multipleHits_rightOne_4)) | (hitsVec_7 & hitsVec_8)) | (hitsVec_6 & multipleHits_rightOne_6)) | (hitsVec_9 & hitsVec_10)) | (hitsVec_11 & hitsVec_12)) | (multipleHits_leftOne_10 & multipleHits_rightOne_9)) | (multipleHits_leftOne_8 & multipleHits_rightOne_10)) | ((multipleHits_leftOne_2 | multipleHits_rightOne_4) & (multipleHits_leftOne_8 | multipleHits_rightOne_10));
	always @(posedge clock) begin : sv2v_autoblock_1
		reg invalidate_refill;
		reg prot_r;
		reg prot_w;
		reg _r_sectored_repl_addr_valids_T;
		reg sector_hits_0;
		reg _r_sectored_repl_addr_valids_T_3;
		reg sector_hits_1;
		reg _r_sectored_repl_addr_valids_T_6;
		reg sector_hits_2;
		reg _r_sectored_repl_addr_valids_T_9;
		reg sector_hits_3;
		reg _r_sectored_repl_addr_valids_T_12;
		reg sector_hits_4;
		reg _r_sectored_repl_addr_valids_T_15;
		reg sector_hits_5;
		reg _r_sectored_repl_addr_valids_T_18;
		reg sector_hits_6;
		reg _r_sectored_repl_addr_valids_T_21;
		reg sector_hits_7;
		reg newEntry_g;
		reg newEntry_sr;
		reg newEntry_sw;
		reg newEntry_sx;
		reg _GEN_15;
		reg _GEN_16;
		reg _GEN_17;
		reg _GEN_18;
		reg _GEN_19;
		reg _GEN_20;
		reg _GEN_21;
		reg _GEN_22;
		reg _GEN_23;
		reg _GEN_24;
		reg _GEN_25;
		reg _GEN_26;
		reg _GEN_27;
		reg _GEN_28;
		reg [2:0] waddr_1;
		reg _GEN_29;
		reg _GEN_30;
		reg _GEN_31;
		reg _GEN_32;
		reg _GEN_33;
		reg _GEN_34;
		reg [41:0] _sectored_entries_0_0_data_T;
		reg _GEN_35;
		reg _GEN_36;
		reg _GEN_37;
		reg _GEN_38;
		reg _GEN_39;
		reg _GEN_40;
		reg _GEN_41;
		reg _GEN_42;
		reg _GEN_43;
		reg [41:0] _sectored_entries_0_1_data_T;
		reg _GEN_44;
		reg _GEN_45;
		reg _GEN_46;
		reg _GEN_47;
		reg _GEN_48;
		reg _GEN_49;
		reg _GEN_50;
		reg _GEN_51;
		reg _GEN_52;
		reg [41:0] _sectored_entries_0_2_data_T;
		reg _GEN_53;
		reg _GEN_54;
		reg _GEN_55;
		reg _GEN_56;
		reg _GEN_57;
		reg _GEN_58;
		reg _GEN_59;
		reg _GEN_60;
		reg _GEN_61;
		reg [41:0] _sectored_entries_0_3_data_T;
		reg _GEN_62;
		reg _GEN_63;
		reg _GEN_64;
		reg _GEN_65;
		reg _GEN_66;
		reg _GEN_67;
		reg _GEN_68;
		reg _GEN_69;
		reg _GEN_70;
		reg [41:0] _sectored_entries_0_4_data_T;
		reg _GEN_71;
		reg _GEN_72;
		reg _GEN_73;
		reg _GEN_74;
		reg _GEN_75;
		reg _GEN_76;
		reg _GEN_77;
		reg _GEN_78;
		reg _GEN_79;
		reg [41:0] _sectored_entries_0_5_data_T;
		reg _GEN_80;
		reg _GEN_81;
		reg _GEN_82;
		reg _GEN_83;
		reg _GEN_84;
		reg _GEN_85;
		reg _GEN_86;
		reg _GEN_87;
		reg _GEN_88;
		reg [41:0] _sectored_entries_0_6_data_T;
		reg _GEN_89;
		reg _GEN_90;
		reg _GEN_91;
		reg _GEN_92;
		reg _GEN_93;
		reg _GEN_94;
		reg _GEN_95;
		reg _GEN_96;
		reg [41:0] _sectored_entries_0_7_data_T;
		reg _GEN_97;
		reg _GEN_98;
		reg _GEN_99;
		reg _GEN_100;
		reg [2:0] _GEN_101;
		reg [2:0] _GEN_102;
		reg _GEN_103;
		reg _GEN_104;
		reg _GEN_105;
		reg _GEN_106;
		reg _GEN_107;
		reg _GEN_108;
		reg _GEN_109;
		reg _GEN_110;
		reg _GEN_111;
		reg _GEN_112;
		reg _GEN_113;
		reg _GEN_114;
		reg _GEN_115;
		reg _GEN_116;
		reg _GEN_117;
		reg _GEN_118;
		reg _GEN_119;
		reg _GEN_120;
		reg _GEN_121;
		reg _GEN_122;
		reg _GEN_123;
		reg _GEN_124;
		reg _GEN_125;
		reg _GEN_126;
		reg _GEN_127;
		reg _GEN_128;
		reg _GEN_129;
		reg _GEN_130;
		reg _GEN_131;
		reg _GEN_132;
		reg _GEN_133;
		reg _GEN_134;
		reg _GEN_135;
		reg _GEN_136;
		reg _GEN_137;
		reg _GEN_138;
		reg _GEN_139;
		reg _GEN_140;
		reg _GEN_141;
		reg _GEN_142;
		reg _GEN_143;
		reg _GEN_144;
		reg _GEN_145;
		reg _GEN_146;
		reg _GEN_147;
		reg _GEN_148;
		reg _GEN_149;
		reg _GEN_150;
		reg _GEN_151;
		reg _GEN_152;
		reg _GEN_153;
		reg _GEN_154;
		reg _GEN_155;
		reg _GEN_156;
		reg _GEN_157;
		reg _GEN_158;
		reg _GEN_159;
		reg _GEN_160;
		reg _GEN_161;
		reg _GEN_162;
		reg _GEN_163;
		reg _GEN_164;
		reg _GEN_165;
		_GEN_15 = io_ptw_resp_valid & ~io_ptw_resp_bits_homogeneous;
		_GEN_30 = ~io_ptw_resp_bits_homogeneous | ~io_ptw_resp_bits_level[1];
		_GEN_105 = io_req_bits_vaddr[13:12] == 2'h0;
		_GEN_107 = io_req_bits_vaddr[13:12] == 2'h1;
		_GEN_109 = io_req_bits_vaddr[13:12] == 2'h2;
		_GEN_112 = _hitsVec_T[24:16] == 9'h000;
		_GEN_118 = _hitsVec_T_6[24:16] == 9'h000;
		_GEN_124 = _hitsVec_T_12[24:16] == 9'h000;
		_GEN_130 = _hitsVec_T_18[24:16] == 9'h000;
		_GEN_136 = _hitsVec_T_24[24:16] == 9'h000;
		_GEN_142 = _hitsVec_T_30[24:16] == 9'h000;
		_GEN_148 = _hitsVec_T_36[24:16] == 9'h000;
		_GEN_154 = _hitsVec_T_42[24:16] == 9'h000;
		_GEN_155 = _hitsVec_T_58[17:9] == 9'h000;
		_GEN_157 = _hitsVec_T_73[17:9] == 9'h000;
		_GEN_159 = _hitsVec_T_88[17:9] == 9'h000;
		_GEN_161 = _hitsVec_T_103[17:9] == 9'h000;
		_GEN_163 = _hitsVec_T_118[26:18] == 9'h000;
		_GEN_165 = multipleHits | reset;
		invalidate_refill = (io_ptw_req_valid_0 | &state) | io_sfence_valid;
		prot_r = (_pma_io_resp_r & ~deny_access_to_debug) & _pmp_io_r;
		prot_w = (_pma_io_resp_w & ~deny_access_to_debug) & _pmp_io_w;
		_r_sectored_repl_addr_valids_T = sectored_entries_0_0_valid_0 | sectored_entries_0_0_valid_1;
		sector_hits_0 = (((_r_sectored_repl_addr_valids_T | sectored_entries_0_0_valid_2) | sectored_entries_0_0_valid_3) & (_hitsVec_T == 25'h0000000)) & ~sectored_entries_0_0_tag_v;
		_r_sectored_repl_addr_valids_T_3 = sectored_entries_0_1_valid_0 | sectored_entries_0_1_valid_1;
		sector_hits_1 = (((_r_sectored_repl_addr_valids_T_3 | sectored_entries_0_1_valid_2) | sectored_entries_0_1_valid_3) & (_hitsVec_T_6 == 25'h0000000)) & ~sectored_entries_0_1_tag_v;
		_r_sectored_repl_addr_valids_T_6 = sectored_entries_0_2_valid_0 | sectored_entries_0_2_valid_1;
		sector_hits_2 = (((_r_sectored_repl_addr_valids_T_6 | sectored_entries_0_2_valid_2) | sectored_entries_0_2_valid_3) & (_hitsVec_T_12 == 25'h0000000)) & ~sectored_entries_0_2_tag_v;
		_r_sectored_repl_addr_valids_T_9 = sectored_entries_0_3_valid_0 | sectored_entries_0_3_valid_1;
		sector_hits_3 = (((_r_sectored_repl_addr_valids_T_9 | sectored_entries_0_3_valid_2) | sectored_entries_0_3_valid_3) & (_hitsVec_T_18 == 25'h0000000)) & ~sectored_entries_0_3_tag_v;
		_r_sectored_repl_addr_valids_T_12 = sectored_entries_0_4_valid_0 | sectored_entries_0_4_valid_1;
		sector_hits_4 = (((_r_sectored_repl_addr_valids_T_12 | sectored_entries_0_4_valid_2) | sectored_entries_0_4_valid_3) & (_hitsVec_T_24 == 25'h0000000)) & ~sectored_entries_0_4_tag_v;
		_r_sectored_repl_addr_valids_T_15 = sectored_entries_0_5_valid_0 | sectored_entries_0_5_valid_1;
		sector_hits_5 = (((_r_sectored_repl_addr_valids_T_15 | sectored_entries_0_5_valid_2) | sectored_entries_0_5_valid_3) & (_hitsVec_T_30 == 25'h0000000)) & ~sectored_entries_0_5_tag_v;
		_r_sectored_repl_addr_valids_T_18 = sectored_entries_0_6_valid_0 | sectored_entries_0_6_valid_1;
		sector_hits_6 = (((_r_sectored_repl_addr_valids_T_18 | sectored_entries_0_6_valid_2) | sectored_entries_0_6_valid_3) & (_hitsVec_T_36 == 25'h0000000)) & ~sectored_entries_0_6_tag_v;
		_r_sectored_repl_addr_valids_T_21 = sectored_entries_0_7_valid_0 | sectored_entries_0_7_valid_1;
		sector_hits_7 = (((_r_sectored_repl_addr_valids_T_21 | sectored_entries_0_7_valid_2) | sectored_entries_0_7_valid_3) & (_hitsVec_T_42 == 25'h0000000)) & ~sectored_entries_0_7_tag_v;
		newEntry_g = io_ptw_resp_bits_pte_g & io_ptw_resp_bits_pte_v;
		newEntry_sr = ((io_ptw_resp_bits_pte_v & (io_ptw_resp_bits_pte_r | (io_ptw_resp_bits_pte_x & ~io_ptw_resp_bits_pte_w))) & io_ptw_resp_bits_pte_a) & io_ptw_resp_bits_pte_r;
		newEntry_sw = (((io_ptw_resp_bits_pte_v & (io_ptw_resp_bits_pte_r | (io_ptw_resp_bits_pte_x & ~io_ptw_resp_bits_pte_w))) & io_ptw_resp_bits_pte_a) & io_ptw_resp_bits_pte_w) & io_ptw_resp_bits_pte_d;
		newEntry_sx = ((io_ptw_resp_bits_pte_v & (io_ptw_resp_bits_pte_r | (io_ptw_resp_bits_pte_x & ~io_ptw_resp_bits_pte_w))) & io_ptw_resp_bits_pte_a) & io_ptw_resp_bits_pte_x;
		_GEN_16 = _GEN_15 | special_entry_valid_0;
		_GEN_17 = ~io_ptw_resp_bits_level[1] & (waddr == 2'h0);
		_GEN_18 = (io_ptw_resp_valid & io_ptw_resp_bits_homogeneous) & _GEN_17;
		_GEN_19 = (_GEN_18 ? ~invalidate_refill : superpage_entries_0_valid_0);
		_GEN_20 = ~io_ptw_resp_bits_level[1] & (waddr == 2'h1);
		_GEN_21 = (io_ptw_resp_valid & io_ptw_resp_bits_homogeneous) & _GEN_20;
		_GEN_22 = (_GEN_21 ? ~invalidate_refill : superpage_entries_1_valid_0);
		_GEN_23 = ~io_ptw_resp_bits_level[1] & (waddr == 2'h2);
		_GEN_24 = (io_ptw_resp_valid & io_ptw_resp_bits_homogeneous) & _GEN_23;
		_GEN_25 = (_GEN_24 ? ~invalidate_refill : superpage_entries_2_valid_0);
		_GEN_26 = ~io_ptw_resp_bits_level[1] & (&waddr);
		_GEN_27 = (io_ptw_resp_valid & io_ptw_resp_bits_homogeneous) & _GEN_26;
		_GEN_28 = (_GEN_27 ? ~invalidate_refill : superpage_entries_3_valid_0);
		waddr_1 = (r_sectored_hit_valid ? r_sectored_hit_bits : r_sectored_repl_addr);
		_GEN_29 = waddr_1 == 3'h0;
		_GEN_31 = (~io_ptw_resp_valid | _GEN_30) | ~_GEN_29;
		_GEN_32 = r_refill_tag[1:0] == 2'h0;
		_GEN_33 = r_refill_tag[1:0] == 2'h1;
		_GEN_34 = r_refill_tag[1:0] == 2'h2;
		_sectored_entries_0_0_data_T = {io_ptw_resp_bits_pte_ppn[19:0], io_ptw_resp_bits_pte_u, newEntry_g, io_ptw_resp_bits_ae_ptw, io_ptw_resp_bits_ae_final, 1'h0, io_ptw_resp_bits_pf, io_ptw_resp_bits_gf, newEntry_sw, newEntry_sx, newEntry_sr, io_ptw_resp_bits_hw, io_ptw_resp_bits_hx, io_ptw_resp_bits_hr, prot_w, prot_x, prot_r, _pma_io_resp_pp, _pma_io_resp_al, _pma_io_resp_aa, _pma_io_resp_eff, _pma_io_resp_cacheable, 1'h0};
		_GEN_35 = (_GEN_31 ? sectored_entries_0_0_valid_0 : ~invalidate_refill & (_GEN_32 | (r_sectored_hit_valid & sectored_entries_0_0_valid_0)));
		_GEN_36 = (_GEN_31 ? sectored_entries_0_0_valid_1 : ~invalidate_refill & (_GEN_33 | (r_sectored_hit_valid & sectored_entries_0_0_valid_1)));
		_GEN_37 = (_GEN_31 ? sectored_entries_0_0_valid_2 : ~invalidate_refill & (_GEN_34 | (r_sectored_hit_valid & sectored_entries_0_0_valid_2)));
		_GEN_38 = (_GEN_31 ? sectored_entries_0_0_valid_3 : ~invalidate_refill & (&r_refill_tag[1:0] | (r_sectored_hit_valid & sectored_entries_0_0_valid_3)));
		_GEN_39 = waddr_1 == 3'h1;
		_GEN_40 = (~io_ptw_resp_valid | _GEN_30) | ~_GEN_39;
		_GEN_41 = r_refill_tag[1:0] == 2'h0;
		_GEN_42 = r_refill_tag[1:0] == 2'h1;
		_GEN_43 = r_refill_tag[1:0] == 2'h2;
		_sectored_entries_0_1_data_T = {io_ptw_resp_bits_pte_ppn[19:0], io_ptw_resp_bits_pte_u, newEntry_g, io_ptw_resp_bits_ae_ptw, io_ptw_resp_bits_ae_final, 1'h0, io_ptw_resp_bits_pf, io_ptw_resp_bits_gf, newEntry_sw, newEntry_sx, newEntry_sr, io_ptw_resp_bits_hw, io_ptw_resp_bits_hx, io_ptw_resp_bits_hr, prot_w, prot_x, prot_r, _pma_io_resp_pp, _pma_io_resp_al, _pma_io_resp_aa, _pma_io_resp_eff, _pma_io_resp_cacheable, 1'h0};
		_GEN_44 = (_GEN_40 ? sectored_entries_0_1_valid_0 : ~invalidate_refill & (_GEN_41 | (r_sectored_hit_valid & sectored_entries_0_1_valid_0)));
		_GEN_45 = (_GEN_40 ? sectored_entries_0_1_valid_1 : ~invalidate_refill & (_GEN_42 | (r_sectored_hit_valid & sectored_entries_0_1_valid_1)));
		_GEN_46 = (_GEN_40 ? sectored_entries_0_1_valid_2 : ~invalidate_refill & (_GEN_43 | (r_sectored_hit_valid & sectored_entries_0_1_valid_2)));
		_GEN_47 = (_GEN_40 ? sectored_entries_0_1_valid_3 : ~invalidate_refill & (&r_refill_tag[1:0] | (r_sectored_hit_valid & sectored_entries_0_1_valid_3)));
		_GEN_48 = waddr_1 == 3'h2;
		_GEN_49 = (~io_ptw_resp_valid | _GEN_30) | ~_GEN_48;
		_GEN_50 = r_refill_tag[1:0] == 2'h0;
		_GEN_51 = r_refill_tag[1:0] == 2'h1;
		_GEN_52 = r_refill_tag[1:0] == 2'h2;
		_sectored_entries_0_2_data_T = {io_ptw_resp_bits_pte_ppn[19:0], io_ptw_resp_bits_pte_u, newEntry_g, io_ptw_resp_bits_ae_ptw, io_ptw_resp_bits_ae_final, 1'h0, io_ptw_resp_bits_pf, io_ptw_resp_bits_gf, newEntry_sw, newEntry_sx, newEntry_sr, io_ptw_resp_bits_hw, io_ptw_resp_bits_hx, io_ptw_resp_bits_hr, prot_w, prot_x, prot_r, _pma_io_resp_pp, _pma_io_resp_al, _pma_io_resp_aa, _pma_io_resp_eff, _pma_io_resp_cacheable, 1'h0};
		_GEN_53 = (_GEN_49 ? sectored_entries_0_2_valid_0 : ~invalidate_refill & (_GEN_50 | (r_sectored_hit_valid & sectored_entries_0_2_valid_0)));
		_GEN_54 = (_GEN_49 ? sectored_entries_0_2_valid_1 : ~invalidate_refill & (_GEN_51 | (r_sectored_hit_valid & sectored_entries_0_2_valid_1)));
		_GEN_55 = (_GEN_49 ? sectored_entries_0_2_valid_2 : ~invalidate_refill & (_GEN_52 | (r_sectored_hit_valid & sectored_entries_0_2_valid_2)));
		_GEN_56 = (_GEN_49 ? sectored_entries_0_2_valid_3 : ~invalidate_refill & (&r_refill_tag[1:0] | (r_sectored_hit_valid & sectored_entries_0_2_valid_3)));
		_GEN_57 = waddr_1 == 3'h3;
		_GEN_58 = (~io_ptw_resp_valid | _GEN_30) | ~_GEN_57;
		_GEN_59 = r_refill_tag[1:0] == 2'h0;
		_GEN_60 = r_refill_tag[1:0] == 2'h1;
		_GEN_61 = r_refill_tag[1:0] == 2'h2;
		_sectored_entries_0_3_data_T = {io_ptw_resp_bits_pte_ppn[19:0], io_ptw_resp_bits_pte_u, newEntry_g, io_ptw_resp_bits_ae_ptw, io_ptw_resp_bits_ae_final, 1'h0, io_ptw_resp_bits_pf, io_ptw_resp_bits_gf, newEntry_sw, newEntry_sx, newEntry_sr, io_ptw_resp_bits_hw, io_ptw_resp_bits_hx, io_ptw_resp_bits_hr, prot_w, prot_x, prot_r, _pma_io_resp_pp, _pma_io_resp_al, _pma_io_resp_aa, _pma_io_resp_eff, _pma_io_resp_cacheable, 1'h0};
		_GEN_62 = (_GEN_58 ? sectored_entries_0_3_valid_0 : ~invalidate_refill & (_GEN_59 | (r_sectored_hit_valid & sectored_entries_0_3_valid_0)));
		_GEN_63 = (_GEN_58 ? sectored_entries_0_3_valid_1 : ~invalidate_refill & (_GEN_60 | (r_sectored_hit_valid & sectored_entries_0_3_valid_1)));
		_GEN_64 = (_GEN_58 ? sectored_entries_0_3_valid_2 : ~invalidate_refill & (_GEN_61 | (r_sectored_hit_valid & sectored_entries_0_3_valid_2)));
		_GEN_65 = (_GEN_58 ? sectored_entries_0_3_valid_3 : ~invalidate_refill & (&r_refill_tag[1:0] | (r_sectored_hit_valid & sectored_entries_0_3_valid_3)));
		_GEN_66 = waddr_1 == 3'h4;
		_GEN_67 = (~io_ptw_resp_valid | _GEN_30) | ~_GEN_66;
		_GEN_68 = r_refill_tag[1:0] == 2'h0;
		_GEN_69 = r_refill_tag[1:0] == 2'h1;
		_GEN_70 = r_refill_tag[1:0] == 2'h2;
		_sectored_entries_0_4_data_T = {io_ptw_resp_bits_pte_ppn[19:0], io_ptw_resp_bits_pte_u, newEntry_g, io_ptw_resp_bits_ae_ptw, io_ptw_resp_bits_ae_final, 1'h0, io_ptw_resp_bits_pf, io_ptw_resp_bits_gf, newEntry_sw, newEntry_sx, newEntry_sr, io_ptw_resp_bits_hw, io_ptw_resp_bits_hx, io_ptw_resp_bits_hr, prot_w, prot_x, prot_r, _pma_io_resp_pp, _pma_io_resp_al, _pma_io_resp_aa, _pma_io_resp_eff, _pma_io_resp_cacheable, 1'h0};
		_GEN_71 = (_GEN_67 ? sectored_entries_0_4_valid_0 : ~invalidate_refill & (_GEN_68 | (r_sectored_hit_valid & sectored_entries_0_4_valid_0)));
		_GEN_72 = (_GEN_67 ? sectored_entries_0_4_valid_1 : ~invalidate_refill & (_GEN_69 | (r_sectored_hit_valid & sectored_entries_0_4_valid_1)));
		_GEN_73 = (_GEN_67 ? sectored_entries_0_4_valid_2 : ~invalidate_refill & (_GEN_70 | (r_sectored_hit_valid & sectored_entries_0_4_valid_2)));
		_GEN_74 = (_GEN_67 ? sectored_entries_0_4_valid_3 : ~invalidate_refill & (&r_refill_tag[1:0] | (r_sectored_hit_valid & sectored_entries_0_4_valid_3)));
		_GEN_75 = waddr_1 == 3'h5;
		_GEN_76 = (~io_ptw_resp_valid | _GEN_30) | ~_GEN_75;
		_GEN_77 = r_refill_tag[1:0] == 2'h0;
		_GEN_78 = r_refill_tag[1:0] == 2'h1;
		_GEN_79 = r_refill_tag[1:0] == 2'h2;
		_sectored_entries_0_5_data_T = {io_ptw_resp_bits_pte_ppn[19:0], io_ptw_resp_bits_pte_u, newEntry_g, io_ptw_resp_bits_ae_ptw, io_ptw_resp_bits_ae_final, 1'h0, io_ptw_resp_bits_pf, io_ptw_resp_bits_gf, newEntry_sw, newEntry_sx, newEntry_sr, io_ptw_resp_bits_hw, io_ptw_resp_bits_hx, io_ptw_resp_bits_hr, prot_w, prot_x, prot_r, _pma_io_resp_pp, _pma_io_resp_al, _pma_io_resp_aa, _pma_io_resp_eff, _pma_io_resp_cacheable, 1'h0};
		_GEN_80 = (_GEN_76 ? sectored_entries_0_5_valid_0 : ~invalidate_refill & (_GEN_77 | (r_sectored_hit_valid & sectored_entries_0_5_valid_0)));
		_GEN_81 = (_GEN_76 ? sectored_entries_0_5_valid_1 : ~invalidate_refill & (_GEN_78 | (r_sectored_hit_valid & sectored_entries_0_5_valid_1)));
		_GEN_82 = (_GEN_76 ? sectored_entries_0_5_valid_2 : ~invalidate_refill & (_GEN_79 | (r_sectored_hit_valid & sectored_entries_0_5_valid_2)));
		_GEN_83 = (_GEN_76 ? sectored_entries_0_5_valid_3 : ~invalidate_refill & (&r_refill_tag[1:0] | (r_sectored_hit_valid & sectored_entries_0_5_valid_3)));
		_GEN_84 = waddr_1 == 3'h6;
		_GEN_85 = (~io_ptw_resp_valid | _GEN_30) | ~_GEN_84;
		_GEN_86 = r_refill_tag[1:0] == 2'h0;
		_GEN_87 = r_refill_tag[1:0] == 2'h1;
		_GEN_88 = r_refill_tag[1:0] == 2'h2;
		_sectored_entries_0_6_data_T = {io_ptw_resp_bits_pte_ppn[19:0], io_ptw_resp_bits_pte_u, newEntry_g, io_ptw_resp_bits_ae_ptw, io_ptw_resp_bits_ae_final, 1'h0, io_ptw_resp_bits_pf, io_ptw_resp_bits_gf, newEntry_sw, newEntry_sx, newEntry_sr, io_ptw_resp_bits_hw, io_ptw_resp_bits_hx, io_ptw_resp_bits_hr, prot_w, prot_x, prot_r, _pma_io_resp_pp, _pma_io_resp_al, _pma_io_resp_aa, _pma_io_resp_eff, _pma_io_resp_cacheable, 1'h0};
		_GEN_89 = (_GEN_85 ? sectored_entries_0_6_valid_0 : ~invalidate_refill & (_GEN_86 | (r_sectored_hit_valid & sectored_entries_0_6_valid_0)));
		_GEN_90 = (_GEN_85 ? sectored_entries_0_6_valid_1 : ~invalidate_refill & (_GEN_87 | (r_sectored_hit_valid & sectored_entries_0_6_valid_1)));
		_GEN_91 = (_GEN_85 ? sectored_entries_0_6_valid_2 : ~invalidate_refill & (_GEN_88 | (r_sectored_hit_valid & sectored_entries_0_6_valid_2)));
		_GEN_92 = (_GEN_85 ? sectored_entries_0_6_valid_3 : ~invalidate_refill & (&r_refill_tag[1:0] | (r_sectored_hit_valid & sectored_entries_0_6_valid_3)));
		_GEN_93 = (~io_ptw_resp_valid | _GEN_30) | ~(&waddr_1);
		_GEN_94 = r_refill_tag[1:0] == 2'h0;
		_GEN_95 = r_refill_tag[1:0] == 2'h1;
		_GEN_96 = r_refill_tag[1:0] == 2'h2;
		_sectored_entries_0_7_data_T = {io_ptw_resp_bits_pte_ppn[19:0], io_ptw_resp_bits_pte_u, newEntry_g, io_ptw_resp_bits_ae_ptw, io_ptw_resp_bits_ae_final, 1'h0, io_ptw_resp_bits_pf, io_ptw_resp_bits_gf, newEntry_sw, newEntry_sx, newEntry_sr, io_ptw_resp_bits_hw, io_ptw_resp_bits_hx, io_ptw_resp_bits_hr, prot_w, prot_x, prot_r, _pma_io_resp_pp, _pma_io_resp_al, _pma_io_resp_aa, _pma_io_resp_eff, _pma_io_resp_cacheable, 1'h0};
		_GEN_97 = (_GEN_93 ? sectored_entries_0_7_valid_0 : ~invalidate_refill & (_GEN_94 | (r_sectored_hit_valid & sectored_entries_0_7_valid_0)));
		_GEN_98 = (_GEN_93 ? sectored_entries_0_7_valid_1 : ~invalidate_refill & (_GEN_95 | (r_sectored_hit_valid & sectored_entries_0_7_valid_1)));
		_GEN_99 = (_GEN_93 ? sectored_entries_0_7_valid_2 : ~invalidate_refill & (_GEN_96 | (r_sectored_hit_valid & sectored_entries_0_7_valid_2)));
		_GEN_100 = (_GEN_93 ? sectored_entries_0_7_valid_3 : ~invalidate_refill & (&r_refill_tag[1:0] | (r_sectored_hit_valid & sectored_entries_0_7_valid_3)));
		_GEN_101 = {sector_hits_7, sector_hits_6, sector_hits_5};
		_GEN_102 = {sector_hits_3, sector_hits_2, sector_hits_1};
		_GEN_103 = ((state == 2'h0) & io_req_valid) & tlb_miss;
		_GEN_104 = (_hitsVec_T == 25'h0000000) & ~sectored_entries_0_0_tag_v;
		_GEN_106 = (_GEN_104 & ~sectored_entries_0_0_tag_v) & _GEN_105;
		_GEN_108 = (_GEN_104 & ~sectored_entries_0_0_tag_v) & _GEN_107;
		_GEN_110 = (_GEN_104 & ~sectored_entries_0_0_tag_v) & _GEN_109;
		_GEN_111 = (_GEN_104 & ~sectored_entries_0_0_tag_v) & (&io_req_bits_vaddr[13:12]);
		_GEN_113 = (_hitsVec_T_6 == 25'h0000000) & ~sectored_entries_0_1_tag_v;
		_GEN_114 = (_GEN_113 & ~sectored_entries_0_1_tag_v) & _GEN_105;
		_GEN_115 = (_GEN_113 & ~sectored_entries_0_1_tag_v) & _GEN_107;
		_GEN_116 = (_GEN_113 & ~sectored_entries_0_1_tag_v) & _GEN_109;
		_GEN_117 = (_GEN_113 & ~sectored_entries_0_1_tag_v) & (&io_req_bits_vaddr[13:12]);
		_GEN_119 = (_hitsVec_T_12 == 25'h0000000) & ~sectored_entries_0_2_tag_v;
		_GEN_120 = (_GEN_119 & ~sectored_entries_0_2_tag_v) & _GEN_105;
		_GEN_121 = (_GEN_119 & ~sectored_entries_0_2_tag_v) & _GEN_107;
		_GEN_122 = (_GEN_119 & ~sectored_entries_0_2_tag_v) & _GEN_109;
		_GEN_123 = (_GEN_119 & ~sectored_entries_0_2_tag_v) & (&io_req_bits_vaddr[13:12]);
		_GEN_125 = (_hitsVec_T_18 == 25'h0000000) & ~sectored_entries_0_3_tag_v;
		_GEN_126 = (_GEN_125 & ~sectored_entries_0_3_tag_v) & _GEN_105;
		_GEN_127 = (_GEN_125 & ~sectored_entries_0_3_tag_v) & _GEN_107;
		_GEN_128 = (_GEN_125 & ~sectored_entries_0_3_tag_v) & _GEN_109;
		_GEN_129 = (_GEN_125 & ~sectored_entries_0_3_tag_v) & (&io_req_bits_vaddr[13:12]);
		_GEN_131 = (_hitsVec_T_24 == 25'h0000000) & ~sectored_entries_0_4_tag_v;
		_GEN_132 = (_GEN_131 & ~sectored_entries_0_4_tag_v) & _GEN_105;
		_GEN_133 = (_GEN_131 & ~sectored_entries_0_4_tag_v) & _GEN_107;
		_GEN_134 = (_GEN_131 & ~sectored_entries_0_4_tag_v) & _GEN_109;
		_GEN_135 = (_GEN_131 & ~sectored_entries_0_4_tag_v) & (&io_req_bits_vaddr[13:12]);
		_GEN_137 = (_hitsVec_T_30 == 25'h0000000) & ~sectored_entries_0_5_tag_v;
		_GEN_138 = (_GEN_137 & ~sectored_entries_0_5_tag_v) & _GEN_105;
		_GEN_139 = (_GEN_137 & ~sectored_entries_0_5_tag_v) & _GEN_107;
		_GEN_140 = (_GEN_137 & ~sectored_entries_0_5_tag_v) & _GEN_109;
		_GEN_141 = (_GEN_137 & ~sectored_entries_0_5_tag_v) & (&io_req_bits_vaddr[13:12]);
		_GEN_143 = (_hitsVec_T_36 == 25'h0000000) & ~sectored_entries_0_6_tag_v;
		_GEN_144 = (_GEN_143 & ~sectored_entries_0_6_tag_v) & _GEN_105;
		_GEN_145 = (_GEN_143 & ~sectored_entries_0_6_tag_v) & _GEN_107;
		_GEN_146 = (_GEN_143 & ~sectored_entries_0_6_tag_v) & _GEN_109;
		_GEN_147 = (_GEN_143 & ~sectored_entries_0_6_tag_v) & (&io_req_bits_vaddr[13:12]);
		_GEN_149 = (_hitsVec_T_42 == 25'h0000000) & ~sectored_entries_0_7_tag_v;
		_GEN_150 = (_GEN_149 & ~sectored_entries_0_7_tag_v) & _GEN_105;
		_GEN_151 = (_GEN_149 & ~sectored_entries_0_7_tag_v) & _GEN_107;
		_GEN_152 = (_GEN_149 & ~sectored_entries_0_7_tag_v) & _GEN_109;
		_GEN_153 = (_GEN_149 & ~sectored_entries_0_7_tag_v) & (&io_req_bits_vaddr[13:12]);
		_GEN_156 = ((superpage_entries_0_valid_0 & ~superpage_entries_0_tag_v) & _GEN_155) & (ignore_1 | (_hitsVec_T_58[8:0] == 9'h000));
		_GEN_158 = ((superpage_entries_1_valid_0 & ~superpage_entries_1_tag_v) & _GEN_157) & (ignore_4 | (_hitsVec_T_73[8:0] == 9'h000));
		_GEN_160 = ((superpage_entries_2_valid_0 & ~superpage_entries_2_tag_v) & _GEN_159) & (ignore_7 | (_hitsVec_T_88[8:0] == 9'h000));
		_GEN_162 = ((superpage_entries_3_valid_0 & ~superpage_entries_3_tag_v) & _GEN_161) & (ignore_10 | (_hitsVec_T_103[8:0] == 9'h000));
		_GEN_164 = ((special_entry_valid_0 & _GEN_163) & (ignore_13 | (_hitsVec_T_118[17:9] == 9'h000))) & (~special_entry_level[1] | (_hitsVec_T_118[8:0] == 9'h000));
		if (_GEN_31)
			;
		else
			sectored_entries_0_0_tag_vpn <= r_refill_tag;
		sectored_entries_0_0_tag_v <= _GEN_31 & sectored_entries_0_0_tag_v;
		if ((~io_ptw_resp_valid | _GEN_30) | ~(_GEN_29 & _GEN_32))
			;
		else
			sectored_entries_0_0_data_0 <= _sectored_entries_0_0_data_T;
		if ((~io_ptw_resp_valid | _GEN_30) | ~(_GEN_29 & _GEN_33))
			;
		else
			sectored_entries_0_0_data_1 <= _sectored_entries_0_0_data_T;
		if ((~io_ptw_resp_valid | _GEN_30) | ~(_GEN_29 & _GEN_34))
			;
		else
			sectored_entries_0_0_data_2 <= _sectored_entries_0_0_data_T;
		if ((~io_ptw_resp_valid | _GEN_30) | ~(_GEN_29 & (&r_refill_tag[1:0])))
			;
		else
			sectored_entries_0_0_data_3 <= _sectored_entries_0_0_data_T;
		sectored_entries_0_0_valid_0 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_112 ? ~((~sectored_entries_0_0_tag_v & sectored_entries_0_0_data_0[0]) | _GEN_106) & _GEN_35 : ~_GEN_106 & _GEN_35) : (io_sfence_bits_rs2 ? ~(~sectored_entries_0_0_tag_v & ~sectored_entries_0_0_data_0[20]) & _GEN_35 : sectored_entries_0_0_tag_v & _GEN_35)) : _GEN_35);
		sectored_entries_0_0_valid_1 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_112 ? ~((~sectored_entries_0_0_tag_v & sectored_entries_0_0_data_1[0]) | _GEN_108) & _GEN_36 : ~_GEN_108 & _GEN_36) : (io_sfence_bits_rs2 ? ~(~sectored_entries_0_0_tag_v & ~sectored_entries_0_0_data_1[20]) & _GEN_36 : sectored_entries_0_0_tag_v & _GEN_36)) : _GEN_36);
		sectored_entries_0_0_valid_2 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_112 ? ~((~sectored_entries_0_0_tag_v & sectored_entries_0_0_data_2[0]) | _GEN_110) & _GEN_37 : ~_GEN_110 & _GEN_37) : (io_sfence_bits_rs2 ? ~(~sectored_entries_0_0_tag_v & ~sectored_entries_0_0_data_2[20]) & _GEN_37 : sectored_entries_0_0_tag_v & _GEN_37)) : _GEN_37);
		sectored_entries_0_0_valid_3 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_112 ? ~((~sectored_entries_0_0_tag_v & sectored_entries_0_0_data_3[0]) | _GEN_111) & _GEN_38 : ~_GEN_111 & _GEN_38) : (io_sfence_bits_rs2 ? ~(~sectored_entries_0_0_tag_v & ~sectored_entries_0_0_data_3[20]) & _GEN_38 : sectored_entries_0_0_tag_v & _GEN_38)) : _GEN_38);
		if (_GEN_40)
			;
		else
			sectored_entries_0_1_tag_vpn <= r_refill_tag;
		sectored_entries_0_1_tag_v <= _GEN_40 & sectored_entries_0_1_tag_v;
		if ((~io_ptw_resp_valid | _GEN_30) | ~(_GEN_39 & _GEN_41))
			;
		else
			sectored_entries_0_1_data_0 <= _sectored_entries_0_1_data_T;
		if ((~io_ptw_resp_valid | _GEN_30) | ~(_GEN_39 & _GEN_42))
			;
		else
			sectored_entries_0_1_data_1 <= _sectored_entries_0_1_data_T;
		if ((~io_ptw_resp_valid | _GEN_30) | ~(_GEN_39 & _GEN_43))
			;
		else
			sectored_entries_0_1_data_2 <= _sectored_entries_0_1_data_T;
		if ((~io_ptw_resp_valid | _GEN_30) | ~(_GEN_39 & (&r_refill_tag[1:0])))
			;
		else
			sectored_entries_0_1_data_3 <= _sectored_entries_0_1_data_T;
		sectored_entries_0_1_valid_0 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_118 ? ~((~sectored_entries_0_1_tag_v & sectored_entries_0_1_data_0[0]) | _GEN_114) & _GEN_44 : ~_GEN_114 & _GEN_44) : (io_sfence_bits_rs2 ? ~(~sectored_entries_0_1_tag_v & ~sectored_entries_0_1_data_0[20]) & _GEN_44 : sectored_entries_0_1_tag_v & _GEN_44)) : _GEN_44);
		sectored_entries_0_1_valid_1 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_118 ? ~((~sectored_entries_0_1_tag_v & sectored_entries_0_1_data_1[0]) | _GEN_115) & _GEN_45 : ~_GEN_115 & _GEN_45) : (io_sfence_bits_rs2 ? ~(~sectored_entries_0_1_tag_v & ~sectored_entries_0_1_data_1[20]) & _GEN_45 : sectored_entries_0_1_tag_v & _GEN_45)) : _GEN_45);
		sectored_entries_0_1_valid_2 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_118 ? ~((~sectored_entries_0_1_tag_v & sectored_entries_0_1_data_2[0]) | _GEN_116) & _GEN_46 : ~_GEN_116 & _GEN_46) : (io_sfence_bits_rs2 ? ~(~sectored_entries_0_1_tag_v & ~sectored_entries_0_1_data_2[20]) & _GEN_46 : sectored_entries_0_1_tag_v & _GEN_46)) : _GEN_46);
		sectored_entries_0_1_valid_3 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_118 ? ~((~sectored_entries_0_1_tag_v & sectored_entries_0_1_data_3[0]) | _GEN_117) & _GEN_47 : ~_GEN_117 & _GEN_47) : (io_sfence_bits_rs2 ? ~(~sectored_entries_0_1_tag_v & ~sectored_entries_0_1_data_3[20]) & _GEN_47 : sectored_entries_0_1_tag_v & _GEN_47)) : _GEN_47);
		if (_GEN_49)
			;
		else
			sectored_entries_0_2_tag_vpn <= r_refill_tag;
		sectored_entries_0_2_tag_v <= _GEN_49 & sectored_entries_0_2_tag_v;
		if ((~io_ptw_resp_valid | _GEN_30) | ~(_GEN_48 & _GEN_50))
			;
		else
			sectored_entries_0_2_data_0 <= _sectored_entries_0_2_data_T;
		if ((~io_ptw_resp_valid | _GEN_30) | ~(_GEN_48 & _GEN_51))
			;
		else
			sectored_entries_0_2_data_1 <= _sectored_entries_0_2_data_T;
		if ((~io_ptw_resp_valid | _GEN_30) | ~(_GEN_48 & _GEN_52))
			;
		else
			sectored_entries_0_2_data_2 <= _sectored_entries_0_2_data_T;
		if ((~io_ptw_resp_valid | _GEN_30) | ~(_GEN_48 & (&r_refill_tag[1:0])))
			;
		else
			sectored_entries_0_2_data_3 <= _sectored_entries_0_2_data_T;
		sectored_entries_0_2_valid_0 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_124 ? ~((~sectored_entries_0_2_tag_v & sectored_entries_0_2_data_0[0]) | _GEN_120) & _GEN_53 : ~_GEN_120 & _GEN_53) : (io_sfence_bits_rs2 ? ~(~sectored_entries_0_2_tag_v & ~sectored_entries_0_2_data_0[20]) & _GEN_53 : sectored_entries_0_2_tag_v & _GEN_53)) : _GEN_53);
		sectored_entries_0_2_valid_1 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_124 ? ~((~sectored_entries_0_2_tag_v & sectored_entries_0_2_data_1[0]) | _GEN_121) & _GEN_54 : ~_GEN_121 & _GEN_54) : (io_sfence_bits_rs2 ? ~(~sectored_entries_0_2_tag_v & ~sectored_entries_0_2_data_1[20]) & _GEN_54 : sectored_entries_0_2_tag_v & _GEN_54)) : _GEN_54);
		sectored_entries_0_2_valid_2 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_124 ? ~((~sectored_entries_0_2_tag_v & sectored_entries_0_2_data_2[0]) | _GEN_122) & _GEN_55 : ~_GEN_122 & _GEN_55) : (io_sfence_bits_rs2 ? ~(~sectored_entries_0_2_tag_v & ~sectored_entries_0_2_data_2[20]) & _GEN_55 : sectored_entries_0_2_tag_v & _GEN_55)) : _GEN_55);
		sectored_entries_0_2_valid_3 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_124 ? ~((~sectored_entries_0_2_tag_v & sectored_entries_0_2_data_3[0]) | _GEN_123) & _GEN_56 : ~_GEN_123 & _GEN_56) : (io_sfence_bits_rs2 ? ~(~sectored_entries_0_2_tag_v & ~sectored_entries_0_2_data_3[20]) & _GEN_56 : sectored_entries_0_2_tag_v & _GEN_56)) : _GEN_56);
		if (_GEN_58)
			;
		else
			sectored_entries_0_3_tag_vpn <= r_refill_tag;
		sectored_entries_0_3_tag_v <= _GEN_58 & sectored_entries_0_3_tag_v;
		if ((~io_ptw_resp_valid | _GEN_30) | ~(_GEN_57 & _GEN_59))
			;
		else
			sectored_entries_0_3_data_0 <= _sectored_entries_0_3_data_T;
		if ((~io_ptw_resp_valid | _GEN_30) | ~(_GEN_57 & _GEN_60))
			;
		else
			sectored_entries_0_3_data_1 <= _sectored_entries_0_3_data_T;
		if ((~io_ptw_resp_valid | _GEN_30) | ~(_GEN_57 & _GEN_61))
			;
		else
			sectored_entries_0_3_data_2 <= _sectored_entries_0_3_data_T;
		if ((~io_ptw_resp_valid | _GEN_30) | ~(_GEN_57 & (&r_refill_tag[1:0])))
			;
		else
			sectored_entries_0_3_data_3 <= _sectored_entries_0_3_data_T;
		sectored_entries_0_3_valid_0 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_130 ? ~((~sectored_entries_0_3_tag_v & sectored_entries_0_3_data_0[0]) | _GEN_126) & _GEN_62 : ~_GEN_126 & _GEN_62) : (io_sfence_bits_rs2 ? ~(~sectored_entries_0_3_tag_v & ~sectored_entries_0_3_data_0[20]) & _GEN_62 : sectored_entries_0_3_tag_v & _GEN_62)) : _GEN_62);
		sectored_entries_0_3_valid_1 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_130 ? ~((~sectored_entries_0_3_tag_v & sectored_entries_0_3_data_1[0]) | _GEN_127) & _GEN_63 : ~_GEN_127 & _GEN_63) : (io_sfence_bits_rs2 ? ~(~sectored_entries_0_3_tag_v & ~sectored_entries_0_3_data_1[20]) & _GEN_63 : sectored_entries_0_3_tag_v & _GEN_63)) : _GEN_63);
		sectored_entries_0_3_valid_2 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_130 ? ~((~sectored_entries_0_3_tag_v & sectored_entries_0_3_data_2[0]) | _GEN_128) & _GEN_64 : ~_GEN_128 & _GEN_64) : (io_sfence_bits_rs2 ? ~(~sectored_entries_0_3_tag_v & ~sectored_entries_0_3_data_2[20]) & _GEN_64 : sectored_entries_0_3_tag_v & _GEN_64)) : _GEN_64);
		sectored_entries_0_3_valid_3 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_130 ? ~((~sectored_entries_0_3_tag_v & sectored_entries_0_3_data_3[0]) | _GEN_129) & _GEN_65 : ~_GEN_129 & _GEN_65) : (io_sfence_bits_rs2 ? ~(~sectored_entries_0_3_tag_v & ~sectored_entries_0_3_data_3[20]) & _GEN_65 : sectored_entries_0_3_tag_v & _GEN_65)) : _GEN_65);
		if (_GEN_67)
			;
		else
			sectored_entries_0_4_tag_vpn <= r_refill_tag;
		sectored_entries_0_4_tag_v <= _GEN_67 & sectored_entries_0_4_tag_v;
		if ((~io_ptw_resp_valid | _GEN_30) | ~(_GEN_66 & _GEN_68))
			;
		else
			sectored_entries_0_4_data_0 <= _sectored_entries_0_4_data_T;
		if ((~io_ptw_resp_valid | _GEN_30) | ~(_GEN_66 & _GEN_69))
			;
		else
			sectored_entries_0_4_data_1 <= _sectored_entries_0_4_data_T;
		if ((~io_ptw_resp_valid | _GEN_30) | ~(_GEN_66 & _GEN_70))
			;
		else
			sectored_entries_0_4_data_2 <= _sectored_entries_0_4_data_T;
		if ((~io_ptw_resp_valid | _GEN_30) | ~(_GEN_66 & (&r_refill_tag[1:0])))
			;
		else
			sectored_entries_0_4_data_3 <= _sectored_entries_0_4_data_T;
		sectored_entries_0_4_valid_0 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_136 ? ~((~sectored_entries_0_4_tag_v & sectored_entries_0_4_data_0[0]) | _GEN_132) & _GEN_71 : ~_GEN_132 & _GEN_71) : (io_sfence_bits_rs2 ? ~(~sectored_entries_0_4_tag_v & ~sectored_entries_0_4_data_0[20]) & _GEN_71 : sectored_entries_0_4_tag_v & _GEN_71)) : _GEN_71);
		sectored_entries_0_4_valid_1 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_136 ? ~((~sectored_entries_0_4_tag_v & sectored_entries_0_4_data_1[0]) | _GEN_133) & _GEN_72 : ~_GEN_133 & _GEN_72) : (io_sfence_bits_rs2 ? ~(~sectored_entries_0_4_tag_v & ~sectored_entries_0_4_data_1[20]) & _GEN_72 : sectored_entries_0_4_tag_v & _GEN_72)) : _GEN_72);
		sectored_entries_0_4_valid_2 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_136 ? ~((~sectored_entries_0_4_tag_v & sectored_entries_0_4_data_2[0]) | _GEN_134) & _GEN_73 : ~_GEN_134 & _GEN_73) : (io_sfence_bits_rs2 ? ~(~sectored_entries_0_4_tag_v & ~sectored_entries_0_4_data_2[20]) & _GEN_73 : sectored_entries_0_4_tag_v & _GEN_73)) : _GEN_73);
		sectored_entries_0_4_valid_3 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_136 ? ~((~sectored_entries_0_4_tag_v & sectored_entries_0_4_data_3[0]) | _GEN_135) & _GEN_74 : ~_GEN_135 & _GEN_74) : (io_sfence_bits_rs2 ? ~(~sectored_entries_0_4_tag_v & ~sectored_entries_0_4_data_3[20]) & _GEN_74 : sectored_entries_0_4_tag_v & _GEN_74)) : _GEN_74);
		if (_GEN_76)
			;
		else
			sectored_entries_0_5_tag_vpn <= r_refill_tag;
		sectored_entries_0_5_tag_v <= _GEN_76 & sectored_entries_0_5_tag_v;
		if ((~io_ptw_resp_valid | _GEN_30) | ~(_GEN_75 & _GEN_77))
			;
		else
			sectored_entries_0_5_data_0 <= _sectored_entries_0_5_data_T;
		if ((~io_ptw_resp_valid | _GEN_30) | ~(_GEN_75 & _GEN_78))
			;
		else
			sectored_entries_0_5_data_1 <= _sectored_entries_0_5_data_T;
		if ((~io_ptw_resp_valid | _GEN_30) | ~(_GEN_75 & _GEN_79))
			;
		else
			sectored_entries_0_5_data_2 <= _sectored_entries_0_5_data_T;
		if ((~io_ptw_resp_valid | _GEN_30) | ~(_GEN_75 & (&r_refill_tag[1:0])))
			;
		else
			sectored_entries_0_5_data_3 <= _sectored_entries_0_5_data_T;
		sectored_entries_0_5_valid_0 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_142 ? ~((~sectored_entries_0_5_tag_v & sectored_entries_0_5_data_0[0]) | _GEN_138) & _GEN_80 : ~_GEN_138 & _GEN_80) : (io_sfence_bits_rs2 ? ~(~sectored_entries_0_5_tag_v & ~sectored_entries_0_5_data_0[20]) & _GEN_80 : sectored_entries_0_5_tag_v & _GEN_80)) : _GEN_80);
		sectored_entries_0_5_valid_1 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_142 ? ~((~sectored_entries_0_5_tag_v & sectored_entries_0_5_data_1[0]) | _GEN_139) & _GEN_81 : ~_GEN_139 & _GEN_81) : (io_sfence_bits_rs2 ? ~(~sectored_entries_0_5_tag_v & ~sectored_entries_0_5_data_1[20]) & _GEN_81 : sectored_entries_0_5_tag_v & _GEN_81)) : _GEN_81);
		sectored_entries_0_5_valid_2 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_142 ? ~((~sectored_entries_0_5_tag_v & sectored_entries_0_5_data_2[0]) | _GEN_140) & _GEN_82 : ~_GEN_140 & _GEN_82) : (io_sfence_bits_rs2 ? ~(~sectored_entries_0_5_tag_v & ~sectored_entries_0_5_data_2[20]) & _GEN_82 : sectored_entries_0_5_tag_v & _GEN_82)) : _GEN_82);
		sectored_entries_0_5_valid_3 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_142 ? ~((~sectored_entries_0_5_tag_v & sectored_entries_0_5_data_3[0]) | _GEN_141) & _GEN_83 : ~_GEN_141 & _GEN_83) : (io_sfence_bits_rs2 ? ~(~sectored_entries_0_5_tag_v & ~sectored_entries_0_5_data_3[20]) & _GEN_83 : sectored_entries_0_5_tag_v & _GEN_83)) : _GEN_83);
		if (_GEN_85)
			;
		else
			sectored_entries_0_6_tag_vpn <= r_refill_tag;
		sectored_entries_0_6_tag_v <= _GEN_85 & sectored_entries_0_6_tag_v;
		if ((~io_ptw_resp_valid | _GEN_30) | ~(_GEN_84 & _GEN_86))
			;
		else
			sectored_entries_0_6_data_0 <= _sectored_entries_0_6_data_T;
		if ((~io_ptw_resp_valid | _GEN_30) | ~(_GEN_84 & _GEN_87))
			;
		else
			sectored_entries_0_6_data_1 <= _sectored_entries_0_6_data_T;
		if ((~io_ptw_resp_valid | _GEN_30) | ~(_GEN_84 & _GEN_88))
			;
		else
			sectored_entries_0_6_data_2 <= _sectored_entries_0_6_data_T;
		if ((~io_ptw_resp_valid | _GEN_30) | ~(_GEN_84 & (&r_refill_tag[1:0])))
			;
		else
			sectored_entries_0_6_data_3 <= _sectored_entries_0_6_data_T;
		sectored_entries_0_6_valid_0 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_148 ? ~((~sectored_entries_0_6_tag_v & sectored_entries_0_6_data_0[0]) | _GEN_144) & _GEN_89 : ~_GEN_144 & _GEN_89) : (io_sfence_bits_rs2 ? ~(~sectored_entries_0_6_tag_v & ~sectored_entries_0_6_data_0[20]) & _GEN_89 : sectored_entries_0_6_tag_v & _GEN_89)) : _GEN_89);
		sectored_entries_0_6_valid_1 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_148 ? ~((~sectored_entries_0_6_tag_v & sectored_entries_0_6_data_1[0]) | _GEN_145) & _GEN_90 : ~_GEN_145 & _GEN_90) : (io_sfence_bits_rs2 ? ~(~sectored_entries_0_6_tag_v & ~sectored_entries_0_6_data_1[20]) & _GEN_90 : sectored_entries_0_6_tag_v & _GEN_90)) : _GEN_90);
		sectored_entries_0_6_valid_2 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_148 ? ~((~sectored_entries_0_6_tag_v & sectored_entries_0_6_data_2[0]) | _GEN_146) & _GEN_91 : ~_GEN_146 & _GEN_91) : (io_sfence_bits_rs2 ? ~(~sectored_entries_0_6_tag_v & ~sectored_entries_0_6_data_2[20]) & _GEN_91 : sectored_entries_0_6_tag_v & _GEN_91)) : _GEN_91);
		sectored_entries_0_6_valid_3 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_148 ? ~((~sectored_entries_0_6_tag_v & sectored_entries_0_6_data_3[0]) | _GEN_147) & _GEN_92 : ~_GEN_147 & _GEN_92) : (io_sfence_bits_rs2 ? ~(~sectored_entries_0_6_tag_v & ~sectored_entries_0_6_data_3[20]) & _GEN_92 : sectored_entries_0_6_tag_v & _GEN_92)) : _GEN_92);
		if (_GEN_93)
			;
		else
			sectored_entries_0_7_tag_vpn <= r_refill_tag;
		sectored_entries_0_7_tag_v <= _GEN_93 & sectored_entries_0_7_tag_v;
		if ((~io_ptw_resp_valid | _GEN_30) | ~(&waddr_1 & _GEN_94))
			;
		else
			sectored_entries_0_7_data_0 <= _sectored_entries_0_7_data_T;
		if ((~io_ptw_resp_valid | _GEN_30) | ~(&waddr_1 & _GEN_95))
			;
		else
			sectored_entries_0_7_data_1 <= _sectored_entries_0_7_data_T;
		if ((~io_ptw_resp_valid | _GEN_30) | ~(&waddr_1 & _GEN_96))
			;
		else
			sectored_entries_0_7_data_2 <= _sectored_entries_0_7_data_T;
		if ((~io_ptw_resp_valid | _GEN_30) | ~(&waddr_1 & (&r_refill_tag[1:0])))
			;
		else
			sectored_entries_0_7_data_3 <= _sectored_entries_0_7_data_T;
		sectored_entries_0_7_valid_0 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_154 ? ~((~sectored_entries_0_7_tag_v & sectored_entries_0_7_data_0[0]) | _GEN_150) & _GEN_97 : ~_GEN_150 & _GEN_97) : (io_sfence_bits_rs2 ? ~(~sectored_entries_0_7_tag_v & ~sectored_entries_0_7_data_0[20]) & _GEN_97 : sectored_entries_0_7_tag_v & _GEN_97)) : _GEN_97);
		sectored_entries_0_7_valid_1 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_154 ? ~((~sectored_entries_0_7_tag_v & sectored_entries_0_7_data_1[0]) | _GEN_151) & _GEN_98 : ~_GEN_151 & _GEN_98) : (io_sfence_bits_rs2 ? ~(~sectored_entries_0_7_tag_v & ~sectored_entries_0_7_data_1[20]) & _GEN_98 : sectored_entries_0_7_tag_v & _GEN_98)) : _GEN_98);
		sectored_entries_0_7_valid_2 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_154 ? ~((~sectored_entries_0_7_tag_v & sectored_entries_0_7_data_2[0]) | _GEN_152) & _GEN_99 : ~_GEN_152 & _GEN_99) : (io_sfence_bits_rs2 ? ~(~sectored_entries_0_7_tag_v & ~sectored_entries_0_7_data_2[20]) & _GEN_99 : sectored_entries_0_7_tag_v & _GEN_99)) : _GEN_99);
		sectored_entries_0_7_valid_3 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_154 ? ~((~sectored_entries_0_7_tag_v & sectored_entries_0_7_data_3[0]) | _GEN_153) & _GEN_100 : ~_GEN_153 & _GEN_100) : (io_sfence_bits_rs2 ? ~(~sectored_entries_0_7_tag_v & ~sectored_entries_0_7_data_3[20]) & _GEN_100 : sectored_entries_0_7_tag_v & _GEN_100)) : _GEN_100);
		if (_GEN_18) begin
			superpage_entries_0_level <= {1'h0, io_ptw_resp_bits_level[0]};
			superpage_entries_0_tag_vpn <= r_refill_tag;
		end
		superpage_entries_0_tag_v <= ((~io_ptw_resp_valid | ~io_ptw_resp_bits_homogeneous) | ~_GEN_17) & superpage_entries_0_tag_v;
		if (_GEN_18)
			superpage_entries_0_data_0 <= {io_ptw_resp_bits_pte_ppn[19:0], io_ptw_resp_bits_pte_u, newEntry_g, io_ptw_resp_bits_ae_ptw, io_ptw_resp_bits_ae_final, 1'h0, io_ptw_resp_bits_pf, io_ptw_resp_bits_gf, newEntry_sw, newEntry_sx, newEntry_sr, io_ptw_resp_bits_hw, io_ptw_resp_bits_hx, io_ptw_resp_bits_hr, prot_w, prot_x, prot_r, _pma_io_resp_pp, _pma_io_resp_al, _pma_io_resp_aa, _pma_io_resp_eff, _pma_io_resp_cacheable, 1'h0};
		superpage_entries_0_valid_0 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_155 ? ~((~superpage_entries_0_tag_v & superpage_entries_0_data_0[0]) | _GEN_156) & _GEN_19 : ~_GEN_156 & _GEN_19) : (io_sfence_bits_rs2 ? ~(~superpage_entries_0_tag_v & ~superpage_entries_0_data_0[20]) & _GEN_19 : superpage_entries_0_tag_v & _GEN_19)) : _GEN_19);
		if (_GEN_21) begin
			superpage_entries_1_level <= {1'h0, io_ptw_resp_bits_level[0]};
			superpage_entries_1_tag_vpn <= r_refill_tag;
		end
		superpage_entries_1_tag_v <= ((~io_ptw_resp_valid | ~io_ptw_resp_bits_homogeneous) | ~_GEN_20) & superpage_entries_1_tag_v;
		if (_GEN_21)
			superpage_entries_1_data_0 <= {io_ptw_resp_bits_pte_ppn[19:0], io_ptw_resp_bits_pte_u, newEntry_g, io_ptw_resp_bits_ae_ptw, io_ptw_resp_bits_ae_final, 1'h0, io_ptw_resp_bits_pf, io_ptw_resp_bits_gf, newEntry_sw, newEntry_sx, newEntry_sr, io_ptw_resp_bits_hw, io_ptw_resp_bits_hx, io_ptw_resp_bits_hr, prot_w, prot_x, prot_r, _pma_io_resp_pp, _pma_io_resp_al, _pma_io_resp_aa, _pma_io_resp_eff, _pma_io_resp_cacheable, 1'h0};
		superpage_entries_1_valid_0 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_157 ? ~((~superpage_entries_1_tag_v & superpage_entries_1_data_0[0]) | _GEN_158) & _GEN_22 : ~_GEN_158 & _GEN_22) : (io_sfence_bits_rs2 ? ~(~superpage_entries_1_tag_v & ~superpage_entries_1_data_0[20]) & _GEN_22 : superpage_entries_1_tag_v & _GEN_22)) : _GEN_22);
		if (_GEN_24) begin
			superpage_entries_2_level <= {1'h0, io_ptw_resp_bits_level[0]};
			superpage_entries_2_tag_vpn <= r_refill_tag;
		end
		superpage_entries_2_tag_v <= ((~io_ptw_resp_valid | ~io_ptw_resp_bits_homogeneous) | ~_GEN_23) & superpage_entries_2_tag_v;
		if (_GEN_24)
			superpage_entries_2_data_0 <= {io_ptw_resp_bits_pte_ppn[19:0], io_ptw_resp_bits_pte_u, newEntry_g, io_ptw_resp_bits_ae_ptw, io_ptw_resp_bits_ae_final, 1'h0, io_ptw_resp_bits_pf, io_ptw_resp_bits_gf, newEntry_sw, newEntry_sx, newEntry_sr, io_ptw_resp_bits_hw, io_ptw_resp_bits_hx, io_ptw_resp_bits_hr, prot_w, prot_x, prot_r, _pma_io_resp_pp, _pma_io_resp_al, _pma_io_resp_aa, _pma_io_resp_eff, _pma_io_resp_cacheable, 1'h0};
		superpage_entries_2_valid_0 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_159 ? ~((~superpage_entries_2_tag_v & superpage_entries_2_data_0[0]) | _GEN_160) & _GEN_25 : ~_GEN_160 & _GEN_25) : (io_sfence_bits_rs2 ? ~(~superpage_entries_2_tag_v & ~superpage_entries_2_data_0[20]) & _GEN_25 : superpage_entries_2_tag_v & _GEN_25)) : _GEN_25);
		if (_GEN_27) begin
			superpage_entries_3_level <= {1'h0, io_ptw_resp_bits_level[0]};
			superpage_entries_3_tag_vpn <= r_refill_tag;
		end
		superpage_entries_3_tag_v <= ((~io_ptw_resp_valid | ~io_ptw_resp_bits_homogeneous) | ~_GEN_26) & superpage_entries_3_tag_v;
		if (_GEN_27)
			superpage_entries_3_data_0 <= {io_ptw_resp_bits_pte_ppn[19:0], io_ptw_resp_bits_pte_u, newEntry_g, io_ptw_resp_bits_ae_ptw, io_ptw_resp_bits_ae_final, 1'h0, io_ptw_resp_bits_pf, io_ptw_resp_bits_gf, newEntry_sw, newEntry_sx, newEntry_sr, io_ptw_resp_bits_hw, io_ptw_resp_bits_hx, io_ptw_resp_bits_hr, prot_w, prot_x, prot_r, _pma_io_resp_pp, _pma_io_resp_al, _pma_io_resp_aa, _pma_io_resp_eff, _pma_io_resp_cacheable, 1'h0};
		superpage_entries_3_valid_0 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_161 ? ~((~superpage_entries_3_tag_v & superpage_entries_3_data_0[0]) | _GEN_162) & _GEN_28 : ~_GEN_162 & _GEN_28) : (io_sfence_bits_rs2 ? ~(~superpage_entries_3_tag_v & ~superpage_entries_3_data_0[20]) & _GEN_28 : superpage_entries_3_tag_v & _GEN_28)) : _GEN_28);
		if (_GEN_15) begin
			special_entry_level <= io_ptw_resp_bits_level;
			special_entry_tag_vpn <= r_refill_tag;
			special_entry_data_0 <= {io_ptw_resp_bits_pte_ppn[19:0], io_ptw_resp_bits_pte_u, newEntry_g, io_ptw_resp_bits_ae_ptw, io_ptw_resp_bits_ae_final, 1'h0, io_ptw_resp_bits_pf, io_ptw_resp_bits_gf, newEntry_sw, newEntry_sx, newEntry_sr, io_ptw_resp_bits_hw, io_ptw_resp_bits_hx, io_ptw_resp_bits_hr, prot_w, prot_x, prot_r, _pma_io_resp_pp, _pma_io_resp_al, _pma_io_resp_aa, _pma_io_resp_eff, _pma_io_resp_cacheable, 1'h0};
		end
		special_entry_valid_0 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_163 ? ~(special_entry_data_0[0] | _GEN_164) & _GEN_16 : ~_GEN_164 & _GEN_16) : (io_sfence_bits_rs2 & special_entry_data_0[20]) & _GEN_16) : _GEN_16);
		if (_GEN_103) begin : sv2v_autoblock_2
			reg [2:0] _r_superpage_repl_addr_T_5;
			reg _r_sectored_repl_addr_valids_T_2;
			reg _r_sectored_repl_addr_valids_T_5;
			reg _r_sectored_repl_addr_valids_T_8;
			reg _r_sectored_repl_addr_valids_T_11;
			reg _r_sectored_repl_addr_valids_T_14;
			reg _r_sectored_repl_addr_valids_T_17;
			reg _r_sectored_repl_addr_valids_T_20;
			reg [6:0] _r_sectored_repl_addr_T_11;
			reg [2:0] _r_sectored_hit_bits_T_2;
			_r_superpage_repl_addr_T_5 = ~{superpage_entries_2_valid_0, superpage_entries_1_valid_0, superpage_entries_0_valid_0};
			_r_sectored_repl_addr_valids_T_2 = (_r_sectored_repl_addr_valids_T | sectored_entries_0_0_valid_2) | sectored_entries_0_0_valid_3;
			_r_sectored_repl_addr_valids_T_5 = (_r_sectored_repl_addr_valids_T_3 | sectored_entries_0_1_valid_2) | sectored_entries_0_1_valid_3;
			_r_sectored_repl_addr_valids_T_8 = (_r_sectored_repl_addr_valids_T_6 | sectored_entries_0_2_valid_2) | sectored_entries_0_2_valid_3;
			_r_sectored_repl_addr_valids_T_11 = (_r_sectored_repl_addr_valids_T_9 | sectored_entries_0_3_valid_2) | sectored_entries_0_3_valid_3;
			_r_sectored_repl_addr_valids_T_14 = (_r_sectored_repl_addr_valids_T_12 | sectored_entries_0_4_valid_2) | sectored_entries_0_4_valid_3;
			_r_sectored_repl_addr_valids_T_17 = (_r_sectored_repl_addr_valids_T_15 | sectored_entries_0_5_valid_2) | sectored_entries_0_5_valid_3;
			_r_sectored_repl_addr_valids_T_20 = (_r_sectored_repl_addr_valids_T_18 | sectored_entries_0_6_valid_2) | sectored_entries_0_6_valid_3;
			_r_sectored_repl_addr_T_11 = ~{_r_sectored_repl_addr_valids_T_20, _r_sectored_repl_addr_valids_T_17, _r_sectored_repl_addr_valids_T_14, _r_sectored_repl_addr_valids_T_11, _r_sectored_repl_addr_valids_T_8, _r_sectored_repl_addr_valids_T_5, _r_sectored_repl_addr_valids_T_2};
			_r_sectored_hit_bits_T_2 = _GEN_101 | _GEN_102;
			r_refill_tag <= io_req_bits_vaddr[38:12];
			waddr <= (&{superpage_entries_3_valid_0, superpage_entries_2_valid_0, superpage_entries_1_valid_0, superpage_entries_0_valid_0} ? {state_reg_1[2], (state_reg_1[2] ? state_reg_1[1] : state_reg_1[0])} : (_r_superpage_repl_addr_T_5[0] ? 2'h0 : (_r_superpage_repl_addr_T_5[1] ? 2'h1 : {1'h1, ~_r_superpage_repl_addr_T_5[2]})));
			r_sectored_repl_addr <= (&{(_r_sectored_repl_addr_valids_T_21 | sectored_entries_0_7_valid_2) | sectored_entries_0_7_valid_3, _r_sectored_repl_addr_valids_T_20, _r_sectored_repl_addr_valids_T_17, _r_sectored_repl_addr_valids_T_14, _r_sectored_repl_addr_valids_T_11, _r_sectored_repl_addr_valids_T_8, _r_sectored_repl_addr_valids_T_5, _r_sectored_repl_addr_valids_T_2} ? {state_vec_0[6], (state_vec_0[6] ? {state_vec_0[5], (state_vec_0[5] ? state_vec_0[4] : state_vec_0[3])} : {state_vec_0[2], (state_vec_0[2] ? state_vec_0[1] : state_vec_0[0])})} : (_r_sectored_repl_addr_T_11[0] ? 3'h0 : (_r_sectored_repl_addr_T_11[1] ? 3'h1 : (_r_sectored_repl_addr_T_11[2] ? 3'h2 : (_r_sectored_repl_addr_T_11[3] ? 3'h3 : (_r_sectored_repl_addr_T_11[4] ? 3'h4 : (_r_sectored_repl_addr_T_11[5] ? 3'h5 : {2'h3, ~_r_sectored_repl_addr_T_11[6]})))))));
			r_sectored_hit_valid <= ((((((sector_hits_0 | sector_hits_1) | sector_hits_2) | sector_hits_3) | sector_hits_4) | sector_hits_5) | sector_hits_6) | sector_hits_7;
			r_sectored_hit_bits <= {|{sector_hits_7, sector_hits_6, sector_hits_5, sector_hits_4}, |_r_sectored_hit_bits_T_2[2:1], _r_sectored_hit_bits_T_2[2] | _r_sectored_hit_bits_T_2[0]};
			r_need_gpa <= |real_hits;
		end
		if (reset) begin
			state <= 2'h0;
			state_vec_0 <= 7'h00;
			state_reg_1 <= 3'h0;
		end
		else begin : sv2v_autoblock_3
			reg superpage_hits_1;
			reg superpage_hits_2;
			reg superpage_hits_3;
			reg _GEN_166;
			_GEN_166 = io_req_valid & _vm_enabled_T_1;
			superpage_hits_1 = ((superpage_entries_1_valid_0 & ~superpage_entries_1_tag_v) & (_hitsVec_T_73[17:9] == 9'h000)) & (ignore_4 | (_hitsVec_T_73[8:0] == 9'h000));
			superpage_hits_2 = ((superpage_entries_2_valid_0 & ~superpage_entries_2_tag_v) & (_hitsVec_T_88[17:9] == 9'h000)) & (ignore_7 | (_hitsVec_T_88[8:0] == 9'h000));
			superpage_hits_3 = ((superpage_entries_3_valid_0 & ~superpage_entries_3_tag_v) & (_hitsVec_T_103[17:9] == 9'h000)) & (ignore_10 | (_hitsVec_T_103[8:0] == 9'h000));
			if (io_ptw_resp_valid)
				state <= 2'h0;
			else if ((state == 2'h2) & io_sfence_valid)
				state <= 2'h3;
			else if (io_ptw_req_valid_0) begin
				if (io_ptw_req_ready)
					state <= {1'h1, io_sfence_valid};
				else if (io_sfence_valid)
					state <= 2'h0;
				else if (_GEN_103)
					state <= 2'h1;
			end
			else if (_GEN_103)
				state <= 2'h1;
			if (_GEN_166 & (((((((sector_hits_0 | sector_hits_1) | sector_hits_2) | sector_hits_3) | sector_hits_4) | sector_hits_5) | sector_hits_6) | sector_hits_7)) begin : sv2v_autoblock_4
				reg [3:0] hi_1;
				reg [2:0] _GEN_167;
				reg _state_vec_0_T_6;
				hi_1 = {sector_hits_7, sector_hits_6, sector_hits_5, sector_hits_4};
				_GEN_167 = _GEN_101 | _GEN_102;
				_state_vec_0_T_6 = _GEN_167[2] | _GEN_167[0];
				state_vec_0 <= {~(|hi_1), (|hi_1 ? {~(|_GEN_167[2:1]), (|_GEN_167[2:1] ? ~_state_vec_0_T_6 : state_vec_0[4]), (|_GEN_167[2:1] ? state_vec_0[3] : ~_state_vec_0_T_6)} : state_vec_0[5:3]), (|hi_1 ? state_vec_0[2:0] : {~(|_GEN_167[2:1]), (|_GEN_167[2:1] ? ~_state_vec_0_T_6 : state_vec_0[1]), (|_GEN_167[2:1] ? state_vec_0[0] : ~_state_vec_0_T_6)})};
			end
			if (_GEN_166 & ((((((superpage_entries_0_valid_0 & ~superpage_entries_0_tag_v) & (_hitsVec_T_58[17:9] == 9'h000)) & (ignore_1 | (_hitsVec_T_58[8:0] == 9'h000))) | superpage_hits_1) | superpage_hits_2) | superpage_hits_3)) begin : sv2v_autoblock_5
				reg [1:0] hi_4;
				reg _state_reg_T_5;
				hi_4 = {superpage_hits_3, superpage_hits_2};
				_state_reg_T_5 = superpage_hits_3 | superpage_hits_1;
				state_reg_1 <= {~(|hi_4), (|hi_4 ? ~_state_reg_T_5 : state_reg_1[1]), (|hi_4 ? state_reg_1[0] : ~_state_reg_T_5)};
			end
		end
	end
	OptimizationBarrier_TLBEntryData mpu_ppn_barrier(
		.io_x_ppn(special_entry_data_0[41:22]),
		.io_x_u(special_entry_data_0[21]),
		.io_x_ae_ptw(special_entry_data_0[19]),
		.io_x_ae_final(special_entry_data_0[18]),
		.io_x_pf(special_entry_data_0[16]),
		.io_x_gf(special_entry_data_0[15]),
		.io_x_sx(special_entry_data_0[13]),
		.io_x_px(special_entry_data_0[7]),
		.io_y_ppn(_mpu_ppn_barrier_io_y_ppn),
		.io_y_u(),
		.io_y_ae_ptw(),
		.io_y_ae_final(),
		.io_y_pf(),
		.io_y_gf(),
		.io_y_sx(),
		.io_y_px()
	);
	PMPChecker_s3 pmp(
		.io_prv(mpu_priv[1:0]),
		.io_pmp_0_cfg_l(io_ptw_pmp_0_cfg_l),
		.io_pmp_0_cfg_a(io_ptw_pmp_0_cfg_a),
		.io_pmp_0_cfg_x(io_ptw_pmp_0_cfg_x),
		.io_pmp_0_cfg_w(io_ptw_pmp_0_cfg_w),
		.io_pmp_0_cfg_r(io_ptw_pmp_0_cfg_r),
		.io_pmp_0_addr(io_ptw_pmp_0_addr),
		.io_pmp_0_mask(io_ptw_pmp_0_mask),
		.io_pmp_1_cfg_l(io_ptw_pmp_1_cfg_l),
		.io_pmp_1_cfg_a(io_ptw_pmp_1_cfg_a),
		.io_pmp_1_cfg_x(io_ptw_pmp_1_cfg_x),
		.io_pmp_1_cfg_w(io_ptw_pmp_1_cfg_w),
		.io_pmp_1_cfg_r(io_ptw_pmp_1_cfg_r),
		.io_pmp_1_addr(io_ptw_pmp_1_addr),
		.io_pmp_1_mask(io_ptw_pmp_1_mask),
		.io_pmp_2_cfg_l(io_ptw_pmp_2_cfg_l),
		.io_pmp_2_cfg_a(io_ptw_pmp_2_cfg_a),
		.io_pmp_2_cfg_x(io_ptw_pmp_2_cfg_x),
		.io_pmp_2_cfg_w(io_ptw_pmp_2_cfg_w),
		.io_pmp_2_cfg_r(io_ptw_pmp_2_cfg_r),
		.io_pmp_2_addr(io_ptw_pmp_2_addr),
		.io_pmp_2_mask(io_ptw_pmp_2_mask),
		.io_pmp_3_cfg_l(io_ptw_pmp_3_cfg_l),
		.io_pmp_3_cfg_a(io_ptw_pmp_3_cfg_a),
		.io_pmp_3_cfg_x(io_ptw_pmp_3_cfg_x),
		.io_pmp_3_cfg_w(io_ptw_pmp_3_cfg_w),
		.io_pmp_3_cfg_r(io_ptw_pmp_3_cfg_r),
		.io_pmp_3_addr(io_ptw_pmp_3_addr),
		.io_pmp_3_mask(io_ptw_pmp_3_mask),
		.io_pmp_4_cfg_l(io_ptw_pmp_4_cfg_l),
		.io_pmp_4_cfg_a(io_ptw_pmp_4_cfg_a),
		.io_pmp_4_cfg_x(io_ptw_pmp_4_cfg_x),
		.io_pmp_4_cfg_w(io_ptw_pmp_4_cfg_w),
		.io_pmp_4_cfg_r(io_ptw_pmp_4_cfg_r),
		.io_pmp_4_addr(io_ptw_pmp_4_addr),
		.io_pmp_4_mask(io_ptw_pmp_4_mask),
		.io_pmp_5_cfg_l(io_ptw_pmp_5_cfg_l),
		.io_pmp_5_cfg_a(io_ptw_pmp_5_cfg_a),
		.io_pmp_5_cfg_x(io_ptw_pmp_5_cfg_x),
		.io_pmp_5_cfg_w(io_ptw_pmp_5_cfg_w),
		.io_pmp_5_cfg_r(io_ptw_pmp_5_cfg_r),
		.io_pmp_5_addr(io_ptw_pmp_5_addr),
		.io_pmp_5_mask(io_ptw_pmp_5_mask),
		.io_pmp_6_cfg_l(io_ptw_pmp_6_cfg_l),
		.io_pmp_6_cfg_a(io_ptw_pmp_6_cfg_a),
		.io_pmp_6_cfg_x(io_ptw_pmp_6_cfg_x),
		.io_pmp_6_cfg_w(io_ptw_pmp_6_cfg_w),
		.io_pmp_6_cfg_r(io_ptw_pmp_6_cfg_r),
		.io_pmp_6_addr(io_ptw_pmp_6_addr),
		.io_pmp_6_mask(io_ptw_pmp_6_mask),
		.io_pmp_7_cfg_l(io_ptw_pmp_7_cfg_l),
		.io_pmp_7_cfg_a(io_ptw_pmp_7_cfg_a),
		.io_pmp_7_cfg_x(io_ptw_pmp_7_cfg_x),
		.io_pmp_7_cfg_w(io_ptw_pmp_7_cfg_w),
		.io_pmp_7_cfg_r(io_ptw_pmp_7_cfg_r),
		.io_pmp_7_addr(io_ptw_pmp_7_addr),
		.io_pmp_7_mask(io_ptw_pmp_7_mask),
		.io_addr({mpu_ppn[19:0], io_req_bits_vaddr[11:0]}),
		.io_size(2'h3),
		.io_r(_pmp_io_r),
		.io_w(_pmp_io_w),
		.io_x(_pmp_io_x)
	);
	PMAChecker pma(
		.io_paddr({mpu_ppn, io_req_bits_vaddr[11:0]}),
		.io_resp_cacheable(_pma_io_resp_cacheable),
		.io_resp_r(_pma_io_resp_r),
		.io_resp_w(_pma_io_resp_w),
		.io_resp_pp(_pma_io_resp_pp),
		.io_resp_al(_pma_io_resp_al),
		.io_resp_aa(_pma_io_resp_aa),
		.io_resp_x(_pma_io_resp_x),
		.io_resp_eff(_pma_io_resp_eff)
	);
	OptimizationBarrier_TLBEntryData entries_barrier(
		.io_x_ppn(_entries_WIRE_1[41:22]),
		.io_x_u(_entries_WIRE_1[21]),
		.io_x_ae_ptw(_entries_WIRE_1[19]),
		.io_x_ae_final(_entries_WIRE_1[18]),
		.io_x_pf(_entries_WIRE_1[16]),
		.io_x_gf(_entries_WIRE_1[15]),
		.io_x_sx(_entries_WIRE_1[13]),
		.io_x_px(_entries_WIRE_1[7]),
		.io_y_ppn(_entries_barrier_io_y_ppn),
		.io_y_u(_entries_barrier_io_y_u),
		.io_y_ae_ptw(_entries_barrier_io_y_ae_ptw),
		.io_y_ae_final(_entries_barrier_io_y_ae_final),
		.io_y_pf(_entries_barrier_io_y_pf),
		.io_y_gf(_entries_barrier_io_y_gf),
		.io_y_sx(_entries_barrier_io_y_sx),
		.io_y_px(_entries_barrier_io_y_px)
	);
	OptimizationBarrier_TLBEntryData entries_barrier_1(
		.io_x_ppn(_entries_WIRE_3[41:22]),
		.io_x_u(_entries_WIRE_3[21]),
		.io_x_ae_ptw(_entries_WIRE_3[19]),
		.io_x_ae_final(_entries_WIRE_3[18]),
		.io_x_pf(_entries_WIRE_3[16]),
		.io_x_gf(_entries_WIRE_3[15]),
		.io_x_sx(_entries_WIRE_3[13]),
		.io_x_px(_entries_WIRE_3[7]),
		.io_y_ppn(_entries_barrier_1_io_y_ppn),
		.io_y_u(_entries_barrier_1_io_y_u),
		.io_y_ae_ptw(_entries_barrier_1_io_y_ae_ptw),
		.io_y_ae_final(_entries_barrier_1_io_y_ae_final),
		.io_y_pf(_entries_barrier_1_io_y_pf),
		.io_y_gf(_entries_barrier_1_io_y_gf),
		.io_y_sx(_entries_barrier_1_io_y_sx),
		.io_y_px(_entries_barrier_1_io_y_px)
	);
	OptimizationBarrier_TLBEntryData entries_barrier_2(
		.io_x_ppn(_entries_WIRE_5[41:22]),
		.io_x_u(_entries_WIRE_5[21]),
		.io_x_ae_ptw(_entries_WIRE_5[19]),
		.io_x_ae_final(_entries_WIRE_5[18]),
		.io_x_pf(_entries_WIRE_5[16]),
		.io_x_gf(_entries_WIRE_5[15]),
		.io_x_sx(_entries_WIRE_5[13]),
		.io_x_px(_entries_WIRE_5[7]),
		.io_y_ppn(_entries_barrier_2_io_y_ppn),
		.io_y_u(_entries_barrier_2_io_y_u),
		.io_y_ae_ptw(_entries_barrier_2_io_y_ae_ptw),
		.io_y_ae_final(_entries_barrier_2_io_y_ae_final),
		.io_y_pf(_entries_barrier_2_io_y_pf),
		.io_y_gf(_entries_barrier_2_io_y_gf),
		.io_y_sx(_entries_barrier_2_io_y_sx),
		.io_y_px(_entries_barrier_2_io_y_px)
	);
	OptimizationBarrier_TLBEntryData entries_barrier_3(
		.io_x_ppn(_entries_WIRE_7[41:22]),
		.io_x_u(_entries_WIRE_7[21]),
		.io_x_ae_ptw(_entries_WIRE_7[19]),
		.io_x_ae_final(_entries_WIRE_7[18]),
		.io_x_pf(_entries_WIRE_7[16]),
		.io_x_gf(_entries_WIRE_7[15]),
		.io_x_sx(_entries_WIRE_7[13]),
		.io_x_px(_entries_WIRE_7[7]),
		.io_y_ppn(_entries_barrier_3_io_y_ppn),
		.io_y_u(_entries_barrier_3_io_y_u),
		.io_y_ae_ptw(_entries_barrier_3_io_y_ae_ptw),
		.io_y_ae_final(_entries_barrier_3_io_y_ae_final),
		.io_y_pf(_entries_barrier_3_io_y_pf),
		.io_y_gf(_entries_barrier_3_io_y_gf),
		.io_y_sx(_entries_barrier_3_io_y_sx),
		.io_y_px(_entries_barrier_3_io_y_px)
	);
	OptimizationBarrier_TLBEntryData entries_barrier_4(
		.io_x_ppn(_entries_WIRE_9[41:22]),
		.io_x_u(_entries_WIRE_9[21]),
		.io_x_ae_ptw(_entries_WIRE_9[19]),
		.io_x_ae_final(_entries_WIRE_9[18]),
		.io_x_pf(_entries_WIRE_9[16]),
		.io_x_gf(_entries_WIRE_9[15]),
		.io_x_sx(_entries_WIRE_9[13]),
		.io_x_px(_entries_WIRE_9[7]),
		.io_y_ppn(_entries_barrier_4_io_y_ppn),
		.io_y_u(_entries_barrier_4_io_y_u),
		.io_y_ae_ptw(_entries_barrier_4_io_y_ae_ptw),
		.io_y_ae_final(_entries_barrier_4_io_y_ae_final),
		.io_y_pf(_entries_barrier_4_io_y_pf),
		.io_y_gf(_entries_barrier_4_io_y_gf),
		.io_y_sx(_entries_barrier_4_io_y_sx),
		.io_y_px(_entries_barrier_4_io_y_px)
	);
	OptimizationBarrier_TLBEntryData entries_barrier_5(
		.io_x_ppn(_entries_WIRE_11[41:22]),
		.io_x_u(_entries_WIRE_11[21]),
		.io_x_ae_ptw(_entries_WIRE_11[19]),
		.io_x_ae_final(_entries_WIRE_11[18]),
		.io_x_pf(_entries_WIRE_11[16]),
		.io_x_gf(_entries_WIRE_11[15]),
		.io_x_sx(_entries_WIRE_11[13]),
		.io_x_px(_entries_WIRE_11[7]),
		.io_y_ppn(_entries_barrier_5_io_y_ppn),
		.io_y_u(_entries_barrier_5_io_y_u),
		.io_y_ae_ptw(_entries_barrier_5_io_y_ae_ptw),
		.io_y_ae_final(_entries_barrier_5_io_y_ae_final),
		.io_y_pf(_entries_barrier_5_io_y_pf),
		.io_y_gf(_entries_barrier_5_io_y_gf),
		.io_y_sx(_entries_barrier_5_io_y_sx),
		.io_y_px(_entries_barrier_5_io_y_px)
	);
	OptimizationBarrier_TLBEntryData entries_barrier_6(
		.io_x_ppn(_entries_WIRE_13[41:22]),
		.io_x_u(_entries_WIRE_13[21]),
		.io_x_ae_ptw(_entries_WIRE_13[19]),
		.io_x_ae_final(_entries_WIRE_13[18]),
		.io_x_pf(_entries_WIRE_13[16]),
		.io_x_gf(_entries_WIRE_13[15]),
		.io_x_sx(_entries_WIRE_13[13]),
		.io_x_px(_entries_WIRE_13[7]),
		.io_y_ppn(_entries_barrier_6_io_y_ppn),
		.io_y_u(_entries_barrier_6_io_y_u),
		.io_y_ae_ptw(_entries_barrier_6_io_y_ae_ptw),
		.io_y_ae_final(_entries_barrier_6_io_y_ae_final),
		.io_y_pf(_entries_barrier_6_io_y_pf),
		.io_y_gf(_entries_barrier_6_io_y_gf),
		.io_y_sx(_entries_barrier_6_io_y_sx),
		.io_y_px(_entries_barrier_6_io_y_px)
	);
	OptimizationBarrier_TLBEntryData entries_barrier_7(
		.io_x_ppn(_entries_WIRE_15[41:22]),
		.io_x_u(_entries_WIRE_15[21]),
		.io_x_ae_ptw(_entries_WIRE_15[19]),
		.io_x_ae_final(_entries_WIRE_15[18]),
		.io_x_pf(_entries_WIRE_15[16]),
		.io_x_gf(_entries_WIRE_15[15]),
		.io_x_sx(_entries_WIRE_15[13]),
		.io_x_px(_entries_WIRE_15[7]),
		.io_y_ppn(_entries_barrier_7_io_y_ppn),
		.io_y_u(_entries_barrier_7_io_y_u),
		.io_y_ae_ptw(_entries_barrier_7_io_y_ae_ptw),
		.io_y_ae_final(_entries_barrier_7_io_y_ae_final),
		.io_y_pf(_entries_barrier_7_io_y_pf),
		.io_y_gf(_entries_barrier_7_io_y_gf),
		.io_y_sx(_entries_barrier_7_io_y_sx),
		.io_y_px(_entries_barrier_7_io_y_px)
	);
	OptimizationBarrier_TLBEntryData entries_barrier_8(
		.io_x_ppn(superpage_entries_0_data_0[41:22]),
		.io_x_u(superpage_entries_0_data_0[21]),
		.io_x_ae_ptw(superpage_entries_0_data_0[19]),
		.io_x_ae_final(superpage_entries_0_data_0[18]),
		.io_x_pf(superpage_entries_0_data_0[16]),
		.io_x_gf(superpage_entries_0_data_0[15]),
		.io_x_sx(superpage_entries_0_data_0[13]),
		.io_x_px(superpage_entries_0_data_0[7]),
		.io_y_ppn(_entries_barrier_8_io_y_ppn),
		.io_y_u(_entries_barrier_8_io_y_u),
		.io_y_ae_ptw(_entries_barrier_8_io_y_ae_ptw),
		.io_y_ae_final(_entries_barrier_8_io_y_ae_final),
		.io_y_pf(_entries_barrier_8_io_y_pf),
		.io_y_gf(_entries_barrier_8_io_y_gf),
		.io_y_sx(_entries_barrier_8_io_y_sx),
		.io_y_px(_entries_barrier_8_io_y_px)
	);
	OptimizationBarrier_TLBEntryData entries_barrier_9(
		.io_x_ppn(superpage_entries_1_data_0[41:22]),
		.io_x_u(superpage_entries_1_data_0[21]),
		.io_x_ae_ptw(superpage_entries_1_data_0[19]),
		.io_x_ae_final(superpage_entries_1_data_0[18]),
		.io_x_pf(superpage_entries_1_data_0[16]),
		.io_x_gf(superpage_entries_1_data_0[15]),
		.io_x_sx(superpage_entries_1_data_0[13]),
		.io_x_px(superpage_entries_1_data_0[7]),
		.io_y_ppn(_entries_barrier_9_io_y_ppn),
		.io_y_u(_entries_barrier_9_io_y_u),
		.io_y_ae_ptw(_entries_barrier_9_io_y_ae_ptw),
		.io_y_ae_final(_entries_barrier_9_io_y_ae_final),
		.io_y_pf(_entries_barrier_9_io_y_pf),
		.io_y_gf(_entries_barrier_9_io_y_gf),
		.io_y_sx(_entries_barrier_9_io_y_sx),
		.io_y_px(_entries_barrier_9_io_y_px)
	);
	OptimizationBarrier_TLBEntryData entries_barrier_10(
		.io_x_ppn(superpage_entries_2_data_0[41:22]),
		.io_x_u(superpage_entries_2_data_0[21]),
		.io_x_ae_ptw(superpage_entries_2_data_0[19]),
		.io_x_ae_final(superpage_entries_2_data_0[18]),
		.io_x_pf(superpage_entries_2_data_0[16]),
		.io_x_gf(superpage_entries_2_data_0[15]),
		.io_x_sx(superpage_entries_2_data_0[13]),
		.io_x_px(superpage_entries_2_data_0[7]),
		.io_y_ppn(_entries_barrier_10_io_y_ppn),
		.io_y_u(_entries_barrier_10_io_y_u),
		.io_y_ae_ptw(_entries_barrier_10_io_y_ae_ptw),
		.io_y_ae_final(_entries_barrier_10_io_y_ae_final),
		.io_y_pf(_entries_barrier_10_io_y_pf),
		.io_y_gf(_entries_barrier_10_io_y_gf),
		.io_y_sx(_entries_barrier_10_io_y_sx),
		.io_y_px(_entries_barrier_10_io_y_px)
	);
	OptimizationBarrier_TLBEntryData entries_barrier_11(
		.io_x_ppn(superpage_entries_3_data_0[41:22]),
		.io_x_u(superpage_entries_3_data_0[21]),
		.io_x_ae_ptw(superpage_entries_3_data_0[19]),
		.io_x_ae_final(superpage_entries_3_data_0[18]),
		.io_x_pf(superpage_entries_3_data_0[16]),
		.io_x_gf(superpage_entries_3_data_0[15]),
		.io_x_sx(superpage_entries_3_data_0[13]),
		.io_x_px(superpage_entries_3_data_0[7]),
		.io_y_ppn(_entries_barrier_11_io_y_ppn),
		.io_y_u(_entries_barrier_11_io_y_u),
		.io_y_ae_ptw(_entries_barrier_11_io_y_ae_ptw),
		.io_y_ae_final(_entries_barrier_11_io_y_ae_final),
		.io_y_pf(_entries_barrier_11_io_y_pf),
		.io_y_gf(_entries_barrier_11_io_y_gf),
		.io_y_sx(_entries_barrier_11_io_y_sx),
		.io_y_px(_entries_barrier_11_io_y_px)
	);
	OptimizationBarrier_TLBEntryData entries_barrier_12(
		.io_x_ppn(special_entry_data_0[41:22]),
		.io_x_u(special_entry_data_0[21]),
		.io_x_ae_ptw(special_entry_data_0[19]),
		.io_x_ae_final(special_entry_data_0[18]),
		.io_x_pf(special_entry_data_0[16]),
		.io_x_gf(special_entry_data_0[15]),
		.io_x_sx(special_entry_data_0[13]),
		.io_x_px(special_entry_data_0[7]),
		.io_y_ppn(_entries_barrier_12_io_y_ppn),
		.io_y_u(_entries_barrier_12_io_y_u),
		.io_y_ae_ptw(_entries_barrier_12_io_y_ae_ptw),
		.io_y_ae_final(_entries_barrier_12_io_y_ae_final),
		.io_y_pf(_entries_barrier_12_io_y_pf),
		.io_y_gf(_entries_barrier_12_io_y_gf),
		.io_y_sx(_entries_barrier_12_io_y_sx),
		.io_y_px()
	);
	assign io_resp_miss = (io_ptw_resp_valid | tlb_miss) | multipleHits;
	assign io_resp_paddr = {(((((((((((((hitsVec_0 ? _entries_barrier_io_y_ppn : 20'h00000) | (hitsVec_1 ? _entries_barrier_1_io_y_ppn : 20'h00000)) | (hitsVec_2 ? _entries_barrier_2_io_y_ppn : 20'h00000)) | (hitsVec_3 ? _entries_barrier_3_io_y_ppn : 20'h00000)) | (hitsVec_4 ? _entries_barrier_4_io_y_ppn : 20'h00000)) | (hitsVec_5 ? _entries_barrier_5_io_y_ppn : 20'h00000)) | (hitsVec_6 ? _entries_barrier_6_io_y_ppn : 20'h00000)) | (hitsVec_7 ? _entries_barrier_7_io_y_ppn : 20'h00000)) | (hitsVec_8 ? {_entries_barrier_8_io_y_ppn[19:18], (ignore_1 ? io_req_bits_vaddr[29:21] : 9'h000) | _entries_barrier_8_io_y_ppn[17:9], io_req_bits_vaddr[20:12] | _entries_barrier_8_io_y_ppn[8:0]} : 20'h00000)) | (hitsVec_9 ? {_entries_barrier_9_io_y_ppn[19:18], (ignore_4 ? io_req_bits_vaddr[29:21] : 9'h000) | _entries_barrier_9_io_y_ppn[17:9], io_req_bits_vaddr[20:12] | _entries_barrier_9_io_y_ppn[8:0]} : 20'h00000)) | (hitsVec_10 ? {_entries_barrier_10_io_y_ppn[19:18], (ignore_7 ? io_req_bits_vaddr[29:21] : 9'h000) | _entries_barrier_10_io_y_ppn[17:9], io_req_bits_vaddr[20:12] | _entries_barrier_10_io_y_ppn[8:0]} : 20'h00000)) | (hitsVec_11 ? {_entries_barrier_11_io_y_ppn[19:18], (ignore_10 ? io_req_bits_vaddr[29:21] : 9'h000) | _entries_barrier_11_io_y_ppn[17:9], io_req_bits_vaddr[20:12] | _entries_barrier_11_io_y_ppn[8:0]} : 20'h00000)) | (hitsVec_12 ? {_entries_barrier_12_io_y_ppn[19:18], (ignore_13 ? io_req_bits_vaddr[29:21] : 9'h000) | _entries_barrier_12_io_y_ppn[17:9], (special_entry_level[1] ? 9'h000 : io_req_bits_vaddr[20:12]) | _entries_barrier_12_io_y_ppn[8:0]} : 20'h00000)) | (_vm_enabled_T_1 ? 20'h00000 : io_req_bits_vaddr[31:12]), io_req_bits_vaddr[11:0]};
	assign io_resp_pf_inst = bad_va | (|((((~((io_req_bits_prv[0] ? ~{_entries_barrier_12_io_y_u, _entries_barrier_11_io_y_u, _entries_barrier_10_io_y_u, _entries_barrier_9_io_y_u, _entries_barrier_8_io_y_u, _entries_barrier_7_io_y_u, _entries_barrier_6_io_y_u, _entries_barrier_5_io_y_u, _entries_barrier_4_io_y_u, _entries_barrier_3_io_y_u, _entries_barrier_2_io_y_u, _entries_barrier_1_io_y_u, _entries_barrier_io_y_u} : {_entries_barrier_12_io_y_u, _entries_barrier_11_io_y_u, _entries_barrier_10_io_y_u, _entries_barrier_9_io_y_u, _entries_barrier_8_io_y_u, _entries_barrier_7_io_y_u, _entries_barrier_6_io_y_u, _entries_barrier_5_io_y_u, _entries_barrier_4_io_y_u, _entries_barrier_3_io_y_u, _entries_barrier_2_io_y_u, _entries_barrier_1_io_y_u, _entries_barrier_io_y_u}) & {_entries_barrier_12_io_y_sx, _entries_barrier_11_io_y_sx, _entries_barrier_10_io_y_sx, _entries_barrier_9_io_y_sx, _entries_barrier_8_io_y_sx, _entries_barrier_7_io_y_sx, _entries_barrier_6_io_y_sx, _entries_barrier_5_io_y_sx, _entries_barrier_4_io_y_sx, _entries_barrier_3_io_y_sx, _entries_barrier_2_io_y_sx, _entries_barrier_1_io_y_sx, _entries_barrier_io_y_sx}) & {~_entries_barrier_12_io_y_ae_ptw, ~_entries_barrier_11_io_y_ae_ptw, ~_entries_barrier_10_io_y_ae_ptw, ~_entries_barrier_9_io_y_ae_ptw, ~_entries_barrier_8_io_y_ae_ptw, ~_entries_barrier_7_io_y_ae_ptw, ~_entries_barrier_6_io_y_ae_ptw, ~_entries_barrier_5_io_y_ae_ptw, ~_entries_barrier_4_io_y_ae_ptw, ~_entries_barrier_3_io_y_ae_ptw, ~_entries_barrier_2_io_y_ae_ptw, ~_entries_barrier_1_io_y_ae_ptw, ~_entries_barrier_io_y_ae_ptw}) | {_entries_barrier_12_io_y_pf, _entries_barrier_11_io_y_pf, _entries_barrier_10_io_y_pf, _entries_barrier_9_io_y_pf, _entries_barrier_8_io_y_pf, _entries_barrier_7_io_y_pf, _entries_barrier_6_io_y_pf, _entries_barrier_5_io_y_pf, _entries_barrier_4_io_y_pf, _entries_barrier_3_io_y_pf, _entries_barrier_2_io_y_pf, _entries_barrier_1_io_y_pf, _entries_barrier_io_y_pf}) & {~_entries_barrier_12_io_y_gf, ~_entries_barrier_11_io_y_gf, ~_entries_barrier_10_io_y_gf, ~_entries_barrier_9_io_y_gf, ~_entries_barrier_8_io_y_gf, ~_entries_barrier_7_io_y_gf, ~_entries_barrier_6_io_y_gf, ~_entries_barrier_5_io_y_gf, ~_entries_barrier_4_io_y_gf, ~_entries_barrier_3_io_y_gf, ~_entries_barrier_2_io_y_gf, ~_entries_barrier_1_io_y_gf, ~_entries_barrier_io_y_gf}) & {hitsVec_12, hitsVec_11, hitsVec_10, hitsVec_9, hitsVec_8, hitsVec_7, hitsVec_6, hitsVec_5, hitsVec_4, hitsVec_3, hitsVec_2, hitsVec_1, hitsVec_0}));
	assign io_resp_ae_inst = |(~({{2 {prot_x}}, _entries_barrier_11_io_y_px, _entries_barrier_10_io_y_px, _entries_barrier_9_io_y_px, _entries_barrier_8_io_y_px, _entries_barrier_7_io_y_px, _entries_barrier_6_io_y_px, _entries_barrier_5_io_y_px, _entries_barrier_4_io_y_px, _entries_barrier_3_io_y_px, _entries_barrier_2_io_y_px, _entries_barrier_1_io_y_px, _entries_barrier_io_y_px} & {1'h1, ~(_entries_barrier_12_io_y_ae_ptw | _entries_barrier_12_io_y_ae_final), ~(_entries_barrier_11_io_y_ae_ptw | _entries_barrier_11_io_y_ae_final), ~(_entries_barrier_10_io_y_ae_ptw | _entries_barrier_10_io_y_ae_final), ~(_entries_barrier_9_io_y_ae_ptw | _entries_barrier_9_io_y_ae_final), ~(_entries_barrier_8_io_y_ae_ptw | _entries_barrier_8_io_y_ae_final), ~(_entries_barrier_7_io_y_ae_ptw | _entries_barrier_7_io_y_ae_final), ~(_entries_barrier_6_io_y_ae_ptw | _entries_barrier_6_io_y_ae_final), ~(_entries_barrier_5_io_y_ae_ptw | _entries_barrier_5_io_y_ae_final), ~(_entries_barrier_4_io_y_ae_ptw | _entries_barrier_4_io_y_ae_final), ~(_entries_barrier_3_io_y_ae_ptw | _entries_barrier_3_io_y_ae_final), ~(_entries_barrier_2_io_y_ae_ptw | _entries_barrier_2_io_y_ae_final), ~(_entries_barrier_1_io_y_ae_ptw | _entries_barrier_1_io_y_ae_final), ~(_entries_barrier_io_y_ae_ptw | _entries_barrier_io_y_ae_final)}) & {~_vm_enabled_T_1, hitsVec_12, hitsVec_11, hitsVec_10, hitsVec_9, hitsVec_8, hitsVec_7, hitsVec_6, hitsVec_5, hitsVec_4, hitsVec_3, hitsVec_2, hitsVec_1, hitsVec_0});
	assign io_ptw_req_valid = io_ptw_req_valid_0;
	assign io_ptw_req_bits_bits_addr = r_refill_tag;
	assign io_ptw_req_bits_bits_need_gpa = r_need_gpa;
endmodule
