module BoomWritebackUnit (
	clock,
	reset,
	io_req_ready,
	io_req_valid,
	io_req_bits_tag,
	io_req_bits_idx,
	io_req_bits_source,
	io_req_bits_param,
	io_req_bits_way_en,
	io_req_bits_voluntary,
	io_meta_read_ready,
	io_meta_read_valid,
	io_meta_read_bits_idx,
	io_meta_read_bits_tag,
	io_resp,
	io_idx_valid,
	io_idx_bits,
	io_data_req_ready,
	io_data_req_valid,
	io_data_req_bits_way_en,
	io_data_req_bits_addr,
	io_data_resp,
	io_mem_grant,
	io_release_ready,
	io_release_valid,
	io_release_bits_opcode,
	io_release_bits_param,
	io_release_bits_source,
	io_release_bits_address,
	io_release_bits_data,
	io_lsu_release_ready,
	io_lsu_release_valid,
	io_lsu_release_bits_address
);
	input clock;
	input reset;
	output wire io_req_ready;
	input io_req_valid;
	input [19:0] io_req_bits_tag;
	input [5:0] io_req_bits_idx;
	input [1:0] io_req_bits_source;
	input [2:0] io_req_bits_param;
	input [3:0] io_req_bits_way_en;
	input io_req_bits_voluntary;
	input io_meta_read_ready;
	output wire io_meta_read_valid;
	output wire [5:0] io_meta_read_bits_idx;
	output wire [19:0] io_meta_read_bits_tag;
	output wire io_resp;
	output wire io_idx_valid;
	output wire [5:0] io_idx_bits;
	input io_data_req_ready;
	output wire io_data_req_valid;
	output wire [3:0] io_data_req_bits_way_en;
	output wire [11:0] io_data_req_bits_addr;
	input [63:0] io_data_resp;
	input io_mem_grant;
	input io_release_ready;
	output wire io_release_valid;
	output wire [2:0] io_release_bits_opcode;
	output wire [2:0] io_release_bits_param;
	output wire [1:0] io_release_bits_source;
	output wire [31:0] io_release_bits_address;
	output wire [63:0] io_release_bits_data;
	input io_lsu_release_ready;
	output wire io_lsu_release_valid;
	output wire [31:0] io_lsu_release_bits_address;
	reg [19:0] req_tag;
	reg [5:0] req_idx;
	reg [1:0] req_source;
	reg [2:0] req_param;
	reg [3:0] req_way_en;
	reg req_voluntary;
	reg [2:0] state;
	reg r1_data_req_fired;
	reg r2_data_req_fired;
	reg [3:0] r1_data_req_cnt;
	reg [3:0] r2_data_req_cnt;
	reg [3:0] data_req_cnt;
	reg [63:0] wb_buffer_0;
	reg [63:0] wb_buffer_1;
	reg [63:0] wb_buffer_2;
	reg [63:0] wb_buffer_3;
	reg [63:0] wb_buffer_4;
	reg [63:0] wb_buffer_5;
	reg [63:0] wb_buffer_6;
	reg [63:0] wb_buffer_7;
	reg acked;
	wire [31:0] r_address = {req_tag, req_idx, 6'h00};
	wire [511:0] _GEN = {wb_buffer_7, wb_buffer_6, wb_buffer_5, wb_buffer_4, wb_buffer_3, wb_buffer_2, wb_buffer_1, wb_buffer_0};
	wire io_req_ready_0 = state == 3'h0;
	wire _GEN_0 = state == 3'h1;
	wire io_data_req_valid_0 = (~io_req_ready_0 & _GEN_0) & ~data_req_cnt[3];
	wire _GEN_1 = r2_data_req_cnt == 4'h7;
	wire _GEN_2 = state == 3'h2;
	wire io_lsu_release_valid_0 = ~(io_req_ready_0 | _GEN_0) & _GEN_2;
	wire _GEN_3 = state == 3'h3;
	wire _GEN_4 = _GEN_0 | _GEN_2;
	wire io_release_valid_0 = (~(io_req_ready_0 | _GEN_4) & _GEN_3) & ~data_req_cnt[3];
	always @(posedge clock) begin : sv2v_autoblock_1
		reg _GEN_5;
		reg _GEN_6;
		reg _GEN_7;
		_GEN_5 = io_req_ready_0 & io_req_valid;
		_GEN_6 = io_req_ready_0 | ~_GEN_0;
		_GEN_7 = (io_data_req_ready & io_data_req_valid_0) & io_meta_read_ready;
		if (io_req_ready_0 & _GEN_5) begin
			req_tag <= io_req_bits_tag;
			req_idx <= io_req_bits_idx;
			req_source <= io_req_bits_source;
			req_param <= io_req_bits_param;
			req_way_en <= io_req_bits_way_en;
			req_voluntary <= io_req_bits_voluntary;
		end
		if (_GEN_6)
			;
		else begin
			r1_data_req_cnt <= (_GEN_7 ? data_req_cnt : 4'h0);
			r2_data_req_cnt <= r1_data_req_cnt;
		end
		if (io_req_ready_0 | ~((_GEN_0 & r2_data_req_fired) & (r2_data_req_cnt[2:0] == 3'h0)))
			;
		else
			wb_buffer_0 <= io_data_resp;
		if (io_req_ready_0 | ~((_GEN_0 & r2_data_req_fired) & (r2_data_req_cnt[2:0] == 3'h1)))
			;
		else
			wb_buffer_1 <= io_data_resp;
		if (io_req_ready_0 | ~((_GEN_0 & r2_data_req_fired) & (r2_data_req_cnt[2:0] == 3'h2)))
			;
		else
			wb_buffer_2 <= io_data_resp;
		if (io_req_ready_0 | ~((_GEN_0 & r2_data_req_fired) & (r2_data_req_cnt[2:0] == 3'h3)))
			;
		else
			wb_buffer_3 <= io_data_resp;
		if (io_req_ready_0 | ~((_GEN_0 & r2_data_req_fired) & (r2_data_req_cnt[2:0] == 3'h4)))
			;
		else
			wb_buffer_4 <= io_data_resp;
		if (io_req_ready_0 | ~((_GEN_0 & r2_data_req_fired) & (r2_data_req_cnt[2:0] == 3'h5)))
			;
		else
			wb_buffer_5 <= io_data_resp;
		if (io_req_ready_0 | ~((_GEN_0 & r2_data_req_fired) & (r2_data_req_cnt[2:0] == 3'h6)))
			;
		else
			wb_buffer_6 <= io_data_resp;
		if (io_req_ready_0 | ~((_GEN_0 & r2_data_req_fired) & (&r2_data_req_cnt[2:0])))
			;
		else
			wb_buffer_7 <= io_data_resp;
		if (reset) begin
			state <= 3'h0;
			r1_data_req_fired <= 1'h0;
			r2_data_req_fired <= 1'h0;
			data_req_cnt <= 4'h0;
			acked <= 1'h0;
		end
		else begin
			if (io_req_ready_0) begin
				if (_GEN_5) begin
					state <= 3'h1;
					data_req_cnt <= 4'h0;
				end
				acked <= ~_GEN_5 & acked;
			end
			else begin : sv2v_autoblock_2
				reg _GEN_8;
				_GEN_8 = state == 3'h4;
				if (_GEN_0) begin
					if (r2_data_req_fired & _GEN_1) begin
						state <= 3'h2;
						data_req_cnt <= 4'h0;
					end
					else if (_GEN_7)
						data_req_cnt <= data_req_cnt + 4'h1;
				end
				else begin : sv2v_autoblock_3
					reg _GEN_9;
					_GEN_9 = io_release_ready & io_release_valid_0;
					if (_GEN_2) begin
						if (io_lsu_release_ready & io_lsu_release_valid_0)
							state <= 3'h3;
					end
					else if (_GEN_3) begin
						if ((data_req_cnt == 4'h7) & _GEN_9)
							state <= {req_voluntary, 2'h0};
					end
					else if (_GEN_8 & acked)
						state <= 3'h0;
					if (_GEN_2 | ~(_GEN_3 & _GEN_9))
						;
					else
						data_req_cnt <= data_req_cnt + 4'h1;
				end
				if (~_GEN_4) begin
					if (_GEN_3)
						acked <= io_mem_grant | acked;
					else
						acked <= (_GEN_8 & io_mem_grant) | acked;
				end
			end
			if (_GEN_6)
				;
			else begin
				r1_data_req_fired <= _GEN_7;
				r2_data_req_fired <= r1_data_req_fired;
			end
		end
	end
	assign io_req_ready = io_req_ready_0;
	assign io_meta_read_valid = io_data_req_valid_0;
	assign io_meta_read_bits_idx = req_idx;
	assign io_meta_read_bits_tag = req_tag;
	assign io_resp = ((~io_req_ready_0 & _GEN_0) & r2_data_req_fired) & _GEN_1;
	assign io_idx_valid = |state;
	assign io_idx_bits = req_idx;
	assign io_data_req_valid = io_data_req_valid_0;
	assign io_data_req_bits_way_en = req_way_en;
	assign io_data_req_bits_addr = {req_idx, data_req_cnt[2:0], 3'h0};
	assign io_release_valid = io_release_valid_0;
	assign io_release_bits_opcode = {1'h1, req_voluntary, 1'h1};
	assign io_release_bits_param = req_param;
	assign io_release_bits_source = (req_voluntary ? 2'h2 : req_source);
	assign io_release_bits_address = r_address;
	assign io_release_bits_data = _GEN[data_req_cnt[2:0] * 64+:64];
	assign io_lsu_release_valid = io_lsu_release_valid_0;
	assign io_lsu_release_bits_address = r_address;
endmodule
