#include <iostream>

//// to compile into risc-v assembly code use this command
//// riscv64-linux-gnu-g++ -S riscv_sample.cpp
//// just make sure you have the g++ gnu risc-v compiler installed before hand

int main() {
	std::cout << "test" << std::endl;
    return 0;
}