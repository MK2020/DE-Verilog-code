module delay(
sysclk
trigger
n
time_out
);

// you have a tigger signal and a system clock. You have a 10 bit input( n ). if n = 5 it means
//on the next rising edge of trigger ( and n is high)  you will start counting n number of cycles after n number of
//sysclk cycles the output time_out will go high. 

//define no of bits in the delay counter

parameter BIT_SZ = 10;

//define ports

input sysclk, trigger;
input [BIT_SZ-1:0] n;
output time_out;

//required reg declarations - for the FSM
reg [BIT_SZ-1:0] count;
reg time_out;

//the main module is a FSM with embedded counter
reg[1:0] state;
parameter IDLE = 2 'b00;
parameter TIME_OUT = 2 'b10;
parameter COUNTING  = 2 'b01;
parameter WAIT_LOW = 2 'b11;

//initialize the FSM
initial state = IDLE;
initial count = n - 1'b1;

always @ (posedge sysclk)
	case (state)
	IDLE: if (trigger == 1'b1)
		state <=  COUNTING;
	COUNTING: if(count==0) begin
				count <= n -1'b1;
				state <= TIME_OUT;
			end
		else	
	TIME_OUT:
	