module no_leaf_pte_check_unit(
	input pte_v,
	input pte_r,
	input pte_w,
	input pte_x,

	output is_pte_table
	);

	assign is_pte_table = pte_v & !pte_r & !pte_w & !pte_x;

endmodule