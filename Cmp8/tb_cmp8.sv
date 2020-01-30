`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.03.2019 11:15:04
// Design Name: 
// Module Name: tb_cmp8
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


module cmp_tb();
    logic  [7:0]  a, b;
    logic         greater, lesser;
    
    cmp8 DUT (.a(a), .b(b), .GREATER(greater), .LESSER(lesser));
    
    initial begin
    
         {a, b} = 8'b0000000000000000; #10
         repeat (65536) begin
         {a, b} += 1; #10;
         
    end
    $finish;
    
    end;
    endmodule