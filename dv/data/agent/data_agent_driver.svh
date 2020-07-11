class data_agent_driver extends uvm_driver #(.REQ(data_seq_lib::data_sequence_item));
  `uvm_component_utils(data_agent_driver)
  virtual data_if vif;

  function new(string name = "", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (vif == null) `uvm_fatal(get_name(), "Interface is not provided to the driver")
  endfunction : build_phase

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    vif.active_cb.valid <= 0;
    vif.active_cb.data <= 0;
    forever begin
      data_sequence_item item;
      seq_item_port.get_next_item(item);
      drive_item(item);
      seq_item_port.item_done();
    end
  endtask : run_phase

  virtual task drive_item(data_seq_lib::data_sequence_item item);
    // Initial delay.
    repeat (item.delay) @vif.active_cb;
    vif.active_cb.valid <= 1;
    vif.active_cb.data <= item.data;
    @vif.active_cb;
    vif.active_cb.valid <= 0;
    vif.active_cb.data <= 0;
  endtask : drive_item
endclass : data_agent_driver

