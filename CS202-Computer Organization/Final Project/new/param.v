`define ADD 0
`define SUB 1
`define AND 2
`define OR 3
`define XOR 4
`define SLL 5
`define SRL 6
`define SRA 7
`define SLT 8
`define SLTU 9
`define BEQ 10
`define BNE 11
`define BLT 12
`define BLTU 13
`define BGE 14
`define BGEU 15


`define OPCODE_R 7'b0110011
`define OPCODE_ADD 7'b0110011
`define OPCODE_SUB 7'b0110011
`define OPCODE_AND 7'b0110011
`define OPCODE_OR 7'b0110011
`define OPCODE_XOR 7'b0110011
`define OPCODE_SLL 7'b0110011
`define OPCODE_SRL 7'b0110011
`define OPCODE_SRA 7'b0110011
`define OPCODE_SLT 7'b0110011
`define OPCODE_SLTU 7'b0110011

`define OPCODE_I_REG 7'b0010011
`define OPCODE_ADDI 7'b0010011
`define OPCODE_ANDI 7'b0010011
`define OPCODE_ORI 7'b0010011
`define OPCODE_XORI 7'b0010011
`define OPCODE_SLLI 7'b0010011
`define OPCODE_SRLI 7'b0010011
`define OPCODE_SRAI 7'b0010011
`define OPCODE_SLTI 7'b0010011
`define OPCODE_SLTIU 7'b0010011

`define OPCODE_L 7'b0000011

`define OPCODE_JALR 7'b1100111

`define OPCODE_S 7'b0100011

`define OPCODE_B 7'b1100011
`define OPCODE_BEQ 7'b1100011
`define OPCODE_BNE 7'b1100011
`define OPCODE_BLT 7'b1100011
`define OPCODE_BLTU 7'b1100011
`define OPCODE_BGE 7'b1100011
`define OPCODE_BGEU 7'b1100011

`define OPCODE_LUI 7'b0110111
`define OPCODE_AUIPC 7'b0010111
`define OPCODE_JAL 7'b1101111

`define FUN3_ADD_SUB 3'b000
`define FUN3_AND 	3'b111
`define FUN3_OR 	    3'b110
`define FUN3_XOR 	3'b100
`define FUN3_SLL 	3'b001
`define FUN3_SHIFT_RIGHT 3'b101
`define FUN3_SLT 	3'b010
`define FUN3_SLTU	3'b011
`define FUN3_ADDI	3'b000
`define FUN3_ANDI	3'b111
`define FUN3_ORI 	3'b110
`define FUN3_XORI	3'b100
`define FUN3_SLLI	3'b001
`define FUN3_SLTI	3'b010
`define FUN3_SLTIU	3'b011
`define FUN3_LB 	    3'b000
`define FUN3_LBU  	3'b100
`define FUN3_LH	    3'b001
`define FUN3_LHU  	3'b101
`define FUN3_LW	    3'b010
`define FUN3_JALR	    3'b000
`define FUN3_SB	    3'b000
`define FUN3_SH	    3'b001
`define FUN3_SW	    3'b010
`define FUN3_BEQ	    3'b000
`define FUN3_BNE	    3'b001
`define FUN3_BLT	    3'b100
`define FUN3_BLTU	    3'b110
`define FUN3_BGE	    3'b101
`define FUN3_BGEU	    3'b111

`define FUN7_ADD  7'b0000000
`define FUN7_SUB 	7'b0100000
`define FUN7_AND 	7'b0000000
`define FUN7_OR 	7'b0000000
`define FUN7_XOR 	7'b0000000
`define FUN7_SLL 	7'b0000000
`define FUN7_SRL 	7'b0000000
`define FUN7_SRA 	7'b0100000
`define FUN7_SLT 	7'b0000000
`define FUN7_SLTU	7'b0000000
`define FUN7_SLLI	7'b0000000
`define FUN7_SRLI	7'b0000000
`define FUN7_SRAI	7'b0100000

`define TUB_NUM_0 8'b1111_1100
`define TUB_NUM_1 8'b0000_1100
`define TUB_NUM_2 8'b1101_1010
`define TUB_NUM_3 8'b1111_0010
`define TUB_NUM_4 8'b0110_0110
`define TUB_NUM_5 8'b1011_0110
`define TUB_NUM_6 8'b1011_1110
`define TUB_NUM_7 8'b1110_0000
`define TUB_NUM_8 8'b1111_1110
`define TUB_NUM_9 8'b1110_0110
`define TUB_NUM_A 8'b1110_1110
`define TUB_NUM_B 8'b0011_1110
`define TUB_NUM_C 8'b1001_1100
`define TUB_NUM_D 8'b0111_1010
`define TUB_NUM_E 8'b1001_1110
`define TUB_NUM_F 8'b1000_1110

`define TUB_line  8'b0000_0010
`define TUB_P     8'b1100_1110
`define TUB_r     8'b0000_1010
`define TUB_o     8'b0011_1010
