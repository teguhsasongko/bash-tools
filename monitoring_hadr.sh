#!/bin/bash

dateexec=`date +%Y%m%d`


echo "Masukan Nama Database : "
read DB
echo "Refresh Setiap (detik) : "
read jeda

echo 'START TEST - '`date` >> monhadr-$dateexec.out
while true
do 
	echo "------------------------" >> monhadr-$dateexec.out
    	date +"%c" >> monhadr-$dateexec.out
	db2pd -d $DB -hadr | grep HADR_LOG_GAP	>  monhadr-$dateexec.out
	db2pd -d $DB -hadr | grep PRIMARY_LOG_FILE >  monhadr-$dateexec.out
	db2pd -d $DB -hadr | grep STANDBY_LOG_FILE >  monhadr-$dateexec.out
    echo "------------------------" >> monhadr-$dateexec.out
	sleep $jeda

done;
