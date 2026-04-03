module TLBusBypassBar (
	clock,
	reset,
	auto_in_a_ready,
	auto_in_a_valid,
	auto_in_a_bits_opcode,
	auto_in_a_bits_address,
	auto_in_a_bits_data,
	auto_in_d_ready,
	auto_in_d_valid,
	auto_in_d_bits_opcode,
	auto_in_d_bits_param,
	auto_in_d_bits_size,
	auto_in_d_bits_sink,
	auto_in_d_bits_denied,
	auto_in_d_bits_data,
	auto_in_d_bits_corrupt,
	auto_out_1_a_ready,
	auto_out_1_a_valid,
	auto_out_1_a_bits_opcode,
	auto_out_1_a_bits_address,
	auto_out_1_a_bits_data,
	auto_out_1_d_ready,
	auto_out_1_d_valid,
	auto_out_1_d_bits_opcode,
	auto_out_1_d_bits_param,
	auto_out_1_d_bits_size,
	auto_out_1_d_bits_source,
	auto_out_1_d_bits_sink,
	auto_out_1_d_bits_denied,
	auto_out_1_d_bits_data,
	auto_out_1_d_bits_corrupt,
	auto_out_0_a_ready,
	auto_out_0_a_valid,
	auto_out_0_a_bits_opcode,
	auto_out_0_a_bits_address,
	auto_out_0_d_ready,
	auto_out_0_d_valid,
	auto_out_0_d_bits_opcode,
	auto_out_0_d_bits_size,
	auto_out_0_d_bits_denied,
	auto_out_0_d_bits_corrupt,
	io_bypass
);
	input clock;
	input reset;
	output wire auto_in_a_ready;
	input auto_in_a_valid;
	input [2:0] auto_in_a_bits_opcode;
	input [8:0] auto_in_a_bits_address;
	input [31:0] auto_in_a_bits_data;
	input auto_in_d_ready;
	output wire auto_in_d_valid;
	output wire [2:0] auto_in_d_bits_opcode;
	output wire [1:0] auto_in_d_bits_param;
	output wire [1:0] auto_in_d_bits_size;
	output wire auto_in_d_bits_sink;
	output wire auto_in_d_bits_denied;
	output wire [31:0] auto_in_d_bits_data;
	output wire auto_in_d_bits_corrupt;
	input auto_out_1_a_ready;
	output wire auto_out_1_a_valid;
	output wire [2:0] auto_out_1_a_bits_opcode;
	output wire [8:0] auto_out_1_a_bits_address;
	output wire [31:0] auto_out_1_a_bits_data;
	output wire auto_out_1_d_ready;
	input auto_out_1_d_valid;
	input [2:0] auto_out_1_d_bits_opcode;
	input [1:0] auto_out_1_d_bits_param;
	input [1:0] auto_out_1_d_bits_size;
	input auto_out_1_d_bits_source;
	input auto_out_1_d_bits_sink;
	input auto_out_1_d_bits_denied;
	input [31:0] auto_out_1_d_bits_data;
	input auto_out_1_d_bits_corrupt;
	input auto_out_0_a_ready;
	output wire auto_out_0_a_valid;
	output wire [2:0] auto_out_0_a_bits_opcode;
	output wire [127:0] auto_out_0_a_bits_address;
	output wire auto_out_0_d_ready;
	input auto_out_0_d_valid;
	input [2:0] auto_out_0_d_bits_opcode;
	input [1:0] auto_out_0_d_bits_size;
	input auto_out_0_d_bits_denied;
	input auto_out_0_d_bits_corrupt;
	input io_bypass;
	reg in_reset;
	reg bypass_reg;
	wire bypass = (in_reset ? io_bypass : bypass_reg);
	reg [1:0] flight;
	reg r_counter;
	reg r_counter_3;
	reg stall_counter;
	wire stall = (bypass != io_bypass) & ~stall_counter;
	wire nodeIn_a_ready = ~stall & (bypass ? auto_out_0_a_ready : auto_out_1_a_ready);
	wire nodeIn_d_valid = (bypass ? auto_out_0_d_valid : auto_out_1_d_valid);
	wire [2:0] nodeIn_d_bits_opcode = (bypass ? auto_out_0_d_bits_opcode : auto_out_1_d_bits_opcode);
	wire [1:0] nodeIn_d_bits_param = (bypass ? 2'h0 : auto_out_1_d_bits_param);
	wire [1:0] nodeIn_d_bits_size = (bypass ? auto_out_0_d_bits_size : auto_out_1_d_bits_size);
	wire nodeIn_d_bits_sink = ~bypass & auto_out_1_d_bits_sink;
	wire nodeIn_d_bits_denied = (bypass ? auto_out_0_d_bits_denied : auto_out_1_d_bits_denied);
	wire nodeIn_d_bits_corrupt = (bypass ? auto_out_0_d_bits_corrupt : auto_out_1_d_bits_corrupt);
	always @(posedge clock) begin : sv2v_autoblock_1
		reg r_3;
		reg d_dec;
		reg [1:0] _next_flight_T_10;
		r_3 = nodeIn_a_ready & auto_in_a_valid;
		d_dec = auto_in_d_ready & nodeIn_d_valid;
		_next_flight_T_10 = ((flight + {1'h0, ((d_dec & ~r_counter_3) & nodeIn_d_bits_opcode[2]) & ~nodeIn_d_bits_opcode[1]}) + {1'h0, r_3 & ~r_counter}) - {1'h0, d_dec};
		if (reset) begin
			in_reset <= 1'h1;
			flight <= 2'h0;
			r_counter <= 1'h0;
			r_counter_3 <= 1'h0;
			stall_counter <= 1'h0;
		end
		else begin
			in_reset <= 1'h0;
			flight <= _next_flight_T_10;
			r_counter <= (~r_3 | (r_counter - 1'h1)) & r_counter;
			r_counter_3 <= (~d_dec | (r_counter_3 - 1'h1)) & r_counter_3;
			stall_counter <= (~r_3 | (stall_counter - 1'h1)) & stall_counter;
		end
		if (in_reset | (_next_flight_T_10 == 2'h0))
			bypass_reg <= io_bypass;
	end
	TLMonitor_32 monitor(
		.clock(clock),
		.reset(reset),
		.io_in_a_ready(nodeIn_a_ready),
		.io_in_a_valid(auto_in_a_valid),
		.io_in_a_bits_opcode(auto_in_a_bits_opcode),
		.io_in_a_bits_address(auto_in_a_bits_address),
		.io_in_d_ready(auto_in_d_ready),
		.io_in_d_valid(nodeIn_d_valid),
		.io_in_d_bits_opcode(nodeIn_d_bits_opcode),
		.io_in_d_bits_param(nodeIn_d_bits_param),
		.io_in_d_bits_size(nodeIn_d_bits_size),
		.io_in_d_bits_source(~bypass & auto_out_1_d_bits_source),
		.io_in_d_bits_sink(nodeIn_d_bits_sink),
		.io_in_d_bits_denied(nodeIn_d_bits_denied),
		.io_in_d_bits_corrupt(nodeIn_d_bits_corrupt)
	);
	assign auto_in_a_ready = nodeIn_a_ready;
	assign auto_in_d_valid = nodeIn_d_valid;
	assign auto_in_d_bits_opcode = nodeIn_d_bits_opcode;
	assign auto_in_d_bits_param = nodeIn_d_bits_param;
	assign auto_in_d_bits_size = nodeIn_d_bits_size;
	assign auto_in_d_bits_sink = nodeIn_d_bits_sink;
	assign auto_in_d_bits_denied = nodeIn_d_bits_denied;
	assign auto_in_d_bits_data = (bypass ? 32'h00000000 : auto_out_1_d_bits_data);
	assign auto_in_d_bits_corrupt = nodeIn_d_bits_corrupt;
	assign auto_out_1_a_valid = (~stall & auto_in_a_valid) & ~bypass;
	assign auto_out_1_a_bits_opcode = auto_in_a_bits_opcode;
	assign auto_out_1_a_bits_address = auto_in_a_bits_address;
	assign auto_out_1_a_bits_data = auto_in_a_bits_data;
	assign auto_out_1_d_ready = auto_in_d_ready & ~bypass;
	assign auto_out_0_a_valid = (~stall & auto_in_a_valid) & bypass;
	assign auto_out_0_a_bits_opcode = auto_in_a_bits_opcode;
	assign auto_out_0_a_bits_address = {119'h000000000000000000000000000000, auto_in_a_bits_address};
	assign auto_out_0_d_ready = auto_in_d_ready & bypass;
endmodule
