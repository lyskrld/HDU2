`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/07 21:53:29
// Design Name: 
// Module Name: REGS
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


module REGS(rst_n,clk_WB,R_Data_A,R_Data_B,W_Data,R_Addr_A,R_Addr_B,W_Addr,Reg_Write);
	input rst_n,clk_WB;
    input Reg_Write;
    input [4:0]R_Addr_A;
    input [4:0]R_Addr_B;
    input [4:0]W_Addr;
    input [31:0]W_Data;
	output [31:0]R_Data_A;
    output [31:0]R_Data_B;
    reg [31:0] REG_Files[0:31]; 
    always@(posedge clk_WB or negedge rst_n)
   	 begin
        if(!rst_n)
            begin
                REG_Files[0]<=32'h0000_0000;
                REG_Files[1]<=32'h8000_0000;
                REG_Files[2]<=32'h0000_FFFF;
                REG_Files[3]<=32'h0000_F0F0;
                REG_Files[4]<=32'h0000_0F0F;
            end
        else
                if(Reg_Write) 
                begin
                if(W_Addr!=5'b00000)
                    REG_Files[W_Addr]<=W_Data;
                end
  	  end
    assign R_Data_A=REG_Files[R_Addr_A];
    assign R_Data_B=REG_Files[R_Addr_B];
endmodule
