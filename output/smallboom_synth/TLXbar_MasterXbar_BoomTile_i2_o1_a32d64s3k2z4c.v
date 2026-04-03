module TLXbar_MasterXbar_BoomTile_i2_o1_a32d64s3k2z4c (
	clock,
	reset,
	auto_anon_in_1_a_ready,
	auto_anon_in_1_a_valid,
	auto_anon_in_1_a_bits_opcode,
	auto_anon_in_1_a_bits_param,
	auto_anon_in_1_a_bits_size,
	auto_anon_in_1_a_bits_source,
	auto_anon_in_1_a_bits_address,
	auto_anon_in_1_a_bits_mask,
	auto_anon_in_1_a_bits_data,
	auto_anon_in_1_a_bits_corrupt,
	auto_anon_in_1_d_ready,
	auto_anon_in_1_d_valid,
	auto_anon_in_1_d_bits_opcode,
	auto_anon_in_1_d_bits_param,
	auto_anon_in_1_d_bits_size,
	auto_anon_in_1_d_bits_sink,
	auto_anon_in_1_d_bits_denied,
	auto_anon_in_1_d_bits_data,
	auto_anon_in_1_d_bits_corrupt,
	auto_anon_in_0_a_ready,
	auto_anon_in_0_a_valid,
	auto_anon_in_0_a_bits_opcode,
	auto_anon_in_0_a_bits_param,
	auto_anon_in_0_a_bits_size,
	auto_anon_in_0_a_bits_source,
	auto_anon_in_0_a_bits_address,
	auto_anon_in_0_a_bits_mask,
	auto_anon_in_0_a_bits_data,
	auto_anon_in_0_a_bits_corrupt,
	auto_anon_in_0_b_ready,
	auto_anon_in_0_b_valid,
	auto_anon_in_0_b_bits_opcode,
	auto_anon_in_0_b_bits_param,
	auto_anon_in_0_b_bits_size,
	auto_anon_in_0_b_bits_source,
	auto_anon_in_0_b_bits_address,
	auto_anon_in_0_b_bits_mask,
	auto_anon_in_0_b_bits_data,
	auto_anon_in_0_b_bits_corrupt,
	auto_anon_in_0_c_ready,
	auto_anon_in_0_c_valid,
	auto_anon_in_0_c_bits_opcode,
	auto_anon_in_0_c_bits_param,
	auto_anon_in_0_c_bits_size,
	auto_anon_in_0_c_bits_source,
	auto_anon_in_0_c_bits_address,
	auto_anon_in_0_c_bits_data,
	auto_anon_in_0_c_bits_corrupt,
	auto_anon_in_0_d_ready,
	auto_anon_in_0_d_valid,
	auto_anon_in_0_d_bits_opcode,
	auto_anon_in_0_d_bits_param,
	auto_anon_in_0_d_bits_size,
	auto_anon_in_0_d_bits_source,
	auto_anon_in_0_d_bits_sink,
	auto_anon_in_0_d_bits_denied,
	auto_anon_in_0_d_bits_data,
	auto_anon_in_0_d_bits_corrupt,
	auto_anon_in_0_e_ready,
	auto_anon_in_0_e_valid,
	auto_anon_in_0_e_bits_sink,
	auto_anon_out_a_ready,
	auto_anon_out_a_valid,
	auto_anon_out_a_bits_opcode,
	auto_anon_out_a_bits_param,
	auto_anon_out_a_bits_size,
	auto_anon_out_a_bits_source,
	auto_anon_out_a_bits_address,
	auto_anon_out_a_bits_mask,
	auto_anon_out_a_bits_data,
	auto_anon_out_a_bits_corrupt,
	auto_anon_out_b_ready,
	auto_anon_out_b_valid,
	auto_anon_out_b_bits_opcode,
	auto_anon_out_b_bits_param,
	auto_anon_out_b_bits_size,
	auto_anon_out_b_bits_source,
	auto_anon_out_b_bits_address,
	auto_anon_out_b_bits_mask,
	auto_anon_out_b_bits_data,
	auto_anon_out_b_bits_corrupt,
	auto_anon_out_c_ready,
	auto_anon_out_c_valid,
	auto_anon_out_c_bits_opcode,
	auto_anon_out_c_bits_param,
	auto_anon_out_c_bits_size,
	auto_anon_out_c_bits_source,
	auto_anon_out_c_bits_address,
	auto_anon_out_c_bits_data,
	auto_anon_out_c_bits_corrupt,
	auto_anon_out_d_ready,
	auto_anon_out_d_valid,
	auto_anon_out_d_bits_opcode,
	auto_anon_out_d_bits_param,
	auto_anon_out_d_bits_size,
	auto_anon_out_d_bits_source,
	auto_anon_out_d_bits_sink,
	auto_anon_out_d_bits_denied,
	auto_anon_out_d_bits_data,
	auto_anon_out_d_bits_corrupt,
	auto_anon_out_e_ready,
	auto_anon_out_e_valid,
	auto_anon_out_e_bits_sink
);
	input clock;
	input reset;
	output wire auto_anon_in_1_a_ready;
	input auto_anon_in_1_a_valid;
	input [2:0] auto_anon_in_1_a_bits_opcode;
	input [2:0] auto_anon_in_1_a_bits_param;
	input [3:0] auto_anon_in_1_a_bits_size;
	input auto_anon_in_1_a_bits_source;
	input [31:0] auto_anon_in_1_a_bits_address;
	input [7:0] auto_anon_in_1_a_bits_mask;
	input [63:0] auto_anon_in_1_a_bits_data;
	input auto_anon_in_1_a_bits_corrupt;
	input auto_anon_in_1_d_ready;
	output wire auto_anon_in_1_d_valid;
	output wire [2:0] auto_anon_in_1_d_bits_opcode;
	output wire [1:0] auto_anon_in_1_d_bits_param;
	output wire [3:0] auto_anon_in_1_d_bits_size;
	output wire [1:0] auto_anon_in_1_d_bits_sink;
	output wire auto_anon_in_1_d_bits_denied;
	output wire [63:0] auto_anon_in_1_d_bits_data;
	output wire auto_anon_in_1_d_bits_corrupt;
	output wire auto_anon_in_0_a_ready;
	input auto_anon_in_0_a_valid;
	input [2:0] auto_anon_in_0_a_bits_opcode;
	input [2:0] auto_anon_in_0_a_bits_param;
	input [3:0] auto_anon_in_0_a_bits_size;
	input [1:0] auto_anon_in_0_a_bits_source;
	input [31:0] auto_anon_in_0_a_bits_address;
	input [7:0] auto_anon_in_0_a_bits_mask;
	input [63:0] auto_anon_in_0_a_bits_data;
	input auto_anon_in_0_a_bits_corrupt;
	input auto_anon_in_0_b_ready;
	output wire auto_anon_in_0_b_valid;
	output wire [2:0] auto_anon_in_0_b_bits_opcode;
	output wire [1:0] auto_anon_in_0_b_bits_param;
	output wire [3:0] auto_anon_in_0_b_bits_size;
	output wire [1:0] auto_anon_in_0_b_bits_source;
	output wire [31:0] auto_anon_in_0_b_bits_address;
	output wire [7:0] auto_anon_in_0_b_bits_mask;
	output wire [63:0] auto_anon_in_0_b_bits_data;
	output wire auto_anon_in_0_b_bits_corrupt;
	output wire auto_anon_in_0_c_ready;
	input auto_anon_in_0_c_valid;
	input [2:0] auto_anon_in_0_c_bits_opcode;
	input [2:0] auto_anon_in_0_c_bits_param;
	input [3:0] auto_anon_in_0_c_bits_size;
	input [1:0] auto_anon_in_0_c_bits_source;
	input [31:0] auto_anon_in_0_c_bits_address;
	input [63:0] auto_anon_in_0_c_bits_data;
	input auto_anon_in_0_c_bits_corrupt;
	input auto_anon_in_0_d_ready;
	output wire auto_anon_in_0_d_valid;
	output wire [2:0] auto_anon_in_0_d_bits_opcode;
	output wire [1:0] auto_anon_in_0_d_bits_param;
	output wire [3:0] auto_anon_in_0_d_bits_size;
	output wire [1:0] auto_anon_in_0_d_bits_source;
	output wire [1:0] auto_anon_in_0_d_bits_sink;
	output wire auto_anon_in_0_d_bits_denied;
	output wire [63:0] auto_anon_in_0_d_bits_data;
	output wire auto_anon_in_0_d_bits_corrupt;
	output wire auto_anon_in_0_e_ready;
	input auto_anon_in_0_e_valid;
	input [1:0] auto_anon_in_0_e_bits_sink;
	input auto_anon_out_a_ready;
	output wire auto_anon_out_a_valid;
	output wire [2:0] auto_anon_out_a_bits_opcode;
	output wire [2:0] auto_anon_out_a_bits_param;
	output wire [3:0] auto_anon_out_a_bits_size;
	output wire [2:0] auto_anon_out_a_bits_source;
	output wire [31:0] auto_anon_out_a_bits_address;
	output wire [7:0] auto_anon_out_a_bits_mask;
	output wire [63:0] auto_anon_out_a_bits_data;
	output wire auto_anon_out_a_bits_corrupt;
	output wire auto_anon_out_b_ready;
	input auto_anon_out_b_valid;
	input [2:0] auto_anon_out_b_bits_opcode;
	input [1:0] auto_anon_out_b_bits_param;
	input [3:0] auto_anon_out_b_bits_size;
	input [2:0] auto_anon_out_b_bits_source;
	input [31:0] auto_anon_out_b_bits_address;
	input [7:0] auto_anon_out_b_bits_mask;
	input [63:0] auto_anon_out_b_bits_data;
	input auto_anon_out_b_bits_corrupt;
	input auto_anon_out_c_ready;
	output wire auto_anon_out_c_valid;
	output wire [2:0] auto_anon_out_c_bits_opcode;
	output wire [2:0] auto_anon_out_c_bits_param;
	output wire [3:0] auto_anon_out_c_bits_size;
	output wire [2:0] auto_anon_out_c_bits_source;
	output wire [31:0] auto_anon_out_c_bits_address;
	output wire [63:0] auto_anon_out_c_bits_data;
	output wire auto_anon_out_c_bits_corrupt;
	output wire auto_anon_out_d_ready;
	input auto_anon_out_d_valid;
	input [2:0] auto_anon_out_d_bits_opcode;
	input [1:0] auto_anon_out_d_bits_param;
	input [3:0] auto_anon_out_d_bits_size;
	input [2:0] auto_anon_out_d_bits_source;
	input [1:0] auto_anon_out_d_bits_sink;
	input auto_anon_out_d_bits_denied;
	input [63:0] auto_anon_out_d_bits_data;
	input auto_anon_out_d_bits_corrupt;
	input auto_anon_out_e_ready;
	output wire auto_anon_out_e_valid;
	output wire [1:0] auto_anon_out_e_bits_sink;
	wire requestDOI_0_1 = auto_anon_out_d_bits_source == 3'h4;
	wire portsBIO_filtered_0_valid = auto_anon_out_b_valid & ~auto_anon_out_b_bits_source[2];
	wire portsDIO_filtered_0_valid = auto_anon_out_d_valid & ~auto_anon_out_d_bits_source[2];
	wire portsDIO_filtered_1_valid = auto_anon_out_d_valid & requestDOI_0_1;
	reg [8:0] beatsLeft;
	wire idle = beatsLeft == 9'h000;
	wire [1:0] readys_valid = {auto_anon_in_1_a_valid, auto_anon_in_0_a_valid};
	reg [1:0] readys_mask;
	wire [1:0] _readys_filter_T_1 = readys_valid & ~readys_mask;
	wire [1:0] readys_readys = ~({readys_mask[1], _readys_filter_T_1[1] | readys_mask[0]} & ({_readys_filter_T_1[0], auto_anon_in_1_a_valid} | _readys_filter_T_1));
	wire winner_0 = readys_readys[0] & auto_anon_in_0_a_valid;
	wire winner_1 = readys_readys[1] & auto_anon_in_1_a_valid;
	wire _out_0_a_valid_T = auto_anon_in_0_a_valid | auto_anon_in_1_a_valid;
	reg state_0;
	reg state_1;
	wire muxState_0 = (idle ? winner_0 : state_0);
	wire muxState_1 = (idle ? winner_1 : state_1);
	wire portsAOI_filtered_0_ready = auto_anon_out_a_ready & (idle ? readys_readys[0] : state_0);
	wire portsAOI_filtered_1_0_ready = auto_anon_out_a_ready & (idle ? readys_readys[1] : state_1);
	wire out_0_a_valid = (idle ? _out_0_a_valid_T : (state_0 & auto_anon_in_0_a_valid) | (state_1 & auto_anon_in_1_a_valid));
	always @(posedge clock)
		if (reset) begin
			beatsLeft <= 9'h000;
			readys_mask <= 2'h3;
			state_0 <= 1'h0;
			state_1 <= 1'h0;
		end
		else begin : sv2v_autoblock_1
			reg latch;
			latch = idle & auto_anon_out_a_ready;
			if (latch) begin : sv2v_autoblock_2
				reg [26:0] _beatsAI_decode_T_3;
				reg [26:0] _beatsAI_decode_T;
				_beatsAI_decode_T_3 = 27'h0000fff << auto_anon_in_1_a_bits_size;
				_beatsAI_decode_T = 27'h0000fff << auto_anon_in_0_a_bits_size;
				beatsLeft <= (winner_0 & ~auto_anon_in_0_a_bits_opcode[2] ? ~_beatsAI_decode_T[11:3] : 9'h000) | (winner_1 & ~auto_anon_in_1_a_bits_opcode[2] ? ~_beatsAI_decode_T_3[11:3] : 9'h000);
			end
			else
				beatsLeft <= beatsLeft - {8'h00, auto_anon_out_a_ready & out_0_a_valid};
			if (latch & |readys_valid) begin : sv2v_autoblock_3
				reg [1:0] _readys_mask_T;
				_readys_mask_T = readys_readys & readys_valid;
				readys_mask <= _readys_mask_T | {_readys_mask_T[0], 1'h0};
			end
			if (idle) begin
				state_0 <= winner_0;
				state_1 <= winner_1;
			end
		end
	TLMonitor_22 monitor(
		.clock(clock),
		.reset(reset),
		.io_in_a_ready(portsAOI_filtered_0_ready),
		.io_in_a_valid(auto_anon_in_0_a_valid),
		.io_in_a_bits_opcode(auto_anon_in_0_a_bits_opcode),
		.io_in_a_bits_param(auto_anon_in_0_a_bits_param),
		.io_in_a_bits_size(auto_anon_in_0_a_bits_size),
		.io_in_a_bits_source(auto_anon_in_0_a_bits_source),
		.io_in_a_bits_address(auto_anon_in_0_a_bits_address),
		.io_in_a_bits_mask(auto_anon_in_0_a_bits_mask),
		.io_in_a_bits_corrupt(auto_anon_in_0_a_bits_corrupt),
		.io_in_b_ready(auto_anon_in_0_b_ready),
		.io_in_b_valid(portsBIO_filtered_0_valid),
		.io_in_b_bits_opcode(auto_anon_out_b_bits_opcode),
		.io_in_b_bits_param(auto_anon_out_b_bits_param),
		.io_in_b_bits_size(auto_anon_out_b_bits_size),
		.io_in_b_bits_source(auto_anon_out_b_bits_source[1:0]),
		.io_in_b_bits_address(auto_anon_out_b_bits_address),
		.io_in_b_bits_mask(auto_anon_out_b_bits_mask),
		.io_in_b_bits_corrupt(auto_anon_out_b_bits_corrupt),
		.io_in_c_ready(auto_anon_out_c_ready),
		.io_in_c_valid(auto_anon_in_0_c_valid),
		.io_in_c_bits_opcode(auto_anon_in_0_c_bits_opcode),
		.io_in_c_bits_param(auto_anon_in_0_c_bits_param),
		.io_in_c_bits_size(auto_anon_in_0_c_bits_size),
		.io_in_c_bits_source(auto_anon_in_0_c_bits_source),
		.io_in_c_bits_address(auto_anon_in_0_c_bits_address),
		.io_in_c_bits_corrupt(auto_anon_in_0_c_bits_corrupt),
		.io_in_d_ready(auto_anon_in_0_d_ready),
		.io_in_d_valid(portsDIO_filtered_0_valid),
		.io_in_d_bits_opcode(auto_anon_out_d_bits_opcode),
		.io_in_d_bits_param(auto_anon_out_d_bits_param),
		.io_in_d_bits_size(auto_anon_out_d_bits_size),
		.io_in_d_bits_source(auto_anon_out_d_bits_source[1:0]),
		.io_in_d_bits_sink(auto_anon_out_d_bits_sink),
		.io_in_d_bits_denied(auto_anon_out_d_bits_denied),
		.io_in_d_bits_corrupt(auto_anon_out_d_bits_corrupt),
		.io_in_e_ready(auto_anon_out_e_ready),
		.io_in_e_valid(auto_anon_in_0_e_valid),
		.io_in_e_bits_sink(auto_anon_in_0_e_bits_sink)
	);
	TLMonitor_23 monitor_1(
		.clock(clock),
		.reset(reset),
		.io_in_a_ready(portsAOI_filtered_1_0_ready),
		.io_in_a_valid(auto_anon_in_1_a_valid),
		.io_in_a_bits_opcode(auto_anon_in_1_a_bits_opcode),
		.io_in_a_bits_param(auto_anon_in_1_a_bits_param),
		.io_in_a_bits_size(auto_anon_in_1_a_bits_size),
		.io_in_a_bits_source(auto_anon_in_1_a_bits_source),
		.io_in_a_bits_address(auto_anon_in_1_a_bits_address),
		.io_in_a_bits_mask(auto_anon_in_1_a_bits_mask),
		.io_in_a_bits_corrupt(auto_anon_in_1_a_bits_corrupt),
		.io_in_d_ready(auto_anon_in_1_d_ready),
		.io_in_d_valid(portsDIO_filtered_1_valid),
		.io_in_d_bits_opcode(auto_anon_out_d_bits_opcode),
		.io_in_d_bits_param(auto_anon_out_d_bits_param),
		.io_in_d_bits_size(auto_anon_out_d_bits_size),
		.io_in_d_bits_sink(auto_anon_out_d_bits_sink),
		.io_in_d_bits_denied(auto_anon_out_d_bits_denied),
		.io_in_d_bits_corrupt(auto_anon_out_d_bits_corrupt)
	);
	assign auto_anon_in_1_a_ready = portsAOI_filtered_1_0_ready;
	assign auto_anon_in_1_d_valid = portsDIO_filtered_1_valid;
	assign auto_anon_in_1_d_bits_opcode = auto_anon_out_d_bits_opcode;
	assign auto_anon_in_1_d_bits_param = auto_anon_out_d_bits_param;
	assign auto_anon_in_1_d_bits_size = auto_anon_out_d_bits_size;
	assign auto_anon_in_1_d_bits_sink = auto_anon_out_d_bits_sink;
	assign auto_anon_in_1_d_bits_denied = auto_anon_out_d_bits_denied;
	assign auto_anon_in_1_d_bits_data = auto_anon_out_d_bits_data;
	assign auto_anon_in_1_d_bits_corrupt = auto_anon_out_d_bits_corrupt;
	assign auto_anon_in_0_a_ready = portsAOI_filtered_0_ready;
	assign auto_anon_in_0_b_valid = portsBIO_filtered_0_valid;
	assign auto_anon_in_0_b_bits_opcode = auto_anon_out_b_bits_opcode;
	assign auto_anon_in_0_b_bits_param = auto_anon_out_b_bits_param;
	assign auto_anon_in_0_b_bits_size = auto_anon_out_b_bits_size;
	assign auto_anon_in_0_b_bits_source = auto_anon_out_b_bits_source[1:0];
	assign auto_anon_in_0_b_bits_address = auto_anon_out_b_bits_address;
	assign auto_anon_in_0_b_bits_mask = auto_anon_out_b_bits_mask;
	assign auto_anon_in_0_b_bits_data = auto_anon_out_b_bits_data;
	assign auto_anon_in_0_b_bits_corrupt = auto_anon_out_b_bits_corrupt;
	assign auto_anon_in_0_c_ready = auto_anon_out_c_ready;
	assign auto_anon_in_0_d_valid = portsDIO_filtered_0_valid;
	assign auto_anon_in_0_d_bits_opcode = auto_anon_out_d_bits_opcode;
	assign auto_anon_in_0_d_bits_param = auto_anon_out_d_bits_param;
	assign auto_anon_in_0_d_bits_size = auto_anon_out_d_bits_size;
	assign auto_anon_in_0_d_bits_source = auto_anon_out_d_bits_source[1:0];
	assign auto_anon_in_0_d_bits_sink = auto_anon_out_d_bits_sink;
	assign auto_anon_in_0_d_bits_denied = auto_anon_out_d_bits_denied;
	assign auto_anon_in_0_d_bits_data = auto_anon_out_d_bits_data;
	assign auto_anon_in_0_d_bits_corrupt = auto_anon_out_d_bits_corrupt;
	assign auto_anon_in_0_e_ready = auto_anon_out_e_ready;
	assign auto_anon_out_a_valid = out_0_a_valid;
	assign auto_anon_out_a_bits_opcode = (muxState_0 ? auto_anon_in_0_a_bits_opcode : 3'h0) | (muxState_1 ? auto_anon_in_1_a_bits_opcode : 3'h0);
	assign auto_anon_out_a_bits_param = (muxState_0 ? auto_anon_in_0_a_bits_param : 3'h0) | (muxState_1 ? auto_anon_in_1_a_bits_param : 3'h0);
	assign auto_anon_out_a_bits_size = (muxState_0 ? auto_anon_in_0_a_bits_size : 4'h0) | (muxState_1 ? auto_anon_in_1_a_bits_size : 4'h0);
	assign auto_anon_out_a_bits_source = (muxState_0 ? {1'h0, auto_anon_in_0_a_bits_source} : 3'h0) | (muxState_1 ? {2'h2, auto_anon_in_1_a_bits_source} : 3'h0);
	assign auto_anon_out_a_bits_address = (muxState_0 ? auto_anon_in_0_a_bits_address : 32'h00000000) | (muxState_1 ? auto_anon_in_1_a_bits_address : 32'h00000000);
	assign auto_anon_out_a_bits_mask = (muxState_0 ? auto_anon_in_0_a_bits_mask : 8'h00) | (muxState_1 ? auto_anon_in_1_a_bits_mask : 8'h00);
	assign auto_anon_out_a_bits_data = (muxState_0 ? auto_anon_in_0_a_bits_data : 64'h0000000000000000) | (muxState_1 ? auto_anon_in_1_a_bits_data : 64'h0000000000000000);
	assign auto_anon_out_a_bits_corrupt = (muxState_0 & auto_anon_in_0_a_bits_corrupt) | (muxState_1 & auto_anon_in_1_a_bits_corrupt);
	assign auto_anon_out_b_ready = ~auto_anon_out_b_bits_source[2] & auto_anon_in_0_b_ready;
	assign auto_anon_out_c_valid = auto_anon_in_0_c_valid;
	assign auto_anon_out_c_bits_opcode = auto_anon_in_0_c_bits_opcode;
	assign auto_anon_out_c_bits_param = auto_anon_in_0_c_bits_param;
	assign auto_anon_out_c_bits_size = auto_anon_in_0_c_bits_size;
	assign auto_anon_out_c_bits_source = {1'h0, auto_anon_in_0_c_bits_source};
	assign auto_anon_out_c_bits_address = auto_anon_in_0_c_bits_address;
	assign auto_anon_out_c_bits_data = auto_anon_in_0_c_bits_data;
	assign auto_anon_out_c_bits_corrupt = auto_anon_in_0_c_bits_corrupt;
	assign auto_anon_out_d_ready = (~auto_anon_out_d_bits_source[2] & auto_anon_in_0_d_ready) | (requestDOI_0_1 & auto_anon_in_1_d_ready);
	assign auto_anon_out_e_valid = auto_anon_in_0_e_valid;
	assign auto_anon_out_e_bits_sink = auto_anon_in_0_e_bits_sink;
endmodule
