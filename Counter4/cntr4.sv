`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2019 21:18:14
// Design Name: 
// Module Name: cntr4
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


module cntr4(
    input clk,
    input reset,
    input ud,
    output logic [3:0] q
    );
    
    always @(posedge clk)
        if (reset)
            q <= 4'b0;
        else begin
            q[0] <= ~q[0];
            q[1] <= q[1] ^ ( ~ud & q[0]
                           | ud & ~q[0]);
            q[2] <= q[2] ^ ( ~ud & (q[1] & q[0])
                           | ud & (~q[1] & ~q[0]));
            q[3] <= q[3] ^ ( ~ud & (q[2] & q[1] & q[0])
                           | ud & (~q[2] & ~q[1] & ~q[0]));
        end
        
endmodule
