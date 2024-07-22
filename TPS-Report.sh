#!/bin/sh
clear
grep "Results for qwen:7b" .nosana/flows.json | tail -57
echo Watch Average Tokens per Second
echo "TPS Report auto updates every 60 seconds. Last Update:  $(date +"%a %d%b%g %H:%M:%S")"
read -t 60 -p "Press a key for instant update or Press ctrl-c to cancel."
./TPS-Report.sh
