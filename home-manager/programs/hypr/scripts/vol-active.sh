#!/usr/bin/env bash

ACTIVE_SINK=$(pw-dump | jq -r '
  .[] | select(.type == "PipeWire:Interface:Node" and .info.props["media.class"] == "Audio/Sink") |
  select(.info.state == "RUNNING") |
  .id' | head -1)

if [ -z "$ACTIVE_SINK" ]; then
  ACTIVE_SINK="@DEFAULT_AUDIO_SINK@"
fi

case "$1" in
  up)
    if [[ "$2" == "low" || "$2" == "fine" || "$2" == "1" ]]; then
      wpctl set-volume "$ACTIVE_SINK" 1%+
    else
      wpctl set-volume "$ACTIVE_SINK" 5%+
    fi
    ;;
  down)
    if [[ "$2" == "low" || "$2" == "fine" || "$2" == "1" ]]; then
      wpctl set-volume "$ACTIVE_SINK" 1%-
    else
      wpctl set-volume "$ACTIVE_SINK" 5%-
    fi
    ;;
  mute)
    wpctl set-mute "$ACTIVE_SINK" toggle
    ;;
  *)
    echo "Usage: $0 {up|down|mute} [low]"
    echo "  без другого аргументу  → ±5%"
    echo "  з low / fine / 1      → ±1%"
    exit 1
    ;;
esac
