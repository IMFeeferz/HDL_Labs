module testbench();
	logic clk, init, swap;
	logic [2:0] x, y;
	logic [3:0] r[7:0];

	//assign init = 1;
	
	//Instantiate Register File
	Register_File dut(clk, init, swap, x, y, r);

	initial
		begin
			

			//Cycle 1
			clk = 0;
			init = 1;
			swap = 0;
			x = 3'b000;
			y = 3'b111; #30;
			if (r[0] !== 4'b0000  && r[1]!==4'b0001 && r[2]!==4'b0010 && r[3] !== 4'b0011
			 && r[4] !== 4'b0100 && r[5] !== 4'b0101 && r[6] !== 4'b0110 && r[7] !== 4'b0111)
				$display("cycle 1 passed.");
//Test case 1
			//Test case 1-set r0-7
			clk = 1;
			init = 1;
			swap = 0;
			x = 3'b000;
			y = 3'b111; #30;
			if (r[0] !== 4'b0000  && r[1]!==4'b0001 && r[2]!==4'b0010 && r[3] !== 4'b0011
			 && r[4] !== 4'b0100 && r[5] !== 4'b0101 && r[6] !== 4'b0110 && r[7] !== 4'b0111)
				$display("set initial values failed.");
			// clock 
			clk = 0;
			init = 0;
			swap = 0;
			x = 3'b000;
			y = 3'b111; #30;
			if (r[0] !== 4'b0000  && r[1]!==4'b0001 && r[2]!==4'b0010 && r[3] !== 4'b0011
			 && r[4] !== 4'b0100 && r[5] !== 4'b0101 && r[6] !== 4'b0110 && r[7] !== 4'b0111)
				$display("clock edge");
			//
			
			//Test case 1-swap 0,7 
			clk = 1;
			init = 0;
			swap = 1;
			x = 3'b000;
			y = 3'b111; #30;
			if (r[0] !== 4'b0000  && r[1]!==4'b0001 && r[2]!==4'b0010 && r[3] !== 4'b0011
			 && r[4] !== 4'b0100 && r[5] !== 4'b0101 && r[6] !== 4'b0110 && r[7] !== 4'b0111)
				$display("0 and 7 not swapped");
			
			// clock
			clk = 0;
			init = 0;
			swap = 0;
			x = 3'b001;
			y = 3'b110; #30;
			if (r[0] !== 4'b0111  && r[1]!==4'b0001 && r[2]!==4'b0010 && r[3] !== 4'b0011
			 && r[4] !== 4'b0100 && r[5] !== 4'b0101 && r[6] !== 4'b0110 && r[7] !== 4'b0000)
				$display("clock edge. reset");
			//
			//Test case 1-swap 1,6
			clk = 1;
			init = 0;
			swap = 1;
			x = 3'b001;
			y = 3'b110; #30;
			if (r[0] !== 4'b0111  && r[1]!==4'b0110 && r[2]!==4'b0010 && r[3] !== 4'b0011
			 && r[4] !== 4'b0100 && r[5] !== 4'b0101 && r[6] !== 4'b0001 && r[7] !== 4'b0000)
				$display("1 and 6 not swapped.");
			//clock
			clk = 0;
			init = 0;
			swap = 0;
			x = 3'b010;
			y = 3'b101; #30;
			if (r[0] !== 4'b0111  && r[1]!==4'b0110 && r[2]!==4'b0010 && r[3] !== 4'b0011
			 && r[4] !== 4'b0100 && r[5] !== 4'b0101 && r[6] !== 4'b0001 && r[7] !== 4'b0000)
				$display("clock edge. reset");
			//Test case 1-swap 2,5
			clk = 1;
			init = 0;
			swap = 1;
			x = 3'b010;
			y = 3'b101; #30;
			if (r[0] !== 4'b0111  && r[1]!==4'b0110 && r[2]!==4'b0010 && r[3] !== 4'b0011
			 && r[4] !== 4'b0100 && r[5] !== 4'b0101 && r[6] !== 4'b0001 && r[7] !== 4'b0000)
				$display("2 and 5 not swapped.");
			//clock
			clk = 0;
			init = 0;
			swap = 0;
			x = 3'b011;
			y = 3'b100; #30;
			if (r[0] !== 4'b0111  && r[1]!==4'b0110 && r[2]!==4'b0010 && r[3] !== 4'b0011
			 && r[4] !== 4'b0100 && r[5] !== 4'b0101 && r[6] !== 4'b0001 && r[7] !== 4'b0000)
				$display("clock edge reset");
			//Test case 1-swap 3,4
			clk = 1;
			init = 0;
			swap = 1;
			x = 3'b011;
			y = 3'b100; #30;
			if (r[0] !== 4'b0111  && r[1]!==4'b0110 && r[2]!==4'b0101 && r[3] !== 4'b0100
			 && r[4] !== 4'b0011 && r[5] !== 4'b0010 && r[6] !== 4'b0001 && r[7] !== 4'b0000)
				$display("test case 1 failed.");
