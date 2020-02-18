#!/bin/sh
datetime() {
	datetime="$(date "+%H:%M")"
	echo "$datetime"
}

battery() {
	capacity="$(cat /sys/class/power_supply/BAT0/capacity)"
	if [[ $(cat /sys/class/power_supply/AC/online) -eq 1 ]]; then
		battery="Charging-$capacity%"
	else
		battery="Discharging-$capacity%"
	fi
	echo "$battery"
}

while true; do
	xsetroot -name " $(battery) $(datetime) "
	sleep 30s
done &
