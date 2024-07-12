`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/27 09:46:12
// Design Name: 
// Module Name: ALU_test
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


module ALU_test;
       //Inputs
       reg rst_n,clk_A,clk_B,clk_F;
       reg [3:0] ALU_OP;
	   reg [32:1] Data_A;
	   reg [32:1] Data_B;
	   	reg [2:0] F_LED_SW;
	   // Outputs
	   wire [7:0] LED;
	   wire [32:1] F;
	   wire [4:1] FR;
    Muti_ALU ALU_test(rst_n,clk_A,clk_B,clk_F,ALU_OP,Data_A,Data_B,F,FR,F_LED_SW,LED);
initial begin
        rst_n=0;clk_A=0;clk_B=0;clk_F=0;
        F_LED_SW = 3'b000;
        #100
        rst_n=1;
        clk_A=1;   
        Data_A=32'hF0F0F0F0; 
        clk_B=1;
        Data_B=32'h00000004;
        clk_F=1;
		ALU_OP = 4'b0000; #100;//按位与
		ALU_OP = 4'b0001; #100;//按位或
		ALU_OP = 4'b0010; #100;//按位异或
		ALU_OP = 4'b0011; #100;//按位或非
		ALU_OP = 4'b0100; #100;//相加
		ALU_OP = 4'b0101; #100;//相减				
		ALU_OP = 4'b0110; #100;//判断A<B
		ALU_OP = 4'b0111; #100;
		ALU_OP = 4'b1000; #100;
		ALU_OP = 4'b1101; #100;
end

endmodule
