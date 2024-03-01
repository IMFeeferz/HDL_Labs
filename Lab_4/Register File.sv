module Decoder_1_to_8(	input logic [2:0] a, 
			output logic [2:0] y);
	always_comb
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

module MUX_2_1_3bit(	input logic [2:0] D0, D1, 
			input S,
			output logic [2:0] y);
	assign y = S ? D1 : D0;
	//always_comb
		//case(S)
			//1'b1: y = D1;
			//1'b0: y = D0;
		//endcase
endmodule


module register_file(	input clk, init, swap,
			input logic [2:0] x, y,
			logic [3:0] r[7:0]);	
	logic [31:0] wrt_data, rd_data;
	logic [3:0] d,
	logic [2:0] mux_output_3bit;
	logic s, en, reset;
	
	// Passing x and y into 2 to 1 3 bit MUX
	MUX_2_1_3bit mux_3bit_1(x, y, s, mux_output_3bit);
	
	//Passing x and y into decoder function
	Decoder_1_to_8 my_decoder(x, y);
	 
	// D Flip Flops r0-r7
	4_bit_D_Flip_Flop reg0(clk, en, reset, d, 3b'000, r[0]);
	4_bit_D_Flip_Flop reg0(clk, en, reset, d, 3b'001, r[1]);
	4_bit_D_Flip_Flop reg0(clk, en, reset, d, 3b'010, r[2]);
	4_bit_D_Flip_Flop reg0(clk, en, reset, d, 3b'100, r[3]);
	4_bit_D_Flip_Flop reg0(clk, en, reset, d, 3b'011, r[4]);
	4_bit_D_Flip_Flop reg0(clk, en, reset, d, 3b'101, r[5]);
	4_bit_D_Flip_Flop reg0(clk, en, reset, d, 3b'110, r[6]);
	4_bit_D_Flip_Flop reg0(clk, en, reset, d, 3b'111, r[7]);

	//assigning AND gates for enables to the D Flip Flops
	assign AND_0 = en & r[0];
	assign AND_1 = en & r[1];
	assign AND_2 = en & r[2];
	assign AND_3 = en & r[3];
	assign AND_4 = en & r[4];
	assign AND_5 = en & r[5];
	assign AND_6 = en & r[6];
	assign AND_7 = en & r[7];

endmodule
