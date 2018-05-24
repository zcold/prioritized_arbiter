// prioritized_arbiter
// behavoral design
module prioritized_arbiter_behavor #(
  parameter data_width       = 8,
  parameter number_of_inputs = 4,
  parameter int unsigned priority_list [number_of_inputs-1:0]= {3, 1, 2, 0} // 0: highest priority
) (
  input  logic [data_width-1:0] data         [number_of_inputs-1:0]     ,
  input  logic                  selection    [number_of_inputs-1:0], // 1 = data valid at data port
  output logic [data_width-1:0] demuxed_data
);

  always_comb begin : comb_prio
    for (int unsigned i=0; i<number_of_inputs; i++) begin : find
      if (selection[priority_list[i]]) begin
        demuxed_data = data[priority_list[i]];
        break;
      end
    end : find
  end : comb_prio

endmodule : prioritized_arbiter_behavor
