module top_layer_tb();
reg clk;
reg rst_n;

top_layer risc(.clk(clk),.rst_n(rst_n));

localparam T=10;
always 
begin
clk=1'b0;
#(T/2);
clk=1'b1;
#(T/2);
end

initial
begin
rst_n=1'b0;
#1;
rst_n=1'b1;
#300;
end

endmodule
