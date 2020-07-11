class data_agent_monitor extends uvm_monitor;
  `uvm_component_utils(data_agent_monitor)
  virtual data_if vif;
  uvm_analysis_port #(data_seq_lib::data_sequence_item) port;

  function new(string name = "", uvm_component parent = null);
    super.new(name, parent);
    port = new("port", this);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (vif == null) `uvm_fatal(get_name(), "Interface is not provided to the monitor")
  endfunction : build_phase

  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      @vif.passive_cb;
      if (vif.passive_cb.valid) begin
        data_seq_lib::data_sequence_item item = new();
        item.data = vif.passive_cb.data;
        port.write(item);
      end
    end
  endtask : run_phase
endclass : data_agent_monitor

