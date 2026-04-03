module L1MetadataArray (
	clock,
	reset,
	io_read_ready,
	io_read_valid,
	io_read_bits_idx,
	io_write_ready,
	io_write_valid,
	io_write_bits_idx,
	io_write_bits_way_en,
	io_write_bits_data_coh_state,
	io_write_bits_data_tag,
	io_resp_0_coh_state,
	io_resp_0_tag,
	io_resp_1_coh_state,
	io_resp_1_tag,
	io_resp_2_coh_state,
	io_resp_2_tag,
	io_resp_3_coh_state,
	io_resp_3_tag
);
	input clock;
	input reset;
	output wire io_read_ready;
	input io_read_valid;
	input [5:0] io_read_bits_idx;
	output wire io_write_ready;
	input io_write_valid;
	input [5:0] io_write_bits_idx;
	input [3:0] io_write_bits_way_en;
	input [1:0] io_write_bits_data_coh_state;
	input [19:0] io_write_bits_data_tag;
	output wire [1:0] io_resp_0_coh_state;
	output wire [19:0] io_resp_0_tag;
	output wire [1:0] io_resp_1_coh_state;
	output wire [19:0] io_resp_1_tag;
	output wire [1:0] io_resp_2_coh_state;
	output wire [19:0] io_resp_2_tag;
	output wire [1:0] io_resp_3_coh_state;
	output wire [19:0] io_resp_3_tag;
	wire tag_array_MPORT_1_en;
	wire wen;
	wire [87:0] _tag_array_ext_RW0_rdata;
	reg [6:0] rst_cnt;
	wire [1:0] _wdata_T_coh_state = (rst_cnt[6] ? io_write_bits_data_coh_state : 2'h0);
	wire [19:0] _wdata_T_tag = (rst_cnt[6] ? io_write_bits_data_tag : 20'h00000);
	assign wen = ~rst_cnt[6] | io_write_valid;
	assign tag_array_MPORT_1_en = ~wen & io_read_valid;
	always @(posedge clock)
		if (reset)
			rst_cnt <= 7'h00;
		else if (rst_cnt[6])
			;
		else
			rst_cnt <= rst_cnt + 7'h01;
	tag_array_64x88 tag_array_ext(
		.RW0_addr((wen ? (rst_cnt[6] ? io_write_bits_idx : rst_cnt[5:0]) : io_read_bits_idx)),
		.RW0_en(tag_array_MPORT_1_en | wen),
		.RW0_clk(clock),
		.RW0_wmode(wen),
		.RW0_wdata({_wdata_T_coh_state, _wdata_T_tag, _wdata_T_coh_state, _wdata_T_tag, _wdata_T_coh_state, _wdata_T_tag, _wdata_T_coh_state, _wdata_T_tag}),
		.RW0_rdata(_tag_array_ext_RW0_rdata),
		.RW0_wmask((rst_cnt[6] ? io_write_bits_way_en : 4'hf))
	);
	assign io_read_ready = ~wen;
	assign io_write_ready = rst_cnt[6];
	assign io_resp_0_coh_state = _tag_array_ext_RW0_rdata[21:20];
	assign io_resp_0_tag = _tag_array_ext_RW0_rdata[19:0];
	assign io_resp_1_coh_state = _tag_array_ext_RW0_rdata[43:42];
	assign io_resp_1_tag = _tag_array_ext_RW0_rdata[41:22];
	assign io_resp_2_coh_state = _tag_array_ext_RW0_rdata[65:64];
	assign io_resp_2_tag = _tag_array_ext_RW0_rdata[63:44];
	assign io_resp_3_coh_state = _tag_array_ext_RW0_rdata[87:86];
	assign io_resp_3_tag = _tag_array_ext_RW0_rdata[85:66];
endmodule
