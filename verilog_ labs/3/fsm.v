module fsm(
input clk,reset,taken,
output reg predict
);

reg[1:0] state,next;

always@(posedge clk)
begin
if(reset)
state<=2'b00;
else
state<=next;
end

always@*
begin
case(state)

///
2'b00:
begin
predict=1;
if(taken)
next=2'b00;
else
next=2'b01;
end
////
2'b01:
begin
predict=1;
if(taken)
next=2'b00;
else
next=2'b10;
end
////
2'b10:
begin
predict=0;
if(taken)
next=2'b11;
else
next=2'b10;
end
////
2'b11:
begin
predict=0;
if(taken)
next=2'b00;
else
next=2'b10;
end
////
default:
begin
predict=1;
if(taken)
next=2'b00;
else
next=2'b01;
end
////
endcase
end

endmodule
