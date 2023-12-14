#!/bin/bash
exec > /scripts/logs/log_sync_script.log 2>&1

#____________________CONFIGURE_SCRIPT_____________

#source path (e.g. /your/path/here/ )  -> copies content of folder "here"
SOURCE="/nas/"

#destination path (e.g. /your/path/here ) -> copies to folder "here"
DEST="/media/"

#remote host and credentials
RMT="YOUR-REMOTE-HOST-HERE"
PRT="YOUR-SSH-PORT-HERE"
USR="YOUR-SSH-USER-HERE"
PWD="YOUR-SSH-PW-HER"

## Rsync options
#-r = recursive
#-t = preserve modification date
#-c = compare checksum
#-h = human readable output
#-e = remote shell
#--stats = output a report
#--delete = delete files in destination wich no longer exists in source

#____________________CONFIG_END__________________

if pgrep rsync > /dev/null; then

    echo ""
    echo "Sync is already running"
    echo ""

else

    echo ""
    echo -e $(date)
    echo ""
    #do backup
    echo "sync in progress"
    sudo sshpass -p $PWD sudo rsync -v -c -r -t -h --delete -e 'ssh -p '$PRT'' $SOURCE $USR@$RMT:$DEST

fi

