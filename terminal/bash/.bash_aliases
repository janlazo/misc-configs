### Basic Shell Commands ###
# Force interaction and be verbose
# If possible, be recursive
alias rm='rm -ivr'
alias cp='cp -ivr'
alias mv='mv -iv'
alias ln='ln -iv'

# Create parent directories if necessary
alias mkdir='mkdir -pv'

# Make output readable
alias ls='ls -hksAF --hide-control-chars'   # --color=auto'
alias grep='grep -n'
alias du='du -hk'
alias df='df -hkT'

# Verbose compress/extract archives
alias tar.c='tar -cvf'      # tar.c <archive.tar> <files>
alias tar.cz='tar -zcvf'    # tar.cz <archive.tar.gz> <files>
alias tar.x='tar -xvf'      # tar.x <archive.tar> <archive>
alias tar.xz='tar -zxvf'    # tar.xz <archive.tar.gz> <archive>


### Package Manager ###
alias sysupd='su -c "apt-get update && apt-get autoclean"'
alias sysupg='su -c "apt-get upgrade"'
alias sysupgf='su -c "apt-get dist-upgrade && apt-get autoremove"'


### Version Control ###


### Editor ###
alias vim='vim -p';         # open file/s in tabs (default: 1 file/tab)
alias emacs='emacs -nw'     # open in terminal, not new window


### Languages ###


### Internet ###
alias ddg='lynx https://duckduckgo.com/html';


### Images ###
alias pngcrush='pngcrush -brute -reduce'


### Games ###
alias desmume="desmume --cpu-mode=1"    # dynamic recompilation (JIT)


### Misc. Apps ###
alias ytdl="youtube-dl --abort-on-error --prefer-free-formats --restrict-filenames --no-overwrites --youtube-skip-dash-manifest";
alias ytdl.a="ytdl -f 'bestaudio[ext=webm]/best' --audio-format vorbis -o '~/Music/%(title)s.%(ext)s'"
alias ytdl.v="ytdl -f 'bestvideo[ext=webm]/best' --audio-format vorbis -o '~/Videos/%(title)s.%(ext)s'"


### User-Defined Aliases ###

