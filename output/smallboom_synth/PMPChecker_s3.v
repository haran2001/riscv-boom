module PMPChecker_s3 (
	io_prv,
	io_pmp_0_cfg_l,
	io_pmp_0_cfg_a,
	io_pmp_0_cfg_x,
	io_pmp_0_cfg_w,
	io_pmp_0_cfg_r,
	io_pmp_0_addr,
	io_pmp_0_mask,
	io_pmp_1_cfg_l,
	io_pmp_1_cfg_a,
	io_pmp_1_cfg_x,
	io_pmp_1_cfg_w,
	io_pmp_1_cfg_r,
	io_pmp_1_addr,
	io_pmp_1_mask,
	io_pmp_2_cfg_l,
	io_pmp_2_cfg_a,
	io_pmp_2_cfg_x,
	io_pmp_2_cfg_w,
	io_pmp_2_cfg_r,
	io_pmp_2_addr,
	io_pmp_2_mask,
	io_pmp_3_cfg_l,
	io_pmp_3_cfg_a,
	io_pmp_3_cfg_x,
	io_pmp_3_cfg_w,
	io_pmp_3_cfg_r,
	io_pmp_3_addr,
	io_pmp_3_mask,
	io_pmp_4_cfg_l,
	io_pmp_4_cfg_a,
	io_pmp_4_cfg_x,
	io_pmp_4_cfg_w,
	io_pmp_4_cfg_r,
	io_pmp_4_addr,
	io_pmp_4_mask,
	io_pmp_5_cfg_l,
	io_pmp_5_cfg_a,
	io_pmp_5_cfg_x,
	io_pmp_5_cfg_w,
	io_pmp_5_cfg_r,
	io_pmp_5_addr,
	io_pmp_5_mask,
	io_pmp_6_cfg_l,
	io_pmp_6_cfg_a,
	io_pmp_6_cfg_x,
	io_pmp_6_cfg_w,
	io_pmp_6_cfg_r,
	io_pmp_6_addr,
	io_pmp_6_mask,
	io_pmp_7_cfg_l,
	io_pmp_7_cfg_a,
	io_pmp_7_cfg_x,
	io_pmp_7_cfg_w,
	io_pmp_7_cfg_r,
	io_pmp_7_addr,
	io_pmp_7_mask,
	io_addr,
	io_size,
	io_r,
	io_w,
	io_x
);
	input [1:0] io_prv;
	input io_pmp_0_cfg_l;
	input [1:0] io_pmp_0_cfg_a;
	input io_pmp_0_cfg_x;
	input io_pmp_0_cfg_w;
	input io_pmp_0_cfg_r;
	input [29:0] io_pmp_0_addr;
	input [31:0] io_pmp_0_mask;
	input io_pmp_1_cfg_l;
	input [1:0] io_pmp_1_cfg_a;
	input io_pmp_1_cfg_x;
	input io_pmp_1_cfg_w;
	input io_pmp_1_cfg_r;
	input [29:0] io_pmp_1_addr;
	input [31:0] io_pmp_1_mask;
	input io_pmp_2_cfg_l;
	input [1:0] io_pmp_2_cfg_a;
	input io_pmp_2_cfg_x;
	input io_pmp_2_cfg_w;
	input io_pmp_2_cfg_r;
	input [29:0] io_pmp_2_addr;
	input [31:0] io_pmp_2_mask;
	input io_pmp_3_cfg_l;
	input [1:0] io_pmp_3_cfg_a;
	input io_pmp_3_cfg_x;
	input io_pmp_3_cfg_w;
	input io_pmp_3_cfg_r;
	input [29:0] io_pmp_3_addr;
	input [31:0] io_pmp_3_mask;
	input io_pmp_4_cfg_l;
	input [1:0] io_pmp_4_cfg_a;
	input io_pmp_4_cfg_x;
	input io_pmp_4_cfg_w;
	input io_pmp_4_cfg_r;
	input [29:0] io_pmp_4_addr;
	input [31:0] io_pmp_4_mask;
	input io_pmp_5_cfg_l;
	input [1:0] io_pmp_5_cfg_a;
	input io_pmp_5_cfg_x;
	input io_pmp_5_cfg_w;
	input io_pmp_5_cfg_r;
	input [29:0] io_pmp_5_addr;
	input [31:0] io_pmp_5_mask;
	input io_pmp_6_cfg_l;
	input [1:0] io_pmp_6_cfg_a;
	input io_pmp_6_cfg_x;
	input io_pmp_6_cfg_w;
	input io_pmp_6_cfg_r;
	input [29:0] io_pmp_6_addr;
	input [31:0] io_pmp_6_mask;
	input io_pmp_7_cfg_l;
	input [1:0] io_pmp_7_cfg_a;
	input io_pmp_7_cfg_x;
	input io_pmp_7_cfg_w;
	input io_pmp_7_cfg_r;
	input [29:0] io_pmp_7_addr;
	input [31:0] io_pmp_7_mask;
	input [31:0] io_addr;
	input [1:0] io_size;
	output wire io_r;
	output wire io_w;
	output wire io_x;
	wire [5:0] _res_aligned_lsbMask_T_14 = 6'h07 << io_size;
	wire res_hit = (io_pmp_7_cfg_a[1] ? (((io_addr[31:3] ^ io_pmp_7_addr[29:1]) & ~io_pmp_7_mask[31:3]) == 29'h00000000) & (((io_addr[2:0] ^ {io_pmp_7_addr[0], 2'h0}) & ~(io_pmp_7_mask[2:0] | ~_res_aligned_lsbMask_T_14[2:0])) == 3'h0) : (io_pmp_7_cfg_a[0] & ~((io_addr[31:3] < io_pmp_6_addr[29:1]) | (((io_addr[31:3] ^ io_pmp_6_addr[29:1]) == 29'h00000000) & ((io_addr[2:0] | ~_res_aligned_lsbMask_T_14[2:0]) < {io_pmp_6_addr[0], 2'h0})))) & ((io_addr[31:3] < io_pmp_7_addr[29:1]) | (((io_addr[31:3] ^ io_pmp_7_addr[29:1]) == 29'h00000000) & (io_addr[2:0] < {io_pmp_7_addr[0], 2'h0}))));
	wire res_ignore = io_prv[1] & ~io_pmp_7_cfg_l;
	wire [2:0] res_aligned_lsbMask = ~_res_aligned_lsbMask_T_14[2:0];
	wire res_aligned = (io_pmp_7_cfg_a[1] ? (res_aligned_lsbMask & ~io_pmp_7_mask[2:0]) == 3'h0 : ~(((((io_addr[31:3] ^ io_pmp_6_addr[29:1]) == 29'h00000000) & io_pmp_6_addr[0]) & ~io_addr[2]) | ((((io_addr[31:3] ^ io_pmp_7_addr[29:1]) == 29'h00000000) & io_pmp_7_addr[0]) & (io_addr[2] | res_aligned_lsbMask[2]))));
	wire res_hit_1 = (io_pmp_6_cfg_a[1] ? (((io_addr[31:3] ^ io_pmp_6_addr[29:1]) & ~io_pmp_6_mask[31:3]) == 29'h00000000) & (((io_addr[2:0] ^ {io_pmp_6_addr[0], 2'h0}) & ~(io_pmp_6_mask[2:0] | ~_res_aligned_lsbMask_T_14[2:0])) == 3'h0) : (io_pmp_6_cfg_a[0] & ~((io_addr[31:3] < io_pmp_5_addr[29:1]) | (((io_addr[31:3] ^ io_pmp_5_addr[29:1]) == 29'h00000000) & ((io_addr[2:0] | ~_res_aligned_lsbMask_T_14[2:0]) < {io_pmp_5_addr[0], 2'h0})))) & ((io_addr[31:3] < io_pmp_6_addr[29:1]) | (((io_addr[31:3] ^ io_pmp_6_addr[29:1]) == 29'h00000000) & (io_addr[2:0] < {io_pmp_6_addr[0], 2'h0}))));
	wire res_ignore_1 = io_prv[1] & ~io_pmp_6_cfg_l;
	wire [2:0] res_aligned_lsbMask_1 = ~_res_aligned_lsbMask_T_14[2:0];
	wire res_aligned_1 = (io_pmp_6_cfg_a[1] ? (res_aligned_lsbMask_1 & ~io_pmp_6_mask[2:0]) == 3'h0 : ~(((((io_addr[31:3] ^ io_pmp_5_addr[29:1]) == 29'h00000000) & io_pmp_5_addr[0]) & ~io_addr[2]) | ((((io_addr[31:3] ^ io_pmp_6_addr[29:1]) == 29'h00000000) & io_pmp_6_addr[0]) & (io_addr[2] | res_aligned_lsbMask_1[2]))));
	wire res_hit_2 = (io_pmp_5_cfg_a[1] ? (((io_addr[31:3] ^ io_pmp_5_addr[29:1]) & ~io_pmp_5_mask[31:3]) == 29'h00000000) & (((io_addr[2:0] ^ {io_pmp_5_addr[0], 2'h0}) & ~(io_pmp_5_mask[2:0] | ~_res_aligned_lsbMask_T_14[2:0])) == 3'h0) : (io_pmp_5_cfg_a[0] & ~((io_addr[31:3] < io_pmp_4_addr[29:1]) | (((io_addr[31:3] ^ io_pmp_4_addr[29:1]) == 29'h00000000) & ((io_addr[2:0] | ~_res_aligned_lsbMask_T_14[2:0]) < {io_pmp_4_addr[0], 2'h0})))) & ((io_addr[31:3] < io_pmp_5_addr[29:1]) | (((io_addr[31:3] ^ io_pmp_5_addr[29:1]) == 29'h00000000) & (io_addr[2:0] < {io_pmp_5_addr[0], 2'h0}))));
	wire res_ignore_2 = io_prv[1] & ~io_pmp_5_cfg_l;
	wire [2:0] res_aligned_lsbMask_2 = ~_res_aligned_lsbMask_T_14[2:0];
	wire res_aligned_2 = (io_pmp_5_cfg_a[1] ? (res_aligned_lsbMask_2 & ~io_pmp_5_mask[2:0]) == 3'h0 : ~(((((io_addr[31:3] ^ io_pmp_4_addr[29:1]) == 29'h00000000) & io_pmp_4_addr[0]) & ~io_addr[2]) | ((((io_addr[31:3] ^ io_pmp_5_addr[29:1]) == 29'h00000000) & io_pmp_5_addr[0]) & (io_addr[2] | res_aligned_lsbMask_2[2]))));
	wire res_hit_3 = (io_pmp_4_cfg_a[1] ? (((io_addr[31:3] ^ io_pmp_4_addr[29:1]) & ~io_pmp_4_mask[31:3]) == 29'h00000000) & (((io_addr[2:0] ^ {io_pmp_4_addr[0], 2'h0}) & ~(io_pmp_4_mask[2:0] | ~_res_aligned_lsbMask_T_14[2:0])) == 3'h0) : (io_pmp_4_cfg_a[0] & ~((io_addr[31:3] < io_pmp_3_addr[29:1]) | (((io_addr[31:3] ^ io_pmp_3_addr[29:1]) == 29'h00000000) & ((io_addr[2:0] | ~_res_aligned_lsbMask_T_14[2:0]) < {io_pmp_3_addr[0], 2'h0})))) & ((io_addr[31:3] < io_pmp_4_addr[29:1]) | (((io_addr[31:3] ^ io_pmp_4_addr[29:1]) == 29'h00000000) & (io_addr[2:0] < {io_pmp_4_addr[0], 2'h0}))));
	wire res_ignore_3 = io_prv[1] & ~io_pmp_4_cfg_l;
	wire [2:0] res_aligned_lsbMask_3 = ~_res_aligned_lsbMask_T_14[2:0];
	wire res_aligned_3 = (io_pmp_4_cfg_a[1] ? (res_aligned_lsbMask_3 & ~io_pmp_4_mask[2:0]) == 3'h0 : ~(((((io_addr[31:3] ^ io_pmp_3_addr[29:1]) == 29'h00000000) & io_pmp_3_addr[0]) & ~io_addr[2]) | ((((io_addr[31:3] ^ io_pmp_4_addr[29:1]) == 29'h00000000) & io_pmp_4_addr[0]) & (io_addr[2] | res_aligned_lsbMask_3[2]))));
	wire res_hit_4 = (io_pmp_3_cfg_a[1] ? (((io_addr[31:3] ^ io_pmp_3_addr[29:1]) & ~io_pmp_3_mask[31:3]) == 29'h00000000) & (((io_addr[2:0] ^ {io_pmp_3_addr[0], 2'h0}) & ~(io_pmp_3_mask[2:0] | ~_res_aligned_lsbMask_T_14[2:0])) == 3'h0) : (io_pmp_3_cfg_a[0] & ~((io_addr[31:3] < io_pmp_2_addr[29:1]) | (((io_addr[31:3] ^ io_pmp_2_addr[29:1]) == 29'h00000000) & ((io_addr[2:0] | ~_res_aligned_lsbMask_T_14[2:0]) < {io_pmp_2_addr[0], 2'h0})))) & ((io_addr[31:3] < io_pmp_3_addr[29:1]) | (((io_addr[31:3] ^ io_pmp_3_addr[29:1]) == 29'h00000000) & (io_addr[2:0] < {io_pmp_3_addr[0], 2'h0}))));
	wire res_ignore_4 = io_prv[1] & ~io_pmp_3_cfg_l;
	wire [2:0] res_aligned_lsbMask_4 = ~_res_aligned_lsbMask_T_14[2:0];
	wire res_aligned_4 = (io_pmp_3_cfg_a[1] ? (res_aligned_lsbMask_4 & ~io_pmp_3_mask[2:0]) == 3'h0 : ~(((((io_addr[31:3] ^ io_pmp_2_addr[29:1]) == 29'h00000000) & io_pmp_2_addr[0]) & ~io_addr[2]) | ((((io_addr[31:3] ^ io_pmp_3_addr[29:1]) == 29'h00000000) & io_pmp_3_addr[0]) & (io_addr[2] | res_aligned_lsbMask_4[2]))));
	wire res_hit_5 = (io_pmp_2_cfg_a[1] ? (((io_addr[31:3] ^ io_pmp_2_addr[29:1]) & ~io_pmp_2_mask[31:3]) == 29'h00000000) & (((io_addr[2:0] ^ {io_pmp_2_addr[0], 2'h0}) & ~(io_pmp_2_mask[2:0] | ~_res_aligned_lsbMask_T_14[2:0])) == 3'h0) : (io_pmp_2_cfg_a[0] & ~((io_addr[31:3] < io_pmp_1_addr[29:1]) | (((io_addr[31:3] ^ io_pmp_1_addr[29:1]) == 29'h00000000) & ((io_addr[2:0] | ~_res_aligned_lsbMask_T_14[2:0]) < {io_pmp_1_addr[0], 2'h0})))) & ((io_addr[31:3] < io_pmp_2_addr[29:1]) | (((io_addr[31:3] ^ io_pmp_2_addr[29:1]) == 29'h00000000) & (io_addr[2:0] < {io_pmp_2_addr[0], 2'h0}))));
	wire res_ignore_5 = io_prv[1] & ~io_pmp_2_cfg_l;
	wire [2:0] res_aligned_lsbMask_5 = ~_res_aligned_lsbMask_T_14[2:0];
	wire res_aligned_5 = (io_pmp_2_cfg_a[1] ? (res_aligned_lsbMask_5 & ~io_pmp_2_mask[2:0]) == 3'h0 : ~(((((io_addr[31:3] ^ io_pmp_1_addr[29:1]) == 29'h00000000) & io_pmp_1_addr[0]) & ~io_addr[2]) | ((((io_addr[31:3] ^ io_pmp_2_addr[29:1]) == 29'h00000000) & io_pmp_2_addr[0]) & (io_addr[2] | res_aligned_lsbMask_5[2]))));
	wire res_hit_6 = (io_pmp_1_cfg_a[1] ? (((io_addr[31:3] ^ io_pmp_1_addr[29:1]) & ~io_pmp_1_mask[31:3]) == 29'h00000000) & (((io_addr[2:0] ^ {io_pmp_1_addr[0], 2'h0}) & ~(io_pmp_1_mask[2:0] | ~_res_aligned_lsbMask_T_14[2:0])) == 3'h0) : (io_pmp_1_cfg_a[0] & ~((io_addr[31:3] < io_pmp_0_addr[29:1]) | (((io_addr[31:3] ^ io_pmp_0_addr[29:1]) == 29'h00000000) & ((io_addr[2:0] | ~_res_aligned_lsbMask_T_14[2:0]) < {io_pmp_0_addr[0], 2'h0})))) & ((io_addr[31:3] < io_pmp_1_addr[29:1]) | (((io_addr[31:3] ^ io_pmp_1_addr[29:1]) == 29'h00000000) & (io_addr[2:0] < {io_pmp_1_addr[0], 2'h0}))));
	wire res_ignore_6 = io_prv[1] & ~io_pmp_1_cfg_l;
	wire [2:0] res_aligned_lsbMask_6 = ~_res_aligned_lsbMask_T_14[2:0];
	wire res_aligned_6 = (io_pmp_1_cfg_a[1] ? (res_aligned_lsbMask_6 & ~io_pmp_1_mask[2:0]) == 3'h0 : ~(((((io_addr[31:3] ^ io_pmp_0_addr[29:1]) == 29'h00000000) & io_pmp_0_addr[0]) & ~io_addr[2]) | ((((io_addr[31:3] ^ io_pmp_1_addr[29:1]) == 29'h00000000) & io_pmp_1_addr[0]) & (io_addr[2] | res_aligned_lsbMask_6[2]))));
	wire res_hit_7 = (io_pmp_0_cfg_a[1] ? (((io_addr[31:3] ^ io_pmp_0_addr[29:1]) & ~io_pmp_0_mask[31:3]) == 29'h00000000) & (((io_addr[2:0] ^ {io_pmp_0_addr[0], 2'h0}) & ~(io_pmp_0_mask[2:0] | ~_res_aligned_lsbMask_T_14[2:0])) == 3'h0) : io_pmp_0_cfg_a[0] & ((io_addr[31:3] < io_pmp_0_addr[29:1]) | (((io_addr[31:3] ^ io_pmp_0_addr[29:1]) == 29'h00000000) & (io_addr[2:0] < {io_pmp_0_addr[0], 2'h0}))));
	wire res_ignore_7 = io_prv[1] & ~io_pmp_0_cfg_l;
	wire [2:0] res_aligned_lsbMask_7 = ~_res_aligned_lsbMask_T_14[2:0];
	wire res_aligned_7 = (io_pmp_0_cfg_a[1] ? (res_aligned_lsbMask_7 & ~io_pmp_0_mask[2:0]) == 3'h0 : ~((((io_addr[31:3] ^ io_pmp_0_addr[29:1]) == 29'h00000000) & io_pmp_0_addr[0]) & (io_addr[2] | res_aligned_lsbMask_7[2])));
	assign io_r = (res_hit_7 ? res_aligned_7 & (io_pmp_0_cfg_r | res_ignore_7) : (res_hit_6 ? res_aligned_6 & (io_pmp_1_cfg_r | res_ignore_6) : (res_hit_5 ? res_aligned_5 & (io_pmp_2_cfg_r | res_ignore_5) : (res_hit_4 ? res_aligned_4 & (io_pmp_3_cfg_r | res_ignore_4) : (res_hit_3 ? res_aligned_3 & (io_pmp_4_cfg_r | res_ignore_3) : (res_hit_2 ? res_aligned_2 & (io_pmp_5_cfg_r | res_ignore_2) : (res_hit_1 ? res_aligned_1 & (io_pmp_6_cfg_r | res_ignore_1) : (res_hit ? res_aligned & (io_pmp_7_cfg_r | res_ignore) : io_prv[1]))))))));
	assign io_w = (res_hit_7 ? res_aligned_7 & (io_pmp_0_cfg_w | res_ignore_7) : (res_hit_6 ? res_aligned_6 & (io_pmp_1_cfg_w | res_ignore_6) : (res_hit_5 ? res_aligned_5 & (io_pmp_2_cfg_w | res_ignore_5) : (res_hit_4 ? res_aligned_4 & (io_pmp_3_cfg_w | res_ignore_4) : (res_hit_3 ? res_aligned_3 & (io_pmp_4_cfg_w | res_ignore_3) : (res_hit_2 ? res_aligned_2 & (io_pmp_5_cfg_w | res_ignore_2) : (res_hit_1 ? res_aligned_1 & (io_pmp_6_cfg_w | res_ignore_1) : (res_hit ? res_aligned & (io_pmp_7_cfg_w | res_ignore) : io_prv[1]))))))));
	assign io_x = (res_hit_7 ? res_aligned_7 & (io_pmp_0_cfg_x | res_ignore_7) : (res_hit_6 ? res_aligned_6 & (io_pmp_1_cfg_x | res_ignore_6) : (res_hit_5 ? res_aligned_5 & (io_pmp_2_cfg_x | res_ignore_5) : (res_hit_4 ? res_aligned_4 & (io_pmp_3_cfg_x | res_ignore_4) : (res_hit_3 ? res_aligned_3 & (io_pmp_4_cfg_x | res_ignore_3) : (res_hit_2 ? res_aligned_2 & (io_pmp_5_cfg_x | res_ignore_2) : (res_hit_1 ? res_aligned_1 & (io_pmp_6_cfg_x | res_ignore_1) : (res_hit ? res_aligned & (io_pmp_7_cfg_x | res_ignore) : io_prv[1]))))))));
endmodule
