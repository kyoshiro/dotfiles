#!/bin/bash

sketchybar --add item media right \
           --set media label.color=$MEDIA_COLOR_FG \
                       label.max_chars=23 \
                       icon.padding_left=0 \
                       scroll_texts=on \
                       icon=􀑪             \
                       icon.color=$MEDIA_COLOR_FG   \
                       background.color=$MEDIA_COLOR_BG   \
                       script="$PLUGIN_DIR/media.sh" \
           --subscribe media media_change
