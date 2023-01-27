#!/usr/bin/env bash

# a script for building Arturo (latest/nightly)

checkout="${1:-master}"
 
curl -Lo- https://nim-lang.org/download/nim-1.6.10.tar.xz | tar Jxv

fast_cmd() {
    tee m <<< "
.PHONY: all
.RECIPEPREFIX = >

all:
> $*"
    if ! make -j $(nproc) -f m; then
        return 1
    fi
    rm m -f
}

if cd nim-1.6.10; then
    fast_cmd ./build.sh || exit 1
    sudo ./install.sh /usr/bin || ./install.sh /usr/bin
    cd
fi

sudo apt-get install \
    libgtk-3-dev libwebkit2gtk-4.0-dev  \
    libmpfr-dev libgmp-dev  \
    -qy

git clone -b "$checkout" https://github.com/arturo-lang/arturo

if cd arturo; then
    fast_cmd ./build.nims install log || exit 1
    cp ~/.arturo/bin/arturo  /artifacts
fi
