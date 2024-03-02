module two_write_ports( input logic [2:0] write_addr_1, write_addr_2,
			input logic [3:0] write_data_1, write_data_2,
			input logic en_1, en_2,
			output logic [3:0] d[7:0],
			output logic w_en_1[7:0], w_en_2[7:0]);
	
	// Calling write_port function
	write_port port_1(write_addr_1, en_1, w_en_1);
	write_port port_2(write_addr_2, en_2, w_en_2);
	
	// Calling write_enable funtion
	/*
	 write_enable(	input logic [3:0] x, y,
			input logic x_en, y_en,
			output logic [3:0] D,
			output logic en);
	*/
	write_enable wrt_en_0(write_data_1, write_data_2, w_en_1[0], w_en_2[0], d[0], en0);
	write_enable wrt_en_1(write_data_1, write_data_2, w_en_1[1], w_en_2[1], d[1], en1);
	write_enable wrt_en_2(write_data_1, write_data_2, w_en_1[2], w_en_2[2], d[2], en2);
	write_enable wrt_en_3(write_data_1, write_data_2, w_en_1[3], w_en_2[3], d[3], en3);
	write_enable wrt_en_4(write_data_1, write_data_2, w_en_1[4], w_en_2[4], d[4], en4);
	write_enable wrt_en_5(write_data_1, write_data_2, w_en_1[5], w_en_2[5], d[5], en5);
	write_enable wrt_en_6(write_data_1, write_data_2, w_en_1[6], w_en_2[6], d[6], en6);
	write_enable wrt_en_7(write_data_7, write_data_2, w_en_1[7], w_en_2[7], d[7], en0);
	
endmodule			
