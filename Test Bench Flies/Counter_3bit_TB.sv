`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/02/2020 06:47:18 PM
// Design Name: 
// Module Name: Counter_3bit
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
module Counter_3bit_TB;
        reg aclk;
        wire [0:2] select;
            
    Counter_3bit UUT(.aclk(aclk), .select(select));
    
initial begin
    aclk = 0;
end
always #50 aclk = ~aclk;
 
endmodule