module D_Flip_Flop_4bit	(input logic clk, en, reset,
		 	input logic [3:0] d, ri,
		 	output logic [3:0] q);

	// asynchronous reset
	always_ff @(posedge clk)
		if (reset) q <= ri;
		else if (en) q = d;


endmodule


	
module CAM_File(	input logic clk, init,
			input logic [3:0] D_Lookup,
			input logic setD,
			input logic [3:0] newD,
			output logic valid,
			output logic [2:0] minAddr,maxAddr,
			output logic [3:0] q[7:0]);	
	
	logic reset;
	logic m[7:0];
	logic en;
	logic enable[7:0];
	logic wen1[7:0];
	logic wen2[7:0];

	// D Flip Flops r0-r7
	D_Flip_Flop_4bit reg0(clk, enable[0], init, newD, 4'b1000, q[0]);
	D_Flip_Flop_4bit reg1(clk, enable[1], init, newD, 4'b1001, q[1]);
	D_Flip_Flop_4bit reg2(clk, enable[2], init, newD, 4'b1010, q[2]);
	D_Flip_Flop_4bit reg3(clk, enable[3], init, newD, 4'b1011, q[3]);
	D_Flip_Flop_4bit reg4(clk, enable[4], init, newD, 4'b1100, q[4]);
	D_Flip_Flop_4bit reg5(clk, enable[5], init, newD, 4'b1101, q[5]);
	D_Flip_Flop_4bit reg6(clk, enable[6], init, newD, 4'b1110, q[6]);
	D_Flip_Flop_4bit reg7(clk, enable[7], init, newD, 4'b1111, q[7]);
	

	read_ports_cam read1(q,D_Lookup,minAddr,maxAddr,valid);
	
	assign enable[0] = wen1[0] | wen2[0];
	assign enable[1] = wen1[1] | wen2[1];
	assign enable[2] = wen1[2] | wen2[2];
	assign enable[3] = wen1[3] | wen2[3];
	assign enable[4] = wen1[4] | wen2[4];
	assign enable[5] = wen1[5] | wen2[5];
	assign enable[6] = wen1[6] | wen2[6];
	assign enable[7] = wen1[7] | wen2[7];

	assign en = valid & setD;

	write_port wp1(maxAddr, en, wen1);
	write_port wp2(minAddr, en, wen2);
	
endmodule