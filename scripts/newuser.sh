#!/bin/bash

echo "Enter the username:"
read name
useradd -m $name
mkdir "/home/$name/Radio"

