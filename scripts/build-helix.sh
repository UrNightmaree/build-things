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

    # https://stackoverflow.com/a/62896599
    cat > ~/.gitconfig << EOF
[url "ssh://git@github.com/"]
    insteadOf = https://github.com/
EOF

    cargo install --locked --path helix-term || exit 1
    cp "$HOME/.cargo/bin/hx" /artifacts
    cp -r runtime /artifacts
fi
