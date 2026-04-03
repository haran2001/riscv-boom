module RenameBusyTable_1 (
	clock,
	reset,
	io_ren_uops_0_pdst,
	io_ren_uops_0_prs1,
	io_ren_uops_0_prs2,
	io_ren_uops_0_prs3,
	io_busy_resps_0_prs1_busy,
	io_busy_resps_0_prs2_busy,
	io_busy_resps_0_prs3_busy,
	io_rebusy_reqs_0,
	io_wakeups_0_valid,
	io_wakeups_0_bits_uop_pdst,
	io_wakeups_1_valid,
	io_wakeups_1_bits_uop_pdst
);
	input clock;
	input reset;
	input [5:0] io_ren_uops_0_pdst;
	input [5:0] io_ren_uops_0_prs1;
	input [5:0] io_ren_uops_0_prs2;
	input [5:0] io_ren_uops_0_prs3;
	output wire io_busy_resps_0_prs1_busy;
	output wire io_busy_resps_0_prs2_busy;
	output wire io_busy_resps_0_prs3_busy;
	input io_rebusy_reqs_0;
	input io_wakeups_0_valid;
	input [5:0] io_wakeups_0_bits_uop_pdst;
	input io_wakeups_1_valid;
	input [5:0] io_wakeups_1_bits_uop_pdst;
	reg wakeups_wu_valid_REG;
	reg [5:0] wakeups_wu_bits_REG_uop_pdst;
	reg wakeups_wu_valid_REG_2;
	reg [5:0] wakeups_wu_bits_REG_1_uop_pdst;
	reg [47:0] busy_table;
	wire [47:0] _io_busy_resps_0_prs1_busy_T = busy_table >> io_ren_uops_0_prs1;
	wire [47:0] _io_busy_resps_0_prs2_busy_T = busy_table >> io_ren_uops_0_prs2;
	wire [47:0] _io_busy_resps_0_prs3_busy_T = busy_table >> io_ren_uops_0_prs3;
	always @(posedge clock) begin
		wakeups_wu_valid_REG <= io_wakeups_0_valid;
		wakeups_wu_bits_REG_uop_pdst <= io_wakeups_0_bits_uop_pdst;
		wakeups_wu_valid_REG_2 <= io_wakeups_1_valid;
		wakeups_wu_bits_REG_1_uop_pdst <= io_wakeups_1_bits_uop_pdst;
		if (reset)
			busy_table <= 48'h000000000000;
		else begin : sv2v_autoblock_1
			reg [63:0] _busy_table_next_T;
			reg [63:0] _busy_table_next_T_8;
			reg [63:0] _busy_table_next_T_4;
			_busy_table_next_T = 64'h0000000000000001 << io_ren_uops_0_pdst;
			_busy_table_next_T_8 = 64'h0000000000000001 << wakeups_wu_bits_REG_1_uop_pdst;
			_busy_table_next_T_4 = 64'h0000000000000001 << wakeups_wu_bits_REG_uop_pdst;
			busy_table <= (~((_busy_table_next_T_4[47:0] & {48 {wakeups_wu_valid_REG}}) | (_busy_table_next_T_8[47:0] & {48 {wakeups_wu_valid_REG_2}})) & busy_table) | (_busy_table_next_T[47:0] & {48 {io_rebusy_reqs_0}});
		end
	end
	assign io_busy_resps_0_prs1_busy = ~((wakeups_wu_valid_REG & (wakeups_wu_bits_REG_uop_pdst == io_ren_uops_0_prs1)) | (wakeups_wu_valid_REG_2 & (wakeups_wu_bits_REG_1_uop_pdst == io_ren_uops_0_prs1))) & _io_busy_resps_0_prs1_busy_T[0];
	assign io_busy_resps_0_prs2_busy = ~((wakeups_wu_valid_REG & (wakeups_wu_bits_REG_uop_pdst == io_ren_uops_0_prs2)) | (wakeups_wu_valid_REG_2 & (wakeups_wu_bits_REG_1_uop_pdst == io_ren_uops_0_prs2))) & _io_busy_resps_0_prs2_busy_T[0];
	assign io_busy_resps_0_prs3_busy = ~((wakeups_wu_valid_REG & (wakeups_wu_bits_REG_uop_pdst == io_ren_uops_0_prs3)) | (wakeups_wu_valid_REG_2 & (wakeups_wu_bits_REG_1_uop_pdst == io_ren_uops_0_prs3))) & _io_busy_resps_0_prs3_busy_T[0];
endmodule
