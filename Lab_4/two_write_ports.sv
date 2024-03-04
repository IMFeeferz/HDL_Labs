module MUX_2(	input logic [3:0] d0, d1,
		input logic s,
		output logic [3:0] y);
	assign y = s ? d1 : d0;
endmodule
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
module write_port(	input logic [2:0] write_addr,
			output logic w_en[7:0]);
	logic en;
	logic z[7:0];
	assign en=1'b1;
	// 
	Decoder_3_to_8 my_decoder(write_addr, z);
	assign w_en[0] = en & z[0];
	assign w_en[1] = en & z[1];
	assign w_en[2] = en & z[2];
	assign w_en[3] = en & z[3];
	assign w_en[4] = en & z[4];
	assign w_en[5] = en & z[5];
	assign w_en[6] = en & z[6];
	assign w_en[7] = en & z[7];
endmodule
module write_enable(	input logic [3:0] x, y,
			input logic x_en, y_en,
			output logic [3:0] D,
			output logic en);
	logic [3:0] const_val ;
	logic [3:0] x_out,y_out;
	assign const_val = 4'b0000;
	MUX_2 mux2_1(const_val, x, x_en, x_out);
	MUX_2 mux2_2(y, y, x_en, y_out);
	MUX_2 mux2_3(x_out, y_out, y_en, D);

	assign en = x_en | y_en;
	
endmodule
module two_write_ports( input logic [2:0] write_addr_1, write_addr_2,
			input logic [3:0] write_data_1, write_data_2,
			output logic [3:0] d[7:0],
			output logic enable[7:0]);//
	logic w_en1[7:0],w_en2[7:0];
	write_port port_1(write_addr_1, w_en1);
	write_port port_2(write_addr_2, w_en2);
	
	// Calling write_enable funtion
	
	write_enable wrt_en_0(write_data_1, write_data_2, w_en1[0], w_en2[0],d[0], enable[0]);
	write_enable wrt_en_1(write_data_1, write_data_2, w_en1[1], w_en2[1],d[1], enable[1]);
	write_enable wrt_en_2(write_data_1, write_data_2, w_en1[2], w_en2[2],d[2], enable[2]);
	write_enable wrt_en_3(write_data_1, write_data_2, w_en1[3], w_en2[3],d[3], enable[3]);
	write_enable wrt_en_4(write_data_1, write_data_2, w_en1[4], w_en2[4],d[4], enable[4]);
	write_enable wrt_en_5(write_data_1, write_data_2, w_en1[5], w_en2[5],d[5], enable[5]);
	write_enable wrt_en_6(write_data_1, write_data_2, w_en1[6], w_en2[6],d[6], enable[6]);
	write_enable wrt_en_7(write_data_1, write_data_2, w_en1[7], w_en2[7],d[7], enable[7]);
	
endmodule
