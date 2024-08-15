module clock_divider_by_6(
    input  clk_in,     
    input  reset,      
    output reg clk_out    
);

integer counter=0;

always @( posedge clk_in ) begin
    if (reset) 
      begin
        counter <= 0;
        clk_out <= 1'b0;
      end
   else if(counter == 2) 
        begin
        
            counter <= 2'b0;
            clk_out <= ~clk_out;
        end 
       else 
       begin
            counter <= counter + 1;
        end
end

endmodule
