Backup Script 
-- 

#What it does 
This script will backup a directory (or your entire filesystem) in an incremental, space-efficient way. I use this script to backup my user directory,
usually this is what you need.

the first time it will copy the whole directory on the external server, then it will copy only changed files. 

For every backup, it will create a folder named after the date, for example `20161025-1452` (14:52 of 25/10/2016, dd/MM/yyyy). Next backups will hard link files that have not changed.

This script works even when you are not in your home network!  

# Prerequisites 

Don't forget to configure the server to accept ssh connections from your computer without password! The web is full of articles on how to do this, [here's one](http://www.linuxproblem.org/art_9.html). 

# How to launch?

Create a `start.sh` file, starting from `start-example.sh`:  

```
$ cp start-example.sh start.sh 
$ chmod +x start.sh 
```

Open the file `start.sh` and assign the right values to the variables.

Let's describe these variables with an example value 

| Name | Example | Description | 
| ---- | ------- | ----------- | 
| `SOURCE` | `SOURCE=~` | will backup the home directory for the user. 
| `DEST_DIRECTORY` | `DEST_DIRECTORY=personal_backup` | It is the directory where all the backups will be created. It will actually create another `backup` directory inside, so the actual backup directory will be `personal_backup/backup/...` 
| `EXCLUDE_FILE` | `EXCLUDE_FILE=./exclude.cfg` | have a look to this file if you want to exclude something |
| `SSH_SERVER` | `SSH_SERVER='server.com'` | your server address
| `SSH_USER` | `SSH_USER="admin"` | a user that can log on the server. 
| `SSH_OPTIONS` | `SSH_OPTIONS="-p 2222` | if you have any options to log in on your server, for example by using a different port or wathever you pass to the ssh command, you can specify it here. 

Once you have set up all these variables:   

```
$ ./start.sh
```