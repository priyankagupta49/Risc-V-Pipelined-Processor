
module tb();

    reg clk = 0;
    reg rst;

    always #100 clk = ~clk; // Clock = 200ns period

    initial begin
        rst = 1'b0;
        #200;
        rst = 1'b1;
        
        
dut.fetch.IMEM.mem[0] = 32'h0FF00493;  // addi x9, x0, 255
dut.fetch.IMEM.mem[1] = 32'h0AA00513;  // addi x10, x0, 170

dut.fetch.IMEM.mem[2] = 32'h00A485B3;  // add x11, x9, x10
dut.fetch.IMEM.mem[3] = 32'h00500813;  // addi x17, x0, 5


dut.fetch.IMEM.mem[4] = 32'hFFB58593;  // addi x11, x11, -5










//dut.fetch.IMEM.mem[3] = 32'h00000013;
//dut.fetch.IMEM.mem[4] = 32'h00000013;
//dut.fetch.IMEM.mem[5] = 32'h40A48633;
//dut.fetch.IMEM.mem[6] = 32'h00A4F6B3;
//dut.fetch.IMEM.mem[7] = 32'h00A4E733;
//dut.fetch.IMEM.mem[8] = 32'h00A4C7B3;
//dut.fetch.IMEM.mem[9] = 32'h00A4A833;

        ///55,33
//        dut.fetch.IMEM.mem[0] = 32'h05500493;
//dut.fetch.IMEM.mem[1] = 32'h03300513;
//dut.fetch.IMEM.mem[2] = 32'h00A485B3;
//dut.fetch.IMEM.mem[3] = 32'h00000013;
//dut.fetch.IMEM.mem[4] = 32'h00000013;
//dut.fetch.IMEM.mem[5] = 32'h40A48633;
//dut.fetch.IMEM.mem[6] = 32'h00A4F6B3;
//dut.fetch.IMEM.mem[7] = 32'h00A4E733;
//dut.fetch.IMEM.mem[8] = 32'h00A4C7B3;
//dut.fetch.IMEM.mem[9] = 32'h00A4A833;

        
        
        
        ///55,aa
//        dut.fetch.IMEM.mem[0] = 32'h0AA00493;
//dut.fetch.IMEM.mem[1] = 32'h05500513;
//dut.fetch.IMEM.mem[2] = 32'h00A485B3;
//dut.fetch.IMEM.mem[3] = 32'h00000013;
//dut.fetch.IMEM.mem[4] = 32'h00000013;
//dut.fetch.IMEM.mem[5] = 32'h40A48633;
//dut.fetch.IMEM.mem[6] = 32'h00A4F6B3;
//dut.fetch.IMEM.mem[7] = 32'h00A4E733;
//dut.fetch.IMEM.mem[8] = 32'h00A4C7B3;
//dut.fetch.IMEM.mem[9] = 32'h00A4A833;

        
        
//        dut.fetch.IMEM.mem[0] = 32'h00A00493;
//dut.fetch.IMEM.mem[1] = 32'h00500513;
//dut.fetch.IMEM.mem[2] = 32'h00A485B3;
//dut.fetch.IMEM.mem[3] = 32'h00000013;
//dut.fetch.IMEM.mem[4] = 32'h00000013;
//dut.fetch.IMEM.mem[5] = 32'h40A48633;
//dut.fetch.IMEM.mem[6] = 32'h00A4F6B3;
//dut.fetch.IMEM.mem[7] = 32'h00A4E733;
//dut.fetch.IMEM.mem[8] = 32'h00A4C7B3;
//dut.fetch.IMEM.mem[9] = 32'h00A4A833;

//        dut.fetch.IMEM.mem[0] = 32'h0AA04813;
//dut.fetch.IMEM.mem[1] = 32'h05500513;
//dut.fetch.IMEM.mem[2] = 32'h00A485B3;
//dut.fetch.IMEM.mem[3] = 32'h00000013;
//dut.fetch.IMEM.mem[4] = 32'h00000013;
//dut.fetch.IMEM.mem[5] = 32'h40A48633;
//dut.fetch.IMEM.mem[6] = 32'h00A4F6B3;
//dut.fetch.IMEM.mem[7] = 32'h00A4E733;
//dut.fetch.IMEM.mem[8] = 32'h00A4C7B3;
//dut.fetch.IMEM.mem[9] = 32'h00A4A833;

        //***
        
//        dut.fetch.IMEM.mem[0] = 32'h00300493;
//dut.fetch.IMEM.mem[1] = 32'h00600513;
//dut.fetch.IMEM.mem[2] = 32'h00A485B3;
//dut.fetch.IMEM.mem[3] = 32'h00000013;
//dut.fetch.IMEM.mem[4] = 32'h00000013;
//dut.fetch.IMEM.mem[5] = 32'h40A48633;
//dut.fetch.IMEM.mem[6] = 32'h00A4F6B3;
//dut.fetch.IMEM.mem[7] = 32'h00A4E733;
//dut.fetch.IMEM.mem[8] = 32'h00A4C7B3;
//dut.fetch.IMEM.mem[9] = 32'h00A4A833;

        
        
