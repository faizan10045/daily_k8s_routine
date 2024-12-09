#!/bin/bash

# Define the cron lines with comments
cron_line1="# At midnight daily"
cron_line2="0 0 * * *  ~/mtp_routine/main.sh >/dev/null 2>&1"

cron_line3="# At 1 AM daily"
cron_line4="0 1 * * * sleep 604800 && ~/mtp_routine/clear.sh >/dev/null 2>&1"

# Add the cron lines to the crontab
(crontab -l 2>/dev/null; echo "$cron_line1"; echo "$cron_line2") | crontab -
(crontab -l 2>/dev/null; echo "$cron_line3"; echo "$cron_line4") | crontab -
