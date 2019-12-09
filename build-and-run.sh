#!/usr/bin/env bash

# first argument is the name of the subproject
subproject_name=$1

# change directory
cd subprojects/$subproject_name
# provide bin folder
mkdir -p bin
# build
echo "building subproject $subproject_name ..."
nasm -f macho src/main.asm
ld -macosx_version_min 10.7.0 -o bin/main src/main.o
# run
echo "running subproject $subproject_name ..."
./bin/main
