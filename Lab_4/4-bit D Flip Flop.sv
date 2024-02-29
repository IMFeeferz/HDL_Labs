module flopen	(input logic clk, en, reset,
		 input logic [3:0] d, ri,
		 output logic [3:0] q);

	always_ff @(posedge clk){
		if (reset) q <= ri;
		else if (en) q = d;
}

endmodule