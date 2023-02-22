#!/usr/bin/env bash

# a script for building Sumneko Lua

. scripts/util-cmd.sh

checkout="${1:-master}"

git clone --depth=1 https://github.com/sumneko/lua-language-server

if cd lua-language-server; then
    git checkout "$checkout"
    git submodule update --depth 1 --init --recursive
    ./make.sh || exit 1
    cp -r bin doc log meta tools locale script "${ARTIFACTS:=/artifacts}"
    cp debugger.lua main.lua "$ARTIFACTS"
fi
