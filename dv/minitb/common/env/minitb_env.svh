class minitb_env extends uvm_env;
  `uvm_component_utils(minitb_env)
  virtual data_if data_in_if;
  virtual data_if data_out_if;

  minitb_env_cfg cfg;
  minitb_vseqr::minitb_vseqr vseqr;
  minitb_scoreboard scoreboard;

  data_agent::data_agent agent_in;
  data_agent::data_agent agent_out;

  function new(string name = "", uvm_component parent = null);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db #(virtual data_if)::get(this, "", "data_in_if", data_in_if)) begin
      `uvm_fatal(get_name(), "Can't get the data in interface")
    end
    if (!uvm_config_db #(virtual data_if)::get(this, "", "data_out_if", data_out_if)) begin
      `uvm_fatal(get_name(), "Can't get the data out interface")
    end

    // Print config
    `uvm_info(get_name(), $sformatf("Environment config: %s", cfg.sprint()), UVM_LOW)
    agent_in = data_agent::data_agent::type_id::create("agent_in", this);
    agent_in.cfg = cfg.agent_in;
    agent_in.vif = data_in_if;

    agent_out = data_agent::data_agent::type_id::create("agent_out", this);
    agent_out.cfg = cfg.agent_out;
    agent_out.vif = data_out_if;

    scoreboard = minitb_scoreboard::type_id::create("scoreboard", this);
    vseqr = minitb_vseqr::minitb_vseqr::type_id::create("vseqr", this);
  endfunction : build_phase

  virtual function void connect_phase (uvm_phase phase);
    super.connect_phase(phase);
    vseqr.agent_in_seqr = agent_in.seqr;
    agent_in.monitor.port.connect(scoreboard.in_port);
    agent_out.monitor.port.connect(scoreboard.out_port);
  endfunction : connect_phase

endclass

