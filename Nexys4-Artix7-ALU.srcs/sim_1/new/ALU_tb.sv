`begin_keywords "1800-2012" //Use keyword list from SystemVerilog-2012.
module ALU_tb;
timeunit 1ns/1ns; // Simulation time unit of 1 ns, with precision of 1 ns.

bit clk;
reg[7:0]  number1,number2;
reg[0:3]  opcode;
reg[15:0] resultant;

ALU ALU_tb(
    .clk(clk),
    .number1(number1),
    .number2(number2),
    .opcode(opcode),
    .resultant(resultant)
);

// Generate clock
always #50 clk = ~clk;

initial
   begin
       number1 <= 8'h04;
       number2 <= 8'h02;
   #60 opcode <= 4'b0000; // ADDITION. EXPECT 0X0007
   assert(resultant == 16'h0006) else $error("Incorrect addition - OPC 0000");
   #110 opcode <= 4'b0001; // SUBTRACTION EXPECT 0X0001
   assert(resultant == 16'h0002) else $error("Incorrect subtraction - OPC 0001");
   #160 opcode <= 4'b0010; // MULTIPLY EXPECT 0X0012
   assert(resultant == 16'h0008) else $error("Incorrect subtraction - OPC 0001");
   #210 opcode <= 4'b0011; // DIVIDE EXPECT 0X0002
   assert(resultant == 16'h0008) else $error("Incorrect subtraction - OPC 0001");
   $finish;
   end
endmodule
`end_keywords