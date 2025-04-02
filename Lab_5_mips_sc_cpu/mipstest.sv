// Example testbench for MIPS processor

module testbench();

  logic        clk;
  logic        reset;

  logic [31:0] writedata, dataadr;
  logic        memwrite;

  // instantiate device to be tested
  top dut(clk, reset, writedata, dataadr, memwrite);
  
  // initialize test
  initial
    begin
      reset <= 1; # 22; reset <= 0;
    end

  // generate clock to sequence tests
  always
    begin
      clk <= 1; # 5; clk <= 0; # 5;
    end

  // check that 28 gets written to address 20
  always@(negedge clk)
    begin
      if(memwrite) begin
        if(dataadr === 16 & writedata === -6) begin
          $display("Simulation succeeded");
          $stop;
        end else if (dataadr !== 40) begin
          $display("Simulation failed");
          $stop;
        end
      end
    end
endmodule



