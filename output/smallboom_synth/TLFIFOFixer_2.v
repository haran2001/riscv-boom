module TLFIFOFixer_2 (
	clock,
	reset,
	auto_anon_in_a_ready,
	auto_anon_in_a_valid,
	auto_anon_in_a_bits_opcode,
	auto_anon_in_a_bits_size,
	auto_anon_in_a_bits_source,
	auto_anon_in_a_bits_address,
	auto_anon_in_a_bits_user_amba_prot_bufferable,
	auto_anon_in_a_bits_user_amba_prot_modifiable,
	auto_anon_in_a_bits_user_amba_prot_readalloc,
	auto_anon_in_a_bits_user_amba_prot_writealloc,
	auto_anon_in_a_bits_user_amba_prot_privileged,
	auto_anon_in_a_bits_user_amba_prot_secure,
	auto_anon_in_a_bits_user_amba_prot_fetch,
	auto_anon_in_a_bits_mask,
	auto_anon_in_a_bits_data,
	auto_anon_in_d_ready,
	auto_anon_in_d_valid,
	auto_anon_in_d_bits_opcode,
	auto_anon_in_d_bits_size,
	auto_anon_in_d_bits_source,
	auto_anon_in_d_bits_denied,
	auto_anon_in_d_bits_data,
	auto_anon_in_d_bits_corrupt,
	auto_anon_out_a_ready,
	auto_anon_out_a_valid,
	auto_anon_out_a_bits_opcode,
	auto_anon_out_a_bits_size,
	auto_anon_out_a_bits_source,
	auto_anon_out_a_bits_address,
	auto_anon_out_a_bits_user_amba_prot_bufferable,
	auto_anon_out_a_bits_user_amba_prot_modifiable,
	auto_anon_out_a_bits_user_amba_prot_readalloc,
	auto_anon_out_a_bits_user_amba_prot_writealloc,
	auto_anon_out_a_bits_user_amba_prot_privileged,
	auto_anon_out_a_bits_user_amba_prot_secure,
	auto_anon_out_a_bits_user_amba_prot_fetch,
	auto_anon_out_a_bits_mask,
	auto_anon_out_a_bits_data,
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
	input [3:0] auto_anon_in_a_bits_size;
	input [3:0] auto_anon_in_a_bits_source;
	input [31:0] auto_anon_in_a_bits_address;
	input auto_anon_in_a_bits_user_amba_prot_bufferable;
	input auto_anon_in_a_bits_user_amba_prot_modifiable;
	input auto_anon_in_a_bits_user_amba_prot_readalloc;
	input auto_anon_in_a_bits_user_amba_prot_writealloc;
	input auto_anon_in_a_bits_user_amba_prot_privileged;
	input auto_anon_in_a_bits_user_amba_prot_secure;
	input auto_anon_in_a_bits_user_amba_prot_fetch;
	input [7:0] auto_anon_in_a_bits_mask;
	input [63:0] auto_anon_in_a_bits_data;
	input auto_anon_in_d_ready;
	output wire auto_anon_in_d_valid;
	output wire [2:0] auto_anon_in_d_bits_opcode;
	output wire [3:0] auto_anon_in_d_bits_size;
	output wire [3:0] auto_anon_in_d_bits_source;
	output wire auto_anon_in_d_bits_denied;
	output wire [63:0] auto_anon_in_d_bits_data;
	output wire auto_anon_in_d_bits_corrupt;
	input auto_anon_out_a_ready;
	output wire auto_anon_out_a_valid;
	output wire [2:0] auto_anon_out_a_bits_opcode;
	output wire [3:0] auto_anon_out_a_bits_size;
	output wire [3:0] auto_anon_out_a_bits_source;
	output wire [31:0] auto_anon_out_a_bits_address;
	output wire auto_anon_out_a_bits_user_amba_prot_bufferable;
	output wire auto_anon_out_a_bits_user_amba_prot_modifiable;
	output wire auto_anon_out_a_bits_user_amba_prot_readalloc;
	output wire auto_anon_out_a_bits_user_amba_prot_writealloc;
	output wire auto_anon_out_a_bits_user_amba_prot_privileged;
	output wire auto_anon_out_a_bits_user_amba_prot_secure;
	output wire auto_anon_out_a_bits_user_amba_prot_fetch;
	output wire [7:0] auto_anon_out_a_bits_mask;
	output wire [63:0] auto_anon_out_a_bits_data;
	output wire auto_anon_out_d_ready;
	input auto_anon_out_d_valid;
	input [2:0] auto_anon_out_d_bits_opcode;
	input [1:0] auto_anon_out_d_bits_param;
	input [3:0] auto_anon_out_d_bits_size;
	input [3:0] auto_anon_out_d_bits_source;
	input [1:0] auto_anon_out_d_bits_sink;
	input auto_anon_out_d_bits_denied;
	input [63:0] auto_anon_out_d_bits_data;
	input auto_anon_out_d_bits_corrupt;
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
	reg stalls_id;
	reg stalls_id_1;
	wire stall = (((~auto_anon_in_a_bits_source[3] & a_first) & (((((((flight_0 | flight_1) | flight_2) | flight_3) | flight_4) | flight_5) | flight_6) | flight_7)) & (auto_anon_in_a_bits_address[31] | (stalls_id != ~auto_anon_in_a_bits_address[31]))) | (((auto_anon_in_a_bits_source[3] & a_first) & (((((((flight_8 | flight_9) | flight_10) | flight_11) | flight_12) | flight_13) | flight_14) | flight_15)) & (auto_anon_in_a_bits_address[31] | (stalls_id_1 != ~auto_anon_in_a_bits_address[31])));
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
			flight_0 <= ~(_GEN_0 & (auto_anon_out_d_bits_source == 4'h0)) & ((_GEN & (auto_anon_in_a_bits_source == 4'h0)) | flight_0);
			flight_1 <= ~(_GEN_0 & (auto_anon_out_d_bits_source == 4'h1)) & ((_GEN & (auto_anon_in_a_bits_source == 4'h1)) | flight_1);
			flight_2 <= ~(_GEN_0 & (auto_anon_out_d_bits_source == 4'h2)) & ((_GEN & (auto_anon_in_a_bits_source == 4'h2)) | flight_2);
			flight_3 <= ~(_GEN_0 & (auto_anon_out_d_bits_source == 4'h3)) & ((_GEN & (auto_anon_in_a_bits_source == 4'h3)) | flight_3);
			flight_4 <= ~(_GEN_0 & (auto_anon_out_d_bits_source == 4'h4)) & ((_GEN & (auto_anon_in_a_bits_source == 4'h4)) | flight_4);
			flight_5 <= ~(_GEN_0 & (auto_anon_out_d_bits_source == 4'h5)) & ((_GEN & (auto_anon_in_a_bits_source == 4'h5)) | flight_5);
			flight_6 <= ~(_GEN_0 & (auto_anon_out_d_bits_source == 4'h6)) & ((_GEN & (auto_anon_in_a_bits_source == 4'h6)) | flight_6);
			flight_7 <= ~(_GEN_0 & (auto_anon_out_d_bits_source == 4'h7)) & ((_GEN & (auto_anon_in_a_bits_source == 4'h7)) | flight_7);
			flight_8 <= ~(_GEN_0 & (auto_anon_out_d_bits_source == 4'h8)) & ((_GEN & (auto_anon_in_a_bits_source == 4'h8)) | flight_8);
			flight_9 <= ~(_GEN_0 & (auto_anon_out_d_bits_source == 4'h9)) & ((_GEN & (auto_anon_in_a_bits_source == 4'h9)) | flight_9);
			flight_10 <= ~(_GEN_0 & (auto_anon_out_d_bits_source == 4'ha)) & ((_GEN & (auto_anon_in_a_bits_source == 4'ha)) | flight_10);
			flight_11 <= ~(_GEN_0 & (auto_anon_out_d_bits_source == 4'hb)) & ((_GEN & (auto_anon_in_a_bits_source == 4'hb)) | flight_11);
			flight_12 <= ~(_GEN_0 & (auto_anon_out_d_bits_source == 4'hc)) & ((_GEN & (auto_anon_in_a_bits_source == 4'hc)) | flight_12);
			flight_13 <= ~(_GEN_0 & (auto_anon_out_d_bits_source == 4'hd)) & ((_GEN & (auto_anon_in_a_bits_source == 4'hd)) | flight_13);
			flight_14 <= ~(_GEN_0 & (auto_anon_out_d_bits_source == 4'he)) & ((_GEN & (auto_anon_in_a_bits_source == 4'he)) | flight_14);
			flight_15 <= ~(_GEN_0 & (&auto_anon_out_d_bits_source)) & ((_GEN & (&auto_anon_in_a_bits_source)) | flight_15);
		end
		if (_stalls_id_T_4 & ~auto_anon_in_a_bits_source[3])
			stalls_id <= ~auto_anon_in_a_bits_address[31];
		if (_stalls_id_T_4 & auto_anon_in_a_bits_source[3])
			stalls_id_1 <= ~auto_anon_in_a_bits_address[31];
	end
	TLMonitor_7 monitor(
		.clock(clock),
		.reset(reset),
		.io_in_a_ready(anonIn_a_ready),
		.io_in_a_valid(auto_anon_in_a_valid),
		.io_in_a_bits_opcode(auto_anon_in_a_bits_opcode),
		.io_in_a_bits_size(auto_anon_in_a_bits_size),
		.io_in_a_bits_source(auto_anon_in_a_bits_source),
		.io_in_a_bits_address(auto_anon_in_a_bits_address),
		.io_in_a_bits_mask(auto_anon_in_a_bits_mask),
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
	assign auto_anon_in_d_bits_size = auto_anon_out_d_bits_size;
	assign auto_anon_in_d_bits_source = auto_anon_out_d_bits_source;
	assign auto_anon_in_d_bits_denied = auto_anon_out_d_bits_denied;
	assign auto_anon_in_d_bits_data = auto_anon_out_d_bits_data;
	assign auto_anon_in_d_bits_corrupt = auto_anon_out_d_bits_corrupt;
	assign auto_anon_out_a_valid = auto_anon_in_a_valid & ~stall;
	assign auto_anon_out_a_bits_opcode = auto_anon_in_a_bits_opcode;
	assign auto_anon_out_a_bits_size = auto_anon_in_a_bits_size;
	assign auto_anon_out_a_bits_source = auto_anon_in_a_bits_source;
	assign auto_anon_out_a_bits_address = auto_anon_in_a_bits_address;
	assign auto_anon_out_a_bits_user_amba_prot_bufferable = auto_anon_in_a_bits_user_amba_prot_bufferable;
	assign auto_anon_out_a_bits_user_amba_prot_modifiable = auto_anon_in_a_bits_user_amba_prot_modifiable;
	assign auto_anon_out_a_bits_user_amba_prot_readalloc = auto_anon_in_a_bits_user_amba_prot_readalloc;
	assign auto_anon_out_a_bits_user_amba_prot_writealloc = auto_anon_in_a_bits_user_amba_prot_writealloc;
	assign auto_anon_out_a_bits_user_amba_prot_privileged = auto_anon_in_a_bits_user_amba_prot_privileged;
	assign auto_anon_out_a_bits_user_amba_prot_secure = auto_anon_in_a_bits_user_amba_prot_secure;
	assign auto_anon_out_a_bits_user_amba_prot_fetch = auto_anon_in_a_bits_user_amba_prot_fetch;
	assign auto_anon_out_a_bits_mask = auto_anon_in_a_bits_mask;
	assign auto_anon_out_a_bits_data = auto_anon_in_a_bits_data;
	assign auto_anon_out_d_ready = auto_anon_in_d_ready;
endmodule
