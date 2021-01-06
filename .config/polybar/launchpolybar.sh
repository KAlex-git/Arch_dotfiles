#!/usr/bin/sh

#!/bin/sh

# Завершить текущие экземпляры polybar
killall -q polybar
killall -q polybar bottom
killall -q polybar bottom_external

# Ожидание полного завершения работы процессов
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Запуск Polybar со стандартным расположением конфигурационного файла в ~/.config/polybar/config
polybar bottom -c ~/.config/polybar/panel_bottom/configPolybar &

external_monitor=$(xrandr --query | grep 'VGA-1' | awk '{print$2}')
if [[ $external_monitor == *connected* ]]; then
	polybar -c ~/.config/polybar/panel_bottom/configPolybar bottom_external &
fi

notify-send "Polybar загрузился..."










#############################################################
#mainmonitor="$(xrandr --query | grep "connected" | cut -d" " -f1 | head -n 1)"

#if [[ LVDS-1 == "$mainmonitor" ]]; then
#	killall -q polybar
#	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
#	polybar bottom -c ~/.config/polybar/panel_bottom/config &
#else
#
#killall -q polybar
#while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
#
#polybar top -c ~/.config/polybar/panel_top/config &
#polybar bottom -c ~/.config/polybar/panel_bottom/config &
#
#fi
#
