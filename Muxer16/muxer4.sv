`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2019 19:55:52
// Design Name: 
// Module Name: muxer4
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


module muxer4(
    input [3:0] in,
    input [1:0] sel,
    output logic q
    );
    
    always_comb
    
    case (sel)
    2'b00 : q <= in[0];
    2'b01 : q <= in[1];
    2'b10 : q <= in[2];
    2'b11 : q <= in[3];
    endcase
    
endmodule
