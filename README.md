Backup Script 
-- 

#What it does 
This script will backup a directory (or your entire filesystem) in an incremental, space-efficient way.

the first time it will copy the whole directory on the external server, next it will copy only the differences. 

For every backup, it will create a folder named after the date, for example `20161025-1452` (14:52 of 25/10/2016, dd/MM/yyyy). Next backups will hard link files that have not changed.

This script works even when you are not in your home network!  

# Prerequisites 

Don't forget to configure the server to accept ssh connections from your computer without password! The web is full of articles on how to do this. 

# How to launch?

Create a `start.sh` file, starting from `start-example.sh`:  

```
$ cp start-example.sh start.sh 
$ chmod +x start.sh 
``` 

Open the file `start.sh` and assign the right values to the variables.

For example:

- `SOURCE=~` will backup the home directory for the user  
- `DEST_DIRECTORY=user@server` will log to this server. The backups will be in directory `backup_rsync/backup/...`
- `EXCLUDE_FILE=./exclude.cfg` have a look to this file to see what you want to exclude 
- `SSH_COMMAND='ssh -p 1234 user@server'` this is just an example, if you connect to your server in a different way (other port than default, different authentication system, etc) you can use this variable to specify how you connect. In my example I'm saying to ssh to connect on port `1234`.

Once you have set up all these variables:   

```
$ ./start.sh
```