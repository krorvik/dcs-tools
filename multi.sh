#!/bin/bash
PORTS=$(mode.com | grep "device COM" | tr -d ':' | awk '{print $4}'| tr -d 'COM' | xargs)

for PORT in $PORTS; do
	echo "Starting socat for COM$PORT"
	./serial.cmd $PORT &
	PID=$!
done

wait
