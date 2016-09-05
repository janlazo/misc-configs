#!/bin/sh

## Script Variables
REPO_D=$(pwd);
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
    then
        BASH_D=$REPO_D/shell/bash;

        cp $BASH_D/.bashrc $HOME;
        cp $BASH_D/.bash_exports $HOME;
        cp $BASH_D/.bash_aliases $HOME;
    fi;

    # Git
    cp $REPO_D/version-control/git/gitconfig $HOME/.gitconfig;
    cp $REPO_D/.gitignore $HOME
    git config --global core.excludesfile $HOME/.gitignore;

    # Vim
    ln -s $REPO_D/editor/vim-config.git $HOME/.vim;

    # Neovim
    ln -s $REPO_D/editor/nvim-config.git $HOME/.config/nvim;

    # Ctags
    cp $REPO_D/editor/ctags/.ctags $HOME;
    cp $REPO_D/editor/ctags/.ctagsignore $HOME;
    printf "--exclude=@""$HOME"".ctagsignore" >> $HOME/.ctags;

    # youtube-dl
    cp -r $REPO_D/etc/youtube-dl $HOME/.config/;
fi;


## Source the shell files
if $USE_BASH;
then . ~/.bashrc;
fi;
