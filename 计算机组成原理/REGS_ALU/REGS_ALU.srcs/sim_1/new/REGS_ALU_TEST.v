`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/27 20:19:40
// Design Name: 
// Module Name: REGS_ALU_TEST
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


module REGS_ALU_TEST;
    reg clk, rst;
    reg [4:0] R_Addr_A,R_Addr_B,W_Addr;
	reg Reg_Write;
    wire [31:0] R_Data_A,R_Data_B;
    reg [2:0] OP;
    wire ZF,OF;
    wire [31:0] ALU_F;
    reg [31:0] W_Data;
REGS_ALU TEST(
        .clk(clk),.rst(rst),.Reg_Write(Reg_Write),
        .R_Addr_A(R_Addr_A),.R_Addr_B(R_Addr_B),.W_Addr(W_Addr),
        .R_Data_A(R_Data_A),.R_Data_B(R_Data_B),
        .OP(OP),.ZF(ZF),.OF(OF),.ALU_F(ALU_F)
        );
initial begin
		// Initialize Inputs
		W_Data = 0;
		R_Addr_A = 10101;
		R_Addr_B = 0;
		W_Addr = 0;
		Reg_Write = 0;
		rst = 0;
		clk = 0;
		#100
		
		W_Data = 32'hAAAAAAAA;
		R_Addr_A = 0;
		R_Addr_B = 0;
		W_Addr = 10101;
		Reg_Write = 1;
		#100
		
		W_Data = 0;
		R_Addr_A = 10101;
		R_Addr_B = 0;
		W_Addr = 0;
		Reg_Write = 0;
		rst = 0;
		clk = 0;
		#100
		
		W_Data = 32'hFFFFFFFF;
		R_Addr_A = 0;
		R_Addr_B = 0;
		W_Addr = 10101;
		Reg_Write = 1;
		clk = 1;
		#100
		
		W_Data = 0;
		R_Addr_A = 10101;
		R_Addr_B = 0;
		W_Addr = 0;
		Reg_Write = 0;
		clk = 0;
		#100
		
		rst = 1;
		W_Data = 0;
		R_Addr_A = 10101;
		R_Addr_B = 0;
		W_Addr = 0;
		Reg_Write = 0;
		#100
		
		rst = 0;
		W_Data = 0;
		R_Addr_A = 01010;
		R_Addr_B = 0;
		W_Addr = 0;
		Reg_Write = 0;
		#100
		
		W_Data = 32'hAABBCCDD;
		R_Addr_A = 0;
		R_Addr_B = 0;
		W_Addr = 01010;
		Reg_Write = 1;
		clk = 1;
		#100
		
		W_Data = 0;
		R_Addr_A = 01010;
		R_Addr_B = 0;
		W_Addr = 0;
		Reg_Write = 0;
		#100;
		
		W_Data = 0;
		R_Addr_A = 0;
		R_Addr_B = 0;
		W_Addr = 0;
		Reg_Write = 0;
		#100;
        
	end
endmodule