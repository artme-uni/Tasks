`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.04.2019 19:57:42
// Design Name: 
// Module Name: table
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


module mem(
    input [3:0] a,
    input [3:0] b,
    output [7:0] m,
    input clk
    );
parameter ROM_WIDTH = 8;
parameter ROM_ADDR_BITS = 8;

(* rom_style="{distributed}" *)
reg [ROM_WIDTH-1:0] rom_name [0 : (2**ROM_ADDR_BITS)-1]; 
//{
//8'h00 8'h00 8'h00 8'h00 8'h00 8'h00 8'h00 8'h00 8'h00 8'h00 8'h00 8'h00 8'h00 8'h00 8'h00 8'h00 
//8'h00 8'h01 8'h02 8'h03 8'h04 8'h05 8'h06 8'h07 8'h08 8'h09 8'h0a 8'h0b 8'h0c 8'h0d 8'h0e 8'h0f 
//8'h00 8'h02 8'h04 8'h06 8'h08 8'h0a 8'h0c 8'h0e 8'h10 8'h12 8'h14 8'h16 8'h18 8'h1a 8'h1c 8'h1e 
//8'h00 8'h03 8'h06 8'h09 8'h0c 8'h0f 8'h12 8'h15 8'h18 8'h1b 8'h1e 8'h21 8'h24 8'h27 8'h2a 8'h2d 
//8'h00 8'h04 8'h08 8'h0c 8'h10 8'h14 8'h18 8'h1c 8'h20 8'h24 8'h28 8'h2c 8'h30 8'h34 8'h38 8'h3c 
//8'h00 8'h05 8'h0a 8'h0f 8'h14 8'h19 8'h1e 8'h23 8'h28 8'h2d 8'h32 8'h37 8'h3c 8'h41 8'h46 8'h4b 
//8'h00 8'h06 8'h0c 8'h12 8'h18 8'h1e 8'h24 8'h2a 8'h30 8'h36 8'h3c 8'h42 8'h48 8'h4e 8'h54 8'h5a 
//8'h00 8'h07 8'h0e 8'h15 8'h1c 8'h23 8'h2a 8'h31 8'h38 8'h3f 8'h46 8'h4d 8'h54 8'h5b 8'h62 8'h69 
//8'h00 8'h08 8'h10 8'h18 8'h20 8'h28 8'h30 8'h38 8'h40 8'h48 8'h50 8'h58 8'h60 8'h68 8'h70 8'h78 
//8'h00 8'h09 8'h12 8'h1b 8'h24 8'h2d 8'h36 8'h3f 8'h48 8'h51 8'h5a 8'h63 8'h6c 8'h75 8'h7e 8'h87 
//8'h00 8'h0a 8'h14 8'h1e 8'h28 8'h32 8'h3c 8'h46 8'h50 8'h5a 8'h64 8'h6e 8'h78 8'h82 8'h8c 8'h96 
//8'h00 8'h0b 8'h16 8'h21 8'h2c 8'h37 8'h42 8'h4d 8'h58 8'h63 8'h6e 8'h79 8'h84 8'h8f 8'h9a 8'ha5 
//8'h00 8'h0c 8'h18 8'h24 8'h30 8'h3c 8'h48 8'h54 8'h60 8'h6c 8'h78 8'h84 8'h90 8'h9c 8'ha8 8'hb4 
//8'h00 8'h0d 8'h1a 8'h27 8'h34 8'h41 8'h4e 8'h5b 8'h68 8'h75 8'h82 8'h8f 8'h9c 8'ha9 8'hb6 8'hc3 
//8'h00 8'h0e 8'h1c 8'h2a 8'h38 8'h46 8'h54 8'h62 8'h70 8'h7e 8'h8c 8'h9a 8'ha8 8'hb6 8'hc4 8'hd2 
//8'h00 8'h0f 8'h1e 8'h2d 8'h3c 8'h4b 8'h5a 8'h69 8'h78 8'h87 8'h96 8'ha5 8'hb4 8'hc3 8'hd2 8'he1 
//}
reg [ROM_WIDTH-1:0] output_data;

logic [ROM_ADDR_BITS-1:0] address;

initial
    $readmemh("mult_table.txt", rom_name, 0, (2**ROM_ADDR_BITS)-1);
    
assign address = {b, a};

always@(posedge clk)
    output_data <= rom_name[address];
    
assign m = output_data;

endmodule 