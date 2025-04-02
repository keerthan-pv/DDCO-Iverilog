# DDCO-Iverilog

 DDCO-Icarus Verilog (Iverilog)

 Overview
DDCO (Digital Design and Computer Architecture) - Icarus Verilog (Iverilog)** is a setup for simulating and verifying Verilog-based digital circuits, including ALUs, multiplexers, counters, and FSMs.

 Why Icarus Verilog?
Icarus Verilog is an open-source Verilog simulator offering:
- **Easy installation** on Windows, Linux, and macOS.
- **Support for Verilog-2005** and some SystemVerilog features.
- **Integration with GTKWave** for waveform visualization.

 Installation
 Windows:
1. Download from [Icarus Verilog's website](http://iverilog.icarus.com/).
2. Install and add to system PATH if needed.

 Linux (Ubuntu/Debian):
```sh
sudo apt update && sudo apt install iverilog gtkwave
```

 macOS:
```sh
brew install icarus-verilog gtkwave
```

 Running a Simulation
```sh
iverilog -o design.out design.v testbench.v
vvp design.out
```
View waveform:
```sh
gtkwave dump.vcd
```

## Example Verilog Code
**2-input AND gate:**
```verilog
module and_gate(input a, b, output y);
    assign y = a & b;
endmodule
```
Testbench:
```verilog
module and_gate_tb;
    reg a, b;
    wire y;
    and_gate uut (.a(a), .b(b), .y(y));
    initial begin
        $dumpfile("dump.vcd"); $dumpvars(0, and_gate_tb);
        a = 0; b = 0; #10; a = 0; b = 1; #10;
        a = 1; b = 0; #10; a = 1; b = 1; #10;
        $finish;
    end
endmodule
```

Conclusion
DDCO-Iverilog is a valuable tool for digital design and Verilog learning, providing efficient simulation and debugging capabilities. Modify as needed!

