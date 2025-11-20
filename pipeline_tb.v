`timescale 1ns / 1ps

module tb();

    reg clk = 0;
    reg rst;

    always #100 clk = ~clk;

    initial begin
        rst = 1'b0;
        #200;
        rst = 1'b1;
        #1000;
        $finish;
    end


    // Instantiate the DUT 
    Pipeline_top dut (
        .clk(clk),
        .rst(rst)
    );

endmodule

