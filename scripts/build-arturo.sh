#!/usr/bin/env bash

# a script for building Arturo (latest/nightly)

checkout="${1:-master}"

git clone -b "$checkout" https://github.com/arturo-lang/arturo
 
curl -Lo- https://nim-lang.org/download/nim-1.6.10.tar.xz | tar Jxv

if cd nim-1.6.10; then
    ./build.sh
    sudo ./install.sh /usr/bin
    cd
fi

git clone -b "$checkout" https://github.com/arturo-lang/arturo

if cd arturo; then
    ./build.nims install
    cp ~/.arturo/bin/arturo  /artifacts
fi

# echo "BUILD_RESULT=$HOME/.arturo/bin" >> $GITHUB_ENV
