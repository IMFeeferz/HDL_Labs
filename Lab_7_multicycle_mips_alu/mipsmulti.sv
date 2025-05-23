//-------------------------------------------------------
// mipsmulti.v
// David_Harris@hmc.edu 8 November 2005
// Update to SystemVerilog 17 Nov 2010 DMH
// Multicycle MIPS processor
//------------------------------------------------

module mips(input  logic        clk, reset,
            output logic [31:0] adr, writedata,
            output logic        memwrite,
            input  logic [31:0] readdata);

  logic        zero, pcen, irwrite, regwrite,
               alusrca, iord, memtoreg, regdst;
  logic [1:0]  alusrcb, pcsrc;
  logic [2:0]  alucontrol;
  logic [5:0]  op, funct;

  controller c(clk, reset, op, funct, zero,
               pcen, memwrite, irwrite, regwrite,
               alusrca, iord, memtoreg, regdst, 
               alusrcb, pcsrc, alucontrol);
  datapath dp(clk, reset, 
              pcen, irwrite, regwrite,
              alusrca, iord, memtoreg, regdst,
              alusrcb, pcsrc, alucontrol,
              op, funct, zero,
              adr, writedata, readdata);
endmodule

module controller(input  logic       clk, reset,
                  input  logic [5:0] op, funct,
                  input  logic       zero,
                  output logic       pcen, memwrite, irwrite, regwrite,
                  output logic       alusrca, iord, memtoreg, regdst,
                  output logic [1:0] alusrcb, pcsrc,
                  output logic [2:0] alucontrol);

  logic [1:0] aluop;
  logic       branch, pcwrite;
  logic	      z;// Part B and C

  // Main Decoder and ALU Decoder subunits.
  maindec md(clk, reset, op,
             pcwrite, memwrite, irwrite, regwrite,
             alusrca, branch, iord, memtoreg, regdst, 
             alusrcb, pcsrc, aluop);
  aludec  ad(funct, aluop, alucontrol);

  // ADD CODE HERE
  // Add combinational logic (i.e. an assign statement) 
  // to produce the PCEn signal (pcen) from the branch, 
  // zero, and pcwrite signals

  always_comb // Part B and C
    case(op)
       6'b000101: z = ~zero; // BNE
       6'b111111: z = ~zero;//BLE
       default:   z = zero; //BEQ
    endcase

  assign pcen = (branch & z) | pcwrite; 
endmodule

