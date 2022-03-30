#!/bin/bash
DATE=$(date +%Y-%m-%d_%H%M)
wget https://www.dropbox.com/s/vgm2vzkpoz1b244/status.txt
STATUS=$(cat /home/pi/status.txt)
echo $STATUS
python /home/pi/alert.py
cd /home/pi/Stream
raspistill -w 1000 -h 800 --brightness 57 --saturation 35 --contrast 20 -a 12 -o SamCam.jpg

 width=`identify -format %w SamCam.jpg`; \
  convert -background '#0008' -fill white -gravity center -size ${width}x60 \
          caption:"Camera:  $STATUS" \
          SamCam.jpg +swap -gravity south -composite  SamCam.jpg

echo "success"
/home/pi/Dropbox-Uploader/dropbox_uploader.sh upload SamCam.jpg SamCam.jpg

python /home/pi/blinkled.py
echo "finished"
rm /home/pi/status.txt
