/////////////////////////////////////////
//Description
//  Multiplexer
/////////////////////////////////////////
// Need to make is parameterized FIXME

module mux #(
  parameter SEL_WIDTH = 4,
  //parameter IN_NUM = 1 << SEL_WIDTH,
  parameter IN_WIDTH = 32)
  (
  input  [SEL_WIDTH-1:0]  sel,
  input  [IN_WIDTH-1:0]   in0,
  input  [IN_WIDTH-1:0]   in1,
  input  [IN_WIDTH-1:0]   in2,
  input  [IN_WIDTH-1:0]   in3,
  input  [IN_WIDTH-1:0]   in4,
  input  [IN_WIDTH-1:0]   in5,
  input  [IN_WIDTH-1:0]   in6,
  input  [IN_WIDTH-1:0]   in7,
  input  [IN_WIDTH-1:0]   in8,
  input  [IN_WIDTH-1:0]   in9,
  input  [IN_WIDTH-1:0]   in10,
  input  [IN_WIDTH-1:0]   in11,
  input  [IN_WIDTH-1:0]   in12,
  input  [IN_WIDTH-1:0]   in13,
  input  [IN_WIDTH-1:0]   in14,
  input  [IN_WIDTH-1:0]   in15,
  output [IN_WIDTH-1:0]   out
);


//Internal signals
reg [IN_WIDTH-1:0] out_reg;

/////////////////////////
//Combinational logic
/////////////////////////
assign out = out_reg;

always @(*) begin
  out_reg = in0;
end
//TODO : Fix this
//always @(sel) begin
//  case (sel) begin
//    SEL_WIDTH'b0:  out_reg <= in0;
//	  SEL_WIDTH'b1:  out_reg <= in1;
//    SEL_WIDTH'b2:  out_reg <= in2;
//    SEL_WIDTH'b3:  out_reg <= in3;
//    SEL_WIDTH'b4:  out_reg <= in4;
//    SEL_WIDTH'b5:  out_reg <= in5;
//    SEL_WIDTH'b6:  out_reg <= in6;
//    SEL_WIDTH'b7:  out_reg <= in7;
//    SEL_WIDTH'b8:  out_reg <= in8;
//    SEL_WIDTH'b9:  out_reg <= in9;
//    SEL_WIDTH'b10: out_reg <= in10;
//    SEL_WIDTH'b11: out_reg <= in11;
//    SEL_WIDTH'b12: out_reg <= in12;
//    SEL_WIDTH'b13: out_reg <= in13;
//    SEL_WIDTH'b14: out_reg <= in14;
//    SEL_WIDTH'b15: out_reg <= in15;
//	default:       out_reg <= IN_WIDTH'b0;
//  endcase 
//end

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
