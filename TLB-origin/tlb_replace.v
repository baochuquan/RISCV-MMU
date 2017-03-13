module tlb_replace(
input [7:0] valid,
input [7:0] plru_val,//8????

output [2:0] repl_waddr
);

wire T_426;
            
wire [2:0] T_444;
wire [2:0] T_445;
wire [2:0] T_446;
wire [2:0] T_447;
wire [2:0] T_448;
wire [2:0] T_449;
wire [2:0] T_450;

wire [7:0] T_452;
wire  T_453;
wire [1:0] T_454;
wire [7:0] T_455;
wire  T_456;
wire [2:0] T_457;
wire [7:0] T_458;
wire  T_459;
wire [3:0] T_460;
wire [2:0] T_461;


assign T_426 = ((~valid) == 8'h0) == 1'h0;//valid is not all 1

assign T_444 = (~valid[6]) ? 3'h6 : 3'h7;
assign T_445 = (~valid[5]) ? 3'h5 : T_444;
assign T_446 = (~valid[4]) ? 3'h4 : T_445;
assign T_447 = (~valid[3]) ? 3'h3 : T_446;
assign T_448 = (~valid[2]) ? 3'h2 : T_447;
assign T_449 = (~valid[1]) ? 3'h1 : T_448;
assign T_450 = (~valid[0]) ? 3'h0 : T_449;

//plru.replce
assign T_452 = plru_val >> 1'h1;
assign T_453 = T_452[0];
assign T_454 = {1'h1,T_453};
assign T_455 = plru_val >> T_454;
assign T_456 = T_455[0];
assign T_457 = {T_454,T_456};
assign T_458 = plru_val >> T_457;
assign T_459 = T_458[0];
assign T_460 = {T_457,T_459};
assign T_461 = T_460[2:0];

assign repl_waddr = T_426 ? T_450 : T_461;

endmodule
