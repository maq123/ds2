#!/bin/bash 

DST=$1

if [ -z "$DST" ];then echo "Usage : $0 <ip>";exit;fi

CMD="./ds2xdriver.exe --config_file=./DriverConfig.txt --target=$DST"
echo $CMD
$CMD
