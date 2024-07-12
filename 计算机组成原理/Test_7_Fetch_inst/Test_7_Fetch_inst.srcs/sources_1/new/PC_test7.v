`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/16 15:19:06
// Design Name: 
// Module Name: PC_test7
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



module PC_test7(clk_pc,clk_im,rst_n,Inst_code,PC_Write, PC);
input clk_pc,clk_im,rst_n;
input PC_Write;
wire [31:0]PC_new;
output reg[31:0]PC;
output [31:0]Inst_code;
assign PC_new = PC +4;
    Rom_A IM (
  .clka(clk_im),    // input wire clka
  .addra(PC[7:2]),  // input wire [5 : 0] addra
  .douta(Inst_code)  // output wire [31 : 0] douta
);
always@(posedge clk_pc or negedge rst_n)
	begin
		if(!rst_n)
			begin PC <= 32'h0000_0000; end
		else
		    if(PC_Write) 
			begin PC <=PC_new; end
	end
endmodule
