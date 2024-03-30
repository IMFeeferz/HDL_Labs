module q0( input logic d[7:0],
	   output logic q);
	logic AND1 = d[0] & ~d[1];
	logic AND2 = ~d[0] & ~d[1] & ~d[2] & d[3];
	logic AND3 = ~d[0] & ~d[1] & ~d[2] & ~d[3] & ~d[4] & d[5];
	logic AND4 = ~d[0] & ~d[1] & ~d[2] & ~d[3] & ~d[4] & ~d[5] & ~d[6] & d[7];
	assign q = AND1 | AND2 | AND3 | AND4;
endmodule

module q1( input logic d[7:0],
	   output logic q);
	logic AND1 = ~d[0] & ~d[1] & d[3];
	logic AND2 = ~d[0] & ~d[1] & d[2];
	logic AND3 = ~d[0] & ~d[1] & ~d[2] & ~d[3] & ~d[4] & ~d[5] & d[7];
	logic AND4 = ~d[0] & ~d[1] & ~d[2] & ~d[3] & ~d[4] & ~d[5] & d[6];
	assign q = AND1 | AND2 | AND3 | AND4;
endmodule

module q2( input logic d[7:0],
	   output logic q);
	logic AND1 = ~d[0] & ~d[1] & ~d[2] & ~d[3] & d[5];
	logic AND2 = ~d[0] & ~d[1] & ~d[2] & ~d[3] & d[4];
	logic AND3 = ~d[0] & ~d[1] & ~d[2] & ~d[3] & ~d[4] & ~d[5] & d[7];
	logic AND4 = ~d[0] & ~d[1] & ~d[2] & ~d[3] & ~d[4] & ~d[5] & d[6];
	assign q = AND1 | AND2 | AND3 | AND4;
endmodule

module lowest_priority_encoder( input logic d[7:0],
				output logic [2:0] q);
	q0 q_zero(d, q[0]);
	q1 q_one(d, q[1]);
	q2 q_two(d, q[2]);
	
endmodule
