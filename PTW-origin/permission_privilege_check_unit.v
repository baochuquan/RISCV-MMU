module permission_privilege_check_unit(
	input r_req_store,
	input r_req_fetch,
	input [1:0] r_req_prv,
	input r_req_mxr,
	input r_req_pum,
	input pte_r,
	input pte_w,
	input pte_x,
	input pte_v,
	input pte_u,

	output access_ok
	);

	wire perm_ok;
	wire priv_ok;
	wire leaf;

	assign perm_ok = r_req_fetch ? pte_x : (r_req_store ? pte_w : ((pte_x & r_req_mxr) | pte_r));
	assign priv_ok = pte_u ? !r_req_pum : r_req_prv[0];
	assign leaf = pte_v & (pte_r | (pte_x & !pte_w));
	assign access_ok = perm_ok & priv_ok & leaf;
endmodule