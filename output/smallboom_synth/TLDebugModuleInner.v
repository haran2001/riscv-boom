module TLDebugModuleInner (
	clock,
	reset,
	auto_tl_in_a_ready,
	auto_tl_in_a_valid,
	auto_tl_in_a_bits_opcode,
	auto_tl_in_a_bits_param,
	auto_tl_in_a_bits_size,
	auto_tl_in_a_bits_source,
	auto_tl_in_a_bits_address,
	auto_tl_in_a_bits_mask,
	auto_tl_in_a_bits_data,
	auto_tl_in_a_bits_corrupt,
	auto_tl_in_d_ready,
	auto_tl_in_d_valid,
	auto_tl_in_d_bits_opcode,
	auto_tl_in_d_bits_size,
	auto_tl_in_d_bits_source,
	auto_tl_in_d_bits_data,
	auto_dmi_in_a_ready,
	auto_dmi_in_a_valid,
	auto_dmi_in_a_bits_opcode,
	auto_dmi_in_a_bits_param,
	auto_dmi_in_a_bits_size,
	auto_dmi_in_a_bits_source,
	auto_dmi_in_a_bits_address,
	auto_dmi_in_a_bits_mask,
	auto_dmi_in_a_bits_data,
	auto_dmi_in_a_bits_corrupt,
	auto_dmi_in_d_ready,
	auto_dmi_in_d_valid,
	auto_dmi_in_d_bits_opcode,
	auto_dmi_in_d_bits_size,
	auto_dmi_in_d_bits_source,
	auto_dmi_in_d_bits_data,
	io_dmactive,
	io_innerCtrl_valid,
	io_innerCtrl_bits_resumereq,
	io_innerCtrl_bits_hartsel,
	io_innerCtrl_bits_ackhavereset,
	io_innerCtrl_bits_hrmask_0,
	io_hgDebugInt_0,
	io_hartIsInReset_0
);
	input clock;
	input reset;
	output wire auto_tl_in_a_ready;
	input auto_tl_in_a_valid;
	input [2:0] auto_tl_in_a_bits_opcode;
	input [2:0] auto_tl_in_a_bits_param;
	input [1:0] auto_tl_in_a_bits_size;
	input [8:0] auto_tl_in_a_bits_source;
	input [11:0] auto_tl_in_a_bits_address;
	input [7:0] auto_tl_in_a_bits_mask;
	input [63:0] auto_tl_in_a_bits_data;
	input auto_tl_in_a_bits_corrupt;
	input auto_tl_in_d_ready;
	output wire auto_tl_in_d_valid;
	output wire [2:0] auto_tl_in_d_bits_opcode;
	output wire [1:0] auto_tl_in_d_bits_size;
	output wire [8:0] auto_tl_in_d_bits_source;
	output wire [63:0] auto_tl_in_d_bits_data;
	output wire auto_dmi_in_a_ready;
	input auto_dmi_in_a_valid;
	input [2:0] auto_dmi_in_a_bits_opcode;
	input [2:0] auto_dmi_in_a_bits_param;
	input [1:0] auto_dmi_in_a_bits_size;
	input auto_dmi_in_a_bits_source;
	input [8:0] auto_dmi_in_a_bits_address;
	input [3:0] auto_dmi_in_a_bits_mask;
	input [31:0] auto_dmi_in_a_bits_data;
	input auto_dmi_in_a_bits_corrupt;
	input auto_dmi_in_d_ready;
	output wire auto_dmi_in_d_valid;
	output wire [2:0] auto_dmi_in_d_bits_opcode;
	output wire [1:0] auto_dmi_in_d_bits_size;
	output wire auto_dmi_in_d_bits_source;
	output wire [31:0] auto_dmi_in_d_bits_data;
	input io_dmactive;
	input io_innerCtrl_valid;
	input io_innerCtrl_bits_resumereq;
	input [9:0] io_innerCtrl_bits_hartsel;
	input io_innerCtrl_bits_ackhavereset;
	input io_innerCtrl_bits_hrmask_0;
	output wire io_hgDebugInt_0;
	input io_hartIsInReset_0;
	wire abstractCommandBusy;
	wire out_woready_1_345;
	wire out_woready_1_528;
	wire out_woready_31;
	wire out_woready_7;
	wire out_woready_54;
	wire out_woready_93;
	wire out_woready_23;
	wire out_woready_35;
	wire out_woready_9;
	wire out_woready_97;
	wire out_woready_15;
	wire out_woready_46;
	wire out_woready_42;
	wire out_woready_99;
	wire out_woready_19;
	wire out_woready_82;
	wire out_woready_50;
	wire out_woready_78;
	wire out_woready_38;
	wire out_woready_3;
	wire out_woready_27;
	wire _out_wofireMux_T_2;
	wire out_roready_31;
	wire out_roready_7;
	wire out_roready_54;
	wire out_roready_93;
	wire out_roready_23;
	wire out_roready_35;
	wire out_roready_9;
	wire out_roready_97;
	wire out_roready_15;
	wire out_roready_46;
	wire out_roready_42;
	wire out_roready_99;
	wire out_roready_19;
	wire out_roready_82;
	wire out_roready_50;
	wire out_roready_78;
	wire out_roready_3;
	wire out_roready_27;
	wire out_backSel_7;
	wire out_backSel_6;
	wire _hartIsInResetSync_0_debug_hartReset_0_io_q;
	reg hartHalted;
	reg resumeReqRegs;
	reg haveResetBitRegs;
	wire hamaskWrSel_0 = io_innerCtrl_bits_hartsel == 10'h000;
	reg hrmaskReg_0;
	reg hrDebugIntReg_0;
	wire resumereq = io_innerCtrl_valid & io_innerCtrl_bits_resumereq;
	reg [2:0] ABSTRACTCSReg_cmderr;
	reg [15:0] ABSTRACTAUTOReg_autoexecprogbuf;
	reg [11:0] ABSTRACTAUTOReg_autoexecdata;
	reg [7:0] COMMANDReg_cmdtype;
	reg [23:0] COMMANDReg_control;
	reg [7:0] abstractDataMem_0;
	reg [7:0] abstractDataMem_1;
	reg [7:0] abstractDataMem_2;
	reg [7:0] abstractDataMem_3;
	reg [7:0] abstractDataMem_4;
	reg [7:0] abstractDataMem_5;
	reg [7:0] abstractDataMem_6;
	reg [7:0] abstractDataMem_7;
	reg [7:0] programBufferMem_0;
	reg [7:0] programBufferMem_1;
	reg [7:0] programBufferMem_2;
	reg [7:0] programBufferMem_3;
	reg [7:0] programBufferMem_4;
	reg [7:0] programBufferMem_5;
	reg [7:0] programBufferMem_6;
	reg [7:0] programBufferMem_7;
	reg [7:0] programBufferMem_8;
	reg [7:0] programBufferMem_9;
	reg [7:0] programBufferMem_10;
	reg [7:0] programBufferMem_11;
	reg [7:0] programBufferMem_12;
	reg [7:0] programBufferMem_13;
	reg [7:0] programBufferMem_14;
	reg [7:0] programBufferMem_15;
	reg [7:0] programBufferMem_16;
	reg [7:0] programBufferMem_17;
	reg [7:0] programBufferMem_18;
	reg [7:0] programBufferMem_19;
	reg [7:0] programBufferMem_20;
	reg [7:0] programBufferMem_21;
	reg [7:0] programBufferMem_22;
	reg [7:0] programBufferMem_23;
	reg [7:0] programBufferMem_24;
	reg [7:0] programBufferMem_25;
	reg [7:0] programBufferMem_26;
	reg [7:0] programBufferMem_27;
	reg [7:0] programBufferMem_28;
	reg [7:0] programBufferMem_29;
	reg [7:0] programBufferMem_30;
	reg [7:0] programBufferMem_31;
	reg [7:0] programBufferMem_32;
	reg [7:0] programBufferMem_33;
	reg [7:0] programBufferMem_34;
	reg [7:0] programBufferMem_35;
	reg [7:0] programBufferMem_36;
	reg [7:0] programBufferMem_37;
	reg [7:0] programBufferMem_38;
	reg [7:0] programBufferMem_39;
	reg [7:0] programBufferMem_40;
	reg [7:0] programBufferMem_41;
	reg [7:0] programBufferMem_42;
	reg [7:0] programBufferMem_43;
	reg [7:0] programBufferMem_44;
	reg [7:0] programBufferMem_45;
	reg [7:0] programBufferMem_46;
	reg [7:0] programBufferMem_47;
	reg [7:0] programBufferMem_48;
	reg [7:0] programBufferMem_49;
	reg [7:0] programBufferMem_50;
	reg [7:0] programBufferMem_51;
	reg [7:0] programBufferMem_52;
	reg [7:0] programBufferMem_53;
	reg [7:0] programBufferMem_54;
	reg [7:0] programBufferMem_55;
	reg [7:0] programBufferMem_56;
	reg [7:0] programBufferMem_57;
	reg [7:0] programBufferMem_58;
	reg [7:0] programBufferMem_59;
	reg [7:0] programBufferMem_60;
	reg [7:0] programBufferMem_61;
	reg [7:0] programBufferMem_62;
	reg [7:0] programBufferMem_63;
	wire in_bits_read = auto_dmi_in_a_bits_opcode == 3'h4;
	wire [1:0] _GEN = {auto_dmi_in_a_bits_address[8], auto_dmi_in_a_bits_address[6]};
	wire _out_T_45 = _GEN == 2'h0;
	wire _out_T_47 = _GEN == 2'h1;
	wire [7:0] _out_backMask_T_6 = {8 {auto_dmi_in_a_bits_mask[2]}};
	wire [7:0] _out_backMask_T_7 = {8 {auto_dmi_in_a_bits_mask[3]}};
	wire dmiAbstractDataWrEnMaybe_4 = out_woready_3 & auto_dmi_in_a_bits_mask[0];
	wire dmiAbstractDataWrEnMaybe_5 = out_woready_3 & auto_dmi_in_a_bits_mask[1];
	wire dmiAbstractDataWrEnMaybe_6 = out_woready_3 & auto_dmi_in_a_bits_mask[2];
	wire dmiAbstractDataWrEnMaybe_7 = out_woready_3 & auto_dmi_in_a_bits_mask[3];
	wire dmiProgramBufferWrEnMaybe_56 = out_woready_7 & auto_dmi_in_a_bits_mask[0];
	wire dmiProgramBufferWrEnMaybe_57 = out_woready_7 & auto_dmi_in_a_bits_mask[1];
	wire dmiProgramBufferWrEnMaybe_58 = out_woready_7 & auto_dmi_in_a_bits_mask[2];
	wire dmiProgramBufferWrEnMaybe_59 = out_woready_7 & auto_dmi_in_a_bits_mask[3];
	wire dmiProgramBufferWrEnMaybe_36 = out_woready_9 & auto_dmi_in_a_bits_mask[0];
	wire dmiProgramBufferWrEnMaybe_37 = out_woready_9 & auto_dmi_in_a_bits_mask[1];
	wire dmiProgramBufferWrEnMaybe_38 = out_woready_9 & auto_dmi_in_a_bits_mask[2];
	wire dmiProgramBufferWrEnMaybe_39 = out_woready_9 & auto_dmi_in_a_bits_mask[3];
	wire dmiProgramBufferWrEnMaybe_28 = out_woready_15 & auto_dmi_in_a_bits_mask[0];
	wire dmiProgramBufferWrEnMaybe_29 = out_woready_15 & auto_dmi_in_a_bits_mask[1];
	wire dmiProgramBufferWrEnMaybe_30 = out_woready_15 & auto_dmi_in_a_bits_mask[2];
	wire dmiProgramBufferWrEnMaybe_31 = out_woready_15 & auto_dmi_in_a_bits_mask[3];
	wire dmiProgramBufferWrEnMaybe_12 = out_woready_19 & auto_dmi_in_a_bits_mask[0];
	wire dmiProgramBufferWrEnMaybe_13 = out_woready_19 & auto_dmi_in_a_bits_mask[1];
	wire dmiProgramBufferWrEnMaybe_14 = out_woready_19 & auto_dmi_in_a_bits_mask[2];
	wire dmiProgramBufferWrEnMaybe_15 = out_woready_19 & auto_dmi_in_a_bits_mask[3];
	wire dmiProgramBufferWrEnMaybe_44 = out_woready_23 & auto_dmi_in_a_bits_mask[0];
	wire dmiProgramBufferWrEnMaybe_45 = out_woready_23 & auto_dmi_in_a_bits_mask[1];
	wire dmiProgramBufferWrEnMaybe_46 = out_woready_23 & auto_dmi_in_a_bits_mask[2];
	wire dmiProgramBufferWrEnMaybe_47 = out_woready_23 & auto_dmi_in_a_bits_mask[3];
	wire dmiAbstractDataWrEnMaybe_0 = out_woready_27 & auto_dmi_in_a_bits_mask[0];
	wire dmiAbstractDataWrEnMaybe_1 = out_woready_27 & auto_dmi_in_a_bits_mask[1];
	wire dmiAbstractDataWrEnMaybe_2 = out_woready_27 & auto_dmi_in_a_bits_mask[2];
	wire dmiAbstractDataWrEnMaybe_3 = out_woready_27 & auto_dmi_in_a_bits_mask[3];
	wire dmiProgramBufferWrEnMaybe_60 = out_woready_31 & auto_dmi_in_a_bits_mask[0];
	wire dmiProgramBufferWrEnMaybe_61 = out_woready_31 & auto_dmi_in_a_bits_mask[1];
	wire dmiProgramBufferWrEnMaybe_62 = out_woready_31 & auto_dmi_in_a_bits_mask[2];
	wire dmiProgramBufferWrEnMaybe_63 = out_woready_31 & auto_dmi_in_a_bits_mask[3];
	wire dmiProgramBufferWrEnMaybe_40 = out_woready_35 & auto_dmi_in_a_bits_mask[0];
	wire dmiProgramBufferWrEnMaybe_41 = out_woready_35 & auto_dmi_in_a_bits_mask[1];
	wire dmiProgramBufferWrEnMaybe_42 = out_woready_35 & auto_dmi_in_a_bits_mask[2];
	wire dmiProgramBufferWrEnMaybe_43 = out_woready_35 & auto_dmi_in_a_bits_mask[3];
	wire autoexecdataWrEnMaybe = out_woready_38 & auto_dmi_in_a_bits_mask[0];
	wire autoexecprogbufWrEnMaybe = out_woready_38 & (&{_out_backMask_T_7, _out_backMask_T_6});
	wire dmiProgramBufferWrEnMaybe_20 = out_woready_42 & auto_dmi_in_a_bits_mask[0];
	wire dmiProgramBufferWrEnMaybe_21 = out_woready_42 & auto_dmi_in_a_bits_mask[1];
	wire dmiProgramBufferWrEnMaybe_22 = out_woready_42 & auto_dmi_in_a_bits_mask[2];
	wire dmiProgramBufferWrEnMaybe_23 = out_woready_42 & auto_dmi_in_a_bits_mask[3];
	wire dmiProgramBufferWrEnMaybe_24 = out_woready_46 & auto_dmi_in_a_bits_mask[0];
	wire dmiProgramBufferWrEnMaybe_25 = out_woready_46 & auto_dmi_in_a_bits_mask[1];
	wire dmiProgramBufferWrEnMaybe_26 = out_woready_46 & auto_dmi_in_a_bits_mask[2];
	wire dmiProgramBufferWrEnMaybe_27 = out_woready_46 & auto_dmi_in_a_bits_mask[3];
	wire dmiProgramBufferWrEnMaybe_4 = out_woready_50 & auto_dmi_in_a_bits_mask[0];
	wire dmiProgramBufferWrEnMaybe_5 = out_woready_50 & auto_dmi_in_a_bits_mask[1];
	wire dmiProgramBufferWrEnMaybe_6 = out_woready_50 & auto_dmi_in_a_bits_mask[2];
	wire dmiProgramBufferWrEnMaybe_7 = out_woready_50 & auto_dmi_in_a_bits_mask[3];
	wire dmiProgramBufferWrEnMaybe_52 = out_woready_54 & auto_dmi_in_a_bits_mask[0];
	wire dmiProgramBufferWrEnMaybe_53 = out_woready_54 & auto_dmi_in_a_bits_mask[1];
	wire dmiProgramBufferWrEnMaybe_54 = out_woready_54 & auto_dmi_in_a_bits_mask[2];
	wire dmiProgramBufferWrEnMaybe_55 = out_woready_54 & auto_dmi_in_a_bits_mask[3];
	wire dmiProgramBufferWrEnMaybe_0 = out_woready_78 & auto_dmi_in_a_bits_mask[0];
	wire dmiProgramBufferWrEnMaybe_1 = out_woready_78 & auto_dmi_in_a_bits_mask[1];
	wire dmiProgramBufferWrEnMaybe_2 = out_woready_78 & auto_dmi_in_a_bits_mask[2];
	wire dmiProgramBufferWrEnMaybe_3 = out_woready_78 & auto_dmi_in_a_bits_mask[3];
	wire dmiProgramBufferWrEnMaybe_8 = out_woready_82 & auto_dmi_in_a_bits_mask[0];
	wire dmiProgramBufferWrEnMaybe_9 = out_woready_82 & auto_dmi_in_a_bits_mask[1];
	wire dmiProgramBufferWrEnMaybe_10 = out_woready_82 & auto_dmi_in_a_bits_mask[2];
	wire dmiProgramBufferWrEnMaybe_11 = out_woready_82 & auto_dmi_in_a_bits_mask[3];
	wire ABSTRACTCSWrEnMaybe = ((_out_wofireMux_T_2 & out_backSel_6) & _out_T_47) & auto_dmi_in_a_bits_mask[1];
	wire dmiProgramBufferWrEnMaybe_48 = out_woready_93 & auto_dmi_in_a_bits_mask[0];
	wire dmiProgramBufferWrEnMaybe_49 = out_woready_93 & auto_dmi_in_a_bits_mask[1];
	wire dmiProgramBufferWrEnMaybe_50 = out_woready_93 & auto_dmi_in_a_bits_mask[2];
	wire dmiProgramBufferWrEnMaybe_51 = out_woready_93 & auto_dmi_in_a_bits_mask[3];
	wire dmiProgramBufferWrEnMaybe_32 = out_woready_97 & auto_dmi_in_a_bits_mask[0];
	wire dmiProgramBufferWrEnMaybe_33 = out_woready_97 & auto_dmi_in_a_bits_mask[1];
	wire dmiProgramBufferWrEnMaybe_34 = out_woready_97 & auto_dmi_in_a_bits_mask[2];
	wire dmiProgramBufferWrEnMaybe_35 = out_woready_97 & auto_dmi_in_a_bits_mask[3];
	wire COMMANDWrEnMaybe = ((_out_wofireMux_T_2 & out_backSel_7) & _out_T_47) & (&{_out_backMask_T_7, _out_backMask_T_6, {8 {auto_dmi_in_a_bits_mask[1]}}, {8 {auto_dmi_in_a_bits_mask[0]}}});
	wire [31:0] COMMANDWrDataVal = (COMMANDWrEnMaybe ? auto_dmi_in_a_bits_data : 32'h00000000);
	wire dmiProgramBufferWrEnMaybe_16 = out_woready_99 & auto_dmi_in_a_bits_mask[0];
	wire dmiProgramBufferWrEnMaybe_17 = out_woready_99 & auto_dmi_in_a_bits_mask[1];
	wire dmiProgramBufferWrEnMaybe_18 = out_woready_99 & auto_dmi_in_a_bits_mask[2];
	wire dmiProgramBufferWrEnMaybe_19 = out_woready_99 & auto_dmi_in_a_bits_mask[3];
	wire [4:0] out_oindex = {auto_dmi_in_a_bits_address[7], auto_dmi_in_a_bits_address[5:2]};
	wire [4:0] _GEN_0 = {auto_dmi_in_a_bits_address[7], auto_dmi_in_a_bits_address[5:2]};
	wire out_backSel_4 = _GEN_0 == 5'h04;
	wire out_backSel_5 = _GEN_0 == 5'h05;
	assign out_backSel_6 = _GEN_0 == 5'h06;
	assign out_backSel_7 = _GEN_0 == 5'h07;
	wire out_backSel_16 = _GEN_0 == 5'h10;
	wire out_backSel_17 = _GEN_0 == 5'h11;
	wire out_backSel_18 = _GEN_0 == 5'h12;
	wire out_backSel_19 = _GEN_0 == 5'h13;
	wire out_backSel_20 = _GEN_0 == 5'h14;
	wire out_backSel_21 = _GEN_0 == 5'h15;
	wire out_backSel_22 = _GEN_0 == 5'h16;
	wire out_backSel_23 = _GEN_0 == 5'h17;
	wire out_backSel_24 = _GEN_0 == 5'h18;
	wire out_backSel_25 = _GEN_0 == 5'h19;
	wire out_backSel_26 = _GEN_0 == 5'h1a;
	wire out_backSel_27 = _GEN_0 == 5'h1b;
	wire out_backSel_28 = _GEN_0 == 5'h1c;
	wire out_backSel_29 = _GEN_0 == 5'h1d;
	wire out_backSel_30 = _GEN_0 == 5'h1e;
	wire _out_wofireMux_T = auto_dmi_in_a_valid & auto_dmi_in_d_ready;
	wire _out_rofireMux_T_1 = _out_wofireMux_T & in_bits_read;
	assign out_roready_27 = (_out_rofireMux_T_1 & out_backSel_4) & _out_T_45;
	assign out_roready_3 = (_out_rofireMux_T_1 & out_backSel_5) & _out_T_45;
	assign out_roready_78 = (_out_rofireMux_T_1 & out_backSel_16) & _out_T_45;
	assign out_roready_50 = (_out_rofireMux_T_1 & out_backSel_17) & _out_T_45;
	assign out_roready_82 = (_out_rofireMux_T_1 & out_backSel_18) & _out_T_45;
	assign out_roready_19 = (_out_rofireMux_T_1 & out_backSel_19) & _out_T_45;
	assign out_roready_99 = (_out_rofireMux_T_1 & out_backSel_20) & _out_T_45;
	assign out_roready_42 = (_out_rofireMux_T_1 & out_backSel_21) & _out_T_45;
	assign out_roready_46 = (_out_rofireMux_T_1 & out_backSel_22) & _out_T_45;
	assign out_roready_15 = (_out_rofireMux_T_1 & out_backSel_23) & _out_T_45;
	assign out_roready_97 = (_out_rofireMux_T_1 & out_backSel_24) & _out_T_45;
	assign out_roready_9 = (_out_rofireMux_T_1 & out_backSel_25) & _out_T_45;
	assign out_roready_35 = (_out_rofireMux_T_1 & out_backSel_26) & _out_T_45;
	assign out_roready_23 = (_out_rofireMux_T_1 & out_backSel_27) & _out_T_45;
	assign out_roready_93 = (_out_rofireMux_T_1 & out_backSel_28) & _out_T_45;
	assign out_roready_54 = (_out_rofireMux_T_1 & out_backSel_29) & _out_T_45;
	assign out_roready_7 = (_out_rofireMux_T_1 & out_backSel_30) & _out_T_45;
	assign out_roready_31 = (_out_rofireMux_T_1 & (&_GEN_0)) & _out_T_45;
	assign _out_wofireMux_T_2 = _out_wofireMux_T & ~in_bits_read;
	assign out_woready_27 = (_out_wofireMux_T_2 & out_backSel_4) & _out_T_45;
	assign out_woready_3 = (_out_wofireMux_T_2 & out_backSel_5) & _out_T_45;
	assign out_woready_38 = (_out_wofireMux_T_2 & (_GEN_0 == 5'h08)) & _out_T_47;
	assign out_woready_78 = (_out_wofireMux_T_2 & out_backSel_16) & _out_T_45;
	assign out_woready_50 = (_out_wofireMux_T_2 & out_backSel_17) & _out_T_45;
	assign out_woready_82 = (_out_wofireMux_T_2 & out_backSel_18) & _out_T_45;
	assign out_woready_19 = (_out_wofireMux_T_2 & out_backSel_19) & _out_T_45;
	assign out_woready_99 = (_out_wofireMux_T_2 & out_backSel_20) & _out_T_45;
	assign out_woready_42 = (_out_wofireMux_T_2 & out_backSel_21) & _out_T_45;
	assign out_woready_46 = (_out_wofireMux_T_2 & out_backSel_22) & _out_T_45;
	assign out_woready_15 = (_out_wofireMux_T_2 & out_backSel_23) & _out_T_45;
	assign out_woready_97 = (_out_wofireMux_T_2 & out_backSel_24) & _out_T_45;
	assign out_woready_9 = (_out_wofireMux_T_2 & out_backSel_25) & _out_T_45;
	assign out_woready_35 = (_out_wofireMux_T_2 & out_backSel_26) & _out_T_45;
	assign out_woready_23 = (_out_wofireMux_T_2 & out_backSel_27) & _out_T_45;
	assign out_woready_93 = (_out_wofireMux_T_2 & out_backSel_28) & _out_T_45;
	assign out_woready_54 = (_out_wofireMux_T_2 & out_backSel_29) & _out_T_45;
	assign out_woready_7 = (_out_wofireMux_T_2 & out_backSel_30) & _out_T_45;
	assign out_woready_31 = (_out_wofireMux_T_2 & (&_GEN_0)) & _out_T_45;
	wire [31:0] _GEN_1 = {_out_T_45, _out_T_45, _out_T_45, _out_T_45, _out_T_45, _out_T_45, _out_T_45, _out_T_45, _out_T_45, _out_T_45, _out_T_45, _out_T_45, _out_T_45, _out_T_45, _out_T_45, _out_T_45, 7'h7f, _out_T_47, _out_T_47, _out_T_47, _out_T_45, _out_T_45, _out_T_47, 1'h1, _out_T_47, _GEN == 2'h2};
	wire [1023:0] _GEN_2 = {programBufferMem_63, programBufferMem_62, programBufferMem_61, programBufferMem_60, programBufferMem_59, programBufferMem_58, programBufferMem_57, programBufferMem_56, programBufferMem_55, programBufferMem_54, programBufferMem_53, programBufferMem_52, programBufferMem_51, programBufferMem_50, programBufferMem_49, programBufferMem_48, programBufferMem_47, programBufferMem_46, programBufferMem_45, programBufferMem_44, programBufferMem_43, programBufferMem_42, programBufferMem_41, programBufferMem_40, programBufferMem_39, programBufferMem_38, programBufferMem_37, programBufferMem_36, programBufferMem_35, programBufferMem_34, programBufferMem_33, programBufferMem_32, programBufferMem_31, programBufferMem_30, programBufferMem_29, programBufferMem_28, programBufferMem_27, programBufferMem_26, programBufferMem_25, programBufferMem_24, programBufferMem_23, programBufferMem_22, programBufferMem_21, programBufferMem_20, programBufferMem_19, programBufferMem_18, programBufferMem_17, programBufferMem_16, programBufferMem_15, programBufferMem_14, programBufferMem_13, programBufferMem_12, programBufferMem_11, programBufferMem_10, programBufferMem_9, programBufferMem_8, programBufferMem_7, programBufferMem_6, programBufferMem_5, programBufferMem_4, programBufferMem_3, programBufferMem_2, programBufferMem_1, programBufferMem_0, 224'h00000000000000000000000000000000000000000000000000000000, ABSTRACTAUTOReg_autoexecprogbuf, 14'h0000, ABSTRACTAUTOReg_autoexecdata[1:0], COMMANDReg_cmdtype, COMMANDReg_control, 19'h08000, abstractCommandBusy, 1'h0, ABSTRACTCSReg_cmderr, 8'h02, abstractDataMem_7, abstractDataMem_6, abstractDataMem_5, abstractDataMem_4, abstractDataMem_3, abstractDataMem_2, abstractDataMem_1, abstractDataMem_0, 31'h00000000, hartHalted, 44'h00000000000, {2 {haveResetBitRegs}}, {2 {(resumereq ? ~resumeReqRegs & ~hamaskWrSel_0 : ~resumeReqRegs)}}, 4'h0, ~hartHalted, ~hartHalted, {2 {hartHalted}}, 39'h5100000000, hartHalted};
	wire [2:0] dmiNodeIn_d_bits_opcode = {2'h0, in_bits_read};
	reg goReg;
	reg [31:0] abstractGeneratedMem_0;
	reg [31:0] abstractGeneratedMem_1;
	wire in_1_bits_read = auto_tl_in_a_bits_opcode == 3'h4;
	wire [9:0] _out_womask_T_631 = {{2 {auto_tl_in_a_bits_mask[1]}}, {8 {auto_tl_in_a_bits_mask[0]}}};
	wire hartResumingWrEn = out_woready_1_345 & (&_out_womask_T_631);
	wire [9:0] _out_womask_T_632 = {{2 {auto_tl_in_a_bits_mask[5]}}, {8 {auto_tl_in_a_bits_mask[4]}}};
	wire hartExceptionWrEn = out_woready_1_345 & (&_out_womask_T_632);
	wire hartHaltedWrEn = out_woready_1_528 & (&_out_womask_T_631);
	wire hartGoingWrEn = out_woready_1_528 & (&_out_womask_T_632);
	wire _out_wofireMux_T_134 = (auto_tl_in_a_valid & auto_tl_in_d_ready) & ~in_1_bits_read;
	assign out_woready_1_528 = (_out_wofireMux_T_134 & (auto_tl_in_a_bits_address[10:3] == 8'h20)) & ~auto_tl_in_a_bits_address[11];
	assign out_woready_1_345 = (_out_wofireMux_T_134 & (auto_tl_in_a_bits_address[10:3] == 8'h21)) & ~auto_tl_in_a_bits_address[11];
	wire out_woready_1_922 = (_out_wofireMux_T_134 & (auto_tl_in_a_bits_address[10:3] == 8'h68)) & ~auto_tl_in_a_bits_address[11];
	wire out_woready_1_510 = (_out_wofireMux_T_134 & (auto_tl_in_a_bits_address[10:3] == 8'h69)) & ~auto_tl_in_a_bits_address[11];
	wire out_woready_1_191 = (_out_wofireMux_T_134 & (auto_tl_in_a_bits_address[10:3] == 8'h6a)) & ~auto_tl_in_a_bits_address[11];
	wire out_woready_1_1074 = (_out_wofireMux_T_134 & (auto_tl_in_a_bits_address[10:3] == 8'h6b)) & ~auto_tl_in_a_bits_address[11];
	wire out_woready_1_722 = (_out_wofireMux_T_134 & (auto_tl_in_a_bits_address[10:3] == 8'h6c)) & ~auto_tl_in_a_bits_address[11];
	wire out_woready_1_442 = (_out_wofireMux_T_134 & (auto_tl_in_a_bits_address[10:3] == 8'h6d)) & ~auto_tl_in_a_bits_address[11];
	wire out_woready_1_111 = (_out_wofireMux_T_134 & (auto_tl_in_a_bits_address[10:3] == 8'h6e)) & ~auto_tl_in_a_bits_address[11];
	wire out_woready_1_1146 = (_out_wofireMux_T_134 & (auto_tl_in_a_bits_address[10:3] == 8'h6f)) & ~auto_tl_in_a_bits_address[11];
	wire out_woready_1_818 = (_out_wofireMux_T_134 & (auto_tl_in_a_bits_address[10:3] == 8'h70)) & ~auto_tl_in_a_bits_address[11];
	wire [255:0] _GEN_3 = {~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], 15'h7fff, ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], 6'h3f, ~auto_tl_in_a_bits_address[11], 62'h3fffffffffffffff, ~auto_tl_in_a_bits_address[11], ~auto_tl_in_a_bits_address[11], 21'h1fffff, auto_tl_in_a_bits_address[11], auto_tl_in_a_bits_address[11], auto_tl_in_a_bits_address[11], auto_tl_in_a_bits_address[11], auto_tl_in_a_bits_address[11], auto_tl_in_a_bits_address[11], auto_tl_in_a_bits_address[11], auto_tl_in_a_bits_address[11], auto_tl_in_a_bits_address[11], auto_tl_in_a_bits_address[11], auto_tl_in_a_bits_address[11]};
	wire [16383:0] _GEN_4 = {6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 6'h00, resumeReqRegs, goReg, 960'h0, abstractDataMem_7, abstractDataMem_6, abstractDataMem_5, abstractDataMem_4, abstractDataMem_3, abstractDataMem_2, abstractDataMem_1, abstractDataMem_0, programBufferMem_63, programBufferMem_62, programBufferMem_61, programBufferMem_60, programBufferMem_59, programBufferMem_58, programBufferMem_57, programBufferMem_56, programBufferMem_55, programBufferMem_54, programBufferMem_53, programBufferMem_52, programBufferMem_51, programBufferMem_50, programBufferMem_49, programBufferMem_48, programBufferMem_47, programBufferMem_46, programBufferMem_45, programBufferMem_44, programBufferMem_43, programBufferMem_42, programBufferMem_41, programBufferMem_40, programBufferMem_39, programBufferMem_38, programBufferMem_37, programBufferMem_36, programBufferMem_35, programBufferMem_34, programBufferMem_33, programBufferMem_32, programBufferMem_31, programBufferMem_30, programBufferMem_29, programBufferMem_28, programBufferMem_27, programBufferMem_26, programBufferMem_25, programBufferMem_24, programBufferMem_23, programBufferMem_22, programBufferMem_21, programBufferMem_20, programBufferMem_19, programBufferMem_18, programBufferMem_17, programBufferMem_16, programBufferMem_15, programBufferMem_14, programBufferMem_13, programBufferMem_12, programBufferMem_11, programBufferMem_10, programBufferMem_9, programBufferMem_8, programBufferMem_7, programBufferMem_6, programBufferMem_5, programBufferMem_4, programBufferMem_3, programBufferMem_2, programBufferMem_1, programBufferMem_0, abstractGeneratedMem_1, abstractGeneratedMem_0, 6592'h380006f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100073100026237b2000737b20247310802423f140247330000067100022237b2024730004086300147413fe0408e3003474134004440310802023f14024737b2410730ff0000f0440006f0380006f00c0006f};
	wire [2:0] tlNodeIn_d_bits_opcode = {2'h0, in_1_bits_read};
	reg [1:0] ctrlStateReg;
	assign abstractCommandBusy = |ctrlStateReg;
	wire commandRegIsAccessRegister = COMMANDReg_cmdtype == 8'h00;
	wire _GEN_5 = ~COMMANDReg_control[17] | ((|COMMANDReg_control[15:12] & (COMMANDReg_control[15:0] < 16'h1020)) & ((COMMANDReg_control[22:20] == 3'h2) | (COMMANDReg_control[22:20] == 3'h3)));
	wire commandRegIsUnsupported = ~commandRegIsAccessRegister | ~_GEN_5;
	wire commandRegBadHaltResume = (commandRegIsAccessRegister & _GEN_5) & ~hartHalted;
	wire _GEN_6 = ctrlStateReg == 2'h1;
	wire _GEN_7 = commandRegIsUnsupported | commandRegBadHaltResume;
	wire goAbstract = (|ctrlStateReg & _GEN_6) & ~_GEN_7;
	wire _GEN_8 = ctrlStateReg == 2'h2;
	always @(posedge clock) begin
		hartHalted <= (io_dmactive & (hartHaltedWrEn | (~hartResumingWrEn & hartHalted))) & ~_hartIsInResetSync_0_debug_hartReset_0_io_q;
		resumeReqRegs <= io_dmactive & (resumereq ? (resumeReqRegs | hamaskWrSel_0) & ~_hartIsInResetSync_0_debug_hartReset_0_io_q : (~hartResumingWrEn & resumeReqRegs) & ~_hartIsInResetSync_0_debug_hartReset_0_io_q);
		haveResetBitRegs <= io_dmactive & (io_innerCtrl_valid & io_innerCtrl_bits_ackhavereset ? (haveResetBitRegs & ~hamaskWrSel_0) | _hartIsInResetSync_0_debug_hartReset_0_io_q : haveResetBitRegs | _hartIsInResetSync_0_debug_hartReset_0_io_q);
		if (io_dmactive) begin : sv2v_autoblock_1
			reg dmiAbstractDataAccessVec_0;
			reg dmiAbstractDataAccessVec_4;
			reg dmiProgramBufferAccessVec_0;
			reg dmiProgramBufferAccessVec_4;
			reg dmiProgramBufferAccessVec_8;
			reg dmiProgramBufferAccessVec_12;
			reg dmiProgramBufferAccessVec_16;
			reg dmiProgramBufferAccessVec_20;
			reg dmiProgramBufferAccessVec_24;
			reg dmiProgramBufferAccessVec_28;
			reg dmiProgramBufferAccessVec_32;
			reg dmiProgramBufferAccessVec_36;
			reg dmiProgramBufferAccessVec_40;
			reg dmiProgramBufferAccessVec_44;
			reg dmiProgramBufferAccessVec_48;
			reg dmiProgramBufferAccessVec_52;
			reg dmiProgramBufferAccessVec_56;
			reg dmiProgramBufferAccessVec_60;
			reg autoexec;
			reg COMMANDWrEn;
			reg _regAccessRegisterCommand_T_1;
			reg _GEN_10;
			dmiAbstractDataAccessVec_0 = dmiAbstractDataWrEnMaybe_0 | (out_roready_27 & auto_dmi_in_a_bits_mask[0]);
			dmiAbstractDataAccessVec_4 = dmiAbstractDataWrEnMaybe_4 | (out_roready_3 & auto_dmi_in_a_bits_mask[0]);
			dmiProgramBufferAccessVec_0 = dmiProgramBufferWrEnMaybe_0 | (out_roready_78 & auto_dmi_in_a_bits_mask[0]);
			dmiProgramBufferAccessVec_4 = dmiProgramBufferWrEnMaybe_4 | (out_roready_50 & auto_dmi_in_a_bits_mask[0]);
			dmiProgramBufferAccessVec_8 = dmiProgramBufferWrEnMaybe_8 | (out_roready_82 & auto_dmi_in_a_bits_mask[0]);
			dmiProgramBufferAccessVec_12 = dmiProgramBufferWrEnMaybe_12 | (out_roready_19 & auto_dmi_in_a_bits_mask[0]);
			dmiProgramBufferAccessVec_16 = dmiProgramBufferWrEnMaybe_16 | (out_roready_99 & auto_dmi_in_a_bits_mask[0]);
			dmiProgramBufferAccessVec_20 = dmiProgramBufferWrEnMaybe_20 | (out_roready_42 & auto_dmi_in_a_bits_mask[0]);
			dmiProgramBufferAccessVec_24 = dmiProgramBufferWrEnMaybe_24 | (out_roready_46 & auto_dmi_in_a_bits_mask[0]);
			dmiProgramBufferAccessVec_28 = dmiProgramBufferWrEnMaybe_28 | (out_roready_15 & auto_dmi_in_a_bits_mask[0]);
			dmiProgramBufferAccessVec_32 = dmiProgramBufferWrEnMaybe_32 | (out_roready_97 & auto_dmi_in_a_bits_mask[0]);
			dmiProgramBufferAccessVec_36 = dmiProgramBufferWrEnMaybe_36 | (out_roready_9 & auto_dmi_in_a_bits_mask[0]);
			dmiProgramBufferAccessVec_40 = dmiProgramBufferWrEnMaybe_40 | (out_roready_35 & auto_dmi_in_a_bits_mask[0]);
			dmiProgramBufferAccessVec_44 = dmiProgramBufferWrEnMaybe_44 | (out_roready_23 & auto_dmi_in_a_bits_mask[0]);
			dmiProgramBufferAccessVec_48 = dmiProgramBufferWrEnMaybe_48 | (out_roready_93 & auto_dmi_in_a_bits_mask[0]);
			dmiProgramBufferAccessVec_52 = dmiProgramBufferWrEnMaybe_52 | (out_roready_54 & auto_dmi_in_a_bits_mask[0]);
			dmiProgramBufferAccessVec_56 = dmiProgramBufferWrEnMaybe_56 | (out_roready_7 & auto_dmi_in_a_bits_mask[0]);
			dmiProgramBufferAccessVec_60 = dmiProgramBufferWrEnMaybe_60 | (out_roready_31 & auto_dmi_in_a_bits_mask[0]);
			autoexec = (((((((((((((((((dmiAbstractDataAccessVec_0 & ABSTRACTAUTOReg_autoexecdata[0]) | (dmiAbstractDataAccessVec_4 & ABSTRACTAUTOReg_autoexecdata[1])) | (dmiProgramBufferAccessVec_0 & ABSTRACTAUTOReg_autoexecprogbuf[0])) | (dmiProgramBufferAccessVec_4 & ABSTRACTAUTOReg_autoexecprogbuf[1])) | (dmiProgramBufferAccessVec_8 & ABSTRACTAUTOReg_autoexecprogbuf[2])) | (dmiProgramBufferAccessVec_12 & ABSTRACTAUTOReg_autoexecprogbuf[3])) | (dmiProgramBufferAccessVec_16 & ABSTRACTAUTOReg_autoexecprogbuf[4])) | (dmiProgramBufferAccessVec_20 & ABSTRACTAUTOReg_autoexecprogbuf[5])) | (dmiProgramBufferAccessVec_24 & ABSTRACTAUTOReg_autoexecprogbuf[6])) | (dmiProgramBufferAccessVec_28 & ABSTRACTAUTOReg_autoexecprogbuf[7])) | (dmiProgramBufferAccessVec_32 & ABSTRACTAUTOReg_autoexecprogbuf[8])) | (dmiProgramBufferAccessVec_36 & ABSTRACTAUTOReg_autoexecprogbuf[9])) | (dmiProgramBufferAccessVec_40 & ABSTRACTAUTOReg_autoexecprogbuf[10])) | (dmiProgramBufferAccessVec_44 & ABSTRACTAUTOReg_autoexecprogbuf[11])) | (dmiProgramBufferAccessVec_48 & ABSTRACTAUTOReg_autoexecprogbuf[12])) | (dmiProgramBufferAccessVec_52 & ABSTRACTAUTOReg_autoexecprogbuf[13])) | (dmiProgramBufferAccessVec_56 & ABSTRACTAUTOReg_autoexecprogbuf[14])) | (dmiProgramBufferAccessVec_60 & ABSTRACTAUTOReg_autoexecprogbuf[15]);
			COMMANDWrEn = COMMANDWrEnMaybe & ~(|ctrlStateReg);
			_regAccessRegisterCommand_T_1 = ABSTRACTCSReg_cmderr == 3'h0;
			_GEN_10 = ((COMMANDWrEn & ~(|COMMANDWrDataVal[31:24])) & _regAccessRegisterCommand_T_1) | ((autoexec & commandRegIsAccessRegister) & _regAccessRegisterCommand_T_1);
			if ((((((ABSTRACTCSWrEnMaybe & |ctrlStateReg) | (autoexecdataWrEnMaybe & |ctrlStateReg)) | (autoexecprogbufWrEnMaybe & |ctrlStateReg)) | (COMMANDWrEnMaybe & |ctrlStateReg)) | ((((((((((((((dmiAbstractDataAccessVec_0 | dmiAbstractDataWrEnMaybe_1) | (out_roready_27 & auto_dmi_in_a_bits_mask[1])) | dmiAbstractDataWrEnMaybe_2) | (out_roready_27 & auto_dmi_in_a_bits_mask[2])) | dmiAbstractDataWrEnMaybe_3) | (out_roready_27 & auto_dmi_in_a_bits_mask[3])) | dmiAbstractDataAccessVec_4) | dmiAbstractDataWrEnMaybe_5) | (out_roready_3 & auto_dmi_in_a_bits_mask[1])) | dmiAbstractDataWrEnMaybe_6) | (out_roready_3 & auto_dmi_in_a_bits_mask[2])) | dmiAbstractDataWrEnMaybe_7) | (out_roready_3 & auto_dmi_in_a_bits_mask[3])) & |ctrlStateReg)) | ((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((((dmiProgramBufferAccessVec_0 | dmiProgramBufferWrEnMaybe_1) | (out_roready_78 & auto_dmi_in_a_bits_mask[1])) | dmiProgramBufferWrEnMaybe_2) | (out_roready_78 & auto_dmi_in_a_bits_mask[2])) | dmiProgramBufferWrEnMaybe_3) | (out_roready_78 & auto_dmi_in_a_bits_mask[3])) | dmiProgramBufferAccessVec_4) | dmiProgramBufferWrEnMaybe_5) | (out_roready_50 & auto_dmi_in_a_bits_mask[1])) | dmiProgramBufferWrEnMaybe_6) | (out_roready_50 & auto_dmi_in_a_bits_mask[2])) | dmiProgramBufferWrEnMaybe_7) | (out_roready_50 & auto_dmi_in_a_bits_mask[3])) | dmiProgramBufferAccessVec_8) | dmiProgramBufferWrEnMaybe_9) | (out_roready_82 & auto_dmi_in_a_bits_mask[1])) | dmiProgramBufferWrEnMaybe_10) | (out_roready_82 & auto_dmi_in_a_bits_mask[2])) | dmiProgramBufferWrEnMaybe_11) | (out_roready_82 & auto_dmi_in_a_bits_mask[3])) | dmiProgramBufferAccessVec_12) | dmiProgramBufferWrEnMaybe_13) | (out_roready_19 & auto_dmi_in_a_bits_mask[1])) | dmiProgramBufferWrEnMaybe_14) | (out_roready_19 & auto_dmi_in_a_bits_mask[2])) | dmiProgramBufferWrEnMaybe_15) | (out_roready_19 & auto_dmi_in_a_bits_mask[3])) | dmiProgramBufferAccessVec_16) | dmiProgramBufferWrEnMaybe_17) | (out_roready_99 & auto_dmi_in_a_bits_mask[1])) | dmiProgramBufferWrEnMaybe_18) | (out_roready_99 & auto_dmi_in_a_bits_mask[2])) | dmiProgramBufferWrEnMaybe_19) | (out_roready_99 & auto_dmi_in_a_bits_mask[3])) | dmiProgramBufferAccessVec_20) | dmiProgramBufferWrEnMaybe_21) | (out_roready_42 & auto_dmi_in_a_bits_mask[1])) | dmiProgramBufferWrEnMaybe_22) | (out_roready_42 & auto_dmi_in_a_bits_mask[2])) | dmiProgramBufferWrEnMaybe_23) | (out_roready_42 & auto_dmi_in_a_bits_mask[3])) | dmiProgramBufferAccessVec_24) | dmiProgramBufferWrEnMaybe_25) | (out_roready_46 & auto_dmi_in_a_bits_mask[1])) | dmiProgramBufferWrEnMaybe_26) | (out_roready_46 & auto_dmi_in_a_bits_mask[2])) | dmiProgramBufferWrEnMaybe_27) | (out_roready_46 & auto_dmi_in_a_bits_mask[3])) | dmiProgramBufferAccessVec_28) | dmiProgramBufferWrEnMaybe_29) | (out_roready_15 & auto_dmi_in_a_bits_mask[1])) | dmiProgramBufferWrEnMaybe_30) | (out_roready_15 & auto_dmi_in_a_bits_mask[2])) | dmiProgramBufferWrEnMaybe_31) | (out_roready_15 & auto_dmi_in_a_bits_mask[3])) | dmiProgramBufferAccessVec_32) | dmiProgramBufferWrEnMaybe_33) | (out_roready_97 & auto_dmi_in_a_bits_mask[1])) | dmiProgramBufferWrEnMaybe_34) | (out_roready_97 & auto_dmi_in_a_bits_mask[2])) | dmiProgramBufferWrEnMaybe_35) | (out_roready_97 & auto_dmi_in_a_bits_mask[3])) | dmiProgramBufferAccessVec_36) | dmiProgramBufferWrEnMaybe_37) | (out_roready_9 & auto_dmi_in_a_bits_mask[1])) | dmiProgramBufferWrEnMaybe_38) | (out_roready_9 & auto_dmi_in_a_bits_mask[2])) | dmiProgramBufferWrEnMaybe_39) | (out_roready_9 & auto_dmi_in_a_bits_mask[3])) | dmiProgramBufferAccessVec_40) | dmiProgramBufferWrEnMaybe_41) | (out_roready_35 & auto_dmi_in_a_bits_mask[1])) | dmiProgramBufferWrEnMaybe_42) | (out_roready_35 & auto_dmi_in_a_bits_mask[2])) | dmiProgramBufferWrEnMaybe_43) | (out_roready_35 & auto_dmi_in_a_bits_mask[3])) | dmiProgramBufferAccessVec_44) | dmiProgramBufferWrEnMaybe_45) | (out_roready_23 & auto_dmi_in_a_bits_mask[1])) | dmiProgramBufferWrEnMaybe_46) | (out_roready_23 & auto_dmi_in_a_bits_mask[2])) | dmiProgramBufferWrEnMaybe_47) | (out_roready_23 & auto_dmi_in_a_bits_mask[3])) | dmiProgramBufferAccessVec_48) | dmiProgramBufferWrEnMaybe_49) | (out_roready_93 & auto_dmi_in_a_bits_mask[1])) | dmiProgramBufferWrEnMaybe_50) | (out_roready_93 & auto_dmi_in_a_bits_mask[2])) | dmiProgramBufferWrEnMaybe_51) | (out_roready_93 & auto_dmi_in_a_bits_mask[3])) | dmiProgramBufferAccessVec_52) | dmiProgramBufferWrEnMaybe_53) | (out_roready_54 & auto_dmi_in_a_bits_mask[1])) | dmiProgramBufferWrEnMaybe_54) | (out_roready_54 & auto_dmi_in_a_bits_mask[2])) | dmiProgramBufferWrEnMaybe_55) | (out_roready_54 & auto_dmi_in_a_bits_mask[3])) | dmiProgramBufferAccessVec_56) | dmiProgramBufferWrEnMaybe_57) | (out_roready_7 & auto_dmi_in_a_bits_mask[1])) | dmiProgramBufferWrEnMaybe_58) | (out_roready_7 & auto_dmi_in_a_bits_mask[2])) | dmiProgramBufferWrEnMaybe_59) | (out_roready_7 & auto_dmi_in_a_bits_mask[3])) | dmiProgramBufferAccessVec_60) | dmiProgramBufferWrEnMaybe_61) | (out_roready_31 & auto_dmi_in_a_bits_mask[1])) | dmiProgramBufferWrEnMaybe_62) | (out_roready_31 & auto_dmi_in_a_bits_mask[2])) | dmiProgramBufferWrEnMaybe_63) | (out_roready_31 & auto_dmi_in_a_bits_mask[3])) & |ctrlStateReg))
				ABSTRACTCSReg_cmderr <= 3'h1;
			else if ((~(~(|ctrlStateReg) | _GEN_6) & _GEN_8) & hartExceptionWrEn)
				ABSTRACTCSReg_cmderr <= 3'h3;
			else if ((|ctrlStateReg ? _GEN_6 & commandRegIsUnsupported : ~_GEN_10 & ((COMMANDWrEn & |COMMANDWrDataVal[31:24]) | (autoexec & commandRegIsUnsupported))))
				ABSTRACTCSReg_cmderr <= 3'h2;
			else if (((|ctrlStateReg & _GEN_6) & ~commandRegIsUnsupported) & commandRegBadHaltResume)
				ABSTRACTCSReg_cmderr <= 3'h4;
			else
				ABSTRACTCSReg_cmderr <= ({3 {~(ABSTRACTCSWrEnMaybe & ~(|ctrlStateReg))}} | ~auto_dmi_in_a_bits_data[10:8]) & ABSTRACTCSReg_cmderr;
			if (autoexecprogbufWrEnMaybe & ~(|ctrlStateReg))
				ABSTRACTAUTOReg_autoexecprogbuf <= auto_dmi_in_a_bits_data[31:16];
			if (autoexecdataWrEnMaybe & ~(|ctrlStateReg))
				ABSTRACTAUTOReg_autoexecdata <= {10'h000, auto_dmi_in_a_bits_data[1:0]};
			if (COMMANDWrEn) begin
				COMMANDReg_cmdtype <= COMMANDWrDataVal[31:24];
				COMMANDReg_control <= COMMANDWrDataVal[23:0];
			end
			if (out_woready_1_818 & auto_tl_in_a_bits_mask[0])
				abstractDataMem_0 <= auto_tl_in_a_bits_data[7:0];
			else if (dmiAbstractDataWrEnMaybe_0 & ~(|ctrlStateReg))
				abstractDataMem_0 <= auto_dmi_in_a_bits_data[7:0];
			if (out_woready_1_818 & auto_tl_in_a_bits_mask[1])
				abstractDataMem_1 <= auto_tl_in_a_bits_data[15:8];
			else if (dmiAbstractDataWrEnMaybe_1 & ~(|ctrlStateReg))
				abstractDataMem_1 <= auto_dmi_in_a_bits_data[15:8];
			if (out_woready_1_818 & auto_tl_in_a_bits_mask[2])
				abstractDataMem_2 <= auto_tl_in_a_bits_data[23:16];
			else if (dmiAbstractDataWrEnMaybe_2 & ~(|ctrlStateReg))
				abstractDataMem_2 <= auto_dmi_in_a_bits_data[23:16];
			if (out_woready_1_818 & auto_tl_in_a_bits_mask[3])
				abstractDataMem_3 <= auto_tl_in_a_bits_data[31:24];
			else if (dmiAbstractDataWrEnMaybe_3 & ~(|ctrlStateReg))
				abstractDataMem_3 <= auto_dmi_in_a_bits_data[31:24];
			if (out_woready_1_818 & auto_tl_in_a_bits_mask[4])
				abstractDataMem_4 <= auto_tl_in_a_bits_data[39:32];
			else if (dmiAbstractDataWrEnMaybe_4 & ~(|ctrlStateReg))
				abstractDataMem_4 <= auto_dmi_in_a_bits_data[7:0];
			if (out_woready_1_818 & auto_tl_in_a_bits_mask[5])
				abstractDataMem_5 <= auto_tl_in_a_bits_data[47:40];
			else if (dmiAbstractDataWrEnMaybe_5 & ~(|ctrlStateReg))
				abstractDataMem_5 <= auto_dmi_in_a_bits_data[15:8];
			if (out_woready_1_818 & auto_tl_in_a_bits_mask[6])
				abstractDataMem_6 <= auto_tl_in_a_bits_data[55:48];
			else if (dmiAbstractDataWrEnMaybe_6 & ~(|ctrlStateReg))
				abstractDataMem_6 <= auto_dmi_in_a_bits_data[23:16];
			if (out_woready_1_818 & auto_tl_in_a_bits_mask[7])
				abstractDataMem_7 <= auto_tl_in_a_bits_data[63:56];
			else if (dmiAbstractDataWrEnMaybe_7 & ~(|ctrlStateReg))
				abstractDataMem_7 <= auto_dmi_in_a_bits_data[31:24];
			if (out_woready_1_922 & auto_tl_in_a_bits_mask[0])
				programBufferMem_0 <= auto_tl_in_a_bits_data[7:0];
			else if (dmiProgramBufferWrEnMaybe_0 & ~(|ctrlStateReg))
				programBufferMem_0 <= auto_dmi_in_a_bits_data[7:0];
			if (out_woready_1_922 & auto_tl_in_a_bits_mask[1])
				programBufferMem_1 <= auto_tl_in_a_bits_data[15:8];
			else if (dmiProgramBufferWrEnMaybe_1 & ~(|ctrlStateReg))
				programBufferMem_1 <= auto_dmi_in_a_bits_data[15:8];
			if (out_woready_1_922 & auto_tl_in_a_bits_mask[2])
				programBufferMem_2 <= auto_tl_in_a_bits_data[23:16];
			else if (dmiProgramBufferWrEnMaybe_2 & ~(|ctrlStateReg))
				programBufferMem_2 <= auto_dmi_in_a_bits_data[23:16];
			if (out_woready_1_922 & auto_tl_in_a_bits_mask[3])
				programBufferMem_3 <= auto_tl_in_a_bits_data[31:24];
			else if (dmiProgramBufferWrEnMaybe_3 & ~(|ctrlStateReg))
				programBufferMem_3 <= auto_dmi_in_a_bits_data[31:24];
			if (out_woready_1_922 & auto_tl_in_a_bits_mask[4])
				programBufferMem_4 <= auto_tl_in_a_bits_data[39:32];
			else if (dmiProgramBufferWrEnMaybe_4 & ~(|ctrlStateReg))
				programBufferMem_4 <= auto_dmi_in_a_bits_data[7:0];
			if (out_woready_1_922 & auto_tl_in_a_bits_mask[5])
				programBufferMem_5 <= auto_tl_in_a_bits_data[47:40];
			else if (dmiProgramBufferWrEnMaybe_5 & ~(|ctrlStateReg))
				programBufferMem_5 <= auto_dmi_in_a_bits_data[15:8];
			if (out_woready_1_922 & auto_tl_in_a_bits_mask[6])
				programBufferMem_6 <= auto_tl_in_a_bits_data[55:48];
			else if (dmiProgramBufferWrEnMaybe_6 & ~(|ctrlStateReg))
				programBufferMem_6 <= auto_dmi_in_a_bits_data[23:16];
			if (out_woready_1_922 & auto_tl_in_a_bits_mask[7])
				programBufferMem_7 <= auto_tl_in_a_bits_data[63:56];
			else if (dmiProgramBufferWrEnMaybe_7 & ~(|ctrlStateReg))
				programBufferMem_7 <= auto_dmi_in_a_bits_data[31:24];
			if (out_woready_1_510 & auto_tl_in_a_bits_mask[0])
				programBufferMem_8 <= auto_tl_in_a_bits_data[7:0];
			else if (dmiProgramBufferWrEnMaybe_8 & ~(|ctrlStateReg))
				programBufferMem_8 <= auto_dmi_in_a_bits_data[7:0];
			if (out_woready_1_510 & auto_tl_in_a_bits_mask[1])
				programBufferMem_9 <= auto_tl_in_a_bits_data[15:8];
			else if (dmiProgramBufferWrEnMaybe_9 & ~(|ctrlStateReg))
				programBufferMem_9 <= auto_dmi_in_a_bits_data[15:8];
			if (out_woready_1_510 & auto_tl_in_a_bits_mask[2])
				programBufferMem_10 <= auto_tl_in_a_bits_data[23:16];
			else if (dmiProgramBufferWrEnMaybe_10 & ~(|ctrlStateReg))
				programBufferMem_10 <= auto_dmi_in_a_bits_data[23:16];
			if (out_woready_1_510 & auto_tl_in_a_bits_mask[3])
				programBufferMem_11 <= auto_tl_in_a_bits_data[31:24];
			else if (dmiProgramBufferWrEnMaybe_11 & ~(|ctrlStateReg))
				programBufferMem_11 <= auto_dmi_in_a_bits_data[31:24];
			if (out_woready_1_510 & auto_tl_in_a_bits_mask[4])
				programBufferMem_12 <= auto_tl_in_a_bits_data[39:32];
			else if (dmiProgramBufferWrEnMaybe_12 & ~(|ctrlStateReg))
				programBufferMem_12 <= auto_dmi_in_a_bits_data[7:0];
			if (out_woready_1_510 & auto_tl_in_a_bits_mask[5])
				programBufferMem_13 <= auto_tl_in_a_bits_data[47:40];
			else if (dmiProgramBufferWrEnMaybe_13 & ~(|ctrlStateReg))
				programBufferMem_13 <= auto_dmi_in_a_bits_data[15:8];
			if (out_woready_1_510 & auto_tl_in_a_bits_mask[6])
				programBufferMem_14 <= auto_tl_in_a_bits_data[55:48];
			else if (dmiProgramBufferWrEnMaybe_14 & ~(|ctrlStateReg))
				programBufferMem_14 <= auto_dmi_in_a_bits_data[23:16];
			if (out_woready_1_510 & auto_tl_in_a_bits_mask[7])
				programBufferMem_15 <= auto_tl_in_a_bits_data[63:56];
			else if (dmiProgramBufferWrEnMaybe_15 & ~(|ctrlStateReg))
				programBufferMem_15 <= auto_dmi_in_a_bits_data[31:24];
			if (out_woready_1_191 & auto_tl_in_a_bits_mask[0])
				programBufferMem_16 <= auto_tl_in_a_bits_data[7:0];
			else if (dmiProgramBufferWrEnMaybe_16 & ~(|ctrlStateReg))
				programBufferMem_16 <= auto_dmi_in_a_bits_data[7:0];
			if (out_woready_1_191 & auto_tl_in_a_bits_mask[1])
				programBufferMem_17 <= auto_tl_in_a_bits_data[15:8];
			else if (dmiProgramBufferWrEnMaybe_17 & ~(|ctrlStateReg))
				programBufferMem_17 <= auto_dmi_in_a_bits_data[15:8];
			if (out_woready_1_191 & auto_tl_in_a_bits_mask[2])
				programBufferMem_18 <= auto_tl_in_a_bits_data[23:16];
			else if (dmiProgramBufferWrEnMaybe_18 & ~(|ctrlStateReg))
				programBufferMem_18 <= auto_dmi_in_a_bits_data[23:16];
			if (out_woready_1_191 & auto_tl_in_a_bits_mask[3])
				programBufferMem_19 <= auto_tl_in_a_bits_data[31:24];
			else if (dmiProgramBufferWrEnMaybe_19 & ~(|ctrlStateReg))
				programBufferMem_19 <= auto_dmi_in_a_bits_data[31:24];
			if (out_woready_1_191 & auto_tl_in_a_bits_mask[4])
				programBufferMem_20 <= auto_tl_in_a_bits_data[39:32];
			else if (dmiProgramBufferWrEnMaybe_20 & ~(|ctrlStateReg))
				programBufferMem_20 <= auto_dmi_in_a_bits_data[7:0];
			if (out_woready_1_191 & auto_tl_in_a_bits_mask[5])
				programBufferMem_21 <= auto_tl_in_a_bits_data[47:40];
			else if (dmiProgramBufferWrEnMaybe_21 & ~(|ctrlStateReg))
				programBufferMem_21 <= auto_dmi_in_a_bits_data[15:8];
			if (out_woready_1_191 & auto_tl_in_a_bits_mask[6])
				programBufferMem_22 <= auto_tl_in_a_bits_data[55:48];
			else if (dmiProgramBufferWrEnMaybe_22 & ~(|ctrlStateReg))
				programBufferMem_22 <= auto_dmi_in_a_bits_data[23:16];
			if (out_woready_1_191 & auto_tl_in_a_bits_mask[7])
				programBufferMem_23 <= auto_tl_in_a_bits_data[63:56];
			else if (dmiProgramBufferWrEnMaybe_23 & ~(|ctrlStateReg))
				programBufferMem_23 <= auto_dmi_in_a_bits_data[31:24];
			if (out_woready_1_1074 & auto_tl_in_a_bits_mask[0])
				programBufferMem_24 <= auto_tl_in_a_bits_data[7:0];
			else if (dmiProgramBufferWrEnMaybe_24 & ~(|ctrlStateReg))
				programBufferMem_24 <= auto_dmi_in_a_bits_data[7:0];
			if (out_woready_1_1074 & auto_tl_in_a_bits_mask[1])
				programBufferMem_25 <= auto_tl_in_a_bits_data[15:8];
			else if (dmiProgramBufferWrEnMaybe_25 & ~(|ctrlStateReg))
				programBufferMem_25 <= auto_dmi_in_a_bits_data[15:8];
			if (out_woready_1_1074 & auto_tl_in_a_bits_mask[2])
				programBufferMem_26 <= auto_tl_in_a_bits_data[23:16];
			else if (dmiProgramBufferWrEnMaybe_26 & ~(|ctrlStateReg))
				programBufferMem_26 <= auto_dmi_in_a_bits_data[23:16];
			if (out_woready_1_1074 & auto_tl_in_a_bits_mask[3])
				programBufferMem_27 <= auto_tl_in_a_bits_data[31:24];
			else if (dmiProgramBufferWrEnMaybe_27 & ~(|ctrlStateReg))
				programBufferMem_27 <= auto_dmi_in_a_bits_data[31:24];
			if (out_woready_1_1074 & auto_tl_in_a_bits_mask[4])
				programBufferMem_28 <= auto_tl_in_a_bits_data[39:32];
			else if (dmiProgramBufferWrEnMaybe_28 & ~(|ctrlStateReg))
				programBufferMem_28 <= auto_dmi_in_a_bits_data[7:0];
			if (out_woready_1_1074 & auto_tl_in_a_bits_mask[5])
				programBufferMem_29 <= auto_tl_in_a_bits_data[47:40];
			else if (dmiProgramBufferWrEnMaybe_29 & ~(|ctrlStateReg))
				programBufferMem_29 <= auto_dmi_in_a_bits_data[15:8];
			if (out_woready_1_1074 & auto_tl_in_a_bits_mask[6])
				programBufferMem_30 <= auto_tl_in_a_bits_data[55:48];
			else if (dmiProgramBufferWrEnMaybe_30 & ~(|ctrlStateReg))
				programBufferMem_30 <= auto_dmi_in_a_bits_data[23:16];
			if (out_woready_1_1074 & auto_tl_in_a_bits_mask[7])
				programBufferMem_31 <= auto_tl_in_a_bits_data[63:56];
			else if (dmiProgramBufferWrEnMaybe_31 & ~(|ctrlStateReg))
				programBufferMem_31 <= auto_dmi_in_a_bits_data[31:24];
			if (out_woready_1_722 & auto_tl_in_a_bits_mask[0])
				programBufferMem_32 <= auto_tl_in_a_bits_data[7:0];
			else if (dmiProgramBufferWrEnMaybe_32 & ~(|ctrlStateReg))
				programBufferMem_32 <= auto_dmi_in_a_bits_data[7:0];
			if (out_woready_1_722 & auto_tl_in_a_bits_mask[1])
				programBufferMem_33 <= auto_tl_in_a_bits_data[15:8];
			else if (dmiProgramBufferWrEnMaybe_33 & ~(|ctrlStateReg))
				programBufferMem_33 <= auto_dmi_in_a_bits_data[15:8];
			if (out_woready_1_722 & auto_tl_in_a_bits_mask[2])
				programBufferMem_34 <= auto_tl_in_a_bits_data[23:16];
			else if (dmiProgramBufferWrEnMaybe_34 & ~(|ctrlStateReg))
				programBufferMem_34 <= auto_dmi_in_a_bits_data[23:16];
			if (out_woready_1_722 & auto_tl_in_a_bits_mask[3])
				programBufferMem_35 <= auto_tl_in_a_bits_data[31:24];
			else if (dmiProgramBufferWrEnMaybe_35 & ~(|ctrlStateReg))
				programBufferMem_35 <= auto_dmi_in_a_bits_data[31:24];
			if (out_woready_1_722 & auto_tl_in_a_bits_mask[4])
				programBufferMem_36 <= auto_tl_in_a_bits_data[39:32];
			else if (dmiProgramBufferWrEnMaybe_36 & ~(|ctrlStateReg))
				programBufferMem_36 <= auto_dmi_in_a_bits_data[7:0];
			if (out_woready_1_722 & auto_tl_in_a_bits_mask[5])
				programBufferMem_37 <= auto_tl_in_a_bits_data[47:40];
			else if (dmiProgramBufferWrEnMaybe_37 & ~(|ctrlStateReg))
				programBufferMem_37 <= auto_dmi_in_a_bits_data[15:8];
			if (out_woready_1_722 & auto_tl_in_a_bits_mask[6])
				programBufferMem_38 <= auto_tl_in_a_bits_data[55:48];
			else if (dmiProgramBufferWrEnMaybe_38 & ~(|ctrlStateReg))
				programBufferMem_38 <= auto_dmi_in_a_bits_data[23:16];
			if (out_woready_1_722 & auto_tl_in_a_bits_mask[7])
				programBufferMem_39 <= auto_tl_in_a_bits_data[63:56];
			else if (dmiProgramBufferWrEnMaybe_39 & ~(|ctrlStateReg))
				programBufferMem_39 <= auto_dmi_in_a_bits_data[31:24];
			if (out_woready_1_442 & auto_tl_in_a_bits_mask[0])
				programBufferMem_40 <= auto_tl_in_a_bits_data[7:0];
			else if (dmiProgramBufferWrEnMaybe_40 & ~(|ctrlStateReg))
				programBufferMem_40 <= auto_dmi_in_a_bits_data[7:0];
			if (out_woready_1_442 & auto_tl_in_a_bits_mask[1])
				programBufferMem_41 <= auto_tl_in_a_bits_data[15:8];
			else if (dmiProgramBufferWrEnMaybe_41 & ~(|ctrlStateReg))
				programBufferMem_41 <= auto_dmi_in_a_bits_data[15:8];
			if (out_woready_1_442 & auto_tl_in_a_bits_mask[2])
				programBufferMem_42 <= auto_tl_in_a_bits_data[23:16];
			else if (dmiProgramBufferWrEnMaybe_42 & ~(|ctrlStateReg))
				programBufferMem_42 <= auto_dmi_in_a_bits_data[23:16];
			if (out_woready_1_442 & auto_tl_in_a_bits_mask[3])
				programBufferMem_43 <= auto_tl_in_a_bits_data[31:24];
			else if (dmiProgramBufferWrEnMaybe_43 & ~(|ctrlStateReg))
				programBufferMem_43 <= auto_dmi_in_a_bits_data[31:24];
			if (out_woready_1_442 & auto_tl_in_a_bits_mask[4])
				programBufferMem_44 <= auto_tl_in_a_bits_data[39:32];
			else if (dmiProgramBufferWrEnMaybe_44 & ~(|ctrlStateReg))
				programBufferMem_44 <= auto_dmi_in_a_bits_data[7:0];
			if (out_woready_1_442 & auto_tl_in_a_bits_mask[5])
				programBufferMem_45 <= auto_tl_in_a_bits_data[47:40];
			else if (dmiProgramBufferWrEnMaybe_45 & ~(|ctrlStateReg))
				programBufferMem_45 <= auto_dmi_in_a_bits_data[15:8];
			if (out_woready_1_442 & auto_tl_in_a_bits_mask[6])
				programBufferMem_46 <= auto_tl_in_a_bits_data[55:48];
			else if (dmiProgramBufferWrEnMaybe_46 & ~(|ctrlStateReg))
				programBufferMem_46 <= auto_dmi_in_a_bits_data[23:16];
			if (out_woready_1_442 & auto_tl_in_a_bits_mask[7])
				programBufferMem_47 <= auto_tl_in_a_bits_data[63:56];
			else if (dmiProgramBufferWrEnMaybe_47 & ~(|ctrlStateReg))
				programBufferMem_47 <= auto_dmi_in_a_bits_data[31:24];
			if (out_woready_1_111 & auto_tl_in_a_bits_mask[0])
				programBufferMem_48 <= auto_tl_in_a_bits_data[7:0];
			else if (dmiProgramBufferWrEnMaybe_48 & ~(|ctrlStateReg))
				programBufferMem_48 <= auto_dmi_in_a_bits_data[7:0];
			if (out_woready_1_111 & auto_tl_in_a_bits_mask[1])
				programBufferMem_49 <= auto_tl_in_a_bits_data[15:8];
			else if (dmiProgramBufferWrEnMaybe_49 & ~(|ctrlStateReg))
				programBufferMem_49 <= auto_dmi_in_a_bits_data[15:8];
			if (out_woready_1_111 & auto_tl_in_a_bits_mask[2])
				programBufferMem_50 <= auto_tl_in_a_bits_data[23:16];
			else if (dmiProgramBufferWrEnMaybe_50 & ~(|ctrlStateReg))
				programBufferMem_50 <= auto_dmi_in_a_bits_data[23:16];
			if (out_woready_1_111 & auto_tl_in_a_bits_mask[3])
				programBufferMem_51 <= auto_tl_in_a_bits_data[31:24];
			else if (dmiProgramBufferWrEnMaybe_51 & ~(|ctrlStateReg))
				programBufferMem_51 <= auto_dmi_in_a_bits_data[31:24];
			if (out_woready_1_111 & auto_tl_in_a_bits_mask[4])
				programBufferMem_52 <= auto_tl_in_a_bits_data[39:32];
			else if (dmiProgramBufferWrEnMaybe_52 & ~(|ctrlStateReg))
				programBufferMem_52 <= auto_dmi_in_a_bits_data[7:0];
			if (out_woready_1_111 & auto_tl_in_a_bits_mask[5])
				programBufferMem_53 <= auto_tl_in_a_bits_data[47:40];
			else if (dmiProgramBufferWrEnMaybe_53 & ~(|ctrlStateReg))
				programBufferMem_53 <= auto_dmi_in_a_bits_data[15:8];
			if (out_woready_1_111 & auto_tl_in_a_bits_mask[6])
				programBufferMem_54 <= auto_tl_in_a_bits_data[55:48];
			else if (dmiProgramBufferWrEnMaybe_54 & ~(|ctrlStateReg))
				programBufferMem_54 <= auto_dmi_in_a_bits_data[23:16];
			if (out_woready_1_111 & auto_tl_in_a_bits_mask[7])
				programBufferMem_55 <= auto_tl_in_a_bits_data[63:56];
			else if (dmiProgramBufferWrEnMaybe_55 & ~(|ctrlStateReg))
				programBufferMem_55 <= auto_dmi_in_a_bits_data[31:24];
			if (out_woready_1_1146 & auto_tl_in_a_bits_mask[0])
				programBufferMem_56 <= auto_tl_in_a_bits_data[7:0];
			else if (dmiProgramBufferWrEnMaybe_56 & ~(|ctrlStateReg))
				programBufferMem_56 <= auto_dmi_in_a_bits_data[7:0];
			if (out_woready_1_1146 & auto_tl_in_a_bits_mask[1])
				programBufferMem_57 <= auto_tl_in_a_bits_data[15:8];
			else if (dmiProgramBufferWrEnMaybe_57 & ~(|ctrlStateReg))
				programBufferMem_57 <= auto_dmi_in_a_bits_data[15:8];
			if (out_woready_1_1146 & auto_tl_in_a_bits_mask[2])
				programBufferMem_58 <= auto_tl_in_a_bits_data[23:16];
			else if (dmiProgramBufferWrEnMaybe_58 & ~(|ctrlStateReg))
				programBufferMem_58 <= auto_dmi_in_a_bits_data[23:16];
			if (out_woready_1_1146 & auto_tl_in_a_bits_mask[3])
				programBufferMem_59 <= auto_tl_in_a_bits_data[31:24];
			else if (dmiProgramBufferWrEnMaybe_59 & ~(|ctrlStateReg))
				programBufferMem_59 <= auto_dmi_in_a_bits_data[31:24];
			if (out_woready_1_1146 & auto_tl_in_a_bits_mask[4])
				programBufferMem_60 <= auto_tl_in_a_bits_data[39:32];
			else if (dmiProgramBufferWrEnMaybe_60 & ~(|ctrlStateReg))
				programBufferMem_60 <= auto_dmi_in_a_bits_data[7:0];
			if (out_woready_1_1146 & auto_tl_in_a_bits_mask[5])
				programBufferMem_61 <= auto_tl_in_a_bits_data[47:40];
			else if (dmiProgramBufferWrEnMaybe_61 & ~(|ctrlStateReg))
				programBufferMem_61 <= auto_dmi_in_a_bits_data[15:8];
			if (out_woready_1_1146 & auto_tl_in_a_bits_mask[6])
				programBufferMem_62 <= auto_tl_in_a_bits_data[55:48];
			else if (dmiProgramBufferWrEnMaybe_62 & ~(|ctrlStateReg))
				programBufferMem_62 <= auto_dmi_in_a_bits_data[23:16];
			if (out_woready_1_1146 & auto_tl_in_a_bits_mask[7])
				programBufferMem_63 <= auto_tl_in_a_bits_data[63:56];
			else if (dmiProgramBufferWrEnMaybe_63 & ~(|ctrlStateReg))
				programBufferMem_63 <= auto_dmi_in_a_bits_data[31:24];
			if (|ctrlStateReg) begin
				if (_GEN_6)
					ctrlStateReg <= {~_GEN_7, 1'h0};
				else if (_GEN_8 & (hartExceptionWrEn | (~goReg & hartHaltedWrEn)))
					ctrlStateReg <= 2'h0;
			end
			else if (_GEN_10)
				ctrlStateReg <= 2'h1;
		end
		else begin
			ABSTRACTCSReg_cmderr <= 3'h0;
			ABSTRACTAUTOReg_autoexecprogbuf <= 16'h0000;
			ABSTRACTAUTOReg_autoexecdata <= 12'h000;
			COMMANDReg_cmdtype <= 8'h00;
			COMMANDReg_control <= 24'h000000;
			abstractDataMem_0 <= 8'h00;
			abstractDataMem_1 <= 8'h00;
			abstractDataMem_2 <= 8'h00;
			abstractDataMem_3 <= 8'h00;
			abstractDataMem_4 <= 8'h00;
			abstractDataMem_5 <= 8'h00;
			abstractDataMem_6 <= 8'h00;
			abstractDataMem_7 <= 8'h00;
			programBufferMem_0 <= 8'h00;
			programBufferMem_1 <= 8'h00;
			programBufferMem_2 <= 8'h00;
			programBufferMem_3 <= 8'h00;
			programBufferMem_4 <= 8'h00;
			programBufferMem_5 <= 8'h00;
			programBufferMem_6 <= 8'h00;
			programBufferMem_7 <= 8'h00;
			programBufferMem_8 <= 8'h00;
			programBufferMem_9 <= 8'h00;
			programBufferMem_10 <= 8'h00;
			programBufferMem_11 <= 8'h00;
			programBufferMem_12 <= 8'h00;
			programBufferMem_13 <= 8'h00;
			programBufferMem_14 <= 8'h00;
			programBufferMem_15 <= 8'h00;
			programBufferMem_16 <= 8'h00;
			programBufferMem_17 <= 8'h00;
			programBufferMem_18 <= 8'h00;
			programBufferMem_19 <= 8'h00;
			programBufferMem_20 <= 8'h00;
			programBufferMem_21 <= 8'h00;
			programBufferMem_22 <= 8'h00;
			programBufferMem_23 <= 8'h00;
			programBufferMem_24 <= 8'h00;
			programBufferMem_25 <= 8'h00;
			programBufferMem_26 <= 8'h00;
			programBufferMem_27 <= 8'h00;
			programBufferMem_28 <= 8'h00;
			programBufferMem_29 <= 8'h00;
			programBufferMem_30 <= 8'h00;
			programBufferMem_31 <= 8'h00;
			programBufferMem_32 <= 8'h00;
			programBufferMem_33 <= 8'h00;
			programBufferMem_34 <= 8'h00;
			programBufferMem_35 <= 8'h00;
			programBufferMem_36 <= 8'h00;
			programBufferMem_37 <= 8'h00;
			programBufferMem_38 <= 8'h00;
			programBufferMem_39 <= 8'h00;
			programBufferMem_40 <= 8'h00;
			programBufferMem_41 <= 8'h00;
			programBufferMem_42 <= 8'h00;
			programBufferMem_43 <= 8'h00;
			programBufferMem_44 <= 8'h00;
			programBufferMem_45 <= 8'h00;
			programBufferMem_46 <= 8'h00;
			programBufferMem_47 <= 8'h00;
			programBufferMem_48 <= 8'h00;
			programBufferMem_49 <= 8'h00;
			programBufferMem_50 <= 8'h00;
			programBufferMem_51 <= 8'h00;
			programBufferMem_52 <= 8'h00;
			programBufferMem_53 <= 8'h00;
			programBufferMem_54 <= 8'h00;
			programBufferMem_55 <= 8'h00;
			programBufferMem_56 <= 8'h00;
			programBufferMem_57 <= 8'h00;
			programBufferMem_58 <= 8'h00;
			programBufferMem_59 <= 8'h00;
			programBufferMem_60 <= 8'h00;
			programBufferMem_61 <= 8'h00;
			programBufferMem_62 <= 8'h00;
			programBufferMem_63 <= 8'h00;
			ctrlStateReg <= 2'h0;
		end
		goReg <= io_dmactive & (goAbstract | (~hartGoingWrEn & goReg));
		if (goAbstract) begin
			abstractGeneratedMem_0 <= (COMMANDReg_control[17] ? (COMMANDReg_control[16] ? {17'h07000, COMMANDReg_control[22:20], COMMANDReg_control[4:0], 7'h03} : {7'h1c, COMMANDReg_control[4:0], 5'h00, COMMANDReg_control[22:20], 12'h023}) : 32'h00000013);
			abstractGeneratedMem_1 <= (COMMANDReg_control[18] ? 32'h00000013 : 32'h00100073);
		end
		if (reset)
			hrmaskReg_0 <= 1'h0;
		else
			hrmaskReg_0 <= io_dmactive & (io_innerCtrl_valid ? io_innerCtrl_bits_hrmask_0 : hrmaskReg_0);
	end
	always @(posedge clock or posedge reset)
		if (reset)
			hrDebugIntReg_0 <= 1'h0;
		else
			hrDebugIntReg_0 <= (io_dmactive & hrmaskReg_0) & (_hartIsInResetSync_0_debug_hartReset_0_io_q | (hrDebugIntReg_0 & ~hartHalted));
	TLMonitor_35 monitor(
		.clock(clock),
		.reset(reset),
		.io_in_a_ready(auto_dmi_in_d_ready),
		.io_in_a_valid(auto_dmi_in_a_valid),
		.io_in_a_bits_opcode(auto_dmi_in_a_bits_opcode),
		.io_in_a_bits_param(auto_dmi_in_a_bits_param),
		.io_in_a_bits_size(auto_dmi_in_a_bits_size),
		.io_in_a_bits_source(auto_dmi_in_a_bits_source),
		.io_in_a_bits_address(auto_dmi_in_a_bits_address),
		.io_in_a_bits_mask(auto_dmi_in_a_bits_mask),
		.io_in_a_bits_corrupt(auto_dmi_in_a_bits_corrupt),
		.io_in_d_ready(auto_dmi_in_d_ready),
		.io_in_d_valid(auto_dmi_in_a_valid),
		.io_in_d_bits_opcode(dmiNodeIn_d_bits_opcode),
		.io_in_d_bits_size(auto_dmi_in_a_bits_size),
		.io_in_d_bits_source(auto_dmi_in_a_bits_source)
	);
	TLMonitor_36 monitor_1(
		.clock(clock),
		.reset(reset),
		.io_in_a_ready(auto_tl_in_d_ready),
		.io_in_a_valid(auto_tl_in_a_valid),
		.io_in_a_bits_opcode(auto_tl_in_a_bits_opcode),
		.io_in_a_bits_param(auto_tl_in_a_bits_param),
		.io_in_a_bits_size(auto_tl_in_a_bits_size),
		.io_in_a_bits_source(auto_tl_in_a_bits_source),
		.io_in_a_bits_address(auto_tl_in_a_bits_address),
		.io_in_a_bits_mask(auto_tl_in_a_bits_mask),
		.io_in_a_bits_corrupt(auto_tl_in_a_bits_corrupt),
		.io_in_d_ready(auto_tl_in_d_ready),
		.io_in_d_valid(auto_tl_in_a_valid),
		.io_in_d_bits_opcode(tlNodeIn_d_bits_opcode),
		.io_in_d_bits_size(auto_tl_in_a_bits_size),
		.io_in_d_bits_source(auto_tl_in_a_bits_source)
	);
	AsyncResetSynchronizerShiftReg_w1_d3_i0 hartIsInResetSync_0_debug_hartReset_0(
		.clock(clock),
		.reset(reset),
		.io_d(io_hartIsInReset_0),
		.io_q(_hartIsInResetSync_0_debug_hartReset_0_io_q)
	);
	assign auto_tl_in_a_ready = auto_tl_in_d_ready;
	assign auto_tl_in_d_valid = auto_tl_in_a_valid;
	assign auto_tl_in_d_bits_opcode = tlNodeIn_d_bits_opcode;
	assign auto_tl_in_d_bits_size = auto_tl_in_a_bits_size;
	assign auto_tl_in_d_bits_source = auto_tl_in_a_bits_source;
	assign auto_tl_in_d_bits_data = (_GEN_3[auto_tl_in_a_bits_address[10:3]] ? _GEN_4[auto_tl_in_a_bits_address[10:3] * 64+:64] : 64'h0000000000000000);
	assign auto_dmi_in_a_ready = auto_dmi_in_d_ready;
	assign auto_dmi_in_d_valid = auto_dmi_in_a_valid;
	assign auto_dmi_in_d_bits_opcode = dmiNodeIn_d_bits_opcode;
	assign auto_dmi_in_d_bits_size = auto_dmi_in_a_bits_size;
	assign auto_dmi_in_d_bits_source = auto_dmi_in_a_bits_source;
	assign auto_dmi_in_d_bits_data = (_GEN_1[out_oindex] ? _GEN_2[out_oindex * 32+:32] : 32'h00000000);
	assign io_hgDebugInt_0 = hrDebugIntReg_0;
endmodule
