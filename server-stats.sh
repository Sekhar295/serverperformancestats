#!/bin/bash

echo "===== Total CPU Usage ====="
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Usage: " 100 - $8 "%"}'

echo ""
echo "===== Total Memory Usage ====="
free -m | awk 'NR==2{printf "Total: %s MB\nUsed: %s MB\nFree: %s MB\nUsed Percentage: %.2f%%\n", $2, $3, $4, $3*100/$2}'

echo ""
echo "===== Total Disk Usage ====="
df -h --total | grep 'total' | awk '{print "Total Size: "$2"\nUsed: "$3"\nAvailable: "$4"\nUsed Percentage: "$5}'

echo ""
echo "===== Top 5 Processes by CPU Usage ====="
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

echo ""
echo "===== Top 5 Processes by Memory Usage ====="
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
