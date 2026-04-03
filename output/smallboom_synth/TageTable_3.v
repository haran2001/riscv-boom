module TageTable_3 (
	clock,
	reset,
	io_f1_req_valid,
	io_f1_req_pc,
	io_f1_req_ghist,
	io_f2_resp_0_valid,
	io_f2_resp_0_bits_ctr,
	io_f2_resp_0_bits_u,
	io_f2_resp_1_valid,
	io_f2_resp_1_bits_ctr,
	io_f2_resp_1_bits_u,
	io_f2_resp_2_valid,
	io_f2_resp_2_bits_ctr,
	io_f2_resp_2_bits_u,
	io_f2_resp_3_valid,
	io_f2_resp_3_bits_ctr,
	io_f2_resp_3_bits_u,
	io_update_mask_0,
	io_update_mask_1,
	io_update_mask_2,
	io_update_mask_3,
	io_update_taken_0,
	io_update_taken_1,
	io_update_taken_2,
	io_update_taken_3,
	io_update_alloc_0,
	io_update_alloc_1,
	io_update_alloc_2,
	io_update_alloc_3,
	io_update_old_ctr_0,
	io_update_old_ctr_1,
	io_update_old_ctr_2,
	io_update_old_ctr_3,
	io_update_pc,
	io_update_hist,
	io_update_u_mask_0,
	io_update_u_mask_1,
	io_update_u_mask_2,
	io_update_u_mask_3,
	io_update_u_0,
	io_update_u_1,
	io_update_u_2,
	io_update_u_3
);
	input clock;
	input reset;
	input io_f1_req_valid;
	input [39:0] io_f1_req_pc;
	input [63:0] io_f1_req_ghist;
	output wire io_f2_resp_0_valid;
	output wire [2:0] io_f2_resp_0_bits_ctr;
	output wire [1:0] io_f2_resp_0_bits_u;
	output wire io_f2_resp_1_valid;
	output wire [2:0] io_f2_resp_1_bits_ctr;
	output wire [1:0] io_f2_resp_1_bits_u;
	output wire io_f2_resp_2_valid;
	output wire [2:0] io_f2_resp_2_bits_ctr;
	output wire [1:0] io_f2_resp_2_bits_u;
	output wire io_f2_resp_3_valid;
	output wire [2:0] io_f2_resp_3_bits_ctr;
	output wire [1:0] io_f2_resp_3_bits_u;
	input io_update_mask_0;
	input io_update_mask_1;
	input io_update_mask_2;
	input io_update_mask_3;
	input io_update_taken_0;
	input io_update_taken_1;
	input io_update_taken_2;
	input io_update_taken_3;
	input io_update_alloc_0;
	input io_update_alloc_1;
	input io_update_alloc_2;
	input io_update_alloc_3;
	input [2:0] io_update_old_ctr_0;
	input [2:0] io_update_old_ctr_1;
	input [2:0] io_update_old_ctr_2;
	input [2:0] io_update_old_ctr_3;
	input [39:0] io_update_pc;
	input [63:0] io_update_hist;
	input io_update_u_mask_0;
	input io_update_u_mask_1;
	input io_update_u_mask_2;
	input io_update_u_mask_3;
	input [1:0] io_update_u_0;
	input [1:0] io_update_u_1;
	input [1:0] io_update_u_2;
	input [1:0] io_update_u_3;
	wire [2:0] update_wdata_3_ctr;
	wire [2:0] update_wdata_2_ctr;
	wire [2:0] update_wdata_1_ctr;
	wire [2:0] update_wdata_0_ctr;
	wire wdata_1_7;
	wire wdata_1_6;
	wire wdata_1_5;
	wire wdata_1_4;
	wire wdata_1_3;
	wire wdata_1_2;
	wire wdata_1_1;
	wire wdata_1_0;
	wire [11:0] wdata_3;
	wire [11:0] wdata_2;
	wire [11:0] wdata_1;
	wire [11:0] wdata_0;
	wire s2_req_rtage_3_valid;
	wire [7:0] s2_req_rtage_3_tag;
	wire s2_req_rtage_2_valid;
	wire [7:0] s2_req_rtage_2_tag;
	wire s2_req_rtage_1_valid;
	wire [7:0] s2_req_rtage_1_tag;
	wire s2_req_rtage_0_valid;
	wire [7:0] s2_req_rtage_0_tag;
	wire [47:0] _tage_table_16_ext_R0_data;
	wire [7:0] _tage_u_16_ext_R0_data;
	reg doing_reset;
	reg [7:0] reset_idx;
	wire [7:0] s1_hashed_idx = (io_f1_req_pc[10:3] ^ io_f1_req_ghist[7:0]) ^ io_f1_req_ghist[15:8];
	reg [7:0] s2_tag;
	reg [19:0] clear_u_ctr;
	wire doing_clear_u = clear_u_ctr[10:0] == 11'h000;
	wire [7:0] update_idx = (io_update_pc[10:3] ^ io_update_hist[7:0]) ^ io_update_hist[15:8];
	wire [7:0] update_tag = (io_update_pc[18:11] ^ io_update_hist[7:0]) ^ io_update_hist[15:8];
	wire _wen_T = io_update_mask_0 | io_update_mask_1;
	assign s2_req_rtage_0_tag = _tage_table_16_ext_R0_data[10:3];
	assign s2_req_rtage_0_valid = _tage_table_16_ext_R0_data[11];
	assign s2_req_rtage_1_tag = _tage_table_16_ext_R0_data[22:15];
	assign s2_req_rtage_1_valid = _tage_table_16_ext_R0_data[23];
	assign s2_req_rtage_2_tag = _tage_table_16_ext_R0_data[34:27];
	assign s2_req_rtage_2_valid = _tage_table_16_ext_R0_data[35];
	assign s2_req_rtage_3_tag = _tage_table_16_ext_R0_data[46:39];
	assign s2_req_rtage_3_valid = _tage_table_16_ext_R0_data[47];
	assign wdata_0 = (doing_reset ? 12'h000 : {1'h1, update_tag, update_wdata_0_ctr});
	assign wdata_1 = (doing_reset ? 12'h000 : {1'h1, update_tag, update_wdata_1_ctr});
	assign wdata_2 = (doing_reset ? 12'h000 : {1'h1, update_tag, update_wdata_2_ctr});
	assign wdata_3 = (doing_reset ? 12'h000 : {1'h1, update_tag, update_wdata_3_ctr});
	wire _wdata_T_4 = doing_reset | doing_clear_u;
	assign wdata_1_0 = ~_wdata_T_4 & io_update_u_0[0];
	assign wdata_1_1 = ~_wdata_T_4 & io_update_u_0[1];
	assign wdata_1_2 = ~_wdata_T_4 & io_update_u_1[0];
	assign wdata_1_3 = ~_wdata_T_4 & io_update_u_1[1];
	assign wdata_1_4 = ~_wdata_T_4 & io_update_u_2[0];
	assign wdata_1_5 = ~_wdata_T_4 & io_update_u_2[1];
	assign wdata_1_6 = ~_wdata_T_4 & io_update_u_3[0];
	assign wdata_1_7 = ~_wdata_T_4 & io_update_u_3[1];
	reg [7:0] wrbypass_tags_0;
	reg [7:0] wrbypass_tags_1;
	reg [7:0] wrbypass_idxs_0;
	reg [7:0] wrbypass_idxs_1;
	reg [2:0] wrbypass_0_0;
	reg [2:0] wrbypass_0_1;
	reg [2:0] wrbypass_0_2;
	reg [2:0] wrbypass_0_3;
	reg [2:0] wrbypass_1_0;
	reg [2:0] wrbypass_1_1;
	reg [2:0] wrbypass_1_2;
	reg [2:0] wrbypass_1_3;
	reg wrbypass_enq_idx;
	wire wrbypass_hits_0 = (~doing_reset & (wrbypass_tags_0 == update_tag)) & (wrbypass_idxs_0 == update_idx);
	wire wrbypass_hit = wrbypass_hits_0 | ((~doing_reset & (wrbypass_tags_1 == update_tag)) & (wrbypass_idxs_1 == update_idx));
	wire [2:0] _update_wdata_0_ctr_T = (io_update_taken_0 ? 3'h4 : 3'h3);
	wire [2:0] _GEN = (wrbypass_hits_0 ? wrbypass_0_0 : wrbypass_1_0);
	wire [2:0] _GEN_0 = (wrbypass_hits_0 ? wrbypass_0_1 : wrbypass_1_1);
	wire [2:0] _GEN_1 = (wrbypass_hits_0 ? wrbypass_0_2 : wrbypass_1_2);
	wire [2:0] _GEN_2 = (wrbypass_hits_0 ? wrbypass_0_3 : wrbypass_1_3);
	wire _update_wdata_0_ctr_T_2 = _GEN == 3'h0;
	wire [2:0] _update_wdata_0_ctr_T_3 = _GEN - 3'h1;
	wire [2:0] _update_wdata_0_ctr_T_7 = _GEN + 3'h1;
	wire [2:0] _update_wdata_0_ctr_T_20 = (io_update_taken_0 ? (&io_update_old_ctr_0 ? 3'h7 : io_update_old_ctr_0 + 3'h1) : (io_update_old_ctr_0 == 3'h0 ? 3'h0 : io_update_old_ctr_0 - 3'h1));
	assign update_wdata_0_ctr = (io_update_alloc_0 ? _update_wdata_0_ctr_T : (wrbypass_hit ? (io_update_taken_0 ? (&_GEN ? 3'h7 : _update_wdata_0_ctr_T_7) : (_update_wdata_0_ctr_T_2 ? 3'h0 : _update_wdata_0_ctr_T_3)) : _update_wdata_0_ctr_T_20));
	wire [2:0] _update_wdata_1_ctr_T = (io_update_taken_1 ? 3'h4 : 3'h3);
	wire _update_wdata_1_ctr_T_2 = _GEN_0 == 3'h0;
	wire [2:0] _update_wdata_1_ctr_T_3 = _GEN_0 - 3'h1;
	wire [2:0] _update_wdata_1_ctr_T_7 = _GEN_0 + 3'h1;
	wire [2:0] _update_wdata_1_ctr_T_20 = (io_update_taken_1 ? (&io_update_old_ctr_1 ? 3'h7 : io_update_old_ctr_1 + 3'h1) : (io_update_old_ctr_1 == 3'h0 ? 3'h0 : io_update_old_ctr_1 - 3'h1));
	assign update_wdata_1_ctr = (io_update_alloc_1 ? _update_wdata_1_ctr_T : (wrbypass_hit ? (io_update_taken_1 ? (&_GEN_0 ? 3'h7 : _update_wdata_1_ctr_T_7) : (_update_wdata_1_ctr_T_2 ? 3'h0 : _update_wdata_1_ctr_T_3)) : _update_wdata_1_ctr_T_20));
	wire [2:0] _update_wdata_2_ctr_T = (io_update_taken_2 ? 3'h4 : 3'h3);
	wire _update_wdata_2_ctr_T_2 = _GEN_1 == 3'h0;
	wire [2:0] _update_wdata_2_ctr_T_3 = _GEN_1 - 3'h1;
	wire [2:0] _update_wdata_2_ctr_T_7 = _GEN_1 + 3'h1;
	wire [2:0] _update_wdata_2_ctr_T_20 = (io_update_taken_2 ? (&io_update_old_ctr_2 ? 3'h7 : io_update_old_ctr_2 + 3'h1) : (io_update_old_ctr_2 == 3'h0 ? 3'h0 : io_update_old_ctr_2 - 3'h1));
	assign update_wdata_2_ctr = (io_update_alloc_2 ? _update_wdata_2_ctr_T : (wrbypass_hit ? (io_update_taken_2 ? (&_GEN_1 ? 3'h7 : _update_wdata_2_ctr_T_7) : (_update_wdata_2_ctr_T_2 ? 3'h0 : _update_wdata_2_ctr_T_3)) : _update_wdata_2_ctr_T_20));
	wire [2:0] _update_wdata_3_ctr_T = (io_update_taken_3 ? 3'h4 : 3'h3);
	wire _update_wdata_3_ctr_T_2 = _GEN_2 == 3'h0;
	wire [2:0] _update_wdata_3_ctr_T_3 = _GEN_2 - 3'h1;
	wire [2:0] _update_wdata_3_ctr_T_7 = _GEN_2 + 3'h1;
	wire [2:0] _update_wdata_3_ctr_T_20 = (io_update_taken_3 ? (&io_update_old_ctr_3 ? 3'h7 : io_update_old_ctr_3 + 3'h1) : (io_update_old_ctr_3 == 3'h0 ? 3'h0 : io_update_old_ctr_3 - 3'h1));
	assign update_wdata_3_ctr = (io_update_alloc_3 ? _update_wdata_3_ctr_T : (wrbypass_hit ? (io_update_taken_3 ? (&_GEN_2 ? 3'h7 : _update_wdata_3_ctr_T_7) : (_update_wdata_3_ctr_T_2 ? 3'h0 : _update_wdata_3_ctr_T_3)) : _update_wdata_3_ctr_T_20));
	always @(posedge clock) begin : sv2v_autoblock_1
		reg _GEN_3;
		reg _GEN_4;
		reg _GEN_5;
		_GEN_3 = (_wen_T | io_update_mask_2) | io_update_mask_3;
		_GEN_4 = (~_GEN_3 | wrbypass_hit) | wrbypass_enq_idx;
		_GEN_5 = (~_GEN_3 | wrbypass_hit) | ~wrbypass_enq_idx;
		if (reset) begin
			doing_reset <= 1'h1;
			reset_idx <= 8'h00;
			clear_u_ctr <= 20'h00000;
			wrbypass_enq_idx <= 1'h0;
		end
		else begin
			doing_reset <= (reset_idx != 8'hff) & doing_reset;
			reset_idx <= reset_idx + {7'h00, doing_reset};
			if (doing_reset)
				clear_u_ctr <= 20'h00001;
			else
				clear_u_ctr <= clear_u_ctr + 20'h00001;
			if (~_GEN_3 | wrbypass_hit)
				;
			else
				wrbypass_enq_idx <= wrbypass_enq_idx - 1'h1;
		end
		s2_tag <= (io_f1_req_pc[18:11] ^ io_f1_req_ghist[7:0]) ^ io_f1_req_ghist[15:8];
		if (_GEN_4)
			;
		else
			wrbypass_tags_0 <= update_tag;
		if (_GEN_5)
			;
		else
			wrbypass_tags_1 <= update_tag;
		if (_GEN_4)
			;
		else
			wrbypass_idxs_0 <= update_idx;
		if (_GEN_5)
			;
		else
			wrbypass_idxs_1 <= update_idx;
		if (_GEN_3) begin
			if (wrbypass_hit) begin
				if (wrbypass_hits_0) begin
					if (io_update_alloc_0)
						wrbypass_0_0 <= _update_wdata_0_ctr_T;
					else if (wrbypass_hit) begin
						if (io_update_taken_0) begin
							if (&_GEN)
								wrbypass_0_0 <= 3'h7;
							else
								wrbypass_0_0 <= _update_wdata_0_ctr_T_7;
						end
						else if (_update_wdata_0_ctr_T_2)
							wrbypass_0_0 <= 3'h0;
						else
							wrbypass_0_0 <= _update_wdata_0_ctr_T_3;
					end
					else
						wrbypass_0_0 <= _update_wdata_0_ctr_T_20;
					if (io_update_alloc_1)
						wrbypass_0_1 <= _update_wdata_1_ctr_T;
					else if (wrbypass_hit) begin
						if (io_update_taken_1) begin
							if (&_GEN_0)
								wrbypass_0_1 <= 3'h7;
							else
								wrbypass_0_1 <= _update_wdata_1_ctr_T_7;
						end
						else if (_update_wdata_1_ctr_T_2)
							wrbypass_0_1 <= 3'h0;
						else
							wrbypass_0_1 <= _update_wdata_1_ctr_T_3;
					end
					else
						wrbypass_0_1 <= _update_wdata_1_ctr_T_20;
					if (io_update_alloc_2)
						wrbypass_0_2 <= _update_wdata_2_ctr_T;
					else if (wrbypass_hit) begin
						if (io_update_taken_2) begin
							if (&_GEN_1)
								wrbypass_0_2 <= 3'h7;
							else
								wrbypass_0_2 <= _update_wdata_2_ctr_T_7;
						end
						else if (_update_wdata_2_ctr_T_2)
							wrbypass_0_2 <= 3'h0;
						else
							wrbypass_0_2 <= _update_wdata_2_ctr_T_3;
					end
					else
						wrbypass_0_2 <= _update_wdata_2_ctr_T_20;
					if (io_update_alloc_3)
						wrbypass_0_3 <= _update_wdata_3_ctr_T;
					else if (wrbypass_hit) begin
						if (io_update_taken_3) begin
							if (&_GEN_2)
								wrbypass_0_3 <= 3'h7;
							else
								wrbypass_0_3 <= _update_wdata_3_ctr_T_7;
						end
						else if (_update_wdata_3_ctr_T_2)
							wrbypass_0_3 <= 3'h0;
						else
							wrbypass_0_3 <= _update_wdata_3_ctr_T_3;
					end
					else
						wrbypass_0_3 <= _update_wdata_3_ctr_T_20;
				end
				else begin
					if (io_update_alloc_0)
						wrbypass_1_0 <= _update_wdata_0_ctr_T;
					else if (wrbypass_hit) begin
						if (io_update_taken_0) begin
							if (&_GEN)
								wrbypass_1_0 <= 3'h7;
							else
								wrbypass_1_0 <= _update_wdata_0_ctr_T_7;
						end
						else if (_update_wdata_0_ctr_T_2)
							wrbypass_1_0 <= 3'h0;
						else
							wrbypass_1_0 <= _update_wdata_0_ctr_T_3;
					end
					else
						wrbypass_1_0 <= _update_wdata_0_ctr_T_20;
					if (io_update_alloc_1)
						wrbypass_1_1 <= _update_wdata_1_ctr_T;
					else if (wrbypass_hit) begin
						if (io_update_taken_1) begin
							if (&_GEN_0)
								wrbypass_1_1 <= 3'h7;
							else
								wrbypass_1_1 <= _update_wdata_1_ctr_T_7;
						end
						else if (_update_wdata_1_ctr_T_2)
							wrbypass_1_1 <= 3'h0;
						else
							wrbypass_1_1 <= _update_wdata_1_ctr_T_3;
					end
					else
						wrbypass_1_1 <= _update_wdata_1_ctr_T_20;
					if (io_update_alloc_2)
						wrbypass_1_2 <= _update_wdata_2_ctr_T;
					else if (wrbypass_hit) begin
						if (io_update_taken_2) begin
							if (&_GEN_1)
								wrbypass_1_2 <= 3'h7;
							else
								wrbypass_1_2 <= _update_wdata_2_ctr_T_7;
						end
						else if (_update_wdata_2_ctr_T_2)
							wrbypass_1_2 <= 3'h0;
						else
							wrbypass_1_2 <= _update_wdata_2_ctr_T_3;
					end
					else
						wrbypass_1_2 <= _update_wdata_2_ctr_T_20;
					if (io_update_alloc_3)
						wrbypass_1_3 <= _update_wdata_3_ctr_T;
					else if (wrbypass_hit) begin
						if (io_update_taken_3) begin
							if (&_GEN_2)
								wrbypass_1_3 <= 3'h7;
							else
								wrbypass_1_3 <= _update_wdata_3_ctr_T_7;
						end
						else if (_update_wdata_3_ctr_T_2)
							wrbypass_1_3 <= 3'h0;
						else
							wrbypass_1_3 <= _update_wdata_3_ctr_T_3;
					end
					else
						wrbypass_1_3 <= _update_wdata_3_ctr_T_20;
				end
			end
			else if (wrbypass_enq_idx) begin
				if (io_update_alloc_0)
					wrbypass_1_0 <= _update_wdata_0_ctr_T;
				else if (wrbypass_hit) begin
					if (io_update_taken_0) begin
						if (&_GEN)
							wrbypass_1_0 <= 3'h7;
						else
							wrbypass_1_0 <= _update_wdata_0_ctr_T_7;
					end
					else if (_update_wdata_0_ctr_T_2)
						wrbypass_1_0 <= 3'h0;
					else
						wrbypass_1_0 <= _update_wdata_0_ctr_T_3;
				end
				else
					wrbypass_1_0 <= _update_wdata_0_ctr_T_20;
				if (io_update_alloc_1)
					wrbypass_1_1 <= _update_wdata_1_ctr_T;
				else if (wrbypass_hit) begin
					if (io_update_taken_1) begin
						if (&_GEN_0)
							wrbypass_1_1 <= 3'h7;
						else
							wrbypass_1_1 <= _update_wdata_1_ctr_T_7;
					end
					else if (_update_wdata_1_ctr_T_2)
						wrbypass_1_1 <= 3'h0;
					else
						wrbypass_1_1 <= _update_wdata_1_ctr_T_3;
				end
				else
					wrbypass_1_1 <= _update_wdata_1_ctr_T_20;
				if (io_update_alloc_2)
					wrbypass_1_2 <= _update_wdata_2_ctr_T;
				else if (wrbypass_hit) begin
					if (io_update_taken_2) begin
						if (&_GEN_1)
							wrbypass_1_2 <= 3'h7;
						else
							wrbypass_1_2 <= _update_wdata_2_ctr_T_7;
					end
					else if (_update_wdata_2_ctr_T_2)
						wrbypass_1_2 <= 3'h0;
					else
						wrbypass_1_2 <= _update_wdata_2_ctr_T_3;
				end
				else
					wrbypass_1_2 <= _update_wdata_2_ctr_T_20;
				if (io_update_alloc_3)
					wrbypass_1_3 <= _update_wdata_3_ctr_T;
				else if (wrbypass_hit) begin
					if (io_update_taken_3) begin
						if (&_GEN_2)
							wrbypass_1_3 <= 3'h7;
						else
							wrbypass_1_3 <= _update_wdata_3_ctr_T_7;
					end
					else if (_update_wdata_3_ctr_T_2)
						wrbypass_1_3 <= 3'h0;
					else
						wrbypass_1_3 <= _update_wdata_3_ctr_T_3;
				end
				else
					wrbypass_1_3 <= _update_wdata_3_ctr_T_20;
			end
			else begin
				if (io_update_alloc_0)
					wrbypass_0_0 <= _update_wdata_0_ctr_T;
				else if (wrbypass_hit) begin
					if (io_update_taken_0) begin
						if (&_GEN)
							wrbypass_0_0 <= 3'h7;
						else
							wrbypass_0_0 <= _update_wdata_0_ctr_T_7;
					end
					else if (_update_wdata_0_ctr_T_2)
						wrbypass_0_0 <= 3'h0;
					else
						wrbypass_0_0 <= _update_wdata_0_ctr_T_3;
				end
				else
					wrbypass_0_0 <= _update_wdata_0_ctr_T_20;
				if (io_update_alloc_1)
					wrbypass_0_1 <= _update_wdata_1_ctr_T;
				else if (wrbypass_hit) begin
					if (io_update_taken_1) begin
						if (&_GEN_0)
							wrbypass_0_1 <= 3'h7;
						else
							wrbypass_0_1 <= _update_wdata_1_ctr_T_7;
					end
					else if (_update_wdata_1_ctr_T_2)
						wrbypass_0_1 <= 3'h0;
					else
						wrbypass_0_1 <= _update_wdata_1_ctr_T_3;
				end
				else
					wrbypass_0_1 <= _update_wdata_1_ctr_T_20;
				if (io_update_alloc_2)
					wrbypass_0_2 <= _update_wdata_2_ctr_T;
				else if (wrbypass_hit) begin
					if (io_update_taken_2) begin
						if (&_GEN_1)
							wrbypass_0_2 <= 3'h7;
						else
							wrbypass_0_2 <= _update_wdata_2_ctr_T_7;
					end
					else if (_update_wdata_2_ctr_T_2)
						wrbypass_0_2 <= 3'h0;
					else
						wrbypass_0_2 <= _update_wdata_2_ctr_T_3;
				end
				else
					wrbypass_0_2 <= _update_wdata_2_ctr_T_20;
				if (io_update_alloc_3)
					wrbypass_0_3 <= _update_wdata_3_ctr_T;
				else if (wrbypass_hit) begin
					if (io_update_taken_3) begin
						if (&_GEN_2)
							wrbypass_0_3 <= 3'h7;
						else
							wrbypass_0_3 <= _update_wdata_3_ctr_T_7;
					end
					else if (_update_wdata_3_ctr_T_2)
						wrbypass_0_3 <= 3'h0;
					else
						wrbypass_0_3 <= _update_wdata_3_ctr_T_3;
				end
				else
					wrbypass_0_3 <= _update_wdata_3_ctr_T_20;
			end
		end
	end
	tage_u_256x8 tage_u_16_ext(
		.R0_addr(s1_hashed_idx),
		.R0_en(io_f1_req_valid),
		.R0_clk(clock),
		.R0_data(_tage_u_16_ext_R0_data),
		.W0_addr((doing_reset ? reset_idx : (doing_clear_u ? clear_u_ctr[18:11] : update_idx))),
		.W0_en((((_wdata_T_4 | io_update_u_mask_0) | io_update_u_mask_1) | io_update_u_mask_2) | io_update_u_mask_3),
		.W0_clk(clock),
		.W0_data({wdata_1_7, wdata_1_6, wdata_1_5, wdata_1_4, wdata_1_3, wdata_1_2, wdata_1_1, wdata_1_0}),
		.W0_mask((doing_reset ? 8'hff : (doing_clear_u ? {clear_u_ctr[19], ~clear_u_ctr[19], clear_u_ctr[19], ~clear_u_ctr[19], clear_u_ctr[19], ~clear_u_ctr[19], clear_u_ctr[19], ~clear_u_ctr[19]} : {{2 {io_update_u_mask_3}}, {2 {io_update_u_mask_2}}, {2 {io_update_u_mask_1}}, {2 {io_update_u_mask_0}}})))
	);
	tage_table_256x48 tage_table_16_ext(
		.R0_addr(s1_hashed_idx),
		.R0_en(io_f1_req_valid),
		.R0_clk(clock),
		.R0_data(_tage_table_16_ext_R0_data),
		.W0_addr((doing_reset ? reset_idx : update_idx)),
		.W0_en(((doing_reset | _wen_T) | io_update_mask_2) | io_update_mask_3),
		.W0_clk(clock),
		.W0_data({wdata_3, wdata_2, wdata_1, wdata_0}),
		.W0_mask((doing_reset ? 4'hf : {io_update_mask_3, io_update_mask_2, io_update_mask_1, io_update_mask_0}))
	);
	assign io_f2_resp_0_valid = (s2_req_rtage_0_valid & (s2_req_rtage_0_tag == s2_tag)) & ~doing_reset;
	assign io_f2_resp_0_bits_ctr = _tage_table_16_ext_R0_data[2:0];
	assign io_f2_resp_0_bits_u = _tage_u_16_ext_R0_data[1:0];
	assign io_f2_resp_1_valid = (s2_req_rtage_1_valid & (s2_req_rtage_1_tag == s2_tag)) & ~doing_reset;
	assign io_f2_resp_1_bits_ctr = _tage_table_16_ext_R0_data[14:12];
	assign io_f2_resp_1_bits_u = _tage_u_16_ext_R0_data[3:2];
	assign io_f2_resp_2_valid = (s2_req_rtage_2_valid & (s2_req_rtage_2_tag == s2_tag)) & ~doing_reset;
	assign io_f2_resp_2_bits_ctr = _tage_table_16_ext_R0_data[26:24];
	assign io_f2_resp_2_bits_u = _tage_u_16_ext_R0_data[5:4];
	assign io_f2_resp_3_valid = (s2_req_rtage_3_valid & (s2_req_rtage_3_tag == s2_tag)) & ~doing_reset;
	assign io_f2_resp_3_bits_ctr = _tage_table_16_ext_R0_data[38:36];
	assign io_f2_resp_3_bits_u = _tage_u_16_ext_R0_data[7:6];
endmodule
