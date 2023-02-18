#!/usr/bin/env bash

# a script for installing helix deps

curl -sSf https://sh.rustup.rs | bash -s -- -y

export PATH="$HOME/.cargo/bin:$PATH"
