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

function parse_git_dirty {
    status=`git status 2>&1 | tee`
    dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
    untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
    ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
    newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
    renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
    deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
    bits=''
    if [ "${renamed}" == "0" ]; then
        bits=">${bits}"
    fi
    if [ "${ahead}" == "0" ]; then
        bits="*${bits}"
    fi
    if [ "${newfile}" == "0" ]; then
        bits="+${bits}"
    fi
    if [ "${untracked}" == "0" ]; then
        bits="?${bits}"
    fi
    if [ "${deleted}" == "0" ]; then
        bits="x${bits}"
    fi
    if [ "${dirty}" == "0" ]; then
        bits="!${bits}"
    fi
    if [ ! "${bits}" == "" ]; then
        echo " ${bits}"
    else
        echo ""
    fi
}



function reloadi3() {
killall polybar
xrdb -merge ~/.cache/wal/colors.Xresources  2> /dev/null
i3-msg reload
i3-msg restart
}
ansi()          { echo -e "\e[${1}m${*:2}\e[0m"; }
bold()          { ansi 1 "$@"; }
italic()        { ansi 3 "$@"; }

# export PS1="\[$(tput setaf 1)\][\[$(tput setaf 2)\]\A\[$(tput setaf 1)\]]\[$(tput sgr0)\]\[$(tput setaf 1)\][\[$(tput setaf 2)\]\u\[$(tput setaf 1)\]]\[$(tput sgr0)\]\[$(tput setaf 1)\][\[$(tput setaf 2)\]\h\[$(tput setaf 1)\]]\[$(tput sgr0)\]\[$(tput setaf 1)\][\[$(tput setaf 2)\]\W\[$(tput setaf 1)\]]\[$(tput sgr0)\] \`parse_git_branch\` \[$reset\]\n\[$green\] > \[$black\]"

 export PS1="┌──\[\e[35m\]\u\[\e[m\]\[\e[31;40m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\]\[\e[31;40m\]\\$\[\e[m\]\W\[\e[30;47m\]\`parse_git_branch\`\[\e[m\]\n└─╼ "

