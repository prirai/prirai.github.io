---
layout: layouts/post.njk
title: Open-source tools for HDL
tags: 
    - programming
    - hdl
    - blog
date: 2023-05-18
---

In this post, we will be discussing about some of the open-source tools available for HDLs especially Verilog and VHDL. We will be primarily focusing on iverilog and gtkwave.

## Tools

### Icarus Verilog

Icarus Verilog is a Verilog simulation and synthesis tool. It operates as a compiler, compiling source code written in Verilog (IEEE-1364) into some target format. For batch simulation, the compiler can generate an intermediate form called vvp assembly. This intermediate form is executed by the ``vvp`` command. For synthesis, the compiler generates netlists in the desired format.

Icarus Verilog is available for linux distributions and can be simply installed using the iverilog package. For Windows, you can download the executable from [here](https://bleyer.org/icarus/).

### GTKWave

GTKWave is a fully featured GTK+ based wave viewer for Unix, Win32, and Mac OSX which reads LXT, LXT2, VZT, FST, and GHW files as well as standard Verilog VCD/EVCD files and allows their viewing. It can be simply installed using the gtkwave package. For Windows, you can download the executable from [here](https://sourceforge.net/projects/gtkwave/). If you used the Windows executable lined above, GTKWave and many other tools are bundled alongside iverilog.

## Conventions

The `iverilog` works through a command line interface. The basic syntax is common for all supported operating systems including Linux, Windows and various Unix versions. The basic syntax is as follows:

File extensions used for Verilog source code files are `.v` or `.vl`. Although these are the most common extensions, other extensions are also used, such as `.vlog`, `.vlg`, `.vlo` and `.ver`. The file extension is not important to the compiler, but it is important to the user. The compiler will accept any file name as input, but the user must specify the file name with the correct extension on the command line.

## Usage

The first step is to write a trivial Verilog code and make it compile and running. We start with a Hello, World program. Create a file named `hello.v` and add the following code to it.

```verilog
module hello;
    initial begin
        $display("Hello, World!");
        $finish;
    end
endmodule
```

The above code is a simple module with an initial block. The initial block is executed only once at the beginning of the simulation. The `$display` is a system task that prints the string to the standard output. The `$finish` is another system task that terminates the simulation.

To compile the above code, run the following command in the terminal.

```bash
iverilog -o hello hello.v
```

The above command will generate an executable named `hello` which can be run using the following command. We could also use `hello.vvp` instead of `hello` in the previous command.

To execute the generated executable, run the following command.

```bash
vvp hello
```
`Hello, World!`

Thus we got to know the two most important tools that we'll be using in our HDL journey ie. iverilog and vvp.

Now let's move on to some deeper waters. Let's try to simulate a simple half adder. Create a file named `half_adder.v` and add the following code to it.

```verilog
module half_adder(a, b, sum, carry);
    input a, b;
    output sum, carry;
    assign sum = a ^ b;
    assign carry = a & b;
endmodule
```

The above code is a simple module with two inputs and two outputs. The `assign` keyword is used to assign a value to a variable. The `^` is the XOR operator and the `&` is the AND operator.

Now let's create a testbench for the above module. Create a file named `half_adder_tb.v` and add the following code to it.

```verilog
`timescale 1ns/1ns

module half_adder_tb;
    reg a, b;
    wire sum, carry;
    half_adder ha(a, b, sum, carry);
    initial begin
        $dumpfile("half_adder_tb.vcd");
        $dumpvars(0, half_adder_tb);
        a = 0; b = 0;
        #10 a = 0; b = 1;
        #10 a = 1; b = 0;
        #10 a = 1; b = 1;
        #10 $finish;
    end
endmodule
```

The above code is a simple testbench with two inputs and two outputs. The `reg` keyword is used to declare a variable. The `wire` keyword is used to declare a variable that is used to connect two modules. The `timescale` directive is used to specify the time unit and time precision. The `$dumpfile` and `$dumpvars` are system tasks that are used to dump the variables to a VCD file. The `#` is used to specify a delay.

Now let's compile the above code. Run the following command in the terminal.

```bash
iverilog -o half_adder_tb half_adder_tb.v half_adder.v
```

You've noticed that we specified two source files here. This is to specify the dependencies. The `half_adder_tb.v` depends on `half_adder.v`. The above command will generate an executable named `half_adder_tb` which can then be run. Run using `vvp half_adder_tb`. This will generate a VCD file named `half_adder_tb.vcd`. This file can be viewed using GTKWave. Run the following command in the terminal.

```bash
gtkwave half_adder_tb.vcd
```

This will open the GTKWave GUI. You can view the waveforms by clicking on the `half_adder_tb` in the `Signals` tab. You can also add signals to the waveform by clicking on the `+` button in the `Signals` tab.