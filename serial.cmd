@echo off
set VERBOSE=-v
set MODE_OUTPUT_REDIR=
set COMPORT=%~1
set /A TTYNUM=%COMPORT%-1
echo Connecting to COM port %COMPORT%

mode COM%COMPORT% BAUD=250000 PARITY=N DATA=8 STOP=1 TO=off DTR=off %MODE_OUTPUT_REDIR%

socat\socat %VERBOSE% UDP4-RECV:5010,ip-add-membership=239.255.50.10:0.0.0.0,reuseaddr!!udp-sendto:localhost:7778 /dev/ttyS%TTYNUM%
