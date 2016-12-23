module mux_2_to_1(a,b,out,outbar,sel);
//here are declaring the inputs and outputs

input a, b, sel;
output out, outbar;
reg out;

always @ ( a or b or sel)

//section 1 - procedural description 
begin
/*using if and else
if(sel) out = a; //if sel=1
else out = b;
*/

//using case statement better alternative 
case(sel)
1'b0: out = b;
1'b1: out = a;
endcase


end
//section 2 -  continuous description 
assign outbar = ~out;

//section 1 and 2 run in parallel

/* NOTE
1. If you want to have bus inputs and outputs you declare them as input[7:0]a (8 bits long)
2. Concatenation useful in coverting digital signals from one word length to another
	converting an 8 bit unsigned number a[7:0] to 13-bit unsigned number b[12:0]
		assign b[12:0] = {5'b0 , a[7:0] } puts these together to form the 13 bit number
		