#!/bin/sh

## Dependencies
. ./lib/functions.sh


## Script Variables
REPO_D=$(pwd);
USER_SHELL=$(getent passwd "$LOGNAME" | cut -d : -f 7);
USE_BASH=$(test "$USER_SHELL" = "/bin/bash");
BACKUP_D="$HOME/.bak";
UUID="$(uuidgen)";

test -n "$UUID" && BACKUP_D="$BACKUP_D/$UUID";
(test ! -d "$BACKUP_D") && mkdir -p "$BACKUP_D";

printf "\nBackup Directory: %s\n" "$BACKUP_D";

## Setup git submodules in this repository
git submodule init;
git submodule update --init --recursive;


## User config
test ! -d "$HOME/.config" && mkdir "$HOME/.config";

# TODO
# Move the ff to an install script per directory for modularity
if test -n "$HOME";
then
    # Vim and Neovim
    VIM_D="$REPO_D"/editor/vim.git;

    backup -b $BACKUP_D "$HOME"/.vimrc "$HOME"/.vim "$HOME"/.config/nvim;

    ln -s "$VIM_D" "$HOME/.vim";
    ln -s "$VIM_D" "$HOME/.config/nvim";


    # Ctags
    CTAGS_D="$REPO_D"/etc/ctags;

    backup -b $BACKUP_D "$HOME"/.ctags "$HOME"/.ctagsignore;
    cp "$CTAGS_D"/.ctags "$HOME";
    cp "$CTAGS_D"/.ctagsignore "$HOME";
    printf "%s=@%s.ctagsignore\n" "--exclude" "$HOME" >> "$HOME"/.ctags;


    # youtube-dl
    YTDL_D="$REPO_D"/etc/youtube-dl;

    backup -b $BACKUP_D "$HOME"/.config/youtube-dl;
    cp -rf "$YTDL_D" "$HOME"/.config/youtube-dl;
fi;
