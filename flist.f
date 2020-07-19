# Suggested simulator command:
#    VCS:
#       vcs -full64 -sverilog -ntb_opts uvm-1.2 -R -f flist.f +UVM_TESTNAME=minitb_dummy_test
#    Irun/Xcelium:
#       irun -64bit -uvm -uvmhome CDNS-1.2 $UVM_HOME/src/uvm_macros.svh -f flist.f +UVM_TESTNAME=minitb_dummy_test
#

-top minitb_tb_top

+incdir+dv/common/data/seq_lib
+incdir+dv/common/data/agent
+incdir+dv/minitb/common/vseqr
+incdir+dv/minitb/common/env
+incdir+dv/minitb/seq_lib
+incdir+dv/minitb/test_lib

rtl/minitb/minitb.sv
rtl/minitb/minitb_top.sv
dv/common/data/data_if.sv
dv/common/data/seq_lib/data_seq_lib.sv
dv/common/data/agent/data_agent.sv
dv/minitb/common/vseqr/minitb_vseqr.sv
dv/minitb/common/env/minitb_env.sv
dv/minitb/seq_lib/minitb_seq_lib.sv
dv/minitb/test_lib/minitb_test_lib.sv
dv/minitb/minitb_tb_top.sv
