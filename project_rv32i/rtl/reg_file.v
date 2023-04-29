/////////////////////////////////////////
//Description
//  Register file
/////////////////////////////////////////


module reg_file #(
  parameter REG_WIDTH = 32,
  parameter ADDR_WIDTH = 4,
  parameter REG_NUM = 1 << ADDR_WIDTH
)
(
  input                    clk,
  input                    rst_n, 
  
  input                    read_en,
  input                    write_en,
  input  [ADDR_WIDTH-1:0]  addr,
  input  [REG_WIDTH-1:0]   wr_data,
  output                   rd_data_val;
  output [REG_WIDTH-1:0]   rd_data
);

//Internal signals
  reg [REG_WIDTH-1:0]      addr_p1;
  reg                      read_en_p1;
  wire [REG_NUM-1:0]       dff_wr_en;
  wire [REG_NUM-1:0]       reg_data_p0 [REG_WIDTH-1:0];
  wire [REG_WIDTH-1:0]     rd_data_p1 ;

/////////////////////////
//Combinational logic
/////////////////////////
assign rd_data     = read_en_p1 ? rd_data_p1 : REG_WIDTH'b0;
assign rd_data_val = read_en_p1;
/////////////////////////
//Sequential logic
/////////////////////////
// The write takes a cycle to latch into the register.
// For a read, we wait for a cycle if any pending write. 
// For now, adding this delay unconditionally.

always @ (posedge clk) begin
  if (~rst_n) begin
    addr_p1 <= REG_WIDTH'b0;
	read_en_p1 <= 1`b0;
  end
  else begin
    addr_p1 <= addr;
    read_en_p1 <= read_en;
  end
end
/////////////////////////
//Sub block instantiations
/////////////////////////
// Decode the write addr and generate write enables for each dff register.
decoder #(.IN_WIDTH(ADDR_WIDTH), .OUT_WIDTH(REG_NUM)) 
            wr_addr_dec (.clk   (clk),
                         .rst_n (rst_n),
		                 .en    (write_en),
		                 .in    (addr),
		                 .out   (dff_wr_en));
					 

// Instantiate arrays of dff registers 
genvar i;

generate
  for (i =0; i < REG_NUM; i = i+1) begin
    dff #(.FLOP_WIDTH(REG_WIDTH)) reg_dff (.clk (clk), .rst_n(rst_n), .en(dff_wr_en[i]), .d(wr_data) .q(reg_data_p0[i]));
  end
endgenerate


// Mux for reading data

mux #(.SEL_WIDTH(ADDR_WIDTH), .IN_WIDTH(REG_NUM))
       rd_mux (.sel(addr_p1), 
	           .in0(reg_data_p0[0]), 
			   .in1(reg_data_p0[1]), 
	           .in2(reg_data_p0[2]), 
	           .in3(reg_data_p0[3]), 
	           .in4(reg_data_p0[4]), 
	           .in5(reg_data_p0[5]), 
	           .in6(reg_data_p0[6]), 
	           .in7(reg_data_p0[7]), 
	           .in8(reg_data_p0[8]), 
	           .in9(reg_data_p0[9]), 
	           .in10(reg_data_p0[10]), 
	           .in11(reg_data_p0[11]), 
	           .in12(reg_data_p0[12]), 
	           .in13(reg_data_p0[13]), 
	           .in14(reg_data_p0[14]), 
	           .in15(reg_data_p0[15]), 
			   .out(rd_data_p1));
/////////////////////////
//Assertions
/////////////////////////
endmodule