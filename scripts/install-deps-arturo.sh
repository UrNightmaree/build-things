#!/usr/bin/env bash

# a script for install arturo deps

. scripts/util-cmd.sh

sudoo apt-get install \
    libgtk-3-dev libwebkit2gtk-4.0-dev  \
    libmpfr-dev libgmp-dev  \
    -qy
