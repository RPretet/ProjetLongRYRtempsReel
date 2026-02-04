#!/bin/bash

nasm -f elf64 CalcLoop.asm -o CalcLoop.o
nasm -f elf64 LoadLoop.asm -o LoadLoop.o
nasm -f elf64 NopLoop.asm -o NopLoop.o

gcc -c main.c -o main.o
gcc main.o CalcLoop.o LoadLoop.o NopLoop.o -T linker.ld -o prog
