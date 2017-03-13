# Verilog设计过程
1. 根据生成的PTW.v文件绘制电路图
2. 对生成电路的冗余部分进行删减
3. 对删减后的电路进行功能划分，得到各个模块电路
4. 对生成电路中部分无含义的reg或wire类型进行重命名(以及删除)，赋予语义

|原始名称|类型|语义化名称(含义)|
|:---|:---|:---| 
|T_2385|wire|is_pte_table|
|T_2644|wire|perm_ok|
|T_2648|wire|priv_ok|
|T_2622|wire|AD_bit_not_ok && access_ok|
|T_2664|wire|!2622|
|T_2634|wire|count++|
|T_2338|wire|X|
|T_2376|wire|hit|
|T_2472,T_2475,T_2478|wire|new_plru|
|T_2340|reg|plru|
|T_2342|reg|valid|
|T_2431|wire|new_valid|
|T_2349_~|reg|tag_~|
|T_2357_~|reg|ppn_~|
|T_2428|wire|replace_entry|
|T_2374|wire|hit_bit|
|T_2613|wire|resp_ppn|
|GEN_0|wire|pte_addr[31:0]|
|GEN_1|wire|pte_ppn[19:0]|


    
