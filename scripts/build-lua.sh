#!/usr/bin/env bash

# a script for building Lua

. scripts/util-cmd.sh

checkout="${1:-master}"

git clone https://github.com/lua/lua

if cd lua; then
    git checkout "$checkout"
    make -j16
    mkdir -p "${ARTIFACTS:=/artifacts}/"{bin,lib,include}
    cp lua "$ARTIFACTS/bin"
    cp liblua.a "$ARTIFACTS/lib"
    cp lua.h lualib.h lauxlib.h "$ARTIFACTS/include"
fi
