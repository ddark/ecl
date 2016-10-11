#!/bin/sh
while true ; do
servlog='/home/declipe/Trinitydeclipe27/log/Server.log';
outpatch='/home/declipe/Trinitydeclipe27/log/crash/';
date=`date "+%Y-%m-%d_%H:%M:%S"`;
echo "Server CRASHED !!! Start Bugreport System." >> $outpatch$date.txt;
echo "Server.log Log FILE Last 30 Lines:" >> $outpatch$date.txt;
cat $servlog | tail -n 30 >> $outpatch$date.txt;
echo "" >> $outpatch$date.txt;
echo "END bugtracker system." >> $outpatch$date.txt;
cd /home/declipe/Trinitydeclipe27/bin
gdb -x crashreport.gdb ./worldserver
mv backtrace.log backtrace$date.log
done
