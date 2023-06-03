module CuckooHashTable(
  input wire clk,
  input wire rst,
  input wire [32:0] key,
  input wire [2:0] offset, 
  input wire [31:0] value,
  output reg [31:0] lookup_result,
  output reg collision
);
  parameter TABLE_SIZE = 50;
  parameter ARY_SIZE = 3;
  parameter KEY_WIDTH = 33;
  parameter VALUE_WIDTH = 32;
  
  reg [KEY_WIDTH-1:0] cuckoo_table[ARY_SIZE-1:0][TABLE_SIZE-1:0];
  reg [VALUE_WIDTH-1:0] values0[ARY_SIZE-1:0][TABLE_SIZE-1:0];
  reg [VALUE_WIDTH-1:0] values1[ARY_SIZE-1:0][TABLE_SIZE-1:0];
  reg [VALUE_WIDTH-1:0] values2[ARY_SIZE-1:0][TABLE_SIZE-1:0];
  reg [VALUE_WIDTH-1:0] values3[ARY_SIZE-1:0][TABLE_SIZE-1:0];
  reg [VALUE_WIDTH-1:0] values4[ARY_SIZE-1:0][TABLE_SIZE-1:0];
  reg [VALUE_WIDTH-1:0] values5[ARY_SIZE-1:0][TABLE_SIZE-1:0];
  reg [VALUE_WIDTH-1:0] values6[ARY_SIZE-1:0][TABLE_SIZE-1:0];
  reg [VALUE_WIDTH-1:0] values7[ARY_SIZE-1:0][TABLE_SIZE-1:0];

  
  integer i;
  integer j;
  integer index1, index2, index3;
  integer hash1, hash2, hash3;
        
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      // Reset the hash table and values
      for (i = 0; i < ARY_SIZE; i = i + 1) begin
        for (j = 0; j < TABLE_SIZE; j = j + 1) begin
          cuckoo_table[i][j] <= 0;
          values0[i][j] <= 0;
          values1[i][j] <= 0;
          values2[i][j] <= 0;
          values3[i][j] <= 0;
          values4[i][j] <= 0;
          values5[i][j] <= 0;
          values6[i][j] <= 0;
          values7[i][j] <= 0;
        end
      end
    end else begin
      // Perform cuckoo hash table operations
      hash1 = key;
      hash2 = (key ^ 32'hffffffff);
      hash3 = (key ^ 32'haaaaaaaa); 
      
      index1 = hash1 % TABLE_SIZE;
      index2 = hash2 % TABLE_SIZE;
      index3 = hash3 % TABLE_SIZE;
      
      // Look up the key in the hash table
      if (cuckoo_table[0][index1] == key) begin
        if(offset == 0) begin
          lookup_result <= values0[0][index1];
        end else if(offset == 1) begin
          lookup_result <= values1[0][index1];
        end else if(offset == 2) begin
          lookup_result <= values2[0][index1];
        end else if(offset == 3) begin
          lookup_result <= values3[0][index1];
        end else if(offset == 4) begin
          lookup_result <= values4[0][index1];
        end else if(offset == 5) begin
          lookup_result <= values5[0][index1];
        end else if(offset == 6) begin
          lookup_result <= values6[0][index1];
        end else if(offset == 7) begin
          lookup_result <= values7[0][index1];
        end
      end else if (cuckoo_table[1][index2] == key) begin
        if(offset == 0) begin
            lookup_result <= values0[1][index2];
        end else if(offset == 1) begin
            lookup_result <= values1[1][index2];
        end else if(offset == 2) begin
            lookup_result <= values2[1][index2];
        end else if(offset == 3) begin
            lookup_result <= values3[1][index2];
        end else if(offset == 4) begin
            lookup_result <= values4[1][index2];
        end else if(offset == 5) begin
            lookup_result <= values5[1][index2];
        end else if(offset == 6) begin
            lookup_result <= values6[1][index2];
        end else if(offset == 7) begin
            lookup_result <= values7[1][index2];
        end
      end else if (cuckoo_table[2][index3] == key) begin
        if(offset == 0) begin
            lookup_result <= values0[2][index3];
        end else if(offset == 1) begin
            lookup_result <= values1[2][index3];
        end else if(offset == 2) begin
            lookup_result <= values2[2][index3];
        end else if(offset == 3) begin
            lookup_result <= values3[2][index3];
        end else if(offset == 4) begin
            lookup_result <= values4[2][index3];
        end else if(offset == 5) begin
            lookup_result <= values5[2][index3];
        end else if(offset == 6) begin
            lookup_result <= values6[2][index3];
        end else if(offset == 7) begin
            lookup_result <= values7[2][index3];
        end
      end else begin
        lookup_result <= 0;
      end 
      // Insert the key-value pair into the hash table
      if ((cuckoo_table[0][index1] == 0) || (cuckoo_table[0][index1] == key)) begin
        cuckoo_table[0][index1] <= key;
        if(offset == 0)
            values0[0][index1] <= value;
        else if(offset == 1)
            values1[0][index1] <= value;
        else if(offset == 2)
            values2[0][index1] <= value;
        else if(offset == 3)
            values3[0][index1] <= value;
        else if(offset == 4)
            values4[0][index1] <= value;
        else if(offset == 5)
            values5[0][index1] <= value;
        else if(offset == 6)
            values6[0][index1] <= value;
        else if(offset == 7)
            values7[0][index1] <= value;
      end else if ((cuckoo_table[1][index2] == 0) || (cuckoo_table[1][index2] == key)) begin
        cuckoo_table[1][index2] <= key;
        if(offset == 0)
            values0[1][index1] <= value;
        else if(offset == 1)
            values1[1][index1] <= value;
        else if(offset == 2)
            values2[1][index1] <= value;
        else if(offset == 3)
            values3[1][index1] <= value;
        else if(offset == 4)
            values4[1][index1] <= value;
        else if(offset == 5)
            values5[1][index1] <= value;
        else if(offset == 6)
            values6[1][index1] <= value;
        else if(offset == 7)
            values7[1][index1] <= value;
      end else if ((cuckoo_table[2][index3] == 0) || (cuckoo_table[2][index3] == key)) begin
        cuckoo_table[2][index3] <= key;
        if(offset == 0)
            values0[2][index1] <= value;
        else if(offset == 1)
            values1[2][index1] <= value;
        else if(offset == 2)
            values2[2][index1] <= value;
        else if(offset == 3)
            values3[2][index1] <= value;
        else if(offset == 4)
            values4[2][index1] <= value;
        else if(offset == 5)
            values5[2][index1] <= value;
        else if(offset == 6)
            values6[2][index1] <= value;
        else if(offset == 7)
            values7[2][index1] <= value;
      end else begin
        // No empty slot or matching key found, trigger a collision
        collision <= 1;
      end
    end
  end
endmodule
