# bash_sync_ssh
A simple bash script for syncing files over ssh 
 
## Description
I suggest doing a cronjob for this script, or you can run it manually.

The following can be defined in the script:
- log file path
- source folder
- destination folder
- remote host
- ssh user and password
- ssh port

The log file is overwritten with each run.

## Usage
Create a cron job using ```crontab -e```
Example:
```0 4 1 * * bash /scripts/sync.sh ```
