module Data_Memory(
    input clk, rst, WE,
    input [31:0] A, WD,
    output reg [31:0] RD
);

    // Declare memory outside of any procedural block
    reg [31:0] mem [1023:0];

    // Memory write operation on clock edge
    always @(posedge clk) begin
        if (WE)
            mem[A] <= WD;
    end

    //  Read operation 
    always @(*) begin
        if (~rst)
            RD = 32'd0;
        else
            RD = mem[A];
    end

    // Initialize memory
    initial begin
       // mem[0] = 32'h00000002;
        mem[1] = 32'h00000006;
    end

endmodule

