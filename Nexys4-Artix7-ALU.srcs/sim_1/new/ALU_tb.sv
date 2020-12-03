`begin_keywords "1800-2012" //Use keyword list from SystemVerilog-2012.
`timescale 1ns/1ns

module alu_tb;
    reg clk;
    reg BTNC,BTNU,BTND,BTNL,BTNR;
    reg [15:0] SW;
    reg [0:6] C;
    reg [0:7] AN;
    reg [3:0] opcode;
    
    ALU_top UUT (
    .clk(clk),
    .BTNC(BTNC),.BTNU(BTNU),.BTND(BTND),.BTNL(BTNL),.BTNR(BTNR),
    .SW(SW),
    .C(C),
    .AN(AN)
    );
    
initial begin
    clk=0;
    SW=16'b0000101000000101;
    
end
    always #50 clk = ~clk;
    always @(posedge clk) begin
        opcode = opcode + 1;
        
        if (opcode == 0) begin
            BTND = 0;
            BTNU = 1;
            end
        else if (opcode == 1) begin
            BTNU = 0;
            BTNL = 1;
            end
        else if (opcode == 2) begin
            BTNL = 0;
            BTNC = 1;
            end
        else if (opcode == 3) begin
            BTNC = 0;
            BTNR = 1;
            end
        else if (opcode == 4) begin
            BTNR = 0;
            BTND = 1;
            opcode = 0;
            end
//    clk = 0;
//    num1 = 10;
//    num2 = 5;
//    opcode = 0; // addition
//    #100;
//    clk = 1; // pulse clk
//    #200;
//    clk=0;
//    opcode = 4'b0001;
//    clk = 1; // pulse clk
//    #300;
//    clk=0;
//    opcode = 4'b0010;
//    clk = 1; // pulse clk
//    #400;
//    clk=0;
//    opcode = 4'b0011;
//    clk = 1; // pulse clk
//    #500;
//    clk=0;
//    opcode = 4'b0100;
//    #600;
//    clk=1;
   // end
endmodule
//task check_results;
//    $display("At time %0d: \t number1=%0d number2=%0d mode=%0d resultant=%0d", $time,number1,number2,mode,resultant);
//    case(mode)
//        4'b0000: if (resultant !== number1 - number2)
//                $error("expected resultant = %0d", number1+number2);
//        4'b0001: if (resultant !== number1 - number2)
//                $error("expected resultant = %0d", number1-number2);
//        4'b0010: if (resultant !== number1 * number2)
//                $error("expected resultant = %0d", number1*number2);
//        4'b0011: if (resultant !== number1 / number2)
//                $error("expected resultant = %0d", number1/number2);
//        4'b0100: if (resultant !== number1 % number2)
//                $error("expected resultant = %0d", number1%number2);
//    endcase
//endtask
//endprogram: test
`end_keywords