#!/usr/bin/env bash

# first argument is the name of the subproject
subproject_name=$1
echo "target subproject: $subproject_name"
# change directory
cd subprojects/$subproject_name
if [ $? -ne 0 ]; then
    echo "Could not access subproject folder." >&2
    exit 1
fi
# provide bin folder
mkdir -p bin
if [ $? -ne 0 ]; then
    echo "Could not create bin in subproject folder." >&2
    exit 1
fi
# build
echo "building ..."
nasm -f macho src/main.asm
# - target legacy version of OS X with full 32bit support
# - target 32bit intel architecture (i386)
# - disable PIE 8position independent executable) as it is now deprocated
ld -macosx_version_min 10.7.0 -arch i386 -no_pie -o bin/main src/main.o
if [ $? -ne 0 ]; then
    echo "Could not build subproject." >&2
    exit 1
fi
# run
echo "running ..."
./bin/main
ret=$?
if [ $ret -ne 0 ]; then
    echo "Executalbe stopped with exit code $ret." >&2
    exit 1
fi
