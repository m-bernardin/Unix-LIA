#!/bin/bash
echo What do you want to do?
read COMMAND
case $COMMAND in 
  "connect")
    echo Connecting...
  ;;
  "add")
    echo Adding...
  ;;
  "delete")
    echo Deleting...
  ;;
  "status")
    echo Getting status...
  ;;
  *)
    echo ==== wificonfig HELP page ====
    echo connect -\> Connect to a WiFi network.
    echo add -\> Add new WiFi connection.
    echo delete -\> Delete a WiFi connection.
    echo status -\> Gets current WiFi connection status.
    echo 
esac
