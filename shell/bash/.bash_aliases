### Basic Shell Commands ###
## Color Commands ##
# Color only if terminal can use it
if test -t 1;
then
    ncolors=$(tput colors);

    if test -n "$ncolors" && test $ncolors -ge 8;
    then
        # Alias command to have color argument by default
        alias ls='ls --color=auto';
        alias grep='grep --color=auto';

        # Replace command with color counterpart
        if [ -x /usr/bin/colordiff ];
        then alias diff='colordiff';
        fi;

        if [ -x /usr/bin/colorgcc ];
        then alias gcc='colorgcc';
        fi;

        if [ -x /usr/bin/colormake ];
        then alias make='colormake';
        fi;
    fi;

    unset ncolors;
fi;

# Verbose
alias ls.v='ls -x -hks -bF --group-directories-first';
alias grep.v='grep -Hn';
alias rgrep.v='grep.v -r';
alias fgrep.v='grep.v -F';
alias egrep.v='grep.v -E';

## Non-color Commands ##
# Verbose
alias rm='rm -v';
alias cp='cp -v';
alias mv='mv -v';
alias ln='ln -v';
alias mkdir='mkdir -v';
alias tar='tar -v --totals --block-number';

alias free='free -hlt';
alias du='du -hk --max-depth 1';
alias df='df -hk --print-type';

# Create parent directories if necessary
alias mkdir.p='mkdir -p';

# Single prompt before recursion and don't delete root
alias rm.safe='rm -I --preserve-root';

# Don't overwrite existing file
alias cp.safe='cp --no-clobber';
alias mv.safe='mv --no-clobber';

# Create/Extract (compressed) archives
alias tar.c='tar -c --verify -f';   # tar.c <archive.tar> <files>
alias tar.cz='tar -cz -f';          # tar.cz <archive.tar.gz> <files>
alias tar.x='tar -x -f';            # tar.x <archive.tar>
alias tar.xz='tar -xz -f';          # tar.xz <archive.tar.gz>

# List archive contents (without extraction)
alias tar.l='tar --list -f';    # tar.l <archive.tar>


### Package Manager ###
alias sysupd='su -c "apt-get update && apt-get autoclean"';
alias sysupg='su -c "apt-get upgrade"';
alias sysupgf='su -c "apt-get dist-upgrade && apt-get autoremove"';


### Version Control ###


### Editor ###
if [ -x /usr/bin/vim ];
then alias vim='vim -p';    # open file/s in tabs (default: 1 file/tab)
fi;

if [ -x /usr/bin/emacs ];
then alias emacs='emacs --no-window-system';    # open in terminal
fi;


### Languages ###


### Internet ###
# Continue, not restart, on interrupted download
alias wget='wget -c';

# Use lynx browser to open DuckDuckGo search page
if [ -x /usr/bin/lynx ];
then alias ddg='lynx https://duckduckgo.com/html';
fi;


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
