module register_swap(	input logic init, swap,
			input logic [2:0] x, y,
			output logic [3:0] r[7:0]);
	logic clk;
	register_file my_register(clk, init, swap, x, y, r);
endmodule
