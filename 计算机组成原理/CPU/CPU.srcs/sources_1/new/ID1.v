`timescale 1ns / 1ps


module ID1(inst,rs1,rs2,rd,opcode,funct3,funct7,imm32);
    input [31:0]inst;
    output [5:0]rs1,rs2,rd;
    output reg [6:0]opcode;
    output [5:0]funct3,funct7;
    output [31:0]imm32;
    reg [2:0] inst_Type;

    always @(*)
    begin
        opcode = inst[6:0];
        case(opcode)
            7'b0110011:inst_Type = 3'b000; // R��ָ���ʽ����
            7'b0010011:inst_Type = 3'b001; // I��ָ���ʽ����                       
            7'b0110111:inst_Type = 3'b010; // U��ָ���ʽ����
            
            7'b0000011:inst_Type = 3'b011; // LW��ָ���ʽ����
            7'b0100011:inst_Type = 3'b100; // SW��ָ���ʽ����
            
            7'b1100011:inst_Type = 3'b101; // B��ָ���ʽ����
            7'b1101111:inst_Type = 3'b110; // JAL��ָ���ʽ����
            7'b1100111:inst_Type = 3'b111; // JALR��ָ���ʽ����
            
        endcase       
    end
    
    ImmU uut(inst,inst_Type,imm32);
    assign rs1=inst[19:15];
    assign rs2=inst[24:20];
    assign rd=inst[11:7];
    assign funct3=inst[14:12];
    assign funct7=inst[31:25];
endmodule
