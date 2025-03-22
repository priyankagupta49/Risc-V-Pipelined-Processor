module ALU_Decoder(
    input [1:0] ALUOp,
    input [2:0] funct3,
    input [6:0] funct7,
    output reg [2:0] ALUControl
);

    always @(*) begin
        case(ALUOp)
            2'b00: ALUControl = 3'b000; // Load/Store (ADD)
            2'b01: ALUControl = 3'b001; // Branch (SUB)
            2'b10: begin // R-Type Instructions
                case(funct3)
                    3'b000: ALUControl = (funct7[5]) ? 3'b001 : 3'b000; // SUB if funct7[5] = 1, else ADD
                    3'b010: ALUControl = 3'b101; // SLT (Set Less Than)
                    3'b110: ALUControl = 3'b011; // OR
                    3'b111: ALUControl = 3'b010; // AND
                    3'b100: ALUControl = 3'b100; // XOR
                    default: ALUControl = 3'b000; // Default to ADD
                endcase
            end
            default: ALUControl = 3'b000; // Default to ADD
        endcase
    end

endmodule
