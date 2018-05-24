# prioritized_arbiter
prioritized_arbiter in systemverilog

## Example
`data_width = 4`
`number_of_inputs = 3`
`priority_list = {2, 1, 0} // 0 is highest priority`

`data = {4'h0, 4'hb, 4'h9}`
`selection = 3'b111`

then

`demuxed_data = 4'h9`

The structural design is **MUCH** smaller than the behavioral design.
