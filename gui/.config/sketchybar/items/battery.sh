#!/bin/bash

sketchybar --add item battery right \
           --set battery update_freq=120 \
	   		 label.color=$BATTERY_COLOR_FG \
	   		 icon.color=$BATTERY_COLOR_FG \
			 background.color=$BATTERY_COLOR_BG \
                         script="$PLUGIN_DIR/battery.sh" \
           --subscribe battery system_woke power_source_change
