
module Instruction_Memory(
    input rst,
    input [31:0] A,
    output [31:0] RD
);

    reg [31:0] mem [1023:0]; // 1 KB instruction memory

    // Read operation: If reset is low, return 0; otherwise, fetch instruction
    assign RD = (rst == 1'b0) ? 32'b0 : mem[A[31:2]];

    // Proper initialization of instructions
    initial begin
        mem[0] = 32'hFFC4A303; 
        mem[1] = 32'h00832383; 
        mem[2] = 32'h0064A423;
        mem[3] = 32'h00B62423;
        mem[4] = 32'h0062E233;
        mem[5] = 32'h00B62423;
    end

endmodule