//TestCase 2
			//clock
			clk = 0;
			init = 0;
			swap = 0;
			x = 3'b000;
			y = 3'b001; #30;
			if (r[0] !== 4'b0111  && r[1]!==4'b0110 && r[2]!==4'b0101 && r[3] !== 4'b0100
			 && r[4] !== 4'b0011 && r[5] !== 4'b0010 && r[6] !== 4'b0001 && r[7] !== 4'b0000)
				$display("clock edge reset");
			//Test case 2-set r0-7
			clk = 1;
			init = 1;
			swap = 0;
			x = 3'b000;
			y = 3'b001; #30;
			if (r[0] !== 4'b0000  && r[1]!==4'b0001 && r[2]!==4'b0010 && r[3] !== 4'b0011
			 && r[4] !== 4'b0100 && r[5] !== 4'b0101 && r[6] !== 4'b0110 && r[7] !== 4'b0111)
				$display("set initial values failed.");
			// clock 
			clk = 0;
			init = 0;
			swap = 0;
			x = 3'b000;
			y = 3'b001; #30;
			if (r[0] !== 4'b0000  && r[1]!==4'b0001 && r[2]!==4'b0010 && r[3] !== 4'b0011
			 && r[4] !== 4'b0100 && r[5] !== 4'b0101 && r[6] !== 4'b0110 && r[7] !== 4'b0111)
				$display("clock edge");

			//Test case 2-swap 0,1
			clk = 1;
			init = 0;
			swap = 1;
			x = 3'b000;
			y = 3'b001; #30;
			if (r[0] !== 4'b0001  && r[1]!==4'b0000 && r[2]!==4'b0010 && r[3] !== 4'b0011
			 && r[4] !== 4'b0100 && r[5] !== 4'b0101 && r[6] !== 4'b0110 && r[7] !== 4'b0111)
				$display("0 and 1 not swapped");
			
			// clock
			clk = 0;
			init = 0;
			swap = 0;
			x = 3'b001;
			y = 3'b010; #30;
			if (r[0] !== 4'b0001  && r[1]!==4'b0000 && r[2]!==4'b0010 && r[3] !== 4'b0011
			 && r[4] !== 4'b0100 && r[5] !== 4'b0101 && r[6] !== 4'b0110 && r[7] !== 4'b0111)
				$display("clock edge. reset");
			//
			//Test case 2-swap 1,2
			clk = 1;
			init = 0;
			swap = 1;
			x = 3'b001;
			y = 3'b010; #30;
			if (r[0] !== 4'b0001  && r[1]!==4'b0010 && r[2]!==4'b0000 && r[3] !== 4'b0011
			 && r[4] !== 4'b0100 && r[5] !== 4'b0101 && r[6] !== 4'b0110 && r[7] !== 4'b0111)
				$display("1 and 2 not swapped.");
			//clock
			clk = 0;
			init = 0;
			swap = 0;
			x = 3'b010;
			y = 3'b011; #30;
			if (r[0] !== 4'b0001  && r[1]!==4'b0010 && r[2]!==4'b0000 && r[3] !== 4'b0011
			 && r[4] !== 4'b0100 && r[5] !== 4'b0101 && r[6] !== 4'b0110 && r[7] !== 4'b0111)
				$display("clock edge. reset");
			//Test case 2-swap 2,3
			clk = 1;
			init = 0;
			swap = 1;
			x = 3'b010;
			y = 3'b011; #30;
			if (r[0] !== 4'b0001  && r[1]!==4'b0010 && r[2]!==4'b0011 && r[3] !== 4'b0000
			 && r[4] !== 4'b0100 && r[5] !== 4'b0101 && r[6] !== 4'b0110 && r[7] !== 4'b0111)
				$display("2 and 5 not swapped.");
			//clock
			clk = 0;
			init = 0;
			swap = 0;
			x = 3'b011;
			y = 3'b100; #30;
			if (r[0] !== 4'b0001  && r[1]!==4'b0010 && r[2]!==4'b0011 && r[3] !== 4'b0000
			 && r[4] !== 4'b0100 && r[5] !== 4'b0101 && r[6] !== 4'b0110 && r[7] !== 4'b0111)
				$display("clock edge reset");
			//Test case 1-swap 3,4
			clk = 1;
			init = 0;
			swap = 1;
			x = 3'b011;
			y = 3'b100; #30;
			if (r[0] !== 4'b0001  && r[1]!==4'b0010 && r[2]!==4'b0011 && r[3] !== 4'b0100
			 && r[4] !== 4'b0000 && r[5] !== 4'b0101 && r[6] !== 4'b0110 && r[7] !== 4'b0111)
				$display("swap 3,4 failed.");
			//clock
			clk = 0;
			init = 0;
			swap = 0;
			x = 3'b100;
			y = 3'b101; #30;
			if (r[0] !== 4'b0001  && r[1]!==4'b0010 && r[2]!==4'b0011 && r[3] !== 4'b0100
			 && r[4] !== 4'b0000 && r[5] !== 4'b0101 && r[6] !== 4'b0110 && r[7] !== 4'b0111)
				$display("clock edge reset");
			//Test case 1-swap 4,5
			clk = 1;
			init = 0;
			swap = 1;
			x = 3'b100;
			y = 3'b101; #30;
			if (r[0] !== 4'b0001  && r[1]!==4'b0010 && r[2]!==4'b0011 && r[3] !== 4'b0100
			 && r[4] !== 4'b0101 && r[5] !== 4'b0000 && r[6] !== 4'b0110 && r[7] !== 4'b0111)
				$display("swap 4,5 failed.");
			//clock
			clk = 0;
			init = 0;
			swap = 0;
			x = 3'b101;
			y = 3'b110; #30;
			if (r[0] !== 4'b0001  && r[1]!==4'b0010 && r[2]!==4'b0011 && r[3] !== 4'b0100
			 && r[4] !== 4'b0101 && r[5] !== 4'b0000 && r[6] !== 4'b0110 && r[7] !== 4'b0111)
				$display("clock edge reset");
			//Test case 1-swap 5,6
			clk = 1;
			init = 0;
			swap = 1;
			x = 3'b101;
			y = 3'b110; #30;
			if (r[0] !== 4'b0001  && r[1]!==4'b0010 && r[2]!==4'b0011 && r[3] !== 4'b0100
			 && r[4] !== 4'b0101 && r[5] !== 4'b0110 && r[6] !== 4'b0000  && r[7] !== 4'b0111)
				$display("swap 5,6 failed.");
			//clock
			clk = 0;
			init = 0;
			swap = 0;
			x = 3'b110;
			y = 3'b111; #30;
			if (r[0] !== 4'b0001  && r[1]!==4'b0010 && r[2]!==4'b0011 && r[3] !== 4'b0100
			 && r[4] !== 4'b0101 && r[5] !== 4'b0110 && r[6] !== 4'b0000  && r[7] !== 4'b0111)
				$display("clock edge reset");
			//Test case 1-swap 6,7
			clk = 1;
			init = 0;
			swap = 1;
			x = 3'b110;
			y = 3'b111; #30;
			if (r[0] !== 4'b0001  && r[1]!==4'b0010 && r[2]!==4'b0011 && r[3] !== 4'b0100
			 && r[4] !== 4'b0101 && r[5] !== 4'b0110 && r[6] !== 4'b0111  && r[7] !== 4'b0000)
				$display("test case 2 failed.");
