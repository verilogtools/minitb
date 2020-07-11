// ----------------------------------------------------------------------------
// Data bus interface
// ----------------------------------------------------------------------------
interface data_if (input logic clk);
 logic valid;
 logic [minitb::BusWidth-1:0] data;

 clocking passive_cb @(posedge clk);
   input valid;
   input data;
 endclocking

 clocking active_cb @(posedge clk);
   output valid;
   output data;
 endclocking
endinterface

