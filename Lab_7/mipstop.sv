//------------------------------------------------
// Top level system including MIPS and memories
//------------------------------------------------

module top(input  logic       clk, reset, 
           output logic [31:0] writedata, adr, 
           output logic       memwrite);

  logic [31:0] readdata;
  
  // instantiate processor and memories

  mips mips(clk, reset, adr, writedata, memwrite, readdata);

  //imem imem(pc[7:2], instr);

  mem mem(clk, memwrite, adr, writedata ,readdata);

endmodule
