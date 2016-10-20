#!/bin/sh

## Functions
backup() {
    BACKUP_D=$HOME/.bak;

    (test ! -d $BACKUP_D) && mkdir $BACKUP_D;

    for file in "$@";
    do
        printf "Moving %s in %s\n" $file $BACKUP_D;
        (test -e $file) && mv -f $file $BACKUP_D;
    done;
}


## Script Variables
REPO_D=$(pwd);
USER_SHELL=$(getent passwd $LOGNAME | cut -d : -f 7);
USE_BASH=$(test "$USER_SHELL" = "/bin/bash");


## Setup git submodules in this repository
git submodule init;
git submodule update --init --recursive;


## User config
if test -n "$HOME";
then
    # Tmux
    backup $HOME/.tmux.conf;
    cp $REPO_D/terminal/tmux.conf $HOME/.tmux.conf;

    # Bash
    if $USE_BASH;
    then
        BASH_D=$REPO_D/shell/bash;

        backup $HOME/.bashrc $HOME/.bash_exports $HOME/.bash_aliases;
        cp $BASH_D/.bashrc $HOME;
        cp $BASH_D/.bash_exports $HOME;
        cp $BASH_D/.bash_aliases $HOME;
    fi;


    # Git
    GIT_D=$REPO_D/version-control/git;

    backup $HOME/.gitconfig $HOME/.gitignore;
    cp $GIT_D/gitconfig $HOME/.gitconfig;
    cp $REPO_D/.gitignore $HOME;
    git config --global core.excludesfile $HOME/.gitignore;


    # Vim and Neovim
    VIM_D=$REPO_D/editor/vim.git;

    backup $HOME/.vimrc $HOME/.vim $HOME/.config/nvim;

    ln -s $VIM_D $HOME/.vim;
    ln -s $VIM_D $HOME/.config/nvim;

    # Ctags
    CTAGS_D=$REPO_D/editor/ctags;

    backup $HOME/.ctags $HOME/.ctagsignore;
    cp $CTAGS_D/.ctags $HOME;
    cp $CTAGS_D/.ctagsignore $HOME;
    printf "%s=@%s.ctagsignore" "--exclude" "$HOME" >> $HOME/.ctags;


    # youtube-dl
    YTDL_D=$REPO_D/etc/youtube-dl;

    backup $HOME/.config/youtube-dl;
    cp -rf $YTDL_D $HOME/.config/youtube-dl;
fi;


## Cleanup
unset backup
