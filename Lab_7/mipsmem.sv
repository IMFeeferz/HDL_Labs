// External memories used by MIPS single-cycle processor

module mem(input  logic        clk, we,
            input  logic [31:0] a, wd,
            output logic [31:0] rd);

   logic [31:0] RAM[63:0];

   initial 
	begin
     		$readmemh("memfile_c.dat",RAM); // initialize memory 
   	end

    assign rd = RAM[a[31:2]]; // word aligned

   always @(posedge clk )
   if (we)
        RAM[a[31:2]] <= wd;
     
      
endmodule
