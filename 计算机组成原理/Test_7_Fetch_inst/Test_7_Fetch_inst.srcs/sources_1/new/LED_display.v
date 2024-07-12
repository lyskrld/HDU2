`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/05 20:42:21
// Design Name: 
// Module Name: LED_display
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


module LED_display(SW,LED1,LED2,LED3,rs_1,rs_2,rd,funct_3,funct_7,opcode);
input SW;
input [4:0] rs_1,rs_2,rd;
input [2:0] funct_3;
input [6:0] funct_7,opcode;
output reg [6:0] LED1,LED2,LED3;
always @*
    case(SW)
    1'b0:
    begin
    LED1={rs_1,2'b0};
    LED2={rs_2,2'b0};
    LED3={rd,2'b0};
    end
    1'b1:
    begin
    LED1=opcode;
    LED2={funct_3,4'b0};
    LED3=funct_7;
    end
    endcase
    
endmodule
