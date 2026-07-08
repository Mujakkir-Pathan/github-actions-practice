#!/bin/bash

set -euo pipefail

exit 1

system_info() {
	echo "===== System Information ====="
	hostname
        grep -E '^(NAME|VERSION)=' /etc/os-release
}

uptime_info() {
	echo "===== system uptime ====="
	uptime

}

disk_usage() {
	echo "===== disk Usage ====="
	df -h | head -n 6
         

}

memory_usage() {
        echo "===== Memory Usage ====="
	free -h
         
}

top_processes() {
	echo "===== top processes ====="
        ps aux --sort=-%cpu | head -n 6
}

main() {
	 system_info
	 echo

         uptime_info
	 echo

         disk_usage
	 echo

         memory_usage
	 echo

         top_processes
	 echo
}

main