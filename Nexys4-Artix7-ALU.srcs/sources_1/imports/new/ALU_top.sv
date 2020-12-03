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
`timescale 1ns/1ns
module ALU_top(clk, BTNC, BTNU, BTND, BTNL, BTNR,C, SW, AN);
        input         clk, BTNC, BTNU, BTND, BTNL, BTNR;
        input  [15:0] SW;
        output [0:6]  C;
        output [0:7]  AN;
        reg[7:0] num1, num2;
        wire        aclk;
        wire [0:2]  select;
        wire [0:3]  opcode;
        wire [0:6]  dig0, dig1, dig2, dig3, dig4, dig5, dig6, dig7;
        wire [15:0] resultant;
            
            // Generate opcodes
            But_opcode But_opcode (.clk(clk), .BTNC(BTNC), .BTNU(BTNU), .BTND(BTND), .BTNL(BTNL), .BTNR(BTNR), .opcode(opcode)); // Convert button press into operation code
            
            // Reverse switches before inputting to ALU
            // Generate number 1
            //index_reverser index_reverser1(.clk(clk), .originalNumber
            
            // Run ALU on numbers
            ALU ALU (.clk(clk), .number1(SW[15:8]), .number2(SW[7:0]), .opcode(opcode), .resultant(resultant)); // Using button press and input from switches to perform arithmatic operation
            
            // Convert both input and output to cathode values for 7-segment display
            encoder encoder0(.clk(clk), .binNumber(SW[15:12]), .cathodeNumber(dig0));
            encoder encoder1(.clk(clk), .binNumber(SW[11:8]), .cathodeNumber(dig1));
            encoder encoder2(.clk(clk), .binNumber(SW[7:4]), .cathodeNumber(dig2));
            encoder encoder3(.clk(clk), .binNumber(SW[3:0]), .cathodeNumber(dig3));
            encoder encoder4(.clk(clk), .binNumber(resultant[15:12]), .cathodeNumber(dig4));
            encoder encoder5(.clk(clk), .binNumber(resultant[11:8]), .cathodeNumber(dig5));
            encoder encoder6(.clk(clk), .binNumber(resultant[7:4]), .cathodeNumber(dig6));
            encoder encoder7(.clk(clk), .binNumber(resultant[3:0]), .cathodeNumber(dig7));
            
            // Generate artificial clock to drive 7-segment display
            Counter Counter(.clk(clk), .aclk(aclk));
            
            // Generate 3-bit signal for select bits of anode and cathode MUX units
            Counter_3bit Counter_3bit(.aclk(aclk), .select(select));
            
            // MUX cathode
            cathode_MUX cathode_MUX(.aclk(aclk), .digit_select(select), .dig0(dig0), .dig1(dig1), .dig2(dig2), .dig3(dig3), .dig4(dig4), .dig5(dig5), .dig6(dig6), .dig7(dig7), .cathode(C));
            
            // MUX anode
            anode_MUX anode_MUX(.aclk(aclk), .digit_select(select), .anode(AN));
            
            // Run 7-segment display
            //segment_driver segment_driver(.aclk(aclk), .digit_select(select), .dig0(dig0), .dig1(dig1), .dig2(dig2), .dig3(dig3), .dig4(dig4), .dig5(dig5), .dig6(dig6), .dig7(dig7), .cathode(C), .anode(AN));
            
endmodule

