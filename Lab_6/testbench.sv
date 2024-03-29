module testbench();
	 	logic clk, init;
		logic [3:0] D_Lookup;
		logic [3:0] newD;
		logic valid;
		logic [3:0] z[7:0];	
	//Instantiate Register File
	CAM_File dut(clk, init, D_Lookup, newD, valid, z);

	initial
		begin
		
			//Cycle 1
			clk = 0;
			init = 0;
			D_Lookup = 4'b1011;
			newD= 4'b1111;#30

			//Cycle 2
			clk = 1;
			init = 1;
			D_Lookup = 4'b1011;
			newD= 4'b1111; #30;

			//Cycle 3
			clk = 1;
			init = 1;
			D_Lookup = 4'b0000;
			newD= 4'b1111; #30;

			
		end
endmodule