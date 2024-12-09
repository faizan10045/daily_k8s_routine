#!/bin/bash
export PATH=/usr/local/bin:/usr/bin:/bin

call() {
	echo -e "$(for i in $(seq 1 80); do printf "="; done)"
	
	# Record date
	echo -e "Date & Time:"
        date

	# Fetch node information
        echo -e "\nNodes:"
        kubectl get no
	
	# Return the count of pods that are failing
	echo -e "\nStatus Count:"
        kubectl get pods -A -o wide | grep -E -v '([0-9]+)/\1|Completed' |awk '{print $1, $2, $3, $4, $6, $7, $8}'|column -t | wc -l
	
	# Capture current pod status with details 
	echo -e "\nKubestatus:"
        kubectl get pods -A -o wide | grep -E -v '([0-9]+)/\1|Completed' |awk '{print $1, $2, $3, $4, $6, $7, $8}'|column -t
		
	echo -e "$(for j in $(seq 1 80); do printf "-"; done)"
}
# Store results in destination
call 2>&1 | tee -a ~/routine/health.txt
