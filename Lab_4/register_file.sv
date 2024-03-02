/*
module Decoder_3_to_8(	input logic [2:0] a, 
			output logic y[7:0]);
	always_comb
		case(a)
			3'b000: begin y[7] = 0; y[6] = 0; y[5] = 0; y[4] = 0; y[3] = 0; y[2] = 0; y[1] = 0; y[0] = 1; end //y = 8'b00000001;
			3'b001: begin y[7] = 0; y[6] = 0; y[5] = 0; y[4] = 0; y[3] = 0; y[2] = 0; y[1] = 1; y[0] = 0; end//y = 8'b00000010;
			3'b010: begin y[7] = 0; y[6] = 0; y[5] = 0; y[4] = 0; y[3] = 0; y[2] = 1; y[1] = 0; y[0] = 0; end //y = 8'b00000100;
			3'b011: begin y[7] = 0; y[6] = 0; y[5] = 0; y[4] = 0; y[3] = 1; y[2] = 0; y[1] = 0; y[0] = 0; end//y = 8'b00001000;
			3'b100: begin y[7] = 0; y[6] = 0; y[5] = 0; y[4] = 1; y[3] = 0; y[2] = 0; y[1] = 0; y[0] = 0; end//y = 8'b00010000;
			3'b101: begin y[7] = 0; y[6] = 0; y[5] = 1; y[4] = 0; y[3] = 0; y[2] = 0; y[1] = 0; y[0] = 0; end//y = 8'b00100000;
			3'b110: begin y[7] = 0; y[6] = 1; y[5] = 0; y[4] = 0; y[3] = 0; y[2] = 0; y[1] = 0; y[0] = 0; end//y = 8'b01000000;
			3'b111: begin y[7] = 1; y[6] = 0; y[5] = 0; y[4] = 0; y[3] = 0; y[2] = 0; y[1] = 0; y[0] = 0; end//y = 8'b10000000;
		endcase
endmodule
*/

/*
module MUX_8_1(	input logic [3:0] D0, D1, D2, D3, D4, D5, D6, D7, 
			input [2:0] S,
			output logic [3:0] y);
	//assign y = S ? D1 : D0;
	always_comb
		case(S)
			3'b000: y = D0;
			3'b001: y = D1;
			3'b010: y = D2;
			3'b011: y = D3;
			3'b100: y = D4;
			3'b101: y = D5;
			3'b110: y = D6;
			3'b111: y = D7;
		endcase
endmodule
*/

module register_file(	input logic clk, init, swap,
			input logic [2:0] x, y,
			output logic [3:0] r[7:0]);	
	logic z [7:0], w_en[7:0];
	logic [3:0] d;
	//logic [2:0] wrt_addr, rd_addr;
	logic reset, en;
	assign en = 1;
	assign reset = init;
	assign d = 4'b1111;
	
	// Passing x and y into 2 to 1 3 bit MUX
	//MUX_2_1_3bit mux_3bit_1(x, y, s, mux_output_3bit);
	//MUX_8_1(
	
	//Passing x and y into decoder function
	Decoder_3_to_8 my_decoder(x, z);

	//assigning AND gates for enables to the D Flip Flops
	/*
	D_Flip_Flop_4bit	(input logic clk, en, reset,
		 	input logic [3:0] d, ri,
		 	output logic [3:0] q);
	*/
	assign w_en[0] = en & z[0];
	assign w_en[1] = en & z[1];
	assign w_en[2] = en & z[2];
	assign w_en[3] = en & z[3];
	assign w_en[4] = en & z[4];
	assign w_en[5] = en & z[5];
	assign w_en[6] = en & z[6];
	assign w_en[7] = en & z[7];
	 
	// D Flip Flops r0-r7
	D_Flip_Flop_4bit reg0(clk, w_en[0], reset, d, 4'b0000, r[0]);
	D_Flip_Flop_4bit reg1(clk, w_en[1], reset, d, 4'b0001, r[1]);
	D_Flip_Flop_4bit reg2(clk, w_en[2], reset, d, 4'b0010, r[2]);
	D_Flip_Flop_4bit reg3(clk, w_en[3], reset, d, 4'b0011, r[3]);
	D_Flip_Flop_4bit reg4(clk, w_en[4], reset, d, 4'b0100, r[4]);
	D_Flip_Flop_4bit reg5(clk, w_en[5], reset, d, 4'b0101, r[5]);
	D_Flip_Flop_4bit reg6(clk, w_en[6], reset, d, 4'b0110, r[6]);
	D_Flip_Flop_4bit reg7(clk, w_en[7], reset, d, 4'b0111, r[7]);

	// Instantiating MUX
	/*
	MUX_8_1(	input logic [3:0] q[7:0],
		input logic [2:0] s,
		output logic [3:0] read_data);
	*/
	MUX_8_1 rd_port_1(r, x, read_data_x);
	MUX_8_1 rd_port_2(r, y, read_data_y);
	//MUX_8_1 rd_port(r[0], r[1], r[2], r[3], r[4], r[5], r[6], r[7], rd_addr, rd_data);

	// Calling Swap
	/*
	swap(	input logic [3:0] x_data, y_data,
		input logic swap,
		output logic [3:0] x_swap, y_swap);

	*/
	Swap _swap(read_data_x, read_data_y, swap, wrt_data_1, wrt_data_2);

	// Calling two_write_ports
	/*
	two_write_ports( input logic [2:0] write_addr_1, write_addr_2,
			input logic [3:0] write_data_1, write_data_2,
			input logic en_1, en_2,
			output logic [3:0] d[7:0],
			output logic w_en[7:0]);
	*/
	two_write_ports two_ports(x, y, wrt_data_1, wrt_data_2, 1, 1, r, w_en); 
endmodule
