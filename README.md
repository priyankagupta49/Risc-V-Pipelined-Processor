# Risc-V-Processor
Designed a 5 stage pipelined RISC V processor using verilog in vivado
Developed and optimized the following pipeline stages:

Instruction Fetch (IF): Fetched instructions from memory and updated the Program Counter (PC).

Instruction Decode (ID): Decoded instructions and read registers for execution.

Execute (EX): Performed ALU operations, branch calculations, and forwarding.

Memory Access (MEM): Read/write data memory and handled load/store instructions.

Write Back (WB): Wrote computed results back to registers for further processing.

Implemented data hazard detection and forwarding to optimize performance.
