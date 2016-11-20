SOURCE=~
DEST_DIRECTORY=backup_user
EXCLUDE_FILE=./exclude.cfg
SSH_SERVER='your.server.com'
SSH_USER="user"
SSH_OPTIONS='-p 1234'

./Backup-0.1.sh \ 
"$SOURCE" \
"$DEST_DIRECTORY" \
"$EXCLUDE_FILE" \
"$SSH_SERVER" \
"$SSH_USER" \
"$SSH_OPTIONS" 