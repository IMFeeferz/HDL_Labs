module MUX_8_1(	input logic [3:0] q[7:0],
		input logic [2:0] s,
		output logic [3:0] read_data);
	/*
	MUX_2(	input logic [3:0] d0, d1,
		input logic s,
		output logic [3:0] y);
	*/
	// first line of MUX with s[0]
	always_comb
		case(s)
			3'b000:read_data=q[0];
			3'b001:read_data=q[1]; 
			3'b010:read_data=q[2];
			3'b011:read_data=q[3];
			3'b100:read_data=q[4];
			3'b101:read_data=q[5];
			3'b110:read_data=q[6];
			3'b111:read_data=q[7];
		endcase
endmodule
