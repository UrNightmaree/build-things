#!/usr/bin/env bash

# a script for install arturo deps

. scripts/util-cmd.sh

curl -Lo- https://nim-lang.org/download/nim-1.6.10.tar.xz | tar Jxv

if cd nim-1.6.10; then
    fast_cmd ./build.sh
    sudoo ./install.sh /usr/bin
fi

install_deps libgtk-3-dev libwebkit2gtk-4.0-dev \
    libmpfr-dev libgmp-dev
