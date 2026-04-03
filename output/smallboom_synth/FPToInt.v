module FPToInt (
	clock,
	io_in_valid,
	io_in_bits_ren2,
	io_in_bits_typeTagOut,
	io_in_bits_wflags,
	io_in_bits_rm,
	io_in_bits_typ,
	io_in_bits_fmt,
	io_in_bits_in1,
	io_in_bits_in2,
	io_out_bits_in_rm,
	io_out_bits_in_in1,
	io_out_bits_in_in2,
	io_out_bits_lt,
	io_out_bits_toint,
	io_out_bits_exc
);
	input clock;
	input io_in_valid;
	input io_in_bits_ren2;
	input [1:0] io_in_bits_typeTagOut;
	input io_in_bits_wflags;
	input [2:0] io_in_bits_rm;
	input [1:0] io_in_bits_typ;
	input [1:0] io_in_bits_fmt;
	input [64:0] io_in_bits_in1;
	input [64:0] io_in_bits_in2;
	output wire [2:0] io_out_bits_in_rm;
	output wire [64:0] io_out_bits_in_in1;
	output wire [64:0] io_out_bits_in_in2;
	output wire io_out_bits_lt;
	output wire [63:0] io_out_bits_toint;
	output wire [4:0] io_out_bits_exc;
	wire [63:0] toint;
	wire _narrow_io_signedOut_T;
	wire intType;
	wire [2:0] _narrow_io_intExceptionFlags;
	wire [63:0] _conv_io_out;
	wire [2:0] _conv_io_intExceptionFlags;
	wire _dcmp_io_lt;
	wire _dcmp_io_eq;
	wire [4:0] _dcmp_io_exceptionFlags;
	reg in_ren2;
	reg [1:0] in_typeTagOut;
	reg in_wflags;
	reg [2:0] in_rm;
	reg [1:0] in_typ;
	reg [1:0] in_fmt;
	reg [64:0] in_in1;
	reg [64:0] in_in2;
	wire [12:0] toint_ieee_unrecoded_rawIn_sExp = {1'h0, in_in1[63:52]};
	wire [52:0] _toint_ieee_unrecoded_denormFract_T_1 = {1'h0, |in_in1[63:61], in_in1[51:1]} >> (6'h01 - in_in1[57:52]);
	wire [1:0] _toint_ieee_prevUnrecoded_rawIn_isSpecial_T = {in_in1[52], in_in1[30]};
	wire toint_ieee_prevUnrecoded_rawIn_isInf = &_toint_ieee_prevUnrecoded_rawIn_isSpecial_T & ~in_in1[29];
	wire toint_ieee_prevUnrecoded_isSubnormal = $signed({1'h0, in_in1[52], in_in1[30:23]}) < 10'sh082;
	wire [23:0] _toint_ieee_prevUnrecoded_denormFract_T_1 = {1'h0, |{in_in1[52], in_in1[30:29]}, in_in1[22:1]} >> (5'h01 - in_in1[27:23]);
	wire toint_ieee_unrecoded_rawIn_1_isInf = &in_in1[63:62] & ~in_in1[61];
	wire toint_ieee_unrecoded_isSubnormal_1 = $signed(toint_ieee_unrecoded_rawIn_sExp) < 13'sh0402;
	wire [52:0] _toint_ieee_unrecoded_denormFract_T_3 = {1'h0, |in_in1[63:61], in_in1[51:1]} >> (6'h01 - in_in1[57:52]);
	wire [51:0] toint_ieee_unrecoded_fractOut_1 = (toint_ieee_unrecoded_isSubnormal_1 ? _toint_ieee_unrecoded_denormFract_T_3[51:0] : (toint_ieee_unrecoded_rawIn_1_isInf ? 52'h0000000000000 : in_in1[51:0]));
	wire [1:0] _toint_ieee_prevUnrecoded_rawIn_isSpecial_T_1 = {in_in1[52], in_in1[30]};
	wire toint_ieee_prevUnrecoded_rawIn_1_isInf = &_toint_ieee_prevUnrecoded_rawIn_isSpecial_T_1 & ~in_in1[29];
	wire toint_ieee_prevUnrecoded_isSubnormal_1 = $signed({1'h0, in_in1[52], in_in1[30:23]}) < 10'sh082;
	wire [23:0] _toint_ieee_prevUnrecoded_denormFract_T_3 = {1'h0, |{in_in1[52], in_in1[30:29]}, in_in1[22:1]} >> (5'h01 - in_in1[27:23]);
	wire [63:0] toint_ieee = (in_typeTagOut[0] ? {in_in1[64], (toint_ieee_unrecoded_isSubnormal_1 ? 11'h000 : in_in1[62:52] + 11'h3ff) | {11 {(&in_in1[63:62] & in_in1[61]) | toint_ieee_unrecoded_rawIn_1_isInf}}, toint_ieee_unrecoded_fractOut_1[51:32], (&in_in1[63:61] ? {in_in1[31], (toint_ieee_prevUnrecoded_isSubnormal_1 ? 8'h00 : in_in1[30:23] + 8'h7f) | {8 {(&_toint_ieee_prevUnrecoded_rawIn_isSpecial_T_1 & in_in1[29]) | toint_ieee_prevUnrecoded_rawIn_1_isInf}}, (toint_ieee_prevUnrecoded_isSubnormal_1 ? _toint_ieee_prevUnrecoded_denormFract_T_3[22:0] : (toint_ieee_prevUnrecoded_rawIn_1_isInf ? 23'h000000 : in_in1[22:0]))} : toint_ieee_unrecoded_fractOut_1[31:0])} : {2 {(&in_in1[63:61] ? {in_in1[31], (toint_ieee_prevUnrecoded_isSubnormal ? 8'h00 : in_in1[30:23] + 8'h7f) | {8 {(&_toint_ieee_prevUnrecoded_rawIn_isSpecial_T & in_in1[29]) | toint_ieee_prevUnrecoded_rawIn_isInf}}, (toint_ieee_prevUnrecoded_isSubnormal ? _toint_ieee_prevUnrecoded_denormFract_T_1[22:0] : (toint_ieee_prevUnrecoded_rawIn_isInf ? 23'h000000 : in_in1[22:0]))} : ($signed(toint_ieee_unrecoded_rawIn_sExp) < 13'sh0402 ? _toint_ieee_unrecoded_denormFract_T_1[31:0] : (&in_in1[63:62] & ~in_in1[61] ? 32'h00000000 : in_in1[31:0])))}});
	wire [8:0] _classify_out_expOut_commonCase_T = in_in1[60:52] - 9'h100;
	wire [8:0] classify_out_expOut = ((in_in1[63:61] == 3'h0) | (in_in1[63:61] > 3'h5) ? {in_in1[63:61], _classify_out_expOut_commonCase_T[5:0]} : _classify_out_expOut_commonCase_T);
	wire classify_out_isHighSubnormalIn = classify_out_expOut[6:0] < 7'h02;
	wire _classify_out_isNormal_T = classify_out_expOut[8:7] == 2'h1;
	wire classify_out_isSubnormal = (classify_out_expOut[8:6] == 3'h1) | (_classify_out_isNormal_T & classify_out_isHighSubnormalIn);
	wire classify_out_isNormal = (_classify_out_isNormal_T & ~classify_out_isHighSubnormalIn) | (classify_out_expOut[8:7] == 2'h2);
	wire classify_out_isZero = classify_out_expOut[8:6] == 3'h0;
	wire classify_out_isInf = &classify_out_expOut[8:7] & ~classify_out_expOut[6];
	wire classify_out_isHighSubnormalIn_1 = in_in1[61:52] < 10'h002;
	wire _classify_out_isNormal_T_4 = in_in1[63:62] == 2'h1;
	wire classify_out_isSubnormal_1 = (in_in1[63:61] == 3'h1) | (_classify_out_isNormal_T_4 & classify_out_isHighSubnormalIn_1);
	wire classify_out_isNormal_1 = (_classify_out_isNormal_T_4 & ~classify_out_isHighSubnormalIn_1) | (in_in1[63:62] == 2'h2);
	wire classify_out_isZero_1 = in_in1[63:61] == 3'h0;
	wire classify_out_isInf_1 = &in_in1[63:62] & ~in_in1[61];
	assign intType = (in_wflags ? ~in_ren2 & in_typ[1] : ~in_rm[0] & in_fmt[0]);
	assign _narrow_io_signedOut_T = in_typ[0];
	wire excSign = in_in1[64] & (in_in1[63:61] != 3'h7);
	wire invalid = _conv_io_intExceptionFlags[2] | _narrow_io_intExceptionFlags[1];
	assign toint = (in_wflags ? (in_ren2 ? {toint_ieee[63:32], 31'h00000000, |(~in_rm[1:0] & {_dcmp_io_lt, _dcmp_io_eq})} : (~in_typ[1] & invalid ? {_conv_io_out[63:32], ~_narrow_io_signedOut_T == excSign, {31 {~excSign}}} : _conv_io_out)) : (in_rm[0] ? {toint_ieee[63:32], 22'h000000, (in_typeTagOut[0] ? {&in_in1[63:61] & in_in1[51], &in_in1[63:61] & ~in_in1[51], classify_out_isInf_1 & ~in_in1[64], classify_out_isNormal_1 & ~in_in1[64], classify_out_isSubnormal_1 & ~in_in1[64], classify_out_isZero_1 & ~in_in1[64], classify_out_isZero_1 & in_in1[64], classify_out_isSubnormal_1 & in_in1[64], classify_out_isNormal_1 & in_in1[64], classify_out_isInf_1 & in_in1[64]} : {&classify_out_expOut[8:6] & in_in1[51], &classify_out_expOut[8:6] & ~in_in1[51], classify_out_isInf & ~in_in1[64], classify_out_isNormal & ~in_in1[64], classify_out_isSubnormal & ~in_in1[64], classify_out_isZero & ~in_in1[64], classify_out_isZero & in_in1[64], classify_out_isSubnormal & in_in1[64], classify_out_isNormal & in_in1[64], classify_out_isInf & in_in1[64]})} : toint_ieee));
	always @(posedge clock)
		if (io_in_valid) begin
			in_ren2 <= io_in_bits_ren2;
			in_typeTagOut <= io_in_bits_typeTagOut;
			in_wflags <= io_in_bits_wflags;
			in_rm <= io_in_bits_rm;
			in_typ <= io_in_bits_typ;
			in_fmt <= io_in_bits_fmt;
			in_in1 <= io_in_bits_in1;
			in_in2 <= io_in_bits_in2;
		end
	CompareRecFN dcmp(
		.io_a(in_in1),
		.io_b(in_in2),
		.io_signaling(~in_rm[1]),
		.io_lt(_dcmp_io_lt),
		.io_eq(_dcmp_io_eq),
		.io_exceptionFlags(_dcmp_io_exceptionFlags)
	);
	RecFNToIN_e11_s53_i64 conv(
		.io_in(in_in1),
		.io_roundingMode(in_rm),
		.io_signedOut(~_narrow_io_signedOut_T),
		.io_out(_conv_io_out),
		.io_intExceptionFlags(_conv_io_intExceptionFlags)
	);
	RecFNToIN_e11_s53_i32 narrow(
		.io_in(in_in1),
		.io_roundingMode(in_rm),
		.io_signedOut(~_narrow_io_signedOut_T),
		.io_intExceptionFlags(_narrow_io_intExceptionFlags)
	);
	assign io_out_bits_in_rm = in_rm;
	assign io_out_bits_in_in1 = in_in1;
	assign io_out_bits_in_in2 = in_in2;
	assign io_out_bits_lt = _dcmp_io_lt | (($signed(in_in1) < 65'sh00000000000000000) & ($signed(in_in2) > -65'sh00000000000000001));
	assign io_out_bits_toint = (intType ? toint : {{32 {toint[31]}}, toint[31:0]});
	assign io_out_bits_exc = (in_wflags ? (in_ren2 ? _dcmp_io_exceptionFlags : (in_typ[1] ? {|_conv_io_intExceptionFlags[2:1], 3'h0, _conv_io_intExceptionFlags[0]} : {invalid, 3'h0, ~invalid & _conv_io_intExceptionFlags[0]})) : 5'h00);
endmodule
