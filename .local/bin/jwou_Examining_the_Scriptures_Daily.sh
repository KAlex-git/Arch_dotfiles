#!/usr/bin/env bash
##
##

## Завершить текущий экземпляр даже если он еще в процесс и подобные ему
pgrep -u $UID -x qutebrowser && killall -q qutebrowser

# Уведомление
notify-send -i "~/.local/share/icons/quteb.png" "Examining the Scriptures Daily"

# variable
current_date="$(date +%Y/%m/%d)"
jw_wol="https://wol.jw.org/ru/wol/dt/r2/lp-u/$current_date"

qutebrowser $jw_wol
