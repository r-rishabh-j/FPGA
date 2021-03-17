# FPGA
Verilog model of an FPGA to implement an adder, an encoder and a counter on the same circuit board.

### Included files
/src directory contains the following critical files-
1. **FPGA.v** : Verilog code for the FPGA board
2. **adder.v** : Testbench for 4 bit adder
3. **counter.v** : Testbench for modulo 16 counter
4. **encoder.v** : Testbench for 8:3 encoder
5. **config_files/config_adder.mem** : Configuration file for adder
6. **config_files/config_counter.mem** : Configuration file for counter
7. **config_files/config_encoder.mem** : Configuration file for encoder

VCD dump files are created in /src/vcd which can be viewed in an appropriate software.

### Executing the code
1. Navigate to /src in the terminal
2. For executing a particular function of the FPGA, say an adder, execute the following commands
```
$ iverilog FPGA.v adder.v
$ ./a.out
```
Output is obtained on the terminal.

### Report
Refer to the report and circuit diagram in /reports for a detailed explanation.
