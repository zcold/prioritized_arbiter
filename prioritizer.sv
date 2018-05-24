// prioritizer
// reorder input data array
module prioritizer #(
  parameter data_width       = 8,
  parameter number_of_inputs = 4,
  parameter int unsigned priority_list [number_of_inputs-1:0]= {3, 1, 2, 0} // 0: highest priority
) (
  input  logic [data_width-1:0] data             [number_of_inputs-1:0],
  output logic [data_width-1:0] prioritized_data [number_of_inputs-1:0]
);

  for (genvar i=0; i<number_of_inputs; i++) begin : prioritize
    assign prioritized_data[i] = data[priority_list[i]];
  end : prioritize

endmodule : prioritizer

