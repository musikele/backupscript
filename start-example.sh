SOURCE=~
DEST_DIRECTORY=user@server
EXCLUDE_FILE=./exclude.cfg
SSH_SERVER='server.com'
SSH_USER="admin"
SSH_OPTIONS='ssh user@server'

./Backup-0.1.sh \ 
"$SOURCE" \
"$DEST_DIRECTORY" \
"$EXCLUDE_FILE" \
"$SSH_SERVER" \
"$SSH_USER" \
"$SSH_OPTIONS" 