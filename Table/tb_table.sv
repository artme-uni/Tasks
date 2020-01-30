`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2019 20:48:40
// Design Name: 
// Module Name: tb_table
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


module tb_table();

    logic [3:0] a, b;
    logic [7:0] m;
    logic clk;
    
    mem dut(.a(a), .b(b), .m(m), .clk(clk));
    
    always begin
        clk = 1'b0; #5;
        clk = 1'b1; #5;
    end
    
    initial begin
    {a, b} = 0;
    repeat (256) begin
        {a, b} ++; #10;
    end;
$finish;
end;

endmodule
