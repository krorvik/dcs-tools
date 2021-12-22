#!/bin/bash

# Need to make sure this is right
TARGET="/cygdrive/d/DCS World/Mods/aircraft/F-16C/Cockpit/Scripts/EWS/RWR/indicator/RWR_ALR56_init.lua"

DATA1='dofile(LockOn_Options.common_script_path.."ViewportHandling.lua")'
DATA2='try_find_assigned_viewport("F16_RWR")'

grep -q "try_find_assigned_viewport" "$TARGET" || echo "$DATA1" >> $TARGET
grep -q "F16_RWR" "$TARGET" || echo $DATA2 >> "$TARGET"


PORTS=$(mode.com | grep "device COM" | tr -d ':' | awk '{print $4}'| tr -d 'COM' | xargs)

for PORT in $PORTS; do
	echo "Starting socat for COM$PORT"
	./serial.cmd $PORT &
	PID=$!
done

wait
