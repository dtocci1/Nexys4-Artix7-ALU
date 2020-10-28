//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2020 07:56:09 PM
// Design Name: 
// Module Name: Counter
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
module Counter(
        input clk,
        output logic aclk
    );
    
reg [15:0] counter;
    
always @(posedge clk) begin
    counter <= counter + 1;
end
 
assign aclk = counter[15];
 
endmodule
