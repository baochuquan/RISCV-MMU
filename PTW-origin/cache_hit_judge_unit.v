module cache_hit_judge_unit(
	input [1:0] count,
	input [7:0] valid,
	input [49:0] pte_addr,
	input [31:0] tag_7,
	input [31:0] tag_6,
	input [31:0] tag_5,
	input [31:0] tag_4,
	input [31:0] tag_3,
	input [31:0] tag_2,
	input [31:0] tag_1,
	input [31:0] tag_0,

	output hit,
	output [7:0] hit_bit,
	output pte_cache_hit
	);

	wire hit_0;
	wire hit_1;
	wire hit_2;
	wire hit_3;
	wire hit_4;
	wire hit_5;
	wire hit_6;
	wire hit_7;

	assign hit_0 = {18'd0, tag_0} == pte_addr;
	assign hit_1 = {18'd0, tag_1} == pte_addr;
	assign hit_2 = {18'd0, tag_2} == pte_addr;
	assign hit_3 = {18'd0, tag_3} == pte_addr;
	assign hit_4 = {18'd0, tag_4} == pte_addr;
	assign hit_5 = {18'd0, tag_5} == pte_addr;
	assign hit_6 = {18'd0, tag_6} == pte_addr;
	assign hit_7 = {18'd0, tag_7} == pte_addr;

	assign hit_bit = {hit_7, hit_6, hit_5, hit_4, hit_3, hit_2, hit_1, hit_0} & valid;
	assign hit = hit_bit != 8'h0;
	assign pte_cache_hit = hit & (count < 2'h2);

endmodule