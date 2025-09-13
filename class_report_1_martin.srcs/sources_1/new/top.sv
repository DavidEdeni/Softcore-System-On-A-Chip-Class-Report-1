`timescale 1ns / 1ps
//`include "Nexys-4-DDR-Master.xdc"

module top(
    input logic CLK100MHZ,
    input logic [15:0]SW,
    output logic CA,
    output logic CB,
    output logic CC,
    output logic CD,
    output logic CE,
    output logic CF,
    output logic CG,
    output logic [7:0] An
);

// SW[0] is Enable
// SW[1] is Clockwise


//logic [15:0]SW;
//logic CLK100MHZ;
//logic CA;
//logic CB;
//logic CC;
//logic CD;
//logic CE;
//logic CF;
//logic CG;
//logic [6:0] An;

logic [6:0]CX;
logic clk;
logic side;

clockRate #(.N(29)) clockRate(
    .clk(CLK100MHZ),
    .rst(0),
    .en(1),
    .tic(clk)
    );

digitSel digitSel(
    .En(SW[0]),
    .Cw(SW[1]),
    .clk(clk),
    .side(side),
    .An(An)
    );

segSel segSel(
    .side(side),
    .CX(CX)
    );
    
assign {CA, CB, CC, CD, CE, CF, CG} = CX[6:0];

endmodule