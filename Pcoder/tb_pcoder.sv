`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2019 20:18:29
// Design Name: 
// Module Name: tb_pcoder
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


module tb_pcoder();
    logic [7:0] in;
    logic [2:0] code;
    
 pcoder DUT(
    .in(in),
    .code(code)
    );
    
 initial begin
    in = 8'b00000000; #5;
    repeat (256) begin
        in += 1;
    end
$finish;

end;




endmodule
