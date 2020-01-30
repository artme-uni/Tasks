`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.03.2019 11:07:05
// Design Name: 
// Module Name: cmp8
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


module cmp2(
    input [1:0] a,
    input [1:0] b,
    output greater,
    output lesser
  );
    
  assign greater = a[1] & !b[1]
                    | !a[1] & !b[1] &  a[0] & !b[0]
                    |  a[1] &  b[1] &  a[0] & !b[0];
  assign lesser = !a[1] & b[1]
                    | !a[1] & !b[1] & !a[0] &  b[0]
                    |  a[1] &  b[1] & !a[0] &  b[0];                   
endmodule

module cmp8 (
    input [7:0] a,
    input [7:0] b,
    output GREATER,
    output LESSER
  );
  
  logic [6:0] g, l;
  
// cmp2 c0(.a(a[1:0]), .b(b[1:0]), .greater(g[0]), .lesser(l[0]));
//  genvar i;
//  generate
//    for (i = 0; i < 6; i = i + 1)
//    begin: label;
//      cmp2 c(.a({a[i+2], g[i]}), .b({b[i+2], l[i]}), .greater(g[i+1]), .lesser(l[i+1]));
//    end
//  endgenerate

  genvar i;
  generate
    for (i = 0; i < 4; i = i + 1)
    begin: labe1;
      cmp2 c(.a({a[2*i+1],a[2*i]}), .b({b[2*i+1], b[2*i]}), .greater(g[i]), .lesser(l[i]));
    end
  endgenerate 

  
    genvar j;
  generate
    for (j = 0; j < 3; j = j + 1)
    begin: labe2;
      cmp2 c(.a({g[2*j+1],g[2*j]}), .b({l[2*j+1], l[2*j]}), .greater(g[j+4]), .lesser(l[j+4]));
    end
  endgenerate


  assign GREATER = g[6];
  assign LESSER = l[6];
endmodule