//        dut.fetch.IMEM.mem[0] = 32'h00200493;
//dut.fetch.IMEM.mem[1] = 32'h00900513;
//dut.fetch.IMEM.mem[2] = 32'h00A485B3;
//dut.fetch.IMEM.mem[3] = 32'h00000013;
//dut.fetch.IMEM.mem[4] = 32'h00000013;
//dut.fetch.IMEM.mem[5] = 32'h40A48633;
//dut.fetch.IMEM.mem[6] = 32'h00A4F6B3;
//dut.fetch.IMEM.mem[7] = 32'h00A4E733;
//dut.fetch.IMEM.mem[8] = 32'h00A4C7B3;
//dut.fetch.IMEM.mem[9] = 32'h00A4A833;
  
    //***    
//        dut.fetch.IMEM.mem[0] = 32'h00400493;
//dut.fetch.IMEM.mem[1] = 32'h00700513;
//dut.fetch.IMEM.mem[2] = 32'h00A485B3;
//dut.fetch.IMEM.mem[3] = 32'h00000013;
//dut.fetch.IMEM.mem[4] = 32'h00000013;
//dut.fetch.IMEM.mem[5] = 32'h40A48633;
//dut.fetch.IMEM.mem[6] = 32'h00A4F6B3;
//dut.fetch.IMEM.mem[7] = 32'h00A4E733;
//dut.fetch.IMEM.mem[8] = 32'h00A4C7B3;
//dut.fetch.IMEM.mem[9] = 32'h00A4A833;

        
//***
//dut.fetch.IMEM.mem[0] = 32'h00600493;
//dut.fetch.IMEM.mem[1] = 32'h00700513;
//dut.fetch.IMEM.mem[2] = 32'h00A485B3;
//dut.fetch.IMEM.mem[3] = 32'h00000013;
//dut.fetch.IMEM.mem[4] = 32'h00000013;
//dut.fetch.IMEM.mem[5] = 32'h40A48633;
//dut.fetch.IMEM.mem[6] = 32'h00A4F6B3;
//dut.fetch.IMEM.mem[7] = 32'h00A4E733;
//dut.fetch.IMEM.mem[8] = 32'h00A4C7B3;
//dut.fetch.IMEM.mem[9] = 32'h00A4A833;


        //****
        
//dut.fetch.IMEM.mem[0] = 32'h00500093;   // addi x1, x0, 5      → x1 = 5
//dut.fetch.IMEM.mem[1] = 32'h00800113;  // addi x2, x0, 8      → x2 = 8
//dut.fetch.IMEM.mem[2] = 32'h002081B3;   // add x3, x1, x2      → x3 = 5 + 8 = 13
//dut.fetch.IMEM.mem[3] = 32'h00000013;
//dut.fetch.IMEM.mem[4] = 32'h00000013;
//dut.fetch.IMEM.mem[5] = 32'h40208233;   // sub x4, x1, x2      → x4 = 5 - 8 = -3
//dut.fetch.IMEM.mem[6] = 32'h0020F2B3;   // and x5, x1, x2      → x5 = 5 & 8 = 0
//dut.fetch.IMEM.mem[7] = 32'h0020E333;   // or  x6, x1, x2      → x6 = 5 | 8 = 13
//dut.fetch.IMEM.mem[8] = 32'h0020C3B3;   // xor x7, x1, x2      → x7 = 5 ^ 8 = 13

//dut.fetch.IMEM.mem[9] = 32'h0020A433;   // slt x8, x1, x2      → x8 = (5 < 8) ? 1 : 0 = 1

//dut.fetch.IMEM.mem[0] = 32'h00500093;
//dut.fetch.IMEM.mem[1] = 32'h00900113;
//dut.fetch.IMEM.mem[2] = 32'h002081B3;  

//dut.fetch.IMEM.mem[0] = 32'h00400093; // addi x1, x0, 4
//dut.fetch.IMEM.mem[1] = 32'h00700113; // addi x2, x0, 7

//dut.fetch.IMEM.mem[2] = 32'h002081B3; // add  x3 = x1 + x2 = 11
//dut.fetch.IMEM.mem[3] = 32'h00000013;
//dut.fetch.IMEM.mem[4] = 32'h00000013;
//dut.fetch.IMEM.mem[5] = 32'h40208233; // sub  x4 = x1 - x2 = -3
//dut.fetch.IMEM.mem[6] = 32'h0020A2B3; // and  x5 = 4 & 7 = 4
//dut.fetch.IMEM.mem[7] = 32'h0020B333; // or   x6 = 4 | 7 = 7
//dut.fetch.IMEM.mem[8] = 32'h0020C3B3; // xor  x7 = 4 ^ 7 = 3
//dut.fetch.IMEM.mem[9] = 32'h0020D433; // slt  x8 = (4 < 7) = 1





       
        
        #6000;
        $finish;
    end

    // Instantiate DUT
    Pipeline_top dut (
        .clk(clk),
        .rst(rst)
    );

endmodule
