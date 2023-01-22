module registers#(
        parameter integer W=16)(
  input wire clk,
  input wire reset,
  input wire write_en,
  input wire increment,
  input wire [W-1:0] data,
  output reg [W-1:0] out
);

always @(posedge clk) begin
  if (reset) begin
    out <= 0;
  end else if (write_en) begin
    out <= data;
  end else if (increment) begin
    out <= out + 1;
  end
end

endmodule
