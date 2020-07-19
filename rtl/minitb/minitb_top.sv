// ----------------------------------------------------------------------------
// Minitb design top module
// ----------------------------------------------------------------------------
module minitb_top (
   input logic clk,
   input logic reset,
   input logic valid_in,
   input logic [minitb::BusWidth-1:0] data_in,
   output logic valid_out,
   output logic [minitb::BusWidth-1:0] data_out
);

   logic valid_tmp;
   logic [minitb::BusWidth-1:0] data_tmp;

   // 2-cycle delay line.
   always @(posedge clk) begin
     valid_tmp <= valid_in;
     data_tmp <= data_in;
     valid_out <= valid_tmp;
     data_out <= data_tmp;

     // Debug printing.
     $display("IN  valid: %0d, data: %0d. OUT valid: %0d, data: %0d",
       valid_in, data_in, valid_out, data_out);
   end
endmodule : minitb_top

