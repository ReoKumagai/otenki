#!/bin/bash
#------------------------------------
# sub     :: get_himawari8.sh
# purpose :: otenki kaisetsu
#
#                  coded by Toyooka 
#                   @2018.12.12
#------------------------------------

yyyy=2020
yy=`echo ${yyyy} | cut -c 3-4`
mon=01

for day in 12 
do
echo ${yyyy}${mon}${day}
mkdir -p ./himawari8/${yyyy}${mon}${day}

 for h in 00 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23  
 do
#proxychains4  wget -O /work3/daichi/otenki/himawari8/${yyyy}${mon}${day}/${yyyy}${mon}${day}${h}.jpg http://weather.is.kochi-u.ac.jp/sat/gms.fareast/${yyyy}/${mon}/${day}/fe.${yy}${mon}${day}${h}.jpg 
#wget -O /work3/daichi/otenki/himawari8/${yyyy}${mon}${day}/${yyyy}${mon}${day}${h}.jpg http://weather.is.kochi-u.ac.jp/sat/gms.fareast/${yyyy}/${mon}/${day}/fe.${yy}${mon}${day}${h}.jpg 
 wget https://storage.tenki.jp/archive/satellite/${yyyy}/${mon}/${day}/${h}/00/00/japan-near-large.jpg -O /work3/reo0403/weather/himawari8/${yyyy}${mon}${day}/${yyyy}${mon}${day}${h}.jpg 
  sleep 0.1s
 done

cd /work3/reo0403/weather/himawari8/${yyyy}${mon}${day}
convert -loop 0 -delay 50 *.jpg ${yyyy}${mon}${day}.gif

cd ../../
done

exit



