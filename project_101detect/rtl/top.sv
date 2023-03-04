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

 localparam ST_IDLE    = 4'h1;
 localparam ST_1       = 4'h2;
 localparam ST_10      = 4'h4;
 localparam ST_101     = 4'h8;

 logic [3:0] state, next_state;

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
always @ (posedge clk or negedge rst_n) begin
  if (!rst_n)
    state <= ST_IDLE;
  else
    state <= next_state;
end
/////////////////////////
//Sub block instantiations
/////////////////////////

/////////////////////////
//Assertions
/////////////////////////
endmodule 
