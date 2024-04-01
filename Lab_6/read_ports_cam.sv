module Lookup(	input [3:0] qi,
		input [3:0]lookup,
		output match );
	 	assign match = ~(qi[0]^lookup[0]) & ~(qi[1]^lookup[1]) & ~(qi[2]^lookup[2])& ~(qi[3]^lookup[3]);

endmodule


module priority_enc(	input logic  m [7:0],
			output logic [2:0] a);
	logic [7:0]c;
	assign c={m[7],m[6],m[5],m[4],m[3],m[2],m[1],m[0]};
	always_comb
		casez(c)
			8'b00000001:a=3'b000;
			8'b0000001?:a=3'b001; 
			8'b000001??:a=3'b010;
			8'b00001???:a=3'b011;
			8'b0001????:a=3'b100;
			8'b001?????:a=3'b101;
			8'b01??????:a=3'b110;
			8'b1???????:a=3'b111;
		endcase
endmodule

module lowest_priority_encoder(	input logic m[7:0],
				output logic [2:0] a );
	logic [7:0]q;
	assign q={m[7],m[6],m[5],m[4],m[3],m[2],m[1],m[0]};
	always_comb
		casez(q)
			8'b???????1:a=3'b000;
			8'b??????10:a=3'b001; 
			8'b?????100:a=3'b010;
			8'b????1000:a=3'b011;
			8'b???10000:a=3'b100;
			8'b??100000:a=3'b101;
			8'b?1000000:a=3'b110;
			8'b10000000:a=3'b111;
		endcase

endmodule

module read_ports_cam(	input logic [3:0] q[7:0],
			input [3:0]D_Lookup,
			output logic [2:0] minA,
			output logic [2:0] maxA,
			output logic valid );
	
	
	logic ma[7:0];
	
	Lookup l0(q[0],D_Lookup,ma[0]);
	Lookup l1(q[1],D_Lookup,ma[1]);
	Lookup l2(q[2],D_Lookup,ma[2]);
	Lookup l3(q[3],D_Lookup,ma[3]);
	Lookup l4(q[4],D_Lookup,ma[4]);
	Lookup l5(q[5],D_Lookup,ma[5]);
	Lookup l6(q[6],D_Lookup,ma[6]);
	Lookup l7(q[7],D_Lookup,ma[7]);
	
	lowest_priority_encoder lpe1(ma,minA);
	priority_enc pe1(ma,maxA);
	
	assign valid = ma[0] | ma[1] | ma[2] | ma[3] | ma[4] | ma[5] | ma[6] | ma[7]  ;

endmodule