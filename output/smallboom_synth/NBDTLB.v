module NBDTLB (
	clock,
	reset,
	io_req_0_valid,
	io_req_0_bits_vaddr,
	io_req_0_bits_passthrough,
	io_req_0_bits_size,
	io_req_0_bits_cmd,
	io_resp_0_miss,
	io_resp_0_paddr,
	io_resp_0_pf_ld,
	io_resp_0_pf_st,
	io_resp_0_ae_ld,
	io_resp_0_ae_st,
	io_resp_0_ma_ld,
	io_resp_0_ma_st,
	io_resp_0_cacheable,
	io_sfence_valid,
	io_sfence_bits_rs1,
	io_sfence_bits_rs2,
	io_sfence_bits_addr,
	io_ptw_req_ready,
	io_ptw_req_valid,
	io_ptw_req_bits_valid,
	io_ptw_req_bits_bits_addr,
	io_ptw_resp_valid,
	io_ptw_resp_bits_ae_final,
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
	io_ptw_status_dprv,
	io_ptw_status_mxr,
	io_ptw_status_sum,
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
	io_ptw_pmp_7_mask,
	io_kill
);
	input clock;
	input reset;
	input io_req_0_valid;
	input [39:0] io_req_0_bits_vaddr;
	input io_req_0_bits_passthrough;
	input [1:0] io_req_0_bits_size;
	input [4:0] io_req_0_bits_cmd;
	output wire io_resp_0_miss;
	output wire [31:0] io_resp_0_paddr;
	output wire io_resp_0_pf_ld;
	output wire io_resp_0_pf_st;
	output wire io_resp_0_ae_ld;
	output wire io_resp_0_ae_st;
	output wire io_resp_0_ma_ld;
	output wire io_resp_0_ma_st;
	output wire io_resp_0_cacheable;
	input io_sfence_valid;
	input io_sfence_bits_rs1;
	input io_sfence_bits_rs2;
	input [38:0] io_sfence_bits_addr;
	input io_ptw_req_ready;
	output wire io_ptw_req_valid;
	output wire io_ptw_req_bits_valid;
	output wire [26:0] io_ptw_req_bits_bits_addr;
	input io_ptw_resp_valid;
	input io_ptw_resp_bits_ae_final;
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
	input [1:0] io_ptw_status_dprv;
	input io_ptw_status_mxr;
	input io_ptw_status_sum;
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
	input io_kill;
	wire _normal_entries_barrier_5_io_y_pw;
	wire _normal_entries_barrier_5_io_y_pr;
	wire _normal_entries_barrier_5_io_y_pal;
	wire _normal_entries_barrier_5_io_y_paa;
	wire _normal_entries_barrier_5_io_y_eff;
	wire _normal_entries_barrier_5_io_y_c;
	wire _normal_entries_barrier_4_io_y_pw;
	wire _normal_entries_barrier_4_io_y_pr;
	wire _normal_entries_barrier_4_io_y_pal;
	wire _normal_entries_barrier_4_io_y_paa;
	wire _normal_entries_barrier_4_io_y_eff;
	wire _normal_entries_barrier_4_io_y_c;
	wire _normal_entries_barrier_3_io_y_pw;
	wire _normal_entries_barrier_3_io_y_pr;
	wire _normal_entries_barrier_3_io_y_pal;
	wire _normal_entries_barrier_3_io_y_paa;
	wire _normal_entries_barrier_3_io_y_eff;
	wire _normal_entries_barrier_3_io_y_c;
	wire _normal_entries_barrier_2_io_y_pw;
	wire _normal_entries_barrier_2_io_y_pr;
	wire _normal_entries_barrier_2_io_y_pal;
	wire _normal_entries_barrier_2_io_y_paa;
	wire _normal_entries_barrier_2_io_y_eff;
	wire _normal_entries_barrier_2_io_y_c;
	wire _normal_entries_barrier_1_io_y_pw;
	wire _normal_entries_barrier_1_io_y_pr;
	wire _normal_entries_barrier_1_io_y_pal;
	wire _normal_entries_barrier_1_io_y_paa;
	wire _normal_entries_barrier_1_io_y_eff;
	wire _normal_entries_barrier_1_io_y_c;
	wire _normal_entries_barrier_io_y_pw;
	wire _normal_entries_barrier_io_y_pr;
	wire _normal_entries_barrier_io_y_pal;
	wire _normal_entries_barrier_io_y_paa;
	wire _normal_entries_barrier_io_y_eff;
	wire _normal_entries_barrier_io_y_c;
	wire _entries_barrier_6_io_y_u;
	wire _entries_barrier_6_io_y_ae;
	wire _entries_barrier_6_io_y_sw;
	wire _entries_barrier_6_io_y_sx;
	wire _entries_barrier_6_io_y_sr;
	wire _entries_barrier_5_io_y_u;
	wire _entries_barrier_5_io_y_ae;
	wire _entries_barrier_5_io_y_sw;
	wire _entries_barrier_5_io_y_sx;
	wire _entries_barrier_5_io_y_sr;
	wire _entries_barrier_4_io_y_u;
	wire _entries_barrier_4_io_y_ae;
	wire _entries_barrier_4_io_y_sw;
	wire _entries_barrier_4_io_y_sx;
	wire _entries_barrier_4_io_y_sr;
	wire _entries_barrier_3_io_y_u;
	wire _entries_barrier_3_io_y_ae;
	wire _entries_barrier_3_io_y_sw;
	wire _entries_barrier_3_io_y_sx;
	wire _entries_barrier_3_io_y_sr;
	wire _entries_barrier_2_io_y_u;
	wire _entries_barrier_2_io_y_ae;
	wire _entries_barrier_2_io_y_sw;
	wire _entries_barrier_2_io_y_sx;
	wire _entries_barrier_2_io_y_sr;
	wire _entries_barrier_1_io_y_u;
	wire _entries_barrier_1_io_y_ae;
	wire _entries_barrier_1_io_y_sw;
	wire _entries_barrier_1_io_y_sx;
	wire _entries_barrier_1_io_y_sr;
	wire _entries_barrier_io_y_u;
	wire _entries_barrier_io_y_ae;
	wire _entries_barrier_io_y_sw;
	wire _entries_barrier_io_y_sx;
	wire _entries_barrier_io_y_sr;
	wire [19:0] _ppn_data_barrier_6_io_y_ppn;
	wire [19:0] _ppn_data_barrier_5_io_y_ppn;
	wire [19:0] _ppn_data_barrier_4_io_y_ppn;
	wire [19:0] _ppn_data_barrier_3_io_y_ppn;
	wire [19:0] _ppn_data_barrier_2_io_y_ppn;
	wire [19:0] _ppn_data_barrier_1_io_y_ppn;
	wire [19:0] _ppn_data_barrier_io_y_ppn;
	wire _pmp_0_io_r;
	wire _pmp_0_io_w;
	wire _pmp_0_io_x;
	wire [19:0] _mpu_ppn_data_barrier_io_y_ppn;
	reg [26:0] sectored_entries_0_tag;
	reg [33:0] sectored_entries_0_data_0;
	reg [33:0] sectored_entries_0_data_1;
	reg [33:0] sectored_entries_0_data_2;
	reg [33:0] sectored_entries_0_data_3;
	reg sectored_entries_0_valid_0;
	reg sectored_entries_0_valid_1;
	reg sectored_entries_0_valid_2;
	reg sectored_entries_0_valid_3;
	reg [26:0] sectored_entries_1_tag;
	reg [33:0] sectored_entries_1_data_0;
	reg [33:0] sectored_entries_1_data_1;
	reg [33:0] sectored_entries_1_data_2;
	reg [33:0] sectored_entries_1_data_3;
	reg sectored_entries_1_valid_0;
	reg sectored_entries_1_valid_1;
	reg sectored_entries_1_valid_2;
	reg sectored_entries_1_valid_3;
	reg [1:0] superpage_entries_0_level;
	reg [26:0] superpage_entries_0_tag;
	reg [33:0] superpage_entries_0_data_0;
	reg superpage_entries_0_valid_0;
	reg [1:0] superpage_entries_1_level;
	reg [26:0] superpage_entries_1_tag;
	reg [33:0] superpage_entries_1_data_0;
	reg superpage_entries_1_valid_0;
	reg [1:0] superpage_entries_2_level;
	reg [26:0] superpage_entries_2_tag;
	reg [33:0] superpage_entries_2_data_0;
	reg superpage_entries_2_valid_0;
	reg [1:0] superpage_entries_3_level;
	reg [26:0] superpage_entries_3_tag;
	reg [33:0] superpage_entries_3_data_0;
	reg superpage_entries_3_valid_0;
	reg [1:0] special_entry_level;
	reg [26:0] special_entry_tag;
	reg [33:0] special_entry_data_0;
	reg special_entry_valid_0;
	reg [1:0] state;
	reg [26:0] r_refill_tag;
	reg [1:0] r_superpage_repl_addr;
	reg r_sectored_repl_addr;
	reg r_sectored_hit_addr;
	reg r_sectored_hit;
	wire vm_enabled_0 = (io_ptw_ptbr_mode[3] & ~io_ptw_status_dprv[1]) & ~io_req_0_bits_passthrough;
	wire io_ptw_req_valid_0 = state == 2'h1;
	wire ignore_13 = special_entry_level == 2'h0;
	wire [27:0] mpu_ppn_0 = (io_ptw_resp_valid ? {8'h00, io_ptw_resp_bits_pte_ppn[19:0]} : (vm_enabled_0 ? {8'h00, _mpu_ppn_data_barrier_io_y_ppn[19:18], (ignore_13 ? io_req_0_bits_vaddr[29:21] : 9'h000) | _mpu_ppn_data_barrier_io_y_ppn[17:9], (special_entry_level[1] ? 9'h000 : io_req_0_bits_vaddr[20:12]) | _mpu_ppn_data_barrier_io_y_ppn[8:0]} : io_req_0_bits_vaddr[39:12]));
	wire [9:0] _GEN = mpu_ppn_0[13:4] ^ 10'h200;
	wire [3:0] _GEN_0 = mpu_ppn_0[19:16] ^ 4'h8;
	wire legal_address_0 = ((((((mpu_ppn_0 == 28'h0000000) | ({mpu_ppn_0[27:2], ~mpu_ppn_0[1:0]} == 28'h0000000)) | ({mpu_ppn_0[27:5], ~mpu_ppn_0[4]} == 24'h000000)) | ({mpu_ppn_0[27:14], _GEN} == 24'h000000)) | ({mpu_ppn_0[27:16], ~mpu_ppn_0[15:14]} == 14'h0000)) | ({mpu_ppn_0[27:19], ~mpu_ppn_0[18:17]} == 11'h000)) | ({mpu_ppn_0[27:20], _GEN_0} == 12'h000);
	wire newEntry_c = legal_address_0 & ~_GEN_0[3];
	wire newEntry_pr = legal_address_0 & _pmp_0_io_r;
	wire [3:0] _GEN_1 = {mpu_ppn_0[19:18], mpu_ppn_0[15], mpu_ppn_0[4]};
	wire [2:0] _GEN_2 = {mpu_ppn_0[19:18], ~mpu_ppn_0[15]};
	wire [1:0] _GEN_3 = {mpu_ppn_0[19], ~mpu_ppn_0[18]};
	wire newEntry_pw = (legal_address_0 & (((~(|_GEN_1) | ~(|_GEN_2)) | ~(|_GEN_3)) | ~(|_GEN_0[3:2]))) & _pmp_0_io_w;
	wire newEntry_pal = legal_address_0 & (~(|_GEN_1) | ~(|_GEN_2));
	wire newEntry_paa = legal_address_0 & (~(|_GEN_1) | ~(|_GEN_2));
	wire newEntry_eff = legal_address_0 & (((({mpu_ppn_0[19:18], mpu_ppn_0[15], mpu_ppn_0[13], mpu_ppn_0[4], mpu_ppn_0[1]} == 6'h00) | ({mpu_ppn_0[19:18], mpu_ppn_0[15], _GEN[9], mpu_ppn_0[4]} == 5'h00)) | ~(|_GEN_2)) | ~(|_GEN_3));
	wire [24:0] _hitsVec_T = sectored_entries_0_tag[26:2] ^ io_req_0_bits_vaddr[38:14];
	wire [24:0] _hitsVec_T_5 = sectored_entries_1_tag[26:2] ^ io_req_0_bits_vaddr[38:14];
	wire ignore_1 = superpage_entries_0_level == 2'h0;
	wire ignore_4 = superpage_entries_1_level == 2'h0;
	wire ignore_7 = superpage_entries_2_level == 2'h0;
	wire ignore_10 = superpage_entries_3_level == 2'h0;
	wire [3:0] _GEN_4 = {sectored_entries_0_valid_3, sectored_entries_0_valid_2, sectored_entries_0_valid_1, sectored_entries_0_valid_0};
	wire hitsVec_0_0 = (vm_enabled_0 & _GEN_4[io_req_0_bits_vaddr[13:12]]) & (_hitsVec_T == 25'h0000000);
	wire [3:0] _GEN_5 = {sectored_entries_1_valid_3, sectored_entries_1_valid_2, sectored_entries_1_valid_1, sectored_entries_1_valid_0};
	wire hitsVec_0_1 = (vm_enabled_0 & _GEN_5[io_req_0_bits_vaddr[13:12]]) & (_hitsVec_T_5 == 25'h0000000);
	wire hitsVec_0_2 = ((vm_enabled_0 & superpage_entries_0_valid_0) & (superpage_entries_0_tag[26:18] == io_req_0_bits_vaddr[38:30])) & (ignore_1 | (superpage_entries_0_tag[17:9] == io_req_0_bits_vaddr[29:21]));
	wire hitsVec_0_3 = ((vm_enabled_0 & superpage_entries_1_valid_0) & (superpage_entries_1_tag[26:18] == io_req_0_bits_vaddr[38:30])) & (ignore_4 | (superpage_entries_1_tag[17:9] == io_req_0_bits_vaddr[29:21]));
	wire hitsVec_0_4 = ((vm_enabled_0 & superpage_entries_2_valid_0) & (superpage_entries_2_tag[26:18] == io_req_0_bits_vaddr[38:30])) & (ignore_7 | (superpage_entries_2_tag[17:9] == io_req_0_bits_vaddr[29:21]));
	wire hitsVec_0_5 = ((vm_enabled_0 & superpage_entries_3_valid_0) & (superpage_entries_3_tag[26:18] == io_req_0_bits_vaddr[38:30])) & (ignore_10 | (superpage_entries_3_tag[17:9] == io_req_0_bits_vaddr[29:21]));
	wire hitsVec_0_6 = (((vm_enabled_0 & special_entry_valid_0) & (special_entry_tag[26:18] == io_req_0_bits_vaddr[38:30])) & (ignore_13 | (special_entry_tag[17:9] == io_req_0_bits_vaddr[29:21]))) & (~special_entry_level[1] | (special_entry_tag[8:0] == io_req_0_bits_vaddr[20:12]));
	wire [7:0] hits_0 = {~vm_enabled_0, hitsVec_0_6, hitsVec_0_5, hitsVec_0_4, hitsVec_0_3, hitsVec_0_2, hitsVec_0_1, hitsVec_0_0};
	wire [135:0] _GEN_6 = {sectored_entries_0_data_3, sectored_entries_0_data_2, sectored_entries_0_data_1, sectored_entries_0_data_0};
	wire [33:0] _ppn_data_WIRE_1 = _GEN_6[io_req_0_bits_vaddr[13:12] * 34+:34];
	wire [135:0] _GEN_7 = {sectored_entries_1_data_3, sectored_entries_1_data_2, sectored_entries_1_data_1, sectored_entries_1_data_0};
	wire [33:0] _ppn_data_WIRE_3 = _GEN_7[io_req_0_bits_vaddr[13:12] * 34+:34];
	wire [6:0] priv_rw_ok_0 = (~io_ptw_status_dprv[0] | io_ptw_status_sum ? {_entries_barrier_6_io_y_u, _entries_barrier_5_io_y_u, _entries_barrier_4_io_y_u, _entries_barrier_3_io_y_u, _entries_barrier_2_io_y_u, _entries_barrier_1_io_y_u, _entries_barrier_io_y_u} : 7'h00) | (io_ptw_status_dprv[0] ? ~{_entries_barrier_6_io_y_u, _entries_barrier_5_io_y_u, _entries_barrier_4_io_y_u, _entries_barrier_3_io_y_u, _entries_barrier_2_io_y_u, _entries_barrier_1_io_y_u, _entries_barrier_io_y_u} : 7'h00);
	wire [6:0] _r_array_T_4 = priv_rw_ok_0 & ({_entries_barrier_6_io_y_sr, _entries_barrier_5_io_y_sr, _entries_barrier_4_io_y_sr, _entries_barrier_3_io_y_sr, _entries_barrier_2_io_y_sr, _entries_barrier_1_io_y_sr, _entries_barrier_io_y_sr} | (io_ptw_status_mxr ? {_entries_barrier_6_io_y_sx, _entries_barrier_5_io_y_sx, _entries_barrier_4_io_y_sx, _entries_barrier_3_io_y_sx, _entries_barrier_2_io_y_sx, _entries_barrier_1_io_y_sx, _entries_barrier_io_y_sx} : 7'h00));
	wire [6:0] _w_array_T_1 = priv_rw_ok_0 & {_entries_barrier_6_io_y_sw, _entries_barrier_5_io_y_sw, _entries_barrier_4_io_y_sw, _entries_barrier_3_io_y_sw, _entries_barrier_2_io_y_sw, _entries_barrier_1_io_y_sw, _entries_barrier_io_y_sw};
	wire [7:0] _px_array_T_3 = {1'h1, ~_entries_barrier_6_io_y_ae, ~_entries_barrier_5_io_y_ae, ~_entries_barrier_4_io_y_ae, ~_entries_barrier_3_io_y_ae, ~_entries_barrier_2_io_y_ae, ~_entries_barrier_1_io_y_ae, ~_entries_barrier_io_y_ae};
	wire [7:0] eff_array_0 = {{2 {newEntry_eff}}, _normal_entries_barrier_5_io_y_eff, _normal_entries_barrier_4_io_y_eff, _normal_entries_barrier_3_io_y_eff, _normal_entries_barrier_2_io_y_eff, _normal_entries_barrier_1_io_y_eff, _normal_entries_barrier_io_y_eff};
	wire [7:0] lrscAllowed_0 = {{2 {newEntry_c}}, _normal_entries_barrier_5_io_y_c, _normal_entries_barrier_4_io_y_c, _normal_entries_barrier_3_io_y_c, _normal_entries_barrier_2_io_y_c, _normal_entries_barrier_1_io_y_c, _normal_entries_barrier_io_y_c};
	wire [3:0] _GEN_8 = io_req_0_bits_vaddr[3:0] & ((4'h1 << io_req_0_bits_size) - 4'h1);
	wire bad_va_0 = vm_enabled_0 & ~((io_req_0_bits_vaddr[39:38] == 2'h0) | &io_req_0_bits_vaddr[39:38]);
	wire _cmd_read_T_2 = io_req_0_bits_cmd == 5'h06;
	wire _cmd_write_T_3 = io_req_0_bits_cmd == 5'h07;
	wire _cmd_write_T_5 = io_req_0_bits_cmd == 5'h04;
	wire _cmd_write_T_6 = io_req_0_bits_cmd == 5'h09;
	wire _cmd_write_T_7 = io_req_0_bits_cmd == 5'h0a;
	wire _cmd_write_T_8 = io_req_0_bits_cmd == 5'h0b;
	wire _cmd_write_T_12 = io_req_0_bits_cmd == 5'h08;
	wire _cmd_write_T_13 = io_req_0_bits_cmd == 5'h0c;
	wire _cmd_write_T_14 = io_req_0_bits_cmd == 5'h0d;
	wire _cmd_write_T_15 = io_req_0_bits_cmd == 5'h0e;
	wire _cmd_write_T_16 = io_req_0_bits_cmd == 5'h0f;
	wire cmd_read_0 = ((((((((((((io_req_0_bits_cmd == 5'h00) | (io_req_0_bits_cmd == 5'h10)) | _cmd_read_T_2) | _cmd_write_T_3) | _cmd_write_T_5) | _cmd_write_T_6) | _cmd_write_T_7) | _cmd_write_T_8) | _cmd_write_T_12) | _cmd_write_T_13) | _cmd_write_T_14) | _cmd_write_T_15) | _cmd_write_T_16;
	wire cmd_write_0 = (((((((((((io_req_0_bits_cmd == 5'h01) | (io_req_0_bits_cmd == 5'h11)) | _cmd_write_T_3) | _cmd_write_T_5) | _cmd_write_T_6) | _cmd_write_T_7) | _cmd_write_T_8) | _cmd_write_T_12) | _cmd_write_T_13) | _cmd_write_T_14) | _cmd_write_T_15) | _cmd_write_T_16;
	wire [7:0] ae_array_0 = (|_GEN_8 ? eff_array_0 : 8'h00) | (_cmd_read_T_2 | _cmd_write_T_3 ? ~lrscAllowed_0 : 8'h00);
	wire [7:0] ae_valid_array_0 = {1'h1, ~io_ptw_resp_valid, 6'h3f};
	wire tlb_miss_0 = (vm_enabled_0 & ~bad_va_0) & ({hitsVec_0_6, hitsVec_0_5, hitsVec_0_4, hitsVec_0_3, hitsVec_0_2, hitsVec_0_1, hitsVec_0_0} == 7'h00);
	reg state_reg;
	reg [2:0] state_reg_1;
	wire multipleHits_rightOne_1 = hitsVec_0_1 | hitsVec_0_2;
	wire multipleHits_leftOne_4 = hitsVec_0_3 | hitsVec_0_4;
	wire multipleHits_rightOne_4 = hitsVec_0_5 | hitsVec_0_6;
	wire multipleHits_0 = (((((hitsVec_0_1 & hitsVec_0_2) | (hitsVec_0_0 & multipleHits_rightOne_1)) | (hitsVec_0_3 & hitsVec_0_4)) | (hitsVec_0_5 & hitsVec_0_6)) | (multipleHits_leftOne_4 & multipleHits_rightOne_4)) | ((hitsVec_0_0 | multipleHits_rightOne_1) & (multipleHits_leftOne_4 | multipleHits_rightOne_4));
	wire [6:0] _GEN_9 = {hitsVec_0_6, hitsVec_0_5, hitsVec_0_4, hitsVec_0_3, hitsVec_0_2, hitsVec_0_1, hitsVec_0_0};
	always @(posedge clock) begin : sv2v_autoblock_1
		reg newEntry_px;
		reg _r_sectored_repl_addr_valids_T;
		reg sector_hits_0_0;
		reg _r_sectored_repl_addr_valids_T_3;
		reg sector_hits_0_1;
		reg newEntry_sr;
		reg newEntry_sw;
		reg newEntry_sx;
		reg _GEN_10;
		reg _GEN_11;
		reg _GEN_12;
		reg _GEN_13;
		reg _GEN_14;
		reg _GEN_15;
		reg _GEN_16;
		reg _GEN_17;
		reg _GEN_18;
		reg _GEN_19;
		reg waddr;
		reg _GEN_20;
		reg _GEN_21;
		reg _GEN_22;
		reg _GEN_23;
		reg _GEN_24;
		reg _GEN_25;
		reg _GEN_26;
		reg _GEN_27;
		reg _GEN_28;
		reg [33:0] _sectored_entries_0_data_T;
		reg _GEN_29;
		reg _GEN_30;
		reg _GEN_31;
		reg _GEN_32;
		reg _GEN_33;
		reg _GEN_34;
		reg _GEN_35;
		reg _GEN_36;
		reg [33:0] _sectored_entries_1_data_T;
		reg _GEN_37;
		reg _GEN_38;
		reg _GEN_39;
		reg _GEN_40;
		reg _GEN_41;
		reg _GEN_42;
		reg _GEN_43;
		reg _GEN_44;
		reg _GEN_45;
		reg _GEN_46;
		reg _GEN_47;
		reg _GEN_48;
		reg _GEN_49;
		reg _GEN_50;
		reg _GEN_51;
		reg _GEN_52;
		reg _GEN_53;
		_GEN_10 = io_ptw_resp_valid & ~io_ptw_resp_bits_homogeneous;
		_GEN_20 = ~io_ptw_resp_bits_homogeneous | ~io_ptw_resp_bits_level[1];
		_GEN_38 = _hitsVec_T == 25'h0000000;
		_GEN_39 = io_req_0_bits_vaddr[13:12] == 2'h0;
		_GEN_40 = _GEN_38 & _GEN_39;
		_GEN_41 = io_req_0_bits_vaddr[13:12] == 2'h1;
		_GEN_42 = _GEN_38 & _GEN_41;
		_GEN_43 = io_req_0_bits_vaddr[13:12] == 2'h2;
		_GEN_44 = _GEN_38 & _GEN_43;
		_GEN_45 = _GEN_38 & (&io_req_0_bits_vaddr[13:12]);
		_GEN_46 = _hitsVec_T[24:16] == 9'h000;
		_GEN_47 = _hitsVec_T_5 == 25'h0000000;
		_GEN_48 = _GEN_47 & _GEN_39;
		_GEN_49 = _GEN_47 & _GEN_41;
		_GEN_50 = _GEN_47 & _GEN_43;
		_GEN_51 = _GEN_47 & (&io_req_0_bits_vaddr[13:12]);
		_GEN_52 = _hitsVec_T_5[24:16] == 9'h000;
		_GEN_53 = multipleHits_0 | reset;
		newEntry_px = (legal_address_0 & ((({mpu_ppn_0[19:18], mpu_ppn_0[15], mpu_ppn_0[13]} == 4'h0) | ~(|_GEN_3)) | ~(|_GEN_0[3:2]))) & _pmp_0_io_x;
		_r_sectored_repl_addr_valids_T = sectored_entries_0_valid_0 | sectored_entries_0_valid_1;
		sector_hits_0_0 = ((_r_sectored_repl_addr_valids_T | sectored_entries_0_valid_2) | sectored_entries_0_valid_3) & (_hitsVec_T == 25'h0000000);
		_r_sectored_repl_addr_valids_T_3 = sectored_entries_1_valid_0 | sectored_entries_1_valid_1;
		sector_hits_0_1 = ((_r_sectored_repl_addr_valids_T_3 | sectored_entries_1_valid_2) | sectored_entries_1_valid_3) & (_hitsVec_T_5 == 25'h0000000);
		newEntry_sr = ((io_ptw_resp_bits_pte_v & (io_ptw_resp_bits_pte_r | (io_ptw_resp_bits_pte_x & ~io_ptw_resp_bits_pte_w))) & io_ptw_resp_bits_pte_a) & io_ptw_resp_bits_pte_r;
		newEntry_sw = (((io_ptw_resp_bits_pte_v & (io_ptw_resp_bits_pte_r | (io_ptw_resp_bits_pte_x & ~io_ptw_resp_bits_pte_w))) & io_ptw_resp_bits_pte_a) & io_ptw_resp_bits_pte_w) & io_ptw_resp_bits_pte_d;
		newEntry_sx = ((io_ptw_resp_bits_pte_v & (io_ptw_resp_bits_pte_r | (io_ptw_resp_bits_pte_x & ~io_ptw_resp_bits_pte_w))) & io_ptw_resp_bits_pte_a) & io_ptw_resp_bits_pte_x;
		_GEN_11 = _GEN_10 | special_entry_valid_0;
		_GEN_12 = ((io_ptw_resp_valid & io_ptw_resp_bits_homogeneous) & ~io_ptw_resp_bits_level[1]) & (r_superpage_repl_addr == 2'h0);
		_GEN_13 = _GEN_12 | superpage_entries_0_valid_0;
		_GEN_14 = ((io_ptw_resp_valid & io_ptw_resp_bits_homogeneous) & ~io_ptw_resp_bits_level[1]) & (r_superpage_repl_addr == 2'h1);
		_GEN_15 = _GEN_14 | superpage_entries_1_valid_0;
		_GEN_16 = ((io_ptw_resp_valid & io_ptw_resp_bits_homogeneous) & ~io_ptw_resp_bits_level[1]) & (r_superpage_repl_addr == 2'h2);
		_GEN_17 = _GEN_16 | superpage_entries_2_valid_0;
		_GEN_18 = ((io_ptw_resp_valid & io_ptw_resp_bits_homogeneous) & ~io_ptw_resp_bits_level[1]) & (&r_superpage_repl_addr);
		_GEN_19 = _GEN_18 | superpage_entries_3_valid_0;
		waddr = (r_sectored_hit ? r_sectored_hit_addr : r_sectored_repl_addr);
		_GEN_21 = (~io_ptw_resp_valid | _GEN_20) | waddr;
		_GEN_22 = r_refill_tag[1:0] == 2'h0;
		_GEN_23 = (_GEN_21 ? sectored_entries_0_valid_0 : _GEN_22 | (r_sectored_hit & sectored_entries_0_valid_0));
		_GEN_24 = r_refill_tag[1:0] == 2'h1;
		_GEN_25 = (_GEN_21 ? sectored_entries_0_valid_1 : _GEN_24 | (r_sectored_hit & sectored_entries_0_valid_1));
		_GEN_26 = r_refill_tag[1:0] == 2'h2;
		_GEN_27 = (_GEN_21 ? sectored_entries_0_valid_2 : _GEN_26 | (r_sectored_hit & sectored_entries_0_valid_2));
		_GEN_28 = (_GEN_21 ? sectored_entries_0_valid_3 : &r_refill_tag[1:0] | (r_sectored_hit & sectored_entries_0_valid_3));
		_sectored_entries_0_data_T = {io_ptw_resp_bits_pte_ppn[19:0], io_ptw_resp_bits_pte_u, io_ptw_resp_bits_pte_g, io_ptw_resp_bits_ae_final, newEntry_sw, newEntry_sx, newEntry_sr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
		_GEN_29 = (~io_ptw_resp_valid | _GEN_20) | ~waddr;
		_GEN_30 = r_refill_tag[1:0] == 2'h0;
		_GEN_31 = (_GEN_29 ? sectored_entries_1_valid_0 : _GEN_30 | (r_sectored_hit & sectored_entries_1_valid_0));
		_GEN_32 = r_refill_tag[1:0] == 2'h1;
		_GEN_33 = (_GEN_29 ? sectored_entries_1_valid_1 : _GEN_32 | (r_sectored_hit & sectored_entries_1_valid_1));
		_GEN_34 = r_refill_tag[1:0] == 2'h2;
		_GEN_35 = (_GEN_29 ? sectored_entries_1_valid_2 : _GEN_34 | (r_sectored_hit & sectored_entries_1_valid_2));
		_GEN_36 = (_GEN_29 ? sectored_entries_1_valid_3 : &r_refill_tag[1:0] | (r_sectored_hit & sectored_entries_1_valid_3));
		_sectored_entries_1_data_T = {io_ptw_resp_bits_pte_ppn[19:0], io_ptw_resp_bits_pte_u, io_ptw_resp_bits_pte_g, io_ptw_resp_bits_ae_final, newEntry_sw, newEntry_sx, newEntry_sr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
		_GEN_37 = (io_req_0_valid & tlb_miss_0) & (state == 2'h0);
		if (_GEN_21)
			;
		else
			sectored_entries_0_tag <= r_refill_tag;
		if ((~io_ptw_resp_valid | _GEN_20) | ~(~waddr & _GEN_22))
			;
		else
			sectored_entries_0_data_0 <= _sectored_entries_0_data_T;
		if ((~io_ptw_resp_valid | _GEN_20) | ~(~waddr & _GEN_24))
			;
		else
			sectored_entries_0_data_1 <= _sectored_entries_0_data_T;
		if ((~io_ptw_resp_valid | _GEN_20) | ~(~waddr & _GEN_26))
			;
		else
			sectored_entries_0_data_2 <= _sectored_entries_0_data_T;
		if ((~io_ptw_resp_valid | _GEN_20) | ~(~waddr & (&r_refill_tag[1:0])))
			;
		else
			sectored_entries_0_data_3 <= _sectored_entries_0_data_T;
		sectored_entries_0_valid_0 <= ~_GEN_53 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_46 ? ~(sectored_entries_0_data_0[0] | _GEN_40) & _GEN_23 : ~_GEN_40 & _GEN_23) : (io_sfence_bits_rs2 & sectored_entries_0_data_0[12]) & _GEN_23) : _GEN_23);
		sectored_entries_0_valid_1 <= ~_GEN_53 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_46 ? ~(sectored_entries_0_data_1[0] | _GEN_42) & _GEN_25 : ~_GEN_42 & _GEN_25) : (io_sfence_bits_rs2 & sectored_entries_0_data_1[12]) & _GEN_25) : _GEN_25);
		sectored_entries_0_valid_2 <= ~_GEN_53 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_46 ? ~(sectored_entries_0_data_2[0] | _GEN_44) & _GEN_27 : ~_GEN_44 & _GEN_27) : (io_sfence_bits_rs2 & sectored_entries_0_data_2[12]) & _GEN_27) : _GEN_27);
		sectored_entries_0_valid_3 <= ~_GEN_53 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_46 ? ~(sectored_entries_0_data_3[0] | _GEN_45) & _GEN_28 : ~_GEN_45 & _GEN_28) : (io_sfence_bits_rs2 & sectored_entries_0_data_3[12]) & _GEN_28) : _GEN_28);
		if (_GEN_29)
			;
		else
			sectored_entries_1_tag <= r_refill_tag;
		if ((~io_ptw_resp_valid | _GEN_20) | ~(waddr & _GEN_30))
			;
		else
			sectored_entries_1_data_0 <= _sectored_entries_1_data_T;
		if ((~io_ptw_resp_valid | _GEN_20) | ~(waddr & _GEN_32))
			;
		else
			sectored_entries_1_data_1 <= _sectored_entries_1_data_T;
		if ((~io_ptw_resp_valid | _GEN_20) | ~(waddr & _GEN_34))
			;
		else
			sectored_entries_1_data_2 <= _sectored_entries_1_data_T;
		if ((~io_ptw_resp_valid | _GEN_20) | ~(waddr & (&r_refill_tag[1:0])))
			;
		else
			sectored_entries_1_data_3 <= _sectored_entries_1_data_T;
		sectored_entries_1_valid_0 <= ~_GEN_53 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_52 ? ~(sectored_entries_1_data_0[0] | _GEN_48) & _GEN_31 : ~_GEN_48 & _GEN_31) : (io_sfence_bits_rs2 & sectored_entries_1_data_0[12]) & _GEN_31) : _GEN_31);
		sectored_entries_1_valid_1 <= ~_GEN_53 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_52 ? ~(sectored_entries_1_data_1[0] | _GEN_49) & _GEN_33 : ~_GEN_49 & _GEN_33) : (io_sfence_bits_rs2 & sectored_entries_1_data_1[12]) & _GEN_33) : _GEN_33);
		sectored_entries_1_valid_2 <= ~_GEN_53 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_52 ? ~(sectored_entries_1_data_2[0] | _GEN_50) & _GEN_35 : ~_GEN_50 & _GEN_35) : (io_sfence_bits_rs2 & sectored_entries_1_data_2[12]) & _GEN_35) : _GEN_35);
		sectored_entries_1_valid_3 <= ~_GEN_53 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_52 ? ~(sectored_entries_1_data_3[0] | _GEN_51) & _GEN_36 : ~_GEN_51 & _GEN_36) : (io_sfence_bits_rs2 & sectored_entries_1_data_3[12]) & _GEN_36) : _GEN_36);
		if (_GEN_12) begin
			superpage_entries_0_level <= {1'h0, io_ptw_resp_bits_level[0]};
			superpage_entries_0_tag <= r_refill_tag;
			superpage_entries_0_data_0 <= {io_ptw_resp_bits_pte_ppn[19:0], io_ptw_resp_bits_pte_u, io_ptw_resp_bits_pte_g, io_ptw_resp_bits_ae_final, newEntry_sw, newEntry_sx, newEntry_sr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
		end
		superpage_entries_0_valid_0 <= ~_GEN_53 & (io_sfence_valid ? (io_sfence_bits_rs1 ? ~((superpage_entries_0_valid_0 & (superpage_entries_0_tag[26:18] == io_req_0_bits_vaddr[38:30])) & (ignore_1 | (superpage_entries_0_tag[17:9] == io_req_0_bits_vaddr[29:21]))) & _GEN_13 : (io_sfence_bits_rs2 & superpage_entries_0_data_0[12]) & _GEN_13) : _GEN_13);
		if (_GEN_14) begin
			superpage_entries_1_level <= {1'h0, io_ptw_resp_bits_level[0]};
			superpage_entries_1_tag <= r_refill_tag;
			superpage_entries_1_data_0 <= {io_ptw_resp_bits_pte_ppn[19:0], io_ptw_resp_bits_pte_u, io_ptw_resp_bits_pte_g, io_ptw_resp_bits_ae_final, newEntry_sw, newEntry_sx, newEntry_sr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
		end
		superpage_entries_1_valid_0 <= ~_GEN_53 & (io_sfence_valid ? (io_sfence_bits_rs1 ? ~((superpage_entries_1_valid_0 & (superpage_entries_1_tag[26:18] == io_req_0_bits_vaddr[38:30])) & (ignore_4 | (superpage_entries_1_tag[17:9] == io_req_0_bits_vaddr[29:21]))) & _GEN_15 : (io_sfence_bits_rs2 & superpage_entries_1_data_0[12]) & _GEN_15) : _GEN_15);
		if (_GEN_16) begin
			superpage_entries_2_level <= {1'h0, io_ptw_resp_bits_level[0]};
			superpage_entries_2_tag <= r_refill_tag;
			superpage_entries_2_data_0 <= {io_ptw_resp_bits_pte_ppn[19:0], io_ptw_resp_bits_pte_u, io_ptw_resp_bits_pte_g, io_ptw_resp_bits_ae_final, newEntry_sw, newEntry_sx, newEntry_sr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
		end
		superpage_entries_2_valid_0 <= ~_GEN_53 & (io_sfence_valid ? (io_sfence_bits_rs1 ? ~((superpage_entries_2_valid_0 & (superpage_entries_2_tag[26:18] == io_req_0_bits_vaddr[38:30])) & (ignore_7 | (superpage_entries_2_tag[17:9] == io_req_0_bits_vaddr[29:21]))) & _GEN_17 : (io_sfence_bits_rs2 & superpage_entries_2_data_0[12]) & _GEN_17) : _GEN_17);
		if (_GEN_18) begin
			superpage_entries_3_level <= {1'h0, io_ptw_resp_bits_level[0]};
			superpage_entries_3_tag <= r_refill_tag;
			superpage_entries_3_data_0 <= {io_ptw_resp_bits_pte_ppn[19:0], io_ptw_resp_bits_pte_u, io_ptw_resp_bits_pte_g, io_ptw_resp_bits_ae_final, newEntry_sw, newEntry_sx, newEntry_sr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
		end
		superpage_entries_3_valid_0 <= ~_GEN_53 & (io_sfence_valid ? (io_sfence_bits_rs1 ? ~((superpage_entries_3_valid_0 & (superpage_entries_3_tag[26:18] == io_req_0_bits_vaddr[38:30])) & (ignore_10 | (superpage_entries_3_tag[17:9] == io_req_0_bits_vaddr[29:21]))) & _GEN_19 : (io_sfence_bits_rs2 & superpage_entries_3_data_0[12]) & _GEN_19) : _GEN_19);
		if (_GEN_10) begin
			special_entry_level <= io_ptw_resp_bits_level;
			special_entry_tag <= r_refill_tag;
			special_entry_data_0 <= {io_ptw_resp_bits_pte_ppn[19:0], io_ptw_resp_bits_pte_u, io_ptw_resp_bits_pte_g, io_ptw_resp_bits_ae_final, newEntry_sw, newEntry_sx, newEntry_sr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
		end
		special_entry_valid_0 <= ~_GEN_53 & (io_sfence_valid ? (io_sfence_bits_rs1 ? ~(((special_entry_valid_0 & (special_entry_tag[26:18] == io_req_0_bits_vaddr[38:30])) & (ignore_13 | (special_entry_tag[17:9] == io_req_0_bits_vaddr[29:21]))) & (~special_entry_level[1] | (special_entry_tag[8:0] == io_req_0_bits_vaddr[20:12]))) & _GEN_11 : (io_sfence_bits_rs2 & special_entry_data_0[12]) & _GEN_11) : _GEN_11);
		if (_GEN_37) begin : sv2v_autoblock_2
			reg [2:0] _r_superpage_repl_addr_T_5;
			reg _r_sectored_repl_addr_valids_T_2;
			_r_superpage_repl_addr_T_5 = ~{superpage_entries_2_valid_0, superpage_entries_1_valid_0, superpage_entries_0_valid_0};
			_r_sectored_repl_addr_valids_T_2 = (_r_sectored_repl_addr_valids_T | sectored_entries_0_valid_2) | sectored_entries_0_valid_3;
			r_refill_tag <= io_req_0_bits_vaddr[38:12];
			r_superpage_repl_addr <= (&{superpage_entries_3_valid_0, superpage_entries_2_valid_0, superpage_entries_1_valid_0, superpage_entries_0_valid_0} ? {state_reg_1[2], (state_reg_1[2] ? state_reg_1[1] : state_reg_1[0])} : (_r_superpage_repl_addr_T_5[0] ? 2'h0 : (_r_superpage_repl_addr_T_5[1] ? 2'h1 : {1'h1, ~_r_superpage_repl_addr_T_5[2]})));
			r_sectored_repl_addr <= (&{(_r_sectored_repl_addr_valids_T_3 | sectored_entries_1_valid_2) | sectored_entries_1_valid_3, _r_sectored_repl_addr_valids_T_2} ? state_reg : _r_sectored_repl_addr_valids_T_2);
			r_sectored_hit_addr <= sector_hits_0_1;
			r_sectored_hit <= sector_hits_0_0 | sector_hits_0_1;
		end
		if (reset) begin
			state <= 2'h0;
			state_reg <= 1'h0;
			state_reg_1 <= 3'h0;
		end
		else begin : sv2v_autoblock_3
			reg superpage_hits_0_1;
			reg superpage_hits_0_2;
			reg superpage_hits_0_3;
			reg _GEN_54;
			_GEN_54 = io_req_0_valid & vm_enabled_0;
			superpage_hits_0_1 = (superpage_entries_1_valid_0 & (superpage_entries_1_tag[26:18] == io_req_0_bits_vaddr[38:30])) & (ignore_4 | (superpage_entries_1_tag[17:9] == io_req_0_bits_vaddr[29:21]));
			superpage_hits_0_2 = (superpage_entries_2_valid_0 & (superpage_entries_2_tag[26:18] == io_req_0_bits_vaddr[38:30])) & (ignore_7 | (superpage_entries_2_tag[17:9] == io_req_0_bits_vaddr[29:21]));
			superpage_hits_0_3 = (superpage_entries_3_valid_0 & (superpage_entries_3_tag[26:18] == io_req_0_bits_vaddr[38:30])) & (ignore_10 | (superpage_entries_3_tag[17:9] == io_req_0_bits_vaddr[29:21]));
			if (io_ptw_resp_valid)
				state <= 2'h0;
			else if ((state == 2'h2) & io_sfence_valid)
				state <= 2'h3;
			else if (io_ptw_req_valid_0) begin
				if (io_kill)
					state <= 2'h0;
				else if (io_ptw_req_ready)
					state <= {1'h1, io_sfence_valid};
				else if (io_sfence_valid)
					state <= 2'h0;
				else if (_GEN_37)
					state <= 2'h1;
			end
			else if (_GEN_37)
				state <= 2'h1;
			if (_GEN_54 & (sector_hits_0_0 | sector_hits_0_1))
				state_reg <= ~sector_hits_0_1;
			if (_GEN_54 & (((((superpage_entries_0_valid_0 & (superpage_entries_0_tag[26:18] == io_req_0_bits_vaddr[38:30])) & (ignore_1 | (superpage_entries_0_tag[17:9] == io_req_0_bits_vaddr[29:21]))) | superpage_hits_0_1) | superpage_hits_0_2) | superpage_hits_0_3)) begin : sv2v_autoblock_4
				reg [1:0] hi_1;
				reg _state_reg_T_7;
				hi_1 = {superpage_hits_0_3, superpage_hits_0_2};
				_state_reg_T_7 = superpage_hits_0_3 | superpage_hits_0_1;
				state_reg_1 <= {~(|hi_1), (|hi_1 ? ~_state_reg_T_7 : state_reg_1[1]), (|hi_1 ? state_reg_1[0] : ~_state_reg_T_7)};
			end
		end
	end
	OptimizationBarrier_EntryData mpu_ppn_data_barrier(
		.io_x_ppn(special_entry_data_0[33:14]),
		.io_x_u(special_entry_data_0[13]),
		.io_x_ae(special_entry_data_0[11]),
		.io_x_sw(special_entry_data_0[10]),
		.io_x_sx(special_entry_data_0[9]),
		.io_x_sr(special_entry_data_0[8]),
		.io_x_pw(special_entry_data_0[7]),
		.io_x_pr(special_entry_data_0[5]),
		.io_x_pal(special_entry_data_0[4]),
		.io_x_paa(special_entry_data_0[3]),
		.io_x_eff(special_entry_data_0[2]),
		.io_x_c(special_entry_data_0[1]),
		.io_y_ppn(_mpu_ppn_data_barrier_io_y_ppn),
		.io_y_u(),
		.io_y_ae(),
		.io_y_sw(),
		.io_y_sx(),
		.io_y_sr(),
		.io_y_pw(),
		.io_y_pr(),
		.io_y_pal(),
		.io_y_paa(),
		.io_y_eff(),
		.io_y_c()
	);
	PMPChecker_s3 pmp_0(
		.io_prv((io_ptw_resp_valid | io_req_0_bits_passthrough ? 2'h1 : io_ptw_status_dprv)),
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
		.io_addr({mpu_ppn_0[19:0], io_req_0_bits_vaddr[11:0]}),
		.io_size(io_req_0_bits_size),
		.io_r(_pmp_0_io_r),
		.io_w(_pmp_0_io_w),
		.io_x(_pmp_0_io_x)
	);
	OptimizationBarrier_EntryData ppn_data_barrier(
		.io_x_ppn(_ppn_data_WIRE_1[33:14]),
		.io_x_u(_ppn_data_WIRE_1[13]),
		.io_x_ae(_ppn_data_WIRE_1[11]),
		.io_x_sw(_ppn_data_WIRE_1[10]),
		.io_x_sx(_ppn_data_WIRE_1[9]),
		.io_x_sr(_ppn_data_WIRE_1[8]),
		.io_x_pw(_ppn_data_WIRE_1[7]),
		.io_x_pr(_ppn_data_WIRE_1[5]),
		.io_x_pal(_ppn_data_WIRE_1[4]),
		.io_x_paa(_ppn_data_WIRE_1[3]),
		.io_x_eff(_ppn_data_WIRE_1[2]),
		.io_x_c(_ppn_data_WIRE_1[1]),
		.io_y_ppn(_ppn_data_barrier_io_y_ppn),
		.io_y_u(),
		.io_y_ae(),
		.io_y_sw(),
		.io_y_sx(),
		.io_y_sr(),
		.io_y_pw(),
		.io_y_pr(),
		.io_y_pal(),
		.io_y_paa(),
		.io_y_eff(),
		.io_y_c()
	);
	OptimizationBarrier_EntryData ppn_data_barrier_1(
		.io_x_ppn(_ppn_data_WIRE_3[33:14]),
		.io_x_u(_ppn_data_WIRE_3[13]),
		.io_x_ae(_ppn_data_WIRE_3[11]),
		.io_x_sw(_ppn_data_WIRE_3[10]),
		.io_x_sx(_ppn_data_WIRE_3[9]),
		.io_x_sr(_ppn_data_WIRE_3[8]),
		.io_x_pw(_ppn_data_WIRE_3[7]),
		.io_x_pr(_ppn_data_WIRE_3[5]),
		.io_x_pal(_ppn_data_WIRE_3[4]),
		.io_x_paa(_ppn_data_WIRE_3[3]),
		.io_x_eff(_ppn_data_WIRE_3[2]),
		.io_x_c(_ppn_data_WIRE_3[1]),
		.io_y_ppn(_ppn_data_barrier_1_io_y_ppn),
		.io_y_u(),
		.io_y_ae(),
		.io_y_sw(),
		.io_y_sx(),
		.io_y_sr(),
		.io_y_pw(),
		.io_y_pr(),
		.io_y_pal(),
		.io_y_paa(),
		.io_y_eff(),
		.io_y_c()
	);
	OptimizationBarrier_EntryData ppn_data_barrier_2(
		.io_x_ppn(superpage_entries_0_data_0[33:14]),
		.io_x_u(superpage_entries_0_data_0[13]),
		.io_x_ae(superpage_entries_0_data_0[11]),
		.io_x_sw(superpage_entries_0_data_0[10]),
		.io_x_sx(superpage_entries_0_data_0[9]),
		.io_x_sr(superpage_entries_0_data_0[8]),
		.io_x_pw(superpage_entries_0_data_0[7]),
		.io_x_pr(superpage_entries_0_data_0[5]),
		.io_x_pal(superpage_entries_0_data_0[4]),
		.io_x_paa(superpage_entries_0_data_0[3]),
		.io_x_eff(superpage_entries_0_data_0[2]),
		.io_x_c(superpage_entries_0_data_0[1]),
		.io_y_ppn(_ppn_data_barrier_2_io_y_ppn),
		.io_y_u(),
		.io_y_ae(),
		.io_y_sw(),
		.io_y_sx(),
		.io_y_sr(),
		.io_y_pw(),
		.io_y_pr(),
		.io_y_pal(),
		.io_y_paa(),
		.io_y_eff(),
		.io_y_c()
	);
	OptimizationBarrier_EntryData ppn_data_barrier_3(
		.io_x_ppn(superpage_entries_1_data_0[33:14]),
		.io_x_u(superpage_entries_1_data_0[13]),
		.io_x_ae(superpage_entries_1_data_0[11]),
		.io_x_sw(superpage_entries_1_data_0[10]),
		.io_x_sx(superpage_entries_1_data_0[9]),
		.io_x_sr(superpage_entries_1_data_0[8]),
		.io_x_pw(superpage_entries_1_data_0[7]),
		.io_x_pr(superpage_entries_1_data_0[5]),
		.io_x_pal(superpage_entries_1_data_0[4]),
		.io_x_paa(superpage_entries_1_data_0[3]),
		.io_x_eff(superpage_entries_1_data_0[2]),
		.io_x_c(superpage_entries_1_data_0[1]),
		.io_y_ppn(_ppn_data_barrier_3_io_y_ppn),
		.io_y_u(),
		.io_y_ae(),
		.io_y_sw(),
		.io_y_sx(),
		.io_y_sr(),
		.io_y_pw(),
		.io_y_pr(),
		.io_y_pal(),
		.io_y_paa(),
		.io_y_eff(),
		.io_y_c()
	);
	OptimizationBarrier_EntryData ppn_data_barrier_4(
		.io_x_ppn(superpage_entries_2_data_0[33:14]),
		.io_x_u(superpage_entries_2_data_0[13]),
		.io_x_ae(superpage_entries_2_data_0[11]),
		.io_x_sw(superpage_entries_2_data_0[10]),
		.io_x_sx(superpage_entries_2_data_0[9]),
		.io_x_sr(superpage_entries_2_data_0[8]),
		.io_x_pw(superpage_entries_2_data_0[7]),
		.io_x_pr(superpage_entries_2_data_0[5]),
		.io_x_pal(superpage_entries_2_data_0[4]),
		.io_x_paa(superpage_entries_2_data_0[3]),
		.io_x_eff(superpage_entries_2_data_0[2]),
		.io_x_c(superpage_entries_2_data_0[1]),
		.io_y_ppn(_ppn_data_barrier_4_io_y_ppn),
		.io_y_u(),
		.io_y_ae(),
		.io_y_sw(),
		.io_y_sx(),
		.io_y_sr(),
		.io_y_pw(),
		.io_y_pr(),
		.io_y_pal(),
		.io_y_paa(),
		.io_y_eff(),
		.io_y_c()
	);
	OptimizationBarrier_EntryData ppn_data_barrier_5(
		.io_x_ppn(superpage_entries_3_data_0[33:14]),
		.io_x_u(superpage_entries_3_data_0[13]),
		.io_x_ae(superpage_entries_3_data_0[11]),
		.io_x_sw(superpage_entries_3_data_0[10]),
		.io_x_sx(superpage_entries_3_data_0[9]),
		.io_x_sr(superpage_entries_3_data_0[8]),
		.io_x_pw(superpage_entries_3_data_0[7]),
		.io_x_pr(superpage_entries_3_data_0[5]),
		.io_x_pal(superpage_entries_3_data_0[4]),
		.io_x_paa(superpage_entries_3_data_0[3]),
		.io_x_eff(superpage_entries_3_data_0[2]),
		.io_x_c(superpage_entries_3_data_0[1]),
		.io_y_ppn(_ppn_data_barrier_5_io_y_ppn),
		.io_y_u(),
		.io_y_ae(),
		.io_y_sw(),
		.io_y_sx(),
		.io_y_sr(),
		.io_y_pw(),
		.io_y_pr(),
		.io_y_pal(),
		.io_y_paa(),
		.io_y_eff(),
		.io_y_c()
	);
	OptimizationBarrier_EntryData ppn_data_barrier_6(
		.io_x_ppn(special_entry_data_0[33:14]),
		.io_x_u(special_entry_data_0[13]),
		.io_x_ae(special_entry_data_0[11]),
		.io_x_sw(special_entry_data_0[10]),
		.io_x_sx(special_entry_data_0[9]),
		.io_x_sr(special_entry_data_0[8]),
		.io_x_pw(special_entry_data_0[7]),
		.io_x_pr(special_entry_data_0[5]),
		.io_x_pal(special_entry_data_0[4]),
		.io_x_paa(special_entry_data_0[3]),
		.io_x_eff(special_entry_data_0[2]),
		.io_x_c(special_entry_data_0[1]),
		.io_y_ppn(_ppn_data_barrier_6_io_y_ppn),
		.io_y_u(),
		.io_y_ae(),
		.io_y_sw(),
		.io_y_sx(),
		.io_y_sr(),
		.io_y_pw(),
		.io_y_pr(),
		.io_y_pal(),
		.io_y_paa(),
		.io_y_eff(),
		.io_y_c()
	);
	OptimizationBarrier_EntryData entries_barrier(
		.io_x_ppn(_ppn_data_WIRE_1[33:14]),
		.io_x_u(_ppn_data_WIRE_1[13]),
		.io_x_ae(_ppn_data_WIRE_1[11]),
		.io_x_sw(_ppn_data_WIRE_1[10]),
		.io_x_sx(_ppn_data_WIRE_1[9]),
		.io_x_sr(_ppn_data_WIRE_1[8]),
		.io_x_pw(_ppn_data_WIRE_1[7]),
		.io_x_pr(_ppn_data_WIRE_1[5]),
		.io_x_pal(_ppn_data_WIRE_1[4]),
		.io_x_paa(_ppn_data_WIRE_1[3]),
		.io_x_eff(_ppn_data_WIRE_1[2]),
		.io_x_c(_ppn_data_WIRE_1[1]),
		.io_y_ppn(),
		.io_y_u(_entries_barrier_io_y_u),
		.io_y_ae(_entries_barrier_io_y_ae),
		.io_y_sw(_entries_barrier_io_y_sw),
		.io_y_sx(_entries_barrier_io_y_sx),
		.io_y_sr(_entries_barrier_io_y_sr),
		.io_y_pw(),
		.io_y_pr(),
		.io_y_pal(),
		.io_y_paa(),
		.io_y_eff(),
		.io_y_c()
	);
	OptimizationBarrier_EntryData entries_barrier_1(
		.io_x_ppn(_ppn_data_WIRE_3[33:14]),
		.io_x_u(_ppn_data_WIRE_3[13]),
		.io_x_ae(_ppn_data_WIRE_3[11]),
		.io_x_sw(_ppn_data_WIRE_3[10]),
		.io_x_sx(_ppn_data_WIRE_3[9]),
		.io_x_sr(_ppn_data_WIRE_3[8]),
		.io_x_pw(_ppn_data_WIRE_3[7]),
		.io_x_pr(_ppn_data_WIRE_3[5]),
		.io_x_pal(_ppn_data_WIRE_3[4]),
		.io_x_paa(_ppn_data_WIRE_3[3]),
		.io_x_eff(_ppn_data_WIRE_3[2]),
		.io_x_c(_ppn_data_WIRE_3[1]),
		.io_y_ppn(),
		.io_y_u(_entries_barrier_1_io_y_u),
		.io_y_ae(_entries_barrier_1_io_y_ae),
		.io_y_sw(_entries_barrier_1_io_y_sw),
		.io_y_sx(_entries_barrier_1_io_y_sx),
		.io_y_sr(_entries_barrier_1_io_y_sr),
		.io_y_pw(),
		.io_y_pr(),
		.io_y_pal(),
		.io_y_paa(),
		.io_y_eff(),
		.io_y_c()
	);
	OptimizationBarrier_EntryData entries_barrier_2(
		.io_x_ppn(superpage_entries_0_data_0[33:14]),
		.io_x_u(superpage_entries_0_data_0[13]),
		.io_x_ae(superpage_entries_0_data_0[11]),
		.io_x_sw(superpage_entries_0_data_0[10]),
		.io_x_sx(superpage_entries_0_data_0[9]),
		.io_x_sr(superpage_entries_0_data_0[8]),
		.io_x_pw(superpage_entries_0_data_0[7]),
		.io_x_pr(superpage_entries_0_data_0[5]),
		.io_x_pal(superpage_entries_0_data_0[4]),
		.io_x_paa(superpage_entries_0_data_0[3]),
		.io_x_eff(superpage_entries_0_data_0[2]),
		.io_x_c(superpage_entries_0_data_0[1]),
		.io_y_ppn(),
		.io_y_u(_entries_barrier_2_io_y_u),
		.io_y_ae(_entries_barrier_2_io_y_ae),
		.io_y_sw(_entries_barrier_2_io_y_sw),
		.io_y_sx(_entries_barrier_2_io_y_sx),
		.io_y_sr(_entries_barrier_2_io_y_sr),
		.io_y_pw(),
		.io_y_pr(),
		.io_y_pal(),
		.io_y_paa(),
		.io_y_eff(),
		.io_y_c()
	);
	OptimizationBarrier_EntryData entries_barrier_3(
		.io_x_ppn(superpage_entries_1_data_0[33:14]),
		.io_x_u(superpage_entries_1_data_0[13]),
		.io_x_ae(superpage_entries_1_data_0[11]),
		.io_x_sw(superpage_entries_1_data_0[10]),
		.io_x_sx(superpage_entries_1_data_0[9]),
		.io_x_sr(superpage_entries_1_data_0[8]),
		.io_x_pw(superpage_entries_1_data_0[7]),
		.io_x_pr(superpage_entries_1_data_0[5]),
		.io_x_pal(superpage_entries_1_data_0[4]),
		.io_x_paa(superpage_entries_1_data_0[3]),
		.io_x_eff(superpage_entries_1_data_0[2]),
		.io_x_c(superpage_entries_1_data_0[1]),
		.io_y_ppn(),
		.io_y_u(_entries_barrier_3_io_y_u),
		.io_y_ae(_entries_barrier_3_io_y_ae),
		.io_y_sw(_entries_barrier_3_io_y_sw),
		.io_y_sx(_entries_barrier_3_io_y_sx),
		.io_y_sr(_entries_barrier_3_io_y_sr),
		.io_y_pw(),
		.io_y_pr(),
		.io_y_pal(),
		.io_y_paa(),
		.io_y_eff(),
		.io_y_c()
	);
	OptimizationBarrier_EntryData entries_barrier_4(
		.io_x_ppn(superpage_entries_2_data_0[33:14]),
		.io_x_u(superpage_entries_2_data_0[13]),
		.io_x_ae(superpage_entries_2_data_0[11]),
		.io_x_sw(superpage_entries_2_data_0[10]),
		.io_x_sx(superpage_entries_2_data_0[9]),
		.io_x_sr(superpage_entries_2_data_0[8]),
		.io_x_pw(superpage_entries_2_data_0[7]),
		.io_x_pr(superpage_entries_2_data_0[5]),
		.io_x_pal(superpage_entries_2_data_0[4]),
		.io_x_paa(superpage_entries_2_data_0[3]),
		.io_x_eff(superpage_entries_2_data_0[2]),
		.io_x_c(superpage_entries_2_data_0[1]),
		.io_y_ppn(),
		.io_y_u(_entries_barrier_4_io_y_u),
		.io_y_ae(_entries_barrier_4_io_y_ae),
		.io_y_sw(_entries_barrier_4_io_y_sw),
		.io_y_sx(_entries_barrier_4_io_y_sx),
		.io_y_sr(_entries_barrier_4_io_y_sr),
		.io_y_pw(),
		.io_y_pr(),
		.io_y_pal(),
		.io_y_paa(),
		.io_y_eff(),
		.io_y_c()
	);
	OptimizationBarrier_EntryData entries_barrier_5(
		.io_x_ppn(superpage_entries_3_data_0[33:14]),
		.io_x_u(superpage_entries_3_data_0[13]),
		.io_x_ae(superpage_entries_3_data_0[11]),
		.io_x_sw(superpage_entries_3_data_0[10]),
		.io_x_sx(superpage_entries_3_data_0[9]),
		.io_x_sr(superpage_entries_3_data_0[8]),
		.io_x_pw(superpage_entries_3_data_0[7]),
		.io_x_pr(superpage_entries_3_data_0[5]),
		.io_x_pal(superpage_entries_3_data_0[4]),
		.io_x_paa(superpage_entries_3_data_0[3]),
		.io_x_eff(superpage_entries_3_data_0[2]),
		.io_x_c(superpage_entries_3_data_0[1]),
		.io_y_ppn(),
		.io_y_u(_entries_barrier_5_io_y_u),
		.io_y_ae(_entries_barrier_5_io_y_ae),
		.io_y_sw(_entries_barrier_5_io_y_sw),
		.io_y_sx(_entries_barrier_5_io_y_sx),
		.io_y_sr(_entries_barrier_5_io_y_sr),
		.io_y_pw(),
		.io_y_pr(),
		.io_y_pal(),
		.io_y_paa(),
		.io_y_eff(),
		.io_y_c()
	);
	OptimizationBarrier_EntryData entries_barrier_6(
		.io_x_ppn(special_entry_data_0[33:14]),
		.io_x_u(special_entry_data_0[13]),
		.io_x_ae(special_entry_data_0[11]),
		.io_x_sw(special_entry_data_0[10]),
		.io_x_sx(special_entry_data_0[9]),
		.io_x_sr(special_entry_data_0[8]),
		.io_x_pw(special_entry_data_0[7]),
		.io_x_pr(special_entry_data_0[5]),
		.io_x_pal(special_entry_data_0[4]),
		.io_x_paa(special_entry_data_0[3]),
		.io_x_eff(special_entry_data_0[2]),
		.io_x_c(special_entry_data_0[1]),
		.io_y_ppn(),
		.io_y_u(_entries_barrier_6_io_y_u),
		.io_y_ae(_entries_barrier_6_io_y_ae),
		.io_y_sw(_entries_barrier_6_io_y_sw),
		.io_y_sx(_entries_barrier_6_io_y_sx),
		.io_y_sr(_entries_barrier_6_io_y_sr),
		.io_y_pw(),
		.io_y_pr(),
		.io_y_pal(),
		.io_y_paa(),
		.io_y_eff(),
		.io_y_c()
	);
	OptimizationBarrier_EntryData normal_entries_barrier(
		.io_x_ppn(_ppn_data_WIRE_1[33:14]),
		.io_x_u(_ppn_data_WIRE_1[13]),
		.io_x_ae(_ppn_data_WIRE_1[11]),
		.io_x_sw(_ppn_data_WIRE_1[10]),
		.io_x_sx(_ppn_data_WIRE_1[9]),
		.io_x_sr(_ppn_data_WIRE_1[8]),
		.io_x_pw(_ppn_data_WIRE_1[7]),
		.io_x_pr(_ppn_data_WIRE_1[5]),
		.io_x_pal(_ppn_data_WIRE_1[4]),
		.io_x_paa(_ppn_data_WIRE_1[3]),
		.io_x_eff(_ppn_data_WIRE_1[2]),
		.io_x_c(_ppn_data_WIRE_1[1]),
		.io_y_ppn(),
		.io_y_u(),
		.io_y_ae(),
		.io_y_sw(),
		.io_y_sx(),
		.io_y_sr(),
		.io_y_pw(_normal_entries_barrier_io_y_pw),
		.io_y_pr(_normal_entries_barrier_io_y_pr),
		.io_y_pal(_normal_entries_barrier_io_y_pal),
		.io_y_paa(_normal_entries_barrier_io_y_paa),
		.io_y_eff(_normal_entries_barrier_io_y_eff),
		.io_y_c(_normal_entries_barrier_io_y_c)
	);
	OptimizationBarrier_EntryData normal_entries_barrier_1(
		.io_x_ppn(_ppn_data_WIRE_3[33:14]),
		.io_x_u(_ppn_data_WIRE_3[13]),
		.io_x_ae(_ppn_data_WIRE_3[11]),
		.io_x_sw(_ppn_data_WIRE_3[10]),
		.io_x_sx(_ppn_data_WIRE_3[9]),
		.io_x_sr(_ppn_data_WIRE_3[8]),
		.io_x_pw(_ppn_data_WIRE_3[7]),
		.io_x_pr(_ppn_data_WIRE_3[5]),
		.io_x_pal(_ppn_data_WIRE_3[4]),
		.io_x_paa(_ppn_data_WIRE_3[3]),
		.io_x_eff(_ppn_data_WIRE_3[2]),
		.io_x_c(_ppn_data_WIRE_3[1]),
		.io_y_ppn(),
		.io_y_u(),
		.io_y_ae(),
		.io_y_sw(),
		.io_y_sx(),
		.io_y_sr(),
		.io_y_pw(_normal_entries_barrier_1_io_y_pw),
		.io_y_pr(_normal_entries_barrier_1_io_y_pr),
		.io_y_pal(_normal_entries_barrier_1_io_y_pal),
		.io_y_paa(_normal_entries_barrier_1_io_y_paa),
		.io_y_eff(_normal_entries_barrier_1_io_y_eff),
		.io_y_c(_normal_entries_barrier_1_io_y_c)
	);
	OptimizationBarrier_EntryData normal_entries_barrier_2(
		.io_x_ppn(superpage_entries_0_data_0[33:14]),
		.io_x_u(superpage_entries_0_data_0[13]),
		.io_x_ae(superpage_entries_0_data_0[11]),
		.io_x_sw(superpage_entries_0_data_0[10]),
		.io_x_sx(superpage_entries_0_data_0[9]),
		.io_x_sr(superpage_entries_0_data_0[8]),
		.io_x_pw(superpage_entries_0_data_0[7]),
		.io_x_pr(superpage_entries_0_data_0[5]),
		.io_x_pal(superpage_entries_0_data_0[4]),
		.io_x_paa(superpage_entries_0_data_0[3]),
		.io_x_eff(superpage_entries_0_data_0[2]),
		.io_x_c(superpage_entries_0_data_0[1]),
		.io_y_ppn(),
		.io_y_u(),
		.io_y_ae(),
		.io_y_sw(),
		.io_y_sx(),
		.io_y_sr(),
		.io_y_pw(_normal_entries_barrier_2_io_y_pw),
		.io_y_pr(_normal_entries_barrier_2_io_y_pr),
		.io_y_pal(_normal_entries_barrier_2_io_y_pal),
		.io_y_paa(_normal_entries_barrier_2_io_y_paa),
		.io_y_eff(_normal_entries_barrier_2_io_y_eff),
		.io_y_c(_normal_entries_barrier_2_io_y_c)
	);
	OptimizationBarrier_EntryData normal_entries_barrier_3(
		.io_x_ppn(superpage_entries_1_data_0[33:14]),
		.io_x_u(superpage_entries_1_data_0[13]),
		.io_x_ae(superpage_entries_1_data_0[11]),
		.io_x_sw(superpage_entries_1_data_0[10]),
		.io_x_sx(superpage_entries_1_data_0[9]),
		.io_x_sr(superpage_entries_1_data_0[8]),
		.io_x_pw(superpage_entries_1_data_0[7]),
		.io_x_pr(superpage_entries_1_data_0[5]),
		.io_x_pal(superpage_entries_1_data_0[4]),
		.io_x_paa(superpage_entries_1_data_0[3]),
		.io_x_eff(superpage_entries_1_data_0[2]),
		.io_x_c(superpage_entries_1_data_0[1]),
		.io_y_ppn(),
		.io_y_u(),
		.io_y_ae(),
		.io_y_sw(),
		.io_y_sx(),
		.io_y_sr(),
		.io_y_pw(_normal_entries_barrier_3_io_y_pw),
		.io_y_pr(_normal_entries_barrier_3_io_y_pr),
		.io_y_pal(_normal_entries_barrier_3_io_y_pal),
		.io_y_paa(_normal_entries_barrier_3_io_y_paa),
		.io_y_eff(_normal_entries_barrier_3_io_y_eff),
		.io_y_c(_normal_entries_barrier_3_io_y_c)
	);
	OptimizationBarrier_EntryData normal_entries_barrier_4(
		.io_x_ppn(superpage_entries_2_data_0[33:14]),
		.io_x_u(superpage_entries_2_data_0[13]),
		.io_x_ae(superpage_entries_2_data_0[11]),
		.io_x_sw(superpage_entries_2_data_0[10]),
		.io_x_sx(superpage_entries_2_data_0[9]),
		.io_x_sr(superpage_entries_2_data_0[8]),
		.io_x_pw(superpage_entries_2_data_0[7]),
		.io_x_pr(superpage_entries_2_data_0[5]),
		.io_x_pal(superpage_entries_2_data_0[4]),
		.io_x_paa(superpage_entries_2_data_0[3]),
		.io_x_eff(superpage_entries_2_data_0[2]),
		.io_x_c(superpage_entries_2_data_0[1]),
		.io_y_ppn(),
		.io_y_u(),
		.io_y_ae(),
		.io_y_sw(),
		.io_y_sx(),
		.io_y_sr(),
		.io_y_pw(_normal_entries_barrier_4_io_y_pw),
		.io_y_pr(_normal_entries_barrier_4_io_y_pr),
		.io_y_pal(_normal_entries_barrier_4_io_y_pal),
		.io_y_paa(_normal_entries_barrier_4_io_y_paa),
		.io_y_eff(_normal_entries_barrier_4_io_y_eff),
		.io_y_c(_normal_entries_barrier_4_io_y_c)
	);
	OptimizationBarrier_EntryData normal_entries_barrier_5(
		.io_x_ppn(superpage_entries_3_data_0[33:14]),
		.io_x_u(superpage_entries_3_data_0[13]),
		.io_x_ae(superpage_entries_3_data_0[11]),
		.io_x_sw(superpage_entries_3_data_0[10]),
		.io_x_sx(superpage_entries_3_data_0[9]),
		.io_x_sr(superpage_entries_3_data_0[8]),
		.io_x_pw(superpage_entries_3_data_0[7]),
		.io_x_pr(superpage_entries_3_data_0[5]),
		.io_x_pal(superpage_entries_3_data_0[4]),
		.io_x_paa(superpage_entries_3_data_0[3]),
		.io_x_eff(superpage_entries_3_data_0[2]),
		.io_x_c(superpage_entries_3_data_0[1]),
		.io_y_ppn(),
		.io_y_u(),
		.io_y_ae(),
		.io_y_sw(),
		.io_y_sx(),
		.io_y_sr(),
		.io_y_pw(_normal_entries_barrier_5_io_y_pw),
		.io_y_pr(_normal_entries_barrier_5_io_y_pr),
		.io_y_pal(_normal_entries_barrier_5_io_y_pal),
		.io_y_paa(_normal_entries_barrier_5_io_y_paa),
		.io_y_eff(_normal_entries_barrier_5_io_y_eff),
		.io_y_c(_normal_entries_barrier_5_io_y_c)
	);
	assign io_resp_0_miss = (io_ptw_resp_valid | tlb_miss_0) | multipleHits_0;
	assign io_resp_0_paddr = {(((((((hitsVec_0_0 ? _ppn_data_barrier_io_y_ppn : 20'h00000) | (hitsVec_0_1 ? _ppn_data_barrier_1_io_y_ppn : 20'h00000)) | (hitsVec_0_2 ? {_ppn_data_barrier_2_io_y_ppn[19:18], (ignore_1 ? io_req_0_bits_vaddr[29:21] : 9'h000) | _ppn_data_barrier_2_io_y_ppn[17:9], io_req_0_bits_vaddr[20:12] | _ppn_data_barrier_2_io_y_ppn[8:0]} : 20'h00000)) | (hitsVec_0_3 ? {_ppn_data_barrier_3_io_y_ppn[19:18], (ignore_4 ? io_req_0_bits_vaddr[29:21] : 9'h000) | _ppn_data_barrier_3_io_y_ppn[17:9], io_req_0_bits_vaddr[20:12] | _ppn_data_barrier_3_io_y_ppn[8:0]} : 20'h00000)) | (hitsVec_0_4 ? {_ppn_data_barrier_4_io_y_ppn[19:18], (ignore_7 ? io_req_0_bits_vaddr[29:21] : 9'h000) | _ppn_data_barrier_4_io_y_ppn[17:9], io_req_0_bits_vaddr[20:12] | _ppn_data_barrier_4_io_y_ppn[8:0]} : 20'h00000)) | (hitsVec_0_5 ? {_ppn_data_barrier_5_io_y_ppn[19:18], (ignore_10 ? io_req_0_bits_vaddr[29:21] : 9'h000) | _ppn_data_barrier_5_io_y_ppn[17:9], io_req_0_bits_vaddr[20:12] | _ppn_data_barrier_5_io_y_ppn[8:0]} : 20'h00000)) | (hitsVec_0_6 ? {_ppn_data_barrier_6_io_y_ppn[19:18], (ignore_13 ? io_req_0_bits_vaddr[29:21] : 9'h000) | _ppn_data_barrier_6_io_y_ppn[17:9], (special_entry_level[1] ? 9'h000 : io_req_0_bits_vaddr[20:12]) | _ppn_data_barrier_6_io_y_ppn[8:0]} : 20'h00000)) | (vm_enabled_0 ? 20'h00000 : io_req_0_bits_vaddr[31:12]), io_req_0_bits_vaddr[11:0]};
	assign io_resp_0_pf_ld = (bad_va_0 & cmd_read_0) | (|((cmd_read_0 ? {~(_r_array_T_4[6] | _entries_barrier_6_io_y_ae), ~(_r_array_T_4[5] | _entries_barrier_5_io_y_ae), ~(_r_array_T_4[4] | _entries_barrier_4_io_y_ae), ~(_r_array_T_4[3] | _entries_barrier_3_io_y_ae), ~(_r_array_T_4[2] | _entries_barrier_2_io_y_ae), ~(_r_array_T_4[1] | _entries_barrier_1_io_y_ae), ~(_r_array_T_4[0] | _entries_barrier_io_y_ae)} : 7'h00) & _GEN_9));
	assign io_resp_0_pf_st = (bad_va_0 & cmd_write_0) | (|((cmd_write_0 ? {~(_w_array_T_1[6] | _entries_barrier_6_io_y_ae), ~(_w_array_T_1[5] | _entries_barrier_5_io_y_ae), ~(_w_array_T_1[4] | _entries_barrier_4_io_y_ae), ~(_w_array_T_1[3] | _entries_barrier_3_io_y_ae), ~(_w_array_T_1[2] | _entries_barrier_2_io_y_ae), ~(_w_array_T_1[1] | _entries_barrier_1_io_y_ae), ~(_w_array_T_1[0] | _entries_barrier_io_y_ae)} : 7'h00) & _GEN_9));
	assign io_resp_0_ae_ld = |((ae_valid_array_0 & (cmd_read_0 ? ae_array_0 | ~({{2 {newEntry_pr}}, _normal_entries_barrier_5_io_y_pr, _normal_entries_barrier_4_io_y_pr, _normal_entries_barrier_3_io_y_pr, _normal_entries_barrier_2_io_y_pr, _normal_entries_barrier_1_io_y_pr, _normal_entries_barrier_io_y_pr} & _px_array_T_3) : 8'h00)) & hits_0);
	assign io_resp_0_ae_st = |((ae_valid_array_0 & (((cmd_write_0 ? ae_array_0 | ~({{2 {newEntry_pw}}, _normal_entries_barrier_5_io_y_pw, _normal_entries_barrier_4_io_y_pw, _normal_entries_barrier_3_io_y_pw, _normal_entries_barrier_2_io_y_pw, _normal_entries_barrier_1_io_y_pw, _normal_entries_barrier_io_y_pw} & _px_array_T_3) : 8'h00) | (((_cmd_write_T_5 | _cmd_write_T_6) | _cmd_write_T_7) | _cmd_write_T_8 ? ~({{2 {newEntry_pal}}, _normal_entries_barrier_5_io_y_pal, _normal_entries_barrier_4_io_y_pal, _normal_entries_barrier_3_io_y_pal, _normal_entries_barrier_2_io_y_pal, _normal_entries_barrier_1_io_y_pal, _normal_entries_barrier_io_y_pal} | lrscAllowed_0) : 8'h00)) | ((((_cmd_write_T_12 | _cmd_write_T_13) | _cmd_write_T_14) | _cmd_write_T_15) | _cmd_write_T_16 ? ~({{2 {newEntry_paa}}, _normal_entries_barrier_5_io_y_paa, _normal_entries_barrier_4_io_y_paa, _normal_entries_barrier_3_io_y_paa, _normal_entries_barrier_2_io_y_paa, _normal_entries_barrier_1_io_y_paa, _normal_entries_barrier_io_y_paa} | lrscAllowed_0) : 8'h00))) & hits_0);
	assign io_resp_0_ma_ld = |((|_GEN_8 & cmd_read_0 ? ~eff_array_0 : 8'h00) & hits_0);
	assign io_resp_0_ma_st = |((|_GEN_8 & cmd_write_0 ? ~eff_array_0 : 8'h00) & hits_0);
	assign io_resp_0_cacheable = |(lrscAllowed_0 & hits_0);
	assign io_ptw_req_valid = io_ptw_req_valid_0;
	assign io_ptw_req_bits_valid = ~io_kill;
	assign io_ptw_req_bits_bits_addr = r_refill_tag;
endmodule
