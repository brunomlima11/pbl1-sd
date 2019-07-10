module uart(
  input clk,
  input [7:0] data,
  input data_en,
  output reg busy,
  output reg tx_out
);

reg [12:0] baud_count <= 13'b0;
reg [12:0] baux_max <= 50000000/9600;
// reg [12:0] baux_max <= 13'b1010001011000;

busy = 1'b0;
reg [9:0] sending <= 10'b0;

always @(posedge clk)
  if (baud_count == 0) begin
    baud_count <= baud_max;
    tx_out <= sending[0];

  end else begin
    baud_count <= baud_count - 1;
  end