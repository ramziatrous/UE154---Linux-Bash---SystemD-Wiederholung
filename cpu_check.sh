#!/bin/bash

CPU_FILE="/tmp/cpu_data.txt"

measure_cpu() {
    local cpu_usage=$(mpstat | grep -A 5 "%idle" | tail -n 1 | awk -F " " '{print 100 -  $ 12}'a)
    echo $cpu_usage
}

write_cpu_to_file() {
    local cpu_usage=$(measure_cpu)
    echo $cpu_usage > $CPU_FILE
}

main() {
    write_cpu_to_file
}

main