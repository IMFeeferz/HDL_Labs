
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
			input logic en,
			output logic w_en[7:0]);

	logic z[7:0];
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

