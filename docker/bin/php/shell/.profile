# Editors...
EDITOR='vi'
PAGER='less'
VISUAL='vi'

# History...
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history

# Language...
LANG=en_US.UTF-8
LANGUAGE=en_US:en

# Terminal...
TERM=xterm-256color

# Git...
git config --global color.ui true
git config --global core.autocrlf input
git config --global core.fileMode true
git config --global format.pretty oneline
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Custom...
source ~/aliases.sh
source ~/functions.sh

# Paths...
PATH=/var/www/html/vendor/bin:~/.composer/vendor/bin:$PATH
