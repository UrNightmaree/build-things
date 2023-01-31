#!/usr/bin/env bash

# a script for building Carp

git clone https://github.com/carp-lang/carp carp

if cd carp; then
    stack build
    stack install
    cp "$HOME/.local/bin/carp" "${ARTIFACTS:-/artifacts}"
fi
