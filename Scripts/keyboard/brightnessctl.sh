#!/bin/bash

brightness_file=/home/r3ddy/Scripts/keyboard/brightness
brightness=$(cat $brightness_file)
verb=$1

function set_b() {
	b=$1 

	rogauracore brightness $b

	echo "$b" > $brightness_file
}

if [ $verb = "up" ] && [ $brightness -lt 3 ]; then 
	set_b $(($brightness + 1))
elif [ $verb = "down" ] && [ $brightness -gt 0 ]; then 
	set_b $(($brightness - 1))
elif [ "$verb" = "set" ]; then
	if [ $2 -gt 3 ] || [ $2 -lt 0 ]; then 
		echo "Invalid brightness level"
		exit 1
	fi

	set_b $2 
	exit
fi

