module ForwardingAgeLogic (
	clock,
	io_matches,
	io_youngest,
	io_found,
	io_found_idx
);
	input clock;
	input [7:0] io_matches;
	input [2:0] io_youngest;
	output wire io_found;
	output wire [2:0] io_found_idx;
	reg found_match;
	reg [2:0] found_idx;
	always @(posedge clock) begin : sv2v_autoblock_1
		reg [7:0] _matches_T_1;
		_matches_T_1 = io_matches & {1'h0, &io_youngest, &io_youngest[2:1], io_youngest > 3'h4, io_youngest[2], io_youngest > 3'h2, |io_youngest[2:1], |io_youngest};
		found_match <= ((((((((((((((_matches_T_1[7] | _matches_T_1[6]) | _matches_T_1[5]) | _matches_T_1[4]) | _matches_T_1[3]) | _matches_T_1[2]) | _matches_T_1[1]) | _matches_T_1[0]) | io_matches[7]) | io_matches[6]) | io_matches[5]) | io_matches[4]) | io_matches[3]) | io_matches[2]) | io_matches[1]) | io_matches[0];
		found_idx <= (_matches_T_1[7] ? 3'h7 : (_matches_T_1[6] ? 3'h6 : (_matches_T_1[5] ? 3'h5 : (_matches_T_1[4] ? 3'h4 : (_matches_T_1[3] ? 3'h3 : (_matches_T_1[2] ? 3'h2 : (_matches_T_1[1] ? 3'h1 : (_matches_T_1[0] ? 3'h0 : (io_matches[7] ? 3'h7 : (io_matches[6] ? 3'h6 : (io_matches[5] ? 3'h5 : (io_matches[4] ? 3'h4 : (io_matches[3] ? 3'h3 : (io_matches[2] ? 3'h2 : {2'h0, io_matches[1]}))))))))))))));
	end
	assign io_found = found_match;
	assign io_found_idx = found_idx;
endmodule
