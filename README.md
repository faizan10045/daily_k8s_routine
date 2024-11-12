# daily_k8s_routine
Automated Daily Backup of Kubernetes Clusters

### Description
The project is designed to automate the daily backup of a Kubernetes cluster, encompassing critical data like cluster status, node information, and pod count. By providing comprehensive snapshots of the cluster's health and configuration, it equips users with valuable insights for troubleshooting during change requests (CRs), ticket handling, and various operational scenarios. Initially tailored for the Kubernetes environment, this use-case holds the potential for future expansion into other work areas, enhancing its versatility and utility across different operational domains.

### Installation
1. Clone the repository at ~
```
git clone https://gitlab.internal.com/routine.git
```

2. Run the script to add the task to your crontab:
```
./routine/add_cron_jobs.sh
```

### Usage
The script can be modified to record more information. The crontab by default is set to sleep for 7 days thus creating a 7-day logs. This can be modified by chaging the number of seconds.\
View the output after scheduled cron execution using-
```
cat routine/health.txt
```

### Troubleshooting
If you encounter the below error-
``` error: You must be logged in to the server (Unauthorized) ```
Then do the following-
1. Check if normal k8 commands works. If they dont then the issue is with your kubeconfig file either expired or corrupted (renew/import it from different id)
2. Note down your kubeconfig location by running - 
```
env  
# example- KUBECONFIG=:/home/.kube/yourk8sconf
``` 
3. Add SHELL&KUBECONFIG lines in your crontab as-
```
SHELL=/bin/bash
KUBECONFIG=/path/to/your/kubeconfig
# example- KUBECONFIG=/home/.kube/uyourk8sconf
# At midnight daily
0 0 * * *  ~/routine/main.sh >/dev/null 2>&1                    # for testing purpose run job every min- * * * * * ,& check health.txt file 
# At 1 AM daily
0 1 * * * sleep 604800 && ~/routine/clear.sh >/dev/null 2>&1
``` 
