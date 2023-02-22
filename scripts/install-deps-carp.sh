#!/usr/bin/env bash

# a script for installing Carp deps

. scripts/util-cmd.sh

install_deps libnuma1 libnuma-dev libtinfo-dev libtinfo5 libtinfo6 libc6-dev \
    llvm clang ninja-build haskell-stack ghc

stack update
stack upgrade
