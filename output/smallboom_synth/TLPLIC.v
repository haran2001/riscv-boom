module TLPLIC (
	clock,
	reset,
	auto_int_in_0,
	auto_int_in_1,
	auto_int_out_1_0,
	auto_int_out_0_0,
	auto_in_a_ready,
	auto_in_a_valid,
	auto_in_a_bits_opcode,
	auto_in_a_bits_param,
	auto_in_a_bits_size,
	auto_in_a_bits_source,
	auto_in_a_bits_address,
	auto_in_a_bits_mask,
	auto_in_a_bits_data,
	auto_in_a_bits_corrupt,
	auto_in_d_ready,
	auto_in_d_valid,
	auto_in_d_bits_opcode,
	auto_in_d_bits_size,
	auto_in_d_bits_source,
	auto_in_d_bits_data
);
	input clock;
	input reset;
	input auto_int_in_0;
	input auto_int_in_1;
	output wire auto_int_out_1_0;
	output wire auto_int_out_0_0;
	output wire auto_in_a_ready;
	input auto_in_a_valid;
	input [2:0] auto_in_a_bits_opcode;
	input [2:0] auto_in_a_bits_param;
	input [1:0] auto_in_a_bits_size;
	input [8:0] auto_in_a_bits_source;
	input [27:0] auto_in_a_bits_address;
	input [7:0] auto_in_a_bits_mask;
	input [63:0] auto_in_a_bits_data;
	input auto_in_a_bits_corrupt;
	input auto_in_d_ready;
	output wire auto_in_d_valid;
	output wire [2:0] auto_in_d_bits_opcode;
	output wire [1:0] auto_in_d_bits_size;
	output wire [8:0] auto_in_d_bits_source;
	output wire [63:0] auto_in_d_bits_data;
	wire out_woready_8;
	wire out_woready_9;
	wire _out_rofireMux_T_1;
	wire out_backSel_20;
	wire out_backSel_16;
	wire completer_0;
	wire [1:0] completerDev;
	wire completer_1;
	wire _out_back_front_q_io_enq_ready;
	wire _out_back_front_q_io_deq_valid;
	wire _out_back_front_q_io_deq_bits_read;
	wire [22:0] _out_back_front_q_io_deq_bits_index;
	wire [63:0] _out_back_front_q_io_deq_bits_data;
	wire [7:0] _out_back_front_q_io_deq_bits_mask;
	wire [8:0] _out_back_front_q_io_deq_bits_extra_tlrr_extra_source;
	wire [1:0] _out_back_front_q_io_deq_bits_extra_tlrr_extra_size;
	wire [1:0] _fanin_1_io_dev;
	wire [1:0] _fanin_1_io_max;
	wire [1:0] _fanin_io_dev;
	wire [1:0] _fanin_io_max;
	wire _gateways_gateway_1_io_plic_valid;
	wire _gateways_gateway_io_plic_valid;
	reg [1:0] priority_0;
	reg [1:0] priority_1;
	reg [1:0] threshold_0;
	reg [1:0] threshold_1;
	reg pending_0;
	reg pending_1;
	reg [1:0] enables_0_0;
	reg [1:0] enables_1_0;
	reg [1:0] maxDevs_0;
	reg [1:0] maxDevs_1;
	wire [1:0] pendingUInt = {pending_1, pending_0};
	reg [1:0] intnodeOut_0_REG;
	reg [1:0] intnodeOut_0_REG_1;
	wire [3:0] _completedDevs_T_1 = 4'h1 << completerDev;
	wire [1:0] completedDevs = (completer_0 | completer_1 ? _completedDevs_T_1[2:1] : 2'h0);
	wire _out_T_13 = {_out_back_front_q_io_deq_bits_index[22:19], _out_back_front_q_io_deq_bits_index[17:11], _out_back_front_q_io_deq_bits_index[8:5], _out_back_front_q_io_deq_bits_index[3:1]} == 18'h00000;
	wire [31:0] _out_womask_T_11 = {{8 {_out_back_front_q_io_deq_bits_mask[7]}}, {8 {_out_back_front_q_io_deq_bits_mask[6]}}, {8 {_out_back_front_q_io_deq_bits_mask[5]}}, {8 {_out_back_front_q_io_deq_bits_mask[4]}}};
	wire claimer_1 = ((_out_rofireMux_T_1 & out_backSel_20) & _out_T_13) & |_out_womask_T_11;
	wire [2:0] _GEN = {1'h0, completerDev};
	wire [2:0] _out_completer_1_T = {enables_1_0, 1'h0} >> _GEN;
	assign completer_1 = (out_woready_8 & (&_out_womask_T_11)) & _out_completer_1_T[0];
	wire claimer_0 = ((_out_rofireMux_T_1 & out_backSel_16) & _out_T_13) & |_out_womask_T_11;
	assign completerDev = _out_back_front_q_io_deq_bits_data[33:32];
	wire [2:0] _out_completer_0_T = {enables_0_0, 1'h0} >> _GEN;
	assign completer_0 = (out_woready_9 & (&_out_womask_T_11)) & _out_completer_0_T[0];
	wire [4:0] out_oindex = {_out_back_front_q_io_deq_bits_index[18], _out_back_front_q_io_deq_bits_index[10:9], _out_back_front_q_io_deq_bits_index[4], _out_back_front_q_io_deq_bits_index[0]};
	wire [4:0] _GEN_2 = {_out_back_front_q_io_deq_bits_index[18], _out_back_front_q_io_deq_bits_index[10:9], _out_back_front_q_io_deq_bits_index[4], _out_back_front_q_io_deq_bits_index[0]};
	assign out_backSel_16 = _GEN_2 == 5'h10;
	assign out_backSel_20 = _GEN_2 == 5'h14;
	wire _out_wofireMux_T = _out_back_front_q_io_deq_valid & auto_in_d_ready;
	assign _out_rofireMux_T_1 = _out_wofireMux_T & _out_back_front_q_io_deq_bits_read;
	wire _out_wofireMux_T_2 = _out_wofireMux_T & ~_out_back_front_q_io_deq_bits_read;
	assign out_woready_9 = (_out_wofireMux_T_2 & out_backSel_16) & _out_T_13;
	assign out_woready_8 = (_out_wofireMux_T_2 & out_backSel_20) & _out_T_13;
	wire _out_out_bits_data_T_7 = out_oindex == 5'h00;
	wire [2:0] nodeIn_d_bits_opcode = {2'h0, _out_back_front_q_io_deq_bits_read};
	always @(posedge clock) begin
		if (((_out_wofireMux_T_2 & (_GEN_2 == 5'h00)) & _out_T_13) & _out_back_front_q_io_deq_bits_mask[4])
			priority_0 <= _out_back_front_q_io_deq_bits_data[33:32];
		if (((_out_wofireMux_T_2 & (_GEN_2 == 5'h01)) & _out_T_13) & _out_back_front_q_io_deq_bits_mask[0])
			priority_1 <= _out_back_front_q_io_deq_bits_data[1:0];
		if (out_woready_9 & _out_back_front_q_io_deq_bits_mask[0])
			threshold_0 <= _out_back_front_q_io_deq_bits_data[1:0];
		if (out_woready_8 & _out_back_front_q_io_deq_bits_mask[0])
			threshold_1 <= _out_back_front_q_io_deq_bits_data[1:0];
		if (((_out_wofireMux_T_2 & (_GEN_2 == 5'h08)) & _out_T_13) & _out_back_front_q_io_deq_bits_mask[0])
			enables_0_0 <= _out_back_front_q_io_deq_bits_data[2:1];
		if (((_out_wofireMux_T_2 & (_GEN_2 == 5'h0a)) & _out_T_13) & _out_back_front_q_io_deq_bits_mask[0])
			enables_1_0 <= _out_back_front_q_io_deq_bits_data[2:1];
		maxDevs_0 <= _fanin_io_dev;
		maxDevs_1 <= _fanin_1_io_dev;
		intnodeOut_0_REG <= _fanin_io_max;
		intnodeOut_0_REG_1 <= _fanin_1_io_max;
		if (reset) begin
			pending_0 <= 1'h0;
			pending_1 <= 1'h0;
		end
		else begin : sv2v_autoblock_1
			reg [1:0] claiming;
			reg claimedDevs_1;
			reg claimedDevs_2;
			claiming = (claimer_0 ? maxDevs_0 : 2'h0) | (claimer_1 ? maxDevs_1 : 2'h0);
			claimedDevs_1 = claiming == 2'h1;
			claimedDevs_2 = claiming == 2'h2;
			if (claimedDevs_1 | _gateways_gateway_io_plic_valid)
				pending_0 <= ~claimedDevs_1;
			if (claimedDevs_2 | _gateways_gateway_1_io_plic_valid)
				pending_1 <= ~claimedDevs_2;
		end
	end
	TLMonitor_29 monitor(
		.clock(clock),
		.reset(reset),
		.io_in_a_ready(_out_back_front_q_io_enq_ready),
		.io_in_a_valid(auto_in_a_valid),
		.io_in_a_bits_opcode(auto_in_a_bits_opcode),
		.io_in_a_bits_param(auto_in_a_bits_param),
		.io_in_a_bits_size(auto_in_a_bits_size),
		.io_in_a_bits_source(auto_in_a_bits_source),
		.io_in_a_bits_address(auto_in_a_bits_address),
		.io_in_a_bits_mask(auto_in_a_bits_mask),
		.io_in_a_bits_corrupt(auto_in_a_bits_corrupt),
		.io_in_d_ready(auto_in_d_ready),
		.io_in_d_valid(_out_back_front_q_io_deq_valid),
		.io_in_d_bits_opcode(nodeIn_d_bits_opcode),
		.io_in_d_bits_size(_out_back_front_q_io_deq_bits_extra_tlrr_extra_size),
		.io_in_d_bits_source(_out_back_front_q_io_deq_bits_extra_tlrr_extra_source)
	);
	LevelGateway gateways_gateway(
		.clock(clock),
		.reset(reset),
		.io_interrupt(auto_int_in_0),
		.io_plic_valid(_gateways_gateway_io_plic_valid),
		.io_plic_ready(~pending_0),
		.io_plic_complete(completedDevs[0])
	);
	LevelGateway gateways_gateway_1(
		.clock(clock),
		.reset(reset),
		.io_interrupt(auto_int_in_1),
		.io_plic_valid(_gateways_gateway_1_io_plic_valid),
		.io_plic_ready(~pending_1),
		.io_plic_complete(completedDevs[1])
	);
	PLICFanIn fanin(
		.io_prio_0(priority_0),
		.io_prio_1(priority_1),
		.io_ip(enables_0_0 & pendingUInt),
		.io_dev(_fanin_io_dev),
		.io_max(_fanin_io_max)
	);
	PLICFanIn fanin_1(
		.io_prio_0(priority_0),
		.io_prio_1(priority_1),
		.io_ip(enables_1_0 & pendingUInt),
		.io_dev(_fanin_1_io_dev),
		.io_max(_fanin_1_io_max)
	);
	Queue1_RegMapperInput_i23_m8 out_back_front_q(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_out_back_front_q_io_enq_ready),
		.io_enq_valid(auto_in_a_valid),
		.io_enq_bits_read(auto_in_a_bits_opcode == 3'h4),
		.io_enq_bits_index(auto_in_a_bits_address[25:3]),
		.io_enq_bits_data(auto_in_a_bits_data),
		.io_enq_bits_mask(auto_in_a_bits_mask),
		.io_enq_bits_extra_tlrr_extra_source(auto_in_a_bits_source),
		.io_enq_bits_extra_tlrr_extra_size(auto_in_a_bits_size),
		.io_deq_ready(auto_in_d_ready),
		.io_deq_valid(_out_back_front_q_io_deq_valid),
		.io_deq_bits_read(_out_back_front_q_io_deq_bits_read),
		.io_deq_bits_index(_out_back_front_q_io_deq_bits_index),
		.io_deq_bits_data(_out_back_front_q_io_deq_bits_data),
		.io_deq_bits_mask(_out_back_front_q_io_deq_bits_mask),
		.io_deq_bits_extra_tlrr_extra_source(_out_back_front_q_io_deq_bits_extra_tlrr_extra_source),
		.io_deq_bits_extra_tlrr_extra_size(_out_back_front_q_io_deq_bits_extra_tlrr_extra_size)
	);
	assign auto_int_out_1_0 = intnodeOut_0_REG_1 > threshold_1;
	assign auto_int_out_0_0 = intnodeOut_0_REG > threshold_0;
	assign auto_in_a_ready = _out_back_front_q_io_enq_ready;
	assign auto_in_d_valid = _out_back_front_q_io_deq_valid;
	assign auto_in_d_bits_opcode = nodeIn_d_bits_opcode;
	assign auto_in_d_bits_size = _out_back_front_q_io_deq_bits_extra_tlrr_extra_size;
	assign auto_in_d_bits_source = _out_back_front_q_io_deq_bits_extra_tlrr_extra_source;
	assign auto_in_d_bits_data = (~((((((_out_out_bits_data_T_7 | (out_oindex == 5'h01)) | (out_oindex == 5'h04)) | (out_oindex == 5'h08)) | (out_oindex == 5'h0a)) | (out_oindex == 5'h10)) | (out_oindex == 5'h14)) | _out_T_13 ? (_out_out_bits_data_T_7 ? {30'h00000000, priority_0, 32'h00000000} : (out_oindex == 5'h01 ? {62'h0000000000000000, priority_1} : (out_oindex == 5'h04 ? {61'h0000000000000000, pending_1, pending_0, 1'h0} : (out_oindex == 5'h08 ? {61'h0000000000000000, enables_0_0, 1'h0} : (out_oindex == 5'h0a ? {61'h0000000000000000, enables_1_0, 1'h0} : (out_oindex == 5'h10 ? {30'h00000000, maxDevs_0, 30'h00000000, threshold_0} : (out_oindex == 5'h14 ? {30'h00000000, maxDevs_1, 30'h00000000, threshold_1} : 64'h0000000000000000))))))) : 64'h0000000000000000);
endmodule
