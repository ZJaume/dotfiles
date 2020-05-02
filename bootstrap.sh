#!/usr/bin/env bash

# This is a modified version of bootstrap.sh
# found on https://github.com/mathiasbynens/dotfiles

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
    rsync --exclude ".git/" \
        --exclude "bootstrap.sh" \
        --exclude "packages" \
        --exclude "README.md" \
        --exclude "LICENSE" \
        -avh --no-perms . ~;
    source ~/.bash_profile;
    tic termite.terminfo;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt;
    fi;
fi;
unset doIt;
