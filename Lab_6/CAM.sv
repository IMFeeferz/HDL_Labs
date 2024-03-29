module D_Flip_Flop_4bit	(input logic clk, en, reset,
		 	input logic [3:0] d, ri,
		 	output logic [3:0] q);

	// asynchronous reset
	always_ff @(posedge clk)
		if (reset) q <= ri;
		else if (en) q = d;


endmodule

module Lookup(	input [3:0] qi,
		input [3:0]lookup,
		output match );
	 	assign match = ~(qi[0]^lookup[0]) & ~(qi[1]^lookup[1]) & ~(qi[2]^lookup[2])& ~(qi[3]^lookup[3]);

endmodule
	
module CAM_File(	input logic clk, init,
			input logic [3:0] D_Lookup,
			input logic [3:0]newD,
			output valid,
			output logic [3:0] z[7:0]);	
	
	logic reset;
	logic m[7:0];
	assign reset = init;
	
	

	// D Flip Flops r0-r7
	D_Flip_Flop_4bit reg0(clk, set_D, reset, newD, 4'b1000, z[0]);
	D_Flip_Flop_4bit reg1(clk, set_D, reset, newD, 4'b1001, z[1]);
	D_Flip_Flop_4bit reg2(clk, set_D, reset, newD, 4'b1010, z[2]);
	D_Flip_Flop_4bit reg3(clk, set_D, reset, newD, 4'b1011, z[3]);
	D_Flip_Flop_4bit reg4(clk, set_D, reset, newD, 4'b1100, z[4]);
	D_Flip_Flop_4bit reg5(clk, set_D, reset, newD, 4'b1101, z[5]);
	D_Flip_Flop_4bit reg6(clk, set_D, reset, newD, 4'b1110, z[6]);
	D_Flip_Flop_4bit reg7(clk, set_D, reset, newD, 4'b1111, z[7]);
	

	Lookup l0(z[0],D_Lookup,m[0]);
	Lookup l1(z[1],D_Lookup,m[1]);
	Lookup l2(z[2],D_Lookup,m[2]);
	Lookup l3(z[3],D_Lookup,m[3]);
	Lookup l4(z[4],D_Lookup,m[4]);
	Lookup l5(z[5],D_Lookup,m[5]);
	Lookup l6(z[6],D_Lookup,m[6]);
	Lookup l7(z[7],D_Lookup,m[7]);

	assign valid = m[0] | m[1] | m[2] | m[3] | m[4] | m[5] | m[6] | m[7]  ;


	
endmodule