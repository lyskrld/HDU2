`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/27 13:09:58
// Design Name: 
// Module Name: IR
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

module IR(rst_n, clk_im, ir_write, inst_in, inst);
    input rst_n, clk_im, ir_write;
    input [31:0] inst_in;
    output [31:0] inst;
    reg [31:0] inst_code;
    
    always @(posedge rst_n or negedge clk_im)
    begin
        //rst_n…œ…˝—ÿ¿¥¡Ÿ£¨IR«Â¡„
        if(rst_n) begin inst_code <= 32'h0000_0000; end
        else
        begin
            inst_code <= inst_in;           
        end
    end
    
    assign inst = ir_write ? inst_code : 32'bz;
endmodule
