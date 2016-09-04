#!/bin/sh

## Script Variables
REPODIR=$(pwd);
USER_SHELL=$(getent passwd $LOGNAME | cut -d : -f 7);
USE_BASH=$(test "$USER_SHELL" = "/bin/bash");


## Setup git submodules in this repository
git submodule init
git submodule update --init --recursive


## User config
if test -n "$HOME";
then
    #### TODO: Save the affected files in a backup directory
    # Bash
    if $USE_BASH;
    then cp shell/bash/* $HOME;
    fi;

    # Git
    cp version-control/git/gitconfig $HOME/.gitconfig;
    cp .gitignore $HOME;
    git config --global core.excludesfile $HOME/.gitignore;

    # Vim
    git clone --local $REPODIR/editor/vim-config.git $HOME/.vim;

    # Neovim
    git clone --local $REPODIR/editor/vim-config.git $HOME/.config/nvim;
    cd $HOME/.config/nvim;
    git checkout nvim;
    cd $REPODIR;

    # Ctags
    cp $REPODIR/editor/ctags/.ctags $HOME;
    cp $REPODIR/editor/ctags/.ctagsignore $HOME;
    printf "--exclude=@""$HOME"".ctagsignore" >> $HOME/.ctags;

    # youtube-dl
    cp -r $REPODIR/etc/youtube-dl $HOME/.config/;
fi;


## Source the shell files
if $USE_BASH;
then . ~/.bashrc;
fi;
