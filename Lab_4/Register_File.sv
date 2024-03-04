module D_Flip_Flop_4bit	(input logic clk, en, reset,
		 	input logic [3:0] d, ri,
		 	output logic [3:0] q);

	// asynchronous reset
	always_ff @(posedge clk)
		if (reset) q <= ri;
		else if (en) q = d;


endmodule
	
module Register_File(	input logic clk, init, swap,
			input logic [2:0] x, y,
			output logic [3:0] r[7:0]);	
	logic [3:0]z[7:0];
	logic [3:0]d[7:0];
	logic [3:0] x_swap,y_swap,rd_data1,rd_data2;
	//logic [2:0] wrt_addr, rd_addr;
	logic reset, d_en[7:0];
	assign reset = init;
	
	//write ports
	two_write_ports write(x,y,x_swap,y_swap,d,d_en);

	// D Flip Flops r0-r7
	D_Flip_Flop_4bit reg0(clk, d_en[0], reset, d[0], 4'b0000, z[0]);
	D_Flip_Flop_4bit reg1(clk, d_en[1], reset, d[1], 4'b0001, z[1]);
	D_Flip_Flop_4bit reg2(clk, d_en[2], reset, d[2], 4'b0010, z[2]);
	D_Flip_Flop_4bit reg3(clk, d_en[3], reset, d[3], 4'b0011, z[3]);
	D_Flip_Flop_4bit reg4(clk, d_en[4], reset, d[4], 4'b0100, z[4]);
	D_Flip_Flop_4bit reg5(clk, d_en[5], reset, d[5], 4'b0101, z[5]);
	D_Flip_Flop_4bit reg6(clk, d_en[6], reset, d[6], 4'b0110, z[6]);
	D_Flip_Flop_4bit reg7(clk, d_en[7], reset, d[7], 4'b0111, z[7]);

	assign r=z;
	//Instantiating MUX for read ports
	MUX_8_1 rd_port1(z, x, rd_data1);
	MUX_8_1 rd_port2(z, y, rd_data2);
	
	//swap module
	swap_xy swap1(rd_data1,rd_data2,swap,x_swap,y_swap);

	
endmodule
