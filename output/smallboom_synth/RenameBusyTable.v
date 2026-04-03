module RenameBusyTable (
	clock,
	reset,
	io_ren_uops_0_pdst,
	io_ren_uops_0_prs1,
	io_ren_uops_0_prs2,
	io_busy_resps_0_prs1_busy,
	io_busy_resps_0_prs2_busy,
	io_rebusy_reqs_0,
	io_wakeups_0_valid,
	io_wakeups_0_bits_uop_pdst,
	io_wakeups_0_bits_rebusy,
	io_wakeups_1_valid,
	io_wakeups_1_bits_uop_pdst,
	io_wakeups_2_valid,
	io_wakeups_2_bits_uop_pdst,
	io_child_rebusys
);
	input clock;
	input reset;
	input [5:0] io_ren_uops_0_pdst;
	input [5:0] io_ren_uops_0_prs1;
	input [5:0] io_ren_uops_0_prs2;
	output wire io_busy_resps_0_prs1_busy;
	output wire io_busy_resps_0_prs2_busy;
	input io_rebusy_reqs_0;
	input io_wakeups_0_valid;
	input [5:0] io_wakeups_0_bits_uop_pdst;
	input io_wakeups_0_bits_rebusy;
	input io_wakeups_1_valid;
	input [5:0] io_wakeups_1_bits_uop_pdst;
	input io_wakeups_2_valid;
	input [5:0] io_wakeups_2_bits_uop_pdst;
	input io_child_rebusys;
	reg wakeups_wu_valid_REG;
	reg [5:0] wakeups_wu_bits_REG_uop_pdst;
	reg wakeups_wu_bits_REG_rebusy;
	reg wakeups_wu_valid_REG_2;
	reg [5:0] wakeups_wu_bits_REG_1_uop_pdst;
	reg wakeups_wu_valid_REG_4;
	wire wakeups_2_valid = wakeups_wu_valid_REG_4 & ~io_child_rebusys;
	reg [5:0] wakeups_wu_bits_REG_2_uop_pdst;
	reg [51:0] busy_table;
	wire _io_busy_resps_0_prs3_busy_T_2 = wakeups_wu_valid_REG & wakeups_wu_bits_REG_rebusy;
	wire prs1_match_0 = wakeups_wu_valid_REG & (wakeups_wu_bits_REG_uop_pdst == io_ren_uops_0_prs1);
	wire prs2_match_0 = wakeups_wu_valid_REG & (wakeups_wu_bits_REG_uop_pdst == io_ren_uops_0_prs2);
	wire [51:0] _io_busy_resps_0_prs1_busy_T = busy_table >> io_ren_uops_0_prs1;
	wire [51:0] _io_busy_resps_0_prs2_busy_T = busy_table >> io_ren_uops_0_prs2;
	always @(posedge clock) begin
		wakeups_wu_valid_REG <= io_wakeups_0_valid;
		wakeups_wu_bits_REG_uop_pdst <= io_wakeups_0_bits_uop_pdst;
		wakeups_wu_bits_REG_rebusy <= io_wakeups_0_bits_rebusy;
		wakeups_wu_valid_REG_2 <= io_wakeups_1_valid;
		wakeups_wu_bits_REG_1_uop_pdst <= io_wakeups_1_bits_uop_pdst;
		wakeups_wu_valid_REG_4 <= io_wakeups_2_valid;
		wakeups_wu_bits_REG_2_uop_pdst <= io_wakeups_2_bits_uop_pdst;
		if (reset)
			busy_table <= 52'h0000000000000;
		else begin : sv2v_autoblock_1
			reg [63:0] _busy_table_next_T_4;
			reg [63:0] _busy_table_next_T;
			reg [63:0] _busy_table_next_T_12;
			reg [63:0] _busy_table_next_T_8;
			_busy_table_next_T = 64'h0000000000000001 << io_ren_uops_0_pdst;
			_busy_table_next_T_4 = 64'h0000000000000001 << wakeups_wu_bits_REG_uop_pdst;
			_busy_table_next_T_12 = 64'h0000000000000001 << wakeups_wu_bits_REG_2_uop_pdst;
			_busy_table_next_T_8 = 64'h0000000000000001 << wakeups_wu_bits_REG_1_uop_pdst;
			busy_table <= ((~(((_busy_table_next_T_4[51:0] & {52 {wakeups_wu_valid_REG & ~wakeups_wu_bits_REG_rebusy}}) | (_busy_table_next_T_8[51:0] & {52 {wakeups_wu_valid_REG_2}})) | (_busy_table_next_T_12[51:0] & {52 {wakeups_2_valid}})) & busy_table) | (_busy_table_next_T[51:0] & {52 {io_rebusy_reqs_0}})) | (_busy_table_next_T_4[51:0] & {52 {_io_busy_resps_0_prs3_busy_T_2}});
		end
	end
	assign io_busy_resps_0_prs1_busy = ((prs1_match_0 | (wakeups_wu_valid_REG_2 & (wakeups_wu_bits_REG_1_uop_pdst == io_ren_uops_0_prs1))) | (wakeups_2_valid & (wakeups_wu_bits_REG_2_uop_pdst == io_ren_uops_0_prs1)) ? prs1_match_0 & _io_busy_resps_0_prs3_busy_T_2 : _io_busy_resps_0_prs1_busy_T[0]);
	assign io_busy_resps_0_prs2_busy = ((prs2_match_0 | (wakeups_wu_valid_REG_2 & (wakeups_wu_bits_REG_1_uop_pdst == io_ren_uops_0_prs2))) | (wakeups_2_valid & (wakeups_wu_bits_REG_2_uop_pdst == io_ren_uops_0_prs2)) ? prs2_match_0 & _io_busy_resps_0_prs3_busy_T_2 : _io_busy_resps_0_prs2_busy_T[0]);
endmodule
