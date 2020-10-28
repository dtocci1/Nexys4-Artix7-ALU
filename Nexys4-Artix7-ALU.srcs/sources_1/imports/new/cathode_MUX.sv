//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2020 04:11:52 PM
// Design Name: 
// Module Name: cathode_MUX
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


module cathode_MUX(
        input  aclk,
        input        [0:2] digit_select,
        input logic  [0:6]  dig0, dig1, dig2, dig3, dig4, dig5, dig6, dig7, // Cathode bits for each digit on the display
        output       [0:6] cathode
    );

reg[0:6] cathode_reg;    

always @(posedge aclk) begin
    case(digit_select)
        3'b000:
            cathode_reg <= dig0;
        3'b001:
            cathode_reg <= dig1;
        3'b010:
            cathode_reg <= dig2;
        3'b011:
            cathode_reg <= dig3;
        3'b100:
            cathode_reg <= dig4;
        3'b101:
            cathode_reg <= dig5;
        3'b110:
            cathode_reg <= dig6;
        3'b111:   
            cathode_reg <= dig7;
    endcase
end

assign cathode = cathode_reg;

endmodule
