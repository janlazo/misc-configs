# Bash config
shopt -s checkwinsize   # check (& update) window size after every command
shopt -s histappend     # append to history file, don't overrite
# shopt -s globstar     # ** matches all files. **/ for directories only

HISTCONTROL=ignoreboth; # no duplicate lines, lines starting with space
HISTFILESIZE=1000       # max num of lines 
HISTSIZE=100            # max num of commands


# Exports
if [ -f "$HOME"/.bash_exports ];
then . "$HOME"/.bash_exports;
fi;


# Command aliases
if [ -f "$HOME"/.bash_aliases ];
then . "$HOME"/.bash_aliases;
fi;
