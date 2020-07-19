class minitb_base_test extends uvm_test;
  `uvm_component_utils(minitb_base_test)
  rand minitb_env::minitb_env_cfg cfg;
  minitb_env::minitb_env env;

  function new(string name = "", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    cfg = minitb_env::minitb_env_cfg::type_id::create("cfg", this);
    if (!cfg.randomize()) `uvm_fatal(get_name(), "Unable to randomize env config")
    env = minitb_env::minitb_env::type_id::create("env", this);
    env.cfg = cfg;
  endfunction : build_phase

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    `uvm_fatal(get_name(), "Do not run the base test")
    phase.drop_objection(this);
  endtask : run_phase

  virtual function void final_phase(uvm_phase phase);
    $display("TEST PASSED");
  endfunction : final_phase

endclass : minitb_base_test
