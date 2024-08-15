module FIFO
(
input clk ,reset,wr_e,r_e,
input [31:0] data_in,
output reg [31:0] data_out,
output reg full,empty
);
integer i,count;
integer write_pointer,read_pointer;
reg [31:0] fifo [0:7];


always@(posedge clk)
begin
if(reset)
begin
 read_pointer<=0;
 write_pointer<=0;
 empty<=1;
 count<=1;
 full<=0;
data_out<=0;
 for(i=0;i<8;i=i+1)
  fifo[i]<=32'b0;
 
end

else if(wr_e&&!full)
begin
  fifo[write_pointer]<=data_in;
  write_pointer<=write_pointer+1;
  count<=count+1;
  empty<=0;
  if(write_pointer==8)write_pointer<=write_pointer%8;
  if(write_pointer>read_pointer&&count==8)
  begin
   full<=1;
   count<=8;
  end
end
////////
else if(r_e&&!empty)
begin
  data_out <=fifo[read_pointer];
  read_pointer<=read_pointer+1;
  count<=count-1;
  full<=0;
 //if(read_pointer==8)read_pointer<=read_pointer%8;
 if(count==0)begin
  empty<=1;
  count<=0;
  end      
end    
end
endmodule
