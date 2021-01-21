xset b 0 0 0
xset r rate 200 50
wal -Rn
xrdb -merge ~/.Xdefaults
xrdb -merge ~/.cache/wal/colors.Xresources
xset -dpms
xset s off
xset s noblank
# xrdb ~/.Xresources-xrdp
# TODO: execute (auto)start.sh if it exists
exec ${!WM} # if the variable is defined
