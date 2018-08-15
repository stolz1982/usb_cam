#!/bin/bash

GDRIVEID="1oc0Ccjtdd8Gd-wHkRuRHgiO294ubcAfd" #freigabe ./Germany/pictures
ARCH=$(arch)
NOW=$(date +"%YYYY%mm%dd-%H%M%S")
FILENAME="CURRENT.jpg"
BRIGHTNESS=20%
GDRIVELOC="/home/administrator/usb_cam/"

if [ "$EUID" -ne 0 ]
  then echo "Please run as root (with sudo)"
  exit
fi


wget -q --spider http://google.com
if [ $? -ne 0 ]; then
echo "No Internet connection!"
exit 0
fi


if [ "$ARCH" = "x86_64" ];  then
	ARCH='x64'
else
	ARCH='arm'
fi

fswebcam -r 1920x1080 --jpeg 50 --no-banner --quiet --save $FILENAME
$GDRIVELOC/gdrive-linux-$ARCH list --query "'$GDRIVEID' in parents" | grep $FILENAME | cut -d " " -f 1 | xargs -n1 $GDRIVELOC/gdrive-linux-$ARCH delete
$GDRIVELOC/gdrive-linux-$ARCH upload --parent $GDRIVEID $FILENAME
  
  
