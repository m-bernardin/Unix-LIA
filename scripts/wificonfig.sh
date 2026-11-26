#!/bin/bash
CONNECTIONS=$(nmcli c s | awk '{print $1}' | grep -vE 'NAME|lo')
if [ -z "$1" ]; then
  echo What do you want to do?
  read COMMAND
else 
  COMMAND=$1
fi
case $COMMAND in 
  "connect")
    echo Connections
    echo $CONNECTIONS
    if [ -z "$2" ]; then
      echo Enter a connection name to connect to.
      read CONNECTION_TARGET
    else
      CONNECTION_TARGET=$2
    fi
    CONNECTION_STATUS=$(nmcli c u $CONNECTION_TARGET)
    if [[ $CONNECTION_STATUS == *"activated"* ]]; then
      echo Successfully connected!
    else
      echo Error connecting... Did you enter the name correctly?
    fi
  ;;
  "disconnect")
    ACTIVE_CONNECTION_UUID=$(nmcli c s | grep -vE '\-\-|lo' | awk '{print $2}' | grep -v 'UUID')
    DISCONNECT_STATUS=$(nmcli c down uuid $ACTIVE_CONNECTION_UUID)
    if [[ $DISCONNECT_STATUS == *"deactivated"* ]]; then 
      echo Successfully disconnected!
    else
      echo Error disconnecting... Are you connected to a network?
    fi
  ;;
  "add")
    if [ -z "$2" ]; then
    echo ==== Available connections ====
    nmcli d w l | grep -v "$CONNECTIONS" | grep -vE "\-\-|BSSID" | awk '{print $2,$8}'
      echo Enter a connection name to connect to.
      read CONNECTION_TARGET
    else
      CONNECTION_TARGET=$2
    fi
    nmcli d w c $CONNECTION_TARGET --ask
  ;;
  "delete")
    echo Connections
    echo $CONNECTIONS
    if [ -z "$2" ]; then
      echo Enter connection name to delete
      read DELETION_TARGET 
    else
      DELETION_TARGET=$2
    fi
    DELETE_STATUS=nmcli c del $DELETION_TARGET
    if [ -z "$DELETE_STATUS" ]; then
      echo Error deleting the connection... Did you enter the name correctly?
    else 
      echo Connection successfully deleted!
    fi
  ;;
  "status")
    GENERAL_STATUS=$(nmcli g s | grep -E '[a-z]')
    STATUS_STATE=$(awk '{print $1}' <<< $GENERAL_STATUS)
    STATUS_CONNECTIVITY=$(awk '{print $2}' <<< $GENERAL_STATUS)
    STATUS_WIFIHW=$(awk '{print $3}' <<< $GENERAL_STATUS)
    STATUS_WIFI=$(awk '{print $4}' <<< $GENERAL_STATUS)
    echo ==== Connection Status ====
    echo State: $STATUS_STATE
    echo Connectivity: $STATUS_CONNECTIVITY
    echo WiFi Enabled: $STATUS_WIFI
    echo WiFi Hardware Enabled: $STATUS_WIFIHW
  ;;
  *)
    echo ==== wificonfig HELP page ====
    echo connect -\> Connect to a WiFi network.
    echo disconnect -\> Disconnect from WiFi.
    echo add -\> Add new WiFi connection.
    echo delete -\> Delete a WiFi connection.
    echo status -\> Gets current WiFi connection status.
esac
echo 
