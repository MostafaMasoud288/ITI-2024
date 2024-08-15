module binary_gray_tb();
reg b0,b1,b2;
wire g0,g1,g2;
binary_gray dut(b0,b1,b2,g0,g1,g2);
initial
begin
b0=0;
b1=0;
b2=0;
#10;
b0=1;
b1=0;
b2=0;
#10;
b0=0;
b1=1;
b2=0;
#10;
b0=1;
b1=1;
b2=0;
#10;
b0=0;
b1=0;
b2=1;
#10;
b0=1;
b1=0;
b2=1;
#10;
b0=0;
b1=1;
b2=1;
#10;
b0=1;
b1=1;
b2=1;
#10;

end
endmodule
