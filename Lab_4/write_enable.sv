module write_enable(	input logic [3:0] x, y,
			input logic x_en, y_en,
			output logic [3:0] D,
			output logic en);
	logic [3:0] const_val = 4'b0000;
	
	assign en = x_en | y_en;
	MUX_2 mux2_1(const_val, x, x_en, x_out);
	MUX_2 mux2_2(y, y, x_en, y_out);
	MUX_2 mux2_3(mux2_1, mux2_2, y_en, D);
endmodule
