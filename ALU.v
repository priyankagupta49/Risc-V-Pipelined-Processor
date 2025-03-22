module ALU(
    input [31:0] A, B,
    input [2:0] ALUControl,
    output reg [31:0] Result,
    output reg Carry, OverFlow, Zero, Negative
);

    wire [31:0] Sum, B_mux;
    wire Cout, Overflow_add, Overflow_sub;

    assign B_mux = (ALUControl == 3'b001) ? ~B + 1 : B;  // Select B or -B for subtraction
    assign {Cout, Sum} = A + B_mux; // Addition or Subtraction

    always @(*) begin
        case (ALUControl)
            3'b000: Result = Sum;         // ADD
            3'b001: Result = Sum;         // SUB
            3'b010: Result = A & B;       // AND
            3'b011: Result = A | B;       // OR
            3'b100: Result = A ^ B;       // XOR
            3'b101: Result = {31'b0, Sum[31]}; // SLT (Set Less Than)
            default: Result = 32'b0;      // Default case
        endcase
    end



endmodule
