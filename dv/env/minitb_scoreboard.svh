`uvm_analysis_imp_decl(_in)
`uvm_analysis_imp_decl(_out)
class minitb_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(minitb_scoreboard)
  uvm_analysis_imp_in #(data_seq_lib::data_sequence_item, minitb_scoreboard) in_port;
  uvm_analysis_imp_out #(data_seq_lib::data_sequence_item, minitb_scoreboard) out_port;
  int requests[int];

  function new(string name = "", uvm_component parent = null);
    super.new(name, parent);
    in_port = new("in_port", this);
    out_port = new("out_port", this);
  endfunction

  function write_in(data_seq_lib::data_sequence_item item);
    `uvm_info(get_name(), "New input transaction", UVM_LOW)
    if (requests.exists(item.data)) begin
      requests[item.data] += 1;
    end else begin
      requests[item.data] = 0;
    end
  endfunction

  function write_out(data_seq_lib::data_sequence_item item);
    if (requests.exists(item.data)) begin
      requests[item.data] -= 1;
      if (requests[item.data] == 0) requests.delete(item.data);
      `uvm_info(get_name(), "New output transaction matched", UVM_LOW)
    end else begin
      `uvm_error(get_name(), "Unmatched transaction")
    end
  endfunction

endclass : minitb_scoreboard
