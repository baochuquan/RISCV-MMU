module plru(
input [8:0] hits,
input [7:0] plru_val,

output [7:0] new_plru_val
);

wire T_491;
wire [3:0] T_492;
wire T_496;
wire T_498;
wire [2:0] T_500;

wire [2:0] T_523;
wire [1:0] T_512;
wire [7:0] T_528;
wire [7:0] T_522;
wire [3:0] T_517;
wire [7:0] GEN_63;
wire [7:0] T_529;
wire [7:0] T_532;

wire T_504;
wire [7:0] T_507;
wire [7:0] T_509;
wire [7:0] T_510;
wire [7:0] T_511;

assign T_507 = plru_val | ({{6'd0}, (2'h1 << 1'h1)});
assign T_509 = (~plru_val) | ({{6'd0}, (2'h1 << 1'h1)});
assign T_510 = ~T_509;
assign T_511 = T_504 ? T_507 : T_510;

assign T_491 = hits[7:4] != 4'h0;
assign T_492 = hits[7:4] | hits[3:0];
assign T_496 = T_492[3:2] != 2'h0;
assign T_498 = T_492[3:2] | T_492[1:0];
assign T_500 = {T_491, T_496, T_498};

assign T_512 = {1'h1, T_500[2]};
assign T_523 = {T_512, T_500[1]};
assign T_528 = 8'h1 << T_523;
assign T_517 = 4'h1 << T_512;
assign GEN_63 = {4'h0, T_517};
assign T_522 = !T_500[1] ? (T_511 | GEN_63) : ~(GEN_63 | (~T_511));
assign T_529 = T_528 | T_522;
assign T_532 = ~(T_528 | ~T_522);

assign new_plru_val = (!T_500[0]) ? T_529 : T_532;
assign T_504 = T_500[2] == 1'h0;

endmodule
