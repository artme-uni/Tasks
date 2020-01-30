module muxer16(
    input [15:0] in,
    input [3:0] sel,
    output logic q
    );
    
logic [3:0] tmp;

muxer4 m00(.in(in[3:0]), .sel(sel[1:0]), .q(tmp[0]));
muxer4 m01(.in(in[7:4]), .sel(sel[1:0]), .q(tmp[1]));
muxer4 m10(.in(in[11:8]), .sel(sel[1:0]), .q(tmp[2]));
muxer4 m11(.in(in[15:12]), .sel(sel[1:0]), .q(tmp[3]));

muxer4 m100(.in(tmp), .sel(sel[3:2]), .q(q));

endmodule    