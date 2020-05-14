#!/bin/sh
pid="$(pstree -pl | grep '-- dwm-statusbar.*sleep' | sed 's/.*sleep(\([0-9]\+\)).*/\1/')"

kill "$pid"
