module adder #(parameter M = 32,parameter N = 16) (
 input [1-1:0] clk ,
 input [M-1:0] _in ,
 output reg [N-1:0] _out );
 ////internal wires
 ////combinational logic
 ////sequential logic
 always@(posedge clk,posedge rst)
 begin
 
 if(rst)
 begin
 
 end
 else
 begin
 
 end
 
 end
 endmodule