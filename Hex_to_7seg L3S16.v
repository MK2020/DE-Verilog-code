module hex_to_7seg(out, in );

output [6:0] out;//active-low output
input [3:0] in;// 4bit binary input (HEX)

reg [6:0] out;//HOW IS THIS USED?

always  @ (in) // you could use always @*
	case(in)
		4'h0: out = 7'b1000000;
		4'h1: out = 7'b1111001;
		4'h2: out = 7'b0100100;						//   ---bit0--
		4'h3: out = 7'b0110000;						//  |         |
		4'h4: out = 7'b0011001;						//  bit5    bit1
		4'h5: out = 7'b0010010;						//  |			|	
		4'h6: out = 7'b0000010;						 // |--bit6---|
		4'h7: out = 7'b1111000;//stopped here		 // |         |
		4'h8: out = 7'b10000000;    				// bit4      bit2
		4'h9: out = 7'b10000000;					//  |--bit3---| 
		4'ha: out = 7'b10000000;
		4'hb: out = 7'b10000000;	
		4'hc: out = 7'b10000000;
		4'hd: out = 7'b10000000;
		4'he: out = 7'b10000000;
 		4'hf: out = 7'b10000000;
 		endcase
 		
 endmodule