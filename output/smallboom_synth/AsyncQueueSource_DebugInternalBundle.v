module AsyncQueueSource_DebugInternalBundle (
	clock,
	reset,
	io_enq_ready,
	io_enq_valid,
	io_enq_bits_resumereq,
	io_enq_bits_hartsel,
	io_enq_bits_ackhavereset,
	io_enq_bits_hrmask_0,
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
	output wire io_enq_ready;
	input io_enq_valid;
	input io_enq_bits_resumereq;
	input [9:0] io_enq_bits_hartsel;
	input io_enq_bits_ackhavereset;
	input io_enq_bits_hrmask_0;
	output wire io_async_mem_0_resumereq;
	output wire [9:0] io_async_mem_0_hartsel;
	output wire io_async_mem_0_ackhavereset;
	output wire io_async_mem_0_hrmask_0;
	input io_async_ridx;
	output wire io_async_widx;
	input io_async_safe_ridx_valid;
	output wire io_async_safe_widx_valid;
	output wire io_async_safe_source_reset_n;
	input io_async_safe_sink_reset_n;
	wire io_enq_ready_0;
	wire _sink_valid_io_out;
	wire _sink_extend_io_out;
	wire _source_valid_0_io_out;
	wire _ridx_ridx_gray_io_q;
	reg mem_0_resumereq;
	reg [9:0] mem_0_hartsel;
	reg mem_0_ackhavereset;
	reg mem_0_hrmask_0;
	wire _widx_T_1 = io_enq_ready_0 & io_enq_valid;
	reg widx_widx_bin;
	reg ready_reg;
	assign io_enq_ready_0 = ready_reg & _sink_valid_io_out;
	reg widx_gray;
	always @(posedge clock)
		if (_widx_T_1) begin
			mem_0_resumereq <= io_enq_bits_resumereq;
			mem_0_hartsel <= io_enq_bits_hartsel;
			mem_0_ackhavereset <= io_enq_bits_ackhavereset;
			mem_0_hrmask_0 <= io_enq_bits_hrmask_0;
		end
	always @(posedge clock or posedge reset)
		if (reset) begin
			widx_widx_bin <= 1'h0;
			ready_reg <= 1'h0;
			widx_gray <= 1'h0;
		end
		else begin : sv2v_autoblock_1
			reg widx;
			widx = _sink_valid_io_out & (widx_widx_bin + _widx_T_1);
			widx_widx_bin <= widx;
			ready_reg <= _sink_valid_io_out & (widx != ~_ridx_ridx_gray_io_q);
			widx_gray <= widx;
		end
	AsyncResetSynchronizerShiftReg_w1_d3_i0 ridx_ridx_gray(
		.clock(clock),
		.reset(reset),
		.io_d(io_async_ridx),
		.io_q(_ridx_ridx_gray_io_q)
	);
	AsyncValidSync source_valid_0(
		.io_in(1'h1),
		.io_out(_source_valid_0_io_out),
		.clock(clock),
		.reset(reset | ~io_async_safe_sink_reset_n)
	);
	AsyncValidSync source_valid_1(
		.io_in(_source_valid_0_io_out),
		.io_out(io_async_safe_widx_valid),
		.clock(clock),
		.reset(reset | ~io_async_safe_sink_reset_n)
	);
	AsyncValidSync sink_extend(
		.io_in(io_async_safe_ridx_valid),
		.io_out(_sink_extend_io_out),
		.clock(clock),
		.reset(reset | ~io_async_safe_sink_reset_n)
	);
	AsyncValidSync sink_valid(
		.io_in(_sink_extend_io_out),
		.io_out(_sink_valid_io_out),
		.clock(clock),
		.reset(reset)
	);
	assign io_enq_ready = io_enq_ready_0;
	assign io_async_mem_0_resumereq = mem_0_resumereq;
	assign io_async_mem_0_hartsel = mem_0_hartsel;
	assign io_async_mem_0_ackhavereset = mem_0_ackhavereset;
	assign io_async_mem_0_hrmask_0 = mem_0_hrmask_0;
	assign io_async_widx = widx_gray;
	assign io_async_safe_source_reset_n = ~reset;
endmodule
