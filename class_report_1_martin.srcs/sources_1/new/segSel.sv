`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2025 10:08:20 PM
// Design Name: 
// Module Name: segSel
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
`define TOPSIDE 1'b0
`define BOTTOMSIDE 1'b1
`define TOP    7'b1100010
`define BOTTOM 7'b0011100


module segSel(
    input logic side,
    output logic [6:0] CX
    );
    
    always_comb begin
        case (side)
            `BOTTOMSIDE:
                CX <= `TOP;
            `TOPSIDE:
                CX <= `BOTTOM;
        endcase
    end
    
endmodule

//  ---A---
// |       |
// F       B
// |       |
//  ---G---
// |       |
// E       C
// |       |
//  ---D---
    