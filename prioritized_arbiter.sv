// prioritized_arbiter
// structural design
module prioritized_arbiter #(
  parameter data_width       = 8,
  parameter number_of_inputs = 4,
  parameter int unsigned priority_list [number_of_inputs-1:0]= {3, 1, 2, 0} // 0: highest priority
) (
  input  logic [data_width-1:0] data         [number_of_inputs-1:0],
  input  logic                  selection    [number_of_inputs-1:0], // selection input, 1 = data valid at data port
  output logic [data_width-1:0] demuxed_data
);

  logic [data_width-1:0] prioritized_data     [number_of_inputs-1:0];
  logic                  prioritized_selection[number_of_inputs-1:0];

  prioritizer #(
    .data_width      (data_width      ),
    .number_of_inputs(number_of_inputs),
    .priority_list   (priority_list   )
  ) data_prioritizer (.*);

  prioritizer #(
    .data_width      (1               ),
    .number_of_inputs(number_of_inputs),
    .priority_list   (priority_list   )
  ) selection_prioritizer (
    .data            ({>>{selection}}      ),
    .prioritized_data(prioritized_selection)
  );

  prioritized_demux #(
    .data_width      (data_width      ),
    .number_of_inputs(number_of_inputs)
  ) prioritized_demux_instance (
    .data        (prioritized_data     ),
    .selection   (prioritized_selection),
    .demuxed_data(demuxed_data         )
  );

endmodule : prioritized_arbiter
