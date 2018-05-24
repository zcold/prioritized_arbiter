// test prioritized_arbiter
module prioritized_arbiter_tb();

  localparam data_width       = 8;
  localparam number_of_inputs = 4;

  logic [data_width-1:0] data        [number_of_inputs-1:0];
  logic                  selection   [number_of_inputs-1:0];
  logic [data_width-1:0] demuxed_data                      ;

  assign data[0]   = 1;
  assign data[1]   = 3;
  assign data[2]   = 5;
  assign data[3]   = 7;
  assign selection = {>>{4'b1010}}; // unpacked to packed

  prioritized_arbiter #(
    .data_width      (data_width      ),
    .number_of_inputs(number_of_inputs),
    .priority_list   ('{0, 2, 1, 3}) // low to high
  ) dut (.*);

endmodule : prioritized_arbiter_tb
