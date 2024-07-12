`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/05 14:07:27
// Design Name: 
// Module Name: Command Parser
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: // 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Command_Parser(op_code,funct_3,funct_7,rs_1,rs_2,rd,Inst_code);
input [31:0]Inst_code;
output reg[6:0]op_code;
output reg[6:0]funct_7;
output reg [2:0]funct_3;
output reg [4:0]rs_1,rs_2,rd;
always @*
begin
op_code = Inst_code[6:0];
if (op_code == 7'b0010011)//I1_imm
    begin
    rs_1 = Inst_code[19:15];
    funct_3 = Inst_code[14:12];
    rd = Inst_code[11:7];
    end
if (op_code == 7'b0000011)//I2_imm
    begin
    rs_1 = Inst_code[19:15];
    funct_3 = Inst_code[14:12];
    rd = Inst_code[11:7];
    end
if (op_code == 7'b0100011)//S
    begin
    rs_2 = Inst_code[24:20];
    rs_1 = Inst_code[19:15];
    funct_3 = Inst_code[14:12];
    end
if (op_code == 7'b1100011)//B
    begin
    rs_2 = Inst_code[24:20];
    rs_1 = Inst_code[19:15];
    funct_3 = Inst_code[14:12];
    end
if (op_code == 7'b0110111)//U
    begin
    rd = Inst_code[11:7];
    end
if (op_code == 7'b1101111)//J
    begin
    rd = Inst_code[11:7];
    end
end
endmodule
