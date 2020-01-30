`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2019 21:29:01
// Design Name: 
// Module Name: cntr12
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


module cntr12(
    input clk,
    input reset,
    output logic [3:0] q
    );
    
   always @(posedge clk)
        if (reset || q == 11)
            q <= 4'b0;
        else begin
            q[0] <= ~q[0];
            q[1] <= q[1] ^ (q[0]);
            q[2] <= q[2] ^ (q[1] & q[0]);
            q[3] <= q[3] ^ (q[2] & q[1] & q[0]);
        end

endmodule
