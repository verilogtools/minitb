class minitb_dummy_test extends minitb_base_test;
  `uvm_component_utils(minitb_dummy_test)
  rand minitb_seq_lib::minitb_workload_vseq workload_vseq;

  function new(string name = "", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual task run_phase(uvm_phase phase);
    `uvm_info(get_name(), "Starting the test", UVM_LOW)
    phase.raise_objection(this);

    // Run workload sequence
    `uvm_info(get_name(), "Starting main workload virtual sequence", UVM_LOW)
    workload_vseq = minitb_seq_lib::minitb_workload_vseq::type_id::create("workload_vseq");
    if (!workload_vseq.randomize()) `uvm_fatal(get_name(), "Can't randomize sequence")
    workload_vseq.start(env.vseqr);
    `uvm_info(get_name(), "Finishing main workload virtual sequence", UVM_LOW)
    #100ns;
    `uvm_info(get_name(), "Finishing the test", UVM_LOW)
    phase.drop_objection(this);
  endtask : run_phase
endclass : minitb_dummy_test
