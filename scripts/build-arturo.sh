#!/usr/bin/env bash

# a script for building Arturo (latest/nightly)

. scripts/util-cmd.sh

checkout="${1:-master}"

###
 
curl -Lo- https://nim-lang.org/download/nim-1.6.10.tar.xz | tar Jxv

if cd nim-1.6.10; then
    fast_cmd ./build.sh
    sudoo ./install.sh /usr/bin
    cd || exit
fi

git clone https://github.com/arturo-lang/arturo

if cd arturo; then
    git checkout "$checkout"
    fast_cmd ./build.nims install log
    cp ~/.arturo/bin/arturo  /artifacts
fi
