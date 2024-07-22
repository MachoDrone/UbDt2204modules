#!/bin/sh
clear
grep "Results for qwen:7b" .nosana/flows.json
date +"%a %d%b%g %H:%M:%S"
echo "TPS Report auto updates every 60 seconds. Last Update:  $(date +"%a %d%b%g %H:%M:%S")"
read -t 60 -p "Press a key for instant update or Press ctrl-c to cancel."
./TPS-Report.sh
