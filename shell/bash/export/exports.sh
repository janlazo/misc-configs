#!/bin/bash

## Shell ##
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[00m\]\n\$ '


### Text Editor ###
if [ -x /usr/bin/nvim ];
then export EDITOR=nvim;
else export EDITOR=vim;
fi;

export VISUAL=$EDITOR


### Language Locales ###
export LANG=en_US.UTF-8;
export LANGUAGE=$LANG;
export LC_ALL=$LANG;


### Paths ###
# Python
export PYTHONPATH="$PYTHONPATH:/usr/bin:/usr/local/bin";

# Java
# TODO Update this after installing a Java Dev Toolkit (JDK)
export JAVA_HOME="$JAVA_HOME";

if [ -n "$JAVA_HOME" ];
then
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$JAVA_HOME/lib";
    export CLASSPATH="$CLASSPATH:$LD_LIBRARY_PATH";
fi;

# GO
export GOROOT="$GOROOT";
[ -d "$HOME/.go" ] && export GOHOME="$HOME/.go";
export GOPATH="$GOHOME:$GOROOT:$GOPATH";

# Rust
[ -d "$HOME"/.cargo ] && export CARGO_HOME="$HOME/.cargo";


# Put them all together
add_bin_to_path "$HOME" "$JAVA_HOME" "$CARGO_HOME" "$GOHOME" "$GOROOT";


### User-Defined Exports ###
# fzf - fuzzy file searcher for the terminal
add_bin_to_path "$HOME/.fzf";
