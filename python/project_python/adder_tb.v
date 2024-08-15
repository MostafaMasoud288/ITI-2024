module adder_tb ();
////parameters
 parameter M = 32;
 parameter N = 16;
 
////inputs
 reg [1-1:0] clk_tb ;
 reg [M-1:0] _in_tb ;
 
////outputs
 wire [N-1:0] _out_tb ;
 
////instantiation
 adder #( .M(M) ,.N(N) ) dut(.clk(clk_tb) ,._in(_in_tb) ,._out(_out_tb) );
 localparam T = 20 ;
////clock generation
 always
 begin
 clk_tb <= 0;
 #T ;
 clk_tb <= 1;
 #T ;
 end
////stimulas generation
 
 initial
 begin
 
 end
 
 endmodule