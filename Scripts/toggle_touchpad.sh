#!/bin/bash

touchpad_id=$(xinput | grep "Touchpad" | awk '{print $6}' | awk 'BEGIN {FS="=";}{print $2}')
touchpad_status=$(xinput --list-props $touchpad_id | grep "Device Enabled" | awk '{print $4}')

if [ $touchpad_status = "1" ]; then
	xinput --disable $touchpad_id
	notify-send "Touchpad disabled" 
else 
	xinput --enable $touchpad_id
	notify-send "Touchpad enabled"
fi

