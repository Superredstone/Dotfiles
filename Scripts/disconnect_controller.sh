#!/bin/bash

notify-send "Disconnecting controller"
bluetoothctl disconnect DC:0C:2D:E2:AC:94 
notify-send "Controller disconnected"
