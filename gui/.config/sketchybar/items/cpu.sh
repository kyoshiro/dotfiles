#!/bin/bash

sketchybar --add item cpu right \
           --set cpu  update_freq=2 \
	              background.color=$CPU_COLOR_BG \
	              label.color=$CPU_COLOR_FG \
	              icon.color=$CPU_COLOR_FG \
                      icon=􀧓  \
                      script="$PLUGIN_DIR/cpu.sh"
