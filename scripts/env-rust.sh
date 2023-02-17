#!/usr/bin/env bash

# a script for setting up rust environment

export CARGO_HOME=/opt/rust/cargo
export RUSTUP_HOME=/opt/rust/rustup

export PATH="$CARGO_HOME/bin:$PATH"
