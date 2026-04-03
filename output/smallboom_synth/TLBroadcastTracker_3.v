module TLBroadcastTracker_3 (
	clock,
	reset,
	io_in_a_first,
	io_in_a_ready,
	io_in_a_valid,
	io_in_a_bits_opcode,
	io_in_a_bits_param,
	io_in_a_bits_size,
	io_in_a_bits_source,
	io_in_a_bits_address,
	io_in_a_bits_user_amba_prot_bufferable,
	io_in_a_bits_user_amba_prot_modifiable,
	io_in_a_bits_user_amba_prot_readalloc,
	io_in_a_bits_user_amba_prot_writealloc,
	io_in_a_bits_user_amba_prot_privileged,
	io_in_a_bits_user_amba_prot_secure,
	io_in_a_bits_user_amba_prot_fetch,
	io_in_a_bits_mask,
	io_in_a_bits_data,
	io_out_a_ready,
	io_out_a_valid,
	io_out_a_bits_opcode,
	io_out_a_bits_param,
	io_out_a_bits_size,
	io_out_a_bits_source,
	io_out_a_bits_address,
	io_out_a_bits_user_amba_prot_bufferable,
	io_out_a_bits_user_amba_prot_modifiable,
	io_out_a_bits_user_amba_prot_readalloc,
	io_out_a_bits_user_amba_prot_writealloc,
	io_out_a_bits_user_amba_prot_privileged,
	io_out_a_bits_user_amba_prot_secure,
	io_out_a_bits_user_amba_prot_fetch,
	io_out_a_bits_mask,
	io_out_a_bits_data,
	io_probe_valid,
	io_probe_bits_count,
	io_probenack,
	io_probedack,
	io_probesack,
	io_d_last,
	io_e_last,
	io_source,
	io_line,
	io_idle,
	io_need_d
);
	input clock;
	input reset;
	input io_in_a_first;
	output wire io_in_a_ready;
	input io_in_a_valid;
	input [2:0] io_in_a_bits_opcode;
	input [2:0] io_in_a_bits_param;
	input [2:0] io_in_a_bits_size;
	input [4:0] io_in_a_bits_source;
	input [31:0] io_in_a_bits_address;
	input io_in_a_bits_user_amba_prot_bufferable;
	input io_in_a_bits_user_amba_prot_modifiable;
	input io_in_a_bits_user_amba_prot_readalloc;
	input io_in_a_bits_user_amba_prot_writealloc;
	input io_in_a_bits_user_amba_prot_privileged;
	input io_in_a_bits_user_amba_prot_secure;
	input io_in_a_bits_user_amba_prot_fetch;
	input [7:0] io_in_a_bits_mask;
	input [63:0] io_in_a_bits_data;
	input io_out_a_ready;
	output wire io_out_a_valid;
	output wire [2:0] io_out_a_bits_opcode;
	output wire [2:0] io_out_a_bits_param;
	output wire [2:0] io_out_a_bits_size;
	output wire [6:0] io_out_a_bits_source;
	output wire [31:0] io_out_a_bits_address;
	output wire io_out_a_bits_user_amba_prot_bufferable;
	output wire io_out_a_bits_user_amba_prot_modifiable;
	output wire io_out_a_bits_user_amba_prot_readalloc;
	output wire io_out_a_bits_user_amba_prot_writealloc;
	output wire io_out_a_bits_user_amba_prot_privileged;
	output wire io_out_a_bits_user_amba_prot_secure;
	output wire io_out_a_bits_user_amba_prot_fetch;
	output wire [7:0] io_out_a_bits_mask;
	output wire [63:0] io_out_a_bits_data;
	input io_probe_valid;
	input io_probe_bits_count;
	input io_probenack;
	input io_probedack;
	input io_probesack;
	input io_d_last;
	input io_e_last;
	output wire [4:0] io_source;
	output wire [25:0] io_line;
	output wire io_idle;
	output wire io_need_d;
	wire io_in_a_ready_0;
	wire _o_data_q_io_enq_ready;
	wire _o_data_q_io_deq_valid;
	reg got_e;
	reg sent_d;
	reg shared;
	reg [2:0] opcode;
	reg [2:0] param;
	reg [2:0] size;
	reg [4:0] source;
	reg user_amba_prot_bufferable;
	reg user_amba_prot_modifiable;
	reg user_amba_prot_readalloc;
	reg user_amba_prot_writealloc;
	reg user_amba_prot_privileged;
	reg user_amba_prot_secure;
	reg user_amba_prot_fetch;
	reg [31:0] address;
	reg count;
	wire idle = got_e & sent_d;
	wire _GEN = (io_in_a_ready_0 & io_in_a_valid) & io_in_a_first;
	wire _GEN_0 = io_probenack | io_probedack;
	assign io_in_a_ready_0 = (idle | ~io_in_a_first) & _o_data_q_io_enq_ready;
	wire acquire = (opcode == 3'h6) | &opcode;
	always @(posedge clock) begin
		if (reset) begin
			got_e <= 1'h1;
			sent_d <= 1'h1;
			address <= 32'h000000c0;
		end
		else begin
			got_e <= io_e_last | (_GEN ? (io_in_a_bits_opcode != 3'h6) & (io_in_a_bits_opcode != 3'h7) : got_e);
			sent_d <= io_d_last | (~_GEN & sent_d);
			if (_GEN)
				address <= io_in_a_bits_address;
		end
		if (io_probesack)
			shared <= 1'h1;
		else
			shared <= ~_GEN & shared;
		if (_GEN) begin
			opcode <= io_in_a_bits_opcode;
			param <= io_in_a_bits_param;
			size <= io_in_a_bits_size;
			source <= io_in_a_bits_source;
			user_amba_prot_bufferable <= io_in_a_bits_user_amba_prot_bufferable;
			user_amba_prot_modifiable <= io_in_a_bits_user_amba_prot_modifiable;
			user_amba_prot_readalloc <= io_in_a_bits_user_amba_prot_readalloc;
			user_amba_prot_writealloc <= io_in_a_bits_user_amba_prot_writealloc;
			user_amba_prot_privileged <= io_in_a_bits_user_amba_prot_privileged;
			user_amba_prot_secure <= io_in_a_bits_user_amba_prot_secure;
			user_amba_prot_fetch <= io_in_a_bits_user_amba_prot_fetch;
		end
		if (_GEN_0)
			count <= count - ~(io_probenack & io_probedack);
		else if (io_probe_valid)
			count <= io_probe_bits_count;
		else
			count <= _GEN | count;
	end
	Queue8_TLBroadcastData o_data_q(
		.clock(clock),
		.reset(reset),
		.io_enq_ready(_o_data_q_io_enq_ready),
		.io_enq_valid((idle | ~io_in_a_first) & io_in_a_valid),
		.io_enq_bits_mask(io_in_a_bits_mask),
		.io_enq_bits_data(io_in_a_bits_data),
		.io_deq_ready(io_out_a_ready & ~count),
		.io_deq_valid(_o_data_q_io_deq_valid),
		.io_deq_bits_mask(io_out_a_bits_mask),
		.io_deq_bits_data(io_out_a_bits_data)
	);
	assign io_in_a_ready = io_in_a_ready_0;
	assign io_out_a_valid = _o_data_q_io_deq_valid & ~count;
	assign io_out_a_bits_opcode = (acquire ? 3'h4 : opcode);
	assign io_out_a_bits_param = (acquire ? 3'h0 : param);
	assign io_out_a_bits_size = size;
	assign io_out_a_bits_source = {(acquire ? {1'h1, ~shared} : 2'h0), source};
	assign io_out_a_bits_address = address;
	assign io_out_a_bits_user_amba_prot_bufferable = user_amba_prot_bufferable;
	assign io_out_a_bits_user_amba_prot_modifiable = user_amba_prot_modifiable;
	assign io_out_a_bits_user_amba_prot_readalloc = user_amba_prot_readalloc;
	assign io_out_a_bits_user_amba_prot_writealloc = user_amba_prot_writealloc;
	assign io_out_a_bits_user_amba_prot_privileged = user_amba_prot_privileged;
	assign io_out_a_bits_user_amba_prot_secure = user_amba_prot_secure;
	assign io_out_a_bits_user_amba_prot_fetch = user_amba_prot_fetch;
	assign io_source = source;
	assign io_line = address[31:6];
	assign io_idle = idle;
	assign io_need_d = ~sent_d;
endmodule
