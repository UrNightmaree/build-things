#!/usr/bin/env bas

# a scripts for building helix

checkout="${1:-master}"

. scripts/util-cmd.sh

git clone https://github.com/helix-editor/helix

if cd helix; then
    git checkout "$checkout"

    cargo install --path helix-term || exit 1
    cp "$HOME/.cargo/bin/hx" /artifacts
    cp -r runtime /artifacts
fi
