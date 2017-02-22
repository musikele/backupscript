sudo cp com.michelenasti.scripts.backupscript.plist /Library/LaunchDaemons

launchctl load -w /Library/LaunchDaemons/com.michelenasti.scripts.backupscript.plist
launchctl list | grep michelenasti