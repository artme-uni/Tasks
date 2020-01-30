`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.03.2019 11:12:48
// Design Name: 
// Module Name: muxer
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


module muxer(
    input [7:0] in,
    input [2:0] sel,
    output logic[0:0] q
    );
    
    always_comb
    
    case (sel)
   3'b000 : q <= in[0];
   3'b001 : q <= in[1];
   3'b010 : q <= in[2];
   3'b011 : q <= in[3];
   3'b100 : q <= in[4];
   3'b101 : q <= in[5];
   3'b110 : q <= in[6];
   3'b111 : q <= in[7];
   
   endcase
    
endmodule