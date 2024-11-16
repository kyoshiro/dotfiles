#!/bin/sh

sketchybar --add item weather right \
  --set weather \
    icon.color=$WEATHER_COLOR_FG \
    label.color=$WEATHER_COLOR_FG \
    background.color=$WEATHER_COLOR_BG \
  icon=󰖐 \
  script="$PLUGIN_DIR/weather.sh" \
  update_freq=1500 \
  --subscribe weather mouse.clicked
