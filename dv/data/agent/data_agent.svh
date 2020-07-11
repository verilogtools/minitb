class data_agent extends uvm_component;
  `uvm_component_utils(data_agent)
  data_agent_cfg cfg;
  virtual data_if vif;
  uvm_sequencer #(.REQ(data_seq_lib::data_sequence_item)) seqr;
  data_agent_driver driver;
  data_agent_monitor monitor;

  function new(string name = "", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // Print config
    `uvm_info(get_name(), $sformatf("Agent config: %s", cfg.sprint()), UVM_LOW)
    seqr = uvm_sequencer #(.REQ(data_seq_lib::data_sequence_item))::type_id::create("seqr", this);
    monitor = data_agent_monitor::type_id::create("monitor", this);
    monitor.vif = vif;
    if (cfg.is_active) begin
      driver = data_agent_driver::type_id::create("driver", this);
      driver.vif = vif;
    end
  endfunction : build_phase

  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if (cfg.is_active) begin
      driver.seq_item_port.connect(seqr.seq_item_export);
    end
  endfunction : connect_phase
endclass : data_agent

