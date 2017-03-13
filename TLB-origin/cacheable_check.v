module cacheable_check(
input [7:0] cash_array,
input cacheable_buf,//cacheable
input [8:0] hits,

output io_resp_cacheable
);

wire [8:0] c_array;

assign c_array = {cacheable_buf, cash_array};
assign io_resp_cacheable = (c_array & hits) != 9'h0;

endmodule