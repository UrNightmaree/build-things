#!/usr/bin/env bash

# a script for installing helix deps

. env-rust.sh

curl -sSf https://sh.rustup.rs | bash -s -- -y --no-modify-path
