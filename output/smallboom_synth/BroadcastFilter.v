module BroadcastFilter (
	io_request_ready,
	io_request_valid,
	io_request_bits_mshr,
	io_request_bits_address,
	io_request_bits_allocOH,
	io_request_bits_needT,
	io_response_ready,
	io_response_valid,
	io_response_bits_mshr,
	io_response_bits_address,
	io_response_bits_allocOH,
	io_response_bits_needT
);
	output wire io_request_ready;
	input io_request_valid;
	input [1:0] io_request_bits_mshr;
	input [31:0] io_request_bits_address;
	input io_request_bits_allocOH;
	input io_request_bits_needT;
	input io_response_ready;
	output wire io_response_valid;
	output wire [1:0] io_response_bits_mshr;
	output wire [31:0] io_response_bits_address;
	output wire io_response_bits_allocOH;
	output wire io_response_bits_needT;
	assign io_request_ready = io_response_ready;
	assign io_response_valid = io_request_valid;
	assign io_response_bits_mshr = io_request_bits_mshr;
	assign io_response_bits_address = io_request_bits_address;
	assign io_response_bits_allocOH = io_request_bits_allocOH;
	assign io_response_bits_needT = io_request_bits_needT;
endmodule
