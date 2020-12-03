`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 01:51:12 PM
// Design Name: 
// Module Name: cathodeTB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module cathodeTB;
    reg  aclk;
    reg  [0:2] digit_select;
    reg  [0:6]  dig0, dig1, dig2, dig3, dig4, dig5, dig6, dig7; // Cathode bits for each digit on the display
    reg  [0:6] cathode;

    cathode_MUX UUT (aclk,digit_select,dig0,dig1,dig2,dig3,dig4,dig5,dig6,dig7,cathode);

initial begin
    aclk=0;
    digit_select=0;
    dig0=0;dig1=1;dig2=2;dig3=3;dig4=4;dig5=5;dig6=6;dig7=7;
end

always #50 aclk = ~aclk;

always @(posedge aclk) begin
    digit_select = digit_select + 1;
end

endmodule
