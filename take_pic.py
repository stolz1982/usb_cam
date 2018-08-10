import os 

GDRIVEID="1oc0Ccjtdd8Gd-wHkRuRHgiO294ubcAfd" #freigabe ./Germany/pictures
FILENAME="CURRENT"
os.system('fswebcam -r 320x240 --jpeg 50 --no-banner --quiet --save ./CURRENT.jpg')
#os.system('./gdrive-linux-arm upload --parent $GDRIVEID $FILENAME')
os.system('./gdrive-linux-arm upload --parent 1oc0Ccjtdd8Gd-wHkRuRHgiO294ubcAfd ./CURRENT.jpg')
