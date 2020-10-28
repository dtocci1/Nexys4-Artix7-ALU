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
module Counter_3bit(
        input aclk,
        output [0:2] select
    );
    
reg [0:2] digit_select;   
        
always @(posedge aclk) begin
    digit_select <= digit_select + 1;
end
 
assign select = digit_select;
 
endmodule
