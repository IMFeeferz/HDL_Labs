module write_port(	input logic [3:0] write_addr,
			input logic en,
			output logic w_en[7:0]);
	
	// How should e be wired into the decoder?
	Decoder_3_to_8 my_decoder(write_addr, w_en);
endmodule
