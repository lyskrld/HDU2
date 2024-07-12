`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/08 17:01:52
// Design Name: 
// Module Name: test
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



module test;
    reg clk_dm;
    reg [0:0] Mem_Write;
    reg [1:0] MUX;
    reg [7:0] DM_Addr;
    reg [31:0] M_W_Data;
    //input [1:0] size;
    wire [31:0] M_R_Data;
    wire [7:0]LED;
	RAM uut (
		.clk_dm(clk_dm), 
		.Mem_Write(Mem_Write), 
		.MUX(MUX),
		.DM_Addr(DM_Addr),
		.M_W_Data(M_W_Data),
		.M_R_Data(M_R_Data),
		.LED(LED)
	);
	always #20 clk_dm=~clk_dm;
	initial begin
		// Initialize Inputs
		clk_dm=0;
		DM_Addr = 8'b0000000;
		Mem_Write = 0;
		M_W_Data=32'h0000_00ff;
		MUX=2'b00;
		#10;
		MUX=2'b00;
		#40;
		MUX=2'b01;
		#40;
		MUX=2'b10;
		#40;
		MUX=2'b11;
		#40;
        DM_Addr = 8'b0000100;
		MUX=2'b00;
		#40;
		MUX=2'b01;
		#40;
		MUX=2'b10;
		#40;
		MUX=2'b11;
		#40;
		DM_Addr = 8'b0000100;
	    M_W_Data=32'h0000_ffff;
		Mem_Write = 1;
		#40;
		MUX=2'b00;
		#40;
		MUX=2'b01;
		#40;
		MUX=2'b10;
		#40;
		MUX=2'b11;
	end
endmodule

