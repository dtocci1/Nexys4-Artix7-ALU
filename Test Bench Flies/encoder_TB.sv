`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2020 06:30:37 PM
// Design Name: 
// Module Name: encoder_TB
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
`begin_keywords "1800-2012" //Use keyword list from SystemVerilog-2012.
`timescale 1ns/1ns

module encoder_tb;
    reg clk;
    reg [3:0] binNumber;
    wire [0:6] cathodeNumber;
    
    
    encoder UUT(.clk(clk),.binNumber(binNumber),.cathodeNumber(cathodeNumber));
        
initial begin
    clk = 0;
    binNumber = 0;
end
    always #25 clk = ~clk;
    always @(posedge clk) begin
        binNumber = binNumber + 1;
        end
endmodule