module maindec(input  logic       clk, reset, 
               input  logic [5:0] op, 
               output logic       pcwrite, memwrite, irwrite, regwrite,
               output logic       alusrca, branch, iord, memtoreg, regdst,
               output logic [1:0] alusrcb, pcsrc,
               output logic [1:0] aluop);

  logic [3:0]  state, nextstate;
  logic [14:0] controls;


  parameter   FETCH   = 4'b0000; 	// State 0
  parameter   DECODE  = 4'b0001; 	// State 1
  parameter   MEMADR  = 4'b0010;	// State 2
  parameter   MEMRD   = 4'b0011;	// State 3
  parameter   MEMWB   = 4'b0100;	// State 4
  parameter   MEMWR   = 4'b0101;	// State 5
  parameter   RTYPEEX = 4'b0110;	// State 6
  parameter   RTYPEWB = 4'b0111;	// State 7
  parameter   BEQEX   = 4'b1000;	// State 8
  parameter   ADDIEX  = 4'b1001;	// State 9
  parameter   ADDIWB  = 4'b1010;	// state 10
  parameter   JEX     = 4'b1011;	// State 11
  parameter   BLEEX   = 4'b1100;	// State 12
  

  parameter   LW      = 6'b100011;	// Opcode for lw
  parameter   SW      = 6'b101011;	// Opcode for sw
  parameter   RTYPE   = 6'b000000;	// Opcode for R-type
  parameter   BEQ     = 6'b000100;	// Opcode for beq
  parameter   ADDI    = 6'b001000;	// Opcode for addi
  parameter   J       = 6'b000010;	// Opcode for j 
  parameter   BLE     = 6'b111111;	// Opcode for ble 
 

 
  always_ff @(posedge clk or posedge reset)			
    	if(reset) state <= FETCH;
    	else state <= nextstate;

 

  // ADD CODE HERE
  // Finish entering the next state logic below.  We've completed the first 
  // two states, FETCH and DECODE, for you.

  // next state logic
  always_comb
    case(state)
      FETCH:   nextstate <= DECODE;
      DECODE:  case(op)
                 LW:      nextstate <= MEMADR;
                 SW:      nextstate <= MEMADR;
                 RTYPE:   nextstate <= RTYPEEX;
                 BEQ:     nextstate <= BEQEX;
                 ADDI:    nextstate <= ADDIEX;
                 J:       nextstate <= JEX;
		 BLE:     nextstate <= BLEEX;
                 default: nextstate <= 4'bx; // should never happen
               endcase
 		// Add code here
      MEMADR: case(op)
		LW:	nextstate <= MEMRD;
		SW:	nextstate <= MEMWR;
		default: nextstate <= 4'bx;
	      endcase
      MEMRD: nextstate <= MEMWB;
      MEMWB: nextstate <= FETCH;
      MEMWR: nextstate <= FETCH;
      RTYPEEX: nextstate <= RTYPEWB;
      RTYPEWB: nextstate <= FETCH;
      BEQEX:   nextstate <= FETCH;
      ADDIEX:  nextstate <= ADDIWB;
      ADDIWB:  nextstate <= FETCH;
      JEX:     nextstate <= FETCH;
      BLEEX:   nextstate <= FETCH;
      default: nextstate <= 4'bx; // should never happen
    endcase

  // output logic
  assign {pcwrite, memwrite, irwrite, regwrite, 
          alusrca, branch, iord, memtoreg, regdst,
          alusrcb, pcsrc, aluop} = controls;

  // ADD CODE HERE
  // Finish entering the output logic below.  We've entered the
  // output logic for the first two states, S0 and S1, for you.
  always_comb
    case(state)
      FETCH:   controls <= 15'h5010;
      DECODE:  controls <= 15'h0030;
    // your code goes here      
      MEMADR:   controls <= 15'h0420;
      MEMRD:   controls <= 15'h0100;
      MEMWB:   controls <= 15'h0880;
      MEMWR:   controls <= 15'h2100;
      RTYPEEX:   controls <= 15'h0402;
      RTYPEWB:   controls <= 15'h0840;
      BEQEX:   controls <= 15'h0605;
      ADDIEX:   controls <= 15'h0420;
      ADDIWB:   controls <= 15'h0800;
      JEX:   controls <= 15'h4008;  
      BLEEX:   controls <= 15'h0606;	 
      default: controls <= 15'hxxxx; // should never happen
    endcase
endmodule

module aludec(input  logic [5:0] funct,
              input  logic [1:0] aluop,
              output logic [2:0] alucontrol);

  // ADD CODE HERE
  // Complete the design for the ALU Decoder.
  // Your design goes here.  Remember that this is a combinational 
  // module. 

  // Remember that you may also reuse any code from previous labs.
  always_comb
  	case(aluop)
  		2'b00: alucontrol = 3'b010;  // add
      		2'b01: alucontrol = 3'b110;  // sub
      		2'b11: alucontrol = 3'b111;  //  SLTi
      		2'b10: case(funct)          // RTYPE        
         		6'b100000: alucontrol = 3'b010; // ADD
          		6'b100010: alucontrol = 3'b110; // SUB
          		6'b100100: alucontrol = 3'b000; // AND
          		6'b100101: alucontrol = 3'b001; // OR
	  		6'b101010: alucontrol = 3'b111; // SLT
          		6'b110110: alucontrol = 3'b111; // SLT/ble
	  		6'b101011: alucontrol = 3'b111; // SLT/sltu
	  		6'b000001: alucontrol = 3'b110; // bne-sub
          		default:   alucontrol = 3'bxxx; // ???   //
		endcase
        endcase

endmodule




