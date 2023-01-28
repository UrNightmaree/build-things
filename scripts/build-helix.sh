#!/usr/bin/env bas

# a scripts for building helix

checkout="${1:-master}"

. scripts/util-cmd.sh

###

curl -sSf https://sh.rustup.rs  \
    > rustup.sh
sh rustup.sh -y

# shellcheck source=/dev/null
source "$HOME/.cargo/env"

git clone https://github.com/helix-editor/helix

if cd helix; then
    git checkout "$checkout"

    # https://github.com/rust-lang/cargo/issues/6513#issuecomment-950252753
    git config --global --unset http.proxy  
    git config --global --unset https.proxy

    cargo install --locked --path helix-term
    cp "$HOME/.cargo/bin/hx" /artifacts
    cp -r runtime /artifacts
fi
