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
#  Apply iPad resolution
###########################################

clear
source /home/$USER/dotfiles/scripts/custom/init.sh

placeholder="{{monitor}}"
ipadConfigFile="$installFolder/conf/monitors/ipad.conf"
currentMonitor=$(wayvncctl output-list | grep -o -P '(?<=\* ).*(?=:)')

if [[ "$1" == "on"  ]] && [ ! -z $currentMonitor ]; then
  sed -i -e "s/$placeholder/$currentMonitor/" "$ipadConfigFile"
  source /home/$USER/dotfiles/scripts/custom/monitor.sh "ipad"
else
  sed -i -e "s/$currentMonitor/$placeholder/" "$ipadConfigFile"
  source /home/$USER/dotfiles/scripts/custom/monitor.sh "$currentMonitor"
fi
