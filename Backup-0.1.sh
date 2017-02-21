#!/bin/bash
clear 
#This program will try to backup the whole directory to external disk

osascript -e 'display notification "A backup is about to start..." with title "Backup"'

# cancello eventuali log antichi 
rm ./*.log

SOURCE=$1
DEST_DIRECTORY=$2
EXCLUDE_FILE=$3
SSH_SERVER=$4
SSH_USER=$5
SSH_OPTIONS=$6

SSH_REMOTE_SERVER="$5@$4"
SSH="ssh $6 $SSH_REMOTE_SERVER"
SSH_DEST_DIRECTORY=""

#step 1 - check that the external disk is connected
echo "Source Directory: $1"
echo "Destination Directory: $2"
echo "Exclude File: $3"
echo "SSH command: $SSH"

# memorizzo la stringa di connessione a ssh e verifico che sia in funzione  

if ($SSH '[ ! -d $SSH_REMOTE_SERVER ]'); then
    
		echo "Sorry, there is no directory at $SSH_REMOTE_SERVER."
    exit 
fi

DIR="$2/backup"
BACKUPDIR="$SSH_REMOTE_SERVER:$DIR"
echo "BACKUPDIR: $BACKUPDIR"

#step 2 - if the directory exists, check if the "backup" directory exists
if ($SSH '[ ! -d $BACKUPDIR ]'); then 
    echo "$BACKUPDIR directory does not exist. Creating." 
    mkdir $BACKUPDIR
fi

#step 3 - get the latest backup dir 
LATEST=$($SSH 'ls' '-I' '@eaDir' '-r' $DIR '|' 'head' '-n1')
echo "LATEST: $LATEST"

DATE=`date +%Y%m%d-%H%M`
TARGET=$BACKUPDIR/$DATE
echo "TARGET: $TARGET"

EXCLUDE_FILE=$3
echo "EXCLUDE_FILE: $EXCLUDE_FILE"
#take relative path   
COMPLETE_LINK_DEST_DIR="../$LATEST"

echo "linking old $COMPLETE_LINK_DEST_DIR to $TARGET..."

/usr/local/bin/rsync -av --numeric-ids --progress --delete -e "ssh -p 2222" --exclude-from="$EXCLUDE_FILE" --link-dest="$COMPLETE_LINK_DEST_DIR" $1 $TARGET | tee $HOME/Tools/Scripts/BackupScript/backup$DATE.log

echo "Fatto."
exit