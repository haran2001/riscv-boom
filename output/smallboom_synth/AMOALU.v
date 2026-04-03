module AMOALU (
	io_mask,
	io_cmd,
	io_lhs,
	io_rhs,
	io_out
);
	input [7:0] io_mask;
	input [4:0] io_cmd;
	input [63:0] io_lhs;
	input [63:0] io_rhs;
	output wire [63:0] io_out;
	wire _logic_xor_T_1 = io_cmd == 5'h0a;
	wire logic_and = _logic_xor_T_1 | (io_cmd == 5'h0b);
	wire logic_xor = (io_cmd == 5'h09) | _logic_xor_T_1;
	wire [63:0] adder_out_mask = {32'hffffffff, io_mask[3], 31'h7fffffff};
	wire [63:0] wmask = {{8 {io_mask[7]}}, {8 {io_mask[6]}}, {8 {io_mask[5]}}, {8 {io_mask[4]}}, {8 {io_mask[3]}}, {8 {io_mask[2]}}, {8 {io_mask[1]}}, {8 {io_mask[0]}}};
	assign io_out = (wmask & (io_cmd == 5'h08 ? (io_lhs & adder_out_mask) + (io_rhs & adder_out_mask) : (logic_and | logic_xor ? (logic_and ? io_lhs & io_rhs : 64'h0000000000000000) | (logic_xor ? io_lhs ^ io_rhs : 64'h0000000000000000) : (((io_mask[4] ? (io_lhs[63] == io_rhs[63] ? (io_lhs[63:32] < io_rhs[63:32]) | ((io_lhs[63:32] == io_rhs[63:32]) & (io_lhs[31:0] < io_rhs[31:0])) : (io_cmd[1] ? io_rhs[63] : io_lhs[63])) : (io_lhs[31] == io_rhs[31] ? io_lhs[31:0] < io_rhs[31:0] : (io_cmd[1] ? io_rhs[31] : io_lhs[31]))) ? (io_cmd == 5'h0c) | (io_cmd == 5'h0e) : (io_cmd == 5'h0d) | (io_cmd == 5'h0f)) ? io_lhs : io_rhs)))) | (~wmask & io_lhs);
endmodule
