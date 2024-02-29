module Decoder_1_to_8(	input logic [2:0] a, 
			output logic [2:0] y);
	always_comb:
		case(a)
			3'b000: y = 3'b000;
			3'b001: y = 3'b001;
			3'b010: y = 3'b010;
			3'b100: y = 3'b100;
			3'b011: y = 3'b011;
			3'b101: y = 3'b101;
			3'b110: y = 3'b110;
			3'b111: y = 3'b111;
		endcase
endmodule


module register_file(	input clk, init, swap,
			input logic [2:0] x, y,
			logic [3:0] r[7:0]);		
