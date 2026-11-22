#!/bin/bash
CONNECTIONS="Connections\n"nmcli c s | awk '{print $1}' | grep -vE 'NAME|lo'
echo What do you want to do?
read COMMAND
case $COMMAND in 
  "connect")

  ;;
  "add")
    echo Adding...
  ;;
  "delete")
    echo $CONNECTIONS
    echo Enter connection name to delete
    read DELETION_TARGET 
    DELETE_STATUS=nmcli c del $DELETION_TARGET
    if [ -z "$DELETE_STATUS" ]
      echo Error deleting the connection... Did you enter the name correctly?
    else 
      echo Connection successfully deleted.
    fi
      echo 
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
