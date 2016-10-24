#!/bin/sh

## Functions
backup() {
    # TODO: Add UUID or unique date as part of backup folder name
    BACKUP_D="$HOME/.bak";

    (test ! -d "$BACKUP_D") && mkdir "$BACKUP_D";

    # TODO: Handle error via early return
    for file in "$@";
    do
        printf "Moving %s in %s\n" "$file" "$BACKUP_D";
        (test -e "$file") && mv -f "$file" "$BACKUP_D";
    done;
}


## Script Variables
REPO_D=$(pwd);
USER_SHELL=$(getent passwd "$LOGNAME" | cut -d : -f 7);
USE_BASH=$(test "$USER_SHELL" = "/bin/bash");


## Setup git submodules in this repository
git submodule init;
git submodule update --init --recursive;


## User config
if test -n "$HOME";
then
    # Tmux
    TMUX_D="$REPO_D/terminal/tmux";

    backup "$HOME/.tmux.conf" "$HOME/.tmux";
    ln -s "$TMUX_D" "$HOME/.tmux";
    printf "source-file '%s/.tmux/tmux.conf'\n" "$HOME" > "$HOME/.tmux.conf";

    # Bash
    if $USE_BASH;
    then
        BASH_D="$REPO_D/shell/bash";

        backup "$HOME/.bash_profile" "$HOME/.bashrc" "$HOME/.bash_aliases";
        rm -rf "$HOME/.bash";
        cp -rf "BASH_D" "$HOME/.bash";
        cp "$HOME/.bash/bash_profile" "$HOME/.bash_profile";
    fi;


    # Git
    GIT_D="$REPO_D"/version-control/git;

    backup "$HOME"/.gitconfig "$HOME"/.gitignore;
    cp "$GIT_D"/gitconfig "$HOME"/.gitconfig;
    cp "$REPO_D"/.gitignore "$HOME";
    git config --global core.excludesfile "$HOME"/.gitignore;


    # Vim and Neovim
    VIM_D="$REPO_D"/editor/vim.git;

    backup "$HOME"/.vimrc "$HOME"/.vim "$HOME"/.config/nvim;

    ln -s "$VIM_D" "$HOME/.vim";
    ln -s "$VIM_D" "$HOME/.config/nvim";

    # Ctags
    CTAGS_D="$REPO_D"/editor/ctags;

    backup "$HOME"/.ctags "$HOME"/.ctagsignore;
    cp "$CTAGS_D"/.ctags "$HOME";
    cp "$CTAGS_D"/.ctagsignore "$HOME";
    printf "%s=@%s.ctagsignore\n" "--exclude" "$HOME" >> "$HOME"/.ctags;


    # youtube-dl
    YTDL_D="$REPO_D"/etc/youtube-dl;

    backup "$HOME"/.config/youtube-dl;
    cp -rf "$YTDL_D" "$HOME"/.config/youtube-dl;
fi;


## Cleanup
unset backup
