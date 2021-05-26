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


# cat ~/.cache/wal/sequences 2> /dev/null
# source ~/.cache/wal/colors-tty.sh 2> /dev/null

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
# source ~/.profile

export PATH="$PATH:$HOME/Scripts"

function cd() {
  command cd "$@" || return

  if [[ -f .local.sh ]]
  then
    source .local.sh
  else
    ls -al
  fi
}


# Select a docker container to start and attach to
function da() {
          local cid
            cid=$(sudo docker ps -a | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

              [ -n "$cid" ] && sudo docker start "$cid" && sudo docker attach "$cid"
      }
# Select a running docker container to stop
function ds() {
          local cid
            cid=$(sudo docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

              [ -n "$cid" ] && sudo docker stop "$cid"
      }
# Select a docker container to remove
function drm() {
          local cid
            cid=$(sudo docker ps -a | sed 1d | fzf -q "$1" | awk '{print $1}')

              [ -n "$cid" ] && sudo docker rm "$cid"
      }

export BROWSER="qutebrowser"
export termbrowser="w3m"
export PLAYER="mpv"
export READER="zathura"
export IMGVIEWER="feh"
export HomeServer="home.ym"
export torrent="home.ym"
export PATH="$PATH:$HOME/Scripts"
export EDITOR="vim"
export TERM="kitty"
export TERMINAL="kitty"
# export BROWSER="linkhandler"
export TRUEBROWSER="qutebrowser"
export BIB="$HOME/Documents/LaTeX/uni.bib"
export SHELL=bash
export NOTES="/home/ylan/Data/Perso/Notes/"
export dyn="~/dyn"
export LANG=C
export DE1="bspwm"
export DE2="openbox"
export DE=DE # what does this mean?
export DE1=bspwm
export DE2=openbox-session
