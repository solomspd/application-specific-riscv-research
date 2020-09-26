#!/bin/sh

for i in $1/* ; do
	echo "\n\nCompiling $i"
	echo riscv64-linux-gnu-gcc -S $i/*.h $i/*.c -I "$i/../common"
done
