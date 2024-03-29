/////////////////////////////////////////
//Description
//  D flip-flop
/////////////////////////////////////////


module dff #(parameter FLOP_WIDTH = 32)(
  input                       clk,
  input                       rst_n, 
  input                       en,

  input      [FLOP_WIDTH-1:0]  d,
  output reg [FLOP_WIDTH-1:0]  q
);


//Internal signals


/////////////////////////
//Combinational logic
/////////////////////////
// next_state logic

/////////////////////////
//Sequential logic
/////////////////////////

always @ (posedge clk) begin
  if (~rst_n) begin
    q <= {FLOP_WIDTH{1'b0}};
  end
  else if (en)begin
    q <= d;
  end
end
/////////////////////////
//Sub block instantiations
/////////////////////////

/////////////////////////
//Assertions
/////////////////////////
endmodule 