// Complete the datapath module below for Lab 11.
// You do not need to complete this module for Lab 10

// The datapath unit is a structural verilog module.  That is,
// it is composed of instances of its sub-modules.  For example,
// the instruction register is instantiated as a 32-bit flopenr.
// The other submodules are likewise instantiated.

module datapath(input  logic        clk, reset,
                input  logic        pcen, irwrite, regwrite,
                input  logic        alusrca, iord, memtoreg, regdst,
                input  logic [1:0]  alusrcb, pcsrc, 
                input  logic [2:0]  alucontrol,
                output logic [5:0]  op, funct,
                output logic        zero,
                output logic [31:0] adr, writedata, 
                input  logic [31:0] readdata);

  // Below are the internal signals of the datapath module.

  logic [4:0]  writereg;
  logic [31:0] pcnext, pc;
  logic [31:0] instr, data, srca, srcb;
  logic [31:0] a;
  logic [31:0] aluresult, aluout;
  logic [31:0] signimm;   // the sign-extended immediate
  logic [31:0] signimmsh;	// the sign-extended immediate shifted left by 2
  logic [31:0] wd3, rd1, rd2;

  // op and funct fields to controller
  assign op = instr[31:26];
  assign funct = instr[5:0];

  // Your datapath hardware goes below.  Instantiate each of the submodules
  // that you need.  Remember that alu's, mux's and various other 
  // versions of parameterizable modules are available in mipsparts.sv
  // from Lab 9. You'll likely want to include this verilog file in your
  // simulation.

  // We've included parameterizable 3:1 and 4:1 muxes below for your use.

  // Remember to give your instantiated modules applicable names
  // such as pcreg (PC register), wdmux (Write Data Mux), etc.
  // so it's easier to understand.

  // ADD CODE HERE
  // next PC logic
  flopenr #(32) pcreg(clk, reset,pcen, pcnext, pc);
  mux2 #(32)  pcmux(pc, aluout, iord, adr);
  mux2 #(32)  srcamux(pc, a, alusrca, srca);
  

 // register file logic

  regfile     rf(clk, regwrite, instr[25:21],
                 instr[20:16], writereg,
                 wd3, rd1, rd2);
  flopenr #(32)  instrreg(clk, reset,irwrite, readdata, instr);
  flopr #(32)  wdreg(clk, reset, readdata, data);
  mux2 #(5)   wrmux(instr[20:16], instr[15:11], regdst, writereg);
  mux2 #(32)  wdmux(aluout, data, memtoreg, wd3);
  signext     se(instr[15:0], signimm);
  //flopr2 #(32) rfreg(clk, reset, rd1, rd2, a, writedata);
  flopr #(32) rfregA(clk, reset, rd1, a);
  flopr #(32) rfregB(clk, reset, rd2, writedata);

  // ALU logic
  mux4 #(32)   srcbmux(writedata, 32'b100, signimm, signimmsh, alusrcb, srcb);
  mips_alu          alu(.A(srca), .B(srcb), .F(alucontrol), .Y(aluresult), .Zero(zero));
  flopr #(32)  alureg(clk, reset, aluresult, aluout);
  mux3 #(32)   alumux(aluresult, aluout,{pc[31:28],instr[25:0],2'b00}, pcsrc, pcnext);
  sl2          immsh1(signimm, signimmsh);
  // datapath
  
endmodule


module mux3 #(parameter WIDTH = 8)
             (input  logic [WIDTH-1:0] d0, d1, d2,
              input  logic [1:0]       s, 
              output logic [WIDTH-1:0] y);

  assign #1 y = s[1] ? d2 : (s[0] ? d1 : d0); 
endmodule

module mux4 #(parameter WIDTH = 8)
             (input  logic [WIDTH-1:0] d0, d1, d2, d3,
              input  logic [1:0]       s, 
              output logic [WIDTH-1:0] y);

   always_comb
      case(s)
         2'b00: y <= d0;
         2'b01: y <= d1;
         2'b10: y <= d2;
         2'b11: y <= d3;
      endcase
endmodule
