#!/bin/bash
#PORTS=$(mode.com | grep "device COM" | tr -d ':' | awk '{print $4}'| tr -d 'COM' | xargs)
PORTS="3 4 5 6 7 8 9 11"

for PORT in $PORTS; do
	echo "Starting socat for COM$PORT"
	./serial.cmd $PORT &
	PID=$!
done

wait
