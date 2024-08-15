
module binary_gray(
input b0,b1,b2,
output g0,g1,g2
);
assign g0=b0^b1;
assign g1=b1^b2;
assign g2=b2;


endmodule