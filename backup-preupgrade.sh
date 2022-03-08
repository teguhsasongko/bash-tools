#!/bin/bash
. /db2/db2inst1/sqllib/db2profile

dateexec=`date +%Y%m%d-%H%M`

echo "Backup Pre Upgrade"
echo "Nama Database : "
read DB

crontab -l > /tmp/beforeUpgrade/cronjob-$DB_$dateexec.out
db2 get dbm cfg > /tmp/beforeUpgrade/dbmcfg-$DB_$dateexec.out
db2 get db cfg for $DB > /tmp/beforeUpgrade/dbcfg-$DB_$dateexec.out
db2set -all > /tmp/beforeUpgrade/db2set-$DB_$dateexec.out
db2 list db directory > /tmp/beforeUpgrade/dbdirectory-$DB_$dateexec.out
env > /tmp/beforeUpgrade/env-$DB_$dateexec.out
db2 connect to $DB
db2 list application > /tmp/beforeUpgrade/listapp-$DB_$dateexec.out
db2level > /tmp/beforeUpgrade/db2level-$DB_$dateexec.out
db2licm -l > /tmp/beforeUpgrade/db2licm-$DB_$dateexec.out
db2ilist > /tmp/beforeUpgrade/ilist-$DB_$dateexec.out
db2 disconnect $DB
