//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2020 07:00:36 PM
// Design Name: 
// Module Name: encoder
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

module encoder(
        input clk,
        input logic  [3:0] binNumber,
        output logic [0:6] cathodeNumber 
    );


always @(posedge clk) begin // Due to how arrays are indexed in Verilog, doing [0111] on switch corresponds to [1110] in the case statement
    case(binNumber)
        4'b0000:
            cathodeNumber = 7'b0000001; // 0
        4'b0001:
            cathodeNumber = 7'b1001111; // 1
        4'b0010:
            cathodeNumber = 7'b0010010; // 2
        4'b0011:
            cathodeNumber = 7'b0000110; // 3
        4'b0100:
            cathodeNumber = 7'b1001100; // 4
        4'b0101:
            cathodeNumber = 7'b0100100; // 5
        4'b0110:
            cathodeNumber = 7'b0100000; // 6
        4'b0111:
            cathodeNumber = 7'b0001111; // 7
        4'b1000:
            cathodeNumber = 7'b0000000; // 8
        4'b1001:
            cathodeNumber = 7'b0000100; // 9
        4'b1010:
            cathodeNumber = 7'b0001000; // A
        4'b1011:
            cathodeNumber = 7'b1100000; // B
        4'b1100:
            cathodeNumber = 7'b0110001; // C
        4'b1101:
            cathodeNumber = 7'b1000010; // D
        4'b1110:
            cathodeNumber = 7'b0110000; // E
        4'b1111: 
            cathodeNumber = 7'b0111000; // F
    endcase
end
endmodule