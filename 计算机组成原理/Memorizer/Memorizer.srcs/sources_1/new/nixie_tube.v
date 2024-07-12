`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/06/02 20:30:00
// Design Name: 
// Module Name: nixie_tube
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



module nixie_tube(
    input clk,
	input [31:0] Data_R,
    output [2:0]which,
    output [7:0]seg,
    input wire enable
    //output reg [31:0] data
    );
    reg [31:0] data;
    always @(*)
    begin
         data=Data_R;
    end
        Display U1(clk,data,which,seg);
endmodule


module Display(
  input clk,           // ʱ���ź�
  input [31:0] data,   // ���������ź�
  output reg [2:0] which = 0,// λѡ�ź�
  output reg [7:0] seg // ��ѡ�ź�
);
  reg [14:0] count = 0;         // ��Ƶ������
  always @(posedge clk) count <= count + 1'b1;
  always @(negedge clk) if(&count)which <= which + 1'b1;
  
  reg [3:0] data_1;         // ����λ1
  always @(*) begin
    case (which)  // ���ݼ�������ֵѡ������λ1��ֵ
      0: data_1 = data[31:28];
      1: data_1 = data[27:24];
      2: data_1 = data[23:20];
      3: data_1 = data[19:16];
      4: data_1 = data[15:12];
      5: data_1 = data[11:8];
      6: data_1 = data[7:4];
      7: data_1 = data[3:0];
    endcase
  end

    always @* begin
    case (data_1)//ʮ������ת��Ϊ��ѡ�źţ���ѡ�źſ�����һ����
    4'h0:seg[7:0] <= 8'b0000_0011;//��g\dp��ȫ������ʾ����0    0�ǲ�������һ��
    4'h1:seg[7:0] <= 8'b1001_1111;
    4'h2:seg[7:0] <= 8'b0010_0101;
    4'h3:seg[7:0] <= 8'b0000_1101;
    4'h4:seg[7:0] <= 8'b1001_1001;
    4'h5:seg[7:0] <= 8'b0100_1001;
    4'h6:seg[7:0] <= 8'b0100_0001;
    4'h7:seg[7:0] <= 8'b0001_1111;
    4'h8:seg[7:0] <= 8'b0000_0001;
    4'h9:seg[7:0] <= 8'b0000_1001;
    4'hA:seg[7:0] <= 8'b0001_0001;
    4'hB:seg[7:0] <= 8'b1100_0001;
    4'hC:seg[7:0] <= 8'b0110_0011;
    4'hD:seg[7:0] <= 8'b1000_0101;
    4'hE:seg[7:0] <= 8'b0110_0001;
    4'hF:seg[7:0] <= 8'b0111_0001;
    default:seg[7:0]<=8'b1111_1111;
    endcase
  end
endmodule

