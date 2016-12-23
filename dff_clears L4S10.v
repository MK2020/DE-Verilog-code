module dff_sync_clear( d, clearb, clock, q);

input d, clearb, clock;

output q;

reg q; // ASSIGNMENT inside an always block MUST be declared as REG and not a net(wire)

always @ (posedge clock)
begin 
if(!clearb) q <= 1'b0;
else q <=d;
end 


endmodule

/* NOTE:
1. If you hve two always blocks in a module then these block will execute in PARALLEL -
therefore they must not speficy the same output otherwise a race conditon exists
*/

module dff_async_clear( d, clearb, clock, q);

input d , clock, clearb;

output q;

reg q;

//when clear is low(active low) and the clock is high
always @ (negedge clearb  or posedge clock)
begin 
if( !clearb )
 q <= 1'b0;
 else 
 
 q <= d;
 
 end
 
 endmodule