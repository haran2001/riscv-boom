module plusarg_reader (out);
	parameter FORMAT = "borked=%d";
	parameter WIDTH = 1;
	parameter [WIDTH - 1:0] DEFAULT = 0;
	output wire [WIDTH - 1:0] out;
	assign out = DEFAULT;
endmodule
