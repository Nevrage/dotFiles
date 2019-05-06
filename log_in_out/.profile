#!/bin/bash

export BROWSER="qutebrowser"
export termbrowser="w3m"
export PLAYER="mpv"
export READER="zathura"
export IMGVIEWER="feh"
export HomeServer="home.ym"
export torrent="home.ym"
export DE="i3"

# jupyter lab  --NotebookApp.token=  & 
export PATH="$PATH:$HOME/Scripts"
export EDITOR="vim"
# export TERMINAL="st"
# export BROWSER="linkhandler"
# export TRUEBROWSER="firefox"
# export READER="zathura"
# export BIB="$HOME/Documents/LaTeX/uni.bib"

[ -f ~/.bashrc ] && source ~/.bashrc

wal -Rn
# bash  "cd ~/Dropbox/ && tmsu mount ~/drives/dyn/"
# exec /home/ylan/Scripts/tw_tmux.sh


 # Start graphical server if i3 not already running.
 if [ "$(tty)" = "/dev/tty1" ]; then
  pgrep -x $DE || exec startx
 fi


