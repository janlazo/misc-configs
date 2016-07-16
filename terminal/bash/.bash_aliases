### Basic Shell Commands ###
## Color Commands ##
# Verbose
alias ls.v='ls -hks -AF --escape --group-directories-first';
alias grep.v='grep -Hn';

## Non-color Commands ##
# Verbose
alias rm='rm -v';
alias cp='cp -v';
alias mv='mv -v';
alias ln='ln -v';
alias mkdir='mkdir -v';
alias tar='tar -v';

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
alias ddg='lynx https://duckduckgo.com/html';


### Images ###
alias pngcrush.f='pngcrush -brute -l 9';


### Games ###
alias desmume.jit="desmume --cpu-mode=1";    # dynamic recompilation (JIT)


### Misc. Apps ###
alias ytdl="youtube-dl --abort-on-error --prefer-free-formats --restrict-filenames --no-overwrites --youtube-skip-dash-manifest";
alias ytdl.a="ytdl -f 'bestaudio[acodec=vorbis]/best' -o '~/Music/%(title)s.%(acodec)s.%(ext)s'"
alias ytdl.v="ytdl -f 'bestvideo[acodec=vorbis]/best' -o '~/Videos/%(title)s.%(acodec)s.%(vcodec)s.%(ext)s'"


### User-Defined Aliases ###

