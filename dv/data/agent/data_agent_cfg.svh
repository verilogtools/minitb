class data_agent_cfg extends uvm_object;
  `uvm_object_utils(data_agent_cfg)
  bit is_active;

  function new(string name = "");
    super.new(name);
  endfunction : new

  function string sprint();
    sprint = $sformatf("%sis_active: %0d", sprint, is_active);
  endfunction : sprint
endclass : data_agent_cfg

