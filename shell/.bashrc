case $- in
    *i*) ;;
          *) return;;
  esac
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

source ~/.alias.sh
source ~/.sh.sh
source /usr/share/fzf/completion.bash
source /usr/share/fzf/key-bindings.bash
