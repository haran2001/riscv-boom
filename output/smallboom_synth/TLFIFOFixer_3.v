module TLFIFOFixer_3 (
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
	auto_anon_out_d_ready,
	auto_anon_out_d_valid,
	auto_anon_out_d_bits_opcode,
	auto_anon_out_d_bits_param,
	auto_anon_out_d_bits_size,
	auto_anon_out_d_bits_source,
	auto_anon_out_d_bits_sink,
	auto_anon_out_d_bits_denied,
	auto_anon_out_d_bits_data,
	auto_anon_out_d_bits_corrupt
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
	input auto_anon_out_a_ready;
	output wire auto_anon_out_a_valid;
	output wire [2:0] auto_anon_out_a_bits_opcode;
	output wire [2:0] auto_anon_out_a_bits_param;
	output wire [3:0] auto_anon_out_a_bits_size;
	output wire [4:0] auto_anon_out_a_bits_source;
	output wire [27:0] auto_anon_out_a_bits_address;
	output wire [7:0] auto_anon_out_a_bits_mask;
	output wire [63:0] auto_anon_out_a_bits_data;
	output wire auto_anon_out_a_bits_corrupt;
	output wire auto_anon_out_d_ready;
	input auto_anon_out_d_valid;
	input [2:0] auto_anon_out_d_bits_opcode;
	input [1:0] auto_anon_out_d_bits_param;
	input [3:0] auto_anon_out_d_bits_size;
	input [4:0] auto_anon_out_d_bits_source;
	input auto_anon_out_d_bits_sink;
	input auto_anon_out_d_bits_denied;
	input [63:0] auto_anon_out_d_bits_data;
	input auto_anon_out_d_bits_corrupt;
	wire [2:0] _a_id_T_31 = {{auto_anon_in_a_bits_address[27], auto_anon_in_a_bits_address[25], auto_anon_in_a_bits_address[16], auto_anon_in_a_bits_address[13]} == 4'h0, 1'h0, {auto_anon_in_a_bits_address[27], auto_anon_in_a_bits_address[25], auto_anon_in_a_bits_address[16], ~auto_anon_in_a_bits_address[13]} == 4'h0} | ({auto_anon_in_a_bits_address[27], auto_anon_in_a_bits_address[25], ~auto_anon_in_a_bits_address[16]} == 3'h0 ? 3'h5 : 3'h0);
	wire [2:0] a_id = {_a_id_T_31[2], (_a_id_T_31[1:0] | {{auto_anon_in_a_bits_address[27], ~auto_anon_in_a_bits_address[25], auto_anon_in_a_bits_address[16]} == 3'h0, 1'h0}) | {2 {auto_anon_in_a_bits_address[27]}}};
	wire a_noDomain = a_id == 3'h0;
	reg [8:0] a_first_counter;
	wire a_first = a_first_counter == 9'h000;
	reg [8:0] d_first_counter;
	reg flight_0;
	reg flight_1;
	reg flight_2;
	reg flight_3;
	reg flight_4;
	reg flight_5;
	reg flight_6;
	reg flight_7;
	reg flight_8;
	reg flight_9;
	reg flight_10;
	reg flight_11;
	reg flight_12;
	reg flight_13;
	reg flight_14;
	reg flight_15;
	wire stalls_a_sel = auto_anon_in_a_bits_source[4:3] == 2'h0;
	reg [2:0] stalls_id;
	wire stalls_a_sel_1 = auto_anon_in_a_bits_source[4:3] == 2'h1;
	reg [2:0] stalls_id_1;
	wire stall = (((stalls_a_sel & a_first) & (((((((flight_0 | flight_1) | flight_2) | flight_3) | flight_4) | flight_5) | flight_6) | flight_7)) & (a_noDomain | (stalls_id != a_id))) | (((stalls_a_sel_1 & a_first) & (((((((flight_8 | flight_9) | flight_10) | flight_11) | flight_12) | flight_13) | flight_14) | flight_15)) & (a_noDomain | (stalls_id_1 != a_id)));
	wire anonIn_a_ready = auto_anon_out_a_ready & ~stall;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg _stalls_id_T_4;
		_stalls_id_T_4 = anonIn_a_ready & auto_anon_in_a_valid;
		if (reset) begin
			a_first_counter <= 9'h000;
			d_first_counter <= 9'h000;
			flight_0 <= 1'h0;
			flight_1 <= 1'h0;
			flight_2 <= 1'h0;
			flight_3 <= 1'h0;
			flight_4 <= 1'h0;
			flight_5 <= 1'h0;
			flight_6 <= 1'h0;
			flight_7 <= 1'h0;
			flight_8 <= 1'h0;
			flight_9 <= 1'h0;
			flight_10 <= 1'h0;
			flight_11 <= 1'h0;
			flight_12 <= 1'h0;
			flight_13 <= 1'h0;
			flight_14 <= 1'h0;
			flight_15 <= 1'h0;
		end
		else begin : sv2v_autoblock_2
			reg d_first_first;
			reg _GEN;
			reg _GEN_0;
			d_first_first = d_first_counter == 9'h000;
			_GEN = a_first & _stalls_id_T_4;
			_GEN_0 = ((d_first_first & (auto_anon_out_d_bits_opcode != 3'h6)) & auto_anon_in_d_ready) & auto_anon_out_d_valid;
			if (_stalls_id_T_4) begin
				if (a_first) begin : sv2v_autoblock_3
					reg [26:0] _a_first_beats1_decode_T;
					_a_first_beats1_decode_T = 27'h0000fff << auto_anon_in_a_bits_size;
					a_first_counter <= (auto_anon_in_a_bits_opcode[2] ? 9'h000 : ~_a_first_beats1_decode_T[11:3]);
				end
				else
					a_first_counter <= a_first_counter - 9'h001;
			end
			if (auto_anon_in_d_ready & auto_anon_out_d_valid) begin
				if (d_first_first) begin : sv2v_autoblock_4
					reg [26:0] _d_first_beats1_decode_T;
					_d_first_beats1_decode_T = 27'h0000fff << auto_anon_out_d_bits_size;
					d_first_counter <= (auto_anon_out_d_bits_opcode[0] ? ~_d_first_beats1_decode_T[11:3] : 9'h000);
				end
				else
					d_first_counter <= d_first_counter - 9'h001;
			end
			flight_0 <= ~(_GEN_0 & (auto_anon_out_d_bits_source == 5'h00)) & ((_GEN & (auto_anon_in_a_bits_source == 5'h00)) | flight_0);
			flight_1 <= ~(_GEN_0 & (auto_anon_out_d_bits_source == 5'h01)) & ((_GEN & (auto_anon_in_a_bits_source == 5'h01)) | flight_1);
			flight_2 <= ~(_GEN_0 & (auto_anon_out_d_bits_source == 5'h02)) & ((_GEN & (auto_anon_in_a_bits_source == 5'h02)) | flight_2);
			flight_3 <= ~(_GEN_0 & (auto_anon_out_d_bits_source == 5'h03)) & ((_GEN & (auto_anon_in_a_bits_source == 5'h03)) | flight_3);
			flight_4 <= ~(_GEN_0 & (auto_anon_out_d_bits_source == 5'h04)) & ((_GEN & (auto_anon_in_a_bits_source == 5'h04)) | flight_4);
			flight_5 <= ~(_GEN_0 & (auto_anon_out_d_bits_source == 5'h05)) & ((_GEN & (auto_anon_in_a_bits_source == 5'h05)) | flight_5);
			flight_6 <= ~(_GEN_0 & (auto_anon_out_d_bits_source == 5'h06)) & ((_GEN & (auto_anon_in_a_bits_source == 5'h06)) | flight_6);
			flight_7 <= ~(_GEN_0 & (auto_anon_out_d_bits_source == 5'h07)) & ((_GEN & (auto_anon_in_a_bits_source == 5'h07)) | flight_7);
			flight_8 <= ~(_GEN_0 & (auto_anon_out_d_bits_source == 5'h08)) & ((_GEN & (auto_anon_in_a_bits_source == 5'h08)) | flight_8);
			flight_9 <= ~(_GEN_0 & (auto_anon_out_d_bits_source == 5'h09)) & ((_GEN & (auto_anon_in_a_bits_source == 5'h09)) | flight_9);
			flight_10 <= ~(_GEN_0 & (auto_anon_out_d_bits_source == 5'h0a)) & ((_GEN & (auto_anon_in_a_bits_source == 5'h0a)) | flight_10);
			flight_11 <= ~(_GEN_0 & (auto_anon_out_d_bits_source == 5'h0b)) & ((_GEN & (auto_anon_in_a_bits_source == 5'h0b)) | flight_11);
			flight_12 <= ~(_GEN_0 & (auto_anon_out_d_bits_source == 5'h0c)) & ((_GEN & (auto_anon_in_a_bits_source == 5'h0c)) | flight_12);
			flight_13 <= ~(_GEN_0 & (auto_anon_out_d_bits_source == 5'h0d)) & ((_GEN & (auto_anon_in_a_bits_source == 5'h0d)) | flight_13);
			flight_14 <= ~(_GEN_0 & (auto_anon_out_d_bits_source == 5'h0e)) & ((_GEN & (auto_anon_in_a_bits_source == 5'h0e)) | flight_14);
			flight_15 <= ~(_GEN_0 & (auto_anon_out_d_bits_source == 5'h0f)) & ((_GEN & (auto_anon_in_a_bits_source == 5'h0f)) | flight_15);
		end
		if (_stalls_id_T_4 & stalls_a_sel)
			stalls_id <= a_id;
		if (_stalls_id_T_4 & stalls_a_sel_1)
			stalls_id_1 <= a_id;
	end
	TLMonitor_8 monitor(
		.clock(clock),
		.reset(reset),
		.io_in_a_ready(anonIn_a_ready),
		.io_in_a_valid(auto_anon_in_a_valid),
		.io_in_a_bits_opcode(auto_anon_in_a_bits_opcode),
		.io_in_a_bits_param(auto_anon_in_a_bits_param),
		.io_in_a_bits_size(auto_anon_in_a_bits_size),
		.io_in_a_bits_source(auto_anon_in_a_bits_source),
		.io_in_a_bits_address(auto_anon_in_a_bits_address),
		.io_in_a_bits_mask(auto_anon_in_a_bits_mask),
		.io_in_a_bits_corrupt(auto_anon_in_a_bits_corrupt),
		.io_in_d_ready(auto_anon_in_d_ready),
		.io_in_d_valid(auto_anon_out_d_valid),
		.io_in_d_bits_opcode(auto_anon_out_d_bits_opcode),
		.io_in_d_bits_param(auto_anon_out_d_bits_param),
		.io_in_d_bits_size(auto_anon_out_d_bits_size),
		.io_in_d_bits_source(auto_anon_out_d_bits_source),
		.io_in_d_bits_sink(auto_anon_out_d_bits_sink),
		.io_in_d_bits_denied(auto_anon_out_d_bits_denied),
		.io_in_d_bits_corrupt(auto_anon_out_d_bits_corrupt)
	);
	assign auto_anon_in_a_ready = anonIn_a_ready;
	assign auto_anon_in_d_valid = auto_anon_out_d_valid;
	assign auto_anon_in_d_bits_opcode = auto_anon_out_d_bits_opcode;
	assign auto_anon_in_d_bits_param = auto_anon_out_d_bits_param;
	assign auto_anon_in_d_bits_size = auto_anon_out_d_bits_size;
	assign auto_anon_in_d_bits_source = auto_anon_out_d_bits_source;
	assign auto_anon_in_d_bits_sink = auto_anon_out_d_bits_sink;
	assign auto_anon_in_d_bits_denied = auto_anon_out_d_bits_denied;
	assign auto_anon_in_d_bits_data = auto_anon_out_d_bits_data;
	assign auto_anon_in_d_bits_corrupt = auto_anon_out_d_bits_corrupt;
	assign auto_anon_out_a_valid = auto_anon_in_a_valid & ~stall;
	assign auto_anon_out_a_bits_opcode = auto_anon_in_a_bits_opcode;
	assign auto_anon_out_a_bits_param = auto_anon_in_a_bits_param;
	assign auto_anon_out_a_bits_size = auto_anon_in_a_bits_size;
	assign auto_anon_out_a_bits_source = auto_anon_in_a_bits_source;
	assign auto_anon_out_a_bits_address = auto_anon_in_a_bits_address;
	assign auto_anon_out_a_bits_mask = auto_anon_in_a_bits_mask;
	assign auto_anon_out_a_bits_data = auto_anon_in_a_bits_data;
	assign auto_anon_out_a_bits_corrupt = auto_anon_in_a_bits_corrupt;
	assign auto_anon_out_d_ready = auto_anon_in_d_ready;
endmodule
