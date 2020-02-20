#include <iostream>
#include <fstream>
#include <string>

int main() {
    std::ifstream in;
    in.open("/run/media/solom/Abdo/Abdo/Abdo's University work/spring 2020/Research/code/riscv code/riscv_sample.s");
    if (!in.is_open()) {
        std::cout << "CANNOT OPEN FILE";
        return 0;
    }

    while (!in.eof()) {
        std::string test;
        in >> test;
        std::cout << test << std::endl;
    }

    return 0;
}
