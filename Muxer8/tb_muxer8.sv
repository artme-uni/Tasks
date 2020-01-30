`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.03.2019 11:17:58
// Design Name: 
// Module Name: tb_muxer
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


module tb_muxer();

    logic [7:0] in;
    logic [0:0] q;
    logic [2:0] sel;
    
    muxer DUT(
        .in(in),
        .q(q), 
        .sel(sel)
        );
        
 initial begin
    sel = 3'b000;   in = 8'b00000001; #10;
    sel = 3'b000;   in = 8'b11111110; #10;

    sel = 3'b001;   in = 8'b00000010; #10;
    sel = 3'b001;   in = 8'b11111101; #10;

    sel = 3'b010;   in = 8'b00000100; #10;
    sel = 3'b010;   in = 8'b11111011; #10;
    
    sel = 3'b011;   in = 8'b00001000; #10;
    sel = 3'b011;   in = 8'b11110111; #10;
    
    sel = 3'b100;   in = 8'b00010000; #10;
    sel = 3'b100;   in = 8'b11101111; #10;
    
    sel = 3'b101;   in = 8'b00100000; #10;
    sel = 3'b101;   in = 8'b11011111; #10;
    
    sel = 3'b110;   in = 8'b01000000; #10;
    sel = 3'b110;   in = 8'b10111111; #10;
    
    sel = 3'b111;   in = 8'b10000000; #10;
    sel = 3'b111;   in = 8'b01111111; #10;
    
  $finish;
  end;
  
endmodule
