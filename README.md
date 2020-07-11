# minitb
An example of a minimal UVM testbench for educational purposes.

Directory structure:

- rtl/ - minitb rtl modules location
- dv/  - minitb DV collateral location
    - data/  - data interface definition and re-usable agent with sequence library
    - seq_lib/  - minitb specific re-usable sequence library
    - env/  - re-usable testbench environment
    - test_lib  - specifc test library for the environment
    - tb_top  - specific testbench top

