module ALU(
    input [31:0] A, B,
    input [2:0] ALUControl,
    output reg [31:0] Result,
    output reg Carry, OverFlow, Zero, Negative
);

    wire [31:0] Sum, B_mux;
    wire Cout, Overflow_add, Overflow_sub;

    assign B_mux = (ALUControl == 3'b001) ? ~B + 1 : B;  // For SUB
    assign {Cout, Sum} = A + B_mux;

    // Overflow detection
    assign Overflow_add = (A[31] == B_mux[31]) && (Sum[31] != A[31]);
    assign Overflow_sub = (A[31] != B[31]) && (Sum[31] != A[31]);

    always @(*) begin
        case (ALUControl)
            3'b000: Result = Sum;                        // ADD
            3'b001: Result = Sum;                        // SUB
            3'b010: Result = A & B;                      // AND
            3'b011: Result = A | B;                      // OR
            3'b100: Result = A ^ B;                      // XOR
            3'b101: Result = ($signed(A) < $signed(B))   // SLT
                            ? 32'b1 : 32'b0;
            default: Result = 32'b0;
        endcase

        // Flags
        Zero     = (Result == 32'b0);
        Negative = Result[31];
        Carry    = (ALUControl <= 3'b001) ? Cout : 1'b0;
        OverFlow = (ALUControl == 3'b000) ? Overflow_add :
                   (ALUControl == 3'b001) ? Overflow_sub : 1'b0;
    end
endmodule
