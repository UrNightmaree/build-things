#!/usr/bin/env bash

# an util bash script

# fast_cmd <cmd> [args...]
fast_cmd() {
    local cmd="$1"; shift

    tee m <<< "
.PHONY: all
.RECIPEPREFIX = >

all:
> $cmd $*"
    make -j16 -f m || return 1
    rm m -f
}

# sudoo <cmd> [args...]
sudoo() {
    local cmd="$1"; shift

    if ! command -v "$cmd" >/dev/null; then
        return 1
    fi

    if command -v sudo >/dev/null; then
        sudo "$cmd" "$@" || return 1
    else
        exec "$cmd" "$@" || return 1
    fi
}

# install_deps [pkgs...]
install_deps() {
    sudoo apt-get install "$*" -qy || return 1
}
