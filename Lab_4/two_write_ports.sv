module two_write_ports( input logic [2:0] write_addr_1, write_addr_2,
			input logic [3:0] write_data_1, write_data_2,
			input logic en_1, en_2,
			output logic [3:0] d[7:0],
			output logic w_en[7:0]);//, w_en_2[7:0]);
	
	// Calling write_port function
	/*
	write_port(	input logic [2:0] write_addr,
			input logic en,
			output logic w_en[7:0]);
	*/
	logic x_en[7:0], y_en[7:0];
	write_port port_1(write_addr_1, en_1, x_en);
	write_port port_2(write_addr_2, en_2, y_en);
	
	// Calling write_enable funtion
	/*
	 write_enable(	input logic [3:0] x, y,
			input logic x_en, y_en,
			output logic [3:0] D,
			output logic en);
	*/
	write_enable wrt_en_0(write_data_1, write_data_2, x_en[0], y_en[0], d[0], w_en[0]);
	write_enable wrt_en_1(write_data_1, write_data_2, x_en[1], y_en[1], d[1], w_en[1]);
	write_enable wrt_en_2(write_data_1, write_data_2, x_en[2], y_en[2], d[2], w_en[2]);
	write_enable wrt_en_3(write_data_1, write_data_2, x_en[3], y_en[3], d[3], w_en[3]);
	write_enable wrt_en_4(write_data_1, write_data_2, x_en[4], y_en[4], d[4], w_en[4]);
	write_enable wrt_en_5(write_data_1, write_data_2, x_en[5], y_en[5], d[5], w_en[5]);
	write_enable wrt_en_6(write_data_1, write_data_2, x_en[6], y_en[6], d[6], w_en[6]);
	write_enable wrt_en_7(write_data_7, write_data_2, x_en[7], y_en[7], d[7], w_en[7]);
	
endmodule			
