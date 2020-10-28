//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2020 04:11:52 PM
// Design Name: 
// Module Name: anode_MUX
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


module anode_MUX(
        input  aclk,
        input  [0:2] digit_select,
        output [0:7] anode
    );

reg[0:7] anode_reg;    

always @(posedge aclk) begin
    case(digit_select)
        3'b000:
            anode_reg <= 8'b11111110;
        3'b001:
            anode_reg <= 8'b11111101;
        3'b010:
            anode_reg <= 8'b11111011;
        3'b011:
            anode_reg <= 8'b11110111;
        3'b100:
            anode_reg <= 8'b11101111;
        3'b101:
            anode_reg <= 8'b11011111;
        3'b110:
            anode_reg <= 8'b10111111;
        3'b111:   
            anode_reg <= 8'b01111111;
    endcase
end

assign anode = anode_reg;

endmodule
