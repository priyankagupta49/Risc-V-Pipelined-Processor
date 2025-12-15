module ALU(A, B, Result, ALUControl, OverFlow, Carry, Zero, Negative);

    // I/O Definitions
    input [31:0] A, B;
    input [2:0]  ALUControl;
    output       Carry, OverFlow, Zero, Negative;
    output [31:0] Result;
    
    // Internal Wires for Adder/Subtractor Logic
    wire [31:0] B_inv;
    wire [32:0] Sum_result; // Critical: 33-bit wide to capture carry/sign
    wire        is_sub;
    
    // 1. Control Signal for Subtraction
    // is_sub is true only for SUB (3'b001) and functions that use SUB (like Branch, which also uses 3'b001)
    assign is_sub = (ALUControl == 3'b001); 
    
    // 2. Prepare B for Two's Complement Subtraction (A - B = A + ~B + 1)
    // B_inv holds B or ~B
    assign B_inv = is_sub ? ~B : B;
    
    // 3. Core Adder/Subtractor Block
    // Sum_result = A + B + 0 (for ADD) or A + ~B + 1 (for SUB)
    assign Sum_result = A + B_inv + is_sub;

    // Output Registers
    reg [31:0] Result_reg;
    reg Cout_reg;
    reg OverFlow_reg;
    
    // 4. Final Result Selection and Flag Calculation
    always @(*) begin
        // Default assignments for non-arithmetic operations/safety
        Result_reg = 32'h0;
        Cout_reg = 1'b0;
        OverFlow_reg = 1'b0;
        
        case (ALUControl)
            // ----------------------------------------------------
            // 3'b000: ADD / ADDI / Load/Store Effective Address
            // ----------------------------------------------------
            3'b000: begin 
                Result_reg = Sum_result[31:0];
                Cout_reg = Sum_result[32]; // Standard carry
                // Overflow check for ADD (A+B)
                OverFlow_reg = (A[31] == B[31]) && (Result_reg[31] != A[31]);
            end
            
            // ----------------------------------------------------
            // 3'b001: SUB / Branch Comparison
            // ----------------------------------------------------
            3'b001: begin 
                Result_reg = Sum_result[31:0];
                // Carry is often used for unsigned comparison (ALU_Result=0, Cout=1 for A>=B)
                Cout_reg = Sum_result[32]; 
                // Overflow check for SUB (A-B)
                OverFlow_reg = (A[31] != B[31]) && (Result_reg[31] != A[31]);
            end
            
            // ----------------------------------------------------
            // Logical Operations
            // ----------------------------------------------------
            3'b010: Result_reg = A & B;   // AND
            3'b011: Result_reg = A | B;   // OR
            3'b100: Result_reg = A ^ B;   // XOR
            
            // ----------------------------------------------------
            // Comparison: SLT (Set Less Than)
            // ----------------------------------------------------
            3'b101: begin 
                // Uses signed comparison logic
                Result_reg = ($signed(A) < $signed(B)) ? 32'b1 : 32'b0;
            end
            
            // ----------------------------------------------------
            // Shift Operations (assuming 3'b111 handles both SRL and SRA, 3'b110 for SLL)
            // ----------------------------------------------------
            3'b110: Result_reg = A << B[4:0]; // SLL (Shift Left Logical)
            3'b111: begin 
                // Default to SRL (Shift Right Logical) 
                // NOTE: SRA requires checking funct7 to sign extend, which is handled in a more complex ALU
                Result_reg = A >> B[4:0];
            end
            
            default: Result_reg = 32'hX; // Safety for unhandled control codes
        endcase
    end
    
    // Output Assignments (Flags)
    assign Result   = Result_reg;
    assign Zero     = (Result_reg == 32'b0); // True if result is zero
    assign Negative = Result_reg[31];       // True if result is negative (MSB=1)
    assign Carry    = Cout_reg;
    assign OverFlow = OverFlow_reg;

endmodule