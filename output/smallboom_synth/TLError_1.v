module TLError_1 (
	clock,
	reset,
	auto_in_a_ready,
	auto_in_a_valid,
	auto_in_a_bits_opcode,
	auto_in_a_bits_address,
	auto_in_d_ready,
	auto_in_d_valid,
	auto_in_d_bits_opcode,
	auto_in_d_bits_size,
	auto_in_d_bits_denied,
	auto_in_d_bits_corrupt
);
	input clock;
	input reset;
	output wire auto_in_a_ready;
	input auto_in_a_valid;
	input [2:0] auto_in_a_bits_opcode;
	input [127:0] auto_in_a_bits_address;
	input auto_in_d_ready;
	output wire auto_in_d_valid;
	output wire [2:0] auto_in_d_bits_opcode;
	output wire [1:0] auto_in_d_bits_size;
	output wire auto_in_d_bits_denied;
	output wire auto_in_d_bits_corrupt;
	wire da_ready;
	wire [2:0] da_bits_opcode;
	wire [23:0] _GEN = 24'h911240;
	reg idle;
	reg r_counter;
	wire nodeIn_a_ready = da_ready & idle;
	wire winner_1 = auto_in_a_valid & idle;
	assign da_bits_opcode = _GEN[auto_in_a_bits_opcode * 3+:3];
	reg beatsLeft;
	reg state_1;
	wire muxState_1 = (beatsLeft ? state_1 : winner_1);
	assign da_ready = auto_in_d_ready & (~beatsLeft | state_1);
	wire nodeIn_d_valid = (~beatsLeft | state_1) & winner_1;
	wire _nodeIn_d_bits_T_2 = muxState_1 & da_bits_opcode[0];
	wire [1:0] _nodeIn_d_bits_T_17 = {muxState_1, 1'h0};
	wire [2:0] _nodeIn_d_bits_T_22 = (muxState_1 ? da_bits_opcode : 3'h0);
	always @(posedge clock)
		if (reset) begin
			idle <= 1'h1;
			r_counter <= 1'h0;
			beatsLeft <= 1'h0;
			state_1 <= 1'h0;
		end
		else begin : sv2v_autoblock_1
			reg r_3;
			r_3 = da_ready & winner_1;
			idle <= ~(r_3 & (da_bits_opcode == 3'h4)) & idle;
			r_counter <= (~r_3 | (r_counter - 1'h1)) & r_counter;
			beatsLeft <= ~(~beatsLeft & auto_in_d_ready) & (beatsLeft - (auto_in_d_ready & nodeIn_d_valid));
			if (beatsLeft)
				;
			else
				state_1 <= winner_1;
		end
	TLMonitor_33 monitor(
		.clock(clock),
		.reset(reset),
		.io_in_a_ready(nodeIn_a_ready),
		.io_in_a_valid(auto_in_a_valid),
		.io_in_a_bits_opcode(auto_in_a_bits_opcode),
		.io_in_a_bits_address(auto_in_a_bits_address),
		.io_in_d_ready(auto_in_d_ready),
		.io_in_d_valid(nodeIn_d_valid),
		.io_in_d_bits_opcode(_nodeIn_d_bits_T_22),
		.io_in_d_bits_size(_nodeIn_d_bits_T_17),
		.io_in_d_bits_denied(muxState_1),
		.io_in_d_bits_corrupt(_nodeIn_d_bits_T_2)
	);
	assign auto_in_a_ready = nodeIn_a_ready;
	assign auto_in_d_valid = nodeIn_d_valid;
	assign auto_in_d_bits_opcode = _nodeIn_d_bits_T_22;
	assign auto_in_d_bits_size = _nodeIn_d_bits_T_17;
	assign auto_in_d_bits_denied = muxState_1;
	assign auto_in_d_bits_corrupt = _nodeIn_d_bits_T_2;
endmodule
