# minitb

An example of a minimal UVM testbench for educational purposes.

Directory structure:

```
- rtl/                  - RTL source code area
    - minitb/           - Minitb design block rtl modules and packages
- dv/                   - DV source code area
    - common/           - Common DV collateral shared between block tes tbenches
        - data/         - Common Data interface definition and re-usable agent with sequence library
            - seq_lib/  - Common Data interface specific sequences and a sequence item
            - agent/    - Common Data interface specific re-usable agent
    - minitb/           - Minitb design block test bench
        - common/       - Minitb design block shared components
            - vseqr/    - Minitb design block common virtual sequence class
            - env/      - Minitb design block re-usable testbench environment
        - seq_lib/      - Minitb design block specific sequences and virtual sequences
        - test_lib      - Minitb design block specifc test library
```
