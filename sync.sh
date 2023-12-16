#!/bin/bash

#____________________CONFIGURE_SCRIPT_____________

#log file path (e.g. /your/path/here )
LOGPATH="/scripts/logs"

#source path (e.g. /your/path/here/ )
SOURCE="/nas/"

#destination path (e.g. /your/path/here )
DEST="/media/"

#remote host and credentials
RMT="YOUR-REMOTE-HOST-HERE"
PRT="YOUR-SSH-PORT-HERE"
USR="YOUR-SSH-USER-HERE"
PWD="YOUR-SSH-PW-HER"

## Rsync options
#-r = recursive
#-t = preserve modification date
#-c = compare checksum (slows down the sync)
#-h = human readable output
#-e = remote shell
#-I = --ignore-times don’t skip files that match size and time (slows down the sync)
#--stats = output a report
#--delete = delete files in destination wich no longer exists in source

#____________________CONFIG_END__________________

if pgrep rsync > /dev/null; then

    echo ""
    echo "Sync is already running"
    echo ""

else

    exec > $LOGPATH/log_sync_script.log 2>&1
    echo ""
    echo -e $(date)
    echo ""
    #do backup
    echo "sync in progress"
    sudo sshpass -p $PWD sudo rsync -v -c -r -t -h --delete -e 'ssh -p '$PRT'' $SOURCE $USR@$RMT:$DEST

fi

