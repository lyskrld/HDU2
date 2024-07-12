`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/05/16 21:45:52
// Design Name: 
// Module Name: ALU
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

module ALU(A,B,ALU_OP,F,ZF,SF,CF,OF);
	  input  [3:0] ALU_OP;
	  input [32:1] A,B;
	  output reg [32:1] F;
	  output reg ZF,SF,CF,OF;
	  reg C;
   // ��λ��  ������0��31֮�� srl��5λ���Ա�ʾ32
  wire [5:1] shift_amount = B[5:1];
    always@(*)
    begin
    	C=0;
    	CF=0;
		OF=0;
		ZF=0;
		SF=0;
		case(ALU_OP)
			4'b0000:begin {C,F}=A+B;OF = A[32]^B[32]^F[32]^C;CF = C;end //�ӷ� add
			4'b0001:begin F=A<<B; end //���� sll
			4'b0010:begin F=$signed(A)<$signed(B); end //�з������Ƚ� slt
			4'b0011:begin F=A<B; end //�޷������Ƚ� sltu
			4'b0100:begin F=A^B; end//��� xor
			4'b0101:begin F = A >> shift_amount; end //srl  �߼�����
			4'b0110:begin F=A|B; end//��λ�� or
			4'b0111:begin F=A&B; end//��λ�� and
			4'b1000:begin {C,F}=A-B;OF = A[32]^B[32]^F[32]^C;CF = ~C; end//���� sub
			4'b1101:begin F=($signed(A))>>>shift_amount;end// ��������  sra  �з���λ
		endcase
		ZF = F==0;
		SF = F[32];
   end
endmodule