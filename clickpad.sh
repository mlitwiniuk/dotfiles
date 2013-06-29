#!/bin/bash 
##############################################################
# This script disables tapping/scrolling while typing and
# # enables touchpads clicking area (left, middle, right click) 
# ##############################################################
gsettings set org.gnome.settings-daemon.peripherals.touchpad disable-while-typing false  
xinput set-prop "ETPS/2 Elantech Touchpad" "Synaptics ClickPad" 1 
xinput set-prop "ETPS/2 Elantech Touchpad" "Synaptics Soft Button Areas" 1956 0 1737 0 1304 1955 1737 0 
syndaemon -i 1.7 -d -t -K 