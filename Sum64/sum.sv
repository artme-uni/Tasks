`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2019 11:07:28
// Design Name: 
// Module Name: sum
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


module sum4(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
    );
    
    logic [4:0] c;
    
    assign c[0] = cin;
    
    genvar i;
    
    generate 
        for(i = 0; i < 4; i++)
        begin : add
            assign sum[i] = a[i] ^ b[i] ^ c[i];
            assign c[i+1] = (a[i] & b[i]) | ((a[i] ^ b[i]) & c[i]);
        end
        endgenerate
        
    assign cout = c[4];
    
endmodule
   
//module sum16(
//    input [15:0] a,
//    input [15:0] b,
//    input cin,
//    output [15:0] sum,
//    output cout
//    );
    
//    loqic [3:0] tmp;
   
//    sum4 s(.a(a[15:12]), .b(b[15:12]), .cin(cin), .sum(sum[15:12]), .cout(tmp[0]));
    
//    genvar i;
//    generate
//        for (i = 0; i < 3; i += 1)
//        begin: add;
//            sum4 sum(.a({a[11-4*i], a[8-4*i]}), .b({b[11-4*i], b[8-4*i]}), .cin(tmp[i]), .sum({a[11-4*i], a[8-4*i]}), .cout(tmp[i+1]));
//    end
//    endgenerate
    
//assign cout = tmp[3];
    
//endmodule
