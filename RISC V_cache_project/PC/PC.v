module PC_ (
     input clk,reset_n,
     input[31:0] PCNext ,
     output reg [31:0]PC);

     always@(posedge clk,negedge reset_n)
       begin
         if (reset_n==0)
                PC<=32'b0 ;
         else 
                PC<=PCNext ;
       end
endmodule
