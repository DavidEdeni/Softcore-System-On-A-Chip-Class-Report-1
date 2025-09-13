`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2025 10:08:20 PM
// Design Name: 
// Module Name: digitSel
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
`define DIGIT_ONE     4'B1110
`define DIGIT_TWO     4'B1101
`define DIGIT_THREE   4'B1011
`define DIGIT_FOUR    4'B0111

module digitSel(
    input logic En,
    input logic Cw,
    input logic clk,
    output logic side,
    output logic [7:0] An
    );
    
    // Accumulates 1-8. Assumes overflow, which we want
    // Resets Accu to 0 if not enabled
    logic [2:0] accu;
    always @(posedge(clk)) begin
        if(En) begin
            if(Cw)
                accu <= accu + 1;
            else
                accu <= accu - 1;
            end
         else begin
            accu = 0;
         end
     end
    
    // Sets the desired output digit.
    // An
    always_comb
        case (accu)
            0: An[3:0] = `DIGIT_ONE;
            1: An[3:0] = `DIGIT_TWO;
            2: An[3:0] = `DIGIT_THREE;
            3: An[3:0] = `DIGIT_FOUR;
            4: An[3:0] = `DIGIT_FOUR;
            5: An[3:0] = `DIGIT_THREE;
            6: An[3:0] = `DIGIT_TWO;
            7: An[3:0] = `DIGIT_ONE;
        endcase 
    assign An[7:4] = 4'b1111;
    assign side = accu[2];
         
endmodule



