#!/bin/bash
GDRIVEID="1oc0Ccjtdd8Gd-wHkRuRHgiO294ubcAfd" #freigabe ./Germany/pictures
ARCH=$(arch)
NOW=$(date +"%YYYY%mm%dd-%H%M%S")
FILENAME="CURRENT.jpg"

if [ "$ARCH" = "x86_64" ];  then
	ARCH='x64'
else
	ARCH='arm'
fi

fswebcam -r 1920x1080 --set brightness=20% --jpeg 50 --no-banner --quiet --save $FILENAME
./gdrive-linux-$ARCH list --query "'$GDRIVEID' in parents" | grep $FILENAME | cut -d " " -f 1 | xargs -n1 ./gdrive-linux-$ARCH delete
./gdrive-linux-$ARCH upload --parent $GDRIVEID $FILENAME
  
  
