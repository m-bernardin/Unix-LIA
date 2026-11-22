#!/bin/bash 
user=$(whoami)
read -p "enter the url for your new radio station: " url
read -p "enter a name for your new radio station: "  name
exists=false
for file in /opt/Unix-LIA/Radios/*; do
	echo "$file"
	if [ "$(cat ${file})" = "$url" ] ; then
		echo "radio exists"
		exists=true
	fi
done
if [ "$exists" = false ] ; then
	touch  "/opt/Unix-LIA/Radios/${name}.m3u"
	echo "$url" > "/opt/Unix-LIA/Radios/${name}.m3u"
fi
