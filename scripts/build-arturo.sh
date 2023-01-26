#!/usr/bin/env bash

# a script for building Arturo (latest/nightly)

checkout="${1:-master}"

git clone -b "$checkout" https://github.com/arturo-lang/arturo

sudo apt-get install libgmp-dev libmpfr-dev libgtk-3-dev libwebkit2gtk-4.0-dev 

curl -Lo- https://nim-lang.org/download/nim-1.6.10.tar.xz | tar Jxv

if cd nim-1.6.10; then
    cat > m <<< "
all:
    ./build.sh
    ./install.sh

.PHONY: all"
    make -f m -j $(nproc)
    cd $HOME
fi

if cd arturo; then
    cat > makefile <<< "
all:
    ./build.nims install

.PHONY: all"
    make -j $(nproc)
fi

echo "BUILD_RESULT=$HOME/.arturo/bin" >> $GITHUB_ENV
