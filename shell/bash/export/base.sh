#!/bin/bash

### Shell ###
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


add_bin_to_path "$HOME";
