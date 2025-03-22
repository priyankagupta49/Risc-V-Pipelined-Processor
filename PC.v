module PC_Module(
    input clk,
    input rst,
    input [31:0] PC_Next,
    output reg [31:0] PC  // Declaring PC as reg because it is updated inside always block
);

    always @(posedge clk) begin
        if (rst == 1'b0)
            PC <= 32'b0;  // Initialize PC to 0 on reset
        else
            PC <= PC_Next;
    end

endmodule
