#!/bin/sh
clear
grep "Results for llama" .nosana/flows.json | tail -16
echo Watch Average Tokens per Second
echo "TPS Report auto updates every 7 seconds. Last Update:  $(date +"%a %d%b%g %H:%M:%S")"
sleep 7
./TPS-Report.sh
