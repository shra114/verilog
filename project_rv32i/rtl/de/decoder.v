/////////////////////////////////////////
//Description
//  Decoder
/////////////////////////////////////////


module decoder #(
  parameter IN_WIDTH = 4,
  parameter OUT_WIDTH = 1 << IN_WIDTH 
)
(
  input                    clk,
  input                    rst_n, 
  
  input                    en,
  input  [IN_WIDTH-1:0]    in,
  output [OUT_WIDTH-1:0]   out
);

//Internal signals
  reg [OUT_WIDTH-1:0]      out_reg;

// FIXME:dukumar: Is this sythesizable ?
// can we do this ? just one liner assign, so nice :-D 
// assign out = 1'b1 << in;
/////////////////////////
//Combinational logic
/////////////////////////
integer i;
always @(in) begin
  for (i = 0; i < OUT_WIDTH; i++) begin
    out_reg[i] = (in == i);
  end
end

assign out = en ? out_reg : {OUT_WIDTH{1'b0}};
/////////////////////////
//Sequential logic
/////////////////////////

/////////////////////////
//Sub block instantiations
/////////////////////////

/////////////////////////
//Assertions
/////////////////////////
endmodule 
