#!/bin/sh
##
#source $HOME/.local/bin/shellColor.sh
##
##
dead="kill -TERM $(ps aux | grep "zoom" )"

killall -q zoom
notify-send -i "~/.local/share/icons/zoom.png" "ZOOM Meeting"
zoom
