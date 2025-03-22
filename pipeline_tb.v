`timescale 1ns / 1ps

module tb();

    reg clk = 0;
    reg rst;

    always #100 clk = ~clk; // Generate clock with 100 ns period (50 ns high, 50 ns low)

    initial begin
        rst = 1'b0;
        #200;
        rst = 1'b1;
        #1000;
        $finish;
    end

    initial begin
        // Vivado does not support $dumpfile/$dumpvars, use this instead
        $display("Running simulation...");
        $timeformat(-9, 2, " ns", 10); // Set time format
    end

    // Instantiate the DUT (Design Under Test)
    Pipeline_top dut (
        .clk(clk),
        .rst(rst)
    );

endmodule
