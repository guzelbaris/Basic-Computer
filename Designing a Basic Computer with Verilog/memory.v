module memory(
  input wire clk,
  input wire write_en,
  input wire [15:0] write_data,
  input wire [11:0] addr,
  output reg [15:0] read_data
);

reg [15:0] mem[0:4095];

always @(*) begin
  read_data <= mem[addr];
end

always @(posedge clk) begin
  if (write_en) begin
    mem[addr] <= write_data;
  end
end

endmodule
