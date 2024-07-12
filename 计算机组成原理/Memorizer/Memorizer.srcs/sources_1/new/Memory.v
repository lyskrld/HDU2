`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/08 16:41:32
// Design Name: 
// Module Name: Memory
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

//module RAM(clk_dm, Mem_Write, DM_Addr, M_W_Data, size, M_R_Data);
//module RAM(clk_dm, Mem_Write, DM_Addr, M_W_Data, M_R_Data);
module RAM(clk_dm,clk_nt,Mem_Write, DM_Addr, MW_Data_s,which,seg,enable);
    input clk_dm,clk_nt;    
    input [0:0] Mem_Write;
    input [7:0] DM_Addr;
    reg [31:0] M_W_Data;
    wire [31:0] M_R_Data;
    input [1:0] MW_Data_s;
    output [2:0]which;
    output [7:0]seg;
    output reg enable=1;
    reg [31:0] douta, dina;
    always @* begin
        dina=32'b0;
        case(MW_Data_s)
        2'b00:	M_W_Data=32'h0000_FFFF;
        2'b01:	M_W_Data=32'hFFFF_FFFF;
        2'b10:	M_W_Data=32'hF0F0_F0F0;
        2'b11:	M_W_Data=32'hFFFF_0000;
        endcase     
        dina=M_W_Data;
    end
    RAM_B Data_RAM(
    .clka(clk_dm),    // input wire clka
    .wea(Mem_Write),      // input wire [0 : 0] wea
    .addra(DM_Addr[7:2]),  // input wire [5 : 0] addra
    .dina(dina),    // input wire [31 : 0] dina
    .douta(M_R_Data) // output [31 : 0] douta
    );
    nixie_tube F1(clk_nt,M_R_Data,which,seg,enable);
endmodule