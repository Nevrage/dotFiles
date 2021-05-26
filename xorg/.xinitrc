#! /bin/sh

xset b 0 0 0
xset r rate 200 100
xset s off
# xset s noblank

wal -Rn
xrdb -merge ~/.Xdefaults
xrdb -merge ~/.cache/wal/colors.Xresources
xset -dpms
# xrdb ~/.Xresources-xrdp
# TODO: execute (auto)start.sh if it exists
# exec ${!WM}
exec bspwm
# exec ${!WM} # where WM is defined in .profile

