`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/16 14:31:38
// Design Name: 
// Module Name: Fetch_inst_test7
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Fetch_Inst_test7(clk_nt,clk_im,rst_n,PC_Write,IR_Write,SW,seg,which,enable,LED1,LED2,LED3);
input clk_nt,clk_im,rst_n;
input [2:0]SW;
input PC_Write,IR_Write;
output [6:0] LED1,LED2,LED3;
output [2:0]which;
output [7:0]seg;
output reg enable=1;
wire [31:0]Inst_code,Inst_out,PC;
wire [6:0]op_code,funct_7;
wire [2:0]funct_3;
wire [4:0]rs_1,rs_2,rd;
wire [31:0]imm;
PC_test7 F1(~clk_im,clk_im,rst_n,Inst_code,PC_Write,PC);
Inst_reg F2(Inst_code,~clk_im,IR_Write,Inst_out);
Command_Parser F3(op_code,funct_3,funct_7,rs_1,rs_2,rd,Inst_code);
IMM_test7 F4(imm,Inst_code,op_code);
nixie_tube F5(clk_nt,SW[1:0],which,seg,enable,PC,Inst_out,imm);
LED_display F6(SW[2],LED1,LED2,LED3,rs_1,rs_2,rd,funct_3,funct_7,op_code);
endmodule









