module Decoder_3_to_8(	input logic [2:0] a, 
			output logic [7:0] y);
	always_comb
		case(a)
			3'b000: y = 8'b00000001;
			3'b001: y = 8'b00000010;
			3'b010: y = 8'b00000100;
			3'b100: y = 8'b00001000;
			3'b011: y = 8'b00010000;
			3'b101: y = 8'b00100000;
			3'b110: y = 8'b01000000;
			3'b111: y = 8'b10000000;
		endcase
endmodule

module MUX_8_1(	input logic [3:0] D0, D1, D2, D3, D4, D5, D6, D7, 
			input [2:0] S,
			output logic [3:0] y);
	//assign y = S ? D1 : D0;
	always_comb
		case(S)
			3'b000: y = D0;
			3'b001: y = D1;
			3'b010: y = D2;
			3'b100: y = D3;
			3'b011: y = D4;
			3'b101: y = D5;
			3'b110: y = D6;
			3'b111: y = D7;
		endcase
endmodule


module register_file(	input clk, init, swap,
			input logic [2:0] x, y,
			output logic [3:0] r[7:0]);	
	logic [31:0] wrt_data;
	logic [3:0] d;
	logic [2:0] wrt_addr, rd_addr;
	logic reset, en;
	assign en = 1;
	assign reset = init;
	
	
	// Passing x and y into 2 to 1 3 bit MUX
	//MUX_2_1_3bit mux_3bit_1(x, y, s, mux_output_3bit);
	//MUX_8_1(
	
	//Passing x and y into decoder function
	Decoder_3_to_8 my_decoder(x, z);

	//assigning AND gates for enables to the D Flip Flops
	assign w_en = en & z;
	 
	// D Flip Flops r0-r7
	D_Flip_Flop_4bit reg0(clk, w_en, reset, d, 3'b000, r[0]);
	D_Flip_Flop_4bit reg1(clk, w_en, reset, d, 3'b001, r[1]);
	D_Flip_Flop_4bit reg2(clk, w_en, reset, d, 3'b010, r[2]);
	D_Flip_Flop_4bit reg3(clk, w_en, reset, d, 3'b100, r[3]);
	D_Flip_Flop_4bit reg4(clk, w_en, reset, d, 3'b011, r[4]);
	D_Flip_Flop_4bit reg5(clk, w_en, reset, d, 3'b101, r[5]);
	D_Flip_Flop_4bit reg6(clk, w_en, reset, d, 3'b110, r[6]);
	D_Flip_Flop_4bit reg7(clk, w_en, reset, d, 3'b111, r[7]);

	//Instantiating MUX
	MUX_8_1 rd_port(r[0], r[1], r[2], r[3], r[4], r[5], r[6], r[7], rd_addr, rd_data);

endmodule
