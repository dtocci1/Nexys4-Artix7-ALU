`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 01:15:51 PM
// Design Name: 
// Module Name: counterTB
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


module counterTB;
    reg clk;
    wire out;
    
    Counter UUT(.clk(clk),.aclk(out));
    
initial begin
    clk = 0;
end

always #1 clk = ~clk;

endmodule
