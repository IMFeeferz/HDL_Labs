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
	logic [3:0] d;
	logic [2:0] mux_output_3bit;
	logic [2:0] b[7:0];
	logic s;
	logic en;
	logic reset;
	
	// assign b[i] for its respective 3 bit inputs that will get passed into
	// the D Flip Flop function
	assign b[0] = 000;// 3'b000
	assign b[1] = 001;// 3'b001
	assign b[2] = 010;// 3'b010
	assign b[3] = 100;// 3'b100
	assign b[4] = 011;// 3'b011
	assign b[5] = 101;// 3'b101
	assign b[6] = 110;// 3'b110
	assign b[7] = 111;// 3'b111

	// Passing x and y into 2 to 1 3 bit MUX
	MUX_2_1_3bit mux_3bit_1(x, y, s, mux_output_3bit);
	
	//Passing x and y into decoder function
	Decoder_1_to_8 my_decoder(x, y);
	 
	// D Flip Flops r0-r7
	D_Flip_Flop_4bit r0(clk, en, reset, d, b[0], r[0]);
	D_Flip_Flop_4bit r1(clk, en, reset, d, b[1], r[1]);
	D_Flip_Flop_4bit r2(clk, en, reset, d, b[2], r[2]);
	D_Flip_Flop_4bit r3(clk, en, reset, d, b[3], r[3]);
	D_Flip_Flop_4bit r4(clk, en, reset, d, b[4], r[4]);
	D_Flip_Flop_4bit r5(clk, en, reset, d, b[5], r[5]);
	D_Flip_Flop_4bit r6(clk, en, reset, d, b[6], r[6]);
	D_Flip_Flop_4bit r7(clk, en, reset, d, b[7], r[7]);

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
