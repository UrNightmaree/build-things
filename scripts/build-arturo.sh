#!/usr/bin/env bash

# a script for building Arturo (latest/nightly)

. scripts/util-cmd.sh

checkout="${1:-master}"

git clone https://github.com/arturo-lang/arturo

if cd arturo; then
    git checkout "$checkout"
    fast_cmd ./build.nims install log
    cp ~/.arturo/bin/arturo  /artifacts
fi
