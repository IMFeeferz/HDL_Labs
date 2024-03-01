module testbench();
	logic clk, init, swap;
	logic [2:0] x, y;
	logic [3:0] r[7:0];

	//assign init = 1;
	
	//Instantiate Register File
	register_file dut(clk, init, swap, x, y, r);

	initial
		begin
			//Test case 1
			clk = 0;
			init = 0;
			swap = 1;
			x = 3'b000;
			y = 3'b111; #10;
			if (r[0] !== 4'b0000  && r[1]!==4'b0001 && r[2]!==4'b0010 && r[3] !== 4'b0011
			 && r[4] !== 4'b0100 && r[5] !== 4'b0101 && r[6] !== 4'b0110 && r[7] !== 4'b0111)
				$display("cycle 1 passed.");
			
			//Test case 2
			clk = 1;
			init = 0;
			swap = 1;
			x = 3'b000;
			y = 3'b111; #10;
			if (r[0] !== 4'b0000  && r[1]!==4'b0001 && r[2]!==4'b0010 && r[3] !== 4'b0011
			 && r[4] !== 4'b0100 && r[5] !== 4'b0101 && r[6] !== 4'b0110 && r[7] !== 4'b0111)
				$display("cycle 2 passed.");
			
			//Test case 3
			clk = 0;
			init = 1;
			swap = 1;
			x = 3'b000;
			y = 3'b111; #10;
			if (r[0] !== 4'b0000  && r[1]!==4'b0001 && r[2]!==4'b0010 && r[3] !== 4'b0011
			 && r[4] !== 4'b0100 && r[5] !== 4'b0101 && r[6] !== 4'b0110 && r[7] !== 4'b0111)
				$display("cylce 3 passed.");

			//Test case 4
			clk = 1;
			init = 1;
			swap = 1;
			x = 3'b000;
			y = 3'b111; #10;
			if (r[0] !== 4'b0000  && r[1]!==4'b0001 && r[2]!==4'b0010 && r[3] !== 4'b0011
			 && r[4] !== 4'b0100 && r[5] !== 4'b0101 && r[6] !== 4'b0110 && r[7] !== 4'b0111)
				$display("test 4 failed.");
		end
endmodule
