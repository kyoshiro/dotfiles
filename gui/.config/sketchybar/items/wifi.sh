#!/bin/bash

sketchybar --add item wifi right \
           --set wifi update_freq=2 \
	              background.color=$WIFI_COLOR_BG \
	              label.color=$WIFI_COLOR_FG \
	              icon.color=$WIFI_COLOR_FG \
                      icon=􀧓  \
                      script="$PLUGIN_DIR/wifi.sh"
