class data_workload_seq extends uvm_sequence #(.REQ(data_sequence_item));
  `uvm_object_utils(data_workload_seq)
  rand int count;
  constraint count_c {
    count inside {[5:6]};
  }
  function new(string name = "");
    super.new(name);
  endfunction : new

  virtual task body();
    for (int id = 0; id < count; id++) begin
      `uvm_info(get_name(), $sformatf("Sending sequence item id %0d", id), UVM_LOW)
      do_item();
    end
  endtask : body

  virtual task do_item();
    req = data_sequence_item::type_id::create("req");
    // Wait for the sequencer to provide a grant from the driver.
    start_item(req);
    // Randomize the item.
    if (!req.randomize()) `uvm_fatal(get_name(), "Can't randomize the sequence")
    // Send the item to the driver and wait for completion/response
    finish_item(req);
  endtask : do_item

endclass : data_workload_seq
