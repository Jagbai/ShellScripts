#!/bin/bash

# CPU Usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}')
echo "CPU Usage: $CPU_USAGE"

# Memory Usage
USED_MEM=$(free | awk '/Mem:/ {printf("%.1f", $3/$2 * 100)}')
FREE_MEM=$(free | awk '/Mem:/ {printf("%.1f", $4/$2 * 100)}')
# '/Mem:' filters to the line starting with mem
echo "Memory Usage free: $FREE_MEM%"
echo "Memory Usage used: $USED_MEM%"

# disk usage
USED_DISK=$(df | awk '/C:\\/ {print $5 "%"}')
FREE_DISK=$(df | awk '/C:\\/ {print 100%-$5 "%"}')

echo "Disk Usage free: $FREE_DISK%"
echo "Disk Usage used: $USED_DISK%"

#top 5 processes
TOP_PROCESSES_CPU=$(ps -aux --sort=-%cpu | tail -n +2 | head -n 5)
TOP_PROCESSES_MEM=$(ps -aux --sort=-%mem | tail -n +2 | head -n 5)

echo "Top processes for CPU are"
echo "$TOP_PROCESSES_CPU"
echo "Top processes for Memory are"
echo "$TOP_PROCESSES_MEM"