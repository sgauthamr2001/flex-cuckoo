module CuckooHashTable_flex(
  input clk,
  input rst,
  input [26:0] key, 
  input [31:0] value,
  output reg [31:0] lookup_result,
  output reg collision
);
  parameter TABLE_SIZE = 50;
  parameter ARY_SIZE = 3;
  parameter KEY_WIDTH = 27;
  parameter VALUE_WIDTH = 32;
  
  reg [KEY_WIDTH-1:0] cuckoo_table[ARY_SIZE-1:0][TABLE_SIZE-1:0];
  reg [VALUE_WIDTH-1:0] values0[ARY_SIZE-1:0][TABLE_SIZE-1:0];
  
  integer i,j;
  integer index1, index2, index3;
  integer hash1, hash2, hash3;
      
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      // Reset the hash table and values
      for (i = 0; i < ARY_SIZE; i = i + 1) begin
        for (j = 0; j < TABLE_SIZE; j = j + 1) begin
          cuckoo_table[i][j] <= 0;
          values0[i][j] <= 0;
        end
      end
    end else begin
      // Perform cuckoo hash table operations
      hash1 = key;
      hash2 = (key ^ 32'hFFFFFFFF);
      hash3 = (key ^ 32'hAAAAAAAA); 
      
      index1 = hash1 % TABLE_SIZE;
      index2 = hash2 % TABLE_SIZE;
      index3 = hash3 % TABLE_SIZE;
      
      // Look up the key in the hash table
      if (cuckoo_table[0][index1] == key) begin
        lookup_result <= values0[0][index1];
      end else if (cuckoo_table[1][index2] == key) begin
        lookup_result <= values0[1][index2];
      end else if (cuckoo_table[2][index3] == key) begin
        lookup_result <= values0[2][index3];
      end else begin
        lookup_result <= 0;
      end
      
      // Insert the key-value pair into the hash table
      if ((cuckoo_table[0][index1] == 0) || (cuckoo_table[0][index1] == key)) begin
        cuckoo_table[0][index1] <= key;
        values0[0][index1] <= value;
      end else if ((cuckoo_table[1][index2] == 0) || (cuckoo_table[1][index2] == key)) begin
        cuckoo_table[1][index2] <= key;
        values0[1][index1] <= value;
      end else if ((cuckoo_table[2][index3] == 0) || (cuckoo_table[2][index3] == key)) begin
        cuckoo_table[2][index3] <= key;
        values0[2][index1] <= value;
      end else begin
        // No empty slot or matching key found, trigger a collision
        collision <= 1;
      end
    end
  end
endmodule
