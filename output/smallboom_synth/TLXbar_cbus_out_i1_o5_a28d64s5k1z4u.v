module TLXbar_cbus_out_i1_o5_a28d64s5k1z4u (
	clock,
	reset,
	auto_anon_in_a_ready,
	auto_anon_in_a_valid,
	auto_anon_in_a_bits_opcode,
	auto_anon_in_a_bits_param,
	auto_anon_in_a_bits_size,
	auto_anon_in_a_bits_source,
	auto_anon_in_a_bits_address,
	auto_anon_in_a_bits_mask,
	auto_anon_in_a_bits_data,
	auto_anon_in_a_bits_corrupt,
	auto_anon_in_d_ready,
	auto_anon_in_d_valid,
	auto_anon_in_d_bits_opcode,
	auto_anon_in_d_bits_param,
	auto_anon_in_d_bits_size,
	auto_anon_in_d_bits_source,
	auto_anon_in_d_bits_sink,
	auto_anon_in_d_bits_denied,
	auto_anon_in_d_bits_data,
	auto_anon_in_d_bits_corrupt,
	auto_anon_out_4_a_ready,
	auto_anon_out_4_a_valid,
	auto_anon_out_4_a_bits_opcode,
	auto_anon_out_4_a_bits_param,
	auto_anon_out_4_a_bits_size,
	auto_anon_out_4_a_bits_source,
	auto_anon_out_4_a_bits_address,
	auto_anon_out_4_a_bits_mask,
	auto_anon_out_4_a_bits_corrupt,
	auto_anon_out_4_d_ready,
	auto_anon_out_4_d_valid,
	auto_anon_out_4_d_bits_size,
	auto_anon_out_4_d_bits_source,
	auto_anon_out_4_d_bits_data,
	auto_anon_out_3_a_ready,
	auto_anon_out_3_a_valid,
	auto_anon_out_3_a_bits_opcode,
	auto_anon_out_3_a_bits_param,
	auto_anon_out_3_a_bits_size,
	auto_anon_out_3_a_bits_source,
	auto_anon_out_3_a_bits_address,
	auto_anon_out_3_a_bits_mask,
	auto_anon_out_3_a_bits_data,
	auto_anon_out_3_a_bits_corrupt,
	auto_anon_out_3_d_ready,
	auto_anon_out_3_d_valid,
	auto_anon_out_3_d_bits_opcode,
	auto_anon_out_3_d_bits_size,
	auto_anon_out_3_d_bits_source,
	auto_anon_out_3_d_bits_data,
	auto_anon_out_2_a_ready,
	auto_anon_out_2_a_valid,
	auto_anon_out_2_a_bits_opcode,
	auto_anon_out_2_a_bits_param,
	auto_anon_out_2_a_bits_size,
	auto_anon_out_2_a_bits_source,
	auto_anon_out_2_a_bits_address,
	auto_anon_out_2_a_bits_mask,
	auto_anon_out_2_a_bits_data,
	auto_anon_out_2_a_bits_corrupt,
	auto_anon_out_2_d_ready,
	auto_anon_out_2_d_valid,
	auto_anon_out_2_d_bits_opcode,
	auto_anon_out_2_d_bits_size,
	auto_anon_out_2_d_bits_source,
	auto_anon_out_2_d_bits_data,
	auto_anon_out_1_a_ready,
	auto_anon_out_1_a_valid,
	auto_anon_out_1_a_bits_opcode,
	auto_anon_out_1_a_bits_param,
	auto_anon_out_1_a_bits_size,
	auto_anon_out_1_a_bits_source,
	auto_anon_out_1_a_bits_address,
	auto_anon_out_1_a_bits_mask,
	auto_anon_out_1_a_bits_data,
	auto_anon_out_1_a_bits_corrupt,
	auto_anon_out_1_d_ready,
	auto_anon_out_1_d_valid,
	auto_anon_out_1_d_bits_opcode,
	auto_anon_out_1_d_bits_size,
	auto_anon_out_1_d_bits_source,
	auto_anon_out_1_d_bits_data,
	auto_anon_out_0_a_ready,
	auto_anon_out_0_a_valid,
	auto_anon_out_0_a_bits_opcode,
	auto_anon_out_0_a_bits_param,
	auto_anon_out_0_a_bits_size,
	auto_anon_out_0_a_bits_source,
	auto_anon_out_0_a_bits_address,
	auto_anon_out_0_a_bits_mask,
	auto_anon_out_0_a_bits_data,
	auto_anon_out_0_a_bits_corrupt,
	auto_anon_out_0_d_ready,
	auto_anon_out_0_d_valid,
	auto_anon_out_0_d_bits_opcode,
	auto_anon_out_0_d_bits_param,
	auto_anon_out_0_d_bits_size,
	auto_anon_out_0_d_bits_source,
	auto_anon_out_0_d_bits_sink,
	auto_anon_out_0_d_bits_denied,
	auto_anon_out_0_d_bits_data,
	auto_anon_out_0_d_bits_corrupt
);
	input clock;
	input reset;
	output wire auto_anon_in_a_ready;
	input auto_anon_in_a_valid;
	input [2:0] auto_anon_in_a_bits_opcode;
	input [2:0] auto_anon_in_a_bits_param;
	input [3:0] auto_anon_in_a_bits_size;
	input [4:0] auto_anon_in_a_bits_source;
	input [27:0] auto_anon_in_a_bits_address;
	input [7:0] auto_anon_in_a_bits_mask;
	input [63:0] auto_anon_in_a_bits_data;
	input auto_anon_in_a_bits_corrupt;
	input auto_anon_in_d_ready;
	output wire auto_anon_in_d_valid;
	output wire [2:0] auto_anon_in_d_bits_opcode;
	output wire [1:0] auto_anon_in_d_bits_param;
	output wire [3:0] auto_anon_in_d_bits_size;
	output wire [4:0] auto_anon_in_d_bits_source;
	output wire auto_anon_in_d_bits_sink;
	output wire auto_anon_in_d_bits_denied;
	output wire [63:0] auto_anon_in_d_bits_data;
	output wire auto_anon_in_d_bits_corrupt;
	input auto_anon_out_4_a_ready;
	output wire auto_anon_out_4_a_valid;
	output wire [2:0] auto_anon_out_4_a_bits_opcode;
	output wire [2:0] auto_anon_out_4_a_bits_param;
	output wire [2:0] auto_anon_out_4_a_bits_size;
	output wire [4:0] auto_anon_out_4_a_bits_source;
	output wire [16:0] auto_anon_out_4_a_bits_address;
	output wire [7:0] auto_anon_out_4_a_bits_mask;
	output wire auto_anon_out_4_a_bits_corrupt;
	output wire auto_anon_out_4_d_ready;
	input auto_anon_out_4_d_valid;
	input [2:0] auto_anon_out_4_d_bits_size;
	input [4:0] auto_anon_out_4_d_bits_source;
	input [63:0] auto_anon_out_4_d_bits_data;
	input auto_anon_out_3_a_ready;
	output wire auto_anon_out_3_a_valid;
	output wire [2:0] auto_anon_out_3_a_bits_opcode;
	output wire [2:0] auto_anon_out_3_a_bits_param;
	output wire [2:0] auto_anon_out_3_a_bits_size;
	output wire [4:0] auto_anon_out_3_a_bits_source;
	output wire [11:0] auto_anon_out_3_a_bits_address;
	output wire [7:0] auto_anon_out_3_a_bits_mask;
	output wire [63:0] auto_anon_out_3_a_bits_data;
	output wire auto_anon_out_3_a_bits_corrupt;
	output wire auto_anon_out_3_d_ready;
	input auto_anon_out_3_d_valid;
	input [2:0] auto_anon_out_3_d_bits_opcode;
	input [2:0] auto_anon_out_3_d_bits_size;
	input [4:0] auto_anon_out_3_d_bits_source;
	input [63:0] auto_anon_out_3_d_bits_data;
	input auto_anon_out_2_a_ready;
	output wire auto_anon_out_2_a_valid;
	output wire [2:0] auto_anon_out_2_a_bits_opcode;
	output wire [2:0] auto_anon_out_2_a_bits_param;
	output wire [2:0] auto_anon_out_2_a_bits_size;
	output wire [4:0] auto_anon_out_2_a_bits_source;
	output wire [27:0] auto_anon_out_2_a_bits_address;
	output wire [7:0] auto_anon_out_2_a_bits_mask;
	output wire [63:0] auto_anon_out_2_a_bits_data;
	output wire auto_anon_out_2_a_bits_corrupt;
	output wire auto_anon_out_2_d_ready;
	input auto_anon_out_2_d_valid;
	input [2:0] auto_anon_out_2_d_bits_opcode;
	input [2:0] auto_anon_out_2_d_bits_size;
	input [4:0] auto_anon_out_2_d_bits_source;
	input [63:0] auto_anon_out_2_d_bits_data;
	input auto_anon_out_1_a_ready;
	output wire auto_anon_out_1_a_valid;
	output wire [2:0] auto_anon_out_1_a_bits_opcode;
	output wire [2:0] auto_anon_out_1_a_bits_param;
	output wire [2:0] auto_anon_out_1_a_bits_size;
	output wire [4:0] auto_anon_out_1_a_bits_source;
	output wire [25:0] auto_anon_out_1_a_bits_address;
	output wire [7:0] auto_anon_out_1_a_bits_mask;
	output wire [63:0] auto_anon_out_1_a_bits_data;
	output wire auto_anon_out_1_a_bits_corrupt;
	output wire auto_anon_out_1_d_ready;
	input auto_anon_out_1_d_valid;
	input [2:0] auto_anon_out_1_d_bits_opcode;
	input [2:0] auto_anon_out_1_d_bits_size;
	input [4:0] auto_anon_out_1_d_bits_source;
	input [63:0] auto_anon_out_1_d_bits_data;
	input auto_anon_out_0_a_ready;
	output wire auto_anon_out_0_a_valid;
	output wire [2:0] auto_anon_out_0_a_bits_opcode;
	output wire [2:0] auto_anon_out_0_a_bits_param;
	output wire [3:0] auto_anon_out_0_a_bits_size;
	output wire [4:0] auto_anon_out_0_a_bits_source;
	output wire [13:0] auto_anon_out_0_a_bits_address;
	output wire [7:0] auto_anon_out_0_a_bits_mask;
	output wire [63:0] auto_anon_out_0_a_bits_data;
	output wire auto_anon_out_0_a_bits_corrupt;
	output wire auto_anon_out_0_d_ready;
	input auto_anon_out_0_d_valid;
	input [2:0] auto_anon_out_0_d_bits_opcode;
	input [1:0] auto_anon_out_0_d_bits_param;
	input [3:0] auto_anon_out_0_d_bits_size;
	input [4:0] auto_anon_out_0_d_bits_source;
	input auto_anon_out_0_d_bits_sink;
	input auto_anon_out_0_d_bits_denied;
	input [63:0] auto_anon_out_0_d_bits_data;
	input auto_anon_out_0_d_bits_corrupt;
	wire requestAIO_0_0 = {auto_anon_in_a_bits_address[27], auto_anon_in_a_bits_address[25], auto_anon_in_a_bits_address[16], ~auto_anon_in_a_bits_address[13]} == 4'h0;
	wire requestAIO_0_1 = {auto_anon_in_a_bits_address[27], ~auto_anon_in_a_bits_address[25], auto_anon_in_a_bits_address[16]} == 3'h0;
	wire requestAIO_0_3 = {auto_anon_in_a_bits_address[27], auto_anon_in_a_bits_address[25], auto_anon_in_a_bits_address[16], auto_anon_in_a_bits_address[13]} == 4'h0;
	wire requestAIO_0_4 = {auto_anon_in_a_bits_address[27], auto_anon_in_a_bits_address[25], ~auto_anon_in_a_bits_address[16]} == 3'h0;
	wire _portsAOI_in_0_a_ready_T_8 = ((((requestAIO_0_0 & auto_anon_out_0_a_ready) | (requestAIO_0_1 & auto_anon_out_1_a_ready)) | (auto_anon_in_a_bits_address[27] & auto_anon_out_2_a_ready)) | (requestAIO_0_3 & auto_anon_out_3_a_ready)) | (requestAIO_0_4 & auto_anon_out_4_a_ready);
	reg [8:0] beatsLeft;
	wire idle = beatsLeft == 9'h000;
	wire [4:0] readys_valid = {auto_anon_out_4_d_valid, auto_anon_out_3_d_valid, auto_anon_out_2_d_valid, auto_anon_out_1_d_valid, auto_anon_out_0_d_valid};
	reg [4:0] readys_mask;
	wire [4:0] _readys_filter_T_1 = readys_valid & ~readys_mask;
	wire [7:0] _GEN = {_readys_filter_T_1[3:0], auto_anon_out_4_d_valid, auto_anon_out_3_d_valid, auto_anon_out_2_d_valid, auto_anon_out_1_d_valid} | {_readys_filter_T_1, auto_anon_out_4_d_valid, auto_anon_out_3_d_valid, auto_anon_out_2_d_valid};
	wire [6:0] _GEN_0 = _GEN[6:0] | {_readys_filter_T_1[4], _GEN[7:2]};
	wire [4:0] readys_readys = ~({readys_mask[4], _readys_filter_T_1[4] | readys_mask[3], _GEN[7] | readys_mask[2], _GEN_0[6:5] | readys_mask[1:0]} & (_GEN_0[4:0] | {_readys_filter_T_1[4], _GEN[7], _GEN_0[6:4]}));
	wire winner_0 = readys_readys[0] & auto_anon_out_0_d_valid;
	wire winner_1 = readys_readys[1] & auto_anon_out_1_d_valid;
	wire winner_2 = readys_readys[2] & auto_anon_out_2_d_valid;
	wire winner_3 = readys_readys[3] & auto_anon_out_3_d_valid;
	wire winner_4 = readys_readys[4] & auto_anon_out_4_d_valid;
	wire _in_0_d_valid_T = auto_anon_out_0_d_valid | auto_anon_out_1_d_valid;
	reg state_0;
	reg state_1;
	reg state_2;
	reg state_3;
	reg state_4;
	wire muxState_0 = (idle ? winner_0 : state_0);
	wire muxState_1 = (idle ? winner_1 : state_1);
	wire muxState_2 = (idle ? winner_2 : state_2);
	wire muxState_3 = (idle ? winner_3 : state_3);
	wire muxState_4 = (idle ? winner_4 : state_4);
	wire in_0_d_valid = (idle ? ((_in_0_d_valid_T | auto_anon_out_2_d_valid) | auto_anon_out_3_d_valid) | auto_anon_out_4_d_valid : ((((state_0 & auto_anon_out_0_d_valid) | (state_1 & auto_anon_out_1_d_valid)) | (state_2 & auto_anon_out_2_d_valid)) | (state_3 & auto_anon_out_3_d_valid)) | (state_4 & auto_anon_out_4_d_valid));
	wire _in_0_d_bits_T = muxState_0 & auto_anon_out_0_d_bits_corrupt;
	wire _in_0_d_bits_T_18 = muxState_0 & auto_anon_out_0_d_bits_denied;
	wire _in_0_d_bits_T_27 = muxState_0 & auto_anon_out_0_d_bits_sink;
	wire [4:0] _in_0_d_bits_T_44 = ((((muxState_0 ? auto_anon_out_0_d_bits_source : 5'h00) | (muxState_1 ? auto_anon_out_1_d_bits_source : 5'h00)) | (muxState_2 ? auto_anon_out_2_d_bits_source : 5'h00)) | (muxState_3 ? auto_anon_out_3_d_bits_source : 5'h00)) | (muxState_4 ? auto_anon_out_4_d_bits_source : 5'h00);
	wire [3:0] _in_0_d_bits_T_53 = ((((muxState_0 ? auto_anon_out_0_d_bits_size : 4'h0) | (muxState_1 ? {1'h0, auto_anon_out_1_d_bits_size} : 4'h0)) | (muxState_2 ? {1'h0, auto_anon_out_2_d_bits_size} : 4'h0)) | (muxState_3 ? {1'h0, auto_anon_out_3_d_bits_size} : 4'h0)) | (muxState_4 ? {1'h0, auto_anon_out_4_d_bits_size} : 4'h0);
	wire [1:0] _in_0_d_bits_T_54 = (muxState_0 ? auto_anon_out_0_d_bits_param : 2'h0);
	wire [2:0] _in_0_d_bits_T_71 = ((((muxState_0 ? auto_anon_out_0_d_bits_opcode : 3'h0) | (muxState_1 ? auto_anon_out_1_d_bits_opcode : 3'h0)) | (muxState_2 ? auto_anon_out_2_d_bits_opcode : 3'h0)) | (muxState_3 ? auto_anon_out_3_d_bits_opcode : 3'h0)) | {2'h0, muxState_4};
	always @(posedge clock)
		if (reset) begin
			beatsLeft <= 9'h000;
			readys_mask <= 5'h1f;
			state_0 <= 1'h0;
			state_1 <= 1'h0;
			state_2 <= 1'h0;
			state_3 <= 1'h0;
			state_4 <= 1'h0;
		end
		else begin : sv2v_autoblock_1
			reg latch;
			latch = idle & auto_anon_in_d_ready;
			if (latch) begin : sv2v_autoblock_2
				reg [26:0] _beatsDO_decode_T;
				reg [8:0] maskedBeats_0;
				reg [20:0] _beatsDO_decode_T_12;
				reg [20:0] _beatsDO_decode_T_9;
				reg [20:0] _beatsDO_decode_T_6;
				reg [20:0] _beatsDO_decode_T_3;
				_beatsDO_decode_T = 27'h0000fff << auto_anon_out_0_d_bits_size;
				maskedBeats_0 = (winner_0 & auto_anon_out_0_d_bits_opcode[0] ? ~_beatsDO_decode_T[11:3] : 9'h000);
				_beatsDO_decode_T_12 = 21'h00003f << auto_anon_out_4_d_bits_size;
				_beatsDO_decode_T_9 = 21'h00003f << auto_anon_out_3_d_bits_size;
				_beatsDO_decode_T_6 = 21'h00003f << auto_anon_out_2_d_bits_size;
				_beatsDO_decode_T_3 = 21'h00003f << auto_anon_out_1_d_bits_size;
				beatsLeft <= {maskedBeats_0[8:3], (((maskedBeats_0[2:0] | (winner_1 & auto_anon_out_1_d_bits_opcode[0] ? ~_beatsDO_decode_T_3[5:3] : 3'h0)) | (winner_2 & auto_anon_out_2_d_bits_opcode[0] ? ~_beatsDO_decode_T_6[5:3] : 3'h0)) | (winner_3 & auto_anon_out_3_d_bits_opcode[0] ? ~_beatsDO_decode_T_9[5:3] : 3'h0)) | (winner_4 ? ~_beatsDO_decode_T_12[5:3] : 3'h0)};
			end
			else
				beatsLeft <= beatsLeft - {8'h00, auto_anon_in_d_ready & in_0_d_valid};
			if (latch & |readys_valid) begin : sv2v_autoblock_3
				reg [4:0] _readys_mask_T;
				reg [4:0] _readys_mask_T_3;
				reg [4:0] _readys_mask_T_6;
				_readys_mask_T = readys_readys & readys_valid;
				_readys_mask_T_3 = _readys_mask_T | {_readys_mask_T[3:0], 1'h0};
				_readys_mask_T_6 = _readys_mask_T_3 | {_readys_mask_T_3[2:0], 2'h0};
				readys_mask <= _readys_mask_T_6 | {_readys_mask_T_6[0], 4'h0};
			end
			if (idle) begin
				state_0 <= winner_0;
				state_1 <= winner_1;
				state_2 <= winner_2;
				state_3 <= winner_3;
				state_4 <= winner_4;
			end
		end
	TLMonitor_9 monitor(
		.clock(clock),
		.reset(reset),
		.io_in_a_ready(_portsAOI_in_0_a_ready_T_8),
		.io_in_a_valid(auto_anon_in_a_valid),
		.io_in_a_bits_opcode(auto_anon_in_a_bits_opcode),
		.io_in_a_bits_param(auto_anon_in_a_bits_param),
		.io_in_a_bits_size(auto_anon_in_a_bits_size),
		.io_in_a_bits_source(auto_anon_in_a_bits_source),
		.io_in_a_bits_address(auto_anon_in_a_bits_address),
		.io_in_a_bits_mask(auto_anon_in_a_bits_mask),
		.io_in_a_bits_corrupt(auto_anon_in_a_bits_corrupt),
		.io_in_d_ready(auto_anon_in_d_ready),
		.io_in_d_valid(in_0_d_valid),
		.io_in_d_bits_opcode(_in_0_d_bits_T_71),
		.io_in_d_bits_param(_in_0_d_bits_T_54),
		.io_in_d_bits_size(_in_0_d_bits_T_53),
		.io_in_d_bits_source(_in_0_d_bits_T_44),
		.io_in_d_bits_sink(_in_0_d_bits_T_27),
		.io_in_d_bits_denied(_in_0_d_bits_T_18),
		.io_in_d_bits_corrupt(_in_0_d_bits_T)
	);
	assign auto_anon_in_a_ready = _portsAOI_in_0_a_ready_T_8;
	assign auto_anon_in_d_valid = in_0_d_valid;
	assign auto_anon_in_d_bits_opcode = _in_0_d_bits_T_71;
	assign auto_anon_in_d_bits_param = _in_0_d_bits_T_54;
	assign auto_anon_in_d_bits_size = _in_0_d_bits_T_53;
	assign auto_anon_in_d_bits_source = _in_0_d_bits_T_44;
	assign auto_anon_in_d_bits_sink = _in_0_d_bits_T_27;
	assign auto_anon_in_d_bits_denied = _in_0_d_bits_T_18;
	assign auto_anon_in_d_bits_data = ((((muxState_0 ? auto_anon_out_0_d_bits_data : 64'h0000000000000000) | (muxState_1 ? auto_anon_out_1_d_bits_data : 64'h0000000000000000)) | (muxState_2 ? auto_anon_out_2_d_bits_data : 64'h0000000000000000)) | (muxState_3 ? auto_anon_out_3_d_bits_data : 64'h0000000000000000)) | (muxState_4 ? auto_anon_out_4_d_bits_data : 64'h0000000000000000);
	assign auto_anon_in_d_bits_corrupt = _in_0_d_bits_T;
	assign auto_anon_out_4_a_valid = auto_anon_in_a_valid & requestAIO_0_4;
	assign auto_anon_out_4_a_bits_opcode = auto_anon_in_a_bits_opcode;
	assign auto_anon_out_4_a_bits_param = auto_anon_in_a_bits_param;
	assign auto_anon_out_4_a_bits_size = auto_anon_in_a_bits_size[2:0];
	assign auto_anon_out_4_a_bits_source = auto_anon_in_a_bits_source;
	assign auto_anon_out_4_a_bits_address = auto_anon_in_a_bits_address[16:0];
	assign auto_anon_out_4_a_bits_mask = auto_anon_in_a_bits_mask;
	assign auto_anon_out_4_a_bits_corrupt = auto_anon_in_a_bits_corrupt;
	assign auto_anon_out_4_d_ready = auto_anon_in_d_ready & (idle ? readys_readys[4] : state_4);
	assign auto_anon_out_3_a_valid = auto_anon_in_a_valid & requestAIO_0_3;
	assign auto_anon_out_3_a_bits_opcode = auto_anon_in_a_bits_opcode;
	assign auto_anon_out_3_a_bits_param = auto_anon_in_a_bits_param;
	assign auto_anon_out_3_a_bits_size = auto_anon_in_a_bits_size[2:0];
	assign auto_anon_out_3_a_bits_source = auto_anon_in_a_bits_source;
	assign auto_anon_out_3_a_bits_address = auto_anon_in_a_bits_address[11:0];
	assign auto_anon_out_3_a_bits_mask = auto_anon_in_a_bits_mask;
	assign auto_anon_out_3_a_bits_data = auto_anon_in_a_bits_data;
	assign auto_anon_out_3_a_bits_corrupt = auto_anon_in_a_bits_corrupt;
	assign auto_anon_out_3_d_ready = auto_anon_in_d_ready & (idle ? readys_readys[3] : state_3);
	assign auto_anon_out_2_a_valid = auto_anon_in_a_valid & auto_anon_in_a_bits_address[27];
	assign auto_anon_out_2_a_bits_opcode = auto_anon_in_a_bits_opcode;
	assign auto_anon_out_2_a_bits_param = auto_anon_in_a_bits_param;
	assign auto_anon_out_2_a_bits_size = auto_anon_in_a_bits_size[2:0];
	assign auto_anon_out_2_a_bits_source = auto_anon_in_a_bits_source;
	assign auto_anon_out_2_a_bits_address = auto_anon_in_a_bits_address;
	assign auto_anon_out_2_a_bits_mask = auto_anon_in_a_bits_mask;
	assign auto_anon_out_2_a_bits_data = auto_anon_in_a_bits_data;
	assign auto_anon_out_2_a_bits_corrupt = auto_anon_in_a_bits_corrupt;
	assign auto_anon_out_2_d_ready = auto_anon_in_d_ready & (idle ? readys_readys[2] : state_2);
	assign auto_anon_out_1_a_valid = auto_anon_in_a_valid & requestAIO_0_1;
	assign auto_anon_out_1_a_bits_opcode = auto_anon_in_a_bits_opcode;
	assign auto_anon_out_1_a_bits_param = auto_anon_in_a_bits_param;
	assign auto_anon_out_1_a_bits_size = auto_anon_in_a_bits_size[2:0];
	assign auto_anon_out_1_a_bits_source = auto_anon_in_a_bits_source;
	assign auto_anon_out_1_a_bits_address = auto_anon_in_a_bits_address[25:0];
	assign auto_anon_out_1_a_bits_mask = auto_anon_in_a_bits_mask;
	assign auto_anon_out_1_a_bits_data = auto_anon_in_a_bits_data;
	assign auto_anon_out_1_a_bits_corrupt = auto_anon_in_a_bits_corrupt;
	assign auto_anon_out_1_d_ready = auto_anon_in_d_ready & (idle ? readys_readys[1] : state_1);
	assign auto_anon_out_0_a_valid = auto_anon_in_a_valid & requestAIO_0_0;
	assign auto_anon_out_0_a_bits_opcode = auto_anon_in_a_bits_opcode;
	assign auto_anon_out_0_a_bits_param = auto_anon_in_a_bits_param;
	assign auto_anon_out_0_a_bits_size = auto_anon_in_a_bits_size;
	assign auto_anon_out_0_a_bits_source = auto_anon_in_a_bits_source;
	assign auto_anon_out_0_a_bits_address = auto_anon_in_a_bits_address[13:0];
	assign auto_anon_out_0_a_bits_mask = auto_anon_in_a_bits_mask;
	assign auto_anon_out_0_a_bits_data = auto_anon_in_a_bits_data;
	assign auto_anon_out_0_a_bits_corrupt = auto_anon_in_a_bits_corrupt;
	assign auto_anon_out_0_d_ready = auto_anon_in_d_ready & (idle ? readys_readys[0] : state_0);
endmodule
