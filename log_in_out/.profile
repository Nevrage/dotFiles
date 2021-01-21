export BROWSER="qutebrowser"
export termbrowser="w3m"
export PLAYER="mpv"
export READER="zathura"
export IMGVIEWER="feh"
export HomeServer="home.ym"
export torrent="home.ym"
export PATH="$PATH:$HOME/Scripts"
export EDITOR="vim"
export TERMINAL="alacritty"
# export BROWSER="linkhandler"
export TRUEBROWSER="qutebrowser"
export BIB="$HOME/Documents/LaTeX/uni.bib"
export SHELL=bash
export NOTES="/home/ylan/Data/Perso/Notes/"
export dyn="~/dyn"
export LANG=C
export DE1="bspwm"
export DE2="openbox"

wal -Rn  > /dev/null 2>&1

export DE=DE # what does this mean?
export DE1=bspwm
export DE2=openbox

# TODO: don't try if $DE$i does not exist
if tty  | grep -q 'tty'; then
   export i=$(echo $(tty) | awk '{print substr($0,length,1)}')
   export WM=$DE$i
   startx
fi
