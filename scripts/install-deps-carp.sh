#!/usr/bin/env bash

# a script for installing Carp deps

. scripts/util-cmd.sh

mkdir "$HOME/."{cabal,ghcup}"/bin" -p

curl -Lo "$HOME/.ghcup/bin/ghcup" https://downloads.haskell.org/~ghcup/armv7-linux-ghcup

export PATH="$HOME/.ghcup/bin/:$HOME/.cabal/bin:$PATH"

ghcup install stack 2.9.1
ghcup install ghc 8.10.7

stack update
stack upgrade
