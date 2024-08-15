
module ex1 (clk,rst_n,check,Data_in1,Data_in2,Data_in3,Data_out1,Data_out2,Data_out3,Data_non1,Data_non2,Data_non3,Data_fiv1,Data_fiv3);


//--------------- Design Inputs ---------------
input wire clk;
input wire rst_n; 
input wire check ;
input wire [1:0] Data_in1;
input wire [2:0] Data_in2;
input wire [3:0] Data_in3;

//--------------- Design Outputs ---------------
output reg  [1:0] Data_out1;
output reg [2:0] Data_out2;
output reg  [3:0] Data_out3;
output reg  [1:0] Data_non1;///three new registers to overcome the multiple assignment
output reg  [2:0] Data_non2;
output reg  [3:0] Data_non3;
output reg  [1:0] Data_fiv1;///two new registers to overcome the multiple assignment
output reg  [3:0] Data_fiv3;


//------------- Internal Wires -----------

wire [1:0] Inernal_wire1 ;
wire [2:0] Inernal_wire2 ;
wire [3:0] Inernal_wire3 ; 

//------------- Internal Reg -----------
reg [1:0] Inernal_reg1 ;
reg [2:0] Inernal_reg2 ;
reg [3:0] Inernal_reg3 ; 



always @(posedge clk,negedge rst_n)///inserted the reset logic to solve the enhenced problems in all sequential blocks
begin 
if(!rst_n)
begin
Inernal_reg1 <= 0;
Inernal_reg2 <= 0;
Inernal_reg3 <= 0;
end
else
begin
Inernal_reg1 <= Data_in1;
Inernal_reg2 <= Data_in2;
Inernal_reg3 <= Data_in3;
end
end 
//--------------- Design Implementation -----------

/*
	always @(posedge clk,negedge rst_n) begin
		if(!rst_n) begin

			

		end
		else begin

			

		end

	end
*/ 

//--------------- Combinational Loops -------------

always @(posedge clk,negedge rst_n)///inserted the reset logic to solve the enhenced problems in all sequential blocks
begin 
if(!rst_n)
begin
Data_non3 <= 0; 
Data_out2 <= 0 ; 
end
else
begin
Data_non3 <= Data_in3 & Data_out3 ; 
Data_out2 <= Data_out2 & Data_in2 ; 
end
end 

///assign Data_out2 = Data_out2 & Data_in2 ; no blocing assignment to reg


//--------------- Inferred Latches ----------------
always @( posedge clk ,negedge rst_n)///inserted the reset logic to solve the enhenced problems in all sequential blocks
begin 
if(!rst_n)
begin
Data_out1 <=0;
end
else
begin
if (check)
begin 
Data_out1 <= Data_in1 & Inernal_reg1;
end 
else ///covered the else 
Data_out1 <= Data_out1;
end
end

always @(*)
begin 
case(Data_in1) 
2'b00: Data_out3 = Data_in3 & Inernal_reg3 ;
2'b01: Data_out3 = Inernal_reg3 ;
default:Data_out3=Data_in3;//inserted a default to overcome latches
endcase  
end 


//--------------- Multi-Driven Signals ------------
always @(posedge clk,negedge rst_n)
begin 
if(!rst_n)
Data_non1 <=0;
else
Data_non1 <= Data_in1 & Inernal_reg1; 
//Data_out1 <= Data_in1 | Inernal_reg1; 
end 

//assign Data_out2 = Data_in2 & Inernal_reg2;//reg 
always @(posedge clk,negedge rst_n)
begin 
if(!rst_n)
Data_non2 <=0;
else
Data_non2 <= Data_in2 | Inernal_reg2;
end

//--------------- Width Mismatches ----------------
//rearranging the signal to handle the difference in width
assign Inernal_wire1 = Data_in1 ;
assign Inernal_wire2 = Data_in2;
assign Inernal_wire3= Data_in3 ;
 
 
//--------------- Blocking -NonBlocking -----------
always @(posedge clk ,negedge rst_n)
begin 
if(!rst_n)
begin
Data_fiv1 <= 0;
Data_fiv3 <= 0;
end
else
begin
Data_fiv1 <= Data_in1 | Inernal_reg1;
Data_fiv3 <= Data_in3 |  Inernal_reg3;
end
end 

endmodule
