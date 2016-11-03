#!/bin/bash

### Basic Shell Commands ###
## Color Commands ##
# Color only if terminal is stdout
if [ -t 1 ];
then
    ncolors=$(tput colors);

    if [ -n "$ncolors" ] && [ $ncolors -ge 8 ];
    then
        if [ -x /usr/bin/colorgcc ];
        then alias gcc='colorgcc';
        fi;

        if [ -x /usr/bin/colormake ];
        then alias make='colormake';
        fi;
    fi;

    unset ncolors;
fi;


### Editor ###
if [ -x /usr/bin/emacs ];
then
    # open in current terminal, not new window
    alias emacs='emacs --no-window-system';
fi;


### Internet ###
# Use lynx browser to open DuckDuckGo search page
# if [ -x /usr/bin/lynx ];
# then alias ddg='lynx https://duckduckgo.com/html';
# fi;


### Images ###
if [ -x /usr/bin/pngcrush ];
then alias pngcrush.f='pngcrush -brute -l 9';
fi;


### Games ###
if [ -x /usr/games/desmume ];
then alias desmume.jit="desmume --cpu-mode=1";  # dynamic recompilation (JIT)
fi;


### Misc. Apps ###
# Assumed to be installed via pip
if [ -x /usr/local/bin/youtube-dl ];
then
    ytdl_args ()
    {
        local format;
        local folder;
        local file_pattern;

        case $1 in
        audio)
            format='bestaudio[acodec=vorbis]/bestaudio[ext=webm]/bestaudio';
            folder="$HOME/Music";
            file_pattern='%(title)s_%(acodec)s.%(ext)s';
            ;;
        video)
            format='best[vcodec=vp8.0]/best[ext=webm]/best';
            folder="$HOME/Videos";
            file_pattern='%(title)s_%(vcodec)s.%(ext)s';
            ;;
        esac;

        echo youtube-dl -f "'$format'" -o "'$folder/$file_pattern'";
    }

    alias ytdl=youtube-dl;
    alias ytdl.a="$( ytdl_args audio )";
    alias ytdl.v="$( ytdl_args video )";

    unset -f ytdl_args:
fi;


### User-Defined Aliases ###
