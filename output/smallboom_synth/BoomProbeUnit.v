module BoomProbeUnit (
	clock,
	reset,
	io_req_ready,
	io_req_valid,
	io_req_bits_param,
	io_req_bits_size,
	io_req_bits_source,
	io_req_bits_address,
	io_rep_ready,
	io_rep_valid,
	io_rep_bits_param,
	io_rep_bits_size,
	io_rep_bits_source,
	io_rep_bits_address,
	io_meta_read_ready,
	io_meta_read_valid,
	io_meta_read_bits_idx,
	io_meta_read_bits_tag,
	io_meta_write_ready,
	io_meta_write_valid,
	io_meta_write_bits_idx,
	io_meta_write_bits_way_en,
	io_meta_write_bits_data_coh_state,
	io_meta_write_bits_data_tag,
	io_wb_req_ready,
	io_wb_req_valid,
	io_wb_req_bits_tag,
	io_wb_req_bits_idx,
	io_wb_req_bits_source,
	io_wb_req_bits_param,
	io_wb_req_bits_way_en,
	io_way_en,
	io_wb_rdy,
	io_mshr_rdy,
	io_mshr_wb_rdy,
	io_block_state_state,
	io_lsu_release_ready,
	io_lsu_release_valid,
	io_lsu_release_bits_address,
	io_state_valid,
	io_state_bits
);
	input clock;
	input reset;
	output wire io_req_ready;
	input io_req_valid;
	input [1:0] io_req_bits_param;
	input [3:0] io_req_bits_size;
	input [1:0] io_req_bits_source;
	input [31:0] io_req_bits_address;
	input io_rep_ready;
	output wire io_rep_valid;
	output wire [2:0] io_rep_bits_param;
	output wire [3:0] io_rep_bits_size;
	output wire [1:0] io_rep_bits_source;
	output wire [31:0] io_rep_bits_address;
	input io_meta_read_ready;
	output wire io_meta_read_valid;
	output wire [5:0] io_meta_read_bits_idx;
	output wire [19:0] io_meta_read_bits_tag;
	input io_meta_write_ready;
	output wire io_meta_write_valid;
	output wire [5:0] io_meta_write_bits_idx;
	output wire [3:0] io_meta_write_bits_way_en;
	output wire [1:0] io_meta_write_bits_data_coh_state;
	output wire [19:0] io_meta_write_bits_data_tag;
	input io_wb_req_ready;
	output wire io_wb_req_valid;
	output wire [19:0] io_wb_req_bits_tag;
	output wire [5:0] io_wb_req_bits_idx;
	output wire [1:0] io_wb_req_bits_source;
	output wire [2:0] io_wb_req_bits_param;
	output wire [3:0] io_wb_req_bits_way_en;
	input [3:0] io_way_en;
	input io_wb_rdy;
	input io_mshr_rdy;
	output wire io_mshr_wb_rdy;
	input [1:0] io_block_state_state;
	input io_lsu_release_ready;
	output wire io_lsu_release_valid;
	output wire [31:0] io_lsu_release_bits_address;
	output wire io_state_valid;
	output wire [39:0] io_state_bits;
	reg [3:0] state;
	reg [1:0] req_param;
	reg [3:0] req_size;
	reg [1:0] req_source;
	reg [31:0] req_address;
	reg [3:0] way_en;
	reg [1:0] old_coh_state;
	wire [3:0] _r_T = {req_param, (|way_en ? old_coh_state : 2'h0)};
	wire _r_T_26 = _r_T == 4'hb;
	wire _r_T_29 = _r_T == 4'h4;
	wire _r_T_33 = _r_T == 4'h5;
	wire _r_T_37 = _r_T == 4'h6;
	wire _r_T_41 = _r_T == 4'h7;
	wire _r_T_45 = _r_T == 4'h0;
	wire _r_T_49 = _r_T == 4'h1;
	wire _r_T_53 = _r_T == 4'h2;
	wire _r_T_57 = _r_T == 4'h3;
	wire _GEN = _r_T_57 | _r_T_53;
	wire [2:0] report_param = (_GEN ? 3'h3 : (_r_T_49 ? 3'h4 : (_r_T_45 ? 3'h5 : (_r_T_41 | _r_T_37 ? 3'h0 : (_r_T_33 ? 3'h4 : (_r_T_29 ? 3'h5 : (_r_T_26 | (_r_T == 4'ha) ? 3'h1 : (_r_T == 4'h9 ? 3'h2 : (_r_T == 4'h8 ? 3'h5 : 3'h0)))))))));
	wire io_req_ready_0 = state == 4'h0;
	wire io_rep_valid_0 = state == 4'h6;
	wire io_meta_read_valid_0 = state == 4'h1;
	wire io_meta_write_valid_0 = state == 4'h9;
	wire io_wb_req_valid_0 = state == 4'h7;
	wire io_lsu_release_valid_0 = state == 4'h5;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg _GEN_0;
		_GEN_0 = io_req_ready_0 & io_req_valid;
		if (reset)
			state <= 4'h0;
		else begin : sv2v_autoblock_2
			reg [63:0] _GEN_1;
			_GEN_1 = {state, state, state, state, state, 4'h0, (io_meta_write_ready & io_meta_write_valid_0 ? 4'ha : state), (io_wb_req_ready ? 4'h9 : state), (io_wb_req_ready & io_wb_req_valid_0 ? 4'h8 : state), (io_rep_ready ? (|way_en ? 4'h9 : 4'h0) : state), (io_lsu_release_ready & io_lsu_release_valid_0 ? 4'h6 : state), 2'h1, |way_en & (_r_T_57 | (~((_r_T_53 | _r_T_49) | _r_T_45) & (_r_T_41 | (~((_r_T_37 | _r_T_33) | _r_T_29) & _r_T_26)))), 1'h1, (io_mshr_rdy & io_wb_rdy ? 4'h4 : 4'h1), 4'h3, (io_meta_read_ready & io_meta_read_valid_0 ? 4'h2 : state), (_GEN_0 ? 4'h1 : state)};
			state <= _GEN_1[state * 4+:4];
		end
		if (io_req_ready_0 & _GEN_0) begin
			req_param <= io_req_bits_param;
			req_size <= io_req_bits_size;
			req_source <= io_req_bits_source;
			req_address <= io_req_bits_address;
		end
		if (((io_req_ready_0 | io_meta_read_valid_0) | (state == 4'h2)) | (state != 4'h3))
			;
		else begin
			way_en <= io_way_en;
			old_coh_state <= io_block_state_state;
		end
	end
	assign io_req_ready = io_req_ready_0;
	assign io_rep_valid = io_rep_valid_0;
	assign io_rep_bits_param = report_param;
	assign io_rep_bits_size = req_size;
	assign io_rep_bits_source = req_source;
	assign io_rep_bits_address = req_address;
	assign io_meta_read_valid = io_meta_read_valid_0;
	assign io_meta_read_bits_idx = req_address[11:6];
	assign io_meta_read_bits_tag = req_address[31:12];
	assign io_meta_write_valid = io_meta_write_valid_0;
	assign io_meta_write_bits_idx = req_address[11:6];
	assign io_meta_write_bits_way_en = way_en;
	assign io_meta_write_bits_data_coh_state = (_GEN ? 2'h2 : (_r_T_49 ? 2'h1 : (_r_T_45 ? 2'h0 : {1'h0, (_r_T_41 | _r_T_37) | _r_T_33})));
	assign io_meta_write_bits_data_tag = req_address[31:12];
	assign io_wb_req_valid = io_wb_req_valid_0;
	assign io_wb_req_bits_tag = req_address[31:12];
	assign io_wb_req_bits_idx = req_address[11:6];
	assign io_wb_req_bits_source = req_source;
	assign io_wb_req_bits_param = report_param;
	assign io_wb_req_bits_way_en = way_en;
	assign io_mshr_wb_rdy = ~((((io_rep_valid_0 | io_wb_req_valid_0) | (state == 4'h8)) | io_meta_write_valid_0) | (state == 4'ha));
	assign io_lsu_release_valid = io_lsu_release_valid_0;
	assign io_lsu_release_bits_address = req_address;
	assign io_state_valid = |state;
	assign io_state_bits = {8'h00, req_address};
endmodule
