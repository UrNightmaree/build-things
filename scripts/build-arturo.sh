#!/usr/bin/env bash

# a script for building Arturo (latest/nightly)

checkout="${1:-master}"

git clone -b "$checkout" https://github.com/arturo-lang/arturo

sudo apt install libgmp-dev libmpfr-dev libgtk-3-dev libwebkit2gtk-4.0-dev  nim make

if cd arturo; then
    command -v make >/dev/null && {
        cat > makefile << EOF
.PHONY: all
all:
    ./build.nims install
EOF
        make -j8
    } || ./build.nims install
fi

echo "BUILD_RESULT=$HOME/.arturo/bin" >> $GITHUB_ENV
