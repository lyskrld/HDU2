`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/05 15:41:47
// Design Name: 
// Module Name: Inst_reg
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


module Inst_reg(Inst_Code,clk_IR,IR_Write,Inst_out);
input clk_IR;
input [31:0] Inst_Code;
input IR_Write;
output reg [31:0] Inst_out;
always @(posedge clk_IR)
if(IR_Write)
    Inst_out<=Inst_Code;
endmodule