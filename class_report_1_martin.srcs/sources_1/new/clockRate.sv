`timescale 1ns / 1ps

module clockRate#(parameter N = 29)(
    input logic clk,
    input logic rst,
    input logic en,
    output logic tic
    );
    
    logic [N-1:0] count, ncount;
    
    always_ff@(posedge(clk), posedge(rst))
        if(rst)
            count <= 0;
        else
            count <= ncount;
            
    always_comb begin
        if(en)
            if(count < 10000000) begin
                ncount = count + 1;
            end
            else begin
                ncount = 0;
            end
        else
            ncount = count;
    end
    
    assign tic = (count == 1);//(count > 2^(N-4));
endmodule