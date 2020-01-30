`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2019 23:49:12
// Design Name: 
// Module Name: sum64
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
    output [3:0] s,
    output cout
    );
    
logic [4:0] c;

assign c[0] = cin;

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1)
        begin: add
            assign s[i] = a[i] ^ b[i] ^ c[i];
            assign c[i + 1] = (a[i] & b[i]) || ((a[i] ^ b[i]) & c[i]);
        end
    endgenerate
    
    assign cout = c[4];

endmodule

module sum16( 
    input [15:0] a, 
    input [15:0] b, 
    input cin, 
    output [15:0] s, 
    output cout 
    ); 

logic [3:0] c; 

assign c[0] = cin; 

    genvar i; 
    generate 
        for (i=0; i<16; i=i+4) 
        begin: sum 
            summ4 s(.a(a[i + 3:i]), .b(b[i + 3:i]), .cin(c[i/4]), .s(s[i + 3:i]), .cout(c[i/4 + 1])); 
    end; 
    endgenerate 

assign cout = c[3]; 

endmodule 

module sum64( 
    input [63:0] a, 
    input [63:0] b, 
    input cin, 
    output [63:0] s, 
    output cout 
); 

logic [15:0] c; 

assign c[0] = cin; 

    genvar i; 
    generate 
        for (i=0; i<64; i=i+16) 
        begin: su 
            summ16 su(.a(a[i+15:i]), .b(b[i+15:i]), .cin(c[i/16]), .s(s[i+15:i]), .cout(c[i/16+1])); 
    end; 
    endgenerate 

assign cout = c[15]; 

endmodule
