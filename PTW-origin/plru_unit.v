module plru_unit(
	input [7:0] hit_bit,
	input [7:0] plru,

	output [7:0] new_plru
	);
	
	wire T_2437;
	wire T_2442;
	wire [1:0] T_2443;
	wire [3:0] T_2438;
	wire [2:0] three_bit_index;

	wire [1:0] T_2458;
	wire [2:0] T_2469;
	wire [7:0] T_2474;
	wire [3:0] T_2463;
	wire [7:0] GEN_124;
	wire [7:0] GEN_122;
	wire [7:0] T_2457;
	wire [7:0] T_2468;

	assign T_2437 = hit_bit[7:4] != 4'h0;
	assign T_2438 = hit_bit[7:4] | hit_bit[3:0];
	assign T_2442 = T_2438[3:2] != 2'h0;
	assign T_2443 = T_2438[3:2] | T_2438[1:0];
	assign three_bit_index = {T_2437, T_2442, T_2443[1]};

	assign T_2458 = {1'h1, three_bit_index[2]};
	assign T_2469 = {T_2458, three_bit_index[1]};
	assign T_2474 = 8'h1 << T_2469;
	assign T_2463 = 4'h1 << T_2458;
	assign GEN_124 = {4'h0, T_2463};
	assign GEN_122 = {6'd0, 2'h2};
	
	assign T_2457 = !three_bit_index[2] ? (GEN_122 | plru) : ~(GEN_122 | ~plru);
	assign T_2468 = !three_bit_index[1] ? (GEN_124 | T_2457) : ~(GEN_124 | ~T_2457);
	assign new_plru = !three_bit_index[0] ? (T_2474 | T_2468) : ~(T_2474 | ~T_2468);

endmodule