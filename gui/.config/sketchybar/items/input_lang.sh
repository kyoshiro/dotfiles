#!/bin/sh

sketchybar --add item input_source right
sketchybar --set input_source \
	         icon.color=$LANG_COLOR_FG \
	         background.color=$LANG_COLOR_BG \
                 icon.font="$FONT:Regular:20.0" \
	         label.color=$LANG_COLOR_FG \
                 script="$PLUGIN_DIR/input_lang.sh" \
                 update_freq=1 \
           --subscribe input_source mouse.clicked
