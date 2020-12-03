//////////////////////////////////////////////////////////////////////////////////
// Company: UMD
// Engineer: Dylan Tocci
// 
// Create Date: 10/18/2020 07:45:01 PM
// Design Name: 
// Module Name: ALU
// Project Name: ALU - 8-bit arithmatic logic unit - add,sub,mult,div,[exponential,trig,etc]
// Target Devices: Nexys 4 DDR Artix 7 board
// Tool Versions: 
// Description: 
//  - Use 16 switches to program 8-bit numbers to perform operations on
//      - Left 8 are first number, right 8 are second number
//      - Display both numbers on 4 leftmost digits of 7-segment display
//  - Use BTNC to store/progress calculator
//  - Use rightmost 4? switches to program calculation to be done
//  - Output operation result on right half of 7-segment display 
//  - Push BTNC? to loop back around and start over
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////
`begin_keywords "1800-2012" //Use keyword list from SystemVerilog-2012.
`timescale 1ns/1ns
module ALU(
        input               clk,
        input  logic [7:0]  number1,number2,
        input  logic [0:3]  opcode,
        output logic [15:0] resultant
    );

reg[15:0] stored_resultant;

always @(posedge clk) begin
    case (opcode)
        4'b0000:    // Add
            stored_resultant <= number1 + number2;
        4'b0001:    // Subtract
            stored_resultant <= number1 - number2;
        4'b0010:    // Multiply
            stored_resultant <= number1 * number2;
        4'b0011:    // Divide
            stored_resultant <= number1 / number2;
        4'b0100:    // Modulo
            stored_resultant <= number1 % number2;
        // Possibly add more cases if time
    endcase
    
    resultant <= stored_resultant;
end

endmodule: ALU