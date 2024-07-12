`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/04/26 20:42:34
// Design Name: 
// Module Name: Muti_ALU
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


module Muti_ALU(rst_n,clk_en,clk_nt,clk_A,clk_B,clk_F,Data,FR,which,seg,enable);
      input rst_n,clk_nt,clk_A,clk_B,clk_F;
      input clk_en;
	  reg [3:0] ALU_OP;
	  input [32:1] Data;
	  wire [32:1] F;
	  output [4:1]FR;
      output [2:0]which;
      output [7:0]seg;
      output reg enable=1;
	  wire [32:1] A,B;
	  wire ZF,SF,CF,OF;
	  wire [32:1] Data_F;
	  
	  Input IA(rst_n,clk_A,Data,A);
	  Input IB(rst_n,clk_B,Data,B);
	  always @(posedge clk_en)
	   begin
	   ALU_OP={Data[4],Data[3],Data[2],Data[1]};
	   end
	  ALU ALU1(ALU_OP,A,B,Data_F,ZF,SF,CF,OF);
	  Output OUT(rst_n,clk_F,Data_F,ZF,SF,CF,OF,F,FR);
	  //assign F=32'b1111_1111_1111_1111_0000_0001_0001_0010;
	  nixie_tube F5(clk_nt,F,FR,which,seg,enable);
endmodule

module Input(rst_n,clk,Data_In,Data);
    input rst_n,clk;
    input [32:1]Data_In;
    output reg [32:1]Data;
    always @(negedge rst_n or posedge clk)
    begin
    if(!rst_n)
    Data<=32'b0;
    else
    Data<=Data_In;
    end
endmodule

module ALU(ALU_OP,A,B,F,ZF,SF,CF,OF);
	  input  [3:0] ALU_OP;
	  input [32:1] A,B;
	  output reg [32:1] F;
	  output reg ZF,SF,CF,OF;
	  reg C;
   // 移位数  限制在0到31之间 srl，5位足以表示32
  wire [5:1] shift_amount = B[5:1];
    always@(*)
    begin
    	C=0;
    	CF=0;
		OF=0;
		ZF=0;
		SF=0;
		case(ALU_OP)
			4'b0000:begin {C,F}=A+B;OF = A[32]^B[32]^F[32]^C;CF = C;end //加法 add
			4'b0001:begin F=A<<B; end //左移 sll
			4'b0010:begin F=$signed(A)<$signed(B); end //有符号数比较 slt
			4'b0011:begin F=A<B; end //无符号数比较 sltu
			4'b0100:begin F=A^B; end//异或 xor
			4'b0101:begin F = A >> shift_amount; end //srl  逻辑右移
			4'b0110:begin F=A|B; end//按位或 or
			4'b0111:begin F=A&B; end//按位与 and
			4'b1000:begin {C,F}=A-B;OF = A[32]^B[32]^F[32]^C;CF = ~C; end//减法 sub
			4'b1101:begin F=($signed(A))>>>shift_amount;end// 算术右移  sra  有符号位
		endcase
		ZF = F==0;
		SF = F[32];
   end
endmodule

module Output(rst_n,clk_F,Data_F,ZF,SF,CF,OF,F,FR);
    input rst_n,clk_F;
    input [32:1]Data_F;
    input ZF,SF,CF,OF;
    output reg [32:1] F;
    output reg [4:1] FR;

    always @(negedge rst_n or posedge clk_F)
        begin
            if(!rst_n)
            begin
            F<=32'b0;
            FR<=4'b0;
            end
            else
             begin
             F<=Data_F;
             //FR<=Data_FR
            FR[4]<=ZF;
            FR[3]<=SF;
            FR[2]<=CF;
            FR[1]<=OF;
             end
         end
endmodule
     