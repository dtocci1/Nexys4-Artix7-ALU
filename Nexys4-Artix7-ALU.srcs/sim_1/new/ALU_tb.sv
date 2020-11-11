`begin_keywords "1800-2012" //Use keyword list from SystemVerilog-2012.
program automatic test ( // This is the test bench. It specifies input signals to drive the DUT.
    input               clk,
    input  logic [7:0]  number1,number2,
    input  logic [0:3]  opcode,
    output logic [15:0] resultant
 );
timeunit 1ns/1ns; // Simulation time unit of 1 ns, with precision of 1 ns.

initial // Generate rstN.
   begin
       number1 <= 8'h04;
       number2 <= 8'h02;
   #20 opcode <= 4'b0000; // ADDITION. EXPECT 0X0007
   assert(resultant == 16'h0006) else $error("Incorrect addition - OPC 0000");
   #20 opcode <= 4'b0001; // SUBTRACTION EXPECT 0X0001
   assert(resultant == 16'h0002) else $error("Incorrect subtraction - OPC 0001");
   #20 opcode <= 4'b0010; // MULTIPLY EXPECT 0X0012
   assert(resultant == 16'h0008) else $error("Incorrect subtraction - OPC 0001");
   #20 opcode <= 4'b0011; // DIVIDE EXPECT 0X0002
   assert(resultant == 16'h0008) else $error("Incorrect subtraction - OPC 0001");
   end

 initial   
   #200 $finish;
 
endprogram: test
`end_keywords