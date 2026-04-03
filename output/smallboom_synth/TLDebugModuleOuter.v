module TLDebugModuleOuter (
	clock,
	reset,
	auto_dmi_in_a_ready,
	auto_dmi_in_a_valid,
	auto_dmi_in_a_bits_opcode,
	auto_dmi_in_a_bits_address,
	auto_dmi_in_a_bits_data,
	auto_dmi_in_d_ready,
	auto_dmi_in_d_valid,
	auto_dmi_in_d_bits_opcode,
	auto_dmi_in_d_bits_data,
	auto_int_out_0,
	io_ctrl_ndreset,
	io_ctrl_dmactive,
	io_ctrl_dmactiveAck,
	io_innerCtrl_ready,
	io_innerCtrl_valid,
	io_innerCtrl_bits_resumereq,
	io_innerCtrl_bits_hartsel,
	io_innerCtrl_bits_ackhavereset,
	io_innerCtrl_bits_hrmask_0,
	io_hgDebugInt_0
);
	input clock;
	input reset;
	output wire auto_dmi_in_a_ready;
	input auto_dmi_in_a_valid;
	input [2:0] auto_dmi_in_a_bits_opcode;
	input [6:0] auto_dmi_in_a_bits_address;
	input [31:0] auto_dmi_in_a_bits_data;
	input auto_dmi_in_d_ready;
	output wire auto_dmi_in_d_valid;
	output wire [2:0] auto_dmi_in_d_bits_opcode;
	output wire [31:0] auto_dmi_in_d_bits_data;
	output wire auto_int_out_0;
	output wire io_ctrl_ndreset;
	output wire io_ctrl_dmactive;
	input io_ctrl_dmactiveAck;
	input io_innerCtrl_ready;
	output wire io_innerCtrl_valid;
	output wire io_innerCtrl_bits_resumereq;
	output wire [9:0] io_innerCtrl_bits_hartsel;
	output wire io_innerCtrl_bits_ackhavereset;
	output wire io_innerCtrl_bits_hrmask_0;
	input io_hgDebugInt_0;
	wire out_woready_9;
	wire DMCONTROLWrData_setresethaltreq;
	wire DMCONTROLWrData_clrresethaltreq;
	reg DMCONTROLReg_haltreq;
	reg [9:0] DMCONTROLReg_hartsello;
	reg DMCONTROLReg_ndmreset;
	reg DMCONTROLReg_dmactive;
	reg hrmaskReg_0;
	wire _GEN = DMCONTROLReg_hartsello == 10'h000;
	wire hrmaskNxt_0 = ~(~DMCONTROLReg_dmactive | ((out_woready_9 & DMCONTROLWrData_clrresethaltreq) & _GEN)) & (((out_woready_9 & DMCONTROLWrData_setresethaltreq) & _GEN) | hrmaskReg_0);
	wire in_bits_read = auto_dmi_in_a_bits_opcode == 3'h4;
	wire _out_T_3 = {auto_dmi_in_a_bits_address[4], auto_dmi_in_a_bits_address[2]} == 2'h0;
	assign DMCONTROLWrData_clrresethaltreq = auto_dmi_in_a_bits_data[2];
	assign DMCONTROLWrData_setresethaltreq = auto_dmi_in_a_bits_data[3];
	assign out_woready_9 = (((auto_dmi_in_a_valid & auto_dmi_in_d_ready) & ~in_bits_read) & ~auto_dmi_in_a_bits_address[3]) & _out_T_3;
	wire [2:0] dmiNodeIn_d_bits_opcode = {2'h0, in_bits_read};
	reg debugIntRegs_0;
	reg innerCtrlValidReg;
	reg innerCtrlResumeReqReg;
	reg innerCtrlAckHaveResetReg;
	wire io_innerCtrl_valid_0 = out_woready_9 | innerCtrlValidReg;
	wire io_innerCtrl_bits_resumereq_0 = (out_woready_9 & auto_dmi_in_a_bits_data[30]) | innerCtrlResumeReqReg;
	wire io_innerCtrl_bits_ackhavereset_0 = (out_woready_9 & auto_dmi_in_a_bits_data[28]) | innerCtrlAckHaveResetReg;
	always @(posedge clock or posedge reset)
		if (reset) begin
			DMCONTROLReg_haltreq <= 1'h0;
			DMCONTROLReg_hartsello <= 10'h000;
			DMCONTROLReg_ndmreset <= 1'h0;
			DMCONTROLReg_dmactive <= 1'h0;
			hrmaskReg_0 <= 1'h0;
			debugIntRegs_0 <= 1'h0;
			innerCtrlValidReg <= 1'h0;
			innerCtrlResumeReqReg <= 1'h0;
			innerCtrlAckHaveResetReg <= 1'h0;
		end
		else begin
			DMCONTROLReg_haltreq <= DMCONTROLReg_dmactive & (out_woready_9 ? auto_dmi_in_a_bits_data[31] : DMCONTROLReg_haltreq);
			if (DMCONTROLReg_dmactive)
				;
			else
				DMCONTROLReg_hartsello <= 10'h000;
			DMCONTROLReg_ndmreset <= DMCONTROLReg_dmactive & (out_woready_9 ? auto_dmi_in_a_bits_data[1] : DMCONTROLReg_ndmreset);
			if (out_woready_9)
				DMCONTROLReg_dmactive <= auto_dmi_in_a_bits_data[0];
			hrmaskReg_0 <= hrmaskNxt_0;
			debugIntRegs_0 <= DMCONTROLReg_dmactive & (out_woready_9 ? auto_dmi_in_a_bits_data[31] : debugIntRegs_0);
			innerCtrlValidReg <= io_innerCtrl_valid_0 & ~io_innerCtrl_ready;
			innerCtrlResumeReqReg <= io_innerCtrl_bits_resumereq_0 & ~io_innerCtrl_ready;
			innerCtrlAckHaveResetReg <= io_innerCtrl_bits_ackhavereset_0 & ~io_innerCtrl_ready;
		end
	TLMonitor_31 monitor(
		.clock(clock),
		.reset(reset),
		.io_in_a_ready(auto_dmi_in_d_ready),
		.io_in_a_valid(auto_dmi_in_a_valid),
		.io_in_a_bits_opcode(auto_dmi_in_a_bits_opcode),
		.io_in_a_bits_address(auto_dmi_in_a_bits_address),
		.io_in_d_ready(auto_dmi_in_d_ready),
		.io_in_d_valid(auto_dmi_in_a_valid),
		.io_in_d_bits_opcode(dmiNodeIn_d_bits_opcode)
	);
	assign auto_dmi_in_a_ready = auto_dmi_in_d_ready;
	assign auto_dmi_in_d_valid = auto_dmi_in_a_valid;
	assign auto_dmi_in_d_bits_opcode = dmiNodeIn_d_bits_opcode;
	assign auto_dmi_in_d_bits_data = (_out_T_3 ? (auto_dmi_in_a_bits_address[3] ? 32'h00112380 : {DMCONTROLReg_haltreq, 29'h00000000, DMCONTROLReg_ndmreset, DMCONTROLReg_dmactive & io_ctrl_dmactiveAck}) : 32'h00000000);
	assign auto_int_out_0 = debugIntRegs_0 | io_hgDebugInt_0;
	assign io_ctrl_ndreset = DMCONTROLReg_ndmreset;
	assign io_ctrl_dmactive = DMCONTROLReg_dmactive;
	assign io_innerCtrl_valid = io_innerCtrl_valid_0;
	assign io_innerCtrl_bits_resumereq = io_innerCtrl_bits_resumereq_0;
	assign io_innerCtrl_bits_hartsel = DMCONTROLReg_hartsello;
	assign io_innerCtrl_bits_ackhavereset = io_innerCtrl_bits_ackhavereset_0;
	assign io_innerCtrl_bits_hrmask_0 = hrmaskNxt_0;
endmodule
