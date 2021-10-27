#!/bin/bash

WINPIDS=$(ps -W | grep socat | awk '{print $4}' | xargs) 

for PS in $WINPIDS; do
	taskkill.exe /F /PID $PS /T
done
