
module Instruction_Memory(
    input rst,
    input [31:0] A,
    output [31:0] RD
);

    reg [31:0] mem [1023:0]; 

    assign RD = (rst == 1'b0) ? 32'b0 : mem[A[31:2]];

    initial begin
        mem[0] = 32'h00500093; // addi x1, x0, 5
        mem[1] = 32'h00A00113; // addi x2, x0, 10
        mem[2] = 32'h002081B3; // add x3, x1, x2
        mem[3] = 32'h06400213; // addi x4, x0, 100
        mem[4] = 32'h00322023; // sw x3, 0(x4)
        mem[5] = 32'h00022283; // lw x5, 0(x4)
    end

endmodule



