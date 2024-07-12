`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/07 20:46:20
// Design Name: 
// Module Name: TEST
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

module TEST;
	// Inputs
    reg rst_n,clk_RR,clk_F,clk_WB,Reg_Write;
    reg [4:0]R_Addr_A,R_Addr_B,W_Addr;
    reg [3:0]ALU_OP;
	// Outputs
	wire [31:0] F;
	wire [3:0] FR; 
	wire [31:0]R_Data_A;
	wire [31:0]R_Data_B;
	REGS_ALU uut (
    .rst_n(rst_n),
    .clk_RR(clk_RR),
    .clk_F(clk_F),
    .clk_WB(clk_WB),
    .R_Addr_A(R_Addr_A),
    .R_Addr_B(R_Addr_B),
    .W_Addr(W_Addr),
    .Reg_Write(Reg_Write),
    .R_Data_A(R_Data_A),
    .R_Data_B(R_Data_B),
    .ALU_OP(ALU_OP),
    .F(F),
    .FR(FR)
	);
    always
    #50 clk_RR=~clk_RR;
	always
	#60 clk_F=~clk_F;
	always
	#70 clk_WB=~clk_WB;
	initial begin
	rst_n=0;
	R_Addr_A=5'b00000;
    R_Addr_B=5'b00001;
	    ALU_OP=4'b0000;
	clk_RR=0;
	    clk_F=0;
	clk_WB=0;
	#60;
	rst_n=1;
    W_Addr=5'b00100;
    Reg_Write=0;
    #60;
    Reg_Write=1;
    R_Addr_B=5'b00100;
    #40;
    W_Addr=5'b00000;
    R_Addr_A=5'b00000;
	end
endmodule

