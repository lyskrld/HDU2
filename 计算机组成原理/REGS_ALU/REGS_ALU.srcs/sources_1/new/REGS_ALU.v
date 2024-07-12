module REGS_ALU(rst_n,clk_nt,clk_RR,clk_F,clk_WB,R_Addr_A,R_Addr_B,W_Addr,Reg_Write,ALU_OP,FR,SW,which,seg,enable);
input rst_n,clk_nt,clk_F,clk_RR,clk_WB;
input [3:0] ALU_OP;
input [4:0]R_Addr_A,R_Addr_B,W_Addr;
input Reg_Write;
input [1:0]SW;
//output wire [31:0]F;
wire [31:0]F;          
output [3:0] FR;
wire [31:0]R_Data_A,R_Data_B; 
//output wire [31:0] R_Data_A,R_Data_B; 
//output [31:0]R_Data_A,R_Data_B;  
output [2:0]which;
output [7:0]seg;
output reg enable=1;
//output [31:0] data;
wire [31:0]W_Data;
REGS F1(rst_n,clk_WB,R_Data_A,R_Data_B,W_Data,R_Addr_A,R_Addr_B,W_Addr,Reg_Write);
Muti_ALU F2(rst_n,clk_RR,clk_RR,clk_F,R_Data_A,R_Data_B,ALU_OP,F,FR);
nixie_tube F3(clk_nt,SW,R_Data_A,R_Data_B,F,which, seg,enable);
assign W_Data=F;

endmodule

