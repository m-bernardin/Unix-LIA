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
    echo HELLLLLP
esac
