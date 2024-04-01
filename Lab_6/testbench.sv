module testbench();
	 	logic clk, init;
		logic [3:0] D_Lookup;
		logic setD;
		logic [3:0] newD;
		logic valid;
		logic [2:0] minAddr,maxAddr;
		logic [3:0] q[7:0];	
	//Instantiate Register File
	CAM_File dut(clk, init, D_Lookup, setD, newD, valid, minAddr, maxAddr, q);

	initial
		begin
		
			//Cycle 1
			clk = 0;
			init = 1;
			D_Lookup = 4'b0000;
			setD = 0;
			newD = 4'b0000;#30

			//Cycle 2
			clk = 1;
			init = 1;
			D_Lookup = 4'b0000;
			setD = 0;
			newD= 4'b0000; #30;

			//Cycle 3
			clk = 0;
			init = 0;
			D_Lookup = 4'b1011;
			setD = 0;
			newD= 4'b0000; #30;
			
			//Cycle 4
			clk = 1;
			init = 0;
			D_Lookup = 4'b1011;
			setD = 0;
			newD= 4'b0000; #30;

			//Cycle 5
			clk = 0;
			init = 0;
			D_Lookup = 4'b1011;
			setD = 1;
			newD= 4'b1110; #30;

			//Cycle 6
			clk = 1;
			init = 0;
			D_Lookup = 4'b1011;
			setD = 1;
			newD= 4'b1110; #30;
			
			//Cycle 7
			clk = 0;
			init = 0;
			D_Lookup = 4'b1110;
			setD = 0;
			newD= 4'b0000; #30;

			//Cycle 8
			clk = 1;
			init = 0;
			D_Lookup = 4'b1110;
			setD = 0;
			newD= 4'b0000; #30;

			//Cycle 9
			clk = 0;
			init = 0;
			D_Lookup = 4'b1011;
			setD = 0;
			newD= 4'b0000; #30;

			//Cycle 10
			clk = 1;
			init = 0;
			D_Lookup = 4'b1011;
			setD = 0;
			newD= 4'b0000; #30;

			//Cycle 11
			clk = 0;
			init = 0;
			D_Lookup = 4'b1110;
			setD = 1;
			newD= 4'b1010; #30;

			//Cycle 12
			clk = 1;
			init = 0;
			D_Lookup = 4'b1110;
			setD = 1;
			newD= 4'b1010; #30;

			//Cycle 13
			clk = 0;
			init = 0;
			D_Lookup = 4'b1010;
			setD = 0;
			newD= 4'b0000; #30;
			
			//Cycle 14
			clk = 1;
			init = 0;
			D_Lookup = 4'b1010;
			setD = 0;
			newD= 4'b0000; #30;
		end
endmodule