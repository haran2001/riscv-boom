module BoomRAS (
	clock,
	io_read_idx,
	io_read_addr,
	io_write_valid,
	io_write_idx,
	io_write_addr
);
	input clock;
	input [4:0] io_read_idx;
	output wire [39:0] io_read_addr;
	input io_write_valid;
	input [4:0] io_write_idx;
	input [39:0] io_write_addr;
	reg [39:0] ras_0;
	reg [39:0] ras_1;
	reg [39:0] ras_2;
	reg [39:0] ras_3;
	reg [39:0] ras_4;
	reg [39:0] ras_5;
	reg [39:0] ras_6;
	reg [39:0] ras_7;
	reg [39:0] ras_8;
	reg [39:0] ras_9;
	reg [39:0] ras_10;
	reg [39:0] ras_11;
	reg [39:0] ras_12;
	reg [39:0] ras_13;
	reg [39:0] ras_14;
	reg [39:0] ras_15;
	reg [39:0] ras_16;
	reg [39:0] ras_17;
	reg [39:0] ras_18;
	reg [39:0] ras_19;
	reg [39:0] ras_20;
	reg [39:0] ras_21;
	reg [39:0] ras_22;
	reg [39:0] ras_23;
	reg [39:0] ras_24;
	reg [39:0] ras_25;
	reg [39:0] ras_26;
	reg [39:0] ras_27;
	reg [39:0] ras_28;
	reg [39:0] ras_29;
	reg [39:0] ras_30;
	reg [39:0] ras_31;
	reg io_read_addr_REG;
	reg [39:0] io_read_addr_REG_1;
	reg [39:0] io_read_addr_REG_2;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg [1279:0] _GEN;
		if (io_write_valid & (io_write_idx == 5'h00))
			ras_0 <= io_write_addr;
		if (io_write_valid & (io_write_idx == 5'h01))
			ras_1 <= io_write_addr;
		if (io_write_valid & (io_write_idx == 5'h02))
			ras_2 <= io_write_addr;
		if (io_write_valid & (io_write_idx == 5'h03))
			ras_3 <= io_write_addr;
		if (io_write_valid & (io_write_idx == 5'h04))
			ras_4 <= io_write_addr;
		if (io_write_valid & (io_write_idx == 5'h05))
			ras_5 <= io_write_addr;
		if (io_write_valid & (io_write_idx == 5'h06))
			ras_6 <= io_write_addr;
		if (io_write_valid & (io_write_idx == 5'h07))
			ras_7 <= io_write_addr;
		if (io_write_valid & (io_write_idx == 5'h08))
			ras_8 <= io_write_addr;
		if (io_write_valid & (io_write_idx == 5'h09))
			ras_9 <= io_write_addr;
		if (io_write_valid & (io_write_idx == 5'h0a))
			ras_10 <= io_write_addr;
		if (io_write_valid & (io_write_idx == 5'h0b))
			ras_11 <= io_write_addr;
		if (io_write_valid & (io_write_idx == 5'h0c))
			ras_12 <= io_write_addr;
		if (io_write_valid & (io_write_idx == 5'h0d))
			ras_13 <= io_write_addr;
		if (io_write_valid & (io_write_idx == 5'h0e))
			ras_14 <= io_write_addr;
		if (io_write_valid & (io_write_idx == 5'h0f))
			ras_15 <= io_write_addr;
		if (io_write_valid & (io_write_idx == 5'h10))
			ras_16 <= io_write_addr;
		if (io_write_valid & (io_write_idx == 5'h11))
			ras_17 <= io_write_addr;
		if (io_write_valid & (io_write_idx == 5'h12))
			ras_18 <= io_write_addr;
		if (io_write_valid & (io_write_idx == 5'h13))
			ras_19 <= io_write_addr;
		if (io_write_valid & (io_write_idx == 5'h14))
			ras_20 <= io_write_addr;
		if (io_write_valid & (io_write_idx == 5'h15))
			ras_21 <= io_write_addr;
		if (io_write_valid & (io_write_idx == 5'h16))
			ras_22 <= io_write_addr;
		if (io_write_valid & (io_write_idx == 5'h17))
			ras_23 <= io_write_addr;
		if (io_write_valid & (io_write_idx == 5'h18))
			ras_24 <= io_write_addr;
		if (io_write_valid & (io_write_idx == 5'h19))
			ras_25 <= io_write_addr;
		if (io_write_valid & (io_write_idx == 5'h1a))
			ras_26 <= io_write_addr;
		if (io_write_valid & (io_write_idx == 5'h1b))
			ras_27 <= io_write_addr;
		if (io_write_valid & (io_write_idx == 5'h1c))
			ras_28 <= io_write_addr;
		if (io_write_valid & (io_write_idx == 5'h1d))
			ras_29 <= io_write_addr;
		if (io_write_valid & (io_write_idx == 5'h1e))
			ras_30 <= io_write_addr;
		if (io_write_valid & (&io_write_idx))
			ras_31 <= io_write_addr;
		io_read_addr_REG <= io_write_valid & (io_write_idx == io_read_idx);
		io_read_addr_REG_1 <= io_write_addr;
		_GEN = {ras_31, ras_30, ras_29, ras_28, ras_27, ras_26, ras_25, ras_24, ras_23, ras_22, ras_21, ras_20, ras_19, ras_18, ras_17, ras_16, ras_15, ras_14, ras_13, ras_12, ras_11, ras_10, ras_9, ras_8, ras_7, ras_6, ras_5, ras_4, ras_3, ras_2, ras_1, ras_0};
		io_read_addr_REG_2 <= _GEN[io_read_idx * 40+:40];
	end
	assign io_read_addr = (io_read_addr_REG ? io_read_addr_REG_1 : io_read_addr_REG_2);
endmodule
