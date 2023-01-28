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

sudoo apt-get install \
    libgtk-3-dev libwebkit2gtk-4.0-dev  \
    libmpfr-dev libgmp-dev  \
    -qy

git clone https://github.com/arturo-lang/arturo

if cd arturo; then
    git checkout "$checkout"
    fast_cmd ./build.nims install log
    cp ~/.arturo/bin/arturo  /artifacts
fi
