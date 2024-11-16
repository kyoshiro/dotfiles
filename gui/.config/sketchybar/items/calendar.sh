#!/bin/bash

sketchybar --add item calendar right \
           --set calendar icon=􀧞  \
	   		  label.color=$CALENDAR_COLOR_FG \
	   		  icon.color=$CALENDAR_COLOR_FG \
			  background.color=$CALENDAR_COLOR_BG \
                          update_freq=30 \
                          script="$PLUGIN_DIR/calendar.sh"
