cp com.michelenasti.scripts.backupscript.plist ~/Library/LaunchAgents

launchctl load -w ~/Library/LaunchAgents/com.michelenasti.scripts.backupscript.plist
launchctl list | grep michelenasti