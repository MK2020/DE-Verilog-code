module eliminator (out , in , clk , rst);

input in, clk, rst;
output out;

//define states one-hot encoding
parameter S_A = 4 'b0001;
parameter S_B = 4 'b0010;
parameter S_C = 4 'b0100;
parameter S_D = 4 'b1000;

//specify state machine transition - sequential 

always @ (posedge clk)

if (rst == 1 'b1) //if rest is true

state <= S_A;

else

	case (state) 

	S_A: if(in == 1'b1) state <=  S_B;
	S_B: if(in == 1'b1) state <=  S_C;
	S_A: if(in == 1'b1) state <=  S_B;
	S_A: if(in == 1'b1) state <=  S_B;
//<= this happens at the end of the always block
//next time when the clock edge goes from low to high this is whats going to be implemented
	default: ; //do nothing
	
	endcase;
	
//specifying the input& current state = output - combinatorial 

always @ (*)
	case (state)
		S_A: out = 1'b0;
		S_B: out = 1'b0;
		S_C: out = 1'b1;
		S_D: out = 1'b1;
		endcase;
//here we are using the blocking assignment because there is NO CLOCK INVOLVED		
endmodule;
		

