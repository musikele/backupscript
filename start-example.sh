SOURCE=~
DEST_DIRECTORY=user@server
EXCLUDE_FILE=./exclude.cfg
SSH_COMMAND='ssh user@server'

./Backup-0.1.sh "$SOURCE" "$DEST_DIRECTORY" "$EXCLUDE_FILE" "$SSH_COMMAND"