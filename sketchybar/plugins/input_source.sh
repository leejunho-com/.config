#!/bin/bash

current_input=$(defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep -o 'KeyboardLayout Name = .*' | cut -d '=' -f 2 | xargs)
echo -n "$current_input"