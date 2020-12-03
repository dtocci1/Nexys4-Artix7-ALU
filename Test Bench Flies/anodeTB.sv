`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 01:44:14 PM
// Design Name: 
// Module Name: anodeTB
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


module anodeTB;
    reg aclk;
    reg [0:2] digit_select;
    reg [0:7] anode;
    
    anode_MUX UUT(.aclk(aclk), .digit_select(digit_select), .anode(anode));
    
initial begin
    aclk = 0;
    digit_select = 0;
end

always #50 aclk = ~aclk;

always @(posedge aclk) begin
    digit_select = digit_select + 1;
end

endmodule
