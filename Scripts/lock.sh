#!/bin/bash

set -e 
xset s off dpms 0 10 0
# i3lock --ignore-empty-password --show-failed-attempts --nofork
i3lock --ignore-empty-password --show-failed-attempts --blur 5 --clock --time-str=%H:%M --indicator --inside-color="#FFFFFF11"
xset s off -dpms 
