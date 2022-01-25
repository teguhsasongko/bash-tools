#!/bin/bash
# Bash Menu Script Monitoring
#Created by Teguh Sasongko

options=(listactivedb
         hadr
         backup
         filesystem
         quit)

#echo "1 List Active Database"
#echo "2 HADR Check"
#echo "3 History Backup"
#echo "4 Filesystem Check"

PS3='Pilih yang mana gan : '

select opt in "${options[@]}"
do
    case $opt in
        "listactivedb")
        clear
            echo "you chose List Active Databases"
            db2 list active databases
            ;;
        "hadr")
            echo "Check HADR"
            read -p "Nama Database :" dbname
            db2top -d $dbname
            ;;
        "backup")
        clear
            echo "Backup History"
            read -p "Nama Database :" dbname
            read -p "Backup Since :" bckhist
            db2 list history backup since $bckhist for $dbname
            read -p "Lokasi Backup :" locbck
            ls -lt $locbck
            ;;
        "filesystem")
        clear
            echo "Check Filesystem"
            read -p "linux or aix :" os
                if [[ $os -eq linux ]]; then
                df -h
                elif [[ $os -eq aix ]]; then
                df -g
                else
                echo "pilih linux atau aix cok"
                fi
        ;;
        "quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
