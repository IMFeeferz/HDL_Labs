module MUX_8_1(	input logic [3:0] q[7:0],
		input logic [2:0] s,
		output logic [3:0] read_data);
	/*
	MUX_2(	input logic [3:0] d0, d1,
		input logic s,
		output logic [3:0] y);
	*/
	// first line of MUX with s[0]
	MUX_2 mux_1(q[0], q[1], s[0], out_1);
	MUX_2 mux_2(q[2], q[3], s[0], out_2);
	MUX_2 mux_3(q[4], q[5], s[0], out_3);
	MUX_2 mux_4(q[6], q[7], s[0], out_4);
	
	// second line of MUX with s[1]
	MUX_2 mux_5(out_1, out_2, s[1], out_5);
	MUX_2 mux_6(out_3, out_4, s[1], out_6);

	// final line of MUX with s[2]
	MUX_2 mux_7(out_5, out_6, s[2], read_data);
endmodule
