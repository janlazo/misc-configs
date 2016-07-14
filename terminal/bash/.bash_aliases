### Basic Shell Commands ###
## Color Commands ##
# Verbose
alias ls.v='ls -hksAF --hide-control-chars';   # --color=auto'
alias grep.v='grep -n';

## Non-color Commands ##
# Verbose
alias rm='rm -v';
alias cp='cp -v';
alias mv='mv -v';
alias ln='ln -v';
alias mkdir='mkdir -v';
alias tar='tar -v';

alias du='du -hks';
alias df='df -hkT';

# Create parent directories if necessary
alias mkdir.p='mkdir -p';

# Verbose compress/extract archives
alias tar.c='tar -cf';      # tar.c <archive.tar> <files>
alias tar.cz='tar -zcf';    # tar.cz <archive.tar.gz> <files>
alias tar.x='tar -xf';      # tar.x <archive.tar> <archive>
alias tar.xz='tar -zxf';    # tar.xz <archive.tar.gz> <archive>


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
alias ddg='lynx https://duckduckgo.com/html';


### Images ###
alias pngcrush.f='pngcrush -brute -l 9';


### Games ###
alias desmume.jit="desmume --cpu-mode=1";    # dynamic recompilation (JIT)


### Misc. Apps ###
alias ytdl="youtube-dl --abort-on-error --prefer-free-formats --restrict-filenames --no-overwrites --youtube-skip-dash-manifest";
alias ytdl.a="ytdl -f 'bestaudio[ext=webm]/best' --audio-format vorbis -o '~/Music/%(title)s.%(ext)s'";
alias ytdl.v="ytdl -f 'bestvideo[ext=webm]/best' --audio-format vorbis -o '~/Videos/%(title)s.%(ext)s'";


### User-Defined Aliases ###

