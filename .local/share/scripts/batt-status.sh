#!/bin/bash
   while true
    do
       export DISPLAY=:0.0
       battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
       if exec acpi --ac-adapter | grep on-line; then
           if [ $battery_level -ge 90 ]; then
              notify-send "Battery Full" "Level: ${battery_level}% "
              paplay /usr/share/sounds/freedesktop/stereo/dialog-warning.oga
           fi
       else
           if [ $battery_level -le 45 ]; then
              notify-send --urgency=CRITICAL "Battery Low" "Level: ${battery_level}%"
             paplay /usr/share/sounds/freedesktop/stereo/dialog-warning.oga 
           fi
       fi
     sleep 60
done
