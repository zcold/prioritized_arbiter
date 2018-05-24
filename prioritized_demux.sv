// prioritized_demux
// multiple bits in selection input can be high
// data with highest priority will be send out
module prioritized_demux #(
  parameter data_width       = 8,
  parameter number_of_inputs = 4
) (
  input  logic [data_width-1:0] data         [number_of_inputs-1:0],
  input  logic                  selection    [number_of_inputs-1:0], // selection input, 1 = data valid at data port
  output logic [data_width-1:0] demuxed_data
);
  generate
    if (number_of_inputs==1) begin : number_of_inputs_is_1
      assign demuxed_data = (selection[0]=='1) ? data[0] : '0;
    end : number_of_inputs_is_1
    else begin : number_of_inputs_is_2_or_more
      logic [data_width-1:0] data_connection[number_of_inputs:0];
      assign demuxed_data                      = data_connection[0];
      assign data_connection[number_of_inputs] = '0;
      for (genvar i=0; i<number_of_inputs; i++) begin : mux_network
        assign data_connection[i] = selection[i] ? data[i] : data_connection[i+1];
      end : mux_network
    end : number_of_inputs_is_2_or_more
  endgenerate
endmodule : prioritized_demux
