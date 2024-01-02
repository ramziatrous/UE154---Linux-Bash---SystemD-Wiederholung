#!/bin/bash

DEFAULT_HOST="8.8"
FALLBACK_HOST="google.com"
LATENCY_FILE="/tmp/latency_data.txt"

measure_latency() {
    local host=$1
    local latency=$(ping -c 3 $host 2>&1 | awk -F '/' '/^rtt/ {print $5}')
    echo $latency
}

write_latency_to_file() {
    local host=$1
    local latency=$(measure_latency $host)

    if [ -n "$latency" ]; then
        echo $latency > $LATENCY_FILE
    else
        echo "Fehler bei der Latenzmessung für $host. Fallback auf $FALLBACK_HOST."
        local fallback_latency=$(measure_latency $FALLBACK_HOST)
        if [ -n "$fallback_latency" ]; then
            echo $fallback_latency > $LATENCY_FILE
        else
            echo "Fehler bei der Latenzmessung für den Fallback-Host $FALLBACK_HOST."
        fi
    fi
}

main() {
    write_latency_to_file $DEFAULT_HOST
}
main