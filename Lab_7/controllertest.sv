module controllertest();
  logic       clk, reset;
  logic [5:0] op, funct;
  logic       zero;
  logic       pcen, memwrite, irwrite, regwrite;
  logic       alusrca, iord, memtoreg, regdst;
  logic [1:0] alusrcb, pcsrc;
  logic [2:0] alucontrol;

  // instantiate device to be tested
  controller dut(clk, reset, op, funct, zero, pcen, memwrite, irwrite, regwrite, alusrca, iord, memtoreg, regdst,alusrcb, pcsrc, alucontrol);
  initial begin
//add, sub, and, or, slt, lw, sw, beq, addi, and j
	clk=0; reset=0; op= 6'b000000 ; funct=6'b000000; zero = 0 ; #10;//init
	clk=1; reset=1; op= 6'b000000 ; funct=6'b000000; zero = 0 ; #10;//
	clk=0; reset=0; op= 6'b000000 ; funct=6'b100000; zero = 0 ; #10;//add
	clk=1; reset=0; op= 6'b000000 ; funct=6'b100000; zero = 0 ; #10;//add
	clk=0; reset=0; op= 6'b000000 ; funct=6'b100000; zero = 0 ; #10;//add
	clk=1; reset=0; op= 6'b000000 ; funct=6'b100000; zero = 0 ; #10;//add
	clk=0; reset=0; op= 6'b000000 ; funct=6'b100000; zero = 0 ; #10;//add
	clk=1; reset=0; op= 6'b000000 ; funct=6'b100000; zero = 0 ; #10;//add
	
	clk=0; reset=0; op= 6'b000000 ; funct=6'b100010; zero = 0 ; #10;//sub
	clk=1; reset=0; op= 6'b000000 ; funct=6'b100010; zero = 0 ; #10;//sub
	clk=0; reset=0; op= 6'b000000 ; funct=6'b100010; zero = 0 ; #10;//sub
	clk=1; reset=0; op= 6'b000000 ; funct=6'b100010; zero = 0 ; #10;//sub
	clk=0; reset=0; op= 6'b000000 ; funct=6'b100010; zero = 0 ; #10;//sub
	clk=1; reset=0; op= 6'b000000 ; funct=6'b100010; zero = 0 ; #10;//sub
	clk=0; reset=0; op= 6'b000000 ; funct=6'b100010; zero = 0 ; #10;//sub
	clk=1; reset=0; op= 6'b000000 ; funct=6'b100010; zero = 0 ; #10;//sub

	clk=0; reset=0; op= 6'b000000 ; funct=6'b100100; zero = 0 ; #10;//and
	clk=1; reset=0; op= 6'b000000 ; funct=6'b100100; zero = 0 ; #10;//and
	clk=0; reset=0; op= 6'b000000 ; funct=6'b100100; zero = 0 ; #10;//and
	clk=1; reset=0; op= 6'b000000 ; funct=6'b100100; zero = 0 ; #10;//and
	clk=0; reset=0; op= 6'b000000 ; funct=6'b100100; zero = 0 ; #10;//and
	clk=1; reset=0; op= 6'b000000 ; funct=6'b100100; zero = 0 ; #10;//and
	clk=0; reset=0; op= 6'b000000 ; funct=6'b100100; zero = 0 ; #10;//and
	clk=1; reset=0; op= 6'b000000 ; funct=6'b100100; zero = 0 ; #10;//and

	clk=0; reset=0; op= 6'b000000 ; funct=6'b100101; zero = 0 ; #10;//or
	clk=1; reset=0; op= 6'b000000 ; funct=6'b100101; zero = 0 ; #10;//or
	clk=0; reset=0; op= 6'b000000 ; funct=6'b100101; zero = 0 ; #10;//or
	clk=1; reset=0; op= 6'b000000 ; funct=6'b100101; zero = 0 ; #10;//or
	clk=0; reset=0; op= 6'b000000 ; funct=6'b100101; zero = 0 ; #10;//or
	clk=1; reset=0; op= 6'b000000 ; funct=6'b100101; zero = 0 ; #10;//or
	clk=0; reset=0; op= 6'b000000 ; funct=6'b100101; zero = 0 ; #10;//or
	clk=1; reset=0; op= 6'b000000 ; funct=6'b100101; zero = 0 ; #10;//or

	clk=0; reset=0; op= 6'b000000 ; funct=6'b101010; zero = 0 ; #10;//slt
	clk=1; reset=0; op= 6'b000000 ; funct=6'b101010; zero = 0 ; #10;//slt
	clk=0; reset=0; op= 6'b000000 ; funct=6'b101010; zero = 0 ; #10;//slt
	clk=1; reset=0; op= 6'b000000 ; funct=6'b101010; zero = 0 ; #10;//slt
	clk=0; reset=0; op= 6'b000000 ; funct=6'b101010; zero = 0 ; #10;//slt
	clk=1; reset=0; op= 6'b000000 ; funct=6'b101010; zero = 0 ; #10;//slt
	clk=0; reset=0; op= 6'b000000 ; funct=6'b101010; zero = 0 ; #10;//slt
	clk=1; reset=0; op= 6'b000000 ; funct=6'b101010; zero = 0 ; #10;//slt

	clk=0; reset=0; op= 6'b100011 ; funct=6'b110000; zero = 0 ; #10;//lw
	clk=1; reset=0; op= 6'b100011 ; funct=6'b110000; zero = 0 ; #10;//lw
	clk=0; reset=0; op= 6'b100011 ; funct=6'b110000; zero = 0 ; #10;//lw
	clk=1; reset=0; op= 6'b100011 ; funct=6'b110000; zero = 0 ; #10;//lw
	clk=0; reset=0; op= 6'b100011 ; funct=6'b110000; zero = 0 ; #10;//lw
	clk=1; reset=0; op= 6'b100011 ; funct=6'b110000; zero = 0 ; #10;//lw
	clk=0; reset=0; op= 6'b100011 ; funct=6'b110000; zero = 0 ; #10;//lw
	clk=1; reset=0; op= 6'b100011 ; funct=6'b110000; zero = 0 ; #10;//lw
	clk=0; reset=0; op= 6'b100011 ; funct=6'b110000; zero = 0 ; #10;//lw
	clk=1; reset=0; op= 6'b100011 ; funct=6'b110000; zero = 0 ; #10;//lw

	clk=0; reset=0; op= 6'b101011 ; funct=6'b000100; zero = 0 ; #10;//sw
	clk=1; reset=0; op= 6'b101011 ; funct=6'b000100; zero = 0 ; #10;//sw
	clk=0; reset=0; op= 6'b101011 ; funct=6'b000100; zero = 0 ; #10;//sw
	clk=1; reset=0; op= 6'b101011 ; funct=6'b000100; zero = 0 ; #10;//sw
	clk=0; reset=0; op= 6'b101011 ; funct=6'b000100; zero = 0 ; #10;//sw
	clk=1; reset=0; op= 6'b101011 ; funct=6'b000100; zero = 0 ; #10;//sw
	clk=0; reset=0; op= 6'b101011 ; funct=6'b000100; zero = 0 ; #10;//sw
	clk=1; reset=0; op= 6'b101011 ; funct=6'b000100; zero = 0 ; #10;//sw

	clk=0; reset=0; op= 6'b000100 ; funct=6'b001010; zero = 0 ; #10;//beq
	clk=1; reset=0; op= 6'b000100 ; funct=6'b001010; zero = 0 ; #10;//beq
	clk=0; reset=0; op= 6'b000100 ; funct=6'b001010; zero = 0 ; #10;//beq
	clk=1; reset=0; op= 6'b000100 ; funct=6'b001010; zero = 0 ; #10;//beq
	clk=0; reset=0; op= 6'b000100 ; funct=6'b001010; zero = 0 ; #10;//beq
	clk=1; reset=0; op= 6'b000100 ; funct=6'b001010; zero = 0 ; #10;//beq

	clk=0; reset=0; op= 6'b001000 ; funct=6'b000000; zero = 0 ; #10;//addi
	clk=1; reset=0; op= 6'b001000 ; funct=6'b000000; zero = 0 ; #10;//addi
	clk=0; reset=0; op= 6'b001000 ; funct=6'b000000; zero = 0 ; #10;//addi
	clk=1; reset=0; op= 6'b001000 ; funct=6'b000000; zero = 0 ; #10;//addi
	clk=0; reset=0; op= 6'b001000 ; funct=6'b000000; zero = 0 ; #10;//addi
	clk=1; reset=0; op= 6'b001000 ; funct=6'b000000; zero = 0 ; #10;//addi
	clk=0; reset=0; op= 6'b001000 ; funct=6'b000000; zero = 0 ; #10;//addi
	clk=1; reset=0; op= 6'b001000 ; funct=6'b000000; zero = 0 ; #10;//addi
	
	clk=0; reset=0; op= 6'b000010 ; funct=6'b000000; zero = 0 ; #10;//j
	clk=1; reset=0; op= 6'b000010 ; funct=6'b000000; zero = 0 ; #10;//j
	clk=0; reset=0; op= 6'b000010 ; funct=6'b000000; zero = 0 ; #10;//j
	clk=1; reset=0; op= 6'b000010 ; funct=6'b000000; zero = 0 ; #10;//j
	clk=0; reset=0; op= 6'b000010 ; funct=6'b000000; zero = 0 ; #10;//j
	clk=1; reset=0; op= 6'b000010 ; funct=6'b000000; zero = 0 ; #10;//j
	clk=0; reset=0; op= 6'b000010 ; funct=6'b000000; zero = 0 ; #10;//j
  end
endmodule
