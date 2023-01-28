#!/usr/bin/env bash

# an util bash script

fast_cmd() {
    tee m <<< "
.PHONY: all
.RECIPEPREFIX = >

all:
> $*"
    make -j16 -f m || exit 1
    rm m -f
}
