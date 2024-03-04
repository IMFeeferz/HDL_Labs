module swap_xy(	input logic [3:0] x_data, y_data,
		input logic swap,
		output logic [3:0] x_swap, y_swap);

	// Calling MUX_2 function by passing in respective variables with x_swap
	// and y_swap as the outputs
	MUX_2 mux2_1(x_data, y_data, swap, x_swap);
	MUX_2 mux2_2(y_data, x_data, swap, y_swap);

endmodule
