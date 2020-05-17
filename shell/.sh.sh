function parse_git_branch() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${BRANCH}" == "" ]
    then
        STAT=`parse_git_dirty`
        echo "[${BRANCH}${STAT}]"
    else
        echo ""
    fi
}

set -o vi


cat ~/.cache/wal/sequences 2> /dev/null
source ~/.cache/wal/colors-tty.sh 2> /dev/null

PATH="$HOME/bin:$PATH"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

include () {
    [[ -f "$1" ]] && source "$1"
}


QR () {
        qrencode "$@" -d 300 -s 20  -o /tmp/qr.png && sxiv /tmp/qr.png
}


source ~/Scripts/bash2rc 2> /dev/null
source ~/.bash2rc 2> /dev/null
source .local.sh 2> /dev/null

tsks() {
        tasks $* | grep -P --colour=always '(?:^|(?<=[\\, ;\-\+\*\/]))[-+]?[0-9]*[\.eE]?[0-9]+|$'
}

export PATH="$PATH:$HOME/Scripts"

#X=$( pidof Xorg )
#if [ ${#X} -gt 0 ]; then
#    echo ""
#else
        source ~/.profile
#fi
#clear

function cd() {
  command cd "$@" || return

  if [[ -f .local.sh ]]
  then
    source .local.sh
  else
    ls -al
  fi
}
