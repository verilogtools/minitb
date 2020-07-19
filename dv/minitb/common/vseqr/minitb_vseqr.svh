class minitb_vseqr extends uvm_sequencer;
  `uvm_component_utils(minitb_vseqr)
  uvm_sequencer #(.REQ(data_seq_lib::data_sequence_item)) agent_in_seqr;

  function new(string name = "", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

endclass : minitb_vseqr
