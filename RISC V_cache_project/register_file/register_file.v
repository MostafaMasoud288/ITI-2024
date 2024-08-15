module register_file (
 input clk,WE3,
 input [4:0]A1,A2,A3,
 input [31:0]WD3,
 output [31:0]RD1,RD2
);
reg [31:0] RegisterFile [0:31];
integer i;
initial
begin
for(i=0;i<32;i=i+1)
RegisterFile[i]=32'b0;
end
////synchronous write process////
always@(posedge clk)
begin
if(WE3)
RegisterFile[A3]<=WD3;
else
RegisterFile[A3]<=RegisterFile[A3];
end
////asynchronous read process////
assign RD1 = RegisterFile[A1];
assign RD2 = RegisterFile[A2];
endmodule
