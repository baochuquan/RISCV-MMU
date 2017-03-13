module ppn_generate(
input [19:0] ppns_0,
input [19:0] ppns_1,
input [19:0] ppns_2,
input [19:0] ppns_3,
input [19:0] ppns_4,
input [19:0] ppns_5,
input [19:0] ppns_6,
input [19:0] ppns_7,
input [19:0] passthrough_ppn,
input [8:0] hitsVec,

output [19:0] io_resp_ppn
);

wire [19:0] T_556;
wire [19:0] T_558;
wire [19:0] T_560;
wire [19:0] T_562;
wire [19:0] T_564;
wire [19:0] T_566;
wire [19:0] T_568;
wire [19:0] T_570;
wire [19:0] T_572;

assign T_556 = hitsVec[0] ? ppns_0 : 20'h0;
assign T_558 = hitsVec[1] ? ppns_1 : 20'h0;
assign T_560 = hitsVec[2] ? ppns_2 : 20'h0;
assign T_562 = hitsVec[3] ? ppns_3 : 20'h0;
assign T_564 = hitsVec[4] ? ppns_4 : 20'h0;
assign T_566 = hitsVec[5] ? ppns_5 : 20'h0;
assign T_568 = hitsVec[6] ? ppns_6 : 20'h0;
assign T_570 = hitsVec[7] ? ppns_7 : 20'h0;
assign T_572 = hitsVec[8] ? passthrough_ppn : 20'h0;
assign io_resp_ppn = T_556 | T_558 | T_560 | T_562 | T_564 | T_566 | T_568 | T_570 | T_572;

endmodule