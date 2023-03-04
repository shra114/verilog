/////////////////////////////////////////
//Description
//  101 sequence detector
/////////////////////////////////////////
//import top_pkg::*;

module top (
  input  logic        clk,
  input  logic        rst_n, 

  input  logic        data_in,
  output logic        sequence_detected
);

//Internal signals
//TODO : Check why SV pkg doesn't work with icarus. Is it working somewhere
//top_pkg::fsm_state_t state;
//top_pkg::fsm_state_t next_state;
//-----Error Segmentation fault (core dumped)
//

 localparam ST_IDLE    = 3'h0;
 localparam ST_1       = 3'h1;
 localparam ST_10      = 3'h2;
 localparam ST_101     = 3'h4;

 logic [2:0] state, next_state;

/////////////////////////
//Combinational logic
/////////////////////////
// next_state logic
always @(*) begin
  //default assignment to avoid latch inference
  next_state = state;

  case (state)
    ST_IDLE : next_state = data_in ? ST_1   : ST_IDLE;
    ST_1    : next_state = data_in ? ST_1   : ST_10;
    ST_10   : next_state = data_in ? ST_101 : ST_IDLE;
    ST_101  : next_state = data_in ? ST_1   : ST_10;
    default : next_state = state;
  endcase
end

assign sequence_detected = (state == ST_101);

/////////////////////////
//Sequential logic
/////////////////////////
component_flop #(.WIDTH(3)) u_state_ff  (
  .clk      (clk),
  .rst_n    (rst_n),
  .valid_in (1'b1),
  .d_in     (next_state),
  .d_out    (state)
);
/////////////////////////
//Sub block instantiations
/////////////////////////

/////////////////////////
//Assertions
/////////////////////////
endmodule 
