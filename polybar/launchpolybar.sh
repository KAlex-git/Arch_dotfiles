#!/usr/bin/sh

#!/bin/sh

# Завершить текущие экземпляры polybar
killall -q polybar
killall -q polybar bottom

# Ожидание полного завершения работы процессов
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Запуск Polybar со стандартным расположением конфигурационного файла в ~/.config/polybar/config
polybar bottom -c ~/.config/polybar/panel_bottom/configPolybar &
#polybar top -c ~/.config/polybar/panel_top/config &

# -- mainmonitor="$(xrandr --query | grep "connected" | cut -d" " -f1 | head -n 1)"
# --
# -- if [[ LVDS-1 == "$mainmonitor" ]]; then
# -- 	killall -q polybar
# -- 	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
# -- 	polybar bottom -c ~/.config/polybar/panel_bottom/config &
# -- else
# --
# -- killall -q polybar
# -- while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
# --
# -- polybar top -c ~/.config/polybar/panel_top/config &
# -- polybar bottom -c ~/.config/polybar/panel_bottom/config &
# --
# -- fi
notify-send "Polybar загрузился..."
