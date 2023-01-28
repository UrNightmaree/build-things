#!/usr/bin/env bash

# a scripts for building helix

checkout="${1:-master}"

. scripts/util-cmd.sh

###

curl -sSf https://sh.rustup.rs  \
    > rustup.sh

sh rustup.sh -y
