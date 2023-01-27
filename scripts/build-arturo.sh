#!/usr/bin/env bash

# a script for building Arturo (latest/nightly)

checkout="${1:-master}"

git clone -b "$checkout" https://github.com/arturo-lang/arturo
 
curl -Lo- https://nim-lang.org/download/nim-1.6.10.tar.xz | tar Jxv

sudo apt-get install \
    libgtk-3-dev libwebkit2gtk-4.0-dev  \
    libmpfr-dev libgmp-dev

if cd nim-1.6.10; then
    ./build.sh
    sudo ./install.sh /usr/bin || ./install.sh /usr/bin
    cd
fi

git clone -b "$checkout" https://github.com/arturo-lang/arturo

if cd arturo; then
    ./build.nims install log
    cp ~/.arturo/bin/arturo  /artifacts
fi
