case $- in
    *i*) ;;
          *) return;;
  esac
HISTCONTROL=ignoreboth
shopt -s histappend 2> /dev/null
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize 2> /dev/null

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

source ~/.alias.sh 2> /dev/null
source ~/.sh.sh 2> /dev/null
source /usr/share/fzf/completion.bash 2> /dev/null
source /usr/share/fzf/key-bindings.bash 2> /dev/null
bind -m vi-insert "\C-l":clear-screen
