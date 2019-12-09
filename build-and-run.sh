#!/usr/bin/env bash

name="main"

# build
nasm -f macho src/$name.asm
ld -macosx_version_min 10.7.0 -o bin/$name src/$name.o
# run
./bin/$name
