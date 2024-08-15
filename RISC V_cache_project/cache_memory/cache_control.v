module cache_control
(
input clk ,rst,we,re,
input ready,//from main memory
input [9:0] address,
input [3:0] tag_valid,
output reg MemWrite,MemRead,
output  reg stall,///to processor
output  reg update_cache ,///to cache
output hit
);
/////////////////
localparam [1:0] idle=2'b00, read=2'b01, write=2'b10; 
reg [1:0] nextstate,state;
///////
always@(negedge clk)
begin
if(!rst)
state<=idle;
else
state<=nextstate;
end
/////////

assign hit = (tag_valid == {1'b1, address[9:7]});

////////
always@(*)
begin
case(state)
idle:
     begin
     if(we)
     nextstate=write;
     else if(re&!hit)
     nextstate=read;
     else
     nextstate=idle;
     MemWrite=0;
     MemRead=0;
     stall=0;
     update_cache=0;
     end
read:
     begin
     MemWrite=0;
     MemRead=1;
     stall=1;
     update_cache=1;
     if(ready)
     nextstate=idle;
     else
     nextstate=read;
     end
write:
     begin
     MemWrite=1;
     MemRead=0;
     stall=1;
     update_cache=1;
     if(ready)
     nextstate=idle;
     else
     nextstate=write;
     end
endcase
end


endmodule

