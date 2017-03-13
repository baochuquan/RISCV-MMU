module replace_select_unit(
	input [7:0] plru,
	input [7:0] valid,

	output [2:0] replace_entry,
	output [7:0] new_valid
	);

	wire [7:0] T_2394;
	wire [7:0] T_2397;
	wire [7:0] T_2400;

	wire [1:0] T_2396;
	wire [2:0] T_2399;
	wire [3:0] T_2402;

	wire [2:0] plru_replace;
	wire [2:0] priority_replace;

	wire [7:0] T_2390;
	wire valid_andR;

	assign T_2394 = plru >> 1'h1;
	assign T_2396 = {1'h1, T_2394[0]};
	assign T_2397 = plru >> T_2396;
	assign T_2399 = {T_2396, T_2397[0]};
	assign T_2400 = plru >> T_2399;
	assign T_2402 = {T_2399, T_2400[0]};

	assign plru_replace = T_2402[2:0];

	assign T_2390 = ~valid;
	assign valid_andR = T_2390 == 8'h0;
	assign priority_replace = T_2390[0] ? 3'h0 : (T_2390[1] ? 3'h1: (T_2390[2] ? 3'h2: (T_2390[3] ? 3'h3: T_2390[4] ? 3'h4 : (T_2390[5] ? 3'h5: (T_2390[6] ? 3'h6 : 3'h7)))));
	assign replace_entry = valid_andR ? plru_replace : priority_replace;
	assign new_valid = (8'h1 << replace_entry) | valid;

endmodule