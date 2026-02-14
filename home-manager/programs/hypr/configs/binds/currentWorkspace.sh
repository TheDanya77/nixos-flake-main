#!/bin/bash

DIRECTION=$1  # "left" or "right"

# Get current workspaces
DP_WS=$(hyprctl monitors | grep -A 10 "DP-3" | grep "active workspace" | awk '{print $3}')
HDMI_WS=$(hyprctl monitors | grep -A 10 "HDMI-A-1" | grep "active workspace" | awk '{print $3}')

# Move window based on direction
if [ "$DIRECTION" == "left" ]; then
    hyprctl dispatch movetoworkspace $HDMI_WS
elif [ "$DIRECTION" == "right" ]; then
    hyprctl dispatch movetoworkspace $DP_WS
fi
