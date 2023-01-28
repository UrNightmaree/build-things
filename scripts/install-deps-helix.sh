#!/usr/bin/env bash

# a script for installing helix deps

curl -sSf https://sh.rustup.rs  \
    > rustup.sh
sh rustup.sh -y

# shellcheck source=/dev/null
source "$HOME/.cargo/env"