#!/bin/sh

# NOTE not working


cp ./run_yabai_on_login.plist ~/Library/LaunchAgents/com.user.loginscript.plist

launchctl unload ~/Library/LaunchAgents/com.user.loginscript.plist
launchctl load ~/Library/LaunchAgents/com.user.loginscript.plist

tail /var/log/system.log
