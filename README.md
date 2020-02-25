# Application Specific RISC-V CPU Generator

The goal of this project is be able to take any application and produce a RISC-V CPU implementation best suited for it, Removing hardware from a traditional RISC-V CPU that wouldn't be used by the application.

## Where everything is under `/src`
### `/analysis`
Here goes the code responsible for analyzing compiled `.s` files and generating its corresponding verilog code.

### `/riscv CPU`
RISC-V implementation in verilog capable of running all RISC-V instructions

### `/riscv code`
Here goes the application we are optimizing for and its associated `.s` file.

### `insts.json`
This is a JSON file that has a list of all RISC-V instructions and their extensions to more easily query and identify them in code.

## Process
### Compile C++/C code into searchable assembly instructions

Install RISC-V compiler
```
$ sudo apt install riscv64-linux-gnu-g++
```

Compile C++/C code into `.s` assembly instruction file
```
# don't fprget to cd to ./src/risccv code
$ riscv64-linux-gnu-g++ -S <C++/C file>
```
Now you inspect which instructions exactly this program uses.

### Analyse `.s` file
Run python code under `/analysis` and it will create a bar chart of the instructions used in the `.s` file under `/riscv code`.

### compile verilog code
Download icarus verilog
```
$ sudo apt install iverilog
```
Compile verilog code using list of all `.v` files as found under `icarus_ref.txt`. (make sure file names are in order of encapsulation/dependency. this is why we can use `*.v` to compile)
```
# don't forget to cd to ./src/riscv CPU
$ iverilog -o ricv -c icarus_ref.txt
```
Run implementation. text output of asserts should pop up in terminal.
```
$ vvp riscv
```
Produce verilog files according to application requirement

### debug verilog code
Install GTKwave
```
$ sudo apt install gtkwave
```


Make sure you add this to the beginning of you simulation's `initial begin`. Just replace "riscv" with the simulation modules name
```
$dumpfile("riscv.vcd");
$dumpvars(0, rsicv);
```

View waveform.
```
$ sudo gtkwave "<directory of .vcd file>"
```

## To Do
* Finish implementation of RISC-V verilog implementation able of running all RISC-V instructions.
* Categorize what part of the RISC-V CPU each instruction uses.
* Make program that creates verilog code that implements RISC-V CPU with the minimum hardware required for an application.

## Long term plan
* Replace instructions rarely used by application by slower instructions but use less hardware.
* Custom compiler that is able to produce RISC-V code while avoiding specific instructions.
* Create a sort of "speed", "power" and "cost" profiles that alters which instructions are implemented and how they are implemented to better suit an end case.