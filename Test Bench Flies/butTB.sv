`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 01:23:47 PM
// Design Name: 
// Module Name: butTB
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


module butTB;
    reg clk;
    reg bu, bl, bc, br, bd;
    wire [0:3] opcode;
    reg [2:0] count; 
    But_opcode UUT(.clk(clk),.BTNC(bc),.BTNU(bu),.BTND(bd),.BTNL(bl),.BTNR(br), .opcode(opcode));
    
initial begin
    clk = 0;
    bu = 0; bl = 0; bc = 0; br = 0; bd = 0;
    count = 0;
end    

always #50 clk = ~clk;

always @(posedge clk) begin
    count = count + 1;
    if (count == 1) begin
        bu = 1; bl = 0; bc = 0; br = 0; bd = 0;
    end
    else if (count == 2) begin
        bu = 0; bl = 1; bc = 0; br = 0; bd = 0;
    end
    else if (count == 3) begin
        bu = 0; bl = 0; bc = 1; br = 0; bd = 0;
    end
    else if (count == 4) begin
        bu = 0; bl = 0; bc = 0; br = 1; bd = 0;
    end
    else if (count == 5) begin
        bu = 0; bl = 0; bc = 1; br = 0; bd = 1;
    end

end
    
endmodule
