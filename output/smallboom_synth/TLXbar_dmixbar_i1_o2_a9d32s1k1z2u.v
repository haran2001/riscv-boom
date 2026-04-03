module TLXbar_dmixbar_i1_o2_a9d32s1k1z2u (
	clock,
	reset,
	auto_anon_in_a_ready,
	auto_anon_in_a_valid,
	auto_anon_in_a_bits_opcode,
	auto_anon_in_a_bits_address,
	auto_anon_in_a_bits_data,
	auto_anon_in_d_ready,
	auto_anon_in_d_valid,
	auto_anon_in_d_bits_denied,
	auto_anon_in_d_bits_data,
	auto_anon_in_d_bits_corrupt,
	auto_anon_out_1_a_ready,
	auto_anon_out_1_a_valid,
	auto_anon_out_1_a_bits_opcode,
	auto_anon_out_1_a_bits_address,
	auto_anon_out_1_a_bits_data,
	auto_anon_out_1_d_ready,
	auto_anon_out_1_d_valid,
	auto_anon_out_1_d_bits_opcode,
	auto_anon_out_1_d_bits_data,
	auto_anon_out_0_a_ready,
	auto_anon_out_0_a_valid,
	auto_anon_out_0_a_bits_opcode,
	auto_anon_out_0_a_bits_address,
	auto_anon_out_0_a_bits_data,
	auto_anon_out_0_d_ready,
	auto_anon_out_0_d_valid,
	auto_anon_out_0_d_bits_opcode,
	auto_anon_out_0_d_bits_param,
	auto_anon_out_0_d_bits_size,
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
	input [8:0] auto_anon_in_a_bits_address;
	input [31:0] auto_anon_in_a_bits_data;
	input auto_anon_in_d_ready;
	output wire auto_anon_in_d_valid;
	output wire auto_anon_in_d_bits_denied;
	output wire [31:0] auto_anon_in_d_bits_data;
	output wire auto_anon_in_d_bits_corrupt;
	input auto_anon_out_1_a_ready;
	output wire auto_anon_out_1_a_valid;
	output wire [2:0] auto_anon_out_1_a_bits_opcode;
	output wire [6:0] auto_anon_out_1_a_bits_address;
	output wire [31:0] auto_anon_out_1_a_bits_data;
	output wire auto_anon_out_1_d_ready;
	input auto_anon_out_1_d_valid;
	input [2:0] auto_anon_out_1_d_bits_opcode;
	input [31:0] auto_anon_out_1_d_bits_data;
	input auto_anon_out_0_a_ready;
	output wire auto_anon_out_0_a_valid;
	output wire [2:0] auto_anon_out_0_a_bits_opcode;
	output wire [8:0] auto_anon_out_0_a_bits_address;
	output wire [31:0] auto_anon_out_0_a_bits_data;
	output wire auto_anon_out_0_d_ready;
	input auto_anon_out_0_d_valid;
	input [2:0] auto_anon_out_0_d_bits_opcode;
	input [1:0] auto_anon_out_0_d_bits_param;
	input [1:0] auto_anon_out_0_d_bits_size;
	input auto_anon_out_0_d_bits_sink;
	input auto_anon_out_0_d_bits_denied;
	input [31:0] auto_anon_out_0_d_bits_data;
	input auto_anon_out_0_d_bits_corrupt;
	wire [4:0] _GEN = auto_anon_in_a_bits_address[6:2] ^ 5'h11;
	wire requestAIO_0_0 = (((((auto_anon_in_a_bits_address[8:6] == 3'h0) | ({auto_anon_in_a_bits_address[8:7], _GEN[4:2], _GEN[0]} == 6'h00)) | ({auto_anon_in_a_bits_address[8:7], auto_anon_in_a_bits_address[6:3] ^ 4'hb} == 6'h00)) | ({auto_anon_in_a_bits_address[8:7], ~auto_anon_in_a_bits_address[6:5]} == 4'h0)) | ({auto_anon_in_a_bits_address[8], ~auto_anon_in_a_bits_address[7]} == 2'h0)) | auto_anon_in_a_bits_address[8];
	wire requestAIO_0_1 = ({auto_anon_in_a_bits_address[8:7], auto_anon_in_a_bits_address[6:4] ^ 3'h4, auto_anon_in_a_bits_address[2]} == 6'h00) | ({auto_anon_in_a_bits_address[8:7], auto_anon_in_a_bits_address[6:3] ^ 4'ha} == 6'h00);
	wire _portsAOI_in_0_a_ready_T_2 = (requestAIO_0_0 & auto_anon_out_0_a_ready) | (requestAIO_0_1 & auto_anon_out_1_a_ready);
	reg beatsLeft;
	wire [1:0] readys_valid = {auto_anon_out_1_d_valid, auto_anon_out_0_d_valid};
	reg [1:0] readys_mask;
	wire [1:0] _readys_filter_T_1 = readys_valid & ~readys_mask;
	wire [1:0] readys_readys = ~({readys_mask[1], _readys_filter_T_1[1] | readys_mask[0]} & ({_readys_filter_T_1[0], auto_anon_out_1_d_valid} | _readys_filter_T_1));
	wire winner_0 = readys_readys[0] & auto_anon_out_0_d_valid;
	wire winner_1 = readys_readys[1] & auto_anon_out_1_d_valid;
	wire _in_0_d_valid_T = auto_anon_out_0_d_valid | auto_anon_out_1_d_valid;
	reg state_0;
	reg state_1;
	wire muxState_0 = (beatsLeft ? state_0 : winner_0);
	wire muxState_1 = (beatsLeft ? state_1 : winner_1);
	wire in_0_d_valid = (beatsLeft ? (state_0 & auto_anon_out_0_d_valid) | (state_1 & auto_anon_out_1_d_valid) : _in_0_d_valid_T);
	wire _in_0_d_bits_T = muxState_0 & auto_anon_out_0_d_bits_corrupt;
	wire _in_0_d_bits_T_6 = muxState_0 & auto_anon_out_0_d_bits_denied;
	always @(posedge clock)
		if (reset) begin
			beatsLeft <= 1'h0;
			readys_mask <= 2'h3;
			state_0 <= 1'h0;
			state_1 <= 1'h0;
		end
		else begin : sv2v_autoblock_1
			reg latch;
			latch = ~beatsLeft & auto_anon_in_d_ready;
			beatsLeft <= ~latch & (beatsLeft - (auto_anon_in_d_ready & in_0_d_valid));
			if (latch & |readys_valid) begin : sv2v_autoblock_2
				reg [1:0] _readys_mask_T;
				_readys_mask_T = readys_readys & readys_valid;
				readys_mask <= _readys_mask_T | {_readys_mask_T[0], 1'h0};
			end
			if (beatsLeft)
				;
			else begin
				state_0 <= winner_0;
				state_1 <= winner_1;
			end
		end
	TLMonitor_30 monitor(
		.clock(clock),
		.reset(reset),
		.io_in_a_ready(_portsAOI_in_0_a_ready_T_2),
		.io_in_a_valid(auto_anon_in_a_valid),
		.io_in_a_bits_opcode(auto_anon_in_a_bits_opcode),
		.io_in_a_bits_address(auto_anon_in_a_bits_address),
		.io_in_d_ready(auto_anon_in_d_ready),
		.io_in_d_valid(in_0_d_valid),
		.io_in_d_bits_opcode((muxState_0 ? auto_anon_out_0_d_bits_opcode : 3'h0) | (muxState_1 ? auto_anon_out_1_d_bits_opcode : 3'h0)),
		.io_in_d_bits_param((muxState_0 ? auto_anon_out_0_d_bits_param : 2'h0)),
		.io_in_d_bits_size((muxState_0 ? auto_anon_out_0_d_bits_size : 2'h0) | {muxState_1, 1'h0}),
		.io_in_d_bits_sink(muxState_0 & auto_anon_out_0_d_bits_sink),
		.io_in_d_bits_denied(_in_0_d_bits_T_6),
		.io_in_d_bits_corrupt(_in_0_d_bits_T)
	);
	assign auto_anon_in_a_ready = _portsAOI_in_0_a_ready_T_2;
	assign auto_anon_in_d_valid = in_0_d_valid;
	assign auto_anon_in_d_bits_denied = _in_0_d_bits_T_6;
	assign auto_anon_in_d_bits_data = (muxState_0 ? auto_anon_out_0_d_bits_data : 32'h00000000) | (muxState_1 ? auto_anon_out_1_d_bits_data : 32'h00000000);
	assign auto_anon_in_d_bits_corrupt = _in_0_d_bits_T;
	assign auto_anon_out_1_a_valid = auto_anon_in_a_valid & requestAIO_0_1;
	assign auto_anon_out_1_a_bits_opcode = auto_anon_in_a_bits_opcode;
	assign auto_anon_out_1_a_bits_address = auto_anon_in_a_bits_address[6:0];
	assign auto_anon_out_1_a_bits_data = auto_anon_in_a_bits_data;
	assign auto_anon_out_1_d_ready = auto_anon_in_d_ready & (beatsLeft ? state_1 : readys_readys[1]);
	assign auto_anon_out_0_a_valid = auto_anon_in_a_valid & requestAIO_0_0;
	assign auto_anon_out_0_a_bits_opcode = auto_anon_in_a_bits_opcode;
	assign auto_anon_out_0_a_bits_address = auto_anon_in_a_bits_address;
	assign auto_anon_out_0_a_bits_data = auto_anon_in_a_bits_data;
	assign auto_anon_out_0_d_ready = auto_anon_in_d_ready & (beatsLeft ? state_0 : readys_readys[0]);
endmodule
