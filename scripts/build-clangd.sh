#!/usr/bin/env bash

# a script for building Clangd

. scripts/util-cmd.sh

checkout="${1:-master}"

git clone https://github.com/llvm/llvm-project

if cd llvm-project; then
    git checkout "$checkout"
    mkdir build
    cd build || exit
    cmake ../llvm/ -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra" -G Ninja || exit 1
    cmake --build . --target clangd -j16 || exit 1
    ls -a
fi
