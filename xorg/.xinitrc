xset b off
xset b 0 0 0
xset r rate 200 50
wal -Rn
xrdb -merge ~/.Xdefaults
xrdb -merge ~/.cache/wal/colors.Xresources
exec i3

