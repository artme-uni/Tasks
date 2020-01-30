`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2019 21:20:33
// Design Name: 
// Module Name: tb_cntr4
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


module tb_cntr4();

    logic   ud;
    logic   clk;
    logic   reset;
    logic [3:0] q;
    
    cntr4 DUT (.ud(ud), .clk(clk), .reset(reset), .q(q));
    
    parameter PERIOD  = 10ns;
    initial begin
       ud = 1'b1;
       clk = 1'b1;
       reset = 1'b1; #10;
       reset = 1'b0; #10;
       
      #(PERIOD/2);
      forever
        #(PERIOD/2) clk = ~clk;
    end

endmodule
