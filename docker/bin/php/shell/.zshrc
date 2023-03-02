[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

PS1='%B%F{cyan}❯  %F{green}%c  %f%b'

autoload -Uz colors compinit promptinit
colors
compinit
promptinit

setopt autocd
setopt autonamedirs
setopt extendedglob
setopt globcomplete
setopt histignorealldups
setopt ignoreeof
setopt nohup
setopt numericglobsort
setopt pushdignoredups
setopt pushdminus
setopt rcexpandparam
setopt sharehistory
setopt zle

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
