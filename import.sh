#!/bin/sh
 
file=$1
cat $file | while read line;
do
echo "${line}"
NAME=`echo ${line} | cut -d\; -f1`
ADDRESS=`echo ${line} | cut -d\; -f2`
IMAGE=`echo ${line} | cut -d\; -f3`
PARENTS=`echo ${line} | cut -d\; -f4`
HOSTGROUPS=`echo ${line} | cut -d\; -f5`
 
cat hosts.template | sed -e "s/TEMP_NAME/$NAME/" -e "s/TEMP_IP/$ADDRESS/" -e \
"s/TEMP_HOSTGROUPS/$HOSTGROUPS/" -e "s/TEMP_IMG/$IMAGE/" -e "s/TEMP_PARENTS/$PARENTS/" >> hosts.cfg

done
