module sequence_detector(
 input x,clk,rst,
 output reg flag
);
reg [2:0] state,next;
parameter A=3'b000;
parameter B=3'b001;
parameter C=3'b010;
parameter D=3'b011;
parameter E=3'b100;
parameter F=3'b101;
parameter G=3'b110;
parameter H=3'b111;

always@(posedge clk)
begin
if(rst)
state<=3'b000;
else
state<=next;
end


always@*
begin
flag=0;
case(state)

A:begin
if(x)
next=B;
else
next=A;
end
//////
B:begin
if(x)
next=B;
else
next=C;
end
//////
C:begin
if(x)
next=D;
else
next=A;
end
//////
D:begin
if(x)
next=E;
else
next=C;
end
/////
E:begin
if(x)
next=B;
else
next=F;
end
//////
F:begin
if(x)
next=G;
else
next=A;
end
//////
G:begin
if(x)
next=E;
else
next=H;
end
/////
H:begin
if(x)
begin
next=D;
flag=1;
end
else
next=A;
end
default:begin
if(x)
next=B;
else
next=A;
end
endcase
end
endmodule

