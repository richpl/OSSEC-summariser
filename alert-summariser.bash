#!/usr/bin/bash

DIR="/var/ossec/logs/alerts"

for YEAR in `ls "$DIR"`
do
        if [[ -d "$DIR/$YEAR" ]]
        then
                for MONTH in `ls "$DIR/$YEAR"`
                do
                        if [[ -d "$DIR/$YEAR/$MONTH" ]]
                        then
                                sudo zgrep -h -A 1 -B 1 -e "level \(9\|10\|11\|12\|13\|14\|15\)" "$DIR/$YEAR/$MONTH/"*.gz
                        fi
                done
        fi
done
