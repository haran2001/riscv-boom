module TLFragmenter_CLINT (
	clock,
	reset,
	auto_anon_in_a_ready,
	auto_anon_in_a_valid,
	auto_anon_in_a_bits_opcode,
	auto_anon_in_a_bits_param,
	auto_anon_in_a_bits_size,
	auto_anon_in_a_bits_source,
	auto_anon_in_a_bits_address,
	auto_anon_in_a_bits_mask,
	auto_anon_in_a_bits_data,
	auto_anon_in_a_bits_corrupt,
	auto_anon_in_d_ready,
	auto_anon_in_d_valid,
	auto_anon_in_d_bits_opcode,
	auto_anon_in_d_bits_size,
	auto_anon_in_d_bits_source,
	auto_anon_in_d_bits_data,
	auto_anon_out_a_ready,
	auto_anon_out_a_valid,
	auto_anon_out_a_bits_opcode,
	auto_anon_out_a_bits_param,
	auto_anon_out_a_bits_size,
	auto_anon_out_a_bits_source,
	auto_anon_out_a_bits_address,
	auto_anon_out_a_bits_mask,
	auto_anon_out_a_bits_data,
	auto_anon_out_a_bits_corrupt,
	auto_anon_out_d_ready,
	auto_anon_out_d_valid,
	auto_anon_out_d_bits_opcode,
	auto_anon_out_d_bits_size,
	auto_anon_out_d_bits_source,
	auto_anon_out_d_bits_data
);
	input clock;
	input reset;
	output wire auto_anon_in_a_ready;
	input auto_anon_in_a_valid;
	input [2:0] auto_anon_in_a_bits_opcode;
	input [2:0] auto_anon_in_a_bits_param;
	input [2:0] auto_anon_in_a_bits_size;
	input [4:0] auto_anon_in_a_bits_source;
	input [25:0] auto_anon_in_a_bits_address;
	input [7:0] auto_anon_in_a_bits_mask;
	input [63:0] auto_anon_in_a_bits_data;
	input auto_anon_in_a_bits_corrupt;
	input auto_anon_in_d_ready;
	output wire auto_anon_in_d_valid;
	output wire [2:0] auto_anon_in_d_bits_opcode;
	output wire [2:0] auto_anon_in_d_bits_size;
	output wire [4:0] auto_anon_in_d_bits_source;
	output wire [63:0] auto_anon_in_d_bits_data;
	input auto_anon_out_a_ready;
	output wire auto_anon_out_a_valid;
	output wire [2:0] auto_anon_out_a_bits_opcode;
	output wire [2:0] auto_anon_out_a_bits_param;
	output wire [1:0] auto_anon_out_a_bits_size;
	output wire [8:0] auto_anon_out_a_bits_source;
	output wire [25:0] auto_anon_out_a_bits_address;
	output wire [7:0] auto_anon_out_a_bits_mask;
	output wire [63:0] auto_anon_out_a_bits_data;
	output wire auto_anon_out_a_bits_corrupt;
	output wire auto_anon_out_d_ready;
	input auto_anon_out_d_valid;
	input [2:0] auto_anon_out_d_bits_opcode;
	input [1:0] auto_anon_out_d_bits_size;
	input [8:0] auto_anon_out_d_bits_source;
	input [63:0] auto_anon_out_d_bits_data;
	wire _repeater_io_full;
	wire _repeater_io_enq_ready;
	wire _repeater_io_deq_valid;
	wire [2:0] _repeater_io_deq_bits_opcode;
	wire [2:0] _repeater_io_deq_bits_size;
	wire [4:0] _repeater_io_deq_bits_source;
	wire [25:0] _repeater_io_deq_bits_address;
	wire [7:0] _repeater_io_deq_bits_mask;
	reg [2:0] acknum;
	reg [2:0] dOrig;
	reg dToggle;
	wire dFirst = acknum == 3'h0;
	wire [5:0] _dsizeOH1_T = 6'h07 << auto_anon_out_d_bits_size;
	wire [2:0] _GEN = ~auto_anon_out_d_bits_source[2:0];
	wire [2:0] dFirst_size_hi = auto_anon_out_d_bits_source[2:0] & {1'h1, _GEN[2:1]};
	wire [2:0] _dFirst_size_T_8 = {1'h0, dFirst_size_hi[2:1]} | (~_dsizeOH1_T[2:0] & {_GEN[0], _dsizeOH1_T[2:1]});
	wire [2:0] dFirst_size = {|dFirst_size_hi, |_dFirst_size_T_8[2:1], _dFirst_size_T_8[2] | _dFirst_size_T_8[0]};
	wire drop = ~auto_anon_out_d_bits_opcode[0] & |auto_anon_out_d_bits_source[2:0];
	wire anonOut_d_ready = auto_anon_in_d_ready | drop;
	wire anonIn_d_valid = auto_anon_out_d_valid & ~drop;
	wire [2:0] anonIn_d_bits_size = (dFirst ? dFirst_size : dOrig);
	wire [12:0] _aOrigOH1_T = 13'h003f << _repeater_io_deq_bits_size;
	reg [2:0] gennum;
	wire aFirst = gennum == 3'h0;
	wire [2:0] _old_gennum1_T_1 = gennum - 3'h1;
	wire [2:0] aFragnum = (aFirst ? ~_aOrigOH1_T[5:3] : _old_gennum1_T_1);
	reg aToggle_r;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg _GEN_0;
		reg _GEN_1;
		_GEN_0 = anonOut_d_ready & auto_anon_out_d_valid;
		_GEN_1 = _GEN_0 & dFirst;
		if (reset) begin
			acknum <= 3'h0;
			dToggle <= 1'h0;
			gennum <= 3'h0;
		end
		else begin
			if (_GEN_0) begin
				if (dFirst)
					acknum <= auto_anon_out_d_bits_source[2:0];
				else
					acknum <= acknum - {2'h0, auto_anon_out_d_bits_opcode[0] | &auto_anon_out_d_bits_size};
			end
			if (_GEN_1)
				dToggle <= auto_anon_out_d_bits_source[3];
			if (auto_anon_out_a_ready & _repeater_io_deq_valid) begin
				if (aFirst)
					gennum <= ~_aOrigOH1_T[5:3];
				else
					gennum <= _old_gennum1_T_1;
			end
		end
		if (_GEN_1)
			dOrig <= dFirst_size;
		if (aFirst)
			aToggle_r <= dToggle;
	end
	TLMonitor_14 monitor(
		.clock(clock),
		.reset(reset),
		.io_in_a_ready(_repeater_io_enq_ready),
		.io_in_a_valid(auto_anon_in_a_valid),
		.io_in_a_bits_opcode(auto_anon_in_a_bits_opcode),
		.io_in_a_bits_param(auto_anon_in_a_bits_param),
		.io_in_a_bits_size(auto_anon_in_a_bits_size),
		.io_in_a_bits_source(auto_anon_in_a_bits_source),
		.io_in_a_bits_address(auto_anon_in_a_bits_address),
		.io_in_a_bits_mask(auto_anon_in_a_bits_mask),
		.io_in_a_bits_corrupt(auto_anon_in_a_bits_corrupt),
		.io_in_d_ready(auto_anon_in_d_ready),
		.io_in_d_valid(anonIn_d_valid),
		.io_in_d_bits_opcode(auto_anon_out_d_bits_opcode),
		.io_in_d_bits_size(anonIn_d_bits_size),
		.io_in_d_bits_source(auto_anon_out_d_bits_source[8:4])
	);
	Repeater_TLBundleA_a26d64s5k1z3u repeater(
		.clock(clock),
		.reset(reset),
		.io_repeat(_repeater_io_deq_bits_opcode[2] & |aFragnum),
		.io_full(_repeater_io_full),
		.io_enq_ready(_repeater_io_enq_ready),
		.io_enq_valid(auto_anon_in_a_valid),
		.io_enq_bits_opcode(auto_anon_in_a_bits_opcode),
		.io_enq_bits_param(auto_anon_in_a_bits_param),
		.io_enq_bits_size(auto_anon_in_a_bits_size),
		.io_enq_bits_source(auto_anon_in_a_bits_source),
		.io_enq_bits_address(auto_anon_in_a_bits_address),
		.io_enq_bits_mask(auto_anon_in_a_bits_mask),
		.io_enq_bits_corrupt(auto_anon_in_a_bits_corrupt),
		.io_deq_ready(auto_anon_out_a_ready),
		.io_deq_valid(_repeater_io_deq_valid),
		.io_deq_bits_opcode(_repeater_io_deq_bits_opcode),
		.io_deq_bits_param(auto_anon_out_a_bits_param),
		.io_deq_bits_size(_repeater_io_deq_bits_size),
		.io_deq_bits_source(_repeater_io_deq_bits_source),
		.io_deq_bits_address(_repeater_io_deq_bits_address),
		.io_deq_bits_mask(_repeater_io_deq_bits_mask),
		.io_deq_bits_corrupt(auto_anon_out_a_bits_corrupt)
	);
	assign auto_anon_in_a_ready = _repeater_io_enq_ready;
	assign auto_anon_in_d_valid = anonIn_d_valid;
	assign auto_anon_in_d_bits_opcode = auto_anon_out_d_bits_opcode;
	assign auto_anon_in_d_bits_size = anonIn_d_bits_size;
	assign auto_anon_in_d_bits_source = auto_anon_out_d_bits_source[8:4];
	assign auto_anon_in_d_bits_data = auto_anon_out_d_bits_data;
	assign auto_anon_out_a_valid = _repeater_io_deq_valid;
	assign auto_anon_out_a_bits_opcode = _repeater_io_deq_bits_opcode;
	assign auto_anon_out_a_bits_size = (_repeater_io_deq_bits_size[2] ? 2'h3 : _repeater_io_deq_bits_size[1:0]);
	assign auto_anon_out_a_bits_source = {_repeater_io_deq_bits_source, ~(aFirst ? dToggle : aToggle_r), aFragnum};
	assign auto_anon_out_a_bits_address = {_repeater_io_deq_bits_address[25:6], _repeater_io_deq_bits_address[5:0] | {~(aFragnum | _aOrigOH1_T[5:3]), 3'h0}};
	assign auto_anon_out_a_bits_mask = (_repeater_io_full ? 8'hff : auto_anon_in_a_bits_mask);
	assign auto_anon_out_a_bits_data = auto_anon_in_a_bits_data;
	assign auto_anon_out_d_ready = anonOut_d_ready;
endmodule
