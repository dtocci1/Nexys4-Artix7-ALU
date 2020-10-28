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
//
// Revision 0.01 - File Created
//////////////////////////////////////////////////////////////////////////////////
`begin_keywords "1800-2012" // Use keyword list from SystemVerilog-2012.

module Segment_encoder(
        input               clk,
        input  logic [0:6]  dig0, dig1, dig2, dig3, dig4, dig5, dig6, dig7, // Cathode bits for each digit on the display
        output logic [0:6]  cathode, // Which part of 7-segment is on
        output logic [0:7]  anode    // Which digit is being displayed
    );
`timescale 1ns/1ns

reg[0:3] digit_sel; // used to select which digit is enabled
reg[0:20] counter; // used for a delay

always_ff @(posedge clk) begin
    if (counter == 200000) begin // ~1ms refresh rate as suggested by data sheet
        case(digit_sel)          // Display each digit based on digit_sel state
            3'b000: begin
                cathode <= dig0;
                anode   <= 11111110;
            end
            3'b001: begin
                cathode <= dig1;
                anode   <= 11111101;
            end
            3'b010: begin
                cathode <= dig2;
                anode   <= 11111011;            
            end
            3'b011: begin
                cathode <= dig3;
                anode   <= 11110111;
            end
            3'b100: begin
                cathode <= dig4;
                anode   <= 11101111;
            end
            3'b101: begin
                cathode <= dig5;
                anode   <= 11011111;
            end
            3'b110: begin
                cathode <= dig6;
                anode   <= 10111111;
            end
            3'b111: begin
                cathode <= dig7;
                anode   <= 01111111;             
            end 
        endcase
        
        if (digit_sel == "111") // Check if counter is full and reset (for selecting anode)
            digit_sel = 0;
        else
            digit_sel = digit_sel + 1; // Increment counter
       counter = 0; // reset delay
    end
    else begin
        counter = counter + 1; // Increment delay
    end
end
endmodule: Segment_encoder