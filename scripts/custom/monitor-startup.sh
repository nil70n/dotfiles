#!/bin/bash
###########################################
#                                         #
#          ) (   (                )       #
#       ( /( )\ ))\ )    )   ) ( /(       #
#       )\()|()/(()/( ( /(( /( )\())      #
#      ((_)\ /(_))(_)))\())\()|(_)\       #
#       _((_|_))(_)) ((_)((_)\ _((_)      #
#      | \| |_ _| | |__  /  (_) \| |      #
#      | .` || || |__ / / () || .` |      #
#      |_|\_|___|____/_/ \__/ |_|\_|      #
#                                         #
###########################################
#  Apply config for connected monitor
###########################################

scripts_path=/home/$USER/dotfiles/scripts/custom

connected_monitor=$(hyprctl monitors all | grep 'Monitor' | grep -m 1 -wv $MONITOR | awk '{print $2}')
[ -z $connected_monitor ] && connected_monitor=$MONITOR

connected_monitor=$(cat $scripts_path/monitor-configs.json \
  | jq -r '.[].name' | grep -w $connected_monitor)
[ -z $connected_monitor ] && connected_monitor=$MONITOR

echo $connected_monitor

for i in $(cat $scripts_path/monitor-configs.json | \
  jq -r --arg monitor $connected_monitor \
  '.[] | select(.name==$monitor) | .config | .[]'); do
  echo $i
  hyprctl keyword monitor ${i}
done

hyprctl dispatch -- exec xprop -root -f _XWAYLAND_GLOBAL_OUTPUT_SCALE 32c -set _XWAYLAND_GLOBAL_OUTPUT_SCALE 2


# # source $dotfiles_path/scripts/custom/monitor.sh $monitor_conf

# # https://wiki.archlinux.org/title/Udev
