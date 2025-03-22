module fetch_cycle(
    input clk, rst,
    input PCSrcE,
    input [31:0] PCTargetE,
    output [31:0] InstrD,
    output [31:0] PCD, PCPlus4D
);

    // Declaring internal wires
    wire [31:0] PC_F, PCF, PCPlus4F;
    wire [31:0] InstrF;

    // Registers for fetch cycle
    reg [31:0] InstrF_reg;
    reg [31:0] PCF_reg, PCPlus4F_reg;

    // PC Mux - Selects Next PC Address
    Mux PC_MUX (
        .a(PCPlus4F),
        .b(PCTargetE),
        .s(PCSrcE),
        .c(PC_F)  // PC_F is the Next PC Address
    );

    // PC Counter Module - Holds Current PC Value
    PC_Module Program_Counter (
        .clk(clk),
        .rst(rst),
        .PC_Next(PC_F),  // Next PC Value
        .PC(PCF)         // Current PC Value
    );

    // Instruction Memory
    Instruction_Memory IMEM (
        .rst(rst),
        .A(PCF),
        .RD(InstrF)
    );

    // PC Adder - Computes PC + 4
    PC_Adder PC_adder (
        .a(PCF),
        .b(32'h00000004),
        .c(PCPlus4F)
    );

    // Fetch Cycle Register Logic - Synchronous Reset for Vivado Compatibility
    always @(posedge clk) begin
        if (!rst) begin
            InstrF_reg   <= 32'h00000000;
            PCF_reg      <= 32'h00000000;
            PCPlus4F_reg <= 32'h00000000;
        end
        else begin
            InstrF_reg   <= InstrF;
            PCF_reg      <= PCF;
            PCPlus4F_reg <= PCPlus4F;
        end
    end

    // Assign outputs directly from registers
    assign InstrD    = InstrF_reg;
    assign PCD       = PCF_reg;
    assign PCPlus4D  = PCPlus4F_reg;

endmodule
