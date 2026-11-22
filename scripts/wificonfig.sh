#!/bin/bash
CONNECTIONS=$(nmcli c s | awk '{print $1}' | grep -vE 'NAME|lo')
echo What do you want to do?
read COMMAND
case $COMMAND in 
  "connect")
    echo Connections
    echo $CONNECTIONS
    echo Enter a connection name to connect to.
    read CONNECTION_TARGET
    CONNECTION_STATUS=$(nmcli c u $CONNECTION_TARGET)
    if [[ $CONNECTION_STATUS == "*activated*" ]]; then
      echo Successfully connected!
    else
      echo Error connecting... Did you enter the name correctly?
    fi
  ;;
  "add")
    echo Adding...
  ;;
  "delete")
    echo Connections
    echo $CONNECTIONS
    echo Enter connection name to delete
    read DELETION_TARGET 
    DELETE_STATUS=nmcli c del $DELETION_TARGET
    if [ -z "$DELETE_STATUS" ]; then
      echo Error deleting the connection... Did you enter the name correctly?
    else 
      echo Connection successfully deleted!
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
