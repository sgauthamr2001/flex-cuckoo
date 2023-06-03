module PageAccess(
  input clk,
  input [11:0] address,        // Address for memory access
  input [11:0] data_in,           // Data read from or written to memory
  output reg [11:0] data_out,
  input write_enable,          // Memory write enable signal
  input read_enable           // Memory read enable signal
);

  reg [11:0] memory[0:4095]; // 4KB memory array


  // Memory read/write logic
  always @(posedge clk) begin
    if (write_enable) begin
      memory[address] <= data_in;
      data_out <= 0;
    end
    else if (read_enable) begin
      data_out <= memory[address];
    end
  end
endmodule
