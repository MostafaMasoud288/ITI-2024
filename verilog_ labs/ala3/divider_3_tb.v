module divider_6_tb();
    reg clk_in;    
    reg reset;      
    wire clk_out ;
clock_divider_by_6 dut(clk_in,reset,clk_out);   
always
begin
clk_in=0;
#5;
clk_in=1;
#5;
end
initial
begin 
reset=1;
#10;
reset=0;
#120;
end
endmodule


