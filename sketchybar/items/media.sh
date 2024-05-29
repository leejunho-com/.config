#!/bin/bash

sketchybar --add item media e \
           --set media label.color=$WHITE \
                       label.max_chars=20 \
                       icon.padding_left=10 \
                       scroll_texts=on \
                       icon=􀑪             \
                       icon.color=$WHITE   \
                       background.drawing=on \
                       background.color=$AERO_0 \
                       script="$PLUGIN_DIR/media.sh" \
           --subscribe media media_change
