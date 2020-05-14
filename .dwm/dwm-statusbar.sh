#!/bin/sh
datetime() {
	datetime="$(date "+%H:%M")"
	echo "$datetime"
}

battery() {
	capacity="$(cat /sys/class/power_supply/BAT0/capacity)"
	if [ "$(cat /sys/class/power_supply/AC/online)" -eq 0 ]; then
    echo "$capacity% "
	fi
}

while true; do
	xsetroot -name " $(battery)$(datetime) "
	sleep 30s
done &
