class data_sequence_item extends uvm_sequence_item;
  `uvm_object_utils(data_sequence_item)
  rand bit [minitb::BusWidth-1:0] data;
  rand int delay;
  constraint delay_c {
    delay inside {10};
  }

  function new(string name = "");
    super.new(name);
  endfunction : new
endclass : data_sequence_item
