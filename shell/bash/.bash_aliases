### Basic Shell Commands ###
## Color Commands ##
# Color it through arguments
# TODO: Add if block to check if required bins/configs are met
#alias ls='ls --color=auto';
#alias grep='grep --color=auto';

# Replace command with its colour counterpart
# TODO: Add if block to check if required bins/configs are met
#alias diff='colordiff';
#alias gcc='colorgcc';
#alias make='colormake';

# Verbose
alias ls.v='ls -hks -AF --escape --group-directories-first';
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
alias tar='tar -v';

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
alias tar.c='tar --verify -cf';      # tar.c <archive.tar> <files>
alias tar.cz='tar --verify -zcf';    # tar.cz <archive.tar.gz> <files>
alias tar.x='tar -xf';      # tar.x <archive.tar> <archive>
alias tar.xz='tar -zxf';    # tar.xz <archive.tar.gz> <archive>

# List archive contents (without extraction)
alias tar.list='tar --totals --block-number -tf'; # tar.t <archive.tar>


### Package Manager ###
alias sysupd='su -c "apt-get update && apt-get autoclean"';
alias sysupg='su -c "apt-get upgrade"';
alias sysupgf='su -c "apt-get dist-upgrade && apt-get autoremove"';


### Version Control ###


### Editor ###
alias vim='vim -p';         # open file/s in tabs (default: 1 file/tab)
alias emacs='emacs -nw';     # open in terminal, not new window


### Languages ###


### Internet ###
# Continue, not restart, on interrupted download
alias wget='wget -c';

# Use lynx browser to open DuckDuckGo search page 
alias ddg='lynx https://duckduckgo.com/html';


### Images ###
alias pngcrush.f='pngcrush -brute -l 9';


### Games ###
alias desmume.jit="desmume --cpu-mode=1";    # dynamic recompilation (JIT)


### Misc. Apps ###
ytdl_args ()
{
    local ytdl_format;
    local ytdl_folder;
    local ytdl_file_pattern;

    case $1 in
    audio)
        ytdl_format='bestaudio[acodec=vorbis]/bestaudio[container=webm]/best';
        ytdl_folder='~/Music';
        ytdl_file_pattern='%(title)s_%(acodec)s.%(ext)s';
        ;;
    video)
        ytdl_format='bestvideo[acodec=vorbis]/bestvideo[container=webm]/best';
        ytdl_folder='~/Videos';
        ytdl_file_pattern='%(title)s_%(acodec)s_%(vcodec)s.%(ext)s';
        ;;
    esac;

    echo "youtube-dl -f '$ytdl_format' -o '$ytdl_folder/$ytdl_file_pattern'";
}

alias ytdl=youtube-dl;
alias ytdl.a="$( ytdl_args audio )";
alias ytdl.v="$( ytdl_args video )";

unset -f ytdl_args


### User-Defined Aliases ###

