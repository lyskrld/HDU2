`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/05 15:05:04
// Design Name: 
// Module Name: IMM_test7
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


module IMM_test7(imm,Inst_code,op_code);
input [31:0]Inst_code;
output reg [6:0]op_code;//7
output reg [31:0]imm;
always @*
begin
op_code = Inst_code[6:0];
if (op_code == 7'b0010011)//I1_imm
    begin
    imm[31:0] = {27'b0,Inst_code[24:20]};
    end
if (op_code == 7'b0000011)//I2_imm
    begin
    imm[31:0] = {{20{Inst_code[31]}},Inst_code[31:20]};
    end
if (op_code == 7'b0100011)//S
    begin
    imm[31:0] = {{20{Inst_code[31]}},Inst_code[31:25],Inst_code[11:7]};
    end
if (op_code == 7'b1100011)//B
    begin
    imm[31:0] = {{20{Inst_code[31]}},Inst_code[7],Inst_code[30:25],Inst_code[11:8],1'b0};
    end
if (op_code == 7'b0110111)//U
    begin
    imm[31:0] = {Inst_code[31:12],12'b0};
    end
if (op_code == 7'b1101111)//J
    begin
    imm[31:0] = {{12{Inst_code[31]}},Inst_code[19:12],Inst_code[20],Inst_code[30:21],1'b0};
    end
end
endmodule
