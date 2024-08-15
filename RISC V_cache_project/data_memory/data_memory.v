module data_memory (
 input clk,WE,RE, //we==memwrite.re==memread
 input [9:0]A,
 input [31:0]WD,
output reg ready,
 output reg [31:0] RD
);
reg [31:0] RAM [0:1023]; 
integer count =0;

////synchronous write process////
always@(posedge clk)
begin
ready<=0;
if(WE) 
begin
RAM[A]<=WD;
      if(count==3)
       begin
       ready<=1;
       count<=0;
       end
       else 
        count<=count+1;
end
else if (RE)
 begin
RD = RAM[A];
ready<=0;
if(count==3)
       begin
       ready<=1;
       count<=0;
       end
       else 
        count<=count+1;

end
end

endmodule

/*module data_memory (
 input clk,WE,
 input [7:0]A,
 input [31:0]WD,
 output reg [31:0] RD
);
reg [31:0] RAM [0:255]; 
/*integer i;
initial
begin
for(i=0;i<256;i=i+1)
RAM[i]=32'b0;
end*/
////synchronous write process////
/*always@(posedge clk)
begin
if(WE)
RAM[A]<=WD;
else
RAM[A]<=RAM[A];
end

endmodule*/