//TestCase3
			//clock
			clk = 0;
			init = 0;
			swap = 0;
			x = 3'b011;
			y = 3'b100; #30;
			if (r[0] !== 4'b0111  && r[1]!==4'b0110 && r[2]!==4'b0101 && r[3] !== 4'b0100
			 && r[4] !== 4'b0011 && r[5] !== 4'b0010 && r[6] !== 4'b0001 && r[7] !== 4'b0000)
				$display("clock edge reset");
			//Test case 3-set r0-7
			clk = 1;
			init = 1;
			swap = 0;
			x = 3'b000;
			y = 3'b111; #30;
			if (r[0] !== 4'b0000  && r[1]!==4'b0001 && r[2]!==4'b0010 && r[3] !== 4'b0011
			 && r[4] !== 4'b0100 && r[5] !== 4'b0101 && r[6] !== 4'b0110 && r[7] !== 4'b0111)
				$display("set initial values failed.");
			//clock
			clk = 0;
			init = 0;
			swap = 0;
			x = 3'b000;
			y = 3'b011; #30;
			if (r[0] !== 4'b0000  && r[1]!==4'b0001 && r[2]!==4'b0010 && r[3] !== 4'b0011
			 && r[4] !== 4'b0100 && r[5] !== 4'b0101 && r[6] !== 4'b0110 && r[7] !== 4'b0111)
				$display("clock edge reset");
			//Test case 3-swap r0-r3
			clk = 1;
			init = 0;
			swap = 1;
			x = 3'b000;
			y = 3'b011; #30;
			if (r[0] !== 4'b0011  && r[1]!==4'b0001 && r[2]!==4'b0010 && r[3] !== 4'b0000
			 && r[4] !== 4'b0100 && r[5] !== 4'b0101 && r[6] !== 4'b0110 && r[7] !== 4'b0111)
				$display("swap r0-r3 failed.");
			//clock
			clk = 0;
			init = 0;
			swap = 0;
			x = 3'b010;
			y = 3'b110; #30;
			if (r[0] !== 4'b0011  && r[1]!==4'b0001 && r[2]!==4'b0010 && r[3] !== 4'b0000
			 && r[4] !== 4'b0100 && r[5] !== 4'b0101 && r[6] !== 4'b0110 && r[7] !== 4'b0111)
				$display("clock edge reset");
			//Test case 3-swap r2-r6
			clk = 1;
			init = 0;
			swap = 1;
			x = 3'b010;
			y = 3'b110; #30;
			if (r[0] !== 4'b0011  && r[1]!==4'b0001 && r[2]!== 4'b0110 && r[3] !== 4'b0000
			 && r[4] !== 4'b0100 && r[5] !== 4'b0101 && r[6] !== 4'b0010 && r[7] !== 4'b0111)
				$display("swap r2-r6 failed.");
			//clock
			clk = 0;
			init = 0;
			swap = 0;
			x = 3'b101;
			y = 3'b111; #30;
			if (r[0] !== 4'b0011  && r[1]!==4'b0001 && r[2]!== 4'b0110 && r[3] !== 4'b0000
			 && r[4] !== 4'b0100 && r[5] !== 4'b0101 && r[6] !== 4'b0010 && r[7] !== 4'b0111)
				$display("clock edge reset");
			//Test case 3-swap r5-r7
			clk = 1;
			init = 0;
			swap = 1;
			x = 3'b101;
			y = 3'b111; #30;
			if (r[0] !== 4'b0011  && r[1]!==4'b0001 && r[2]!== 4'b0110 && r[3] !== 4'b0000
			 && r[4] !== 4'b0100 && r[5] !== 4'b0111 && r[6] !== 4'b0010 && r[7] !== 4'b0101)
				$display("swap r5-r7 failed.");
			//clock
			clk = 0;
			init = 0;
			swap = 0;
			x = 3'b011;
			y = 3'b100; #30;
			if (r[0] !== 4'b0011  && r[1]!==4'b0001 && r[2]!== 4'b0110 && r[3] !== 4'b0000
			 && r[4] !== 4'b0100 && r[5] !== 4'b0111 && r[6] !== 4'b0010 && r[7] !== 4'b0101)
				$display("clock edge reset");
			//Test case 3-swap r3-r4
			clk = 1;
			init = 0;
			swap = 1;
			x = 3'b011;
			y = 3'b100; #30;
			if (r[0] !== 4'b0011  && r[1]!==4'b0001 && r[2]!== 4'b0110 && r[3] !== 4'b0100
			 && r[4] !== 4'b0000 && r[5] !== 4'b0111 && r[6] !== 4'b0010 && r[7] !== 4'b0101)
				$display("swap r3-r4 failed.");
			//clock
			clk = 0;
			init = 0;
			swap = 0;
			x = 3'b010;
			y = 3'b111; #30;
			if (r[0] !== 4'b0011  && r[1]!==4'b0001 && r[2]!== 4'b0110 && r[3] !== 4'b0100
			 && r[4] !== 4'b0000 && r[5] !== 4'b0111 && r[6] !== 4'b0010 && r[7] !== 4'b0101)
				$display("clock edge reset");
			//Test case 3-swap r2-r7
			clk = 1;
			init = 0;
			swap = 1;
			x = 3'b010;
			y = 3'b111; #30;
			if (r[0] !== 4'b0011  && r[1]!==4'b0001 && r[2]!== 4'b0101 && r[3] !== 4'b0100
			 && r[4] !== 4'b0000 && r[5] !== 4'b0111 && r[6] !== 4'b0010 && r[7] !== 4'b0110 )
				$display("swap r2-r7 failed.");
			//clock
			clk = 0;
			init = 0;
			swap = 0;
			x = 3'b011;
			y = 3'b111; #30;
			if (r[0] !== 4'b0011  && r[1]!==4'b0001 && r[2]!== 4'b0101 && r[3] !== 4'b0100
			 && r[4] !== 4'b0000 && r[5] !== 4'b0111 && r[6] !== 4'b0010 && r[7] !== 4'b0110 )
				$display("clock edge reset");
			//Test case 3-swap r3-r7
			clk = 1;
			init = 0;
			swap = 1;
			x = 3'b011;
			y = 3'b111; #30;
			if (r[0] !== 4'b0011  && r[1]!==4'b0001 && r[2]!== 4'b0101 && r[3] !== 4'b0110
			 && r[4] !== 4'b0000 && r[5] !== 4'b0111 && r[6] !== 4'b0010 && r[7] !== 4'b0100 )
				$display("test case 3 swap r3-r7 failed.");
		end
endmodule
