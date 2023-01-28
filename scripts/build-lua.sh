#!/usr/bin/env bash

# a script for building Lua

. scripts/util-cmd.sh

checkout="${1:-master}"

git clone https://github.com/lua/lua

if cd lua; then
    git checkout "$checkout"
    make -j16
    mkdir -p "/artifacts/"{bin,lib,include}
    cp lua /artifacts/bin
    cp liblua.a /artifacts/lib
    cp lua.h liblua.h lauxlib.h /artifacts/include
fi