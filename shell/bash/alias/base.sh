#!/bin/bash

## Color Commands ##
# Color only if terminal is stdout
if [ -t 1 ];
then
    ncolors=$(tput colors);

    if [ -n "$ncolors" ] && [ $ncolors -ge 8 ];
    then
        # Alias command to have color argument by default
        alias ls='ls --color=auto';
        alias grep='grep --color=auto';
        alias less='less -R';

        # Replace command with color counterpart
        [ -x /usr/bin/colordiff ] && alias diff='colordiff';
    fi;

    # Cleanup
    unset ncolors;
fi;

# Verbose
alias ls.v='ls -x -hks -bF --group-directories-first';
alias grep.v='grep -Hn';
alias rgrep.v='grep.v -r';
alias fgrep.v='grep.v -F';
alias egrep.v='grep.v -E';

# Wrap
alias less.w='less --chop-long-lines';


## Non-Color Commands ##
# Verbose as default
# if possible, make it harder to delete/overwrite files
alias rm='rm -v -I --preserve-root';
alias cp='cp -v --no-clobber';
alias mv='mv -v --no-clobber';
alias ln='ln -v';
alias mkdir='mkdir -v';
alias tar='tar -v --totals --block-number'; # assumed to be GNU tar

# Create parent directories if necessary
alias mkdir.p='mkdir -p';

# Create/Extract (compressed) archives
alias tar.c='tar -c --verify -f';   # tar.c  <archive.tar>    <files>
alias tar.cz='tar -cz -f';          # tar.cz <archive.tar.gz> <files>
alias tar.x='tar -x -f';            # tar.x  <archive.tar>
alias tar.xz='tar -xz -f';          # tar.xz <archive.tar.gz>

# List archive contents (without extraction)
alias tar.l='tar --list -f';        # tar.l <archive.tar>
