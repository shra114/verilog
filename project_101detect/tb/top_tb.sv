module top_tb();

//internal signals
  logic        clk;
  logic        rst_n;
  logic        data_in;
  logic        sequence_detected;

//dut instantiation
  top u_top (
    .clk               (clk),
    .rst_n             (rst_n), 
    .data_in           (data_in),
    .sequence_detected (sequence_detected)
  );

//test
  initial begin
    clk     = 0; 
    rst_n   = 1;
    data_in = 0;
    #5
    rst_n = 0;
    #5
    rst_n = 1;
    @(posedge clk);//wait for clk event and start stimulus
    data_in = 0;
  
    @(posedge clk);
    data_in = 1;
  
    @(posedge clk);
    data_in = 0;
  
    @(posedge clk);
    data_in = 1;
  
    @(posedge clk);
    data_in = 0;
  
    @(posedge clk);
    data_in = 1;
  
    @(posedge clk);
    data_in = 1;
  
    @(posedge clk);
    data_in = 0;
  
    @(posedge clk);
    data_in = 1;
  
    @(posedge clk);
    @(posedge clk);
	  $finish;
  end
  
  always
  #5 clk = ~clk;

//wave dump
  initial begin
      $dumpfile("test.vcd");
      $dumpvars(0,top_tb); //tb top hieararchy ; after compilation run vvp ./a.out
   end
	
//monitors
	initial begin
		$monitor("Time = %t, data_in = %b, state = %b ", $time, data_in, u_top.state);
	end
	
endmodule
