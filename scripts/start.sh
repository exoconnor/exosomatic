#!/bin/bash

# Open a new terminal tab and run a command
tab_command()
{
osascript <<EOF
activate application "Terminal"
tell application "System Events" to keystroke "t" using command down
delay 3
tell application "Terminal"
  do script "$1" in front window
end tell
EOF
}

tab_command "cd /Users/ckwilson/omg/omg_spree && rails s"
tab_command "cd /Users/ckwilson/omg/mana && mix phx.server"
tab_command "cd /Users/ckwilson/omg/admin-tools && nodemon server.js"
tab_command "cd /Users/ckwilson/omg/restocker-app && react-native start"
sleep 3
tab_command "cd /Users/ckwilson/omg/restocker-app && react-native run-ios"
