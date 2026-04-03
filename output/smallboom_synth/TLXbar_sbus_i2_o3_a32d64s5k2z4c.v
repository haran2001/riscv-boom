module TLXbar_sbus_i2_o3_a32d64s5k2z4c (
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
	auto_anon_in_1_b_ready,
	auto_anon_in_1_b_valid,
	auto_anon_in_1_b_bits_param,
	auto_anon_in_1_b_bits_address,
	auto_anon_in_1_c_ready,
	auto_anon_in_1_c_valid,
	auto_anon_in_1_c_bits_opcode,
	auto_anon_in_1_c_bits_param,
	auto_anon_in_1_c_bits_size,
	auto_anon_in_1_c_bits_source,
	auto_anon_in_1_c_bits_address,
	auto_anon_in_1_c_bits_data,
	auto_anon_in_1_c_bits_corrupt,
	auto_anon_in_1_d_ready,
	auto_anon_in_1_d_valid,
	auto_anon_in_1_d_bits_opcode,
	auto_anon_in_1_d_bits_param,
	auto_anon_in_1_d_bits_size,
	auto_anon_in_1_d_bits_source,
	auto_anon_in_1_d_bits_sink,
	auto_anon_in_1_d_bits_denied,
	auto_anon_in_1_d_bits_data,
	auto_anon_in_1_d_bits_corrupt,
	auto_anon_in_1_e_valid,
	auto_anon_in_1_e_bits_sink,
	auto_anon_in_0_a_ready,
	auto_anon_in_0_a_valid,
	auto_anon_in_0_a_bits_opcode,
	auto_anon_in_0_a_bits_param,
	auto_anon_in_0_a_bits_size,
	auto_anon_in_0_a_bits_source,
	auto_anon_in_0_a_bits_address,
	auto_anon_in_0_a_bits_user_amba_prot_bufferable,
	auto_anon_in_0_a_bits_user_amba_prot_modifiable,
	auto_anon_in_0_a_bits_user_amba_prot_readalloc,
	auto_anon_in_0_a_bits_user_amba_prot_writealloc,
	auto_anon_in_0_a_bits_user_amba_prot_privileged,
	auto_anon_in_0_a_bits_user_amba_prot_secure,
	auto_anon_in_0_a_bits_user_amba_prot_fetch,
	auto_anon_in_0_a_bits_mask,
	auto_anon_in_0_a_bits_data,
	auto_anon_in_0_a_bits_corrupt,
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
	auto_anon_out_2_a_ready,
	auto_anon_out_2_a_valid,
	auto_anon_out_2_a_bits_opcode,
	auto_anon_out_2_a_bits_param,
	auto_anon_out_2_a_bits_size,
	auto_anon_out_2_a_bits_source,
	auto_anon_out_2_a_bits_address,
	auto_anon_out_2_a_bits_user_amba_prot_bufferable,
	auto_anon_out_2_a_bits_user_amba_prot_modifiable,
	auto_anon_out_2_a_bits_user_amba_prot_readalloc,
	auto_anon_out_2_a_bits_user_amba_prot_writealloc,
	auto_anon_out_2_a_bits_user_amba_prot_privileged,
	auto_anon_out_2_a_bits_user_amba_prot_secure,
	auto_anon_out_2_a_bits_user_amba_prot_fetch,
	auto_anon_out_2_a_bits_mask,
	auto_anon_out_2_a_bits_data,
	auto_anon_out_2_a_bits_corrupt,
	auto_anon_out_2_d_ready,
	auto_anon_out_2_d_valid,
	auto_anon_out_2_d_bits_opcode,
	auto_anon_out_2_d_bits_size,
	auto_anon_out_2_d_bits_source,
	auto_anon_out_2_d_bits_denied,
	auto_anon_out_2_d_bits_data,
	auto_anon_out_2_d_bits_corrupt,
	auto_anon_out_1_a_ready,
	auto_anon_out_1_a_valid,
	auto_anon_out_1_a_bits_opcode,
	auto_anon_out_1_a_bits_param,
	auto_anon_out_1_a_bits_size,
	auto_anon_out_1_a_bits_source,
	auto_anon_out_1_a_bits_address,
	auto_anon_out_1_a_bits_user_amba_prot_bufferable,
	auto_anon_out_1_a_bits_user_amba_prot_modifiable,
	auto_anon_out_1_a_bits_user_amba_prot_readalloc,
	auto_anon_out_1_a_bits_user_amba_prot_writealloc,
	auto_anon_out_1_a_bits_user_amba_prot_privileged,
	auto_anon_out_1_a_bits_user_amba_prot_secure,
	auto_anon_out_1_a_bits_user_amba_prot_fetch,
	auto_anon_out_1_a_bits_mask,
	auto_anon_out_1_a_bits_data,
	auto_anon_out_1_a_bits_corrupt,
	auto_anon_out_1_b_ready,
	auto_anon_out_1_b_valid,
	auto_anon_out_1_b_bits_param,
	auto_anon_out_1_b_bits_address,
	auto_anon_out_1_c_ready,
	auto_anon_out_1_c_valid,
	auto_anon_out_1_c_bits_opcode,
	auto_anon_out_1_c_bits_param,
	auto_anon_out_1_c_bits_size,
	auto_anon_out_1_c_bits_source,
	auto_anon_out_1_c_bits_address,
	auto_anon_out_1_c_bits_data,
	auto_anon_out_1_c_bits_corrupt,
	auto_anon_out_1_d_ready,
	auto_anon_out_1_d_valid,
	auto_anon_out_1_d_bits_opcode,
	auto_anon_out_1_d_bits_param,
	auto_anon_out_1_d_bits_size,
	auto_anon_out_1_d_bits_source,
	auto_anon_out_1_d_bits_sink,
	auto_anon_out_1_d_bits_denied,
	auto_anon_out_1_d_bits_data,
	auto_anon_out_1_d_bits_corrupt,
	auto_anon_out_1_e_valid,
	auto_anon_out_1_e_bits_sink,
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
	output wire auto_anon_in_1_a_ready;
	input auto_anon_in_1_a_valid;
	input [2:0] auto_anon_in_1_a_bits_opcode;
	input [2:0] auto_anon_in_1_a_bits_param;
	input [3:0] auto_anon_in_1_a_bits_size;
	input [2:0] auto_anon_in_1_a_bits_source;
	input [31:0] auto_anon_in_1_a_bits_address;
	input [7:0] auto_anon_in_1_a_bits_mask;
	input [63:0] auto_anon_in_1_a_bits_data;
	input auto_anon_in_1_a_bits_corrupt;
	input auto_anon_in_1_b_ready;
	output wire auto_anon_in_1_b_valid;
	output wire [1:0] auto_anon_in_1_b_bits_param;
	output wire [31:0] auto_anon_in_1_b_bits_address;
	output wire auto_anon_in_1_c_ready;
	input auto_anon_in_1_c_valid;
	input [2:0] auto_anon_in_1_c_bits_opcode;
	input [2:0] auto_anon_in_1_c_bits_param;
	input [3:0] auto_anon_in_1_c_bits_size;
	input [2:0] auto_anon_in_1_c_bits_source;
	input [31:0] auto_anon_in_1_c_bits_address;
	input [63:0] auto_anon_in_1_c_bits_data;
	input auto_anon_in_1_c_bits_corrupt;
	input auto_anon_in_1_d_ready;
	output wire auto_anon_in_1_d_valid;
	output wire [2:0] auto_anon_in_1_d_bits_opcode;
	output wire [1:0] auto_anon_in_1_d_bits_param;
	output wire [3:0] auto_anon_in_1_d_bits_size;
	output wire [2:0] auto_anon_in_1_d_bits_source;
	output wire [1:0] auto_anon_in_1_d_bits_sink;
	output wire auto_anon_in_1_d_bits_denied;
	output wire [63:0] auto_anon_in_1_d_bits_data;
	output wire auto_anon_in_1_d_bits_corrupt;
	input auto_anon_in_1_e_valid;
	input [1:0] auto_anon_in_1_e_bits_sink;
	output wire auto_anon_in_0_a_ready;
	input auto_anon_in_0_a_valid;
	input [2:0] auto_anon_in_0_a_bits_opcode;
	input [2:0] auto_anon_in_0_a_bits_param;
	input [3:0] auto_anon_in_0_a_bits_size;
	input [3:0] auto_anon_in_0_a_bits_source;
	input [31:0] auto_anon_in_0_a_bits_address;
	input auto_anon_in_0_a_bits_user_amba_prot_bufferable;
	input auto_anon_in_0_a_bits_user_amba_prot_modifiable;
	input auto_anon_in_0_a_bits_user_amba_prot_readalloc;
	input auto_anon_in_0_a_bits_user_amba_prot_writealloc;
	input auto_anon_in_0_a_bits_user_amba_prot_privileged;
	input auto_anon_in_0_a_bits_user_amba_prot_secure;
	input auto_anon_in_0_a_bits_user_amba_prot_fetch;
	input [7:0] auto_anon_in_0_a_bits_mask;
	input [63:0] auto_anon_in_0_a_bits_data;
	input auto_anon_in_0_a_bits_corrupt;
	input auto_anon_in_0_d_ready;
	output wire auto_anon_in_0_d_valid;
	output wire [2:0] auto_anon_in_0_d_bits_opcode;
	output wire [1:0] auto_anon_in_0_d_bits_param;
	output wire [3:0] auto_anon_in_0_d_bits_size;
	output wire [3:0] auto_anon_in_0_d_bits_source;
	output wire [1:0] auto_anon_in_0_d_bits_sink;
	output wire auto_anon_in_0_d_bits_denied;
	output wire [63:0] auto_anon_in_0_d_bits_data;
	output wire auto_anon_in_0_d_bits_corrupt;
	input auto_anon_out_2_a_ready;
	output wire auto_anon_out_2_a_valid;
	output wire [2:0] auto_anon_out_2_a_bits_opcode;
	output wire [2:0] auto_anon_out_2_a_bits_param;
	output wire [3:0] auto_anon_out_2_a_bits_size;
	output wire [4:0] auto_anon_out_2_a_bits_source;
	output wire [30:0] auto_anon_out_2_a_bits_address;
	output wire auto_anon_out_2_a_bits_user_amba_prot_bufferable;
	output wire auto_anon_out_2_a_bits_user_amba_prot_modifiable;
	output wire auto_anon_out_2_a_bits_user_amba_prot_readalloc;
	output wire auto_anon_out_2_a_bits_user_amba_prot_writealloc;
	output wire auto_anon_out_2_a_bits_user_amba_prot_privileged;
	output wire auto_anon_out_2_a_bits_user_amba_prot_secure;
	output wire auto_anon_out_2_a_bits_user_amba_prot_fetch;
	output wire [7:0] auto_anon_out_2_a_bits_mask;
	output wire [63:0] auto_anon_out_2_a_bits_data;
	output wire auto_anon_out_2_a_bits_corrupt;
	output wire auto_anon_out_2_d_ready;
	input auto_anon_out_2_d_valid;
	input [2:0] auto_anon_out_2_d_bits_opcode;
	input [3:0] auto_anon_out_2_d_bits_size;
	input [4:0] auto_anon_out_2_d_bits_source;
	input auto_anon_out_2_d_bits_denied;
	input [63:0] auto_anon_out_2_d_bits_data;
	input auto_anon_out_2_d_bits_corrupt;
	input auto_anon_out_1_a_ready;
	output wire auto_anon_out_1_a_valid;
	output wire [2:0] auto_anon_out_1_a_bits_opcode;
	output wire [2:0] auto_anon_out_1_a_bits_param;
	output wire [2:0] auto_anon_out_1_a_bits_size;
	output wire [4:0] auto_anon_out_1_a_bits_source;
	output wire [31:0] auto_anon_out_1_a_bits_address;
	output wire auto_anon_out_1_a_bits_user_amba_prot_bufferable;
	output wire auto_anon_out_1_a_bits_user_amba_prot_modifiable;
	output wire auto_anon_out_1_a_bits_user_amba_prot_readalloc;
	output wire auto_anon_out_1_a_bits_user_amba_prot_writealloc;
	output wire auto_anon_out_1_a_bits_user_amba_prot_privileged;
	output wire auto_anon_out_1_a_bits_user_amba_prot_secure;
	output wire auto_anon_out_1_a_bits_user_amba_prot_fetch;
	output wire [7:0] auto_anon_out_1_a_bits_mask;
	output wire [63:0] auto_anon_out_1_a_bits_data;
	output wire auto_anon_out_1_a_bits_corrupt;
	output wire auto_anon_out_1_b_ready;
	input auto_anon_out_1_b_valid;
	input [1:0] auto_anon_out_1_b_bits_param;
	input [31:0] auto_anon_out_1_b_bits_address;
	input auto_anon_out_1_c_ready;
	output wire auto_anon_out_1_c_valid;
	output wire [2:0] auto_anon_out_1_c_bits_opcode;
	output wire [2:0] auto_anon_out_1_c_bits_param;
	output wire [2:0] auto_anon_out_1_c_bits_size;
	output wire [4:0] auto_anon_out_1_c_bits_source;
	output wire [31:0] auto_anon_out_1_c_bits_address;
	output wire [63:0] auto_anon_out_1_c_bits_data;
	output wire auto_anon_out_1_c_bits_corrupt;
	output wire auto_anon_out_1_d_ready;
	input auto_anon_out_1_d_valid;
	input [2:0] auto_anon_out_1_d_bits_opcode;
	input [1:0] auto_anon_out_1_d_bits_param;
	input [2:0] auto_anon_out_1_d_bits_size;
	input [4:0] auto_anon_out_1_d_bits_source;
	input [1:0] auto_anon_out_1_d_bits_sink;
	input auto_anon_out_1_d_bits_denied;
	input [63:0] auto_anon_out_1_d_bits_data;
	input auto_anon_out_1_d_bits_corrupt;
	output wire auto_anon_out_1_e_valid;
	output wire [1:0] auto_anon_out_1_e_bits_sink;
	input auto_anon_out_0_a_ready;
	output wire auto_anon_out_0_a_valid;
	output wire [2:0] auto_anon_out_0_a_bits_opcode;
	output wire [2:0] auto_anon_out_0_a_bits_param;
	output wire [3:0] auto_anon_out_0_a_bits_size;
	output wire [4:0] auto_anon_out_0_a_bits_source;
	output wire [27:0] auto_anon_out_0_a_bits_address;
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
	wire allowed_4_2;
	wire allowed_4_1;
	wire allowed_4_0;
	wire allowed_3_2;
	wire allowed_3_1;
	wire allowed_3_0;
	wire allowed_2_1;
	wire allowed_2_0;
	wire allowed_1_1;
	wire allowed_1_0;
	wire allowed_1;
	wire allowed_0;
	wire [4:0] in_0_a_bits_source = {1'h0, auto_anon_in_0_a_bits_source};
	wire [4:0] in_1_a_bits_source = {2'h2, auto_anon_in_1_a_bits_source};
	wire [1:0] out_0_d_bits_sink = {1'h0, auto_anon_out_0_d_bits_sink};
	wire [3:0] out_1_d_bits_size = {1'h0, auto_anon_out_1_d_bits_size};
	wire requestAIO_0_0 = auto_anon_in_0_a_bits_address[31:30] == 2'h0;
	wire requestAIO_0_1 = auto_anon_in_0_a_bits_address[31:30] == 2'h2;
	wire requestAIO_0_2 = {auto_anon_in_0_a_bits_address[31], ~auto_anon_in_0_a_bits_address[30]} == 2'h0;
	wire requestAIO_1_0 = auto_anon_in_1_a_bits_address[31:30] == 2'h0;
	wire requestAIO_1_1 = auto_anon_in_1_a_bits_address[31:30] == 2'h2;
	wire requestAIO_1_2 = {auto_anon_in_1_a_bits_address[31], ~auto_anon_in_1_a_bits_address[30]} == 2'h0;
	wire requestDOI_0_1 = auto_anon_out_0_d_bits_source[4:3] == 2'h2;
	wire requestDOI_1_1 = auto_anon_out_1_d_bits_source[4:3] == 2'h2;
	wire requestDOI_2_1 = auto_anon_out_2_d_bits_source[4:3] == 2'h2;
	wire portsAOI_filtered_0_valid = auto_anon_in_0_a_valid & requestAIO_0_0;
	wire portsAOI_filtered_1_valid = auto_anon_in_0_a_valid & requestAIO_0_1;
	wire portsAOI_filtered_2_valid = auto_anon_in_0_a_valid & requestAIO_0_2;
	wire _portsAOI_in_0_a_ready_T_4 = (((requestAIO_0_0 & auto_anon_out_0_a_ready) & allowed_0) | ((requestAIO_0_1 & auto_anon_out_1_a_ready) & allowed_1_0)) | ((requestAIO_0_2 & auto_anon_out_2_a_ready) & allowed_2_0);
	wire portsAOI_filtered_1_0_valid = auto_anon_in_1_a_valid & requestAIO_1_0;
	wire portsAOI_filtered_1_1_valid = auto_anon_in_1_a_valid & requestAIO_1_1;
	wire portsAOI_filtered_1_2_valid = auto_anon_in_1_a_valid & requestAIO_1_2;
	wire _portsAOI_in_1_a_ready_T_4 = (((requestAIO_1_0 & auto_anon_out_0_a_ready) & allowed_1) | ((requestAIO_1_1 & auto_anon_out_1_a_ready) & allowed_1_1)) | ((requestAIO_1_2 & auto_anon_out_2_a_ready) & allowed_2_1);
	wire portsDIO_filtered_0_valid = auto_anon_out_0_d_valid & ~auto_anon_out_0_d_bits_source[4];
	wire portsDIO_filtered_1_valid = auto_anon_out_0_d_valid & requestDOI_0_1;
	wire portsDIO_filtered_1_0_valid = auto_anon_out_1_d_valid & ~auto_anon_out_1_d_bits_source[4];
	wire portsDIO_filtered_1_1_valid = auto_anon_out_1_d_valid & requestDOI_1_1;
	wire portsDIO_filtered_2_0_valid = auto_anon_out_2_d_valid & ~auto_anon_out_2_d_bits_source[4];
	wire portsDIO_filtered_2_1_valid = auto_anon_out_2_d_valid & requestDOI_2_1;
	reg [8:0] beatsLeft;
	wire idle = beatsLeft == 9'h000;
	wire [1:0] readys_valid = {portsAOI_filtered_1_0_valid, portsAOI_filtered_0_valid};
	reg [1:0] readys_mask;
	wire [1:0] _readys_filter_T_1 = readys_valid & ~readys_mask;
	wire [1:0] readys_readys = ~({readys_mask[1], _readys_filter_T_1[1] | readys_mask[0]} & ({_readys_filter_T_1[0], portsAOI_filtered_1_0_valid} | _readys_filter_T_1));
	wire winner_0 = readys_readys[0] & portsAOI_filtered_0_valid;
	wire winner_1 = readys_readys[1] & portsAOI_filtered_1_0_valid;
	wire _out_0_a_valid_T = portsAOI_filtered_0_valid | portsAOI_filtered_1_0_valid;
	reg state_0;
	reg state_1;
	wire muxState_0 = (idle ? winner_0 : state_0);
	wire muxState_1 = (idle ? winner_1 : state_1);
	assign allowed_0 = (idle ? readys_readys[0] : state_0);
	assign allowed_1 = (idle ? readys_readys[1] : state_1);
	wire out_0_a_valid = (idle ? _out_0_a_valid_T : (state_0 & portsAOI_filtered_0_valid) | (state_1 & portsAOI_filtered_1_0_valid));
	reg [8:0] beatsLeft_1;
	wire idle_1 = beatsLeft_1 == 9'h000;
	wire [1:0] readys_valid_1 = {portsAOI_filtered_1_1_valid, portsAOI_filtered_1_valid};
	reg [1:0] readys_mask_1;
	wire [1:0] _readys_filter_T_3 = readys_valid_1 & ~readys_mask_1;
	wire [1:0] readys_readys_1 = ~({readys_mask_1[1], _readys_filter_T_3[1] | readys_mask_1[0]} & ({_readys_filter_T_3[0], portsAOI_filtered_1_1_valid} | _readys_filter_T_3));
	wire winner_1_0 = readys_readys_1[0] & portsAOI_filtered_1_valid;
	wire winner_1_1 = readys_readys_1[1] & portsAOI_filtered_1_1_valid;
	wire _out_1_a_valid_T = portsAOI_filtered_1_valid | portsAOI_filtered_1_1_valid;
	reg state_1_0;
	reg state_1_1;
	wire muxState_1_0 = (idle_1 ? winner_1_0 : state_1_0);
	wire muxState_1_1 = (idle_1 ? winner_1_1 : state_1_1);
	assign allowed_1_0 = (idle_1 ? readys_readys_1[0] : state_1_0);
	assign allowed_1_1 = (idle_1 ? readys_readys_1[1] : state_1_1);
	wire out_1_a_valid = (idle_1 ? _out_1_a_valid_T : (state_1_0 & portsAOI_filtered_1_valid) | (state_1_1 & portsAOI_filtered_1_1_valid));
	reg [8:0] beatsLeft_2;
	wire idle_2 = beatsLeft_2 == 9'h000;
	wire [1:0] readys_valid_2 = {portsAOI_filtered_1_2_valid, portsAOI_filtered_2_valid};
	reg [1:0] readys_mask_2;
	wire [1:0] _readys_filter_T_5 = readys_valid_2 & ~readys_mask_2;
	wire [1:0] readys_readys_2 = ~({readys_mask_2[1], _readys_filter_T_5[1] | readys_mask_2[0]} & ({_readys_filter_T_5[0], portsAOI_filtered_1_2_valid} | _readys_filter_T_5));
	wire winner_2_0 = readys_readys_2[0] & portsAOI_filtered_2_valid;
	wire winner_2_1 = readys_readys_2[1] & portsAOI_filtered_1_2_valid;
	wire _out_2_a_valid_T = portsAOI_filtered_2_valid | portsAOI_filtered_1_2_valid;
	reg state_2_0;
	reg state_2_1;
	wire muxState_2_0 = (idle_2 ? winner_2_0 : state_2_0);
	wire muxState_2_1 = (idle_2 ? winner_2_1 : state_2_1);
	assign allowed_2_0 = (idle_2 ? readys_readys_2[0] : state_2_0);
	assign allowed_2_1 = (idle_2 ? readys_readys_2[1] : state_2_1);
	wire out_2_a_valid = (idle_2 ? _out_2_a_valid_T : (state_2_0 & portsAOI_filtered_2_valid) | (state_2_1 & portsAOI_filtered_1_2_valid));
	reg [8:0] beatsLeft_3;
	wire idle_3 = beatsLeft_3 == 9'h000;
	wire [2:0] readys_valid_3 = {portsDIO_filtered_2_0_valid, portsDIO_filtered_1_0_valid, portsDIO_filtered_0_valid};
	reg [2:0] readys_mask_3;
	wire [2:0] _readys_filter_T_7 = readys_valid_3 & ~readys_mask_3;
	wire [3:0] _GEN = {_readys_filter_T_7[1:0], portsDIO_filtered_2_0_valid, portsDIO_filtered_1_0_valid} | {_readys_filter_T_7, portsDIO_filtered_2_0_valid};
	wire [2:0] readys_readys_3 = ~({readys_mask_3[2], _readys_filter_T_7[2] | readys_mask_3[1], _GEN[3] | readys_mask_3[0]} & (_GEN[2:0] | {_readys_filter_T_7[2], _GEN[3:2]}));
	wire winner_3_0 = readys_readys_3[0] & portsDIO_filtered_0_valid;
	wire winner_3_1 = readys_readys_3[1] & portsDIO_filtered_1_0_valid;
	wire winner_3_2 = readys_readys_3[2] & portsDIO_filtered_2_0_valid;
	wire _in_0_d_valid_T = portsDIO_filtered_0_valid | portsDIO_filtered_1_0_valid;
	reg state_3_0;
	reg state_3_1;
	reg state_3_2;
	wire muxState_3_0 = (idle_3 ? winner_3_0 : state_3_0);
	wire muxState_3_1 = (idle_3 ? winner_3_1 : state_3_1);
	wire muxState_3_2 = (idle_3 ? winner_3_2 : state_3_2);
	assign allowed_3_0 = (idle_3 ? readys_readys_3[0] : state_3_0);
	assign allowed_3_1 = (idle_3 ? readys_readys_3[1] : state_3_1);
	assign allowed_3_2 = (idle_3 ? readys_readys_3[2] : state_3_2);
	wire in_0_d_valid = (idle_3 ? _in_0_d_valid_T | portsDIO_filtered_2_0_valid : ((state_3_0 & portsDIO_filtered_0_valid) | (state_3_1 & portsDIO_filtered_1_0_valid)) | (state_3_2 & portsDIO_filtered_2_0_valid));
	wire _in_0_d_bits_T_4 = ((muxState_3_0 & auto_anon_out_0_d_bits_corrupt) | (muxState_3_1 & auto_anon_out_1_d_bits_corrupt)) | (muxState_3_2 & auto_anon_out_2_d_bits_corrupt);
	wire _in_0_d_bits_T_14 = ((muxState_3_0 & auto_anon_out_0_d_bits_denied) | (muxState_3_1 & auto_anon_out_1_d_bits_denied)) | (muxState_3_2 & auto_anon_out_2_d_bits_denied);
	wire [1:0] _in_0_d_bits_T_18 = (muxState_3_0 ? out_0_d_bits_sink : 2'h0) | (muxState_3_1 ? auto_anon_out_1_d_bits_sink : 2'h0);
	wire [3:0] _in_0_d_bits_T_24 = ((muxState_3_0 ? auto_anon_out_0_d_bits_source[3:0] : 4'h0) | (muxState_3_1 ? auto_anon_out_1_d_bits_source[3:0] : 4'h0)) | (muxState_3_2 ? auto_anon_out_2_d_bits_source[3:0] : 4'h0);
	wire [3:0] _in_0_d_bits_T_29 = ((muxState_3_0 ? auto_anon_out_0_d_bits_size : 4'h0) | (muxState_3_1 ? out_1_d_bits_size : 4'h0)) | (muxState_3_2 ? auto_anon_out_2_d_bits_size : 4'h0);
	wire [1:0] _in_0_d_bits_T_33 = (muxState_3_0 ? auto_anon_out_0_d_bits_param : 2'h0) | (muxState_3_1 ? auto_anon_out_1_d_bits_param : 2'h0);
	wire [2:0] _in_0_d_bits_T_39 = ((muxState_3_0 ? auto_anon_out_0_d_bits_opcode : 3'h0) | (muxState_3_1 ? auto_anon_out_1_d_bits_opcode : 3'h0)) | (muxState_3_2 ? auto_anon_out_2_d_bits_opcode : 3'h0);
	reg [8:0] beatsLeft_4;
	wire idle_4 = beatsLeft_4 == 9'h000;
	wire [2:0] readys_valid_4 = {portsDIO_filtered_2_1_valid, portsDIO_filtered_1_1_valid, portsDIO_filtered_1_valid};
	reg [2:0] readys_mask_4;
	wire [2:0] _readys_filter_T_9 = readys_valid_4 & ~readys_mask_4;
	wire [3:0] _GEN_0 = {_readys_filter_T_9[1:0], portsDIO_filtered_2_1_valid, portsDIO_filtered_1_1_valid} | {_readys_filter_T_9, portsDIO_filtered_2_1_valid};
	wire [2:0] readys_readys_4 = ~({readys_mask_4[2], _readys_filter_T_9[2] | readys_mask_4[1], _GEN_0[3] | readys_mask_4[0]} & (_GEN_0[2:0] | {_readys_filter_T_9[2], _GEN_0[3:2]}));
	wire winner_4_0 = readys_readys_4[0] & portsDIO_filtered_1_valid;
	wire winner_4_1 = readys_readys_4[1] & portsDIO_filtered_1_1_valid;
	wire winner_4_2 = readys_readys_4[2] & portsDIO_filtered_2_1_valid;
	wire _in_1_d_valid_T = portsDIO_filtered_1_valid | portsDIO_filtered_1_1_valid;
	reg state_4_0;
	reg state_4_1;
	reg state_4_2;
	wire muxState_4_0 = (idle_4 ? winner_4_0 : state_4_0);
	wire muxState_4_1 = (idle_4 ? winner_4_1 : state_4_1);
	wire muxState_4_2 = (idle_4 ? winner_4_2 : state_4_2);
	assign allowed_4_0 = (idle_4 ? readys_readys_4[0] : state_4_0);
	assign allowed_4_1 = (idle_4 ? readys_readys_4[1] : state_4_1);
	assign allowed_4_2 = (idle_4 ? readys_readys_4[2] : state_4_2);
	wire in_1_d_valid = (idle_4 ? _in_1_d_valid_T | portsDIO_filtered_2_1_valid : ((state_4_0 & portsDIO_filtered_1_valid) | (state_4_1 & portsDIO_filtered_1_1_valid)) | (state_4_2 & portsDIO_filtered_2_1_valid));
	wire _in_1_d_bits_T_4 = ((muxState_4_0 & auto_anon_out_0_d_bits_corrupt) | (muxState_4_1 & auto_anon_out_1_d_bits_corrupt)) | (muxState_4_2 & auto_anon_out_2_d_bits_corrupt);
	wire _in_1_d_bits_T_14 = ((muxState_4_0 & auto_anon_out_0_d_bits_denied) | (muxState_4_1 & auto_anon_out_1_d_bits_denied)) | (muxState_4_2 & auto_anon_out_2_d_bits_denied);
	wire [1:0] _in_1_d_bits_T_18 = (muxState_4_0 ? out_0_d_bits_sink : 2'h0) | (muxState_4_1 ? auto_anon_out_1_d_bits_sink : 2'h0);
	wire [2:0] _in_1_d_bits_T_24 = ((muxState_4_0 ? auto_anon_out_0_d_bits_source[2:0] : 3'h0) | (muxState_4_1 ? auto_anon_out_1_d_bits_source[2:0] : 3'h0)) | (muxState_4_2 ? auto_anon_out_2_d_bits_source[2:0] : 3'h0);
	wire [3:0] _in_1_d_bits_T_29 = ((muxState_4_0 ? auto_anon_out_0_d_bits_size : 4'h0) | (muxState_4_1 ? out_1_d_bits_size : 4'h0)) | (muxState_4_2 ? auto_anon_out_2_d_bits_size : 4'h0);
	wire [1:0] _in_1_d_bits_T_33 = (muxState_4_0 ? auto_anon_out_0_d_bits_param : 2'h0) | (muxState_4_1 ? auto_anon_out_1_d_bits_param : 2'h0);
	wire [2:0] _in_1_d_bits_T_39 = ((muxState_4_0 ? auto_anon_out_0_d_bits_opcode : 3'h0) | (muxState_4_1 ? auto_anon_out_1_d_bits_opcode : 3'h0)) | (muxState_4_2 ? auto_anon_out_2_d_bits_opcode : 3'h0);
	always @(posedge clock)
		if (reset) begin
			beatsLeft <= 9'h000;
			readys_mask <= 2'h3;
			state_0 <= 1'h0;
			state_1 <= 1'h0;
			beatsLeft_1 <= 9'h000;
			readys_mask_1 <= 2'h3;
			state_1_0 <= 1'h0;
			state_1_1 <= 1'h0;
			beatsLeft_2 <= 9'h000;
			readys_mask_2 <= 2'h3;
			state_2_0 <= 1'h0;
			state_2_1 <= 1'h0;
			beatsLeft_3 <= 9'h000;
			readys_mask_3 <= 3'h7;
			state_3_0 <= 1'h0;
			state_3_1 <= 1'h0;
			state_3_2 <= 1'h0;
			beatsLeft_4 <= 9'h000;
			readys_mask_4 <= 3'h7;
			state_4_0 <= 1'h0;
			state_4_1 <= 1'h0;
			state_4_2 <= 1'h0;
		end
		else begin : sv2v_autoblock_1
			reg [26:0] _beatsAI_decode_T;
			reg [26:0] _beatsAI_decode_T_3;
			reg [26:0] _beatsDO_decode_T;
			reg [20:0] _beatsDO_decode_T_3;
			reg [22:0] _beatsDO_decode_T_6;
			reg latch;
			reg latch_1;
			reg latch_2;
			reg latch_3;
			reg latch_4;
			_beatsAI_decode_T = 27'h0000fff << auto_anon_in_0_a_bits_size;
			_beatsAI_decode_T_3 = 27'h0000fff << auto_anon_in_1_a_bits_size;
			_beatsDO_decode_T = 27'h0000fff << auto_anon_out_0_d_bits_size;
			_beatsDO_decode_T_3 = 21'h00003f << auto_anon_out_1_d_bits_size;
			_beatsDO_decode_T_6 = 23'h0000ff << auto_anon_out_2_d_bits_size;
			latch = idle & auto_anon_out_0_a_ready;
			latch_1 = idle_1 & auto_anon_out_1_a_ready;
			latch_2 = idle_2 & auto_anon_out_2_a_ready;
			latch_3 = idle_3 & auto_anon_in_0_d_ready;
			latch_4 = idle_4 & auto_anon_in_1_d_ready;
			if (latch)
				beatsLeft <= (winner_0 & ~auto_anon_in_0_a_bits_opcode[2] ? ~_beatsAI_decode_T[11:3] : 9'h000) | (winner_1 & ~auto_anon_in_1_a_bits_opcode[2] ? ~_beatsAI_decode_T_3[11:3] : 9'h000);
			else
				beatsLeft <= beatsLeft - {8'h00, auto_anon_out_0_a_ready & out_0_a_valid};
			if (latch & |readys_valid) begin : sv2v_autoblock_2
				reg [1:0] _readys_mask_T;
				_readys_mask_T = readys_readys & readys_valid;
				readys_mask <= _readys_mask_T | {_readys_mask_T[0], 1'h0};
			end
			if (idle) begin
				state_0 <= winner_0;
				state_1 <= winner_1;
			end
			if (latch_1)
				beatsLeft_1 <= (winner_1_0 & ~auto_anon_in_0_a_bits_opcode[2] ? ~_beatsAI_decode_T[11:3] : 9'h000) | (winner_1_1 & ~auto_anon_in_1_a_bits_opcode[2] ? ~_beatsAI_decode_T_3[11:3] : 9'h000);
			else
				beatsLeft_1 <= beatsLeft_1 - {8'h00, auto_anon_out_1_a_ready & out_1_a_valid};
			if (latch_1 & |readys_valid_1) begin : sv2v_autoblock_3
				reg [1:0] _readys_mask_T_5;
				_readys_mask_T_5 = readys_readys_1 & readys_valid_1;
				readys_mask_1 <= _readys_mask_T_5 | {_readys_mask_T_5[0], 1'h0};
			end
			if (idle_1) begin
				state_1_0 <= winner_1_0;
				state_1_1 <= winner_1_1;
			end
			if (latch_2)
				beatsLeft_2 <= (winner_2_0 & ~auto_anon_in_0_a_bits_opcode[2] ? ~_beatsAI_decode_T[11:3] : 9'h000) | (winner_2_1 & ~auto_anon_in_1_a_bits_opcode[2] ? ~_beatsAI_decode_T_3[11:3] : 9'h000);
			else
				beatsLeft_2 <= beatsLeft_2 - {8'h00, auto_anon_out_2_a_ready & out_2_a_valid};
			if (latch_2 & |readys_valid_2) begin : sv2v_autoblock_4
				reg [1:0] _readys_mask_T_10;
				_readys_mask_T_10 = readys_readys_2 & readys_valid_2;
				readys_mask_2 <= _readys_mask_T_10 | {_readys_mask_T_10[0], 1'h0};
			end
			if (idle_2) begin
				state_2_0 <= winner_2_0;
				state_2_1 <= winner_2_1;
			end
			if (latch_3) begin : sv2v_autoblock_5
				reg [8:0] maskedBeats_0_3;
				maskedBeats_0_3 = (winner_3_0 & auto_anon_out_0_d_bits_opcode[0] ? ~_beatsDO_decode_T[11:3] : 9'h000);
				beatsLeft_3 <= {maskedBeats_0_3[8:5], {maskedBeats_0_3[4:3], maskedBeats_0_3[2:0] | (winner_3_1 & auto_anon_out_1_d_bits_opcode[0] ? ~_beatsDO_decode_T_3[5:3] : 3'h0)} | (winner_3_2 & auto_anon_out_2_d_bits_opcode[0] ? ~_beatsDO_decode_T_6[7:3] : 5'h00)};
			end
			else
				beatsLeft_3 <= beatsLeft_3 - {8'h00, auto_anon_in_0_d_ready & in_0_d_valid};
			if (latch_3 & |readys_valid_3) begin : sv2v_autoblock_6
				reg [2:0] _readys_mask_T_15;
				reg [2:0] _readys_mask_T_18;
				_readys_mask_T_15 = readys_readys_3 & readys_valid_3;
				_readys_mask_T_18 = _readys_mask_T_15 | {_readys_mask_T_15[1:0], 1'h0};
				readys_mask_3 <= _readys_mask_T_18 | {_readys_mask_T_18[0], 2'h0};
			end
			if (idle_3) begin
				state_3_0 <= winner_3_0;
				state_3_1 <= winner_3_1;
				state_3_2 <= winner_3_2;
			end
			if (latch_4) begin : sv2v_autoblock_7
				reg [8:0] maskedBeats_0_4;
				maskedBeats_0_4 = (winner_4_0 & auto_anon_out_0_d_bits_opcode[0] ? ~_beatsDO_decode_T[11:3] : 9'h000);
				beatsLeft_4 <= {maskedBeats_0_4[8:5], {maskedBeats_0_4[4:3], maskedBeats_0_4[2:0] | (winner_4_1 & auto_anon_out_1_d_bits_opcode[0] ? ~_beatsDO_decode_T_3[5:3] : 3'h0)} | (winner_4_2 & auto_anon_out_2_d_bits_opcode[0] ? ~_beatsDO_decode_T_6[7:3] : 5'h00)};
			end
			else
				beatsLeft_4 <= beatsLeft_4 - {8'h00, auto_anon_in_1_d_ready & in_1_d_valid};
			if (latch_4 & |readys_valid_4) begin : sv2v_autoblock_8
				reg [2:0] _readys_mask_T_23;
				reg [2:0] _readys_mask_T_26;
				_readys_mask_T_23 = readys_readys_4 & readys_valid_4;
				_readys_mask_T_26 = _readys_mask_T_23 | {_readys_mask_T_23[1:0], 1'h0};
				readys_mask_4 <= _readys_mask_T_26 | {_readys_mask_T_26[0], 2'h0};
			end
			if (idle_4) begin
				state_4_0 <= winner_4_0;
				state_4_1 <= winner_4_1;
				state_4_2 <= winner_4_2;
			end
		end
	TLMonitor monitor(
		.clock(clock),
		.reset(reset),
		.io_in_a_ready(_portsAOI_in_0_a_ready_T_4),
		.io_in_a_valid(auto_anon_in_0_a_valid),
		.io_in_a_bits_opcode(auto_anon_in_0_a_bits_opcode),
		.io_in_a_bits_param(auto_anon_in_0_a_bits_param),
		.io_in_a_bits_size(auto_anon_in_0_a_bits_size),
		.io_in_a_bits_source(auto_anon_in_0_a_bits_source),
		.io_in_a_bits_address(auto_anon_in_0_a_bits_address),
		.io_in_a_bits_mask(auto_anon_in_0_a_bits_mask),
		.io_in_a_bits_corrupt(auto_anon_in_0_a_bits_corrupt),
		.io_in_d_ready(auto_anon_in_0_d_ready),
		.io_in_d_valid(in_0_d_valid),
		.io_in_d_bits_opcode(_in_0_d_bits_T_39),
		.io_in_d_bits_param(_in_0_d_bits_T_33),
		.io_in_d_bits_size(_in_0_d_bits_T_29),
		.io_in_d_bits_source(_in_0_d_bits_T_24),
		.io_in_d_bits_sink(_in_0_d_bits_T_18),
		.io_in_d_bits_denied(_in_0_d_bits_T_14),
		.io_in_d_bits_corrupt(_in_0_d_bits_T_4)
	);
	TLMonitor_1 monitor_1(
		.clock(clock),
		.reset(reset),
		.io_in_a_ready(_portsAOI_in_1_a_ready_T_4),
		.io_in_a_valid(auto_anon_in_1_a_valid),
		.io_in_a_bits_opcode(auto_anon_in_1_a_bits_opcode),
		.io_in_a_bits_param(auto_anon_in_1_a_bits_param),
		.io_in_a_bits_size(auto_anon_in_1_a_bits_size),
		.io_in_a_bits_source(auto_anon_in_1_a_bits_source),
		.io_in_a_bits_address(auto_anon_in_1_a_bits_address),
		.io_in_a_bits_mask(auto_anon_in_1_a_bits_mask),
		.io_in_a_bits_corrupt(auto_anon_in_1_a_bits_corrupt),
		.io_in_b_ready(auto_anon_in_1_b_ready),
		.io_in_b_valid(auto_anon_out_1_b_valid),
		.io_in_b_bits_param(auto_anon_out_1_b_bits_param),
		.io_in_b_bits_address(auto_anon_out_1_b_bits_address),
		.io_in_c_ready(auto_anon_out_1_c_ready),
		.io_in_c_valid(auto_anon_in_1_c_valid),
		.io_in_c_bits_opcode(auto_anon_in_1_c_bits_opcode),
		.io_in_c_bits_param(auto_anon_in_1_c_bits_param),
		.io_in_c_bits_size(auto_anon_in_1_c_bits_size),
		.io_in_c_bits_source(auto_anon_in_1_c_bits_source),
		.io_in_c_bits_address(auto_anon_in_1_c_bits_address),
		.io_in_c_bits_corrupt(auto_anon_in_1_c_bits_corrupt),
		.io_in_d_ready(auto_anon_in_1_d_ready),
		.io_in_d_valid(in_1_d_valid),
		.io_in_d_bits_opcode(_in_1_d_bits_T_39),
		.io_in_d_bits_param(_in_1_d_bits_T_33),
		.io_in_d_bits_size(_in_1_d_bits_T_29),
		.io_in_d_bits_source(_in_1_d_bits_T_24),
		.io_in_d_bits_sink(_in_1_d_bits_T_18),
		.io_in_d_bits_denied(_in_1_d_bits_T_14),
		.io_in_d_bits_corrupt(_in_1_d_bits_T_4),
		.io_in_e_valid(auto_anon_in_1_e_valid),
		.io_in_e_bits_sink(auto_anon_in_1_e_bits_sink)
	);
	assign auto_anon_in_1_a_ready = _portsAOI_in_1_a_ready_T_4;
	assign auto_anon_in_1_b_valid = auto_anon_out_1_b_valid;
	assign auto_anon_in_1_b_bits_param = auto_anon_out_1_b_bits_param;
	assign auto_anon_in_1_b_bits_address = auto_anon_out_1_b_bits_address;
	assign auto_anon_in_1_c_ready = auto_anon_out_1_c_ready;
	assign auto_anon_in_1_d_valid = in_1_d_valid;
	assign auto_anon_in_1_d_bits_opcode = _in_1_d_bits_T_39;
	assign auto_anon_in_1_d_bits_param = _in_1_d_bits_T_33;
	assign auto_anon_in_1_d_bits_size = _in_1_d_bits_T_29;
	assign auto_anon_in_1_d_bits_source = _in_1_d_bits_T_24;
	assign auto_anon_in_1_d_bits_sink = _in_1_d_bits_T_18;
	assign auto_anon_in_1_d_bits_denied = _in_1_d_bits_T_14;
	assign auto_anon_in_1_d_bits_data = ((muxState_4_0 ? auto_anon_out_0_d_bits_data : 64'h0000000000000000) | (muxState_4_1 ? auto_anon_out_1_d_bits_data : 64'h0000000000000000)) | (muxState_4_2 ? auto_anon_out_2_d_bits_data : 64'h0000000000000000);
	assign auto_anon_in_1_d_bits_corrupt = _in_1_d_bits_T_4;
	assign auto_anon_in_0_a_ready = _portsAOI_in_0_a_ready_T_4;
	assign auto_anon_in_0_d_valid = in_0_d_valid;
	assign auto_anon_in_0_d_bits_opcode = _in_0_d_bits_T_39;
	assign auto_anon_in_0_d_bits_param = _in_0_d_bits_T_33;
	assign auto_anon_in_0_d_bits_size = _in_0_d_bits_T_29;
	assign auto_anon_in_0_d_bits_source = _in_0_d_bits_T_24;
	assign auto_anon_in_0_d_bits_sink = _in_0_d_bits_T_18;
	assign auto_anon_in_0_d_bits_denied = _in_0_d_bits_T_14;
	assign auto_anon_in_0_d_bits_data = ((muxState_3_0 ? auto_anon_out_0_d_bits_data : 64'h0000000000000000) | (muxState_3_1 ? auto_anon_out_1_d_bits_data : 64'h0000000000000000)) | (muxState_3_2 ? auto_anon_out_2_d_bits_data : 64'h0000000000000000);
	assign auto_anon_in_0_d_bits_corrupt = _in_0_d_bits_T_4;
	assign auto_anon_out_2_a_valid = out_2_a_valid;
	assign auto_anon_out_2_a_bits_opcode = (muxState_2_0 ? auto_anon_in_0_a_bits_opcode : 3'h0) | (muxState_2_1 ? auto_anon_in_1_a_bits_opcode : 3'h0);
	assign auto_anon_out_2_a_bits_param = (muxState_2_0 ? auto_anon_in_0_a_bits_param : 3'h0) | (muxState_2_1 ? auto_anon_in_1_a_bits_param : 3'h0);
	assign auto_anon_out_2_a_bits_size = (muxState_2_0 ? auto_anon_in_0_a_bits_size : 4'h0) | (muxState_2_1 ? auto_anon_in_1_a_bits_size : 4'h0);
	assign auto_anon_out_2_a_bits_source = (muxState_2_0 ? in_0_a_bits_source : 5'h00) | (muxState_2_1 ? in_1_a_bits_source : 5'h00);
	assign auto_anon_out_2_a_bits_address = (muxState_2_0 ? auto_anon_in_0_a_bits_address[30:0] : 31'h00000000) | (muxState_2_1 ? auto_anon_in_1_a_bits_address[30:0] : 31'h00000000);
	assign auto_anon_out_2_a_bits_user_amba_prot_bufferable = muxState_2_0 & auto_anon_in_0_a_bits_user_amba_prot_bufferable;
	assign auto_anon_out_2_a_bits_user_amba_prot_modifiable = muxState_2_0 & auto_anon_in_0_a_bits_user_amba_prot_modifiable;
	assign auto_anon_out_2_a_bits_user_amba_prot_readalloc = muxState_2_0 & auto_anon_in_0_a_bits_user_amba_prot_readalloc;
	assign auto_anon_out_2_a_bits_user_amba_prot_writealloc = muxState_2_0 & auto_anon_in_0_a_bits_user_amba_prot_writealloc;
	assign auto_anon_out_2_a_bits_user_amba_prot_privileged = muxState_2_0 & auto_anon_in_0_a_bits_user_amba_prot_privileged;
	assign auto_anon_out_2_a_bits_user_amba_prot_secure = muxState_2_0 & auto_anon_in_0_a_bits_user_amba_prot_secure;
	assign auto_anon_out_2_a_bits_user_amba_prot_fetch = muxState_2_0 & auto_anon_in_0_a_bits_user_amba_prot_fetch;
	assign auto_anon_out_2_a_bits_mask = (muxState_2_0 ? auto_anon_in_0_a_bits_mask : 8'h00) | (muxState_2_1 ? auto_anon_in_1_a_bits_mask : 8'h00);
	assign auto_anon_out_2_a_bits_data = (muxState_2_0 ? auto_anon_in_0_a_bits_data : 64'h0000000000000000) | (muxState_2_1 ? auto_anon_in_1_a_bits_data : 64'h0000000000000000);
	assign auto_anon_out_2_a_bits_corrupt = (muxState_2_0 & auto_anon_in_0_a_bits_corrupt) | (muxState_2_1 & auto_anon_in_1_a_bits_corrupt);
	assign auto_anon_out_2_d_ready = ((~auto_anon_out_2_d_bits_source[4] & auto_anon_in_0_d_ready) & allowed_3_2) | ((requestDOI_2_1 & auto_anon_in_1_d_ready) & allowed_4_2);
	assign auto_anon_out_1_a_valid = out_1_a_valid;
	assign auto_anon_out_1_a_bits_opcode = (muxState_1_0 ? auto_anon_in_0_a_bits_opcode : 3'h0) | (muxState_1_1 ? auto_anon_in_1_a_bits_opcode : 3'h0);
	assign auto_anon_out_1_a_bits_param = (muxState_1_0 ? auto_anon_in_0_a_bits_param : 3'h0) | (muxState_1_1 ? auto_anon_in_1_a_bits_param : 3'h0);
	assign auto_anon_out_1_a_bits_size = (muxState_1_0 ? auto_anon_in_0_a_bits_size[2:0] : 3'h0) | (muxState_1_1 ? auto_anon_in_1_a_bits_size[2:0] : 3'h0);
	assign auto_anon_out_1_a_bits_source = (muxState_1_0 ? in_0_a_bits_source : 5'h00) | (muxState_1_1 ? in_1_a_bits_source : 5'h00);
	assign auto_anon_out_1_a_bits_address = (muxState_1_0 ? auto_anon_in_0_a_bits_address : 32'h00000000) | (muxState_1_1 ? auto_anon_in_1_a_bits_address : 32'h00000000);
	assign auto_anon_out_1_a_bits_user_amba_prot_bufferable = muxState_1_0 & auto_anon_in_0_a_bits_user_amba_prot_bufferable;
	assign auto_anon_out_1_a_bits_user_amba_prot_modifiable = muxState_1_0 & auto_anon_in_0_a_bits_user_amba_prot_modifiable;
	assign auto_anon_out_1_a_bits_user_amba_prot_readalloc = muxState_1_0 & auto_anon_in_0_a_bits_user_amba_prot_readalloc;
	assign auto_anon_out_1_a_bits_user_amba_prot_writealloc = muxState_1_0 & auto_anon_in_0_a_bits_user_amba_prot_writealloc;
	assign auto_anon_out_1_a_bits_user_amba_prot_privileged = muxState_1_0 & auto_anon_in_0_a_bits_user_amba_prot_privileged;
	assign auto_anon_out_1_a_bits_user_amba_prot_secure = muxState_1_0 & auto_anon_in_0_a_bits_user_amba_prot_secure;
	assign auto_anon_out_1_a_bits_user_amba_prot_fetch = muxState_1_0 & auto_anon_in_0_a_bits_user_amba_prot_fetch;
	assign auto_anon_out_1_a_bits_mask = (muxState_1_0 ? auto_anon_in_0_a_bits_mask : 8'h00) | (muxState_1_1 ? auto_anon_in_1_a_bits_mask : 8'h00);
	assign auto_anon_out_1_a_bits_data = (muxState_1_0 ? auto_anon_in_0_a_bits_data : 64'h0000000000000000) | (muxState_1_1 ? auto_anon_in_1_a_bits_data : 64'h0000000000000000);
	assign auto_anon_out_1_a_bits_corrupt = (muxState_1_0 & auto_anon_in_0_a_bits_corrupt) | (muxState_1_1 & auto_anon_in_1_a_bits_corrupt);
	assign auto_anon_out_1_b_ready = auto_anon_in_1_b_ready;
	assign auto_anon_out_1_c_valid = auto_anon_in_1_c_valid;
	assign auto_anon_out_1_c_bits_opcode = auto_anon_in_1_c_bits_opcode;
	assign auto_anon_out_1_c_bits_param = auto_anon_in_1_c_bits_param;
	assign auto_anon_out_1_c_bits_size = auto_anon_in_1_c_bits_size[2:0];
	assign auto_anon_out_1_c_bits_source = {2'h2, auto_anon_in_1_c_bits_source};
	assign auto_anon_out_1_c_bits_address = auto_anon_in_1_c_bits_address;
	assign auto_anon_out_1_c_bits_data = auto_anon_in_1_c_bits_data;
	assign auto_anon_out_1_c_bits_corrupt = auto_anon_in_1_c_bits_corrupt;
	assign auto_anon_out_1_d_ready = ((~auto_anon_out_1_d_bits_source[4] & auto_anon_in_0_d_ready) & allowed_3_1) | ((requestDOI_1_1 & auto_anon_in_1_d_ready) & allowed_4_1);
	assign auto_anon_out_1_e_valid = auto_anon_in_1_e_valid;
	assign auto_anon_out_1_e_bits_sink = auto_anon_in_1_e_bits_sink;
	assign auto_anon_out_0_a_valid = out_0_a_valid;
	assign auto_anon_out_0_a_bits_opcode = (muxState_0 ? auto_anon_in_0_a_bits_opcode : 3'h0) | (muxState_1 ? auto_anon_in_1_a_bits_opcode : 3'h0);
	assign auto_anon_out_0_a_bits_param = (muxState_0 ? auto_anon_in_0_a_bits_param : 3'h0) | (muxState_1 ? auto_anon_in_1_a_bits_param : 3'h0);
	assign auto_anon_out_0_a_bits_size = (muxState_0 ? auto_anon_in_0_a_bits_size : 4'h0) | (muxState_1 ? auto_anon_in_1_a_bits_size : 4'h0);
	assign auto_anon_out_0_a_bits_source = (muxState_0 ? in_0_a_bits_source : 5'h00) | (muxState_1 ? in_1_a_bits_source : 5'h00);
	assign auto_anon_out_0_a_bits_address = (muxState_0 ? auto_anon_in_0_a_bits_address[27:0] : 28'h0000000) | (muxState_1 ? auto_anon_in_1_a_bits_address[27:0] : 28'h0000000);
	assign auto_anon_out_0_a_bits_mask = (muxState_0 ? auto_anon_in_0_a_bits_mask : 8'h00) | (muxState_1 ? auto_anon_in_1_a_bits_mask : 8'h00);
	assign auto_anon_out_0_a_bits_data = (muxState_0 ? auto_anon_in_0_a_bits_data : 64'h0000000000000000) | (muxState_1 ? auto_anon_in_1_a_bits_data : 64'h0000000000000000);
	assign auto_anon_out_0_a_bits_corrupt = (muxState_0 & auto_anon_in_0_a_bits_corrupt) | (muxState_1 & auto_anon_in_1_a_bits_corrupt);
	assign auto_anon_out_0_d_ready = ((~auto_anon_out_0_d_bits_source[4] & auto_anon_in_0_d_ready) & allowed_3_0) | ((requestDOI_0_1 & auto_anon_in_1_d_ready) & allowed_4_0);
endmodule
