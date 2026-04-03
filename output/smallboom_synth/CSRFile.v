module CSRFile (
	clock,
	reset,
	io_ungated_clock,
	io_interrupts_debug,
	io_interrupts_mtip,
	io_interrupts_msip,
	io_interrupts_meip,
	io_interrupts_seip,
	io_hartid,
	io_rw_addr,
	io_rw_cmd,
	io_rw_rdata,
	io_rw_wdata,
	io_decode_0_inst,
	io_decode_0_fp_illegal,
	io_decode_0_read_illegal,
	io_decode_0_write_illegal,
	io_decode_0_write_flush,
	io_decode_0_system_illegal,
	io_csr_stall,
	io_singleStep,
	io_status_debug,
	io_status_dprv,
	io_status_prv,
	io_status_mxr,
	io_status_sum,
	io_ptbr_mode,
	io_ptbr_ppn,
	io_evec,
	io_exception,
	io_retire,
	io_cause,
	io_pc,
	io_tval,
	io_fcsr_rm,
	io_fcsr_flags_valid,
	io_fcsr_flags_bits,
	io_set_fs_dirty,
	io_interrupt,
	io_interrupt_cause,
	io_pmp_0_cfg_l,
	io_pmp_0_cfg_a,
	io_pmp_0_cfg_x,
	io_pmp_0_cfg_w,
	io_pmp_0_cfg_r,
	io_pmp_0_addr,
	io_pmp_0_mask,
	io_pmp_1_cfg_l,
	io_pmp_1_cfg_a,
	io_pmp_1_cfg_x,
	io_pmp_1_cfg_w,
	io_pmp_1_cfg_r,
	io_pmp_1_addr,
	io_pmp_1_mask,
	io_pmp_2_cfg_l,
	io_pmp_2_cfg_a,
	io_pmp_2_cfg_x,
	io_pmp_2_cfg_w,
	io_pmp_2_cfg_r,
	io_pmp_2_addr,
	io_pmp_2_mask,
	io_pmp_3_cfg_l,
	io_pmp_3_cfg_a,
	io_pmp_3_cfg_x,
	io_pmp_3_cfg_w,
	io_pmp_3_cfg_r,
	io_pmp_3_addr,
	io_pmp_3_mask,
	io_pmp_4_cfg_l,
	io_pmp_4_cfg_a,
	io_pmp_4_cfg_x,
	io_pmp_4_cfg_w,
	io_pmp_4_cfg_r,
	io_pmp_4_addr,
	io_pmp_4_mask,
	io_pmp_5_cfg_l,
	io_pmp_5_cfg_a,
	io_pmp_5_cfg_x,
	io_pmp_5_cfg_w,
	io_pmp_5_cfg_r,
	io_pmp_5_addr,
	io_pmp_5_mask,
	io_pmp_6_cfg_l,
	io_pmp_6_cfg_a,
	io_pmp_6_cfg_x,
	io_pmp_6_cfg_w,
	io_pmp_6_cfg_r,
	io_pmp_6_addr,
	io_pmp_6_mask,
	io_pmp_7_cfg_l,
	io_pmp_7_cfg_a,
	io_pmp_7_cfg_x,
	io_pmp_7_cfg_w,
	io_pmp_7_cfg_r,
	io_pmp_7_addr,
	io_pmp_7_mask,
	io_counters_0_eventSel,
	io_counters_0_inc,
	io_counters_1_eventSel,
	io_counters_1_inc,
	io_customCSRs_0_value,
	io_customCSRs_1_value,
	io_customCSRs_2_value
);
	input clock;
	input reset;
	input io_ungated_clock;
	input io_interrupts_debug;
	input io_interrupts_mtip;
	input io_interrupts_msip;
	input io_interrupts_meip;
	input io_interrupts_seip;
	input io_hartid;
	input [11:0] io_rw_addr;
	input [2:0] io_rw_cmd;
	output wire [63:0] io_rw_rdata;
	input [63:0] io_rw_wdata;
	input [31:0] io_decode_0_inst;
	output wire io_decode_0_fp_illegal;
	output wire io_decode_0_read_illegal;
	output wire io_decode_0_write_illegal;
	output wire io_decode_0_write_flush;
	output wire io_decode_0_system_illegal;
	output wire io_csr_stall;
	output wire io_singleStep;
	output wire io_status_debug;
	output wire [1:0] io_status_dprv;
	output wire [1:0] io_status_prv;
	output wire io_status_mxr;
	output wire io_status_sum;
	output wire [3:0] io_ptbr_mode;
	output wire [43:0] io_ptbr_ppn;
	output wire [39:0] io_evec;
	input io_exception;
	input io_retire;
	input [63:0] io_cause;
	input [39:0] io_pc;
	input [39:0] io_tval;
	output wire [2:0] io_fcsr_rm;
	input io_fcsr_flags_valid;
	input [4:0] io_fcsr_flags_bits;
	input io_set_fs_dirty;
	output wire io_interrupt;
	output wire [63:0] io_interrupt_cause;
	output wire io_pmp_0_cfg_l;
	output wire [1:0] io_pmp_0_cfg_a;
	output wire io_pmp_0_cfg_x;
	output wire io_pmp_0_cfg_w;
	output wire io_pmp_0_cfg_r;
	output wire [29:0] io_pmp_0_addr;
	output wire [31:0] io_pmp_0_mask;
	output wire io_pmp_1_cfg_l;
	output wire [1:0] io_pmp_1_cfg_a;
	output wire io_pmp_1_cfg_x;
	output wire io_pmp_1_cfg_w;
	output wire io_pmp_1_cfg_r;
	output wire [29:0] io_pmp_1_addr;
	output wire [31:0] io_pmp_1_mask;
	output wire io_pmp_2_cfg_l;
	output wire [1:0] io_pmp_2_cfg_a;
	output wire io_pmp_2_cfg_x;
	output wire io_pmp_2_cfg_w;
	output wire io_pmp_2_cfg_r;
	output wire [29:0] io_pmp_2_addr;
	output wire [31:0] io_pmp_2_mask;
	output wire io_pmp_3_cfg_l;
	output wire [1:0] io_pmp_3_cfg_a;
	output wire io_pmp_3_cfg_x;
	output wire io_pmp_3_cfg_w;
	output wire io_pmp_3_cfg_r;
	output wire [29:0] io_pmp_3_addr;
	output wire [31:0] io_pmp_3_mask;
	output wire io_pmp_4_cfg_l;
	output wire [1:0] io_pmp_4_cfg_a;
	output wire io_pmp_4_cfg_x;
	output wire io_pmp_4_cfg_w;
	output wire io_pmp_4_cfg_r;
	output wire [29:0] io_pmp_4_addr;
	output wire [31:0] io_pmp_4_mask;
	output wire io_pmp_5_cfg_l;
	output wire [1:0] io_pmp_5_cfg_a;
	output wire io_pmp_5_cfg_x;
	output wire io_pmp_5_cfg_w;
	output wire io_pmp_5_cfg_r;
	output wire [29:0] io_pmp_5_addr;
	output wire [31:0] io_pmp_5_mask;
	output wire io_pmp_6_cfg_l;
	output wire [1:0] io_pmp_6_cfg_a;
	output wire io_pmp_6_cfg_x;
	output wire io_pmp_6_cfg_w;
	output wire io_pmp_6_cfg_r;
	output wire [29:0] io_pmp_6_addr;
	output wire [31:0] io_pmp_6_mask;
	output wire io_pmp_7_cfg_l;
	output wire [1:0] io_pmp_7_cfg_a;
	output wire io_pmp_7_cfg_x;
	output wire io_pmp_7_cfg_w;
	output wire io_pmp_7_cfg_r;
	output wire [29:0] io_pmp_7_addr;
	output wire [31:0] io_pmp_7_mask;
	output wire [63:0] io_counters_0_eventSel;
	input io_counters_0_inc;
	output wire [63:0] io_counters_1_eventSel;
	input io_counters_1_inc;
	output wire [63:0] io_customCSRs_0_value;
	output wire [63:0] io_customCSRs_1_value;
	output wire [63:0] io_customCSRs_2_value;
	wire set_fs_dirty;
	wire [63:0] _io_rw_rdata_T_302;
	reg io_status_cease_r;
	wire io_singleStep_0;
	reg [1:0] reg_mstatus_prv;
	reg reg_mstatus_v;
	reg reg_mstatus_mpv;
	reg reg_mstatus_gva;
	reg reg_mstatus_tsr;
	reg reg_mstatus_tw;
	reg reg_mstatus_tvm;
	reg reg_mstatus_mxr;
	reg reg_mstatus_sum;
	reg reg_mstatus_mprv;
	reg [1:0] reg_mstatus_fs;
	reg [1:0] reg_mstatus_mpp;
	reg reg_mstatus_spp;
	reg reg_mstatus_mpie;
	reg reg_mstatus_spie;
	reg reg_mstatus_mie;
	reg reg_mstatus_sie;
	reg reg_dcsr_ebreakm;
	reg reg_dcsr_ebreaks;
	reg reg_dcsr_ebreaku;
	reg [2:0] reg_dcsr_cause;
	reg reg_dcsr_v;
	reg reg_dcsr_step;
	reg [1:0] reg_dcsr_prv;
	reg reg_debug;
	reg [39:0] reg_dpc;
	reg [63:0] reg_dscratch0;
	reg reg_singleStepped;
	reg reg_pmp_0_cfg_l;
	reg [1:0] reg_pmp_0_cfg_a;
	reg reg_pmp_0_cfg_x;
	reg reg_pmp_0_cfg_w;
	reg reg_pmp_0_cfg_r;
	reg [29:0] reg_pmp_0_addr;
	reg reg_pmp_1_cfg_l;
	reg [1:0] reg_pmp_1_cfg_a;
	reg reg_pmp_1_cfg_x;
	reg reg_pmp_1_cfg_w;
	reg reg_pmp_1_cfg_r;
	reg [29:0] reg_pmp_1_addr;
	reg reg_pmp_2_cfg_l;
	reg [1:0] reg_pmp_2_cfg_a;
	reg reg_pmp_2_cfg_x;
	reg reg_pmp_2_cfg_w;
	reg reg_pmp_2_cfg_r;
	reg [29:0] reg_pmp_2_addr;
	reg reg_pmp_3_cfg_l;
	reg [1:0] reg_pmp_3_cfg_a;
	reg reg_pmp_3_cfg_x;
	reg reg_pmp_3_cfg_w;
	reg reg_pmp_3_cfg_r;
	reg [29:0] reg_pmp_3_addr;
	reg reg_pmp_4_cfg_l;
	reg [1:0] reg_pmp_4_cfg_a;
	reg reg_pmp_4_cfg_x;
	reg reg_pmp_4_cfg_w;
	reg reg_pmp_4_cfg_r;
	reg [29:0] reg_pmp_4_addr;
	reg reg_pmp_5_cfg_l;
	reg [1:0] reg_pmp_5_cfg_a;
	reg reg_pmp_5_cfg_x;
	reg reg_pmp_5_cfg_w;
	reg reg_pmp_5_cfg_r;
	reg [29:0] reg_pmp_5_addr;
	reg reg_pmp_6_cfg_l;
	reg [1:0] reg_pmp_6_cfg_a;
	reg reg_pmp_6_cfg_x;
	reg reg_pmp_6_cfg_w;
	reg reg_pmp_6_cfg_r;
	reg [29:0] reg_pmp_6_addr;
	reg reg_pmp_7_cfg_l;
	reg [1:0] reg_pmp_7_cfg_a;
	reg reg_pmp_7_cfg_x;
	reg reg_pmp_7_cfg_w;
	reg reg_pmp_7_cfg_r;
	reg [29:0] reg_pmp_7_addr;
	reg [63:0] reg_mie;
	reg [63:0] reg_mideleg;
	wire [8:0] _GEN = reg_mideleg[9:1] & 9'h111;
	wire [15:0] _GEN_0 = {6'h00, _GEN, 1'h0};
	wire [63:0] _GEN_1 = {54'h00000000000000, _GEN, 1'h0};
	reg [63:0] reg_medeleg;
	wire [63:0] _GEN_2 = {48'h000000000000, reg_medeleg[15:0] & 16'hb15d};
	reg reg_mip_seip;
	reg reg_mip_stip;
	reg reg_mip_ssip;
	reg [39:0] reg_mepc;
	reg [63:0] reg_mcause;
	reg [39:0] reg_mtval;
	reg [63:0] reg_mscratch;
	reg [31:0] reg_mtvec;
	reg reg_menvcfg_fiom;
	reg reg_senvcfg_fiom;
	reg [31:0] reg_mcounteren;
	wire [31:0] _GEN_3 = {27'h0000000, reg_mcounteren[4:0]};
	reg [31:0] reg_scounteren;
	wire [31:0] _GEN_4 = {27'h0000000, reg_scounteren[4:0]};
	reg reg_vsstatus_spp;
	reg [39:0] reg_vsepc;
	reg [39:0] reg_sepc;
	reg [63:0] reg_scause;
	reg [39:0] reg_stval;
	reg [63:0] reg_sscratch;
	reg [38:0] reg_stvec;
	reg [3:0] reg_satp_mode;
	reg [43:0] reg_satp_ppn;
	reg reg_wfi;
	reg [4:0] reg_fflags;
	reg [2:0] reg_frm;
	reg [4:0] reg_mcountinhibit;
	reg [5:0] small_0;
	reg [57:0] large_0;
	wire [63:0] value = {large_0, small_0};
	reg [5:0] small_1;
	reg [57:0] large_1;
	wire [63:0] value_1 = {large_1, small_1};
	reg [63:0] reg_hpmevent_0;
	reg [63:0] reg_hpmevent_1;
	reg [5:0] small_2;
	reg [33:0] large_2;
	wire [39:0] value_2 = {large_2, small_2};
	reg [5:0] small_3;
	reg [33:0] large_3;
	wire [39:0] value_3 = {large_3, small_3};
	wire [15:0] read_mip = {4'h0, io_interrupts_meip, 1'h0, reg_mip_seip | io_interrupts_seip, 1'h0, io_interrupts_mtip, 1'h0, reg_mip_stip, 1'h0, io_interrupts_msip, 1'h0, reg_mip_ssip, 1'h0};
	wire [15:0] _GEN_5 = reg_mie[15:0] & read_mip;
	wire [15:0] m_interrupts = (~reg_mstatus_prv[1] | reg_mstatus_mie ? ~(~_GEN_5 | _GEN_0) : 16'h0000);
	wire [15:0] s_interrupts = ((reg_mstatus_v | (reg_mstatus_prv == 2'h0)) | ((reg_mstatus_prv == 2'h1) & reg_mstatus_sie) ? _GEN_5 & _GEN_0 : 16'h0000);
	wire [29:0] _GEN_6 = {reg_pmp_0_addr[28:0], reg_pmp_0_cfg_a[0]};
	wire [29:0] _GEN_7 = {reg_pmp_1_addr[28:0], reg_pmp_1_cfg_a[0]};
	wire [29:0] _GEN_8 = {reg_pmp_2_addr[28:0], reg_pmp_2_cfg_a[0]};
	wire [29:0] _GEN_9 = {reg_pmp_3_addr[28:0], reg_pmp_3_cfg_a[0]};
	wire [29:0] _GEN_10 = {reg_pmp_4_addr[28:0], reg_pmp_4_cfg_a[0]};
	wire [29:0] _GEN_11 = {reg_pmp_5_addr[28:0], reg_pmp_5_cfg_a[0]};
	wire [29:0] _GEN_12 = {reg_pmp_6_addr[28:0], reg_pmp_6_cfg_a[0]};
	wire [29:0] _GEN_13 = {reg_pmp_7_addr[28:0], reg_pmp_7_cfg_a[0]};
	wire [31:0] _read_mtvec_T_5 = reg_mtvec & {24'hffffff, ~(reg_mtvec[0] ? 8'hfe : 8'h02)};
	wire [38:0] _read_stvec_T_5 = reg_stvec & {31'h7fffffff, ~(reg_stvec[0] ? 8'hfe : 8'h02)};
	wire [39:0] _io_evec_T_20 = ~reg_mepc;
	wire [1:0] _GEN_14 = _io_evec_T_20[1:0] | 2'h1;
	wire [39:0] _read_mapping_T_6 = ~{_io_evec_T_20[39:2], _GEN_14};
	wire [39:0] _io_evec_T_10 = ~reg_dpc;
	wire [1:0] _GEN_15 = _io_evec_T_10[1:0] | 2'h1;
	wire [39:0] _debug_csrs_T_4 = ~{_io_evec_T_10[39:2], _GEN_15};
	wire [39:0] _io_evec_T = ~reg_sepc;
	wire [1:0] _GEN_16 = _io_evec_T[1:0] | 2'h1;
	wire [39:0] _GEN_17 = ~{_io_evec_T[39:2], _GEN_16};
	reg [63:0] reg_custom_0;
	reg [63:0] reg_custom_1;
	reg [63:0] reg_custom_2;
	wire [11:0] decoded_addr_decoded_decoded_invInputs = ~io_rw_addr;
	wire [10:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T = {decoded_addr_decoded_decoded_invInputs[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], decoded_addr_decoded_decoded_invInputs[8], decoded_addr_decoded_decoded_invInputs[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_1 = {decoded_addr_decoded_decoded_invInputs[0], io_rw_addr[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], decoded_addr_decoded_decoded_invInputs[8], decoded_addr_decoded_decoded_invInputs[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_2 = {io_rw_addr[0], io_rw_addr[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], decoded_addr_decoded_decoded_invInputs[8], decoded_addr_decoded_decoded_invInputs[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [9:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_3 = {decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], decoded_addr_decoded_decoded_invInputs[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_4 = {decoded_addr_decoded_decoded_invInputs[0], decoded_addr_decoded_decoded_invInputs[1], io_rw_addr[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], decoded_addr_decoded_decoded_invInputs[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_5 = {io_rw_addr[0], decoded_addr_decoded_decoded_invInputs[1], io_rw_addr[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], decoded_addr_decoded_decoded_invInputs[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [10:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_6 = {io_rw_addr[1], io_rw_addr[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], decoded_addr_decoded_decoded_invInputs[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [8:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_7 = {io_rw_addr[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], decoded_addr_decoded_decoded_invInputs[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_8 = {decoded_addr_decoded_decoded_invInputs[0], decoded_addr_decoded_decoded_invInputs[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], io_rw_addr[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], decoded_addr_decoded_decoded_invInputs[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_9 = {io_rw_addr[0], decoded_addr_decoded_decoded_invInputs[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], io_rw_addr[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], decoded_addr_decoded_decoded_invInputs[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_10 = {decoded_addr_decoded_decoded_invInputs[0], io_rw_addr[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], io_rw_addr[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], decoded_addr_decoded_decoded_invInputs[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_11 = {io_rw_addr[0], io_rw_addr[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], io_rw_addr[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], decoded_addr_decoded_decoded_invInputs[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [9:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_12 = {io_rw_addr[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], io_rw_addr[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], decoded_addr_decoded_decoded_invInputs[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [4:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_13 = {io_rw_addr[7], io_rw_addr[8], decoded_addr_decoded_decoded_invInputs[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_14 = {decoded_addr_decoded_decoded_invInputs[0], decoded_addr_decoded_decoded_invInputs[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_16 = {decoded_addr_decoded_decoded_invInputs[0], io_rw_addr[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_17 = {io_rw_addr[0], io_rw_addr[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_18 = {decoded_addr_decoded_decoded_invInputs[0], decoded_addr_decoded_decoded_invInputs[1], io_rw_addr[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_19 = {io_rw_addr[0], decoded_addr_decoded_decoded_invInputs[1], io_rw_addr[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [10:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_20 = {io_rw_addr[1], io_rw_addr[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [8:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_21 = {io_rw_addr[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [10:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_22 = {decoded_addr_decoded_decoded_invInputs[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], io_rw_addr[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [10:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_23 = {io_rw_addr[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], io_rw_addr[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_24 = {decoded_addr_decoded_decoded_invInputs[0], decoded_addr_decoded_decoded_invInputs[1], io_rw_addr[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], io_rw_addr[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_52 = {decoded_addr_decoded_decoded_invInputs[0], decoded_addr_decoded_decoded_invInputs[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], io_rw_addr[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_53 = {io_rw_addr[0], decoded_addr_decoded_decoded_invInputs[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], io_rw_addr[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_54 = {decoded_addr_decoded_decoded_invInputs[0], io_rw_addr[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], io_rw_addr[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_55 = {io_rw_addr[0], io_rw_addr[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], io_rw_addr[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [9:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_56 = {io_rw_addr[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], io_rw_addr[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [10:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_57 = {decoded_addr_decoded_decoded_invInputs[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], io_rw_addr[5], decoded_addr_decoded_decoded_invInputs[6], io_rw_addr[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_59 = {decoded_addr_decoded_decoded_invInputs[0], decoded_addr_decoded_decoded_invInputs[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], io_rw_addr[4], io_rw_addr[5], decoded_addr_decoded_decoded_invInputs[6], io_rw_addr[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_60 = {io_rw_addr[0], decoded_addr_decoded_decoded_invInputs[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], io_rw_addr[4], io_rw_addr[5], decoded_addr_decoded_decoded_invInputs[6], io_rw_addr[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_61 = {decoded_addr_decoded_decoded_invInputs[0], io_rw_addr[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], io_rw_addr[4], io_rw_addr[5], decoded_addr_decoded_decoded_invInputs[6], io_rw_addr[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_62 = {io_rw_addr[0], io_rw_addr[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], io_rw_addr[4], io_rw_addr[5], decoded_addr_decoded_decoded_invInputs[6], io_rw_addr[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_63 = {decoded_addr_decoded_decoded_invInputs[0], decoded_addr_decoded_decoded_invInputs[1], io_rw_addr[2], decoded_addr_decoded_decoded_invInputs[3], io_rw_addr[4], io_rw_addr[5], decoded_addr_decoded_decoded_invInputs[6], io_rw_addr[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_64 = {io_rw_addr[0], decoded_addr_decoded_decoded_invInputs[1], io_rw_addr[2], decoded_addr_decoded_decoded_invInputs[3], io_rw_addr[4], io_rw_addr[5], decoded_addr_decoded_decoded_invInputs[6], io_rw_addr[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_65 = {decoded_addr_decoded_decoded_invInputs[0], io_rw_addr[1], io_rw_addr[2], decoded_addr_decoded_decoded_invInputs[3], io_rw_addr[4], io_rw_addr[5], decoded_addr_decoded_decoded_invInputs[6], io_rw_addr[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_66 = {io_rw_addr[0], io_rw_addr[1], io_rw_addr[2], decoded_addr_decoded_decoded_invInputs[3], io_rw_addr[4], io_rw_addr[5], decoded_addr_decoded_decoded_invInputs[6], io_rw_addr[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_79 = {decoded_addr_decoded_decoded_invInputs[0], decoded_addr_decoded_decoded_invInputs[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], io_rw_addr[4], io_rw_addr[5], decoded_addr_decoded_decoded_invInputs[6], io_rw_addr[7], io_rw_addr[8], io_rw_addr[9], io_rw_addr[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_80 = {io_rw_addr[0], decoded_addr_decoded_decoded_invInputs[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], io_rw_addr[4], io_rw_addr[5], decoded_addr_decoded_decoded_invInputs[6], io_rw_addr[7], io_rw_addr[8], io_rw_addr[9], io_rw_addr[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [10:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_81 = {io_rw_addr[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], io_rw_addr[4], io_rw_addr[5], decoded_addr_decoded_decoded_invInputs[6], io_rw_addr[7], io_rw_addr[8], io_rw_addr[9], io_rw_addr[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [5:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_82 = {io_rw_addr[6], io_rw_addr[7], io_rw_addr[8], io_rw_addr[9], io_rw_addr[10], decoded_addr_decoded_decoded_invInputs[11]};
	wire [8:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_83 = {decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], decoded_addr_decoded_decoded_invInputs[8], decoded_addr_decoded_decoded_invInputs[9], decoded_addr_decoded_decoded_invInputs[10], io_rw_addr[11]};
	wire [8:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_84 = {io_rw_addr[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], decoded_addr_decoded_decoded_invInputs[8], decoded_addr_decoded_decoded_invInputs[9], decoded_addr_decoded_decoded_invInputs[10], io_rw_addr[11]};
	wire [10:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_85 = {decoded_addr_decoded_decoded_invInputs[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], io_rw_addr[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_86 = {decoded_addr_decoded_decoded_invInputs[0], io_rw_addr[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], io_rw_addr[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_87 = {io_rw_addr[0], io_rw_addr[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], io_rw_addr[11]};
	wire [11:0] _decoded_addr_decoded_decoded_andMatrixOutputs_T_88 = {decoded_addr_decoded_decoded_invInputs[0], decoded_addr_decoded_decoded_invInputs[1], io_rw_addr[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], io_rw_addr[11]};
	wire [63:0] _wdata_T_2 = (io_rw_cmd[1] ? _io_rw_rdata_T_302 : 64'h0000000000000000) | io_rw_wdata;
	wire [63:0] _wdata_T_6 = ~(&io_rw_cmd[1:0] ? io_rw_wdata : 64'h0000000000000000);
	wire system_insn = io_rw_cmd == 3'h4;
	wire [11:0] _GEN_18 = ~io_rw_addr;
	wire insn_call = system_insn & (&{_GEN_18[0], _GEN_18[1], _GEN_18[2], _GEN_18[3], _GEN_18[4], _GEN_18[5], _GEN_18[6], _GEN_18[7], _GEN_18[8], _GEN_18[9], _GEN_18[10], _GEN_18[11]});
	wire insn_break = system_insn & (&{io_rw_addr[0], _GEN_18[1], _GEN_18[2], _GEN_18[3], _GEN_18[4], _GEN_18[5], _GEN_18[6], _GEN_18[7], _GEN_18[8], _GEN_18[9], _GEN_18[10], _GEN_18[11]});
	wire insn_ret = system_insn & |{&{_GEN_18[2], _GEN_18[3], _GEN_18[4], _GEN_18[5], _GEN_18[6], _GEN_18[7], io_rw_addr[8], _GEN_18[10], _GEN_18[11]}, &{io_rw_addr[10], _GEN_18[11]}};
	wire [29:0] decoded_invInputs_1 = ~io_decode_0_inst[31:2];
	wire [1:0] _decoded_orMatrixOutputs_T_10 = {&{io_decode_0_inst[0], decoded_invInputs_1[20], decoded_invInputs_1[21], decoded_invInputs_1[22], decoded_invInputs_1[23], decoded_invInputs_1[24], decoded_invInputs_1[25], io_decode_0_inst[28], decoded_invInputs_1[28], decoded_invInputs_1[29]}, &{io_decode_0_inst[30], decoded_invInputs_1[29]}};
	wire allow_sfence_vma = reg_mstatus_prv[1] | ~(~reg_mstatus_v & reg_mstatus_tvm);
	wire [31:0] _GEN_19 = {27'h0000000, io_decode_0_inst[24:20]};
	wire [31:0] _io_decode_0_virtual_access_illegal_T_3 = _GEN_3 >> _GEN_19;
	wire [31:0] _io_decode_0_virtual_access_illegal_T_11 = _GEN_4 >> _GEN_19;
	wire io_decode_0_fp_illegal_0 = reg_mstatus_fs == 2'h0;
	wire [3:0] io_decode_0_fp_csr_invInputs = ~io_decode_0_inst[31:28];
	wire _io_decode_0_virtual_access_illegal_T_24 = io_decode_0_inst[31:20] == 12'h180;
	wire csr_exists = (((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((io_decode_0_inst[31:20] == 12'h7a0) | (io_decode_0_inst[31:20] == 12'h7a1)) | (io_decode_0_inst[31:20] == 12'h7a2)) | (io_decode_0_inst[31:20] == 12'h7a3)) | (io_decode_0_inst[31:20] == 12'h301)) | (io_decode_0_inst[31:20] == 12'h300)) | (io_decode_0_inst[31:20] == 12'h305)) | (io_decode_0_inst[31:20] == 12'h344)) | (io_decode_0_inst[31:20] == 12'h304)) | (io_decode_0_inst[31:20] == 12'h340)) | (io_decode_0_inst[31:20] == 12'h341)) | (io_decode_0_inst[31:20] == 12'h343)) | (io_decode_0_inst[31:20] == 12'h342)) | (io_decode_0_inst[31:20] == 12'hf14)) | (io_decode_0_inst[31:20] == 12'h7b0)) | (io_decode_0_inst[31:20] == 12'h7b1)) | (io_decode_0_inst[31:20] == 12'h7b2)) | (io_decode_0_inst[31:20] == 12'h001)) | (io_decode_0_inst[31:20] == 12'h002)) | (io_decode_0_inst[31:20] == 12'h003)) | (io_decode_0_inst[31:20] == 12'h320)) | (io_decode_0_inst[31:20] == 12'hb00)) | (io_decode_0_inst[31:20] == 12'hb02)) | (io_decode_0_inst[31:20] == 12'h323)) | (io_decode_0_inst[31:20] == 12'hb03)) | (io_decode_0_inst[31:20] == 12'hc03)) | (io_decode_0_inst[31:20] == 12'h324)) | (io_decode_0_inst[31:20] == 12'hb04)) | (io_decode_0_inst[31:20] == 12'hc04)) | (io_decode_0_inst[31:20] == 12'h325)) | (io_decode_0_inst[31:20] == 12'hb05)) | (io_decode_0_inst[31:20] == 12'hc05)) | (io_decode_0_inst[31:20] == 12'h326)) | (io_decode_0_inst[31:20] == 12'hb06)) | (io_decode_0_inst[31:20] == 12'hc06)) | (io_decode_0_inst[31:20] == 12'h327)) | (io_decode_0_inst[31:20] == 12'hb07)) | (io_decode_0_inst[31:20] == 12'hc07)) | (io_decode_0_inst[31:20] == 12'h328)) | (io_decode_0_inst[31:20] == 12'hb08)) | (io_decode_0_inst[31:20] == 12'hc08)) | (io_decode_0_inst[31:20] == 12'h329)) | (io_decode_0_inst[31:20] == 12'hb09)) | (io_decode_0_inst[31:20] == 12'hc09)) | (io_decode_0_inst[31:20] == 12'h32a)) | (io_decode_0_inst[31:20] == 12'hb0a)) | (io_decode_0_inst[31:20] == 12'hc0a)) | (io_decode_0_inst[31:20] == 12'h32b)) | (io_decode_0_inst[31:20] == 12'hb0b)) | (io_decode_0_inst[31:20] == 12'hc0b)) | (io_decode_0_inst[31:20] == 12'h32c)) | (io_decode_0_inst[31:20] == 12'hb0c)) | (io_decode_0_inst[31:20] == 12'hc0c)) | (io_decode_0_inst[31:20] == 12'h32d)) | (io_decode_0_inst[31:20] == 12'hb0d)) | (io_decode_0_inst[31:20] == 12'hc0d)) | (io_decode_0_inst[31:20] == 12'h32e)) | (io_decode_0_inst[31:20] == 12'hb0e)) | (io_decode_0_inst[31:20] == 12'hc0e)) | (io_decode_0_inst[31:20] == 12'h32f)) | (io_decode_0_inst[31:20] == 12'hb0f)) | (io_decode_0_inst[31:20] == 12'hc0f)) | (io_decode_0_inst[31:20] == 12'h330)) | (io_decode_0_inst[31:20] == 12'hb10)) | (io_decode_0_inst[31:20] == 12'hc10)) | (io_decode_0_inst[31:20] == 12'h331)) | (io_decode_0_inst[31:20] == 12'hb11)) | (io_decode_0_inst[31:20] == 12'hc11)) | (io_decode_0_inst[31:20] == 12'h332)) | (io_decode_0_inst[31:20] == 12'hb12)) | (io_decode_0_inst[31:20] == 12'hc12)) | (io_decode_0_inst[31:20] == 12'h333)) | (io_decode_0_inst[31:20] == 12'hb13)) | (io_decode_0_inst[31:20] == 12'hc13)) | (io_decode_0_inst[31:20] == 12'h334)) | (io_decode_0_inst[31:20] == 12'hb14)) | (io_decode_0_inst[31:20] == 12'hc14)) | (io_decode_0_inst[31:20] == 12'h335)) | (io_decode_0_inst[31:20] == 12'hb15)) | (io_decode_0_inst[31:20] == 12'hc15)) | (io_decode_0_inst[31:20] == 12'h336)) | (io_decode_0_inst[31:20] == 12'hb16)) | (io_decode_0_inst[31:20] == 12'hc16)) | (io_decode_0_inst[31:20] == 12'h337)) | (io_decode_0_inst[31:20] == 12'hb17)) | (io_decode_0_inst[31:20] == 12'hc17)) | (io_decode_0_inst[31:20] == 12'h338)) | (io_decode_0_inst[31:20] == 12'hb18)) | (io_decode_0_inst[31:20] == 12'hc18)) | (io_decode_0_inst[31:20] == 12'h339)) | (io_decode_0_inst[31:20] == 12'hb19)) | (io_decode_0_inst[31:20] == 12'hc19)) | (io_decode_0_inst[31:20] == 12'h33a)) | (io_decode_0_inst[31:20] == 12'hb1a)) | (io_decode_0_inst[31:20] == 12'hc1a)) | (io_decode_0_inst[31:20] == 12'h33b)) | (io_decode_0_inst[31:20] == 12'hb1b)) | (io_decode_0_inst[31:20] == 12'hc1b)) | (io_decode_0_inst[31:20] == 12'h33c)) | (io_decode_0_inst[31:20] == 12'hb1c)) | (io_decode_0_inst[31:20] == 12'hc1c)) | (io_decode_0_inst[31:20] == 12'h33d)) | (io_decode_0_inst[31:20] == 12'hb1d)) | (io_decode_0_inst[31:20] == 12'hc1d)) | (io_decode_0_inst[31:20] == 12'h33e)) | (io_decode_0_inst[31:20] == 12'hb1e)) | (io_decode_0_inst[31:20] == 12'hc1e)) | (io_decode_0_inst[31:20] == 12'h33f)) | (io_decode_0_inst[31:20] == 12'hb1f)) | (io_decode_0_inst[31:20] == 12'hc1f)) | (io_decode_0_inst[31:20] == 12'h306)) | (io_decode_0_inst[31:20] == 12'hc00)) | (io_decode_0_inst[31:20] == 12'hc02)) | (io_decode_0_inst[31:20] == 12'h30a)) | (io_decode_0_inst[31:20] == 12'h100)) | (io_decode_0_inst[31:20] == 12'h144)) | (io_decode_0_inst[31:20] == 12'h104)) | (io_decode_0_inst[31:20] == 12'h140)) | (io_decode_0_inst[31:20] == 12'h142)) | (io_decode_0_inst[31:20] == 12'h143)) | _io_decode_0_virtual_access_illegal_T_24) | (io_decode_0_inst[31:20] == 12'h141)) | (io_decode_0_inst[31:20] == 12'h105)) | (io_decode_0_inst[31:20] == 12'h106)) | (io_decode_0_inst[31:20] == 12'h303)) | (io_decode_0_inst[31:20] == 12'h302)) | (io_decode_0_inst[31:20] == 12'h10a)) | (io_decode_0_inst[31:20] == 12'h3a0)) | (io_decode_0_inst[31:20] == 12'h3a2)) | (io_decode_0_inst[31:20] == 12'h3b0)) | (io_decode_0_inst[31:20] == 12'h3b1)) | (io_decode_0_inst[31:20] == 12'h3b2)) | (io_decode_0_inst[31:20] == 12'h3b3)) | (io_decode_0_inst[31:20] == 12'h3b4)) | (io_decode_0_inst[31:20] == 12'h3b5)) | (io_decode_0_inst[31:20] == 12'h3b6)) | (io_decode_0_inst[31:20] == 12'h3b7)) | (io_decode_0_inst[31:20] == 12'h3b8)) | (io_decode_0_inst[31:20] == 12'h3b9)) | (io_decode_0_inst[31:20] == 12'h3ba)) | (io_decode_0_inst[31:20] == 12'h3bb)) | (io_decode_0_inst[31:20] == 12'h3bc)) | (io_decode_0_inst[31:20] == 12'h3bd)) | (io_decode_0_inst[31:20] == 12'h3be)) | (io_decode_0_inst[31:20] == 12'h3bf)) | (io_decode_0_inst[31:20] == 12'h800)) | (io_decode_0_inst[31:20] == 12'h808)) | (io_decode_0_inst[31:20] == 12'h7c1)) | (io_decode_0_inst[31:20] == 12'hf12)) | (io_decode_0_inst[31:20] == 12'hf13)) | (io_decode_0_inst[31:20] == 12'hf11)) | (io_decode_0_inst[31:20] == 12'hf15);
	wire _io_decode_0_system_illegal_T = reg_mstatus_prv < io_decode_0_inst[29:28];
	wire [5:0] io_decode_0_read_illegal_invInputs = ~io_decode_0_inst[31:26];
	wire [11:0] io_decode_0_write_flush_addr_m = {io_decode_0_inst[31:30], io_decode_0_inst[29:20] | 10'h300};
	wire [63:0] cause = (insn_call ? {60'h000000000000000, {2'h0, (reg_mstatus_prv[0] & reg_mstatus_v ? 2'h2 : reg_mstatus_prv)} - 4'h8} : (insn_break ? 64'h0000000000000003 : io_cause));
	wire _causeIsDebugTrigger_T_2 = cause[7:0] == 8'h0e;
	wire causeIsDebugInt = cause[63] & _causeIsDebugTrigger_T_2;
	wire causeIsDebugTrigger = ~cause[63] & _causeIsDebugTrigger_T_2;
	wire [3:0] _causeIsDebugBreak_T_4 = {reg_dcsr_ebreakm, 1'h0, reg_dcsr_ebreaks, reg_dcsr_ebreaku} >> reg_mstatus_prv;
	wire trapToDebug = (((reg_singleStepped | causeIsDebugInt) | causeIsDebugTrigger) | ((~cause[63] & insn_break) & _causeIsDebugBreak_T_4[0])) | reg_debug;
	wire [63:0] _GEN_20 = {58'h000000000000000, cause[5:0]};
	wire [63:0] _delegate_T_3 = _GEN_1 >> _GEN_20;
	wire [63:0] _delegate_T_5 = _GEN_2 >> _GEN_20;
	wire delegate = ~reg_mstatus_prv[1] & (cause[63] ? _delegate_T_3[0] : _delegate_T_5[0]);
	wire [63:0] _delegateVS_T_2 = 64'h0000000000000000 >> _GEN_20;
	wire [63:0] _delegateVS_T_4 = 64'h0000000000000000 >> _GEN_20;
	wire delegateVS = (reg_mstatus_v & delegate) & (cause[63] ? _delegateVS_T_2[0] : _delegateVS_T_4[0]);
	wire [39:0] notDebugTVec_base = (delegate ? (delegateVS ? 40'h0000000000 : {reg_stvec[38], _read_stvec_T_5}) : {8'h00, _read_mtvec_T_5});
	assign io_singleStep_0 = reg_dcsr_step & ~reg_debug;
	wire exception = (insn_call | insn_break) | io_exception;
	wire _GEN_21 = delegateVS | delegate;
	wire [1:0] _GEN_22 = {~_GEN_21, 1'h1};
	wire [39:0] _io_evec_T_5 = ~reg_vsepc;
	wire _GEN_23 = io_rw_addr[10] & io_rw_addr[7];
	wire [1:0] ret_prv = (io_rw_addr[9] ? (_GEN_23 ? reg_dcsr_prv : reg_mstatus_mpp) : {1'h0, (reg_mstatus_v ? reg_vsstatus_spp : reg_mstatus_spp)});
	wire io_csr_stall_0 = reg_wfi | io_status_cease_r;
	wire [63:0] _io_rw_rdata_T_157 = ((&{io_rw_addr[0], decoded_addr_decoded_decoded_invInputs[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], decoded_addr_decoded_decoded_invInputs[10], decoded_addr_decoded_decoded_invInputs[11]} ? 64'h800000000014112d : 64'h0000000000000000) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_14 ? {&reg_mstatus_fs, 23'h000000, reg_mstatus_mpv, reg_mstatus_gva, 15'h1400, reg_mstatus_tsr, reg_mstatus_tw, reg_mstatus_tvm, reg_mstatus_mxr, reg_mstatus_sum, reg_mstatus_mprv, 2'h0, reg_mstatus_fs, reg_mstatus_mpp, 2'h0, reg_mstatus_spp, reg_mstatus_mpie, 1'h0, reg_mstatus_spie, 1'h0, reg_mstatus_mie, 1'h0, reg_mstatus_sie, 1'h0} : 64'h0000000000000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_19 ? {32'h00000000, _read_mtvec_T_5} : 64'h0000000000000000);
	wire [63:0] _io_rw_rdata_T_163 = (((({_io_rw_rdata_T_157[63:16], _io_rw_rdata_T_157[15:0] | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_56 ? read_mip : 16'h0000)} | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_18 ? reg_mie : 64'h0000000000000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_52 ? reg_mscratch : 64'h0000000000000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_53 ? {{24 {_read_mapping_T_6[39]}}, _read_mapping_T_6} : 64'h0000000000000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_55 ? {{24 {reg_mtval[39]}}, reg_mtval} : 64'h0000000000000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_54 ? reg_mcause : 64'h0000000000000000);
	wire [63:0] _io_rw_rdata_T_167 = ({_io_rw_rdata_T_163[63:32], {_io_rw_rdata_T_163[31:1], _io_rw_rdata_T_163[0] | (&{decoded_addr_decoded_decoded_invInputs[0], decoded_addr_decoded_decoded_invInputs[1], io_rw_addr[2], decoded_addr_decoded_decoded_invInputs[3], io_rw_addr[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], io_rw_addr[10], io_rw_addr[11]} & io_hartid)} | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_79 ? {16'h4000, reg_dcsr_ebreakm, 1'h0, reg_dcsr_ebreaks, reg_dcsr_ebreaku, 3'h0, reg_dcsr_cause, reg_dcsr_v, 2'h0, reg_dcsr_step, reg_dcsr_prv} : 32'h00000000)} | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_80 ? {{24 {_debug_csrs_T_4[39]}}, _debug_csrs_T_4} : 64'h0000000000000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_81 ? reg_dscratch0 : 64'h0000000000000000);
	wire [4:0] _GEN_24 = _io_rw_rdata_T_167[4:0] | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T ? reg_fflags : 5'h00);
	wire [7:0] _GEN_25 = {_io_rw_rdata_T_167[7:5], _GEN_24[4:3], _GEN_24[2:0] | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_1 ? reg_frm : 3'h0)} | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_2 ? {reg_frm, reg_fflags} : 8'h00);
	wire [63:0] _io_rw_rdata_T_174 = (({_io_rw_rdata_T_167[63:8], _GEN_25[7:5], _GEN_25[4:0] | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_22 ? reg_mcountinhibit : 5'h00)} | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_85 ? value_1 : 64'h0000000000000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_86 ? value : 64'h0000000000000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_23 ? reg_hpmevent_0 : 64'h0000000000000000);
	wire [63:0] _io_rw_rdata_T_177 = {_io_rw_rdata_T_174[63:40], (_io_rw_rdata_T_174[39:0] | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_87 ? value_2 : 40'h0000000000)) | (&{io_rw_addr[0], io_rw_addr[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], decoded_addr_decoded_decoded_invInputs[8], decoded_addr_decoded_decoded_invInputs[9], io_rw_addr[10], io_rw_addr[11]} ? value_2 : 40'h0000000000)} | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_24 ? reg_hpmevent_1 : 64'h0000000000000000);
	wire [39:0] _GEN_26 = (_io_rw_rdata_T_177[39:0] | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_88 ? value_3 : 40'h0000000000)) | (&{decoded_addr_decoded_decoded_invInputs[0], decoded_addr_decoded_decoded_invInputs[1], io_rw_addr[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], decoded_addr_decoded_decoded_invInputs[8], decoded_addr_decoded_decoded_invInputs[9], io_rw_addr[10], io_rw_addr[11]} ? value_3 : 40'h0000000000);
	wire [63:0] _io_rw_rdata_T_273 = ((((((((((({_io_rw_rdata_T_177[63:40], _GEN_26[39:32], _GEN_26[31:0] | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_20 ? _GEN_3 : 32'h00000000)} | (&{decoded_addr_decoded_decoded_invInputs[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], decoded_addr_decoded_decoded_invInputs[8], decoded_addr_decoded_decoded_invInputs[9], io_rw_addr[10], io_rw_addr[11]} ? value_1 : 64'h0000000000000000)) | (&{decoded_addr_decoded_decoded_invInputs[0], io_rw_addr[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], decoded_addr_decoded_decoded_invInputs[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], decoded_addr_decoded_decoded_invInputs[8], decoded_addr_decoded_decoded_invInputs[9], io_rw_addr[10], io_rw_addr[11]} ? value : 64'h0000000000000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_21 ? {63'h0000000000000000, reg_menvcfg_fiom} : 64'h0000000000000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_3 ? {&reg_mstatus_fs, 43'h00000002000, reg_mstatus_mxr, reg_mstatus_sum, 3'h0, reg_mstatus_fs, 4'h0, reg_mstatus_spp, 2'h0, reg_mstatus_spie, 3'h0, reg_mstatus_sie, 1'h0} : 64'h0000000000000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_12 ? {48'h000000000000, read_mip & _GEN_0} : 64'h0000000000000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_4 ? {48'h000000000000, reg_mie[15:0] & _GEN_0} : 64'h0000000000000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_8 ? reg_sscratch : 64'h0000000000000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_10 ? reg_scause : 64'h0000000000000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_11 ? {{24 {reg_stval[39]}}, reg_stval} : 64'h0000000000000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_13 ? {reg_satp_mode, 16'h0000, reg_satp_ppn} : 64'h0000000000000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_9 ? {{24 {_GEN_17[39]}}, _GEN_17} : 64'h0000000000000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_5 ? {{25 {reg_stvec[38]}}, _read_stvec_T_5} : 64'h0000000000000000);
	wire [63:0] _io_rw_rdata_T_279 = ((({_io_rw_rdata_T_273[63:32], _io_rw_rdata_T_273[31:0] | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_6 ? _GEN_4 : 32'h00000000)} | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_17 ? _GEN_1 : 64'h0000000000000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_16 ? _GEN_2 : 64'h0000000000000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_7 ? {63'h0000000000000000, reg_senvcfg_fiom} : 64'h0000000000000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_57 ? {reg_pmp_7_cfg_l, 2'h0, reg_pmp_7_cfg_a, reg_pmp_7_cfg_x, reg_pmp_7_cfg_w, reg_pmp_7_cfg_r, reg_pmp_6_cfg_l, 2'h0, reg_pmp_6_cfg_a, reg_pmp_6_cfg_x, reg_pmp_6_cfg_w, reg_pmp_6_cfg_r, reg_pmp_5_cfg_l, 2'h0, reg_pmp_5_cfg_a, reg_pmp_5_cfg_x, reg_pmp_5_cfg_w, reg_pmp_5_cfg_r, reg_pmp_4_cfg_l, 2'h0, reg_pmp_4_cfg_a, reg_pmp_4_cfg_x, reg_pmp_4_cfg_w, reg_pmp_4_cfg_r, reg_pmp_3_cfg_l, 2'h0, reg_pmp_3_cfg_a, reg_pmp_3_cfg_x, reg_pmp_3_cfg_w, reg_pmp_3_cfg_r, reg_pmp_2_cfg_l, 2'h0, reg_pmp_2_cfg_a, reg_pmp_2_cfg_x, reg_pmp_2_cfg_w, reg_pmp_2_cfg_r, reg_pmp_1_cfg_l, 2'h0, reg_pmp_1_cfg_a, reg_pmp_1_cfg_x, reg_pmp_1_cfg_w, reg_pmp_1_cfg_r, reg_pmp_0_cfg_l, 2'h0, reg_pmp_0_cfg_a, reg_pmp_0_cfg_x, reg_pmp_0_cfg_w, reg_pmp_0_cfg_r} : 64'h0000000000000000);
	wire [29:0] _GEN_27 = (((((((_io_rw_rdata_T_279[29:0] | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_59 ? reg_pmp_0_addr : 30'h00000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_60 ? reg_pmp_1_addr : 30'h00000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_61 ? reg_pmp_2_addr : 30'h00000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_62 ? reg_pmp_3_addr : 30'h00000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_63 ? reg_pmp_4_addr : 30'h00000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_64 ? reg_pmp_5_addr : 30'h00000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_65 ? reg_pmp_6_addr : 30'h00000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_66 ? reg_pmp_7_addr : 30'h00000000);
	assign _io_rw_rdata_T_302 = (((&_decoded_addr_decoded_decoded_andMatrixOutputs_T_83 ? reg_custom_0 : 64'h0000000000000000) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_84 ? reg_custom_1 : 64'h0000000000000000)) | (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_82 ? reg_custom_2 : 64'h0000000000000000)) | {_io_rw_rdata_T_279[63:30], _GEN_27[29:2], _GEN_27[1] | &{decoded_addr_decoded_decoded_invInputs[0], io_rw_addr[1], decoded_addr_decoded_decoded_invInputs[2], decoded_addr_decoded_decoded_invInputs[3], io_rw_addr[4], decoded_addr_decoded_decoded_invInputs[5], decoded_addr_decoded_decoded_invInputs[6], decoded_addr_decoded_decoded_invInputs[7], io_rw_addr[8], io_rw_addr[9], io_rw_addr[10], io_rw_addr[11]}, _GEN_27[0]};
	wire _csr_wen_T_4 = ((io_rw_cmd == 3'h6) | &io_rw_cmd) | (io_rw_cmd == 3'h5);
	wire [5:0] _GEN_29 = _wdata_T_2[5:0] & _wdata_T_6[5:0];
	assign set_fs_dirty = (_csr_wen_T_4 ? (((&_decoded_addr_decoded_decoded_andMatrixOutputs_T_2 | &_decoded_addr_decoded_decoded_andMatrixOutputs_T_1) | &_decoded_addr_decoded_decoded_andMatrixOutputs_T) | io_fcsr_flags_valid) | io_set_fs_dirty : io_fcsr_flags_valid | io_set_fs_dirty);
	always @(posedge clock) begin : sv2v_autoblock_1
		reg [63:0] wdata;
		reg [39:0] epc;
		reg [39:0] tval;
		reg _GEN_30;
		reg _GEN_31;
		reg _GEN_32;
		reg _GEN_33;
		reg [8:0] _new_mip_WIRE;
		reg [39:0] _GEN_34;
		reg [31:0] _new_dcsr_WIRE;
		reg [39:0] _GEN_35;
		reg [4:0] _GEN_36;
		reg _GEN_37;
		reg [7:0] _newCfg_WIRE;
		reg _GEN_38;
		reg [29:0] _GEN_39;
		reg [7:0] _newCfg_WIRE_1;
		reg _GEN_40;
		reg [7:0] _newCfg_WIRE_2;
		reg _GEN_41;
		reg [7:0] _newCfg_WIRE_3;
		reg _GEN_42;
		reg [7:0] _newCfg_WIRE_4;
		reg _GEN_43;
		reg [7:0] _newCfg_WIRE_5;
		reg _GEN_44;
		reg [7:0] _newCfg_WIRE_6;
		reg _GEN_45;
		reg _GEN_46;
		reg [7:0] _newCfg_T_49;
		reg _GEN_47;
		_GEN_31 = (~exception | trapToDebug) | ~delegateVS;
		wdata = _wdata_T_2 & _wdata_T_6;
		epc = {io_pc[39:1], 1'h0};
		tval = (insn_break ? epc : io_tval);
		_GEN_30 = (exception & trapToDebug) & ~reg_debug;
		_GEN_32 = ((~exception | trapToDebug) | delegateVS) | ~delegate;
		_GEN_33 = (~exception | trapToDebug) | _GEN_21;
		_new_mip_WIRE = ((io_rw_cmd[1] ? {reg_mip_seip, 3'h0, reg_mip_stip, 3'h0, reg_mip_ssip} : 9'h000) | io_rw_wdata[9:1]) & ~(&io_rw_cmd[1:0] ? io_rw_wdata[9:1] : 9'h000);
		_GEN_34 = {wdata[39:1], 1'h0};
		_new_dcsr_WIRE = _wdata_T_2[31:0] & _wdata_T_6[31:0];
		_GEN_35 = _wdata_T_2[39:0] & _wdata_T_6[39:0];
		_GEN_36 = _wdata_T_2[4:0] & _wdata_T_6[4:0];
		_GEN_37 = (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_13)) & ((wdata[63:60] == 4'h0) | (wdata[63:60] == 4'h8));
		_newCfg_WIRE = _wdata_T_2[7:0] & _wdata_T_6[7:0];
		_GEN_38 = (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_57)) & ~reg_pmp_0_cfg_l;
		_GEN_39 = _wdata_T_2[29:0] & _wdata_T_6[29:0];
		_newCfg_WIRE_1 = _wdata_T_2[15:8] & _wdata_T_6[15:8];
		_GEN_40 = (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_57)) & ~reg_pmp_1_cfg_l;
		_newCfg_WIRE_2 = _wdata_T_2[23:16] & _wdata_T_6[23:16];
		_GEN_41 = (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_57)) & ~reg_pmp_2_cfg_l;
		_newCfg_WIRE_3 = _wdata_T_2[31:24] & _wdata_T_6[31:24];
		_GEN_42 = (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_57)) & ~reg_pmp_3_cfg_l;
		_newCfg_WIRE_4 = _wdata_T_2[39:32] & _wdata_T_6[39:32];
		_GEN_43 = (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_57)) & ~reg_pmp_4_cfg_l;
		_newCfg_WIRE_5 = _wdata_T_2[47:40] & _wdata_T_6[47:40];
		_GEN_44 = (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_57)) & ~reg_pmp_5_cfg_l;
		_newCfg_WIRE_6 = _wdata_T_2[55:48] & _wdata_T_6[55:48];
		_GEN_45 = (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_57)) & ~reg_pmp_6_cfg_l;
		_GEN_46 = (reg_pmp_7_cfg_l & ~reg_pmp_7_cfg_a[1]) & reg_pmp_7_cfg_a[0];
		_newCfg_T_49 = _wdata_T_2[63:56] & _wdata_T_6[63:56];
		_GEN_47 = (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_57)) & ~reg_pmp_7_cfg_l;
		if (reset) begin
			reg_mstatus_prv <= 2'h3;
			reg_mstatus_v <= 1'h0;
			reg_mstatus_mpv <= 1'h0;
			reg_mstatus_gva <= 1'h0;
			reg_mstatus_tsr <= 1'h0;
			reg_mstatus_tw <= 1'h0;
			reg_mstatus_tvm <= 1'h0;
			reg_mstatus_mxr <= 1'h0;
			reg_mstatus_sum <= 1'h0;
			reg_mstatus_mprv <= 1'h0;
			reg_mstatus_fs <= 2'h0;
			reg_mstatus_mpp <= 2'h3;
			reg_mstatus_spp <= 1'h0;
			reg_mstatus_mpie <= 1'h0;
			reg_mstatus_spie <= 1'h0;
			reg_mstatus_mie <= 1'h0;
			reg_mstatus_sie <= 1'h0;
			reg_dcsr_ebreakm <= 1'h0;
			reg_dcsr_ebreaks <= 1'h0;
			reg_dcsr_ebreaku <= 1'h0;
			reg_dcsr_cause <= 3'h0;
			reg_dcsr_v <= 1'h0;
			reg_dcsr_step <= 1'h0;
			reg_dcsr_prv <= 2'h3;
			reg_debug <= 1'h0;
			reg_pmp_0_cfg_l <= 1'h0;
			reg_pmp_0_cfg_a <= 2'h0;
			reg_pmp_1_cfg_l <= 1'h0;
			reg_pmp_1_cfg_a <= 2'h0;
			reg_pmp_2_cfg_l <= 1'h0;
			reg_pmp_2_cfg_a <= 2'h0;
			reg_pmp_3_cfg_l <= 1'h0;
			reg_pmp_3_cfg_a <= 2'h0;
			reg_pmp_4_cfg_l <= 1'h0;
			reg_pmp_4_cfg_a <= 2'h0;
			reg_pmp_5_cfg_l <= 1'h0;
			reg_pmp_5_cfg_a <= 2'h0;
			reg_pmp_6_cfg_l <= 1'h0;
			reg_pmp_6_cfg_a <= 2'h0;
			reg_pmp_7_cfg_l <= 1'h0;
			reg_pmp_7_cfg_a <= 2'h0;
			reg_mcause <= 64'h0000000000000000;
			reg_mtvec <= 32'h00000000;
			reg_menvcfg_fiom <= 1'h0;
			reg_senvcfg_fiom <= 1'h0;
			reg_satp_mode <= 4'h0;
			reg_mcountinhibit <= 5'h00;
			small_0 <= 6'h00;
			large_0 <= 58'h000000000000000;
			reg_hpmevent_0 <= 64'h0000000000000000;
			reg_hpmevent_1 <= 64'h0000000000000000;
			reg_custom_0 <= 64'h0000000000000001;
			reg_custom_1 <= 64'h0000000000000001;
			reg_custom_2 <= 64'h0000000000000000;
			io_status_cease_r <= 1'h0;
		end
		else begin : sv2v_autoblock_2
			reg _GEN_48;
			reg _GEN_49;
			reg _GEN_50;
			reg _GEN_51;
			reg _GEN_52;
			reg _GEN_53;
			reg [63:0] _GEN_54;
			_GEN_48 = _GEN_32 & reg_mstatus_sie;
			_GEN_49 = (insn_ret & ~io_rw_addr[9]) & ~reg_mstatus_v;
			_GEN_50 = _GEN_49 | (_GEN_32 ? reg_mstatus_spie : reg_mstatus_sie);
			_GEN_51 = ~_GEN_49 & (_GEN_32 ? reg_mstatus_spp : reg_mstatus_prv[0]);
			_GEN_52 = ~io_rw_addr[9] | _GEN_23;
			_GEN_53 = ~insn_ret | _GEN_52;
			_GEN_54 = {50'h0000000000000, (_wdata_T_2[13:0] & _wdata_T_6[13:0]) & 14'h3f03};
			if ((insn_ret ? ret_prv : (exception ? (trapToDebug ? (reg_debug ? reg_mstatus_prv : 2'h3) : _GEN_22) : reg_mstatus_prv)) == 2'h2)
				reg_mstatus_prv <= 2'h0;
			else if (insn_ret)
				reg_mstatus_prv <= ret_prv;
			else if (exception) begin
				if (trapToDebug) begin
					if (reg_debug)
						;
					else
						reg_mstatus_prv <= 2'h3;
				end
				else
					reg_mstatus_prv <= _GEN_22;
			end
			reg_mstatus_v <= ~insn_ret & (exception ? (trapToDebug ? reg_debug & reg_mstatus_v : delegateVS) : reg_mstatus_v);
			reg_mstatus_mpv <= _GEN_53 & (_GEN_33 ? reg_mstatus_mpv : reg_mstatus_v);
			reg_mstatus_gva <= _GEN_33 & reg_mstatus_gva;
			if (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_14)) begin
				reg_mstatus_tsr <= wdata[22];
				reg_mstatus_tw <= wdata[21];
				reg_mstatus_tvm <= wdata[20];
				reg_mstatus_mprv <= wdata[17];
				if (wdata[12:11] == 2'h2)
					reg_mstatus_mpp <= 2'h0;
				else
					reg_mstatus_mpp <= wdata[12:11];
				reg_mstatus_mpie <= wdata[7];
				reg_mstatus_mie <= wdata[3];
			end
			else begin
				reg_mstatus_mprv <= ~(insn_ret & ~ret_prv[1]) & reg_mstatus_mprv;
				if (_GEN_53) begin
					if (_GEN_33)
						;
					else
						reg_mstatus_mpp <= reg_mstatus_prv;
				end
				else
					reg_mstatus_mpp <= 2'h0;
				reg_mstatus_mpie <= (insn_ret & ~_GEN_52) | (_GEN_33 ? reg_mstatus_mpie : reg_mstatus_mie);
				if (_GEN_53)
					reg_mstatus_mie <= _GEN_33 & reg_mstatus_mie;
				else
					reg_mstatus_mie <= reg_mstatus_mpie;
			end
			if (_csr_wen_T_4) begin
				if (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_3) begin
					reg_mstatus_mxr <= wdata[19];
					reg_mstatus_sum <= wdata[18];
					reg_mstatus_fs <= wdata[14:13];
					reg_mstatus_spp <= wdata[8];
					reg_mstatus_spie <= wdata[5];
					reg_mstatus_sie <= wdata[1];
				end
				else if (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_14) begin
					reg_mstatus_mxr <= wdata[19];
					reg_mstatus_sum <= wdata[18];
					reg_mstatus_fs <= wdata[14:13];
					reg_mstatus_spp <= wdata[8];
					reg_mstatus_spie <= wdata[5];
					reg_mstatus_sie <= wdata[1];
				end
				else begin
					if (set_fs_dirty)
						reg_mstatus_fs <= 2'h3;
					reg_mstatus_spp <= _GEN_51;
					reg_mstatus_spie <= _GEN_50;
					if (_GEN_49)
						reg_mstatus_sie <= reg_mstatus_spie;
					else
						reg_mstatus_sie <= _GEN_48;
				end
			end
			else begin
				if (set_fs_dirty)
					reg_mstatus_fs <= 2'h3;
				reg_mstatus_spp <= _GEN_51;
				reg_mstatus_spie <= _GEN_50;
				if (_GEN_49)
					reg_mstatus_sie <= reg_mstatus_spie;
				else
					reg_mstatus_sie <= _GEN_48;
			end
			if (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_79)) begin
				reg_dcsr_ebreakm <= _new_dcsr_WIRE[15];
				reg_dcsr_ebreaks <= _new_dcsr_WIRE[13];
				reg_dcsr_ebreaku <= _new_dcsr_WIRE[12];
				reg_dcsr_step <= _new_dcsr_WIRE[2];
				if (_new_dcsr_WIRE[1:0] == 2'h2)
					reg_dcsr_prv <= 2'h0;
				else
					reg_dcsr_prv <= _new_dcsr_WIRE[1:0];
			end
			else if (_GEN_30)
				reg_dcsr_prv <= reg_mstatus_prv;
			if (_GEN_30) begin
				reg_dcsr_cause <= (reg_singleStepped ? 3'h4 : {1'h0, (causeIsDebugInt ? 2'h3 : (causeIsDebugTrigger ? 2'h2 : 2'h1))});
				reg_dcsr_v <= reg_mstatus_v;
			end
			reg_debug <= ((~insn_ret | ~io_rw_addr[9]) | ~_GEN_23) & (_GEN_30 | reg_debug);
			if (_GEN_38) begin
				reg_pmp_0_cfg_l <= _newCfg_WIRE[7];
				reg_pmp_0_cfg_a <= _newCfg_WIRE[4:3];
			end
			if (_GEN_40) begin
				reg_pmp_1_cfg_l <= _newCfg_WIRE_1[7];
				reg_pmp_1_cfg_a <= _newCfg_WIRE_1[4:3];
			end
			if (_GEN_41) begin
				reg_pmp_2_cfg_l <= _newCfg_WIRE_2[7];
				reg_pmp_2_cfg_a <= _newCfg_WIRE_2[4:3];
			end
			if (_GEN_42) begin
				reg_pmp_3_cfg_l <= _newCfg_WIRE_3[7];
				reg_pmp_3_cfg_a <= _newCfg_WIRE_3[4:3];
			end
			if (_GEN_43) begin
				reg_pmp_4_cfg_l <= _newCfg_WIRE_4[7];
				reg_pmp_4_cfg_a <= _newCfg_WIRE_4[4:3];
			end
			if (_GEN_44) begin
				reg_pmp_5_cfg_l <= _newCfg_WIRE_5[7];
				reg_pmp_5_cfg_a <= _newCfg_WIRE_5[4:3];
			end
			if (_GEN_45) begin
				reg_pmp_6_cfg_l <= _newCfg_WIRE_6[7];
				reg_pmp_6_cfg_a <= _newCfg_WIRE_6[4:3];
			end
			if (_GEN_47) begin
				reg_pmp_7_cfg_l <= _newCfg_T_49[7];
				reg_pmp_7_cfg_a <= _newCfg_T_49[4:3];
			end
			if (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_54))
				reg_mcause <= wdata & 64'h800000000000000f;
			else if (_GEN_33)
				;
			else
				reg_mcause <= cause;
			if (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_19))
				reg_mtvec <= _new_dcsr_WIRE;
			if (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_21))
				reg_menvcfg_fiom <= wdata[0];
			if (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_7))
				reg_senvcfg_fiom <= wdata[0];
			if (_GEN_37)
				reg_satp_mode <= {wdata[63], 3'h0};
			if (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_22))
				reg_mcountinhibit <= _GEN_36 & 5'h1d;
			if (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_86)) begin
				small_0 <= _GEN_29;
				large_0 <= _wdata_T_2[63:6] & _wdata_T_6[63:6];
			end
			else begin : sv2v_autoblock_3
				reg [6:0] nextSmall;
				nextSmall = {1'h0, small_0} + {6'h00, io_retire};
				if (reg_mcountinhibit[2])
					;
				else
					small_0 <= nextSmall[5:0];
				if (nextSmall[6] & ~reg_mcountinhibit[2])
					large_0 <= large_0 + 58'h000000000000001;
			end
			if (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_23))
				reg_hpmevent_0 <= _GEN_54;
			if (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_24))
				reg_hpmevent_1 <= _GEN_54;
			if (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_83))
				reg_custom_0 <= (wdata & 64'h0000000000000001) | (reg_custom_0 & 64'hfffffffffffffffe);
			if (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_84))
				reg_custom_1 <= (wdata & 64'h0000000000000001) | (reg_custom_1 & 64'hfffffffffffffffe);
			if (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_82))
				reg_custom_2 <= (wdata & 64'h0000000000000008) | (reg_custom_2 & 64'hfffffffffffffff7);
			io_status_cease_r <= (system_insn & (&{io_rw_addr[2], _GEN_18[3], _GEN_18[4], _GEN_18[5], _GEN_18[6], _GEN_18[7], io_rw_addr[8], io_rw_addr[9], _GEN_18[10], _GEN_18[11]})) | io_status_cease_r;
		end
		if (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_80))
			reg_dpc <= _GEN_34;
		else if (_GEN_30)
			reg_dpc <= epc;
		if (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_81))
			reg_dscratch0 <= wdata;
		reg_singleStepped <= io_singleStep_0 & ((io_retire | exception) | reg_singleStepped);
		if (_GEN_38) begin
			reg_pmp_0_cfg_x <= _newCfg_WIRE[2];
			reg_pmp_0_cfg_w <= _newCfg_WIRE[1] & _newCfg_WIRE[0];
			reg_pmp_0_cfg_r <= _newCfg_WIRE[0];
		end
		if ((_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_59)) & ~(reg_pmp_0_cfg_l | ((reg_pmp_1_cfg_l & ~reg_pmp_1_cfg_a[1]) & reg_pmp_1_cfg_a[0])))
			reg_pmp_0_addr <= _GEN_39;
		if (_GEN_40) begin
			reg_pmp_1_cfg_x <= _newCfg_WIRE_1[2];
			reg_pmp_1_cfg_w <= _newCfg_WIRE_1[1] & _newCfg_WIRE_1[0];
			reg_pmp_1_cfg_r <= _newCfg_WIRE_1[0];
		end
		if ((_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_60)) & ~(reg_pmp_1_cfg_l | ((reg_pmp_2_cfg_l & ~reg_pmp_2_cfg_a[1]) & reg_pmp_2_cfg_a[0])))
			reg_pmp_1_addr <= _GEN_39;
		if (_GEN_41) begin
			reg_pmp_2_cfg_x <= _newCfg_WIRE_2[2];
			reg_pmp_2_cfg_w <= _newCfg_WIRE_2[1] & _newCfg_WIRE_2[0];
			reg_pmp_2_cfg_r <= _newCfg_WIRE_2[0];
		end
		if ((_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_61)) & ~(reg_pmp_2_cfg_l | ((reg_pmp_3_cfg_l & ~reg_pmp_3_cfg_a[1]) & reg_pmp_3_cfg_a[0])))
			reg_pmp_2_addr <= _GEN_39;
		if (_GEN_42) begin
			reg_pmp_3_cfg_x <= _newCfg_WIRE_3[2];
			reg_pmp_3_cfg_w <= _newCfg_WIRE_3[1] & _newCfg_WIRE_3[0];
			reg_pmp_3_cfg_r <= _newCfg_WIRE_3[0];
		end
		if ((_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_62)) & ~(reg_pmp_3_cfg_l | ((reg_pmp_4_cfg_l & ~reg_pmp_4_cfg_a[1]) & reg_pmp_4_cfg_a[0])))
			reg_pmp_3_addr <= _GEN_39;
		if (_GEN_43) begin
			reg_pmp_4_cfg_x <= _newCfg_WIRE_4[2];
			reg_pmp_4_cfg_w <= _newCfg_WIRE_4[1] & _newCfg_WIRE_4[0];
			reg_pmp_4_cfg_r <= _newCfg_WIRE_4[0];
		end
		if ((_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_63)) & ~(reg_pmp_4_cfg_l | ((reg_pmp_5_cfg_l & ~reg_pmp_5_cfg_a[1]) & reg_pmp_5_cfg_a[0])))
			reg_pmp_4_addr <= _GEN_39;
		if (_GEN_44) begin
			reg_pmp_5_cfg_x <= _newCfg_WIRE_5[2];
			reg_pmp_5_cfg_w <= _newCfg_WIRE_5[1] & _newCfg_WIRE_5[0];
			reg_pmp_5_cfg_r <= _newCfg_WIRE_5[0];
		end
		if ((_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_64)) & ~(reg_pmp_5_cfg_l | ((reg_pmp_6_cfg_l & ~reg_pmp_6_cfg_a[1]) & reg_pmp_6_cfg_a[0])))
			reg_pmp_5_addr <= _GEN_39;
		if (_GEN_45) begin
			reg_pmp_6_cfg_x <= _newCfg_WIRE_6[2];
			reg_pmp_6_cfg_w <= _newCfg_WIRE_6[1] & _newCfg_WIRE_6[0];
			reg_pmp_6_cfg_r <= _newCfg_WIRE_6[0];
		end
		if ((_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_65)) & ~(reg_pmp_6_cfg_l | _GEN_46))
			reg_pmp_6_addr <= _GEN_39;
		if (_GEN_47) begin
			reg_pmp_7_cfg_x <= _newCfg_T_49[2];
			reg_pmp_7_cfg_w <= _newCfg_T_49[1] & _newCfg_T_49[0];
			reg_pmp_7_cfg_r <= _newCfg_T_49[0];
		end
		if ((_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_66)) & ~(reg_pmp_7_cfg_l | _GEN_46))
			reg_pmp_7_addr <= _GEN_39;
		if (_csr_wen_T_4) begin : sv2v_autoblock_4
			reg [15:0] _GEN_55;
			_GEN_55 = _wdata_T_2[15:0] & _wdata_T_6[15:0];
			if (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_4)
				reg_mie <= {reg_mie[63:16], (reg_mie[15:0] & {6'h3f, ~_GEN, 1'h1}) | (_GEN_55 & _GEN_0)};
			else if (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_18)
				reg_mie <= {48'h000000000000, _GEN_55 & 16'h0aaa};
			if (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_12)
				reg_mip_ssip <= (~reg_mideleg[1] & reg_mip_ssip) | (_GEN_55[1] & reg_mideleg[1]);
			else if (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_56)
				reg_mip_ssip <= _new_mip_WIRE[0];
			if (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_2)
				reg_frm <= _wdata_T_2[7:5] & _wdata_T_6[7:5];
			else if (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_1)
				reg_frm <= _wdata_T_2[2:0] & _wdata_T_6[2:0];
		end
		if (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_17))
			reg_mideleg <= wdata;
		if (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_16))
			reg_medeleg <= wdata;
		if (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_56)) begin
			reg_mip_seip <= _new_mip_WIRE[8];
			reg_mip_stip <= _new_mip_WIRE[4];
		end
		if (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_53))
			reg_mepc <= _GEN_34;
		else if (_GEN_33)
			;
		else
			reg_mepc <= epc;
		if (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_55))
			reg_mtval <= _GEN_35;
		else if (_GEN_33)
			;
		else
			reg_mtval <= tval;
		if (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_52))
			reg_mscratch <= wdata;
		if (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_20))
			reg_mcounteren <= _new_dcsr_WIRE;
		if (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_6))
			reg_scounteren <= _new_dcsr_WIRE;
		reg_vsstatus_spp <= (~(insn_ret & ~io_rw_addr[9]) | ~reg_mstatus_v) & (_GEN_31 ? reg_vsstatus_spp : reg_mstatus_prv[0]);
		if (_GEN_31)
			;
		else
			reg_vsepc <= epc;
		if (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_9))
			reg_sepc <= _GEN_34;
		else if (_GEN_32)
			;
		else
			reg_sepc <= epc;
		if (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_10))
			reg_scause <= wdata & 64'h800000000000001f;
		else if (_GEN_32)
			;
		else
			reg_scause <= cause;
		if (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_11))
			reg_stval <= _GEN_35;
		else if (_GEN_32)
			;
		else
			reg_stval <= tval;
		if (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_8))
			reg_sscratch <= wdata;
		if (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_5))
			reg_stvec <= _wdata_T_2[38:0] & _wdata_T_6[38:0];
		if (_GEN_37)
			reg_satp_ppn <= {24'h000000, wdata[19:0]};
		if (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_2 | &_decoded_addr_decoded_decoded_andMatrixOutputs_T))
			reg_fflags <= _GEN_36;
		else
			reg_fflags <= ({5 {io_fcsr_flags_valid}} & io_fcsr_flags_bits) | reg_fflags;
		if (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_87)) begin
			small_2 <= _GEN_29;
			large_2 <= _wdata_T_2[39:6] & _wdata_T_6[39:6];
		end
		else begin : sv2v_autoblock_5
			reg [6:0] nextSmall_2;
			nextSmall_2 = {1'h0, small_2} + {6'h00, io_counters_0_inc};
			if (reg_mcountinhibit[3])
				;
			else
				small_2 <= nextSmall_2[5:0];
			if (nextSmall_2[6] & ~reg_mcountinhibit[3])
				large_2 <= large_2 + 34'h000000001;
		end
		if (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_88)) begin
			small_3 <= _GEN_29;
			large_3 <= _wdata_T_2[39:6] & _wdata_T_6[39:6];
		end
		else begin : sv2v_autoblock_6
			reg [6:0] nextSmall_3;
			nextSmall_3 = {1'h0, small_3} + {6'h00, io_counters_1_inc};
			if (reg_mcountinhibit[4])
				;
			else
				small_3 <= nextSmall_3[5:0];
			if (nextSmall_3[6] & ~reg_mcountinhibit[4])
				large_3 <= large_3 + 34'h000000001;
		end
	end
	always @(posedge io_ungated_clock)
		if (reset) begin
			reg_wfi <= 1'h0;
			small_1 <= 6'h00;
			large_1 <= 58'h000000000000000;
		end
		else begin
			reg_wfi <= ~((|{_GEN_5[11], _GEN_5[9], _GEN_5[7], _GEN_5[5], _GEN_5[3], _GEN_5[1]} | io_interrupts_debug) | exception) & ((((system_insn & (&{io_rw_addr[2], _GEN_18[3], _GEN_18[4], _GEN_18[5], _GEN_18[6], _GEN_18[7], io_rw_addr[8], _GEN_18[9], _GEN_18[10], _GEN_18[11]})) & ~io_singleStep_0) & ~reg_debug) | reg_wfi);
			if (_csr_wen_T_4 & (&_decoded_addr_decoded_decoded_andMatrixOutputs_T_85)) begin
				small_1 <= _GEN_29;
				large_1 <= _wdata_T_2[63:6] & _wdata_T_6[63:6];
			end
			else begin : sv2v_autoblock_7
				reg [6:0] nextSmall_1;
				nextSmall_1 = {1'h0, small_1} + {6'h00, ~io_csr_stall_0};
				if (reg_mcountinhibit[0])
					;
				else
					small_1 <= nextSmall_1[5:0];
				if (nextSmall_1[6] & ~reg_mcountinhibit[0])
					large_1 <= large_1 + 58'h000000000000001;
			end
		end
	assign io_rw_rdata = _io_rw_rdata_T_302;
	assign io_decode_0_fp_illegal = io_decode_0_fp_illegal_0;
	assign io_decode_0_read_illegal = ((((_io_decode_0_system_illegal_T | ~csr_exists) | ((_io_decode_0_virtual_access_illegal_T_24 | (io_decode_0_inst[31:20] == 12'h680)) & ~allow_sfence_vma)) | ((((io_decode_0_inst[31:20] > 12'hbff) & (io_decode_0_inst[31:20] < 12'hc20)) | ((io_decode_0_inst[31:20] > 12'hc7f) & (io_decode_0_inst[31:20] < 12'hca0))) & ~((reg_mstatus_prv[1] | _io_decode_0_virtual_access_illegal_T_3[0]) & (|reg_mstatus_prv | _io_decode_0_virtual_access_illegal_T_11[0])))) | (&{io_decode_0_inst[24], io_decode_0_inst[25], io_decode_0_read_illegal_invInputs[0], io_decode_0_inst[27], io_decode_0_inst[28], io_decode_0_inst[29], io_decode_0_inst[30], io_decode_0_read_illegal_invInputs[5]} & ~reg_debug)) | (&{io_decode_0_fp_csr_invInputs[0], io_decode_0_fp_csr_invInputs[1], io_decode_0_fp_csr_invInputs[2], io_decode_0_fp_csr_invInputs[3]} & io_decode_0_fp_illegal_0);
	assign io_decode_0_write_illegal = &io_decode_0_inst[31:30];
	assign io_decode_0_write_flush = ~((io_decode_0_write_flush_addr_m > 12'h33f) & (io_decode_0_write_flush_addr_m < 12'h344));
	assign io_decode_0_system_illegal = (((_io_decode_0_system_illegal_T | (&{io_decode_0_inst[22], decoded_invInputs_1[21], decoded_invInputs_1[22], decoded_invInputs_1[23], decoded_invInputs_1[24], decoded_invInputs_1[25], io_decode_0_inst[28], decoded_invInputs_1[27], decoded_invInputs_1[28], decoded_invInputs_1[29]} & ~(reg_mstatus_prv[1] | ~reg_mstatus_tw))) | (|_decoded_orMatrixOutputs_T_10 & ~(reg_mstatus_prv[1] | ~(~reg_mstatus_v & reg_mstatus_tsr)))) | (((|_decoded_orMatrixOutputs_T_10 & io_decode_0_inst[30]) & io_decode_0_inst[27]) & ~reg_debug)) | (&{io_decode_0_inst[0], io_decode_0_inst[1], decoded_invInputs_1[0], decoded_invInputs_1[1], io_decode_0_inst[4], io_decode_0_inst[5], io_decode_0_inst[6], decoded_invInputs_1[5], decoded_invInputs_1[6], decoded_invInputs_1[7], io_decode_0_inst[25], decoded_invInputs_1[24], decoded_invInputs_1[25], io_decode_0_inst[28], decoded_invInputs_1[27], decoded_invInputs_1[28], decoded_invInputs_1[29]} & ~allow_sfence_vma);
	assign io_csr_stall = io_csr_stall_0;
	assign io_singleStep = io_singleStep_0;
	assign io_status_debug = reg_debug;
	assign io_status_dprv = (reg_mstatus_mprv & ~reg_debug ? reg_mstatus_mpp : reg_mstatus_prv);
	assign io_status_prv = reg_mstatus_prv;
	assign io_status_mxr = reg_mstatus_mxr;
	assign io_status_sum = reg_mstatus_sum;
	assign io_ptbr_mode = reg_satp_mode;
	assign io_ptbr_ppn = reg_satp_ppn;
	assign io_evec = (insn_ret ? (io_rw_addr[9] ? (_GEN_23 ? ~{_io_evec_T_10[39:2], _GEN_15} : ~{_io_evec_T_20[39:2], _GEN_14}) : (reg_mstatus_v ? ~{_io_evec_T_5[39:2], _io_evec_T_5[1:0] | 2'h1} : ~{_io_evec_T[39:2], _GEN_16})) : (trapToDebug ? {28'h0000000, (reg_debug ? {8'h80, ~insn_break, 3'h0} : 12'h800)} : {((notDebugTVec_base[0] & cause[63]) & (cause[7:6] == 2'h0) ? {notDebugTVec_base[39:8], cause[5:0]} : notDebugTVec_base[39:2]), 2'h0}));
	assign io_fcsr_rm = reg_frm;
	assign io_interrupt = ((((((((((((((((((((((((((((((((((io_interrupts_debug | m_interrupts[15]) | m_interrupts[14]) | m_interrupts[13]) | m_interrupts[12]) | m_interrupts[11]) | m_interrupts[3]) | m_interrupts[7]) | m_interrupts[9]) | m_interrupts[1]) | m_interrupts[5]) | m_interrupts[10]) | m_interrupts[2]) | m_interrupts[6]) | m_interrupts[8]) | m_interrupts[0]) | m_interrupts[4]) | s_interrupts[15]) | s_interrupts[14]) | s_interrupts[13]) | s_interrupts[12]) | s_interrupts[11]) | s_interrupts[3]) | s_interrupts[7]) | s_interrupts[9]) | s_interrupts[1]) | s_interrupts[5]) | s_interrupts[10]) | s_interrupts[2]) | s_interrupts[6]) | s_interrupts[8]) | s_interrupts[0]) | s_interrupts[4]) & ~io_singleStep_0) | reg_singleStepped) & ~(reg_debug | io_status_cease_r);
	assign io_interrupt_cause = {60'h000000000000000, (io_interrupts_debug ? 4'he : (m_interrupts[15] ? 4'hf : (m_interrupts[14] ? 4'he : (m_interrupts[13] ? 4'hd : (m_interrupts[12] ? 4'hc : (m_interrupts[11] ? 4'hb : (m_interrupts[3] ? 4'h3 : (m_interrupts[7] ? 4'h7 : (m_interrupts[9] ? 4'h9 : (m_interrupts[1] ? 4'h1 : (m_interrupts[5] ? 4'h5 : (m_interrupts[10] ? 4'ha : (m_interrupts[2] ? 4'h2 : (m_interrupts[6] ? 4'h6 : (m_interrupts[8] ? 4'h8 : (m_interrupts[0] ? 4'h0 : (m_interrupts[4] ? 4'h4 : (s_interrupts[15] ? 4'hf : (s_interrupts[14] ? 4'he : (s_interrupts[13] ? 4'hd : (s_interrupts[12] ? 4'hc : (s_interrupts[11] ? 4'hb : (s_interrupts[3] ? 4'h3 : (s_interrupts[7] ? 4'h7 : (s_interrupts[9] ? 4'h9 : (s_interrupts[1] ? 4'h1 : (s_interrupts[5] ? 4'h5 : (s_interrupts[10] ? 4'ha : (s_interrupts[2] ? 4'h2 : (s_interrupts[6] ? 4'h6 : (s_interrupts[8] ? 4'h8 : {1'h0, ~s_interrupts[0], 2'h0})))))))))))))))))))))))))))))))} - 64'h8000000000000000;
	assign io_pmp_0_cfg_l = reg_pmp_0_cfg_l;
	assign io_pmp_0_cfg_a = reg_pmp_0_cfg_a;
	assign io_pmp_0_cfg_x = reg_pmp_0_cfg_x;
	assign io_pmp_0_cfg_w = reg_pmp_0_cfg_w;
	assign io_pmp_0_cfg_r = reg_pmp_0_cfg_r;
	assign io_pmp_0_addr = reg_pmp_0_addr;
	assign io_pmp_0_mask = {_GEN_6 & ~(_GEN_6 + 30'h00000001), 2'h3};
	assign io_pmp_1_cfg_l = reg_pmp_1_cfg_l;
	assign io_pmp_1_cfg_a = reg_pmp_1_cfg_a;
	assign io_pmp_1_cfg_x = reg_pmp_1_cfg_x;
	assign io_pmp_1_cfg_w = reg_pmp_1_cfg_w;
	assign io_pmp_1_cfg_r = reg_pmp_1_cfg_r;
	assign io_pmp_1_addr = reg_pmp_1_addr;
	assign io_pmp_1_mask = {_GEN_7 & ~(_GEN_7 + 30'h00000001), 2'h3};
	assign io_pmp_2_cfg_l = reg_pmp_2_cfg_l;
	assign io_pmp_2_cfg_a = reg_pmp_2_cfg_a;
	assign io_pmp_2_cfg_x = reg_pmp_2_cfg_x;
	assign io_pmp_2_cfg_w = reg_pmp_2_cfg_w;
	assign io_pmp_2_cfg_r = reg_pmp_2_cfg_r;
	assign io_pmp_2_addr = reg_pmp_2_addr;
	assign io_pmp_2_mask = {_GEN_8 & ~(_GEN_8 + 30'h00000001), 2'h3};
	assign io_pmp_3_cfg_l = reg_pmp_3_cfg_l;
	assign io_pmp_3_cfg_a = reg_pmp_3_cfg_a;
	assign io_pmp_3_cfg_x = reg_pmp_3_cfg_x;
	assign io_pmp_3_cfg_w = reg_pmp_3_cfg_w;
	assign io_pmp_3_cfg_r = reg_pmp_3_cfg_r;
	assign io_pmp_3_addr = reg_pmp_3_addr;
	assign io_pmp_3_mask = {_GEN_9 & ~(_GEN_9 + 30'h00000001), 2'h3};
	assign io_pmp_4_cfg_l = reg_pmp_4_cfg_l;
	assign io_pmp_4_cfg_a = reg_pmp_4_cfg_a;
	assign io_pmp_4_cfg_x = reg_pmp_4_cfg_x;
	assign io_pmp_4_cfg_w = reg_pmp_4_cfg_w;
	assign io_pmp_4_cfg_r = reg_pmp_4_cfg_r;
	assign io_pmp_4_addr = reg_pmp_4_addr;
	assign io_pmp_4_mask = {_GEN_10 & ~(_GEN_10 + 30'h00000001), 2'h3};
	assign io_pmp_5_cfg_l = reg_pmp_5_cfg_l;
	assign io_pmp_5_cfg_a = reg_pmp_5_cfg_a;
	assign io_pmp_5_cfg_x = reg_pmp_5_cfg_x;
	assign io_pmp_5_cfg_w = reg_pmp_5_cfg_w;
	assign io_pmp_5_cfg_r = reg_pmp_5_cfg_r;
	assign io_pmp_5_addr = reg_pmp_5_addr;
	assign io_pmp_5_mask = {_GEN_11 & ~(_GEN_11 + 30'h00000001), 2'h3};
	assign io_pmp_6_cfg_l = reg_pmp_6_cfg_l;
	assign io_pmp_6_cfg_a = reg_pmp_6_cfg_a;
	assign io_pmp_6_cfg_x = reg_pmp_6_cfg_x;
	assign io_pmp_6_cfg_w = reg_pmp_6_cfg_w;
	assign io_pmp_6_cfg_r = reg_pmp_6_cfg_r;
	assign io_pmp_6_addr = reg_pmp_6_addr;
	assign io_pmp_6_mask = {_GEN_12 & ~(_GEN_12 + 30'h00000001), 2'h3};
	assign io_pmp_7_cfg_l = reg_pmp_7_cfg_l;
	assign io_pmp_7_cfg_a = reg_pmp_7_cfg_a;
	assign io_pmp_7_cfg_x = reg_pmp_7_cfg_x;
	assign io_pmp_7_cfg_w = reg_pmp_7_cfg_w;
	assign io_pmp_7_cfg_r = reg_pmp_7_cfg_r;
	assign io_pmp_7_addr = reg_pmp_7_addr;
	assign io_pmp_7_mask = {_GEN_13 & ~(_GEN_13 + 30'h00000001), 2'h3};
	assign io_counters_0_eventSel = reg_hpmevent_0;
	assign io_counters_1_eventSel = reg_hpmevent_1;
	assign io_customCSRs_0_value = reg_custom_0;
	assign io_customCSRs_1_value = reg_custom_1;
	assign io_customCSRs_2_value = reg_custom_2;
endmodule
