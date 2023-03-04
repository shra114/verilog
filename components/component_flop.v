// Author - Shravan
////////////////////////
// Description
//   N bit flop 
///////////////////////

module component_flop
# ( parameter WIDTH = 1
)

(
  input                clk,
  input                rst_n,

  input                valid_in,
  input  [WIDTH-1 : 0] d_in,
  input  [WIDTH-1 : 0] d_out
);

  always @(posedge clk or negedge rst_n)
    if (~rst_n)
      d_out <= {WIDTH{1'b0}};
    else if (valid_in)
      d_out <= d_in;

endmodule 
