module PipelinedMultiplier (
	clock,
	reset,
	io_req_valid,
	io_req_bits_fn,
	io_req_bits_dw,
	io_req_bits_in1,
	io_req_bits_in2,
	io_resp_bits_data
);
	input clock;
	input reset;
	input io_req_valid;
	input [4:0] io_req_bits_fn;
	input io_req_bits_dw;
	input [63:0] io_req_bits_in1;
	input [63:0] io_req_bits_in2;
	output wire [63:0] io_resp_bits_data;
	reg in_pipe_v;
	reg [4:0] in_pipe_b_fn;
	reg in_pipe_b_dw;
	reg [63:0] in_pipe_b_in1;
	reg [63:0] in_pipe_b_in2;
	reg io_resp_bits_data_pipe_v;
	reg [63:0] io_resp_bits_data_pipe_b;
	reg [63:0] io_resp_bits_data_pipe_pipe_b;
	always @(posedge clock) begin
		if (reset) begin
			in_pipe_v <= 1'h0;
			io_resp_bits_data_pipe_v <= 1'h0;
		end
		else begin
			in_pipe_v <= io_req_valid;
			io_resp_bits_data_pipe_v <= in_pipe_v;
		end
		if (io_req_valid) begin
			in_pipe_b_fn <= io_req_bits_fn;
			in_pipe_b_dw <= io_req_bits_dw;
			in_pipe_b_in1 <= io_req_bits_in1;
			in_pipe_b_in2 <= io_req_bits_in2;
		end
		if (in_pipe_v) begin : sv2v_autoblock_1
			reg [1:0] decoded_invInputs;
			reg [127:0] prod;
			decoded_invInputs = ~in_pipe_b_fn[1:0];
			prod = {{64 {|{decoded_invInputs[1], &{decoded_invInputs[0], in_pipe_b_fn[1]}} & in_pipe_b_in1[63]}}, in_pipe_b_in1} * {{64 {decoded_invInputs[1] & in_pipe_b_in2[63]}}, in_pipe_b_in2};
			io_resp_bits_data_pipe_b <= (|{in_pipe_b_fn[0], in_pipe_b_fn[1]} ? prod[127:64] : (in_pipe_b_dw ? prod[63:0] : {{32 {prod[31]}}, prod[31:0]}));
		end
		if (io_resp_bits_data_pipe_v)
			io_resp_bits_data_pipe_pipe_b <= io_resp_bits_data_pipe_b;
	end
	assign io_resp_bits_data = io_resp_bits_data_pipe_pipe_b;
endmodule
