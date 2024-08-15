module cache_memory
(
 input clk,rst,update_cache,hit,
 input [31:0] datain,
 input [9:0] address,
output  [3:0] tag_valid,
output reg [31:0] dataout
);
reg [131:0] cache [0:31];
integer i;
always@(posedge clk ,negedge rst)
begin
if(!rst)
begin
for (i=0;i<32;i=i+1)
cache[i][131]<=0;
end
else
begin
if(!hit&&update_cache)
 begin
 case(address[1:0])
 2'b00:cache[address[6:2]][31:0]<=datain;
 2'b01:cache[address[6:2]][63:32]<=datain;
 2'b10:cache[address[6:2]][95:64]<=datain;
 2'b11:cache[address[6:2]][127:96]<=datain;
 endcase
cache[address[6:2]][130:128]<=address[9:7];
cache[address[6:2]][131]<=1'b1;
end

else if(hit&&!update_cache)
begin
case(address[1:0])
2'b00:dataout<=cache[address[6:2]][31:0];
2'b01:dataout<=cache[address[6:2]][63:32];
2'b10:dataout<=cache[address[6:2]][95:64];
2'b11:dataout<=cache[address[6:2]][127:96];
endcase
cache[address[6:2]][130:128]<=address[9:7];
end
end
end
///////
assign tag_valid[3:0]=cache[address[6:2]][131:128];
///////
endmodule
