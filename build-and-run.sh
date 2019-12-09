#!/usr/bin/env bash

# build
nasm -f macho src/main.asm
ld -macosx_version_min 10.7.0 -o bin/main src/main.o
# run
./bin/main
