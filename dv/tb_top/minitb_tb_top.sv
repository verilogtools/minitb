// ----------------------------------------------------------------------------
// Minitb Testbench TOP
// ----------------------------------------------------------------------------
module minitb_tb_top;

 import uvm_pkg::*;
 import minitb_test_lib::*;

 // Make the clock running
 logic clk;
 initial begin
   clk = 0;
   forever #1ns clk = ~clk;
 end

 // minitb
 minitb_top minitb (.clk);

 // UVM test
 initial run_test("");

 // Connect input interface and register with the environment.
 data_if data_in_if (.clk);
 initial uvm_config_db #(virtual data_if)::set(null, "uvm_test_top.env", "data_in_if", data_in_if);
 initial begin
   force minitb.valid_in = data_in_if.valid;
   force minitb.data_in = data_in_if.data;
 end

 // Connect output interface and register with the environment.
 data_if data_out_if (.clk);
 initial uvm_config_db #(virtual data_if)::set(null, "uvm_test_top.env", "data_out_if", data_out_if);
 initial begin
   force data_out_if.valid = minitb.valid_out;
   force data_out_if.data = minitb.data_out;
 end

endmodule


