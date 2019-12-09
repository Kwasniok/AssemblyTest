#!/usr/bin/env bash

# first argument is the target_name of the target
target_name=$1

# build
nasm -f macho src/$target_name.asm
ld -macosx_version_min 10.7.0 -o bin/$target_name src/$target_name.o
# run
./bin/$target_name
