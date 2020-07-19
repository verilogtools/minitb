class minitb_env_cfg extends uvm_object;
  `uvm_object_utils(minitb_env_cfg)
  rand bit [7:0] lucky_number;
  rand data_agent::data_agent_cfg agent_in;
  rand data_agent::data_agent_cfg agent_out;

  function new(string name = "");
    super.new(name);
    agent_in = data_agent::data_agent_cfg::type_id::create("agent_in");
    agent_in.is_active = 1;
    agent_out = data_agent::data_agent_cfg::type_id::create("agent_out");
    agent_out.is_active = 0;
  endfunction

  function string sprint();
    sprint = $sformatf("%slucky_number: %0d", sprint, lucky_number);
  endfunction : sprint

endclass : minitb_env_cfg

