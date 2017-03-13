module cache_search_unit(
	input [37:0] pte_ppn,
	input [7:0] hit_bit,
	input [2:0] replace_entry,
	input [19:0] ppn_7,
	input [19:0] ppn_6,
	input [19:0] ppn_5,
	input [19:0] ppn_4,
	input [19:0] ppn_3,
	input [19:0] ppn_2,
	input [19:0] ppn_1,
	input [19:0] ppn_0,

	output [19:0] pte_cache_data
	);

	wire [19:0] ppn_tmp_0;
	wire [19:0] ppn_tmp_1;
	wire [19:0] ppn_tmp_2;
	wire [19:0] ppn_tmp_3;
	wire [19:0] ppn_tmp_4;
	wire [19:0] ppn_tmp_5;
	wire [19:0] ppn_tmp_6;
	wire [19:0] ppn_tmp_7;

	assign ppn_tmp_0 = hit_bit[0] ? (replace_entry == 3'h0 ? pte_ppn[19:0] : ppn_0) : 20'h0;
	assign ppn_tmp_1 = hit_bit[1] ? (replace_entry == 3'h1 ? pte_ppn[19:0] : ppn_1) : 20'h0;
	assign ppn_tmp_2 = hit_bit[2] ? (replace_entry == 3'h2 ? pte_ppn[19:0] : ppn_2) : 20'h0;
	assign ppn_tmp_3 = hit_bit[3] ? (replace_entry == 3'h3 ? pte_ppn[19:0] : ppn_3) : 20'h0;
	assign ppn_tmp_4 = hit_bit[4] ? (replace_entry == 3'h4 ? pte_ppn[19:0] : ppn_4) : 20'h0;
	assign ppn_tmp_5 = hit_bit[5] ? (replace_entry == 3'h5 ? pte_ppn[19:0] : ppn_5) : 20'h0;
	assign ppn_tmp_6 = hit_bit[6] ? (replace_entry == 3'h6 ? pte_ppn[19:0] : ppn_6) : 20'h0;
	assign ppn_tmp_7 = hit_bit[7] ? (replace_entry == 3'h7 ? pte_ppn[19:0] : ppn_7) : 20'h0;

	assign pte_cache_data = ppn_tmp_0 | ppn_tmp_1 | ppn_tmp_2 | ppn_tmp_3 | ppn_tmp_4 | ppn_tmp_5 | ppn_tmp_6 | ppn_tmp_7;

endmodule