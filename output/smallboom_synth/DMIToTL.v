module DMIToTL (
	auto_out_a_ready,
	auto_out_a_valid,
	auto_out_a_bits_opcode,
	auto_out_a_bits_address,
	auto_out_a_bits_data,
	auto_out_d_ready,
	auto_out_d_valid,
	auto_out_d_bits_denied,
	auto_out_d_bits_data,
	auto_out_d_bits_corrupt,
	io_dmi_req_ready,
	io_dmi_req_valid,
	io_dmi_req_bits_addr,
	io_dmi_req_bits_data,
	io_dmi_req_bits_op,
	io_dmi_resp_ready,
	io_dmi_resp_valid,
	io_dmi_resp_bits_data,
	io_dmi_resp_bits_resp
);
	input auto_out_a_ready;
	output wire auto_out_a_valid;
	output wire [2:0] auto_out_a_bits_opcode;
	output wire [8:0] auto_out_a_bits_address;
	output wire [31:0] auto_out_a_bits_data;
	output wire auto_out_d_ready;
	input auto_out_d_valid;
	input auto_out_d_bits_denied;
	input [31:0] auto_out_d_bits_data;
	input auto_out_d_bits_corrupt;
	output wire io_dmi_req_ready;
	input io_dmi_req_valid;
	input [6:0] io_dmi_req_bits_addr;
	input [31:0] io_dmi_req_bits_data;
	input [1:0] io_dmi_req_bits_op;
	input io_dmi_resp_ready;
	output wire io_dmi_resp_valid;
	output wire [31:0] io_dmi_resp_bits_data;
	output wire [1:0] io_dmi_resp_bits_resp;
	wire _GEN = io_dmi_req_bits_op == 2'h2;
	wire _GEN_0 = io_dmi_req_bits_op == 2'h1;
	assign auto_out_a_valid = io_dmi_req_valid;
	assign auto_out_a_bits_opcode = (_GEN ? 3'h0 : {_GEN_0, 2'h0});
	assign auto_out_a_bits_address = (_GEN | _GEN_0 ? {io_dmi_req_bits_addr, 2'h0} : 9'h048);
	assign auto_out_a_bits_data = (_GEN ? io_dmi_req_bits_data : 32'h00000000);
	assign auto_out_d_ready = io_dmi_resp_ready;
	assign io_dmi_req_ready = auto_out_a_ready;
	assign io_dmi_resp_valid = auto_out_d_valid;
	assign io_dmi_resp_bits_data = auto_out_d_bits_data;
	assign io_dmi_resp_bits_resp = {1'h0, auto_out_d_bits_corrupt | auto_out_d_bits_denied};
endmodule
