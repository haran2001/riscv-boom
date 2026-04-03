module ICache (
	clock,
	reset,
	auto_master_out_a_ready,
	auto_master_out_a_valid,
	auto_master_out_a_bits_address,
	auto_master_out_d_valid,
	auto_master_out_d_bits_opcode,
	auto_master_out_d_bits_size,
	auto_master_out_d_bits_data,
	io_req_valid,
	io_req_bits_addr,
	io_s1_paddr,
	io_s1_kill,
	io_s2_kill,
	io_resp_valid,
	io_resp_bits_data,
	io_invalidate,
	io_perf_acquire
);
	input clock;
	input reset;
	input auto_master_out_a_ready;
	output wire auto_master_out_a_valid;
	output wire [31:0] auto_master_out_a_bits_address;
	input auto_master_out_d_valid;
	input [2:0] auto_master_out_d_bits_opcode;
	input [3:0] auto_master_out_d_bits_size;
	input [63:0] auto_master_out_d_bits_data;
	input io_req_valid;
	input [38:0] io_req_bits_addr;
	input [31:0] io_s1_paddr;
	input io_s1_kill;
	input io_s2_kill;
	output wire io_resp_valid;
	output wire [63:0] io_resp_bits_data;
	input io_invalidate;
	output wire io_perf_acquire;
	wire masterNodeOut_a_valid;
	wire dataArrayB0_MPORT_2_en;
	wire wen;
	wire tag_array_MPORT_mask_3;
	wire tag_array_MPORT_mask_2;
	wire tag_array_MPORT_mask_1;
	wire tag_array_MPORT_mask_0;
	wire tag_array_tag_rdata_en;
	wire [5:0] _tag_rdata_T;
	wire io_req_ready;
	wire [255:0] _dataArrayB0_ext_RW0_rdata;
	wire [79:0] _tag_array_ext_RW0_rdata;
	wire _repl_way_prng_io_out_0;
	wire _repl_way_prng_io_out_1;
	wire s0_valid = io_req_ready & io_req_valid;
	reg s1_valid;
	reg s2_valid;
	reg s2_hit;
	reg invalidated;
	reg refill_valid;
	wire refill_fire = auto_master_out_a_ready & masterNodeOut_a_valid;
	reg s2_miss_REG;
	wire s2_miss = (s2_valid & ~s2_hit) & ~s2_miss_REG;
	reg [31:0] refill_paddr;
	wire refill_one_beat = auto_master_out_d_valid & auto_master_out_d_bits_opcode[0];
	assign io_req_ready = ~refill_one_beat;
	wire [26:0] _r_beats1_decode_T = 27'h0000fff << auto_master_out_d_bits_size;
	wire [8:0] r_beats1 = (auto_master_out_d_bits_opcode[0] ? ~_r_beats1_decode_T[11:3] : 9'h000);
	reg [8:0] r_counter;
	wire [8:0] _r_counter1_T = r_counter - 9'h001;
	wire refill_done = (refill_one_beat & ((r_counter == 9'h001) | (r_beats1 == 9'h000))) & auto_master_out_d_valid;
	wire [1:0] repl_way = {_repl_way_prng_io_out_1, _repl_way_prng_io_out_0};
	assign _tag_rdata_T = io_req_bits_addr[11:6];
	assign tag_array_tag_rdata_en = ~refill_done & s0_valid;
	assign tag_array_MPORT_mask_0 = repl_way == 2'h0;
	assign tag_array_MPORT_mask_1 = repl_way == 2'h1;
	assign tag_array_MPORT_mask_2 = repl_way == 2'h2;
	assign tag_array_MPORT_mask_3 = &repl_way;
	reg [255:0] vb_array;
	wire [255:0] _s1_vb_T_1 = vb_array >> io_s1_paddr[11:6];
	wire s1_tag_hit_0 = _s1_vb_T_1[0] & (_tag_array_ext_RW0_rdata[19:0] == io_s1_paddr[31:12]);
	wire [255:0] _s1_vb_T_3 = vb_array >> {250'h000000000000000000000000000000000000000000000000000000000000001, io_s1_paddr[11:6]};
	wire s1_tag_hit_1 = _s1_vb_T_3[0] & (_tag_array_ext_RW0_rdata[39:20] == io_s1_paddr[31:12]);
	wire [255:0] _s1_vb_T_5 = vb_array >> {250'h000000000000000000000000000000000000000000000000000000000000002, io_s1_paddr[11:6]};
	wire s1_tag_hit_2 = _s1_vb_T_5[0] & (_tag_array_ext_RW0_rdata[59:40] == io_s1_paddr[31:12]);
	wire [255:0] _s1_vb_T_7 = vb_array >> {250'h000000000000000000000000000000000000000000000000000000000000003, io_s1_paddr[11:6]};
	wire s1_tag_hit_3 = _s1_vb_T_7[0] & (_tag_array_ext_RW0_rdata[79:60] == io_s1_paddr[31:12]);
	assign wen = refill_one_beat & ~invalidated;
	assign dataArrayB0_MPORT_2_en = ~wen & s0_valid;
	reg [63:0] REG_0;
	reg [63:0] REG_1;
	reg [63:0] REG_2;
	reg [63:0] REG_3;
	reg s2_tag_hit_0;
	reg s2_tag_hit_1;
	reg s2_tag_hit_2;
	reg s2_tag_hit_3;
	assign masterNodeOut_a_valid = (s2_miss & ~refill_valid) & ~io_s2_kill;
	always @(posedge clock) begin
		if (reset) begin
			s1_valid <= 1'h0;
			s2_valid <= 1'h0;
			refill_valid <= 1'h0;
			r_counter <= 9'h000;
			vb_array <= 256'h0000000000000000000000000000000000000000000000000000000000000000;
		end
		else begin
			s1_valid <= s0_valid;
			s2_valid <= s1_valid & ~io_s1_kill;
			refill_valid <= ~refill_done & (refill_fire | refill_valid);
			if (auto_master_out_d_valid) begin
				if (r_counter == 9'h000)
					r_counter <= r_beats1;
				else
					r_counter <= _r_counter1_T;
			end
			if (io_invalidate)
				vb_array <= 256'h0000000000000000000000000000000000000000000000000000000000000000;
			else if (refill_one_beat) begin : sv2v_autoblock_1
				reg [255:0] _vb_array_T_3;
				_vb_array_T_3 = 256'h0000000000000000000000000000000000000000000000000000000000000001 << {248'h00000000000000000000000000000000000000000000000000000000000000, _repl_way_prng_io_out_1, _repl_way_prng_io_out_0, refill_paddr[11:6]};
				if (refill_done & ~invalidated)
					vb_array <= vb_array | _vb_array_T_3;
				else
					vb_array <= ~(~vb_array | _vb_array_T_3);
			end
		end
		s2_hit <= ((s1_tag_hit_0 | s1_tag_hit_1) | s1_tag_hit_2) | s1_tag_hit_3;
		invalidated <= refill_valid & (io_invalidate | invalidated);
		s2_miss_REG <= refill_valid;
		if (s1_valid & ~(refill_valid | s2_miss))
			refill_paddr <= io_s1_paddr;
		REG_0 <= _dataArrayB0_ext_RW0_rdata[63:0];
		REG_1 <= _dataArrayB0_ext_RW0_rdata[127:64];
		REG_2 <= _dataArrayB0_ext_RW0_rdata[191:128];
		REG_3 <= _dataArrayB0_ext_RW0_rdata[255:192];
		s2_tag_hit_0 <= s1_tag_hit_0;
		s2_tag_hit_1 <= s1_tag_hit_1;
		s2_tag_hit_2 <= s1_tag_hit_2;
		s2_tag_hit_3 <= s1_tag_hit_3;
	end
	MaxPeriodFibonacciLFSR repl_way_prng(
		.clock(clock),
		.reset(reset),
		.io_increment(refill_fire),
		.io_out_0(_repl_way_prng_io_out_0),
		.io_out_1(_repl_way_prng_io_out_1),
		.io_out_2(),
		.io_out_3(),
		.io_out_4(),
		.io_out_5(),
		.io_out_6(),
		.io_out_7(),
		.io_out_8(),
		.io_out_9(),
		.io_out_10(),
		.io_out_11(),
		.io_out_12(),
		.io_out_13(),
		.io_out_14(),
		.io_out_15()
	);
	tag_array_64x80 tag_array_ext(
		.RW0_addr((refill_done ? refill_paddr[11:6] : _tag_rdata_T)),
		.RW0_en(tag_array_tag_rdata_en | refill_done),
		.RW0_clk(clock),
		.RW0_wmode(refill_one_beat),
		.RW0_wdata({4 {refill_paddr[31:12]}}),
		.RW0_rdata(_tag_array_ext_RW0_rdata),
		.RW0_wmask({tag_array_MPORT_mask_3, tag_array_MPORT_mask_2, tag_array_MPORT_mask_1, tag_array_MPORT_mask_0})
	);
	dataArrayB0_512x256 dataArrayB0_ext(
		.RW0_addr((refill_one_beat ? {refill_paddr[11:6], 3'h0} | (r_beats1 & ~_r_counter1_T) : io_req_bits_addr[11:3])),
		.RW0_en(dataArrayB0_MPORT_2_en | wen),
		.RW0_clk(clock),
		.RW0_wmode(refill_one_beat),
		.RW0_wdata({4 {auto_master_out_d_bits_data}}),
		.RW0_rdata(_dataArrayB0_ext_RW0_rdata),
		.RW0_wmask(4'h1 << {2'h0, _repl_way_prng_io_out_1, _repl_way_prng_io_out_0})
	);
	assign auto_master_out_a_valid = masterNodeOut_a_valid;
	assign auto_master_out_a_bits_address = {refill_paddr[31:6], 6'h00};
	assign io_resp_valid = s2_valid & s2_hit;
	assign io_resp_bits_data = (((s2_tag_hit_0 ? REG_0 : 64'h0000000000000000) | (s2_tag_hit_1 ? REG_1 : 64'h0000000000000000)) | (s2_tag_hit_2 ? REG_2 : 64'h0000000000000000)) | (s2_tag_hit_3 ? REG_3 : 64'h0000000000000000);
	assign io_perf_acquire = refill_fire;
endmodule
