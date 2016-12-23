module fsm( CLOCK_50,
KEY,
HEX0, HEX1 HEX2, HEX3, HEX4,
LEDR);

inout [3:0] KEY;
input CLOCK_50;
output [6:0] HEXO;
output [6:0] HEX1;
output [6:0] HEX2;
output [6:0] HEX3;
output [6:0] HEX4;

output [9:0] LEDR;

wire tick_hs;

clockdiv_50000(CLOCK_50, tick_ms);

clockdiv_en2500(tick_ms, CLOCK_50, tick_hs);

fsm( tick_ms, tick_hs, KEY[3], time_out);
