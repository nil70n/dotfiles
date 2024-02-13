#!/bin/bash

WAYVNCCTL=${WAYVNCCTL:-wayvncctl}
scriptFolder="/home/$USER/dotfiles/scripts/custom"

# Listen for Connections
_runListener() {
  if [ -z $vncListener ]; then
    vncListener=1

    while IFS= read -r EVT; do
      case "$(jq -r '.method' <<<"$EVT")" in
          client-connected)
            source $scriptFolder/monitor-ipad.sh 'on'
            ;;
          client-disconnected)
            source $scriptFolder/monitor-ipad.sh 'off'
            ;;
          wayvnc-shutdown)
            unset vncServer
            ;;
      esac
    done < <("$WAYVNCCTL" --wait --reconnect --json event-receive)

    unset vncListener
  fi
}

# Execute WayVNC
_runVNC() {
  if [ -z $vncServer ]; then
    wayvnc -f=60 -g
    vncServer=1
  fi
}

_runListener &
_runVNC &
