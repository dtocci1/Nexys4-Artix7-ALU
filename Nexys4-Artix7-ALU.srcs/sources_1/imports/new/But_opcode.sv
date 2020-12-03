//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2020 01:04:43 PM
// Design Name: 
// Module Name: But_opcode
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

module But_opcode(
        input              clk, 
        input  logic       BTNC, BTNU, BTND, BTNL, BTNR,
        output logic [0:3] opcode
    );

reg[3:0] stored_opcode;

always @(posedge clk) begin
    if (BTNU == 1)
        stored_opcode <= 4'b0000; // ADD
    else if (BTNL == 1)
        stored_opcode <= 4'b0001; // SUB
    else if (BTNC == 1)
        stored_opcode <= 4'b0010; // MULT
    else if (BTNR == 1)
        stored_opcode <= 4'b0011; // DIV
    else if (BTND == 1)
        stored_opcode <= 4'b0100; // MODULO
    else
        stored_opcode <= 4'b1111; //error

    opcode <= stored_opcode;
end
endmodule
