module writeback_cycle(
    input clk,
    input rst,
    input ResultSrcW,          // Ensure this is a 1-bit signal
    input [31:0] PCPlus4W,
    input [31:0] ALU_ResultW,
    input [31:0] ReadDataW,
    output [31:0] ResultW
);

// Mux instantiation for selecting between ALU result and Read Data
Mux result_mux (    
    .a(ALU_ResultW),
    .b(ReadDataW),
    .s(ResultSrcW),
    .c(ResultW)
);

endmodule
