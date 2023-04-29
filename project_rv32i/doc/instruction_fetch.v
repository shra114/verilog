/////////////////////////////////////////
//Description
//  Instruction fetch module
/////////////////////////////////////////
module instruction_fetch
#(
  parameter IC_ADDR_WIDTH = 64, 
  parameter IC_DATA_WIDTH = 32,
  parameter PC_WIDTH      = 32,
  parameter NOP           = 0,
  parameter OPCODE_WIDTH  = 32
)
(
  input  [1-1 : 0 ]              clk, // 
  input  [1-1 : 0 ]              rst_n, // 
  output [IC_ADDR_WIDTH-1 : 0 ]  ic_read_addr, // I cache interface
  output [1-1 : 0 ]              ic_read_en, // 
  input  [IC_DATA_WIDTH-1 : 0 ]  ic_rdata, // 
  input  [1-1 : 0 ]              ic_rvalid, // 
  output [OPCODE_WIDTH-1 : 0 ]   opcode, // Decode interface
  output                         opcode_valid
);

reg   program_counter; 
wire  program_counter_next; 

//Combinational logic
assign program_counter_next = program_counter+4;
assign ic_read_en           = 1'b1;
assign ic_read_addr         = program_counter;
assign opcode               = ic_rdata; 
assign opcode_valid         = ic_rvalid;

//Sequential logic

//Module instantiations

dff #(.FLOP_WIDTH(PC_WIDTH)) u_pc (.clk(clk), .rst_n(rst_n), .d(program_counter_next), .q(program_counter)); 


endmodule
