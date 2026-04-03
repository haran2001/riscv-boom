module AsyncQueueSink_DebugInternalBundle (
	clock,
	reset,
	io_deq_valid,
	io_deq_bits_resumereq,
	io_deq_bits_hartsel,
	io_deq_bits_ackhavereset,
	io_deq_bits_hrmask_0,
	io_async_mem_0_resumereq,
	io_async_mem_0_hartsel,
	io_async_mem_0_ackhavereset,
	io_async_mem_0_hrmask_0,
	io_async_ridx,
	io_async_widx,
	io_async_safe_ridx_valid,
	io_async_safe_widx_valid,
	io_async_safe_source_reset_n,
	io_async_safe_sink_reset_n
);
	input clock;
	input reset;
	output wire io_deq_valid;
	output wire io_deq_bits_resumereq;
	output wire [9:0] io_deq_bits_hartsel;
	output wire io_deq_bits_ackhavereset;
	output wire io_deq_bits_hrmask_0;
	input io_async_mem_0_resumereq;
	input [9:0] io_async_mem_0_hartsel;
	input io_async_mem_0_ackhavereset;
	input io_async_mem_0_hrmask_0;
	output wire io_async_ridx;
	input io_async_widx;
	output wire io_async_safe_ridx_valid;
	input io_async_safe_widx_valid;
	input io_async_safe_source_reset_n;
	output wire io_async_safe_sink_reset_n;
	wire io_deq_valid_0;
	wire _source_valid_io_out;
	wire _source_extend_io_out;
	wire _sink_valid_0_io_out;
	wire [14:0] _io_deq_bits_deq_bits_reg_io_q;
	wire _widx_widx_gray_io_q;
	reg ridx_ridx_bin;
	wire ridx = _source_valid_io_out & (ridx_ridx_bin + io_deq_valid_0);
	wire valid = _source_valid_io_out & (ridx != _widx_widx_gray_io_q);
	reg valid_reg;
	assign io_deq_valid_0 = valid_reg & _source_valid_io_out;
	reg ridx_gray;
	always @(posedge clock or posedge reset)
		if (reset) begin
			ridx_ridx_bin <= 1'h0;
			valid_reg <= 1'h0;
			ridx_gray <= 1'h0;
		end
		else begin
			ridx_ridx_bin <= ridx;
			valid_reg <= valid;
			ridx_gray <= ridx;
		end
	AsyncResetSynchronizerShiftReg_w1_d3_i0 widx_widx_gray(
		.clock(clock),
		.reset(reset),
		.io_d(io_async_widx),
		.io_q(_widx_widx_gray_io_q)
	);
	ClockCrossingReg_w15 io_deq_bits_deq_bits_reg(
		.clock(clock),
		.io_d({io_async_mem_0_resumereq, io_async_mem_0_hartsel, io_async_mem_0_ackhavereset, 2'h0, io_async_mem_0_hrmask_0}),
		.io_q(_io_deq_bits_deq_bits_reg_io_q),
		.io_en(valid)
	);
	AsyncValidSync sink_valid_0(
		.io_in(1'h1),
		.io_out(_sink_valid_0_io_out),
		.clock(clock),
		.reset(reset | ~io_async_safe_source_reset_n)
	);
	AsyncValidSync sink_valid_1(
		.io_in(_sink_valid_0_io_out),
		.io_out(io_async_safe_ridx_valid),
		.clock(clock),
		.reset(reset | ~io_async_safe_source_reset_n)
	);
	AsyncValidSync source_extend(
		.io_in(io_async_safe_widx_valid),
		.io_out(_source_extend_io_out),
		.clock(clock),
		.reset(reset | ~io_async_safe_source_reset_n)
	);
	AsyncValidSync source_valid(
		.io_in(_source_extend_io_out),
		.io_out(_source_valid_io_out),
		.clock(clock),
		.reset(reset)
	);
	assign io_deq_valid = io_deq_valid_0;
	assign io_deq_bits_resumereq = _io_deq_bits_deq_bits_reg_io_q[14];
	assign io_deq_bits_hartsel = _io_deq_bits_deq_bits_reg_io_q[13:4];
	assign io_deq_bits_ackhavereset = _io_deq_bits_deq_bits_reg_io_q[3];
	assign io_deq_bits_hrmask_0 = _io_deq_bits_deq_bits_reg_io_q[0];
	assign io_async_ridx = ridx_gray;
	assign io_async_safe_sink_reset_n = ~reset;
endmodule
