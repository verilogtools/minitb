class minitb_workload_vseq extends uvm_sequence;
  `uvm_object_utils(minitb_workload_vseq)
  `uvm_declare_p_sequencer(minitb_vseqr)
  data_seq_lib::data_workload_seq workload_seq;

  function new(string name = "");
    super.new(name);
  endfunction

  virtual task body();
    workload_seq = data_seq_lib::data_workload_seq::type_id::create("workload_seq");
    if (!workload_seq.randomize()) `uvm_fatal(get_name(), "Can't randomize the sequence")
    workload_seq.start(p_sequencer.agent_in_seqr);
  endtask : body

endclass : minitb_workload_vseq

