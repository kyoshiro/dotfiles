#!/bin/bash

sketchybar --add item volume right \
	   --set volume icon.color=$VOLUME_COLOR_FG \
	                label.color=$VOLUME_COLOR_FG \
	                background.color=$VOLUME_COLOR_BG \
                        script="$PLUGIN_DIR/volume.sh" \
                 --subscribe volume volume_change
