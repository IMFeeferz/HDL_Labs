module swap(	input logic [3:0] x_data, y_data,
		output logic [3:0] x_swap, y_swap);
	logic [3:0] XOR_1, XOR_2, XOR_3;
	
	assign XOR_1 = x_data ^ y_data;
	assign XOR_2 = XOR_1 ^ y_data;
	assign x_swap = XOR_1 ^ XOR_2;
	assign y_swap = XOR_2;
endmodule 
